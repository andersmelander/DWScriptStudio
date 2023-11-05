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
  cxClasses, cxTLData, dxSkinsdxBarPainter, dxBar,
  cxDataControllerConditionalFormattingRulesManagerDialog,

  dwsUtils,
  dwsExprs,
  dwsSymbols,
  dwsErrors,
{$ifndef OLD_DWSCRIPT}
  dwsInfo,
  dwsScriptSource,
{$endif OLD_DWSCRIPT}

  amScriptDebuggerAPI, cxFilter, dxScrollbarAnnotations;

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
    cxTreeList1Column1: TcxTreeListColumn;
    cxTreeList1Column2: TcxTreeListColumn;
    cxTreeList1Column3: TcxTreeListColumn;
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
  private type
    TInspectOptions = set of (ioShowInherited, ioShowFields, ioShowProperties, ioAllowPropertySideEffects, ioShowGlobal);
  private
    FRefreshedNodes: TList<TcxTreeListNode>;
    FVisibilities: TdwsVisibilities;
    FInspectOptions: TInspectOptions;
  protected
    function FindNode(ParentNode: TcxTreeListNode; const AName: string): TcxTreeListNode;

    procedure LoadNode(Node: TcxTreeListNode); overload;
    procedure LoadNode(Node: TcxTreeListNode; const Info: IInfo); overload;
    procedure LoadMemberNodes(Node: TcxTreeListNode; const Info: IInfo);

    procedure EvaluateLocal(AParentNode: TcxTreeListNode; const AExpression: string; scriptPos: PScriptPos = nil; ImageIndex: integer = -1; AContextSymbol: TSymbol = nil);
    function GetDisplayValue(const Info: IInfo): string;

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

  FRefreshedNodes := TList<TcxTreeListNode>.Create;

  FVisibilities := [cvPublic, cvPublished, cvProtected];

  // Properties can have side effects due to getter. Do not show by default
  FInspectOptions := [ioShowFields];
end;

destructor TScriptDebuggerLocalVariablesFrame.Destroy;
begin
  FRefreshedNodes.Free;
  inherited;
end;

// -----------------------------------------------------------------------------

procedure TScriptDebuggerLocalVariablesFrame.Initialize(const ADebugger: IScriptDebugger; AImageList, AImageListSymbols: TCustomImageList);
begin
  inherited Initialize(ADebugger, AImageList, AImageListSymbols);
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
      begin
        FRefreshedNodes.Clear;
        TreeListVariables.Clear;
      end
  end;
end;

// -----------------------------------------------------------------------------

function TScriptDebuggerLocalVariablesFrame.FindNode(ParentNode: TcxTreeListNode; const AName: string): TcxTreeListNode;
begin
  if (ParentNode = nil) then
    ParentNode := TreeListVariables.Root;

  Result := ParentNode.getFirstChild;
  while (Result <> nil) do
  begin
    if (Result.Texts[0] = AName) then
      break;
    Result := Result.getNextSibling;
  end;
end;

// -----------------------------------------------------------------------------

procedure TScriptDebuggerLocalVariablesFrame.LoadNode(Node: TcxTreeListNode);
var
  Info: IInfo;
begin
  if (Node.Data = nil) then
    exit;

  pointer(Info) := Node.Data;
  //  Mark the node as handled (i.e. we don't need to load it again)
  Node.Data := nil;

  LoadNode(Node, Info);
end;

procedure TScriptDebuggerLocalVariablesFrame.LoadNode(Node: TcxTreeListNode; const Info: IInfo);
var
  s: string;
begin
  var TypeSym := Info.TypeSym;

  s := GetDisplayValue(Info);

  if (Node.StateIndex = -1) then
  begin
    Node.OverlayIndex := DebuggerSymbolImageIndexOverlayAdd;
    Node.StateIndex := 0;
  end else
  begin
    if (Node.Texts[1] <> s) then
      Node.OverlayIndex := DebuggerSymbolImageIndexOverlayChanged
    else
      Node.OverlayIndex := -1;
  end;

  Node.Texts[1] := s;

  s := TypeSym.Name;
  if (s = '') then
    s := TypeSym.Typ.Name;
  if (TypeSym is TArraySymbol) then
    Node.Texts[2] := TypeSym.Description
  else
  if (TypeSym is TAssociativeArraySymbol) then
    Node.Texts[2] := 'array['+TAssociativeArraySymbol(TypeSym).KeyType.Name+'] of '+s
(*
  else
  if (TypeSym is TArraySymbol) then
    Node.Texts[2] := 'array['+TArraySymbol(TypeSym).IndexType.Name+'] of '+s
*)
  else
    Node.Texts[2] := s;
//Node.Texts[2] := TypeSym.Description;

  if (TypeSym is TCompositeTypeSymbol) then
  begin
    Node.ImageIndex := Debugger.SymbolToImageIndex(TypeSym);

    if (Info is TInfoClassObj) and (Info.ValueIsEmpty) then
    begin
      if (Node.HasChildren) then
        Node.DeleteChildren;
      exit;
    end;

    LoadMemberNodes(Node, Info);
  end else
  begin
    if (Node.HasChildren) then
      Node.DeleteChildren;
  end;
end;

// -----------------------------------------------------------------------------

procedure TScriptDebuggerLocalVariablesFrame.LoadMemberNodes(Node: TcxTreeListNode; const Info: IInfo);
var
  RefreshedNodes: TList<TcxTreeListNode>;

  procedure DoLoadMemberNodes(Node: TcxTreeListNode; TypeSym: TCompositeTypeSymbol);
  var
    i: integer;
    Symbol: TSymbol;
    MemberInfo, NewInfo: IInfo;
    MemberNode: TcxTreeListNode;
    Data: TData;
  begin
    if (ioShowInherited in FInspectOptions) and (TypeSym.Parent <> nil) then
    begin
(*
      MemberNode := Node.AddChild;
      MemberNode.ImageIndex := DwsIde.SymbolToImageIndex(TypeSym.Parent);
      RefreshedNodes.Add(MemberNode);
      MemberNode.Texts[0] := '(' + TypeSym.Parent.Name + ')';
      DoLoadMemberNodes(MemberNode, TypeSym.Parent);
*)
      DoLoadMemberNodes(Node, TypeSym.Parent);
    end;

    for i := 0 to TypeSym.Members.Count-1 do
    begin
      Symbol := TypeSym.Members[i];

      if (Symbol is TFieldSymbol) or (Symbol is TPropertySymbol) then
      begin
        if (Symbol is TPropertySymbol) then
        begin
          if (not (ioShowProperties in FInspectOptions)) then
            continue;
          if (not (TPropertySymbol(Symbol).Visibility in FVisibilities)) then
            continue;
        end else
        begin
          if (not (ioShowFields in FInspectOptions)) then
            continue;
          if (not (TFieldSymbol(Symbol).Visibility in FVisibilities)) then
            continue;
        end;

        MemberNode := FindNode(Node, Symbol.Name);
        if (MemberNode = nil) then
          MemberNode := Node.AddChild;
        RefreshedNodes.Add(MemberNode);
        MemberNode.Texts[0] := Symbol.Name;

        if (MemberNode.StateIndex = -1) then
        begin
          MemberNode.OverlayIndex := DebuggerSymbolImageIndexOverlayAdd;
          MemberNode.StateIndex := 0;
        end else
          MemberNode.OverlayIndex := -1;

        if (Symbol is TPropertySymbol) then
        begin
          if (TPropertySymbol(Symbol).ArrayIndices <> nil) and (TPropertySymbol(Symbol).ArrayIndices.Count > 0) then
          begin
            MemberNode.Texts[1] := '[...]';
            MemberNode.Texts[2] := 'array of '+Symbol.Typ.Name;
            MemberNode.ImageIndex := DebuggerSymbolImageIndexArray;
            continue;
          end;
        end;

        MemberNode.ImageIndex := Debugger.SymbolToImageIndex(Symbol);

        try

          if (Symbol is TPropertySymbol) then
          begin
            // We're not using Info.Member[] for properties since it uses the symbol lookup (see TInfoClassObj.GetMember)
            // of the wrapped script object and the object might actually be an instance that's shared between
            // multiple objects.
            // E.g. TLayoutItem and TLayoutItem.Items:TLayoutItemList both wrap the same object, so a lookup on
            // the Info.Members on TLayoutItem.Items will only find the symbols of TLayoutItem.

            if (TPropertySymbol(Symbol).ReadSym = nil) then
            begin
              MemberNode.Texts[1] := '(not readable)';
              MemberNode.Texts[2] := Symbol.Typ.Name;
              MemberNode.OverlayIndex := DebuggerSymbolImageIndexOverlayWarning;
              continue;
            end else
            if (TPropertySymbol(Symbol).ReadSym is TFuncSymbol) and (not (ioAllowPropertySideEffects in FInspectOptions)) then
            begin
              MemberNode.Texts[1] := '(getter is method)';
              MemberNode.Texts[2] := Symbol.Typ.Name;
              MemberNode.OverlayIndex := DebuggerSymbolImageIndexOverlayWarning;
              continue;
            end else
{$ifdef OLD_DWSCRIPT}
              MemberInfo := TInfoProperty.Create(Info.Exec.Info, Symbol.Typ, Info.Exec.Info.Execution.DataContext_Nil, TPropertySymbol(Symbol), Info.ScriptObj)
{$else OLD_DWSCRIPT}
              MemberInfo := Info.Member[Symbol.Name] // TODO : OLD_DWSCRIPT - see comment above
{$endif OLD_DWSCRIPT}
          end else
            MemberInfo := Info.Member[Symbol.Name];

        except
          MemberNode.Texts[1] := '(failed)';
          MemberNode.Texts[2] := Symbol.Typ.Name;
          MemberNode.OverlayIndex := DebuggerSymbolImageIndexOverlayWarning;
          continue;
        end;

        try

          Data := MemberInfo.Data;

        except
          MemberNode.Texts[1] := '(unavailable)';
          MemberNode.Texts[2] := Symbol.Typ.Name;
          MemberNode.OverlayIndex := DebuggerSymbolImageIndexOverlayWarning;
          continue;
        end;

        CreateInfoOnSymbol(NewInfo, Debugger.GetDebugger.Execution.Info, Symbol.Typ, Data, 0);

        if (Node.Expanded) then
          LoadNode(MemberNode, NewInfo)
        else
        begin
          if (MemberNode.Count > 0) then
            MemberNode.DeleteChildren;

          MemberNode.Data := pointer(NewInfo);
          pointer(NewInfo) := nil;
        end;

      end;
    end;
  end;

var
  MemberNode, NextNode: TcxTreeListNode;
begin
  RefreshedNodes := TList<TcxTreeListNode>.Create;
  try
    var TypeSym := Info.TypeSym as TCompositeTypeSymbol;
    DoLoadMemberNodes(Node, TypeSym);

    MemberNode := Node.getFirstChild;
    while (MemberNode <> nil) do
    begin
      NextNode := MemberNode.getNextSibling;

      if (not RefreshedNodes.Contains(MemberNode)) then
        MemberNode.Free;

      MemberNode := NextNode;
    end;
  finally
    RefreshedNodes.Free;
  end;
end;

// -----------------------------------------------------------------------------

function TScriptDebuggerLocalVariablesFrame.GetDisplayValue(const Info: IInfo): string;
var
  ElementSymbol: TElementSymbol;
  BaseType: TTypeSymbol;
  n, i: integer;
begin
  var TypeSym := Info.TypeSym;

  if (TypeSym is TEnumerationSymbol) then
  begin
    ElementSymbol := TEnumerationSymbol(TypeSym).ElementByValue(Info.ValueAsInteger);
    if (ElementSymbol <> nil) then
      Result := ElementSymbol.Name
    else
      Result := Format('(%d)', [Info.ValueAsInteger]);
  end else
  if (TypeSym is TSetOfSymbol) then
  begin
    BaseType := TSetOfSymbol(TypeSym).Typ;
    Result := '';
    n := Info.ValueAsInteger;
    if (BaseType is TEnumerationSymbol) then
    begin
      i := 0;
      while (n > 0) do
      begin
        if (n and 1 <> 0) then
        begin
          if (Result <> '') then
            Result := Result + ',';
          ElementSymbol := TEnumerationSymbol(BaseType).ElementByValue(i);
          if (ElementSymbol <> nil) then
            Result := Result + ElementSymbol.Name
          else
            Result := Result + Format('(%d)', [i]);
        end;
        n := n shr 1;
        inc(i);
      end;
    end else
    begin
      i := 0;
      while (n > 0) do
      begin
        if (n and 1 <> 0) then
        begin
          if (Result <> '') then
            Result := Result + ',';
          Result := Result + IntToStr(i);
        end;
        n := n shr 1;
        inc(i);
      end;
    end;
    Result := '[' + Result + ']';
  end else
  if (TypeSym is TAssociativeArraySymbol) or (TypeSym is TArraySymbol) then
  begin
    Result := '[count:' + Info.Member['count'].ValueAsString + ']';
  end else
  if (TypeSym is TClassSymbol) then
  begin
    if (Info.ValueIsEmpty) then
      Result := 'nil'
    else
      Result := '(object)';
  end else
  if (TypeSym is TFuncSymbol) then
  begin
    if (Info.ValueIsEmpty) then
      Result := 'nil'
    else
      Result := '(delegate)';
  end else
  begin
    Result := Info.ValueAsString; // Conversion error is handled by caller
    if (TypeSym is TBaseStringSymbol) then
      Result := '''' + Result + '''';
  end;
end;

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
var
  ChildNode: TcxTreeListNode;
begin
  ChildNode := ANode.getFirstChild;
  while (ChildNode <> nil) do
  begin
    // If Node.Data <> nil then the node has not been expanded before and we
    // need to populate its children (grand-children actually)
    if (ChildNode.Data <> nil) then
      LoadNode(ChildNode);

    ChildNode := ChildNode.getNextSibling;
  end;
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

  UpdateInfo;
end;

procedure TScriptDebuggerLocalVariablesFrame.ActionViewScopeUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := (TdwsVisibility(TAction(Sender).Tag) in FVisibilities);
end;

// -----------------------------------------------------------------------------

procedure TScriptDebuggerLocalVariablesFrame.EvaluateLocal(AParentNode: TcxTreeListNode; const AExpression: string;
  ScriptPos: PScriptPos; ImageIndex: integer; AContextSymbol: TSymbol);
var
  Node: TcxTreeListNode;
  Evaluator: IdwsEvaluateExpr;
  TypedExpr: TTypedExpr;
  ValueInfo: IInfo;
  Data: TData;
  s: string;
begin
  Node := FindNode(nil, AExpression);

  // Is it a new variable?
  if (Node = nil) then
    Node := TreeListVariables.AddChild(AParentNode)
  else
  // Have we already evaluated that variable (can happen due to the global scope option)?
  if (FRefreshedNodes.Contains(Node)) then
  begin
    // If we have a context now, but didn't before, we refresh the node with the context.
    // This happens when the node is initially added from the inner scope (without a context)
    // and then later updated from the outermost scope with a context.
    if (AContextSymbol <> nil) and (Node.Texts[3] = '') then
      Node.Texts[3] := AContextSymbol.Name;

    exit;
  end;
  try
    FRefreshedNodes.Add(Node);

    Evaluator := Debugger.GetDebugger.Evaluate(AExpression, scriptPos);
    try
      Node.Texts[0] := AExpression;
      Node.ImageIndex := ImageIndex;

      if (AContextSymbol <> nil) then
        Node.Texts[3] := AContextSymbol.Name;


      TypedExpr := Evaluator.Expression;
      if (TypedExpr.Typ = nil) then
      begin
        Node.Texts[1] := '(not an expression)';
        Node.OverlayIndex := DebuggerSymbolImageIndexOverlayWarning;
        exit;
      end else
      if (Evaluator.EvaluationError) then
      begin
        Node.Texts[1] := '(evaluation error)';
        Node.OverlayIndex := DebuggerSymbolImageIndexOverlayWarning;
        exit;
      end else
      if (TypedExpr.Typ.Size <> 1) then
      begin
        Node.Texts[1] := '[size:'+IntToStr(TypedExpr.Typ.Size)+']';
        Node.Texts[2] := TypedExpr.Typ.Name;
        Node.OverlayIndex := DebuggerSymbolImageIndexOverlayWarning;
        exit;
      end else
        Node.OverlayIndex := -1;

      SetLength(Data, 1);
      Evaluator.Expression.EvalAsVariant(Debugger.GetDebugger.Execution.ExecutionObject, Data[0]);

      CreateInfoOnSymbol(ValueInfo, Debugger.GetDebugger.Execution.Info, Evaluator.Expression.Typ, Data, 0);

      Node.Data := pointer(ValueInfo);
      pointer(ValueInfo) := nil;

      LoadNode(Node);
    finally
      Evaluator := nil;
    end;
  except
    on E : Exception do
    begin
      s := Node.Texts[1];
      if (s <> '') then
        s := s + ' - ';
      Node.Texts[1] := s + E.Message;
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure TScriptDebuggerLocalVariablesFrame.UpdateInfo;

  procedure AppendSymbol(AScopeNode: TcxTreeListNode; const AName : string; SymType: TTypeSymbol = nil; ScriptPos : PScriptPos = nil;
    ImageIndex: integer = -1; ContextSymbol: TSymbol = nil);
  begin
    if (AName = '') then
      exit;

    EvaluateLocal(AScopeNode, AName, ScriptPos, ImageIndex, ContextSymbol);
  end;

  procedure AppendSymbolsToDisplay(AScopeNode: TcxTreeListNode; ATable: TSymbolTable; ScriptPos: PScriptPos = nil; AContext: TdwsSourceContext = nil);
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

        AppendSymbol(AScopeNode, Symbol.Name, Symbol.Typ, ScriptPos, Ord(scVariable), ContextSymbol);
      end;
  end;

  procedure AppendParamsToDisplay(AScopeNode: TcxTreeListNode; AProc: TdwsProcedure);
  begin
    for var Symbol in AProc.Func.Params do
      if (Symbol is TDataSymbol) then
        AppendSymbol(AScopeNode, Symbol.Name, Symbol.Typ, nil, Ord(scParameter));

    // If it is a function, get the function result
    var Symbol := AProc.Func.Result;
    if (Symbol <> nil) then
      AppendSymbol(AScopeNode, Symbol.Name, Symbol.Typ, nil, Ord(scParameter));
  end;

  function FetchVariables(AScope: TdwsProgram): TcxTreeListNode;
  begin
    (* This was an attempt to display variables in scope. Like this:

      + (main)
        - global1
        - global2
        + function()
          - local1
          - local2
          + etc()...

      However, it didn't work out as the outermost level (main) will include
      the variables from the inner levels due to the use of SourceContextMap.FindContext.

      Instead I'm displaying the context alongside the variables.

    var ParentScopeNode: TcxTreeListNode := nil;
    if (AScope.Parent <> nil) then
      ParentScopeNode := FetchVariables(AScope.Parent);

    if (ParentScopeNode <> nil) then
      Result := TreeListVariables.AddChild(ParentScopeNode)
    else
      Result := TreeListVariables.Add;

    FRefreshedNodes.Add(Result);
    *)
    Result := nil;

    if (AScope is TdwsProcedure) then
    begin
      (*
      Result.Texts[0] := TdwsProcedure(AScope).Func.Caption;
      *)

      var MethodSymbol := TdwsProcedure(AScope).ContextMethodSymbol;

      // If scope is a function then display the return value
      if (MethodSymbol <> nil) and (MethodSymbol.SelfSym <> nil) then
        AppendSymbol(Result, MethodSymbol.SelfSym.Name, MethodSymbol.SelfSym.Typ);

      // Display any parameter values
      AppendParamsToDisplay(Result, TdwsProcedure(AScope));
    end;


    if (AScope is TdwsMainProgram) then
    begin
      (*
      Result.Texts[0] := '(main)';
      *)

      var ScriptPos := Debugger.GetDebugger.CurrentScriptPos;
      var Context := TdwsMainProgram(AScope).SourceContextMap.FindContext(ScriptPos);

      while (Context <> nil) do
      begin
        if (Context.LocalTable <> nil) then
          AppendSymbolsToDisplay(Result, Context.LocalTable, @ScriptPos, Context);

        Context := Context.Parent;
      end;
    end;

    AppendSymbolsToDisplay(Result, AScope.Table);
  end;

begin
  FRefreshedNodes.Clear;

  TreeListVariables.BeginUpdate;
  try

    var ProgramExecution := TdwsProgramExecution(Debugger.GetDebugger.Execution);

    if (ProgramExecution = nil) or (ProgramExecution.Debugger = nil)  then
    begin
      TreeListVariables.Clear;
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


    // Remove all nodes that didn't get referenced during the update; They're all out of scope.
    var Node := TreeListVariables.Root.getFirstChild;
    while (Node <> nil) do
    begin
      var NextNode := Node.getNextSibling;

      if (not FRefreshedNodes.Contains(Node)) then
        Node.Free;

      Node := NextNode;
    end;

    FRefreshedNodes.Clear;

  finally
    TreeListVariables.EndUpdate;
  end;
end;

// -----------------------------------------------------------------------------

initialization
  RegisterClass(TScriptDebuggerLocalVariablesFrame);
finalization
end.
