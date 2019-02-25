program Embedded;

uses
  Vcl.Forms,
  Main in 'Main.pas' {FormMain},
  ScriptDebuggerMain in '..\..\Source\ScriptDebuggerMain.pas' {FormScriptDebugger},
  ScriptDebuggerFrameAST in '..\..\Source\ScriptDebuggerFrameAST.pas' {ScriptDebuggerASTFrame: TFrame},
  ScriptDebuggerFrameBreakPoints in '..\..\Source\ScriptDebuggerFrameBreakPoints.pas' {ScriptDebuggerBreakPointsFrame: TFrame},
  ScriptDebuggerFrameCallStack in '..\..\Source\ScriptDebuggerFrameCallStack.pas' {ScriptDebuggerCallStackFrame: TFrame},
  ScriptDebuggerAPI in '..\..\Source\ScriptDebuggerAPI.pas',
  ScriptDebuggerDialogEvaluate in '..\..\Source\ScriptDebuggerDialogEvaluate.pas' {FormDebugEvaluate},
  ScriptDebuggerDialogGotoLine in '..\..\Source\ScriptDebuggerDialogGotoLine.pas' {DwsIdeGotoLineNumber},
  ScriptDebuggerFrameLocalVariables in '..\..\Source\ScriptDebuggerFrameLocalVariables.pas' {ScriptDebuggerLocalVariablesFrame: TFrame},
  ScriptDebuggerDialogSearch in '..\..\Source\ScriptDebuggerDialogSearch.pas' {FormScriptDebuggerSearch},
  ScriptDebuggerFrameStack in '..\..\Source\ScriptDebuggerFrameStack.pas' {ScriptDebuggerStackFrame: TFrame},
  ScriptDebuggerFrameSymbols in '..\..\Source\ScriptDebuggerFrameSymbols.pas' {ScriptDebuggerSymbolsFrame: TFrame},
  ScriptDebuggerFrameWatches in '..\..\Source\ScriptDebuggerFrameWatches.pas' {ScriptDebuggerWatchesFrame: TFrame},
  ScriptModule in '..\..\Source\ScriptModule.pas' {DataModuleScriptService: TDataModule},
  ScriptProviderAPI in '..\..\Source\ScriptProviderAPI.pas',
  ScriptDocBuilder in '..\..\Source\ScriptDocBuilder.pas',
  ScriptExternalFunctionManager in '..\..\Source\ScriptExternalFunctionManager.pas',
  ScriptFileSystemAPI in '..\..\Source\ScriptFileSystemAPI.pas',
  ScriptHostAPI in '..\..\Source\ScriptHostAPI.pas',
  ScriptPackageAPI in '..\..\Source\ScriptPackageAPI.pas',
  amStreamAdapter in '..\..\Source\amStreamAdapter.pas',
  ScriptPackage in '..\..\Source\ScriptPackage.pas',
  ScriptAPI in '..\..\Source\ScriptAPI.pas',
  ScriptProvider in '..\..\Source\ScriptProvider.pas',
  ScriptHostProvider in '..\..\Source\ScriptHostProvider.pas',
  ScriptHostFileSystem in '..\..\Source\ScriptHostFileSystem.pas',
  ScriptFileSystem in '..\..\Source\ScriptFileSystem.pas',
  ScriptHostAlertWindow in '..\..\Source\ScriptHostAlertWindow.pas',
  ScriptModuleClasses in '..\..\Source\ScriptRTL\ScriptModuleClasses.pas' {DataModuleScriptClasses: TDataModule},
  ScriptModuleCrypto in '..\..\Source\ScriptRTL\ScriptModuleCrypto.pas' {DataModuleScriptCrypto: TDataModule},
  ScriptModuleEncoding in '..\..\Source\ScriptRTL\ScriptModuleEncoding.pas' {DataModuleScriptEncoding: TDataModule},
  ScriptModuleGraphics in '..\..\Source\ScriptRTL\ScriptModuleGraphics.pas' {DataModuleScriptGraphics: TDataModule},
  ScriptModuleIniFiles in '..\..\Source\ScriptRTL\ScriptModuleIniFiles.pas' {DataModuleScriptIniFiles: TDataModule},
  ScriptModuleIO in '..\..\Source\ScriptRTL\ScriptModuleIO.pas' {DataModuleScriptIO: TDataModule},
  ScriptModuleRegExp in '..\..\Source\ScriptRTL\ScriptModuleRegExp.pas' {DataModuleScriptRegExp: TDataModule},
  ScriptModuleStreams in '..\..\Source\ScriptRTL\ScriptModuleStreams.pas' {DataModuleScriptStreams: TDataModule},
  ScriptModuleSystem in '..\..\Source\ScriptRTL\ScriptModuleSystem.pas' {DataModuleScriptSystem: TDataModule},
  ScriptModuleSystemInfo in '..\..\Source\ScriptRTL\ScriptModuleSystemInfo.pas' {DataModuleScriptSystemInfo: TDataModule},
  ScriptModuleSystemInput in '..\..\Source\ScriptRTL\ScriptModuleSystemInput.pas' {DataModuleScriptSystemInput: TDataModule},
  ScriptModuleZip in '..\..\Source\ScriptRTL\ScriptModuleZip.pas' {DataModuleScriptZip: TDataModule},
  ScriptModuleUserInterface in '..\..\Source\ScriptRTL\ScriptModuleUserInterface.pas' {DataModuleUserInterface: TDataModule},
  ScriptModuleUserInterfaceActionList in '..\..\Source\ScriptRTL\ScriptModuleUserInterfaceActionList.pas' {DataModuleScriptUserInterfaceActionList: TDataModule},
  ScriptModuleUserInterfaceImageList in '..\..\Source\ScriptRTL\ScriptModuleUserInterfaceImageList.pas' {DataModuleScriptUserInterfaceImageList: TDataModule},
  ScriptModuleUserInterfaceDialogs in '..\..\Source\ScriptRTL\ScriptModuleUserInterfaceDialogs.pas' {DataModuleScriptUserInterfaceDialogs: TDataModule},
  ScriptModuleUserInterfaceProgress in '..\..\Source\ScriptRTL\ScriptModuleUserInterfaceProgress.pas' {DataModuleScriptUserInterfaceProgress: TDataModule},
  ScriptModuleAll in '..\..\Source\ScriptRTL\ScriptModuleAll.pas',
  DemoFrameDocument in 'DemoFrameDocument.pas' {FrameDocument: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
