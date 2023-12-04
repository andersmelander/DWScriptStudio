unit amScript.Module.System.Input;

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

  dwsComp,
  dwsExprs,
  dwsCompiler,
  dwsSymbols,

  amScript.Module;

// -----------------------------------------------------------------------------
//
// TDataModuleScriptSystemInput
//
// -----------------------------------------------------------------------------
// Mouse and keyboard classes.
// -----------------------------------------------------------------------------
type
  TDataModule = class(TScriptModule);

  TDataModuleScriptSystemInput = class(TDataModule)
    dwsUnitSystemInput: TdwsUnit;
    procedure dwsUnitSystemInputClassesKeyboardMethodsSendKeysEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitSystemInputClassesMouseMethodsGetCursorPosEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitSystemInputClassesMouseMethodsSetCursorPosEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitSystemInputClassesMouseMethodsMoveCursorEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitSystemInputClassesMouseMethodsSendMouseMoveEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitSystemInputClassesMouseMethodsSendMouseDownEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitSystemInputClassesMouseMethodsSendMouseClickEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitSystemInputClassesMouseMethodsSendMouseUpEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitSystemInputClassesKeyboardMethodsSendKeysExEval(Info: TProgramInfo; ExtObject: TObject);
  private
  public
  end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

implementation

{$R *.dfm}

uses
  Windows,
  Diagnostics,
  Forms,
  Controls,
  amSendKeys,
  amCursorService,
  amScript.Module.Classes;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

procedure TDataModuleScriptSystemInput.dwsUnitSystemInputClassesKeyboardMethodsSendKeysEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := SendKeys(Info.ParamAsString[0], Info.ParamAsBoolean[1], Info.ParamAsInteger[2]);
end;

procedure TDataModuleScriptSystemInput.dwsUnitSystemInputClassesKeyboardMethodsSendKeysExEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := SendKeysEx(Info.ParamAsString[0], Info.ParamAsBoolean[1], Info.ParamAsInteger[2]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptSystemInput.dwsUnitSystemInputClassesMouseMethodsGetCursorPosEval(Info: TProgramInfo; ExtObject: TObject);
var
  p: TPoint;
begin
  GetCursorPos(p);
  Info.ResultVars.Data := PointToData(p);
end;

procedure TDataModuleScriptSystemInput.dwsUnitSystemInputClassesMouseMethodsSetCursorPosEval(Info: TProgramInfo; ExtObject: TObject);
var
  p: TPoint;
begin
  p := DataToPoint(Info.Params[0].Data);
  SetCursorPos(p.X, p.Y);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptSystemInput.dwsUnitSystemInputClassesMouseMethodsMoveCursorEval(Info: TProgramInfo; ExtObject: TObject);

  // Based on https://github.com/warrenm/AHEasing/blob/master/AHEasing/easing.c
  // Modeled after the piecewise cubic
  // y = (1/2)((2x)^3)       ; [0, 0.5)
  // y = (1/2)((2x-2)^3 + 2) ; [0.5, 1]
  function EaseInOutCubic(Progress: Double): Double;
  var
    n: Double;
  begin
    if (Progress < 0.5) then
      Result := 4 * Progress * Progress * Progress
    else
    begin
      n := ((2 * Progress) - 2);
      Result := 0.5 * n * n * n + 1;
    end;
  end;

var
  StartPos: TPoint;
  EndPos: TPoint;
  DeltaX, DeltaY: integer;
  Velocity: integer;
  Len: Double;
  Step: integer;
  x, y: integer;
  n: Double;
  StopWatch: TStopWatch;
  Delay: integer;
const
  cMaxDuration = 10;
begin
  GetCursorPos(StartPos);
  EndPos := DataToPoint(Info.Params[0].Data);
  Velocity := Info.ParamAsInteger[1];

  if (Velocity = 0) then
  begin
    SetCursorPos(EndPos.X, EndPos.Y);
    exit;
  end;

  DeltaX := EndPos.X - StartPos.X;
  DeltaY := EndPos.Y - StartPos.Y;

  Len := Sqrt(Sqr(DeltaX) + Sqr(DeltaY));

  // Adjust velocity so movement doesn't take too long
  if (Len / Velocity > cMaxDuration) then
    Velocity := Round(Len / cMaxDuration);

  if (Len > 1) and (Velocity > 0) then
  begin
    Step := 0;
    StopWatch := TStopWatch.StartNew;
    while (Step <= Len) do
    begin
      n := EaseInOutCubic(Step / Len);
      x := StartPos.X + Round(n * DeltaX);
      y := StartPos.Y + Round(n * DeltaY);

      SetCursorPos(x, y);

      Delay := Round(Step / Velocity * 1000) - StopWatch.ElapsedMilliseconds;
      if (Delay > 0) then
        Sleep(Delay);
      Inc(Step);
    end;
  end;

  // Make sure we end up the right place
  SetCursorPos(EndPos.X, EndPos.Y)
end;

// -----------------------------------------------------------------------------

const
  ButtonDownFlags: array[TMouseButton] of DWORD = (MOUSEEVENTF_LEFTDOWN, MOUSEEVENTF_MIDDLEDOWN, MOUSEEVENTF_RIGHTDOWN);
  ButtonUpFlags: array[TMouseButton] of DWORD = (MOUSEEVENTF_LEFTUP, MOUSEEVENTF_MIDDLEUP, MOUSEEVENTF_RIGHTUP);
  MOUSEEVENTF_VIRTUALDESK = $4000;

procedure TDataModuleScriptSystemInput.dwsUnitSystemInputClassesMouseMethodsSendMouseClickEval(Info: TProgramInfo; ExtObject: TObject);
var
  MouseInput: array[0..1] of TInput;
  p: TPoint;
  Button: TMouseButton;
begin
  p := DataToPoint(Info.Params[0].Data);
  Button := TMouseButton(Info.ParamAsInteger[1]);

  FillChar(MouseInput, 2*SizeOf(TInput), 0);
  MouseInput[0].Itype := INPUT_MOUSE;
  MouseInput[0].mi.dwFlags := ButtonDownFlags[Button] or MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_VIRTUALDESK;
  // Convert from physical to "Mickeys"
  MouseInput[0].mi.dx :=  MulDiv(65535, p.X, Screen.Width);
  MouseInput[0].mi.dy := MulDiv(65535, p.Y, Screen.Height);

  MouseInput[1].Itype := INPUT_MOUSE;
  MouseInput[1].mi.dwFlags := ButtonUpFlags[Button] or MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_VIRTUALDESK;
  // Convert from physical to "Mickeys"
  MouseInput[1].mi.dx :=  MulDiv(65535, p.X, Screen.Width);
  MouseInput[1].mi.dy := MulDiv(65535, p.Y, Screen.Height);

  SendInput(2, MouseInput[0], SizeOf(TInput));
end;

procedure TDataModuleScriptSystemInput.dwsUnitSystemInputClassesMouseMethodsSendMouseDownEval(Info: TProgramInfo; ExtObject: TObject);
var
  MouseInput: TInput;
  p: TPoint;
  Button: TMouseButton;
begin
  p := DataToPoint(Info.Params[0].Data);
  Button := TMouseButton(Info.ParamAsInteger[1]);

  FillChar(MouseInput, SizeOf(TInput), 0);
  MouseInput.Itype := INPUT_MOUSE;
  MouseInput.mi.dwFlags := ButtonDownFlags[Button] or MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_VIRTUALDESK;
  // Convert from physical to "Mickeys"
  MouseInput.mi.dx :=  MulDiv(65535, p.X, Screen.Width);
  MouseInput.mi.dy := MulDiv(65535, p.Y, Screen.Height);

  SendInput(1, MouseInput, SizeOf(TInput));
end;

procedure TDataModuleScriptSystemInput.dwsUnitSystemInputClassesMouseMethodsSendMouseUpEval(Info: TProgramInfo; ExtObject: TObject);
var
  MouseInput: TInput;
  p: TPoint;
  Button: TMouseButton;
begin
  p := DataToPoint(Info.Params[0].Data);
  Button := TMouseButton(Info.ParamAsInteger[1]);

  FillChar(MouseInput, SizeOf(TInput), 0);
  MouseInput.Itype := INPUT_MOUSE;
  MouseInput.mi.dwFlags := ButtonUpFlags[Button] or MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_VIRTUALDESK;
  // Convert from physical to "Mickeys"
  MouseInput.mi.dx :=  MulDiv(65535, p.X, Screen.Width);
  MouseInput.mi.dy := MulDiv(65535, p.Y, Screen.Height);

  SendInput(1, MouseInput, SizeOf(TInput));
end;

procedure TDataModuleScriptSystemInput.dwsUnitSystemInputClassesMouseMethodsSendMouseMoveEval(Info: TProgramInfo; ExtObject: TObject);
var
  MouseInput: TInput;
  p: TPoint;
begin
  p := DataToPoint(Info.Params[0].Data);

  FillChar(MouseInput, SizeOf(TInput), 0);
  MouseInput.Itype := INPUT_MOUSE;
  MouseInput.mi.dwFlags := MOUSEEVENTF_MOVE or MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_VIRTUALDESK;
  // Convert from physical to "Mickeys"
  MouseInput.mi.dx :=  MulDiv(65535, p.X, Screen.Width);
  MouseInput.mi.dy := MulDiv(65535, p.Y, Screen.Height);

  SendInput(1, MouseInput, SizeOf(TInput));
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

initialization
  TDataModuleScriptSystemInput.RegisterModule;
end.

