object DataModuleScriptUserInterfaceImageList: TDataModuleScriptUserInterfaceImageList
  Height = 150
  Width = 215
  object dwsUnitImageList: TdwsUnit
    Classes = <
      item
        Name = 'TImageList'
        Ancestor = 'TComponent'
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'Owner'
                DataType = 'TComponent'
              end>
            OnEval = dwsUnitImageListClassesTImageListConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'LoadFromFile'
            Parameters = <
              item
                Name = 'Filename'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
            OnEval = dwsUnitImageListClassesTImageListMethodsLoadFromFileEval
          end
          item
            Name = 'LoadFromStream'
            Parameters = <
              item
                Name = 'Stream'
                DataType = 'TStream'
              end>
            Kind = mkProcedure
            OnEval = dwsUnitImageListClassesTImageListMethodsLoadFromStreamEval
          end
          item
            Name = 'GetHeight'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitImageListClassesTImageListMethodsGetHeightEval
          end
          item
            Name = 'SetHeight'
            Parameters = <
              item
                Name = 'value'
                DataType = 'integer'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitImageListClassesTImageListMethodsSetHeightEval
          end
          item
            Name = 'GetWidth'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitImageListClassesTImageListMethodsGetWidthEval
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
            OnEval = dwsUnitImageListClassesTImageListMethodsSetWidthEval
          end
          item
            Name = 'GetCount'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitImageListClassesTImageListMethodsGetCountEval
          end
          item
            Name = 'Clear'
            Kind = mkProcedure
            OnEval = dwsUnitImageListClassesTImageListMethodsClearEval
          end
          item
            Name = 'GetImage'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end
              item
                Name = 'Bitmap'
                DataType = 'TBitmap'
              end>
            Kind = mkProcedure
            OnEval = dwsUnitImageListClassesTImageListMethodsGetImageEval
          end
          item
            Name = 'Add'
            Parameters = <
              item
                Name = 'Bitmap'
                DataType = 'TBitmap'
              end>
            ResultType = 'integer'
            Kind = mkFunction
            OnEval = dwsUnitImageListClassesTImageListMethodsAddEval
          end
          item
            Name = 'Insert'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end
              item
                Name = 'Bitmap'
                DataType = 'TBitmap'
              end>
            Kind = mkProcedure
            OnEval = dwsUnitImageListClassesTImageListMethodsInsertEval
          end
          item
            Name = 'Replace'
            Parameters = <
              item
                Name = 'Index'
                DataType = 'integer'
              end
              item
                Name = 'Bitmap'
                DataType = 'TBitmap'
              end>
            Kind = mkProcedure
            OnEval = dwsUnitImageListClassesTImageListMethodsReplaceEval
          end>
        Properties = <
          item
            Name = 'Height'
            DataType = 'integer'
            ReadAccess = 'GetHeight'
            WriteAccess = 'SetHeight'
          end
          item
            Name = 'Width'
            DataType = 'integer'
            ReadAccess = 'GetWidth'
            WriteAccess = 'SetWidth'
          end
          item
            Name = 'Count'
            DataType = 'integer'
            ReadAccess = 'GetCount'
          end>
        OnCleanUp = dwsUnitImageListClassesTImageListCleanUp
      end>
    Dependencies.Strings = (
      'System.Stream'
      'System.Graphics')
    UnitName = 'System.UI.ImageList'
    StaticSymbols = False
    Left = 80
    Top = 40
  end
end
