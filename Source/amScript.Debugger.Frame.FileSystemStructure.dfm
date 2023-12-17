object ScriptDebuggerFileSystemStructureFrame: TScriptDebuggerFileSystemStructureFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  TabOrder = 0
  object TreeListFileSystemStructure: TcxVirtualTreeList
    Left = 0
    Top = 0
    Width = 451
    Height = 304
    Align = alClient
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
    OnDblClick = TreeListFileSystemStructureDblClick
    OnGetChildCount = TreeListFileSystemStructureGetChildCount
    OnGetNodeImageIndex = TreeListFileSystemStructureGetNodeImageIndex
    OnGetNodeValue = TreeListFileSystemStructureGetNodeValue
    OnSelectionChanged = TreeListFileSystemStructureSelectionChanged
    ExplicitLeft = 40
    ExplicitTop = 43
    ExplicitWidth = 353
    ExplicitHeight = 186
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
