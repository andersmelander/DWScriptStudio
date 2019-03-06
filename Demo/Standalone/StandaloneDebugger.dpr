program StandaloneDebugger;

uses
  // This causes all script RTL units be be made available
  ScriptModuleAll,
  // This causes the script debugger to become available
  ScriptDebuggerMain,

  Vcl.Forms,

  ScriptAPI,
  ScriptHostAPI,
  ScriptModule;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  ScriptHostAPI.ScriptDebuggerIsApplication := True;
  ScriptAPI.ScriptService.Edit;

  Application.Run;
end.
