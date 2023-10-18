object ScriptDebuggerFileSystemStructureFrame: TScriptDebuggerFileSystemStructureFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  TabOrder = 0
  object PopupEditFolder: TcxPopupEdit
    Left = 0
    Top = 0
    Align = alTop
    Properties.PopupControl = TreeListFileSystemStructure
    TabOrder = 2
    ExplicitTop = 25
    Width = 451
  end
  object ListViewFiles: TcxListView
    Left = 0
    Top = 23
    Width = 451
    Height = 281
    Align = alClient
    Columns = <
      item
        AutoSize = True
        Caption = 'Name'
      end>
    TabOrder = 1
    ViewStyle = vsReport
    OnDblClick = ListViewFilesDblClick
    ExplicitTop = 48
    ExplicitHeight = 256
  end
  object TreeListFileSystemStructure: TcxVirtualTreeList
    Left = 40
    Top = 43
    Width = 353
    Height = 186
    Bands = <
      item
      end>
    Navigator.Buttons.CustomButtons = <>
    OptionsBehavior.CopyCaptionsToClipboard = False
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsData.MultiThreadedSorting = bFalse
    OptionsData.SmartLoad = True
    OptionsSelection.CellSelect = False
    OptionsView.CellEndEllipsis = True
    OptionsView.ColumnAutoWidth = True
    OptionsView.Headers = False
    ScrollbarAnnotations.CustomAnnotations = <>
    TabOrder = 0
    Visible = False
    OnGetChildCount = TreeListFileSystemStructureGetChildCount
    OnGetNodeImageIndex = TreeListFileSystemStructureGetNodeImageIndex
    OnGetNodeValue = TreeListFileSystemStructureGetNodeValue
    OnSelectionChanged = TreeListFileSystemStructureSelectionChanged
    object TreeListFileSystemStructureColumnName: TcxTreeListColumn
      Caption.Text = 'Name'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
  end
end
