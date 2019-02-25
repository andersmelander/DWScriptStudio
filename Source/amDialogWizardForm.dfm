object CustomWizardForm: TCustomWizardForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 512
  ClientWidth = 624
  Color = clBtnFace
  Constraints.MinHeight = 550
  Constraints.MinWidth = 500
  DefaultMonitor = dmMainForm
  ParentFont = True
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inline FrameWizard: TFrameWizard
    Left = 0
    Top = 0
    Width = 624
    Height = 512
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 624
    ExplicitHeight = 512
    inherited Wizard: TdxWizardControl
      Width = 624
      Height = 512
      ExplicitWidth = 624
      ExplicitHeight = 512
    end
  end
  object ActionList1: TActionList
    Left = 508
    Top = 60
    object ActionMain: TAction
      OnExecute = ActionMainExecute
      OnUpdate = ActionMainUpdate
    end
  end
end
