object DataModuleScriptRegExp: TDataModuleScriptRegExp
  OldCreateOrder = False
  Height = 150
  Width = 215
  object dwsUnitRegExp: TdwsUnit
    Arrays = <
      item
        Name = 'TStringArray'
        DataType = 'string'
        IsDynamic = True
      end>
    Classes = <
      item
        Name = 'TRegularExpression'
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'Pattern'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Overloaded = True
            OnEval = dwsUnitRegExpClassesTRegularExpressionConstructorsCreate1Eval
          end
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'Pattern'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Options'
                DataType = 'TRegExpOptions'
              end>
            Overloaded = True
            OnEval = dwsUnitRegExpClassesTRegularExpressionConstructorsCreate2Eval
          end>
        Methods = <
          item
            Name = 'IsMatch'
            Parameters = <
              item
                Name = 'Input'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'boolean'
            Overloaded = True
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsIsMatch1Eval
            Kind = mkFunction
          end
          item
            Name = 'IsMatch'
            Parameters = <
              item
                Name = 'Input'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'StartPos'
                DataType = 'Integer'
              end>
            ResultType = 'Boolean'
            Overloaded = True
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsIsMatch2Eval
            Kind = mkFunction
          end
          item
            Name = 'IsMatch2'
            Parameters = <
              item
                Name = 'Input'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Pattern'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'boolean'
            Overloaded = True
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsIsMatch0Eval
            Kind = mkClassFunction
          end
          item
            Name = 'Match'
            Parameters = <
              item
                Name = 'Input'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TRegExpMatch'
            Overloaded = True
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsMatch1Eval
            Kind = mkFunction
          end
          item
            Name = 'Match'
            Parameters = <
              item
                Name = 'Input'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'StartPos'
                DataType = 'integer'
              end>
            ResultType = 'TRegExpMatch'
            Overloaded = True
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsMatch2Eval
            Kind = mkFunction
          end
          item
            Name = 'Match'
            Parameters = <
              item
                Name = 'Input'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'StartPos'
                DataType = 'integer'
              end
              item
                Name = 'Length'
                DataType = 'Integer'
              end>
            ResultType = 'TRegExpMatch'
            Overloaded = True
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsMatch3Eval
            Kind = mkFunction
          end
          item
            Name = 'Matches'
            Parameters = <
              item
                Name = 'Input'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TRegExpMatchCollection'
            Overloaded = True
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsMatches1Eval
            Kind = mkFunction
          end
          item
            Name = 'Matches'
            Parameters = <
              item
                Name = 'Input'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'StartPos'
                DataType = 'Integer'
              end>
            ResultType = 'TRegExpMatchCollection'
            Overloaded = True
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsMatches2Eval
            Kind = mkFunction
          end
          item
            Name = 'Replace'
            Parameters = <
              item
                Name = 'Input'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Replacement'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            Overloaded = True
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsReplace1Eval
            Kind = mkFunction
          end
          item
            Name = 'Replace'
            Parameters = <
              item
                Name = 'Input'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Replacement'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Count'
                DataType = 'Integer'
              end>
            ResultType = 'string'
            Overloaded = True
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsReplace2Eval
            Kind = mkFunction
          end
          item
            Name = 'Replace'
            Parameters = <
              item
                Name = 'Input'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Evaluator'
                DataType = 'TMatchEvaluator'
              end>
            ResultType = 'string'
            Overloaded = True
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsReplace3Eval
            Kind = mkFunction
          end
          item
            Name = 'Replace'
            Parameters = <
              item
                Name = 'Input'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Evaluator'
                DataType = 'TMatchEvaluator'
              end
              item
                Name = 'Count'
                DataType = 'Integer'
              end>
            ResultType = 'string'
            Overloaded = True
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsReplace4Eval
            Kind = mkFunction
          end
          item
            Name = 'Split'
            Parameters = <
              item
                Name = 'Input'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TStringArray'
            Overloaded = True
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsSplit1Eval
            Kind = mkFunction
          end
          item
            Name = 'Split'
            Parameters = <
              item
                Name = 'Input'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Count'
                DataType = 'Integer'
              end>
            ResultType = 'TStringArray'
            Overloaded = True
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsSplit2Eval
            Kind = mkFunction
          end
          item
            Name = 'Split'
            Parameters = <
              item
                Name = 'Input'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Count'
                DataType = 'Integer'
              end
              item
                Name = 'StartPos'
                DataType = 'Integer'
              end>
            ResultType = 'TStringArray'
            Overloaded = True
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsSplit3Eval
            Kind = mkFunction
          end>
        OnCleanUp = dwsUnitRegExpClassesTRegularExpressionCleanUp
      end
      item
        Name = 'TRegExpMatch'
        Methods = <
          item
            Name = 'GetSuccess'
            ResultType = 'boolean'
            OnEval = dwsUnitRegExpClassesTRegExpMatchMethodsGetSuccessEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetValue'
            ResultType = 'string'
            OnEval = dwsUnitRegExpClassesTRegExpMatchMethodsGetValueEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetIndex'
            ResultType = 'integer'
            OnEval = dwsUnitRegExpClassesTRegExpMatchMethodsGetIndexEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetLength'
            ResultType = 'integer'
            OnEval = dwsUnitRegExpClassesTRegExpMatchMethodsGetLengthEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetGroups'
            ResultType = 'TRegExpGroupCollection'
            OnEval = dwsUnitRegExpClassesTRegExpMatchMethodsGetGroupsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'NextMatch'
            ResultType = 'TRegExpMatch'
            OnEval = dwsUnitRegExpClassesTRegExpMatchMethodsNextMatchEval
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Success'
            DataType = 'boolean'
            ReadAccess = 'GetSuccess'
          end
          item
            Name = 'Value'
            DataType = 'string'
            ReadAccess = 'GetValue'
          end
          item
            Name = 'Index'
            DataType = 'integer'
            ReadAccess = 'GetIndex'
          end
          item
            Name = 'Length'
            DataType = 'integer'
            ReadAccess = 'GetLength'
          end
          item
            Name = 'Groups'
            DataType = 'TRegExpGroupCollection'
            ReadAccess = 'GetGroups'
          end>
        OnCleanUp = dwsUnitRegExpClassesTRegExpMatchCleanUp
      end
      item
        Name = 'TRegExpMatchCollection'
        Methods = <
          item
            Name = 'GetCount'
            ResultType = 'integer'
            OnEval = dwsUnitRegExpClassesTRegExpMatchCollectionMethodsGetCountEval
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
            ResultType = 'TRegExpMatch'
            OnEval = dwsUnitRegExpClassesTRegExpMatchCollectionMethodsGetItemEval
            Visibility = cvProtected
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Count'
            DataType = 'integer'
            ReadAccess = 'GetCount'
          end
          item
            Name = 'Items'
            DataType = 'TRegExpMatch'
            ReadAccess = 'GetItem'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
            IsDefault = True
          end>
      end
      item
        Name = 'TRegExpGroup'
        Methods = <
          item
            Name = 'GetSuccess'
            ResultType = 'Boolean'
            OnEval = dwsUnitRegExpClassesTRegExpGroupMethodsGetSuccessEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetValue'
            ResultType = 'string'
            OnEval = dwsUnitRegExpClassesTRegExpGroupMethodsGetValueEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetIndex'
            ResultType = 'Integer'
            OnEval = dwsUnitRegExpClassesTRegExpGroupMethodsGetIndexEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetLength'
            ResultType = 'Integer'
            OnEval = dwsUnitRegExpClassesTRegExpGroupMethodsGetLengthEval
            Visibility = cvProtected
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Success'
            DataType = 'Boolean'
            ReadAccess = 'GetSuccess'
          end
          item
            Name = 'Value'
            DataType = 'string'
            ReadAccess = 'GetValue'
          end
          item
            Name = 'Index'
            DataType = 'Integer'
            ReadAccess = 'GetIndex'
          end
          item
            Name = 'Length'
            DataType = 'Integer'
            ReadAccess = 'GetLength'
          end>
      end
      item
        Name = 'TRegExpGroupCollection'
        Methods = <
          item
            Name = 'GetCount'
            ResultType = 'integer'
            OnEval = dwsUnitRegExpClassesTRegExpGroupCollectionMethodsGetCountEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetItem'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Variant'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TRegExpGroup'
            OnEval = dwsUnitRegExpClassesTRegExpGroupCollectionMethodsGetItemEval
            Visibility = cvProtected
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Count'
            DataType = 'integer'
            ReadAccess = 'GetCount'
          end
          item
            Name = 'Items'
            DataType = 'TRegExpGroup'
            ReadAccess = 'GetItem'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Variant'
                IsVarParam = True
                IsWritable = False
              end>
            IsDefault = True
          end>
      end>
    Enumerations = <
      item
        Name = 'TRegExpOption'
        Elements = <
          item
            Name = 'roIgnoreCase'
          end
          item
            Name = 'roMultiLine'
          end
          item
            Name = 'roExplicitCapture'
          end
          item
            Name = 'roSingleLine'
          end
          item
            Name = 'roIgnorePatternSpace'
          end
          item
            Name = 'roNotEmpty'
          end>
      end>
    Sets = <
      item
        Name = 'TRegExpOptions'
        BaseType = 'TRegExpOption'
      end>
    Delegates = <
      item
        Name = 'TMatchEvaluator'
        Parameters = <
          item
            Name = 'Match'
            DataType = 'TRegExpMatch'
          end>
        ResultType = 'string'
      end>
    UnitName = 'System.RegExp'
    StaticSymbols = False
    Left = 88
    Top = 24
  end
end
