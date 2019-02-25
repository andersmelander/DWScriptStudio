unit amPath;

(*
 * Copyright © 2008 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

// -----------------------------------------------------------------------------
// Utilities for File Path manipulation
// -----------------------------------------------------------------------------

function Canonicalise(const Path: string; RaiseOnError: boolean = False): string;

function PathIsRelative(const Path: string): boolean;
function FilenameFindOnPath(var Filename: string): boolean; overload;
function PathMakeCanonical(const APath: string): string;
function OldPathMakeAbsolute(const Path, CurrentPath: string): string;
function PathCombinePath(const Path, Filename: string): string;
function PathAppendFilename(const Path, Filename: string): string;
function FilenameMakeRelative(const FromPath, Filename: string): string;
function PathEnsureExistForFile(const Path, Filename: string): boolean;
function FilenameMakeLong(const Filename: string): string;
function ResolveShellLink(const Filename: string): string;
function FixTooLongFilename(const Filename: string; Overhead: integer = 12): string;
function RemoveDoubleBackslashesFromPath(const Value: string): string;

implementation

uses
  IOUtils,
  Windows,
  SysUtils,
  StrUtils,
  ShLwApi, // PathRelativePathTo
  Forms, ActiveX, ComObj, ShlObj; // ResolveShellLink

function GetFullPathName(lpFileName: PWideChar; nBufferLength: DWORD; lpBuffer: PWideChar; lpFilePart: PPWideChar): DWORD; stdcall; external kernel32 name 'GetFullPathNameW';

function RemoveDoubleBackslashesFromPath(const Value: string): string;
var
  n: integer;
begin
  // Remove double slashes (but avoid breaking UNC)
  Result := Value;
  n := PosEx('\\', Result);
  while (n > 0) do
  begin
    if (n <> 1) then
      Delete(Result, n, 1)
    else
      inc(n);

    n := PosEx('\\', Result, n);
  end;
end;

function Canonicalise(const Path: string; RaiseOnError: boolean): string;
// http://pdh11.blogspot.dk/2009/05/pathcanonicalize-versus-what-it-says-on.html
var
  Size: DWORD;
  Res: DWORD;
  s: string;
  Drive: string;
begin
  if (Path = '') then
    Exit('');

  (*
  ** Note that PathCanonicalize does NOT do what we want here -- it's a
  ** purely textual operation that eliminates /./ and /../ only.
  *)
  Size := GetFullPathName(PChar(Path), 0, nil, nil);
  if (Size > 0) then
  begin
    SetLength(Result, Size-1);
    Res := GetFullPathName(PChar(Path), Length(Result)+1, PChar(Result), nil);
  end else
    Res := 0;
  if (Res = 0) then
  begin
    if (RaiseOnError) then
      RaiseLastOSError;
    Exit(Path);
  end;

  if (Length(Result) >= 6) then
  begin
    // Get rid of \\?\ and \\.\ prefixes on drive-letter paths
    if ((StartsStr('\\?\', Result)) or (StartsStr('\\.\', Result))) and (Result[6] = ':') then
      Delete(Result, 1, 4);
  end;

  if (Length(Result) >= 10) then
  begin
    // Get rid of \\?\UNC on drive-letter and UNC paths
    if (StartsStr('\\?\UNC', Result)) then
    begin
      if (Result[10] = ':') and (Result[11] = '\') then
        Delete(Result, 1, 8)
      else
      begin
        Delete(Result, 1, 7);
        Result := '\' + Result;
      end;
    end;
  end;


  (*
  ** Anything other than UNC and drive-letter is something we don't
  ** understand
  *)
  if (LeftStr(Result, 2) = '\\') then
  begin
    if (Result[3] =  '?') or (Result[3] = '.') then
      Exit(Path); // Not understood

    // OK -- UNC
  end else
  if (Result[1] in ['a'..'z', 'A'..'Z']) and (Result[2] = ':') then
  begin
    // OK -- drive letter -- unwind subst'ing
    SetLength(Drive, 2);
    Drive[2] := ':';
    SetLength(s, MAX_PATH);
    while (True) do
    begin
      Drive[1] := Uppercase(Result[1])[1];
      s[1] := #0;

      Res := QueryDosDevice(PChar(Drive), PChar(s), Length(s));
      if (Res = 0) then
        break;

      if (not StartsStr('\??\', s)) then
        break;

      Result := Copy(s, 5, MaxInt) + Copy(Result, 3, MaxInt)
    end;

    SetLength(Drive, 3);
    Drive[1] := Uppercase(Result[1])[1];
    Drive[2] := ':';
    Drive[3] := '\';

    Res := GetDriveType(PChar(Drive));

    if (Res = DRIVE_REMOTE) then
    begin
      Size := 0;

      // QueryDosDevice and WNetGetConnection FORBID the trailing slash; GetDriveType REQUIRES it.
      SetLength(Drive, 2);

      Res := WNetGetConnection(PChar(Drive), nil, Size);
      if (Res <> ERROR_MORE_DATA) then
      begin
        if (RaiseOnError) then
          RaiseLastOSError;
        Exit(Path);
      end;
      SetLength(s, Size-1);
      Res := WNetGetConnection(PChar(Drive), PChar(s), Size);

      if (Res = NO_ERROR) then
        Result := s + Copy(Result, 3, MaxInt);
    end;

  end else
    // Not understood
    Exit(Path);

  // Canonicalise case and 8.3-ness
  try
    Result := FilenameMakeLong(Result);
  except
    on E: EOSError do
    begin
      // In case the path contains a folder that doesn't allow directory traversal (used to convert from short to long
      // name) the GetLongPathName API will fail with ERROR_ACCESS_DENIED. A common example of this is the
      // "Application Data" junction.
      if (RaiseOnError) and (E.ErrorCode <> ERROR_ACCESS_DENIED) then
        raise;
    end;
  else
    // Error in case file doesn't exist.
    if (RaiseOnError) then
      raise;
  end;

  Result := StringReplace(Result, '/', '\', [rfReplaceAll]);
end;

function FixTooLongFilename(const Filename: string; Overhead: integer): string;
begin
  if (Length(Filename) >= MAX_PATH - Overhead) and (not TPath.IsExtendedPrefixed(Filename)) then
  begin
    // Attempt to overcome MAX_PATH limitation
    if (LeftStr(Filename, 2) <> '\\') then
      Result := '\\?\' + Filename
    else
      Result := '\\?\UNC\' + Copy(Filename, 3, MaxInt);
  end else
    Result := Filename;
end;

function PathIsRelative(const Path: string): boolean;
begin
  // Warning: PathIsRelative returns False for "c:test.txt" and "\test.txt"
  Result := ShLwApi.PathIsRelative(PChar(Path));
end;

function FilenameFindOnPath(var Filename: string): boolean;
var
  SaveLength: integer;
begin
  SaveLength := Length(Filename);
  SetLength(Filename, MAX_PATH);
  Filename[SaveLength+1] := #0;

  Result := ShLwApi.PathFindOnPath(PChar(Filename), nil);

  if (Result) then
    SetLength(Filename, Length(PChar(Filename)))
  else
    SetLength(Filename, SaveLength);
end;

function PathMakeCanonical(const APath: string): string;
var
  Path: string;
  n: integer;
begin
  // Replace all forward slashes with backward slashed.
  // Forward slashes known to break PathCanonicalize.
  Path := StringReplace(APath, '/', '\', [rfReplaceAll]);

  // If path is a UNC path, then we must maintain the leading \\
  // Replace double slashed with single slashed.
  // Double slashes known to break PathCanonicalize.
  repeat
    n := PosEx('\\', Path, 2);
    if (n <> 0) then
      Delete(Path, n, 1);
  until (n = 0);

  SetLength(Result, MAX_PATH);
  if (not PathCanonicalize(PChar(Result), PChar(Path))) then
  begin
    if (GetLastError = ERROR_FILENAME_EXCED_RANGE) then
    begin
      Result := APath;
      exit;
    end;
    RaiseLastOSError;
  end;
  SetLength(Result, Length(PChar(Result)));
end;

function OldPathMakeAbsolute(const Path, CurrentPath: string): string;
begin
  if (Path = '') then
    Result := CurrentPath
  else
  if (Path[1] = '.') then
    Result := IncludeTrailingPathDelimiter(CurrentPath) + Path
  else
  if (Path[1] = '\') then
    Result := ExtractFileDrive(CurrentPath) + Path
  else
  if (ExtractFileDrive(Path) = '') then
    Result := IncludeTrailingPathDelimiter(CurrentPath) + Path
  else
    Result := Path
end;

function PathCombinePath(const Path, Filename: string): string;
begin
  SetLength(Result, MAX_PATH);
  if (PathCombine(PChar(Result), PChar(Path), PChar(Filename)) = nil) then
    RaiseLastOSError;
  SetLength(Result, Length(PChar(Result)))
end;

function PathAppendFilename(const Path, Filename: string): string;
begin
  SetLength(Result, MAX_PATH);
  StrLCopy(PChar(Result), PChar(Path), MAX_PATH);
  if (not PathAppend(PChar(Result), PChar(Filename))) then
    RaiseLastOSError;
  SetLength(Result, Length(PChar(Result)))
end;

function FilenameMakeRelative(const FromPath, Filename: string): string;
begin
  SetLength(Result, MAX_PATH);
  if (PathRelativePathTo(PChar(Result), PChar(FromPath), FILE_ATTRIBUTE_DIRECTORY, PChar(Filename), 0)) then
    SetLength(Result, Length(PChar(Result)))
  else
    Result := Filename;
end;

function PathEnsureExistForFile(const Path, Filename: string): boolean;
resourcestring
  sResourceFolderDoesNotExist = 'Directory not found';
  sResourceCreateMissingFolderForFile = 'The directory "%s" does not exist.'+#13+
    'Do you wish to create it for the file "%s"?';
var
  FileOnly, PathOnly: string;
  Res: Word;
begin
  Result := True;

  PathOnly := ExtractFilePath(Path);

  if (not DirectoryExists(PathOnly)) then
  begin
    if (PathIsRelative(PChar(Filename))) then
      FileOnly := Filename
    else
      FileOnly := ExtractFileName(Filename);

    Res := MessageBox(0, PChar(Format(sResourceCreateMissingFolderForFile, [PathOnly, FileOnly])), PChar(sResourceFolderDoesNotExist), MB_OKCANCEL);

    if (Res = ID_OK) then
      Result := CreateDir(PathOnly)
    else
      Result := False;
  end;
end;

function FilenameMakeLong(const Filename: string): string;
var
  Size: integer;
begin
  SetLength(Result, MAX_PATH);
  Size := GetLongPathName(PChar(Filename), PChar(Result), Length(Result)+1);
  if (Size = 0) then
    RaiseLastOSError;
  if (Size > Length(Result)) then
  begin
    SetLength(Result, Size-1);
    Size := GetLongPathName(PChar(Filename), PChar(Result), Length(Result)+1);
  end;
  ASSERT(Size <> 0);
  ASSERT(Size <= Length(Result));
  SetLength(Result, Size);
end;

//------------------------------------------------------------------------------
//
//      ResolveShellLink
//
//------------------------------------------------------------------------------
// Copied from am's Resource Editor
//------------------------------------------------------------------------------
function ResolveShellLink(const Filename: string): string;
var
  ShellLink: IShellLink;
  PersistFile: IPersistFile;
  Buffer: array[0..MAX_PATH] of Char;
begin
  Result := Filename;

  // Resolve LNK files
  if (SameText(ExtractFileExt(Filename), '.lnk')) then
  begin
    OleCheck(CoCreateInstance(CLSID_ShellLink, nil, CLSCTX_INPROC_SERVER, IShellLink, ShellLink));

    OleCheck(ShellLink.QueryInterface(IPersistFile, PersistFile));
    if (Succeeded(PersistFile.Load(PWideChar(Filename), STGM_READ))) and
      (Succeeded(ShellLink.Resolve(Application.Handle, SLR_NOUPDATE))) and
      (Succeeded(ShellLink.GetPath(@Buffer[0], MAX_PATH, PWin32FindData(nil)^, SLGP_UNCPRIORITY))) then
      Result := PWideChar(@Buffer[0]);
  end;
end;

end.
