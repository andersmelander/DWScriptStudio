unit Main;

interface

uses
  Generics.Collections,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls,

  cxLookAndFeelPainters, cxGraphics, dxSkinsCore, cxControls, cxLookAndFeels, dxStatusBar, cxClasses,
  cxButtons, cxPC,

  ScriptHostAPI;

// -----------------------------------------------------------------------------
//
//              TFormMain
//
// -----------------------------------------------------------------------------
type
  TFormMain = class(TForm, IScriptHostApplication)
    StatusBar: TdxStatusBar;
    MemoScript: TMemo;
    PanelToolbar: TPanel;
    ButtonDebugger: TcxButton;
    ButtonExecute: TcxButton;
    ButtonEdit: TcxButton;
    procedure ButtonDebuggerClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ButtonExecuteClick(Sender: TObject);
    procedure ButtonEditClick(Sender: TObject);
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
  ScriptAPI,
  ScriptProviderAPI,
  ScriptProvider,
  ScriptPackageAPI;

// -----------------------------------------------------------------------------
//
//              TMemoScriptProvider
//
// -----------------------------------------------------------------------------
// Two way script provider, memo <-> debugger
// -----------------------------------------------------------------------------
type
  TMemoScriptProvider = class(TSimpleScriptProvider)
  private
    FMemo: TMemo;
  protected
    procedure SetScript(const Script: string); override;
  public
    constructor Create(AMemo: TMemo);
  end;

constructor TMemoScriptProvider.Create(AMemo: TMemo);
begin
  FMemo := AMemo;
  inherited Create('Unit1.pas', FMemo.Lines.Text);
end;

procedure TMemoScriptProvider.SetScript(const Script: string);
begin
  inherited SetScript(Script);
  FMemo.Lines.Text := Script;
end;

// -----------------------------------------------------------------------------
//
//              TFormMain
//
// -----------------------------------------------------------------------------
constructor TFormMain.Create(AOwner: TComponent);
begin
  inherited;
  FSubscribers := TList<IInterface>.Create;

  // Set self as the script host
  RegisterScriptHostApplication(Self);
end;

destructor TFormMain.Destroy;
begin
  RegisterScriptHostApplication(nil);

  FSubscribers.Free;
  inherited;
end;

// -----------------------------------------------------------------------------

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
  // Acknowledge subscription via notification
  Notify(Subscriber, TScriptHostApplicationNotification.notifySubscribe);
end;

procedure TFormMain.Unsubscribe(const Subscriber: IInterface);
begin
  if (not FSubscribers.Contains(Subscriber)) then
    exit;
  FSubscribers.Remove(Subscriber);
  // Acknowledge unsubscription via notification
  Notify(Subscriber, TScriptHostApplicationNotification.notifyUnsubscribe);
end;

function TFormMain.AddAlertMessage(const ACaption, AMessage: string; AImageIndex, ATimeout: integer): IScriptHostAlertWindow;
begin
  Result := nil; // Alert messages ignored
end;

function TFormMain.GetActiveDocument: IScriptHostDocument;
begin
  Result := nil; // Documents/Contexts not supported
end;

// -----------------------------------------------------------------------------
// TFormMain: UI logic
// -----------------------------------------------------------------------------
procedure TFormMain.ButtonDebuggerClick(Sender: TObject);
begin
  // Open debugger with empty script
  ScriptService.Edit;
end;

procedure TFormMain.ButtonEditClick(Sender: TObject);
var
  ScriptProvider: IScriptProvider;
begin
  // Open script in debugger
  ScriptProvider := TMemoScriptProvider.Create(MemoScript);
  ScriptService.Edit(ScriptProvider);
end;

procedure TFormMain.ButtonExecuteClick(Sender: TObject);
var
  ScriptProvider: IScriptProvider;
  Reason: TScriptExecutionReason;
begin
  // Execute script
  ScriptProvider := TMemoScriptProvider.Create(MemoScript);
  ScriptService.Execute(ScriptProvider, Reason);
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
end.
