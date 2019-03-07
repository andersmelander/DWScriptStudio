object DataModuleScriptIO: TDataModuleScriptIO
  OldCreateOrder = False
  Height = 193
  Width = 259
  object dwsUnitIO: TdwsUnit
    Arrays = <
      item
        Name = 'TDirectoryList'
        DataType = 'string'
        IsDynamic = True
      end>
    Classes = <
      item
        Name = 'Directory'
        IsSealed = True
        IsAbstract = True
        IsStatic = True
        Methods = <
          item
            Name = 'Copy'
            Parameters = <
              item
                Name = 'SourceDirName'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'DestDirName'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesDirectoryMethodsCopyEval
            Kind = mkClassProcedure
          end
          item
            Name = 'CreateDirectory'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesDirectoryMethodsCreateDirectoryEval
            Kind = mkClassProcedure
          end
          item
            Name = 'Delete'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Recursive'
                DataType = 'boolean'
                HasDefaultValue = True
                DefaultValue = False
              end>
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesDirectoryMethodsDeleteEval
            Kind = mkClassProcedure
          end
          item
            Name = 'Exists'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'FollowLink'
                DataType = 'Boolean'
                HasDefaultValue = True
                DefaultValue = True
              end>
            ResultType = 'boolean'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesDirectoryMethodsExistsEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetParent'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesDirectoryMethodsGetParentEval
            Kind = mkClassFunction
          end
          item
            Name = 'IsEmpty'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'boolean'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesDirectoryMethodsIsEmptyEval
            Kind = mkClassFunction
          end
          item
            Name = 'IsRelativePath'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'boolean'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesDirectoryMethodsIsRelativePathEval
            Kind = mkClassFunction
          end
          item
            Name = 'Move'
            Parameters = <
              item
                Name = 'SourceDirName'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'DestDirName'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesDirectoryMethodsMoveEval
            Kind = mkClassProcedure
          end
          item
            Name = 'GetDirectories'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'SearchPattern'
                DataType = 'string'
                IsWritable = False
                HasDefaultValue = True
                DefaultValue = #39'*'#39
              end
              item
                Name = 'Recurse'
                DataType = 'boolean'
                HasDefaultValue = True
                DefaultValue = False
              end
              item
                Name = 'Predicate'
                DataType = 'TFilterPredicate'
                IsWritable = False
                HasDefaultValue = True
              end>
            ResultType = 'TStringArray'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesDirectoryMethodsGetDirectoriesEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetDirectoryRoot'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesDirectoryMethodsGetDirectoryRootEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetFiles'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'SearchPattern'
                DataType = 'string'
                IsWritable = False
                HasDefaultValue = True
                DefaultValue = #39'*'#39
              end
              item
                Name = 'Recurse'
                DataType = 'boolean'
                HasDefaultValue = True
                DefaultValue = False
              end
              item
                Name = 'Predicate'
                DataType = 'TFilterPredicate'
                IsWritable = False
                HasDefaultValue = True
              end>
            ResultType = 'TStringArray'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesDirectoryMethodsGetFilesEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetAttributes'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'FollowLink'
                DataType = 'Boolean'
                HasDefaultValue = True
                DefaultValue = True
              end>
            ResultType = 'TFileAttributes'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesDirectoryMethodsGetAttributesEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetCreationTime'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'float'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesDirectoryMethodsGetCreationTimeEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetCreationTimeUtc'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'float'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesDirectoryMethodsGetCreationTimeUtcEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetLastAccessTime'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'float'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesDirectoryMethodsGetLastAccessTimeEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetLastAccessTimeUtc'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'float'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesDirectoryMethodsGetLastAccessTimeUtcEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetLastWriteTime'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'float'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesDirectoryMethodsGetLastWriteTimeEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetLastWriteTimeUtc'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'float'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesDirectoryMethodsGetLastWriteTimeUtcEval
            Kind = mkClassFunction
          end>
      end
      item
        Name = 'Path'
        IsSealed = True
        IsAbstract = True
        IsStatic = True
        Methods = <
          item
            Name = 'IsValidPathChar'
            Parameters = <
              item
                Name = 'AChar'
                DataType = 'integer'
              end>
            ResultType = 'boolean'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesPathMethodsIsValidPathCharEval
            Kind = mkClassFunction
          end
          item
            Name = 'IsValidFileNameChar'
            Parameters = <
              item
                Name = 'AChar'
                DataType = 'integer'
              end>
            ResultType = 'boolean'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesPathMethodsIsValidFileNameCharEval
            Kind = mkClassFunction
          end
          item
            Name = 'IsRelativePath'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'boolean'
            OnEval = dwsUnitIOClassesPathMethodsIsRelativePathEval
            Kind = mkClassFunction
          end
          item
            Name = 'IsUNCPath'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'boolean'
            OnEval = dwsUnitIOClassesPathMethodsIsUNCPathEval
            Kind = mkClassFunction
          end
          item
            Name = 'IsUNCRooted'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'boolean'
            OnEval = dwsUnitIOClassesPathMethodsIsUNCRootedEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetGUIDFileName'
            Parameters = <
              item
                Name = 'UseSeparator'
                DataType = 'boolean'
                HasDefaultValue = True
                DefaultValue = False
              end>
            ResultType = 'string'
            OnEval = dwsUnitIOClassesPathMethodsGetGUIDFileNameEval
            Kind = mkClassFunction
          end
          item
            Name = 'DriveExists'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'boolean'
            OnEval = dwsUnitIOClassesPathMethodsDriveExistsEval
            Kind = mkClassFunction
          end
          item
            Name = 'MatchesPattern'
            Parameters = <
              item
                Name = 'FileName'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Pattern'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'CaseSensitive'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'boolean'
            OnEval = dwsUnitIOClassesPathMethodsMatchesPatternEval
            Kind = mkClassFunction
          end
          item
            Name = 'ChangeExtension'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Extension'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            OnEval = dwsUnitIOClassesPathMethodsChangeExtensionEval
            Kind = mkClassFunction
          end
          item
            Name = 'Combine'
            Parameters = <
              item
                Name = 'Path1'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Path2'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            OnEval = dwsUnitIOClassesPathMethodsCombineEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetDirectoryName'
            Parameters = <
              item
                Name = 'FileName'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            OnEval = dwsUnitIOClassesPathMethodsGetDirectoryNameEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetExtension'
            Parameters = <
              item
                Name = 'FileName'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            OnEval = dwsUnitIOClassesPathMethodsGetExtensionEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetFileName'
            Parameters = <
              item
                Name = 'FileName'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            OnEval = dwsUnitIOClassesPathMethodsGetFileNameEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetFileNameWithoutExtension'
            Parameters = <
              item
                Name = 'FileName'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            OnEval = dwsUnitIOClassesPathMethodsGetFileNameWithoutExtensionEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetFullPath'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            OnEval = dwsUnitIOClassesPathMethodsGetFullPathEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetPathRoot'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            OnEval = dwsUnitIOClassesPathMethodsGetPathRootEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetRandomFileName'
            ResultType = 'string'
            OnEval = dwsUnitIOClassesPathMethodsGetRandomFileNameEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetTempFileName'
            ResultType = 'string'
            OnEval = dwsUnitIOClassesPathMethodsGetTempFileNameEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetTempPath'
            ResultType = 'string'
            OnEval = dwsUnitIOClassesPathMethodsGetTempPathEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetAttributes'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'FollowLink'
                DataType = 'Boolean'
                HasDefaultValue = True
                DefaultValue = True
              end>
            ResultType = 'TFileAttributes'
            OnEval = dwsUnitIOClassesPathMethodsGetAttributesEval
            Kind = mkClassFunction
          end
          item
            Name = 'HasExtension'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'boolean'
            OnEval = dwsUnitIOClassesPathMethodsHasExtensionEval
            Kind = mkClassFunction
          end
          item
            Name = 'IsPathRooted'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'boolean'
            OnEval = dwsUnitIOClassesPathMethodsIsPathRootedEval
            Kind = mkClassFunction
          end>
      end
      item
        Name = 'File'
        IsSealed = True
        IsAbstract = True
        IsStatic = True
        Methods = <
          item
            Name = 'AppendAllText'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Contents'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsAppendAllTextEval
            Kind = mkClassProcedure
          end
          item
            Name = 'AppendText'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TStreamWriter'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsAppendTextEval
            Kind = mkClassFunction
          end
          item
            Name = 'Copy'
            Parameters = <
              item
                Name = 'SourceFileName'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'DestFileName'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Overwrite'
                DataType = 'boolean'
                HasDefaultValue = True
                DefaultValue = False
              end>
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsCopyEval
            Kind = mkClassProcedure
          end
          item
            Name = 'CreateSymLink'
            Parameters = <
              item
                Name = 'Link'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Target'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'boolean'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsCreateSymLinkEval
            Kind = mkClassFunction
          end
          item
            Name = 'CreateText'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TStreamWriter'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsCreateTextEval
            Kind = mkClassFunction
          end
          item
            Name = 'Decrypt'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsDecryptEval
            Kind = mkClassProcedure
          end
          item
            Name = 'Delete'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsDeleteEval
            Kind = mkClassProcedure
          end
          item
            Name = 'Encrypt'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsEncryptEval
            Kind = mkClassProcedure
          end
          item
            Name = 'Exists'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'FollowLink'
                DataType = 'boolean'
                HasDefaultValue = True
                DefaultValue = True
              end>
            ResultType = 'Boolean'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsExistsEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetAttributes'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'FollowLink'
                DataType = 'Boolean'
                HasDefaultValue = True
                DefaultValue = True
              end>
            ResultType = 'Boolean'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsGetAttributesEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetCreationTime'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'float'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsGetCreationTimeEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetCreationTimeUtc'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'float'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsGetCreationTimeUtcEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetLastAccessTime'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'float'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsGetLastAccessTimeEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetLastAccessTimeUtc'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'float'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsGetLastAccessTimeUtcEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetLastWriteTime'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'float'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsGetLastWriteTimeEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetLastWriteTimeUtc'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'float'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsGetLastWriteTimeUtcEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetSymLinkTarget'
            Parameters = <
              item
                Name = 'FileName'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'TargetName'
                DataType = 'string'
                IsVarParam = True
              end>
            ResultType = 'Boolean'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsGetSymLinkTargetEval
            Kind = mkClassFunction
          end
          item
            Name = 'Move'
            Parameters = <
              item
                Name = 'SourceFileName'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'DestFileName'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsMoveEval
            Kind = mkClassProcedure
          end
          item
            Name = 'Open'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Mode'
                DataType = 'TFileOpenMode'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TStream'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsOpenEval
            Kind = mkClassFunction
          end
          item
            Name = 'OpenRead'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TFileStream'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsOpenReadEval
            Kind = mkClassFunction
          end
          item
            Name = 'OpenText'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TStreamReader'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsOpenTextEval
            Kind = mkClassFunction
          end
          item
            Name = 'OpenWrite'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TFileStream'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsOpenWriteEval
            Kind = mkClassFunction
          end
          item
            Name = 'ReadAllBytes'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'Variant'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsReadAllBytesEval
            Kind = mkClassFunction
          end
          item
            Name = 'ReadAllLines'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TStringArray'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsReadAllLinesEval
            Kind = mkClassFunction
          end
          item
            Name = 'ReadAllText'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsReadAllTextEval
            Kind = mkClassFunction
          end
          item
            Name = 'Replace'
            Parameters = <
              item
                Name = 'SourceFileName'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'DestinationFileName'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'DestinationBackupFileName'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'IgnoreMetadataErrors'
                DataType = 'Boolean'
                HasDefaultValue = True
                DefaultValue = True
              end>
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsReplaceEval
            Kind = mkClassProcedure
          end
          item
            Name = 'WriteAllBytes'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Bytes'
                DataType = 'Variant'
                IsVarParam = True
                IsWritable = False
              end>
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsWriteAllBytesEval
            Kind = mkClassProcedure
          end
          item
            Name = 'WriteAllLines'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Contents'
                DataType = 'TStringArray'
                IsVarParam = True
                IsWritable = False
              end>
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsWriteAllLinesEval
            Kind = mkClassProcedure
          end
          item
            Name = 'WriteAllText'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Contents'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileMethodsWriteAllTextEval
            Kind = mkClassProcedure
          end>
      end
      item
        Name = 'Shell'
        IsSealed = True
        IsAbstract = True
        IsStatic = True
        Methods = <
          item
            Name = 'ExpandPath'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesShellMethodsExpandPathEval
            Kind = mkClassFunction
          end
          item
            Name = 'TokenizePath'
            Parameters = <
              item
                Name = 'Path'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesShellMethodsTokenizePathEval
            Kind = mkClassFunction
          end
          item
            Name = 'GetEnvironmentVariable'
            Parameters = <
              item
                Name = 'Name'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesShellMethodsGetEnvironmentVariableEval
            Kind = mkClassFunction
          end>
      end
      item
        Name = 'FileSystem'
        IsSealed = True
        IsAbstract = True
        IsStatic = True
        Methods = <
          item
            Name = 'FileExists'
            Parameters = <
              item
                Name = 'Filename'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'boolean'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileSystemMethodsFileExistsEval
            Kind = mkClassFunction
          end
          item
            Name = 'IsAttachment'
            Parameters = <
              item
                Name = 'Filename'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'boolean'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileSystemMethodsIsAttachmentEval
            Kind = mkClassFunction
          end
          item
            Name = 'ResolveFilename'
            Parameters = <
              item
                Name = 'Filename'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            Attributes = [maClassMethod, maStatic]
            OnEval = dwsUnitIOClassesFileSystemMethodsResolveFilenameEval
            Kind = mkClassFunction
          end>
      end>
    Dependencies.Strings = (
      'System.Classes'
      'System.Stream')
    Enumerations = <
      item
        Name = 'TFileAttribute'
        Elements = <
          item
            Name = 'faReadOnly'
          end
          item
            Name = 'faHidden'
          end
          item
            Name = 'faSystem'
          end
          item
            Name = 'faDirectory'
          end
          item
            Name = 'faArchive'
          end
          item
            Name = 'faDevice'
          end
          item
            Name = 'faNormal'
          end
          item
            Name = 'faTemporary'
          end
          item
            Name = 'faSparseFile'
          end
          item
            Name = 'faReparsePoint'
          end
          item
            Name = 'faCompressed'
          end
          item
            Name = 'faOffline'
          end
          item
            Name = 'faNotContentIndexed'
          end
          item
            Name = 'faEncrypted'
          end
          item
            Name = 'faSymLink'
          end>
      end>
    Sets = <
      item
        Name = 'TFileAttributes'
        BaseType = 'TFileAttribute'
      end>
    Delegates = <
      item
        Name = 'TFilterPredicate'
        Parameters = <
          item
            Name = 'Path'
            DataType = 'string'
            IsVarParam = True
            IsWritable = False
          end
          item
            Name = 'SearchRec'
            DataType = 'TSearchRec'
            IsVarParam = True
            IsWritable = False
          end>
        ResultType = 'Boolean'
      end>
    Records = <
      item
        Name = 'TSearchRec'
        Members = <
          item
            Name = 'Size'
            DataType = 'integer'
          end
          item
            Name = 'Attr'
            DataType = 'TFileAttributes'
          end
          item
            Name = 'Name'
            DataType = 'string'
          end
          item
            Name = 'ExcludeAttr'
            DataType = 'integer'
          end
          item
            Name = 'TimeStamp'
            DataType = 'Float'
          end>
        Properties = <>
      end>
    UnitName = 'System.IO'
    StaticSymbols = False
    Left = 112
    Top = 40
  end
end
