unit amScriptDebuggerFrameWatches;

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
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Menus, ActnList, ImgList, System.Actions,

  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  cxContainer, cxEdit, cxListView,

  amScriptDebuggerAPI;

type
  TFrame = TScriptDebuggerFrame;

  TScriptDebuggerWatchesFrame = class(TFrame)
    actAddWatch: TAction;
    actDeleteWatch: TAction;
    actEditWatch: TAction;
    ActionList: TActionList;
    lvWatches: TcxListView;
    MenuItemAddWatch: TMenuItem;
    MenuItemDeleteWatch: TMenuItem;
    MenuItemEditWatch: TMenuItem;
    WatchWindowPopupMenu: TPopupMenu;
    procedure actDeleteWatchExecute(Sender: TObject);
    procedure actDeleteWatchUpdate(Sender: TObject);
    procedure actAddWatchExecute(Sender: TObject);
    procedure actEditWatchExecute(Sender: TObject);
    procedure actEditWatchUpdate(Sender: TObject);
    procedure lvWatchesDblClick(Sender: TObject);
    procedure lvWatchesEnter(Sender: TObject);
    procedure lvWatchesExit(Sender: TObject);
  private
  protected
    function  CurrentWatchIndex : integer;

    procedure Initialize(const ADebugger: IScriptDebugger; AImageList, AImageListSymbols: TCustomImageList); override;
    procedure Finalize; override;
    procedure DebuggerStateChanged(State: TScriptDebuggerNotification); override;
  public
    procedure UpdateInfo;
  end;

implementation

{$R *.dfm}

uses
  dwsUtils,
  dwsSymbols,
  dwsExprs,
  dwsDebugger,
  amInputQueryDialog;


{ TfrmDwsIdeWatchesFrame }

procedure TScriptDebuggerWatchesFrame.actAddWatchExecute(Sender: TObject);
var
  S : string;
begin
  S := '';
  if InputQueryEx( 'Add Watch', 'Enter watch expression', S ) then
  begin
    Debugger.GetDebugger.Watches.Add( S );
    UpdateInfo;
  end;
end;

procedure TScriptDebuggerWatchesFrame.actDeleteWatchExecute(Sender: TObject);
var
  I : integer;
  Watch : TdwsDebuggerWatch;
begin
  I := CurrentWatchIndex;
  if I >= 0 then
  begin
    Watch := Debugger.GetDebugger.Watches[I];
    Debugger.GetDebugger.Watches.Extract( Watch );
    Watch.Free;
    UpdateInfo;
  end;
end;

procedure TScriptDebuggerWatchesFrame.actDeleteWatchUpdate(Sender: TObject);
begin
  with Sender as TAction do
    Enabled := CurrentWatchIndex >= 0;
end;

procedure TScriptDebuggerWatchesFrame.actEditWatchExecute(Sender: TObject);
var
  I : integer;
  S : string;
begin
  I := CurrentWatchIndex;
  if I >= 0 then
  begin
    S := Debugger.GetDebugger.Watches[I].ExpressionText;
    if InputQueryEx( 'Edit watch', 'Edit Expression', S ) then
    begin
      Debugger.GetDebugger.Watches[I].ExpressionText := S;
      UpdateInfo;
    end;
  end;
end;

procedure TScriptDebuggerWatchesFrame.actEditWatchUpdate(Sender: TObject);
begin
  with Sender as TAction do
    Enabled := CurrentWatchIndex >= 0;
end;

function TScriptDebuggerWatchesFrame.CurrentWatchIndex: integer;
begin
  if lvWatches.ItemFocused <> nil then
    Result := lvWatches.ItemFocused.Index
  else
    Result := -1;
end;


procedure TScriptDebuggerWatchesFrame.DebuggerStateChanged(State: TScriptDebuggerNotification);
begin
  case State of
    dnDebugSuspended,
    dnUpdateWatches:
      UpdateInfo;
  else
//    lvWatches.Items.Clear;
  end;
end;

procedure TScriptDebuggerWatchesFrame.Finalize;
begin
  inherited;
end;

procedure TScriptDebuggerWatchesFrame.Initialize(const ADebugger: IScriptDebugger; AImageList, AImageListSymbols: TCustomImageList);
begin
  inherited Initialize(ADebugger, AImageList, AImageListSymbols);
end;

procedure TScriptDebuggerWatchesFrame.lvWatchesDblClick(Sender: TObject);
begin
  actEditWatch.Execute;
end;

procedure TScriptDebuggerWatchesFrame.lvWatchesEnter(Sender: TObject);
begin
  ActionList.State := asNormal;
end;

procedure TScriptDebuggerWatchesFrame.lvWatchesExit(Sender: TObject);
begin
  ActionList.State := asSuspended;
end;

procedure TScriptDebuggerWatchesFrame.UpdateInfo;
var
  I : integer;
  S : string;
  V : variant;
  Item : TListItem;
  Watch : TdwsDebuggerWatch;
begin
  lvWatches.Items.BeginUpdate;
  try
    lvWatches.Items.Clear;

    Debugger.GetDebugger.Watches.Update;

    for I  := 0 to Debugger.GetDebugger.Watches.Count-1 do
    begin
      Watch := Debugger.GetDebugger.Watches[I];
      if Watch.ValueInfo = nil then
        S := '[Process not accessible]'
      else
      begin
        V := Watch.ValueInfo.Value;
        if (not VarIsType(V, varUnknown)) then
        begin
          S := VarToStr( V );
          if VarIsStr( V ) then
             S := '''' + S + '''';
        end else
          S := '(unknown)';
      end;

      Item := lvWatches.Items.Add;
      Item.Caption := Watch.ExpressionText;
      Item.SubItems.Add( S );

      Watch.ClearEvaluator;
    end;
  finally
    lvWatches.Items.EndUpdate;
  end;
end;

initialization
  RegisterClass(TScriptDebuggerWatchesFrame);
finalization
end.
