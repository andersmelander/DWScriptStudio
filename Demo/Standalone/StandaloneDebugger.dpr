program StandaloneDebugger;

uses
  // This causes all script RTL units be be made available
  amScriptModuleAll,
  // This causes the script debugger to become available
  amScriptDebuggerMain,

  Vcl.Forms,

  amScriptAPI,
  amScriptHostAPI,
  amScriptModule;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  amScriptHostAPI.ScriptDebuggerIsApplication := True;
  amScriptAPI.ScriptService.Edit;

  Application.Run;
end.
