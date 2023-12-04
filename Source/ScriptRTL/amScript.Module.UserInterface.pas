unit amScript.Module.UserInterface;

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

  amScript.Module;

// -----------------------------------------------------------------------------
//
// TScriptModuleUserInterface
//
// -----------------------------------------------------------------------------
type
  TDataModule = TScriptModule;

  TDataModuleUserInterface = class(TDataModule)
    dwsUnitControls: TdwsUnit;
    procedure dwsUnitProjectClassesTControlCleanUp(ExternalObject: TObject);
    procedure dwsUnitProjectClassesTControlMethodsGetLeftEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProjectClassesTControlMethodsSetLeftEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProjectClassesTControlMethodsGetTopEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProjectClassesTControlMethodsSetTopEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProjectClassesTControlMethodsGetWidthEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProjectClassesTControlMethodsSetWidthEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProjectClassesTControlMethodsGetHeightEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProjectClassesTControlMethodsSetHeightEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProjectClassesTControlMethodsGetVisibleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProjectClassesTControlMethodsSetVisibleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProjectClassesTContainerControlMethodsGetControlsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProjectClassesTControlMethodsGetAlignEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProjectClassesTControlMethodsSetAlignEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProjectClassesTControlMethodsGetParentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProjectClassesTControlMethodsSetParentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProjectClassesTControlMethodsShowEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProjectClassesTControlMethodsHideEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProjectClassesTControlListMethodsGetItemEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProjectClassesTControlListMethodsGetCountEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProjectClassesTControlListMethodsClearEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProjectClassesTEditControlConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitProjectClassesTControlMethodsGetTextEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProjectClassesTControlMethodsSetTextEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProjectClassesTCustomFormMethodsShowModalEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsGetColorEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsSetColorEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsGetCursorEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsSetCursorEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsGetParentFontEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsSetParentFontEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsGetHintEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsSetHintEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsGetParentColorEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsSetParentColorEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsGetAutoSizeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsSetAutoSizeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTLabelMethodsGetTransparentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTLabelMethodsSetTransparentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTLabelConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitControlsClassesTPanelConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsGetConstraintsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTSizeConstraintsMethodsGetConstraintEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTSizeConstraintsMethodsSetConstraintEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomFormConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomFormMethodsGetModalResultEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomFormMethodsSetModalResultEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTButtonConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitControlsClassesTButtonMethodsGetModalResultEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTButtonMethodsSetModalResultEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCheckBoxConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitControlsClassesTCheckBoxMethodsGetCheckedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCheckBoxMethodsSetCheckedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTRadioButtonConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitControlsClassesTRadioButtonMethodsGetCheckedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTRadioButtonMethodsSetCheckedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomFormMethodsCloseEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTImageConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitControlsClassesTImageMethodsLoadFromFileEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTImageMethodsGetStretchEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTImageMethodsSetStretchEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTImageMethodsGetProportionalEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTImageMethodsSetProportionalEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTImageMethodsGetCenterEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTImageMethodsSetCenterEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsGetShowHintEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsSetShowHintEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTComboBoxConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitControlsClassesTComboBoxMethodsGetItemsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTComboBoxMethodsGetItemIndexEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTComboBoxMethodsSetItemIndexEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTComboBoxMethodsGetDropDownListStyleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTComboBoxMethodsSetDropDownListStyleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsGetParentShowHintEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsSetParentShowHintEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomEditMethodsGetReadOnlyEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomEditMethodsSetReadOnlyEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTMemoConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitControlsClassesTMemoMethodsGetLinesEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsGetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsSetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTMemoMethodsGetWordWrapEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTMemoMethodsSetWordWrapEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTMemoMethodsGetWantReturnsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTMemoMethodsSetWantReturnsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTMemoMethodsGetWantTabsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTMemoMethodsSetWantTabsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomEditMethodsGetTextHintEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomEditMethodsSetTextHintEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsGetTabStopEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsSetTabStopEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTDateEditConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitControlsClassesTDateEditMethodsGetValueEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTDateEditMethodsSetValueEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCalcEditConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitControlsClassesTCalcEditMethodsGetPrecisionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCalcEditMethodsSetPrecisionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomEditMethodsGetAlignmentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTEditAlignmentMethodsGetHorzEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTEditAlignmentMethodsSetHorzEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTEditAlignmentMethodsGetVertEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTEditAlignmentMethodsSetVertEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsSetOnClickEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsSetOnDblClickEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsSetOnEnterEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsSetOnExitEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsSetOnKeypressEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomEditMethodsSetOnChangeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTImageMethodsLoadFromStreamEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTImageMethodsSaveToStreamEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTImageMethodsGetImageEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTImageMethodsSetImageEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTButtonMethodsGetDescriptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTButtonMethodsSetDescriptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTButtonMethodsGetKindEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTButtonMethodsSetKindEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTButtonMethodsGetTransparentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTButtonMethodsSetTransparentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsGetFontEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsSetFontEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTGroupBoxConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitControlsClassesTGroupBoxMethodsGetAlignmentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTGroupBoxMethodsSetAlignmentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCheckGroupConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsGetMarginsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTContainerControlMethodsGetPaddingEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlOffsetMethodsSetBoundsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlOffsetMethodsSetLeftEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlOffsetMethodsSetTopEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlOffsetMethodsSetRightEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlOffsetMethodsSetBottomEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlOffsetMethodsGetLeftEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlOffsetMethodsGetTopEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlOffsetMethodsGetRightEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlOffsetMethodsGetBottomEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsGetAlignWithMarginsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsSetAlignWithMarginsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsFunctionsShortCutToTextEval(info: TProgramInfo);
    procedure dwsUnitControlsFunctionsTextToShortCutEval(info: TProgramInfo);
    procedure dwsUnitControlsClassesTControlMethodsGetActionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsSetActionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTNumberEditConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitControlsClassesTNumberEditMethodsGetValueEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTNumberEditMethodsSetValueEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTNumberEditMethodsGetPrecisionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTNumberEditMethodsSetPrecisionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTNumberEditMethodsGetUseThousandSeparatorEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTNumberEditMethodsSetUseThousandSeparatorEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomEditMethodsGetUseLeftAlignmentOnEditingEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomEditMethodsSetUseLeftAlignmentOnEditingEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomTextEditMethodsGetDisplayFormatEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomTextEditMethodsSetDisplayFormatEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomTextEditMethodsGetEditFormatEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomTextEditMethodsSetEditFormatEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomTextEditMethodsGetCharCaseEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomTextEditMethodsSetCharCaseEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTLabelMethodsGetWordWrapEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTLabelMethodsSetWordWrapEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTLabelMethodsGetShowEndEllipsisEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTLabelMethodsSetShowEndEllipsisEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTLabelMethodsGetShowAccelCharEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTLabelMethodsSetShowAccelCharEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomEditMethodsSetOnChangedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomFormMethodsGetStayOnTopEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomFormMethodsSetStayOnTopEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomFormMethodsGetActiveEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomFormMethodsGetBorderStyleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomFormMethodsSetBorderStyleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomFormMethodsGetKeyPreviewEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomFormMethodsSetKeyPreviewEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomFormMethodsGetWindowStateEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomFormMethodsSetWindowStateEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomFormMethodsGetPositionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomFormMethodsSetPositionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTComboBoxMethodsGetSortedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTComboBoxMethodsSetSortedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTButtonMethodsGetDefaultEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTButtonMethodsSetDefaultEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTButtonMethodsGetCancelEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTButtonMethodsSetCancelEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomEditMethodsGetButtonsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTEditButtonsMethodsAddEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTEditButtonsMethodsGetItemEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTRadioButtonMethodsGetGroupIndexEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTRadioButtonMethodsSetGroupIndexEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomTextEditMethodsGetMinValueEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomTextEditMethodsSetMinValueEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomTextEditMethodsSetMaxValueEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomTextEditMethodsGetMaxValueEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTSpinEditConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitControlsClassesTSpinEditMethodsGetValueEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTSpinEditMethodsSetValueEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTSpinEditMethodsGetIncrementEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTSpinEditMethodsSetIncrementEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTSpinEditMethodsGetLargeIncrementEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTSpinEditMethodsSetLargeIncrementEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTSpinEditMethodsGetValueTypeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTSpinEditMethodsSetValueTypeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsGetParentBackgroundEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsSetParentBackgroundEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomTextEditMethodsGetPasswordCharEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomTextEditMethodsSetPasswordCharEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomTextEditMethodsGetLookupItemsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomTextEditMethodsGetIncrementalSearchEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomTextEditMethodsSetIncrementalSearchEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomTextEditMethodsGetLookupItemsSortedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomTextEditMethodsSetLookupItemsSortedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTEditButtonMethodsGetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTEditButtonMethodsSetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTEditButtonMethodsGetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTEditButtonMethodsSetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTEditButtonMethodsGetHintEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTEditButtonMethodsSetHintEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTEditButtonMethodsGetKindEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTEditButtonMethodsSetKindEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTEditButtonMethodsGetLeftAlignmentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTEditButtonMethodsSetLeftAlignmentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTEditButtonMethodsGetVisibleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTEditButtonMethodsSetVisibleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTEditButtonMethodsGetWidthEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTEditButtonMethodsSetWidthEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTEditButtonMethodsGetTextAlignmentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTEditButtonMethodsSetTextAlignmentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTEditButtonMethodsGetGlyphEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomEditMethodsSetOnButtonClickEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsUpdateEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsRepaintEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsRefreshEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsInvalidateEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsClickEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomFormMethodsSetOnShowEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTFormMethodsSetOnAfterShowEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsGetBoundsRectEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsSetBoundsRectEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsGetClientRectEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsClientToScreenRectEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsScreenToClientRectEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsClientToScreenEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsScreenToClientEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTControlMethodsGetUserInterfaceAutomationEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCheckGroupMethodsGetStateEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCheckGroupMethodsSetStateEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCheckGroupMethodsGetAllowGrayedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCheckGroupMethodsSetAllowGrayedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCheckGroupMethodsGetLeftJustifyEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCheckGroupMethodsSetLeftJustifyEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCheckGroupMethodsGetCheckedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCheckGroupMethodsSetCheckedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCheckGroupMethodsGetItemsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCheckGroupItemsMethodsGetItemEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCheckGroupItemsMethodsAddEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCaptionCollectionItemMethodsGetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCaptionCollectionItemMethodsSetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCaptionCollectionItemMethodsGetTagEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCaptionCollectionItemMethodsSetTagEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCheckGroupItemMethodsGetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCheckGroupItemMethodsSetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTEditButtonMethodsGetActionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTEditButtonMethodsSetActionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTEditButtonMethodsGetImageIndexEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTEditButtonMethodsSetImageIndexEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTImageMethodsSaveToFileEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomControlMethodsSetFocusEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomControlMethodsCanFocusEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomControlMethodsFocusedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomControlMethodsGetHandleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomControlMethodsPostMessageEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTCustomControlMethodsPostMessageSelfEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTButtonMethodsGetImageOptionsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTButtonImageOptionsMethodsGetGlyphEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTButtonImageOptionsMethodsGetLayoutEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTButtonImageOptionsMethodsSetLayoutEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTButtonImageOptionsMethodsGetMarginEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTButtonImageOptionsMethodsSetMarginEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTButtonImageOptionsMethodsGetNumGlyphsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTButtonImageOptionsMethodsSetNumGlyphsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTButtonImageOptionsMethodsGetSpacingEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitControlsClassesTButtonImageOptionsMethodsSetSpacingEval(Info: TProgramInfo; ExtObject: TObject);
  private
  protected
    // Control event handlers
    procedure OnEnterHandler(Sender: TObject); // TControl
    procedure OnExitHandler(Sender: TObject); // TControl
    procedure OnKeyPressHandler(Sender: TObject; var Key: char); // TControl
    procedure OnChangeHandler(Sender: TObject); // TCustomEdit
    procedure OnChangedHandler(Sender: TObject); // TCustomEdit
    procedure OnEditButtonClickHandler(Sender: TObject; ButtonIndex: integer); // TCustomEdit
    procedure OnShowHandler(Sender: TObject); // TCustomForm
    procedure OnAfterShowHandler(Sender: TObject); // TForm

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
  TypInfo,
  Math,
  Variants,
  Forms,
  StdCtrls,
  ExtCtrls,
  Windows,
  Messages,
  Graphics,
  jpeg,
  pngimage,
  GIFImg,
  Menus,
  ImgList,
  ActnList,
  Buttons,

  cxControls,
  cxEdit,
  cxTextEdit,
  cxLabel,
  cxButtons,
  cxMemo,
  cxCheckBox,
  cxRadioGroup,
  cxMaskEdit,
  cxDropDownEdit,
  cxCalendar,
  cxCalc,
  cxGroupBox,
  cxCheckGroup,
  cxCurrencyEdit,
  cxSpinEdit,
  cxGraphics,
  cxLookAndFeelPainters,
  dxSmartImage,

  amEnvironment,

  dwsInfo,
  dwsFileSystem,
  dwsSymbols,
  dwsDebugger,

  amScript.API,
  amScript.Module.Classes {necessary for RectToInfo()};

// -----------------------------------------------------------------------------

type
  TControlCracker = class(TControl);
  TWinControlCracker = class(TWinControl);
  TcxCustomEditCracker = class(TcxCustomEdit);
  TcxCustomTextEditCracker = class(TcxCustomTextEdit);

  //TcxCustomEditPropertiesCracker = class(TcxCustomEditProperties);

const
  MSG_AFTER_SHOW = WM_USER;

type
  TScriptForm = class(TForm)
  private
    FOnAfterShow: TNotifyEvent;
  protected
    procedure DoShow; override;
    // Custom Messages
    procedure MsgAfterShow(var Msg: TMessage); message MSG_AFTER_SHOW;
  public
    property OnAfterShow: TNotifyEvent read FOnAfterShow write FOnAfterShow;
  end;

procedure TScriptForm.DoShow;
begin
  if (Assigned(FOnAfterShow)) then
    PostMessage(Handle, MSG_AFTER_SHOW, 0, 0);

  inherited;
end;

procedure TScriptForm.MsgAfterShow(var Msg: TMessage);
begin
  if (Assigned(FOnAfterShow)) then
    FOnAfterShow(Self);
end;

// -----------------------------------------------------------------------------
//
// TDataModuleUserInterface
//
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.Initialize(ADelphiWebScript: TDelphiWebScript);
begin
  inherited Initialize(ADelphiWebScript);
(*
  ScriptService.RegisterClassTypeMapping(TcxTextEdit, 'TEdit');
  ScriptService.RegisterClassTypeMapping(TPanel);
  ScriptService.RegisterClassTypeMapping(TcxButton, 'TButton');
  ScriptService.RegisterClassTypeMapping(TcxLabel, 'TLabel');
  ScriptService.RegisterClassTypeMapping(TcxCheckBox, 'TCheckBox');
  ScriptService.RegisterClassTypeMapping(TcxRadioButton, 'TRadioButton');
  ScriptService.RegisterClassTypeMapping(TImage);
  ScriptService.RegisterClassTypeMapping(TcxComboBox, 'TComboBox');
  ScriptService.RegisterClassTypeMapping(TcxMemo, 'TMemo');
  ScriptService.RegisterClassTypeMapping(TcxDateEdit, 'TDateEdit');
  ScriptService.RegisterClassTypeMapping(TcxCurrencyEdit, 'TNumberEdit');
  ScriptService.RegisterClassTypeMapping(TcxSpinEdit, 'TSpinEdit');
  ScriptService.RegisterClassTypeMapping(TcxGroupBox, 'TGroupBox');
  ScriptService.RegisterClassTypeMapping(TcxCheckGroup, 'TCheckGroup');
*)
end;


// -----------------------------------------------------------------------------
//
// Control event handlers
//
// -----------------------------------------------------------------------------
// Dispatches to the script event handler
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.OnEditButtonClickHandler(Sender: TObject; ButtonIndex: integer);
var
  Wrapper: TScriptObjectWrapperBase;
  Delegate: IInfo;
  ScriptObjectInfo: IScriptObjectInfo;
  Any: boolean;
begin
  Any := False;
  for Wrapper in ScriptFindWrappers(Sender) do
  begin
    if (not Wrapper.CheckScriptObj) then
    begin
      OutputDebugString('OnEditButtonClickHandler: Script Object has been destroyed');
      Continue;
    end;

    ScriptObjectInfo := Wrapper.AcquireInfo;
    Delegate := ScriptObjectInfo.Info.Member['FOnButtonClick'];

    if (Delegate <> nil) and (not Delegate.ValueIsEmpty) then
    begin
      try
        Delegate.Call([Wrapper.ScriptObj, ButtonIndex]);
        Any := True;
      except
        Delegate.Value := IUnknown(nil);
        ScriptHandleException(Wrapper.Execution);
      end;
    end;
  end;
  if (not Any) then
    TcxCustomEditCracker(Sender).Properties.OnButtonClick := nil;
end;

procedure TDataModuleUserInterface.OnChangedHandler(Sender: TObject);
var
  Wrapper: TScriptObjectWrapperBase;
  Delegate: IInfo;
  ScriptObjectInfo: IScriptObjectInfo;
  Any: boolean;
begin
  Any := False;
  for Wrapper in ScriptFindWrappers(Sender) do
  begin
    if (not Wrapper.CheckScriptObj) then
    begin
      OutputDebugString('OnChangedHandler: Script Object has been destroyed');
      Continue;
    end;

    ScriptObjectInfo := Wrapper.AcquireInfo;
    Delegate := ScriptObjectInfo.Info.Member['FOnChanged'];

    if (Delegate <> nil) and (not Delegate.ValueIsEmpty) then
    begin
      try
        Delegate.Call([Wrapper.ScriptObj]);
        Any := True;
      except
        Delegate.Value := IUnknown(nil);
        ScriptHandleException(Wrapper.Execution);
      end;
    end;
  end;
  if (not Any) then
    TcxCustomEditCracker(Sender).Properties.OnEditValueChanged := nil;
end;

procedure TDataModuleUserInterface.OnChangeHandler(Sender: TObject);
var
  Wrapper: TScriptObjectWrapperBase;
  Delegate: IInfo;
  ScriptObjectInfo: IScriptObjectInfo;
  Any: boolean;
begin
  Any := False;
  for Wrapper in ScriptFindWrappers(Sender) do
  begin
    if (not Wrapper.CheckScriptObj) then
    begin
      OutputDebugString('OnChangeHandler: Script Object has been destroyed');
      Continue;
    end;

    ScriptObjectInfo := Wrapper.AcquireInfo;
    Delegate := ScriptObjectInfo.Info.Member['FOnChange'];

    if (Delegate <> nil) and (not Delegate.ValueIsEmpty) then
    begin
      try
        Delegate.Call([Wrapper.ScriptObj]);
        Any := True;
      except
        Delegate.Value := IUnknown(nil);
        ScriptHandleException(Wrapper.Execution);
      end;
    end;
  end;
  if (not Any) then
    TcxCustomEditCracker(Sender).Properties.OnChange := nil;
end;

procedure TDataModuleUserInterface.OnEnterHandler(Sender: TObject);
var
  Wrapper: TScriptObjectWrapperBase;
  Delegate: IInfo;
  ScriptObjectInfo: IScriptObjectInfo;
  Any: boolean;
begin
  Any := False;
  for Wrapper in ScriptFindWrappers(Sender) do
  begin
    if (not Wrapper.CheckScriptObj) then
    begin
      OutputDebugString('OnEnterHandler: Script Object has been destroyed');
      Continue;
    end;

    ScriptObjectInfo := Wrapper.AcquireInfo;
    Delegate := ScriptObjectInfo.Info.Member['FOnEnter'];

    if (Delegate <> nil) and (not Delegate.ValueIsEmpty) then
    begin
      try
        Delegate.Call([Wrapper.ScriptObj]);
        Any := True;
      except
        Delegate.Value := IUnknown(nil);
        ScriptHandleException(Wrapper.Execution);
      end;
    end;
  end;
  if (not Any) then
    TWinControlCracker(Sender).OnEnter := nil;
end;

procedure TDataModuleUserInterface.OnExitHandler(Sender: TObject);
var
  Wrapper: TScriptObjectWrapperBase;
  Delegate: IInfo;
  ScriptObjectInfo: IScriptObjectInfo;
  Any: boolean;
begin
  Any := False;
  for Wrapper in ScriptFindWrappers(Sender) do
  begin
    if (not Wrapper.CheckScriptObj) then
    begin
      OutputDebugString('OnExitHandler: Script Object has been destroyed');
      Continue;
    end;

    ScriptObjectInfo := Wrapper.AcquireInfo;
    Delegate := ScriptObjectInfo.Info.Member['FOnExit'];

    if (Delegate <> nil) and (not Delegate.ValueIsEmpty) then
    begin
      try
        Delegate.Call([Wrapper.ScriptObj]);
        Any := True;
      except
        Delegate.Value := IUnknown(nil);
        ScriptHandleException(Wrapper.Execution);
      end;
    end;
  end;
  if (not Any) then
    TWinControlCracker(Sender).OnExit := nil;
end;

procedure TDataModuleUserInterface.OnKeyPressHandler(Sender: TObject; var Key: char);
var
  Wrapper: TScriptObjectWrapperBase;
  Delegate: IInfo;
  ScriptObjectInfo: IScriptObjectInfo;
  Any: boolean;
begin
  Any := False;
  for Wrapper in ScriptFindWrappers(Sender) do
  begin
    if (not Wrapper.CheckScriptObj) then
    begin
      OutputDebugString('OnKeyPressHandler: Script Object has been destroyed');
      Continue;
    end;

    ScriptObjectInfo := Wrapper.AcquireInfo;
    Delegate := ScriptObjectInfo.Info.Member['FOnKeypress'];

    if (Delegate <> nil) and (not Delegate.ValueIsEmpty) then
    begin
      Delegate.Parameter['Sender'].Value := Wrapper.ScriptObj;
      Delegate.Parameter['Key'].ValueAsString := Key; // var parameter

      try
        Delegate.Call;
        Key := Delegate.Parameter['Key'].ValueAsString[1];
        Any := True;
      except
        Delegate.Value := IUnknown(nil);
        ScriptHandleException(Wrapper.Execution);
      end;
    end;
  end;
  if (not Any) then
    TWinControlCracker(Sender).OnKeyPress := nil;
end;

procedure TDataModuleUserInterface.OnAfterShowHandler(Sender: TObject);
var
  Wrapper: TScriptObjectWrapperBase;
  Delegate: IInfo;
  ScriptObjectInfo: IScriptObjectInfo;
  Any: boolean;
begin
  Any := False;
  for Wrapper in ScriptFindWrappers(Sender) do
  begin
    if (not Wrapper.CheckScriptObj) then
    begin
      OutputDebugString('OnAfterShowHandler: Script Object has been destroyed');
      Continue;
    end;

    ScriptObjectInfo := Wrapper.AcquireInfo;
    Delegate := ScriptObjectInfo.Info.Member['FOnAfterShow'];

    if (Delegate <> nil) and (not Delegate.ValueIsEmpty) then
    begin
      try
        Delegate.Call([Wrapper.ScriptObj]);
        Any := True;
      except
        Delegate.Value := IUnknown(nil);
        ScriptHandleException(Wrapper.Execution);
      end;
    end;
  end;
  if (not Any) then
    TScriptForm(Sender).OnAfterShow := nil;
end;

procedure TDataModuleUserInterface.OnShowHandler(Sender: TObject);
var
  Wrapper: TScriptObjectWrapperBase;
  Delegate: IInfo;
  ScriptObjectInfo: IScriptObjectInfo;
  Any: boolean;
begin
  Any := False;
  for Wrapper in ScriptFindWrappers(Sender) do
  begin
    if (not Wrapper.CheckScriptObj) then
    begin
      OutputDebugString('OnShowHandler: Script Object has been destroyed');
      Continue;
    end;

    ScriptObjectInfo := Wrapper.AcquireInfo;
    Delegate := ScriptObjectInfo.Info.Member['FOnShow'];

    if (Delegate <> nil) and (not Delegate.ValueIsEmpty) then
    begin
      try
        Delegate.Call([Wrapper.ScriptObj]);
        Any := True;
      except
        Delegate.Value := IUnknown(nil);
        ScriptHandleException(Wrapper.Execution);
      end;
    end;
  end;
  if (not Any) then
    TForm(Sender).OnShow := nil;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsFunctionsShortCutToTextEval(info: TProgramInfo);
// function ShortCutToText(ShortCut: TShortCut): string;
begin
  Info.ResultAsString := ShortCutToText(Info.ParamAsInteger[0]);
end;

procedure TDataModuleUserInterface.dwsUnitControlsFunctionsTextToShortCutEval(info: TProgramInfo);
// function TextToShortCut(const Text: string): TShortCut;
begin
  Info.ResultAsInteger := TextToShortCut(Info.ParamAsString[0]);
end;

// -----------------------------------------------------------------------------
//
// Script: TContainerControl
//
// -----------------------------------------------------------------------------
// Encapsulates a control that can contain other controls.
// I.e. a VCL TWinControl descendant.
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitProjectClassesTContainerControlMethodsGetControlsEval(Info: TProgramInfo; ExtObject: TObject);
// property TContainerControl.Controls: TControlList read GetControls;
// function TContainerControl.GetControls: TControlList;
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, ExtObject);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTContainerControlMethodsGetPaddingEval(Info: TProgramInfo; ExtObject: TObject);
// function TContainerControl.GetPadding: TControlPadding;
// property TContainerControl.Padding: TControlPadding read GetPadding
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TWinControl(TScriptControlWrapper(ExtObject).Item).Padding);
end;

// -----------------------------------------------------------------------------
//
// Script: TControl
//
// -----------------------------------------------------------------------------
// type
//   TControl = class
//   private
//   protected
//   public
////     constructor Create; virtual;
//   published
//     procedure Show;
//     procedure Hide;
////     property Name: string read GetName write SetName;
//     property Left: integer read GetLeft write SetLeft;
//     property Top: integer read GetTop write SetTop;
//     property Width: integer read GetWidth write SetWidth;
//     property Height: integer read GetHeight write SetHeight;
//     property Visible: boolean read GetVisible write SetVisible;
//   end;
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitProjectClassesTControlCleanUp(ExternalObject: TObject);
begin
  ExternalObject.Free;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitProjectClassesTControlMethodsGetHeightEval(Info: TProgramInfo; ExtObject: TObject);
// function TControl.GetHeight: integer;
begin
  Info.ResultAsInteger := TScriptControlWrapper(ExtObject).Item.Height;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitProjectClassesTControlMethodsGetLeftEval(Info: TProgramInfo; ExtObject: TObject);
// function TControl.GetLeft: integer;
begin
  Info.ResultAsInteger := TScriptControlWrapper(ExtObject).Item.Left;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitProjectClassesTControlMethodsGetTextEval(Info: TProgramInfo; ExtObject: TObject);
// function TControl.GetText: string;
begin
  Info.ResultAsString := TControlCracker(TScriptControlWrapper(ExtObject).Item).Text;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitProjectClassesTControlMethodsGetTopEval(Info: TProgramInfo; ExtObject: TObject);
// function TControl.GetTop: integer;
begin
  Info.ResultAsInteger := TScriptControlWrapper(ExtObject).Item.Top;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitProjectClassesTControlMethodsGetVisibleEval(Info: TProgramInfo; ExtObject: TObject);
// function TControl.GetVisible: boolean;
begin
  Info.ResultAsBoolean := TScriptControlWrapper(ExtObject).Item.Visible;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitProjectClassesTControlMethodsGetWidthEval(Info: TProgramInfo; ExtObject: TObject);
// function TControl.GetWidth: integer;
begin
  Info.ResultAsInteger := TScriptControlWrapper(ExtObject).Item.Width;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitProjectClassesTControlMethodsHideEval(Info: TProgramInfo; ExtObject: TObject);
// procedure TControl.Hide;
begin
  TScriptControlWrapper(ExtObject).Item.Hide;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitProjectClassesTControlMethodsSetHeightEval(Info: TProgramInfo; ExtObject: TObject);
// procedure TControl.SetHeight(Value: integer);
begin
  TScriptControlWrapper(ExtObject).Item.Height := Info.ParamAsInteger[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitProjectClassesTControlMethodsSetLeftEval(Info: TProgramInfo; ExtObject: TObject);
// procedure TControl.SetLeft(Value: integer);
begin
  TScriptControlWrapper(ExtObject).Item.Left := Info.ParamAsInteger[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitProjectClassesTControlMethodsSetTextEval(Info: TProgramInfo; ExtObject: TObject);
// procedure TControl.SetText(const Value: string);
begin
  TControlCracker(TScriptControlWrapper(ExtObject).Item).Text := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitProjectClassesTControlMethodsSetTopEval(Info: TProgramInfo; ExtObject: TObject);
// procedure TControl.SetTop(Value: integer);
begin
  TScriptControlWrapper(ExtObject).Item.Top := Info.ParamAsInteger[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitProjectClassesTControlMethodsSetVisibleEval(Info: TProgramInfo; ExtObject: TObject);
// procedure TControl.SetVisible(Value: boolean);
begin
  TScriptControlWrapper(ExtObject).Item.Visible := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitProjectClassesTControlMethodsSetWidthEval(Info: TProgramInfo; ExtObject: TObject);
// procedure TControl.SetWidth(Value: integer);
begin
  TScriptControlWrapper(ExtObject).Item.Width := Info.ParamAsInteger[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsGetClientRectEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultVars.Data := RectToData(TScriptControlWrapper(ExtObject).Item.ClientRect);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsGetColorEval(Info: TProgramInfo; ExtObject: TObject);
// function TControl.GetColor
begin
  Info.ResultAsInteger := TControlCracker(TScriptControlWrapper(ExtObject).Item).Color;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsSetColorEval(Info: TProgramInfo; ExtObject: TObject);
// procedure TControl.SetColor
begin
  TControlCracker(TScriptControlWrapper(ExtObject).Item).Color := Info.ParamAsInteger[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsClickEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TControlCracker(TScriptControlWrapper(ExtObject).Item).Click;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsClientToScreenEval(Info: TProgramInfo; ExtObject: TObject);
var
  Point: TPoint;
begin
  Point := DataToPoint(Info.Params[0].Data);
  Point := TScriptControlWrapper(ExtObject).Item.ClientToScreen(Point);
  Info.ResultVars.Data := PointToData(Point);
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsClientToScreenRectEval(Info: TProgramInfo; ExtObject: TObject);
var
  Rect: TRect;
begin
  Rect := DataToRect(Info.Params[0].Data);
  Rect.TopLeft := TScriptControlWrapper(ExtObject).Item.ClientToScreen(Rect.TopLeft);
  Rect.BottomRight := TScriptControlWrapper(ExtObject).Item.ClientToScreen(Rect.BottomRight);
  Info.ResultVars.Data := RectToData(Rect);
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsScreenToClientEval(Info: TProgramInfo; ExtObject: TObject);
var
  Point: TPoint;
begin
  Point := DataToPoint(Info.Params[0].Data);
  Point := TScriptControlWrapper(ExtObject).Item.ScreenToClient(Point);
  Info.ResultVars.Data := PointToData(Point);
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsScreenToClientRectEval(Info: TProgramInfo; ExtObject: TObject);
var
  Rect: TRect;
begin
  Rect := DataToRect(Info.Params[0].Data);
  Rect.TopLeft := TScriptControlWrapper(ExtObject).Item.ScreenToClient(Rect.TopLeft);
  Rect.BottomRight := TScriptControlWrapper(ExtObject).Item.ScreenToClient(Rect.BottomRight);
  Info.ResultVars.Data := RectToData(Rect);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsGetActionEval(Info: TProgramInfo; ExtObject: TObject);
var
  Action: TBasicAction;
  Wrapper: TScriptObjectWrapperBase;
begin
  Action := TScriptControlWrapper(ExtObject).Item.Action;

  if (Action = nil) then
  begin
    Info.ResultAsVariant := IUnknown(nil);
    exit;
  end;

  Wrapper := Environment(Info).FindWrapper(Action);
  if (Wrapper = nil) then
    Wrapper := TScriptComponentWrapper.Create(Info, Action);
  Info.ResultAsVariant := Wrapper.ScriptObj;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsSetActionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (not Info.Params[0].ValueIsEmpty) then
    TScriptControlWrapper(ExtObject).Item.Action := TAction(TScriptComponentWrapper(Info.Params[0].ExternalObject).Item)
  else
    TScriptControlWrapper(ExtObject).Item.Action := nil;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsGetAlignWithMarginsEval(Info: TProgramInfo; ExtObject: TObject);
// property TControl.AlignWithMargins: boolean read GetAlignWithMargins
// function TControl.GetAlignWithMargins: boolean
begin
  Info.ResultAsBoolean := TControlCracker(TScriptControlWrapper(ExtObject).Item).AlignWithMargins;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsSetAlignWithMarginsEval( Info: TProgramInfo; ExtObject: TObject);
// property TControl.AlignWithMargins: boolean write SetAlignWithMargins
// procedure TControl.SetAlignWithMargins(Value: boolean)
begin
  TScriptControlWrapper(ExtObject).Item.AlignWithMargins := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsGetAutoSizeEval(Info: TProgramInfo; ExtObject: TObject);
// function TControl.GetAutoSize
begin
  Info.ResultAsBoolean := TControlCracker(TScriptControlWrapper(ExtObject).Item).AutoSize;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsSetAutoSizeEval(Info: TProgramInfo; ExtObject: TObject);
// procedure TControl.SetAutoSize
begin
  TControlCracker(TScriptControlWrapper(ExtObject).Item).AutoSize := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsGetBoundsRectEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultVars.Data := RectToData(TScriptControlWrapper(ExtObject).Item.BoundsRect);
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsSetBoundsRectEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptControlWrapper(ExtObject).Item.BoundsRect := DataToRect(Info.Params[0].Data);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsGetCursorEval(Info: TProgramInfo; ExtObject: TObject);
// function TControl.GetCursor
begin
  Info.ResultAsInteger := TScriptControlWrapper(ExtObject).Item.Cursor;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsSetCursorEval(Info: TProgramInfo; ExtObject: TObject);
// procedure TControl.SetCursor
begin
  TScriptControlWrapper(ExtObject).Item.Cursor := Info.ParamAsInteger[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsGetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TScriptControlWrapper(ExtObject).Item.Enabled;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsSetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptControlWrapper(ExtObject).Item.Enabled := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsGetFontEval(Info: TProgramInfo; ExtObject: TObject);
var
  Font: TFont;
begin
  Font := TControlCracker(TScriptControlWrapper(ExtObject).Item).Font;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Font);
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsSetFontEval(Info: TProgramInfo; ExtObject: TObject);
var
  Font: TFont;
begin
  Font := TControlCracker(TScriptControlWrapper(ExtObject).Item).Font;

  Font.Assign(Info.Params[0].ScriptObj.ExternalObject as TFont);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsGetHintEval(Info: TProgramInfo; ExtObject: TObject);
// function TControl.GetHint
begin
  if (TScriptControlWrapper(ExtObject).Item is TcxControl) then
    Info.ResultAsString := TcxControl(TScriptControlWrapper(ExtObject).Item).Hint
  else
    Info.ResultAsString := TScriptControlWrapper(ExtObject).Item.Hint;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsSetHintEval(Info: TProgramInfo; ExtObject: TObject);
// procedure TControl.SetHint
begin
  // Work around for TcxControl/TControl hint problem.
  // TcxControl needs to know when TControl.Hint is changed but since TControl.Hint isn't implemented with a setter
  // it can only do this this by declaring its own Hint property.
  // If we cast the item to a TControl and set the Hint then the TcxControl part of the object doesn't know about the
  // hint value and will not return it when the hint is read again.
  if (TScriptControlWrapper(ExtObject).Item is TcxControl) then
    TcxControl(TScriptControlWrapper(ExtObject).Item).Hint := Info.ParamAsString[0]
  else
    TScriptControlWrapper(ExtObject).Item.Hint := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsGetMarginsEval(Info: TProgramInfo;ExtObject: TObject);
// function TControl.GetMargins: TControlMargins;
// property TControl.Margins: TControlMargin read GetMargins
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TScriptControlWrapper(ExtObject).Item.Margins);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsSetOnClickEval(Info: TProgramInfo; ExtObject: TObject);
begin
  // Attach wrapper's OnClick handler to control's OnClick event
  if (not Info.Params[0].ValueIsEmpty) then
  begin
    Info.Vars['FOnClick'].Value := Info.Params[0].Value;
    TControlCracker(TScriptControlWrapper(ExtObject).Item).OnClick := TScriptControlWrapper(ExtObject).OnClickHandler;
  end else
    TControlCracker(TScriptControlWrapper(ExtObject).Item).OnClick := nil;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsSetOnDblClickEval(Info: TProgramInfo; ExtObject: TObject);
begin
  // Attach wrapper's OnClick handler to control's OnClick event
  if (not Info.Params[0].ValueIsEmpty) then
  begin
    Info.Vars['FOnDblClick'].Value := Info.Params[0].Value;
    TControlCracker(TScriptControlWrapper(ExtObject).Item).OnDblClick := TScriptControlWrapper(ExtObject).OnDblClickHandler;
  end else
    TControlCracker(TScriptControlWrapper(ExtObject).Item).OnDblClick := nil;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsSetOnEnterEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (not (TScriptControlWrapper(ExtObject).Item is TWinControl)) then
    exit;

  // Attach modules's event handler to control's event event
  if (not Info.Params[0].ValueIsEmpty) then
  begin
    Info.Vars['FOnEnter'].Value := Info.Params[0].Value;
    TWinControlCracker(TScriptControlWrapper(ExtObject).Item).OnEnter := OnEnterHandler;
  end else
    TWinControlCracker(TScriptControlWrapper(ExtObject).Item).OnEnter := nil;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsSetOnExitEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (not (TScriptControlWrapper(ExtObject).Item is TWinControl)) then
    exit;

  // Attach modules's event handler to control's event event
  if (not Info.Params[0].ValueIsEmpty) then
  begin
    Info.Vars['FOnExit'].Value := Info.Params[0].Value;
    TWinControlCracker(TScriptControlWrapper(ExtObject).Item).OnExit := OnExitHandler;
  end else
    TWinControlCracker(TScriptControlWrapper(ExtObject).Item).OnExit := nil;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsSetOnKeypressEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (not (TScriptControlWrapper(ExtObject).Item is TWinControl)) then
    exit;

  // Attach modules's event handler to control's event event
  if (not Info.Params[0].ValueIsEmpty) then
  begin
    Info.Vars['FOnKeyPress'].Value := Info.Params[0].Value;
    TWinControlCracker(TScriptControlWrapper(ExtObject).Item).OnKeyPress := OnKeyPressHandler;
  end else
    TWinControlCracker(TScriptControlWrapper(ExtObject).Item).OnKeyPress := nil;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsGetParentFontEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TControlCracker(TScriptControlWrapper(ExtObject).Item).ParentFont;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsSetParentFontEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TControlCracker(TScriptControlWrapper(ExtObject).Item).ParentFont := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsGetParentShowHintEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TControlCracker(TScriptControlWrapper(ExtObject).Item).ParentShowHint;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsSetParentShowHintEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TControlCracker(TScriptControlWrapper(ExtObject).Item).ParentShowHint := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsGetShowHintEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TControlCracker(TScriptControlWrapper(ExtObject).Item).ShowHint;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsSetShowHintEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TControlCracker(TScriptControlWrapper(ExtObject).Item).ShowHint := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsGetParentBackgroundEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TWinControlCracker(TScriptControlWrapper(ExtObject).WinControl).ParentBackground;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsSetParentBackgroundEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TWinControlCracker(TScriptControlWrapper(ExtObject).WinControl).ParentBackground := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsGetParentColorEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TControlCracker(TScriptControlWrapper(ExtObject).Item).ParentColor;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsSetParentColorEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TControlCracker(TScriptControlWrapper(ExtObject).Item).ParentColor := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsGetTabStopEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (TScriptControlWrapper(ExtObject).Item is TWinControl) then
    Info.ResultAsBoolean := TWinControl(TScriptControlWrapper(ExtObject).Item).TabStop
  else
    Info.ResultAsBoolean := False;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsSetTabStopEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (TScriptControlWrapper(ExtObject).Item is TWinControl) then
    TWinControl(TScriptControlWrapper(ExtObject).Item).TabStop := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsGetUserInterfaceAutomationEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := IUnknown(nil);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsInvalidateEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptControlWrapper(ExtObject).Item.Invalidate;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsRefreshEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptControlWrapper(ExtObject).Item.Refresh;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsRepaintEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptControlWrapper(ExtObject).Item.Repaint;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsUpdateEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptControlWrapper(ExtObject).Item.Update;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlMethodsGetConstraintsEval(Info: TProgramInfo; ExtObject: TObject);
// function TControl.GetConstraints: TSizeConstraints;
// property TControl.Constraints: TSizeConstraints read GetConstraints;
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TScriptControlWrapper(ExtObject).Item.Constraints);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitProjectClassesTControlMethodsShowEval(Info: TProgramInfo; ExtObject: TObject);
// procedure TControl.Show;
begin
  TScriptControlWrapper(ExtObject).Item.Show;
end;


// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitProjectClassesTControlMethodsGetAlignEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TScriptControlWrapper(ExtObject).Item.Align);
end;

procedure TDataModuleUserInterface.dwsUnitProjectClassesTControlMethodsSetAlignEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptControlWrapper(ExtObject).Item.Align := TAlign(Info.ParamAsInteger[0]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitProjectClassesTControlMethodsGetParentEval(Info: TProgramInfo; ExtObject: TObject);
var
  Parent: TControl;
  Wrapper: TScriptObjectWrapperBase;
begin
  Parent := TScriptControlWrapper(ExtObject).Item.Parent;
  if (Parent <> nil) then
  begin
    Wrapper := Environment(Info).FindWrapper(Parent);
    if (Wrapper = nil) then
      Wrapper := TScriptControlWrapper.Create(Info, Parent);
    Info.ResultAsVariant := Wrapper.ScriptObj;
  end else
    Info.ResultAsVariant := IUnknown(nil);
end;

procedure TDataModuleUserInterface.dwsUnitProjectClassesTControlMethodsSetParentEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (Info.ParamAsScriptObj[0] <> nil) then
    TScriptControlWrapper(ExtObject).Item.Parent := (Info.ParamAsObject[0] as TScriptControlWrapper).Item as TWinControl
  else
    TScriptControlWrapper(ExtObject).Item.Parent := nil;
end;


// -----------------------------------------------------------------------------
//
// Script: TControlOffset
//
// -----------------------------------------------------------------------------
// Wraps TMargin
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlOffsetMethodsSetBoundsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TMargins(ExtObject).SetBounds(Info.Params[0].ValueAsInteger, Info.Params[1].ValueAsInteger, Info.Params[2].ValueAsInteger, Info.Params[3].ValueAsInteger);
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlOffsetMethodsSetBottomEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TMargins(ExtObject).Bottom := Info.Params[0].ValueAsInteger;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlOffsetMethodsSetLeftEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TMargins(ExtObject).Left := Info.Params[0].ValueAsInteger;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlOffsetMethodsSetRightEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TMargins(ExtObject).Right := Info.Params[0].ValueAsInteger;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlOffsetMethodsSetTopEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TMargins(ExtObject).Top := Info.Params[0].ValueAsInteger;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlOffsetMethodsGetBottomEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TMargins(ExtObject).Bottom;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlOffsetMethodsGetLeftEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TMargins(ExtObject).Left;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlOffsetMethodsGetRightEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TMargins(ExtObject).Right;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTControlOffsetMethodsGetTopEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TMargins(ExtObject).Top;
end;

// -----------------------------------------------------------------------------
//
// Script: TCustomForm
//
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomFormConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
var
  Form: TForm;
begin
  Form := TScriptForm.CreateNew(nil);
  Form.DefaultMonitor := dmMainForm;
  Form.Position := poMainFormCenter;
  Form.ParentFont := True;
  Form.ShowHint := True;

  ExtObject := TScriptControlWrapper.Create(Info.ScriptObj, Form, True);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomFormMethodsCloseEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TForm(TScriptControlWrapper(ExtObject).Item).Close;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomFormMethodsGetActiveEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TForm(TScriptControlWrapper(ExtObject).Item).Active;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomFormMethodsGetBorderStyleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TForm(TScriptControlWrapper(ExtObject).Item).BorderStyle);
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomFormMethodsSetBorderStyleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TForm(TScriptControlWrapper(ExtObject).Item).BorderStyle := TFormBorderStyle(Info.Params[0].ValueAsInteger);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomFormMethodsGetKeyPreviewEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TForm(TScriptControlWrapper(ExtObject).Item).KeyPreview;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomFormMethodsSetKeyPreviewEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TForm(TScriptControlWrapper(ExtObject).Item).KeyPreview := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomFormMethodsGetModalResultEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TForm(TScriptControlWrapper(ExtObject).Item).ModalResult;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomFormMethodsSetModalResultEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TForm(TScriptControlWrapper(ExtObject).Item).ModalResult := Info.Params[0].ValueAsInteger;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomFormMethodsSetOnShowEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (not (TScriptControlWrapper(ExtObject).Item is TForm)) then
    exit;

  // Attach modules's event handler to control's event event
  if (not Info.Params[0].ValueIsEmpty) then
  begin
    Info.Vars['FOnShow'].Value := Info.Params[0].Value;

    TForm(TScriptControlWrapper(ExtObject).Item).OnShow := OnShowHandler;
  end else
    TForm(TScriptControlWrapper(ExtObject).Item).OnShow := nil;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomFormMethodsGetPositionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TForm(TScriptControlWrapper(ExtObject).Item).Position);
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomFormMethodsSetPositionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TForm(TScriptControlWrapper(ExtObject).Item).Position := TPosition(Info.Params[0].ValueAsInteger);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomFormMethodsGetStayOnTopEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := (TForm(TScriptControlWrapper(ExtObject).Item).FormStyle = fsStayOnTop);
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomFormMethodsSetStayOnTopEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (Info.Params[0].ValueAsBoolean) then
    TForm(TScriptControlWrapper(ExtObject).Item).FormStyle := fsStayOnTop
  else
    TForm(TScriptControlWrapper(ExtObject).Item).FormStyle := fsNormal;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomFormMethodsGetWindowStateEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TForm(TScriptControlWrapper(ExtObject).Item).WindowState);
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomFormMethodsSetWindowStateEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TForm(TScriptControlWrapper(ExtObject).Item).WindowState := TWindowState(Info.Params[0].ValueAsInteger);
end;

// -----------------------------------------------------------------------------
//
// Script: TForm
//
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitControlsClassesTFormMethodsSetOnAfterShowEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (not (TScriptControlWrapper(ExtObject).Item is TScriptForm)) then
    exit;

  // Attach modules's event handler to control's event event
  if (not Info.Params[0].ValueIsEmpty) then
  begin
    Info.Vars['FOnAfterShow'].Value := Info.Params[0].Value;

    TScriptForm(TScriptControlWrapper(ExtObject).Item).OnAfterShow := OnAfterShowHandler;
  end else
    TScriptForm(TScriptControlWrapper(ExtObject).Item).OnAfterShow := nil;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitProjectClassesTCustomFormMethodsShowModalEval(Info: TProgramInfo; ExtObject: TObject);
// function TForm.ShowModal: integer;
begin
  Info.ResultAsInteger := (TScriptControlWrapper(ExtObject).Item as TForm).ShowModal;
end;

// -----------------------------------------------------------------------------
//
// Script: TGroupBox
//
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitControlsClassesTGroupBoxConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TScriptControlWrapper.CreateOwned(Info, Info.ScriptObj, TcxGroupBox);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTGroupBoxMethodsGetAlignmentEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TcxGroupBox(TScriptControlWrapper(ExtObject).Item).Alignment);
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTGroupBoxMethodsSetAlignmentEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxGroupBox(TScriptControlWrapper(ExtObject).Item).Alignment := TcxCaptionAlignment(Info.Params[0].ValueAsInteger);
end;

// -----------------------------------------------------------------------------
//
// Script: TCheckGroup
//
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitControlsClassesTCheckGroupConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TScriptControlWrapper.CreateOwned(Info, Info.ScriptObj, TcxCheckGroup);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCheckGroupMethodsGetStateEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TcxCheckGroup(TScriptControlWrapper(ExtObject).Item).States[Info.ParamAsInteger[0]]);
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCheckGroupMethodsSetStateEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxCheckGroup(TScriptControlWrapper(ExtObject).Item).States[Info.ParamAsInteger[0]] := TcxCheckBoxState(Info.ParamAsInteger[1]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCheckGroupMethodsGetAllowGrayedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TcxCheckGroup(TScriptControlWrapper(ExtObject).Item).Properties.AllowGrayed;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCheckGroupMethodsSetAllowGrayedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxCheckGroup(TScriptControlWrapper(ExtObject).Item).Properties.AllowGrayed := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCheckGroupMethodsGetCheckedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := (TcxCheckGroup(TScriptControlWrapper(ExtObject).Item).States[Info.ParamAsInteger[0]] = cbsChecked);
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCheckGroupMethodsSetCheckedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (Info.ParamAsBoolean[0]) then
    TcxCheckGroup(TScriptControlWrapper(ExtObject).Item).States[Info.ParamAsInteger[0]] := cbsChecked
  else
    TcxCheckGroup(TScriptControlWrapper(ExtObject).Item).States[Info.ParamAsInteger[0]] := cbsUnchecked;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCheckGroupMethodsGetLeftJustifyEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := (TcxCheckGroup(TScriptControlWrapper(ExtObject).Item).Properties.ItemAlignment = taLeftJustify);
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCheckGroupMethodsSetLeftJustifyEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (Info.ParamAsBoolean[0]) then
    TcxCheckGroup(TScriptControlWrapper(ExtObject).Item).Properties.ItemAlignment := taLeftJustify
  else
    TcxCheckGroup(TScriptControlWrapper(ExtObject).Item).Properties.ItemAlignment := taRightJustify;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCheckGroupMethodsGetItemsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TcxCheckGroup(TScriptControlWrapper(ExtObject).Item).Properties.Items);
end;

// -----------------------------------------------------------------------------
//
// Script: TCheckGroupItems
//
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitControlsClassesTCheckGroupItemsMethodsAddEval(Info: TProgramInfo; ExtObject: TObject);
var
  Item: TCollectionItem;
begin
  Item := TCollection(ExtObject).Add;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Item);
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCheckGroupItemsMethodsGetItemEval(Info: TProgramInfo; ExtObject: TObject);
var
  Item: TCollectionItem;
begin
  Item := TCollection(ExtObject).Items[Info.ParamAsInteger[0]];
  Info.ResultAsVariant := CreateResultScriptObject(Info, Item);
end;

// -----------------------------------------------------------------------------
//
// Script: TCaptionCollectionItem
//
// -----------------------------------------------------------------------------
// Wraps TcxCaptionItem
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitControlsClassesTCaptionCollectionItemMethodsGetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  // Casting to TcxCheckGroupItem to gain access top protected TcxCaptionItem members
  Info.ResultAsString := TcxCheckGroupItem(ExtObject).Caption;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCaptionCollectionItemMethodsSetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxCheckGroupItem(ExtObject).Caption := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCaptionCollectionItemMethodsGetTagEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TcxCheckGroupItem(ExtObject).Tag;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCaptionCollectionItemMethodsSetTagEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxCheckGroupItem(ExtObject).Tag := Info.ParamAsInteger[0];
end;

// -----------------------------------------------------------------------------
//
// Script: TCheckGroupItem
//
// -----------------------------------------------------------------------------
// Wraps TcxCheckGroupItem
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitControlsClassesTCheckGroupItemMethodsGetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TcxCheckGroupItem(ExtObject).Enabled;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCheckGroupItemMethodsSetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxCheckGroupItem(ExtObject).Enabled := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------
//
// Script: TSizeConstraints
//
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitControlsClassesTSizeConstraintsMethodsGetConstraintEval(Info: TProgramInfo; ExtObject: TObject);
var
  Index: integer;
begin
  Index := Info.Params[0].ValueAsInteger;
  case Index of
    0: Info.ResultAsInteger := TSizeConstraints(ExtObject).MaxHeight;
    1: Info.ResultAsInteger := TSizeConstraints(ExtObject).MaxWidth;
    2: Info.ResultAsInteger := TSizeConstraints(ExtObject).MinHeight;
    3: Info.ResultAsInteger := TSizeConstraints(ExtObject).MinWidth;
  end;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTSizeConstraintsMethodsSetConstraintEval(Info: TProgramInfo; ExtObject: TObject);
var
  Index: integer;
  Value: integer;
begin
  Index := Info.Params[0].ValueAsInteger;
  Value := Info.Params[1].ValueAsInteger;
  case Index of
    0: TSizeConstraints(ExtObject).MaxHeight := Value;
    1: TSizeConstraints(ExtObject).MaxWidth := Value;
    2: TSizeConstraints(ExtObject).MinHeight := Value;
    3: TSizeConstraints(ExtObject).MinWidth := Value;
  end;
end;

// -----------------------------------------------------------------------------
//
// Script: TControlList
//
// -----------------------------------------------------------------------------
// type
//   TControlList = class
//   private
//   protected
//   public
//     constructor Create(const ClassName: string);
//     procedure Clear;
//   published
//     property Items[Index: integer]: TControl read GetItem;
//     property Count: integer read GetCount;
//   end;
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitProjectClassesTControlListMethodsClearEval(Info: TProgramInfo; ExtObject: TObject);
// procedure TControlList.Clear;
var
  i: integer;
begin
  if (TScriptControlWrapper(ExtObject).Item is TWinControl) then
    for i := TWinControl(TScriptControlWrapper(ExtObject).Item).ControlCount-1 downto 0 do
      TWinControl(TScriptControlWrapper(ExtObject).Item).Controls[i].Free;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitProjectClassesTControlListMethodsGetCountEval(Info: TProgramInfo; ExtObject: TObject);
// function TControlList.GetCount: integer;
begin
  if (TScriptControlWrapper(ExtObject).Item is TWinControl) then
    Info.ResultAsInteger := TWinControl(TScriptControlWrapper(ExtObject).Item).ControlCount
  else
    Info.ResultAsInteger := 0;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitProjectClassesTControlListMethodsGetItemEval(Info: TProgramInfo; ExtObject: TObject);
// function TControlList.GetItem(Index: integer): TControl;
var
  Child: TControl;
  Wrapper: TScriptObjectWrapperBase;
begin
  if (TScriptControlWrapper(ExtObject).Item is TWinControl) then
  begin
    Child := TWinControl(TScriptControlWrapper(ExtObject).Item).Controls[Info.ParamAsInteger[0]];

    Wrapper := Environment(Info).FindWrapper(Child);
    if (Wrapper = nil) then
      Wrapper := TScriptControlWrapper.Create(Info, Child);
    Info.ResultAsVariant := Wrapper.ScriptObj;
  end else
    Info.ResultAsVariant := IUnknown(nil);
end;

// -----------------------------------------------------------------------------
//
// Script: TCustomControl
//
// -----------------------------------------------------------------------------
// Wraps VCL TCustomControl
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomControlMethodsCanFocusEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TScriptControlWrapper(ExtObject).WinControl.CanFocus;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomControlMethodsFocusedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TScriptControlWrapper(ExtObject).WinControl.Focused;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomControlMethodsGetHandleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TScriptControlWrapper(ExtObject).WinControl.Handle;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomControlMethodsPostMessageEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := PostMessage(Info.ParamAsInteger[0], Info.ParamAsInteger[1], Info.ParamAsInteger[2], Info.ParamAsInteger[3]);
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomControlMethodsPostMessageSelfEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := PostMessage(TScriptControlWrapper(ExtObject).WinControl.Handle, Info.ParamAsInteger[0], Info.ParamAsInteger[1], Info.ParamAsInteger[2]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomControlMethodsSetFocusEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptControlWrapper(ExtObject).WinControl.SetFocus;
end;


// -----------------------------------------------------------------------------
//
// Script: TEdit
//
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitProjectClassesTEditControlConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TScriptControlWrapper.CreateOwned(Info, Info.ScriptObj, TcxTextEdit);
end;


// -----------------------------------------------------------------------------
//
// Script: TLabel
//
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitControlsClassesTLabelConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TScriptControlWrapper.CreateOwned(Info, Info.ScriptObj, TcxLabel);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTLabelMethodsGetShowAccelCharEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TcxLabel(TScriptControlWrapper(ExtObject).Item).Properties.ShowAccelChar;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTLabelMethodsSetShowAccelCharEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxLabel(TScriptControlWrapper(ExtObject).Item).Properties.ShowAccelChar := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTLabelMethodsGetShowEndEllipsisEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TcxLabel(TScriptControlWrapper(ExtObject).Item).Properties.ShowEndEllipsis;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTLabelMethodsSetShowEndEllipsisEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxLabel(TScriptControlWrapper(ExtObject).Item).Properties.ShowEndEllipsis := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTLabelMethodsGetTransparentEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TcxLabel(TScriptControlWrapper(ExtObject).Item).Properties.Transparent;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTLabelMethodsSetTransparentEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxLabel(TScriptControlWrapper(ExtObject).Item).Properties.Transparent := Info.Params[0].ValueAsBoolean;
end;


// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTLabelMethodsGetWordWrapEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TcxLabel(TScriptControlWrapper(ExtObject).Item).Properties.WordWrap;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTLabelMethodsSetWordWrapEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxLabel(TScriptControlWrapper(ExtObject).Item).Properties.WordWrap := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------
//
// Script: TPanel
//
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitControlsClassesTPanelConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TScriptControlWrapper.CreateOwned(Info, Info.ScriptObj, TPanel);
  TPanel(ExtObject).FullRepaint := False;
end;

// -----------------------------------------------------------------------------
//
// Script: TCustomEdit
//
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomEditMethodsGetAlignmentEval(Info: TProgramInfo; ExtObject: TObject);
begin
  // Validate control type since this is an abstract script base class and descendants might
  // accidentally use a different control base class.
  ASSERT(TScriptControlWrapper(ExtObject).Item is TcxCustomEdit);

  // Wrap owner object - not TAlignment object
  Info.ResultAsVariant := CreateResultScriptObject(Info, ExtObject);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomEditMethodsGetButtonsEval(Info: TProgramInfo; ExtObject: TObject);
var
  Buttons: TObject;
begin
  Buttons := TcxCustomTextEdit(TScriptControlWrapper(ExtObject).Item).Properties.Buttons;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Buttons);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomEditMethodsGetReadOnlyEval(Info: TProgramInfo; ExtObject: TObject);
begin
  // Validate control type since this is an abstract script base class and descendants might
  // accidentally use a different control base class.
  ASSERT(TScriptControlWrapper(ExtObject).Item is TcxCustomEdit);

  Info.ResultAsBoolean := TcxCustomTextEdit(TScriptControlWrapper(ExtObject).Item).Properties.ReadOnly;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomEditMethodsSetReadOnlyEval(Info: TProgramInfo; ExtObject: TObject);
begin
  // Validate control type since this is an abstract script base class and descendants might
  // accidentally use a different control base class.
  ASSERT(TScriptControlWrapper(ExtObject).Item is TcxCustomEdit);

  TcxCustomTextEdit(TScriptControlWrapper(ExtObject).Item).Properties.ReadOnly := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomEditMethodsSetOnButtonClickEval(Info: TProgramInfo; ExtObject: TObject);
begin
  // Validate control type since this is an abstract script base class and descendants might
  // accidentally use a different control base class.
  ASSERT(TScriptControlWrapper(ExtObject).Item is TcxCustomEdit);

  // Attach modules's event handler to control's event event
  if (not Info.Params[0].ValueIsEmpty) then
  begin
    Info.Vars['FOnButtonClick'].Value := Info.Params[0].Value;
    TcxCustomEditCracker(TScriptControlWrapper(ExtObject).Item).Properties.OnButtonClick := OnEditButtonClickHandler;
  end else
    TcxCustomEditCracker(TScriptControlWrapper(ExtObject).Item).Properties.OnButtonClick := nil;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomEditMethodsSetOnChangedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  // Validate control type since this is an abstract script base class and descendants might
  // accidentally use a different control base class.
  ASSERT(TScriptControlWrapper(ExtObject).Item is TcxCustomEdit);

  // Attach modules's event handler to control's event event
  if (not Info.Params[0].ValueIsEmpty) then
  begin
    Info.Vars['FOnChanged'].Value := Info.Params[0].Value;
    TcxCustomEditCracker(TScriptControlWrapper(ExtObject).Item).Properties.OnEditValueChanged := OnChangedHandler;
  end else
    TcxCustomEditCracker(TScriptControlWrapper(ExtObject).Item).Properties.OnEditValueChanged := nil;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomEditMethodsSetOnChangeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  // Validate control type since this is an abstract script base class and descendants might
  // accidentally use a different control base class.
  ASSERT(TScriptControlWrapper(ExtObject).Item is TcxCustomEdit);

  // Attach modules's event handler to control's event event
  if (not Info.Params[0].ValueIsEmpty) then
  begin
    Info.Vars['FOnChange'].Value := Info.Params[0].Value;
    TcxCustomEditCracker(TScriptControlWrapper(ExtObject).Item).Properties.OnChange := OnChangeHandler;
  end else
    TcxCustomEditCracker(TScriptControlWrapper(ExtObject).Item).Properties.OnChange := nil;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomEditMethodsGetTextHintEval(Info: TProgramInfo; ExtObject: TObject);
begin
  // Validate control type since this is an abstract script base class and descendants might
  // accidentally use a different control base class.
  ASSERT(TScriptControlWrapper(ExtObject).Item is TcxCustomTextEdit);

  Info.ResultAsString := TcxCustomTextEditCracker(TScriptControlWrapper(ExtObject).Item).TextHint;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomEditMethodsSetTextHintEval(Info: TProgramInfo; ExtObject: TObject);
begin
  // Validate control type since this is an abstract script base class and descendants might
  // accidentally use a different control base class.
  ASSERT(TScriptControlWrapper(ExtObject).Item is TcxCustomTextEdit);

  TcxCustomTextEditCracker(TScriptControlWrapper(ExtObject).Item).TextHint := Info.Params[0].ValueAsString;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomEditMethodsGetUseLeftAlignmentOnEditingEval(Info: TProgramInfo; ExtObject: TObject);
begin
  // Validate control type since this is an abstract script base class and descendants might
  // accidentally use a different control base class.
  ASSERT(TScriptControlWrapper(ExtObject).Item is TcxCustomTextEdit);

  Info.ResultAsBoolean := TcxCustomTextEdit(TScriptControlWrapper(ExtObject).Item).Properties.UseLeftAlignmentOnEditing;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomEditMethodsSetUseLeftAlignmentOnEditingEval(Info: TProgramInfo; ExtObject: TObject);
begin
  // Validate control type since this is an abstract script base class and descendants might
  // accidentally use a different control base class.
  ASSERT(TScriptControlWrapper(ExtObject).Item is TcxCustomTextEdit);

  TcxCustomTextEdit(TScriptControlWrapper(ExtObject).Item).Properties.UseLeftAlignmentOnEditing := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------
//
// Script: TCustomTextEdit
//
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomTextEditMethodsGetCharCaseEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxCustomTextEdit(TScriptControlWrapper(ExtObject).Item).Properties.CharCase := TEditCharCase(Info.ParamAsInteger[0]);
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomTextEditMethodsSetCharCaseEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TcxCustomTextEdit(TScriptControlWrapper(ExtObject).Item).Properties.CharCase);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomTextEditMethodsGetDisplayFormatEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxCustomTextEdit(TScriptControlWrapper(ExtObject).Item).Properties.DisplayFormat := Info.ParamAsString[0];
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomTextEditMethodsSetDisplayFormatEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TcxCustomTextEdit(TScriptControlWrapper(ExtObject).Item).Properties.DisplayFormat;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomTextEditMethodsGetEditFormatEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxCustomTextEdit(TScriptControlWrapper(ExtObject).Item).Properties.EditFormat := Info.ParamAsString[0];
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomTextEditMethodsSetEditFormatEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TcxCustomTextEdit(TScriptControlWrapper(ExtObject).Item).Properties.EditFormat;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomTextEditMethodsGetIncrementalSearchEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TcxCustomTextEdit(TScriptControlWrapper(ExtObject).Item).Properties.IncrementalSearch;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomTextEditMethodsSetIncrementalSearchEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxCustomTextEdit(TScriptControlWrapper(ExtObject).Item).Properties.IncrementalSearch := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomTextEditMethodsGetLookupItemsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TcxCustomTextEdit(TScriptControlWrapper(ExtObject).Item).Properties.LookupItems);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomTextEditMethodsGetLookupItemsSortedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TcxCustomTextEdit(TScriptControlWrapper(ExtObject).Item).Properties.LookupItemsSorted;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomTextEditMethodsSetLookupItemsSortedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxCustomTextEdit(TScriptControlWrapper(ExtObject).Item).Properties.LookupItemsSorted := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomTextEditMethodsGetMaxValueEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := TcxCustomTextEditCracker(TScriptControlWrapper(ExtObject).Item).Properties.MaxValue;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomTextEditMethodsSetMaxValueEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxCustomTextEditCracker(TScriptControlWrapper(ExtObject).Item).Properties.MaxValue := Info.ParamAsFloat[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomTextEditMethodsGetMinValueEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := TcxCustomTextEditCracker(TScriptControlWrapper(ExtObject).Item).Properties.MinValue;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomTextEditMethodsSetMinValueEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxCustomTextEditCracker(TScriptControlWrapper(ExtObject).Item).Properties.MinValue := Info.ParamAsFloat[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomTextEditMethodsGetPasswordCharEval(Info: TProgramInfo; ExtObject: TObject);
var
  c: char;
begin
  c := TcxCustomTextEdit(TScriptControlWrapper(ExtObject).Item).Properties.PasswordChar;
  if (c <> #0) then
    Info.ResultAsString := c
  else
    Info.ResultAsString := '';
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCustomTextEditMethodsSetPasswordCharEval(Info: TProgramInfo; ExtObject: TObject);
var
  s: string;
begin
  s := Info.ParamAsString[0];
  if (s <> '') then
  begin
    TcxCustomTextEdit(TScriptControlWrapper(ExtObject).Item).Properties.PasswordChar := s[1];
    TcxCustomTextEdit(TScriptControlWrapper(ExtObject).Item).Properties.EchoMode := eemPassword;
  end else
  begin
    TcxCustomTextEdit(TScriptControlWrapper(ExtObject).Item).Properties.PasswordChar := #0;
    TcxCustomTextEdit(TScriptControlWrapper(ExtObject).Item).Properties.EchoMode := eemNormal;
  end;
end;

// -----------------------------------------------------------------------------
//
// Script: TEditAlignment
//
// -----------------------------------------------------------------------------
// Wraps the TCustomEdit.Alignment "object"
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitControlsClassesTEditAlignmentMethodsGetHorzEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TcxCustomEditCracker(TScriptControlWrapper(ExtObject).Item).Properties.Alignment.Horz);
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTEditAlignmentMethodsSetHorzEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxCustomEditCracker(TScriptControlWrapper(ExtObject).Item).Properties.Alignment.Horz := TAlignment(Info.Params[0].ValueAsInteger);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTEditAlignmentMethodsGetVertEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TcxCustomEditCracker(TScriptControlWrapper(ExtObject).Item).Properties.Alignment.Vert);
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTEditAlignmentMethodsSetVertEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxCustomEditCracker(TScriptControlWrapper(ExtObject).Item).Properties.Alignment.Vert := TcxEditVertAlignment(Info.Params[0].ValueAsInteger);
end;

// -----------------------------------------------------------------------------
//
// Script: TEditButtons
//
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitControlsClassesTEditButtonsMethodsAddEval(Info: TProgramInfo; ExtObject: TObject);
var
  Button: TcxEditButton;
begin
  Button := TcxEditButtons(ExtObject).Add;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Button);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTEditButtonsMethodsGetItemEval(Info: TProgramInfo; ExtObject: TObject);
var
  Button: TcxEditButton;
begin
  Button := TcxEditButtons(ExtObject).Items[Info.ParamAsInteger[0]];
  Info.ResultAsVariant := CreateResultScriptObject(Info, Button);
end;

// -----------------------------------------------------------------------------
//
// Script: TEditButton
//
// -----------------------------------------------------------------------------
// I think we can use the following to find edit control from button - quite a hack
//  Edit := TcxCustomEdit(TcxCustomEditProperties(TcxEditButtons(TcxEditButton(ExtObject).Collection).Owner).Owner);
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitControlsClassesTEditButtonMethodsGetActionEval(Info: TProgramInfo; ExtObject: TObject);
var
  Action: TBasicAction;
  Wrapper: TScriptObjectWrapperBase;
begin
  Action := TcxEditButton(ExtObject).Action;

  if (Action = nil) then
  begin
    Info.ResultAsVariant := IUnknown(nil);
    exit;
  end;

  Wrapper := Environment(Info).FindWrapper(Action);
  if (Wrapper = nil) then
    Wrapper := TScriptComponentWrapper.Create(Info, Action);
  Info.ResultAsVariant := Wrapper.ScriptObj;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTEditButtonMethodsSetActionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (not Info.Params[0].ValueIsEmpty) then
    TcxEditButton(ExtObject).Action := TAction(TScriptComponentWrapper(Info.Params[0].ExternalObject).Item)
  else
    TcxEditButton(ExtObject).Action := nil;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTEditButtonMethodsGetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TcxEditButton(ExtObject).Caption;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTEditButtonMethodsSetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxEditButton(ExtObject).Caption := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTEditButtonMethodsGetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TcxEditButton(ExtObject).Enabled;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTEditButtonMethodsSetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxEditButton(ExtObject).Enabled := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTEditButtonMethodsGetHintEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TcxEditButton(ExtObject).Hint;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTEditButtonMethodsSetHintEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxEditButton(ExtObject).Hint := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTEditButtonMethodsGetImageIndexEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TcxEditButton(ExtObject).ImageIndex;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTEditButtonMethodsSetImageIndexEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxEditButton(ExtObject).ImageIndex := Info.ParamAsInteger[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTEditButtonMethodsGetKindEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TcxEditButton(ExtObject).Kind);
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTEditButtonMethodsSetKindEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxEditButton(ExtObject).Kind := TcxEditButtonKind(Info.ParamAsInteger[0]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTEditButtonMethodsGetLeftAlignmentEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TcxEditButton(ExtObject).LeftAlignment;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTEditButtonMethodsSetLeftAlignmentEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxEditButton(ExtObject).LeftAlignment := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTEditButtonMethodsGetTextAlignmentEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TcxEditButton(ExtObject).ContentAlignment);
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTEditButtonMethodsSetTextAlignmentEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxEditButton(ExtObject).ContentAlignment := TAlignment(Info.ParamAsInteger[0]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTEditButtonMethodsGetVisibleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TcxEditButton(ExtObject).Visible;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTEditButtonMethodsSetVisibleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxEditButton(ExtObject).Visible := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTEditButtonMethodsGetWidthEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TcxEditButton(ExtObject).Width;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTEditButtonMethodsSetWidthEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxEditButton(ExtObject).Width := Info.ParamAsInteger[0];
end;

// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitControlsClassesTEditButtonMethodsGetGlyphEval(Info: TProgramInfo; ExtObject: TObject);
var
  Bitmap: TdxCustomSmartImage;
begin
  Bitmap := TcxEditButton(ExtObject).Glyph;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Bitmap);
end;

// -----------------------------------------------------------------------------
//
// Script: TDateEdit
//
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitControlsClassesTDateEditConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TScriptControlWrapper.CreateOwned(Info, Info.ScriptObj, TcxDateEdit);
  TcxDateEdit(TScriptControlWrapper(ExtObject).Item).Properties.Kind := ckDate;
  TcxDateEdit(TScriptControlWrapper(ExtObject).Item).Properties.InputKind := ikStandard;
  TcxDateEdit(TScriptControlWrapper(ExtObject).Item).Properties.SaveTime := False;
  TcxDateEdit(TScriptControlWrapper(ExtObject).Item).Properties.ShowTime := False;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTDateEditMethodsGetValueEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := TcxDateEdit(TScriptControlWrapper(ExtObject).Item).Date;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTDateEditMethodsSetValueEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxDateEdit(TScriptControlWrapper(ExtObject).Item).Date := Info.Params[0].ValueAsFloat;
end;

// -----------------------------------------------------------------------------
//
// Script: TSpinEdit
//
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitControlsClassesTSpinEditConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TScriptControlWrapper.CreateOwned(Info, Info.ScriptObj, TcxSpinEdit);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTSpinEditMethodsGetIncrementEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := TcxSpinEdit(TScriptControlWrapper(ExtObject).Item).Properties.Increment;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTSpinEditMethodsSetIncrementEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxSpinEdit(TScriptControlWrapper(ExtObject).Item).Properties.Increment := Info.ParamAsFloat[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTSpinEditMethodsGetLargeIncrementEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := TcxSpinEdit(TScriptControlWrapper(ExtObject).Item).Properties.LargeIncrement;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTSpinEditMethodsSetLargeIncrementEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxSpinEdit(TScriptControlWrapper(ExtObject).Item).Properties.LargeIncrement := Info.ParamAsFloat[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTSpinEditMethodsGetValueTypeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TcxSpinEdit(TScriptControlWrapper(ExtObject).Item).Properties.ValueType);
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTSpinEditMethodsSetValueTypeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxSpinEdit(TScriptControlWrapper(ExtObject).Item).Properties.ValueType := TcxSpinEditValueType(Info.ParamAsInteger[0]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTSpinEditMethodsGetValueEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := TcxSpinEdit(TScriptControlWrapper(ExtObject).Item).Value;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTSpinEditMethodsSetValueEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxSpinEdit(TScriptControlWrapper(ExtObject).Item).Value := Info.ParamAsFloat[0];
end;

// -----------------------------------------------------------------------------
//
// Script: TNumberEdit
//
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitControlsClassesTNumberEditConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TScriptControlWrapper.CreateOwned(Info, Info.ScriptObj, TcxCurrencyEdit);
  TcxCurrencyEdit(TScriptControlWrapper(ExtObject).Item).Properties.Alignment.Horz := taRightJustify;
  TcxCurrencyEdit(TScriptControlWrapper(ExtObject).Item).Properties.UseLeftAlignmentOnEditing := False;
  TcxCurrencyEdit(TScriptControlWrapper(ExtObject).Item).Properties.DisplayFormat := ',0.00;-,0.00';
  TcxCurrencyEdit(TScriptControlWrapper(ExtObject).Item).Properties.EditFormat := '0.00;-0.00';
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTNumberEditMethodsGetPrecisionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TcxCurrencyEdit(TScriptControlWrapper(ExtObject).Item).Properties.DecimalPlaces;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTNumberEditMethodsSetPrecisionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxCurrencyEdit(TScriptControlWrapper(ExtObject).Item).Properties.DecimalPlaces := Info.ParamAsInteger[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTNumberEditMethodsGetUseThousandSeparatorEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TcxCurrencyEdit(TScriptControlWrapper(ExtObject).Item).Properties.UseThousandSeparator;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTNumberEditMethodsSetUseThousandSeparatorEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxCurrencyEdit(TScriptControlWrapper(ExtObject).Item).Properties.UseThousandSeparator := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTNumberEditMethodsGetValueEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := TcxCurrencyEdit(TScriptControlWrapper(ExtObject).Item).Value;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTNumberEditMethodsSetValueEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxCurrencyEdit(TScriptControlWrapper(ExtObject).Item).Value := Info.ParamAsFloat[0];
end;

// -----------------------------------------------------------------------------
//
// Script: TMemo
//
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitControlsClassesTMemoConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TScriptControlWrapper.CreateOwned(Info, Info.ScriptObj, TcxMemo);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTMemoMethodsGetLinesEval(Info: TProgramInfo; ExtObject: TObject);
var
  Strings: TStrings;
begin
  Strings := TcxMemo(TScriptControlWrapper(ExtObject).Item).Lines;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Strings);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTMemoMethodsGetWantReturnsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TcxMemo(TScriptControlWrapper(ExtObject).Item).Properties.WantReturns;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTMemoMethodsSetWantReturnsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxMemo(TScriptControlWrapper(ExtObject).Item).Properties.WantReturns := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTMemoMethodsGetWantTabsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TcxMemo(TScriptControlWrapper(ExtObject).Item).Properties.WantTabs;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTMemoMethodsSetWantTabsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxMemo(TScriptControlWrapper(ExtObject).Item).Properties.WantTabs := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTMemoMethodsGetWordWrapEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TcxMemo(TScriptControlWrapper(ExtObject).Item).Properties.WordWrap;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTMemoMethodsSetWordWrapEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxMemo(TScriptControlWrapper(ExtObject).Item).Properties.WordWrap := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------
//
// Script: TButtonImageOptions
//
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitControlsClassesTButtonImageOptionsMethodsGetGlyphEval(Info: TProgramInfo; ExtObject: TObject);
var
  Bitmap: TdxCustomSmartImage;
begin
  Bitmap := TcxButtonImageOptions(ExtObject).Glyph;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Bitmap);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTButtonImageOptionsMethodsGetLayoutEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TcxButtonImageOptions(ExtObject).Layout);
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTButtonImageOptionsMethodsSetLayoutEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxButtonImageOptions(ExtObject).Layout := TButtonLayout(Info.ParamAsInteger[0]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTButtonImageOptionsMethodsGetMarginEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TcxButtonImageOptions(ExtObject).Margin;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTButtonImageOptionsMethodsSetMarginEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxButtonImageOptions(ExtObject).Margin := Info.ParamAsInteger[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTButtonImageOptionsMethodsGetNumGlyphsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TcxButtonImageOptions(ExtObject).NumGlyphs;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTButtonImageOptionsMethodsSetNumGlyphsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxButtonImageOptions(ExtObject).NumGlyphs := Info.ParamAsInteger[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTButtonImageOptionsMethodsGetSpacingEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TcxButtonImageOptions(ExtObject).Spacing;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTButtonImageOptionsMethodsSetSpacingEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxButtonImageOptions(ExtObject).Spacing := Info.ParamAsInteger[0];
end;

// -----------------------------------------------------------------------------
//
// Script: TButton
//
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitControlsClassesTButtonConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TScriptControlWrapper.CreateOwned(Info, Info.ScriptObj, TcxButton);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTButtonMethodsGetDescriptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TcxButton(TScriptControlWrapper(ExtObject).Item).CommandLinkHint;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTButtonMethodsSetDescriptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxButton(TScriptControlWrapper(ExtObject).Item).CommandLinkHint := Info.Params[0].ValueAsString;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTButtonMethodsGetImageOptionsEval(Info: TProgramInfo; ExtObject: TObject);
var
  Button: TcxButton;
begin
  Button := TcxButton(TScriptControlWrapper(ExtObject).Item);
  Info.ResultAsVariant := CreateResultScriptObject(Info, Button.OptionsImage);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTButtonMethodsGetCancelEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TcxButton(TScriptControlWrapper(ExtObject).Item).Cancel;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTButtonMethodsSetCancelEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxButton(TScriptControlWrapper(ExtObject).Item).Cancel := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTButtonMethodsGetDefaultEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TcxButton(TScriptControlWrapper(ExtObject).Item).Default;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTButtonMethodsSetDefaultEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxButton(TScriptControlWrapper(ExtObject).Item).Default := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTButtonMethodsGetKindEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TcxButton(TScriptControlWrapper(ExtObject).Item).Kind);
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTButtonMethodsSetKindEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxButton(TScriptControlWrapper(ExtObject).Item).Kind := TcxButtonKind(Info.Params[0].ValueAsInteger);
  // CommandLink buttons are used in Wizards. In order to get the correct look for that we must use native style (transparent button).
  TcxButton(TScriptControlWrapper(ExtObject).Item).LookAndFeel.NativeStyle := (TcxButton(TScriptControlWrapper(ExtObject).Item).Kind = cxbkCommandLink);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTButtonMethodsGetModalResultEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TcxButton(TScriptControlWrapper(ExtObject).Item).ModalResult;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTButtonMethodsSetModalResultEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxButton(TScriptControlWrapper(ExtObject).Item).ModalResult := Info.Params[0].ValueAsInteger;
end;


// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTButtonMethodsGetTransparentEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TcxButton(TScriptControlWrapper(ExtObject).Item).SpeedButtonOptions.Transparent;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTButtonMethodsSetTransparentEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxButton(TScriptControlWrapper(ExtObject).Item).SpeedButtonOptions.Transparent := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------
//
// Script: TCalcEdit
//
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitControlsClassesTCalcEditConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TScriptControlWrapper.CreateOwned(Info, Info.ScriptObj, TcxCalcEdit);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCalcEditMethodsGetPrecisionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TcxCalcEdit(TScriptControlWrapper(ExtObject).Item).Properties.Precision;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCalcEditMethodsSetPrecisionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxCalcEdit(TScriptControlWrapper(ExtObject).Item).Properties.Precision := Max(0, Min(255, Info.Params[0].ValueAsInteger));
end;


// -----------------------------------------------------------------------------
//
// Script: TCheckBox
//
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitControlsClassesTCheckBoxConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TScriptControlWrapper.CreateOwned(Info, Info.ScriptObj, TcxCheckBox);
  TcxCheckBox(TScriptControlWrapper(ExtObject).Item).Style.TransparentBorder := True;
  TcxCheckBox(TScriptControlWrapper(ExtObject).Item).Transparent := True;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCheckBoxMethodsGetCheckedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TcxCheckBox(TScriptControlWrapper(ExtObject).Item).Checked;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTCheckBoxMethodsSetCheckedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxCheckBox(TScriptControlWrapper(ExtObject).Item).Checked := Info.Params[0].ValueAsBoolean;
end;


// -----------------------------------------------------------------------------
//
// Script: TRadioButton
//
// -----------------------------------------------------------------------------
type
  TScriptRadioButton = class(TcxRadioButton)
  protected
    procedure DoEnter; override;
  end;

procedure TScriptRadioButton.DoEnter;
var
  SaveClicksDisabled: boolean;
begin
  // Work around for DevExpress bug Q524885
  SaveClicksDisabled := ClicksDisabled;
  ClicksDisabled := True;
  inherited;
  ClicksDisabled := SaveClicksDisabled;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTRadioButtonConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TScriptControlWrapper.CreateOwned(Info, Info.ScriptObj, TScriptRadioButton);
  TcxRadioButton(TScriptControlWrapper(ExtObject).Item).Transparent := True;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTRadioButtonMethodsGetCheckedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TcxRadioButton(TScriptControlWrapper(ExtObject).Item).Checked;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTRadioButtonMethodsSetCheckedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxRadioButton(TScriptControlWrapper(ExtObject).Item).Checked := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTRadioButtonMethodsGetGroupIndexEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TcxRadioButton(TScriptControlWrapper(ExtObject).Item).GroupIndex;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTRadioButtonMethodsSetGroupIndexEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxRadioButton(TScriptControlWrapper(ExtObject).Item).GroupIndex := Info.Params[0].ValueAsInteger;
end;

// -----------------------------------------------------------------------------
//
// Script: TImage
//
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitControlsClassesTImageConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TScriptControlWrapper.CreateOwned(Info, Info.ScriptObj, TImage);

  TImage(TScriptControlWrapper(ExtObject).Item).Stretch := True;
  TImage(TScriptControlWrapper(ExtObject).Item).Proportional := True;
  TImage(TScriptControlWrapper(ExtObject).Item).Center := True;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTImageMethodsLoadFromStreamEval(Info: TProgramInfo; ExtObject: TObject);
var
  Image: TImage;
  Stream: TStream;
begin
  Image := TImage(TScriptControlWrapper(ExtObject).Item);

  if (Info.Params[0].ExternalObject = nil) then
    raise EScript.Create('Invalid stream object');
  Stream := Info.Params[0].ExternalObject as TStream;

(* TPicture now supports detecting the image type from a stream
  if (Image.Picture.Graphic = nil) then
    Image.Picture.Assign(TJPEGImage(nil));
*)

  Image.Picture.LoadFromStream(Stream);
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTImageMethodsSaveToStreamEval(Info: TProgramInfo; ExtObject: TObject);
var
  Image: TImage;
  Stream: TStream;
begin
  Image := TImage(TScriptControlWrapper(ExtObject).Item);
  if (Image.Picture.Graphic = nil) then
    exit;

  if (Info.Params[0].ExternalObject = nil) then
    raise EScript.Create('Invalid stream object');
  Stream := Info.Params[0].ExternalObject as TStream;

  Image.Picture.Graphic.SaveToStream(Stream);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTImageMethodsLoadFromFileEval(Info: TProgramInfo; ExtObject: TObject);
var
  Filename: string;
  Filetype: string;
  Image: TImage;
  Stream: TStream;
  FileSystem: IdwsFileSystem;
  GraphicClass: TGraphicClass;
  GraphicTemplate: TGraphic;
begin
  Filename := Info.Params[0].ValueAsString;

  Image := TImage(TScriptControlWrapper(ExtObject).Item);

  FileSystem := Info.Execution.FileSystem;

  if (FileSystem <> nil) and (FileSystem.FileExists(Filename)) then
  begin
    // TODO : Support proper graphic type by file type
    Filetype := ExtractFileExt(Filename);

    if (SameText(Filetype, '.bmp')) then
      GraphicClass := TBitmap
    else
    if (SameText(Filetype, '.jpg')) or
      (SameText(Filetype, '.jpeg')) then
      GraphicClass := TJPEGImage
    else
    if (SameText(Filetype, '.png')) then
      GraphicClass := TPNGImage
    else
    if (SameText(Filetype, '.gif')) then
      GraphicClass := TPNGImage
    else
      GraphicClass := TBitmap;

(*
    if (GraphicClass <> TBitmap) then
    begin
      GraphicTemplate := GraphicClass.Create;
      try
        GraphicTemplate.SetSize(1, 1);
        Image.Picture.Graphic := GraphicTemplate;
      finally
        GraphicTemplate.Free;
      end;
    end else
      Image.Picture.Bitmap;
*)

    Stream := FileSystem.OpenFileStream(Filename, fomReadOnly);
    try
      GraphicTemplate := GraphicClass.Create;
      try
        if (GraphicTemplate.CanLoadFromStream(Stream)) then
        begin
          GraphicTemplate.LoadFromStream(Stream);
          Image.Picture.Assign(GraphicTemplate);
        end else
          // Fall back to having TPicture detect the image type
          Image.Picture.LoadFromStream(Stream);
      finally
        GraphicTemplate.Free;
      end;
//      Image.Picture.Graphic.LoadFromStream(Stream);
    finally
      Stream.Free;
    end;
  end else
  begin
    Filename := ExpandEnvironmentVariable(Filename);

    Image.Picture.LoadFromFile(Filename);
  end;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTImageMethodsSaveToFileEval(Info: TProgramInfo; ExtObject: TObject);
var
  Image: TImage;
  FileSystem: IdwsFileSystem;
  Stream: TStream;
begin
  Image := TImage(TScriptControlWrapper(ExtObject).Item);

  if (Image.Picture.Graphic = nil) then
    exit;

  FileSystem := Info.Execution.FileSystem;
  Stream := FileSystem.OpenFileStream(Info.Params[0].ValueAsString, fomCreate);
  try
    Image.Picture.Graphic.SaveToStream(Stream);
  finally
    Stream.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTImageMethodsGetCenterEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TImage(TScriptControlWrapper(ExtObject).Item).Center;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTImageMethodsSetCenterEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TImage(TScriptControlWrapper(ExtObject).Item).Center := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTImageMethodsGetImageEval(Info: TProgramInfo; ExtObject: TObject);
var
  Graphic: TGraphic;
begin
  Graphic := TImage(TScriptControlWrapper(ExtObject).Item).Picture.Graphic;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Graphic);
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTImageMethodsSetImageEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (Info.Params[0].ExternalObject <> nil) then
    TImage(TScriptControlWrapper(ExtObject).Item).Picture.Graphic := (Info.Params[0].ExternalObject as TGraphic)
  else
    TImage(TScriptControlWrapper(ExtObject).Item).Picture.Graphic := nil;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTImageMethodsGetProportionalEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TImage(TScriptControlWrapper(ExtObject).Item).Proportional;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTImageMethodsSetProportionalEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TImage(TScriptControlWrapper(ExtObject).Item).Proportional := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTImageMethodsGetStretchEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TImage(TScriptControlWrapper(ExtObject).Item).Stretch;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTImageMethodsSetStretchEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TImage(TScriptControlWrapper(ExtObject).Item).Stretch := Info.Params[0].ValueAsBoolean;
end;


// -----------------------------------------------------------------------------
//
// Script: TComboBox
//
// -----------------------------------------------------------------------------
procedure TDataModuleUserInterface.dwsUnitControlsClassesTComboBoxConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TScriptControlWrapper.CreateOwned(Info, Info.ScriptObj, TcxComboBox);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTComboBoxMethodsGetItemsEval(Info: TProgramInfo; ExtObject: TObject);
var
  Items: TStrings;
begin
  Items := TcxComboBox(TScriptControlWrapper(ExtObject).Item).Properties.Items;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Items);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTComboBoxMethodsGetItemIndexEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TcxComboBox(TScriptControlWrapper(ExtObject).Item).ItemIndex;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTComboBoxMethodsSetItemIndexEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxComboBox(TScriptControlWrapper(ExtObject).Item).ItemIndex := Info.Params[0].ValueAsInteger;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTComboBoxMethodsGetSortedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TcxComboBox(TScriptControlWrapper(ExtObject).Item).Properties.Sorted;
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTComboBoxMethodsSetSortedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxComboBox(TScriptControlWrapper(ExtObject).Item).Properties.Sorted := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleUserInterface.dwsUnitControlsClassesTComboBoxMethodsGetDropDownListStyleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TcxComboBox(TScriptControlWrapper(ExtObject).Item).Properties.DropDownListStyle);
end;

procedure TDataModuleUserInterface.dwsUnitControlsClassesTComboBoxMethodsSetDropDownListStyleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxComboBox(TScriptControlWrapper(ExtObject).Item).Properties.DropDownListStyle := TcxEditDropDownListStyle(Info.Params[0].ValueAsInteger);
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

initialization
  TDataModuleUserInterface.RegisterModule;
end.
