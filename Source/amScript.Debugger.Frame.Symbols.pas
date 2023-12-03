unit amScript.Debugger.Frame.Symbols;

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
  cxContainer, cxEdit, dxSkinsdxBarPainter, dxBar, cxClasses, cxImageList,

  VirtualTrees,

  dwsSymbols,
  dwsUnitSymbols,

  amProgress,

  amScript.Debugger.API, dxLayoutContainer, dxLayoutLookAndFeels, dxLayoutControl;

type
  TFrame = TScriptDebuggerFrame;

  TScriptDebuggerSymbolsFrame = class(TFrame)
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
    ActionSymbolsViewDeclaration: TAction;
    BarButtonSymbolsViewDeclaration: TdxBarButton;
    LayoutControlGroup_Root: TdxLayoutGroup;
    LayoutControl: TdxLayoutControl;
    LayoutItemTreeView: TdxLayoutItem;
    LayoutLookAndFeelList: TdxLayoutLookAndFeelList;
    LayoutLookAndFeelStandard: TdxLayoutStandardLookAndFeel;
    LayoutGroupWarning: TdxLayoutGroup;
    LayoutLabeledItemWarning: TdxLayoutLabeledItem;
    ActionSymbolsViewImplementation: TAction;
    BarButtonSymbolsViewImplementation: TdxBarButton;
    procedure ActionSymbolsViewScopeExecute(Sender: TObject);
    procedure ActionSymbolsViewScopeUpdate(Sender: TObject);
    procedure ActionListSymbolsUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure ActionSymbolsViewDeclarationExecute(Sender: TObject);
    procedure ActionSymbolsViewDeclarationUpdate(Sender: TObject);
    procedure ActionSymbolsViewImplementationExecute(Sender: TObject);
    procedure ActionSymbolsViewImplementationUpdate(Sender: TObject);
  private type
    TSymbolTreeNodeData = record
     Symbol: TSymbol;
     Caption: string;
     ImageIndex: integer;
     StateIndex: integer;
    end;
    PSymbolTreeNodeData = ^TSymbolTreeNodeData;
  private
    FTreeView: TVirtualStringTree;
    procedure TreeViewOnGetCellText(Sender: TCustomVirtualStringTree; var E: TVSTGetCellTextEventArgs);
    procedure TreeViewOnGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: TImageIndex);
    procedure TreeViewOnNodeDblClick(Sender: TBaseVirtualTree; const HitInfo: THitInfo);
  private
    FSymbols: TDictionary<TSymbol, PVirtualNode>;
    FVisibilities: TdwsVisibilities;
    FProgress: IProgress;
    function LoadSymbol(Symbol, ParentSymbol: TSymbol; ParentNode: PVirtualNode; Visibilities: TdwsVisibilities): PVirtualNode;
    procedure LoadSymbols(ATable: TSymbolTable; ParentSymbol: TSymbol; ParentNode: PVirtualNode; Visibilities: TdwsVisibilities);
  private
    FUnitSymbols: TList<TUnitSymbol>;
    procedure CollectUnitSymbol(UnitSymbol: TUnitSymbol);
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
  VirtualTrees.Types,
  dwsScriptSource,
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


procedure TScriptDebuggerSymbolsFrame.CollectUnitSymbol(UnitSymbol: TUnitSymbol);
begin
  FUnitSymbols.Add(UnitSymbol);
end;

function TScriptDebuggerSymbolsFrame.LoadSymbol(Symbol, ParentSymbol: TSymbol; ParentNode: PVirtualNode; Visibilities: TdwsVisibilities): PVirtualNode;
var
  NodeData: PSymbolTreeNodeData;

  ScopeNode: PVirtualNode;
  FuncSymbol: TFuncSymbol;
  ChildVisibilities: TdwsVisibilities;
  SymClass: TClass;
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

  Result := FTreeView.AddChild(ParentNode);
  NodeData := FTreeView.GetNodeData(Result);
  NodeData.Symbol := Symbol;
  NodeData.ImageIndex := -1;
  NodeData.StateIndex := -1;


  FuncSymbol := Symbol.AsFuncSymbol;
  if (FuncSymbol <> nil) and ((FuncSymbol.DeclarationPosition.Defined) or (FuncSymbol.ImplementationPosition.Defined)) then
  begin
    NodeData.Symbol := FuncSymbol;
    NodeData.StateIndex := 1;
  end;

  if (Symbol is TUnitSymbol) then
  begin
    var UnitSymbol := TUnitSymbol(Symbol);

    if (UnitSymbol.Main = nil) then
      Exit;

//    if (ParentNode = nil) then
    begin
//      FSymbols.Add(Symbol, Result);
      if (UnitSymbol.HasNameSpace) then
      begin
        var UnitSymbols := TList<TUnitSymbol>.Create;
        try
          FUnitSymbols := UnitSymbols;
          try

            UnitSymbol.EnumerateNameSpaceUnits(CollectUnitSymbol);


          finally
            // Clear reference in case of recursion in LoadSymbol
            FUnitSymbols := nil;
          end;

          for UnitSymbol in UnitSymbols do
            LoadSymbol(UnitSymbol, Symbol, Result, Visibilities);
        finally
          UnitSymbols.Free;
        end;
      end;
    end;

    if (ParentSymbol = nil) or ((ParentSymbol is TUnitSymbol) and (TUnitSymbol(ParentSymbol).HasNameSpace)) then
    begin
      FSymbols.Add(Symbol, Result);
      LoadSymbols(UnitSymbol.Main.Table, Symbol, Result, Visibilities);
    end;
  end else
  begin
    FSymbols.Add(Symbol, Result);

    if (Symbol is TCompositeTypeSymbol) then
    begin
      ChildVisibilities := TCompositeTypeSymbol(Symbol).Members.Visibilities * Visibilities;

      if (cvPrivate in ChildVisibilities) then
      begin
        ScopeNode := FTreeView.AddChild(Result);
        NodeData := FTreeView.GetNodeData(ScopeNode);
        NodeData.Caption := 'private';
        NodeData.ImageIndex := -1;
        NodeData.StateIndex := -1;

        LoadSymbols(TCompositeTypeSymbol(Symbol).Members, Symbol, ScopeNode, [cvPrivate]);
      end;
      if (cvProtected in ChildVisibilities) then
      begin
        ScopeNode := FTreeView.AddChild(Result);
        NodeData := FTreeView.GetNodeData(ScopeNode);
        NodeData.Caption := 'protected';
        NodeData.ImageIndex := -1;
        NodeData.StateIndex := -1;

        LoadSymbols(TCompositeTypeSymbol(Symbol).Members, Symbol, ScopeNode, [cvProtected]);
      end;
      if (cvPublic in ChildVisibilities) then
      begin
        ScopeNode := FTreeView.AddChild(Result);
        NodeData := FTreeView.GetNodeData(ScopeNode);
        NodeData.Caption := 'public';
        NodeData.ImageIndex := -1;
        NodeData.StateIndex := -1;

        LoadSymbols(TCompositeTypeSymbol(Symbol).Members, Symbol, ScopeNode, [cvPublic]);
      end;
      if (cvPublished in ChildVisibilities) then
      begin
        ScopeNode := FTreeView.AddChild(Result);
        NodeData := FTreeView.GetNodeData(ScopeNode);
        NodeData.Caption := 'published';
        NodeData.ImageIndex := -1;
        NodeData.StateIndex := -1;

        LoadSymbols(TCompositeTypeSymbol(Symbol).Members, Symbol, ScopeNode, [cvPublished]);
      end;

      LoadSymbols(TCompositeTypeSymbol(Symbol).Members, Symbol, Result, [cvMagic]);
    end else
    if (Symbol is TEnumerationSymbol) then
      LoadSymbols(TEnumerationSymbol(Symbol).Elements, Symbol, Result, Visibilities);
  end;
end;

procedure TScriptDebuggerSymbolsFrame.LoadSymbols(ATable: TSymbolTable; ParentSymbol: TSymbol; ParentNode: PVirtualNode; Visibilities: TdwsVisibilities);
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

procedure TScriptDebuggerSymbolsFrame.ActionSymbolsViewDeclarationExecute(Sender: TObject);
begin
  var NodeData: PSymbolTreeNodeData := FTreeView.GetNodeData(FTreeView.FocusedNode);

  var ScriptPos := TFuncSymbol(NodeData.Symbol).DeclarationPosition;
  ScriptPos.Col := 0;

  Debugger.ViewScriptPos(ScriptPos);
end;

procedure TScriptDebuggerSymbolsFrame.ActionSymbolsViewDeclarationUpdate(Sender: TObject);
begin
  var Enabled := (FTreeView.FocusedNode <> nil);

  if (Enabled) then
  begin
    var NodeData: PSymbolTreeNodeData := FTreeView.GetNodeData(FTreeView.FocusedNode);
    Enabled := (NodeData <> nil) and (NodeData.Symbol <> nil) and (NodeData.Symbol is TFuncSymbol) and
      (TFuncSymbol(NodeData.Symbol).DeclarationPosition.Defined);
  end;

  TAction(Sender).Enabled := Enabled;
end;

procedure TScriptDebuggerSymbolsFrame.ActionSymbolsViewImplementationExecute(Sender: TObject);
begin
  var NodeData: PSymbolTreeNodeData := FTreeView.GetNodeData(FTreeView.FocusedNode);

  var ScriptPos := TFuncSymbol(NodeData.Symbol).ImplementationPosition;
  ScriptPos.Col := 0;

  Debugger.ViewScriptPos(ScriptPos);
end;

procedure TScriptDebuggerSymbolsFrame.ActionSymbolsViewImplementationUpdate(Sender: TObject);
begin
  var Enabled := (FTreeView.FocusedNode <> nil);

  if (Enabled) then
  begin
    var NodeData: PSymbolTreeNodeData := FTreeView.GetNodeData(FTreeView.FocusedNode);
    Enabled := (NodeData <> nil) and (NodeData.Symbol <> nil) and (NodeData.Symbol is TFuncSymbol) and
      (TFuncSymbol(NodeData.Symbol).ImplementationPosition.Defined);
  end;

  TAction(Sender).Enabled := Enabled;
end;

constructor TScriptDebuggerSymbolsFrame.Create(AOwner: TComponent);
begin
  inherited;

  FVisibilities := [cvPublic, cvPublished, cvProtected];

  FTreeView := TVirtualStringTree.Create(Self);
  FTreeView.BorderStyle := bsNone;
  FTreeView.StateImages := ImageListSymbols;
  FTreeView.NodeDataSize := SizeOf(TSymbolTreeNodeData);
  FTreeView.TreeOptions.PaintOptions := [toShowRoot, toShowButtons, toShowTreeLines, toHotTrack, toPopupMode, toThemeAware, toUseBlendedImages, toUseBlendedSelection, toGhostedIfUnfocused, toUseExplorerTheme, toHideTreeLinesIfThemed];
  FTreeView.TreeOptions.SelectionOptions := [toFullRowSelect, toRightClickSelect, toSimpleDrawSelection];
  FTreeView.TreeOptions.AutoOptions := [toAutoSpanColumns, toAutoChangeScale, toAutoHideButtons];
  FTreeView.TreeOptions.MiscOptions := [toToggleOnDblClick, toFullRepaintOnResize];
  FTreeView.TreeOptions.AnimationOptions := [toAdvancedAnimatedToggle];
  FTreeView.DrawSelectionMode := smBlendedRectangle;
  FTreeView.DragType := dtVCL;
  FTreeView.AutoScrollInterval := 100;
  FTreeView.ScrollBarOptions.HorizontalIncrement := 1;
  FTreeView.ScrollBarOptions.VerticalIncrement := 10;
  FTreeView.HintMode := hmTooltip;
(*
  FTreeView.Header.Columns.Add;
  FTreeView.Header.Columns.Add;
  FTreeView.Header.Columns[0].Margin := 0;
  FTreeView.Header.Columns[0].Spacing := 0;
  FTreeView.Header.Columns[1].Options := [{coEnabled, }coVisible, coFixed, coResizable];//, coSmartResize];
  FTreeView.Header.Columns[1].Alignment := taRightJustify;
  FTreeView.Header.Columns[1].Margin := 0;
  FTreeView.Header.Columns[1].Spacing := 0;
  FTreeView.Header.Options := [hoAutoResize{, hoVisible, hoColumnResize}];
  FTreeView.Header.AutoSizeIndex := 0;
*)
  // FTreeView.TextMargin := 0;
  FTreeView.ParentShowHint := True;
  FTreeView.ParentFont := True;

  FTreeView.OnGetCellText := TreeViewOnGetCellText;
  FTreeView.OnGetImageIndex := TreeViewOnGetImageIndex;
  FTreeView.OnNodeDblClick := TreeViewOnNodeDblClick;
//  FTreeView.OnGetPopupMenu := TreeViewOnGetPopupMenu;
//  FTreeView.OnExpanded := TreeViewOnExpanded;

  LayoutItemTreeView.Control := FTreeView;
end;

procedure TScriptDebuggerSymbolsFrame.DebuggerStateChanged(State: TScriptDebuggerNotification);
begin
  case State of
    dnCompiled:
      UpdateInfo;
  else
    FTreeView.Clear;
  end;
end;

procedure TScriptDebuggerSymbolsFrame.Finalize;
begin
  inherited;
end;

procedure TScriptDebuggerSymbolsFrame.Initialize(const ADebugger: IScriptDebugger; AImageList, AImageListSymbols: TCustomImageList);
begin
  inherited Initialize(ADebugger, AImageList, AImageListSymbols);
  FTreeView.Images := AImageListSymbols;
end;

procedure TScriptDebuggerSymbolsFrame.TreeViewOnGetCellText(Sender: TCustomVirtualStringTree; var E: TVSTGetCellTextEventArgs);
var
  NodeData: PSymbolTreeNodeData;
begin
  NodeData := FTreeView.GetNodeData(E.Node);

  if (NodeData.Caption.IsEmpty) and (NodeData.Symbol <> nil) then
    NodeData.Caption := GetSymbolDescription(NodeData.Symbol, NodeData.ImageIndex);

  E.CellText := NodeData.Caption;
end;

procedure TScriptDebuggerSymbolsFrame.TreeViewOnGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind;
  Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: TImageIndex);
var
  NodeData: PSymbolTreeNodeData;
begin
  NodeData := FTreeView.GetNodeData(Node);

  if (Kind <> ikState) then
  begin
    if (NodeData.Caption.IsEmpty) then
    begin
      if (NodeData.Symbol <> nil) then
        NodeData.Caption := GetSymbolDescription(NodeData.Symbol, NodeData.ImageIndex)
      else
        NodeData.ImageIndex := -1;
    end;

    ImageIndex := NodeData.ImageIndex;
  end else
  if (NodeData.Symbol <> nil) then
    ImageIndex := NodeData.StateIndex
  else
    ImageIndex := -1;
end;

procedure TScriptDebuggerSymbolsFrame.TreeViewOnNodeDblClick(Sender: TBaseVirtualTree; const HitInfo: THitInfo);
begin
  if (not ActionSymbolsViewDeclaration.Execute) then
    ActionSymbolsViewImplementation.Execute
end;

procedure TScriptDebuggerSymbolsFrame.UpdateInfo;

  procedure AddStaticSymbols;
  var
    NodeData: PSymbolTreeNodeData;
    Node: PVirtualNode;
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
          Node := FTreeView.AddChild(nil);
          NodeData := FTreeView.GetNodeData(Node);
          NodeData.Caption := 'Static types';
          NodeData.ImageIndex := -1;
          NodeData.StateIndex := -1;
        end;

        LoadSymbols(TLinkedSymbolTable(Table).Parent.SymbolTable, nil, Node, FVisibilities);
      end;
    end;
  end;

var
  Node: PVirtualNode;
  NodeData: PSymbolTreeNodeData;
begin
  FTreeView.BeginUpdate;
  try
    FTreeView.Clear;

    if (Debugger.GetProgram = nil) then
      exit;

    LayoutGroupWarning.Visible := (Debugger.GetProgram.Msgs.HasErrors);

    SaveCursor(crHourGlass);
    FProgress := ShowProgress('Loading symbols');
    try
      FProgress.Marquee := True;

      FSymbols := TDictionary<TSymbol, PVirtualNode>.Create;
      try
        Node := FTreeView.AddChild(nil);
        NodeData := FTreeView.GetNodeData(Node);
        NodeData.Caption := 'Default types';
        NodeData.ImageIndex := -1;
        NodeData.StateIndex := -1;
        LoadSymbols(Debugger.GetProgram.ProgramObject.SystemTable.SymbolTable, nil, Node, FVisibilities);

        Node := FTreeView.AddChild(nil);
        NodeData := FTreeView.GetNodeData(Node);
        NodeData.Caption := 'Standard functions';
        NodeData.ImageIndex := -1;
        NodeData.StateIndex := -1;
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
    FTreeView.EndUpdate;
  end;
end;

initialization
  RegisterClass(TScriptDebuggerSymbolsFrame);
finalization
end.

