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
    PopupMenu = PopupMenu
    ScrollbarAnnotations.CustomAnnotations = <>
    TabOrder = 0
    OnDblClick = TreeListWatchesDblClick
    OnExpanding = TreeListWatchesExpanding
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
  object PopupMenu: TdxBarPopupMenu
    BarManager = BarManager
    ItemLinks = <
      item
        Visible = True
        ItemName = 'MenuItemWatchAdd'
      end
      item
        Visible = True
        ItemName = 'MenuItemWatchDelete'
      end
      item
        Visible = True
        ItemName = 'MenuItemWatchEdit'
      end
      item
        Visible = True
        ItemName = 'dxBarSeparator1'
      end
      item
        Visible = True
        ItemName = 'MenuItemScopePublished'
      end
      item
        Visible = True
        ItemName = 'MenuItemScopePublic'
      end
      item
        Visible = True
        ItemName = 'MenuItemScopeProtected'
      end
      item
        Visible = True
        ItemName = 'MenuItemScopePrivate'
      end
      item
        Visible = True
        ItemName = 'dxBarSeparator2'
      end
      item
        Visible = True
        ItemName = 'MenuItemMembersProperties'
      end
      item
        Visible = True
        ItemName = 'MenuItemMembersPropertyGetters'
      end
      item
        Visible = True
        ItemName = 'MenuItemMembersFields'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'MenuItemMembersInherited'
      end>
    UseOwnFont = False
    Left = 212
    Top = 76
    PixelsPerInch = 96
  end
  object BarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 152
    Top = 132
    PixelsPerInch = 96
    object dxBarSeparator1: TdxBarSeparator
      Caption = 'Scope'
      Category = 0
      Hint = 'Scope'
      Visible = ivAlways
    end
    object MenuItemScopePublished: TdxBarButton
      Tag = 4
      Action = ActionViewScopePublished
      Category = 0
      ButtonStyle = bsChecked
    end
    object MenuItemScopePublic: TdxBarButton
      Tag = 3
      Action = ActionViewScopePublic
      Category = 0
      ButtonStyle = bsChecked
    end
    object MenuItemScopeProtected: TdxBarButton
      Tag = 2
      Action = ActionViewScopeProtected
      Category = 0
      ButtonStyle = bsChecked
    end
    object MenuItemScopePrivate: TdxBarButton
      Tag = 1
      Action = ActionViewScopePrivate
      Category = 0
      ButtonStyle = bsChecked
    end
    object dxBarSeparator2: TdxBarSeparator
      Caption = 'Members'
      Category = 0
      Hint = 'Members'
      Visible = ivAlways
    end
    object MenuItemMembersInherited: TdxBarButton
      Action = ActionViewMemberInherited
      Category = 0
      ButtonStyle = bsChecked
    end
    object MenuItemMembersProperties: TdxBarButton
      Action = ActionViewMemberProperties
      Category = 0
      ButtonStyle = bsChecked
    end
    object MenuItemMembersPropertyGetters: TdxBarButton
      Action = ActionViewMemberPropertySideEffects
      Category = 0
      ButtonStyle = bsChecked
    end
    object MenuItemMembersFields: TdxBarButton
      Action = ActionViewMemberFields
      Category = 0
      ButtonStyle = bsChecked
    end
    object MenuItemWatchAdd: TdxBarButton
      Action = ActionWatchAdd
      Category = 0
    end
    object MenuItemWatchDelete: TdxBarButton
      Action = ActionWatchDelete
      Category = 0
    end
    object MenuItemWatchEdit: TdxBarButton
      Action = ActionWatchEdit
      Category = 0
    end
  end
  object ActionList: TActionList
    Left = 52
    Top = 112
    object ActionWatchDelete: TAction
      Category = 'Action'
      Caption = 'Delete Watch'
      Hint = 'Delete the selected watch'
      ShortCut = 46
      OnExecute = ActionWatchDeleteExecute
      OnUpdate = ActionWatchDeleteUpdate
    end
    object ActionWatchAdd: TAction
      Category = 'Action'
      Caption = 'Add Watch'
      Hint = 'Add a new watch'
      ShortCut = 45
      OnExecute = ActionWatchAddExecute
    end
    object ActionWatchEdit: TAction
      Category = 'Action'
      Caption = 'Edit Watch'
      Hint = 'Edit the selected watch'
      ShortCut = 16397
      OnExecute = ActionWatchEditExecute
      OnUpdate = ActionWatchEditUpdate
    end
    object ActionViewMemberFields: TAction
      Category = 'Members'
      AutoCheck = True
      Caption = 'Fields'
      OnExecute = ActionViewMemberFieldsExecute
      OnUpdate = ActionViewMemberFieldsUpdate
    end
    object ActionViewMemberProperties: TAction
      Category = 'Members'
      AutoCheck = True
      Caption = 'Properties'
      OnExecute = ActionViewMemberPropertiesExecute
      OnUpdate = ActionViewMemberPropertiesUpdate
    end
    object ActionViewMemberPropertySideEffects: TAction
      Category = 'Members'
      AutoCheck = True
      Caption = 'Allow side effects'
      OnExecute = ActionViewMemberPropertySideEffectsExecute
      OnUpdate = ActionViewMemberPropertySideEffectsUpdate
    end
    object ActionViewMemberInherited: TAction
      Category = 'Members'
      AutoCheck = True
      Caption = 'Display inherited members'
      OnExecute = ActionViewMemberInheritedExecute
      OnUpdate = ActionViewMemberInheritedUpdate
    end
    object ActionViewScopePublished: TAction
      Tag = 4
      Category = 'Scope'
      AutoCheck = True
      Caption = 'Published'
      OnExecute = ActionViewScopeExecute
      OnUpdate = ActionViewScopeUpdate
    end
    object ActionViewScopePublic: TAction
      Tag = 3
      Category = 'Scope'
      AutoCheck = True
      Caption = 'Public'
      OnExecute = ActionViewScopeExecute
      OnUpdate = ActionViewScopeUpdate
    end
    object ActionViewScopeProtected: TAction
      Tag = 2
      Category = 'Scope'
      AutoCheck = True
      Caption = 'Protected'
      OnExecute = ActionViewScopeExecute
      OnUpdate = ActionViewScopeUpdate
    end
    object ActionViewScopePrivate: TAction
      Tag = 1
      Category = 'Scope'
      AutoCheck = True
      Caption = 'Private'
      OnExecute = ActionViewScopeExecute
      OnUpdate = ActionViewScopeUpdate
    end
  end
end
