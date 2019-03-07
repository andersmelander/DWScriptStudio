unit amWebClient1;

(*
 * Copyright © 2015 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

// -----------------------------------------------------------------------------
//
// Web Client classes based on Synopse HTTP library
//
// -----------------------------------------------------------------------------

var
  sWebClientUserAgent1: AnsiString = '';

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

implementation

uses
  Windows,
  WinInet,
  Classes,
  SysUtils,
  SyncObjs,
  StrUtils,
  idURI,
  SynCrtSock,
  dwsUtils,
  amWebClient;


// -----------------------------------------------------------------------------
//
// TamWinINet
//
// -----------------------------------------------------------------------------
// Semi low level HTTP client
// -----------------------------------------------------------------------------
type
  TamWinINet = class(TWinINet)
  private
    FURI: string;
    FCredentials: TWebCredentials;
  protected
    function GetFullURI: string;
    procedure InternalConnect(ConnectionTimeOut, SendTimeout, ReceiveTimeout: DWORD); override;
    procedure InternalSendRequest(const aData: SockString); override;
  public
    function Request(const url, method: SockString; KeepAlive: cardinal;
      const InHeader, InData, InDataType: SockString;
      out OutHeader, OutData: SockString): integer; override;

    property Credentials: TWebCredentials read FCredentials write FCredentials;
  end;

// -----------------------------------------------------------------------------

function TamWinINet.GetFullURI: string;
var
  Uri: TIdURI;
begin
  Uri := TIdURI.Create(FURI);
  try
    Uri.Host := AnsiLowerCase(fServer);
    Uri.Port := IntToStr(fPort);
    if (fHttps) then
      Uri.Protocol := 'https'
    else
      Uri.Protocol := 'http';

    Result := Uri.URI;
  finally
    Uri.Free;
  end;
end;

procedure TamWinINet.InternalConnect(ConnectionTimeOut, SendTimeout, ReceiveTimeout: DWORD);
var
  UserAgent: AnsiString;
begin
  inherited;
  UserAgent := sWebClientUserAgent1;
  if (UserAgent = '') then
  begin
    UserAgent := sWebClientUserAgent;
    if (UserAgent = '') then
      UserAgent := 'amWebClient/1';
  end;
  InternetSetOptionA(fConnection, INTERNET_OPTION_USER_AGENT, pointer(UserAgent), Length(UserAgent)+1);
end;

// -----------------------------------------------------------------------------

procedure TamWinINet.InternalSendRequest(const aData: SockString);
var
  Res: DWord;
  P: pointer;
  LastError: DWord;
  Status: DWord;
  Credential: TWebCredential;
  TryCredentials: boolean;
  uri: string;
begin
  TryCredentials := True;

  while (True) do
  begin
    if (HttpSendRequestA(fRequest, nil, 0, pointer(aData), length(aData))) then
    begin
      if (not TryCredentials) then
        break;

      Status := InternalGetInfo32(HTTP_QUERY_STATUS_CODE);

      TryCredentials := False;
      if (Status = HTTP_STATUS_DENIED) then
      begin
        uri := GetFullURI;
        Credential := FCredentials.Find(uri);

        if (Credential <> nil) then
        begin
          if (not InternetSetOption(fConnection, INTERNET_OPTION_USERNAME, PChar(Credential.Username), Length(Credential.Username)+1)) then
            RaiseLastOSError;
          if (not InternetSetOption(fConnection, INTERNET_OPTION_PASSWORD, PChar(Credential.Password), Length(Credential.Password)+1)) then
            RaiseLastOSError;

          continue;
        end;
      end;

      break;
    end;

    LastError := GetLastError;

    if (LastError <= ERROR_INTERNET_SHUTDOWN) then
      raise EWinINet.Create;

    Res := InternetErrorDlg(GetDesktopWindow(), fRequest, LastError,
      FLAGS_ERROR_UI_FILTER_FOR_ERRORS or FLAGS_ERROR_UI_FLAGS_CHANGE_OPTIONS or FLAGS_ERROR_UI_FLAGS_GENERATE_DATA, P);

    { After selecting client certificate send request again, Note: InternetErrorDlg always returns ERROR_SUCCESS when called with ERROR_INTERNET_CLIENT_AUTH_CERT_NEEDED }
    if (LastError = ERROR_INTERNET_CLIENT_AUTH_CERT_NEEDED) then
      Res := ERROR_INTERNET_FORCE_RETRY;

    case Res of
      ERROR_SUCCESS:
        break;
      ERROR_CANCELLED:
        SysUtils.Abort;
      ERROR_INTERNET_FORCE_RETRY:
        continue;
    end;
  end;
end;

// -----------------------------------------------------------------------------

function TamWinINet.Request(const url, method: SockString; KeepAlive: cardinal; const InHeader, InData,
  InDataType: SockString; out OutHeader, OutData: SockString): integer;
(*
var
  Credential: TWebCredential;
*)
begin
  FURI := url;
(*
  Credential := FCredentials.Find(GetFullURI);

  if (Credential <> nil) then
  begin
    if (not InternetSetOption(fConnection, INTERNET_OPTION_USERNAME, PChar(Credential.Username), Length(Credential.Username)+1)) then
      RaiseLastOSError;
    if (not InternetSetOption(fConnection, INTERNET_OPTION_PASSWORD, PChar(Credential.Password), Length(Credential.Password)+1)) then
      RaiseLastOSError;
  end;
*)
  Result := inherited;
end;


// -----------------------------------------------------------------------------
//
// THttpRequestThread
//
// -----------------------------------------------------------------------------
type
  THttpRequestThread = class(TThread)
  private
    FHttp: TamWinINet;
    FMethod: RawByteString;
    FURL: RawByteString;
    FRequestHeader: SockString;
    FRequestData: SockString;
    FRequestContentType: SockString;
    FKeepAlive: cardinal;
    FResponseData: SockString;
    FRawResponseHeaders: SockString;
    FResponseHeaders: TStrings;
    FCurrentSize: DWORD;
    FContentLength: DWORD;
    FStatusCode: integer;
    FError: string;
    FCompletionFlag: TEvent;
    FTerminateFlag: TMutex;
    FFinished: boolean;
  protected
    procedure DoProgress(Sender: TWinHttpAPI; CurrentSize, ContentLength: DWORD);
    function DoDownload(Sender: TWinHttpAPI; CurrentSize, ContentLength, ChunkSize: DWORD; const ChunkData): boolean;

    procedure Execute; override;

    procedure PrepareHeaders;
  public
    constructor Create(AHttp: TamWinINet; const AURL, AMethod: string; AKeepAlive: cardinal; const AInHeader, AInData, AInDataType: RawByteString);
    destructor Destroy; override;

    procedure Terminate;
    procedure Release;

    function Wait(Timeout: integer = -1): THttpRequestThread;
    property Finished: boolean read FFinished;

    property Method: RawByteString read FMethod;
    property url: RawByteString read FURL;
    property RequestData: SockString read FRequestData;
    property RequestContentType: SockString read FRequestContentType;
    property ResponseData: SockString read FResponseData;
    property RawResponseHeaders: SockString read FRawResponseHeaders;
    property ResponseHeaders: TStrings read FResponseHeaders;
    property CurrentSize: DWORD read FCurrentSize;
    property ContentLength: DWORD read FContentLength;
    property StatusCode: integer read FStatusCode;
    property Error: string read FError;
  end;

// -----------------------------------------------------------------------------

constructor THttpRequestThread.Create(AHttp: TamWinINet; const AURL, AMethod: string; AKeepAlive: cardinal; const AInHeader, AInData, AInDataType: RawByteString);
begin
  inherited Create(True);
  FreeOnTerminate := True;

  FHttp := AHttp;
  FMethod := AMethod;
  FURL := AUrl;
  FRequestHeader := AInHeader;
  FRequestData := AInData;
  FRequestContentType := AInDataType;
  FKeepAlive := AKeepAlive;

  FResponseHeaders := TStringList.Create;
  FResponseHeaders.NameValueSeparator := ':';
  FResponseHeaders.LineBreak := #13#10;
  TStringList(FResponseHeaders).CaseSensitive := False;

  FCompletionFlag := TEvent.Create(nil, True, False, '');

  FTerminateFlag := TMutex.Create(nil, True, '');
end;

destructor THttpRequestThread.Destroy;
begin
  inherited;
  FResponseHeaders.Free;
  FCompletionFlag.Free;
  FTerminateFlag.Free;
end;

// -----------------------------------------------------------------------------

procedure THttpRequestThread.PrepareHeaders;

  procedure AddHeader(const s: String);
  var
    k: integer;
  begin
    k := Pos(':', s);
    if k > 0 then
      ResponseHeaders.Add(SysUtils.TrimRight(Copy(s, 1, k - 1) + '=' + SysUtils.Trim(Copy(s, k + 1))));
  end;

var
  h: String;
  p, pn: integer;
begin
  FixedRawByteStringToScriptString(FRawResponseHeaders, h);
  FResponseHeaders := TFastCompareTextList.Create;

  p := 1;
  while True do
  begin
    pn := StrUtils.PosEx(#13#10, h, p);
    if pn > 0 then
    begin
      AddHeader(Copy(h, p, pn - p));
      p := pn + 2;
    end
    else
      break;
  end;
  AddHeader(Copy(h, p));
end;

// -----------------------------------------------------------------------------

procedure THttpRequestThread.Execute;
begin
  try
    FHttp.OnProgress := DoProgress;
    FHttp.OnDownload := DoDownload;

    FStatusCode := FHttp.Request(FURL, FMethod, FKeepAlive, FRequestHeader, FRequestData, FRequestContentType, FRawResponseHeaders, FResponseData);

    FRequestData := '';
    FRequestContentType := '';
    FContentLength := Length(FResponseData);
    FCurrentSize := FContentLength;

    DecodeHeader(FRawResponseHeaders, FResponseHeaders);
    //PrepareHeaders;
  except
    on E: Exception do
      FError := E.Message;
  end;

  // Signal completion
  FFinished := True;
  FCompletionFlag.SetEvent;

  // Wait for termination permission
  FTerminateFlag.Acquire;
end;

// -----------------------------------------------------------------------------

procedure THttpRequestThread.Terminate;
begin
  if (FHttp <> nil) then
  begin
    FHttp.OnProgress := nil;
    FHttp := nil;
  end;

  inherited Terminate;
end;

procedure THttpRequestThread.Release;
begin
  FTerminateFlag.Release;
end;

// -----------------------------------------------------------------------------

function THttpRequestThread.Wait(Timeout: integer): THttpRequestThread;
var
  WaitResult: TWaitResult;
begin
  Result := nil;

  WaitResult := FCompletionFlag.WaitFor(DWORD(Timeout));

  if (WaitResult = wrSignaled) then
    Result := Self
  else
  if (WaitResult <> wrTimeout) then
    RaiseLastOSError;
end;

// -----------------------------------------------------------------------------

function THttpRequestThread.DoDownload(Sender: TWinHttpAPI; CurrentSize, ContentLength, ChunkSize: DWORD; const ChunkData): boolean;
var
  Buffer: pointer;
begin
  ASSERT(FCurrentSize = DWORD(Length(FResponseData)));
  ASSERT(CurrentSize = FCurrentSize + ChunkSize);

  SetLength(FResponseData, CurrentSize);
  Buffer := PAnsiChar(FResponseData) + FCurrentSize;

  Move(ChunkData, Buffer^, ChunkSize);

  Result := (not Terminated);
end;

procedure THttpRequestThread.DoProgress(Sender: TWinHttpAPI; CurrentSize, ContentLength: DWORD);
begin
  FCurrentSize := CurrentSize;
  FContentLength := ContentLength;
end;

// -----------------------------------------------------------------------------
//
// TWebRequest
//
// -----------------------------------------------------------------------------
// Implements IWebRequest
// -----------------------------------------------------------------------------
type
  TWebRequest = class(TCustomWebRequest)
  private
    FHostName: string;
    FPort: integer;
    FHttps: boolean;

    FCredentials: TWebCredentials;
    FHttp: TamWinINet;

    FHeaders: TStrings;
    FContent: RawByteString;
    FKeepAlive: integer;
  protected
    property Http: TamWinINet read FHttp;

    // IWebRequest
    function GetCredentials: TWebCredentials; override;
    function GetContent: RawByteString; override;
    function GetHeaders: TStrings; override;
    procedure SetContent(const Value: RawByteString); override;
    function Execute(const Method: string; const URI: string; Asynchronous: boolean = True): IWebResponse; override;

    property Headers: TStrings read FHeaders;
    property Content: RawByteString read FContent write FContent;
  public
    constructor Create(AWebClient: TCustomWebClient; const AHostName: SockString; APort: integer; AHttps: boolean);
    destructor Destroy; override;
  end;

// -----------------------------------------------------------------------------
//
// TWebResponse
//
// -----------------------------------------------------------------------------
// Implements IWebResponse
// -----------------------------------------------------------------------------
type
  TWebResponse = class(TCustomWebResponse)
  private
    FRequest: IWebRequest;
    FRequestThread: THttpRequestThread;
    FAborted: boolean;
  protected
    function GetHeaders: TStrings; override;
    function GetContent: RawByteString; override;
    function GetStatusCode: integer; override;
    function GetContentLength: integer; override;
    function GetCurrentContentSize: integer; override;
    function GetErrorMessage: string; override;
    function GetMethod: string; override;
    function GetURL: string; override;
    function GetCompleted: boolean; override;
    function GetAborted: boolean; override;
    function GetFailed: boolean; override;
  public
    constructor Create(const ARequest: IWebRequest; AHttp: TamWinINet; const AURL, AMethod: string; AKeepAlive: cardinal; const AInHeader, AInData, AInDataType: RawByteString);
    destructor Destroy; override;

    procedure Execute; override;

    procedure Abort; override;
    function Wait: IWebResponse; override;
  end;

// -----------------------------------------------------------------------------

constructor TWebResponse.Create(const ARequest: IWebRequest; AHttp: TamWinINet; const AURL, AMethod: string; AKeepAlive: cardinal; const AInHeader, AInData, AInDataType: RawByteString);
begin
  inherited Create;

  FRequest := ARequest;
  FRequestThread := THttpRequestThread.Create(AHttp, AURL, AMethod, AKeepAlive, AInHeader, AInData, AInDataType);
end;

destructor TWebResponse.Destroy;
begin
  Abort;
  if (FRequestThread <> nil) then
  begin
    // Abandon thread
    FRequestThread.Release;
    FRequestThread := nil;
  end;
  FRequest := nil;
  inherited;
end;

// -----------------------------------------------------------------------------

procedure TWebResponse.Abort;
begin
  FAborted := True;
  if (FRequestThread <> nil) then
    FRequestThread.Terminate;
end;

// -----------------------------------------------------------------------------

procedure TWebResponse.Execute;
begin
  FRequestThread.Start;
end;

// -----------------------------------------------------------------------------

function TWebResponse.GetAborted: boolean;
begin
  Result := FAborted;
end;

// -----------------------------------------------------------------------------

function TWebResponse.GetCompleted: boolean;
begin
  Result := FRequestThread.Finished;
end;

// -----------------------------------------------------------------------------

function TWebResponse.GetContent: RawByteString;
begin
  Result := FRequestThread.Wait.ResponseData;
end;

// -----------------------------------------------------------------------------

function TWebResponse.GetContentLength: integer;
begin
  // Returns async value
  Result := FRequestThread.ContentLength;
end;

// -----------------------------------------------------------------------------

function TWebResponse.GetCurrentContentSize: integer;
begin
  // Returns async value
  Result := FRequestThread.CurrentSize;
end;

// -----------------------------------------------------------------------------

function TWebResponse.GetErrorMessage: string;
begin
  if (FRequestThread.Finished) then
    Result := FRequestThread.Wait.Error
  else
    Result := '';
end;

// -----------------------------------------------------------------------------

function TWebResponse.GetFailed: boolean;
begin
  Result := (FRequestThread.Finished) and (FRequestThread.Wait.Error <> '');
end;

// -----------------------------------------------------------------------------

function TWebResponse.GetHeaders: TStrings;
begin
  Result := FRequestThread.Wait.ResponseHeaders;
end;

// -----------------------------------------------------------------------------

function TWebResponse.GetMethod: string;
begin
  Result := FRequestThread.Method;
end;

// -----------------------------------------------------------------------------

function TWebResponse.GetStatusCode: integer;
begin
  Result := FRequestThread.Wait.StatusCode;
end;

// -----------------------------------------------------------------------------

function TWebResponse.GetURL: string;
begin
  Result := FRequestThread.URL;
end;

// -----------------------------------------------------------------------------

function TWebResponse.Wait: IWebResponse;
begin
  if (FRequestThread.Wait <> nil) then
    Result := Self
  else
    Result := nil; // raise exception instead
end;


// -----------------------------------------------------------------------------
//
// TWebRequest
//
// -----------------------------------------------------------------------------
constructor TWebRequest.Create(AWebClient: TCustomWebClient; const AHostName: SockString; APort: integer; AHttps: boolean);
begin
  inherited Create;

  FCredentials := TWebCredentials.Create;
  FHeaders := TStringList.Create;
  FHeaders.NameValueSeparator := ':';
  FHeaders.LineBreak := #13#10;
  TStringList(FHeaders).CaseSensitive := False;

  FHostName := AHostName;
  FPort := APort;
  FHttps := AHttps;

  FCredentials.Assign(AWebClient.Credentials);

  FHttp := TamWinINet.Create(FHostName, IntToStr(FPort), FHttps, AWebClient.ProxyName, AWebClient.ProxyByPass, AWebClient.ConnectionTimeOut, AWebClient.SendTimeout, AWebClient.ReceiveTimeout);
  FHttp.IgnoreSSLCertificateErrors := AWebClient.IgnoreSSLCertificateErrors;
  FHttp.Credentials := FCredentials;
end;

destructor TWebRequest.Destroy;
begin
  FHttp.Free;
  FHeaders.Free;
  FCredentials.Free;
  inherited;
end;

// -----------------------------------------------------------------------------

function TWebRequest.Execute(const Method: string; const URI: string; Asynchronous: boolean): IWebResponse;
var
  RequestHeader: RawByteString;
begin
  EncodeHeader(RequestHeader, FHeaders);

  Result := TWebResponse.Create(Self, FHttp, URI, Method, FKeepAlive, RequestHeader, FContent, '');

  TWebResponse(Result).Execute;

  if (not Asynchronous) then
    Result := Result.Wait;
end;

// -----------------------------------------------------------------------------

function TWebRequest.GetCredentials: TWebCredentials;
begin
  Result := FCredentials;
end;

// -----------------------------------------------------------------------------

function TWebRequest.GetContent: RawByteString;
begin
  Result := FContent;
end;

procedure TWebRequest.SetContent(const Value: RawByteString);
begin
  FContent := Value;
end;

// -----------------------------------------------------------------------------

function TWebRequest.GetHeaders: TStrings;
begin
  Result := FHeaders;
end;


// -----------------------------------------------------------------------------
//
// TWebClient
//
// -----------------------------------------------------------------------------
type
  TWebClient = class(TCustomWebClient)
  private
  protected
  public
    constructor Create; override;
    destructor Destroy; override;

    function Connect(const HostName: string; Https: boolean; Port: integer = -1): IWebRequest; overload; override;
  end;

constructor TWebClient.Create;
begin
  inherited Create;
end;

destructor TWebClient.Destroy;
begin
  inherited;
end;

// -----------------------------------------------------------------------------

function TWebClient.Connect(const HostName: string; Https: boolean; Port: integer): IWebRequest;
begin
  if (Port = -1) then
    Port := DEFAULT_PORT[Https];

  Result := TWebRequest.Create(Self, HostName, Port, Https);
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

initialization
  WebClientClass := TWebClient;

finalization
end.
