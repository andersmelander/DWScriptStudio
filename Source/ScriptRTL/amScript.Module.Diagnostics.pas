unit amScript.Module.Diagnostics;

(*
 * Copyright © 2023 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  SysUtils, Classes,
  Controls,
  Generics.Collections,

  dwsComp,
  dwsExprs,
  dwsCompiler,

  amScript.Module;

// -----------------------------------------------------------------------------
//
// TDataModuleSigmaScriptSystem
//
// -----------------------------------------------------------------------------
type
  TDataModule = class(TScriptModule);

  TDataModuleScriptDiagnostics = class(TDataModule)
    dwsUnitSystemStopwatch: TdwsUnit;
    procedure dwsUnitSystemTimersClassesTTimerConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitSystemTimersClassesTTimerCleanUp(ExternalObject: TObject);
    procedure dwsUnitSystemStopwatchClassesTStopWatchMethodsStartEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitSystemStopwatchClassesTStopWatchMethodsStopEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitSystemStopwatchClassesTStopWatchMethodsResetEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitSystemStopwatchClassesTStopWatchMethodsStartNewEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitSystemStopwatchClassesTStopWatchMethodsGetElapsedMillisecondsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitSystemStopwatchClassesTStopWatchMethodsGetElapsedTicksEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitSystemStopwatchClassesTStopWatchMethodsIsHighResolutionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitSystemStopwatchClassesTStopWatchMethodsFrequencyEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitSystemStopwatchClassesTStopWatchMethodsGetIsRunningEval(Info: TProgramInfo; ExtObject: TObject);
  private
  protected
  public
  end;

implementation

{$R *.dfm}

uses
  ExtCtrls,
  Variants,
  DateUtils,
  Diagnostics,

  dwsMagicExprs,
  dwsExprList,
  dwsStrings,
  dwsSymbols,
  dwsFunctions,

  amScript.API;

// -----------------------------------------------------------------------------
//
// Script: TStopwatch
//
// -----------------------------------------------------------------------------
type
  TScriptStopwatch = class
  public
    Stopwatch: TStopwatch;
  end;

procedure TDataModuleScriptDiagnostics.dwsUnitSystemStopwatchClassesTStopWatchMethodsFrequencyEval(Info: TProgramInfo;
  ExtObject: TObject);
begin
  Info.ResultAsInteger := TStopwatch.Frequency;
end;

procedure TDataModuleScriptDiagnostics.dwsUnitSystemStopwatchClassesTStopWatchMethodsGetElapsedMillisecondsEval(Info: TProgramInfo;
  ExtObject: TObject);
begin
  Info.ResultAsInteger := TScriptStopwatch(ExtObject).Stopwatch.ElapsedMilliseconds;
end;

procedure TDataModuleScriptDiagnostics.dwsUnitSystemStopwatchClassesTStopWatchMethodsGetElapsedTicksEval(Info: TProgramInfo;
  ExtObject: TObject);
begin
  Info.ResultAsInteger := TScriptStopwatch(ExtObject).Stopwatch.ElapsedTicks;
end;

procedure TDataModuleScriptDiagnostics.dwsUnitSystemStopwatchClassesTStopWatchMethodsGetIsRunningEval(Info: TProgramInfo;
  ExtObject: TObject);
begin
  Info.ResultAsBoolean := TScriptStopwatch(ExtObject).Stopwatch.IsRunning;
end;

procedure TDataModuleScriptDiagnostics.dwsUnitSystemStopwatchClassesTStopWatchMethodsIsHighResolutionEval(Info: TProgramInfo;
  ExtObject: TObject);
begin
  Info.ResultAsBoolean := TStopwatch.IsHighResolution;
end;

procedure TDataModuleScriptDiagnostics.dwsUnitSystemStopwatchClassesTStopWatchMethodsResetEval(Info: TProgramInfo;
  ExtObject: TObject);
begin
  TScriptStopwatch(ExtObject).Stopwatch.Reset;
end;

procedure TDataModuleScriptDiagnostics.dwsUnitSystemStopwatchClassesTStopWatchMethodsStartEval(Info: TProgramInfo;
  ExtObject: TObject);
begin
  TScriptStopwatch(ExtObject).Stopwatch.Start;
end;

procedure TDataModuleScriptDiagnostics.dwsUnitSystemStopwatchClassesTStopWatchMethodsStartNewEval(Info: TProgramInfo;
  ExtObject: TObject);
begin
  TScriptStopwatch(ExtObject).Stopwatch := TStopwatch.StartNew;
end;

procedure TDataModuleScriptDiagnostics.dwsUnitSystemStopwatchClassesTStopWatchMethodsStopEval(Info: TProgramInfo;
  ExtObject: TObject);
begin
  TScriptStopwatch(ExtObject).Stopwatch.Stop;
end;

procedure TDataModuleScriptDiagnostics.dwsUnitSystemTimersClassesTTimerCleanUp(ExternalObject: TObject);
begin
  ExternalObject.Free;
end;

procedure TDataModuleScriptDiagnostics.dwsUnitSystemTimersClassesTTimerConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  if (ExtObject <> nil) then
    exit;

  ExtObject := TScriptStopwatch.Create;

  if (Info.ParamAsBoolean[0]) then
    TScriptStopwatch(ExtObject).Stopwatch := TStopwatch.StartNew
  else
    TScriptStopwatch(ExtObject).Stopwatch := TStopwatch.Create;
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

initialization
  TDataModuleScriptDiagnostics.RegisterModule;
end.
