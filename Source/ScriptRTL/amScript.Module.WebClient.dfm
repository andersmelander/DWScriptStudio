object DataModuleScriptNetWebClient: TDataModuleScriptNetWebClient
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object dwsUnitWebClient: TdwsUnit
    Classes = <
      item
        Name = 'TWebCredential'
        IsSealed = True
        IsInternal = True
        Methods = <
          item
            Name = 'GetUsername'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebCredentialMethodsGetUsernameEval
          end
          item
            Name = 'SetUsername'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWebClientClassesTWebCredentialMethodsSetUsernameEval
          end
          item
            Name = 'GetPassword'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebCredentialMethodsGetPasswordEval
          end
          item
            Name = 'SetPassword'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWebClientClassesTWebCredentialMethodsSetPasswordEval
          end>
        Properties = <
          item
            Name = 'Username'
            DataType = 'string'
            ReadAccess = 'GetUsername'
            WriteAccess = 'SetUsername'
          end
          item
            Name = 'Password'
            DataType = 'string'
            ReadAccess = 'GetPassword'
            WriteAccess = 'SetPassword'
          end>
      end
      item
        Name = 'TWebCredentials'
        IsSealed = True
        IsInternal = True
        Methods = <
          item
            Name = 'Add'
            Parameters = <
              item
                Name = 'URI'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'AuthScheme'
                DataType = 'WebAuthentication'
              end
              item
                Name = 'Username'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Password'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Kind = mkProcedure
            OnEval = dwsUnitWebClientClassesTWebCredentialsMethodsAddEval
          end
          item
            Name = 'Clear'
            Kind = mkProcedure
            OnEval = dwsUnitWebClientClassesTWebCredentialsMethodsClearEval
          end
          item
            Name = 'Assign'
            Parameters = <
              item
                Name = 'Source'
                DataType = 'TWebCredentials'
              end>
            Kind = mkProcedure
            OnEval = dwsUnitWebClientClassesTWebCredentialsMethodsAssignEval
          end
          item
            Name = 'SaveToStream'
            Parameters = <
              item
                Name = 'Stream'
                DataType = 'TStream'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'LoadFromStream'
            Parameters = <
              item
                Name = 'Stream'
                DataType = 'TStream'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'Remove'
            Parameters = <
              item
                Name = 'URI'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Exact'
                DataType = 'boolean'
                HasDefaultValue = True
                DefaultValue = False
              end>
            Overloaded = True
            Kind = mkProcedure
            OnEval = dwsUnitWebClientClassesTWebCredentialsMethodsRemove1Eval
          end
          item
            Name = 'Remove'
            Parameters = <
              item
                Name = 'URI'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Scheme'
                DataType = 'WebAuthentication'
              end
              item
                Name = 'Exact'
                DataType = 'boolean'
                HasDefaultValue = True
                DefaultValue = False
              end>
            Overloaded = True
            Kind = mkProcedure
            OnEval = dwsUnitWebClientClassesTWebCredentialsMethodsRemove2Eval
          end
          item
            Name = 'Find'
            Parameters = <
              item
                Name = 'URI'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'AuthScheme'
                DataType = 'WebAuthentication'
              end>
            ResultType = 'TWebCredential'
            Overloaded = True
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebCredentialsMethodsFind1Eval
          end
          item
            Name = 'Find'
            Parameters = <
              item
                Name = 'URI'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TWebCredential'
            Overloaded = True
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebCredentialsMethodsFind2Eval
          end>
      end
      item
        Name = 'TWebClient'
        IsInternal = True
        Methods = <
          item
            Name = 'Connect'
            Parameters = <
              item
                Name = 'Hostname'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'HTTPS'
                DataType = 'boolean'
              end
              item
                Name = 'Port'
                DataType = 'integer'
                HasDefaultValue = True
                DefaultValue = -1
              end>
            ResultType = 'TWebRequest'
            Overloaded = True
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebClientMethodsConnect1Eval
          end
          item
            Name = 'Connect'
            Parameters = <
              item
                Name = 'URL'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TWebRequest'
            Overloaded = True
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebClientMethodsConnect2Eval
          end
          item
            Name = 'GetProxyName'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetProxyName'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetProxyByPass'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetProxyByPass'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetConnectionTimeOut'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetConnectionTimeOut'
            Parameters = <
              item
                Name = 'value'
                DataType = 'integer'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetSendTimeout'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetSendTimeout'
            Parameters = <
              item
                Name = 'value'
                DataType = 'integer'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetReceiveTimeout'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetReceiveTimeout'
            Parameters = <
              item
                Name = 'value'
                DataType = 'integer'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetIgnoreSSLCertificateErrors'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetIgnoreSSLCertificateErrors'
            Parameters = <
              item
                Name = 'value'
                DataType = 'boolean'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetCredentials'
            ResultType = 'TWebCredentials'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebClientMethodsGetCredentialsEval
          end
          item
            Name = 'Get'
            Parameters = <
              item
                Name = 'URI'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Header'
                DataType = 'string'
                HasDefaultValue = True
                DefaultValue = ''
              end>
            ResultType = 'TWebResponse'
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebClientMethodsGetEval
          end
          item
            Name = 'Post'
            Parameters = <
              item
                Name = 'URI'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Content'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'ContentType'
                DataType = 'string'
                IsWritable = False
                HasDefaultValue = True
                DefaultValue = ''
              end
              item
                Name = 'Header'
                DataType = 'string'
                IsWritable = False
                HasDefaultValue = True
                DefaultValue = ''
              end>
            ResultType = 'TWebResponse'
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebClientMethodsPostEval
          end
          item
            Name = 'Put'
            Parameters = <
              item
                Name = 'URI'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Content'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'ContentType'
                DataType = 'string'
                IsWritable = False
                HasDefaultValue = True
                DefaultValue = ''
              end
              item
                Name = 'Header'
                DataType = 'string'
                IsWritable = False
                HasDefaultValue = True
                DefaultValue = ''
              end>
            ResultType = 'TWebResponse'
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebClientMethodsPutEval
          end
          item
            Name = 'Delete'
            Parameters = <
              item
                Name = 'URI'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Header'
                DataType = 'string'
                IsWritable = False
                HasDefaultValue = True
                DefaultValue = ''
              end>
            ResultType = 'TWebResponse'
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebClientMethodsDeleteEval
          end>
        Properties = <
          item
            Name = 'ProxyName'
            DataType = 'string'
            ReadAccess = 'GetProxyName'
            WriteAccess = 'SetProxyName'
          end
          item
            Name = 'ProxyByPass'
            DataType = 'string'
            ReadAccess = 'GetProxyByPass'
            WriteAccess = 'SetProxyByPass'
          end
          item
            Name = 'ConnectionTimeOut'
            DataType = 'integer'
            ReadAccess = 'GetConnectionTimeOut'
            WriteAccess = 'SetConnectionTimeOut'
          end
          item
            Name = 'SendTimeout'
            DataType = 'integer'
            ReadAccess = 'GetSendTimeout'
            WriteAccess = 'SetSendTimeout'
          end
          item
            Name = 'ReceiveTimeout'
            DataType = 'integer'
            ReadAccess = 'GetReceiveTimeout'
            WriteAccess = 'SetReceiveTimeout'
          end
          item
            Name = 'IgnoreSSLCertificateErrors'
            DataType = 'boolean'
            ReadAccess = 'GetIgnoreSSLCertificateErrors'
            WriteAccess = 'SetIgnoreSSLCertificateErrors'
          end
          item
            Name = 'Credentials'
            DataType = 'TWebCredentials'
            ReadAccess = 'GetCredentials'
          end>
      end
      item
        Name = 'TWebRequest'
        IsSealed = True
        IsInternal = True
        Methods = <
          item
            Name = 'GetHeaders'
            ResultType = 'TStrings'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsGetHeadersEval
          end
          item
            Name = 'GetContent'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsGetContentEval
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
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsSetContentEval
          end
          item
            Name = 'LoadFromStream'
            Parameters = <
              item
                Name = 'Stream'
                DataType = 'TStream'
              end>
            Kind = mkProcedure
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsLoadFromStreamEval
          end
          item
            Name = 'Execute'
            Parameters = <
              item
                Name = 'Method'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'URI'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TWebResponse'
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsExecuteEval
          end
          item
            Name = 'Get'
            Parameters = <
              item
                Name = 'URI'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TWebResponse'
            Overloaded = True
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsGet1Eval
          end
          item
            Name = 'Get'
            Parameters = <
              item
                Name = 'URI'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Content'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TWebResponse'
            Overloaded = True
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsGet2Eval
          end
          item
            Name = 'Get'
            Parameters = <
              item
                Name = 'URI'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'ResponseStream'
                DataType = 'TStream'
              end>
            ResultType = 'TWebResponse'
            Overloaded = True
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsGet3Eval
          end
          item
            Name = 'Post'
            Parameters = <
              item
                Name = 'URI'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TWebResponse'
            Overloaded = True
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsPost1Eval
          end
          item
            Name = 'Post'
            Parameters = <
              item
                Name = 'URI'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Content'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TWebResponse'
            Overloaded = True
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsPost2Eval
          end
          item
            Name = 'Post'
            Parameters = <
              item
                Name = 'URI'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'ContentStream'
                DataType = 'TStream'
              end>
            ResultType = 'TWebResponse'
            Overloaded = True
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsPost3Eval
          end
          item
            Name = 'Put'
            Parameters = <
              item
                Name = 'URI'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TWebResponse'
            Overloaded = True
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsPut1Eval
          end
          item
            Name = 'Put'
            Parameters = <
              item
                Name = 'URI'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Content'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TWebResponse'
            Overloaded = True
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsPut2Eval
          end
          item
            Name = 'Put'
            Parameters = <
              item
                Name = 'URI'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'ContentStream'
                DataType = 'TStream'
              end>
            ResultType = 'TWebResponse'
            Overloaded = True
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsPut3Eval
          end
          item
            Name = 'Delete'
            Parameters = <
              item
                Name = 'URI'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TWebResponse'
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsDeleteEval
          end
          item
            Name = 'Head'
            Parameters = <
              item
                Name = 'URI'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'TWebResponse'
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsHeadEval
          end
          item
            Name = 'GetCredentials'
            ResultType = 'TWebCredentials'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsGetCredentialsEval
          end
          item
            Name = 'GetContentType'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsGetContentTypeEval
          end
          item
            Name = 'SetContentType'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsSetContentTypeEval
          end>
        Properties = <
          item
            Name = 'Credentials'
            DataType = 'TWebCredentials'
            ReadAccess = 'GetCredentials'
          end
          item
            Name = 'Headers'
            DataType = 'TStrings'
            ReadAccess = 'GetHeaders'
          end
          item
            Name = 'ContentType'
            DataType = 'string'
            ReadAccess = 'GetContentType'
            WriteAccess = 'SetContentType'
          end
          item
            Name = 'Content'
            DataType = 'string'
            ReadAccess = 'GetContent'
            WriteAccess = 'SetContent'
          end>
        OnCleanUp = dwsUnitWebClientClassesTWebRequestCleanUp
      end
      item
        Name = 'TWebResponse'
        IsSealed = True
        IsInternal = True
        Methods = <
          item
            Name = 'GetHeaders'
            ResultType = 'TStrings'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsGetHeadersEval
          end
          item
            Name = 'GetContentType'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsGetContentTypeEval
          end
          item
            Name = 'GetContent'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsGetContentEval
          end
          item
            Name = 'GetContentAsText'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsGetContentAsTextEval
          end
          item
            Name = 'GetContentStream'
            ResultType = 'TStream'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsGetContentStreamEval
          end
          item
            Name = 'GetStatusCode'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsGetStatusCodeEval
          end
          item
            Name = 'GetStatusDescription'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsGetStatusDescriptionEval
          end
          item
            Name = 'GetSuccess'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsGetSuccessEval
          end
          item
            Name = 'GetContentLength'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsGetContentLengthEval
          end
          item
            Name = 'GetCurrentContentSize'
            ResultType = 'integer'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsGetCurrentContentSizeEval
          end
          item
            Name = 'GetCompleted'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsGetCompletedEval
          end
          item
            Name = 'GetErrorMessage'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsGetErrorMessageEval
          end
          item
            Name = 'GetAborted'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsGetAbortedEval
          end
          item
            Name = 'GetFailed'
            ResultType = 'boolean'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsGetFailedEval
          end
          item
            Name = 'Abort'
            Kind = mkProcedure
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsAbortEval
          end
          item
            Name = 'SaveToStream'
            Parameters = <
              item
                Name = 'Stream'
                DataType = 'TStream'
              end>
            Kind = mkProcedure
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsSaveToStreamEval
          end
          item
            Name = 'Wait'
            ResultType = 'TWebResponse'
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsWaitEval
          end>
        Properties = <
          item
            Name = 'Completed'
            DataType = 'boolean'
            ReadAccess = 'GetCompleted'
          end
          item
            Name = 'Headers'
            DataType = 'TStrings'
            ReadAccess = 'GetHeaders'
          end
          item
            Name = 'ContentType'
            DataType = 'string'
            ReadAccess = 'GetContentType'
          end
          item
            Name = 'Content'
            DataType = 'string'
            ReadAccess = 'GetContent'
          end
          item
            Name = 'ContentLength'
            DataType = 'integer'
            ReadAccess = 'GetContentLength'
          end
          item
            Name = 'CurrentContentSize'
            DataType = 'integer'
            ReadAccess = 'GetCurrentContentSize'
          end
          item
            Name = 'ContentAsText'
            DataType = 'string'
            ReadAccess = 'GetContentAsText'
          end
          item
            Name = 'ContentStream'
            DataType = 'TStream'
            ReadAccess = 'GetContentStream'
          end
          item
            Name = 'StatusCode'
            DataType = 'integer'
            ReadAccess = 'GetStatusCode'
          end
          item
            Name = 'StatusDescription'
            DataType = 'string'
            ReadAccess = 'GetStatusDescription'
          end
          item
            Name = 'Success'
            DataType = 'boolean'
            ReadAccess = 'GetSuccess'
          end
          item
            Name = 'ErrorMessage'
            DataType = 'string'
            ReadAccess = 'GetErrorMessage'
          end
          item
            Name = 'Aborted'
            DataType = 'boolean'
            ReadAccess = 'GetAborted'
          end
          item
            Name = 'Failed'
            DataType = 'boolean'
            ReadAccess = 'GetFailed'
          end>
        OnCleanUp = dwsUnitWebClientClassesTWebResponseCleanUp
      end
      item
        Name = 'TUri'
        Constructors = <
          item
            Name = 'Create'
            Overloaded = True
            OnEval = dwsUnitWebClientClassesTUriConstructorsCreate1Eval
          end
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'AURI'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Overloaded = True
            OnEval = dwsUnitWebClientClassesTUriConstructorsCreate2Eval
          end>
        Methods = <
          item
            Name = 'GetProtocol'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTUriMethodsGetProtocolEval
          end
          item
            Name = 'SetProtocol'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWebClientClassesTUriMethodsSetProtocolEval
          end
          item
            Name = 'GetHost'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTUriMethodsGetHostEval
          end
          item
            Name = 'SetHost'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWebClientClassesTUriMethodsSetHostEval
          end
          item
            Name = 'GetPort'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTUriMethodsGetPortEval
          end
          item
            Name = 'SetPort'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWebClientClassesTUriMethodsSetPortEval
          end
          item
            Name = 'GetPath'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTUriMethodsGetPathEval
          end
          item
            Name = 'SetPath'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWebClientClassesTUriMethodsSetPathEval
          end
          item
            Name = 'GetDocument'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTUriMethodsGetDocumentEval
          end
          item
            Name = 'SetDocument'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWebClientClassesTUriMethodsSetDocumentEval
          end
          item
            Name = 'GetBookmark'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTUriMethodsGetBookmarkEval
          end
          item
            Name = 'SetBookMark'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWebClientClassesTUriMethodsSetBookMarkEval
          end
          item
            Name = 'GetParams'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTUriMethodsGetParamsEval
          end
          item
            Name = 'SetParams'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWebClientClassesTUriMethodsSetParamsEval
          end
          item
            Name = 'GetUserName'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTUriMethodsGetUserNameEval
          end
          item
            Name = 'SetUserName'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWebClientClassesTUriMethodsSetUserNameEval
          end
          item
            Name = 'GetPassword'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTUriMethodsGetPasswordEval
          end
          item
            Name = 'SetPassword'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWebClientClassesTUriMethodsSetPasswordEval
          end
          item
            Name = 'GetURI'
            ResultType = 'string'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTUriMethodsGetURIEval
          end
          item
            Name = 'SetURI'
            Parameters = <
              item
                Name = 'value'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWebClientClassesTUriMethodsSetURIEval
          end
          item
            Name = 'GetIPVersion'
            ResultType = 'TIPVersion'
            Visibility = cvProtected
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTUriMethodsGetIPVersionEval
          end
          item
            Name = 'SetIPVersion'
            Parameters = <
              item
                Name = 'value'
                DataType = 'TIPVersion'
                IsVarParam = True
                IsWritable = False
              end>
            Visibility = cvProtected
            Kind = mkProcedure
            OnEval = dwsUnitWebClientClassesTUriMethodsSetIPVersionEval
          end
          item
            Name = 'GetPathAndParams'
            ResultType = 'String'
            Kind = mkFunction
            OnEval = dwsUnitWebClientClassesTUriMethodsGetPathAndParamsEval
          end
          item
            Name = 'NormalizePath'
            Parameters = <
              item
                Name = 'APath'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            Attributes = [maClassMethod, maStatic]
            Kind = mkClassFunction
            OnEval = dwsUnitWebClientClassesTUriMethodsNormalizePathEval
          end
          item
            Name = 'ExcludeTrailingDelimiter'
            Parameters = <
              item
                Name = 'S'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            Attributes = [maClassMethod, maStatic]
            Kind = mkClassFunction
            OnEval = dwsUnitWebClientClassesTUriMethodsExcludeTrailingDelimiterEval
          end
          item
            Name = 'IncludeTrailingDelimiter'
            Parameters = <
              item
                Name = 'S'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            Attributes = [maClassMethod, maStatic]
            Kind = mkClassFunction
            OnEval = dwsUnitWebClientClassesTUriMethodsIncludeTrailingDelimiterEval
          end
          item
            Name = 'URLEncode'
            Parameters = <
              item
                Name = 'url'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'CompleteURL'
                DataType = 'boolean'
                HasDefaultValue = True
                DefaultValue = True
              end>
            ResultType = 'string'
            Attributes = [maClassMethod, maStatic]
            Kind = mkClassFunction
            OnEval = dwsUnitWebClientClassesTUriMethodsURLEncodeEval
          end
          item
            Name = 'URLDecode'
            Parameters = <
              item
                Name = 'url'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'string'
            Attributes = [maClassMethod, maStatic]
            Kind = mkClassFunction
            OnEval = dwsUnitWebClientClassesTUriMethodsURLDecodeEval
          end
          item
            Name = 'IsURLEncoded'
            Parameters = <
              item
                Name = 'url'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'boolean'
            Attributes = [maClassMethod, maStatic]
            Kind = mkClassFunction
            OnEval = dwsUnitWebClientClassesTUriMethodsIsURLEncodedEval
          end
          item
            Name = 'IsHostIPv6'
            Parameters = <
              item
                Name = 'Host'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'boolean'
            Attributes = [maClassMethod, maStatic]
            Kind = mkClassFunction
            OnEval = dwsUnitWebClientClassesTUriMethodsIsHostIPv6Eval
          end
          item
            Name = 'IsUrlIPv6'
            Parameters = <
              item
                Name = 'URL'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end>
            ResultType = 'boolean'
            Attributes = [maClassMethod, maStatic]
            Kind = mkClassFunction
            OnEval = dwsUnitWebClientClassesTUriMethodsIsUrlIPv6Eval
          end
          item
            Name = 'IPv6EncodeURL'
            Parameters = <
              item
                Name = 'URL'
                DataType = 'string'
                IsVarParam = True
                IsWritable = False
              end
              item
                Name = 'Auto'
                DataType = 'boolean'
                HasDefaultValue = True
                DefaultValue = True
              end>
            ResultType = 'string'
            Attributes = [maClassMethod, maStatic]
            Kind = mkClassFunction
            OnEval = dwsUnitWebClientClassesTUriMethodsIPv6EncodeURLEval
          end>
        Properties = <
          item
            Name = 'Protocol'
            DataType = 'string'
            ReadAccess = 'GetProtocol'
            WriteAccess = 'SetProtocol'
          end
          item
            Name = 'Host'
            DataType = 'string'
            ReadAccess = 'GetHost'
            WriteAccess = 'SetHost'
          end
          item
            Name = 'Port'
            DataType = 'string'
            ReadAccess = 'GetPort'
            WriteAccess = 'SetPort'
          end
          item
            Name = 'Path'
            DataType = 'string'
            ReadAccess = 'GetPath'
            WriteAccess = 'SetPath'
          end
          item
            Name = 'Document'
            DataType = 'string'
            ReadAccess = 'GetDocument'
            WriteAccess = 'SetDocument'
          end
          item
            Name = 'Bookmark'
            DataType = 'string'
            ReadAccess = 'GetBookmark'
            WriteAccess = 'SetBookMark'
          end
          item
            Name = 'Params'
            DataType = 'string'
            ReadAccess = 'GetParams'
            WriteAccess = 'SetParams'
          end
          item
            Name = 'Username'
            DataType = 'string'
            ReadAccess = 'GetUserName'
            WriteAccess = 'SetUserName'
          end
          item
            Name = 'Password'
            DataType = 'string'
            ReadAccess = 'GetPassword'
            WriteAccess = 'SetPassword'
          end
          item
            Name = 'IPVersion'
            DataType = 'TIPVersion'
            ReadAccess = 'GetIPVersion'
            WriteAccess = 'SetIPVersion'
          end
          item
            Name = 'URI'
            DataType = 'string'
            ReadAccess = 'GetURI'
            WriteAccess = 'SetURI'
          end>
        OnCleanUp = dwsUnitWebClientClassesTUriCleanUp
      end>
    Dependencies.Strings = (
      'System.Stream'
      'System.Classes')
    Enumerations = <
      item
        Name = 'WebAuthentication'
        Elements = <
          item
            Name = 'None'
          end
          item
            Name = 'Failed'
          end
          item
            Name = 'Basic'
          end
          item
            Name = 'Digest'
          end
          item
            Name = 'Negotiate'
          end
          item
            Name = 'Kerberos'
          end>
        Style = enumScoped
      end
      item
        Name = 'TIPVersion'
        Elements = <
          item
            Name = 'IPv4'
          end
          item
            Name = 'IPv6'
          end>
      end>
    Instances = <
      item
        Name = 'WebClient'
        DataType = 'TWebClient'
        OnInstantiate = dwsUnitWebClientInstancesWebClientInstantiate
      end>
    UnitName = 'System.Net.HTTP.Client'
    StaticSymbols = False
    Left = 108
    Top = 24
  end
end
