unit amScript.Debugger.API;

(*
 * Copyright © 2011 Brian Frost
 * Copyright © 2019 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  SysUtils,
  Windows,
  Classes,
  Graphics,
  ImgList,
  Forms,

  dwsComp,
  dwsDebugger,
  dwsSuggestions, // TODO : Eliminate when DebuggerSuggestionCategoryImageIndexMap is moved
  dwsErrors,
  dwsExprs,
  dwsSymbols,
  dwsScriptSource,

  amScript.Provider.API,
  amScript.Editor.API;

// -----------------------------------------------------------------------------
//
// TScriptDebugger
//
// -----------------------------------------------------------------------------
// ... and redirection of TdwsDebugger
// -----------------------------------------------------------------------------
type
  TScriptDebugger = class(TdwsDebugger)
  private
    FSuspendDebugger: integer;
  protected
    procedure DoDebug(exec: TdwsExecution; expr: TExprBase); override;
  public
    procedure BeginSuspendDebugger;
    procedure EndSuspendDebugger;
    function IsSuspended: boolean;
  end;

  TdwsDebugger = class(TScriptDebugger);

type
  EDWScriptStudio = class(Exception);

type
  TBreakpointStatus = (bpsNone, bpsBreakpoint, bpsBreakpointDisabled);

  TBreakpointUpdate = (bpuRefreshState, bpuRefreshLines, bpuRefreshContext);
  TBreakpointUpdates = set of TBreakpointUpdate;

  (*
  ** dnBreakPointAdd            The specified break point is being added.
  ** dnBreakPointAdded          The specified break point has been added.
  ** dnBreakPointRemove         The specified break point is being removed.
  ** dnBreakPointRemoved        The specified break point has been removed.
  ** dnBreakPointChanged        The state of the specified break point has changed (e.g. Enabled changed)
  ** dnBreakPointsUpdate        All existing break points should be refreshed (e.g. line numbers has changed).
  ** dnBreakPointsClear         All break points has been removed.
  *)
  TScriptDebuggerBreakpointNotification = (
    dnBreakPointAdd, dnBreakPointAdded,
    dnBreakPointRemove, dnBreakPointRemoved,
    dnBreakPointChanged,
    dnBreakPointsUpdate, dnBreakPointsClear);

  IScriptDebuggerBreakPointHandler = interface
    ['{2AAC6E3B-4EF4-4F8F-9A2A-FDA5031A0727}']
    procedure BreakPointNotification(Breakpoint: TdwsDebuggerBreakpoint; Notification: TScriptDebuggerBreakpointNotification; Updates: TBreakpointUpdates);
  end;

// -----------------------------------------------------------------------------
//
// IScriptDebugger
//
// -----------------------------------------------------------------------------
type
  TLineNumbers = TArray<Integer>;

  TScriptDebuggerNotification = (
    sdNotifyInitialize, sdNotifyFinalize,
    dnCompiling, dnCompiled, dnIdle, dnDebugRun, dnDebugSuspending, dnDebugSuspended, dnDebugResuming, dnDebugDone, dnUpdateWatches);

  IScriptDebuggerNotification = interface
    ['{68392E95-BF6C-44D0-B9E0-32CCF727AB36}']
    procedure ScriptDebuggerNotification(Notification: TScriptDebuggerNotification);
  end;

  IScriptDebugger = interface
    ['{A8C3BEBB-C732-46BF-9936-5E53519AF2A2}']
    procedure Subscribe(const Subscriber: IScriptDebuggerNotification);
    procedure Unsubscribe(const Subscriber: IScriptDebuggerNotification);

    function GetDebugger: TdwsDebugger;
    function GetProgram: IdwsProgram;
    function GetCompiledScript: IdwsProgram;

    procedure ViewScriptPos(const AScriptPos: TScriptPos; AMoveCurrent: boolean = False; AHiddenMainModule: Boolean = False);
    function UnitNameFromScriptPos(const ScriptPos: TScriptPos): string;
    function UnitNameFromInternalName(const Name: string): string;

    function CreateEditor(const ScriptProvider: IScriptProvider = nil): IScriptEditor;

    function  GetExecutableLines(const AUnitName: string): TLineNumbers;

    function FindBreakPoint(const ScriptPos: TScriptPos): TBreakpointStatus;
    procedure AddBreakpoint(const ScriptPos: TScriptPos; AEnabled: Boolean = True);
    procedure ClearBreakpoint(const ScriptPos: TScriptPos);
    procedure NotifyBreakPoint(Breakpoint: TdwsDebuggerBreakpoint; Notification: TScriptDebuggerBreakpointNotification; Updates: TBreakpointUpdates = []);

    function SymbolToImageIndex(Symbol: TSymbol): integer;

    procedure AddWatch(const Expression: string);
    procedure Evaluate(const Expression: string; ScriptPos: PScriptPos = nil);

    procedure AddMessageInfo(Messages: TdwsMessageList; Index: integer = -1);
  end;


// -----------------------------------------------------------------------------
//
// IScriptDebuggerHost
//
// -----------------------------------------------------------------------------
type
  TExecutionNotification = (senStarted, senEnded);

  IScriptDebuggerHost = interface
    ['{C19B16FE-404D-4397-90DD-78531A74E498}']
    function GetDelphiWebScript: TDelphiWebScript;
    procedure NotifyExecution(const ScriptDebugger: IScriptDebugger; const Execution: IdwsProgramExecution; Notification: TExecutionNotification);
    procedure NotifyClose(const ScriptDebugger: IScriptDebugger);
  end;


// -----------------------------------------------------------------------------
//
// IScriptDebuggerSetup
//
// -----------------------------------------------------------------------------
type
  IScriptDebuggerSetup = interface
    ['{8B7353B9-2D44-4672-B5C2-F2572B82BDB1}']
    procedure SetEnvironment(const Environment: IdwsEnvironment);

    function AttachAndExecute(const Execution: IdwsProgramExecution): boolean;
    function Execute(Modal: boolean = False): boolean;
  end;

// -----------------------------------------------------------------------------
//
// IScriptDebuggerWindow
//
// -----------------------------------------------------------------------------
type
  IScriptDebuggerWindow = interface
    ['{C5E175C4-B6CE-4BCC-94D1-52986C8047FF}']
    procedure Initialize(const ADebugger: IScriptDebugger; AImageList, AImageListSymbols: TCustomImageList);
  end;


// -----------------------------------------------------------------------------
//
// ScriptDebuggerFactory
//
// -----------------------------------------------------------------------------
type
  TScriptDebuggerFactory = function(const ScriptDebuggerHost: IScriptDebuggerHost; CreateAsMainForm: boolean): IScriptDebugger;
  TScriptDebuggerInitializationCallback = reference to procedure(const ScriptDebugger: IScriptDebugger);

type
  ScriptDebuggerFactory = record
    class procedure RegisterFactory(Factory: TScriptDebuggerFactory); static;
    class function CreateDebugger(const ScriptDebuggerHost: IScriptDebuggerHost; CreateAsMainForm: boolean = False): IScriptDebugger; static;

    class procedure RegisterNotification(Callback: TScriptDebuggerInitializationCallback); static;

    class function CanCreateDebugger: boolean; static;
  end;

const
  sScriptDebuggerBrandName = 'DWScriptStudio';

const
  // TODO : Move to amScript.IDE.Data.API
  DebuggerSymbolImageIndexUnknown       = 0;
  DebuggerSymbolImageIndexUnit          = 1;
  DebuggerSymbolImageIndexType          = 2;
  DebuggerSymbolImageIndexClass         = 3;
  DebuggerSymbolImageIndexRecord        = 4;
  DebuggerSymbolImageIndexInterface     = 5;
  DebuggerSymbolImageIndexDelegate      = 6;
  DebuggerSymbolImageIndexFunction      = 7;
  DebuggerSymbolImageIndexProcedure     = 8;
  DebuggerSymbolImageIndexMethod        = 9;
  DebuggerSymbolImageIndexConstructor   = 10;
  DebuggerSymbolImageIndexDestructor    = 11;
  DebuggerSymbolImageIndexProperty      = 12;
  DebuggerSymbolImageIndexEnum          = 13;
  DebuggerSymbolImageIndexElement       = 14;
  DebuggerSymbolImageIndexParameter     = 15;
  DebuggerSymbolImageIndexField         = -1;
  DebuggerSymbolImageIndexVariable      = 16;
  DebuggerSymbolImageIndexConst         = 17;
  DebuggerSymbolImageIndexReservedWord  = 18;
  DebuggerSymbolImageIndexSpecialFunction = 19;
  DebuggerSymbolImageIndexMeta          = 20;
  DebuggerSymbolImageIndexArray         = 21;
  DebuggerSymbolImageIndexSet           = 22;
  DebuggerSymbolImageIndexOperator      = 23;

  DebuggerSymbolImageIndexOverlayAdd    = 24;
  DebuggerSymbolImageIndexOverlayChanged = 25;
  DebuggerSymbolImageIndexOverlayWarning = 26;

  DebuggerSuggestionCategoryImageIndexMap: array[TdwsSuggestionCategory] of integer = (
    DebuggerSymbolImageIndexUnknown,
    DebuggerSymbolImageIndexUnit,
    DebuggerSymbolImageIndexType,
    DebuggerSymbolImageIndexClass,
    DebuggerSymbolImageIndexRecord,
    DebuggerSymbolImageIndexInterface,
    DebuggerSymbolImageIndexDelegate,
    DebuggerSymbolImageIndexFunction,
    DebuggerSymbolImageIndexProcedure,
    DebuggerSymbolImageIndexMethod,
    DebuggerSymbolImageIndexConstructor,
    DebuggerSymbolImageIndexDestructor,
    DebuggerSymbolImageIndexProperty,
    DebuggerSymbolImageIndexEnum,
    DebuggerSymbolImageIndexElement,
    DebuggerSymbolImageIndexParameter,
    DebuggerSymbolImageIndexField,
    DebuggerSymbolImageIndexVariable,
    DebuggerSymbolImageIndexConst,
    DebuggerSymbolImageIndexReservedWord,
    DebuggerSymbolImageIndexSpecialFunction
  );


  // Utility routines
function BeginsWith(const AFragment, AStr: string; AMatchCase: boolean = False): boolean;
// Returns TRUE if AStr begins with AFragment

function IsValidIdentifier( const AName : string ) : boolean;
// Returns TRUE if this name is an identifier i.e
// a word starting with a letter and having chars 2..n as letters or numbers.


// -----------------------------------------------------------------------------
//
// TScriptDebuggerFrame
//
// -----------------------------------------------------------------------------
type
  TScriptDebuggerFrame = class abstract(TFrame, IScriptDebuggerWindow, IScriptDebuggerNotification)
  strict private
    FDebugger: IScriptDebugger;
  strict protected
    property Debugger: IScriptDebugger read FDebugger;
  strict protected
    // IScriptDebuggerWindow
    procedure Initialize(const ADebugger: IScriptDebugger; AImageList, AImageListSymbols: TCustomImageList); virtual;
  strict protected
    // IScriptDebuggerNotification
    procedure ScriptDebuggerNotification(Notification: TScriptDebuggerNotification); virtual;
  public
  end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

implementation

uses
  System.Generics.Collections,
  System.Variants,
  dwsCompiler,
  dwsInfo,
  dwsDataContext;

function BeginsWith( const AFragment, AStr : string; AMatchCase : boolean = False ) : boolean;
// Returns TRUE if AStr begins with AFragment
var
  I : integer;
begin
  Result := False;
  if AFragment = '' then
    Exit;

  if AStr = '' then
    Exit;

  if Length( AStr ) < Length( AFragment ) then
    Exit;

  if AMatchCase then
  begin
    for I := 1 to Length( AFragment ) do
      if AFragment[I] <> AStr[I] then
        Exit;
  end
  else
    for I := 1 to Length( AFragment ) do
      if UpCase(AFragment[I]) <> UpCase(AStr[I]) then
        Exit;

  Result := True;
end;


function IsValidIdentifier( const AName : string ) : boolean;
// Returns TRUE if this name is an identifier i.e
// a word starting with a letter and having chars 2..n as letters or numbers.
const
  AllowedFirstChar = ['A'..'Z', 'a'..'z', '_' ];
  AllowedSubsequentChars = AllowedFirstChar + ['0'..'9'];
var
  I : integer;
begin
  Result := False;

  if Length( AName ) < 1 then
    Exit;

  if not CharInSet(AName[1], AllowedFirstChar ) then
    Exit;

  for I := 2 to Length( AName ) do
    if not CharInSet(AName[I], AllowedSubsequentChars) then
      Exit;

  Result := True;
end;

// -----------------------------------------------------------------------------
//
// TScriptDebugger
//
// -----------------------------------------------------------------------------
procedure TScriptDebugger.BeginSuspendDebugger;
begin
  inc(FSuspendDebugger);
end;

procedure TScriptDebugger.EndSuspendDebugger;
begin
  dec(FSuspendDebugger);
end;

function TScriptDebugger.IsSuspended: boolean;
begin
  Result := (FSuspendDebugger > 0);
end;

procedure TScriptDebugger.DoDebug(exec: TdwsExecution; expr: TExprBase);
begin
  if (IsSuspended) then
    exit;

  BeginSuspendDebugger;
  try
    inherited;
  finally
    EndSuspendDebugger;
  end;
end;


// -----------------------------------------------------------------------------
//
// TScriptDebuggerFrame
//
// -----------------------------------------------------------------------------
procedure TScriptDebuggerFrame.Initialize(const ADebugger: IScriptDebugger; AImageList, AImageListSymbols: TCustomImageList);
begin
  FDebugger := ADebugger;
  FDebugger.SubScribe(Self);
end;

procedure TScriptDebuggerFrame.ScriptDebuggerNotification(Notification: TScriptDebuggerNotification);
begin
  case Notification of
    sdNotifyFinalize:
      begin
        FDebugger.Unsubscribe(Self);
        FDebugger := nil;
      end;
  end;
end;

// -----------------------------------------------------------------------------
//
// ScriptDebuggerFactory
//
// -----------------------------------------------------------------------------
var
  FScriptDebuggerFactory: TScriptDebuggerFactory = nil;
  FScriptDebuggerInitializationCallbacks: TList<TScriptDebuggerInitializationCallback> = nil;

class procedure ScriptDebuggerFactory.RegisterFactory(Factory: TScriptDebuggerFactory);
begin
  FScriptDebuggerFactory := Factory;
end;

class procedure ScriptDebuggerFactory.RegisterNotification(Callback: TScriptDebuggerInitializationCallback);
begin
  if (FScriptDebuggerInitializationCallbacks = nil) then
    FScriptDebuggerInitializationCallbacks := TList<TScriptDebuggerInitializationCallback>.Create;
  FScriptDebuggerInitializationCallbacks.Add(Callback);
end;

class function ScriptDebuggerFactory.CanCreateDebugger: boolean;
begin
  Result := Assigned(FScriptDebuggerFactory);
end;

class function ScriptDebuggerFactory.CreateDebugger(const ScriptDebuggerHost: IScriptDebuggerHost; CreateAsMainForm: boolean): IScriptDebugger;
begin
  if (not CanCreateDebugger) then
    raise Exception.Create('No Script Debugger Factory has been registered');

  Result := FScriptDebuggerFactory(ScriptDebuggerHost, CreateAsMainForm);

  if (FScriptDebuggerInitializationCallbacks <> nil) then
    for var Callback in FScriptDebuggerInitializationCallbacks do
      Callback(Result);
end;

initialization
finalization
  ScriptDebuggerFactory.RegisterFactory(nil);
  FScriptDebuggerInitializationCallbacks.Free;
end.
