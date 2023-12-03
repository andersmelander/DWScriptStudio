object DataModuleScriptEncoding: TDataModuleScriptEncoding
  OnCreate = DataModuleCreate
  Height = 150
  Width = 340
  object dwsUnitEncoding: TdwsUnit
    Classes = <
      item
        Name = 'TEncoding'
        IsAbstract = True
        IsInternal = True
        Constructors = <
          item
            Name = 'Create'
            Attributes = [maVirtual, maAbstract]
          end>
        Methods = <
          item
            Name = 'GetUTF7'
            ResultType = 'TEncoding'
            Attributes = [maStatic]
            Visibility = cvProtected
            Kind = mkClassFunction
            OnEval = dwsUnitEncodingClassesTEncodingMethodsGetUTF7Eval
          end
          item
            Name = 'GetUTF8'
            ResultType = 'TEncoding'
            Attributes = [maStatic]
            Visibility = cvProtected
            Kind = mkClassFunction
            OnEval = dwsUnitEncodingClassesTEncodingMethodsGetUTF8Eval
          end
          item
            Name = 'GetASCII'
            ResultType = 'TEncoding'
            Attributes = [maStatic]
            Visibility = cvProtected
            Kind = mkClassFunction
            OnEval = dwsUnitEncodingClassesTEncodingMethodsGetASCIIEval
          end
          item
            Name = 'GetBigEndianUnicode'
            ResultType = 'TEncoding'
            Attributes = [maStatic]
            Visibility = cvProtected
            Kind = mkClassFunction
            OnEval = dwsUnitEncodingClassesTEncodingMethodsGetBigEndianUnicodeEval
          end
          item
            Name = 'GetUnicode'
            ResultType = 'TEncoding'
            Attributes = [maStatic]
            Visibility = cvProtected
            Kind = mkClassFunction
            OnEval = dwsUnitEncodingClassesTEncodingMethodsGetUnicodeEval
          end
          item
            Name = 'GetANSI'
            ResultType = 'TEncoding'
            Attributes = [maStatic]
            Visibility = cvProtected
            Kind = mkClassFunction
            OnEval = dwsUnitEncodingClassesTEncodingMethodsGetDefaultEval
          end
          item
            Name = 'GetCodePage'
            ResultType = 'TCodepage'
            Attributes = [maVirtual]
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitEncodingClassesTEncodingMethodsGetCodePageEval
          end
          item
            Name = 'GetEncodingName'
            ResultType = 'string'
            Attributes = [maVirtual]
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitEncodingClassesTEncodingMethodsGetEncodingNameEval
          end
          item
            Name = 'GetIsSingleByte'
            ResultType = 'Boolean'
            Attributes = [maVirtual]
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitEncodingClassesTEncodingMethodsGetIsSingleByteEval
          end
          item
            Name = 'GetEncoding'
            Parameters = <
              item
                Name = 'CodePage'
                DataType = 'TCodepage'
              end>
            ResultType = 'TEncoding'
            Overloaded = True
            Attributes = [maStatic]
            Kind = mkClassFunction
            OnEval = dwsUnitEncodingClassesTEncodingMethodsGetEncoding0Eval
          end
          item
            Name = 'GetEncoding'
            Parameters = <
              item
                Name = 'EncodingName'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TEncoding'
            Overloaded = True
            Attributes = [maStatic]
            Kind = mkClassFunction
            OnEval = dwsUnitEncodingClassesTEncodingMethodsGetEncoding1Eval
          end
          item
            Name = 'IsStandardEncoding'
            Parameters = <
              item
                Name = 'AEncoding'
                DataType = 'TEncoding'
              end>
            ResultType = 'Boolean'
            Attributes = [maStatic]
            Kind = mkClassFunction
            OnEval = dwsUnitEncodingClassesTEncodingMethodsIsStandardEncodingEval
          end
          item
            Name = 'Clone'
            ResultType = 'TEncoding'
            Attributes = [maVirtual]
            Kind = mkFunction
            OnEval = dwsUnitEncodingClassesTEncodingMethodsCloneEval
          end
          item
            Name = 'GetPreamble'
            ResultType = 'string'
            Attributes = [maVirtual]
            Kind = mkFunction
            OnEval = dwsUnitEncodingClassesTEncodingMethodsGetPreambleEval
          end>
        Properties = <
          item
            Name = 'UTF7'
            DataType = 'TEncoding'
            ReadAccess = 'GetUTF7'
          end
          item
            Name = 'UTF8'
            DataType = 'TEncoding'
            ReadAccess = 'GetUTF8'
          end
          item
            Name = 'ASCII'
            DataType = 'TEncoding'
            ReadAccess = 'GetASCII'
          end
          item
            Name = 'Unicode'
            DataType = 'TEncoding'
            ReadAccess = 'GetUnicode'
          end
          item
            Name = 'BigEndianUnicode'
            DataType = 'TEncoding'
            ReadAccess = 'GetBigEndianUnicode'
          end
          item
            Name = 'ANSI'
            DataType = 'TEncoding'
            ReadAccess = 'GetANSI'
          end
          item
            Name = 'CodePage'
            DataType = 'TCodepage'
            ReadAccess = 'GetCodePage'
          end
          item
            Name = 'EncodingName'
            DataType = 'string'
            ReadAccess = 'GetEncodingName'
          end
          item
            Name = 'IsSingleByte'
            DataType = 'Boolean'
            ReadAccess = 'GetIsSingleByte'
          end>
        OnCleanUp = dwsUnitEncodingClassesTEncodingCleanUp
      end
      item
        Name = 'TMultiByteCharacterSetEncoding'
        Ancestor = 'TEncoding'
        Constructors = <
          item
            Name = 'Create'
            Overloaded = True
            OnEval = dwsUnitEncodingClassesTMBCSEncodingConstructorsCreate0Eval
            Attributes = [maVirtual, maOverride]
          end
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'CodePage'
                DataType = 'integer'
              end>
            Overloaded = True
            OnEval = dwsUnitEncodingClassesTMBCSEncodingConstructorsCreate1Eval
            Attributes = [maVirtual]
          end>
      end
      item
        Name = 'TUTF7Encoding'
        Ancestor = 'TMultiByteCharacterSetEncoding'
        Constructors = <
          item
            Name = 'Create'
            OnEval = dwsUnitEncodingClassesTUTF7EncodingConstructorsCreateEval
            Attributes = [maVirtual, maOverride]
          end>
      end
      item
        Name = 'TUTF8Encoding'
        Ancestor = 'TUTF7Encoding'
        Constructors = <
          item
            Name = 'Create'
            Overloaded = True
            OnEval = dwsUnitEncodingClassesTUTF8EncodingConstructorsCreate_Eval
            Attributes = [maVirtual, maOverride]
          end
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'EmitBOM'
                DataType = 'boolean'
              end>
            Overloaded = True
            OnEval = dwsUnitEncodingClassesTUTF8EncodingConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'GetEmitBOM'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitEncodingClassesTUTF8EncodingMethodsGetEmitBOMEval
          end>
        Properties = <
          item
            Name = 'EmitBOM'
            DataType = 'boolean'
            ReadAccess = 'GetEmitBOM'
          end>
      end
      item
        Name = 'TUnicodeEncoding'
        Ancestor = 'TEncoding'
        Constructors = <
          item
            Name = 'Create'
            OnEval = dwsUnitEncodingClassesTUnicodeEncodingConstructorsCreateEval
            Attributes = [maVirtual, maOverride]
          end>
      end
      item
        Name = 'TBigEndianUnicodeEncoding'
        Ancestor = 'TUnicodeEncoding'
        Constructors = <
          item
            Name = 'Create'
            OnEval = dwsUnitEncodingClassesTBigEndianUnicodeEncodingConstructorsCreateEval
            Attributes = [maVirtual, maOverride]
          end>
      end>
    Constants = <
      item
        Name = 'CP_ACP'
        DataType = 'TCodepage'
        Value = 0
      end
      item
        Name = 'CP_OEM'
        DataType = 'TCodepage'
        Value = 1
      end
      item
        Name = 'CP_SYMBOL'
        DataType = 'TCodepage'
        Value = 42
      end
      item
        Name = 'CP_UTF16LE'
        DataType = 'TCodepage'
        Value = 1200
      end
      item
        Name = 'CP_UTF16BE'
        DataType = 'TCodepage'
        Value = 1201
      end
      item
        Name = 'CP_UTF7'
        DataType = 'TCodepage'
        Value = 65000
      end
      item
        Name = 'CP_UTF8'
        DataType = 'TCodepage'
        Value = 65001
      end>
    Enumerations = <
      item
        Name = 'CodePage'
        Elements = <
          item
            Name = 'ACP'
            IsUserDef = True
          end
          item
            Name = 'OEM'
            UserDefValue = 1
            IsUserDef = True
          end
          item
            Name = 'SYMBOL'
            UserDefValue = 42
            IsUserDef = True
          end
          item
            Name = 'UTF16LE'
            UserDefValue = 1200
            IsUserDef = True
          end
          item
            Name = 'UTF16BE'
            UserDefValue = 1201
            IsUserDef = True
          end
          item
            Name = 'UTF7'
            UserDefValue = 65000
            IsUserDef = True
          end
          item
            Name = 'UTF8'
            UserDefValue = 65001
            IsUserDef = True
          end>
        Style = enumScoped
      end>
    Synonyms = <
      item
        Name = 'TMBCSEncoding'
        DataType = 'TMultiByteCharacterSetEncoding'
      end
      item
        Name = 'TCodepage'
        DataType = 'integer'
      end>
    UnitName = 'System.Text'
    StaticSymbols = False
    Left = 68
    Top = 36
  end
end
