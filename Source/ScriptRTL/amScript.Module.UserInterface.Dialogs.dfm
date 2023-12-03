object DataModuleScriptUserInterfaceDialogs: TDataModuleScriptUserInterfaceDialogs
  Height = 150
  Width = 215
  object dwsUnitDialogs: TdwsUnit
    Classes = <
      item
        Name = 'TTaskDialog'
        Constructors = <
          item
            Name = 'Create'
            OnEval = dwsUnitDialogsClassesTTaskDialogConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'GetTitle'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetTitleEval
          end
          item
            Name = 'SetTitle'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsSetTitleEval
          end
          item
            Name = 'GetInstruction'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetInstructionEval
          end
          item
            Name = 'SetInstruction'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsSetInstructionEval
          end
          item
            Name = 'GetContent'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetContentEval
          end
          item
            Name = 'SetContent'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsSetContentEval
          end
          item
            Name = 'GetInfo'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetInfoEval
          end
          item
            Name = 'SetInfo'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsSetInfoEval
          end
          item
            Name = 'GetFooter'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetFooterEval
          end
          item
            Name = 'SetFooter'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsSetFooterEval
          end
          item
            Name = 'GetVerify'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetVerifyEval
          end
          item
            Name = 'SetVerify'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsSetVerifyEval
          end
          item
            Name = 'GetVerifyChecked'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetVerifyCheckedEval
          end
          item
            Name = 'SetVerifyChecked'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsSetVerifyCheckedEval
          end
          item
            Name = 'GetWidth'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetWidthEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsSetWidthEval
          end
          item
            Name = 'GetFooterIcon'
            ResultType = 'TTaskDialogFooterIcon'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetFooterIconEval
          end
          item
            Name = 'SetFooterIcon'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TTaskDialogFooterIcon'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsSetFooterIconEval
          end
          item
            Name = 'GetDialogIcon'
            ResultType = 'TTaskDialogIcon'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetDialogIconEval
          end
          item
            Name = 'SetDialogIcon'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TTaskDialogIcon'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsSetDialogIconEval
          end
          item
            Name = 'GetOptions'
            ResultType = 'TTaskDialogOptions'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetOptionsEval
          end
          item
            Name = 'SetOptions'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TTaskDialogOptions'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsSetOptionsEval
          end
          item
            Name = 'GetButtons'
            ResultType = 'TTaskDialogButtons'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetButtonsEval
          end
          item
            Name = 'GetCommonButtons'
            ResultType = 'TTaskDialogCommonButtons'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetCommonButtonsEval
          end
          item
            Name = 'SetCommonButtons'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TTaskDialogCommonButtons'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsSetCommonButtonsEval
          end
          item
            Name = 'GetInfoExpandButtonCaption'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetInfoExpandButtonCaptionEval
          end
          item
            Name = 'SetInfoExpandButtonCaption'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsSetInfoExpandButtonCaptionEval
          end
          item
            Name = 'GetInfoCollapseButtonCaption'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetInfoCollapseButtonCaptionEval
          end
          item
            Name = 'SetInfoCollapseButtonCaption'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsSetInfoCollapseButtonCaptionEval
          end
          item
            Name = 'Execute'
            ResultType = 'TModalResult'
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsExecuteEval
          end>
        Properties = <
          item
            Name = 'Title'
            DataType = 'string'
            ReadAccess = 'GetTitle'
            WriteAccess = 'SetTitle'
          end
          item
            Name = 'Instruction'
            DataType = 'string'
            ReadAccess = 'GetInstruction'
            WriteAccess = 'SetInstruction'
          end
          item
            Name = 'Content'
            DataType = 'string'
            ReadAccess = 'GetContent'
            WriteAccess = 'SetContent'
          end
          item
            Name = 'Info'
            DataType = 'string'
            ReadAccess = 'GetInfo'
            WriteAccess = 'SetInfo'
          end
          item
            Name = 'InfoExpandButtonCaption'
            DataType = 'string'
            ReadAccess = 'GetInfoExpandButtonCaption'
            WriteAccess = 'SetInfoExpandButtonCaption'
          end
          item
            Name = 'InfoCollapseButtonCaption'
            DataType = 'string'
            ReadAccess = 'GetInfoCollapseButtonCaption'
            WriteAccess = 'SetInfoCollapseButtonCaption'
          end
          item
            Name = 'Footer'
            DataType = 'string'
            ReadAccess = 'GetFooter'
            WriteAccess = 'SetFooter'
          end
          item
            Name = 'FooterIcon'
            DataType = 'TTaskDialogFooterIcon'
            ReadAccess = 'GetFooterIcon'
            WriteAccess = 'SetFooterIcon'
          end
          item
            Name = 'Verify'
            DataType = 'string'
            ReadAccess = 'GetVerify'
            WriteAccess = 'SetVerify'
          end
          item
            Name = 'VerifyChecked'
            DataType = 'boolean'
            ReadAccess = 'GetVerifyChecked'
            WriteAccess = 'SetVerifyChecked'
          end
          item
            Name = 'Width'
            DataType = 'integer'
            ReadAccess = 'GetWidth'
            WriteAccess = 'SetWidth'
          end
          item
            Name = 'DialogIcon'
            DataType = 'TTaskDialogIcon'
            ReadAccess = 'GetDialogIcon'
            WriteAccess = 'SetDialogIcon'
          end
          item
            Name = 'Options'
            DataType = 'TTaskDialogOptions'
            ReadAccess = 'GetOptions'
            WriteAccess = 'SetOptions'
          end
          item
            Name = 'Buttons'
            DataType = 'TTaskDialogButtons'
            ReadAccess = 'GetButtons'
          end
          item
            Name = 'CommonButtons'
            DataType = 'TTaskDialogCommonButtons'
            ReadAccess = 'GetCommonButtons'
            WriteAccess = 'SetCommonButtons'
          end>
        OnCleanUp = dwsUnitDialogsClassesTTaskDialogCleanUp
      end
      item
        Name = 'TTaskDialogButtons'
        Ancestor = 'TCollection'
        IsInternal = True
        Methods = <
          item
            Name = 'Add'
            ResultType = 'TTaskDialogButton'
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTTaskDialogButtonsMethodsAddEval
          end
          item
            Name = 'GetButton'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'TTaskDialogButton'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTTaskDialogButtonsMethodsGetButtonEval
          end>
        Properties = <
          item
            Name = 'Buttons'
            DataType = 'TTaskDialogButton'
            ReadAccess = 'GetButton'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            IsDefault = True
          end>
      end
      item
        Name = 'TTaskDialogButton'
        Ancestor = 'TCollectionItem'
        IsInternal = True
        Methods = <
          item
            Name = 'GetCaption'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTTaskDialogButtonMethodsGetCaptionEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitDialogsClassesTTaskDialogButtonMethodsSetCaptionEval
          end
          item
            Name = 'GetHint'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTTaskDialogButtonMethodsGetHintEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitDialogsClassesTTaskDialogButtonMethodsSetHintEval
          end
          item
            Name = 'GetModalResult'
            ResultType = 'TModalResult'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTTaskDialogButtonMethodsGetModalResultEval
          end
          item
            Name = 'GetDefault'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTTaskDialogButtonMethodsGetDefaultEval
          end
          item
            Name = 'SetDefault'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitDialogsClassesTTaskDialogButtonMethodsSetDefaultEval
          end>
        Properties = <
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
            Name = 'ModalResult'
            DataType = 'TModalResult'
            ReadAccess = 'GetModalResult'
          end
          item
            Name = 'Default'
            DataType = 'boolean'
            ReadAccess = 'GetDefault'
            WriteAccess = 'SetDefault'
          end>
      end
      item
        Name = 'TDialog'
        Ancestor = 'TCustomForm'
        IsAbstract = True
        Constructors = <
          item
            Name = 'Create'
            OnEval = dwsUnitDialogsClassesTDialogConstructorsCreateEval
          end>
        Fields = <
          item
            Name = 'FOnAfterShow'
            DataType = 'TControlNotifyEvent'
            Visibility = cvPrivate
          end>
        Methods = <
          item
            Name = 'GetTitle'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTDialogMethodsGetTitleEval
          end
          item
            Name = 'SetTitle'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitDialogsClassesTDialogMethodsSetTitleEval
          end
          item
            Name = 'GetMinorTitle'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTDialogMethodsGetMinorTitleEval
          end
          item
            Name = 'SetMinorTitle'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitDialogsClassesTDialogMethodsSetMinorTitleEval
          end
          item
            Name = 'GetActionList'
            ResultType = 'TActionList'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTDialogMethodsGetActionListEval
          end
          item
            Name = 'GetActionOK'
            ResultType = 'TAction'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTDialogMethodsGetActionOKEval
          end
          item
            Name = 'GetActionCancel'
            ResultType = 'TAction'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTDialogMethodsGetActionCancelEval
          end
          item
            Name = 'GetContainer'
            ResultType = 'TContainerControl'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTDialogMethodsGetContainerEval
          end
          item
            Name = 'Execute'
            ResultType = 'boolean'
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTDialogMethodsExecuteEval
          end
          item
            Name = 'GetModernStyle'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTDialogMethodsGetModernStyleEval
          end
          item
            Name = 'SetModernStyle'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitDialogsClassesTDialogMethodsSetModernStyleEval
          end
          item
            Name = 'SetOnAfterShow'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TControlNotifyEvent'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitDialogsClassesTDialogMethodsSetOnAfterShowEval
          end
          item
            Name = 'GetButtonContainer'
            ResultType = 'TContainerControl'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitDialogsClassesTDialogMethodsGetButtonContainerEval
          end>
        Properties = <
          item
            Name = 'Title'
            DataType = 'string'
            ReadAccess = 'GetTitle'
            WriteAccess = 'SetTitle'
          end
          item
            Name = 'MinorTitle'
            DataType = 'string'
            ReadAccess = 'GetMinorTitle'
            WriteAccess = 'SetMinorTitle'
          end
          item
            Name = 'ActionList'
            DataType = 'TActionList'
            ReadAccess = 'GetActionList'
          end
          item
            Name = 'ActionOK'
            DataType = 'TAction'
            ReadAccess = 'GetActionOK'
          end
          item
            Name = 'ActionCancel'
            DataType = 'TAction'
            ReadAccess = 'GetActionCancel'
          end
          item
            Name = 'Container'
            DataType = 'TContainerControl'
            ReadAccess = 'GetContainer'
          end
          item
            Name = 'ModernStyle'
            DataType = 'boolean'
            ReadAccess = 'GetModernStyle'
            WriteAccess = 'SetModernStyle'
          end
          item
            Name = 'OnAfterShow'
            DataType = 'TControlNotifyEvent'
            ReadAccess = 'FOnAfterShow'
            WriteAccess = 'SetOnAfterShow'
          end
          item
            Name = 'ButtonContainer'
            DataType = 'TContainerControl'
            Visibility = cvProtected
            ReadAccess = 'GetButtonContainer'
          end>
      end>
    Dependencies.Strings = (
      'System.Classes'
      'System.UI.Controls')
    Enumerations = <
      item
        Name = 'TMsgDlgType'
        Elements = <
          item
            Name = 'mtWarning'
          end
          item
            Name = 'mtError'
          end
          item
            Name = 'mtInformation'
          end
          item
            Name = 'mtConfirmation'
          end
          item
            Name = 'mtCustom'
          end>
      end
      item
        Name = 'TMsgDlgBtn'
        Elements = <
          item
            Name = 'mbYes'
          end
          item
            Name = 'mbNo'
          end
          item
            Name = 'mbOK'
          end
          item
            Name = 'mbCancel'
          end
          item
            Name = 'mbAbort'
          end
          item
            Name = 'mbRetry'
          end
          item
            Name = 'mbIgnore'
          end
          item
            Name = 'mbAll'
          end
          item
            Name = 'mbNoToAll'
          end
          item
            Name = 'mbYesToAll'
          end
          item
            Name = 'mbHelp'
          end
          item
            Name = 'mbClose'
          end>
      end
      item
        Name = '_TModalResult'
        Elements = <
          item
            Name = 'mrNone'
            IsUserDef = True
          end
          item
            Name = 'mrOk'
            UserDefValue = 1
            IsUserDef = True
          end
          item
            Name = 'mrCancel'
            UserDefValue = 2
            IsUserDef = True
          end
          item
            Name = 'mrAbort'
            UserDefValue = 3
            IsUserDef = True
          end
          item
            Name = 'mrRetry'
            UserDefValue = 4
            IsUserDef = True
          end
          item
            Name = 'mrIgnore'
            UserDefValue = 5
            IsUserDef = True
          end
          item
            Name = 'mrYes'
            UserDefValue = 6
            IsUserDef = True
          end
          item
            Name = 'mrNo'
            UserDefValue = 7
            IsUserDef = True
          end
          item
            Name = 'mrAll'
            UserDefValue = 8
            IsUserDef = True
          end
          item
            Name = 'mrNoToAll'
            UserDefValue = 9
            IsUserDef = True
          end
          item
            Name = 'mrYesToAll'
            UserDefValue = 10
            IsUserDef = True
          end
          item
            Name = 'mrClose'
            UserDefValue = 11
            IsUserDef = True
          end>
      end
      item
        Name = 'TTaskDialogCommonButton'
        Elements = <
          item
            Name = 'cbOK'
          end
          item
            Name = 'cbYes'
          end
          item
            Name = 'cbNo'
          end
          item
            Name = 'cbCancel'
          end
          item
            Name = 'cbRetry'
          end
          item
            Name = 'cbClose'
          end>
      end
      item
        Name = 'TTaskDialogIcon'
        Elements = <
          item
            Name = 'tiBlank'
          end
          item
            Name = 'tiWarning'
          end
          item
            Name = 'tiQuestion'
          end
          item
            Name = 'tiError'
          end
          item
            Name = 'tiInformation'
          end
          item
            Name = 'tiNotUsed'
          end
          item
            Name = 'tiShield'
          end>
      end
      item
        Name = 'TTaskDialogFooterIcon'
        Elements = <
          item
            Name = 'tfiBlank'
          end
          item
            Name = 'tfiWarning'
          end
          item
            Name = 'tfiQuestion'
          end
          item
            Name = 'tfiError'
          end
          item
            Name = 'tfiInformation'
          end
          item
            Name = 'tfiShield'
          end>
      end
      item
        Name = 'TTaskDialogOption'
        Elements = <
          item
            Name = 'tdfUseIconMain'
          end
          item
            Name = 'tdfUseIconFooter'
          end
          item
            Name = 'tdfAllowCancel'
          end
          item
            Name = 'tdfUseCommandLinks'
          end
          item
            Name = 'tdfUseCommandLinksNoIcon'
          end
          item
            Name = 'tdfExpandFooterArea'
          end
          item
            Name = 'tdfExpandByDefault'
          end>
      end>
    Sets = <
      item
        Name = 'TMsgDlgButtons'
        BaseType = 'TMsgDlgBtn'
      end
      item
        Name = 'TTaskDialogCommonButtons'
        BaseType = 'TTaskDialogCommonButton'
      end
      item
        Name = 'TTaskDialogOptions'
        BaseType = 'TTaskDialogOption'
      end>
    Functions = <
      item
        Name = 'ShowMessage'
        Parameters = <
          item
            Name = 'Msg'
            DataType = 'string'
            IsVarParam = True
            IsWritable = False
          end>
        OnEval = dwsUnitDialogsFunctionsShowMessageEval
      end
      item
        Name = 'InputBox'
        Parameters = <
          item
            Name = 'ACaption'
            DataType = 'string'
            IsVarParam = True
            IsWritable = False
          end
          item
            Name = 'APrompt'
            DataType = 'string'
            IsVarParam = True
            IsWritable = False
          end
          item
            Name = 'ADefault'
            DataType = 'string'
            IsVarParam = True
            IsWritable = False
          end>
        ResultType = 'string'
        OnEval = dwsUnitDialogsFunctionsInputBoxEval
      end
      item
        Name = 'InputQuery'
        Parameters = <
          item
            Name = 'ACaption'
            DataType = 'string'
            IsVarParam = True
            IsWritable = False
          end
          item
            Name = 'APrompt'
            DataType = 'string'
            IsVarParam = True
            IsWritable = False
          end
          item
            Name = 'Value'
            DataType = 'string'
            IsVarParam = True
          end>
        ResultType = 'Boolean'
        OnEval = dwsUnitDialogsFunctionsInputQueryEval
      end
      item
        Name = 'MessageTaskDlg'
        Parameters = <
          item
            Name = 'Instruction'
            DataType = 'string'
            IsVarParam = True
            IsWritable = False
          end
          item
            Name = 'Msg'
            DataType = 'string'
            IsVarParam = True
            IsWritable = False
          end
          item
            Name = 'DlgType'
            DataType = 'TMsgDlgType'
          end
          item
            Name = 'Buttons'
            DataType = 'TMsgDlgButtons'
            IsWritable = False
          end>
        ResultType = 'TModalResult'
        Overloaded = True
        OnEval = dwsUnitDialogsFunctionsMessageTaskDlg1Eval
      end
      item
        Name = 'MessageTaskDlg'
        Parameters = <
          item
            Name = 'Instruction'
            DataType = 'string'
            IsVarParam = True
            IsWritable = False
          end
          item
            Name = 'Msg'
            DataType = 'string'
            IsVarParam = True
            IsWritable = False
          end
          item
            Name = 'DlgType'
            DataType = 'TMsgDlgType'
          end
          item
            Name = 'Buttons'
            DataType = 'TMsgDlgButtons'
          end
          item
            Name = 'DefaultButton'
            DataType = 'TMsgDlgBtn'
          end>
        ResultType = 'TModalResult'
        Overloaded = True
        OnEval = dwsUnitDialogsFunctionsMessageTaskDlg2Eval
      end
      item
        Name = 'MessageDlg'
        Parameters = <
          item
            Name = 'Msg'
            DataType = 'string'
            IsVarParam = True
            IsWritable = False
          end
          item
            Name = 'DlgType'
            DataType = 'TMsgDlgType'
          end
          item
            Name = 'Buttons'
            DataType = 'TMsgDlgButtons'
          end>
        ResultType = 'TModalResult'
        Overloaded = True
        OnEval = dwsUnitDialogsFunctionsMessageDlg1Eval
      end
      item
        Name = 'MessageDlg'
        Parameters = <
          item
            Name = 'Msg'
            DataType = 'string'
            IsVarParam = True
            IsWritable = False
          end
          item
            Name = 'DlgType'
            DataType = 'TMsgDlgType'
          end
          item
            Name = 'Buttons'
            DataType = 'TMsgDlgButtons'
          end
          item
            Name = 'DefaultButton'
            DataType = 'TMsgDlgBtn'
          end>
        ResultType = 'TModalResult'
        Overloaded = True
        OnEval = dwsUnitDialogsFunctionsMessageDlg2Eval
      end
      item
        Name = 'PromptForFileName'
        Parameters = <
          item
            Name = 'AFileName'
            DataType = 'string'
            IsVarParam = True
          end
          item
            Name = 'AFilter'
            DataType = 'string'
            IsWritable = False
            HasDefaultValue = True
            DefaultValue = ''
          end
          item
            Name = 'ADefaultExt'
            DataType = 'string'
            IsWritable = False
            HasDefaultValue = True
            DefaultValue = ''
          end
          item
            Name = 'ATitle'
            DataType = 'string'
            IsWritable = False
            HasDefaultValue = True
            DefaultValue = ''
          end
          item
            Name = 'AInitialDir'
            DataType = 'string'
            IsWritable = False
            HasDefaultValue = True
            DefaultValue = ''
          end
          item
            Name = 'SaveDialog'
            DataType = 'Boolean'
            IsWritable = False
            HasDefaultValue = True
            DefaultValue = False
          end>
        ResultType = 'boolean'
        OnEval = dwsUnitDialogsFunctionsPromptForFileNameEval
      end
      item
        Name = 'SelectDirectory'
        Parameters = <
          item
            Name = 'Caption'
            DataType = 'string'
            IsVarParam = True
            IsWritable = False
          end
          item
            Name = 'Root'
            DataType = 'string'
            IsVarParam = True
            IsWritable = False
          end
          item
            Name = 'Directory'
            DataType = 'string'
            IsVarParam = True
          end>
        ResultType = 'Boolean'
        Overloaded = True
        OnEval = dwsUnitDialogsFunctionsSelectDirectory1Eval
      end
      item
        Name = 'SelectDirectory'
        Parameters = <
          item
            Name = 'Caption'
            DataType = 'string'
            IsVarParam = True
            IsWritable = False
          end
          item
            Name = 'Directory'
            DataType = 'string'
            IsVarParam = True
          end>
        ResultType = 'boolean'
        Overloaded = True
        OnEval = dwsUnitDialogsFunctionsSelectDirectory2Eval
      end>
    UnitName = 'System.UI.Dialogs'
    StaticSymbols = False
    Left = 88
    Top = 24
  end
  object dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList
    Left = 84
    Top = 80
  end
end
