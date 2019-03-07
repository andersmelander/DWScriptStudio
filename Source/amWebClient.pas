unit amWebClient;

(*
 * Copyright © 2015 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

(*******************************************************************************

Usage examples (pseudo code):

  var Request: IWebRequest = WebClient.Connect('google.com');

  if (Request.Post('/my/message', 'hello world').Success) then
    ShowMessage('It worked!');

  var Response: IWebResponse = Request.Get('/my/resource);
  if (Response.Success) then
    ShowMessage(Response.Content);

-------------------------------------------------------------------------------

  ShowMessage(WebClient.Get('http://google.com/my/resource));
  ShowMessage(WebClient.Post('https://my/message', 'hello world'));
  var Response: IWebResponse = WebClient.Execute('PUT', 'https://my/something', 'whopper!');

*******************************************************************************)

// -----------------------------------------------------------------------------
//
// Web Client abstract base classes
//
// -----------------------------------------------------------------------------

uses
  Generics.Collections,
  Classes,
  Windows,
  SysUtils;

// -----------------------------------------------------------------------------
//
// EWebClient
//
// -----------------------------------------------------------------------------
// Encapsulates a WinInet error
// -----------------------------------------------------------------------------
type
  EWebClient = class(Exception)
  protected
    FLastError: integer;
  public
    constructor Create(ALastError: integer); overload;
    constructor Create; overload;
  end;

// -----------------------------------------------------------------------------
//
// TWebCredentials
//
// -----------------------------------------------------------------------------
type
  TWebAuthentication = (waNone, waFailed, waBasic, waDigest, waNegotiate, waKerberos, waAuthenticate);

  TWebCredential = class
  public
    Username: string;
    Password: string;
    Domain: string;
  end;

  TWebCredentialItem = class(TWebCredential)
  public
    Scheme: TWebAuthentication;
    URI: string;
  end;

  TWebCredentials = class
  private
    FCredentials: TObjectList<TWebCredentialItem>;
  protected
    function MatchURI(const StoredURI, RequestedURI: string): boolean;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(const URI: string; Scheme: TWebAuthentication; const UserName, Password: string; const Domain: string = ''); overload;
    procedure Add(const URI: string; Scheme: TWebAuthentication; Credential: TWebCredential); overload;
    procedure Remove(const URI: string; Exact: boolean = False); overload;
    procedure Remove(const URI: string; Scheme: TWebAuthentication; Exact: boolean = False); overload;
    procedure Clear;
    procedure Assign(Source: TWebCredentials);

    function Find(const URI: string; Scheme: TWebAuthentication): TWebCredential; overload;
    function Find(const URI: string): TWebCredential; overload;
  end;

// -----------------------------------------------------------------------------
//
// TWebResponse
//
// -----------------------------------------------------------------------------
type
  IWebResponse = interface
    function GetHeaders: TStrings;
    function GetContentType: string;
    function GetContent: RawByteString;//AnsiString;
    function GetContentAsText: string;
    function GetContentStream: TStream;
    function GetStatusCode: integer;
    function GetStatusDescription: string;
    function GetSuccess: boolean;
    function GetContentLength: integer;
    function GetCurrentContentSize: integer;
    function GetErrorMessage: string;
    function GetCompleted: boolean;
    function GetAborted: boolean;
    function GetFailed: boolean;

    property Headers: TStrings read GetHeaders;
    property ContentType: string read GetContentType;
    property Content: RawByteString read GetContent;
    property ContentLength: integer read GetContentLength;
    property CurrentContentSize: integer read GetCurrentContentSize;
    property ContentAsText: string read GetContentAsText;
    property ContentStream: TStream read GetContentStream;
    property StatusCode: integer read GetStatusCode;
    property StatusDescription: string read GetStatusDescription;
    property ErrorMessage: string read GetErrorMessage;
    property Success: boolean read GetSuccess;

    property Failed: boolean read GetFailed;
    property Aborted: boolean read GetAborted;
    property Completed: boolean read GetCompleted;

    procedure SaveToStream(Stream: TStream);
    procedure Abort;
    function Wait: IWebResponse;
  end;

// -----------------------------------------------------------------------------
//
// IWebRequest
//
// -----------------------------------------------------------------------------
type
  IWebRequest = interface
    ['{A3E99CA4-736D-4D5F-B0EB-6C2327F28CC0}']
    function GetCredentials: TWebCredentials;
    property Credentials: TWebCredentials read GetCredentials;

    function GetContent: RawByteString;
    function GetHeaders: TStrings;
    procedure SetContent(const Value: RawByteString);

    property Headers: TStrings read GetHeaders;
    property Content: RawByteString read GetContent write SetContent;

    function Execute(const Method: string; const URI: string; Asynchronous: boolean = True): IWebResponse;

    function Get(const URI: string): IWebResponse; overload;
    function Get(const URI: string; const Content: RawByteString): IWebResponse; overload;
    function Get(const URI: string; ResponseStream: TStream): IWebResponse; overload;

    function Post(const URI: string): IWebResponse; overload;
    function Post(const URI: string; const Content: RawByteString): IWebResponse; overload;
    function Post(const URI: string; ContentStream: TStream): IWebResponse; overload;

    function Put(const URI: string): IWebResponse; overload;
    function Put(const URI: string; const Content: RawByteString): IWebResponse; overload;
    function Put(const URI: string; ContentStream: TStream): IWebResponse; overload;

    function Delete(const URI: string): IWebResponse;

    function Head(const URI: string): IWebResponse;

    procedure LoadFromStream(Stream: TStream);
  end;

// -----------------------------------------------------------------------------
//
// TCustomWebClient
//
// -----------------------------------------------------------------------------
type
  TCustomWebClient = class abstract
  private
    FConnectionTimeOut, FSendTimeout, FReceiveTimeout: DWORD;
    FProxyName: string;
    FProxyByPass: string;
    FCredentials: TWebCredentials;
    FIgnoreSSLCertificateErrors: boolean;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    function Connect(const URI: string): IWebRequest; overload; virtual;
    function Connect(const HostName: string; Https: boolean; Port: integer = -1): IWebRequest; overload; virtual; abstract;

    property ConnectionTimeOut: DWORD read FConnectionTimeOut write FConnectionTimeOut;
    property SendTimeout: DWORD read FSendTimeout write FSendTimeout;
    property ReceiveTimeout: DWORD read FReceiveTimeout write FReceiveTimeout;

    property ProxyName: string read FProxyName write FProxyName;
    property ProxyByPass: string read FProxyByPass write FProxyByPass;

    property Credentials: TWebCredentials read FCredentials;

    property IgnoreSSLCertificateErrors: boolean read FIgnoreSSLCertificateErrors write FIgnoreSSLCertificateErrors;

    // Shortcuts
    function Get(const URI: string; const Header: string = ''): IWebResponse; virtual;
    function Post(const URI: string; const Content: RawByteString; const ContentType: string = ''; const Header: string = ''): IWebResponse; virtual;
    function Put(const URI: string; const Content: RawByteString; const ContentType: string = ''; const Header: string = ''): IWebResponse; virtual;
    function Delete(const URI: string; const Header: string = ''): IWebResponse; virtual;
  end;

  TWebClientClass = class of TCustomWebClient;

// -----------------------------------------------------------------------------
//
// TCustomWebRequest
//
// -----------------------------------------------------------------------------
// Implements IWebRequest
// -----------------------------------------------------------------------------
type
  TCustomWebRequest = class abstract(TInterfacedObject, IWebRequest)
  private
  protected
    // IWebRequest
    function GetCredentials: TWebCredentials; virtual; abstract;
    property Credentials: TWebCredentials read GetCredentials;

    function GetContent: RawByteString; virtual; abstract;
    function GetHeaders: TStrings; virtual; abstract;
    procedure SetContent(const Value: RawByteString); virtual; abstract;

    function Execute(const Method: string; const URI: string; Asynchronous: boolean = False): IWebResponse; virtual; abstract;

    function Get(const URI: string): IWebResponse; overload;
    function Get(const URI: string; const Content: RawByteString): IWebResponse; overload;
    function Get(const URI: string; ResponseStream: TStream): IWebResponse; overload;

    function Post(const URI: string): IWebResponse; overload;
    function Post(const URI: string; const Content: RawByteString): IWebResponse; overload;
    function Post(const URI: string; ContentStream: TStream): IWebResponse; overload;

    function Put(const URI: string): IWebResponse; overload;
    function Put(const URI: string; const Content: RawByteString): IWebResponse; overload;
    function Put(const URI: string; ContentStream: TStream): IWebResponse; overload;

    function Delete(const URI: string): IWebResponse;

    function Head(const URI: string): IWebResponse;

    procedure LoadFromStream(Stream: TStream);
  public
  end;

// -----------------------------------------------------------------------------
//
// TCustomWebResponse
//
// -----------------------------------------------------------------------------
// Implements IWebResponse
// -----------------------------------------------------------------------------
type
  TCustomWebResponse = class abstract(TInterfacedObject, IWebResponse)
  private
    FContentStream: TStream;
  protected
    function GetHeaders: TStrings; virtual; abstract;
    function GetContentType: string;
    function GetContent: RawByteString; virtual; abstract;
    function GetContentAsText: string;
    function GetContentStream: TStream;
    function GetStatusCode: integer; virtual; abstract;
    function GetStatusDescription: string;
    function GetSuccess: boolean;
    function GetContentLength: integer; virtual; abstract;
    function GetCurrentContentSize: integer; virtual; abstract;
    function GetErrorMessage: string; virtual; abstract;
    function GetMethod: string; virtual; abstract;
    function GetURL: string; virtual; abstract;
    function GetCompleted: boolean; virtual;
    function GetAborted: boolean; virtual; abstract;
    function GetFailed: boolean; virtual; abstract;
  public
    destructor Destroy; override;

    procedure Execute; virtual; abstract;

    procedure SaveToStream(Stream: TStream);
    procedure Abort; virtual; abstract;
    function Wait: IWebResponse; virtual;

    property Method: string read GetMethod;
    property URL: string read GetURL;

    property Headers: TStrings read GetHeaders;
    property ContentType: string read GetContentType;
    property Content: RawByteString read GetContent;
    property ContentLength: integer read GetContentLength;
    property CurrentContentSize: integer read GetCurrentContentSize;
    property ContentAsText: string read GetContentAsText;
    property ContentStream: TStream read GetContentStream;
    property StatusCode: integer read GetStatusCode;
    property StatusDescription: string read GetStatusDescription;
    property ErrorMessage: string read GetErrorMessage;
    property Success: boolean read GetSuccess;
    property Failed: boolean read GetFailed;
    property Aborted: boolean read GetAborted;
    property Completed: boolean read GetCompleted;
  end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
procedure DecodeHeader(const AHeader: RawByteString; Strings: TStrings);
procedure EncodeHeader(var AHeader: RawByteString; Strings: TStrings);
procedure FixedRawByteStringToScriptString(const s : RawByteString; var result : UnicodeString); overload;


function WebClient: TCustomWebClient;

var
  WebClientClass: TWebClientClass = nil;

(*******************************************************************************

Usage examples (pseudo code):

  var Request: IWebRequest = WebClient.Connect('google.com');

  if (Request.Post('/my/message', 'hello world').Success) then
    ShowMessage('It worked!');

  var Response: IWebResponse = Request.Get('/my/resource);
  if (Response.Success) then
    ShowMessage(Response.Content);

-------------------------------------------------------------------------------

  ShowMessage(WebClient.Get('http://google.com/my/resource));
  ShowMessage(WebClient.Post('https://my/message', 'hello world'));
  var Response: IWebResponse = WebClient.Execute('PUT', 'https://my/something', 'whopper!');

*******************************************************************************)

const
  sHttpHeaderContentType = 'Content-Type';
var
  sWebClientUserAgent: AnsiString = '';

const
  DEFAULT_PORT: array[boolean] of integer = (80, 443);

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

implementation

uses
  StrUtils,
  WinInet,
  idURI,
  SynCommons,
  SynCrtSock; // StatusCodeToReason, HTTP_DEFAULT_*

var
  FWebClient: TCustomWebClient = nil;

function WebClient: TCustomWebClient;
begin
  if (FWebClient = nil) then
    FWebClient := WebClientClass.Create;
  Result := FWebClient;
end;

// -----------------------------------------------------------------------------
//
// EWebClient
//
// -----------------------------------------------------------------------------
constructor EWebClient.Create(ALastError: integer);

  function SysErrorMessagePerModule(Code: DWORD; ModuleName: PChar): string;
  const
    ENGLISH_LANGID = $0409;
    // see http://msdn.microsoft.com/en-us/library/windows/desktop/aa383770
    ERROR_WINHTTP_CANNOT_CONNECT = 12029;
    ERROR_WINHTTP_TIMEOUT = 12002;
    ERROR_WINHTTP_INVALID_SERVER_RESPONSE = 12152;
  var
    tmpLen: DWORD;
    err: PChar;
  begin
    if (Code = NO_ERROR) then
    begin
      result := '';
      exit;
    end;

    tmpLen := FormatMessage(
      FORMAT_MESSAGE_FROM_HMODULE or FORMAT_MESSAGE_ALLOCATE_BUFFER,
      pointer(GetModuleHandle(ModuleName)), Code, ENGLISH_LANGID, @err, 0, nil);
    try
      while (tmpLen>0) and (ord(err[tmpLen-1]) in [0..32,ord('.')]) do
        dec(tmpLen);
      SetString(result,err,tmpLen);
    finally
      LocalFree(HLOCAL(err));
    end;

    if result='' then
    begin
      result := SysErrorMessage(Code);
      if result='' then
      begin
        if (Code = ERROR_WINHTTP_CANNOT_CONNECT) then
          result := 'cannot connect'
        else
        if (Code = ERROR_WINHTTP_TIMEOUT) then
          result := 'timeout'
        else
        if (Code = ERROR_WINHTTP_INVALID_SERVER_RESPONSE) then
          result := 'invalid server response'
        else
          result := IntToHex(Code,8);
      end;
    end;
  end;

var
  dwError, tmpLen: DWORD;
  msg, tmp: string;
begin
  // see http://msdn.microsoft.com/en-us/library/windows/desktop/aa383884
  FLastError := ALastError;

  Msg := SysErrorMessagePerModule(FLastError, 'wininet.dll');

  if (FLastError = ERROR_INTERNET_EXTENDED_ERROR) then
  begin
    InternetGetLastResponseInfo(dwError, nil, tmpLen);
    if (tmpLen > 0) then
    begin
      SetLength(tmp, tmpLen);
      InternetGetLastResponseInfo(dwError, PChar(tmp), tmpLen);
      Msg := Msg + ' [' + tmp + ']';
    end;
  end;

  inherited CreateFmt('%s (%d)', [msg, FLastError]);
end;

constructor EWebClient.Create;
begin
  Create(GetLastError);
end;

// -----------------------------------------------------------------------------
//
// Fix for dwsUtils BytesToScriptString causing Range Check Error with looooooong strings
//
// -----------------------------------------------------------------------------
procedure FixedBytesToScriptString(const p: PByte; n: Integer; var result: UnicodeString); overload;
var
  i : Integer;
  pSrc : PByte;
  pDest : PWord;
begin
  SetLength(result, n);
  pSrc := PByte(p);
  pDest := PWord(Pointer(result));
  for i:=0 to n-1 do
  begin
    pDest^ := Word(pSrc^);
    Inc(pDest);
    Inc(pSrc);
  end;
end;

procedure FixedRawByteStringToScriptString(const s : RawByteString; var result : UnicodeString); overload;
begin
  if s='' then
  begin
    result:='';
    exit;
  end;
  FixedBytesToScriptString(Pointer(s), Length(s), result)
end;

function FixedRawByteStringToScriptString(const s : RawByteString) : UnicodeString; overload;
begin
   FixedRawByteStringToScriptString(s, Result);
end;

// -----------------------------------------------------------------------------
//
// Blah
//
// -----------------------------------------------------------------------------
procedure DecodeHeader(const AHeader: RawByteString; Strings: TStrings);
type
  RawUTF8 = type AnsiString(CP_UTF8); // Codepage for an UTF8 string
var
  Header: string;
  Eol, PrevEol: integer;
  n: integer;
  Line: string;
  Name, Value: string;
begin
  Header := RawUTF8(AHeader);

  PrevEol := 1;
  while (True) do
  begin
    Eol := PosEx(#13#10, Header, PrevEol);
    if (Eol = 0) then
      break;

    Line := Trim(Copy(Header, PrevEol, Eol-PrevEol));
    if (Line = '') then
      break;

    PrevEol := Eol+2;

    n := Pos(':', Line);
    if (n = 0) then
      continue;

    Name := Copy(Line, 1, n-1);
    if (Name = '') then
      continue;
    Value := Trim(Copy(Line, n+1, MaxInt));
    if (Value = '') then
      continue;

    Line := Strings.Values[Name];
    if (Line <> '') then
      Value := Line + ',' + Value;
    Strings.Values[Name] := Value;
  end;
end;

procedure EncodeHeader(var AHeader: RawByteString; Strings: TStrings);
var
  Header: string;
begin
  if (Strings.Count = 0) then
  begin
    AHeader := '';
    exit;
  end;
  Header := Strings.Text;
  AHeader := Header;
end;

// -----------------------------------------------------------------------------
//
// TCustomWebRequest
//
// -----------------------------------------------------------------------------
procedure TCustomWebRequest.LoadFromStream(Stream: TStream);
var
  Buffer: RawByteString;
begin
  SetLength(Buffer, Stream.Size - Stream.Position);

  if (Length(Buffer) > 0) then
    Stream.Read(pointer(Buffer)^, Length(Buffer));

  SetContent(Buffer);
end;

// -----------------------------------------------------------------------------

function TCustomWebRequest.Delete(const URI: string): IWebResponse;
begin
  Result := Execute('DELETE', URI);
end;

// -----------------------------------------------------------------------------

function TCustomWebRequest.Get(const URI: string): IWebResponse;
begin
  Result := Execute('GET', URI);
end;

function TCustomWebRequest.Get(const URI: string; const Content: RawByteString): IWebResponse;
begin
  SetContent(Content);
  Result := Get(URI);
end;

function TCustomWebRequest.Get(const URI: string; ResponseStream: TStream): IWebResponse;
begin
  Result := Get(URI);

  if (Result.Success) then
    ResponseStream.CopyFrom(Result.ContentStream, 0);
end;

// -----------------------------------------------------------------------------

function TCustomWebRequest.Head(const URI: string): IWebResponse;
begin
  Result := Execute('HEAD', URI);
end;

// -----------------------------------------------------------------------------

function TCustomWebRequest.Post(const URI: string): IWebResponse;
begin
  Result := Execute('POST', URI);
end;

function TCustomWebRequest.Post(const URI: string; const Content: RawByteString): IWebResponse;
begin
  SetContent(Content);
  Result := Post(URI);
end;

function TCustomWebRequest.Post(const URI: string; ContentStream: TStream): IWebResponse;
begin
  LoadFromStream(ContentStream);
  Result := Post(URI);
end;

// -----------------------------------------------------------------------------

function TCustomWebRequest.Put(const URI: string): IWebResponse;
begin
  Result := Execute('PUT', URI);
end;

function TCustomWebRequest.Put(const URI: string; const Content: RawByteString): IWebResponse;
begin
  SetContent(Content);
  Result := Put(URI);
end;

function TCustomWebRequest.Put(const URI: string; ContentStream: TStream): IWebResponse;
begin
  LoadFromStream(ContentStream);
  Result := Put(URI);
end;


// -----------------------------------------------------------------------------
//
// TCustomWebResponse
//
// -----------------------------------------------------------------------------
destructor TCustomWebResponse.Destroy;
begin
  Abort;
  FContentStream.Free;

  inherited;
end;

// -----------------------------------------------------------------------------

function TCustomWebResponse.GetCompleted: boolean;
begin
  Result := True;
end;

// -----------------------------------------------------------------------------

function TCustomWebResponse.GetContentAsText: string;
var
  ContentType: string;
begin
  ContentType := GetContentType; // Performs wait
  if (AnsiSameText(RightStr(ContentType, Length('charset=utf-8')), 'charset=utf-8')) then
    Result := UTF8DecodeToUnicodeString(Content)
  else
    Result := FixedRawByteStringToScriptString(Content);
end;

// -----------------------------------------------------------------------------

function TCustomWebResponse.GetContentStream: TStream;
begin
  if (FContentStream = nil) then
  begin
    FContentStream := TMemoryStream.Create;
    try
      SaveToStream(FContentStream);
      FContentStream.Position := 0;
    except
      FContentStream.Free;
      FContentStream := nil;
      raise;
    end;
  end;
  Result := FContentStream;
end;

// -----------------------------------------------------------------------------

function TCustomWebResponse.GetContentType: string;
begin
  Result := Headers.Values[sHttpHeaderContentType];
end;

// -----------------------------------------------------------------------------

function TCustomWebResponse.GetStatusDescription: string;
begin
  Result := StatusCodeToReason(StatusCode);
end;

// -----------------------------------------------------------------------------

function TCustomWebResponse.GetSuccess: boolean;
begin
  Result := (not Failed) and (not Aborted) and (StatusCode div 100 = 2);
end;

// -----------------------------------------------------------------------------

procedure TCustomWebResponse.SaveToStream(Stream: TStream);
var
  Content: RawByteString;
begin
  if (Success) then
  begin
    Content := GetContent;
    Stream.Write(pointer(Content)^, Length(Content));
  end;
end;

// -----------------------------------------------------------------------------

function TCustomWebResponse.Wait: IWebResponse;
begin
  if (Completed) then
    Result := Self
  else
    Result := nil;
end;


// -----------------------------------------------------------------------------
//
// TWebCredentials
//
// -----------------------------------------------------------------------------
constructor TWebCredentials.Create;
begin
  inherited Create;
  FCredentials := Generics.Collections.TObjectList<TWebCredentialItem>.Create;
end;

destructor TWebCredentials.Destroy;
begin
  FCredentials.Free;
  inherited;
end;

// -----------------------------------------------------------------------------

function TWebCredentials.Find(const URI: string): TWebCredential;
var
  i: integer;
  BestLength: integer;
  s: string;
begin
  Result := nil;
  BestLength := -1;
  for i := 0 to FCredentials.Count-1 do
  begin
    s := FCredentials[i].URI;
    if (Length(s) <= BestLength) then
      continue;
    if (MatchURI(s, URI)) then
    begin
      Result := FCredentials[i];
      BestLength := Length(s);
    end;
  end;
end;

function TWebCredentials.Find(const URI: string; Scheme: TWebAuthentication): TWebCredential;
var
  i: integer;
  BestLength: integer;
  s: string;
begin
  Result := nil;
  BestLength := -1;
  for i := 0 to FCredentials.Count-1 do
    if (FCredentials[i].Scheme = Scheme) then
    begin
      s := FCredentials[i].URI;
      if (Length(s) <= BestLength) then
        continue;
      if (MatchURI(s, URI)) then
      begin
        Result := FCredentials[i];
        BestLength := Length(s);
      end;
    end;
end;

// -----------------------------------------------------------------------------

function TWebCredentials.MatchURI(const StoredURI, RequestedURI: string): boolean;
begin
  Result := (AnsiSameText(StoredURI, Copy(RequestedURI, 1, Length(StoredURI))));
end;

// -----------------------------------------------------------------------------

procedure TWebCredentials.Add(const URI: string; Scheme: TWebAuthentication; const UserName, Password, Domain: string);
var
  Credential: TWebCredentialItem;
  UriBuilder: TIdURI;
begin
  Credential := TWebCredentialItem.Create;
  Credential.Scheme := Scheme;
  UriBuilder := TIdURI.Create(URI);
  try
    if (UriBuilder.Protocol = '') then
      UriBuilder.Protocol := 'http';

    if (UriBuilder.Port = '') then
    begin
      if (UriBuilder.Protocol = 'http') then
        UriBuilder.Port := '80'
      else
      if (UriBuilder.Protocol = 'https') then
        UriBuilder.Port := '443';
    end;

    UriBuilder.Host := AnsiLowerCase(UriBuilder.Host);

    Credential.URI := UriBuilder.URI;
  finally
    UriBuilder.Free;
  end;
  Credential.Username := UserName;
  Credential.Password := Password;
  Credential.Domain := Domain;
  FCredentials.Add(Credential);
end;

procedure TWebCredentials.Add(const URI: string; Scheme: TWebAuthentication; Credential: TWebCredential);
begin
  Add(URI, Scheme, Credential.Username, Credential.Password, Credential.Domain);
end;

// -----------------------------------------------------------------------------

procedure TWebCredentials.Assign(Source: TWebCredentials);
var
  Item: TWebCredentialItem;
begin
  Clear;
  for Item in Source.FCredentials do
    Add(Item.URI, Item.Scheme, Item.Username, Item.Password, Item.Domain);
end;

// -----------------------------------------------------------------------------

procedure TWebCredentials.Clear;
begin
  FCredentials.Clear;
end;

// -----------------------------------------------------------------------------

procedure TWebCredentials.Remove(const URI: string; Scheme: TWebAuthentication; Exact: boolean);
var
  i: integer;
begin
  for i := FCredentials.Count-1 downto 0 do
    if (FCredentials[i].Scheme = Scheme) then
    begin
      if (Exact) then
      begin
        if (AnsiSameText(FCredentials[i].URI, URI)) then
          FCredentials.Delete(i);
      end else
      begin
        if (MatchURI(FCredentials[i].URI, URI)) then
          FCredentials.Delete(i);
      end;
    end;
end;

procedure TWebCredentials.Remove(const URI: string; Exact: boolean);
var
  i: integer;
begin
  for i := FCredentials.Count-1 downto 0 do
    if (Exact) then
    begin
      if (AnsiSameText(FCredentials[i].URI, URI)) then
        FCredentials.Delete(i);
    end else
    begin
      if (MatchURI(FCredentials[i].URI, URI)) then
        FCredentials.Delete(i);
    end;
end;


// -----------------------------------------------------------------------------
//
// TCustomWebClient
//
// -----------------------------------------------------------------------------
constructor TCustomWebClient.Create;
begin
  inherited Create;

  FConnectionTimeOut := HTTP_DEFAULT_CONNECTTIMEOUT;
  FSendTimeout := HTTP_DEFAULT_SENDTIMEOUT;
  FReceiveTimeout := HTTP_DEFAULT_RECEIVETIMEOUT;

  FCredentials := TWebCredentials.Create;
end;

destructor TCustomWebClient.Destroy;
begin
  FCredentials.Free;

  inherited;
end;

function TCustomWebClient.Connect(const URI: string): IWebRequest;
var
  UriCracker: TIdURI;
  IsHttps: boolean;
begin
  UriCracker := TIdURI.Create(URI);
  try
    IsHttps := AnsiSameText(UriCracker.Protocol, 'https');
    Result := Connect(UriCracker.Host, IsHTTPS, StrToIntDef(UriCracker.Port, DEFAULT_PORT[IsHttps]));
  finally
    UriCracker.Free;
  end;
end;

// -----------------------------------------------------------------------------

function TCustomWebClient.Delete(const URI, Header: string): IWebResponse;
var
  UriCracker: TIdURI;
  Request: IWebRequest;
begin
  Request := Connect(URI);

  if (Header <> '') then
    Request.Headers.Text := Header;

  UriCracker := TIdURI.Create(URI);
  try
    Result := Request.Delete(UriCracker.GetPathAndParams);
  finally
    UriCracker.Free;
  end;
end;

function TCustomWebClient.Get(const URI, Header: string): IWebResponse;
var
  UriCracker: TIdURI;
  Request: IWebRequest;
begin
  Request := Connect(URI);

  if (Header <> '') then
    Request.Headers.Text := Header;

  UriCracker := TIdURI.Create(URI);
  try
    Result := Request.Get(UriCracker.GetPathAndParams);
  finally
    UriCracker.Free;
  end;
end;

function TCustomWebClient.Post(const URI: string; const Content: RawByteString; const ContentType, Header: string): IWebResponse;
var
  UriCracker: TIdURI;
  Request: IWebRequest;
begin
  Request := Connect(URI);

  if (Header <> '') then
    Request.Headers.Text := Header;
  if (ContentType <> '') then
    Request.Headers.Values[sHttpHeaderContentType] := ContentType;

  UriCracker := TIdURI.Create(URI);
  try
    Result := Request.Post(UriCracker.GetPathAndParams, Content);
  finally
    UriCracker.Free;
  end;
end;

function TCustomWebClient.Put(const URI: string; const Content: RawByteString; const ContentType, Header: string): IWebResponse;
var
  UriCracker: TIdURI;
  Request: IWebRequest;
begin
  Request := Connect(URI);

  if (Header <> '') then
    Request.Headers.Text := Header;
  if (ContentType <> '') then
    Request.Headers.Values[sHttpHeaderContentType] := ContentType;

  UriCracker := TIdURI.Create(URI);
  try
    Result := Request.Put(UriCracker.GetPathAndParams, Content);
  finally
    UriCracker.Free;
  end;
end;


// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

initialization

finalization
  if (FWebClient <> nil) then
    FreeAndNil(FWebClient);
end.
