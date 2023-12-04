object DataModuleScriptUserInterfaceActionList: TDataModuleScriptUserInterfaceActionList
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitActionListClassesTActionMethodsGetEnabledEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitActionListClassesTActionMethodsSetEnabledEval
          end
          item
            Name = 'GetVisible'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitActionListClassesTActionMethodsGetVisibleEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitActionListClassesTActionMethodsSetVisibleEval
          end
          item
            Name = 'GetCaption'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitActionListClassesTActionMethodsGetCaptionEval
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
            OnEval = dwsUnitActionListClassesTActionMethodsSetCaptionEval
          end
          item
            Name = 'GetHint'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitActionListClassesTActionMethodsGetHintEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitActionListClassesTActionMethodsSetHintEval
          end
          item
            Name = 'GetChecked'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitActionListClassesTActionMethodsGetCheckedEval
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
            OnEval = dwsUnitActionListClassesTActionMethodsSetCheckedEval
          end
          item
            Name = 'GetName'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitActionListClassesTActionMethodsGetNameEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitActionListClassesTActionMethodsSetNameEval
          end
          item
            Name = 'Execute'
            ResultType = 'boolean'
            Kind = mkFunction
            OnEval = dwsUnitActionListClassesTActionMethodsExecuteEval
          end
          item
            Name = 'Update'
            ResultType = 'boolean'
            Kind = mkFunction
            OnEval = dwsUnitActionListClassesTActionMethodsUpdateEval
          end
          item
            Name = 'GetShortCut'
            ResultType = 'TShortCut'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitActionListClassesTActionMethodsGetShortCutEval
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
            Visibility = cvPrivate
            Kind = mkProcedure
            OnEval = dwsUnitActionListClassesTActionMethodsSetShortCutEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitActionListClassesTActionMethodsSetOnUpdateEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitActionListClassesTActionMethodsSetOnExecuteEval
          end
          item
            Name = 'GetImageIndex'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitActionListClassesTActionMethodsGetImageIndexEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitActionListClassesTActionMethodsSetImageIndexEval
          end
          item
            Name = 'GetAutoCheck'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitActionListClassesTActionMethodsGetAutoCheckEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitActionListClassesTActionMethodsSetAutoCheckEval
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
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitActionListClassesTActionListMethodsGetCountEval
          end
          item
            Name = 'GetAction'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'TAction'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitActionListClassesTActionListMethodsGetActionEval
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
            Kind = mkFunction
            OnEval = dwsUnitActionListClassesTActionListMethodsFindActionEval
          end
          item
            Name = 'Add'
            ResultType = 'TAction'
            Kind = mkFunction
            OnEval = dwsUnitActionListClassesTActionListMethodsAddEval
          end
          item
            Name = 'GetImages'
            ResultType = 'TImageList'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitActionListClassesTActionListMethodsGetImageListEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitActionListClassesTActionListMethodsSetImageListEval
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
