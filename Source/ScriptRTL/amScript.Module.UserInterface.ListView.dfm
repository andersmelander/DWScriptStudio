object DataModuleScriptUserInterfaceListView: TDataModuleScriptUserInterfaceListView
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListViewMethodsGetListItemsEval
          end
          item
            Name = 'GetListColumns'
            ResultType = 'TListColumns'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListViewMethodsGetListColumnsEval
          end
          item
            Name = 'GetRowSelect'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListViewMethodsGetRowSelectEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitListViewClassesTListViewMethodsSetRowSelectEval
          end
          item
            Name = 'GetCheckBoxes'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListViewMethodsGetCheckBoxesEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitListViewClassesTListViewMethodsSetCheckboxesEval
          end
          item
            Name = 'GetGridLines'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListViewMethodsGetGridLinesEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitListViewClassesTListViewMethodsSetGridLinesEval
          end
          item
            Name = 'GetItemFocused'
            ResultType = 'TListItem'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListViewMethodsGetItemFocusedEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitListViewClassesTListViewMethodsSetItemFocusedEval
          end
          item
            Name = 'GetSelected'
            ResultType = 'TListItem'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListViewMethodsGetSelectedEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitListViewClassesTListViewMethodsSetSelectedEval
          end
          item
            Name = 'GetSelCount'
            ResultType = 'Integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListViewMethodsGetSelCountEval
          end
          item
            Name = 'GetReadOnly'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListViewMethodsGetReadOnlyEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitListViewClassesTListViewMethodsSetReadOnlyEval
          end
          item
            Name = 'GetShowColumnHeaders'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListViewMethodsGetShowColumnHeadersEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitListViewClassesTListViewMethodsSetShowColumnHeadersEval
          end
          item
            Name = 'GetViewStyle'
            ResultType = 'TListViewStyle'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListViewMethodsGetViewStyleEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitListViewClassesTListViewMethodsSetViewStyleEval
          end
          item
            Name = 'GetMultiSelect'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListViewMethodsGetMultiSelectEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitListViewClassesTListViewMethodsSetMultiSelectEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitListViewClassesTListViewMethodsSetOnEditedEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitListViewClassesTListViewMethodsSetOnEditingEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitListViewClassesTListViewMethodsSetOnSelectItemEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitListViewClassesTListViewMethodsSetOnItemCheckedEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListItemsMethodsGetCountEval
          end
          item
            Name = 'GetItem'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'TListItem'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListItemsMethodsGetItemEval
          end
          item
            Name = 'Add'
            ResultType = 'TListItem'
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListItemsMethodsAddEval
          end
          item
            Name = 'BeginUpdate'
            Kind = mkProcedure
            OnEval = dwsUnitListViewClassesTListItemsMethodsBeginUpdateEval
          end
          item
            Name = 'EndUpdate'
            Kind = mkProcedure
            OnEval = dwsUnitListViewClassesTListItemsMethodsEndUpdateEval
          end
          item
            Name = 'Clear'
            Kind = mkProcedure
            OnEval = dwsUnitListViewClassesTListItemsMethodsClearEval
          end
          item
            Name = 'Delete'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
            Kind = mkProcedure
            OnEval = dwsUnitListViewClassesTListItemsMethodsDeleteEval
          end
          item
            Name = 'Insert'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'Integer'
              end>
            ResultType = 'TListItem'
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListItemsMethodsInsertEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListItemMethodsGetCaptionEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitListViewClassesTListItemMethodsSetCaptionEval
          end
          item
            Name = 'GetChecked'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListItemMethodsGetCheckedEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitListViewClassesTListItemMethodsSetCheckedEval
          end
          item
            Name = 'GetImageIndex'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListItemMethodsGetImageIndexEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitListViewClassesTListItemMethodsSetImageIndexEval
          end
          item
            Name = 'GetIndex'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListItemMethodsGetIndexEval
          end
          item
            Name = 'GetSelected'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListItemMethodsGetSelectedEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitListViewClassesTListItemMethodsSetSelectedEval
          end
          item
            Name = 'GetSubItems'
            ResultType = 'TStrings'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListItemMethodsGetSubItemsEval
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
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListColumnsMethodsAddEval
          end
          item
            Name = 'GetItem'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'TListColumn'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListColumnsMethodsGetItemEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListColumnMethodsGetCaptionEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitListViewClassesTListColumnMethodsSetCaptionEval
          end
          item
            Name = 'GetMaxWidth'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListColumnMethodsGetMaxWidthEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitListViewClassesTListColumnMethodsSetMaxWidthEval
          end
          item
            Name = 'GetMinWidth'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListColumnMethodsGetMinWidthEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitListViewClassesTListColumnMethodsSetMinWidthEval
          end
          item
            Name = 'GetWidth'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListColumnMethodsGetWidthEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitListViewClassesTListColumnMethodsSetWidthEval
          end
          item
            Name = 'GetAlignment'
            ResultType = 'TAlignment'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListColumnMethodsGetAlignmentEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitListViewClassesTListColumnMethodsSetAlignmentEval
          end
          item
            Name = 'GetAutoSize'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitListViewClassesTListColumnMethodsGetAutoSizeEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitListViewClassesTListColumnMethodsSetAutoSizeEval
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
