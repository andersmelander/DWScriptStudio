unit amDialogForm;

(*
 * Copyright © 2012 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ActnList, StdCtrls, Menus,
  UxTheme,

  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  dxGDIPlusClasses, cxButtons, dxSkinsCore,
  dxSkinsDefaultPainters,

  amSysLink, System.Actions;

const
  MSG_AFTER_SHOW = WM_USER+1000; // +1000 In case derived form uses WM_USER

// -----------------------------------------------------------------------------
//
//              TCustomDialogForm
//
// -----------------------------------------------------------------------------
// Dialog Boxes: https://msdn.microsoft.com/en-us/windows/desktop/dn742499%28v=vs.85%29
// User Interface Text: https://msdn.microsoft.com/en-us/windows/desktop/dn742478.aspx
// -----------------------------------------------------------------------------
type
  TCustomDialogForm = class abstract(TForm)
    PanelButtons: TPanel;
    ButtonCancel: TcxButton;
    ButtonOK: TcxButton;
    ActionListDialog: TActionList;
    ActionOK: TAction;
    ActionCancel: TAction;
    ActionHelp: TAction;
    PanelMain: TPanel;
    ButtonHelp: TcxButton;
    PanelHeader: TPanel;
    LabelHeader: TLabel;
    LabelSubHeader: TLabel;
    PanelBottomSeparator: TPanel;
    PanelTopSeparator: TPanel;
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionHelpExecute(Sender: TObject);
    procedure ActionHelpUpdate(Sender: TObject);
  private
    FModernStyle: boolean;
    FOnAfterShow: TNotifyEvent;
    function GetTitle: string;
    function GetMinorTitle: string;
    procedure SetMinorTitle(const Value: string);
    procedure SetTitle(const Value: string);
    procedure SetModernStyle(const Value: boolean);
  protected
    // Custom Messages
    procedure MsgAfterShow(var Msg: TMessage); message MSG_AFTER_SHOW;

    procedure Resize; override;
    procedure DoShow; override;
    procedure DoAfterShow; virtual;
    procedure UpdateHeader;
    procedure UpdateTitles;
    property Title: string read GetTitle write SetTitle;
    property MinorTitle: string read GetMinorTitle write SetMinorTitle;
    property ModernStyle: boolean read FModernStyle write SetModernStyle;
  public
    constructor Create(AOwner: TComponent); override;

    class procedure ApplyDialogColor(Control: TWinControl);

    property OnAfterShow: TNotifyEvent read FOnAfterShow write FOnAfterShow;
  end;



function GetThemeColor(const ThemeClass: string; PartID: integer; Default: TColor; PropID: integer = TMT_TEXTCOLOR): TColor; overload;
function GetThemeTaskDialogColor(PartID: integer; Default: TColor; PropID: integer = TMT_FILLCOLOR): TColor;
function GetThemeTextColor(PartID: integer; Default: TColor; PropID: integer = TMT_TEXTCOLOR): TColor;

function ApplyThemeFont(const ThemeClass: string; PartID: integer; Font: TFont): boolean;
function ApplyThemeTextFont(PartID: integer; Font: TFont): boolean;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

implementation

{$R *.dfm}

uses
  Generics.Collections,
  Themes;

// -----------------------------------------------------------------------------

var
  FThemeHandles: TDictionary<string, HTheme>;

function ThemeHandle(const ThemeClass: string): HTheme;
begin
  if (FThemeHandles = nil) then
  begin
    FThemeHandles := TDictionary<string, HTheme>.Create;
    Result := OpenThemeData(0, PChar(ThemeClass));
    FThemeHandles.Add(ThemeClass, Result);
  end else
  if (not FThemeHandles.TryGetValue(ThemeClass, Result)) then
  begin
    Result := OpenThemeData(0, PChar(ThemeClass));
    FThemeHandles.Add(ThemeClass, Result);
  end;
end;

procedure CloseThemeHandles;
var
  Theme: HTheme;
begin
  if (FThemeHandles = nil) then
    exit;
  for Theme in FThemeHandles.Values.ToArray do
    CloseThemeData(Theme);
  FreeAndNil(FThemeHandles);
end;

// -----------------------------------------------------------------------------

function GetThemeTaskDialogColor(PartID: integer; Default: TColor; PropID: integer = TMT_FILLCOLOR): TColor;
begin
  Result := GetThemeColor('TASKDIALOG', PartID, Default, PropID);
end;

function GetThemeColor(const ThemeClass: string; PartID: integer; Default: TColor; PropID: integer = TMT_TEXTCOLOR): TColor;
var
  Color: COLORREF;
begin
  Color := 0; // Resulting value

  if (ThemeServices.ThemesEnabled) and (Succeeded(UxTheme.GetThemeColor(ThemeHandle(ThemeClass), PartID, 0, PropID, Color))) then
    Result := Color
  else
    Result := Default;
end;

function GetThemeTextColor(PartID: integer; Default: TColor; PropID: integer = TMT_TEXTCOLOR): TColor;
begin
  Result := GetThemeColor('TEXTSTYLE', PartID, Default, PropID);
end;

function ApplyThemeFont(const ThemeClass: string; PartID: integer; Font: TFont): boolean;
var
  LogFont: TLogFont;
  FontHandle: HFONT;
begin
  Result := False;
  if (ThemeServices.ThemesEnabled) and (Succeeded(GetThemeFont(ThemeHandle(ThemeClass), 0, PartID, 0, TMT_FONT, LogFont))) then
  begin
    FontHandle := CreateFontIndirect(LogFont);
    if (FontHandle <> 0) then
    begin
      Font.Handle := FontHandle;
      Result := True;
    end;
  end;
end;

function ApplyThemeTextFont(PartID: integer; Font: TFont): boolean;
begin
  Result := ApplyThemeFont('TEXTSTYLE', PartID, Font);
end;

// -----------------------------------------------------------------------------
//
//              TCustomDialogForm
//
// -----------------------------------------------------------------------------
procedure TCustomDialogForm.ActionCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

// -----------------------------------------------------------------------------

procedure TCustomDialogForm.ActionHelpExecute(Sender: TObject);
begin
  if (HelpType = htContext) then
    Application.HelpContext(HelpContext)
  else
  if (not Application.HelpKeyword(HelpKeyword)) then
    Application.HelpJump(HelpKeyword);
end;

// -----------------------------------------------------------------------------

procedure TCustomDialogForm.ActionHelpUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := ((HelpType = htContext) and (HelpContext > 0)) or ((HelpType = htKeyword) and (HelpKeyWord <> ''));
end;

// -----------------------------------------------------------------------------

procedure TCustomDialogForm.ActionOKExecute(Sender: TObject);
begin
  ModalResult := mrOK;
end;

// -----------------------------------------------------------------------------

type
  TWinControlCracker = class(TWinControl);

class procedure TCustomDialogForm.ApplyDialogColor(Control: TWinControl);
begin
  TWinControlCracker(Control).ParentBackground := False;
  TWinControlCracker(Control).Color := GetThemeTaskDialogColor(TDLG_PRIMARYPANEL, clWhite);
end;

// -----------------------------------------------------------------------------

constructor TCustomDialogForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  LabelHeader.Visible := LabelHeader.Visible and (LabelHeader.Caption <> '');
  LabelSubHeader.Visible := LabelSubHeader.Visible and (LabelSubHeader.Caption <> '');

  ModernStyle := True;

  UpdateHeader;
end;

// -----------------------------------------------------------------------------

procedure TCustomDialogForm.DoAfterShow;
begin
  if (Assigned(FOnAfterShow)) then
    FOnAfterShow(Self);
end;

// -----------------------------------------------------------------------------

procedure TCustomDialogForm.DoShow;
begin
  // Right align buttons
  if (not ButtonHelp.Visible) and (ButtonCancel.Visible) then
  begin
    ButtonOK.Left := (ButtonHelp.Left - ButtonCancel.Left);
    ButtonCancel.Left := ButtonHelp.Left;
  end else
  if (not ButtonCancel.Visible) then
    ButtonOK.Left := ButtonCancel.Left;

  PostMessage(Handle, MSG_AFTER_SHOW, 0, 0);

  UpdateTitles;
  inherited;
end;

// -----------------------------------------------------------------------------

procedure TCustomDialogForm.Resize;
begin
  inherited;
  if (Showing) then
    UpdateTitles;
end;

// -----------------------------------------------------------------------------

function TCustomDialogForm.GetMinorTitle: string;
begin
  Result := LabelSubHeader.Caption;
end;

procedure TCustomDialogForm.SetMinorTitle(const Value: string);
begin
  LabelSubHeader.Caption := Value;
  LabelSubHeader.Visible := (Value <> '');

  if (Showing) then
    UpdateTitles;

  UpdateHeader;
end;

// -----------------------------------------------------------------------------

procedure TCustomDialogForm.SetModernStyle(const Value: boolean);
begin
  FModernStyle := Value;

  if (FModernStyle) then
  begin
    PanelHeader.ParentBackground := False;
    PanelHeader.Color := GetThemeTaskDialogColor(TDLG_PRIMARYPANEL, clWhite);

    PanelMain.ParentBackground := False;
    PanelMain.Color := GetThemeTaskDialogColor(TDLG_PRIMARYPANEL, clWhite);

    // Note: TDLG_SECONDARYPANEL[TMT_FILLCOLOR] fails, but is included anyway in order to document our intentions.
    // PanelButtons.Color := GetThemeTaskDialogColor(TDLG_SECONDARYPANEL, $00F0F0F0);
    // PanelBottomSeparator.Color := GetThemeTaskDialogColor(TDLG_SECONDARYPANEL, $00DFDFDF, TMT_EDGEFILLCOLOR);

    // We could get the colors TDLG_FOOTNOTEPANE instead as that seems to support both TMT_FILLCOLOR and TMT_EDGEFILLCOLOR...
    // Yep:
    PanelButtons.Color := GetThemeTaskDialogColor(TDLG_FOOTNOTEPANE, PanelButtons.Color);
    PanelBottomSeparator.Color := GetThemeTaskDialogColor(TDLG_FOOTNOTEPANE, PanelBottomSeparator.Color, TMT_EDGEFILLCOLOR);

    PanelTopSeparator.Color := PanelBottomSeparator.Color; // Originally a slightly lighter color than bottom separator...

    if (not ApplyThemeTextFont(TEXT_BODYTEXT, Font)) then
      ParentFont := True;
    Font.Color := GetThemeTextColor(TEXT_BODYTEXT, Font.Color);

    if (not ApplyThemeTextFont(TEXT_MAININSTRUCTION, LabelHeader.Font)) then
    begin
      LabelHeader.ParentFont := True;
      LabelHeader.Font.Size := cxGetValueCurrentDPI(12);
    end;
    LabelHeader.Font.Color := GetThemeTextColor(TEXT_MAININSTRUCTION, $00993300);

    if (not ApplyThemeTextFont(TEXT_INSTRUCTION, LabelSubHeader.Font)) then
      LabelSubHeader.ParentFont := True;
    LabelSubHeader.Font.Color := GetThemeTextColor(TEXT_INSTRUCTION, LabelSubHeader.Font.Color);
  end else
  begin
    PanelHeader.ParentBackground := False;
    PanelHeader.Color := clWhite;

    PanelMain.ParentBackground := True;
    PanelMain.ParentBackground := True;

    LabelHeader.ParentFont := True;
    LabelHeader.Font.Style := [fsBold];
    LabelSubHeader.ParentFont := True;
  end;
end;

// -----------------------------------------------------------------------------

function TCustomDialogForm.GetTitle: string;
begin
  Result := LabelHeader.Caption;
end;

procedure TCustomDialogForm.SetTitle(const Value: string);
begin
  LabelHeader.Caption := Value;
  LabelHeader.Visible := (Value <> '');

  if (Showing) then
    UpdateTitles;

  UpdateHeader;
end;

// -----------------------------------------------------------------------------

procedure TCustomDialogForm.MsgAfterShow(var Msg: TMessage);
begin
  DoAfterShow;
end;

// -----------------------------------------------------------------------------

procedure TCustomDialogForm.UpdateHeader;
var
  NewHeight: integer;
  WasVisible: boolean;
begin
  // Adjust height if header and/or footnote isn't visible
  NewHeight := Height;

  if (LabelHeader.Visible) then
  begin
    LabelHeader.AutoSize := False;
    LabelHeader.AutoSize := True;
  end;
  if (LabelSubHeader.Visible) then
  begin
    LabelSubHeader.AutoSize := False;
    LabelSubHeader.AutoSize := True;
  end;
  PanelHeader.AutoSize := False;
  PanelHeader.AutoSize := True;

  WasVisible := PanelHeader.Visible;
  PanelHeader.Visible := (LabelHeader.Visible) or (LabelSubHeader.Visible);
  PanelTopSeparator.Visible := PanelHeader.Visible;
  if (PanelTopSeparator.Visible) then
    PanelTopSeparator.Top := PanelHeader.BoundsRect.Bottom+1;

  if (WasVisible <> PanelHeader.Visible) then
  begin
    if (PanelHeader.Visible) then
      Inc(NewHeight, PanelHeader.Height + PanelTopSeparator.Height)
    else
      Dec(NewHeight, PanelHeader.Height + PanelTopSeparator.Height);
  end;

  if (Height <> NewHeight) then
    Height := NewHeight;

  PanelBottomSeparator.Top := PanelButtons.BoundsRect.Top-1;
end;

// -----------------------------------------------------------------------------

procedure TCustomDialogForm.UpdateTitles;

  procedure AutoSizeLabel(ALabel: TLabel);
  var
    s: string;
    r: TRect;
    TextFormat: TTextFormat;
    Canvas: TCanvas;
  begin
    if (not ALabel.Visible) or (not ALabel.AutoSize) then
      exit;

    s := ALabel.Caption;
    r := ALabel.BoundsRect;

    Canvas := TControlCanvas.Create;
    try
      TControlCanvas(Canvas).Control := ALabel;
      Canvas.Font.Assign(ALabel.Font);

      TextFormat := [tfCalcRect, tfLeft, tfNoClip, tfNoPrefix, tfTop, tfWordBreak];
      if (ALabel.WordWrap) then
        Include(TextFormat, tfWordBreak);
      Canvas.TextRect(r, s, TextFormat);
    finally
      Canvas.Free;
    end;

    ALabel.AutoSize := False;
    ALabel.Height := r.Bottom - r.Top;
  end;

begin
  // Work around AutoSize, Align, WordWrap conflict

  PanelHeader.Realign;

  AutoSizeLabel(LabelHeader);
  if (LabelHeader.Visible) then
    LabelSubHeader.Top := LabelHeader.Top + LabelHeader.Height + LabelSubHeader.Margins.Top;
  AutoSizeLabel(LabelSubHeader);

  PanelHeader.Realign;
end;

// -----------------------------------------------------------------------------

initialization
finalization
  CloseThemeHandles;
end.
