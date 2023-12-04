unit amScript.Debugger.Dialog.Evaluate;

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
  Dialogs, ExtCtrls, Buttons, Menus, StdCtrls, cxButtons, ActnList, ImgList,
  System.ImageList, System.Actions,

  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinscxPCPainter, cxContainer,
  cxEdit, dxLayoutcxEditAdapters, cxMemo, dxLayoutContainer, cxTextEdit, dxLayoutControl, cxClasses, cxImageList,

  dwsErrors,
  dwsCompiler,
{$ifndef OLD_DWSCRIPT}
  dwsEvaluate,
  dwsScriptSource,
{$endif OLD_DWSCRIPT}

  amScript.Debugger.API;

type
  TFormDebugEvaluate = class(TForm)
    Panel1: TPanel;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    EditExpression: TcxTextEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    MemoValue: TcxMemo;
    dxLayoutControl1Item2: TdxLayoutItem;
    EditNewValue: TcxTextEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    ActionList1: TActionList;
    cxImageList1: TcxImageList;
    ActionEvaluate: TAction;
    ActionModify: TAction;
    ActionWatch: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    procedure EditExpressionKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditNewValueKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ActionEvaluateExecute(Sender: TObject);
    procedure ActionModifyExecute(Sender: TObject);
    procedure ActionWatchExecute(Sender: TObject);
    procedure ActionEvaluateUpdate(Sender: TObject);
    procedure ActionModifyUpdate(Sender: TObject);
    procedure ActionWatchUpdate(Sender: TObject);
    procedure EditExpressionPropertiesChange(Sender: TObject);
  private
    FIDE: IScriptDebugger;
    FEvaluator: IdwsEvaluateExpr;

    function GetExpression: string;
  protected
    procedure DoEvaluate(const AScriptPos: PScriptPos = nil);
    property IDE: IScriptDebugger read FIDE;
    property Expression: string read GetExpression;
  public
    procedure Initialize(const AIDE: IScriptDebugger);
    procedure Evaluate(const AExpression: string; ScriptPos: PScriptPos = nil);
  end;

implementation

{$R *.dfm}

uses
  dwsExprs,
  dwsDataContext,
  dwsInfo,
{$ifndef OLD_DWSCRIPT}
  dwsInfoClasses,
{$endif OLD_DWSCRIPT}
  dwsSymbols;

{ TFormDebugEvaluate }

procedure TFormDebugEvaluate.ActionEvaluateExecute(Sender: TObject);
begin
  DoEvaluate;
end;

procedure TFormDebugEvaluate.ActionEvaluateUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (Expression <> '');
end;

procedure TFormDebugEvaluate.ActionModifyExecute(Sender: TObject);
begin
  if (not EditNewValue.Enabled) or (FEvaluator = nil) then
    exit;

  FEvaluator.Expression.AssignValueAsString(IDE.GetDebugger.Execution.ExecutionObject, EditNewValue.Text);
  DoEvaluate;
end;

procedure TFormDebugEvaluate.ActionModifyUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (FEvaluator <> nil);
end;

procedure TFormDebugEvaluate.ActionWatchExecute(Sender: TObject);
begin
  IDE.AddWatch(Expression);
end;

procedure TFormDebugEvaluate.ActionWatchUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (Expression <> '');
end;

procedure TFormDebugEvaluate.DoEvaluate(const AScriptPos: PScriptPos);
var
  Value: string;
  Evaluator: IdwsEvaluateExpr;
  ValueInfo: IInfo;
  Data: TData;
  ScriptPos: TScriptPos;
begin
  EditNewValue.Enabled := False;
  FEvaluator := nil;
  MemoValue.Text := '';
  EditNewValue.Text := '';

  if (Expression = '') then
    exit;

  if (AScriptPos <> nil) then
    ScriptPos := AScriptPos^
  else
    ScriptPos := IDE.GetDebugger.CurrentScriptPos;

//  Evaluator := TdwsCompiler.Evaluate(IDE.DwsIde_GetDebugger.Execution, Expression, [], @ScriptPos);
  Evaluator := IDE.GetDebugger.Evaluate(Expression, @ScriptPos);
  if (Evaluator = nil) then
    exit;

  if (Evaluator.EvaluationError) then
  begin
    MemoValue.Text := '(Unable to evaluate expression)';
    exit;
  end;

  SetLength(Data, 1);
  Evaluator.Expression.EvalAsVariant(IDE.GetDebugger.Execution.ExecutionObject, Data[0]);

  if (Evaluator.Expression.Typ = nil) then
  begin
    MemoValue.Text := '(Expression has no value)';
    exit;
  end;

  CreateInfoOnSymbol(ValueInfo, IDE.GetDebugger.Execution.Info, Evaluator.Expression.Typ, Data, 0);

  Value := ValueInfo.ValueAsString;
  MemoValue.Text := Value;

  if (Evaluator.Expression is TDataExpr) and (TDataExpr(Evaluator.Expression).IsWritable) then
  begin
    if (Evaluator.Expression.Typ is TBaseSymbol) then
    begin
      EditNewValue.Text := Value;
      EditNewValue.Enabled := True;
      FEvaluator := Evaluator;

    end else
      EditNewValue.Text := '(Expression can not be modified)';
  end else
    EditNewValue.Text := '(Expression is read-only)';
end;

procedure TFormDebugEvaluate.EditExpressionKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    Key := 0;
    ActionEvaluate.Execute;
  end;
end;

procedure TFormDebugEvaluate.EditExpressionPropertiesChange(Sender: TObject);
begin
  EditNewValue.Text := '';
  MemoValue.Text := '';
  FEvaluator := nil;
end;

procedure TFormDebugEvaluate.EditNewValueKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    Key := 0;
    ActionModify.Execute;
  end;
end;

procedure TFormDebugEvaluate.Evaluate(const AExpression: string; ScriptPos: PScriptPos);
begin
  EditExpression.Text := AExpression;
  ActiveControl := EditExpression;

  DoEvaluate(ScriptPos);

  Show;
end;

procedure TFormDebugEvaluate.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
  begin
    Key := #0;
    Hide;
  end;
end;

function TFormDebugEvaluate.GetExpression: string;
begin
  Result := EditExpression.Text;
end;

procedure TFormDebugEvaluate.Initialize(const AIDE: IScriptDebugger);
begin
  FIDE := AIDE;
end;

end.

