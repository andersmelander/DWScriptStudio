object DataModuleScriptStreams: TDataModuleScriptStreams
  OldCreateOrder = False
  Height = 329
  Width = 383
  object dwsUnitStreams: TdwsUnit
    Arrays = <
      item
        Name = 'TStringArray'
        DataType = 'string'
        IsDynamic = True
      end
      item
        Name = 'TCharArray'
        DataType = 'integer'
        IsDynamic = True
      end>
    Classes = <
      item
        Name = 'TStream'
        IsAbstract = True
        IsInternal = True
        Methods = <
          item
            Name = 'Read'
            Parameters = <
              item
                Name = 'Buffer'
                DataType = 'Variant'
                IsVarParam = True
              end
              item
                Name = 'Size'
                DataType = 'integer'
              end>
            ResultType = 'integer'
            Overloaded = True
            Attributes = [maVirtual]
            OnEval = dwsUnitClassesClassesTStreamMethodsReadEval
            Kind = mkFunction
          end
          item
            Name = 'Read'
            Parameters = <
              item
                Name = 'Buffer'
                DataType = 'Variant'
                IsVarParam = True
              end>
            ResultType = 'integer'
            Overloaded = True
            Attributes = [maVirtual]
            OnEval = dwsUnitClassesClassesTStreamMethodsReadEval
            Kind = mkFunction
          end
          item
            Name = 'Write'
            Parameters = <
              item
                Name = 'Buffer'
                DataType = 'Variant'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'integer'
            Attributes = [maVirtual]
            OnEval = dwsUnitClassesClassesTStreamMethodsWriteEval
            Kind = mkFunction
          end
          item
            Name = 'Seek'
            Parameters = <
              item
                Name = 'Offset'
                DataType = 'integer'
              end
              item
                Name = 'Origin'
                DataType = 'TSeekOrigin'
              end>
            ResultType = 'integer'
            Attributes = [maVirtual]
            OnEval = dwsUnitClassesClassesTStreamMethodsSeekEval
            Kind = mkFunction
          end
          item
            Name = 'CopyFrom'
            Parameters = <
              item
                Name = 'Source'
                DataType = 'TStream'
              end
              item
                Name = 'Count'
                DataType = 'integer'
                HasDefaultValue = True
                DefaultValue = 0
              end>
            ResultType = 'integer'
            Attributes = [maVirtual]
            OnEval = dwsUnitClassesClassesTStreamMethodsCopyFromEval
            Kind = mkFunction
          end
          item
            Name = 'GetPosition'
            ResultType = 'integer'
            Attributes = [maVirtual]
            OnEval = dwsUnitClassesClassesTStreamMethodsGetPositionEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetPosition'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'integer'
              end>
            Attributes = [maVirtual]
            OnEval = dwsUnitClassesClassesTStreamMethodsSetPositionEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetSize'
            ResultType = 'integer'
            Attributes = [maVirtual]
            OnEval = dwsUnitClassesClassesTStreamMethodsGetSizeEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetSize'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'integer'
              end>
            Attributes = [maVirtual]
            OnEval = dwsUnitClassesClassesTStreamMethodsSetSizeEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Position'
            DataType = 'integer'
            ReadAccess = 'GetPosition'
            WriteAccess = 'SetPosition'
          end
          item
            Name = 'Size'
            DataType = 'integer'
            ReadAccess = 'GetSize'
            WriteAccess = 'SetSize'
          end>
      end
      item
        Name = 'TMemoryStream'
        Ancestor = 'TStream'
        Constructors = <
          item
            Name = 'Create'
            OnEval = dwsUnitClassesClassesTMemoryStreamConstructorsCreateEval
          end>
        OnCleanUp = dwsUnitClassesClassesTMemoryStreamCleanUp
      end
      item
        Name = 'TStringStream'
        Ancestor = 'TStream'
        Constructors = <
          item
            Name = 'Create'
            Overloaded = True
            OnEval = dwsUnitClassesClassesTStringStreamConstructorsCreateEval
          end
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Overloaded = True
            OnEval = dwsUnitClassesClassesTStringStreamConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'GetValue'
            ResultType = 'string'
            OnEval = dwsUnitClassesClassesTStringStreamMethodsGetValueEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'ReadString'
            Parameters = <
              item
                Name = 'Count'
                DataType = 'integer'
              end>
            ResultType = 'string'
            OnEval = dwsUnitClassesClassesTStringStreamMethodsReadStringEval
            Kind = mkFunction
          end
          item
            Name = 'WriteString'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitClassesClassesTStringStreamMethodsWriteStringEval
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Value'
            DataType = 'string'
            ReadAccess = 'GetValue'
          end>
        OnCleanUp = dwsUnitClassesClassesTStringStreamCleanUp
      end
      item
        Name = 'TFileStream'
        Ancestor = 'TStream'
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
                Name = 'Mode'
                DataType = 'TFileOpenMode'
              end>
            OnEval = dwsUnitClassesClassesTFileStreamConstructorsCreateEval
          end>
        OnCleanUp = dwsUnitClassesClassesTFileStreamCleanUp
      end
      item
        Name = 'TTextReader'
        IsAbstract = True
        IsInternal = True
        Methods = <
          item
            Name = 'Peek'
            ResultType = 'integer'
            OnEval = dwsUnitStreamsClassesTTextReaderMethodsPeekEval
            Kind = mkFunction
          end
          item
            Name = 'Read'
            ResultType = 'integer'
            Overloaded = True
            OnEval = dwsUnitStreamsClassesTTextReaderMethodsRead1Eval
            Kind = mkFunction
          end
          item
            Name = 'Read'
            Parameters = <
              item
                Name = 'Buffer'
                DataType = 'TCharArray'
                IsVarParam = True
              end
              item
                Name = 'Count'
                DataType = 'integer'
              end>
            ResultType = 'integer'
            Overloaded = True
            OnEval = dwsUnitStreamsClassesTTextReaderMethodsRead2Eval
            Kind = mkFunction
          end
          item
            Name = 'ReadLine'
            ResultType = 'string'
            OnEval = dwsUnitStreamsClassesTTextReaderMethodsReadLineEval
            Kind = mkFunction
          end
          item
            Name = 'ReadToEnd'
            ResultType = 'string'
            OnEval = dwsUnitStreamsClassesTTextReaderMethodsReadToEndEval
            Kind = mkFunction
          end
          item
            Name = 'Close'
            OnEval = dwsUnitStreamsClassesTTextReaderMethodsCloseEval
            Kind = mkProcedure
          end>
      end
      item
        Name = 'TStreamReader'
        Ancestor = 'TTextReader'
        Constructors = <
          item
            Name = 'Create'
            Overloaded = True
            Visibility = cvProtected
            OnEval = dwsUnitStreamsClassesTStreamReaderConstructorsCreate0Eval
          end
          item
            Name = 'Create'
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
            Overloaded = True
            OnEval = dwsUnitStreamsClassesTStreamReaderConstructorsCreate1Eval
          end
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
                Name = 'Encoding'
                DataType = 'TEncoding'
                HasDefaultValue = True
                DefaultValue = 'nil'
              end>
            Overloaded = True
            OnEval = dwsUnitStreamsClassesTStreamReaderConstructorsCreate2Eval
          end>
        Methods = <
          item
            Name = 'GetEndOfStream'
            ResultType = 'boolean'
            OnEval = dwsUnitStreamsClassesTStreamReaderMethodsGetEndOfStreamEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'DiscardBufferedData'
            OnEval = dwsUnitStreamsClassesTStreamReaderMethodsDiscardBufferedDataEval
            Kind = mkProcedure
          end
          item
            Name = 'GetStream'
            ResultType = 'TStream'
            OnEval = dwsUnitStreamsClassesTStreamReaderMethodsGetStreamEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetCurrentEncoding'
            ResultType = 'TEncoding'
            OnEval = dwsUnitStreamsClassesTStreamReaderMethodsGetCurrentEncodingEval
            Visibility = cvProtected
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'EndOfStream'
            DataType = 'boolean'
            ReadAccess = 'GetEndOfStream'
          end
          item
            Name = 'BaseStream'
            DataType = 'TStream'
            ReadAccess = 'GetStream'
          end
          item
            Name = 'CurrentEncoding'
            DataType = 'TEncoding'
            ReadAccess = 'GetCurrentEncoding'
          end>
        OnCleanUp = dwsUnitStreamsClassesTStreamReaderCleanUp
      end
      item
        Name = 'TStringReader'
        Ancestor = 'TTextReader'
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'Data'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitStreamsClassesTStringReaderConstructorsCreateEval
          end>
        OnCleanUp = dwsUnitStreamsClassesTStringReaderCleanUp
      end
      item
        Name = 'TTextWriter'
        IsAbstract = True
        IsInternal = True
        Methods = <
          item
            Name = 'Close'
            Attributes = [maVirtual]
            OnEval = dwsUnitStreamsClassesTTextWriterMethodsCloseEval
            Kind = mkProcedure
          end
          item
            Name = 'Flush'
            Attributes = [maVirtual]
            OnEval = dwsUnitStreamsClassesTTextWriterMethodsFlushEval
            Kind = mkProcedure
          end
          item
            Name = 'Write'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Overloaded = True
            Attributes = [maVirtual]
            OnEval = dwsUnitStreamsClassesTTextWriterMethodsWriteStringEval
            Kind = mkProcedure
          end
          item
            Name = 'Write'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Overloaded = True
            Attributes = [maVirtual]
            OnEval = dwsUnitStreamsClassesTTextWriterMethodsWriteBooleanEval
            Kind = mkProcedure
          end
          item
            Name = 'Write'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Float'
              end>
            Overloaded = True
            Attributes = [maVirtual]
            OnEval = dwsUnitStreamsClassesTTextWriterMethodsWriteFloatEval
            Kind = mkProcedure
          end
          item
            Name = 'Write'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Integer'
              end>
            Overloaded = True
            Attributes = [maVirtual]
            OnEval = dwsUnitStreamsClassesTTextWriterMethodsWriteIntegerEval
            Kind = mkProcedure
          end
          item
            Name = 'WriteLine'
            Overloaded = True
            Attributes = [maVirtual]
            OnEval = dwsUnitStreamsClassesTTextWriterMethodsWriteLineEval
            Kind = mkProcedure
          end
          item
            Name = 'WriteLine'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Overloaded = True
            Attributes = [maVirtual]
            OnEval = dwsUnitStreamsClassesTTextWriterMethodsWriteLineStringEval
            Kind = mkProcedure
          end
          item
            Name = 'WriteLine'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Boolean'
              end>
            Overloaded = True
            Attributes = [maVirtual]
            OnEval = dwsUnitStreamsClassesTTextWriterMethodsWriteLineBooleanEval
            Kind = mkProcedure
          end
          item
            Name = 'WriteLine'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Float'
              end>
            Overloaded = True
            Attributes = [maVirtual]
            OnEval = dwsUnitStreamsClassesTTextWriterMethodsWriteLineFloatEval
            Kind = mkProcedure
          end
          item
            Name = 'WriteLine'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Integer'
              end>
            Overloaded = True
            Attributes = [maVirtual]
            OnEval = dwsUnitStreamsClassesTTextWriterMethodsWriteLineIntegerEval
            Kind = mkProcedure
          end>
      end
      item
        Name = 'TStreamWriter'
        Ancestor = 'TTextWriter'
        Constructors = <
          item
            Name = 'Create'
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
            Overloaded = True
            OnEval = dwsUnitStreamsClassesTStreamWriterConstructorsCreateStreamEval
          end
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
                Name = 'Append'
                DataType = 'Boolean'
                HasDefaultValue = True
                DefaultValue = False
              end
              item
                Name = 'Encoding'
                DataType = 'TEncoding'
                HasDefaultValue = True
                DefaultValue = 'nil'
              end>
            Overloaded = True
            OnEval = dwsUnitStreamsClassesTStreamWriterConstructorsCreateFile1Eval
          end>
        Methods = <
          item
            Name = 'GetAutoFlush'
            ResultType = 'Boolean'
            OnEval = dwsUnitStreamsClassesTStreamWriterMethodsGetAutoFlushEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetAutoFlush'
            Parameters = <
              item
                Name = 'value'
                DataType = 'Boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitStreamsClassesTStreamWriterMethodsSetAutoFlushEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetNewLine'
            ResultType = 'string'
            OnEval = dwsUnitStreamsClassesTStreamWriterMethodsGetNewLineEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetNewLine'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitStreamsClassesTStreamWriterMethodsSetNewLineEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetStream'
            ResultType = 'TStream'
            OnEval = dwsUnitStreamsClassesTStreamWriterMethodsGetStreamEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetEncoding'
            ResultType = 'TEncoding'
            OnEval = dwsUnitStreamsClassesTStreamWriterMethodsGetEncodingEval
            Visibility = cvProtected
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'AutoFlush'
            DataType = 'Boolean'
            ReadAccess = 'GetAutoFlush'
            WriteAccess = 'SetAutoFlush'
          end
          item
            Name = 'NewLine'
            DataType = 'string'
            ReadAccess = 'GetNewLine'
            WriteAccess = 'SetNewLine'
          end
          item
            Name = 'BaseStream'
            DataType = 'TStream'
            ReadAccess = 'GetStream'
          end
          item
            Name = 'Encoding'
            DataType = 'TEncoding'
            ReadAccess = 'GetEncoding'
          end>
        OnCleanUp = dwsUnitStreamsClassesTStreamWriterCleanUp
      end
      item
        Name = 'TStringWriter'
        Ancestor = 'TTextWriter'
        Constructors = <
          item
            Name = 'Create'
            OnEval = dwsUnitStreamsClassesTStringWriterConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'ToString'
            ResultType = 'string'
            OnEval = dwsUnitStreamsClassesTStringWriterMethodsToStringEval
            Kind = mkFunction
          end>
        OnCleanUp = dwsUnitStreamsClassesTStringWriterCleanUp
      end>
    Dependencies.Strings = (
      'System.Text')
    Enumerations = <
      item
        Name = 'TSeekOrigin'
        Elements = <
          item
            Name = 'soBeginning'
          end
          item
            Name = 'soCurrent'
          end
          item
            Name = 'soEnd'
          end>
      end
      item
        Name = 'TFileOpenMode'
        Elements = <
          item
            Name = 'fomReadOnly'
          end
          item
            Name = 'fomReadWrite'
          end
          item
            Name = 'fomCreate'
          end
          item
            Name = 'fomSequentialRead'
          end>
      end>
    Functions = <
      item
        Name = 'DetectCodePage'
        Parameters = <
          item
            Name = 'Stream'
            DataType = 'TStream'
          end>
        ResultType = 'integer'
        OnEval = dwsUnitStreamsFunctionsDetectCodePageEval
      end>
    UnitName = 'System.Stream'
    StaticSymbols = False
    Left = 44
    Top = 24
  end
  object dwsUnitDataCSV: TdwsUnit
    Classes = <
      item
        Name = 'TCsvParserSettings'
        IsSealed = True
        IsAbstract = True
        Constructors = <
          item
            Name = 'Create'
            OnEval = dwsUnitDataCSVClassesTCsvParserSettingsConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'GetDelimiterChar'
            ResultType = 'string'
            OnEval = dwsUnitDataCSVClassesTCsvParserSettingsMethodsGetDelimiterCharEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetDelimiterChar'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitDataCSVClassesTCsvParserSettingsMethodsSetDelimiterCharEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetDecimalSeparator'
            ResultType = 'string'
            OnEval = dwsUnitDataCSVClassesTCsvParserSettingsMethodsGetDecimalSeparatorEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetDecimalSeparator'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitDataCSVClassesTCsvParserSettingsMethodsSetDecimalSeparatorEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetQuoteChar'
            ResultType = 'string'
            OnEval = dwsUnitDataCSVClassesTCsvParserSettingsMethodsGetQuoteCharEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetQuoteChar'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitDataCSVClassesTCsvParserSettingsMethodsSetQuoteCharEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetEscapeChar'
            ResultType = 'string'
            OnEval = dwsUnitDataCSVClassesTCsvParserSettingsMethodsGetEscapeCharEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetEscapeChar'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitDataCSVClassesTCsvParserSettingsMethodsSetEscapeCharEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetSkipRows'
            ResultType = 'integer'
            OnEval = dwsUnitDataCSVClassesTCsvParserSettingsMethodsGetSkipRowsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetSkipRows'
            Parameters = <
              item
                Name = 'value'
                DataType = 'integer'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitDataCSVClassesTCsvParserSettingsMethodsSetSkipRowsEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetCodepage'
            ResultType = 'integer'
            OnEval = dwsUnitDataCSVClassesTCsvParserSettingsMethodsGetCodepageEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetCodepage'
            Parameters = <
              item
                Name = 'value'
                DataType = 'integer'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitDataCSVClassesTCsvParserSettingsMethodsSetCodepageEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'DelimiterChar'
            DataType = 'string'
            ReadAccess = 'GetDelimiterChar'
            WriteAccess = 'SetDelimiterChar'
          end
          item
            Name = 'DecimalSeparator'
            DataType = 'string'
            ReadAccess = 'GetDecimalSeparator'
            WriteAccess = 'SetDecimalSeparator'
          end
          item
            Name = 'QuoteChar'
            DataType = 'string'
            ReadAccess = 'GetQuoteChar'
            WriteAccess = 'SetQuoteChar'
          end
          item
            Name = 'EscapeChar'
            DataType = 'string'
            ReadAccess = 'GetEscapeChar'
            WriteAccess = 'SetEscapeChar'
          end
          item
            Name = 'SkipRows'
            DataType = 'integer'
            ReadAccess = 'GetSkipRows'
            WriteAccess = 'SetSkipRows'
          end
          item
            Name = 'Codepage'
            DataType = 'integer'
            Deprecated = 'Unused at present'
            ReadAccess = 'GetCodepage'
            WriteAccess = 'SetCodepage'
          end>
        OnCleanUp = dwsUnitDataCSVClassesTCsvParserSettingsCleanUp
      end
      item
        Name = 'TTextParserCSV'
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'Reader'
                DataType = 'TStreamReader'
              end>
            Overloaded = True
            OnEval = dwsUnitDataCSVClassesTTextParserCSVConstructorsCreate0Eval
          end
          item
            Name = 'Create'
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
            Overloaded = True
            OnEval = dwsUnitDataCSVClassesTTextParserCSVConstructorsCreate1Eval
          end
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
                Name = 'Encoding'
                DataType = 'TEncoding'
                HasDefaultValue = True
                DefaultValue = 'nil'
              end>
            Overloaded = True
            OnEval = dwsUnitDataCSVClassesTTextParserCSVConstructorsCreate2Eval
          end>
        Methods = <
          item
            Name = 'GetSettings'
            ResultType = 'TCsvParserSettings'
            OnEval = dwsUnitDataCSVClassesTTextParserCSVMethodsGetSettingsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetEndOfData'
            ResultType = 'boolean'
            OnEval = dwsUnitDataCSVClassesTTextParserCSVMethodsGetEndOfDataEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'ReadRow'
            ResultType = 'array of string'
            OnEval = dwsUnitDataCSVClassesTTextParserCSVMethodsReadRowEval
            Kind = mkFunction
          end
          item
            Name = 'GetStream'
            ResultType = 'TStream'
            OnEval = dwsUnitDataCSVClassesTTextParserCSVMethodsGetStreamEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetRowCounter'
            ResultType = 'integer'
            OnEval = dwsUnitDataCSVClassesTTextParserCSVMethodsGetRowCounterEval
            Visibility = cvProtected
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Settings'
            DataType = 'TCsvParserSettings'
            ReadAccess = 'GetSettings'
          end
          item
            Name = 'EndOfData'
            DataType = 'boolean'
            ReadAccess = 'GetEndOfData'
          end
          item
            Name = 'Stream'
            DataType = 'TStream'
            ReadAccess = 'GetStream'
          end
          item
            Name = 'RowCounter'
            DataType = 'integer'
            ReadAccess = 'GetRowCounter'
          end>
        OnCleanUp = dwsUnitDataCSVClassesTTextParserCSVCleanUp
      end>
    Dependencies.Strings = (
      'System.Stream'
      'System.Text')
    UnitName = 'System.Data.CSV'
    StaticSymbols = False
    Left = 228
    Top = 24
  end
end
