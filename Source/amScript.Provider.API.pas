unit amScript.Provider.API;

(*
 * Copyright © 2019 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Classes,
  dwsFileSystem;

// -----------------------------------------------------------------------------
//
// IScriptProvider
//
// -----------------------------------------------------------------------------
// Used to edit (and debug) Script.
// - Provides an interface between the editor and the script source.
// - Supplied by the script source.
// - Called by the editor.
// Used by the compiler and run time.
// -----------------------------------------------------------------------------
type
  IScriptProvider = interface
    ['{5ECD96C2-96A6-47B0-A581-20157735DC02}']
    procedure SetScript(const Script: string);
    function GetScript: string;

    function GetScriptName: string;
    property ScriptName: string read GetScriptName;
    function GetFolder: string;
    property Folder: string read GetFolder;
    function GetReadOnly: boolean;
    property ReadOnly: boolean read GetReadOnly;
    function GetProtected: boolean;
    property Protected: boolean read GetProtected;

    function CreateFileSystem: IdwsFileSystem;
  end;

  IScriptProviderNotificationSink = interface
    ['{C476D610-2198-43FD-8796-C9C4CB220811}']
    procedure Terminate;
  end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

implementation

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

end.


