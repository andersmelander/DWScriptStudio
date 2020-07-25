object DataModuleScriptUserInterfaceLayout: TDataModuleScriptUserInterfaceLayout
  OldCreateOrder = False
  Height = 392
  Width = 585
  object dwsUnitLayout: TdwsUnit
    Classes = <
      item
        Name = 'TLayout'
        Ancestor = 'TControl'
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'AOwner'
                DataType = 'TComponent'
              end>
            OnEval = dwsUnitLayoutClassesTLayoutConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'GetItems'
            ResultType = 'TLayoutGroup'
            OnEval = dwsUnitLayoutClassesTLayoutMethodsGetItemsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetCustomization'
            ResultType = 'boolean'
            OnEval = dwsUnitLayoutClassesTLayoutMethodsGetCustomizationEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetCustomization'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTLayoutMethodsSetCustomizationEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetStyle'
            ResultType = 'TLayoutStyle'
            OnEval = dwsUnitLayoutClassesTLayoutMethodsGetStyleEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetStyle'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TLayoutStyle'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTLayoutMethodsSetStyleEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'DefaultStyle'
            ResultType = 'TLayoutStyle'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitLayoutClassesTLayoutMethodsDefaultStyleEval
            Kind = mkClassFunction
          end
          item
            Name = 'Clear'
            OnEval = dwsUnitLayoutClassesTLayoutMethodsClearEval
            Kind = mkProcedure
          end
          item
            Name = 'BeginUpdate'
            OnEval = dwsUnitLayoutClassesTLayoutMethodsBeginUpdateEval
            Kind = mkProcedure
          end
          item
            Name = 'EndUpdate'
            OnEval = dwsUnitLayoutClassesTLayoutMethodsEndUpdateEval
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Items'
            DataType = 'TLayoutGroup'
            ReadAccess = 'GetItems'
          end
          item
            Name = 'Customization'
            DataType = 'boolean'
            ReadAccess = 'GetCustomization'
            WriteAccess = 'SetCustomization'
          end
          item
            Name = 'AutoSize'
            DataType = 'boolean'
          end
          item
            Name = 'Style'
            DataType = 'TLayoutStyle'
            ReadAccess = 'GetStyle'
            WriteAccess = 'SetStyle'
          end
          item
            Name = 'ParentBackground'
            DataType = 'boolean'
          end>
        OnCleanUp = dwsUnitLayoutClassesTLayoutCleanUp
      end
      item
        Name = 'TCustomLayoutItem'
        IsAbstract = True
        IsInternal = True
        Fields = <
          item
            Name = 'FSize'
            DataType = 'TLayoutItemSize'
            Visibility = cvPrivate
          end>
        Methods = <
          item
            Name = 'GetAlignHorz'
            ResultType = 'TLayoutAlignHorz'
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsGetAlignHorzEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetAlignHorz'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TLayoutAlignHorz'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsSetAlignHorzEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetAlignVert'
            ResultType = 'TLayoutAlignVert'
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsGetAlignVertEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetAlignVert'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TLayoutAlignVert'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsSetAlignVertEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetEnabled'
            ResultType = 'boolean'
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsGetEnabledEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetEnabled'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsSetEnabledEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetParent'
            ResultType = 'TLayoutGroup'
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsGetParentEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetParent'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TLayoutGroup'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsSetParentEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetVisible'
            ResultType = 'boolean'
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsGetVisibleEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetVisible'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsSetVisibleEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetCaption'
            ResultType = 'TCustomLayoutItemCaption'
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsGetCaptionEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetHeight'
            ResultType = 'integer'
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsGetHeightEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetHeight'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'integer'
              end>
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsSetHeightEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetWidth'
            ResultType = 'integer'
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsGetWidthEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetWidth'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'integer'
              end>
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsSetWidthEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetStyle'
            ResultType = 'TLayoutStyle'
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsGetStyleEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetStyle'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TLayoutStyle'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsSetStyleEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetOffsets'
            ResultType = 'TLayoutOffsets'
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsGetOffsetsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetPadding'
            ResultType = 'TLayoutPadding'
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsGetPaddingEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'BeginUpdate'
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsBeginUpdateEval
            Kind = mkProcedure
          end
          item
            Name = 'EndUpdate'
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsEndUpdateEval
            Kind = mkProcedure
          end
          item
            Name = 'MakeVisible'
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsMakeVisibleEval
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'AlignHorz'
            DataType = 'TLayoutAlignHorz'
            ReadAccess = 'GetAlignHorz'
            WriteAccess = 'SetAlignHorz'
          end
          item
            Name = 'AlignVert'
            DataType = 'TLayoutAlignVert'
            ReadAccess = 'GetAlignVert'
            WriteAccess = 'SetAlignVert'
          end
          item
            Name = 'Caption'
            DataType = 'TCustomLayoutItemCaption'
            ReadAccess = 'GetCaption'
          end
          item
            Name = 'Enabled'
            DataType = 'boolean'
            ReadAccess = 'GetEnabled'
            WriteAccess = 'SetEnabled'
          end
          item
            Name = 'Offsets'
            DataType = 'TLayoutOffsets'
            ReadAccess = 'GetOffsets'
          end
          item
            Name = 'Padding'
            DataType = 'TLayoutPadding'
            Visibility = cvProtected
            ReadAccess = 'GetPadding'
          end
          item
            Name = 'Parent'
            DataType = 'TLayoutGroup'
            ReadAccess = 'GetParent'
            WriteAccess = 'SetParent'
          end
          item
            Name = 'Visible'
            DataType = 'boolean'
            ReadAccess = 'GetVisible'
            WriteAccess = 'SetVisible'
          end
          item
            Name = 'Height'
            DataType = 'integer'
            ReadAccess = 'GetHeight'
            WriteAccess = 'SetHeight'
          end
          item
            Name = 'Width'
            DataType = 'integer'
            ReadAccess = 'GetWidth'
            WriteAccess = 'SetWidth'
          end
          item
            Name = 'Style'
            DataType = 'TLayoutStyle'
            ReadAccess = 'GetStyle'
            WriteAccess = 'SetStyle'
          end>
      end
      item
        Name = 'TLayoutGroup'
        Ancestor = 'TCustomLayoutItem'
        IsSealed = True
        IsInternal = True
        Methods = <
          item
            Name = 'GetExpanded'
            ResultType = 'boolean'
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsGetExpandedEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetExpanded'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsSetExpandedEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetHidden'
            ResultType = 'boolean'
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsGetHiddenEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetHidden'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsSetHiddenEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetLayoutDirection'
            ResultType = 'TLayoutDirection'
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsGetLayoutDirectionEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetLayoutDirection'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TLayoutDirection'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsSetLayoutDirectionEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetShowBorder'
            ResultType = 'boolean'
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsGetShowBorderEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetShowBorder'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsSetShowBorderEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetIndent'
            ResultType = 'boolean'
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsGetIndentEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetIndent'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsSetIndentEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetItems'
            ResultType = 'TLayoutItemList'
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsGetItemsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'CreateGroup'
            ResultType = 'TLayoutGroup'
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsCreateGroupEval
            Kind = mkFunction
          end
          item
            Name = 'CreateItem'
            Parameters = <
              item
                Name = 'AControl'
                DataType = 'TControl'
              end>
            ResultType = 'TLayoutControlItem'
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsCreateItemEval
            Kind = mkFunction
          end
          item
            Name = 'CreateEmptySpaceItem'
            ResultType = 'TLayoutEmptySpaceItem'
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsCreateEmptySpaceItemEval
            Kind = mkFunction
          end
          item
            Name = 'CreateLabelItem'
            ResultType = 'TLayoutLabelItem'
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsCreateLabelItemEval
            Kind = mkFunction
          end
          item
            Name = 'CreateSeparatorItem'
            ResultType = 'TLayoutSeparatorItem'
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsCreateSeparatorItemEval
            Kind = mkFunction
          end
          item
            Name = 'CreateSplitterItem'
            ResultType = 'TLayoutSplitterItem'
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsCreateSplitterItemEval
            Kind = mkFunction
          end
          item
            Name = 'GetScrollOptions'
            ResultType = 'TLayoutGroupScrollOptions'
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsGetScrollOptionsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetAllowWrapItems'
            ResultType = 'Boolean'
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsGetAllowWrapItemsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetAllowWrapItems'
            Parameters = <
              item
                Name = 'value'
                DataType = 'Boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsSetAllowWrapItemsEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetCaption'
            ResultType = 'TLayoutGroupCaption'
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsGetCaptionEval
            Visibility = cvProtected
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Expanded'
            DataType = 'boolean'
            ReadAccess = 'GetExpanded'
            WriteAccess = 'SetExpanded'
          end
          item
            Name = 'Hidden'
            DataType = 'boolean'
            ReadAccess = 'GetHidden'
            WriteAccess = 'SetHidden'
          end
          item
            Name = 'LayoutDirection'
            DataType = 'TLayoutDirection'
            ReadAccess = 'GetLayoutDirection'
            WriteAccess = 'SetLayoutDirection'
          end
          item
            Name = 'ShowBorder'
            DataType = 'boolean'
            ReadAccess = 'GetShowBorder'
            WriteAccess = 'SetShowBorder'
          end
          item
            Name = 'Indent'
            DataType = 'boolean'
            ReadAccess = 'GetIndent'
            WriteAccess = 'SetIndent'
          end
          item
            Name = 'Items'
            DataType = 'TLayoutItemList'
            ReadAccess = 'GetItems'
          end
          item
            Name = 'Padding'
            DataType = 'TLayoutPadding'
          end
          item
            Name = 'ScrollOptions'
            DataType = 'TLayoutGroupScrollOptions'
            ReadAccess = 'GetScrollOptions'
          end
          item
            Name = 'AllowWrapItems'
            DataType = 'Boolean'
            ReadAccess = 'GetAllowWrapItems'
            WriteAccess = 'SetAllowWrapItems'
          end
          item
            Name = 'Caption'
            DataType = 'TLayoutGroupCaption'
            ReadAccess = 'GetCaption'
          end>
        OnCleanUp = dwsUnitLayoutClassesTLayoutCleanUp
      end
      item
        Name = 'TLayoutOffsets'
        IsAbstract = True
        IsInternal = True
        Methods = <
          item
            Name = 'GetValue'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'Integer'
            OnEval = dwsUnitLayoutClassesTLayoutOffsetsMethodsGetValueEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetValue'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end
              item
                Name = 'value'
                DataType = 'Integer'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTLayoutOffsetsMethodsSetValueEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Bottom'
            DataType = 'Integer'
            ReadAccess = 'GetValue'
            WriteAccess = 'SetValue'
            IndexType = 'Integer'
            IndexValue = 1
          end
          item
            Name = 'Left'
            DataType = 'Integer'
            ReadAccess = 'GetValue'
            WriteAccess = 'SetValue'
            IndexType = 'Integer'
            IndexValue = 2
          end
          item
            Name = 'Right'
            DataType = 'Integer'
            ReadAccess = 'GetValue'
            WriteAccess = 'SetValue'
            IndexType = 'Integer'
            IndexValue = 3
          end
          item
            Name = 'Top'
            DataType = 'Integer'
            ReadAccess = 'GetValue'
            WriteAccess = 'SetValue'
            IndexType = 'Integer'
            IndexValue = 4
          end>
      end
      item
        Name = 'TControlMargin'
        Ancestor = 'TLayoutOffsets'
        IsSealed = True
        IsInternal = True
        Deprecated = 'I have forgotten what this was supposed to be used for'
      end
      item
        Name = 'TLayoutPadding'
        Ancestor = 'TLayoutOffsets'
        IsSealed = True
        IsInternal = True
      end
      item
        Name = 'TLayoutItemSize'
        IsSealed = True
        IsInternal = True
      end
      item
        Name = 'TCustomLayoutItemCaption'
        IsAbstract = True
        IsInternal = True
        Methods = <
          item
            Name = 'GetText'
            ResultType = 'string'
            OnEval = dwsUnitLayoutClassesTLayoutItemCaptionMethodsGetTextEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetText'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTLayoutItemCaptionMethodsSetTextEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetVisible'
            ResultType = 'boolean'
            OnEval = dwsUnitLayoutClassesTLayoutItemCaptionMethodsGetVisibleEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetVisible'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTLayoutItemCaptionMethodsSetVisibleEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetShowAccelChar'
            ResultType = 'boolean'
            OnEval = dwsUnitLayoutClassesTLayoutItemCaptionMethodsGetShowAccelCharEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetShowAccelChar'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTLayoutItemCaptionMethodsSetShowAccelCharEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetAlignVert'
            ResultType = 'TAlignmentVert'
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsGetAlignVertEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetAlignVert'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TAlignmentVert'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsSetAlignVertEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetAlignHorz'
            ResultType = 'TAlignment'
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsGetAlignHorzEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetAlignHorz'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TAlignment'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsSetAlignHorzEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetPosition'
            ResultType = 'TLayoutCaptionPosition'
            OnEval = dwsUnitLayoutClassesTLayoutItemCaptionMethodsGetPositionEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetPosition'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TLayoutCaptionPosition'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTLayoutItemCaptionMethodsSetPositionEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetGlyph'
            ResultType = 'TSmartImage'
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsGetGlyphEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetVisibleElements'
            ResultType = 'TLayoutCaptionVisibleElements'
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsGetVisibleElementsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetVisibleElements'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TLayoutCaptionVisibleElements'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsSetVisibleElementsEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetGlyph'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TSmartImage'
              end>
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsSetGlyphEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'ShowAccelChar'
            DataType = 'boolean'
            Visibility = cvProtected
            ReadAccess = 'GetShowAccelChar'
            WriteAccess = 'SetShowAccelChar'
          end
          item
            Name = 'Position'
            DataType = 'TLayoutCaptionPosition'
            Visibility = cvProtected
            ReadAccess = 'GetPosition'
            WriteAccess = 'SetPosition'
          end
          item
            Name = 'Glyph'
            DataType = 'TSmartImage'
            Visibility = cvProtected
            ReadAccess = 'GetGlyph'
            WriteAccess = 'SetGlyph'
          end
          item
            Name = 'VisibleElements'
            DataType = 'TLayoutCaptionVisibleElements'
            Visibility = cvProtected
            ReadAccess = 'GetVisibleElements'
            WriteAccess = 'SetVisibleElements'
          end
          item
            Name = 'Text'
            DataType = 'string'
            ReadAccess = 'GetText'
            WriteAccess = 'SetText'
          end
          item
            Name = 'Visible'
            DataType = 'boolean'
            ReadAccess = 'GetVisible'
            WriteAccess = 'SetVisible'
          end
          item
            Name = 'AlignVert'
            DataType = 'TAlignmentVert'
            ReadAccess = 'GetAlignVert'
            WriteAccess = 'SetAlignVert'
          end
          item
            Name = 'AlignHorz'
            DataType = 'TAlignment'
            ReadAccess = 'GetAlignHorz'
            WriteAccess = 'SetAlignHorz'
          end>
      end
      item
        Name = 'TLayoutLabeledItemCustomCaption'
        Ancestor = 'TCustomLayoutItemCaption'
        IsAbstract = True
        IsInternal = True
        Methods = <
          item
            Name = 'GetWordWrap'
            ResultType = 'Boolean'
            OnEval = dwsUnitLayoutClassesTLayoutLabeledItemCustomCaptionMethodsGetWordWrapEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetWordWrap'
            Parameters = <
              item
                Name = 'value'
                DataType = 'Boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTLayoutLabeledItemCustomCaptionMethodsSetWordWrapEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetCursor'
            ResultType = 'TCursor'
            OnEval = dwsUnitLayoutClassesTLayoutLabeledItemCustomCaptionMethodsGetCursorEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetCursor'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TCursor'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTLayoutLabeledItemCustomCaptionMethodsSetCursorEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetWidth'
            ResultType = 'Integer'
            OnEval = dwsUnitLayoutClassesTLayoutLabeledItemCustomCaptionMethodsGetWidthEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetWidth'
            Parameters = <
              item
                Name = 'value'
                DataType = 'Integer'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTLayoutLabeledItemCustomCaptionMethodsSetWidthEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'WordWrap'
            DataType = 'Boolean'
            Visibility = cvProtected
            ReadAccess = 'GetWordWrap'
            WriteAccess = 'SetWordWrap'
          end
          item
            Name = 'Cursor'
            DataType = 'TCursor'
            Visibility = cvProtected
            ReadAccess = 'GetCursor'
            WriteAccess = 'SetCursor'
          end
          item
            Name = 'Width'
            DataType = 'Integer'
            ReadAccess = 'GetWidth'
            WriteAccess = 'SetWidth'
          end
          item
            Name = 'Glyph'
            DataType = 'TSmartImage'
          end
          item
            Name = 'VisibleElements'
            DataType = 'TLayoutCaptionVisibleElements'
          end>
      end
      item
        Name = 'TLayoutGroupCaption'
        Ancestor = 'TCustomLayoutItemCaption'
        IsSealed = True
        IsInternal = True
        Properties = <
          item
            Name = 'Glyph'
            DataType = 'TSmartImage'
          end
          item
            Name = 'Position'
            DataType = 'TLayoutCaptionPosition'
          end
          item
            Name = 'ShowAccelChar'
            DataType = 'boolean'
          end
          item
            Name = 'VisibleElements'
            DataType = 'TLayoutCaptionVisibleElements'
          end>
      end
      item
        Name = 'TLayoutItemCaption'
        Ancestor = 'TLayoutLabeledItemCustomCaption'
        IsSealed = True
        IsInternal = True
        Properties = <
          item
            Name = 'ShowAccelChar'
            DataType = 'Boolean'
          end
          item
            Name = 'Width'
            DataType = 'Integer'
          end
          item
            Name = 'Cursor'
            DataType = 'TCursor'
          end
          item
            Name = 'WordWrap'
            DataType = 'boolean'
          end
          item
            Name = 'Glyph'
            DataType = 'TSmartImage'
          end
          item
            Name = 'VisibleElements'
            DataType = 'TLayoutCaptionVisibleElements'
          end
          item
            Name = 'Position'
            DataType = 'TLayoutCaptionPosition'
          end>
      end
      item
        Name = 'TLayoutEmptySpaceItem'
        Ancestor = 'TCustomLayoutItem'
        IsInternal = True
      end
      item
        Name = 'TCustomLayoutLabeledItem'
        Ancestor = 'TCustomLayoutItem'
        IsAbstract = True
        IsInternal = True
        Properties = <
          item
            Name = 'Padding'
            DataType = 'TLayoutPadding'
          end>
      end
      item
        Name = 'TLayoutControlItem'
        Ancestor = 'TCustomLayoutLabeledItem'
        IsInternal = True
        Methods = <
          item
            Name = 'GetControl'
            ResultType = 'TControl'
            OnEval = dwsUnitLayoutClassesTLayoutItemMethodsGetControlEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetControl'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TControl'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTLayoutItemMethodsSetControlEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetCaption'
            ResultType = 'TLayoutItemCaption'
            OnEval = dwsUnitLayoutClassesTLayoutControlItemMethodsGetCaptionEval
            Visibility = cvProtected
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Control'
            DataType = 'TControl'
            ReadAccess = 'GetControl'
            WriteAccess = 'SetControl'
          end
          item
            Name = 'Caption'
            DataType = 'TLayoutItemCaption'
            ReadAccess = 'GetCaption'
          end>
        OnCleanUp = dwsUnitLayoutClassesTLayoutCleanUp
      end
      item
        Name = 'TLayoutLabelItem'
        Ancestor = 'TCustomLayoutLabeledItem'
        IsInternal = True
        Methods = <
          item
            Name = 'GetCaption'
            ResultType = 'TLayoutLabelItemCaption'
            OnEval = dwsUnitLayoutClassesTLayoutLabelItemMethodsGetCaptionEval
            Visibility = cvProtected
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Caption'
            DataType = 'TLayoutLabelItemCaption'
            ReadAccess = 'GetCaption'
          end>
      end
      item
        Name = 'TLayoutLabelItemCaption'
        Ancestor = 'TLayoutLabeledItemCustomCaption'
        IsSealed = True
        IsInternal = True
        Properties = <
          item
            Name = 'WordWrap'
            DataType = 'boolean'
          end
          item
            Name = 'ShowAccelChar'
            DataType = 'boolean'
          end
          item
            Name = 'Width'
            DataType = 'integer'
          end
          item
            Name = 'Cursor'
            DataType = 'TCursor'
          end>
      end
      item
        Name = 'TLayoutSeparatorItem'
        Ancestor = 'TCustomLayoutLabeledItem'
        IsInternal = True
      end
      item
        Name = 'TLayoutSplitterItem'
        Ancestor = 'TCustomLayoutItem'
        IsInternal = True
      end
      item
        Name = 'TLayoutImageItem'
        Ancestor = 'TCustomLayoutLabeledItem'
        IsInternal = True
        Methods = <
          item
            Name = 'GetImage'
            ResultType = 'TGraphic'
            OnEval = dwsUnitLayoutClassesTLayoutImageItemMethodsGetImageEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetCaption'
            ResultType = 'TLayoutItemCaption'
            OnEval = dwsUnitLayoutClassesTLayoutImageItemMethodsGetCaptionEval
            Visibility = cvProtected
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Image'
            DataType = 'TGraphic'
            ReadAccess = 'GetImage'
          end
          item
            Name = 'Caption'
            DataType = 'TLayoutItemCaption'
            ReadAccess = 'GetCaption'
          end>
      end
      item
        Name = 'TLayoutItemList'
        IsSealed = True
        IsInternal = True
        Methods = <
          item
            Name = 'GetCount'
            ResultType = 'integer'
            OnEval = dwsUnitLayoutClassesTLayoutItemListMethodsGetCountEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetItem'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'TCustomLayoutItem'
            OnEval = dwsUnitLayoutClassesTLayoutItemListMethodsGetItemEval
            Visibility = cvProtected
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Items'
            DataType = 'TCustomLayoutItem'
            ReadAccess = 'GetItem'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            IsDefault = True
          end
          item
            Name = 'Count'
            DataType = 'integer'
            ReadAccess = 'GetCount'
          end>
      end
      item
        Name = 'TLayoutStyle'
        IsSealed = True
        IsInternal = True
        Constructors = <
          item
            Name = 'Create'
            OnEval = dwsUnitLayoutClassesTLayoutStyleConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'GetItemOptions'
            ResultType = 'TLayoutStyleItemOptions'
            OnEval = dwsUnitLayoutClassesTLayoutStyleMethodsGetItemOptionsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetGroupOptions'
            ResultType = 'TLayoutStyleGroupOptions'
            OnEval = dwsUnitLayoutClassesTLayoutStyleMethodsGetGroupOptionsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetOffsets'
            ResultType = 'TLayoutStyleOffsets'
            OnEval = dwsUnitLayoutClassesTLayoutStyleMethodsGetOffsetsEval
            Visibility = cvProtected
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'ItemOptions'
            DataType = 'TLayoutStyleItemOptions'
            ReadAccess = 'GetItemOptions'
          end
          item
            Name = 'GroupOptions'
            DataType = 'TLayoutStyleGroupOptions'
            ReadAccess = 'GetGroupOptions'
          end
          item
            Name = 'Offsets'
            DataType = 'TLayoutStyleOffsets'
            ReadAccess = 'GetOffsets'
          end>
        OnCleanUp = dwsUnitLayoutClassesTLayoutStyleCleanUp
      end
      item
        Name = 'TLayoutStyleItemOptions'
        IsSealed = True
        IsInternal = True
        Methods = <
          item
            Name = 'GetCaptionOptions'
            ResultType = 'TLayoutStyleCaptionOptions'
            OnEval = dwsUnitLayoutClassesTLayoutStyleItemOptionsMethodsGetCaptionOptionsEval
            Visibility = cvProtected
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'CaptionOptions'
            DataType = 'TLayoutStyleCaptionOptions'
            ReadAccess = 'GetCaptionOptions'
          end>
      end
      item
        Name = 'TLayoutStyleGroupOptions'
        IsSealed = True
        IsInternal = True
        Methods = <
          item
            Name = 'GetCaptionOptions'
            ResultType = 'TLayoutStyleCaptionOptions'
            OnEval = dwsUnitLayoutClassesTLayoutStyleGroupOptionsMethodsGetCaptionOptionsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetColor'
            ResultType = 'TColor'
            OnEval = dwsUnitLayoutClassesTLayoutStyleGroupOptionsMethodsGetColorEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetColor'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TColor'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTLayoutStyleGroupOptionsMethodsSetColorEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetSpaceBetweenButtons'
            ResultType = 'integer'
            OnEval = dwsUnitLayoutClassesTLayoutStyleGroupOptionsMethodsGetSpaceBetweenButtonsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetSpaceBetweenButtons'
            Parameters = <
              item
                Name = 'value'
                DataType = 'integer'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTLayoutStyleGroupOptionsMethodsSetSpaceBetweenButtonsEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'CaptionOptions'
            DataType = 'TLayoutStyleCaptionOptions'
            ReadAccess = 'GetCaptionOptions'
          end
          item
            Name = 'Color'
            DataType = 'TColor'
            ReadAccess = 'GetColor'
            WriteAccess = 'SetColor'
          end
          item
            Name = 'SpaceBetweenButtons'
            DataType = 'integer'
            ReadAccess = 'GetSpaceBetweenButtons'
            WriteAccess = 'SetSpaceBetweenButtons'
          end>
      end
      item
        Name = 'TLayoutStyleCaptionOptions'
        IsSealed = True
        IsInternal = True
        Methods = <
          item
            Name = 'GetTextColor'
            ResultType = 'TColor'
            OnEval = dwsUnitLayoutClassesTLayoutStyleCaptionOptionsMethodsGetTextColorEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetTextColor'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TColor'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTLayoutStyleCaptionOptionsMethodsSetTextColorEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetUseDefaultFont'
            ResultType = 'boolean'
            OnEval = dwsUnitLayoutClassesTLayoutStyleCaptionOptionsMethodsGetUseDefaultFontEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetUseDefaultFont'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTLayoutStyleCaptionOptionsMethodsSetUseDefaultFontEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetFont'
            ResultType = 'TFont'
            OnEval = dwsUnitLayoutClassesTLayoutStyleCaptionOptionsMethodsGetFontEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetFont'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TFont'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTLayoutStyleCaptionOptionsMethodsSetFontEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'TextColor'
            DataType = 'TColor'
            ReadAccess = 'GetTextColor'
            WriteAccess = 'SetTextColor'
          end
          item
            Name = 'UseDefaultFont'
            DataType = 'boolean'
            ReadAccess = 'GetUseDefaultFont'
            WriteAccess = 'SetUseDefaultFont'
          end
          item
            Name = 'Font'
            DataType = 'TFont'
            ReadAccess = 'GetFont'
            WriteAccess = 'SetFont'
          end>
      end
      item
        Name = 'TLayoutStyleOffsets'
        IsSealed = True
        IsInternal = True
        Methods = <
          item
            Name = 'GetValue'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'Integer'
            OnEval = dwsUnitLayoutClassesTLayoutStyleOffsetsMethodsGetValueEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetValue'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end
              item
                Name = 'value'
                DataType = 'Integer'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTLayoutStyleOffsetsMethodsSetValueEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'ControlOffsetHorz'
            DataType = 'Integer'
            ReadAccess = 'GetValue'
            WriteAccess = 'SetValue'
            IndexType = 'Integer'
            IndexValue = 0
          end
          item
            Name = 'ControlOffsetVert'
            DataType = 'Integer'
            ReadAccess = 'GetValue'
            WriteAccess = 'SetValue'
            IndexType = 'Integer'
            IndexValue = 1
          end
          item
            Name = 'ItemOffset'
            DataType = 'Integer'
            ReadAccess = 'GetValue'
            WriteAccess = 'SetValue'
            IndexType = 'Integer'
            IndexValue = 2
          end
          item
            Name = 'ItemsAreaOffsetHorz'
            DataType = 'Integer'
            ReadAccess = 'GetValue'
            WriteAccess = 'SetValue'
            IndexType = 'Integer'
            IndexValue = 3
          end
          item
            Name = 'ItemsAreaOffsetVert'
            DataType = 'Integer'
            ReadAccess = 'GetValue'
            WriteAccess = 'SetValue'
            IndexType = 'Integer'
            IndexValue = 4
          end
          item
            Name = 'RootItemsAreaOffsetHorz'
            DataType = 'Integer'
            ReadAccess = 'GetValue'
            WriteAccess = 'SetValue'
            IndexType = 'Integer'
            IndexValue = 5
          end
          item
            Name = 'RootItemsAreaOffsetVert'
            DataType = 'Integer'
            ReadAccess = 'GetValue'
            WriteAccess = 'SetValue'
            IndexType = 'Integer'
            IndexValue = 6
          end>
      end
      item
        Name = 'TLayoutGroupScrollOptions'
        IsSealed = True
        IsInternal = True
        Methods = <
          item
            Name = 'GetHorizontal'
            ResultType = 'TLayoutGroupScrollMode'
            OnEval = dwsUnitLayoutClassesTLayoutGroupScrollOptionsMethodsGetHorizontalEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetHorizontal'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TLayoutGroupScrollMode'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTLayoutGroupScrollOptionsMethodsSetHorizontalEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetVertical'
            ResultType = 'TLayoutGroupScrollMode'
            OnEval = dwsUnitLayoutClassesTLayoutGroupScrollOptionsMethodsGetVerticalEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetVertical'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TLayoutGroupScrollMode'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLayoutClassesTLayoutGroupScrollOptionsMethodsSetVerticalEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Horizontal'
            DataType = 'TLayoutGroupScrollMode'
            ReadAccess = 'GetHorizontal'
            WriteAccess = 'SetHorizontal'
          end
          item
            Name = 'Vertical'
            DataType = 'TLayoutGroupScrollMode'
            ReadAccess = 'GetVertical'
            WriteAccess = 'SetVertical'
          end>
      end>
    Dependencies.Strings = (
      'System.UI.Controls')
    Enumerations = <
      item
        Name = 'TLayoutAlignHorz'
        Elements = <
          item
            Name = 'ahLeft'
          end
          item
            Name = 'ahCenter'
          end
          item
            Name = 'ahRight'
          end
          item
            Name = 'ahClient'
          end
          item
            Name = 'ahParent'
          end>
      end
      item
        Name = 'TLayoutAlignVert'
        Elements = <
          item
            Name = 'avTop'
          end
          item
            Name = 'avCenter'
          end
          item
            Name = 'avBottom'
          end
          item
            Name = 'avClient'
          end
          item
            Name = 'avParent'
          end>
      end
      item
        Name = 'TLayoutDirection'
        Elements = <
          item
            Name = 'ldHorizontal'
          end
          item
            Name = 'ldVertical'
          end
          item
            Name = 'ldTabbed'
          end>
      end
      item
        Name = 'TLayoutCaptionPosition'
        Elements = <
          item
            Name = 'cpLeft'
          end
          item
            Name = 'cpTop'
          end
          item
            Name = 'cpRight'
          end
          item
            Name = 'cpBottom'
          end>
      end
      item
        Name = 'TLayoutCaptionVisibleElement'
        Elements = <
          item
            Name = 'cveImage'
          end
          item
            Name = 'cveText'
          end>
      end
      item
        Name = 'TLayoutGroupScrollMode'
        Elements = <
          item
            Name = 'smNone'
          end
          item
            Name = 'smAuto'
          end
          item
            Name = 'smIndependent'
          end>
      end>
    Sets = <
      item
        Name = 'TLayoutCaptionVisibleElements'
        BaseType = 'TLayoutCaptionVisibleElement'
      end>
    UnitName = 'System.UI.Layout'
    StaticSymbols = False
    Left = 92
    Top = 48
  end
end
