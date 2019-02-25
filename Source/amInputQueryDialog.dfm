inherited FormInputQuery: TFormInputQuery
  ActiveControl = PanelMain
  AutoSize = True
  Caption = ''
  ClientHeight = 211
  ClientWidth = 464
  ExplicitWidth = 470
  ExplicitHeight = 239
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelButtons: TPanel
    Top = 166
    Width = 464
    Align = alTop
    ExplicitTop = 166
    ExplicitWidth = 464
    inherited ButtonCancel: TcxButton
      Left = 290
      ExplicitLeft = 290
    end
    inherited ButtonOK: TcxButton
      Left = 208
      ExplicitLeft = 208
    end
    inherited ButtonHelp: TcxButton
      Left = 378
      ExplicitLeft = 378
    end
  end
  inherited PanelMain: TPanel
    Width = 464
    Height = 112
    Align = alTop
    AutoSize = True
    ExplicitWidth = 464
    ExplicitHeight = 112
    object LayoutControl: TdxLayoutControl
      Left = 11
      Top = 11
      Width = 442
      Height = 93
      Align = alTop
      ParentBackground = True
      TabOrder = 0
      AutoSize = True
      LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
      OptionsItem.FocusControlOnItemCaptionClick = True
      object EditValue: TcxTextEdit
        Left = 0
        Top = 18
        Style.HotTrack = False
        TabOrder = 0
        Width = 442
      end
      object ComboBoxValue: TcxComboBox
        Left = 68
        Top = 45
        Style.HotTrack = False
        TabOrder = 1
        Width = 374
      end
      object LayoutControlGroup_Root: TdxLayoutGroup
        AlignHorz = ahClient
        AlignVert = avTop
        ButtonOptions.Buttons = <>
        Hidden = True
        ShowBorder = False
        Index = -1
      end
      object LayoutItemEdit: TdxLayoutItem
        Parent = LayoutControlGroup_Root
        CaptionOptions.Text = 'Lorem ipsum:'
        CaptionOptions.WordWrap = True
        CaptionOptions.Layout = clTop
        Control = EditValue
        ControlOptions.MinWidth = 200
        ControlOptions.OriginalHeight = 21
        ControlOptions.OriginalWidth = 230
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object LayoutItemCombo: TdxLayoutItem
        Parent = LayoutControlGroup_Root
        CaptionOptions.Text = 'Lorem ipsum:'
        CaptionOptions.WordWrap = True
        Visible = False
        Control = ComboBoxValue
        ControlOptions.OriginalHeight = 21
        ControlOptions.OriginalWidth = 121
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object LayoutEmptySpaceItem: TdxLayoutEmptySpaceItem
        Parent = LayoutControlGroup_Root
        SizeOptions.Height = 12
        SizeOptions.Width = 10
        Index = 2
      end
    end
  end
  inherited PanelHeader: TPanel
    Width = 464
    ExplicitWidth = 464
    inherited LabelHeader: TLabel
      Width = 440
    end
    inherited LabelSubHeader: TLabel
      Width = 440
    end
  end
  inherited PanelBottomSeparator: TPanel
    Top = 165
    Width = 464
    Align = alTop
    ExplicitTop = 165
    ExplicitWidth = 464
  end
  inherited PanelTopSeparator: TPanel
    Width = 464
    ExplicitWidth = 464
  end
  inherited ActionListDialog: TActionList
    Left = 132
    Top = 8
  end
  object LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 288
    Top = 8
    object dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel
      Offsets.RootItemsAreaOffsetHorz = 0
      Offsets.RootItemsAreaOffsetVert = 0
      PixelsPerInch = 96
    end
  end
end
