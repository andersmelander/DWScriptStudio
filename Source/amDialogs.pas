unit amDialogs;

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
  Dialogs,
  Controls,
  ExtDlgs;

//------------------------------------------------------------------------------
//
//      TOpenDialog
//
//------------------------------------------------------------------------------
// - Change file type of file name when user changes filetype selection.
//------------------------------------------------------------------------------
type
  TOpenDialog = class(Dialogs.TOpenDialog)
  protected
    procedure DoTypeChange; override;
  end;

  TSaveDialog = class(Dialogs.TSaveDialog)
  protected
    procedure DoTypeChange; override;
  end;

  TOpenPictureDialog = class(ExtDlgs.TOpenPictureDialog)
  protected
    procedure DoTypeChange; override;
  end;

  TSavePictureDialog = class(ExtDlgs.TSavePictureDialog)
  protected
    procedure DoTypeChange; override;
  end;

function ChangeFileType(Handle: HWND; const Filename, Filter: string; FilterIndex: integer): string;


//------------------------------------------------------------------------------
//
//      Fix for loss of focus after modal message dialog
//
//------------------------------------------------------------------------------
function MessageDlgEx(const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint): Integer; overload;
function MessageDlgEx(const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint; DefaultButton: TMsgDlgBtn): Integer; overload;


//------------------------------------------------------------------------------
//
//      Task Dialog with option to suppress
//
//------------------------------------------------------------------------------
function MessageTaskDlgEx(const Instruction, Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint = -1): Integer; overload;
function MessageTaskDlgEx(const Instruction, Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; var Suppress: boolean; HelpCtx: Longint = -1): Integer; overload;
function MessageTaskDlgEx(const Instruction, Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; DefaultButton: TMsgDlgBtn; var Suppress: boolean; HelpCtx: Longint = -1): Integer; overload;
function MessageTaskDlgEx(const Instruction, Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; DefaultButton: TMsgDlgBtn; HelpCtx: Longint = -1): Integer; overload;

function LoadSuppressSetting(const Key, Name: string): boolean;
procedure SaveSuppressSetting(const Key, Name: string);

//------------------------------------------------------------------------------
//
//      Task Dialog with option to report error
//
//------------------------------------------------------------------------------
function ShowErrorMessage(const Caption, Instruction, Content: string; Info: string = ''; DisplayVerify: boolean = False; const Verify: string = ''; Buttons: TMsgDlgButtons = [mbOK]): TModalResult;

resourcestring
  // TODO : Localization
  sErrorDialogBugReport = '<a>Report this problem as an error</a>';

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

implementation

uses
  Forms,
  Messages,
  Consts,
  SysUtils,
  CommDlg,
  MultiMon,
  HelpIntfs,
  Themes,
  uxTheme,
  Registry;

{$if (DialogsThemesEnabledPatch)}
{$else}
//{$if not defined(DialogsThemesEnabledPatch)}
type
  TIsThemeActive = function: BOOL; stdcall;

function FakeIsThemeActive: BOOL; stdcall;
begin
  Result := True;
end;

var
  SaveIsThemeActive: TIsThemeActive;
  SaveIsAppThemed: TIsThemeActive;
{$ifend}

function ChangeFileType(Handle: HWND; const Filename, Filter: string; FilterIndex: integer): string;

  function GetFileType(Index: integer): string;
  var
    p: PChar;
    FileType: PChar;
    Filters: string;
  begin
    Result := '';
    Filters := Filter;
    UniqueString(Filters);
    p := PChar(Filters);
    while (p^ <> #0) and (Index > 0) do
    begin
      Dec(Index);

      while (p^ <> '|') and (p^ <> #0) do
        inc(p);
      if (p^ <> #0) then
      begin
        inc(p);
        if (Index = 0) then
        begin
          FileType := p;
          while (p^ <> #0) and (p^ <> '|') and (p^ <> ';') do
            inc(p);

          p^ := #0;
          Result := ExtractFileExt(FileType);
          break;
        end else
          while (p^ <> #0) and (p^ <> '|') do
            inc(p);
        inc(p);
      end;
    end;
  end;

var
  NewFileName: string;
  HasFilename: boolean;
  FileType: string;
const
  edt1 = $0480; // Current filename edit control
  cmb13 = $047c; // Current filename combo control
begin
  Result := Filename;
  // Change extension of current filename if the user changes the filetype
  // selection. This mimics the behaviour of MSWRITE.
  // Note: FileterIndex is 1-based.
  if (FilterIndex > 0) then
  begin
    FileType := GetFileType(FilterIndex);

    if (FileType <> '') and (Pos('*', FileType) <= 0) and (Pos('?', FileType) <= 0) then
    begin
      HasFilename := (not DirectoryExists(FileName));

      NewFilename := '';

      if (HasFilename) then
      begin
        NewFilename := ExtractFileName(FileName);
        HasFilename := (Filename <> '');
      end;

      if (not HasFilename) then
        NewFilename := 'dummy';

      Result := ChangeFileExt(NewFilename, FileType);


      // Change the content of the current-filename-control
      // Note: edt1 automatically redirects to cbm13 if the combo is visible
      if (HasFilename) then
        SendMessage(GetParent(Handle), CDM_SETCONTROLTEXT, WPARAM(edt1), LPARAM(PChar(Result)));
    end;
  end;
end;

procedure TOpenDialog.DoTypeChange;
begin
  ChangeFileType(Handle, Filename, Filter, FilterIndex);
  inherited;
end;

procedure TSaveDialog.DoTypeChange;
begin
  ChangeFileType(Handle, Filename, Filter, FilterIndex);
  inherited;
end;

procedure TOpenPictureDialog.DoTypeChange;
begin
  ChangeFileType(Handle, Filename, Filter, FilterIndex);
  inherited;
end;

procedure TSavePictureDialog.DoTypeChange;
begin
  ChangeFileType(Handle, Filename, Filter, FilterIndex);
  inherited;
end;

//------------------------------------------------------------------------------
//
//      Fix for loss of focus after modal message dialog
//
//------------------------------------------------------------------------------
function MessageDlgEx(const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint): Integer;
begin
  Result := Dialogs.MessageDlg(Msg, DlgType, Buttons, HelpCtx);
(* No longer believed to be necessary. Also, can cause error if ActiveControl has no parent (e.g. during destruction, etc.)
  if (Screen.ActiveControl <> nil) then
    SetFocus(Screen.ActiveControl.Handle);
*)
  // Yes, it is still necessary.
  try
    if (Screen.ActiveControl <> nil) and (Screen.ActiveControl.CanFocus) then
      SetFocus(Screen.ActiveControl.Handle);
  except
  end;
end;

function MessageDlgEx(const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint; DefaultButton: TMsgDlgBtn): Integer;
begin
  Result := Dialogs.MessageDlg(Msg, DlgType, Buttons, HelpCtx, DefaultButton);
(* No longer believed to be necessary. Also, can cause error if ActiveControl has no parent (e.g. during destruction, etc.)
  if (Screen.ActiveControl <> nil) then
    SetFocus(Screen.ActiveControl.Handle);
*)
  // Yes, it is still necessary.
  try
    if (Screen.ActiveControl <> nil) and (Screen.ActiveControl.CanFocus) then
      SetFocus(Screen.ActiveControl.Handle);
  except
  end;
end;

//------------------------------------------------------------------------------
//
//      Task Dialog with option to Suppress
//
//------------------------------------------------------------------------------
type
  PBoolean = ^boolean;

type
  TTaskMessageDialog = class(TCustomTaskDialog)
  private
    FHelpFile: string;
  strict protected
    procedure DoOnButtonClicked(AModalResult: Integer; var CanClose: Boolean); override;
    procedure DoOnHelp; override;
  public
    property HelpFile: string read FHelpFile write FHelpFile;
  end;

const
  tdbHelp = -1;

procedure TTaskMessageDialog.DoOnButtonClicked(AModalResult: Integer;
  var CanClose: Boolean);
begin
  if AModalResult = tdbHelp then
  begin
    CanClose := False;
    DoOnHelp;
  end;
end;

procedure TTaskMessageDialog.DoOnHelp;
var
  LHelpFile: string;
  LHelpSystem: IHelpSystem;
begin
  if HelpContext <> 0 then
  begin
    if FHelpFile = '' then
      LHelpFile := Application.HelpFile
    else
      LHelpFile := HelpFile;
    if HelpIntfs.GetHelpSystem(LHelpSystem) then
    try
      LHelpSystem.Hook(Application.Handle, LHelpFile, HELP_CONTEXT, HelpContext);
    except
      on E: Exception do
        ShowHelpException(E);
    end;
  end;
end;

function DoMessageTaskDlgEx(const Instruction, Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons = [mbOK]; DefaultButton: TMsgDlgBtn = mbOK; Suppress: PBoolean = nil; HelpCtx: Longint = -1): Integer;
var
  Dialog: TTaskMessageDialog;
  DlgBtn: TMsgDlgBtn;
  s: string;
  ExtraMsg: string;
  n: integer;
const
  tdbHelp = -1;
  IconMap: array[TMsgDlgType] of TTaskDialogIcon = (tdiWarning, tdiError,
    tdiInformation, tdiInformation, tdiNone);
  LModalResults: array[TMsgDlgBtn] of Integer = (mrYes, mrNo, mrOk, mrCancel,
    mrAbort, mrRetry, mrIgnore, mrAll, mrNoToAll, mrYesToAll, tdbHelp, mrClose);
  ButtonCaptions: array[TMsgDlgBtn] of Pointer = (
    @SMsgDlgYes, @SMsgDlgNo, @SMsgDlgOK, @SMsgDlgCancel, @SMsgDlgAbort,
    @SMsgDlgRetry, @SMsgDlgIgnore, @SMsgDlgAll, @SMsgDlgNoToAll, @SMsgDlgYesToAll,
    @SMsgDlgHelp, @SMsgDlgClose);
  Captions: array[TMsgDlgType] of Pointer = (@SMsgDlgWarning, @SMsgDlgError,
    @SMsgDlgInformation, @SMsgDlgConfirm, nil);
begin
{$if (DialogsThemesEnabledPatch)}
{$else}
  if (ThemeServices.ThemesAvailable) then
  begin
    SaveIsThemeActive := FakeIsThemeActive;
    SaveIsAppThemed := UxTheme.IsAppThemed;
    UxTheme.IsThemeActive := FakeIsThemeActive;
    UxTheme.IsAppThemed := FakeIsThemeActive;
    ThemeServices.UpdateThemes;
  end else
    SaveIsThemeActive := nil;
  try
{$ifend}

    if (Suppress <> nil) then
      Suppress^ := False;

    s := Msg;
    n := Pos('|', s);
    if (n > 0) then
    begin
      ExtraMsg := Copy(s, n+1, MaxInt);
      s := Copy(s, 1, n-1);
    end else
      ExtraMsg := '';

{$if (DialogsThemesEnabledPatch)}
    if (not CheckWin32Version(6)) or (not ThemeServices.ThemesAvailable) then
{$else}
    if (not CheckWin32Version(6)) or (not ThemeServices.ThemesEnabled) then
{$ifend}
    begin
      if (Msg <> '') then
      begin
        if (ExtraMsg <> '') then
          s := s + #13'----------'#13 + ExtraMsg;
        if (Instruction <> '') then
          s := Instruction + #13#13 + s;
      end else
        s := Instruction;

      Result := MessageDlgEx(s, DlgType, Buttons, HelpCtx, DefaultButton);
      exit;
    end;

    Dialog := TTaskMessageDialog.Create(nil);
    try
      // Assign buttons
      for DlgBtn := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do
        if DlgBtn in Buttons then
          with Dialog.Buttons.Add do
          begin
            Caption := LoadResString(ButtonCaptions[DlgBtn]);
            Default := (DlgBtn = DefaultButton);
            ModalResult := LModalResults[DlgBtn];
          end;

      if DlgType <> mtCustom then
        Dialog.Caption := LoadResString(Captions[DlgType])
      else
        Dialog.Caption := Application.Title;
      Dialog.CommonButtons := [];
      Dialog.Flags := Dialog.Flags + [tfExpandFooterArea];
      if Application.UseRightToLeftReading then
        Dialog.Flags := Dialog.Flags + [tfRtlLayout];
      Dialog.HelpContext := HelpCtx;
      Dialog.HelpFile := Application.HelpFile;
      Dialog.MainIcon :=  IconMap[DlgType];
      Dialog.Text := s;
      Dialog.ExpandedText := ExtraMsg;
      Dialog.Title := Instruction;
      if (Suppress <> nil) then
        Dialog.VerificationText := 'Do not show this message again'; // TODO : Localization

      Result := mrNone;

      if (Dialog.Execute) then
      begin
        Result := Dialog.ModalResult;
        if (Suppress <> nil) then
          Suppress^ := (tfVerificationFlagChecked in Dialog.Flags);
      end;

    finally
      Dialog.Free;
    end;

{$if (DialogsThemesEnabledPatch)}
{$else}
  finally
    if (Assigned(SaveIsThemeActive)) then
    begin
      UxTheme.IsThemeActive := SaveIsThemeActive;
      UxTheme.IsAppThemed := SaveIsAppThemed;
      ThemeServices.UpdateThemes;
    end;
  end;
{$ifend}

  // Make sure focus is brought back from limbo
  try
    if (Screen.ActiveControl <> nil) and (Screen.ActiveControl.CanFocus) then
      SetFocus(Screen.ActiveControl.Handle);
  except
  end;
end;

function MessageTaskDlgEx(const Instruction, Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; var Suppress: boolean; HelpCtx: Longint): Integer;
var
  DefaultButton: TMsgDlgBtn;
begin
  if mbOk in Buttons then
    DefaultButton := mbOk
  else
  if mbYes in Buttons then
    DefaultButton := mbYes
  else
    DefaultButton := mbRetry;

  Result := DoMessageTaskDlgEx(Instruction, Msg, DlgType, Buttons, DefaultButton, @Suppress, HelpCtx);
end;

function MessageTaskDlgEx(const Instruction, Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; DefaultButton: TMsgDlgBtn; var Suppress: boolean; HelpCtx: Longint): Integer;
begin
  Result := DoMessageTaskDlgEx(Instruction, Msg, DlgType, Buttons, DefaultButton, @Suppress, HelpCtx);
end;

function MessageTaskDlgEx(const Instruction, Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint = -1): Integer;
var
  DefaultButton: TMsgDlgBtn;
begin
  if (mbOk in Buttons) then
    DefaultButton := mbOk
  else
  if (mbYes in Buttons) then
    DefaultButton := mbYes
  else
    DefaultButton := mbRetry;

  Result := DoMessageTaskDlgEx(Instruction, Msg, DlgType, Buttons, DefaultButton, nil, HelpCtx);
end;

function MessageTaskDlgEx(const Instruction, Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; DefaultButton: TMsgDlgBtn; HelpCtx: Longint = -1): Integer;
begin
  Result := DoMessageTaskDlgEx(Instruction, Msg, DlgType, Buttons, DefaultButton, nil, HelpCtx);
end;

//------------------------------------------------------------------------------

function LoadSuppressSetting(const Key, Name: string): boolean;
var
  Reg: TRegIniFile;
begin
  Reg := TRegIniFile.Create(KEY_READ);
  try
    Result := Reg.ReadBool(Key, Name, False);
  finally
    Reg.Free;
  end;
end;

procedure SaveSuppressSetting(const Key, Name: string);
var
  Reg: TRegIniFile;
begin
  Reg := TRegIniFile.Create(KEY_READ or KEY_WRITE);
  try
    Reg.WriteBool(Key, Name, True);
  finally
    Reg.Free;
  end;
end;

//------------------------------------------------------------------------------

type
  TShowErrorMessage = class
  protected
    class procedure OnErrorTaskDialogReraise(Sender: TObject);
  end;

class procedure TShowErrorMessage.OnErrorTaskDialogReraise(Sender: TObject);
begin
  Dialogs.TTaskDialog(Sender).ModalResult := mrAbort; // Signal caller that we need the exception reraised.
  PostMessage(Dialogs.TTaskDialog(Sender).Handle, WM_CLOSE, 0, 0);
end;

function ShowErrorMessage(const Caption, Instruction, Content: string; Info: string; DisplayVerify: boolean; const Verify: string; Buttons: TMsgDlgButtons): TModalResult;
var
  Task: TTaskDialog;
  TaskEx: Dialogs.TTaskDialog;
  VerifyStr: string;
  Button: TMsgDlgBtn;
  ButtonsStd: TTaskDialogCommonButtons;
const
  MappedButtons: TMsgDlgButtons = [mbYes, mbNo, mbOK, mbCancel, mbRetry, mbClose];
  ButtonMapStd: array[TMsgDlgBtn] of TTaskDialogCommonButton = (tcbYes, tcbNo, tcbOK, tcbCancel, tcbOK, tcbRetry, tcbOK, tcbOK, tcbOK, tcbOK, tcbOK, tcbClose);
begin
  Result := mrOK;

  VerifyStr := Verify;
  if (DisplayVerify) and (VerifyStr = '') then
    VerifyStr := sErrorDialogBugReport;

  ButtonsStd := [];
  for Button in Buttons do
    if (Button in Buttons) then
      Include(ButtonsStd, ButtonMapStd[Button]);
  TaskEx := Dialogs.TTaskDialog.Create(nil);
  try
    TaskEx.Caption := Caption;
    TaskEx.Title := Instruction;
    TaskEx.Text := Content;
    TaskEx.ExpandedText := Info;
    if (DisplayVerify) then
      TaskEx.FooterText := VerifyStr;
    TaskEx.MainIcon := tdiWarning;
    TaskEx.Flags := [tfEnableHyperlinks, tfAllowDialogCancellation, tfExpandFooterArea];
    TaskEx.CommonButtons := ButtonsStd;
    TaskEx.OnHyperlinkClicked := TShowErrorMessage.OnErrorTaskDialogReraise;

    TaskEx.Execute;

    Result := TaskEx.ModalResult
  finally
    TaskEx.Free;
  end;

  // If user clicked the "report problem as error" link, we reraise the exception so the normal error
  // handling can produce a bug report.
  if (DisplayVerify) and (Result = 2) then
    Result := mrAbort;
end;

//------------------------------------------------------------------------------

end.
