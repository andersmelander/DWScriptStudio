unit amCursorService;

(*
 * Copyright © 2008 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Controls,
  Classes;

//------------------------------------------------------------------------------
//
//      IGlyphService
//
//------------------------------------------------------------------------------
type
  ICursorService = interface
    ['{9866F659-1FC2-4B35-86DE-8429B2F4142E}']
    function RegisterCursor(const ResourceID: UnicodeString; Default: TCursor): TCursor;
  end;

function CursorService: ICursorService;


//------------------------------------------------------------------------------
//
//      TCursorRecall
//
//------------------------------------------------------------------------------
type
  ICursorRecall = interface
    procedure Store;
    procedure Forget;
  end;

  TCursorRecall = class(TInterfacedObject, ICursorRecall)
  private
    FSavedCursor: TCursor;
  protected
    procedure UpdateCursor(Cursor: TCursor);
  public
    constructor Create(NewCursor: TCursor = crNone);
    destructor Destroy; override;
    procedure Store;
    procedure Forget;
    property SavedCursor: TCursor read FSavedCursor;
  end;

function SaveCursor(NewCursor: TCursor = crNone; OnlyIfDefault: boolean = False): ICursorRecall;

// Use UpdateCursor to force immediate update of cursor
procedure UpdateCursor;


implementation

uses
  Windows,
  Messages,
  Forms,
  Contnrs,
  SysUtils;

//------------------------------------------------------------------------------

procedure UpdateCursor;
var
  p: TPoint;
begin
  GetCursorPos(p);
  SetCursorPos(p.X, p.Y);
end;

//------------------------------------------------------------------------------

type
  TCustomCursor = class
  public
    Name: string;
    Index: integer;
    Handle: HCursor;
  end;

var
  FCursorService: ICursorService = nil;

//------------------------------------------------------------------------------
//
//      TCursorRecall
//
//------------------------------------------------------------------------------
constructor TCursorRecall.Create(NewCursor: TCursor);
begin
  inherited Create;
  Store;
  if (NewCursor <> crNone) then
    UpdateCursor(NewCursor);
end;

//------------------------------------------------------------------------------

destructor TCursorRecall.Destroy;
begin
  if (FSavedCursor <> crNone) then
    UpdateCursor(FSavedCursor);

  inherited Destroy;
end;

//------------------------------------------------------------------------------

procedure TCursorRecall.Forget;
begin
  FSavedCursor := crNone;
end;

//------------------------------------------------------------------------------

procedure TCursorRecall.Store;
begin
  FSavedCursor := Screen.Cursor;
end;

//------------------------------------------------------------------------------

procedure TCursorRecall.UpdateCursor(Cursor: TCursor);
var
  Msg: TMsg;
begin
  if (Screen.Cursor = Cursor) then
    exit;

  Screen.Cursor := Cursor;

  // Process cursor update messages so cursor stays responsive
  while (PeekMessage(Msg, 0, WM_SETCURSOR, WM_SETCURSOR, PM_REMOVE)) do
  begin
    if (Msg.message = WM_QUIT) then
    begin
      PostQuitMessage(Msg.wParam);
      exit;
    end;

    DispatchMessage(Msg);
  end;
end;

//------------------------------------------------------------------------------

function SaveCursor(NewCursor: TCursor; OnlyIfDefault: boolean): ICursorRecall;
begin
  if (not OnlyIfDefault) or (Screen.Cursor = crDefault) then
    Result := TCursorRecall.Create(NewCursor)
  else
    Result := nil;
end;


//------------------------------------------------------------------------------
//
//      TCursorService
//
//------------------------------------------------------------------------------
type
  TCursorService = class(TInterfacedObject, ICursorService)
  strict private
  private
    FCursors: TList;
  protected
    // ICursorService
    function RegisterCursor(const ResourceID: UnicodeString; Default: TCursor): TCursor;

    procedure ClearCursors;
  public
    constructor Create;
    destructor Destroy; override;
  end;

//------------------------------------------------------------------------------

procedure TCursorService.ClearCursors;
var
  i: integer;
  CustomCursor: TCustomCursor;
  DefaultCursor: HCursor;
begin
  DefaultCursor := Screen.Cursors[crDefault];

  for i := 0 to FCursors.Count-1 do
  begin
    CustomCursor := TCustomCursor(FCursors[i]);

    if (CustomCursor.Handle <> 0) and (CustomCursor.Index <> 0) and
      (Screen.Cursors[CustomCursor.Index] = CustomCursor.Handle) then
      Screen.Cursors[CustomCursor.Index] := DefaultCursor;
  end;

  FCursors.Clear;
end;

//------------------------------------------------------------------------------

constructor TCursorService.Create;
begin
  inherited Create;
  FCursors := TObjectList.Create(True);
end;

//------------------------------------------------------------------------------

destructor TCursorService.Destroy;
begin
  ClearCursors;
  FCursors.Free;
  inherited Destroy;
end;

//------------------------------------------------------------------------------

function TCursorService.RegisterCursor(const ResourceID: UnicodeString; Default: TCursor): TCursor;

  function ResourceIdentToString(Ident: PWideChar): UnicodeString;
  begin
    // Ordinal resource idents start with $FFFF. This is safe since no Unicode
    // character starts with $FFFF.
    if (PWord(Ident)^ = $FFFF) then
    begin
      Setlength(Result, 2);
      Result[1] := Ident^;
      Inc(Ident);
      Result[2] := Ident^;
    end else
      Result := Ident;
  end;

var
  i: integer;
  Ident: string;
  CustomCursor: TCustomCursor;
  DefaultCursor: HCursor;
begin
  Ident := ResourceIdentToString(PWideChar(ResourceID));

  i := FCursors.Count-1;

  CustomCursor := nil; // To silence bogus compiler warning
  while (i >= 0) do
  begin
    CustomCursor := TCustomCursor(FCursors[i]);
    if (SameText(CustomCursor.Name, Ident)) then
      break;
    dec(i);
  end;

  if (i = -1) then
  begin
    CustomCursor := TCustomCursor.Create;
    FCursors.Add(CustomCursor);
    CustomCursor.Name := Ident;
  end;

  if (CustomCursor.Handle = 0) or (CustomCursor.Index = 0) or
    (Screen.Cursors[CustomCursor.Index] <> CustomCursor.Handle) then
  begin
    DefaultCursor := Screen.Cursors[crDefault];
    CustomCursor.Index := 1;
    // Find first unused entry
    while (Screen.Cursors[CustomCursor.Index] <> DefaultCursor) do
      inc(CustomCursor.Index);
//    CustomCursor.Handle := LoadCursor(HInstance, ResourceID);
//    CustomCursor.Handle := LoadImageW(HInstance, PWideChar(ResourceID), IMAGE_CURSOR, 0, 0, LR_DEFAULTSIZE or LR_SHARED);
    CustomCursor.Handle := LoadImageW(HInstance, PWideChar(ResourceID), IMAGE_CURSOR, 0, 0, LR_DEFAULTSIZE);

    // Fall back to system cross cursor
    if (CustomCursor.Handle = 0) then
      CustomCursor.Handle := LoadCursor(0, IDC_CROSS);

    Screen.Cursors[CustomCursor.Index] := CustomCursor.Handle;
  end;

  Result := CustomCursor.Index;
end;

//------------------------------------------------------------------------------

function CursorService: ICursorService;
begin
  if (FCursorService = nil) then
    FCursorService := TCursorService.Create;
  Result := FCursorService;
end;

//------------------------------------------------------------------------------

initialization
finalization
  FCursorService := nil;
end.
