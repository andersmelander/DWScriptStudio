unit amLicenseServiceAPI deprecated 'Feature not available';

(*
 * Copyright © 2016 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

type
  ILicenseService = interface
    function GenerateProductID(Seed: UInt32; const AuthorID: string): string; overload;
    function GenerateProductID(Seed: UInt32; Reserved: UInt32; const AuthorID: string): string; overload;
    function GenerateProductID(Seed: UInt32; Reserved: UInt32; RandomValue: byte; const AuthorID: string): string; overload;
    function ValidateProductID(const ProductID, AuthorID: string): boolean;
    function SanitizeProductID(const ProductID: string): string;
    function FormatProductID(const ProductID: string): string;
  end;

function LicenseService: ILicenseService; deprecated 'Feature not available';

implementation

function LicenseService: ILicenseService;
begin
  Result := nil;
end;

end.
