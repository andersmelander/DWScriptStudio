unit amScript.IDE.Data;

interface

uses
  System.SysUtils, System.Classes, System.ImageList,
  Vcl.ImgList, Vcl.Controls, Vcl.Graphics,
  cxImageList, cxGraphics, dxSmartImage,  dxSkinsCore, dxCore, cxClasses, cxLookAndFeels,
  dxSkinsForm, dxLayoutLookAndFeels;

type
  TImageKind = (ikButton, ikMessage);

  // TODO : Move to API unit
  IImageService = interface
    ['{5ADBDC30-51A4-4E62-AB71-949252436646}']
    procedure GetBitmap(Bitmap: TBitmap; Kind: TImageKind; ImageIndex: integer); overload;
    procedure GetBitmap(Bitmap: TdxCustomSmartImage; Kind: TImageKind; ImageIndex: integer); overload;
    function GetImages(Kind: TImageKind): TCustomImageList;
  end;

type
  TDataModuleDebuggerViewData = class(TDataModule, IImageService)
    ImageListSymbols: TcxImageList;
    ImagesLarge: TcxImageList;
    SmallImages: TcxImageList;
    ImageListMessage: TcxImageList;
    SkinController: TdxSkinController;
    LookAndFeelController: TcxLookAndFeelController;
    LayoutLookAndFeelList: TdxLayoutLookAndFeelList;
    LayoutLookAndFeel: TdxLayoutSkinLookAndFeel;
    LayoutLookAndFeelNoOffsetNoDisabled: TdxLayoutSkinLookAndFeel;
  private
    class destructor Destroy;
  private
    // IImageService
    procedure GetBitmap(Bitmap: TBitmap; Kind: TImageKind; ImageIndex: integer); overload;
    procedure GetBitmap(Bitmap: TdxCustomSmartImage; Kind: TImageKind; ImageIndex: integer); overload;
    function GetImages(Kind: TImageKind): TCustomImageList;
  public
  end;

function DataModuleDebuggerViewData: TDataModuleDebuggerViewData;
function ImageService: IImageService;


const
  // Debugger gutter
  ImageIndexExecutableLine = 13;
  ImageIndexForwardArrow = 16;
  ImageIndexCurrentLineBreakpoint = 15;
  ImageIndexBreakpoint = 12;
  ImageIndexBreakpointDisabled = 14;
  // File types
  ImageIndex_ProjectSourceFile = 28;
  ImageIndexFileTypeScriptNew = 7;
  ImageIndexFileTypeScript = 6;
  ImageIndexFileTypeScriptMain = 69;
  ImageIndexFileTypeFolder = 71;
  ImageIndexFileTypeInclude = 29;

  // Hint
  ImageIndexHintInfo = 0;
  ImageIndexHintWarning = 1;
  ImageIndexHintError = 2;
  ImageIndexHintDone = 3;
  ImageIndexHintDeny = 4;

resourcestring
  RStrFileAlreadyExistsOverwrite = 'File "%s" already exists.'#13#13'Overwrite it?';
  RStrFileHasChanged = 'File "%s" has changed.'#13#13'Save it now?';

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  dxSkinTheBezier,
  dxGDIPlusClasses;

var
  FDebuggerViewData: TDataModuleDebuggerViewData;

function DataModuleDebuggerViewData: TDataModuleDebuggerViewData;
begin
  if (FDebuggerViewData = nil) then
    FDebuggerViewData := TDataModuleDebuggerViewData.Create(nil);
  Result := FDebuggerViewData;
end;

function ImageService: IImageService;
begin
  Result := DataModuleDebuggerViewData as IImageService;
end;

{ TDataModuleDebuggerData }

class destructor TDataModuleDebuggerViewData.Destroy;
begin
  FreeAndNil(FDebuggerViewData);
end;

procedure TDataModuleDebuggerViewData.GetBitmap(Bitmap: TBitmap; Kind: TImageKind; ImageIndex: integer);
begin
  var ImageList := GetImages(Kind);
  ImageList.GetBitmap(ImageIndex, Bitmap);
end;

procedure TDataModuleDebuggerViewData.GetBitmap(Bitmap: TdxCustomSmartImage; Kind: TImageKind; ImageIndex: integer);
begin
  var ImageList := GetImages(Kind) as TcxImageList;
  ImageList.GetImage(ImageIndex, Bitmap as TdxSmartImage);
end;

function TDataModuleDebuggerViewData.GetImages(Kind: TImageKind): TCustomImageList;
begin
  case Kind of
    ikButton:
      Result := SmallImages;

    ikMessage:
      Result := ImageListMessage;
  end;
end;

end.
