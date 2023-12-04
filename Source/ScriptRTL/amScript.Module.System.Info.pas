unit amScript.Module.System.Info;

(*
 * Copyright © 2014 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  SysUtils, Classes,
  Controls,
  Generics.Collections,

  dwsComp,
  dwsExprs,
  dwsCompiler,
  dwsClassesLibModule,
  dwsSystemInfoLibModule,

  amScript.Module;

// -----------------------------------------------------------------------------
//
// TDataModuleScriptSystemInfo
//
// -----------------------------------------------------------------------------
type
  TDataModule = class(TScriptModule);

  TDataModuleScriptSystemInfo = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    FLibrary: TdwsSystemInfoLibModule;
  protected
    // ISigmaScriptModule
    procedure Initialize(DelphiWebScript: TDelphiWebScript); override;
    procedure Finalize; override;
  public
  end;

implementation

{$R *.dfm}

// -----------------------------------------------------------------------------
//
// TDataModuleScriptSystemInfo
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptSystemInfo.DataModuleCreate(Sender: TObject);
begin
  FLibrary := TdwsSystemInfoLibModule.Create(Self);
  FLibrary.dwsSystemInfo.UnitName := 'System.Info';
  FLibrary.dwsSystemInfo.StaticSymbols := False;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptSystemInfo.Initialize(DelphiWebScript: TDelphiWebScript);
begin
  inherited;
  FLibrary.dwsSystemInfo.Script := DelphiWebScript;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptSystemInfo.Finalize;
begin
  inherited;
  FLibrary.dwsSystemInfo.Script := nil;
end;

// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

initialization
  TDataModuleScriptSystemInfo.RegisterModule;
end.
