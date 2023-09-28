object DataModuleScriptDiagnostics: TDataModuleScriptDiagnostics
  Height = 286
  Width = 353
  object dwsUnitSystemStopwatch: TdwsUnit
    Classes = <
      item
        Name = 'TStopWatch'
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'AStart'
                DataType = 'boolean'
                HasDefaultValue = True
                DefaultValue = False
              end>
            OnEval = dwsUnitSystemTimersClassesTTimerConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'GetElapsedMilliseconds'
            ResultType = 'Integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitSystemStopwatchClassesTStopWatchMethodsGetElapsedMillisecondsEval
          end
          item
            Name = 'GetElapsedTicks'
            ResultType = 'Integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitSystemStopwatchClassesTStopWatchMethodsGetElapsedTicksEval
          end
          item
            Name = 'GetIsRunning'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitSystemStopwatchClassesTStopWatchMethodsGetIsRunningEval
          end
          item
            Name = 'Reset'
            Kind = mkProcedure
            OnEval = dwsUnitSystemStopwatchClassesTStopWatchMethodsResetEval
          end
          item
            Name = 'Start'
            Kind = mkProcedure
            OnEval = dwsUnitSystemStopwatchClassesTStopWatchMethodsStartEval
          end
          item
            Name = 'Stop'
            Kind = mkProcedure
            OnEval = dwsUnitSystemStopwatchClassesTStopWatchMethodsStopEval
          end
          item
            Name = 'StartNew'
            Kind = mkProcedure
            OnEval = dwsUnitSystemStopwatchClassesTStopWatchMethodsStartNewEval
          end
          item
            Name = 'IsHighResolution'
            ResultType = 'boolean'
            Kind = mkClassFunction
            OnEval = dwsUnitSystemStopwatchClassesTStopWatchMethodsIsHighResolutionEval
          end
          item
            Name = 'Frequency'
            ResultType = 'Integer'
            Kind = mkClassFunction
            OnEval = dwsUnitSystemStopwatchClassesTStopWatchMethodsFrequencyEval
          end>
        Properties = <
          item
            Name = 'ElapsedMilliseconds'
            DataType = 'Integer'
            ReadAccess = 'GetElapsedMilliseconds'
          end
          item
            Name = 'ElapsedTicks'
            DataType = 'Integer'
            ReadAccess = 'GetElapsedTicks'
          end
          item
            Name = 'IsRunning'
            DataType = 'boolean'
            ReadAccess = 'GetIsRunning'
          end>
        OnCleanUp = dwsUnitSystemTimersClassesTTimerCleanUp
      end>
    UnitName = 'System.Diagnostics'
    StaticSymbols = False
    Left = 72
    Top = 32
  end
end
