unit ScriptModuleUserInterfaceImageList;

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
  ActnList,

  dwsComp,
  dwsExprs,
  dwsCompiler,
  dwsClassesLibModule,

  ScriptModule;

// -----------------------------------------------------------------------------
//
// TDataModuleScriptUserInterfaceImageList
//
// -----------------------------------------------------------------------------
// Wraps TImageList
// -----------------------------------------------------------------------------
type
  TDataModule = class(TScriptModule);

type
  TDataModuleScriptUserInterfaceImageList = class(TDataModule)
    dwsUnitImageList: TdwsUnit;
    procedure dwsUnitImageListClassesTImageListConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitImageListClassesTImageListCleanUp(ExternalObject: TObject);
    procedure dwsUnitImageListClassesTImageListMethodsLoadFromFileEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitImageListClassesTImageListMethodsGetHeightEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitImageListClassesTImageListMethodsSetHeightEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitImageListClassesTImageListMethodsGetWidthEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitImageListClassesTImageListMethodsSetWidthEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitImageListClassesTImageListMethodsGetCountEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitImageListClassesTImageListMethodsClearEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitImageListClassesTImageListMethodsGetImageEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitImageListClassesTImageListMethodsAddEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitImageListClassesTImageListMethodsInsertEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitImageListClassesTImageListMethodsReplaceEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitImageListClassesTImageListMethodsLoadFromStreamEval(Info: TProgramInfo; ExtObject: TObject);
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
  ImgList,
  Graphics,

  cxGraphics,

  dwsInfo,
  dwsFileSystem,

  amEnvironment,

  ScriptAPI;

procedure TDataModuleScriptUserInterfaceImageList.Initialize(ADelphiWebScript: TDelphiWebScript);
begin
  inherited;
(*
  ScriptService.RegisterClassTypeMapping(TcxImageList, 'TImageList');
*)
end;

// -----------------------------------------------------------------------------
//
// Script: TImageList
//
// -----------------------------------------------------------------------------
type
  TScriptImageList = class(TcxImageList);

procedure EnsureWritableImageList(ImageList: TObject);
begin
  ASSERT(ImageList is TCustomImageList);
  if (not(ImageList is TScriptImageList)) then
    raise EScript.Create('System imagelist is read-only');
end;

procedure TDataModuleScriptUserInterfaceImageList.dwsUnitImageListClassesTImageListCleanUp(ExternalObject: TObject);
begin
  if (ExternalObject is TScriptImageList) then
    ExternalObject.Free;
end;

procedure TDataModuleScriptUserInterfaceImageList.dwsUnitImageListClassesTImageListConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  // Owner parameter ignored for now
  if (ExtObject = nil) then
    ExtObject := TScriptImageList.Create(Self);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceImageList.dwsUnitImageListClassesTImageListMethodsLoadFromFileEval(Info: TProgramInfo; ExtObject: TObject);
var
  Filename: string;
  FileSystem: IdwsFileSystem;
  Stream: TStream;
  Bitmap: TBitmap;
begin
  EnsureWritableImageList(ExtObject);

  Filename := Info.ParamAsString[0];
  FileSystem := Info.Execution.FileSystem;

  if (FileSystem <> nil) and (FileSystem.FileExists(Filename)) then
    Stream := FileSystem.OpenFileStream(Filename, fomReadOnly)
  else
  begin
    Filename := ExpandEnvironmentVariable(Filename);
    Stream := TFileStream.Create(Filename, fmOpenRead);
  end;
  try
    Bitmap := TBitmap.Create;
    try
      Bitmap.LoadFromStream(Stream);
      TScriptImageList(ExtObject).Clear;
      TScriptImageList(ExtObject).Add(Bitmap, nil);
    finally
      Bitmap.Free;
    end;
  finally
    Stream.Free;
  end;
end;

procedure TDataModuleScriptUserInterfaceImageList.dwsUnitImageListClassesTImageListMethodsLoadFromStreamEval(Info: TProgramInfo; ExtObject: TObject);
var
  Stream: TStream;
  Bitmap: TBitmap;
begin
  EnsureWritableImageList(ExtObject);

  Stream := Info.ParamAsObject[0] as TStream;
  Bitmap := TBitmap.Create;
  try
    Bitmap.LoadFromStream(Stream);
    TScriptImageList(ExtObject).Clear;
    TScriptImageList(ExtObject).Add(Bitmap, nil);
  finally
    Bitmap.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceImageList.dwsUnitImageListClassesTImageListMethodsAddEval(Info: TProgramInfo; ExtObject: TObject);
var
  Bitmap: TBitmap;
begin
  EnsureWritableImageList(ExtObject);

  Bitmap := Info.ParamAsObject[0] as TBitmap;
  Info.ResultAsInteger := TScriptImageList(ExtObject).Add(Bitmap, nil);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceImageList.dwsUnitImageListClassesTImageListMethodsInsertEval(Info: TProgramInfo; ExtObject: TObject);
var
  Bitmap: TBitmap;
begin
  EnsureWritableImageList(ExtObject);

  Bitmap := Info.ParamAsObject[1] as TBitmap;
  TScriptImageList(ExtObject).Insert(Info.ParamAsInteger[0], Bitmap, nil);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceImageList.dwsUnitImageListClassesTImageListMethodsReplaceEval(Info: TProgramInfo; ExtObject: TObject);
var
  Bitmap: TBitmap;
begin
  EnsureWritableImageList(ExtObject);

  Bitmap := Info.ParamAsObject[1] as TBitmap;
  TScriptImageList(ExtObject).Replace(Info.ParamAsInteger[0], Bitmap, nil);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceImageList.dwsUnitImageListClassesTImageListMethodsClearEval(Info: TProgramInfo; ExtObject: TObject);
begin
  EnsureWritableImageList(ExtObject);

  TScriptImageList(ExtObject).Clear;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceImageList.dwsUnitImageListClassesTImageListMethodsGetCountEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TScriptImageList(ExtObject).Count;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceImageList.dwsUnitImageListClassesTImageListMethodsGetHeightEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TScriptImageList(ExtObject).Height;
end;

procedure TDataModuleScriptUserInterfaceImageList.dwsUnitImageListClassesTImageListMethodsSetHeightEval(Info: TProgramInfo; ExtObject: TObject);
begin
  EnsureWritableImageList(ExtObject);

  TScriptImageList(ExtObject).Height := Info.ParamAsInteger[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceImageList.dwsUnitImageListClassesTImageListMethodsGetImageEval(Info: TProgramInfo; ExtObject: TObject);
var
  Bitmap: TBitmap;
begin
  Bitmap := Info.ParamAsObject[1] as TBitmap;
  TScriptImageList(ExtObject).GetImage(Info.ParamAsInteger[0], Bitmap);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceImageList.dwsUnitImageListClassesTImageListMethodsGetWidthEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TScriptImageList(ExtObject).Width;
end;

procedure TDataModuleScriptUserInterfaceImageList.dwsUnitImageListClassesTImageListMethodsSetWidthEval(Info: TProgramInfo; ExtObject: TObject);
begin
  EnsureWritableImageList(ExtObject);

  TScriptImageList(ExtObject).Width := Info.ParamAsInteger[0];
end;

// -----------------------------------------------------------------------------

initialization
  TDataModuleScriptUserInterfaceImageList.RegisterModule;
end.

