unit amScript.Editor.Data;

interface

uses
  System.SysUtils, System.Classes,

  SynEdit, SynEditTypes,
  SynMacroRecorder,
  SynCompletionProposal, SynEditAutoComplete,
  SynEditSearch, SynEditRegexSearch,

  amScript.Debugger.API;

// -----------------------------------------------------------------------------
//
// TSynAutoComplete
//
// -----------------------------------------------------------------------------
// Redirection of SynEditAutoComplete.TSynAutoComplete
// -----------------------------------------------------------------------------
type
  TSynAutoComplete = class(SynEditAutoComplete.TSynAutoComplete)
  private
    procedure SetOptions(const Value: TSynCompletionOptions);
    procedure SetShortCut(const Value: TShortCut);
  published
    property ShortCut: TShortCut write SetShortCut;
    property Options: TSynCompletionOptions write SetOptions;
  end;


// -----------------------------------------------------------------------------
//
//              TDataModuleDebuggerEditorData
//
// -----------------------------------------------------------------------------
type
  TDataModuleDebuggerEditorData = class(TDataModule)
  private
    FScriptDebugger: IScriptDebugger;
  private
    FSynCodeCompletion: TSynCompletionProposal;
    FSynEditSearch: TSynEditSearch;
    FSynEditRegexSearch: TSynEditRegexSearch;
    FSynMacroRecorder: TSynMacroRecorder;
    FSynAutoComplete: TSynAutoComplete;
    FSynParameters: TSynCompletionProposal;
  private
    procedure SynCodeCompletionExecute(Kind: SynCompletionType; Sender: TObject; var CurrentInput: string; var x, y: Integer; var CanExecute: Boolean);
    procedure SynCodeCompletionShow(Sender: TObject);
    procedure SynParametersExecute(Kind: SynCompletionType; Sender: TObject; var CurrentInput: string; var x, y: Integer; var CanExecute: Boolean);
  private
    class destructor Destroy;

  public
    constructor Create(AOwner: TComponent); override;

    procedure Initialize(const AScriptDebugger: IScriptDebugger);

    procedure AddEditor(AEditor: TCustomSynEdit);
    function RemoveEditor(AEditor: TCustomSynEdit): Boolean;

    procedure ExecuteSynCodeCompletion(AEditor: TCustomSynEdit);

    property SynCodeCompletion: TSynCompletionProposal read FSynCodeCompletion;
    property SynEditSearch: TSynEditSearch read FSynEditSearch;
    property SynEditRegexSearch: TSynEditRegexSearch read FSynEditRegexSearch;
    property SynMacroRecorder: TSynMacroRecorder read FSynMacroRecorder;
    property SynAutoComplete: TSynAutoComplete read FSynAutoComplete;
    property SynParameters: TSynCompletionProposal read FSynParameters;
  end;


// -----------------------------------------------------------------------------
//
//              DataModuleDebuggerEditorData
//
// -----------------------------------------------------------------------------
function DataModuleDebuggerEditorData: TDataModuleDebuggerEditorData;


// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  Graphics,
  Controls,

  dwsScriptSource,
  dwsExprs,
  dwsSuggestions,
  dwsSymbols,
  dwsSymbolDictionary,
  dwsStrings,

  amScript.IDE.Data;

resourcestring
  RStrNoParametersRequired = '"<no parameters required>"';

// -----------------------------------------------------------------------------
//
//              TSynAutoComplete
//
// -----------------------------------------------------------------------------
procedure TSynAutoComplete.SetOptions(const Value: TSynCompletionOptions);
begin
end;

procedure TSynAutoComplete.SetShortCut(const Value: TShortCut);
begin
end;


// -----------------------------------------------------------------------------
//
//              DataModuleDebuggerEditorData
//
// -----------------------------------------------------------------------------
var
  FDebuggerEditorData: TDataModuleDebuggerEditorData;

function DataModuleDebuggerEditorData: TDataModuleDebuggerEditorData;
begin
  if (FDebuggerEditorData = nil) then
    FDebuggerEditorData := TDataModuleDebuggerEditorData.Create(nil);
  Result := FDebuggerEditorData;
end;


// -----------------------------------------------------------------------------
//
//              TDataModuleDebuggerEditorData
//
// -----------------------------------------------------------------------------
constructor TDataModuleDebuggerEditorData.Create(AOwner: TComponent);
begin
  inherited;


  FSynEditSearch := TSynEditSearch.Create(Self);

  FSynMacroRecorder := TSynMacroRecorder.Create(Self);
  FSynMacroRecorder.RecordShortCut := 24658;
  FSynMacroRecorder.PlaybackShortCut := 24656;

  FSynCodeCompletion := TSynCompletionProposal.Create(Self);
  FSynCodeCompletion.Resizeable := True;
  FSynCodeCompletion.Options := [scoLimitToMatchedText, scoUseInsertList, scoUsePrettyText, scoUseBuiltInTimer, scoEndCharCompletion, scoCompleteWithTab, scoCompleteWithEnter];
  FSynCodeCompletion.NbLinesInWindow := 6;
  FSynCodeCompletion.Width := 400;
  FSynCodeCompletion.EndOfTokenChr := '()[]. ';
  FSynCodeCompletion.TriggerChars := '.';
  FSynCodeCompletion.Font.Height := -11;
  FSynCodeCompletion.Font.Name := 'MS Sans Serif';
  FSynCodeCompletion.TitleFont.Color := clBtnText;
  FSynCodeCompletion.TitleFont.Height := -11;
  FSynCodeCompletion.TitleFont.Name := 'MS Sans Serif';
  FSynCodeCompletion.TitleFont.Style := [fsBold];
  FSynCodeCompletion.OnExecute := SynCodeCompletionExecute;
  FSynCodeCompletion.OnShow := SynCodeCompletionShow;
  FSynCodeCompletion.ShortCut := 16416;
  FSynCodeCompletion.Images := TImageList(DataModuleDebuggerViewData.ImageListSymbols);

  FSynParameters := TSynCompletionProposal.Create(Self);
  FSynParameters.DefaultType := ctParams;
  FSynParameters.Options := [scoLimitToMatchedText, scoUsePrettyText, scoUseBuiltInTimer];
  FSynParameters.ClBackground := clInfoBk;
  FSynParameters.Width := 262;
  FSynParameters.EndOfTokenChr := '()[]. ';
  FSynParameters.TriggerChars := '(';
  FSynParameters.Font.Color := clWindowText;
  FSynParameters.Font.Height := -11;
  FSynParameters.Font.Name := 'MS Sans Serif';
  FSynParameters.TitleFont.Color := clBtnText;
  FSynParameters.TitleFont.Height := -11;
  FSynParameters.TitleFont.Name := 'MS Sans Serif';
  FSynParameters.TitleFont.Style := [fsBold];
  FSynParameters.OnExecute := SynParametersExecute;
  FSynParameters.ShortCut := 24608;

  FSynEditRegexSearch := TSynEditRegexSearch.Create(Self);

  FSynAutoComplete := TSynAutoComplete.Create(Self);
  FSynAutoComplete.AutoCompleteList.Text :=
      '[tryf|try..finally block]'#13+
      'try'#13+
      '  |'#13+
      'finally'#13+
      'end;'#13+
      '[trye|try..except block]'#13+
      'try'#13+
      '  |'#13+
      'except'#13+
      'end;'#13+
      '[begin|begin..end block]'#13+
      'begin'#13+
      '  |'#13+
      'end;'#13+
      '[if|if..then statement with begin..end block]'#13+
      'if (|) then'#13+
      'begin'#13+
      'end;'#13;
  FSynAutoComplete.EndOfTokenChr := '()[]. ';
  FSynAutoComplete.ShortCut := 8224;

//  FSynCodeCompletion.ClSelect := RootLookAndFeel.Painter.DefaultSelectionColor;
//  FSynCodeCompletion.ClSelectedText := RootLookAndFeel.Painter.DefaultSelectionTextColor;
  FSynCodeCompletion.ShortCut := 0;
end;

class destructor TDataModuleDebuggerEditorData.Destroy;
begin
  FreeAndNil(FDebuggerEditorData);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleDebuggerEditorData.Initialize(const AScriptDebugger: IScriptDebugger);
begin
  FScriptDebugger := AScriptDebugger;

end;

// -----------------------------------------------------------------------------

procedure TDataModuleDebuggerEditorData.AddEditor(AEditor: TCustomSynEdit);
begin
  FSynMacroRecorder.AddEditor(AEditor);
  FSynAutoComplete.AddEditor(AEditor);
  FSynParameters.AddEditor(AEditor);
  FSynCodeCompletion.AddEditor(AEditor);

  if (FSynParameters.EditorsCount = 1) then
    FSynParameters.Font.Name := AEditor.Font.Name;

  if (FSynCodeCompletion.EditorsCount = 1) then
    FSynCodeCompletion.Font.Name := AEditor.Font.Name;

  if (FSynCodeCompletion.Columns.Count = 0) then
  begin
    var Column := FSynCodeCompletion.Columns.Add;
    Column.ColumnWidth := -1;//FForm.SynCodeCompletion.Form.Canvas.TextWidth('constructor')+16+8; // 16=Glyph, 8=margin

    Column := FSynCodeCompletion.Columns.Add;
    Column.DefaultFontStyle := [fsBold];
    Column.ColumnWidth := -1;
  end;
end;

function TDataModuleDebuggerEditorData.RemoveEditor(AEditor: TCustomSynEdit): Boolean;
begin
  FSynMacroRecorder.RemoveEditor(AEditor);
  FSynAutoComplete.RemoveEditor(AEditor);
  FSynParameters.RemoveEditor(AEditor);
  FSynCodeCompletion.RemoveEditor(AEditor);
end;

// -----------------------------------------------------------------------------

type
  TSynCompletionProposalCracker = class(TSynCompletionProposal);

procedure TDataModuleDebuggerEditorData.ExecuteSynCodeCompletion(AEditor: TCustomSynEdit);
begin
  TSynCompletionProposalCracker(SynCodeCompletion).DoExecute(AEditor);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleDebuggerEditorData.SynCodeCompletionExecute(Kind: SynCompletionType;
  Sender: TObject; var CurrentInput: string; var x, y: Integer;
  var CanExecute: Boolean);
var
  SuggestionIndex: Integer;
  Proposal: TSynCompletionProposal;
  SourceFile: TSourceFile;
  ScriptPos: TScriptPos;
  ScriptProgram: IdwsProgram;
  Suggestions: IdwsSuggestions;
  Item, AddOn: string;
  n: integer;
  s: string;
  SuggestionCategory: TdwsSuggestionCategory;
begin
  CanExecute := False;

  Assert(Sender is TSynCompletionProposal);

  // check the proposal type
  Proposal := TSynCompletionProposal(Sender);
  Proposal.InsertList.Clear;
  Proposal.ItemList.Clear;

  if Assigned(Proposal.Form) then
    Proposal.Form.DoubleBuffered := True;

  // use this handler only in case the kind is set to ctCode!
  Assert(Kind = ctCode);

  // get script program
  ScriptProgram := FScriptDebugger.GetCompiledScript;
  if ScriptProgram = nil then
    Exit;

  var CurrentEditor := TSynCompletionProposal(Sender).Form.CurrentEditor;

  // ok, get the compiled "program" from DWS
  SourceFile := ScriptProgram.SourceList.MainScript.SourceFile;
  ScriptPos := TScriptPos.Create(SourceFile, CurrentEditor.CaretY, CurrentEditor.CaretX);
  Suggestions := TDWSSuggestions.Create(ScriptProgram, ScriptPos, [soNoReservedWords]);

  // now populate the suggestion box
  for SuggestionIndex := 0 to Suggestions.Count - 1 do
  begin
    // discard empty suggestions
    if Suggestions.Caption[SuggestionIndex] = '' then
      Continue;

    SuggestionCategory := Suggestions.Category[SuggestionIndex];

    Item := '\image{' + IntToStr(DebuggerSuggestionCategoryImageIndexMap[SuggestionCategory]) + '}';

    with CurrentEditor.Highlighter.KeywordAttribute do
      Item := Item + '\color{' + ColorToString(Foreground) + '}';

    Item := Item + SuggestionCategoryShortNames[SuggestionCategory];

    Item := Item + ' \column{}';
    s := Suggestions.Code[SuggestionIndex];
    with CurrentEditor.Highlighter.IdentifierAttribute do
      Item := Item + '\color{' + ColorToString(Foreground) + '}';
    Item := Item + s;
    AddOn := Suggestions.Caption[SuggestionIndex];
    Delete(AddOn, 1, Length(s));
    // Fix default DWS formatting
    n := 1;
    while (n > 0) do
    begin
      n := Pos(' : ', AddOn, n);
      if (n > 0) then
        Delete(AddOn, n, 1);
    end;
    n := Pos(' (', AddOn);
    if (n > 0) then
      Delete(AddOn, n, 1);
    n := Pos('()', AddOn);
    if (n > 0) then
      Delete(AddOn, n, 2);
    n := Pos('array of String = )', AddOn);
    if (n > 0) then
      Insert('[]', AddOn, n+18);

    Item := Item + '\style{-B}' + AddOn;

    Proposal.ItemList.AddObject(Item, pointer(DebuggerSuggestionCategoryImageIndexMap[SuggestionCategory]));
    Proposal.InsertList.AddObject(s, pointer(DebuggerSuggestionCategoryImageIndexMap[SuggestionCategory]));
  end;

  CanExecute := True;
end;

procedure TDataModuleDebuggerEditorData.SynCodeCompletionShow(Sender: TObject);
var
  CompletionProposalForm: TSynBaseCompletionProposalForm;
begin
  inherited;

  if (Sender <> nil) and (Sender is TSynBaseCompletionProposalForm) then
  begin
    CompletionProposalForm := TSynBaseCompletionProposalForm(Sender);
    try
      CompletionProposalForm.DoubleBuffered := True;

      if CompletionProposalForm.Height > 300 then
        CompletionProposalForm.Height := 300
    except
      on Exception do;
    end;
  end;
end;

procedure TDataModuleDebuggerEditorData.SynParametersExecute(Kind: SynCompletionType;
  Sender: TObject; var CurrentInput: string; var x, y: Integer;
  var CanExecute: Boolean);

  procedure GetParameterInfosForCursor(const AProgram: IdwsProgram; Col,
    Line: Integer; var ParameterInfos: TStrings; InfoPosition: Integer = 0);

    procedure ParamsToInfo(const AParams: TParamsSymbolTable);
    var
      y: Integer;
      ParamsStr: string;
    begin
      ParamsStr := '';
      if (AParams <> nil) and (AParams.Count > 0) then
      begin
        if InfoPosition >= AParams.Count then
          Exit;

        ParamsStr := '"' + AParams[0].Description + ';"';
        for y := 1 to AParams.Count - 1 do
          ParamsStr := ParamsStr + ',"' + AParams[y].Description + ';"';
      end else
      if InfoPosition > 0 then
        Exit;

      if (ParameterInfos.IndexOf(ParamsStr) < 0) then
        ParameterInfos.Add(ParamsStr);
    end;

  var
    Overloads: TFuncSymbolList;

    procedure CollectMethodOverloads(methSym: TMethodSymbol);
    var
      Member: TSymbol;
      Struct: TCompositeTypeSymbol;
      LastOverloaded: TMethodSymbol;
    begin
      LastOverloaded := methSym;
      Struct := methSym.StructSymbol;
      repeat
        for Member in Struct.Members do
        begin
          if not SameText(Member.Name, methSym.Name) then
            Continue;
          if not (Member is TMethodSymbol) then
            Continue;

          LastOverloaded := TMethodSymbol(Member);
          if not Overloads.ContainsChildMethodOf(LastOverloaded) then
            Overloads.Add(LastOverloaded);
        end;

        Struct := Struct.Parent;
      until (Struct = nil) or not LastOverloaded.IsOverloaded;
    end;

  var
    ItemIndex: Integer;
    FuncSymbol: TFuncSymbol;

    SymbolDictionary: TdwsSymbolDictionary;
    SymbolPositionList: TSymbolPositionList;
    Symbol, TestSymbol: TSymbol;
  begin
    // make sure the string list is present
    Assert(Assigned(ParameterInfos));

    // ensure a compiled program is assigned
    if not Assigned(AProgram) then
      Exit;

    SymbolDictionary := AProgram.SymbolDictionary;
    Symbol := SymbolDictionary.FindSymbolAtPosition(Col, Line, MSG_MainModule);

    if (Symbol is TSourceMethodSymbol) then
    begin
      Overloads := TFuncSymbolList.Create;
      try
        CollectMethodOverloads(TSourceMethodSymbol(Symbol));
        for ItemIndex := 0 to Overloads.Count - 1 do
        begin
          FuncSymbol := Overloads[ItemIndex];
          ParamsToInfo(FuncSymbol.Params);
        end;
      finally
        Overloads.Free;
      end;
    end else
    if (Symbol is TFuncSymbol) then
    begin
      ParamsToInfo(TFuncSymbol(Symbol).Params);

      if TFuncSymbol(Symbol).IsOverloaded then
      begin
        for SymbolPositionList in SymbolDictionary do
        begin
          TestSymbol := SymbolPositionList.Symbol;
          if (TestSymbol.ClassType = Symbol.ClassType) and
            AnsiSameText(TFuncSymbol(TestSymbol).Name, TFuncSymbol(Symbol).Name) and
            (TestSymbol <> Symbol) then
            ParamsToInfo(TFuncSymbol(TestSymbol).Params);
        end;
      end
    end;

    // check if no parameters at all is an option, if so: replace and move to top
    ItemIndex := ParameterInfos.IndexOf('');
    if ItemIndex >= 0 then
    begin
      ParameterInfos.Delete(ItemIndex);
      ParameterInfos.Insert(0, RStrNoParametersRequired);
    end;
  end;


var
  LineText: string;
  Proposal: TSynCompletionProposal;
  LocLine: string;
  TmpX: Integer;
  TmpLocation, StartX, ParenCounter: Integer;
  ParameterInfoList: TStrings;
  ScriptProgram: IdwsProgram;
begin
  CanExecute := False;
  Assert(Kind = ctParams);

  // get script program
  ScriptProgram := FScriptDebugger.GetCompiledScript;
  if ScriptProgram = nil then
    Exit;

  // check the proposal type
  if Sender is TSynCompletionProposal then
  begin
    Proposal := TSynCompletionProposal(Sender);
    Proposal.InsertList.Clear;
    Proposal.ItemList.Clear;
    ParameterInfoList := TStrings(Proposal.ItemList);

    var CurrentEditor := TSynCompletionProposal(Sender).Form.CurrentEditor;

    // get current line
    LineText := CurrentEditor.LineText;

    with CurrentEditor do
    begin
      // get current compiled program
      if not Assigned(ScriptProgram) then
        Exit;

      LocLine := LineText;

      //go back from the cursor and find the first open paren
      TmpX := CaretX;
      if TmpX > Length(LocLine) then
        TmpX := Length(LocLine)
      else Dec(TmpX);
      TmpLocation := 0;

      while (TmpX > 0) and not CanExecute do
      begin
        if LocLine[TmpX] = ',' then
        begin
          Inc(TmpLocation);
          Dec(TmpX);
        end else if LocLine[TmpX] = ')' then
        begin
          // we found a close, go till it's opening paren
          ParenCounter := 1;
          Dec(TmpX);
          while (TmpX > 0) and (ParenCounter > 0) do
          begin
            if LocLine[TmpX] = ')' then
              Inc(ParenCounter)
            else
            if LocLine[TmpX] = '(' then
              Dec(ParenCounter);
            Dec(TmpX);
          end;
          if TmpX > 0 then Dec(TmpX);  // eat the open paren
        end else if LocLine[TmpX] = '(' then
        begin
          // we have a valid open paren, lets see what the word before it is
          StartX := TmpX;
          while (TmpX > 0) and not IsIdentChar(LocLine[TmpX])do
            Dec(TmpX);
          if TmpX > 0 then
          begin
            while (TmpX > 0) and IsIdentChar(LocLine[TmpX]) do
              Dec(TmpX);
            Inc(TmpX);

            GetParameterInfosForCursor(ScriptProgram, TmpX,
              CurrentEditor.CaretY, ParameterInfoList, TmpLocation);

            CanExecute := ParameterInfoList.Count > 0;

            if not CanExecute then
            begin
              TmpX := StartX;
              Dec(TmpX);
            end
            else
              TSynCompletionProposal(Sender).Form.CurrentIndex := TmpLocation;
          end;
        end else Dec(TmpX)
      end;
    end;
  end;
end;

end.
