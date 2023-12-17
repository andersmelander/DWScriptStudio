unit amScript.FileSystemStructure.Default;

(*
 * Copyright © 2023 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

// -----------------------------------------------------------------------------
//
// Default file system structure.
// Provides file access to the local file system.
//
// -----------------------------------------------------------------------------

implementation

uses
  System.Generics.Collections,
  System.IOUtils,
  WinApi.Windows,
  amScript.FileSystemStructure.API,
  amScript.FileSystemStructure;

var
  FRootFileSystemDevices: TList<IScriptFileSystemFolder>;

initialization

  FRootFileSystemDevices := TList<IScriptFileSystemFolder>.Create;

  begin
    var Device := 'A:\';
    var DriveMap := GetLogicalDrives;
    var DriveMask: DWORD := 1;
    var DriveTypes: DWORD := DRIVE_REMOVABLE or DRIVE_FIXED or DRIVE_CDROM or DRIVE_RAMDISK;

    for var i := 0 to 32 do
    begin
      if (DriveMap and DriveMask <> 0) then
        if (GetDriveType(PChar(Device)) and DriveTypes <> 0) then
        begin
          var FileSystemDevice := TScriptFileSystemFolder.Create(Device);
          FRootFileSystemDevices.Add(FileSystemDevice);
          ScriptFileSystemStructure.RegisterFileSystemFolder(FileSystemDevice);
        end;

      DriveMask := DriveMask shl 1;
      Inc(Device[1]);
    end;
  end;
(*
  for var Device in TDirectory.GetLogicalDrives do
  begin
    var FileSystemDevice := TScriptFileSystemFolder.Create(Device + '\');
    FRootFileSystemDevices.Add(FileSystemDevice);
    ScriptFileSystemStructure.RegisterFileSystemFolder(FileSystemDevice);
  end;
*)

finalization

  if (FRootFileSystemDevices <> nil) then
  begin
    for var FileSystemDevice in FRootFileSystemDevices do
      ScriptFileSystemStructure.UnregisterFileSystemFolder(FileSystemDevice);
  end;
  FRootFileSystemDevices.Free;

end.
