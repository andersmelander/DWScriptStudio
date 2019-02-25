unit amProgressForm;

(*
 * Copyright © 2012 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ComCtrls,
  ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, cxLabel,
  Diagnostics;

//------------------------------------------------------------------------------
//
//      TProgressForm
//
//------------------------------------------------------------------------------
type
  TCustomProgressForm = class(TForm)
    TimerDefer: TTimer;
    PanelAbort: TPanel;
    ButtonAbort: TButton;
    PanelProgress: TPanel;
    LabelMessage: TcxLabel;
    ProgressBar: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure TimerDeferTimer(Sender: TObject);
    procedure ButtonAbortClick(Sender: TObject);

  strict private
    FResult: boolean;
    FResultText: string;
    FAborted: boolean;

  strict protected
    FLastIdle: TStopwatch;
    FPopupParent: TCustomForm;
    FPopupParentHandle: HWND;

  strict protected
    procedure ReportError(const Text: string);

    procedure DeferredShow; virtual;
    procedure SuspendAbort; virtual;
  protected
    procedure UpdateActions; override;
  public
    class function PumpTimerMessages: boolean; deprecated;

    property Result: boolean read FResult;
    property ResultText: string read FResultText;
    property Aborted: boolean read FAborted write FAborted;
  end;

//------------------------------------------------------------------------------
//
//      IProgress
//
//------------------------------------------------------------------------------
type
  TProgressStage = (psBegin, psProgress, psEnd);

  IProgress = interface
    ['{2D83C35C-72CF-4894-884D-FB1A776F136A}']
    procedure Progress(Stage: TProgressStage; CurrentProgress, MaxProgress: integer; const Msg: string; ProgressContext: pointer = nil); overload;
    procedure Progress(Stage: TProgressStage; CurrentProgress, MaxProgress: integer; ProgressContext: pointer = nil); overload;
    procedure AdvanceProgress(DeltaProgress: integer = 1; ProgressContext: pointer = nil);
    procedure UpdateMessage(const Msg: string);
    procedure Show;
    procedure Hide;
    procedure ProcessMessages;

    procedure AbortProgress;
    function GetEnableAbort: boolean;
    procedure SetEnableAbort(Value: boolean);
    property EnableAbort: boolean read GetEnableAbort write SetEnableAbort;
    procedure SuspendAbort;
    procedure ResumeAbort;
    function GetRaiseOnAbort: boolean;
    procedure SetRaiseOnAbort(Value: boolean);
    property RaiseOnAbort: boolean read GetRaiseOnAbort write SetRaiseOnAbort;
    function GetAborted: boolean;
    property Aborted: boolean read GetAborted;
    function GetMarquee: boolean;
    procedure SetMarquee(Value: boolean);
    property Marquee: boolean read GetMarquee write SetMarquee;
    function GetEnabled: boolean;
    procedure SetEnabled(Value: boolean);
    property Enabled: boolean read GetEnabled write SetEnabled; // Enabled=False prevents progress from being displayed
  end;

//------------------------------------------------------------------------------
//
//      ShowProgress()
//
//------------------------------------------------------------------------------
type
  TProgressFactory = function(const Title: string = ''; Defer: boolean = True): IProgress;

function ShowProgress(const Title: string = ''; Defer: boolean = True): IProgress; overload;
// Same as above but will always use the real progress form (i.e. never the splash progress).
// For use in Script
function ForceShowProgress(const Title: string = ''; Defer: boolean = True): IProgress; overload;


//------------------------------------------------------------------------------
//
//      Progress redirection
//
//------------------------------------------------------------------------------
function RegisterProgressHandler(const Factory: TProgressFactory): TProgressFactory;
function UnregisterProgressHandler(const Factory: TProgressFactory): TProgressFactory;


//------------------------------------------------------------------------------
//
//      TProgressStream
//
//------------------------------------------------------------------------------
type
  TProgressStream = class(TStream)
  private
    FStream: TStream;
    FProgress: IProgress;
    FMaxProgress: Int64;
    FLastProgress: int64;
  protected
    procedure UpdateProgress;
  public
    constructor Create(Stream: TStream; const Progress: IProgress); reintroduce; overload;
    constructor Create(Stream: TStream; const Progress: IProgress; AMaxProgress: Int64); reintroduce; overload;
    function Read(var Buffer; Count: Longint): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override;
    function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; overload; override;
  end;


//------------------------------------------------------------------------------
//
//      Anti-freeze
//
//------------------------------------------------------------------------------
procedure IndicateApplicationNotFrozen;

// -----------------------------------------------------------------------------
var
  ProgressDeferTime: integer = 500; // mS
  ProgressUpdateFactor: integer = 1;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------


implementation

uses
  Math,
  Generics.Collections,
{$ifdef MADEXCEPT}
  MadExcept,
{$endif MADEXCEPT}
  dxMessages,
  TimeSpan;

{$R *.DFM}

//------------------------------------------------------------------------------
//
//      Anti-freeze
//
//------------------------------------------------------------------------------
procedure IndicateApplicationNotFrozen;
begin
{$ifdef MADEXCEPT}
  // Indicate to MadExcept freeze detection that we're not frozen
  MadExcept.ImNotFrozen;
{$endif MADEXCEPT}
end;

//------------------------------------------------------------------------------
//
//      TProgressStream
//
//------------------------------------------------------------------------------
constructor TProgressStream.Create(Stream: TStream; const Progress: IProgress);
begin
  Create(Stream, Progress, Stream.Size);
end;

constructor TProgressStream.Create(Stream: TStream; const Progress: IProgress; AMaxProgress: Int64);
begin
  inherited Create;
  FStream := Stream;
  FProgress := Progress;
  FMaxProgress := AMaxProgress;
  FLastProgress := 0;
end;

function TProgressStream.Read(var Buffer; Count: Longint): Longint;
begin
  UpdateProgress;
  Result := FStream.Read(Buffer, Count);
  UpdateProgress;
end;

function TProgressStream.Write(const Buffer; Count: Longint): Longint;
begin
  UpdateProgress;
  Result := FStream.Write(Buffer, Count);
  UpdateProgress;
end;

function TProgressStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
begin
  Result := FStream.Seek(Offset, Origin);
  UpdateProgress;
end;

procedure TProgressStream.UpdateProgress;
var
  CurrentPosition: Int64;
begin
  CurrentPosition := FStream.Position;
  if (CurrentPosition = FLastProgress) then //or (FMaxProgress div 100 > Abs(CurrentPosition-FLastProgress)) then
    exit;

  FLastProgress := CurrentPosition;
  if (FLastProgress < FMaxProgress) then
    FProgress.Progress(psProgress, FLastProgress, FMaxProgress)
  else
    FProgress.Progress(psEnd, FLastProgress, FMaxProgress);
end;

//------------------------------------------------------------------------------
//
//      TProgressForm
//
//------------------------------------------------------------------------------
// Implements IProgress
//------------------------------------------------------------------------------
const
  UpdateRate = 100; // mS
  MessagePumpRate = 50; // mS

type
  TProgressForm = class(TCustomProgressForm, IUnknown, IProgress)
  strict private
    FRefCount: integer;
    FDefer: boolean;
    FRaiseOnAbort: boolean;
    FLastUpdate: TStopwatch;
    FLastMessagePump: TStopwatch;
    FNeedUpdate: boolean;
    FForceUpdate: boolean;
    FUpdateCount: integer;
    FEnabled: boolean;
    FQueued: TStopwatch;
  strict private
    // Cached state
    FStage: TProgressStage;
    FCurrentProgress, FMaxProgress: integer;
    FCurrentPosition, FCurrentMax: integer;
    FMessage: string;
    FAbortSuspendCount: integer;
  strict private
    class var FStack: TList<TProgressForm>;
  strict protected
    // IUnknown
    function QueryInterface(const IID: TGUID; out Obj): HResult; override; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;

    procedure ApplyProgressUpdate;
    procedure ProcessMessages(Force: boolean); overload;
    procedure DoUpdateMessage(const Msg: string);

    // IProgress
    procedure Progress(Stage: TProgressStage; CurrentProgress, MaxProgress: integer; const Msg: string; ProgressContext: pointer = nil); overload;
    procedure Progress(Stage: TProgressStage; CurrentProgress, MaxProgress: integer; ProgressContext: pointer = nil); overload;
    procedure AdvanceProgress(DeltaProgress: integer = 1; ProgressContext: pointer = nil);
    procedure UpdateMessage(const Msg: string);
    procedure Show;
    procedure IProgress.Hide = HideProgress;
    procedure ProcessMessages; overload;
    procedure AbortProgress;
    function GetEnableAbort: boolean;
    procedure SetEnableAbort(Value: boolean);
    property EnableAbort: boolean read GetEnableAbort write SetEnableAbort;
    procedure SuspendAbort; override;
    procedure ResumeAbort;
    function GetAborted: boolean;
    property Aborted: boolean read GetAborted;
    function GetRaiseOnAbort: boolean;
    procedure SetRaiseOnAbort(Value: boolean);
    property RaiseOnAbort: boolean read GetRaiseOnAbort write SetRaiseOnAbort;
    function GetMarquee: boolean;
    procedure SetMarquee(Value: boolean);
    property Marquee: boolean read GetMarquee write SetMarquee;
    function GetEnabled: boolean; reintroduce;
    procedure SetEnabled(Value: boolean); reintroduce;
    property Enabled: boolean read GetEnabled write SetEnabled;

    procedure DeferredShow; override;
    function CheckDefer: boolean;

    procedure ShowProgress;
    procedure HideProgress;
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure Updated; reintroduce;
    function CanUpdate: boolean;
    procedure RequestUpdate(Force: boolean = False);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    class procedure Finalize;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Defer: boolean read FDefer write FDefer;
  end;

// -----------------------------------------------------------------------------

constructor TProgressForm.Create(AOwner: TComponent);
begin
  FRefCount := 1;
  inherited;

  FLastUpdate := TStopwatch.StartNew;
  FLastMessagePump := TStopwatch.StartNew;

  FMessage := LabelMessage.Caption;

  if (FStack = nil) then
    FStack := TList<TProgressForm>.Create;

  FEnabled := True;
  Dec(FRefCount);
end;

procedure TProgressForm.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.ExStyle := Params.ExStyle or WS_EX_NOACTIVATE;
end;

// -----------------------------------------------------------------------------

procedure TProgressForm.DeferredShow;
begin
  FStack.Remove(Self);
  if (FStack.Count > 0) then
    FStack.Last.Hide;
  FStack.Add(Self);

  ApplyProgressUpdate;

  inherited;

  Updated;
end;

// -----------------------------------------------------------------------------

destructor TProgressForm.Destroy;
begin
  HideProgress;
  inherited;
end;

// -----------------------------------------------------------------------------

procedure TProgressForm.EndUpdate;
begin
  dec(FUpdateCount);

  if (FUpdateCount = 0) then
  begin
    if (CheckDefer) then
      DeferredShow;

    // Don't call ProcessMessages as it itself calls EndUpdate...
    // ProcessMessages;

    if (FForceUpdate) or ((FNeedUpdate) and (CanUpdate)) then
    begin
      ApplyProgressUpdate;
      Update;
      Updated;
    end;
  end;
end;

// -----------------------------------------------------------------------------

class procedure TProgressForm.Finalize;
begin
  FreeAndNil(FStack);
end;

// -----------------------------------------------------------------------------

function TProgressForm.GetAborted: boolean;
begin
  Result := inherited Aborted;
end;

// -----------------------------------------------------------------------------

function TProgressForm.GetEnableAbort: boolean;
begin
  Result := PanelAbort.Visible;
end;

// -----------------------------------------------------------------------------

function TProgressForm.GetEnabled: boolean;
begin
  Result := FEnabled;
end;

// -----------------------------------------------------------------------------

function TProgressForm.GetMarquee: boolean;
begin
  Result := (ProgressBar.Style = pbstMarquee);
end;

// -----------------------------------------------------------------------------

function TProgressForm.GetRaiseOnAbort: boolean;
begin
  Result := FRaiseOnAbort;
end;

// -----------------------------------------------------------------------------

procedure TProgressForm.HideProgress;
begin
  FDefer := False;
  TimerDefer.Enabled := False;
  Hide;

  if (FStack.Count > 0) and (FStack.Last = Self) then
  begin
    FStack.Remove(Self);
    if (FStack.Count > 0) then
      FStack.Last.Show;
  end else
    FStack.Remove(Self);
end;

// -----------------------------------------------------------------------------

procedure TProgressForm.RequestUpdate(Force: boolean);
begin
  BeginUpdate;
  FNeedUpdate := True;
  if (Force) then
    FForceUpdate := True;
  EndUpdate;
end;

// -----------------------------------------------------------------------------

procedure TProgressForm.ResumeAbort;
begin
  Dec(FAbortSuspendCount);
  if (FAbortSuspendCount = 0) then
  begin
    ButtonAbort.Enabled := ((FStage = psProgress) or (Marquee)) and (not Aborted);
    ButtonAbort.Update;
  end;
end;

// -----------------------------------------------------------------------------

function TProgressForm.CanUpdate: boolean;
begin
  Result := (FLastUpdate.ElapsedMilliseconds >= UpdateRate * ProgressUpdateFactor);
end;

// -----------------------------------------------------------------------------

function TProgressForm.CheckDefer: boolean;
begin
  Result := False;

  if (not FDefer) or (not FQueued.IsRunning) or (FQueued.ElapsedMilliseconds < ProgressDeferTime) then
    exit;

  if (Screen.ActiveForm <> nil) and (Screen.ActiveForm <> FPopupParent) and (fsModal in Screen.ActiveForm.FormState) then
  begin
    // Defer display of progress dialog if a different form, than the one that
    // were active when progress were started, has become active and is modal.
    // We are aiming to avoid the following scenario:
    // 1. Form A displays progress dialog deferred.
    // 2. Form B displays modal prompt dialog.
    // 3. Defer timer expires and causes progress dialog to display on top of
    //    modal prompt dialog.
    // 4. User waits forever because she doesn't notice the prompt under the
    //    progress dialog and the progress dialog doesn't advance because progress
    //    has been blocked by the prompt.

    // If UpdateActions has not been called, then Application.Idle has not run
    // and we assume that the modal form is busy and is the one that invoked us.
    // Require at least 1000mS of non-idleness before we display
    if (FLastIdle.IsRunning) and (FLastIdle.ElapsedMilliseconds < ProgressDeferTime * 2) then
      exit;
  end;

  // If task is still running after a while we display the progress form.
  // This minimizes the "visual flash" that happens when the progress form is
  // displayed and then immediately hidden,  as is the case for most tasks.
//  if (Screen.ActiveForm = nil) or (not(fsModal in Screen.ActiveForm.FormState)) and
//  if ((PopupParent <> nil) and (IsWindowEnabled(PopupParent.Handle))) or (IsWindowEnabled(Application.MainForm.Handle)) then

    DeferredShow;

  FDefer := False;
  FQueued.Stop;

  Result := True;
end;

// -----------------------------------------------------------------------------

procedure TProgressForm.Progress(Stage: TProgressStage;
  CurrentProgress, MaxProgress: integer; const Msg: string;
  ProgressContext: pointer);
begin
  BeginUpdate;
  try
    DoUpdateMessage(Msg);
    Progress(Stage, CurrentProgress, MaxProgress, ProgressContext);
  finally
    EndUpdate;
  end;
end;

// -----------------------------------------------------------------------------

procedure TProgressForm.ProcessMessages;
begin
  ProcessMessages(False);
end;

procedure TProgressForm.ProcessMessages(Force: boolean);
var
  Msg: TMsg;
begin
  if (not Force) and (FLastMessagePump.ElapsedMilliseconds < MessagePumpRate * ProgressUpdateFactor) then
    exit;

  FLastMessagePump.Reset;

  // Indicate to MadExcept freeze detection that we're not frozen
  IndicateApplicationNotFrozen;

  BeginUpdate;
  try
    // Allow threads to synchronize to avoid deadlock (e.g. busy loop showing progress waiting for thread to complete (e.g. spell check dictionary load)).
    CheckSynchronize;

    Msg.message := 0;
    try
      // Process mouse messages for this window so user can press Stop button
      while (PeekMessage(Msg, Handle, WM_MOUSEFIRST, WM_MOUSELAST, PM_REMOVE)) do
      begin
        if (Msg.message = WM_QUIT) then
          exit;

        TranslateMessage(Msg);
        DispatchMessage(Msg);
      end;

      // Process mouse hover/enter/exit messages for this window so button state will be updated
      while (PeekMessage(Msg, Handle, WM_NCMOUSEHOVER, WM_MOUSELEAVE, PM_REMOVE)) do
      begin
        if (Msg.message = WM_QUIT) then
          exit;

        TranslateMessage(Msg);
        DispatchMessage(Msg);
      end;

      // Process cursor update messages for this window so cursor stays responsive
      while (PeekMessage(Msg, Handle, WM_SETCURSOR, WM_SETCURSOR, PM_REMOVE)) do
      begin
        if (Msg.message = WM_QUIT) then
          exit;

        DispatchMessage(Msg);
      end;

      // Process NC mouse messages for this window so we can move the window
      // Supposedly WM_NCMOUSEMOVE causes the WM_NCHITTEST message
      while (PeekMessage(Msg, Handle, WM_NCMOUSEMOVE, WM_NCXBUTTONDBLCLK, PM_REMOVE)) do
      begin
        if (Msg.message = WM_QUIT) then
          exit;

        DispatchMessage(Msg);
      end;

      // Process NC hit test messages for this window so we can move the window
      while (PeekMessage(Msg, Handle, WM_NCHITTEST, WM_NCHITTEST, PM_REMOVE)) do
      begin
        if (Msg.message = WM_QUIT) then
          exit;

        DispatchMessage(Msg);
      end;

      // Process progress bar messages - This includes WM_TIMER and WM_PAINT used for progress bar animation
      while PeekMessage(Msg, ProgressBar.Handle, 0, 0, PM_REMOVE) do
      begin
        if (Msg.message = WM_QUIT) then
          exit;

        DispatchMessage(Msg);
      end;

      // Process paint messages for all windows so UI can repaint itself
      while PeekMessage(Msg, 0, WM_PAINT, WM_PAINT, PM_REMOVE) or
        PeekMessage(Msg, 0, WM_ERASEBKGND, WM_ERASEBKGND, PM_REMOVE) or
        PeekMessage(Msg, Handle, DXM_SKINS_POSTREDRAW, DXM_SKINS_POSTREDRAW, PM_REMOVE) or
//        PeekMessage(Msg, 0, WM_SIZE, WM_SIZE, PM_REMOVE) or
//        PeekMessage(Msg, 0, WM_MOVE, WM_MOVE, PM_REMOVE) or
//        PeekMessage(Msg, 0, WM_WINDOWPOSCHANGED, WM_WINDOWPOSCHANGED, PM_REMOVE) or
//        PeekMessage(Msg, 0, WM_WINDOWPOSCHANGING, WM_WINDOWPOSCHANGING, PM_REMOVE) or
        PeekMessage(Msg, 0, WM_PRINT, WM_PRINT, PM_REMOVE) or
        PeekMessage(Msg, 0, WM_PRINTCLIENT, WM_PRINTCLIENT, PM_REMOVE) do
      begin
        if (Msg.message = WM_QUIT) then
          exit;

        DispatchMessage(Msg);
      end;

      PeekMessage(Msg, 0, WM_NULL, WM_NULL, PM_NOREMOVE); // Avoid window ghosting due to unresponsiveness on Vista+

    finally
      if (Msg.message = WM_QUIT) then
      begin
        PostQuitMessage(Msg.wParam);
        AbortProgress;
      end;
    end;
  finally
    FLastMessagePump.Start;
    EndUpdate;
  end;

  if (Aborted) and (FRaiseOnAbort) then
  begin
    FRaiseOnAbort := False;
    Abort;
  end;
end;

// -----------------------------------------------------------------------------

procedure TProgressForm.Progress(Stage: TProgressStage; CurrentProgress, MaxProgress: integer; ProgressContext: pointer);
begin
  BeginUpdate;
  try
    FStage := Stage;
    FCurrentProgress := CurrentProgress;
    FMaxProgress := MaxProgress;

(*
    if (not Marquee) then
    begin
      if (ProgressBar.Max <> MaxProgress) then
        ProgressBar.Max := MaxProgress;

      if (ProgressBar.Position <> CurrentProgress) then
      begin
        // Work around for Aero progress bar animation causing the progress bar to
        // lag behind
        if (CurrentProgress >= MaxProgress) then
        begin
          ProgressBar.Max := MaxProgress+1;
          ProgressBar.Position := MaxProgress+1;
          // Setting max lower that progress also causes progress to to decrease
          // and thus causes instant update.
          ProgressBar.Max := MaxProgress;
        end else
        if (Stage = psEnd) then
        begin
          // If Stage=psEnd we need the progress to update immediately as we will
          // probably close the progress bar right after.

          // Decrementing position causes instant update
          ProgressBar.Position := CurrentProgress+1;
          ProgressBar.Position := CurrentProgress;
        end else
          // Normal smooth animated update
          ProgressBar.Position := CurrentProgress;
      end;
    end else
      ProgressBar.StepIt;
*)
    RequestUpdate(Stage in [psBegin, psEnd]);

(*
    ImageRun.Visible := True; // To avoid AutoSize from resizing form when we change from psProgress to psEnd
    ImageDone.Visible := (Stage in [psEnd]);
    ImageRun.Visible := (Stage in [psBegin, psProgress]);
*)
    ShowProgress;

//    if (Visible) and (EnableAbort) and (not Aborted) then
    if (Visible) then
      ProcessMessages;

  finally
    EndUpdate;
  end;
end;

// -----------------------------------------------------------------------------

procedure TProgressForm.AbortProgress;
begin
  inherited Aborted := True;
end;

// -----------------------------------------------------------------------------

procedure TProgressForm.AdvanceProgress(DeltaProgress: integer; ProgressContext: pointer);
begin
  Progress(psProgress, FCurrentProgress + DeltaProgress, FMaxProgress, ProgressContext);
end;

// -----------------------------------------------------------------------------

procedure TProgressForm.BeginUpdate;
begin
  inc(FUpdateCount);
end;

// -----------------------------------------------------------------------------

function TProgressForm.QueryInterface(const IID: TGUID; out Obj): HResult;
const
  E_NOINTERFACE = HResult($80004002);
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

// -----------------------------------------------------------------------------

procedure TProgressForm.SetEnableAbort(Value: boolean);
//var
//  Msg: TMsg;
begin
  PanelAbort.Visible := Value;

  ProcessMessages(True);
(*
      while (PeekMessage(Msg, Handle, DXM_SKINS_POSTREDRAW, DXM_SKINS_POSTREDRAW, PM_REMOVE)) or
        (PeekMessage(Msg, Handle, WM_PAINT, WM_PAINT, PM_REMOVE)) do
      begin
        TranslateMessage(Msg);
        DispatchMessage(Msg);
      end;
*)
end;

procedure TProgressForm.SetEnabled(Value: boolean);
begin
  if (FEnabled = Value) then
    exit;

  BeginUpdate;
  try
    FEnabled := Value;
    if (not FEnabled) then
      HideProgress;
  finally
    EndUpdate;
  end;
end;

procedure TProgressForm.SetMarquee(Value: boolean);
begin
  if (Value) then
    ProgressBar.Style := pbstMarquee
  else
    ProgressBar.Style := pbstNormal;

  ProcessMessages(True);
end;

// -----------------------------------------------------------------------------

procedure TProgressForm.SetRaiseOnAbort(Value: boolean);
begin
  FRaiseOnAbort := Value;
end;

// -----------------------------------------------------------------------------

procedure TProgressForm.Show;
begin
  if (not Enabled) then
    exit;

  FDefer := False;
  ShowProgress;
  ProcessMessages(True);
end;

// -----------------------------------------------------------------------------

procedure TProgressForm.ShowProgress;
begin
  if (not Enabled) then
    exit;

  if (Visible) then
    exit;

  // Defer display of progress form. See Timer1Timer().
  if (FDefer) then
    FQueued.Start
    //TimerDefer.Enabled := True
  else
    DeferredShow;
end;

// -----------------------------------------------------------------------------

procedure TProgressForm.SuspendAbort;
begin
  Inc(FAbortSuspendCount);
  if (FAbortSuspendCount = 1) then
  begin
    ButtonAbort.Enabled := False;
    ButtonAbort.Update;
  end;
end;

// -----------------------------------------------------------------------------

procedure TProgressForm.Updated;
begin
  FNeedUpdate := False;
  FForceUpdate := False;
  FLastUpdate.Reset;
  FLastUpdate.Start;
end;

// -----------------------------------------------------------------------------

procedure TProgressForm.DoUpdateMessage(const Msg: string);
begin
  BeginUpdate;
  try
    FMessage := Msg;
//    LabelMessage.Caption := Msg;
    RequestUpdate;

    if (Visible) and (EnableAbort) and (not Aborted) then
      ProcessMessages;
  finally
    EndUpdate;
  end;
end;

procedure TProgressForm.UpdateMessage(const Msg: string);
begin
  Progress(psProgress, FCurrentProgress, FMaxProgress, Msg);
end;

// -----------------------------------------------------------------------------

procedure TProgressForm.ApplyProgressUpdate;
var
  n: integer;
begin
  if (not Marquee) then
  begin
    if (FCurrentMax <> FMaxProgress) then
    begin
      FCurrentMax := FMaxProgress;
      ProgressBar.Max := FMaxProgress;
    end;

    if (FCurrentPosition <> FCurrentProgress) then
    begin
      // Work around for Aero progress bar animation causing the progress bar to
      // lag behind
      if (FCurrentProgress >= FMaxProgress) then
      begin
        n := FMaxProgress;
        if (n = 0) then
          n := 1;

        ProgressBar.Max := n+1;
        ProgressBar.Position := n+1;
        // Setting max lower that progress also causes progress to decrease
        // and thus causes instant update.
        ProgressBar.Max := n;
        FCurrentPosition := FMaxProgress;
      end else
      if (FStage = psEnd) then
      begin
        // If Stage=psEnd we need the progress to update immediately as we will
        // probably close the progress bar right after.

        // Decrementing position causes instant update
        ProgressBar.Position := FCurrentProgress+1;
        ProgressBar.Position := FCurrentProgress;
        FCurrentPosition := FCurrentProgress;
      end else
      if (MulDiv(ProgressBar.Width, FCurrentProgress, FMaxProgress) <> MulDiv(ProgressBar.Width, FCurrentPosition, FMaxProgress)) then
      begin
        // Normal smooth animated update
        ProgressBar.Position := FCurrentProgress;
        FCurrentPosition := FCurrentProgress;
      end;
    end;
  end else
    ProgressBar.StepIt;

  AutoSize := False;
  PanelProgress.AutoSize := False;
  LabelMessage.Caption := FMessage;
  PanelProgress.AutoSize := True;
  AutoSize := True;

(*
  ImageRun.Visible := True; // To avoid AutoSize from resizing form when we change from psProgress to psEnd
  ImageDone.Visible := (FStage in [psEnd]);
  ImageRun.Visible := (FStage in [psBegin, psProgress]);
*)
  ButtonAbort.Enabled := ((FStage = psProgress) or (Marquee)) and (FAbortSuspendCount = 0) and ( not Aborted);
end;

// -----------------------------------------------------------------------------

function TProgressForm._AddRef: Integer;
begin
  Result := InterlockedIncrement(FRefCount);
end;

// -----------------------------------------------------------------------------

function TProgressForm._Release: Integer;
begin
  Result := InterlockedDecrement(FRefCount);
  if (Result = 0) then
    Free;
end;

//------------------------------------------------------------------------------
//
//      ShowProgress()
//
//------------------------------------------------------------------------------
function DoShowProgress(const Title: string; Defer: boolean): IProgress;
var
  ProgressForm: TProgressForm;
begin
  ProgressForm := TProgressForm.Create(nil);
  ProgressForm.Caption := Title;
  ProgressForm.Defer := Defer;

  Result := ProgressForm as IProgress;

  if (not Defer) then
    Result.Show;
end;

var
  FProgressFactory: TProgressFactory = nil;

function ShowProgress(const Title: string; Defer: boolean): IProgress;
begin
  if (not Assigned(FProgressFactory)) then
    FProgressFactory := @DoShowProgress;

  Result := FProgressFactory(Title, Defer);
end;

function ForceShowProgress(const Title: string; Defer: boolean): IProgress;
begin
  Result := DoShowProgress(Title, Defer);
end;

//------------------------------------------------------------------------------
//
//      RegisterProgressHandler
//
//------------------------------------------------------------------------------
function RegisterProgressHandler(const Factory: TProgressFactory): TProgressFactory;
begin
  if (not Assigned(FProgressFactory)) then
    FProgressFactory := @DoShowProgress;

  Result := @FProgressFactory;

  FProgressFactory := Factory;
end;


function UnregisterProgressHandler(const Factory: TProgressFactory): TProgressFactory;
begin
  if (@FProgressFactory = @Factory) then
    FProgressFactory := @DoShowProgress;

  Result := @FProgressFactory;
end;


//------------------------------------------------------------------------------
//
//      TCustomProgressForm
//
//------------------------------------------------------------------------------
procedure TCustomProgressForm.ButtonAbortClick(Sender: TObject);
begin
  FAborted := True;
  SuspendAbort;
end;

//------------------------------------------------------------------------------
(*
  Top

  Progress
  FPopupParent

  Bottom

  Top

  Progress
  ModalDialog
  FPopupParent

  Bottom
*)
procedure TCustomProgressForm.DeferredShow;
var
  ActiveWindow: HWND;
  Flags: DWORD;
begin
  TimerDefer.Enabled := False;

  // Make AutoSize work so size reflect if PanelAbort is visible or not.
  // Normally AutoSize would do it's thing when we set Visible=True, but because
  // the form is already visible at that point, it doesn't.
  AdjustSize;

  // If another window has become active since progress were started we position
  // the progress below this window.
  // We are aiming to avoid the following scenario:
  // 1. Progress is started deferred.
  // 2. A modal dialog is displayed.
  // 3. Progress dialog is displayed on top of the modal dialog.
  Flags := SWP_NOACTIVATE or SWP_NOSIZE;
  ActiveWindow := GetActiveWindow;
  // TODO: We shouldn't display progress at all unless mainform is assigned
  if (ActiveWindow = 0) or (ActiveWindow = FPopupParentHandle) or ((Application.MainForm <> nil) and (ActiveWindow = Application.MainForm.Handle)) then
    Flags := Flags or SWP_NOZORDER;

  // Set window pos before we show the ActiveWindow. Otherwise SetVisible will move
  // the window from the initial (random) position.
  SetWindowPos(Handle, ActiveWindow,
    Application.MainForm.Left + (Application.MainForm.Width - Width) div 2,
    Application.MainForm.Top + (Application.MainForm.Height - Height) div 2,
    0,0, Flags);

  // Show window but do not activate it. This eliminates title bar flicker
  // caused by change of focus from the main form to the progress form and back.
  ShowWindow(Handle, SW_SHOWNA);

  // For some reason we have to repeat the Z-ordering or it doens't work
  if (Flags and SWP_NOZORDER = 0) then
    SetWindowPos(Handle, ActiveWindow, 0, 0, 0, 0, SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOMOVE);

  Visible := True; // We need to update the internal VCL visibility flag too.

  Update;
end;

//------------------------------------------------------------------------------

procedure TCustomProgressForm.FormCreate(Sender: TObject);
begin
  Inherited;

  Font.Assign(Screen.MessageFont);
  LabelMessage.Style.Font.Assign(Screen.MessageFont);
  LabelMessage.Style.Font.Size := 12;

  ProgressBar.Position := ProgressBar.Min;

  FResult := True;
  FResultText := '';

  if (Application.Terminated) then
    exit;

  FPopupParent := Screen.ActiveForm;
  if (FPopupParent <> nil) then
    FPopupParentHandle := FPopupParent.Handle
  else
  if (Application.MainForm <> nil) then
    FPopupParentHandle := Application.MainForm.Handle;

  FLastIdle := TStopwatch.Create;

  Handle;
end;

//------------------------------------------------------------------------------

procedure TCustomProgressForm.TimerDeferTimer(Sender: TObject);
begin
  if (Screen.ActiveForm <> nil) and (Screen.ActiveForm <> FPopupParent) and (fsModal in Screen.ActiveForm.FormState) then
  begin
    // Defer display of progress dialog if a different form, than the one that
    // were active when progress were started, has become active and is modal.
    // We are aiming to avoid the following scenario:
    // 1. Form A displays progress dialog deferred.
    // 2. Form B displays modal prompt dialog.
    // 3. Defer timer expires and causes progress dialog to display on top of
    //    modal prompt dialog.
    // 4. User waits forever because she doesn't notice the prompt under the
    //    progress dialog and the progress dialog doesn't advance because progress
    //    has been blocked by the prompt.

    // If UpdateActions has not been called, then Application.Idle has not run
    // and we assume that the modal form is busy and is the one that invoked us.
    // Require at least 1000mS of non-idleness before we display
    if (FLastIdle.IsRunning) and (FLastIdle.ElapsedMilliseconds < ProgressDeferTime * 2) then
      exit;
  end;

  // If task is still running after a while we display the progress form.
  // This minimizes the "visual flash" that happens when the progress form is
  // displayed and then immediately hidden,  as is the case for most tasks.
//  if (Screen.ActiveForm = nil) or (not(fsModal in Screen.ActiveForm.FormState)) and
//  if ((PopupParent <> nil) and (IsWindowEnabled(PopupParent.Handle))) or (IsWindowEnabled(Application.MainForm.Handle)) then

    DeferredShow;
end;

procedure TCustomProgressForm.UpdateActions;
begin
  inherited;
  FLastIdle.Start;
end;

//------------------------------------------------------------------------------

class function TCustomProgressForm.PumpTimerMessages: boolean;
var
  Msg: TMsg;
const
  WM_SYSTIMER = $0118;
begin
  Result := False;
  Msg.message := 0;
  // Process timer messages
  while (PeekMessage(Msg, 0, WM_TIMER, WM_TIMER, PM_REMOVE)) or (PeekMessage(Msg, 0, WM_SYSTIMER, WM_SYSTIMER, PM_REMOVE)) do
  begin
    if (Msg.message = WM_QUIT) then
    begin
      PostQuitMessage(Msg.wParam);
      Result := False;
      exit;
    end;

    TranslateMessage(Msg);
    DispatchMessage(Msg);
    Result := True;
  end;

  PeekMessage(Msg, 0, WM_NULL, WM_NULL, PM_NOREMOVE); // Avoid window ghosting due to unresponsiveness on Vista+

  // If a grid is in the progress of being modified inside a BeginUpdate/EndUpdate block,
  // then updating the main form will cause flicker because the grid will not repaint.
//  if (Application.MainForm <> nil) then
//    Application.MainForm.Update; // Allow repaint of main form
end;

//------------------------------------------------------------------------------

procedure TCustomProgressForm.ReportError(const Text: string);
begin
  FResult := False;
  FResultText := Text;
end;

//------------------------------------------------------------------------------

procedure TCustomProgressForm.SuspendAbort;
begin
end;

//------------------------------------------------------------------------------

initialization
finalization
  TProgressForm.Finalize;
end.
