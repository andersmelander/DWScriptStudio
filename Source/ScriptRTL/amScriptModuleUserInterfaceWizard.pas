unit amScriptModuleUserInterfaceWizard;

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

  dwsComp,
  dwsExprs,
  dwsCompiler,
  dwsClassesLibModule,

  dxCustomWizardControl,
  dxWizardControl,

  amDialogWizardFrame,

  amScriptModule;

// -----------------------------------------------------------------------------
//
// TScriptFrameWizardWrapper
//
// -----------------------------------------------------------------------------
type
  TScriptFrameWizardWrapper = class(TScriptControlWrapperBase<TFrameWizard>)
  private
    function GetWizard: TamWizardControl;
  protected
    property Wizard: TamWizardControl read GetWizard;
    procedure FreeWrappedObject; override;
  public
  end;

// -----------------------------------------------------------------------------
//
// TDataModuleScriptUserInterfaceWizard
//
// -----------------------------------------------------------------------------
type
  TDataModule = class(TScriptModule);

type
  TDataModuleScriptUserInterfaceWizard = class(TDataModule)
    dwsUnitWizard: TdwsUnit;
    procedure dwsUnitWizardClassesTWizardFormConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardControlConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardControlMethodsGetActivePageIndexEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardControlMethodsSetActivePageIndexEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardControlMethodsGetPagesEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardControlMethodsGetInfoPanelEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardControlMethodsGetButtonsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardPagesMethodsAddEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardControlMethodsGetActivePageEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardPageMethodsActivateEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardPageMethodsGetActiveEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardPageMethodsGetHeaderEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardPageMethodsGetPageIndexEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardPageMethodsSetPageIndexEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardPageMethodsGetPageVisibleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardPageMethodsSetPageVisibleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardPageHeaderMethodsGetTitleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardPageHeaderMethodsSetTitleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardPageHeaderMethodsGetDescriptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardPageHeaderMethodsSetDescriptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardPageHeaderMethodsGetDescriptionVisibleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardPageHeaderMethodsSetDescriptionVisibleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardControlMethodsGetTitleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardControlMethodsSetTitleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardPagesMethodsGetCountEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardPagesMethodsGetPageEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardInfoPanelMethodsGetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardInfoPanelMethodsSetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardInfoPanelMethodsGetHyperlinkEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardInfoPanelMethodsSetHyperlinkEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardInfoPanelMethodsGetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardInfoPanelMethodsSetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardInfoPanelMethodsGetVisibleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardInfoPanelMethodsSetVisibleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardButtonsMethodsGetBackEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardButtonsMethodsGetNextEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardButtonsMethodsGetCancelEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardButtonsMethodsGetFinishEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardButtonsMethodsGetHelpEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardButtonMethodsGetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardButtonMethodsSetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardButtonMethodsGetVisibleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardButtonMethodsSetVisibleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardButtonMethodsGetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardButtonMethodsSetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardControlMethodsSetWizardOnCancelEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardControlMethodsSetWizardOnFinishEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardControlMethodsSetWizardOnActivatePageEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardControlMethodsSetWizardOnNextPageEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardControlMethodsSetWizardOnPrevPageEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTCustomWizardFormConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardPageMethodsGetWizardEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardControlMethodsSetActivePageEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardControlMethodsUpdateButtonsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardControlCleanUp(ExternalObject: TObject);
    procedure dwsUnitWizardClassesTCustomWizardFormCleanUp(ExternalObject: TObject);
    procedure dwsUnitWizardClassesTWizardFormCleanUp(ExternalObject: TObject);
    procedure dwsUnitWizardClassesTCustomWizardFormMethodsGetWizardEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardControlMethodsSetOnWizardPageActivatedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardControlMethodsSetOnWizardGetNextPageEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardControlMethodsSetOnWizardGetPrevPageEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardFormMethodsSetOnAfterShowEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardPagesMethodsBeginUpdateEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardPagesMethodsEndUpdateEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardControlMethodsGetOptionsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardOptionsMethodsGetLastPageCanCancelEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWizardClassesTWizardOptionsMethodsSetLastPageCanCancelEval(Info: TProgramInfo; ExtObject: TObject);
  private
  protected
    procedure OnAfterShowHandler(Sender: TObject); // TSigmaWizardControlForm

    procedure OnWizardFinishHandler(Sender: TObject; var Accept: boolean);
    procedure OnWizardCancelHandler(Sender: TObject; var Accept: boolean);
    procedure OnWizardPageActivatingHandler(Sender: TObject; CurrentPage, NewPage: TdxWizardControlCustomPage; var AAllow: boolean);
    procedure OnWizardPageActivatedHandler(Sender: TObject; Page: TdxWizardControlCustomPage);
    procedure OnWizardNextPageHandler(Sender: TObject; CurrentPage: TdxWizardControlCustomPage; var NewPage: TdxWizardControlCustomPage; var Handled: boolean);
    procedure OnWizardPrevPageHandler(Sender: TObject; CurrentPage: TdxWizardControlCustomPage; var NewPage: TdxWizardControlCustomPage; var Handled: boolean);
    procedure OnWizardGetNextPageHandler(Sender: TObject; var NewPage: TdxWizardControlCustomPage);
    procedure OnWizardGetPrevPageHandler(Sender: TObject; var NewPage: TdxWizardControlCustomPage);
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
  Windows,
  Variants,
  Controls,
  Forms,
  Graphics,
  dwsSymbols,
  dwsInfo,
  dxWizardControlForm,
  amDialogWizardForm;


type
  TWinControlCracker = class(TWinControl);


// -----------------------------------------------------------------------------
//
// TDataModuleScriptUserInterfaceWizard
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceWizard.Initialize(ADelphiWebScript: TDelphiWebScript);
begin
  inherited;
(*
  ScriptService.RegisterClassTypeMapping(TFrameWizard, 'TWizardControl');
*)
end;

// -----------------------------------------------------------------------------
//
// Script: TWizardForm
//
// -----------------------------------------------------------------------------
// Wraps TdxWizardControlForm.
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardFormCleanUp(ExternalObject: TObject);
begin
  ExternalObject.Free;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardFormConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
var
  Form: TForm;
begin
  Form := TWizardControlForm.CreateNew(nil);
  Form.DefaultMonitor := dmMainForm;
  Form.Position := poMainFormCenter;
  Form.ParentFont := True;
  Form.ShowHint := True;

  ExtObject := TScriptControlWrapper.Create(Info.ScriptObj, Form, True);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardFormMethodsSetOnAfterShowEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (not (TScriptControlWrapper(ExtObject).Item is TWizardControlForm)) then
    exit;

  // Attach modules's event handler to control's event event
  if (not VarIsNull(Info.Params[0].Value)) then
  begin
    Info.Vars['FOnAfterShow'].Value := Info.Params[0].Value;

    TWizardControlForm(TScriptControlWrapper(ExtObject).Item).OnAfterShow := OnAfterShowHandler;
  end else
    TWizardControlForm(TScriptControlWrapper(ExtObject).Item).OnAfterShow := nil;
end;

// -----------------------------------------------------------------------------
//
// Script: TCustomWizardForm
//
// -----------------------------------------------------------------------------
// Wraps TCustomWizardForm (a form with a wizard (actually a wizard frame) on it).
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceWizard.OnAfterShowHandler(Sender: TObject);
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
      OutputDebugString('TDataModuleScriptUserInterfaceWizard.OnAfterShowHandler: Script Object has been destroyed');
      Continue;
    end;

    ScriptObjectInfo := Wrapper.AcquireInfo;
    Delegate := ScriptObjectInfo.Info.Member['FOnAfterShow'];

    if (Delegate <> nil) and (Delegate.ScriptObj <> nil) then
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
    TCustomWizardForm(Sender).OnAfterShow := nil;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTCustomWizardFormCleanUp(ExternalObject: TObject);
begin
  ExternalObject.Free;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTCustomWizardFormConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
var
  Form: TForm;
begin
  ASSERT(ExtObject = nil);

  Form := TCustomWizardForm.Create(nil);
  Form.DefaultMonitor := dmMainForm;
  Form.Position := poMainFormCenter;
  Form.ParentFont := True;
  Form.ShowHint := True;

  ExtObject := TScriptControlWrapper.Create(Info.ScriptObj, Form, False);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTCustomWizardFormMethodsGetWizardEval(Info: TProgramInfo; ExtObject: TObject);
var
  FrameWizard: TFrameWizard;
  Wrapper: TScriptObjectWrapperBase;
begin
  FrameWizard := TCustomWizardForm(TScriptControlWrapper(ExtObject).Item).FrameWizard;

  Wrapper := Environment(Info).FindWrapper(FrameWizard);
  if (Wrapper = nil) then
    Wrapper := TScriptFrameWizardWrapper.Create(Info, FrameWizard, False); // Wizard is owned by form

  Info.ResultAsVariant := Wrapper.ScriptObj;
end;

// -----------------------------------------------------------------------------
//
// Script: TWizardControl
//
// -----------------------------------------------------------------------------
// Wraps TFrameWizard (which wraps TamWizardControl).
// -----------------------------------------------------------------------------
type
  TScriptFrameWizard = class(TFrameWizard)
  public
    destructor Destroy; override;
  end;

destructor TScriptFrameWizard.Destroy;
begin

  inherited;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardControlCleanUp(ExternalObject: TObject);
begin
  ExternalObject.Free;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardControlConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  if (ExtObject <> nil) then
    Info.ResultAsVariant := (ExtObject as TScriptFrameWizardWrapper).ScriptObj
  else
    ExtObject := TScriptFrameWizardWrapper.CreateOwned(Info, Info.ScriptObj, TScriptFrameWizard);
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardControlMethodsGetActivePageEval(Info: TProgramInfo; ExtObject: TObject);
var
  Page: TdxWizardControlCustomPage;
  Wrapper: TScriptObjectWrapperBase;
begin
  Page := TScriptFrameWizardWrapper(ExtObject).Wizard.ActivePage;

  if (Page <> nil) then
  begin
    Wrapper := Environment(Info).FindWrapper(Page);
    if (Wrapper = nil) then
      Wrapper := TScriptControlWrapper.Create(Info, Page);

    Info.ResultAsVariant := Wrapper.ScriptObj;
  end else
    Info.ResultAsVariant := IUnknown(nil);
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardControlMethodsSetActivePageEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (Info.Params[0].ScriptObj <> nil) then
    TScriptFrameWizardWrapper(ExtObject).Wizard.ActivePage := TdxWizardControlPage(TScriptFrameWizardWrapper(Info.Params[0].ExternalObject).Item)
  else
    TScriptFrameWizardWrapper(ExtObject).Wizard.ActivePage := nil;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardControlMethodsGetActivePageIndexEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TScriptFrameWizardWrapper(ExtObject).Wizard.ActivePageIndex;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardControlMethodsGetButtonsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TScriptFrameWizardWrapper(ExtObject).Wizard.Buttons);
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardControlMethodsGetInfoPanelEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TScriptFrameWizardWrapper(ExtObject).Wizard.InfoPanel);
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardControlMethodsGetOptionsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  // Wrap wizard frame control
  Info.ResultAsVariant := CreateResultScriptObject(Info, ExtObject);
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardControlMethodsGetPagesEval(Info: TProgramInfo; ExtObject: TObject);
begin
  // Wrap wizard frame control - not wizard pages object (which doesn't exist)
  Info.ResultAsVariant := CreateResultScriptObject(Info, ExtObject);
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardControlMethodsSetActivePageIndexEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptFrameWizardWrapper(ExtObject).Wizard.ActivePageIndex := Info.Params[0].ValueAsInteger;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardControlMethodsGetTitleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TScriptFrameWizardWrapper(ExtObject).Wizard.OptionsViewStyleAero.Title.Text;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardControlMethodsSetTitleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptFrameWizardWrapper(ExtObject).Wizard.OptionsViewStyleAero.Title.Text := Info.Params[0].ValueAsString;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardControlMethodsSetWizardOnActivatePageEval(Info: TProgramInfo; ExtObject: TObject);
begin
  ASSERT(ExtObject is TScriptFrameWizardWrapper);
  // Attach wrapper's handler to control's event
  if (not VarIsNull(Info.Params[0].Value)) then
  begin
    Info.Vars['FOnWizardPageActivating'].Value := Info.Params[0].Value;
    TScriptFrameWizardWrapper(ExtObject).Item.OnWizardPageActivating := OnWizardPageActivatingHandler;
  end else
    TScriptFrameWizardWrapper(ExtObject).Item.OnWizardPageActivating := nil;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardControlMethodsSetOnWizardGetNextPageEval(Info: TProgramInfo; ExtObject: TObject);
begin
  ASSERT(ExtObject is TScriptFrameWizardWrapper);
  // Attach wrapper's handler to control's event
  if (not VarIsNull(Info.Params[0].Value)) then
  begin
    Info.Vars['FOnWizardGetNextPage'].Value := Info.Params[0].Value;
    TScriptFrameWizardWrapper(ExtObject).Item.OnWizardGetNextPage := OnWizardGetNextPageHandler;
  end else
    TScriptFrameWizardWrapper(ExtObject).Item.OnWizardGetNextPage := nil;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardControlMethodsSetOnWizardGetPrevPageEval(Info: TProgramInfo; ExtObject: TObject);
begin
  ASSERT(ExtObject is TScriptFrameWizardWrapper);
  // Attach wrapper's handler to control's event
  if (not VarIsNull(Info.Params[0].Value)) then
  begin
    Info.Vars['FOnWizardGetPrevPage'].Value := Info.Params[0].Value;
    TScriptFrameWizardWrapper(ExtObject).Item.OnWizardGetPrevPage := OnWizardGetPrevPageHandler;
  end else
    TScriptFrameWizardWrapper(ExtObject).Item.OnWizardGetPrevPage := nil;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardControlMethodsSetOnWizardPageActivatedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  ASSERT(ExtObject is TScriptFrameWizardWrapper);
  // Attach wrapper's handler to control's event
  if (not VarIsNull(Info.Params[0].Value)) then
  begin
    Info.Vars['FOnWizardPageActivated'].Value := Info.Params[0].Value;
    TScriptFrameWizardWrapper(ExtObject).Item.OnWizardPageActivated := OnWizardPageActivatedHandler;
  end else
    TScriptFrameWizardWrapper(ExtObject).Item.OnWizardPageActivated := nil;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardControlMethodsSetWizardOnCancelEval(Info: TProgramInfo; ExtObject: TObject);
begin
  ASSERT(ExtObject is TScriptFrameWizardWrapper);
  // Attach wrapper's handler to control's event
  if (not VarIsNull(Info.Params[0].Value)) then
  begin
    Info.Vars['FOnWizardCancel'].Value := Info.Params[0].Value;
    TScriptFrameWizardWrapper(ExtObject).Item.OnWizardCancel := OnWizardCancelHandler;
  end else
    TScriptFrameWizardWrapper(ExtObject).Item.OnWizardCancel := nil;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardControlMethodsSetWizardOnFinishEval(Info: TProgramInfo; ExtObject: TObject);
begin
  ASSERT(ExtObject is TScriptFrameWizardWrapper);
  // Attach wrapper's handler to control's event
  if (not VarIsNull(Info.Params[0].Value)) then
  begin
    Info.Vars['FOnWizardFinish'].Value := Info.Params[0].Value;
    TScriptFrameWizardWrapper(ExtObject).Item.OnWizardFinish := OnWizardFinishHandler;
  end else
    TScriptFrameWizardWrapper(ExtObject).Item.OnWizardFinish := nil;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardControlMethodsSetWizardOnNextPageEval(Info: TProgramInfo; ExtObject: TObject);
begin
  ASSERT(ExtObject is TScriptFrameWizardWrapper);
  // Attach wrapper's handler to control's event
  if (not VarIsNull(Info.Params[0].Value)) then
  begin
    Info.Vars['FOnWizardNextPage'].Value := Info.Params[0].Value;
    TScriptFrameWizardWrapper(ExtObject).Item.OnWizardNextPage := OnWizardNextPageHandler;
  end else
    TScriptFrameWizardWrapper(ExtObject).Item.OnWizardNextPage := nil;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardControlMethodsSetWizardOnPrevPageEval(Info: TProgramInfo; ExtObject: TObject);
begin
  ASSERT(ExtObject is TScriptFrameWizardWrapper);
  // Attach wrapper's handler to control's event
  if (not VarIsNull(Info.Params[0].Value)) then
  begin
    Info.Vars['FOnWizardPrevPage'].Value := Info.Params[0].Value;
    TScriptFrameWizardWrapper(ExtObject).Item.OnWizardPrevPage := OnWizardPrevPageHandler;
  end else
    TScriptFrameWizardWrapper(ExtObject).Item.OnWizardPrevPage := nil;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardControlMethodsUpdateButtonsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptFrameWizardWrapper(ExtObject).Item.UpdateButtons;
end;

// -----------------------------------------------------------------------------
//
// Script: TWizardInfoPanel
//
// -----------------------------------------------------------------------------
// Provides access to TamWizardControl.InfoPanel.
// Wraps TdxWizardControlInfoPanel.
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardInfoPanelMethodsGetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TdxWizardControlInfoPanel(ExtObject).Enabled;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardInfoPanelMethodsSetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxWizardControlInfoPanel(ExtObject).Enabled := Info.Params[0].ValueAsBoolean;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardInfoPanelMethodsGetVisibleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TdxWizardControlInfoPanel(ExtObject).Visible;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardInfoPanelMethodsSetVisibleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxWizardControlInfoPanel(ExtObject).Visible := Info.Params[0].ValueAsBoolean;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardInfoPanelMethodsGetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TdxWizardControlInfoPanel(ExtObject).Caption;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardInfoPanelMethodsSetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxWizardControlInfoPanel(ExtObject).Caption := Info.Params[0].ValueAsString;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardInfoPanelMethodsGetHyperlinkEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TdxWizardControlInfoPanel(ExtObject).Hyperlink;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardInfoPanelMethodsSetHyperlinkEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxWizardControlInfoPanel(ExtObject).Hyperlink := Info.Params[0].ValueAsString;
end;

// -----------------------------------------------------------------------------
//
// Script: TWizardOptions
//
// -----------------------------------------------------------------------------
// Provides access to TFrameWizard.Options
// Wraps wizard frame.
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardOptionsMethodsGetLastPageCanCancelEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TScriptFrameWizardWrapper(ExtObject).Item.AutoDisableCancel;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardOptionsMethodsSetLastPageCanCancelEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptFrameWizardWrapper(ExtObject).Item.AutoDisableCancel := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------
//
// Script: TWizardPages
//
// -----------------------------------------------------------------------------
// Provides access to TamWizardControl.Pages.
// Wraps wizard frame.
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardPagesMethodsAddEval(Info: TProgramInfo; ExtObject: TObject);
var
  Page: TdxWizardControlCustomPage;
  Wrapper: TScriptObjectWrapperBase;
begin
  Page := TScriptFrameWizardWrapper(ExtObject).Wizard.AddPage;

  Wrapper := Environment(Info).FindWrapper(Page);
  if (Wrapper = nil) then
    Wrapper := TScriptControlWrapper.Create(Info, Page, True);
  Info.ResultAsVariant := Wrapper.ScriptObj;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardPagesMethodsBeginUpdateEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptFrameWizardWrapper(ExtObject).Item.BeginUpdate;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardPagesMethodsEndUpdateEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptFrameWizardWrapper(ExtObject).Item.EndUpdate;
  if (TScriptFrameWizardWrapper(ExtObject).Item.UpdateCount = 0) then
    TScriptFrameWizardWrapper(ExtObject).Item.UpdateButtons;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardPagesMethodsGetCountEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TScriptFrameWizardWrapper(ExtObject).Wizard.PageCount;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardPagesMethodsGetPageEval(Info: TProgramInfo; ExtObject: TObject);
var
  Page: TdxWizardControlCustomPage;
  Wrapper: TScriptObjectWrapperBase;
begin
  Page := TScriptFrameWizardWrapper(ExtObject).Wizard.Pages[Info.Params[0].ValueAsInteger];

  Wrapper := Environment(Info).FindWrapper(Page);
  if (Wrapper = nil) then
    Wrapper := TScriptControlWrapper.Create(Info, Page);
  Info.ResultAsVariant := Wrapper.ScriptObj;
end;

// -----------------------------------------------------------------------------
//
// Script: TWizardPage
//
// -----------------------------------------------------------------------------
// Wraps TdxWizardControlCustomPage.
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardPageMethodsActivateEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxWizardControlCustomPage(TScriptControlWrapper(ExtObject).Item).Activate;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardPageMethodsGetActiveEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TdxWizardControlCustomPage(TScriptControlWrapper(ExtObject).Item).Active;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardPageMethodsGetHeaderEval(Info: TProgramInfo; ExtObject: TObject);
begin
  // We need to wrap the page and not the header since we need to access the wizard control via the header
  Info.ResultAsVariant := CreateResultScriptObject(Info, TScriptControlWrapper(ExtObject).Item);
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardPageMethodsGetPageIndexEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TdxWizardControlCustomPage(TScriptControlWrapper(ExtObject).Item).PageIndex;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardPageMethodsSetPageIndexEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxWizardControlCustomPage(TScriptControlWrapper(ExtObject).Item).PageIndex := Info.Params[0].ValueAsInteger;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardPageMethodsGetPageVisibleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TdxWizardControlCustomPage(TScriptControlWrapper(ExtObject).Item).PageVisible;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardPageMethodsSetPageVisibleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxWizardControlCustomPage(TScriptControlWrapper(ExtObject).Item).PageVisible := Info.Params[0].ValueAsBoolean;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardPageMethodsGetWizardEval(Info: TProgramInfo; ExtObject: TObject);
var
  Page: TdxWizardControlCustomPage;
  Wizard: TdxCustomWizardControl;
  Wrapper: TScriptObjectWrapperBase;
begin
  Page := TdxWizardControlCustomPage(TScriptControlWrapper(ExtObject).Item);
  Wizard := Page.WizardControl;

  // Wizard parent is not the frame as one would think but the wizard form (see TFrameWizard.SetParent).
  // We need to use owner instead and hope it's the correct type.
  ASSERT(Wizard.Owner is TFrameWizard);

  Wrapper := Environment(Info).FindWrapper(Wizard.Owner);
  if (Wrapper = nil) then
    Wrapper := TScriptFrameWizardWrapper.Create(Info, TFrameWizard(Wizard.Owner));

  Info.ResultAsVariant := Wrapper.ScriptObj;
end;

// -----------------------------------------------------------------------------
//
// Script: TWizardPageHeader
//
// -----------------------------------------------------------------------------
// Provides access to TdxWizardControlPage.Header.
// Wraps  TdxWizardControlCustomPage.
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardPageHeaderMethodsGetDescriptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TdxWizardControlCustomPage(ExtObject).Header.Description;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardPageHeaderMethodsGetDescriptionVisibleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := (TdxWizardControlCustomPage(ExtObject).Header.DescriptionVisibility = wcevAlwaysVisible) or
    ((TdxWizardControlCustomPage(ExtObject).Header.DescriptionVisibility = wcevDefault) and (TdxWizardControlCustomPage(ExtObject).WizardControl.Header.DescriptionVisibility = wcevAlwaysVisible));
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardPageHeaderMethodsSetDescriptionVisibleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (Info.Params[0].ValueAsBoolean) then
    TdxWizardControlCustomPage(ExtObject).Header.DescriptionVisibility := wcevAlwaysVisible
  else
    TdxWizardControlCustomPage(ExtObject).Header.DescriptionVisibility := wcevAlwaysHidden;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardPageHeaderMethodsSetDescriptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxWizardControlCustomPage(ExtObject).Header.Description := Info.Params[0].ValueAsString;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardPageHeaderMethodsGetTitleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TdxWizardControlCustomPage(ExtObject).Header.Title;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardPageHeaderMethodsSetTitleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxWizardControlCustomPage(ExtObject).Header.Title := Info.Params[0].ValueAsString;
end;

// -----------------------------------------------------------------------------
//
// Script: TWizardButtons
//
// -----------------------------------------------------------------------------
// Provides access to TamWizardControl.Buttons.
// Wraps TdxWizardControlButtons.
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardButtonsMethodsGetBackEval(Info: TProgramInfo; ExtObject: TObject);
var
  Button: TdxWizardControlCustomButton;
begin
  Button := TdxWizardControlButtons(ExtObject).Back;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Button);
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardButtonsMethodsGetCancelEval(Info: TProgramInfo; ExtObject: TObject);
var
  Button: TdxWizardControlCustomButton;
begin
  Button := TdxWizardControlButtons(ExtObject).Cancel;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Button);
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardButtonsMethodsGetFinishEval(Info: TProgramInfo; ExtObject: TObject);
var
  Button: TdxWizardControlCustomButton;
begin
  Button := TdxWizardControlButtons(ExtObject).Finish;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Button);
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardButtonsMethodsGetHelpEval(Info: TProgramInfo; ExtObject: TObject);
var
  Button: TdxWizardControlCustomButton;
begin
  Button := TdxWizardControlButtons(ExtObject).Help;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Button);
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardButtonsMethodsGetNextEval(Info: TProgramInfo; ExtObject: TObject);
var
  Button: TdxWizardControlCustomButton;
begin
  Button := TdxWizardControlButtons(ExtObject).Next;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Button);
end;

// -----------------------------------------------------------------------------
//
// Script: TWizardButton
//
// -----------------------------------------------------------------------------
// Wraps TdxWizardControlCustomButton.
// -----------------------------------------------------------------------------
type
  TdxWizardControlButtonCracker = class(TdxWizardControlCustomButton);

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardButtonMethodsGetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TdxWizardControlCustomButton(ExtObject).Caption;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardButtonMethodsSetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxWizardControlCustomButton(ExtObject).Caption := Info.Params[0].ValueAsString;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardButtonMethodsSetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxWizardControlCustomButton(ExtObject).Enabled := Info.Params[0].ValueAsBoolean;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardButtonMethodsGetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TdxWizardControlCustomButton(ExtObject).Enabled;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardButtonMethodsGetVisibleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TdxWizardControlButtonCracker(ExtObject).Visible;
end;

procedure TDataModuleScriptUserInterfaceWizard.dwsUnitWizardClassesTWizardButtonMethodsSetVisibleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TdxWizardControlButtonCracker(ExtObject).Visible := Info.Params[0].ValueAsBoolean;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceWizard.OnWizardPageActivatedHandler(Sender: TObject; Page: TdxWizardControlCustomPage);
var
  Wrapper: TScriptObjectWrapperBase;
  PageWrapper: TScriptObjectWrapperBase;
  Delegate: IInfo;
  ScriptObjectInfo: IScriptObjectInfo;
  Any: boolean;
begin
  Any := False;
  for Wrapper in ScriptFindWrappers(Sender) do
  begin
    if (not Wrapper.CheckScriptObj) then
    begin
      OutputDebugString('OnWizardPageActivatedHandler: Script Object has been destroyed');
      Continue;
    end;

    ScriptObjectInfo := Wrapper.AcquireInfo;
    Delegate := ScriptObjectInfo.Info.Member['FOnWizardPageActivated'];

    if (Delegate <> nil) and (Delegate.ScriptObj <> nil) then
    begin
      if (Page <> nil) then
      begin
        PageWrapper := Environment(Wrapper).FindWrapper(Page);
        if (PageWrapper = nil) then
          PageWrapper := TScriptControlWrapper.Create(Wrapper.Execution.Info, Delegate.Parameter['Page'].TypeSym, Page);
        Delegate.Parameter['Page'].Value := PageWrapper.ScriptObj;
      end else
        Delegate.Parameter['Page'].Value := IUnknown(nil);
      Delegate.Parameter['Sender'].Value := Wrapper.ScriptObj;
      try

        Delegate.Call;

        Any := True;
      except
        Delegate.Value := IUnknown(nil);
        ScriptHandleException(Wrapper.Execution);
      end;
    end;
  end;
  if (not Any) then
    TFrameWizard(Sender).OnWizardPageActivated := nil;
end;

procedure TDataModuleScriptUserInterfaceWizard.OnWizardPageActivatingHandler(Sender: TObject; CurrentPage, NewPage: TdxWizardControlCustomPage; var AAllow: boolean);
var
  Wrapper: TScriptObjectWrapperBase;
  PageWrapper: TScriptObjectWrapperBase;
  Delegate: IInfo;
  ScriptObjectInfo: IScriptObjectInfo;
  Any: boolean;
begin
  Any := False;
  for Wrapper in ScriptFindWrappers(Sender) do
  begin
    if (not Wrapper.CheckScriptObj) then
    begin
      OutputDebugString('OnWizardPageActivatingHandler: Script Object has been destroyed');
      Continue;
    end;

    ScriptObjectInfo := Wrapper.AcquireInfo;
    Delegate := ScriptObjectInfo.Info.Member['FOnWizardPageActivating'];

    if (Delegate <> nil) and (Delegate.ScriptObj <> nil) then
    begin
      if (CurrentPage <> nil) then
      begin
        PageWrapper := Environment(Wrapper).FindWrapper(CurrentPage);
        if (PageWrapper = nil) then
          PageWrapper := TScriptControlWrapper.Create(Wrapper.Execution.Info, Delegate.Parameter['CurrentPage'].TypeSym, CurrentPage);
        Delegate.Parameter['CurrentPage'].Value := PageWrapper.ScriptObj;
      end else
        Delegate.Parameter['CurrentPage'].Value := IUnknown(nil);

      if (NewPage <> nil) then
      begin
        PageWrapper := Environment(Wrapper).FindWrapper(NewPage);
        if (PageWrapper = nil) then
          PageWrapper := TScriptControlWrapper.Create(Wrapper.Execution.Info, Delegate.Parameter['NewPage'].TypeSym, NewPage);
        Delegate.Parameter['NewPage'].Value := PageWrapper.ScriptObj;
      end else
        Delegate.Parameter['NewPage'].Value := IUnknown(nil);

      Delegate.Parameter['Sender'].Value := Wrapper.ScriptObj;
      Delegate.Parameter['Allow'].Value := AAllow;
      try

        Delegate.Call;

        AAllow := Delegate.Parameter['Allow'].ValueAsBoolean;
        Any := True;
      except
        Delegate.Value := IUnknown(nil);
        ScriptHandleException(Wrapper.Execution);
      end;
    end;
  end;
  if (not Any) then
    TFrameWizard(Sender).OnWizardPageActivating := nil;
end;

procedure TDataModuleScriptUserInterfaceWizard.OnWizardCancelHandler(Sender: TObject; var Accept: boolean);
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
      OutputDebugString('OnWizardCancelHandler: Script Object has been destroyed');
      Continue;
    end;

    ScriptObjectInfo := Wrapper.AcquireInfo;
    Delegate := ScriptObjectInfo.Info.Member['FOnWizardCancel'];

    if (Delegate <> nil) and (Delegate.ScriptObj <> nil) then
    begin
      Delegate.Parameter['Sender'].Value := Wrapper.ScriptObj;
      Delegate.Parameter['Accept'].Value := Accept;
      try

        Delegate.Call;

        Accept := Delegate.Parameter['Accept'].ValueAsBoolean;
        Any := True;
      except
        Delegate.Value := IUnknown(nil);
        ScriptHandleException(Wrapper.Execution);
      end;
    end;
  end;
  if (not Any) then
    TFrameWizard(Sender).OnWizardCancel := nil;
end;

procedure TDataModuleScriptUserInterfaceWizard.OnWizardFinishHandler(Sender: TObject; var Accept: boolean);
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
      OutputDebugString('OnWizardFinishHandler: Script Object has been destroyed');
      Continue;
    end;

    ScriptObjectInfo := Wrapper.AcquireInfo;
    Delegate := ScriptObjectInfo.Info.Member['FOnWizardFinish'];

    if (Delegate <> nil) and (Delegate.ScriptObj <> nil) then
    begin
      Delegate.Parameter['Sender'].Value := Wrapper.ScriptObj;
      Delegate.Parameter['Accept'].Value := Accept;
      try

        Delegate.Call;

        Accept := Delegate.Parameter['Accept'].ValueAsBoolean;
        Any := True;
      except
        Delegate.Value := IUnknown(nil);
        ScriptHandleException(Wrapper.Execution);
      end;
    end;
  end;
  if (not Any) then
    TFrameWizard(Sender).OnWizardFinish := nil;
end;

procedure TDataModuleScriptUserInterfaceWizard.OnWizardGetNextPageHandler(Sender: TObject; var NewPage: TdxWizardControlCustomPage);
var
  Wrapper: TScriptObjectWrapperBase;
  PageWrapper: TScriptObjectWrapperBase;
  Delegate: IInfo;
  ScriptObjectInfo: IScriptObjectInfo;
  Info: IInfo;
  Any: boolean;
begin
  Any := False;
  for Wrapper in ScriptFindWrappers(Sender) do
  begin
    if (not Wrapper.CheckScriptObj) then
    begin
      OutputDebugString('OnWizardGetNextPageHandler: Script Object has been destroyed');
      Continue;
    end;

    ScriptObjectInfo := Wrapper.AcquireInfo;
    Delegate := ScriptObjectInfo.Info.Member['FOnWizardGetNextPage'];

    if (Delegate <> nil) and (Delegate.ScriptObj <> nil) then
    begin
      if (NewPage <> nil) then
      begin
        PageWrapper := Environment(Wrapper).FindWrapper(NewPage);
        if (PageWrapper = nil) then
          PageWrapper := TScriptControlWrapper.Create(Wrapper.Execution.Info, Delegate.Parameter['NewPage'].TypeSym, NewPage);
        Delegate.Parameter['NewPage'].Value := PageWrapper.ScriptObj;
      end else
        Delegate.Parameter['NewPage'].Value := IUnknown(nil);
      Delegate.Parameter['Sender'].Value := Wrapper.ScriptObj;
      try

        Delegate.Call;

        Info := Delegate.Parameter['NewPage'];
        if (Info.ScriptObj <> nil) then
        begin
          PageWrapper := Info.ExternalObject as TScriptControlWrapper;
          NewPage := TScriptControlWrapper(PageWrapper).Item as TdxWizardControlCustomPage;
        end else
          NewPage := nil;
        Any := True;
        // Allow only one to implement this handler
        break;
      except
        Delegate.Value := IUnknown(nil);
        ScriptHandleException(Wrapper.Execution);
      end;
    end;
  end;
  if (not Any) then
    TFrameWizard(Sender).OnWizardGetNextPage := nil;
end;

procedure TDataModuleScriptUserInterfaceWizard.OnWizardGetPrevPageHandler(Sender: TObject; var NewPage: TdxWizardControlCustomPage);
var
  Wrapper: TScriptObjectWrapperBase;
  PageWrapper: TScriptObjectWrapperBase;
  Delegate: IInfo;
  ScriptObjectInfo: IScriptObjectInfo;
  Info: IInfo;
  Any: boolean;
begin
  Any := False;
  for Wrapper in ScriptFindWrappers(Sender) do
  begin
    if (not Wrapper.CheckScriptObj) then
    begin
      OutputDebugString('OnWizardGetPrevPageHandler: Script Object has been destroyed');
      Continue;
    end;

    ScriptObjectInfo := Wrapper.AcquireInfo;
    Delegate := ScriptObjectInfo.Info.Member['FOnWizardGetPrevPage'];

    if (Delegate <> nil) and (Delegate.ScriptObj <> nil) then
    begin
      if (NewPage <> nil) then
      begin
        PageWrapper := Environment(Wrapper).FindWrapper(NewPage);
        if (PageWrapper = nil) then
          PageWrapper := TScriptControlWrapper.Create(Wrapper.Execution.Info, Delegate.Parameter['NewPage'].TypeSym, NewPage);
        Delegate.Parameter['NewPage'].Value := PageWrapper.ScriptObj;
      end else
        Delegate.Parameter['NewPage'].Value := IUnknown(nil);
      Delegate.Parameter['Sender'].Value := Wrapper.ScriptObj;
      try

        Delegate.Call;

        Info := Delegate.Parameter['NewPage'];
        if (Info.ScriptObj <> nil) then
        begin
          PageWrapper := Info.ExternalObject as TScriptControlWrapper;
          NewPage := TScriptControlWrapper(PageWrapper).Item as TdxWizardControlCustomPage;
        end else
          NewPage := nil;
        Any := True;
        // Allow only one to implement this handler
        break;
      except
        Delegate.Value := IUnknown(nil);
        ScriptHandleException(Wrapper.Execution);
      end;
    end;
  end;
  if (not Any) then
    TFrameWizard(Sender).OnWizardGetPrevPage := nil;
end;

procedure TDataModuleScriptUserInterfaceWizard.OnWizardNextPageHandler(Sender: TObject; CurrentPage: TdxWizardControlCustomPage; var NewPage: TdxWizardControlCustomPage; var Handled: boolean);
var
  Wrapper: TScriptObjectWrapperBase;
  PageWrapper: TScriptObjectWrapperBase;
  Delegate: IInfo;
  ScriptObjectInfo: IScriptObjectInfo;
  Info: IInfo;
  Any: boolean;
begin
  Any := False;
  for Wrapper in ScriptFindWrappers(Sender) do
  begin
    if (not Wrapper.CheckScriptObj) then
    begin
      OutputDebugString('OnWizardNextPageHandler: Script Object has been destroyed');
      Continue;
    end;

    ScriptObjectInfo := Wrapper.AcquireInfo;
    Delegate := ScriptObjectInfo.Info.Member['FOnWizardNextPage'];

    if (Delegate <> nil) and (Delegate.ScriptObj <> nil) then
    begin
      if (CurrentPage <> nil) then
      begin
        PageWrapper := Environment(Wrapper).FindWrapper(CurrentPage);
        if (PageWrapper = nil) then
          PageWrapper := TScriptControlWrapper.Create(Wrapper.Execution.Info, Delegate.Parameter['CurrentPage'].TypeSym, CurrentPage);
        Delegate.Parameter['CurrentPage'].Value := PageWrapper.ScriptObj;
      end else
        Delegate.Parameter['CurrentPage'].Value := IUnknown(nil);

      if (NewPage <> nil) then
      begin
        PageWrapper := Environment(Wrapper).FindWrapper(NewPage);
        if (PageWrapper = nil) then
          PageWrapper := TScriptControlWrapper.Create(Wrapper.Execution.Info, Delegate.Parameter['NewPage'].TypeSym, NewPage);
        Delegate.Parameter['NewPage'].Value := PageWrapper.ScriptObj;
      end else
        Delegate.Parameter['NewPage'].Value := IUnknown(nil);
      Delegate.Parameter['Sender'].Value := Wrapper.ScriptObj;
      Delegate.Parameter['Handled'].Value := Handled;
      try

        Delegate.Call;

        Handled := Delegate.Parameter['Handled'].ValueAsBoolean;
        Info := Delegate.Parameter['NewPage'];
        if (Info.ScriptObj <> nil) then
        begin
          PageWrapper := Info.ExternalObject as TScriptControlWrapper;
          NewPage := TScriptControlWrapper(PageWrapper).Item as TdxWizardControlCustomPage;
        end else
          NewPage := nil;
        Any := True;
        // Allow only one to implement this handler
        break;
      except
        Delegate.Value := IUnknown(nil);
        ScriptHandleException(Wrapper.Execution);
      end;
    end;
  end;
  if (not Any) then
    TFrameWizard(Sender).OnWizardNextPage := nil;
end;

procedure TDataModuleScriptUserInterfaceWizard.OnWizardPrevPageHandler(Sender: TObject; CurrentPage: TdxWizardControlCustomPage; var NewPage: TdxWizardControlCustomPage; var Handled: boolean);
var
  Wrapper: TScriptObjectWrapperBase;
  PageWrapper: TScriptObjectWrapperBase;
  Delegate: IInfo;
  ScriptObjectInfo: IScriptObjectInfo;
  Info: IInfo;
  Any: boolean;
begin
  Any := False;
  for Wrapper in ScriptFindWrappers(Sender) do
  begin
    if (not Wrapper.CheckScriptObj) then
    begin
      OutputDebugString('OnWizardPrevPageHandler: Script Object has been destroyed');
      Continue;
    end;

    ScriptObjectInfo := Wrapper.AcquireInfo;
    Delegate := ScriptObjectInfo.Info.Member['FOnWizardPrevPage'];

    if (Delegate <> nil) and (Delegate.ScriptObj <> nil) then
    begin
      if (CurrentPage <> nil) then
      begin
        PageWrapper := Environment(Wrapper).FindWrapper(CurrentPage);
        if (PageWrapper = nil) then
          PageWrapper := TScriptControlWrapper.Create(Wrapper.Execution.Info, Delegate.Parameter['CurrentPage'].TypeSym, CurrentPage);
        Delegate.Parameter['CurrentPage'].Value := PageWrapper.ScriptObj;
      end else
        Delegate.Parameter['CurrentPage'].Value := IUnknown(nil);

      if (NewPage <> nil) then
      begin
        PageWrapper := Environment(Wrapper).FindWrapper(NewPage);
        if (PageWrapper = nil) then
          PageWrapper := TScriptControlWrapper.Create(Wrapper.Execution.Info, Delegate.Parameter['NewPage'].TypeSym, NewPage);
        Delegate.Parameter['NewPage'].Value := PageWrapper.ScriptObj;
      end else
        Delegate.Parameter['NewPage'].Value := IUnknown(nil);
      Delegate.Parameter['Sender'].Value := Wrapper.ScriptObj;
      Delegate.Parameter['Handled'].Value := Handled;
      try

        Delegate.Call;

        Handled := Delegate.Parameter['Handled'].ValueAsBoolean;
        Info := Delegate.Parameter['NewPage'];
        if (Info.ScriptObj <> nil) then
        begin
          PageWrapper := Info.ExternalObject as TScriptControlWrapper;
          NewPage := TScriptControlWrapper(PageWrapper).Item as TdxWizardControlCustomPage;
        end else
          NewPage := nil;
        Any := True;
        // Allow only one to implement this handler
        break;
      except
        Delegate.Value := IUnknown(nil);
        ScriptHandleException(Wrapper.Execution);
      end;
    end;
  end;
  if (not Any) then
    TFrameWizard(Sender).OnWizardPrevPage := nil;
end;

// -----------------------------------------------------------------------------
//
// TScriptWizardWrapper
//
// -----------------------------------------------------------------------------
procedure TScriptFrameWizardWrapper.FreeWrappedObject;
begin
  inherited;

end;

function TScriptFrameWizardWrapper.GetWizard: TamWizardControl;
begin
  Result := Item.Wizard;
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

initialization
  TDataModuleScriptUserInterfaceWizard.RegisterModule;
end.
