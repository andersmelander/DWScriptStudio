object DataModuleScriptClasses: TDataModuleScriptClasses
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
        IsInternal = True
        Methods = <
          item
            Name = 'AssignTo'
            Parameters = <
              item
                Name = 'Dest'
                DataType = 'TPersistent'
              end>
            Attributes = [maVirtual]
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitClassesClassesTPersistentMethodsAssignToEval
          end
          item
            Name = 'Assign'
            Parameters = <
              item
                Name = 'Source'
                DataType = 'TPersistent'
              end>
            Attributes = [maVirtual]
            Kind = mkProcedure
            OnEval = dwsUnitClassesClassesTPersistentMethodsAssignEval
          end>
      end
      item
        Name = 'TStrings'
        Ancestor = 'TPersistent'
        IsAbstract = True
        IsInternal = True
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
            Kind = mkFunction
            OnEval = dwsUnitClassesTStringsMethodsAddEval
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
            Kind = mkFunction
            OnEval = dwsUnitClassesClassesTStringsMethodsAddTagEval
          end
          item
            Name = 'AddStrings'
            Parameters = <
              item
                Name = 'Strings'
                DataType = 'TStrings'
                IsWritable = False
              end>
            Kind = mkProcedure
            OnEval = dwsUnitClassesTStringsMethodsAddStringsEval
          end
          item
            Name = 'Clear'
            Kind = mkProcedure
            OnEval = dwsUnitClassesTStringsMethodsClearEval
          end
          item
            Name = 'Delete'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
                IsWritable = False
              end>
            Kind = mkProcedure
            OnEval = dwsUnitClassesTStringsMethodsDeleteEval
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
            Kind = mkProcedure
            OnEval = dwsUnitClassesTStringsMethodsExchangeEval
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
            Kind = mkFunction
            OnEval = dwsUnitClassesTStringsMethodsGetEval
          end
          item
            Name = 'GetCommaText'
            ResultType = 'String'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitClassesTStringsMethodsGetCommaTextEval
          end
          item
            Name = 'GetCount'
            ResultType = 'Integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitClassesTStringsMethodsGetCountEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitClassesTStringsMethodsGetNameEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitClassesTStringsMethodsGetStringsEval
          end
          item
            Name = 'GetText'
            ResultType = 'String'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitClassesTStringsMethodsGetTextEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitClassesTStringsMethodsGetValuesEval
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
            Kind = mkFunction
            OnEval = dwsUnitClassesTStringsMethodsIndexOfEval
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
            Kind = mkFunction
            OnEval = dwsUnitClassesTStringsMethodsIndexOfNameEval
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
            Kind = mkProcedure
            OnEval = dwsUnitClassesTStringsMethodsInsertEval
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
            Kind = mkProcedure
            OnEval = dwsUnitClassesTStringsMethodsLoadFromFileEval
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
            Kind = mkProcedure
            OnEval = dwsUnitClassesTStringsMethodsMoveEval
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
            Kind = mkProcedure
            OnEval = dwsUnitClassesTStringsMethodsSaveToFileEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitClassesTStringsMethodsSetCommaTextEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitClassesTStringsMethodsSetStringsEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitClassesTStringsMethodsSetTextEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitClassesTStringsMethodsSetValuesEval
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
            Kind = mkFunction
            OnEval = dwsUnitClassesTStringsMethodsContainsEval
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
            Kind = mkProcedure
            OnEval = dwsUnitClassesClassesTStringsMethodsRemoveEval
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
            Kind = mkProcedure
            OnEval = dwsUnitClassesClassesTStringsMethodsLoadFromStreamEval
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
            Kind = mkProcedure
            OnEval = dwsUnitClassesClassesTStringsMethodsSaveToStreamEval
          end
          item
            Name = 'GetDelimiter'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitClassesClassesTStringsMethodsGetDelimiterEval
          end
          item
            Name = 'SetDelimiter'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitClassesClassesTStringsMethodsSetDelimiterEval
          end
          item
            Name = 'GetDelimitedText'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitClassesClassesTStringsMethodsGetDelimitedTextEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitClassesClassesTStringsMethodsSetDelimitedTextEval
          end
          item
            Name = 'GetQuoteChar'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitClassesClassesTStringsMethodsGetQuoteCharEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitClassesClassesTStringsMethodsSetQuoteCharEval
          end
          item
            Name = 'GetLineBreak'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitClassesClassesTStringsMethodsGetLineBreakEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitClassesClassesTStringsMethodsSetLineBreakEval
          end
          item
            Name = 'GetNameValueSeparator'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitClassesClassesTStringsMethodsGetNameValueSeparatorEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitClassesClassesTStringsMethodsSetNameValueSeparatorEval
          end
          item
            Name = 'GetStrictDelimiter'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitClassesClassesTStringsMethodsGetStrictDelimiterEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitClassesClassesTStringsMethodsSetStrictDelimiterEval
          end
          item
            Name = 'GetTag'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitClassesClassesTStringsMethodsGetTagEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitClassesClassesTStringsMethodsSetTagEval
          end
          item
            Name = 'GetEncoding'
            ResultType = 'TEncoding'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitClassesClassesTStringsMethodsGetEncodingEval
          end
          item
            Name = 'GetDefaultEncoding'
            ResultType = 'TEncoding'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitClassesClassesTStringsMethodsGetDefaultEncodingEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitClassesClassesTStringsMethodsSetDefaultEncodingEval
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
            Kind = mkProcedure
            OnEval = dwsUnitClassesTStringListMethodsSortEval
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
            Kind = mkFunction
            OnEval = dwsUnitClassesTStringListMethodsFindEval
          end
          item
            Name = 'GetDuplicates'
            ResultType = 'TStringListDuplicates'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitClassesTStringListMethodsGetDuplicatesEval
          end
          item
            Name = 'SetDuplicates'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TStringListDuplicates'
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitClassesTStringListMethodsSetDuplicatesEval
          end
          item
            Name = 'GetSorted'
            ResultType = 'Boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitClassesTStringListMethodsGetSortedEval
          end
          item
            Name = 'SetSorted'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitClassesTStringListMethodsSetSortedEval
          end
          item
            Name = 'GetCaseSensitive'
            ResultType = 'Boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitClassesTStringListMethodsGetCaseSensitiveEval
          end
          item
            Name = 'SetCaseSensitive'
            Parameters = <
              item
                Name = 'value'
                DataType = 'Boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitClassesTStringListMethodsSetCaseSensitiveEval
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
        IsInternal = True
        Methods = <
          item
            Name = 'GetCount'
            ResultType = 'integer'
            Kind = mkFunction
            OnEval = dwsUnitClassesClassesTCollectionMethodsGetCountEval
          end
          item
            Name = 'Clear'
            Kind = mkProcedure
            OnEval = dwsUnitClassesClassesTCollectionMethodsClearEval
          end
          item
            Name = 'Delete'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            Kind = mkProcedure
            OnEval = dwsUnitClassesClassesTCollectionMethodsDeleteEval
          end
          item
            Name = 'Add'
            ResultType = 'TCollectionItem'
            Kind = mkFunction
            OnEval = dwsUnitClassesClassesTCollectionMethodsAddEval
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
        IsInternal = True
      end
      item
        Name = 'TComponent'
        IsAbstract = True
        IsInternal = True
        Methods = <
          item
            Name = 'GetOwner'
            ResultType = 'TComponent'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitClassesClassesTComponentMethodsGetOwnerEval
          end
          item
            Name = 'GetName'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitClassesClassesTComponentMethodsGetNameEval
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
            Kind = mkFunction
            OnEval = dwsUnitClassesClassesTComponentMethodsFindComponentEval
          end
          item
            Name = 'GetTag'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitClassesClassesTComponentMethodsGetTagEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitClassesClassesTComponentMethodsSetTagEval
          end
          item
            Name = 'GetComponent'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'TComponent'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitClassesClassesTComponentMethodsGetComponentEval
          end
          item
            Name = 'GetComponentCount'
            ResultType = 'Integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitClassesClassesTComponentMethodsGetComponentCountEval
          end
          item
            Name = 'GetComponentIndex'
            ResultType = 'Integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitClassesClassesTComponentMethodsGetComponentIndexEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitClassesClassesTComponentMethodsSetComponentIndexEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLocalizationClassesTLocalizerMethodsGetStringsEval
          end
          item
            Name = 'GetAddMissingTranslations'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLocClassesTLocalizerMethodsGetAddMissingTranslationsEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitLocClassesTLocalizerMethodsSetAddMissingTranslationsEval
          end
          item
            Name = 'Save'
            Kind = mkProcedure
            OnEval = dwsUnitLocalizationClassesTLocalizerMethodsSaveEval
          end
          item
            Name = 'GetUTF8Encode'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitLocalizationClassesTLocalizerMethodsGetUTF8EncodeEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitLocalizationClassesTLocalizerMethodsSetUTF8EncodeEval
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
