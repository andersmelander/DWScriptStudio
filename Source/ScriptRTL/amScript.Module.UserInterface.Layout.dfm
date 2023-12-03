object DataModuleScriptUserInterfaceLayout: TDataModuleScriptUserInterfaceLayout
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutMethodsGetItemsEval
          end
          item
            Name = 'GetCustomization'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutMethodsGetCustomizationEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTLayoutMethodsSetCustomizationEval
          end
          item
            Name = 'GetStyle'
            ResultType = 'TLayoutStyle'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutMethodsGetStyleEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTLayoutMethodsSetStyleEval
          end
          item
            Name = 'DefaultStyle'
            ResultType = 'TLayoutStyle'
            Attributes = [maClassMethod, maStatic]
            Kind = mkClassFunction
            OnEval = dwsUnitLayoutClassesTLayoutMethodsDefaultStyleEval
          end
          item
            Name = 'Clear'
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTLayoutMethodsClearEval
          end
          item
            Name = 'BeginUpdate'
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTLayoutMethodsBeginUpdateEval
          end
          item
            Name = 'EndUpdate'
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTLayoutMethodsEndUpdateEval
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
          end
          item
            Name = 'Style'
            DataType = 'TLayoutStyle'
            ReadAccess = 'GetStyle'
            WriteAccess = 'SetStyle'
          end
          item
            Name = 'ParentBackground'
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsGetAlignHorzEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsSetAlignHorzEval
          end
          item
            Name = 'GetAlignVert'
            ResultType = 'TLayoutAlignVert'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsGetAlignVertEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsSetAlignVertEval
          end
          item
            Name = 'GetEnabled'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsGetEnabledEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsSetEnabledEval
          end
          item
            Name = 'GetParent'
            ResultType = 'TLayoutGroup'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsGetParentEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsSetParentEval
          end
          item
            Name = 'GetVisible'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsGetVisibleEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsSetVisibleEval
          end
          item
            Name = 'GetCaption'
            ResultType = 'TCustomLayoutItemCaption'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsGetCaptionEval
          end
          item
            Name = 'GetHeight'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsGetHeightEval
          end
          item
            Name = 'SetHeight'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'integer'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsSetHeightEval
          end
          item
            Name = 'GetWidth'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsGetWidthEval
          end
          item
            Name = 'SetWidth'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'integer'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsSetWidthEval
          end
          item
            Name = 'GetStyle'
            ResultType = 'TLayoutStyle'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsGetStyleEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsSetStyleEval
          end
          item
            Name = 'GetOffsets'
            ResultType = 'TLayoutOffsets'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsGetOffsetsEval
          end
          item
            Name = 'GetPadding'
            ResultType = 'TLayoutPadding'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsGetPaddingEval
          end
          item
            Name = 'BeginUpdate'
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsBeginUpdateEval
          end
          item
            Name = 'EndUpdate'
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsEndUpdateEval
          end
          item
            Name = 'MakeVisible'
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemMethodsMakeVisibleEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsGetExpandedEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsSetExpandedEval
          end
          item
            Name = 'GetHidden'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsGetHiddenEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsSetHiddenEval
          end
          item
            Name = 'GetLayoutDirection'
            ResultType = 'TLayoutDirection'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsGetLayoutDirectionEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsSetLayoutDirectionEval
          end
          item
            Name = 'GetShowBorder'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsGetShowBorderEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsSetShowBorderEval
          end
          item
            Name = 'GetIndent'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsGetIndentEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsSetIndentEval
          end
          item
            Name = 'GetItems'
            ResultType = 'TLayoutItemList'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsGetItemsEval
          end
          item
            Name = 'CreateGroup'
            ResultType = 'TLayoutGroup'
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsCreateGroupEval
          end
          item
            Name = 'CreateItem'
            Parameters = <
              item
                Name = 'AControl'
                DataType = 'TControl'
              end>
            ResultType = 'TLayoutControlItem'
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsCreateItemEval
          end
          item
            Name = 'CreateEmptySpaceItem'
            ResultType = 'TLayoutEmptySpaceItem'
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsCreateEmptySpaceItemEval
          end
          item
            Name = 'CreateLabelItem'
            ResultType = 'TLayoutLabelItem'
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsCreateLabelItemEval
          end
          item
            Name = 'CreateSeparatorItem'
            ResultType = 'TLayoutSeparatorItem'
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsCreateSeparatorItemEval
          end
          item
            Name = 'CreateSplitterItem'
            ResultType = 'TLayoutSplitterItem'
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsCreateSplitterItemEval
          end
          item
            Name = 'GetScrollOptions'
            ResultType = 'TLayoutGroupScrollOptions'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsGetScrollOptionsEval
          end
          item
            Name = 'GetAllowWrapItems'
            ResultType = 'Boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsGetAllowWrapItemsEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsSetAllowWrapItemsEval
          end
          item
            Name = 'GetCaption'
            ResultType = 'TLayoutGroupCaption'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutGroupMethodsGetCaptionEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutOffsetsMethodsGetValueEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTLayoutOffsetsMethodsSetValueEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutItemCaptionMethodsGetTextEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTLayoutItemCaptionMethodsSetTextEval
          end
          item
            Name = 'GetVisible'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutItemCaptionMethodsGetVisibleEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTLayoutItemCaptionMethodsSetVisibleEval
          end
          item
            Name = 'GetShowAccelChar'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutItemCaptionMethodsGetShowAccelCharEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTLayoutItemCaptionMethodsSetShowAccelCharEval
          end
          item
            Name = 'GetAlignVert'
            ResultType = 'TAlignmentVert'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsGetAlignVertEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsSetAlignVertEval
          end
          item
            Name = 'GetAlignHorz'
            ResultType = 'TAlignment'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsGetAlignHorzEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsSetAlignHorzEval
          end
          item
            Name = 'GetPosition'
            ResultType = 'TLayoutCaptionPosition'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutItemCaptionMethodsGetPositionEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTLayoutItemCaptionMethodsSetPositionEval
          end
          item
            Name = 'GetGlyph'
            ResultType = 'TSmartImage'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsGetGlyphEval
          end
          item
            Name = 'GetVisibleElements'
            ResultType = 'TLayoutCaptionVisibleElements'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsGetVisibleElementsEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsSetVisibleElementsEval
          end
          item
            Name = 'SetGlyph'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TSmartImage'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsSetGlyphEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutLabeledItemCustomCaptionMethodsGetWordWrapEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTLayoutLabeledItemCustomCaptionMethodsSetWordWrapEval
          end
          item
            Name = 'GetCursor'
            ResultType = 'TCursor'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutLabeledItemCustomCaptionMethodsGetCursorEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTLayoutLabeledItemCustomCaptionMethodsSetCursorEval
          end
          item
            Name = 'GetWidth'
            ResultType = 'Integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutLabeledItemCustomCaptionMethodsGetWidthEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTLayoutLabeledItemCustomCaptionMethodsSetWidthEval
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
          end
          item
            Name = 'VisibleElements'
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
          end
          item
            Name = 'Position'
          end
          item
            Name = 'ShowAccelChar'
          end
          item
            Name = 'VisibleElements'
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
          end
          item
            Name = 'Width'
          end
          item
            Name = 'Cursor'
          end
          item
            Name = 'WordWrap'
          end
          item
            Name = 'Glyph'
          end
          item
            Name = 'VisibleElements'
          end
          item
            Name = 'Position'
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutItemMethodsGetControlEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTLayoutItemMethodsSetControlEval
          end
          item
            Name = 'GetCaption'
            ResultType = 'TLayoutItemCaption'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutControlItemMethodsGetCaptionEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutLabelItemMethodsGetCaptionEval
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
          end
          item
            Name = 'ShowAccelChar'
          end
          item
            Name = 'Width'
          end
          item
            Name = 'Cursor'
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutImageItemMethodsGetImageEval
          end
          item
            Name = 'GetCaption'
            ResultType = 'TLayoutItemCaption'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutImageItemMethodsGetCaptionEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutItemListMethodsGetCountEval
          end
          item
            Name = 'GetItem'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'TCustomLayoutItem'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutItemListMethodsGetItemEval
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
        Constructors = <
          item
            Name = 'Create'
            OnEval = dwsUnitLayoutClassesTLayoutStyleConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'GetItemOptions'
            ResultType = 'TLayoutStyleItemOptions'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutStyleMethodsGetItemOptionsEval
          end
          item
            Name = 'GetGroupOptions'
            ResultType = 'TLayoutStyleGroupOptions'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutStyleMethodsGetGroupOptionsEval
          end
          item
            Name = 'GetOffsets'
            ResultType = 'TLayoutStyleOffsets'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutStyleMethodsGetOffsetsEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutStyleItemOptionsMethodsGetCaptionOptionsEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutStyleGroupOptionsMethodsGetCaptionOptionsEval
          end
          item
            Name = 'GetColor'
            ResultType = 'TColor'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutStyleGroupOptionsMethodsGetColorEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTLayoutStyleGroupOptionsMethodsSetColorEval
          end
          item
            Name = 'GetSpaceBetweenButtons'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutStyleGroupOptionsMethodsGetSpaceBetweenButtonsEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTLayoutStyleGroupOptionsMethodsSetSpaceBetweenButtonsEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutStyleCaptionOptionsMethodsGetTextColorEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTLayoutStyleCaptionOptionsMethodsSetTextColorEval
          end
          item
            Name = 'GetUseDefaultFont'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutStyleCaptionOptionsMethodsGetUseDefaultFontEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTLayoutStyleCaptionOptionsMethodsSetUseDefaultFontEval
          end
          item
            Name = 'GetFont'
            ResultType = 'TFont'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutStyleCaptionOptionsMethodsGetFontEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTLayoutStyleCaptionOptionsMethodsSetFontEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutStyleOffsetsMethodsGetValueEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTLayoutStyleOffsetsMethodsSetValueEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutGroupScrollOptionsMethodsGetHorizontalEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTLayoutGroupScrollOptionsMethodsSetHorizontalEval
          end
          item
            Name = 'GetVertical'
            ResultType = 'TLayoutGroupScrollMode'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLayoutClassesTLayoutGroupScrollOptionsMethodsGetVerticalEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitLayoutClassesTLayoutGroupScrollOptionsMethodsSetVerticalEval
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
