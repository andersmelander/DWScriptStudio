object DataModuleScriptIniFiles: TDataModuleScriptIniFiles
  Height = 289
  Width = 368
  object dwsUnitIniFile: TdwsUnit
    Classes = <
      item
        Name = 'TCustomIniFile'
        IsAbstract = True
        IsInternal = True
        Methods = <
          item
            Name = 'ReadString'
            Parameters = <
              item
                Name = 'Section'
                DataType = 'String'
              end
              item
                Name = 'Ident'
                DataType = 'String'
              end
              item
                Name = 'Default'
                DataType = 'String'
                HasDefaultValue = True
                DefaultValue = ''
              end>
            ResultType = 'String'
            Kind = mkFunction
            OnEval = dwsUnitClassesTIniFileMethodsReadStringEval
          end
          item
            Name = 'WriteString'
            Parameters = <
              item
                Name = 'Section'
                DataType = 'String'
              end
              item
                Name = 'Ident'
                DataType = 'String'
              end
              item
                Name = 'Value'
                DataType = 'String'
              end>
            Kind = mkProcedure
            OnEval = dwsUnitClassesTIniFileMethodsWriteStringEval
          end
          item
            Name = 'EraseSection'
            Parameters = <
              item
                Name = 'Section'
                DataType = 'String'
              end>
            Kind = mkProcedure
            OnEval = dwsUnitClassesTIniFileMethodsEraseSectionEval
          end
          item
            Name = 'DeleteKey'
            Parameters = <
              item
                Name = 'Section'
                DataType = 'String'
              end
              item
                Name = 'Ident'
                DataType = 'String'
              end>
            Kind = mkProcedure
            OnEval = dwsUnitClassesTIniFileMethodsDeleteKeyEval
          end
          item
            Name = 'UpdateFile'
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitClassesTIniFileMethodsUpdateFileEval
          end
          item
            Name = 'SectionExists'
            Parameters = <
              item
                Name = 'Section'
                DataType = 'String'
              end>
            ResultType = 'Boolean'
            Kind = mkFunction
            OnEval = dwsUnitClassesTIniFileMethodsSectionExistsEval
          end
          item
            Name = 'ReadInteger'
            Parameters = <
              item
                Name = 'Section'
                DataType = 'String'
              end
              item
                Name = 'Ident'
                DataType = 'String'
              end
              item
                Name = 'Default'
                DataType = 'Integer'
                HasDefaultValue = True
                DefaultValue = 0
              end>
            ResultType = 'Integer'
            Kind = mkFunction
            OnEval = dwsUnitClassesTIniFileMethodsReadIntegerEval
          end
          item
            Name = 'WriteInteger'
            Parameters = <
              item
                Name = 'Section'
                DataType = 'String'
              end
              item
                Name = 'Ident'
                DataType = 'String'
              end
              item
                Name = 'Value'
                DataType = 'Integer'
              end>
            Kind = mkProcedure
            OnEval = dwsUnitClassesTIniFileMethodsWriteIntegerEval
          end
          item
            Name = 'ReadBool'
            Parameters = <
              item
                Name = 'Section'
                DataType = 'String'
              end
              item
                Name = 'Ident'
                DataType = 'String'
              end
              item
                Name = 'Default'
                DataType = 'Boolean'
                HasDefaultValue = True
                DefaultValue = False
              end>
            ResultType = 'Boolean'
            Kind = mkFunction
            OnEval = dwsUnitClassesTIniFileMethodsReadBoolEval
          end
          item
            Name = 'WriteBool'
            Parameters = <
              item
                Name = 'Section'
                DataType = 'String'
              end
              item
                Name = 'Ident'
                DataType = 'String'
              end
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Kind = mkProcedure
            OnEval = dwsUnitClassesTIniFileMethodsWriteBoolEval
          end
          item
            Name = 'ReadDate'
            Parameters = <
              item
                Name = 'Section'
                DataType = 'String'
              end
              item
                Name = 'Name'
                DataType = 'String'
              end
              item
                Name = 'Default'
                DataType = 'Float'
              end>
            ResultType = 'Float'
            Kind = mkFunction
            OnEval = dwsUnitClassesTIniFileMethodsReadDateEval
          end
          item
            Name = 'ReadDateTime'
            Parameters = <
              item
                Name = 'Section'
                DataType = 'String'
              end
              item
                Name = 'Name'
                DataType = 'String'
              end
              item
                Name = 'Default'
                DataType = 'Float'
              end>
            ResultType = 'Float'
            Kind = mkFunction
            OnEval = dwsUnitClassesTIniFileMethodsReadDateTimeEval
          end
          item
            Name = 'ReadFloat'
            Parameters = <
              item
                Name = 'Section'
                DataType = 'String'
              end
              item
                Name = 'Name'
                DataType = 'String'
              end
              item
                Name = 'Default'
                DataType = 'Float'
                HasDefaultValue = True
                DefaultValue = 0.000000000000000000
              end>
            ResultType = 'Float'
            Kind = mkFunction
            OnEval = dwsUnitClassesTIniFileMethodsReadFloatEval
          end
          item
            Name = 'ReadTime'
            Parameters = <
              item
                Name = 'Section'
                DataType = 'String'
              end
              item
                Name = 'Name'
                DataType = 'String'
              end
              item
                Name = 'Default'
                DataType = 'Float'
              end>
            ResultType = 'Float'
            Kind = mkFunction
            OnEval = dwsUnitClassesTIniFileMethodsReadTimeEval
          end
          item
            Name = 'WriteDate'
            Parameters = <
              item
                Name = 'Section'
                DataType = 'String'
              end
              item
                Name = 'Name'
                DataType = 'String'
              end
              item
                Name = 'Value'
                DataType = 'Float'
              end>
            Kind = mkProcedure
            OnEval = dwsUnitClassesTIniFileMethodsWriteDateEval
          end
          item
            Name = 'WriteDateTime'
            Parameters = <
              item
                Name = 'Section'
                DataType = 'String'
              end
              item
                Name = 'Name'
                DataType = 'String'
              end
              item
                Name = 'Value'
                DataType = 'Float'
              end>
            Kind = mkProcedure
            OnEval = dwsUnitClassesTIniFileMethodsWriteDateTimeEval
          end
          item
            Name = 'WriteFloat'
            Parameters = <
              item
                Name = 'Section'
                DataType = 'String'
              end
              item
                Name = 'Name'
                DataType = 'String'
              end
              item
                Name = 'Value'
                DataType = 'Float'
              end>
            Kind = mkProcedure
            OnEval = dwsUnitClassesTIniFileMethodsWriteFloatEval
          end
          item
            Name = 'WriteTime'
            Parameters = <
              item
                Name = 'Section'
                DataType = 'String'
              end
              item
                Name = 'Name'
                DataType = 'String'
              end
              item
                Name = 'Value'
                DataType = 'Float'
              end>
            Kind = mkProcedure
            OnEval = dwsUnitClassesTIniFileMethodsWriteTimeEval
          end
          item
            Name = 'ValueExists'
            Parameters = <
              item
                Name = 'Section'
                DataType = 'String'
              end
              item
                Name = 'Ident'
                DataType = 'String'
              end>
            ResultType = 'Boolean'
            Kind = mkFunction
            OnEval = dwsUnitClassesTIniFileMethodsValueExistsEval
          end>
        OnCleanUp = dwsUnitIniFileClassesTIniFileCleanUp
      end
      item
        Name = 'TIniFile'
        Ancestor = 'TCustomIniFile'
        IsSealed = True
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'Filename'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitIniFileClassesTIniFileConstructorsCreateEval
          end>
      end
      item
        Name = 'TMemoryIniFile'
        Ancestor = 'TCustomIniFile'
        Constructors = <
          item
            Name = 'Create'
            OnEval = dwsUnitIniFileClassesTMemoryIniFileConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'LoadFromStream'
            Parameters = <
              item
                Name = 'Stream'
                DataType = 'TStream'
              end>
            Kind = mkProcedure
            OnEval = dwsUnitIniFileClassesTMemoryIniFileMethodsLoadFromStreamEval
          end
          item
            Name = 'SaveToStream'
            Parameters = <
              item
                Name = 'Stream'
                DataType = 'TStream'
              end>
            Kind = mkProcedure
            OnEval = dwsUnitIniFileClassesTMemoryIniFileMethodsSaveToStreamEval
          end
          item
            Name = 'LoadFromFile'
            Parameters = <
              item
                Name = 'Filename'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
            OnEval = dwsUnitIniFileClassesTMemoryIniFileMethodsLoadFromFileEval
          end
          item
            Name = 'SaveToFile'
            Parameters = <
              item
                Name = 'Filename'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
            OnEval = dwsUnitIniFileClassesTMemoryIniFileMethodsSaveToFileEval
          end
          item
            Name = 'Clear'
            Kind = mkProcedure
            OnEval = dwsUnitIniFileClassesTMemoryIniFileMethodsClearEval
          end>
      end
      item
        Name = 'TRegistryIniFile'
        Ancestor = 'TCustomIniFile'
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'Key'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'AAccess'
                DataType = 'integer'
                HasDefaultValue = True
                DefaultValue = 983103
              end>
            OnEval = dwsUnitIniFileClassesTRegistryIniFileConstructorsCreateEval
          end>
        Constants = <
          item
            Name = 'KEY_QUERY_VALUE'
            DataType = 'integer'
            Value = 1
          end
          item
            Name = 'KEY_SET_VALUE'
            DataType = 'integer'
            Value = 2
          end
          item
            Name = 'KEY_CREATE_SUB_KEY'
            DataType = 'integer'
            Value = 4
          end
          item
            Name = 'KEY_ENUMERATE_SUB_KEYS'
            DataType = 'integer'
            Value = 8
          end
          item
            Name = 'KEY_NOTIFY'
            DataType = 'integer'
            Value = 16
          end
          item
            Name = 'KEY_CREATE_LINK'
            DataType = 'integer'
            Value = 32
          end
          item
            Name = 'KEY_WOW64_64KEY'
            DataType = 'integer'
            Value = 256
          end
          item
            Name = 'KEY_WOW64_32KEY'
            DataType = 'integer'
            Value = 512
          end
          item
            Name = 'KEY_WOW64_RES'
            DataType = 'integer'
            Value = 768
          end
          item
            Name = 'KEY_READ'
            DataType = 'integer'
            Value = 131097
          end
          item
            Name = 'KEY_ALL_ACCESS'
            DataType = 'integer'
            Value = 983103
          end
          item
            Name = 'KEY_EXECUTE'
            DataType = 'integer'
            Value = 131097
          end
          item
            Name = 'KEY_WRITE'
            DataType = 'integer'
            Value = 131078
          end>
      end
      item
        Name = 'TXMLIniFile'
        Ancestor = 'TCustomIniFile'
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'Filename'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'NodePath'
                DataType = 'string'
                IsWritable = False
                HasDefaultValue = True
              end>
            Overloaded = True
            OnEval = dwsUnitIniFileClassesTXMLIniFileConstructorsCreate1Eval
          end
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'Stream'
                DataType = 'TStream'
              end
              item
                Name = 'NodePath'
                DataType = 'string'
                IsWritable = False
                HasDefaultValue = True
              end>
            Overloaded = True
            OnEval = dwsUnitIniFileClassesTXMLIniFileConstructorsCreate2Eval
          end>
        Methods = <
          item
            Name = 'SaveToFile'
            Parameters = <
              item
                Name = 'Filename'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
            OnEval = dwsUnitIniFileClassesTXMLIniFileMethodsSaveToFileEval
          end
          item
            Name = 'SaveToStream'
            Parameters = <
              item
                Name = 'Stream'
                DataType = 'TStream'
              end>
            Kind = mkProcedure
            OnEval = dwsUnitIniFileClassesTXMLIniFileMethodsSaveToStreamEval
          end
          item
            Name = 'Clear'
            Kind = mkProcedure
            OnEval = dwsUnitIniFileClassesTXMLIniFileMethodsClearEval
          end>
      end>
    Dependencies.Strings = (
      'System.Classes'
      'System.Stream')
    UnitName = 'System.IO.IniFiles'
    StaticSymbols = False
    Left = 88
    Top = 40
  end
end
