unit amScript.LicenseService.API;

(*
 * Copyright © 2012 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

// -----------------------------------------------------------------------------
//
//              Dummy unit - Licensing not released
//
// -----------------------------------------------------------------------------

uses
  Windows;

// -----------------------------------------------------------------------------
//
//              IScriptContentLicenseInfo
//
// -----------------------------------------------------------------------------
// Contains information about a content license.
// Primarily used when acquiring a license.
// -----------------------------------------------------------------------------
type
  IScriptContentLicenseInfo = interface
    ['{3CDF2D33-3CEE-411E-8E2B-8DC460AEE54E}']
  end;

// -----------------------------------------------------------------------------
//
//              IScriptContentLicense
//
// -----------------------------------------------------------------------------
// Represents an active content license.
// -----------------------------------------------------------------------------
type
  IScriptLicensedContent = interface;

  TScriptContentLicenseState = (
    clsNone,            // License has not been checked.
    clsUnlicensed,      // Content does not use/require a license.
    clsFailed,          // License acquisition failed.
    clsAcquired,        // License has been acquired.
    clsEvaluation);     // Trial license has been acquired.

  IScriptContentLicense = interface
    ['{0E7ABF6E-6CB9-45E6-A78F-D4BB21276614}']
    // LicenseRequired: Indicates if the content requires a license.
    function GetLicenseRequired: boolean;
    property LicenseRequired: boolean read GetLicenseRequired;

    // LicenseAcquired: Indicates if the content has a valid license.
    function GetLicenseAcquired: boolean;
    property LicenseAcquired: boolean read GetLicenseAcquired;

    function AcquireContentLicense(const AContent: IScriptLicensedContent): boolean;
    procedure ReleaseContentLicense(const AContent: IScriptLicensedContent);

    function RenewFloatingLicense: boolean;

    function GetHasReferences: boolean;
    property HasReferences: boolean read GetHasReferences;

    function GetInfo: IScriptContentLicenseInfo;
    property Info: IScriptContentLicenseInfo read GetInfo;

    function GetState: TScriptContentLicenseState;
    property State: TScriptContentLicenseState read GetState;

    function GetExpires: boolean;
    property Expires: boolean read GetExpires;

    function GetExpiration: TDateTime;
    property Expiration: TDateTime read GetExpiration;
  end;

// -----------------------------------------------------------------------------
//
//              IScriptLicensedContent
//
// -----------------------------------------------------------------------------
// Represents content that can be licensed.
// -----------------------------------------------------------------------------
  IScriptLicensedContent = interface
    ['{345A15FA-84A6-4B1B-80FB-069A4B9D10F7}']
    function GetProductID: string;
    property ProductID: string read GetProductID;

    // Populate a LicenseInfo object so the content can be registered.
    function PopulateLicenseInfo(const ContentLicenseInfo: IScriptContentLicenseInfo): boolean;

    // Create a custom content specific license object.
    // Called by IScriptLicenseManager.AcquireContentLicense.
    // Returns nil if a standard license object should be used.
    function CreateContentLicense(const ContentLicenseInfo: IScriptContentLicenseInfo): IScriptContentLicense;

    // UnloadContent: Called when floating license renewal fails to renew the license.
    procedure UnloadUnlicensedContent;
  end;

implementation
end.
