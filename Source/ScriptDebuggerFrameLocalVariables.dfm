object ScriptDebuggerLocalVariablesFrame: TScriptDebuggerLocalVariablesFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  TabOrder = 0
  object TreeListVariables: TcxTreeList
    Left = 0
    Top = 0
    Width = 451
    Height = 304
    BorderStyle = cxcbsNone
    Align = alClient
    Bands = <
      item
      end>
    Navigator.Buttons.CustomButtons = <>
    OptionsBehavior.CellHints = True
    OptionsCustomizing.ColumnCustomizing = False
    OptionsCustomizing.ColumnMoving = False
    OptionsCustomizing.ColumnVertSizing = False
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsSelection.CellSelect = False
    OptionsView.CellEndEllipsis = True
    OptionsView.ColumnAutoWidth = True
    OptionsView.DynamicIndent = True
    OptionsView.TreeLineStyle = tllsNone
    PopupMenu = dxBarPopupMenu1
    Styles.Background = StyleBackground
    TabOrder = 0
    OnDblClick = TreeListVariablesDblClick
    OnDeletion = TreeListVariablesDeletion
    OnExpanding = TreeListVariablesExpanding
    object cxTreeList1Column1: TcxTreeListColumn
      Caption.Text = 'Variable'
      DataBinding.ValueType = 'String'
      Width = 100
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxTreeList1Column2: TcxTreeListColumn
      Caption.Text = 'Value'
      DataBinding.ValueType = 'String'
      Width = 100
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object cxTreeList1Column3: TcxTreeListColumn
      Caption.Text = 'Type'
      DataBinding.ValueType = 'String'
      Width = 100
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 40
    Top = 28
    PixelsPerInch = 96
    object StyleBackground: TcxStyle
      AssignedValues = [svColor]
      Color = clWhite
    end
  end
  object dxBarPopupMenu1: TdxBarPopupMenu
    BarManager = dxBarManager1
    ItemLinks = <
      item
        Visible = True
        ItemName = 'MenuItemItemWatch'
      end
      item
        Visible = True
        ItemName = 'MenuItemItemModify'
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
    Left = 156
    Top = 72
    PixelsPerInch = 96
  end
  object dxBarManager1: TdxBarManager
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
    Left = 96
    Top = 128
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
    object MenuItemItemWatch: TdxBarButton
      Action = ActionItemWatch
      Category = 0
    end
    object MenuItemItemModify: TdxBarButton
      Action = ActionItemModify
      Category = 0
    end
  end
  object ActionList1: TActionList
    Left = 188
    Top = 132
    object ActionItemWatch: TAction
      Category = 'Action'
      Caption = 'Watch'
      Hint = 'Add a watch on the selected item'
      ShortCut = 16471
      OnExecute = ActionItemWatchExecute
      OnUpdate = ActionItemWatchUpdate
    end
    object ActionItemModify: TAction
      Category = 'Action'
      Caption = 'Evaluate / Modify...'
      Hint = 'Evaluate and/or Modify the value of the selected item'
      ShortCut = 16502
      OnExecute = ActionItemModifyExecute
      OnUpdate = ActionItemModifyUpdate
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
