unit ScriptDebuggerDialogBundleBuilder;

(*
 * Copyright © 2019 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ActnList, System.Actions, ExtCtrls,
  XmlDoc,
  XMLIntf,

  DragDrop, DropTarget, DragDropFile,

  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxCustomWizardControl,
  dxWizardControl, cxButtons, ComCtrls, cxContainer, cxEdit,
  cxListView, dxSkinscxPCPainter, dxLayoutcxEditAdapters, dxLayoutContainer, cxClasses, cxTextEdit, cxMaskEdit,
  cxButtonEdit, dxLayoutControl, dxLayoutLookAndFeels, cxMemo, cxLabel, dxGDIPlusClasses, cxCheckBox,
  dxWizardControlForm,

  amDialogWizardForm;

// -----------------------------------------------------------------------------
//
// TFormBundleBuilder
//
// -----------------------------------------------------------------------------
type
  TFormBundleBuilder = class(TWizardControlForm)
    Wizard: TdxWizardControl;
    WizardControlPageStart: TdxWizardControlPage;
    ButtonBundleNew: TcxButton;
    ButtonBundleOpen: TcxButton;
    WizardControlPageManifest: TdxWizardControlPage;
    WizardControlPageFiles: TdxWizardControlPage;
    ListViewFiles: TcxListView;
    WizardControlPageBuild: TdxWizardControlPage;
    ButtonBundleBuild: TcxButton;
    DropFileTarget1: TDropFileTarget;
    LayoutControlSettings: TdxLayoutControl;
    EditPlugInID: TcxButtonEdit;
    EditPlugInName: TcxTextEdit;
    EditPlugInVersion: TcxTextEdit;
    EditPlugInURL: TcxTextEdit;
    LayoutControlSettingsGroup_Root: TdxLayoutGroup;
    LayoutControlSettingsItem3: TdxLayoutItem;
    LayoutControlSettingsItem4: TdxLayoutItem;
    LayoutGroupManifestAddIn: TdxLayoutGroup;
    LayoutControlSettingsItem17: TdxLayoutItem;
    LayoutControlSettingsItem18: TdxLayoutItem;
    dxLayoutItem1: TdxLayoutItem;
    EditProductID: TcxButtonEdit;
    LayoutGroupManifestLicense: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    EditAuthorID: TcxButtonEdit;
    dxLayoutItem3: TdxLayoutItem;
    EditAuthorURL: TcxButtonEdit;
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    dxLayoutSeparatorItem2: TdxLayoutSeparatorItem;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel;
    ActionList1: TActionList;
    ActionGenerateID: TAction;
    dxLayoutItem4: TdxLayoutItem;
    EditAuthorName: TcxTextEdit;
    ActionBuild: TAction;
    ActionProjectNew: TAction;
    OpenDialogProject: TOpenDialog;
    ActionProjectOpen: TAction;
    MemoPlugInDescription: TcxMemo;
    dxLayoutItem5: TdxLayoutItem;
    ActionGenerateProductID: TAction;
    ButtonProjectSave: TcxButton;
    ActionProjectSave: TAction;
    SaveDialogProject: TSaveDialog;
    cxButton1: TcxButton;
    ActionProjectSaveAs: TAction;
    OpenDialogFiles: TOpenDialog;
    SaveDialogBundle: TSaveDialog;
    PanelEncryptWarning: TPanel;
    ImageEncryptWarning: TImage;
    LabelEncryptWarning: TcxLabel;
    ActionMain: TAction;
    LayoutLabeledItemApiKeyWarning: TdxLayoutLabeledItem;
    LayoutGroupOptions: TdxLayoutGroup;
    CheckBoxOptionsBase64: TcxCheckBox;
    dxLayoutItem6: TdxLayoutItem;
    PopupMenuFiles: TPopupMenu;
    ActionFilesAdd: TAction;
    ActionFilesRemove: TAction;
    Addfiles1: TMenuItem;
    Removefiles1: TMenuItem;
    ActionFilesRename: TAction;
    N1: TMenuItem;
    Rename1: TMenuItem;
    ActionGenerateRandomID: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DropFileTarget1Drop(Sender: TObject; ShiftState: TShiftState; APoint: TPoint; var Effect: Integer);
    procedure WizardButtonClick(Sender: TObject; AKind: TdxWizardControlButtonKind; var AHandled: Boolean);
    procedure WizardPageChanged(Sender: TObject);
    procedure WizardPageChanging(Sender: TObject; ANewPage: TdxWizardControlCustomPage; var AAllow: Boolean);
    procedure ActionMainExecute(Sender: TObject);
    procedure ActionMainUpdate(Sender: TObject);
    procedure ActionProjectNewExecute(Sender: TObject);
    procedure ActionProjectOpenExecute(Sender: TObject);
    procedure ActionGenerateIDExecute(Sender: TObject);
    procedure ActionGenerateProductIDExecute(Sender: TObject);
    procedure ActionGenerateProductIDUpdate(Sender: TObject);
    procedure ActionBuildExecute(Sender: TObject);
    procedure ActionProjectSaveExecute(Sender: TObject);
    procedure ActionProjectSaveUpdate(Sender: TObject);
    procedure ActionProjectSaveAsExecute(Sender: TObject);
    procedure EditChange(Sender: TObject);
    procedure ListViewFilesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListViewFilesDblClick(Sender: TObject);
    procedure EditProductIDPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure ListViewFilesChange(Sender: TObject; Item: TListItem; Change: TItemChange);
    procedure ListViewFilesCustomDraw(Sender: TCustomListView; const ARect: TRect; var DefaultDraw: Boolean);
    procedure ActionFilesAddExecute(Sender: TObject);
    procedure ActionFilesRemoveExecute(Sender: TObject);
    procedure ActionFilesRemoveUpdate(Sender: TObject);
    procedure ActionFilesRenameExecute(Sender: TObject);
    procedure ActionFilesRenameUpdate(Sender: TObject);
    procedure ActionFilesAddUpdate(Sender: TObject);
    procedure ActionBuildUpdate(Sender: TObject);
    procedure EditPlugInIDPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ActionGenerateRandomIDExecute(Sender: TObject);
    procedure ActionGenerateIDUpdate(Sender: TObject);
  private
    FModified: boolean;
    FFilename: string;
    FHasFilename: boolean;
    procedure LoadProject(const Filename: string);
    procedure SaveProject(const Filename: string);
    function SaveManifest(const XMLDoc: IXMLDocument; const RootTag: string): IXMLNode;
    procedure SaveSignature(const RootElement: IXMLNode);
    function AddFile(SourceName: string; TargetName: string = ''): TListItem;
    procedure BuildBundle(const Filename: string);
    procedure DoLoadProject(const Filename: string);
    procedure CheckEncryptWarning;
    procedure RenameItem(Item: TListItem);
  protected
    function WizardGetNextPage(CurrentPage: TdxWizardControlCustomPage): TdxWizardControlCustomPage;
    function WizardGetPrevPage(CurrentPage: TdxWizardControlCustomPage): TdxWizardControlCustomPage;
    function WizardCanMoveForward(CurrentPage: TdxWizardControlCustomPage): boolean;
    procedure WizardActivatePage(CurrentPage, NewPage: TdxWizardControlCustomPage);
    function WizardNextPage: boolean;
    function WizardPrevPage: boolean;
    procedure FixAero;
  public
    function Execute(const AFilename: string = ''): boolean;
  end;

// TODO: Script*cryptStream needs implementation
procedure ScriptEncryptStream(SourceStream, TargetStream: TStream; const ProductID, AuthorID, Password: string; Base64Encode: boolean);
procedure ScriptDecryptStream(SourceStream, TargetStream: TStream);

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

implementation

{$R *.dfm}

uses
  IOUtils,
  StrUtils,
  Zip,
  ActiveX,
  IniFiles,
  ImgList,

  dxSmartImage,

  amDialogs,
  amPath,
  amInputQueryDialog,
  amMSXMLUtils,
  amEnvironment,

  amLicenseServiceAPI,

  ScriptModule,
  ScriptAPI,
  ScriptPackageAPI,
  ScriptBundleAPI,
  ScriptDebuggerSettings;

type
  TdxWizardControlCracker = class(TdxCustomWizardControl);
  TdxWizardButtonCracker = class(TdxWizardControlCustomButton);


// TODO : ImageService needs to be implemented
const
  ImageIndexHintWarning = 0;
  ImageIndexHintDone = 1;
  ImageIndexHintDeny = 2;

type
  TImageKind = (ikMessage);

  IImageService = interface
    procedure GetBitmap(Bitmap: TBitmap; Kind: TImageKind; ImageIndex: integer); overload;
    procedure GetBitmap(Bitmap: TdxCustomSmartImage; Kind: TImageKind; ImageIndex: integer); overload;
    function GetImages(Kind: TImageKind): TCustomImageList;
  end;

function ImageService: IImageService;
begin
  Result := nil;
end;

function CreateGUID: string;
var
  Guid: TGUID;
begin
  SysUtils.CreateGUID(Guid);
  Result := GUIDToString(Guid);
end;

procedure ScriptEncryptStream(SourceStream, TargetStream: TStream; const ProductID, AuthorID, Password: string; Base64Encode: boolean);
begin
end;

procedure ScriptDecryptStream(SourceStream, TargetStream: TStream);
begin
end;

// -----------------------------------------------------------------------------
//
// TFormBundleBuilder
//
// -----------------------------------------------------------------------------
procedure TFormBundleBuilder.ActionBuildUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (ListViewFiles.Items.Count <> 0);
end;

procedure TFormBundleBuilder.ActionBuildExecute(Sender: TObject);
var
  i: integer;
  ScriptCount: integer;
  MainCount: integer;
  s: string;
  Res: integer;
  Suppress: boolean;
begin
  // Verify that list of files contains exactly one "main" script file.
  ScriptCount := 0;
  MainCount := 0;
  for i := 0 to ListViewFiles.Items.Count-1 do
  begin
    s := ExtractFileName(ListViewFiles.Items[i].SubItems[1]);
    if (s <> '') and (s[1] = sScriptPackageFilenamePrefix) then
      Inc(MainCount);
    if (AnsiSameText(ExtractFileExt(s), sScriptFileType)) then
      Inc(ScriptCount);
  end;

  if (ScriptCount = 0) then
  begin
    MessageTaskDlgEx('Bundle does not contain any script files',
      'The bundle must contain at least one script file.'#13#13+
      Format('A script file is a file with the extension "%s".'#13'For example: "test%0:s"', [sScriptFileType]), mtWarning, [mbCancel]);
    exit;
  end else
  if (MainCount <> 1) then
  begin
    if (MainCount < 1) then
    begin
      if (not ScriptSettings.Dialogs.Supress.ScriptBundleBuilderMainFileMissing) then
      begin
        Suppress := False;
        Res := MessageTaskDlgEx('Bundle does not contain a "main" script file',
          Format('The main script file is identified by a name that starts with a "%s" character.'#13'For example "%0:stest%1:s"', [sScriptPackageFilenamePrefix, sScriptFileType])+#13#13+
          'If the bundle contains more than one script file it is strongly recommended that the main script file is identified as such by its name.'#13#13+
          'If the bundle does not contain a main script file then the first script file in the bundle will be executed.', mtWarning, [mbOK, mbCancel], mbCancel, Suppress);

        ScriptSettings.Dialogs.Supress.ScriptBundleBuilderMainFileMissing := Suppress;
      end else
        Res := mrOK;
    end else
    begin
      Res := MessageTaskDlgEx('Bundle contains more that one "main" script file',
        'The bundle should only contain a single main script file.'#13#13+
        Format('The main script file is identified by a name that starts with a "%s" character.'#13'For example "%0:stest%1:s"', [sScriptPackageFilenamePrefix, sScriptFileType])+#13#13+
        'If the bundle contains more than one of these files then only the first one will be executed.', mtWarning, [mbOK, mbCancel], mbCancel);
    end;

    if (Res <> mrOK) then
      exit;
  end;

  SaveDialogBundle.FileName := TPath.GetFileNameWithoutExtension(FFilename);

  if (not SaveDialogBundle.Execute(Handle)) then
    exit;

  BuildBundle(SaveDialogBundle.Filename);
end;

// -----------------------------------------------------------------------------

procedure TFormBundleBuilder.ActionFilesAddExecute(Sender: TObject);
var
  i: integer;
  ListItem: TListItem;
begin
  if (not OpenDialogFiles.Execute(Handle)) then
    exit;

  ListViewFiles.Selected := nil;
  for i := OpenDialogFiles.Files.Count-1 downto 0 do
  begin
    ListItem := AddFile(OpenDialogFiles.Files[i]);
    if (ListItem <> nil) then
      ListItem.Selected := True;
  end;
end;

procedure TFormBundleBuilder.ActionFilesAddUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (WizardControlPageFiles.Active);
end;

// -----------------------------------------------------------------------------

procedure TFormBundleBuilder.ActionFilesRemoveExecute(Sender: TObject);
var
  i: integer;
begin
  for i := ListViewFiles.Items.Count-1 downto 0 do
    if (ListViewFiles.Items[i].Selected) then
    begin
      ListViewFiles.Items[i].Free;
      FModified := True;
    end;
end;

procedure TFormBundleBuilder.ActionFilesRemoveUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (WizardControlPageFiles.Active) and (ListViewFiles.SelCount > 0);
end;

// -----------------------------------------------------------------------------

procedure TFormBundleBuilder.ActionFilesRenameExecute(Sender: TObject);
begin
  RenameItem(ListViewFiles.Selected);
end;

procedure TFormBundleBuilder.ActionFilesRenameUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (WizardControlPageFiles.Active) and (ListViewFiles.Selected <> nil);
end;

// -----------------------------------------------------------------------------

procedure TFormBundleBuilder.ActionGenerateIDExecute(Sender: TObject);
var
  Seed: integer;
  RandomValue: integer;
  s: string;
begin
  if (ScriptSettings.License.HasAPIKey) then
  begin
    // Generate a product ID based on a random seed. The generated value should not be used in production.
    Seed := UInt32(Random(MaxInt));
    s := '$'+IntToHex(Seed, 8);
    while (True) do
    begin
      if (not InputQuery('Generate Add-in ID', 'Enter seed (32 bit):', s)) then
        exit;
      if (TryStrToInt(s, Seed)) then
        break;
    end;

    s := IntToStr(Random(256));
    while (True) do
    begin
      if (not InputQuery('Generate Add-in ID', 'Enter random value (0-255):', s)) then
        exit;
      if (TryStrToInt(s, RandomValue)) and (RandomValue >= 0) and (RandomValue <= 255) then
        break;
    end;

    EditPlugInID.Text := LicenseService.FormatProductID(LicenseService.GenerateProductID(UInt32(Seed), 0, RandomValue, LicenseService.SanitizeProductID(ScriptSettings.License.APIKeyPublic)));
    EditPlugInID.ValidateEdit;
  end else
    EditPlugInID.ValidateEdit;
end;

procedure TFormBundleBuilder.ActionGenerateIDUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (ScriptSettings.License.HasAPIKey);
end;

procedure TFormBundleBuilder.ActionGenerateRandomIDExecute(Sender: TObject);
begin
  EditPlugInID.Text := CreateGuid;
  EditPlugInID.ValidateEdit;
end;

// -----------------------------------------------------------------------------

procedure TFormBundleBuilder.ActionGenerateProductIDExecute(Sender: TObject);
var
  Seed: integer;
  RandomValue: integer;
  s: string;
begin
  if (ScriptSettings.License.HasAPIKey) then
  begin
    // Generate a product ID based on a random seed. The generated value should not be used in production.
    Seed := UInt32(Random(MaxInt));
    s := '$'+IntToHex(Seed, 8);
    while (True) do
    begin
      if (not InputQuery('Generate Product ID', 'Enter seed (32 bit):', s)) then
        exit;
      if (TryStrToInt(s, Seed)) then
        break;
    end;

    s := IntToStr(Random(256));
    while (True) do
    begin
      if (not InputQuery('Generate Product ID', 'Enter random value (0-255):', s)) then
        exit;
      if (TryStrToInt(s, RandomValue)) and (RandomValue >= 0) and (RandomValue <= 255) then
        break;
    end;

    EditProductID.Text := LicenseService.FormatProductID(LicenseService.GenerateProductID(UInt32(Seed), 0, RandomValue, LicenseService.SanitizeProductID(ScriptSettings.License.APIKeyPublic)));
    EditProductID.ValidateEdit;
  end else
    EditProductID.ValidateEdit;
end;

procedure TFormBundleBuilder.ActionGenerateProductIDUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (ScriptSettings.License.HasAPIKey) and (EditAuthorID.Text <> '');
end;

// -----------------------------------------------------------------------------

procedure TFormBundleBuilder.ActionMainExecute(Sender: TObject);
begin
//
end;

procedure TFormBundleBuilder.ActionMainUpdate(Sender: TObject);
begin
  TdxWizardControlCracker(Wizard).Buttons.BeginUpdate;
  try
    Wizard.Buttons.Back.Enabled := (WizardGetPrevPage(Wizard.ActivePage) <> nil);
    Wizard.Buttons.Next.Enabled := (WizardGetNextPage(Wizard.ActivePage) <> nil) and (WizardCanMoveForward(Wizard.ActivePage));
//    Wizard.Buttons.Cancel.Enabled := (Wizard.ActivePage.PageIndex <> Wizard.PageCount-1);
  finally
    TdxWizardControlCracker(Wizard).Buttons.EndUpdate;
  end;
end;

// -----------------------------------------------------------------------------

procedure TFormBundleBuilder.ActionProjectNewExecute(Sender: TObject);
const
  sBundleBuilderNewProjectFilename = 'New bundle%s';
var
  i: integer;
  s: string;
begin
  EditPlugInID.Text := '';//CreateGuid;
  EditPlugInName.Text := '';
  EditPlugInVersion.Text := '1.0';
  EditPlugInURL.Text := '';
  if (ScriptSettings.License.HasAPIKey) then
  begin
    EditAuthorID.Text := ScriptSettings.License.APIKeyPublic;
    EditAuthorName.Text := ScriptSettings.License.APIKeyName;
    EditAuthorURL.Text := ScriptSettings.License.AuthorURL;
  end else
  begin
    EditAuthorID.Text := '';
    EditAuthorName.Text := '';
    EditAuthorURL.Text := '';
  end;
  EditProductID.Text := '';
  ListViewFiles.Items.Clear;
  FModified := False;
  Wizard.ActivePage := WizardControlPageManifest;

  // Create unique default filename
  s := '';
  i := 0;
  while (i < MaxInt) do
  begin
    FFilename := ScriptSettings.Folders.FolderScript + Format(sBundleBuilderNewProjectFilename, [s]) + sScriptBundleProjectFileType;
    if (not TFile.Exists(FFilename)) then
      break;

    Inc(i);
    s := IntToStr(i);
  end;
  FHasFilename := False;
end;

// -----------------------------------------------------------------------------

procedure TFormBundleBuilder.ActionProjectSaveAsExecute(Sender: TObject);
begin
  SaveDialogProject.InitialDir := TPath.GetDirectoryName(FFilename);
  SaveDialogProject.FileName := TPath.GetFileName(FFilename);

  if (not SaveDialogProject.Execute(Handle)) then
    exit;

  SaveProject(SaveDialogProject.FileName);

  OpenDialogProject.InitialDir := TPath.GetDirectoryName(FFilename);
  SaveDialogProject.InitialDir := OpenDialogProject.InitialDir;
  OpenDialogFiles.InitialDir := OpenDialogProject.InitialDir;
  SaveDialogBundle.InitialDir := OpenDialogProject.InitialDir;
end;

// -----------------------------------------------------------------------------

procedure TFormBundleBuilder.ActionProjectSaveExecute(Sender: TObject);
begin
  if (not FHasFilename) then
    ActionProjectSaveAs.Execute
  else
    SaveProject(FFileName);
end;

procedure TFormBundleBuilder.ActionProjectSaveUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (FFileName <> '');
end;

// -----------------------------------------------------------------------------

procedure TFormBundleBuilder.ActionProjectOpenExecute(Sender: TObject);
begin
  if (not OpenDialogProject.Execute(Handle)) then
    exit;

  DoLoadProject(OpenDialogProject.FileName);
end;

// -----------------------------------------------------------------------------

function TFormBundleBuilder.AddFile(SourceName: string; TargetName: string): TListItem;
var
  i: integer;
  FileType: string;
  ProjectFolder: string;
begin
  Result := nil;
  if (TargetName = '') then
    TargetName := TPath.GetFileName(SourceName);

  while (AnsiSameText(TargetName, sScriptBundleManifestFilename)) do
  begin
    if (MessageTaskDlgEx('Reserved filename',
      Format('The filename %s is reserved for internal use by the bundle system.'#13#13'Please use another filename.', [sScriptBundleManifestFilename]),
      mtWarning, [mbOK, mbCancel]) <> mrOK) then
      exit;

    if (not InputQueryEx('Rename file', 'Specify target filename:', TargetName)) then
      exit;
  end;

  SourceName := ExpandEnvironmentVariable(SourceName); // We'll tokenize again when we save the project
  // Make path relative to project file
  ProjectFolder := TPath.GetDirectoryName(FFilename);
  if (AnsiStartsText(ProjectFolder, SourceName)) then
    SourceName := FilenameMakeRelative(ProjectFolder, SourceName);
  if (TPath.IsRelativePath(SourceName)) then
  begin
    if (StartsStr('.\', SourceName)) then
      Delete(SourceName, 1, 2);
  end else
    SourceName := TokenizePath(SourceName);

  // Check for file already in list
  for i := 0 to ListViewFiles.Items.Count-1 do
    if (AnsiSameText(SourceName, ListViewFiles.Items[i].SubItems[0])) then
      exit;

  Result := ListViewFiles.Items.Add;
  Result.SubItems.Add(SourceName);
  Result.SubItems.Add(TargetName);

  FileType := TPath.GetExtension(TargetName);
  if (AnsiSameText(FileType, sScriptFileType)) then
  begin
    Result.SubItems.Add('Script');
    Result.Checked := True;
  end else
  if (AnsiSameText(FileType, '.png')) or (AnsiSameText(FileType, '.jpg')) or (AnsiSameText(FileType, '.bmp')) then
    Result.SubItems.Add('Image')
  else
    Result.SubItems.Add(AnsiLowerCase(Copy(FileType, 2, MaxInt)));

  // Expand filename again and check if file exists
  SourceName := ExpandEnvironmentVariable(SourceName);
  if (TPath.IsRelativePath(SourceName)) then
    SourceName := PathCombinePath(ProjectFolder,  SourceName); // Relative path is relative to project folder
  if (TFile.Exists(SourceName)) then
    Result.ImageIndex := ImageIndexHintDone
  else
    Result.ImageIndex := ImageIndexHintDeny;

  FModified := True;
end;

// -----------------------------------------------------------------------------

procedure TFormBundleBuilder.BuildBundle(const Filename: string);
var
  OutStream: TStream;
  Stream: TStream;
//  XmlStream: IStream;
  ZipFile: TZipFile;
  XMLDoc: IXMLDocument;
  RootNode: IXMLNode;
  i: integer;
  SourceStream, TargetStream: TStream;
  ProductID, AuthorID, Password: string;
  ProjectFolder: string;
  s: string;
begin
  OutStream := nil;
  try
    try

      OutStream := TFileStream.Create(Filename, fmCreate);

    except
      on E: EFCreateError do
      begin
        ShowErrorMessage('Bundle builder', 'Failed to create bundle file',
          'An error occurred creating the bundle file.'#13#13'Please make sure that the bundle isn''t running in Sigma or otherwise locked.', E.Message);
        Abort;
      end;
    end;

    ZipFile := TZipFile.Create;
    try
      ZipFile.UTF8Support := True;
      ZipFile.Comment := sScriptBundleComment;
      ZipFile.Open(OutStream, zmWrite);


      XMLDoc := TXMLDocument.Create(nil);

      RootNode := SaveManifest(XMLDoc, sScriptBundleManifestTag);
      SaveSignature(RootNode);

      Stream := TMemoryStream.Create;
      try
        XMLDoc.SaveToStream(Stream);
(*
        XmlStream := TStreamAdapter.Create(Stream, soReference);

        MSXMLTool.WriteDocumentToStream(XMLDoc, XmlStream);
        XMLDoc := nil;
*)
        Stream.Position := 0;
        ZipFile.Add(Stream, sScriptBundleManifestFilename);
      finally
        Stream.Free;
      end;

      ProductID := EditProductID.Text;
      AuthorID := EditAuthorID.Text;
      Password := '';

      ProjectFolder := TPath.GetDirectoryName(FFilename);

      for i := 0 to ListViewFiles.Items.Count-1 do
      begin
        s := ListViewFiles.Items[i].SubItems[0];
        s := ExpandEnvironmentVariable(s);
        if (TPath.IsRelativePath(s)) then
          s := PathCombinePath(ProjectFolder,  s); // Relative path is relative to project folder

        SourceStream := nil;
        try
          try
            SourceStream := TFileStream.Create(s, fmOpenRead);
          except
            on E: EFOpenError do
            begin
              ShowErrorMessage('Bundle builder', 'Failed to open source file',
                'An error occurred reading the source file:'#13+s, E.Message);
              Abort;
            end;
          end;

          if (ListViewFiles.Items[i].Checked) then
          begin
            if (Password = '') and ((ProductID = '') or (AuthorID = '')) then
            begin
              while (True) do
              begin
                if (not InputQueryEx('Encrypt source code', 'Enter password', Password)) then
                  exit;

                if (Length(Password) < 8) then
                  ShowMessage('Password too weak (min 8 chars)')
                else
                if (Length(Password) > 30) then
                  ShowMessage('Password too long (max 30 chars)')
                else
                  break;
              end;
            end;

            TargetStream := TMemoryStream.Create;
            try
              ScriptEncryptStream(SourceStream, TargetStream, ProductID, AuthorID, Password, CheckBoxOptionsBase64.Checked);
              TargetStream.Position := 0;
              ZipFile.Add(TargetStream, ListViewFiles.Items[i].SubItems[1]);
              ZipFile.FileComment[ZipFile.FileCount-1] := 'protected';
            finally
              TargetStream.Free;
            end;
          end else
          begin
            ZipFile.Add(SourceStream, ListViewFiles.Items[i].SubItems[1]);
          end;
        finally
          SourceStream.Free;
        end;
      end;

      ZipFile.Close;
    finally
      ZipFile.Free;
    end;
  finally
    OutStream.Free;
  end;
  ShowMessage('Bundle built');
end;

// -----------------------------------------------------------------------------

procedure TFormBundleBuilder.CheckEncryptWarning;
var
  ShowWarning: boolean;
  i: integer;
begin
  ShowWarning := False;

  if (not ScriptSettings.License.HasAPIKey) or (EditProductID.Text = '') then
  begin
    ShowWarning := False;
    for i := 0 to ListViewFiles.Items.Count-1 do
      if (ListViewFiles.Items[i].Checked) then
      begin
        ShowWarning := True;
        break;
      end;
  end;

  PanelEncryptWarning.Visible := ShowWarning;
end;

// -----------------------------------------------------------------------------

procedure TFormBundleBuilder.DoLoadProject(const Filename: string);
begin
  LoadProject(Filename);

  OpenDialogProject.InitialDir := TPath.GetDirectoryName(FFilename);
  SaveDialogProject.FileName := FFileName;
  SaveDialogProject.InitialDir := OpenDialogProject.InitialDir;
  OpenDialogFiles.InitialDir := OpenDialogProject.InitialDir;
  SaveDialogBundle.InitialDir := OpenDialogProject.InitialDir;

  Wizard.ActivePage := WizardControlPageManifest;
end;

procedure TFormBundleBuilder.DropFileTarget1Drop(Sender: TObject; ShiftState: TShiftState; APoint: TPoint; var Effect: Integer);
var
  i: integer;
  Filename: string;
  ListItem: TListItem;
begin
  ListViewFiles.Selected := nil;
  for i := 0 to DropFileTarget1.Files.Count-1 do
  begin
    Filename := DropFileTarget1.Files[i];

    ListItem := AddFile(Filename);
    if (ListItem <> nil) then
      ListItem.Selected := True;
  end;
end;

// -----------------------------------------------------------------------------

procedure TFormBundleBuilder.EditChange(Sender: TObject);
begin
  FModified := True;
end;

// -----------------------------------------------------------------------------

procedure TFormBundleBuilder.EditPlugInIDPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  PluginID: string;
begin
  PluginID := VarToStr(DisplayValue);

  if (PluginID <> '') and (ScriptSettings.License.HasAPIKey) and (not LicenseService.ValidateProductID(PluginID, LicenseService.SanitizeProductID(ScriptSettings.License.APIKeyPublic))) then
  begin
    ErrorText := 'The specified ID is not valid for your API key';
    Error := True;
  end;
end;

procedure TFormBundleBuilder.EditProductIDPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  ProductID: string;
begin
  ProductID := VarToStr(DisplayValue);

  if (ProductID <> '') and (not LicenseService.ValidateProductID(ProductID, LicenseService.SanitizeProductID(ScriptSettings.License.APIKeyPublic))) then
  begin
    ErrorText := 'The specified Product ID is not valid for your API key';
    Error := True;
  end;
end;

// -----------------------------------------------------------------------------

function TFormBundleBuilder.Execute(const AFilename: string): boolean;
begin
  if (AFilename <> '') then
    DoLoadProject(AFilename);

  Result := (ShowModal = mrOK);
end;

// -----------------------------------------------------------------------------

procedure TFormBundleBuilder.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  Res: integer;
begin
  if (FModified) then
  begin
    Res := MessageTaskDlgEx('Save project?', 'Your bundle project has not been saved.'#13#13'If you continue your changes will be lost.'#13#13+
      'Do you want to save the bundle project?', mtConfirmation, [mbYes, mbNo, mbCancel], mbCancel);
    if (Res = mrNo) then
      CanClose := True
    else
    if (Res = mrYes) then
    begin
      if (FFilename <> '') and (FHasFilename) then
      begin
        SaveProject(FFileName);
        CanClose := True;
      end else
      if (SaveDialogProject.Execute(Handle)) then
      begin
        SaveProject(SaveDialogProject.FileName);
        CanClose := True;
      end else
        CanClose := False;
    end else
      CanClose := False;
  end else
    CanClose := True;
end;

// -----------------------------------------------------------------------------

procedure TFormBundleBuilder.FormCreate(Sender: TObject);
begin
  if (ScriptSettings.Folders.FolderBundle <> '') then
    OpenDialogProject.InitialDir := ScriptSettings.Folders.FolderBundle
  else
    OpenDialogProject.InitialDir := ScriptSettings.Folders.FolderScript;
  SaveDialogProject.InitialDir := OpenDialogProject.InitialDir;
  OpenDialogFiles.InitialDir := OpenDialogProject.InitialDir;
  SaveDialogBundle.InitialDir := OpenDialogProject.InitialDir;

  if (ScriptSettings.License.HasAPIKey) then
  begin
    EditAuthorID.Text := ScriptSettings.License.APIKeyPublic;
    EditAuthorName.Text := ScriptSettings.License.APIKeyName;
    EditAuthorURL.Text := ScriptSettings.License.AuthorURL;
  end;
  ImageService.GetBitmap(ImageEncryptWarning.Picture.Bitmap, ikMessage, ImageIndexHintWarning);
  ImageService.GetBitmap(LayoutLabeledItemApiKeyWarning.CaptionOptions.Glyph, ikMessage, ImageIndexHintWarning);
  ListViewFiles.SmallImages := ImageService.GetImages(ikMessage);
  FModified := False;
end;

procedure TFormBundleBuilder.FormDestroy(Sender: TObject);
begin
  ScriptSettings.Folders.FolderBundle := OpenDialogProject.InitialDir;
end;

procedure TFormBundleBuilder.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_F1) and (ssAlt in Shift) then
  begin
    EditPlugInID.Properties.Buttons[0].Visible := True;
    EditProductID.Properties.Buttons[0].Visible := True;
  end;
end;

// -----------------------------------------------------------------------------

procedure TFormBundleBuilder.ListViewFilesChange(Sender: TObject; Item: TListItem; Change: TItemChange);
begin
  if (Change <> ctState) or (Item = nil) then
    exit;

  CheckEncryptWarning;
end;

// -----------------------------------------------------------------------------

procedure TFormBundleBuilder.ListViewFilesCustomDraw(Sender: TCustomListView; const ARect: TRect; var DefaultDraw: Boolean);
const
  sBundleBuilderAddFilesHelp = 'Press [Ins] or drag files onto here to add files to the bundle.';
var
  r: TRect;
  s: string;
begin
  if (Sender.Items.Count > 0) then
    exit;

  Sender.Canvas.Font.Color := clGrayText;
  Sender.Canvas.Refresh;


  s := sBundleBuilderAddFilesHelp;
  UniqueString(s);
  r := ARect;
  Dec(r.Right, 16);
  Dec(r.Bottom, 16);
  // Find height of text
  Sender.Canvas.TextRect(r, s, [tfNoPrefix, tfWordBreak, tfCalcRect]);

  // Center text
  OffsetRect(r, (ARect.Right-ARect.Left-r.Right+r.Left) div 2, (ARect.Bottom-ARect.Top-r.Bottom+r.Top) div 2);
  Sender.Canvas.TextRect(r, s, [tfNoPrefix, tfWordBreak]);
end;

// -----------------------------------------------------------------------------

procedure TFormBundleBuilder.ListViewFilesDblClick(Sender: TObject);
begin
  if (ListViewFiles.Selected <> nil) then
    RenameItem(ListViewFiles.Selected);
end;

// -----------------------------------------------------------------------------

procedure TFormBundleBuilder.ListViewFilesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  procedure MoveItem(const FromIndex, ToIndex: Integer);
  var
    Item: TListItem;
    Selected: boolean;
    Focused: boolean;
    Checked: boolean;
    CheckedList: array of boolean;
    i: integer;
  begin
    ListViewFiles.Items.BeginUpdate;
    try
      SetLength(CheckedList, ListViewFiles.Items.Count);
      for i := 0 to ListViewFiles.Items.Count-1 do
        CheckedList[i] := ListViewFiles.Items.Item[i].Checked;
      Checked := CheckedList[FromIndex];
      CheckedList[FromIndex] := CheckedList[ToIndex];
      CheckedList[ToIndex] := Checked;
      Item := TListItem.Create(ListViewFiles.Items);
      try
        Item.Assign(ListViewFiles.Items.Item[FromIndex]);
        Selected := ListViewFiles.Items.Item[FromIndex].Selected;
        Focused := ListViewFiles.Items.Item[FromIndex].Focused;

        ListViewFiles.Items.Item[FromIndex].Assign(ListViewFiles.Items.Item[ToIndex]);
        ListViewFiles.Items.Item[FromIndex].Selected := ListViewFiles.Items.Item[ToIndex].Selected;
        ListViewFiles.Items.Item[FromIndex].Focused := ListViewFiles.Items.Item[ToIndex].Focused;

        ListViewFiles.Items.Item[ToIndex].Assign(Item);
        ListViewFiles.Items.Item[ToIndex].Selected := Selected;
        ListViewFiles.Items.Item[ToIndex].Focused := Focused;
      finally
        Item.Free;
      end;
      if (ListViewFiles.Items.Item[FromIndex].Focused) then
        ListViewFiles.Items.Item[FromIndex].MakeVisible(False);
      if (ListViewFiles.Items.Item[ToIndex].Focused) then
        ListViewFiles.Items.Item[ToIndex].MakeVisible(False);
      for i := 0 to ListViewFiles.Items.Count-1 do
        ListViewFiles.Items.Item[i].Checked := CheckedList[i];
    finally
      ListViewFiles.Items.EndUpdate
    end;
  end;

var
  i: integer;
begin
  case Key of
    VK_UP:
      if (ssCtrl in Shift) then
      begin
        Key := 0;
        if (ListViewFiles.Items.Count > 0) and (not ListViewFiles.Items[0].Selected) then
          for i := 1 to ListViewFiles.Items.Count-1 do
            if (ListViewFiles.Items[i].Selected) then
            begin
              MoveItem(i, i-1);
              FModified := True;
            end;
      end;

    VK_DOWN:
      if (ssCtrl in Shift) then
      begin
        Key := 0;
        if (ListViewFiles.Items.Count > 0) and (not ListViewFiles.Items[ListViewFiles.Items.Count-1].Selected) then
          for i := ListViewFiles.Items.Count-2 downto 0 do
            if (ListViewFiles.Items[i].Selected) then
            begin
              MoveItem(i, i+1);
              FModified := True;
            end;
      end;
  end;
end;

// -----------------------------------------------------------------------------

procedure TFormBundleBuilder.LoadProject(const Filename: string);

  procedure Error(const Msg, Cause: string);
  begin
    ShowErrorMessage('Bundle builder', Msg, Cause);
    Abort;
  end;

var
  XMLDoc: IXMLDocument;
  RootNode: IXMLNode;
  OptionsNode: IXMLNode;
  FilesNode: IXMLNode;
  FileNode: IXMLNode;
  SourceName, TargetName: string;
  ListItem: TListItem;
begin
  FFilename := Filename;
  FHasFilename := True;

  XMLDoc := TXMLDocument.Create(nil);

  XMLDoc.LoadFromFile(Filename);

  RootNode := XMLDoc.DocumentElement;
  if (RootNode = nil) or (RootNode.NodeName <> sScriptBundleManifestTag) then
    Error('Invalid bundle project format', 'root element not found');

  if (StrToIntDef(VarToStr(RootNode.Attributes['version']), 0) > cScriptBundleManifestVersion) then
    Error('Invalid bundle project format', 'Unsupported bundle project version');

  EditPlugInID.Text := VarToStr(RootNode.ChildValues['id']);
  EditPlugInName.Text := VarToStr(RootNode.ChildValues['name']);
  EditPlugInVersion.Text := VarToStr(RootNode.ChildValues['version']);
  MemoPlugInDescription.Text := VarToStr(RootNode.ChildValues['description']);
  EditPlugInURL.Text := VarToStr(RootNode.ChildValues['url']);

  EditProductID.Text := VarToStr(RootNode.ChildValues['productID']);

  OptionsNode := RootNode.ChildNodes.FindNode('options');
  if (OptionsNode <> nil) then
  begin
    CheckBoxOptionsBase64.Checked := (VarToStr(OptionsNode.ChildValues['encoding']) = 'base64');
  end;

  FilesNode := RootNode.ChildNodes.FindNode('files');
  if (FilesNode = nil) then
    Error('Invalid bundle project format', 'Files collection not found');

  FileNode := FilesNode.ChildNodes.First;

  ListViewFiles.Items.BeginUpdate;
  try
    ListViewFiles.Items.Clear;

    while (FileNode <> nil) do
    begin
      if (FileNode.NodeName <> 'file') then
      begin
        SourceName := VarToStr(FileNode.ChildValues['source']);
        if (SourceName = '') then
          continue;

        TargetName := VarToStr(FileNode.ChildValues['target']);

        ListItem := AddFile(SourceName, TargetName);
        if (ListItem <> nil) then
          ListItem.Checked := StrToBoolDef(VarToStr(FileNode.ChildValues['encrypt']), ListItem.Checked);
      end;
      FileNode := FileNode.NextSibling;
    end;
  finally
    ListViewFiles.Items.EndUpdate;
  end;

  FModified := False;
end;

// -----------------------------------------------------------------------------

procedure TFormBundleBuilder.RenameItem(Item: TListItem);
var
  s: string;
  i: integer;
  Duplicate: boolean;
begin
  Duplicate := True;
  while (Duplicate) do
  begin
    s := Item.SubItems[1];
    if (not InputQueryEx('Rename file', 'Specify target filename:', s)) then
      exit;

    if (AnsiSameText(s, sScriptBundleManifestFilename)) then
    begin
      if (MessageTaskDlgEx('Reserved filename',
        Format('The filename %s is reserved for internal use by the bundle system.'#13#13'Please use another filename.', [sScriptBundleManifestFilename]),
        mtWarning, [mbOK, mbCancel]) <> mrOK) then
        exit;
      continue;
    end;

    Duplicate := False;
    for i := 0 to ListViewFiles.Items.Count-1 do
      if (ListViewFiles.Items[i] <> Item) and (AnsiSameText(s, Item.SubItems[1])) then
      begin
        if (MessageTaskDlgEx('Duplicate filename',
          'A file with the specified name already exist.'#13#13'Please enter a unique name',
          mtWarning, [mbOK, mbCancel]) <> mrOK) then
          exit;
        Duplicate := True;
        break;
      end;
  end;

  Item.SubItems[1] := s;
  FModified := True;
end;

// -----------------------------------------------------------------------------

function TFormBundleBuilder.SaveManifest(const XMLDoc: IXMLDocument; const RootTag: string): IXMLNode;
begin
  Result := XMLDoc.AddChild(RootTag);

  Result.Attributes['version'] := cScriptBundleManifestVersion;

  Result.AddChild('id').NodeValue := EditPlugInID.Text;
  Result.AddChild('name').NodeValue := EditPlugInName.Text;
  Result.AddChild('version').NodeValue := EditPlugInVersion.Text;
  Result.AddChild('description').NodeValue := MemoPlugInDescription.Text;
  Result.AddChild('url').NodeValue := EditPlugInURL.Text;

  Result.AddChild('authorID').NodeValue := ScriptSettings.License.APIKeyPublic;
  Result.AddChild('authorName').NodeValue := ScriptSettings.License.APIKeyName;
  Result.AddChild('authorURL').NodeValue := ScriptSettings.License.AuthorURL;

  Result.AddChild('productID').NodeValue := EditProductID.Text;
end;

// -----------------------------------------------------------------------------

procedure TFormBundleBuilder.SaveProject(const Filename: string);
var
  XMLDoc: IXMLDocument;
  RootNode: IXMLNode;
  i: integer;
  OptionsNode: IXMLNode;
  FilesNode: IXMLNode;
  FileNode: IXMLNode;
  ProjectFolder: string;
  SourceName: string;
begin
  XMLDoc := TXMLDocument.Create(nil);

  RootNode := SaveManifest(XMLDoc, sScriptBundleManifestTag);

  OptionsNode := RootNode.AddChild('options');

  if (CheckBoxOptionsBase64.Checked) then
    RootNode.AddChild('encoding').NodeValue := 'base64';

  FilesNode := RootNode.AddChild('files');

  ProjectFolder := TPath.GetDirectoryName(Filename);

  for i := 0 to ListViewFiles.Items.Count-1 do
  begin
    FileNode := FilesNode.AddChild('file');

    SourceName := ListViewFiles.Items[i].SubItems[0];
    // Make path relative to project file
    if (AnsiStartsText(ProjectFolder, SourceName)) then
    begin
      SourceName := FilenameMakeRelative(ProjectFolder, SourceName);
      if (TPath.IsRelativePath(SourceName)) then
      begin
        if (StartsStr('.\', SourceName)) then
          Delete(SourceName, 1, 2);
      end;
    end else
      SourceName := TokenizePath(SourceName);

    FileNode.AddChild('source').NodeValue := SourceName;
    RootNode.AddChild('target').NodeValue := ListViewFiles.Items[i].SubItems[1];
    RootNode.AddChild('encrypt').NodeValue := ListViewFiles.Items[i].Checked;
  end;

  TDirectory.CreateDirectory(TPath.GetDirectoryName(Filename));
  XMLDoc.SaveToFile(Filename);
  // TDatabasePersistenceMSXML.WriteDocumentToFile(XMLDoc, Filename);

  FFilename := Filename;
  FHasFilename := True;
  FModified := False;
end;

// -----------------------------------------------------------------------------

procedure TFormBundleBuilder.SaveSignature(const RootElement: IXMLNode);
var
  Signature: string;
begin
  Signature := '';
  if (Signature <> '') then
    RootElement.AddChild('signature').NodeValue := Signature;
end;

// -----------------------------------------------------------------------------

procedure TFormBundleBuilder.WizardActivatePage(CurrentPage, NewPage: TdxWizardControlCustomPage);
begin
  if (NewPage = WizardControlPageStart) then
  begin
    TdxWizardButtonCracker(Wizard.Buttons.Next).Visible := False;
    FixAero;
    FModified := False;
  end else
  if (CurrentPage = WizardControlPageStart) then
  begin
    TdxWizardButtonCracker(Wizard.Buttons.Next).Visible := True;
    FixAero;
  end;

  if (NewPage = WizardControlPageManifest) then
  begin
    LayoutLabeledItemApiKeyWarning.Visible := (not ScriptSettings.License.HasAPIKey);
    EditProductID.Enabled := ScriptSettings.License.HasAPIKey;
    EditProductID.ValidateEdit(False);
  end else
  if (NewPage = WizardControlPageFiles) then
  begin
    CheckEncryptWarning;
  end;
end;

function TFormBundleBuilder.WizardCanMoveForward(CurrentPage: TdxWizardControlCustomPage): boolean;
var
  Page: TdxWizardControlCustomPage;
begin
  if (CurrentPage = WizardControlPageManifest) then
  begin
    if (EditPlugInID.Text = '') then
      Exit(False);
  end;

  Page := WizardGetNextPage(CurrentPage);
  Result := (Page <> nil);
end;

function TFormBundleBuilder.WizardGetNextPage(CurrentPage: TdxWizardControlCustomPage): TdxWizardControlCustomPage;
begin
  if (CurrentPage = WizardControlPageStart) then
    Result := nil
  else
  if (CurrentPage <> nil) and (CurrentPage.PageIndex < Wizard.PageCount-1) then
    Result := Wizard.Pages[CurrentPage.PageIndex+1]
  else
    Result := Wizard.Pages[0];
end;

function TFormBundleBuilder.WizardGetPrevPage(CurrentPage: TdxWizardControlCustomPage): TdxWizardControlCustomPage;
begin
  if (CurrentPage <> nil) and (CurrentPage.PageIndex > 0) then
    Result := Wizard.Pages[CurrentPage.PageIndex-1]
  else
    Result := nil;
end;

function TFormBundleBuilder.WizardNextPage: boolean;
var
  Page: TdxWizardControlCustomPage;
begin
  Page := WizardGetNextPage(Wizard.ActivePage);

  Result := (Page <> nil);
  if (Result) then
    Page.Activate;
end;

function TFormBundleBuilder.WizardPrevPage: boolean;
var
  Page: TdxWizardControlCustomPage;
begin
  Page := WizardGetPrevPage(Wizard.ActivePage);
  Result := (Page <> nil);
  if (Result) then
    Page.Activate;
end;

procedure TFormBundleBuilder.FixAero;
begin
//
end;

// -----------------------------------------------------------------------------

procedure TFormBundleBuilder.WizardButtonClick(Sender: TObject; AKind: TdxWizardControlButtonKind; var AHandled: Boolean);
begin
  if (AKind = wcbkBack) then
  begin
    WizardPrevPage;
    AHandled := True;
  end else
  if (AKind = wcbkNext) then
  begin
    WizardNextPage;
    AHandled := True;
  end else
  if (AKind = wcbkCancel) then
  begin
    ModalResult := mrCancel;
    AHandled := True;
  end else
  if (AKind = wcbkFinish) then
  begin
    ModalResult := mrOK;
    AHandled := True;
  end else
  if (AKind = wcbkHelp) then
  begin
    AHandled := True;
    if (HelpType = htContext) then
      Application.HelpContext(HelpContext)
    else
    if (not Application.HelpKeyword(HelpKeyword)) then
      Application.HelpJump(HelpKeyword);
  end;
end;

// -----------------------------------------------------------------------------

procedure TFormBundleBuilder.WizardPageChanged(Sender: TObject);
begin
  if (Wizard.ActivePage = WizardControlPageManifest) then
  begin
    ActiveControl := LayoutControlSettings;
  end else
  if (Wizard.ActivePage = WizardControlPageFiles) then
  begin
    ActiveControl := ListViewFiles;
  end;
end;

procedure TFormBundleBuilder.WizardPageChanging(Sender: TObject; ANewPage: TdxWizardControlCustomPage; var AAllow: Boolean);
begin
  if (ANewPage = WizardControlPageStart) and (FModified) then
    // Misuse CloseQuery logic:
    FormCloseQuery(Self, AAllow);

  if (AAllow) then
    WizardActivatePage(TdxWizardControl(Sender).ActivePage, ANewPage);
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

end.

