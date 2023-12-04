object DataModuleScriptRegExp: TDataModuleScriptRegExp
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
            Kind = mkFunction
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsIsMatch1Eval
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
            Kind = mkFunction
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsIsMatch2Eval
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
            Kind = mkClassFunction
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsIsMatch0Eval
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
            Kind = mkFunction
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsMatch1Eval
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
            Kind = mkFunction
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsMatch2Eval
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
            Kind = mkFunction
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsMatch3Eval
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
            Kind = mkFunction
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsMatches1Eval
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
            Kind = mkFunction
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsMatches2Eval
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
            Kind = mkFunction
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsReplace1Eval
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
            Kind = mkFunction
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsReplace2Eval
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
            Kind = mkFunction
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsReplace3Eval
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
            Kind = mkFunction
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsReplace4Eval
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
            Kind = mkFunction
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsSplit1Eval
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
            Kind = mkFunction
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsSplit2Eval
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
            Kind = mkFunction
            OnEval = dwsUnitRegExpClassesTRegularExpressionMethodsSplit3Eval
          end>
        OnCleanUp = dwsUnitRegExpClassesTRegularExpressionCleanUp
      end
      item
        Name = 'TRegExpMatch'
        IsInternal = True
        Methods = <
          item
            Name = 'GetSuccess'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitRegExpClassesTRegExpMatchMethodsGetSuccessEval
          end
          item
            Name = 'GetValue'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitRegExpClassesTRegExpMatchMethodsGetValueEval
          end
          item
            Name = 'GetIndex'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitRegExpClassesTRegExpMatchMethodsGetIndexEval
          end
          item
            Name = 'GetLength'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitRegExpClassesTRegExpMatchMethodsGetLengthEval
          end
          item
            Name = 'GetGroups'
            ResultType = 'TRegExpGroupCollection'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitRegExpClassesTRegExpMatchMethodsGetGroupsEval
          end
          item
            Name = 'NextMatch'
            ResultType = 'TRegExpMatch'
            Kind = mkFunction
            OnEval = dwsUnitRegExpClassesTRegExpMatchMethodsNextMatchEval
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
        IsInternal = True
        Methods = <
          item
            Name = 'GetCount'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitRegExpClassesTRegExpMatchCollectionMethodsGetCountEval
          end
          item
            Name = 'GetItem'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'TRegExpMatch'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitRegExpClassesTRegExpMatchCollectionMethodsGetItemEval
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
        IsInternal = True
        Methods = <
          item
            Name = 'GetSuccess'
            ResultType = 'Boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitRegExpClassesTRegExpGroupMethodsGetSuccessEval
          end
          item
            Name = 'GetValue'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitRegExpClassesTRegExpGroupMethodsGetValueEval
          end
          item
            Name = 'GetIndex'
            ResultType = 'Integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitRegExpClassesTRegExpGroupMethodsGetIndexEval
          end
          item
            Name = 'GetLength'
            ResultType = 'Integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitRegExpClassesTRegExpGroupMethodsGetLengthEval
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
        IsInternal = True
        Methods = <
          item
            Name = 'GetCount'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitRegExpClassesTRegExpGroupCollectionMethodsGetCountEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitRegExpClassesTRegExpGroupCollectionMethodsGetItemEval
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
