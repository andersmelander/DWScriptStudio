object DataModuleUserInterface: TDataModuleUserInterface
  Height = 287
  Width = 402
  object dwsUnitControls: TdwsUnit
    Classes = <
      item
        Name = 'TControlOffset'
        IsAbstract = True
        IsInternal = True
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlOffsetMethodsSetLeftEval
          end
          item
            Name = 'GetLeft'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTControlOffsetMethodsGetLeftEval
          end
          item
            Name = 'SetTop'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'integer'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlOffsetMethodsSetTopEval
          end
          item
            Name = 'GetTop'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTControlOffsetMethodsGetTopEval
          end
          item
            Name = 'SetRight'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'integer'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlOffsetMethodsSetRightEval
          end
          item
            Name = 'GetRight'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTControlOffsetMethodsGetRightEval
          end
          item
            Name = 'SetBottom'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'integer'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlOffsetMethodsSetBottomEval
          end
          item
            Name = 'GetBottom'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTControlOffsetMethodsGetBottomEval
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
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlOffsetMethodsSetBoundsEval
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
        IsInternal = True
      end
      item
        Name = 'TControlPadding'
        Ancestor = 'TControlOffset'
        IsInternal = True
      end
      item
        Name = 'TSizeConstraints'
        IsInternal = True
        Methods = <
          item
            Name = 'GetConstraint'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTSizeConstraintsMethodsGetConstraintEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTSizeConstraintsMethodsSetConstraintEval
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
        IsInternal = True
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProjectClassesTControlMethodsGetLeftEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitProjectClassesTControlMethodsSetLeftEval
          end
          item
            Name = 'GetTop'
            ResultType = 'Integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProjectClassesTControlMethodsGetTopEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitProjectClassesTControlMethodsSetTopEval
          end
          item
            Name = 'GetWidth'
            ResultType = 'Integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProjectClassesTControlMethodsGetWidthEval
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
            OnEval = dwsUnitProjectClassesTControlMethodsSetWidthEval
          end
          item
            Name = 'GetHeight'
            ResultType = 'Integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProjectClassesTControlMethodsGetHeightEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitProjectClassesTControlMethodsSetHeightEval
          end
          item
            Name = 'GetVisible'
            ResultType = 'Boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProjectClassesTControlMethodsGetVisibleEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitProjectClassesTControlMethodsSetVisibleEval
          end
          item
            Name = 'GetText'
            ResultType = 'String'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProjectClassesTControlMethodsGetTextEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitProjectClassesTControlMethodsSetTextEval
          end
          item
            Name = 'GetColor'
            ResultType = 'TColor'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTControlMethodsGetColorEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlMethodsSetColorEval
          end
          item
            Name = 'GetCursor'
            ResultType = 'Integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTControlMethodsGetCursorEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlMethodsSetCursorEval
          end
          item
            Name = 'GetParentFont'
            ResultType = 'Boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTControlMethodsGetParentFontEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlMethodsSetParentFontEval
          end
          item
            Name = 'GetHint'
            ResultType = 'String'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTControlMethodsGetHintEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlMethodsSetHintEval
          end
          item
            Name = 'GetParentColor'
            ResultType = 'Boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTControlMethodsGetParentColorEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlMethodsSetParentColorEval
          end
          item
            Name = 'GetAutoSize'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTControlMethodsGetAutoSizeEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlMethodsSetAutoSizeEval
          end
          item
            Name = 'GetConstraints'
            ResultType = 'TSizeConstraints'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTControlMethodsGetConstraintsEval
          end
          item
            Name = 'GetAlign'
            ResultType = 'TAlign'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProjectClassesTControlMethodsGetAlignEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitProjectClassesTControlMethodsSetAlignEval
          end
          item
            Name = 'GetParent'
            ResultType = 'TContainerControl'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProjectClassesTControlMethodsGetParentEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitProjectClassesTControlMethodsSetParentEval
          end
          item
            Name = 'GetShowHint'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTControlMethodsGetShowHintEval
          end
          item
            Name = 'SetShowHint'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlMethodsSetShowHintEval
          end
          item
            Name = 'GetParentShowHint'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTControlMethodsGetParentShowHintEval
          end
          item
            Name = 'SetParentShowHint'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlMethodsSetParentShowHintEval
          end
          item
            Name = 'GetEnabled'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTControlMethodsGetEnabledEval
          end
          item
            Name = 'SetEnabled'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlMethodsSetEnabledEval
          end
          item
            Name = 'GetTabStop'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTControlMethodsGetTabStopEval
          end
          item
            Name = 'SetTabStop'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlMethodsSetTabStopEval
          end
          item
            Name = 'SetOnClick'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TControlNotifyEvent'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlMethodsSetOnClickEval
          end
          item
            Name = 'SetOnDblClick'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TControlNotifyEvent'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlMethodsSetOnDblClickEval
          end
          item
            Name = 'SetOnEnter'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TControlNotifyEvent'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlMethodsSetOnEnterEval
          end
          item
            Name = 'SetOnExit'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TControlNotifyEvent'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlMethodsSetOnExitEval
          end
          item
            Name = 'SetOnKeypress'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TKeypressEvent'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlMethodsSetOnKeypressEval
          end
          item
            Name = 'GetFont'
            ResultType = 'TFont'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTControlMethodsGetFontEval
          end
          item
            Name = 'SetFont'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TFont'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlMethodsSetFontEval
          end
          item
            Name = 'GetMargins'
            ResultType = 'TControlMargin'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTControlMethodsGetMarginsEval
          end
          item
            Name = 'GetAlignWithMargins'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTControlMethodsGetAlignWithMarginsEval
          end
          item
            Name = 'SetAlignWithMargins'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlMethodsSetAlignWithMarginsEval
          end
          item
            Name = 'GetAction'
            ResultType = 'TAction'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTControlMethodsGetActionEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlMethodsSetActionEval
          end
          item
            Name = 'GetParentBackground'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTControlMethodsGetParentBackgroundEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlMethodsSetParentBackgroundEval
          end
          item
            Name = 'Show'
            Kind = mkProcedure
            OnEval = dwsUnitProjectClassesTControlMethodsShowEval
          end
          item
            Name = 'Hide'
            Kind = mkProcedure
            OnEval = dwsUnitProjectClassesTControlMethodsHideEval
          end
          item
            Name = 'Update'
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlMethodsUpdateEval
          end
          item
            Name = 'Repaint'
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlMethodsRepaintEval
          end
          item
            Name = 'Refresh'
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlMethodsRefreshEval
          end
          item
            Name = 'Invalidate'
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlMethodsInvalidateEval
          end
          item
            Name = 'Click'
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlMethodsClickEval
          end
          item
            Name = 'GetBoundsRect'
            ResultType = 'TRect'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTControlMethodsGetBoundsRectEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTControlMethodsSetBoundsRectEval
          end
          item
            Name = 'GetClientRect'
            ResultType = 'TRect'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTControlMethodsGetClientRectEval
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
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTControlMethodsClientToScreenEval
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
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTControlMethodsClientToScreenRectEval
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
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTControlMethodsScreenToClientEval
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
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTControlMethodsScreenToClientRectEval
          end
          item
            Name = 'GetUserInterfaceAutomation'
            ResultType = 'TObject'
            Attributes = [maVirtual]
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTControlMethodsGetUserInterfaceAutomationEval
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
        IsInternal = True
        Methods = <
          item
            Name = 'SetFocus'
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCustomControlMethodsSetFocusEval
          end
          item
            Name = 'CanFocus'
            ResultType = 'boolean'
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCustomControlMethodsCanFocusEval
          end
          item
            Name = 'Focused'
            ResultType = 'Boolean'
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCustomControlMethodsFocusedEval
          end
          item
            Name = 'GetHandle'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCustomControlMethodsGetHandleEval
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
            Visibility = cvProtected
            Kind = mkClassMethod
            OnEval = dwsUnitControlsClassesTCustomControlMethodsPostMessageEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCustomControlMethodsPostMessageSelfEval
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
        IsInternal = True
        Methods = <
          item
            Name = 'GetCount'
            ResultType = 'Integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProjectClassesTControlListMethodsGetCountEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProjectClassesTControlListMethodsGetItemEval
          end
          item
            Name = 'Clear'
            Kind = mkProcedure
            OnEval = dwsUnitProjectClassesTControlListMethodsClearEval
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
        IsInternal = True
        Methods = <
          item
            Name = 'GetControls'
            ResultType = 'TControlList'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProjectClassesTContainerControlMethodsGetControlsEval
          end
          item
            Name = 'GetPadding'
            ResultType = 'TControlPadding'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTContainerControlMethodsGetPaddingEval
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
            Kind = mkFunction
            OnEval = dwsUnitProjectClassesTCustomFormMethodsShowModalEval
          end
          item
            Name = 'Close'
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCustomFormMethodsCloseEval
          end
          item
            Name = 'GetModalResult'
            ResultType = 'TModalResult'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCustomFormMethodsGetModalResultEval
          end
          item
            Name = 'SetModalResult'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TModalResult'
              end>
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCustomFormMethodsSetModalResultEval
          end
          item
            Name = 'GetStayOnTop'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCustomFormMethodsGetStayOnTopEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCustomFormMethodsSetStayOnTopEval
          end
          item
            Name = 'GetActive'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCustomFormMethodsGetActiveEval
          end
          item
            Name = 'GetBorderStyle'
            ResultType = 'TFormBorderStyle'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCustomFormMethodsGetBorderStyleEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCustomFormMethodsSetBorderStyleEval
          end
          item
            Name = 'GetKeyPreview'
            ResultType = 'Boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCustomFormMethodsGetKeyPreviewEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCustomFormMethodsSetKeyPreviewEval
          end
          item
            Name = 'GetWindowState'
            ResultType = 'TWindowState'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCustomFormMethodsGetWindowStateEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCustomFormMethodsSetWindowStateEval
          end
          item
            Name = 'GetPosition'
            ResultType = 'TFormPosition'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCustomFormMethodsGetPositionEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCustomFormMethodsSetPositionEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCustomFormMethodsSetOnShowEval
          end>
        Properties = <
          item
            Name = 'AutoSize'
          end
          item
            Name = 'OnEnter'
          end
          item
            Name = 'OnExit'
          end
          item
            Name = 'OnKeypress'
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTFormMethodsSetOnAfterShowEval
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
        IsInternal = True
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCustomEditMethodsGetReadOnlyEval
          end
          item
            Name = 'SetReadOnly'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCustomEditMethodsSetReadOnlyEval
          end
          item
            Name = 'GetTextHint'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCustomEditMethodsGetTextHintEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCustomEditMethodsSetTextHintEval
          end
          item
            Name = 'GetAlignment'
            ResultType = 'TEditAlignment'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCustomEditMethodsGetAlignmentEval
          end
          item
            Name = 'SetOnChange'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TControlNotifyEvent'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCustomEditMethodsSetOnChangeEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCustomEditMethodsSetOnChangedEval
          end
          item
            Name = 'GetUseLeftAlignmentOnEditing'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCustomEditMethodsGetUseLeftAlignmentOnEditingEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCustomEditMethodsSetUseLeftAlignmentOnEditingEval
          end
          item
            Name = 'GetButtons'
            ResultType = 'TEditButtons'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCustomEditMethodsGetButtonsEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCustomEditMethodsSetOnButtonClickEval
          end>
        Properties = <
          item
            Name = 'Text'
          end
          item
            Name = 'OnEnter'
          end
          item
            Name = 'OnExit'
          end
          item
            Name = 'OnKeypress'
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
        IsInternal = True
        Methods = <
          item
            Name = 'GetDisplayFormat'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsGetDisplayFormatEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsSetDisplayFormatEval
          end
          item
            Name = 'GetEditFormat'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsGetEditFormatEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsSetEditFormatEval
          end
          item
            Name = 'GetCharCase'
            ResultType = 'TEditCharCase'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsGetCharCaseEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsSetCharCaseEval
          end
          item
            Name = 'GetMinValue'
            ResultType = 'Float'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsGetMinValueEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsSetMinValueEval
          end
          item
            Name = 'GetMaxValue'
            ResultType = 'Float'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsGetMaxValueEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsSetMaxValueEval
          end
          item
            Name = 'GetPasswordChar'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsGetPasswordCharEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsSetPasswordCharEval
          end
          item
            Name = 'GetLookupItems'
            ResultType = 'TStrings'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsGetLookupItemsEval
          end
          item
            Name = 'GetIncrementalSearch'
            ResultType = 'Boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsGetIncrementalSearchEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsSetIncrementalSearchEval
          end
          item
            Name = 'GetLookupItemsSorted'
            ResultType = 'Boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsGetLookupItemsSortedEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCustomTextEditMethodsSetLookupItemsSortedEval
          end>
        Properties = <
          item
            Name = 'TabStop'
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
        IsInternal = True
        Methods = <
          item
            Name = 'GetHorz'
            ResultType = 'TAlignment'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTEditAlignmentMethodsGetHorzEval
          end
          item
            Name = 'SetHorz'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TAlignment'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTEditAlignmentMethodsSetHorzEval
          end
          item
            Name = 'GetVert'
            ResultType = 'TAlignmentVert'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTEditAlignmentMethodsGetVertEval
          end
          item
            Name = 'SetVert'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TAlignmentVert'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTEditAlignmentMethodsSetVertEval
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
          end
          item
            Name = 'ParentBackground'
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTButtonMethodsGetModalResultEval
          end
          item
            Name = 'SetModalResult'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TModalResult'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTButtonMethodsSetModalResultEval
          end
          item
            Name = 'GetDescription'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTButtonMethodsGetDescriptionEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTButtonMethodsSetDescriptionEval
          end
          item
            Name = 'GetKind'
            ResultType = 'TButtonKind'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTButtonMethodsGetKindEval
          end
          item
            Name = 'SetKind'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TButtonKind'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTButtonMethodsSetKindEval
          end
          item
            Name = 'GetTransparent'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTButtonMethodsGetTransparentEval
          end
          item
            Name = 'SetTransparent'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTButtonMethodsSetTransparentEval
          end
          item
            Name = 'GetDefault'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTButtonMethodsGetDefaultEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTButtonMethodsSetDefaultEval
          end
          item
            Name = 'GetCancel'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTButtonMethodsGetCancelEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTButtonMethodsSetCancelEval
          end
          item
            Name = 'GetImageOptions'
            ResultType = 'TButtonImageOptions'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTButtonMethodsGetImageOptionsEval
          end>
        Properties = <
          item
            Name = 'TabStop'
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
        IsInternal = True
        Methods = <
          item
            Name = 'GetGlyph'
            ResultType = 'TSmartImage'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTButtonImageOptionsMethodsGetGlyphEval
          end
          item
            Name = 'GetLayout'
            ResultType = 'TButtonLayout'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTButtonImageOptionsMethodsGetLayoutEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTButtonImageOptionsMethodsSetLayoutEval
          end
          item
            Name = 'GetMargin'
            ResultType = 'Integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTButtonImageOptionsMethodsGetMarginEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTButtonImageOptionsMethodsSetMarginEval
          end
          item
            Name = 'GetNumGlyphs'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTButtonImageOptionsMethodsGetNumGlyphsEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTButtonImageOptionsMethodsSetNumGlyphsEval
          end
          item
            Name = 'GetSpacing'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTButtonImageOptionsMethodsGetSpacingEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTButtonImageOptionsMethodsSetSpacingEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTLabelMethodsGetTransparentEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTLabelMethodsSetTransparentEval
          end
          item
            Name = 'GetWordWrap'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTLabelMethodsGetWordWrapEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTLabelMethodsSetWordWrapEval
          end
          item
            Name = 'GetShowEndEllipsis'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTLabelMethodsGetShowEndEllipsisEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTLabelMethodsSetShowEndEllipsisEval
          end
          item
            Name = 'GetShowAccelChar'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTLabelMethodsGetShowAccelCharEval
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
            OnEval = dwsUnitControlsClassesTLabelMethodsSetShowAccelCharEval
          end>
        Properties = <
          item
            Name = 'AutoSize'
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCheckBoxMethodsGetCheckedEval
          end
          item
            Name = 'SetChecked'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCheckBoxMethodsSetCheckedEval
          end>
        Properties = <
          item
            Name = 'TabStop'
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTRadioButtonMethodsGetCheckedEval
          end
          item
            Name = 'SetChecked'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTRadioButtonMethodsSetCheckedEval
          end
          item
            Name = 'GetGroupIndex'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTRadioButtonMethodsGetGroupIndexEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTRadioButtonMethodsSetGroupIndexEval
          end>
        Properties = <
          item
            Name = 'TabStop'
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
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTImageMethodsLoadFromFileEval
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
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTImageMethodsSaveToFileEval
          end
          item
            Name = 'GetStretch'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTImageMethodsGetStretchEval
          end
          item
            Name = 'SetStretch'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTImageMethodsSetStretchEval
          end
          item
            Name = 'GetProportional'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTImageMethodsGetProportionalEval
          end
          item
            Name = 'SetProportional'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTImageMethodsSetProportionalEval
          end
          item
            Name = 'GetCenter'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTImageMethodsGetCenterEval
          end
          item
            Name = 'SetCenter'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTImageMethodsSetCenterEval
          end
          item
            Name = 'LoadFromStream'
            Parameters = <
              item
                Name = 'Stream'
                DataType = 'TStream'
              end>
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTImageMethodsLoadFromStreamEval
          end
          item
            Name = 'SaveToStream'
            Parameters = <
              item
                Name = 'Stream'
                DataType = 'TStream'
              end>
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTImageMethodsSaveToStreamEval
          end
          item
            Name = 'GetImage'
            ResultType = 'TGraphic'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTImageMethodsGetImageEval
          end
          item
            Name = 'SetImage'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TGraphic'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTImageMethodsSetImageEval
          end>
        Properties = <
          item
            Name = 'AutoSize'
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTComboBoxMethodsGetItemsEval
          end
          item
            Name = 'GetItemIndex'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTComboBoxMethodsGetItemIndexEval
          end
          item
            Name = 'SetItemIndex'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'integer'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTComboBoxMethodsSetItemIndexEval
          end
          item
            Name = 'GetDropDownListStyle'
            ResultType = 'TEditDropDownListStyle'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTComboBoxMethodsGetDropDownListStyleEval
          end
          item
            Name = 'SetDropDownListStyle'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TEditDropDownListStyle'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTComboBoxMethodsSetDropDownListStyleEval
          end
          item
            Name = 'GetSorted'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTComboBoxMethodsGetSortedEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTComboBoxMethodsSetSortedEval
          end>
        Properties = <
          item
            Name = 'TextHint'
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTMemoMethodsGetLinesEval
          end
          item
            Name = 'GetWordWrap'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTMemoMethodsGetWordWrapEval
          end
          item
            Name = 'SetWordWrap'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTMemoMethodsSetWordWrapEval
          end
          item
            Name = 'GetWantReturns'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTMemoMethodsGetWantReturnsEval
          end
          item
            Name = 'SetWantReturns'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTMemoMethodsSetWantReturnsEval
          end
          item
            Name = 'GetWantTabs'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTMemoMethodsGetWantTabsEval
          end
          item
            Name = 'SetWantTabs'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTMemoMethodsSetWantTabsEval
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
            ReadAccess = 'GetWantReturns'
            WriteAccess = 'SetWantReturns'
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTDateEditMethodsGetValueEval
          end
          item
            Name = 'SetValue'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Float'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTDateEditMethodsSetValueEval
          end>
        Properties = <
          item
            Name = 'TextHint'
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCalcEditMethodsGetPrecisionEval
          end
          item
            Name = 'SetPrecision'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'integer'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCalcEditMethodsSetPrecisionEval
          end>
        Properties = <
          item
            Name = 'TextHint'
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTNumberEditMethodsGetValueEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTNumberEditMethodsSetValueEval
          end
          item
            Name = 'GetPrecision'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTNumberEditMethodsGetPrecisionEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTNumberEditMethodsSetPrecisionEval
          end
          item
            Name = 'GetUseThousandSeparator'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTNumberEditMethodsGetUseThousandSeparatorEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTNumberEditMethodsSetUseThousandSeparatorEval
          end>
        Properties = <
          item
            Name = 'TextHint'
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
          end
          item
            Name = 'MaxValue'
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTSpinEditMethodsGetValueEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTSpinEditMethodsSetValueEval
          end
          item
            Name = 'GetIncrement'
            ResultType = 'float'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTSpinEditMethodsGetIncrementEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTSpinEditMethodsSetIncrementEval
          end
          item
            Name = 'GetLargeIncrement'
            ResultType = 'Float'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTSpinEditMethodsGetLargeIncrementEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTSpinEditMethodsSetLargeIncrementEval
          end
          item
            Name = 'GetValueType'
            ResultType = 'TSpinEditValueType'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTSpinEditMethodsGetValueTypeEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTSpinEditMethodsSetValueTypeEval
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
          end
          item
            Name = 'MaxValue'
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTGroupBoxMethodsGetAlignmentEval
          end
          item
            Name = 'SetAlignment'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TCaptionAlignment'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTGroupBoxMethodsSetAlignmentEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCheckGroupMethodsGetStateEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCheckGroupMethodsSetStateEval
          end
          item
            Name = 'GetAllowGrayed'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCheckGroupMethodsGetAllowGrayedEval
          end
          item
            Name = 'SetAllowGrayed'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCheckGroupMethodsSetAllowGrayedEval
          end
          item
            Name = 'GetLeftJustify'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCheckGroupMethodsGetLeftJustifyEval
          end
          item
            Name = 'SetLeftJustify'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCheckGroupMethodsSetLeftJustifyEval
          end
          item
            Name = 'GetItems'
            ResultType = 'TCheckGroupItems'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCheckGroupMethodsGetItemsEval
          end
          item
            Name = 'GetChecked'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCheckGroupMethodsGetCheckedEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCheckGroupMethodsSetCheckedEval
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
        IsInternal = True
        Methods = <
          item
            Name = 'GetItem'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'TCheckGroupItem'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCheckGroupItemsMethodsGetItemEval
          end
          item
            Name = 'Add'
            ResultType = 'TCheckGroupItem'
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCheckGroupItemsMethodsAddEval
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
        IsInternal = True
        Methods = <
          item
            Name = 'GetCaption'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCaptionCollectionItemMethodsGetCaptionEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCaptionCollectionItemMethodsSetCaptionEval
          end
          item
            Name = 'GetTag'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCaptionCollectionItemMethodsGetTagEval
          end
          item
            Name = 'SetTag'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'integer'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCaptionCollectionItemMethodsSetTagEval
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
        IsInternal = True
        Methods = <
          item
            Name = 'GetEnabled'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTCheckGroupItemMethodsGetEnabledEval
          end
          item
            Name = 'SetEnabled'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTCheckGroupItemMethodsSetEnabledEval
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
        IsInternal = True
        Methods = <
          item
            Name = 'Add'
            ResultType = 'TEditButton'
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTEditButtonsMethodsAddEval
          end
          item
            Name = 'GetItem'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'TEditButton'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTEditButtonsMethodsGetItemEval
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
        IsInternal = True
        Methods = <
          item
            Name = 'GetAction'
            ResultType = 'TAction'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTEditButtonMethodsGetActionEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTEditButtonMethodsSetActionEval
          end
          item
            Name = 'GetCaption'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTEditButtonMethodsGetCaptionEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTEditButtonMethodsSetCaptionEval
          end
          item
            Name = 'GetEnabled'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTEditButtonMethodsGetEnabledEval
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
            OnEval = dwsUnitControlsClassesTEditButtonMethodsSetEnabledEval
          end
          item
            Name = 'GetHint'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTEditButtonMethodsGetHintEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTEditButtonMethodsSetHintEval
          end
          item
            Name = 'GetImageIndex'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTEditButtonMethodsGetImageIndexEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTEditButtonMethodsSetImageIndexEval
          end
          item
            Name = 'GetKind'
            ResultType = 'TEditButtonKind'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTEditButtonMethodsGetKindEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTEditButtonMethodsSetKindEval
          end
          item
            Name = 'GetLeftAlignment'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTEditButtonMethodsGetLeftAlignmentEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTEditButtonMethodsSetLeftAlignmentEval
          end
          item
            Name = 'GetVisible'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTEditButtonMethodsGetVisibleEval
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
            OnEval = dwsUnitControlsClassesTEditButtonMethodsSetVisibleEval
          end
          item
            Name = 'GetWidth'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTEditButtonMethodsGetWidthEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTEditButtonMethodsSetWidthEval
          end
          item
            Name = 'GetTextAlignment'
            ResultType = 'TAlignment'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTEditButtonMethodsGetTextAlignmentEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitControlsClassesTEditButtonMethodsSetTextAlignmentEval
          end
          item
            Name = 'GetGlyph'
            ResultType = 'TSmartImage'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitControlsClassesTEditButtonMethodsGetGlyphEval
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
