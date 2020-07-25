object DataModuleScriptUserInterfaceDialogs: TDataModuleScriptUserInterfaceDialogs
  OldCreateOrder = False
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
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetTitleEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsSetTitleEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetInstruction'
            ResultType = 'string'
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetInstructionEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsSetInstructionEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetContent'
            ResultType = 'string'
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetContentEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsSetContentEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetInfo'
            ResultType = 'string'
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetInfoEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsSetInfoEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetFooter'
            ResultType = 'string'
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetFooterEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsSetFooterEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetVerify'
            ResultType = 'string'
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetVerifyEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsSetVerifyEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetVerifyChecked'
            ResultType = 'boolean'
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetVerifyCheckedEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsSetVerifyCheckedEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetWidth'
            ResultType = 'integer'
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetWidthEval
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
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsSetWidthEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetFooterIcon'
            ResultType = 'TTaskDialogFooterIcon'
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetFooterIconEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsSetFooterIconEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetDialogIcon'
            ResultType = 'TTaskDialogIcon'
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetDialogIconEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsSetDialogIconEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetOptions'
            ResultType = 'TTaskDialogOptions'
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetOptionsEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsSetOptionsEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetButtons'
            ResultType = 'TTaskDialogButtons'
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetButtonsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetCommonButtons'
            ResultType = 'TTaskDialogCommonButtons'
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetCommonButtonsEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsSetCommonButtonsEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetInfoExpandButtonCaption'
            ResultType = 'string'
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetInfoExpandButtonCaptionEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsSetInfoExpandButtonCaptionEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetInfoCollapseButtonCaption'
            ResultType = 'string'
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsGetInfoCollapseButtonCaptionEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsSetInfoCollapseButtonCaptionEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'Execute'
            ResultType = 'TModalResult'
            OnEval = dwsUnitDialogsClassesTTaskDialogMethodsExecuteEval
            Kind = mkFunction
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
            OnEval = dwsUnitDialogsClassesTTaskDialogButtonsMethodsAddEval
            Kind = mkFunction
          end
          item
            Name = 'GetButton'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'TTaskDialogButton'
            OnEval = dwsUnitDialogsClassesTTaskDialogButtonsMethodsGetButtonEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitDialogsClassesTTaskDialogButtonMethodsGetCaptionEval
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
            OnEval = dwsUnitDialogsClassesTTaskDialogButtonMethodsSetCaptionEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetHint'
            ResultType = 'string'
            OnEval = dwsUnitDialogsClassesTTaskDialogButtonMethodsGetHintEval
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
            OnEval = dwsUnitDialogsClassesTTaskDialogButtonMethodsSetHintEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetModalResult'
            ResultType = 'TModalResult'
            OnEval = dwsUnitDialogsClassesTTaskDialogButtonMethodsGetModalResultEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetDefault'
            ResultType = 'boolean'
            OnEval = dwsUnitDialogsClassesTTaskDialogButtonMethodsGetDefaultEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitDialogsClassesTTaskDialogButtonMethodsSetDefaultEval
            Visibility = cvProtected
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
            OnEval = dwsUnitDialogsClassesTDialogMethodsGetTitleEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitDialogsClassesTDialogMethodsSetTitleEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetMinorTitle'
            ResultType = 'string'
            OnEval = dwsUnitDialogsClassesTDialogMethodsGetMinorTitleEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitDialogsClassesTDialogMethodsSetMinorTitleEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetActionList'
            ResultType = 'TActionList'
            OnEval = dwsUnitDialogsClassesTDialogMethodsGetActionListEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetActionOK'
            ResultType = 'TAction'
            OnEval = dwsUnitDialogsClassesTDialogMethodsGetActionOKEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetActionCancel'
            ResultType = 'TAction'
            OnEval = dwsUnitDialogsClassesTDialogMethodsGetActionCancelEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetContainer'
            ResultType = 'TContainerControl'
            OnEval = dwsUnitDialogsClassesTDialogMethodsGetContainerEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'Execute'
            ResultType = 'boolean'
            OnEval = dwsUnitDialogsClassesTDialogMethodsExecuteEval
            Kind = mkFunction
          end
          item
            Name = 'GetModernStyle'
            ResultType = 'boolean'
            OnEval = dwsUnitDialogsClassesTDialogMethodsGetModernStyleEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitDialogsClassesTDialogMethodsSetModernStyleEval
            Visibility = cvProtected
            Kind = mkProcedure
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
            OnEval = dwsUnitDialogsClassesTDialogMethodsSetOnAfterShowEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetButtonContainer'
            ResultType = 'TContainerControl'
            OnEval = dwsUnitDialogsClassesTDialogMethodsGetButtonContainerEval
            Visibility = cvProtected
            Kind = mkFunction
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
