unit amScriptModuleIniFiles;

(*
 * Copyright © 2014 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Generics.Collections,
  SysUtils, Classes,

  dwsComp,
  dwsExprs,
  dwsCompiler,
  dwsSymbols,
  dwsClassesLibModule,

  amScriptModule;

// -----------------------------------------------------------------------------
//
// TDataModuleScriptIniFiles
//
// -----------------------------------------------------------------------------
type
  TDataModule = class(TScriptModule);

  TDataModuleScriptIniFiles = class(TDataModule)
    dwsUnitIniFile: TdwsUnit;
    procedure dwsUnitClassesTIniFileMethodsReadStringEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTIniFileMethodsWriteStringEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTIniFileMethodsEraseSectionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTIniFileMethodsDeleteKeyEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTIniFileMethodsUpdateFileEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTIniFileMethodsSectionExistsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTIniFileMethodsReadIntegerEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTIniFileMethodsWriteIntegerEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTIniFileMethodsReadBoolEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTIniFileMethodsWriteBoolEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTIniFileMethodsReadDateEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTIniFileMethodsReadDateTimeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTIniFileMethodsReadFloatEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTIniFileMethodsReadTimeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTIniFileMethodsWriteDateEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTIniFileMethodsWriteDateTimeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTIniFileMethodsWriteFloatEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTIniFileMethodsWriteTimeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTIniFileMethodsValueExistsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTIniFileMethodsFileNameEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIniFileClassesTIniFileCleanUp(ExternalObject: TObject);
    procedure dwsUnitIniFileClassesTIniFileConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitIniFileClassesTMemoryIniFileConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitIniFileClassesTMemoryIniFileMethodsLoadFromStreamEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIniFileClassesTMemoryIniFileMethodsSaveToStreamEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIniFileClassesTMemoryIniFileMethodsLoadFromFileEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIniFileClassesTMemoryIniFileMethodsSaveToFileEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIniFileClassesTMemoryIniFileMethodsClearEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIniFileClassesTRegistryIniFileConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitIniFileClassesTXMLIniFileConstructorsCreate1Eval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitIniFileClassesTXMLIniFileConstructorsCreate2Eval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitIniFileClassesTXMLIniFileMethodsSaveToFileEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIniFileClassesTXMLIniFileMethodsSaveToStreamEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIniFileClassesTXMLIniFileMethodsClearEval(Info: TProgramInfo; ExtObject: TObject);
  private
  protected
  published
  end;

implementation

{$R *.DFM}

uses
  Registry,
  IniFiles,
  XMLIniFile,
  XMLIntf,
  XMLDoc,
  xmldom,
  dwsFileSystem,
  amScriptAPI;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------


// -----------------------------------------------------------------------------
//
// TDataModuleScriptIniFiles
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptIniFiles.dwsUnitIniFileClassesTIniFileCleanUp(ExternalObject: TObject);
begin
  ExternalObject.Free;
end;

// -----------------------------------------------------------------------------
//
// Script: TCustomIniFile
//
// -----------------------------------------------------------------------------
// Wraps TCustomIniFile
// -----------------------------------------------------------------------------
procedure TDataModuleScriptIniFiles.dwsUnitClassesTIniFileMethodsReadStringEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TIniFile(ExtObject).ReadString(Info.ParamAsString[0], Info.ParamAsString[1], Info.ParamAsString[2]);
end;

procedure TDataModuleScriptIniFiles.dwsUnitClassesTIniFileMethodsWriteStringEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TCustomIniFile(ExtObject).WriteString(Info.ParamAsString[0], Info.ParamAsString[1], Info.ParamAsString[2]);
end;

procedure TDataModuleScriptIniFiles.dwsUnitClassesTIniFileMethodsEraseSectionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TCustomIniFile(ExtObject).EraseSection(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIniFiles.dwsUnitClassesTIniFileMethodsDeleteKeyEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TCustomIniFile(ExtObject).DeleteKey(Info.ParamAsString[0], Info.ParamAsString[1]);
end;

procedure TDataModuleScriptIniFiles.dwsUnitClassesTIniFileMethodsUpdateFileEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TCustomIniFile(ExtObject).UpdateFile;
end;

procedure TDataModuleScriptIniFiles.dwsUnitClassesTIniFileMethodsSectionExistsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TCustomIniFile(ExtObject).SectionExists(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIniFiles.dwsUnitClassesTIniFileMethodsReadIntegerEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TCustomIniFile(ExtObject).ReadInteger(Info.ParamAsString[0], Info.ParamAsString[1], Info.ParamAsInteger[2]);
end;

procedure TDataModuleScriptIniFiles.dwsUnitClassesTIniFileMethodsWriteIntegerEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TCustomIniFile(ExtObject).WriteInteger(Info.ParamAsString[0], Info.ParamAsString[1], Info.ParamAsInteger[2]);
end;

procedure TDataModuleScriptIniFiles.dwsUnitClassesTIniFileMethodsReadBoolEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TCustomIniFile(ExtObject).ReadBool(Info.ParamAsString[0], Info.ParamAsString[1], Info.ParamAsBoolean[2]);
end;

procedure TDataModuleScriptIniFiles.dwsUnitClassesTIniFileMethodsWriteBoolEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TCustomIniFile(ExtObject).WriteBool(Info.ParamAsString[0], Info.ParamAsString[1], Info.ParamAsBoolean[2]);
end;

procedure TDataModuleScriptIniFiles.dwsUnitClassesTIniFileMethodsReadDateEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := TCustomIniFile(ExtObject).ReadDate(Info.ParamAsString[0], Info.ParamAsString[1], Info.ParamAsFloat[2]);
end;

procedure TDataModuleScriptIniFiles.dwsUnitClassesTIniFileMethodsReadDateTimeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := TCustomIniFile(ExtObject).ReadDateTime(Info.ParamAsString[0], Info.ParamAsString[1], Info.ParamAsFloat[2]);
end;

procedure TDataModuleScriptIniFiles.dwsUnitClassesTIniFileMethodsReadFloatEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := TCustomIniFile(ExtObject).ReadFloat(Info.ParamAsString[0], Info.ParamAsString[1], Info.ParamAsFloat[2]);
end;

procedure TDataModuleScriptIniFiles.dwsUnitClassesTIniFileMethodsReadTimeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := TCustomIniFile(ExtObject).ReadTime(Info.ParamAsString[0], Info.ParamAsString[1], Info.ParamAsFloat[2]);
end;

procedure TDataModuleScriptIniFiles.dwsUnitClassesTIniFileMethodsWriteDateEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TCustomIniFile(ExtObject).WriteDate(Info.ParamAsString[0], Info.ParamAsString[1], Info.ParamAsFloat[2]);
end;

procedure TDataModuleScriptIniFiles.dwsUnitClassesTIniFileMethodsWriteDateTimeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TCustomIniFile(ExtObject).WriteDateTime(Info.ParamAsString[0], Info.ParamAsString[1], Info.ParamAsFloat[2]);
end;

procedure TDataModuleScriptIniFiles.dwsUnitClassesTIniFileMethodsWriteFloatEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TCustomIniFile(ExtObject).WriteFloat(Info.ParamAsString[0], Info.ParamAsString[1], Info.ParamAsFloat[2]);
end;

procedure TDataModuleScriptIniFiles.dwsUnitClassesTIniFileMethodsWriteTimeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TCustomIniFile(ExtObject).WriteTime(Info.ParamAsString[0], Info.ParamAsString[1], Info.ParamAsFloat[2]);
end;

procedure TDataModuleScriptIniFiles.dwsUnitClassesTIniFileMethodsValueExistsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TCustomIniFile(ExtObject).ValueExists(Info.ParamAsString[0], Info.ParamAsString[1]);
end;

procedure TDataModuleScriptIniFiles.dwsUnitClassesTIniFileMethodsFileNameEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TCustomIniFile(ExtObject).FileName;
end;

// -----------------------------------------------------------------------------
//
// Script: TIniFile
//
// -----------------------------------------------------------------------------
// Wraps TIniFile
// -----------------------------------------------------------------------------
procedure TDataModuleScriptIniFiles.dwsUnitIniFileClassesTIniFileConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
var
  FileSystem: IdwsFileSystem;
  Filename: string;
  ValidatedFilename: string;
begin
  ASSERT(ExtObject = nil);

  FileSystem := Info.Execution.FileSystem;
  Filename := Info.ParamAsString[0];

  ValidatedFilename := FileSystem.ValidateFileName(Filename);

  if (ValidatedFilename = '') then
    raise EScript.CreateFmt('File does not exist: %s', [Filename]);

  ExtObject := TIniFile.Create(ValidatedFilename);
end;

// -----------------------------------------------------------------------------
//
// Script: TMemoryIniFile
//
// -----------------------------------------------------------------------------
// Wraps TMemIniFile
// -----------------------------------------------------------------------------
procedure TDataModuleScriptIniFiles.dwsUnitIniFileClassesTMemoryIniFileConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ASSERT(ExtObject = nil);
  ExtObject := TMemIniFile.Create('');
end;

procedure TDataModuleScriptIniFiles.dwsUnitIniFileClassesTMemoryIniFileMethodsLoadFromStreamEval(Info: TProgramInfo; ExtObject: TObject);
var
  Strings: TStringList;
begin
  if (Info.Params[0].ExternalObject = nil) then
    raise EScript.Create('Invalid stream object');

  Strings := TStringList.Create;
  try
    Strings.LoadFromStream(TStream(Info.Params[0].ExternalObject));

    TMemIniFile(ExtObject).SetStrings(Strings);
  finally
    Strings.Free;
  end;
end;

procedure TDataModuleScriptIniFiles.dwsUnitIniFileClassesTMemoryIniFileMethodsSaveToStreamEval(Info: TProgramInfo; ExtObject: TObject);
var
  Strings: TStringList;
begin
  if (Info.Params[0].ExternalObject = nil) then
    raise EScript.Create('Invalid stream object');

  Strings := TStringList.Create;
  try
    TMemIniFile(ExtObject).GetStrings(Strings);

    Strings.SaveToStream(TStream(Info.Params[0].ExternalObject));

  finally
    Strings.Free;
  end;
end;

procedure TDataModuleScriptIniFiles.dwsUnitIniFileClassesTMemoryIniFileMethodsLoadFromFileEval(Info: TProgramInfo; ExtObject: TObject);
var
  Stream: TStream;
  FileSystem: IdwsFileSystem;
  Filename: string;
  Strings: TStringList;
begin
  FileSystem := Info.Execution.FileSystem;
  Filename := Info.Params[0].ValueAsString;
  if (FileSystem.FileExists(Filename)) then
  begin
    Stream := FileSystem.OpenFileStream(Filename, fomReadOnly);
    try
      Strings := TStringList.Create;
      try
        Strings.LoadFromStream(Stream);

        TMemIniFile(ExtObject).SetStrings(Strings);
      finally
        Strings.Free;
      end;
    finally
      Stream.Free;
    end;
  end else
    TMemIniFile(ExtObject).Clear;
end;

procedure TDataModuleScriptIniFiles.dwsUnitIniFileClassesTMemoryIniFileMethodsSaveToFileEval(Info: TProgramInfo; ExtObject: TObject);
var
  Stream : TStream;
  FileSystem : IdwsFileSystem;
  Strings: TStringList;
begin
  FileSystem := Info.Execution.FileSystem;
  Stream := FileSystem.OpenFileStream(Info.Params[0].ValueAsString, fomCreate);
  try
    Strings := TStringList.Create;
    try
      TMemIniFile(ExtObject).GetStrings(Strings);

      Strings.SaveToStream(Stream);
    finally
      Strings.Free;
    end;
  finally
    Stream.Free;
  end;
end;

procedure TDataModuleScriptIniFiles.dwsUnitIniFileClassesTMemoryIniFileMethodsClearEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TMemIniFile(ExtObject).Clear;
end;

// -----------------------------------------------------------------------------
//
// Script: TRegistryIniFile
//
// -----------------------------------------------------------------------------
// Wraps TRegistryIniFile
// -----------------------------------------------------------------------------
procedure TDataModuleScriptIniFiles.dwsUnitIniFileClassesTRegistryIniFileConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ASSERT(ExtObject = nil);
  ExtObject := TRegistryIniFile.Create(Info.ParamAsString[0], Info.ParamAsInteger[1]);
end;

// -----------------------------------------------------------------------------
//
// Script: TXmlIniFile
//
// -----------------------------------------------------------------------------
// Wraps TXmlIniFile
// -----------------------------------------------------------------------------
type
  TScriptXmlIniFile = class(TXmlIniFile)
  private
    FXML: IXMLDocument;
    FRootNode: IXmlNode;
  protected
    property XMLDoc: IXMLDocument read FXML;
    property RootNode: IXmlNode read FRootNode;

    constructor CreateNodePath(const NodePath: string);
  public
    constructor Create(const ANode: IXmlNode); reintroduce; overload;
    constructor Create(const Filename: string; const NodePath: string = ''); overload;
    constructor Create(const Stream: TStream; const NodePath: string = ''); overload;
    destructor Destroy; override;
  end;

constructor TScriptXmlIniFile.Create(const ANode: IXmlNode);
begin
  inherited Create(ANode);
  // We need to save the node because the base class doesn't make it available
  FRootNode := ANode;
end;

constructor TScriptXmlIniFile.Create(const Filename, NodePath: string);
begin
  FXML := LoadXMLDocument(Filename);
  // MFXML.Active := True;

  CreateNodePath(NodePath);
end;

constructor TScriptXmlIniFile.Create(const Stream: TStream; const NodePath: string);
begin
  FXML := NewXMLDocument;
  FXML.LoadFromStream(Stream);

  CreateNodePath(NodePath);
end;

constructor TScriptXmlIniFile.CreateNodePath(const NodePath: string);
var
  DOMNodeSelect: IDomNodeSelect;
  DOMNode: IDOMNode;
  Node: IXMLNode;
begin
  ASSERT(FXML <> nil);

  if (NodePath <> '') then
  begin
    DOMNodeSelect := FXML.DOMDocument as IDomNodeSelect;
    DOMNode := DOMNodeSelect.selectNode(NodePath);
    Node := TXmlNode.Create(DOMNode, nil, TXMLDocument(FXML));
  end else
    Node := FXML.DocumentElement;

  Create(Node);
end;

destructor TScriptXmlIniFile.Destroy;
begin
  inherited Destroy;
  FRootNode := nil;
  FXML := nil;
end;

procedure TDataModuleScriptIniFiles.dwsUnitIniFileClassesTXMLIniFileConstructorsCreate1Eval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ASSERT(ExtObject = nil);
  ExtObject := TScriptXmlIniFile.Create(Info.ParamAsString[0], Info.ParamAsString[1]);
end;

procedure TDataModuleScriptIniFiles.dwsUnitIniFileClassesTXMLIniFileConstructorsCreate2Eval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ASSERT(ExtObject = nil);
  ExtObject := TScriptXmlIniFile.Create(Info.ParamAsObject[0] as TStream, Info.ParamAsString[1]);
end;

procedure TDataModuleScriptIniFiles.dwsUnitIniFileClassesTXMLIniFileMethodsClearEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptXmlIniFile(ExtObject).RootNode.ChildNodes.Clear;
end;

procedure TDataModuleScriptIniFiles.dwsUnitIniFileClassesTXMLIniFileMethodsSaveToFileEval(Info: TProgramInfo; ExtObject: TObject);
var
  Stream : TStream;
  FileSystem : IdwsFileSystem;
begin
  FileSystem := Info.Execution.FileSystem;
  Stream := FileSystem.OpenFileStream(Info.Params[0].ValueAsString, fomCreate);
  try
    TScriptXmlIniFile(ExtObject).XMLDoc.SaveToStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TDataModuleScriptIniFiles.dwsUnitIniFileClassesTXMLIniFileMethodsSaveToStreamEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptXmlIniFile(ExtObject).XMLDoc.SaveToStream(Info.Params[0].ExternalObject as TStream);
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

initialization
  TDataModuleScriptIniFiles.RegisterModule;
end.
