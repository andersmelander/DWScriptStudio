object DataModuleScriptIO: TDataModuleScriptIO
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
            Kind = mkClassProcedure
            OnEval = dwsUnitIOClassesDirectoryMethodsCopyEval
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
            Kind = mkClassProcedure
            OnEval = dwsUnitIOClassesDirectoryMethodsCreateDirectoryEval
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
            Kind = mkClassProcedure
            OnEval = dwsUnitIOClassesDirectoryMethodsDeleteEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesDirectoryMethodsExistsEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesDirectoryMethodsGetParentEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesDirectoryMethodsIsEmptyEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesDirectoryMethodsIsRelativePathEval
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
            Kind = mkClassProcedure
            OnEval = dwsUnitIOClassesDirectoryMethodsMoveEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesDirectoryMethodsGetDirectoriesEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesDirectoryMethodsGetDirectoryRootEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesDirectoryMethodsGetFilesEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesDirectoryMethodsGetAttributesEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesDirectoryMethodsGetCreationTimeEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesDirectoryMethodsGetCreationTimeUtcEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesDirectoryMethodsGetLastAccessTimeEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesDirectoryMethodsGetLastAccessTimeUtcEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesDirectoryMethodsGetLastWriteTimeEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesDirectoryMethodsGetLastWriteTimeUtcEval
          end>
      end
      item
        Name = 'Path'
        IsSealed = True
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesPathMethodsIsValidPathCharEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesPathMethodsIsValidFileNameCharEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesPathMethodsIsRelativePathEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesPathMethodsIsUNCPathEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesPathMethodsIsUNCRootedEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesPathMethodsGetGUIDFileNameEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesPathMethodsDriveExistsEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesPathMethodsMatchesPatternEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesPathMethodsChangeExtensionEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesPathMethodsCombineEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesPathMethodsGetDirectoryNameEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesPathMethodsGetExtensionEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesPathMethodsGetFileNameEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesPathMethodsGetFileNameWithoutExtensionEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesPathMethodsGetFullPathEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesPathMethodsGetPathRootEval
          end
          item
            Name = 'GetRandomFileName'
            ResultType = 'string'
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesPathMethodsGetRandomFileNameEval
          end
          item
            Name = 'GetTempFileName'
            ResultType = 'string'
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesPathMethodsGetTempFileNameEval
          end
          item
            Name = 'GetTempPath'
            ResultType = 'string'
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesPathMethodsGetTempPathEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesPathMethodsGetAttributesEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesPathMethodsHasExtensionEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesPathMethodsIsPathRootedEval
          end>
      end
      item
        Name = 'File'
        IsSealed = True
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
            Kind = mkClassProcedure
            OnEval = dwsUnitIOClassesFileMethodsAppendAllTextEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesFileMethodsAppendTextEval
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
            Kind = mkClassProcedure
            OnEval = dwsUnitIOClassesFileMethodsCopyEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesFileMethodsCreateSymLinkEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesFileMethodsCreateTextEval
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
            Kind = mkClassProcedure
            OnEval = dwsUnitIOClassesFileMethodsDecryptEval
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
            Kind = mkClassProcedure
            OnEval = dwsUnitIOClassesFileMethodsDeleteEval
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
            Kind = mkClassProcedure
            OnEval = dwsUnitIOClassesFileMethodsEncryptEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesFileMethodsExistsEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesFileMethodsGetAttributesEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesFileMethodsGetCreationTimeEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesFileMethodsGetCreationTimeUtcEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesFileMethodsGetLastAccessTimeEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesFileMethodsGetLastAccessTimeUtcEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesFileMethodsGetLastWriteTimeEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesFileMethodsGetLastWriteTimeUtcEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesFileMethodsGetSymLinkTargetEval
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
            Kind = mkClassProcedure
            OnEval = dwsUnitIOClassesFileMethodsMoveEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesFileMethodsOpenEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesFileMethodsOpenReadEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesFileMethodsOpenTextEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesFileMethodsOpenWriteEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesFileMethodsReadAllBytesEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesFileMethodsReadAllLinesEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesFileMethodsReadAllTextEval
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
            Kind = mkClassProcedure
            OnEval = dwsUnitIOClassesFileMethodsReplaceEval
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
            Kind = mkClassProcedure
            OnEval = dwsUnitIOClassesFileMethodsWriteAllBytesEval
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
            Kind = mkClassProcedure
            OnEval = dwsUnitIOClassesFileMethodsWriteAllLinesEval
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
            Kind = mkClassProcedure
            OnEval = dwsUnitIOClassesFileMethodsWriteAllTextEval
          end>
      end
      item
        Name = 'Shell'
        IsSealed = True
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesShellMethodsExpandPathEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesShellMethodsTokenizePathEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesShellMethodsGetEnvironmentVariableEval
          end>
      end
      item
        Name = 'FileSystem'
        IsSealed = True
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesFileSystemMethodsFileExistsEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesFileSystemMethodsIsAttachmentEval
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
            Kind = mkClassFunction
            OnEval = dwsUnitIOClassesFileSystemMethodsResolveFilenameEval
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
