unit amLocale;

(*
 * Copyright © 2008 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

{$WARN UNIT_PLATFORM OFF}
{$WARN SYMBOL_PLATFORM OFF}

{.$define FEATURE_LOCALE_FLAGS}

uses
  Generics.Collections,
  Generics.Defaults,
  Windows,
{$ifdef FEATURE_LOCALE_FLAGS}
  Graphics,
{$endif FEATURE_LOCALE_FLAGS}
  Classes,
  ActiveX;

type
//------------------------------------------------------------------------------
//
//      TLocaleItem
//
//------------------------------------------------------------------------------
  TLocaleItem = class
  private
    FLocale: LCID;
    FISO3166Name: string;
    FCountryName: string;
{$ifdef FEATURE_LOCALE_FLAGS}
    FFlag: TBitmap;
{$endif FEATURE_LOCALE_FLAGS}
    FDisplayName: string;
    FLanguageName: string;
    FLanguageShortName: string;
    FCharSet: integer;
    FIgnore: boolean;
  protected
{$ifdef FEATURE_LOCALE_FLAGS}
    function GetFlag: TBitmap;
{$endif FEATURE_LOCALE_FLAGS}
    function GetDisplayName: string;
    function GetISO3166Name: string;
    function GetCountryCode: integer;
    function GetAnsiCodePage: integer;
    function GetLanguageName: string;
    function GetLanguageShortName: string;
    function GetLanguage: LangID;
    function GetCharSet: integer;
    function GetCountryName: string;
    function GetISO639_1Name: string;
    function GetPrimaryLanguage: Word;
    function GetSubLanguage: Word;
  public
    constructor Create(ALocale: LCID);
    destructor Destroy; override;

    class function GetLocaleDataW(ID: LCID; Flag: DWORD): string;
    property DisplayName: string read GetDisplayName;
    property ISO3166Name: string read GetISO3166Name;
    property ISO639_1Name: string read GetISO639_1Name;
    property CountryCode: integer read GetCountryCode;
    property CountryName: string read GetCountryName;
    property AnsiCodePage: integer read GetAnsiCodePage;
    property Locale: LCID read FLocale;
    property PrimaryLanguage: Word read GetPrimaryLanguage;
    property SubLanguage: Word read GetSubLanguage;
    property LanguageName: string read GetLanguageName;
    property LanguageShortName: string read GetLanguageShortName;
    property Language: LangID read GetLanguage;
    property CharSet: integer read GetCharSet;
    property Ignore: boolean read FIgnore write FIgnore;

{$ifdef FEATURE_LOCALE_FLAGS}
    function ReleaseFlag: TBitmap;
    procedure DestroyFlag;
    property Flag: TBitmap read GetFlag;
{$endif FEATURE_LOCALE_FLAGS}
  end;

//------------------------------------------------------------------------------
//
//      TLocaleItems
//
//------------------------------------------------------------------------------
  TLocaleItems = class
  private
    class var FLocaleItems: TObjectList<TLocaleItem>;
  private
    class function GetLocaleItems: TObjectList<TLocaleItem>; static;
    class function GetLocaleItem(Index: integer): TLocaleItem; static;
    class function GetCount: integer; static;
    class property LocaleItems: TObjectList<TLocaleItem> read GetLocaleItems;
  public
    class function IndexOf(AID: LCID): integer; static;
    class function IndexOfCountry(const ISO3166Name: string): integer; static;
    class function IndexOfName(const Name: string): integer; static;
    class function IndexOfLanguageName(const Name: string): integer; static;
    class function IndexOfLanguageShortName(const Name: string): integer; static;
    class function IndexOfCountryCode(const Value: integer): integer; static; deprecated;

    class function FindLCID(Value: LCID): TLocaleItem; static;
    class function FindCountry(const Value: string): TLocaleItem; static;
    class function FindName(const Value: string): TLocaleItem; static;
    class function FindLanguageName(const Value: string): TLocaleItem; static;
    class function FindLanguageShortName(const Value: string): TLocaleItem; static;
    class function FindCountryCode(const Value: integer): TLocaleItem; static; deprecated;
    class function FindISO639_1Name(const Value: string): TLocaleItem; static;
    class function FindISO3166Name(const Value: string): TLocaleItem; static;

    class procedure Sort(const AComparer: IComparer<TLocaleItem>);
    class property Items[index: integer]: TLocaleItem read GetLocaleItem;
    class property Count: integer read GetCount;
  end;



//------------------------------------------------------------------------------
//
//      Utilities
//
//------------------------------------------------------------------------------
function LocaleISO3166Name: string;
function LocaleMonetaryGrouping(Index: integer): integer;
procedure ClearLocale;
procedure SetLocale(Locale: LCID);
function MakeLangID(Primary, Region: Word ): Word;
function LocaleName: string;
function LoadNewResourceModule(Locale: LCID): HModule; overload;
function LoadNewResourceModule(const ModuleTypeName: string): HModule; overload;
function TryLocaleToISO639_1Name(Locale: LCID; var Value: string): boolean;
function LocaleToISO639_1Name(Locale: LCID; const Default: string = ''): string;
function TryISO639_1NameToLocale(const Name: string; var Value: TLCID): boolean;
function ISO639_1NameToLocale(const Name: string; Default: TLCID = 0): TLCID;


//------------------------------------------------------------------------------
//
//      MLang
//
//------------------------------------------------------------------------------
const
  IID_IMultiLanguage2: TGUID = '{DCCFC164-2B38-11D2-B7EC-00C04F8F5D9A}';
  CLSID_CMultiLanguage: TGUID = '{275C23E2-3747-11D0-9FEA-00AA003F8646}';

type
  tagMIMECPINFO = packed record
    dwFlags: LongWord;
    uiCodePage: SYSUINT;
    uiFamilyCodePage: SYSUINT;
    wszDescription: array[0..63] of WideChar;
    wszWebCharset: array[0..49] of WideChar;
    wszHeaderCharset: array[0..49] of WideChar;
    wszBodyCharset: array[0..49] of WideChar;
    wszFixedWidthFont: array[0..31] of WideChar;
    wszProportionalFont: array[0..31] of WideChar;
    bGDICharset: Byte;
    padding : array [0..2] of Byte;
  end;

  tagMIMECSETINFO = packed record
    uiCodePage: SYSUINT;
    uiInternetEncoding: SYSUINT;
    wszCharset: array[0..49] of WideChar;
  end;

  tagRFC1766INFO = packed record
    lcid: LongWord;
    wszRfc1766: array[0..5] of WideChar;
    wszLocaleName: array[0..31] of WideChar;
  end;

  tagDetectEncodingInfo = packed record
    nLangID: SYSUINT;
    nCodePage: SYSUINT;
    nDocPercent: SYSINT;
    nConfidence: SYSINT;
  end;

  __MIDL_IWinTypes_0009 = record
    case Integer of
      0: (hInproc: Integer);
      1: (hRemote: Integer);
  end;

  _RemotableHandle = packed record
    fContext: Integer;
    u: __MIDL_IWinTypes_0009;
  end;

  tagSCRIPTINFO = packed record
    ScriptId: Byte;
    uiCodePage: SYSUINT;
    wszDescription: array[0..47] of WideChar;
    wszFixedWidthFont: array[0..31] of WideChar;
    wszProportionalFont: array[0..31] of WideChar;
  end;

type
  tagMIMECONTF = (
    MIMECONTF_MAILNEWS = $00000001,
    MIMECONTF_BROWSER = $00000002,
    MIMECONTF_MINIMAL = $00000004,
    MIMECONTF_IMPORT = $00000008,
    MIMECONTF_SAVABLE_MAILNEWS = $00000100,
    MIMECONTF_SAVABLE_BROWSER = $00000200,
    MIMECONTF_EXPORT = $00000400,
    MIMECONTF_PRIVCONVERTER = $00010000,
    MIMECONTF_VALID = $00020000,
    MIMECONTF_VALID_NLS = $00040000,
    MIMECONTF_MIME_IE4 = $10000000,
    MIMECONTF_MIME_LATEST = $20000000,
    MIMECONTF_MIME_REGISTRY = $40000000
  );

// *********************************************************************//
// Interface: IEnumCodePage
// Flags:     (0)
// GUID:      {275C23E3-3747-11D0-9FEA-00AA003F8646}
// *********************************************************************//
  IEnumCodePage = interface(IUnknown)
    ['{275C23E3-3747-11D0-9FEA-00AA003F8646}']
    function Clone(out ppEnum: IEnumCodePage): HResult; stdcall;
    function Next(celt: LongWord; out rgelt: tagMIMECPINFO; out pceltFetched: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Skip(celt: LongWord): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IEnumRfc1766
// Flags:     (0)
// GUID:      {3DC39D1D-C030-11D0-B81B-00C04FC9B31F}
// *********************************************************************//
  IEnumRfc1766 = interface(IUnknown)
    ['{3DC39D1D-C030-11D0-B81B-00C04FC9B31F}']
    function Clone(out ppEnum: IEnumRfc1766): HResult; stdcall;
    function Next(celt: LongWord; out rgelt: tagRFC1766INFO; out pceltFetched: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Skip(celt: LongWord): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IMLangConvertCharset
// Flags:     (0)
// GUID:      {D66D6F98-CDAA-11D0-B822-00C04FC9B31F}
// *********************************************************************//
  IMLangConvertCharset = interface(IUnknown)
    ['{D66D6F98-CDAA-11D0-B822-00C04FC9B31F}']
    function Initialize(uiSrcCodePage: SYSUINT; uiDstCodePage: SYSUINT; dwProperty: LongWord): HResult; stdcall;
    function GetSourceCodePage(out puiSrcCodePage: SYSUINT): HResult; stdcall;
    function GetDestinationCodePage(out puiDstCodePage: SYSUINT): HResult; stdcall;
    function GetProperty(out pdwProperty: LongWord): HResult; stdcall;
    function DoConversion(var pSrcStr: Byte; var pcSrcSize: SYSUINT; var pDstStr: Byte;
      var pcDstSize: SYSUINT): HResult; stdcall;
    function DoConversionToUnicode(var pSrcStr: Shortint; var pcSrcSize: SYSUINT; var pDstStr: Smallint;
      var pcDstSize: SYSUINT): HResult; stdcall;
    function DoConversionFromUnicode(var pSrcStr: Smallint; var pcSrcSize: SYSUINT; var pDstStr: Shortint;
      var pcDstSize: SYSUINT): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IEnumScript
// Flags:     (0)
// GUID:      {AE5F1430-388B-11D2-8380-00C04F8F5DA1}
// *********************************************************************//
  IEnumScript = interface(IUnknown)
    ['{AE5F1430-388B-11D2-8380-00C04F8F5DA1}']
    function Clone(out ppEnum: IEnumScript): HResult; stdcall;
    function Next(celt: LongWord; out rgelt: tagSCRIPTINFO; out pceltFetched: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Skip(celt: LongWord): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IMultiLanguage2
// Flags:     (0)
// GUID:      {DCCFC164-2B38-11D2-B7EC-00C04F8F5D9A}
// *********************************************************************//
  IMultiLanguage2 = interface(IUnknown)
    ['{DCCFC164-2B38-11D2-B7EC-00C04F8F5D9A}']
    function GetNumberOfCodePageInfo(out pcCodePage: SYSUINT): HResult; stdcall;
    function GetCodePageInfo(uiCodePage: SYSUINT; LangId: Word; out pCodePageInfo: tagMIMECPINFO): HResult; stdcall;
    function GetFamilyCodePage(uiCodePage: SYSUINT; out puiFamilyCodePage: SYSUINT): HResult; stdcall;
    function EnumCodePages(grfFlags: LongWord; LangId: Word; out ppEnumCodePage: IEnumCodePage): HResult; stdcall;
    function GetCharsetInfo(const Charset: WideString; out pCharsetInfo: tagMIMECSETINFO): HResult; stdcall;
    function IsConvertible(dwSrcEncoding: LongWord; dwDstEncoding: LongWord): HResult; stdcall;
    function ConvertString(var pdwMode: LongWord; dwSrcEncoding: LongWord; dwDstEncoding: LongWord;
      var pSrcStr: Byte; var pcSrcSize: SYSUINT; var pDstStr: Byte; var pcDstSize: SYSUINT): HResult; stdcall;
    function ConvertStringToUnicode(var pdwMode: LongWord; dwEncoding: LongWord; var pSrcStr: Shortint;
      var pcSrcSize: SYSUINT; var pDstStr: Smallint; var pcDstSize: SYSUINT): HResult; stdcall;
    function ConvertStringFromUnicode(var pdwMode: LongWord; dwEncoding: LongWord; var pSrcStr: Smallint;
      var pcSrcSize: SYSUINT; var pDstStr: Shortint; var pcDstSize: SYSUINT): HResult; stdcall;
    function ConvertStringReset: HResult; stdcall;
    function GetRfc1766FromLcid(locale: LongWord; out pbstrRfc1766: WideString): HResult; stdcall;
    function GetLcidFromRfc1766(out plocale: LongWord; const bstrRfc1766: WideString): HResult; stdcall;
    function EnumRfc1766(LangId: Word; out ppEnumRfc1766: IEnumRfc1766): HResult; stdcall;
    function GetRfc1766Info(locale: LongWord; LangId: Word; out pRfc1766Info: tagRFC1766INFO): HResult; stdcall;
    function CreateConvertCharset(uiSrcCodePage: SYSUINT; uiDstCodePage: SYSUINT; dwProperty: LongWord;
      out ppMLangConvertCharset: IMLangConvertCharset): HResult; stdcall;
    function ConvertStringInIStream(var pdwMode: LongWord; dwFlag: LongWord; var lpFallBack: Smallint;
      dwSrcEncoding: LongWord; dwDstEncoding: LongWord; const pstmIn: IStream; const pstmOut: IStream): HResult; stdcall;
    function ConvertStringToUnicodeEx(var pdwMode: LongWord; dwEncoding: LongWord; var pSrcStr: Shortint;
      var pcSrcSize: SYSUINT; var pDstStr: Smallint; var pcDstSize: SYSUINT; dwFlag: LongWord;
      var lpFallBack: Smallint): HResult; stdcall;
    function ConvertStringFromUnicodeEx(var pdwMode: LongWord; dwEncoding: LongWord; var pSrcStr: Smallint;
      var pcSrcSize: SYSUINT; var pDstStr: Shortint; var pcDstSize: SYSUINT; dwFlag: LongWord;
      var lpFallBack: Smallint): HResult; stdcall;
    function DetectCodepageInIStream(dwFlag: LongWord; dwPrefWinCodePage: LongWord; const pstmIn: IStream;
      var lpEncoding: tagDetectEncodingInfo; var pnScores: SYSINT): HResult; stdcall;
    function DetectInputCodepage(dwFlag: LongWord; dwPrefWinCodePage: LongWord; var pSrcStr: Shortint;
      var pcSrcSize: SYSINT; var lpEncoding: tagDetectEncodingInfo; var pnScores: SYSINT): HResult; stdcall;
    function ValidateCodePage(uiCodePage: SYSUINT; var hwnd: _RemotableHandle): HResult; stdcall;
    function GetCodePageDescription(uiCodePage: SYSUINT; lcid: LongWord; lpWideCharStr: PWideChar;
      cchWideChar: SYSINT): HResult; stdcall;
    function IsCodePageInstallable(uiCodePage: SYSUINT): HResult; stdcall;
    function SetMimeDBSource(dwSource: tagMIMECONTF): HResult; stdcall;
    function GetNumberOfScripts(out pnScripts: SYSUINT): HResult; stdcall;
    function EnumScripts(dwFlags: LongWord; LangId: Word; out ppEnumScript: IEnumScript): HResult; stdcall;
    function ValidateCodePageEx(uiCodePage: SYSUINT; var hwnd: _RemotableHandle; dwfIODControl: LongWord): HResult; stdcall;
  end;

function GetSystemDefaultUILanguage: LANGID; stdcall; external kernel32 name 'GetSystemDefaultUILanguage';


//------------------------------------------------------------------------------
//
//      MLang wrappers
//
//------------------------------------------------------------------------------
function DetectCodePage(Stream: TStream): integer;
function GetCodePageDescription(Codepage: integer): string;


//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

implementation

uses
  SysUtils;

{$ifdef FEATURE_LOCALE_FLAGS}
{$R 'amFlags.res'}
{$endif FEATURE_LOCALE_FLAGS}

//------------------------------------------------------------------------------
//
//      Utilities
//
//------------------------------------------------------------------------------
function SetResourceHInstance(NewInstance: HModule): HModule;
var
  CurModule: PLibModule;
begin
  CurModule := LibModuleList;
  Result := 0;
  while (CurModule <> nil) do
  begin
    if CurModule.Instance = HInstance then
    begin
      if (CurModule.ResInstance <> CurModule.Instance) then
        FreeLibrary(CurModule.ResInstance);
      CurModule.ResInstance := NewInstance;
      Result := NewInstance;
      Exit;
    end;
    CurModule := CurModule.Next;
  end;
end;

//------------------------------------------------------------------------------

function LoadNewResourceModule(Locale: LCID): HModule;
var
  LocaleName: array[0..4] of Char;
begin
  GetLocaleInfo(Locale, LOCALE_SABBREVLANGNAME, LocaleName, SizeOf(LocaleName));
  Result := LoadNewResourceModule(LocaleName);
end;

function LoadNewResourceModule(const ModuleTypeName: string): HModule;
var
  Filename: string;
  NewInst: HModule;
begin
  Result := 0;

  if (ModuleTypeName <> '') then
  begin
    Filename := ExtractFilename(GetModuleName(HInstance));

    if (Filename <> '') then
    begin
      Filename := ChangeFileExt(Filename, '.');

      // Then look for a potential language/country translation
      NewInst := LoadLibraryEx(PChar(Filename + ModuleTypeName), 0, LOAD_LIBRARY_AS_DATAFILE);

      if (NewInst = 0) and (Length(ModuleTypeName) > 2) then
        // Finally look for a language only translation
        NewInst := LoadLibraryEx(PChar(Filename + Copy(ModuleTypeName, 1, 2)), 0, LOAD_LIBRARY_AS_DATAFILE);
    end else
      NewInst := 0;
  end else
    NewInst := hInstance;

  if (NewInst <> 0) then
    Result := SetResourceHInstance(NewInst)
end;

//------------------------------------------------------------------------------

function MakeLangID(Primary, Region: Word ): Word;
begin
  Result := (Region shl 10) or Primary;
end;

//------------------------------------------------------------------------------

procedure SetLocale(Locale: LCID);
begin
  Win32Check(SetThreadLocale(Locale));
  GetFormatSettings;
  ClearLocale;
end;

//------------------------------------------------------------------------------

var
  FISO3166Name: string = '';

function GetLocaleDataW(ID: LCID; Flag: DWORD): string;
var
  Buffer: array[0..1023] of WideChar;
begin
  Buffer[0] := #0;
  GetLocaleInfoW(ID, Flag, Buffer, SizeOf(Buffer) div 2);
  Result := Buffer;
end;

//------------------------------------------------------------------------------

function LocaleISO3166Name: string;
begin
  if (FISO3166Name = '') then
    FISO3166Name := GetLocaleDataW(GetThreadLocale, LOCALE_SISO3166CTRYNAME);
  Result := FISO3166Name;
end;

//------------------------------------------------------------------------------

function LocaleName: string;
begin
  Result := GetLocaleDataW(GetThreadLocale, LOCALE_SLANGUAGE);
end;

//------------------------------------------------------------------------------

(*
LOCALE_SMONGROUPING
Sizes for each group of digits to the left of the decimal. The maximum
number of characters allowed for this string is ten, including a terminating
null character. An explicit size is needed for each group, and sizes are
separated by semicolons. If the last value is zero, the preceding value is
repeated. For example, to group thousands, specify 3;0. Indic locales group
the first thousand and then group by hundreds. For example, 12,34,56,789 is
represented by 3;2;0
*)
type
  TMonetaryGrouping = array of integer;

var
  FMonetaryGrouping: TMonetaryGrouping;

function LocaleMonetaryGrouping(Index: integer): integer;
var
  Grouping: string;
  i: integer;
  p: PChar;
  Group: integer;
begin
  if (Length(FMonetaryGrouping) = 0) then
  begin
    Grouping := GetLocaleStr(GetThreadLocale, LOCALE_SMONGROUPING , '3;0');
    // Count number of groups
    p := PChar(Grouping);
    i := 0;
    while (p^ <> #0) do
    begin
      if (p^ = ';') then
        inc(i);
      inc(p);
    end;

    if (i = 0) then
    begin
      i := 1;
      Grouping := '3;0';
    end;

    SetLength(FMonetaryGrouping, i+1);

    // Get groups
    p := PChar(Grouping);
    i := 0;
    while (p^ <> #0) do
    begin
      if (p^ <> ';') then
      begin
        Group := ord(p^)-ord('0');
        FMonetaryGrouping[i] := Group;
      end else
        inc(i);
      inc(p);
    end;
  end;

  if (Index >= Length(FMonetaryGrouping)-1) then
  begin
    if (Length(FMonetaryGrouping) > 1) and (FMonetaryGrouping[Length(FMonetaryGrouping)-1] = 0) then
      Result := FMonetaryGrouping[Length(FMonetaryGrouping)-2]
    else
      Result := 0;
  end else
    Result := FMonetaryGrouping[Index];
end;

//------------------------------------------------------------------------------

procedure ClearLocale;
begin
  FISO3166Name := '';
  SetLength(FMonetaryGrouping, 0);
end;


//------------------------------------------------------------------------------
//
//      TLocaleItems
//
//------------------------------------------------------------------------------
function EnumLocalesCallback(LocaleID: PChar): Integer; stdcall;
var
  AID: LCID;
  LocaleItem: TLocaleItem;
  s: string;
begin
  AID := StrToInt('$' + Copy(LocaleID, 5, 4));
  s := IntToHex(AID, 4);

  Result := 1;

  LocaleItem := TLocaleItem.Create(AID);
  try
    if (LocaleItem.ISO3166Name <> '') and True then
//      (TLocaleItems.IndexOfCountry(LocaleItem.ISO3166Name) = -1) then
      TLocaleItems.FLocaleItems.Add(LocaleItem)
    else
      LocaleItem.Free;
  except
    LocaleItem.Free;
    Result := 0;
  end;
end;

//------------------------------------------------------------------------------

class function TLocaleItems.FindCountry(const Value: string): TLocaleItem;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to LocaleItems.Count-1 do
    if (AnsiSameText(FLocaleItems[i].ISO3166Name, Value)) then
    begin
      Result := FLocaleItems[i];
      break;
    end;
end;

//------------------------------------------------------------------------------

class function TLocaleItems.FindCountryCode(const Value: integer): TLocaleItem;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to LocaleItems.Count-1 do
    if (FLocaleItems[i].CountryCode = Value) then
    begin
      Result := FLocaleItems[i];
      break;
    end;
end;

//------------------------------------------------------------------------------

class function TLocaleItems.FindISO3166Name(const Value: string): TLocaleItem;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to LocaleItems.Count-1 do
    if (AnsiSameText(FLocaleItems[i].ISO3166Name, Value)) then
    begin
      Result := FLocaleItems[i];
      break;
    end;
end;

//------------------------------------------------------------------------------

class function TLocaleItems.FindISO639_1Name(const Value: string): TLocaleItem;
var
  i: integer;
  SubLanguage: Word;
  LCID: TLCID;
  BetterLocaleItem: TLocaleItem;
begin
  Result := nil;
  for i := 0 to LocaleItems.Count-1 do
    if (AnsiSameText(FLocaleItems[i].ISO639_1Name, Value)) then
    begin
      Result := FLocaleItems[i];
      break;
    end;

  // An ISO639_1 name can map to many different locales (eg en -> en-us, en-gb, en-au) so attempt to find
  // the primary one.
  if (Result <> nil) and (Result.SubLanguage <> 1) then
  begin
    SubLanguage := 0; // We should probably start with 1, but no harm's done
    BetterLocaleItem := nil;
    while (BetterLocaleItem = nil) and (SubLanguage < 32) do
    begin
      LCID := MAKELANGID(Result.PrimaryLanguage, SubLanguage);
      BetterLocaleItem := TLocaleItems.FindLCID(LCID);
      inc(SubLanguage);
    end;
    if (BetterLocaleItem <> nil) then
      Result := BetterLocaleItem;
  end;
end;

//------------------------------------------------------------------------------

class function TLocaleItems.FindLanguageName(const Value: string): TLocaleItem;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to LocaleItems.Count-1 do
    if (AnsiSameText(FLocaleItems[i].LanguageName, Value)) then
    begin
      Result := FLocaleItems[i];
      break;
    end;
end;

//------------------------------------------------------------------------------

class function TLocaleItems.FindLanguageShortName(const Value: string): TLocaleItem;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to LocaleItems.Count-1 do
    if (AnsiSameText(FLocaleItems[i].LanguageShortName, Value)) then
    begin
      Result := FLocaleItems[i];
      break;
    end;
end;

//------------------------------------------------------------------------------

class function TLocaleItems.FindLCID(Value: LCID): TLocaleItem;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to LocaleItems.Count-1 do
    if (FLocaleItems[i].Locale = Value) then
    begin
      Result := FLocaleItems[i];
      break;
    end;
end;

//------------------------------------------------------------------------------

class function TLocaleItems.FindName(const Value: string): TLocaleItem;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to LocaleItems.Count-1 do
    if (AnsiSameText(FLocaleItems[i].DisplayName, Value)) then
    begin
      Result := FLocaleItems[i];
      break;
    end;
end;

//------------------------------------------------------------------------------

class function TLocaleItems.GetCount: integer;
begin
  Result := LocaleItems.Count;
end;

//------------------------------------------------------------------------------

class function TLocaleItems.GetLocaleItem(Index: integer): TLocaleItem;
begin
  Result := LocaleItems[Index];
end;

//------------------------------------------------------------------------------

class function TLocaleItems.GetLocaleItems: TObjectList<TLocaleItem>;
begin
  if (FLocaleItems = nil) then
  begin
    FLocaleItems := TObjectList<TLocaleItem>.Create;

    // Get list of all locales supported by system
    EnumSystemLocales(@EnumLocalesCallback, LCID_SUPPORTED);
  end;

  Result := FLocaleItems;
end;

//------------------------------------------------------------------------------

class function TLocaleItems.IndexOfCountry(const ISO3166Name: string): integer;
begin
  Result := LocaleItems.Count-1;
  while (Result >= 0) do
  begin
    if (AnsiSameText(FLocaleItems[Result].ISO3166Name, ISO3166Name)) then
      break;
    dec(Result);
  end;
end;

//------------------------------------------------------------------------------

class function TLocaleItems.IndexOfCountryCode(const Value: integer): integer;
begin
  Result := LocaleItems.Count-1;
  while (Result >= 0) do
  begin
    if (FLocaleItems[Result].CountryCode = Value) then
      break;
    dec(Result);
  end;
end;

//------------------------------------------------------------------------------

class function TLocaleItems.IndexOfLanguageName(const Name: string): integer;
begin
  Result := LocaleItems.Count-1;
  while (Result >= 0) do
  begin
    if (AnsiSameText(FLocaleItems[Result].LanguageName, Name)) then
      break;
    dec(Result);
  end;
end;

//------------------------------------------------------------------------------

class function TLocaleItems.IndexOfLanguageShortName(const Name: string): integer;
begin
  Result := LocaleItems.Count-1;
  while (Result >= 0) do
  begin
    if (AnsiSameText(FLocaleItems[Result].LanguageShortName, Name)) then
      break;
    dec(Result);
  end;
end;

//------------------------------------------------------------------------------

class function TLocaleItems.IndexOfName(const Name: string): integer;
begin
  Result := LocaleItems.Count-1;
  while (Result >= 0) do
  begin
    if (AnsiSameText(FLocaleItems[Result].DisplayName, Name)) then
      break;
    dec(Result);
  end;
end;

//------------------------------------------------------------------------------

class procedure TLocaleItems.Sort(const AComparer: IComparer<TLocaleItem>);
begin
  LocaleItems.Sort(AComparer);
end;

//------------------------------------------------------------------------------

class function TLocaleItems.IndexOf(AID: LCID): integer;
begin
  Result := LocaleItems.Count-1;
  while (Result >= 0) do
  begin
    if (FLocaleItems[Result].Locale = AID) then
      break;
    dec(Result);
  end;
end;


//------------------------------------------------------------------------------
//
//      TLocaleItem
//
//------------------------------------------------------------------------------
function TLocaleItem.GetLanguage: LangID;
begin
  // http://msdn2.microsoft.com/en-us/library/ms776294(VS.85).aspx
  Result := FLocale and $3FF;
end;

//------------------------------------------------------------------------------

function TLocaleItem.GetLanguageName: string;
begin
  (*
  LOCALE_SLANGUAGE
  localized name of language.
  *)
  if (FLanguageName = '') then
    FLanguageName := GetLocaleDataW(Locale, LOCALE_SLANGUAGE);
  Result := FLanguageName;
end;

//------------------------------------------------------------------------------

function TLocaleItem.GetLanguageShortName: string;
begin
  (*
  LOCALE_SABBREVLANGNAME
  abbreviated language name
  http://www.microsoft.com/globaldev/reference/winxp/langtla.mspx
  *)
  if (FLanguageShortName = '') then
    FLanguageShortName := GetLocaleDataW(Locale, LOCALE_SABBREVLANGNAME);
  Result := FLanguageShortName;
end;

//------------------------------------------------------------------------------

class function TLocaleItem.GetLocaleDataW(ID: LCID; Flag: DWORD): string;
var
  Buffer: array[0..1023] of WideChar;
begin
  Buffer[0] := #0;
  GetLocaleInfoW(ID, Flag, Buffer, SizeOf(Buffer) div 2);
  Result := Buffer;
end;

//------------------------------------------------------------------------------

function TLocaleItem.GetPrimaryLanguage: Word;
begin
  Result := PRIMARYLANGID(FLocale);
end;

//------------------------------------------------------------------------------

function TLocaleItem.GetSubLanguage: Word;
begin
  Result := SUBLANGID(FLocale);
end;

//------------------------------------------------------------------------------

constructor TLocaleItem.Create(ALocale: LCID);
begin
  FLocale := ALocale;
  FCharSet := -1;
end;

//------------------------------------------------------------------------------

destructor TLocaleItem.Destroy;
begin
{$ifdef FEATURE_LOCALE_FLAGS}
  DestroyFlag;
{$endif FEATURE_LOCALE_FLAGS}
  inherited Destroy;
end;

//------------------------------------------------------------------------------

function TLocaleItem.GetAnsiCodePage: integer;
begin
  (*
  LOCALE_IDEFAULTANSICODEPAGE
  The ANSI code page used by a locale for applications that do not support
  Unicode. The maximum number of characters allowed for this string is six,
  including a terminating null character. If no ANSI code page is available,
  only Unicode can be used for the locale. In this case, the value is CP_ACP (0).
  *)
  Result := StrToInt(GetLocaleDataW(Locale, LOCALE_IDEFAULTANSICODEPAGE));
end;

//------------------------------------------------------------------------------

function TLocaleItem.GetCharSet: integer;
const
  TCI_SRCLOCALE = $1000;
var
  CharsetInfo: TCharsetInfo;
  ALocale: LCID;
begin
  if (FCharset = -1) then
  begin
    ALocale := Locale;
    Win32Check(TranslateCharsetInfo(ALocale, CharsetInfo, TCI_SRCLOCALE));
    FCharset := CharsetInfo.ciCharset;
  end;
  Result := FCharset;
end;

//------------------------------------------------------------------------------

function TLocaleItem.GetCountryCode: integer;
begin
  (*
  LOCALE_ICOUNTRY
  Country/region code, based on international phone codes, also referred to as
  IBM country/region codes. The maximum number of characters allowed for this
  string is six, including a terminating null character.
  *)
  Result := StrToInt(GetLocaleDataW(Locale, LOCALE_ICOUNTRY));
end;

//------------------------------------------------------------------------------

function TLocaleItem.GetCountryName: string;
begin
  (*
  LOCALE_SCOUNTRY
  Full localized name of the country/region. The maximum number of characters
  allowed for this string is 80, including a terminating null character. This
  name is based on the localization of the product. Thus it changes for each
  localized version.
  *)
  if (FCountryName = '') then
    FCountryName := GetLocaleDataW(Locale, LOCALE_SCOUNTRY);
  Result := FCountryName;
end;

//------------------------------------------------------------------------------

function TLocaleItem.GetDisplayName: string;
const
  LOCALE_SLANGDISPLAYNAME = $0000006f;
  LOCALE_SLOCALIZEDLANGUAGENAME = $0000006f;
begin
  if (FDisplayName = '') then
  begin
    if (CheckWin32Version(6)) then
      FDisplayName := GetLocaleDataW(Locale, LOCALE_SLANGDISPLAYNAME)
    else
      FDisplayName := LanguageName;
  end;
  Result := FDisplayName;
end;

//------------------------------------------------------------------------------

{$ifdef FEATURE_LOCALE_FLAGS}
function TLocaleItem.GetFlag: TBitmap;
var
  HResInfo: THandle;
  Name: string;
begin
  if (FFlag = nil) then
  begin
    Name := Format('flag_%s', [Lowercase(ISO3166Name)]);
    HResInfo := FindResource(HInstance, PChar(Name), RT_BITMAP);
    if (HResInfo <> 0) then
    begin
      FFlag := TBitmap.Create;
      FFlag.LoadFromResourceName(hInstance, Name);
    end;
  end;
  Result := FFlag;
end;

function TLocaleItem.ReleaseFlag: TBitmap;
begin
  Result := FFlag;
  FFlag := nil;
end;

procedure TLocaleItem.DestroyFlag;
begin
  FreeAndNIl(FFlag);
end;

{$endif FEATURE_LOCALE_FLAGS}

//------------------------------------------------------------------------------

function TLocaleItem.GetISO3166Name: string;
begin
  (*
  LOCALE_SISO3166CTRYNAME
  Country/region name, based on ISO Standard 3166, for example, "US" for the
  United States. The maximum number of characters allowed for this string is
  nine, including a terminating null character.
  *)
  if (FISO3166Name = '') then
    FISO3166Name := GetLocaleDataW(Locale, LOCALE_SISO3166CTRYNAME);
  Result := FISO3166Name;
end;

//------------------------------------------------------------------------------

function TLocaleItem.GetISO639_1Name: string;
begin
  (*
  LOCALE_SISO639LANGNAME
  The abbreviated name of the language based entirely on the ISO Standard 639
  values, in lowercase form, for example, "en" for English. The maximum number
  of characters allowed for this string is nine, including a terminating null
  character.
  *)
  Result := GetLocaleDataW(Locale, LOCALE_SISO639LANGNAME);
end;

//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//
//      MLang
//
//------------------------------------------------------------------------------
function DetectCodePage(Stream: TStream): integer;
var
  MultiLanguage: IMultiLanguage2;
  ComStream: IStream;
  EncodingInfo: tagDetectEncodingInfo;
  Count: integer;
  SavePos: Int64;
const
  MLDETECTCP_NONE = 0;
begin
  Result := 0;

  if (CoCreateInstance(CLSID_CMultiLanguage, nil, CLSCTX_INPROC_SERVER, IID_IMultiLanguage2, MultiLanguage) <> S_OK) then
    exit;

  SavePos := Stream.Position;
  try
    ComStream := TStreamAdapter.Create(Stream);
    try
      Count := 1;
      if (MultiLanguage.DetectCodepageInIStream(MLDETECTCP_NONE, 0, ComStream, EncodingInfo, Count) <> S_OK) then
        exit;

      Result := EncodingInfo.nCodePage;
    finally
      ComStream := nil;
    end;
  finally
    Stream.Position := SavePos;
  end;
end;

//------------------------------------------------------------------------------

function GetCodePageDescription(Codepage: integer): string;
var
  MultiLanguage: IMultiLanguage2;
begin
  Result := '';

  if (CoCreateInstance(CLSID_CMultiLanguage, nil, CLSCTX_INPROC_SERVER, IID_IMultiLanguage2, MultiLanguage) <> S_OK) then
    exit;

  SetLength(Result, 128);
  if (MultiLanguage.GetCodePageDescription(Codepage, GetUserDefaultLCID, PChar(Result), Length(Result)) <> S_OK) then
  begin
    Result := '';
    exit;
  end;

  Result := PChar(Result);
end;

//------------------------------------------------------------------------------

function TryLocaleToISO639_1Name(Locale: LCID; var Value: string): boolean;
var
  LocaleItem: TLocaleItem;
begin
  LocaleItem := TLocaleItems.FindLCID(Locale);

  if (LocaleItem <> nil) then
  begin
    Result := True;
    Value := LocaleItem.ISO639_1Name;
  end else
  begin
    Result := False;
    Value := '';
  end;
end;
//------------------------------------------------------------------------------

function LocaleToISO639_1Name(Locale: LCID; const Default: string = ''): string;
begin
  if (not TryLocaleToISO639_1Name(Locale, Result)) then
    Result := Default;
end;

//------------------------------------------------------------------------------

function TryISO639_1NameToLocale(const Name: string; var Value: TLCID): boolean;
var
  LocaleItem: TLocaleItem;
begin
  LocaleItem := TLocaleItems.FindISO639_1Name(Name);

  if (LocaleItem <> nil) then
  begin
    Result := True;
    Value := LocaleItem.Locale;
  end else
  begin
    Result := False;
    Value := 0;
  end;
end;

//------------------------------------------------------------------------------

function ISO639_1NameToLocale(const Name: string; Default: TLCID = 0): TLCID;
begin
  if (not TryISO639_1NameToLocale(Name, Result)) then
    Result := Default;
end;

//------------------------------------------------------------------------------

initialization
  ClearLocale;
finalization
  TLocaleItems.FLocaleItems.Free;
end.
