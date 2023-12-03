object DataModuleScriptService: TDataModuleScriptService
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 392
  Width = 585
  object DelphiWebScript: TDelphiWebScript
    Config.CompilerOptions = [coSymbolDictionary, coContextMap, coAssertions, coAllowClosures]
    Config.ScriptPaths.Strings = (
      'lorem ipsum'
      'configured at run-time')
    Config.OnNeedUnit = DelphiWebScriptNeedUnit
    Config.OnResource = DelphiWebScriptResource
    Config.OnExecutionStarted = DelphiWebScriptExecutionStarted
    Config.OnExecutionEnded = DelphiWebScriptExecutionEnded
    OnResource = DelphiWebScriptResource
    OnExecutionStarted = DelphiWebScriptExecutionStarted
    OnExecutionEnded = DelphiWebScriptExecutionEnded
    Left = 68
    Top = 28
  end
  object dwsComConnector1: TdwsComConnector
    Script = DelphiWebScript
    StaticSymbols = False
    Left = 96
    Top = 120
  end
  object dwsJSONLibModule1: TdwsJSONLibModule
    Script = DelphiWebScript
    Left = 236
    Top = 124
  end
  object dwsUnitScriptService: TdwsUnit
    Script = DelphiWebScript
    Classes = <
      item
        Name = 'ScriptService'
        IsSealed = True
        IsAbstract = True
        IsStatic = True
        Methods = <
          item
            Name = 'GetPackages'
            ResultType = 'TScriptPackageList'
            Attributes = [maStatic]
            Visibility = cvProtected
            Kind = mkClassFunction
            OnEval = dwsUnitScriptServiceClassesScriptServiceMethodsGetPackagesEval
          end
          item
            Name = 'Edit'
            Overloaded = True
            Attributes = [maStatic]
            Kind = mkClassProcedure
            OnEval = dwsUnitScriptServiceClassesScriptServiceMethodsEdit0Eval
          end
          item
            Name = 'Edit'
            Parameters = <
              item
                Name = 'Filename'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Overloaded = True
            Attributes = [maStatic]
            Kind = mkClassProcedure
            OnEval = dwsUnitScriptServiceClassesScriptServiceMethodsEditEval
          end
          item
            Name = 'Execute'
            Parameters = <
              item
                Name = 'Filename'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TScriptExecutionResult'
            Overloaded = True
            Attributes = [maStatic]
            Kind = mkClassFunction
            OnEval = dwsUnitScriptServiceClassesScriptServiceMethodsExecute0Eval
          end
          item
            Name = 'Execute'
            Parameters = <
              item
                Name = 'Package'
                DataType = 'TScriptPackage'
              end>
            ResultType = 'TScriptExecutionResult'
            Overloaded = True
            Attributes = [maStatic]
            Kind = mkClassFunction
            OnEval = dwsUnitScriptServiceClassesScriptServiceMethodsExecute1Eval
          end>
        Properties = <
          item
            Name = 'Packages'
            DataType = 'TScriptPackageList'
            ReadAccess = 'GetPackages'
          end>
      end
      item
        Name = 'TScriptPackageList'
        IsSealed = True
        IsAbstract = True
        Methods = <
          item
            Name = 'GetCount'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitScriptServiceClassesTScriptPackageListMethodsGetCountEval
          end
          item
            Name = 'GetItem'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            ResultType = 'TScriptPackage'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitScriptServiceClassesTScriptPackageListMethodsGetItemEval
          end
          item
            Name = 'Add'
            Parameters = <
              item
                Name = 'Filename'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TScriptPackage'
            Kind = mkFunction
            OnEval = dwsUnitScriptServiceClassesTScriptPackageListMethodsAddEval
          end
          item
            Name = 'Remove'
            Parameters = <
              item
                Name = 'Package'
                DataType = 'TScriptPackage'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
            OnEval = dwsUnitScriptServiceClassesTScriptPackageListMethodsRemoveEval
          end
          item
            Name = 'FindByID'
            Parameters = <
              item
                Name = 'PluginID'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TScriptPackage'
            Kind = mkFunction
            OnEval = dwsUnitScriptServiceClassesTScriptPackageListMethodsFindByIDEval
          end
          item
            Name = 'FindByFilename'
            Parameters = <
              item
                Name = 'Filename'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TScriptPackage'
            Kind = mkFunction
            OnEval = dwsUnitScriptServiceClassesTScriptPackageListMethodsFindByFilenameEval
          end>
        Properties = <
          item
            Name = 'Count'
            DataType = 'integer'
            ReadAccess = 'GetCount'
          end
          item
            Name = 'Items'
            DataType = 'TScriptPackage'
            ReadAccess = 'GetItem'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end>
            IsDefault = True
          end>
      end
      item
        Name = 'TScriptPackage'
        IsSealed = True
        IsAbstract = True
        Methods = <
          item
            Name = 'GetPackageID'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitScriptServiceClassesTScriptPackageMethodsGetPluginIDEval
          end
          item
            Name = 'GetPackageName'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitScriptServiceClassesTScriptPackageMethodsGetPluginNameEval
          end
          item
            Name = 'GetPackageURI'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitScriptServiceClassesTScriptPackageMethodsGetPluginURIEval
          end
          item
            Name = 'GetDescription'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitScriptServiceClassesTScriptPackageMethodsGetDescriptionEval
          end
          item
            Name = 'GetVersion'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitScriptServiceClassesTScriptPackageMethodsGetVersionEval
          end
          item
            Name = 'GetAuthor'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitScriptServiceClassesTScriptPackageMethodsGetAuthorEval
          end
          item
            Name = 'GetAuthorID'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitScriptServiceClassesTScriptPackageMethodsGetAuthorIDEval
          end
          item
            Name = 'GetAuthorURI'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitScriptServiceClassesTScriptPackageMethodsGetAuthorURIEval
          end
          item
            Name = 'GetFilename'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitScriptServiceClassesTScriptPackageMethodsGetFilenameEval
          end
          item
            Name = 'GetEnabled'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitScriptServiceClassesTScriptPackageMethodsGetEnabledEval
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
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitScriptServiceClassesTScriptPackageMethodsSetEnabledEval
          end
          item
            Name = 'GetProductID'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitScriptServiceClassesTScriptPackageMethodsGetProductIDEval
          end
          item
            Name = 'GetPackageKind'
            ResultType = 'TScriptPackageKind'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitScriptServiceClassesTScriptPackageMethodsGetPackageKindEval
          end>
        Properties = <
          item
            Name = 'PackageID'
            DataType = 'string'
            ReadAccess = 'GetPackageID'
          end
          item
            Name = 'PackageName'
            DataType = 'string'
            ReadAccess = 'GetPackageName'
          end
          item
            Name = 'PackageURI'
            DataType = 'string'
            ReadAccess = 'GetPackageURI'
          end
          item
            Name = 'Description'
            DataType = 'string'
            ReadAccess = 'GetDescription'
          end
          item
            Name = 'Version'
            DataType = 'string'
            ReadAccess = 'GetVersion'
          end
          item
            Name = 'Author'
            DataType = 'string'
            ReadAccess = 'GetAuthor'
          end
          item
            Name = 'AuthorID'
            DataType = 'string'
            ReadAccess = 'GetAuthorID'
          end
          item
            Name = 'AuthorURI'
            DataType = 'string'
            ReadAccess = 'GetAuthorURI'
          end
          item
            Name = 'Filename'
            DataType = 'string'
            ReadAccess = 'GetFilename'
          end
          item
            Name = 'Enabled'
            DataType = 'boolean'
            ReadAccess = 'GetEnabled'
            WriteAccess = 'SetEnabled'
          end
          item
            Name = 'ProductID'
            DataType = 'string'
            ReadAccess = 'GetProductID'
          end
          item
            Name = 'PackageKind'
            DataType = 'TScriptPackageKind'
            ReadAccess = 'GetPackageKind'
          end>
      end>
    Enumerations = <
      item
        Name = 'TScriptExecutionResult'
        Elements = <>
      end
      item
        Name = 'TScriptPackageKind'
        Elements = <>
      end>
    UnitName = 'System.Script'
    ImplicitUse = True
    StaticSymbols = False
    Left = 384
    Top = 124
  end
end
