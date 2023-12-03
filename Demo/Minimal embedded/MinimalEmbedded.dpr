program MinimalEmbedded;

uses
  // This causes all script RTL units to be made available
  amScript.Module.All,
  // This causes the script IDE/editor/debugger to become available
  amScript.IDE,
  Vcl.Forms,
  Main in 'Main.pas' {FormMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
