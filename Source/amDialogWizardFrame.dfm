object FrameWizard: TFrameWizard
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  TabOrder = 0
  object Wizard: TdxWizardControl
    Left = 0
    Top = 0
    Width = 451
    Height = 304
    Buttons.CustomButtons.Buttons = <>
    Header.AssignedValues = [wchvDescriptionOffset]
    Header.DescriptionOffset = 0
    OptionsViewStyleAero.EnableTitleAero = False
    OptionsViewStyleAero.Title.Font.Charset = DEFAULT_CHARSET
    OptionsViewStyleAero.Title.Font.Color = clDefault
    OptionsViewStyleAero.Title.Font.Height = -13
    OptionsViewStyleAero.Title.Font.Name = 'Segoe UI'
    OptionsViewStyleAero.Title.Font.Style = [fsBold]
    OptionsViewStyleAero.Title.Text = '%brandname%'
    ViewStyle = wcvsAero
    OnButtonClick = WizardButtonClick
    OnPageChanged = WizardPageChanged
    OnPageChanging = WizardPageChanging
  end
end
