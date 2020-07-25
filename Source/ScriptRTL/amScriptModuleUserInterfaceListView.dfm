object DataModuleScriptUserInterfaceListView: TDataModuleScriptUserInterfaceListView
  OldCreateOrder = False
  Height = 287
  Width = 402
  object dwsUnitListView: TdwsUnit
    Classes = <
      item
        Name = 'TListView'
        Ancestor = 'TCustomControl'
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'AOwner'
                DataType = 'TComponent'
              end>
            OnEval = dwsUnitControlsClassesTListViewConstructorsCreateEval
          end>
        Fields = <
          item
            Name = 'FOnEdited'
            DataType = 'TListViewEditedEvent'
            Visibility = cvPrivate
          end
          item
            Name = 'FOnEditing'
            DataType = 'TListViewEditingEvent'
            Visibility = cvPrivate
          end
          item
            Name = 'FOnSelectItem'
            DataType = 'TListViewItemEvent'
            Visibility = cvPrivate
          end
          item
            Name = 'FOnItemChecked'
            DataType = 'TListViewItemEvent'
            Visibility = cvPrivate
          end>
        Methods = <
          item
            Name = 'GetListItems'
            ResultType = 'TListItems'
            OnEval = dwsUnitListViewClassesTListViewMethodsGetListItemsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetListColumns'
            ResultType = 'TListColumns'
            OnEval = dwsUnitListViewClassesTListViewMethodsGetListColumnsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetRowSelect'
            ResultType = 'boolean'
            OnEval = dwsUnitListViewClassesTListViewMethodsGetRowSelectEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetRowSelect'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitListViewClassesTListViewMethodsSetRowSelectEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetCheckBoxes'
            ResultType = 'boolean'
            OnEval = dwsUnitListViewClassesTListViewMethodsGetCheckBoxesEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetCheckboxes'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitListViewClassesTListViewMethodsSetCheckboxesEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetGridLines'
            ResultType = 'boolean'
            OnEval = dwsUnitListViewClassesTListViewMethodsGetGridLinesEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetGridLines'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitListViewClassesTListViewMethodsSetGridLinesEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetItemFocused'
            ResultType = 'TListItem'
            OnEval = dwsUnitListViewClassesTListViewMethodsGetItemFocusedEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetItemFocused'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TListItem'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitListViewClassesTListViewMethodsSetItemFocusedEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetSelected'
            ResultType = 'TListItem'
            OnEval = dwsUnitListViewClassesTListViewMethodsGetSelectedEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetSelected'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TListItem'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitListViewClassesTListViewMethodsSetSelectedEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetSelCount'
            ResultType = 'Integer'
            OnEval = dwsUnitListViewClassesTListViewMethodsGetSelCountEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetReadOnly'
            ResultType = 'boolean'
            OnEval = dwsUnitListViewClassesTListViewMethodsGetReadOnlyEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetReadOnly'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitListViewClassesTListViewMethodsSetReadOnlyEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetShowColumnHeaders'
            ResultType = 'boolean'
            OnEval = dwsUnitListViewClassesTListViewMethodsGetShowColumnHeadersEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetShowColumnHeaders'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitListViewClassesTListViewMethodsSetShowColumnHeadersEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetViewStyle'
            ResultType = 'TListViewStyle'
            OnEval = dwsUnitListViewClassesTListViewMethodsGetViewStyleEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetViewStyle'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TListViewStyle'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitListViewClassesTListViewMethodsSetViewStyleEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetMultiSelect'
            ResultType = 'boolean'
            OnEval = dwsUnitListViewClassesTListViewMethodsGetMultiSelectEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetMultiSelect'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitListViewClassesTListViewMethodsSetMultiSelectEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetOnEdited'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TListViewEditedEvent'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitListViewClassesTListViewMethodsSetOnEditedEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetOnEditing'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TListViewEditingEvent'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitListViewClassesTListViewMethodsSetOnEditingEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetOnSelectItem'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TListViewItemEvent'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitListViewClassesTListViewMethodsSetOnSelectItemEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetOnItemChecked'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TListViewItemEvent'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitListViewClassesTListViewMethodsSetOnItemCheckedEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Items'
            DataType = 'TListItems'
            ReadAccess = 'GetListItems'
          end
          item
            Name = 'Columns'
            DataType = 'TListColumns'
            ReadAccess = 'GetListColumns'
          end
          item
            Name = 'RowSelect'
            DataType = 'boolean'
            ReadAccess = 'GetRowSelect'
            WriteAccess = 'SetRowSelect'
          end
          item
            Name = 'Checkboxes'
            DataType = 'boolean'
            ReadAccess = 'GetCheckBoxes'
            WriteAccess = 'SetCheckboxes'
          end
          item
            Name = 'GridLines'
            DataType = 'boolean'
            ReadAccess = 'GetGridLines'
            WriteAccess = 'SetGridLines'
          end
          item
            Name = 'ItemFocused'
            DataType = 'TListItem'
            ReadAccess = 'GetItemFocused'
            WriteAccess = 'SetItemFocused'
          end
          item
            Name = 'Selected'
            DataType = 'TListItem'
            ReadAccess = 'GetSelected'
            WriteAccess = 'SetSelected'
          end
          item
            Name = 'SelCount'
            DataType = 'Integer'
            ReadAccess = 'GetSelCount'
          end
          item
            Name = 'ReadOnly'
            DataType = 'boolean'
            ReadAccess = 'GetReadOnly'
            WriteAccess = 'SetReadOnly'
          end
          item
            Name = 'ShowColumnHeaders'
            DataType = 'boolean'
            ReadAccess = 'GetShowColumnHeaders'
            WriteAccess = 'SetShowColumnHeaders'
          end
          item
            Name = 'ViewStyle'
            DataType = 'TListViewStyle'
            ReadAccess = 'GetViewStyle'
            WriteAccess = 'SetViewStyle'
          end
          item
            Name = 'MultiSelect'
            DataType = 'boolean'
            ReadAccess = 'GetMultiSelect'
            WriteAccess = 'SetMultiSelect'
          end
          item
            Name = 'OnEdited'
            DataType = 'TListViewEditedEvent'
            ReadAccess = 'FOnEdited'
            WriteAccess = 'SetOnEdited'
          end
          item
            Name = 'OnEditing'
            DataType = 'TListViewEditingEvent'
            ReadAccess = 'FOnEditing'
            WriteAccess = 'SetOnEditing'
          end
          item
            Name = 'OnSelectItem'
            DataType = 'TListViewItemEvent'
            ReadAccess = 'FOnSelectItem'
            WriteAccess = 'SetOnSelectItem'
          end
          item
            Name = 'OnItemChecked'
            DataType = 'TListViewItemEvent'
            ReadAccess = 'FOnItemChecked'
            WriteAccess = 'SetOnItemChecked'
          end>
      end
      item
        Name = 'TListItems'
        IsSealed = True
        IsInternal = True
        Methods = <
          item
            Name = 'GetCount'
            ResultType = 'integer'
            OnEval = dwsUnitListViewClassesTListItemsMethodsGetCountEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetItem'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'TListItem'
            OnEval = dwsUnitListViewClassesTListItemsMethodsGetItemEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'Add'
            ResultType = 'TListItem'
            OnEval = dwsUnitListViewClassesTListItemsMethodsAddEval
            Kind = mkFunction
          end
          item
            Name = 'BeginUpdate'
            OnEval = dwsUnitListViewClassesTListItemsMethodsBeginUpdateEval
            Kind = mkProcedure
          end
          item
            Name = 'EndUpdate'
            OnEval = dwsUnitListViewClassesTListItemsMethodsEndUpdateEval
            Kind = mkProcedure
          end
          item
            Name = 'Clear'
            OnEval = dwsUnitListViewClassesTListItemsMethodsClearEval
            Kind = mkProcedure
          end
          item
            Name = 'Delete'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
            OnEval = dwsUnitListViewClassesTListItemsMethodsDeleteEval
            Kind = mkProcedure
          end
          item
            Name = 'Insert'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
            ResultType = 'TListItem'
            OnEval = dwsUnitListViewClassesTListItemsMethodsInsertEval
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Count'
            DataType = 'integer'
            ReadAccess = 'GetCount'
          end
          item
            Name = 'Item'
            DataType = 'TListItem'
            ReadAccess = 'GetItem'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
            IsDefault = True
          end>
      end
      item
        Name = 'TListItem'
        IsSealed = True
        IsInternal = True
        Methods = <
          item
            Name = 'GetCaption'
            ResultType = 'string'
            OnEval = dwsUnitListViewClassesTListItemMethodsGetCaptionEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetCaption'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitListViewClassesTListItemMethodsSetCaptionEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetChecked'
            ResultType = 'boolean'
            OnEval = dwsUnitListViewClassesTListItemMethodsGetCheckedEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetChecked'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitListViewClassesTListItemMethodsSetCheckedEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetImageIndex'
            ResultType = 'integer'
            OnEval = dwsUnitListViewClassesTListItemMethodsGetImageIndexEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetImageIndex'
            Parameters = <
              item
                Name = 'value'
                DataType = 'Integer'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitListViewClassesTListItemMethodsSetImageIndexEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetIndex'
            ResultType = 'integer'
            OnEval = dwsUnitListViewClassesTListItemMethodsGetIndexEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetSelected'
            ResultType = 'boolean'
            OnEval = dwsUnitListViewClassesTListItemMethodsGetSelectedEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetSelected'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitListViewClassesTListItemMethodsSetSelectedEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetSubItems'
            ResultType = 'TStrings'
            OnEval = dwsUnitListViewClassesTListItemMethodsGetSubItemsEval
            Visibility = cvProtected
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Caption'
            DataType = 'string'
            ReadAccess = 'GetCaption'
            WriteAccess = 'SetCaption'
          end
          item
            Name = 'Checked'
            DataType = 'boolean'
            ReadAccess = 'GetChecked'
            WriteAccess = 'SetChecked'
          end
          item
            Name = 'ImageIndex'
            DataType = 'Integer'
            ReadAccess = 'GetImageIndex'
            WriteAccess = 'SetImageIndex'
          end
          item
            Name = 'Index'
            DataType = 'integer'
            ReadAccess = 'GetIndex'
          end
          item
            Name = 'Selected'
            DataType = 'boolean'
            ReadAccess = 'GetSelected'
            WriteAccess = 'SetSelected'
          end
          item
            Name = 'SubItems'
            DataType = 'TStrings'
            ReadAccess = 'GetSubItems'
          end>
      end
      item
        Name = 'TListColumns'
        Ancestor = 'TCollection'
        IsSealed = True
        IsInternal = True
        Methods = <
          item
            Name = 'Add'
            ResultType = 'TListColumn'
            OnEval = dwsUnitListViewClassesTListColumnsMethodsAddEval
            Kind = mkFunction
          end
          item
            Name = 'GetItem'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'TListColumn'
            OnEval = dwsUnitListViewClassesTListColumnsMethodsGetItemEval
            Visibility = cvProtected
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Items'
            DataType = 'TListColumn'
            ReadAccess = 'GetItem'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
            IsDefault = True
          end>
      end
      item
        Name = 'TListColumn'
        Ancestor = 'TCollectionItem'
        IsSealed = True
        IsInternal = True
        Methods = <
          item
            Name = 'GetCaption'
            ResultType = 'string'
            OnEval = dwsUnitListViewClassesTListColumnMethodsGetCaptionEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetCaption'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitListViewClassesTListColumnMethodsSetCaptionEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetMaxWidth'
            ResultType = 'integer'
            OnEval = dwsUnitListViewClassesTListColumnMethodsGetMaxWidthEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetMaxWidth'
            Parameters = <
              item
                Name = 'value'
                DataType = 'integer'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitListViewClassesTListColumnMethodsSetMaxWidthEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetMinWidth'
            ResultType = 'integer'
            OnEval = dwsUnitListViewClassesTListColumnMethodsGetMinWidthEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetMinWidth'
            Parameters = <
              item
                Name = 'value'
                DataType = 'integer'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitListViewClassesTListColumnMethodsSetMinWidthEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetWidth'
            ResultType = 'integer'
            OnEval = dwsUnitListViewClassesTListColumnMethodsGetWidthEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetWidth'
            Parameters = <
              item
                Name = 'value'
                DataType = 'integer'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitListViewClassesTListColumnMethodsSetWidthEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetAlignment'
            ResultType = 'TAlignment'
            OnEval = dwsUnitListViewClassesTListColumnMethodsGetAlignmentEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetAlignment'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TAlignment'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitListViewClassesTListColumnMethodsSetAlignmentEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetAutoSize'
            ResultType = 'boolean'
            OnEval = dwsUnitListViewClassesTListColumnMethodsGetAutoSizeEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetAutoSize'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitListViewClassesTListColumnMethodsSetAutoSizeEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Caption'
            DataType = 'string'
            ReadAccess = 'GetCaption'
            WriteAccess = 'SetCaption'
          end
          item
            Name = 'MaxWidth'
            DataType = 'integer'
            ReadAccess = 'GetMaxWidth'
            WriteAccess = 'SetMaxWidth'
          end
          item
            Name = 'MinWidth'
            DataType = 'integer'
            ReadAccess = 'GetMinWidth'
            WriteAccess = 'SetMinWidth'
          end
          item
            Name = 'Width'
            DataType = 'integer'
            ReadAccess = 'GetWidth'
            WriteAccess = 'SetWidth'
          end
          item
            Name = 'Alignment'
            DataType = 'TAlignment'
            ReadAccess = 'GetAlignment'
            WriteAccess = 'SetAlignment'
          end
          item
            Name = 'AutoSize'
            DataType = 'boolean'
            ReadAccess = 'GetAutoSize'
            WriteAccess = 'SetAutoSize'
          end>
      end>
    Dependencies.Strings = (
      'System.Classes'
      'System.UI.Controls')
    Enumerations = <
      item
        Name = 'TListViewStyle'
        Elements = <
          item
            Name = 'vsIcon'
          end
          item
            Name = 'vsSmallIcon'
          end
          item
            Name = 'vsList'
          end
          item
            Name = 'vsReport'
          end>
      end>
    Delegates = <
      item
        Name = 'TListViewEditingEvent'
        Parameters = <
          item
            Name = 'Sender'
            DataType = 'TListView'
          end
          item
            Name = 'Item'
            DataType = 'TListItem'
          end
          item
            Name = 'AllowEdit'
            DataType = 'boolean'
            IsVarParam = True
          end>
      end
      item
        Name = 'TListViewEditedEvent'
        Parameters = <
          item
            Name = 'Sender'
            DataType = 'TListView'
          end
          item
            Name = 'Item'
            DataType = 'TListItem'
          end
          item
            Name = 'S'
            DataType = 'string'
            IsVarParam = True
          end>
      end
      item
        Name = 'TListViewItemEvent'
        Parameters = <
          item
            Name = 'Sender'
            DataType = 'TListView'
          end
          item
            Name = 'Item'
            DataType = 'TListItem'
          end>
      end>
    UnitName = 'System.UI.ListView'
    StaticSymbols = False
    Left = 92
    Top = 48
  end
end
