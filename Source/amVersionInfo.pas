unit amVersionInfo;

(*
 * Copyright © 2008 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Classes,
  Windows;

type
  TTranslationRec = packed record
    case Integer of
    0: (
      LanguageID: WORD;
      CharsetID: WORD);
    1: (
      TranslationID: DWORD);
  end;
  PTranslationRec = ^TTranslationRec;
  TTranslationTable = array[0..0] of TTranslationRec;
  PTranslationTable = ^TTranslationTable;


  TVersionInfo = class
  strict private
    FVersionBuffer: pointer;
    FValid: boolean;
    FFileInfo: PVSFixedFileInfo;
    FTranslationTable: PTranslationTable;
    FTranslationCount: integer;
  private
    function DoGetString(const Key: string): string;
    function GetCharset(Index: integer): WORD;
    function GetLanguage(Index: integer): WORD;
    function GetLanguageName(Index: integer): string;
    function GetFileVersion: int64;
    function GetProductVersion: int64;
    function GetFileFlags: DWORD;
    function GetFileDate: int64;
    function GetFileSubType: DWORD;
    function GetFileType: DWORD;
    function GetOS: DWORD;
    function GetTranslationRec(Index: integer): PTranslationRec;
    property TranslationTable[Index: integer]: PTranslationRec read GetTranslationRec;
  protected
    property VersionBuffer: pointer read FVersionBuffer;
  public
    constructor Create(const Filename: string);
    destructor Destroy; override;
    class function VersionToString(Version: int64): string;
    class function StringToVersion(const Value: string): int64;
    class function VersionMajor(Version: int64): Word;
    class function VersionMinor(Version: int64): Word;
    class function VersionRelease(Version: int64): Word;
    class function VersionBuild(Version: int64): Word;
    function GetString(const Key: string; LanguageID: integer; CharsetID: integer): string; overload;
    function GetString(const Key, TranslationID: string): string; overload;
    function GetString(const Key: string; Index: integer = 0): string; overload;
    property Valid: boolean read FValid;
    property Strings[const Key: string]: string read DoGetString; default;
    property FileVersion: int64 read GetFileVersion;
    property ProductVersion: int64 read GetProductVersion;
    property FileFlags: DWORD read GetFileFlags;
    property OS: DWORD read GetOS;
    property FileType: DWORD read GetFileType;
    property FileSubType: DWORD read GetFileSubType;
    property FileDate: int64 read GetFileDate;
    property LanguageID[Index: integer]: WORD read GetLanguage;
    property CharsetID[Index: integer]: WORD read GetCharset;
    property LanguageNames[Index: integer]: string read GetLanguageName;
    property TranslationCount: integer read FTranslationCount;
  end;

implementation

uses
  SysUtils,
  RTLConsts;

{ TVersionInfo }

constructor TVersionInfo.Create(const Filename: string);
var
  OrgFileName: string;
  InfoSize, Dummy: DWORD;
  Size: DWORD;
begin
  inherited Create;

  // GetFileVersionInfo modifies the filename parameter data while parsing.
  // Copy the const string into a local variable to create a writeable copy.
  OrgFileName := Filename;
  UniqueString(OrgFileName);
  InfoSize := GetFileVersionInfoSize(PChar(OrgFileName), Dummy);
  if InfoSize <> 0 then
  begin
    GetMem(FVersionBuffer, InfoSize);
    try
      if GetFileVersionInfo(PChar(OrgFileName), Dummy, InfoSize, FVersionBuffer) then
      begin
        FValid := True;
        if (not VerQueryValue(FVersionBuffer, '\', Pointer(FFileInfo), Size)) then
          FFileInfo := nil;

        if (VerQueryValue(VersionBuffer, '\VarFileInfo\Translation', pointer(FTranslationTable), Size)) then
          FTranslationCount := Size div SizeOf(TTranslationRec)
        else
          FTranslationCount := 0;
      end;
    finally
      if (not FValid) then
      begin
        FreeMem(FVersionBuffer);
        FVersionBuffer := nil;
      end;
    end;
  end;
end;

destructor TVersionInfo.Destroy;
begin
  if (FVersionBuffer <> nil) then
    FreeMem(FVersionBuffer);
  FValid := False;
  inherited Destroy;
end;

function TVersionInfo.GetCharset(Index: integer): WORD;
begin
  Result := TranslationTable[Index].CharsetID;
end;

function TVersionInfo.GetFileDate: int64;
var
  LargeInteger: ULarge_Integer;
begin
  if (Valid) and (FFileInfo <> nil) then
  begin
    LargeInteger.LowPart := FFileInfo.dwFileDateLS;
    LargeInteger.HighPart := FFileInfo.dwFileDateMS;
    Result := LargeInteger.QuadPart;
  end else
    Result := 0;
end;

function TVersionInfo.GetFileFlags: DWORD;
begin
  if (Valid) and (FFileInfo <> nil) then
    Result := FFileInfo.dwFileFlags and FFileInfo.dwFileFlagsMask
  else
    Result := 0;
end;

function TVersionInfo.GetFileSubType: DWORD;
begin
  if (Valid) and (FFileInfo <> nil) then
    Result := FFileInfo.dwFileSubtype
  else
    Result := 0;
end;

function TVersionInfo.GetFileType: DWORD;
begin
  if (Valid) and (FFileInfo <> nil) then
    Result := FFileInfo.dwFileType
  else
    Result := 0;
end;

function TVersionInfo.GetFileVersion: int64;
var
  LargeInteger: ULarge_Integer;
begin
  if (Valid) and (FFileInfo <> nil) then
  begin
    LargeInteger.LowPart := FFileInfo.dwFileVersionLS;
    LargeInteger.HighPart := FFileInfo.dwFileVersionMS;
    Result := LargeInteger.QuadPart;
  end else
    Result := 0;
end;

function TVersionInfo.GetLanguage(Index: integer): WORD;
begin
  Result := TranslationTable[Index].LanguageID;
end;

function TVersionInfo.GetLanguageName(Index: integer): string;
var
  Size: DWORD;
begin
  SetLength(Result, 255);
  Size := VerLanguageName(TranslationTable[Index].TranslationID, PChar(Result), Length(Result));
  SetLength(Result, Size);
end;

{$IFOPT R+}
  {$DEFINE R_PLUS}
  {$RANGECHECKS OFF}
{$ENDIF}
function TVersionInfo.GetTranslationRec(Index: integer): PTranslationRec;
begin
  if (not Valid) or (Index < 0) or (Index >= FTranslationCount) then
    raise Exception.CreateFmt(SListIndexError, [Index]);
  Result := @(FTranslationTable[Index]);
end;
{$IFDEF R_PLUS}
  {$RANGECHECKS ON}
  {$UNDEF R_PLUS}
{$ENDIF}

function TVersionInfo.GetOS: DWORD;
begin
  if (Valid) and (FFileInfo <> nil) then
    Result := FFileInfo.dwFileOS
  else
    Result := 0;
end;

function TVersionInfo.GetProductVersion: int64;
var
  LargeInteger: ULarge_Integer;
begin
  if (Valid) and (FFileInfo <> nil) then
  begin
    LargeInteger.LowPart := FFileInfo.dwProductVersionLS;
    LargeInteger.HighPart := FFileInfo.dwProductVersionMS;
    Result := LargeInteger.QuadPart;
  end else
    Result := 0;
end;

function TVersionInfo.GetString(const Key: string; Index: integer): string;
var
  TranslationRec: PTranslationRec;
begin
  TranslationRec := TranslationTable[Index];
  Result := GetString(Key, TranslationRec.LanguageID, TranslationRec.CharsetID);
end;

function TVersionInfo.DoGetString(const Key: string): string;
begin
  Result := GetString(Key, 0);
end;

function TVersionInfo.GetString(const Key: string; LanguageID, CharsetID: integer): string;
var
  TranslationID: string;
begin
  TranslationID := Format('%.4x%.4x', [LanguageID, CharsetID]);
  Result := GetString(Key, TranslationID);
end;

function TVersionInfo.GetString(const Key: string; const TranslationID: string): string;
var
  Value: PChar;
  s: string;
  Size: DWORD;
begin
  if (Valid) then
  begin
    s := Format('\StringFileInfo\%s\%s', [TranslationID, Key]);
    if (VerQueryValue(VersionBuffer, PChar(s), pointer(Value), Size)) then
      Result := PChar(Value)
    else
      Result := '';
  end else
    Result := '';
end;

class function TVersionInfo.StringToVersion(const Value: string): int64;
var
  s, n: string;
  w: integer;
  i: integer;
begin
  s := Value;
  w := 0;
  Result := 0;
  while (s <> '') and (w < 4) do
  begin
    i := pos('.', s);
    if (i <= 0) then
      i := Length(s)+1;
    n := Copy(s, 1, i-1);
    s := Copy(s, i+1, MaxInt);
    Result := (Result shl 16) + StrToInt(n);
    inc(w);
  end;
end;

class function TVersionInfo.VersionBuild(Version: int64): Word;
var
  v: ULarge_Integer;
begin
  v.QuadPart := Version;
  Result := v.LowPart and $FFFF;
end;

class function TVersionInfo.VersionMajor(Version: int64): Word;
var
  v: ULarge_Integer;
begin
  v.QuadPart := Version;
  Result := v.HighPart shr 16;
end;

class function TVersionInfo.VersionMinor(Version: int64): Word;
var
  v: ULarge_Integer;
begin
  v.QuadPart := Version;
  Result := v.HighPart and $FFFF;
end;

class function TVersionInfo.VersionRelease(Version: int64): Word;
var
  v: ULarge_Integer;
begin
  v.QuadPart := Version;
  Result := v.LowPart shr 16;
end;

class function TVersionInfo.VersionToString(Version: int64): string;
var
  v: ULarge_Integer;
begin
  v.QuadPart := Version;
  Result := Format('%d.%d.%d.%d',
    [v.HighPart shr 16, v.HighPart and $FFFF, v.LowPart shr 16, v.LowPart and $FFFF]);
end;

end.
