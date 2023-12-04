object DwsIdeGotoLineNumber: TDwsIdeGotoLineNumber
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Go to Line Number'
  ClientHeight = 93
  ClientWidth = 270
  Color = clBtnFace
  ParentFont = True
  Position = poOwnerFormCenter
  OnClose = FormClose
  DesignSize = (
    270
    93)
  TextHeight = 15
  object ButtonCancel: TcxButton
    Left = 187
    Top = 60
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 0
  end
  object ButtonOK: TcxButton
    Left = 106
    Top = 60
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 270
    Height = 49
    Align = alTop
    BevelEdges = [beBottom]
    BevelKind = bkFlat
    BevelOuter = bvNone
    Color = clWindow
    FullRepaint = False
    ParentBackground = False
    ShowCaption = False
    TabOrder = 2
    object LabelLineNumber: TLabel
      Left = 12
      Top = 16
      Width = 122
      Height = 15
      Caption = 'Enter new line number:'
      FocusControl = ComboBoxLineNumber
    end
    object ComboBoxLineNumber: TcxComboBox
      Left = 162
      Top = 13
      Properties.Alignment.Horz = taRightJustify
      Properties.UseLeftAlignmentOnEditing = False
      TabOrder = 0
      Text = '1'
      OnKeyPress = ComboBoxLineNumberKeyPress
      Width = 100
    end
  end
end
