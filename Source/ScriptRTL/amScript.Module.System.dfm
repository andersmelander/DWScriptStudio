object DataModuleScriptSystem: TDataModuleScriptSystem
  Height = 286
  Width = 353
  object dwsUnitSystemTimers: TdwsUnit
    Classes = <
      item
        Name = 'TTimer'
        Ancestor = 'TComponent'
        IsSealed = True
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'AOwner'
                DataType = 'TComponent'
              end>
            OnEval = dwsUnitSystemTimersClassesTTimerConstructorsCreateEval
          end>
        Fields = <
          item
            Name = 'FOnTimer'
            DataType = 'TTimerNotifyEvent'
            Visibility = cvPrivate
          end>
        Methods = <
          item
            Name = 'GetInterval'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitSystemTimersClassesTTimerMethodsGetIntervalEval
          end
          item
            Name = 'SetInterval'
            Parameters = <
              item
                Name = 'value'
                DataType = 'integer'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitSystemTimersClassesTTimerMethodsSetIntervalEval
          end
          item
            Name = 'GetEnabled'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitSystemTimersClassesTTimerMethodsGetEnabledEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitSystemTimersClassesTTimerMethodsSetEnabledEval
          end
          item
            Name = 'SetOnTimer'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TTimerNotifyEvent'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitSystemTimersClassesTTimerMethodsSetOnTimerEval
          end>
        Properties = <
          item
            Name = 'Interval'
            DataType = 'integer'
            ReadAccess = 'GetInterval'
            WriteAccess = 'SetInterval'
          end
          item
            Name = 'Enabled'
            DataType = 'boolean'
            ReadAccess = 'GetEnabled'
            WriteAccess = 'SetEnabled'
          end
          item
            Name = 'OnTimer'
            DataType = 'TTimerNotifyEvent'
            ReadAccess = 'FOnTimer'
            WriteAccess = 'SetOnTimer'
          end>
        OnCleanUp = dwsUnitSystemTimersClassesTTimerCleanUp
      end>
    Dependencies.Strings = (
      'System.Classes')
    Delegates = <
      item
        Name = 'TTimerNotifyEvent'
        Parameters = <
          item
            Name = 'Sender'
            DataType = 'TTimer'
          end>
      end>
    UnitName = 'System.Timers'
    StaticSymbols = False
    Left = 72
    Top = 32
  end
end
