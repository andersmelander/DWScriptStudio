unit amScriptModuleClasses;

(*
 * Copyright © 2014 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Windows,
  Controls,
  SysUtils, Classes,
  Generics.Collections,

  dwsComp,
  dwsExprs,
  dwsCompiler,
  dwsClassesLibModule,
  dwsDataContext,

  amScriptModule;

// -----------------------------------------------------------------------------
//
// TDataModuleScriptClasses
//
// -----------------------------------------------------------------------------
// Contains the following script classes:
//
// - TStrings
// - TStringList
//
// - TStream
// - TFileStream
// - TMemoryStream
// - TStringStream
//
// - TCollection
// - TCollectionItem
//
// TODO : TStreamReader
// TODO : TStreamWriter
// -----------------------------------------------------------------------------
type
  TDataModule = class(TScriptModule);

  TDataModuleScriptClasses = class(TDataModule)
    dwsUnitClasses: TdwsUnit;
    dwsUnitLocalization: TdwsUnit;
    procedure DataModuleCreate(Sender: TObject);
    procedure dwsUnitClassesTStringsMethodsAddEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringsMethodsGetEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringsMethodsIndexOfEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringsMethodsIndexOfNameEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringsMethodsInsertEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringsMethodsGetValuesEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringsMethodsGetNameEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringsMethodsClearEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringsMethodsGetTextEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringsMethodsSetTextEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringsMethodsGetCountEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringsMethodsGetCommaTextEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringsMethodsSetCommaTextEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringsMethodsLoadFromFileEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringsMethodsSaveToFileEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringsMethodsDeleteEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringsMethodsExchangeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringsMethodsMoveEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringsMethodsAddStringsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringListMethodsSortEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringListMethodsFindEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringListMethodsGetDuplicatesEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringListMethodsSetDuplicatesEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringListMethodsGetSortedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringListMethodsSetSortedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringsMethodsGetStringsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringsMethodsSetStringsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringsMethodsSetValuesEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringListMethodsGetCaseSensitiveEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringListMethodsSetCaseSensitiveEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTStringsMethodsContainsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStringsMethodsRemoveEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStringListConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitClassesClassesTStringListCleanUp(ExternalObject: TObject);
    procedure dwsUnitClassesClassesTStringsMethodsLoadFromStreamEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStringsMethodsSaveToStreamEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStringsMethodsGetDelimiterEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStringsMethodsSetDelimiterEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStringsMethodsGetDelimitedTextEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStringsMethodsSetDelimitedTextEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStringsMethodsGetQuoteCharEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStringsMethodsSetQuoteCharEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStringsMethodsGetLineBreakEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStringsMethodsSetLineBreakEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStringsMethodsGetNameValueSeparatorEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStringsMethodsSetNameValueSeparatorEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStringsMethodsGetStrictDelimiterEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStringsMethodsSetStrictDelimiterEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStringsMethodsAddTagEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStringsMethodsGetTagEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStringsMethodsSetTagEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLocalizationInstancesLocalizerInstantiate(info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitLocalizationClassesTLocalizerMethodsGetStringsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLocalizationClassesTLocalizerMethodsSaveEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLocClassesTLocalizerMethodsGetAddMissingTranslationsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLocClassesTLocalizerMethodsSetAddMissingTranslationsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLocalizationClassesTLocalizerMethodsGetUTF8EncodeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLocalizationClassesTLocalizerMethodsSetUTF8EncodeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTComponentMethodsGetOwnerEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesFunctionsRectEval(info: TProgramInfo);
    procedure dwsUnitClassesFunctionsPointEval(info: TProgramInfo);
    procedure dwsUnitClassesClassesTComponentMethodsGetNameEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTComponentMethodsFindComponentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTComponentMethodsGetTagEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTComponentMethodsSetTagEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTComponentMethodsGetComponentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTComponentMethodsGetComponentCountEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTComponentMethodsGetComponentIndexEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTComponentMethodsSetComponentIndexEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTCollectionMethodsGetCountEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTCollectionMethodsClearEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTCollectionMethodsDeleteEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTCollectionMethodsAddEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTPersistentMethodsAssignToEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTPersistentMethodsAssignEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStringsMethodsGetEncodingEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStringsMethodsGetDefaultEncodingEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesClassesTStringsMethodsSetDefaultEncodingEval(Info: TProgramInfo; ExtObject: TObject);
  private
  protected
    procedure RectGetTopLeft(Info: TProgramInfo; ExtObject: TObject);
    procedure RectSetTopLeft(Info: TProgramInfo; ExtObject: TObject);
  protected
    // IScriptModule
    procedure Initialize(ADelphiWebScript: TDelphiWebScript); override;
  public
  published
  end;

function RectToData(const Rect: TRect): TData;
function DataToRect(const Data: TData): TRect;
function PointToData(const Point: TPoint): TData;
function DataToPoint(const Data: TData): TPoint;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

implementation

uses
  Variants,
  TypInfo,

  dwsSymbols,
  dwsFileSystem,
  dwsUtils,
  dwsRTTIExposer,

{$ifdef FEATURE_CSV_IMPORT}
  amDataCsvImportConfig, // Used to load localization from CSV
  amCsvImport,
{$endif FEATURE_CSV_IMPORT}
  amScriptAPI;

{$R *.DFM}

procedure TDataModuleScriptClasses.DataModuleCreate(Sender: TObject);
begin
(*
var
  RecordSymbol: TdwsRecord;
  Method: TdwsMethod;
  Param: TdwsParameter;

  RecordSymbol := TdwsRecord(dwsUnitClasses.Records.Symbols['TRect']);
  Method := TdwsMethod.Create(nil);
  Method.Name := 'GetTopLeft';
  Method.ResultType := 'TPoint';
  Method.OnEval := RectGetTopLeft;
  Method := TdwsMethod.Create(nil);
  Method.Name := 'SetTopLeft';
  Param := Method.Parameters.Add;
  Param.Name := 'Value';
  Param.DataType := 'TPoint';
  Method.OnEval := RectSetTopLeft;
*)
end;

procedure TDataModuleScriptClasses.Initialize(ADelphiWebScript: TDelphiWebScript);
begin
  inherited;

  ScriptService.RegisterClassTypeMapping(TStringList);
end;

// -----------------------------------------------------------------------------
//
// Script: TRect
//
// -----------------------------------------------------------------------------
function RectToData(const Rect: TRect): TData;
begin
  SetLength(Result, 4);
  // Note: DWScript integer type must be int64
  Result[0] := int64(Rect.Left);
  Result[1] := int64(Rect.Top);
  Result[2] := int64(Rect.Right);
  Result[3] := int64(Rect.Bottom);
end;

function DataToRect(const Data: TData): TRect;
begin
  ASSERT(Length(Data) = 4, 'Invalid script representation of TRect');
  Result.Left := Data[0];
  Result.Top := Data[1];
  Result.Right := Data[2];
  Result.Bottom := Data[3];
end;

function PointToData(const Point: TPoint): TData;
begin
  SetLength(Result, 2);
  Result[0] := int64(Point.X);
  Result[1] := int64(Point.Y);
end;

function DataToPoint(const Data: TData): TPoint;
begin
  ASSERT(Length(Data) = 2, 'Invalid script representation of TPoint');
  Result.X := Data[0];
  Result.Y := Data[1];
end;

procedure TDataModuleScriptClasses.RectGetTopLeft(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultVars.Data := PointToData(DataToRect(Info.Vars['self'].Data).TopLeft);
end;

procedure TDataModuleScriptClasses.RectSetTopLeft(Info: TProgramInfo; ExtObject: TObject);
var
  Rect: TRect;
begin
  Rect := DataToRect(Info.Vars['self'].Data);
  Rect.TopLeft := DataToPoint(Info.Params[0].Data);
  Info.Vars['self'].Data := RectToData(Rect);
end;

procedure TDataModuleScriptClasses.dwsUnitClassesFunctionsPointEval(info: TProgramInfo);
begin
  Info.ResultVars.Data := PointToData(Point(Info.ParamAsInteger[0], Info.ParamAsInteger[1]));
end;

procedure TDataModuleScriptClasses.dwsUnitClassesFunctionsRectEval(info: TProgramInfo);
begin
  Info.ResultVars.Data := PointToData(Point(Info.ParamAsInteger[0], Info.ParamAsInteger[1]));
end;

// -----------------------------------------------------------------------------
//
// Script: TStrings
//
// -----------------------------------------------------------------------------
// Wraps a VCL TStrings object
// -----------------------------------------------------------------------------
procedure TDataModuleScriptClasses.dwsUnitClassesTStringsMethodsAddEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.Add(const Value: string)
begin
  Info.ResultAsInteger := TStrings(ExtObject).Add(Info.Params[0].ValueAsString);
end;

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTStringsMethodsAddTagEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.AddTag(const Value: string; Tag: integer)
begin
  Info.ResultAsInteger := TStrings(ExtObject).AddObject(Info.Params[0].ValueAsString, TObject(pointer(Info.Params[1].ValueAsInteger)));
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesTStringsMethodsAddStringsEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.AddStrings(Strings: TStrings)
var
  StringsObj: TStrings;
begin
  if (Info.Params[0].ExternalObject = nil) then
    exit;
  StringsObj := Info.Params[0].ExternalObject as TStrings;
  TStrings(ExtObject).AddStrings(StringsObj);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesTStringsMethodsClearEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.Clear
begin
  TStrings(ExtObject).Clear;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesTStringsMethodsContainsEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.Contains(const Value: string)
begin
  Info.ResultAsBoolean := (TStrings(ExtObject).IndexOf(Info.Params[0].ValueAsString) <> -1);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesTStringsMethodsDeleteEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.Delete(Index: integer)
begin
  TStrings(ExtObject).Delete(Info.Params[0].ValueAsInteger);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesTStringsMethodsExchangeEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.Exchange(Index1, Index2: integer)
begin
  TStrings(ExtObject).Exchange(Info.Params[0].ValueAsInteger, Info.Params[1].ValueAsInteger);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesTStringsMethodsGetEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.Get(Index: integer): string
begin
  Info.ResultAsString := TStrings(ExtObject)[Info.Params[0].ValueAsInteger];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesTStringsMethodsGetCommaTextEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.GetCommaText: string
begin
  Info.ResultAsString := TStrings(ExtObject).CommaText;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesTStringsMethodsGetCountEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.GetCount: integer
begin
  Info.ResultAsInteger := TStrings(ExtObject).Count;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesTStringsMethodsGetNameEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.GetName(const Value: string): string
begin
  Info.ResultAsString := TStrings(ExtObject).Names[Info.Params[0].ValueAsInteger];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesTStringsMethodsGetStringsEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.GetString(Index: integer): integer
begin
  Info.ResultAsString := TStrings(ExtObject).Strings[Info.Params[0].ValueAsInteger];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesTStringsMethodsGetTextEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.GetText: string
begin
  Info.ResultAsString := TStrings(ExtObject).Text;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesTStringsMethodsGetValuesEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.GetValue(const Name: string): string
begin
  Info.ResultAsString := TStrings(ExtObject).Values[Info.Params[0].ValueAsString];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesTStringsMethodsIndexOfEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.IndexOf(const Value: string): integer
begin
  Info.ResultAsInteger := TStrings(ExtObject).IndexOf(Info.Params[0].ValueAsString);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesTStringsMethodsIndexOfNameEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.IndexOfName(const Name: string): integer
begin
  Info.ResultAsInteger := TStrings(ExtObject).IndexOfName(Info.Params[0].ValueAsString);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesTStringsMethodsInsertEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.Insert(const Index: integer; const Value: string)
begin
  TStrings(ExtObject).Insert(Info.Params[0].ValueAsInteger, Info.Params[1].ValueAsString);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesTStringsMethodsLoadFromFileEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.LoadFromFile(const Filename: string)
var
  Stream: TStream;
  FileSystem: IdwsFileSystem;
  Encoding: TEncoding;
begin
  FileSystem := Info.Execution.FileSystem;
  Stream := FileSystem.OpenFileStream(Info.Params[0].ValueAsString, fomReadOnly);
  try
    if (Info.Params[1].ScriptObj <> nil) then
      Encoding := TEncoding(Info.Params[1].ExternalObject)
    else
      Encoding := nil;

    TStrings(ExtObject).LoadFromStream(Stream, Encoding);
  finally
    Stream.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesTStringsMethodsMoveEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.Move(FromIndex, ToIndex: integer)
begin
  TStrings(ExtObject).Move(Info.Params[0].ValueAsInteger, Info.Params[1].ValueAsInteger);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesTStringsMethodsSaveToFileEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.SaveToFile(const Filename: string)
var
  Stream : TStream;
  FileSystem : IdwsFileSystem;
  Encoding: TEncoding;
begin
  FileSystem:=Info.Execution.FileSystem;
  Stream:=FileSystem.OpenFileStream(Info.Params[0].ValueAsString, fomCreate);
  try
    if (Info.Params[1].ScriptObj <> nil) then
      Encoding := TEncoding(Info.Params[1].ExternalObject)
    else
      Encoding := nil;

    if (Encoding <> nil) then
      TStrings(ExtObject).SaveToStream(Stream, Encoding)
    else
      TStrings(ExtObject).SaveToStream(Stream); // Use existing encoding
  finally
    Stream.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesTStringsMethodsSetCommaTextEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.SetCommaText(const Value: string)
begin
  TStrings(ExtObject).StrictDelimiter := True;
  TStrings(ExtObject).CommaText := Info.Params[0].ValueAsString;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesTStringsMethodsSetStringsEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.SetString(Index: integer; const Value: string)
begin
  TStrings(ExtObject)[Info.Params[0].ValueAsInteger] := Info.Params[1].ValueAsString;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesTStringsMethodsSetTextEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.SetText(const Value: string)
begin
  TStrings(ExtObject).Text := Info.Params[0].ValueAsString;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesTStringsMethodsSetValuesEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.SetValue(const Name, Value: string)
begin
  TStrings(ExtObject).Values[Info.Params[0].ValueAsString] := Info.Params[1].ValueAsString;
end;

// -----------------------------------------------------------------------------

function InvariantStringListSortCompare(List: TStringList; Index1, Index2: Integer): Integer;
var
  S1, S2: string;
  Flags: DWORD;
begin
  S1 := List[Index1];
  S2 := List[Index2];
  if (List.CaseSensitive) then
    Flags := 0
  else
    Flags := NORM_IGNORECASE;
  Result := CompareString(LOCALE_INVARIANT, Flags, PChar(S1), Length(S1), PChar(S2), Length(S2)) - CSTR_EQUAL;
end;

procedure TDataModuleScriptClasses.dwsUnitClassesTStringListMethodsSortEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.Sort
begin
  if (Info.ParamAsBoolean[0]) then
    TStringList(ExtObject).CustomSort(InvariantStringListSortCompare)
  else
    TStringList(ExtObject).Sort;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTStringsMethodsRemoveEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.Remove(const Value: string)
var
  Index: integer;
begin
  Index := TStrings(ExtObject).IndexOf(Info.ParamAsString[0]);
  if (Index <> -1) then
    TStrings(ExtObject).Delete(Index);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTStringsMethodsLoadFromStreamEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.LoadFromStream(TStream);
var
  Stream: TStream;
  Encoding: TEncoding;
begin
  if (Info.Params[0].ExternalObject = nil) then
    raise EScript.Create('Invalid stream object');
  Stream := (Info.Params[0].ExternalObject as TStream);

  if (Info.Params[1].ScriptObj <> nil) then
    Encoding := TEncoding(Info.Params[1].ExternalObject)
  else
    Encoding := nil;

  TStrings(ExtObject).LoadFromStream(Stream, Encoding);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTStringsMethodsSaveToStreamEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.SaveToStream(TStream);
var
  Stream: TStream;
  Encoding: TEncoding;
begin
  if (Info.Params[0].ExternalObject = nil) then
    raise EScript.Create('Invalid stream object');
  Stream := (Info.Params[0].ExternalObject as TStream);

  if (Info.Params[1].ScriptObj <> nil) then
    Encoding := TEncoding(Info.Params[1].ExternalObject)
  else
    Encoding := nil;

  if (Encoding <> nil) then
    TStrings(ExtObject).SaveToStream(Stream, Encoding)
  else
    TStrings(ExtObject).SaveToStream(Stream); // Use existing encoding
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTStringsMethodsGetDelimiterEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.GetDelimiter: string;
begin
  Info.ResultAsString := TStrings(ExtObject).Delimiter;
end;

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTStringsMethodsSetDelimiterEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.SetDelimiter(const Value: string);
var
  Value: string;
begin
  Value := Info.Params[0].ValueAsString;
  if (Value <> '') then
    TStrings(ExtObject).Delimiter := Value[1]
  else
    TStrings(ExtObject).Delimiter := #0;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTStringsMethodsGetEncodingEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TStrings(ExtObject).Encoding);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTStringsMethodsGetDefaultEncodingEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TStrings(ExtObject).DefaultEncoding);
end;

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTStringsMethodsSetDefaultEncodingEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (Info.Params[0].ScriptObj <> nil) then
    TStrings(ExtObject).DefaultEncoding := TEncoding(Info.ParamAsObject[0])
  else
    TStrings(ExtObject).DefaultEncoding := nil;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTStringsMethodsGetLineBreakEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.GetLineBreak: string;
begin
  Info.ResultAsString := TStrings(ExtObject).LineBreak;
end;

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTStringsMethodsSetLineBreakEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.SetLineBreak(const Value: string);
begin
  TStrings(ExtObject).LineBreak := Info.Params[0].ValueAsString;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTStringsMethodsGetNameValueSeparatorEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.GetNameValueSeparator: string;
begin
  Info.ResultAsString := TStrings(ExtObject).NameValueSeparator;
end;

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTStringsMethodsSetNameValueSeparatorEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.SetNameValueSeparator(const Value: string);
var
  Value: string;
begin
  Value := Info.Params[0].ValueAsString;
  if (Value <> '') then
    TStrings(ExtObject).NameValueSeparator := Value[1]
  else
    TStrings(ExtObject).NameValueSeparator := #0;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTStringsMethodsGetQuoteCharEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.GetQuoteChar: string;
begin
  Info.ResultAsString := TStrings(ExtObject).QuoteChar;
end;

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTStringsMethodsSetQuoteCharEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.SetQuoteChar(const Value: string);
var
  Value: string;
begin
  Value := Info.Params[0].ValueAsString;
  if (Value <> '') then
    TStrings(ExtObject).QuoteChar := Value[1]
  else
    TStrings(ExtObject).QuoteChar := #0;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTStringsMethodsGetStrictDelimiterEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TStrings(ExtObject).StrictDelimiter;
end;

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTStringsMethodsSetStrictDelimiterEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TStrings(ExtObject).StrictDelimiter := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTStringsMethodsGetTagEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := integer(pointer(TStrings(ExtObject).Objects[Info.ParamAsInteger[0]]));
end;

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTStringsMethodsSetTagEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TStrings(ExtObject).Objects[Info.ParamAsInteger[0]] := TObject(pointer(Info.ParamAsInteger[1]));
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTStringsMethodsGetDelimitedTextEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.GetDelimitedText: string;
begin
  Info.ResultAsString := TStrings(ExtObject).DelimitedText;
end;

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTStringsMethodsSetDelimitedTextEval(Info: TProgramInfo; ExtObject: TObject);
// TStrings.SetDelimitedText(const Value: string);
begin
  TStrings(ExtObject).DelimitedText := Info.Params[0].ValueAsString;
end;

// -----------------------------------------------------------------------------
//
// Script: TStringList = class(TStrings)
//
// -----------------------------------------------------------------------------
// Wraps a VCL TStringList object
// -----------------------------------------------------------------------------
type
  TScriptStringList = class(TStringList);

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTStringListCleanUp(ExternalObject: TObject);
begin
  if (ExternalObject <> nil) and (ExternalObject is TScriptStringList) then
    ExternalObject.Free;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTStringListConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
// TStringList.Create
begin
  if (ExtObject = nil) then
    ExtObject := TScriptStringList.Create;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesTStringListMethodsFindEval(Info: TProgramInfo; ExtObject: TObject);
// TStringList.Find(const Value: string)
var
  Index: Integer;
begin
  Info.ResultAsBoolean := TStringList(ExtObject).Find(Info.Params[0].ValueAsString, Index);
  Info.Params[1].ValueAsInteger := Index;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesTStringListMethodsGetCaseSensitiveEval(Info: TProgramInfo; ExtObject: TObject);
// TStringList.GetCaseSensitive: boolean
begin
  Info.ResultAsBoolean := TStringList(ExtObject).CaseSensitive;
end;

procedure TDataModuleScriptClasses.dwsUnitClassesTStringListMethodsSetCaseSensitiveEval(Info: TProgramInfo; ExtObject: TObject);
// TStringList.SetCaseSensitive(Value: boolean)
begin
  TStringList(ExtObject).CaseSensitive := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesTStringListMethodsGetDuplicatesEval(Info: TProgramInfo; ExtObject: TObject);
// TStringList.GetDuplicates: boolean
begin
  Info.ResultAsInteger := Integer(TStringList(ExtObject).Duplicates);
end;

procedure TDataModuleScriptClasses.dwsUnitClassesTStringListMethodsSetDuplicatesEval(Info: TProgramInfo; ExtObject: TObject);
// TStringList.SetDuplicates(Value: boolean)
begin
  TStringList(ExtObject).Duplicates := TDuplicates(Info.Params[0].ValueAsInteger);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesTStringListMethodsGetSortedEval(Info: TProgramInfo; ExtObject: TObject);
// TStringList.GetSorted: boolean
begin
  Info.ResultAsBoolean := TStringList(ExtObject).Sorted;
end;

procedure TDataModuleScriptClasses.dwsUnitClassesTStringListMethodsSetSortedEval(Info: TProgramInfo; ExtObject: TObject);
// TStringList.SetSorted(Value: boolean)
begin
  TStringList(ExtObject).Sorted := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------
//
// Script: TLocalizer
//
// -----------------------------------------------------------------------------
type
  IScriptLocalizer = interface
    ['{49B8E8EB-E381-4F77-BA34-8CBE353E12BA}']
    function GetStrings: TStrings;
    procedure SaveToStrings;
    function GetAutoAddMissing: boolean;
    procedure SetAutoAddMissing(Value: boolean);
    function GetUTF8Encode: boolean;
    procedure SetUTF8Encode(Value: boolean);
  end;

  TScriptLocalizer = class(TInterfacedSelfObject, IdwsLocalizer, IScriptLocalizer)
  private
    FStrings: TStrings;
    FTranslations: TDictionary<string, string>;
    FSaving: boolean;
    FAutoAddMissing: boolean;
    FUTF8Encode: boolean;
  protected
    procedure LoadFromCSV;
    function EnsureTranslations: boolean;
    procedure StringsChanged(Sender: TObject);
    procedure AddTranslation(const Name, Value: string);
    // IdwsLocalizer
    procedure LocalizeSymbol(aResSymbol : TResourceStringSymbol; var Result : UnicodeString);
    procedure LocalizeString(const aString : UnicodeString; var Result : UnicodeString);
    // IScriptLocalizer
    function GetStrings: TStrings;
    procedure SaveToStrings;
    function GetAutoAddMissing: boolean;
    procedure SetAutoAddMissing(Value: boolean);
    function GetUTF8Encode: boolean;
    procedure SetUTF8Encode(Value: boolean);
  public
    constructor Create;
    destructor Destroy; override;
  end;

procedure TScriptLocalizer.AddTranslation(const Name, Value: string);
begin
  FTranslations.AddOrSetValue(Name, Value);
end;

constructor TScriptLocalizer.Create;
begin
  inherited Create;
  FStrings := TStringList.Create;
  TStringList(FStrings).OnChange := StringsChanged;
end;

destructor TScriptLocalizer.Destroy;
begin
  FStrings.Free;
  FTranslations.Free;
  inherited;
end;

function TScriptLocalizer.EnsureTranslations: boolean;
begin
  if (FTranslations <> nil) then
  begin
    Result := (FTranslations.Count > 0);
    exit;
  end;

  if (FStrings.Count = 0) then
  begin
    Result := False;
    exit;
  end;

  FTranslations := TDictionary<string, string>.Create;

  LoadFromCSV;

  Result := True;
end;

function TScriptLocalizer.GetAutoAddMissing: boolean;
begin
  Result := FAutoAddMissing;
end;

function TScriptLocalizer.GetStrings: TStrings;
begin
  Result := FStrings;
end;

function TScriptLocalizer.GetUTF8Encode: boolean;
begin
  Result := FUTF8Encode;
end;

{$ifdef FEATURE_CSV_IMPORT}
type
  TImportRowTargetLocalizer = class(TInterfacedObject, IImportRowTarget)
  private
    FLocalizer: TScriptLocalizer;
    FName, FValue: string;
  public
    constructor Create(ALocalizer: TScriptLocalizer);
    function PrepareRow: boolean;
    function SaveValue(Index: integer; const Value: string): boolean;
    function FinalizeRow: boolean;
  end;

constructor TImportRowTargetLocalizer.Create(ALocalizer: TScriptLocalizer);
begin
  inherited Create;
  FLocalizer := ALocalizer;
end;

function TImportRowTargetLocalizer.FinalizeRow: boolean;
begin
  if (FName <> '') then
    FLocalizer.AddTranslation(FName, FValue);

  Result := True;
end;

function TImportRowTargetLocalizer.PrepareRow: boolean;
begin
  Result := True;

  FName := '';
  FValue := '';
end;

function TImportRowTargetLocalizer.SaveValue(Index: integer; const Value: string): boolean;
begin
  Result := (Index < 2);

  if (Result) then
  begin
    if (Index = 0) then
      FName := Value
    else
      FValue := Value;
  end;
end;
{$endif FEATURE_CSV_IMPORT}

procedure TScriptLocalizer.LoadFromCSV;
{$ifdef FEATURE_CSV_IMPORT}
var
  Stream: TStream;
  Reader: TStreamReader;
  Target: IImportRowTarget;
  ImportSettings: TCsvImportSettings;
  Encoding: TEncoding;
{$endif FEATURE_CSV_IMPORT}
begin
{$ifdef FEATURE_CSV_IMPORT}
  if (FStrings.Count = 0) then
    exit;

  ImportSettings := TCsvImportSettings.Create;
  try
    ImportSettings.QuoteChar := '"';
    ImportSettings.DelimiterChar := ';';
    ImportSettings.DecimalSeparator := FormatSettings.DecimalSeparator;

    Target := TImportRowTargetLocalizer.Create(Self);
    try

      Stream := TMemoryStream.Create;
      try
        FStrings.SaveToStream(Stream);
        Stream.Position := 0;
        if (FUTF8Encode) then
          Encoding := TEncoding.UTF8
        else
          Encoding := TEncoding.GetEncoding(GetACP);

        Reader := TStreamReader.Create(Stream, Encoding);
        try
          if (Reader.EndOfStream) and (FUTF8Encode) then
          begin
            // Fall back to ANSI encoding
            FreeAndNil(Reader);
            Encoding := TEncoding.GetEncoding(GetACP);
            Reader := TStreamReader.Create(Stream, Encoding);
          end;

          TCsvImporter.ParseCsv(ImportSettings, Reader, nil, MaxInt, Target);

        finally
          Reader.Free;
        end;
      finally
      end;

    finally
      Target := nil;
    end;
  finally
    ImportSettings.Free;
  end;
{$else FEATURE_CSV_IMPORT}
  raise Exception.Create('Feature not supported: TScriptLocalizer.LoadFromCSV');
{$endif FEATURE_CSV_IMPORT}
end;

procedure TScriptLocalizer.LocalizeString(const aString: UnicodeString; var Result: UnicodeString);
begin
  if (not EnsureTranslations) then
  begin
    Result := aString;
    exit;
  end;

  if (not FTranslations.TryGetValue(aString, Result)) then
  begin
    Result := aString;
    if (FAutoAddMissing) then
      FTranslations.Add(aString, Result);
  end;
end;

procedure TScriptLocalizer.LocalizeSymbol(aResSymbol: TResourceStringSymbol; var Result: UnicodeString);
begin
  if (not EnsureTranslations) then
  begin
    Result := aResSymbol.Value;
    exit;
  end;

  if (not FTranslations.TryGetValue(aResSymbol.Name, Result)) then
    if (not FTranslations.TryGetValue(aResSymbol.Value, Result)) then
    begin
      Result := aResSymbol.Value;
      if (FAutoAddMissing) then
        FTranslations.Add(aResSymbol.Name, Result);
    end;
end;

procedure TScriptLocalizer.SaveToStrings;
var
  Translation: TPair<string, string>;
  s: string;
begin
  FSaving := True;
  TStringList(FStrings).BeginUpdate;
  try
    FStrings.Clear;
    if (FTranslations <> nil) then
    begin
      for Translation in FTranslations do
      begin
        s := '"' + Translation.Key + '";"' + Translation.Value + '"';
        FStrings.Add(s);
      end;
    end;
  finally
    TStringList(FStrings).EndUpdate;
    FSaving := False;
  end;
end;

procedure TScriptLocalizer.SetAutoAddMissing(Value: boolean);
begin
  FAutoAddMissing := Value;
end;

procedure TScriptLocalizer.SetUTF8Encode(Value: boolean);
begin
  FUTF8Encode := Value;
end;

procedure TScriptLocalizer.StringsChanged(Sender: TObject);
begin
  if (not FSaving) then
    FreeAndNil(FTranslations);
end;

type
  TScriptLocalizerWrapper = class
  private
    FLocalizer: IScriptLocalizer;
  public
    constructor Create(const ALocalizer: IScriptLocalizer);
    property Localizer: IScriptLocalizer read FLocalizer;
  end;

constructor TScriptLocalizerWrapper.Create(const ALocalizer: IScriptLocalizer);
begin
  inherited Create;
  FLocalizer := ALocalizer;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitLocalizationInstancesLocalizerInstantiate(info: TProgramInfo; var ExtObject: TObject);
begin
  if (Info.Execution.Localizer = nil) then
    Info.Execution.Localizer := TScriptLocalizer.Create;
  ExtObject := TScriptLocalizerWrapper.Create(Info.Execution.Localizer as IScriptLocalizer);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitLocalizationClassesTLocalizerMethodsGetStringsEval(Info: TProgramInfo; ExtObject: TObject);
var
  Strings: TStrings;
begin
  Strings := TScriptLocalizerWrapper(ExtObject).Localizer.GetStrings;

  Info.ResultAsVariant := CreateResultScriptObject(Info, Strings);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitLocalizationClassesTLocalizerMethodsSaveEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptLocalizerWrapper(ExtObject).Localizer.SaveToStrings;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitLocClassesTLocalizerMethodsGetAddMissingTranslationsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TScriptLocalizerWrapper(ExtObject).Localizer.GetAutoAddMissing;
end;

procedure TDataModuleScriptClasses.dwsUnitLocClassesTLocalizerMethodsSetAddMissingTranslationsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptLocalizerWrapper(ExtObject).Localizer.SetAutoAddMissing(Info.ParamAsBoolean[0]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitLocalizationClassesTLocalizerMethodsGetUTF8EncodeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TScriptLocalizerWrapper(ExtObject).Localizer.GetUTF8Encode;
end;

procedure TDataModuleScriptClasses.dwsUnitLocalizationClassesTLocalizerMethodsSetUTF8EncodeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptLocalizerWrapper(ExtObject).Localizer.SetUTF8Encode(Info.ParamAsBoolean[0]);
end;

// -----------------------------------------------------------------------------
//
// Script: TPersistent
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptClasses.dwsUnitClassesClassesTPersistentMethodsAssignEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (Info.Params[0].ScriptObj <> nil) then
    TPersistent(ExtObject).Assign(TPersistent(Info.ParamAsObject[0]))
  else
    TPersistent(ExtObject).Assign(nil);
end;

type
  TPersistentCracker = class(TPersistent);

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTPersistentMethodsAssignToEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (Info.Params[0].ScriptObj = nil) then
    raise Exception.Create('TPersistent.AssignTo(nil) not allowed (duh!)');
  TPersistentCracker(ExtObject).AssignTo(TPersistent(Info.ParamAsObject[0]));
end;

// -----------------------------------------------------------------------------
//
// Script: TCollection
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptClasses.dwsUnitClassesClassesTCollectionMethodsAddEval(Info: TProgramInfo; ExtObject: TObject);
var
  Item: TCollectionItem;
begin
  Item := TCollection(ExtObject).Add;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Item);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTCollectionMethodsClearEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TCollection(ExtObject).Clear;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTCollectionMethodsDeleteEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TCollection(ExtObject).Delete(Info.ParamAsInteger[0]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTCollectionMethodsGetCountEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TCollection(ExtObject).Count;
end;

// -----------------------------------------------------------------------------
//
// Script: TComponent
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptClasses.dwsUnitClassesClassesTComponentMethodsFindComponentEval(Info: TProgramInfo; ExtObject: TObject);
var
  Item: TComponent;
  Wrapper: TScriptObjectWrapperBase;
begin
  Item := TScriptObjectWrapperBase(ExtObject).Item as TComponent;

  Item := Item.FindComponent(Info.ParamAsString[0]);

  if (Item <> nil) then
  begin
    Wrapper := Environment(Info).FindWrapper(Item);
    if (Wrapper = nil) then
      Wrapper := TScriptComponentWrapper.Create(Info, Item);
    Info.ResultAsVariant := Wrapper.ScriptObj;
  end else
    Info.ResultAsVariant := IUnknown(nil);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTComponentMethodsGetComponentCountEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TScriptComponentWrapper(ExtObject).Item.ComponentCount;
end;

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTComponentMethodsGetComponentEval(Info: TProgramInfo; ExtObject: TObject);
var
  Item: TComponent;
  Wrapper: TScriptObjectWrapperBase;
begin
  Item := TScriptComponentWrapper(ExtObject).Item.Components[Info.ParamAsInteger[0]];

  if (Item <> nil) then
  begin
    Wrapper := Environment(Info).FindWrapper(Item);
    if (Wrapper = nil) then
      Wrapper := TScriptComponentWrapper.Create(Info, Item);
    Info.ResultAsVariant := Wrapper.ScriptObj;
  end else
    Info.ResultAsVariant := IUnknown(nil);
end;

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTComponentMethodsGetComponentIndexEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TScriptComponentWrapper(ExtObject).Item.ComponentIndex;
end;

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTComponentMethodsSetComponentIndexEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptComponentWrapper(ExtObject).Item.ComponentIndex := Info.Params[0].ValueAsInteger;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTComponentMethodsGetNameEval(Info: TProgramInfo; ExtObject: TObject);
var
  Item: TComponent;
begin
  Item := TScriptObjectWrapperBase(ExtObject).Item as TComponent;
  Info.ResultAsString := Item.Name;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTComponentMethodsGetOwnerEval(Info: TProgramInfo; ExtObject: TObject);
var
  Item: TComponent;
  Wrapper: TScriptObjectWrapperBase;
begin
  Item := TScriptObjectWrapperBase(ExtObject).Item as TComponent;

  if (Item.Owner <> nil) then
  begin
    Wrapper := Environment(Info).FindWrapper(Item.Owner);
    if (Wrapper = nil) then
      Wrapper := TScriptComponentWrapper.Create(Info, Item.Owner);
    Info.ResultAsVariant := Wrapper.ScriptObj;
  end else
    Info.ResultAsVariant := IUnknown(nil);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTComponentMethodsGetTagEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TScriptComponentWrapper(ExtObject).Item.Tag;
end;

procedure TDataModuleScriptClasses.dwsUnitClassesClassesTComponentMethodsSetTagEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptComponentWrapper(ExtObject).Item.Tag := Info.Params[0].ValueAsInteger;
end;

// -----------------------------------------------------------------------------

initialization
  TDataModuleScriptClasses.RegisterModule;
finalization
end.



