unit amScript.FileSystemStructure.API;

(*
 * Copyright © 2023 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Generics.Collections,
  Classes,

  amScript.FileSystem.API,
  amScript.Provider.API;


type
  IScriptFileSystemFile = interface;
  IScriptFileSystemFolder = interface;

  // -----------------------------------------------------------------------------
  //
  // IScriptFileSystemObject
  //
  // -----------------------------------------------------------------------------
  // A file system object; Either a file or a folder.
  // -----------------------------------------------------------------------------
  IScriptFileSystemObject = interface
    ['{1B7397C4-E1DB-4655-BCAF-8EF22D7041DA}']
    function GetParent: IScriptFileSystemFolder;
    property Parent: IScriptFileSystemFolder read GetParent;

    function GetName: string;
    property Name: string read GetName;

    function GetPath: string;
    property Path: string read GetPath;
  end;


  // -----------------------------------------------------------------------------
  //
  // IScriptFileSystemFolder
  //
  // -----------------------------------------------------------------------------
  // A folder represents a collection of files and folders.
  // -----------------------------------------------------------------------------
  IScriptFileSystemFolder = interface(IScriptFileSystemObject)
    ['{A7A1A654-3570-4403-A37D-3AD1F52F0758}']
    function GetFolders: TArray<IScriptFileSystemFolder>;
    function GetFiles: TArray<IScriptFileSystemFile>;
  end;


  // -----------------------------------------------------------------------------
  //
  // IScriptFileSystemFile
  //
  // -----------------------------------------------------------------------------
  // A file represents a single script unit.
  // -----------------------------------------------------------------------------
  IScriptFileSystemFile = interface(IScriptFileSystemObject)
    ['{67DF62F2-1139-43C8-8F59-81795E2AD742}']
    function CreateScriptProvider: IScriptProvider;
  end;


// -----------------------------------------------------------------------------
//
// IScriptFileSystemStructure
//
// -----------------------------------------------------------------------------
// A collection of file system structures
// -----------------------------------------------------------------------------
// A host file system can optionally register a root folder through this
// interface if it supports a hierarchical directory-like structure.
//
// The registered folders can be used by the IDE to browse "files".
// The interface is not used by the compiler/debugger.
// -----------------------------------------------------------------------------
type
  IScriptFileSystemStructure = interface
    ['{DC7F5D93-86F7-4551-96E6-C9DBA1AC0B32}']
    procedure RegisterFileSystemFolder(const AFolder: IScriptFileSystemFolder);
    procedure UnregisterFileSystemFolder(const AFolder: IScriptFileSystemFolder);
    function GetEnumerator: TEnumerator<IScriptFileSystemFolder>;
  end;

function ScriptFileSystemStructure: IScriptFileSystemStructure;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------


implementation

type
  TScriptFileSystemStructure = class(TInterfacedObject, IScriptFileSystemStructure)
  strict private
    FItems: TList<IScriptFileSystemFolder>;
  private
    // IScriptFileSystemStructure
    procedure RegisterFileSystemFolder(const AFolder: IScriptFileSystemFolder);
    procedure UnregisterFileSystemFolder(const AFolder: IScriptFileSystemFolder);
    function GetEnumerator: TEnumerator<IScriptFileSystemFolder>;
  public
    constructor Create;
    destructor Destroy; override;
  end;

constructor TScriptFileSystemStructure.Create;
begin
  inherited Create;
  FItems := TList<IScriptFileSystemFolder>.Create;
end;

destructor TScriptFileSystemStructure.Destroy;
begin
  FItems.Free;
  inherited;
end;

function TScriptFileSystemStructure.GetEnumerator: TEnumerator<IScriptFileSystemFolder>;
begin
  Result := FItems.GetEnumerator;
end;

procedure TScriptFileSystemStructure.RegisterFileSystemFolder(const AFolder: IScriptFileSystemFolder);
begin
  FItems.Add(AFolder);
end;

procedure TScriptFileSystemStructure.UnregisterFileSystemFolder(const AFolder: IScriptFileSystemFolder);
begin
  FItems.Remove(AFolder);
end;

var
  FScriptFileSystemStructure: IScriptFileSystemStructure;

function ScriptFileSystemStructure: IScriptFileSystemStructure;
begin
  if (FScriptFileSystemStructure = nil) then
    FScriptFileSystemStructure := TScriptFileSystemStructure.Create;
  Result := FScriptFileSystemStructure;
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

initialization
finalization
  FScriptFileSystemStructure := nil;
end.

