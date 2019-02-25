unit ScriptDebuggerAPI;

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
  Themes,
  Classes,
  Graphics,
  ImgList,
  Forms,

  dwsDebugger,
  dwsSuggestions,
  dwsErrors,
  dwsExprs,
  dwsSymbols,
{$ifndef OLD_DWSCRIPT}
  dwsScriptSource,
{$endif OLD_DWSCRIPT}

  SynEditHighlighter,
  SynHighlighterDWS;

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

  TBreakpointUpdate = (bpuRefreshState, bpuRefreshLines, bpuRefreshFull, bpuReload);

// -----------------------------------------------------------------------------
//
// TScriptDebugger
//
// -----------------------------------------------------------------------------
type
  IScriptDebugger = interface
    ['{A8C3BEBB-C732-46BF-9936-5E53519AF2A2}']
    function  GetDebugger : TdwsDebugger;
    function  GetProgram: IdwsProgram;
    procedure ViewScriptPos(const AScriptPos: TScriptPos; AMoveCurrent: boolean = False; AHiddenMainModule: Boolean = False);

    function FindBreakPoint(const ScriptPos: TScriptPos): TBreakpointStatus;
    procedure AddBreakpoint(const ScriptPos: TScriptPos; AEnabled: Boolean = True);
    procedure ClearBreakpoint(const ScriptPos: TScriptPos);
    procedure UpdateBreakpoints(Update: TBreakpointUpdate);
    function SymbolToImageIndex(Symbol: TSymbol): integer;
    procedure AddWatch(const Expression: string);
    function GetCompiledScript: IdwsProgram;
    procedure Evaluate(const Expression: string; ScriptPos: PScriptPos = nil);
    function UnitNameFromScriptPos(const ScriptPos: TScriptPos): string;
    function UnitNameFromInternalName(const Name: string): string;
  end;

  TScriptDebuggerNotification = (dnCompiling, dnCompiled, dnIdle, dnDebugRun, dnDebugSuspending, dnDebugSuspended, dnDebugResuming, dnDebugDone, dnUpdateWatches);

  IScriptDebuggerWindow = interface
    ['{C5E175C4-B6CE-4BCC-94D1-52986C8047FF}']
    procedure Initialize(const ADebugger: IScriptDebugger; AImageList, AImageListSymbols: TCustomImageList);
    procedure Finalize;

    procedure DebuggerStateChanged(State: TScriptDebuggerNotification);
  end;

  TEditorHighlighterClass = class of TSynCustomHighlighter;

  TDwsIdeOptions = record
    EditorHighlighterClass     : TEditorHighlighterClass;
    EditorFontName             : string;
    EditorFontSize             : integer;
    ScriptFolder               : string;
    ProjectName                : string;
    HomePositionFileName       : string;
    HomePositionFileIdentifier : string;
  end;


// -----------------------------------------------------------------------------
//
// TSynDWSSyn_DelphiLookalike
//
// -----------------------------------------------------------------------------
type
  TSynDWSSyn_DelphiLookalike = class(TSynDWSSyn)
    constructor Create(AOwner: TComponent); override;
  end;


const
  IdeOptions_Legacy   : TDwsIdeOptions = (
    EditorHighlighterClass : TSynDWSSyn_DelphiLookalike;
    EditorFontName         : 'Courier New';
    EditorFontSize         : 10
    );

  IdeOptions_VistaOrLater : TDwsIdeOptions = (
    EditorHighlighterClass : TSynDWSSyn_DelphiLookalike;
    EditorFontName         : 'Consolas';
    EditorFontSize         : 10
    );

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

end.
