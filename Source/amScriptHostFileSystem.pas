unit amScriptHostFileSystem;

(*
 * Copyright © 2012 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Classes,
  SysUtils,

  dwsFileSystem,

  amScriptFileSystemAPI,
  amScriptFileSystem,
  amScriptHostAPI,
  amScriptProviderAPI;

// -----------------------------------------------------------------------------
//
// TScriptHostFileSystemFactory
//
// -----------------------------------------------------------------------------
// High level file system factory
// -----------------------------------------------------------------------------
type
  TScriptHostFileSystemFactory = class(TScriptFileSystemFactory)
  strict private
    FDocument: IScriptHostDocument;
  strict protected
  public
    constructor Create(const ADocument: IScriptHostDocument; AAllowProtected: boolean = False); reintroduce;

    function AllocateFileSystem: IdwsFileSystem; override;
  end;


// -----------------------------------------------------------------------------
//
// TScriptDocumentFileSystem
//
// -----------------------------------------------------------------------------
type
  TScriptDocumentFileSystem = class(TScriptFileSystem)
  strict private
    FDocument: IScriptHostDocument;
  strict protected
    // IdwsFileSystem
    function FileExists(const Filename: TFilename): boolean; override;
    function OpenFileStream(const Filename: TFilename; const Mode: TdwsFileOpenMode): TStream; override;

    // IScriptFileSystem
    function OpenScriptProvider(const Filename: string; FileMustExist: boolean): IScriptProvider; override;
    function ValidateFileNameEx(const FileName: string; FileMustExist: boolean): string; override;
  public
    constructor Create(const ADocument: IScriptHostDocument; const ARoot: string); reintroduce;
    destructor Destroy; override;

    class function IsAttachmentFilename(const Filename: string): boolean;
    class function ExtractAttachmentFilename(const Filename: string): string;
    class function ExtractAttachmentName(const Filename: string): string;
  end;

// -----------------------------------------------------------------------------
//
// TScriptHostDelegatingFileSystem
//
// -----------------------------------------------------------------------------
type
  TScriptHostDelegatingFileSystem = class(TScriptDelegatingFileSystem)
  strict private
    FDocument: IScriptHostDocument;
  protected
  public
    constructor Create(const ADocument: IScriptHostDocument; const ARoot: string; ASearchPath: TStrings; AAllowProtected: boolean = False); reintroduce;
  end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------


implementation

uses
  StrUtils,
  Windows,
  RTLConsts,

  dwsXPlatform, // must be before IOUtils to avoid TPath conflict
  IOUtils,

  amPath,
  amEnvironment,

  amScriptAPI,
  amScriptModule,
  amScriptHostProvider,
  amScriptProvider;


// -----------------------------------------------------------------------------
//
// TScriptDocumentFileSystem
//
// -----------------------------------------------------------------------------
constructor TScriptDocumentFileSystem.Create(const ADocument: IScriptHostDocument; const ARoot: string);
begin
  inherited Create;

  FDocument := ADocument;
end;

// -----------------------------------------------------------------------------

destructor TScriptDocumentFileSystem.Destroy;
begin
  inherited;
end;

// -----------------------------------------------------------------------------

function TScriptDocumentFileSystem.FileExists(const Filename: TFilename): boolean;
var
  ValidFilename: string;
  ScriptHostFile: IScriptHostFile;
begin
  Result := False;
  if (FDocument = nil) then
    exit;

  ValidFilename := ValidateFileNameEx(Filename, True);
  if (not IsAttachmentFilename(ValidFilename)) then
    exit;

  ValidFilename := ExtractAttachmentFilename(Filename);
  Result := (FDocument.Files.TryGetFile(ValidFilename, ScriptHostFile)) or
    (FDocument.Files.TryGetFile(ChangeFileExt(ValidFilename, ''), ScriptHostFile)); // Hack: Required to load .csv file. We need to handle this better
end;

// -----------------------------------------------------------------------------

class function TScriptDocumentFileSystem.ExtractAttachmentFilename(const Filename: string): string;
begin
  Result := Filename;

  if (Length(Result) > Length(sScriptAttachmentFilenamePrefix)) and ((sScriptAttachmentFilenamePrefix = '') or (Filename.StartsWith(sScriptAttachmentFilenamePrefix))) then
    Delete(Result, 1, Length(sScriptAttachmentFilenamePrefix));

//  if (AnsiSameText(ExtractFileExt(Result), sScriptFileType)) then // TODO : Why this?
//    Result := ChangeFileExt(Result, '');
end;

class function TScriptDocumentFileSystem.ExtractAttachmentName(const Filename: string): string;
begin
  Result := Filename;

  if (Length(Result) > Length(sScriptAttachmentFilenamePrefix)) and (sScriptAttachmentFilenamePrefix <> '') and (Filename.StartsWith(sScriptAttachmentFilenamePrefix)) then
    Delete(Result, 1, Length(sScriptAttachmentFilenamePrefix));

  Result := ChangeFileExt(Result, '');
end;

class function TScriptDocumentFileSystem.IsAttachmentFilename(const Filename: string): boolean;
begin
  Result := (Length(Filename) > Length(sScriptAttachmentFilenamePrefix)) and ((sScriptAttachmentFilenamePrefix = '') or (Filename.StartsWith(sScriptAttachmentFilenamePrefix)));

  // Special handling of UNC filename: '\\name'
  if (Result) and (sScriptAttachmentFilenamePrefix = '\') then
    Result := (Filename[2] <> '\'); // We know that the length is at least 2 since we test for that above
end;

// -----------------------------------------------------------------------------

function TScriptDocumentFileSystem.OpenFileStream(const Filename: TFilename; const mode: TdwsFileOpenMode): TStream;
var
  ValidFilename: string;
  ScriptHostFile: IScriptHostFile;
begin
  if (FDocument = nil) then
    raise EScript.CreateFmt('Attachment not valid in this context: %s', [Filename]);

  ValidFilename := ValidateFileNameEx(Filename, (Mode <> fomCreate));

  if (ValidFilename = '') then
    raise EScript.CreateFmt('Attachment not found: %s', [Filename]);

  if (not IsAttachmentFilename(ValidFilename)) then
    raise EScript.CreateFmt('Invalid Attachment name: %s', [Filename]);

  ValidFilename := ExtractAttachmentName(Filename);

  if (not FDocument.Files.TryGetFile(ValidFilename, ScriptHostFile)) then
  begin
    ValidFilename := ExtractAttachmentFilename(Filename);
    if (not FDocument.Files.TryGetFile(ValidFilename, ScriptHostFile)) then // Hack: Required to load .csv file. We need to handle this better
      raise EScript.CreateFmt('Attachment not found: %s', [Filename]);
  end;

  Result := TDocumentAttachmentStream.Create(ScriptHostFile);
end;

// -----------------------------------------------------------------------------

function TScriptDocumentFileSystem.OpenScriptProvider(const Filename: string; FileMustExist: boolean): IScriptProvider;
var
  ValidFilename: string;
begin
  ValidFilename := ValidateFileNameEx(Filename, True); // File must exist

  // Must return nil if filename doesn't apply to this filesystem or delegating filesystem will not work
  if (ValidFilename = '') then
    Exit(nil);
    // raise EScript.CreateFmt('Attachment not found: %s', [Filename]);

  if (not IsAttachmentFilename(ValidFilename)) then
    raise EScript.CreateFmt('Invalid Attachment name: %s', [Filename]);

  if (FDocument = nil) then
    raise EScript.CreateFmt('Attachment not valid in this context: %s', [Filename]);

  ValidFilename := ExtractAttachmentFilename(Filename);
  Result := TDocumentScriptProvider.Create(FDocument, ValidFilename);
end;

// -----------------------------------------------------------------------------

function TScriptDocumentFileSystem.ValidateFileNameEx(const FileName: string; FileMustExist: boolean): string;
var
  AttachmentName: string;
  ScriptHostFile: IScriptHostFile;
begin
  if (IsAttachmentFilename(Filename)) and (FDocument <> nil) then
  begin
    if (FileMustExist) then
    begin
      AttachmentName := ExtractAttachmentFilename(Filename);
      if (FDocument.Files.TryGetFile(AttachmentName, ScriptHostFile)) or
        (FDocument.Files.TryGetFile(ChangeFileExt(AttachmentName, ''), ScriptHostFile)) then // Hack: Required to load .csv file. We need to handle this better
        Result := Filename
      else
        Result := ''
    end else
      Result := Filename;
  end else
    Result := '';
end;

// -----------------------------------------------------------------------------
//
// TScriptBundleFileSystem
//
// -----------------------------------------------------------------------------
{$ifdef FEATURE_SCRIPT_BUNDLE}
constructor TScriptBundleFileSystem.Create(const AFilename: string; AAllowProtected: boolean);
begin
  inherited Create;

  FFilename := AFilename;
  FAllowProtected := AAllowProtected;
end;

destructor TScriptBundleFileSystem.Destroy;
begin
  FZipFile.Free;
  FZipFileStream.Free;
  inherited;
end;

// -----------------------------------------------------------------------------

function TScriptBundleFileSystem.GetZipFile: TZipFile;
begin
  if (FZipFile = nil) then
  begin
    // Must use TZipFile.Open(TFileStream) to prevent file from being locked
    FZipFileStream := TFileStream.Create(FFilename, fmOpenRead or fmShareDenyWrite);
    FZipFile := TZipFile.Create;
    FZipFile.Open(FZipFileStream, zmRead);
  end;
  Result := FZipFile;
end;

// -----------------------------------------------------------------------------

function TScriptBundleFileSystem.FileExists(const Filename: string): boolean;
begin
  Result := (ValidateFileNameEx(Filename, True) <> '');
end;

// -----------------------------------------------------------------------------

function TScriptBundleFileSystem.OpenFileStream(const Filename: string; const mode: TdwsFileOpenMode): TStream;
var
  ValidFilename: string;
  Index: integer;
  LocalHeader: TZipHeader;
  SourceStream: TMemoryStream;
  Stream: TStream;
begin
  if (not (Mode in [fomReadOnly, fomFastSequentialRead])) then
    raise EScript.Create('Invalid file open mode');

  ValidFilename := ValidateFileNameEx(Filename, True);

  if (ValidFilename <> '') then
    Index := ZipFileIndexOf(ZipFile, ValidFilename)
  else
    Index := -1;

  if (Index = -1) then
    raise EScript.CreateFmt('File not found in bundle: %s (%s)', [Filename, FFilename]);

  if (FAllowProtected) and (AnsiSameText(Copy(ZipFile.FileComment[Index], 1, ZipFile.FileInfo[Index].FileCommentLength) , 'protected')) then
  begin
    Result := TMemoryStream.Create;
    try

      SourceStream := TMemoryStream.Create;
      try
        ZipFile.Read(Index, Stream, LocalHeader);
        try
          SourceStream.CopyFrom(Stream, LocalHeader.UncompressedSize);
          SourceStream.Position := 0;
          ScriptDecryptStream(SourceStream, Result);
          //ScriptDecryptStream(Stream, Result);
        finally
          Stream.Free;
        end;

        Result.Position := 0;
      finally
        SourceStream.Free;
      end;

    except
      Result.Free;
      raise;
    end;
  end else
  begin
    Result := TMemoryStream.Create;
    try
      ZipFile.Read(Index, Stream, LocalHeader);
      try
        Result.CopyFrom(Stream, LocalHeader.UncompressedSize);
      finally
        Stream.Free;
      end;

      Result.Position := 0;
    except
      Result.Free;
      raise;
    end;
  end;
end;

// -----------------------------------------------------------------------------

function TScriptBundleFileSystem.OpenScriptProvider(const Filename: string; FileMustExist: boolean): IScriptProvider;
var
  ValidFilename: string;
  Stream: TStream;
begin
  ValidFilename := ValidateFileNameEx(Filename, True); // File must exist

  // Must return nil if filename doesn't apply to this filesystem or delegating filesystem will not work
  if (ValidFilename = '') then
    Exit(nil);
    // raise EScript.CreateFmt('File not found in zip: %s (%s)', [Filename, FFilename]);

  Stream := OpenFileStream(ValidFilename, fomReadOnly);
  Result := TBundleScriptProvider.Create(FFilename, ValidFilename, FAllowProtected, Stream);
end;

// -----------------------------------------------------------------------------

function TScriptBundleFileSystem.ValidateFileName(const Filename: string): string;
begin
  Result := ValidateFileNameEx(Filename, True);
end;

// -----------------------------------------------------------------------------

function TScriptBundleFileSystem.ValidateFileNameEx(const FileName: string; FileMustExist: boolean): string;
var
  ValidFilename: string;
  Index: integer;
begin
  Result := '';

  // Make sure we have a valid Windows path (Zip can use either / or \)
  ValidFilename := StringReplace(Filename, '/', '\', [rfReplaceAll]);

  // Remove double slashes
  ValidFilename := RemoveDoubleBackslashesFromPath(ValidFilename);

  if (ValidFilename = '') then
    exit;

  if (not TPath.IsRelativePath(ValidFilename)) then
    Exit;

  // Remove leading \
  if (ValidFilename[1] = '\') then
    Delete(ValidFilename, 1, 1);

  Index := ZipFileIndexOf(ZipFile, ValidFilename);

  if (Index <> -1) then
  begin
    Result := ZipFile.FileName[Index];
    if (not FAllowProtected) and (AnsiSameText(Copy(ZipFile.FileComment[Index], 1, ZipFile.FileInfo[Index].FileCommentLength) , 'protected')) then
      Result := '';
  end;
end;
{$endif FEATURE_SCRIPT_BUNDLE}

// -----------------------------------------------------------------------------
//
// TScriptHostDelegatingFileSystem
//
// -----------------------------------------------------------------------------
constructor TScriptHostDelegatingFileSystem.Create(const ADocument: IScriptHostDocument; const ARoot: string; ASearchPath: TStrings; AAllowProtected: boolean);
begin
  inherited Create(ARoot, ASearchPath, AAllowProtected);

  FDocument := ADocument;

  if (FDocument <> nil) then
    FileSystems.Add(TScriptDocumentFileSystem.Create(FDocument, ARoot));
end;


// -----------------------------------------------------------------------------
//
// TScriptHostFileSystemFactory
//
// -----------------------------------------------------------------------------
constructor TScriptHostFileSystemFactory.Create(const ADocument: IScriptHostDocument; AAllowProtected: boolean);
begin
  inherited Create(AAllowProtected);

  FDocument := ADocument;
end;

// -----------------------------------------------------------------------------

function TScriptHostFileSystemFactory.AllocateFileSystem: IdwsFileSystem;
var
  i: integer;
begin
  Result := TScriptHostDelegatingFileSystem.Create(FDocument, Root, SearchPath, AllowProtected);

  if (RootFileSystem <> nil) then
    TScriptHostDelegatingFileSystem(Result).MountFileSystem(RootFileSystem);

  for i := 0 to FileSystems.Count-1 do
    TScriptHostDelegatingFileSystem(Result).MountFileSystem(FileSystems[i]);
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

end.

