unit amScript.Service;

(*
 * Copyright © 2012 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  SysUtils, Classes,
  Generics.Collections,

  dwsComp,
  dwsExprs,
  dwsCompiler,
  dwsSymbols,
  dwsFunctions,
  dwsFileSystem,
  dwsUtils,
  dwsComConnector,
  dwsJSONConnector,
  dwsErrors,
  dwsDataContext,
{$ifndef OLD_DWSCRIPT}
  dwsUnitSymbols,
  dwsInfo,
{$endif OLD_DWSCRIPT}

  amScript.API,
  amScript.Debugger.API,
  amScript.Host.API,
  amScript.Provider.API,
  amScript.Package.API,
  amScript.Module;


// -----------------------------------------------------------------------------
//
// TDataModuleScriptService
//
// -----------------------------------------------------------------------------
type
  TDataModule = TCustomScriptModule;

  TScriptClassTypeMap = TDictionary<TClass, string>;


  TDataModuleScriptService = class(TDataModule, IScriptService, IScriptDebuggerHost)
    DelphiWebScript: TDelphiWebScript;
    dwsComConnector1: TdwsComConnector;
    dwsJSONLibModule1: TdwsJSONLibModule;
    dwsUnitScriptService: TdwsUnit;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    function DelphiWebScriptNeedUnit(const unitName: string; var unitSource: string): IdwsUnit;
    procedure DelphiWebScriptResource(compiler: TdwsCompiler; const resourceName: string);
    procedure dwsUnitScriptServiceClassesTScriptPackageListMethodsGetCountEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitScriptServiceClassesScriptServiceMethodsGetPackagesEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitScriptServiceClassesTScriptPackageListMethodsGetItemEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitScriptServiceClassesTScriptPackageListMethodsAddEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitScriptServiceClassesTScriptPackageListMethodsRemoveEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitScriptServiceClassesTScriptPackageListMethodsFindByIDEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitScriptServiceClassesTScriptPackageListMethodsFindByFilenameEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitScriptServiceClassesTScriptPackageMethodsGetPluginIDEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitScriptServiceClassesTScriptPackageMethodsGetPluginNameEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitScriptServiceClassesTScriptPackageMethodsGetPluginURIEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitScriptServiceClassesTScriptPackageMethodsGetDescriptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitScriptServiceClassesTScriptPackageMethodsGetVersionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitScriptServiceClassesTScriptPackageMethodsGetAuthorEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitScriptServiceClassesTScriptPackageMethodsGetAuthorURIEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitScriptServiceClassesTScriptPackageMethodsGetFilenameEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitScriptServiceClassesTScriptPackageMethodsGetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitScriptServiceClassesTScriptPackageMethodsSetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
    procedure DelphiWebScriptExecutionEnded(exec: TdwsProgramExecution);
    procedure DelphiWebScriptExecutionStarted(exec: TdwsProgramExecution);
    procedure dwsUnitScriptServiceClassesScriptServiceMethodsEdit0Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitScriptServiceClassesScriptServiceMethodsEditEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitScriptServiceClassesScriptServiceMethodsExecute0Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitScriptServiceClassesScriptServiceMethodsExecute1Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitScriptServiceClassesTScriptPackageMethodsGetAuthorIDEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitScriptServiceClassesTScriptPackageMethodsGetProductIDEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitScriptServiceClassesTScriptPackageMethodsGetPackageKindEval(Info: TProgramInfo; ExtObject: TObject);
  private
    FModules: TList<IScriptModule>;
    FPackages: IScriptPackageList;
    FExecutions: IScriptExecutionList;
    FClassTypeMap: TScriptClassTypeMap;

//    FDocument: IScriptHostDocument;
//    FItem: TObject;
    FDebugger: IScriptDebugger;
    FDebuggerFileSystems: IScriptContextFileSystems;

  protected
    function DoDebug(const ADocument: IScriptHostDocument; AItem: TObject; const ScriptProvider: IScriptProvider; const AExecution: IdwsProgramExecution = nil; Messages: TdwsMessageList = nil; MsgIndex: integer = -1): boolean;
{$ifdef FEATURE_SCRIPT_BUNDLE}
    function EditBundle(const Filename: string): boolean;
{$endif FEATURE_SCRIPT_BUNDLE}
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  protected
    // IScriptDebuggerHost
    function GetDelphiWebScript: TDelphiWebScript;
    procedure NotifyExecution(const ScriptDebugger: IScriptDebugger; const Execution: IdwsProgramExecution; Notification: TExecutionNotification);
    procedure NotifyClose(const ScriptDebugger: IScriptDebugger);
    // IScriptService
    procedure RegisterModule(const Module: IScriptModule);
    procedure UnregisterModule(const Module: IScriptModule);
    procedure RegisterWrappedComponent(AComponent: TComponent);
    function CreateContext(const ADocument: IScriptHostDocument = nil; AItem: TObject = nil; AForDebug: boolean = False): IScriptContext;
    function Debug(const ADocument: IScriptHostDocument; AItem: TObject; const ScriptName: string; var Script: string; const AExecution: IdwsProgramExecution = nil): boolean; overload;
    function Debug(const ADocument: IScriptHostDocument; AItem: TObject; const ScriptProvider: IScriptProvider; const AExecution: IdwsProgramExecution = nil): boolean; overload;
    function Edit(const ADocument: IScriptHostDocument; AItem: TObject; const ScriptName: string; var Script: string; Messages: TdwsMessageList = nil; MsgIndex: integer = -1): boolean; overload;
    function Edit(const ADocument: IScriptHostDocument; AItem: TObject; const ScriptProvider: IScriptProvider; Messages: TdwsMessageList = nil; MsgIndex: integer = -1): boolean; overload;
    function Edit(const Filename: string): boolean; overload;
    function Edit(const ScriptProvider: IScriptProvider = nil): boolean; overload;
    function CanEdit: boolean;
    function Execute(const Filename: string; var Reason: TScriptExecutionReason): IScriptExecution; overload;
    function Execute(const ScriptProvider: IScriptProvider; var Reason: TScriptExecutionReason): IScriptExecution; overload;

    // The script class type map is used to map a script class type to a Delphi class type.
    // For instance when creating the script object returned by the script side TComponent.Components[] we would like the
    // script object to have the correct type (e.g. TButton, TEdit, etc) and not just be represented as a TComponent.
    procedure RegisterClassTypeMapping(DelphiClassType: TClass; const ScriptClassType: string); overload;
    procedure RegisterClassTypeMapping(DelphiClassType: TClass); overload;
    function FindScriptClassType(Instance: TObject; const Default: string): string;

    function GetPackages: IScriptPackageList;
    property Packages: IScriptPackageList read GetPackages;

    function ExecutePackage(const Package: IScriptPackage; var Reason: TScriptExecutionReason): IScriptExecution;
    function CreateTemporaryPackage(const AFilename: string; APackageKind: TScriptPackageKind): IScriptPackage;

    function GetExecutions: IScriptExecutionList;
    property Executions: IScriptExecutionList read GetExecutions;
  public
  end;


// -----------------------------------------------------------------------------
//
// TScriptExecutions
//
// -----------------------------------------------------------------------------
  TScriptExecutions = class(TInterfacedObject, IScriptExecutionList, IScriptExecutions)
  private
    FItems: TDictionary<IScriptExecution, string>;
  protected
    function GetCount: integer;
    function GetItem(Index: integer): IScriptExecution;
  public
    constructor Create;
    destructor Destroy; override;

    // IScriptExecutionList
    procedure Add(const Item: IScriptExecution); overload;
    procedure Add(const Item: IScriptExecution; const ScriptID: string); overload;
    procedure Remove(const Item: IScriptExecution);
    procedure Clear;
    function FindByScriptID(const ScriptID: string): IScriptExecution;
    procedure Finalize;

    // IScriptExecutions
    property Item[Index: integer]: IScriptExecution read GetItem; default;
    property Count: integer read GetCount;
    function GetEnumerator: TEnumerator<IScriptExecution>;
    function Find(const Execution: IdwsProgramExecution): IScriptExecution;
    function Contains(const Execution: IScriptExecution): boolean; overload;
    function Contains(const Execution: IdwsProgramExecution): boolean; overload;
  end;

const
  sScriptMarker = '#dwscript';

{$ifdef FEATURE_COPY_PROTECT}
  sScriptObfuscationPatternBegin = '{$region protected content}';
  sScriptObfuscationPatternEnd = '{$endregion protected content}';
  // Version 0: Obsolete and unused first version
  // Version 1: Binary TWriter/TReader stream
  ScriptContentProtectionVersion = 1;
  ScriptContentProtectionCipher = 0;
{$endif FEATURE_COPY_PROTECT}


// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

implementation

{$R *.dfm}

uses
  Variants,
  Dialogs,
  Controls, // mrCancel
  Forms,

  dwsXPlatform,
  dwsMagicExprs,
  dwsExprList,
  dwsJSON,
  dwsStrings,
{$ifndef OLD_DWSCRIPT}
  dwsScriptSource,
  dwsInfoClasses,
  dwsCompilerContext,
{$else OLD_DWSCRIPT}
  dwsUnitSymbols,
  dwsInfo,
{$endif OLD_DWSCRIPT}
  dwsRTTIFunctions,

  IOUtils,

  amDialogs,
  amVersionInfo,

  amScript.Editor.API,
  amScript.FileSystem.API,
  amScript.FileSystem,
  amScript.Host.FileSystem,
  amScript.Package,
  amScript.Provider,
  amScript.Environment,
{$ifdef FEATURE_SCRIPT_BUNDLE}
  amScript.DebuggerDialogBundleBuilder,
{$endif FEATURE_SCRIPT_BUNDLE}
{$ifdef FEATURE_LICENSING}
  amLicenseService,
{$else FEATURE_LICENSING}
  amScript.LicenseService.API,
{$endif FEATURE_LICENSING}
  amScript.ExternalFunctionManager;


const
  mrHalt = -1;
  mrDebug = -2;

// -----------------------------------------------------------------------------
// TLicensedScript
// -----------------------------------------------------------------------------
type
  TLicensedScript = class(TInterfacedObject, IScriptLicensedContent)
  private
    FProductID: string;
  protected
    // IScriptLicensedContent
    function GetProductID: string;
    function PopulateLicenseInfo(const ContentLicenseInfo: IScriptContentLicenseInfo): boolean;
    function CreateContentLicense(const ContentLicenseInfo: IScriptContentLicenseInfo): IScriptContentLicense;
    procedure UnloadUnlicensedContent;
  public
    constructor Create(AProductID: string);
  end;

constructor TLicensedScript.Create(AProductID: string);
begin
  inherited Create;
  FProductID := AProductID;
end;

function TLicensedScript.CreateContentLicense(const ContentLicenseInfo: IScriptContentLicenseInfo): IScriptContentLicense;
begin
  Result := nil;
end;

function TLicensedScript.GetProductID: string;
begin
  Result := FProductID;
end;

function TLicensedScript.PopulateLicenseInfo(const ContentLicenseInfo: IScriptContentLicenseInfo): boolean;
begin
  Result := False;
end;

procedure TLicensedScript.UnloadUnlicensedContent;
begin
end;


// -----------------------------------------------------------------------------
//
// TScriptProgramInfo
//
// -----------------------------------------------------------------------------
type
  TScriptProgramInfo = class(TInterfacedObject, IScriptProgramInfo)
  private
    FProgramInfo: TProgramInfo;
  protected
    function GetProgramInfo: TProgramInfo;
    property ProgramInfo: TProgramInfo read GetProgramInfo;

    function GetInfo(const ScriptObject: IScriptObj): IInfo;
  public
    constructor Create(AProgramInfo: TProgramInfo);
    destructor Destroy; override;
  end;

constructor TScriptProgramInfo.Create(AProgramInfo: TProgramInfo);
begin
  inherited Create;
  FProgramInfo := AProgramInfo;
end;

destructor TScriptProgramInfo.Destroy;
begin
  FProgramInfo.Execution.ReleaseProgramInfo(FProgramInfo);
  inherited;
end;

function TScriptProgramInfo.GetInfo(const ScriptObject: IScriptObj): IInfo;
var
  Data: TData;
begin
  SetLength(Data, 1);
  Data[0] := ScriptObject;
  CreateInfoOnSymbol(Result, FProgramInfo, ScriptObject.ClassSym, Data, 0);
end;

function TScriptProgramInfo.GetProgramInfo: TProgramInfo;
begin
  Result := FProgramInfo;
end;

// -----------------------------------------------------------------------------
//
// TScriptExecution
//
// -----------------------------------------------------------------------------
type
  TScriptExecution = class(TInterfacedObject, IScriptExecution)
  private
    FContext: IScriptContext;
    FExecution: IdwsProgramExecution;
    FExecutionNotification: IScriptExecutionNotification; // A bit of a design hack. We need this in order to auto-uninstall script packages.
    FFinalizing: boolean;
  protected

    // IScriptExecution
    procedure Execute(const ScriptProvider: IScriptProvider = nil);
    function AcquireProgramInfo: IScriptProgramInfo;
    procedure Finalize;

    function GetContext: IScriptContext;
    property Context: IScriptContext read GetContext;

    function GetProgramInfo: TProgramInfo;
    property ProgramInfo: TProgramInfo read GetProgramInfo;

    function GetExecution: IdwsProgramExecution;
    property Execution: IdwsProgramExecution read GetExecution;

    function GetExecutionNotification: IScriptExecutionNotification;
    property ExecutionNotification: IScriptExecutionNotification read GetExecutionNotification;
  public
    constructor Create(const AContext: IScriptContext; const AExecution: IdwsProgramExecution; const AExecutionNotification: IScriptExecutionNotification = nil);
    destructor Destroy; override;

    class function HandleErrors(Execution: IdwsProgramExecution; ScriptProvider: IScriptProvider = nil): boolean;
    class procedure HaltScript(Execution: IdwsProgramExecution);
  end;

function TScriptExecution.AcquireProgramInfo: IScriptProgramInfo;
var
  ProgramInfo: TProgramInfo;
begin
  ProgramInfo := TdwsProgramExecution(Execution).AcquireProgramInfo(nil);
  Result := TScriptProgramInfo.Create(ProgramInfo);
end;

constructor TScriptExecution.Create(const AContext: IScriptContext; const AExecution: IdwsProgramExecution; const AExecutionNotification: IScriptExecutionNotification);
begin
  inherited Create;
  FContext := AContext;
  FExecution := AExecution;
  FExecutionNotification := AExecutionNotification;
end;

destructor TScriptExecution.Destroy;
begin
  Finalize;
  inherited;
end;

procedure TScriptExecution.Execute(const ScriptProvider: IScriptProvider);
var
  s: string;
begin
  if (ScriptProvider <> nil) then
    ScriptTrace('Script Execute >>>', ScriptProvider.ScriptName)
  else
    ScriptTrace('Script Execute >>>');
  try
    Execution.RunProgram(0);

    s := Execution.Result.ToString;
    if (s <> '') then
      MessageDlgEx(s, mtInformation, [mbOK], 0);

    if (Execution.Msgs.HasErrors) then
      HandleErrors(Execution, ScriptProvider);

  except
    on E: Exception do
      MessageTaskDlgEx('Script error', E.Message + '|' + E.ClassName, mtError, [mbOK]);
  end;
  if (ScriptProvider <> nil) then
    ScriptTrace('Script Execute <<<', ScriptProvider.ScriptName)
  else
    ScriptTrace('Script Execute <<<');

  // Terminate if Halt() was called or there's no pending finalization
  if (Execution <> nil) and ((Execution.Prog.ProgramObject.FinalExpr = nil) or ((Execution.ExecutionObject <> nil) and (Execution.ExecutionObject.Status = esrExit))) then
    Finalize;
end;

//type
//  TProgramExecutionCracker = class(TdwsProgramExecution);

procedure TScriptExecution.Finalize;
{$ifdef DEBUG}
(*
var
  ScriptObj, so: TScriptObj;
  s: string;
  Count: integer;
*)
{$endif DEBUG}
begin
  if (FExecution = nil) or (FFinalizing) then
    exit;

  ScriptTrace('Script Execution finalize >>>');

{$ifdef DEBUG}
(*
  Disabled: It's perfectly normal for some scripts objects to be alive at this point if we're
   freeing them at finalization.

  if (FExecution.ObjectCount > 0) then
  begin
    Count := 0;
    ScriptObj := TScriptObj.Create;
    try
      TProgramExecutionCracker(TdwsProgramExecution(Execution)).ScriptObjCreated(ScriptObj);
      try
        so := ScriptObj.PrevObject;
        while (so <> nil) and (so <> ScriptObj) do
        begin
          if (so is TScriptObjInstance) then
          begin
            if (not TScriptObjInstance(so).Destroyed) then
            begin
              inc(Count);
              s := s + #13 + TScriptObjInstance(so).ToString + ' representing ';
              if (TScriptObjInstance(so).ExternalObject <> nil) then
              begin
                try
                  s := s + TScriptObjInstance(so).ExternalObject.ClassName;
                except
                  s := s + 'a deleted object :-('
                end;
              end else
                s := s + 'something...?';
            end;// else
            //  s := s + 'destroyed object';
          end else
            s := s + #13 + so.ClassName;
          so := so.PrevObject;
        end;
      finally
        TProgramExecutionCracker(TdwsProgramExecution(Execution)).ScriptObjDestroyed(ScriptObj);
      end;
    finally
      ScriptObj.Free;
    end;
    if (Count > 0) then
      MessageTaskDlgEx('Script', Format('Leaked script objects: %d' + s, [Count]), mtInformation, [mbOK]);
  end;
*)
{$endif DEBUG}

  // Prevent recursion via Execution.EndProgram->notification->Finalize
  FFinalizing := True;

  if (FExecution.ProgramState in [psRunning, psRunningStopped]) then
    FExecution.EndProgram;

  FExecution := nil;
  FExecutionNotification := nil;
  FContext := nil;

  ScriptTrace('Script Execution finalize <<<');
end;

function TScriptExecution.GetContext: IScriptContext;
begin
  Result := FContext;
end;

function TScriptExecution.GetExecution: IdwsProgramExecution;
begin
  Result := FExecution;
//  Prevents search of execution list while execution is .Finalizing
//  if (Result = nil) then
//    raise Exception.Create('Script execution has ended. Context is no longer valid.');
end;

function TScriptExecution.GetExecutionNotification: IScriptExecutionNotification;
begin
  Result := FExecutionNotification;
end;

function TScriptExecution.GetProgramInfo: TProgramInfo;
begin
  Result := Execution.Info;
end;

class procedure TScriptExecution.HaltScript(Execution: IdwsProgramExecution);
var
  FinalExpr: TBlockFinalExpr;
begin
  Execution.Stop;
  FinalExpr := Execution.Prog.ProgramObject.FinalExpr;
  Execution.Prog.ProgramObject.FinalExpr := nil;
  FinalExpr.Free; // Avoid finalization being executed (which it won't anyway since executon has been stopped (it'll raise an exception instead))
end;

class function TScriptExecution.HandleErrors(Execution: IdwsProgramExecution; ScriptProvider: IScriptProvider): boolean;
var
  i: integer;
  ErrorCount, ErrorIndex: integer;
  TaskDialog: TTaskDialog;
  Environment: IScriptEnvironment;
  Messages: TdwsRuntimeMessageList;
begin
  Result := False;
  if (Execution = nil) then
    exit;

  Messages := Execution.Msgs;

  ErrorCount := 0;
  for i := 0 to Messages.Count-1 do
    if (Messages[i].IsError) then
      Inc(ErrorCount);

  if (ErrorCount = 0) then
    exit;

  Environment := Execution.Environment as IScriptEnvironment;

  TaskDialog := TTaskDialog.Create(nil);
  try
    ErrorIndex := 0;
    for i := 0 to Messages.Count-1 do
      if (Messages[i].IsError) then
      begin
        Result := True;
        inc(ErrorIndex);

        TaskDialog.Caption := 'Script run time error';
        TaskDialog.Title := 'A Script caused an error.';
        if (ErrorCount > 1) then
          TaskDialog.Text := Format('Error %d of %d', [ErrorIndex, ErrorCount]) + #13#13 + Messages[i].Text
        else
          TaskDialog.Text := Messages[i].Text;

        TaskDialog.Buttons.Clear;

        begin
          var Button := TTaskDialogButtonItem(TaskDialog.Buttons.Add);
          Button.Caption := 'Continue';
          Button.ModalResult := mrAbort;
          if (Execution.Prog.ProgramObject.FinalExpr <> nil) then
            Button.CommandLinkHint := 'Execute finalizations and then terminate.';
        end;

        if (Execution.Prog.ProgramObject.FinalExpr <> nil) then
        begin
          var Button := TTaskDialogButtonItem(TaskDialog.Buttons.Add);
          Button.Caption := 'Halt';
          Button.ModalResult := mrHalt;
          Button.CommandLinkHint := 'Stop without executing finalizations.';
        end;

        if (i < Messages.Count-1) then
        begin
          var Button := TTaskDialogButtonItem(TaskDialog.Buttons.Add);
          Button.Caption := 'Ignore';
          Button.ModalResult := mrIgnore;
          Button.CommandLinkHint := 'Proceed to next error.';
        end;

        // TODO : Check for "view source" rights
        if (ScriptProvider = nil) or (not ScriptProvider.Protected) then
          if (Messages[i] is TScriptMessage) and (TScriptMessage(Messages[i]).ScriptPos.Defined) then
          begin
            var Button := TTaskDialogButtonItem(TaskDialog.Buttons.Add);
            Button.Caption := 'Debug';
            Button.ModalResult := mrDebug;
            Button.CommandLinkHint := 'View script source.';
          end;

        TaskDialog.ExpandedText := Messages[i].AsInfo;
        TaskDialog.Flags := [tfUseCommandLinks, tfAllowDialogCancellation, tfExpandFooterArea];
        TaskDialog.MainIcon := tdiWarning;

        // Note: We must specify parent handle or the current active form handle will be used. In case the splash is
        // visible its handle will be used and the dialog will be closed when the splash timer expires.
        if (not TaskDialog.Execute(Application.MainForm.Handle)) then
          break;

        if (TaskDialog.ModalResult = mrAbort) or (TaskDialog.ModalResult = mrCancel) then
          break;

        if (TaskDialog.ModalResult = mrHalt) then
        begin
          HaltScript(Execution);
          break;
        end;

        if (TaskDialog.ModalResult = mrIgnore) then
          continue;

        if (TaskDialog.ModalResult = mrDebug) then
        begin
          HaltScript(Execution);
          if (ScriptProvider = nil) then
            ScriptProvider := TStaticScriptProvider.Create(TScriptMessage(Messages[i]).ScriptPos.SourceFile.Name, TScriptMessage(Messages[i]).ScriptPos.SourceFile.Code);
          ScriptService.Edit(Environment.Document, Environment.Item, ScriptProvider, Messages, i);
          break;
        end;
      end;
  finally
    TaskDialog.Free;
  end;
end;


// -----------------------------------------------------------------------------
//
// TScriptContext
//
// -----------------------------------------------------------------------------
type
  IScriptContextEventSink = interface
    procedure Unsubscribe;
  end;

  TScriptContext = class(TInterfacedObject, IScriptContext, IScriptContextFileSystems)
  private
    FDelphiWebScript: TDelphiWebScript;
    FDocument: IScriptHostDocument;
    FItem: TObject;
    FDocumentEventSink: IScriptContextEventSink;
    FScriptProgram: IdwsProgram;
    FRuntimeFileSystem: TScriptFileSystemFactory;
    FCompilerFileSystem: TScriptFileSystemFactory;
    FExternalFunctionsManager: IdwsExternalFunctionsManager;
  protected
    function HandleErrors(ScriptProvider: IScriptProvider; const Script: string): boolean;
    // IScriptContext
    function Compile(const ScriptProvider: IScriptProvider; Interactive: boolean; Debug: boolean): boolean;
    function BeginExecution(const ScriptProvider: IScriptProvider; const AExecutionNotification: IScriptExecutionNotification = nil): IScriptExecution;

    // Reset: Clear the existing compilation context (the compiled program).
    // Without a call to Reset, a subsequent call to Compile will perform the
    // compilation in the context of the existing program (i.e. RecompileInContext).
    procedure Reset;

    // Clear: Clear the compiler message output.
    procedure Clear;

    function GetProgram: IdwsProgram;
    // IScriptContextFileSystems
    function RuntimeFileSystem: TdwsCustomFileSystem;
    function CompilerFileSystem: TdwsCustomFileSystem;
  public
    constructor Create(ADelphiWebScript: TDelphiWebScript; const ADocument: IScriptHostDocument = nil; AItem: TObject = nil; AForDebug: boolean = False);
    destructor Destroy; override;
  end;

  TScriptContextEventSink = class(TInterfacedObject, IScriptContextEventSink, IScriptHostDocumentNotification, IScriptHostDocumentCloseNotification)
  private
    FDocument: IScriptHostDocument;
    FItem: TObject;
  protected
    // IScriptContextEventSink
    procedure Unsubscribe;
    // IScriptHostDocumentNotification
    procedure HostDocumentNotify(const Document: IScriptHostDocument; Notification: TScriptHostDocumentNotification);
    // IScriptHostDocumentCloseNotification
    procedure HostDocumentCloseQuery(const Document: IScriptHostDocument; var CanClose: boolean);
  public
    constructor Create(const ADocument: IScriptHostDocument; AItem: TObject);
    destructor Destroy; override;
  end;

constructor TScriptContextEventSink.Create(const ADocument: IScriptHostDocument; AItem: TObject);
begin
  inherited Create;
  FDocument := ADocument;
  FItem := AItem;
  if (FDocument <> nil) then
    FDocument.Subscribe(Self);
end;

destructor TScriptContextEventSink.Destroy;
begin
  Unsubscribe;
  inherited;
end;

procedure TScriptContextEventSink.HostDocumentCloseQuery(const Document: IScriptHostDocument; var CanClose: boolean);
begin
  if (Document = FDocument) then
  begin
    CanClose := False;
    MessageDlgEx('Document can not be closed while it has scripts that are being edited', mtWarning, [mbOK], -1);
  end;
end;

procedure TScriptContextEventSink.HostDocumentNotify(const Document: IScriptHostDocument; Notification: TScriptHostDocumentNotification);
begin
  case Notification of
    TScriptHostDocumentNotification.notifyShutdown: // Should never happen
      Unsubscribe;

    TScriptHostDocumentNotification.notifyUnsubscribe:
      FDocument := nil;
  end;
end;

procedure TScriptContextEventSink.Unsubscribe;
begin
  if (FDocument <> nil) then
  begin
    FDocument.Unsubscribe(Self);
    FDocument := nil;
  end;
end;

constructor TScriptContext.Create(ADelphiWebScript: TDelphiWebScript; const ADocument: IScriptHostDocument; AItem: TObject; AForDebug: boolean);
(*
var
  ScriptFolder: TScriptFolder;
  Folder: string;
*)
begin
  inherited Create;
  FDocument := ADocument;
  FItem := AItem;
  FDelphiWebScript := ADelphiWebScript;

  FRuntimeFileSystem := TScriptHostFileSystemFactory.Create(FDocument);
  FCompilerFileSystem := TScriptHostFileSystemFactory.Create(FDocument, True);

  FRuntimeFileSystem.SearchPath.Add('.\'); // Relative to root
  FCompilerFileSystem.SearchPath.Add('.\');

  FRuntimeFileSystem.SearchPath.Add('\'); // Attachments
  FCompilerFileSystem.SearchPath.Add('\');

(*
  for ScriptFolder := High(TScriptFolder) downto Low(TScriptFolder) do
  begin
    Folder := GlobalOptions.ScriptFolder[ScriptFolder];
    FCompilerFileSystem.SearchPath.Add(Folder);
  end;
*)

  if (FDocument <> nil) and (AForDebug) then
    FDocumentEventSink := TScriptContextEventSink.Create(FDocument, FItem);
end;

destructor TScriptContext.Destroy;
begin
  FExternalFunctionsManager := nil;
  FScriptProgram := nil;
  FRuntimeFileSystem.Free;
  FCompilerFileSystem.Free;
  if (FDocumentEventSink <> nil) then
  begin
    FDocumentEventSink.Unsubscribe;
    FDocumentEventSink := nil;
  end;
  FDocument := nil;

  inherited;
end;

function TScriptContext.BeginExecution(const ScriptProvider: IScriptProvider; const AExecutionNotification: IScriptExecutionNotification): IScriptExecution;
var
  Execution: IdwsProgramExecution;
  FileSystem: IdwsFileSystem;
  ScriptFileSys: IScriptFileSystem;
begin
  ScriptTrace('Script context BeginExecution', ScriptProvider.ScriptName);
  if (FScriptProgram = nil) then
  begin
    Result := nil;
    exit;
  end;

  if (FScriptProgram.Msgs.HasErrors) then
  begin
    Result := nil;
    exit;
  end;

  try

    FileSystem := ScriptProvider.CreateFileSystem;
    if (FileSystem = nil) or (not Supports(FileSystem, IScriptFileSystem, ScriptFileSys)) then
      ScriptFileSys := nil;
    FCompilerFileSystem.SetRootFileSystem(ScriptFileSys);
    try

      FRuntimeFileSystem.SetRoot(ScriptProvider.Folder);
      FRuntimeFileSystem.SetRootFileSystem(ScriptFileSys);
      FScriptProgram.ProgramObject.RuntimeFileSystem := FRuntimeFileSystem;

      // Do not use Context.BeginNewExecution here. BeginNewExecution calls BeginProgram and we need to set up the
      // environment before BeginProgram is called.
      Execution := FScriptProgram.CreateNewExecution;

      // Set up context
      Execution.Environment := TScriptEnvironment.Create(ScriptHostApplication, FDocument, FItem);
      // Execute initialization
      Execution.BeginProgram;

      // Execution.BeginProgram can cause run time errors if unit has initialization section
      if (Execution.Msgs.HasErrors) then
      begin
        TScriptExecution.HandleErrors(Execution, ScriptProvider);
        try
          if (Execution.ProgramState = psRunning) then
          begin
            Execution.Msgs.Clear;
            Execution.EndProgram;
            TScriptExecution.HaltScript(Execution);
            if (Execution.Msgs.HasErrors) then
              TScriptExecution.HandleErrors(Execution, ScriptProvider);
          end;
        except
          TScriptExecution.HaltScript(Execution);
        end;
        Execution := nil;
        Result := nil;
        exit;
      end;

    finally
      FCompilerFileSystem.SetRootFileSystem(nil);
    end;

  except
    on E: Exception do
    begin
      MessageTaskDlgEx('Script error', E.ClassName + ': ' + E.Message, mtWarning, [mbOK], 0);
      if (Execution <> nil) then
        Execution.Stop;
      Execution := nil;
      Result := nil;
      exit;
    end;
  end;
  Result := TScriptExecution.Create(Self, Execution, AExecutionNotification);
end;

function TScriptContext.GetProgram: IdwsProgram;
begin
  Result := FScriptProgram;
end;

function TScriptContext.RuntimeFileSystem: TdwsCustomFileSystem;
begin
  Result := FRuntimeFileSystem;
end;

function TScriptContext.CompilerFileSystem: TdwsCustomFileSystem;
begin
  Result := FCompilerFileSystem;
end;

function TScriptContext.HandleErrors(ScriptProvider: IScriptProvider; const Script: string): boolean;
var
  i: integer;
  ErrorCount, ErrorIndex: integer;
  TaskDialog: TTaskDialog;
  s: string;
begin
  Result := False;
  if (FScriptProgram = nil) then
    exit;

  ErrorCount := 0;
  for i := 0 to FScriptProgram.Msgs.Count-1 do
    if (FScriptProgram.Msgs[i].IsError) then
      Inc(ErrorCount);

  if (ErrorCount = 0) then
    exit;

  TaskDialog := TTaskDialog.Create(nil);
  try
    ErrorIndex := 0;
    for i := 0 to FScriptProgram.Msgs.Count-1 do
      if (FScriptProgram.Msgs[i].IsError) then
      begin
        Result := True;
        inc(ErrorIndex);

        TaskDialog.Caption := 'Script error';
        TaskDialog.Title := 'A Script failed to compile.';
        if (ErrorCount > 1) then
          TaskDialog.Text := Format('Error %d of %d', [ErrorIndex, ErrorCount]) + #13#13 + FScriptProgram.Msgs[i].Text
        else
          TaskDialog.Text := FScriptProgram.Msgs[i].Text;

        TaskDialog.Buttons.Clear;

        begin
          var Button := TTaskDialogButtonItem(TaskDialog.Buttons.Add);
          Button.Caption := 'Abort';
          Button.ModalResult := mrAbort;
          Button.Default := True;
        end;

        if (i < FScriptProgram.Msgs.Count-1) then
        begin
          var Button := TTaskDialogButtonItem(TaskDialog.Buttons.Add);
          Button.Caption := 'Ignore';
          Button.ModalResult := mrIgnore;
          Button.CommandLinkHint := 'Proceed to next error.';
        end;

        // TODO : Check for "view source" rights
        if (ScriptProvider = nil) or (not ScriptProvider.Protected) then
          if (FScriptProgram.Msgs[i] is TScriptMessage) then
          begin
            var Button := TTaskDialogButtonItem(TaskDialog.Buttons.Add);
            Button.Caption := 'Debug';
            Button.ModalResult := mrDebug;
            Button.CommandLinkHint := 'View script source.';
          end;

        TaskDialog.ExpandedText := FScriptProgram.Msgs[i].AsInfo;;
        TaskDialog.Flags := [tfUseCommandLinks, tfAllowDialogCancellation, tfExpandFooterArea];
        TaskDialog.MainIcon := tdiWarning;

        // Note: We must specify parent handle or the current active form handle will be used. In case the splash is
        // visible its handle will be used and the dialog will be closed when the splash timer expires.
        if (not TaskDialog.Execute(Application.MainForm.Handle)) then
          break;

        if (TaskDialog.ModalResult = mrAbort) or (TaskDialog.ModalResult = mrCancel) then
          break;

        if (TaskDialog.ModalResult = mrIgnore) then
          continue;

        if (TaskDialog.ModalResult = mrDebug) then
        begin
          if (ScriptProvider = nil) then
          begin
            s := SYS_MainModule;
            ScriptProvider := TStaticScriptProvider.Create(s, Script);
          end;
          ScriptService.Edit(FDocument, nil, ScriptProvider, FScriptProgram.Msgs, i);
          break;
        end;
      end;
  finally
    TaskDialog.Free;
  end;
end;

procedure TScriptContext.Reset;
begin
  FScriptProgram := nil;
end;

procedure TScriptContext.Clear;
begin
  if (FScriptProgram <> nil) then
    FScriptProgram.Msgs.Clear;
end;

function TScriptContext.Compile(const ScriptProvider: IScriptProvider; Interactive: boolean; Debug: boolean): boolean;
var
  FileSystem: IdwsFileSystem;
  ScriptFileSys: IScriptFileSystem;
begin
  ScriptTrace('Script Compile', ScriptProvider.ScriptName);
  FDelphiWebScript.Config.CompileFileSystem := FCompilerFileSystem;
  try

    FileSystem := ScriptProvider.CreateFileSystem;
    if (FileSystem = nil) or (not Supports(FileSystem, IScriptFileSystem, ScriptFileSys)) then
      ScriptFileSys := nil;
    FCompilerFileSystem.SetRootFileSystem(ScriptFileSys);
    try
      FCompilerFileSystem.SetRoot(ScriptProvider.Folder);
      // Need to set runtime too in case we execute program directly via FScriptProgram (debugger does this)
      FRuntimeFileSystem.SetRootFileSystem(ScriptFileSys);
      FRuntimeFileSystem.SetRoot(ScriptProvider.Folder);

      if (Debug) then
        FDelphiWebScript.Config.CompilerOptions := FDelphiWebScript.Config.CompilerOptions + [coSymbolDictionary, coContextMap];
      try
        FDelphiWebScript.Compiler.ExternalFunctionsManager := TScriptExternalFunctionManager.Create;
        try

          if (FScriptProgram = nil) then
            FScriptProgram := FDelphiWebScript.Compile(ScriptProvider.GetScript)
          else
            FDelphiWebScript.RecompileInContext(FScriptProgram, ScriptProvider.GetScript);

        finally
          FDelphiWebScript.Compiler.ExternalFunctionsManager := nil;
        end;
      finally
        if (Debug) then
          FDelphiWebScript.Config.CompilerOptions := FDelphiWebScript.Config.CompilerOptions - [coSymbolDictionary, coContextMap];
      end;
    finally
      FCompilerFileSystem.SetRootFileSystem(nil);
    end;

  except
    on E: ECompileError do
    begin
      MessageTaskDlgEx('Script compilation error', E.Message + '|' + E.ClassName, mtWarning, [mbOK]);
      FScriptProgram := nil;
    end;
  end;

  Result := (not Interactive) or (not HandleErrors(ScriptProvider, ''));
end;


// -----------------------------------------------------------------------------
//
// TDataModuleScriptService
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptService.DataModuleCreate(Sender: TObject);
begin
  FClassTypeMap := TScriptClassTypeMap.Create;
  FModules := TList<IScriptModule>.Create;
  DelphiWebScript.Config.ScriptPaths.Clear;
  DelphiWebScript.Config.ScriptPaths.Add(''); // Must have at least one or debugger will bomb.
  if (sScriptHostConditionalDefine <> '') then
    DelphiWebScript.Config.Conditionals.Add(sScriptHostConditionalDefine);

  TScriptModule.PopulateScriptEnum(dwsUnitScriptService, 'TScriptExecutionResult', TypeInfo(TScriptExecutionReason));
  TScriptModule.PopulateScriptEnum(dwsUnitScriptService, 'TScriptPackageKind', TypeInfo(TScriptPackageKind));
end;

procedure TDataModuleScriptService.DataModuleDestroy(Sender: TObject);
begin
  if (FModules <> nil) then
    FModules.Clear;
  FModules.Free;
  FClassTypeMap.Free;
end;

// -----------------------------------------------------------------------------

function TDataModuleScriptService.CreateTemporaryPackage(const AFilename: string; APackageKind: TScriptPackageKind): IScriptPackage;
begin
  Result := TScriptPackage.Create(AFilename, APackageKind);
end;

// -----------------------------------------------------------------------------

function TDataModuleScriptService.DoDebug(const ADocument: IScriptHostDocument; AItem: TObject; const ScriptProvider: IScriptProvider; const AExecution: IdwsProgramExecution; Messages: TdwsMessageList; MsgIndex: integer): boolean;
var
  ScriptDebuggerSetup: IScriptDebuggerSetup;
  Environment: IdwsEnvironment;
  Editor: IScriptEditor;
begin
  if (ScriptProvider <> nil) and (ScriptProvider.Protected) then
  begin
    ShowMessage('Script source is not accessible');
    Exit(False);
  end;

  if (not Supports(ADocument, IdwsEnvironment, Environment)) then
    Environment := nil;

//  FDocument := ADocument;
//  FItem := AItem;

  if (FDebugger = nil) then
  begin
    // Create debugger via Application.CreateForm if user has specified
    // that debugger will be the main form.
    if (ScriptHostApplication = nil) and (ScriptDebuggerIsApplication) and (Application.MainForm = nil) then
      FDebugger := ScriptDebuggerFactory.CreateDebugger(Self, True)
    else
      FDebugger := ScriptDebuggerFactory.CreateDebugger(Self, False);

    if (not Supports(FDebugger, IScriptDebuggerSetup, ScriptDebuggerSetup)) then
      raise Exception.Create('Required interface not supported by script debugger: IScriptDebuggerSetup');

    ScriptDebuggerSetup.SetEnvironment(Environment);

    FDebuggerFileSystems := CreateContext(ADocument, AItem, True) as IScriptContextFileSystems;

    DelphiWebScript.Config.RuntimeFileSystem := FDebuggerFileSystems.RuntimeFileSystem;
    DelphiWebScript.Config.CompileFileSystem := FDebuggerFileSystems.CompilerFileSystem;

    Editor := FDebugger.CreateEditor(ScriptProvider);
  end else
  begin
    if (not Supports(FDebugger, IScriptDebuggerSetup, ScriptDebuggerSetup)) then
      raise Exception.Create('Required interface not supported by script debugger: IScriptDebuggerSetup');

    if (ScriptProvider <> nil) then
      Editor := FDebugger.CreateEditor(ScriptProvider);
  end;

  //Editor.CanClose := False;

  if (AExecution <> nil) then
  begin
    Result := ScriptDebuggerSetup.AttachAndExecute(AExecution);
  end else
  begin
    if (Messages <> nil) then
    begin
      FDebugger.AddMessageInfo(Messages, MsgIndex);

      if (MsgIndex <> -1) and (Messages.Msgs[MsgIndex] is TScriptMessage) then
        FDebugger.ViewScriptPos(TScriptMessage(Messages.Msgs[MsgIndex]).ScriptPos);
    end;

    Result := ScriptDebuggerSetup.Execute;
  end;
end;

function TDataModuleScriptService.CanEdit: boolean;
begin
  Result := (FDebugger <> nil) or (ScriptDebuggerFactory.CanCreateDebugger);
end;

function TDataModuleScriptService.Edit(const Filename: string): boolean;
var
  ScriptProvider: IScriptProvider;
begin
{$ifdef FEATURE_SCRIPT_BUNDLE}
  if (AnsiSameText(TPath.GetExtension(Filename), sScriptBundleFileType)) then
    Result := EditBundle(Filename)
  else
{$endif FEATURE_SCRIPT_BUNDLE}
  begin
    ScriptProvider := TFileScriptProvider.Create(Filename);

    Result := DoDebug(nil, nil, ScriptProvider);
  end;
end;

function TDataModuleScriptService.Edit(const ScriptProvider: IScriptProvider): boolean;
begin
  Result := DoDebug(nil, nil, ScriptProvider);
end;

{$ifdef FEATURE_SCRIPT_BUNDLE}
function TDataModuleScriptService.EditBundle(const Filename: string): boolean;
var
  FormBundleBuilder: TFormBundleBuilder;
begin
  FormBundleBuilder := TFormBundleBuilder.Create(nil);
  try
    Result := FormBundleBuilder.Execute(Filename);
  finally
    FormBundleBuilder.Free;
  end;
end;
{$endif FEATURE_SCRIPT_BUNDLE}

function TDataModuleScriptService.Execute(const Filename: string; var Reason: TScriptExecutionReason): IScriptExecution;
var
  ScriptPackage: IScriptPackage;
  ScriptKnownPackage: IScriptPackage;
begin
  ScriptKnownPackage := FPackages.FindByFilename(Filename);
  if (ScriptKnownPackage <> nil) then
    ScriptPackage := ScriptKnownPackage
  else
    ScriptPackage := FPackages.Add(Filename);
  try
    // Execute script
    Reason := irUnknown;
    Result := ExecutePackage(ScriptPackage, Reason);
  finally
    // Remove package
    if (ScriptKnownPackage = nil) then
      FPackages.Remove(ScriptPackage);
  end;
end;

function TDataModuleScriptService.Execute(const ScriptProvider: IScriptProvider; var Reason: TScriptExecutionReason): IScriptExecution;
var
  Context: IScriptContext;
begin
  ASSERT(ScriptProvider <> nil);
  ScriptTrace('Script ExecuteProvider >>>', ScriptProvider.ScriptName);
  Result := nil;
  Reason := irUnknown;

  Context := CreateContext;
  if (not Context.Compile(ScriptProvider, True)) then
  begin
    Reason := irCompile;
    exit;
  end;

  Result := Context.BeginExecution(ScriptProvider, nil);
  if (Result = nil) then
    exit;

  Executions.Add(Result, '');
  try

    Result.Execute(ScriptProvider);

  except
    Result := nil;
    raise;
  end;

  Reason := irSuccess;

  ScriptTrace('Script ExecuteProvider <<<', ScriptProvider.ScriptName);
end;

function TDataModuleScriptService.ExecutePackage(const Package: IScriptPackage; var Reason: TScriptExecutionReason): IScriptExecution;
var
{$ifdef FEATURE_LICENSING}
  LicensedContent: IScriptLicensedContent;
  ContentLicense: IScriptContentLicense;
{$endif FEATURE_LICENSING}
  ScriptProvider: IScriptProvider;
  Context: IScriptContext;
  ExecutionNotification: IScriptExecutionNotification;
begin
  ASSERT(Package <> nil);
  ScriptTrace('Script ExecutePackage >>>', Package.PluginName);
  Result := nil;
  Reason := irUnknown;

  try
    try

    // Acquire execution license
{$ifdef FEATURE_LICENSING}
    if (Supports(Package, IScriptLicensedContent, LicensedContent)) then
    begin
      ContentLicense := LicenseManager.AcquireContentLicense(LicensedContent);
      if (ContentLicense <> nil) and (ContentLicense.LicenseRequired) and (not ContentLicense.LicenseAcquired) then
      begin
        Reason := irLicense;
        exit;
      end;
    end;
{$endif FEATURE_LICENSING}

    ScriptProvider := Package.CreateScriptProvider;

    Context := CreateContext;
  if (not Context.Compile(ScriptProvider, True)) then
    begin
      Reason := irCompile;
      exit;
    end;

    if (not Supports(Package, IScriptExecutionNotification, ExecutionNotification)) then
      ExecutionNotification := nil;

    Result := Context.BeginExecution(ScriptProvider, ExecutionNotification);
    if (Result = nil) then
      exit;

    Executions.Add(Result, Package.PluginID);
    try

      Result.Execute(ScriptProvider);

    except
      Executions.Remove(Result);
      Result := nil;
      raise;
    end;

  finally
    // Perform auto-uninstall if we failed to execute
    if (Result = nil) and (Package.AutoUninstall) then
      Packages.Remove(Package);
  end;

  Reason := irSuccess;
  finally
    Package.LastExecutionResult := Reason;
  end;

  ScriptTrace('Script ExecutePackage <<<', Package.PluginName);
end;

type
  TScriptPackageList = class(TInterfacedObject, IScriptPackageList)
  private
    FItems: TList<IScriptPackage>;
  protected
    function GetCount: integer;
    function GetItem(Index: integer): IScriptPackage;
  public
    constructor Create;
    destructor Destroy; override;

    property Count: integer read GetCount;
    property Items[Index: integer]: IScriptPackage read GetItem;
    function GetEnumerator: TEnumerator<IScriptPackage>;

    function Add(const Filename: string): IScriptPackage;
    procedure Remove(const Package: IScriptPackage);
    function FindByID(const PluginID: string): IScriptPackage;
    function FindByFilename(const Filename: string): IScriptPackage;
  end;

function TScriptPackageList.Add(const Filename: string): IScriptPackage;
var
  Package: TScriptPackage;
  i: integer;
begin
  Result := TScriptPackage.Create(Filename);
  Package := TScriptPackage(Result);
  if (Package.LoadFromFile) then
  begin
    for i := 0 to FItems.Count-1 do
      if (SameText(FItems[i].PluginID, Package.PluginID)) then
      begin
        // "merge"
        Package.Enabled := Package.Enabled or FItems[i].Enabled;
        FItems.Delete(i);
        break;
      end;
    FItems.Add(Result)
  end else
    Result := nil;
end;

constructor TScriptPackageList.Create;
begin
  inherited Create;
  FItems := TList<IScriptPackage>.Create;
end;

destructor TScriptPackageList.Destroy;
begin
  FItems.Free;
  inherited;
end;

function TScriptPackageList.FindByFilename(const Filename: string): IScriptPackage;
var
  i: integer;
  Name: string;
begin
  Result := nil;
  Name := TPath.GetFileName(Filename);
  for i := 0 to FItems.Count-1 do
    if (AnsiSameText(TPath.GetFileName(FItems[i].Filename), Name)) then
      Exit(FItems[i]);
end;

function TScriptPackageList.FindByID(const PluginID: string): IScriptPackage;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to FItems.Count-1 do
    if (SameText(FItems[i].PluginID, PluginID)) then
      Exit(FItems[i]);
end;

function TScriptPackageList.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TScriptPackageList.GetEnumerator: TEnumerator<IScriptPackage>;
begin
  Result := FItems.GetEnumerator;
end;

function TScriptPackageList.GetItem(Index: integer): IScriptPackage;
begin
  Result := FItems[Index];
end;

procedure TScriptPackageList.Remove(const Package: IScriptPackage);
begin
  FItems.Remove(Package);
end;

function TDataModuleScriptService.GetExecutions: IScriptExecutionList;
begin
  if (FExecutions = nil) then
    FExecutions := TScriptExecutions.Create;
  Result := FExecutions;
end;

function TDataModuleScriptService.GetPackages: IScriptPackageList;
begin
  if (FPackages = nil) then
    FPackages := TScriptPackageList.Create;
  Result := FPackages;
end;

function TDataModuleScriptService.Edit(const ADocument: IScriptHostDocument; AItem: TObject; const ScriptProvider: IScriptProvider; Messages: TdwsMessageList; MsgIndex: integer): boolean;
begin
  Result := DoDebug(ADocument, AItem, ScriptProvider, nil, Messages, MsgIndex);
end;

function TDataModuleScriptService.Edit(const ADocument: IScriptHostDocument; AItem: TObject; const ScriptName: string; var Script: string; Messages: TdwsMessageList; MsgIndex: integer): boolean;
var
  ScriptProvider: IScriptProvider;
begin
  ScriptProvider := TSimpleScriptProvider.Create(ScriptName, Script);

  Result := DoDebug(ADocument, AItem, ScriptProvider, nil, Messages, MsgIndex);

  if (Result) then
    Script := ScriptProvider.GetScript;
end;

function TDataModuleScriptService.Debug(const ADocument: IScriptHostDocument; AItem: TObject; const ScriptName: string; var Script: string; const AExecution: IdwsProgramExecution): boolean;
var
  ScriptProvider: IScriptProvider;
begin
  ScriptProvider := TSimpleScriptProvider.Create(ScriptName, Script);

  Result := DoDebug(ADocument, AItem, ScriptProvider, AExecution);

  if (Result) then
    Script := ScriptProvider.GetScript;
end;

// -----------------------------------------------------------------------------

function TDataModuleScriptService.Debug(const ADocument: IScriptHostDocument; AItem: TObject; const ScriptProvider: IScriptProvider; const AExecution: IdwsProgramExecution): boolean;
begin
  Result := DoDebug(ADocument, AItem, ScriptProvider, AExecution);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptService.DelphiWebScriptExecutionEnded(exec: TdwsProgramExecution);
var
  Execution: IScriptExecution;
begin
  Execution := Executions.Find(exec);
  if (Execution = nil) then
    exit;

  Execution.Finalize;

  if (Execution.ExecutionNotification <> nil) then
    Execution.ExecutionNotification.ExecutionEnded(Execution);

  // Script has completed execution. Remove from execution list.
  Executions.Remove(Execution);
end;

procedure TDataModuleScriptService.DelphiWebScriptExecutionStarted(exec: TdwsProgramExecution);
//var
//  Execution: IScriptExecution;
begin
(*
  Execution := Executions.Find(exec);
  if (Execution = nil) then
    exit;

  if (Execution.ExecutionNotification <> nil) then
    Execution.ExecutionNotification.ExecutionStarted(Execution);
*)
end;

// -----------------------------------------------------------------------------

function TDataModuleScriptService.DelphiWebScriptNeedUnit(const unitName: string; var unitSource: string): IdwsUnit;
begin
//
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptService.DelphiWebScriptResource(compiler: TdwsCompiler; const resourceName: string);
begin
//
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptService.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;

  if (Operation = opRemove) then
    TScriptEnvironment.UnregisterWrappers(AComponent);
end;

// -----------------------------------------------------------------------------

function TDataModuleScriptService.GetDelphiWebScript: TDelphiWebScript;
begin
  Result := DelphiWebScript;
end;

procedure TDataModuleScriptService.NotifyExecution(const ScriptDebugger: IScriptDebugger; const Execution: IdwsProgramExecution; Notification: TExecutionNotification);
var
  Document: IScriptHostDocument;
  Item: TObject;
begin
  if (Notification = senStarted) then
  begin
    // Set up context
    if (ScriptHostApplication <> nil) and (ScriptHostApplication.ActiveDocument <> nil) then
      Document := ScriptHostApplication.ActiveDocument
    else
      Document := nil;

    if (Document <> nil) then
      Item := Document.ActiveItem
    else
      Item := nil;

    Execution.Environment := TScriptEnvironment.Create(ScriptHostApplication, Document, Item);
  end;
end;

procedure TDataModuleScriptService.NotifyClose(const ScriptDebugger: IScriptDebugger);
begin
//  FDocument := nil;
//  FItem := nil;

  if (FDebugger <> nil) then
  begin
    DelphiWebScript.Config.RuntimeFileSystem := nil;
    DelphiWebScript.Config.CompileFileSystem := nil;
    FDebugger := nil;
    FDebuggerFileSystems := nil;
  end;
end;

// -----------------------------------------------------------------------------

function TDataModuleScriptService.CreateContext(const ADocument: IScriptHostDocument; AItem: TObject; AForDebug: boolean): IScriptContext;
begin
  Result := TScriptContext.Create(DelphiWebScript, ADocument, AItem, AForDebug);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptService.RegisterClassTypeMapping(DelphiClassType: TClass; const ScriptClassType: string);
begin
  FClassTypeMap.AddOrSetValue(DelphiClassType, ScriptClassType);
end;

procedure TDataModuleScriptService.RegisterClassTypeMapping(DelphiClassType: TClass);
begin
  FClassTypeMap.AddOrSetValue(DelphiClassType, DelphiClassType.ClassName);
end;

function TDataModuleScriptService.FindScriptClassType(Instance: TObject; const Default: string): string;
var
  DelphiClassType: TClass;
begin
  if (Instance <> nil) then
  begin
    DelphiClassType := Instance.ClassType;
    // Find the script class type that best represent the delphi side object.
    while (DelphiClassType <> nil) do
    begin
      if (FClassTypeMap.TryGetValue(DelphiClassType, Result)) then
        exit;

      DelphiClassType := DelphiClassType.ClassParent;
    end;
  end;

  Result := Default;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptService.RegisterModule(const Module: IScriptModule);
begin
  FModules.Add(Module);
  Module.Initialize(DelphiWebScript);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptService.RegisterWrappedComponent(AComponent: TComponent);
begin
  // Register for free notification so we can release the wrapper (and thus the script object) when
  // the control is destroyed.
  AComponent.FreeNotification(Self);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptService.UnregisterModule(const Module: IScriptModule);
begin
  FModules.Remove(Module);
  Module.Finalize;
end;

// -----------------------------------------------------------------------------
//
// TScriptExecutions
//
// -----------------------------------------------------------------------------
procedure TScriptExecutions.Add(const Item: IScriptExecution);
begin
  FItems.Add(Item, '');
end;

procedure TScriptExecutions.Add(const Item: IScriptExecution; const ScriptID: string);
begin
  FItems.Add(Item, ScriptID);
end;

procedure TScriptExecutions.Clear;
begin
  FItems.Clear;
end;

function TScriptExecutions.Contains(const Execution: IScriptExecution): boolean;
begin
  Result := FItems.ContainsKey(Execution);
end;

function TScriptExecutions.Contains(const Execution: IdwsProgramExecution): boolean;
begin
  Result := (Find(Execution) <> nil);
end;

constructor TScriptExecutions.Create;
begin
  inherited;
  FItems := TDictionary<IScriptExecution, string>.Create;
end;

destructor TScriptExecutions.Destroy;
begin
  FItems.Free;
  FItems := nil;
  inherited;
end;

procedure TScriptExecutions.Finalize;
var
  Execution: IScriptExecution;
begin
  for Execution in FItems.Keys.ToArray do // ToArray to guard against list being modified while we iterate
    try
      Execution.Finalize;
    except
      // Ignore
    end;
  FItems.Clear;
end;

function TScriptExecutions.Find(const Execution: IdwsProgramExecution): IScriptExecution;
var
  Item: TPair<IScriptExecution, string>;
begin
  Result := nil;
  for Item in FItems do
    if (Item.Key.Execution = Execution) then
      Exit(Item.Key);
end;

function TScriptExecutions.FindByScriptID(const ScriptID: string): IScriptExecution;
var
  Item: TPair<IScriptExecution, string>;
begin
  Result := nil;
  for Item in FItems do
    if (Item.Value = ScriptID) then
      Exit(Item.Key);
end;

function TScriptExecutions.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TScriptExecutions.GetEnumerator: TEnumerator<IScriptExecution>;
begin
  Result := FItems.Keys.GetEnumerator;
end;

function TScriptExecutions.GetItem(Index: integer): IScriptExecution;
begin
  Result := FItems.Keys.ToArray[Index];
end;

procedure TScriptExecutions.Remove(const Item: IScriptExecution);
begin
  FItems.Remove(Item);
end;


// -----------------------------------------------------------------------------
//
// function JSONBeautify(json: Variant): string;
//
// -----------------------------------------------------------------------------
type
  TJSONBeautifyFunc = class(TInternalMagicStringFunction)
    procedure DoEvalAsString(const args : TExprBaseListExec; var Result : UnicodeString); override;
  end;

procedure TJSONBeautifyFunc.DoEvalAsString(const args: TExprBaseListExec; var Result: UnicodeString);
var
  Base: Variant;
  Value: TdwsJSONValue;
  BoxedValue: IBoxedJSONValue;
begin
  args.EvalAsVariant(0, Base);
  BoxedValue := IBoxedJSONValue(IUnknown(Base));
  Value := BoxedValue.Value;
  Result := Value.ToBeautifiedString;
  Result := StringReplace(Result, #9, '    ', [rfReplaceAll]);
end;

// -----------------------------------------------------------------------------
//
// function VarToBoolDef(Value: Variant; Default: boolean): boolean;
//
// -----------------------------------------------------------------------------
type
  TStrToBoolDefFunc = class(TInternalMagicBoolFunction)
    function DoEvalAsBoolean(const args : TExprBaseListExec) : Boolean; override;
  end;

function TStrToBoolDefFunc.DoEvalAsBoolean(const args: TExprBaseListExec): Boolean;
var
  v: Variant;
begin
  args.EvalAsVariant(0, v);
  if (VarIsOrdinal(v)) then
    Result := Boolean(args.AsInteger[0])
  else
    Result := Boolean(args.AsInteger[1]);
end;

// -----------------------------------------------------------------------------
//
// Script: ScriptService
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptService.dwsUnitScriptServiceClassesScriptServiceMethodsEdit0Eval(Info: TProgramInfo; ExtObject: TObject);
begin
  Edit;
end;

procedure TDataModuleScriptService.dwsUnitScriptServiceClassesScriptServiceMethodsEditEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Edit(Info.ParamAsString[0]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptService.dwsUnitScriptServiceClassesScriptServiceMethodsExecute0Eval(Info: TProgramInfo; ExtObject: TObject);
var
  Reason: TScriptExecutionReason;
begin
  Execute(Info.ParamAsString[0], Reason);
  Info.ResultAsInteger := Ord(Reason);
end;

procedure TDataModuleScriptService.dwsUnitScriptServiceClassesScriptServiceMethodsExecute1Eval(Info: TProgramInfo; ExtObject: TObject);
var
  Package: IScriptPackage;
  Reason: TScriptExecutionReason;
begin
  Package := IScriptPackage(pointer(Info.ParamAsObject[0]));

  ExecutePackage(Package, Reason);
  Info.ResultAsInteger := Ord(Reason);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptService.dwsUnitScriptServiceClassesScriptServiceMethodsGetPackagesEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := TScriptModule.CreateResultScriptObject(Info, pointer(ScriptService.Packages));
end;

// -----------------------------------------------------------------------------
//
// Script: TScriptPackageList
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptService.dwsUnitScriptServiceClassesTScriptPackageListMethodsAddEval(Info: TProgramInfo; ExtObject: TObject);
var
  Package: IScriptPackage;
begin
  Package := IScriptPackageList(pointer(ExtObject)).Add(Info.ParamAsString[0]);
  Info.ResultAsVariant := TScriptModule.CreateResultScriptObject(Info, pointer(Package));
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptService.dwsUnitScriptServiceClassesTScriptPackageListMethodsFindByFilenameEval(Info: TProgramInfo; ExtObject: TObject);
var
  Package: IScriptPackage;
begin
  Package := IScriptPackageList(pointer(ExtObject)).FindByFilename(Info.ParamAsString[0]);
  Info.ResultAsVariant := TScriptModule.CreateResultScriptObject(Info, pointer(Package));
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptService.dwsUnitScriptServiceClassesTScriptPackageListMethodsFindByIDEval(Info: TProgramInfo; ExtObject: TObject);
var
  Package: IScriptPackage;
begin
  Package := IScriptPackageList(pointer(ExtObject)).FindByID(Info.ParamAsString[0]);
  Info.ResultAsVariant := TScriptModule.CreateResultScriptObject(Info, pointer(Package));
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptService.dwsUnitScriptServiceClassesTScriptPackageListMethodsGetCountEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := IScriptPackageList(pointer(ExtObject)).Count;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptService.dwsUnitScriptServiceClassesTScriptPackageListMethodsGetItemEval(Info: TProgramInfo; ExtObject: TObject);
var
  Package: IScriptPackage;
begin
  Package := IScriptPackageList(pointer(ExtObject)).Items[Info.ParamAsInteger[0]];
  Info.ResultAsVariant := TScriptModule.CreateResultScriptObject(Info, pointer(Package));
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptService.dwsUnitScriptServiceClassesTScriptPackageListMethodsRemoveEval(Info: TProgramInfo; ExtObject: TObject);
begin
  IScriptPackageList(pointer(ExtObject)).Remove(IScriptPackage(pointer(Info.ParamAsObject[0])));
end;

// -----------------------------------------------------------------------------
//
// Script: TScriptPackage
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptService.dwsUnitScriptServiceClassesTScriptPackageMethodsGetAuthorEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := IScriptPackage(pointer(ExtObject)).Author;
end;

procedure TDataModuleScriptService.dwsUnitScriptServiceClassesTScriptPackageMethodsGetAuthorIDEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := IScriptPackage(pointer(ExtObject)).AuthorID;
end;

procedure TDataModuleScriptService.dwsUnitScriptServiceClassesTScriptPackageMethodsGetAuthorURIEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := IScriptPackage(pointer(ExtObject)).AuthorURI;
end;

procedure TDataModuleScriptService.dwsUnitScriptServiceClassesTScriptPackageMethodsGetDescriptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := IScriptPackage(pointer(ExtObject)).Description;
end;

procedure TDataModuleScriptService.dwsUnitScriptServiceClassesTScriptPackageMethodsGetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := IScriptPackage(pointer(ExtObject)).Enabled;
end;

procedure TDataModuleScriptService.dwsUnitScriptServiceClassesTScriptPackageMethodsGetFilenameEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := IScriptPackage(pointer(ExtObject)).Filename;
end;

procedure TDataModuleScriptService.dwsUnitScriptServiceClassesTScriptPackageMethodsGetPackageKindEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(IScriptPackage(pointer(ExtObject)).PackageKind);
end;

procedure TDataModuleScriptService.dwsUnitScriptServiceClassesTScriptPackageMethodsGetPluginIDEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := IScriptPackage(pointer(ExtObject)).PluginID;
end;

procedure TDataModuleScriptService.dwsUnitScriptServiceClassesTScriptPackageMethodsGetPluginNameEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := IScriptPackage(pointer(ExtObject)).PluginName;
end;

procedure TDataModuleScriptService.dwsUnitScriptServiceClassesTScriptPackageMethodsGetPluginURIEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := IScriptPackage(pointer(ExtObject)).PluginURI;
end;

procedure TDataModuleScriptService.dwsUnitScriptServiceClassesTScriptPackageMethodsGetProductIDEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := IScriptPackage(pointer(ExtObject)).ProductID;
end;

procedure TDataModuleScriptService.dwsUnitScriptServiceClassesTScriptPackageMethodsGetVersionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := IScriptPackage(pointer(ExtObject)).Version;
end;

procedure TDataModuleScriptService.dwsUnitScriptServiceClassesTScriptPackageMethodsSetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
begin
  IScriptPackage(pointer(ExtObject)).Enabled := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

procedure InitInternalSymbols(SystemTable: TSystemSymbolTable; UnitSyms: TUnitMainSymbols; UnitTable: TSymbolTable);
var
  VersionInfo: TVersionInfo;
  Symbol: TSymbol;
begin
  VersionInfo := TVersionInfo.Create(Application.ExeName);
  try
    Symbol := TConstSymbol.CreateValue('ApplicationVersion', SystemTable.TypInteger, VersionInfo.FileVersion);
    SystemTable.AddSymbol(Symbol);

    Symbol := TConstSymbol.CreateValue('ApplicationVersionMajor', SystemTable.TypInteger, TVersionInfo.VersionMajor(VersionInfo.FileVersion));
    SystemTable.AddSymbol(Symbol);
    Symbol := TConstSymbol.CreateValue('ApplicationVersionMinor', SystemTable.TypInteger, TVersionInfo.VersionMinor(VersionInfo.FileVersion));
    SystemTable.AddSymbol(Symbol);
    Symbol := TConstSymbol.CreateValue('ApplicationVersionRelease', SystemTable.TypInteger, TVersionInfo.VersionRelease(VersionInfo.FileVersion));
    SystemTable.AddSymbol(Symbol);
    Symbol := TConstSymbol.CreateValue('ApplicationVersionBuild', SystemTable.TypInteger, TVersionInfo.VersionBuild(VersionInfo.FileVersion));
    SystemTable.AddSymbol(Symbol);
  finally
    VersionInfo.Free;
  end;
end;

// -----------------------------------------------------------------------------

// Halt() terminates script execution gracefully.
type
   TSystemHaltProc = class(TInternalMagicProcedure)
      procedure DoEvalProc(const Args : TExprBaseListExec); override;
   end;

procedure TSystemHaltProc.DoEvalProc(const Args: TExprBaseListExec);
var
  Exec: TdwsExecution;
//  Result: integer;
begin
  Exec := Args.Exec;
  Exec.Status := esrExit;
//  Result := Args.AsInteger[0];
end;

// -----------------------------------------------------------------------------
//
// ScriptService
//
// -----------------------------------------------------------------------------
function ScriptServiceFactory: IScriptService;
begin
  Result := TDataModuleScriptService.Create(nil);
end;

// -----------------------------------------------------------------------------

initialization
  RegisterScriptServiceFactory(ScriptServiceFactory);

  RegisterInternalSymbolsProc(InitInternalSymbols);

  RegisterInternalProcedure(TSystemHaltProc, 'Halt', ['Result=0', SYS_INTEGER]);

  RegisterInternalStringFunction(TJSONBeautifyFunc, 'JSONBeautify', ['json', SYS_VARIANT]);
  RegisterInternalBoolFunction(TStrToBoolDefFunc, 'VarToBoolDef', ['val', SYS_VARIANT, 'def', SYS_BOOLEAN], [iffStateLess]);

finalization
  RegisterScriptServiceFactory(nil);
end.




