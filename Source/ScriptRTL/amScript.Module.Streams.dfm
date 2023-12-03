object DataModuleScriptStreams: TDataModuleScriptStreams
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
            Kind = mkFunction
            OnEval = dwsUnitClassesClassesTStreamMethodsReadEval
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
            Kind = mkFunction
            OnEval = dwsUnitClassesClassesTStreamMethodsReadEval
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
            Kind = mkFunction
            OnEval = dwsUnitClassesClassesTStreamMethodsWriteEval
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
            Kind = mkFunction
            OnEval = dwsUnitClassesClassesTStreamMethodsSeekEval
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
            Kind = mkFunction
            OnEval = dwsUnitClassesClassesTStreamMethodsCopyFromEval
          end
          item
            Name = 'GetPosition'
            ResultType = 'integer'
            Attributes = [maVirtual]
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitClassesClassesTStreamMethodsGetPositionEval
          end
          item
            Name = 'SetPosition'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'integer'
              end>
            Attributes = [maVirtual]
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitClassesClassesTStreamMethodsSetPositionEval
          end
          item
            Name = 'GetSize'
            ResultType = 'integer'
            Attributes = [maVirtual]
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitClassesClassesTStreamMethodsGetSizeEval
          end
          item
            Name = 'SetSize'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'integer'
              end>
            Attributes = [maVirtual]
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitClassesClassesTStreamMethodsSetSizeEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitClassesClassesTStringStreamMethodsGetValueEval
          end
          item
            Name = 'ReadString'
            Parameters = <
              item
                Name = 'Count'
                DataType = 'integer'
              end>
            ResultType = 'string'
            Kind = mkFunction
            OnEval = dwsUnitClassesClassesTStringStreamMethodsReadStringEval
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
            Kind = mkProcedure
            OnEval = dwsUnitClassesClassesTStringStreamMethodsWriteStringEval
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
            Kind = mkFunction
            OnEval = dwsUnitStreamsClassesTTextReaderMethodsPeekEval
          end
          item
            Name = 'Read'
            ResultType = 'integer'
            Overloaded = True
            Kind = mkFunction
            OnEval = dwsUnitStreamsClassesTTextReaderMethodsRead1Eval
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
            Kind = mkFunction
            OnEval = dwsUnitStreamsClassesTTextReaderMethodsRead2Eval
          end
          item
            Name = 'ReadLine'
            ResultType = 'string'
            Kind = mkFunction
            OnEval = dwsUnitStreamsClassesTTextReaderMethodsReadLineEval
          end
          item
            Name = 'ReadToEnd'
            ResultType = 'string'
            Kind = mkFunction
            OnEval = dwsUnitStreamsClassesTTextReaderMethodsReadToEndEval
          end
          item
            Name = 'Close'
            Kind = mkProcedure
            OnEval = dwsUnitStreamsClassesTTextReaderMethodsCloseEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitStreamsClassesTStreamReaderMethodsGetEndOfStreamEval
          end
          item
            Name = 'DiscardBufferedData'
            Kind = mkProcedure
            OnEval = dwsUnitStreamsClassesTStreamReaderMethodsDiscardBufferedDataEval
          end
          item
            Name = 'GetStream'
            ResultType = 'TStream'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitStreamsClassesTStreamReaderMethodsGetStreamEval
          end
          item
            Name = 'GetCurrentEncoding'
            ResultType = 'TEncoding'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitStreamsClassesTStreamReaderMethodsGetCurrentEncodingEval
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
            Kind = mkProcedure
            OnEval = dwsUnitStreamsClassesTTextWriterMethodsCloseEval
          end
          item
            Name = 'Flush'
            Attributes = [maVirtual]
            Kind = mkProcedure
            OnEval = dwsUnitStreamsClassesTTextWriterMethodsFlushEval
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
            Kind = mkProcedure
            OnEval = dwsUnitStreamsClassesTTextWriterMethodsWriteStringEval
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
            Kind = mkProcedure
            OnEval = dwsUnitStreamsClassesTTextWriterMethodsWriteBooleanEval
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
            Kind = mkProcedure
            OnEval = dwsUnitStreamsClassesTTextWriterMethodsWriteFloatEval
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
            Kind = mkProcedure
            OnEval = dwsUnitStreamsClassesTTextWriterMethodsWriteIntegerEval
          end
          item
            Name = 'WriteLine'
            Overloaded = True
            Attributes = [maVirtual]
            Kind = mkProcedure
            OnEval = dwsUnitStreamsClassesTTextWriterMethodsWriteLineEval
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
            Kind = mkProcedure
            OnEval = dwsUnitStreamsClassesTTextWriterMethodsWriteLineStringEval
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
            Kind = mkProcedure
            OnEval = dwsUnitStreamsClassesTTextWriterMethodsWriteLineBooleanEval
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
            Kind = mkProcedure
            OnEval = dwsUnitStreamsClassesTTextWriterMethodsWriteLineFloatEval
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
            Kind = mkProcedure
            OnEval = dwsUnitStreamsClassesTTextWriterMethodsWriteLineIntegerEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitStreamsClassesTStreamWriterMethodsGetAutoFlushEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitStreamsClassesTStreamWriterMethodsSetAutoFlushEval
          end
          item
            Name = 'GetNewLine'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitStreamsClassesTStreamWriterMethodsGetNewLineEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitStreamsClassesTStreamWriterMethodsSetNewLineEval
          end
          item
            Name = 'GetStream'
            ResultType = 'TStream'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitStreamsClassesTStreamWriterMethodsGetStreamEval
          end
          item
            Name = 'GetEncoding'
            ResultType = 'TEncoding'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitStreamsClassesTStreamWriterMethodsGetEncodingEval
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
            Kind = mkFunction
            OnEval = dwsUnitStreamsClassesTStringWriterMethodsToStringEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDataCSVClassesTCsvParserSettingsMethodsGetDelimiterCharEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitDataCSVClassesTCsvParserSettingsMethodsSetDelimiterCharEval
          end
          item
            Name = 'GetDecimalSeparator'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDataCSVClassesTCsvParserSettingsMethodsGetDecimalSeparatorEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitDataCSVClassesTCsvParserSettingsMethodsSetDecimalSeparatorEval
          end
          item
            Name = 'GetQuoteChar'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDataCSVClassesTCsvParserSettingsMethodsGetQuoteCharEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitDataCSVClassesTCsvParserSettingsMethodsSetQuoteCharEval
          end
          item
            Name = 'GetEscapeChar'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDataCSVClassesTCsvParserSettingsMethodsGetEscapeCharEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitDataCSVClassesTCsvParserSettingsMethodsSetEscapeCharEval
          end
          item
            Name = 'GetSkipRows'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDataCSVClassesTCsvParserSettingsMethodsGetSkipRowsEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitDataCSVClassesTCsvParserSettingsMethodsSetSkipRowsEval
          end
          item
            Name = 'GetCodepage'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDataCSVClassesTCsvParserSettingsMethodsGetCodepageEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitDataCSVClassesTCsvParserSettingsMethodsSetCodepageEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDataCSVClassesTTextParserCSVMethodsGetSettingsEval
          end
          item
            Name = 'GetEndOfData'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDataCSVClassesTTextParserCSVMethodsGetEndOfDataEval
          end
          item
            Name = 'ReadRow'
            ResultType = 'array of string'
            Kind = mkFunction
            OnEval = dwsUnitDataCSVClassesTTextParserCSVMethodsReadRowEval
          end
          item
            Name = 'GetStream'
            ResultType = 'TStream'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDataCSVClassesTTextParserCSVMethodsGetStreamEval
          end
          item
            Name = 'GetRowCounter'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDataCSVClassesTTextParserCSVMethodsGetRowCounterEval
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
