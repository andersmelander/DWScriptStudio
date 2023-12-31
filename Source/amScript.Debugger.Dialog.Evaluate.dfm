object FormDebugEvaluate: TFormDebugEvaluate
  Left = 0
  Top = 0
  ActiveControl = EditExpression
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = 'Evaluate / Modify'
  ClientHeight = 166
  ClientWidth = 398
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  PopupMode = pmAuto
  Position = poOwnerFormCenter
  OnKeyPress = FormKeyPress
  TextHeight = 13
  object LayoutControl: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 398
    Height = 166
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = DataModuleDebuggerViewData.LayoutLookAndFeel
    ExplicitTop = 51
    ExplicitHeight = 115
    object EditExpression: TcxTextEdit
      Left = 71
      Top = 69
      Properties.OnChange = EditExpressionPropertiesChange
      Style.HotTrack = False
      TabOrder = 3
      OnKeyDown = EditExpressionKeyDown
      Width = 317
    end
    object MemoValue: TcxMemo
      Left = 71
      Top = 96
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 4
      Height = 33
      Width = 317
    end
    object EditNewValue: TcxTextEdit
      Left = 71
      Top = 135
      Enabled = False
      Style.HotTrack = False
      TabOrder = 5
      OnKeyDown = EditNewValueKeyDown
      Width = 317
    end
    object cxButton1: TcxButton
      Left = 10
      Top = 10
      Width = 75
      Height = 41
      Action = ActionEvaluate
      LookAndFeel.NativeStyle = False
      OptionsImage.Layout = blGlyphTop
      TabOrder = 0
    end
    object cxButton2: TcxButton
      Left = 91
      Top = 10
      Width = 75
      Height = 41
      Action = ActionModify
      LookAndFeel.NativeStyle = False
      OptionsImage.Layout = blGlyphTop
      TabOrder = 1
    end
    object cxButton3: TcxButton
      Left = 172
      Top = 10
      Width = 75
      Height = 41
      Align = alLeft
      Action = ActionWatch
      LookAndFeel.NativeStyle = False
      OptionsImage.Layout = blGlyphTop
      TabOrder = 2
    end
    object LayoutControlGroup_Root: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avClient
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object LayoutItemExpression: TdxLayoutItem
      Parent = LayoutControlGroup_Root
      CaptionOptions.Text = '&Expression:'
      Control = EditExpression
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object LayoutItemResult: TdxLayoutItem
      Parent = LayoutControlGroup_Root
      AlignVert = avClient
      CaptionOptions.AlignVert = tavTop
      CaptionOptions.Text = '&Result:'
      Control = MemoValue
      ControlOptions.OriginalHeight = 89
      ControlOptions.OriginalWidth = 185
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object LayoutItemNewValue: TdxLayoutItem
      Parent = LayoutControlGroup_Root
      CaptionOptions.Text = '&New value:'
      Control = EditNewValue
      ControlOptions.AlignVert = avBottom
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Enabled = False
      Index = 4
    end
    object LayoutItemEvaluate: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.OriginalHeight = 41
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object LayoutItemModify: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Visible = False
      Control = cxButton2
      ControlOptions.OriginalHeight = 41
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object LayoutItemWatch: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Visible = False
      Control = cxButton3
      ControlOptions.OriginalHeight = 41
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = LayoutControlGroup_Root
      CaptionOptions.Text = 'New Group'
      Hidden = True
      ItemIndex = 2
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutSeparatorItem1: TdxLayoutSeparatorItem
      Parent = LayoutControlGroup_Root
      CaptionOptions.Text = 'Separator'
      Index = 1
    end
  end
  object ActionList1: TActionList
    Images = cxImageList1
    Left = 200
    Top = 60
    object ActionEvaluate: TAction
      Caption = 'E&valuate'
      ImageIndex = 0
      OnExecute = ActionEvaluateExecute
      OnUpdate = ActionEvaluateUpdate
    end
    object ActionModify: TAction
      Caption = '&Modify'
      ImageIndex = 1
      OnExecute = ActionModifyExecute
      OnUpdate = ActionModifyUpdate
    end
    object ActionWatch: TAction
      Caption = '&Watch'
      ImageIndex = 2
      OnExecute = ActionWatchExecute
      OnUpdate = ActionWatchUpdate
    end
  end
  object cxImageList1: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 7602380
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000130000
          002D040404720606068706060687060606870606068706060687060606870606
          06870606068706060687040404720000002E00000013000000000000000A0000
          00170C0C0C82C9C9C9FFCDCDCDFFC5C5C5FFCDCDCDFFC5C5C5FFCDCDCDFFC5C5
          C5FFCDCDCDFFC9C9C9FF0C0C0C82000000170000000A00000000000000000000
          00001212127BC7C7C7FF8A8A8AFFBEBEBEFF8A8A8AFFBEBEBEFF8A8A8AFFBEBE
          BEFF8A8A8AFFC7C7C7FF1212127B000000000000000000000000000000000000
          000016161677C9C9C9FFC9C9C9FFC0C0C0FFC9C9C9FFC0C0C0FFC9C9C9FFC0C0
          C0FF8C8C8CFFC9C9C9FF16161677000000000000000000000000000000000000
          000018181876CCCCCCFF8F8F8FFFC3C3C3FF8F8F8FFFC3C3C3FF8F8F8FFFC3C3
          C3FF8F8F8FFFCCCCCCFF18181876000000000000000000000000000000000000
          000019191974CFCFCFFFCECECEFFC6C6C6FFCECECEFFC6C6C6FFCECECEFFC6C6
          C6FFCECECEFFCFCFCFFF19191974000000000000000000000000000000000000
          00001A1A1A72D1D1D1FF949494FFC8C8C8FF949494FFC8C8C8FF949494FFC8C8
          C8FF949494FFD1D1D1FF1A1A1A72000000000000000000000000000000000000
          00001B1B1B71D4D4D4FFD4D4D4FFCBCBCBFFD4D4D4FFCBCBCBFFD4D4D4FFCBCB
          CBFFD4D4D4FFD4D4D4FF1B1B1B71000000000000000000000000000000000000
          00001D1D1D6FD8D8D8FF999999FFCFCFCFFF999999FFCFCFCFFF999999FFCFCF
          CFFF999999FFD8D8D8FF1D1D1D6F000000000000000000000000000000000000
          00001D1D1D6DDBDBDBFFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2
          D2FFD2D2D2FFDBDBDBFF1D1D1D6D000000000000000000000000000000000000
          00000202028F727272FF727272FF727272FF727272FF727272FF727272FF7272
          72FF727272FF727272FF0202028F000000000000000000000000000000000000
          000002020298AADDAAFFA7DAA7FFA3D6A3FF9FD29FFF9ACD9AFF96C996FF91C4
          91FF699C69FF8ABD8AFF02020298000000000000000000000000000000000000
          0000010101A291C491FF8FC28FFF8DC08DFF8BBE8BFF89BC89FF87BA87FF84B7
          84FF5E915EFF81B481FF010101A2000000000000000000000000000000000000
          0000010101AA575757FF575757FF575757FF575757FF575757FF575757FF5757
          57FF575757FF575757FF010101AA000000000000000000000000000000000000
          000022222267EAEAEAFFE5E5E5FFE5E5E5FFE5E5E5FFE5E5E5FFE5E5E5FFE5E5
          E5FFE5E5E5FFEAEAEAFF22222267000000000000000000000000000000000000
          00001A1A1A4D2222226622222266222222662222226622222266222222662222
          226622222266222222661A1A1A4D000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000130000
          002D0404047206060687060606870606068706060687000000FF033748D80516
          1BA40606068706060687040404720000002E00000013000000000000000A0000
          00170C0C0C82C9C9C9FFCDCDCDFFC5C5C5FFCDCDCDFF6399ABFFD9F4FFFF3390
          A1FF98B6BCFFC9C9C9FF0C0C0C82000000170000000A00000000000000000000
          00001212127BC7C7C7FF8A8A8AFFBEBEBEFF8A8A8AFFA2B4BAFF2993A5FF79E6
          F7FF248192FF93B3B9FF1212127B000000000000000000000000000000000000
          000016161677C9C9C9FFC9C9C9FFC0C0C0FFC9C9C9FFC0C0C0FF9AC0C7FF39A4
          B5FF79E6F7FF3491A2FF132C319C000000000000000000000000000000000000
          000018181876CCCCCCFF8F8F8FFFC3C3C3FF8F8F8FFFC3C3C3FF8F8F8FFF94BA
          C1FF2B95A6FF79E6F7FF076474DC021114410000000000000000000000000000
          000019191974CFCFCFFFCECECEFFC6C6C6FFCECECEFFC6C6C6FFCECECEFFC6C6
          C6FF9EC5CBFF3DA7B9FF79E6F7FF1111117D0303032E00000000000000000000
          00001A1A1A72D1D1D1FF949494FFC8C8C8FF949494FFC8C8C8FF949494FFC8C8
          C8FF949494FF9DC4CAFF2E2E2EADF7F7F7FF0E0E278E00002C46000000000000
          00001B1B1B71D4D4D4FFD4D4D4FFCBCBCBFFD4D4D4FFCBCBCBFFD4D4D4FFCBCB
          CBFFD4D4D4FFD4D4D4FF232323851B1B367C8080FFFF010186C1000000000000
          00001D1D1D6FD8D8D8FF999999FFCFCFCFFF999999FFCFCFCFFF999999FFCFCF
          CFFF999999FFD8D8D8FF1D1D1D6F0A0A2339010198AF00003240000000000000
          00001D1D1D6DDBDBDBFFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2
          D2FFD2D2D2FFDBDBDBFF1D1D1D6D000000000000000000000000000000000000
          00000202028F727272FF727272FF727272FF727272FF727272FF727272FF7272
          72FF727272FF727272FF0202028F000000000000000000000000000000000000
          000002020298AADDAAFFA7DAA7FFA3D6A3FF9FD29FFF9ACD9AFF96C996FF91C4
          91FF699C69FF8ABD8AFF02020298000000000000000000000000000000000000
          0000010101A291C491FF8FC28FFF8DC08DFF8BBE8BFF89BC89FF87BA87FF84B7
          84FF5E915EFF81B481FF010101A2000000000000000000000000000000000000
          0000010101AA575757FF575757FF575757FF575757FF575757FF575757FF5757
          57FF575757FF575757FF010101AA000000000000000000000000000000000000
          000022222267EAEAEAFFE5E5E5FFE5E5E5FFE5E5E5FFE5E5E5FFE5E5E5FFE5E5
          E5FFE5E5E5FFEAEAEAFF22222267000000000000000000000000000000000000
          00001A1A1A4D2222226622222266222222662222226622222266222222662222
          226622222266222222661A1A1A4D000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000033000000330000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000334C80A9FF4B80AAFF0000003300000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000334B7FA8FF21A0FAFF31B8FFFF4792C6FF00000000000000000000
          00000000000300000022000000330000003300000033000000330000001F0000
          00334380B0FF1E9FFAFF2FB3FFFFCAF6FFFF4393C9FF00000000000000000000
          00060606063D4E4D4DBA737270FF727170FF727170FF737270FF484746B08078
          74FF75A1C0FF27B3FFFFC7F5FFFF3F8EC4FF0000000000000000000000030F0E
          0E4B767574FFAEAFAFFFDFE2E5FFE5E9EDFFE5E9EDFFDFE2E5FFAEAEAFFF7774
          71FFB2A9A4FFECF9FCFF3A8FC7FF0000000000000000000000000706062D8482
          80FFE2E3E3FFFAE8D0FFFFCF88FFFFCE7CFFFFCC7CFFFFCF87FFFBE8CFFFDFDF
          DFFF7C7875FFA1968FFF00000000000000000000000000000000545251BABEBE
          BDFF000000FF47321AFFFFD285FF000000FF453F2BFFFFF4A3FF000000FF413F
          3EFFBABAB9FF4D4A48B0000000000000000000000000000000007C7B79FFF4F6
          F9FFFFCB84FF000000FFFFE4A3FFFFEFA1FF000000FFFFFFC7FF000000FFFDC8
          81FFF2F4F7FF7C7A78FF000000000000000000000000000000007D7B7AFFFEFF
          FFFFECB266FF000000FFFFEEBDFFFFF0AEFF534B34FF000000FF544A31FFE9B0
          64FFFDFFFFFF7C7B7AFF000000000000000000000000000000007F7D7CFFFFFF
          FFFFE3AB5FFF000000FFFFFFDAFFFFF8C4FF000000FFFFFEADFF000000FFDFA7
          5DFFFFFFFFFF7F7D7CFF0000000000000000000000000000000083807EFFFFFF
          FFFF000000FF000000FF000000FF4C463AFF000000FFFFE8A6FF41331CFF0000
          00FFFFFFFFFF83807EFF00000000000000000000000000000000595756AACBCA
          CAFFFFF3DCFF000000FFFFFFF1FFFFFFE8FFFFEDC9FFEDCB9AFFB98744FFF6E8
          D5FFC8C8C9FF595756AA000000000000000000000000000000000707070D8684
          83FFFFFFFFFF505152FF000000FFAE7D39FFA77736FFB28A52FFEDE1D2FFF6F8
          FAFF858381FF0707070D00000000000000000000000000000000000000001010
          101E94928FFFD4D4D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBCBCDFF8684
          82FF1010101E0000000000000000000000000000000000000000000000000000
          00000707070D5D5C59A98A8885FF898785FF888784FF888784FF5C5B59A90707
          070D000000000000000000000000000000000000000000000000}
      end>
  end
end
