program StandaloneDebugger;

uses
  ScriptModuleAll,

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
