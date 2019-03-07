unit amScriptModuleGraphics;

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

  dwsComp,
  dwsExprs,
  dwsCompiler,
  dwsClassesLibModule,

  amScriptModule;

// -----------------------------------------------------------------------------
//
// TDataModuleScriptGraphics
//
// -----------------------------------------------------------------------------
type
  TDataModule = class(TScriptModule);

type
  TDataModuleScriptGraphics = class(TDataModule)
    dwsUnitGraphics: TdwsUnit;
    procedure dwsUnitGraphicsClassesTGraphicMethodsGetEmptyEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTGraphicMethodsGetHeightEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTGraphicMethodsSetHeightEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTGraphicMethodsGetWidthEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTGraphicMethodsSetWidthEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTGraphicMethodsGetSupportsAlphaEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTGraphicMethodsLoadFromStreamEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTGraphicMethodsSaveToStreamEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTGraphicMethodsSetSizeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTGraphicMethodsClearEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTBitmapConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTBitmapCleanUp(ExternalObject: TObject);
    procedure dwsUnitGraphicsClassesTJPEGImageConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTJPEGImageCleanUp(ExternalObject: TObject);
    procedure dwsUnitGraphicsClassesTPNGImageConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTPNGImageCleanUp(ExternalObject: TObject);
    procedure dwsUnitGraphicsClassesTGIFImageConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTGIFImageCleanUp(ExternalObject: TObject);
    procedure dwsUnitGraphicsClassesTFontConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTFontMethodsGetNameEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTFontMethodsSetNameEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTFontMethodsGetSizeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTFontMethodsSetSizeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTFontMethodsGetColorEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTFontMethodsSetColorEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTFontMethodsGetStyleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTFontMethodsSetStyleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTGraphicMethodsLoadFromFileEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTGraphicMethodsSaveToFileEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTGraphicMethodsCreateFromStreamEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTGraphicMethodsCreateFromFileEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTGraphicCleanUp(ExternalObject: TObject);
    procedure dwsUnitGraphicsClassesTBitmapMethodsGetPixelFormatEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTBitmapMethodsSetPixelFormatEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTBitmapMethodsGetAlphaFormatEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTBitmapMethodsSetAlphaFormatEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTBitmapMethodsGetCanvasEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTCustomCanvasMethodsGetPixelEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitGraphicsClassesTCustomCanvasMethodsSetPixelEval(Info: TProgramInfo; ExtObject: TObject);
  private
  protected
    // IScriptModule
    procedure Initialize(ADelphiWebScript: TDelphiWebScript); override;
  public
  end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

implementation

{$R *.dfm}


uses
  Variants,
  TypInfo,
  Graphics,
  // File formats
  jpeg,
  pngimage,
  GIFImg,

  dxGDIPlusClasses,

  dwsSymbols,
  dwsFileSystem,

  amScriptAPI;

// -----------------------------------------------------------------------------
//
// TDataModuleScriptGraphics
//
// -----------------------------------------------------------------------------
type
  TScriptSmartImage = class(TdxSmartImage);

type
  TGraphicCracker = class(TGraphic);

procedure TDataModuleScriptGraphics.Initialize(ADelphiWebScript: TDelphiWebScript);
begin
  inherited;

  ScriptService.RegisterClassTypeMapping(TBitmap);
  ScriptService.RegisterClassTypeMapping(TJPEGImage);
  ScriptService.RegisterClassTypeMapping(TPngImage);
  ScriptService.RegisterClassTypeMapping(TGIFImage);

  ScriptService.RegisterClassTypeMapping(TdxSmartImage);
end;

// -----------------------------------------------------------------------------
// TGraphic
// -----------------------------------------------------------------------------
procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTGraphicCleanUp(ExternalObject: TObject);
begin
  if (ExternalObject is TScriptSmartImage) then
    ExternalObject.Free;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTGraphicMethodsClearEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TGraphic(ExtObject).Assign(nil);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTGraphicMethodsCreateFromFileEval(Info: TProgramInfo; ExtObject: TObject);
var
  Stream: TStream;
  FileSystem: IdwsFileSystem;
  SmartImage: TScriptSmartImage;
begin
  FileSystem := Info.Execution.FileSystem;
  Stream := FileSystem.OpenFileStream(Info.Params[0].ValueAsString, fomReadOnly);
  try
    SmartImage := TScriptSmartImage.Create;
    try
      SmartImage.LoadFromStream(Stream);

      Info.ResultAsVariant := CreateResultScriptObject(Info, SmartImage);
    except
      SmartImage.Free;
      raise;
    end
  finally
    Stream.Free;
  end;
end;

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTGraphicMethodsCreateFromStreamEval(Info: TProgramInfo; ExtObject: TObject);
var
  SmartImage: TScriptSmartImage;
begin
  if (Info.Params[0].ExternalObject = nil) then
    raise EScript.Create('Invalid stream object');

  SmartImage := TScriptSmartImage.Create;
  try
    SmartImage.LoadFromStream(Info.Params[0].ExternalObject as TStream);

    Info.ResultAsVariant := CreateResultScriptObject(Info, SmartImage);
  except
    SmartImage.Free;
    raise;
  end
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTGraphicMethodsGetEmptyEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TGraphic(ExtObject).Empty;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTGraphicMethodsGetSupportsAlphaEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TGraphic(ExtObject).SupportsPartialTransparency;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTGraphicMethodsGetHeightEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TGraphic(ExtObject).Height;
end;

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTGraphicMethodsSetHeightEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TGraphic(ExtObject).Height := Info.Params[0].ValueAsInteger
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTGraphicMethodsSetSizeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TGraphic(ExtObject).SetSize(Info.Params[0].ValueAsInteger, Info.Params[1].ValueAsInteger);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTGraphicMethodsGetWidthEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TGraphic(ExtObject).Width;
end;

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTGraphicMethodsSetWidthEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TGraphic(ExtObject).Width := Info.Params[0].ValueAsInteger
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTGraphicMethodsLoadFromStreamEval(Info: TProgramInfo; ExtObject: TObject);
var
  SmartImage: TdxSmartImage;
begin
  if (Info.Params[0].ExternalObject = nil) then
    raise EScript.Create('Invalid stream object');

  if (Info.ParamAsBoolean[1]) then
  begin
    SmartImage := TdxSmartImage.Create;
    try
      SmartImage.LoadFromStream(Info.Params[0].ExternalObject as TStream);

      TGraphic(ExtObject).Assign(SmartImage);
    finally
      SmartImage.Free;
    end
  end else
    TGraphic(ExtObject).LoadFromStream(Info.Params[0].ExternalObject as TStream);
end;

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTGraphicMethodsSaveToStreamEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (Info.Params[0].ExternalObject = nil) then
    raise EScript.Create('Invalid stream object');
  TGraphic(ExtObject).SaveToStream(Info.Params[0].ExternalObject as TStream);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTGraphicMethodsLoadFromFileEval(Info: TProgramInfo; ExtObject: TObject);
// TGraphic.LoadFromFile(const Filename: string)
var
  Stream: TStream;
  FileSystem: IdwsFileSystem;
  SmartImage: TdxSmartImage;
begin
  FileSystem := Info.Execution.FileSystem;
  Stream := FileSystem.OpenFileStream(Info.Params[0].ValueAsString, fomReadOnly);
  try
    if (Info.ParamAsBoolean[1]) then
    begin
      SmartImage := TdxSmartImage.Create;
      try
        SmartImage.LoadFromStream(Stream);

        TGraphic(ExtObject).Assign(SmartImage);
      finally
        SmartImage.Free;
      end
    end else
      TGraphic(ExtObject).LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTGraphicMethodsSaveToFileEval(Info: TProgramInfo; ExtObject: TObject);
// TGraphic.SaveToFile(const Filename: string)
var
  Stream : TStream;
  FileSystem : IdwsFileSystem;
begin
  FileSystem := Info.Execution.FileSystem;
  Stream := FileSystem.OpenFileStream(Info.Params[0].ValueAsString, fomCreate);
  try
    TGraphic(ExtObject).SaveToStream(Stream);
  finally
    Stream.Free;
  end;
end;

// -----------------------------------------------------------------------------
// TCustomCanvas
// -----------------------------------------------------------------------------
procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTCustomCanvasMethodsGetPixelEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TCustomCanvas(ExtObject).Pixels[Info.ParamAsInteger[0], Info.ParamAsInteger[1]];
end;

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTCustomCanvasMethodsSetPixelEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TCustomCanvas(ExtObject).Pixels[Info.ParamAsInteger[0], Info.ParamAsInteger[1]] := Info.ParamAsInteger[2];
end;

// -----------------------------------------------------------------------------
// TBitmap
// -----------------------------------------------------------------------------
type
  TScriptBitmap = class(TBitmap);

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTBitmapConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  if (ExtObject = nil) then
    ExtObject := TScriptBitmap.Create;
end;

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTBitmapCleanUp(ExternalObject: TObject);
begin
  if (ExternalObject is TScriptBitmap) then
    ExternalObject.Free;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTBitmapMethodsGetAlphaFormatEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TBitmap(ExtObject).AlphaFormat);
end;

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTBitmapMethodsSetAlphaFormatEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TBitmap(ExtObject).AlphaFormat := TAlphaFormat(Info.ParamAsInteger[0]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTBitmapMethodsGetPixelFormatEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TBitmap(ExtObject).PixelFormat);
end;

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTBitmapMethodsSetPixelFormatEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TBitmap(ExtObject).PixelFormat := TPixelFormat(Info.ParamAsInteger[0]);
end;

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTBitmapMethodsGetCanvasEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TBitmap(ExtObject).Canvas);
end;

// -----------------------------------------------------------------------------
// TJPEGImage
// -----------------------------------------------------------------------------
type
  TScriptJPEGImage = class(TJPEGImage);

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTJPEGImageConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  if (ExtObject = nil) then
    ExtObject := TScriptJPEGImage.Create;
end;

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTJPEGImageCleanUp(ExternalObject: TObject);
begin
  if (ExternalObject is TScriptJPEGImage) then
    ExternalObject.Free;
end;

// -----------------------------------------------------------------------------
// TPNGImage
// -----------------------------------------------------------------------------
type
  TScriptPngImage = class(TPngImage)
  public
    procedure Assign(Source: TPersistent); override;
  end;

procedure TScriptPngImage.Assign(Source: TPersistent);
var
  Row, Col: integer;
  Dst: PByte;
  Src: PByte;
begin
  if (Source is TBitmap) and (TBitmap(Source).PixelFormat = pf32bit) and (TBitmap(Source).AlphaFormat <> afIgnored) then
  begin
    inherited Assign(Source);

    CreateAlpha;
    // Copy alpha
    for Row := 0 to Height-1 do
    begin
      Dst := PByte(AlphaScanline[Row]);
      Src := PByte(TBitmap(Source).ScanLine[Row])+3;
      for Col := 0 to Width-1 do
      begin
        Dst^ := Src^;
        inc(Dst);
        inc(Src, 4);
      end;
    end;
  end else
    inherited Assign(Source);
end;

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTPNGImageConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  if (ExtObject = nil) then
    ExtObject := TScriptPngImage.Create;
end;

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTPNGImageCleanUp(ExternalObject: TObject);
begin
  if (ExternalObject is TScriptPngImage) then
    ExternalObject.Free;
end;

// -----------------------------------------------------------------------------
// TGIFImage
// -----------------------------------------------------------------------------
type
  TScriptGIFImage = class(TGIFImage);

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTGIFImageConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  if (ExtObject = nil) then
    ExtObject := TScriptGIFImage.Create;
end;

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTGIFImageCleanUp(ExternalObject: TObject);
begin
  if (ExternalObject is TScriptGIFImage) then
    ExternalObject.Free;
end;

// -----------------------------------------------------------------------------
// TFont
// -----------------------------------------------------------------------------
procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTFontConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ASSERT(ExtObject is TFont);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTFontMethodsGetColorEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TFont(ExtObject).Color;
end;

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTFontMethodsSetColorEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TFont(ExtObject).Color := Info.Params[0].ValueAsInteger;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTFontMethodsGetNameEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TFont(ExtObject).Name;
end;

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTFontMethodsSetNameEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TFont(ExtObject).Name := Info.Params[0].ValueAsString;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTFontMethodsGetSizeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TFont(ExtObject).Size;
end;

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTFontMethodsSetSizeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TFont(ExtObject).Size := Info.Params[0].ValueAsInteger;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTFontMethodsGetStyleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Byte(TFont(ExtObject).Style);
end;

procedure TDataModuleScriptGraphics.dwsUnitGraphicsClassesTFontMethodsSetStyleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TFont(ExtObject).Style := TFontStyles(Byte(Info.Params[0].ValueAsInteger));
end;

// -----------------------------------------------------------------------------

initialization
  TDataModuleScriptGraphics.RegisterModule;
end.

