object DataModuleScriptUserInterfaceWizard: TDataModuleScriptUserInterfaceWizard
  Height = 316
  Width = 449
  object dwsUnitWizard: TdwsUnit
    Classes = <
      item
        Name = 'TWizardControl'
        Ancestor = 'TCustomControl'
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'AOwner'
                DataType = 'TComponent'
              end>
            OnEval = dwsUnitWizardClassesTWizardControlConstructorsCreateEval
          end>
        Fields = <
          item
            Name = 'FOnWizardCancel'
            DataType = 'TWizardAcceptEvent'
            Visibility = cvPrivate
          end
          item
            Name = 'FOnWizardFinish'
            DataType = 'TWizardAcceptEvent'
            Visibility = cvPrivate
          end
          item
            Name = 'FOnWizardPageActivating'
            DataType = 'TWizardPageActivatingEvent'
            Visibility = cvPrivate
          end
          item
            Name = 'FOnWizardPageActivated'
            DataType = 'TWizardPageEvent'
            Visibility = cvPrivate
          end
          item
            Name = 'FOnWizardNextPage'
            DataType = 'TWizardPageChangeEvent'
            Visibility = cvPrivate
          end
          item
            Name = 'FOnWizardPrevPage'
            DataType = 'TWizardPageChangeEvent'
            Visibility = cvPrivate
          end
          item
            Name = 'FOnWizardGetNextPage'
            DataType = 'TWizardGetPageEvent'
            Visibility = cvPrivate
          end
          item
            Name = 'FOnWizardGetPrevPage'
            DataType = 'TWizardGetPageEvent'
            Visibility = cvPrivate
          end>
        Methods = <
          item
            Name = 'GotoNextPage'
            Kind = mkProcedure
          end
          item
            Name = 'GotoPrevPage'
            Kind = mkProcedure
          end
          item
            Name = 'CanGotoNextPage'
            ResultType = 'boolean'
            Kind = mkFunction
          end
          item
            Name = 'CanGotoPrevPage'
            ResultType = 'boolean'
            Kind = mkFunction
          end
          item
            Name = 'GetNextPage'
            ResultType = 'TWizardPage'
            Kind = mkFunction
          end
          item
            Name = 'GetPrevPage'
            ResultType = 'TWizardPage'
            Kind = mkFunction
          end
          item
            Name = 'GetActivePageIndex'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardControlMethodsGetActivePageIndexEval
          end
          item
            Name = 'SetActivePageIndex'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'integer'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWizardClassesTWizardControlMethodsSetActivePageIndexEval
          end
          item
            Name = 'GetPages'
            ResultType = 'TWizardPages'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardControlMethodsGetPagesEval
          end
          item
            Name = 'GetInfoPanel'
            ResultType = 'TWizardInfoPanel'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardControlMethodsGetInfoPanelEval
          end
          item
            Name = 'GetButtons'
            ResultType = 'TWizardButtons'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardControlMethodsGetButtonsEval
          end
          item
            Name = 'GetActivePage'
            ResultType = 'TWizardPage'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardControlMethodsGetActivePageEval
          end
          item
            Name = 'SetActivePage'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TWizardPage'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWizardClassesTWizardControlMethodsSetActivePageEval
          end
          item
            Name = 'GetTitle'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardControlMethodsGetTitleEval
          end
          item
            Name = 'SetTitle'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWizardClassesTWizardControlMethodsSetTitleEval
          end
          item
            Name = 'SetOnWizardCancel'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TWizardAcceptEvent'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWizardClassesTWizardControlMethodsSetWizardOnCancelEval
          end
          item
            Name = 'SetOnWizardFinish'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TWizardAcceptEvent'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWizardClassesTWizardControlMethodsSetWizardOnFinishEval
          end
          item
            Name = 'SetOnWizardPageActivating'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TWizardPageActivatingEvent'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWizardClassesTWizardControlMethodsSetWizardOnActivatePageEval
          end
          item
            Name = 'SetOnWizardPageActivated'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TWizardPageEvent'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWizardClassesTWizardControlMethodsSetOnWizardPageActivatedEval
          end
          item
            Name = 'SetOnWizardNextPage'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TWizardPageChangeEvent'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWizardClassesTWizardControlMethodsSetWizardOnNextPageEval
          end
          item
            Name = 'SetOnWizardPrevPage'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TWizardPageChangeEvent'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWizardClassesTWizardControlMethodsSetWizardOnPrevPageEval
          end
          item
            Name = 'UpdateButtons'
            Kind = mkProcedure
            OnEval = dwsUnitWizardClassesTWizardControlMethodsUpdateButtonsEval
          end
          item
            Name = 'SetOnWizardGetNextPage'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TWizardGetPageEvent'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWizardClassesTWizardControlMethodsSetOnWizardGetNextPageEval
          end
          item
            Name = 'SetOnWizardGetPrevPage'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TWizardGetPageEvent'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWizardClassesTWizardControlMethodsSetOnWizardGetPrevPageEval
          end
          item
            Name = 'GetOptions'
            ResultType = 'TWizardOptions'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardControlMethodsGetOptionsEval
          end>
        Properties = <
          item
            Name = 'ActivePageIndex'
            DataType = 'integer'
            ReadAccess = 'GetActivePageIndex'
            WriteAccess = 'SetActivePageIndex'
          end
          item
            Name = 'ActivePage'
            DataType = 'TWizardPage'
            ReadAccess = 'GetActivePage'
            WriteAccess = 'SetActivePage'
          end
          item
            Name = 'Pages'
            DataType = 'TWizardPages'
            ReadAccess = 'GetPages'
          end
          item
            Name = 'InfoPanel'
            DataType = 'TWizardInfoPanel'
            ReadAccess = 'GetInfoPanel'
          end
          item
            Name = 'Buttons'
            DataType = 'TWizardButtons'
            ReadAccess = 'GetButtons'
          end
          item
            Name = 'Title'
            DataType = 'string'
            ReadAccess = 'GetTitle'
            WriteAccess = 'SetTitle'
          end
          item
            Name = 'OnWizardCancel'
            DataType = 'TWizardAcceptEvent'
            ReadAccess = 'FOnWizardCancel'
            WriteAccess = 'SetOnWizardCancel'
          end
          item
            Name = 'OnWizardFinish'
            DataType = 'TWizardAcceptEvent'
            ReadAccess = 'FOnWizardFinish'
            WriteAccess = 'SetOnWizardFinish'
          end
          item
            Name = 'OnWizardPageActivating'
            DataType = 'TWizardPageActivatingEvent'
            ReadAccess = 'FOnWizardPageActivating'
            WriteAccess = 'SetOnWizardPageActivating'
          end
          item
            Name = 'OnWizardPageActivated'
            DataType = 'TWizardPageEvent'
            ReadAccess = 'FOnWizardPageActivated'
            WriteAccess = 'SetOnWizardPageActivated'
          end
          item
            Name = 'OnWizardNextPage'
            DataType = 'TWizardPageChangeEvent'
            ReadAccess = 'FOnWizardNextPage'
            WriteAccess = 'SetOnWizardNextPage'
          end
          item
            Name = 'OnWizardPrevPage'
            DataType = 'TWizardPageChangeEvent'
            ReadAccess = 'FOnWizardPrevPage'
            WriteAccess = 'SetOnWizardPrevPage'
          end
          item
            Name = 'OnWizardGetNextPage'
            DataType = 'TWizardGetPageEvent'
            ReadAccess = 'FOnWizardGetNextPage'
            WriteAccess = 'SetOnWizardGetNextPage'
          end
          item
            Name = 'OnWizardGetPrevPage'
            DataType = 'TWizardGetPageEvent'
            ReadAccess = 'FOnWizardGetPrevPage'
            WriteAccess = 'SetOnWizardGetPrevPage'
          end
          item
            Name = 'Options'
            DataType = 'TWizardOptions'
            ReadAccess = 'GetOptions'
          end>
        OnCleanUp = dwsUnitWizardClassesTWizardControlCleanUp
      end
      item
        Name = 'TWizardInfoPanel'
        IsSealed = True
        IsInternal = True
        Methods = <
          item
            Name = 'GetCaption'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardInfoPanelMethodsGetCaptionEval
          end
          item
            Name = 'SetCaption'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWizardClassesTWizardInfoPanelMethodsSetCaptionEval
          end
          item
            Name = 'GetHyperlink'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardInfoPanelMethodsGetHyperlinkEval
          end
          item
            Name = 'SetHyperlink'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWizardClassesTWizardInfoPanelMethodsSetHyperlinkEval
          end
          item
            Name = 'GetEnabled'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardInfoPanelMethodsGetEnabledEval
          end
          item
            Name = 'SetEnabled'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWizardClassesTWizardInfoPanelMethodsSetEnabledEval
          end
          item
            Name = 'GetVisible'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardInfoPanelMethodsGetVisibleEval
          end
          item
            Name = 'SetVisible'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWizardClassesTWizardInfoPanelMethodsSetVisibleEval
          end>
        Properties = <
          item
            Name = 'Caption'
            DataType = 'string'
            ReadAccess = 'GetCaption'
            WriteAccess = 'SetCaption'
          end
          item
            Name = 'Hyperlink'
            DataType = 'string'
            ReadAccess = 'GetHyperlink'
            WriteAccess = 'SetHyperlink'
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
          end>
      end
      item
        Name = 'TWizardPages'
        IsSealed = True
        IsInternal = True
        Methods = <
          item
            Name = 'Add'
            ResultType = 'TWizardPage'
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardPagesMethodsAddEval
          end
          item
            Name = 'GetCount'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardPagesMethodsGetCountEval
          end
          item
            Name = 'GetPage'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'TWizardPage'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardPagesMethodsGetPageEval
          end
          item
            Name = 'BeginUpdate'
            Kind = mkProcedure
            OnEval = dwsUnitWizardClassesTWizardPagesMethodsBeginUpdateEval
          end
          item
            Name = 'EndUpdate'
            Kind = mkProcedure
            OnEval = dwsUnitWizardClassesTWizardPagesMethodsEndUpdateEval
          end>
        Properties = <
          item
            Name = 'Pages'
            DataType = 'TWizardPage'
            ReadAccess = 'GetPage'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            IsDefault = True
          end
          item
            Name = 'Count'
            DataType = 'integer'
            ReadAccess = 'GetCount'
          end>
      end
      item
        Name = 'TWizardPageHeader'
        IsSealed = True
        IsInternal = True
        Methods = <
          item
            Name = 'GetTitle'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardPageHeaderMethodsGetTitleEval
          end
          item
            Name = 'SetTitle'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWizardClassesTWizardPageHeaderMethodsSetTitleEval
          end
          item
            Name = 'GetDescription'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardPageHeaderMethodsGetDescriptionEval
          end
          item
            Name = 'SetDescription'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWizardClassesTWizardPageHeaderMethodsSetDescriptionEval
          end
          item
            Name = 'GetDescriptionVisible'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardPageHeaderMethodsGetDescriptionVisibleEval
          end
          item
            Name = 'SetDescriptionVisible'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWizardClassesTWizardPageHeaderMethodsSetDescriptionVisibleEval
          end>
        Properties = <
          item
            Name = 'Title'
            DataType = 'string'
            ReadAccess = 'GetTitle'
            WriteAccess = 'SetTitle'
          end
          item
            Name = 'Description'
            DataType = 'string'
            ReadAccess = 'GetDescription'
            WriteAccess = 'SetDescription'
          end
          item
            Name = 'DescriptionVisible'
            DataType = 'boolean'
            ReadAccess = 'GetDescriptionVisible'
            WriteAccess = 'SetDescriptionVisible'
          end>
      end
      item
        Name = 'TWizardPage'
        Ancestor = 'TContainerControl'
        IsSealed = True
        IsInternal = True
        Methods = <
          item
            Name = 'Activate'
            Kind = mkProcedure
            OnEval = dwsUnitWizardClassesTWizardPageMethodsActivateEval
          end
          item
            Name = 'GetActive'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardPageMethodsGetActiveEval
          end
          item
            Name = 'GetHeader'
            ResultType = 'TWizardPageHeader'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardPageMethodsGetHeaderEval
          end
          item
            Name = 'GetPageIndex'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardPageMethodsGetPageIndexEval
          end
          item
            Name = 'SetPageIndex'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'integer'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWizardClassesTWizardPageMethodsSetPageIndexEval
          end
          item
            Name = 'GetPageVisible'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardPageMethodsGetPageVisibleEval
          end
          item
            Name = 'SetPageVisible'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWizardClassesTWizardPageMethodsSetPageVisibleEval
          end
          item
            Name = 'GetWizard'
            ResultType = 'TWizardControl'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardPageMethodsGetWizardEval
          end>
        Properties = <
          item
            Name = 'Active'
            DataType = 'boolean'
            ReadAccess = 'GetActive'
          end
          item
            Name = 'Header'
            DataType = 'TWizardPageHeader'
            ReadAccess = 'GetHeader'
          end
          item
            Name = 'PageIndex'
            DataType = 'integer'
            ReadAccess = 'GetPageIndex'
            WriteAccess = 'SetPageIndex'
          end
          item
            Name = 'PageVisible'
            DataType = 'boolean'
            ReadAccess = 'GetPageVisible'
            WriteAccess = 'SetPageVisible'
          end
          item
            Name = 'Wizard'
            DataType = 'TWizardControl'
            ReadAccess = 'GetWizard'
          end>
      end
      item
        Name = 'TWizardButton'
        IsSealed = True
        IsInternal = True
        Methods = <
          item
            Name = 'GetCaption'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardButtonMethodsGetCaptionEval
          end
          item
            Name = 'SetCaption'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWizardClassesTWizardButtonMethodsSetCaptionEval
          end
          item
            Name = 'GetVisible'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardButtonMethodsGetVisibleEval
          end
          item
            Name = 'SetVisible'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWizardClassesTWizardButtonMethodsSetVisibleEval
          end
          item
            Name = 'GetEnabled'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardButtonMethodsGetEnabledEval
          end
          item
            Name = 'SetEnabled'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'boolean'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWizardClassesTWizardButtonMethodsSetEnabledEval
          end>
        Properties = <
          item
            Name = 'Caption'
            DataType = 'string'
            ReadAccess = 'GetCaption'
            WriteAccess = 'SetCaption'
          end
          item
            Name = 'Visible'
            DataType = 'boolean'
            ReadAccess = 'GetVisible'
            WriteAccess = 'SetVisible'
          end
          item
            Name = 'Enabled'
            DataType = 'boolean'
            ReadAccess = 'GetEnabled'
            WriteAccess = 'SetEnabled'
          end>
      end
      item
        Name = 'TWizardButtons'
        IsSealed = True
        IsInternal = True
        Methods = <
          item
            Name = 'GetBack'
            ResultType = 'TWizardButton'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardButtonsMethodsGetBackEval
          end
          item
            Name = 'GetNext'
            ResultType = 'TWizardButton'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardButtonsMethodsGetNextEval
          end
          item
            Name = 'GetCancel'
            ResultType = 'TWizardButton'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardButtonsMethodsGetCancelEval
          end
          item
            Name = 'GetFinish'
            ResultType = 'TWizardButton'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardButtonsMethodsGetFinishEval
          end
          item
            Name = 'GetHelp'
            ResultType = 'TWizardButton'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardButtonsMethodsGetHelpEval
          end>
        Properties = <
          item
            Name = 'Back'
            DataType = 'TWizardButton'
            ReadAccess = 'GetBack'
          end
          item
            Name = 'Next'
            DataType = 'TWizardButton'
            ReadAccess = 'GetNext'
          end
          item
            Name = 'Cancel'
            DataType = 'TWizardButton'
            ReadAccess = 'GetCancel'
          end
          item
            Name = 'Finish'
            DataType = 'TWizardButton'
            ReadAccess = 'GetFinish'
          end
          item
            Name = 'Help'
            DataType = 'TWizardButton'
            ReadAccess = 'GetHelp'
          end>
      end
      item
        Name = 'TWizardForm'
        Ancestor = 'TCustomForm'
        Constructors = <
          item
            Name = 'Create'
            OnEval = dwsUnitWizardClassesTWizardFormConstructorsCreateEval
          end>
        Fields = <
          item
            Name = 'FOnAfterShow'
            DataType = 'TControlNotifyEvent'
            Visibility = cvPrivate
          end>
        Methods = <
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
            OnEval = dwsUnitWizardClassesTWizardFormMethodsSetOnAfterShowEval
          end>
        Properties = <
          item
            Name = 'OnAfterShow'
            DataType = 'TControlNotifyEvent'
            ReadAccess = 'FOnAfterShow'
            WriteAccess = 'SetOnAfterShow'
          end>
        OnCleanUp = dwsUnitWizardClassesTWizardFormCleanUp
      end
      item
        Name = 'TCustomWizardForm'
        Ancestor = 'TWizardForm'
        Constructors = <
          item
            Name = 'Create'
            OnEval = dwsUnitWizardClassesTCustomWizardFormConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'GetWizard'
            ResultType = 'TWizardControl'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTCustomWizardFormMethodsGetWizardEval
          end>
        Properties = <
          item
            Name = 'Wizard'
            DataType = 'TWizardControl'
            ReadAccess = 'GetWizard'
          end>
        OnCleanUp = dwsUnitWizardClassesTCustomWizardFormCleanUp
      end
      item
        Name = 'TWizardOptions'
        IsInternal = True
        Methods = <
          item
            Name = 'GetAutoDisableCancel'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWizardClassesTWizardOptionsMethodsGetLastPageCanCancelEval
          end
          item
            Name = 'SetAutoDisableCancel'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWizardClassesTWizardOptionsMethodsSetLastPageCanCancelEval
          end>
        Properties = <
          item
            Name = 'AutoDisableCancel'
            DataType = 'boolean'
            ReadAccess = 'GetAutoDisableCancel'
            WriteAccess = 'SetAutoDisableCancel'
          end>
      end>
    Dependencies.Strings = (
      'System.UI.Controls')
    Delegates = <
      item
        Name = 'TWizardAcceptEvent'
        Parameters = <
          item
            Name = 'Sender'
            DataType = 'TWizardControl'
          end
          item
            Name = 'Accept'
            DataType = 'boolean'
            IsVarParam = True
          end>
      end
      item
        Name = 'TWizardPageActivatingEvent'
        Parameters = <
          item
            Name = 'Sender'
            DataType = 'TWizardControl'
          end
          item
            Name = 'CurrentPage'
            DataType = 'TWizardPage'
            IsWritable = False
          end
          item
            Name = 'NewPage'
            DataType = 'TWizardPage'
            IsWritable = False
          end
          item
            Name = 'Allow'
            DataType = 'boolean'
            IsVarParam = True
          end>
      end
      item
        Name = 'TWizardPageChangeEvent'
        Parameters = <
          item
            Name = 'Sender'
            DataType = 'TWizardControl'
          end
          item
            Name = 'CurrentPage'
            DataType = 'TWizardPage'
            IsWritable = False
          end
          item
            Name = 'NewPage'
            DataType = 'TWizardPage'
            IsVarParam = True
          end
          item
            Name = 'Handled'
            DataType = 'boolean'
            IsVarParam = True
          end>
      end
      item
        Name = 'TWizardPageEvent'
        Parameters = <
          item
            Name = 'Sender'
            DataType = 'TWizardControl'
          end
          item
            Name = 'Page'
            DataType = 'TWizardPage'
          end>
      end
      item
        Name = 'TWizardGetPageEvent'
        Parameters = <
          item
            Name = 'Sender'
            DataType = 'TWizardControl'
          end
          item
            Name = 'NewPage'
            DataType = 'TWizardPage'
            IsVarParam = True
          end>
      end>
    UnitName = 'System.UI.Wizard'
    StaticSymbols = False
    Left = 108
    Top = 48
  end
end
