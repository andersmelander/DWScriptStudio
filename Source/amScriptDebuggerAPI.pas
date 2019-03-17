unit amScriptDebuggerAPI;

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
  dwsSuggestions,
  dwsErrors,
  dwsExprs,
  dwsSymbols,
{$ifndef OLD_DWSCRIPT}
  dwsScriptSource,
{$endif OLD_DWSCRIPT}

  SynEditHighlighter,
  SynHighlighterDWS,

  amScriptProviderAPI;

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
// IScriptDebugEditPage
//
// -----------------------------------------------------------------------------
type
  IScriptDebugEditPage = interface
    procedure LoadFromFile(const AFilename: string);
    procedure LoadFromStream(Stream: TStream);
    procedure LoadFromString(const AScript: string);

    function GetHasProvider: boolean;
    property HasProvider: boolean read GetHasProvider;

    function GetScript: string;
    procedure SetScript(const Value: string);
    property Script: string read GetScript write SetScript;

    function GetModified: boolean;
    property Modified: boolean read GetModified;
    procedure ClearModified;

    function GetCanClose: boolean;
    procedure SetCanClose(const Value: boolean);
    property CanClose: boolean read GetCanClose write SetCanClose;

    function GetCaption: string;
    procedure SetCaption(const Value: string);
    property Caption: string read GetCaption write SetCaption;

    function  GetFilename: TFileName;
    procedure SetFileName(const Value: TFileName);
    property FileName: TFileName read GetFilename write SetFileName;

    function GetIsReadOnly: Boolean;
    procedure SetIsReadOnly(const Value: Boolean);
    property IsReadOnly: Boolean read GetIsReadOnly write SetIsReadOnly;

    function GetIndex: integer;
    property Index: integer read GetIndex;
  end;


// -----------------------------------------------------------------------------
//
// IScriptDebugger
//
// -----------------------------------------------------------------------------
type
  IScriptDebugger = interface
    ['{A8C3BEBB-C732-46BF-9936-5E53519AF2A2}']
    function GetDebugger: TdwsDebugger;
    function GetProgram: IdwsProgram;
    function GetCompiledScript: IdwsProgram;

    procedure ViewScriptPos(const AScriptPos: TScriptPos; AMoveCurrent: boolean = False; AHiddenMainModule: Boolean = False);
    function UnitNameFromScriptPos(const ScriptPos: TScriptPos): string;
    function UnitNameFromInternalName(const Name: string): string;

    function EditorPageAddNew(const ScriptProvider: IScriptProvider = nil): IScriptDebugEditPage;

    function FindBreakPoint(const ScriptPos: TScriptPos): TBreakpointStatus;
    procedure AddBreakpoint(const ScriptPos: TScriptPos; AEnabled: Boolean = True);
    procedure ClearBreakpoint(const ScriptPos: TScriptPos);
    procedure NotifyBreakPoint(Breakpoint: TdwsDebuggerBreakpoint; Notification: TScriptDebuggerBreakpointNotification; Updates: TBreakpointUpdates = []);

    function SymbolToImageIndex(Symbol: TSymbol): integer;

    procedure AddWatch(const Expression: string);
    procedure Evaluate(const Expression: string; ScriptPos: PScriptPos = nil);

    procedure AddMessageInfo(Messages: TdwsMessageList; Index: integer = -1);
  end;

  TScriptDebuggerNotification = (dnCompiling, dnCompiled, dnIdle, dnDebugRun, dnDebugSuspending, dnDebugSuspended, dnDebugResuming, dnDebugDone, dnUpdateWatches);


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
    procedure Finalize;

    procedure DebuggerStateChanged(State: TScriptDebuggerNotification);
  end;


// -----------------------------------------------------------------------------
//
// ScriptDebuggerFactory
//
// -----------------------------------------------------------------------------
type
  TScriptDebuggerFactory = function(const ScriptDebuggerHost: IScriptDebuggerHost; CreateAsMainForm: boolean): IScriptDebugger;

procedure RegisterScriptDebuggerFactory(Factory: TScriptDebuggerFactory);

function CreateScriptDebugger(const ScriptDebuggerHost: IScriptDebuggerHost; CreateAsMainForm: boolean = False): IScriptDebugger;
function CanCreateScriptDebugger: boolean;


// -----------------------------------------------------------------------------
//
// TSynDWSSyn_DelphiLookalike
//
// -----------------------------------------------------------------------------
type
  TEditorHighlighterClass = class of TSynCustomHighlighter;

type
  // TODO : Move this out of the API unit
  TSynDWSSyn_DelphiLookalike = class(TSynDWSSyn)
    constructor Create(AOwner: TComponent); override;
  end;


const
  SuggestionCategoryNames : array[TdwsSuggestionCategory] of string = (
    'Unknown',
    'Unit',
    'Type',
    'Class',
    'Record',
    'Interface',
    'Delegate',
    'Function',
    'Procedure',
    'Method',
    'Constructor',
    'Destructor',
    'Property',
    'Enum',
    'Element',
    'Parameter',
{$ifndef OLD_DWSCRIPT}
    'Field',
{$endif OLD_DWSCRIPT}
    'Variable',
    'Const',
    'ReservedWord',
    'SpecialFunction' );


  sScriptDebuggerBrandName = 'DWScriptStudio';

  sDwsIdeProjectSourceFileExt   = '.dws';     // ext of the main file (like Delphi's dpr)
  sDwsIdeProjectSourceFileExt2  = '.pas';     // ext of units
  sDwsIdeProjectFileExt         = '.dwsproj'; // ext of the project file (like Delphi dproj)


  DebuggerSymbolImageIndexUnknown = Ord(scUnknown);
  DebuggerSymbolImageIndexUnit = Ord(scUnit);
  DebuggerSymbolImageIndexType = Ord(scType);
  DebuggerSymbolImageIndexClass = Ord(scClass);
  DebuggerSymbolImageIndexRecord = Ord(scRecord);
  DebuggerSymbolImageIndexInterface = Ord(scInterface);
  DebuggerSymbolImageIndexDelegate = Ord(scDelegate);
  DebuggerSymbolImageIndexFunction = Ord(scFunction);
  DebuggerSymbolImageIndexProcedure = Ord(scProcedure);
  DebuggerSymbolImageIndexMethod = Ord(scMethod);
  DebuggerSymbolImageIndexConstructor = Ord(scConstructor);
  DebuggerSymbolImageIndexDestructor = Ord(scDestructor);
  DebuggerSymbolImageIndexProperty = Ord(scProperty);
  DebuggerSymbolImageIndexEnum = Ord(scEnum);
  DebuggerSymbolImageIndexElement = Ord(scElement);
  DebuggerSymbolImageIndexParameter = Ord(scParameter);
  DebuggerSymbolImageIndexVariable = Ord(scVariable);
  DebuggerSymbolImageIndexConst = Ord(scConst);
  DebuggerSymbolImageIndexReservedWord = Ord(scReservedWord);
  DebuggerSymbolImageIndexSpecialFunction = Ord(scSpecialFunction);
  DebuggerSymbolImageIndexMeta = Ord(scSpecialFunction)+1;
  DebuggerSymbolImageIndexArray = DebuggerSymbolImageIndexMeta+1;
  DebuggerSymbolImageIndexSet = DebuggerSymbolImageIndexArray+1;
  DebuggerSymbolImageIndexOperator = DebuggerSymbolImageIndexSet+1;
  DebuggerSymbolImageIndexOverlayAdd = DebuggerSymbolImageIndexOperator+1;
  DebuggerSymbolImageIndexOverlayChanged = DebuggerSymbolImageIndexOverlayAdd+1;
  DebuggerSymbolImageIndexOverlayWarning = DebuggerSymbolImageIndexOverlayChanged+1;


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
  TScriptDebuggerFrame = class abstract(TFrame, IScriptDebuggerWindow)
  strict private
    FDebugger: IScriptDebugger;
  strict protected
    property Debugger: IScriptDebugger read FDebugger;
  protected
    // IScriptDebuggerWindow
    procedure Initialize(const ADebugger: IScriptDebugger; AImageList, AImageListSymbols: TCustomImageList); virtual;
    procedure Finalize; virtual;
    procedure DebuggerStateChanged(State: TScriptDebuggerNotification); virtual;
  public
  end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

implementation

uses
  Variants,
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
// TSynDWSSyn_DelphiLookalike
//
// -----------------------------------------------------------------------------
constructor TSynDWSSyn_DelphiLookalike.Create(AOwner: TComponent);
begin
  inherited;
  LoadDelphiStyle;
end;


// -----------------------------------------------------------------------------
//
// TScriptDebuggerFrame
//
// -----------------------------------------------------------------------------
procedure TScriptDebuggerFrame.DebuggerStateChanged(State: TScriptDebuggerNotification);
begin
end;

procedure TScriptDebuggerFrame.Finalize;
begin
  FDebugger := nil;
end;

procedure TScriptDebuggerFrame.Initialize(const ADebugger: IScriptDebugger; AImageList, AImageListSymbols: TCustomImageList);
begin
  FDebugger := ADebugger;
end;

// -----------------------------------------------------------------------------
//
// ScriptDebuggerFactory
//
// -----------------------------------------------------------------------------
var
  FScriptDebuggerFactory: TScriptDebuggerFactory = nil;

procedure RegisterScriptDebuggerFactory(Factory: TScriptDebuggerFactory);
begin
  FScriptDebuggerFactory := Factory;
end;

function CanCreateScriptDebugger: boolean;
begin
  Result := Assigned(FScriptDebuggerFactory);
end;

function CreateScriptDebugger(const ScriptDebuggerHost: IScriptDebuggerHost; CreateAsMainForm: boolean): IScriptDebugger;
begin
  if (not CanCreateScriptDebugger) then
    raise Exception.Create('No Script Debugger Factory has been registered');

  Result := FScriptDebuggerFactory(ScriptDebuggerHost, CreateAsMainForm);
end;

initialization
finalization
  RegisterScriptDebuggerFactory(nil);
end.
