unit amSysLink;

(*
 * Copyright © 2008 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Classes,
  ExtCtrls,
  Controls,
  Messages;

//------------------------------------------------------------------------------
//
//      TamLinkLabel
//
//------------------------------------------------------------------------------
// A transparent TLinkLabel
//------------------------------------------------------------------------------
// Note: Transparency does not work with skinning unless the parent control is
// a form.
//------------------------------------------------------------------------------
type
  TamLinkLabel = class(ExtCtrls.TLinkLabel)
  private
    procedure SetTransparent(const Value: boolean);
    function GetTransparent: boolean;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CNCtlColorStatic(var Msg: TWMCtlColorStatic); message CN_CTLCOLORSTATIC;
    procedure WMPaint(var Msg: TWMPaint); message WM_PAINT;
  public
    constructor Create(AOwner: TComponent); override;
    property Transparent: boolean read GetTransparent write SetTransparent;
  end;

type
  TamTestLinkLabel = class(ExtCtrls.TLinkLabel)
  private
  protected
    procedure MsgWM_PRINTCLIENT(var Msg: TWMPrintClient); message WM_PRINTCLIENT;
    procedure WMPaint(var Msg: TWMPaint); message WM_PAINT;
    procedure MsgWM_ERASEBKGND(var Msg: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure Loaded; override;
  public
  end;

//------------------------------------------------------------------------------
//
//      TamBetterLinkLabel
//
//------------------------------------------------------------------------------
// Work in progress. Still needs to implement word wrap and style painting.
//------------------------------------------------------------------------------
type
  TLinkElementKind = (lekText, lekURL, lekID);

  TLinkElement = record
    Kind: TLinkElementKind;
    Text: string;
    Link: string;
  end;

  TamBetterLinkLabel = class(TCustomControl)
  private
    FAlignment: TAlignment;
    FAutoSize: Boolean;
    FUseVisualStyle: Boolean;
    FOnLinkClick: TSysLinkEvent;
    FElements: array of TLinkElement;
    FNeedParse: boolean;
  protected
    procedure ParseLinks;
    function ParsedText: string;
    procedure SetTransparent(const Value: boolean);
    function GetTransparent: boolean;
    procedure AdjustBounds;
    procedure DoOnLinkClick(const Link: string; LinkType: TSysLinkType);
    procedure SetAlignment(const Value: TAlignment);
    procedure SetUseVisualStyle(const Value: Boolean);
    procedure SetAutoSize(Value: Boolean); override;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;

    procedure CreateParams(var Params: TCreateParams); override;
    procedure Paint; override;
    procedure WndProc(var Msg: TMessage); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X: Integer; Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X: Integer; Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X: Integer; Y: Integer); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure CNCtlColorStatic(var Message: TWMCtlColorStatic); message CN_CTLCOLORSTATIC;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Transparent: boolean read GetTransparent write SetTransparent;

  published
    property Alignment: TAlignment read FAlignment write SetAlignment default taLeftJustify;
    property AutoSize: Boolean read FAutoSize write SetAutoSize default True;
    property UseVisualStyle: Boolean read FUseVisualStyle write SetUseVisualStyle default False;
    property OnLinkClick: TSysLinkEvent read FOnLinkClick write FOnLinkClick;
    property Anchors;
    property BevelEdges;
    property BevelInner;
    property BevelKind default bkNone;
    property BevelOuter;
    property Caption;
    property Color nodefault;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Touch;
    property Visible;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnGesture;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
  end;

type
  TLinkLabel = class(TamLinkLabel);
//  TLinkLabel = class(TamBetterLinkLabel);
//  TLinkLabel = class(TamTestLinkLabel);

implementation

uses
  Themes,
  Dwmapi,
  Windows,
  CommCtrl,
  Graphics,
  SysUtils;

//------------------------------------------------------------------------------
//
//      TLinkLabel
//
//------------------------------------------------------------------------------
procedure TamLinkLabel.CNCtlColorStatic(var Msg: TWMCtlColorStatic);
begin
  if (Transparent) and (ThemeServices.ThemesEnabled) then
  begin
    SetBkMode(Msg.ChildDC, Windows.TRANSPARENT);
    ThemeServices.DrawParentBackground(Handle, Msg.ChildDC, nil, False);
    { Return an empty brush to prevent Windows from overpainting what we just have created. }
    Msg.Result := GetStockObject(NULL_BRUSH);
  end else
    inherited;
end;

constructor TamLinkLabel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csOpaque] + [csParentBackground];
end;

procedure TamLinkLabel.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);

  if (Transparent) then
    Params.Style := Params.Style or LWS_TRANSPARENT;
end;

function TamLinkLabel.GetTransparent: boolean;
begin
  Result := not (csOpaque in ControlStyle);
end;

procedure TamLinkLabel.SetTransparent(const Value: boolean);
begin
  if (Transparent = Value) then
    exit;

  if Value then
    ControlStyle := ControlStyle - [csOpaque]
  else
    ControlStyle := ControlStyle + [csOpaque];

  RecreateWnd;
  Invalidate;
end;

procedure TamLinkLabel.WMPaint(var Msg: TWMPaint);
begin
  // Work around for TLinkLabel text becoming invisible due to double buffering when Aero is off.
  if (not DwmCompositionEnabled) then
    Perform(WM_PRINTCLIENT, WParam(Msg.DC), PRF_CLIENT) // WParam cast to avoid intermittent range check error
  else
    inherited;
end;

//------------------------------------------------------------------------------
//
//      TamBetterLinkLabel
//
//------------------------------------------------------------------------------
procedure TamBetterLinkLabel.AdjustBounds;
var
  TextRect: TRect;
  s: string;
begin
  if not (csLoading in ComponentState) and FAutoSize then
  begin
    TextRect := ClientRect;
    s := ParsedText;

    DrawText(Canvas.Handle, s, Length(s), TextRect,
      DT_WORDBREAK or DT_TOP or DT_LEFT or DT_NOCLIP or DT_NOPREFIX or DT_CALCRECT);

    SetBounds(TextRect.Left, TextRect.Top,
      TextRect.Right - TextRect.Left + (GetSystemMetrics(SM_CXBORDER) * 4),
      TextRect.Bottom - TextRect.Top + (GetSystemMetrics(SM_CYBORDER) * 4));
  end;
end;

procedure TamBetterLinkLabel.CMFontChanged(var Message: TMessage);
begin
  inherited;
  AdjustBounds;
  Invalidate;
end;

procedure TamBetterLinkLabel.CMTextChanged(var Message: TMessage);
begin
  inherited;
  FNeedParse := True;
  AdjustBounds;
  Invalidate;
end;

procedure TamBetterLinkLabel.CNCtlColorStatic(var Message: TWMCtlColorStatic);
begin
  with ThemeServices do
    if Transparent and ThemesEnabled and DwmCompositionEnabled then
    begin
      SetBkMode(Message.ChildDC, Windows.TRANSPARENT);
      DrawParentBackground(Handle, Message.ChildDC, nil, False);
      { Return an empty brush to prevent Windows from overpainting what we just have created. }
      Message.Result := GetStockObject(NULL_BRUSH);
    end else
      inherited;
end;

constructor TamBetterLinkLabel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csOpaque] + [csParentBackground];
  Cursor := crHandPoint;
//  Font.Color := clHotLight;
end;

procedure TamBetterLinkLabel.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);

  if (Transparent) then
  begin
    Params.ExStyle := Params.ExStyle or WS_EX_TRANSPARENT;
  end;
end;

destructor TamBetterLinkLabel.Destroy;
begin

  inherited;
end;

procedure TamBetterLinkLabel.DoOnLinkClick(const Link: string; LinkType: TSysLinkType);
begin
  if Assigned(FOnLinkClick) then
    FOnLinkClick(Self, Link, LinkType);
end;

function TamBetterLinkLabel.GetTransparent: boolean;
begin
  Result := not (csOpaque in ControlStyle);
end;

procedure TamBetterLinkLabel.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;

end;

procedure TamBetterLinkLabel.KeyUp(var Key: Word; Shift: TShiftState);
begin
  inherited;

end;

procedure TamBetterLinkLabel.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if TabStop then
    SetFocus;
  Invalidate;
end;

procedure TamBetterLinkLabel.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited;

end;

procedure TamBetterLinkLabel.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited;
  DoOnLinkClick('whoop', sltURL);
end;

procedure TamBetterLinkLabel.Paint;
var
  TextRect: TRect;
  s: string;
const
  DTAlign: array[TAlignment] of cardinal = (DT_LEFT, DT_RIGHT, DT_CENTER);
begin
  inherited;

  if (not Transparent) then
  begin
    Canvas.Brush.Style := bsSolid;
    Canvas.Brush.Color := Color;
    Canvas.FillRect(ClientRect);
  end else
    Canvas.Brush.Style := bsClear;

  TextRect := ClientRect;
  s := ParsedText;
  DrawText(Canvas.Handle, s, Length(s), TextRect,
    DTAlign[FALignment] or DT_WORDBREAK or DT_TOP or DT_NOCLIP or DT_NOPREFIX or DT_CALCRECT);

  DrawText(Canvas.Handle, s, Length(s), TextRect,
    DTAlign[FALignment] or DT_WORDBREAK or DT_TOP or DT_NOCLIP or DT_NOPREFIX);

  if (Focused) then
    DrawFocusRect(Canvas.Handle, TextRect);
end;

function TamBetterLinkLabel.ParsedText: string;
var
  i: integer;
begin
  ParseLinks;
  Result := '';
  for i := 0 to Length(FElements)-1 do
    Result := Result + FElements[i].Text;
end;

procedure TamBetterLinkLabel.ParseLinks;
var
  ElementCount: integer;

  procedure PushElement(const Text, Link: string; Kind: TLinkElementKind);
  begin
    if (Text = '') then
      exit;

    if (ElementCount = Length(FElements)) then
      SetLength(FElements, Length(FElements) + 4);

    FElements[ElementCount].Text := Text;
    FElements[ElementCount].Link := Link;
    FElements[ElementCount].Kind := Kind;

    inc(ElementCount);
  end;

const
  sLinkOpen = '<a';
  sLinkHRef = 'href="';
  sLinkId = 'id="';
  sLinkClose = '</a>';
var
  CurrentElementKind: TLinkElementKind;
  Start, Current: integer;
  ValidLink: boolean;
  CurrentLink, CurrentText: string;
  StartSegment, EndSegment: integer;
begin
  if (not FNeedParse) then
    exit;
  FNeedParse := False;

  ElementCount := 0;

  Start := 1;
  Current := Start;
  CurrentElementKind := lekText;
  CurrentText := '';
  CurrentLink := '';
  ValidLink := False;
  while (Current <= Length(Caption)) do
  begin
    if (Caption[Current] = '<') then
    begin
      if (StrLIComp(@Caption[Current], PChar(sLinkOpen), Length(sLinkOpen)) = 0) and (CurrentElementKind = lekText) then
      begin
        CurrentText := Copy(Caption, Start, Current-Start);
        PushElement(CurrentText, CurrentLink, CurrentElementKind);
        CurrentText := '';
        CurrentLink := '';

        inc(Current, Length(sLinkOpen));

        ValidLink := False;
        CurrentLink := '';

        if (Caption[Current] = '>') then
        begin
          Inc(Current);
          // Empty (but valid) link
          ValidLink := True;
          CurrentElementKind := lekURL;
          Start := Current;
        end else
        if (Caption[Current] = ' ') then
        begin
          while (Caption[Current] = ' ') do
            Inc(Current);

          if (StrLIComp(@Caption[Current], PChar(sLinkHRef), Length(sLinkHRef)) = 0) then
          begin
            Inc(Current, Length(sLinkHRef));
            StartSegment := Current;
            // Look for ending "
            while (Caption[Current] <> #0) and (Caption[Current] <> '"') do
              Inc(Current);
            EndSegment := Current;
            if (Caption[Current] = '"') then
              Inc(Current);

            // Skip trailing space
            while (Caption[Current] <> #0) and (Caption[Current] = ' ') do
              Inc(Current);

            // Require ending >
            if (Caption[Current] = '>') then
            begin
              Inc(Current);
              CurrentLink := Copy(Caption, StartSegment, EndSegment-StartSegment);
              CurrentElementKind := lekURL;
              ValidLink := True;
              Start := Current;
            end;
          end else
          if (StrLIComp(@Caption[Current], PChar(sLinkId), Length(sLinkId)) = 0) then
          begin
            Inc(Current, Length(sLinkId));
            StartSegment := Current;
            // Look for ending "
            while (Caption[Current] <> #0) and (Caption[Current] <> '"') do
              Inc(Current);
            EndSegment := Current;
            if (Caption[Current] = '"') then
              Inc(Current);

            // Skip trailing space
            while (Caption[Current] <> #0) and (Caption[Current] = ' ') do
              Inc(Current);

            // Require ending >
            if (Caption[Current] = '>') then
            begin
              Inc(Current);
              CurrentLink := Copy(Caption, StartSegment, EndSegment-StartSegment);
              CurrentElementKind := lekID;
              ValidLink := True;
              Start := Current;
            end;
          end;
        end;
      end else
      if (StrLIComp(@Caption[Current], PChar(sLinkClose), Length(sLinkClose)) = 0) and (CurrentElementKind <> lekText) then
      begin
        CurrentText := Copy(Caption, Start, Current-Start);
        inc(Current, Length(sLinkClose));
        if (ValidLink) then
          PushElement(CurrentText, CurrentLink, CurrentElementKind);
        CurrentElementKind := lekText;
        CurrentText := '';
        CurrentLink := '';
        ValidLink := False;
        Start := Current;
      end;
    end else
      inc(Current);
  end;

  if (Current-Start > 0) then
  begin
    CurrentText := Copy(Caption, Start, Current-Start);
    PushElement(CurrentText, CurrentLink, CurrentElementKind);
  end;
end;

procedure TamBetterLinkLabel.SetAlignment(const Value: TAlignment);
begin
  if Value <> FAlignment then
  begin
    FAlignment := Value;
    Invalidate;
  end;
end;

procedure TamBetterLinkLabel.SetAutoSize(Value: Boolean);
begin
  if FAutoSize <> Value then
  begin
    FAutoSize := Value;
    if FAutoSize then
    begin
      AdjustBounds;
      Invalidate;
    end;
  end;
end;

procedure TamBetterLinkLabel.SetTransparent(const Value: boolean);
begin
  if (Transparent = Value) then
    exit;

  if Value then
    ControlStyle := ControlStyle - [csOpaque]
  else
    ControlStyle := ControlStyle + [csOpaque];

  Invalidate;
end;

procedure TamBetterLinkLabel.SetUseVisualStyle(const Value: Boolean);
begin
  if Value <> FUseVisualStyle then
  begin
    FUseVisualStyle := Value;
    Invalidate;
  end;
end;

procedure TamBetterLinkLabel.WndProc(var Msg: TMessage);
begin

  inherited;
  case Msg.Msg of
    WM_GETDLGCODE:
      Msg.Result := Msg.Result or DLGC_WANTTAB or DLGC_WANTARROWS or DLGC_WANTALLKEYS;

    WM_ERASEBKGND:
      Msg.Result := 1;

    WM_SIZE:
      begin
//        UpdateMetrics;
        Invalidate;
      end;

    WM_SETFOCUS, WM_KILLFOCUS:
      Invalidate;
  end;
end;

procedure TamTestLinkLabel.Loaded;
begin
  inherited;
//  UseVisualStyle := False;
//  DoubleBuffered := False;
//  Font.Color := clRed;
end;

procedure TamTestLinkLabel.MsgWM_ERASEBKGND(var Msg: TWMEraseBkgnd);
begin
  inherited;
//  Msg.Result := 1;
end;

procedure TamTestLinkLabel.MsgWM_PRINTCLIENT(var Msg: TWMPrintClient);
begin
  inherited;
end;

procedure TamTestLinkLabel.WMPaint(var Msg: TWMPaint);
begin
  Perform(WM_PRINTCLIENT, Msg.DC, PRF_CLIENT);
end;

end.
