unit amScriptModuleUserInterfaceListView;

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

  amScriptModule;

// -----------------------------------------------------------------------------
//
// TDataModuleScriptUserInterfaceListView
//
// -----------------------------------------------------------------------------
type
  TDataModule = class(TScriptModule);

  TDataModuleScriptUserInterfaceListView = class(TDataModule)
    dwsUnitListView: TdwsUnit;
    procedure dwsUnitControlsClassesTListViewConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitListViewClassesTListViewMethodsGetListItemsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListViewMethodsGetListColumnsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListViewMethodsGetRowSelectEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListViewMethodsSetRowSelectEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListViewMethodsGetCheckBoxesEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListViewMethodsSetCheckboxesEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListViewMethodsGetGridLinesEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListViewMethodsSetGridLinesEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListViewMethodsGetItemFocusedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListViewMethodsSetItemFocusedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListViewMethodsGetSelectedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListViewMethodsSetSelectedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListViewMethodsGetSelCountEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListViewMethodsGetReadOnlyEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListViewMethodsSetReadOnlyEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListViewMethodsGetShowColumnHeadersEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListViewMethodsSetShowColumnHeadersEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListViewMethodsGetViewStyleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListViewMethodsSetViewStyleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListViewMethodsGetMultiSelectEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListViewMethodsSetMultiSelectEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListItemsMethodsGetCountEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListItemsMethodsGetItemEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListItemsMethodsAddEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListItemsMethodsBeginUpdateEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListItemsMethodsEndUpdateEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListItemsMethodsClearEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListItemsMethodsDeleteEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListItemsMethodsInsertEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListItemMethodsGetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListItemMethodsSetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListItemMethodsGetCheckedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListItemMethodsSetCheckedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListItemMethodsGetImageIndexEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListItemMethodsSetImageIndexEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListItemMethodsGetIndexEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListItemMethodsGetSelectedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListItemMethodsSetSelectedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListItemMethodsGetSubItemsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListColumnsMethodsAddEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListColumnsMethodsGetItemEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListColumnMethodsGetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListColumnMethodsSetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListColumnMethodsGetMaxWidthEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListColumnMethodsSetMaxWidthEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListColumnMethodsGetMinWidthEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListColumnMethodsSetMinWidthEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListColumnMethodsGetWidthEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListColumnMethodsSetWidthEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListColumnMethodsGetAlignmentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListColumnMethodsSetAlignmentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListColumnMethodsGetAutoSizeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListColumnMethodsSetAutoSizeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListViewMethodsSetOnEditedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListViewMethodsSetOnEditingEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListViewMethodsSetOnSelectItemEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitListViewClassesTListViewMethodsSetOnItemCheckedEval(Info: TProgramInfo; ExtObject: TObject);
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
  ComCtrls,
  cxListView,
  dwsInfo,
  amScriptAPI;

type
  TScriptListViewWrapper = class(TScriptControlWrapperBase<TcxListView>)
  private
  protected
    procedure OnSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure OnItemChecked(Sender: TObject; Item: TListItem);
    procedure OnEdited(Sender: TObject; Item: TListItem; var S: string);
    procedure OnEditing(Sender: TObject; Item: TListItem; var AllowEdit: Boolean);
  public
  end;

procedure TScriptListViewWrapper.OnEdited(Sender: TObject; Item: TListItem; var S: string);
var
  ScriptObjectInfo: IScriptObjectInfo;
  Delegate: IInfo;
  VarItem: Variant;
  ParamInfo: IInfo;
begin
  ASSERT(Item <> nil);

  if (not CheckScriptObj) then
  begin
    TcxCustomInnerListView(Sender).OnEdited := nil;
    raise EScript.Create('Script Object has been destroyed');
  end;

  ScriptObjectInfo := AcquireInfo;
  Delegate := ScriptObjectInfo.Info.Member['FOnEdited'];

  if (Delegate <> nil) and (Delegate.ScriptObj <> nil) then
  begin
    ParamInfo := Delegate.Parameter['Item'];
    VarItem := TScriptModule.CreateScriptObject(Execution, ParamInfo.TypeSym.Name, Item);

    Delegate.Parameter['Sender'].Value := ScriptObj;
    Delegate.Parameter['Item'].Value := VarItem;
    Delegate.Parameter['S'].ValueAsString := S;
    try

      Delegate.Call;

      S := Delegate.Parameter['S'].ValueAsString;
    except
      TcxCustomInnerListView(Sender).OnEdited := nil;
      ScriptHandleException(Execution);
    end;
  end;
end;

procedure TScriptListViewWrapper.OnEditing(Sender: TObject; Item: TListItem; var AllowEdit: Boolean);
var
  ScriptObjectInfo: IScriptObjectInfo;
  Delegate: IInfo;
  VarItem: Variant;
  ParamInfo: IInfo;
begin
  ASSERT(Item <> nil);

  if (not CheckScriptObj) then
  begin
    TcxCustomInnerListView(Sender).OnEditing := nil;
    raise EScript.Create('Script Object has been destroyed');
  end;

  ScriptObjectInfo := AcquireInfo;
  Delegate := ScriptObjectInfo.Info.Member['FOnEditing'];

  if (Delegate <> nil) and (Delegate.ScriptObj <> nil) then
  begin
    ParamInfo := Delegate.Parameter['Item'];
    VarItem := TScriptModule.CreateScriptObject(Execution, ParamInfo.TypeSym.Name, Item);

    Delegate.Parameter['Sender'].Value := ScriptObj;
    Delegate.Parameter['Item'].Value := VarItem;
    Delegate.Parameter['AllowEdit'].Value := AllowEdit;
    try

      Delegate.Call;

      AllowEdit := Delegate.Parameter['AllowEdit'].Value;
    except
      TcxCustomInnerListView(Sender).OnEditing := nil;
      ScriptHandleException(Execution);
    end;
  end;
end;


procedure TScriptListViewWrapper.OnItemChecked(Sender: TObject; Item: TListItem);
var
  ScriptObjectInfo: IScriptObjectInfo;
  Delegate: IInfo;
  VarItem: Variant;
  ParamInfo: IInfo;
begin
  ASSERT(Item <> nil);

  if (not CheckScriptObj) then
  begin
    TcxCustomInnerListView(Sender).OnItemChecked := nil;
    raise EScript.Create('Script Object has been destroyed');
  end;

  ScriptObjectInfo := AcquireInfo;
  Delegate := ScriptObjectInfo.Info.Member['FOnItemChecked'];

  if (Delegate <> nil) and (Delegate.ScriptObj <> nil) then
  begin
    ParamInfo := Delegate.Parameter['Item'];
    VarItem := TScriptModule.CreateScriptObject(Execution, ParamInfo.TypeSym.Name, Item);

    try

      Delegate.Call([ScriptObj, VarItem]);

    except
      TcxCustomInnerListView(Sender).OnItemChecked := nil;
      ScriptHandleException(Execution);
    end;
  end;
end;

procedure TScriptListViewWrapper.OnSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var
  ScriptObjectInfo: IScriptObjectInfo;
  Delegate: IInfo;
  VarItem: Variant;
  ParamInfo: IInfo;
begin
  ASSERT(Item <> nil);

  if (not CheckScriptObj) then
  begin
    TcxCustomInnerListView(Sender).OnSelectItem := nil;
    raise EScript.Create('Script Object has been destroyed');
  end;

  ScriptObjectInfo := AcquireInfo;

  Delegate := ScriptObjectInfo.Info.Member['FOnSelectItem'];

  if (Delegate <> nil) and (Delegate.ScriptObj <> nil) then
  begin
    ParamInfo := Delegate.Parameter['Item'];

    VarItem := TScriptModule.CreateScriptObject(Execution, ParamInfo.TypeSym.Name, Item);
    try

      Delegate.Call([ScriptObj, VarItem]);

    except
      TcxCustomInnerListView(Sender).OnSelectItem := nil;
      ScriptHandleException(Execution);
    end;
  end;
end;

// -----------------------------------------------------------------------------
//
// TDataModuleScriptUserInterfaceListView
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceListView.Initialize(ADelphiWebScript: TDelphiWebScript);
begin
  inherited;
(*
  ScriptService.RegisterClassTypeMapping(TcxListView, 'TListView');
*)
end;

// -----------------------------------------------------------------------------
//
// Script: TListView
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceListView.dwsUnitControlsClassesTListViewConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TScriptListViewWrapper.CreateOwned(Info, Info.ScriptObj, TcxListView);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListViewMethodsGetListColumnsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  // Wrap ListView.Columns collection
  Info.ResultAsVariant := CreateResultScriptObject(Info, TScriptListViewWrapper(ExtObject).Item.Columns);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListViewMethodsGetListItemsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  // Wrap ListView control
  Info.ResultAsVariant := CreateResultScriptObject(Info, ExtObject);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListViewMethodsGetRowSelectEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TScriptListViewWrapper(ExtObject).Item.RowSelect;
end;

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListViewMethodsSetRowSelectEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptListViewWrapper(ExtObject).Item.RowSelect := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListViewMethodsGetCheckBoxesEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TScriptListViewWrapper(ExtObject).Item.Checkboxes;
end;

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListViewMethodsSetCheckboxesEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptListViewWrapper(ExtObject).Item.Checkboxes := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListViewMethodsGetGridLinesEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TScriptListViewWrapper(ExtObject).Item.GridLines;
end;

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListViewMethodsSetGridLinesEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptListViewWrapper(ExtObject).Item.GridLines := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListViewMethodsGetItemFocusedEval(Info: TProgramInfo; ExtObject: TObject);
var
  ListItem: TListItem;
begin
  ListItem := TScriptListViewWrapper(ExtObject).Item.ItemFocused;

  Info.ResultAsVariant := CreateResultScriptObject(Info, ListItem);
end;

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListViewMethodsSetItemFocusedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (not VarIsNull(Info.Params[0].Value)) then
    TScriptListViewWrapper(ExtObject).Item.ItemFocused := TListItem(Info.ParamAsObject[0])
  else
    TScriptListViewWrapper(ExtObject).Item.ItemFocused := nil;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListViewMethodsGetSelCountEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (TScriptListViewWrapper(ExtObject).Item.HandleAllocated) then // So we can view the property in the debugger
    Info.ResultAsInteger := TScriptListViewWrapper(ExtObject).Item.SelCount
  else
    Info.ResultAsInteger := 0;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListViewMethodsGetSelectedEval(Info: TProgramInfo; ExtObject: TObject);
var
  ListItem: TListItem;
begin
  ListItem := TScriptListViewWrapper(ExtObject).Item.Selected;

  Info.ResultAsVariant := CreateResultScriptObject(Info, ListItem);
end;

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListViewMethodsSetSelectedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (not VarIsNull(Info.Params[0].Value)) then
    TScriptListViewWrapper(ExtObject).Item.Selected := TListItem(Info.ParamAsObject[0])
  else
    TScriptListViewWrapper(ExtObject).Item.Selected := nil;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListViewMethodsGetShowColumnHeadersEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TScriptListViewWrapper(ExtObject).Item.ShowColumnHeaders;
end;

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListViewMethodsSetShowColumnHeadersEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptListViewWrapper(ExtObject).Item.ShowColumnHeaders := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListViewMethodsGetViewStyleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TScriptListViewWrapper(ExtObject).Item.ViewStyle);
end;

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListViewMethodsSetViewStyleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptListViewWrapper(ExtObject).Item.ViewStyle := TViewStyle(Info.ParamAsInteger[0]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListViewMethodsGetReadOnlyEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TScriptListViewWrapper(ExtObject).Item.ReadOnly;
end;

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListViewMethodsSetReadOnlyEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptListViewWrapper(ExtObject).Item.ReadOnly := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListViewMethodsGetMultiSelectEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TScriptListViewWrapper(ExtObject).Item.MultiSelect;
end;

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListViewMethodsSetMultiSelectEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptListViewWrapper(ExtObject).Item.MultiSelect := Info.ParamAsBoolean[0];
end;

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListViewMethodsSetOnEditedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  // Attach wrapper's handler to controls event
  if (not VarIsNull(Info.Params[0].Value)) then
  begin
    Info.Vars['FOnEdited'].Value := Info.Params[0].Value;
    TScriptListViewWrapper(ExtObject).Item.OnEdited := TScriptListViewWrapper(ExtObject).OnEdited;
  end else
    TScriptListViewWrapper(ExtObject).Item.OnEdited := nil;
end;

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListViewMethodsSetOnEditingEval(Info: TProgramInfo; ExtObject: TObject);
begin
  // Attach wrapper's handler to controls event
  if (not VarIsNull(Info.Params[0].Value)) then
  begin
    Info.Vars['FOnEditing'].Value := Info.Params[0].Value;
    TScriptListViewWrapper(ExtObject).Item.OnEditing := TScriptListViewWrapper(ExtObject).OnEditing;
  end else
    TScriptListViewWrapper(ExtObject).Item.OnEditing := nil;
end;

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListViewMethodsSetOnItemCheckedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  // Attach wrapper's handler to controls event
  if (not VarIsNull(Info.Params[0].Value)) then
  begin
    Info.Vars['FOnItemChecked'].Value := Info.Params[0].Value;
    TScriptListViewWrapper(ExtObject).Item.InnerListView.OnItemChecked := TScriptListViewWrapper(ExtObject).OnItemChecked;
  end else
    TScriptListViewWrapper(ExtObject).Item.InnerListView.OnItemChecked := nil;
end;

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListViewMethodsSetOnSelectItemEval(Info: TProgramInfo; ExtObject: TObject);
begin
  // Attach wrapper's handler to controls event
  if (not VarIsNull(Info.Params[0].Value)) then
  begin
    Info.Vars['FOnSelectItem'].Value := Info.Params[0].Value;
    TScriptListViewWrapper(ExtObject).Item.OnSelectItem := TScriptListViewWrapper(ExtObject).OnSelectItem;
  end else
    TScriptListViewWrapper(ExtObject).Item.OnSelectItem := nil;
end;

// -----------------------------------------------------------------------------
//
// Script: TListItems
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListItemsMethodsGetCountEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TScriptListViewWrapper(ExtObject).Item.Items.Count;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListItemsMethodsGetItemEval(Info: TProgramInfo; ExtObject: TObject);
var
  ListItem: TListItem;
begin
  ListItem := TScriptListViewWrapper(ExtObject).Item.Items[Info.ParamAsInteger[0]];

  Info.ResultAsVariant := CreateResultScriptObject(Info, ListItem);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListItemsMethodsAddEval(Info: TProgramInfo; ExtObject: TObject);
var
  ListItem: TListItem;
begin
  ListItem := TScriptListViewWrapper(ExtObject).Item.Items.Add;

  Info.ResultAsVariant := CreateResultScriptObject(Info, ListItem);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListItemsMethodsBeginUpdateEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptListViewWrapper(ExtObject).Item.Items.BeginUpdate;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListItemsMethodsClearEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptListViewWrapper(ExtObject).Item.Items.Clear;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListItemsMethodsDeleteEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptListViewWrapper(ExtObject).Item.Items.Delete(Info.ParamAsInteger[0]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListItemsMethodsEndUpdateEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptListViewWrapper(ExtObject).Item.Items.EndUpdate;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListItemsMethodsInsertEval(Info: TProgramInfo; ExtObject: TObject);
var
  ListItem: TListItem;
begin
  ListItem := TScriptListViewWrapper(ExtObject).Item.Items.Insert(Info.ParamAsInteger[0]);

  Info.ResultAsVariant := CreateResultScriptObject(Info, ListItem);
end;

// -----------------------------------------------------------------------------
//
// Script: TListItem
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListItemMethodsGetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TListItem(ExtObject).Caption;
end;

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListItemMethodsSetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TListItem(ExtObject).Caption := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListItemMethodsGetCheckedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TListItem(ExtObject).Checked;
end;

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListItemMethodsSetCheckedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TListItem(ExtObject).Checked := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListItemMethodsGetImageIndexEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TListItem(ExtObject).ImageIndex;
end;

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListItemMethodsSetImageIndexEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TListItem(ExtObject).ImageIndex := Info.ParamAsInteger[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListItemMethodsGetIndexEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TListItem(ExtObject).Index;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListItemMethodsGetSelectedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TListItem(ExtObject).Selected;
end;

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListItemMethodsSetSelectedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TListItem(ExtObject).Selected := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListItemMethodsGetSubItemsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TListItem(ExtObject).SubItems);
end;

// -----------------------------------------------------------------------------
//
// Script: TListColumns
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListColumnsMethodsAddEval(Info: TProgramInfo; ExtObject: TObject);
var
  ListColumn: TListColumn;
begin
  ListColumn := TListColumns(ExtObject).Add;

  Info.ResultAsVariant := CreateResultScriptObject(Info, ListColumn);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListColumnsMethodsGetItemEval(Info: TProgramInfo; ExtObject: TObject);
var
  ListColumn: TListColumn;
begin
  ListColumn := TListColumns(ExtObject).Items[Info.ParamAsInteger[0]];

  Info.ResultAsVariant := CreateResultScriptObject(Info, ListColumn);
end;

// -----------------------------------------------------------------------------
//
// Script: TListColumn
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListColumnMethodsGetAlignmentEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TListColumn(ExtObject).Alignment);
end;

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListColumnMethodsSetAlignmentEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TListColumn(ExtObject).Alignment := TAlignment(Info.ParamAsInteger[0]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListColumnMethodsGetAutoSizeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TListColumn(ExtObject).AutoSize;
end;

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListColumnMethodsSetAutoSizeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TListColumn(ExtObject).AutoSize := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListColumnMethodsGetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TListColumn(ExtObject).Caption;
end;

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListColumnMethodsSetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TListColumn(ExtObject).Caption := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListColumnMethodsGetMaxWidthEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TListColumn(ExtObject).MaxWidth;
end;

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListColumnMethodsSetMaxWidthEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TListColumn(ExtObject).MaxWidth := Info.ParamAsInteger[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListColumnMethodsGetMinWidthEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TListColumn(ExtObject).MinWidth;
end;

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListColumnMethodsSetMinWidthEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TListColumn(ExtObject).MinWidth := Info.ParamAsInteger[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListColumnMethodsGetWidthEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TListColumn(ExtObject).Width;
end;

procedure TDataModuleScriptUserInterfaceListView.dwsUnitListViewClassesTListColumnMethodsSetWidthEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TListColumn(ExtObject).Width := Info.ParamAsInteger[0];
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

initialization
  TDataModuleScriptUserInterfaceListView.RegisterModule;
end.
