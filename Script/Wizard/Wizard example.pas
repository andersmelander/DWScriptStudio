uses
  System.UI.Wizard;

type
  TMyWizardForm = class(TWizardForm)
  private
    FWizard: TWizardControl;
    FPageChoice: TWizardPage;
    FPageChoice1: TWizardPage;
    FPageChoice2: TWizardPage;
    FPageFinish: TWizardPage;
  protected
    // Wizard event handlers
    procedure OnWizardCancel(Sender: TWizardControl; var Accept: boolean);
    procedure OnWizardFinish(Sender: TWizardControl; var Accept: boolean);
    procedure OnWizardGetNextPage(Sender: TWizardControl; var NewPage: TWizardPage);
    procedure OnWizardGetPrevPage(Sender: TWizardControl; var NewPage: TWizardPage);
    procedure OnWizardPageActivated(Sender: TWizardControl; Page: TWizardPage);
    // Button event handlers
    procedure OnButtonFirstClick(Sender: TControl);
    procedure OnButtonSecondClick(Sender: TControl);
  public
    constructor Create;
  end;

constructor TMyWizardForm.Create;
begin
  inherited Create;

  Width := 500;
  Height := 400;

  FWizard := TWizardControl.Create(Self);
  FWizard.Buttons.Cancel.Caption := 'Bye bye';
  FWizard.Options.AutoDisableCancel := False; // Enable Cancel button on last page
  FWizard.Parent := Self;
  FWizard.Title := 'Wizard from Script';
  FWizard.InfoPanel.Caption := 'This is a link to something relevant';
  FWizard.InfoPanel.Hyperlink := 'http://disney.com';
  FWizard.InfoPanel.Visible := True;
  // Wizard event handlers
  FWizard.OnWizardCancel := OnWizardCancel;
  FWizard.OnWizardFinish := OnWizardFinish;
  FWizard.OnWizardGetNextPage := OnWizardGetNextPage;
  FWizard.OnWizardGetPrevPage := OnWizardGetPrevPage;
  FWizard.OnWizardPageActivated := OnWizardPageActivated;

  FPageChoice := FWizard.Pages.Add;
  FPageChoice.Header.Title := 'Welcome';
  FPageChoice.Header.Description := 'This is the description of the first page';

  var Button := TButton.Create(Self);
  Button.Parent := FPageChoice;
  Button.Align := alTop;
  Button.Kind := bkCommandLink;
  Button.Caption := 'First choice';
  Button.Description := 'Description of this choice';
  Button.Height := 64;
  Button.Font.Size := 11;
  Button.Margins.Bottom := 12;
  Button.AlignWithMargins := True;
  Button.OnClick := OnButtonFirstClick;

  Button := TButton.Create(Self);
  Button.Parent := FPageChoice;
  Button.Align := alTop;
  Button.Kind := bkCommandLink;
  Button.Caption := 'Second choice';
  Button.Description := 'Description of that choice';
  Button.Height := 64;
  Button.Font.Size := 11;
  Button.Margins.Bottom := 12;
  Button.AlignWithMargins := True;
  Button.OnClick := OnButtonSecondClick;


  FPageChoice1 := FWizard.Pages.Add;
  FPageChoice1.Header.Title := 'First choice page';
  FPageChoice1.Header.Description := 'This is the description of the first choice page';
  FPageChoice1.Header.DescriptionVisible := True;

  FPageChoice2 := FWizard.Pages.Add;
  FPageChoice2.Header.Title := 'Second choice page';
  FPageChoice2.Header.Description := 'This is the description of the second choice page';

  FPageFinish := FWizard.Pages.Add;
  FPageFinish.Header.Title := 'Last page';
  FPageFinish.Header.Description := 'This is the description of the final page';
  FPageFinish.Header.DescriptionVisible := True;
end;

procedure TMyWizardForm.OnWizardCancel(Sender: TWizardControl; var Accept: boolean);
begin
  ShowMessage('Wizard cancel');
  ModalResult := mrCancel;
end;

procedure TMyWizardForm.OnWizardFinish(Sender: TWizardControl; var Accept: boolean);
begin
  ShowMessage('Wizard finish');
  ModalResult := mrOK;
end;

procedure TMyWizardForm.OnWizardGetNextPage(Sender: TWizardControl; var NewPage: TWizardPage);
begin
  case Sender.ActivePageIndex of
    0: NewPage := nil; //  User must use command buttons to move forward
    1: NewPage := FPageFinish;
    2: NewPage := FPageFinish;
    3: NewPage := nil;
  end;
end;

procedure TMyWizardForm.OnWizardGetPrevPage(Sender: TWizardControl; var NewPage: TWizardPage);
begin
  case Sender.ActivePageIndex of
    0: NewPage := nil;
    1: NewPage := FPageChoice;
    2: NewPage := FPageChoice;
    3: NewPage := FPageChoice;
  end;
end;

procedure TMyWizardForm.OnWizardPageActivated(Sender: TWizardControl; Page: TWizardPage);
begin
  FWizard.UpdateButtons;
end;

procedure TMyWizardForm.OnButtonFirstClick(Sender: TControl);
begin
  ShowMessage('First choice selected');
  FWizard.ActivePage := FPageChoice1;
end;

procedure TMyWizardForm.OnButtonSecondClick(Sender: TControl);
begin
  ShowMessage('Second choice selected');
  FWizard.ActivePage := FPageChoice2;
end;

begin
  var WizardForm := TMyWizardForm.Create;

  WizardForm.ShowModal;
end.