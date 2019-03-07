object DataModuleScriptClasses: TDataModuleScriptClasses
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 329
  Width = 383
  object dwsUnitClasses: TdwsUnit
    Arrays = <
      item
        Name = 'TStringArray'
        DataType = 'string'
        IsDynamic = True
      end>
    Classes = <
      item
        Name = 'TPersistent'
        IsAbstract = True
        Methods = <
          item
            Name = 'AssignTo'
            Parameters = <
              item
                Name = 'Dest'
                DataType = 'TPersistent'
              end>
            Attributes = [maVirtual]
            OnEval = dwsUnitClassesClassesTPersistentMethodsAssignToEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'Assign'
            Parameters = <
              item
                Name = 'Source'
                DataType = 'TPersistent'
              end>
            Attributes = [maVirtual]
            OnEval = dwsUnitClassesClassesTPersistentMethodsAssignEval
            Kind = mkProcedure
          end>
      end
      item
        Name = 'TStrings'
        Ancestor = 'TPersistent'
        IsAbstract = True
        Methods = <
          item
            Name = 'Add'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'Integer'
            OnEval = dwsUnitClassesTStringsMethodsAddEval
            Kind = mkFunction
          end
          item
            Name = 'AddTag'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Tag'
                DataType = 'integer'
              end>
            ResultType = 'integer'
            OnEval = dwsUnitClassesClassesTStringsMethodsAddTagEval
            Kind = mkFunction
          end
          item
            Name = 'AddStrings'
            Parameters = <
              item
                Name = 'Strings'
                DataType = 'TStrings'
                IsWritable = False
              end>
            OnEval = dwsUnitClassesTStringsMethodsAddStringsEval
            Kind = mkProcedure
          end
          item
            Name = 'Clear'
            OnEval = dwsUnitClassesTStringsMethodsClearEval
            Kind = mkProcedure
          end
          item
            Name = 'Delete'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
                IsWritable = False
              end>
            OnEval = dwsUnitClassesTStringsMethodsDeleteEval
            Kind = mkProcedure
          end
          item
            Name = 'Exchange'
            Parameters = <
              item
                Name = 'Index1'
                DataType = 'Integer'
                IsWritable = False
              end
              item
                Name = 'Index2'
                DataType = 'Integer'
                IsWritable = False
              end>
            OnEval = dwsUnitClassesTStringsMethodsExchangeEval
            Kind = mkProcedure
          end
          item
            Name = 'Get'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
                IsWritable = False
              end>
            ResultType = 'String'
            OnEval = dwsUnitClassesTStringsMethodsGetEval
            Kind = mkFunction
          end
          item
            Name = 'GetCommaText'
            ResultType = 'String'
            OnEval = dwsUnitClassesTStringsMethodsGetCommaTextEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetCount'
            ResultType = 'Integer'
            OnEval = dwsUnitClassesTStringsMethodsGetCountEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetName'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
                IsWritable = False
              end>
            ResultType = 'String'
            OnEval = dwsUnitClassesTStringsMethodsGetNameEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetString'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
                IsWritable = False
              end>
            ResultType = 'String'
            OnEval = dwsUnitClassesTStringsMethodsGetStringsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetText'
            ResultType = 'String'
            OnEval = dwsUnitClassesTStringsMethodsGetTextEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetValue'
            Parameters = <
              item
                Name = 'Name'
                DataType = 'String'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'String'
            OnEval = dwsUnitClassesTStringsMethodsGetValuesEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'IndexOf'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'Integer'
            OnEval = dwsUnitClassesTStringsMethodsIndexOfEval
            Kind = mkFunction
          end
          item
            Name = 'IndexOfName'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'Integer'
            OnEval = dwsUnitClassesTStringsMethodsIndexOfNameEval
            Kind = mkFunction
          end
          item
            Name = 'Insert'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
                IsWritable = False
              end
              item
                Name = 'Value'
                DataType = 'String'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitClassesTStringsMethodsInsertEval
            Kind = mkProcedure
          end
          item
            Name = 'LoadFromFile'
            Parameters = <
              item
                Name = 'FileName'
                DataType = 'String'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Encoding'
                DataType = 'TEncoding'
                HasDefaultValue = True
                DefaultValue = 'nil'
              end>
            OnEval = dwsUnitClassesTStringsMethodsLoadFromFileEval
            Kind = mkProcedure
          end
          item
            Name = 'Move'
            Parameters = <
              item
                Name = 'CurIndex'
                DataType = 'Integer'
                IsWritable = False
              end
              item
                Name = 'NewIndex'
                DataType = 'Integer'
                IsWritable = False
              end>
            OnEval = dwsUnitClassesTStringsMethodsMoveEval
            Kind = mkProcedure
          end
          item
            Name = 'SaveToFile'
            Parameters = <
              item
                Name = 'FileName'
                DataType = 'String'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Encoding'
                DataType = 'TEncoding'
                HasDefaultValue = True
                DefaultValue = 'nil'
              end>
            OnEval = dwsUnitClassesTStringsMethodsSaveToFileEval
            Kind = mkProcedure
          end
          item
            Name = 'SetCommaText'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitClassesTStringsMethodsSetCommaTextEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetString'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
                IsWritable = False
              end
              item
                Name = 'Value'
                DataType = 'String'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitClassesTStringsMethodsSetStringsEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetText'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitClassesTStringsMethodsSetTextEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetValue'
            Parameters = <
              item
                Name = 'Name'
                DataType = 'String'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Value'
                DataType = 'String'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitClassesTStringsMethodsSetValuesEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'Contains'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'Boolean'
            OnEval = dwsUnitClassesTStringsMethodsContainsEval
            Kind = mkFunction
          end
          item
            Name = 'Remove'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitClassesClassesTStringsMethodsRemoveEval
            Kind = mkProcedure
          end
          item
            Name = 'LoadFromStream'
            Parameters = <
              item
                Name = 'Stream'
                DataType = 'TStream'
              end
              item
                Name = 'Encoding'
                DataType = 'TEncoding'
                HasDefaultValue = True
                DefaultValue = 'nil'
              end>
            OnEval = dwsUnitClassesClassesTStringsMethodsLoadFromStreamEval
            Kind = mkProcedure
          end
          item
            Name = 'SaveToStream'
            Parameters = <
              item
                Name = 'Stream'
                DataType = 'TStream'
              end
              item
                Name = 'Encoding'
                DataType = 'TEncoding'
                HasDefaultValue = True
                DefaultValue = 'nil'
              end>
            OnEval = dwsUnitClassesClassesTStringsMethodsSaveToStreamEval
            Kind = mkProcedure
          end
          item
            Name = 'GetDelimiter'
            ResultType = 'string'
            OnEval = dwsUnitClassesClassesTStringsMethodsGetDelimiterEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetDelimiter'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
              end>
            OnEval = dwsUnitClassesClassesTStringsMethodsSetDelimiterEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetDelimitedText'
            ResultType = 'string'
            OnEval = dwsUnitClassesClassesTStringsMethodsGetDelimitedTextEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetDelimitedText'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitClassesClassesTStringsMethodsSetDelimitedTextEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetQuoteChar'
            ResultType = 'string'
            OnEval = dwsUnitClassesClassesTStringsMethodsGetQuoteCharEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetQuoteChar'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitClassesClassesTStringsMethodsSetQuoteCharEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetLineBreak'
            ResultType = 'string'
            OnEval = dwsUnitClassesClassesTStringsMethodsGetLineBreakEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetLineBreak'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitClassesClassesTStringsMethodsSetLineBreakEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetNameValueSeparator'
            ResultType = 'string'
            OnEval = dwsUnitClassesClassesTStringsMethodsGetNameValueSeparatorEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetNameValueSeparator'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitClassesClassesTStringsMethodsSetNameValueSeparatorEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetStrictDelimiter'
            ResultType = 'boolean'
            OnEval = dwsUnitClassesClassesTStringsMethodsGetStrictDelimiterEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetStrictDelimiter'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitClassesClassesTStringsMethodsSetStrictDelimiterEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetTag'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'integer'
            OnEval = dwsUnitClassesClassesTStringsMethodsGetTagEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetTag'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end
              item
                Name = 'value'
                DataType = 'integer'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitClassesClassesTStringsMethodsSetTagEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetEncoding'
            ResultType = 'TEncoding'
            OnEval = dwsUnitClassesClassesTStringsMethodsGetEncodingEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetDefaultEncoding'
            ResultType = 'TEncoding'
            OnEval = dwsUnitClassesClassesTStringsMethodsGetDefaultEncodingEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetDefaultEncoding'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TEncoding'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitClassesClassesTStringsMethodsSetDefaultEncodingEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Operators = <
          item
            DataType = 'String'
            Operator = ttPLUS_ASSIGN
            UsesAccess = 'Add'
          end
          item
            DataType = 'String'
            Operator = ttMINUS_ASSIGN
            UsesAccess = 'Remove'
          end
          item
            DataType = 'String'
            Operator = ttIN
            UsesAccess = 'Contains'
          end>
        Properties = <
          item
            Name = 'Text'
            DataType = 'String'
            ReadAccess = 'GetText'
            WriteAccess = 'SetText'
          end
          item
            Name = 'Count'
            DataType = 'Integer'
            ReadAccess = 'GetCount'
          end
          item
            Name = 'CommaText'
            DataType = 'String'
            ReadAccess = 'GetCommaText'
            WriteAccess = 'SetCommaText'
          end
          item
            Name = 'Strings'
            DataType = 'String'
            ReadAccess = 'GetString'
            WriteAccess = 'SetString'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
                IsWritable = False
              end>
            IsDefault = True
          end
          item
            Name = 'Names'
            DataType = 'String'
            ReadAccess = 'GetName'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
                IsWritable = False
              end>
          end
          item
            Name = 'Values'
            DataType = 'String'
            ReadAccess = 'GetValue'
            WriteAccess = 'SetValue'
            Parameters = <
              item
                Name = 'Name'
                DataType = 'String'
                IsVarParam = True
                IsWritable = False
              end>
          end
          item
            Name = 'Delimiter'
            DataType = 'string'
            ReadAccess = 'GetDelimiter'
            WriteAccess = 'SetDelimiter'
          end
          item
            Name = 'DelimitedText'
            DataType = 'string'
            ReadAccess = 'GetDelimitedText'
            WriteAccess = 'SetDelimitedText'
          end
          item
            Name = 'QuoteChar'
            DataType = 'string'
            ReadAccess = 'GetQuoteChar'
            WriteAccess = 'SetQuoteChar'
          end
          item
            Name = 'LineBreak'
            DataType = 'string'
            ReadAccess = 'GetLineBreak'
            WriteAccess = 'SetLineBreak'
          end
          item
            Name = 'NameValueSeparator'
            DataType = 'string'
            ReadAccess = 'GetNameValueSeparator'
            WriteAccess = 'SetNameValueSeparator'
          end
          item
            Name = 'StrictDelimiter'
            DataType = 'boolean'
            ReadAccess = 'GetStrictDelimiter'
            WriteAccess = 'SetStrictDelimiter'
          end
          item
            Name = 'Tags'
            DataType = 'integer'
            ReadAccess = 'GetTag'
            WriteAccess = 'SetTag'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
          end
          item
            Name = 'Encoding'
            DataType = 'TEncoding'
            ReadAccess = 'GetEncoding'
          end
          item
            Name = 'DefaultEncoding'
            DataType = 'TEncoding'
            ReadAccess = 'GetDefaultEncoding'
            WriteAccess = 'SetDefaultEncoding'
          end>
      end
      item
        Name = 'TStringList'
        Ancestor = 'TStrings'
        Constructors = <
          item
            Name = 'Create'
            OnEval = dwsUnitClassesClassesTStringListConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'Sort'
            Parameters = <
              item
                Name = 'LocaleInvariant'
                DataType = 'boolean'
                HasDefaultValue = True
                DefaultValue = False
              end>
            OnEval = dwsUnitClassesTStringListMethodsSortEval
            Kind = mkProcedure
          end
          item
            Name = 'Find'
            Parameters = <
              item
                Name = 'S'
                DataType = 'String'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Index'
                DataType = 'Integer'
                IsVarParam = True
              end>
            ResultType = 'Boolean'
            OnEval = dwsUnitClassesTStringListMethodsFindEval
            Kind = mkFunction
          end
          item
            Name = 'GetDuplicates'
            ResultType = 'TStringListDuplicates'
            OnEval = dwsUnitClassesTStringListMethodsGetDuplicatesEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetDuplicates'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TStringListDuplicates'
                IsWritable = False
              end>
            OnEval = dwsUnitClassesTStringListMethodsSetDuplicatesEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetSorted'
            ResultType = 'Boolean'
            OnEval = dwsUnitClassesTStringListMethodsGetSortedEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetSorted'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
                IsWritable = False
              end>
            OnEval = dwsUnitClassesTStringListMethodsSetSortedEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetCaseSensitive'
            ResultType = 'Boolean'
            OnEval = dwsUnitClassesTStringListMethodsGetCaseSensitiveEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetCaseSensitive'
            Parameters = <
              item
                Name = 'value'
                DataType = 'Boolean'
              end>
            OnEval = dwsUnitClassesTStringListMethodsSetCaseSensitiveEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Duplicates'
            DataType = 'TStringListDuplicates'
            ReadAccess = 'GetDuplicates'
            WriteAccess = 'SetDuplicates'
          end
          item
            Name = 'Sorted'
            DataType = 'Boolean'
            ReadAccess = 'GetSorted'
            WriteAccess = 'SetSorted'
          end
          item
            Name = 'CaseSensitive'
            DataType = 'Boolean'
            ReadAccess = 'GetCaseSensitive'
            WriteAccess = 'SetCaseSensitive'
          end>
        OnCleanUp = dwsUnitClassesClassesTStringListCleanUp
      end
      item
        Name = 'TCollection'
        Ancestor = 'TPersistent'
        IsAbstract = True
        Methods = <
          item
            Name = 'GetCount'
            ResultType = 'integer'
            OnEval = dwsUnitClassesClassesTCollectionMethodsGetCountEval
            Kind = mkFunction
          end
          item
            Name = 'Clear'
            OnEval = dwsUnitClassesClassesTCollectionMethodsClearEval
            Kind = mkProcedure
          end
          item
            Name = 'Delete'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            OnEval = dwsUnitClassesClassesTCollectionMethodsDeleteEval
            Kind = mkProcedure
          end
          item
            Name = 'Add'
            ResultType = 'TCollectionItem'
            OnEval = dwsUnitClassesClassesTCollectionMethodsAddEval
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Count'
            DataType = 'integer'
            ReadAccess = 'GetCount'
          end>
      end
      item
        Name = 'TCollectionItem'
        Ancestor = 'TPersistent'
        IsAbstract = True
      end
      item
        Name = 'TComponent'
        IsAbstract = True
        Methods = <
          item
            Name = 'GetOwner'
            ResultType = 'TComponent'
            OnEval = dwsUnitClassesClassesTComponentMethodsGetOwnerEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetName'
            ResultType = 'string'
            OnEval = dwsUnitClassesClassesTComponentMethodsGetNameEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'FindComponent'
            Parameters = <
              item
                Name = 'Name'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TComponent'
            OnEval = dwsUnitClassesClassesTComponentMethodsFindComponentEval
            Kind = mkFunction
          end
          item
            Name = 'GetTag'
            ResultType = 'integer'
            OnEval = dwsUnitClassesClassesTComponentMethodsGetTagEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetTag'
            Parameters = <
              item
                Name = 'value'
                DataType = 'integer'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitClassesClassesTComponentMethodsSetTagEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetComponent'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'TComponent'
            OnEval = dwsUnitClassesClassesTComponentMethodsGetComponentEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetComponentCount'
            ResultType = 'Integer'
            OnEval = dwsUnitClassesClassesTComponentMethodsGetComponentCountEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetComponentIndex'
            ResultType = 'Integer'
            OnEval = dwsUnitClassesClassesTComponentMethodsGetComponentIndexEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetComponentIndex'
            Parameters = <
              item
                Name = 'value'
                DataType = 'Integer'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitClassesClassesTComponentMethodsSetComponentIndexEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Owner'
            DataType = 'TComponent'
            ReadAccess = 'GetOwner'
          end
          item
            Name = 'Name'
            DataType = 'string'
            ReadAccess = 'GetName'
          end
          item
            Name = 'Tag'
            DataType = 'integer'
            ReadAccess = 'GetTag'
            WriteAccess = 'SetTag'
          end
          item
            Name = 'ComponentCount'
            DataType = 'Integer'
            ReadAccess = 'GetComponentCount'
          end
          item
            Name = 'Components'
            DataType = 'TComponent'
            ReadAccess = 'GetComponent'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
          end
          item
            Name = 'ComponentIndex'
            DataType = 'Integer'
            ReadAccess = 'GetComponentIndex'
            WriteAccess = 'SetComponentIndex'
          end>
      end>
    Dependencies.Strings = (
      'System.Stream'
      'System.Text')
    Enumerations = <
      item
        Name = 'TStringListDuplicates'
        Elements = <
          item
            Name = 'dupIgnore'
          end
          item
            Name = 'dupError'
          end
          item
            Name = 'dupAccept'
          end>
      end>
    Functions = <
      item
        Name = 'Rect'
        Parameters = <
          item
            Name = 'Left'
            DataType = 'integer'
          end
          item
            Name = 'Top'
            DataType = 'integer'
          end
          item
            Name = 'Right'
            DataType = 'integer'
          end
          item
            Name = 'Bottom'
            DataType = 'integer'
          end>
        ResultType = 'TRect'
        OnEval = dwsUnitClassesFunctionsRectEval
      end
      item
        Name = 'Point'
        Parameters = <
          item
            Name = 'X'
            DataType = 'integer'
          end
          item
            Name = 'Y'
            DataType = 'integer'
          end>
        ResultType = 'TPoint'
        OnEval = dwsUnitClassesFunctionsPointEval
      end>
    Records = <
      item
        Name = 'TRect'
        Members = <
          item
            Name = 'Left'
            DataType = 'integer'
          end
          item
            Name = 'Top'
            DataType = 'integer'
          end
          item
            Name = 'Right'
            DataType = 'integer'
          end
          item
            Name = 'Bottom'
            DataType = 'integer'
          end>
        Properties = <>
      end
      item
        Name = 'TPoint'
        Members = <
          item
            Name = 'X'
            DataType = 'integer'
          end
          item
            Name = 'Y'
            DataType = 'integer'
          end>
        Properties = <>
      end>
    UnitName = 'System.Classes'
    StaticSymbols = False
    Left = 44
    Top = 24
  end
  object dwsUnitLocalization: TdwsUnit
    Classes = <
      item
        Name = 'TLocalizer'
        IsSealed = True
        IsAbstract = True
        Methods = <
          item
            Name = 'GetStrings'
            ResultType = 'TStrings'
            OnEval = dwsUnitLocalizationClassesTLocalizerMethodsGetStringsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetAddMissingTranslations'
            ResultType = 'boolean'
            OnEval = dwsUnitLocClassesTLocalizerMethodsGetAddMissingTranslationsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetAddMissingTranslations'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLocClassesTLocalizerMethodsSetAddMissingTranslationsEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'Save'
            OnEval = dwsUnitLocalizationClassesTLocalizerMethodsSaveEval
            Kind = mkProcedure
          end
          item
            Name = 'GetUTF8Encode'
            ResultType = 'boolean'
            OnEval = dwsUnitLocalizationClassesTLocalizerMethodsGetUTF8EncodeEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetUTF8Encode'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitLocalizationClassesTLocalizerMethodsSetUTF8EncodeEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Strings'
            DataType = 'TStrings'
            ReadAccess = 'GetStrings'
          end
          item
            Name = 'AddMissingTranslations'
            DataType = 'boolean'
            ReadAccess = 'GetAddMissingTranslations'
            WriteAccess = 'SetAddMissingTranslations'
          end
          item
            Name = 'UTF8Encode'
            DataType = 'boolean'
            ReadAccess = 'GetUTF8Encode'
            WriteAccess = 'SetUTF8Encode'
          end>
      end>
    Dependencies.Strings = (
      'System.Classes')
    Instances = <
      item
        Name = 'Localizer'
        DataType = 'TLocalizer'
        OnInstantiate = dwsUnitLocalizationInstancesLocalizerInstantiate
      end>
    UnitName = 'System.Localization'
    StaticSymbols = False
    Left = 204
    Top = 100
  end
end
