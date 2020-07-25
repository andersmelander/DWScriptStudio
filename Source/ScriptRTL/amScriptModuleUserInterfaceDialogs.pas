unit amScriptModuleUserInterfaceDialogs;

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

  dxLayoutLookAndFeels, cxClasses,

  dwsComp,
  dwsExprs,
  dwsCompiler,
  dwsClassesLibModule,

  amScriptModule;

// -----------------------------------------------------------------------------
//
// TDataModuleScriptUserInterfaceDialogs
//
// -----------------------------------------------------------------------------
type
  TDataModule = class(TScriptModule);

  TDataModuleScriptUserInterfaceDialogs = class(TDataModule)
    dwsUnitDialogs: TdwsUnit;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    procedure dwsUnitDialogsFunctionsShowMessageEval(info: TProgramInfo);
    procedure dwsUnitDialogsFunctionsInputBoxEval(info: TProgramInfo);
    procedure dwsUnitDialogsFunctionsInputQueryEval(info: TProgramInfo);
    procedure dwsUnitDialogsFunctionsMessageTaskDlg1Eval(info: TProgramInfo);
    procedure dwsUnitDialogsFunctionsMessageTaskDlg2Eval(info: TProgramInfo);
    procedure dwsUnitDialogsFunctionsMessageDlg1Eval(info: TProgramInfo);
    procedure dwsUnitDialogsFunctionsMessageDlg2Eval(info: TProgramInfo);
    procedure dwsUnitDialogsFunctionsPromptForFileNameEval(info: TProgramInfo);
    procedure dwsUnitDialogsClassesTTaskDialogConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogCleanUp(ExternalObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsGetTitleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsSetTitleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsGetInstructionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsSetInstructionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsGetContentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsSetContentEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsGetInfoEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsSetInfoEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsGetFooterEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsSetFooterEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsGetVerifyEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsSetVerifyEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsGetVerifyCheckedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsSetVerifyCheckedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsGetWidthEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsSetWidthEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsGetOptionsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsSetOptionsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsGetButtonsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsGetCommonButtonsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsSetCommonButtonsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsGetInfoExpandButtonCaptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsSetInfoExpandButtonCaptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsGetInfoCollapseButtonCaptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsSetInfoCollapseButtonCaptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsExecuteEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogButtonsMethodsAddEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogButtonsMethodsGetButtonEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogButtonMethodsGetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogButtonMethodsSetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogButtonMethodsGetHintEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogButtonMethodsSetHintEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogButtonMethodsGetModalResultEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogButtonMethodsGetDefaultEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogButtonMethodsSetDefaultEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsGetFooterIconEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsSetFooterIconEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsGetDialogIconEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTTaskDialogMethodsSetDialogIconEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTDialogConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitDialogsClassesTDialogMethodsGetTitleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTDialogMethodsSetTitleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTDialogMethodsGetMinorTitleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTDialogMethodsSetMinorTitleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTDialogMethodsGetActionListEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTDialogMethodsGetActionOKEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTDialogMethodsGetActionCancelEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTDialogMethodsGetContainerEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTDialogMethodsExecuteEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTDialogMethodsGetModernStyleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTDialogMethodsSetModernStyleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTDialogMethodsSetOnAfterShowEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsClassesTDialogMethodsGetButtonContainerEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitDialogsFunctionsSelectDirectory1Eval(info: TProgramInfo);
    procedure dwsUnitDialogsFunctionsSelectDirectory2Eval(info: TProgramInfo);
  private
    procedure OnAfterShowHandler(Sender: TObject); // TDialog
  public
  end;

implementation

{$R *.dfm}

uses
  Forms,
  Windows,
  Dialogs,
  Variants,
  FileCtrl,
  StrUtils,
  Vcl.Consts,
  IOUtils,

  SynTaskDialog,

  amPath,
  amDialogs,
  amDialogForm,
  amInputQueryDialog,

{$ifndef OLD_DWSCRIPT}
  dwsInfo,
{$endif OLD_DWSCRIPT}

  amScriptModuleClasses,
  amScriptModuleUserInterfaceActionList;


// -----------------------------------------------------------------------------
//
// TDataModuleScriptUserInterfaceDialogs
//
// -----------------------------------------------------------------------------
function PromptForFileName(var AFileName: string; const AFilter: string = ''; const ADefaultExt: string = ''; const ATitle: string = '';
  const AInitialDir: string = ''; SaveDialog: Boolean = False): Boolean;
var
  OpenDialog: Dialogs.TOpenDialog;
  Filename: string;
  Folder: string;
  Filter: string;
begin
  Filename := AFilename;

  if SaveDialog then
    OpenDialog := TSaveDialog.Create(nil)
  else
    OpenDialog := TOpenDialog.Create(nil);
  try
    if SaveDialog then
      OpenDialog.Options := OpenDialog.Options + [ofOverwritePrompt]
    else
      OpenDialog.Options := OpenDialog.Options + [ofFileMustExist];
    OpenDialog.Options := OpenDialog.Options + [ofHideReadOnly, ofEnableSizing];
    OpenDialog.DefaultExt := ADefaultExt;
    OpenDialog.Title := ATitle;

    if (AFilter <> '') then
      Filter := AFilter
    else
      Filter := SDefaultFilter;
    OpenDialog.Filter := Filter;

    if (AInitialDir <> '') then
      Folder := AInitialDir
    else
      Folder := ExtractFilePath(Filename);

    if (Folder <> '') and (TDirectory.Exists(Folder)) then
    begin
      OpenDialog.InitialDir := Folder;
      Filename := ExtractFileName(Filename);
    end;

    OpenDialog.FileName := Filename;

    Result := OpenDialog.Execute(Application.MainForm.Handle);

    if (Result) then
      AFilename := OpenDialog.FileName;

  finally
    OpenDialog.Free;
  end;
end;

// -----------------------------------------------------------------------------
//
// TDataModuleScriptUserInterfaceDialogs
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsFunctionsInputBoxEval(info: TProgramInfo);
begin
  Info.ResultAsString := InputBoxEx(Info.ParamAsString[0], Info.ParamAsString[1], Info.ParamAsString[2]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsFunctionsInputQueryEval(info: TProgramInfo);
var
  Value: string;
begin
  Value := Info.ParamAsString[2];
  Info.ResultAsBoolean := InputQueryEx(Info.ParamAsString[0], Info.ParamAsString[1], Value);
  Info.ParamAsString[2] := Value;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsFunctionsMessageDlg1Eval(info: TProgramInfo);
begin
  Info.ResultAsInteger := MessageDlgEx(Info.ParamAsString[0], TMsgDlgType(Info.ParamAsInteger[1]), TMsgDlgButtons(Word(Info.ParamAsInteger[2])), -1);
end;

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsFunctionsMessageDlg2Eval(info: TProgramInfo);
begin
  Info.ResultAsInteger := MessageDlgEx(Info.ParamAsString[0], TMsgDlgType(Info.ParamAsInteger[1]), TMsgDlgButtons(Word(Info.ParamAsInteger[2])), -1, TMsgDlgBtn(Info.ParamAsInteger[3]));
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsFunctionsMessageTaskDlg1Eval(info: TProgramInfo);
begin
  Info.ResultAsInteger := MessageTaskDlgEx(Info.ParamAsString[0], Info.ParamAsString[1], TMsgDlgType(Info.ParamAsInteger[2]), TMsgDlgButtons(Word(Info.ParamAsInteger[3])));
end;

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsFunctionsMessageTaskDlg2Eval(info: TProgramInfo);
begin
  Info.ResultAsInteger := MessageTaskDlgEx(Info.ParamAsString[0], Info.ParamAsString[1], TMsgDlgType(Info.ParamAsInteger[2]), TMsgDlgButtons(Word(Info.ParamAsInteger[3])), TMsgDlgBtn(Info.ParamAsInteger[4]));
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsFunctionsPromptForFileNameEval(info: TProgramInfo);
var
  Filename: string;
begin
  Filename := Info.ParamAsString[0];
  Info.ResultAsBoolean := PromptForFileName(Filename, Info.ParamAsString[1], Info.ParamAsString[2], Info.ParamAsString[3], Info.ParamAsString[4], Info.ParamAsBoolean[5]);
  Info.ParamAsString[0] := Filename;
end;

// -----------------------------------------------------------------------------
(*
var Folder := Shell.ExpandPath('%app_install%\Configurations\Script');
if (SelectDirectory('Select folder', Folder)) then
  ShowMessage('Folder: "'+Folder+'"');


var Root := Shell.ExpandPath('%app_install%');
Folder := 'Configurations\Script';
if (SelectDirectory('Select folder', Root, Folder)) then
  ShowMessage('Folder: "'+Folder+'"');
*)
function ScriptSelectDirectory(const Caption: string; const Root: string; var Directory: string): boolean;
var
  FileOpenDialog: TFileOpenDialog;
  RootFolder: string;
begin
  Directory := ExcludeTrailingPathDelimiter(Directory);

  if (CheckWin32Version(6, 0)) then
  begin
    if (Root <> '') then
    begin
      if (Directory <> '') then
      begin
        if (PathIsRelative(Directory)) then
          Directory := PathCombinePath(Root, Directory);
      end else
        Directory := Root;
    end;

    RootFolder := ExtractFilePath(Directory);
    Directory := ExtractFileName(Directory);

    // Select folder using IFileDialog on Vista+
    FileOpenDialog := TFileOpenDialog.Create(nil);
    try
      FileOpenDialog.Title := Caption;
      FileOpenDialog.Options := [fdoPickFolders, fdoForceFileSystem, fdoPathMustExist];
      FileOpenDialog.DefaultFolder := RootFolder;
      FileOpenDialog.FileName := Directory;
      Result := FileOpenDialog.Execute(Application.Handle);
      if (Result) then
        Directory := FileOpenDialog.FileName;
    finally
      FileOpenDialog.Free;
    end;
  end else
  begin
    // Select folder using SHBrowseForFolder on XP
    Result := SelectDirectory(Caption,
      ExcludeTrailingPathDelimiter(Root), Directory,
      [sdNewFolder, sdShowEdit, sdShowShares, sdNewUI, sdValidateDir]);
  end;
end;

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsFunctionsSelectDirectory1Eval(info: TProgramInfo);
var
  Caption, Root, Directory: string;
begin
  Caption := Info.ParamAsString[0];
  Root := Info.ParamAsString[1];
  Directory := Info.ParamAsString[2];

  Info.ResultAsBoolean := ScriptSelectDirectory(Caption, Root, Directory);

  Info.ParamAsString[2] := Directory;
end;

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsFunctionsSelectDirectory2Eval(info: TProgramInfo);
var
  Caption, Directory: string;
begin
  Caption := Info.ParamAsString[0];
  Directory := Info.ParamAsString[1];

  Info.ResultAsBoolean := ScriptSelectDirectory(Caption, '', Directory);

  Info.ParamAsString[1] := Directory;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsFunctionsShowMessageEval(info: TProgramInfo);
begin
  ShowMessage(Info.ParamAsString[0]);
end;

// -----------------------------------------------------------------------------
//
// TTaskDialog
//
// -----------------------------------------------------------------------------
type
  TScriptTaskDialogButton = class(TCollectionItem)
  private
    FHint: string;
    FCaption: string;
    FDefault: boolean;
  protected
    function GetModalResult: integer;
    procedure SetDefault(const Value: boolean);
  public
    property Caption: string read FCaption write FCaption;
    property Hint: string read FHint write FHint;
    property Default: boolean read FDefault write SetDefault;
    property ModalResult: integer read GetModalResult;
  end;

  TScriptTaskDialogButtons = class(TCollection)
  private
    function GetButton(Index: integer): TScriptTaskDialogButton;
  public
    property Buttons[Index: integer]: TScriptTaskDialogButton read GetButton; default;
  end;

  TScriptTaskDialog = class
  private
    FButtons: TScriptTaskDialogButtons;
  protected
    TaskDialog: TTaskDialogEx;
  public
    constructor Create;
    destructor Destroy; override;
    property Buttons: TScriptTaskDialogButtons read FButtons;
  end;

function TScriptTaskDialogButton.GetModalResult: integer;
begin
  Result := 100 + Index;
end;

procedure TScriptTaskDialogButton.SetDefault(const Value: boolean);
var
  i: integer;
begin
  if (Value = FDefault) then
    exit;

  if (Value) then
    for i := 0 to TScriptTaskDialogButtons(Collection).Count-1 do
      if (TScriptTaskDialogButtons(Collection).Buttons[i].Default) then
      begin
        TScriptTaskDialogButtons(Collection).Buttons[i].Default := False;
        break;
      end;
  FDefault := Value;
end;

function TScriptTaskDialogButtons.GetButton(Index: integer): TScriptTaskDialogButton;
begin
  Result := TScriptTaskDialogButton(Items[Index]);
end;

constructor TScriptTaskDialog.Create;
begin
  ZeroMemory(@TaskDialog, SizeOf(TaskDialog));
  FButtons := TScriptTaskDialogButtons.Create(TScriptTaskDialogButton);
end;

destructor TScriptTaskDialog.Destroy;
begin
  FButtons.Free;
  inherited;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogButtonMethodsGetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TScriptTaskDialogButton(ExtObject).Caption;
end;

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogButtonMethodsSetCaptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptTaskDialogButton(ExtObject).Caption := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogButtonMethodsGetDefaultEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TScriptTaskDialogButton(ExtObject).Default;
end;

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogButtonMethodsSetDefaultEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptTaskDialogButton(ExtObject).Default := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogButtonMethodsGetHintEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TScriptTaskDialogButton(ExtObject).Hint;
end;

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogButtonMethodsSetHintEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptTaskDialogButton(ExtObject).Hint := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogButtonMethodsGetModalResultEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TScriptTaskDialogButton(ExtObject).ModalResult;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogButtonsMethodsAddEval(Info: TProgramInfo; ExtObject: TObject);
var
  Button: TCollectionItem;
begin
  Button := TScriptTaskDialogButtons(ExtObject).Add;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Button);
end;

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogButtonsMethodsGetButtonEval(Info: TProgramInfo; ExtObject: TObject);
var
  Button: TCollectionItem;
begin
  Button := TScriptTaskDialogButtons(ExtObject).Buttons[Info.ParamAsInteger[0]];
  Info.ResultAsVariant := CreateResultScriptObject(Info, Button);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogCleanUp(ExternalObject: TObject);
begin
  ExternalObject.Free;
end;

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TScriptTaskDialog.Create;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsGetTitleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TScriptTaskDialog(ExtObject).TaskDialog.Base.Title;
end;

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsSetTitleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptTaskDialog(ExtObject).TaskDialog.Base.Title := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsGetInstructionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TScriptTaskDialog(ExtObject).TaskDialog.Base.Inst;
end;

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsSetInstructionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptTaskDialog(ExtObject).TaskDialog.Base.Inst := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsGetContentEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TScriptTaskDialog(ExtObject).TaskDialog.Base.Content;
end;

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsSetContentEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptTaskDialog(ExtObject).TaskDialog.Base.Content := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsGetDialogIconEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TScriptTaskDialog(ExtObject).TaskDialog.DialogIcon);
end;

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsSetDialogIconEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptTaskDialog(ExtObject).TaskDialog.DialogIcon := TTaskDialogIcon(Info.ParamAsInteger[0]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsGetInfoEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TScriptTaskDialog(ExtObject).TaskDialog.Base.Info;
end;

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsSetInfoEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptTaskDialog(ExtObject).TaskDialog.Base.Info := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsGetFooterEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TScriptTaskDialog(ExtObject).TaskDialog.Base.Footer;
end;

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsSetFooterEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptTaskDialog(ExtObject).TaskDialog.Base.Footer := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsGetFooterIconEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TScriptTaskDialog(ExtObject).TaskDialog.FooterIcon);
end;

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsSetFooterIconEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptTaskDialog(ExtObject).TaskDialog.FooterIcon := TTaskDialogFooterIcon(Info.ParamAsInteger[0]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsGetVerifyEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TScriptTaskDialog(ExtObject).TaskDialog.Base.Verify;
end;

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsSetVerifyEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptTaskDialog(ExtObject).TaskDialog.Base.Verify := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsGetVerifyCheckedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TScriptTaskDialog(ExtObject).TaskDialog.Base.VerifyChecked;
end;

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsSetVerifyCheckedEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptTaskDialog(ExtObject).TaskDialog.Base.VerifyChecked := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsGetWidthEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TScriptTaskDialog(ExtObject).TaskDialog.Width;
end;

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsSetWidthEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptTaskDialog(ExtObject).TaskDialog.Width := Info.ParamAsInteger[0];
end;

// -----------------------------------------------------------------------------

const
  FlagMap: array[TTaskDialogFlag] of integer = (0, 1, 2, 4, 8, 16, 32, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsGetOptionsEval(Info: TProgramInfo; ExtObject: TObject);
var
  Flag: TTaskDialogFlag;
  Flags: TTaskDialogFlags;
  Value: integer;
begin
  Value := 0;
  Flags := TScriptTaskDialog(ExtObject).TaskDialog.Flags;
  for Flag := Low(TTaskDialogFlag) to High(TTaskDialogFlag) do
    if (Flag in Flags) then
      Value := Value or FlagMap[Flag];

  Info.ResultAsInteger := Value;
end;

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsSetOptionsEval(Info: TProgramInfo; ExtObject: TObject);
var
  Flag: TTaskDialogFlag;
  Flags: TTaskDialogFlags;
  Value: integer;
begin
  Value := Info.ParamAsInteger[0];
  Flags := [];
  for Flag := Low(TTaskDialogFlag) to High(TTaskDialogFlag) do
    if (Value and FlagMap[Flag] <> 0) then
      Include(Flags, Flag);

  TScriptTaskDialog(ExtObject).TaskDialog.Flags := Flags;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsGetButtonsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := CreateResultScriptObject(Info, TScriptTaskDialog(ExtObject).Buttons);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsGetCommonButtonsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Byte(TScriptTaskDialog(ExtObject).TaskDialog.CommonButtons);
end;

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsSetCommonButtonsEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptTaskDialog(ExtObject).TaskDialog.CommonButtons := TCommonButtons(Byte(Info.ParamAsInteger[0]));
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsGetInfoCollapseButtonCaptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TScriptTaskDialog(ExtObject).TaskDialog.Base.InfoCollapse;
end;

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsSetInfoCollapseButtonCaptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptTaskDialog(ExtObject).TaskDialog.Base.InfoCollapse := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsGetInfoExpandButtonCaptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TScriptTaskDialog(ExtObject).TaskDialog.Base.InfoExpanded;
end;

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsSetInfoExpandButtonCaptionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptTaskDialog(ExtObject).TaskDialog.Base.InfoExpanded := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTTaskDialogMethodsExecuteEval(Info: TProgramInfo; ExtObject: TObject);
var
  i: integer;
  s: string;
  Button: TScriptTaskDialogButton;
begin
  s := '';
  for i := 0 to TScriptTaskDialog(ExtObject).Buttons.Count-1 do
  begin
    Button := TScriptTaskDialogButton(TScriptTaskDialog(ExtObject).Buttons[i]);
    s := s + Button.Caption;
    if (Button.Hint <> '') then
      s := s + '\n' + Button.Hint;
    s := s + #10;
    if (Button.Default) then
      TScriptTaskDialog(ExtObject).TaskDialog.ButtonDef := Button.ModalResult;
  end;
  TScriptTaskDialog(ExtObject).TaskDialog.Base.Buttons := s;

  Info.ResultAsInteger := TScriptTaskDialog(ExtObject).TaskDialog.Execute;

  if (Screen.ActiveControl <> nil) then
    SetFocus(Screen.ActiveControl.Handle);
end;

// -----------------------------------------------------------------------------
//
// TDialog
//
// -----------------------------------------------------------------------------
type
  TScriptDialogForm = class(TCustomDialogForm);

procedure TDataModuleScriptUserInterfaceDialogs.OnAfterShowHandler(Sender: TObject);
var
  Wrapper: TScriptObjectWrapperBase;
  Delegate: IInfo;
  ScriptObjectInfo: IScriptObjectInfo;
  Any: boolean;
begin
  Any := False;
  for Wrapper in ScriptFindWrappers(Sender) do
  begin
    if (not Wrapper.CheckScriptObj) then
    begin
      OutputDebugString('TDataModuleScriptUserInterfaceDialogs.OnAfterShowHandler: Script Object has been destroyed');
      Continue;
    end;

    ScriptObjectInfo := Wrapper.AcquireInfo;
    Delegate := ScriptObjectInfo.Info.Member['FOnAfterShow'];

    if (Delegate <> nil) and (not Delegate.ValueIsEmpty) then
    begin
      try
        Delegate.Call([Wrapper.ScriptObj]);
        Any := True;
      except
        Delegate.Value := IUnknown(nil);
        ScriptHandleException(Wrapper.Execution);
      end;
    end;
  end;
  if (not Any) then
    TScriptDialogForm(Sender).OnAfterShow := nil;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTDialogMethodsGetButtonContainerEval(Info: TProgramInfo; ExtObject: TObject);
var
  Container: TObject;
  Wrapper: TScriptObjectWrapperBase;
begin
  Container := TScriptDialogForm(TScriptControlWrapper(ExtObject).Item).PanelButtons;
  ASSERT(Container <> nil);
  Wrapper := Environment(Info).FindWrapper(Container);
  if (Wrapper = nil) then
    Wrapper := TScriptControlWrapper.Create(Info, Container);
  Info.ResultAsVariant := Wrapper.ScriptObj;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTDialogMethodsSetOnAfterShowEval(Info: TProgramInfo; ExtObject: TObject);
begin
  if (not (TScriptControlWrapper(ExtObject).Item is TScriptDialogForm)) then
    exit;

  // Attach modules's event handler to control's event event
  if (not Info.Params[0].ValueIsEmpty) then
  begin
    Info.Vars['FOnAfterShow'].Value := Info.Params[0].Value;

    TScriptDialogForm(TScriptControlWrapper(ExtObject).Item).OnAfterShow := OnAfterShowHandler;
  end else
    TScriptDialogForm(TScriptControlWrapper(ExtObject).Item).OnAfterShow := nil;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTDialogConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
var
  Form: TForm;
begin
  Form := TScriptDialogForm.Create(nil);
  TScriptDialogForm(Form).ModernStyle := True;

  ExtObject := TScriptControlWrapper.Create(Info.ScriptObj, Form, True);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTDialogMethodsGetActionListEval(Info: TProgramInfo; ExtObject: TObject);
var
  ActionList: TObject;
  Wrapper: TScriptObjectWrapperBase;
begin
  ActionList := TScriptDialogForm(TScriptControlWrapper(ExtObject).Item).ActionListDialog;
  if (ActionList <> nil) then
  begin
    Wrapper := Environment(Info).FindWrapper(ActionList);
    if (Wrapper = nil) then
      Wrapper := TScriptActionListWrapper.Create(Info, ActionList);
    Info.ResultAsVariant := Wrapper.ScriptObj;
  end else
    Info.ResultAsVariant := IUnknown(nil);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTDialogMethodsGetActionOKEval(Info: TProgramInfo; ExtObject: TObject);
var
  Action: TObject;
  Wrapper: TScriptObjectWrapperBase;
begin
  Action := TScriptDialogForm(TScriptControlWrapper(ExtObject).Item).ActionOK;
  ASSERT(Action <> nil);
  Wrapper := Environment(Info).FindWrapper(Action);
  if (Wrapper = nil) then
    Wrapper := TScriptActionWrapper.Create(Info, Action);
  Info.ResultAsVariant := Wrapper.ScriptObj;
end;

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTDialogMethodsGetActionCancelEval(Info: TProgramInfo; ExtObject: TObject);
var
  Action: TObject;
  Wrapper: TScriptObjectWrapperBase;
begin
  Action := TScriptDialogForm(TScriptControlWrapper(ExtObject).Item).ActionCancel;
  ASSERT(Action <> nil);
  Wrapper := Environment(Info).FindWrapper(Action);
  if (Wrapper = nil) then
    Wrapper := TScriptActionWrapper.Create(Info, Action);
  Info.ResultAsVariant := Wrapper.ScriptObj;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTDialogMethodsGetContainerEval(Info: TProgramInfo; ExtObject: TObject);
var
  Container: TObject;
  Wrapper: TScriptObjectWrapperBase;
begin
  Container := TScriptDialogForm(TScriptControlWrapper(ExtObject).Item).PanelMain;
  ASSERT(Container <> nil);
  Wrapper := Environment(Info).FindWrapper(Container);
  if (Wrapper = nil) then
    Wrapper := TScriptControlWrapper.Create(Info, Container);
  Info.ResultAsVariant := Wrapper.ScriptObj;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTDialogMethodsExecuteEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := (TScriptDialogForm(TScriptControlWrapper(ExtObject).Item).ShowModal = mrOK);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTDialogMethodsGetMinorTitleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TScriptDialogForm(TScriptControlWrapper(ExtObject).Item).MinorTitle;
end;

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTDialogMethodsSetMinorTitleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptDialogForm(TScriptControlWrapper(ExtObject).Item).MinorTitle := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTDialogMethodsGetModernStyleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TScriptDialogForm(TScriptControlWrapper(ExtObject).Item).ModernStyle;
end;

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTDialogMethodsSetModernStyleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptDialogForm(TScriptControlWrapper(ExtObject).Item).ModernStyle := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTDialogMethodsGetTitleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TScriptDialogForm(TScriptControlWrapper(ExtObject).Item).Title;
end;

procedure TDataModuleScriptUserInterfaceDialogs.dwsUnitDialogsClassesTDialogMethodsSetTitleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TScriptDialogForm(TScriptControlWrapper(ExtObject).Item).Title := Info.ParamAsString[0];
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

initialization
  TDataModuleScriptUserInterfaceDialogs.RegisterModule;
end.


