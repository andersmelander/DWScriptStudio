unit amScriptHostProvider;

(*
 * Copyright © 2012 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Classes,
  dwsFileSystem,
  amScriptProviderAPI,
  amScriptProvider,
  amScriptHostAPI;

type
  IScriptDocumentProvider = interface
    ['{A94AA2AA-7B90-4F75-BAA4-09971B88A2E5}']
    function GetDocument: IScriptHostDocument;
    property Document: IScriptHostDocument read GetDocument;
  end;

// -----------------------------------------------------------------------------
//
// TCustomScriptDocumentProvider
//
// -----------------------------------------------------------------------------
type
  TCustomScriptDocumentProvider = class(TInterfacedObject, IScriptDocumentProvider)
  private
    FDocument: IScriptHostDocument;
    FNotificationSink: IScriptProviderNotificationSink;
  protected
    function CreateNotificationSink: IScriptProviderNotificationSink; virtual;
    property Document: IScriptHostDocument read FDocument;

    function GetFolder: string; virtual;
    function GetDocument: IScriptHostDocument;
    function CreateFileSystem: IdwsFileSystem;
  public
    constructor Create(const ADocument: IScriptHostDocument);
    destructor Destroy; override;
  end;


// -----------------------------------------------------------------------------
//
// TDocumentScriptProvider
//
// -----------------------------------------------------------------------------
type
  TDocumentScriptProvider = class(TCustomScriptDocumentProvider, IScriptProvider)
  private
    FName: string;
    FScriptHostFile: IScriptHostFile;
  protected
    function CreateNotificationSink: IScriptProviderNotificationSink; override;
    function GetScriptHostFile: IScriptHostFile;
    procedure Detach;
    property ScriptHostFile: IScriptHostFile read FScriptHostFile;
    // IScriptProvider
    procedure SetScript(const Script: string);
    function GetScript: string;
    function GetScriptName: string;
    function GetReadOnly: boolean;
    function GetProtected: boolean;
    function CreateFileSystem: IdwsFileSystem;
  public
    constructor Create(const ADocument: IScriptHostDocument; const AScriptHostFile: IScriptHostFile); overload;
    constructor Create(const ADocument: IScriptHostDocument; const AName: string); overload;
    destructor Destroy; override;
  end;


// -----------------------------------------------------------------------------
//
// TScriptProviderDocumentNotificationSink
//
// -----------------------------------------------------------------------------
type
  TScriptProviderDocumentNotificationSink = class(TInterfacedObject, IScriptProviderNotificationSink, IScriptHostDocumentNotification, IScriptHostDocumentCloseNotification)
  private
    FDocument: IScriptHostDocument;
  protected
    property Document: IScriptHostDocument read FDocument;

    // IScriptProviderNotificationSink
    procedure Terminate; virtual;

    // IScriptHostDocumentNotification
    procedure HostDocumentNotify(const Document: IScriptHostDocument; Notification: TScriptHostDocumentNotification);

    // IScriptHostDocumentCloseNotification
    procedure HostDocumentCloseQuery(const Document: IScriptHostDocument; var CanClose: boolean);
  public
    constructor Create(const ADocument: IScriptHostDocument);
    destructor Destroy; override;
  end;

// -----------------------------------------------------------------------------
//
// TDocumentAttachmentStream
//
// -----------------------------------------------------------------------------
// Provides an TStream interface to an attachment (IScriptHostFile).
// -----------------------------------------------------------------------------
type
  TDocumentAttachmentStream = class(TStream)
  private
    FAttachment: IScriptHostFile;
    FStream: TStream;
    FModified: boolean;
  protected
    procedure EnsureStream;
    function GetSize: Int64; override;
    procedure SetSize(NewSize: Longint); overload; override;
  public
    constructor Create(const AAttachment: IScriptHostFile);
    destructor Destroy; override;

    function Read(var Buffer; Count: Longint): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override;
    function Seek(Offset: Longint; Origin: Word): Longint; overload; override;

    property Attachment: IScriptHostFile read FAttachment;
  end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

implementation

uses
  IOUtils,
  Dialogs,
  SysUtils,
  amDialogs,
  amScriptAPI,
  amScriptFileSystem,
  amScriptHostFileSystem;

// -----------------------------------------------------------------------------
//
// TCustomScriptDocumentProvider
//
// -----------------------------------------------------------------------------
constructor TCustomScriptDocumentProvider.Create(const ADocument: IScriptHostDocument);
begin
  inherited Create;
  FDocument := ADocument;

  FNotificationSink := CreateNotificationSink;
end;

function TCustomScriptDocumentProvider.CreateFileSystem: IdwsFileSystem;
begin
  Result := TScriptRestrictedFileSystem.Create(GetFolder);
end;

function TCustomScriptDocumentProvider.CreateNotificationSink: IScriptProviderNotificationSink;
begin
  Result := TScriptProviderDocumentNotificationSink.Create(FDocument);
end;

destructor TCustomScriptDocumentProvider.Destroy;
begin
  FNotificationSink.Terminate;
  FNotificationSink := nil;

  inherited;
end;

function TCustomScriptDocumentProvider.GetFolder: string;
begin
  Result := Document.Filename;
  if (Result <> '') then
    Result := TPath.GetDirectoryName(Result);
end;

function TCustomScriptDocumentProvider.GetDocument: IScriptHostDocument;
begin
  Result := FDocument;
end;

// -----------------------------------------------------------------------------
//
// TDocumentScriptProvider
//
// -----------------------------------------------------------------------------
constructor TDocumentScriptProvider.Create(const ADocument: IScriptHostDocument; const AName: string);
var
  ScriptHostFile: IScriptHostFile;
begin
  if (not ADocument.Files.TryGetFile(AName, ScriptHostFile)) then
    raise EScript.CreateFmt('Attachment not found: %s', [AName]);

  Create(ADocument, ScriptHostFile);
end;

function TDocumentScriptProvider.CreateFileSystem: IdwsFileSystem;
begin
  Result := TScriptDocumentFileSystem.Create(Document, TPath.GetDirectoryName(Document.Filename));
end;

type
  TScriptProviderAttachmentDocumentNotificationSink = class(TScriptProviderDocumentNotificationSink, IScriptHostFileNotification)
  private
    FProvider: TDocumentScriptProvider;
    FScriptHostFile: IScriptHostFile;
  protected
    // IScriptProviderNotificationSink
    procedure Terminate; override;

    // IScriptHostFileNotification
    procedure HostDocumentNotify(const ScriptHostFile: IScriptHostFile; Notification: TScriptHostFileNotification);
  public
    constructor Create(AProvider: TDocumentScriptProvider);
  end;

constructor TScriptProviderAttachmentDocumentNotificationSink.Create(AProvider: TDocumentScriptProvider);
begin
  inherited Create(AProvider.Document);

  FProvider := AProvider;
  FScriptHostFile := FProvider.ScriptHostFile;
  FScriptHostFile.Subscribe(Self);
end;

procedure TScriptProviderAttachmentDocumentNotificationSink.HostDocumentNotify(const ScriptHostFile: IScriptHostFile; Notification: TScriptHostFileNotification);
begin
  if (ScriptHostFile = FScriptHostFile) and (Notification = TScriptHostFileNotification.notifyFree) then
  begin
    FScriptHostFile.Unsubscribe(Self);
    FScriptHostFile := nil;
    if (FProvider <> nil) then
      FProvider.Detach;
  end;
end;

procedure TScriptProviderAttachmentDocumentNotificationSink.Terminate;
begin
  if (FScriptHostFile <> nil) then
  begin
    FScriptHostFile.Unsubscribe(Self);
    FScriptHostFile := nil;
  end;
  inherited;
end;

function TDocumentScriptProvider.CreateNotificationSink: IScriptProviderNotificationSink;
begin
  Result := TScriptProviderAttachmentDocumentNotificationSink.Create(Self);
end;

constructor TDocumentScriptProvider.Create(const ADocument: IScriptHostDocument; const AScriptHostFile: IScriptHostFile);
begin
  FScriptHostFile := AScriptHostFile;
  inherited Create(ADocument);
  FName := FScriptHostFile.Name;
end;

destructor TDocumentScriptProvider.Destroy;
begin
  Detach;

  inherited;
end;

procedure TDocumentScriptProvider.Detach;
begin
  FScriptHostFile := nil;
end;

function TDocumentScriptProvider.GetScriptHostFile: IScriptHostFile;
begin
  Result := FScriptHostFile;
  if (Result = nil) then
  begin
    if (not Document.Files.TryGetFile(FName, Result)) then
      raise EScript.CreateFmt('Attachment not found: %s', [FName]);
  end;
end;

function TDocumentScriptProvider.GetProtected: boolean;
begin
  Result := False;
end;

function TDocumentScriptProvider.GetReadOnly: boolean;
begin
  ASSERT(Document <> nil);

  Result := (not Document.AllowEdit);
end;

function TDocumentScriptProvider.GetScript: string;
var
  Attachment: IScriptHostFile;
  Stream: TStream;
  StreamReader: TStreamReader;
begin
  ASSERT(Document <> nil);

  Attachment := GetScriptHostFile;

  Stream := TDocumentAttachmentStream.Create(Attachment);
  try

    StreamReader := TStreamReader.Create(Stream);
    try

      Result := StreamReader.ReadToEnd;

    finally
      StreamReader.Free;
    end;

  finally
    Stream.Free;
  end;
end;

function TDocumentScriptProvider.GetScriptName: string;
begin
  Result := FName;
end;

procedure TDocumentScriptProvider.SetScript(const Script: string);
var
  Attachment: IScriptHostFile;
  Stream: TStream;
  StreamWriter: TStreamWriter;
begin
  ASSERT(Document <> nil);

  Attachment := GetScriptHostFile;

  Stream := TMemoryStream.Create;
  try
    StreamWriter := TStreamWriter.Create(Stream);
    try
      StreamWriter.Write(Script);
    finally
      StreamWriter.Free;
    end;
    Stream.Position := 0;
    Attachment.LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

// -----------------------------------------------------------------------------
//
// TScriptProviderDocumentNotificationSink
//
// -----------------------------------------------------------------------------
constructor TScriptProviderDocumentNotificationSink.Create(const ADocument: IScriptHostDocument);
begin
  inherited Create;

  FDocument := ADocument;
  FDocument.Subscribe(Self);
end;

destructor TScriptProviderDocumentNotificationSink.Destroy;
begin
  Terminate;

  inherited;
end;

procedure TScriptProviderDocumentNotificationSink.HostDocumentCloseQuery(const Document: IScriptHostDocument; var CanClose: boolean);
begin
  MessageDlgEx('The script debugger/editor must be closed before the document can be closed.', mtWarning, [mbOK], -1);
  CanClose := False;
end;

procedure TScriptProviderDocumentNotificationSink.HostDocumentNotify(const Document: IScriptHostDocument; Notification: TScriptHostDocumentNotification);
begin
  if (FDocument <> Document) then
    exit;

  case Notification of
    TScriptHostDocumentNotification.notifyUnsubscribe:
      FDocument := nil;

    TScriptHostDocumentNotification.notifyShutdown:
      raise Exception.Create('Document cannot close while script is being edited or debugged');
  end;
end;

procedure TScriptProviderDocumentNotificationSink.Terminate;
begin
  if (FDocument <> nil) then
    FDocument.Unsubscribe(Self);

  FDocument := nil;
end;

// -----------------------------------------------------------------------------
//
// TDocumentAttachmentStream
//
// -----------------------------------------------------------------------------
constructor TDocumentAttachmentStream.Create(const AAttachment: IScriptHostFile);
begin
  Assert(AAttachment <> nil);
  inherited Create;
  FAttachment := AAttachment;
end;

destructor TDocumentAttachmentStream.Destroy;
begin
  if (FStream <> nil) then
  begin
    if (FModified) then
    begin
      FStream.Position := 0;
      FAttachment.LoadFromStream(FStream);
    end;

    if (FAttachment.Stream = nil) then
      FStream.Free;
  end;

  inherited;
end;

procedure TDocumentAttachmentStream.EnsureStream;
begin
  if (FStream <> nil) then
    exit;

  if (FAttachment.Stream = nil) then
  begin
    FStream := TMemoryStream.Create;
    FAttachment.SaveToStream(FStream);
  end else
    FStream := FAttachment.Stream;

  FStream.Position := 0;
end;

function TDocumentAttachmentStream.GetSize: Int64;
begin
  if (FStream <> nil) then
    Result := FStream.Size
  else
    Result := FAttachment.FileSize;
end;

function TDocumentAttachmentStream.Read(var Buffer; Count: Integer): Longint;
begin
  EnsureStream;
  Result := FStream.Read(Buffer, Count);
end;

function TDocumentAttachmentStream.Seek(Offset: Integer; Origin: Word): Longint;
begin
  EnsureStream;
  Result := FStream.Seek(Offset, Origin);
end;

procedure TDocumentAttachmentStream.SetSize(NewSize: Integer);
begin
  EnsureStream;
  if (FStream.Size <> NewSize) then
  begin
    FStream.Size := NewSize;
    FModified := True;
  end;
end;

function TDocumentAttachmentStream.Write(const Buffer; Count: Integer): Longint;
begin
  EnsureStream;
  Result := FStream.Write(Buffer, Count);
  FModified := True;
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

end.
