unit ScriptDebuggerFrameBreakPoints;

(*
 * Copyright © 2019 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ImgList,

  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, cxContainer, cxEdit,
  cxListView,

  dwsErrors,
  dwsSymbols,
  dwsDebugger,
{$ifndef OLD_DWSCRIPT}
  dwsScriptSource,
{$endif OLD_DWSCRIPT}

  ScriptDebuggerAPI;

type
  TFrame = TScriptDebuggerFrame;

  TScriptDebuggerBreakPointsFrame = class(TFrame)
    ListViewBreakPoints: TcxListView;
    procedure ListViewBreakPointsDblClick(Sender: TObject);
    procedure ListViewBreakPointsChange(Sender: TObject; Item: TListItem; Change: TItemChange);
    procedure ListViewBreakPointsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
  protected
    function BreakPointToScriptPos(Breakpoint: TdwsDebuggerBreakpoint; var ScriptPos: TScriptPos): boolean;

    procedure Initialize(const ADebugger: IScriptDebugger; AImageList, AImageListSymbols: TCustomImageList); override;
    procedure Finalize; override;
    procedure DebuggerStateChanged(State: TScriptDebuggerNotification); override;
  public
    procedure UpdateInfo;
    procedure RefreshInfo(Update: TBreakpointUpdate);
  end;

implementation

{$R *.dfm}

uses
  Generics.Collections,
  Generics.Defaults,
  dwsUtils,
  dwsExprs,
{$ifndef OLD_DWSCRIPT}
  dwsInfo,
  dwsContextMap,
{$endif OLD_DWSCRIPT}
  ScriptDebuggerMain;

{ TScriptDebuggerBreakPointsFrame }

function TScriptDebuggerBreakPointsFrame.BreakPointToScriptPos(Breakpoint: TdwsDebuggerBreakpoint; var ScriptPos: TScriptPos): boolean;
var
  dwsProgram: IdwsProgram;
  SourceItem: TScriptSourceItem;
begin
  Result := False;
  ScriptPos.Clear;
  dwsProgram := Debugger.GetProgram;

  if (dwsProgram = nil) then
    exit;

  SourceItem := dwsProgram.SourceList.FindScriptSourceItem(Breakpoint.SourceName);

  if (SourceItem = nil) or (SourceItem.SourceFile = nil) or (SourceItem.SourceFile.Name = '') then
    exit;

  ScriptPos.Line := Breakpoint.Line;
  ScriptPos.Col := 0;
  ScriptPos.SourceFile := SourceItem.SourceFile;
  Result := True;
end;

procedure TScriptDebuggerBreakPointsFrame.DebuggerStateChanged(State: TScriptDebuggerNotification);
begin
  case State of
    dnCompiled:
      RefreshInfo(bpuRefreshFull);

    dnDebugSuspended:
      UpdateInfo;
  end;
end;

procedure TScriptDebuggerBreakPointsFrame.Finalize;
begin
  inherited;

end;

procedure TScriptDebuggerBreakPointsFrame.Initialize(const ADebugger: IScriptDebugger; AImageList, AImageListSymbols: TCustomImageList);
begin
  inherited Initialize(ADebugger, AImageList, AImageListSymbols);
  ListViewBreakPoints.SmallImages := AImageList;
end;

procedure TScriptDebuggerBreakPointsFrame.ListViewBreakPointsChange(Sender: TObject; Item: TListItem; Change: TItemChange);
var
  Breakpoint: TdwsDebuggerBreakpoint;
begin
  if (Change <> ctState) or (Item = nil) or (Item.Data = nil) then
    exit;

  BreakPoint := TdwsDebuggerBreakpoint(Item.Data);

  if (Item.Checked = Breakpoint.Enabled) then
    exit;

  Breakpoint.Enabled := Item.Checked;
  Debugger.UpdateBreakpoints(bpuRefreshState);
end;

procedure TScriptDebuggerBreakPointsFrame.ListViewBreakPointsDblClick(Sender: TObject);
var
  ScriptPos: TScriptPos;
begin
  if (ListViewBreakPoints.Selected = nil) or (ListViewBreakPoints.Selected.Data = nil) then
    exit;

  if (BreakPointToScriptPos(TdwsDebuggerBreakpoint(ListViewBreakPoints.Selected.Data), ScriptPos)) then
    Debugger.ViewScriptPos(ScriptPos);
end;

procedure TScriptDebuggerBreakPointsFrame.ListViewBreakPointsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  ScriptPos: TScriptPos;
begin
  if (Key = VK_DELETE) and (Shift = []) then
  begin
    if (ListViewBreakPoints.Selected <> nil) and (ListViewBreakPoints.Selected.Data <> nil) then
      if (BreakPointToScriptPos(TdwsDebuggerBreakpoint(ListViewBreakPoints.Selected.Data), ScriptPos)) then
        Debugger.ClearBreakpoint(ScriptPos);
    Key := 0;
  end;
end;

procedure TScriptDebuggerBreakPointsFrame.RefreshInfo(Update: TBreakpointUpdate);
var
  Breakpoint: TdwsDebuggerBreakpoint;
  i: integer;
  Item: TListItem;
  ScriptPos: TScriptPos;
  SourceContext: TdwsSourceContext;
begin
  if (Update = bpuReload) then
  begin
    UpdateInfo;
    exit;
  end;

  ListViewBreakPoints.Items.BeginUpdate;
  try
    for i := 0 to ListViewBreakPoints.Items.Count-1 do
    begin
      Item := ListViewBreakPoints.Items[i];
      Breakpoint := TdwsDebuggerBreakpoint(Item.Data);

      if (Update >= bpuRefreshState) then
      begin
        Item.Checked := (Breakpoint <> nil) and (Breakpoint.Enabled);

        if (Item.Checked) then
          Item.ImageIndex := 12
        else
          Item.ImageIndex := 14;
      end;

      if (Update >= bpuRefreshLines) then
        Item.SubItems[0] := IntToStr(Breakpoint.Line);

      if (Update >= bpuRefreshFull) and (BreakPointToScriptPos(Breakpoint, ScriptPos)) then
      begin
        SourceContext := Debugger.GetProgram.SourceContextMap.FindContext(ScriptPos);
        while (SourceContext <> nil) do
        begin
          if (SourceContext.ParentSym <> nil) then
          begin
            Item.SubItems[1] := SourceContext.ParentSym.QualifiedName;
            break;
          end;
          SourceContext := SourceContext.Parent;
        end;
      end;
    end;
  finally
    ListViewBreakPoints.Items.EndUpdate;
  end;
end;

procedure TScriptDebuggerBreakPointsFrame.UpdateInfo;
var
  dwsDebugger: TdwsDebugger;
  BreakPoints: TList<TdwsDebuggerBreakpoint>;
  Breakpoint: TdwsDebuggerBreakpoint;
  i: integer;
  Item: TListItem;
  ScriptPos: TScriptPos;
  SourceContext: TdwsSourceContext;
begin
  dwsDebugger := Debugger.GetDebugger;
  if (dwsDebugger = nil) then
    exit;

  BreakPoints := TList<TdwsDebuggerBreakpoint>.Create;
  try
    for i := 0 to dwsDebugger.Breakpoints.Count-1 do
      BreakPoints.Add(dwsDebugger.Breakpoints[i]);

    BreakPoints.Sort(TComparer<TdwsDebuggerBreakpoint>.Construct(
      function (const L, R: TdwsDebuggerBreakpoint): integer
      begin
        Result := AnsiCompareStr(L.SourceName, R.SourceName);
        if (Result = 0) then
          Result := L.Line-R.Line;
      end));

    ListViewBreakPoints.Items.BeginUpdate;
    try
      ListViewBreakPoints.Items.Clear;

      for i := 0 to Breakpoints.Count-1 do
      begin
        Breakpoint := Breakpoints[i];

        Item := ListViewBreakPoints.Items.Add;
        Item.Caption := Debugger.UnitNameFromInternalName(Breakpoint.SourceName);
        Item.SubItems.Add(IntToStr(Breakpoint.Line));
        Item.Data := Breakpoint;
        Item.Checked := Breakpoint.Enabled;
        if (Breakpoint.Enabled) then
          Item.ImageIndex := 12
        else
          Item.ImageIndex := 14;

        SourceContext := nil;
        if (BreakPointToScriptPos(Breakpoint, ScriptPos)) then
        begin
          SourceContext := Debugger.GetProgram.SourceContextMap.FindContext(ScriptPos);
          while (SourceContext <> nil) do
          begin
            if (SourceContext.ParentSym <> nil) then
            begin
              Item.SubItems.Add(SourceContext.ParentSym.QualifiedName);
              break;
            end;
            SourceContext := SourceContext.Parent;
          end;
        end;
        if (SourceContext = nil) then
          Item.SubItems.Add('');

      end;
    finally
      ListViewBreakPoints.Items.EndUpdate;
    end;
  finally
    BreakPoints.Free;
  end;
end;

end.

