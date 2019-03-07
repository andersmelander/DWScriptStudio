unit amScriptModuleUserInterfaceProgress;

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

  amScriptModule;

// -----------------------------------------------------------------------------
//
// TDataModuleScriptUserInterfaceProgress
//
// -----------------------------------------------------------------------------
type
  TDataModule = class(TScriptModule);

  TDataModuleScriptUserInterfaceProgress = class(TDataModule)
    dwsUnitProgress: TdwsUnit;
    procedure dwsUnitProgressAfterInitUnitTable(Sender: TObject);
    procedure dwsUnitProgressFunctionsShowProgressEval(info: TProgramInfo);
    procedure dwsUnitProgressClassesTProgressDialogMethodsProgress1Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressDialogMethodsProgress2Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressDialogMethodsAdvanceProgressEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressDialogMethodsUpdateMessageEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressDialogMethodsShowEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressDialogMethodsHideEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressDialogMethodsProcessMessagesEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressDialogMethodsAbortProgressEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressDialogMethodsSuspendAbortEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressDialogMethodsResumeAbortEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressDialogMethodsGetEnableAbortEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressDialogMethodsSetEnableAbortEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressDialogMethodsGetRaiseOnAbortEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressDialogMethodsSetRaiseOnAbortEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressDialogMethodsGetAbortedEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressDialogMethodsGetMarqueeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressDialogMethodsSetMarqueeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressDialogMethodsGetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressDialogMethodsSetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressDialogCleanUp(ExternalObject: TObject);

    procedure dwsUnitProgressClassesTProgressBarConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressBarMethodsGetPositionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressBarMethodsSetPositionEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressBarMethodsGetMinEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressBarMethodsSetMinEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressBarMethodsGetMaxEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressBarMethodsSetMaxEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressBarMethodsGetStyleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressBarMethodsSetStyleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressBarMethodsGetNativeStyleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressBarMethodsSetNativeStyleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressBarMethodsGetMarqueeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressBarMethodsSetMarqueeEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressBarMethodsGetOrientationEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressBarMethodsSetOrientationEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressBarMethodsGetShowTextEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressBarMethodsSetShowTextEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressBarMethodsGetTextStyleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressBarMethodsSetTextStyleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressBarMethodsGetTextOrientationEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressBarMethodsSetTextOrientationEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressBarMethodsGetBeginColorEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressBarMethodsSetBeginColorEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressBarMethodsGetEndColorEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressBarMethodsSetEndColorEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressBarMethodsGetAnimationStyleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTProgressBarMethodsSetAnimationStyleEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressClassesTCursorRecallMethodsForgetEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitProgressFunctionsSaveCursorEval(info: TProgramInfo);
    procedure dwsUnitProgressClassesTCursorRecallCleanUp(ExternalObject: TObject);
  private
  public
  end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

implementation

{$R *.dfm}

uses
  cxProgressBar,
  dwsInfo,
  dwsDataContext,
  dwsSymbols,
  amProgressForm,
  amCursorService;


procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressAfterInitUnitTable(Sender: TObject);
var
  ClassSymbol: TClassSymbol;
  InterfaceSymbol: TInterfaceSymbol;
  MissingMethod: TMethodSymbol;
begin
  // Add IProgress to TProgressDialog
  ClassSymbol := (dwsUnitProgress.Table.FindTypeLocal('TProgressDialog') as TClassSymbol);
  InterfaceSymbol := (dwsUnitProgress.Table.FindTypeLocal('IProgress') as TInterfaceSymbol);
  ClassSymbol.AddInterface(InterfaceSymbol, cvProtected, MissingMethod);
end;

// -----------------------------------------------------------------------------
//
// Script: ShowProgress
//
// -----------------------------------------------------------------------------
// Encapsulates ShowProgress
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressFunctionsShowProgressEval(info: TProgramInfo);
var
  Progress: IProgress;
  Msg: string;
  Defer: boolean;
begin
  Msg := Info.ParamAsString[0];
  Defer := Info.ParamAsBoolean[1];

  Progress := ForceShowProgress(Msg, Defer);
  Progress._AddRef;

  // We would like to return an IProgress interface but I don't know how to do that
  // ScriptObj := Info.Vars['IProgress'].GetConstructor('Create', ExternalObject).Call.Value;
  Info.ResultAsVariant := CreateResultScriptObject(Info, Progress);
end;

// -----------------------------------------------------------------------------
//
// Script: SaveCursor()
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressFunctionsSaveCursorEval(info: TProgramInfo);
var
  Recall: IRecall;
begin
  Recall := SaveCursor(Info.ParamAsInteger[0], Info.ParamAsBoolean[1]);
  Recall._AddRef;

  Info.ResultAsVariant := CreateResultScriptObject(Info, Recall);
end;

// -----------------------------------------------------------------------------
//
// Script: TCursorRecall
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTCursorRecallCleanUp(ExternalObject: TObject);
var
  Recall: IRecall;
begin
  Recall := IRecall(pointer(ExternalObject));
  Recall._Release;
  Recall := nil;
end;

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTCursorRecallMethodsForgetEval(Info: TProgramInfo; ExtObject: TObject);
begin
  IRecall(pointer(ExtObject)).Forget;
end;


// -----------------------------------------------------------------------------
//
// Script: TProgressDialog
//
// -----------------------------------------------------------------------------
// Encapsulates IProgress
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressDialogCleanUp(ExternalObject: TObject);
var
  Progress: IProgress;
begin
  pointer(Progress) := pointer(ExternalObject);
  Progress := nil;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressDialogMethodsAbortProgressEval(Info: TProgramInfo; ExtObject: TObject);
var
  Progress: IProgress;
begin
  Progress := IProgress(pointer(ExtObject));

  try

    Progress.AbortProgress;

  except
    // For now we just let the script transform the exception
    raise;
  end;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressDialogMethodsAdvanceProgressEval(Info: TProgramInfo; ExtObject: TObject);
var
  Progress: IProgress;
begin
  Progress := IProgress(pointer(ExtObject));

  Progress.AdvanceProgress(Info.ParamAsInteger[0]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressDialogMethodsProcessMessagesEval(Info: TProgramInfo; ExtObject: TObject);
var
  Progress: IProgress;
begin
  Progress := IProgress(pointer(ExtObject));

  Progress.ProcessMessages;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressDialogMethodsProgress1Eval(Info: TProgramInfo; ExtObject: TObject);
var
  Progress: IProgress;
begin
  Progress := IProgress(pointer(ExtObject));

  try

    Progress.Progress(TProgressStage(Info.ParamAsInteger[0]), Info.ParamAsInteger[1], Info.ParamAsInteger[2], Info.ParamAsString[3]);

  except
    // For now we just let the script transform the exception
    raise;
  end;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressDialogMethodsProgress2Eval(Info: TProgramInfo; ExtObject: TObject);
var
  Progress: IProgress;
begin
  Progress := IProgress(pointer(ExtObject));

  try

    Progress.Progress(TProgressStage(Info.ParamAsInteger[0]), Info.ParamAsInteger[1], Info.ParamAsInteger[2]);

  except
    // For now we just let the script transform the exception
    raise;
  end;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressDialogMethodsResumeAbortEval(Info: TProgramInfo; ExtObject: TObject);
var
  Progress: IProgress;
begin
  Progress := IProgress(pointer(ExtObject));

  Progress.ResumeAbort;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressDialogMethodsShowEval(Info: TProgramInfo; ExtObject: TObject);
var
  Progress: IProgress;
begin
  Progress := IProgress(pointer(ExtObject));

  Progress.Show;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressDialogMethodsSuspendAbortEval(Info: TProgramInfo; ExtObject: TObject);
var
  Progress: IProgress;
begin
  Progress := IProgress(pointer(ExtObject));

  Progress.SuspendAbort;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressDialogMethodsHideEval(Info: TProgramInfo; ExtObject: TObject);
var
  Progress: IProgress;
begin
  Progress := IProgress(pointer(ExtObject));

  Progress.Hide;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressDialogMethodsUpdateMessageEval(Info: TProgramInfo; ExtObject: TObject);
var
  Progress: IProgress;
begin
  Progress := IProgress(pointer(ExtObject));

  Progress.UpdateMessage(Info.ParamAsString[0]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressDialogMethodsGetEnableAbortEval(Info: TProgramInfo; ExtObject: TObject);
var
  Progress: IProgress;
begin
  Progress := IProgress(pointer(ExtObject));

  Info.ResultAsBoolean := Progress.EnableAbort;
end;

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressDialogMethodsSetEnableAbortEval(Info: TProgramInfo; ExtObject: TObject);
var
  Progress: IProgress;
begin
  Progress := IProgress(pointer(ExtObject));

  Progress.EnableAbort := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressDialogMethodsGetRaiseOnAbortEval(Info: TProgramInfo; ExtObject: TObject);
var
  Progress: IProgress;
begin
  Progress := IProgress(pointer(ExtObject));

  Info.ResultAsBoolean := Progress.RaiseOnAbort;
end;

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressDialogMethodsSetRaiseOnAbortEval(Info: TProgramInfo; ExtObject: TObject);
var
  Progress: IProgress;
begin
  Progress := IProgress(pointer(ExtObject));

  Progress.RaiseOnAbort := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressDialogMethodsGetAbortedEval(Info: TProgramInfo; ExtObject: TObject);
var
  Progress: IProgress;
begin
  Progress := IProgress(pointer(ExtObject));

  Info.ResultAsBoolean := Progress.Aborted;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressDialogMethodsGetMarqueeEval(Info: TProgramInfo; ExtObject: TObject);
var
  Progress: IProgress;
begin
  Progress := IProgress(pointer(ExtObject));

  Info.ResultAsBoolean := Progress.Marquee;
end;

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressDialogMethodsSetMarqueeEval(Info: TProgramInfo; ExtObject: TObject);
var
  Progress: IProgress;
begin
  Progress := IProgress(pointer(ExtObject));

  Progress.Marquee := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressDialogMethodsGetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
var
  Progress: IProgress;
begin
  Progress := IProgress(pointer(ExtObject));

  Info.ResultAsBoolean := Progress.Enabled;
end;

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressDialogMethodsSetEnabledEval(Info: TProgramInfo; ExtObject: TObject);
var
  Progress: IProgress;
begin
  Progress := IProgress(pointer(ExtObject));

  Progress.Enabled := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------
//
// Script: TProgressBar
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressBarConstructorsCreateEval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := TScriptControlWrapper.CreateOwned(Info, Info.ScriptObj, TcxProgressBar);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressBarMethodsGetPositionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := TcxProgressBar(TScriptControlWrapper(ExtObject).Item).Position;
end;

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressBarMethodsSetPositionEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxProgressBar(TScriptControlWrapper(ExtObject).Item).Position := Info.ParamAsFloat[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressBarMethodsGetMinEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := TcxProgressBar(TScriptControlWrapper(ExtObject).Item).Properties.Min;
end;

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressBarMethodsSetMinEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxProgressBar(TScriptControlWrapper(ExtObject).Item).Properties.Min := Info.ParamAsFloat[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressBarMethodsGetMaxEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := TcxProgressBar(TScriptControlWrapper(ExtObject).Item).Properties.Max;
end;

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressBarMethodsSetMaxEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxProgressBar(TScriptControlWrapper(ExtObject).Item).Properties.Max := Info.ParamAsFloat[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressBarMethodsGetStyleEval(Info: TProgramInfo; ExtObject: TObject);
const
  // Bitmap styles are not supported and maps to solid
  ProgressBarStyleMap: array[TcxProgressBarBarStyle] of integer = (0, 1, 2, 3, 0, 0, 4, 5);
begin
  Info.ResultAsInteger := ProgressBarStyleMap[TcxProgressBar(TScriptControlWrapper(ExtObject).Item).Properties.BarStyle];
end;

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressBarMethodsSetStyleEval(Info: TProgramInfo; ExtObject: TObject);
const
  ProgressBarStyleMap: array[0..5] of TcxProgressBarBarStyle = (cxbsSolid, cxbsLEDs, cxbsGradient, cxbsGradientLEDs, cxbsAnimation, cxbsAnimationLEDs);
begin
  TcxProgressBar(TScriptControlWrapper(ExtObject).Item).Properties.BarStyle := ProgressBarStyleMap[Info.ParamAsInteger[0]];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressBarMethodsGetNativeStyleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TcxProgressBar(TScriptControlWrapper(ExtObject).Item).Style.LookAndFeel.NativeStyle;
end;

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressBarMethodsSetNativeStyleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxProgressBar(TScriptControlWrapper(ExtObject).Item).Style.LookAndFeel.NativeStyle := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressBarMethodsGetMarqueeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TcxProgressBar(TScriptControlWrapper(ExtObject).Item).Properties.Marquee;
end;

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressBarMethodsSetMarqueeEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxProgressBar(TScriptControlWrapper(ExtObject).Item).Properties.Marquee := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressBarMethodsGetOrientationEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TcxProgressBar(TScriptControlWrapper(ExtObject).Item).Properties.Orientation);
end;

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressBarMethodsSetOrientationEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxProgressBar(TScriptControlWrapper(ExtObject).Item).Properties.Orientation := TcxProgressBarOrientation(Info.ParamAsInteger[0]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressBarMethodsGetShowTextEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TcxProgressBar(TScriptControlWrapper(ExtObject).Item).Properties.ShowText;
end;

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressBarMethodsSetShowTextEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxProgressBar(TScriptControlWrapper(ExtObject).Item).Properties.ShowText := Info.ParamAsBoolean[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressBarMethodsGetTextStyleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TcxProgressBar(TScriptControlWrapper(ExtObject).Item).Properties.ShowTextStyle);
end;

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressBarMethodsSetTextStyleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxProgressBar(TScriptControlWrapper(ExtObject).Item).Properties.ShowTextStyle := TcxProgressBarTextStyle(Info.ParamAsInteger[0]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressBarMethodsGetTextOrientationEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TcxProgressBar(TScriptControlWrapper(ExtObject).Item).Properties.TextOrientation);
end;

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressBarMethodsSetTextOrientationEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxProgressBar(TScriptControlWrapper(ExtObject).Item).Properties.TextOrientation := TcxProgressBarOrientation(Info.ParamAsInteger[0]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressBarMethodsGetBeginColorEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TcxProgressBar(TScriptControlWrapper(ExtObject).Item).Properties.BeginColor;
end;

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressBarMethodsSetBeginColorEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxProgressBar(TScriptControlWrapper(ExtObject).Item).Properties.BeginColor := Info.ParamAsInteger[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressBarMethodsGetEndColorEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TcxProgressBar(TScriptControlWrapper(ExtObject).Item).Properties.EndColor;
end;

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressBarMethodsSetEndColorEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxProgressBar(TScriptControlWrapper(ExtObject).Item).Properties.EndColor := Info.ParamAsInteger[0];
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressBarMethodsGetAnimationStyleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := Ord(TcxProgressBar(TScriptControlWrapper(ExtObject).Item).Properties.AnimationPath);
end;

procedure TDataModuleScriptUserInterfaceProgress.dwsUnitProgressClassesTProgressBarMethodsSetAnimationStyleEval(Info: TProgramInfo; ExtObject: TObject);
begin
  TcxProgressBar(TScriptControlWrapper(ExtObject).Item).Properties.AnimationPath := TcxProgressBarAnimationPath(Info.ParamAsInteger[0]);
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

initialization
  TDataModuleScriptUserInterfaceProgress.RegisterModule;
end.
