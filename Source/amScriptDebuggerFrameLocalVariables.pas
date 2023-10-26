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

  amScriptDebuggerAPI;

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
  private
    FRefreshedNodes: TList<TcxTreeListNode>;
    FVisibilities: TdwsVisibilities;
    FShowMembersInherited: boolean;
    FShowMembersProperty: boolean;
    FShowMembersPropertySideEffects: boolean;
    FShowMembersField: boolean;
  protected
    procedure LoadNode(Node: TcxTreeListNode); overload;
    procedure LoadNode(Node: TcxTreeListNode; const Info: IInfo; TypeSym: TSymbol = nil); overload;
    procedure LoadMemberNodes(Node: TcxTreeListNode; const Info: IInfo; TypeSym: TCompositeTypeSymbol);
    procedure EvaluateLocal(const AExpression: string; scriptPos: PScriptPos = nil; ImageIndex: integer = -1);
    function FindNode(const AName: string; ParentNode: TcxTreeListNode): TcxTreeListNode;
    function GetDisplayValue(const Info: IInfo; TypeSym: TSymbol): string;

    procedure UpdateInfo;

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


{ TDwsIdeLocalVariablesFrame }

procedure TScriptDebuggerLocalVariablesFrame.Finalize;
begin
  inherited;
end;

function TScriptDebuggerLocalVariablesFrame.FindNode(const AName: string; ParentNode: TcxTreeListNode): TcxTreeListNode;
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

procedure TScriptDebuggerLocalVariablesFrame.Initialize(const ADebugger: IScriptDebugger; AImageList, AImageListSymbols: TCustomImageList);
begin
  inherited Initialize(ADebugger, AImageList, AImageListSymbols);
  TreeListVariables.Images := AImageListSymbols;

  UpdateInfo;
end;

procedure TScriptDebuggerLocalVariablesFrame.LoadNode(Node: TcxTreeListNode);
var
  Info: IInfo;
begin
  if (Node.Data = nil) then
    exit;

  pointer(Info) := Node.Data;
  Node.Data := nil;

  LoadNode(Node, Info);
end;

procedure TScriptDebuggerLocalVariablesFrame.LoadMemberNodes(Node: TcxTreeListNode; const Info: IInfo; TypeSym: TCompositeTypeSymbol);
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
    if (FShowMembersInherited) and (TypeSym.Parent <> nil) then
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
          if (not FShowMembersProperty) then
            continue;
          if (not (TPropertySymbol(Symbol).Visibility in FVisibilities)) then
            continue;
        end else
        begin
          if (not FShowMembersField) then
            continue;
          if (not (TFieldSymbol(Symbol).Visibility in FVisibilities)) then
            continue;
        end;

        MemberNode := FindNode(Symbol.Name, Node);
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
            MemberNode.Texts[2] := Symbol.Typ.Name;
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
            if (TPropertySymbol(Symbol).ReadSym is TFuncSymbol) and (not FShowMembersPropertySideEffects) then
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
          LoadNode(MemberNode, NewInfo, Symbol.Typ)
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

function TScriptDebuggerLocalVariablesFrame.GetDisplayValue(const Info: IInfo; TypeSym: TSymbol): string;
var
  ElementSymbol: TElementSymbol;
  BaseType: TTypeSymbol;
  n, i: integer;
begin
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
  begin
    Result := Info.ValueAsString; // Conversion error is handled by caller
    if (TypeSym is TBaseStringSymbol) then
      Result := '''' + Result + '''';
  end;
end;

procedure TScriptDebuggerLocalVariablesFrame.LoadNode(Node: TcxTreeListNode; const Info: IInfo; TypeSym: TSymbol);
var
  s: string;
begin
  // Note: The TypeSym parameter isn't really necessary. This works just as well without it (i.e. using Info.TypeSym).
  if (TypeSym = nil) then
    TypeSym := Info.TypeSym;

  s := GetDisplayValue(Info, TypeSym);

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

    LoadMemberNodes(Node, Info, TCompositeTypeSymbol(TypeSym));
  end else
  begin
    if (Node.HasChildren) then
      Node.DeleteChildren;
  end;
end;

procedure TScriptDebuggerLocalVariablesFrame.TreeListVariablesDblClick(Sender: TObject);
begin
  ActionItemModify.Execute;
end;

procedure TScriptDebuggerLocalVariablesFrame.TreeListVariablesDeletion(Sender: TcxCustomTreeList; ANode: TcxTreeListNode);
var
  Info: IInfo;
begin
  if (ANode.Data = nil) then
    exit;

  pointer(Info) := ANode.Data;
  ANode.Data := nil;

  Info := nil;
end;

procedure TScriptDebuggerLocalVariablesFrame.TreeListVariablesExpanding(Sender: TcxCustomTreeList; ANode: TcxTreeListNode; var Allow: Boolean);
var
  ChildNode: TcxTreeListNode;
begin
  ChildNode := ANode.getFirstChild;
  while (ChildNode <> nil) do
  begin
    if (ChildNode.Data <> nil) then
      LoadNode(ChildNode);
    ChildNode := ChildNode.getNextSibling;
  end;
end;

procedure TScriptDebuggerLocalVariablesFrame.ActionItemModifyExecute(Sender: TObject);
var
  Expression: string;
  Node: TcxTreeListNode;
begin
  if (TreeListVariables.FocusedNode = nil) then
    exit;

  Node := TreeListVariables.FocusedNode;

  Expression := '';
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
var
  Expression: string;
  Node: TcxTreeListNode;
begin
  if (TreeListVariables.FocusedNode = nil) then
    exit;

  Node := TreeListVariables.FocusedNode;

  Expression := '';
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
  FShowMembersField := TAction(Sender).Checked;
  UpdateInfo;
end;

procedure TScriptDebuggerLocalVariablesFrame.ActionViewMemberFieldsUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := FShowMembersField;
end;

procedure TScriptDebuggerLocalVariablesFrame.ActionViewMemberInheritedExecute(Sender: TObject);
begin
  FShowMembersInherited := TAction(Sender).Checked;
  UpdateInfo;
end;

procedure TScriptDebuggerLocalVariablesFrame.ActionViewMemberInheritedUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := FShowMembersInherited;
end;

procedure TScriptDebuggerLocalVariablesFrame.ActionViewMemberPropertiesExecute(Sender: TObject);
begin
  FShowMembersProperty := TAction(Sender).Checked;
  UpdateInfo;
end;

procedure TScriptDebuggerLocalVariablesFrame.ActionViewMemberPropertiesUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := FShowMembersProperty;
end;

procedure TScriptDebuggerLocalVariablesFrame.ActionViewMemberPropertySideEffectsExecute(Sender: TObject);
begin
  FShowMembersPropertySideEffects := TAction(Sender).Checked;
  UpdateInfo;
end;

procedure TScriptDebuggerLocalVariablesFrame.ActionViewMemberPropertySideEffectsUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := FShowMembersPropertySideEffects;
  TAction(Sender).Enabled := FShowMembersProperty;
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

constructor TScriptDebuggerLocalVariablesFrame.Create(AOwner: TComponent);
begin
  inherited;
  FRefreshedNodes := TList<TcxTreeListNode>.Create;

  FVisibilities := [cvPublic, cvPublished, cvProtected];
  FShowMembersInherited := False;
  FShowMembersProperty := False; // Properties can have side effects due to getter. Do not show by default
  FShowMembersPropertySideEffects := False;
  FShowMembersField := True;
end;

procedure TScriptDebuggerLocalVariablesFrame.DebuggerStateChanged(State: TScriptDebuggerNotification);
begin
  case State of
    dnDebugSuspended:
      UpdateInfo;

    dnIdle,
    dnDebugDone:
      begin
        FRefreshedNodes.Clear;
        TreeListVariables.Clear;
      end
  end;
end;

destructor TScriptDebuggerLocalVariablesFrame.Destroy;
begin
  FRefreshedNodes.Free;
  inherited;
end;

procedure TScriptDebuggerLocalVariablesFrame.EvaluateLocal(const AExpression: string; scriptPos: PScriptPos; ImageIndex: integer);
var
  Node: TcxTreeListNode;
  Evaluator: IdwsEvaluateExpr;
  TypedExpr: TTypedExpr;
  ValueInfo: IInfo;
  Data: TData;
  s: string;
begin
  Node := FindNode(AExpression, nil);
  if (Node = nil) then
    Node := TreeListVariables.Add;
  try
    FRefreshedNodes.Add(Node);

    Evaluator := Debugger.GetDebugger.Evaluate(AExpression, scriptPos);
    try
      Node.Texts[0] := AExpression;
      Node.ImageIndex := ImageIndex;


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
      end;

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

procedure TScriptDebuggerLocalVariablesFrame.UpdateInfo;

  procedure AppendSymbol( const AName : string; SymType: TTypeSymbol = nil; scriptPos : PScriptPos = nil; ImageIndex: integer = -1);
  begin
    if (AName = '') then
      exit;

    EvaluateLocal(AName, ScriptPos, ImageIndex);
  end;

  procedure AppendSymbolsToDisplay( ATable : TSymbolTable; AExec : TdwsProgramExecution; scriptPos : PScriptPos = nil );
  var
    I   : integer;
    Sym : TSymbol;
  begin
    for I := 0 to ATable.Count-1 do
    begin
      Sym := ATable[I];
      if Sym is TDataSymbol then
        AppendSymbol(Sym.Name, Sym.Typ, scriptPos, Ord(scVariable));
    end
  end;

  procedure AppendParamsToDisplay( AProc : TdwsProcedure; AExec : TdwsProgramExecution );
  var
    I   : integer;
    Sym : TSymbol;
  begin
    for I := 0 to AProc.Func.Params.Count-1 do
    begin
      Sym := AProc.Func.Params[I];
      if Sym is TDataSymbol then
        AppendSymbol(Sym.Name, Sym.Typ, nil, Ord(scParameter));
    end;

    // If it is a function, get the function result
    Sym := AProc.Func.Result;
    if Assigned( Sym ) then
      AppendSymbol(Sym.Name, Sym.Typ, nil, Ord(scParameter));
  end;

var
  ProgramExecution : TdwsProgramExecution;
  Context: TdwsSourceContext;
  ScriptPos: TScriptPos;
  MethodSymbol: TMethodSymbol;
  Node, NextNode: TcxTreeListNode;
begin
  FRefreshedNodes.Clear;

  TreeListVariables.BeginUpdate;
  try
//    TreeListVariables.Clear;

    ProgramExecution := TdwsProgramExecution( Debugger.GetDebugger.Execution );
    if (ProgramExecution = nil) or (ProgramExecution.Debugger = nil)  then
    begin
      TreeListVariables.Clear;
      exit;
    end;

    if ProgramExecution.CurrentProg is TdwsProcedure then
    begin
      MethodSymbol := TdwsProcedure(ProgramExecution.CurrentProg).ContextMethodSymbol;
      if (MethodSymbol <> nil) and (MethodSymbol.SelfSym <> nil) then
        AppendSymbol(MethodSymbol.SelfSym.Name, MethodSymbol.SelfSym.Typ);

      AppendParamsToDisplay( TdwsProcedure( ProgramExecution.CurrentProg ), ProgramExecution );
    end;


    if ProgramExecution.CurrentProg is TdwsMainProgram then
    begin
      Context := TdwsMainProgram(ProgramExecution.CurrentProg).SourceContextMap.FindContext(Debugger.GetDebugger.CurrentScriptPos);
      while (Context <> nil) do
      begin
        while (Context <> nil) and (Context.LocalTable = nil) do
          Context := Context.Parent;
        if (Context <> nil) then
        begin
          if (Context.LocalTable <> nil) then
          begin
            ScriptPos := Debugger.GetDebugger.CurrentScriptPos;
            AppendSymbolsToDisplay(Context.LocalTable, ProgramExecution, @ScriptPos );
          end;

          Context := Context.Parent;
        end;
      end;
    end;

    AppendSymbolsToDisplay(ProgramExecution.CurrentProg.Table, ProgramExecution);

    Node := TreeListVariables.Root.getFirstChild;
    while (Node <> nil) do
    begin
      NextNode := Node.getNextSibling;
      if (not FRefreshedNodes.Contains(Node)) then
        Node.Free;
      Node := NextNode;
    end;
    FRefreshedNodes.Clear;
  finally
    TreeListVariables.EndUpdate;
  end;
end;

initialization
  RegisterClass(TScriptDebuggerLocalVariablesFrame);
finalization
end.
