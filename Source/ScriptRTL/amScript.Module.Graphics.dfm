object DataModuleScriptGraphics: TDataModuleScriptGraphics
  Height = 264
  Width = 381
  object dwsUnitGraphics: TdwsUnit
    Classes = <
      item
        Name = 'TGraphic'
        Ancestor = 'TPersistent'
        IsAbstract = True
        IsInternal = True
        Methods = <
          item
            Name = 'GetEmpty'
            ResultType = 'boolean'
            Attributes = [maVirtual]
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitGraphicsClassesTGraphicMethodsGetEmptyEval
          end
          item
            Name = 'GetHeight'
            ResultType = 'integer'
            Attributes = [maVirtual]
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitGraphicsClassesTGraphicMethodsGetHeightEval
          end
          item
            Name = 'SetHeight'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'integer'
              end>
            Attributes = [maVirtual]
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitGraphicsClassesTGraphicMethodsSetHeightEval
          end
          item
            Name = 'GetWidth'
            ResultType = 'integer'
            Attributes = [maVirtual]
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitGraphicsClassesTGraphicMethodsGetWidthEval
          end
          item
            Name = 'SetWidth'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'integer'
              end>
            Attributes = [maVirtual]
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitGraphicsClassesTGraphicMethodsSetWidthEval
          end
          item
            Name = 'GetSupportsAlpha'
            ResultType = 'boolean'
            Attributes = [maVirtual]
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitGraphicsClassesTGraphicMethodsGetSupportsAlphaEval
          end
          item
            Name = 'LoadFromStream'
            Parameters = <
              item
                Name = 'Stream'
                DataType = 'TStream'
              end
              item
                Name = 'AutoConvert'
                DataType = 'boolean'
                HasDefaultValue = True
                DefaultValue = False
              end>
            Attributes = [maVirtual]
            Kind = mkProcedure
            OnEval = dwsUnitGraphicsClassesTGraphicMethodsLoadFromStreamEval
          end
          item
            Name = 'SaveToStream'
            Parameters = <
              item
                Name = 'Stream'
                DataType = 'TStream'
              end>
            Attributes = [maVirtual]
            Kind = mkProcedure
            OnEval = dwsUnitGraphicsClassesTGraphicMethodsSaveToStreamEval
          end
          item
            Name = 'SetSize'
            Parameters = <
              item
                Name = 'AWidth'
                DataType = 'integer'
              end
              item
                Name = 'AHeight'
                DataType = 'integer'
              end>
            Attributes = [maVirtual]
            Kind = mkProcedure
            OnEval = dwsUnitGraphicsClassesTGraphicMethodsSetSizeEval
          end
          item
            Name = 'Clear'
            Attributes = [maVirtual]
            Kind = mkProcedure
            OnEval = dwsUnitGraphicsClassesTGraphicMethodsClearEval
          end
          item
            Name = 'LoadFromFile'
            Parameters = <
              item
                Name = 'Filename'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'AutoConvert'
                DataType = 'boolean'
                HasDefaultValue = True
                DefaultValue = False
              end>
            Attributes = [maVirtual]
            Kind = mkProcedure
            OnEval = dwsUnitGraphicsClassesTGraphicMethodsLoadFromFileEval
          end
          item
            Name = 'SaveToFile'
            Parameters = <
              item
                Name = 'Filename'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Attributes = [maVirtual]
            Kind = mkProcedure
            OnEval = dwsUnitGraphicsClassesTGraphicMethodsSaveToFileEval
          end
          item
            Name = 'CreateFromStream'
            Parameters = <
              item
                Name = 'Stream'
                DataType = 'TStream'
              end>
            ResultType = 'TGraphic'
            Attributes = [maClassMethod, maStatic]
            Kind = mkClassFunction
            OnEval = dwsUnitGraphicsClassesTGraphicMethodsCreateFromStreamEval
          end
          item
            Name = 'CreateFromFile'
            Parameters = <
              item
                Name = 'Filename'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TGraphic'
            Attributes = [maClassMethod, maStatic]
            Kind = mkClassFunction
            OnEval = dwsUnitGraphicsClassesTGraphicMethodsCreateFromFileEval
          end>
        Properties = <
          item
            Name = 'Empty'
            DataType = 'boolean'
            ReadAccess = 'GetEmpty'
          end
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
            Name = 'SupportsAlpha'
            DataType = 'boolean'
            ReadAccess = 'GetSupportsAlpha'
          end>
        OnCleanUp = dwsUnitGraphicsClassesTGraphicCleanUp
      end
      item
        Name = 'TBitmap'
        Ancestor = 'TGraphic'
        Constructors = <
          item
            Name = 'Create'
            OnEval = dwsUnitGraphicsClassesTBitmapConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'GetPixelFormat'
            ResultType = 'TPixelFormat'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitGraphicsClassesTBitmapMethodsGetPixelFormatEval
          end
          item
            Name = 'SetPixelFormat'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TPixelFormat'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitGraphicsClassesTBitmapMethodsSetPixelFormatEval
          end
          item
            Name = 'GetAlphaFormat'
            ResultType = 'TAlphaFormat'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitGraphicsClassesTBitmapMethodsGetAlphaFormatEval
          end
          item
            Name = 'SetAlphaFormat'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TAlphaFormat'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitGraphicsClassesTBitmapMethodsSetAlphaFormatEval
          end
          item
            Name = 'GetCanvas'
            ResultType = 'TCanvas'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitGraphicsClassesTBitmapMethodsGetCanvasEval
          end>
        Properties = <
          item
            Name = 'PixelFormat'
            DataType = 'TPixelFormat'
            ReadAccess = 'GetPixelFormat'
            WriteAccess = 'SetPixelFormat'
          end
          item
            Name = 'AlphaFormat'
            DataType = 'TAlphaFormat'
            ReadAccess = 'GetAlphaFormat'
            WriteAccess = 'SetAlphaFormat'
          end
          item
            Name = 'Canvas'
            DataType = 'TCanvas'
            ReadAccess = 'GetCanvas'
          end>
        OnCleanUp = dwsUnitGraphicsClassesTBitmapCleanUp
      end
      item
        Name = 'TJPEGImage'
        Ancestor = 'TGraphic'
        Constructors = <
          item
            Name = 'Create'
            OnEval = dwsUnitGraphicsClassesTJPEGImageConstructorsCreateEval
          end>
        OnCleanUp = dwsUnitGraphicsClassesTJPEGImageCleanUp
      end
      item
        Name = 'TPNGImage'
        Ancestor = 'TGraphic'
        Constructors = <
          item
            Name = 'Create'
            OnEval = dwsUnitGraphicsClassesTPNGImageConstructorsCreateEval
          end>
        OnCleanUp = dwsUnitGraphicsClassesTPNGImageCleanUp
      end
      item
        Name = 'TGIFImage'
        Ancestor = 'TGraphic'
        Constructors = <
          item
            Name = 'Create'
            OnEval = dwsUnitGraphicsClassesTGIFImageConstructorsCreateEval
          end>
        OnCleanUp = dwsUnitGraphicsClassesTGIFImageCleanUp
      end
      item
        Name = 'TFont'
        Ancestor = 'TPersistent'
        IsInternal = True
        Constructors = <
          item
            Name = 'Create'
            OnEval = dwsUnitGraphicsClassesTFontConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'GetName'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitGraphicsClassesTFontMethodsGetNameEval
          end
          item
            Name = 'SetName'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitGraphicsClassesTFontMethodsSetNameEval
          end
          item
            Name = 'GetSize'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitGraphicsClassesTFontMethodsGetSizeEval
          end
          item
            Name = 'SetSize'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'integer'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitGraphicsClassesTFontMethodsSetSizeEval
          end
          item
            Name = 'GetStyle'
            ResultType = 'TFontStyles'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitGraphicsClassesTFontMethodsGetStyleEval
          end
          item
            Name = 'SetStyle'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TFontStyles'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitGraphicsClassesTFontMethodsSetStyleEval
          end
          item
            Name = 'GetColor'
            ResultType = 'TColor'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitGraphicsClassesTFontMethodsGetColorEval
          end
          item
            Name = 'SetColor'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'TColor'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitGraphicsClassesTFontMethodsSetColorEval
          end>
        Properties = <
          item
            Name = 'Name'
            DataType = 'string'
            ReadAccess = 'GetName'
            WriteAccess = 'SetName'
          end
          item
            Name = 'Size'
            DataType = 'integer'
            ReadAccess = 'GetSize'
            WriteAccess = 'SetSize'
          end
          item
            Name = 'Style'
            DataType = 'TFontStyles'
            ReadAccess = 'GetStyle'
            WriteAccess = 'SetStyle'
          end
          item
            Name = 'Color'
            DataType = 'TColor'
            ReadAccess = 'GetColor'
            WriteAccess = 'SetColor'
          end>
      end
      item
        Name = 'TCustomCanvas'
        IsAbstract = True
        IsInternal = True
        Methods = <
          item
            Name = 'GetPixel'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Integer'
              end
              item
                Name = 'Y'
                DataType = 'Integer'
              end>
            ResultType = 'TColor'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitGraphicsClassesTCustomCanvasMethodsGetPixelEval
          end
          item
            Name = 'SetPixel'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Integer'
              end
              item
                Name = 'Y'
                DataType = 'Integer'
              end
              item
                Name = 'Value'
                DataType = 'TColor'
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitGraphicsClassesTCustomCanvasMethodsSetPixelEval
          end>
        Properties = <
          item
            Name = 'Pixels'
            DataType = 'TColor'
            ReadAccess = 'GetPixel'
            WriteAccess = 'SetPixel'
            Parameters = <
              item
                Name = 'X'
                DataType = 'integer'
              end
              item
                Name = 'Y'
                DataType = 'integer'
              end>
          end>
      end
      item
        Name = 'TCanvas'
        Ancestor = 'TCustomCanvas'
        IsInternal = True
      end
      item
        Name = 'TSmartImage'
        Ancestor = 'TGraphic'
        Constructors = <
          item
            Name = 'Create'
            OnEval = dwsUnitGraphicsClassesTSmartImageConstructorsCreateEval
          end>
        Methods = <
          item
            Name = 'GetImageFormat'
            ResultType = 'TSmartImageFormat'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitGraphicsClassesTSmartImageMethodsGetImageFormatEval
          end>
        Properties = <
          item
            Name = 'ImageFormat'
            DataType = 'TSmartImageFormat'
            ReadAccess = 'GetImageFormat'
          end>
        OnCleanUp = dwsUnitGraphicsClassesTSmartImageCleanUp
      end>
    Dependencies.Strings = (
      'System.Classes'
      'System.Stream')
    Enumerations = <
      item
        Name = 'TFontStyle'
        Elements = <
          item
            Name = 'fsBold'
          end
          item
            Name = 'fsItalic'
          end
          item
            Name = 'fsUnderline'
          end
          item
            Name = 'fsStrikeout'
          end>
      end
      item
        Name = 'TColorDepth'
        Elements = <
          item
            Name = 'cdDefault'
          end
          item
            Name = 'cdDeviceDependent'
          end
          item
            Name = 'cd4Bit'
          end
          item
            Name = 'cd8Bit'
          end
          item
            Name = 'cd16Bit'
          end
          item
            Name = 'cd24Bit'
          end
          item
            Name = 'cd32Bit'
          end>
      end
      item
        Name = 'TPixelFormat'
        Elements = <
          item
            Name = 'pfDevice'
          end
          item
            Name = 'pf1bit'
          end
          item
            Name = 'pf4bit'
          end
          item
            Name = 'pf8bit'
          end
          item
            Name = 'pf15bit'
          end
          item
            Name = 'pf16bit'
          end
          item
            Name = 'pf24bit'
          end
          item
            Name = 'pf32bit'
          end
          item
            Name = 'pfCustom'
          end>
      end
      item
        Name = 'TAlphaFormat'
        Elements = <
          item
            Name = 'afIgnored'
          end
          item
            Name = 'afDefined'
          end
          item
            Name = 'afPremultiplied'
          end>
      end
      item
        Name = 'TSmartImageFormat'
        Elements = <
          item
            Name = 'ifUnknown'
          end
          item
            Name = 'ifBitmap'
          end
          item
            Name = 'ifPNG'
          end
          item
            Name = 'ifJPEG'
          end
          item
            Name = 'ifGIF'
          end
          item
            Name = 'ifTIFF'
          end>
      end>
    Sets = <
      item
        Name = 'TFontStyles'
        BaseType = 'TFontStyle'
      end>
    Synonyms = <
      item
        Name = 'TColor'
        DataType = 'integer'
      end>
    UnitName = 'System.Graphics'
    StaticSymbols = False
    Left = 104
    Top = 44
  end
end
