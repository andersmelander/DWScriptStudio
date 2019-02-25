unit ScriptDebuggerFrameSymbols;

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
  Dialogs, ImgList, ComCtrls, ActnList, System.Actions, System.ImageList,

  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  cxContainer, cxEdit, cxTreeView, dxSkinsdxBarPainter, dxBar, cxClasses, cxImageList,

  dwsSymbols,
{$ifndef OLD_DWSCRIPT}
  dwsUnitSymbols,
{$endif OLD_DWSCRIPT}

  amProgressForm,

  ScriptDebuggerAPI;

type
  TFrame = TScriptDebuggerFrame;

  TScriptDebuggerSymbolsFrame = class(TFrame)
    TreeViewSymbols: TcxTreeView;
    ImageListSymbols: TcxImageList;
    ActionListSymbols: TActionList;
    ActionSymbolsViewScopePublished: TAction;
    ActionSymbolsViewScopePublic: TAction;
    ActionSymbolsViewScopeProtected: TAction;
    ActionSymbolsViewScopePrivate: TAction;
    BarManagerSymbols: TdxBarManager;
    BarSeparatorSymbols1: TdxBarSeparator;
    MenuItemSymbolsScopePublished: TdxBarButton;
    MenuItemSymbolsScopePublic: TdxBarButton;
    MenuItemScopeSymbolsProtected: TdxBarButton;
    MenuItemSymbolsScopePrivate: TdxBarButton;
    BarSeparatorSymbols2: TdxBarSeparator;
    BarPopupMenuSymbols: TdxBarPopupMenu;
    ActionSymbolsViewSource: TAction;
    BarButtonSymbolsViewSource: TdxBarButton;
    procedure TreeViewSymbolsDblClick(Sender: TObject);
    procedure ActionSymbolsViewScopeExecute(Sender: TObject);
    procedure ActionSymbolsViewScopeUpdate(Sender: TObject);
    procedure ActionListSymbolsUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure ActionSymbolsViewSourceExecute(Sender: TObject);
    procedure ActionSymbolsViewSourceUpdate(Sender: TObject);
  private
    FSymbols: TDictionary<TSymbol, TTreeNode>;
    FVisibilities: TdwsVisibilities;
    FProgress: IProgress;
    function LoadSymbol(Symbol, ParentSymbol: TSymbol; ParentNode: TTreeNode; Visibilities: TdwsVisibilities): TTreeNode;
    procedure LoadSymbols(ATable: TSymbolTable; ParentSymbol: TSymbol; ParentNode: TTreeNode; Visibilities: TdwsVisibilities);
  private
{$ifndef OLD_DWSCRIPT}
    FUnitSymbols: TList<TUnitSymbol>;
    procedure CollectUnitSymbol(UnitSymbol: TUnitSymbol);
{$endif OLD_DWSCRIPT}
  protected
    procedure Initialize(const ADebugger: IScriptDebugger; AImageList, AImageListSymbols: TCustomImageList); override;
    procedure Finalize; override;
    procedure DebuggerStateChanged(State: TScriptDebuggerNotification); override;
  public
    constructor Create(AOwner: TComponent); override;

    procedure UpdateInfo;
  end;

function GetSymbolDescription(Sym: TSymbol): string; overload;
function GetSymbolDescription(Sym: TSymbol; var ImageIndex: integer): string; overload;

implementation

{$R *.dfm}

uses
{$ifndef OLD_DWSCRIPT}
  dwsScriptSource,
{$else OLD_DWSCRIPT}
  dwsUnitSymbols,
{$endif OLD_DWSCRIPT}
  dwsErrors,
  dwsSuggestions,
  dwsFunctions,
  dwsUtils,
  amCursorService;

function GetSymbolDescription(Sym: TSymbol): string;
var
  ImageIndex: integer;
begin
  Result := GetSymbolDescription(Sym, ImageIndex);
end;

function GetSymbolDescription(Sym: TSymbol; var ImageIndex: integer): string;
begin
  if (Sym is TValueSymbol) then
  begin
    Result := Sym.Description;

    if (Sym is TParamSymbol) then
      ImageIndex := DebuggerSymbolImageIndexParameter
    else
    if (Sym is TPropertySymbol) then
      ImageIndex := DebuggerSymbolImageIndexProperty
    else
    if (Sym is TConstSymbol) then
    begin
      if (Sym is TElementSymbol) then
        ImageIndex := DebuggerSymbolImageIndexElement
      else
        ImageIndex := DebuggerSymbolImageIndexConst;
    end else
      ImageIndex := DebuggerSymbolImageIndexVariable;
  end else
  if (Sym is TTypeSymbol) then
  begin
    Result := Sym.Description;
    ImageIndex := DebuggerSymbolImageIndexType;

    if (Sym is THelperSymbol) then
    begin
      Result := 'helper for ' + THelperSymbol(Sym).ForType.Name;
      if (Sym.Name <> '') then
        Result := Sym.Name + ' = ' + Result;
      ImageIndex := DebuggerSymbolImageIndexType; // todo
    end else
    if (Sym is TStructuredTypeSymbol) then
    begin
      if (Sym is TClassSymbol) then
      begin
        if (TClassSymbol(Sym).Parent <> nil) then
          Result := Sym.Name + ' = class(' + TClassSymbol(Sym).Parent.Name + ')';
        ImageIndex := DebuggerSymbolImageIndexClass;
        if (TClassSymbol(Sym).IsAbstract) then
          Result := Result + ' abstract;';
        if (TClassSymbol(Sym).IsSealed) then
          Result := Result + ' sealed;';
      end else
      if (Sym is TRecordSymbol) then
        ImageIndex := DebuggerSymbolImageIndexRecord
      else
      if (Sym is TInterfaceSymbol) then
        ImageIndex := DebuggerSymbolImageIndexInterface;

      if (TStructuredTypeSymbol(Sym).IsStatic) then
        Result := Result + ' static;';
      if (TStructuredTypeSymbol(Sym).IsPartial) then
        Result := Result + ' partial;';
    end else
    if (Sym is TUnitSymbol) then
    begin
      if (TUnitSymbol(Sym).Main <> nil) then
        Result := 'unit ' + Sym.Name
      else
        Result := 'namespace ' + Sym.Name;
      ImageIndex := DebuggerSymbolImageIndexUnit;
    end else
    if (Sym is TEnumerationSymbol) then
    begin
      Result := Sym.Name + ' = ' + Sym.Description;
      ImageIndex := DebuggerSymbolImageIndexEnum;
    end else
    if (Sym is TAliasSymbol) then
    begin
      Result := Sym.Description + ' = ' + Sym.BaseType.Name;
      ImageIndex := DebuggerSymbolImageIndexType;
    end else
    if (Sym is TStructuredTypeMetaSymbol) then
    begin
      Result := Sym.Name + ' = ' + Sym.Description;
      ImageIndex := DebuggerSymbolImageIndexMeta;
    end else
    if (Sym is TArraySymbol) then
    begin
      Result := Sym.Name + ' = ' + Sym.Description;
      ImageIndex := DebuggerSymbolImageIndexArray;
    end else
    if (Sym is TSetOfSymbol) then
    begin
      Result := Sym.Name + ' = set of ' + Sym.Typ.Name;
      ImageIndex := DebuggerSymbolImageIndexSet;
    end else
    if (Sym is TFuncSymbol) then
    begin
      Result := Sym.Description;

      if (Sym is TMethodSymbol) then
      begin
        case TMethodSymbol(Sym).Kind of
          fkConstructor: ImageIndex := DebuggerSymbolImageIndexConstructor;
          fkDestructor: ImageIndex := DebuggerSymbolImageIndexDestructor;
          fkMethod: ImageIndex := DebuggerSymbolImageIndexMethod;
          fkProcedure: ImageIndex := DebuggerSymbolImageIndexProcedure;
          fkFunction: ImageIndex := DebuggerSymbolImageIndexFunction;
        end;
        if (TMethodSymbol(Sym).IsFinal) then
          Result := Result + ' final;';
        if (TMethodSymbol(Sym).IsOverloaded) then
          Result := Result + ' overload;';
        if (TMethodSymbol(Sym).IsOverride) then
          Result := Result + ' override;'
        else
        begin
          if (TMethodSymbol(Sym).IsVirtual) then
            Result := Result + ' virtual;';
          if (TMethodSymbol(Sym).IsAbstract) then
            Result := Result + ' abstract;';
        end;
      end else
      if TFuncSymbol(Sym).IsType then
        ImageIndex := DebuggerSymbolImageIndexDelegate
      else
      if (Sym.Typ = nil) then
        ImageIndex := DebuggerSymbolImageIndexProcedure
      else
        ImageIndex := DebuggerSymbolImageIndexFunction;
    end else
      ImageIndex := DebuggerSymbolImageIndexType;

    if (TTypeSymbol(Sym).IsDeprecated) then
    begin
      Result := Result + ' deprecated';
      if (TTypeSymbol(Sym).DeprecatedMessage <> '') then
        Result := Result + ' "'+TTypeSymbol(Sym).DeprecatedMessage+'"';
      Result := Result + ';';
    end;
  end else
  if (Sym is TReservedWordSymbol) then
  begin
    Result := Sym.Description;
    ImageIndex := DebuggerSymbolImageIndexReservedWord;
  end else
  if (Sym is TSpecialFunctionSymbol) then
  begin
    Result := Sym.Description;
    ImageIndex := DebuggerSymbolImageIndexSpecialFunction;
  end else
  if (Sym is TClassOperatorSymbol) then
  begin
    Result := Sym.Description;
    ImageIndex := DebuggerSymbolImageIndexOperator;
  end else
  if (Sym is TUnitMainSymbol) then
  begin
    Result := 'unit ' + Sym.Name;
    ImageIndex := DebuggerSymbolImageIndexUnit;
  end else
    Result := Sym.Caption;
end;


{$ifndef OLD_DWSCRIPT}
procedure TScriptDebuggerSymbolsFrame.CollectUnitSymbol(UnitSymbol: TUnitSymbol);
begin
  FUnitSymbols.Add(UnitSymbol);
end;
{$endif OLD_DWSCRIPT}

function TScriptDebuggerSymbolsFrame.LoadSymbol(Symbol, ParentSymbol: TSymbol; ParentNode: TTreeNode; Visibilities: TdwsVisibilities): TTreeNode;
var
  ScopeNode: TTreeNode;
  s: string;
  ImageIndex: integer;
  FuncSymbol: TFuncSymbol;
  ChildVisibilities: TdwsVisibilities;
  SymClass: TClass;
  i: integer;
{$ifndef OLD_DWSCRIPT}
  UnitSymbol: TUnitSymbol;
{$endif OLD_DWSCRIPT}
begin
  if (FProgress <> nil) then
    FProgress.AdvanceProgress;

  if (FSymbols.TryGetValue(Symbol, Result)) then
    exit;

  Result := nil;

  if (Symbol is TElementSymbol) then
  begin
    OutputDebugString(PChar(Symbol.Description));
    if (TElementSymbol(Symbol).Enumeration = nil) then
    begin
      if (Symbol.Typ.Name = 'TVarType') then
      begin
        ParentSymbol := Debugger.GetProgram.Table.FindTypeSymbol('TVarType', cvMagic);
        if (not FSymbols.TryGetValue(ParentSymbol, ParentNode)) then
          exit;
      end else
        exit;
    end else
    if (ParentSymbol <> nil) and (TElementSymbol(Symbol).Enumeration <> ParentSymbol) then
      exit;
  end;

  if (Symbol is TElementSymbol) then
  begin
    if (ParentSymbol = nil) then
    begin
      ParentSymbol := TElementSymbol(Symbol).Enumeration;
      if (ParentSymbol = nil) then
        exit;
      ParentNode := LoadSymbol(ParentSymbol, nil, ParentNode, Visibilities);
      // We have to check again as the LoadSymbol above can have loaded the current symbol via recursion
      if (FSymbols.TryGetValue(Symbol, Result)) then
        exit;
    end;
  end;

  ImageIndex := Ord(scUnknown);

  if (Visibilities <> []) then
  begin
    SymClass := Symbol.ClassType;
    if (SymClass = TFieldSymbol) then
    begin
      if not (TFieldSymbol(Symbol).Visibility in Visibilities) then
        exit;
    end else
    if (SymClass.InheritsFrom(TPropertySymbol)) then
    begin
      if not (TPropertySymbol(Symbol).Visibility in Visibilities) then
        exit;
    end else
    if (SymClass.InheritsFrom(TMethodSymbol)) then
    begin
      if not (TMethodSymbol(Symbol).Visibility in Visibilities) then
        exit;
    end;// else
//    if (Visibilities <> [cvMagic]) then
//        exit;
  end;

(*
TdwsSuggestionCategory = (scUnknown,
                         scUnit, scType,
                         scClass, scRecord, scInterface, scDelegate,
                         scFunction, scProcedure, scMethod,
                         scConstructor, scDestructor,
                         scProperty,
                         scEnum, scElement,
                         scParameter,
                         scVariable, scConst,
                         scReservedWord,
                         scSpecialFunction);
*)

  s := GetSymbolDescription(Symbol, ImageIndex);

  Result := TreeViewSymbols.Items.AddChild(ParentNode, s);

  FuncSymbol := Symbol.AsFuncSymbol;
  if (FuncSymbol <> nil) and (FuncSymbol.SourcePosition.SourceFile <> nil) then
  begin
    Result.Data := FuncSymbol;
    Result.StateIndex := 1;
  end else
    Result.StateIndex := -1;
  Result.ImageIndex := ImageIndex;
  Result.SelectedIndex := ImageIndex;
  Result.ExpandedImageIndex := ImageIndex;

  if (Symbol is TUnitSymbol) then
  begin
    if (TUnitSymbol(Symbol).Main <> nil) then
    begin
      if (ParentSymbol = nil) or ((ParentSymbol is TUnitSymbol) and (TUnitSymbol(ParentSymbol).Main = nil)) then
      begin
        FSymbols.Add(Symbol, Result);
        LoadSymbols(TUnitSymbol(Symbol).Main.Table, Symbol, Result, Visibilities);
      end;
    end else
    if (ParentNode = nil) then
    begin
      FSymbols.Add(Symbol, Result);
{$ifdef OLD_DWSCRIPT}
      if (TUnitSymbol(Symbol).NameSpace <> nil) then
      begin
        for i := 0 to TUnitSymbol(Symbol).NameSpace.Count-1 do
           LoadSymbol(TUnitSymbol(TUnitSymbol(Symbol).NameSpace.Objects[i]), Symbol, Result, Visibilities);
      end;
{$else OLD_DWSCRIPT}
      if (TUnitSymbol(Symbol).HasNameSpace) then
      begin
        FUnitSymbols := TList<TUnitSymbol>.Create;
        try
          TUnitSymbol(Symbol).EnumerateNameSpaceUnits(CollectUnitSymbol);

          for UnitSymbol in FUnitSymbols do
            LoadSymbol(UnitSymbol, Symbol, Result, Visibilities);
        finally
          FUnitSymbols.Free;
        end;
      end;
{$endif OLD_DWSCRIPT}
    end;
  end else
  begin
    FSymbols.Add(Symbol, Result);

    if (Symbol is TCompositeTypeSymbol) then
    begin
      ChildVisibilities := TCompositeTypeSymbol(Symbol).Members.Visibilities * Visibilities;

      if (cvPrivate in ChildVisibilities) then
      begin
        ScopeNode := TreeViewSymbols.Items.AddChild(Result, 'private');
        ScopeNode.StateIndex := -1;
        ScopeNode.ImageIndex := -1;
        ScopeNode.SelectedIndex := -1;
        ScopeNode.ExpandedImageIndex := -1;
        LoadSymbols(TCompositeTypeSymbol(Symbol).Members, Symbol, ScopeNode, [cvPrivate]);
      end;
      if (cvProtected in ChildVisibilities) then
      begin
        ScopeNode := TreeViewSymbols.Items.AddChild(Result, 'protected');
        ScopeNode.StateIndex := -1;
        ScopeNode.ImageIndex := -1;
        ScopeNode.SelectedIndex := -1;
        ScopeNode.ExpandedImageIndex := -1;
        LoadSymbols(TCompositeTypeSymbol(Symbol).Members, Symbol, ScopeNode, [cvProtected]);
      end;
      if (cvPublic in ChildVisibilities) then
      begin
        ScopeNode := TreeViewSymbols.Items.AddChild(Result, 'public');
        ScopeNode.StateIndex := -1;
        ScopeNode.ImageIndex := -1;
        ScopeNode.SelectedIndex := -1;
        ScopeNode.ExpandedImageIndex := -1;
        LoadSymbols(TCompositeTypeSymbol(Symbol).Members, Symbol, ScopeNode, [cvPublic]);
      end;
      if (cvPublished in ChildVisibilities) then
      begin
        ScopeNode := TreeViewSymbols.Items.AddChild(Result, 'published');
        ScopeNode.StateIndex := -1;
        ScopeNode.ImageIndex := -1;
        ScopeNode.SelectedIndex := -1;
        ScopeNode.ExpandedImageIndex := -1;
        LoadSymbols(TCompositeTypeSymbol(Symbol).Members, Symbol, ScopeNode, [cvPublished]);
      end;

      LoadSymbols(TCompositeTypeSymbol(Symbol).Members, Symbol, Result, [cvMagic]);
    end else
    if (Symbol is TEnumerationSymbol) then
      LoadSymbols(TEnumerationSymbol(Symbol).Elements, Symbol, Result, Visibilities);
  end;
end;

procedure TScriptDebuggerSymbolsFrame.LoadSymbols(ATable: TSymbolTable; ParentSymbol: TSymbol; ParentNode: TTreeNode; Visibilities: TdwsVisibilities);
var
  i: Integer;
begin
  if (ATable = nil) then
    exit;

  for i := 0 to ATable.Count-1 do
    LoadSymbol(ATable.Symbols[i], ParentSymbol, ParentNode, Visibilities);
end;

procedure TScriptDebuggerSymbolsFrame.ActionListSymbolsUpdate(Action: TBasicAction; var Handled: Boolean);
begin
//
end;

procedure TScriptDebuggerSymbolsFrame.ActionSymbolsViewScopeExecute(Sender: TObject);
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

procedure TScriptDebuggerSymbolsFrame.ActionSymbolsViewScopeUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := (TdwsVisibility(TAction(Sender).Tag) in FVisibilities);
end;

procedure TScriptDebuggerSymbolsFrame.ActionSymbolsViewSourceExecute(Sender: TObject);
var
  ScriptPos: TScriptPos;
begin
  if (TreeViewSymbols.Selected = nil) or (TreeViewSymbols.Selected.Data = nil) then
    exit;

  ScriptPos := TFuncSymbol(TreeViewSymbols.Selected.Data).SourcePosition;
  ScriptPos.Col := 0;

  Debugger.ViewScriptPos(ScriptPos);
end;

procedure TScriptDebuggerSymbolsFrame.ActionSymbolsViewSourceUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (TreeViewSymbols.Selected <> nil) and (TreeViewSymbols.Selected.Data <> nil);
end;

constructor TScriptDebuggerSymbolsFrame.Create(AOwner: TComponent);
begin
  inherited;

  FVisibilities := [cvPublic, cvPublished, cvProtected];
end;

procedure TScriptDebuggerSymbolsFrame.DebuggerStateChanged(State: TScriptDebuggerNotification);
begin
  case State of
    dnCompiled:
      UpdateInfo;
  else
    TreeViewSymbols.Items.Clear;
  end;
end;

procedure TScriptDebuggerSymbolsFrame.Finalize;
begin
  inherited;
end;

procedure TScriptDebuggerSymbolsFrame.Initialize(const ADebugger: IScriptDebugger; AImageList, AImageListSymbols: TCustomImageList);
begin
  inherited Initialize(ADebugger, AImageList, AImageListSymbols);
  TreeViewSymbols.Images := AImageListSymbols;
end;

procedure TScriptDebuggerSymbolsFrame.TreeViewSymbolsDblClick(Sender: TObject);
begin
  ActionSymbolsViewSource.Execute;
end;

procedure TScriptDebuggerSymbolsFrame.UpdateInfo;

  procedure AddStaticSymbols;
  var
    Node: TTreeNode;
    UnitMains: TUnitMainSymbols;
    Table: TSymbolTable;
    i: Integer;
  begin
    UnitMains := Debugger.GetProgram.UnitMains;

    Node := nil;
    for i := 0 to UnitMains.Count-1 do
    begin
      Table := UnitMains[i].Table;
      if (Table is TLinkedSymbolTable) then
      begin
        if (Node = nil) then
        begin
          Node := TreeViewSymbols.Items.AddChild(nil, 'Static types');
          Node.StateIndex := -1;
          Node.ImageIndex := -1;
          Node.SelectedIndex := Node.ImageIndex;
          Node.ExpandedImageIndex := Node.ImageIndex;
        end;

        LoadSymbols(TLinkedSymbolTable(Table).Parent.SymbolTable, nil, Node, FVisibilities);
      end;
    end;
  end;

var
  Node: TTreeNode;
begin
  TreeViewSymbols.Items.BeginUpdate;
  try
    TreeViewSymbols.Items.Clear;

    if (Debugger.GetProgram = nil) then
      exit;

    SaveCursor(crHourGlass);
    FProgress := ShowProgress('Loading symbols');
    try
      FProgress.Marquee := True;

      FSymbols := TDictionary<TSymbol, TTreeNode>.Create;
      try
        Node := TreeViewSymbols.Items.AddChild(nil, 'Default types');
        Node.StateIndex := -1;
        Node.ImageIndex := -1;
        Node.SelectedIndex := Node.ImageIndex;
        Node.ExpandedImageIndex := Node.ImageIndex;
        LoadSymbols(Debugger.GetProgram.ProgramObject.SystemTable.SymbolTable, nil, Node, FVisibilities);

        Node := TreeViewSymbols.Items.AddChild(nil, 'Standard functions');
        Node.StateIndex := -1;
        Node.ImageIndex := -1;
        Node.SelectedIndex := Node.ImageIndex;
        Node.ExpandedImageIndex := Node.ImageIndex;
        LoadSymbols(dwsInternalUnit.StaticTable.SymbolTable, nil, Node, FVisibilities);

        AddStaticSymbols;

        LoadSymbols(Debugger.GetProgram.Table, nil, nil, FVisibilities);
      finally
        FSymbols.Free;
      end;

    finally
      FProgress := nil;
    end;

  finally
    TreeViewSymbols.Items.EndUpdate;
  end;
end;

initialization
  RegisterClass(TScriptDebuggerSymbolsFrame);
finalization
end.

