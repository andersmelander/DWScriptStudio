unit amDialogWizardForm;

(*
 * Copyright © 2008 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Types,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ActnList, System.Actions,

  dxWizardControlForm,
  dxCustomWizardControl,
  dxWizardControl,

  amDialogWizardFrame;

const
  MSG_AFTER_SHOW = WM_USER;

// -----------------------------------------------------------------------------
//
// TWizardControlForm
//
// -----------------------------------------------------------------------------
type
  TWizardControlForm = class(TdxWizardControlForm)
  private
    FOnAfterShow: TNotifyEvent;
  protected
    procedure DoShow; override;
    // Custom Messages
    procedure MsgAfterShow(var Msg: TMessage); message MSG_AFTER_SHOW;
  public
    constructor Create(AOwner: TComponent); override;
    property OnAfterShow: TNotifyEvent read FOnAfterShow write FOnAfterShow;
  end;

// -----------------------------------------------------------------------------
//
// TCustomWizardForm
//
// -----------------------------------------------------------------------------
type
  TCustomWizardForm = class(TWizardControlForm)
    ActionList1: TActionList;
    ActionMain: TAction;
    FrameWizard: TFrameWizard;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ActionMainExecute(Sender: TObject);
    procedure ActionMainUpdate(Sender: TObject);
  private
    function GetWizard: TdxWizardControl;
  public
    function Execute: boolean;
    property Wizard: TdxWizardControl read GetWizard;
  end;


// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

implementation

{$R *.dfm}

uses
  UxTheme,
  amDialogForm;


// -----------------------------------------------------------------------------
//
// TWizardControlForm
//
// -----------------------------------------------------------------------------
constructor TWizardControlForm.Create(AOwner: TComponent);

  function FindWizard(Control: TComponent): dxWizardControl.TdxWizardControl;
  var
    i: integer;
  begin
    Result := nil;
    if (Control is dxWizardControl.TdxWizardControl) then
      Exit(dxWizardControl.TdxWizardControl(Control));
    i := 0;
    while (Result = nil) and (i < Control.ComponentCount) do
    begin
      Result := FindWizard(Control.Components[i]);
      inc(i);
    end;
  end;

var
  Wizard: dxWizardControl.TdxWizardControl;
begin
  inherited;

  Wizard := FindWizard(Self);
  ASSERT(Wizard <> nil);

  if (not ApplyThemeFont('AeroWizard', AW_CONTENTAREA, Font)) then
    ParentFont := True;
  Font.Color := GetThemeColor('AeroWizard', AW_CONTENTAREA, Font.Color);

  if (not ApplyThemeFont('AeroWizard', AW_HEADERAREA, Wizard.Header.TitleFont)) then
  begin
    Wizard.Header.TitleFont.Assign(Font);
    Wizard.Header.TitleFont.Size := 12;
  end;
  Wizard.Header.TitleFont.Color := GetThemeColor('AeroWizard', AW_HEADERAREA, $00993300);

  if (not ApplyThemeTextFont(TEXT_INSTRUCTION, Wizard.Header.DescriptionFont)) then
    Wizard.Header.DescriptionFont.Assign(Font);
  Wizard.Header.DescriptionFont.Color := GetThemeTextColor(TEXT_INSTRUCTION, Wizard.Header.DescriptionFont.Color);

  if (not ApplyThemeFont('AeroWizard', AW_HEADERAREA, Wizard.OptionsViewStyleAero.Title.Font)) then
    Wizard.OptionsViewStyleAero.Title.Font.Assign(Font);
  Wizard.OptionsViewStyleAero.Title.Font.Style := [fsBold];
end;

// -----------------------------------------------------------------------------

procedure TWizardControlForm.DoShow;
begin
  if (Assigned(FOnAfterShow)) then
    PostMessage(Handle, MSG_AFTER_SHOW, 0, 0);

  inherited;
end;

// -----------------------------------------------------------------------------

procedure TWizardControlForm.MsgAfterShow(var Msg: TMessage);
begin
  if (Assigned(FOnAfterShow)) then
    FOnAfterShow(Self);
end;

// -----------------------------------------------------------------------------
//
// TCustomWizardForm
//
// -----------------------------------------------------------------------------

procedure TCustomWizardForm.ActionMainExecute(Sender: TObject);
begin
//
end;

procedure TCustomWizardForm.ActionMainUpdate(Sender: TObject);
begin
  FrameWizard.UpdateButtons;
end;

// -----------------------------------------------------------------------------

function TCustomWizardForm.Execute: boolean;
begin
  Result := (ShowModal = mrOK);
end;

// -----------------------------------------------------------------------------

procedure TCustomWizardForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
    FrameWizard.PerformCancel;
end;

// -----------------------------------------------------------------------------

procedure TCustomWizardForm.FormShow(Sender: TObject);
begin
  // Focus first control on active page
  if (Visible) then
    SelectNext(Wizard.ActivePage, True, True);
end;

// -----------------------------------------------------------------------------

function TCustomWizardForm.GetWizard: TdxWizardControl;
begin
  Result := FrameWizard.Wizard;
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

end.

