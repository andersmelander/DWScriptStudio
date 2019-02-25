object CustomProgressForm: TCustomProgressForm
  Left = 403
  Top = 356
  AutoSize = True
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Loading'
  ClientHeight = 120
  ClientWidth = 423
  Color = clWindow
  ParentFont = True
  OldCreateOrder = True
  PopupMode = pmAuto
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelAbort: TPanel
    Left = 0
    Top = 77
    Width = 423
    Height = 43
    Align = alTop
    BevelEdges = [beTop]
    BevelKind = bkFlat
    BevelOuter = bvNone
    FullRepaint = False
    Padding.Left = 8
    Padding.Top = 8
    Padding.Right = 8
    Padding.Bottom = 8
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    Visible = False
    DesignSize = (
      423
      41)
    object ButtonAbort: TButton
      Left = 338
      Top = 8
      Width = 75
      Height = 25
      Cursor = crAppStart
      Anchors = [akTop, akRight]
      Caption = 'Abort'
      TabOrder = 0
      OnClick = ButtonAbortClick
    end
  end
  object PanelProgress: TPanel
    Left = 0
    Top = 0
    Width = 423
    Height = 77
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    FullRepaint = False
    Padding.Left = 12
    Padding.Top = 12
    Padding.Right = 12
    Padding.Bottom = 12
    ParentBackground = False
    ParentColor = True
    ShowCaption = False
    TabOrder = 1
    object LabelMessage: TcxLabel
      Left = 12
      Top = 12
      Align = alTop
      Caption = 'Please wait...'
      Style.TextColor = 10040064
      Style.TransparentBorder = False
      Properties.ShowAccelChar = False
      Properties.WordWrap = True
      Transparent = True
      Width = 399
    end
    object ProgressBar: TProgressBar
      AlignWithMargins = True
      Left = 12
      Top = 37
      Width = 399
      Height = 16
      Margins.Left = 0
      Margins.Top = 12
      Margins.Right = 0
      Margins.Bottom = 12
      Align = alTop
      Smooth = True
      TabOrder = 0
    end
  end
  object TimerDefer: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerDeferTimer
    Left = 96
    Top = 84
  end
end
