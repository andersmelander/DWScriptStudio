object DataModuleScriptUserInterfaceImageList: TDataModuleScriptUserInterfaceImageList
  OldCreateOrder = False
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
            OnEval = dwsUnitImageListClassesTImageListMethodsLoadFromFileEval
            Kind = mkProcedure
          end
          item
            Name = 'LoadFromStream'
            Parameters = <
              item
                Name = 'Stream'
                DataType = 'TStream'
              end>
            OnEval = dwsUnitImageListClassesTImageListMethodsLoadFromStreamEval
            Kind = mkProcedure
          end
          item
            Name = 'GetHeight'
            ResultType = 'integer'
            OnEval = dwsUnitImageListClassesTImageListMethodsGetHeightEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitImageListClassesTImageListMethodsSetHeightEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetWidth'
            ResultType = 'integer'
            OnEval = dwsUnitImageListClassesTImageListMethodsGetWidthEval
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
            OnEval = dwsUnitImageListClassesTImageListMethodsSetWidthEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetCount'
            ResultType = 'integer'
            OnEval = dwsUnitImageListClassesTImageListMethodsGetCountEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'Clear'
            OnEval = dwsUnitImageListClassesTImageListMethodsClearEval
            Kind = mkProcedure
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
            OnEval = dwsUnitImageListClassesTImageListMethodsGetImageEval
            Kind = mkProcedure
          end
          item
            Name = 'Add'
            Parameters = <
              item
                Name = 'Bitmap'
                DataType = 'TBitmap'
              end>
            ResultType = 'integer'
            OnEval = dwsUnitImageListClassesTImageListMethodsAddEval
            Kind = mkFunction
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
            OnEval = dwsUnitImageListClassesTImageListMethodsInsertEval
            Kind = mkProcedure
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
            OnEval = dwsUnitImageListClassesTImageListMethodsReplaceEval
            Kind = mkProcedure
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
