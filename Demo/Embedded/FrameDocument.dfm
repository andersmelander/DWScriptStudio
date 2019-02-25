object Frame1: TFrame1
  Left = 0
  Top = 0
  Width = 424
  Height = 334
  TabOrder = 0
  object PageControl: TcxPageControl
    Left = 0
    Top = 0
    Width = 424
    Height = 334
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = TabSheetDemo
    Properties.CustomButtons.Buttons = <>
    Properties.Style = 9
    Properties.TabPosition = tpBottom
    Properties.TabSlants.Kind = skCutCorner
    TabSlants.Kind = skCutCorner
    ExplicitLeft = -211
    ExplicitTop = 41
    ExplicitWidth = 635
    ExplicitHeight = 239
    ClientRectBottom = 314
    ClientRectRight = 424
    ClientRectTop = 0
    object TabSheetDemo: TcxTabSheet
      Caption = 'Unit1.pas'
      ImageIndex = 0
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 627
      ExplicitHeight = 211
      object MemoScript: TMemo
        Left = 0
        Top = 0
        Width = 424
        Height = 314
        Align = alClient
        Lines.Strings = (
          'ShowMessage('#39'Hello world'#39');')
        TabOrder = 0
        ExplicitHeight = 334
      end
    end
  end
end
