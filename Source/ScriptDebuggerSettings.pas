unit ScriptDebuggerSettings;

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
// This unit contains settings related stuff.
//
// -----------------------------------------------------------------------------

uses
  Windows,
  SysUtils,
  Classes,
  Forms,
  amRegConfig;

var
  sScriptAPIKeyPublic: string = '';

var
  sScriptHostConditionalDefine: string = '';

//------------------------------------------------------------------------------
//
//      Configuration Persistence
//
//------------------------------------------------------------------------------
var
  ScriptDebuggerRegistryKey: HKEY = HKEY_CURRENT_USER;
  ScriptDebuggerRegistryRoot: string = '\Software\Melander\DWScriptStudio\';

const
  ScriptDebuggerSettingsKeyLayout: string = '\Layout';
  ScriptDebuggerSettingsKeyFolder: string = '\Folders';
  ScriptDebuggerSettingsKeyFormMain: string = '\Forms\Debugger';
  ScriptDebuggerSettingsKeyDialogSupression: string = '\Dialogs\Supress';
  ScriptDebuggerSettingsKeyLicense: string = '\License';

//------------------------------------------------------------------------------
//
//      Configuration
//
//------------------------------------------------------------------------------

type
  TCustomFormSettings = class(TConfigurationSection)
  strict private
    FForm: TCustomForm;
    FValid: boolean;
    FMaximized: boolean;
    FVisible: boolean;
    FLeft: integer;
    FHeight: integer;
    FWidth: integer;
    FTop: integer;
  protected
    property Visible: boolean read FVisible write FVisible default True;
    property Height: integer read FHeight write FHeight default -1;
    property Width: integer read FWidth write FWidth default -1;
    property Maximized: boolean read FMaximized write FMaximized default False;
  protected
    procedure ReadSection(const Key: string); override;
    procedure WriteSection(const Key: string); override;
  public
    function ApplySettings(Form: TCustomForm): boolean;
    function PrepareSettings(Form: TCustomForm): boolean;
    procedure ResetSettings;
  published
    property Valid: boolean read FValid write FValid default False;
    property Top: integer read FTop write FTop;
    property Left: integer read FLeft write FLeft;
  end;

  TScriptDebuggerFormMainSettings = class(TCustomFormSettings)
  private
  protected
  public
  published
    property Width;
    property Height;
    property Maximized;
  end;

  TScriptDebuggerFormsSettings = class(TConfigurationSection)
  private
    FMain: TScriptDebuggerFormMainSettings;
  public
    constructor Create(AOwner: TConfigurationSection); override;
    destructor Destroy; override;
    procedure ResetSettings;
  published
    property Main: TScriptDebuggerFormMainSettings read FMain;
  end;


type
  TScriptDebuggerFolderSettings = class(TConfigurationSection)
  strict private
    FValid: boolean;
    FFolderScript: string;
    FFolderBundle: string;
    FRecentFiles: TConfigurationStringList;
    FRecentPinnedFiles: TConfigurationStringList;
    FOpenHistory: TConfigurationStringList;
    FSaveHistory: TConfigurationStringList;
  protected
    procedure ReadSection(const Key: string); override;
    procedure WriteSection(const Key: string); override;
  public
    constructor Create(AOwner: TConfigurationSection); override;
    destructor Destroy; override;

    procedure ResetSettings;
  published
    property Valid: boolean read FValid write FValid default False;

    //property LastFileType: integer read FLastFileType write FLastFileType;

    property FolderScript: string read FFolderScript write FFolderScript;
    property FolderBundle: string read FFolderBundle write FFolderBundle;

    property RecentFiles: TConfigurationStringList read FRecentFiles;
    property RecentPinnedFiles: TConfigurationStringList read FRecentPinnedFiles;
    property OpenHistory: TConfigurationStringList read FOpenHistory;
    property SaveHistory: TConfigurationStringList read FSaveHistory;
  end;


type
  TScriptLicenseSettings = class(TPersistent)
  private
    FAPIKeyPublic: string;
    FAPIKeyPrivate: string;
    FAPIKeyName: string;
    FAuthorURL: string;
    FProductID: string;
  public
    function HasAPIKey: boolean;
  published
    property APIKeyPublic: string read FAPIKeyPublic write FAPIKeyPublic;
    property APIKeyPrivate: string read FAPIKeyPrivate write FAPIKeyPrivate;
    property APIKeyName: string read FAPIKeyName write FAPIKeyName;
    property AuthorURL: string read FAuthorURL write FAuthorURL;
    property ProductID: string read FProductID write FProductID;
  end;

type
  TScriptDebuggerLayoutSettings = class(TConfigurationSectionValues<TConfigurationSection>)
  private const
    nScriptDebuggerLayoutVersion = 5; // Bump this if dock panels are added or removed
  private
    FVersion: integer;
    FDebugLayout: string;
    FEditLayout: string;
  protected
    procedure WriteSection(const Key: string); override;
    procedure ReadSection(const Key: string); override;
  public
    procedure ResetSettings;
  published
    property Version: integer read FVersion write FVersion;
    property EditLayout: string read FEditLayout write FEditLayout;
    property DebugLayout: string read FDebugLayout write FDebugLayout;
  end;

resourcestring
  sScriptDebuggerLayoutNameDefault = 'Default layout';

type
  TScriptDebuggerDialogSupressionSettings = class(TPersistent)
  private
    FScriptBundleBuilderMainFileMissing: boolean;
  public
  published
    property ScriptBundleBuilderMainFileMissing: boolean read FScriptBundleBuilderMainFileMissing write FScriptBundleBuilderMainFileMissing;
  end;

  TScriptDebuggerDialogSettings = class(TPersistent)
  private
    FSupress: TScriptDebuggerDialogSupressionSettings;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property Supress: TScriptDebuggerDialogSupressionSettings read FSupress;
  end;

type
  TScriptDebuggerEditorSettings = class(TConfigurationSection)
  private
    FFontSize: integer;
    FHighlighterClass: string;
    FFontName: string;
    FHomePositionFileIdentifier: string;
    FHomePositionFileName: string;
  protected
    procedure ApplyDefault; override;
  public
    constructor Create(AOwner: TConfigurationSection); override;
    destructor Destroy; override;
  published
    property HighlighterClass: string read FHighlighterClass write FHighlighterClass;
    property FontName: string read FFontName write FFontName;
    property FontSize: integer read FFontSize write FFontSize;

    // TODO : Get rid of this
    property HomePositionFileName: string read FHomePositionFileName write FHomePositionFileName;
    property HomePositionFileIdentifier: string read FHomePositionFileIdentifier write FHomePositionFileIdentifier;
  end;

type
  TScriptDebuggerSettings = class(TConfiguration)
  strict private
    FValid: boolean;
    FForms: TScriptDebuggerFormsSettings;
    FLicense: TScriptLicenseSettings;
    FFolders: TScriptDebuggerFolderSettings;
    FLayout: TScriptDebuggerLayoutSettings;
    FDialogs: TScriptDebuggerDialogSettings;
    FEditor: TScriptDebuggerEditorSettings;
  protected
  public
    constructor Create(Root: HKEY; const APath: string; AAccess: LongWord = KEY_ALL_ACCESS); override;
    destructor Destroy; override;
    procedure ResetSettings;
  published
    property Valid: boolean read FValid write FValid default False;
    property Folders: TScriptDebuggerFolderSettings read FFolders;
    property Forms: TScriptDebuggerFormsSettings read FForms;
    property License: TScriptLicenseSettings read FLicense;
    property Layout: TScriptDebuggerLayoutSettings read FLayout;
    property Dialogs: TScriptDebuggerDialogSettings read FDialogs;
    property Editor: TScriptDebuggerEditorSettings read FEditor;
  end;

function ScriptSettings: TScriptDebuggerSettings;

implementation

uses
  Math,
  ScriptDebuggerAPI;

//------------------------------------------------------------------------------
//
//      TCustomFormSettings
//
//------------------------------------------------------------------------------
type
  TFormCracker = class(TCustomForm);

function TCustomFormSettings.ApplySettings(Form: TCustomForm): boolean;
var
  Monitor: TMonitor;
  WorkareaRect: TRect;
  NewTop, NewLeft, NewWidth, NewHeight: integer;
begin
  Result := Valid;

  if (not Result) then
    exit;

  TFormCracker(Form).SetDesigning(True, False); // To avoid RecreateWnd
  try

    TFormCracker(Form).Position := poDesigned;
    TFormCracker(Form).DefaultMonitor := dmDesktop;

  finally
    TFormCracker(Form).SetDesigning(False, False);
  end;

  // Find the monitor containing the top/left corner.
  // If the point is outside available monitors then the nearest monitor is used.
  Monitor := Screen.MonitorFromPoint(Point(Left, Top), mdNearest);

  WorkareaRect := Monitor.WorkareaRect;

  if (Height <> -1) then
    NewHeight := Min(Height, WorkareaRect.Height)
  else
    NewHeight := TFormCracker(Form).Height;
  if (Width <> -1) then
    NewWidth := Min(Width, WorkareaRect.Width)
  else
    NewWidth := TFormCracker(Form).Width;

  if (PtInRect(WorkareaRect, Point(Left, Top))) then
  begin
    NewTop := Top;
    NewLeft := Left;
  end else
  begin
    // Center on monitor if top/left is outside screen (e.g. if a monitor has been removed)
    NewTop := WorkareaRect.Top + (WorkareaRect.Height - NewHeight) div 2;
    NewLeft := WorkareaRect.Left + (WorkareaRect.Width - NewWidth) div 2;
  end;

  Form.SetBounds(NewLeft, NewTop, NewWidth, NewHeight);

(* Altering WindowState of a DevExpress ribbon form before form has been shown breaks it (RecreateWnd called).
  if (Maximized) then
    TFormCracker(Form).WindowState := wsMaximized
  else
    TFormCracker(Form).WindowState := wsNormal;
*)
end;

function TCustomFormSettings.PrepareSettings(Form: TCustomForm): boolean;
var
  wp: TWindowPlacement;
begin
  Valid := True;

  wp.length := Sizeof(wp);
  GetWindowPlacement(Form.Handle, @wp);
  Left := wp.rcNormalPosition.Left;
  Top := wp.rcNormalPosition.Top;
  Height := wp.rcNormalPosition.Bottom-Top;
  Width := wp.rcNormalPosition.Right-Left;
  Maximized := (Form.WindowState = wsMaximized);
  Visible := Form.Visible;

  Result := True;
end;

procedure TCustomFormSettings.ReadSection(const Key: string);
begin
  inherited;
  if (not Valid) then
    ResetSettings;
end;

procedure TCustomFormSettings.WriteSection(const Key: string);
begin
  if (Valid) then
    inherited;
end;

procedure TCustomFormSettings.ResetSettings;
begin
  Valid := False;
  FLeft := FForm.ExplicitLeft;
  FTop := FForm.ExplicitTop;
  FWidth := -1;
  FHeight := -1;
  FMaximized := False;
end;

//------------------------------------------------------------------------------
//
//      TScriptDebuggerFolderSettings
//
//------------------------------------------------------------------------------
constructor TScriptDebuggerFolderSettings.Create(AOwner: TConfigurationSection);
begin
  inherited Create(AOwner);
  FRecentFiles := TConfigurationStringList.Create(Self);
  FRecentPinnedFiles := TConfigurationStringList.Create(Self);
  FOpenHistory := TConfigurationStringList.Create(Self);
  FSaveHistory := TConfigurationStringList.Create(Self);
end;

destructor TScriptDebuggerFolderSettings.Destroy;
begin
  FRecentFiles.Free;
  FRecentPinnedFiles.Free;
  FOpenHistory.Free;
  FSaveHistory.Free;
  inherited;
end;

//------------------------------------------------------------------------------

procedure TScriptDebuggerFolderSettings.ResetSettings;
begin
  inherited;

//  FLastFileType := 0;
  FFolderScript := '';
  FFolderBundle := '';
  FRecentFiles.Clear;
  FRecentPinnedFiles.Clear;
  FOpenHistory.Clear;
  FSaveHistory.Clear;
end;

procedure TScriptDebuggerFolderSettings.ReadSection(const Key: string);
begin
  inherited;
  if (not Valid) then
    ResetSettings;
end;

procedure TScriptDebuggerFolderSettings.WriteSection(const Key: string);
begin
  Valid := True;
  inherited;
end;

//------------------------------------------------------------------------------
//
//      TScriptDebuggerFormsSettings
//
//------------------------------------------------------------------------------
constructor TScriptDebuggerFormsSettings.Create(AOwner: TConfigurationSection);
begin
  inherited Create(AOwner);
  FMain := TScriptDebuggerFormMainSettings.Create(Self);
end;

destructor TScriptDebuggerFormsSettings.Destroy;
begin
  FMain.Free;
  inherited;
end;

procedure TScriptDebuggerFormsSettings.ResetSettings;
begin
  FMain.ResetSettings;
end;

//------------------------------------------------------------------------------
//
//      TScriptDebuggerLayoutSettings
//
//------------------------------------------------------------------------------
procedure TScriptDebuggerLayoutSettings.ReadSection(const Key: string);
var
  Sections: TStrings;
  Section: string;
begin
  inherited;

  if (FVersion <> nScriptDebuggerLayoutVersion) then
  begin
    Sections := TStringList.Create;
    try
      Registry.ReadSectionNames(Key, Sections);
      for Section in Sections do
        Registry.EraseSection(Key + Section);
    finally
      Sections.Free;
    end;

    Clear;
  end;

  if (FEditLayout = '') or (Find(FEditLayout) = nil) then
    FEditLayout := sScriptDebuggerLayoutNameDefault;

  if (FDebugLayout = '') or (Find(FDebugLayout) = nil) then
    FDebugLayout := FEditLayout;

  // Make sure we at least have the configured section
  Items[FEditLayout];
end;

procedure TScriptDebuggerLayoutSettings.WriteSection(const Key: string);
begin
  FVersion := nScriptDebuggerLayoutVersion;

  inherited;
end;

procedure TScriptDebuggerLayoutSettings.ResetSettings;
begin
  Clear;
  FDebugLayout := '';
  FEditLayout := '';
end;

//------------------------------------------------------------------------------
//
//      TScriptDebuggerDialogSettings
//
//------------------------------------------------------------------------------
constructor TScriptDebuggerDialogSettings.Create;
begin
  inherited Create;
  FSupress := TScriptDebuggerDialogSupressionSettings.Create;
end;

destructor TScriptDebuggerDialogSettings.Destroy;
begin
  FSupress.Free;
  inherited;
end;

//------------------------------------------------------------------------------
//
//      TScriptDebuggerEditorSettings
//
//------------------------------------------------------------------------------
procedure TScriptDebuggerEditorSettings.ApplyDefault;
begin
  inherited;

  if (CheckWin32Version(6, 0)) then // Vista or later...
  begin
    FFontName := 'Consolas';
    FFontSize := 10;
  end else
  begin
    FFontName := 'Courier New';
    FFontSize := 10;
  end;
  FHighlighterClass := TSynDWSSyn_DelphiLookalike.ClassName;

  // Register class so FindClass can find it
  RegisterClass(TSynDWSSyn_DelphiLookalike);
end;

constructor TScriptDebuggerEditorSettings.Create(AOwner: TConfigurationSection);
begin
  inherited Create(AOwner);

end;

destructor TScriptDebuggerEditorSettings.Destroy;
begin

  inherited;
end;

//------------------------------------------------------------------------------
//
//      TScriptLicenseSettings
//
//------------------------------------------------------------------------------
function TScriptLicenseSettings.HasAPIKey: boolean;
begin
  Result := False;
end;


//------------------------------------------------------------------------------
//
//      TScriptDebuggerSettings
//
//------------------------------------------------------------------------------
constructor TScriptDebuggerSettings.Create(Root: HKEY; const APath: string; AAccess: LongWord = KEY_ALL_ACCESS);
begin
  inherited Create(Root, APath, AAccess);
  FForms := TScriptDebuggerFormsSettings.Create(Self);
  FLicense := TScriptLicenseSettings.Create;
  FFolders := TScriptDebuggerFolderSettings.Create(Self);
  FLayout := TScriptDebuggerLayoutSettings.Create(Self);
  FDialogs := TScriptDebuggerDialogSettings.Create;
  FEditor := TScriptDebuggerEditorSettings.Create(Self);
end;

destructor TScriptDebuggerSettings.Destroy;
begin
  FForms.Free;
  FLicense.Free;
  FFolders.Free;
  FLayout.Free;
  FDialogs.Free;
  FEditor.Free;

  inherited;
end;

//------------------------------------------------------------------------------

procedure TScriptDebuggerSettings.ResetSettings;
begin
  inherited;
  FForms.ResetSettings;
  FFolders.ResetSettings;
  FEditor.ApplyDefault;
end;


//------------------------------------------------------------------------------
//
//      ScriptSettings
//
//------------------------------------------------------------------------------
var
  FScriptDebuggerSettings: TScriptDebuggerSettings = nil;

function ScriptSettings: TScriptDebuggerSettings;
begin
  if (FScriptDebuggerSettings = nil) then
    FScriptDebuggerSettings := TScriptDebuggerSettings.Create(ScriptDebuggerRegistryKey, ScriptDebuggerRegistryRoot);
  Result := FScriptDebuggerSettings;
end;

//------------------------------------------------------------------------------

initialization
//  ConfigurationServiceRegistryKey := ScriptDebuggerRegistryKey;
//  ConfigurationServiceRegistryRoot := ScriptDebuggerRegistryRoot;
finalization
  FreeAndNil(FScriptDebuggerSettings);
end.