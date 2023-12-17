unit amScript.Editor.API;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Types,
  Vcl.Controls,
  Vcl.Menus,
  Vcl.ImgList,
  dwsSymbolDictionary,
  dwsSuggestions,
  amScript.Provider.API;

// -----------------------------------------------------------------------------
//
// Code completion stuff
//
// -----------------------------------------------------------------------------
const
  SuggestionCategoryNames: array[TdwsSuggestionCategory] of string = (
    'Unknown',
    'Unit',
    'Type',
    'Class',
    'Record',
    'Interface',
    'Delegate',
    'Function',
    'Procedure',
    'Method',
    'Constructor',
    'Destructor',
    'Property',
    'Enum',
    'Element',
    'Parameter',
    'Field',
    'Variable',
    'Const',
    'Reserved',
    'Special'
    );

  SuggestionCategoryShortNames: array[TdwsSuggestionCategory] of string = (
    'unknown',
    'unit',
    'type',
    'class',
    'record',
    'interface',
    'delegate',
    'function',
    'procedure',
    'method',
    'constructor',
    'destructor',
    'property',
    'enum',
    'element',
    'param',
    'field',
    'var',
    'const',
    'reserved',
    'special'
  );

// -----------------------------------------------------------------------------
//
// IScriptEditor
//
// -----------------------------------------------------------------------------
type
  IScriptEditor = interface;

  TScriptEditorNotification = (
    seNotifyInitialize,
    seNotifyFinalize,
    seNotifyActivate,
    seNotifyDeactivate,
    seNotifyClose,
    seNotifySaving,
    seNotifySaved,
    seNotifyChanged
  );

  IScriptEditorNotification = interface
    ['{681FCB76-C436-4CBE-89DB-0A1A1F425595}']
    procedure ScriptEditorNotification(const AEditor: IScriptEditor; ANotification: TScriptEditorNotification);
  end;

  TScriptEditorAction = (
    seActionGotoLineNumber,
    seActionOpenFileUnderCursor,
    seActionToggleDeclImpl,
    seActionRepeatSearch,
    seActionToggleBreakPoint,
    seActionAutoCompletionPropose,
    seActionContextHelp,
    seActionSelectNextTab,
    seActionSelectPrevTab
  );

  IScriptEditorActionHandler = interface
    ['{52730461-FD76-4DB3-9217-764DAF7C6489}']
    function EditorActionHandler(const AEditor: IScriptEditor; AAction: TScriptEditorAction): boolean;
  end;

  IScriptEditorInternal = interface
    ['{80772E3F-7F74-4088-885B-284ACA0D02D7}']
    procedure Initialize(AImages: TCustomImageList);
    procedure Finalize;
  end;

  TBufferPos = record
    Line: integer;
    Column: integer;

    class operator Equal(const a, b: TBufferPos): Boolean;
    class operator Implicit(const a: TBufferPos): TPoint;
  end;

  TSearchReplaceOptions = set of (srRegEx, srMatchCase, srWholeWord, srBackwards, srEntireScope, srSelectedOnly, srReplace, srReplaceAll, srPrompt);

  TScriptEditorHostNotification = (
    ehNotifyCompiled,
    ehNotifyResetDebugState,
    ehNotifyDpiChanged,
    ehNotifyInvalidate
  );

  IScriptEditor = interface
    ['{4CAE41F8-188A-420C-AC60-48E7699DE047}']
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
    property Lines: TStrings read GetLines;

    procedure FindDeclaration(const ABufferPos: TBufferPos; ASymbolUsage: TSymbolUsage);

    function GetHasProvider: boolean;
    property HasProvider: boolean read GetHasProvider;

    function GetScriptProvider: IScriptProvider;
    procedure SetScriptProvider(const Value: IScriptProvider);
    property ScriptProvider: IScriptProvider read GetScriptProvider write SetScriptProvider;

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

    function  GetFilename: TFileName;
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
  end;

// -----------------------------------------------------------------------------
//
// IScriptEditorContainer
//
// -----------------------------------------------------------------------------
// Facilitates "communication" from the editor to the container control.
// Specifically it allows the editor to embed itself within the container
// control and to set the caption of the container control.
// The object is owned, via reference counting, by the editor.
// -----------------------------------------------------------------------------
// The IScriptEditorContainer object is created by the ScriptEditorFactory.
// -----------------------------------------------------------------------------
type
  IScriptEditorContainer = interface
    ['{4010092B-5B02-4966-984A-57F8A3C991C1}']
    // SetCaption is called by the editor to update the caption of the container
    // (e.g. a tab sheet).
    procedure SetCaption(const ACaption: string);

    // EmbedEditorControl is called by the editor to embed the editor control
    // within the container control.
    procedure EmbedEditorControl(AControl: TControl);
  end;

// -----------------------------------------------------------------------------
//
// IScriptEditorHost
//
// -----------------------------------------------------------------------------
type
  IScriptEditorHost = interface
    ['{AEBC9E98-DFDD-432C-93E1-05579594520A}']
    function CreateEditor(const AName: string; FileMustExist: boolean; const CurrentScriptProvider: IScriptProvider): Boolean; overload;
//    function CreateEditor(const ScriptProvider: IScriptProvider = nil): IScriptEditor; overload;

    function GetMainUnit: IScriptEditor;
    procedure SetMainUnit(const Value: IScriptEditor);
    property MainUnit: IScriptEditor read GetMainUnit write SetMainUnit;
    function GetMainUnitName: string;
    property MainUnitName: string read GetMainUnitName;

    function GetActiveEditor: IScriptEditor;
    procedure SetActiveEditor(const Editor: IScriptEditor);
    property ActiveEditor: IScriptEditor read GetActiveEditor write SetActiveEditor;

    function GetEditorPagePopupMenu: TPopupMenu;

    function PromptSaveScript(var Filename: string; const Foldername: string = ''): boolean;

    function DpiScale(Value: Integer): Integer;
  end;

type
  TScriptDebuggerEditorFactory = function(const AEditorHost: IScriptEditorHost; AContainerControl: TWinControl): IScriptEditor;

  ScriptEditorFactory = record
    class procedure RegisterFactory(Factory: TScriptDebuggerEditorFactory); static;
    class function CreateEditor(const AEditorHost: IScriptEditorHost; AContainerControl: TWinControl): IScriptEditor; static;
  end;

implementation

var
  FEditorFactory: TScriptDebuggerEditorFactory;

class procedure ScriptEditorFactory.RegisterFactory(Factory: TScriptDebuggerEditorFactory);
begin
  FEditorFactory := Factory;
end;

class function ScriptEditorFactory.CreateEditor(const AEditorHost: IScriptEditorHost; AContainerControl: TWinControl): IScriptEditor;
begin
  Assert(Assigned(FEditorFactory));
  Result := FEditorFactory(AEditorHost, AContainerControl);
end;

{ TBufferPos }

class operator TBufferPos.Equal(const a, b: TBufferPos): Boolean;
begin
  Result := (a.Line = b.Line) and (a.Column = b.Column);
end;

class operator TBufferPos.Implicit(const a: TBufferPos): TPoint;
begin
  Result.X := a.Column;
  Result.Y := a.Line;
end;

end.
