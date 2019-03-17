unit amRegConfig;

(*
 * Copyright © 2001 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

// -----------------------------------------------------------------------------
// Configuration persistency manager
// Originally: regconfg.pas
// -----------------------------------------------------------------------------

interface

{$weakpackageunit on}

uses
  Generics.Collections,
  Windows,
  Classes,
  TypInfo,
  Registry;

type
  TFixedRegIniFile = class(TRegIniFile)
  public
    function GetDataSize(const Section, ValueName: string): Integer;
    function ReadInteger(const Section, Ident: string; Default: Integer): Integer;
    procedure WriteInteger(const Section, Ident: string; Value: Integer);
    function ReadFloat(const Section, Ident: string; Default: Double): Double;
    function ReadDateTime(const Section, Name: string): TDateTime;
    procedure WriteFloat(const Section, Ident: string; Value: Double);
    procedure WriteDateTime(const Section, Name: string; Value: TDateTime);
    procedure WriteBinaryData(const Section, Ident: string; var Buffer; BufSize: Integer);
    function ReadBinaryData(const Section, Ident: string; var Buffer; BufSize: Integer): Integer;
    function ReadStrings(const Section, Ident, Default: string): string;
    procedure WriteStrings(const Section, Ident, Value: string);
    procedure ReadSectionNames(const Section: string; Strings: TStrings);
  end;

  TConfiguration = class;
  TConfigurationSection = class;

  TConfigurationSectionList = class(TObject)
  private
    FSections: TObjectList<TConfigurationSection>;
    function GetCount: integer;
    function GetSection(Index: integer): TConfigurationSection;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(Section: TConfigurationSection);
    procedure Clear;
    procedure Remove(Section: TConfigurationSection);
    procedure Extract(Section: TConfigurationSection);
    property Sections[Index: integer]: TConfigurationSection read GetSection;
    property Count: integer read GetCount;
  end;

  IConfigurationSection = interface
    ['{4F86397F-698B-4D66-B70B-EA3764512005}']
    procedure WriteSection(Registry: TFixedRegIniFile; const Key: string);
    procedure ReadSection(Registry: TFixedRegIniFile; const Key: string);
  end;

  TConfigurationSection = class(TPersistent)
  private
    FOwner: TConfigurationSection;
    FPurgeOnWrite: boolean;
    FSections: TConfigurationSectionList;
  protected
    procedure WriteSection(const Key: string); virtual;
    procedure ReadSection(const Key: string); virtual;
    procedure DoWriteObject(const Key: string; Instance: TObject); virtual;
    procedure DoReadObject(const Key: string; Instance: TObject); virtual;
    function GetKey: string; virtual;
    function GetKeyPath: string; virtual;
    function KeyRoot: string; virtual;
    procedure Initialize; virtual;
    procedure ApplyDefault; virtual;
    procedure WriteStream(const AKey, AName: string; Stream: TMemoryStream); overload; virtual;
    procedure ReadStream(const AKey, AName: string; Stream: TMemoryStream); overload; virtual;
    function GetRegistry: TFixedRegIniFile; virtual;
  public
    constructor Create(AOwner: TConfigurationSection); virtual;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure WriteStream(const AName: string; Stream: TMemoryStream); overload; virtual;
    procedure ReadStream(const AName: string; Stream: TMemoryStream); overload; virtual;
    function SectionByName(const Name: string): TConfigurationSection;
    property Owner: TConfigurationSection read FOwner;
    // Registry key relative to configuration root
    property Key: string read GetKey;
    // Full registry path
    property KeyPath: string read GetKeyPath;
    property PurgeOnWrite: boolean read FPurgeOnWrite write FPurgeOnWrite;
    property Sections: TConfigurationSectionList read FSections;
    property Registry: TFixedRegIniFile read GetRegistry;
  end;

  // Name=Value list. Stored as Key/Value.
  TConfigurationStringValues = class(TConfigurationSection)
  private
    FStrings: TStrings;
    function GetItem(Index: integer): string;
    procedure SetItem(Index: integer; const Value: string);
    function GetName(Index: integer): string;
    function GetValue(Name: string): string;
    function GetCount: integer;
    procedure SetStrings(const Value: TStrings);
    procedure SetValue(Name: string; const Value: string);
  protected
    procedure Initialize; override;
    procedure WriteStringValues(const Key: string); virtual;
    procedure ReadStringValues(const Key: string); virtual;
    procedure WriteSection(const Key: string); override;
    procedure ReadSection(const Key: string); override;
  public
    constructor Create(AOwner: TConfigurationSection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure AssignTo(Dest: TPersistent); override;
    function Add(const s: string): integer; virtual;
    procedure Insert(Index: Integer; const S: string); virtual;
    procedure Move(OldIndex, NewIndex: Integer); virtual;
    procedure Delete(Index: Integer); virtual;
    procedure Clear;
    function IndexOf(const s: string): integer;
    function GetEnumerator: TStringsEnumerator;
    property Items[Index: integer]: string read GetItem write SetItem; default;
    property Count: integer read GetCount;
    property Names[Index: integer]: string read GetName;
    property Values[Name: string]: string read GetValue write SetValue;
    property Strings: TStrings read FStrings write SetStrings;
  end;

  // Simple string list. Stored as Count and Item list.
  TConfigurationStringList = class(TConfigurationStringValues)
  protected
    procedure WriteStringValues(const Key: string); override;
    procedure ReadStringValues(const Key: string); override;
  end;

  // Sub keys stored as section objects
  TConfigurationSectionValues<T: TConfigurationSection> = class(TConfigurationSection)
  private
    FItems: TObjectDictionary<string, T>;
    FPurgeOnWrite: boolean;
  protected
    procedure Initialize; override;
    procedure WriteSection(const Key: string); override;
    procedure ReadSection(const Key: string); override;

    function GetCount: integer;
    function GetName(Index: integer): string;
    function GetValue(Name: string): T;

    property PurgeOnWrite: boolean read FPurgeOnWrite write FPurgeOnWrite;
  public
    constructor Create(AOwner: TConfigurationSection); override;
    destructor Destroy; override;
    function Add(const Name: string): T;
    function Find(const Name: string): T;
    procedure Remove(const Name: string);
    procedure Clear;
    property Count: integer read GetCount;
    property Names[Index: integer]: string read GetName;
    property Items[Name: string]: T read GetValue; default;
  end;

  TConfiguration = class(TConfigurationSection)
  private
    FRegistry: TFixedRegIniFile;
    FPath: string;
    FSubPath: string;
    procedure SetSubPath(const Value: string);
  protected
    function GetKey: string; override;
    function KeyRoot: string; override;
    function GetRegistry: TFixedRegIniFile; override;
  public
    constructor Create(Root: HKEY; const APath: string; AAccess: LongWord = KEY_ALL_ACCESS); reintroduce; virtual;
    destructor Destroy; override;

    procedure WriteConfig; virtual;
    procedure ReadConfig; virtual;
    procedure WriteStream(const AKey, AName: string; Stream: TMemoryStream); override;
    procedure ReadStream(const AKey, AName: string; Stream: TMemoryStream); override;
    procedure WriteObject(const AKey: string; Instance: TObject);
    procedure ReadObject(const AKey: string; Instance: TObject);
    property SubPath: string read FSubPath write SetSubPath;
  end;

implementation

uses
  Types,
  SysUtils;

// *****************************************************************************
//
//			TFixedRegIniFile
//
// *****************************************************************************
function TFixedRegIniFile.GetDataSize(const Section, ValueName: string): Integer;
var
  Key, OldKey: HKEY;
begin
  Key := GetKey(Section);
  if Key <> 0 then
  try
    OldKey := CurrentKey;
    SetCurrentKey(Key);
    try
      if ValueExists(ValueName) then
        Result := inherited GetDataSize(ValueName)
      else
        Result := -1;
    finally
      SetCurrentKey(OldKey);
    end;
  finally
    RegCloseKey(Key);
  end else
    Result := -1;
end;

function TFixedRegIniFile.ReadFloat(const Section, Ident: string; Default: Double): Double;
var
  Key, OldKey: HKEY;
begin
  Key := GetKey(Section);
  if Key <> 0 then
  try
    OldKey := CurrentKey;
    SetCurrentKey(Key);
    try
      if ValueExists(Ident) then
        Result := inherited ReadFloat(Ident) else
        Result := Default;
    finally
      SetCurrentKey(OldKey);
    end;
  finally
    RegCloseKey(Key);
  end else
    Result := Default;
end;

function TFixedRegIniFile.ReadInteger(const Section, Ident: string; Default: Integer): Integer;
var
  Key, OldKey: HKEY;
  S: string;
  RegData: TRegDataType;
begin
  Key := GetKey(Section);
  if Key <> 0 then
  try
    OldKey := CurrentKey;
    SetCurrentKey(Key);
    try
      if (not ValueExists(Ident)) then
        Exit(Default);
      GetData(Ident, @Result, SizeOf(Integer), RegData);
      if (RegData <> rdInteger) then
      begin
        // Try to read as string
        S := GetDataAsString(Ident);
        Result := StrToIntDef(S, Default);
      end;
    finally
      SetCurrentKey(OldKey);
    end;
  finally
    RegCloseKey(Key);
  end
  else Result := Default;
end;

function TFixedRegIniFile.ReadDateTime(const Section, Name: string): TDateTime;
var
  Key, OldKey: HKEY;
begin
  Key := GetKey(Section);
  if Key <> 0 then
  try
    OldKey := CurrentKey;
    SetCurrentKey(Key);
    try
      if ValueExists(Name) then
        Result := inherited ReadDateTime(Name) else
        Result := 0;
    finally
      SetCurrentKey(OldKey);
    end;
  finally
    RegCloseKey(Key);
  end else
    Result := 0;
end;

procedure TFixedRegIniFile.WriteFloat(const Section, Ident: string; Value: Double);
var
  Key, OldKey: HKEY;
begin
  CreateKey(Section);
  Key := GetKey(Section);
  if Key <> 0 then
  try
    OldKey := CurrentKey;
    SetCurrentKey(Key);
    try
      inherited WriteFloat(Ident, Value);
    finally
      SetCurrentKey(OldKey);
    end;
  finally
    RegCloseKey(Key);
  end;
end;

procedure TFixedRegIniFile.WriteInteger(const Section, Ident: string; Value: Integer);
var
  Key, OldKey: HKEY;
begin
  CreateKey(Section);
  Key := GetKey(Section);
  if Key <> 0 then
  try
    OldKey := CurrentKey;
    SetCurrentKey(Key);
    try
      PutData(Ident, @Value, SizeOf(Integer), rdInteger);
    finally
      SetCurrentKey(OldKey);
    end;
  finally
    RegCloseKey(Key);
  end;
end;

procedure TFixedRegIniFile.WriteDateTime(const Section, Name: string; Value: TDateTime);
var
  Key, OldKey: HKEY;
begin
  CreateKey(Section);
  Key := GetKey(Section);
  if Key <> 0 then
  try
    OldKey := CurrentKey;
    SetCurrentKey(Key);
    try
      inherited WriteDateTime(Name, Value);
    finally
      SetCurrentKey(OldKey);
    end;
  finally
    RegCloseKey(Key);
  end;
end;

procedure TFixedRegIniFile.WriteBinaryData(const Section, Ident: string; var Buffer; BufSize: Integer);
var
  Key, OldKey: HKEY;
begin
  CreateKey(Section);
  Key := GetKey(Section);
  if Key <> 0 then
  try
    OldKey := CurrentKey;
    SetCurrentKey(Key);
    try
      inherited WriteBinaryData(Ident, Buffer, BufSize);
    finally
      SetCurrentKey(OldKey);
    end;
  finally
    RegCloseKey(Key);
  end;
end;

function TFixedRegIniFile.ReadBinaryData(const Section, Ident: string; var Buffer; BufSize: Integer): Integer;
var
  Key, OldKey: HKEY;
begin
  Key := GetKey(Section);
  if Key <> 0 then
  try
    OldKey := CurrentKey;
    SetCurrentKey(Key);
    try
      if ValueExists(Ident) then
        Result := inherited ReadBinaryData(Ident, Buffer, BufSize) else
        Result := 0;
    finally
      SetCurrentKey(OldKey);
    end;
  finally
    RegCloseKey(Key);
  end
  else Result := 0;
end;

function Int64ToBinStr(Value: int64): string;
var
  p: PChar;
begin
  SetLength(Result, 64);
  p := PChar(Result);
  FillChar(p^, 64, Ord('0'));
  while (Value <> 0) do
  begin
    if (Value and Int64($8000000000000000) <> 0) then
      p^ := '1';
    Value := (Value and $7fffffffffffffff) shl 1;
    inc(p);
  end;
end;

function BinStrToInt64(const Value: string): int64;
var
  p: PChar;
  Mask: int64;
begin
  Result := 0;
  p := PChar(Value);
  Mask := Int64($8000000000000000);
  while (p^ <> #0) do
  begin
    if (p^ = '1') then
      Result := Result or Mask;
    Mask := Mask shr 1;
    inc(p);
  end;
end;

procedure TFixedRegIniFile.ReadSectionNames(const Section: string;
  Strings: TStrings);
var
  Key, OldKey: HKEY;
begin
  Key := GetKey(Section);
  if Key <> 0 then
  try
    OldKey := CurrentKey;
    SetCurrentKey(Key);
    try
      inherited GetKeyNames(Strings);
    finally
      SetCurrentKey(OldKey);
    end;
  finally
    RegCloseKey(Key);
  end;
end;

function TFixedRegIniFile.ReadStrings(const Section, Ident, Default: string): string;
var
  Key, OldKey: HKEY;
  DataType: DWORD;
  RegData: TRegDataType;
  Size: DWORD;
  Buffer, p: PChar;
begin
  // Warning: This code is untested!
  Key := GetKey(Section);
  if Key <> 0 then
  begin
    try
      OldKey := CurrentKey;
      SetCurrentKey(Key);
      try
        if (RegQueryValueEx(CurrentKey, PChar(Ident), nil, @DataType, nil, @Size) = ERROR_SUCCESS) then
        begin
          if (DataType = REG_MULTI_SZ) then
          begin
            GetMem(Buffer, Size+1);
            try
              RegData := rdUnknown;
              GetData(Ident, Buffer, Size, RegData);
              p := Buffer;
              // Convert list of zero terminated string to list of CR terminated strings
              while (p^ <> #0) do
              begin
                while (p^ <> #0) do
                  inc(p);
                p^ := #13;
                inc(p);
              end;
              Result := Buffer;
              UniqueString(Result);
            finally
              FreeMem(Buffer);
            end;
          end else
            Result := ReadString(Section, Ident, Default);
        end else
          Result := Default;
      finally
        SetCurrentKey(OldKey);
      end;
    finally
      RegCloseKey(Key);
    end;
  end else
    Result := Default;
end;

procedure TFixedRegIniFile.WriteStrings(const Section, Ident, Value: string);
var
  Key, OldKey: HKEY;
  Buffer: PChar;
  p1, p2: PChar;
  LastCR: boolean;
  Size: integer;
begin
  // Warning: This code is untested!
  CreateKey(Section);
  Key := GetKey(Section);
  if Key <> 0 then
  try
    OldKey := CurrentKey;
    SetCurrentKey(Key);
    try

      Size := Length(Value)+2;
      GetMem(Buffer, Size);
      try
        FillChar(Buffer, Size, #0); { make sure we have a double null at end }

        p1 := PChar(Value);
        p2 := Buffer;
        Size := 0;
        LastCR := False;
        while (p1^ <> #0) do
        begin
          if (p1^ = #13) then
          begin
            LastCR := True;
          end else
          begin
            if (p1^ <> #10) or (not LastCR) then
            begin
              if (LastCR) and (Size > 0) then
              begin
                p2^:= #0;
                inc(p2);
                inc(Size);
              end;
              p2^:= p1^;
              inc(p2);
              inc(Size);
            end;
            LastCR := False;
          end;
          inc(p1);
        end;
        p2^:= #0;
        inc(p2);
        p2^:= #0;
        inc(Size, 2);

        if (RegSetValueEx(CurrentKey, PChar(Ident), 0, REG_MULTI_SZ, Buffer, Size) <> ERROR_SUCCESS) then
          RaiseLastOSError;
      finally
        FreeMem(Buffer);
      end;

    finally
      SetCurrentKey(OldKey);
    end;
  finally
    RegCloseKey(Key);
  end;
end;

// *****************************************************************************
//
//			TConfiguration
//
// *****************************************************************************
constructor TConfiguration.Create(Root: HKEY; const APath: string; AAccess: LongWord);
begin
  inherited Create(nil);
  FRegistry := TFixedRegIniFile.Create('\', AAccess);
  Registry.RootKey := Root;
  Registry.OpenKey(APath, True);
  FPath := APath;
  if (not FPath.IsEmpty) and (not FPath.EndsWith('\')) then
    FPath := FPath+'\';
end;

destructor TConfiguration.Destroy;
begin
  FreeAndNil(FRegistry);
  inherited Destroy;
end;

procedure TConfiguration.SetSubPath(const Value: string);
begin
  FSubPath := Value;
  // SubPath must end with '\'
  if (not FSubPath.IsEmpty) and (not FSubPath.EndsWith('\')) then
    FSubPath := FSubPath+'\';
end;

procedure TConfiguration.WriteConfig;
begin
  WriteSection(SubPath);
end;

procedure TConfiguration.ReadConfig;
begin
  ReadSection(SubPath);
end;

procedure TConfiguration.ReadObject(const AKey: string; Instance: TObject);
begin
  DoReadObject(AKey, Instance);
end;

procedure TConfiguration.WriteObject(const AKey: string; Instance: TObject);
begin
  DoWriteObject(AKey, Instance);
end;

function TConfiguration.GetKey: string;
begin
  Result := '';
end;

function TConfiguration.KeyRoot: string;
begin
  Result := FPath;
end;

function TConfiguration.GetRegistry: TFixedRegIniFile;
begin
  Result := FRegistry;
end;

{ TConfigurationStringValues }

function TConfigurationStringValues.Add(const s: string): integer;
begin
  Result := Strings.Add(s);
end;

procedure TConfigurationStringValues.Assign(Source: TPersistent);
begin
  Strings.Assign(Source);
end;

procedure TConfigurationStringValues.AssignTo(Dest: TPersistent);
begin
  Dest.Assign(Strings);
end;

procedure TConfigurationStringValues.Clear;
begin
  Strings.Clear;
end;

constructor TConfigurationStringValues.Create(
  AOwner: TConfigurationSection);
begin
  inherited Create(AOwner);
  FStrings := TStringList.Create;
  PurgeOnWrite := True;
end;

procedure TConfigurationStringValues.Delete(Index: Integer);
begin
  Strings.Delete(Index);
end;

destructor TConfigurationStringValues.Destroy;
begin
  FreeAndNil(FStrings);
  inherited;
end;

function TConfigurationStringValues.GetCount: integer;
begin
  Result := Strings.Count;
end;

function TConfigurationStringValues.GetEnumerator: TStringsEnumerator;
begin
  Result := Strings.GetEnumerator;
end;

function TConfigurationStringValues.GetItem(Index: integer): string;
begin
  Result := Strings[Index];
end;

function TConfigurationStringValues.GetName(Index: integer): string;
begin
  Result := Strings.Names[Index];
end;

function TConfigurationStringValues.GetValue(Name: string): string;
begin
  Result := Strings.Values[Name];
end;

function TConfigurationStringValues.IndexOf(const s: string): integer;
begin
  Result := Strings.IndexOf(s);
end;

procedure TConfigurationStringValues.Initialize;
begin
  Clear;
end;

procedure TConfigurationStringValues.Insert(Index: Integer;
  const S: string);
begin
  Strings.Insert(Index, S);
end;

procedure TConfigurationStringValues.Move(OldIndex, NewIndex: Integer);
begin
  Strings.Move(OldIndex, NewIndex);
end;

procedure TConfigurationStringValues.ReadSection(const Key: string);
begin
  inherited ReadSection(Key);
  ReadStringValues(Key);
end;

procedure TConfigurationStringValues.ReadStringValues(const Key: string);
begin
  if (Registry.KeyExists(Key)) then
    Registry.ReadSectionValues(Key, Strings)
  else
    ApplyDefault;
end;

procedure TConfigurationStringValues.SetItem(Index: integer;
  const Value: string);
begin
  Strings[Index] := Value;
end;

procedure TConfigurationStringValues.SetStrings(const Value: TStrings);
begin
  Strings.Assign(Value);
end;

procedure TConfigurationStringValues.SetValue(Name: string;
  const Value: string);
begin
  Strings.Values[Name] := Value;
end;

procedure TConfigurationStringValues.WriteSection(const Key: string);
begin
  inherited WriteSection(Key);
  WriteStringValues(Key);
end;

procedure TConfigurationStringValues.WriteStringValues(const Key: string);
var
  i: integer;
begin
  for i := 0 to Count-1 do
    Registry.WriteString(Key, Names[i], Values[Names[i]]);
end;

{ TConfigurationStringList }

procedure TConfigurationStringList.ReadStringValues(const Key: string);
var
  Count, i: integer;
begin
  Count := Registry.ReadInteger(Key, 'Count', -1);
  if (Count = -1) then
    ApplyDefault
  else
    for i := 0 to Count-1 do
      Add(Registry.ReadString(Key, Format('Item%d', [i]), ''));
end;

procedure TConfigurationStringList.WriteStringValues(const Key: string);
var
  i: integer;
begin
  Registry.WriteInteger(Key, 'Count', Count);
  for i := 0 to Count-1 do
    Registry.WriteString(Key, Format('Item%d', [i]), Strings[i]);
end;

{ TConfigurationSection }

procedure TConfigurationSection.ReadSection(const Key: string);
begin
  DoReadObject(Key, Self);
end;

procedure TConfigurationSection.WriteSection(const Key: string);
begin
  if PurgeOnWrite then
    Registry.EraseSection(Key);

  DoWriteObject(Key, Self);
end;

constructor TConfigurationSection.Create(AOwner: TConfigurationSection);
begin
  inherited Create;
  FSections := TConfigurationSectionList.Create;
  FOwner := AOwner;
  if (FOwner <> nil) then
    FOwner.Sections.Add(Self);
end;

destructor TConfigurationSection.Destroy;
begin
  FSections.Clear;
  if (FOwner <> nil) then
    FOwner.Sections.Extract(Self);
  FSections.Free;
  inherited Destroy;
end;

procedure TConfigurationSection.DoWriteObject(const Key: string; Instance: TObject);
var
  PropList: pPropList;
  Count: integer;
  i: Integer;
  MemStream: TMemoryStream;
  StringList: TStrings;
  p: PChar;
  Section: IConfigurationSection;
begin
  Assert(Instance <> nil);

  Registry.CreateKey(Key);

  if (Supports(Instance, IConfigurationSection, Section)) then
  begin
    Section.WriteSection(Registry, Key);
    exit;
  end;

  // TODO : Missing human readable formats:
  // - TDateTime: Write as ISO timestamp YYY-MMM-DD HH:NN:SS.ssss
  // - Float: Write at string nnn.nnn
  // - Int64: Write as Hex: XXXXXXXXXXXXXXXX
  Count := GetPropList(Instance.ClassInfo, tkProperties, nil);
  GetMem(PropList, Count*SizeOf(Pointer));
  try
    Count := GetPropList(Instance.ClassInfo, tkProperties, PropList);

    for i := 0 to Count-1 do
      if IsStoredProp(Instance, PropList[i]) then
      case (PropList[i]^.PropType^.Kind) of
        tkInteger, tkChar, tkEnumeration, tkSet, tkWChar:
          Registry.WriteInteger(Key, PropList[i]^.Name,
            GetOrdProp(Instance, PropList[i]));

        tkInt64:
          Registry.WriteString(Key, PropList[i]^.Name,
            Int64ToBinStr(GetInt64Prop(Instance, PropList[i])));

        tkString, tkLString, tkWString, tkUString:
          Registry.WriteString(Key, PropList[i]^.Name,
            GetStrProp(Instance, PropList[i]));

        tkFloat:
          if (PropList[i]^.PropType^.Name = 'TDateTime') then
            Registry.WriteDateTime(Key, PropList[i]^.Name,
              GetFloatProp(Instance, PropList[i]))
          else
            Registry.WriteFloat(Key, PropList[i]^.Name,
              GetFloatProp(Instance, PropList[i]));

        tkClass:
          if (GetTypeData(PropList[i]^.PropType^)^.ClassType.InheritsFrom(TConfigurationSection)) then
            TConfigurationSection(GetOrdProp(Instance, PropList[i])).
              WriteSection(Key+PropList[i]^.Name+'\')
          else
          begin
            if (GetTypeData(PropList[i]^.PropType^)^.ClassType.InheritsFrom(TStrings)) then
            begin
              StringList := TStrings(GetOrdProp(Instance, PropList[i]));
              if (StringList.Count = 0) then
              begin
                p := nil;
                Registry.WriteBinaryData(Key, PropList[i]^.Name, p, 0);
              end else
              begin
                MemStream := TMemoryStream.Create;
                try
                  // Workaround for Delphi 2.x leak
                  p := StringList.GetText;
                  try
                    MemStream.WriteBuffer(Pointer(p)^, Length(p));
                  finally
                    StrDispose(p);
                  end;
                  Registry.WriteBinaryData(Key, PropList[i]^.Name,
                    MemStream.Memory^, MemStream.Position);
                finally
                  MemStream.Free;
                end;
              end;
            end;
            DoWriteObject(Key+PropList[i]^.Name+'\',
              TObject(GetOrdProp(Instance, PropList[i])));
          end;
      end;
  finally
    FreeMem(PropList);
  end;
end;

procedure TConfigurationSection.DoReadObject(const Key: string; Instance: TObject);
var
  PropList : pPropList;
  Count: integer;
  i: Integer;
  MemStream: TMemoryStream;
  Strings: TStrings;
  Size: integer;

  function IntDefault(Value: Longint; NoDefault: LongInt): Longint; overload;
  begin
    if (Value = Longint($80000000)) then
      Result := NoDefault
    else
      Result := Value;
  end;

  function IntDefault(Value: Int64; NoDefault: Int64): Int64; overload;
  begin
    if (Value = Int64($8000000000000000)) then
      Result := NoDefault
    else
      Result := Value;
  end;

var
  Section: IConfigurationSection;
begin
  Assert(Instance <> nil);

  if (Supports(Instance, IConfigurationSection, Section)) then
  begin
    Section.ReadSection(Registry, Key);
    exit;
  end;

  if (Instance is TConfigurationSection) then
    TConfigurationSection(Instance).Initialize;

  Count := GetPropList(Instance.ClassInfo, tkProperties, nil);
  GetMem(PropList, Count*SizeOf(Pointer));
  try
    Count := GetPropList(Instance.ClassInfo, tkProperties, PropList);
    for i := 0 to Count-1 do
      case (PropList[i]^.PropType^.Kind) of
        tkInteger, tkChar, tkEnumeration, tkSet, tkWChar:
          SetOrdProp(Instance, PropList[i],
            Registry.ReadInteger(Key, PropList[i]^.Name,
              IntDefault(PropList[i]^.Default, GetOrdProp(Instance, PropList[i]))));

        tkInt64:
          SetInt64Prop(Instance, PropList[i],
            BinStrToInt64(Registry.ReadString(Key, PropList[i]^.Name,
              Int64ToBinStr(IntDefault(PropList[i]^.Default, GetInt64Prop(Instance, PropList[i]))))));

        tkString, tkLString, tkWString, tkUString:
          SetStrProp(Instance, PropList[i],
            Registry.ReadString(Key, PropList[i]^.Name,
              GetStrProp(Instance, PropList[i])));

        tkFloat:
          SetFloatProp(Instance, PropList[i],
            Registry.ReadFloat(Key, PropList[i]^.Name,
              GetFloatProp(Instance, PropList[i])));

        tkClass:
          if (GetTypeData(PropList[i]^.PropType^)^.ClassType.InheritsFrom(TConfigurationSection)) then
            TConfigurationSection(GetOrdProp(Instance, PropList[i])).
              ReadSection(Key+PropList[i]^.Name+'\')
          else
          begin
            if (GetTypeData(PropList[i]^.PropType^)^.ClassType.InheritsFrom(TConfigurationStringValues)) then
            begin
              // Nada
            end else
            if (GetTypeData(PropList[i]^.PropType^)^.ClassType.InheritsFrom(TStrings)) then
            begin
               Strings := TStrings(GetOrdProp(Instance, PropList[i]));
               MemStream := TMemoryStream.Create;
               try
                 Size := Registry.GetDataSize(Key, PropList[i]^.Name);
                 if (Size > 0) then
                 begin
                   MemStream.SetSize(Size);
                   if (Registry.ReadBinaryData(Key, PropList[i]^.Name,
                     MemStream.Memory^, Size) > 0) then
                     Strings.LoadFromStream(MemStream);
                 end;
               finally
                 MemStream.Free;
               end;
            end;
            DoReadObject(Key+PropList[i]^.Name+'\', TObject(GetOrdProp(Instance, PropList[i])));
          end;
      end;
  finally
    FreeMem(PropList);
  end;
end;

function TConfigurationSection.GetKey: string;
var
  PropList: pPropList;
  Count: integer;
  i: Integer;
begin
  Count := GetPropList(Owner.ClassInfo, [tkClass], nil);
  GetMem(PropList, Count*SizeOf(Pointer));
  try
    Count := GetPropList(Owner.ClassInfo, [tkClass], PropList);
    i := Count-1;
    while (i >= 0) do
    begin
      if IsStoredProp(Owner, PropList[i]) and
        (TObject(GetOrdProp(Owner, PropList[i])) = Self) then
      begin
        Result := PropList[i]^.Name;
        break;
      end;
      dec(i);
    end;
    if (i < 0) then
      raise Exception.Create('TConfigurationSection not published by owner');
  finally
    FreeMem(PropList);
  end;
  Result := Owner.Key+Result+'\';
end;

function TConfigurationSection.GetKeyPath: string;
begin
  Result := KeyRoot + GetKey;
end;

function TConfigurationSection.KeyRoot: string;
begin
  if (Owner <> nil) then
    Result := Owner.KeyRoot
  else
    Result := '\';
end;

procedure TConfiguration.ReadStream(const AKey, AName: string;
  Stream: TMemoryStream);
var
  Size: integer;
begin
  Stream.Clear;
  Size := Registry.GetDataSize(AKey, AName);
  if (Size > 0) then
  begin
    Stream.Size := Size;
    Registry.ReadBinaryData(AKey, AName, Stream.Memory^, Stream.Size);
  end;
end;

procedure TConfiguration.WriteStream(const AKey, AName: string;
  Stream: TMemoryStream);
begin
  Registry.WriteBinaryData(AKey, AName, Stream.Memory^, Stream.Size);
end;

procedure TConfigurationSection.ApplyDefault;
begin
  // Does nothing by default.
  // Override in descendants to implement default values for properties that
  // doesn't normally support them (e.g. string lists etc).
end;

procedure TConfigurationSection.Assign(Source: TPersistent);
var
  PropList : pPropList;
  PropInfo: PPropInfo;
  Count: integer;
  i: Integer;
  CanEnable: boolean;
  IsEnabled: boolean;
  Child: TPersistent;
  ShouldRestore: boolean;
  Save: integer;
begin
  if (Source is TConfigurationSection) then
  begin

    PropInfo := GetPropInfo(Source, 'Enabled');
    CanEnable := (PropInfo <> nil) and (PropInfo^.PropType^ = System.TypeInfo(Boolean));
    IsEnabled := CanEnable and (Boolean(GetOrdProp(Source, 'Enabled')));

    Count := GetPropList(Source.ClassInfo, tkProperties, nil);
    GetMem(PropList, Count*SizeOf(Pointer));
    try
      Count := GetPropList(Source.ClassInfo, tkProperties, PropList);
      for i := 0 to Count-1 do
        case (PropList[i]^.PropType^.Kind) of
          tkInteger, tkChar, tkEnumeration, tkSet, tkWChar:
          begin
            // Propagate Enabled=False
            if (CanEnable) and (not IsEnabled) and (PropList[i]^.PropType^ = System.TypeInfo(Boolean)) then
              SetOrdProp(Self, PropList[i], Ord(False))
            else
              SetOrdProp(Self, PropList[i], GetOrdProp(Source, PropList[i]));
          end;

          tkInt64:
            SetInt64Prop(Self, PropList[i], GetInt64Prop(Source, PropList[i]));

          tkString, tkLString:
            SetStrProp(Self, PropList[i], GetStrProp(Source, PropList[i]));

          tkFloat:
            SetFloatProp(Self, PropList[i], GetFloatProp(Source, PropList[i]));

          tkClass:
            if (GetTypeData(PropList[i]^.PropType^)^.ClassType.InheritsFrom(TPersistent)) then
            begin
              ShouldRestore := False;
              Save := 0;
              Child := TPersistent(GetOrdProp(Source, PropList[i]));
              if (CanEnable) and (not IsEnabled) then
              begin
                PropInfo := GetPropInfo(Child, 'Enabled');
                // Disable child before assign to propagate "disableness"
                if (PropInfo <> nil) and (PropInfo^.PropType^ = System.TypeInfo(Boolean)) then
                begin
                  Save := GetOrdProp(Child, PropInfo);
                  SetOrdProp(Child, PropInfo, ord(False));
                  ShouldRestore := True;
                end;
              end;
              TPersistent(GetOrdProp(Self, PropList[i])).Assign(Child);
              if (ShouldRestore) then
                SetOrdProp(Child, PropInfo, Save);
            end;
        end;
    finally
      FreeMem(PropList);
    end;
  end else
    inherited Assign(Source);
end;

procedure TConfigurationSection.ReadStream(const AKey, AName: string;
  Stream: TMemoryStream);
begin
  Owner.ReadStream(AKey, AName, Stream);
end;

procedure TConfigurationSection.WriteStream(const AKey, AName: string;
  Stream: TMemoryStream);
begin
  Owner.WriteStream(AKey, AName, Stream);
end;

procedure TConfigurationSection.ReadStream(const AName: string;
  Stream: TMemoryStream);
begin
  Owner.ReadStream(Key, AName, Stream);
end;

procedure TConfigurationSection.WriteStream(const AName: string;
  Stream: TMemoryStream);
begin
  Owner.WriteStream(Key, AName, Stream);
end;

function TConfigurationSection.SectionByName(const Name: string): TConfigurationSection;
var
  PropInfo: PPropInfo;
begin
  PropInfo := GetPropInfo(Self, Name);
  if (PropInfo <> nil) then
    Result := GetObjectProp(Self, PropInfo, TConfigurationSection) as TConfigurationSection
  else
    Result := nil;
end;

function TConfigurationSection.GetRegistry: TFixedRegIniFile;
begin
  Result := Owner.Registry;
end;

procedure TConfigurationSection.Initialize;
begin
  ApplyDefault;
end;

{ TConfigurationSectionList }

procedure TConfigurationSectionList.Add(Section: TConfigurationSection);
begin
  FSections.Add(Section);
end;

procedure TConfigurationSectionList.Clear;
begin
  FSections.Clear;
end;

constructor TConfigurationSectionList.Create;
begin
  inherited Create;
  FSections := TObjectList<TConfigurationSection>.Create(True);
end;

destructor TConfigurationSectionList.Destroy;
begin
  FSections.Free;
  inherited Destroy;
end;

procedure TConfigurationSectionList.Extract(Section: TConfigurationSection);
begin
  FSections.Extract(Section);
end;

function TConfigurationSectionList.GetCount: integer;
begin
  Result := FSections.Count;
end;

function TConfigurationSectionList.GetSection(Index: integer): TConfigurationSection;
begin
  Result := FSections[Index];
end;

procedure TConfigurationSectionList.Remove(Section: TConfigurationSection);
begin
  FSections.Remove(Section);
end;

{ TConfigurationSectionValues<T> }

constructor TConfigurationSectionValues<T>.Create(AOwner: TConfigurationSection);
begin
  inherited Create(AOwner);
  FItems := TObjectDictionary<string, T>.Create([doOwnsValues]);
end;

destructor TConfigurationSectionValues<T>.Destroy;
begin
  FItems.Free;
  inherited;
end;

function TConfigurationSectionValues<T>.Find(const Name: string): T;
begin
  if (not FItems.TryGetValue(Name, Result)) then
    Result := nil;
end;

function TConfigurationSectionValues<T>.Add(const Name: string): T;
begin
  Result := T.Create(Self);
  FItems.Add(Name, Result);
end;

procedure TConfigurationSectionValues<T>.Clear;
begin
  FItems.Clear;
end;

function TConfigurationSectionValues<T>.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TConfigurationSectionValues<T>.GetName(Index: integer): string;
begin
  Result := FItems.Keys.ToArray[Index];
end;

function TConfigurationSectionValues<T>.GetValue(Name: string): T;
begin
  if (not FItems.TryGetValue(Name, Result)) then
    Result := Add(Name);
end;

procedure TConfigurationSectionValues<T>.Initialize;
begin
  inherited Initialize;
  Clear;
end;

procedure TConfigurationSectionValues<T>.Remove(const Name: string);
begin
  FItems.Remove(Name);
end;

procedure TConfigurationSectionValues<T>.ReadSection(const Key: string);
var
  SectionNames: TStrings;
  Name: string;
begin
  inherited;

  SectionNames := TStringList.Create;
  try
    Registry.ReadSectionNames(Key, SectionNames);

    for Name in SectionNames do
      Items[Name].ReadSection(Key+Name+'\');

  finally
    SectionNames.Free;
  end;
end;

procedure TConfigurationSectionValues<T>.WriteSection(const Key: string);
var
  SectionNames: TStrings;
  Pair: TPair<string, T>;
  n: integer;
  Name: string;
begin
  inherited;

  if (FPurgeOnWrite) then
    SectionNames := TStringList.Create
  else
    SectionNames := nil;
  try
    if (FPurgeOnWrite) then
      Registry.ReadSectionNames(Key, SectionNames);

    for Pair in FItems do
    begin
      Pair.Value.WriteSection(Key+Pair.Key+'\');

      if (FPurgeOnWrite) then
      begin
        n := SectionNames.IndexOf(Pair.Key);
        if (n <> -1) then
          SectionNames.Delete(n);
      end;
    end;

    // Remove any sections that weren't saved
    if (FPurgeOnWrite) then
      for Name in SectionNames do
        if (Name <> '') then
          Registry.EraseSection(Key+Name+'\');
  finally
    SectionNames.Free;
  end;
end;

end.
