unit amScript.IDE.Data;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls,
  cxImageList, cxGraphics, dxSkinsCore, dxCore, cxClasses, cxLookAndFeels, dxSkinsForm;

type
  TDataModuleDebuggerViewData = class(TDataModule)
    ImageListSymbols: TcxImageList;
    ImagesLarge: TcxImageList;
    SmallImages: TcxImageList;
    ImageListMessage: TcxImageList;
    SkinController: TdxSkinController;
    LookAndFeelController: TcxLookAndFeelController;
  private
    class destructor Destroy;
  public
  end;

function DataModuleDebuggerViewData: TDataModuleDebuggerViewData;

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

resourcestring
  RStrFileAlreadyExistsOverwrite = 'File "%s" already exists.'#13#13'Overwrite it?';
  RStrFileHasChanged = 'File "%s" has changed.'#13#13'Save it now?';

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  dxSkinTheBezier;

var
  FDebuggerViewData: TDataModuleDebuggerViewData;

function DataModuleDebuggerViewData: TDataModuleDebuggerViewData;
begin
  if (FDebuggerViewData = nil) then
    FDebuggerViewData := TDataModuleDebuggerViewData.Create(nil);
  Result := FDebuggerViewData;
end;

{ TDataModuleDebuggerData }

class destructor TDataModuleDebuggerViewData.Destroy;
begin
  FreeAndNil(FDebuggerViewData);
end;

end.
