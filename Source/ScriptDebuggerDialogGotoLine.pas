unit ScriptDebuggerDialogGotoLine;

(*
 * Copyright © 2011 Brian Frost
 * Copyright © 2019 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxButtons;

type
  TDwsIdeGotoLineNumber = class(TForm)
    ButtonCancel: TcxButton;
    ButtonOK: TcxButton;
    Panel1: TPanel;
    LabelLineNumber: TLabel;
    ComboBoxLineNumber: TcxComboBox;
    procedure ComboBoxLineNumberKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function GetLineNumber: Integer;
  public
    property LineNumber: Integer read GetLineNumber;
  end;

implementation

{$R *.dfm}

procedure TDwsIdeGotoLineNumber.ComboBoxLineNumberKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, ['0'..'9']) then
    Key := #0;
end;

procedure TDwsIdeGotoLineNumber.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = mrOk then
    ComboBoxLineNumber.Properties.Items.Add(ComboBoxLineNumber.Text);
end;

function TDwsIdeGotoLineNumber.GetLineNumber: Integer;
begin
  Result := StrToIntDef(ComboBoxLineNumber.Text, 0);
end;

end.

