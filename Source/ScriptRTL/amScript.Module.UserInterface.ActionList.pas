unit amScript.Module.UserInterface.ActionList;

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

  amScript.Module;

// -----------------------------------------------------------------------------
//
// TDataModuleScriptUserInterfaceActionList
//
// -----------------------------------------------------------------------------
// Wraps TActionList and TAction
// -----------------------------------------------------------------------------
type
  TDataModule = class(TScriptModule);

type
  TDataModuleScriptUserInterfaceActionList = class(TDataModule)
    dwsUnitActionList: TdwsUnit;
    procedure dwsUnitActionListClassesTActionMethodsGetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitActionListClassesTActionMethodsSetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitActionListClassesTActionMethodsGetVisibleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitActionListClassesTActionMethodsSetVisibleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitActionListClassesTActionMethodsGetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitActionListClassesTActionMethodsSetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitActionListClassesTActionMethodsGetHintEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitActionListClassesTActionMethodsSetHintEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitActionListClassesTActionMethodsGetCheckedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitActionListClassesTActionMethodsSetCheckedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitActionListClassesTActionMethodsGetNameEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitActionListClassesTActionMethodsSetNameEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitActionListClassesTActionListMethodsGetCountEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitActionListClassesTActionListMethodsGetActionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitActionListClassesTActionListMethodsFindActionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitActionListClassesTActionMethodsExecuteEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitActionListClassesTActionMethodsGetShortCutEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitActionListClassesTActionMethodsSetShortCutEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitActionListClassesTActionMethodsSetOnUpdateEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitActionListClassesTActionMethodsSetOnExecuteEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitActionListClassesTActionListConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitActionListClassesTActionListCleanUp(ExternalObject: TObject);
    procedure dwsUnitActionListClassesTActionListMethodsAddEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitActionListClassesTActionMethodsGetImageIndexEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitActionListClassesTActionMethodsSetImageIndexEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitActionListClassesTActionCleanUp(ExternalObject: TObject);
    procedure dwsUnitActionListClassesTActionListMethodsGetImageListEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitActionListClassesTActionListMethodsSetImageListEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitActionListClassesTActionMethodsUpdateEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitActionListClassesTActionMethodsGetAutoCheckEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitActionListClassesTActionMethodsSetAutoCheckEval(Info: TProgramInfo; ExtObject: TObject);
  private
  protected
    procedure OnActionUpdateHandler(Sender: TObject); // TAction
    procedure OnActionExecuteHandler(Sender: TObject); // TAction
  protected
    // IScriptModule
    procedure Initialize(ADelphiWebScript: TDelphiWebScript); override;
  public
  end;

// -----------------------------------------------------------------------------

type
  TScriptActionListWrapper = class(TScriptComponentWrapperBase<TActionList>);

type
  TScriptActionWrapper = class(TScriptComponentWrapperBase<TAction>)
  private
  protected
  public
    procedure DetachWrappedObject; override;
  end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

implementation

{$R *.dfm}

uses
  Windows,
  ImgList,
  System.Actions,

  {$ifndef OLD_DWSCRIPT}
  dwsInfo,
{$endif OLD_DWSCRIPT}

  amScript.Debugger.API;

// -----------------------------------------------------------------------------
//
// TDataModuleScriptUserInterfaceActionList
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceActionList.Initialize(ADelphiWebScript: TDelphiWebScript);
begin
  inherited;
(*
  ScriptService.RegisterClassTypeMapping(TActionList);
  ScriptService.RegisterClassTypeMapping(TAction);
*)
end;

// -----------------------------------------------------------------------------
//
// Control event handlers
//
// -----------------------------------------------------------------------------
// Dispatches to the ScriptModule event handler
// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceActionList.OnActionExecuteHandler(Sender: TObject);
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
      OutputDebugString('OnActionExecuteHandler: Script Object has been destroyed');
      Continue;
    end;

    ScriptObjectInfo := Wrapper.AcquireInfo;
    Delegate := ScriptObjectInfo.Info.Member['FOnExecute'];

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
    TAction(Sender).OnExecute := nil;
end;

procedure TDataModuleScriptUserInterfaceActionList.OnActionUpdateHandler(Sender: TObject);
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
      OutputDebugString('OnActionUpdateHandler: Script Object has been destroyed');
      Continue;
    end;

    // Guard against recursion inside debugger
    if (TScriptObjInstance(Wrapper.ScriptObj).ExecutionContext.IsDebugging) then
      if (TScriptDebugger(TScriptObjInstance(Wrapper.ScriptObj).ExecutionContext.Debugger).IsSuspended) then
        exit;

    ScriptObjectInfo := Wrapper.AcquireInfo;
    Delegate := ScriptObjectInfo.Info.Member['FOnUpdate'];

    if (Delegate <> nil) and (not Delegate.ValueIsEmpty) then
    begin
      try
        Delegate.Call([Wrapper.ScriptObj]);
        Any := True;
      except
        Delegate.Value := IUnknown(nil);
        ScriptHandleException(Wrapper.Execution);
      end;
      // Only one wrapper can implement the OnUpdate handler
      break;
    end;
  end;
  if (not Any) then
    TAction(Sender).OnUpdate := nil;
end;

// -----------------------------------------------------------------------------
//
// Script: TActionList
//
// -----------------------------------------------------------------------------
// Wraps VCL TActionList
// -----------------------------------------------------------------------------
type
  TScriptActionList = class(TActionList);
  TScriptAction = class(TAction);

procedure TScriptActionWrapper.DetachWrappedObject;
begin
  if (Item <> nil) and (not (Item is TScriptAction)) and (not (csDestroying in Item.ComponentState)) then
  begin
    Item.OnExecute := nil;
    Item.OnUpdate := nil;
  end;
  inherited;
end;

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionListCleanUp(ExternalObject: TObject);
begin
  ExternalObject.Free;
end;

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionListConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  if (ExtObject = nil) then
    ExtObject := TScriptActionListWrapper.CreateOwned(Info, Info.ScriptObj, TScriptActionList);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionListMethodsAddEval(Info: TProgramInfo; ExtObject: TObject);
var
  ActionList: TActionList;
  Action: TContainedAction;
  Wrapper: TScriptObjectWrapperBase;
begin
  ActionList := TScriptComponentWrapper(ExtObject).Item as TActionList;
  Action := TScriptAction.Create(ActionList);
  Action.ActionList := ActionList;
  Wrapper := TScriptActionWrapper.Create(Info, Action, True);
  Info.ResultAsVariant := Wrapper.ScriptObj;
end;

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionListMethodsFindActionEval(Info: TProgramInfo; ExtObject: TObject);
var
  ActionList: TActionList;
  Name: string;
  Action: TContainedAction;
  i: integer;
  Wrapper: TScriptObjectWrapperBase;
begin
  ActionList := TScriptComponentWrapper(ExtObject).Item as TActionList;
  Name := Info.ParamAsString[0];
  Action := nil;
  for i := 0 to ActionList.ActionCount-1 do
    if (AnsiSameText(ActionList.Actions[i].Name, Name)) then
    begin
      Action := ActionList.Actions[i];
      break;
    end;

  if (Action = nil) then
  begin
    Info.ResultAsVariant := IUnknown(nil);
    exit;
  end;

  Wrapper := Environment(Info).FindWrapper(Action);
  if (Wrapper = nil) then
    Wrapper := TScriptActionWrapper.Create(Info, Action);

  Info.ResultAsVariant := Wrapper.ScriptObj;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionListMethodsGetActionEval(Info: TProgramInfo; ExtObject: TObject);
var
  ActionList: TActionList;
  Action: TContainedAction;
  Wrapper: TScriptObjectWrapperBase;
begin
  ActionList := TScriptComponentWrapper(ExtObject).Item as TActionList;
  Action := ActionList.Actions[Info.ParamAsInteger[0]];
  Wrapper := Environment(Info).FindWrapper(Action);
  if (Wrapper = nil) then
    Wrapper := TScriptActionWrapper.Create(Info, Action);

  Info.ResultAsVariant := Wrapper.ScriptObj;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionListMethodsGetCountEval(Info: TProgramInfo; ExtObject: TObject);
var
  ActionList: TActionList;
begin
  ActionList := TScriptComponentWrapper(ExtObject).Item as TActionList;
  Info.ResultAsInteger := ActionList.ActionCount;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionListMethodsGetImageListEval(Info: TProgramInfo; ExtObject: TObject);
var
  ActionList: TActionList;
begin
  ActionList := TScriptComponentWrapper(ExtObject).Item as TActionList;
  Info.ResultAsVariant := CreateResultScriptObject(Info, ActionList.Images);
end;

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionListMethodsSetImageListEval(Info: TProgramInfo; ExtObject: TObject);
var
  ActionList: TActionList;
begin
  ActionList := TScriptComponentWrapper(ExtObject).Item as TActionList;
  if (not Info.Params[0].ValueIsEmpty) then
    ActionList.Images := Info.Params[0].ExternalObject as TCustomImageList
  else
    ActionList.Images := nil;
end;

// -----------------------------------------------------------------------------
//
// Script: TAction
//
// -----------------------------------------------------------------------------
// Wraps VCL TCustomAction
// Note: Actions in the "Hidden" category are read only.
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionCleanUp(ExternalObject: TObject);
begin
  ExternalObject.Free;
end;

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionMethodsExecuteEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (SameText(TAction(TScriptComponentWrapper(ExtObject).Item).Category, 'Hidden')) then
    Info.ResultAsBoolean := False
  else
    Info.ResultAsBoolean := TAction(TScriptComponentWrapper(ExtObject).Item).Execute;
end;

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionMethodsUpdateEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TAction(TScriptComponentWrapper(ExtObject).Item).Update;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionMethodsGetAutoCheckEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (SameText(TAction(TScriptComponentWrapper(ExtObject).Item).Category, 'Hidden')) then
    Info.ResultAsBoolean := False
  else
    Info.ResultAsBoolean := TAction(TScriptComponentWrapper(ExtObject).Item).AutoCheck;
end;

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionMethodsSetAutoCheckEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (SameText(TAction(TScriptComponentWrapper(ExtObject).Item).Category, 'Hidden')) then
    exit;

  TAction(TScriptComponentWrapper(ExtObject).Item).AutoCheck := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionMethodsGetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (SameText(TAction(TScriptComponentWrapper(ExtObject).Item).Category, 'Hidden')) then
    Info.ResultAsString := ''
  else
    Info.ResultAsString := TAction(TScriptComponentWrapper(ExtObject).Item).Caption;
end;

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionMethodsSetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (SameText(TAction(TScriptComponentWrapper(ExtObject).Item).Category, 'Hidden')) then
    exit;
  TAction(TScriptComponentWrapper(ExtObject).Item).Caption := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionMethodsGetCheckedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (SameText(TAction(TScriptComponentWrapper(ExtObject).Item).Category, 'Hidden')) then
    Info.ResultAsBoolean := False
  else
    Info.ResultAsBoolean := TAction(TScriptComponentWrapper(ExtObject).Item).Checked;
end;

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionMethodsSetCheckedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (SameText(TAction(TScriptComponentWrapper(ExtObject).Item).Category, 'Hidden')) then
    exit;

  TAction(TScriptComponentWrapper(ExtObject).Item).Checked := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionMethodsGetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (SameText(TAction(TScriptComponentWrapper(ExtObject).Item).Category, 'Hidden')) then
    Info.ResultAsBoolean := False
  else
    Info.ResultAsBoolean := TAction(TScriptComponentWrapper(ExtObject).Item).Enabled;
end;

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionMethodsSetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (SameText(TAction(TScriptComponentWrapper(ExtObject).Item).Category, 'Hidden')) then
    exit;

  TAction(TScriptComponentWrapper(ExtObject).Item).Enabled := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionMethodsGetHintEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (SameText(TAction(TScriptComponentWrapper(ExtObject).Item).Category, 'Hidden')) then
    Info.ResultAsString := ''
  else
    Info.ResultAsString := TAction(TScriptComponentWrapper(ExtObject).Item).Hint;
end;

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionMethodsSetHintEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (SameText(TAction(TScriptComponentWrapper(ExtObject).Item).Category, 'Hidden')) then
    exit;
  TAction(TScriptComponentWrapper(ExtObject).Item).Hint := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionMethodsGetImageIndexEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TAction(TScriptComponentWrapper(ExtObject).Item).ImageIndex;
end;

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionMethodsSetImageIndexEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TAction(TScriptComponentWrapper(ExtObject).Item).ImageIndex := Info.ParamAsInteger[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionMethodsGetNameEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (SameText(TAction(TScriptComponentWrapper(ExtObject).Item).Category, 'Hidden')) then
    Info.ResultAsString := ''
  else
    Info.ResultAsString := TAction(TScriptComponentWrapper(ExtObject).Item).Name;
end;

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionMethodsSetNameEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (SameText(TAction(TScriptComponentWrapper(ExtObject).Item).Category, 'Hidden')) then
    exit;

  TAction(TScriptComponentWrapper(ExtObject).Item).Name := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionMethodsSetOnExecuteEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (SameText(TAction(TScriptComponentWrapper(ExtObject).Item).Category, 'Hidden')) then
    exit;

  // Attach modules's event handler to control's event event
  if (not Info.Params[0].ValueIsEmpty) then
  begin
    Info.Vars['FOnExecute'].Value := Info.Params[0].Value;
    TAction(TScriptComponentWrapper(ExtObject).Item).OnExecute := OnActionExecuteHandler;
  end else
    TAction(TScriptComponentWrapper(ExtObject).Item).OnExecute := nil;
end;

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionMethodsSetOnUpdateEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (SameText(TAction(TScriptComponentWrapper(ExtObject).Item).Category, 'Hidden')) then
    exit;

  // Attach modules's event handler to control's event event
  if (not Info.Params[0].ValueIsEmpty) then
  begin
    Info.Vars['FOnUpdate'].Value := Info.Params[0].Value;
    TAction(TScriptComponentWrapper(ExtObject).Item).OnUpdate := OnActionUpdateHandler;
  end else
    TAction(TScriptComponentWrapper(ExtObject).Item).OnUpdate := nil;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionMethodsGetShortCutEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (SameText(TAction(TScriptComponentWrapper(ExtObject).Item).Category, 'Hidden')) then
  begin
    Info.ResultAsInteger := 0; // Don't reveal shortcut of hidden action
    exit;
  end;

  Info.ResultAsInteger := TAction(TScriptComponentWrapper(ExtObject).Item).ShortCut;
end;

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionMethodsSetShortCutEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (SameText(TAction(TScriptComponentWrapper(ExtObject).Item).Category, 'Hidden')) then
    exit;

  TAction(TScriptComponentWrapper(ExtObject).Item).ShortCut := Info.ParamAsInteger[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionMethodsGetVisibleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (SameText(TAction(TScriptComponentWrapper(ExtObject).Item).Category, 'Hidden')) then
    Info.ResultAsBoolean := False
  else
    Info.ResultAsBoolean := TAction(TScriptComponentWrapper(ExtObject).Item).Visible;
end;

procedure TDataModuleScriptUserInterfaceActionList.dwsUnitActionListClassesTActionMethodsSetVisibleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (SameText(TAction(TScriptComponentWrapper(ExtObject).Item).Category, 'Hidden')) then
    exit;

  TAction(TScriptComponentWrapper(ExtObject).Item).Visible := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

initialization
  TDataModuleScriptUserInterfaceActionList.RegisterModule;
end.
