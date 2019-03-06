unit ScriptModule;

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
  Controls,
  Windows,
  Graphics,
  TypInfo,

  dwsComp,
  dwsExprs,
  dwsCompiler,
  dwsSymbols,
  dwsClassesLibModule,
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

  ScriptAPI,
  ScriptDebuggerAPI,
  ScriptHostAPI,
  ScriptProviderAPI,
  ScriptPackageAPI;


// -----------------------------------------------------------------------------
//
// IScriptObjectInfo
//
// -----------------------------------------------------------------------------
type
  IScriptObjectInfo = interface
    function Info: IInfo;
  end;

// -----------------------------------------------------------------------------
//
// TScriptObjectWrapper
//
// -----------------------------------------------------------------------------
type
  IScriptEnvironment = interface;

  TScriptObjectWrapperBase = class
  private
    FItem: TObject;
    FScriptObj: IScriptObj;
    FExecution: IdwsProgramExecution;
    FEnvironment: IScriptEnvironment;
    FOwnsItem: boolean;
    FDestroying: boolean;
  protected
    function GetExecution: IdwsProgramExecution;

    // Destroy wrapped object
    procedure DoFreeWrappedObject; virtual;
    procedure FreeWrappedObject; virtual;

    /// <summary>Unregister calls Environment.UnregisterWrapper to remove the wrapper from the wrapper list.</summary>
    procedure Unregister;
    /// <summary>Unregistered is called by Environment.UnregisterWrapper.</summary>
    procedure Unregistered;
  public
    constructor Create(const AScriptObj: IScriptObj; AItem: TObject; AOwnsItem: boolean = False); overload; virtual;
    constructor Create(AProgramInfo: TProgramInfo; TypeSym: TSymbol; AItem: TObject; AOwnsItem: boolean = False); overload;
    constructor Create(AProgramInfo: TProgramInfo; AItem: TObject; AOwnsItem: boolean = False); overload;
    destructor Destroy; override;

    // Disassociate wrapped object with wrapper without destroying object
    procedure DetachWrappedObject; virtual;

    // Clear reference to script objects
    procedure DetachScriptObject; virtual;

    property Item: TObject read FItem;
    property ScriptObj: IScriptObj read FScriptObj;
    property OwnsItem: boolean read FOwnsItem write FOwnsItem;
    property Destroying: boolean read FDestroying;

    property Execution: IdwsProgramExecution read GetExecution write FExecution;
    function AcquireInfo: IScriptObjectInfo;
    function CheckScriptObj: boolean;
  end;

  TWrapperList = array of TScriptObjectWrapperBase;

  TScriptObjectWrapper<T: Class> = class(TScriptObjectWrapperBase)
  private
  protected
    function GetItem: T;
  public
    property Item: T read GetItem;
  end;

// -----------------------------------------------------------------------------
//
// TScriptComponentWrapper
//
// -----------------------------------------------------------------------------
  TScriptComponentWrapperBase<T: TComponent> = class(TScriptObjectWrapper<T>)
  private
  protected
    procedure DoFreeWrappedObject; override;
  public
    constructor Create(const AScriptObj: IScriptObj; AItem: TObject; AOwnsItem: boolean = False); overload; override;
    constructor CreateOwned(AProgramInfo: TProgramInfo; const AScriptObj: IScriptObj; AComponentClass: TComponentClass);
  end;

  TScriptComponentWrapper = class(TScriptComponentWrapperBase<TComponent>);

// -----------------------------------------------------------------------------
//
// TScriptControlWrapper
//
// -----------------------------------------------------------------------------
  TScriptControlWrapper = class(TScriptComponentWrapperBase<TControl>)
  private
  protected
    function GetWinControl: TWinControl;
  public
    constructor Create(const AScriptObj: IScriptObj; AItem: TObject; AOwnsItem: boolean = False); override;

    procedure DetachWrappedObject; override;
    property WinControl: TWinControl read GetWinControl;

    procedure OnClickHandler(Sender: TObject);
    procedure OnDblClickHandler(Sender: TObject);
  end;

  TScriptControlWrapperClass = class of TScriptControlWrapper;

  TScriptControlWrapperBase<T: TControl> = class(TScriptControlWrapper)
  private
  protected
    function GetItem: T;
  public
    property Item: T read GetItem;
  end;

// -----------------------------------------------------------------------------
//
// TScriptObjectInfo
//
// -----------------------------------------------------------------------------
  TScriptObjectInfo = class(TInterfacedObject, IScriptObjectInfo)
  private
    FExecution: IdwsProgramExecution;
    FProgramInfo: TProgramInfo;
    FData: TData;
    FInfo: IInfo;
  protected
    // IScriptObjectInfo
    function Info: IInfo;
  public
    constructor Create(const AExecution: IdwsProgramExecution; const AScriptObject: IScriptObj); overload;
    constructor Create(const AScriptObject: IScriptObj); overload;
    destructor Destroy; override;

    class function IsValidScriptObject(const AScriptObject: IScriptObj): boolean;
  end;

// -----------------------------------------------------------------------------
//
// IScriptEnvironment
//
// -----------------------------------------------------------------------------
  IScriptEnvironment = interface(IdwsEnvironment)
    ['{BC74C115-64E8-4F95-8022-9EE9B59BF8E0}']
    function GetApplication: IScriptHostApplication;
    property Application: IScriptHostApplication read GetApplication;

    function GetDocument: IScriptHostDocument;
    property Document: IScriptHostDocument read GetDocument;

    function GetItem: TObject;
    property Item: TObject read GetItem;

    procedure RegisterWrapper(Wrapper: TScriptObjectWrapperBase);
    function FindWrapper(AObject: TObject): TScriptObjectWrapperBase;
    procedure UnregisterWrapper(Wrapper: TScriptObjectWrapperBase);
  end;

// Find wrapper across all environments
function ScriptFindWrappers(AObject: TObject): TWrapperList;
procedure ScriptUnregisterWrappers(AObject: TObject);


// -----------------------------------------------------------------------------
//
// TScriptEnvironment
//
// -----------------------------------------------------------------------------
type
  TScriptEnvironment = class(TInterfacedSelfObject, IdwsEnvironment, IScriptEnvironment)
  private
    FWrappedObjects: TDictionary<TObject, TScriptObjectWrapperBase>;
    FApplication: IScriptHostApplication;
    FDocument: IScriptHostDocument;
    FItem: TObject;
  protected
    procedure ClearLeakedWrappers;
    // IScriptEnvironment
    function GetApplication: IScriptHostApplication;
    property Application: IScriptHostApplication read GetApplication;

    function GetDocument: IScriptHostDocument;
    property Document: IScriptHostDocument read GetDocument;

    function GetItem: TObject;
    property Item: TObject read GetItem;

    procedure RegisterWrapper(Wrapper: TScriptObjectWrapperBase);
    function FindWrapper(AObject: TObject): TScriptObjectWrapperBase;
    procedure UnregisterWrapper(Wrapper: TScriptObjectWrapperBase);
  public
    constructor Create(const AApplication: IScriptHostApplication; const ADocument: IScriptHostDocument; AItem: TObject);
    destructor Destroy; override;
  end;

// -----------------------------------------------------------------------------
//
// TCustomScriptModule
//
// -----------------------------------------------------------------------------
// Base class for script modules.
// Uses reference counted life time management.
// -----------------------------------------------------------------------------
type
  TCustomScriptModule = class abstract(TDataModule, IUnknown)
  private
    FRefCount: integer;
  protected
    // IUnknown
    function QueryInterface(const IID: TGUID; out Obj): HResult; override; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  public
    constructor Create(AOwner: TComponent); override;

    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    class function NewInstance: TObject; override;
  end;


// -----------------------------------------------------------------------------
//
// TScriptModule
//
// -----------------------------------------------------------------------------
// Base class for script RTL library modules.
// Former TCustomDataModuleScriptModule.
// -----------------------------------------------------------------------------
type
  TScriptModule = class abstract(TCustomScriptModule, IScriptModule)
  private
  protected
    type
      TPopulateEnumPredicate = reference to function(Value: integer): boolean;
      TPopulateEnumFilter = reference to function(const Value: string): string;

    class procedure PopulateScriptEnum(dwsUnit: TdwsUnit; const ScriptName: string; Info: PTypeInfo; Clear: boolean = True; Predicate: TPopulateEnumPredicate = nil; Filter: TPopulateEnumFilter = nil);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function CheckScriptObj(const ScriptObj: IScriptObj): boolean;
    function Environment(const ScriptObj: IScriptObj): IScriptEnvironment; overload;
    function Environment(Info: TProgramInfo): IScriptEnvironment; overload;
    function Environment(Wrapper: TScriptObjectWrapperBase): IScriptEnvironment; overload;

    // IScriptModule
    procedure Initialize(DelphiWebScript: TDelphiWebScript); virtual;
    procedure Finalize; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    class procedure RegisterModule;

    class function CreateScriptObject(Info: TProgramInfo; const ClassName: string; ExtObject: TObject; CreateNilObject: boolean = False; MapClass: boolean = True): IScriptObj; overload;
    class function CreateScriptObject(const Execution: IdwsProgramExecution; const ClassName: string; ExtObject: TObject; CreateNilObject: boolean = False): IScriptObj; overload;
    class function CreateScriptObject(Info: TProgramInfo; const ClassName: string; ExtObject: pointer; CreateNilObject: boolean = False): IScriptObj; overload;

    class function CreateResultScriptObject(Info: TProgramInfo; ExtObject: TObject; CreateNilObject: boolean = False): IScriptObj; overload;
    class function CreateResultScriptObject(Info: TProgramInfo): IScriptObj; overload;
    class function CreateResultScriptObject(Info: TProgramInfo; const Unk: IUnknown; CreateNilObject: boolean = False): IScriptObj; overload;
  end;

// -----------------------------------------------------------------------------
//
// TDataModuleScript
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

// -----------------------------------------------------------------------------
//
// Error handling
//
// -----------------------------------------------------------------------------
function ScriptHandleException(const Execution: IdwsProgramExecution): boolean;
function ShowScriptException(const AMsg, AInfo: string; const Execution: IdwsProgramExecution = nil; AllowAbort: boolean = True): boolean; overload;
function ShowScriptException(E: Exception; const Execution: IdwsProgramExecution = nil; AllowAbort: boolean = True): boolean; overload;


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

type
  // TControlCracker must be declared in interface or we get a compiler error:
  // [DCC Error] ...: E2506 Method of parameterized type declared in interface section must not use local symbol 'TControlCracker'
  TControlCracker = class(TControl);

implementation

{$R *.dfm}

uses
  Variants,
  Dialogs,
  StrUtils,
  Forms,
  RegularExpressions,
  Zip,
  PngImage,
  ActiveX,
  MSXML2_TLB,
  Math,

  SynTaskDialog,
  SynCommons,

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
  amPath,
  amVersionInfo,
  amStreamAdapter,
  amMSXMLUtils,

  ScriptFileSystemAPI,
  ScriptFileSystem,
  ScriptHostFileSystem,
  ScriptPackage,
  ScriptProvider,
{$ifdef FEATURE_SCRIPT_BUNDLE}
  ScriptDebuggerDialogBundleBuilder,
{$endif FEATURE_SCRIPT_BUNDLE}
{$ifdef FEATURE_LICENSING}
  LicenseService,
{$else FEATURE_LICENSING}
  ScriptLicenseServiceAPI,
{$endif FEATURE_LICENSING}
  ScriptExternalFunctionManager,
  ScriptDebuggerSettings;


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
// ScriptHandleException
//
// -----------------------------------------------------------------------------
type
  TRaiseExceptExpr = class(TProgramExpr)
  private
    FException: pointer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure EvalAsVariant(exec : TdwsExecution; var result : Variant); override;
    procedure EvalNoResult(exec: TdwsExecution); override;
    function ScriptPos: TScriptPos; override;
  end;

constructor TRaiseExceptExpr.Create;
begin
  FException := AcquireExceptionObject;
end;

destructor TRaiseExceptExpr.Destroy;
begin
  if (FException <> nil) then
    ReleaseExceptionObject;
  inherited;
end;

procedure TRaiseExceptExpr.EvalAsVariant(exec: TdwsExecution; var result: Variant);
begin
  VarClear(result);
  EvalNoResult(exec);
end;

procedure TRaiseExceptExpr.EvalNoResult(exec: TdwsExecution);
var
  p: pointer;
begin
  p := FException;
  FException := nil;
  raise TObject(p);
end;

function TRaiseExceptExpr.ScriptPos: TScriptPos;
begin
  Result := cNullPos;
end;

type
  TProgramExecutionCracker = class(TdwsProgramExecution);

function ScriptHandleException(const Execution: IdwsProgramExecution): boolean;
var
  Expr: TProgramExpr;
//  ExceptObject: pointer;
begin
  Result := False;

//  ExceptObject := AcquireExceptionObject;

  if (ExceptObject = nil) then
    exit;

  try

    if (TObject(ExceptObject) is Exception) then
    begin
      if (ShowScriptException(Exception(ExceptObject), Execution)) then
        exit(True);
    end;

    if (Execution <> nil) then
    begin
      Expr := TRaiseExceptExpr.Create;
      try
        TProgramExecutionCracker(TdwsProgramExecution(Execution)).RunProgramExpr(Expr);
      finally
        Expr.Free;
      end;
    end;

  finally
//    ReleaseExceptionObject;
  end;
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
  Res: integer;
  ResHalt, ResDebug, ResIgnore: integer;
  s: string;
  Environment: IScriptEnvironment;
  Messages: TdwsRuntimeMessageList;

const
  ResAbort = 100;
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

  ErrorIndex := 0;
  for i := 0 to Messages.Count-1 do
    if (Messages[i].IsError) then
    begin
      Result := True;
      inc(ErrorIndex);

      TaskDialog.Title := 'Script run time error';
      TaskDialog.Inst := 'A Script caused an error.';
      if (ErrorCount > 1) then
        TaskDialog.Content := Format('Error %d of %d', [ErrorIndex, ErrorCount]) + #13#13 + Messages[i].Text
      else
        TaskDialog.Content := Messages[i].Text;
      s := 'Continue';
      if (Execution.Prog.ProgramObject.FinalExpr <> nil) then
        s := s + '\nExecute finalizations and then terminate.';
      Res := ResAbort;
      ResIgnore := -1;
      ResDebug := -1;
      ResHalt := -1;

      if (Execution.Prog.ProgramObject.FinalExpr <> nil) then
      begin
        s := s + #10 + 'Halt\nStop without executing finalizations.';
        Inc(Res);
        ResHalt := Res;
      end;
      if (i < Messages.Count-1) then
      begin
        s := s + #10 + 'Ignore\nProceed to next error.';
        Inc(Res);
        ResIgnore := Res;
      end;
      // TODO : Check for "view source" rights
      if (ScriptProvider = nil) or (not ScriptProvider.Protected) then
        if (Messages[i] is TScriptMessage) and (TScriptMessage(Messages[i]).ScriptPos.Defined) then
        begin
          s := s + #10 + 'Debug\nView script source.';
          Inc(Res);
          ResDebug := Res;
        end;
      TaskDialog.Buttons := s;
      TaskDialog.Info := Messages[i].AsInfo;;

      // Note: We must specify parent handle or the current active form handle will be used. In case the splash is
      // visible its handle will be used and the dialog will be closed when the splash timer expires.
      Res := TaskDialog.Execute([], ResAbort, [tdfUseCommandLinks, tdfAllowDialogCancellation, tdfExpandFooterArea], tiWarning, tfiBlank, 0, 0, Application.MainForm.Handle);

      if (Res = ResAbort) or (Res = mrCancel) then
        break;

      if (Res = ResHalt) then
      begin
        HaltScript(Execution);
        break;
      end;

      if (Res = ResIgnore) then
        continue;

      if (Res = ResDebug) then
      begin
        HaltScript(Execution);
        if (ScriptProvider = nil) then
          ScriptProvider := TStaticScriptProvider.Create(TScriptMessage(Messages[i]).ScriptPos.SourceFile.Name, TScriptMessage(Messages[i]).ScriptPos.SourceFile.Code);
        ScriptService.Edit(Environment.Document, Environment.Item, ScriptProvider, Messages, i);
        break;
      end;
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
    procedure Reset;
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
  Res: integer;
  ResDebug, ResIgnore: integer;
  s: string;
const
  ResAbort = 100;
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

  ErrorIndex := 0;
  for i := 0 to FScriptProgram.Msgs.Count-1 do
    if (FScriptProgram.Msgs[i].IsError) then
    begin
      Result := True;
      inc(ErrorIndex);

      TaskDialog.Title := 'Script error';
      TaskDialog.Inst := 'A Script failed to compile.';
      if (ErrorCount > 1) then
        TaskDialog.Content := Format('Error %d of %d', [ErrorIndex, ErrorCount]) + #13#13 + FScriptProgram.Msgs[i].Text
      else
        TaskDialog.Content := FScriptProgram.Msgs[i].Text;
      s := 'Abort';
      Res := ResAbort;
      ResIgnore := -1;
      ResDebug := -1;
      if (i < FScriptProgram.Msgs.Count-1) then
      begin
        s := s + #10 + 'Ignore\nProceed to next error';
        Inc(Res);
        ResIgnore := Res;
      end;
      // TODO : Check for "view source" rights
      if (ScriptProvider = nil) or (not ScriptProvider.Protected) then
        if (FScriptProgram.Msgs[i] is TScriptMessage) then
        begin
          s := s + #10 + 'Debug\nView script source.';
          Inc(Res);
          ResDebug := Res;
        end;
      TaskDialog.Buttons := s;
      TaskDialog.Info := FScriptProgram.Msgs[i].AsInfo;;

      // Note: We must specify parent handle or the current active form handle will be used. In case the splash is
      // visible its handle will be used and the dialog will be closed when the splash timer expires.
      Res := TaskDialog.Execute([], ResAbort, [tdfUseCommandLinks, tdfAllowDialogCancellation, tdfExpandFooterArea], tiWarning, tfiBlank, 0, 0, Application.MainForm.Handle);

      if (Res = 100) or (Res = mrCancel) then
        break;

      if (Res = ResIgnore) then
        continue;

      if (Res = ResDebug) then
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
end;

procedure TScriptContext.Reset;
begin
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
// TScriptObjectInfo
//
// -----------------------------------------------------------------------------
constructor TScriptObjectInfo.Create(const AExecution: IdwsProgramExecution; const AScriptObject: IScriptObj);
begin
  inherited Create;

  FExecution := AExecution;

  FProgramInfo := TdwsProgramExecution(FExecution).AcquireProgramInfo(nil);

  SetLength(FData, 1);
  FData[0] := AScriptObject;
  CreateInfoOnSymbol(FInfo, FProgramInfo, AScriptObject.ClassSym, FData, 0);
//  CreateInfoOnSymbol(FInfo, TdwsProgramExecution(FExecution).ProgramInfo, AScriptObject.ClassSym, FData, 0);
end;

constructor TScriptObjectInfo.Create(const AScriptObject: IScriptObj);
var
  Execution: IdwsProgramExecution;
begin
  inherited Create;

  FExecution := nil;
  Execution := TScriptObjInstance(AScriptObject).ExecutionContext;

  FProgramInfo := Execution.Info;

  SetLength(FData, 1);
  FData[0] := AScriptObject;
  CreateInfoOnSymbol(FInfo, FProgramInfo, AScriptObject.ClassSym, FData, 0);
end;

destructor TScriptObjectInfo.Destroy;
begin
  FInfo := nil;
  if (FExecution <> nil) then
    TdwsProgramExecution(FExecution).ReleaseProgramInfo(FProgramInfo);
  inherited;
end;

function TScriptObjectInfo.Info: IInfo;
begin
  Result := FInfo;
end;

class function TScriptObjectInfo.IsValidScriptObject(const AScriptObject: IScriptObj): boolean;
var
  Execution: IdwsProgramExecution;
begin
  if (AScriptObject = nil) or (AScriptObject.Destroyed) then
    Exit(False);

  Execution := TScriptObjInstance(AScriptObject).ExecutionContext;

  Result := (Execution <> nil);
end;

// -----------------------------------------------------------------------------
//
// TScriptObjectWrapper
//
// -----------------------------------------------------------------------------
function TScriptObjectWrapperBase.CheckScriptObj: boolean;
begin
  ASSERT(FScriptObj <> nil);
  Result := (not FScriptObj.Destroyed) and (FScriptObj.ClassSym <> nil);
end;

procedure TScriptObjectWrapperBase.DetachScriptObject;
begin
  Unregister;
  FScriptObj := nil;
end;

constructor TScriptObjectWrapperBase.Create(const AScriptObj: IScriptObj; AItem: TObject; AOwnsItem: boolean);
begin
  inherited Create;
  FScriptObj := AScriptObj;
  FItem := AItem;
  FOwnsItem := AOwnsItem;

  FEnvironment := IScriptEnvironment(Execution.Environment);
  FEnvironment.RegisterWrapper(Self);
end;

constructor TScriptObjectWrapperBase.Create(AProgramInfo: TProgramInfo; TypeSym: TSymbol; AItem: TObject; AOwnsItem: boolean);
var
  ScriptObj: IScriptObj;
begin
  ScriptObj := TScriptModule.CreateScriptObject(AProgramInfo, TypeSym.Name, Self, False, False);

  Create(ScriptObj, AItem, AOwnsItem);
end;

constructor TScriptObjectWrapperBase.Create(AProgramInfo: TProgramInfo; AItem: TObject; AOwnsItem: boolean);
begin
  Create(AProgramInfo, AProgramInfo.ResultVars.TypeSym, AItem, AOwnsItem);
end;

destructor TScriptObjectWrapperBase.Destroy;
begin
  // Avoid recursion through Unregister->Environment.UnregisterWrapper->Unregistered->DetachScriptObject->TdwsUnit.OnCleanUp->Destroy
  FDestroying := True;

  Unregister;

  FreeWrappedObject;
  DetachWrappedObject;
  DetachScriptObject;

  inherited;
end;

procedure TScriptObjectWrapperBase.DetachWrappedObject;
begin
  Unregister;
  FItem := nil;
end;

procedure TScriptObjectWrapperBase.FreeWrappedObject;
begin
  DoFreeWrappedObject;
end;

procedure TScriptObjectWrapperBase.DoFreeWrappedObject;
begin
  if (FOwnsItem) then
    FreeAndNil(FItem)
  else
    FItem := nil;
end;

function TScriptObjectWrapperBase.GetExecution: IdwsProgramExecution;
begin
  Result := FExecution;
  if (Result = nil) and (FScriptObj <> nil) then
    Result := TScriptObjInstance(FScriptObj).ExecutionContext as IdwsProgramExecution;
end;

procedure TScriptObjectWrapperBase.Unregister;
var
  Environment: IScriptEnvironment;
begin
  if (FEnvironment <> nil) then
  begin
    Environment := FEnvironment;
    FEnvironment := nil;
    Environment.UnregisterWrapper(Self);
  end;
end;

procedure TScriptObjectWrapperBase.Unregistered;
begin
  if (FDestroying) then
    exit;
  FEnvironment := nil;
  DetachWrappedObject;
  DetachScriptObject;
end;

function TScriptObjectWrapperBase.AcquireInfo: IScriptObjectInfo;
begin
  Result := TScriptObjectInfo.Create(FScriptObj);
end;

// -----------------------------------------------------------------------------

function TScriptObjectWrapper<T>.GetItem: T;
begin
  Result := T(inherited Item);
end;


// -----------------------------------------------------------------------------
//
// TScriptComponentWrapper
//
// -----------------------------------------------------------------------------
constructor TScriptComponentWrapperBase<T>.Create(const AScriptObj: IScriptObj; AItem: TObject; AOwnsItem: boolean);
begin
  ASSERT(AItem is TComponent);
  inherited Create(AScriptObj, AItem, AOwnsItem);
end;

constructor TScriptComponentWrapperBase<T>.CreateOwned(AProgramInfo: TProgramInfo; const AScriptObj: IScriptObj; AComponentClass: TComponentClass);
var
  OwnerWrapper: TScriptObjectWrapperBase;
  Owner: TComponent;
  Component: TComponent;
begin
  OwnerWrapper := AProgramInfo.Params[0].ExternalObject as TScriptObjectWrapperBase;
  if (OwnerWrapper <> nil) and (OwnerWrapper.Item is TComponent) then
    Owner := TComponent(OwnerWrapper.Item)
  else
    Owner := nil;

  Component := AComponentClass.Create(Owner);

  Create(AScriptObj, Component, True); // Script has created item: Wrapper owns item by default
end;

procedure TScriptComponentWrapperBase<T>.DoFreeWrappedObject;
begin
  if (Item <> nil) and (not (csDestroying in Item.ComponentState)) then
    inherited DoFreeWrappedObject;
end;

// -----------------------------------------------------------------------------
//
// TScriptControlWrapper
//
// -----------------------------------------------------------------------------
constructor TScriptControlWrapper.Create(const AScriptObj: IScriptObj; AItem: TObject; AOwnsItem: boolean);
begin
  ASSERT(AItem is TControl);
  inherited Create(AScriptObj, AItem, AOwnsItem);

  TControl(AItem).Margins.SetBounds(0, 0, 0, 0);
end;

// -----------------------------------------------------------------------------

procedure TScriptControlWrapper.DetachWrappedObject;
begin
  if (Item <> nil) then
  begin
    TControlCracker(Item).OnClick := nil;
    TControlCracker(Item).OnDblClick := nil;
  end;
  inherited;
end;

// -----------------------------------------------------------------------------

function TScriptControlWrapper.GetWinControl: TWinControl;
begin
  if (Item <> nil) and (not(Item is TWinControl)) then
    raise Exception.CreateFmt('Invalid cast to TWinControl from %s', [Item.ClassName]);
  Result := TWinControl(Item);
end;

// -----------------------------------------------------------------------------

procedure TScriptControlWrapper.OnClickHandler(Sender: TObject);
var
  ScriptObjectInfo: IScriptObjectInfo;
  Delegate: IInfo;
begin
  if (not CheckScriptObj) then
  begin
    TControlCracker(Item).OnClick := nil;
    raise EScript.Create('Script Object has been destroyed');
  end;

  ScriptObjectInfo := AcquireInfo;
  Delegate := ScriptObjectInfo.Info.Member['FOnClick'];

  if (Delegate <> nil) and (Delegate.ScriptObj <> nil) then
  begin
    // One way:
    Delegate.Parameter['Sender'].Value := FScriptObj;

    try

      Delegate.Call;

    except
      TControlCracker(Item).OnClick := nil;
      ScriptHandleException(Execution);
    end;

    // Another way:
    // Delegate.Call([FScriptObj]);
  end;
end;

procedure TScriptControlWrapper.OnDblClickHandler(Sender: TObject);
var
  ScriptObjectInfo: IScriptObjectInfo;
  Delegate: IInfo;
begin
  if (not CheckScriptObj) then
  begin
    TControlCracker(Item).OnDblClick := nil;
    raise EScript.Create('Script Object has been destroyed');
  end;

  ScriptObjectInfo := AcquireInfo;
  Delegate := ScriptObjectInfo.Info.Member['FOnDblClick'];

  if (Delegate <> nil) and (Delegate.ScriptObj <> nil) then
  begin
    try

      Delegate.Call([FScriptObj]);

    except
      TControlCracker(Item).OnDblClick := nil;
      ScriptHandleException(Execution);
    end;
  end;
end;

// -----------------------------------------------------------------------------
//
// TScriptControlWrapperBase<T>
//
// -----------------------------------------------------------------------------
function TScriptControlWrapperBase<T>.GetItem: T;
begin
  Result := T(inherited Item);
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
  EditPage: IScriptDebugEditPage;
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
      FDebugger := CreateScriptDebugger(Self, True)
    else
      FDebugger := CreateScriptDebugger(Self, False);

    if (not Supports(FDebugger, IScriptDebuggerSetup, ScriptDebuggerSetup)) then
      raise Exception.Create('Required interface not supported by script debugger: IScriptDebuggerSetup');

    ScriptDebuggerSetup.SetEnvironment(Environment);

    FDebuggerFileSystems := CreateContext(ADocument, AItem, True) as IScriptContextFileSystems;

    DelphiWebScript.Config.RuntimeFileSystem := FDebuggerFileSystems.RuntimeFileSystem;
    DelphiWebScript.Config.CompileFileSystem := FDebuggerFileSystems.CompilerFileSystem;

    EditPage := FDebugger.EditorPageAddNew(ScriptProvider);
  end else
  begin
    if (not Supports(FDebugger, IScriptDebuggerSetup, ScriptDebuggerSetup)) then
      raise Exception.Create('Required interface not supported by script debugger: IScriptDebuggerSetup');

    if (ScriptProvider <> nil) then
      EditPage := FDebugger.EditorPageAddNew(ScriptProvider);
  end;

  //EditPage.CanClose := False;

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
    ScriptUnregisterWrappers(AComponent);
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
// TCustomScriptModule
//
// -----------------------------------------------------------------------------
procedure TCustomScriptModule.AfterConstruction;
begin
  inherited;
  // Release the constructor's implicit refcount
  InterlockedDecrement(FRefCount);
end;

procedure TCustomScriptModule.BeforeDestruction;
begin
  inherited;

  ASSERT(FRefCount = 0);
end;

constructor TCustomScriptModule.Create(AOwner: TComponent);

  procedure DeprecateUnimplemented(dwsFunction: TdwsFunction); overload;
  begin
    if (Assigned(dwsFunction.OnEval)) or (Assigned(dwsFunction.OnFastEval)) or (dwsFunction.Deprecated <> '') then
      exit;
    dwsFunction.Deprecated := 'Not implemented';
    OutputDebugString(dwsFunction.GetNamePath+' not implemented');
  end;

  procedure DeprecateUnimplemented(dwsClass: TdwsClass; dwsMethod: TdwsMethod); overload;
  begin
    if (Assigned(dwsMethod.OnEval)) or (dwsMethod.Deprecated <> '') then
      exit;
    if (maAbstract in dwsMethod.Attributes) then
    begin
      if (dwsClass.IsSealed) then
      begin
        dwsMethod.Deprecated := 'Not implemented';
        OutputDebugString(dwsMethod.GetNamePath+' abstract, not implemented and class is sealed');
        exit;
      end;
      if (maVirtual in dwsMethod.Attributes) then
        exit;
      dwsMethod.Deprecated := 'Not implemented';
      OutputDebugString(dwsMethod.GetNamePath+' abstract, not implemented and not marked virtual');
      exit;
    end;
    dwsMethod.Deprecated := 'Not implemented';
    if (dwsClass.IsSealed) then
      OutputDebugString(dwsMethod.GetNamePath+' not implemented (and class is sealed)')
    else
    if (dwsClass.IsAbstract) then
      OutputDebugString(dwsMethod.GetNamePath+' not implemented (but class is abstract)')
    else
      OutputDebugString(dwsMethod.GetNamePath+' not implemented');
  end;

  procedure DeprecateUnimplemented(dwsProperty: TdwsProperty; dwsMethod: TdwsMethod; dwsField: TdwsField; Reader: boolean); overload;
  var
    sType: string;
    Offset: integer;
    IndexOffset: integer;
    i: integer;
  begin
    if (Reader) then
    begin
      sType := 'reader';
      Offset := 0;
    end else
    begin
      sType := 'writer';
      Offset := 1;
    end;
    if (VarIsEmpty(dwsProperty.IndexValue)) then
      IndexOffset := 0
    else
      IndexOffset := 1;

    if (dwsMethod = nil) and (dwsField = nil) then
    begin
      OutputDebugString(dwsProperty.GetNamePath+': '+sType+' field or method not found');
      if (dwsProperty.Deprecated = '') then
        dwsProperty.Deprecated := 'Not implemented';
    end else
    if (dwsField <> nil) then
    begin
      if (dwsProperty.Parameters.Count > 0) then
      begin
        OutputDebugString(dwsProperty.GetNamePath+': '+sType+' is a field but property has parameters');
        dwsProperty.Deprecated := 'Not correctly implemented';
        exit;
      end;
      if (IndexOffset > 0) then
      begin
        OutputDebugString(dwsProperty.GetNamePath+': '+sType+' is a field but property has index');
        dwsProperty.Deprecated := 'Not correctly implemented';
        exit;
      end;
      if (not AnsiSameText(dwsProperty.DataType, dwsField.DataType)) then
      begin
        OutputDebugString(dwsProperty.GetNamePath+': '+sType+' field has incorrect type');
        if (dwsProperty.Deprecated = '') then
          dwsProperty.Deprecated := 'Not correctly implemented';
        exit;
      end;
    end else
    if (dwsMethod <> nil) then
    begin
      if not ((maAbstract in dwsMethod.Attributes) or (Assigned(dwsMethod.OnEval)) or (dwsMethod.Deprecated <> '')) then
      begin
        OutputDebugString(dwsProperty.GetNamePath+': '+sType+' method not implemented');
        if (dwsProperty.Deprecated = '') then
          dwsProperty.Deprecated := 'Not implemented';
        // continue
      end;

      if (dwsProperty.Parameters.Count <> dwsMethod.Parameters.Count-Offset-IndexOffset) then
      begin
        OutputDebugString(dwsProperty.GetNamePath+': '+sType+' method has incorrect parameter count');
        if (dwsProperty.Deprecated = '') then
          dwsProperty.Deprecated := 'Not correctly implemented';
        exit;
      end;
      if (IndexOffset > 0) and (not AnsiSameText(dwsProperty.IndexType, TdwsParameter(dwsMethod.Parameters.Items[0]).DataType)) then
      begin
        OutputDebugString(dwsProperty.GetNamePath+': '+sType+' method has incorrect index parameter type');
        if (dwsProperty.Deprecated = '') then
          dwsProperty.Deprecated := 'Not correctly implemented';
        // continue
      end;
      if (Reader) then
      begin
        if (not (dwsMethod.Kind in [mkFunction, mkClassFunction])) then
        begin
          OutputDebugString(dwsProperty.GetNamePath+': '+sType+' method has incorrect Kind');
          if (dwsProperty.Deprecated = '') then
            dwsProperty.Deprecated := 'Not correctly implemented';
          // continue
        end;
        if (not AnsiSameText(dwsProperty.DataType, dwsMethod.ResultType)) then
        begin
          OutputDebugString(dwsProperty.GetNamePath+': '+sType+' method has incorrect result type');
          if (dwsProperty.Deprecated = '') then
            dwsProperty.Deprecated := 'Not correctly implemented';
          // continue
        end;
      end else
      begin
        if (not (dwsMethod.Kind in [mkProcedure, mkMethod, mkClassProcedure, mkClassMethod])) then
        begin
          OutputDebugString(dwsProperty.GetNamePath+': '+sType+' method has incorrect Kind');
          if (dwsProperty.Deprecated = '') then
            dwsProperty.Deprecated := 'Not correctly implemented';
          // continue
        end;
        if (not AnsiSameText(dwsProperty.DataType, TdwsParameter(dwsMethod.Parameters.Items[dwsMethod.Parameters.Count-1]).DataType)) then
        begin
          OutputDebugString(dwsProperty.GetNamePath+': '+sType+' method has incorrect parameter type');
          if (dwsProperty.Deprecated = '') then
            dwsProperty.Deprecated := 'Not correctly implemented';
          // continue
        end;
      end;

      for i := 0 to dwsProperty.Parameters.Count-1 do
        if (not AnsiSameText(TdwsParameter(dwsProperty.Parameters.Items[i]).DataType, TdwsParameter(dwsMethod.Parameters.Items[i+IndexOffset]).DataType)) then
        begin
          OutputDebugString(dwsProperty.GetNamePath+': '+sType+' method has incorrect parameter type');
          if (dwsProperty.Deprecated = '') then
            dwsProperty.Deprecated := 'Not correctly implemented';
          break;
        end;
    end;
  end;

  procedure DeprecateUnimplemented(dwsUnit: TdwsUnit; dwsClass: TdwsClass; dwsProperty: TdwsProperty); overload;
  var
    dwsMethod: TdwsMethod;
    dwsField: TdwsField;
    dwsBaseClass: TdwsClass;
  begin
    if (dwsProperty.ReadAccess = '') and (dwsProperty.WriteAccess = '') then
    begin
      if (dwsClass.Ancestor = '') then
      begin
        OutputDebugString(dwsProperty.GetNamePath+' can not propagate without base class');
        dwsProperty.Deprecated := 'Not correctly implemented';
      end else
      if (dwsUnit.Classes.Symbols[dwsClass.Ancestor] <> nil) then
      begin
        dwsBaseClass := TdwsClass(dwsUnit.Classes.Symbols[dwsClass.Ancestor]);
        if (dwsBaseClass.Properties.Symbols[dwsProperty.Name] = nil) then
          ;//OutputDebugString(dwsProperty.GetNamePath+' was delegated but is not found in base class');
      end;
      exit;
    end;

    if (dwsProperty.ReadAccess = '') then
      OutputDebugString(dwsProperty.GetNamePath+' has no reader specified')
    else
    begin
      dwsField := TdwsField(dwsClass.Fields.Symbols[dwsProperty.ReadAccess]);
      dwsMethod := TdwsMethod(dwsClass.Methods.Symbols[dwsProperty.ReadAccess]);
      DeprecateUnimplemented(dwsProperty, dwsMethod, dwsField, True);
    end;

    if (dwsProperty.WriteAccess <> '') then
    begin
      dwsField := TdwsField(dwsClass.Fields.Symbols[dwsProperty.WriteAccess]);
      if (dwsField <> nil) and (dwsProperty.Parameters.Count > 0) then
      begin
        OutputDebugString(dwsProperty.GetNamePath+': writer is a field but property has parameters');
        dwsProperty.Deprecated := 'Not correctly implemented';
        exit;
      end;
      dwsMethod := TdwsMethod(dwsClass.Methods.Symbols[dwsProperty.WriteAccess]);
      DeprecateUnimplemented(dwsProperty, dwsMethod, dwsField, False);
    end;
  end;

  procedure DeprecateUnimplemented(dwsUnit: TdwsUnit; dwsClass: TdwsClass); overload;
  var
    i: integer;
  begin
    for i := 0 to dwsClass.Methods.Count-1 do
      DeprecateUnimplemented(dwsClass, TdwsMethod(dwsClass.Methods.Items[i]));
    for i := 0 to dwsClass.Properties.Count-1 do
      DeprecateUnimplemented(dwsUnit, dwsClass, TdwsProperty(dwsClass.Properties.Items[i]));
  end;

  procedure DeprecateUnimplemented(dwsUnit: TdwsUnit); overload;
  var
    i: integer;
  begin
    for i := 0 to dwsUnit.Functions.Count-1 do
      DeprecateUnimplemented(TdwsFunction(dwsUnit.Functions.Items[i]));

    for i := 0 to dwsUnit.Classes.Count-1 do
      DeprecateUnimplemented(dwsUnit, TdwsClass(dwsUnit.Classes.Items[i]));
  end;

var
  i: integer;
begin
  inherited;

  // Mark unimplemented script API methods "deprecated"
  for i := 0 to ComponentCount-1 do
    if (Components[i] is TdwsUnit) then
      DeprecateUnimplemented(TdwsUnit(Components[i]));
end;

class function TCustomScriptModule.NewInstance: TObject;
begin
  Result := inherited NewInstance;
  TCustomScriptModule(Result).FRefCount := 1;
end;

// -----------------------------------------------------------------------------
function TCustomScriptModule.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := S_OK
  else
    Result := E_NOINTERFACE
end;

// -----------------------------------------------------------------------------

function TCustomScriptModule._AddRef: Integer;
begin
  Result := InterlockedIncrement(FRefCount);
end;

// -----------------------------------------------------------------------------

function TCustomScriptModule._Release: Integer;
begin
  Result := InterlockedDecrement(FRefCount);
  if (Result = 0) then
    Free;
end;

// -----------------------------------------------------------------------------
//
// TScriptModule
//
// -----------------------------------------------------------------------------
function TScriptModule.CheckScriptObj(const ScriptObj: IScriptObj): boolean;
begin
  ASSERT(ScriptObj <> nil);
  Result := (ScriptObj.ClassSym <> nil);
end;

// -----------------------------------------------------------------------------

constructor TScriptModule.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TScriptModule.Destroy;
begin
  inherited;
end;

function TScriptModule.Environment(Wrapper: TScriptObjectWrapperBase): IScriptEnvironment;
begin
  Result := Environment(Wrapper.ScriptObj);
end;

function TScriptModule.Environment(Info: TProgramInfo): IScriptEnvironment;
begin
  Result := IScriptEnvironment(Info.Execution.Environment);
end;

function TScriptModule.Environment(const ScriptObj: IScriptObj): IScriptEnvironment;
begin
  Result := IScriptEnvironment(TScriptObjInstance(ScriptObj).ExecutionContext.Environment);
end;

// -----------------------------------------------------------------------------

class function TScriptModule.CreateScriptObject(Info: TProgramInfo; const ClassName: string; ExtObject: TObject; CreateNilObject: boolean; MapClass: boolean): IScriptObj;
var
//  Symbol: TSymbol;
  Symbol: TClassSymbol;
//  SymbolInfo: IInfo;
  MappedClassName: string;
  ScriptObjInstance: TScriptObjInstance;
begin
  if (not CreateNilObject) and (ExtObject = nil) then
  begin
    Result := nil;
    exit;
  end;

  if (ExtObject <> nil) and (MapClass) then
    MappedClassName := ScriptService.FindScriptClassType(ExtObject, ClassName)
  else
    MappedClassName := ClassName;

//  Symbol := Info.Table.FindSymbol(MappedClassName, cvMagic);
  Symbol := Info.Table.FindTypeSymbol(MappedClassName, cvMagic) as TClassSymbol;

  // Fall back to original class name if we could not find the mapped name symbol
  if (Symbol = nil) and (MapClass) and (ClassName <> MappedClassName) then
//    Symbol := Info.Table.FindSymbol(ClassName, cvMagic);
    Symbol := Info.Table.FindTypeSymbol(ClassName, cvMagic) as TClassSymbol;

  if (Symbol = nil) then
  begin
    ShowScriptException(Format('Script class type "%s" not found in context', [ClassName]), '', Info.Execution, False);
    Abort;
  end;

  // See: https://bitbucket.org/egrange/dwscript/issues/83/provide-an-option-to-mark-a-tdwsclass-as
  ScriptObjInstance := TScriptObjInstance.Create(Symbol, Info.Execution);
  ScriptObjInstance.ExternalObject := ExtObject;

  Result := IScriptObj(ScriptObjInstance);

//  Info.GetSymbolInfo(Symbol, SymbolInfo);

//  Result := SymbolInfo.GetConstructor('Create', ExtObject).Call;
end;

class function TScriptModule.CreateScriptObject(const Execution: IdwsProgramExecution; const ClassName: string; ExtObject: TObject; CreateNilObject: boolean): IScriptObj;
begin
  Result := CreateScriptObject(Execution.Info, ClassName, ExtObject, CreateNilObject)
end;

class function TScriptModule.CreateScriptObject(Info: TProgramInfo; const ClassName: string; ExtObject: pointer; CreateNilObject: boolean): IScriptObj;
begin
  if (CreateNilObject) or (ExtObject <> nil) then
    Result := CreateScriptObject(Info, ClassName, ExtObject, CreateNilObject, False)
  else
    Result := nil;
end;

class function TScriptModule.CreateResultScriptObject(Info: TProgramInfo; ExtObject: TObject; CreateNilObject: boolean = False): IScriptObj;
begin
  Result := CreateScriptObject(Info, Info.ResultVars.TypeSym.Name, ExtObject, CreateNilObject);
end;

class function TScriptModule.CreateResultScriptObject(Info: TProgramInfo): IScriptObj;
begin
  Result := CreateScriptObject(Info, Info.ResultVars.TypeSym.Name, nil, True);
end;

class function TScriptModule.CreateResultScriptObject(Info: TProgramInfo; const Unk: IInterface; CreateNilObject: boolean): IScriptObj;
begin
  if (CreateNilObject) or (Unk <> nil) then
    // We're using pointer(Unk) instead of TObject(Unk) to avoid the overhead of the safe inft->class cast; We're not interested in the actual class.
    // This will change when auto script/delphi type mapping is implemented.
    Result := CreateScriptObject(Info, Info.ResultVars.TypeSym.Name, pointer(Unk))
  else
    Result := nil;
end;

// -----------------------------------------------------------------------------

procedure TScriptModule.Finalize;
var
  i: integer;
begin
  for i := 0 to ComponentCount-1 do
    if (Components[i] is TdwsUnit) then
      TdwsUnit(Components[i]).Script := nil;
end;

// -----------------------------------------------------------------------------

procedure TScriptModule.Initialize(DelphiWebScript: TDelphiWebScript);
var
  i: integer;
begin
  for i := 0 to ComponentCount-1 do
    if (Components[i] is TdwsUnit) then
      TdwsUnit(Components[i]).Script := DelphiWebScript;
end;

// -----------------------------------------------------------------------------

procedure TScriptModule.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;

  if (Operation = opRemove) then
    ScriptUnregisterWrappers(AComponent);
end;

// -----------------------------------------------------------------------------

class procedure TScriptModule.PopulateScriptEnum(dwsUnit: TdwsUnit; const ScriptName: string; Info: PTypeInfo; Clear: boolean; Predicate: TPopulateEnumPredicate; Filter: TPopulateEnumFilter);
var
  Enumeration: TdwsEnumeration;
  Element: TdwsElement;
  s: string;
  TypeData: PTypeData;
  i: integer;
begin
  ASSERT(Info.Kind = tkEnumeration);

  Enumeration := TdwsEnumeration(dwsUnit.Enumerations.Symbols[ScriptName]);
  ASSERT(Enumeration <> nil);

  if (Clear) then
    Enumeration.Elements.Clear;

  TypeData := GetTypeData(Info);
  for i := TypeData.MinValue to TypeData.MaxValue do
  begin
    if (Assigned(Predicate)) and (not Predicate(i)) then
      continue;
    Element := Enumeration.Elements.Add;
    s := TypInfo.GetEnumName(Info, i);
    if (Assigned(Filter)) then
      s := Filter(s);
    Element.Name := s;
  end;
end;

class procedure TScriptModule.RegisterModule;
begin
  ScriptService.RegisterModule(Create(nil));
end;

// -----------------------------------------------------------------------------
//
// TScriptEnvironment
//
// -----------------------------------------------------------------------------
var
  FEnvironments: TList<TScriptEnvironment>;

constructor TScriptEnvironment.Create(const AApplication: IScriptHostApplication; const ADocument: IScriptHostDocument; AItem: TObject);
begin
  inherited Create;
  FApplication := AApplication;
  FDocument := ADocument;
  FItem := AItem;

  if (FEnvironments = nil) then
    FEnvironments := TList<TScriptEnvironment>.Create;
  FEnvironments.Add(Self);
end;

// -----------------------------------------------------------------------------

destructor TScriptEnvironment.Destroy;
begin
  ClearLeakedWrappers;

  FEnvironments.Remove(Self);
  if (FEnvironments.Count = 0) then
    FreeAndNil(FEnvironments);

  FreeAndNil(FWrappedObjects);
  inherited;
end;

procedure TScriptEnvironment.ClearLeakedWrappers;
var
  i: integer;
  Wrappers: TArray<TScriptObjectWrapperBase>;
{$ifdef DEBUG}
  Item: TPair<TObject, TScriptObjectWrapperBase>;
  s: string;
{$endif DEBUG}
begin
  if (FWrappedObjects = nil) then
    exit;
{$ifdef DEBUG}
  if (FWrappedObjects.Count > 0) then
  begin
    for Item in FWrappedObjects do
      s := s + #13 + Item.Key.ClassName + ' wrapped by ' + Item.Value.ClassName;
    MessageTaskDlgEx('Script', Format('Leaked wrappers: %d'+s, [FWrappedObjects.Count]), mtInformation, [mbOK]);
  end;
{$endif DEBUG}

  Wrappers := FWrappedObjects.Values.ToArray;
  for i := Length(Wrappers)-1 downto 0 do
    Wrappers[i].DetachScriptObject;
  FWrappedObjects.Clear;
end;

function TScriptEnvironment.GetApplication: IScriptHostApplication;
begin
  Result := FApplication;
end;

// -----------------------------------------------------------------------------

function TScriptEnvironment.GetItem: TObject;
begin
  Result := FItem;
end;

// -----------------------------------------------------------------------------

function TScriptEnvironment.GetDocument: IScriptHostDocument;
begin
  Result := FDocument;
end;

// -----------------------------------------------------------------------------

procedure TScriptEnvironment.RegisterWrapper(Wrapper: TScriptObjectWrapperBase);
begin
  if (FWrappedObjects = nil) then
    FWrappedObjects := TDictionary<TObject, TScriptObjectWrapperBase>.Create;

  FWrappedObjects.AddOrSetValue(Wrapper.Item, Wrapper);

  if (Wrapper.Item is TComponent) then
    ScriptService.RegisterWrappedComponent(TComponent(Wrapper.Item));
end;

procedure TScriptEnvironment.UnregisterWrapper(Wrapper: TScriptObjectWrapperBase);
var
  Item: TPair<TObject, TScriptObjectWrapperBase>;
begin
  if (FWrappedObjects <> nil) then
  begin
    Item := FWrappedObjects.ExtractPair(Wrapper.Item);
    if (Item.Value <> nil) then
      Wrapper.Unregistered;
  end;
end;

function TScriptEnvironment.FindWrapper(AObject: TObject): TScriptObjectWrapperBase;
begin
  if (FWrappedObjects <> nil) then
  begin
    if (not FWrappedObjects.TryGetValue(AObject, Result)) then
      Result := nil;
  end else
    Result := nil;
end;

function ScriptFindWrappers(AObject: TObject): TWrapperList;
var
  i: integer;
  Wrapper: TScriptObjectWrapperBase;
begin
  ASSERT(FEnvironments <> nil);
  for i := 0 to FEnvironments.Count-1 do
  begin
    Wrapper := FEnvironments[i].FindWrapper(AObject);
    if (Wrapper <> nil) then
    begin
      SetLength(Result, Length(Result)+1);
      Result[Length(Result)-1] := Wrapper;
    end;
  end;
end;

procedure ScriptUnregisterWrappers(AObject: TObject);
var
  i: integer;
  Wrapper: TScriptObjectWrapperBase;
begin
  if (FEnvironments = nil) then
    exit;

  for i := FEnvironments.Count-1 downto 0 do
  begin
    Wrapper := FEnvironments[i].FindWrapper(AObject);

    if (Wrapper <> nil) then
      Wrapper.Unregister;
  end;
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

function ShowScriptException(E: Exception; const Execution: IdwsProgramExecution; AllowAbort: boolean): boolean;
var
  Msg: string;
  Info: string;
begin
  Msg := E.Message;
  Info := E.ClassName;

  if (E is EScriptError) then
  begin
    if (EScriptError(E).ScriptPos.Defined) then
      try
        Info := Info + #13 + EScriptError(E).ScriptPos.AsInfo;
      except
        Info := Info + #13 + '- Failed to extract ScriptPos';
      end;
    if (Length(EScriptError(E).ScriptCallStack) > 0) then
      try
        Info := Info + #13#13 + TExprBase.CallStackToString(EScriptError(E).ScriptCallStack);
      except
        // Above has been known to bomb
        Info := Info + #13 + '- Failed to extract script call stack';
      end;

    Result := ShowScriptException(Msg, Info, nil, AllowAbort);
  end else
    Result := ShowScriptException(Msg, Info, Execution, AllowAbort);
end;

function ShowScriptException(const AMsg, AInfo: string; const Execution: IdwsProgramExecution; AllowAbort: boolean): boolean; overload;
var
  Res: integer;
  Info: string;
  Buttons: TMsgDlgButtons;
begin
  Info := AInfo;

  if (Execution <> nil) then
  begin
    if (Execution.GetLastScriptErrorExpr <> nil) and (Execution.GetLastScriptErrorExpr.ScriptPos.Defined) then
      try
        Info := Info + #13 + Execution.GetLastScriptErrorExpr.ScriptPos.AsInfo;
      except
        Info := Info + #13 + '- Failed to extract ScriptPos';
      end;
    if (Length(Execution.GetCallStack) > 0) then
      try
        Info := Info + #13#13 + TExprBase.CallStackToString(Execution.GetCallStack);
      except
        // Darn!
        Info := Info + #13 + '- Failed to extract script call stack';
      end;
  end;

  Buttons := [mbOK];
  if (AllowAbort) then
    Include(Buttons, mbAbort);

  Res := MessageTaskDlgEx('Script run time error', AMsg + '|' + Info, mtWarning, Buttons, mbOK);

  Result := (Res = mrOK);
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
  Result: integer;
begin
  Exec := Args.Exec;
  Exec.Status := esrExit;
  Result := Args.AsInteger[0];
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

  FreeAndNil(FEnvironments);
end.




