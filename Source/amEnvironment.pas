unit amEnvironment;

(*
 * Copyright © 2008 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Classes;

type
  TApplyEnvironmentValueProc = reference to procedure(const Name, Value: string);
  TEnvironmentValue = (sevStatic, sevCustomizable);
  TEnvironmentValues = set of TEnvironmentValue;

var
  ValidEnvironmentValues: TEnvironmentValues = [];
  CurrentEnvironmentValues: TEnvironmentValues = [];

function ExpandEnvironmentVariable(const Name: string; Include: TEnvironmentValues = [sevStatic, sevCustomizable]): string;
function TokenizePath(const Name: string; Values: TEnvironmentValues = [sevStatic, sevCustomizable]; AllowTouchFileSystem: boolean = True): string;
procedure SetEnvironmentValues(Include: TEnvironmentValues = [sevStatic, sevCustomizable]; ClearExcluded: boolean = False);
procedure ClearEnvironmentValues(Include: TEnvironmentValues = [sevStatic, sevCustomizable]);
procedure GetEnvironmentNames(Strings: TStrings; Values: TEnvironmentValues = [sevStatic, sevCustomizable]);
procedure GetEnvironmentValues(Strings: TStrings; Values: TEnvironmentValues = [sevStatic, sevCustomizable]);
function WrapGetEnvironmentVariable(const Name: string; Include: TEnvironmentValues = [sevStatic, sevCustomizable]): string;


type
  TApplyEnvironmentValuesProc = procedure(Proc: TApplyEnvironmentValueProc; Include: TEnvironmentValues = [sevStatic, sevCustomizable]);

procedure DefaultApplyEnvironmentValues(Proc: TApplyEnvironmentValueProc; Include: TEnvironmentValues = [sevStatic, sevCustomizable]);

var
  ApplyEnvironmentValues: TApplyEnvironmentValuesProc = DefaultApplyEnvironmentValues;

implementation

uses
  IOUtils,
  StrUtils,
  Windows,
  SysUtils,
  ShlwAPI,
  amPath;

function _forgot_where_it_came_from_GetEnvironmentValues(EnvironmentValues: TStrings): boolean;
var
  EnvVars: PChar;    // pointer to start of environment block
  EnvEntry: PChar;   // pointer to an env string in block
begin
  // Clear the list
  EnvironmentValues.Clear;
  Result := False;
  // Get reference to environment block for this process
  EnvVars := GetEnvironmentStrings;
  if (EnvVars = nil) then
    exit;

  // We have a block: extract strings from it
  // Env strings are #0 separated and list ends with #0#0
  EnvEntry := EnvVars;
  try
    while (EnvEntry^ <> #0) do
    begin
      EnvironmentValues.Add(EnvEntry);
      Inc(EnvEntry, StrLen(EnvEntry) + 1);
      Result := True;
    end;
  finally
    // Dispose of the memory block
    FreeEnvironmentStrings(EnvVars);
  end;
end;


function TokenizePath(const Name: string; Values: TEnvironmentValues; AllowTouchFileSystem: boolean): string;
var
  EnvironmentValues: TStrings;
  EnvName, EnvValue: string;
  EnvPath, Path: string;
  BestLength: integer;
  BestEnvName, BestPath: string;
  s: string;
  i: integer;
begin
  Path := ExpandEnvironmentVariable(Name);

  if (PathIsRelative(Path)) then
  begin
    // Relative path can not be tokenized
    Result := Name;
    exit;
  end;

  Path := PathMakeCanonical(Path);

  if (AllowTouchFileSystem) then
  begin
    try
      if (FileExists(Path)) then
        Path := FilenameMakeLong(Path);
    except
      // Ignore file system errors - it's more important that we get the job done
    end;
  end;

  BestEnvName := '';
  BestLength := MaxInt;

  // First give the system environment values a go
  SetLength(BestPath, MAX_PATH);
  if (PathUnExpandEnvStrings(PChar(Path), PChar(BestPath), Length(BestPath)+1)) then
  begin
    SetLength(BestPath, StrLen(PChar(BestPath)));
    // Extract environment string name
    if (BestPath <> '') and (BestPath[1] = '%') then
    begin
      i := PosEx('%', BestPath, 2);
      if (i >= 2) then
      begin
        BestEnvName := Copy(BestPath, 2, i-2);
        // Do not use the "%SystemDrive%" string. It doesn't make sense for our use.
        if (not AnsiSameText(BestEnvName, 'SystemDrive')) then
        begin
          Delete(BestPath, 1, i);
          BestLength := Length(BestPath);
        end else
          BestEnvName := '';
      end;
    end;
  end;
  if (BestEnvName = '') then
    BestPath := Path;

  // Try application specific environment values
  if (Values <> []) then
  begin
    EnvironmentValues := TStringList.Create;
    try
      GetEnvironmentValues(EnvironmentValues, Values);
      for i := 0 to EnvironmentValues.Count-1 do
      begin
        EnvName := EnvironmentValues.Names[i];
        if (EnvName = '') then
          continue;

        EnvValue := EnvironmentValues.Values[EnvName];
        if (EnvValue = '') then
          continue;

        EnvPath := PathMakeCanonical(EnvValue);

        // Try to make path relative to our environment value
        s := FilenameMakeRelative(EnvPath, Path);

        // Disallow forms of relative path that does not start with '.\'
        if (not StartsStr('.\', s)) then
          continue;

        // Disallow '..'
        if (ContainsStr(s, '..')) then
          continue;

        if (Length(s)-1 < BestLength) then
        begin
          BestEnvName := EnvName;
          BestPath := s;
          // Save relative path, but without the leading '.'.
          // We should actually also remove the leading '\' but we leave it be since the result "looks" better
          // with a "\" separating the environment value from the rest.
          // When the resulting string is expanded we will end up with a double slash, but the since
          // the ExpandEnvironmentVariable() function can handle that no harm is done.
          Delete(BestPath, 1, 1);
          // Old: Delete(BestPath, 1, 2); // Save relative path, but without the leading '.\'
          BestLength := Length(BestPath);
        end;
      end;
    finally
      EnvironmentValues.Free;
    end;
  end;

  if (BestEnvName <> '') then
    Result := '%' + BestEnvName + '%' + BestPath
  else
    Result := Path
end;

procedure GetEnvironmentNames(Strings: TStrings; Values: TEnvironmentValues);
begin
  ApplyEnvironmentValues(
    procedure(const Name, Value: string)
    begin
      Strings.Add(Name);
    end, Values);
end;

procedure GetEnvironmentValues(Strings: TStrings; Values: TEnvironmentValues);
begin
  ApplyEnvironmentValues(
    procedure(const Name, Value: string)
    begin
      Strings.Values[Name] := Value;
    end, Values);
end;

procedure SetEnvironmentValues(Include: TEnvironmentValues; ClearExcluded: boolean);
var
  ValuesToClear: TEnvironmentValues;
begin
  if (Include = ValidEnvironmentValues) and (Include = CurrentEnvironmentValues) then
    exit;

  // Clear invalid values
  ValuesToClear := CurrentEnvironmentValues - ValidEnvironmentValues;
  // And those that are not in the new set
  if (ClearExcluded) then
    ValuesToClear := ValuesToClear + (CurrentEnvironmentValues - Include);
  // Do not clear those we are setting. We will overwrite them anyway
  ValuesToClear := ValuesToClear - Include;

  // CurrentEnvironmentValues: Those that are set
  // ValidEnvironmentValues: Those that are set and have valid values

  if (ValuesToClear <> []) then
  begin
    ClearEnvironmentValues(ValuesToClear);
    ASSERT(ValidEnvironmentValues <= CurrentEnvironmentValues);

    if (ValidEnvironmentValues = Include) then
      exit;
  end;

  Include := Include-ValidEnvironmentValues;

  if (Include <> []) then
    ApplyEnvironmentValues(
      procedure(const Name, Value: string)
      begin
        SetEnvironmentVariable(PChar(Name), PChar(Value));
      end, Include-ValidEnvironmentValues);

  CurrentEnvironmentValues := CurrentEnvironmentValues + Include;
  ValidEnvironmentValues := ValidEnvironmentValues + Include;
end;

procedure ClearEnvironmentValues(Include: TEnvironmentValues);
begin
  ApplyEnvironmentValues(
    procedure(const Name, Value: string)
    begin
      SetEnvironmentVariable(PChar(Name), nil);
    end, Include);
  CurrentEnvironmentValues := CurrentEnvironmentValues - Include;
  ValidEnvironmentValues := ValidEnvironmentValues - Include;
end;

procedure DefaultApplyEnvironmentValues(Proc: TApplyEnvironmentValueProc; Include: TEnvironmentValues);
begin
  // Values that cannot be customized by the user
  if (sevStatic in Include) then
  begin
    Proc('AppInstall', TPath.GetDirectoryName(ParamStr(0)));
    Proc('AppName', TPath.GetFileNameWithoutExtension(ParamStr(0)));

    Proc('CompilerVersion', FloatToStr(System.CompilerVersion));
    Proc('Documents', TPath.GetDocumentsPath);
    Proc('SharedDocuments', TPath.GetSharedDocumentsPath);
    Proc('Library', TPath.GetLibraryPath);
    Proc('Downloads', TPath.GetDownloadsPath);
    Proc('SharedDownloads', TPath.GetSharedDownloadsPath);
    // Already provided by Windows:
    // "Public"
    // "Temp"
    // "UserProfile"
    // "AllUsersProfile"
    // "ProgramData"
    // "HomePath"
    // "LocalAppData"
    // "AppData"
  end;

  // Values that can be customized by the user
  if (sevCustomizable in Include) then
  begin
//    Proc('FOLDER_SCRIPT', PathCombinePath(TPath.GetDirectoryName(ParamStr(0)), '.\script'));
  end;
end;

function ExpandEnvironmentVariable(const Name: string; Include: TEnvironmentValues): string;
var
  Buffer: string;
  Size: integer;
begin
  result := Name;
  if (Name = '') then
    exit;

  if (StrScan(PChar(Name), '%') = nil) then
    exit;

  SetEnvironmentValues(Include, False);

  Size := ExpandEnvironmentStrings(PChar(Result), nil, 0);
  if (Size <> 0) then
  begin
    SetLength(Buffer, Size-1);
    Size := ExpandEnvironmentStrings(PChar(Result), PChar(Buffer), Size);
    SetLength(Buffer, Size-1);
    Result := Buffer;
  end;

  Result := StringReplace(Result, '/', '\', [rfReplaceAll]);

  Result := RemoveDoubleBackslashesFromPath(Result);
end;

function WrapGetEnvironmentVariable(const Name: string; Include: TEnvironmentValues): string;
begin
  SetEnvironmentValues(Include, False);

  SetLength(result, 1024);
  if GetEnvironmentVariable(PChar(Name), PChar(result), 1024) = 0 then
    result := '';
  SetLength(result, StrLen(PChar(result)));
end;

end.