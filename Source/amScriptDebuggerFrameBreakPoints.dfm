object ScriptDebuggerBreakPointsFrame: TScriptDebuggerBreakPointsFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  TabOrder = 0
  object ListViewBreakPoints: TcxListView
    Left = 0
    Top = 0
    Width = 451
    Height = 304
    Align = alClient
    Checkboxes = True
    Columns = <
      item
        Caption = 'Unit'
        MinWidth = 50
        Width = 120
      end
      item
        Alignment = taRightJustify
        Caption = 'Line'
        MinWidth = 50
      end
      item
        AutoSize = True
        Caption = 'Context'
      end>
    ReadOnly = True
    RowSelect = True
    Style.BorderStyle = cbsNone
    Style.TransparentBorder = True
    StyleFocused.BorderStyle = cbsNone
    StyleHot.BorderStyle = cbsNone
    TabOrder = 0
    ViewStyle = vsReport
    OnChange = ListViewBreakPointsChange
    OnDblClick = ListViewBreakPointsDblClick
    OnKeyDown = ListViewBreakPointsKeyDown
  end
end
