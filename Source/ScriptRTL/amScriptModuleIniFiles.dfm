object DataModuleScriptIniFiles: TDataModuleScriptIniFiles
  OldCreateOrder = False
  Height = 289
  Width = 368
  object dwsUnitIniFile: TdwsUnit
    Classes = <
      item
        Name = 'TCustomIniFile'
        IsAbstract = True
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
            OnEval = dwsUnitClassesTIniFileMethodsReadStringEval
            Kind = mkFunction
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
            OnEval = dwsUnitClassesTIniFileMethodsWriteStringEval
            Kind = mkProcedure
          end
          item
            Name = 'EraseSection'
            Parameters = <
              item
                Name = 'Section'
                DataType = 'String'
              end>
            OnEval = dwsUnitClassesTIniFileMethodsEraseSectionEval
            Kind = mkProcedure
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
            OnEval = dwsUnitClassesTIniFileMethodsDeleteKeyEval
            Kind = mkProcedure
          end
          item
            Name = 'UpdateFile'
            OnEval = dwsUnitClassesTIniFileMethodsUpdateFileEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SectionExists'
            Parameters = <
              item
                Name = 'Section'
                DataType = 'String'
              end>
            ResultType = 'Boolean'
            OnEval = dwsUnitClassesTIniFileMethodsSectionExistsEval
            Kind = mkFunction
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
            OnEval = dwsUnitClassesTIniFileMethodsReadIntegerEval
            Kind = mkFunction
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
            OnEval = dwsUnitClassesTIniFileMethodsWriteIntegerEval
            Kind = mkProcedure
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
            OnEval = dwsUnitClassesTIniFileMethodsReadBoolEval
            Kind = mkFunction
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
            OnEval = dwsUnitClassesTIniFileMethodsWriteBoolEval
            Kind = mkProcedure
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
            OnEval = dwsUnitClassesTIniFileMethodsReadDateEval
            Kind = mkFunction
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
            OnEval = dwsUnitClassesTIniFileMethodsReadDateTimeEval
            Kind = mkFunction
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
            OnEval = dwsUnitClassesTIniFileMethodsReadFloatEval
            Kind = mkFunction
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
            OnEval = dwsUnitClassesTIniFileMethodsReadTimeEval
            Kind = mkFunction
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
            OnEval = dwsUnitClassesTIniFileMethodsWriteDateEval
            Kind = mkProcedure
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
            OnEval = dwsUnitClassesTIniFileMethodsWriteDateTimeEval
            Kind = mkProcedure
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
            OnEval = dwsUnitClassesTIniFileMethodsWriteFloatEval
            Kind = mkProcedure
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
            OnEval = dwsUnitClassesTIniFileMethodsWriteTimeEval
            Kind = mkProcedure
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
            OnEval = dwsUnitClassesTIniFileMethodsValueExistsEval
            Kind = mkFunction
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
            OnEval = dwsUnitIniFileClassesTMemoryIniFileMethodsLoadFromStreamEval
            Kind = mkProcedure
          end
          item
            Name = 'SaveToStream'
            Parameters = <
              item
                Name = 'Stream'
                DataType = 'TStream'
              end>
            OnEval = dwsUnitIniFileClassesTMemoryIniFileMethodsSaveToStreamEval
            Kind = mkProcedure
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
            OnEval = dwsUnitIniFileClassesTMemoryIniFileMethodsLoadFromFileEval
            Kind = mkProcedure
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
            OnEval = dwsUnitIniFileClassesTMemoryIniFileMethodsSaveToFileEval
            Kind = mkProcedure
          end
          item
            Name = 'Clear'
            OnEval = dwsUnitIniFileClassesTMemoryIniFileMethodsClearEval
            Kind = mkProcedure
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
            OnEval = dwsUnitIniFileClassesTXMLIniFileMethodsSaveToFileEval
            Kind = mkProcedure
          end
          item
            Name = 'SaveToStream'
            Parameters = <
              item
                Name = 'Stream'
                DataType = 'TStream'
              end>
            OnEval = dwsUnitIniFileClassesTXMLIniFileMethodsSaveToStreamEval
            Kind = mkProcedure
          end
          item
            Name = 'Clear'
            OnEval = dwsUnitIniFileClassesTXMLIniFileMethodsClearEval
            Kind = mkProcedure
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
