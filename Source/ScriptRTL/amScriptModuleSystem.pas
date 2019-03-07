unit amScriptModuleSystem;

(*
 * Copyright © 2014 Anders Melander
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
  dwsClassesLibModule,

  amScriptModule;

// -----------------------------------------------------------------------------
//
// TDataModuleSigmaScriptSystem
//
// -----------------------------------------------------------------------------
type
  TDataModule = class(TScriptModule);

  TDataModuleScriptSystem = class(TDataModule)
    dwsUnitSystemTimers: TdwsUnit;
    procedure dwsUnitSystemTimersClassesTTimerConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitSystemTimersClassesTTimerMethodsGetIntervalEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitSystemTimersClassesTTimerMethodsGetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitSystemTimersClassesTTimerMethodsSetIntervalEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitSystemTimersClassesTTimerMethodsSetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitSystemTimersClassesTTimerCleanUp(ExternalObject: TObject);
    procedure dwsUnitSystemTimersClassesTTimerMethodsSetOnTimerEval(Info: TProgramInfo; ExtObject: TObject);
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

  dwsMagicExprs,
  dwsExprList,
  dwsStrings,
  dwsSymbols,
  dwsFunctions,
{$ifndef OLD_DWSCRIPT}
  dwsInfo,
{$endif OLD_DWSCRIPT}

  amScriptAPI;

// -----------------------------------------------------------------------------
//
// TScriptTimerWrapper
//
// -----------------------------------------------------------------------------
type
  TScriptTimerWrapper = class(TScriptObjectWrapper<TTimer>)
  private
  protected
    procedure OnTimerHandler(Sender: TObject);
  public
    constructor Create(const AScriptObj: IScriptObj; AItem: TTimer);
  end;

constructor TScriptTimerWrapper.Create(const AScriptObj: IScriptObj; AItem: TTimer);
begin
  inherited Create(AScriptObj, AItem);
end;

procedure TScriptTimerWrapper.OnTimerHandler(Sender: TObject);
var
  ScriptObjectInfo: IScriptObjectInfo;
  Delegate: IInfo;
begin
  if (not CheckScriptObj) then
  begin
    Item.OnTimer := nil;
    raise EScript.Create('Script Object has been destroyed');
  end;

  ScriptObjectInfo := AcquireInfo;
  Delegate := ScriptObjectInfo.Info.Member['FOnTimer'];

  if (Delegate <> nil) and (Delegate.ScriptObj <> nil) then
  begin
    try

      Delegate.Call([ScriptObj]);

    except
      Item.OnTimer := nil;
      ScriptHandleException(Execution);
    end;
  end;
end;

// -----------------------------------------------------------------------------
//
// Script: TTimer
//
// -----------------------------------------------------------------------------
type
  TScriptTimer = class(TTimer);

procedure TDataModuleScriptSystem.dwsUnitSystemTimersClassesTTimerCleanUp(ExternalObject: TObject);
begin
  ExternalObject.Free;
end;

procedure TDataModuleScriptSystem.dwsUnitSystemTimersClassesTTimerConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
var
  OwnerWrapper: TScriptObjectWrapperBase;
  Owner: TComponent;
  Timer: TTimer;
  Wrapper: TScriptObjectWrapperBase;
begin
  OwnerWrapper := Info.Params[0].ExternalObject as TScriptObjectWrapperBase;
  if (OwnerWrapper <> nil) then
    Owner := TComponent(OwnerWrapper.Item)
  else
    Owner := nil;

  Timer := TScriptTimer.Create(Owner);
  Timer.FreeNotification(Self);

  Wrapper := TScriptTimerWrapper.Create(Info.ScriptObj, Timer);
  ExtObject := Wrapper;
end;

procedure TDataModuleScriptSystem.dwsUnitSystemTimersClassesTTimerMethodsGetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TScriptTimerWrapper(ExtObject).Item.Enabled;
end;

procedure TDataModuleScriptSystem.dwsUnitSystemTimersClassesTTimerMethodsSetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptTimerWrapper(ExtObject).Item.Enabled := Info.ParamAsBoolean[0];
end;

procedure TDataModuleScriptSystem.dwsUnitSystemTimersClassesTTimerMethodsGetIntervalEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TScriptTimerWrapper(ExtObject).Item.Interval;
end;

procedure TDataModuleScriptSystem.dwsUnitSystemTimersClassesTTimerMethodsSetIntervalEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptTimerWrapper(ExtObject).Item.Interval := Info.ParamAsInteger[0];
end;

procedure TDataModuleScriptSystem.dwsUnitSystemTimersClassesTTimerMethodsSetOnTimerEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (not VarIsNull(Info.Params[0].Value)) then
  begin
    Info.Vars['FOnTimer'].Value := Info.Params[0].Value;
    TScriptTimerWrapper(ExtObject).Item.OnTimer := TScriptTimerWrapper(ExtObject).OnTimerHandler;
  end else
    TScriptTimerWrapper(ExtObject).Item.OnTimer := nil;
end;

// -----------------------------------------------------------------------------
//
// ISO8601 date function
//
// -----------------------------------------------------------------------------
//
// Implements:
//   function ISO8601ToDate(const AISODate: string; AReturnUTC: Boolean = True): TDateTime;
//   function ISO8601ToDateDef(const AISODate: string; ADefault: TDateTime; AReturnUTC: Boolean = True): TDateTime;
//   function TryISO8601ToDate(const AISODate: string; out Value: TDateTime; AReturnUTC: Boolean = True): Boolean;
//   function DateToISO8601(const ADate: TDateTime; AInputIsUTC: Boolean = True): string;
// -----------------------------------------------------------------------------
type
  TDateToISO8601Func = class(TInternalMagicStringFunction)
    procedure DoEvalAsString(const args : TExprBaseListExec; var Result : UnicodeString); override;
  end;

procedure TDateToISO8601Func.DoEvalAsString(const args: TExprBaseListExec; var Result: UnicodeString);
begin
  Result := DateToISO8601(args.AsFloat[0], args.AsBoolean[1]);
end;

type
  TTryISO8601ToDateFunc = class(TInternalMagicBoolFunction)
    function DoEvalAsBoolean(const args : TExprBaseListExec) : Boolean; override;
  end;

function TTryISO8601ToDateFunc.DoEvalAsBoolean(const args : TExprBaseListExec) : Boolean;
var
  DateTime: TDateTime;
begin
  Result := TryISO8601ToDate(args.AsString[0], DateTime, args.AsBoolean[2]);
  args.AsFloat[1] := DateTime;
end;

type
  TISO8601ToDateDefFunc = class(TInternalMagicFloatFunction)
    procedure DoEvalAsFloat(const args : TExprBaseListExec; var Result : Double); override;
  end;

procedure TISO8601ToDateDefFunc.DoEvalAsFloat(const args: TExprBaseListExec; var Result: Double);
var
  DateTime: TDateTime;
begin
  if (TryISO8601ToDate(args.AsString[0], DateTime, args.AsBoolean[2])) then
    Result := DateTime
  else
    Result := args.AsFloat[1];
end;

type
  TISO8601ToDateFunc = class(TInternalMagicFloatFunction)
    procedure DoEvalAsFloat(const args : TExprBaseListExec; var Result : Double); override;
  end;

procedure TISO8601ToDateFunc.DoEvalAsFloat(const args: TExprBaseListExec; var Result: Double);
begin
  Result := ISO8601ToDate(args.AsString[0], args.AsBoolean[1]);
end;

// -----------------------------------------------------------------------------
//
// TCreateGUID
//
// -----------------------------------------------------------------------------
// Implements:
//   function CreateGUID: string;
// -----------------------------------------------------------------------------
type
  TCreateGUID = class(TInternalMagicStringFunction)
    procedure DoEvalAsString(const args : TExprBaseListExec; var Result : UnicodeString); override;
  end;

procedure TCreateGUID.DoEvalAsString(const args: TExprBaseListExec; var Result: UnicodeString);
var
  guid: TGUID;
begin
  SysUtils.CreateGUID(guid);
  Result := SysUtils.GUIDToString(guid);
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

const
  cDateTime = SYS_FLOAT;

initialization
  TDataModuleScriptSystem.RegisterModule;

  RegisterInternalStringFunction(TDateToISO8601Func, 'DateToISO8601', ['Date', cDateTime, 'InputIsUTC=true', SYS_BOOLEAN], [iffStateLess]);
  RegisterInternalBoolFunction(TTryISO8601ToDateFunc, 'TryISO8601ToDate', ['s', SYS_STRING, '@Value', cDateTime, 'ReturnUTC=true', SYS_BOOLEAN], [iffStateLess]);
  RegisterInternalFloatFunction(TISO8601ToDateDefFunc, 'ISO8601ToDateDef', ['ISODate', SYS_STRING, 'Default', cDateTime, 'ReturnUTC=true', SYS_BOOLEAN], [iffStateLess]);
  RegisterInternalFloatFunction(TISO8601ToDateFunc, 'ISO8601ToDate', ['ISODate', SYS_STRING, 'ReturnUTC=true', SYS_BOOLEAN], [iffStateLess]);

  RegisterInternalStringFunction(TCreateGUID, 'CreateGUID', [], [iffStateLess]);
end.
