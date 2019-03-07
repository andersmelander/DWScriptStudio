unit amScriptDebuggerDialogSearch;

(*
 * Copyright © 2019 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, ActnList, System.Actions,

  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, cxCheckBox, cxGroupBox, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLabel, cxButtons, cxRadioGroup,
  cxMRUEdit,

  SynEditTypes;

type
  TFormScriptDebuggerSearch = class(TForm)
    LabelSearchText: TcxLabel;
    EditSearchText: TcxMRUEdit;
    RadioGroupDirection: TcxRadioGroup;
    GroupBoxOptions: TcxGroupBox;
    CheckBoxOptionCaseSensitive: TcxCheckBox;
    CheckBoxOptionWholeWords: TcxCheckBox;
    CheckBoxOptionSelectedOnly: TcxCheckBox;
    ButtonOK: TcxButton;
    ButtonCancel: TcxButton;
    CheckBoxOptionRegularExpression: TcxCheckBox;
    RadioGroupScope: TcxRadioGroup;
    ActionList1: TActionList;
    ActionOK: TAction;
    ActionCancel: TAction;
    CheckBoxOptionWrap: TcxCheckBox;
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionOKUpdate(Sender: TObject);
  private
    function GetOptions: TSynSearchOptions;
    function GetSearchText: string;
    procedure SetSearchText(const Value: string);
    function GetRegularExpression: boolean;
    function GetHistory: string;
    procedure SetHistory(const Value: string);
    procedure SetOptions(const Value: TSynSearchOptions);
    procedure SetRegularExpression(const Value: boolean);
    function GetAutoWrap: boolean;
    procedure SetAutoWrap(const Value: boolean);
  public
    function Execute: boolean;
    property SearchText: string read GetSearchText write SetSearchText;
    property Options: TSynSearchOptions read GetOptions write SetOptions;
    property History: string read GetHistory write SetHistory;
    property RegularExpression: boolean read GetRegularExpression write SetRegularExpression;
    property AutoWrap: boolean read GetAutoWrap write SetAutoWrap;
  end;

implementation

{$R *.dfm}

{ TFormScriptDebuggerSearch }

procedure TFormScriptDebuggerSearch.ActionCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFormScriptDebuggerSearch.ActionOKExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TFormScriptDebuggerSearch.ActionOKUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (EditSearchText.Text <> '');
end;

function TFormScriptDebuggerSearch.Execute: boolean;
begin
  Result := (ShowModal = mrOK);

  if (Result) then
    EditSearchText.AddItem(EditSearchText.Text);
end;

function TFormScriptDebuggerSearch.GetAutoWrap: boolean;
begin
  Result := CheckBoxOptionWrap.Checked;
end;

function TFormScriptDebuggerSearch.GetHistory: string;
begin
  Result := EditSearchText.Properties.LookupItems.Text;
end;

function TFormScriptDebuggerSearch.GetOptions: TSynSearchOptions;
begin
  Result := [];
  if (CheckBoxOptionCaseSensitive.Checked) then
    Include(Result, ssoMatchCase);
  if (CheckBoxOptionWholeWords.Checked) then
    Include(Result, ssoWholeWord);
  if (CheckBoxOptionSelectedOnly.Checked) then
    Include(Result, ssoSelectedOnly);
  if (boolean(RadioGroupScope.EditValue)) then
    Include(Result, ssoEntireScope);
  if (boolean(RadioGroupDirection.EditValue)) then
    Include(Result, ssoBackwards);
end;

function TFormScriptDebuggerSearch.GetRegularExpression: boolean;
begin
  Result := (CheckBoxOptionRegularExpression.Checked);
end;

function TFormScriptDebuggerSearch.GetSearchText: string;
begin
  Result := EditSearchText.Text;
end;

procedure TFormScriptDebuggerSearch.SetAutoWrap(const Value: boolean);
begin
  CheckBoxOptionWrap.Checked := Value;
end;

procedure TFormScriptDebuggerSearch.SetHistory(const Value: string);
begin
  EditSearchText.Properties.LookupItems.Text := Value;
end;

procedure TFormScriptDebuggerSearch.SetOptions(const Value: TSynSearchOptions);
begin
  CheckBoxOptionCaseSensitive.Checked := (ssoMatchCase in Value);
  CheckBoxOptionWholeWords.Checked := (ssoWholeWord in Value);
  CheckBoxOptionSelectedOnly.Checked := (ssoSelectedOnly in Value);
  RadioGroupScope.EditValue := (ssoEntireScope in Value);
  RadioGroupDirection.EditValue := (ssoBackwards in Options);
end;

procedure TFormScriptDebuggerSearch.SetRegularExpression(const Value: boolean);
begin
  CheckBoxOptionRegularExpression.Checked := Value;
end;

procedure TFormScriptDebuggerSearch.SetSearchText(const Value: string);
begin
  EditSearchText.Text := Value;
end;

end.

