unit DemoFrameDocument;

interface

uses
  Generics.Collections,
  Winapi.Windows, Winapi.Messages, SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.ImageList,
  Vcl.ImgList,

  dxSkinsCore, dxBarBuiltInMenu, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxPC, cxImageList,

  ScriptHostAPI;

// -----------------------------------------------------------------------------
//
//              TFrameDocument
//
// -----------------------------------------------------------------------------
// Wraps an application "document".
// In this demo the document is just a frame with a page control on it.
// The document can contain one or more "files". Each file is represented by a
// page with a memo on the page control. See the TFrameDocumentFile class below.
// -----------------------------------------------------------------------------
type
  TFrameDocument = class(TFrame, IScriptHostDocument, IScriptHostFiles)
    MemoScript: TMemo;
    PageControlAttachments: TcxPageControl;
    TabSheetUnit1: TcxTabSheet;
    ImageListSmall: TcxImageList;
    TabSheetUnit2: TcxTabSheet;
    Memo1: TMemo;
    procedure PageControlTcxPageControlPropertiesTcxPCCustomButtonsButtons0Click(Sender: TObject);
    procedure PageControlTcxPageControlPropertiesTcxPCCustomButtonsButtons1Click(Sender: TObject);
    procedure PageControlAttachmentsNewTabCreate(Sender: TObject; AIndex: Integer);
  private
    FModified: boolean;
    FSubscribers: TList<IInterface>;
    FFilename: string;
    FFiles: TList<IScriptHostFile>;
  strict protected
    procedure Notify(ASubscriber: IUnknown; Notification: TScriptHostDocumentNotification); overload;
    procedure Notify(Notification: TScriptHostDocumentNotification); overload;
  protected
    function AddAttachment(TabSheet: TcxTabSheet; const Filename: string; Memo: TMemo = nil): TMemo;
  protected
    // IScriptHostDocument
    procedure Initialize(const ScriptHostApplication: IScriptHostApplication);
    procedure Finalize;
    procedure Subscribe(const Subscriber: IInterface);
    procedure Unsubscribe(const Subscriber: IInterface);
    function GetFilename: string;
    function GetAllowEdit: boolean;
    function GetFiles: IScriptHostFiles;
    function GetActiveItem: TObject;
    procedure Changed;

    // IScriptHostFiles
    function ScriptHostFilesTryGetFile(const Filename: string; out ScriptHostFile: IScriptHostFile): boolean;
    function ScriptHostFilesAdd(const Name, Filename: string): IScriptHostFile;
    procedure ScriptHostFilesRemove(const AFile: IScriptHostFile);

    function IScriptHostFiles.TryGetFile = ScriptHostFilesTryGetFile;
    function IScriptHostFiles.Add = ScriptHostFilesAdd;
    procedure IScriptHostFiles.Remove = ScriptHostFilesRemove;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property Filename: string read FFilename write FFilename;
  end;

implementation

{$R *.dfm}

uses
  IOUtils,
  ScriptAPI,
  ScriptProviderAPI,
  ScriptProvider,
  ScriptHostProvider,
  ScriptPackageAPI;

// -----------------------------------------------------------------------------
//
//              TFrameDocumentFile
//
// -----------------------------------------------------------------------------
// Wraps a file/attachment within the document.
// For this demo the file/attachment is a TMemo.
// -----------------------------------------------------------------------------
type
  TFrameDocumentFile = class(TInterfacedObject, IScriptHostFile)
  private
    FMemo: TMemo;
    FName: string;
    function GetFileSize: Int64;
  protected
    // IScriptHostFile
    procedure Subscribe(const Subscriber: IInterface);
    procedure Unsubscribe(const Subscriber: IInterface);

    procedure LoadFromStream(AStream: TStream);
    procedure SaveToStream(AStream: TStream);
    function GetStream: TStream;
    property FileSize: Int64 read GetFileSize;
    function GetName: string;
  public
    constructor Create(AMemo: TMemo; const AName: string);
  end;

// -----------------------------------------------------------------------------
//
//              TFrameDocument
//
// -----------------------------------------------------------------------------
constructor TFrameDocument.Create(AOwner: TComponent);

  function CreateGUID: string;
  var
    Guid: TGUID;
  begin
    SysUtils.CreateGUID(Guid);
    Result := GUIDToString(Guid);
  end;

begin
  inherited Create(AOwner);
  FSubscribers := TList<IInterface>.Create;
  FFiles := TList<IScriptHostFile>.Create;
  FFilename := CreateGUID;

  PageControlAttachments.Properties.NewButton.ImageIndex := 2;
end;

destructor TFrameDocument.Destroy;
begin
  FSubscribers.Free;
  FFiles.Free;
  inherited;
end;

// -----------------------------------------------------------------------------
// TFrameDocument: Notification Host->Debugger
// -----------------------------------------------------------------------------
procedure TFrameDocument.Notify(Notification: TScriptHostDocumentNotification);
var
  i: integer;
begin
  for i := FSubscribers.Count-1 downto 0 do
    Notify(FSubscribers[i], Notification);
end;

procedure TFrameDocument.Notify(ASubscriber: IInterface; Notification: TScriptHostDocumentNotification);
var
  Subscriber: IScriptHostDocumentNotification;
begin
  if (Supports(ASubscriber, IScriptHostDocumentNotification, Subscriber)) then
    Subscriber.HostDocumentNotify(Self, Notification);
end;

// -----------------------------------------------------------------------------
// TFrameDocument: Utilities
// -----------------------------------------------------------------------------
function TFrameDocument.AddAttachment(TabSheet: TcxTabSheet; const Filename: string; Memo: TMemo): TMemo;
var
  ScriptHostFile: IScriptHostFile;
begin
  TabSheet.Caption := TPath.GetFileName(Filename);

  Result := Memo;

  // Add a memo to represent the attachment script...
  if (Result = nil) then
  begin
    Result := TMemo.Create(Self);
    Result.Align := alClient;
    Result.Parent := TabSheet;
    Result.BorderStyle := bsNone;
  end;

  // ... and create the corresponding file object
  ScriptHostFile := TFrameDocumentFile.Create(Result, Filename);
  FFiles.Insert(TabSheet.PageIndex, ScriptHostFile);
end;

// -----------------------------------------------------------------------------
// TFrameDocument: UI logic
// -----------------------------------------------------------------------------
procedure TFrameDocument.PageControlAttachmentsNewTabCreate(Sender: TObject; AIndex: Integer);
var
  TabSheet: TcxTabSheet;
  Memo: TMemo;
  i: integer;
  ScriptHostFile: IScriptHostFile;
  Filename: string;
begin
  // New tab added

  TabSheet := PageControlAttachments.Pages[AIndex];
  TabSheet.ImageIndex := -1;

  i := 1;
  while (i < MaxInt) do
  begin
    // Construct a new Filename
    Filename := Format('Unit%d.pas', [i]);

    // Make sure Filename is unique within document
    if (not ScriptHostFilesTryGetFile(Filename, ScriptHostFile)) then
      break;

    Inc(i);
  end;

  Memo := AddAttachment(TabSheet, Filename);

  Memo.Lines.Text := Format('unit %s;'#13#13'begin'#13#13'end;', [TPath.GetFileNameWithoutExtension(Filename)]);
end;

procedure TFrameDocument.PageControlTcxPageControlPropertiesTcxPCCustomButtonsButtons0Click(Sender: TObject);
var
  ScriptProvider: IScriptProvider;
begin
  // Edit button clicked

  // Wrap document and active page in a script provider
  ScriptProvider := TDocumentScriptProvider.Create(Self, FFiles[PageControlAttachments.ActivePageIndex]);

  // Invoke editor on script
  ScriptService.Edit(Self, nil, ScriptProvider);
end;

procedure TFrameDocument.PageControlTcxPageControlPropertiesTcxPCCustomButtonsButtons1Click(Sender: TObject);
var
  ScriptProvider: IScriptProvider;
  Reason: TScriptExecutionReason;
begin
  // Execute button clicked

  // Wrap document and active page in a script provider
  ScriptProvider := TDocumentScriptProvider.Create(Self, FFiles[PageControlAttachments.ActivePageIndex]);

  // Invoke debugger on script
  ScriptService.Execute(ScriptProvider, Reason);
end;

// -----------------------------------------------------------------------------
// TFrameDocument: IScriptHostDocument implementaton
// -----------------------------------------------------------------------------
procedure TFrameDocument.Initialize(const ScriptHostApplication: IScriptHostApplication);
var
  i: integer;
begin
  ScriptHostApplication.Subscribe(Self);

  // Wrap the existing pages/memos as files
  for i := 0 to PageControlAttachments.PageCount-1 do
    AddAttachment(PageControlAttachments.Pages[i], PageControlAttachments.Pages[i].Caption, PageControlAttachments.Pages[i].Controls[0] as TMemo);

  // Work around bug in DevExpress: OnClick is lost when page control is placed on a TFrame
  PageControlAttachments.Properties.CustomButtons.Buttons[0].OnClick := PageControlTcxPageControlPropertiesTcxPCCustomButtonsButtons0Click;
  PageControlAttachments.Properties.CustomButtons.Buttons[1].OnClick := PageControlTcxPageControlPropertiesTcxPCCustomButtonsButtons1Click;
end;

procedure TFrameDocument.Finalize;
begin
  ScriptHostApplication.Unsubscribe(Self);
end;

procedure TFrameDocument.Subscribe(const Subscriber: IInterface);
begin
  if (FSubscribers.Contains(Subscriber)) then
    exit;

  FSubscribers.Add(Subscriber);

  Notify(Subscriber, TScriptHostDocumentNotification.notifySubscribe);
end;

procedure TFrameDocument.Unsubscribe(const Subscriber: IInterface);
begin
  if (not FSubscribers.Contains(Subscriber)) then
    exit;

  FSubscribers.Remove(Subscriber);

  Notify(Subscriber, TScriptHostDocumentNotification.notifyUnsubscribe);
end;

function TFrameDocument.GetFilename: string;
begin
  Result := FFilename;
end;

function TFrameDocument.GetAllowEdit: boolean;
begin
  Result := True;
end;

function TFrameDocument.GetFiles: IScriptHostFiles;
begin
  Result := Self;
end;

function TFrameDocument.GetActiveItem: TObject;
begin
  Result := nil; // Document child context not used
end;

procedure TFrameDocument.Changed;
begin
  FModified := True;
end;

// -----------------------------------------------------------------------------
// TFrameDocument: IScriptHostFiles implementation
// -----------------------------------------------------------------------------
function TFrameDocument.ScriptHostFilesTryGetFile(const Filename: string; out ScriptHostFile: IScriptHostFile): boolean;
var
  i: integer;
begin
  Result := False;
  ScriptHostFile := nil;

  for i := 0 to FFiles.Count-1 do
    if (AnsiSameText(Filename, FFiles[i].Name)) then
    begin
      Result := True;
      ScriptHostFile := FFiles[i];
      break;
    end;
end;

function TFrameDocument.ScriptHostFilesAdd(const Name, Filename: string): IScriptHostFile;
var
  TabSheet: TcxTabSheet;
begin
  TabSheet := TcxTabSheet.Create(Self);
  TabSheet.PageControl := PageControlAttachments;

  AddAttachment(TabSheet, Filename);

  Result := FFiles[TabSheet.PageIndex];
end;

procedure TFrameDocument.ScriptHostFilesRemove(const AFile: IScriptHostFile);
begin
  FFiles.Remove(AFile);
end;

// -----------------------------------------------------------------------------
//
//              TFrameDocumentFile
//
// -----------------------------------------------------------------------------
constructor TFrameDocumentFile.Create(AMemo: TMemo; const AName: string);
begin
  inherited Create;
  FMemo := AMemo;
  FName := AName;
end;

function TFrameDocumentFile.GetFileSize: Int64;
begin
  Result := Length(FMemo.Lines.Text);
end;

function TFrameDocumentFile.GetName: string;
begin
  Result := FName;
end;

function TFrameDocumentFile.GetStream: TStream;
begin
  Result := nil;
end;

procedure TFrameDocumentFile.LoadFromStream(AStream: TStream);
begin
  FMemo.Lines.LoadFromStream(AStream);
end;

procedure TFrameDocumentFile.SaveToStream(AStream: TStream);
begin
  FMemo.Lines.SaveToStream(AStream);
end;

procedure TFrameDocumentFile.Subscribe(const Subscriber: IInterface);
begin
  // Not implemented in this demo
end;

procedure TFrameDocumentFile.Unsubscribe(const Subscriber: IInterface);
begin
  // Not implemented in this demo
end;

end.
