unit amScript.Package;

(*
 * Copyright © 2012 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Classes,
  Graphics,
  amScript.API,
  amScript.Package.API,
  amScript.Provider.API,
  amScript.LicenseService.API;

// -----------------------------------------------------------------------------
//
// TScriptPackage
//
// -----------------------------------------------------------------------------
// Implements IScriptPackage.
// -----------------------------------------------------------------------------
type
  TScriptPackage = class(TInterfacedObject, IScriptPackage, IScriptPackageInternal, IScriptExecutionNotification, IScriptLicensedContent)
  private
    FPluginID: string;
    FPluginName: string;
    FPluginURI: string;
    FDescription: string;
    FVersion: string;
    FAuthor: string;
    FAuthorURI: string;
    FRequires: string;
    FAuthorID: string;
    FProductID: string;
    FFilename: string;
    FImage: TPicture;
    FEnabled: boolean;
    FRunOnce: boolean;
    FCanUninstall: boolean;
    FNeedInstall: boolean;
    FAutoUninstall: boolean;
    FPackageKind: TScriptPackageKind;
    FLastExecutionResult: TScriptExecutionReason;
  protected
    // IScriptPackage
    function GetPluginID: string;
    function GetPluginName: string;
    function GetPluginURI: string;
    function GetDescription: string;
    function GetVersion: string;
    function GetAuthor: string;
    function GetAuthorURI: string;
    function GetRequires: string;
    function GetAuthorID: string;
    function GetProductID: string;
    function GetImage: TPicture;
    function GetFilename: string;
    function GetEnabled: boolean;
    procedure SetEnabled(Value: boolean);
    function GetRunOnce: boolean;
    procedure SetRunOnce(Value: boolean);
    function GetCanUninstall: boolean;
    procedure SetCanUninstall(Value: boolean);
    function GetNeedInstall: boolean;
    procedure SetNeedInstall(Value: boolean);
    property NeedInstall: boolean read GetNeedInstall write SetNeedInstall;
    function GetAutoUninstall: boolean;
    procedure SetAutoUninstall(Value: boolean);
    property AutoUninstall: boolean read GetAutoUninstall write SetAutoUninstall;
    function GetPackageKind: TScriptPackageKind;
    property PackageKind: TScriptPackageKind read GetPackageKind;
    function GetLastExecutionResult: TScriptExecutionReason;
    procedure SetLastExecutionResult(const Value: TScriptExecutionReason);
    property LastExecutionResult: TScriptExecutionReason read GetLastExecutionResult write SetLastExecutionResult;
    function CreateScriptProvider: IScriptProvider;

    // IScriptExecutionNotification
    procedure ExecutionStarted(const Execution: IScriptExecution);
    procedure ExecutionEnded(const Execution: IScriptExecution);

    // IScriptLicensedContent
    function IScriptLicensedContentGetProductID: string;
    function IScriptLicensedContent.GetProductID = IScriptLicensedContentGetProductID;
    function PopulateLicenseInfo(const ContentLicenseInfo: IScriptContentLicenseInfo): boolean;
    function CreateContentLicense(const ContentLicenseInfo: IScriptContentLicenseInfo): IScriptContentLicense;
    procedure UnloadUnlicensedContent;

    function DoLoadFromStream(AStream: TStream): boolean;
{$ifdef FEATURE_SCRIPT_BUNDLE}
    function DoLoadFromManifest(AStream: TStream): boolean;
{$endif FEATURE_SCRIPT_BUNDLE}
  public
    constructor Create(const AFilename: string); overload;
    constructor Create(const AFilename: string; APackageKind: TScriptPackageKind); overload;
    destructor Destroy; override;

    // IScriptPackageInternal
    function LoadFromFile: boolean;
    function LoadFromStream(AStream: TStream): boolean;

    property PluginID: string read GetPluginID;
    property PluginName: string read GetPluginName;
    property PluginURI: string read GetPluginURI;
    property Description: string read GetDescription;
    property Version: string read GetVersion;
    property Author: string read GetAuthor;
    property AuthorURI: string read GetAuthorURI;
    property Requires: string read GetRequires;
    property AuthorID: string read GetAuthorID;
    property ProductID: string read GetProductID;
    property Image: TPicture read GetImage;

    property Filename: string read GetFilename;
    property Enabled: boolean read GetEnabled write SetEnabled;
    property RunOnce: boolean read GetRunOnce write SetRunOnce;
    property CanUninstall: boolean read GetCanUninstall write SetCanUninstall;
  end;

implementation

uses
  RegularExpressions,
  IOUtils,
  StrUtils,
  SysUtils,
  Zip,
  PngImage,
  amScript.Provider;


// -----------------------------------------------------------------------------

constructor TScriptPackage.Create(const AFilename: string);
var
  PackageKind: TScriptPackageKind;
begin
{$ifdef FEATURE_SCRIPT_BUNDLE}
  if (AnsiSameText(ExtractFileExt(AFilename), sScriptBundleFileType)) then
    PackageKind := pkBundle
  else
{$endif FEATURE_SCRIPT_BUNDLE}
    PackageKind := pkScript;

  Create(AFilename, PackageKind);
end;

constructor TScriptPackage.Create(const AFilename: string; APackageKind: TScriptPackageKind);
begin
  inherited Create;
  FCanUninstall := True;
  FFilename := AFilename;
  FPackageKind := APackageKind;
end;

destructor TScriptPackage.Destroy;
begin
  FImage.Free;
  inherited;
end;

// -----------------------------------------------------------------------------

function TScriptPackage.GetAuthor: string;
begin
  Result := FAuthor;
end;

// -----------------------------------------------------------------------------

function TScriptPackage.GetAuthorID: string;
begin
  Result := FAuthorID;
end;

// -----------------------------------------------------------------------------

function TScriptPackage.GetAuthorURI: string;
begin
  Result := FAuthorURI;
end;

// -----------------------------------------------------------------------------

function TScriptPackage.GetAutoUninstall: boolean;
begin
  Result := FAutoUninstall;
end;

// -----------------------------------------------------------------------------

function TScriptPackage.GetCanUninstall: boolean;
begin
  Result := FCanUninstall;
end;

// -----------------------------------------------------------------------------

function TScriptPackage.GetDescription: string;
begin
  Result := FDescription;
end;

// -----------------------------------------------------------------------------

function TScriptPackage.GetEnabled: boolean;
begin
  Result := FEnabled;
end;

// -----------------------------------------------------------------------------

function TScriptPackage.GetFilename: string;
begin
  Result := FFilename;
end;

// -----------------------------------------------------------------------------

function TScriptPackage.GetImage: TPicture;
begin
  Result := FImage;
end;

// -----------------------------------------------------------------------------

function TScriptPackage.GetLastExecutionResult: TScriptExecutionReason;
begin
  Result := FLastExecutionResult;
end;

// -----------------------------------------------------------------------------

function TScriptPackage.GetNeedInstall: boolean;
begin
  Result := FNeedInstall;
end;

// -----------------------------------------------------------------------------

function TScriptPackage.GetPackageKind: TScriptPackageKind;
begin
  Result := FPackageKind;
end;

// -----------------------------------------------------------------------------

function TScriptPackage.GetPluginID: string;
begin
  Result := FPluginID;
end;

// -----------------------------------------------------------------------------

function TScriptPackage.GetPluginName: string;
begin
  Result := FPluginName;
end;

// -----------------------------------------------------------------------------

function TScriptPackage.GetPluginURI: string;
begin
  Result := FPluginURI;
end;

// -----------------------------------------------------------------------------

function TScriptPackage.GetProductID: string;
begin
  Result := FProductID;
end;

// -----------------------------------------------------------------------------

function TScriptPackage.GetRequires: string;
begin
  Result := FRequires;
end;

// -----------------------------------------------------------------------------

function TScriptPackage.GetRunOnce: boolean;
begin
  Result := FRunOnce;
end;

// -----------------------------------------------------------------------------

function TScriptPackage.GetVersion: string;
begin
  Result := FVersion;
end;

// -----------------------------------------------------------------------------

{$ifdef FEATURE_SCRIPT_BUNDLE}
function TScriptPackage.DoLoadFromManifest(AStream: TStream): boolean;

  procedure Error(const Msg, Cause: string);
  begin
    ShowErrorMessage('Add-in bundle', Msg, Cause);
    Abort;
  end;

var
  XMLStream: IStream;
  XMLDoc: IXMLDomDocument;
  RootNode: IXMLDOMNode;
begin
  Result := False;

  XMLDoc := MSXMLTool.CreateDOM;

  // Optimize for speed
  XMLDoc.preserveWhiteSpace := True;
  XMLDoc.validateOnParse := False;
  XMLDoc.resolveExternals := False;

  XMLStream := TFixedStreamAdapter.Create(AStream, soReference);
  try
    XMLDoc.Load(XMLStream);
  finally
    XMLStream := nil;
  end;

  if (XMLDoc.parseError.errorCode <> 0) then
  begin
    if (XMLDoc.parseError.errorCode <> E_ABORT) then
      Error('Error loading bundle', Format('Line: %d'#13'%s', [XMLDoc.parseError.line, XMLDoc.parseError.reason]));
    exit;
  end;

  RootNode := XMLDoc.documentElement;
  if (RootNode = nil) or (RootNode.nodeName <> sScriptBundleManifestTag) then
    Error('Invalid bundle format', 'root element not found');

  if (StrToIntDef(TXmlUtilities.GetAttribute(RootNode, 'version'), 0) > cScriptBundleManifestVersion) then
    Error('Invalid bundle format', 'Unsupported bundle manifest version');

  FPluginID := TXmlUtilities.GetXmlNodeText(RootNode, 'id', IOUtils.TPath.GetFileNameWithoutExtension(Filename));
  FPluginName := TXmlUtilities.GetXmlNodeText(RootNode, 'name', '');
  FVersion := TXmlUtilities.GetXmlNodeText(RootNode, 'version', '');
  FDescription := TXmlUtilities.GetXmlNodeText(RootNode, 'description', '');
  FPluginURI := TXmlUtilities.GetXmlNodeText(RootNode, 'URL', '');

  FAuthorID := TXmlUtilities.GetXmlNodeText(RootNode, 'authorID', '');
  FAuthor := TXmlUtilities.GetXmlNodeText(RootNode, 'authorName', '');
  FAuthorURI := TXmlUtilities.GetXmlNodeText(RootNode, 'authorURL', '');

  FProductID := TXmlUtilities.GetXmlNodeText(RootNode, 'productID', '');

  FreeAndNil(FImage);

  Result := True;
end;
{$endif FEATURE_SCRIPT_BUNDLE}

function TScriptPackage.DoLoadFromStream(AStream: TStream): boolean;

  function Extract(const Buffer: string; const Name: string; MultiLine: boolean = False): string;
  var
    Pattern: string;
    Match: TMatch;
  begin
    if (MultiLine) then
    begin
      Pattern := '^'+Name+'[ \t]*+:[ \t]*+(.+(\n(?=[ \t]++).+$)*)';
      Match := TRegEx.Match(Buffer, Pattern, [roIgnoreCase, roMultiLine]);
    end else
    begin
      Pattern := '^'+Name+'[ \t]*+:[ \t]*+(.+)$';
      Match := TRegEx.Match(Buffer, Pattern, [roIgnoreCase, roMultiLine]);
    end;
    if (Match.Success) then
      Result := Match.Groups[1].Value
    else
      Result := '';
  end;

  function FindLogo(const Path: string; const Name: string): string;
  begin
    Result := Path + Name + '.png';
    if (not IOUtils.TFile.Exists(Result)) then
    begin
      Result := Path + Name + '.bmp';
      if (not IOUtils.TFile.Exists(Result)) then
      begin
        Result := Path + Name + '.jpg';
        if (not IOUtils.TFile.Exists(Result)) then
          Result := '';
      end;
    end;
  end;

var
  StreamReader: TStreamReader;
  Buffer: string;
  ImageFilename: string;
  Path: string;
  RegEx: TRegEx;
begin
  Result := False;

  StreamReader := TStreamReader.Create(AStream);
  try
    Buffer := '';
    while (Length(Buffer) < 8192) and (not StreamReader.EndOfStream) do
      Buffer := Buffer + StreamReader.ReadLine + #13;
  finally
    StreamReader.Free;
  end;
  if (Buffer = '') then
    exit;

  FPluginID := Extract(Buffer, 'Plugin ID');
  FPluginName := Extract(Buffer, 'Plugin Name');
  if (FPluginName = '') then
  begin
    FPluginName := IOUtils.TPath.GetFileNameWithoutExtension(Filename);
    // Remove ! from start of name
    while (StartsStr('!', FPluginName)) do
      Delete(FPluginName, 1, 1);
  end;

  if (FPluginID = '') then
    FPluginID := FPluginName;
  if (FPluginID = '') then
    exit;

  FPluginURI := Extract(Buffer, 'Plugin URI');
  FDescription := Extract(Buffer, 'Description', True);
  FVersion := Extract(Buffer, 'Version');
  FAuthor := Extract(Buffer, 'Author');
  FAuthorURI := Extract(Buffer, 'Author URI');
  FRequires := Extract(Buffer, 'Requires');
  FProductID := Extract(Buffer, 'Product ID');
  FAuthorID := Extract(Buffer, 'Author ID');


  FPluginURI := StringReplace(FPluginURI, '\\', '//', [rfReplaceAll]);
  FAuthorURI := StringReplace(FAuthorURI, '\\', '//', [rfReplaceAll]);
  RegEx := TRegEx.Create('^https?:\/\/.*$', [roIgnoreCase]);
  if (FPluginURI <> '') and (not RegEx.IsMatch(FPluginURI)) then
    FPluginURI := 'http://'+FPluginURI;
  if (FAuthorURI <> '') and (not RegEx.IsMatch(FAuthorURI)) then
    FAuthorURI := 'http://'+FAuthorURI;

  FreeAndNil(FImage);
  if (PackageKind = pkScript) and (Filename <> '') then
  begin
    Path := IncludeTrailingPathDelimiter(IOUtils.TPath.GetDirectoryName(Filename));
    ImageFilename := FindLogo(Path, IOUtils.TPath.GetFileNameWithoutExtension(Filename));
    if (ImageFilename = '') then
      ImageFilename := FindLogo(Path, 'logo');
    if (ImageFilename <> '') then
      try
        FImage := TPicture.Create;
        FImage.LoadFromFile(ImageFilename);
      except
        // Too bad, so sad :-(
        FreeAndNil(FImage);
      end;
  end;

  Result := True;
end;

procedure TScriptPackage.ExecutionEnded(const Execution: IScriptExecution);
begin
  if (not AutoUninstall) then
    exit;

  ScriptTrace('Auto-uninstalling script package: '+PluginID);
  ScriptService.Packages.Remove(Self);
end;

procedure TScriptPackage.ExecutionStarted(const Execution: IScriptExecution);
begin
  // Probably never called. Not implemented.
end;

function TScriptPackage.LoadFromFile: boolean;
var
  Stream: TStream;
begin
  Result := False;
  if (not FileExists(FFilename)) then
    exit;

  Stream := TFileStream.Create(FFileName, fmOpenRead or fmShareDenyWrite);
  try
    Result := LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

function TScriptPackage.LoadFromStream(AStream: TStream): boolean;
var
  ZipFile: TZipFile;
  i: integer;
  s: string;
  Stream: TStream;
  LocalHeader: TZipHeader;
  PNG: TPngImage;
begin
  Result := False;
  if (PackageKind = pkBundle) then
  begin
    ZipFile := TZipFile.Create;
    try
      ZipFile.Open(AStream, zmRead);

      // First try loading from bundle manifest
{$ifdef FEATURE_SCRIPT_BUNDLE}
      i := ZipFile.IndexOf(sScriptBundleManifestFilename);
      if (i <> -1) then
      begin
        ZipFile.Read(i, Stream, LocalHeader);
        try
          Result := DoLoadFromManifest(Stream);
        finally
          Stream.Free;
        end;
      end else
{$endif FEATURE_SCRIPT_BUNDLE}
      // If manifest isn't found, try loading from package file (a script file with a name that identifies it as the primary)
      begin
        for i := 0 to ZipFile.FileCount-1 do
        begin
          s := ZipFile.FileName[i];
          if (Copy(ExtractFileName(s), 1, 1) = sScriptPackageFilenamePrefix) and (AnsiSameText(ExtractFileExt(s), sScriptFileType)) then
          begin
            ZipFile.Read(i, Stream, LocalHeader);
            try
              Result := DoLoadFromStream(Stream);
            finally
              Stream.Free;
            end;
            break;
          end;
        end;
      end;

      if (Result) then
      begin
        i := ZipFile.IndexOf('logo.png');
        if (i <> -1) then
        begin
          FreeAndNil(FImage);
          try
            PNG := TPngImage.Create;
            try
              ZipFile.Read(i, Stream, LocalHeader);
              try
                PNG.LoadFromStream(Stream);
              finally
                Stream.Free;
              end;
              FImage := TPicture.Create;
              FImage.Assign(PNG);
            finally
              PNG.Free;
            end;
          except
            // Too bad, so sad :-(
            FreeAndNil(FImage);
          end;
        end;
      end;
    finally
      ZipFile.Free;
    end;
  end else
    Result := DoLoadFromStream(AStream);
end;

// -----------------------------------------------------------------------------

function TScriptPackage.IScriptLicensedContentGetProductID: string;
begin
{$ifdef FEATURE_COPY_PROTECT}
  Result := FProductID;
{$endif FEATURE_COPY_PROTECT}
end;

function TScriptPackage.PopulateLicenseInfo(const ContentLicenseInfo: IScriptContentLicenseInfo): boolean;
{$ifdef FEATURE_COPY_PROTECT}
const
  cDefaultScriptRightsMask: TScriptProductItemRightsMask = (
    // False: User does not have license to content
    [],
    // True: User has license to content
    [spirExecute]
    );
{$endif FEATURE_COPY_PROTECT}
begin
{$ifdef FEATURE_COPY_PROTECT}
  if (FProductID <> '') and (FAuthorID <> '') then
    ContentLicenseInfo.LicenseType := amWeb
  else
    ContentLicenseInfo.LicenseType := amNone;
  ContentLicenseInfo.AuthorID := FAuthorID;
  ContentLicenseInfo.AuthorName := FAuthor;
  ContentLicenseInfo.AuthorURL := FAuthorURI;
  ContentLicenseInfo.ProductName := FPluginName;
  ContentLicenseInfo.ProductVersion := FVersion;
  ContentLicenseInfo.ProductURL := FPluginURI;
  ContentLicenseInfo.LicenseInfo := '';
  ContentLicenseInfo.RightsMask := cDefaultScriptRightsMask;
  ContentLicenseInfo.FixURLs;
  Result := True;
{$else FEATURE_COPY_PROTECT}
  Result := False;
{$endif FEATURE_COPY_PROTECT}
end;

function TScriptPackage.CreateContentLicense(const ContentLicenseInfo: IScriptContentLicenseInfo): IScriptContentLicense;
begin
  Result := nil;
end;

procedure TScriptPackage.UnloadUnlicensedContent;
begin
end;

// -----------------------------------------------------------------------------

function TScriptPackage.CreateScriptProvider: IScriptProvider;
var
  ZipStream: TStream;
  ZipFile: TZipFile;
  i: integer;
  s: string;
  Stream: TStream;
{$ifdef FEATURE_SCRIPT_BUNDLE}
  ProtectedStream, TempStream: TStream;
{$endif FEATURE_SCRIPT_BUNDLE}
  LocalHeader: TZipHeader;
  UseFirstScriptFile: boolean;
begin
  if (PackageKind = pkBundle) then
  begin
    Result := nil;
    ZipFile := TZipFile.Create;
    try
      // Must use TZipFile.Open(TFileStream) to prevent file from being locked
      ZipStream := TFileStream.Create(FFilename, fmOpenRead or fmShareDenyWrite);
      try
        ZipFile.Open(ZipStream, zmRead);

        // First try to find a "main" script file. If that fails fall back to "any" script file.
        UseFirstScriptFile := False;
        while (Result = nil) do
        begin
          for i := 0 to ZipFile.FileCount-1 do
          begin
            s := ExtractFileName(ZipFile.FileName[i]);
            if (s <> '') and ((UseFirstScriptFile) or (s[1] = sScriptPackageFilenamePrefix)) and (AnsiSameText(ExtractFileExt(s), sScriptFileType)) then
            begin
{$ifdef FEATURE_SCRIPT_BUNDLE}
              if (AnsiSameText(Copy(ZipFile.FileComment[i], 1, ZipFile.FileInfo[i].FileCommentLength) , 'protected')) then
              begin
                // Decrypt stream if it's marked as encrypted
                Stream := TMemoryStream.Create;
                try
                  TempStream := TMemoryStream.Create;
                  try
                    ZipFile.Read(i, ProtectedStream, LocalHeader);
                    try
                      TMemoryStream(TempStream).CopyFrom(ProtectedStream, LocalHeader.UncompressedSize);
                      TempStream.Position := 0;

                    finally
                      ProtectedStream.Free;
                    end;

                    ScriptDecryptStream(TempStream, Stream);
                  finally
                    TempStream.Free;
                  end;
                  Stream.Position := 0;

                except
                  Stream.Free;
                  raise;
                end;
              end else
{$endif FEATURE_SCRIPT_BUNDLE}
                ZipFile.Read(i, Stream, LocalHeader);

              try

                Result := TBundleScriptProvider.Create(FFileName, s, True, Stream);

              finally
                Stream.Free;
              end;

              break;
            end;
          end;

          if (UseFirstScriptFile) then
            break;
          // Retry - Use any script file
          UseFirstScriptFile := True;
        end;
      finally
        ZipStream.Free;
      end;
    finally
      ZipFile.Free;
    end;
    if (Result = nil) then
      raise Exception.CreateFmt('No script files found in script bundle: %s', [FFileName]);
  end else
    Result := TFileScriptProvider.Create(FFilename);
end;

// -----------------------------------------------------------------------------

procedure TScriptPackage.SetAutoUninstall(Value: boolean);
begin
  FAutoUninstall := Value;
end;

// -----------------------------------------------------------------------------

procedure TScriptPackage.SetCanUninstall(Value: boolean);
begin
  FCanUninstall := Value;
end;

// -----------------------------------------------------------------------------

procedure TScriptPackage.SetEnabled(Value: boolean);
begin
  FEnabled := Value;
  if (FEnabled) then
    FAutoUninstall := False;
end;

// -----------------------------------------------------------------------------

procedure TScriptPackage.SetLastExecutionResult(const Value: TScriptExecutionReason);
begin
  FLastExecutionResult := Value;
end;

// -----------------------------------------------------------------------------

procedure TScriptPackage.SetNeedInstall(Value: boolean);
begin
  FNeedInstall := Value;
end;

// -----------------------------------------------------------------------------

procedure TScriptPackage.SetRunOnce(Value: boolean);
begin
  FRunOnce := Value;
end;

end.
