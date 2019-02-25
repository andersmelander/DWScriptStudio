object DataModuleScriptService: TDataModuleScriptService
  OldCreateOrder = False
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
            OnEval = dwsUnitScriptServiceClassesScriptServiceMethodsGetPackagesEval
            Visibility = cvProtected
            Kind = mkClassFunction
          end
          item
            Name = 'Edit'
            Overloaded = True
            Attributes = [maStatic]
            OnEval = dwsUnitScriptServiceClassesScriptServiceMethodsEdit0Eval
            Kind = mkClassProcedure
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
            OnEval = dwsUnitScriptServiceClassesScriptServiceMethodsEditEval
            Kind = mkClassProcedure
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
            OnEval = dwsUnitScriptServiceClassesScriptServiceMethodsExecute0Eval
            Kind = mkClassFunction
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
            OnEval = dwsUnitScriptServiceClassesScriptServiceMethodsExecute1Eval
            Kind = mkClassFunction
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
            OnEval = dwsUnitScriptServiceClassesTScriptPackageListMethodsGetCountEval
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
            ResultType = 'TScriptPackage'
            OnEval = dwsUnitScriptServiceClassesTScriptPackageListMethodsGetItemEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitScriptServiceClassesTScriptPackageListMethodsAddEval
            Kind = mkFunction
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
            OnEval = dwsUnitScriptServiceClassesTScriptPackageListMethodsRemoveEval
            Kind = mkProcedure
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
            OnEval = dwsUnitScriptServiceClassesTScriptPackageListMethodsFindByIDEval
            Kind = mkFunction
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
            OnEval = dwsUnitScriptServiceClassesTScriptPackageListMethodsFindByFilenameEval
            Kind = mkFunction
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
            OnEval = dwsUnitScriptServiceClassesTScriptPackageMethodsGetPluginIDEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetPackageName'
            ResultType = 'string'
            OnEval = dwsUnitScriptServiceClassesTScriptPackageMethodsGetPluginNameEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetPackageURI'
            ResultType = 'string'
            OnEval = dwsUnitScriptServiceClassesTScriptPackageMethodsGetPluginURIEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetDescription'
            ResultType = 'string'
            OnEval = dwsUnitScriptServiceClassesTScriptPackageMethodsGetDescriptionEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetVersion'
            ResultType = 'string'
            OnEval = dwsUnitScriptServiceClassesTScriptPackageMethodsGetVersionEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetAuthor'
            ResultType = 'string'
            OnEval = dwsUnitScriptServiceClassesTScriptPackageMethodsGetAuthorEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetAuthorID'
            ResultType = 'string'
            OnEval = dwsUnitScriptServiceClassesTScriptPackageMethodsGetAuthorIDEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetAuthorURI'
            ResultType = 'string'
            OnEval = dwsUnitScriptServiceClassesTScriptPackageMethodsGetAuthorURIEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetFilename'
            ResultType = 'string'
            OnEval = dwsUnitScriptServiceClassesTScriptPackageMethodsGetFilenameEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetEnabled'
            ResultType = 'boolean'
            OnEval = dwsUnitScriptServiceClassesTScriptPackageMethodsGetEnabledEval
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
            OnEval = dwsUnitScriptServiceClassesTScriptPackageMethodsSetEnabledEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetProductID'
            ResultType = 'string'
            OnEval = dwsUnitScriptServiceClassesTScriptPackageMethodsGetProductIDEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetPackageKind'
            ResultType = 'TScriptPackageKind'
            OnEval = dwsUnitScriptServiceClassesTScriptPackageMethodsGetPackageKindEval
            Visibility = cvProtected
            Kind = mkFunction
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
