unit amScriptModuleZip;

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
// TDataModuleScriptZip
//
// -----------------------------------------------------------------------------
// Wraps the TZipFile class
// -----------------------------------------------------------------------------
type
  TDataModule = class(TScriptModule);

  TDataModuleScriptZip = class(TDataModule)
    dwsUnitZip: TdwsUnit;
    procedure dwsUnitZipClassesTZipFileCleanUp(ExternalObject: TObject);
    procedure dwsUnitZipClassesTZipFileConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitZipClassesTZipFileMethodsOpenFileEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitZipClassesTZipFileMethodsOpenStreamEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitZipClassesTZipFileMethodsAddFileEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitZipClassesTZipFileMethodsAddStreamEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitZipClassesTZipFileMethodsAddDataEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitZipClassesTZipFileMethodsReadNameEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitZipClassesTZipFileMethodsReadIndexEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitZipClassesTZipFileMethodsIndexOfEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitZipClassesTZipFileMethodsIsValidFileEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitZipClassesTZipFileMethodsIsValidStreamEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitZipClassesTZipFileMethodsGetCountEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitZipClassesTZipFileMethodsGetCommentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitZipClassesTZipFileMethodsSetCommentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitZipClassesTZipFileMethodsExtractNameEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitZipClassesTZipFileMethodsExtractIndexEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitZipClassesTZipFileMethodsExtractAllEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitZipClassesTZipFileMethodsGetItemEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitZipClassesTZipFileItemCleanUp(ExternalObject: TObject);
    procedure dwsUnitZipClassesTZipFileItemMethodsGetCommentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitZipClassesTZipFileItemMethodsSetCommentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitZipClassesTZipFileItemMethodsGetFilenameEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitZipClassesTZipFileItemMethodsGetCompressedSizeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitZipClassesTZipFileItemMethodsGetUncompressedSizeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitZipClassesTZipFileItemMethodsGetCompressionMethodEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitZipClassesTZipFileItemMethodsGetCRC32Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitZipClassesTZipFileMethodsExtractFilePathEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitZipClassesTZipFileMethodsExtractFilenameEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitZipClassesTZipFileMethodsDeleteEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitZipClassesTZipFileMethodsRemoveEval(Info: TProgramInfo; ExtObject: TObject);
  private
  public
  end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

implementation

{$R *.dfm}

uses
  Zip,
  dwsFileSystem,
  dwsXPlatform,
  amScriptAPI,
  amScriptFileSystemAPI;

// -----------------------------------------------------------------------------
//
//      TZipFileHelper
//
// -----------------------------------------------------------------------------
// Adds Delete functionality to TZipFile
// http://stackoverflow.com/questions/13164299/delphi-xe2-tzipfile-replace-a-file-in-zip-archive
// -----------------------------------------------------------------------------
(* This doesn't work anymore. Thanks assholes.
type
  TZipFileHelper = class helper for TZipFile
  public
    procedure Remove(const Filename: string);
    procedure Delete(Index: integer);
  end;

// -----------------------------------------------------------------------------

procedure TZipFileHelper.Remove(const FileName: string);
var
  i: Integer;
begin
  i := IndexOf(FileName);
  if (i = -1) then
    exit;
  Delete(i);
end;

procedure TZipFileHelper.Delete(Index: integer);
var
  j: Integer;
  StartOffset, EndOffset, Size: UInt32;
  Header: TZipHeader;
  Buf: TBytes;
begin
  // Find extents for existing file in the file stream
  StartOffset := Self.FFiles[Index].LocalHeaderOffset;
  EndOffset := Self.FEndFileData;
  for j := 0 to Self.FFiles.Count - 1 do
  begin
    if (Self.FFiles[j].LocalHeaderOffset > StartOffset) and (Self.FFiles[j].LocalHeaderOffset <= EndOffset) then
      EndOffset := Self.FFiles[j].LocalHeaderOffset;
  end;
  Size := EndOffset - StartOffset;
  // Update central directory header data
  Self.FFiles.Delete(Index);
  for j := 0 to Self.FFiles.Count - 1 do
  begin
    Header := Self.FFiles[j];
    if Header.LocalHeaderOffset > StartOffset then
    begin
      Header.LocalHeaderOffset := Header.LocalHeaderOffset - Size;
      Self.FFiles[j] := Header;
    end;
  end;
  // Remove existing file stream
  SetLength(Buf, Self.FEndFileData - EndOffset);
  Self.FStream.Position := EndOffset;
  Self.FStream.Read(Buf, Length(Buf));
  Self.FStream.Size := StartOffset;
  Self.FStream.Write(Buf, Length(Buf));
  Self.FEndFileData := Self.FStream.Position;
end;
*)
// -----------------------------------------------------------------------------

type
  TScriptZipFile = class(TZipFile);

const
  ZipOpenMode: array[0..2] of TZipMode = (zmRead, zmReadWrite, zmWrite);
  FileOpenMode: array[0..2] of TdwsFileOpenMode = (fomReadOnly, fomReadWrite, fomCreate);
  ZipCompression: array[0..16] of TZipCompression = (
    zcStored,
    zcShrunk,
    zcReduce1,
    zcReduce2,
    zcReduce3,
    zcReduce4,
    zcImplode,
    zcTokenize,
    zcDeflate,
    zcDeflate64,
    zcPKImplode,
    zcBZIP2,
    zcLZMA,
    zcTERSE,
    zcLZ77,
    zcWavePack,
    zcPPMdI1);

// -----------------------------------------------------------------------------
//
// TZipFile
//
// -----------------------------------------------------------------------------

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileCleanUp(ExternalObject: TObject);
begin
  if (ExternalObject is TScriptZipFile) then
    ExternalObject.Free;
end;

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TScriptZipFile.Create;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileMethodsExtractFilenameEval(Info: TProgramInfo; ExtObject: TObject);
var
  i: Integer;
  Filename: string;
begin
  Filename := Info.ParamAsString[0];
  // Zip can use either / or \ as path delimiter.
  i := LastDelimiter('/' + '\' + DriveDelim, Filename);
  Info.ResultAsString := Copy(Filename, i + 1, MaxInt);
end;

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileMethodsExtractFilePathEval(Info: TProgramInfo; ExtObject: TObject);
var
  i: Integer;
  Filename: string;
begin
  Filename := Info.ParamAsString[0];
  // Zip can use either / or \ as path delimiter.
  i := LastDelimiter('/' + '\' + DriveDelim, Filename);
  Info.ResultAsString := Copy(Filename, 1, I);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileMethodsOpenFileEval(Info: TProgramInfo; ExtObject: TObject);
var
  FileSystem: IdwsFileSystem;
  Filename: string;
  Stream: TStream;
begin
  ASSERT(ExtObject = nil);
  FileSystem := Info.Execution.FileSystem;
  Filename := Info.Params[0].ValueAsString;

  Stream := FileSystem.OpenFileStream(Filename, FileOpenMode[Info.Params[1].ValueAsInteger]);

  if (Stream = nil) then
    raise EScript.CreateFmt('File not found: %s', [Filename]);

  TZipFile(ExtObject).Open(Stream, ZipOpenMode[Info.Params[1].ValueAsInteger]);
end;

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileMethodsOpenStreamEval(Info: TProgramInfo; ExtObject: TObject);
var
  Stream: TStream;
begin
  ASSERT(ExtObject = nil);

  Stream := TStream(Info.Params[0].ExternalObject);

  TZipFile(ExtObject).Open(Stream, ZipOpenMode[Info.Params[1].ValueAsInteger]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileMethodsReadIndexEval(Info: TProgramInfo; ExtObject: TObject);
var
  Stream: TStream;
  LocalHeader: TZipHeader;
begin
  ASSERT(ExtObject = nil);

  Stream := TStream(Info.Params[1].ExternalObject);

  TZipFile(ExtObject).Read(Info.Params[0].ValueAsInteger, Stream, LocalHeader);
end;

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileMethodsReadNameEval(Info: TProgramInfo; ExtObject: TObject);
var
  Stream: TStream;
  LocalHeader: TZipHeader;
begin
  ASSERT(ExtObject = nil);

  Stream := TStream(Info.Params[1].ExternalObject);

  TZipFile(ExtObject).Read(Info.Params[0].ValueAsString, Stream, LocalHeader);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileMethodsAddStreamEval(Info: TProgramInfo; ExtObject: TObject);
var
  Stream: TStream;
begin
  ASSERT(ExtObject = nil);

  Stream := TStream(Info.Params[0].ExternalObject);

  TZipFile(ExtObject).Add(Stream, Info.Params[1].ValueAsString, ZipCompression[Info.Params[2].ValueAsInteger]);
end;

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileMethodsAddDataEval(Info: TProgramInfo; ExtObject: TObject);
var
  Data: TBytes;
begin
  ASSERT(ExtObject = nil);

  Data := RawByteStringToBytes(Info.Params[0].ValueAsDataString);

  TZipFile(ExtObject).Add(Data, Info.Params[1].ValueAsString, ZipCompression[Info.Params[2].ValueAsInteger]);
end;

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileMethodsAddFileEval(Info: TProgramInfo; ExtObject: TObject);
var
  FileSystem: IdwsFileSystem;
  Filename: string;
  ArchiveFilename: string;
  Stream: TStream;
begin
  ASSERT(ExtObject = nil);
  FileSystem := Info.Execution.FileSystem;
  Filename := Info.Params[0].ValueAsString;

  Stream := FileSystem.OpenFileStream(Filename, fomReadOnly);

  if (Stream = nil) then
    raise EScript.CreateFmt('File not found: %s', [Filename]);

  ArchiveFilename := Info.Params[1].ValueAsString;
  if (ArchiveFilename = '') then
    ArchiveFilename := ExtractFileName(Filename);

  TZipFile(ExtObject).Add(Stream, ArchiveFilename, ZipCompression[Info.Params[2].ValueAsInteger]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileMethodsExtractAllEval(Info: TProgramInfo; ExtObject: TObject);
var
  Path: string;
  ScriptFileSys: IScriptFileSystem;
begin
  Path := Info.ParamAsString[0];
  if (Supports(Info.Execution.FileSystem, IScriptFileSystem, ScriptFileSys)) then
    Path := ScriptFileSys.ValidateFileNameEx(Path, False);

  TZipFile(ExtObject).ExtractAll(Path);
end;

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileMethodsExtractIndexEval(Info: TProgramInfo; ExtObject: TObject);
var
  Path: string;
  ScriptFileSys: IScriptFileSystem;
begin
  Path := Info.ParamAsString[1];
  if (Supports(Info.Execution.FileSystem, IScriptFileSystem, ScriptFileSys)) then
    Path := ScriptFileSys.ValidateFileNameEx(Path, False);

  TZipFile(ExtObject).Extract(Info.ParamAsInteger[0], Path, Info.ParamAsBoolean[2]);
end;

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileMethodsExtractNameEval(Info: TProgramInfo; ExtObject: TObject);
var
  Path: string;
  ScriptFileSys: IScriptFileSystem;
begin
  Path := Info.ParamAsString[1];
  if (Supports(Info.Execution.FileSystem, IScriptFileSystem, ScriptFileSys)) then
    Path := ScriptFileSys.ValidateFileNameEx(Path, False);

  TZipFile(ExtObject).Extract(Info.ParamAsString[0], Path, Info.ParamAsBoolean[2]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileMethodsIndexOfEval(Info: TProgramInfo; ExtObject: TObject);
begin
  ASSERT(ExtObject = nil);

  Info.ResultAsInteger := TZipFile(ExtObject).IndexOf(Info.Params[0].ValueAsString);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileMethodsIsValidStreamEval(Info: TProgramInfo; ExtObject: TObject);
var
  Stream: TStream;
begin
  ASSERT(ExtObject = nil);

  Stream := TStream(Info.Params[0].ExternalObject);
// TODO : TZipFile.IsValid(Stream) no longer available
//  Info.ResultAsBoolean := TZipFile.IsValid(Stream);
end;

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileMethodsIsValidFileEval(Info: TProgramInfo; ExtObject: TObject);
var
  FileSystem: IdwsFileSystem;
  Filename: string;
  Stream: TStream;
begin
  ASSERT(ExtObject = nil);
  FileSystem := Info.Execution.FileSystem;
  Filename := Info.Params[0].ValueAsString;

  Stream := FileSystem.OpenFileStream(Filename, fomReadOnly);

  if (Stream = nil) then
    raise EScript.CreateFmt('File not found: %s', [Filename]);

// TODO : TZipFile.IsValid(Stream) no longer available
//  Info.ResultAsBoolean := TZipFile.IsValid(Stream);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileMethodsGetCommentEval(Info: TProgramInfo; ExtObject: TObject);
begin
  ASSERT(ExtObject = nil);

  Info.ResultAsString := TZipFile(ExtObject).Comment;
end;

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileMethodsSetCommentEval(Info: TProgramInfo; ExtObject: TObject);
begin
  ASSERT(ExtObject = nil);

  TZipFile(ExtObject).Comment := Info.Params[0].ValueAsString;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileMethodsGetCountEval(Info: TProgramInfo; ExtObject: TObject);
begin
  ASSERT(ExtObject = nil);

  Info.ResultAsInteger := TZipFile(ExtObject).FileCount;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileMethodsDeleteEval(Info: TProgramInfo; ExtObject: TObject);
begin
  ASSERT(ExtObject = nil);

// TODO : TZipFile.Delete no longer possible
//  TZipFile(ExtObject).Delete(Info.ParamAsInteger[0]);
end;

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileMethodsRemoveEval(Info: TProgramInfo; ExtObject: TObject);
begin
  ASSERT(ExtObject = nil);

// TODO : TZipFile.Remove no longer possible
//  TZipFile(ExtObject).Remove(Info.ParamAsString[0]);
end;

// -----------------------------------------------------------------------------

type
  TZipFileItem = class
  public
    ZipFile: TZipFile;
    Index: integer;
  end;

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileMethodsGetItemEval(Info: TProgramInfo; ExtObject: TObject);
var
  Item: TZipFileItem;
begin
  ASSERT(ExtObject = nil);

  Item := TZipFileItem.Create;
  Item.ZipFile := TZipFile(ExtObject);
  Item.Index := Info.ParamAsInteger[0];

  Info.ResultAsVariant := CreateResultScriptObject(Info, Item);
end;

// -----------------------------------------------------------------------------
//
// TZipFileItem
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileItemCleanUp(ExternalObject: TObject);
begin
  ExternalObject.Free;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileItemMethodsGetCommentEval(Info: TProgramInfo; ExtObject: TObject);
var
  Index: integer;
begin
  ASSERT(ExtObject = nil);

  Index := TZipFileItem(ExtObject).Index;
  Info.ResultAsString := Copy(TZipFileItem(ExtObject).ZipFile.FileComment[Index], 1, TZipFileItem(ExtObject).ZipFile.FileInfo[Index].FileCommentLength);
end;

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileItemMethodsSetCommentEval(Info: TProgramInfo; ExtObject: TObject);
begin
  ASSERT(ExtObject = nil);

  TZipFileItem(ExtObject).ZipFile.FileComment[TZipFileItem(ExtObject).Index] := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileItemMethodsGetFilenameEval(Info: TProgramInfo; ExtObject: TObject);
begin
  ASSERT(ExtObject = nil);

  Info.ResultAsString := TZipFileItem(ExtObject).ZipFile.FileName[TZipFileItem(ExtObject).Index];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileItemMethodsGetUncompressedSizeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  ASSERT(ExtObject = nil);

  Info.ResultAsInteger := TZipFileItem(ExtObject).ZipFile.FileInfo[TZipFileItem(ExtObject).Index].UncompressedSize;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileItemMethodsGetCompressedSizeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  ASSERT(ExtObject = nil);

  Info.ResultAsInteger := TZipFileItem(ExtObject).ZipFile.FileInfo[TZipFileItem(ExtObject).Index].CompressedSize;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileItemMethodsGetCompressionMethodEval(Info: TProgramInfo; ExtObject: TObject);
begin
  ASSERT(ExtObject = nil);

  Info.ResultAsInteger := TZipFileItem(ExtObject).ZipFile.FileInfo[TZipFileItem(ExtObject).Index].CompressionMethod;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptZip.dwsUnitZipClassesTZipFileItemMethodsGetCRC32Eval(Info: TProgramInfo; ExtObject: TObject);
begin
  ASSERT(ExtObject = nil);

  Info.ResultAsInteger := TZipFileItem(ExtObject).ZipFile.FileInfo[TZipFileItem(ExtObject).Index].CRC32;
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

initialization
  TDataModuleScriptZip.RegisterModule;
end.
