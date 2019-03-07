unit amScriptModuleWebClient;

(*
 * Copyright © 2015 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

{.$define WEBCLIENT_SYNOPSE}

uses
  SysUtils, Classes,
  Controls,
  Generics.Collections,

  dwsComp,
  dwsExprs,
  dwsCompiler,
  dwsClassesLibModule,

  amScriptModule;

// -----------------------------------------------------------------------------
//
// TDataModuleScriptNetWebClient
//
// -----------------------------------------------------------------------------
type
  TDataModule = class(TScriptModule);

  TDataModuleScriptNetWebClient = class(TDataModule)
    dwsUnitWebClient: TdwsUnit;
    procedure DataModuleCreate(Sender: TObject);
    procedure dwsUnitWebClientInstancesWebClientInstantiate(info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebClientMethodsConnect1Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebRequestCleanUp(ExternalObject: TObject);
    procedure dwsUnitWebClientClassesTWebClientMethodsConnect2Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebRequestMethodsGetHeadersEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebRequestMethodsGetContentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebRequestMethodsSetContentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebRequestMethodsLoadFromStreamEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebRequestMethodsExecuteEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebRequestMethodsGet1Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebRequestMethodsGet2Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebRequestMethodsGet3Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebRequestMethodsPost1Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebRequestMethodsPost2Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebRequestMethodsPost3Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebRequestMethodsPut1Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebRequestMethodsPut2Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebRequestMethodsPut3Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebRequestMethodsDeleteEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebRequestMethodsHeadEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebResponseCleanUp(ExternalObject: TObject);
    procedure dwsUnitWebClientClassesTWebResponseMethodsGetHeadersEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebResponseMethodsGetContentTypeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebResponseMethodsGetContentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebResponseMethodsGetContentStreamEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebResponseMethodsGetStatusCodeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebResponseMethodsGetStatusDescriptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebResponseMethodsGetSuccessEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebResponseMethodsSaveToStreamEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebClientMethodsGetCredentialsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebRequestMethodsGetCredentialsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebCredentialsMethodsAddEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebCredentialsMethodsClearEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebCredentialsMethodsAssignEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebCredentialsMethodsRemove1Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebCredentialsMethodsRemove2Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebCredentialsMethodsFind1Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebCredentialsMethodsFind2Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebCredentialMethodsGetUsernameEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebCredentialMethodsSetUsernameEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebCredentialMethodsGetPasswordEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebCredentialMethodsSetPasswordEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebClientMethodsGetEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebClientMethodsPostEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebClientMethodsPutEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebClientMethodsDeleteEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebRequestMethodsGetContentTypeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebRequestMethodsSetContentTypeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriConstructorsCreate1Eval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriConstructorsCreate2Eval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriCleanUp(ExternalObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsGetProtocolEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsSetProtocolEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsGetHostEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsSetHostEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsGetPortEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsSetPortEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsGetPathEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsSetPathEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsGetDocumentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsSetDocumentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsGetBookmarkEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsSetBookMarkEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsGetParamsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsSetParamsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsGetUserNameEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsSetUserNameEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsGetPasswordEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsSetPasswordEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsGetURIEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsSetURIEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsGetIPVersionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsSetIPVersionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsGetPathAndParamsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsNormalizePathEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsExcludeTrailingDelimiterEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsIncludeTrailingDelimiterEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsURLEncodeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsURLDecodeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsIsURLEncodedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsIsHostIPv6Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsIsUrlIPv6Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTUriMethodsIPv6EncodeURLEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebResponseMethodsGetContentAsTextEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebResponseMethodsGetContentLengthEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebResponseMethodsGetCurrentContentSizeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebResponseMethodsGetCompletedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebResponseMethodsGetErrorMessageEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebResponseMethodsAbortEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebResponseMethodsWaitEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebResponseMethodsGetAbortedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitWebClientClassesTWebResponseMethodsGetFailedEval(Info: TProgramInfo; ExtObject: TObject);
  private
  protected
    // IScriptModule
    procedure Initialize(DelphiWebScript: TDelphiWebScript); override;
    procedure Finalize; override;
  public
  end;

implementation

{$R *.dfm}

uses
  Variants,
  idURI,
  IdGlobal,
  amURLUtils,
{$ifdef WEBCLIENT_SYNOPSE}
  amWebClient1,
{$else WEBCLIENT_SYNOPSE}
  amWebClient2,
{$endif WEBCLIENT_SYNOPSE}
  amWebClient;

// -----------------------------------------------------------------------------
//
// TDataModuleScriptNetWebClient
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptNetWebClient.DataModuleCreate(Sender: TObject);
begin
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.Initialize(DelphiWebScript: TDelphiWebScript);
begin
  inherited;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.Finalize;
begin
  inherited;
end;

// -----------------------------------------------------------------------------
//
// Http instance
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptNetWebClient.dwsUnitWebClientInstancesWebClientInstantiate(info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := WebClient;
end;

// -----------------------------------------------------------------------------
//
// TUri
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriCleanUp(ExternalObject: TObject);
begin
  ExternalObject.Free;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriConstructorsCreate1Eval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TidUri.Create;
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriConstructorsCreate2Eval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TidUri.Create(Info.ParamAsString[0]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsExcludeTrailingDelimiterEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := URLExcludeTrailingDelimiter(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsIncludeTrailingDelimiterEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := URLIncludeTrailingDelimiter(Info.ParamAsString[0]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsGetBookmarkEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TidUri(ExtObject).Bookmark;
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsSetBookMarkEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TidUri(ExtObject).Bookmark := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsGetDocumentEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TidUri(ExtObject).Document;
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsSetDocumentEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TidUri(ExtObject).Document := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsGetHostEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TidUri(ExtObject).Host;
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsSetHostEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TidUri(ExtObject).Host := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsGetIPVersionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TidUri(ExtObject).IPVersion);
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsSetIPVersionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TidUri(ExtObject).IPVersion := TidIPVersion(Info.ParamAsInteger[0]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsGetParamsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TidUri(ExtObject).Params;
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsSetParamsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TidUri(ExtObject).Params := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsGetPasswordEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TidUri(ExtObject).Password;
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsSetPasswordEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TidUri(ExtObject).Password := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsGetPathAndParamsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TidUri(ExtObject).GetPathAndParams;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsGetPathEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TidUri(ExtObject).Path;
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsSetPathEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TidUri(ExtObject).Path := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsGetPortEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TidUri(ExtObject).Port;
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsSetPortEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TidUri(ExtObject).Port := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsGetProtocolEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TidUri(ExtObject).Protocol;
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsSetProtocolEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TidUri(ExtObject).Protocol := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsGetURIEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TidUri(ExtObject).URI;
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsSetURIEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TidUri(ExtObject).URI := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsGetUserNameEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TidUri(ExtObject).Username;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsNormalizePathEval(Info: TProgramInfo; ExtObject: TObject);
var
  s: string;
begin
  s := Info.ParamAsString[0];
  TidUri.NormalizePath(s);
  Info.ResultAsString := s;
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsSetUserNameEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TidUri(ExtObject).Username := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsURLDecodeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := URLDecode(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsURLEncodeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := URLEncode(Info.ParamAsString[0], Info.ParamAsBoolean[1]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsIsURLEncodedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := IsURLEncoded(Info.ParamAsString[0]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsIsHostIPv6Eval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := IsHostIPv6(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsIsUrlIPv6Eval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := IsUrlIPv6(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTUriMethodsIPv6EncodeURLEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := IPv6EncodeURL(Info.ParamAsString[0], Info.ParamAsBoolean[1]);
end;


// -----------------------------------------------------------------------------
//
// TWebClient
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebClientMethodsConnect1Eval(Info: TProgramInfo; ExtObject: TObject);
var
  Request: IWebRequest;
begin
  Request := TCustomWebClient(ExtObject).Connect(Info.ParamAsString[0], Info.ParamAsBoolean[1], Info.ParamAsInteger[2]);
  Request._AddRef;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Request);
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebClientMethodsConnect2Eval(Info: TProgramInfo; ExtObject: TObject);
var
  Request: IWebRequest;
begin
  Request := TCustomWebClient(ExtObject).Connect(Info.ParamAsString[0]);
  Request._AddRef;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Request);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebClientMethodsGetCredentialsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TCustomWebClient(ExtObject).Credentials);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebClientMethodsGetEval(Info: TProgramInfo; ExtObject: TObject);
var
  Response: IWebResponse;
begin
  Response := TCustomWebClient(ExtObject).Get(Info.ParamAsString[0], Info.ParamAsString[1]);
  Response._AddRef;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Response);
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebClientMethodsPostEval(Info: TProgramInfo; ExtObject: TObject);
var
  Response: IWebResponse;
begin
  Response := TCustomWebClient(ExtObject).Post(Info.ParamAsString[0], Info.ParamAsString[1], Info.ParamAsString[2], Info.ParamAsString[3]);
  Response._AddRef;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Response);
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebClientMethodsPutEval(Info: TProgramInfo; ExtObject: TObject);
var
  Response: IWebResponse;
begin
  Response := TCustomWebClient(ExtObject).Put(Info.ParamAsString[0], Info.ParamAsString[1], Info.ParamAsString[2], Info.ParamAsString[3]);
  Response._AddRef;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Response);
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebClientMethodsDeleteEval(Info: TProgramInfo; ExtObject: TObject);
var
  Response: IWebResponse;
begin
  Response := TCustomWebClient(ExtObject).Delete(Info.ParamAsString[0], Info.ParamAsString[1]);
  Response._AddRef;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Response);
end;

// -----------------------------------------------------------------------------
//
// TWebCredential
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebCredentialMethodsGetUsernameEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TWebCredential(ExtObject).Username;
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebCredentialMethodsSetUsernameEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TWebCredential(ExtObject).Username := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebCredentialMethodsGetPasswordEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TWebCredential(ExtObject).Password;
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebCredentialMethodsSetPasswordEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TWebCredential(ExtObject).Password := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------
//
// TWebCredentials
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebCredentialsMethodsAddEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TWebCredentials(ExtObject).Add(Info.ParamAsString[0], TWebAuthentication(Info.ParamAsInteger[1]), Info.ParamAsString[2], Info.ParamAsString[3]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebCredentialsMethodsAssignEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TWebCredentials(ExtObject).Assign(Info.ParamAsObject[0] as TWebCredentials);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebCredentialsMethodsClearEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TWebCredentials(ExtObject).Clear;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebCredentialsMethodsFind1Eval(Info: TProgramInfo; ExtObject: TObject);
var
  Credential: TWebCredential;
begin
  Credential := TWebCredentials(ExtObject).Find(Info.ParamAsString[0], TWebAuthentication(Info.ParamAsInteger[1]));
  Info.ResultAsVariant := CreateResultScriptObject(Info, Credential);
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebCredentialsMethodsFind2Eval(Info: TProgramInfo; ExtObject: TObject);
var
  Credential: TWebCredential;
begin
  Credential := TWebCredentials(ExtObject).Find(Info.ParamAsString[0]);
  Info.ResultAsVariant := CreateResultScriptObject(Info, Credential);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebCredentialsMethodsRemove1Eval(Info: TProgramInfo; ExtObject: TObject);
begin
  TWebCredentials(ExtObject).Remove(Info.ParamAsString[0], Info.ParamAsBoolean[1]);
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebCredentialsMethodsRemove2Eval(Info: TProgramInfo; ExtObject: TObject);
begin
  TWebCredentials(ExtObject).Remove(Info.ParamAsString[0], TWebAuthentication(Info.ParamAsInteger[1]), Info.ParamAsBoolean[2]);
end;

// -----------------------------------------------------------------------------
//
// TWebRequest
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebRequestCleanUp(ExternalObject: TObject);
var
  Request: IWebRequest;
begin
  TObject(pointer(Request)) := ExternalObject;
  Request := nil;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebRequestMethodsGetContentEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := IWebRequest(pointer(ExtObject)).Content;
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebRequestMethodsSetContentEval(Info: TProgramInfo; ExtObject: TObject);
begin
  IWebRequest(pointer(ExtObject)).Content := Info.ParamAsDataString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebRequestMethodsGetContentTypeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := IWebRequest(pointer(ExtObject)).Headers.Values[sHttpHeaderContentType];
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebRequestMethodsSetContentTypeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  IWebRequest(pointer(ExtObject)).Headers.Values[sHttpHeaderContentType] := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebRequestMethodsGetCredentialsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, IWebRequest(pointer(ExtObject)).Credentials);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebRequestMethodsGetHeadersEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, IWebRequest(pointer(ExtObject)).Headers);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebRequestMethodsLoadFromStreamEval(Info: TProgramInfo; ExtObject: TObject);
begin
  IWebRequest(pointer(ExtObject)).LoadFromStream(Info.ParamAsObject[0] as TStream);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebRequestMethodsExecuteEval(Info: TProgramInfo; ExtObject: TObject);
var
  Response: IWebResponse;
begin
  Response := IWebRequest(pointer(ExtObject)).Execute(Info.ParamAsString[0], Info.ParamAsString[1]);
  Response._AddRef;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Response);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebRequestMethodsGet1Eval(Info: TProgramInfo; ExtObject: TObject);
var
  Response: IWebResponse;
begin
  Response := IWebRequest(pointer(ExtObject)).Get(Info.ParamAsString[0]);
  Response._AddRef;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Response);
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebRequestMethodsGet2Eval(Info: TProgramInfo; ExtObject: TObject);
var
  Response: IWebResponse;
begin
  Response := IWebRequest(pointer(ExtObject)).Get(Info.ParamAsString[0], Info.ParamAsDataString[1]);
  Response._AddRef;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Response);
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebRequestMethodsGet3Eval(Info: TProgramInfo; ExtObject: TObject);
var
  Response: IWebResponse;
begin
  Response := IWebRequest(pointer(ExtObject)).Get(Info.ParamAsString[0], TStream(Info.ParamAsObject[1]));
  Response._AddRef;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Response);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebRequestMethodsPost1Eval(Info: TProgramInfo; ExtObject: TObject);
var
  Response: IWebResponse;
begin
  Response := IWebRequest(pointer(ExtObject)).Post(Info.ParamAsString[0]);
  Response._AddRef;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Response);
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebRequestMethodsPost2Eval(Info: TProgramInfo; ExtObject: TObject);
var
  Response: IWebResponse;
begin
  Response := IWebRequest(pointer(ExtObject)).Post(Info.ParamAsString[0], Info.ParamAsDataString[1]);
  Response._AddRef;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Response);
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebRequestMethodsPost3Eval(Info: TProgramInfo; ExtObject: TObject);
var
  Response: IWebResponse;
begin
  Response := IWebRequest(pointer(ExtObject)).Post(Info.ParamAsString[0], TStream(Info.ParamAsObject[1]));
  Response._AddRef;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Response);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebRequestMethodsPut1Eval(Info: TProgramInfo; ExtObject: TObject);
var
  Response: IWebResponse;
begin
  Response := IWebRequest(pointer(ExtObject)).Put(Info.ParamAsString[0]);
  Response._AddRef;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Response);
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebRequestMethodsPut2Eval(Info: TProgramInfo; ExtObject: TObject);
var
  Response: IWebResponse;
begin
  Response := IWebRequest(pointer(ExtObject)).Put(Info.ParamAsString[0], Info.ParamAsDataString[1]);
  Response._AddRef;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Response);
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebRequestMethodsPut3Eval(Info: TProgramInfo; ExtObject: TObject);
var
  Response: IWebResponse;
begin
  Response := IWebRequest(pointer(ExtObject)).Put(Info.ParamAsString[0], TStream(Info.ParamAsObject[1]));
  Response._AddRef;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Response);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebRequestMethodsDeleteEval(Info: TProgramInfo; ExtObject: TObject);
var
  Response: IWebResponse;
begin
  Response := IWebRequest(pointer(ExtObject)).Delete(Info.ParamAsString[0]);
  Response._AddRef;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Response);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebRequestMethodsHeadEval(Info: TProgramInfo; ExtObject: TObject);
var
  Response: IWebResponse;
begin
  Response := IWebRequest(pointer(ExtObject)).Head(Info.ParamAsString[0]);
  Response._AddRef;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Response);
end;

// -----------------------------------------------------------------------------
//
// TWebResponse
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebResponseCleanUp(ExternalObject: TObject);
var
  Response: IWebResponse;
begin
  TObject(pointer(Response)) := ExternalObject;
  Response := nil;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebResponseMethodsGetHeadersEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, IWebResponse(pointer(ExtObject)).Headers);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebResponseMethodsGetContentTypeEval( Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := IWebResponse(pointer(ExtObject)).ContentType;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebResponseMethodsGetCurrentContentSizeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := IWebResponse(pointer(ExtObject)).CurrentContentSize;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebResponseMethodsGetErrorMessageEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := IWebResponse(pointer(ExtObject)).ErrorMessage;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebResponseMethodsGetFailedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := IWebResponse(pointer(ExtObject)).Failed;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebResponseMethodsAbortEval(Info: TProgramInfo; ExtObject: TObject);
begin
  IWebResponse(pointer(ExtObject)).Abort;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebResponseMethodsGetAbortedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := IWebResponse(pointer(ExtObject)).Aborted;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebResponseMethodsGetCompletedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := IWebResponse(pointer(ExtObject)).Completed;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebResponseMethodsGetContentAsTextEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := IWebResponse(pointer(ExtObject)).ContentAsText;
end;

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebResponseMethodsGetContentEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsDataString := IWebResponse(pointer(ExtObject)).Content;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebResponseMethodsGetContentLengthEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := IWebResponse(pointer(ExtObject)).ContentLength;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebResponseMethodsGetContentStreamEval( Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, IWebResponse(pointer(ExtObject)).ContentStream);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebResponseMethodsGetStatusCodeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := IWebResponse(pointer(ExtObject)).StatusCode;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebResponseMethodsGetStatusDescriptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := IWebResponse(pointer(ExtObject)).StatusDescription;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebResponseMethodsGetSuccessEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := IWebResponse(pointer(ExtObject)).Success;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebResponseMethodsWaitEval(Info: TProgramInfo; ExtObject: TObject);
begin
   IWebResponse(pointer(ExtObject)).Wait;
  Info.ResultAsVariant := Info.ScriptObj;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptNetWebClient.dwsUnitWebClientClassesTWebResponseMethodsSaveToStreamEval(Info: TProgramInfo; ExtObject: TObject);
begin
  IWebResponse(pointer(ExtObject)).SaveToStream(Info.ParamAsObject[0] as TStream);
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

initialization
  TDataModuleScriptNetWebClient.RegisterModule;
end.
