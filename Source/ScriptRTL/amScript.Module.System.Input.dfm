object DataModuleScriptSystemInput: TDataModuleScriptSystemInput
  Height = 293
  Width = 353
  object dwsUnitSystemInput: TdwsUnit
    Classes = <
      item
        Name = 'Keyboard'
        IsSealed = True
        IsStatic = True
        Methods = <
          item
            Name = 'SendKeys'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Wait'
                DataType = 'boolean'
                HasDefaultValue = True
                DefaultValue = False
              end
              item
                Name = 'Delay'
                DataType = 'integer'
                HasDefaultValue = True
                DefaultValue = 0
              end>
            ResultType = 'integer'
            Overloaded = True
            Attributes = [maClassMethod, maStatic]
            Kind = mkClassFunction
            OnEval = dwsUnitSystemInputClassesKeyboardMethodsSendKeysEval
          end
          item
            Name = 'SendKeysEx'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Wait'
                DataType = 'boolean'
                HasDefaultValue = True
                DefaultValue = False
              end
              item
                Name = 'Delay'
                DataType = 'integer'
                HasDefaultValue = True
                DefaultValue = 0
              end>
            ResultType = 'integer'
            Attributes = [maClassMethod, maStatic]
            Kind = mkClassFunction
            OnEval = dwsUnitSystemInputClassesKeyboardMethodsSendKeysExEval
          end>
      end
      item
        Name = 'Mouse'
        IsSealed = True
        IsStatic = True
        Methods = <
          item
            Name = 'GetCursorPos'
            ResultType = 'TPoint'
            Attributes = [maClassMethod, maStatic]
            Visibility = cvProtected
            Kind = mkClassFunction
            OnEval = dwsUnitSystemInputClassesMouseMethodsGetCursorPosEval
          end
          item
            Name = 'SetCursorPos'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TPoint'
                IsVarParam = True
                IsWritable = False
              end>
            Attributes = [maClassMethod, maStatic]
            Visibility = cvProtected
            Kind = mkClassProcedure
            OnEval = dwsUnitSystemInputClassesMouseMethodsSetCursorPosEval
          end
          item
            Name = 'MoveCursor'
            Parameters = <
              item
                Name = 'Pos'
                DataType = 'TPoint'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Velocity'
                DataType = 'integer'
              end>
            Attributes = [maClassMethod, maStatic]
            Kind = mkClassProcedure
            OnEval = dwsUnitSystemInputClassesMouseMethodsMoveCursorEval
          end
          item
            Name = 'SendMouseMove'
            Parameters = <
              item
                Name = 'Pos'
                DataType = 'TPoint'
                IsVarParam = True
                IsWritable = False
              end>
            Attributes = [maClassMethod, maStatic]
            Kind = mkClassProcedure
            OnEval = dwsUnitSystemInputClassesMouseMethodsSendMouseMoveEval
          end
          item
            Name = 'SendMouseDown'
            Parameters = <
              item
                Name = 'Pos'
                DataType = 'TPoint'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Button'
                DataType = 'TMouseButton'
              end>
            Attributes = [maClassMethod, maStatic]
            Kind = mkClassProcedure
            OnEval = dwsUnitSystemInputClassesMouseMethodsSendMouseDownEval
          end
          item
            Name = 'SendMouseUp'
            Parameters = <
              item
                Name = 'Pos'
                DataType = 'TPoint'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Button'
                DataType = 'TMouseButton'
              end>
            Attributes = [maClassMethod, maStatic]
            Kind = mkClassProcedure
            OnEval = dwsUnitSystemInputClassesMouseMethodsSendMouseUpEval
          end
          item
            Name = 'SendMouseClick'
            Parameters = <
              item
                Name = 'Pos'
                DataType = 'TPoint'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Button'
                DataType = 'TMouseButton'
              end>
            Attributes = [maClassMethod, maStatic]
            Kind = mkClassProcedure
            OnEval = dwsUnitSystemInputClassesMouseMethodsSendMouseClickEval
          end>
        Properties = <
          item
            Name = 'CursorPos'
            DataType = 'TPoint'
            ReadAccess = 'GetCursorPos'
            WriteAccess = 'SetCursorPos'
          end>
      end>
    Dependencies.Strings = (
      'System.Classes')
    Enumerations = <
      item
        Name = 'TMouseButton'
        Elements = <
          item
            Name = 'mbLeft'
          end
          item
            Name = 'mbMiddle'
          end
          item
            Name = 'mbRight'
          end>
      end>
    UnitName = 'System.Input'
    StaticSymbols = False
    Left = 116
    Top = 68
  end
end
