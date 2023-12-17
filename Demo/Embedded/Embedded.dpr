program Embedded;

uses
  // This causes all script RTL units to be made available
  amScript.Module.All,
  // This causes the script IDE/editor/debugger to become available
  amScript.IDE,
  // This provides file system access for use by the IDE file browser
  amScript.FileSystemStructure.Default,
  Vcl.Forms,
  Main in 'Main.pas' {FormMain},
  DemoFrameDocument in 'DemoFrameDocument.pas' {FrameDocument: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
