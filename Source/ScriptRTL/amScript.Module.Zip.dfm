object DataModuleScriptZip: TDataModuleScriptZip
  Height = 150
  Width = 215
  object dwsUnitZip: TdwsUnit
    Classes = <
      item
        Name = 'TZipFile'
        Constructors = <
          item
            Name = 'Create'
            OnEval = dwsUnitZipClassesTZipFileConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'Open'
            Parameters = <
              item
                Name = 'Filename'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Mode'
                DataType = 'TZipOpenMode'
              end>
            Overloaded = True
            Kind = mkProcedure
            OnEval = dwsUnitZipClassesTZipFileMethodsOpenFileEval
          end
          item
            Name = 'Open'
            Parameters = <
              item
                Name = 'Stream'
                DataType = 'TStream'
              end
              item
                Name = 'Mode'
                DataType = 'TZipOpenMode'
              end>
            Overloaded = True
            Kind = mkProcedure
            OnEval = dwsUnitZipClassesTZipFileMethodsOpenStreamEval
          end
          item
            Name = 'Add'
            Parameters = <
              item
                Name = 'FileName'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'ArchiveFileName'
                DataType = 'string'
                HasDefaultValue = True
                DefaultValue = ''
              end
              item
                Name = 'Compression'
                DataType = 'TZipCompression'
                HasDefaultValue = True
                DefaultValue = 8
              end>
            Overloaded = True
            Kind = mkProcedure
            OnEval = dwsUnitZipClassesTZipFileMethodsAddFileEval
          end
          item
            Name = 'Add'
            Parameters = <
              item
                Name = 'Data'
                DataType = 'TStream'
              end
              item
                Name = 'ArchiveFileName'
                DataType = 'string'
              end
              item
                Name = 'Compression'
                DataType = 'TZipCompression'
                HasDefaultValue = True
                DefaultValue = 8
              end>
            Overloaded = True
            Kind = mkProcedure
            OnEval = dwsUnitZipClassesTZipFileMethodsAddStreamEval
          end
          item
            Name = 'AddData'
            Parameters = <
              item
                Name = 'Data'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'ArchiveFileName'
                DataType = 'string'
              end
              item
                Name = 'Compression'
                DataType = 'TZipCompression'
                HasDefaultValue = True
                DefaultValue = 8
              end>
            Kind = mkProcedure
            OnEval = dwsUnitZipClassesTZipFileMethodsAddDataEval
          end
          item
            Name = 'Read'
            Parameters = <
              item
                Name = 'FileName'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Stream'
                DataType = 'TStream'
                IsVarParam = True
              end>
            Overloaded = True
            Kind = mkProcedure
            OnEval = dwsUnitZipClassesTZipFileMethodsReadNameEval
          end
          item
            Name = 'Read'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end
              item
                Name = 'Stream'
                DataType = 'TStream'
                IsVarParam = True
              end>
            Overloaded = True
            Kind = mkProcedure
            OnEval = dwsUnitZipClassesTZipFileMethodsReadIndexEval
          end
          item
            Name = 'IndexOf'
            Parameters = <
              item
                Name = 'Filename'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'integer'
            Kind = mkFunction
            OnEval = dwsUnitZipClassesTZipFileMethodsIndexOfEval
          end
          item
            Name = 'Extract'
            Parameters = <
              item
                Name = 'FileName'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'CreateSubdirs'
                DataType = 'Boolean'
                HasDefaultValue = True
                DefaultValue = True
              end>
            Overloaded = True
            Kind = mkProcedure
            OnEval = dwsUnitZipClassesTZipFileMethodsExtractNameEval
          end
          item
            Name = 'Extract'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'CreateSubdirs'
                DataType = 'Boolean'
                HasDefaultValue = True
                DefaultValue = True
              end>
            Overloaded = True
            Kind = mkProcedure
            OnEval = dwsUnitZipClassesTZipFileMethodsExtractIndexEval
          end
          item
            Name = 'ExtractAll'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
            OnEval = dwsUnitZipClassesTZipFileMethodsExtractAllEval
          end
          item
            Name = 'IsValid'
            Parameters = <
              item
                Name = 'Filename'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'boolean'
            Overloaded = True
            Attributes = [maClassMethod, maStatic]
            Kind = mkClassFunction
            OnEval = dwsUnitZipClassesTZipFileMethodsIsValidFileEval
          end
          item
            Name = 'IsValid'
            Parameters = <
              item
                Name = 'Stream'
                DataType = 'TStream'
              end>
            ResultType = 'boolean'
            Overloaded = True
            Attributes = [maClassMethod, maStatic]
            Kind = mkClassFunction
            OnEval = dwsUnitZipClassesTZipFileMethodsIsValidStreamEval
          end
          item
            Name = 'GetCount'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitZipClassesTZipFileMethodsGetCountEval
          end
          item
            Name = 'GetComment'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitZipClassesTZipFileMethodsGetCommentEval
          end
          item
            Name = 'SetComment'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitZipClassesTZipFileMethodsSetCommentEval
          end
          item
            Name = 'GetItem'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'TZipFileItem'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitZipClassesTZipFileMethodsGetItemEval
          end
          item
            Name = 'ExtractFilePath'
            Parameters = <
              item
                Name = 'FileName'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            Attributes = [maClassMethod, maStatic]
            Kind = mkClassFunction
            OnEval = dwsUnitZipClassesTZipFileMethodsExtractFilePathEval
          end
          item
            Name = 'ExtractFilename'
            Parameters = <
              item
                Name = 'FileName'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            Attributes = [maClassMethod, maStatic]
            Kind = mkClassFunction
            OnEval = dwsUnitZipClassesTZipFileMethodsExtractFilenameEval
          end
          item
            Name = 'Remove'
            Parameters = <
              item
                Name = 'Filename'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
            OnEval = dwsUnitZipClassesTZipFileMethodsRemoveEval
          end
          item
            Name = 'Delete'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            Kind = mkProcedure
            OnEval = dwsUnitZipClassesTZipFileMethodsDeleteEval
          end>
        Properties = <
          item
            Name = 'Count'
            DataType = 'integer'
            ReadAccess = 'GetCount'
          end
          item
            Name = 'Comment'
            DataType = 'string'
            ReadAccess = 'GetComment'
            WriteAccess = 'SetComment'
          end
          item
            Name = 'Items'
            DataType = 'TZipFileItem'
            ReadAccess = 'GetItem'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
          end>
        OnCleanUp = dwsUnitZipClassesTZipFileCleanUp
      end
      item
        Name = 'TZipFileItem'
        IsSealed = True
        IsInternal = True
        Methods = <
          item
            Name = 'GetComment'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitZipClassesTZipFileItemMethodsGetCommentEval
          end
          item
            Name = 'SetComment'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitZipClassesTZipFileItemMethodsSetCommentEval
          end
          item
            Name = 'GetFilename'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitZipClassesTZipFileItemMethodsGetFilenameEval
          end
          item
            Name = 'GetCompressedSize'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitZipClassesTZipFileItemMethodsGetCompressedSizeEval
          end
          item
            Name = 'GetUncompressedSize'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitZipClassesTZipFileItemMethodsGetUncompressedSizeEval
          end
          item
            Name = 'GetCompressionMethod'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitZipClassesTZipFileItemMethodsGetCompressionMethodEval
          end
          item
            Name = 'GetCRC32'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitZipClassesTZipFileItemMethodsGetCRC32Eval
          end>
        Properties = <
          item
            Name = 'Filename'
            DataType = 'string'
            ReadAccess = 'GetFilename'
          end
          item
            Name = 'Comment'
            DataType = 'string'
            ReadAccess = 'GetComment'
            WriteAccess = 'SetComment'
          end
          item
            Name = 'CompressedSize'
            DataType = 'integer'
            ReadAccess = 'GetCompressedSize'
          end
          item
            Name = 'UncompressedSize'
            DataType = 'integer'
            ReadAccess = 'GetUncompressedSize'
          end
          item
            Name = 'CompressionMethod'
            DataType = 'integer'
            ReadAccess = 'GetCompressionMethod'
          end
          item
            Name = 'CRC32'
            DataType = 'integer'
            ReadAccess = 'GetCRC32'
          end>
        OnCleanUp = dwsUnitZipClassesTZipFileItemCleanUp
      end>
    Dependencies.Strings = (
      'System.Stream')
    Enumerations = <
      item
        Name = 'TZipOpenMode'
        Elements = <
          item
            Name = 'zomRead'
          end
          item
            Name = 'zomReadWrite'
          end
          item
            Name = 'zomWrite'
          end>
      end
      item
        Name = 'TZipCompression'
        Elements = <
          item
            Name = 'zcStored'
          end
          item
            Name = 'zcShrunk'
          end
          item
            Name = 'zcReduce1'
          end
          item
            Name = 'zcReduce2'
          end
          item
            Name = 'zcReduce3'
          end
          item
            Name = 'zcReduce4'
          end
          item
            Name = 'zcImplode'
          end
          item
            Name = 'zcTokenize'
          end
          item
            Name = 'zcDeflate'
          end
          item
            Name = 'zcDeflate64'
          end
          item
            Name = 'zcPKImplode'
          end
          item
            Name = 'zcBZIP2'
          end
          item
            Name = 'zcLZMA'
          end
          item
            Name = 'zcTERSE'
          end
          item
            Name = 'zcLZ77'
          end
          item
            Name = 'zcWavePack'
          end
          item
            Name = 'zcPPMdI1'
          end>
      end>
    Records = <
      item
        Name = 'TZipHeader'
        Members = <>
        Properties = <>
      end>
    UnitName = 'System.Zip'
    StaticSymbols = False
    Left = 88
    Top = 32
  end
end
