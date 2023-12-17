program StandaloneDebugger;

uses
  madExcept,
  // This causes all script RTL units to be made available
  amScript.Module.All,
  // This causes the script IDE/editor/debugger to become available
  amScript.IDE,
  // This provides file system access for use by the IDE file browser
  amScript.FileSystemStructure.Default,
  Vcl.Forms,
  amScript.API,
  amScript.Host.API,
  amScript.Module;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  amScript.Host.API.ScriptDebuggerIsApplication := True;
  amScript.API.ScriptService.Edit;

  Application.Title := 'DWScript debugger';
  Application.Run;
end.
