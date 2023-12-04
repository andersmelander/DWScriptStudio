unit amScript.Editor.SynEdit;

interface

uses
  Generics.Collections,
  System.Classes,
  System.SysUtils,
  Vcl.ImgList,
  Vcl.Graphics,
  Vcl.Controls,

  SynEdit,
  SynEditKeyCmds,
  SynEditTypes,
  dwsSymbolDictionary,

  amScript.Provider.API,
  amScript.Debugger.API,
  amScript.Editor.API;

type
  TLineChangedState = (csOriginal, csModified, csSaved);

// -----------------------------------------------------------------------------
//
// TScriptEditor
//
// -----------------------------------------------------------------------------
type
  TScriptEditor = class(TInterfacedObject, IScriptEditor, IScriptEditorInternal)
  private
    const
      EditorGutterWidth = 64;
      EditorFontName = 'Courier New';
      EditorFontSize = 10;
    const
      ecOpenFileUnderCursor = ecUserFirst;
      ecToggleDeclImpl = ecUserFirst + 1;
      ecRepeatSearch = ecUserFirst + 2;
      ecToggleBreakPoint = ecUserFirst + 3;
      ecAutoCompletionPropose = ecUserFirst + 4;
      ecInsertGUID = ecUserFirst + 5;
      ecSelectNextTab = ecUserFirst + 6;
      ecSelectPrevTab = ecUserFirst + 7;
  private
    FSubscribers: TList<IScriptEditorNotification>;
    procedure Notify(Notification: TScriptEditorNotification);
    procedure NotifyActionHandlers(AAction: TScriptEditorAction; var Handled: boolean);
  private
    FEditorHost: IScriptEditorHost;
    FDebugger: IScriptDebugger;
    FEditor: TSynEdit;
    FContainer: IScriptEditorContainer;
    FAllowClose: boolean;
    FExecutableLines: TBits;
    FLineChangedState: array of TLineChangedState;
    FCurrentLine: Integer;
    FUnderLine: Integer;
    FFilename: string;
    FCaption: string;
    FScriptProvider: IScriptProvider;
    FImages: TCustomImageList;

    procedure SynEditGutterPaint(Sender: TObject; aLine, X, Y: Integer);
    procedure SynEditorKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure SynEditorSpecialLineColors(Sender: TObject; Line: Integer; var Special: Boolean; var FG, BG: TColor);
    procedure SynEditorGutterClick(Sender: TObject; Button: TMouseButton; X, Y, Line: Integer; Mark: TSynEditMark);
    procedure SynEditorMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure SynEditorMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SynEditorProcessCommand(Sender: TObject; var Command: TSynEditorCommand; var AChar: Char; Data: pointer);
    procedure SynEditorCommandProcessed(Sender: TObject; var Command: TSynEditorCommand; var AChar: Char; Data: Pointer);
    procedure SynEditorStatusChange(Sender: TObject; Changes: TSynStatusChanges);
    procedure DoOnEditorChange(ASender: TObject);
{$ifdef DISABLED_STUFF}
    function GetIsProjectSourcefile: Boolean;
{$endif DISABLED_STUFF}

    procedure AddBreakpoint(ALineNum: Integer; AEnabled: Boolean);
    procedure ClearBreakpoint(ALineNum: Integer);
    function GetBreakpointStatus(ALine: Integer): TBreakpointStatus;

    procedure ClearExecutableLines;
    procedure InitExecutableLines;
    function IsExecutableLine(ALine: Integer): Boolean; inline;

    procedure ClearLineChangeStates;
    procedure InitLineChangeStates;
    function GetLineChangeState(ALine: Integer): TLineChangedState; inline;

    procedure DpiChanged;
  protected
    // IScriptEditorInternal
    procedure Initialize(AImages: TCustomImageList);
    procedure Finalize;
  protected
    // IScriptEditor
    procedure Subscribe(const ASubscriber: IScriptEditorNotification);
    procedure Unsubscribe(const ASubscriber: IScriptEditorNotification);

    procedure HostNotification(Notification: TScriptEditorHostNotification);

    procedure EditorActivated;
    procedure EditorDeactivated;

    procedure InvalidateLine(ALine: integer = -1);

    function _SaveAs: boolean;
    function Save: boolean;
    function CloseQuery: boolean;

    procedure LoadFromFile(const AFilename: string);
    procedure LoadFromStream(Stream: TStream);
    procedure LoadFromString(const AScript: string);
    function SaveToStream(Stream: TStream): boolean;

    procedure GotoLine(ALine: Integer; ACol: Integer = 1; MoveCurrent: boolean = True);
    function WordStart(const BufferPos: TBufferPos): TBufferPos;
    function WordAt(const BufferPos: TBufferPos): string;
    procedure MarkModified(Line: integer = -1);
    procedure FindDeclaration(const ABufferPos: TBufferPos; ASymbolUsage: TSymbolUsage);

    procedure Undo;
    function CanUndo: boolean;

    function HasSelection: boolean;
    procedure SelectAll;

    function GetSelectedText: string;
    procedure SetSelectedText(const Value: string);
    property SelectedText: string read GetSelectedText write SetSelectedText;

    function SearchReplace(const ASearchText, AReplaceText: string; const AOptions: TSearchReplaceOptions): integer;

    procedure CopyToClipboard;
    procedure CutToClipboard;
    procedure PasteFromClipboard;
    function CanPaste: boolean;

    function GetCaretPos: TBufferPos;
    procedure SetCaretPos(const Value: TBufferPos);
    property CaretPos: TBufferPos read GetCaretPos write SetCaretPos;

    function GetBlockBegin: TBufferPos;
    procedure SetBlockBegin(const Value: TBufferPos);
    property BlockBegin: TBufferPos read GetBlockBegin write SetBlockBegin;

    function GetBlockEnd: TBufferPos;
    procedure SetBlockEnd(const Value: TBufferPos);
    property BlockEnd: TBufferPos read GetBlockEnd write SetBlockEnd;

    function GetLines: TStrings;

    function GetHasProvider: boolean;
    property HasProvider: boolean read GetHasProvider;

    function GetScriptProvider: IScriptProvider;
    procedure SetScriptProvider(const Value: IScriptProvider);
    property ScriptProvider: IScriptProvider read FScriptProvider write SetScriptProvider;

    function GetScript: string;
    procedure SetScript(const Value: string);
    property Script: string read GetScript write SetScript;

    function GetCanClose: boolean;
    property CanClose: boolean read GetCanClose;

    function GetCaption: string;
    procedure SetCaption(const Value: string);
    property Caption: string read GetCaption write SetCaption;

    function GetUnitName: string;
    property UnitName: string read GetUnitName;

    function InternalUnitName: string;

    function GetFilename: TFileName;
    procedure SetFileName(const Value: TFileName);
    property FileName: TFileName read GetFilename write SetFileName;

    function GetInsertMode: boolean;
    procedure SetInsertMode(const Value: boolean);
    property InsertMode: boolean read GetInsertMode write SetInsertMode;

    function GetModified: boolean;
    property Modified: boolean read GetModified;
    procedure ClearModified;

    function GetIsReadOnly: Boolean;
    procedure SetIsReadOnly(const Value: Boolean);
    property IsReadOnly: Boolean read GetIsReadOnly write SetIsReadOnly;
  public
    constructor Create(const AEditorHost: IScriptEditorHost; AContainer: IScriptEditorContainer); reintroduce;
    destructor Destroy; override;

    function _SaveToFile(APromptOverwrite: Boolean): boolean; overload;
    function _SaveToFile(const AFilename: string; APromptOverwrite: Boolean): boolean; overload;

    procedure _SaveIfModified(APromptOverwrite: Boolean);

    function GotoIdentifier(const AIdentifier: string): Boolean;
    procedure ShowExecutableLines;
    procedure ToggleLineChangedStates;


    property Debugger: IScriptDebugger read FDebugger;

    property Editor: TSynEdit read FEditor;
  end;

implementation

uses
  dwsXPlatform, // Must be before IOUtils

  System.Math,
  System.IOUtils,
  Vcl.Menus,
  Vcl.Forms,
  Vcl.Dialogs,
  WinApi.Windows,
  SynEditHighlighter,
  SynHighlighterDWS,
  dwsExprs,
  dwsSymbols,
  dwsDebugger,
  dwsStrings,
  amDialogs,
  amScript.API,
  amScript.Provider,
  amScript.IDE.Settings,
  amScript.Editor.Container,
  amScript.Editor.SynEdit.Data,
  amScript.IDE.Data;

function ConfirmDlgYesNoAbort(const AStr: string): Boolean;
begin
  Result := False;
  case MessageTaskDlgEx('Confirm', AStr, mtError, [mbYes, mbNo, mbCancel]) of
    idYes:
      Result := True;
    idNo:
      Exit;
    else
      Abort;
  end;
end;



function Lighten(AColor: TColor; AFactor: Byte): TColor;
// Lightens a color by this amount
var
  R, G, B: Byte;
begin
  AColor := ColorToRGB(AColor);

  R := GetRValue(AColor);
  G := GetGValue(AColor);
  B := GetBValue(AColor);

  Inc(R, AFactor);
  Inc(G, AFactor);
  Inc(B, AFactor);

  Result := RGB(R, G, B);
end;

function JustFileName(const AFileName: TFileName): string;
// Returns only the file name without dir or ext
begin
  Result := ExtractFileName(AFileName);
  if (AnsiSameText(ExtractFileExt(Result), sScriptFileType)) then
    Result := ChangeFileExt(Result, '');
end;

// -----------------------------------------------------------------------------
//
// TEditorPageSynEditPlugin
//
// -----------------------------------------------------------------------------
type
  TEditorPageSynEditPlugin = class(TSynEditPlugin)
  protected
    FEditor: TScriptEditor;
    procedure LinesInserted(FirstLine, Count: Integer); override;
    procedure LinesDeleted(FirstLine, Count: Integer); override;
    procedure PaintTransient(ACanvas: TCanvas; ATransientType: TTransientType); override;
  public
    constructor Create(APage: TScriptEditor);
  end;

constructor TEditorPageSynEditPlugin.Create(APage: TScriptEditor);
begin
  inherited Create(APage.Editor);
  FEditor := APage;
end;

procedure TEditorPageSynEditPlugin.LinesInserted(FirstLine, Count: Integer);
var
  I, iLineCount: Integer;
  UpdateBreakpoints: boolean;
begin
  if (FirstLine < 1) then
    exit;

  // Track the executable lines
  iLineCount := FEditor.Editor.Lines.Count;
  FirstLine := Min(FirstLine, iLineCount-1);
  FEditor.FExecutableLines.Size := iLineCount;
  for I := iLineCount - 1 downto FirstLine + Count do
    FEditor.FExecutableLines[i] := FEditor.FExecutableLines[I - Count];
  for I := FirstLine + Count - 1 downto FirstLine do
    FEditor.FExecutableLines[i] := False;

  SetLength(FEditor.FLineChangedState, iLineCount);
  for I := iLineCount - 1 downto FirstLine + Count do
    FEditor.FLineChangedState[i] := FEditor.FLineChangedState[I - Count];
  for I := FirstLine + Count - 1 downto FirstLine - 1 do
    FEditor.FLineChangedState[i] := csModified;

  // Track the breakpoint lines in the debugger
  UpdateBreakpoints := False;
  if (FEditor.Debugger <> nil) then
  begin
    var Breakpoints := FEditor.Debugger.GetDebugger.Breakpoints;
    for I := 0 to Breakpoints.Count - 1 do
      if Breakpoints[I].SourceName = FEditor.InternalUnitName then
        if Breakpoints[I].Line >= FirstLine then
        begin
          Breakpoints[I].Line := Breakpoints[I].Line + Count;
          UpdateBreakpoints := True;
        end;
  end;

  // Redraw the gutter for updated icons.
  FEditor.Editor.InvalidateGutter;

  if (UpdateBreakpoints) then
    FEditor.Debugger.NotifyBreakPoint(nil, dnBreakPointsUpdate, [bpuRefreshLines]);
end;

procedure TEditorPageSynEditPlugin.PaintTransient(ACanvas: TCanvas;
  ATransientType: TTransientType);
var
  BracketCoord: TBufferCoord;
  Pt: TPoint;
  Rct: TRect;
  MouseBufferCoord: TBufferCoord;
  Attri: TSynHighlighterAttributes;
  TokenType, Start: Integer;
  TokenName: String;
  OldFont: TFont;
begin

  // only handle after transient
  if ATransientType <> ttAfter then
    Exit;

  // Matching pair hightlighting
  BracketCoord := Editor.CaretXY;
  if (BracketCoord.Char <> 0) and (BracketCoord.Line <> 0) then
  begin
    BracketCoord := Editor.GetMatchingBracketEx(BracketCoord);
    if (BracketCoord.Char <> 0) and (BracketCoord.Line <> 0) then
    begin
      ACanvas.Brush.Style := bsSolid;

      Pt := Editor.RowColumnToPixels(Editor.BufferToDisplayPos(Editor.CaretXY));
      Rct := Rect(Pt.X, Pt.Y, Pt.X + Editor.CharWidth * 1, Pt.Y + Editor.LineHeight);
      ACanvas.Brush.Color := $00F5FFE5;
      InflateRect(Rct, 1, 1);
      ACanvas.TextRect(Rct, Pt.X, Pt.Y, Editor.Lines[Editor.CaretY-1][Editor.CaretX]);
      InflateRect(Rct, 1, 1);
      ACanvas.Brush.Color := $0098D900;
      ACanvas.FrameRect(Rct);

      Pt := Editor.RowColumnToPixels(Editor.BufferToDisplayPos(BracketCoord));
      Rct := Rect(Pt.X, Pt.Y, Pt.X + Editor.CharWidth * 1, Pt.Y + Editor.LineHeight);
      ACanvas.Brush.Color := $00F5FFE5;
      InflateRect(Rct, 1, 1);
      ACanvas.TextRect(Rct, Pt.X, Pt.Y, Editor.Lines[BracketCoord.Line-1][BracketCoord.Char]);
      InflateRect(Rct, 1, 1);
      ACanvas.Brush.Color := $0098D900;
      ACanvas.FrameRect(Rct);
    end;
  end;

  // only continue if [CTRL] is pressed
  if not (ssCtrl in KeyboardStateToShiftState) then
  begin
    Editor.Cursor := crDefault;
    Exit;
  end;

  Pt := Editor.ScreenToClient(Mouse.CursorPos);
  MouseBufferCoord := Editor.DisplayToBufferPos(Editor.PixelsToRowColumn(Pt.X, Pt.Y));
  Editor.GetHighlighterAttriAtRowColEx(MouseBufferCoord, TokenName, TokenType, Start, Attri);

  if TtkTokenKind(TokenType) <> tkIdentifier then
  begin
    Editor.Cursor := crDefault;
    Exit;
  end;

  Pt := Editor.RowColumnToPixels(Editor.BufferToDisplayPos(Editor.WordStartEx(MouseBufferCoord)));

  Rct := Rect(Pt.X, Pt.Y, Pt.X + Editor.CharWidth * Length(TokenName), Pt.Y + Editor.LineHeight);

  OldFont := TFont.Create;
  try
    OldFont.Assign(ACanvas.Font);
    ACanvas.Font.Color := clBlue;
    ACanvas.Font.Style := [fsUnderline];
    ACanvas.TextRect(Rct, Pt.X, Pt.Y, TokenName);
    ACanvas.Font := OldFont;
  finally
    OldFont.Free;
  end;
  Editor.Cursor := crHandPoint;
end;

procedure TEditorPageSynEditPlugin.LinesDeleted(FirstLine, Count: Integer);
var
  I: Integer;
  UpdateBreakpoints: boolean;
begin
  // Track the executable lines
  for I := FirstLine - 1 to FEditor.FExecutableLines.Size - Count - 1 do
    FEditor.FExecutableLines[i] := FEditor.FExecutableLines[I + Count];
  FEditor.FExecutableLines.Size := FEditor.FExecutableLines.Size - Count;

  // Track the executable lines
  for I := FirstLine - 1 to Length(FEditor.FLineChangedState) - Count - 1 do
    FEditor.FLineChangedState[i] := FEditor.FLineChangedState[I + Count];
  SetLength(FEditor.FLineChangedState, Length(FEditor.FLineChangedState) - Count);

  // Track the breakpoint lines in the debugger
  UpdateBreakpoints := False;
  if (FEditor.Debugger <> nil) then
  begin
    var Breakpoints := FEditor.Debugger.GetDebugger.Breakpoints;
    for I := 0 to Breakpoints.Count - 1 do
      if Breakpoints[I].SourceName = FEditor.InternalUnitName then
        if Breakpoints[I].Line >= FirstLine then
        begin
          Breakpoints[I].Line := Breakpoints[I].Line - Count;
          UpdateBreakpoints := True;
        end;
  end;

  // Redraw the gutter for updated icons.
  FEditor.Editor.InvalidateGutter;

  if (UpdateBreakpoints) then
    FEditor.Debugger.NotifyBreakPoint(nil, dnBreakPointsUpdate, [bpuRefreshLines]);
end;


// -----------------------------------------------------------------------------
//
// TScriptEditor
//
// -----------------------------------------------------------------------------
constructor TScriptEditor.Create(const AEditorHost: IScriptEditorHost; AContainer: IScriptEditorContainer);

  procedure InitEditor;

    procedure DefineShortcut(Command: TSynEditorCommand; Key: Word; Shift: TShiftState; RemoveOld: boolean = False);
    var
      i: integer;
      Short: TShortCut;
    begin
      Short := ShortCut(Key, Shift);
      i := FEditor.Keystrokes.FindShortcut(Short);
      if (i <> -1) then
        FEditor.Keystrokes[i].ShortCut := 0;

      i := FEditor.Keystrokes.FindCommand(ecPageTop);
      if (RemoveOld) and (i <> -1) then
        FEditor.Keystrokes[i].ShortCut := Short
      else
        FEditor.Keystrokes.AddKey(Command, Key, Shift);
    end;

  var
    HighlighterClass: TEditorHighlighterClass;
  begin
    FEditor := TSynEdit.Create(nil);
    FEditor.OnChange := DoOnEditorChange;
    FEditor.Align   := alClient;
    FEditor.BorderStyle := bsNone;
    FEditor.Gutter.Width := EditorGutterWidth;
    FEditor.PopupMenu := FEditorHost.GetEditorPagePopupMenu;
    FEditor.WantTabs := True;
    FEditor.FontSmoothing := fsmClearType;
    FEditor.TabWidth := 8;
(*
    // SynEdit.IndentWidth requires patched source
    FEditor.IndentWidth := 2;
*)

    if (ScriptSettings.Editor.HighlighterClass <> '') then
    begin
      HighlighterClass := TEditorHighlighterClass(GetClass(ScriptSettings.Editor.HighlighterClass));
      if (HighlighterClass <> nil) and (HighlighterClass.InheritsFrom(TSynCustomHighlighter)) then
        FEditor.Highlighter := HighlighterClass.Create(FEditor);
    end;

    if (ScriptSettings.Editor.FontName <> '') then
    begin
      FEditor.Font.Name := ScriptSettings.Editor.FontName;
      FEditor.Font.Size := ScriptSettings.Editor.FontSize;
    end else
    begin
      FEditor.Font.Name := EditorFontName;
      FEditor.Font.Size := EditorFontSize;
    end;

    FEditor.Options := [
      //eoAltSetsColumnMode,       //Holding down the Alt Key will put the selection mode into columnar format
      eoAutoIndent,              //Will indent the caret on new lines with the same amount of leading white space as the preceding line
      //eoAutoSizeMaxScrollWidth,  //Automatically resizes the MaxScrollWidth property when inserting text
      //eoDisableScrollArrows,     //Disables the scroll bar arrow buttons when you can't scroll in that direction any more
      //eoDragDropEditing,         //Allows you to select a block of text and drag it within the document to another location
      //eoDropFiles,               //Allows the editor accept OLE file drops
      //eoEnhanceHomeKey,          //enhances home key positioning, similar to visual studio
      eoEnhanceEndKey,           //enhances End key positioning, similar to JDeveloper
      eoGroupUndo,               //When undoing/redoing actions, handle all continous changes of the same kind in one call instead undoing/redoing each command separately
      //eoHalfPageScroll,          //When scrolling with page-up and page-down commands, only scroll a half page at a time
      eoHideShowScrollbars,      //if enabled, then the scrollbars will only show when necessary.  If you have ScrollPastEOL, then it the horizontal bar will always be there (it uses MaxLength instead)
      eoKeepCaretX,              //When moving through lines w/o Cursor Past EOL, keeps the X position of the cursor
      //eoNoCaret,                 //Makes it so the caret is never visible
      //eoNoSelection,             //Disables selecting text
      eoRightMouseMovesCursor,   //When clicking with the right mouse for a popup menu, move the cursor to that location
      eoScrollByOneLess,         //Forces scrolling to be one less
      eoScrollHintFollows,       //The scroll hint follows the mouse when scrolling vertically
      eoScrollPastEof,           //Allows the cursor to go past the end of file marker
      eoScrollPastEol,           //Allows the cursor to go past the last character into the white space at the end of a line
      eoShowScrollHint,          //Shows a hint of the visible line numbers when scrolling vertically
      //eoShowSpecialChars,        //Shows the special Characters
      eoSmartTabDelete,          //similar to Smart Tabs, but when you delete characters
      //eoSmartTabs,               //When tabbing, the cursor will go to the next non-white space character of the previous line
      //eoSpecialLineDefaultFg,    //disables the foreground text color override when using the OnSpecialLineColor event
      eoTabIndent,               //When active <Tab> and <Shift><Tab> act as block indent, unindent when text is selected
      eoTabsToSpaces,            //Converts a tab character to a specified number of space characters
      eoTrimTrailingSpaces       //Spaces at the end of lines will be trimmed and not saved
      ];

    DefineShortcut(ecGotoXY, 47, [ssAlt]);
    DefineShortcut(ecOpenFileUnderCursor, VK_RETURN, [ssCtrl]);
    DefineShortcut(ecToggleDeclImpl, VK_UP, [ssCtrl, ssShift]);
    DefineShortcut(ecToggleDeclImpl, VK_DOWN, [ssCtrl, ssShift], False);
    DefineShortcut(ecRepeatSearch, VK_F3, []);
    DefineShortcut(ecToggleBreakPoint, VK_F8, [ssCtrl]);
    DefineShortcut(ecAutoCompletion, Ord('J'), [ssCtrl]);
    DefineShortcut(ecInsertGUID, Ord('G'), [ssShift, ssCtrl]);
    DefineShortcut(ecSelectNextTab, VK_TAB, [ssCtrl]);
    DefineShortcut(ecSelectPrevTab, VK_TAB, [ssShift, ssCtrl]);

    DefineShortcut(ecPageTop, VK_HOME, [ssCtrl]);
    DefineShortcut(ecSelPageTop, VK_HOME, [ssShift, ssCtrl]);
    DefineShortcut(ecPageBottom, VK_END, [ssCtrl]);
    DefineShortcut(ecSelPageBottom, VK_END, [ssShift, ssCtrl]);
    DefineShortcut(ecEditorTop, VK_PRIOR, [ssCtrl]);
    DefineShortcut(ecSelEditorTop, VK_PRIOR, [ssShift, ssCtrl]);
    DefineShortcut(ecEditorBottom, VK_NEXT, [ssCtrl]);
    DefineShortcut(ecSelEditorBottom, VK_NEXT, [ssShift, ssCtrl]);

    DefineShortcut(ecAutoCompletionPropose, Ord(' '), [ssCtrl]);

    FEditor.OnSpecialLineColors := SynEditorSpecialLineColors;
    FEditor.OnGutterClick := SynEditorGutterClick;
    FEditor.OnGutterPaint := SynEditGutterPaint;
    FEditor.OnMouseMove := SynEditorMouseMove;
    FEditor.OnProcessCommand := SynEditorProcessCommand;
    FEditor.OnCommandProcessed := SynEditorCommandProcessed;
    FEditor.OnMouseUp := SynEditorMouseDown;
//    FEditor.OnClick := SynEditorClick;
    FEditor.OnKeyDown := SynEditorKeyDown;
    FEditor.OnStatusChange := SynEditorStatusChange;

    TEditorPageSynEditPlugin.Create(Self);

    DpiChanged;
  end;

begin
  inherited Create;

  FEditorHost := AEditorHost;
  FContainer := AContainer;
  FCurrentLine := -1;
  FExecutableLines := TBits.Create;
  FAllowClose := True;

  if (not Supports(FEditorHost, IScriptDebugger, FDebugger)) then
    FDebugger := nil;

  InitEditor;
  InitLineChangeStates;

  DataModuleEditorSynEditData.AddEditor(FEditor);

  FEditor.Align := alClient;
  FEditor.Visible := True;

  FContainer.EmbedEditorControl(FEditor);

  FEditor.Modified := False;

  Notify(seNotifyInitialize);
end;

destructor TScriptEditor.Destroy;
begin
  Finalize;

  FContainer := nil;

  DataModuleEditorSynEditData.RemoveEditor(FEditor);

  FExecutableLines.Free;
  FEditor.Free;

  FScriptProvider := nil;

  FSubscribers.Free;

  inherited;
end;

// -----------------------------------------------------------------------------

procedure TScriptEditor.Subscribe(const ASubscriber: IScriptEditorNotification);
begin
  if (FSubscribers = nil) then
    FSubscribers := TList<IScriptEditorNotification>.Create;
  FSubscribers.Add(ASubscriber);
end;

procedure TScriptEditor.Unsubscribe(const ASubscriber: IScriptEditorNotification);
begin
  if (FSubscribers <> nil) then
    FSubscribers.Remove(ASubscriber);
end;

// -----------------------------------------------------------------------------

procedure TScriptEditor.Initialize(AImages: TCustomImageList);
begin
  FImages := AImages;
end;

procedure TScriptEditor.Finalize;
begin
  Notify(seNotifyFinalize);
  FDebugger := nil;
  FEditorHost := nil;

  // Detach editor control from container so parent/child relationship
  // doesn't delete the editor control.
  if (FContainer <> nil) then
    FContainer.EmbedEditorControl(nil);
end;

// -----------------------------------------------------------------------------

procedure TScriptEditor.EditorActivated;
begin
  FEditor.SearchEngine := DataModuleEditorSynEditData.SynEditSearch;

  if (FEditor.Visible) and (FEditor.CanFocus) and (FEditor.HandleAllocated) then
    FEditor.SetFocus;
end;

procedure TScriptEditor.EditorDeactivated;
begin
  FEditor.SearchEngine := nil;
end;

// -----------------------------------------------------------------------------

procedure TScriptEditor.HostNotification(Notification: TScriptEditorHostNotification);
begin
  case Notification of
    ehNotifyCompiled:
      ShowExecutableLines;

    ehNotifyResetDebugState:
      ClearExecutableLines;

    ehNotifyDpiChanged:
      DpiChanged;

    ehNotifyInvalidate:
      FEditor.Invalidate;
  end;
end;

// -----------------------------------------------------------------------------

procedure TScriptEditor.Notify(Notification: TScriptEditorNotification);
begin
  if (FSubscribers = nil) then
    exit;

  for var Subscriber in FSubscribers.ToArray do
    Subscriber.ScriptEditorNotification(Self, Notification);
end;

procedure TScriptEditor.NotifyActionHandlers(AAction: TScriptEditorAction; var Handled: boolean);
begin
  Handled := False;

  if (FSubscribers = nil) then
    exit;

  for var Subscriber in FSubscribers do
  begin
    var ActionHandler: IScriptEditorActionHandler;
    if (Supports(Subscriber, IScriptEditorActionHandler, ActionHandler)) then
    begin
      Handled := ActionHandler.EditorActionHandler(Self, AAction);
      if (Handled) then
        break;
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure TScriptEditor.DoOnEditorChange(ASender: TObject);
begin
  FLineChangedState[FEditor.CaretY - 1] := csModified;
  Notify(seNotifyChanged);
end;

// -----------------------------------------------------------------------------

procedure TScriptEditor.FindDeclaration(const ABufferPos: TBufferPos; ASymbolUsage: TSymbolUsage);
var
  ScriptProgram: IdwsProgram;
  BufferPos: TBufferPos;
  Symbol: TSymbol;
  SymbolPosList: TSymbolPositionList;
  Index: integer;
  s: string;
begin
  if (FDebugger = nil) then
    Exit;

  ScriptProgram := FDebugger.GetCompiledScript;
  if (ScriptProgram = nil) then
    Exit;

  BufferPos := WordStart(ABufferPos);
  Symbol := ScriptProgram.SymbolDictionary.FindSymbolAtPosition(BufferPos.Column, BufferPos.Line, InternalUnitName);

  if (Symbol = nil) then
    Exit;

  SymbolPosList := ScriptProgram.SymbolDictionary.FindSymbolPosList(Symbol);

  if (SymbolPosList = nil) or (SymbolPosList.Count = 0) then
    Exit;

  Index := SymbolPosList.Count-1;
  while (Index >= 0) do
  begin
    if (ASymbolUsage in SymbolPosList[Index].SymbolUsages) then
      break;
    dec(Index);
  end;
  if (Index < 0) then
    exit;

  s := FDebugger.UnitNameFromScriptPos(SymbolPosList[Index].ScriptPos);

  if (FEditorHost.CreateEditor(s, True, ScriptProvider)) then
  begin
    BufferPos.Column := SymbolPosList[Index].ScriptPos.Col;
    BufferPos.Line := SymbolPosList[Index].ScriptPos.Line;
    FEditorHost.ActiveEditor.CaretPos := BufferPos;
  end;
end;

// -----------------------------------------------------------------------------

function TScriptEditor.GetFilename: TFileName;
begin
  Result := FFilename;
end;

function TScriptEditor.GetHasProvider: boolean;
begin
  Result := (FScriptProvider <> nil);
end;

procedure TScriptEditor.SetIsReadOnly(const Value: Boolean);
begin
  FEditor.ReadOnly := Value;
end;

function TScriptEditor.GetIsReadOnly: Boolean;
begin
  Result := FEditor.ReadOnly;
end;

function TScriptEditor.GetModified: boolean;
begin
  Result := FEditor.Modified;
end;

function TScriptEditor.GetInsertMode: boolean;
begin
  Result := FEditor.InsertMode;
end;

procedure TScriptEditor.SetInsertMode(const Value: boolean);
begin
  FEditor.InsertMode := Value;
end;

function TScriptEditor.GotoIdentifier(const AIdentifier: string): Boolean;
var
  I: Integer;
  S: string;
  bImplementation: Boolean;
begin
  Result := False;
  S := UpperCase(AIdentifier);
  bImplementation := False;
  for I := 0 to FEditor.Lines.Count - 1 do
  begin
    if Pos('IMPLEMENTATION', UpperCase(FEditor.Lines[I])) <> 0 then
      bImplementation := True
    else
    if bImplementation then
    begin
      Result := Pos(S, UpperCase(FEditor.Lines[I])) <> 0;
      if Result then
      begin
        FEditor.CaretY := I + 1;
        FEditor.CaretX := 1;
        FEditor.SearchReplace(AIdentifier, '', []); // << selects the identifier
        Exit;
      end;
    end;
  end;
end;

// AddBreakpoint
//
procedure TScriptEditor.AddBreakpoint(ALineNum: Integer; AEnabled: Boolean);
var
  Breakpoint: TdwsDebuggerBreakpoint;
  WasAdded: Boolean;
  Index: Integer;
begin
  if (FDebugger = nil) then
    exit;

  Breakpoint := TdwsDebuggerBreakpoint.Create;
  try
    Breakpoint.Line := ALineNum;
    Breakpoint.SourceName := InternalUnitName;

    FDebugger.NotifyBreakPoint(Breakpoint, dnBreakPointAdd);

    WasAdded := False;
    Index := FDebugger.GetDebugger.Breakpoints.AddOrFind(Breakpoint, WasAdded);

  finally
    if not WasAdded then
      Breakpoint.Free;
  end;

  FDebugger.GetDebugger.Breakpoints[Index].Enabled := AEnabled;

  Editor.InvalidateGutterLine(ALineNum);
  Editor.InvalidateLine(ALineNum);

  FDebugger.NotifyBreakPoint(FDebugger.GetDebugger.Breakpoints[Index], dnBreakPointAdded);
end;

// ClearBreakpoint
//
procedure TScriptEditor.ClearBreakpoint(ALineNum: Integer);
var
  Test, Breakpoint: TdwsDebuggerBreakpoint;
  Index: Integer;
begin
  Assert(FDebugger <> nil);

  if FDebugger.GetDebugger.Breakpoints.Count = 0 then
    Exit;

  Test := TdwsDebuggerBreakpoint.Create;
  try
    Test.Line := ALineNum;
    Test.SourceName := InternalUnitName;

    Index := FDebugger.GetDebugger.Breakpoints.IndexOf(Test);
  finally
    Test.Free;
  end;

  if (Index <> -1) then
  begin
    Breakpoint := FDebugger.GetDebugger.Breakpoints[Index];
    FDebugger.NotifyBreakPoint(Breakpoint, dnBreakPointRemove);
    FDebugger.GetDebugger.Breakpoints.Extract(Breakpoint);
    try
      FDebugger.NotifyBreakPoint(Breakpoint, dnBreakPointRemoved);
    finally
      Breakpoint.Free;
    end;
  end;

  Editor.InvalidateGutterLine(ALineNum);
  Editor.InvalidateLine(ALineNum);
end;

// GetBreakpointStatus
//
function TScriptEditor.GetBreakpointStatus(ALine: Integer): TBreakpointStatus;
var
  Test, Breakpoint: TdwsDebuggerBreakpoint;
  Index: Integer;
begin
  Result := bpsNone;
  if (FDebugger = nil) or (FDebugger.GetDebugger.Breakpoints.Count = 0) then
    Exit;

  Test := TdwsDebuggerBreakpoint.Create;
  try
    Test.Line := ALine;
    Test.SourceName := InternalUnitName;

    Index := FDebugger.GetDebugger.Breakpoints.IndexOf(Test);
  finally
    FreeAndNil(Test);
  end;

  if (Index <> -1) then
  begin
    Breakpoint := FDebugger.GetDebugger.Breakpoints[Index];
    if Breakpoint.Enabled then
      Result := bpsBreakpoint
    else
      Result := bpsBreakpointDisabled;
  end;
end;

function TScriptEditor.GetCanClose: boolean;
begin
  Result := FAllowClose;
end;

function TScriptEditor.GetCaption: string;
begin
  Result := FCaption;
end;

// ClearExecutableLines
//
procedure TScriptEditor.ClearExecutableLines;
var
  I: Integer;
begin
  for I := 0 to FExecutableLines.Size do
    FExecutableLines[I] := False;

  Editor.InvalidateGutter;
end;

// InitExecutableLines
//
procedure TScriptEditor.InitExecutableLines;
begin
  FExecutableLines.Size := 0;
  if Editor.Lines.Count = 0 then
    FExecutableLines.Size := 1
  else
  FExecutableLines.Size := Editor.Lines.Count;
end;

// ShowExecutableLines
//
procedure TScriptEditor.ShowExecutableLines;
begin
  ClearExecutableLines;

  if (FDebugger <> nil) then
  begin
    var LineNumbers := FDebugger.GetExecutableLines(InternalUnitName);
    for var i := 0 to Length(LineNumbers) - 1 do
      FExecutableLines[LineNumbers[i]] := True;
  end;

  Editor.InvalidateGutter;
end;

// ClearLineStates
//
procedure TScriptEditor.ClearLineChangeStates;
var
  I: Integer;
begin
  for I := 0 to Length(FLineChangedState) do
    FLineChangedState[I] := csOriginal;

  Editor.InvalidateGutter;
end;

procedure TScriptEditor.ClearModified;
begin
  FEditor.Modified := False;
  ToggleLineChangedStates;
end;

procedure TScriptEditor.MarkModified(Line: integer);
begin
  if (Line <> -1) then
    FLineChangedState[Line] := csModified;
  FEditor.Modified := True;
  Notify(seNotifyChanged);
end;

function TScriptEditor.CanUndo: boolean;
begin
  Result := (FEditor.CanUndo);
end;

procedure TScriptEditor.Undo;
begin
  FEditor.Undo;
end;

function TScriptEditor.HasSelection: boolean;
begin
  Result := (FEditor.SelAvail);
end;

function TScriptEditor.SearchReplace(const ASearchText, AReplaceText: string; const AOptions: TSearchReplaceOptions): integer;
begin
  var SynSearchOptions: TSynSearchOptions := [];

  if (srMatchCase in AOptions) then
    Include(SynSearchOptions, ssoMatchCase);
  if (srWholeWord in AOptions) then
    Include(SynSearchOptions, ssoWholeWord);
  if (srBackwards in AOptions) then
    Include(SynSearchOptions, ssoBackwards);
  if (srEntireScope in AOptions) then
    Include(SynSearchOptions, ssoEntireScope);
  if (srSelectedOnly in AOptions) then
    Include(SynSearchOptions, ssoSelectedOnly);
  if (srReplace in AOptions) then
    Include(SynSearchOptions, ssoReplace);
  if (srReplaceAll in AOptions) then
    Include(SynSearchOptions, ssoReplaceAll);
  if (srPrompt in AOptions) then
    Include(SynSearchOptions, ssoPrompt);

  if (srRegEx in AOptions) then
    FEditor.SearchEngine := DataModuleEditorSynEditData.SynEditRegexSearch
  else
    FEditor.SearchEngine := DataModuleEditorSynEditData.SynEditSearch;

  Result := FEditor.SearchReplace(ASearchText, AReplaceText, SynSearchOptions);
end;

procedure TScriptEditor.SelectAll;
begin
  FEditor.SelectAll;
end;

function TScriptEditor.GetSelectedText: string;
begin
  Result := FEditor.SelText;
end;

procedure TScriptEditor.SetSelectedText(const Value: string);
begin
  FEditor.SelText := Value;
end;

procedure TScriptEditor.CopyToClipboard;
begin
  FEditor.CopyToClipboard;
end;

procedure TScriptEditor.CutToClipboard;
begin
  FEditor.CutToClipboard;
end;

procedure TScriptEditor.PasteFromClipboard;
begin
  FEditor.PasteFromClipboard;
end;

function TScriptEditor.CanPaste: boolean;
begin
  Result := FEditor.CanPaste;
end;


function TScriptEditor.CloseQuery: boolean;
var
  Res: integer;
begin
  if (Modified) then
  begin
    // Make page visible so user knows which script we're prompting for
    FEditorHost.ActiveEditor := Self;

    Res := MessageTaskDlgEx('Script has been modified.', 'Save changes?', mtConfirmation, [mbYes, mbNo, mbCancel], mbYes);
    if (Res = mrYes) then
    begin
      Save;
      Result := True;
    end else
    if (Res = mrNo) then
    begin
//      ClearModified;
      Result := True;
    end else
      Result := False;
  end else
    Result := True;
end;

// InitLineStates
//
procedure TScriptEditor.InitLineChangeStates;
begin
  SetLength(FLineChangedState, 0);
  if Editor.Lines.Count = 0 then
    SetLength(FLineChangedState, 1)
  else
    SetLength(FLineChangedState, Editor.Lines.Count);
end;

function TScriptEditor.InternalUnitName: string;
begin
  Result := JustFileName(FFileName);
  if (Result = '') or (AnsiSameText(Result, FEditorHost.MainUnitName)) or (FDebugger = nil) or (FDebugger.GetProgram = nil) then
    Result := MSG_MainModule;
end;

procedure TScriptEditor.InvalidateLine(ALine: integer);
begin
  if (ALine <> -1) then
  begin
    FEditor.InvalidateGutterLine(ALine);
    FEditor.InvalidateLine(ALine);
  end else
    FEditor.Invalidate;
end;

// ToggleLineChangedStates
//
procedure TScriptEditor.ToggleLineChangedStates;
var
  Index: Integer;
begin
  for Index := 0 to High(FLineChangedState) do
    if FLineChangedState[Index] = csModified then
      FLineChangedState[Index] := csSaved;

  FEditor.InvalidateGutter;
end;

// SetFileName
//
procedure TScriptEditor.SetFileName(const Value: TFileName);
begin
  FFilename := Value;
  if (Caption = '') and (FFilename <> MSG_MainModule) then
    Caption := JustFileName(FFilename);
end;

procedure TScriptEditor.SetScript(const Value: string);
begin
  FEditor.Lines.Text := Value;
  InitExecutableLines;
  InitLineChangeStates;
end;

function TScriptEditor.GetScriptProvider: IScriptProvider;
begin
  Result := FScriptProvider;
end;

procedure TScriptEditor.SetScriptProvider(const Value: IScriptProvider);
begin
  FScriptProvider := Value;

  if (FScriptProvider <> nil) then
  begin
    Script := FScriptProvider.GetScript;
    IsReadOnly := FScriptProvider.ReadOnly;
    Filename := FScriptProvider.ScriptName;
  end;
end;

procedure TScriptEditor.DpiChanged;
begin
  var FontSize: integer;
  if (ScriptSettings.Editor.FontName <> '') then
    FontSize := ScriptSettings.Editor.FontSize
  else
    FontSize := EditorFontSize;

  DataModuleEditorSynEditData.SynParameters.Font.Size := FEditorHost.DpiScale(FontSize-1);
  DataModuleEditorSynEditData.SynCodeCompletion.Font.Size := FEditorHost.DpiScale(FontSize-1);
end;

function TScriptEditor.Save: boolean;
begin
  Result := False;

  if (FScriptProvider <> nil) then
  begin
    FScriptProvider.SetScript(Script);
    Result := True;
  end;
end;

function TScriptEditor.SaveToStream(Stream: TStream): boolean;
var
  Writer: TStreamWriter;
begin
  Result := True;
  Writer := TStreamWriter.Create(Stream);
  try
    Writer.Write(Script);
  finally
    Writer.Free;
  end;
end;

procedure TScriptEditor.SetCaption(const Value: string);
begin
  FCaption := Value;
  FContainer.SetCaption(FCaption);
end;

procedure TScriptEditor.SetCaretPos(const Value: TBufferPos);
var
  BufferCoord: TBufferCoord;
begin
  BufferCoord.Line := Value.Line;
  BufferCoord.Char := Value.Column;
  Editor.CaretXY := BufferCoord;
end;

function TScriptEditor.GetCaretPos: TBufferPos;
begin
  var BufferCoord := Editor.CaretXY;
  Result.Line := BufferCoord.Line;
  Result.Column := BufferCoord.Char;
end;

function TScriptEditor.GetBlockBegin: TBufferPos;
begin
  var BufferCoord := Editor.BlockBegin;
  Result.Line := BufferCoord.Line;
  Result.Column := BufferCoord.Char;
end;

procedure TScriptEditor.SetBlockBegin(const Value: TBufferPos);
var
  BufferCoord: TBufferCoord;
begin
  BufferCoord.Line := Value.Line;
  BufferCoord.Char := Value.Column;
  Editor.BlockBegin := BufferCoord;
end;

function TScriptEditor.GetBlockEnd: TBufferPos;
begin
  var BufferCoord := Editor.BlockEnd;
  Result.Line := BufferCoord.Line;
  Result.Column := BufferCoord.Char;
end;

procedure TScriptEditor.SetBlockEnd(const Value: TBufferPos);
var
  BufferCoord: TBufferCoord;
begin
  BufferCoord.Line := Value.Line;
  BufferCoord.Char := Value.Column;
  Editor.BlockEnd := BufferCoord;
end;

function TScriptEditor.GetLines: TStrings;
begin
  Result := Editor.Lines;
end;

function TScriptEditor.WordAt(const BufferPos: TBufferPos): string;
var
  CaretXY: TBufferCoord;
begin
  CaretXY.Line := BufferPos.Line;
  CaretXY.Char := BufferPos.Column;

  Result := Editor.GetWordAtRowCol(CaretXY);
end;

function TScriptEditor.WordStart(const BufferPos: TBufferPos): TBufferPos;
var
  CaretXY: TBufferCoord;
begin
  CaretXY.Line := BufferPos.Line;
  CaretXY.Char := BufferPos.Column;

  CaretXY := Editor.WordStartEx(CaretXY);

  Result.Line := CaretXY.Line;
  Result.Column := CaretXY.Char;
end;

procedure TScriptEditor.GotoLine(ALine: Integer; ACol: Integer; MoveCurrent: boolean);
begin
  if (FCurrentLine <> ALine) or (Editor.CaretY <> FCurrentLine) then
  begin
    Editor.InvalidateGutterLine(FCurrentLine);
    Editor.InvalidateLine(FCurrentLine);

    if (MoveCurrent) then
      FCurrentLine := ALine;

    if (ALine > 0) and (Editor.CaretY <> ALine) then
    begin
      Editor.CaretXY := BufferCoord(ACol, ALine);
      Editor.EnsureCursorPosVisibleEx(True, True);
    end;
  end else
  if (FCurrentLine > 0) and (Editor.CaretY <> FCurrentLine) then
  begin
    Editor.CaretXY := BufferCoord(ACol, FCurrentLine);
    Editor.EnsureCursorPosVisibleEx(True, True);
  end;

  Editor.InvalidateGutterLine(ALine);
  Editor.InvalidateLine(ALine);
end;

// IsExecutableLine
//
function TScriptEditor.IsExecutableLine(ALine: Integer): Boolean;
begin
  if ALine < FExecutableLines.Size then
    Result := FExecutableLines[ALine]
  else
    Result := False;
end;

procedure TScriptEditor.LoadFromFile(const AFilename: string);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(AFilename, fmOpenRead);
  try
    LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
  FileName := AFileName;
  FEditor.ReadOnly  := FileIsReadOnly(AFileName);
end;

procedure TScriptEditor.LoadFromStream(Stream: TStream);
var
  Reader: TStreamReader;
  AScript: string;
begin
  Reader := TStreamReader.Create(Stream);
  try
    AScript := Reader.ReadToEnd;
  finally
    Reader.Free;
  end;

  LoadFromString(AScript);
end;

procedure TScriptEditor.LoadFromString(const AScript: string);
begin
  Script := AScript;
end;

// GetLineChangeState
//
function TScriptEditor.GetLineChangeState(ALine: Integer): TLineChangedState;
begin
  if ALine < Length(FLineChangedState) then
    Result := FLineChangedState[ALine]
  else
    Result := csOriginal;
end;

function TScriptEditor.GetScript: string;
begin
  Result := FEditor.Lines.Text;
end;

// UnitName
//
function TScriptEditor.GetUnitName: string;
begin
  if (FFilename <> MSG_MainModule) then
    Result := JustFileName(FFileName)
  else
    Result := Caption;
end;

// SynEditorSpecialLineColors
//
procedure TScriptEditor.SynEditorSpecialLineColors(Sender: TObject;
  Line: Integer; var Special: Boolean; var FG, BG: TColor);
const
  BreakpointColor = TColor($FFA0A0);
  CurrentLineColor = TColor($A0A0F0);
  CurrentLineSteppingColor = TColor($A0C0F0);
begin
  if (Line = FCurrentLine) then
  begin
    Special := TRUE;
    FG := clBlack;
    if (FDebugger = nil) or (FDebugger.GetDebugger.State = dsDebugSuspended) then
      BG := CurrentLineSteppingColor
    else
      BG := CurrentLineColor
  end else
  if (GetBreakpointStatus(Line) = bpsBreakpoint) then
  begin
    Special := TRUE;
    FG := clBlack;
    BG := BreakpointColor;
  end;
end;

// SynEditGutterPaint
//
procedure TScriptEditor.SynEditGutterPaint(Sender: TObject; aLine, X, Y: Integer);
var
  GutterWidth: Integer;
  ImgIndex: Integer;
  R: TRect;
  LineNumText: string;
  LineNumTextRect: TRect;
label
  DrawGutter;
begin
  GutterWidth := FEditorHost.DpiScale(EditorGutterWidth - 5);

  // Ruler background
  if Y = 0 then
  begin
    FEditor.Canvas.Brush.Color := Lighten(clBtnFace, 6);
    R := Rect(FEditorHost.DpiScale(24), 0, GutterWidth, FEditor.Height);
    FEditor.Canvas.FillRect(R);
  end;

  // Ruler cosmetics..
  FEditor.Canvas.Brush.Style := bsClear;
  FEditor.Canvas.Font.Color := clGray;
  FEditor.Canvas.Pen.Color := clGray;

  if ALine = FCurrentLine then
  begin
    if GetBreakpointStatus(ALine) <> bpsNone then
      ImgIndex := ImageIndexCurrentLineBreakpoint
    else
    if (FDebugger = nil) or (FDebugger.GetDebugger.State = dsDebugSuspended) then
      ImgIndex := ImageIndexForwardArrow
    else
      ImgIndex := ImageIndexExecutableLine
  end else
    case GetBreakpointStatus(ALine) of
      bpsBreakpoint:
        if IsExecutableLine(ALine) then
          ImgIndex := ImageIndexBreakpoint
        else
          ImgIndex := ImageIndexBreakpointDisabled;

      bpsBreakpointDisabled:
        ImgIndex := ImageIndexBreakpointDisabled;

     else
       if IsExecutableLine(ALine) then
         ImgIndex := ImageIndexExecutableLine
        else
         ImgIndex := -1;
    end;

  if (ImgIndex >= 0) and (FImages <> nil) then
    FImages.Draw(FEditor.Canvas, X, Y, ImgIndex);

  case GetLineChangeState(aLine - 1) of
    csModified: FEditor.Canvas.Brush.Color := clYellow;
    csSaved: FEditor.Canvas.Brush.Color := clLime;
    csOriginal: goto DrawGutter;
  end;

  R := Rect(FEditorHost.DpiScale(EditorGutterWidth - 5 - 3), y, GutterWidth, y + FEditor.LineHeight);
  FEditor.Canvas.FillRect(R);
  FEditor.Canvas.Brush.Style := bsClear;

DrawGutter:
  GutterWidth := FEditorHost.DpiScale(EditorGutterWidth - 5 - 4);

  if (ALine = 1) or (aLine = FEditor.CaretY) or (ALine mod 10 = 0) then
  begin

    LineNumText := IntToStr(aLine);
    LineNumTextRect := Rect(x, y, GutterWidth, y + FEditor.LineHeight);
    FEditor.Canvas.TextRect(LineNumTextRect, LineNumText, [tfVerticalCenter, tfSingleLine, tfRight]);
  end
  else
  begin
    FEditor.Canvas.Pen.Color := FEditor.Gutter.Font.Color;
    var GutterFrom: integer;
    if (aLine mod 5) = 0 then
      GutterFrom := FEditorHost.DpiScale(EditorGutterWidth - 5 - 4 - 5)
    else
      GutterFrom := FEditorHost.DpiScale(EditorGutterWidth - 5 - 4 - 2);
    Inc(y, FEditor.LineHeight div 2);
    FEditor.Canvas.MoveTo(GutterFrom, y);
    FEditor.Canvas.LineTo(GutterWidth, y);
  end;
end;

// SynEditorKeyDown
//
procedure TScriptEditor.SynEditorKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  inherited;

  GotoLine(-1);
end;

// SynEditorMouseMove
//
procedure TScriptEditor.SynEditorMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  MousePos: TDisplayCoord;
  CursorPos: TBufferCoord;
  BufferPos: TBufferPos;
  SymbolUsage: TSymbolUsage;
begin
  TSynEdit(Sender).InvalidateGutter;

  if (ssDouble in Shift) or (Button <> mbLeft) then
    exit;

  if not (ssCTRL in Shift) then
    Exit;

  MousePos := FEditor.PixelsToRowColumn(X, Y);

  CursorPos := FEditor.DisplayToBufferPos(MousePos);

  if (ssShift in Shift) then
    SymbolUsage := suImplementation
  else
    SymbolUsage := suDeclaration;

  BufferPos.Line := CursorPos.Line;
  BufferPos.Column := CursorPos.Char;
  FindDeclaration(BufferPos, SymbolUsage);
end;

procedure TScriptEditor.SynEditorMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  MouseCoord: TDisplayCoord;
  UnderLine: Integer;
begin
  if FUnderLine > 0 then
    FEditor.InvalidateLine(FUnderLine);

  if ssCtrl in Shift then
  begin
    MouseCoord := FEditor.PixelsToRowColumn(X, Y);
    UnderLine := FEditor.DisplayToBufferPos(MouseCoord).Line;
    if UnderLine <> FUnderLine then
    begin
      FUnderLine := UnderLine;
      FEditor.InvalidateLine(FUnderLine);
    end;
  end
  else
    FUnderLine := -1;
end;

procedure TScriptEditor.SynEditorProcessCommand(Sender: TObject; var Command: TSynEditorCommand; var AChar: Char; Data: pointer);
var
  Coord, NextCoord: TBufferCoord;
  ThisWord, NextWord: string;
  i: integer;
const
  sBlockKeywords: array[0..0, 0..1] of string = (('begin', 'end'));
begin
  if (Command = ecLineBreak) then
  begin
    Coord := Editor.CaretXY;
    Dec(Coord.Char);

    if (Editor.CaretX <> Editor.WordEndEx(Coord).Char) then
      exit;

    NextCoord := Editor.NextWordPosEx(Coord);
    if (Coord.Line = NextCoord.Line) and (Coord.Char <> NextCoord.Char) then
      exit;

    ThisWord := Editor.GetWordAtRowCol(Coord);
    NextWord := Editor.GetWordAtRowCol(NextCoord);

    for i := Low(sBlockKeywords) to High(sBlockKeywords) do
      if (AnsiSameText(ThisWord, sBlockKeywords[i, 0])) then
      begin
        if (AnsiSameText(NextWord, sBlockKeywords[i, 1])) then
          exit;

        Command := ecAutoCompletion;

        break;
      end;
  end;
end;

procedure TScriptEditor.SynEditorStatusChange(Sender: TObject; Changes: TSynStatusChanges);
begin
  if (scModified in Changes) then
    Notify(seNotifyChanged);
end;

// SynEditorCommandProcessed
//
procedure TScriptEditor.SynEditorCommandProcessed(Sender: TObject; var Command: TSynEditorCommand; var AChar: Char; Data: Pointer);
var
  Handled: boolean;
begin
  case Command of
    ecGotoXY:
      NotifyActionHandlers(seActionGotoLineNumber, Handled);

    ecOpenFileUnderCursor:
      NotifyActionHandlers(seActionOpenFileUnderCursor, Handled);

    ecToggleDeclImpl:
      NotifyActionHandlers(seActionToggleDeclImpl, Handled);

    ecRepeatSearch:
      NotifyActionHandlers(seActionRepeatSearch, Handled);

    ecToggleBreakPoint:
      begin
        NotifyActionHandlers(seActionToggleBreakPoint, Handled);
        if (not Handled) and (Editor.CaretY < FExecutableLines.Size) then
        begin
          if (GetBreakpointStatus(Editor.CaretY) <> bpsNone) then
            ClearBreakpoint(Editor.CaretY)
          else
            AddBreakpoint(Editor.CaretY, True);
          Editor.Repaint;
        end;
      end;

    ecAutoCompletionPropose:
      begin
        NotifyActionHandlers(seActionAutoCompletionPropose, Handled);
        if (not Handled) then
          DataModuleEditorSynEditData.ExecuteSynCodeCompletion(FEditor);
      end;

    ecContextHelp:
      NotifyActionHandlers(seActionContextHelp, Handled);

    ecInsertGUID:
      Editor.SelText := ''''+TGUID.NewGuid.ToString+'''';

    ecSelectNextTab:
      NotifyActionHandlers(seActionSelectNextTab, Handled);

    ecSelectPrevTab:
      NotifyActionHandlers(seActionSelectPrevTab, Handled);
  end;
end;

// SynEditorGutterClick
//
procedure TScriptEditor.SynEditorGutterClick(Sender: TObject;
  Button: TMouseButton; X, Y, Line: Integer; Mark: TSynEditMark);
var
  iLine: Integer;
begin
  iLine := Editor.RowToLine(Line);
  if iLine < FExecutableLines.Size then
  begin
    if GetBreakpointStatus(Line) <> bpsNone then
      ClearBreakpoint(iLine)
    else
      AddBreakpoint(iLine, True);
    Editor.Repaint;
  end;
end;

// SaveToFile
//
function TScriptEditor._SaveToFile(APromptOverwrite: Boolean): Boolean;
begin
  Result := _SaveToFile(FileName, APromptOverwrite);
end;

function TScriptEditor._SaveToFile(const AFilename: string; APromptOverwrite: Boolean): boolean;
begin
  Result := False;

  if (APromptOverwrite) and (FileExists(AFileName)) then
  begin
    if (not ConfirmDlgYesNoAbort(Format(RStrFileAlreadyExistsOverwrite, [AFileName]))) then
      exit;
  end;

  SaveTextToUTF8File(AFileName, UTF8String(Editor.Lines.Text));

  ClearModified;

  Result := True;
end;

// SaveIfModified
//
procedure TScriptEditor._SaveIfModified(APromptOverwrite: Boolean);
begin
  if Editor.Modified then
    if not APromptOverwrite or (not FileExists(FileName)) or ConfirmDlgYesNoAbort(Format(RStrFileHasChanged,  [ ExtractFileName(FileName) ])) then
      _SaveToFile(False);
end;

// SaveAs
//
function TScriptEditor._SaveAs: boolean;
var
  s: string;
  Folder: string;
begin
  Result := False;

  Folder := '';

  if (AnsiSameText(FileName, MSG_MainModule)) then
  begin
    s := Caption;
  end else
  begin
    s := TPath.GetFileName(FileName);
    Folder := TPath.GetDirectoryName(FileName);
  end;

  if (Folder <> '') then
    Folder := ScriptSettings.Folders.FolderScript;

  if (not FEditorHost.PromptSaveScript(s, Folder)) then
    exit;

  Notify(seNotifySaving);

  Result := _SavetoFile(s, False);

  if (not Result) then
    exit;

  Caption := '';
  ScriptProvider := TFileScriptProvider.Create(s);
  ScriptSettings.Folders.FolderScript := TPath.GetDirectoryName(s);

  Notify(seNotifySaved);
end;

function EditorFactory(const AEditorHost: IScriptEditorHost; AContainerControl: TWinControl): IScriptEditor;
begin
  var Container: IScriptEditorContainer := TScriptEditorContainer.Create(AContainerControl);

  Result := TScriptEditor.Create(AEditorHost, Container);
end;

procedure ScriptDebuggerInitialized(const AScriptDebugger: IScriptDebugger);
begin
  // This both ensures that DataModuleEditorSynEditData has been instantiated and
  // it passes the debugger interface on to it.
  DataModuleEditorSynEditData.SetScriptDebugger(AScriptDebugger);
end;

initialization
  ScriptEditorFactory.RegisterFactory(EditorFactory);
  ScriptDebuggerFactory.RegisterNotification(ScriptDebuggerInitialized);
end.
