unit amScript.Environment;

(*
 * Copyright © 2012 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Generics.Collections,

  dwsSymbols,
  dwsUtils,

  amScript.Module,
  amScript.Host.API;

// -----------------------------------------------------------------------------
//
// TScriptEnvironment
//
// -----------------------------------------------------------------------------
type
  TScriptEnvironment = class(TInterfacedSelfObject, IdwsEnvironment, IScriptEnvironment)
  strict private
    class var FEnvironments: TList<TScriptEnvironment>;
  private
    FWrappedObjects: TDictionary<TObject, TScriptObjectWrapperBase>;
    FApplication: IScriptHostApplication;
    FDocument: IScriptHostDocument;
    FItem: TObject;
  protected
    procedure ClearLeakedWrappers;
    // IScriptEnvironment
    function GetApplication: IScriptHostApplication;
    property Application: IScriptHostApplication read GetApplication;

    function GetDocument: IScriptHostDocument;
    property Document: IScriptHostDocument read GetDocument;

    function GetItem: TObject;
    property Item: TObject read GetItem;

    procedure RegisterWrapper(Wrapper: TScriptObjectWrapperBase);
    function FindWrapper(AObject: TObject): TScriptObjectWrapperBase;
    procedure UnregisterWrapper(Wrapper: TScriptObjectWrapperBase);
  protected
    class constructor Create;
    class destructor Destroy;
  public
    constructor Create(const AApplication: IScriptHostApplication; const ADocument: IScriptHostDocument; AItem: TObject);
    destructor Destroy; override;

    // Find wrapper across all environments
    class function FindWrappers(AObject: TObject): TWrapperList;
    class procedure UnregisterWrappers(AObject: TObject);
  end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

implementation

uses
  SysUtils,
  Classes,
{$ifdef DEBUG}
  Dialogs,
{$endif DEBUG}
{$ifdef DEBUG}
  amDialogs,
{$endif DEBUG}
  amScript.API;

type
  TScriptObjectWrapperBaseCracker = class(TScriptObjectWrapperBase);

// -----------------------------------------------------------------------------
//
// TScriptEnvironment
//
// -----------------------------------------------------------------------------
class constructor TScriptEnvironment.Create;
begin
  FEnvironments := TList<TScriptEnvironment>.Create;
end;

class destructor TScriptEnvironment.Destroy;
begin
  FreeAndNil(FEnvironments);
end;

// -----------------------------------------------------------------------------

constructor TScriptEnvironment.Create(const AApplication: IScriptHostApplication; const ADocument: IScriptHostDocument; AItem: TObject);
begin
  inherited Create;
  FApplication := AApplication;
  FDocument := ADocument;
  FItem := AItem;

  FEnvironments.Add(Self);
end;

destructor TScriptEnvironment.Destroy;
begin
  ClearLeakedWrappers;

  FEnvironments.Remove(Self);

  FreeAndNil(FWrappedObjects);
  inherited;
end;

// -----------------------------------------------------------------------------

procedure TScriptEnvironment.ClearLeakedWrappers;
var
  i: integer;
  Wrappers: TArray<TScriptObjectWrapperBase>;
{$ifdef DEBUG}
  Item: TPair<TObject, TScriptObjectWrapperBase>;
  s: string;
{$endif DEBUG}
begin
  if (FWrappedObjects = nil) then
    exit;
{$ifdef DEBUG}
  if (FWrappedObjects.Count > 0) then
  begin
    for Item in FWrappedObjects do
      s := s + #13 + Item.Key.ClassName + ' wrapped by ' + Item.Value.ClassName;
    MessageTaskDlgEx('Script', Format('Leaked wrappers: %d'+s, [FWrappedObjects.Count]), mtInformation, [mbOK]);
  end;
{$endif DEBUG}

  Wrappers := FWrappedObjects.Values.ToArray;
  for i := Length(Wrappers)-1 downto 0 do
    Wrappers[i].DetachScriptObject;
  FWrappedObjects.Clear;
end;

function TScriptEnvironment.GetApplication: IScriptHostApplication;
begin
  Result := FApplication;
end;

// -----------------------------------------------------------------------------

function TScriptEnvironment.GetItem: TObject;
begin
  Result := FItem;
end;

// -----------------------------------------------------------------------------

function TScriptEnvironment.GetDocument: IScriptHostDocument;
begin
  Result := FDocument;
end;

// -----------------------------------------------------------------------------

procedure TScriptEnvironment.RegisterWrapper(Wrapper: TScriptObjectWrapperBase);
begin
  if (FWrappedObjects = nil) then
    FWrappedObjects := TDictionary<TObject, TScriptObjectWrapperBase>.Create;

  FWrappedObjects.AddOrSetValue(Wrapper.Item, Wrapper);

  if (Wrapper.Item is TComponent) then
    ScriptService.RegisterWrappedComponent(TComponent(Wrapper.Item));
end;

procedure TScriptEnvironment.UnregisterWrapper(Wrapper: TScriptObjectWrapperBase);
var
  Item: TPair<TObject, TScriptObjectWrapperBase>;
begin
  if (FWrappedObjects <> nil) then
  begin
    Item := FWrappedObjects.ExtractPair(Wrapper.Item);
    if (Item.Value <> nil) then
      TScriptObjectWrapperBaseCracker(Wrapper).Unregistered;
  end;
end;

function TScriptEnvironment.FindWrapper(AObject: TObject): TScriptObjectWrapperBase;
begin
  if (FWrappedObjects <> nil) then
  begin
    if (not FWrappedObjects.TryGetValue(AObject, Result)) then
      Result := nil;
  end else
    Result := nil;
end;

// -----------------------------------------------------------------------------

class function TScriptEnvironment.FindWrappers(AObject: TObject): TWrapperList;
var
  i: integer;
  Wrapper: TScriptObjectWrapperBase;
begin
  ASSERT(FEnvironments <> nil);
  for i := 0 to FEnvironments.Count-1 do
  begin
    Wrapper := FEnvironments[i].FindWrapper(AObject);
    if (Wrapper <> nil) then
    begin
      SetLength(Result, Length(Result)+1);
      Result[Length(Result)-1] := Wrapper;
    end;
  end;
end;

class procedure TScriptEnvironment.UnregisterWrappers(AObject: TObject);
var
  i: integer;
  Wrapper: TScriptObjectWrapperBase;
begin
  if (FEnvironments = nil) then
    exit;

  for i := FEnvironments.Count-1 downto 0 do
  begin
    Wrapper := FEnvironments[i].FindWrapper(AObject);

    if (Wrapper <> nil) then
      TScriptObjectWrapperBaseCracker(Wrapper).Unregister;
  end;
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
end.
