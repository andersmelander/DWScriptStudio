unit amScript.Provider;

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
  dwsFileSystem,
  amScript.Provider.API;

// -----------------------------------------------------------------------------
//
// TSimpleScriptProvider.
//
// -----------------------------------------------------------------------------
// Wraps a script contained in a string.
// -----------------------------------------------------------------------------
type
  TSimpleScriptProvider = class(TInterfacedObject, IScriptProvider)
  private
    FName, FScript, FRoot: string;
  protected
    procedure SetScript(const Script: string); virtual;
    function GetScript: string; virtual;
    function GetScriptName: string;
    function GetFolder: string; virtual;
    function GetReadOnly: boolean; virtual;
    function GetProtected: boolean; virtual;
    function CreateFileSystem: IdwsFileSystem; virtual;
  public
    constructor Create(const AName, AScript: string; const ARoot: string = ''); overload;
    constructor Create(const AName: string; AStream: TStream; const ARoot: string = ''); overload;
  end;

// -----------------------------------------------------------------------------
//
// TStaticScriptProvider
//
// -----------------------------------------------------------------------------
// Wraps a read-only script contained in a string.
// -----------------------------------------------------------------------------
type
  TStaticScriptProvider = class(TSimpleScriptProvider)
  protected
    procedure SetScript(const Script: string); override;
    function GetReadOnly: boolean; override;
  public
  end;

// -----------------------------------------------------------------------------
//
// TBundleScriptProvider
//
// -----------------------------------------------------------------------------
// Wraps a script contained in a bundle (a zip file).
// -----------------------------------------------------------------------------
type
  TBundleScriptProvider = class(TStaticScriptProvider)
  private
    FBundleFilename: string;
    FAllowProtected: boolean;
  protected
    function CreateFileSystem: IdwsFileSystem; override;
    function GetProtected: boolean; override;
    function GetFolder: string; override;
  public
    constructor Create(const ABundleFilename, AName: string; AAllowProtected: boolean; AStream: TStream);
  end;

// -----------------------------------------------------------------------------
//
// TFileScriptProvider
//
// -----------------------------------------------------------------------------
// Wraps a script contained in a file.
// -----------------------------------------------------------------------------
type
  TFileScriptProvider = class(TInterfacedObject, IScriptProvider)
  private
    FFilename: string;
  protected
    // IScriptProvider
    procedure SetScript(const Script: string);
    function GetScript: string;
    function GetScriptName: string;
    function GetFolder: string;
    function GetReadOnly: boolean;
    function GetProtected: boolean;
    function CreateFileSystem: IdwsFileSystem;
  public
    constructor Create(const AFilename: string);
  end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

implementation

uses
  SysUtils,
  IOUtils,
  Dialogs,
  Forms, Windows, Controls, // not necessary but included for inline expansion

  amDialogs,
  amEncoding,

  amScript.Module,
  amScript.FileSystem.API,
  amScript.FileSystem;

// -----------------------------------------------------------------------------
//
// TSimpleScriptProvider
//
// -----------------------------------------------------------------------------
constructor TSimpleScriptProvider.Create(const AName, AScript: string; const ARoot: string);
begin
  inherited Create;
  FName := AName;
  FScript := AScript;
  FRoot := ARoot;
end;

constructor TSimpleScriptProvider.Create(const AName: string; AStream: TStream; const ARoot: string);
//var
//  StreamReader: TStreamReader;
begin
  inherited Create;
  FName := AName;
  FRoot := ARoot;

  FScript := DecodeTextStream(AStream);
(*
  StreamReader := TStreamReader.Create(AStream);
  try
    FScript := StreamReader.ReadToEnd;
  finally
    StreamReader.Free;
  end;
*)
end;

function TSimpleScriptProvider.CreateFileSystem: IdwsFileSystem;
begin
  Result := nil;
end;

function TSimpleScriptProvider.GetFolder: string;
begin
  Result := FRoot;
end;

function TSimpleScriptProvider.GetProtected: boolean;
begin
  Result := False;
end;

function TSimpleScriptProvider.GetReadOnly: boolean;
begin
  Result := False;
end;

function TSimpleScriptProvider.GetScript: string;
begin
  Result := FScript;
end;

function TSimpleScriptProvider.GetScriptName: string;
begin
  Result := FName;
end;

procedure TSimpleScriptProvider.SetScript(const Script: string);
begin
  FScript := Script;
end;

// -----------------------------------------------------------------------------
//
// TStaticScriptProvider
//
// -----------------------------------------------------------------------------
function TStaticScriptProvider.GetReadOnly: boolean;
begin
  Result := True;
end;

procedure TStaticScriptProvider.SetScript(const Script: string);
begin
end;

// -----------------------------------------------------------------------------
//
// TBundleScriptProvider
//
// -----------------------------------------------------------------------------
constructor TBundleScriptProvider.Create(const ABundleFilename, AName: string; AAllowProtected: boolean; AStream: TStream);
begin
  inherited Create(AName, AStream);
  FBundleFilename := ABundleFilename;
  FAllowProtected := AAllowProtected;
end;

function TBundleScriptProvider.CreateFileSystem: IdwsFileSystem;
var
  FileSystem: IScriptFileSystem;
begin
  Result := TScriptDelegatingFileSystem.Create(GetFolder, nil, FAllowProtected);

  FileSystem := TScriptBundleFileSystem.Create(FBundleFilename, FAllowProtected);
  (Result as IScriptDelegatingFileSystem).MountFileSystem(FileSystem);
end;

function TBundleScriptProvider.GetFolder: string;
begin
  if (FBundleFilename <> '') then
    Result := TPath.GetDirectoryName(FBundleFilename)
  else
    Result := '';
end;

function TBundleScriptProvider.GetProtected: boolean;
begin
  Result := True;
end;

// -----------------------------------------------------------------------------
//
// TFileScriptProvider
//
// -----------------------------------------------------------------------------
constructor TFileScriptProvider.Create(const AFilename: string);
begin
  inherited Create;
  FFilename := AFilename;
end;

function TFileScriptProvider.CreateFileSystem: IdwsFileSystem;
begin
  Result := TScriptRestrictedFileSystem.Create(GetFolder);
end;

function TFileScriptProvider.GetFolder: string;
begin
  Result := TPath.GetDirectoryName(FFilename);
end;

function TFileScriptProvider.GetProtected: boolean;
begin
  Result := False;
end;

function TFileScriptProvider.GetReadOnly: boolean;
begin
  Result := (IOUtils.TFileAttribute.faReadOnly in IOUtils.TFile.GetAttributes(FFilename));
end;

function TFileScriptProvider.GetScript: string;
var
//  StreamReader: TStreamReader;
  Stream: TStream;
begin
  Stream := TFileStream.Create(FFilename, fmOpenRead);
//  StreamReader := TStreamReader.Create(FFilename);
  try
//    Result := StreamReader.ReadToEnd;
    Result := DecodeTextStream(Stream);
  finally
    Stream.Free;
//    StreamReader.Free;
  end;
end;

function TFileScriptProvider.GetScriptName: string;
begin
  Result := TPath.GetFileNameWithoutExtension(FFilename);
end;

procedure TFileScriptProvider.SetScript(const Script: string);
var
  StreamWriter: TStreamWriter;
begin
  StreamWriter := TStreamWriter.Create(FFilename);
  try
    StreamWriter.Write(Script);
  finally
    StreamWriter.Free;
  end;
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

end.


