object ScriptDebuggerASTFrame: TScriptDebuggerASTFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  TabOrder = 0
  object TreeListAST: TcxTreeList
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
    OptionsBehavior.ImmediateEditor = False
    OptionsBehavior.ExpandOnDblClick = False
    OptionsBehavior.Sorting = False
    OptionsCustomizing.ColumnCustomizing = False
    OptionsCustomizing.ColumnMoving = False
    OptionsCustomizing.ColumnVertSizing = False
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsSelection.CellSelect = False
    OptionsView.CellEndEllipsis = True
    OptionsView.ColumnAutoWidth = True
    OptionsView.DynamicIndent = True
    OptionsView.Indicator = True
    OptionsView.TreeLineStyle = tllsNone
    ScrollbarAnnotations.CustomAnnotations = <>
    Styles.Background = StyleBackground
    TabOrder = 0
    OnDblClick = TreeListASTDblClick
    object cxTreeList1Column1: TcxTreeListColumn
      Caption.Text = 'Expression class'
      Width = 150
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object TreeListASTColumn1: TcxTreeListColumn
      Caption.Text = 'Value'
      Position.ColIndex = 1
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
end
