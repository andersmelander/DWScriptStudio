object DataModuleUserInterface: TDataModuleUserInterface
  OldCreateOrder = False
  Height = 287
  Width = 402
  object dwsUnitControls: TdwsUnit
    Classes = <
      item
        Name = 'TControlOffset'
        IsAbstract = True
        Constructors = <
          item
            Name = 'Create'
          end>
        Methods = <
          item
            Name = 'SetLeft'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'integer'
              end>
            OnEval = dwsUnitControlsClassesTControlOffsetMethodsSetLeftEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetLeft'
            ResultType = 'integer'
            OnEval = dwsUnitControlsClassesTControlOffsetMethodsGetLeftEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetTop'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'integer'
              end>
            OnEval = dwsUnitControlsClassesTControlOffsetMethodsSetTopEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetTop'
            ResultType = 'integer'
            OnEval = dwsUnitControlsClassesTControlOffsetMethodsGetTopEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetRight'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'integer'
              end>
            OnEval = dwsUnitControlsClassesTControlOffsetMethodsSetRightEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetRight'
            ResultType = 'integer'
            OnEval = dwsUnitControlsClassesTControlOffsetMethodsGetRightEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetBottom'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'integer'
              end>
            OnEval = dwsUnitControlsClassesTControlOffsetMethodsSetBottomEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetBottom'
            ResultType = 'integer'
            OnEval = dwsUnitControlsClassesTControlOffsetMethodsGetBottomEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetBounds'
            Parameters = <
              item
                Name = 'ALeft'
                DataType = 'Integer'
              end
              item
                Name = 'ATop'
                DataType = 'Integer'
              end
              item
                Name = 'ARight'
                DataType = 'Integer'
              end
              item
                Name = 'ABottom'
                DataType = 'Integer'
              end>
            OnEval = dwsUnitControlsClassesTControlOffsetMethodsSetBoundsEval
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Left'
            DataType = 'integer'
            ReadAccess = 'GetLeft'
            WriteAccess = 'SetLeft'
          end
          item
            Name = 'Top'
            DataType = 'integer'
            ReadAccess = 'GetTop'
            WriteAccess = 'SetTop'
          end
          item
            Name = 'Right'
            DataType = 'integer'
            ReadAccess = 'GetRight'
            WriteAccess = 'SetRight'
          end
          item
            Name = 'Bottom'
            DataType = 'integer'
            ReadAccess = 'GetBottom'
            WriteAccess = 'SetBottom'
          end>
      end
      item
        Name = 'TControlMargin'
        Ancestor = 'TControlOffset'
      end
      item
        Name = 'TControlPadding'
        Ancestor = 'TControlOffset'
      end
      item
        Name = 'TSizeConstraints'
        Methods = <
          item
            Name = 'GetConstraint'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'integer'
            OnEval = dwsUnitControlsClassesTSizeConstraintsMethodsGetConstraintEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetConstraint'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end
              item
                Name = 'Value'
                DataType = 'integer'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTSizeConstraintsMethodsSetConstraintEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'MaxHeight'
            DataType = 'integer'
            ReadAccess = 'GetConstraint'
            WriteAccess = 'SetConstraint'
            IndexType = 'Integer'
            IndexValue = 0
          end
          item
            Name = 'MaxWidth'
            DataType = 'integer'
            ReadAccess = 'GetConstraint'
            WriteAccess = 'SetConstraint'
            IndexType = 'Integer'
            IndexValue = 1
          end
          item
            Name = 'MinHeight'
            DataType = 'integer'
            ReadAccess = 'GetConstraint'
            WriteAccess = 'SetConstraint'
            IndexType = 'Integer'
            IndexValue = 2
          end
          item
            Name = 'MinWidth'
            DataType = 'integer'
            ReadAccess = 'GetConstraint'
            WriteAccess = 'SetConstraint'
            IndexType = 'Integer'
            IndexValue = 3
          end>
      end
      item
        Name = 'TControl'
        Ancestor = 'TComponent'
        IsAbstract = True
        Fields = <
          item
            Name = 'FOnClick'
            DataType = 'TControlNotifyEvent'
            Visibility = cvPrivate
          end
          item
            Name = 'FOnDblClick'
            DataType = 'TControlNotifyEvent'
            Visibility = cvPrivate
          end
          item
            Name = 'FOnEnter'
            DataType = 'TControlNotifyEvent'
            Visibility = cvPrivate
          end
          item
            Name = 'FOnExit'
            DataType = 'TControlNotifyEvent'
            Visibility = cvPrivate
          end
          item
            Name = 'FOnKeypress'
            DataType = 'TKeypressEvent'
            Visibility = cvPrivate
          end>
        Methods = <
          item
            Name = 'GetLeft'
            ResultType = 'Integer'
            OnEval = dwsUnitProjectClassesTControlMethodsGetLeftEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetLeft'
            Parameters = <
              item
                Name = 'value'
                DataType = 'Integer'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitProjectClassesTControlMethodsSetLeftEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetTop'
            ResultType = 'Integer'
            OnEval = dwsUnitProjectClassesTControlMethodsGetTopEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetTop'
            Parameters = <
              item
                Name = 'value'
                DataType = 'Integer'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitProjectClassesTControlMethodsSetTopEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetWidth'
            ResultType = 'Integer'
            OnEval = dwsUnitProjectClassesTControlMethodsGetWidthEval
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
            OnEval = dwsUnitProjectClassesTControlMethodsSetWidthEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetHeight'
            ResultType = 'Integer'
            OnEval = dwsUnitProjectClassesTControlMethodsGetHeightEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetHeight'
            Parameters = <
              item
                Name = 'value'
                DataType = 'Integer'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitProjectClassesTControlMethodsSetHeightEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetVisible'
            ResultType = 'Boolean'
            OnEval = dwsUnitProjectClassesTControlMethodsGetVisibleEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetVisible'
            Parameters = <
              item
                Name = 'value'
                DataType = 'Boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitProjectClassesTControlMethodsSetVisibleEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetText'
            ResultType = 'String'
            OnEval = dwsUnitProjectClassesTControlMethodsGetTextEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetText'
            Parameters = <
              item
                Name = 'value'
                DataType = 'String'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitProjectClassesTControlMethodsSetTextEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetColor'
            ResultType = 'TColor'
            OnEval = dwsUnitControlsClassesTControlMethodsGetColorEval
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
            OnEval = dwsUnitControlsClassesTControlMethodsSetColorEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetCursor'
            ResultType = 'Integer'
            OnEval = dwsUnitControlsClassesTControlMethodsGetCursorEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetCursor'
            Parameters = <
              item
                Name = 'value'
                DataType = 'Integer'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTControlMethodsSetCursorEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetParentFont'
            ResultType = 'Boolean'
            OnEval = dwsUnitControlsClassesTControlMethodsGetParentFontEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetParentFont'
            Parameters = <
              item
                Name = 'value'
                DataType = 'Boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTControlMethodsSetParentFontEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetHint'
            ResultType = 'String'
            OnEval = dwsUnitControlsClassesTControlMethodsGetHintEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetHint'
            Parameters = <
              item
                Name = 'value'
                DataType = 'String'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTControlMethodsSetHintEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetParentColor'
            ResultType = 'Boolean'
            OnEval = dwsUnitControlsClassesTControlMethodsGetParentColorEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetParentColor'
            Parameters = <
              item
                Name = 'value'
                DataType = 'Boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTControlMethodsSetParentColorEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetAutoSize'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTControlMethodsGetAutoSizeEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetAutoSize'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTControlMethodsSetAutoSizeEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetConstraints'
            ResultType = 'TSizeConstraints'
            OnEval = dwsUnitControlsClassesTControlMethodsGetConstraintsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetAlign'
            ResultType = 'TAlign'
            OnEval = dwsUnitProjectClassesTControlMethodsGetAlignEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetAlign'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TAlign'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitProjectClassesTControlMethodsSetAlignEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetParent'
            ResultType = 'TContainerControl'
            OnEval = dwsUnitProjectClassesTControlMethodsGetParentEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetParent'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TContainerControl'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitProjectClassesTControlMethodsSetParentEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetShowHint'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTControlMethodsGetShowHintEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetShowHint'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            OnEval = dwsUnitControlsClassesTControlMethodsSetShowHintEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetParentShowHint'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTControlMethodsGetParentShowHintEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetParentShowHint'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            OnEval = dwsUnitControlsClassesTControlMethodsSetParentShowHintEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetEnabled'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTControlMethodsGetEnabledEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetEnabled'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            OnEval = dwsUnitControlsClassesTControlMethodsSetEnabledEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetTabStop'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTControlMethodsGetTabStopEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetTabStop'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            OnEval = dwsUnitControlsClassesTControlMethodsSetTabStopEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetOnClick'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TControlNotifyEvent'
              end>
            OnEval = dwsUnitControlsClassesTControlMethodsSetOnClickEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetOnDblClick'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TControlNotifyEvent'
              end>
            OnEval = dwsUnitControlsClassesTControlMethodsSetOnDblClickEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetOnEnter'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TControlNotifyEvent'
              end>
            OnEval = dwsUnitControlsClassesTControlMethodsSetOnEnterEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetOnExit'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TControlNotifyEvent'
              end>
            OnEval = dwsUnitControlsClassesTControlMethodsSetOnExitEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetOnKeypress'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TKeypressEvent'
              end>
            OnEval = dwsUnitControlsClassesTControlMethodsSetOnKeypressEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetFont'
            ResultType = 'TFont'
            OnEval = dwsUnitControlsClassesTControlMethodsGetFontEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetFont'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TFont'
              end>
            OnEval = dwsUnitControlsClassesTControlMethodsSetFontEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetMargins'
            ResultType = 'TControlMargin'
            OnEval = dwsUnitControlsClassesTControlMethodsGetMarginsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetAlignWithMargins'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTControlMethodsGetAlignWithMarginsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetAlignWithMargins'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            OnEval = dwsUnitControlsClassesTControlMethodsSetAlignWithMarginsEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetAction'
            ResultType = 'TAction'
            OnEval = dwsUnitControlsClassesTControlMethodsGetActionEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetAction'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TAction'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTControlMethodsSetActionEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetParentBackground'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTControlMethodsGetParentBackgroundEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetParentBackground'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTControlMethodsSetParentBackgroundEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'Show'
            OnEval = dwsUnitProjectClassesTControlMethodsShowEval
            Kind = mkProcedure
          end
          item
            Name = 'Hide'
            OnEval = dwsUnitProjectClassesTControlMethodsHideEval
            Kind = mkProcedure
          end
          item
            Name = 'Update'
            OnEval = dwsUnitControlsClassesTControlMethodsUpdateEval
            Kind = mkProcedure
          end
          item
            Name = 'Repaint'
            OnEval = dwsUnitControlsClassesTControlMethodsRepaintEval
            Kind = mkProcedure
          end
          item
            Name = 'Refresh'
            OnEval = dwsUnitControlsClassesTControlMethodsRefreshEval
            Kind = mkProcedure
          end
          item
            Name = 'Invalidate'
            OnEval = dwsUnitControlsClassesTControlMethodsInvalidateEval
            Kind = mkProcedure
          end
          item
            Name = 'Click'
            OnEval = dwsUnitControlsClassesTControlMethodsClickEval
            Kind = mkProcedure
          end
          item
            Name = 'GetBoundsRect'
            ResultType = 'TRect'
            OnEval = dwsUnitControlsClassesTControlMethodsGetBoundsRectEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetBoundsRect'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TRect'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTControlMethodsSetBoundsRectEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetClientRect'
            ResultType = 'TRect'
            OnEval = dwsUnitControlsClassesTControlMethodsGetClientRectEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'ClientToScreen'
            Parameters = <
              item
                Name = 'Point'
                DataType = 'TPoint'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TPoint'
            Overloaded = True
            OnEval = dwsUnitControlsClassesTControlMethodsClientToScreenEval
            Kind = mkFunction
          end
          item
            Name = 'ClientToScreen'
            Parameters = <
              item
                Name = 'Rect'
                DataType = 'TRect'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TRect'
            Overloaded = True
            OnEval = dwsUnitControlsClassesTControlMethodsClientToScreenRectEval
            Kind = mkFunction
          end
          item
            Name = 'ScreenToClient'
            Parameters = <
              item
                Name = 'Point'
                DataType = 'TPoint'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TPoint'
            Overloaded = True
            OnEval = dwsUnitControlsClassesTControlMethodsScreenToClientEval
            Kind = mkFunction
          end
          item
            Name = 'ScreenToClient'
            Parameters = <
              item
                Name = 'Rect'
                DataType = 'TRect'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TRect'
            Overloaded = True
            OnEval = dwsUnitControlsClassesTControlMethodsScreenToClientRectEval
            Kind = mkFunction
          end
          item
            Name = 'GetUserInterfaceAutomation'
            ResultType = 'TObject'
            Attributes = [maVirtual]
            OnEval = dwsUnitControlsClassesTControlMethodsGetUserInterfaceAutomationEval
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Left'
            DataType = 'Integer'
            ReadAccess = 'GetLeft'
            WriteAccess = 'SetLeft'
          end
          item
            Name = 'Top'
            DataType = 'Integer'
            ReadAccess = 'GetTop'
            WriteAccess = 'SetTop'
          end
          item
            Name = 'Width'
            DataType = 'Integer'
            ReadAccess = 'GetWidth'
            WriteAccess = 'SetWidth'
          end
          item
            Name = 'Height'
            DataType = 'Integer'
            ReadAccess = 'GetHeight'
            WriteAccess = 'SetHeight'
          end
          item
            Name = 'Visible'
            DataType = 'Boolean'
            ReadAccess = 'GetVisible'
            WriteAccess = 'SetVisible'
          end
          item
            Name = 'Text'
            DataType = 'String'
            Visibility = cvProtected
            ReadAccess = 'GetText'
            WriteAccess = 'SetText'
          end
          item
            Name = 'Caption'
            DataType = 'String'
            ReadAccess = 'GetText'
            WriteAccess = 'SetText'
          end
          item
            Name = 'Color'
            DataType = 'TColor'
            ReadAccess = 'GetColor'
            WriteAccess = 'SetColor'
          end
          item
            Name = 'Cursor'
            DataType = 'Integer'
            ReadAccess = 'GetCursor'
            WriteAccess = 'SetCursor'
          end
          item
            Name = 'ParentFont'
            DataType = 'Boolean'
            ReadAccess = 'GetParentFont'
            WriteAccess = 'SetParentFont'
          end
          item
            Name = 'Hint'
            DataType = 'String'
            ReadAccess = 'GetHint'
            WriteAccess = 'SetHint'
          end
          item
            Name = 'ParentColor'
            DataType = 'Boolean'
            ReadAccess = 'GetParentColor'
            WriteAccess = 'SetParentColor'
          end
          item
            Name = 'AutoSize'
            DataType = 'boolean'
            Visibility = cvProtected
            ReadAccess = 'GetAutoSize'
            WriteAccess = 'SetAutoSize'
          end
          item
            Name = 'Align'
            DataType = 'TAlign'
            ReadAccess = 'GetAlign'
            WriteAccess = 'SetAlign'
          end
          item
            Name = 'Parent'
            DataType = 'TContainerControl'
            ReadAccess = 'GetParent'
            WriteAccess = 'SetParent'
          end
          item
            Name = 'Constraints'
            DataType = 'TSizeConstraints'
            ReadAccess = 'GetConstraints'
          end
          item
            Name = 'OnClick'
            DataType = 'TControlNotifyEvent'
            ReadAccess = 'FOnClick'
            WriteAccess = 'SetOnClick'
          end
          item
            Name = 'ShowHint'
            DataType = 'boolean'
            ReadAccess = 'GetShowHint'
            WriteAccess = 'SetShowHint'
          end
          item
            Name = 'ParentShowHint'
            DataType = 'boolean'
            ReadAccess = 'GetParentShowHint'
            WriteAccess = 'SetParentShowHint'
          end
          item
            Name = 'Enabled'
            DataType = 'boolean'
            ReadAccess = 'GetEnabled'
            WriteAccess = 'SetEnabled'
          end
          item
            Name = 'TabStop'
            DataType = 'boolean'
            Visibility = cvProtected
            ReadAccess = 'GetTabStop'
            WriteAccess = 'SetTabStop'
          end
          item
            Name = 'OnDblClick'
            DataType = 'TControlNotifyEvent'
            ReadAccess = 'FOnDblClick'
            WriteAccess = 'SetOnDblClick'
          end
          item
            Name = 'OnEnter'
            DataType = 'TControlNotifyEvent'
            Visibility = cvProtected
            ReadAccess = 'FOnEnter'
            WriteAccess = 'SetOnEnter'
          end
          item
            Name = 'OnExit'
            DataType = 'TControlNotifyEvent'
            Visibility = cvProtected
            ReadAccess = 'FOnExit'
            WriteAccess = 'SetOnExit'
          end
          item
            Name = 'OnKeypress'
            DataType = 'TKeypressEvent'
            Visibility = cvProtected
            ReadAccess = 'FOnKeypress'
            WriteAccess = 'SetOnKeypress'
          end
          item
            Name = 'Font'
            DataType = 'TFont'
            ReadAccess = 'GetFont'
            WriteAccess = 'SetFont'
          end
          item
            Name = 'Margins'
            DataType = 'TControlMargin'
            ReadAccess = 'GetMargins'
          end
          item
            Name = 'AlignWithMargins'
            DataType = 'boolean'
            ReadAccess = 'GetAlignWithMargins'
            WriteAccess = 'SetAlignWithMargins'
          end
          item
            Name = 'Action'
            DataType = 'TAction'
            ReadAccess = 'GetAction'
            WriteAccess = 'SetAction'
          end
          item
            Name = 'ParentBackground'
            DataType = 'boolean'
            Visibility = cvProtected
            ReadAccess = 'GetParentBackground'
            WriteAccess = 'SetParentBackground'
          end
          item
            Name = 'BoundsRect'
            DataType = 'TRect'
            ReadAccess = 'GetBoundsRect'
            WriteAccess = 'SetBoundsRect'
          end
          item
            Name = 'ClientRect'
            DataType = 'TRect'
            ReadAccess = 'GetClientRect'
          end>
        OnCleanUp = dwsUnitProjectClassesTControlCleanUp
      end
      item
        Name = 'TCustomControl'
        Ancestor = 'TControl'
        IsAbstract = True
        Methods = <
          item
            Name = 'SetFocus'
            OnEval = dwsUnitControlsClassesTCustomControlMethodsSetFocusEval
            Kind = mkProcedure
          end
          item
            Name = 'CanFocus'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTCustomControlMethodsCanFocusEval
            Kind = mkFunction
          end
          item
            Name = 'Focused'
            ResultType = 'Boolean'
            OnEval = dwsUnitControlsClassesTCustomControlMethodsFocusedEval
            Kind = mkFunction
          end
          item
            Name = 'GetHandle'
            ResultType = 'integer'
            OnEval = dwsUnitControlsClassesTCustomControlMethodsGetHandleEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'PostMessage'
            Parameters = <
              item
                Name = 'Handle'
                DataType = 'integer'
              end
              item
                Name = 'Msg'
                DataType = 'integer'
              end
              item
                Name = 'wParam'
                DataType = 'integer'
              end
              item
                Name = 'lParam'
                DataType = 'integer'
              end>
            ResultType = 'boolean'
            Overloaded = True
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitControlsClassesTCustomControlMethodsPostMessageEval
            Visibility = cvProtected
            Kind = mkClassMethod
          end
          item
            Name = 'PostMessage'
            Parameters = <
              item
                Name = 'Msg'
                DataType = 'integer'
              end
              item
                Name = 'wParam'
                DataType = 'integer'
              end
              item
                Name = 'lParam'
                DataType = 'integer'
              end>
            ResultType = 'boolean'
            Overloaded = True
            OnEval = dwsUnitControlsClassesTCustomControlMethodsPostMessageSelfEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'Perform'
            Parameters = <
              item
                Name = 'Msg'
                DataType = 'integer'
              end
              item
                Name = 'WParam'
                DataType = 'integer'
              end
              item
                Name = 'LParam'
                DataType = 'integer'
              end>
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Handle'
            DataType = 'integer'
            Visibility = cvProtected
            ReadAccess = 'GetHandle'
          end>
      end
      item
        Name = 'TControlList'
        Methods = <
          item
            Name = 'GetCount'
            ResultType = 'Integer'
            OnEval = dwsUnitProjectClassesTControlListMethodsGetCountEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetItem'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
                IsWritable = False
              end>
            ResultType = 'TControl'
            OnEval = dwsUnitProjectClassesTControlListMethodsGetItemEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'Clear'
            OnEval = dwsUnitProjectClassesTControlListMethodsClearEval
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Count'
            DataType = 'Integer'
            ReadAccess = 'GetCount'
          end
          item
            Name = 'Items'
            DataType = 'TControl'
            ReadAccess = 'GetItem'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
                IsWritable = False
              end>
            IsDefault = True
          end>
      end
      item
        Name = 'TContainerControl'
        Ancestor = 'TCustomControl'
        IsAbstract = True
        Methods = <
          item
            Name = 'GetControls'
            ResultType = 'TControlList'
            OnEval = dwsUnitProjectClassesTContainerControlMethodsGetControlsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetPadding'
            ResultType = 'TControlPadding'
            OnEval = dwsUnitControlsClassesTContainerControlMethodsGetPaddingEval
            Visibility = cvProtected
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Controls'
            DataType = 'TControlList'
            ReadAccess = 'GetControls'
          end
          item
            Name = 'Padding'
            DataType = 'TControlPadding'
            ReadAccess = 'GetPadding'
          end>
      end
      item
        Name = 'TCustomForm'
        Ancestor = 'TContainerControl'
        IsAbstract = True
        Constructors = <
          item
            Name = 'Create'
            OnEval = dwsUnitControlsClassesTCustomFormConstructorsCreateEval
          end>
        Fields = <
          item
            Name = 'FOnShow'
            DataType = 'TControlNotifyEvent'
            Visibility = cvPrivate
          end>
        Methods = <
          item
            Name = 'ShowModal'
            ResultType = 'TModalResult'
            OnEval = dwsUnitProjectClassesTCustomFormMethodsShowModalEval
            Kind = mkFunction
          end
          item
            Name = 'Close'
            OnEval = dwsUnitControlsClassesTCustomFormMethodsCloseEval
            Kind = mkProcedure
          end
          item
            Name = 'GetModalResult'
            ResultType = 'TModalResult'
            OnEval = dwsUnitControlsClassesTCustomFormMethodsGetModalResultEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetModalResult'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TModalResult'
              end>
            OnEval = dwsUnitControlsClassesTCustomFormMethodsSetModalResultEval
            Kind = mkProcedure
          end
          item
            Name = 'GetStayOnTop'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTCustomFormMethodsGetStayOnTopEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetStayOnTop'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTCustomFormMethodsSetStayOnTopEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetActive'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTCustomFormMethodsGetActiveEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetBorderStyle'
            ResultType = 'TFormBorderStyle'
            OnEval = dwsUnitControlsClassesTCustomFormMethodsGetBorderStyleEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetBorderStyle'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TFormBorderStyle'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTCustomFormMethodsSetBorderStyleEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetKeyPreview'
            ResultType = 'Boolean'
            OnEval = dwsUnitControlsClassesTCustomFormMethodsGetKeyPreviewEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetKeyPreview'
            Parameters = <
              item
                Name = 'value'
                DataType = 'Boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTCustomFormMethodsSetKeyPreviewEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetWindowState'
            ResultType = 'TWindowState'
            OnEval = dwsUnitControlsClassesTCustomFormMethodsGetWindowStateEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetWindowState'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TWindowState'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTCustomFormMethodsSetWindowStateEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetPosition'
            ResultType = 'TFormPosition'
            OnEval = dwsUnitControlsClassesTCustomFormMethodsGetPositionEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetPosition'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TFormPosition'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTCustomFormMethodsSetPositionEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetOnShow'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TControlNotifyEvent'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTCustomFormMethodsSetOnShowEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'AutoSize'
            DataType = 'boolean'
          end
          item
            Name = 'OnEnter'
            DataType = 'TControlNotifyEvent'
          end
          item
            Name = 'OnExit'
            DataType = 'TControlNotifyEvent'
          end
          item
            Name = 'OnKeypress'
            DataType = 'TKeypressEvent'
          end
          item
            Name = 'ModalResult'
            DataType = 'TModalResult'
            ReadAccess = 'GetModalResult'
            WriteAccess = 'SetModalResult'
          end
          item
            Name = 'StayOnTop'
            DataType = 'boolean'
            ReadAccess = 'GetStayOnTop'
            WriteAccess = 'SetStayOnTop'
          end
          item
            Name = 'Active'
            DataType = 'boolean'
            ReadAccess = 'GetActive'
          end
          item
            Name = 'BorderStyle'
            DataType = 'TFormBorderStyle'
            ReadAccess = 'GetBorderStyle'
            WriteAccess = 'SetBorderStyle'
          end
          item
            Name = 'KeyPreview'
            DataType = 'Boolean'
            ReadAccess = 'GetKeyPreview'
            WriteAccess = 'SetKeyPreview'
          end
          item
            Name = 'WindowState'
            DataType = 'TWindowState'
            ReadAccess = 'GetWindowState'
            WriteAccess = 'SetWindowState'
          end
          item
            Name = 'Position'
            DataType = 'TFormPosition'
            ReadAccess = 'GetPosition'
            WriteAccess = 'SetPosition'
          end
          item
            Name = 'OnShow'
            DataType = 'TControlNotifyEvent'
            ReadAccess = 'FOnShow'
            WriteAccess = 'SetOnShow'
          end>
      end
      item
        Name = 'TForm'
        Ancestor = 'TCustomForm'
        Fields = <
          item
            Name = 'FOnAfterShow'
            DataType = 'TControlNotifyEvent'
            Visibility = cvPrivate
          end>
        Methods = <
          item
            Name = 'SetOnAfterShow'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TControlNotifyEvent'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTFormMethodsSetOnAfterShowEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'OnAfterShow'
            DataType = 'TControlNotifyEvent'
            ReadAccess = 'FOnAfterShow'
            WriteAccess = 'SetOnAfterShow'
          end>
      end
      item
        Name = 'TCustomEdit'
        Ancestor = 'TCustomControl'
        IsAbstract = True
        Fields = <
          item
            Name = 'FOnChange'
            DataType = 'TControlNotifyEvent'
            Visibility = cvPrivate
          end
          item
            Name = 'FOnChanged'
            DataType = 'TControlNotifyEvent'
            Visibility = cvPrivate
          end
          item
            Name = 'FOnButtonClick'
            DataType = 'TEditButtonClickEvent'
            Visibility = cvPrivate
          end>
        Methods = <
          item
            Name = 'GetReadOnly'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTCustomEditMethodsGetReadOnlyEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetReadOnly'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            OnEval = dwsUnitControlsClassesTCustomEditMethodsSetReadOnlyEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetTextHint'
            ResultType = 'string'
            OnEval = dwsUnitControlsClassesTCustomEditMethodsGetTextHintEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetTextHint'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTCustomEditMethodsSetTextHintEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetAlignment'
            ResultType = 'TEditAlignment'
            OnEval = dwsUnitControlsClassesTCustomEditMethodsGetAlignmentEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetOnChange'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TControlNotifyEvent'
              end>
            OnEval = dwsUnitControlsClassesTCustomEditMethodsSetOnChangeEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetOnChanged'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TControlNotifyEvent'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTCustomEditMethodsSetOnChangedEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetUseLeftAlignmentOnEditing'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTCustomEditMethodsGetUseLeftAlignmentOnEditingEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetUseLeftAlignmentOnEditing'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTCustomEditMethodsSetUseLeftAlignmentOnEditingEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetButtons'
            ResultType = 'TEditButtons'
            OnEval = dwsUnitControlsClassesTCustomEditMethodsGetButtonsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetOnButtonClick'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TEditButtonClickEvent'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTCustomEditMethodsSetOnButtonClickEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Text'
            DataType = 'string'
          end
          item
            Name = 'OnEnter'
            DataType = 'TControlNotifyEvent'
          end
          item
            Name = 'OnExit'
            DataType = 'TControlNotifyEvent'
          end
          item
            Name = 'OnKeypress'
            DataType = 'TKeypressEvent'
          end
          item
            Name = 'OnChange'
            DataType = 'TControlNotifyEvent'
            ReadAccess = 'FOnChange'
            WriteAccess = 'SetOnChange'
          end
          item
            Name = 'OnChanged'
            DataType = 'TControlNotifyEvent'
            ReadAccess = 'FOnChanged'
            WriteAccess = 'SetOnChanged'
          end
          item
            Name = 'ReadOnly'
            DataType = 'boolean'
            ReadAccess = 'GetReadOnly'
            WriteAccess = 'SetReadOnly'
          end
          item
            Name = 'TextHint'
            DataType = 'string'
            Visibility = cvProtected
            ReadAccess = 'GetTextHint'
            WriteAccess = 'SetTextHint'
          end
          item
            Name = 'Alignment'
            DataType = 'TEditAlignment'
            ReadAccess = 'GetAlignment'
          end
          item
            Name = 'UseLeftAlignmentOnEditing'
            DataType = 'boolean'
            ReadAccess = 'GetUseLeftAlignmentOnEditing'
            WriteAccess = 'SetUseLeftAlignmentOnEditing'
          end
          item
            Name = 'Buttons'
            DataType = 'TEditButtons'
            ReadAccess = 'GetButtons'
          end
          item
            Name = 'OnButtonClick'
            DataType = 'TEditButtonClickEvent'
            ReadAccess = 'FOnButtonClick'
            WriteAccess = 'SetOnButtonClick'
          end>
      end
      item
        Name = 'TCustomTextEdit'
        Ancestor = 'TCustomEdit'
        IsAbstract = True
        Methods = <
          item
            Name = 'GetDisplayFormat'
            ResultType = 'string'
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsGetDisplayFormatEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetDisplayFormat'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsSetDisplayFormatEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetEditFormat'
            ResultType = 'string'
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsGetEditFormatEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetEditFormat'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsSetEditFormatEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetCharCase'
            ResultType = 'TEditCharCase'
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsGetCharCaseEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetCharCase'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TEditCharCase'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsSetCharCaseEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetMinValue'
            ResultType = 'Float'
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsGetMinValueEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetMinValue'
            Parameters = <
              item
                Name = 'value'
                DataType = 'Float'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsSetMinValueEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetMaxValue'
            ResultType = 'Float'
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsGetMaxValueEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetMaxValue'
            Parameters = <
              item
                Name = 'value'
                DataType = 'Float'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsSetMaxValueEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetPasswordChar'
            ResultType = 'string'
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsGetPasswordCharEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetPasswordChar'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsSetPasswordCharEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetLookupItems'
            ResultType = 'TStrings'
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsGetLookupItemsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetIncrementalSearch'
            ResultType = 'Boolean'
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsGetIncrementalSearchEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetIncrementalSearch'
            Parameters = <
              item
                Name = 'value'
                DataType = 'Boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsSetIncrementalSearchEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetLookupItemsSorted'
            ResultType = 'Boolean'
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsGetLookupItemsSortedEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetLookupItemsSorted'
            Parameters = <
              item
                Name = 'value'
                DataType = 'Boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsSetLookupItemsSortedEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'TabStop'
            DataType = 'boolean'
          end
          item
            Name = 'DisplayFormat'
            DataType = 'string'
            ReadAccess = 'GetDisplayFormat'
            WriteAccess = 'SetDisplayFormat'
          end
          item
            Name = 'EditFormat'
            DataType = 'string'
            ReadAccess = 'GetEditFormat'
            WriteAccess = 'SetEditFormat'
          end
          item
            Name = 'CharCase'
            DataType = 'TEditCharCase'
            ReadAccess = 'GetCharCase'
            WriteAccess = 'SetCharCase'
          end
          item
            Name = 'MinValue'
            DataType = 'Float'
            Visibility = cvProtected
            ReadAccess = 'GetMinValue'
            WriteAccess = 'SetMinValue'
          end
          item
            Name = 'MaxValue'
            DataType = 'Float'
            Visibility = cvProtected
            ReadAccess = 'GetMaxValue'
            WriteAccess = 'SetMaxValue'
          end
          item
            Name = 'PasswordChar'
            DataType = 'string'
            ReadAccess = 'GetPasswordChar'
            WriteAccess = 'SetPasswordChar'
          end
          item
            Name = 'LookupItems'
            DataType = 'TStrings'
            ReadAccess = 'GetLookupItems'
          end
          item
            Name = 'IncrementalSearch'
            DataType = 'Boolean'
            ReadAccess = 'GetIncrementalSearch'
            WriteAccess = 'SetIncrementalSearch'
          end
          item
            Name = 'LookupItemsSorted'
            DataType = 'Boolean'
            ReadAccess = 'GetLookupItemsSorted'
            WriteAccess = 'SetLookupItemsSorted'
          end>
      end
      item
        Name = 'TEditAlignment'
        Methods = <
          item
            Name = 'GetHorz'
            ResultType = 'TAlignment'
            OnEval = dwsUnitControlsClassesTEditAlignmentMethodsGetHorzEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetHorz'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TAlignment'
              end>
            OnEval = dwsUnitControlsClassesTEditAlignmentMethodsSetHorzEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetVert'
            ResultType = 'TAlignmentVert'
            OnEval = dwsUnitControlsClassesTEditAlignmentMethodsGetVertEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetVert'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TAlignmentVert'
              end>
            OnEval = dwsUnitControlsClassesTEditAlignmentMethodsSetVertEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Horz'
            DataType = 'TAlignment'
            ReadAccess = 'GetHorz'
            WriteAccess = 'SetHorz'
          end
          item
            Name = 'Vert'
            DataType = 'TAlignmentVert'
            ReadAccess = 'GetVert'
            WriteAccess = 'SetVert'
          end>
      end
      item
        Name = 'TEdit'
        Ancestor = 'TCustomTextEdit'
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'AOwner'
                DataType = 'TComponent'
              end>
            OnEval = dwsUnitProjectClassesTEditControlConstructorsCreateEval
          end>
        Properties = <
          item
            Name = 'TextHint'
            DataType = 'string'
          end>
      end
      item
        Name = 'TPanel'
        Ancestor = 'TContainerControl'
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'AOwner'
                DataType = 'TComponent'
              end>
            OnEval = dwsUnitControlsClassesTPanelConstructorsCreateEval
          end>
        Properties = <
          item
            Name = 'AutoSize'
            DataType = 'boolean'
          end
          item
            Name = 'ParentBackground'
            DataType = 'boolean'
          end>
      end
      item
        Name = 'TButton'
        Ancestor = 'TCustomControl'
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'AOwner'
                DataType = 'TComponent'
              end>
            OnEval = dwsUnitControlsClassesTButtonConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'GetModalResult'
            ResultType = 'TModalResult'
            OnEval = dwsUnitControlsClassesTButtonMethodsGetModalResultEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetModalResult'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TModalResult'
              end>
            OnEval = dwsUnitControlsClassesTButtonMethodsSetModalResultEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetDescription'
            ResultType = 'string'
            OnEval = dwsUnitControlsClassesTButtonMethodsGetDescriptionEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetDescription'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTButtonMethodsSetDescriptionEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetKind'
            ResultType = 'TButtonKind'
            OnEval = dwsUnitControlsClassesTButtonMethodsGetKindEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetKind'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TButtonKind'
              end>
            OnEval = dwsUnitControlsClassesTButtonMethodsSetKindEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetTransparent'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTButtonMethodsGetTransparentEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetTransparent'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            OnEval = dwsUnitControlsClassesTButtonMethodsSetTransparentEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetDefault'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTButtonMethodsGetDefaultEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetDefault'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTButtonMethodsSetDefaultEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetCancel'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTButtonMethodsGetCancelEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetCancel'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTButtonMethodsSetCancelEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetImageOptions'
            ResultType = 'TButtonImageOptions'
            OnEval = dwsUnitControlsClassesTButtonMethodsGetImageOptionsEval
            Visibility = cvProtected
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'TabStop'
            DataType = 'boolean'
          end
          item
            Name = 'ModalResult'
            DataType = 'TModalResult'
            ReadAccess = 'GetModalResult'
            WriteAccess = 'SetModalResult'
          end
          item
            Name = 'Description'
            DataType = 'string'
            ReadAccess = 'GetDescription'
            WriteAccess = 'SetDescription'
          end
          item
            Name = 'Kind'
            DataType = 'TButtonKind'
            ReadAccess = 'GetKind'
            WriteAccess = 'SetKind'
          end
          item
            Name = 'Transparent'
            DataType = 'boolean'
            ReadAccess = 'GetTransparent'
            WriteAccess = 'SetTransparent'
          end
          item
            Name = 'Default'
            DataType = 'boolean'
            ReadAccess = 'GetDefault'
            WriteAccess = 'SetDefault'
          end
          item
            Name = 'Cancel'
            DataType = 'boolean'
            ReadAccess = 'GetCancel'
            WriteAccess = 'SetCancel'
          end
          item
            Name = 'ImageOptions'
            DataType = 'TButtonImageOptions'
            ReadAccess = 'GetImageOptions'
          end>
      end
      item
        Name = 'TButtonImageOptions'
        IsSealed = True
        IsAbstract = True
        Methods = <
          item
            Name = 'GetGlyph'
            ResultType = 'TSmartImage'
            OnEval = dwsUnitControlsClassesTButtonImageOptionsMethodsGetGlyphEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetLayout'
            ResultType = 'TButtonLayout'
            OnEval = dwsUnitControlsClassesTButtonImageOptionsMethodsGetLayoutEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetLayout'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TButtonLayout'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTButtonImageOptionsMethodsSetLayoutEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetMargin'
            ResultType = 'Integer'
            OnEval = dwsUnitControlsClassesTButtonImageOptionsMethodsGetMarginEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetMargin'
            Parameters = <
              item
                Name = 'value'
                DataType = 'Integer'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTButtonImageOptionsMethodsSetMarginEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetNumGlyphs'
            ResultType = 'integer'
            OnEval = dwsUnitControlsClassesTButtonImageOptionsMethodsGetNumGlyphsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetNumGlyphs'
            Parameters = <
              item
                Name = 'value'
                DataType = 'integer'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTButtonImageOptionsMethodsSetNumGlyphsEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetSpacing'
            ResultType = 'integer'
            OnEval = dwsUnitControlsClassesTButtonImageOptionsMethodsGetSpacingEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetSpacing'
            Parameters = <
              item
                Name = 'value'
                DataType = 'integer'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTButtonImageOptionsMethodsSetSpacingEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Glyph'
            DataType = 'TSmartImage'
            ReadAccess = 'GetGlyph'
          end
          item
            Name = 'Layout'
            DataType = 'TButtonLayout'
            ReadAccess = 'GetLayout'
            WriteAccess = 'SetLayout'
          end
          item
            Name = 'Margin'
            DataType = 'Integer'
            ReadAccess = 'GetMargin'
            WriteAccess = 'SetMargin'
          end
          item
            Name = 'NumGlyphs'
            DataType = 'integer'
            ReadAccess = 'GetNumGlyphs'
            WriteAccess = 'SetNumGlyphs'
          end
          item
            Name = 'Spacing'
            DataType = 'integer'
            ReadAccess = 'GetSpacing'
            WriteAccess = 'SetSpacing'
          end>
      end
      item
        Name = 'TLabel'
        Ancestor = 'TCustomEdit'
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'AOwner'
                DataType = 'TComponent'
              end>
            OnEval = dwsUnitControlsClassesTLabelConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'GetTransparent'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTLabelMethodsGetTransparentEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetTransparent'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTLabelMethodsSetTransparentEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetWordWrap'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTLabelMethodsGetWordWrapEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetWordWrap'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTLabelMethodsSetWordWrapEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetShowEndEllipsis'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTLabelMethodsGetShowEndEllipsisEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetShowEndEllipsis'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTLabelMethodsSetShowEndEllipsisEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetShowAccelChar'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTLabelMethodsGetShowAccelCharEval
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
            OnEval = dwsUnitControlsClassesTLabelMethodsSetShowAccelCharEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'AutoSize'
            DataType = 'boolean'
          end
          item
            Name = 'Transparent'
            DataType = 'boolean'
            ReadAccess = 'GetTransparent'
            WriteAccess = 'SetTransparent'
          end
          item
            Name = 'WordWrap'
            DataType = 'boolean'
            ReadAccess = 'GetWordWrap'
            WriteAccess = 'SetWordWrap'
          end
          item
            Name = 'ShowAccelChar'
            DataType = 'boolean'
            ReadAccess = 'GetShowAccelChar'
            WriteAccess = 'SetShowAccelChar'
          end
          item
            Name = 'ShowEndEllipsis'
            DataType = 'boolean'
            ReadAccess = 'GetShowEndEllipsis'
            WriteAccess = 'SetShowEndEllipsis'
          end>
      end
      item
        Name = 'TCheckBox'
        Ancestor = 'TCustomControl'
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'AOwner'
                DataType = 'TComponent'
              end>
            OnEval = dwsUnitControlsClassesTCheckBoxConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'GetChecked'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTCheckBoxMethodsGetCheckedEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetChecked'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            OnEval = dwsUnitControlsClassesTCheckBoxMethodsSetCheckedEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'TabStop'
            DataType = 'boolean'
          end
          item
            Name = 'Checked'
            DataType = 'boolean'
            ReadAccess = 'GetChecked'
            WriteAccess = 'SetChecked'
          end>
      end
      item
        Name = 'TRadioButton'
        Ancestor = 'TCustomControl'
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'AOwner'
                DataType = 'TComponent'
              end>
            OnEval = dwsUnitControlsClassesTRadioButtonConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'GetChecked'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTRadioButtonMethodsGetCheckedEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetChecked'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            OnEval = dwsUnitControlsClassesTRadioButtonMethodsSetCheckedEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetGroupIndex'
            ResultType = 'integer'
            OnEval = dwsUnitControlsClassesTRadioButtonMethodsGetGroupIndexEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetGroupIndex'
            Parameters = <
              item
                Name = 'value'
                DataType = 'integer'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTRadioButtonMethodsSetGroupIndexEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'TabStop'
            DataType = 'boolean'
          end
          item
            Name = 'Checked'
            DataType = 'boolean'
            ReadAccess = 'GetChecked'
            WriteAccess = 'SetChecked'
          end
          item
            Name = 'GroupIndex'
            DataType = 'integer'
            ReadAccess = 'GetGroupIndex'
            WriteAccess = 'SetGroupIndex'
          end>
      end
      item
        Name = 'TImage'
        Ancestor = 'TCustomControl'
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'AOwner'
                DataType = 'TComponent'
              end>
            OnEval = dwsUnitControlsClassesTImageConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'LoadFromFile'
            Parameters = <
              item
                Name = 'Filename'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTImageMethodsLoadFromFileEval
            Kind = mkProcedure
          end
          item
            Name = 'SaveToFile'
            Parameters = <
              item
                Name = 'Filename'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTImageMethodsSaveToFileEval
            Kind = mkProcedure
          end
          item
            Name = 'GetStretch'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTImageMethodsGetStretchEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetStretch'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            OnEval = dwsUnitControlsClassesTImageMethodsSetStretchEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetProportional'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTImageMethodsGetProportionalEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetProportional'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            OnEval = dwsUnitControlsClassesTImageMethodsSetProportionalEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetCenter'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTImageMethodsGetCenterEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetCenter'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            OnEval = dwsUnitControlsClassesTImageMethodsSetCenterEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'LoadFromStream'
            Parameters = <
              item
                Name = 'Stream'
                DataType = 'TStream'
              end>
            OnEval = dwsUnitControlsClassesTImageMethodsLoadFromStreamEval
            Kind = mkProcedure
          end
          item
            Name = 'SaveToStream'
            Parameters = <
              item
                Name = 'Stream'
                DataType = 'TStream'
              end>
            OnEval = dwsUnitControlsClassesTImageMethodsSaveToStreamEval
            Kind = mkProcedure
          end
          item
            Name = 'GetImage'
            ResultType = 'TGraphic'
            OnEval = dwsUnitControlsClassesTImageMethodsGetImageEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetImage'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TGraphic'
              end>
            OnEval = dwsUnitControlsClassesTImageMethodsSetImageEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'AutoSize'
            DataType = 'boolean'
          end
          item
            Name = 'Stretch'
            DataType = 'boolean'
            ReadAccess = 'GetStretch'
            WriteAccess = 'SetStretch'
          end
          item
            Name = 'Proportional'
            DataType = 'boolean'
            ReadAccess = 'GetProportional'
            WriteAccess = 'SetProportional'
          end
          item
            Name = 'Center'
            DataType = 'boolean'
            ReadAccess = 'GetCenter'
            WriteAccess = 'SetCenter'
          end
          item
            Name = 'Image'
            DataType = 'TGraphic'
            ReadAccess = 'GetImage'
            WriteAccess = 'SetImage'
          end>
      end
      item
        Name = 'TComboBox'
        Ancestor = 'TCustomTextEdit'
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'AOwner'
                DataType = 'TComponent'
              end>
            OnEval = dwsUnitControlsClassesTComboBoxConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'GetItems'
            ResultType = 'TStrings'
            OnEval = dwsUnitControlsClassesTComboBoxMethodsGetItemsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetItemIndex'
            ResultType = 'integer'
            OnEval = dwsUnitControlsClassesTComboBoxMethodsGetItemIndexEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetItemIndex'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'integer'
              end>
            OnEval = dwsUnitControlsClassesTComboBoxMethodsSetItemIndexEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetDropDownListStyle'
            ResultType = 'TEditDropDownListStyle'
            OnEval = dwsUnitControlsClassesTComboBoxMethodsGetDropDownListStyleEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetDropDownListStyle'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TEditDropDownListStyle'
              end>
            OnEval = dwsUnitControlsClassesTComboBoxMethodsSetDropDownListStyleEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetSorted'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTComboBoxMethodsGetSortedEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetSorted'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTComboBoxMethodsSetSortedEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'TextHint'
            DataType = 'string'
          end
          item
            Name = 'Items'
            DataType = 'TStrings'
            ReadAccess = 'GetItems'
          end
          item
            Name = 'ItemIndex'
            DataType = 'integer'
            ReadAccess = 'GetItemIndex'
            WriteAccess = 'SetItemIndex'
          end
          item
            Name = 'DropDownListStyle'
            DataType = 'TEditDropDownListStyle'
            ReadAccess = 'GetDropDownListStyle'
            WriteAccess = 'SetDropDownListStyle'
          end
          item
            Name = 'Sorted'
            DataType = 'boolean'
            ReadAccess = 'GetSorted'
            WriteAccess = 'SetSorted'
          end>
      end
      item
        Name = 'TMemo'
        Ancestor = 'TCustomTextEdit'
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'AOwner'
                DataType = 'TComponent'
              end>
            OnEval = dwsUnitControlsClassesTMemoConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'GetLines'
            ResultType = 'TStrings'
            OnEval = dwsUnitControlsClassesTMemoMethodsGetLinesEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetWordWrap'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTMemoMethodsGetWordWrapEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetWordWrap'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            OnEval = dwsUnitControlsClassesTMemoMethodsSetWordWrapEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetWantReturns'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTMemoMethodsGetWantReturnsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetWantReturns'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            OnEval = dwsUnitControlsClassesTMemoMethodsSetWantReturnsEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetWantTabs'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTMemoMethodsGetWantTabsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetWantTabs'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            OnEval = dwsUnitControlsClassesTMemoMethodsSetWantTabsEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Lines'
            DataType = 'TStrings'
            ReadAccess = 'GetLines'
          end
          item
            Name = 'WordWrap'
            DataType = 'boolean'
            ReadAccess = 'GetWordWrap'
            WriteAccess = 'SetWordWrap'
          end
          item
            Name = 'WantReturns'
            DataType = 'boolean'
          end
          item
            Name = 'WantTabs'
            DataType = 'boolean'
            ReadAccess = 'GetWantTabs'
            WriteAccess = 'SetWantTabs'
          end>
      end
      item
        Name = 'TDateEdit'
        Ancestor = 'TCustomTextEdit'
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'AOwner'
                DataType = 'TComponent'
              end>
            OnEval = dwsUnitControlsClassesTDateEditConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'GetValue'
            ResultType = 'Float'
            OnEval = dwsUnitControlsClassesTDateEditMethodsGetValueEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetValue'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Float'
              end>
            OnEval = dwsUnitControlsClassesTDateEditMethodsSetValueEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'TextHint'
            DataType = 'string'
          end
          item
            Name = 'Value'
            DataType = 'Float'
            ReadAccess = 'GetValue'
            WriteAccess = 'SetValue'
          end>
      end
      item
        Name = 'TCalcEdit'
        Ancestor = 'TCustomTextEdit'
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'AOwner'
                DataType = 'TComponent'
              end>
            OnEval = dwsUnitControlsClassesTCalcEditConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'GetPrecision'
            ResultType = 'integer'
            OnEval = dwsUnitControlsClassesTCalcEditMethodsGetPrecisionEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetPrecision'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'integer'
              end>
            OnEval = dwsUnitControlsClassesTCalcEditMethodsSetPrecisionEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'TextHint'
            DataType = 'string'
          end
          item
            Name = 'Precision'
            DataType = 'integer'
            ReadAccess = 'GetPrecision'
            WriteAccess = 'SetPrecision'
          end>
      end
      item
        Name = 'TNumberEdit'
        Ancestor = 'TCustomTextEdit'
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'AOwner'
                DataType = 'TComponent'
              end>
            OnEval = dwsUnitControlsClassesTNumberEditConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'GetValue'
            ResultType = 'Float'
            OnEval = dwsUnitControlsClassesTNumberEditMethodsGetValueEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetValue'
            Parameters = <
              item
                Name = 'value'
                DataType = 'Float'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTNumberEditMethodsSetValueEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetPrecision'
            ResultType = 'integer'
            OnEval = dwsUnitControlsClassesTNumberEditMethodsGetPrecisionEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetPrecision'
            Parameters = <
              item
                Name = 'value'
                DataType = 'integer'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTNumberEditMethodsSetPrecisionEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetUseThousandSeparator'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTNumberEditMethodsGetUseThousandSeparatorEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetUseThousandSeparator'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTNumberEditMethodsSetUseThousandSeparatorEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'TextHint'
            DataType = 'string'
          end
          item
            Name = 'Value'
            DataType = 'Float'
            ReadAccess = 'GetValue'
            WriteAccess = 'SetValue'
          end
          item
            Name = 'Precision'
            DataType = 'integer'
            ReadAccess = 'GetPrecision'
            WriteAccess = 'SetPrecision'
          end
          item
            Name = 'UseThousandSeparator'
            DataType = 'boolean'
            ReadAccess = 'GetUseThousandSeparator'
            WriteAccess = 'SetUseThousandSeparator'
          end
          item
            Name = 'MinValue'
            DataType = 'Float'
          end
          item
            Name = 'MaxValue'
            DataType = 'Float'
          end>
      end
      item
        Name = 'TSpinEdit'
        Ancestor = 'TCustomTextEdit'
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'AOwner'
                DataType = 'TComponent'
              end>
            OnEval = dwsUnitControlsClassesTSpinEditConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'GetValue'
            ResultType = 'Float'
            OnEval = dwsUnitControlsClassesTSpinEditMethodsGetValueEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetValue'
            Parameters = <
              item
                Name = 'value'
                DataType = 'Float'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTSpinEditMethodsSetValueEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetIncrement'
            ResultType = 'float'
            OnEval = dwsUnitControlsClassesTSpinEditMethodsGetIncrementEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetIncrement'
            Parameters = <
              item
                Name = 'value'
                DataType = 'float'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTSpinEditMethodsSetIncrementEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetLargeIncrement'
            ResultType = 'Float'
            OnEval = dwsUnitControlsClassesTSpinEditMethodsGetLargeIncrementEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetLargeIncrement'
            Parameters = <
              item
                Name = 'value'
                DataType = 'Float'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTSpinEditMethodsSetLargeIncrementEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetValueType'
            ResultType = 'TSpinEditValueType'
            OnEval = dwsUnitControlsClassesTSpinEditMethodsGetValueTypeEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetValueType'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TSpinEditValueType'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTSpinEditMethodsSetValueTypeEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Value'
            DataType = 'Float'
            ReadAccess = 'GetValue'
            WriteAccess = 'SetValue'
          end
          item
            Name = 'Increment'
            DataType = 'float'
            ReadAccess = 'GetIncrement'
            WriteAccess = 'SetIncrement'
          end
          item
            Name = 'LargeIncrement'
            DataType = 'Float'
            ReadAccess = 'GetLargeIncrement'
            WriteAccess = 'SetLargeIncrement'
          end
          item
            Name = 'ValueType'
            DataType = 'TSpinEditValueType'
            ReadAccess = 'GetValueType'
            WriteAccess = 'SetValueType'
          end
          item
            Name = 'MinValue'
            DataType = 'Float'
          end
          item
            Name = 'MaxValue'
            DataType = 'Float'
          end>
      end
      item
        Name = 'TGroupBox'
        Ancestor = 'TContainerControl'
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'AOwner'
                DataType = 'TComponent'
              end>
            OnEval = dwsUnitControlsClassesTGroupBoxConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'GetAlignment'
            ResultType = 'TCaptionAlignment'
            OnEval = dwsUnitControlsClassesTGroupBoxMethodsGetAlignmentEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetAlignment'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TCaptionAlignment'
              end>
            OnEval = dwsUnitControlsClassesTGroupBoxMethodsSetAlignmentEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Alignment'
            DataType = 'TCaptionAlignment'
            ReadAccess = 'GetAlignment'
            WriteAccess = 'SetAlignment'
          end>
      end
      item
        Name = 'TCheckGroup'
        Ancestor = 'TGroupBox'
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'AOwner'
                DataType = 'TComponent'
              end>
            OnEval = dwsUnitControlsClassesTCheckGroupConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'GetState'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'TCheckBoxState'
            OnEval = dwsUnitControlsClassesTCheckGroupMethodsGetStateEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetState'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end
              item
                Name = 'Value'
                DataType = 'TCheckBoxState'
              end>
            OnEval = dwsUnitControlsClassesTCheckGroupMethodsSetStateEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetAllowGrayed'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTCheckGroupMethodsGetAllowGrayedEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetAllowGrayed'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            OnEval = dwsUnitControlsClassesTCheckGroupMethodsSetAllowGrayedEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetLeftJustify'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTCheckGroupMethodsGetLeftJustifyEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetLeftJustify'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            OnEval = dwsUnitControlsClassesTCheckGroupMethodsSetLeftJustifyEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetItems'
            ResultType = 'TCheckGroupItems'
            OnEval = dwsUnitControlsClassesTCheckGroupMethodsGetItemsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetChecked'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTCheckGroupMethodsGetCheckedEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetChecked'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            OnEval = dwsUnitControlsClassesTCheckGroupMethodsSetCheckedEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'States'
            DataType = 'TCheckBoxState'
            ReadAccess = 'GetState'
            WriteAccess = 'SetState'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
          end
          item
            Name = 'AllowGrayed'
            DataType = 'boolean'
            ReadAccess = 'GetAllowGrayed'
            WriteAccess = 'SetAllowGrayed'
          end
          item
            Name = 'LeftJustify'
            DataType = 'boolean'
            ReadAccess = 'GetLeftJustify'
            WriteAccess = 'SetLeftJustify'
          end
          item
            Name = 'Items'
            DataType = 'TCheckGroupItems'
            ReadAccess = 'GetItems'
          end
          item
            Name = 'Checked'
            DataType = 'boolean'
            ReadAccess = 'GetChecked'
            WriteAccess = 'SetChecked'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
          end>
      end
      item
        Name = 'TCheckGroupItems'
        Ancestor = 'TCollection'
        Methods = <
          item
            Name = 'GetItem'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'TCheckGroupItem'
            OnEval = dwsUnitControlsClassesTCheckGroupItemsMethodsGetItemEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'Add'
            ResultType = 'TCheckGroupItem'
            OnEval = dwsUnitControlsClassesTCheckGroupItemsMethodsAddEval
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Items'
            DataType = 'TCheckGroupItem'
            ReadAccess = 'GetItem'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            IsDefault = True
          end>
      end
      item
        Name = 'TCaptionCollectionItem'
        IsAbstract = True
        Methods = <
          item
            Name = 'GetCaption'
            ResultType = 'string'
            OnEval = dwsUnitControlsClassesTCaptionCollectionItemMethodsGetCaptionEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetCaption'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTCaptionCollectionItemMethodsSetCaptionEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetTag'
            ResultType = 'integer'
            OnEval = dwsUnitControlsClassesTCaptionCollectionItemMethodsGetTagEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetTag'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'integer'
              end>
            OnEval = dwsUnitControlsClassesTCaptionCollectionItemMethodsSetTagEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Caption'
            DataType = 'string'
            ReadAccess = 'GetCaption'
            WriteAccess = 'SetCaption'
          end
          item
            Name = 'Tag'
            DataType = 'integer'
            ReadAccess = 'GetTag'
            WriteAccess = 'SetTag'
          end>
      end
      item
        Name = 'TCheckGroupItem'
        Ancestor = 'TCaptionCollectionItem'
        Methods = <
          item
            Name = 'GetEnabled'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTCheckGroupItemMethodsGetEnabledEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetEnabled'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            OnEval = dwsUnitControlsClassesTCheckGroupItemMethodsSetEnabledEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Enabled'
            DataType = 'boolean'
            ReadAccess = 'GetEnabled'
            WriteAccess = 'SetEnabled'
          end>
      end
      item
        Name = 'TEditButtons'
        Ancestor = 'TCollection'
        Methods = <
          item
            Name = 'Add'
            ResultType = 'TEditButton'
            OnEval = dwsUnitControlsClassesTEditButtonsMethodsAddEval
            Kind = mkFunction
          end
          item
            Name = 'GetItem'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'TEditButton'
            OnEval = dwsUnitControlsClassesTEditButtonsMethodsGetItemEval
            Visibility = cvProtected
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Items'
            DataType = 'TEditButton'
            ReadAccess = 'GetItem'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            IsDefault = True
          end>
      end
      item
        Name = 'TEditButton'
        Ancestor = 'TCollectionItem'
        IsSealed = True
        Methods = <
          item
            Name = 'GetAction'
            ResultType = 'TAction'
            OnEval = dwsUnitControlsClassesTEditButtonMethodsGetActionEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetAction'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TAction'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTEditButtonMethodsSetActionEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetCaption'
            ResultType = 'string'
            OnEval = dwsUnitControlsClassesTEditButtonMethodsGetCaptionEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetCaption'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTEditButtonMethodsSetCaptionEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetEnabled'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTEditButtonMethodsGetEnabledEval
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
            OnEval = dwsUnitControlsClassesTEditButtonMethodsSetEnabledEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetHint'
            ResultType = 'string'
            OnEval = dwsUnitControlsClassesTEditButtonMethodsGetHintEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetHint'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTEditButtonMethodsSetHintEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetImageIndex'
            ResultType = 'integer'
            OnEval = dwsUnitControlsClassesTEditButtonMethodsGetImageIndexEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetImageIndex'
            Parameters = <
              item
                Name = 'value'
                DataType = 'integer'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTEditButtonMethodsSetImageIndexEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetKind'
            ResultType = 'TEditButtonKind'
            OnEval = dwsUnitControlsClassesTEditButtonMethodsGetKindEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetKind'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TEditButtonKind'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTEditButtonMethodsSetKindEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetLeftAlignment'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTEditButtonMethodsGetLeftAlignmentEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetLeftAlignment'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTEditButtonMethodsSetLeftAlignmentEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetVisible'
            ResultType = 'boolean'
            OnEval = dwsUnitControlsClassesTEditButtonMethodsGetVisibleEval
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
            OnEval = dwsUnitControlsClassesTEditButtonMethodsSetVisibleEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetWidth'
            ResultType = 'integer'
            OnEval = dwsUnitControlsClassesTEditButtonMethodsGetWidthEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetWidth'
            Parameters = <
              item
                Name = 'value'
                DataType = 'integer'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTEditButtonMethodsSetWidthEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetTextAlignment'
            ResultType = 'TAlignment'
            OnEval = dwsUnitControlsClassesTEditButtonMethodsGetTextAlignmentEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetTextAlignment'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TAlignment'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitControlsClassesTEditButtonMethodsSetTextAlignmentEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetGlyph'
            ResultType = 'TSmartImage'
            OnEval = dwsUnitControlsClassesTEditButtonMethodsGetGlyphEval
            Visibility = cvProtected
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Action'
            DataType = 'TAction'
            ReadAccess = 'GetAction'
            WriteAccess = 'SetAction'
          end
          item
            Name = 'Caption'
            DataType = 'string'
            ReadAccess = 'GetCaption'
            WriteAccess = 'SetCaption'
          end
          item
            Name = 'Enabled'
            DataType = 'boolean'
            ReadAccess = 'GetEnabled'
            WriteAccess = 'SetEnabled'
          end
          item
            Name = 'Hint'
            DataType = 'string'
            ReadAccess = 'GetHint'
            WriteAccess = 'SetHint'
          end
          item
            Name = 'ImageIndex'
            DataType = 'integer'
            ReadAccess = 'GetImageIndex'
            WriteAccess = 'SetImageIndex'
          end
          item
            Name = 'Kind'
            DataType = 'TEditButtonKind'
            ReadAccess = 'GetKind'
            WriteAccess = 'SetKind'
          end
          item
            Name = 'LeftAlignment'
            DataType = 'boolean'
            ReadAccess = 'GetLeftAlignment'
            WriteAccess = 'SetLeftAlignment'
          end
          item
            Name = 'Visible'
            DataType = 'boolean'
            ReadAccess = 'GetVisible'
            WriteAccess = 'SetVisible'
          end
          item
            Name = 'Width'
            DataType = 'integer'
            ReadAccess = 'GetWidth'
            WriteAccess = 'SetWidth'
          end
          item
            Name = 'TextAlignment'
            DataType = 'TAlignment'
            ReadAccess = 'GetTextAlignment'
            WriteAccess = 'SetTextAlignment'
          end
          item
            Name = 'Glyph'
            DataType = 'TSmartImage'
            ReadAccess = 'GetGlyph'
          end>
      end>
    Constants = <
      item
        Name = 'crDefault'
        DataType = 'TCursor'
        Value = 0
      end
      item
        Name = 'crNone'
        DataType = 'TCursor'
        Value = -1
      end
      item
        Name = 'crArrow'
        DataType = 'TCursor'
        Value = -2
      end
      item
        Name = 'crCross'
        DataType = 'TCursor'
        Value = -3
      end
      item
        Name = 'crIBeam'
        DataType = 'TCursor'
        Value = -4
      end
      item
        Name = 'crSize'
        DataType = 'TCursor'
        Value = -22
      end
      item
        Name = 'crSizeNESW'
        DataType = 'TCursor'
        Value = -6
      end
      item
        Name = 'crSizeNS'
        DataType = 'TCursor'
        Value = -7
      end
      item
        Name = 'crSizeNWSE'
        DataType = 'TCursor'
        Value = -8
      end
      item
        Name = 'crSizeWE'
        DataType = 'TCursor'
        Value = -9
      end
      item
        Name = 'crUpArrow'
        DataType = 'TCursor'
        Value = -10
      end
      item
        Name = 'crHourGlass'
        DataType = 'TCursor'
        Value = -11
      end
      item
        Name = 'crDrag'
        DataType = 'TCursor'
        Value = -12
      end
      item
        Name = 'crNoDrop'
        DataType = 'TCursor'
        Value = -13
      end
      item
        Name = 'crHSplit'
        DataType = 'TCursor'
        Value = -14
      end
      item
        Name = 'crVSplit'
        DataType = 'TCursor'
        Value = -15
      end
      item
        Name = 'crMultiDrag'
        DataType = 'TCursor'
        Value = -16
      end
      item
        Name = 'crNo'
        DataType = 'TCursor'
        Value = -18
      end
      item
        Name = 'crAppStart'
        DataType = 'TCursor'
        Value = -19
      end
      item
        Name = 'crHelp'
        DataType = 'TCursor'
        Value = -20
      end
      item
        Name = 'crHandPoint'
        DataType = 'TCursor'
        Value = -21
      end
      item
        Name = 'crSizeAll'
        DataType = 'TCursor'
        Value = -22
      end>
    Dependencies.Strings = (
      'System.Classes'
      'System.Graphics'
      'System.UI.ActionList')
    Enumerations = <
      item
        Name = 'TAlign'
        Elements = <
          item
            Name = 'alNone'
          end
          item
            Name = 'alTop'
          end
          item
            Name = 'alBottom'
          end
          item
            Name = 'alLeft'
          end
          item
            Name = 'alRight'
          end
          item
            Name = 'alClient'
          end>
      end
      item
        Name = 'TModalResult'
        Elements = <
          item
            Name = 'mrNone'
          end
          item
            Name = 'mrOK'
          end
          item
            Name = 'mrCancel'
          end
          item
            Name = 'mrAbort'
          end
          item
            Name = 'mrRetry'
          end
          item
            Name = 'mrIgnore'
          end
          item
            Name = 'mrYes'
          end
          item
            Name = 'mrNo'
          end
          item
            Name = 'mrAll'
          end
          item
            Name = 'mrNoToAll'
          end
          item
            Name = 'mrYesToAll'
          end
          item
            Name = 'mrClose'
          end>
      end
      item
        Name = 'TAlignment'
        Elements = <
          item
            Name = 'taLeftJustify'
          end
          item
            Name = 'taRightJustify'
          end
          item
            Name = 'taCenter'
          end>
      end
      item
        Name = 'TAlignmentVert'
        Elements = <
          item
            Name = 'tavTop'
          end
          item
            Name = 'tavCenter'
          end
          item
            Name = 'tavBottom'
          end>
      end
      item
        Name = 'TEditDropDownListStyle'
        Elements = <
          item
            Name = 'lsEditFixedList'
          end
          item
            Name = 'lsEditList'
          end
          item
            Name = 'lsFixedList'
          end>
      end
      item
        Name = 'TButtonKind'
        Elements = <
          item
            Name = 'bkStandard'
          end
          item
            Name = 'bkDropDown'
          end
          item
            Name = 'bkDropDownButton'
          end
          item
            Name = 'bkCommandLink'
          end>
      end
      item
        Name = 'TCaptionAlignment'
        Elements = <
          item
            Name = 'alTopLeft'
          end
          item
            Name = 'alTopCenter'
          end
          item
            Name = 'alTopRight'
          end
          item
            Name = 'alBottomLeft'
          end
          item
            Name = 'alBottomCenter'
          end
          item
            Name = 'alBottomRight'
          end
          item
            Name = 'alLeftTop'
          end
          item
            Name = 'alLeftCenter'
          end
          item
            Name = 'alLeftBottom'
          end
          item
            Name = 'alRightTop'
          end
          item
            Name = 'alRightCenter'
          end
          item
            Name = 'alRightBottom'
          end
          item
            Name = 'alCenterCenter'
          end>
      end
      item
        Name = 'TCheckBoxState'
        Elements = <
          item
            Name = 'cbsUnchecked'
          end
          item
            Name = 'cbsChecked'
          end
          item
            Name = 'cbsGrayed'
          end>
      end
      item
        Name = 'TEditCharCase'
        Elements = <
          item
            Name = 'ecNormal'
          end
          item
            Name = 'ecUpperCase'
          end
          item
            Name = 'ecLowerCase'
          end>
      end
      item
        Name = 'TFormBorderStyle'
        Elements = <
          item
            Name = 'bsNone'
          end
          item
            Name = 'bsSingle'
          end
          item
            Name = 'bsSizeable'
          end
          item
            Name = 'bsDialog'
          end
          item
            Name = 'bsToolWindow'
          end
          item
            Name = 'bsSizeToolWin'
          end>
      end
      item
        Name = 'TWindowState'
        Elements = <
          item
            Name = 'wsNormal'
          end
          item
            Name = 'wsMinimized'
          end
          item
            Name = 'wsMaximized'
          end>
      end
      item
        Name = 'TFormPosition'
        Elements = <
          item
            Name = 'poDesigned'
          end
          item
            Name = 'poDefault'
          end
          item
            Name = 'poDefaultPosOnly'
          end
          item
            Name = 'poDefaultSizeOnly'
          end
          item
            Name = 'poScreenCenter'
          end
          item
            Name = 'poDesktopCenter'
          end
          item
            Name = 'poMainFormCenter'
          end
          item
            Name = 'poOwnerFormCenter'
          end>
      end
      item
        Name = 'TEditButtonKind'
        Elements = <
          item
            Name = 'ebkEllipsis'
          end
          item
            Name = 'ebkDown'
          end
          item
            Name = 'ebkGlyph'
          end
          item
            Name = 'ebkText'
          end>
      end
      item
        Name = 'TSpinEditValueType'
        Elements = <
          item
            Name = 'ValueTypeInteger'
          end
          item
            Name = 'ValueTypeFloat'
          end>
      end
      item
        Name = 'TButtonLayout'
        Elements = <
          item
            Name = 'blGlyphLeft'
          end
          item
            Name = 'blGlyphRight'
          end
          item
            Name = 'blGlyphTop'
          end
          item
            Name = 'blGlyphBottom'
          end>
      end>
    Functions = <
      item
        Name = 'ShortCutToText'
        Parameters = <
          item
            Name = 'ShortCut'
            DataType = 'TShortCut'
          end>
        ResultType = 'string'
        OnEval = dwsUnitControlsFunctionsShortCutToTextEval
      end
      item
        Name = 'TextToShortCut'
        Parameters = <
          item
            Name = 'Text'
            DataType = 'string'
            IsVarParam = True
            IsWritable = False
          end>
        ResultType = 'TShortCut'
        OnEval = dwsUnitControlsFunctionsTextToShortCutEval
      end>
    Delegates = <
      item
        Name = 'TControlNotifyEvent'
        Parameters = <
          item
            Name = 'Sender'
            DataType = 'TControl'
          end>
      end
      item
        Name = 'TKeypressEvent'
        Parameters = <
          item
            Name = 'Sender'
            DataType = 'TControl'
          end
          item
            Name = 'Key'
            DataType = 'String'
            IsVarParam = True
          end>
      end
      item
        Name = 'TEditButtonClickEvent'
        Parameters = <
          item
            Name = 'Sender'
            DataType = 'TControl'
          end
          item
            Name = 'AButtonIndex'
            DataType = 'integer'
          end>
      end>
    Synonyms = <
      item
        Name = 'TCursor'
        DataType = 'Integer'
      end
      item
        Name = 'TShortCut'
        DataType = 'Integer'
      end>
    UnitName = 'System.UI.Controls'
    StaticSymbols = False
    Left = 92
    Top = 48
  end
end
