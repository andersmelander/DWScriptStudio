unit ScriptDebuggerFrameAST;

(*
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
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, ImgList, Menus, ActnList,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  cxContainer, cxEdit, cxCustomData, cxStyles, cxTL, cxTextEdit, cxTLdxBarBuiltInMenu, cxInplaceContainer,
  cxClasses, cxTLData, dxSkinsdxBarPainter, dxBar,
  cxDataControllerConditionalFormattingRulesManagerDialog,

  dwsUtils,
  dwsExprs,
  dwsSymbols,
  dwsErrors,

  ScriptDebuggerAPI;

type
  TFrame = TScriptDebuggerFrame;

  TScriptDebuggerASTFrame = class(TFrame)
    TreeListAST: TcxTreeList;
    cxTreeList1Column1: TcxTreeListColumn;
    cxStyleRepository1: TcxStyleRepository;
    StyleBackground: TcxStyle;
    TreeListASTColumn1: TcxTreeListColumn;
    procedure TreeListASTDblClick(Sender: TObject);
  private
    procedure LoadNode(Node: TcxTreeListNode; Expression: TExprBase);

    procedure UpdateInfo(Expression: TExprBase); overload;
  protected
    procedure Initialize(const ADebugger: IScriptDebugger; AImageList, AImageListSymbols: TCustomImageList); override;
    procedure Finalize; override;
    procedure DebuggerStateChanged(State: TScriptDebuggerNotification); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure UpdateInfo; overload;
  end;

implementation

{$R *.dfm}

uses
  dwsDebugger,
  dwsInfo,
  dwsCompiler,
  dwsDataContext,
  dwsUnitSymbols,
  ScriptDebuggerFrameSymbols;


procedure TScriptDebuggerASTFrame.Initialize(const ADebugger: IScriptDebugger; AImageList, AImageListSymbols: TCustomImageList);
begin
  inherited Initialize(ADebugger, AImageList, AImageListSymbols);
  TreeListAST.Images := AImageListSymbols;
end;

function ExpressionToSomethingNice(Expression: TExprBase): string;
begin
  Result := Expression.FuncSymQualifiedName;
  if (Expression is TFuncExprBase) then
  begin
    if (TFuncExprBase(Expression).FuncSym <> nil) then
      Result := TFuncExprBase(Expression).FuncSym.Description;
  end;
end;

procedure TScriptDebuggerASTFrame.LoadNode(Node: TcxTreeListNode; Expression: TExprBase);
var
  ChildNode: TcxTreeListNode;
  i: integer;
  s: string;
begin
  if (Expression = nil) then
    exit;

  Node.ImageIndex := -1;
  Node.Values[0] := Expression.ClassName;
  s := ExpressionToSomethingNice(Expression);
  if (s <> '') then
    Node.Values[1] := s;
  Node.Data := Expression;

  for i := 0 to Expression.SubExprCount-1 do
  begin
    ChildNode := Node.AddChild;
    LoadNode(ChildNode, Expression.SubExpr[i]);
  end;
end;

procedure TScriptDebuggerASTFrame.TreeListASTDblClick(Sender: TObject);
var
  Node: TcxTreeListNode;
  Expression: TExprBase;
begin
  Node := TreeListAST.FocusedNode;
  if (Node = nil) or (Node.Data = nil) then
    Exit;

  Expression := TExprBase(Node.Data);
  if (not Expression.ScriptPos.Defined) then
    exit;

  Debugger.ViewScriptPos(Expression.ScriptPos);
end;

function FindExpression(ANode: TcxTreeListNode; AData: Pointer): Boolean;
begin
  Result := (ANode.Data <> nil) and (TExprBase(ANode.Data).ScriptPos.Defined) and (TExprBase(ANode.Data).ScriptPos.SamePosAs(TExprBase(AData).ScriptPos));
end;

procedure TScriptDebuggerASTFrame.UpdateInfo(Expression: TExprBase);
var
  Node: TcxTreeListNode;
begin
  if (Expression = nil) or (not Expression.ScriptPos.Defined) then
    exit;

  Node := TreeListAST.Find(Expression, nil, False, True, FindExpression);
  if (Node <> nil) then
  begin
    Node.Focused := True;
    Node.Selected := True;
    Node.MakeVisible;
  end;
end;

constructor TScriptDebuggerASTFrame.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TScriptDebuggerASTFrame.DebuggerStateChanged(State: TScriptDebuggerNotification);
begin
  case State of
    dnCompiling:
      TreeListAST.Clear;

    dnCompiled:
      UpdateInfo;

    dnDebugSuspended:
      UpdateInfo(Debugger.GetDebugger.CurrentExpression);
  else
    TreeListAST.FocusedNode := nil;
    TreeListAST.ClearSelection;
  end;
end;

destructor TScriptDebuggerASTFrame.Destroy;
begin
  inherited;
end;

procedure TScriptDebuggerASTFrame.Finalize;
begin
  inherited;
end;

procedure TScriptDebuggerASTFrame.UpdateInfo;
var
  LoadedUnits: TList<TUnitMainSymbol>;

  procedure LoadProcSymbol(ParentNode: TcxTreeListNode; Symbol: TFuncSymbol);
  var
    ExecSelf: TObject;
    Proc: TdwsProcedure;
    Node: TcxTreeListNode;
    ImageIndex: integer;
  begin
    if (Symbol = nil) then
      exit;

    if (Symbol.Executable = nil) then
      Exit;

    ExecSelf := Symbol.Executable.GetSelf;
    if not(ExecSelf is TdwsProcedure) then
      Exit;

    Proc := TdwsProcedure(ExecSelf);

    Node := ParentNode.AddChild;
    Node.Values[0] := Symbol.QualifiedName;
    ImageIndex := 0;
    GetSymbolDescription(Symbol, ImageIndex);
    Node.ImageIndex := ImageIndex;

    Node := Node.AddChild;
    Node.ImageIndex := -1;
    LoadNode(Node, Proc.Expr);
  end;

  procedure LoadSymbol(ParentNode: TcxTreeListNode; Symbol: TSymbol);
  var
    Member: TSymbol;
  begin
    if (Symbol = nil) then
      exit;

    if (Symbol is TCompositeTypeSymbol) then
    begin
      for Member in TCompositeTypeSymbol(Symbol).Members do
        LoadSymbol(ParentNode, Member);
    end else
    if (Symbol is TFuncSymbol) then
      LoadProcSymbol(ParentNode, TFuncSymbol(Symbol));
  end;

  procedure LoadSymbolTable(ParentNode: TcxTreeListNode; SymbolTable: TSymbolTable);
  var
    i: integer;
  begin
    if (SymbolTable = nil) then
      exit;

    for i := 0 to SymbolTable.Count-1 do
      LoadSymbol(ParentNode, SymbolTable[i]);
  end;

  procedure LoadUnit(UnitMainSymbol: TUnitMainSymbol);
  var
    Node, ChildNode, ChildChildNode: TcxTreeListNode;
    ImageIndex: integer;
  begin
    if (LoadedUnits.IndexOf(UnitMainSymbol) <> -1) then
      exit;
    LoadedUnits.Add(UnitMainSymbol);

    Node := TreeListAST.Add;
    Node.Values[0] := GetSymbolDescription(UnitMainSymbol, ImageIndex);
    Node.ImageIndex := ImageIndex;

    LoadSymbolTable(Node, UnitMainSymbol.InterfaceTable);

    LoadSymbolTable(Node, UnitMainSymbol.ImplementationTable);

    LoadSymbolTable(Node, UnitMainSymbol.Table);

    if (UnitMainSymbol.InitializationExpr <> nil) then
    begin
      ChildNode := Node.AddChild;
      ChildNode.Values[0] := 'Initialization';
      ChildNode.ImageIndex := 20;
      ChildChildNode := ChildNode.AddChild;
      LoadNode(ChildChildNode, UnitMainSymbol.InitializationExpr);
    end;
    if (UnitMainSymbol.FinalizationExpr <> nil) then
    begin
      ChildNode := Node.AddChild;
      ChildNode.Values[0] := 'Finalization';
      ChildNode.ImageIndex := 20;
      ChildChildNode := ChildNode.AddChild;
      LoadNode(ChildChildNode, UnitMainSymbol.FinalizationExpr);
    end;
  end;

var
  ScriptProgram: IdwsProgram;
  Node, ChildNode: TcxTreeListNode;
  i: integer;
//  PublishedSymbols: TSimpleSymbolList;
begin
  TreeListAST.BeginUpdate;
  try
    TreeListAST.Clear;

    if (Debugger.GetDebugger.Execution <> nil) then
      ScriptProgram := Debugger.GetDebugger.Execution.Prog
    else
      ScriptProgram := nil;
    if (ScriptProgram = nil) then
      ScriptProgram := Debugger.GetProgram;
    if (ScriptProgram = nil) then
      ScriptProgram := Debugger.GetCompiledScript;
    if (ScriptProgram = nil) then
      exit;

    Node := TreeListAST.Add;
    Node.Values[0] := 'Main';
    Node.ImageIndex := 20;
    LoadSymbolTable(Node, ScriptProgram.ProgramObject.Table);

    ChildNode := Node.AddChild;
    LoadNode(ChildNode, ScriptProgram.ProgramObject.Expr);

(* Doesn't work. Was an attempt to get at the implementation section
    PublishedSymbols := ScriptProgram.ProgramObject.Root.CollectAllPublishedSymbols(False);
    try
      for i := 0 to PublishedSymbols.Count-1 do
        LoadSymbol(Node, PublishedSymbols[i]);
    finally
      PublishedSymbols.Free;
    end;
*)

    ChildNode := Node.AddChild;
    ChildNode.Values[0] := 'Initialization';
    ChildNode.ImageIndex := 20;
    ChildNode := ChildNode.AddChild;
    LoadNode(ChildNode, ScriptProgram.ProgramObject.InitExpr);

    ChildNode := Node.AddChild;
    ChildNode.Values[0] := 'Finalization';
    ChildNode.ImageIndex := 20;
    ChildNode := ChildNode.AddChild;
    LoadNode(ChildNode, ScriptProgram.ProgramObject.FinalExpr);

    LoadedUnits := TList<TUnitMainSymbol>.Create;
    try
      for i := 0 to ScriptProgram.ProgramObject.UnitMains.Count-1 do
        LoadUnit(ScriptProgram.ProgramObject.UnitMains[i]);
    finally
      LoadedUnits.Free;
    end;

  finally
    TreeListAST.EndUpdate;
  end;
end;

initialization
  RegisterClass(TScriptDebuggerASTFrame);
finalization
end.
