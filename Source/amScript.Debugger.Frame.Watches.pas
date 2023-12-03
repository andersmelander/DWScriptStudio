unit amScript.Debugger.Frame.Watches;

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
  cxStyles, dxScrollbarAnnotations, cxTL, cxTextEdit, cxTLdxBarBuiltInMenu, cxInplaceContainer, dxBar, cxClasses,

  dwsSymbols,

  amScript.Debugger.API,
  amScript.Debugger.InfoEvaluationBuilder;

// -----------------------------------------------------------------------------
//
// TScriptDebuggerWatchesFrame
//
// -----------------------------------------------------------------------------
type
  TFrame = TScriptDebuggerFrame;

  TScriptDebuggerWatchesFrame = class(TFrame)
    ActionWatchAdd: TAction;
    ActionWatchDelete: TAction;
    ActionWatchEdit: TAction;
    TreeListWatches: TcxTreeList;
    TreeListWatchesColumnExpression: TcxTreeListColumn;
    TreeListWatchesColumnValue: TcxTreeListColumn;
    TreeListWatchesColumnType: TcxTreeListColumn;
    TreeListWatchesColumnScope: TcxTreeListColumn;
    PopupMenu: TdxBarPopupMenu;
    BarManager: TdxBarManager;
    dxBarSeparator1: TdxBarSeparator;
    MenuItemScopePublished: TdxBarButton;
    MenuItemScopePublic: TdxBarButton;
    MenuItemScopeProtected: TdxBarButton;
    MenuItemScopePrivate: TdxBarButton;
    dxBarSeparator2: TdxBarSeparator;
    MenuItemMembersInherited: TdxBarButton;
    MenuItemMembersProperties: TdxBarButton;
    MenuItemMembersPropertyGetters: TdxBarButton;
    MenuItemMembersFields: TdxBarButton;
    MenuItemWatchAdd: TdxBarButton;
    MenuItemWatchDelete: TdxBarButton;
    ActionList: TActionList;
    ActionViewMemberFields: TAction;
    ActionViewMemberProperties: TAction;
    ActionViewMemberPropertySideEffects: TAction;
    ActionViewMemberInherited: TAction;
    ActionViewScopePublished: TAction;
    ActionViewScopePublic: TAction;
    ActionViewScopeProtected: TAction;
    ActionViewScopePrivate: TAction;
    MenuItemWatchEdit: TdxBarButton;
    procedure TreeListWatchesExpanding(Sender: TcxCustomTreeList; ANode: TcxTreeListNode; var Allow: Boolean);
    procedure TreeListWatchesDblClick(Sender: TObject);
    procedure ActionWatchDeleteExecute(Sender: TObject);
    procedure ActionWatchDeleteUpdate(Sender: TObject);
    procedure ActionWatchAddExecute(Sender: TObject);
    procedure ActionWatchEditExecute(Sender: TObject);
    procedure ActionWatchEditUpdate(Sender: TObject);
    procedure ActionViewMemberFieldsExecute(Sender: TObject);
    procedure ActionViewMemberPropertiesExecute(Sender: TObject);
    procedure ActionViewMemberPropertySideEffectsExecute(Sender: TObject);
    procedure ActionViewMemberFieldsUpdate(Sender: TObject);
    procedure ActionViewMemberPropertiesUpdate(Sender: TObject);
    procedure ActionViewMemberPropertySideEffectsUpdate(Sender: TObject);
    procedure ActionViewMemberInheritedExecute(Sender: TObject);
    procedure ActionViewMemberInheritedUpdate(Sender: TObject);
    procedure ActionViewScopeExecute(Sender: TObject);
    procedure ActionViewScopeUpdate(Sender: TObject);
    procedure ActionViewScopeGlobalExecute(Sender: TObject);
    procedure ActionViewScopeGlobalUpdate(Sender: TObject);
  private
    FEvaluationBuilder: TInfoEvaluationBuilder;
    FVisibilities: TdwsVisibilities;
    FInspectOptions: TInspectOptions;
  protected
    function CurrentWatchIndex: integer;

    procedure Initialize(const ADebugger: IScriptDebugger; AImageList, AImageListSymbols: TCustomImageList); override;
    procedure DebuggerStateChanged(State: TScriptDebuggerNotification); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure UpdateInfo;
  end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

implementation

{$R *.dfm}

uses
  dwsUtils,
  dwsExprs,
  dwsDebugger,
  amInputQueryDialog;


// -----------------------------------------------------------------------------
//
// TScriptDebuggerWatchesFrame
//
// -----------------------------------------------------------------------------
constructor TScriptDebuggerWatchesFrame.Create(AOwner: TComponent);
begin
  inherited;

  FEvaluationBuilder := TInfoEvaluationBuilder.Create(TreeListWatches);

//  FEvaluationBuilder.InspectOptions := FEvaluationBuilder.InspectOptions + [ioShowFields, ioShowProperties];

  FVisibilities := FEvaluationBuilder.Visibilities;
  FInspectOptions := FEvaluationBuilder.InspectOptions;
end;

destructor TScriptDebuggerWatchesFrame.Destroy;
begin
  FEvaluationBuilder.Free;
  inherited;
end;

// -----------------------------------------------------------------------------

procedure TScriptDebuggerWatchesFrame.Initialize(const ADebugger: IScriptDebugger; AImageList, AImageListSymbols: TCustomImageList);
begin
  inherited Initialize(ADebugger, AImageList, AImageListSymbols);

  FEvaluationBuilder.Initialize(ADebugger);

  TreeListWatches.Images := AImageListSymbols;

  UpdateInfo;
end;

// -----------------------------------------------------------------------------

function TScriptDebuggerWatchesFrame.CurrentWatchIndex: integer;
begin
  if (TreeListWatches.FocusedNode <> nil) and (TreeListWatches.FocusedNode.Parent = nil) then
    Result := TreeListWatches.FocusedNode.Index
  else
    Result := -1;
end;

// -----------------------------------------------------------------------------

procedure TScriptDebuggerWatchesFrame.ActionWatchAddExecute(Sender: TObject);
begin
  var Expression := '';
  if InputQueryEx('Add Watch', 'Enter watch expression', Expression) then
  begin
    Debugger.GetDebugger.Watches.Add( Expression );
    UpdateInfo;
  end;
end;

// -----------------------------------------------------------------------------

procedure TScriptDebuggerWatchesFrame.ActionWatchDeleteExecute(Sender: TObject);
begin
  var i := CurrentWatchIndex;
  if (i < 0) then
    exit;

  var Watch := Debugger.GetDebugger.Watches[i];
  Debugger.GetDebugger.Watches.Extract(Watch);
  Watch.Free;

  UpdateInfo;
end;

procedure TScriptDebuggerWatchesFrame.ActionWatchDeleteUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (TreeListWatches.FocusedNode <> nil) and (TreeListWatches.FocusedNode.Parent = nil);
end;

// -----------------------------------------------------------------------------

procedure TScriptDebuggerWatchesFrame.ActionWatchEditExecute(Sender: TObject);
begin
  var i := CurrentWatchIndex;
  if i >= 0 then
  begin
    var Expression := Debugger.GetDebugger.Watches[i].ExpressionText;

    if InputQueryEx('Edit watch', 'Edit Expression', Expression) then
    begin
      Debugger.GetDebugger.Watches[i].ExpressionText := Expression;
      UpdateInfo;
    end;
  end;
end;

procedure TScriptDebuggerWatchesFrame.ActionWatchEditUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (TreeListWatches.FocusedNode <> nil) and (TreeListWatches.FocusedNode.Parent = nil);
end;

// -----------------------------------------------------------------------------

procedure TScriptDebuggerWatchesFrame.DebuggerStateChanged(State: TScriptDebuggerNotification);
begin
  case State of
    dnDebugSuspended,
    dnUpdateWatches:
      UpdateInfo;
  end;
end;

// -----------------------------------------------------------------------------

procedure TScriptDebuggerWatchesFrame.TreeListWatchesDblClick(Sender: TObject);
begin
  ActionWatchEdit.Execute;
end;

procedure TScriptDebuggerWatchesFrame.TreeListWatchesExpanding(Sender: TcxCustomTreeList; ANode: TcxTreeListNode;
  var Allow: Boolean);
begin
  FEvaluationBuilder.PopulateNode(ANode);
end;

// -----------------------------------------------------------------------------

procedure TScriptDebuggerWatchesFrame.ActionViewMemberFieldsExecute(Sender: TObject);
begin
  if (TAction(Sender).Checked) then
    Include(FInspectOptions, ioShowFields)
  else
    Exclude(FInspectOptions, ioShowFields);
  FEvaluationBuilder.InspectOptions := FInspectOptions;
  UpdateInfo;
end;

procedure TScriptDebuggerWatchesFrame.ActionViewMemberFieldsUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := (ioShowFields in FInspectOptions);
end;

procedure TScriptDebuggerWatchesFrame.ActionViewMemberInheritedExecute(Sender: TObject);
begin
  if (TAction(Sender).Checked) then
    Include(FInspectOptions, ioShowInherited)
  else
    Exclude(FInspectOptions, ioShowInherited);

  FEvaluationBuilder.BeginUpdate;
  try
    FEvaluationBuilder.InspectOptions := FInspectOptions;
    UpdateInfo;
  finally
    FEvaluationBuilder.EndUpdate;
  end;
end;

procedure TScriptDebuggerWatchesFrame.ActionViewMemberInheritedUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := (ioShowInherited in FInspectOptions);
end;

procedure TScriptDebuggerWatchesFrame.ActionViewMemberPropertiesExecute(Sender: TObject);
begin
  if (TAction(Sender).Checked) then
    Include(FInspectOptions, ioShowProperties)
  else
    Exclude(FInspectOptions, ioShowProperties);

  FEvaluationBuilder.BeginUpdate;
  try
    FEvaluationBuilder.InspectOptions := FInspectOptions;
    UpdateInfo;
  finally
    FEvaluationBuilder.EndUpdate;
  end;
end;

procedure TScriptDebuggerWatchesFrame.ActionViewMemberPropertiesUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := (ioShowProperties in FInspectOptions);
end;

procedure TScriptDebuggerWatchesFrame.ActionViewMemberPropertySideEffectsExecute(Sender: TObject);
begin
  if (TAction(Sender).Checked) then
    Include(FInspectOptions, ioAllowPropertySideEffects)
  else
    Exclude(FInspectOptions, ioAllowPropertySideEffects);

  FEvaluationBuilder.BeginUpdate;
  try
    FEvaluationBuilder.InspectOptions := FInspectOptions;
    UpdateInfo;
  finally
    FEvaluationBuilder.EndUpdate;
  end;
end;

procedure TScriptDebuggerWatchesFrame.ActionViewMemberPropertySideEffectsUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := (ioAllowPropertySideEffects in FInspectOptions);
  TAction(Sender).Enabled := (ioShowProperties in FInspectOptions);
end;

procedure TScriptDebuggerWatchesFrame.ActionViewScopeGlobalExecute(Sender: TObject);
begin
  if (TAction(Sender).Checked) then
    Include(FInspectOptions, ioShowGlobal)
  else
    Exclude(FInspectOptions, ioShowGlobal);

  FEvaluationBuilder.BeginUpdate;
  try
    FEvaluationBuilder.InspectOptions := FInspectOptions;
    UpdateInfo;
  finally
    FEvaluationBuilder.EndUpdate;
  end;
end;

procedure TScriptDebuggerWatchesFrame.ActionViewScopeGlobalUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := (ioShowGlobal in FInspectOptions);
end;

procedure TScriptDebuggerWatchesFrame.ActionViewScopeExecute(Sender: TObject);
var
  Visibility: TdwsVisibility;
begin
  Visibility := TdwsVisibility(TAction(Sender).Tag);
  if (TAction(Sender).Checked) then
    Include(FVisibilities, Visibility)
  else
    Exclude(FVisibilities, Visibility);

  FEvaluationBuilder.BeginUpdate;
  try
    FEvaluationBuilder.Visibilities := FVisibilities;
    UpdateInfo;
  finally
    FEvaluationBuilder.EndUpdate;
  end;
end;

procedure TScriptDebuggerWatchesFrame.ActionViewScopeUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := (TdwsVisibility(TAction(Sender).Tag) in FVisibilities);
end;

// -----------------------------------------------------------------------------

procedure TScriptDebuggerWatchesFrame.UpdateInfo;
begin
  var Watches := Debugger.GetDebugger.Watches;

  Watches.Update;

  FEvaluationBuilder.BeginUpdate;
  try
    for var i  := 0 to Watches.Count-1 do
    begin
      var Watch := Watches[i];

      FEvaluationBuilder.EvaluateExpression(Watch.Evaluator, Watch.ValueInfo, Watch.ExpressionText);

      Watch.ClearEvaluator;
    end;

    FEvaluationBuilder.PurgeUnusedNodes;
  finally
    FEvaluationBuilder.EndUpdate;
  end;
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

initialization
  RegisterClass(TScriptDebuggerWatchesFrame);
finalization
end.
