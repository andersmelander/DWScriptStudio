unit amScriptDebuggerFrameLocalVariables;

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
  Generics.Collections,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, ImgList, Menus, ActnList, System.Actions,

  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  cxContainer, cxEdit, cxCustomData, cxStyles, cxTL, cxTextEdit, cxTLdxBarBuiltInMenu, cxInplaceContainer,
  cxClasses, cxTLData, dxSkinsdxBarPainter, dxBar, cxFilter, dxScrollbarAnnotations,

  dwsUtils,
  dwsExprs,
  dwsSymbols,
  dwsErrors,
  dwsInfo,
  dwsScriptSource,

  amScriptDebuggerAPI,
  amScriptDebuggerInfoEvaluationBuilder;

// -----------------------------------------------------------------------------
//
// TScriptDebuggerLocalVariablesFrame
//
// -----------------------------------------------------------------------------
// Displays variables in current context (i.e. local) and, optionally, variables
// from parent contexts.
// Both simple and complex types are supported.
// -----------------------------------------------------------------------------
type
  TFrame = TScriptDebuggerFrame;

  TScriptDebuggerLocalVariablesFrame = class(TFrame)
    TreeListVariables: TcxTreeList;
    TreeListVariablesColumnVariable: TcxTreeListColumn;
    TreeListVariablesColumnValue: TcxTreeListColumn;
    TreeListVariablesColumnType: TcxTreeListColumn;
    cxStyleRepository1: TcxStyleRepository;
    StyleBackground: TcxStyle;
    dxBarPopupMenu1: TdxBarPopupMenu;
    dxBarManager1: TdxBarManager;
    dxBarSeparator1: TdxBarSeparator;
    MenuItemScopePublished: TdxBarButton;
    MenuItemScopePublic: TdxBarButton;
    MenuItemScopeProtected: TdxBarButton;
    MenuItemScopePrivate: TdxBarButton;
    dxBarSeparator2: TdxBarSeparator;
    MenuItemMembersInherited: TdxBarButton;
    MenuItemMembersProperties: TdxBarButton;
    MenuItemMembersFields: TdxBarButton;
    MenuItemItemWatch: TdxBarButton;
    MenuItemItemModify: TdxBarButton;
    ActionList1: TActionList;
    ActionItemWatch: TAction;
    ActionItemModify: TAction;
    MenuItemMembersPropertyGetters: TdxBarButton;
    ActionViewMemberFields: TAction;
    ActionViewMemberProperties: TAction;
    ActionViewMemberPropertySideEffects: TAction;
    ActionViewMemberInherited: TAction;
    ActionViewScopePublished: TAction;
    ActionViewScopePublic: TAction;
    ActionViewScopeProtected: TAction;
    ActionViewScopePrivate: TAction;
    TreeListVariablesColumnScope: TcxTreeListColumn;
    ActionViewScopeGlobal: TAction;
    dxBarButton1: TdxBarButton;
    procedure TreeListVariablesDeletion(Sender: TcxCustomTreeList; ANode: TcxTreeListNode);
    procedure TreeListVariablesExpanding(Sender: TcxCustomTreeList; ANode: TcxTreeListNode; var Allow: Boolean);
    procedure TreeListVariablesDblClick(Sender: TObject);
    procedure ActionItemWatchExecute(Sender: TObject);
    procedure ActionItemWatchUpdate(Sender: TObject);
    procedure ActionItemModifyUpdate(Sender: TObject);
    procedure ActionItemModifyExecute(Sender: TObject);
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
    procedure UpdateInfo;

  protected
    // IScriptDebuggerWindow
    procedure Initialize(const ADebugger: IScriptDebugger; AImageList, AImageListSymbols: TCustomImageList); override;
    procedure Finalize; override;
    procedure DebuggerStateChanged(State: TScriptDebuggerNotification); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}

uses
  dwsDebugger,
{$ifdef OLD_DWSCRIPT}
  dwsInfo,
{$else OLD_DWSCRIPT}
  dwsInfoClasses,
  dwsEvaluate,
  dwsContextMap,
{$endif OLD_DWSCRIPT}
  dwsCompiler,
  dwsDataContext,
  dwsSuggestions;


// -----------------------------------------------------------------------------
//
// TScriptDebuggerLocalVariablesFrame
//
// -----------------------------------------------------------------------------
constructor TScriptDebuggerLocalVariablesFrame.Create(AOwner: TComponent);
begin
  inherited;

  FEvaluationBuilder := TInfoEvaluationBuilder.Create(TreeListVariables);

  FVisibilities := FEvaluationBuilder.Visibilities;
  FInspectOptions := FEvaluationBuilder.InspectOptions;
end;

destructor TScriptDebuggerLocalVariablesFrame.Destroy;
begin
  FEvaluationBuilder.Free;
  inherited;
end;

// -----------------------------------------------------------------------------

procedure TScriptDebuggerLocalVariablesFrame.Initialize(const ADebugger: IScriptDebugger; AImageList, AImageListSymbols: TCustomImageList);
begin
  inherited Initialize(ADebugger, AImageList, AImageListSymbols);

  FEvaluationBuilder.Initialize(ADebugger);

  TreeListVariables.Images := AImageListSymbols;

  UpdateInfo;
end;

procedure TScriptDebuggerLocalVariablesFrame.Finalize;
begin
  inherited;
end;

procedure TScriptDebuggerLocalVariablesFrame.DebuggerStateChanged(State: TScriptDebuggerNotification);
begin
  case State of
    dnDebugSuspended:
      // Debugger has paused on single-step; Update view
      UpdateInfo;

    dnIdle,
    dnDebugDone:
      // Debugger is stopped; Clear view
      FEvaluationBuilder.Clear;
  end;
end;

// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------

procedure TScriptDebuggerLocalVariablesFrame.TreeListVariablesDblClick(Sender: TObject);
begin
  ActionItemModify.Execute;
end;

// -----------------------------------------------------------------------------

procedure TScriptDebuggerLocalVariablesFrame.TreeListVariablesDeletion(Sender: TcxCustomTreeList; ANode: TcxTreeListNode);
var
  Info: IInfo;
begin
  if (ANode.Data = nil) then
    exit;

  // Get the interface pointer from the node
  pointer(Info) := ANode.Data;
  ANode.Data := nil;

  // Release then interface
  Info := nil;
end;

// -----------------------------------------------------------------------------

procedure TScriptDebuggerLocalVariablesFrame.TreeListVariablesExpanding(Sender: TcxCustomTreeList; ANode: TcxTreeListNode; var Allow: Boolean);
begin
  FEvaluationBuilder.PopulateNode(ANode);
end;

// -----------------------------------------------------------------------------

procedure TScriptDebuggerLocalVariablesFrame.ActionItemModifyExecute(Sender: TObject);
begin
  var Node := TreeListVariables.FocusedNode;

  if (Node = nil) then
    exit;

  // Build expression from focused node
  var Expression := '';
  while (Node <> nil) and (Node.Parent <> nil) do
  begin
    if (Expression = '') then
      Expression := Node.Texts[0]
    else
      Expression := Node.Texts[0] + '.' + Expression;
    Node := Node.Parent;
  end;

  Debugger.Evaluate(Expression);
end;

procedure TScriptDebuggerLocalVariablesFrame.ActionItemModifyUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (TreeListVariables.FocusedNode <> nil);
end;

procedure TScriptDebuggerLocalVariablesFrame.ActionItemWatchExecute(Sender: TObject);
begin
  var Node := TreeListVariables.FocusedNode;

  if (Node = nil) then
    exit;

  // Build expression from focused node
  var Expression := '';
  while (Node <> nil) and (Node.Parent <> nil) do
  begin
    if (Expression = '') then
      Expression := Node.Texts[0]
    else
      Expression := Node.Texts[0] + '.' + Expression;
    Node := Node.Parent;
  end;

  Debugger.AddWatch(Expression);
end;

procedure TScriptDebuggerLocalVariablesFrame.ActionItemWatchUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (TreeListVariables.FocusedNode <> nil);
end;

procedure TScriptDebuggerLocalVariablesFrame.ActionViewMemberFieldsExecute(Sender: TObject);
begin
  if (TAction(Sender).Checked) then
    Include(FInspectOptions, ioShowFields)
  else
    Exclude(FInspectOptions, ioShowFields);
  FEvaluationBuilder.InspectOptions := FInspectOptions;
  UpdateInfo;
end;

procedure TScriptDebuggerLocalVariablesFrame.ActionViewMemberFieldsUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := (ioShowFields in FInspectOptions);
end;

procedure TScriptDebuggerLocalVariablesFrame.ActionViewMemberInheritedExecute(Sender: TObject);
begin
  if (TAction(Sender).Checked) then
    Include(FInspectOptions, ioShowInherited)
  else
    Exclude(FInspectOptions, ioShowInherited);
  FEvaluationBuilder.InspectOptions := FInspectOptions;
  UpdateInfo;
end;

procedure TScriptDebuggerLocalVariablesFrame.ActionViewMemberInheritedUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := (ioShowInherited in FInspectOptions);
end;

procedure TScriptDebuggerLocalVariablesFrame.ActionViewMemberPropertiesExecute(Sender: TObject);
begin
  if (TAction(Sender).Checked) then
    Include(FInspectOptions, ioShowProperties)
  else
    Exclude(FInspectOptions, ioShowProperties);
  FEvaluationBuilder.InspectOptions := FInspectOptions;
  UpdateInfo;
end;

procedure TScriptDebuggerLocalVariablesFrame.ActionViewMemberPropertiesUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := (ioShowProperties in FInspectOptions);
end;

procedure TScriptDebuggerLocalVariablesFrame.ActionViewMemberPropertySideEffectsExecute(Sender: TObject);
begin
  if (TAction(Sender).Checked) then
    Include(FInspectOptions, ioAllowPropertySideEffects)
  else
    Exclude(FInspectOptions, ioAllowPropertySideEffects);
  FEvaluationBuilder.InspectOptions := FInspectOptions;
  UpdateInfo;
end;

procedure TScriptDebuggerLocalVariablesFrame.ActionViewMemberPropertySideEffectsUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := (ioAllowPropertySideEffects in FInspectOptions);
  TAction(Sender).Enabled := (ioShowProperties in FInspectOptions);
end;

procedure TScriptDebuggerLocalVariablesFrame.ActionViewScopeGlobalExecute(Sender: TObject);
begin
  if (TAction(Sender).Checked) then
    Include(FInspectOptions, ioShowGlobal)
  else
    Exclude(FInspectOptions, ioShowGlobal);
  FEvaluationBuilder.InspectOptions := FInspectOptions;
  UpdateInfo;
  TreeListVariablesColumnScope.Visible := (ioShowGlobal in FInspectOptions);
end;

procedure TScriptDebuggerLocalVariablesFrame.ActionViewScopeGlobalUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := (ioShowGlobal in FInspectOptions);
end;

procedure TScriptDebuggerLocalVariablesFrame.ActionViewScopeExecute(Sender: TObject);
var
  Visibility: TdwsVisibility;
begin
  Visibility := TdwsVisibility(TAction(Sender).Tag);
  if (TAction(Sender).Checked) then
    Include(FVisibilities, Visibility)
  else
    Exclude(FVisibilities, Visibility);
  FEvaluationBuilder.Visibilities := FVisibilities;

  UpdateInfo;
end;

procedure TScriptDebuggerLocalVariablesFrame.ActionViewScopeUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := (TdwsVisibility(TAction(Sender).Tag) in FVisibilities);
end;

// -----------------------------------------------------------------------------

procedure TScriptDebuggerLocalVariablesFrame.UpdateInfo;

  procedure LoadSymbol(Symbol: TSymbol; ScriptPos : PScriptPos = nil;
    ImageIndex: integer = -1; ContextSymbol: TSymbol = nil);
  begin
    if (Symbol.Name = '') then
      exit;

    FEvaluationBuilder.EvaluateExpression(nil, nil, Symbol.Name, ScriptPos, ImageIndex, ContextSymbol);
  end;

  procedure LoadSymbols(ATable: TSymbolTable; ScriptPos: PScriptPos = nil; AContext: TdwsSourceContext = nil);
  begin
    var ContextSymbol: TSymbol := nil;
    var HasContext := (AContext = nil);

    for var Symbol in ATable do
      if (Symbol is TDataSymbol) then
      begin
        if (not HasContext) then
        begin
          HasContext := True;
          while (AContext <> nil) and (ContextSymbol = nil) do
          begin
            ContextSymbol := AContext.ParentSym;
            AContext := AContext.Parent;
          end;
        end;

        LoadSymbol(Symbol, ScriptPos, Ord(scVariable), ContextSymbol);
      end;
  end;

  procedure LoadParams(AProc: TdwsProcedure);
  begin
    for var Symbol in AProc.Func.Params do
      if (Symbol is TDataSymbol) then
        LoadSymbol(Symbol, nil, Ord(scParameter));

    // If it is a function, get the function result
    var Symbol := AProc.Func.Result;
    if (Symbol <> nil) then
      LoadSymbol(Symbol, nil, Ord(scParameter));
  end;

  procedure FetchVariables(AScope: TdwsProgram);
  begin
    if (AScope is TdwsProcedure) then
    begin
      var MethodSymbol := TdwsProcedure(AScope).ContextMethodSymbol;

      // If scope is a function then display the return value
      if (MethodSymbol <> nil) and (MethodSymbol.SelfSym <> nil) then
        LoadSymbol(MethodSymbol.SelfSym);

      // Display any parameter values
      LoadParams(TdwsProcedure(AScope));
    end else
    if (AScope is TdwsMainProgram) then
    begin
      var ScriptPos := Debugger.GetDebugger.CurrentScriptPos;
      var Context := TdwsMainProgram(AScope).SourceContextMap.FindContext(ScriptPos);

      while (Context <> nil) do
      begin
        if (Context.LocalTable <> nil) then
          LoadSymbols(Context.LocalTable, @ScriptPos, Context);

        Context := Context.Parent;
      end;
    end;

    LoadSymbols(AScope.Table);
  end;

begin
  FEvaluationBuilder.BeginUpdate;
  try

    var ProgramExecution := TdwsProgramExecution(Debugger.GetDebugger.Execution);

    if (ProgramExecution = nil) or (ProgramExecution.Debugger = nil)  then
    begin
      FEvaluationBuilder.Clear;
      exit;
    end;

    var Scope := ProgramExecution.CurrentProg;

    while (Scope <> nil) do
    begin
      FetchVariables(Scope);

      if (not (ioShowGlobal in FInspectOptions)) then
        break;
      Scope := Scope.Parent;
    end;

    FEvaluationBuilder.PurgeUnusedNodes;
  finally
    FEvaluationBuilder.EndUpdate;
  end;
end;

// -----------------------------------------------------------------------------

initialization
  RegisterClass(TScriptDebuggerLocalVariablesFrame);
finalization
end.
