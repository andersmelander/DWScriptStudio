unit amScript.FileSystemStructure;

(*
 * Copyright © 2023 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Classes,

  amScript.FileSystemStructure.API,
  amScript.Provider.API;


// -----------------------------------------------------------------------------
//
// TScriptFileSystemObject
//
// -----------------------------------------------------------------------------
// Implements IScriptFileSystemObject
// Represents a file system object; Either a file or a folder.
// -----------------------------------------------------------------------------
type
  TScriptFileSystemObject = class(TInterfacedObject, IScriptFileSystemObject)
  strict private
    FName: string;
    // Parent link is a weak reference to avoid cyclic references keeping the object alive forever
    [weak] FParent: IScriptFileSystemFolder;
  private
    // IScriptFileSystemObject
    function GetParent: IScriptFileSystemFolder;
    function GetName: string;
    function GetPath: string;
  strict protected
    property Parent: IScriptFileSystemFolder read FParent;
    property Name: string read FName;
  public
    constructor Create(const AName: string; AParent: IScriptFileSystemFolder = nil);
  end;


// -----------------------------------------------------------------------------
//
// TScriptFileSystemFolder
//
// -----------------------------------------------------------------------------
// Implements IScriptFileSystemFolder
// A folder represents a collection of files and folders.
// -----------------------------------------------------------------------------
type
  TScriptFileSystemFolder = class(TScriptFileSystemObject, IScriptFileSystemFolder)
  strict private
    FHasFolders: boolean;
    FFolders: TArray<IScriptFileSystemFolder>;
    FHasFiles: boolean;
    FFiles: TArray<IScriptFileSystemFile>;
  private
    // ScriptFileSystemFolder
    function GetFolders: TArray<IScriptFileSystemFolder>;
    function GetFiles: TArray<IScriptFileSystemFile>;
  end;


// -----------------------------------------------------------------------------
//
// TScriptFileSystemFile
//
// -----------------------------------------------------------------------------
// Implements IScriptFileSystemFile
// A file represents a single script unit.
// -----------------------------------------------------------------------------
type
  TScriptFileSystemFile = class(TScriptFileSystemObject, IScriptFileSystemFile)
  private
    FFilename: string;
  private
    // ScriptFileSystemFile
    function CreateScriptProvider: IScriptProvider;
  end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------


implementation

uses
  IOUtils,

  amScript.Provider;

// -----------------------------------------------------------------------------
//
// TScriptFileSystemObject
//
// -----------------------------------------------------------------------------
constructor TScriptFileSystemObject.Create(const AName: string; AParent: IScriptFileSystemFolder);
begin
  inherited Create;
  FParent := AParent;
  FName := AName;
end;

function TScriptFileSystemObject.GetName: string;
begin
  Result := FName;
end;

function TScriptFileSystemObject.GetParent: IScriptFileSystemFolder;
begin
  Result := FParent;
end;

function TScriptFileSystemObject.GetPath: string;
begin
  if (Parent <> nil) then
    Result := TPath.Combine(TScriptFileSystemObject(Parent).GetPath, Name)
  else
    Result := Name;
end;


// -----------------------------------------------------------------------------
//
// TScriptFileSystemFolder
//
// -----------------------------------------------------------------------------
function TScriptFileSystemFolder.GetFiles: TArray<IScriptFileSystemFile>;
begin
  if (not FHasFiles) then
  begin
    FHasFiles := True;

    var Filenames := TDirectory.GetFiles(GetPath, '*.pas');
    SetLength(FFiles, Length(Filenames));

    for var i := 0 to High(Filenames) do
      FFiles[i] := TScriptFileSystemFile.Create(TPath.GetFileName(Filenames[i]), Self);
  end;

  Result := FFiles;
end;

function TScriptFileSystemFolder.GetFolders: TArray<IScriptFileSystemFolder>;
begin
  if (not FHasFolders) then
  begin
    FHasFolders := True;

    var Folders := TDirectory.GetDirectories(GetPath);
    SetLength(FFolders, Length(Folders));

    for var i := 0 to High(Folders) do
      FFolders[i] := TScriptFileSystemFolder.Create(TPath.GetFileName(Folders[i]), Self);
  end;

  Result := FFolders;
end;

// -----------------------------------------------------------------------------
//
// TScriptFileSystemFile
//
// -----------------------------------------------------------------------------
function TScriptFileSystemFile.CreateScriptProvider: IScriptProvider;
begin
  Result := TFileScriptProvider.Create(GetPath);
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

end.

