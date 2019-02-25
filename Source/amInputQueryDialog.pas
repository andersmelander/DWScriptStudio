unit amInputQueryDialog;

(*
 * Copyright © 2008 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, StdCtrls, Menus, ExtCtrls, System.Actions,

  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, cxControls, dxSkinscxPCPainter,
  cxContainer, cxEdit, dxLayoutcxEditAdapters, dxLayoutLookAndFeels, dxLayoutContainer, cxTextEdit, cxClasses,
  dxLayoutControl, cxButtons, cxMaskEdit, cxDropDownEdit,

  amDialogForm;

type
  TInputQueryKind = (iqEdit, iqCombo);

  TFormInputQuery = class(TCustomDialogForm)
    LayoutControlGroup_Root: TdxLayoutGroup;
    LayoutControl: TdxLayoutControl;
    LayoutItemEdit: TdxLayoutItem;
    EditValue: TcxTextEdit;
    LayoutLookAndFeelList: TdxLayoutLookAndFeelList;
    dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel;
    LayoutItemCombo: TdxLayoutItem;
    ComboBoxValue: TcxComboBox;
    LayoutEmptySpaceItem: TdxLayoutEmptySpaceItem;
  private
    FKind: TInputQueryKind;
  protected
    procedure DoAfterShow; override;

    function GetPrompt: string;
    function GetValue: string;
    procedure SetPrompt(const Value: string);
    procedure SetValue(const Value: string);
    function GetPasswordMode: boolean;
    procedure SetPasswordMode(const Value: boolean);
    procedure SetKind(const Value: TInputQueryKind);
  public
    property Prompt: string read GetPrompt write SetPrompt;
    property Value: string read GetValue write SetValue;
    property PasswordMode: boolean read GetPasswordMode write SetPasswordMode;
    property Kind: TInputQueryKind read FKind write SetKind;
    function Execute: boolean;
  end;

function InputBoxEx(const ACaption, APrompt, ADefault: string): string;
function InputQueryEx(const ACaption, APrompt: string; var Value: string): Boolean;
function InputPasswordEx(const ACaption, APrompt: string; var Value: string): Boolean;
function InputQueryExpressionEx(const ACaption, APrompt: string; var Value: string; Index: integer = -1): Boolean;
function InputQueryCombo(const ACaption, APrompt: string; var Value: string; Values: TStrings; FreeText: boolean = True): Boolean;

// Redirection of functions from Dialogs unit.
function InputBox(const ACaption, APrompt, ADefault: string): string;
function InputQuery(const ACaption, APrompt: string; var Value: string): Boolean;

implementation

{$R *.dfm}

uses
  StrUtils;

function InputBoxEx(const ACaption, APrompt, ADefault: string): string;
begin
  Result := ADefault;
  InputQueryEx(ACaption, APrompt, Result);
end;

function InputBox(const ACaption, APrompt, ADefault: string): string;
begin
  Result := ADefault;
  InputQueryEx(ACaption, APrompt, Result);
end;

function InputQuery(const ACaption, APrompt: string; var Value: string): Boolean;
begin
  Result := InputQueryEx(ACaption, APrompt, Value);
end;

function InputPasswordEx(const ACaption, APrompt: string; var Value: string): Boolean;
var
  FormInputQuery: TFormInputQuery;
begin
  FormInputQuery := TFormInputQuery.Create(nil);
  try
    FormInputQuery.Title := ACaption;
    FormInputQuery.Prompt := APrompt;
    FormInputQuery.Value := Value;
    FormInputQuery.PasswordMode := True;

    Result := FormInputQuery.Execute;

    if (Result) then
      Value := FormInputQuery.Value;
  finally
    FormInputQuery.Free;
  end;
end;

function InputQueryEx(const ACaption, APrompt: string; var Value: string): Boolean;
var
  FormInputQuery: TFormInputQuery;
begin
  FormInputQuery := TFormInputQuery.Create(nil);
  try
    FormInputQuery.Title := ACaption;
    FormInputQuery.Prompt := APrompt;
    FormInputQuery.Value := Value;

    Result := FormInputQuery.Execute;

    if (Result) then
      Value := FormInputQuery.Value;
  finally
    FormInputQuery.Free;
  end;
end;

function InputQueryCombo(const ACaption, APrompt: string; var Value: string; Values: TStrings; FreeText: boolean): Boolean;
var
  FormInputQuery: TFormInputQuery;
begin
  FormInputQuery := TFormInputQuery.Create(nil);
  try
    FormInputQuery.Kind := iqCombo;

    FormInputQuery.Title := ACaption;
    FormInputQuery.Prompt := APrompt;
    FormInputQuery.Value := Value;

    FormInputQuery.ComboBoxValue.Properties.Items.Assign(Values);
    if (FreeText) then
      FormInputQuery.ComboBoxValue.Properties.DropDownListStyle := lsEditList
    else
      FormInputQuery.ComboBoxValue.Properties.DropDownListStyle := lsEditFixedList;

    Result := FormInputQuery.Execute;

    if (Result) then
      Value := FormInputQuery.Value;
  finally
    FormInputQuery.Free;
  end;
end;

function InputQueryExpressionEx(const ACaption, APrompt: string; var Value: string; Index: integer): Boolean;
var
  FormInputQuery: TFormInputQuery;
begin
  FormInputQuery := TFormInputQuery.Create(nil);
  try
    FormInputQuery.Title := ACaption;
    FormInputQuery.Prompt := APrompt;
    FormInputQuery.Value := Value;
    FormInputQuery.EditValue.Style.Font.Name := 'Courier New';

    if (Index >= 0) then
    begin
      FormInputQuery.EditValue.Properties.AutoSelect := False;
      FormInputQuery.EditValue.SelStart := Index-1;
      // Yes, this silliness IS necessary. Without it the caret position is not set.
      FormInputQuery.EditValue.SelStart;
      FormInputQuery.EditValue.SelStart := Index-1;
    end;

    Result := FormInputQuery.Execute;

    if (Result) then
      Value := FormInputQuery.Value;
  finally
    FormInputQuery.Free;
  end;
end;

{ TFormInputQuery }

procedure TFormInputQuery.DoAfterShow;
begin
  inherited;
//  AutoSize := False;
//  AutoSize := True;
end;

function TFormInputQuery.Execute: boolean;
begin
  LayoutControl.AutoControlTabOrders := False; // Required for use of SelectFirst before control has been shown
  SelectFirst;
  Result := (ShowModal = mrOK);
end;

function TFormInputQuery.GetPasswordMode: boolean;
begin
  Result := (EditValue.Properties.EchoMode = eemPassword);
end;

function TFormInputQuery.GetPrompt: string;
begin
  Result := LayoutItemEdit.CaptionOptions.Text;
end;

function TFormInputQuery.GetValue: string;
begin
  if (FKind = iqEdit) then
    Result := EditValue.Text
  else
    Result := ComboBoxValue.Text;
end;

procedure TFormInputQuery.SetKind(const Value: TInputQueryKind);
begin
  if (FKind = Value) then
    exit;

  FKind := Value;

  LayoutItemEdit.Visible := (FKind = iqEdit);
  LayoutItemCombo.Visible := (FKind = iqCombo);
end;

procedure TFormInputQuery.SetPasswordMode(const Value: boolean);
begin
  if (Value) then
  begin
    EditValue.Properties.PasswordChar := '*';
    ComboBoxValue.Properties.PasswordChar := '*';
    EditValue.Properties.EchoMode := eemPassword;
    ComboBoxValue.Properties.EchoMode := eemPassword;
  end else
  begin
    EditValue.Properties.PasswordChar := #0;
    ComboBoxValue.Properties.PasswordChar := #0;
    EditValue.Properties.EchoMode := eemNormal;
    ComboBoxValue.Properties.EchoMode := eemNormal;
  end;
end;

procedure TFormInputQuery.SetPrompt(const Value: string);
begin
  if (RightStr(Value, 1) = ':') then
  begin
    LayoutItemEdit.CaptionOptions.Text := Value;
    LayoutItemCombo.CaptionOptions.Text := Value;
  end else
  begin
    LayoutItemEdit.CaptionOptions.Text := Value + ':';
    LayoutItemCombo.CaptionOptions.Text := Value + ':';
  end;
end;

procedure TFormInputQuery.SetValue(const Value: string);
begin
  EditValue.Text := Value;
  ComboBoxValue.Text := Value;
end;

end.

