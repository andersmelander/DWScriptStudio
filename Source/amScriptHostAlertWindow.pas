unit amScriptHostAlertWindow;

(*
 * Copyright © 2012 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Classes,
  dxAlertWindow,
  amScriptHostAPI;

type
  TScriptAlertWindow = class(TInterfacedObject, IScriptHostAlertWindow)
  private
    FAlertWindow: TdxAlertWindow;
    FEventSink: IScriptHostAlertEventSink;
    FData: pointer;
  protected
    // IScriptHostAlertWindow
    procedure SetEventSink(const EventSink: IScriptHostAlertEventSink; Data: pointer);
    procedure Close;
    function GetData: pointer;
  public
    constructor Create(AAlertWindow: TdxAlertWindow);
    destructor Destroy; override;

    procedure AlertClicked;
    procedure AlertClosed;

    class function AddAlertMessage(AlertWindowManager: TdxAlertWindowManager; const ACaption, AMessage: string; AImageIndex, ATimeout: integer): IScriptHostAlertWindow;
  end;

implementation

class function TScriptAlertWindow.AddAlertMessage(AlertWindowManager: TdxAlertWindowManager; const ACaption, AMessage: string; AImageIndex, ATimeout: integer): IScriptHostAlertWindow;
var
  AlertWindow: TdxAlertWindow;
  Intf: IUnknown;
begin
  while (AlertWindowManager.Count > 0) do
    AlertWindowManager.Close(AlertWindowManager.Items[0]);

  AlertWindow := AlertWindowManager.Show(ACaption, AMessage, AImageIndex);

  if (ATimeout > 0) then
    AlertWindow.OptionsBehavior.DisplayTime := ATimeout;

  // Create reference counted wrapper for event dispatch to an IScriptHostAlertEventSink interface
  Result := TScriptAlertWindow.Create(AlertWindow);
  // Save interface reference in Tag
  Intf := Result;
  AlertWindow.Tag := NativeInt(Intf);
  pointer(Intf) := nil;
end;

procedure TScriptAlertWindow.AlertClicked;
begin
  // Notify event sink that alert was clicked
  if (FEventSink <> nil) then
    FEventSink.AlertClicked(Self);
end;

procedure TScriptAlertWindow.AlertClosed;
var
  Intf: IUnknown;
begin
  // Notify event sink that alert was closed
  if (FEventSink <> nil) then
    FEventSink.AlertClosed(Self);

  // Disconnect us from alert window
  if (FAlertWindow <> nil) then
  begin
    // Clear interface reference in Tag
    pointer(Intf) := pointer(FAlertWindow.Tag);
    FAlertWindow.Tag := 0;
    // This should destroy us
    Intf := nil;
  end;
end;

procedure TScriptAlertWindow.Close;
begin
  // Close alert window
  if (FAlertWindow <> nil) then
  begin
    FAlertWindow.Close;
    FAlertWindow := nil;
    FEventSink := nil;
  end;
end;

constructor TScriptAlertWindow.Create(AAlertWindow: TdxAlertWindow);
begin
  inherited Create;
  FAlertWindow := AAlertWindow;
end;

destructor TScriptAlertWindow.Destroy;
begin
  FEventSink := nil;
  if (FAlertWindow <> nil) then
  begin
    FAlertWindow.Tag := 0;
    FAlertWindow := nil;
  end;
  inherited;
end;

function TScriptAlertWindow.GetData: pointer;
begin
  Result := FData;
end;

procedure TScriptAlertWindow.SetEventSink(const EventSink: IScriptHostAlertEventSink; Data: pointer);
begin
  // Connect event sink
  FEventSink := EventSink;
  FData := Data;
end;

end.
