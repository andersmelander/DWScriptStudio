object ScriptDebuggerWatchesFrame: TScriptDebuggerWatchesFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  TabOrder = 0
  object lvWatches: TcxListView
    Left = 0
    Top = 0
    Width = 451
    Height = 304
    Align = alClient
    ColumnClick = False
    Columns = <
      item
        Caption = 'Expression'
        Width = 80
      end
      item
        AutoSize = True
        Caption = 'Value'
      end>
    PopupMenu = WatchWindowPopupMenu
    ReadOnly = True
    RowSelect = True
    Style.BorderStyle = cbsNone
    StyleFocused.BorderStyle = cbsNone
    StyleHot.BorderStyle = cbsNone
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = lvWatchesDblClick
    OnEnter = lvWatchesEnter
    OnExit = lvWatchesExit
  end
  object ActionList: TActionList
    State = asSuspended
    Left = 56
    Top = 80
    object actDeleteWatch: TAction
      Caption = 'Delete Watch'
      ShortCut = 46
      OnExecute = actDeleteWatchExecute
      OnUpdate = actDeleteWatchUpdate
    end
    object actAddWatch: TAction
      Caption = 'Add Watch'
      ShortCut = 45
      OnExecute = actAddWatchExecute
    end
    object actEditWatch: TAction
      Caption = 'Edit Watch'
      ShortCut = 16397
      OnExecute = actEditWatchExecute
      OnUpdate = actEditWatchUpdate
    end
  end
  object WatchWindowPopupMenu: TPopupMenu
    Left = 168
    Top = 80
    object MenuItemAddWatch: TMenuItem
      Action = actAddWatch
    end
    object MenuItemDeleteWatch: TMenuItem
      Action = actDeleteWatch
    end
    object MenuItemEditWatch: TMenuItem
      Action = actEditWatch
    end
  end
end
