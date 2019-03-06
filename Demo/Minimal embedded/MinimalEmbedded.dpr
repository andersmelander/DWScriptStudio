program MinimalEmbedded;

uses
  // This causes all script RTL units be be made available
  ScriptModuleAll,
  // This causes the script debugger to become available
  ScriptDebuggerMain,
  Vcl.Forms,
  Main in 'Main.pas' {FormMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
