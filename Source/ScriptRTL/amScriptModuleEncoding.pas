unit amScriptModuleEncoding;

(*
 * Copyright © 2014 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  SysUtils, Classes,
  Controls,
  Generics.Collections,

  dwsComp,
  dwsExprs,
  dwsCompiler,
  dwsClassesLibModule,
  dwsEncodingLibModule,

  amScriptModule;

// -----------------------------------------------------------------------------
//
// TDataModuleScriptEncoding
//
// -----------------------------------------------------------------------------
// Contains:
//
// - Encoder class which performs conversion of text transfer encodings - a bit like the .NET Convert class.
//   Unit name "System.Encoding" - should probably be "System.Encoder".
//   Implemented by the TdwsEncodingLib module.
//
// - TEncoding class which has methods for dealing with character encoding. Like the .NET Encoding class and the VCL TEncoding class.
//   Unit name "System.Text" - should probably be "System.Text.Encoding".
//   Not yet fully implemented.
// -----------------------------------------------------------------------------
type
  TDataModule = class(TScriptModule);

  TDataModuleScriptEncoding = class(TDataModule)
    dwsUnitEncoding: TdwsUnit;
    procedure DataModuleCreate(Sender: TObject);
    procedure dwsUnitEncodingClassesTEncodingMethodsGetUTF7Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitEncodingClassesTEncodingMethodsGetUTF8Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitEncodingClassesTEncodingMethodsGetASCIIEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitEncodingClassesTEncodingMethodsGetBigEndianUnicodeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitEncodingClassesTEncodingMethodsGetUnicodeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitEncodingClassesTEncodingMethodsGetDefaultEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitEncodingClassesTEncodingMethodsGetCodePageEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitEncodingClassesTEncodingMethodsGetEncodingNameEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitEncodingClassesTEncodingMethodsGetIsSingleByteEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitEncodingClassesTEncodingCleanUp(ExternalObject: TObject);
    procedure dwsUnitEncodingClassesTEncodingMethodsGetEncoding0Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitEncodingClassesTEncodingMethodsGetEncoding1Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitEncodingClassesTEncodingMethodsCloneEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitEncodingClassesTEncodingMethodsIsStandardEncodingEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitEncodingClassesTMBCSEncodingConstructorsCreate0Eval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitEncodingClassesTMBCSEncodingConstructorsCreate1Eval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitEncodingClassesTEncodingMethodsGetPreambleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitEncodingClassesTUTF7EncodingConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitEncodingClassesTUTF8EncodingConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitEncodingClassesTUnicodeEncodingConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitEncodingClassesTBigEndianUnicodeEncodingConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitEncodingClassesTUTF8EncodingMethodsGetEmitBOMEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitEncodingClassesTUTF8EncodingConstructorsCreate_Eval(Info: TProgramInfo; var ExtObject: TObject);
  private
    FLibrary: TdwsEncodingLib;
  protected
    // ISigmaScriptModule
    procedure Initialize(DelphiWebScript: TDelphiWebScript); override;
    procedure Finalize; override;
  public
  end;

implementation

{$R *.dfm}

uses
  amScriptAPI;

const
  CP_UTF7 = 65000;
  CP_UTF8 = 65001;

type
  TUTF8EncodingWithOptionalBOM = class(TUTF8Encoding)
  private
    FEmitBOM: boolean;
  public
    constructor Create(AEmitBOM: boolean = False);

    function GetPreamble: TBytes; override;
    function Clone: TEncoding; override;

    property EmitBOM: boolean read FEmitBOM;
  end;

constructor TUTF8EncodingWithOptionalBOM.Create(AEmitBOM: boolean);
begin
  inherited Create;
  FEmitBOM := AEmitBOM;
end;

function TUTF8EncodingWithOptionalBOM.Clone: TEncoding;
begin
  Result := TUTF8EncodingWithOptionalBOM.Create(FEmitBOM);
end;

function TUTF8EncodingWithOptionalBOM.GetPreamble: TBytes;
begin
  if (FEmitBOM) then
    Result := inherited GetPreamble
  else
    Result :=nil;
end;

// -----------------------------------------------------------------------------
//
// TDataModuleScriptEncoding
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptEncoding.DataModuleCreate(Sender: TObject);
begin
  FLibrary := TdwsEncodingLib.Create(Self);
  FLibrary.dwsEncoding.UnitName := 'System.Encoding';
  FLibrary.dwsEncoding.StaticSymbols := False;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptEncoding.Initialize(DelphiWebScript: TDelphiWebScript);
begin
  inherited;
  FLibrary.dwsEncoding.Script := DelphiWebScript;

  ScriptService.RegisterClassTypeMapping(TUTF7Encoding);
  ScriptService.RegisterClassTypeMapping(TUTF8Encoding);
  ScriptService.RegisterClassTypeMapping(TUnicodeEncoding);
  ScriptService.RegisterClassTypeMapping(TBigEndianUnicodeEncoding);
  ScriptService.RegisterClassTypeMapping(TMBCSEncoding);
end;

procedure TDataModuleScriptEncoding.Finalize;
begin
  inherited;
  FLibrary.dwsEncoding.Script := nil;
end;

// -----------------------------------------------------------------------------
//
// TEncoding
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptEncoding.dwsUnitEncodingClassesTEncodingCleanUp(ExternalObject: TObject);
begin
  if (not TEncoding.IsStandardEncoding(TEncoding(ExternalObject))) then
    ExternalObject.Free;
end;

procedure TDataModuleScriptEncoding.dwsUnitEncodingClassesTEncodingMethodsCloneEval(Info: TProgramInfo; ExtObject: TObject);
var
  Encoding: TEncoding;
begin
  Encoding := TEncoding(ExtObject).Clone;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Encoding);
end;

procedure TDataModuleScriptEncoding.dwsUnitEncodingClassesTEncodingMethodsGetASCIIEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TEncoding.ASCII);
end;

procedure TDataModuleScriptEncoding.dwsUnitEncodingClassesTEncodingMethodsGetBigEndianUnicodeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TEncoding.BigEndianUnicode);
end;

procedure TDataModuleScriptEncoding.dwsUnitEncodingClassesTEncodingMethodsGetCodePageEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TEncoding(ExtObject).CodePage;
end;

procedure TDataModuleScriptEncoding.dwsUnitEncodingClassesTEncodingMethodsGetDefaultEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TEncoding.Default);
end;

procedure TDataModuleScriptEncoding.dwsUnitEncodingClassesTEncodingMethodsGetEncoding0Eval(Info: TProgramInfo; ExtObject: TObject);
var
  CodePage: integer;
  Encoding: TEncoding;
begin
  CodePage := Info.ParamAsInteger[0];
  // Adapted from TEncoding.GetEncoding(CodePage: Integer)
  case CodePage of
    1200: Encoding := TUnicodeEncoding.Create;
    1201: Encoding := TBigEndianUnicodeEncoding.Create;
    CP_UTF7: Encoding := TUTF7Encoding.Create;
    CP_UTF8: Encoding := TUTF8EncodingWithOptionalBOM.Create;
  else
    Encoding := TMBCSEncoding.Create(CodePage);
  end;

  Info.ResultAsVariant := CreateResultScriptObject(Info, Encoding);
end;

procedure TDataModuleScriptEncoding.dwsUnitEncodingClassesTEncodingMethodsGetEncoding1Eval(Info: TProgramInfo; ExtObject: TObject);
var
  Encoding: TEncoding;
  CodePage: integer;
begin
  Encoding := TEncoding.GetEncoding(Info.ParamAsString[0]);
  try
    CodePage := Encoding.CodePage;
  finally
    Encoding.Free;
  end;

  // Adapted from TEncoding.GetEncoding(CodePage: Integer)
  case CodePage of
    1200: Encoding := TUnicodeEncoding.Create;
    1201: Encoding := TBigEndianUnicodeEncoding.Create;
    CP_UTF7: Encoding := TUTF7Encoding.Create;
    CP_UTF8: Encoding := TUTF8EncodingWithOptionalBOM.Create;
  else
    Encoding := TMBCSEncoding.Create(CodePage);
  end;

  Info.ResultAsVariant := CreateResultScriptObject(Info, Encoding);
end;

procedure TDataModuleScriptEncoding.dwsUnitEncodingClassesTEncodingMethodsGetEncodingNameEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TEncoding(ExtObject).EncodingName;
end;

procedure TDataModuleScriptEncoding.dwsUnitEncodingClassesTEncodingMethodsGetIsSingleByteEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TEncoding(ExtObject).IsSingleByte;
end;

procedure TDataModuleScriptEncoding.dwsUnitEncodingClassesTEncodingMethodsGetPreambleEval(Info: TProgramInfo; ExtObject: TObject);
var
  Preamble: TBytes;
  Data: RawByteString;
  Len: integer;
begin
  Preamble := TEncoding(ExtObject).GetPreamble;
  Len := Length(Preamble);
  SetLength(Data, Len);
  if (Len > 0) then
    Move(Preamble[0], Data[1], Len);
  Info.ResultAsDataString := Data;
end;

procedure TDataModuleScriptEncoding.dwsUnitEncodingClassesTEncodingMethodsGetUnicodeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TEncoding.Unicode);
end;

procedure TDataModuleScriptEncoding.dwsUnitEncodingClassesTEncodingMethodsGetUTF7Eval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TEncoding.UTF7);
end;

procedure TDataModuleScriptEncoding.dwsUnitEncodingClassesTEncodingMethodsGetUTF8Eval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TEncoding.UTF8);
end;

procedure TDataModuleScriptEncoding.dwsUnitEncodingClassesTEncodingMethodsIsStandardEncodingEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TEncoding.IsStandardEncoding(TEncoding(ExtObject));
end;

// -----------------------------------------------------------------------------
//
// TMultiByteCharacterSetEncoding = TMBCSEncoding
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptEncoding.dwsUnitEncodingClassesTMBCSEncodingConstructorsCreate0Eval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TMBCSEncoding.Create;
end;

procedure TDataModuleScriptEncoding.dwsUnitEncodingClassesTMBCSEncodingConstructorsCreate1Eval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TMBCSEncoding.Create(Info.ParamAsInteger[0]);
end;


// -----------------------------------------------------------------------------
//
// TUnicodeEncoding
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptEncoding.dwsUnitEncodingClassesTUnicodeEncodingConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TUnicodeEncoding.Create;
end;


// -----------------------------------------------------------------------------
//
// TBigEndianUnicodeEncoding
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptEncoding.dwsUnitEncodingClassesTBigEndianUnicodeEncodingConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TBigEndianUnicodeEncoding.Create;
end;


// -----------------------------------------------------------------------------
//
// TUTF7Encoding
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptEncoding.dwsUnitEncodingClassesTUTF7EncodingConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TUTF7Encoding.Create;
end;


// -----------------------------------------------------------------------------
//
// TUTF8Encoding
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptEncoding.dwsUnitEncodingClassesTUTF8EncodingConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TUTF8EncodingWithOptionalBOM.Create(Info.ParamAsBoolean[0]);
end;


procedure TDataModuleScriptEncoding.dwsUnitEncodingClassesTUTF8EncodingConstructorsCreate_Eval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TUTF8EncodingWithOptionalBOM.Create;
end;

procedure TDataModuleScriptEncoding.dwsUnitEncodingClassesTUTF8EncodingMethodsGetEmitBOMEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := (ExtObject is TUTF8EncodingWithOptionalBOM) and (TUTF8EncodingWithOptionalBOM(ExtObject).EmitBOM);
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

initialization
  TDataModuleScriptEncoding.RegisterModule;
end.
