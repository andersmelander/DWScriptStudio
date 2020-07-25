object DataModuleScriptZip: TDataModuleScriptZip
  OldCreateOrder = False
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
            OnEval = dwsUnitZipClassesTZipFileMethodsOpenFileEval
            Kind = mkProcedure
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
            OnEval = dwsUnitZipClassesTZipFileMethodsOpenStreamEval
            Kind = mkProcedure
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
            OnEval = dwsUnitZipClassesTZipFileMethodsAddFileEval
            Kind = mkProcedure
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
            OnEval = dwsUnitZipClassesTZipFileMethodsAddStreamEval
            Kind = mkProcedure
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
            OnEval = dwsUnitZipClassesTZipFileMethodsAddDataEval
            Kind = mkProcedure
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
            OnEval = dwsUnitZipClassesTZipFileMethodsReadNameEval
            Kind = mkProcedure
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
            OnEval = dwsUnitZipClassesTZipFileMethodsReadIndexEval
            Kind = mkProcedure
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
            OnEval = dwsUnitZipClassesTZipFileMethodsIndexOfEval
            Kind = mkFunction
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
            OnEval = dwsUnitZipClassesTZipFileMethodsExtractNameEval
            Kind = mkProcedure
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
            OnEval = dwsUnitZipClassesTZipFileMethodsExtractIndexEval
            Kind = mkProcedure
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
            OnEval = dwsUnitZipClassesTZipFileMethodsExtractAllEval
            Kind = mkProcedure
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
            OnEval = dwsUnitZipClassesTZipFileMethodsIsValidFileEval
            Kind = mkClassFunction
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
            OnEval = dwsUnitZipClassesTZipFileMethodsIsValidStreamEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetCount'
            ResultType = 'integer'
            OnEval = dwsUnitZipClassesTZipFileMethodsGetCountEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetComment'
            ResultType = 'string'
            OnEval = dwsUnitZipClassesTZipFileMethodsGetCommentEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitZipClassesTZipFileMethodsSetCommentEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetItem'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'TZipFileItem'
            OnEval = dwsUnitZipClassesTZipFileMethodsGetItemEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitZipClassesTZipFileMethodsExtractFilePathEval
            Kind = mkClassFunction
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
            OnEval = dwsUnitZipClassesTZipFileMethodsExtractFilenameEval
            Kind = mkClassFunction
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
            OnEval = dwsUnitZipClassesTZipFileMethodsRemoveEval
            Kind = mkProcedure
          end
          item
            Name = 'Delete'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            OnEval = dwsUnitZipClassesTZipFileMethodsDeleteEval
            Kind = mkProcedure
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
            OnEval = dwsUnitZipClassesTZipFileItemMethodsGetCommentEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitZipClassesTZipFileItemMethodsSetCommentEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetFilename'
            ResultType = 'string'
            OnEval = dwsUnitZipClassesTZipFileItemMethodsGetFilenameEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetCompressedSize'
            ResultType = 'integer'
            OnEval = dwsUnitZipClassesTZipFileItemMethodsGetCompressedSizeEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetUncompressedSize'
            ResultType = 'integer'
            OnEval = dwsUnitZipClassesTZipFileItemMethodsGetUncompressedSizeEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetCompressionMethod'
            ResultType = 'integer'
            OnEval = dwsUnitZipClassesTZipFileItemMethodsGetCompressionMethodEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetCRC32'
            ResultType = 'integer'
            OnEval = dwsUnitZipClassesTZipFileItemMethodsGetCRC32Eval
            Visibility = cvProtected
            Kind = mkFunction
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
