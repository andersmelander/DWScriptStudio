object FormScriptDebuggerSearch: TFormScriptDebuggerSearch
  Left = 132
  Top = 168
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Search Text'
  ClientHeight = 196
  ClientWidth = 422
  Color = clBtnFace
  ParentFont = True
  Position = poDesigned
  ScreenSnap = True
  TextHeight = 15
  object LabelSearchText: TcxLabel
    Left = 8
    Top = 12
    Caption = '&Search for:'
    FocusControl = EditSearchText
    Style.TransparentBorder = False
    Transparent = True
  end
  object EditSearchText: TcxMRUEdit
    Left = 96
    Top = 8
    Properties.MaxItemCount = 20
    Properties.ShowEllipsis = False
    TabOrder = 0
    Width = 226
  end
  object GroupBoxOptions: TcxGroupBox
    Left = 8
    Top = 40
    Caption = 'Options'
    Style.LookAndFeel.SkinName = ''
    StyleDisabled.LookAndFeel.SkinName = ''
    TabOrder = 1
    Transparent = True
    Height = 148
    Width = 154
    object CheckBoxOptionCaseSensitive: TcxCheckBox
      Left = 8
      Top = 17
      Caption = '&Case sensitive'
      Style.TransparentBorder = False
      TabOrder = 0
      Transparent = True
    end
    object CheckBoxOptionWholeWords: TcxCheckBox
      Left = 8
      Top = 40
      Caption = '&Whole words'
      Style.TransparentBorder = False
      TabOrder = 1
      Transparent = True
    end
    object CheckBoxOptionSelectedOnly: TcxCheckBox
      Left = 8
      Top = 63
      Caption = '&Limit to selection'
      Style.TransparentBorder = False
      TabOrder = 2
      Transparent = True
    end
    object CheckBoxOptionRegularExpression: TcxCheckBox
      Left = 8
      Top = 86
      Caption = '&Regular expression'
      Style.TransparentBorder = False
      TabOrder = 3
      Transparent = True
    end
    object CheckBoxOptionWrap: TcxCheckBox
      Left = 8
      Top = 109
      Caption = 'A&uto wrap-around'
      Style.TransparentBorder = False
      TabOrder = 4
      Transparent = True
    end
  end
  object RadioGroupDirection: TcxRadioGroup
    Left = 168
    Top = 119
    Caption = '&Direction'
    Properties.DefaultValue = False
    Properties.Items = <
      item
        Caption = '&Forward'
        Value = False
      end
      item
        Caption = 'B&ackward'
        Value = True
      end>
    ItemIndex = 0
    Style.LookAndFeel.SkinName = ''
    StyleDisabled.LookAndFeel.SkinName = ''
    TabOrder = 3
    Transparent = True
    Height = 69
    Width = 154
  end
  object ButtonOK: TcxButton
    Left = 338
    Top = 8
    Width = 75
    Height = 23
    Action = ActionOK
    Default = True
    ModalResult = 1
    TabOrder = 4
  end
  object ButtonCancel: TcxButton
    Left = 338
    Top = 44
    Width = 75
    Height = 23
    Action = ActionCancel
    Cancel = True
    ModalResult = 2
    TabOrder = 5
  end
  object RadioGroupScope: TcxRadioGroup
    Left = 168
    Top = 40
    Caption = 'S&tart from'
    Properties.DefaultValue = False
    Properties.Items = <
      item
        Caption = '&Cursor position'
        Value = False
      end
      item
        Caption = '&Beginning of file'
        Value = True
      end>
    ItemIndex = 0
    Style.LookAndFeel.SkinName = ''
    StyleDisabled.LookAndFeel.SkinName = ''
    TabOrder = 2
    Transparent = True
    Height = 69
    Width = 154
  end
  object ActionList1: TActionList
    Left = 356
    Top = 104
    object ActionOK: TAction
      Caption = 'OK'
      OnExecute = ActionOKExecute
      OnUpdate = ActionOKUpdate
    end
    object ActionCancel: TAction
      Caption = 'Cancel'
      OnExecute = ActionCancelExecute
    end
  end
end
