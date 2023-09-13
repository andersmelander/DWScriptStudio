object DataModuleScriptUserInterfaceProgress: TDataModuleScriptUserInterfaceProgress
  Height = 249
  Width = 390
  object dwsUnitProgress: TdwsUnit
    Classes = <
      item
        Name = 'TProgressDialog'
        IsSealed = True
        IsInternal = True
        Methods = <
          item
            Name = 'Progress'
            Parameters = <
              item
                Name = 'Stage'
                DataType = 'TProgressStage'
              end
              item
                Name = 'CurrentProgress'
                DataType = 'integer'
              end
              item
                Name = 'MaxProgress'
                DataType = 'integer'
              end
              item
                Name = 'Msg'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Overloaded = True
            Kind = mkProcedure
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsProgress1Eval
          end
          item
            Name = 'Progress'
            Parameters = <
              item
                Name = 'Stage'
                DataType = 'TProgressStage'
              end
              item
                Name = 'CurrentProgress'
                DataType = 'integer'
              end
              item
                Name = 'MaxProgress'
                DataType = 'integer'
              end>
            Overloaded = True
            Kind = mkProcedure
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsProgress2Eval
          end
          item
            Name = 'AdvanceProgress'
            Parameters = <
              item
                Name = 'DeltaProgress'
                DataType = 'integer'
                HasDefaultValue = True
                DefaultValue = 1
              end>
            Kind = mkProcedure
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsAdvanceProgressEval
          end
          item
            Name = 'UpdateMessage'
            Parameters = <
              item
                Name = 'Msg'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsUpdateMessageEval
          end
          item
            Name = 'Show'
            Kind = mkProcedure
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsShowEval
          end
          item
            Name = 'Hide'
            Kind = mkProcedure
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsHideEval
          end
          item
            Name = 'ProcessMessages'
            Kind = mkProcedure
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsProcessMessagesEval
          end
          item
            Name = 'AbortProgress'
            Kind = mkProcedure
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsAbortProgressEval
          end
          item
            Name = 'SuspendAbort'
            Kind = mkProcedure
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsSuspendAbortEval
          end
          item
            Name = 'ResumeAbort'
            Kind = mkProcedure
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsResumeAbortEval
          end
          item
            Name = 'GetEnableAbort'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsGetEnableAbortEval
          end
          item
            Name = 'SetEnableAbort'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsSetEnableAbortEval
          end
          item
            Name = 'GetRaiseOnAbort'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsGetRaiseOnAbortEval
          end
          item
            Name = 'SetRaiseOnAbort'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsSetRaiseOnAbortEval
          end
          item
            Name = 'GetAborted'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsGetAbortedEval
          end
          item
            Name = 'GetMarquee'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsGetMarqueeEval
          end
          item
            Name = 'SetMarquee'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsSetMarqueeEval
          end
          item
            Name = 'GetEnabled'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsGetEnabledEval
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
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsSetEnabledEval
          end>
        Properties = <
          item
            Name = 'EnableAbort'
            DataType = 'boolean'
            ReadAccess = 'GetEnableAbort'
            WriteAccess = 'SetEnableAbort'
          end
          item
            Name = 'RaiseOnAbort'
            DataType = 'boolean'
            ReadAccess = 'GetRaiseOnAbort'
            WriteAccess = 'SetRaiseOnAbort'
          end
          item
            Name = 'Aborted'
            DataType = 'boolean'
            ReadAccess = 'GetAborted'
          end
          item
            Name = 'Marquee'
            DataType = 'boolean'
            ReadAccess = 'GetMarquee'
            WriteAccess = 'SetMarquee'
          end
          item
            Name = 'Enabled'
            DataType = 'boolean'
            ReadAccess = 'GetEnabled'
            WriteAccess = 'SetEnabled'
          end>
        OnCleanUp = dwsUnitProgressClassesTProgressDialogCleanUp
      end
      item
        Name = 'TProgressBar'
        Ancestor = 'TCustomControl'
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'AOwner'
                DataType = 'TControl'
              end>
            OnEval = dwsUnitProgressClassesTProgressBarConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'GetPosition'
            ResultType = 'Float'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProgressClassesTProgressBarMethodsGetPositionEval
          end
          item
            Name = 'SetPosition'
            Parameters = <
              item
                Name = 'value'
                DataType = 'Float'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitProgressClassesTProgressBarMethodsSetPositionEval
          end
          item
            Name = 'GetMin'
            ResultType = 'Float'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProgressClassesTProgressBarMethodsGetMinEval
          end
          item
            Name = 'SetMin'
            Parameters = <
              item
                Name = 'value'
                DataType = 'Float'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitProgressClassesTProgressBarMethodsSetMinEval
          end
          item
            Name = 'GetMax'
            ResultType = 'Float'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProgressClassesTProgressBarMethodsGetMaxEval
          end
          item
            Name = 'SetMax'
            Parameters = <
              item
                Name = 'value'
                DataType = 'Float'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitProgressClassesTProgressBarMethodsSetMaxEval
          end
          item
            Name = 'GetStyle'
            ResultType = 'TProgressBarStyle'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProgressClassesTProgressBarMethodsGetStyleEval
          end
          item
            Name = 'SetStyle'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TProgressBarStyle'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitProgressClassesTProgressBarMethodsSetStyleEval
          end
          item
            Name = 'GetNativeStyle'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProgressClassesTProgressBarMethodsGetNativeStyleEval
          end
          item
            Name = 'SetNativeStyle'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitProgressClassesTProgressBarMethodsSetNativeStyleEval
          end
          item
            Name = 'GetMarquee'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProgressClassesTProgressBarMethodsGetMarqueeEval
          end
          item
            Name = 'SetMarquee'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitProgressClassesTProgressBarMethodsSetMarqueeEval
          end
          item
            Name = 'GetOrientation'
            ResultType = 'TProgressBarOrientation'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProgressClassesTProgressBarMethodsGetOrientationEval
          end
          item
            Name = 'SetOrientation'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TProgressBarOrientation'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitProgressClassesTProgressBarMethodsSetOrientationEval
          end
          item
            Name = 'GetShowText'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProgressClassesTProgressBarMethodsGetShowTextEval
          end
          item
            Name = 'SetShowText'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitProgressClassesTProgressBarMethodsSetShowTextEval
          end
          item
            Name = 'GetTextStyle'
            ResultType = 'TProgressBarTextStyle'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProgressClassesTProgressBarMethodsGetTextStyleEval
          end
          item
            Name = 'SetTextStyle'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TProgressBarTextStyle'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitProgressClassesTProgressBarMethodsSetTextStyleEval
          end
          item
            Name = 'GetTextOrientation'
            ResultType = 'TProgressBarOrientation'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProgressClassesTProgressBarMethodsGetTextOrientationEval
          end
          item
            Name = 'SetTextOrientation'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TProgressBarOrientation'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitProgressClassesTProgressBarMethodsSetTextOrientationEval
          end
          item
            Name = 'GetBeginColor'
            ResultType = 'TColor'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProgressClassesTProgressBarMethodsGetBeginColorEval
          end
          item
            Name = 'SetBeginColor'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TColor'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitProgressClassesTProgressBarMethodsSetBeginColorEval
          end
          item
            Name = 'GetEndColor'
            ResultType = 'TColor'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProgressClassesTProgressBarMethodsGetEndColorEval
          end
          item
            Name = 'SetEndColor'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TColor'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitProgressClassesTProgressBarMethodsSetEndColorEval
          end
          item
            Name = 'GetAnimationStyle'
            ResultType = 'TProgressBarAnimationStyle'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitProgressClassesTProgressBarMethodsGetAnimationStyleEval
          end
          item
            Name = 'SetAnimationStyle'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TProgressBarAnimationStyle'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitProgressClassesTProgressBarMethodsSetAnimationStyleEval
          end>
        Properties = <
          item
            Name = 'Position'
            DataType = 'Float'
            ReadAccess = 'GetPosition'
            WriteAccess = 'SetPosition'
          end
          item
            Name = 'Min'
            DataType = 'Float'
            ReadAccess = 'GetMin'
            WriteAccess = 'SetMin'
          end
          item
            Name = 'Max'
            DataType = 'Float'
            ReadAccess = 'GetMax'
            WriteAccess = 'SetMax'
          end
          item
            Name = 'Style'
            DataType = 'TProgressBarStyle'
            ReadAccess = 'GetStyle'
            WriteAccess = 'SetStyle'
          end
          item
            Name = 'NativeStyle'
            DataType = 'boolean'
            ReadAccess = 'GetNativeStyle'
            WriteAccess = 'SetNativeStyle'
          end
          item
            Name = 'Marquee'
            DataType = 'boolean'
            ReadAccess = 'GetMarquee'
            WriteAccess = 'SetMarquee'
          end
          item
            Name = 'Orientation'
            DataType = 'TProgressBarOrientation'
            ReadAccess = 'GetOrientation'
            WriteAccess = 'SetOrientation'
          end
          item
            Name = 'Text'
          end
          item
            Name = 'ShowText'
            DataType = 'boolean'
            ReadAccess = 'GetShowText'
            WriteAccess = 'SetShowText'
          end
          item
            Name = 'TextStyle'
            DataType = 'TProgressBarTextStyle'
            ReadAccess = 'GetTextStyle'
            WriteAccess = 'SetTextStyle'
          end
          item
            Name = 'TextOrientation'
            DataType = 'TProgressBarOrientation'
            ReadAccess = 'GetTextOrientation'
            WriteAccess = 'SetTextOrientation'
          end
          item
            Name = 'BeginColor'
            DataType = 'TColor'
            ReadAccess = 'GetBeginColor'
            WriteAccess = 'SetBeginColor'
          end
          item
            Name = 'EndColor'
            DataType = 'TColor'
            ReadAccess = 'GetEndColor'
            WriteAccess = 'SetEndColor'
          end
          item
            Name = 'AnimationStyle'
            DataType = 'TProgressBarAnimationStyle'
            ReadAccess = 'GetAnimationStyle'
            WriteAccess = 'SetAnimationStyle'
          end>
      end
      item
        Name = 'TCursorRecall'
        IsSealed = True
        IsInternal = True
        Methods = <
          item
            Name = 'Forget'
            Kind = mkProcedure
            OnEval = dwsUnitProgressClassesTCursorRecallMethodsForgetEval
          end>
        OnCleanUp = dwsUnitProgressClassesTCursorRecallCleanUp
      end>
    Dependencies.Strings = (
      'System.UI.Controls')
    Enumerations = <
      item
        Name = 'TProgressStage'
        Elements = <
          item
            Name = 'psBegin'
          end
          item
            Name = 'psProgress'
          end
          item
            Name = 'psEnd'
          end>
      end
      item
        Name = 'TProgressBarStyle'
        Elements = <
          item
            Name = 'pbsSolid'
          end
          item
            Name = 'pbsLEDs'
          end
          item
            Name = 'pbsGradient'
          end
          item
            Name = 'pbsGradientLEDs'
          end
          item
            Name = 'pbsAnimation'
          end
          item
            Name = 'pbsAnimationLEDs'
          end>
      end
      item
        Name = 'TProgressBarOrientation'
        Elements = <
          item
            Name = 'pboHorizontal'
          end
          item
            Name = 'pboVertical'
          end>
      end
      item
        Name = 'TProgressBarTextStyle'
        Elements = <
          item
            Name = 'pbtsPercent'
          end
          item
            Name = 'pbtsPosition'
          end
          item
            Name = 'pbtsText'
          end>
      end
      item
        Name = 'TProgressBarAnimationStyle'
        Elements = <
          item
            Name = 'pbasCycle'
          end
          item
            Name = 'pbasPingPong'
          end>
      end>
    Functions = <
      item
        Name = 'ShowProgress'
        Parameters = <
          item
            Name = 'Title'
            DataType = 'string'
            IsWritable = False
            HasDefaultValue = True
            DefaultValue = ''
          end
          item
            Name = 'Defer'
            DataType = 'boolean'
            HasDefaultValue = True
            DefaultValue = True
          end>
        ResultType = 'TProgressDialog'
        OnEval = dwsUnitProgressFunctionsShowProgressEval
      end
      item
        Name = 'SaveCursor'
        Parameters = <
          item
            Name = 'NewCursor'
            DataType = 'TCursor'
          end
          item
            Name = 'OnlyIfDefault'
            DataType = 'boolean'
            HasDefaultValue = True
            DefaultValue = False
          end>
        ResultType = 'TCursorRecall'
        OnEval = dwsUnitProgressFunctionsSaveCursorEval
      end>
    Interfaces = <
      item
        Name = 'IProgress'
        Ancestor = 'IInterface'
        Methods = <
          item
            Name = 'Progress'
            Parameters = <
              item
                Name = 'Stage'
                DataType = 'TProgressStage'
              end
              item
                Name = 'CurrentProgress'
                DataType = 'integer'
              end
              item
                Name = 'MaxProgress'
                DataType = 'integer'
              end
              item
                Name = 'Msg'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Overloaded = True
            Kind = mkProcedure
          end
          item
            Name = 'Progress'
            Parameters = <
              item
                Name = 'Stage'
                DataType = 'TProgressStage'
              end
              item
                Name = 'CurrentProgress'
                DataType = 'integer'
              end
              item
                Name = 'MaxProgress'
                DataType = 'integer'
              end>
            Overloaded = True
            Kind = mkProcedure
          end
          item
            Name = 'AdvanceProgress'
            Parameters = <
              item
                Name = 'DeltaProgress'
                DataType = 'integer'
                HasDefaultValue = True
                DefaultValue = 1
              end>
            Kind = mkProcedure
          end
          item
            Name = 'UpdateMessage'
            Parameters = <
              item
                Name = 'Msg'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
          end
          item
            Name = 'Show'
            Kind = mkProcedure
          end
          item
            Name = 'Hide'
            Kind = mkProcedure
          end
          item
            Name = 'ProcessMessages'
            Kind = mkProcedure
          end
          item
            Name = 'AbortProgress'
            Kind = mkProcedure
          end
          item
            Name = 'SuspendAbort'
            Kind = mkProcedure
          end
          item
            Name = 'ResumeAbort'
            Kind = mkProcedure
          end
          item
            Name = 'GetEnableAbort'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetEnableAbort'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetRaiseOnAbort'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetRaiseOnAbort'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetAborted'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetMarquee'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetMarquee'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetEnabled'
            ResultType = 'boolean'
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
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'EnableAbort'
            DataType = 'boolean'
            ReadAccess = 'GetEnableAbort'
            WriteAccess = 'SetEnableAbort'
          end
          item
            Name = 'RaiseOnAbort'
            DataType = 'boolean'
            ReadAccess = 'GetRaiseOnAbort'
            WriteAccess = 'SetRaiseOnAbort'
          end
          item
            Name = 'Aborted'
            DataType = 'boolean'
            ReadAccess = 'GetAborted'
          end
          item
            Name = 'Marquee'
            DataType = 'boolean'
            ReadAccess = 'GetMarquee'
            WriteAccess = 'SetMarquee'
          end
          item
            Name = 'Enabled'
            DataType = 'boolean'
            ReadAccess = 'GetEnabled'
            WriteAccess = 'SetEnabled'
          end>
      end>
    UnitName = 'System.UI.Progress'
    StaticSymbols = False
    OnAfterInitUnitTable = dwsUnitProgressAfterInitUnitTable
    Left = 84
    Top = 44
  end
end
