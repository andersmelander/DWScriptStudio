unit ScriptFileSystemAPI;

(*
 * Copyright © 2012 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  dwsFileSystem,
  ScriptProviderAPI;

type
  IScriptFileSystem = interface(IdwsFileSystem)
    ['{C4A51EBA-EC96-4533-BB4B-24F9C9BD2431}']
    function OpenScriptProvider(const Filename: string; FileMustExist: boolean): IScriptProvider;
    function ValidateFileNameEx(const FileName: string; FileMustExist: boolean): string;
  end;

  IScriptDelegatingFileSystem = interface(IScriptFileSystem)
    ['{203DBF33-1B2F-4B32-A17D-191427721F94}']
    procedure MountFileSystem(const FileSystem: IScriptFileSystem);
    procedure UnmountFileSystem(const FileSystem: IScriptFileSystem);
  end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------


implementation
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

end.

