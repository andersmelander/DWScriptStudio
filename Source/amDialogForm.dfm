object CustomDialogForm: TCustomDialogForm
  Left = 0
  Top = 0
  ActiveControl = ButtonOK
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Caption'
  ClientHeight = 371
  ClientWidth = 458
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  DoubleBuffered = True
  ParentFont = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object PanelButtons: TPanel
    AlignWithMargins = True
    Left = 0
    Top = 326
    Width = 458
    Height = 45
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alBottom
    BevelOuter = bvNone
    Color = 15790320
    FullRepaint = False
    Padding.Left = 11
    Padding.Top = 11
    Padding.Right = 11
    Padding.Bottom = 11
    ParentBackground = False
    ShowCaption = False
    TabOrder = 1
    DesignSize = (
      458
      45)
    object ButtonCancel: TcxButton
      Left = 284
      Top = 11
      Width = 75
      Height = 23
      Action = ActionCancel
      Anchors = [akTop, akRight]
      Cancel = True
      ModalResult = 2
      TabOrder = 1
    end
    object ButtonOK: TcxButton
      Left = 203
      Top = 11
      Width = 75
      Height = 23
      Action = ActionOK
      Anchors = [akTop, akRight]
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object ButtonHelp: TcxButton
      Left = 371
      Top = 11
      Width = 75
      Height = 23
      Action = ActionHelp
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
  end
  object PanelMain: TPanel
    AlignWithMargins = True
    Left = 0
    Top = 53
    Width = 458
    Height = 272
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    BevelEdges = [beBottom]
    BevelOuter = bvNone
    Color = clWhite
    FullRepaint = False
    Padding.Left = 11
    Padding.Top = 11
    Padding.Right = 11
    Padding.Bottom = 8
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
  end
  object PanelHeader: TPanel
    AlignWithMargins = True
    Left = 0
    Top = 0
    Width = 458
    Height = 52
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    Color = clWindow
    FullRepaint = False
    Padding.Left = 12
    Padding.Top = 8
    Padding.Right = 12
    Padding.Bottom = 8
    ParentBackground = False
    TabOrder = 2
    object LabelHeader: TLabel
      AlignWithMargins = True
      Left = 12
      Top = 8
      Width = 3
      Height = 13
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Align = alTop
      ShowAccelChar = False
      WordWrap = True
    end
    object LabelSubHeader: TLabel
      AlignWithMargins = True
      Left = 12
      Top = 28
      Width = 3
      Height = 13
      Margins.Left = 0
      Margins.Top = 4
      Margins.Right = 0
      Align = alTop
      ShowAccelChar = False
      WordWrap = True
    end
  end
  object PanelBottomSeparator: TPanel
    Left = 0
    Top = 325
    Width = 458
    Height = 1
    Align = alBottom
    BevelOuter = bvNone
    Color = 14671839
    FullRepaint = False
    ParentBackground = False
    TabOrder = 3
  end
  object PanelTopSeparator: TPanel
    Left = 0
    Top = 52
    Width = 458
    Height = 1
    Align = alTop
    BevelOuter = bvNone
    Color = 14737632
    FullRepaint = False
    ParentBackground = False
    TabOrder = 4
    Visible = False
  end
  object ActionListDialog: TActionList
    Left = 88
    Top = 324
    object ActionOK: TAction
      Category = 'Buttons'
      Caption = 'OK'
      OnExecute = ActionOKExecute
    end
    object ActionCancel: TAction
      Category = 'Buttons'
      Caption = 'Cancel'
      OnExecute = ActionCancelExecute
    end
    object ActionHelp: TAction
      Category = 'Buttons'
      Caption = 'Help'
      ShortCut = 112
      OnExecute = ActionHelpExecute
      OnUpdate = ActionHelpUpdate
    end
  end
end
