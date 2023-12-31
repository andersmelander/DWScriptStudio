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
    ClientRectBottom = 333
    ClientRectLeft = 2
    ClientRectRight = 633
    ClientRectTop = 23
    object TabSheetDocument1: TcxTabSheet
      AlignWithMargins = True
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Caption = 'Document1'
      ImageIndex = 0
      ExplicitLeft = 2
      ExplicitTop = 23
      ExplicitWidth = 631
      ExplicitHeight = 310
      inline FrameDocument1: TFrameDocument
        Left = 0
        Top = 0
        Width = 611
        Height = 290
        Align = alClient
        Padding.Left = 4
        Padding.Top = 4
        Padding.Right = 4
        Padding.Bottom = 4
        TabOrder = 0
        ExplicitWidth = 631
        ExplicitHeight = 310
        inherited PageControlAttachments: TcxPageControl
          Width = 603
          Height = 282
          Properties.CustomButtons.Buttons = <
            item
              HeaderImageIndex = 0
              Hint = 'Edit'
            end
            item
              HeaderImageIndex = 1
              Hint = 'Execute'
            end>
          ExplicitWidth = 623
          ExplicitHeight = 302
          ClientRectBottom = 257
          ClientRectRight = 602
          inherited TabSheetUnit1: TcxTabSheet
            ExplicitLeft = 1
            ExplicitTop = 1
            ExplicitWidth = 621
            ExplicitHeight = 276
            inherited MemoScript: TMemo
              Width = 601
              Height = 256
              ExplicitWidth = 621
              ExplicitHeight = 276
            end
          end
          inherited TabSheetUnit2: TcxTabSheet
            ExplicitLeft = 1
            ExplicitTop = 1
            ExplicitWidth = 441
            ExplicitHeight = 270
          end
        end
        inherited ImageListSmall: TcxImageList
          FormatVersion = 1
        end
      end
    end
    object TabSheetDocument2: TcxTabSheet
      AlignWithMargins = True
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Caption = 'Document2'
      ImageIndex = 1
      ExplicitLeft = 2
      ExplicitTop = 23
      ExplicitWidth = 631
      ExplicitHeight = 310
      inline FrameDocument2: TFrameDocument
        Left = 0
        Top = 0
        Width = 611
        Height = 290
        Align = alClient
        Padding.Left = 4
        Padding.Top = 4
        Padding.Right = 4
        Padding.Bottom = 4
        TabOrder = 0
        ExplicitWidth = 631
        ExplicitHeight = 310
        inherited PageControlAttachments: TcxPageControl
          Width = 603
          Height = 282
          Properties.CustomButtons.Buttons = <
            item
              HeaderImageIndex = 0
              Hint = 'Edit'
            end
            item
              HeaderImageIndex = 1
              Hint = 'Execute'
            end>
          ExplicitWidth = 623
          ExplicitHeight = 302
          ClientRectBottom = 257
          ClientRectRight = 602
          inherited TabSheetUnit1: TcxTabSheet
            Caption = 'TestExternals.pas'
            ExplicitLeft = 1
            ExplicitTop = 1
            ExplicitWidth = 621
            ExplicitHeight = 276
            inherited MemoScript: TMemo
              Width = 601
              Height = 256
              Lines.Strings = (
                'unit TestExternals;'
                ''
                'uses'
                '  ImportExternals;'
                ''
                'for var i := 0 to 3 do'
                'begin'
                '  Whoop(0);'
                '  Sleep(100);'
                'end;'
                ''
                'MyMessageBox(0, '#39'Are You Not Entertained?'#39', '#39'Whoopey!'#39', 3);')
              ExplicitWidth = 621
              ExplicitHeight = 276
            end
          end
          inherited TabSheetUnit2: TcxTabSheet
            Caption = 'ImportExternals.pas'
            ExplicitLeft = 1
            ExplicitTop = 1
            ExplicitWidth = 441
            ExplicitHeight = 270
            inherited Memo1: TMemo
              Lines.Strings = (
                'unit ImportExternals;'
                ''
                '// BOOL WINAPI MessageBeep(_In_ UINT uType);'
                
                  'function Whoop(a: DWORD): BOOL; external "MessageBeep@user32.dll' +
                  '"; stdcall;'
                ''
                
                  '// int WINAPI MessageBox(_In_opt_ HWND hWnd, _In_opt_ LPCTSTR lp' +
                  'Text, _In_opt_ LPCTSTR lpCaption, _In_ UINT uType);'
                
                  'function MyMessageBox(HWND: DWORD; const Text: string; const Cap' +
                  'tion: string; Kind: DWORD): DWORD; external '
                '"MessageBoxW@user32.dll"; stdcall;')
            end
          end
        end
        inherited ImageListSmall: TcxImageList
          FormatVersion = 1
          DesignInfo = 1966468
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
