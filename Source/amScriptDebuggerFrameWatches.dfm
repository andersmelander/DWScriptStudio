object ScriptDebuggerWatchesFrame: TScriptDebuggerWatchesFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 286
  Align = alClient
  TabOrder = 0
  object TreeListWatches: TcxTreeList
    Left = 0
    Top = 0
    Width = 451
    Height = 286
    BorderStyle = cxcbsNone
    Align = alClient
    Bands = <
      item
      end>
    Navigator.Buttons.CustomButtons = <>
    OptionsBehavior.CellHints = True
    OptionsCustomizing.ColumnCustomizing = False
    OptionsCustomizing.ColumnMoving = False
    OptionsCustomizing.ColumnsQuickCustomization = True
    OptionsCustomizing.ColumnVertSizing = False
    OptionsCustomizing.StackedColumns = False
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsSelection.CellSelect = False
    OptionsView.CellEndEllipsis = True
    OptionsView.ColumnAutoWidth = True
    OptionsView.DynamicIndent = True
    OptionsView.TreeLineStyle = tllsNone
    PopupMenu = WatchWindowPopupMenu
    ScrollbarAnnotations.CustomAnnotations = <>
    TabOrder = 0
    OnDblClick = TreeListWatchesDblClick
    OnEnter = TreeListWatchesEnter
    OnExit = TreeListWatchesExit
    OnExpanding = TreeListWatchesExpanding
    ExplicitLeft = 3
    ExplicitTop = 68
    object TreeListWatchesColumnExpression: TcxTreeListColumn
      Caption.Text = 'Expression'
      Width = 100
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object TreeListWatchesColumnValue: TcxTreeListColumn
      Caption.Text = 'Value'
      Width = 100
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object TreeListWatchesColumnType: TcxTreeListColumn
      Caption.Text = 'Type'
      Width = 100
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object TreeListWatchesColumnScope: TcxTreeListColumn
      Visible = False
      Caption.Text = 'Context'
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
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
