unit amSendKeys;

(*
 * Copyright © 2019 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)
interface

// -----------------------------------------------------------------------------
// Inspired by:
// http://webcache.googleusercontent.com/search?q=cache:6is70uVgRMAJ:delphidabbler.com/tips/181+&cd=2&hl=da&ct=clnk&gl=dk&client=firefox-b
// -----------------------------------------------------------------------------


// Send chars in Value param as-is.
// Returns number of non-deadkey keystrokes sent.
function SendKeys(const Value: string; Wait: boolean = False; Delay: integer = 0): integer;

// Send chars in Value param. String can contain modifiers:
//      Modifier        Meaning
//      ------------------------------------
//      +               Shift
//      ^               Control
//      ~               Alt
//      {}              Grouping
//      [key]           Named key
//      \               Escape next char
// Returns number of non-deadkey keystrokes sent.
function SendKeysEx(const Value: string; Wait: boolean = False; Delay: integer = 0): integer;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

implementation

uses
  Windows,
  Classes,
  SysUtils,
  Messages,
  Menus;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

function DoSendKeys(Extended: boolean; const Value: string; Wait: boolean; Delay: integer): integer;
const
  VKKEYSCAN_MASK = $00FF;
  VKKEYSCAN_INVALID = $FFFF;
  VKKEYSCAN_SHIFT = $0100;
  VKKEYSCAN_CTRL = $0200;
  VKKEYSCAN_ALT = $0400;

const
  ExtendedVKeys: set of byte = [VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT, VK_HOME, VK_END, VK_PRIOR, VK_NEXT, VK_INSERT, VK_DELETE];

var
  p: PChar;
  ShiftState: array of TShiftState;
  KeyCount: integer;
  KeyInputs: array of TInput;
  DoAbort: boolean;

  procedure StuffKey(VKey: Byte; Flags: DWORD);
  var
    KeyInput: TInput;
  begin
    FillChar(KeyInput, SizeOf(KeyInput), 0);
    KeyInput.Itype := INPUT_KEYBOARD;
    KeyInput.ki.wVk := VKey;
    KeyInput.ki.wScan := MapVirtualKey(VKey, 0);
    KeyInput.ki.dwFlags := Flags;

    SetLength(KeyInputs, Length(KeyInputs)+1);
    KeyInputs[Length(KeyInputs)-1] := KeyInput;
  end;

  procedure DoSendKeys;
  var
    KeyboardMsg: TMsg;
  begin
    if (Length(KeyInputs) = 0) or (DoAbort) then
      exit;

    SendInput(Length(KeyInputs), KeyInputs[0], SizeOf(TInput));

    if (Wait) then
      while (PeekMessage(KeyboardMsg, 0, WM_KEYFIRST, WM_KEYLAST, PM_REMOVE)) do
      begin
        if (KeyboardMsg.message = WM_QUIT) then
        begin
          PostQuitMessage(KeyboardMsg.wParam);
          DoAbort := True;
          exit;
        end;
        TranslateMessage(KeyboardMsg);
        DispatchMessage(KeyboardMsg);
      end;

    SetLength(KeyInputs, 0);
  end;

  procedure SendKeyUp(VKey: byte);
  var
    Flags: DWORD;
  begin
    Flags := KEYEVENTF_KEYUP;
    if (VKey in ExtendedVKeys) then
      Flags := Flags or KEYEVENTF_EXTENDEDKEY;

    StuffKey(VKey, Flags);
  end;

  procedure SendKeyDown(VKey: byte; AutoKeyUp: boolean = False);
  var
    NumState: boolean;
    KeyBoardState: TKeyboardState;
    Flags: DWORD;
  begin
    if (VKey = VK_NUMLOCK) then
    begin
      NumState := ByteBool(GetKeyState(VK_NUMLOCK) and 1);

      GetKeyBoardState(KeyBoardState);

      if (NumState) then
        KeyBoardState[VK_NUMLOCK] := (KeyBoardState[VK_NUMLOCK] and $FE)
      else
        KeyBoardState[VK_NUMLOCK] := (KeyBoardState[VK_NUMLOCK] or $01);

      SetKeyBoardState(KeyBoardState);

      Exit;
    end;

    Flags := 0;
    if (VKey in ExtendedVKeys) then
      Flags := Flags or KEYEVENTF_EXTENDEDKEY;

    StuffKey(VKey, Flags);

    if (AutoKeyUp) then
    begin
      Flags := Flags or KEYEVENTF_KEYUP;
      StuffKey(VKey, Flags)
    end;
  end;

  procedure PushShiftState(State: TShiftState);
  var
    OldShiftState: TShiftState;
    NewShiftState: TShiftState;
  begin
    OldShiftState := ShiftState[Length(ShiftState)-1];
    NewShiftState := OldShiftState + State;

    SetLength(ShiftState, Length(ShiftState)+1);
    ShiftState[Length(ShiftState)-1] := NewShiftState;

    if (OldShiftState <> NewShiftState) then
    begin
      NewShiftState := NewShiftState - OldShiftState;
      if (ssShift in NewShiftState) then
        SendKeyDown(VK_SHIFT);
      if (ssCtrl in NewShiftState) then
        SendKeyDown(VK_CONTROL);
      if (ssAlt in NewShiftState) then
        SendKeyDown(VK_MENU);
    end;
  end;

  procedure PopShiftState;
  var
    OldShiftState: TShiftState;
    NewShiftState: TShiftState;
  begin
    OldShiftState := ShiftState[Length(ShiftState)-1];
    NewShiftState := ShiftState[Length(ShiftState)-2];
    SetLength(ShiftState, Length(ShiftState)-1);

    if (OldShiftState <> NewShiftState) then
    begin
      OldShiftState := OldShiftState - NewShiftState;
      if (ssShift in OldShiftState) then
        SendKeyUp(VK_SHIFT);
      if (ssCtrl in OldShiftState) then
        SendKeyUp(VK_CONTROL);
      if (ssAlt in OldShiftState) then
        SendKeyUp(VK_MENU);
    end;
  end;

  procedure SendKey(MKey: Word; AutoKeyUp: boolean);
  var
    ShiftState: TShiftState;
  begin
    if (MKey = VKKEYSCAN_INVALID) then
      exit;

    ShiftState := [];
    if (MKey and VKKEYSCAN_SHIFT <> 0) then
      Include(ShiftState, ssShift);
    if (MKey and VKKEYSCAN_CTRL <> 0) then
      Include(ShiftState, ssCtrl);
    if (MKey and VKKEYSCAN_ALT <> 0) then
      Include(ShiftState, ssAlt);
    if (ShiftState <> []) then
      PushShiftState(ShiftState);

    SendKeyDown(MKey and VKKEYSCAN_MASK, AutoKeyUp);

    if (ShiftState <> []) then
      PopShiftState;

    if (Wait) then
      DoSendKeys;

    if (Delay > 0) then
      Sleep(Delay);
  end;

  function NextToken: boolean;
  begin
    if (p^ <> #0) then
      Inc(p);
    Result := (p^ <> #0);
  end;

  function CurrentToken: Char;
  begin
    Result := p^;
  end;

  procedure PrematureEnd;
  begin
    raise Exception.Create('Premature end of block');
  end;

  procedure ParseKeyEx(BlockMode: boolean = False);
  var
    s: string;
    ShortCut: TShortCut;
    Key: Word;
    Shift: TShiftState;
  begin
    case CurrentToken of
      #0:
        begin
          if (BlockMode) then
            PrematureEnd;
          Exit;
        end;
      '\':
        begin
          if (not NextToken) then
            PrematureEnd;
          Key := VkKeyScan(CurrentToken);
          SendKey(Key, True);
          NextToken;
          Inc(KeyCount);
        end;
      '+':
        begin
          if (not NextToken) then
            PrematureEnd;
          PushShiftState([ssShift]);
          ParseKeyEx;
          PopShiftState;
        end;
      '^':
        begin
          if (not NextToken) then
            PrematureEnd;
          PushShiftState([ssCtrl]);
          ParseKeyEx;
          PopShiftState;
        end;
      '~':
        begin
          if (not NextToken) then
            PrematureEnd;
          PushShiftState([ssAlt]);
          ParseKeyEx;
          PopShiftState;
        end;
      '{':
        begin
          if (not NextToken) then
            PrematureEnd;
          while (CurrentToken <> '}') do
            ParseKeyEx(True);
          NextToken;
        end;
      '}':
        begin
          if (not BlockMode) then
            raise Exception.Create('Unexpected end of block');
          exit;
        end;
      '[':
        begin
          if (not NextToken) then
            PrematureEnd;
          s := '';
          while (CurrentToken <> ']') do
          begin
            s := s + CurrentToken;
            if (not NextToken) then
              PrematureEnd;
          end;
          NextToken;
          ShortCut := TextToShortCut(s);
          if (ShortCut = 0) then
            raise Exception.CreateFmt('Unknown key: %s', [s]);
          ShortCutToKey(ShortCut, Key, Shift);
          SendKey(Key, True);
          Inc(KeyCount);
        end;
    else
      Key := VkKeyScan(CurrentToken);
      SendKey(Key, True);
      NextToken;
      Inc(KeyCount);
    end;
  end;

  procedure ParseKey;
  var
    Key: Word;
  begin
    Key := VkKeyScan(CurrentToken);
    SendKey(Key, True);
    NextToken;
  end;

begin
  KeyCount := 0;
  DoAbort := False;
  SetLength(ShiftState, 1);
  ShiftState[0] := [];
  p := PChar(Value);

  if (Extended) then
  begin
    while (CurrentToken <> #0) and (not DoAbort) do
      ParseKeyEx;
  end else
  begin
    while (CurrentToken <> #0) and (not DoAbort) do
      ParseKey;
  end;

  DoSendKeys;

  Result := KeyCount;
end;

function SendKeys(const Value: string; Wait: boolean; Delay: integer): integer;
begin
  Result := DoSendKeys(False, Value, Wait, Delay);
end;

function SendKeysEx(const Value: string; Wait: boolean; Delay: integer): integer;
begin
  Result := DoSendKeys(True, Value, Wait, Delay);
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
end.

