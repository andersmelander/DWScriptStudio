unit amScript.FileSystem;

(*
 * Copyright © 2012 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Generics.Collections,
  Classes,
  Zip,
  SysUtils,

  dwsFileSystem,

  amScript.FileSystem.API,
  amScript.Provider.API;

// -----------------------------------------------------------------------------
//
// TScriptFileSystemFactory
//
// -----------------------------------------------------------------------------
// High level file system factory
// -----------------------------------------------------------------------------
type
  TScriptFileSystemFactory = class(TdwsCustomFileSystem)
  strict private
    FAllowProtected: boolean;
    FRoot: string;
    FRootFileSystem: IScriptFileSystem;
    FFileSystems: TList<IScriptFileSystem>;
    FSearchPath: TStrings;
  strict protected
    property AllowProtected: boolean read FAllowProtected;
    property Root: string read FRoot;
    property RootFileSystem: IScriptFileSystem read FRootFileSystem;
    property FileSystems: TList<IScriptFileSystem> read FFileSystems;

    procedure SetSearchPath(const Value: TStrings);
  public
    constructor Create(AAllowProtected: boolean = False); reintroduce;
    destructor Destroy; override;

    function AllocateFileSystem: IdwsFileSystem; override;

    procedure SetRoot(const ARoot: string);
    procedure SetRootFileSystem(const FileSystem: IScriptFileSystem);
    procedure MountFileSystem(const FileSystem: IScriptFileSystem);
    procedure UnmountFileSystem(const FileSystem: IScriptFileSystem);

    property SearchPath: TStrings read FSearchPath write SetSearchPath;
  end;

// -----------------------------------------------------------------------------
//
// TCustomScriptFileSystem
//
// -----------------------------------------------------------------------------
// Works around the silly need to implement LoadTextFile in every implementation.
// -----------------------------------------------------------------------------
type
  TCustomScriptFileSystem = class abstract(TInterfacedObject, IdwsFileSystem)
  private
  protected
    // IdwsFileSystem
    function ValidateFileName(const Filename: TFilename): TFilename; virtual; abstract;
    function FileExists(const Filename: TFilename) : boolean; virtual; abstract;
    function OpenFileStream(const Filename: TFilename; const Mode: TdwsFileOpenMode): TStream; virtual; abstract;
    function LoadTextFile(const Filename: TFilename): UnicodeString;

    // TODO -cRevival :Missing implementation
    function FindFileName(const fileName : TFileName) : TFileName;
    function GetSearchPaths : TStrings;
    procedure SetSearchPaths(const val : TStrings);
  public
  end;

// -----------------------------------------------------------------------------
//
// TScriptFileSystem
//
// -----------------------------------------------------------------------------
// Delegates IdwsFileSystem to IScriptFileSystem where applicable.
// -----------------------------------------------------------------------------
type
  TScriptFileSystem = class abstract(TCustomScriptFileSystem, IScriptFileSystem)
  private
  protected
    // IdwsFileSystem
    function ValidateFileName(const Filename: TFilename): TFilename; override;
    function FileExists(const Filename: TFilename) : boolean; override;

    // IScriptFileSystem
    function OpenScriptProvider(const Filename: string; FileMustExist: boolean): IScriptProvider; virtual; abstract;
    function ValidateFileNameEx(const FileName: string; FileMustExist: boolean): string; virtual; abstract;
  public
  end;

// -----------------------------------------------------------------------------
//
// TScriptRestrictedFileSystem
//
// -----------------------------------------------------------------------------
// Implements a physical file system with search paths.
// -----------------------------------------------------------------------------
type
  TScriptRestrictedFileSystem = class(TScriptFileSystem)
  private
    FRoot: string;
    FSearchPath: TStrings;
    FRestricted: boolean;
  protected
    // IdwsFileSystem
    function OpenFileStream(const Filename: TFilename; const Mode: TdwsFileOpenMode): TStream;  override;

    // IScriptFileSystem
    function OpenScriptProvider(const Filename: string; FileMustExist: boolean): IScriptProvider; override;
    function ValidateFileNameEx(const FileName: string; FileMustExist: boolean): string; override;
  public
    constructor Create(const ARoot: string); reintroduce; overload;
    constructor Create(const ARoot: string; ASearchPath: TStrings); reintroduce; overload;
    destructor Destroy; override;
    property Restricted: boolean read FRestricted write FRestricted;
  end;

// -----------------------------------------------------------------------------
//
// TScriptBundleFileSystem
//
// -----------------------------------------------------------------------------
type
  TScriptBundleFileSystem = class(TScriptFileSystem)
  private
    FFilename: string;
    FZipFileStream: TStream;
    FZipFile: TZipFile;
    FAllowProtected: boolean;
  protected
    function GetZipFile: TZipFile;
    property ZipFile: TZipFile read GetZipFile;

    // IdwsFileSystem
    function OpenFileStream(const Filename: TFilename; const Mode: TdwsFileOpenMode): TStream; override;

    // IScriptFileSystem
    function OpenScriptProvider(const Filename: string; FileMustExist: boolean): IScriptProvider; override;
    function ValidateFileNameEx(const FileName: string; FileMustExist: boolean): string; override;
  public
    constructor Create(const AFilename: string; AAllowProtected: boolean = False); reintroduce;
    destructor Destroy; override;
  end;

// -----------------------------------------------------------------------------
//
// TScriptDelegatingFileSystem
//
// -----------------------------------------------------------------------------
type
  TScriptDelegatingFileSystem = class(TScriptFileSystem, IScriptDelegatingFileSystem)
  private
    FFileSystems: TList<IScriptFileSystem>;
//    FRestrictedFileSystem: TScriptRestrictedFileSystem;
    FRoot: string;
    FSearchPath: TStrings;
    FAllowProtected: boolean;
  protected
    property FileSystems: TList<IScriptFileSystem> read FFileSystems;

    // IdwsFileSystem
    function FileExists(const Filename: TFilename): Boolean; override;
    function OpenFileStream(const Filename : TFilename; const Mode: TdwsFileOpenMode): TStream; override;
    function ValidateFileName(const Filename: TFilename): TFilename; override;

    // IScriptFileSystem
    function OpenScriptProvider(const Filename: string; FileMustExist: boolean): IScriptProvider; override;
    function ValidateFileNameEx(const FileName: string; FileMustExist: boolean): string; override;

    // IScriptDelegatingFileSystem
    procedure MountFileSystem(const FileSystem: IScriptFileSystem);
    procedure UnmountFileSystem(const FileSystem: IScriptFileSystem);
  public
    constructor Create(const ARoot: string; ASearchPath: TStrings; AAllowProtected: boolean = False); reintroduce;
    destructor Destroy; override;
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

  amScript.API,
  amScript.Module,
  amScript.Host.Provider,
  amScript.Provider;

// Work around for TZipFile.IndexOf() being case sensitive
// This also handles the fact that zip paths can use either back- or forward slashes. The name parameter is assumed to use backslashes only.
function ZipFileIndexOf(ZipFile: TZipFile; const Name: string): integer;
begin
  Result := ZipFile.FileCount-1;
  while (Result >= 0) do
  begin
    if (AnsiSameText(StringReplace(ZipFile.FileName[Result], '/', '\', [rfReplaceAll]), Name)) then
      break;
    Dec(Result);
  end;
end;

// -----------------------------------------------------------------------------
//
// TCustomScriptFileSystem
//
// -----------------------------------------------------------------------------
function TCustomScriptFileSystem.FindFileName(const fileName: TFileName): TFileName;
begin
  // TODO -cRevival :Missing implementation
  Result := '';
end;

function TCustomScriptFileSystem.GetSearchPaths: TStrings;
begin
  // TODO -cRevival :Missing implementation
  Result := nil;
end;

procedure TCustomScriptFileSystem.SetSearchPaths(const val: TStrings);
begin
  // TODO -cRevival :Missing implementation
end;

function TCustomScriptFileSystem.LoadTextFile(const Filename: TFilename): UnicodeString;
var
 Stream : TStream;
begin
  Stream := OpenFileStream(Filename, fomFastSequentialRead);
  if (Stream <> nil) then
  begin
    try
      Result := LoadTextFromStream(Stream);
    finally
      Stream.Free;
    end;
  end else
    Result := '';
end;


// -----------------------------------------------------------------------------
//
// TScriptFileSystem
//
// -----------------------------------------------------------------------------
function TScriptFileSystem.FileExists(const Filename: TFilename): boolean;
var
  ValidFilename: string;
begin
  ValidFilename := ValidateFileNameEx(Filename, True);
  Result := (ValidFilename <> '');
end;

function TScriptFileSystem.ValidateFileName(const Filename: TFilename): TFilename;
begin
  Result := ValidateFileNameEx(Filename, True);
end;


// -----------------------------------------------------------------------------
//
// TScriptRestrictedFileSystem
//
// -----------------------------------------------------------------------------
constructor TScriptRestrictedFileSystem.Create(const ARoot: string; ASearchPath: TStrings);
begin
  Create(ARoot);

  FSearchPath.AddStrings(ASearchPath);
end;

constructor TScriptRestrictedFileSystem.Create(const ARoot: string);
begin
  inherited Create;

  FRoot := ARoot;

  FSearchPath := TStringList.Create;
  TStringList(FSearchPath).CaseSensitive := False;
  TStringList(FSearchPath).Duplicates := dupIgnore;

  FSearchPath.Add('.\');
end;

destructor TScriptRestrictedFileSystem.Destroy;
begin
  FSearchPath.Free;
  inherited;
end;

// -----------------------------------------------------------------------------

type
  TFileHandleStream = class(THandleStream)
  public
    destructor Destroy; override;
  end;

destructor TFileHandleStream.Destroy;
begin
  if (Handle <> INVALID_HANDLE_VALUE) then
    CloseHandle(Handle);
  inherited;
end;

function TScriptRestrictedFileSystem.OpenFileStream(const Filename: TFilename; const Mode: TdwsFileOpenMode): TStream;
var
  ValidFilename: string;
  FileHandle: THandle;
  Retries: integer;
  LastError: integer;
const
  // See http://support.microsoft.com/kb/316609
  MaxRetry = 40;
  RetryDelay = 250;
begin
  ValidFilename := ValidateFileNameEx(Filename, (Mode <> fomCreate));

  // It is assumed that a previous call to ValidateFileNameEx has determined if the filename applies to this file system.
  // Thus if the above ValidateFileNameEx indicates that the filename is invalid we raise an error.
  if (ValidFilename = '') then
  begin
    if (Mode <> fomCreate) then
      raise EFOpenError.CreateFmt(SFOpenErrorEx, [Filename, SFileNotFound])
    else
      raise EFCreateError.CreateFmt(SFCreateErrorEx, [Filename, SFileNotFound]);
  end;


  Retries := 0;
  FileHandle := INVALID_HANDLE_VALUE;
  while (FileHandle = INVALID_HANDLE_VALUE) do
  begin
    case Mode of
      fomReadOnly:
        FileHandle := Integer(CreateFile(PChar(ValidFilename),
          GENERIC_READ,
          FILE_SHARE_READ or FILE_SHARE_WRITE,
          nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0));

      fomReadWrite:
        FileHandle := Integer(CreateFile(PChar(ValidFilename),
          GENERIC_READ or GENERIC_WRITE,
          FILE_SHARE_READ or FILE_SHARE_WRITE,
          nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0));

      fomCreate:
        FileHandle := Integer(CreateFile(PChar(ValidFilename),
          GENERIC_READ or GENERIC_WRITE,
          0,
          nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0));

      fomFastSequentialRead:
        FileHandle := Integer(CreateFile(PChar(ValidFilename),
          GENERIC_READ,
          FILE_SHARE_READ or FILE_SHARE_WRITE,
          nil, OPEN_EXISTING, FILE_FLAG_SEQUENTIAL_SCAN, 0));
    else
      ASSERT(False, 'Invalid file open mode');
    end;

    if (FileHandle = INVALID_HANDLE_VALUE) then
    begin
      LastError := GetLastError;
      if (LastError = ERROR_SHARING_VIOLATION) then
      begin
        Inc(Retries);
        if (Retries < MaxRetry) then
        begin
          Sleep(RetryDelay);
          continue;
        end;
      end;

      if (Mode <> fomCreate) then
        raise EFOpenError.CreateFmt(SFOpenErrorEx, [ValidFilename, SysErrorMessage(LastError)])
      else
        raise EFCreateError.CreateFmt(SFCreateErrorEx, [ValidFilename, SysErrorMessage(LastError)]);
    end;
  end;

  Result := TFileHandleStream.Create(FileHandle);

  if (Mode = fomCreate) and (Result.Size > 0) then
    Result.Size := 0;
end;

// -----------------------------------------------------------------------------

function TScriptRestrictedFileSystem.OpenScriptProvider(const Filename: string; FileMustExist: boolean): IScriptProvider;
var
  ValidFilename: string;
begin
  ValidFilename := ValidateFileNameEx(Filename, FileMustExist);

  // Must return nil if filename doesn't apply to this filesystem or delegating filesystem will not work
  if (ValidFilename = '') then
    Exit(nil);
    // raise EScript.CreateFmt('File not found: %s', [Filename]);

  Result := TFileScriptProvider.Create(ValidFilename);
end;

// -----------------------------------------------------------------------------

function TScriptRestrictedFileSystem.ValidateFileNameEx(const FileName: string; FileMustExist: boolean): string;
var
  ValidFilename: string;
  Path, RelativeRoot: string;
  AbsoluteFilename: string;
begin
  Result := '';

  // Filename can contain environment vars, but must still be located under one of the roots
  ValidFilename := ExpandEnvironmentVariable(Filename);

  if (ValidFilename = '') then
    exit;

  // If file system is unrestricted file is allowed to be located outside seartch path
  if (not Restricted) and (not PathIsRelative(ValidFilename)) then
  begin
    if (not FileMustExist) or (SysUtils.FileExists(ValidFilename)) then
      Result := ValidFilename;
    exit;
  end;

  for Path in FSearchPath do
  begin
    // Root can contain environment vars
    RelativeRoot := ExpandEnvironmentVariable(Path);

    // Relative root is relative to script root
    if (PathIsRelative(RelativeRoot)) then
    begin
      if (FRoot <> '') then
        RelativeRoot := PathCombinePath(FRoot, RelativeRoot);
    end;

    // Relative filename is relative to root
    if (PathIsRelative(ValidFilename)) then
      AbsoluteFilename := PathCombinePath(RelativeRoot, ValidFilename)
    else
      AbsoluteFilename := ValidFilename;

    // Remove double quotes
    AbsoluteFilename := RemoveDoubleBackslashesFromPath(AbsoluteFilename);

    // If file system is restricted then file must be located under one of the search path folders
    if (not Restricted) or (AnsiStartsText(RelativeRoot, AbsoluteFilename)) then
    begin
      if (not FileMustExist) or (SysUtils.FileExists(AbsoluteFilename)) then
      begin
        Result := AbsoluteFilename;
        exit;
      end;
    end;
  end;
end;

// -----------------------------------------------------------------------------
//
// TScriptBundleFileSystem
//
// -----------------------------------------------------------------------------
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

function TScriptBundleFileSystem.OpenFileStream(const Filename: TFilename; const mode: TdwsFileOpenMode): TStream;
var
  ValidFilename: string;
  Index: integer;
  LocalHeader: TZipHeader;
{$ifdef FEATURE_SCRIPT_BUNDLE}
  SourceStream: TMemoryStream;
{$endif FEATURE_SCRIPT_BUNDLE}
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

{$ifdef FEATURE_SCRIPT_BUNDLE}
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
{$endif FEATURE_SCRIPT_BUNDLE}
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
{$ifdef FEATURE_SCRIPT_BUNDLE}
    if (not FAllowProtected) and (AnsiSameText(Copy(ZipFile.FileComment[Index], 1, ZipFile.FileInfo[Index].FileCommentLength) , 'protected')) then
      Result := '';
{$endif FEATURE_SCRIPT_BUNDLE}
  end;
end;

// -----------------------------------------------------------------------------
//
// TScriptDelegatingFileSystem
//
// -----------------------------------------------------------------------------
constructor TScriptDelegatingFileSystem.Create(const ARoot: string; ASearchPath: TStrings; AAllowProtected: boolean);
begin
  inherited Create;

  FAllowProtected := AAllowProtected;
  FRoot := ARoot;
  FSearchPath := TStringList.Create;
  if (ASearchPath <> nil) then
    FSearchPath.Assign(ASearchPath);

  FFileSystems := TList<IScriptFileSystem>.Create;

  FFileSystems.Add(TScriptRestrictedFileSystem.Create(FRoot, FSearchPath));
end;

destructor TScriptDelegatingFileSystem.Destroy;
begin
  FSearchPath.Free;
  FFileSystems.Free;

  inherited;
end;

// -----------------------------------------------------------------------------

function TScriptDelegatingFileSystem.FileExists(const Filename: TFilename): Boolean;
var
  i: integer;
begin
  i := 0;
  Result := False;
  while (not Result) and (i < FFileSystems.Count) do
  begin
    Result := FFileSystems[i].FileExists(Filename);
    Inc(i);
  end;
end;

// -----------------------------------------------------------------------------

procedure TScriptDelegatingFileSystem.MountFileSystem(const FileSystem: IScriptFileSystem);
begin
  FFileSystems.Insert(0, FileSystem);
end;

procedure TScriptDelegatingFileSystem.UnmountFileSystem(const FileSystem: IScriptFileSystem);
begin
  FFileSystems.Remove(FileSystem);
end;

// -----------------------------------------------------------------------------

function TScriptDelegatingFileSystem.OpenFileStream(const Filename: TFilename; const Mode: TdwsFileOpenMode): TStream;
var
  i: integer;
  ValidFilename: string;
  FileMustExist: boolean;
begin
  Result := nil;

  // In case the filename is valid in multiple filesystems we give precedence to any filesystem where the file already
  // exists. First try looking for an existing file.
  FileMustExist := True;

  while (True) do
  begin
    i := 0;

    while (Result = nil) and (i < FFileSystems.Count) do
    begin
      // Test to determine if filename is valid for file system. We do not test if file exists here.
      ValidFilename := FFileSystems[i].ValidateFileNameEx(Filename, FileMustExist);

      if (ValidFilename <> '') then
        Result := FFileSystems[i].OpenFileStream(ValidFilename, Mode);
      Inc(i);
    end;

    if (Result <> nil) or (not FileMustExist) or (Mode <> fomCreate) then
      break;

    // Retry with FileMustExist=False if asked to create file
    FileMustExist := False;
  end;

  if (Result = nil) then
  begin
    if (Mode <> fomCreate) then
      raise EFOpenError.CreateFmt(SFOpenErrorEx, [Filename, SFileNotFound])
    else
      raise EFOpenError.CreateFmt(SFCreateErrorEx, [Filename, SFileNotFound]);
  end;
end;

// -----------------------------------------------------------------------------

function TScriptDelegatingFileSystem.ValidateFileName(const Filename: TFilename): TFilename;
var
  i: integer;
begin
  i := 0;
  Result := '';
  while (Result = '') and (i < FFileSystems.Count) do
  begin
    Result := FFileSystems[i].ValidateFileName(Filename);
    Inc(i);
  end;
end;

// -----------------------------------------------------------------------------

function TScriptDelegatingFileSystem.OpenScriptProvider(const Filename: string; FileMustExist: boolean): IScriptProvider;
var
  i: integer;
  ValidFilename: string;
begin
  i := 0;
  Result := nil;
  while (Result = nil) and (i < FFileSystems.Count) do
  begin
    ValidFilename := FFileSystems[i].ValidateFileNameEx(Filename, FileMustExist);
    if (ValidFilename <> '') then
      Result := FFileSystems[i].OpenScriptProvider(ValidFilename, FileMustExist);
    Inc(i);
  end;
end;

// -----------------------------------------------------------------------------

function TScriptDelegatingFileSystem.ValidateFileNameEx(const FileName: string; FileMustExist: boolean): string;
var
  i: integer;
begin
  i := 0;
  Result := '';
  while (Result = '') and (i < FFileSystems.Count) do
  begin
    Result := FFileSystems[i].ValidateFileNameEx(Filename, FileMustExist);
    Inc(i);
  end;
end;


// -----------------------------------------------------------------------------
//
// TScriptFileSystemFactory
//
// -----------------------------------------------------------------------------
constructor TScriptFileSystemFactory.Create(AAllowProtected: boolean);
begin
  inherited Create(nil);

  FAllowProtected := AAllowProtected;
  FSearchPath := TStringList.Create;
  FSearchPath.Delimiter := ';';
  FSearchPath.StrictDelimiter := True;

  FFileSystems := TList<IScriptFileSystem>.Create;
end;

destructor TScriptFileSystemFactory.Destroy;
begin
  FSearchPath.Free;
  FFileSystems.Free;
  inherited;
end;

// -----------------------------------------------------------------------------

procedure TScriptFileSystemFactory.MountFileSystem(const FileSystem: IScriptFileSystem);
begin
  FFileSystems.Add(FileSystem);
end;

procedure TScriptFileSystemFactory.UnmountFileSystem(const FileSystem: IScriptFileSystem);
begin
  FFileSystems.Remove(FileSystem);
end;

procedure TScriptFileSystemFactory.SetRootFileSystem(const FileSystem: IScriptFileSystem);
begin
  FRootFileSystem := FileSystem;
end;

// -----------------------------------------------------------------------------

function TScriptFileSystemFactory.AllocateFileSystem: IdwsFileSystem;
var
  i: integer;
begin
  Result := TScriptDelegatingFileSystem.Create(FRoot, FSearchPath, FAllowProtected);

  if (FRootFileSystem <> nil) then
    TScriptDelegatingFileSystem(Result).MountFileSystem(FRootFileSystem);

  for i := 0 to FFileSystems.Count-1 do
    TScriptDelegatingFileSystem(Result).MountFileSystem(FFileSystems[i]);
end;

// -----------------------------------------------------------------------------

procedure TScriptFileSystemFactory.SetRoot(const ARoot: string);
begin
  FRoot := ARoot;
end;

// -----------------------------------------------------------------------------

procedure TScriptFileSystemFactory.SetSearchPath(const Value: TStrings);
begin
  FSearchPath.Assign(Value);
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
end.

