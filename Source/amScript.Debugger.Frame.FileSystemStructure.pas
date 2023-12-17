unit amScript.Debugger.Frame.FileSystemStructure;

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
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Menus, ActnList, ImgList,
  System.UITypes,

  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxFilter, cxCustomData, cxStyles,
  dxScrollbarAnnotations, cxTL, cxTextEdit, cxTLdxBarBuiltInMenu, cxInplaceContainer, cxTLData,

  amScript.Debugger.API,
  amScript.FileSystemStructure.API;

type
  TFrame = TScriptDebuggerFrame;

  TScriptDebuggerFileSystemStructureFrame = class(TFrame)
    TreeListFileSystemStructure: TcxVirtualTreeList;
    TreeListFileSystemStructureColumnName: TcxTreeListColumn;
    procedure TreeListFileSystemStructureGetChildCount(Sender: TcxCustomTreeList; AParentNode: TcxTreeListNode;
      var ACount: Integer);
    procedure TreeListFileSystemStructureGetNodeValue(Sender: TcxCustomTreeList; ANode: TcxTreeListNode; AColumn: TcxTreeListColumn;
      var AValue: Variant);
    procedure TreeListFileSystemStructureGetNodeImageIndex(Sender: TcxCustomTreeList; ANode: TcxTreeListNode;
      AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
    procedure TreeListFileSystemStructureSelectionChanged(Sender: TObject);
    procedure TreeListFileSystemStructureDblClick(Sender: TObject);
  strict private
    procedure Finalize;

  strict private
    FFolder: IScriptFileSystemFolder;
    FRootFolders: TList<IScriptFileSystemFolder>;
    function LinkNode(Node: TcxTreeListNode): IScriptFileSystemObject;
    procedure SetFolder(const Value: IScriptFileSystemFolder);
    // property Folder: IScriptFileSystemFolder read FFolder write SetFolder;

  strict protected
    // IScriptDebuggerWindow
    procedure Initialize(const ADebugger: IScriptDebugger; AImageList, AImageListSymbols: TCustomImageList); override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}

uses
  amScript.FileSystemStructure,
  amScript.IDE.Data;


{ TDwsIdeCallStackFrame }

constructor TScriptDebuggerFileSystemStructureFrame.Create(AOwner: TComponent);
begin
  inherited;
  FRootFolders := TList<IScriptFileSystemFolder>.Create;
end;

destructor TScriptDebuggerFileSystemStructureFrame.Destroy;
begin
  Finalize;
  FRootFolders.Free;
  inherited;
end;

procedure TScriptDebuggerFileSystemStructureFrame.Initialize(const ADebugger: IScriptDebugger; AImageList, AImageListSymbols: TCustomImageList);
begin
  inherited Initialize(ADebugger, AImageList, AImageListSymbols);

  TreeListFileSystemStructure.Images := AImageList;

  // Get list of root folders
  for var Folder in ScriptFileSystemStructure do
    FRootFolders.Add(Folder);

  // Default to first root folder
  if (FRootFolders.Count > 0) then
    SetFolder(FRootFolders[0]);

  TreeListFileSystemStructure.FullRefresh;
  if (TreeListFileSystemStructure.Root.HasChildren) then
  begin
    var Node := TreeListFileSystemStructure.Root.GetFirstChild;
    Node.MakeVisible;
    Node.Expand(False);
  end;
end;

procedure TScriptDebuggerFileSystemStructureFrame.Finalize;
begin
  FRootFolders.Clear;
end;

function TScriptDebuggerFileSystemStructureFrame.LinkNode(Node: TcxTreeListNode): IScriptFileSystemObject;
var
  ParentFolder: IScriptFileSystemFolder;
begin
  Result := nil;

  if (Node.Data <> nil) then
  begin
    Result := IScriptFileSystemObject(Node.Data);
    exit;
  end;

  // If we haven't set the node reference yet, set it now
  if (Node.Parent.Parent <> nil) then
  begin
    // Parent is a file or a folder

    // Only folders have children
    if (Supports(IInterface(Node.Parent.Data), IScriptFileSystemFolder, ParentFolder)) then
    begin
      var FileSystemObject: IScriptFileSystemObject;

      var Index := Node.Index;
      if (Index <= High(ParentFolder.GetFolders)) then
        Result := ParentFolder.GetFolders[Index]
      else
      begin
        Dec(Index, Length(ParentFolder.GetFolders));
        if (Index < Length(ParentFolder.GetFiles)) then
          Result := ParentFolder.GetFiles[Index];
        // else error!
      end;
    end;

  end else
    // Parent is a root folder
    Result := FRootFolders[Node.Index];

  Node.Data := pointer(Result);
end;

procedure TScriptDebuggerFileSystemStructureFrame.SetFolder(const Value: IScriptFileSystemFolder);

  function FocusFolder(ParentNode: TcxTreeListNode): boolean;
  begin
    // First try all immediate child nodes
    var Node := ParentNode.getFirstChild;
    while (Node <> nil) do
    begin
      if (IScriptFileSystemFolder(Node.Data) = FFolder) then
      begin
        Node.MakeVisible;
        Node.Focused := True;
        Exit(True);
      end;
      Node := Node.getNextSibling;
    end;

    // Then recurse and try their children
    Node := ParentNode.getFirstChild;
    while (Node <> nil) do
    begin
      if (FocusFolder(Node)) then
        Exit(True);
      Node := Node.getNextSibling;
    end;

    Result := False;
  end;

begin
  if (FFolder = Value) then
    exit;

  FFolder := Value;

  if (TreeListFileSystemStructure.FocusedNode <> nil) and (IScriptFileSystemFolder(TreeListFileSystemStructure.FocusedNode.Data) = FFolder) then
    // Folder is already focused - Nothing to do
    exit;

  // Search for folder node
  FocusFolder(TreeListFileSystemStructure.Root);
end;

procedure TScriptDebuggerFileSystemStructureFrame.TreeListFileSystemStructureDblClick(Sender: TObject);
begin
  if (TreeListFileSystemStructure.FocusedNode = nil) or (TreeListFileSystemStructure.FocusedNode.Data = nil) then
    exit;

  var FileSystemObject := IScriptFileSystemObject(TreeListFileSystemStructure.FocusedNode.Data);

  var FileSystemFile: IScriptFileSystemFile;
  if (not Supports(FileSystemObject, IScriptFileSystemFile, FileSystemFile)) then
    exit;

  var ScriptProvider := FileSystemFile.CreateScriptProvider;

  Debugger.CreateEditor(ScriptProvider);
end;

procedure TScriptDebuggerFileSystemStructureFrame.TreeListFileSystemStructureGetChildCount(Sender: TcxCustomTreeList;
  AParentNode: TcxTreeListNode; var ACount: Integer);
var
  ParentFolder: IScriptFileSystemFolder;
begin
  if (FRootFolders = nil) then
    exit;

  if (AParentNode.Parent = nil) then
  begin
    // Root node; Each child is a structure root.
    ACount := FRootFolders.Count
  end else
  begin
    // Child node; Children are either files or folders

    var FileSystemObject := LinkNode(AParentNode);

    if (Supports(FileSystemObject, IScriptFileSystemFolder, ParentFolder)) then
      ACount := Length(ParentFolder.GetFolders) + Length(ParentFolder.GetFiles)
    else
      ACount := 0;
  end;
end;

procedure TScriptDebuggerFileSystemStructureFrame.TreeListFileSystemStructureGetNodeImageIndex(Sender: TcxCustomTreeList;
  ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
begin
  AIndex := -1;
  if (not (AIndexType in [tlitImageIndex, tlitSelectedIndex])) then
    exit;

  var FileSystemObject := LinkNode(ANode);

  if (FileSystemObject <> nil) then
  begin
    if (Supports(FileSystemObject, IScriptFileSystemFolder)) then
    begin
      if (ANode.Expanded) then
        AIndex := ImageIndexFileTypeFolderOpen
      else
        AIndex := ImageIndexFileTypeFolder;
    end else
    if (Supports(FileSystemObject, IScriptFileSystemFile)) then
      AIndex := ImageIndexFileTypeScript;
  end;
end;

procedure TScriptDebuggerFileSystemStructureFrame.TreeListFileSystemStructureGetNodeValue(Sender: TcxCustomTreeList;
  ANode: TcxTreeListNode; AColumn: TcxTreeListColumn; var AValue: Variant);
begin
  if (ANode.Parent = nil) then
    exit;

  var FileSystemObject := LinkNode(ANode);

  if (FileSystemObject <> nil) then
    AValue := FileSystemObject.Name;
end;

procedure TScriptDebuggerFileSystemStructureFrame.TreeListFileSystemStructureSelectionChanged(Sender: TObject);
begin

  if (TreeListFileSystemStructure.FocusedNode <> nil) then
    SetFolder(IScriptFileSystemFolder(TreeListFileSystemStructure.FocusedNode.Data))
  else
    SetFolder(nil);
end;

initialization
  RegisterClass(TScriptDebuggerFileSystemStructureFrame);
finalization
end.
