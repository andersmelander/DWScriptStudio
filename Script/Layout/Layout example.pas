var Form := TForm.Create;

var Layout := TLayout.Create(Form);
Layout.Align := alClient;
Layout.Parent := Form;

Layout.Items.AlignHorz := ahClient;
Layout.Items.AlignVert := avClient;

var HeaderStyle := TLayoutStyle.Create;
HeaderStyle.ItemOptions.CaptionOptions.Font.Style := [fsBold];

var Edit := TEdit.Create(Form);

var LabelItem := Layout.Items.CreateLabelItem;
LabelItem.Caption.Text := 'Layout example';
LabelItem.Style := HeaderStyle;


var Item := Layout.Items.CreateItem(Edit);
Item.Caption.Text := 'Enter your name:';

var Group := Layout.Items.CreateGroup;
Group.AlignVert := avBottom;
Group.AlignHorz := ahClient;
Group.LayoutDirection := ldHorizontal;
Group.ShowBorder := False;

var Button := TButton.Create(Form);
Button.Caption := 'Push me!';
Button.Default := True;
Button.ModalResult := mrOK;
Button.OnClick := procedure(Sender: TControl)
  begin
    ShowMessage(Format('Thank you %s!', [Edit.Text]));
  end;
Item := Group.CreateItem(Button);
Item.AlignHorz := ahRight;

Button := TButton.Create(Form);
Button.Caption := 'Cancel';
Button.Cancel := True;
Button.ModalResult := mrCancel;

Item := Group.CreateItem(Button);
Item.AlignHorz := ahRight;

Form.ShowModal;