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

  amScript.Editor.API;

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
    function GetOptions: TSearchReplaceOptions;
    function GetSearchText: string;
    procedure SetSearchText(const Value: string);
    function GetHistory: string;
    procedure SetHistory(const Value: string);
    procedure SetOptions(const Value: TSearchReplaceOptions);
    function GetAutoWrap: boolean;
    procedure SetAutoWrap(const Value: boolean);
  public
    function Execute: boolean;
    property SearchText: string read GetSearchText write SetSearchText;
    property Options: TSearchReplaceOptions read GetOptions write SetOptions;
    property History: string read GetHistory write SetHistory;
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

function TFormScriptDebuggerSearch.GetOptions: TSearchReplaceOptions;
begin
  Result := [];
  if (CheckBoxOptionRegularExpression.Checked) then
    Include(Result, srRegEx);
  if (CheckBoxOptionCaseSensitive.Checked) then
    Include(Result, srMatchCase);
  if (CheckBoxOptionWholeWords.Checked) then
    Include(Result, srWholeWord);
  if (CheckBoxOptionSelectedOnly.Checked) then
    Include(Result, srSelectedOnly);
  if (boolean(RadioGroupScope.EditValue)) then
    Include(Result, srEntireScope);
  if (boolean(RadioGroupDirection.EditValue)) then
    Include(Result, srBackwards);
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

procedure TFormScriptDebuggerSearch.SetOptions(const Value: TSearchReplaceOptions);
begin
  CheckBoxOptionRegularExpression.Checked := (srRegEx in Value);
  CheckBoxOptionCaseSensitive.Checked := (srMatchCase in Value);
  CheckBoxOptionWholeWords.Checked := (srWholeWord in Value);
  CheckBoxOptionSelectedOnly.Checked := (srSelectedOnly in Value);
  RadioGroupScope.EditValue := (srEntireScope in Value);
  RadioGroupDirection.EditValue := (srBackwards in Options);
end;

procedure TFormScriptDebuggerSearch.SetSearchText(const Value: string);
begin
  EditSearchText.Text := Value;
end;

end.

