unit amURLUtils;

(*
 * Copyright © 2019 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

// -----------------------------------------------------------------------------
//
//              URL utilities
//
// -----------------------------------------------------------------------------
function URLDecode(const url: string): string;
function URLEncode(const url: string; CompleteURL: boolean = True): string;
function URLExtractHost(const URL: string): string;
function URLExtractPath(const URL: string): string;
function URLExtractFilename(const URL: string): string;
function URLExtractFileExt(const URL: string): string;
function URLExtractURL(const URL: string): string;
function URLExcludeTrailingDelimiter(const S: string): string;
function URLIncludeTrailingDelimiter(const S: string): string;
function URLGetParentFolder(const S: string): string;
function IsURLEncoded(const url: string): boolean;

// -----------------------------------------------------------------------------
//
//              IPv6
//
// -----------------------------------------------------------------------------
function IsUrlIPv6(const URL: string): boolean;
function IsHostIPv6(const Host: string): boolean;
function IPv6EncodeURL(const URL: string; Auto: boolean = True): string;

// -----------------------------------------------------------------------------
//
//              WebDav utilities
//
// -----------------------------------------------------------------------------
function DavURLtoUNC(const URL: string): string;
function DavUNCtoURL(const UNC: string): string;


implementation

uses
  SysUtils,
  RTLConsts,
  Windows,

  IdURI,
  IdWinsock2,
  IdWship6,
  IdGlobal;

// -----------------------------------------------------------------------------
//
//              URL utilities
//
// -----------------------------------------------------------------------------
function URLDecode(const url: string): string;
var
  sUTF8: UTF8String;
  c: AnsiChar;
begin
  // Do not use TIdURI.URLDecode directly as it can't handle a mix of UTF8 and ANSI chars (e.g. æøåÆØÅ)
  sUTF8 := URL;
  Result := '';
  for c in sUTF8 do
    if (Ord(c) > 127) then
      Result := Result + '%' + IntToHex(Ord(c), 2)
    else
      Result := Result + c;
  Result := TIdURI.URLDecode(Result);
end;

// -----------------------------------------------------------------------------

function IsURLEncoded(const url: string): boolean;
var
  i: integer;
  s: string;
  Escaped: boolean;
  n: integer;
const
  ValidChars: set of char =
    // Unreserved chars
    ['A'..'Z', 'a'..'z', '0'..'9', '-', '_', '.', '~',
     // Reserved chars (% is special)
     '!', '#', '$', '%', '&', '''', '(', ')', '*', '+', ',', '/', ':', ';', '=', '?', '@', '[', ']',
     // Exceptions (due to broken encoders (yes, I'm talking to you Excel and SharePoint))
     ' '];
begin
  Result := False;
  Escaped := False;
  i := 1;
  while (i <= Length(url)) do
  begin
    if (not(url[i] in ValidChars)) then
      Exit(False);
    if (url[i] = '%') then
    begin
      if (Escaped) then
        Exit(False);
      Escaped := True;
      inc(i);
    end else
    if (Escaped) then
    begin
      Escaped := False;

      if (url[i] = 'u') or (url[i] = 'U') then
      begin
        // Note: This is non-standard
        inc(i);
        s := '$'+Copy(url, i, 4);
        if (TryStrToInt(s, n)) then
        begin
          Result := True;
          inc(i, 4);
        end else
          Exit(False);
      end else
      begin
        s := '$'+Copy(url, i, 2);
        if (TryStrToInt(s, n)) then
        begin
          Result := True;
          inc(i, 2);
        end else
          Exit(False);
      end;
    end else
      inc(i);
  end;
end;
// -----------------------------------------------------------------------------

function URLEncode(const url: string; CompleteURL: boolean): string;
begin
  // Decode the filename before we encode it. This replaces stuff such as %20.
  Result := URLDecode(URL);

  if (CompleteURL) then
    Result := TIdURI.URLEncode(Result)
  else
  Result := TIdURI.PathEncode(Result);
end;

// -----------------------------------------------------------------------------
// Adapted from HTTPApp.HTMLDecode
// Modified to return an UTF8 string
function HTMLDecode(const AStr: AnsiString): UTF8String;
var
  Sp, Cp, Tp: PAnsiChar;
  Rp: PAnsiChar;
  S: AnsiString;
  I, Code: Integer;
begin
  SetLength(Result, Length(AStr));
  Sp := PAnsiChar(AStr);
  Rp := PAnsiChar(Result);
  Cp := Sp;
  try
    while Sp^ <> #0 do
    begin
      case Sp^ of
        '&': begin
               Cp := Sp;
               Inc(Sp);
               case Sp^ of
                 'a': if AnsiStrPos(Sp, 'amp;') = Sp then  { do not localize }
                      begin
                        Inc(Sp, 3);
                        Rp^ := '&';
                      end;
                 'l',
                 'g': if (AnsiStrPos(Sp, 'lt;') = Sp) or (AnsiStrPos(Sp, 'gt;') = Sp) then { do not localize }
                      begin
                        Cp := Sp;
                        Inc(Sp, 2);
                        while (Sp^ <> ';') and (Sp^ <> #0) do
                          Inc(Sp);
                        if Cp^ = 'l' then
                          Rp^ := '<'
                        else
                          Rp^ := '>';
                      end;
                 'q': if AnsiStrPos(Sp, 'quot;') = Sp then  { do not localize }
                      begin
                        Inc(Sp,4);
                        Rp^ := '"';
                      end;
                 '#': begin
                        Tp := Sp;
                        Inc(Tp);
                        while (Sp^ <> ';') and (Sp^ <> #0) do
                          Inc(Sp);
                        SetString(S, Tp, Sp - Tp);
                        Val(S, I, Code);
                        Rp^ := AnsiChar(I);
                      end;
                 else
                   raise EConvertError.CreateFmt(sInvalidHTMLEncodedChar, [Cp^ + Sp^, Cp - PAnsiChar(AStr)])
               end;
           end
      else
        Rp^ := AnsiChar(Sp^);
      end;
      Inc(Rp);
      Inc(Sp);
    end;
  except
    on E:EConvertError do
      raise EConvertError.CreateFmt(sInvalidHTMLEncodedChar, [Cp^ + Sp^, Cp - PAnsiChar(AStr)])
  end;
  SetLength(Result, Rp - PAnsiChar(Result));
end;

// -----------------------------------------------------------------------------

function URLExcludeTrailingDelimiter(const S: string): string;
begin
  Result := S;
  if (Copy(Result, Length(Result), 1) = '/') then
    SetLength(Result, Length(Result)-1);
end;

// -----------------------------------------------------------------------------

function URLIncludeTrailingDelimiter(const S: string): string;
begin
  Result := S;
  if (Copy(Result, Length(Result), 1) <> '/') then
    Result := Result + '/';
end;

// -----------------------------------------------------------------------------

function URLGetParentFolder(const S: string): string;
var
  i: integer;
begin
  i := LastDelimiter('/', URLExcludeTrailingDelimiter(S));
  if (i <> 0) then
    Result := Copy(S, 1, i)
  else
    Result := '/';
end;

// -----------------------------------------------------------------------------

function URLExtractHost(const URL: string): string;
var
  URI: TIdURI;
begin
  URI := TIdURI.Create(URLDecode(URL));
  try
    Result := URI.Host;
  finally
    URI.Free;
  end;
end;

// -----------------------------------------------------------------------------

function URLExtractPath(const URL: string): string;
var
  URI: TIdURI;
begin
  URI := TIdURI.Create(URLDecode(URL));
  try
    Result := URI.Protocol + '://' + URI.Host + URI.Path;
  finally
    URI.Free;
  end;
end;

// -----------------------------------------------------------------------------

function URLExtractFilename(const URL: string): string;
var
  URI: TIdURI;
begin
  URI := TIdURI.Create(URLDecode(URL));
  try
    Result := URI.Document;
  finally
    URI.Free;
  end;
end;

// -----------------------------------------------------------------------------

function URLExtractURL(const URL: string): string;
var
  URI: TIdURI;
begin
  URI := TIdURI.Create(URLDecode(URL));
  try
    Result := URI.Protocol + '://' + URI.Host + URI.Path + URI.Document;
  finally
    URI.Free;
  end;
end;

// -----------------------------------------------------------------------------

function URLExtractFileExt(const URL: string): string;
var
  URI: TIdURI;
begin
  URI := TIdURI.Create(URLDecode(URL));
  try
    Result := ExtractFileExt(URI.Document);
  finally
    URI.Free;
  end;
end;


// -----------------------------------------------------------------------------
//
//              IPv6 support
//
// -----------------------------------------------------------------------------
function IsHostIPv6(const Host: string): boolean;
var
  Hints     : TAddrInfoW;
  AddrInfo  : PAddrInfoW;
  NextInfo  : PAddrInfoW;
  RetVal    : integer;
begin
  Result := False;

  FillChar(Hints, SizeOf(Hints), 0);
  Hints.ai_family := AF_UNSPEC;

  AddrInfo := nil;
  RetVal := GetAddrInfo(PChar(Host), nil, @Hints, @AddrInfo);
  if (RetVal <> 0) then
    exit;

  try
    NextInfo := AddrInfo;
    while (NextInfo <> nil) do
    begin
      if (NextInfo.ai_family = AF_INET) then
      begin
        Result := False;
        break;
      end else
      if (NextInfo.ai_family = AF_INET6) then
        Result := True;

      NextInfo := NextInfo.ai_next;
    end;
  finally
    FreeAddrInfo(AddrInfo);
  end;
end;

function IsUrlIPv6(const URL: string): boolean;
var
  URI: TIdURI;
begin
  URI := TIdURI.Create(URL);
  try
    if (URI.IPVersion = Id_IPv6) then
      Result := True
    else
      Result := IsHostIPv6(URI.Host);
  finally
    URI.Free;
  end;
end;

function IPv6EncodeURL(const URL: string; Auto: boolean): string;
var
  URI: TIdURI;
begin
  URI := TIdURI.Create(URL);
  try

    if (URI.IPVersion <> Id_IPv6) and ((not Auto) or (IsHostIPv6(URI.Host))) then
    begin
      URI.IPVersion := Id_IPv6;
      Result := URI.URI;
    end else
      Result := URL;

  finally
    URI.Free;
  end;
end;

// -----------------------------------------------------------------------------
//
//              WebDav utilities
//
// -----------------------------------------------------------------------------
function DavURLtoUNC(const URL: string): string;
var
  NetapiHandle: HModule;
  DavGetUNCFromHTTPPath: function(URL, UNC: PWideChar; var Size: DWORD): DWORD; stdcall;
  Size: DWORD;
begin
  Result := URL;

  NetapiHandle := LoadLibrary('netapi32.dll');
  if (NetapiHandle < 32) then
    exit;
  try
    DavGetUNCFromHTTPPath := GetProcAddress(NetapiHandle, 'DavGetUNCFromHTTPPath');
    if (not Assigned(DavGetUNCFromHTTPPath)) then
      exit;

    SetLength(Result, MAX_PATH);
    Size := MAX_PATH;
    if (DavGetUNCFromHTTPPath(PChar(URL), PChar(Result), Size) <> ERROR_SUCCESS) then
      exit;
  finally
    FreeLibrary(NetapiHandle);
  end;

  SetLength(Result, Size - 1);
end;

// -----------------------------------------------------------------------------

function DavUNCtoURL(const UNC: string): string;
var
  NetapiHandle: HModule;
  DavGetHTTPFromUNCPath: function(UNC, URL: PWideChar; var Size: DWORD): DWORD; stdcall;
  Size: DWORD;
begin
  Result := UNC;

  NetapiHandle := LoadLibrary('netapi32.dll');
  if (NetapiHandle < 32) then
    exit;
  try
    DavGetHTTPFromUNCPath := GetProcAddress(NetapiHandle, 'DavGetHTTPFromUNCPath');
    if (not Assigned(DavGetHTTPFromUNCPath)) then
      exit;

    SetLength(Result, MAX_PATH);
    Size := MAX_PATH;
    if (DavGetHTTPFromUNCPath(PChar(UNC), PChar(Result), Size) <> ERROR_SUCCESS) then
      exit;
  finally
    FreeLibrary(NetapiHandle);
  end;

  SetLength(Result, Size - 1);
end;

end.

