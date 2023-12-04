unit amScript.Package.API;

(*
 * Copyright © 2012 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Generics.Collections,
  Graphics,
  Classes,
  amScript.Provider.API;


const
  sScriptPackageFilenamePrefix = '!';

// -----------------------------------------------------------------------------
//
// IScriptPackage
//
// -----------------------------------------------------------------------------
// A collection of script files executed as a single whole (i.e. a script Document).
// -----------------------------------------------------------------------------
type
  TScriptPackageKind = (pkScript, pkBundle);
  TScriptExecutionReason = (irSuccess, irUnknown, irCompile, irLicense, irDisable);

  IScriptPackage = interface
    function GetPluginID: string;
    property PluginID: string read GetPluginID;

    function GetPluginName: string;
    property PluginName: string read GetPluginName;

    function GetPluginURI: string;
    property PluginURI: string read GetPluginURI;

    function GetDescription: string;
    property Description: string read GetDescription;

    function GetVersion: string;
    property Version: string read GetVersion;

    function GetAuthor: string;
    property Author: string read GetAuthor;

    function GetAuthorURI: string;
    property AuthorURI: string read GetAuthorURI;

    function GetRequires: string;
    property Requires: string read GetRequires;

    function GetImage: TPicture;
    property Image: TPicture read GetImage;

    function GetFilename: string;
    property Filename: string read GetFilename;

    function GetEnabled: boolean;
    procedure SetEnabled(Value: boolean);
    property Enabled: boolean read GetEnabled write SetEnabled;

    function GetRunOnce: boolean;
    procedure SetRunOnce(Value: boolean);
    property RunOnce: boolean read GetRunOnce write SetRunOnce;

    function GetCanUninstall: boolean;
    procedure SetCanUninstall(Value: boolean);
    // Specifies if package can be uninstalled.
    // Packages loaded from the standard script folders can not be uninstalled.
    property CanUninstall: boolean read GetCanUninstall write SetCanUninstall;

    function GetNeedInstall: boolean;
    procedure SetNeedInstall(Value: boolean);
    // Specifies if package needs to be installed (True the first time a package is loaded).
    // Presently unused.
    property NeedInstall: boolean read GetNeedInstall write SetNeedInstall;

    function GetAutoUninstall: boolean;
    procedure SetAutoUninstall(Value: boolean);
    // Specifies if package will be uninstalled automatically once script terminates.
    // Used for packages that are being executed but has not been installed. E.g. a package executed via drag drop.
    property AutoUninstall: boolean read GetAutoUninstall write SetAutoUninstall;

    function GetPackageKind: TScriptPackageKind;
    property PackageKind: TScriptPackageKind read GetPackageKind;

    function GetLastExecutionResult: TScriptExecutionReason;
    procedure SetLastExecutionResult(const Value: TScriptExecutionReason);
    property LastExecutionResult: TScriptExecutionReason read GetLastExecutionResult write SetLastExecutionResult;

    // License stuff
    function GetAuthorID: string;
    property AuthorID: string read GetAuthorID;
    function GetProductID: string;
    property ProductID: string read GetProductID;

    function CreateScriptProvider: IScriptProvider;
  end;

  IScriptPackageInternal = interface(IScriptPackage)
    ['{BAEF5960-E6C2-4B19-80E8-541D5C97BC3C}']
    function LoadFromFile: boolean;
    function LoadFromStream(AStream: TStream): boolean;
  end;

  IScriptPackageList = interface
    function GetItem(Index: integer): IScriptPackage;
    property Items[Index: integer]: IScriptPackage read GetItem; default;

    function GetCount: integer;
    property Count: integer read GetCount;

    function GetEnumerator: TEnumerator<IScriptPackage>;

    function Add(const Filename: string): IScriptPackage;
    procedure Remove(const Package: IScriptPackage);
    function FindByID(const PluginID: string): IScriptPackage;
    function FindByFilename(const Filename: string): IScriptPackage;
  end;

implementation

end.
