unit amGenerics;

(*
 * Copyright © 2008 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Classes;

//------------------------------------------------------------------------------
//
//      TWeakInterfaceList
//
//------------------------------------------------------------------------------
type
  TWeakInterfaceList<T: IInterface> = class
  private
    FList: TList;
  private type
    TEnumerator = class
    private
      FList: TList;
      FIndex: Integer;
      function GetCurrent: T;
    public
      constructor Create(AList: TList);
      property Current: T read GetCurrent;
      function MoveNext: Boolean;
    end;
  protected
    function GetCount: integer;
    function GetItem(Index: integer): T;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(const Value: T); virtual;
    function Remove(const Value: T): boolean;
    function IndexOf(const Value: T): integer;
    procedure Delete(Index: integer); virtual;
    procedure Clear;
    function First: T;
    function Last: T;
    function GetEnumerator: TEnumerator;
    property Count: integer read GetCount;
    property Items[Index: integer]: T read GetItem; default;
  end;

implementation

uses
  SysUtils;

//------------------------------------------------------------------------------
//
//      TWeakInterfaceList
//
//------------------------------------------------------------------------------
procedure TWeakInterfaceList<T>.Add(const Value: T);
var
  p: pointer;
begin
  p := pointer(IInterface(Value));
  if (FList.IndexOf(p) = -1) then
    FList.Add(p);
end;

//------------------------------------------------------------------------------

procedure TWeakInterfaceList<T>.Clear;
var
  i: integer;
begin
  i := FList.Count-1;
  while (i >= 0) do
  begin
    Delete(i);

    while (i >= Count) do // loop in case more than one got deleted as a side effect
      dec(i);
  end;
end;

//------------------------------------------------------------------------------

constructor TWeakInterfaceList<T>.Create;
begin
  FList := TList.Create;
end;

//------------------------------------------------------------------------------

procedure TWeakInterfaceList<T>.Delete(Index: integer);
begin
  FList.Delete(Index);
end;

//------------------------------------------------------------------------------

destructor TWeakInterfaceList<T>.Destroy;
begin
  FreeAndNil(FList);

  inherited;
end;

//------------------------------------------------------------------------------

function TWeakInterfaceList<T>.First: T;
begin
  if (FList.Count > 0) then
    Result := GetItem(0)
  else
    Result := Default(T);
end;

//------------------------------------------------------------------------------

function TWeakInterfaceList<T>.GetCount: integer;
begin
  Result := FList.Count;
end;

function TWeakInterfaceList<T>.GetEnumerator: TEnumerator;
begin
  Result := TEnumerator.Create(FList);
end;

//------------------------------------------------------------------------------

function TWeakInterfaceList<T>.GetItem(Index: integer): T;
begin
  IInterface(Result) := IInterface(FList[Index]);
end;

//------------------------------------------------------------------------------

function TWeakInterfaceList<T>.IndexOf(const Value: T): integer;
begin
  Result := FList.IndexOf(pointer(IInterface(Value)));
end;

//------------------------------------------------------------------------------

function TWeakInterfaceList<T>.Last: T;
begin
  if (FList.Count > 0) then
    Result := GetItem(FList.Count-1)
  else
    Result := Default(T);
end;

//------------------------------------------------------------------------------

function TWeakInterfaceList<T>.Remove(const Value: T): boolean;
var
  Index: integer;
begin
  Index := FList.IndexOf(pointer(IInterface(Value)));
  if (Index <> -1) then
  begin
    FList.Delete(Index);
    Result := True;
  end else
    Result := False;
end;

//------------------------------------------------------------------------------

constructor TWeakInterfaceList<T>.TEnumerator.Create(AList: TList);
begin
  inherited Create;
  FList := AList;
  FIndex := -1;
end;

//------------------------------------------------------------------------------

function TWeakInterfaceList<T>.TEnumerator.GetCurrent: T;
begin
  IInterface(Result) := IInterface(FList[FIndex]);
end;

//------------------------------------------------------------------------------

function TWeakInterfaceList<T>.TEnumerator.MoveNext: Boolean;
begin
  if (FIndex >= FList.Count) then
    Exit(False);
  Inc(FIndex);
  Result := (FIndex < FList.Count);
end;

end.
