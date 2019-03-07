object DataModuleScriptSystem: TDataModuleScriptSystem
  OldCreateOrder = False
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
            OnEval = dwsUnitSystemTimersClassesTTimerMethodsGetIntervalEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitSystemTimersClassesTTimerMethodsSetIntervalEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetEnabled'
            ResultType = 'boolean'
            OnEval = dwsUnitSystemTimersClassesTTimerMethodsGetEnabledEval
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
            OnEval = dwsUnitSystemTimersClassesTTimerMethodsSetEnabledEval
            Visibility = cvPrivate
            Kind = mkProcedure
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
            OnEval = dwsUnitSystemTimersClassesTTimerMethodsSetOnTimerEval
            Visibility = cvPrivate
            Kind = mkProcedure
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
