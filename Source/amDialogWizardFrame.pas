unit amDialogWizardFrame;

(*
 * Copyright © 2008 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxCustomWizardControl,
  dxWizardControl;

// -----------------------------------------------------------------------------
//
// TFrameWizard
//
// -----------------------------------------------------------------------------
type
  TFrameWizard = class;

  TWizardAcceptEvent = procedure(Sender: TObject; var Accept: boolean) of object;
  TWizardPageActivatingEvent = procedure(Sender: TObject; CurrentPage, NewPage: TdxWizardControlCustomPage; var AAllow: boolean) of object;
  TWizardPageEvent = procedure(Sender: TObject; Page: TdxWizardControlCustomPage) of object;
  TWizardPageChangeEvent = procedure(Sender: TObject; CurrentPage: TdxWizardControlCustomPage; var NewPage: TdxWizardControlCustomPage; var Handled: boolean) of object;
  TWizardGetPageEvent = procedure(Sender: TObject; var NewPage: TdxWizardControlCustomPage) of object;

  TamWizardControl = class(TdxWizardControl);

  TdxWizardControl = class(TamWizardControl);

  TFrameWizard = class(TFrame)
    Wizard: TdxWizardControl;
    procedure WizardButtonClick(Sender: TObject; AKind: TdxWizardControlButtonKind; var AHandled: Boolean);
    procedure WizardPageChanging(Sender: TObject; ANewPage: TdxWizardControlCustomPage; var AAllow: Boolean);
    procedure WizardPageChanged(Sender: TObject);
  private
    FBusyCount: integer;
    FUpdateCount: integer;
    FOnWizardCancel: TWizardAcceptEvent;
    FOnWizardFinish: TWizardAcceptEvent;
    FOnWizardPageActivating: TWizardPageActivatingEvent;
    FOnWizardPageActivated: TWizardPageEvent;
    FOnWizardNextPage: TWizardPageChangeEvent;
    FOnWizardPrevPage: TWizardPageChangeEvent;
    FOnWizardGetPrevPage: TWizardGetPageEvent;
    FOnWizardGetNextPage: TWizardGetPageEvent;
    FAutoDisableCancel: boolean;
  private
    procedure FixAero;
    procedure UpdateWizardFont;
  protected
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure SetParent(AParent: TWinControl); override;

    function WizardGetNextPage(CurrentPage: TdxWizardControlCustomPage): TdxWizardControlCustomPage; virtual;
    function WizardGetPrevPage(CurrentPage: TdxWizardControlCustomPage): TdxWizardControlCustomPage; virtual;
    function WizardCanGotoNextPage(CurrentPage: TdxWizardControlCustomPage): boolean;
    function WizardCanGotoPrevPage(CurrentPage: TdxWizardControlCustomPage): boolean;
    function WizardGotoNextPage: boolean;
    function WizardGotoPrevPage: boolean;
    procedure WizardPageActivating(CurrentPage, NewPage: TdxWizardControlCustomPage; var AAllow: boolean);
    procedure WizardPageActivated(Page: TdxWizardControlCustomPage);

    // Event dispatch
    function DoWizardFinish: boolean; virtual;
    function DoWizardCancel: boolean; virtual;
    procedure DoWizardPageActivating(CurrentPage, NewPage: TdxWizardControlCustomPage; var AAllow: boolean); virtual;
    procedure DoWizardPageActivated(Page: TdxWizardControlCustomPage); virtual;
    procedure DoWizardNextPage(CurrentPage: TdxWizardControlCustomPage; var NewPage: TdxWizardControlCustomPage; var Handled: boolean); virtual;
    procedure DoWizardPrevPage(CurrentPage: TdxWizardControlCustomPage; var NewPage: TdxWizardControlCustomPage; var Handled: boolean); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    procedure BeginBusy;
    procedure EndBusy;

    procedure UpdateButtons;
    procedure PerformCancel;

    procedure BeginUpdate;
    procedure EndUpdate;
    property UpdateCount: integer read FUpdateCount;

    property AutoDisableCancel: boolean read FAutoDisableCancel write FAutoDisableCancel;

    property OnWizardCancel: TWizardAcceptEvent read FOnWizardCancel write FOnWizardCancel;
    property OnWizardFinish: TWizardAcceptEvent read FOnWizardFinish write FOnWizardFinish;
    property OnWizardPageActivating: TWizardPageActivatingEvent read FOnWizardPageActivating write FOnWizardPageActivating;
    property OnWizardPageActivated: TWizardPageEvent read FOnWizardPageActivated write FOnWizardPageActivated;
    property OnWizardNextPage: TWizardPageChangeEvent read FOnWizardNextPage write FOnWizardNextPage;
    property OnWizardPrevPage: TWizardPageChangeEvent read FOnWizardPrevPage write FOnWizardPrevPage;
    property OnWizardGetNextPage: TWizardGetPageEvent read FOnWizardGetNextPage write FOnWizardGetNextPage;
    property OnWizardGetPrevPage: TWizardGetPageEvent read FOnWizardGetPrevPage write FOnWizardGetPrevPage;
  end;


implementation

{$R *.dfm}


uses
  dxWizardControlForm,
  cxDWMApi; // FixAero


type
  TdxWizardControlCracker = class(TdxCustomWizardControl);
  TdxWizardButtonCracker = class(TdxWizardControlCustomButton);
  TdxWizardControlCustomCommandAreaViewInfoCracker = class(TdxWizardControlCustomCommandAreaViewInfo);


// -----------------------------------------------------------------------------
//
// TFrameWizard
//
// -----------------------------------------------------------------------------

procedure TFrameWizard.CMFontChanged(var Message: TMessage);
begin
  UpdateWizardFont;
end;

// -----------------------------------------------------------------------------

constructor TFrameWizard.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Wizard.ViewStyle := wcvsAero;
  Wizard.LookAndFeel.NativeStyle := True;

  Wizard.Header.DescriptionOffset := 0;

  UpdateWizardFont;

  FAutoDisableCancel := True;
end;

// -----------------------------------------------------------------------------

procedure TFrameWizard.BeginBusy;
begin
  inc(FBusyCount);
end;

procedure TFrameWizard.EndBusy;
begin
  dec(FBusyCount);
end;

// -----------------------------------------------------------------------------

procedure TFrameWizard.FixAero;
begin
exit;
  if (IsCompositionEnabled) and (not TdxWizardControlCracker(Wizard).ViewInfo.TitleViewInfo.IsPaintOnGlass) then
  begin
    TdxWizardControlCracker(Wizard).ViewInfo.TitleViewInfo.IsPaintOnGlass := True; // Work around for loss of glass on title when button state is modified
    Invalidate;
  end;
end;

// -----------------------------------------------------------------------------

procedure TFrameWizard.PerformCancel;
begin
  DoWizardCancel;
end;

// -----------------------------------------------------------------------------

procedure TFrameWizard.SetParent(AParent: TWinControl);
begin
  inherited SetParent(AParent);

  if (csDestroying in ComponentState) then
    exit;

  ASSERT(Wizard <> nil);

  if (Parent = nil) or (Parent is TdxWizardControlForm) then
    Wizard.Parent := Parent
  else
    Wizard.Parent := Self;
end;

// -----------------------------------------------------------------------------

procedure TFrameWizard.UpdateButtons;
begin
  TdxWizardControlCracker(Wizard).Buttons.BeginUpdate;
  try
    Wizard.Buttons.Back.Enabled := (Wizard.ActivePage <> nil) and (WizardCanGotoPrevPage(Wizard.ActivePage));
    Wizard.Buttons.Next.Enabled := (Wizard.ActivePage <> nil) and (WizardCanGotoNextPage(Wizard.ActivePage));
    if (AutoDisableCancel) then
      Wizard.Buttons.Cancel.Enabled := (Wizard.ActivePage <> nil) and (FBusyCount = 0) and (Wizard.ActivePage.PageIndex <> Wizard.PageCount-1);
    Wizard.Buttons.Help.Enabled := (FBusyCount = 0) and (HelpContext <> 0);

    // Make Next the focused button, so tabbing from last control on a wizard page will hit the Next button first
    if (Wizard.Buttons.Next.Enabled) then
      TdxWizardControlCracker(Wizard).ViewInfo.CommandAreaViewInfo.Controller.FocusedCell :=
        TdxWizardControlCustomCommandAreaViewInfoCracker(TdxWizardControlCracker(Wizard).ViewInfo.CommandAreaViewInfo).NextButtonViewInfo;
  finally
    TdxWizardControlCracker(Wizard).Buttons.EndUpdate;
  end;
//  FixAero;
end;

// -----------------------------------------------------------------------------

procedure TFrameWizard.UpdateWizardFont;
begin
  Wizard.OptionsViewStyleAero.Title.Font.Assign(Font);
  Wizard.OptionsViewStyleAero.Title.Font.Style := [fsBold];
  Wizard.OptionsViewStyleAero.Title.Font.Size := 10;

  Wizard.Header.TitleFont.Assign(Font);
  Wizard.Header.TitleFont.Size := 12;
  Wizard.Header.DescriptionFont.Assign(Font);
  Wizard.Header.DescriptionFont.Size := 9;
end;

// -----------------------------------------------------------------------------

procedure TFrameWizard.WizardPageActivating(CurrentPage, NewPage: TdxWizardControlCustomPage; var AAllow: boolean);
var
  NextVisible: boolean;
begin
  NextVisible := (WizardGetNextPage(NewPage) <> nil);

  if (NextVisible <> TdxWizardButtonCracker(Wizard.Buttons.Next).Visible) then
  begin
//    TdxWizardButtonCracker(Wizard.Buttons.Next).Visible := NextVisible;
    FixAero;
  end;

  DoWizardPageActivating(CurrentPage, NewPage, AAllow);
end;

procedure TFrameWizard.WizardPageActivated(Page: TdxWizardControlCustomPage);
var
  NextVisible: boolean;
begin
  NextVisible := (WizardGetNextPage(Page) <> nil);

  if (NextVisible <> TdxWizardButtonCracker(Wizard.Buttons.Next).Visible) then
  begin
//    TdxWizardButtonCracker(Wizard.Buttons.Next).Visible := NextVisible;
    FixAero;
  end;

  DoWizardPageActivated(Page);

  if (Visible) and (Showing) then
    SelectNext(Page, True, True);
end;

procedure TFrameWizard.WizardButtonClick(Sender: TObject; AKind: TdxWizardControlButtonKind; var AHandled: Boolean);
begin
  if (AKind = wcbkBack) then
  begin
    WizardGotoPrevPage;
    AHandled := True;
  end else
  if (AKind = wcbkNext) then
  begin
    WizardGotoNextPage;
    AHandled := True;
  end else
  if (AKind = wcbkCancel) then
  begin
    DoWizardCancel;
    AHandled := True;
  end else
  if (AKind = wcbkFinish) then
  begin
    DoWizardFinish;
    AHandled := True;
  end;
end;

// -----------------------------------------------------------------------------

function TFrameWizard.WizardCanGotoPrevPage(CurrentPage: TdxWizardControlCustomPage): boolean;
var
  Page: TdxWizardControlCustomPage;
begin
  Page := WizardGetPrevPage(CurrentPage);
  Result := (Page <> nil);
end;

// -----------------------------------------------------------------------------

function TFrameWizard.WizardCanGotoNextPage(CurrentPage: TdxWizardControlCustomPage): boolean;
var
  Page: TdxWizardControlCustomPage;
begin
  Page := WizardGetNextPage(CurrentPage);
  Result := (Page <> nil);
end;

// -----------------------------------------------------------------------------

function TFrameWizard.WizardGetNextPage(CurrentPage: TdxWizardControlCustomPage): TdxWizardControlCustomPage;
begin
  Result := Wizard.GetNextPage(CurrentPage, True);
  if (Assigned(FOnWizardGetNextPage)) then
    FOnWizardGetNextPage(Self, Result);
end;

// -----------------------------------------------------------------------------

function TFrameWizard.WizardGetPrevPage(CurrentPage: TdxWizardControlCustomPage): TdxWizardControlCustomPage;
begin
  Result := Wizard.GetNextPage(CurrentPage, False);
  if (Assigned(FOnWizardGetPrevPage)) then
    FOnWizardGetPrevPage(Self, Result);
end;

// -----------------------------------------------------------------------------

function TFrameWizard.WizardGotoNextPage: boolean;
var
  CurrentPage, NewPage: TdxWizardControlCustomPage;
  Handled: boolean;
begin
  CurrentPage := Wizard.ActivePage;
  NewPage := WizardGetNextPage(CurrentPage);

  Handled := False;
  DoWizardNextPage(Wizard.ActivePage, NewPage, Handled);

  if (not Handled) and (Wizard.ActivePage = CurrentPage) then
  begin
    Result := (NewPage <> nil);

    if (Result) then
      NewPage.Activate;
  end else
    Result := True;
end;

// -----------------------------------------------------------------------------

function TFrameWizard.WizardGotoPrevPage: boolean;
var
  CurrentPage, NewPage: TdxWizardControlCustomPage;
  Handled: boolean;
begin
  CurrentPage := Wizard.ActivePage;
  NewPage := WizardGetPrevPage(CurrentPage);

  Handled := False;
  DoWizardPrevPage(Wizard.ActivePage, NewPage, Handled);

  if (not Handled) and (Wizard.ActivePage = CurrentPage) then
  begin
    Result := (NewPage <> nil);

    if (Result) then
      NewPage.Activate;
  end else
    Result := True;
end;

// -----------------------------------------------------------------------------

procedure TFrameWizard.DoWizardPageActivating(CurrentPage, NewPage: TdxWizardControlCustomPage; var AAllow: boolean);
begin
  if (Assigned(FOnWizardPageActivating)) then
    FOnWizardPageActivating(Self, CurrentPage, NewPage, AAllow);
end;

// -----------------------------------------------------------------------------

procedure TFrameWizard.DoWizardPageActivated(Page: TdxWizardControlCustomPage);
begin
  if (Assigned(FOnWizardPageActivated)) then
    FOnWizardPageActivated(Self, Page);
end;

// -----------------------------------------------------------------------------

function TFrameWizard.DoWizardCancel: boolean;
begin
  Result := True;
  if (Assigned(FOnWizardCancel)) then
    FOnWizardCancel(Self, Result);

  if (Result) then
    GetParentForm(Self).ModalResult := mrCancel;
end;

// -----------------------------------------------------------------------------

function TFrameWizard.DoWizardFinish: boolean;
begin
  Result := True;
  if (Assigned(FOnWizardFinish)) then
    FOnWizardFinish(Self, Result);

  if (Result) then
    GetParentForm(Self).ModalResult := mrOK;
end;

// -----------------------------------------------------------------------------

procedure TFrameWizard.DoWizardNextPage(CurrentPage: TdxWizardControlCustomPage; var NewPage: TdxWizardControlCustomPage; var Handled: boolean);
begin
  if (Assigned(FOnWizardNextPage)) then
    FOnWizardNextPage(Self, CurrentPage, NewPage, Handled);
end;

// -----------------------------------------------------------------------------

procedure TFrameWizard.DoWizardPrevPage(CurrentPage: TdxWizardControlCustomPage; var NewPage: TdxWizardControlCustomPage; var Handled: boolean);
begin
  if (Assigned(FOnWizardPrevPage)) then
    FOnWizardPrevPage(Self, CurrentPage, NewPage, Handled);
end;

// -----------------------------------------------------------------------------

procedure TFrameWizard.WizardPageChanged(Sender: TObject);
begin
  WizardPageActivated(TdxWizardControl(Sender).ActivePage);
end;

// -----------------------------------------------------------------------------

procedure TFrameWizard.WizardPageChanging(Sender: TObject; ANewPage: TdxWizardControlCustomPage; var AAllow: Boolean);
begin
  WizardPageActivating(TdxWizardControl(Sender).ActivePage, ANewPage, AAllow);
end;

// -----------------------------------------------------------------------------

procedure TFrameWizard.BeginUpdate;
begin
  inc(FUpdateCount);
end;

procedure TFrameWizard.EndUpdate;
begin
  dec(FUpdateCount);
end;

// -----------------------------------------------------------------------------

end.

