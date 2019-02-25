object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'DWScript Debugger demo - Minimal integration'
  ClientHeight = 300
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 280
    Width = 635
    Height = 20
    Panels = <>
    SimplePanelStyle.Active = True
    SimplePanelStyle.AutoHint = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object MemoScript: TMemo
    Left = 0
    Top = 41
    Width = 635
    Height = 239
    Align = alClient
    Lines.Strings = (
      'ShowMessage('#39'Hello world'#39');'
      'This is a syntax error')
    TabOrder = 1
  end
  object PanelToolbar: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object ButtonDebugger: TcxButton
      Left = 236
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Debugger'
      TabOrder = 0
      OnClick = ButtonDebuggerClick
    end
    object ButtonExecute: TcxButton
      Left = 8
      Top = 10
      Width = 94
      Height = 25
      Caption = 'Execute'
      TabOrder = 1
      OnClick = ButtonExecuteClick
    end
    object ButtonEdit: TcxButton
      Left = 108
      Top = 10
      Width = 93
      Height = 25
      Caption = 'Open in editor'
      TabOrder = 2
      OnClick = ButtonEditClick
    end
  end
end
