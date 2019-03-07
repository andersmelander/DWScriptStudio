unit amScriptModule;

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

  amScriptAPI,
  amScriptDebuggerAPI,
  amScriptHostAPI,
  amScriptProviderAPI,
  amScriptPackageAPI;


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

  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function CheckScriptObj(const ScriptObj: IScriptObj): boolean;
    function Environment(const ScriptObj: IScriptObj): IScriptEnvironment; overload;
    function Environment(Info: TProgramInfo): IScriptEnvironment; overload;
    function Environment(Wrapper: TScriptObjectWrapperBase): IScriptEnvironment; overload;
    // Easy access to TScriptEnvironment.FindWrappers from modules
    class function ScriptFindWrappers(AObject: TObject): TWrapperList;

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

    class procedure PopulateScriptEnum(dwsUnit: TdwsUnit; const ScriptName: string; Info: PTypeInfo; Clear: boolean = True; Predicate: TPopulateEnumPredicate = nil; Filter: TPopulateEnumFilter = nil);
  end;


// -----------------------------------------------------------------------------
//
// Error handling
//
// -----------------------------------------------------------------------------
function ScriptHandleException(const Execution: IdwsProgramExecution): boolean;
function ShowScriptException(const AMsg, AInfo: string; const Execution: IdwsProgramExecution = nil; AllowAbort: boolean = True): boolean; overload;
function ShowScriptException(E: Exception; const Execution: IdwsProgramExecution = nil; AllowAbort: boolean = True): boolean; overload;


// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

type
  // TControlCracker must be declared in interface or we get a compiler error:
  // [DCC Error] ...: E2506 Method of parameterized type declared in interface section must not use local symbol 'TControlCracker'
  TControlCracker = class(TControl);

implementation

uses
  Variants,
  Dialogs,

  SynTaskDialog,
  SynCommons,

  dwsXPlatform,
{$ifndef OLD_DWSCRIPT}
  dwsScriptSource,
  dwsInfoClasses,
  dwsCompilerContext,
{$else OLD_DWSCRIPT}
  dwsUnitSymbols,
  dwsInfo,
{$endif OLD_DWSCRIPT}

  IOUtils,

  amDialogs,

  amScriptService,
  amScriptEnvironment;


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

// -----------------------------------------------------------------------------

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
constructor TScriptModule.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TScriptModule.Destroy;
begin
  inherited;
end;

// -----------------------------------------------------------------------------

function TScriptModule.CheckScriptObj(const ScriptObj: IScriptObj): boolean;
begin
  ASSERT(ScriptObj <> nil);
  Result := (ScriptObj.ClassSym <> nil);
end;

// -----------------------------------------------------------------------------

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

class function TScriptModule.ScriptFindWrappers(AObject: TObject): TWrapperList;
begin
  Result := TScriptEnvironment.FindWrappers(AObject);
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
    TScriptEnvironment.UnregisterWrappers(AComponent);
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
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------


initialization
finalization
end.




