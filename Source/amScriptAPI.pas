unit amScriptAPI;

(*
 * Copyright © 2019 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Generics.Collections,
  Classes,
  SysUtils,

  dwsComp,
  dwsExprs,
  dwsSymbols,
  dwsFileSystem,
  dwsErrors,
  dwsDataContext,
{$ifndef OLD_DWSCRIPT}
  dwsInfo,
{$endif OLD_DWSCRIPT}

  amScriptProviderAPI,
  amScriptHostAPI,
  amScriptPackageAPI;

const
  sScriptFileType = '.pas';

type
  EScript = class(Exception);

// -----------------------------------------------------------------------------
//
// IScriptModule
//
// -----------------------------------------------------------------------------
type
  IScriptModule = interface
    procedure Initialize(DelphiWebScript: TDelphiWebScript);
    procedure Finalize;
  end;


// -----------------------------------------------------------------------------
//
// IScriptExecution
//
// -----------------------------------------------------------------------------
// Compiled Script run time state.
// Wraps a IdwsProgramExecution interface.
// -----------------------------------------------------------------------------
type
  IScriptContext = interface;

  IScriptProgramInfo = interface
    function GetProgramInfo: TProgramInfo;
    property ProgramInfo: TProgramInfo read GetProgramInfo;

    function GetInfo(const ScriptObject: IScriptObj): IInfo;
  end;

  IScriptExecution = interface;

  IScriptExecutionNotification = interface
    ['{1BF763EB-61B0-4135-A463-4BE612A5B73E}']
    procedure ExecutionStarted(const Execution: IScriptExecution);
    procedure ExecutionEnded(const Execution: IScriptExecution);
  end;

  IScriptExecution = interface
    procedure Execute(const ScriptProvider: IScriptProvider = nil);
    procedure Finalize;
    function AcquireProgramInfo: IScriptProgramInfo;

    function GetContext: IScriptContext;
    property Context: IScriptContext read GetContext;

    function GetExecution: IdwsProgramExecution;
    property Execution: IdwsProgramExecution read GetExecution;

    function GetExecutionNotification: IScriptExecutionNotification;
    property ExecutionNotification: IScriptExecutionNotification read GetExecutionNotification;
  end;

  IScriptExecutions = interface
    function GetItem(Index: integer): IScriptExecution;
    property Item[Index: integer]: IScriptExecution read GetItem; default;

    function GetCount: integer;
    property Count: integer read GetCount;

    function GetEnumerator: TEnumerator<IScriptExecution>;

    function Find(const Execution: IdwsProgramExecution): IScriptExecution;
    function Contains(const Execution: IScriptExecution): boolean; overload;
    function Contains(const Execution: IdwsProgramExecution): boolean; overload;
  end;

  IScriptExecutionList = interface(IScriptExecutions)
    procedure Add(const Item: IScriptExecution); overload;
    procedure Add(const Item: IScriptExecution; const ScriptID: string); overload;
    procedure Remove(const Item: IScriptExecution);
    procedure Clear;
    function FindByScriptID(const ScriptID: string): IScriptExecution;
    procedure Finalize;
  end;


// -----------------------------------------------------------------------------
//
// IScriptContext
//
// -----------------------------------------------------------------------------
// Used to compile Script and manage context.
// The context wraps the various object instances (Document, Item, etc.) that
// we need access to during script run-time.
// Wraps the IdwsProgram interface that represents the compiled script.
// -----------------------------------------------------------------------------
  IScriptContext = interface
    ['{AF1D755D-4BEC-426A-9050-4302591A2AB9}']
    function Compile(const ScriptProvider: IScriptProvider; Interactive: boolean; Debug: boolean = False): boolean;
    function BeginExecution(const ScriptProvider: IScriptProvider; const AExecutionNotification: IScriptExecutionNotification = nil): IScriptExecution;
    procedure Reset;
    function GetProgram: IdwsProgram;
    property ScriptProgram: IdwsProgram read GetProgram;
  end;

  IScriptContextFileSystems = interface
    ['{6B0B1DAC-549A-4B36-BCF9-41942F9DB56E}']
    function RuntimeFileSystem: TdwsCustomFileSystem;
    function CompilerFileSystem: TdwsCustomFileSystem;
  end;

// -----------------------------------------------------------------------------
//
// IScriptService
//
// -----------------------------------------------------------------------------
// Interface of the ScriptService function.
// ScriptService is the primary Script API entry point.
// -----------------------------------------------------------------------------
type
  IScriptService = interface
    procedure RegisterModule(const Module: IScriptModule);
    procedure UnregisterModule(const Module: IScriptModule);

    procedure RegisterClassTypeMapping(DelphiClassType: TClass; const ScriptClassType: string); overload;
    procedure RegisterClassTypeMapping(DelphiClassType: TClass); overload;
    function FindScriptClassType(Instance: TObject; const Default: string): string;

    procedure RegisterWrappedComponent(AComponent: TComponent);

    function CreateContext(const Document: IScriptHostDocument = nil; AItem: TObject = nil; AForDebug: boolean = False): IScriptContext;
    //function Debug(const ADocument: IScriptHostDocument; AItem: TObject; const ScriptName: string; var Script: string; const AExecution: IdwsProgramExecution = nil): boolean; overload; deprecated;
    //function Debug(const ADocument: IScriptHostDocument; AItem: TObject; const ScriptProvider: IScriptProvider; const AExecution: IdwsProgramExecution = nil): boolean; overload;
    //function Edit(const ADocument: IScriptHostDocument; AItem: TObject; const ScriptName: string; var Script: string; Messages: TdwsMessageList = nil; MsgIndex: integer = -1): boolean; overload; deprecated;
    function Edit(const ADocument: IScriptHostDocument; AItem: TObject; const ScriptProvider: IScriptProvider; Messages: TdwsMessageList = nil; MsgIndex: integer = -1): boolean; overload;
    function Edit(const Filename: string): boolean; overload;
    function Edit(const ScriptProvider: IScriptProvider = nil): boolean; overload;
    function CanEdit: boolean;

    function GetPackages: IScriptPackageList;
    property Packages: IScriptPackageList read GetPackages;
    function CreateTemporaryPackage(const AFilename: string; APackageKind: TScriptPackageKind): IScriptPackage;

    function GetExecutions: IScriptExecutionList;
    property Executions: IScriptExecutionList read GetExecutions;
    function Execute(const Filename: string; var Reason: TScriptExecutionReason): IScriptExecution; overload;
    function Execute(const ScriptProvider: IScriptProvider; var Reason: TScriptExecutionReason): IScriptExecution; overload;
    function ExecutePackage(const Package: IScriptPackage; var Reason: TScriptExecutionReason): IScriptExecution;
  end;

procedure ScriptTrace(const Msg: string; const Context: string = '');
procedure ScriptEncryptStream(SourceStream, TargetStream: TStream; const ProductID, AuthorID, Password: string; Base64Encode: boolean);
procedure ScriptDecryptStream(SourceStream, TargetStream: TStream);

// -----------------------------------------------------------------------------
//
// ScriptService
//
// -----------------------------------------------------------------------------
function ScriptService: IScriptService;

type
  TScriptServiceFactory = function: IScriptService;

procedure RegisterScriptServiceFactory(Factory: TScriptServiceFactory);


implementation

uses
  amScriptModule; // Not directly used but we need to reference ScriptModule in order to get the ScriptServiceFactory registered.

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

procedure ScriptTrace(const Msg, Context: string);
begin
//
end;

procedure ScriptEncryptStream(SourceStream, TargetStream: TStream; const ProductID, AuthorID, Password: string; Base64Encode: boolean);
begin
  TargetStream.CopyFrom(SourceStream, -1);
end;

procedure ScriptDecryptStream(SourceStream, TargetStream: TStream);
begin
  TargetStream.CopyFrom(SourceStream, -1);
end;

// -----------------------------------------------------------------------------
//
// ScriptService
//
// -----------------------------------------------------------------------------
var
  FScriptService: IScriptService = nil;
  FScriptServiceFactory: TScriptServiceFactory = nil;

procedure RegisterScriptServiceFactory(Factory: TScriptServiceFactory);
begin
  FScriptServiceFactory := Factory;
end;

function ScriptService: IScriptService;
begin
  Assert(Assigned(FScriptServiceFactory));

  if (FScriptService = nil) then
    FScriptService := FScriptServiceFactory();

  Result := FScriptService;
end;

initialization
finalization
  FScriptService := nil;
end.
