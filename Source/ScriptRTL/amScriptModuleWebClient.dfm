object DataModuleScriptNetWebClient: TDataModuleScriptNetWebClient
  OldCreateOrder = False
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
            OnEval = dwsUnitWebClientClassesTWebCredentialMethodsGetUsernameEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTWebCredentialMethodsSetUsernameEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetPassword'
            ResultType = 'string'
            OnEval = dwsUnitWebClientClassesTWebCredentialMethodsGetPasswordEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTWebCredentialMethodsSetPasswordEval
            Visibility = cvProtected
            Kind = mkProcedure
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
            OnEval = dwsUnitWebClientClassesTWebCredentialsMethodsAddEval
            Kind = mkProcedure
          end
          item
            Name = 'Clear'
            OnEval = dwsUnitWebClientClassesTWebCredentialsMethodsClearEval
            Kind = mkProcedure
          end
          item
            Name = 'Assign'
            Parameters = <
              item
                Name = 'Source'
                DataType = 'TWebCredentials'
              end>
            OnEval = dwsUnitWebClientClassesTWebCredentialsMethodsAssignEval
            Kind = mkProcedure
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
            OnEval = dwsUnitWebClientClassesTWebCredentialsMethodsRemove1Eval
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
            OnEval = dwsUnitWebClientClassesTWebCredentialsMethodsRemove2Eval
            Kind = mkProcedure
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
            OnEval = dwsUnitWebClientClassesTWebCredentialsMethodsFind1Eval
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTWebCredentialsMethodsFind2Eval
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTWebClientMethodsConnect1Eval
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTWebClientMethodsConnect2Eval
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTWebClientMethodsGetCredentialsEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTWebClientMethodsGetEval
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTWebClientMethodsPostEval
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTWebClientMethodsPutEval
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTWebClientMethodsDeleteEval
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsGetHeadersEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetContent'
            ResultType = 'string'
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsGetContentEval
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
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsSetContentEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'LoadFromStream'
            Parameters = <
              item
                Name = 'Stream'
                DataType = 'TStream'
              end>
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsLoadFromStreamEval
            Kind = mkProcedure
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
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsExecuteEval
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsGet1Eval
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsGet2Eval
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsGet3Eval
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsPost1Eval
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsPost2Eval
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsPost3Eval
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsPut1Eval
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsPut2Eval
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsPut3Eval
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsDeleteEval
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsHeadEval
            Kind = mkFunction
          end
          item
            Name = 'GetCredentials'
            ResultType = 'TWebCredentials'
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsGetCredentialsEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetContentType'
            ResultType = 'string'
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsGetContentTypeEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTWebRequestMethodsSetContentTypeEval
            Visibility = cvProtected
            Kind = mkProcedure
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
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsGetHeadersEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetContentType'
            ResultType = 'string'
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsGetContentTypeEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetContent'
            ResultType = 'string'
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsGetContentEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetContentAsText'
            ResultType = 'string'
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsGetContentAsTextEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetContentStream'
            ResultType = 'TStream'
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsGetContentStreamEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetStatusCode'
            ResultType = 'integer'
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsGetStatusCodeEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetStatusDescription'
            ResultType = 'string'
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsGetStatusDescriptionEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetSuccess'
            ResultType = 'boolean'
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsGetSuccessEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetContentLength'
            ResultType = 'integer'
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsGetContentLengthEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetCurrentContentSize'
            ResultType = 'integer'
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsGetCurrentContentSizeEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetCompleted'
            ResultType = 'boolean'
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsGetCompletedEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetErrorMessage'
            ResultType = 'string'
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsGetErrorMessageEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetAborted'
            ResultType = 'boolean'
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsGetAbortedEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetFailed'
            ResultType = 'boolean'
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsGetFailedEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'Abort'
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsAbortEval
            Kind = mkProcedure
          end
          item
            Name = 'SaveToStream'
            Parameters = <
              item
                Name = 'Stream'
                DataType = 'TStream'
              end>
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsSaveToStreamEval
            Kind = mkProcedure
          end
          item
            Name = 'Wait'
            ResultType = 'TWebResponse'
            OnEval = dwsUnitWebClientClassesTWebResponseMethodsWaitEval
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTUriMethodsGetProtocolEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTUriMethodsSetProtocolEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetHost'
            ResultType = 'string'
            OnEval = dwsUnitWebClientClassesTUriMethodsGetHostEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTUriMethodsSetHostEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetPort'
            ResultType = 'string'
            OnEval = dwsUnitWebClientClassesTUriMethodsGetPortEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTUriMethodsSetPortEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetPath'
            ResultType = 'string'
            OnEval = dwsUnitWebClientClassesTUriMethodsGetPathEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTUriMethodsSetPathEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetDocument'
            ResultType = 'string'
            OnEval = dwsUnitWebClientClassesTUriMethodsGetDocumentEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTUriMethodsSetDocumentEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetBookmark'
            ResultType = 'string'
            OnEval = dwsUnitWebClientClassesTUriMethodsGetBookmarkEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTUriMethodsSetBookMarkEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetParams'
            ResultType = 'string'
            OnEval = dwsUnitWebClientClassesTUriMethodsGetParamsEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTUriMethodsSetParamsEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetUserName'
            ResultType = 'string'
            OnEval = dwsUnitWebClientClassesTUriMethodsGetUserNameEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTUriMethodsSetUserNameEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetPassword'
            ResultType = 'string'
            OnEval = dwsUnitWebClientClassesTUriMethodsGetPasswordEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTUriMethodsSetPasswordEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetURI'
            ResultType = 'string'
            OnEval = dwsUnitWebClientClassesTUriMethodsGetURIEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTUriMethodsSetURIEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetIPVersion'
            ResultType = 'TIPVersion'
            OnEval = dwsUnitWebClientClassesTUriMethodsGetIPVersionEval
            Visibility = cvProtected
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTUriMethodsSetIPVersionEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetPathAndParams'
            ResultType = 'String'
            OnEval = dwsUnitWebClientClassesTUriMethodsGetPathAndParamsEval
            Kind = mkFunction
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
            OnEval = dwsUnitWebClientClassesTUriMethodsNormalizePathEval
            Kind = mkClassFunction
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
            OnEval = dwsUnitWebClientClassesTUriMethodsExcludeTrailingDelimiterEval
            Kind = mkClassFunction
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
            OnEval = dwsUnitWebClientClassesTUriMethodsIncludeTrailingDelimiterEval
            Kind = mkClassFunction
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
            OnEval = dwsUnitWebClientClassesTUriMethodsURLEncodeEval
            Kind = mkClassFunction
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
            OnEval = dwsUnitWebClientClassesTUriMethodsURLDecodeEval
            Kind = mkClassFunction
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
            OnEval = dwsUnitWebClientClassesTUriMethodsIsURLEncodedEval
            Kind = mkClassFunction
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
            OnEval = dwsUnitWebClientClassesTUriMethodsIsHostIPv6Eval
            Kind = mkClassFunction
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
            OnEval = dwsUnitWebClientClassesTUriMethodsIsUrlIPv6Eval
            Kind = mkClassFunction
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
            OnEval = dwsUnitWebClientClassesTUriMethodsIPv6EncodeURLEval
            Kind = mkClassFunction
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
