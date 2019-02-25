unit Main;

interface

uses
  Generics.Collections,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls,

  cxLookAndFeelPainters, cxGraphics, dxSkinsCore, cxControls, cxLookAndFeels, dxStatusBar, cxClasses, dxAlertWindow,
  dxBarBuiltInMenu, cxButtons, cxPC,

  ScriptHostAPI,
  ScriptHostAlertWindow,

  DemoFrameDocument;

// -----------------------------------------------------------------------------
//
//              TFormMain
//
// -----------------------------------------------------------------------------
type
  TFormMain = class(TForm, IScriptHostApplication)
    AlertWindowManager: TdxAlertWindowManager;
    StatusBar: TdxStatusBar;
    PageControlDocuments: TcxPageControl;
    TabSheetDocument1: TcxTabSheet;
    FrameDocument1: TFrameDocument;
    TabSheetDocument2: TcxTabSheet;
    FrameDocument2: TFrameDocument;
    procedure AlertWindowManagerBeforeShow(Sender: TObject; AAlertWindow: TdxAlertWindow);
    procedure AlertWindowManagerClick(Sender: TObject; AAlertWindow: TdxAlertWindow);
    procedure AlertWindowManagerClose(Sender: TObject; AAlertWindow: TdxAlertWindow);
    procedure ButtonDebuggerClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  strict private
    FSubscribers: TList<IInterface>;
  strict protected
    procedure Notify(ASubscriber: IUnknown; Notification: TScriptHostApplicationNotification); overload;
    procedure Notify(Notification: TScriptHostApplicationNotification); overload;
  strict protected
    // IScriptHostApplication
    procedure Subscribe(const Subscriber: IInterface);
    procedure Unsubscribe(const Subscriber: IInterface);
    function GetActiveDocument: IScriptHostDocument;
    function AddAlertMessage(const ACaption, AMessage: string; AImageIndex: integer = -1; ATimeout: integer = -1): IScriptHostAlertWindow;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  FormMain: TFormMain;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

implementation

{$R *.dfm}

uses
  ScriptAPI;

// -----------------------------------------------------------------------------
//
//              TFormMain
//
// -----------------------------------------------------------------------------
constructor TFormMain.Create(AOwner: TComponent);
var
  i: integer;
begin
  inherited;
  FSubscribers := TList<IInterface>.Create;
  RegisterScriptHostApplication(Self);

  for i := 0 to PageControlDocuments.PageCount-1 do
    if (PageControlDocuments.Pages[i].ControlCount > 0) and (PageControlDocuments.Pages[i].Controls[0] is TFrameDocument) then
      TFrameDocument(PageControlDocuments.Pages[i].Controls[0]).Filename := PageControlDocuments.Pages[i].Caption+'.document';
end;

destructor TFormMain.Destroy;
begin
  RegisterScriptHostApplication(nil);
  FSubscribers.Free;
  inherited;
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Notify subscribers that we are closing
  Notify(TScriptHostApplicationNotification.notifyClosing);
  Action := caFree;
end;

procedure TFormMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  i: integer;
  Subscriber: IScriptHostApplicationCloseNotification;
begin
  // Ask subscribers for permission to shut down
  i := FSubscribers.Count-1;
  while (i >= 0) and (CanClose) do
  begin
    if (Supports(FSubscribers[i], IScriptHostApplicationCloseNotification, Subscriber)) then
      Subscriber.ApplicationCloseQuery(Self, CanClose);
    Dec(i);
  end;
end;

// -----------------------------------------------------------------------------
// TFormMain: Notification Host->Debugger
// -----------------------------------------------------------------------------
procedure TFormMain.Notify(ASubscriber: IInterface; Notification: TScriptHostApplicationNotification);
var
  Subscriber: IScriptHostApplicationNotification;
begin
  if (Supports(ASubscriber, IScriptHostApplicationNotification, Subscriber)) then
    Subscriber.ApplicationNotify(Self, Notification);
end;

procedure TFormMain.Notify(Notification: TScriptHostApplicationNotification);
var
  i: integer;
begin
  for i := FSubscribers.Count-1 downto 0 do
    Notify(FSubscribers[i], Notification);
end;

// -----------------------------------------------------------------------------
// TFormMain: IScriptHostApplication implementation
// -----------------------------------------------------------------------------
procedure TFormMain.Subscribe(const Subscriber: IInterface);
begin
  if (FSubscribers.Contains(Subscriber)) then
    exit;

  FSubscribers.Add(Subscriber);

  Notify(Subscriber, TScriptHostApplicationNotification.notifySubscribe);
end;

procedure TFormMain.Unsubscribe(const Subscriber: IInterface);
begin
  if (not FSubscribers.Contains(Subscriber)) then
    exit;

  FSubscribers.Remove(Subscriber);

  Notify(Subscriber, TScriptHostApplicationNotification.notifyUnsubscribe);
end;

function TFormMain.GetActiveDocument: IScriptHostDocument;
begin
  Result := nil;
  if (PageControlDocuments.ActivePage <> nil) and (PageControlDocuments.ActivePage.ControlCount > 0) then
    if (not Supports(PageControlDocuments.ActivePage.Controls[0], IScriptHostDocument, Result)) then
      Result := nil;
end;

function TFormMain.AddAlertMessage(const ACaption, AMessage: string; AImageIndex, ATimeout: integer): IScriptHostAlertWindow;
begin
  Result := TScriptAlertWindow.AddAlertMessage(AlertWindowManager, ACaption, AMessage, AImageIndex, ATimeout);
end;

// -----------------------------------------------------------------------------
// TFormMain: UI logic
// -----------------------------------------------------------------------------
procedure TFormMain.AlertWindowManagerBeforeShow(Sender: TObject; AAlertWindow: TdxAlertWindow);
var
  p: TPoint;
begin
  p.X := StatusBar.Left + StatusBar.Width;
  p.Y := StatusBar.Top;
  p := ClientToScreen(p);
  AAlertWindow.Left := p.X - AAlertWindow.OptionsSize.Width;
  AAlertWindow.Top := p.Y - AAlertWindow.OptionsSize.Height;
end;

procedure TFormMain.AlertWindowManagerClick(Sender: TObject; AAlertWindow: TdxAlertWindow);
begin
  if (AAlertWindow.Tag <> 0) then
    TScriptAlertWindow(IUnknown(AAlertWindow.Tag)).AlertClicked;
end;

procedure TFormMain.AlertWindowManagerClose(Sender: TObject; AAlertWindow: TdxAlertWindow);
begin
  if (AAlertWindow.Tag <> 0) then
    TScriptAlertWindow(IUnknown(AAlertWindow.Tag)).AlertClosed;
end;

procedure TFormMain.ButtonDebuggerClick(Sender: TObject);
begin
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

end.
