unit amConfigurationService;

(*
 * Copyright © 2008 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Generics.Collections,
  Windows,
  Classes,
  amRegConfig,
  amGenerics;

//------------------------------------------------------------------------------
//
//      Configuration Persistence
//
//------------------------------------------------------------------------------
var
  ConfigurationServiceRegistryKey: HKEY = HKEY_CURRENT_USER;
  ConfigurationServiceRegistryRoot: string = '\Software\Melander\';



//------------------------------------------------------------------------------
//
//      ISettings
//
//------------------------------------------------------------------------------
type
  ISettings = interface;

  TSettingsNotification = (snSubscribe, snUnsubscribe, snChanged);

  ISettingsNotification = interface
    ['{41938E07-E975-4A09-A5E8-89D8EBC709A0}']
    procedure SettingsNotification(const Settings: ISettings; Action: TSettingsNotification);
  end;

  ISettings = interface
    ['{A1B6DF8F-BBF0-4CA7-AFE5-A0D27A813C76}']
    function Instance: TObject;

    procedure Subscribe(const Subscriber: ISettingsNotification);
    procedure Unsubscribe(const Subscriber: ISettingsNotification);

    // ResetSettings
    // Resets the settings to their default values.
    procedure ResetSettings;

    // ApplySettings
    // Called by ConfigurationService.LoadSettings after settings has been loaded.
    // Return True if settings could be applied. False otherwise.
    function ApplySettings: boolean;

    // PrepareSettings
    // Called by ConfigurationService.SaveSettings before settings are saved.
    // Return True if settings should be persisted. False otherwise.
    function PrepareSettings: boolean;

    procedure BeginUpdate;
    procedure Changed;
    procedure EndUpdate;
  end;


  ISettingValues = interface(ISettings)
    ['{FD5DCE91-F768-480E-B907-FBAEAA08FEF8}']
    function GetValue(const Name: string): Variant;
    procedure SetValue(const Name: string; const Value: Variant);

    property Values[const Name: string]: Variant read GetValue write SetValue; default;
  end;



//------------------------------------------------------------------------------
//
//      TCustomSettings
//
//------------------------------------------------------------------------------
// Reference ISettings base class
//------------------------------------------------------------------------------
type
  TCustomSettings = class(TPersistent, IUnknown, ISettings, ISettingValues)
  private
    FSubscriptions: TWeakInterfaceList<ISettingsNotification>;
    FUpdateCount: integer;
    FChanged: boolean;
  protected
    function GetSubscriptions: TWeakInterfaceList<ISettingsNotification>;

    // IUnknown
    function _AddRef: Integer; virtual; stdcall;
    function _Release: Integer; virtual; stdcall;
    function QueryInterface(const IID: TGUID; out Obj): HResult; virtual; stdcall;

    // ISettings
    function Instance: TObject; virtual;
    procedure Subscribe(const Subscriber: ISettingsNotification);
    procedure Unsubscribe(const Subscriber: ISettingsNotification);
    procedure ResetSettings; virtual;
    function ApplySettings: boolean; virtual;
    function PrepareSettings: boolean; virtual;


    // ISettingValues
    function GetValue(const Name: string): Variant; virtual;
    procedure SetValue(const Name: string; const Value: Variant); virtual;

    procedure Notify(Action: TSettingsNotification);
    property Subscriptions: TWeakInterfaceList<ISettingsNotification> read GetSubscriptions;
  public
    destructor Destroy; override;
    procedure BeginUpdate;
    procedure Changed;
    procedure EndUpdate;
  published
  end;

  TSettingsStringList = class(TStringList, IConfigurationSection)
  protected
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;

    // IConfigurationSection
    procedure WriteSection(Registry: TFixedRegIniFile; const Key: string);
    procedure ReadSection(Registry: TFixedRegIniFile; const Key: string);

    procedure ApplyDefault; virtual;
  end;

//------------------------------------------------------------------------------
//
//      ConfigurationService
//
//------------------------------------------------------------------------------
type
  IConfigurationService = interface
    ['{2DC25745-FF5F-4C0C-8247-788C6D40A6AB}']
    // Hierachy traversal
    function SubKey(const SubKey: string): IConfigurationService;

    // Load settings
    function LoadSettings(const Key: string; Settings: ISettings): boolean;

    // Save settings
    procedure SaveSettings(const Key: string; Settings: ISettings);
  end;

//------------------------------------------------------------------------------

function ConfigurationService: IConfigurationService;



//------------------------------------------------------------------------------
//
//      ISettingsProvider
//
//------------------------------------------------------------------------------
type
  ISettingsProvider = interface
    ['{CD618A70-5D1A-453E-B9EF-34779F0DE5B9}']
    function GetSettings(out Settings: ISettings; out Key: string): boolean;
  end;



//------------------------------------------------------------------------------
//
//      ConfigurationServiceFactory
//
//------------------------------------------------------------------------------
type
  TConfigurationServiceFactory = function(): IConfigurationService;

procedure RegisterConfigurationServiceFactory(Factory: TConfigurationServiceFactory);


procedure ApplyDefaultConfigValues(Instance: TObject);


//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
implementation

uses
  SysUtils,
  TypInfo;

procedure ApplyDefaultConfigValues(Instance: TObject);
var
  PropList: pPropList;
  Count: integer;
  i: integer;
begin
  Count := GetPropList(Instance.ClassInfo, tkProperties, nil);
  GetMem(PropList, Count*SizeOf(Pointer));
  try
    Count := GetPropList(Instance.ClassInfo, tkProperties, PropList);

    for i := 0 to Count-1 do
      if (PropList[i].Default <> Longint($80000000)) and (PropList[i].PropType^.Kind in [tkInteger, tkChar, tkEnumeration, tkSet, tkInt64]) then
        SetOrdProp(Instance, PropList[i], PropList[i].Default);
  finally
    FreeMem(PropList);
  end;
end;

//------------------------------------------------------------------------------
//
//      TCustomSettings
//
//------------------------------------------------------------------------------
function TCustomSettings.ApplySettings: boolean;
begin
  Result := True;
end;

//------------------------------------------------------------------------------

destructor TCustomSettings.Destroy;
begin
  Notify(snUnsubscribe);
  FreeAndNil(FSubscriptions);
  inherited;
end;

//------------------------------------------------------------------------------

procedure TCustomSettings.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TCustomSettings.Changed;
begin
  BeginUpdate;
  FChanged := True;
  EndUpdate;
end;

procedure TCustomSettings.EndUpdate;
begin
  ASSERT(FUpdateCount >= 1);

  if (FChanged) and (FUpdateCount = 1) then
  begin
    Notify(snChanged);
    FChanged := False;
  end;

  Dec(FUpdateCount);
end;

//------------------------------------------------------------------------------

function TCustomSettings.GetSubscriptions: TWeakInterfaceList<ISettingsNotification>;
begin
  if (FSubscriptions = nil) then
    FSubscriptions := TWeakInterfaceList<ISettingsNotification>.Create;
  Result := FSubscriptions;
end;

//------------------------------------------------------------------------------

function TCustomSettings.Instance: TObject;
begin
  Result := Self;
end;

//------------------------------------------------------------------------------

procedure TCustomSettings.Notify(Action: TSettingsNotification);
var
  i: integer;
begin
  if (FSubscriptions <> nil) then
    for i := Subscriptions.Count-1 downto 0 do
      Subscriptions[i].SettingsNotification(Self, Action);
end;

//------------------------------------------------------------------------------

function TCustomSettings.PrepareSettings: boolean;
begin
  Result := True;
end;

//------------------------------------------------------------------------------

procedure TCustomSettings.ResetSettings;
begin
  ApplyDefaultConfigValues(Instance);
end;

//------------------------------------------------------------------------------

function TCustomSettings.GetValue(const Name: string): Variant;
begin
  Result := GetPropValue(Instance, Name, False);
end;

procedure TCustomSettings.SetValue(const Name: string; const Value: Variant);
begin
  SetPropValue(Instance, Name, Value);
  Changed;
end;

//------------------------------------------------------------------------------

procedure TCustomSettings.Subscribe(
  const Subscriber: ISettingsNotification);
begin
  Subscriptions.Add(Subscriber);
  Subscriber.SettingsNotification(Self, snSubscribe);
end;

procedure TCustomSettings.Unsubscribe(
  const Subscriber: ISettingsNotification);
begin
  if (FSubscriptions <> nil) then
  begin
    if (Subscriptions.Remove(Subscriber)) then
      Subscriber.SettingsNotification(Self, snUnsubscribe);
  end;
end;

//------------------------------------------------------------------------------

function TCustomSettings._AddRef: Integer;
begin
  Result := -1;
end;

function TCustomSettings._Release: Integer;
begin
  Result := -1;
end;

function TCustomSettings.QueryInterface(const IID: TGUID; out Obj): HResult;
const
  E_NOINTERFACE = HResult($80004002);
begin
  if GetInterface(IID, Obj) then Result := 0 else Result := E_NOINTERFACE;
end;

//------------------------------------------------------------------------------
//
//      TConfigurationService
//
//------------------------------------------------------------------------------
type
  TConfigurationService = class(TInterfacedObject, IConfigurationService)
  private
    FConfiguration: TConfiguration;
    FRoot: string;
    FRootKey: HKEY;
  protected
    // IConfigurationService
    function SubKey(const SubKey: string): IConfigurationService;
    function LoadSettings(const Key: string; Settings: ISettings): boolean;
    procedure SaveSettings(const Key: string; Settings: ISettings);
  public
    constructor Create(RootKey: HKEY; const Root: string);
    destructor Destroy; override;
    property RootKey: HKEY read FRootKey;
    property Root: string read FRoot;
  end;

//------------------------------------------------------------------------------

constructor TConfigurationService.Create(RootKey: HKEY; const Root: string);
begin
  inherited Create;
  FRootKey := RootKey;
  if (Length(Root) = 0) or (Root[Length(Root)] <> '\') then
    FRoot := Root+'\'
  else
    FRoot := Root;
  FConfiguration := TConfiguration.Create(RootKey, Root);
end;

//------------------------------------------------------------------------------

destructor TConfigurationService.Destroy;
begin
  FConfiguration.Free;
  inherited Destroy;
end;

//------------------------------------------------------------------------------

function TConfigurationService.LoadSettings(const Key: string; Settings: ISettings): boolean;
resourcestring
  sConfigurationServiceErrorReading = 'Error reading settings: %s';
var
  Msg: string;
begin
  try
    Settings.BeginUpdate;
    try
      FConfiguration.ReadObject(Root+Key, Settings.Instance);
      Result := Settings.ApplySettings;

      Settings.Changed;
    finally
      Settings.EndUpdate;
    end;
  except
    // Reset config and show error message.
    // We do this to avoid a corrupt or invalid config completely preventing a feature from working
    on E: Exception do
    begin
      Settings.ResetSettings;
      Msg := Format(sConfigurationServiceErrorReading, [E.Message]);
      MessageBox(0, PChar(Msg), nil, MB_OK or MB_ICONSTOP or MB_TASKMODAL);
      Result := False;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TConfigurationService.SaveSettings(const Key: string; Settings: ISettings);
begin
  if (Settings.PrepareSettings) then
    FConfiguration.WriteObject(Root+Key, Settings.Instance);
end;

//------------------------------------------------------------------------------

function TConfigurationService.SubKey(const SubKey: string): IConfigurationService;
var
  CheckedKey: string;
begin
  if (not SubKey.IsEmpty) and (not SubKey.EndsWith('\')) then
    CheckedKey := SubKey+'\'
  else
    CheckedKey := SubKey;

  Result := TConfigurationService.Create(RootKey, Root+CheckedKey);
end;


//------------------------------------------------------------------------------

function DefaultConfigurationServiceFactory: IConfigurationService;
begin
  Result := TConfigurationService.Create(ConfigurationServiceRegistryKey, ConfigurationServiceRegistryRoot);
end;



//------------------------------------------------------------------------------
//
//      TNullConfigurationService
//
//------------------------------------------------------------------------------
type
  TNullConfigurationService = class(TInterfacedObject, IConfigurationService)
  protected
    // IConfigurationService
    function SubKey(const SubKey: string): IConfigurationService;
    function LoadSettings(const Key: string; Settings: ISettings): boolean;
    procedure SaveSettings(const Key: string; Settings: ISettings);
  end;

//------------------------------------------------------------------------------

function TNullConfigurationService.LoadSettings(const Key: string; Settings: ISettings): boolean;
begin
  Result := False;
end;

//------------------------------------------------------------------------------

procedure TNullConfigurationService.SaveSettings(const Key: string; Settings: ISettings);
begin
end;

//------------------------------------------------------------------------------

function TNullConfigurationService.SubKey(const SubKey: string): IConfigurationService;
begin
  Result := Self;
end;

//------------------------------------------------------------------------------

function NullConfigurationServiceFactory: IConfigurationService;
begin
  Result := TNullConfigurationService.Create;
end;

//------------------------------------------------------------------------------
//
//      ConfigurationServiceFactory
//
//------------------------------------------------------------------------------
var
  FConfigurationServiceFactory: TConfigurationServiceFactory = NullConfigurationServiceFactory;

procedure RegisterConfigurationServiceFactory(Factory: TConfigurationServiceFactory);
begin
  if (Assigned(Factory)) then
    FConfigurationServiceFactory := Factory
  else
    FConfigurationServiceFactory := NullConfigurationServiceFactory;
end;


//------------------------------------------------------------------------------

function ConfigurationService: IConfigurationService;
begin
  Assert(Assigned(FConfigurationServiceFactory));
  Result := FConfigurationServiceFactory;
end;


//------------------------------------------------------------------------------
//
//      TSettingsStringList
//
//------------------------------------------------------------------------------
procedure TSettingsStringList.ApplyDefault;
begin

end;

//------------------------------------------------------------------------------

function TSettingsStringList.QueryInterface(const IID: TGUID; out Obj): HResult;
const
  E_NOINTERFACE = HResult($80004002);
begin
  if GetInterface(IID, Obj) then Result := 0 else Result := E_NOINTERFACE;
end;

//------------------------------------------------------------------------------

procedure TSettingsStringList.ReadSection(Registry: TFixedRegIniFile;
  const Key: string);
var
  Count, i: integer;
begin
  Clear;
  Count := Registry.ReadInteger(Key, 'Count', -1);
  if (Count = -1) then
    ApplyDefault
  else
    for i := 0 to Count-1 do
      Add(Registry.ReadString(Key, IntToStr(i), ''));
end;

//------------------------------------------------------------------------------

procedure TSettingsStringList.WriteSection(Registry: TFixedRegIniFile;
  const Key: string);
var
  i: integer;
begin
  Registry.WriteInteger(Key, 'Count', Count);
  for i := 0 to Count-1 do
    Registry.WriteString(Key, IntToStr(i), Strings[i]);
end;

//------------------------------------------------------------------------------

function TSettingsStringList._AddRef: Integer;
begin
  Result := -1;
end;

//------------------------------------------------------------------------------

function TSettingsStringList._Release: Integer;
begin
  Result := -1;
end;

//------------------------------------------------------------------------------

initialization
finalization
  FConfigurationServiceFactory := nil;
end.
