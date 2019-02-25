unit ScriptExternalFunctionManager;

(*
 * Copyright © 2012 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

// -----------------------------------------------------------------------------
//
// Implements import and binding of external DLLs using the same syntax as Delphi.
//
// -----------------------------------------------------------------------------

uses
  SysUtils,
  dwsXPlatform, dwsExprList, dwsUtils,
  dwsCompiler, dwsExprs, dwsMagicExprs, dwsSymbols, dwsFunctions;

// -----------------------------------------------------------------------------
//
// TScriptExternalFunctionManager
//
// -----------------------------------------------------------------------------
type
  TScriptExternalFunctionManager = class(TInterfacedObject, IdwsExternalFunctionsManager)
  private
    FCompiler: IdwsCompiler;
  protected
    // IdwsExternalFunctionsManager
    procedure BeginCompilation(const compiler: IdwsCompiler);
    procedure EndCompilation(const compiler: IdwsCompiler);
    function ConvertToMagicSymbol(value: TFuncSymbol): TFuncSymbol;
    function CreateExternalFunction(funcSymbol: TFuncSymbol): IExternalRoutine;
    procedure RegisterTypeMapping(const name: UnicodeString; const typ: TTypeLookupData);
  public
    constructor Create;
    destructor Destroy; override;

    procedure RegisterExternalFunction(const name: UnicodeString; address: pointer);

    property Compiler: IdwsCompiler read FCompiler;
  end;

// -----------------------------------------------------------------------------
//
// TScriptExternalProcedure
//
// -----------------------------------------------------------------------------
  TScriptExternalProcedure = class(TInternalMagicProcedure, IExternalRoutine)
  private
    FModuleName: string;
    FFunctionName: string;
    FModule: HMODULE;
    FEntryPoint: pointer;
  protected
    // IExternalRoutine
    procedure SetExternalPointer(value: pointer);
  public
    constructor Create(aFuncSymbol: TFuncSymbol; prog: TdwsProgram; const AModuleName, AFunctionName: string);
    destructor Destroy; override;
    procedure DoEvalProc(const args: TExprBaseListExec); override;
    property ModuleName: string read FModuleName write FModuleName;
  end;

// -----------------------------------------------------------------------------
//
// TScriptExternalFunction
//
// -----------------------------------------------------------------------------
  TScriptExternalFunction = class(TInternalMagicVariantFunction, IExternalRoutine)
  private
    FModuleName: string;
    FFunctionName: string;
    FModule: HMODULE;
    FEntryPoint: pointer;
  protected
    // IExternalRoutine
    procedure SetExternalPointer(value: pointer);
  public
    constructor Create(aFuncSymbol: TFuncSymbol; prog: TdwsProgram; const AModuleName, AFunctionName: string);
    destructor Destroy; override;

    procedure DoEvalAsVariant(const args: TExprBaseListExec; var Result: Variant); override;
    property ModuleName: string read FModuleName write FModuleName;
  end;

// -----------------------------------------------------------------------------
// See:
// MSDN: Windows Data Types
// https://msdn.microsoft.com/en-us/library/windows/desktop/aa383751%28v=vs.85%29.aspx
const
  WINAPI_BYTE = 'BYTE';
  WINAPI_WORD = 'WORD';
  WINAPI_DWORD = 'DWORD';
  WINAPI_QWORD = 'DWORDLONG';

  WINAPI_UINT8 = 'UINT8';
  WINAPI_UINT16 = 'UINT16';
  WINAPI_UINT32 = 'UINT32';
  WINAPI_UINT64 = 'UINT64';

  WINAPI_INT8 = 'INT8';
  WINAPI_INT16 = 'INT16';
  WINAPI_INT32 = 'INT32';
  WINAPI_INT64 = 'INT64';

  WINAPI_BOOL = 'BOOL';
  WINAPI_ANSICHAR = 'ANSICHAR';
  WINAPI_CHAR = 'CHAR';

  WINAPI_HANDLE = 'HANDLE';

  WINAPI_POINTER = 'pointer';
  WINAPI_PANSICHAR = 'PANSICHAR';
  WINAPI_PCHAR = 'PCHAR';

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

implementation

uses
  Windows,
  RTTI,
  TypInfo,
  dwsStrings,
  dwsTokenizer,
  dwsDataContext,
  dwsUnitSymbols;


// -----------------------------------------------------------------------------
//
// TWinApiTypeSymbol
//
// -----------------------------------------------------------------------------
type
  TWinApiTypeSymbol = class(TBaseSymbol)
  protected
  public
    constructor Create(const name: UnicodeString); virtual;

    function IsCompatible(typSym : TTypeSymbol) : Boolean; override;
    function AsValue(Value: int64): TValue; virtual; abstract;
    function GetTypeInfo: PTypeInfo; virtual; abstract;
  end;

  TWinApiTypeSymbolClass = class of TWinApiTypeSymbol;

// -----------------------------------------------------------------------------

constructor TWinApiTypeSymbol.Create(const name: UnicodeString);
begin
  inherited Create(name);
end;

// -----------------------------------------------------------------------------

function TWinApiTypeSymbol.IsCompatible(typSym: TTypeSymbol): Boolean;
begin
  Result := (typSym <> nil) and (typSym.InheritsFrom(TWinApiTypeSymbol));
end;

// -----------------------------------------------------------------------------
//
// TWinApiTypeIntegerSymbol<T>
//
// -----------------------------------------------------------------------------
type
  TWinApiTypeIntegerSymbol<T> = class(TWinApiTypeSymbol)
  protected
  public
    function IsCompatible(typSym : TTypeSymbol) : Boolean; override;
    procedure InitData(const data : TData; offset : Integer); override;
    function AsValue(Value: int64): TValue; override;
    function GetTypeInfo: PTypeInfo; override;
  end;

// -----------------------------------------------------------------------------

function TWinApiTypeIntegerSymbol<T>.AsValue(Value: int64): TValue;
begin
  Result := TValue.FromOrdinal(TypeInfo(T), Value);
end;

// -----------------------------------------------------------------------------

function TWinApiTypeIntegerSymbol<T>.GetTypeInfo: PTypeInfo;
begin
  Result := TypeInfo(T);
end;

// -----------------------------------------------------------------------------

procedure TWinApiTypeIntegerSymbol<T>.InitData(const data: TData; offset: Integer);
begin
  data[offset] := 0;
end;

// -----------------------------------------------------------------------------

function TWinApiTypeIntegerSymbol<T>.IsCompatible(typSym: TTypeSymbol): Boolean;
begin
  Result := (typSym <> nil) and (typSym.InheritsFrom(TBaseIntegerSymbol) or typSym.InheritsFrom(TWinApiTypeSymbol));
end;

// -----------------------------------------------------------------------------
//
// TScriptExternalProcedure
//
// -----------------------------------------------------------------------------
constructor TScriptExternalProcedure.Create(aFuncSymbol: TFuncSymbol; prog: TdwsProgram; const AModuleName, AFunctionName: string);
begin
  funcSymbol := aFuncSymbol;
  FModuleName := AModuleName;
  FFunctionName := AFunctionName;

  ASSERT(assigned(aFuncSymbol));
  ASSERT(aFuncSymbol.Result = nil);
  ASSERT(aFuncSymbol.Executable = nil);
  ASSERT(aFuncSymbol.ExternalConvention in [ttREGISTER .. ttSTDCALL]);
end;

destructor TScriptExternalProcedure.Destroy;
begin
  FreeModule(FModule);
  inherited Destroy;
end;

// -----------------------------------------------------------------------------

procedure TScriptExternalProcedure.DoEvalProc(const args: TExprBaseListExec);
begin
  if (FModule = 0) then
    FModule := SafeLoadLibrary(FModuleName);
  if (FModule = 0) then
    RaiseLastOSError;

  FEntryPoint := GetProcAddress(FModule, PChar(FFunctionName));
  if (FEntryPoint = nil) then
    RaiseLastOSError;
end;

// -----------------------------------------------------------------------------

procedure TScriptExternalProcedure.SetExternalPointer(value: pointer);
begin
end;

// -----------------------------------------------------------------------------
//
// TScriptExternalFunction
//
// -----------------------------------------------------------------------------
constructor TScriptExternalFunction.Create(aFuncSymbol: TFuncSymbol; prog: TdwsProgram; const AModuleName, AFunctionName: string);
begin
  funcSymbol := aFuncSymbol;
  FModuleName := AModuleName;
  FFunctionName := AFunctionName;

  ASSERT(assigned(aFuncSymbol));
  ASSERT(assigned(aFuncSymbol.Result));
  ASSERT(aFuncSymbol.Executable = nil);
  ASSERT(aFuncSymbol.ExternalConvention in [ttREGISTER .. ttSTDCALL]);
end;

destructor TScriptExternalFunction.Destroy;
begin
  FreeModule(FModule);
  inherited Destroy;
end;

// -----------------------------------------------------------------------------

procedure TScriptExternalFunction.DoEvalAsVariant(const args: TExprBaseListExec; var Result: Variant);
var
  ProcCallingConvention: TCallConv;
  ProcArgs: TArray<TValue>;
  ProcResultType: PTypeInfo;
  ProcResult: TValue;
  Value: TValue;
  TypedExpr: TTypedExpr;
  ParamSymbol: TTypeSymbol;
  OrdinalValue: int64;
  i: integer;
  v: Variant;
  s: string;
begin
  if (FModule = 0) then
    FModule := SafeLoadLibrary(FModuleName);
  if (FModule = 0) then
    RaiseLastOSError;

  FEntryPoint := GetProcAddress(FModule, PChar(FFunctionName));
  if (FEntryPoint = nil) then
    RaiseLastOSError;

  SetLength(ProcArgs, Args.Count);
  for i := 0 to Args.Count-1 do
  begin
    TypedExpr := (args.ExprBase[i] as TTypedExpr);
    ParamSymbol := FuncSymbol.Params[i].Typ;
    if (ParamSymbol.UnAliasedType.InheritsFrom(TWinApiTypeSymbol)) then
    begin
      OrdinalValue := TypedExpr.EvalAsInteger(args.Exec);
      Value := TWinApiTypeSymbol(ParamSymbol.UnAliasedType).AsValue(OrdinalValue);
    end else
    begin
      s := FuncSymbol.Params[i].Typ.BaseType.Name;
      if (s = SYS_INTEGER) then
        Value := Int64(args.AsInteger[i])
      else
      if (s = SYS_BOOLEAN) then
        Value := args.AsBoolean[i]
      else
      if (s = SYS_STRING) then
        Value := args.AsString[i]
      else
      if (s = SYS_FLOAT) then
        Value := args.AsFloat[i]
      else
      if (s = SYS_VARIANT) then
      begin
        args.EvalAsVariant(i, v);
        Value := TValue.FromVariant(v);
      end else
        raise Exception.Create('Unsupported parameter data type');
    end;

    ProcArgs[i] := Value;
  end;

  if (FuncSymbol.Result.Typ.UnAliasedType.InheritsFrom(TWinApiTypeSymbol)) then
    ProcResultType := TWinApiTypeSymbol(FuncSymbol.Result.Typ.UnAliasedType).GetTypeInfo
  else
  begin
    s := FuncSymbol.Result.Typ.BaseType.Name;

    if (s = SYS_INTEGER) then
      ProcResultType := TypeInfo(Int64)
    else
    if (s = SYS_BOOLEAN) then
      ProcResultType := TypeInfo(BOOL)
    else
    if (s = SYS_STRING) then
      ProcResultType := TypeInfo(PChar)
    else
    if (s = SYS_FLOAT) then
      ProcResultType := TypeInfo(Double)
    else
    if (s = SYS_VARIANT) then
      ProcResultType := TypeInfo(OleVariant)
    else
      raise Exception.Create('Unsupported result data type');
  end;

  case FuncSymbol.ExternalConvention of
    ttREGISTER:
      ProcCallingConvention := ccReg;
    ttCDECL:
      ProcCallingConvention := ccCdecl;
    ttPASCAL:
      ProcCallingConvention := ccPascal;
    ttSTDCALL:
      ProcCallingConvention := ccStdCall;
    ttSAFECALL:
      ProcCallingConvention := ccSafeCall;
  else
    raise Exception.Create('Unsupported calling convention');
  end;

  ProcResult := RTTI.Invoke(FEntryPoint, ProcArgs, ProcCallingConvention, ProcResultType);

  Result := ProcResult.AsVariant;
end;

// -----------------------------------------------------------------------------

procedure TScriptExternalFunction.SetExternalPointer(value: pointer);
begin
end;

// -----------------------------------------------------------------------------
//
// TScriptExternalFunctionManager
//
// -----------------------------------------------------------------------------
constructor TScriptExternalFunctionManager.Create;
begin
  inherited;
end;

destructor TScriptExternalFunctionManager.Destroy;
begin
  inherited;
end;

// -----------------------------------------------------------------------------

procedure TScriptExternalFunctionManager.BeginCompilation(const compiler: IdwsCompiler);
begin
  ASSERT(FCompiler = nil, 'Only one session supported right now');
  FCompiler := compiler;
end;

// -----------------------------------------------------------------------------

procedure TScriptExternalFunctionManager.EndCompilation(const compiler: IdwsCompiler);
begin
  ASSERT(FCompiler = compiler);
  FCompiler := nil;
end;

// -----------------------------------------------------------------------------

function TScriptExternalFunctionManager.ConvertToMagicSymbol(value: TFuncSymbol): TFuncSymbol;
var
  i: integer;
begin
  Result := TMagicFuncSymbol.Create(value.Name, value.Kind, value.Level);
  try
    Result.typ := value.typ;
    Result.ExternalName := Value.ExternalName;

    for i := 0 to value.Params.Count - 1 do
      Result.AddParam(value.Params[i].Clone);
  except
    Result.Free;
    raise;
  end;
  value.Free;
end;

// -----------------------------------------------------------------------------

function TScriptExternalFunctionManager.CreateExternalFunction(funcSymbol: TFuncSymbol): IExternalRoutine;
var
  ModuleName: string;
  FunctionName: string;
  i: integer;
begin
  // External name:
  // "function_alias_name@module_name" or "module_name"
  ModuleName := funcSymbol.ExternalName;
  i := Pos('@', ModuleName);
  if (i > 0) then
  begin
    FunctionName := ModuleName;
    SetLength(FunctionName, i-1);
    Delete(ModuleName, 1, i);
  end else
    FunctionName := funcSymbol.Name;

  if assigned(funcSymbol.Result) then
    Result := TScriptExternalFunction.Create(funcSymbol, compiler.CurrentProg.Root, ModuleName, FunctionName)
  else
    Result := TScriptExternalProcedure.Create(funcSymbol, compiler.CurrentProg.Root, ModuleName, FunctionName);
end;

// -----------------------------------------------------------------------------

procedure TScriptExternalFunctionManager.RegisterExternalFunction(const name: UnicodeString; address: pointer);
begin
end;


// -----------------------------------------------------------------------------

procedure TScriptExternalFunctionManager.RegisterTypeMapping(const name: UnicodeString; const typ: TTypeLookupData);
begin
end;

// -----------------------------------------------------------------------------
//
//      RegisterWinAPITypes
//
// -----------------------------------------------------------------------------
procedure RegisterWinAPITypes(systemTable: TSystemSymbolTable; unitSyms: TUnitMainSymbols; unitTable: TSymbolTable);

  function RegisterType(const Name: string; SymbolClass: TWinApiTypeSymbolClass): TTypeSymbol;
  begin
    Result := systemTable.FindTypeLocal(Name);
    if (Result <> nil) then
      exit;

    Result := SymbolClass.Create(Name);
    systemTable.AddSymbol(Result);
  end;

  procedure RegisterTypeAlias(TypeSymbol: TTypeSymbol; const AliasName: string); overload;
  var
    AliasSymbol: TTypeSymbol;
  begin
    if (systemTable.FindLocal(AliasName) <> nil) then
      exit;

    AliasSymbol := TAliasSymbol.Create(AliasName, TypeSymbol);
    systemTable.AddSymbol(AliasSymbol);
  end;

  procedure RegisterTypeAlias(const Name: string; const AliasName: string); overload;
  var
    TypeSymbol: TTypeSymbol;
  begin
    TypeSymbol := systemTable.FindTypeLocal(Name);
    ASSERT(TypeSymbol <> nil);

    RegisterTypeAlias(TypeSymbol, AliasName);
  end;

var
  TypeSymbolByte: TTypeSymbol;
  TypeSymbolWord: TTypeSymbol;
  TypeSymbolDWord: TTypeSymbol;
  TypeSymbolQWord: TTypeSymbol;
  TypeSymbolSignedByte: TTypeSymbol;
  TypeSymbolSignedWord: TTypeSymbol;
  TypeSymbolSignedDWord: TTypeSymbol;
  TypeSymbolSignedQWord: TTypeSymbol;
begin
  TypeSymbolByte := RegisterType(WINAPI_BYTE, TWinApiTypeIntegerSymbol<UInt8>);
  TypeSymbolWord := RegisterType(WINAPI_WORD, TWinApiTypeIntegerSymbol<UInt16>);
  TypeSymbolDWord := RegisterType(WINAPI_DWORD, TWinApiTypeIntegerSymbol<UInt32>);
  TypeSymbolQWord := RegisterType(WINAPI_QWORD, TWinApiTypeIntegerSymbol<UInt64>);

  TypeSymbolSignedByte := RegisterType(WINAPI_INT8, TWinApiTypeIntegerSymbol<Int8>);
  TypeSymbolSignedWord := RegisterType(WINAPI_INT16, TWinApiTypeIntegerSymbol<UInt16>);
  TypeSymbolSignedDWord := RegisterType(WINAPI_INT32, TWinApiTypeIntegerSymbol<UInt32>);
  TypeSymbolSignedQWord := RegisterType(WINAPI_INT64, TWinApiTypeIntegerSymbol<UInt64>);

  // The rest are just aliases
  RegisterTypeAlias(TypeSymbolSignedByte, WINAPI_UINT8);
  RegisterTypeAlias(TypeSymbolSignedWord, WINAPI_UINT16);
  RegisterTypeAlias(TypeSymbolSignedDWord, WINAPI_UINT32);
  RegisterTypeAlias(TypeSymbolSignedQWord, WINAPI_UINT64);

  RegisterTypeAlias(TypeSymbolWord, WINAPI_BOOL);
  RegisterTypeAlias(TypeSymbolDWord, WINAPI_HANDLE);

  // TODO : Char and pointer types
(*
  TypeSymbolChar := RegisterType(WINAPI_CHAR, TWinApiTypeIntegerSymbol<Char>);
  TypeSymbolAnsiChar := RegisterType(WINAPI_ANSICHAR, TWinApiTypeIntegerSymbol<AnsiChar>);

  RegisterType(WINAPI_POINTER, TWinApiTypeUInt64Symbol);

  RegisterType(WINAPI_PCHAR, TWinApiTypeUInt64Symbol);
  RegisterType(WINAPI_PANSICHAR, TWinApiTypeUInt64Symbol);
*)
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

initialization
  dwsInternalUnit.AddSymbolsRegistrationProc(RegisterWinAPITypes);
end.
