unit amScriptModuleUserInterfaceLayout;

(*
 * Copyright © 2014 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Generics.Collections,
  SysUtils, Classes,

  dxLayoutContainer,
  dxLayoutLookAndFeels,

  dwsComp,
  dwsExprs,
  dwsCompiler,
  dwsSymbols,
  dwsClassesLibModule,

  amScriptModule;

// -----------------------------------------------------------------------------------------------------------------------------------------------------
// Class hierachy
// -----------------------------------------------------------------------------------------------------------------------------------------------------
// Script                                               Delphi
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// TLayout                                              TdxLayoutControl
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// TCustomLayoutItem                                    TdxCustomLayoutItem(TPersistent)
//   Caption:TCustomLayoutItemCaption                     CaptionOptions:TdxCustomLayoutItemCaptionOptions
//
//                                                      TdxCustomLayoutGroup(TdxCustomLayoutItem)
// TLayoutGroup(TCustomLayoutItem)                      TdxLayoutGroup(TdxCustomLayoutGroup)
//   Caption:TLayoutGroupCaption                          CaptionOptions:TdxLayoutGroupCaptionOptions
//
//                                                      TdxLayoutBasicItem(TdxCustomLayoutItem)
// TCustomLayoutLabeledItem(TCustomLayoutItem)          TdxCustomLayoutLabeledItem(TdxLayoutBasicItem)
//
// TLayoutControlItem(TCustomLayoutLabeledItem)         TdxLayoutItem(TdxLayoutControlItem(TdxCustomLayoutLabeledItem))
//   Caption:TLayoutItemCaption                           CaptionOptions:TdxLayoutItemCaptionOptions
//
// TLayoutLabelItem(TCustomLayoutLabeledItem)           TdxLayoutLabeledItem(TdxCustomLayoutLabeledItem)
//   Caption:TLayoutLabelItemCaption                      CaptionOptions:TdxLayoutLabeledItemCaptionOptions
//
// TLayoutSeparatorItem(TCustomLayoutLabeledItem)       TdxLayoutSeparatorItem(TdxCustomLayoutLabeledItem)
//                                                        CaptionOptions:TdxLayoutSeparatorItemCaptionOptions
//
//                                                      TdxLayoutNonLabeledItem(TdxLayoutBasicItem)
//
// TLayoutEmptySpaceItem(TCustomLayoutItem)             TdxLayoutEmptySpaceItem(TdxLayoutNonLabeledItem)
//                                                        CaptionOptions:TdxLayoutNonLabeledItemCaptionOptions
//
//                                                      TdxLayoutDirectionalItem(TdxLayoutNonLabeledItem)
// TLayoutSplitterItem(TCustomLayoutLabeledItem)        TdxLayoutSplitterItem(TdxLayoutDirectionalItem)
//                                                        CaptionOptions:TdxLayoutNonLabeledItemCaptionOptions
//
// TLayoutImageItem(TCustomLayoutLabeledItem)           TdxLayoutImageItem(TdxCustomLayoutLabeledItem)
//                                                        CaptionOptions:TdxLayoutItemCaptionOptions
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// TCustomLayoutItemCaption                             TdxCustomLayoutItemCaptionOptions(TdxCustomLayoutItemOptions)
// TLayoutLabeledItemCustomCaption(TCustomLayoutItemCaption) TdxLayoutLabeledItemCustomCaptionOptions(...TdxCustomLayoutItemCaptionOptions)
// TLayoutLabelItemCaption(TCustomLayoutItemCaption)    TdxLayoutLabeledItemCaptionOptions(TdxLayoutLabeledItemCustomCaptionOptions)
//
// TLayoutItemCaption(TCustomLayoutItemCaption)         TdxLayoutItemCaptionOptions(TdxLayoutLabeledItemCaptionOptions)
//
//                                                      TdxLayoutNonLabeledItemCaptionOptions(TdxCustomLayoutItemCaptionOptions)
//
// TLayoutGroupCaption(TCustomLayoutItemCaption)        TdxLayoutGroupCaptionOptions(...TdxCustomLayoutItemCaptionOptions)
//
//                                                      TdxLayoutSeparatorItemCaptionOptions(TdxLayoutLabeledItemCustomCaptionOptions)
// -----------------------------------------------------------------------------------------------------------------------------------------------------


// -----------------------------------------------------------------------------
//
// TScriptLayoutItemWrapper
//
// -----------------------------------------------------------------------------
type
  TScriptLayoutItemWrapper = class(TScriptObjectWrapper<TdxCustomLayoutItem>)
  private
    FCaptionObj: Variant;
  protected
    procedure FreeWrappedObject; override;
  public
    procedure DetachScriptObject; override;
    property CaptionObj: Variant read FCaptionObj write FCaptionObj;
  end;

// -----------------------------------------------------------------------------
//
// TDataModuleScriptUserInterfaceLayout
//
// -----------------------------------------------------------------------------
type
  TDataModule = class(TScriptModule);

  TDataModuleScriptUserInterfaceLayout = class(TDataModule)
    dwsUnitLayout: TdwsUnit;
    procedure dwsUnitLayoutClassesTLayoutConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutMethodsGetItemsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemMethodsGetAlignHorzEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemMethodsSetAlignHorzEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemMethodsGetAlignVertEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemMethodsSetAlignVertEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemMethodsGetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemMethodsSetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemMethodsGetParentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemMethodsSetParentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemMethodsGetVisibleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemMethodsSetVisibleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutItemMethodsGetControlEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutItemMethodsSetControlEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutItemCaptionMethodsGetTextEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutItemCaptionMethodsSetTextEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutItemCaptionMethodsGetVisibleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutItemCaptionMethodsSetVisibleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutGroupMethodsCreateGroupEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutGroupMethodsCreateItemEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutMethodsGetCustomizationEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutMethodsSetCustomizationEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemMethodsGetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutItemCaptionMethodsGetShowAccelCharEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutItemCaptionMethodsSetShowAccelCharEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutControlItemMethodsGetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsGetAlignVertEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsSetAlignVertEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsGetAlignHorzEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsSetAlignHorzEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutGroupMethodsGetExpandedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutGroupMethodsSetExpandedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutGroupMethodsGetHiddenEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutGroupMethodsSetHiddenEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutGroupMethodsGetLayoutDirectionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutGroupMethodsSetLayoutDirectionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutGroupMethodsGetShowBorderEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutGroupMethodsSetShowBorderEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutGroupMethodsGetIndentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutGroupMethodsSetIndentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutCleanUp(ExternalObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutGroupMethodsCreateEmptySpaceItemEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutGroupMethodsCreateLabelItemEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutGroupMethodsCreateSeparatorItemEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutGroupMethodsCreateSplitterItemEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemMethodsGetHeightEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemMethodsSetHeightEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemMethodsGetWidthEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemMethodsSetWidthEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutItemListMethodsGetCountEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutItemListMethodsGetItemEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutGroupMethodsGetItemsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutStyleConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutStyleCleanUp(ExternalObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutStyleMethodsGetItemOptionsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutStyleMethodsGetGroupOptionsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutStyleItemOptionsMethodsGetCaptionOptionsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutStyleCaptionOptionsMethodsGetTextColorEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutStyleCaptionOptionsMethodsSetTextColorEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutStyleCaptionOptionsMethodsGetUseDefaultFontEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutStyleCaptionOptionsMethodsSetUseDefaultFontEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutStyleCaptionOptionsMethodsGetFontEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutStyleCaptionOptionsMethodsSetFontEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutMethodsDefaultStyleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutMethodsGetStyleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutMethodsSetStyleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemMethodsGetStyleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemMethodsSetStyleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutItemCaptionMethodsSetPositionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutItemCaptionMethodsGetPositionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemMethodsGetOffsetsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemMethodsGetPaddingEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutOffsetsMethodsGetValueEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutOffsetsMethodsSetValueEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutStyleOffsetsMethodsGetValueEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutStyleOffsetsMethodsSetValueEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutStyleMethodsGetOffsetsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutMethodsClearEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutMethodsBeginUpdateEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutMethodsEndUpdateEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsGetGlyphEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsGetVisibleElementsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsSetVisibleElementsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemMethodsBeginUpdateEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemMethodsEndUpdateEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutStyleGroupOptionsMethodsGetColorEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutStyleGroupOptionsMethodsSetColorEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutStyleGroupOptionsMethodsGetSpaceBetweenButtonsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutStyleGroupOptionsMethodsSetSpaceBetweenButtonsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutStyleGroupOptionsMethodsGetCaptionOptionsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutGroupMethodsGetScrollOptionsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutGroupScrollOptionsMethodsGetHorizontalEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutGroupScrollOptionsMethodsSetHorizontalEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutGroupScrollOptionsMethodsGetVerticalEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutGroupScrollOptionsMethodsSetVerticalEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutGroupMethodsGetAllowWrapItemsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutGroupMethodsSetAllowWrapItemsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutLabelItemMethodsGetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemMethodsMakeVisibleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutLabeledItemCustomCaptionMethodsGetWordWrapEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutLabeledItemCustomCaptionMethodsSetWordWrapEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutLabeledItemCustomCaptionMethodsGetCursorEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutLabeledItemCustomCaptionMethodsSetCursorEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutLabeledItemCustomCaptionMethodsGetWidthEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutLabeledItemCustomCaptionMethodsSetWidthEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutGroupMethodsGetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutImageItemMethodsGetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTLayoutImageItemMethodsGetImageEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsSetGlyphEval(Info: TProgramInfo; ExtObject: TObject);
  private
    FLayoutLookAndFeel: TdxCustomLayoutLookAndFeel;
    function GetLayoutLookAndFeel: TdxCustomLayoutLookAndFeel;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    // IScriptModule
    procedure Initialize(ADelphiWebScript: TDelphiWebScript); override;
    procedure Finalize; override;

    property LayoutLookAndFeel: TdxCustomLayoutLookAndFeel read GetLayoutLookAndFeel;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function CreateLayoutWrapper(AProgramInfo: TProgramInfo; AItem: TdxCustomLayoutItem; OwnsItem: boolean = False): TScriptLayoutItemWrapper; overload;
  end;

implementation

{$R *.dfm}

uses
  Variants,
  Controls,
  Graphics,

  dxLayoutControl,
  dxLayoutCommon,

  amScriptAPI;

type
  TdxCustomLayoutItemCracker = class(TdxCustomLayoutItem);
  TdxCustomLayoutItemCaptionOptionsCracker = class(TdxCustomLayoutItemCaptionOptions);
  TdxLayoutLabeledItemCustomCaptionOptionsCracker = class(TdxLayoutLabeledItemCustomCaptionOptions);

// -----------------------------------------------------------------------------
//
// TScriptControlWrapper
//
// -----------------------------------------------------------------------------
procedure TScriptLayoutItemWrapper.DetachScriptObject;
begin
  FCaptionObj := Unassigned;
  inherited;
end;

// -----------------------------------------------------------------------------

procedure TScriptLayoutItemWrapper.FreeWrappedObject;
begin
  // Huh?
end;

// -----------------------------------------------------------------------------
//
// TDataModuleScriptUserInterfaceLayout
//
// -----------------------------------------------------------------------------

constructor TDataModuleScriptUserInterfaceLayout.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TDataModuleScriptUserInterfaceLayout.Destroy;
begin
  inherited;
end;

// -----------------------------------------------------------------------------

function TDataModuleScriptUserInterfaceLayout.CreateLayoutWrapper(AProgramInfo: TProgramInfo; AItem: TdxCustomLayoutItem; OwnsItem: boolean): TScriptLayoutItemWrapper;
begin
  Result := TScriptLayoutItemWrapper.Create(AProgramInfo, AItem, OwnsItem);

  AItem.FreeNotification(Self);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;

  if (Operation = opRemove) then
  begin
    if (AComponent = FLayoutLookAndFeel) then
      FLayoutLookAndFeel := nil;

    ScriptUnregisterWrappers(AComponent);
  end;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.Initialize(ADelphiWebScript: TDelphiWebScript);
begin
  inherited;

  ScriptService.RegisterClassTypeMapping(TdxLayoutControl, 'TLayout');
  ScriptService.RegisterClassTypeMapping(TdxLayoutGroup, 'TLayoutGroup');
  ScriptService.RegisterClassTypeMapping(TdxLayoutControlItem, 'TLayoutItem');
  ScriptService.RegisterClassTypeMapping(TdxLayoutLabeledItem, 'TLayoutLabelItem');
  ScriptService.RegisterClassTypeMapping(TdxLayoutSeparatorItem, 'TLayoutSeparatorItem');
  ScriptService.RegisterClassTypeMapping(TdxLayoutEmptySpaceItem, 'TLayoutEmptySpaceItem');
  ScriptService.RegisterClassTypeMapping(TdxLayoutSplitterItem, 'TLayoutSplitterItem');
  ScriptService.RegisterClassTypeMapping(TdxLayoutImageItem, 'TLayoutImageItem');
end;

procedure TDataModuleScriptUserInterfaceLayout.Finalize;
begin
  inherited;
end;

// -----------------------------------------------------------------------------

function TDataModuleScriptUserInterfaceLayout.GetLayoutLookAndFeel: TdxCustomLayoutLookAndFeel;
begin
  if (FLayoutLookAndFeel = nil) then
    FLayoutLookAndFeel := TdxLayoutSkinLookAndFeel.Create(Self);
  Result := FLayoutLookAndFeel;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutCleanUp(ExternalObject: TObject);
begin
  ExternalObject.Free;
end;

// -----------------------------------------------------------------------------
//
// Script: TLayout
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
//var
//  LayoutControl: TdxLayoutControl;
begin
  ExtObject := TScriptControlWrapper.CreateOwned(Info, Info.ScriptObj, TdxLayoutControl);
//  LayoutControl := TdxLayoutControl(TScriptControlWrapper(ExtObject).Control);

  TdxLayoutControl(TScriptControlWrapper(ExtObject).Item).LayoutLookAndFeel := LayoutLookAndFeel;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutMethodsGetItemsEval(Info: TProgramInfo; ExtObject: TObject);
var
  Group: TdxLayoutGroup;
  Wrapper: TScriptObjectWrapperBase;
begin
  Group := TdxLayoutControl(TScriptControlWrapper(ExtObject).Item).Items;

  Wrapper := Environment(Info).FindWrapper(Group);
  if (Wrapper = nil) then
    Wrapper := CreateLayoutWrapper(Info, Group);
  Info.ResultAsVariant := Wrapper.ScriptObj;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutMethodsGetCustomizationEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TdxLayoutControl(TScriptControlWrapper(ExtObject).Item).Customization;
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutMethodsSetCustomizationEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxLayoutControl(TScriptControlWrapper(ExtObject).Item).Customization := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutMethodsGetStyleEval(Info: TProgramInfo; ExtObject: TObject);
var
  Style: TdxCustomLayoutLookAndFeel;
begin
  Style := TdxLayoutControl(TScriptControlWrapper(ExtObject).Item).LayoutLookAndFeel;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Style);
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutMethodsSetStyleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxLayoutControl(TScriptControlWrapper(ExtObject).Item).LayoutLookAndFeel := (Info.ParamAsObject[0] as TdxCustomLayoutLookAndFeel);
end;

// -----------------------------------------------------------------------------


procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutMethodsClearEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxLayoutControl(TScriptControlWrapper(ExtObject).Item).Clear;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutMethodsDefaultStyleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, LayoutLookAndFeel);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutMethodsBeginUpdateEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxLayoutControl(TScriptControlWrapper(ExtObject).Item).BeginUpdate;
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutMethodsEndUpdateEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxLayoutControl(TScriptControlWrapper(ExtObject).Item).EndUpdate;
end;

// -----------------------------------------------------------------------------
//
// Script: TLayoutOffsets
//
// -----------------------------------------------------------------------------
type
  TdxLayoutOffsetsCracker = class(TdxLayoutOffsets);

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutOffsetsMethodsGetValueEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TdxLayoutOffsetsCracker(ExtObject).GetValue(Info.ParamAsInteger[0]);
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutOffsetsMethodsSetValueEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxLayoutOffsetsCracker(ExtObject).SetValue(Info.ParamAsInteger[0], Info.ParamAsInteger[1]);
end;

// -----------------------------------------------------------------------------
//
// Script: TCustomLayoutItem
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemMethodsBeginUpdateEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxCustomLayoutItemCracker(TScriptLayoutItemWrapper(ExtObject).Item).BeginUpdate;
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemMethodsEndUpdateEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxCustomLayoutItemCracker(TScriptLayoutItemWrapper(ExtObject).Item).EndUpdate;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemMethodsGetAlignHorzEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TScriptLayoutItemWrapper(ExtObject).Item.AlignHorz);
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemMethodsSetAlignHorzEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptLayoutItemWrapper(ExtObject).Item.AlignHorz := TdxLayoutAlignHorz(Info.ParamAsInteger[0]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemMethodsGetAlignVertEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TScriptLayoutItemWrapper(ExtObject).Item.AlignVert);
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemMethodsSetAlignVertEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptLayoutItemWrapper(ExtObject).Item.AlignVert := TdxLayoutAlignVert(Info.ParamAsInteger[0]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemMethodsGetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
// TCustomLayoutItem.GetCaption
begin
  // Just wrap the LayoutItem that owns the caption object
  if (VarIsEmpty(TScriptLayoutItemWrapper(ExtObject).CaptionObj)) then
    TScriptLayoutItemWrapper(ExtObject).CaptionObj := CreateResultScriptObject(Info, ExtObject);

  Info.ResultAsVariant := TScriptLayoutItemWrapper(ExtObject).CaptionObj;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemMethodsGetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TScriptLayoutItemWrapper(ExtObject).Item.Enabled;
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemMethodsSetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptLayoutItemWrapper(ExtObject).Item.Enabled := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemMethodsGetHeightEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TScriptLayoutItemWrapper(ExtObject).Item.Height;
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemMethodsSetHeightEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptLayoutItemWrapper(ExtObject).Item.Height := Info.Params[0].ValueAsInteger;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemMethodsGetWidthEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TScriptLayoutItemWrapper(ExtObject).Item.Width;
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemMethodsSetWidthEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptLayoutItemWrapper(ExtObject).Item.Width := Info.Params[0].ValueAsInteger;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemMethodsMakeVisibleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptLayoutItemWrapper(ExtObject).Item.MakeVisible;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemMethodsGetOffsetsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TScriptLayoutItemWrapper(ExtObject).Item.Offsets);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemMethodsGetPaddingEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TdxCustomLayoutItemCracker(TScriptLayoutItemWrapper(ExtObject).Item).Padding);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemMethodsGetParentEval(Info: TProgramInfo; ExtObject: TObject);
var
  Group: TdxCustomLayoutGroup;
  Wrapper: TScriptObjectWrapperBase;
begin
  Group := TScriptLayoutItemWrapper(ExtObject).Item.Parent;

  if (Group <> nil) then
  begin
    Wrapper := Environment(Info).FindWrapper(Group);
    if (Wrapper = nil) then
      Wrapper := CreateLayoutWrapper(Info, Group);
    Info.ResultAsVariant := Wrapper.ScriptObj;
  end else
    Info.ResultAsVariant := IUnknown(nil);
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemMethodsSetParentEval(Info: TProgramInfo; ExtObject: TObject);
var
  Group: TdxLayoutGroup;
  Wrapper: TScriptLayoutItemWrapper;
begin
  if (Info.ParamAsScriptObj[0] <> nil) then
  begin
    Wrapper := (Info.ParamAsObject[0] as TScriptLayoutItemWrapper);

    Group := Wrapper.Item as TdxLayoutGroup;
  end else
    Group := nil;

  TScriptLayoutItemWrapper(ExtObject).Item.Parent := Group;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemMethodsGetStyleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TScriptLayoutItemWrapper(ExtObject).Item.LayoutLookAndFeel);
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemMethodsSetStyleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (Info.Params[0].ScriptObj <> nil) then
    TScriptLayoutItemWrapper(ExtObject).Item.LayoutLookAndFeel := (Info.ParamAsObject[0] as TdxCustomLayoutLookAndFeel)
  else
    TScriptLayoutItemWrapper(ExtObject).Item.LayoutLookAndFeel := nil;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemMethodsGetVisibleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TScriptLayoutItemWrapper(ExtObject).Item.Visible;
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemMethodsSetVisibleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptLayoutItemWrapper(ExtObject).Item.Visible := Info.Params[0].ValueAsBoolean;
end;


// -----------------------------------------------------------------------------
//
// Script: TLayoutControlItem
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutItemMethodsGetControlEval(Info: TProgramInfo; ExtObject: TObject);
var
  Wrapper: TScriptObjectWrapperBase;
  Control: TControl;
begin
  Control := TdxLayoutItem(TScriptLayoutItemWrapper(ExtObject).Item).Control;

  if (Control <> nil) then
  begin
    Wrapper := Environment(Info).FindWrapper(Control);
    if (Wrapper = nil) then
      Wrapper := TScriptControlWrapper.Create(Info, Control);
    Info.ResultAsVariant := Wrapper.ScriptObj;
  end else
    Info.ResultAsVariant := IUnknown(nil);
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutItemMethodsSetControlEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (Info.ParamAsScriptObj[0] <> nil) then
    TdxLayoutItem(TScriptLayoutItemWrapper(ExtObject).Item).Control := (Info.ParamAsObject[0] as TScriptControlWrapper).Item
  else
    TdxLayoutItem(TScriptLayoutItemWrapper(ExtObject).Item).Control := nil;
end;


procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutLabelItemMethodsGetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (VarIsEmpty(TScriptLayoutItemWrapper(ExtObject).CaptionObj)) then
    TScriptLayoutItemWrapper(ExtObject).CaptionObj := CreateResultScriptObject(Info, ExtObject);

  Info.ResultAsVariant := TScriptLayoutItemWrapper(ExtObject).CaptionObj;
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutControlItemMethodsGetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
// TLayoutControlItem.GetCaption
begin
  // Just wrap the LayoutItem that owns the caption object
  if (VarIsEmpty(TScriptLayoutItemWrapper(ExtObject).CaptionObj)) then
    TScriptLayoutItemWrapper(ExtObject).CaptionObj := CreateResultScriptObject(Info, ExtObject);

  Info.ResultAsVariant := TScriptLayoutItemWrapper(ExtObject).CaptionObj;
end;

// -----------------------------------------------------------------------------
//
// Script: TLayoutImageItem
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutImageItemMethodsGetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  // Just wrap the LayoutItem that owns the caption object
  if (VarIsEmpty(TScriptLayoutItemWrapper(ExtObject).CaptionObj)) then
    TScriptLayoutItemWrapper(ExtObject).CaptionObj := CreateResultScriptObject(Info, ExtObject);

  Info.ResultAsVariant := TScriptLayoutItemWrapper(ExtObject).CaptionObj;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutImageItemMethodsGetImageEval(Info: TProgramInfo; ExtObject: TObject);
var
  Glyph: TGraphic;
begin
  Glyph := TdxLayoutImageItem(TScriptLayoutItemWrapper(ExtObject).Item).Image;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Glyph);
end;

// -----------------------------------------------------------------------------
//
// Script: TCustomLayoutItemCaption
//
// -----------------------------------------------------------------------------
// Note: We are wrapping the owning TCustomLayoutItem, not the CaptionOptions object
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutItemCaptionMethodsGetTextEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TScriptLayoutItemWrapper(ExtObject).Item.CaptionOptions.Text;
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutItemCaptionMethodsSetTextEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptLayoutItemWrapper(ExtObject).Item.CaptionOptions.Text := Info.Params[0].ValueAsString;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutItemCaptionMethodsGetVisibleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TScriptLayoutItemWrapper(ExtObject).Item.CaptionOptions.Visible;
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutItemCaptionMethodsSetVisibleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptLayoutItemWrapper(ExtObject).Item.CaptionOptions.Visible := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutItemCaptionMethodsGetShowAccelCharEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TdxCustomLayoutItemCaptionOptionsCracker(TdxCustomLayoutItemCracker(TScriptLayoutItemWrapper(ExtObject).Item).CaptionOptions).ShowAccelChar;
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutItemCaptionMethodsSetShowAccelCharEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxCustomLayoutItemCaptionOptionsCracker(TdxCustomLayoutItemCracker(TScriptLayoutItemWrapper(ExtObject).Item).CaptionOptions).ShowAccelChar := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsGetAlignVertEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TScriptLayoutItemWrapper(ExtObject).Item.CaptionOptions.AlignVert);
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsSetAlignVertEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptLayoutItemWrapper(ExtObject).Item.CaptionOptions.AlignVert := TdxAlignmentVert(Info.Params[0].ValueAsInteger);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsGetAlignHorzEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TScriptLayoutItemWrapper(ExtObject).Item.CaptionOptions.AlignHorz);
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsSetAlignHorzEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptLayoutItemWrapper(ExtObject).Item.CaptionOptions.AlignHorz := TAlignment(Info.Params[0].ValueAsInteger);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsGetGlyphEval(Info: TProgramInfo; ExtObject: TObject);
var
  Glyph: TBitmap;
begin
  //Glyph := TdxCustomLayoutItemCaptionOptionsCracker(TdxCustomLayoutItemCracker(TScriptLayoutItemWrapper(ExtObject).Item).CaptionOptions).Glyph;
  //Info.ResultAsVariant := CreateResultScriptObject(Info, Glyph);
  // DevExpress 17.1.1
  Info.ResultAsVariant := IUnknown(nil);
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsSetGlyphEval(Info: TProgramInfo; ExtObject: TObject);
var
  Glyph: TBitmap;
begin
  if (Info.ParamAsScriptObj[0] <> nil) then
    Glyph := TBitmap(Info.ParamAsObject[0])
  else
    Glyph := nil;
  TdxCustomLayoutItemCaptionOptionsCracker(TdxCustomLayoutItemCracker(TScriptLayoutItemWrapper(ExtObject).Item).CaptionOptions).Glyph.Assign(Glyph);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsGetVisibleElementsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Byte(TdxCustomLayoutItemCaptionOptionsCracker(TdxCustomLayoutItemCracker(TScriptLayoutItemWrapper(ExtObject).Item).CaptionOptions).VisibleElements);
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTCustomLayoutItemCaptionMethodsSetVisibleElementsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxCustomLayoutItemCaptionOptionsCracker(TdxCustomLayoutItemCracker(TScriptLayoutItemWrapper(ExtObject).Item).CaptionOptions).VisibleElements := TdxLayoutItemCaptionVisibleElements(Byte(Info.ParamAsInteger[0]));
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutItemCaptionMethodsGetPositionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TdxCustomLayoutItemCaptionOptionsCracker(TScriptLayoutItemWrapper(ExtObject).Item.CaptionOptions).Layout);
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutItemCaptionMethodsSetPositionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxCustomLayoutItemCaptionOptionsCracker(TScriptLayoutItemWrapper(ExtObject).Item.CaptionOptions).Layout := TdxCaptionLayout(Info.Params[0].ValueAsInteger);
end;

// -----------------------------------------------------------------------------
//
// Script: TLayoutLabeledItemCustomCaption
//
// -----------------------------------------------------------------------------
// Wraps CaptionOptions:TdxLayoutLabeledItemCustomCaptionOptions via Item
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutLabeledItemCustomCaptionMethodsGetCursorEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TdxLayoutLabeledItemCustomCaptionOptionsCracker(TScriptLayoutItemWrapper(ExtObject).Item.CaptionOptions).Cursor;
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutLabeledItemCustomCaptionMethodsGetWidthEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TdxLayoutLabeledItemCustomCaptionOptionsCracker(TScriptLayoutItemWrapper(ExtObject).Item.CaptionOptions).Width;
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutLabeledItemCustomCaptionMethodsGetWordWrapEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TdxLayoutLabeledItemCustomCaptionOptionsCracker(TScriptLayoutItemWrapper(ExtObject).Item.CaptionOptions).WordWrap;
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutLabeledItemCustomCaptionMethodsSetCursorEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxLayoutLabeledItemCustomCaptionOptionsCracker(TScriptLayoutItemWrapper(ExtObject).Item.CaptionOptions).Cursor := Info.ParamAsInteger[0];
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutLabeledItemCustomCaptionMethodsSetWidthEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxLayoutLabeledItemCustomCaptionOptionsCracker(TScriptLayoutItemWrapper(ExtObject).Item.CaptionOptions).Width := Info.ParamAsInteger[0];
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutLabeledItemCustomCaptionMethodsSetWordWrapEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxLayoutLabeledItemCustomCaptionOptionsCracker(TScriptLayoutItemWrapper(ExtObject).Item.CaptionOptions).WordWrap := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------
//
// Script: TLayoutGroup
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutGroupMethodsCreateEmptySpaceItemEval(Info: TProgramInfo; ExtObject: TObject);
var
  Item: TdxCustomLayoutItem;
  Wrapper: TScriptLayoutItemWrapper;
begin
  Item := TdxLayoutGroup(TScriptLayoutItemWrapper(ExtObject).Item).CreateItem(TdxLayoutEmptySpaceItem);

  Wrapper := CreateLayoutWrapper(Info, Item, True);
  Info.ResultAsVariant := Wrapper.ScriptObj;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutGroupMethodsCreateGroupEval(Info: TProgramInfo; ExtObject: TObject);
var
  Item: TdxCustomLayoutItem;
  Wrapper: TScriptLayoutItemWrapper;
begin
  Item := TdxLayoutGroup(TScriptLayoutItemWrapper(ExtObject).Item).CreateGroup;

  Wrapper := CreateLayoutWrapper(Info, Item, True);
  Info.ResultAsVariant := Wrapper.ScriptObj;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutGroupMethodsCreateItemEval(Info: TProgramInfo; ExtObject: TObject);
var
  Control: TControl;
  Item: TdxLayoutItem;
  Wrapper: TScriptLayoutItemWrapper;
begin
  Control := (Info.Params[0].ExternalObject as TScriptControlWrapper).Item;

  Item := TdxLayoutGroup(TScriptLayoutItemWrapper(ExtObject).Item).CreateItemForControl(Control);

  Wrapper := CreateLayoutWrapper(Info, Item, True);
  Info.ResultAsVariant := Wrapper.ScriptObj;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutGroupMethodsCreateLabelItemEval(Info: TProgramInfo; ExtObject: TObject);
var
  Item: TdxCustomLayoutItem;
  Wrapper: TScriptLayoutItemWrapper;
begin
  Item := TdxLayoutGroup(TScriptLayoutItemWrapper(ExtObject).Item).CreateItem(TdxLayoutLabeledItem);

  Wrapper := CreateLayoutWrapper(Info, Item, True);
  Info.ResultAsVariant := Wrapper.ScriptObj;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutGroupMethodsCreateSeparatorItemEval(Info: TProgramInfo; ExtObject: TObject);
var
  Item: TdxCustomLayoutItem;
  Wrapper: TScriptLayoutItemWrapper;
begin
  Item := TdxLayoutGroup(TScriptLayoutItemWrapper(ExtObject).Item).CreateItem(TdxLayoutSeparatorItem);

  Wrapper := CreateLayoutWrapper(Info, Item, True);
  Info.ResultAsVariant := Wrapper.ScriptObj;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutGroupMethodsCreateSplitterItemEval(Info: TProgramInfo; ExtObject: TObject);
var
  Item: TdxCustomLayoutItem;
  Wrapper: TScriptLayoutItemWrapper;
begin
  Item := TdxLayoutGroup(TScriptLayoutItemWrapper(ExtObject).Item).CreateItem(TdxLayoutSplitterItem);

  Wrapper := CreateLayoutWrapper(Info, Item, True);
  Info.ResultAsVariant := Wrapper.ScriptObj;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutGroupMethodsGetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  // Just wrap the LayoutItem that owns the caption object
  if (VarIsEmpty(TScriptLayoutItemWrapper(ExtObject).CaptionObj)) then
    TScriptLayoutItemWrapper(ExtObject).CaptionObj := CreateResultScriptObject(Info, ExtObject);

  Info.ResultAsVariant := TScriptLayoutItemWrapper(ExtObject).CaptionObj;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutGroupMethodsGetAllowWrapItemsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TdxLayoutGroup(TScriptLayoutItemWrapper(ExtObject).Item).AllowWrapItems;
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutGroupMethodsSetAllowWrapItemsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxLayoutGroup(TScriptLayoutItemWrapper(ExtObject).Item).AllowWrapItems := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutGroupMethodsGetExpandedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TdxLayoutGroup(TScriptLayoutItemWrapper(ExtObject).Item).Expanded;
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutGroupMethodsSetExpandedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxLayoutGroup(TScriptLayoutItemWrapper(ExtObject).Item).Expanded := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutGroupMethodsGetHiddenEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TdxLayoutGroup(TScriptLayoutItemWrapper(ExtObject).Item).Hidden;
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutGroupMethodsSetHiddenEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxLayoutGroup(TScriptLayoutItemWrapper(ExtObject).Item).Hidden := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutGroupMethodsGetIndentEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TdxLayoutGroup(TScriptLayoutItemWrapper(ExtObject).Item).UseIndent;
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutGroupMethodsSetIndentEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxLayoutGroup(TScriptLayoutItemWrapper(ExtObject).Item).UseIndent := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutGroupMethodsGetItemsEval(Info: TProgramInfo; ExtObject: TObject);
var
  Wrapper: TScriptLayoutItemWrapper;
begin
  // ItemList doesn't really exist. In reality it is a composite object based on two group properties.
  Wrapper := TScriptLayoutItemWrapper(ExtObject);
  Info.ResultAsVariant := Wrapper.ScriptObj;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutGroupMethodsGetLayoutDirectionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TdxLayoutGroup(TScriptLayoutItemWrapper(ExtObject).Item).LayoutDirection);
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutGroupMethodsSetLayoutDirectionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxLayoutGroup(TScriptLayoutItemWrapper(ExtObject).Item).LayoutDirection := TdxLayoutDirection(Info.Params[0].ValueAsInteger);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutGroupMethodsGetScrollOptionsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TdxLayoutGroup(TScriptLayoutItemWrapper(ExtObject).Item).ScrollOptions);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutGroupMethodsGetShowBorderEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TdxLayoutGroup(TScriptLayoutItemWrapper(ExtObject).Item).ShowBorder;
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutGroupMethodsSetShowBorderEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxLayoutGroup(TScriptLayoutItemWrapper(ExtObject).Item).ShowBorder := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------
//
// Script: TLayoutGroupScrollOptions
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutGroupScrollOptionsMethodsGetHorizontalEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TdxLayoutGroupScrollOptions(ExtObject).Horizontal);
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutGroupScrollOptionsMethodsGetVerticalEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TdxLayoutGroupScrollOptions(ExtObject).Vertical);
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutGroupScrollOptionsMethodsSetHorizontalEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxLayoutGroupScrollOptions(ExtObject).Horizontal := TdxLayoutGroupScrollMode(Info.ParamAsInteger[0]);
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutGroupScrollOptionsMethodsSetVerticalEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxLayoutGroupScrollOptions(ExtObject).Vertical := TdxLayoutGroupScrollMode(Info.ParamAsInteger[0]);
end;

// -----------------------------------------------------------------------------
//
// Script: TLayoutItemList
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutItemListMethodsGetCountEval(Info: TProgramInfo; ExtObject: TObject);
begin
  // ExtObject wraps a group - not the list
  Info.ResultAsInteger := TdxLayoutGroup(TScriptLayoutItemWrapper(ExtObject).Item).Count;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutItemListMethodsGetItemEval(Info: TProgramInfo; ExtObject: TObject);
var
  Item: TdxCustomLayoutItem;
  Index: integer;
  Wrapper: TScriptObjectWrapperBase;
begin
  Index := Info.Params[0].ValueAsInteger;
  // ExtObject wraps a group - not the list
  Item := TdxLayoutGroup(TScriptLayoutItemWrapper(ExtObject).Item).Items[Index];

  Wrapper := Environment(Info).FindWrapper(Item);

  if (Wrapper = nil) then
    Wrapper := CreateLayoutWrapper(Info, Item);
  Info.ResultAsVariant := Wrapper.ScriptObj;
end;

// -----------------------------------------------------------------------------
//
// Script: TLayoutStyle
//
// -----------------------------------------------------------------------------
type
  TScriptLayoutLookAndFeel = class(TdxLayoutSkinLookAndFeel);

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutStyleCleanUp(ExternalObject: TObject);
begin
  if (ExternalObject is TScriptLayoutLookAndFeel) then
    ExternalObject.Free;
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutStyleConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  if (ExtObject = nil) then
    ExtObject := TScriptLayoutLookAndFeel.Create(Self);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutStyleMethodsGetGroupOptionsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TdxCustomLayoutLookAndFeel(ExtObject).GroupOptions);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutStyleMethodsGetItemOptionsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TdxCustomLayoutLookAndFeel(ExtObject).ItemOptions);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutStyleMethodsGetOffsetsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TdxCustomLayoutLookAndFeel(ExtObject).Offsets);
end;


// -----------------------------------------------------------------------------
//
// Script: TLayoutStyleOffsets
//
// -----------------------------------------------------------------------------
type
  TdxLayoutLookAndFeelOffsetsCracker = class(TdxLayoutLookAndFeelOffsets);

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutStyleOffsetsMethodsGetValueEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TdxLayoutLookAndFeelOffsetsCracker(ExtObject).GetValue(Info.ParamAsInteger[0]);
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutStyleOffsetsMethodsSetValueEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxLayoutLookAndFeelOffsetsCracker(ExtObject).SetValue(Info.ParamAsInteger[0], Info.ParamAsInteger[1]);
end;

// -----------------------------------------------------------------------------
//
// Script: TLayoutStyleItemOptions
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutStyleItemOptionsMethodsGetCaptionOptionsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TdxLayoutLookAndFeelItemOptions(ExtObject).CaptionOptions);
end;

// -----------------------------------------------------------------------------
//
// Script: TLayoutStyleGroupOptions
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutStyleGroupOptionsMethodsGetCaptionOptionsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TdxLayoutLookAndFeelGroupOptions(ExtObject).CaptionOptions);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutStyleGroupOptionsMethodsGetColorEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TdxLayoutLookAndFeelGroupOptions(ExtObject).Color;
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutStyleGroupOptionsMethodsSetColorEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxLayoutLookAndFeelGroupOptions(ExtObject).Color := TColor(Info.ParamAsInteger[0]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutStyleGroupOptionsMethodsGetSpaceBetweenButtonsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TdxLayoutLookAndFeelGroupOptions(ExtObject).SpaceBetweenButtons;
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutStyleGroupOptionsMethodsSetSpaceBetweenButtonsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxLayoutLookAndFeelGroupOptions(ExtObject).SpaceBetweenButtons := Info.ParamAsInteger[0];
end;

// -----------------------------------------------------------------------------
//
// Script: TLayoutStyleCaptionOptions
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutStyleCaptionOptionsMethodsGetTextColorEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TdxLayoutLookAndFeelCaptionOptions(ExtObject).TextColor;
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutStyleCaptionOptionsMethodsSetTextColorEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxLayoutLookAndFeelCaptionOptions(ExtObject).TextColor := Info.ParamAsInteger[0];
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutStyleCaptionOptionsMethodsGetUseDefaultFontEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TdxLayoutLookAndFeelCaptionOptions(ExtObject).UseDefaultFont;
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutStyleCaptionOptionsMethodsSetUseDefaultFontEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxLayoutLookAndFeelCaptionOptions(ExtObject).UseDefaultFont := Info.ParamAsBoolean[0];
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutStyleCaptionOptionsMethodsGetFontEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TdxLayoutLookAndFeelCaptionOptions(ExtObject).Font);
end;

procedure TDataModuleScriptUserInterfaceLayout.dwsUnitLayoutClassesTLayoutStyleCaptionOptionsMethodsSetFontEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxLayoutLookAndFeelCaptionOptions(ExtObject).Font.Assign(Info.ParamAsObject[0] as TFont);
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

initialization
  TDataModuleScriptUserInterfaceLayout.RegisterModule;
end.
