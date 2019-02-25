object ScriptDebuggerCallStackFrame: TScriptDebuggerCallStackFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  TabOrder = 0
  object ListViewCallStack: TcxListView
    Left = 0
    Top = 0
    Width = 451
    Height = 304
    Align = alClient
    Columns = <
      item
        AutoSize = True
      end>
    ReadOnly = True
    RowSelect = True
    ShowColumnHeaders = False
    Style.BorderStyle = cbsNone
    StyleFocused.BorderStyle = cbsNone
    StyleHot.BorderStyle = cbsNone
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = ListViewCallStackDblClick
    OnDeletion = ListViewCallStackDeletion
    OnMouseDown = ListViewCallStackMouseDown
  end
end
