unit amWebClient2;

(*
 * Copyright © 2015 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  SysUtils;

// -----------------------------------------------------------------------------
//
// Web Client classes based on WinInet
//
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

var
  sWebClientUserAgent2: AnsiString = '';

implementation

uses
  Windows,
  WinInet,
  Classes,
  SyncObjs,
  idURI,
  amWebClient;

const
  // While reading an HTTP response, read it in blocks of this size. 8K for now
  HTTP_RESP_BLOCK_SIZE = 8*1024;

type
  TWebConnection = class;
  TWebRequest = class;
  TWebResponse = class;

(*
var Session := TWebSession.Create;
var Connection := Session.Connect('test.com', 80);
var Request := Connection.Request('\test', 'GET', True, ...);
var Response := Request.Execute;
var Result := Response.Content;
*)

// -----------------------------------------------------------------------------
//
// TWebSession
//
// -----------------------------------------------------------------------------
// Encapsulates a WinInet session
// -----------------------------------------------------------------------------
  TWebSession = class
  strict private
    FSessionHandle: HINTERNET;
    FCredentials: TWebCredentials;
  protected
  public
    constructor Create(const AProxyName: string = ''; const AProxyByPass: string = '';
      AConnectionTimeOut: DWORD = 0; ASendTimeout: DWORD = 0; AReceiveTimeout: DWORD = 0);
    destructor Destroy; override;

    function Connect(const AServer: string; APort: integer): TWebConnection; overload;
    function Connect(const AServer: string; AHttps: boolean = False): TWebConnection; overload;

    property Handle: HINTERNET read FSessionHandle;
    property Credentials: TWebCredentials read FCredentials;
  end;

// -----------------------------------------------------------------------------
//
// TWebConnection
//
// -----------------------------------------------------------------------------
// Encapsulates a WinInet connection
// -----------------------------------------------------------------------------
  TWebConnection = class
  strict private
    FSession: TWebSession;
    FConnectionHandle: HINTERNET;

    FServer: string;
    FPort: integer;
  protected
    // OpenConnection is called by TWebSession.Connect
    procedure OpenConnection;
    procedure CloseConnection;
    property Session: TWebSession read FSession;
  public
    constructor Create(ASession: TWebSession; const AServer: string; APort: integer);
    destructor Destroy; override;

    function Request(const AURL, AMethod: string; AHttps: boolean; AKeepAlive: integer; const AHeader, AContent, AContentType: RawByteString): TWebRequest;

    property Handle: HINTERNET read FConnectionHandle;
    property Server: string read FServer;
    property Port: integer read FPort;
  end;

// -----------------------------------------------------------------------------
//
// TWebRequest
//
// -----------------------------------------------------------------------------
// Encapsulates the request part of a WinInet request
// -----------------------------------------------------------------------------
  TWebRequestProgress = procedure(Sender: TWebResponse; var Continue: boolean) of object;

  // Interface for use by connection object
  IWebRequestEx = interface
    function Execute(Asynchronous: boolean): TWebResponse;
  end;

  // Internal callback interface for use by response object
  IWebRequestInternal = interface
    function DoExecute(var Aborted: boolean): boolean;
    function GetInfo(Info: DWORD): RawByteString;
    function GetInfo32(Info: DWORD): DWORD;
    procedure Progress(Response: TWebResponse; var Continue: boolean);
    function GetHandle: HINTERNET;
    property Handle: HINTERNET read GetHandle;
  end;

  TWebRequest = class(TInterfacedObject, IWebRequestEx, IWebRequestInternal)
  strict private
    FConnection: TWebConnection;
    FRequestHandle: HINTERNET;

    FURL: string;
    FMethod: string;
    FHttps: boolean;
    FKeepAlive: integer;
    FHeader: RawByteString;
    FContent: RawByteString;
    FContentType: RawByteString;

    FOnProgress: TWebRequestProgress;
  protected
    function GetFullURI: string;

    procedure OpenRequest;

    // IWebRequestInternal
    function DoExecute(var Aborted: boolean): boolean;
    function GetInfo(Info: DWORD): RawByteString;
    function GetInfo32(Info: DWORD): DWORD;
    procedure Progress(Response: TWebResponse; var Continue: boolean);
    function GetHandle: HINTERNET;
    property Handle: HINTERNET read GetHandle;

    property Connection: TWebConnection read FConnection;
  public
    constructor Create(AConnection: TWebConnection; const AURL, AMethod: string; AHttps: boolean; AKeepAlive: integer; const AHeader, AContent, AContentType: RawByteString);
    destructor Destroy; override;

    // IWebRequestEx
    function Execute(Asynchronous: boolean): TWebResponse;

    property URL: string read FURL;
    property Method: string read FMethod;
    property Https: boolean read FHttps;
    property KeepAlive: integer read FKeepAlive;
    property Header: RawByteString read FHeader;
    property Content: RawByteString read FContent;
    property ContentType: RawByteString read FContentType;

    property OnProgress: TWebRequestProgress read FOnProgress write FOnProgress;
  end;

// -----------------------------------------------------------------------------
//
// TWebRequestThread
//
// -----------------------------------------------------------------------------
// Executes request/response in a thread
// -----------------------------------------------------------------------------
  TWebRequestThread = class(TThread)
  private
    FResponse: TWebResponse;

    FCompletionFlag: TEvent;
    FTerminateFlag: TMutex;
    FFinished: boolean;
  protected
    procedure Execute; override;
  public
    constructor Create(AResponse: TWebResponse);
    destructor Destroy; override;

    procedure Terminate;
    procedure Release;

    function Wait(Timeout: integer = -1): TWebRequestThread;
    property Finished: boolean read FFinished;
  end;

// -----------------------------------------------------------------------------
//
// TWebResponse
//
// -----------------------------------------------------------------------------
// Encapsulates the response part of a WinInet request
// -----------------------------------------------------------------------------
  TWebResponse = class
  strict private
    FRequest: IWebRequestInternal;
    FRequestThread: TWebRequestThread;
    FAsynchronous: boolean;
    FBlockSize: DWORD;
    FHeader: RawByteString;
    FContent: RawByteString;
    FContentLength: DWORD;
    FCurrentContentSize: DWORD;
    FStatusCode: DWORD;
    FAborted: boolean;
    FErrorMessage: string;
  private
    function GetContent: RawByteString;
    function GetErrorMessage: string;
    function GetHeader: RawByteString;
    function GetStatusCode: DWORD;
    function GetCompleted: boolean;
  protected
    procedure DoRetrieveResponse;
    procedure DoExecute;

    procedure Execute(AAsynchronous: boolean);
  public
    constructor Create(ARequest: IWebRequestInternal);
    destructor Destroy; override;

    procedure Abort;

    property Asynchronous: boolean read FAsynchronous;
    property BlockSize: DWORD read FBlockSize write FBlockSize;

    property Header: RawByteString read GetHeader;
    property Content: RawByteString read GetContent;
    property ContentLength: DWORD read FContentLength;
    property CurrentContentSize: DWORD read FCurrentContentSize;
    property StatusCode: DWORD read GetStatusCode;
    property Completed: boolean read GetCompleted;

    property ErrorMessage: string read GetErrorMessage write FErrorMessage;
    property Aborted: boolean read FAborted;

    function Wait(Timeout: integer = -1): TWebResponse;
  end;

// -----------------------------------------------------------------------------
//
// TWebSession
//
// -----------------------------------------------------------------------------
constructor TWebSession.Create(const AProxyName, AProxyByPass: string; AConnectionTimeOut, ASendTimeout, AReceiveTimeout: DWORD);
var
  AccessType: DWORD;
  UserAgent: string;
begin
  inherited Create;

  if (AProxyName = '') then
    AccessType := INTERNET_OPEN_TYPE_PRECONFIG
  else
    AccessType := INTERNET_OPEN_TYPE_PROXY;

  UserAgent := sWebClientUserAgent2;
  if (UserAgent = '') then
  begin
    UserAgent := sWebClientUserAgent;
    if (UserAgent = '') then
      UserAgent := 'amWebClient/2';
  end;


  FSessionHandle := InternetOpen(PChar(UserAgent), AccessType, PChar(AProxyName), PChar(AProxyByPass), 0);

  if (FSessionHandle = nil) then
    raise EWebClient.Create;

  InternetSetOption(FSessionHandle, INTERNET_OPTION_CONNECT_TIMEOUT, @AConnectionTimeOut, SizeOf(AConnectionTimeOut));
  InternetSetOption(FSessionHandle, INTERNET_OPTION_SEND_TIMEOUT, @ASendTimeout, SizeOf(ASendTimeout));
  InternetSetOption(FSessionHandle, INTERNET_OPTION_RECEIVE_TIMEOUT, @AReceiveTimeout, SizeOf(AReceiveTimeout));

  FCredentials := TWebCredentials.Create;
end;

destructor TWebSession.Destroy;
begin
  if (FSessionHandle <> nil) then
    InternetCloseHandle(FSessionHandle);

  FCredentials.Free;

  inherited;
end;

// -----------------------------------------------------------------------------

function TWebSession.Connect(const AServer: string; APort: integer): TWebConnection;
begin
  ASSERT(FSessionHandle <> nil);

  Result := TWebConnection.Create(Self, AServer, APort);
  try

    Result.OpenConnection;

  except
    Result.Free;
    raise;
  end;
end;

// -----------------------------------------------------------------------------

function TWebSession.Connect(const AServer: string; AHttps: boolean): TWebConnection;
var
  Port: integer;
begin
  if (AHttps) then
    Port := INTERNET_DEFAULT_HTTPS_PORT
  else
    Port := INTERNET_DEFAULT_HTTP_PORT;

  Result := Connect(AServer, Port);
end;


// -----------------------------------------------------------------------------
//
// TWebConnection
//
// -----------------------------------------------------------------------------
constructor TWebConnection.Create(ASession: TWebSession; const AServer: string; APort: integer);
begin
  inherited Create;
  FSession := ASession;

  FServer := AServer;
  FPort := APort;
end;

destructor TWebConnection.Destroy;
begin
  CloseConnection;

  inherited;
end;

// -----------------------------------------------------------------------------

procedure TWebConnection.OpenConnection;
begin
  CloseConnection;

  FConnectionHandle := InternetConnect(FSession.Handle, PChar(FServer), FPort, nil, nil, INTERNET_SERVICE_HTTP, 0, 0);

  if (FConnectionHandle = nil) then
    raise EWebClient.Create;
end;

procedure TWebConnection.CloseConnection;
begin
  if (FConnectionHandle = nil) then
    exit;

  InternetCloseHandle(FConnectionHandle);

  FConnectionHandle := nil;
end;

// -----------------------------------------------------------------------------

function TWebConnection.Request(const AURL, AMethod: string; AHttps: boolean; AKeepAlive: integer; const AHeader, AContent, AContentType: RawByteString): TWebRequest;
begin
  ASSERT(FConnectionHandle <> nil);

  Result := TWebRequest.Create(Self, AURL, AMethod, AHttps, AKeepAlive, AHeader, AContent, AContentType);
  try

    Result.OpenRequest;

  except
    Result.Free;
    raise;
  end;
end;


// -----------------------------------------------------------------------------
//
// TWebRequest
//
// -----------------------------------------------------------------------------
constructor TWebRequest.Create(AConnection: TWebConnection; const AURL, AMethod: string; AHttps: boolean; AKeepAlive: integer; const AHeader, AContent, AContentType: RawByteString);
begin
  inherited Create;
  FConnection := AConnection;

  FURL := AURL;
  FMethod := AMethod;
  FHttps := AHttps;
  FKeepAlive := AKeepAlive;
  FHeader := AHeader;
  FContent := AContent;
  FContentType := AContentType;
end;

destructor TWebRequest.Destroy;
begin
  if (FRequestHandle <> nil) then
    InternetCloseHandle(FRequestHandle);

  inherited;
end;

// -----------------------------------------------------------------------------

function TWebRequest.DoExecute(var Aborted: boolean): boolean;
var
  Res: DWord;
  P: pointer;
  LastError: DWord;
  Status: DWord;
  Credential: TWebCredential;
  TryCredentials: boolean;
  uri: string;
begin
  // Called by response opbject

  ASSERT(FRequestHandle <> nil);

  TryCredentials := (Connection.Session.Credentials <> nil);

  while (not Aborted) do
  begin
    if (HttpSendRequestA(FRequestHandle, nil, 0, pointer(FContent), Length(FContent))) then
    begin
      if (not TryCredentials) then
        break;

      Status := GetInfo32(HTTP_QUERY_STATUS_CODE);

      TryCredentials := False;
      if (Status = HTTP_STATUS_DENIED) then
      begin
        uri := GetFullURI;
        Credential := Connection.Session.Credentials.Find(uri);

        if (Credential <> nil) then
        begin
          if (not InternetSetOption(FRequestHandle, INTERNET_OPTION_USERNAME, PChar(Credential.Username), Length(Credential.Username)+1)) then
            RaiseLastOSError;
          if (not InternetSetOption(FRequestHandle, INTERNET_OPTION_PASSWORD, PChar(Credential.Password), Length(Credential.Password)+1)) then
            RaiseLastOSError;

          continue;
        end;
      end;

      break;
    end;

    LastError := GetLastError;

    if (LastError <= ERROR_INTERNET_SHUTDOWN) then
      raise EWebClient.Create;

    Res := InternetErrorDlg(GetDesktopWindow(), FRequestHandle, LastError,
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

  Result := (not Aborted);
end;

// -----------------------------------------------------------------------------

function TWebRequest.Execute(Asynchronous: boolean): TWebResponse;
begin
  ASSERT(FRequestHandle <> nil);

  Result := TWebResponse.Create(Self);
  try

    // If we need to provide progress feedback during the download,
    // then we require a block size. Set it to the default if it hasn't been specified.
    //if (Assigned(FOnProgress)) and (Result.BlockSize <= 0) then
    if (Result.BlockSize <= 0) then
      Result.BlockSize := HTTP_RESP_BLOCK_SIZE;

    Result.Execute(Asynchronous);

  except
    Result.Free;
    raise;
  end;
end;

// -----------------------------------------------------------------------------

function TWebRequest.GetFullURI: string;
var
  Uri: TIdURI;
begin
  Uri := TIdURI.Create(FURL);
  try
    Uri.Host := AnsiLowerCase(FConnection.Server);
    Uri.Port := IntToStr(FConnection.Port);
    if (FHttps) then
      Uri.Protocol := 'https'
    else
      Uri.Protocol := 'http';

    Result := Uri.URI;
  finally
    Uri.Free;
  end;
end;

// -----------------------------------------------------------------------------

function TWebRequest.GetHandle: HINTERNET;
begin
  Result := FRequestHandle;
end;

// -----------------------------------------------------------------------------

function TWebRequest.GetInfo(Info: DWORD): RawByteString;
var
  dwSize, dwIndex: DWORD;
begin
  Result := '';
  dwSize := 0;
  dwIndex := 0;
  if (not HttpQueryInfoA(FRequestHandle, Info, nil, dwSize, dwIndex)) and (GetLastError = ERROR_INSUFFICIENT_BUFFER) then
  begin
    SetLength(Result, dwSize-1);
    if (not HttpQueryInfoA(FRequestHandle, Info, pointer(Result), dwSize, dwIndex)) then
      Result := '';
  end;
end;

// -----------------------------------------------------------------------------

function TWebRequest.GetInfo32(Info: DWORD): DWORD;
var
  dwSize, dwIndex: DWORD;
begin
  dwSize := SizeOf(Result);
  dwIndex := 0;
  Info := Info or HTTP_QUERY_FLAG_NUMBER;
  if (not HttpQueryInfoA(FRequestHandle, Info, @Result, dwSize, dwIndex)) then
    Result := 0;
end;

// -----------------------------------------------------------------------------

procedure TWebRequest.OpenRequest;

  procedure AddHeader(RequestHandle: HINTERNET; const Header: RawByteString);
  begin
    if (Header = '') then
      exit;

    // Note: ANSI data!
    if (not HttpAddRequestHeadersA(RequestHandle, pointer(Header), Length(Header), HTTP_ADDREQ_FLAG_COALESCE)) then
      raise EWebClient.Create;
  end;

var
  Flags: DWORD;
  URL: string;
//  Content: RawByteString;
const
  ALL_ACCEPT: array[0..1] of PChar = ('*/*',nil);
begin
  Flags := INTERNET_FLAG_HYPERLINK or INTERNET_FLAG_PRAGMA_NOCACHE or INTERNET_FLAG_RESYNCHRONIZE; // options for a true RESTful request

  if (FKeepAlive <> 0) then
    Flags := Flags or INTERNET_FLAG_KEEP_CONNECTION;

  if (FHttps) then
    Flags := Flags or INTERNET_FLAG_SECURE;

  if (FURL = '') or (FURL[1] <> '/') then
    URL := '/' + FURL // need valid url according to the HTTP/1.1 RFC
  else
    URL := FURL;

  FRequestHandle := HttpOpenRequest(FConnection.Handle, PChar(FMethod), PChar(URL), nil, nil, @ALL_ACCEPT, Flags, 0);

  if (FRequestHandle = nil) then
    raise EWebClient.Create;

  // common headers
  AddHeader(FRequestHandle, FHeader);
  if (FContentType <> '') then
    AddHeader(FRequestHandle, RawByteString('Content-Type: ') + FContentType);

(*
  // handle custom compression
  Content := AContent;
  if integer(fCompressHeader)<>0 then
  begin
    aDataEncoding := CompressDataAndGetHeaders(fCompressHeader, fCompress, AContentType, Content);
    if aDataEncoding<>'' then
      InternalAddHeader(SockString('Content-Encoding: ')+aDataEncoding);
  end;
  if fCompressAcceptEncoding<>'' then
    InternalAddHeader(fCompressAcceptEncoding);
*)
end;

// -----------------------------------------------------------------------------

procedure TWebRequest.Progress(Response: TWebResponse; var Continue: boolean);
begin
  // Called by response opbject
  if (Assigned(FOnProgress)) then
    FOnProgress(Response, Continue);
end;


// -----------------------------------------------------------------------------
//
// TWebRequestThread
//
// -----------------------------------------------------------------------------
constructor TWebRequestThread.Create(AResponse: TWebResponse);
begin
  inherited Create(True);
  FreeOnTerminate := True;

  FResponse := AResponse;

  FCompletionFlag := TEvent.Create(nil, True, False, '');
  FTerminateFlag := TMutex.Create(nil, True, '');
end;

destructor TWebRequestThread.Destroy;
begin
  inherited;

  FCompletionFlag.Free;
  FTerminateFlag.Free;
end;

// -----------------------------------------------------------------------------

procedure TWebRequestThread.Execute;
begin
  try

    FResponse.DoExecute;

  except
    on E: Exception do
      FResponse.ErrorMessage := E.Message;
  end;

  // Signal completion
  FFinished := True;
  FCompletionFlag.SetEvent;

  // Wait for termination permission
  FTerminateFlag.Acquire;
end;

// -----------------------------------------------------------------------------

procedure TWebRequestThread.Terminate;
begin
  FResponse := nil;

  inherited Terminate;
end;

procedure TWebRequestThread.Release;
begin
  FTerminateFlag.Release;
end;

// -----------------------------------------------------------------------------

function TWebRequestThread.Wait(Timeout: integer): TWebRequestThread;
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
//
// TWebResponse
//
// -----------------------------------------------------------------------------
constructor TWebResponse.Create(ARequest: IWebRequestInternal);
begin
  inherited Create;
  FRequest := ARequest;
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

  inherited;
end;

// -----------------------------------------------------------------------------

procedure TWebResponse.Abort;
begin
  FAborted := True;
end;

// -----------------------------------------------------------------------------

procedure TWebResponse.Execute(AAsynchronous: boolean);
begin
  ASSERT(FRequest <> nil);

  FAsynchronous := AAsynchronous;

  if (FAsynchronous) then
  begin
    FRequestThread := TWebRequestThread.Create(Self);
    FRequestThread.Start;
  end else
    DoExecute;
end;

// -----------------------------------------------------------------------------

function TWebResponse.GetCompleted: boolean;
begin
  if (FAsynchronous) and (FRequestThread <> nil) then
    Result := FRequestThread.Finished
  else
    Result := True;
end;

function TWebResponse.GetContent: RawByteString;
begin
  Wait;
  Result := FContent;
end;

function TWebResponse.GetErrorMessage: string;
begin
  Wait;
  Result := FErrorMessage;
end;

function TWebResponse.GetHeader: RawByteString;
begin
  Wait;
  Result := FHeader;
end;

function TWebResponse.GetStatusCode: DWORD;
begin
  Wait;
  Result := FStatusCode;
end;

// -----------------------------------------------------------------------------

function TWebResponse.Wait(Timeout: integer): TWebResponse;
begin
  Result := Self;

  if (FAsynchronous) and (FRequestThread <> nil) then
  begin
    if (FRequestThread.Wait(Timeout) = nil) then
      Result := nil;
  end;
end;

// -----------------------------------------------------------------------------

procedure TWebResponse.DoExecute;
begin
  // Called from self or thread
  try

    if (FRequest.DoExecute(FAborted)) then
      DoRetrieveResponse;

  finally
    FRequest := nil;
  end;
end;

procedure TWebResponse.DoRetrieveResponse;
var
  ContentEncoding: RawByteString;
  AcceptEncoding: RawByteString;
  Bytes: DWORD;
  Continue: boolean;
  Buffer: pointer;
begin
  FStatusCode := FRequest.GetInfo32(HTTP_QUERY_STATUS_CODE);
  FHeader := FRequest.GetInfo(HTTP_QUERY_RAW_HEADERS_CRLF);
  ContentEncoding := FRequest.GetInfo(HTTP_QUERY_CONTENT_ENCODING);
  AcceptEncoding := FRequest.GetInfo(HTTP_QUERY_ACCEPT_ENCODING);

  // Get content size
  FCurrentContentSize := 0;
  FContentLength := FRequest.GetInfo32(HTTP_QUERY_CONTENT_LENGTH);

  // If final size isn't known, then we require a block size. Set it to the default if it hasn't been specified.
  if (FContentLength = 0) and (FBlockSize <= 0) then
    FBlockSize := HTTP_RESP_BLOCK_SIZE;

  // Preallocate whole buffer if we know the final size.
  if (not FAborted) and (FContentLength <> 0) then
    SetLength(FContent, FContentLength);

  // Loop to read data from remote
  while (not FAborted) do
  begin
    // Grow buffer unless it was preallocated.
    if (FContentLength = 0) then
      SetLength(FContent, FCurrentContentSize + FBlockSize);

    // Determine how much remains to be read.
    Bytes := DWORD(Length(FContent)) - FCurrentContentSize;
    // Do not read more than block size.
    if (FBlockSize <> 0) and (Bytes > FBlockSize) then
      Bytes := FBlockSize;

    // Read the data from remote
    Buffer := PByte(@FContent[1]) + FCurrentContentSize;
    if (not InternetReadFile(FRequest.Handle, Buffer, Bytes, Bytes)) then
      raise EWebClient.Create;

    // If nothing was read we're done.
    if (Bytes = 0) then
      break;

    inc(FCurrentContentSize, Bytes);

    // Provide progress feedback.
    Continue := not FAborted;
    if (Continue) then
      FRequest.Progress(Self, Continue);

    if (not Continue) then
    begin
      FAborted := True;
      break;
    end;
  end;

  // Truncate buffer
  SetLength(FContent, FCurrentContentSize);

  FContentLength := FCurrentContentSize;

  // Handle response compression
(*
  if (FContentLength > 0) then
  begin
    if (ContentEncoding <> '') then
      for i := 0 to high(FCompress) do
        with FCompress[i] do
          if (FCompress[i].Name = ContentEncoding) then
          begin
            if (FCompress[i].Func(FContent, False) <> '') then
              break; // successfully uncompressed content
            raise EWebClient.CreateFmt('%s uncompress',[FCompress[i].Name]);
          end;
    if (AcceptEncoding <> '') then
      FCompressHeader := ComputeContentEncoding(FCompress, pointer(AcceptEncoding));
  end;
*)
end;


// -----------------------------------------------------------------------------
//
// TWebRequestAdapter
//
// -----------------------------------------------------------------------------
// Implements IWebRequest
// -----------------------------------------------------------------------------
type
  TWebRequestAdapter = class(TCustomWebRequest)
  private
    FConnection: TWebConnection;
    FHttps: boolean;

    FHeaders: TStrings;
    FContent: RawByteString;
    FKeepAlive: integer;
  protected
    property Connection: TWebConnection read FConnection;

    // IWebRequest
    function GetCredentials: TWebCredentials; override;
    function GetContent: RawByteString; override;
    function GetHeaders: TStrings; override;
    procedure SetContent(const Value: RawByteString); override;
    function Execute(const Method: string; const URI: string; Asynchronous: boolean = False): IWebResponse; override;

    property Headers: TStrings read FHeaders;
    property Content: RawByteString read FContent write FContent;
  public
    constructor Create(AConnection: TWebConnection; AHttps: boolean);
    destructor Destroy; override;
  end;


// -----------------------------------------------------------------------------
//
// TWebResponseAdapter
//
// -----------------------------------------------------------------------------
// Implements IWebResponse
// -----------------------------------------------------------------------------
type
  TWebResponseAdapter = class(TCustomWebResponse)
  private
    FRequestAdapter: TWebRequestAdapter;
    FResponse: TWebResponse;
    FResponseHeaders: TStrings;
  protected
    // IWebResponse
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
    procedure Execute; override;
    procedure Abort; override;
    function Wait: IWebResponse; override;
  public
    constructor Create(ARequestAdapter: TWebRequestAdapter; AResponse: TWebResponse);
    destructor Destroy; override;
  end;


// -----------------------------------------------------------------------------
//
// TWebRequestAdapter
//
// -----------------------------------------------------------------------------
constructor TWebRequestAdapter.Create(AConnection: TWebConnection; AHttps: boolean);
begin
  inherited Create;

  FConnection := AConnection;
  FHttps := AHttps;

  FHeaders := TStringList.Create;
  FHeaders.NameValueSeparator := ':';
  FHeaders.LineBreak := #13#10;
  TStringList(FHeaders).CaseSensitive := False;
end;

destructor TWebRequestAdapter.Destroy;
begin
  FConnection.Free;
  inherited;
end;

// -----------------------------------------------------------------------------

function TWebRequestAdapter.Execute(const Method, URI: string; Asynchronous: boolean): IWebResponse;
var
  RequestHeader: RawByteString;
  Request: IWebRequestEx;
  Response: TWebResponse;
begin
  amWebClient.EncodeHeader(RequestHeader, FHeaders);

  Request := FConnection.Request(URI, Method, FHttps, FKeepAlive, RequestHeader, FContent, '');
  try

    Response := Request.Execute(Asynchronous);

  finally
    Request := nil;
  end;

  Result := TWebResponseAdapter.Create(Self, Response);

  if (not Asynchronous) then
    Result := Result.Wait;
end;

// -----------------------------------------------------------------------------

function TWebRequestAdapter.GetContent: RawByteString;
begin
  Result := FContent;
end;

// -----------------------------------------------------------------------------

function TWebRequestAdapter.GetCredentials: TWebCredentials;
begin
  Result := FConnection.Session.Credentials;
end;

// -----------------------------------------------------------------------------

function TWebRequestAdapter.GetHeaders: TStrings;
begin
  Result := FHeaders;
end;

// -----------------------------------------------------------------------------

procedure TWebRequestAdapter.SetContent(const Value: RawByteString);
begin
  FContent := Value;
end;


// -----------------------------------------------------------------------------
//
// TWebResponseAdapter
//
// -----------------------------------------------------------------------------
constructor TWebResponseAdapter.Create(ARequestAdapter: TWebRequestAdapter; AResponse: TWebResponse);
begin
  inherited Create;

  FRequestAdapter := ARequestAdapter;
  FResponse := AResponse;
end;

destructor TWebResponseAdapter.Destroy;
begin
  FResponse.Free;
  FResponseHeaders.Free;

  inherited;
end;

// -----------------------------------------------------------------------------

procedure TWebResponseAdapter.Execute;
begin
end;

// -----------------------------------------------------------------------------

procedure TWebResponseAdapter.Abort;
begin
  FResponse.Abort;
end;

// -----------------------------------------------------------------------------

function TWebResponseAdapter.GetAborted: boolean;
begin
  Result := FResponse.Aborted;
end;

function TWebResponseAdapter.GetCompleted: boolean;
begin
  Result := FResponse.Completed;
end;

function TWebResponseAdapter.GetContent: RawByteString;
begin
  Result := FResponse.Content;
end;

function TWebResponseAdapter.GetContentLength: integer;
begin
  Result := FResponse.ContentLength;
end;

function TWebResponseAdapter.GetCurrentContentSize: integer;
begin
  Result := FResponse.CurrentContentSize;
end;

function TWebResponseAdapter.GetErrorMessage: string;
begin
  Result := FResponse.ErrorMessage;
end;

function TWebResponseAdapter.GetFailed: boolean;
begin
  Result := (FResponse.ErrorMessage <> '');
end;

function TWebResponseAdapter.GetHeaders: TStrings;
begin
  if (FResponseHeaders = nil) then
  begin
    FResponseHeaders := TStringList.Create;
    FResponseHeaders.NameValueSeparator := ':';
    FResponseHeaders.LineBreak := #13#10;
    TStringList(FResponseHeaders).CaseSensitive := False;
    amWebClient.DecodeHeader(FResponse.Header, FResponseHeaders);
  end;
  Result := FResponseHeaders;
end;

function TWebResponseAdapter.GetMethod: string;
begin
  Result := '';
end;

function TWebResponseAdapter.GetStatusCode: integer;
begin
  Result := FResponse.StatusCode;
end;

function TWebResponseAdapter.GetURL: string;
begin
  Result := '';
end;


function TWebResponseAdapter.Wait: IWebResponse;
begin
  if (FResponse.Wait <> nil) then
    Result := Self
  else
    Result := nil;
end;

// -----------------------------------------------------------------------------
//
// TWebClient
//
// -----------------------------------------------------------------------------
type
  TWebClient = class(TCustomWebClient)
  private
    FSession: TWebSession;
  protected
    property Session: TWebSession read FSession;
  public
    constructor Create; override;
    destructor Destroy; override;

    function Connect(const HostName: string; Https: boolean; Port: integer = -1): IWebRequest; overload; override;
  end;

// -----------------------------------------------------------------------------

constructor TWebClient.Create;
begin
  inherited;

end;

destructor TWebClient.Destroy;
begin
  FreeAndNil(FSession);

  inherited;
end;

// -----------------------------------------------------------------------------

function TWebClient.Connect(const HostName: string; Https: boolean; Port: integer): IWebRequest;
var
  Connection: TWebConnection;
begin
  if (FSession = nil) then
    FSession := TWebSession.Create(ProxyName, ProxyByPass, ConnectionTimeOut, SendTimeout, ReceiveTimeout);

  if (Port = -1) then
    Port := DEFAULT_PORT[Https];

  Connection := FSession.Connect(HostName, Port);
  try

    Result := TWebRequestAdapter.Create(Connection, Https);

  except
    Connection.Free;
    raise;
  end;
end;


// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

initialization
  WebClientClass := TWebClient;

finalization

end.
