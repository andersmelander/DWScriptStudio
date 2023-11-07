unit amScriptDebuggerFrameWatches;

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
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Menus, ActnList, ImgList, System.Actions,

  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxFilter, cxCustomData,
  cxStyles, dxScrollbarAnnotations, cxTL, cxTextEdit, cxTLdxBarBuiltInMenu, cxInplaceContainer,

  dwsSymbols,

  amScriptDebuggerAPI,
  amScriptDebuggerInfoEvaluationBuilder;

type
  TFrame = TScriptDebuggerFrame;

  TScriptDebuggerWatchesFrame = class(TFrame)
    actAddWatch: TAction;
    actDeleteWatch: TAction;
    actEditWatch: TAction;
    ActionList: TActionList;
    MenuItemAddWatch: TMenuItem;
    MenuItemDeleteWatch: TMenuItem;
    MenuItemEditWatch: TMenuItem;
    WatchWindowPopupMenu: TPopupMenu;
    TreeListWatches: TcxTreeList;
    TreeListWatchesColumnExpression: TcxTreeListColumn;
    TreeListWatchesColumnValue: TcxTreeListColumn;
    TreeListWatchesColumnType: TcxTreeListColumn;
    TreeListWatchesColumnScope: TcxTreeListColumn;
    procedure actDeleteWatchExecute(Sender: TObject);
    procedure actDeleteWatchUpdate(Sender: TObject);
    procedure actAddWatchExecute(Sender: TObject);
    procedure actEditWatchExecute(Sender: TObject);
    procedure actEditWatchUpdate(Sender: TObject);
    procedure TreeListWatchesExpanding(Sender: TcxCustomTreeList; ANode: TcxTreeListNode; var Allow: Boolean);
    procedure TreeListWatchesDblClick(Sender: TObject);
    procedure TreeListWatchesEnter(Sender: TObject);
    procedure TreeListWatchesExit(Sender: TObject);
  private
    FEvaluationBuilder: TInfoEvaluationBuilder;
    FVisibilities: TdwsVisibilities;
    FInspectOptions: TInspectOptions;
  protected
    function  CurrentWatchIndex : integer;

    procedure Initialize(const ADebugger: IScriptDebugger; AImageList, AImageListSymbols: TCustomImageList); override;
    procedure Finalize; override;
    procedure DebuggerStateChanged(State: TScriptDebuggerNotification); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure UpdateInfo;
  end;

implementation

{$R *.dfm}

uses
  dwsUtils,
  dwsExprs,
  dwsDebugger,
  amInputQueryDialog;


{ TfrmDwsIdeWatchesFrame }

constructor TScriptDebuggerWatchesFrame.Create(AOwner: TComponent);
begin
  inherited;

  FEvaluationBuilder := TInfoEvaluationBuilder.Create(TreeListWatches);

  FEvaluationBuilder.InspectOptions := FEvaluationBuilder.InspectOptions + [ioShowFields, ioShowProperties];

  FVisibilities := FEvaluationBuilder.Visibilities;
  FInspectOptions := FEvaluationBuilder.InspectOptions;
end;

destructor TScriptDebuggerWatchesFrame.Destroy;
begin
  FEvaluationBuilder.Free;
  inherited;
end;

procedure TScriptDebuggerWatchesFrame.actAddWatchExecute(Sender: TObject);
var
  S : string;
begin
  S := '';
  if InputQueryEx( 'Add Watch', 'Enter watch expression', S ) then
  begin
    Debugger.GetDebugger.Watches.Add( S );
    UpdateInfo;
  end;
end;

procedure TScriptDebuggerWatchesFrame.actDeleteWatchExecute(Sender: TObject);
var
  I : integer;
  Watch : TdwsDebuggerWatch;
begin
  I := CurrentWatchIndex;
  if I >= 0 then
  begin
    Watch := Debugger.GetDebugger.Watches[I];
    Debugger.GetDebugger.Watches.Extract( Watch );
    Watch.Free;
    UpdateInfo;
  end;
end;

procedure TScriptDebuggerWatchesFrame.actDeleteWatchUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (TreeListWatches.FocusedNode <> nil);
end;

procedure TScriptDebuggerWatchesFrame.actEditWatchExecute(Sender: TObject);
var
  I : integer;
  S : string;
begin
  I := CurrentWatchIndex;
  if I >= 0 then
  begin
    S := Debugger.GetDebugger.Watches[I].ExpressionText;
    if InputQueryEx( 'Edit watch', 'Edit Expression', S ) then
    begin
      Debugger.GetDebugger.Watches[I].ExpressionText := S;
      UpdateInfo;
    end;
  end;
end;

procedure TScriptDebuggerWatchesFrame.actEditWatchUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (TreeListWatches.FocusedNode <> nil);
end;

function TScriptDebuggerWatchesFrame.CurrentWatchIndex: integer;
begin
  if (TreeListWatches.FocusedNode <> nil) then
    Result := TreeListWatches.FocusedNode.Index
  else
    Result := -1;
end;


procedure TScriptDebuggerWatchesFrame.DebuggerStateChanged(State: TScriptDebuggerNotification);
begin
  case State of
    dnDebugSuspended,
    dnUpdateWatches:
      UpdateInfo;
  else
//    lvWatches.Items.Clear;
  end;
end;

procedure TScriptDebuggerWatchesFrame.Finalize;
begin
  inherited;
end;

procedure TScriptDebuggerWatchesFrame.Initialize(const ADebugger: IScriptDebugger; AImageList, AImageListSymbols: TCustomImageList);
begin
  inherited Initialize(ADebugger, AImageList, AImageListSymbols);

  FEvaluationBuilder.Initialize(ADebugger);

  TreeListWatches.Images := AImageListSymbols;

  UpdateInfo;
end;

procedure TScriptDebuggerWatchesFrame.TreeListWatchesDblClick(Sender: TObject);
begin
  actEditWatch.Execute;
end;

procedure TScriptDebuggerWatchesFrame.TreeListWatchesEnter(Sender: TObject);
begin
  ActionList.State := asNormal;
end;

procedure TScriptDebuggerWatchesFrame.TreeListWatchesExit(Sender: TObject);
begin
  ActionList.State := asSuspended;
end;

procedure TScriptDebuggerWatchesFrame.TreeListWatchesExpanding(Sender: TcxCustomTreeList; ANode: TcxTreeListNode;
  var Allow: Boolean);
begin
  FEvaluationBuilder.PopulateNode(ANode);
end;

procedure TScriptDebuggerWatchesFrame.UpdateInfo;
begin
  var Watches := Debugger.GetDebugger.Watches;

  Watches.Update;

  FEvaluationBuilder.BeginUpdate;
  try
    for var i  := 0 to Watches.Count-1 do
    begin
      var Watch := Watches[i];

      var ErrorText := '';
      case Watch.EvaluationError of
        dweeCompile:
          ErrorText := '(compilation error)';

        dweeEvaluation:
          ErrorText := '(evaluation error)';
      end;

      FEvaluationBuilder.EvaluateExpression(Watch.Evaluator, Watch.ValueInfo, Watch.ExpressionText);

      Watch.ClearEvaluator;
    end;

    FEvaluationBuilder.PurgeUnusedNodes;
  finally
    FEvaluationBuilder.EndUpdate;
  end;
end;

initialization
  RegisterClass(TScriptDebuggerWatchesFrame);
finalization
end.
