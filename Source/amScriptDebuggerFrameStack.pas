unit amScriptDebuggerFrameStack;

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

  dwsUtils,
  dwsExprs,
  dwsSymbols,
  dwsErrors,
{$ifndef OLD_DWSCRIPT}
  dwsInfo,
{$endif OLD_DWSCRIPT}

  amScriptDebuggerAPI;

type
  TFrame = TScriptDebuggerFrame;

  TScriptDebuggerStackFrame = class(TFrame)
    TreeListStack: TcxTreeList;
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
    procedure TreeListStackDeletion(Sender: TcxCustomTreeList; ANode: TcxTreeListNode);
    procedure TreeListStackExpanding(Sender: TcxCustomTreeList; ANode: TcxTreeListNode; var Allow: Boolean);
    procedure TreeListStackCanFocusNode(Sender: TcxCustomTreeList; ANode: TcxTreeListNode; var Allow: Boolean);
  private
    FLoading: boolean;
  protected
    procedure LoadNode(Node: TcxTreeListNode); overload;
    procedure LoadNode(Node: TcxTreeListNode; const Info: IInfo; TypeSym: TSymbol = nil); overload;
    procedure LoadMemberNodes(Node: TcxTreeListNode; const Info: IInfo; TypeSym: TCompositeTypeSymbol);
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
{$ifndef OLD_DWSCRIPT}
  dwsInfoClasses,
{$else OLD_DWSCRIPT}
  dwsInfo,
{$endif OLD_DWSCRIPT}
  dwsCompiler,
  dwsDataContext,
  dwsSuggestions;


{ TDwsIdeLocalVariablesFrame }

procedure TScriptDebuggerStackFrame.Finalize;
begin
  inherited;
end;

function TScriptDebuggerStackFrame.FindNode(const AName: string; ParentNode: TcxTreeListNode): TcxTreeListNode;
begin
  if (ParentNode = nil) then
    ParentNode := TreeListStack.Root;

  Result := ParentNode.getFirstChild;
  while (Result <> nil) do
  begin
    if (Result.Texts[0] = AName) then
      break;
    Result := Result.getNextSibling;
  end;
end;

procedure TScriptDebuggerStackFrame.Initialize(const ADebugger: IScriptDebugger; AImageList, AImageListSymbols: TCustomImageList);
begin
  inherited Initialize(ADebugger, AImageList, AImageListSymbols);
  TreeListStack.Images := AImageListSymbols;

  UpdateInfo;
end;

procedure TScriptDebuggerStackFrame.LoadNode(Node: TcxTreeListNode);
var
  Info: IInfo;
begin
  if (Node.Data = nil) then
    exit;

  pointer(Info) := Node.Data;
  Node.Data := nil;

  LoadNode(Node, Info);
end;

procedure TScriptDebuggerStackFrame.LoadMemberNodes(Node: TcxTreeListNode; const Info: IInfo; TypeSym: TCompositeTypeSymbol);
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
(*
    if (FShowMembersInherited) and (TypeSym.Parent <> nil) then
    begin
      DoLoadMemberNodes(Node, TypeSym.Parent);
    end;
*)
    for i := 0 to TypeSym.Members.Count-1 do
    begin
      Symbol := TypeSym.Members[i];

      if (Symbol is TFieldSymbol) or (Symbol is TPropertySymbol) then
      begin
        if (Symbol is TPropertySymbol) then
        begin
            continue;
(*
          if (not FShowMembersProperty) then
            continue;
          if (not (TPropertySymbol(Symbol).Visibility in FVisibilities)) then
            continue;
*)
        end else
        begin
(*
          if (not FShowMembersField) then
            continue;
          if (not (TFieldSymbol(Symbol).Visibility in FVisibilities)) then
            continue;
*)
        end;

        MemberNode := FindNode(Symbol.Name, Node);
        if (MemberNode = nil) then
          MemberNode := Node.AddChild;
        RefreshedNodes.Add(MemberNode);
        MemberNode.Texts[0] := Symbol.Name;

        if (Symbol is TPropertySymbol) then
        begin
          if (TPropertySymbol(Symbol).ArrayIndices <> nil) and (TPropertySymbol(Symbol).ArrayIndices.Count > 0) then
          begin
            MemberNode.Texts[1] := '[...]';
            MemberNode.Texts[2] := Symbol.Typ.Name;
            MemberNode.ImageIndex := DebuggerSymbolImageIndexArray;
            if (MemberNode.StateIndex = -1) then
            begin
              MemberNode.OverlayIndex := DebuggerSymbolImageIndexOverlayAdd;
              MemberNode.StateIndex := 0;
            end else
              MemberNode.OverlayIndex := -1;
            continue;
          end;
        end;

        MemberNode.ImageIndex := Debugger.SymbolToImageIndex(Symbol);

        try

          if (Symbol is TPropertySymbol) then
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
            if (TPropertySymbol(Symbol).ReadSym is TFuncSymbol) then//and (not FShowMembersPropertySideEffects) then
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
          else
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

function TScriptDebuggerStackFrame.GetDisplayValue(const Info: IInfo; TypeSym: TSymbol): string;
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
  begin
    Result := Info.ValueAsString;
    if (TypeSym is TBaseStringSymbol) then
      Result := '''' + Result + '''';
  end;
end;

procedure TScriptDebuggerStackFrame.LoadNode(Node: TcxTreeListNode; const Info: IInfo; TypeSym: TSymbol);
var
  s: string;
begin
  // Note: The TypeSym parameter isn't really necessary. This works just as well without it (i.e. using Info.TypeSym).
  if (TypeSym = nil) then
    TypeSym := Info.TypeSym;

  s := GetDisplayValue(Info, TypeSym);

(*
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
*)

  Node.Texts[1] := s;
  Node.Texts[2] := TypeSym.Name;

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

procedure TScriptDebuggerStackFrame.TreeListStackCanFocusNode(Sender: TcxCustomTreeList; ANode: TcxTreeListNode; var Allow: Boolean);
begin
  Allow := FLoading;
end;

procedure TScriptDebuggerStackFrame.TreeListStackDeletion(Sender: TcxCustomTreeList; ANode: TcxTreeListNode);
var
  Info: IInfo;
begin
  if (ANode.Data = nil) then
    exit;

  pointer(Info) := ANode.Data;
  ANode.Data := nil;

  Info := nil;
end;

procedure TScriptDebuggerStackFrame.TreeListStackExpanding(Sender: TcxCustomTreeList; ANode: TcxTreeListNode; var Allow: Boolean);
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

constructor TScriptDebuggerStackFrame.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TScriptDebuggerStackFrame.DebuggerStateChanged(State: TScriptDebuggerNotification);
begin
  case State of
    dnDebugSuspended:
      UpdateInfo;

  else
    TreeListStack.Clear;
  end;
end;

destructor TScriptDebuggerStackFrame.Destroy;
begin
  inherited;
end;

procedure TScriptDebuggerStackFrame.UpdateInfo;
var
  ProgramExecution : TdwsProgramExecution;
  Node: TcxTreeListNode;
  i: integer;
  ValueInfo: IInfo;
  Data: Variant;
  ScriptObj: TScriptObjInstance;
  s: string;
begin
  FLoading := True;
  TreeListStack.BeginUpdate;
  try
    TreeListStack.Clear;

    ProgramExecution := TdwsProgramExecution(Debugger.GetDebugger.Execution);
    if (ProgramExecution = nil) or (ProgramExecution.Debugger = nil)  then
      exit;

    for i := ProgramExecution.Stack.StackPointer-1 downto 0 do
    begin
      Node := TreeListStack.Add;
      Node.Values[0] := IntToStr(i);
      Node.ImageIndex := -1;
      Node.OverlayIndex := -1;
      Node.StateIndex := -1;

      ProgramExecution.Stack.ReadValue(i, Data);
      try
        if (VarType(Data) = varUnknown) then
        begin
          ScriptObj := TScriptObjInstance(IUnknown(Data));
          if (ScriptObj <> nil) then
          begin
            CreateInfoOnSymbol(ValueInfo, ProgramExecution.ProgramInfo, ScriptObj.ClassSym, ProgramExecution.Stack.Data, i);
            LoadNode(Node, ValueInfo, ScriptObj.ClassSym);
            if (ProgramExecution.SelfScriptObject <> nil) and (TScriptObjInstance(ProgramExecution.SelfScriptObject^) = ScriptObj) then
              Node.OverlayIndex := 20;
          end else
            Node.Values[1] := '(nil)';
        end else
        begin
          try
            Node.Values[1] := VarToStr(Data);
          except
            on E: Exception do
            begin
              Node.Values[1] := '('+E.Message+')';
            end;
          end;

          s := VarTypeAsText(VarType(Data));
          Node.Values[2] := s;
        end;
      finally
        Data := Unassigned;
      end;

      if (i = ProgramExecution.Stack.BasePointer) then
      begin
        Node.Selected := True;
        Node.Focused := True;
        Node.StateIndex := 20;
      end;
    end;

  finally
    TreeListStack.EndUpdate;
    FLoading := False;
  end;
end;

initialization
  RegisterClass(TScriptDebuggerStackFrame);
finalization
end.
