object DataModuleScriptUserInterfaceProgress: TDataModuleScriptUserInterfaceProgress
  OldCreateOrder = False
  Height = 249
  Width = 390
  object dwsUnitProgress: TdwsUnit
    Classes = <
      item
        Name = 'TProgressDialog'
        IsSealed = True
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
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsProgress1Eval
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
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsProgress2Eval
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
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsAdvanceProgressEval
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
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsUpdateMessageEval
            Kind = mkProcedure
          end
          item
            Name = 'Show'
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsShowEval
            Kind = mkProcedure
          end
          item
            Name = 'Hide'
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsHideEval
            Kind = mkProcedure
          end
          item
            Name = 'ProcessMessages'
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsProcessMessagesEval
            Kind = mkProcedure
          end
          item
            Name = 'AbortProgress'
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsAbortProgressEval
            Kind = mkProcedure
          end
          item
            Name = 'SuspendAbort'
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsSuspendAbortEval
            Kind = mkProcedure
          end
          item
            Name = 'ResumeAbort'
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsResumeAbortEval
            Kind = mkProcedure
          end
          item
            Name = 'GetEnableAbort'
            ResultType = 'boolean'
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsGetEnableAbortEval
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
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsSetEnableAbortEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetRaiseOnAbort'
            ResultType = 'boolean'
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsGetRaiseOnAbortEval
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
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsSetRaiseOnAbortEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetAborted'
            ResultType = 'boolean'
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsGetAbortedEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetMarquee'
            ResultType = 'boolean'
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsGetMarqueeEval
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
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsSetMarqueeEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetEnabled'
            ResultType = 'boolean'
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsGetEnabledEval
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
            OnEval = dwsUnitProgressClassesTProgressDialogMethodsSetEnabledEval
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
            OnEval = dwsUnitProgressClassesTProgressBarMethodsGetPositionEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitProgressClassesTProgressBarMethodsSetPositionEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetMin'
            ResultType = 'Float'
            OnEval = dwsUnitProgressClassesTProgressBarMethodsGetMinEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitProgressClassesTProgressBarMethodsSetMinEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetMax'
            ResultType = 'Float'
            OnEval = dwsUnitProgressClassesTProgressBarMethodsGetMaxEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitProgressClassesTProgressBarMethodsSetMaxEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetStyle'
            ResultType = 'TProgressBarStyle'
            OnEval = dwsUnitProgressClassesTProgressBarMethodsGetStyleEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitProgressClassesTProgressBarMethodsSetStyleEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetNativeStyle'
            ResultType = 'boolean'
            OnEval = dwsUnitProgressClassesTProgressBarMethodsGetNativeStyleEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitProgressClassesTProgressBarMethodsSetNativeStyleEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetMarquee'
            ResultType = 'boolean'
            OnEval = dwsUnitProgressClassesTProgressBarMethodsGetMarqueeEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitProgressClassesTProgressBarMethodsSetMarqueeEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetOrientation'
            ResultType = 'TProgressBarOrientation'
            OnEval = dwsUnitProgressClassesTProgressBarMethodsGetOrientationEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitProgressClassesTProgressBarMethodsSetOrientationEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetShowText'
            ResultType = 'boolean'
            OnEval = dwsUnitProgressClassesTProgressBarMethodsGetShowTextEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitProgressClassesTProgressBarMethodsSetShowTextEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetTextStyle'
            ResultType = 'TProgressBarTextStyle'
            OnEval = dwsUnitProgressClassesTProgressBarMethodsGetTextStyleEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitProgressClassesTProgressBarMethodsSetTextStyleEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetTextOrientation'
            ResultType = 'TProgressBarOrientation'
            OnEval = dwsUnitProgressClassesTProgressBarMethodsGetTextOrientationEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitProgressClassesTProgressBarMethodsSetTextOrientationEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetBeginColor'
            ResultType = 'TColor'
            OnEval = dwsUnitProgressClassesTProgressBarMethodsGetBeginColorEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitProgressClassesTProgressBarMethodsSetBeginColorEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetEndColor'
            ResultType = 'TColor'
            OnEval = dwsUnitProgressClassesTProgressBarMethodsGetEndColorEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitProgressClassesTProgressBarMethodsSetEndColorEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetAnimationStyle'
            ResultType = 'TProgressBarAnimationStyle'
            OnEval = dwsUnitProgressClassesTProgressBarMethodsGetAnimationStyleEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitProgressClassesTProgressBarMethodsSetAnimationStyleEval
            Visibility = cvPrivate
            Kind = mkProcedure
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
            DataType = 'string'
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
        Methods = <
          item
            Name = 'Forget'
            OnEval = dwsUnitProgressClassesTCursorRecallMethodsForgetEval
            Kind = mkProcedure
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
