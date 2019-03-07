unit amScriptModuleIO;

(*
 * Copyright © 2014 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Controls,
  SysUtils, Classes,
  Generics.Collections,

  dwsComp,
  dwsExprs,
  dwsCompiler,
  dwsClassesLibModule,

  amScriptModule;

// -----------------------------------------------------------------------------
//
// TDataModuleScriptIO
//
// -----------------------------------------------------------------------------
// TODO : Include stuff from amPath.
// -----------------------------------------------------------------------------
type
  TDataModule = class(TScriptModule);

type
  TDataModuleScriptIO = class(TDataModule)
    dwsUnitIO: TdwsUnit;
    procedure dwsUnitIOClassesDirectoryMethodsCopyEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesDirectoryMethodsCreateDirectoryEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesDirectoryMethodsDeleteEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesDirectoryMethodsExistsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesDirectoryMethodsGetParentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesDirectoryMethodsIsEmptyEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesDirectoryMethodsIsRelativePathEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesDirectoryMethodsMoveEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesDirectoryMethodsGetDirectoriesEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesDirectoryMethodsGetDirectoryRootEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesDirectoryMethodsGetFilesEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesDirectoryMethodsGetAttributesEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesDirectoryMethodsGetCreationTimeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesDirectoryMethodsGetCreationTimeUtcEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesDirectoryMethodsGetLastWriteTimeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesDirectoryMethodsGetLastWriteTimeUtcEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesDirectoryMethodsGetLastAccessTimeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesDirectoryMethodsGetLastAccessTimeUtcEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsCopyEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsCreateSymLinkEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsAppendAllTextEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsAppendTextEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsCreateTextEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsDecryptEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsDeleteEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsEncryptEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsExistsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsGetAttributesEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsGetCreationTimeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsGetCreationTimeUtcEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsGetLastAccessTimeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsGetLastAccessTimeUtcEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsGetLastWriteTimeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsGetLastWriteTimeUtcEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsGetSymLinkTargetEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsMoveEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsOpenEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsOpenReadEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsOpenTextEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsOpenWriteEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsReadAllBytesEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsReadAllLinesEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsReadAllTextEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsReplaceEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsWriteAllBytesEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsWriteAllLinesEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileMethodsWriteAllTextEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesPathMethodsIsValidPathCharEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesPathMethodsIsValidFileNameCharEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesPathMethodsIsRelativePathEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesPathMethodsIsUNCPathEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesPathMethodsIsUNCRootedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesPathMethodsGetGUIDFileNameEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesPathMethodsDriveExistsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesPathMethodsMatchesPatternEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesPathMethodsChangeExtensionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesPathMethodsCombineEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesPathMethodsGetDirectoryNameEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesPathMethodsGetExtensionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesPathMethodsGetFileNameEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesPathMethodsGetFileNameWithoutExtensionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesPathMethodsGetFullPathEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesPathMethodsGetPathRootEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesPathMethodsGetRandomFileNameEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesPathMethodsGetTempFileNameEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesPathMethodsGetTempPathEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesPathMethodsGetAttributesEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesPathMethodsHasExtensionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesPathMethodsIsPathRootedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesShellMethodsExpandPathEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesShellMethodsTokenizePathEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesShellMethodsGetEnvironmentVariableEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileSystemMethodsIsAttachmentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileSystemMethodsFileExistsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitIOClassesFileSystemMethodsResolveFilenameEval(Info: TProgramInfo; ExtObject: TObject);
  private
  public
  end;

implementation

{$R *.dfm}

uses
  Windows,
  StrUtils,
  IOUtils,
  Types,
  Variants,

  dwsSymbols,
  dwsUtils,
{$ifndef OLD_DWSCRIPT}
  dwsInfo,
{$endif OLD_DWSCRIPT}

  amEnvironment,

  amPath,
  amScriptProvider,
  amScriptFileSystemAPI,
  amScriptHostFileSystem,

  amIOUtils; // Patch

// Copied from IOUtils because the fools made the method private.
function IntegerToFileAttributes(const Attributes: Integer): TFileAttributes;
begin
  Result := [];

  if Attributes and FILE_ATTRIBUTE_READONLY <> 0 then
    Include(Result, TFileAttribute.faReadOnly);
  if Attributes and FILE_ATTRIBUTE_HIDDEN <> 0 then
    Include(Result, TFileAttribute.faHidden);
  if Attributes and FILE_ATTRIBUTE_SYSTEM <> 0 then
    Include(Result, TFileAttribute.faSystem);
  if Attributes and FILE_ATTRIBUTE_DIRECTORY <> 0 then
    Include(Result, TFileAttribute.faDirectory);
  if Attributes and FILE_ATTRIBUTE_ARCHIVE <> 0 then
    Include(Result, TFileAttribute.faArchive);
  if Attributes and FILE_ATTRIBUTE_DEVICE <> 0 then
    Include(Result, TFileAttribute.faSymLink);
  if Attributes and FILE_ATTRIBUTE_NORMAL <> 0 then
    Include(Result, TFileAttribute.faNormal);
  if Attributes and FILE_ATTRIBUTE_TEMPORARY <> 0 then
    Include(Result, TFileAttribute.faTemporary);
  if Attributes and FILE_ATTRIBUTE_SPARSE_FILE <> 0 then
    Include(Result, TFileAttribute.faSparseFile);
  if Attributes and FILE_ATTRIBUTE_COMPRESSED <> 0 then
    Include(Result, TFileAttribute.faCompressed);
  if Attributes and FILE_ATTRIBUTE_OFFLINE <> 0 then
    Include(Result, TFileAttribute.faOffline);
  if Attributes and FILE_ATTRIBUTE_NOT_CONTENT_INDEXED <> 0 then
    Include(Result, TFileAttribute.faNotContentIndexed);
  if Attributes and FILE_ATTRIBUTE_ENCRYPTED <> 0 then
    Include(Result, TFileAttribute.faEncrypted);
end;

// -----------------------------------------------------------------------------
//
// Script: Directory class
//
// -----------------------------------------------------------------------------

procedure TDataModuleScriptIO.dwsUnitIOClassesDirectoryMethodsCopyEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TDirectory.Copy(Info.ParamAsString[0], Info.ParamAsString[1]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesDirectoryMethodsCreateDirectoryEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TDirectory.CreateDirectory(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesDirectoryMethodsDeleteEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TDirectory.Delete(Info.ParamAsString[0], Info.ParamAsBoolean[1]);
end;


procedure TDataModuleScriptIO.dwsUnitIOClassesDirectoryMethodsExistsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TDirectory.Exists(Info.ParamAsString[0], Info.ParamAsBoolean[1]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesDirectoryMethodsGetAttributesEval(Info: TProgramInfo; ExtObject: TObject);
var
  Attributes: TFileAttributes;
begin
  Attributes := TDirectory.GetAttributes(Info.ParamAsString[0], Info.ParamAsBoolean[1]);
  Info.ResultAsInteger := Word(Attributes);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesDirectoryMethodsGetCreationTimeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := TDirectory.GetCreationTime(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesDirectoryMethodsGetCreationTimeUtcEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := TDirectory.GetCreationTimeUtc(Info.ParamAsString[0]);
end;

var
  PredicateInfo: IInfo = nil;

function FilterPredicate(const Path: string; const SearchRec: TSearchRec): Boolean;
var
  SearchRecInfo: IInfo;
begin
  ASSERT(PredicateInfo <> nil);
  PredicateInfo.Parameter['Path'].ValueAsString := Path;
  SearchRecInfo := PredicateInfo.Parameter['SearchRec'];
  SearchRecInfo.Member['Size'].ValueAsInteger := SearchRec.Size;
  SearchRecInfo.Member['Attr'].ValueAsInteger := Word(IntegerToFileAttributes(SearchRec.Attr));
  SearchRecInfo.Member['Name'].ValueAsString := SearchRec.Name;
  SearchRecInfo.Member['ExcludeAttr'].ValueAsInteger := SearchRec.ExcludeAttr;
  SearchRecInfo.Member['TimeStamp'].Value := SearchRec.TimeStamp;
  Result := PredicateInfo.Call.ValueAsBoolean;
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesDirectoryMethodsGetDirectoriesEval(Info: TProgramInfo; ExtObject: TObject);
var
  Predicate: TDirectory.TFilterPredicate;
  SearchOption: TSearchOption;
  Folders: Types.TStringDynArray;
  i: integer;
begin
  PredicateInfo := nil;
  try

    // Note: Currently not possible to test Info.Params[].ScriptObj to determine if parameter was supplied
    // See DWScript issue #36
    if (not VarIsEmpty(Info.Params[3].Value)) then
    begin
      Predicate := FilterPredicate;
      PredicateInfo := Info.Params[3];
    end else
      Predicate := nil;

    if (Info.ParamAsBoolean[2]) then
      SearchOption := TSearchOption.soAllDirectories
    else
      SearchOption := TSearchOption.soTopDirectoryOnly;

    Folders := TDirectory.GetDirectories(Info.ParamAsString[0], Info.ParamAsString[1], SearchOption, Predicate);

  finally
    PredicateInfo := nil;
  end;

  Info.ResultVars.ScriptDynArray.ArrayLength := Length(Folders);
  for i := 0 to Length(Folders)-1 do
    Info.ResultVars.ScriptDynArray.AsString[i] := Folders[i];
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesDirectoryMethodsGetDirectoryRootEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TDirectory.GetDirectoryRoot(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesDirectoryMethodsGetFilesEval(Info: TProgramInfo; ExtObject: TObject);
var
  Predicate: TDirectory.TFilterPredicate;
  SearchOption: TSearchOption;
  Files: Types.TStringDynArray;
  i: integer;
begin
  PredicateInfo := nil;
  try

    // Note: Currently not possible to test Info.Params[].ScriptObj to determine if parameter was supplied
    // See DWScript issue #36
    if (not VarIsEmpty(Info.Params[3].Value)) then
    begin
      Predicate := FilterPredicate;
      PredicateInfo := Info.Params[3];
    end else
      Predicate := nil;

    if (Info.ParamAsBoolean[2]) then
      SearchOption := TSearchOption.soAllDirectories
    else
      SearchOption := TSearchOption.soTopDirectoryOnly;

    Files := TDirectory.GetFiles(Info.ParamAsString[0], Info.ParamAsString[1], SearchOption, Predicate);

  finally
    PredicateInfo := nil;
  end;

  Info.ResultVars.ScriptDynArray.ArrayLength := Length(Files);
  for i := 0 to Length(Files)-1 do
    Info.ResultVars.ScriptDynArray.AsString[i] := Files[i];
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesDirectoryMethodsGetLastAccessTimeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := TDirectory.GetLastAccessTime(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesDirectoryMethodsGetLastAccessTimeUtcEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := TDirectory.GetLastAccessTimeUtc(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesDirectoryMethodsGetLastWriteTimeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := TDirectory.GetLastWriteTime(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesDirectoryMethodsGetLastWriteTimeUtcEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := TDirectory.GetLastWriteTimeUtc(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesDirectoryMethodsGetParentEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TDirectory.GetParent(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesDirectoryMethodsIsEmptyEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TDirectory.GetParent(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesDirectoryMethodsIsRelativePathEval(Info: TProgramInfo;
  ExtObject: TObject);
begin
  Info.ResultAsBoolean := TDirectory.IsRelativePath(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesDirectoryMethodsMoveEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TDirectory.Move(Info.ParamAsString[0], Info.ParamAsString[1]);
end;

// -----------------------------------------------------------------------------
//
// Script: Files class
//
// -----------------------------------------------------------------------------

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsAppendAllTextEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TFile.AppendAllText(Info.ParamAsString[0], Info.ParamAsString[1]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsAppendTextEval(Info: TProgramInfo; ExtObject: TObject);
var
  StreamWriter: TStreamWriter;
begin
  StreamWriter := TFile.AppendText(Info.ParamAsString[0]);
  Info.ResultAsVariant := CreateResultScriptObject(Info, StreamWriter);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsCopyEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TFile.Copy(Info.ParamAsString[0], Info.ParamAsString[1], Info.ParamAsBoolean[2]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsCreateSymLinkEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TFile.CreateSymLink(Info.ParamAsString[0], Info.ParamAsString[1]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsCreateTextEval(Info: TProgramInfo; ExtObject: TObject);
var
  StreamWriter: TStreamWriter;
begin
  StreamWriter := TFile.CreateText(Info.ParamAsString[0]);
  Info.ResultAsVariant := CreateResultScriptObject(Info, StreamWriter);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsDecryptEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TFile.Decrypt(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsDeleteEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TFile.Delete(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsEncryptEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TFile.Encrypt(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsExistsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TFile.Exists(Info.ParamAsString[0], Info.ParamAsBoolean[1]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsGetAttributesEval(Info: TProgramInfo; ExtObject: TObject);
var
  FileAttributes: TFileAttributes;
begin
  FileAttributes := TFile.GetAttributes(Info.ParamAsString[0], Info.ParamAsBoolean[1]);
  Info.ResultAsInteger := Word(FileAttributes);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsGetCreationTimeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := TFile.GetCreationTime(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsGetCreationTimeUtcEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := TFile.GetCreationTimeUtc(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsGetLastAccessTimeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := TFile.GetLastAccessTime(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsGetLastAccessTimeUtcEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := TFile.GetLastAccessTimeUtc(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsGetLastWriteTimeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := TFile.GetLastWriteTime(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsGetLastWriteTimeUtcEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := TFile.GetLastWriteTimeUtc(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsGetSymLinkTargetEval(Info: TProgramInfo; ExtObject: TObject);
var
  TargetName: string;
begin
  TargetName := '';
  Info.ResultAsBoolean := TFile.GetSymLinkTarget(Info.ParamAsString[0], TargetName);
  Info.ParamAsString[1] := TargetName;
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsMoveEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TFile.Move(Info.ParamAsString[0], Info.ParamAsString[1]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsOpenEval(Info: TProgramInfo; ExtObject: TObject);
var
  Stream: TStream;
begin
  // Note: TFile.Open actually returns a TFileStream
  Stream := TFile.Open(Info.ParamAsString[0], TFileMode(Info.ParamAsInteger[1]));
  Info.ResultAsVariant := CreateResultScriptObject(Info, Stream);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsOpenReadEval(Info: TProgramInfo; ExtObject: TObject);
var
  Stream: TStream;
begin
  // Note: TFile.OpenRead actually returns a TFileStream
  Stream := TFile.OpenRead(Info.ParamAsString[0]);
  Info.ResultAsVariant := CreateResultScriptObject(Info, Stream);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsOpenTextEval(Info: TProgramInfo; ExtObject: TObject);
var
  StreamReader: TStreamReader;
begin
  StreamReader := TFile.OpenText(Info.ParamAsString[0]);
  Info.ResultAsVariant := CreateResultScriptObject(Info, StreamReader);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsOpenWriteEval(Info: TProgramInfo; ExtObject: TObject);
var
  Stream: TStream;
begin
  // Note: TFile.OpenWrite actually returns a TFileStream
  Stream := TFile.OpenWrite(Info.ParamAsString[0]);
  Info.ResultAsVariant := CreateResultScriptObject(Info, Stream);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsReadAllBytesEval(Info: TProgramInfo; ExtObject: TObject);
var
  Bytes: TBytes;
  ByteString: RawByteString;
begin
  Bytes := TFile.ReadAllBytes(Info.ParamAsString[0]);
  SetLength(ByteString, Length(Bytes));
  Move(Bytes[0], ByteString[1], Length(Bytes));
  Info.ResultAsDataString := ByteString;
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsReadAllLinesEval(Info: TProgramInfo; ExtObject: TObject);
var
  Lines: Types.TStringDynArray;
  i: integer;
begin
  Lines := TFile.ReadAllLines(Info.ParamAsString[0]);

  Info.ResultVars.ScriptDynArray.ArrayLength := Length(Lines);
  for i := 0 to Length(Lines)-1 do
    Info.ResultVars.ScriptDynArray.AsString[i] := Lines[i];
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsReadAllTextEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TFile.ReadAllText(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsReplaceEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TFile.Replace(Info.ParamAsString[0], Info.ParamAsString[1], Info.ParamAsString[2], Info.ParamAsBoolean[3]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsWriteAllBytesEval(Info: TProgramInfo; ExtObject: TObject);
var
  Bytes: TBytes;
  ByteString: RawByteString;
begin
  ByteString := Info.ParamAsDataString[1];
  SetLength(Bytes, Length(ByteString));
  Move(ByteString[1], Bytes[0], Length(ByteString));

  TFile.WriteAllBytes(Info.ParamAsString[0], Bytes);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsWriteAllLinesEval(Info: TProgramInfo; ExtObject: TObject);
var
  ScriptContents: dwsUtils.TStringDynArray;
  Contents: Types.TStringDynArray;
  i: integer;
begin
  ScriptContents := Info.Params[1].ScriptDynArray.ToStringArray;
  SetLength(Contents, Length(ScriptContents));
  for i := 0 to Length(ScriptContents)-1 do
    Contents[i] := ScriptContents[i];
  TFile.WriteAllLines(Info.ParamAsString[0], Contents);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileMethodsWriteAllTextEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TFile.WriteAllText(Info.ParamAsString[0], Info.ParamAsString[1]);
end;

// -----------------------------------------------------------------------------
//
// Script: FileSystem class
//
// -----------------------------------------------------------------------------

procedure TDataModuleScriptIO.dwsUnitIOClassesFileSystemMethodsFileExistsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := Info.Execution.FileSystem.FileExists(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileSystemMethodsIsAttachmentEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TScriptDocumentFileSystem.IsAttachmentFilename(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesFileSystemMethodsResolveFilenameEval(Info: TProgramInfo; ExtObject: TObject);
var
  ScriptFileSys: IScriptFileSystem;
begin
  if (Supports(Info.Execution.FileSystem, IScriptFileSystem, ScriptFileSys)) then
    Info.ResultAsString := ScriptFileSys.ValidateFileNameEx(Info.ParamAsString[0], False)
  else
    Info.ResultAsString := Info.Execution.FileSystem.ValidateFileName(Info.ParamAsString[0]);
end;

// -----------------------------------------------------------------------------
//
// Script: Path class
//
// -----------------------------------------------------------------------------

procedure TDataModuleScriptIO.dwsUnitIOClassesPathMethodsChangeExtensionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TPath.ChangeExtension(Info.ParamAsString[0], Info.ParamAsString[1]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesPathMethodsCombineEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TPath.Combine(Info.ParamAsString[0], Info.ParamAsString[1]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesPathMethodsDriveExistsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TPath.DriveExists(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesPathMethodsGetAttributesEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Word(TPath.GetAttributes(Info.ParamAsString[0], Info.ParamAsBoolean[1]));
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesPathMethodsGetDirectoryNameEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TPath.GetDirectoryName(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesPathMethodsGetExtensionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TPath.GetExtension(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesPathMethodsGetFileNameEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TPath.GetFileName(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesPathMethodsGetFileNameWithoutExtensionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TPath.GetFileNameWithoutExtension(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesPathMethodsGetFullPathEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TPath.GetFullPath(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesPathMethodsGetGUIDFileNameEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TPath.GetGUIDFileName(Info.ParamAsBoolean[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesPathMethodsGetPathRootEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TPath.GetPathRoot(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesPathMethodsGetRandomFileNameEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TPath.GetRandomFileName;
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesPathMethodsGetTempFileNameEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TPath.GetTempFileName;
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesPathMethodsGetTempPathEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TPath.GetTempPath;
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesPathMethodsHasExtensionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TPath.HasExtension(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesPathMethodsIsPathRootedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TPath.IsPathRooted(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesPathMethodsIsRelativePathEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TPath.IsRelativePath(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesPathMethodsIsUNCPathEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TPath.IsUNCPath(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesPathMethodsIsUNCRootedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TPath.IsUNCRooted(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesPathMethodsIsValidFileNameCharEval(Info: TProgramInfo; ExtObject: TObject);
var
  Ch: Char;
  s: string;
begin
  if (Info.Params[0].TypeSym is TBaseIntegerSymbol) then
    ch := Char(Word(Info.ParamAsInteger[0]))
  else
  begin
    s := Info.ParamAsString[0];
    if (s = '') then
    begin
      Info.ResultAsBoolean := False;
      Exit;
    end;
    ch := s[1];
  end;

  Info.ResultAsBoolean := TPath.IsValidFileNameChar(Ch);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesPathMethodsIsValidPathCharEval(Info: TProgramInfo; ExtObject: TObject);
var
  Ch: Char;
  s: string;
begin
  if (Info.Params[0].TypeSym is TBaseIntegerSymbol) then
    ch := Char(Word(Info.ParamAsInteger[0]))
  else
  begin
    s := Info.ParamAsString[0];
    if (s = '') then
    begin
      Info.ResultAsBoolean := False;
      Exit;
    end;
    ch := s[1];
  end;

  Info.ResultAsBoolean := TPath.IsValidPathChar(Ch);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesPathMethodsMatchesPatternEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TPath.MatchesPattern(Info.ParamAsString[0], Info.ParamAsString[1], Info.ParamAsBoolean[2]);
end;

// -----------------------------------------------------------------------------
//
// Script: Shell class
//
// -----------------------------------------------------------------------------

procedure TDataModuleScriptIO.dwsUnitIOClassesShellMethodsExpandPathEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := ExpandEnvironmentVariable(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesShellMethodsGetEnvironmentVariableEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := WrapGetEnvironmentVariable(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptIO.dwsUnitIOClassesShellMethodsTokenizePathEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TokenizePath(Info.ParamAsString[0]);
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

initialization
  TDataModuleScriptIO.RegisterModule;
end.
