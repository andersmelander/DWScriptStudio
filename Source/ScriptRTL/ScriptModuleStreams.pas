unit ScriptModuleStreams;

(*
 * Copyright © 2014 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Controls,
  SysUtils, Classes,
  Generics.Collections,
  ActiveX,

  dwsComp,
  dwsExprs,
  dwsCompiler,
  dwsClassesLibModule,

  ScriptModule;

// -----------------------------------------------------------------------------
//
// TDataModuleScriptStreams
//
// -----------------------------------------------------------------------------
// Contains the following script classes:
//
// - TStream
// - TFileStream
// - TMemoryStream
// - TStringStream
//
// TODO : TStreamReader
// TODO : TStreamWriter
// -----------------------------------------------------------------------------
type
  TDataModule = class(TScriptModule);

  TDataModuleScriptStreams = class(TDataModule)
    dwsUnitStreams: TdwsUnit;
    dwsUnitDataCSV: TdwsUnit;
    procedure dwsUnitClassesClassesTStreamMethodsReadEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStreamMethodsWriteEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStreamMethodsCopyFromEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStreamMethodsGetPositionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStreamMethodsSetPositionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStreamMethodsGetSizeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStreamMethodsSetSizeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTMemoryStreamConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitClassesClassesTFileStreamConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitClassesClassesTStringStreamConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitClassesClassesTStringStreamMethodsGetValueEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTMemoryStreamCleanUp(ExternalObject: TObject);
    procedure dwsUnitClassesClassesTStringStreamCleanUp(ExternalObject: TObject);
    procedure dwsUnitClassesClassesTFileStreamCleanUp(ExternalObject: TObject);
    procedure dwsUnitClassesClassesTStringStreamMethodsReadStringEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStringStreamMethodsWriteStringEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStreamMethodsSeekEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitStreamsClassesTStreamReaderMethodsGetEndOfStreamEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitStreamsClassesTTextReaderMethodsPeekEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitStreamsClassesTTextReaderMethodsRead1Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitStreamsClassesTTextReaderMethodsReadLineEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitStreamsClassesTTextReaderMethodsReadToEndEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitStreamsClassesTTextReaderMethodsRead2Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitStreamsClassesTStreamReaderConstructorsCreate1Eval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitStreamsClassesTStreamReaderCleanUp(ExternalObject: TObject);
    procedure dwsUnitStreamsClassesTStringReaderConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitStreamsClassesTStringReaderCleanUp(ExternalObject: TObject);
    procedure dwsUnitStreamsClassesTTextReaderMethodsCloseEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitStreamsClassesTStreamReaderMethodsDiscardBufferedDataEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitStreamsClassesTStreamReaderConstructorsCreate0Eval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitStreamsClassesTStreamReaderConstructorsCreate2Eval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitStreamsClassesTStreamWriterConstructorsCreateFile1Eval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitStreamsClassesTStreamWriterConstructorsCreateStreamEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitStreamsClassesTStreamWriterCleanUp(ExternalObject: TObject);
    procedure dwsUnitStreamsClassesTTextWriterMethodsWriteLineStringEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitStreamsClassesTTextWriterMethodsWriteStringEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitStreamsClassesTTextWriterMethodsCloseEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitStreamsClassesTTextWriterMethodsFlushEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitStreamsClassesTTextWriterMethodsWriteLineBooleanEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitStreamsClassesTTextWriterMethodsWriteBooleanEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitStreamsClassesTTextWriterMethodsWriteFloatEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitStreamsClassesTTextWriterMethodsWriteIntegerEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitStreamsClassesTTextWriterMethodsWriteLineFloatEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitStreamsClassesTTextWriterMethodsWriteLineIntegerEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitStreamsClassesTTextWriterMethodsWriteLineEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitStreamsClassesTStreamWriterMethodsGetAutoFlushEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitStreamsClassesTStreamWriterMethodsSetAutoFlushEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitStreamsClassesTStreamWriterMethodsGetNewLineEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitStreamsClassesTStreamWriterMethodsSetNewLineEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitStreamsClassesTStreamWriterMethodsGetStreamEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitStreamsClassesTStringWriterConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitStreamsClassesTStringWriterCleanUp(ExternalObject: TObject);
    procedure dwsUnitStreamsClassesTStringWriterMethodsToStringEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitStreamsClassesTStreamReaderMethodsGetStreamEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDataCSVClassesTCsvParserSettingsConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitDataCSVClassesTCsvParserSettingsCleanUp(ExternalObject: TObject);
    procedure dwsUnitDataCSVClassesTCsvParserSettingsMethodsGetDelimiterCharEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDataCSVClassesTCsvParserSettingsMethodsGetDecimalSeparatorEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDataCSVClassesTCsvParserSettingsMethodsGetQuoteCharEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDataCSVClassesTCsvParserSettingsMethodsGetEscapeCharEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDataCSVClassesTCsvParserSettingsMethodsGetSkipRowsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDataCSVClassesTCsvParserSettingsMethodsSetSkipRowsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDataCSVClassesTCsvParserSettingsMethodsGetCodepageEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDataCSVClassesTCsvParserSettingsMethodsSetCodepageEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDataCSVClassesTCsvParserSettingsMethodsSetDelimiterCharEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDataCSVClassesTCsvParserSettingsMethodsSetDecimalSeparatorEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDataCSVClassesTCsvParserSettingsMethodsSetQuoteCharEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDataCSVClassesTCsvParserSettingsMethodsSetEscapeCharEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDataCSVClassesTTextParserCSVConstructorsCreate0Eval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitDataCSVClassesTTextParserCSVConstructorsCreate1Eval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitDataCSVClassesTTextParserCSVConstructorsCreate2Eval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitDataCSVClassesTTextParserCSVMethodsGetSettingsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDataCSVClassesTTextParserCSVCleanUp(ExternalObject: TObject);
    procedure dwsUnitDataCSVClassesTTextParserCSVMethodsGetEndOfDataEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDataCSVClassesTTextParserCSVMethodsReadRowEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDataCSVClassesTTextParserCSVMethodsGetStreamEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDataCSVClassesTTextParserCSVMethodsGetRowCounterEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitStreamsFunctionsDetectCodePageEval(info: TProgramInfo);
    procedure dwsUnitStreamsClassesTStreamReaderMethodsGetCurrentEncodingEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitStreamsClassesTStreamWriterMethodsGetEncodingEval(Info: TProgramInfo; ExtObject: TObject);
  private
  protected
    // IScriptModule
    procedure Initialize(ADelphiWebScript: TDelphiWebScript); override;
  public
    class function WrapStream(Stream: TStream; Ownership: TStreamOwnership = soReference): IStream;
  published
  end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

implementation

uses
  Variants,
  Windows,
  Math,

  dwsSymbols,
  dwsFileSystem,
  dwsUtils,

  amLocale,
{$ifdef FEATURE_CSV_IMPORT}
  amCsvImportConfig,
  amCsvImport,
{$endif FEATURE_CSV_IMPORT}
  amStreamAdapter,

  ScriptAPI;

{$R *.DFM}


class function TDataModuleScriptStreams.WrapStream(Stream: TStream; Ownership: TStreamOwnership): IStream;
begin
  Result := TFixedStreamAdapter.Create(Stream, Ownership);
end;


// -----------------------------------------------------------------------------
//
// TDataModuleScriptStreams
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptStreams.Initialize(ADelphiWebScript: TDelphiWebScript);
begin
  inherited;

  ScriptService.RegisterClassTypeMapping(TMemoryStream);
  ScriptService.RegisterClassTypeMapping(TStringStream);
  ScriptService.RegisterClassTypeMapping(TFileStream);
end;


// -----------------------------------------------------------------------------
//
// Script: TStream
//
// -----------------------------------------------------------------------------
// Wraps a VCL TStream object
// -----------------------------------------------------------------------------
procedure TDataModuleScriptStreams.dwsUnitClassesClassesTStreamMethodsCopyFromEval(Info: TProgramInfo; ExtObject: TObject);
// TStream.CopyFrom(Stream: TStream; Count: integer): integer
var
  Source: TStream;
  Count: int64;
begin
  if (Info.Params[0].ExternalObject = nil) then
    raise EScript.Create('Invalid source');
  Source := Info.Params[0].ExternalObject as TStream;
  Count := Info.Params[1].ValueAsInteger;
  Info.ResultAsInteger := TStream(ExtObject).CopyFrom(Source, Count);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitClassesClassesTStreamMethodsSeekEval(Info: TProgramInfo; ExtObject: TObject);
// TStream.Seek(Offset: integer, Origin: TSeekOrigin): integer
begin
  Info.ResultAsInteger := TStream(ExtObject).Seek(Info.Params[0].ValueAsInteger, TSeekOrigin(Info.Params[1].ValueAsInteger));
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitClassesClassesTStreamMethodsGetPositionEval(Info: TProgramInfo; ExtObject: TObject);
// TStream.GetPosition: integer
begin
  Info.ResultAsInteger := TStream(ExtObject).Position;
end;

procedure TDataModuleScriptStreams.dwsUnitClassesClassesTStreamMethodsSetPositionEval(Info: TProgramInfo; ExtObject: TObject);
// TStream.SetPosition(Value: integer)
begin
  TStream(ExtObject).Position := Info.Params[0].ValueAsInteger;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitClassesClassesTStreamMethodsGetSizeEval(Info: TProgramInfo; ExtObject: TObject);
// TStream.GetSize: integer
begin
  Info.ResultAsInteger := TStream(ExtObject).Size;
end;

procedure TDataModuleScriptStreams.dwsUnitClassesClassesTStreamMethodsSetSizeEval(Info: TProgramInfo; ExtObject: TObject);
// TStream.SetSize(Value: integer)
begin
  TStream(ExtObject).Size := Info.Params[0].ValueAsInteger;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitClassesClassesTStreamMethodsReadEval(Info: TProgramInfo; ExtObject: TObject);
// TStream.Read(var Buffer: Variant): integer;
// TStream.Read(var Buffer: Variant; Count: integer): integer;
var
  Buffer: Variant;
  Size, ResultSize: int64;
  p: pointer;
begin
  if (Info.FuncSym.Params.Count > 1) then
  begin
    Size := Info.Params[1].ValueAsInteger;
    Buffer := VarArrayCreate([0, Size-1], varByte);
  end else
  begin
    Buffer := Info.Params[1].Value;
    if (VarArrayDimCount(Buffer) <> 1) then
      raise EScript.Create('Value must be one dimensional');
    if (TVarData(Buffer).VType = varVariant) then
      raise EScript.Create('Unsupported value type');
    Size := (VarArrayHighBound(Buffer, 1) - VarArrayLowBound(Buffer, 1) + 1) * TVarData(Buffer).VArray^.ElementSize;
  end;

  P := VarArrayLock(Buffer);
  try
    ResultSize := TStream(ExtObject).Read(p^, Size);
  finally
    VarArrayUnlock(Buffer);
  end;

  if (ResultSize <= 0) then
    Buffer := IUnknown(nil)
  else
  if (ResultSize < Size) then
    VarArrayRedim(Buffer, ResultSize-1);

  Info.ResultAsInteger := ResultSize;
  Info.Params[0].Value := Buffer;
end;

// -----------------------------------------------------------------------------

// Map the VarType to the size of the raw data for native types
// Copied from db.pas
function VarTypeDataSize(VarType: Integer): Integer;
begin
  Result := 0;
  case VarType of
    varSmallint: Result := SizeOf(Smallint);
    varInteger: Result := SizeOf(Integer);
    varSingle: Result := SizeOf(Single);
    varDouble: Result := SizeOf(Double);
    varCurrency: Result := SizeOf(Currency);
    varDate: Result := SizeOf(TDateTime);
    varBoolean: Result := SizeOf(WordBool);
    varShortInt: Result := SizeOf(ShortInt);
    varByte: Result := SizeOf(Byte);
    varWord: Result := SizeOf(Word);
    varLongWord: Result := SizeOf(LongWord);
    varInt64: Result := SizeOf(Int64);
    varUInt64: Result := SizeOf(UInt64);
  end;
end;

procedure TDataModuleScriptStreams.dwsUnitClassesClassesTStreamMethodsWriteEval(Info: TProgramInfo; ExtObject: TObject);
// TStream.Write(const Buffer: Variant): integer;
// TODO : TStream.Write(const Buffer: Variant; Count: integer): integer;
var
  Buffer: Variant;
  IsArray: boolean;
  Size: int64;
  PData: pointer;
  Bytes: TBytes;
begin
  Buffer := Info.Params[0].Value;

  IsArray := VarIsArray(Buffer);

  if (IsArray) then
  begin
    Bytes := Buffer;
    PData := @Bytes[0];
    Size := Length(Bytes);
  end else
  begin
    case VarType(Buffer) of
      varOleStr:
        begin
          Size := Length(UnicodeString(Buffer)) * SizeOf(Char);
          PData := TVarData(Buffer).VOleStr;
        end;
      varString:
        begin
          Size := Length(AnsiString(Buffer));
          PData := TVarData(Buffer).VString;
        end;
      varUString:
        begin
          Size := Length(UnicodeString(Buffer)) * SizeOf(Char);
          PData := TVarData(Buffer).VUString;
        end;
    else
      Size := VarTypeDataSize(VarType(Buffer));
      PData := @TVarData(Buffer).VByte;
    end;
  end;
(*
  end else
  if (VarArrayDimCount(Buffer) = 1) then
  begin
    if (TVarData(Buffer).VType = varVariant) then
      raise EScript.Create('Unsupported value type');

    Size := (VarArrayHighBound(Buffer, 1) - VarArrayLowBound(Buffer, 1) + 1) * TVarData(Buffer).VArray^.ElementSize;
    P := VarArrayLock(Buffer);
  end else
    raise EScript.Create('Value array must be one dimensional');
*)

  Info.ResultAsInteger := TStream(ExtObject).Write(PData^, Size);
end;


// -----------------------------------------------------------------------------
//
// Script: TMemoryStream = class(TStream)
//
// -----------------------------------------------------------------------------
// Wraps a VCL TMemoryStream object
// -----------------------------------------------------------------------------
procedure TDataModuleScriptStreams.dwsUnitClassesClassesTMemoryStreamCleanUp(ExternalObject: TObject);
begin
  ExternalObject.Free;
end;

procedure TDataModuleScriptStreams.dwsUnitClassesClassesTMemoryStreamConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
// TMemoryStream.Create
begin
  ASSERT(ExtObject = nil);
  ExtObject := TMemoryStream.Create;
end;


// -----------------------------------------------------------------------------
//
// Script: TFileStream = class(TStream)
//
// -----------------------------------------------------------------------------
// Wraps a DWS file stream via the DWS file system
// -----------------------------------------------------------------------------
procedure TDataModuleScriptStreams.dwsUnitClassesClassesTFileStreamCleanUp(ExternalObject: TObject);
begin
  ExternalObject.Free;
end;

procedure TDataModuleScriptStreams.dwsUnitClassesClassesTFileStreamConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
// TFileStream.Create(const Filename: string; Mode: TFileOpenMode)
var
  FileSystem: IdwsFileSystem;
  Filename: string;
  Stream: TStream;
begin
  ASSERT(ExtObject = nil);
  FileSystem := Info.Execution.FileSystem;
  Filename := Info.Params[0].ValueAsString;

  Stream := FileSystem.OpenFileStream(Filename, TdwsFileOpenMode(Info.Params[1].ValueAsInteger));

  if (Stream = nil) then
    raise EScript.CreateFmt('File not found: %s', [Filename]);

  ExtObject := Stream;
end;


// -----------------------------------------------------------------------------
//
// Script: TStringStream = class(TStream)
//
// -----------------------------------------------------------------------------
// Wraps a VCL TStringStream object
// -----------------------------------------------------------------------------
procedure TDataModuleScriptStreams.dwsUnitClassesClassesTStringStreamCleanUp(ExternalObject: TObject);
begin
  ExternalObject.Free;
end;

procedure TDataModuleScriptStreams.dwsUnitClassesClassesTStringStreamConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
// TStringStream.Create
// TStringStream.Create(const Value: string)
begin
  ASSERT(ExtObject = nil);
  if (Info.FuncSym.Params.Count = 0) then
    ExtObject := TStringStream.Create
  else
    ExtObject := TStringStream.Create(Info.Params[0].ValueAsString);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitClassesClassesTStringStreamMethodsGetValueEval(Info: TProgramInfo; ExtObject: TObject);
// TStringStream.GetValue: string
begin
  Info.ResultAsString := TStringStream(ExtObject).DataString;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitClassesClassesTStringStreamMethodsReadStringEval(Info: TProgramInfo; ExtObject: TObject);
// TStringStream.ReadString(Count: integer): string
begin
  Info.ResultAsString := TStringStream(ExtObject).ReadString(Info.Params[0].ValueAsInteger);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitClassesClassesTStringStreamMethodsWriteStringEval(Info: TProgramInfo; ExtObject: TObject);
// TStringStream.WriteString(const Value: string)
begin
  TStringStream(ExtObject).WriteString(Info.Params[0].ValueAsString);
end;

// -----------------------------------------------------------------------------
//
// Script: TTextReader
//
// -----------------------------------------------------------------------------
// Wraps a VCL TTextReader object
// -----------------------------------------------------------------------------
procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTTextReaderMethodsCloseEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TTextReader(ExtObject).Close;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTTextReaderMethodsPeekEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TTextReader(ExtObject).Peek;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTTextReaderMethodsRead1Eval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TTextReader(ExtObject).Read;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTTextReaderMethodsRead2Eval(Info: TProgramInfo; ExtObject: TObject);
var
  Buffer: TCharArray;
  Count: integer;
  i: integer;
begin
  Count := Info.ParamAsInteger[1];
  SetLength(Buffer, Count);

  Count := TTextReader(ExtObject).Read(Buffer, 0, Count);

  Info.ResultAsInteger := Count;
  Info.Params[0].ScriptDynArray.ArrayLength := Count;
  for i := 0 to Count-1 do
    Info.Params[0].ScriptDynArray.AsInteger[i] := Ord(Buffer[i]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTTextReaderMethodsReadLineEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TTextReader(ExtObject).ReadLine;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTTextReaderMethodsReadToEndEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TTextReader(ExtObject).ReadToEnd;
end;

// -----------------------------------------------------------------------------
//
// Script: TStreamReader
//
// -----------------------------------------------------------------------------
// Wraps a VCL TStreamReader object
// -----------------------------------------------------------------------------
type
  TScriptStreamReader = class(TStreamReader);

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTStreamReaderCleanUp(ExternalObject: TObject);
begin
  if (ExternalObject is TScriptStreamReader) then
    ExternalObject.Free;
end;

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTStreamReaderConstructorsCreate0Eval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ASSERT(ExtObject <> nil);
  ASSERT(ExtObject.ClassType = TStreamReader);
  ASSERT(Info.FuncSym.Params.Count = 0);
end;

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTStreamReaderConstructorsCreate1Eval(Info: TProgramInfo; var ExtObject: TObject);
var
  Encoding: TEncoding;
begin
  ASSERT(ExtObject = nil);
  ASSERT(Info.Params[0].ExternalObject is TStream);
  if (Info.Params[1].ScriptObj <> nil) then
    Encoding := TEncoding(Info.ParamAsObject[1])
  else
    Encoding := nil;

  if (Encoding <> nil) then
    ExtObject := TScriptStreamReader.Create(TStream(Info.Params[0].ExternalObject), Encoding)
  else
    ExtObject := TScriptStreamReader.Create(TStream(Info.Params[0].ExternalObject));
end;

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTStreamReaderConstructorsCreate2Eval(Info: TProgramInfo; var ExtObject: TObject);
var
  FileSystem: IdwsFileSystem;
  Filename: string;
  Stream: TStream;
  Encoding: TEncoding;
begin
  ASSERT(ExtObject = nil);
  FileSystem := Info.Execution.FileSystem;
  Filename := Info.Params[0].ValueAsString;

  Stream := FileSystem.OpenFileStream(Filename, fomReadOnly);

  if (Stream = nil) then
    raise EScript.CreateFmt('File not found: %s', [Filename]);

  if (Info.Params[1].ScriptObj <> nil) then
    Encoding := TEncoding(Info.ParamAsObject[1])
  else
    Encoding := nil;

  if (Encoding <> nil) then
    ExtObject := TScriptStreamReader.Create(Stream, Encoding)
  else
    ExtObject := TScriptStreamReader.Create(Stream);

  TScriptStreamReader(ExtObject).OwnStream;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTStreamReaderMethodsDiscardBufferedDataEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TStreamReader(ExtObject).DiscardBufferedData;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTStreamReaderMethodsGetCurrentEncodingEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TStreamReader(ExtObject).CurrentEncoding);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTStreamReaderMethodsGetEndOfStreamEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TStreamReader(ExtObject).EndOfStream;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTStreamReaderMethodsGetStreamEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TStreamReader(ExtObject).BaseStream);
end;

// -----------------------------------------------------------------------------
//
// Script: TTextWriter
//
// -----------------------------------------------------------------------------
// Wraps a VCL TTextWriter object
// -----------------------------------------------------------------------------
procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTTextWriterMethodsCloseEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TStreamWriter(ExtObject).Close;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTTextWriterMethodsFlushEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TStreamWriter(ExtObject).Flush;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTTextWriterMethodsWriteStringEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TStreamWriter(ExtObject).Write(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTTextWriterMethodsWriteBooleanEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TStreamWriter(ExtObject).Write(Info.ParamAsBoolean[0]);
end;

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTTextWriterMethodsWriteIntegerEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TStreamWriter(ExtObject).Write(Info.ParamAsInteger[0]);
end;

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTTextWriterMethodsWriteFloatEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TStreamWriter(ExtObject).Write(Info.ParamAsFloat[0]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTTextWriterMethodsWriteLineEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TStreamWriter(ExtObject).WriteLine;
end;

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTTextWriterMethodsWriteLineBooleanEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TStreamWriter(ExtObject).WriteLine(Info.ParamAsBoolean[0]);
end;

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTTextWriterMethodsWriteLineIntegerEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TStreamWriter(ExtObject).WriteLine(Info.ParamAsInteger[0]);
end;

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTTextWriterMethodsWriteLineFloatEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TStreamWriter(ExtObject).WriteLine(Info.ParamAsFloat[0]);
end;

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTTextWriterMethodsWriteLineStringEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TStreamWriter(ExtObject).WriteLine(Info.ParamAsString[0]);
end;


// -----------------------------------------------------------------------------
//
// Script: TStreamWriter
//
// -----------------------------------------------------------------------------
// Wraps a VCL TStreamWriter object
// -----------------------------------------------------------------------------
type
  TScriptStreamWriter = class(TStreamWriter);

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTStreamWriterCleanUp(ExternalObject: TObject);
begin
  if (ExternalObject is TScriptStreamWriter) then
    ExternalObject.Free;
end;

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTStreamWriterConstructorsCreateStreamEval(Info: TProgramInfo; var ExtObject: TObject);
var
  Encoding: TEncoding;
begin
  ASSERT(ExtObject = nil);
  ASSERT(Info.Params[0].ExternalObject is TStream);
  if (Info.Params[1].ScriptObj <> nil) then
    Encoding := TEncoding(Info.ParamAsObject[1])
  else
    Encoding := nil;

  if (Encoding <> nil) then
    ExtObject := TScriptStreamWriter.Create(TStream(Info.Params[0].ExternalObject), Encoding)
  else
    ExtObject := TScriptStreamWriter.Create(TStream(Info.Params[0].ExternalObject));
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTStreamWriterConstructorsCreateFile1Eval(Info: TProgramInfo; var ExtObject: TObject);
var
  FileSystem: IdwsFileSystem;
  Filename: string;
  Append: boolean;
  FileOpenMode: TdwsFileOpenMode;
  Stream: TStream;
var
  Encoding: TEncoding;
begin
  ASSERT(ExtObject = nil);
  FileSystem := Info.Execution.FileSystem;
  Filename := Info.Params[0].ValueAsString;

  Append := Info.ParamAsBoolean[1];
  if (Append) then
    FileOpenMode := fomReadWrite
  else
    FileOpenMode := fomCreate;

  Stream := FileSystem.OpenFileStream(Filename, FileOpenMode);

  if (Stream = nil) then
    raise EScript.CreateFmt('File not found: %s', [Filename]);

  if (Info.Params[2].ScriptObj <> nil) then
    Encoding := TEncoding(Info.ParamAsObject[2])
  else
    Encoding := nil;

  try
    if (Append) then
      Stream.Seek(0, soEnd);

    if (Encoding <> nil) then
      ExtObject := TScriptStreamWriter.Create(Stream, Encoding)
    else
      ExtObject := TScriptStreamWriter.Create(Stream);
  except
    Stream.Free;
    raise;
  end;

  TScriptStreamWriter(ExtObject).OwnStream;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTStreamWriterMethodsGetAutoFlushEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TStreamWriter(ExtObject).AutoFlush;
end;

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTStreamWriterMethodsSetAutoFlushEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TStreamWriter(ExtObject).AutoFlush := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTStreamWriterMethodsGetEncodingEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TStreamWriter(ExtObject).Encoding);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTStreamWriterMethodsGetNewLineEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TStreamWriter(ExtObject).NewLine;
end;

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTStreamWriterMethodsSetNewLineEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TStreamWriter(ExtObject).NewLine := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTStreamWriterMethodsGetStreamEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TStreamWriter(ExtObject).BaseStream);
end;

// -----------------------------------------------------------------------------
//
// Script: TStringWriter
//
// -----------------------------------------------------------------------------
// Wraps a VCL TStringWriter object
// -----------------------------------------------------------------------------
type
  TScriptStringWriter = class(TStringWriter);

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTStringWriterCleanUp(ExternalObject: TObject);
begin
  if (ExternalObject is TScriptStringWriter) then
    ExternalObject.Free;
end;

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTStringWriterConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ASSERT(ExtObject = nil);
  ExtObject := TScriptStringWriter.Create;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTStringWriterMethodsToStringEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TStringWriter(ExtObject).ToString;
end;

// -----------------------------------------------------------------------------
//
// Script: TStringReader
//
// -----------------------------------------------------------------------------
// Wraps a VCL TStringReader object
// -----------------------------------------------------------------------------
type
  TScriptStringReader = class(TStringReader);

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTStringReaderCleanUp(ExternalObject: TObject);
begin
  if (ExternalObject is TScriptStringReader) then
    ExternalObject.Free;
end;

procedure TDataModuleScriptStreams.dwsUnitStreamsClassesTStringReaderConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  if (Info.FuncSym.Params.Count = 0) then
  begin
    ASSERT(ExtObject <> nil);
    ASSERT(ExtObject.ClassType = TStringReader);
  end else
  begin
    ASSERT(ExtObject = nil);
    ExtObject := TScriptStringReader.Create(Info.ParamAsString[0]);
  end;
end;

// -----------------------------------------------------------------------------
//
// function DetectCodePage(TStream): integer
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptStreams.dwsUnitStreamsFunctionsDetectCodePageEval(info: TProgramInfo);
begin
  Info.ResultAsInteger := DetectCodePage(TStream(Info.ParamAsObject[0]));
end;

// -----------------------------------------------------------------------------
//
// Script: TTextParserCSV
//
// -----------------------------------------------------------------------------
// Wraps a TCsvImporter object
// -----------------------------------------------------------------------------
{$ifdef FEATURE_CSV_IMPORT}
type
  TScriptImportRowTarget = class(TInterfacedObject, IImportRowTarget)
  private
    FValues: TStringDynArray;
    FCount: integer;
  protected
    function PrepareRow: boolean;
    function SaveValue(Index: integer; const Value: string): boolean;
    function FinalizeRow: boolean;

  public
    property Values: TStringDynArray read FValues;
    property Count: integer read FCount;
  end;

function TScriptImportRowTarget.PrepareRow: boolean;
var
  i: integer;
begin
  FCount := 0;

  for i := 0 to Length(FValues)-1 do
    FValues[i] := '';

  Result := True;
end;

function TScriptImportRowTarget.FinalizeRow: boolean;
begin
  Result := True;
end;

function TScriptImportRowTarget.SaveValue(Index: integer; const Value: string): boolean;
begin
  if (Index+1 > FCount) then
    FCount := Index+1;

  if (Index >= Length(FValues)) then
    SetLength(FValues, Index+1);

  FValues[Index] := Value;

  Result := True;
end;

type
  TTextParserCSV = class
  private
    FReader: TStreamReader;
    FOwnedReader: TStreamReader;
    FOwnedStream: TStream;
    FTarget: IImportRowTarget;
    FSettings: TCsvImportSettings;
    FRowCount: integer;
    FNeedData: boolean;
    FHasData: boolean;
  protected
    procedure EnsureData;
    function GetEndOfData: boolean;
  public
    constructor Create(AReader: TStreamReader); overload;
    constructor Create(AStream: TStream; AEncoding: TEncoding = nil; AOwnsObject: boolean = False); overload;
    destructor Destroy; override;

    property Reader: TStreamReader read FReader;
    property Target: IImportRowTarget read FTarget;
    property Settings: TCsvImportSettings read FSettings;
    property EndOfData: boolean read GetEndOfData;
    property RowCount: integer read FRowCount;

    function ReadRow: TStringDynArray;
  end;

constructor TTextParserCSV.Create(AReader: TStreamReader);
begin
  inherited Create;
  FReader := AReader;
  FTarget := TScriptImportRowTarget.Create;
  FSettings := TCsvImportSettings.Create;

  // See TCsvImporter.ParseCsvRow for an explanation of why we MUST make a bogus call to EndOfStream.
  FReader.EndOfStream;

  FNeedData := True;
end;

constructor TTextParserCSV.Create(AStream: TStream; AEncoding: TEncoding; AOwnsObject: boolean);
begin
  if (AOwnsObject) then
    FOwnedStream := AStream;
  if (AEncoding <> nil) then
    FOwnedReader := TStreamReader.Create(AStream, AEncoding)
  else
    FOwnedReader := TStreamReader.Create(AStream);
  Create(FOwnedReader);
end;

destructor TTextParserCSV.Destroy;
begin
  FOwnedReader.Free;
  FSettings.Free;
  FTarget := nil;
  inherited;
end;

procedure TTextParserCSV.EnsureData;
begin
  if (FNeedData) then
  begin
    FHasData := TCsvImporter.ParseCsvRow(FSettings, FReader, FTarget);
    FNeedData := (not FHasData);
  end;
end;

function TTextParserCSV.GetEndOfData: boolean;
begin
  EnsureData;
  Result := (not FHasData);
end;

function TTextParserCSV.ReadRow: TStringDynArray;
begin
  EnsureData;
  if (FHasData) then
  begin
    Result := TScriptImportRowTarget(FTarget).Values;
    SetLength(Result, TScriptImportRowTarget(FTarget).Count);
    FNeedData := True;
    Inc(FRowCount);
  end else
    SetLength(Result, 0);
end;
{$endif FEATURE_CSV_IMPORT}

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitDataCSVClassesTTextParserCSVCleanUp(ExternalObject: TObject);
begin
  ExternalObject.Free;
end;

procedure TDataModuleScriptStreams.dwsUnitDataCSVClassesTTextParserCSVConstructorsCreate0Eval(Info: TProgramInfo; var ExtObject: TObject);
begin
{$ifdef FEATURE_CSV_IMPORT}
  ExtObject := TTextParserCSV.Create(TStreamReader(Info.ParamAsObject[0]));
{$else FEATURE_CSV_IMPORT}
  raise Exception.Create('Feature not available');
{$endif FEATURE_CSV_IMPORT}
end;

procedure TDataModuleScriptStreams.dwsUnitDataCSVClassesTTextParserCSVConstructorsCreate1Eval(Info: TProgramInfo; var ExtObject: TObject);
{$ifdef FEATURE_CSV_IMPORT}
var
  Encoding: TEncoding;
{$endif FEATURE_CSV_IMPORT}
begin
{$ifdef FEATURE_CSV_IMPORT}
  if (Info.Params[1].ScriptObj <> nil) then
    Encoding := TEncoding(Info.ParamAsObject[1])
  else
    Encoding := nil;
  ExtObject := TTextParserCSV.Create(TStream(Info.ParamAsObject[0]), Encoding);
{$else FEATURE_CSV_IMPORT}
  raise Exception.Create('Feature not available');
{$endif FEATURE_CSV_IMPORT}
end;

procedure TDataModuleScriptStreams.dwsUnitDataCSVClassesTTextParserCSVConstructorsCreate2Eval(Info: TProgramInfo; var ExtObject: TObject);
{$ifdef FEATURE_CSV_IMPORT}
var
  FileSystem: IdwsFileSystem;
  Filename: string;
  Stream: TStream;
  Encoding: TEncoding;
{$endif FEATURE_CSV_IMPORT}
begin
{$ifdef FEATURE_CSV_IMPORT}
  ASSERT(ExtObject = nil);
  FileSystem := Info.Execution.FileSystem;
  Filename := Info.Params[0].ValueAsString;

  Stream := FileSystem.OpenFileStream(Filename, fomReadOnly);

  if (Stream = nil) then
    raise EScript.CreateFmt('File not found: %s', [Filename]);

  if (Info.Params[1].ScriptObj <> nil) then
    Encoding := TEncoding(Info.ParamAsObject[1])
  else
    Encoding := nil;

  ExtObject := TTextParserCSV.Create(Stream, Encoding, True);
{$else FEATURE_CSV_IMPORT}
  raise Exception.Create('Feature not available');
{$endif FEATURE_CSV_IMPORT}
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitDataCSVClassesTTextParserCSVMethodsGetEndOfDataEval(Info: TProgramInfo; ExtObject: TObject);
begin
{$ifdef FEATURE_CSV_IMPORT}
  Info.ResultAsBoolean := TTextParserCSV(ExtObject).EndOfData;
{$endif FEATURE_CSV_IMPORT}
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitDataCSVClassesTTextParserCSVMethodsGetRowCounterEval(Info: TProgramInfo; ExtObject: TObject);
begin
{$ifdef FEATURE_CSV_IMPORT}
  Info.ResultAsInteger := TTextParserCSV(ExtObject).RowCount;
{$endif FEATURE_CSV_IMPORT}
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitDataCSVClassesTTextParserCSVMethodsGetSettingsEval(Info: TProgramInfo; ExtObject: TObject);
begin
{$ifdef FEATURE_CSV_IMPORT}
  Info.ResultAsVariant := CreateResultScriptObject(Info, TTextParserCSV(ExtObject).Settings);
{$endif FEATURE_CSV_IMPORT}
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitDataCSVClassesTTextParserCSVMethodsGetStreamEval(Info: TProgramInfo; ExtObject: TObject);
begin
{$ifdef FEATURE_CSV_IMPORT}
  Info.ResultAsVariant := CreateResultScriptObject(Info, TTextParserCSV(ExtObject).Reader.BaseStream);
{$endif FEATURE_CSV_IMPORT}
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitDataCSVClassesTTextParserCSVMethodsReadRowEval(Info: TProgramInfo; ExtObject: TObject);
begin
{$ifdef FEATURE_CSV_IMPORT}
  Info.ResultAsStringArray := TTextParserCSV(ExtObject).ReadRow;
{$endif FEATURE_CSV_IMPORT}
end;

// -----------------------------------------------------------------------------
//
// Script: TCsvParserSettings
//
// -----------------------------------------------------------------------------
// Wraps a TCsvImportSettings object
// -----------------------------------------------------------------------------
procedure TDataModuleScriptStreams.dwsUnitDataCSVClassesTCsvParserSettingsConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
{$ifdef FEATURE_CSV_IMPORT}
  ExtObject := TCsvImportSettings.Create;
{$else FEATURE_CSV_IMPORT}
  raise Exception.Create('Feature not available');
{$endif FEATURE_CSV_IMPORT}
end;

procedure TDataModuleScriptStreams.dwsUnitDataCSVClassesTCsvParserSettingsCleanUp(ExternalObject: TObject);
begin
  ExternalObject.Free;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptStreams.dwsUnitDataCSVClassesTCsvParserSettingsMethodsGetCodepageEval(Info: TProgramInfo; ExtObject: TObject);
begin
{$ifdef FEATURE_CSV_IMPORT}
  Info.ResultAsInteger := TCsvImportSettings(ExtObject).Codepage;
{$endif FEATURE_CSV_IMPORT}
end;

procedure TDataModuleScriptStreams.dwsUnitDataCSVClassesTCsvParserSettingsMethodsGetDecimalSeparatorEval(Info: TProgramInfo; ExtObject: TObject);
begin
{$ifdef FEATURE_CSV_IMPORT}
  Info.ResultAsString := TCsvImportSettings(ExtObject).DecimalSeparator;
{$endif FEATURE_CSV_IMPORT}
end;

procedure TDataModuleScriptStreams.dwsUnitDataCSVClassesTCsvParserSettingsMethodsGetDelimiterCharEval(Info: TProgramInfo; ExtObject: TObject);
begin
{$ifdef FEATURE_CSV_IMPORT}
  Info.ResultAsString := TCsvImportSettings(ExtObject).DelimiterChar;
{$endif FEATURE_CSV_IMPORT}
end;

procedure TDataModuleScriptStreams.dwsUnitDataCSVClassesTCsvParserSettingsMethodsGetEscapeCharEval(Info: TProgramInfo; ExtObject: TObject);
begin
{$ifdef FEATURE_CSV_IMPORT}
  Info.ResultAsString := TCsvImportSettings(ExtObject).EscapeChar;
{$endif FEATURE_CSV_IMPORT}
end;

procedure TDataModuleScriptStreams.dwsUnitDataCSVClassesTCsvParserSettingsMethodsGetQuoteCharEval(Info: TProgramInfo; ExtObject: TObject);
begin
{$ifdef FEATURE_CSV_IMPORT}
  Info.ResultAsString := TCsvImportSettings(ExtObject).QuoteChar;
{$endif FEATURE_CSV_IMPORT}
end;

procedure TDataModuleScriptStreams.dwsUnitDataCSVClassesTCsvParserSettingsMethodsGetSkipRowsEval(Info: TProgramInfo; ExtObject: TObject);
begin
{$ifdef FEATURE_CSV_IMPORT}
  Info.ResultAsInteger := Max(0, TCsvImportSettings(ExtObject).FirstRow - 1);
{$endif FEATURE_CSV_IMPORT}
end;

procedure TDataModuleScriptStreams.dwsUnitDataCSVClassesTCsvParserSettingsMethodsSetCodepageEval(Info: TProgramInfo; ExtObject: TObject);
begin
{$ifdef FEATURE_CSV_IMPORT}
  TCsvImportSettings(ExtObject).Codepage := Info.ParamAsInteger[0];
{$endif FEATURE_CSV_IMPORT}
end;

procedure TDataModuleScriptStreams.dwsUnitDataCSVClassesTCsvParserSettingsMethodsSetDecimalSeparatorEval(Info: TProgramInfo; ExtObject: TObject);
begin
{$ifdef FEATURE_CSV_IMPORT}
  TCsvImportSettings(ExtObject).DecimalSeparator := Info.ParamAsString[0][1];
{$endif FEATURE_CSV_IMPORT}
end;

procedure TDataModuleScriptStreams.dwsUnitDataCSVClassesTCsvParserSettingsMethodsSetDelimiterCharEval(Info: TProgramInfo; ExtObject: TObject);
begin
{$ifdef FEATURE_CSV_IMPORT}
  TCsvImportSettings(ExtObject).DelimiterChar := Info.ParamAsString[0][1];
{$endif FEATURE_CSV_IMPORT}
end;

procedure TDataModuleScriptStreams.dwsUnitDataCSVClassesTCsvParserSettingsMethodsSetEscapeCharEval(Info: TProgramInfo; ExtObject: TObject);
begin
{$ifdef FEATURE_CSV_IMPORT}
  TCsvImportSettings(ExtObject).EscapeChar := Info.ParamAsString[0][1];
{$endif FEATURE_CSV_IMPORT}
end;

procedure TDataModuleScriptStreams.dwsUnitDataCSVClassesTCsvParserSettingsMethodsSetQuoteCharEval(Info: TProgramInfo; ExtObject: TObject);
begin
{$ifdef FEATURE_CSV_IMPORT}
  TCsvImportSettings(ExtObject).QuoteChar := Info.ParamAsString[0][1];
{$endif FEATURE_CSV_IMPORT}
end;

procedure TDataModuleScriptStreams.dwsUnitDataCSVClassesTCsvParserSettingsMethodsSetSkipRowsEval(Info: TProgramInfo; ExtObject: TObject);
begin
{$ifdef FEATURE_CSV_IMPORT}
  TCsvImportSettings(ExtObject).FirstRow := Max(0, Info.ParamAsInteger[0]) + 1;
{$endif FEATURE_CSV_IMPORT}
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

initialization
  TDataModuleScriptStreams.RegisterModule;
end.
