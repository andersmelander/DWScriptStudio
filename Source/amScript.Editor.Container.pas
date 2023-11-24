unit amScript.Editor.Container;

interface

uses
  Classes,
  Controls,
  amScript.Editor.API;

// -----------------------------------------------------------------------------
//
// TScriptEditorContainer
//
// -----------------------------------------------------------------------------
// Facilitates "communication" from the editor to the container control.
// Specifically it allows the editor to embed itself within the container
// control and to set the caption of the container control.
// The object is owned, via reference counting, by the editor.
// -----------------------------------------------------------------------------
type
  TScriptEditorContainer = class(TInterfacedObject, IScriptEditorContainer)
  private
    FContainer: TWinControl;
    FEditorControl: TControl;
  private
    // IScriptEditorContainer
    procedure SetCaption(const ACaption: string); virtual;
    procedure EmbedEditorControl(AControl: TControl);
  public
    constructor Create(AContainer: TWinControl);
  end;

implementation

uses
  amScript.Editor.SynEdit;

constructor TScriptEditorContainer.Create(AContainer: TWinControl);
begin
  inherited Create;

  FContainer := AContainer;
end;

procedure TScriptEditorContainer.EmbedEditorControl(AControl: TControl);
begin
  if (FEditorControl <> nil) then
  begin
    FEditorControl.Visible := False;
    FEditorControl.Parent := nil;
  end;

  FEditorControl := AControl;

  if (FEditorControl <> nil) then
  begin
    FEditorControl.Parent := FContainer;
    FEditorControl.Align := alClient;
    FEditorControl.Visible := True;
  end;
end;

type
  TControlCracker = class(TCustomControl);

procedure TScriptEditorContainer.SetCaption(const ACaption: string);
begin
  TControlCracker(FContainer).Caption := ACaption;
end;

function EditorFactory(const AEditorHost: IScriptEditorHost; AContainerControl: TWinControl): IScriptEditor;
begin
  var Container: IScriptEditorContainer := TScriptEditorContainer.Create(AContainerControl);

  Result := TScriptEditor.Create(AEditorHost, Container);
end;

initialization
  ScriptEditorFactory.RegisterFactory(EditorFactory);
end.
