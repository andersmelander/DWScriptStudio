object DataModuleScriptUserInterfaceActionList: TDataModuleScriptUserInterfaceActionList
  OldCreateOrder = False
  Height = 150
  Width = 215
  object dwsUnitActionList: TdwsUnit
    Classes = <
      item
        Name = 'TAction'
        Ancestor = 'TComponent'
        IsInternal = True
        Fields = <
          item
            Name = 'FOnUpdate'
            DataType = 'TActionEvent'
            Visibility = cvPrivate
          end
          item
            Name = 'FOnExecute'
            DataType = 'TActionEvent'
            Visibility = cvPrivate
          end>
        Methods = <
          item
            Name = 'GetEnabled'
            ResultType = 'boolean'
            OnEval = dwsUnitActionListClassesTActionMethodsGetEnabledEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetEnabled'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitActionListClassesTActionMethodsSetEnabledEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetVisible'
            ResultType = 'boolean'
            OnEval = dwsUnitActionListClassesTActionMethodsGetVisibleEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetVisible'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitActionListClassesTActionMethodsSetVisibleEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetCaption'
            ResultType = 'string'
            OnEval = dwsUnitActionListClassesTActionMethodsGetCaptionEval
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
            OnEval = dwsUnitActionListClassesTActionMethodsSetCaptionEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetHint'
            ResultType = 'string'
            OnEval = dwsUnitActionListClassesTActionMethodsGetHintEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetHint'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitActionListClassesTActionMethodsSetHintEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetChecked'
            ResultType = 'boolean'
            OnEval = dwsUnitActionListClassesTActionMethodsGetCheckedEval
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
            OnEval = dwsUnitActionListClassesTActionMethodsSetCheckedEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'GetName'
            ResultType = 'string'
            OnEval = dwsUnitActionListClassesTActionMethodsGetNameEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetName'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitActionListClassesTActionMethodsSetNameEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'Execute'
            ResultType = 'boolean'
            OnEval = dwsUnitActionListClassesTActionMethodsExecuteEval
            Kind = mkFunction
          end
          item
            Name = 'Update'
            ResultType = 'boolean'
            OnEval = dwsUnitActionListClassesTActionMethodsUpdateEval
            Kind = mkFunction
          end
          item
            Name = 'GetShortCut'
            ResultType = 'TShortCut'
            OnEval = dwsUnitActionListClassesTActionMethodsGetShortCutEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetShortCut'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TShortCut'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitActionListClassesTActionMethodsSetShortCutEval
            Visibility = cvPrivate
            Kind = mkProcedure
          end
          item
            Name = 'SetOnUpdate'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TActionEvent'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitActionListClassesTActionMethodsSetOnUpdateEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetOnExecute'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TActionEvent'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitActionListClassesTActionMethodsSetOnExecuteEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetImageIndex'
            ResultType = 'integer'
            OnEval = dwsUnitActionListClassesTActionMethodsGetImageIndexEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetImageIndex'
            Parameters = <
              item
                Name = 'value'
                DataType = 'integer'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitActionListClassesTActionMethodsSetImageIndexEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetAutoCheck'
            ResultType = 'boolean'
            OnEval = dwsUnitActionListClassesTActionMethodsGetAutoCheckEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetAutoCheck'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitActionListClassesTActionMethodsSetAutoCheckEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Name'
            DataType = 'string'
            ReadAccess = 'GetName'
            WriteAccess = 'SetName'
          end
          item
            Name = 'Enabled'
            DataType = 'boolean'
            ReadAccess = 'GetEnabled'
            WriteAccess = 'SetEnabled'
          end
          item
            Name = 'Visible'
            DataType = 'boolean'
            ReadAccess = 'GetVisible'
            WriteAccess = 'SetVisible'
          end
          item
            Name = 'Caption'
            DataType = 'string'
            ReadAccess = 'GetCaption'
            WriteAccess = 'SetCaption'
          end
          item
            Name = 'Hint'
            DataType = 'string'
            ReadAccess = 'GetHint'
            WriteAccess = 'SetHint'
          end
          item
            Name = 'ImageIndex'
            DataType = 'integer'
            ReadAccess = 'GetImageIndex'
            WriteAccess = 'SetImageIndex'
          end
          item
            Name = 'Checked'
            DataType = 'boolean'
            ReadAccess = 'GetChecked'
            WriteAccess = 'SetChecked'
          end
          item
            Name = 'AutoCheck'
            DataType = 'boolean'
            ReadAccess = 'GetAutoCheck'
            WriteAccess = 'SetAutoCheck'
          end
          item
            Name = 'ShortCut'
            DataType = 'TShortCut'
            ReadAccess = 'GetShortCut'
            WriteAccess = 'SetShortCut'
          end
          item
            Name = 'OnUpdate'
            DataType = 'TActionEvent'
            ReadAccess = 'FOnUpdate'
            WriteAccess = 'SetOnUpdate'
          end
          item
            Name = 'OnExecute'
            DataType = 'TActionEvent'
            ReadAccess = 'FOnExecute'
            WriteAccess = 'SetOnExecute'
          end>
        OnCleanUp = dwsUnitActionListClassesTActionCleanUp
      end
      item
        Name = 'TActionList'
        Ancestor = 'TComponent'
        IsSealed = True
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'AOwner'
                DataType = 'TComponent'
              end>
            OnEval = dwsUnitActionListClassesTActionListConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'GetCount'
            ResultType = 'integer'
            OnEval = dwsUnitActionListClassesTActionListMethodsGetCountEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetAction'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'TAction'
            OnEval = dwsUnitActionListClassesTActionListMethodsGetActionEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'FindAction'
            Parameters = <
              item
                Name = 'Name'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TAction'
            OnEval = dwsUnitActionListClassesTActionListMethodsFindActionEval
            Kind = mkFunction
          end
          item
            Name = 'Add'
            ResultType = 'TAction'
            OnEval = dwsUnitActionListClassesTActionListMethodsAddEval
            Kind = mkFunction
          end
          item
            Name = 'GetImages'
            ResultType = 'TImageList'
            OnEval = dwsUnitActionListClassesTActionListMethodsGetImageListEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetImages'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TImageList'
                IsVarParam = True
                IsWritable = False
              end>
            OnEval = dwsUnitActionListClassesTActionListMethodsSetImageListEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Count'
            DataType = 'integer'
            ReadAccess = 'GetCount'
          end
          item
            Name = 'Items'
            DataType = 'TAction'
            ReadAccess = 'GetAction'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            IsDefault = True
          end
          item
            Name = 'Images'
            DataType = 'TImageList'
            ReadAccess = 'GetImages'
            WriteAccess = 'SetImages'
          end>
        OnCleanUp = dwsUnitActionListClassesTActionListCleanUp
      end>
    Dependencies.Strings = (
      'System.UI.ImageList')
    Delegates = <
      item
        Name = 'TActionEvent'
        Parameters = <
          item
            Name = 'Sender'
            DataType = 'TAction'
          end>
      end>
    Synonyms = <
      item
        Name = 'TShortcut'
        DataType = 'integer'
      end>
    UnitName = 'System.UI.ActionList'
    StaticSymbols = False
    Left = 88
    Top = 32
  end
end
