object DataModuleScriptCrypto: TDataModuleScriptCrypto
  Height = 150
  Width = 215
  object dwsCrypto: TdwsUnit
    Classes = <
      item
        Name = 'HashAlgorithm'
        IsAbstract = True
        IsStatic = True
        Methods = <
          item
            Name = 'HashData'
            Parameters = <
              item
                Name = 'data'
                DataType = 'String'
              end>
            ResultType = 'String'
            Attributes = [maVirtual, maAbstract]
            Kind = mkClassFunction
          end>
      end
      item
        Name = 'HashSHA256'
        Ancestor = 'HashAlgorithm'
        Methods = <
          item
            Name = 'HashData'
            Parameters = <
              item
                Name = 'data'
                DataType = 'String'
              end>
            ResultType = 'String'
            Attributes = [maVirtual, maOverride]
            Kind = mkClassFunction
            OnEval = dwsCryptoClassesSHA256MethodsHashDataEval
          end>
      end
      item
        Name = 'HashSHA1'
        Ancestor = 'HashAlgorithm'
        Methods = <
          item
            Name = 'HashData'
            Parameters = <
              item
                Name = 'data'
                DataType = 'String'
              end>
            ResultType = 'String'
            Attributes = [maVirtual, maOverride]
            Kind = mkClassFunction
            OnEval = dwsCryptoClassesSHA1MethodsHashDataEval
          end>
      end
      item
        Name = 'HashMD5'
        Ancestor = 'HashAlgorithm'
        Methods = <
          item
            Name = 'HashData'
            Parameters = <
              item
                Name = 'data'
                DataType = 'String'
              end>
            ResultType = 'String'
            Attributes = [maVirtual, maOverride]
            Kind = mkClassFunction
            OnEval = dwsCryptoClassesMD5MethodsHashDataEval
          end>
      end
      item
        Name = 'HashRIPEMD160'
        Ancestor = 'HashAlgorithm'
        Methods = <
          item
            Name = 'HashData'
            Parameters = <
              item
                Name = 'data'
                DataType = 'String'
              end>
            ResultType = 'String'
            Attributes = [maVirtual, maOverride]
            Kind = mkClassFunction
            OnEval = dwsCryptoClassesHashRIPEMD160MethodsHashDataEval
          end>
      end
      item
        Name = 'HashCRC32'
        Ancestor = 'HashAlgorithm'
        Methods = <
          item
            Name = 'HashData'
            Parameters = <
              item
                Name = 'data'
                DataType = 'String'
              end>
            ResultType = 'String'
            Attributes = [maVirtual, maOverride]
            Kind = mkClassFunction
            OnEval = dwsCryptoClassesHashCRC32MethodsHashDataEval
          end>
      end
      item
        Name = 'HashSHA3_256'
        Ancestor = 'HashAlgorithm'
        Methods = <
          item
            Name = 'HashData'
            Parameters = <
              item
                Name = 'data'
                DataType = 'String'
              end>
            ResultType = 'String'
            Attributes = [maVirtual, maOverride]
            Kind = mkClassFunction
            OnEval = dwsCryptoClassesHashSHA3_256MethodsHashDataEval
          end>
      end
      item
        Name = 'EncryptionAlgorithm'
        IsAbstract = True
        IsStatic = True
        Methods = <
          item
            Name = 'EncryptData'
            Parameters = <
              item
                Name = 'data'
                DataType = 'String'
              end
              item
                Name = 'key'
                DataType = 'String'
              end>
            ResultType = 'String'
            Attributes = [maVirtual, maAbstract]
            Kind = mkClassFunction
          end
          item
            Name = 'DecryptData'
            Parameters = <
              item
                Name = 'data'
                DataType = 'String'
              end
              item
                Name = 'key'
                DataType = 'String'
              end>
            ResultType = 'String'
            Attributes = [maVirtual, maAbstract]
            Kind = mkClassFunction
          end>
      end
      item
        Name = 'EncryptionAESSHA256Full'
        Ancestor = 'EncryptionAlgorithm'
        Methods = <
          item
            Name = 'EncryptData'
            Parameters = <
              item
                Name = 'data'
                DataType = 'String'
              end
              item
                Name = 'key'
                DataType = 'String'
              end>
            ResultType = 'String'
            Attributes = [maVirtual, maOverride]
            Kind = mkClassFunction
            OnEval = dwsCryptoClassesEncryptionAESSHA256FullMethodsEncryptDataEval
          end
          item
            Name = 'DecryptData'
            Parameters = <
              item
                Name = 'data'
                DataType = 'String'
              end
              item
                Name = 'key'
                DataType = 'String'
              end>
            ResultType = 'String'
            Attributes = [maVirtual, maOverride]
            Kind = mkClassFunction
            OnEval = dwsCryptoClassesEncryptionAESSHA256FullMethodsDecryptDataEval
          end>
      end
      item
        Name = 'EncryptionCryptProtect'
        Ancestor = 'EncryptionAlgorithm'
        Methods = <
          item
            Name = 'EncryptData'
            Parameters = <
              item
                Name = 'data'
                DataType = 'String'
              end
              item
                Name = 'key'
                DataType = 'String'
              end>
            ResultType = 'String'
            Attributes = [maVirtual, maOverride]
            Kind = mkClassFunction
            OnEval = dwsCryptoClassesEncryptionCryptProtectMethodsEncryptDataEval
          end
          item
            Name = 'DecryptData'
            Parameters = <
              item
                Name = 'data'
                DataType = 'String'
              end
              item
                Name = 'key'
                DataType = 'String'
              end>
            ResultType = 'String'
            Attributes = [maVirtual, maOverride]
            Kind = mkClassFunction
            OnEval = dwsCryptoClassesEncryptionCryptProtectMethodsDecryptDataEval
          end>
      end
      item
        Name = 'EncryptionBlowfish'
        Ancestor = 'EncryptionAlgorithm'
        Methods = <
          item
            Name = 'EncryptData'
            Parameters = <
              item
                Name = 'data'
                DataType = 'String'
              end
              item
                Name = 'key'
                DataType = 'String'
              end>
            ResultType = 'String'
            Attributes = [maVirtual, maOverride]
            Kind = mkClassFunction
            OnEval = dwsCryptoClassesEncryptionBlowfishMethodsEncryptDataEval
          end
          item
            Name = 'DecryptData'
            Parameters = <
              item
                Name = 'data'
                DataType = 'String'
              end
              item
                Name = 'key'
                DataType = 'String'
              end>
            ResultType = 'String'
            Attributes = [maVirtual, maOverride]
            Kind = mkClassFunction
            OnEval = dwsCryptoClassesEncryptionBlowfishMethodsDecryptDataEval
          end>
      end
      item
        Name = 'EncryptionVigen'#232're'
        Ancestor = 'EncryptionAlgorithm'
        Methods = <
          item
            Name = 'EncryptData'
            Parameters = <
              item
                Name = 'data'
                DataType = 'String'
              end
              item
                Name = 'key'
                DataType = 'String'
              end>
            ResultType = 'String'
            Attributes = [maVirtual, maOverride]
            Kind = mkClassFunction
            OnEval = dwsCryptoClassesEncryptionVigenèreMethodsEncryptDataEval
          end
          item
            Name = 'DecryptData'
            Parameters = <
              item
                Name = 'data'
                DataType = 'String'
              end
              item
                Name = 'key'
                DataType = 'String'
              end>
            ResultType = 'String'
            Attributes = [maVirtual, maOverride]
            Kind = mkClassFunction
            OnEval = dwsCryptoClassesEncryptionVigenèreMethodsDecryptDataEval
          end>
      end
      item
        Name = 'ObfuscationROT'
        IsStatic = True
        Methods = <
          item
            Name = 'ROT5'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            Kind = mkClassFunction
            OnEval = dwsCryptoClassesObfuscationROTMethodsROT5Eval
          end
          item
            Name = 'ROT13'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            Kind = mkClassFunction
            OnEval = dwsCryptoClassesObfuscationROTMethodsROT13Eval
          end
          item
            Name = 'ROT18'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            Kind = mkClassFunction
            OnEval = dwsCryptoClassesObfuscationROTMethodsROT18Eval
          end
          item
            Name = 'ROT47'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            Kind = mkClassFunction
            OnEval = dwsCryptoClassesObfuscationROTMethodsROT47Eval
          end>
      end>
    UnitName = 'System.Crypto'
    StaticSymbols = False
    Left = 64
    Top = 32
  end
end
