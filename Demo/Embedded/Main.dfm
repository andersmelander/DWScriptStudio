object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'DWScript Debugger demo - Full integration'
  ClientHeight = 355
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 335
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
    ExplicitTop = 280
  end
  object PageControlDocuments: TcxPageControl
    Left = 0
    Top = 0
    Width = 635
    Height = 335
    Align = alClient
    TabOrder = 1
    Properties.ActivePage = TabSheetDocument1
    Properties.AllowDisabledTabAccess = True
    Properties.CustomButtons.Buttons = <>
    ExplicitTop = 41
    ExplicitHeight = 239
    ClientRectBottom = 331
    ClientRectLeft = 4
    ClientRectRight = 631
    ClientRectTop = 24
    object TabSheetDocument1: TcxTabSheet
      Caption = 'Document1'
      ImageIndex = 0
      ExplicitHeight = 211
      inline FrameDocument1: TFrameDocument
        Left = 0
        Top = 0
        Width = 627
        Height = 307
        Align = alClient
        Padding.Left = 4
        Padding.Top = 4
        Padding.Right = 4
        Padding.Bottom = 4
        TabOrder = 0
        ExplicitLeft = 132
        ExplicitTop = 48
        ExplicitWidth = 189
        ExplicitHeight = 113
        inherited PageControlAttachments: TcxPageControl
          Width = 619
          Height = 299
          Properties.CustomButtons.Buttons = <
            item
              HeaderImageIndex = 0
              Hint = 'Edit'
            end
            item
              HeaderImageIndex = 1
              Hint = 'Execute'
            end>
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 424
          ExplicitHeight = 334
          ClientRectBottom = 274
          ClientRectRight = 618
          inherited TabSheetUnit1: TcxTabSheet
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 424
            ExplicitHeight = 311
            inherited MemoScript: TMemo
              Width = 617
              Height = 273
              ExplicitHeight = 274
            end
          end
          inherited TabSheetUnit2: TcxTabSheet
            ExplicitWidth = 627
            ExplicitHeight = 243
            inherited Memo1: TMemo
              Width = 627
              Height = 282
            end
          end
        end
        inherited ImageListSmall: TcxImageList
          FormatVersion = 1
        end
      end
    end
    object TabSheetDocument2: TcxTabSheet
      Caption = 'Document2'
      ImageIndex = 1
      inline FrameDocument2: TFrameDocument
        Left = 0
        Top = 0
        Width = 627
        Height = 307
        Align = alClient
        Padding.Left = 4
        Padding.Top = 4
        Padding.Right = 4
        Padding.Bottom = 4
        TabOrder = 0
        ExplicitLeft = 132
        ExplicitTop = 48
        ExplicitWidth = 189
        ExplicitHeight = 113
        inherited PageControlAttachments: TcxPageControl
          Width = 619
          Height = 299
          Properties.CustomButtons.Buttons = <
            item
              HeaderImageIndex = 0
              Hint = 'Edit'
            end
            item
              HeaderImageIndex = 1
              Hint = 'Execute'
            end>
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 424
          ExplicitHeight = 334
          ClientRectBottom = 274
          ClientRectRight = 618
          inherited TabSheetUnit1: TcxTabSheet
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 424
            ExplicitHeight = 311
            inherited MemoScript: TMemo
              Width = 617
              Height = 273
              Lines.Strings = (
                'unit Unit1;'
                ''
                'uses'
                '  System.UI.Dialogs;'
                ''
                'procedure Test(const Msg: string);'
                'begin'
                '  ShowMessage(Msg);'
                'end;'
                ''
                'begin'
                '  Test('#39'blah'#39');'
                'end;')
              ExplicitWidth = 617
              ExplicitHeight = 273
            end
          end
          inherited TabSheetUnit2: TcxTabSheet
            ExplicitHeight = 309
            inherited Memo1: TMemo
              Width = 627
              Height = 282
              Lines.Strings = (
                'unit Unit2;'
                ''
                'uses'
                '  Unit1;'
                ''
                'begin'
                '  Test('#39'blah blah'#39');'
                'end;')
              ExplicitWidth = 627
              ExplicitHeight = 282
            end
          end
        end
        inherited ImageListSmall: TcxImageList
          FormatVersion = 1
        end
      end
    end
  end
  object AlertWindowManager: TdxAlertWindowManager
    LookAndFeel.NativeStyle = False
    OptionsAnimate.AlphaBlendValue = 200
    OptionsAnimate.HotTrackAlphaBlendValue = 255
    OptionsAnimate.CollapseEmptySlots = True
    OptionsBehavior.CloseOnRightClick = False
    OptionsBehavior.DisplayTime = 8000
    OptionsButtons.Buttons = <>
    OptionsCaptionButtons.CaptionButtons = [awcbPin, awcbClose]
    OptionsMessage.Caption.Font.Charset = DEFAULT_CHARSET
    OptionsMessage.Caption.Font.Color = clWindowText
    OptionsMessage.Caption.Font.Height = -13
    OptionsMessage.Caption.Font.Name = 'Tahoma'
    OptionsMessage.Caption.Font.Style = [fsBold]
    OptionsMessage.Text.Font.Charset = DEFAULT_CHARSET
    OptionsMessage.Text.Font.Color = clWindowText
    OptionsMessage.Text.Font.Height = -11
    OptionsMessage.Text.Font.Name = 'Tahoma'
    OptionsMessage.Text.Font.Style = []
    OptionsNavigationPanel.Font.Charset = DEFAULT_CHARSET
    OptionsNavigationPanel.Font.Color = clWindowText
    OptionsNavigationPanel.Font.Height = -11
    OptionsNavigationPanel.Font.Name = 'Tahoma'
    OptionsNavigationPanel.Font.Style = []
    OptionsSize.AutoHeight = True
    OnBeforeShow = AlertWindowManagerBeforeShow
    OnClick = AlertWindowManagerClick
    OnClose = AlertWindowManagerClose
    Left = 536
    Top = 204
    PixelsPerInch = 96
  end
end
