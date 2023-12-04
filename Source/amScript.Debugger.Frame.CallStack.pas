unit amScript.Debugger.Frame.CallStack;

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
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Menus, ActnList, ImgList,

  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  cxContainer, cxEdit, cxListView,

  dwsErrors,
  dwsSymbols,
{$ifndef OLD_DWSCRIPT}
  dwsScriptSource,
{$endif OLD_DWSCRIPT}

  amScript.Debugger.API;

type
  TFrame = TScriptDebuggerFrame;

  TScriptDebuggerCallStackFrame = class(TFrame)
    ListViewCallStack: TcxListView;
    procedure ListViewCallStackDblClick(Sender: TObject);
    procedure ListViewCallStackDeletion(Sender: TObject; Item: TListItem);
    procedure ListViewCallStackMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  strict private
    FCallStack: TdwsExprLocationArray;
    function GetImageIndex(Current: boolean; const ScriptPos: TScriptPos): integer;
    procedure UpdateInfo;

  strict protected
    // IScriptDebuggerWindow
    procedure Initialize(const ADebugger: IScriptDebugger; AImageList, AImageListSymbols: TCustomImageList); override;

  strict protected
    // IScriptDebuggerWindow
    procedure ScriptDebuggerNotification(Notification: TScriptDebuggerNotification); override;

  public
  end;

implementation

{$R *.dfm}

uses
  dwsUtils,
  dwsExprs,
  dwsDebugger;


{ TDwsIdeCallStackFrame }

procedure TScriptDebuggerCallStackFrame.Initialize(const ADebugger: IScriptDebugger; AImageList, AImageListSymbols: TCustomImageList);
begin
  inherited Initialize(ADebugger, AImageList, AImageListSymbols);

  UpdateInfo;
end;

procedure TScriptDebuggerCallStackFrame.ScriptDebuggerNotification(Notification: TScriptDebuggerNotification);
begin
  inherited;

  case Notification of
    dnDebugSuspended:
      UpdateInfo;
  else
    SetLength(FCallStack, 0);
    ListViewCallStack.Items.Clear;
  end;
end;

procedure TScriptDebuggerCallStackFrame.ListViewCallStackDblClick(Sender: TObject);
var
  ScriptPos: PScriptPos;
begin
  if (ListViewCallStack.Selected = nil) then
    Exit;

  if (ListViewCallStack.Selected.Data = nil) then
  begin
    Debugger.ViewScriptPos(Debugger.GetDebugger.CurrentScriptPos);
    Exit;
  end;

  ScriptPos := PScriptPos(ListViewCallStack.Selected.Data);

  if (ScriptPos <> nil) then
    Debugger.ViewScriptPos(ScriptPos^);
end;

procedure TScriptDebuggerCallStackFrame.ListViewCallStackDeletion(Sender: TObject; Item: TListItem);
var
  ScriptPos: PScriptPos;
begin
  if (Item <> nil) and (Item.Data <> nil) then
  begin
    ScriptPos := PScriptPos(Item.Data);
    Item.Data := nil;
    Dispose(ScriptPos);
  end;
end;

procedure TScriptDebuggerCallStackFrame.ListViewCallStackMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  ScriptPos: PScriptPos;
  BreakpointStatus: TBreakpointStatus;
begin
  if (ListViewCallStack.Selected = nil) or (ListViewCallStack.Selected.Data = nil) then
    Exit;

  if (htOnIcon in ListViewCallStack.GetHitTestInfoAt(X, Y)) then
  begin
    ScriptPos := PScriptPos(ListViewCallStack.Selected.Data);
    BreakpointStatus := Debugger.FindBreakPoint(ScriptPos^);
    if (BreakpointStatus = bpsNone) then
      Debugger.AddBreakpoint(ScriptPos^)
    else
      Debugger.ClearBreakpoint(ScriptPos^);

    ListViewCallStack.Selected.ImageIndex := GetImageIndex((ListViewCallStack.Selected.Index = 0), ScriptPos^);
  end;
end;

function TScriptDebuggerCallStackFrame.GetImageIndex(Current: boolean; const ScriptPos: TScriptPos): integer;
var
  BreakpointStatus: TBreakpointStatus;
begin
  BreakpointStatus := Debugger.FindBreakPoint(ScriptPos);
  if (Current) then
  begin
    case BreakpointStatus of
      bpsBreakpoint,
      bpsBreakpointDisabled:
        Result := 15;
    else
      Result := 16;
    end;
  end else
  begin
    case BreakpointStatus of
      bpsBreakpoint:
        Result := 12;
      bpsBreakpointDisabled:
        Result := 14;
    else
      Result := 13;
    end;
  end;
end;

procedure TScriptDebuggerCallStackFrame.UpdateInfo;

  function GetFunctionName(Prog: TdwsProgram) : string;
  begin
    if (Prog is TdwsProcedure) then
      Result := TdwsProcedure(Prog).Func.QualifiedName
    else
    if (Prog is TdwsMainProgram) then
      Result := '(main)'
    else
      Result := '(?)';
  end;

var
  i: integer;
  s: string;
  Exec: TdwsProgramExecution;
  RuntimeErrorMessage: TRuntimeErrorMessage;
  Item: TListItem;
  ScriptPos: PScriptPos;
begin
  SetLength(FCallStack, 0);

  ListViewCallStack.Items.BeginUpdate;
  try
    ListViewCallStack.Items.Clear;
    Exec := TdwsProgramExecution( Debugger.GetDebugger.Execution );
    if (Exec = nil) then
      exit;

    if (Exec.ProgramState = psReadyToRun) and (Exec.Msgs.HasErrors) then
    begin
      for i := 0 to Exec.Msgs.Count-1 do
        if (Exec.Msgs[i].IsError) then
          if (Exec.Msgs[i] is TRuntimeErrorMessage) then
          begin
            RuntimeErrorMessage := TRuntimeErrorMessage(Exec.Msgs[i]);
            FCallStack := RuntimeErrorMessage.CallStack;

            Item := ListViewCallStack.Items.Add;
            New(ScriptPos);
            ScriptPos^ := RuntimeErrorMessage.ScriptPos;
            Item.Data := ScriptPos;
            Item.Caption := '(current) ' + RuntimeErrorMessage.ScriptPos.AsInfo;
            Item.ImageIndex := GetImageIndex(True, ScriptPos^);
            break;
          end;
    end;

    if (Length(FCallStack) = 0) then
    begin
      Item := ListViewCallStack.Items.Add;
      New(ScriptPos);
      ScriptPos^ := Debugger.GetDebugger.CurrentScriptPos;
      Item.Data := ScriptPos;
      Item.Caption := '(current) ' + Debugger.GetDebugger.CurrentScriptPos.AsInfo;
      Item.ImageIndex := GetImageIndex(True, ScriptPos^);

      if (not Exec.CurrentProg.Expr.ScriptPos.SamePosAs(ScriptPos^)) then
      begin
        Item := ListViewCallStack.Items.Add;
        New(ScriptPos);
        ScriptPos^ := Exec.CurrentProg.Expr.ScriptPos;
        Item.Data := ScriptPos;
        Item.Caption := GetFunctionName(Exec.CurrentProg)  + ' ' + Exec.CurrentProg.Expr.ScriptPos.AsInfo;
        Item.ImageIndex := GetImageIndex(False, ScriptPos^);
      end;

      FCallStack := Exec.GetCallStack;
    end;

    for i := 0 to Length(FCallStack)-1 do
    begin
      s := GetFunctionName(TdwsProgram(FCallStack[i].Prog))  + ' ' + FCallStack[i].Expr.ScriptPos.AsInfo;
      if s <> '' then
      begin
        Item := ListViewCallStack.Items.Add;
        New(ScriptPos);
        ScriptPos^ := FCallStack[i].Expr.ScriptPos;
        Item.Data := ScriptPos;
        Item.Caption := s;
        Item.ImageIndex := GetImageIndex(False, ScriptPos^);
      end;
    end;
  finally
    ListViewCallStack.Items.EndUpdate;
  end;
end;

initialization
  RegisterClass(TScriptDebuggerCallStackFrame);
finalization
end.
