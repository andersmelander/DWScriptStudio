unit amScriptDebuggerMain;

(*
 * Copyright © 2011 Brian Frost
 * Copyright © 2019 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

// -----------------------------------------------------------------------------
//
// Main editor/debugger form
//
// -----------------------------------------------------------------------------
// TODO:
// - Remove or rewrite old, disabled project stuff.
// - Replace monolithic editor/page design. Move editor to separate unit.
// - Make editor abstract so it can easily be replaced with something else.
// - Add configuration, persistence and UI (with Package/Bundle mgmt).
// - Add bundle builder UI.
// -----------------------------------------------------------------------------

{.$define LEAK_CHECK}

{.$define FEATURE_SCRIPT_BUNDLE}
{.$define FEATURE_PACKAGE_INSTALLER}
{.$define FEATURE_COPY_PROTECT}
{.$define FEATURE_LICENSING}

{$ifdef DISABLED_STUFF}
{$endif DISABLED_STUFF}
uses
  Generics.Collections,
  Types, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Themes, UxTheme, Dialogs, StdCtrls, ExtCtrls, ActnList, ComCtrls,
  StdActns, Menus, ToolWin, ActnCtrls, ImgList, System.ImageList, Diagnostics,
  System.Actions, Winapi.ShlObj,
  XMLIntf, XMLDoc,
  ActiveX,

  dxSkinsCore, dxSkinscxPCPainter, cxPCdxBarPopupMenu, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxPC, dxSkinsdxBarPainter, dxBar, cxClasses, dxSkinsdxDockControlPainter,
  dxDockControl, dxDockPanel, dxSkinsdxStatusBarPainter, dxStatusBar, dxRibbonSkins, dxSkinsdxRibbonPainter, dxRibbon,
  dxRibbonForm,
  dxBarBuiltInMenu, dxRibbonCustomizationForm, dxSkinsForm, dxBarApplicationMenu,
  dxBarExtItems, cxImageList, cxShellCommon, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxShellComboBox, cxListView, cxShellListView,

  SynEdit, SynEditHighlighter, SynHighlighterDWS, SynEditTypes,
  SynEditKeyCmds, SynEditMiscClasses, SynEditSearch, SynEditPlugins,
  SynMacroRecorder, SynCompletionProposal, SynEditAutoComplete,
  SynEditRegexSearch,

  DragDrop, DropTarget, DragDropFile,

  dwsExprs, dwsComp, dwsCompiler, dwsDebugger, dwsStringResult, dwsErrors,
  dwsFunctions, dwsUtils, dwsSymbols, dwsUnitSymbols, dwsStrings,
{$ifndef OLD_DWSCRIPT}
  dwsSymbolDictionary,
  dwsInfo,
  dwsScriptSource,
{$endif OLD_DWSCRIPT}

  // UDwsIdeConfig,
  amScriptAPI,
  amScriptDebuggerAPI,
  amScriptHostAPI,
  amScriptModule,
  amScriptProviderAPI,
  amScriptDebuggerDialogGotoLine,
  amScriptDebuggerDialogEvaluate,
  amScriptDebuggerFrameLocalVariables,
  amScriptDebuggerFrameWatches,
  amScriptDebuggerFrameCallStack,
  amScriptDebuggerFrameSymbols,
  amScriptDebuggerFrameStack,
  amScriptDebuggerFrameAST,
  amScriptDebuggerFrameBreakPoints;

const
  ecOpenFileUnderCursor = ecUserFirst;
  ecToggleDeclImpl = ecUserFirst + 1;
  ecRepeatSearch = ecUserFirst + 2;
  ecToggleBreakPoint = ecUserFirst + 3;
  ecAutoCompletionPropose = ecUserFirst + 4;
  ecInsertGUID = ecUserFirst + 5;
  ecSelectNextTab = ecUserFirst + 6;
  ecSelectPrevTab = ecUserFirst + 7;

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

const
  MSG_EXEC_RESET = WM_USER;
  MSG_FORM_MAXIMIZE = WM_USER+1;

type
  TFormScriptDebugger  = class;

  TLineChangedState = (csOriginal, csModified, csSaved);
  TLineNumbers = array of Integer;

// -----------------------------------------------------------------------------
//
// TEditorPage
//
// -----------------------------------------------------------------------------
  TEditorPage = class(TObject, IUnknown, IScriptDebugEditPage)
  private
    FEditor: TSynEdit;
    FPage: TcxTabSheet;
    FForm: TFormScriptDebugger;
    FExecutableLines: TBits;
    FLineChangedState: array of TLineChangedState;
    FCurrentLine: Integer;
    FUnderLine: Integer;
    FFilename: string;
    FCaption: string;
    FScriptProvider: IScriptProvider;

    function  GetFilename: TFileName;
    procedure SetFileName(const Value: TFileName);

    procedure SetCurrentLine(ALine: Integer; ACol: Integer = 1; MoveCurrent: boolean = True);
    procedure SynEditGutterPaint(Sender: TObject; aLine, X, Y: Integer);
    procedure SynEditorKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure SynEditorSpecialLineColors(Sender: TObject; Line: Integer; var Special: Boolean; var FG, BG: TColor);
    procedure SynEditorGutterClick(Sender: TObject; Button: TMouseButton; X, Y, Line: Integer; Mark: TSynEditMark);
    procedure SynEditorMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure SynEditorMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SynEditorProcessCommand(Sender: TObject; var Command: TSynEditorCommand; var AChar: Char; Data: pointer);
    procedure SynEditorCommandProcessed(Sender: TObject; var Command: TSynEditorCommand; var AChar: Char; Data: Pointer);
    procedure SynEditorStatusChange(Sender: TObject; Changes: TSynStatusChanges);
    function GetIsReadOnly: Boolean;
    procedure SetIsReadOnly(const Value: Boolean);
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
    function GetScript: string;
    procedure SetScript(const Value: string);
    function GetModified: boolean;
    function GetCanClose: boolean;
    procedure SetCanClose(const Value: boolean);
    function GetCaption: string;
    procedure SetCaption(const Value: string);
    function GetIndex: integer;
    procedure SetScriptProvider(const Value: IScriptProvider);
    function GetIsMainUnit: boolean;

    procedure FindDeclaration(CursorPos: TBufferCoord; SymbolUsage: TSymbolUsage);
  protected
    // IUnknown
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  public
    constructor Create(AOwner: TFormScriptDebugger; APage: TcxTabSheet); reintroduce;
    destructor Destroy; override;

    procedure LoadFromFile(const AFilename: string);
    procedure LoadFromStream(Stream: TStream);
    procedure LoadFromString(const AScript: string);

    function _SaveToFile(APromptOverwrite: Boolean): boolean; overload;
    function _SaveToFile(const AFilename: string; APromptOverwrite: Boolean): boolean; overload;
    function SaveToStream(Stream: TStream): boolean;

    procedure _SaveIfModified(APromptOverwrite: Boolean);
    function _SaveAs: boolean;
    function Save: boolean;

    function GetHasProvider: boolean;
    property HasProvider: boolean read GetHasProvider;

    property Script: string read GetScript write SetScript;
    property ScriptProvider: IScriptProvider read FScriptProvider write SetScriptProvider;

    procedure ToggleDeclImpl;
    procedure GotoLineNumber;
    procedure OpenFileUnderCursor;

    procedure PerformContextHelp;

    function GotoIdentifier(const AIdentifier: string): Boolean;
    procedure ShowExecutableLines;
    procedure ToggleLineChangedStates;

    function UnitName: string;
    function InternalUnitName: string;

    function CloseQuery: boolean;

    property Editor: TSynEdit read FEditor;
    property FileName: TFileName read GetFilename write SetFileName;
    property IsReadOnly: Boolean read GetIsReadOnly write SetIsReadOnly;
{$ifdef DISABLED_STUFF}
    property IsProjectSourcefile: Boolean read GetIsProjectSourcefile;
{$endif DISABLED_STUFF}
    property Modified: boolean read GetModified;
    procedure ClearModified;
    procedure MarkModified(Line: integer = -1);
    property CanClose: boolean read GetCanClose write SetCanClose;
    property Caption: string read GetCaption write SetCaption;
    property Index: integer read GetIndex;
    property IsMainUnit: boolean read GetIsMainUnit;
  end;


  TMessageKind = (mkNone, mkInfo, mkWarning, mkError);

  TDebuggerExecutionEvent = procedure(const Execution: IdwsProgramExecution) of object;

// -----------------------------------------------------------------------------
//
//              TFormScriptDebugger
//
// -----------------------------------------------------------------------------
  TFormScriptDebugger = class(TdxRibbonForm, IScriptDebugger, IScriptDebuggerSetup,
    IScriptHostApplicationNotification, IScriptHostApplicationCloseNotification)
    ActionBuild: TAction;
    ActionClearAllBreakpoints: TAction;
    ActionCloseAllOtherPages: TAction;
    ActionClosePage: TAction;
    ActionEditClearOutputWindow: TAction;
    ActionEditCopyToClipboard: TAction;
    ActionEditCut: TAction;
    ActionEditDelete: TAction;
    ActionEditPaste: TAction;
    ActionEditSelectAll: TAction;
    ActionEditToggleReadOnly: TAction;
    ActionEditUndo: TAction;
    ActionFileCloseAll: TAction;
    ActionFileNewIncludeFile: TAction;
    ActionFileNewProject: TAction;
    ActionFileNewUnit: TAction;
    ActionFileOpenProject: TAction;
    ActionFileSave: TAction;
    ActionFileSaveAsFile: TAction;
    ActionFileSaveProjectAs: TAction;
    ActionGotoHomePosition: TAction;
    ActionGotoLineNumber: TAction;
    ActionList: TActionList;
    ActionOpenFile: TAction;
    ActionProgramReset: TAction;
    ActionRun: TAction;
    ActionRunWithoutDebugging: TAction;
    ActionSearchFind: TAction;
    ActionSearchReplace: TAction;
    ActionShowExecutionPoint: TAction;
    ActionStepOver: TAction;
    ActionTraceInto: TAction;
    ActionViewProjectSource: TAction;
    ActionViewSymbols: TAction;
    Debugger: TdwsDebugger;
    EditorPagePopupMenu: TPopupMenu;
    MenuItemBuild: TMenuItem;
    MenuItemCloseAllOtherPages: TMenuItem;
    MenuItemClosePagexx: TMenuItem;
    MenuItemCopy: TMenuItem;
    MenuItemCut: TMenuItem;
    MenuItemDelete: TMenuItem;
    MenuItemPaste: TMenuItem;
    MenuItemReadOnly: TMenuItem;
    MenuItemRun1: TMenuItem;
    MenuItemRunWithoutDebugging: TMenuItem;
    MenuItemSave: TMenuItem;
    MenuItemSelectAll: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N6: TMenuItem;
    N9: TMenuItem;
    OpenFileDialog: TFileOpenDialog;
    OpenProjectDialog: TFileOpenDialog;
    SaveProjectDialog: TFileSaveDialog;
    SaveSourceDialog: TFileSaveDialog;
    SmallImages: TcxImageList;
    SynCodeCompletion: TSynCompletionProposal;
    SynEditSearch: TSynEditSearch;
    SynMacroRecorder: TSynMacroRecorder;
    SynParameters: TSynCompletionProposal;
    UpdateTimer: TTimer;
    ActionExit: TAction;
    dxBarManager1: TdxBarManager;
    MenuItemFileNewProject: TdxBarButton;
    MenuItemFileNewUnit: TdxBarButton;
    MenuItemFileNewInclude: TdxBarButton;
    MenuItemFileNew: TdxBarSubItem;
    MenuItemFileOpen: TdxBarButton;
    MenuItemFileOpenProject: TdxBarButton;
    MenuItemFileSave: TdxBarButton;
    MenuItemFileSaveAs: TdxBarButton;
    MenuItemFileSaveProjectAs: TdxBarButton;
    MenuItemFileCloseAll: TdxBarButton;
    MenuItemFileExit: TdxBarButton;
    MenuItemEditCut: TdxBarButton;
    MenuItemEditCopy: TdxBarButton;
    MenuItemEditPaste: TdxBarButton;
    MenuItemEditDelete: TdxBarButton;
    MenuItemEditSelectAll: TdxBarButton;
    MenuItemEditUndo: TdxBarButton;
    MenuItemEditReadOnly: TdxBarButton;
    MenuItemSearchFind: TdxBarButton;
    MenuItemSearchReplace: TdxBarButton;
    MenuItemViewProjectSource: TdxBarButton;
    MenuItemViewSymbols: TdxBarButton;
    ButtonGotoHomePosition: TdxBarButton;
    MenuItemProjectBuild: TdxBarButton;
    MenuItemRunStart: TdxBarButton;
    MenuItemRunStepOver: TdxBarButton;
    MenuItemRunTraceInto: TdxBarButton;
    MenuItemRunReset: TdxBarButton;
    MenuItemRunShowExecutionPoint: TdxBarButton;
    MenuItemRunClearAllBreakpoints: TdxBarButton;
    ImageListMessage: TcxImageList;
    DockingManager: TdxDockingManager;
    DockPanelLocalVars: TdxDockPanel;
    DockPanelWatches: TdxDockPanel;
    DockPanelCallStack: TdxDockPanel;
    DockPanelMessages: TdxDockPanel;
    ListViewMessages: TListView;
    DockPanelOutput: TdxDockPanel;
    MemoOutputWindow: TMemo;
    DockSiteMain: TdxDockSite;
    DockPanelMain: TdxDockPanel;
    dxLayoutDockSite3: TdxLayoutDockSite;
    PageControlEditor: TcxPageControl;
    dxLayoutDockSite1: TdxLayoutDockSite;
    dxVertContainerDockSite1: TdxVertContainerDockSite;
    StatusBar: TdxStatusBar;
    DockPanelSymbols: TdxDockPanel;
    dxLayoutDockSite2: TdxLayoutDockSite;
    LayoutDockSiteLeft: TdxLayoutDockSite;
    TabContainerDockSiteBottom: TdxTabContainerDockSite;
    RibbonTabEditor: TdxRibbonTab;
    RibbonDebug: TdxRibbon;
    dxBarManager1Bar4: TdxBar;
    dxBarManager1Bar5: TdxBar;
    dxBarManager1Bar6: TdxBar;
    dxBarManager1Bar7: TdxBar;
    dxBarManager1Bar8: TdxBar;
    RibbonTabFile: TdxRibbonTab;
    dxBarManager1Bar9: TdxBar;
    RibbonTabDebug: TdxRibbonTab;
    dxBarManager1Bar10: TdxBar;
    dxBarManager1Bar11: TdxBar;
    dxBarManager1Bar12: TdxBar;
    ImagesLarge: TcxImageList;
    dxBarManager1Bar1: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    ActionRunResume: TAction;
    ActionRunPause: TAction;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarButton4: TdxBarButton;
    ActionRunStepOut: TAction;
    SynEditRegexSearch: TSynEditRegexSearch;
    ActionSearchAgain: TAction;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    SynAutoComplete: TSynAutoComplete;
    ImageListSymbols: TcxImageList;
    DockPanelBreakProints: TdxDockPanel;
    ScriptDebuggerBreakPointsFrame: TScriptDebuggerBreakPointsFrame;
    ActionDebugEvaluate: TAction;
    ActionDebug: TAction;
    Debug1: TMenuItem;
    N2: TMenuItem;
    EvaluateModify1: TMenuItem;
    dxBarSubItem1: TdxBarSubItem;
    ActionFileSaveAsAttachment: TAction;
    dxBarButton3: TdxBarButton;
    dxBarButton8: TdxBarButton;
    ActionDebugBreakOnPoop: TAction;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarManager1Bar2: TdxBar;
    ButtonRefactorNormalizeCase: TdxBarButton;
    DockPanelStack: TdxDockPanel;
    dxBarButton13: TdxBarButton;
    dxBarButton14: TdxBarButton;
    dxBarButton15: TdxBarButton;
    dxBarButton16: TdxBarButton;
    dxBarButton17: TdxBarButton;
    dxBarButton18: TdxBarButton;
    dxBarButton19: TdxBarButton;
    dxBarButton20: TdxBarButton;
    ActionViewCallStack: TAction;
    ActionViewLocals: TAction;
    ActionViewWatches: TAction;
    ActionViewStack: TAction;
    ActionViewMessages: TAction;
    ActionViewOutput: TAction;
    ActionViewBreakpoints: TAction;
    dxBarButton21: TdxBarButton;
    dxBarButton22: TdxBarButton;
    DockPanelAST: TdxDockPanel;
    dxTabContainerDockSite1: TdxTabContainerDockSite;
    ActionViewAST: TAction;
    dxBarButton23: TdxBarButton;
    dxBarButton24: TdxBarButton;
    BarSubItemDebugPanes: TdxBarSubItem;
    RibbonDebugTabTools: TdxRibbonTab;
    dxBarManager1Bar3: TdxBar;
    ActionToolDocBuild: TAction;
    ButtonToolProtect: TdxBarLargeButton;
    dxBarManager1Bar13: TdxBar;
    ActionToolCopyProtect: TAction;
    ActionRunInitialization: TAction;
    ActionRunFinalization: TAction;
    dxBarButton25: TdxBarButton;
    dxBarButton26: TdxBarButton;
    DropFileTarget1: TDropFileTarget;
    ActionToolBundle: TAction;
    dxBarLargeButton5: TdxBarLargeButton;
    ButtonToolDocument: TdxBarSubItem;
    ButtonToolDocumentXML: TdxBarButton;
    ButtonToolDocumentSource: TdxBarButton;
    BarManagerBarQuickAccess: TdxBar;
    BarManagerBarLayout: TdxBar;
    BarComboLayout: TdxBarCombo;
    BarButtonLayoutSave: TdxBarButton;
    BarButtonLayoutDefaultEdit: TdxBarButton;
    BarButtonLayoutDefaultDebug: TdxBarButton;
    ActionLayoutDefaultEdit: TAction;
    ActionLayoutDefaultDebug: TAction;
    ActionLayoutSave: TAction;
    ActionRefactorNormalizeCase: TAction;
    ActionRefactorIdentifierRename: TAction;
    ButtonRefactorRename: TdxBarButton;
    PopupMenuMessages: TPopupMenu;
    ActionMessagesClear: TAction;
    Clear1: TMenuItem;
    BarSubItemGoto: TdxBarSubItem;
    ButtonGotoDeclaration: TdxBarButton;
    ButtonGotoImplementation: TdxBarButton;
    ActionGotoDeclaration: TAction;
    ActionGotoImplementation: TAction;
    ButtonRefactorUsage: TdxBarButton;
    ActionToolHeader: TAction;
    ButtonToolHeader: TdxBarLargeButton;
    ActionRefactorSearchSymbol: TAction;
    dxBarButton12: TdxBarButton;
    ActionFileMainUnit: TAction;
    PopupMenuEditorTabs: TdxRibbonPopupMenu;
    MenuItemFileClose: TdxBarButton;
    MenuItemFileCloseOtherPages: TdxBarButton;
    MenuItemFileMainUnit: TdxBarButton;
    MenuItemFileReadOnlyToggle: TdxBarButton;
    BarApplicationMenu: TdxBarApplicationMenu;
    BarButtonLiveObjects: TdxBarButton;
    ActionDebugLiveObjects: TAction;
    BarStaticSpacer: TdxBarStatic;
    DockPanelFileExplorer: TdxDockPanel;
    ShellListViewFileExplorer: TcxShellListView;
    ShellComboBoxFileExplorer: TcxShellComboBox;
    dxBarButton27: TdxBarButton;
    ActionViewFileExplorer: TAction;
    dxLayoutDockSite4: TdxLayoutDockSite;
    dxLayoutDockSite5: TdxLayoutDockSite;
    ButtonToolDocumentBuild: TdxBarButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActionBuildExecute(Sender: TObject);
    procedure ActionClearAllBreakpointsExecute(Sender: TObject);
    procedure ActionEditClearOutputWindowExecute(Sender: TObject);
    procedure ActionEditClearOutputWindowUpdate(Sender: TObject);
    procedure ActionCloseAllOtherPagesExecute(Sender: TObject);
    procedure ActionCloseAllOtherPagesUpdate(Sender: TObject);
    procedure ActionClosePageExecute(Sender: TObject);
    procedure ActionClosePageUpdate(Sender: TObject);
    procedure ActionFileCloseAllExecute(Sender: TObject);
    procedure ActionFileNewIncludeFileExecute(Sender: TObject);
    procedure ActionFileNewProjectExecute(Sender: TObject);
    procedure ActionFileNewUnitExecute(Sender: TObject);
    procedure ActionFileSaveAsFileExecute(Sender: TObject);
    procedure ActionFileSaveAsFileUpdate(Sender: TObject);
    procedure ActionFileSaveExecute(Sender: TObject);
    procedure ActionFileSaveUpdate(Sender: TObject);
    procedure ActionGotoHomePositionExecute(Sender: TObject);
    procedure ActionGotoHomePositionUpdate(Sender: TObject);
    procedure ActionOpenFileExecute(Sender: TObject);
    procedure ActionFileOpenProjectExecute(Sender: TObject);
    procedure ActionProgramResetExecute(Sender: TObject);
    procedure ActionProgramResetUpdate(Sender: TObject);
    procedure ActionRunExecute(Sender: TObject);
    procedure ActionRunUpdate(Sender: TObject);
    procedure ActionRunWithoutDebuggingExecute(Sender: TObject);
    procedure ActionRunWithoutDebuggingUpdate(Sender: TObject);
    procedure ActionFileSaveProjectAsExecute(Sender: TObject);
    procedure ActionShowExecutionPointExecute(Sender: TObject);
    procedure ActionShowExecutionPointUpdate(Sender: TObject);
    procedure ActionStepOverExecute(Sender: TObject);
    procedure ActionStepOverUpdate(Sender: TObject);
    procedure ActionEditToggleReadOnlyExecute(Sender: TObject);
    procedure ActionEditToggleReadOnlyUpdate(Sender: TObject);
    procedure ActionTraceIntoExecute(Sender: TObject);
    procedure ActionTraceIntoUpdate(Sender: TObject);
    procedure ActionViewProjectSourceExecute(Sender: TObject);
    procedure ActionViewProjectSourceUpdate(Sender: TObject);
    procedure ActionViewSymbolsExecute(Sender: TObject);
    procedure ActionViewSymbolsUpdate(Sender: TObject);
    procedure DebuggerStateChanged(Sender: TObject);
    procedure EditorChange(Sender: TObject);
    procedure UpdateTimerTimer(Sender: TObject);
    procedure SynCodeCompletionExecute(Kind: SynCompletionType; Sender: TObject; var CurrentInput: string; var x, y: Integer; var CanExecute: Boolean);
    procedure SynCodeCompletionShow(Sender: TObject);
    procedure SynParametersExecute(Kind: SynCompletionType; Sender: TObject; var CurrentInput: string; var x, y: Integer; var CanExecute: Boolean);
    procedure ActionGotoLineNumberExecute(Sender: TObject);
    procedure ActionGotoLineNumberUpdate(Sender: TObject);
    procedure PageControlEditorCanCloseEx(Sender: TObject; ATabIndex: Integer; var ACanClose: Boolean);
    procedure ActionExitExecute(Sender: TObject);
    procedure ListViewMessagesDblClick(Sender: TObject);
    procedure ActionRunResumeUpdate(Sender: TObject);
    procedure ActionRunPauseExecute(Sender: TObject);
    procedure ActionRunPauseUpdate(Sender: TObject);
    procedure ActionRunStepOutExecute(Sender: TObject);
    procedure ActionRunStepOutUpdate(Sender: TObject);
    procedure ActionSearchFindExecute(Sender: TObject);
    procedure ActionSearchFindUpdate(Sender: TObject);
    procedure ActionSearchAgainExecute(Sender: TObject);
    procedure ActionSearchAgainUpdate(Sender: TObject);
    procedure ListViewMessagesDeletion(Sender: TObject; Item: TListItem);
    procedure DebuggerDebugMessage(const msg: string);
    procedure ActionDebugExecute(Sender: TObject);
    procedure ActionDebugEvaluateExecute(Sender: TObject);
    procedure ActionDebugEvaluateUpdate(Sender: TObject);
    procedure ActionFileCloseAllUpdate(Sender: TObject);
    procedure ActionExitUpdate(Sender: TObject);
    procedure ActionFileSaveAsAttachmentExecute(Sender: TObject);
    procedure ActionFileSaveAsAttachmentUpdate(Sender: TObject);
    procedure ActionDebugBreakOnPoopExecute(Sender: TObject);
    procedure DebuggerNotifyException(const exceptObj: IInfo);
    procedure ActionViewCallStackExecute(Sender: TObject);
    procedure ActionViewCallStackUpdate(Sender: TObject);
    procedure ActionViewLocalsExecute(Sender: TObject);
    procedure ActionViewLocalsUpdate(Sender: TObject);
    procedure ActionViewWatchesExecute(Sender: TObject);
    procedure ActionViewWatchesUpdate(Sender: TObject);
    procedure ActionViewStackExecute(Sender: TObject);
    procedure ActionViewStackUpdate(Sender: TObject);
    procedure ActionViewMessagesExecute(Sender: TObject);
    procedure ActionViewMessagesUpdate(Sender: TObject);
    procedure ActionViewOutputExecute(Sender: TObject);
    procedure ActionViewOutputUpdate(Sender: TObject);
    procedure ActionViewBreakpointsExecute(Sender: TObject);
    procedure ActionViewBreakpointsUpdate(Sender: TObject);
    procedure ActionViewASTExecute(Sender: TObject);
    procedure ActionViewASTUpdate(Sender: TObject);
    procedure ActionToolDocBuildExecute(Sender: TObject);
    procedure ActionToolCopyProtectExecute(Sender: TObject);
    procedure ActionToolCopyProtectUpdate(Sender: TObject);
    procedure ActionToolDocBuildUpdate(Sender: TObject);
    procedure ActionRunFinalizationUpdate(Sender: TObject);
    procedure ActionRunInitializationUpdate(Sender: TObject);
    procedure ActionRunInitializationExecute(Sender: TObject);
    procedure ActionRunFinalizationExecute(Sender: TObject);
    procedure ActionBuildUpdate(Sender: TObject);
    procedure DropFileTarget1Drop(Sender: TObject; ShiftState: TShiftState; APoint: TPoint; var Effect: Integer);
    procedure DropFileTarget1Enter(Sender: TObject; ShiftState: TShiftState; APoint: TPoint; var Effect: Integer);
    procedure ActionToolBundleExecute(Sender: TObject);
    procedure ButtonToolDocumentXMLClick(Sender: TObject);
    procedure ButtonToolDocumentSourceClick(Sender: TObject);
    procedure DockPanelDebugFrameVisibleChanged(Sender: TdxCustomDockControl);
    procedure DockPanelDebugFrameClose(Sender: TdxCustomDockControl);
    procedure BarComboLayoutChange(Sender: TObject);
    procedure ActionLayoutDefaultEditExecute(Sender: TObject);
    procedure ActionLayoutDefaultDebugExecute(Sender: TObject);
    procedure ActionLayoutSaveExecute(Sender: TObject);
    procedure ActionLayoutDefaultEditUpdate(Sender: TObject);
    procedure ActionLayoutDefaultDebugUpdate(Sender: TObject);
    procedure DockingManagerLayoutChanged(Sender: TdxCustomDockControl);
    procedure DockPanelDebugOtherVisibleChanged(Sender: TdxCustomDockControl);
    procedure ListViewMessagesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ActionRefactorNormalizeCaseExecute(Sender: TObject);
    procedure ActionRefactorIdentifierRenameExecute(Sender: TObject);
    procedure ActionGenericNotDebuggingUpdate(Sender: TObject);
    procedure ActionMessagesClearExecute(Sender: TObject);
    procedure ActionMessagesClearUpdate(Sender: TObject);
    procedure ActionGotoDeclarationExecute(Sender: TObject);
    procedure ActionGotoImplementationExecute(Sender: TObject);
    procedure ActionGenericUpdateHasEditor(Sender: TObject);
    procedure ActionToolHeaderExecute(Sender: TObject);
    procedure ActionToolHeaderUpdate(Sender: TObject);
    procedure ActionRefactorSearchSymbolExecute(Sender: TObject);
    procedure DebuggerDebugStop(exec: TdwsExecution);
    procedure dxBarButton12Click(Sender: TObject);
    procedure PageControlEditorGetImageIndex(Sender: TObject; TabIndex: Integer; var ImageIndex: Integer);
    procedure ActionFileMainUnitExecute(Sender: TObject);
    procedure ActionFileMainUnitUpdate(Sender: TObject);
    procedure PageControlEditorNewTabButtonClick(Sender: TObject; var AHandled: Boolean);
    procedure PageControlEditorContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure PageControlEditorDrawTabEx(AControl: TcxCustomTabControl; ATab: TcxTab; Font: TFont);
    procedure PageControlEditorMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure BarApplicationMenuExtraPaneItemClick(Sender: TObject; AIndex: Integer);
    procedure BarApplicationMenuPopup(Sender: TObject);
    procedure ActionDebugLiveObjectsExecute(Sender: TObject);
    procedure ActionEditCopyToClipboardExecute(Sender: TObject);
    procedure ActionEditCopyToClipboardUpdate(Sender: TObject);
    procedure ActionEditCutUpdate(Sender: TObject);
    procedure ActionEditCutExecute(Sender: TObject);
    procedure ActionEditPasteUpdate(Sender: TObject);
    procedure ActionEditSelectAllUpdate(Sender: TObject);
    procedure ActionEditSelectAllExecute(Sender: TObject);
    procedure ActionEditUndoExecute(Sender: TObject);
    procedure ActionEditUndoUpdate(Sender: TObject);
    procedure ActionEditDeleteExecute(Sender: TObject);
    procedure ActionEditDeleteUpdate(Sender: TObject);
    procedure ActionEditPasteExecute(Sender: TObject);
    procedure ActionViewFileExplorerExecute(Sender: TObject);
    procedure ActionViewFileExplorerUpdate(Sender: TObject);
    procedure ShellListViewFileExplorerExecuteItem(Sender: TObject; APIDL: PItemIDList; var AHandled: Boolean);
    procedure ButtonToolDocumentBuildClick(Sender: TObject);
  private
    FScript: TDelphiWebScript;
    FCompileContext: IScriptContext;
    FProgram: IdwsProgram;
    FMainUnitName: string;
    FMainUnit: TEditorPage;
    FSaveOnNeedUnit: TdwsOnNeedUnitEvent;


    FGotoForm: TDwsIdeGotoLineNumber;

    FHomePositionCaptionSuffix: string;

    FSavedModalForm: TCustomForm;
    FPreviousDebuggerState: TdwsDebuggerState;
    FPendingExceptionMsg: string;
    FPendingExceptionPos: TScriptPos;

  protected
    procedure MsgExecReset(var Msg: TMessage); message MSG_EXEC_RESET;
    procedure MsgFormMaximize(var Msg: TMessage); message MSG_FORM_MAXIMIZE;
    procedure DoCreate; override;
  private
    // Recent files
    procedure LoadRecentFiles;
    procedure SaveRecentFiles;
    procedure AddRecentFile(const Filename: string);
  private
    // Layout
    FLayoutName: string; // Currently selected layout
    FLauoutLoading: boolean;
    procedure LoadLayouts;
    procedure SaveLayout;
  private
    // Frames
    FDebuggerFrames: TList<IScriptDebuggerWindow>;
    procedure NotifyDebuggerFrames(State: TScriptDebuggerNotification);
  private
    // Debug stuff
    FDebugStopwatch: TStopwatch;
    FOnBeforeExecution: TDebuggerExecutionEvent;
    FOnAfterExecution: TDebuggerExecutionEvent;
    FOnDebuggerClose: TNotifyEvent;
    FIntializationFinalizationMode: boolean;
    FExecutingIntialization: boolean;
    procedure DoOnExecutionStarted(Execution: TdwsProgramExecution);
    procedure DoOnExecutionEnded(Execution: TdwsProgramExecution);

  private
    //FActivePageIndex: Integer;
    //FHoveredPageIndex: Integer;
    //FBasePageIndex: Integer;
    //FHoveredCloseButton: Boolean;
    //FHoveredLeftArrow, FHoveredRightArrow: Boolean;
    //FLeftArrowActive, FRightArrowActive: Boolean;
    //FTabArrowLeft, FTabArrowRight: TRect;
    FPages: Generics.Collections.TObjectList<TEditorPage>;
    FEnvironment: IdwsEnvironment;
    FFormEvaluate: TFormDebugEvaluate;

    function OpenScriptStream(const Name: string; const CurrentScriptProvider: IScriptProvider = nil): IScriptProvider;
    procedure GotoHomePosition;
    function  CanGotoHomePosition: Boolean;
    function  TryRunSelection(ADebug: Boolean): Boolean;
    function  DoExecute(ADebug: Boolean): Boolean;
    function  BeginDebug: Boolean;
    function  EndDebug: Boolean;
    function  EditorPageCount: Integer;
    function  EditorPage(AIndex: Integer): TEditorPage;
    function  CurrentEditorPage: TEditorPage;
    procedure EditorPageClose(AIndex: Integer);
    function EditorPagesCloseQuery(AExceptIndex: Integer = -1): boolean;
    function EditorPagesCloseAll(AExceptIndex: Integer = -1): boolean;
    procedure EditorSaveAllIfModified(APromptOverwrite: Boolean);
    function  NameToEditorPageIndex(const AName: string): Integer;
    function OpenEditorPage(const AName: string; FileMustExist: boolean = False; const CurrentScriptProvider: IScriptProvider = nil): Boolean;
    procedure SetEditorCurrentPageIndex(const Value: Integer);
    procedure ResetProgram;
    function  GetExecutableLines(const AUnitName: string): TLineNumbers;
    procedure SetScript(const Value: TDelphiWebScript);
    procedure AddMessage(const AMessage: string; const AScriptPos: TScriptPos; AKind: TMessageKind = mkNone; Select: boolean = False); overload;
    procedure AddMessage(const AMessage: string; AKind: TMessageKind = mkNone; Select: boolean = False); overload;
    procedure ClearMessagesWindow;
    procedure ClearOutputWindow;
    function AddAlertMessage(const ACaption, AMessage: string; AImageIndex: integer = -1; ATimeout: integer = -1): IScriptHostAlertWindow;
    function UnitMainScript(const AUnitName, AIdentifier: string): string;
    function MainUnitName: string;

    function GetMainUnit: TEditorPage;
    procedure SetMainUnit(const Value: TEditorPage);
    property MainUnit: TEditorPage read GetMainUnit write SetMainUnit;

    function  CurrentEditor: TSynEdit;
    function  HasEditorPage: Boolean;

    function  FileIsOpenInEditor(const AFileName: TFileName; Activate: boolean = False): Boolean;
    function  ModifyFileNameToUniqueInProject(const AFileName: TFileName): string;

    procedure ShowExecutableLines;
    procedure ClearCurrentLine;
    procedure ClearAllBreakpoints;
    procedure ClearExecutableLines;
    procedure AddStatusMessage(const AStr: string);
    function GetScriptProvider(var MainUnitName: string; const AScript: string = ''): IScriptProvider;
    function CreateCompilerContext(const ScriptProvider: IScriptProvider): IScriptContext;
    procedure Compile(ABuild: Boolean; const AScript: string = '');
    function  IsCompiled: Boolean;

    procedure ListSymbols;

{$ifdef DISABLED_STUFF}
  private
    FProjectFileName: TFileName;
    procedure MakeSettingsRec;
    function  ProjectSourceScript: string;
    function  GetProjectSourceFileName: TFileName;
    procedure SetProjectSourceFileName(const Value: TFileName);
    property ProjectSourceFileName: TFileName read GetProjectSourceFileName write SetProjectSourceFileName;
    procedure SetProjectFileName(const Value: TFileName);
    function  FileIsProjectSource(const AFileName: TFileName): Boolean;
    function  ProjectSourceFileIndex: Integer;
    function  ProjectFileNameToProjectSourceFileName(const AProjectfileName: TFileName): string;
    procedure LoadProjectFile(const AProjectFileName: TFileName);
    procedure NewProjectFile(const AProjectFileName: TFileName);
    procedure SaveProjectFileAs(const AProjectFileName: TFileName);

    function  HasProject: Boolean;
    function  SaveProjectAs: Boolean;
    procedure LoadSettings(
           var AProjectFileName: TFileName;
           var AIDESettingsRec: TIDESettingsRec);
    procedure SaveSettings(
         const AProjectFileName: TFileName;
         const AIDESettingsRec: TIDESettingsRec);
{$endif DISABLED_STUFF}

    procedure RunFunctionMethodByName(const AUnit, AName: string; AWithDebugging, APrompt: Boolean);

    function GetGotoForm: TDwsIdeGotoLineNumber;
    function GetEditorCurrentPageIndex: Integer;

    property EditorCurrentPageIndex: Integer read GetEditorCurrentPageIndex write SetEditorCurrentPageIndex;
    property GotoForm: TDwsIdeGotoLineNumber read GetGotoForm;
    procedure SavePage(Page: TEditorPage);

    function DoOnNeedUnit(const unitName : UnicodeString; var unitSource : UnicodeString) : IdwsUnit;

  protected
    procedure ClearLinesChangedState; // declared protected to get rid of "unused" hint
  private
    FSearchText: string;
    FSearchOptions: TSynSearchOptions;
    FSearchHistory: string;
    FSearchRegularExpression: boolean;
    FSearchAutoWrap: boolean;
  protected
    // IScriptHostApplicationNotification
    procedure ApplicationNotify(const ScriptHostApplication: IScriptHostApplication; Notification: TScriptHostApplicationNotification);
    // IScriptHostApplicationCloseNotification
    procedure ApplicationCloseQuery(const ScriptHostApplication: IScriptHostApplication; var CanClose: boolean);
  protected
    procedure DoSearch(AOptions: TSynSearchOptions; First: boolean);
    property SearchText: string read FSearchText;
    property SearchOptions: TSynSearchOptions read FSearchOptions;
  private
    FCaseNormalizeScriptProgram: IdwsProgram;
    procedure OnCaseNormalize(Line, Col : Integer; const Name : string);
  private
    FScriptDebuggerHost: IScriptDebuggerHost;
  protected
    procedure SetDebuggerHost(const AScriptDebuggerHost: IScriptDebuggerHost);
  protected
    // IScriptDebuggerSetup
    procedure SetEnvironment(const AEnvironment: IdwsEnvironment);
    function AttachAndExecute(const AExecution: IdwsProgramExecution): boolean;
    function Execute(Modal: boolean = False): boolean;
  protected
    // IScriptDebugger
    function GetDebugger: TdwsDebugger;
    function GetProgram: IdwsProgram;
    procedure ViewScriptPos(const AScriptPos: TScriptPos; AMoveCurrent: boolean = False; AHiddenMainModule: Boolean = False);
    function FindBreakPoint(const ScriptPos: TScriptPos): TBreakpointStatus;
    procedure AddBreakpoint(const ScriptPos: TScriptPos; AEnabled: Boolean = True);
    procedure ClearBreakpoint(const ScriptPos: TScriptPos);
    procedure UpdateBreakpoints(Update: TBreakpointUpdate);
    function SymbolToImageIndex(Symbol: TSymbol): integer;
    procedure AddWatch(const Expression: string);
    function GetCompiledScript: IdwsProgram;
    procedure Evaluate(const Expression: string; ScriptPos: PScriptPos = nil);
    function UnitNameFromScriptPos(const ScriptPos: TScriptPos): string;
    function UnitNameFromInternalName(const Name: string): string;
  public
    constructor Create(AOwner: TComponent); override;

    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;

{$ifdef DISABLED_STUFF}
    property ProjectFileName: TFileName read FProjectFileName write SetProjectFileName;
{$endif DISABLED_STUFF}

    property Script: TDelphiWebScript read FScript write SetScript;

    property Environment: IdwsEnvironment read FEnvironment write FEnvironment;

    function EditorPageAddNew(const ScriptProvider: IScriptProvider = nil): IScriptDebugEditPage; overload;
    function EditorPageAddNew(const AFileName: TFileName; ALoadfile: Boolean = False; AFileRequired: boolean = False; const CurrentScriptProvider: IScriptProvider = nil): IScriptDebugEditPage; overload;
    function EditorPageAddNew(const AName, AScript: string): IScriptDebugEditPage; overload;
    property OnBeforeExecution: TDebuggerExecutionEvent read FOnBeforeExecution write FOnBeforeExecution;
    property OnAfterExecution: TDebuggerExecutionEvent read FOnAfterExecution write FOnAfterExecution;

    procedure AddMessageInfo(Messages: TdwsMessageList; Index: integer = -1);

    property OnDebuggerClose: TNotifyEvent read FOnDebuggerClose write FOnDebuggerClose;
  end;


procedure DwsIDE_ShowModal(AScript: TDelphiWebScript; const Environment: IdwsEnvironment);

const
  sScriptHeaderTemplate =
    '(*'+#13+
    'Plugin Name:'#9'<name of your script>'+#13+
    'Plugin URI:'#9'<URL of your scripts home page>'+#13+
    'Description:'#9'<a description of what your script does>'+#13+
    'Version:'#9'<the version of your script>'+#13+
    'Author: '#9'<your name>'+#13+
    'Author URI:'#9'<the URL of your home page>'+#13+
    'Product ID:'#9'%s'+#13+
    'Author ID:'#9'%s'+#13+
    '*)'+#13;
  sScriptHeaderTemplateProductID = '<the license product ID>';
  sScriptHeaderTemplateAuthorID = '<your public API key>';

  // The folder where we will output files when generating documentation
  sScriptHelpRtlSourceFolder = '%AppInstall%\..\Documentation\Source';
  // The name of the generated help file
  sScriptHelpRtlFilename = 'ScriptRTL.chm';

  // Locations of RTL help file at run time
  // Location of preinstalled help file
  sScriptHelpRtlFilenameDefault = '%AppInstall%\Help\'+sScriptHelpRtlFilename;
  // Fallback location used during debug/development (grab file directly from the place where it's generated)
  sScriptHelpRtlFilenameDebug = '%AppInstall%\..\Documentation\Output\CHM\'+sScriptHelpRtlFilename;
  // Location of downloaded help file
  sScriptHelpRtlFilenameDownload = '%Documents%\%AppName%\Help\'+sScriptHelpRtlFilename;


implementation

{$R *.dfm}

uses
  Consts,
  Generics.Defaults,
  Registry,
  Math,
  StrUtils,
  HelpIntfs,
  HtmlHelpViewer,
  Clipbrd,
  IniFiles,

  dwsXPlatform,
  dwsSuggestions,
  dwsDebugFunctions,
  dwsTokenizer,
  dwsFileSystem,
  dwsDataContext,
  dwsCaseNormalizer,
{$ifndef OLD_DWSCRIPT}
  dwsContextMap,
{$else OLD_DWSCRIPT}
  dwsInfo,
{$endif OLD_DWSCRIPT}

  SynTaskDialog,

  IOUtils, amIOUtils, // Bug fix
  amDialogs,
  amCursorService,
  amInputQueryDialog,
  amEnvironment,
  amURLUtils,

  amScriptDebuggerDialogSearch,
{$ifdef FEATURE_SCRIPT_BUNDLE}
  amScriptDebuggerDialogBundleBuilder,
{$endif FEATURE_SCRIPT_BUNDLE}
  amScriptDocBuilder,
  amScriptFileSystemAPI,
  amScriptFileSystem,
  amScriptProvider,
  amScriptHostProvider,
  amScriptPackageAPI,
  amScriptDebuggerSettings;

const //resourcestring
  RStrScriptFolderNotFound = 'Script folder "%s" does not exist';
  RStrScriptCannotBeNil = 'Script cannot be nil - the IDE requires a script to debug';
  RStrScriptDoesNotDefineMainPath = 'Script does not define a main path';
  RStrFileAlreadyExistsOverwrite = 'File "%s" already exists. Overwrite it?';
  RStrFileHasChanged = 'File "%s" has changed. Save it now?';
  RStrAbandonDebugging = 'Abandon debugging?';
  RStrCompileStarted = 'Compile started';
  RStrCompileCompleteWarnHints = 'Compile complete with hints/warnings';
  RStrRunFunctionMethod = 'Run function/method "%s"?';
  RStrRunning = 'Running';
  RStrPaused = 'Paused';
  RStrErrors = 'Errors';
  RStrNoParametersRequired = '"<no parameters required>"';
  RStrProjectFileDoesNotExist = 'Project file does not exist (%s)';
  RStrCannotRunWithoutProjectFile = 'Cannot run without a project file';
  RStrProgramCompleted = 'Program completed';


const
  CImageIndexExecutableLine = 13;
  CImageIndexForwardArrow = 16;
  CImageIndexCurrentLineBreakpoint = 15;
  CImageIndexBreakpoint = 12;
  CImageIndexBreakpointDisabled = 14;
  CImageIndex_ProjectSourceFile = 28;
  CImageIndex_Script = 26;
  CImageIndex_NonScript = 6;
  CImageIndex_IncludeFile = 29;

  CMargin = 4;
  CSlantMargin = 10;
  CCloseButtonSize = 12;
  CArrowButtonSize = 15;

// Utility routines
// -----------------------------------------------------------------------------

function BrandString(const s: string): string; deprecated 'BrandString not really implemented';
begin
  Result := StringReplace(s, '%brandname%', sScriptDebuggerBrandName, [rfReplaceAll, rfIgnoreCase]);
end;

function GetDesktopPath: string;
const
  CSIDL_APPDATA = $001A;
var
  LStr: array[0 .. MAX_PATH] of Char;
begin
  SetLastError(ERROR_SUCCESS);

  if SHGetFolderPath(0, CSIDL_DESKTOP, 0, 0, @LStr) = S_OK then
    Result := LStr;
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


function IsHostedControl(AControl: TControl): Boolean;
// Returns TRUE if this control is hosted within another control
begin
  Result := AControl.Parent <> nil;
end;


procedure DwsIDE_ShowModal(AScript: TDelphiWebScript; const Environment: IdwsEnvironment);
var
  Frm: TFormScriptDebugger;
  SaveResultType: TdwsResultType;
begin
  if Assigned(AScript) then
    SaveResultType := AScript.Config.ResultType
   else
     SaveResultType := nil;
  try
    Frm := TFormScriptDebugger.Create(Application);
    try
      Frm.Script := AScript;
      Frm.Environment := Environment;
      Frm.ShowModal;
    finally
      Frm.Free;
    end;
  finally
    if Assigned(AScript) then
      AScript.Config.ResultType := SaveResultType;
  end;
end;


function JustFileName(const AFileName: TFileName): string;
// Returns only the file name without dir or ext
begin
  Result := ExtractFileName(AFileName);
  if (AnsiSameText(ExtractFileExt(Result), sScriptFileType)) then
    Result := ChangeFileExt(Result, '');
end;

function PrepareScriptMessageForHumanConsumption(const Msg: string): string;
begin
  Result := StringReplace(Msg, ' -- Tdws', #13'  ', [rfReplaceAll]);
  Result := StringReplace(Result, ' Tdws', #13#13'  ', [rfReplaceAll]); // First
  Result := StringReplace(Result, 'Tdws', '', [rfReplaceAll]); // Any remaining - shouldn't be any
  Result := StringReplace(Result, ' -- ', #13#13, [rfReplaceAll]); // Last
end;

procedure ErrorDlg(const AStr: string);
begin
  MessageTaskDlgEx('Error', PrepareScriptMessageForHumanConsumption(AStr), mtWarning, [mbok]);
end;

function ConfirmDlg(const AStr: string): Boolean;
begin
  Result := (MessageTaskDlgEx('Confirm', AStr, mtConfirmation, [mbYes, mbNo]) = mrYes);
end;

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



procedure SymbolsToStrings(ATable: TSymbolTable; AStrings: TStrings);
// Dumps this table symbol names to AStrings recursively.

  procedure AddSymbolTable(ATable: TSymbolTable);
  var
    I: Integer;
    Sym: TSymbol;
  begin
    if (ATable = nil) then
      exit;
    for I := 0 to ATable.Count - 1 do
      begin
      Sym := ATable.Symbols[I];
      if Sym is TUnitSymbol then
        AddSymbolTable(TUnitSymbol(Sym).Table)
       else
        AStrings.Add(Sym.Name + '   ' + Sym.ToString +  '  (' + Sym.ClassName + ')');
      end;
  end;

begin
  AddSymbolTable(ATable);
end;



// -----------------------------------------------------------------------------
//
// TEditorPageSynEditPlugin
//
// -----------------------------------------------------------------------------
type
  TEditorPageSynEditPlugin = class(TSynEditPlugin)
  protected
    FPage: TEditorPage;
    procedure LinesInserted(FirstLine, Count: Integer); override;
    procedure LinesDeleted(FirstLine, Count: Integer); override;
    procedure PaintTransient(ACanvas: TCanvas; ATransientType: TTransientType); override;
  public
    constructor Create(APage: TEditorPage);
  end;

constructor TEditorPageSynEditPlugin.Create(APage: TEditorPage);
begin
  inherited Create(APage.Editor);
  FPage := APage;
end;

procedure TEditorPageSynEditPlugin.LinesInserted(FirstLine, Count: Integer);
var
  I, iLineCount: Integer;
  UpdateBreakpoints: boolean;
begin
  if (FirstLine < 1) then
    exit;

  // Track the executable lines
  iLineCount := FPage.Editor.Lines.Count;
  FirstLine := Min(FirstLine, iLineCount-1);
  FPage.FExecutableLines.Size := iLineCount;
  for I := iLineCount - 1 downto FirstLine + Count do
    FPage.FExecutableLines[i] := FPage.FExecutableLines[I - Count];
  for I := FirstLine + Count - 1 downto FirstLine do
    FPage.FExecutableLines[i] := False;

  SetLength(FPage.FLineChangedState, iLineCount);
  for I := iLineCount - 1 downto FirstLine + Count do
    FPage.FLineChangedState[i] := FPage.FLineChangedState[I - Count];
  for I := FirstLine + Count - 1 downto FirstLine - 1 do
    FPage.FLineChangedState[i] := csModified;

  // Track the breakpoint lines in the debugger
  UpdateBreakpoints := False;
  with FPage.FForm.Debugger do
    for I := 0 to Breakpoints.Count - 1 do
      if Breakpoints[I].SourceName = FPage.InternalUnitName then
        if Breakpoints[I].Line >= FirstLine then
        begin
          Breakpoints[I].Line := Breakpoints[I].Line + Count;
          UpdateBreakpoints := True;
        end;

  // Redraw the gutter for updated icons.
  FPage.Editor.InvalidateGutter;
  if (UpdateBreakpoints) then
    FPage.FForm.UpdateBreakpoints(bpuRefreshLines);
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

  with Editor do
    Pt := RowColumnToPixels(BufferToDisplayPos(WordStartEx(MouseBufferCoord)));

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
  for I := FirstLine - 1 to FPage.FExecutableLines.Size - Count - 1 do
    FPage.FExecutableLines[i] := FPage.FExecutableLines[I + Count];
  FPage.FExecutableLines.Size := FPage.FExecutableLines.Size - Count;

  // Track the executable lines
  for I := FirstLine - 1 to Length(FPage.FLineChangedState) - Count - 1 do
    FPage.FLineChangedState[i] := FPage.FLineChangedState[I + Count];
  SetLength(FPage.FLineChangedState, Length(FPage.FLineChangedState) - Count);

  // Track the breakpoint lines in the debugger
  UpdateBreakpoints := False;
  with FPage.FForm.Debugger do
    for I := 0 to Breakpoints.Count - 1 do
      if Breakpoints[I].SourceName = FPage.InternalUnitName then
        if Breakpoints[I].Line >= FirstLine then
        begin
          Breakpoints[I].Line := Breakpoints[I].Line - Count;
          UpdateBreakpoints := True;
        end;

  // Redraw the gutter for updated icons.
  FPage.Editor.InvalidateGutter;
  if (UpdateBreakpoints) then
    FPage.FForm.UpdateBreakpoints(bpuRefreshLines);
end;


// -----------------------------------------------------------------------------
//
// TOutputWindowStringResultType
//
// -----------------------------------------------------------------------------
type
  TOutputWindowStringResultType = class(TdwsStringResultType)
  strict private
    FDwsIdeForm: TFormScriptDebugger;
  protected
    procedure DoAddString(Result: TdwsStringResult; var str: string); override;
    procedure DoReadLn(Result: TdwsStringResult; var str: string); override;
    procedure DoReadChar(Result: TdwsStringResult; var str: string); override;
  public
    constructor Create(AOwner: TComponent; ADwsIdeForm: TFormScriptDebugger); reintroduce;
  end;

constructor TOutputWindowStringResultType.Create(AOwner: TComponent; ADwsIdeForm: TFormScriptDebugger);
begin
  inherited Create(AOwner);
  FDwsIDEForm := ADwsIdeForm;
end;

procedure TOutputWindowStringResultType.DoAddString(result: TdwsStringResult; var str: string);
begin
  while (str[Length(str)] in [#10,#13]) do
    SetLength(str, Length(str)-1);
  FDwsIdeForm.MemoOutputWindow.Lines.Add('STD: ' + str);
end;

procedure TOutputWindowStringResultType.DoReadChar(result: TdwsStringResult; var str: string);
var
  c: Char;
begin
  Read(c);
  str := c;
end;

procedure TOutputWindowStringResultType.DoReadLn(result: TdwsStringResult; var str: string);
begin
  ReadLn(str);
end;

// -----------------------------------------------------------------------------
//
// TEditorPage
//
// -----------------------------------------------------------------------------
constructor TEditorPage.Create(AOwner: TFormScriptDebugger; APage: TcxTabSheet);

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
    FEditor.Parent  := FPage;
    FEditor.Align   := alClient;
    FEditor.BorderStyle := bsNone;
    FEditor.Gutter.Width := 64;
    FEditor.PopupMenu := AOwner.EditorPagePopupMenu;
    FEditor.WantTabs := True;
    FEditor.FontSmoothing := fsmClearType;
    FEditor.TabWidth := 8;
    // SynEdit.IndentWidth requires patched source
    FEditor.IndentWidth := 2;

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
      FEditor.Font.Name := 'Courier New';
      FEditor.Font.Size := 10;
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

    FForm.SynMacroRecorder.AddEditor(FEditor);

    FForm.SynAutoComplete.AddEditor(FEditor);

    FForm.SynParameters.AddEditor(FEditor);
    FForm.SynParameters.Font.Name := FEditor.Font.Name;
    FForm.SynParameters.Font.Size := FEditor.Font.Size - 1;

    FForm.SynCodeCompletion.AddEditor(FEditor);
    with FForm.SynCodeCompletion.Columns.Add do
    begin
      ColumnWidth := -1;
    end;
    with FForm.SynCodeCompletion.Columns.Add do
    begin
      DefaultFontStyle := [fsBold];
      ColumnWidth := -1;
    end;
    FForm.SynCodeCompletion.Font.Name := FEditor.Font.Name;
    FForm.SynCodeCompletion.Font.Size := FEditor.Font.Size - 1;

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
  end;

begin
  inherited Create;

  FForm := AOwner;
  FPage := APage;
  FCurrentLine := -1;
  FExecutableLines := TBits.Create;

  InitEditor;
  InitLineChangeStates;

  FEditor.Align := alClient;
  FEditor.Parent := FPage;
  FEditor.Visible := True;

  FEditor.Modified := False;
end;

destructor TEditorPage.Destroy;
begin
  if (FForm.MainUnit = Self) then
    FForm.MainUnit := nil;

  FForm.FPages.Extract(Self);

  FForm.SynParameters.RemoveEditor(FEditor);
  FForm.SynCodeCompletion.RemoveEditor(FEditor);
  FForm.SynMacroRecorder.RemoveEditor(FEditor);
  FForm.SynAutoComplete.RemoveEditor(FEditor);
  FExecutableLines.Free;
  FEditor.Free;
  FPage.Free;

  FScriptProvider := nil;

  inherited;
end;

function TEditorPage.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := S_OK
  else
    Result := E_NOINTERFACE
end;

function TEditorPage._AddRef: Integer;
begin
  Result := -1;
end;

function TEditorPage._Release: Integer;
begin
  Result := -1;
end;

procedure TEditorPage.DoOnEditorChange(ASender: TObject);
begin
  FLineChangedState[FEditor.CaretY - 1] := csModified;
  FForm.EditorChange(ASender);
end;

procedure TEditorPage.FindDeclaration(CursorPos: TBufferCoord; SymbolUsage: TSymbolUsage);
var
  ScriptProgram: IdwsProgram;
  Symbol: TSymbol;
  SymbolPosList: TSymbolPositionList;
  Index: integer;
  s: string;
begin
  ScriptProgram := FForm.GetCompiledScript;
  if (ScriptProgram = nil) then
    Exit;

  CursorPos := Editor.WordStartEx(CursorPos);
  Symbol := ScriptProgram.SymbolDictionary.FindSymbolAtPosition(CursorPos.Char, CursorPos.Line, InternalUnitName);

  if (Symbol = nil) then
    Exit;

  SymbolPosList := ScriptProgram.SymbolDictionary.FindSymbolPosList(Symbol);

  if (SymbolPosList = nil) or (SymbolPosList.Count = 0) then
    Exit;

  Index := SymbolPosList.Count-1;
  while (Index >= 0) do
  begin
    if (SymbolUsage in SymbolPosList[Index].SymbolUsages) then
      break;
    dec(Index);
  end;
  if (Index < 0) then
    exit;

  s := FForm.UnitNameFromScriptPos(SymbolPosList[Index].ScriptPos);

  if (FForm.OpenEditorPage(s, True, ScriptProvider)) then
  begin
    FForm.CurrentEditor.CaretX := SymbolPosList[Index].ScriptPos.Col;
    FForm.CurrentEditor.CaretY := SymbolPosList[Index].ScriptPos.Line;
  end;
end;

function TEditorPage.GetFilename: TFileName;
begin
  Result := FFilename;
end;

function TEditorPage.GetHasProvider: boolean;
begin
  Result := (FScriptProvider <> nil);
end;

function TEditorPage.GetIndex: integer;
begin
  Result := FPage.PageIndex;
end;

{$ifdef DISABLED_STUFF}
function TEditorPage.GetIsProjectSourceFile: Boolean;
begin
  Result := (Filename = '') or (SameText(ExtractFileExt(FileName), sDwsIdeProjectSourceFileExt));
end;
{$endif DISABLED_STUFF}

function TEditorPage.GetIsMainUnit: boolean;
begin
  Result := (FForm <> nil) and (FForm.MainUnit = Self);
end;

function TEditorPage.GetIsReadOnly: Boolean;
begin
  Result := FEditor.ReadOnly;
end;

function TEditorPage.GotoIdentifier(const AIdentifier: string): Boolean;
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
procedure TEditorPage.AddBreakpoint(ALineNum: Integer; AEnabled: Boolean);
var
  BP: TdwsDebuggerBreakpoint;
  bAdded: Boolean;
  I: Integer;
begin
  BP := TdwsDebuggerBreakpoint.Create;
  BP.Line := ALineNum;

  BP.SourceName := InternalUnitName;

  I := FForm.Debugger.Breakpoints.AddOrFind(BP, bAdded);
  if not bAdded then
    BP.Free;
  FForm.Debugger.Breakpoints[I].Enabled := AEnabled;

  Editor.InvalidateGutterLine(ALineNum);
  Editor.InvalidateLine(ALineNum);

  FForm.UpdateBreakpoints(bpuReload);
end;

// ClearBreakpoint
//
procedure TEditorPage.ClearBreakpoint(ALineNum: Integer);
var
  Test, Found: TdwsDebuggerBreakpoint;
  I: Integer;
begin
  if FForm.Debugger.Breakpoints.Count = 0 then
    Exit;

  Test := TdwsDebuggerBreakpoint.Create;
  try
    Test.Line := ALineNum;
    Test.SourceName := InternalUnitName;

    I := FForm.Debugger.Breakpoints.IndexOf(Test);
    if I <> -1 then
    begin
      Found := FForm.Debugger.Breakpoints[I];
      FForm.Debugger.Breakpoints.Extract(Found);
      FreeAndNil(Found);
    end;
  finally
    FreeAndNil(Test);
  end;

  Editor.InvalidateGutterLine(ALineNum);
  Editor.InvalidateLine(ALineNum);
  FForm.UpdateBreakpoints(bpuReload);
end;

// GetBreakpointStatus
//
function TEditorPage.GetBreakpointStatus(ALine: Integer): TBreakpointStatus;
var
  Test, Found: TdwsDebuggerBreakpoint;
  I: Integer;
begin
  Result := bpsNone;
  if FForm.Debugger.Breakpoints.Count = 0 then
    Exit;

  Test := TdwsDebuggerBreakpoint.Create;
  try
    Test.Line := ALine;
    Test.SourceName := InternalUnitName;

    I := FForm.Debugger.Breakpoints.IndexOf(Test);
    if I <> -1 then
    begin
      Found := FForm.Debugger.Breakpoints[I];
      if Found.Enabled then
        Result := bpsBreakpoint
      else
        Result := bpsBreakpointDisabled;
    end;
  finally
    FreeAndNil(Test);
  end;
end;

function TEditorPage.GetCanClose: boolean;
begin
  Result := FPage.AllowCloseButton;
end;

function TEditorPage.GetCaption: string;
begin
  Result := FCaption;
end;

// ClearExecutableLines
//
procedure TEditorPage.ClearExecutableLines;
var
  I: Integer;
begin
  for I := 0 to FExecutableLines.Size do
    FExecutableLines[I] := False;

  Editor.InvalidateGutter;
end;

// InitExecutableLines
//
procedure TEditorPage.InitExecutableLines;
begin
  FExecutableLines.Size := 0;
  if Editor.Lines.Count = 0 then
    FExecutableLines.Size := 1
  else
  FExecutableLines.Size := Editor.Lines.Count;
end;

// ShowExecutableLines
//
procedure TEditorPage.ShowExecutableLines;
var
  LineNumbers: TLineNumbers;
  I: Integer;
begin
  ClearExecutableLines;
  LineNumbers := FForm.GetExecutableLines(InternalUnitName);
  for I := 0 to Length(LineNumbers) - 1 do
    FExecutableLines[ LineNumbers[I] ] := True;
  Editor.InvalidateGutter;
end;

// ClearLineStates
//
procedure TEditorPage.ClearLineChangeStates;
var
  I: Integer;
begin
  for I := 0 to Length(FLineChangedState) do
    FLineChangedState[I] := csOriginal;

  Editor.InvalidateGutter;
end;

procedure TEditorPage.ClearModified;
begin
  FEditor.Modified := False;
  ToggleLineChangedStates;
end;

procedure TEditorPage.MarkModified(Line: integer);
begin
  if (Line <> -1) then
    FLineChangedState[Line] := csModified;
  FEditor.Modified := True;
  FForm.EditorChange(FEditor);
end;

function TEditorPage.CloseQuery: boolean;
var
  Res: integer;
begin
  if (Modified) then
  begin
    // Make page visible so user knows which script we're prompting for
    FPage.PageControl.ActivePage := FPage;

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
procedure TEditorPage.InitLineChangeStates;
begin
  SetLength(FLineChangedState, 0);
  if Editor.Lines.Count = 0 then
    SetLength(FLineChangedState, 1)
  else
    SetLength(FLineChangedState, Editor.Lines.Count);
end;

function TEditorPage.InternalUnitName: string;
begin
  Result := JustFileName(FFileName);
  if (Result = '') or (AnsiSameText(Result, FForm.MainUnitName)) or (FForm.GetProgram = nil) then
    Result := MSG_MainModule;
end;

// ToggleLineChangedStates
//
procedure TEditorPage.ToggleLineChangedStates;
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
procedure TEditorPage.SetFileName(const Value: TFileName);
begin
  FFilename := Value; // << where file name is stored
  if (Caption = '') and (FFilename <> MSG_MainModule) then
    Caption := JustFileName(FFilename);
end;

// SetIsReadOnly
//
procedure TEditorPage.SetIsReadOnly(const Value: Boolean);
begin
  if Value <> IsReadOnly then
  begin
    FEditor.ReadOnly := Value;
// WTF?:
//    if FileExists(FileName) then
//      FileSetReadOnly(Filename, Value);
  end;
end;

procedure TEditorPage.SetScript(const Value: string);
begin
  FEditor.Lines.Text := Value;
  InitExecutableLines;
  InitLineChangeStates;
end;

procedure TEditorPage.SetScriptProvider(const Value: IScriptProvider);
begin
  FScriptProvider := Value;

  if (FScriptProvider <> nil) then
  begin
    Script := FScriptProvider.GetScript;
    IsReadOnly := FScriptProvider.ReadOnly;
    Filename := FScriptProvider.ScriptName;
  end;
end;

// SetCurrentLine
//
function TEditorPage.Save: boolean;
begin
  Result := False;

  if (FScriptProvider <> nil) then
  begin
    FScriptProvider.SetScript(Script);
    Result := True;
  end;
end;

function TEditorPage.SaveToStream(Stream: TStream): boolean;
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

procedure TEditorPage.SetCanClose(const Value: boolean);
begin
  FPage.AllowCloseButton := Value;
end;

procedure TEditorPage.SetCaption(const Value: string);
begin
  FCaption := Value;
  FPage.Caption := FCaption;
end;

procedure TEditorPage.SetCurrentLine(ALine: Integer; ACol: Integer; MoveCurrent: boolean);
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
      Editor.InvalidateGutterLine(ALine);
      Editor.InvalidateLine(ALine);
      Editor.EnsureCursorPosVisibleEx(True, True);
    end;
  end else
  if (FCurrentLine > 0) and (Editor.CaretY <> FCurrentLine) then
  begin
    Editor.CaretXY := BufferCoord(ACol, FCurrentLine);
    Editor.EnsureCursorPosVisibleEx(True, True);
  end;
end;

// IsExecutableLine
//
function TEditorPage.IsExecutableLine(ALine: Integer): Boolean;
begin
  if ALine < FExecutableLines.Size then
    Result := FExecutableLines[ALine]
  else
    Result := False;
end;

procedure TEditorPage.LoadFromFile(const AFilename: string);
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

procedure TEditorPage.LoadFromStream(Stream: TStream);
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

procedure TEditorPage.LoadFromString(const AScript: string);
begin
  Script := AScript;
end;

// GetLineChangeState
//
function TEditorPage.GetLineChangeState(ALine: Integer): TLineChangedState;
begin
  if ALine < Length(FLineChangedState) then
    Result := FLineChangedState[ALine]
  else
    Result := csOriginal;
end;

function TEditorPage.GetModified: boolean;
begin
  Result := FEditor.Modified;
end;

function TEditorPage.GetScript: string;
begin
  Result := FEditor.Lines.Text;
end;

// UnitName
//
function TEditorPage.UnitName: string;
begin
  if (FFilename <> MSG_MainModule) then
    Result := JustFileName(FFileName)
  else
    Result := Caption;
end;

// SynEditorSpecialLineColors
//
procedure TEditorPage.SynEditorSpecialLineColors(Sender: TObject;
  Line: Integer; var Special: Boolean; var FG, BG: TColor);
const
  BreakpointColor = TColor($FFA0A0);
  CurrentLineColor = TColor($A0A0F0);
  CurrentLineSteppingColor = TColor($A0C0F0);
begin
  if Line = FCurrentLine then
  begin
    Special := TRUE;
    FG := clBlack;
    if FForm.Debugger.State = dsDebugSuspended then
      BG := CurrentLineSteppingColor
    else
      BG := CurrentLineColor
  end
  else
  if GetBreakpointStatus(Line) = bpsBreakpoint then
  begin
    Special := TRUE;
    FG := clBlack;
    BG := BreakpointColor;
  end;
end;

// SynEditGutterPaint
//
procedure TEditorPage.SynEditGutterPaint(Sender: TObject; aLine, X,
  Y: Integer);
var
  GutterWidth: Integer;
  ImgIndex: Integer;
  R: TRect;
  LineNumText: string;
  LineNumTextRect: TRect;
  Wdth: Integer;
label
  DrawGutter;
begin
  GutterWidth := FEditor.Gutter.Width - 5;

  // Ruler background
  if Y = 0 then
  begin
    FEditor.Canvas.Brush.Color := Lighten(clBtnFace, 6);
    R := Rect(24, 0, GutterWidth, FEditor.Height);
    FEditor.Canvas.FillRect(R);
  end;

  // Ruler cosmetics..
  FEditor.Canvas.Brush.Style := bsClear;
  FEditor.Canvas.Font.Color := clGray;
  FEditor.Canvas.Pen.Color := clGray;

  if ALine = FCurrentLine then
  begin
    if GetBreakpointStatus(ALine) <> bpsNone then
      ImgIndex := CImageIndexCurrentLineBreakpoint
    else
      if FForm.Debugger.State = dsDebugSuspended then
        ImgIndex := CImageIndexForwardArrow
      else
        ImgIndex := CImageIndexExecutableLine
  end
  else
    case GetBreakpointStatus(ALine) of
      bpsBreakpoint :
        if IsExecutableLine(ALine) then
          ImgIndex := CImageIndexBreakpoint
         else
          ImgIndex := CImageIndexBreakpointDisabled;
      bpsBreakpointDisabled :
        ImgIndex := CImageIndexBreakpointDisabled;
     else
       if IsExecutableLine(ALine) then
         ImgIndex := CImageIndexExecutableLine
        else
         ImgIndex := -1;
    end;

  if ImgIndex >= 0 then
    FForm.SmallImages.Draw(FEditor.Canvas, X, Y, ImgIndex);

  case GetLineChangeState(aLine - 1) of
    csModified: FEditor.Canvas.Brush.Color := clYellow;
    csSaved: FEditor.Canvas.Brush.Color := clLime;
    csOriginal: goto DrawGutter;
  end;

  R := Rect(GutterWidth - 3, y, GutterWidth, y + FEditor.LineHeight);
  FEditor.Canvas.FillRect(R);
  FEditor.Canvas.Brush.Style := bsClear;

DrawGutter:
  Dec(GutterWidth, 4);
  if (ALine = 1) or (aLine = FEditor.CaretY) or (ALine mod 10 = 0) then
  begin
    LineNumText := IntToStr(aLine);
    LineNumTextRect := Rect(x, y, GutterWidth, y + FEditor.LineHeight);
    FEditor.Canvas.TextRect(LineNumTextRect, LineNumText, [tfVerticalCenter,
      tfSingleLine, tfRight]);
  end
  else
  begin
    FEditor.Canvas.Pen.Color := FEditor.Gutter.Font.Color;
    if (aLine mod 5) = 0 then
      Wdth := 5
    else
      Wdth := 2;
    Inc(y, FEditor.LineHeight div 2);
    FEditor.Canvas.MoveTo(GutterWidth - Wdth, y);
    FEditor.Canvas.LineTo(GutterWidth, y);
  end;
end;

// SynEditorClick
//
// SynEditorKeyDown
//
procedure TEditorPage.SynEditorKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  inherited;

  SetCurrentLine(-1);
end;

// SynEditorMouseMove
//
procedure TEditorPage.SynEditorMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  MousePos: TDisplayCoord;
  CursorPos: TBufferCoord;
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

  FindDeclaration(CursorPos, SymbolUsage);
end;

procedure TEditorPage.SynEditorMouseMove(Sender: TObject; Shift: TShiftState; X,
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

procedure TEditorPage.SynEditorProcessCommand(Sender: TObject; var Command: TSynEditorCommand; var AChar: Char; Data: pointer);
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

procedure TEditorPage.SynEditorStatusChange(Sender: TObject; Changes: TSynStatusChanges);
begin
  if (scModified in Changes) then
  begin
    // Force recalc of tab caption width (bold text is wider than normal text)
    FPage.PageControl.ViewInfo.Calculate;
    // Redraw
    FPage.PageControl.Invalidate;
  end;
end;

// SynEditorCommandProcessed
//
type
  TSynCompletionProposalCracker = class(TSynCompletionProposal);

procedure TEditorPage.SynEditorCommandProcessed(Sender: TObject; var Command: TSynEditorCommand; var AChar: Char; Data: Pointer);

  function CreateGUID: string;
  var
    Guid: TGUID;
  begin
    SysUtils.CreateGUID(Guid);
    Result := GUIDToString(Guid);
  end;

begin
  case Command of
    ecGotoXY:
      GotoLineNumber;

    ecOpenFileUnderCursor:
      OpenFileUnderCursor;

    ecToggleDeclImpl:
      ToggleDeclImpl;

    ecRepeatSearch:
      if (FForm.SearchText <> '') then
        FForm.DoSearch(FForm.SearchOptions - [ssoEntireScope], False);

    ecToggleBreakPoint:
      begin
        if (Editor.CaretY < FExecutableLines.Size) then
        begin
          if (GetBreakpointStatus(Editor.CaretY) <> bpsNone) then
            ClearBreakpoint(Editor.CaretY)
          else
            AddBreakpoint(Editor.CaretY, True);
          Editor.Repaint;
        end;
      end;

    ecAutoCompletionPropose:
      TSynCompletionProposalCracker(FForm.SynCodeCompletion).DoExecute(Editor);

    ecContextHelp:
      PerformContextHelp;

    ecInsertGUID:
      Editor.SelText := ''''+CreateGuid+'''';

    ecSelectNextTab:
      FForm.PageControlEditor.SelectNextPage(True);

    ecSelectPrevTab:
      FForm.PageControlEditor.SelectNextPage(False);
  end;
end;

// SynEditorGutterClick
//
procedure TEditorPage.SynEditorGutterClick(Sender: TObject;
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
function TEditorPage._SaveToFile(APromptOverwrite: Boolean): Boolean;
begin
  Result := _SaveToFile(FileName, APromptOverwrite);
end;

function TEditorPage._SaveToFile(const AFilename: string; APromptOverwrite: Boolean): boolean;
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
procedure TEditorPage._SaveIfModified(APromptOverwrite: Boolean);
begin
  if Editor.Modified then
{$ifdef DISABLED_STUFF}
    if not APromptOverwrite or (IsProjectSourceFile and not FileExists(FileName)) or
{$else DISABLED_STUFF}
    if not APromptOverwrite or (not FileExists(FileName)) or
{$endif DISABLED_STUFF}
     ConfirmDlgYesNoAbort(
      Format(RStrFileHasChanged,  [ ExtractFileName(FileName) ])) then
        _SaveToFile(False);
end;

// SaveAs
//
function TEditorPage._SaveAs: boolean;
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

  FForm.SaveSourceDialog.DefaultFolder := Folder;
  FForm.SaveSourceDialog.FileName := s;

  if (not FForm.SaveSourceDialog.Execute) then
    exit;

  s := FForm.SaveSourceDialog.FileName;

  Result := _SavetoFile(s, False);

  if (not Result) then
    exit;

  Caption := '';
  ScriptProvider := TFileScriptProvider.Create(s);
  ScriptSettings.Folders.FolderScript := TPath.GetDirectoryName(s);
end;

// ToggleDeclImpl
//
procedure TEditorPage.ToggleDeclImpl;
var
  ScriptProgram: IdwsProgram;
  ScriptPos: TScriptPos;
  Symbol: TSymbol;
  SymDict: TdwsSymbolDictionary;
  Context: TdwsSourceContext;
  SymbolPositionList: TSymbolPositionList;
  SymbolPosition: TSymbolPosition;
begin
  ScriptProgram := FForm.GetCompiledScript;
  if (ScriptProgram = nil) then
    Exit;

  SymDict := ScriptProgram.SymbolDictionary;
  Assert(SymDict <> nil);

  Context := ScriptProgram.SourceContextMap.FindContext(FEditor.CaretX, FEditor.CaretY, InternalUnitName);

  while (Context <> nil) do
  begin
    Symbol := Context.ParentSym;
    if (Symbol is TFuncSymbol) then
    begin
      // retrieve symbol position list
      SymbolPositionList := SymDict.FindSymbolPosList(Symbol);
      if (SymbolPositionList <> nil) then
      begin
        // get declaration position
        SymbolPosition := SymbolPositionList.FindUsage(suDeclaration);
        if (SymbolPosition <> nil) then
        begin
          ScriptPos := SymbolPosition.ScriptPos;

          // check if current position is declaration
          if (Context.IsPositionInContext(ScriptPos)) then
            ScriptPos := TFuncSymbol(Symbol).SourcePosition;

          if (ScriptPos.Line > 0) and (ScriptPos.Col > 0) then
          begin
            FEditor.CaretXY := BufferCoord(ScriptPos.Col, ScriptPos.Line);
            Exit;
          end;
        end;
      end;
    end;

    Context := Context.Parent;
  end;
end;

// GotoLineNumber
//
procedure TEditorPage.GotoLineNumber;
begin
  if (FForm.GotoForm.ShowModal = mrOK) then
    FEditor.GotoLineAndCenter(FForm.GotoForm.LineNumber);
end;

// OpenFileUnderCursor
//
procedure TEditorPage.OpenFileUnderCursor;
var
  ScriptProgram: IdwsProgram;
  Symbol: TSymbol;
  WordStart: TBufferCoord;
begin
  ScriptProgram := FForm.GetCompiledScript;
  if not Assigned(ScriptProgram) then
    Exit;

  WordStart := FEditor.WordStart;
  Symbol := ScriptProgram.SymbolDictionary.FindSymbolAtPosition(WordStart.Char, WordStart.Line, InternalUnitName);

  if (Symbol is TUnitMainSymbol) then
  begin
    FForm.OpenEditorPage(TUnitMainSymbol(Symbol).Name);
    // eventually move caret position here...
  end;
end;

var
  FHasCheckedHelpVersion: boolean = False;

procedure TEditorPage.PerformContextHelp;
var
  ScriptProgram: IdwsProgram;
  Symbol: TSymbol;
  i: integer;
  ChildSymbol: TCompositeTypeSymbol;
  WordStart: TBufferCoord;
  //PerformSearch: boolean;
  Keyword: string;
  UnitName: string;
  HelpSystem: IHelpSystem3;
  HelpFilename: string;
  HelpDownloadFilename: string;
  HelpDownloadPackage: string;
  First: boolean;
  DownloadURL: string;
  HelpFileNotFound: boolean;
  NeedDownload: boolean;
  DownloadIsPackage: boolean;
begin
  Keyword := FEditor.WordAtCursor;
  if (Keyword = '') and (FEditor.CaretX > 1) then
    // Try one char to the left in case we're positioned just past the end of the word
    Keyword := FEditor.GetWordAtRowCol(BufferCoord(FEditor.CaretX-1, FEditor.CaretY));

  //PerformSearch := True;

  ScriptProgram := FForm.GetCompiledScript;
  if (ScriptProgram <> nil) then
  begin
    WordStart := FEditor.WordStart;
    UnitName := InternalUnitName;

    Symbol := ScriptProgram.SymbolDictionary.FindSymbolAtPosition(WordStart.Char, WordStart.Line, UnitName);
    if (Symbol = nil) and (UnitName <> MSG_MainModule) then
      Symbol := ScriptProgram.SymbolDictionary.FindSymbolAtPosition(WordStart.Char, WordStart.Line, MSG_MainModule);

    if (Symbol <> nil) then
    begin
      // If symbol is a method then determine if it is a property accesor. If that is the case then use the property symbol instead.
      if (Symbol is TMethodSymbol) then
      begin
        for i := 0 to TMethodSymbol(Symbol).StructSymbol.Members.Count-1 do
          if (TMethodSymbol(Symbol).StructSymbol.Members[i] is TPropertySymbol) and
            ((TPropertySymbol(TMethodSymbol(Symbol).StructSymbol.Members[i]).ReadSym = Symbol) or
             (TPropertySymbol(TMethodSymbol(Symbol).StructSymbol.Members[i]).WriteSym = Symbol)) then
          begin
            Symbol := TMethodSymbol(Symbol).StructSymbol.Members[i];
            break;
          end;
      end;

      // If symbol is a value then get the type of the value instead - unless the value is declared in an external unit
      if (Symbol is TValueSymbol) then
      begin
        if (ScriptProgram.SymbolDictionary.FindSymbolUsage(Symbol, suDeclaration) <> nil) then
          Symbol := Symbol.Typ;
      end;

      if (Symbol is TCompositeTypeSymbol) then
      begin
        ChildSymbol := TCompositeTypeSymbol(Symbol);
        while (ChildSymbol <> nil) do
        begin
          // If symbol is declared in script then get the base type instead
          if (ScriptProgram.SymbolDictionary.FindSymbolUsage(ChildSymbol, suDeclaration) = nil) then
            break;
          ChildSymbol := ChildSymbol.Parent;
        end;

        if (ChildSymbol <> nil) then
          Symbol := ChildSymbol;
      end;

      Keyword := Symbol.QualifiedName;
      //PerformSearch := False;

      // Qualify keyword with parameters
      if (Symbol is TFuncSymbol) then
      begin
        if (TFuncSymbol(Symbol).Params.Count > 0) then
        begin
          Keyword := Keyword + '(';
          First := True;
          for i := 0 to TFuncSymbol(Symbol).Params.Count-1 do
          begin
            if (not First) then
              Keyword := Keyword + ',';
            First := False;
            Keyword := Keyword + TFuncSymbol(Symbol).Params[i].Typ.Name;
          end;
          Keyword := Keyword + ')';
        end;
      end else
      if (Symbol is TPropertySymbol) then
      begin
        if (TPropertySymbol(Symbol).ArrayIndices.Count > 0) then
        begin
          Keyword := Keyword + '[';
          First := True;
          for i := 0 to TPropertySymbol(Symbol).ArrayIndices.Count-1 do
          begin
            if (not First) then
              Keyword := Keyword + ',';
            First := False;
            Keyword := Keyword + TPropertySymbol(Symbol).ArrayIndices[i].Typ.Name;
          end;
          Keyword := Keyword + ']';
        end;
      end;
    end;
  end;

  if (GetHelpSystem(HelpSystem)) then
  begin
    HelpDownloadFilename := ExpandEnvironmentVariable(sScriptHelpRtlFilenameDownload);
    HelpDownloadPackage := HelpDownloadFilename;

    // Try downloaded help file
    HelpFilename := HelpDownloadFilename;

{$ifdef DEBUG}
    // Try development help file
    if (not FileExists(HelpFilename)) then
      HelpFilename := ExpandEnvironmentVariable(sScriptHelpRtlFilenameDebug);
{$endif DEBUG}

    // Try preinstalled help file
    if (not FileExists(HelpFilename)) then
      HelpFilename := ExpandEnvironmentVariable(sScriptHelpRtlFilenameDefault);

    HelpFileNotFound := (not FileExists(HelpFilename));
    // Prompt to download help file if it wasn't found on the system
    if (HelpFileNotFound) then
    begin
      if (MessageTaskDlgEx('Help file not found', BrandString('The script RTL help file was not found on your system.'#13#13+
        '%brandname% will now try to download and install the help file for you.|Help filename:'#13+HelpFilename),
        mtConfirmation, [mbOK, mbCancel], mbOK) <> mrOK) then
        exit;
    end;

    NeedDownload := False;
    DownloadURL := '';

    // Perform auto update check if help file wasn't found on the system or if we haven't performed an auto update check yet
    if (HelpFileNotFound) or (not FHasCheckedHelpVersion) then
    begin
      FHasCheckedHelpVersion := True;
{$ifdef FEATURE_PACKAGE_INSTALLER}
      NeedDownload := PackageInstallerService.AutoUpdateCheck(sPackageIDAppScriptHelpRtl, DownloadURL, [], 'script RTL help file');
{$else FEATURE_PACKAGE_INSTALLER}
      NeedDownload := HelpFileNotFound;
{$endif FEATURE_PACKAGE_INSTALLER}
    end;

    // Download and install help package
    if (NeedDownload) then
    begin
      HelpFilename := HelpDownloadFilename;

      // Determine if download is a package or a help file
{$ifdef FEATURE_PACKAGE_INSTALLER}
      DownloadIsPackage := (AnsiSameText(URLExtractFileExt(DownloadURL), sPackageInstallerFileType));
{$else FEATURE_PACKAGE_INSTALLER}
      DownloadIsPackage := False;
{$endif FEATURE_PACKAGE_INSTALLER}

      if (DownloadIsPackage) then
        HelpDownloadPackage := ExtractFilePath(HelpDownloadFilename) + URLExtractFilename(DownloadURL)
      else
        HelpDownloadPackage := HelpDownloadFilename;

{$ifdef FEATURE_PACKAGE_INSTALLER}
      PackageInstallerService.AutoUpdateExecute(DownloadURL, HelpDownloadPackage, DownloadIsPackage);
{$else FEATURE_PACKAGE_INSTALLER}
      ShowMessage('Auto update feature not enabled - Help will not be available');
      Abort;
{$endif FEATURE_PACKAGE_INSTALLER}

      // Make sure we now have the help file
      HelpFileNotFound := (not FileExists(HelpFilename));
    end;


    (*
    if (PerformSearch) then
    begin
      // BUG: HTML Help: HH_DISPLAY_SEARCH API Command Does Not Perform a Search
      // https://support.microsoft.com/en-us/kb/241381
      HelpSystem.ShowSearch(Keyword, HelpFilename);
    end else
    *)
    if (not HelpFileNotFound) then
    begin
      if (Keyword <> '') then
      begin
        HelpSystem.ShowHelp(Keyword, HelpFilename);
        HtmlHelp(Application.Handle, HelpFilename, HH_SYNC, 0);
        HtmlHelp(Application.Handle, HelpFilename, HH_DISPLAY_TOC, 0);
        HtmlHelp(Application.Handle, HelpFilename, HH_SYNC, 0);
      end else
        HelpSystem.ShowTopicHelp(TPath.GetFileNameWithoutExtension(sScriptHelpRtlFilename), HelpFilename);
    end;
  end;
end;

// -----------------------------------------------------------------------------
//
//              TFormScriptDebugger
//
// -----------------------------------------------------------------------------
constructor TFormScriptDebugger.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  DisableAero := True; // Best for rs2013/rs2013 ribbon style

  FSearchHistory := '';
  FSearchOptions := [];
  FSearchRegularExpression := False;

//  SynCodeCompletion.ClSelect := RootLookAndFeel.Painter.DefaultSelectionColor;
//  SynCodeCompletion.ClSelectedText := RootLookAndFeel.Painter.DefaultSelectionTextColor;
  SynCodeCompletion.ShortCut := 0;
  FDebuggerFrames := TList<IScriptDebuggerWindow>.Create;
end;

procedure TFormScriptDebugger.AfterConstruction;
var
  DebuggerFrame: IScriptDebuggerWindow;
//  sProjectFileName: TFileName;
//  S: string;
begin
  inherited;

  // Set up callback links
  FDebuggerFrames.Add(ScriptDebuggerBreakPointsFrame);

  for DebuggerFrame in FDebuggerFrames do
    DebuggerFrame.Initialize(Self, SmallImages, ImageListSymbols);

  ClearOutputWindow;

(*
  // Set the script folder
  if FOptions.ScriptFolder <> '' then // we have a supplied script folder..
  begin
    ScriptFolder := IncludeTrailingBackslash(FOptions.ScriptFolder);
    if not DirectoryExists(ScriptFolder) then
      raise Exception.CreateFmt(RStrScriptFolderNotFound, [ScriptFolder]);
  end
  else
  begin
    // Use the default folder - the desktop for demo
    ScriptFolder := IncludeTrailingBackslash(GetDesktopPath) + 'DWS Script Files';
    if not DirectoryExists(ScriptFolder) then
      raise Exception.Create(RStrIdeDesktopCopy);
  end;

  // Get the previously saved Document settings from registry...
  MakeSettingsRec;
  LoadSettings(sProjectFileName, FIDESettingsRec);

  // Try to get a Document name from the supplied Document name (which might be a *.dws or *.dwsproj)
  // if there is one, this becomes our Document file name.
  if FOptions.ProjectName <> '' then
    sProjectFileName := ScriptFolder + ChangeFileExt(FOptions.ProjectName, sDwsIdeProjectFileExt {eg '.dwsproj' });

  if FileExists(sProjectFileName) then
    LoadProjectFile(sProjectFileName) // << load the dwsproj if possible
  else
  begin
    S := ScriptFolder + ChangeFileExt(FOptions.ProjectName, sDwsIdeProjectSourceFileExt {eg '.dws' }); // try loading the main dws file...
    if FileExists(S) then
    begin
      // Here we've got a dws (main) file, so load it and make a project file from it too..
      FProjectFileName := ChangeFileExt(S, sDwsIdeProjectFileExt);
      EditorPageAddNew(S, True);
      SaveProjectFileAs(FProjectFileName);
    end
    else
       sProjectFileName := ScriptFolder + '\ExampleScript' + sDwsIdeProjectFileExt; {eg '.dwsproj'};

    if FileExists(sProjectFileName) then // we've got the example files, so load them...
      LoadProjectFile(sProjectFileName)
    else
      ActionFileNewProjectExecute(nil); // could not find anything, make a new blank Document
  end;
*)
end;

procedure TFormScriptDebugger.DoCreate;
begin
  inherited;

  (*
  ** Restore main window state
  **
  ** We must do this after TdxCustomRibbonForm.DoCreate has been executed
  ** in order to avoid the "growing form syndrome". The growing form is caused
  ** by TdxCustomRibbonForm.AdjustLayout (called from DoCreate).
  *)
  ScriptSettings.Forms.Main.ApplySettings(Self);
  if (ScriptSettings.Forms.Main.Maximized) then
    PostMessage(Handle, MSG_FORM_MAXIMIZE, 0, 0);
end;

procedure TFormScriptDebugger.BeforeDestruction;
begin

  inherited;
end;

procedure TFormScriptDebugger.MsgFormMaximize(var Msg: TMessage);
begin
  WindowState := wsMaximized;
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.FormCreate(Sender: TObject);
var
  i: integer;
begin
  FPages := Generics.Collections.TObjectList<TEditorPage>.Create;

  RibbonDebug.ActiveTab := RibbonTabEditor;
  RibbonTabDebug.Visible := False;
  SynCodeCompletion.Images := TImageList(ImageListSymbols);

  for i := 0 to ComponentCount-1 do
    if (Components[i] is TdxDockPanel) and (TdxDockPanel(Components[i]).ControlCount = 0) then
      TdxDockPanel(Components[i]).Visible := False;

  ScriptSettings.ReadConfig;
  LoadLayouts;
  LoadRecentFiles;

  if (ScriptSettings.Folders.FolderScript = '') then
    ScriptSettings.Folders.FolderScript := TPath.GetDirectoryName(Application.ExeName);

  OpenFileDialog.DefaultFolder := ScriptSettings.Folders.FolderScript;
  SaveSourceDialog.DefaultFolder := ScriptSettings.Folders.FolderScript;
  SaveProjectDialog.DefaultFolder := ScriptSettings.Folders.FolderScript;
  ShellComboBoxFileExplorer.Path := ScriptSettings.Folders.FolderScript;

  if (ScriptHostApplication <> nil) then
    ScriptHostApplication.Subscribe(Self);
end;

procedure TFormScriptDebugger.FormDestroy(Sender: TObject);
var
  DebuggerFrame: IScriptDebuggerWindow;
  i: integer;
begin
  if (FDebuggerFrames <> nil) then
    for DebuggerFrame in FDebuggerFrames do
      DebuggerFrame.Finalize;

  if (FScriptDebuggerHost <> nil) then
  begin
    FScriptDebuggerHost.NotifyClose(Self);
    FScriptDebuggerHost := nil;
    if (FScript <> nil) and (Assigned(FSaveOnNeedUnit)) then
      FScript.OnNeedUnit := FSaveOnNeedUnit;
    FScript := nil;
  end;

  if (Assigned(FOnDebuggerClose)) then
    FOnDebuggerClose(Self);

  if (ScriptHostApplication <> nil) then
    ScriptHostApplication.Unsubscribe(Self);

  SaveRecentFiles;
  ScriptSettings.Forms.Main.PrepareSettings(Self);
  ScriptSettings.WriteConfig;

  for i := FPages.Count-1 downto 0 do
    FPages[i].Free;

  ClearMessagesWindow;
  Debugger.Breakpoints.Clean;
  Debugger.Watches.Clean;
  FProgram := nil;
  FPages.Clear;
  FPages.Free;
  FDebuggerFrames.Free;

  FGotoForm.Free;
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.ApplicationCloseQuery(const ScriptHostApplication: IScriptHostApplication; var CanClose: boolean);
begin
  CanClose := CloseQuery;
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.ApplicationNotify(const ScriptHostApplication: IScriptHostApplication; Notification: TScriptHostApplicationNotification);
begin
  // Close when application is terminating to avoid ASSERT error in SynTextDrawer finalization
  if (Notification = TScriptHostApplicationNotification.notifyClosing) then
    // Do not use Close. Close will perform a CloseQuery and that has already been done by the ApplicationCloseQuery notification.
    Release;
end;

// -----------------------------------------------------------------------------
// IScriptDebugger implementation
// -----------------------------------------------------------------------------

function TFormScriptDebugger.GetDebugger: TdwsDebugger;
begin
  Result := Debugger;
end;

function TFormScriptDebugger.GetProgram: IdwsProgram;
begin
  Result := FProgram;
end;

procedure TFormScriptDebugger.ViewScriptPos(const AScriptPos: TScriptPos; AMoveCurrent: boolean; AHiddenMainModule: Boolean);
var
  ScriptName: string;
  i: integer;
  EditPage: IScriptDebugEditPage;
  ScriptProvider: IScriptProvider;
begin
  if (not AScriptPos.Defined) then
    exit;

  ScriptName := UnitNameFromScriptPos(AScriptPos);
{$ifdef DISABLED_STUFF}
  if ScriptName = SYS_MainModule then
  begin
    if AHiddenMainModule then
      i := -1
    else
      i := ProjectSourceFileIndex
  end
  else
{$endif DISABLED_STUFF}
    i := NameToEditorPageIndex(ScriptName);

  if (i = -1) then
  begin
    if (not AnsiSameText(ExtractFileExt(ScriptName), sScriptFileType)) then
      ScriptName := ScriptName + sScriptFileType;

    if (MainUnit <> nil) then
      ScriptProvider := MainUnit.ScriptProvider
    else
      ScriptProvider := nil;

    ScriptProvider := OpenScriptStream(ScriptName, ScriptProvider);
    if (ScriptProvider <> nil) then
    begin
      EditPage := EditorPageAddNew(ScriptProvider);
    end else
    begin
      EditPage := EditorPageAddNew(ScriptName, AScriptPos.SourceCode);
      // Read-only because we have no file to associate the source with
      EditPage.IsReadOnly := True;
    end;
    i := EditPage.Index;
  end;

  if (i <> -1) then
  begin
    EditorCurrentPageIndex := i;
    CurrentEditorPage.SetCurrentLine(AScriptPos.Line, AScriptPos.Col, AMoveCurrent);
    if (Visible) and (CurrentEditor.CanFocus) then
      CurrentEditor.SetFocus;
    CurrentEditor.InvalidateGutterLine(AScriptPos.Line);
    CurrentEditor.InvalidateLine(AScriptPos.Line);
  end;
end;

function TFormScriptDebugger.FindBreakPoint(const ScriptPos: TScriptPos): TBreakpointStatus;
var
  Test: TdwsDebuggerBreakpoint;
begin
  Result := bpsNone;
  if (not ScriptPos.Defined) or (Debugger.Breakpoints.Count = 0) then
    Exit;

  Test := Debugger.Breakpoints.BreakpointAt(ScriptPos);
  if (Test <> nil) then
  begin
    if (Test.Enabled) then
      Result := bpsBreakpoint
    else
      Result := bpsBreakpointDisabled;
  end;
end;

procedure TFormScriptDebugger.AddBreakpoint(const ScriptPos: TScriptPos; AEnabled: Boolean);
var
  BP: TdwsDebuggerBreakpoint;
  bAdded: Boolean;
  I: Integer;
begin
  BP := TdwsDebuggerBreakpoint.Create;
  BP.Line := ScriptPos.Line;

  BP.SourceName := ScriptPos.SourceName;

  I := Debugger.Breakpoints.AddOrFind(BP, bAdded);
  if (not bAdded) then
    BP.Free;
  Debugger.Breakpoints[I].Enabled := AEnabled;

  if (CurrentEditorPage <> nil) then
  begin
    CurrentEditorPage.Editor.InvalidateGutterLine(ScriptPos.Line);
    CurrentEditorPage.Editor.InvalidateLine(ScriptPos.Line);
  end;
  ScriptDebuggerBreakPointsFrame.UpdateInfo;

  Debugger.Breakpoints.BreakPointsChanged;
end;

procedure TFormScriptDebugger.ClearBreakpoint(const ScriptPos: TScriptPos);
var
  Test, Found: TdwsDebuggerBreakpoint;
  I: Integer;
begin
  if (Debugger.Breakpoints.Count = 0) then
    Exit;

  Test := TdwsDebuggerBreakpoint.Create;
  try
    Test.Line := ScriptPos.Line;
    Test.SourceName := ScriptPos.SourceName;

    I := Debugger.Breakpoints.IndexOf(Test);
    if (I <> -1) then
    begin
      Found := Debugger.Breakpoints[I];
      Debugger.Breakpoints.Extract(Found);
      FreeAndNil(Found);
    end;
  finally
    FreeAndNil(Test);
  end;

  if (CurrentEditorPage <> nil) then
  begin
    CurrentEditorPage.Editor.InvalidateGutterLine(ScriptPos.Line);
    CurrentEditorPage.Editor.InvalidateLine(ScriptPos.Line);
  end;
  ScriptDebuggerBreakPointsFrame.UpdateInfo;

  Debugger.Breakpoints.BreakPointsChanged;
end;

procedure TFormScriptDebugger.UpdateBreakpoints(Update: TBreakpointUpdate);
begin
  if (CurrentEditorPage <> nil) then
    CurrentEditorPage.Editor.Invalidate;

  if (Update = bpuReload) then
    ScriptDebuggerBreakPointsFrame.UpdateInfo
  else
    ScriptDebuggerBreakPointsFrame.RefreshInfo(Update);

  Debugger.Breakpoints.BreakPointsChanged;
end;

function TFormScriptDebugger.SymbolToImageIndex(Symbol: TSymbol): integer;
begin
  Result := DebuggerSymbolImageIndexUnknown;

  if (Symbol is TValueSymbol) then
  begin
    if (Symbol is TParamSymbol) then
      Result := DebuggerSymbolImageIndexParameter
    else
    if (Symbol is TPropertySymbol) then
      Result := DebuggerSymbolImageIndexProperty
    else
    if (Symbol is TConstSymbol) then
    begin
      if (Symbol is TElementSymbol) then
        Result := DebuggerSymbolImageIndexElement
      else
        Result := DebuggerSymbolImageIndexConst;
    end else
      Result := DebuggerSymbolImageIndexVariable;
  end else
  if (Symbol is TTypeSymbol) then
  begin
    Result := DebuggerSymbolImageIndexType;

    if (Symbol is TStructuredTypeSymbol) then
    begin
      if (Symbol is TClassSymbol) then
        Result := DebuggerSymbolImageIndexClass
      else
      if (Symbol is TRecordSymbol) then
        Result := DebuggerSymbolImageIndexRecord
      else
      if (Symbol is TInterfaceSymbol) then
        Result := DebuggerSymbolImageIndexInterface;
    end else
    if (Symbol is TUnitSymbol) then
      Result := DebuggerSymbolImageIndexUnit
    else
    if (Symbol is TEnumerationSymbol) then
      Result := DebuggerSymbolImageIndexEnum
    else
    if (Symbol is TAliasSymbol) then
      Result := DebuggerSymbolImageIndexType
    else
    if (Symbol is TStructuredTypeMetaSymbol) then
      Result := Ord(High(TdwsSuggestionCategory))+1
    else
    if (Symbol is TArraySymbol) then
      Result := DebuggerSymbolImageIndexArray
    else
    if (Symbol is TSetOfSymbol) then
      Result := DebuggerSymbolImageIndexSet
    else
    if (Symbol is TFuncSymbol) then
    begin
      if (Symbol is TMethodSymbol) then
      begin
        case TMethodSymbol(Symbol).Kind of
          fkConstructor: Result := DebuggerSymbolImageIndexConstructor;
          fkDestructor: Result := DebuggerSymbolImageIndexDestructor;
          fkMethod: Result := DebuggerSymbolImageIndexMethod;
          fkProcedure: Result := DebuggerSymbolImageIndexProcedure;
          fkFunction: Result := DebuggerSymbolImageIndexFunction;
        end;
      end else
      if TFuncSymbol(Symbol).IsType then
        Result := DebuggerSymbolImageIndexDelegate
      else
      if (Symbol.Typ = nil) then
        Result := DebuggerSymbolImageIndexProcedure
      else
        Result := DebuggerSymbolImageIndexFunction;
    end else
      Result := DebuggerSymbolImageIndexType;
  end else
  if (Symbol is TReservedWordSymbol) then
    Result := DebuggerSymbolImageIndexReservedWord
  else
  if (Symbol is TSpecialFunctionSymbol) then
    Result := DebuggerSymbolImageIndexSpecialFunction
  else
  if (Symbol is TClassOperatorSymbol) then
    Result := DebuggerSymbolImageIndexOperator;
end;

procedure TFormScriptDebugger.AddWatch(const Expression: string);
var
  Watch: TdwsDebuggerWatch;
  Added: boolean;
begin
  Watch := TdwsDebuggerWatch.Create;
  try
    Watch.ExpressionText := Expression;

    Debugger.Watches.AddOrFind(Watch, Added);

    if (Added) then
    begin
      Watch := nil;
      NotifyDebuggerFrames(dnUpdateWatches);
    end;
  finally
    Watch.Free;
  end;
end;

function TFormScriptDebugger.GetCompiledScript: IdwsProgram;
var
  Context: IScriptContext;
  ScriptProvider: IScriptProvider;
  DocumentProvider: IScriptDocumentProvider;
  Document: IScriptHostDocument;
begin
  Result := FProgram;
  if (Result <> nil) then
    exit;

  if not HasEditorPage then
    Exit;

  try

    ScriptProvider := MainUnit.ScriptProvider;
    if (ScriptProvider <> nil) then
    begin
      // If the current script hasn't been modified use the page's provider...
      if (MainUnit.Modified) then
        // ...otherwise create a temporary provider with the modified script.
        ScriptProvider := TStaticScriptProvider.Create(ScriptProvider.ScriptName, MainUnit.Script, ScriptProvider.Folder)
    end else
      ScriptProvider := TStaticScriptProvider.Create(MainUnit.UnitName, MainUnit.Script);

    if (Supports(ScriptProvider, IScriptDocumentProvider, DocumentProvider)) then
      Document := DocumentProvider.Document
    else
      Document := nil;

    Context := ScriptService.CreateContext(Document, nil, True);

    Context.Compile(ScriptProvider, False, True); // Compile for debug
    Result := Context.ScriptProgram;

  except
    Result := nil;
  end;
end;

procedure TFormScriptDebugger.Evaluate(const Expression: string; ScriptPos: PScriptPos);
begin
  if (FFormEvaluate = nil) then
  begin
    FFormEvaluate := TFormDebugEvaluate.Create(Self);
    FFormEvaluate.Initialize(Self);
  end;

  FFormEvaluate.Evaluate(Expression, ScriptPos);
end;

function TFormScriptDebugger.UnitNameFromScriptPos(const ScriptPos: TScriptPos): string;
begin
  Result := ScriptPos.SourceFile.Name;
  if (ScriptPos.IsMainModule) or (Result = MSG_MainModule) then
    Result := MainUnitName;
end;

function TFormScriptDebugger.UnitNameFromInternalName(const Name: string): string;
begin
  Result := Name;
  if (Result = MSG_MainModule) then
    Result := MainUnitName;
end;

// -----------------------------------------------------------------------------
// IScriptDebuggerSetup implementation
// -----------------------------------------------------------------------------
procedure TFormScriptDebugger.SetEnvironment(const AEnvironment: IdwsEnvironment);
begin
  FEnvironment := AEnvironment;
end;

function TFormScriptDebugger.AttachAndExecute(const AExecution: IdwsProgramExecution): boolean;
begin
  FProgram := AExecution.Prog;
  Debugger.AttachDebug(AExecution);

  Result := Execute;
end;

function TFormScriptDebugger.Execute(Modal: boolean): boolean;
begin
  if (Modal) then
    ShowModal
  else
    Show;

  Result := True;
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.SetDebuggerHost(const AScriptDebuggerHost: IScriptDebuggerHost);
begin
  FScriptDebuggerHost := AScriptDebuggerHost;
  if (FScriptDebuggerHost <> nil) then
    SetScript(FScriptDebuggerHost.GetDelphiWebScript)
  else
    FScript := nil;
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.LoadRecentFiles;

  procedure AddRecentFile(const Filename: string; Pinned: boolean);
  var
    Item: TdxBarExtraPaneItem;
  begin
    Item := BarApplicationMenu.ExtraPaneItems.Add;
    Item.Pin := Pinned;
    Item.Text := Filename;
    Item.DisplayText := ExtractFileName(Filename);
  end;

var
  s: string;
begin
  BarApplicationMenu.ExtraPaneItems.Clear;

  for s in ScriptSettings.Folders.RecentPinnedFiles do
    if (s <> '') then
      AddRecentFile(s, True);

  for s in ScriptSettings.Folders.RecentFiles do
    if (s <> '') then
      AddRecentFile(s, False);
end;

procedure TFormScriptDebugger.SaveRecentFiles;
var
  i: integer;
  s: string;
begin
  ScriptSettings.Folders.RecentFiles.Clear;
  ScriptSettings.Folders.RecentPinnedFiles.Clear;

  for i := 0 to BarApplicationMenu.ExtraPaneItems.Count-1 do
  begin
    s := BarApplicationMenu.ExtraPaneItems[i].Text;

    if (BarApplicationMenu.ExtraPaneItems[i].Pin) then
      ScriptSettings.Folders.RecentPinnedFiles.Add(s)
    else
      ScriptSettings.Folders.RecentFiles.Add(s)
  end;
end;

procedure TFormScriptDebugger.AddRecentFile(const Filename: string);
var
  i: integer;
  Item: TdxBarExtraPaneItem;
begin
  if (Filename = '') or (ExtractFilePath(Filename) = '') or (not FileExists(Filename)) then
    exit;

  Item := nil;
  for i := 0 to BarApplicationMenu.ExtraPaneItems.Count-1 do
    if (AnsiSameText(Filename, BarApplicationMenu.ExtraPaneItems[i].Text)) then
    begin
      Item := BarApplicationMenu.ExtraPaneItems[i];
      break;
    end;

  if (Item = nil) then
  begin
    Item := BarApplicationMenu.ExtraPaneItems.Add;
    Item.Text := Filename;
    Item.DisplayText := ExtractFileName(Filename);
  end;

  i := 0;
  if (not Item.Pin) then
  begin
    // Determine index of first unpinned item
    while (i < BarApplicationMenu.ExtraPaneItems.Count-1) and (BarApplicationMenu.ExtraPaneItems[i].Pin) do
      Inc(i);
  end;
  Item.Index := i;

  // Prune to at most 10 items
  for i := BarApplicationMenu.ExtraPaneItems.Count-1 downto 10 do
    if (not BarApplicationMenu.ExtraPaneItems[i].Pin) then
      BarApplicationMenu.ExtraPaneItems.Delete(i);
end;

procedure TFormScriptDebugger.BarApplicationMenuExtraPaneItemClick(Sender: TObject; AIndex: Integer);
var
  Filename: string;
begin
  Filename := BarApplicationMenu.ExtraPaneItems[AIndex].Text;
  EditorPageAddNew(FileName, True, True);
end;

procedure TFormScriptDebugger.BarApplicationMenuPopup(Sender: TObject);
var
  List: TList<TdxBarExtraPaneItem>;
  Index: integer;
  Item: TdxBarExtraPaneItem;
begin
  // Sort recent list, pinned before unpinned
  List := TList<TdxBarExtraPaneItem>.Create(TComparer<TdxBarExtraPaneItem>.Construct(
    function(const Left, Right: TdxBarExtraPaneItem): integer
    begin
      Result := Ord(Right.Pin) - Ord(Left.Pin);
      if (Result = 0) then
        Result := Left.Index - Right.Index; // Preserve order
    end));
  try
    for Index := 0 to BarApplicationMenu.ExtraPaneItems.Count-1 do
      List.Add(BarApplicationMenu.ExtraPaneItems[Index]);

    List.Sort;

    // Apply new order
    Index := 0;
    for Item in List do
    begin
      Item.Index := Index;
      Inc(Index);
    end;
  finally
    List.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.LoadLayouts;
var
  LayoutNames: TStringList;
  i: integer;
begin
  LayoutNames := TStringList.Create;
  try
    LayoutNames.CaseSensitive := False;
    LayoutNames.Duplicates := dupIgnore;

    for i := 0 to ScriptSettings.Layout.Count-1 do
      LayoutNames.Add(ScriptSettings.Layout.Names[i]);

    BarComboLayout.Items.Assign(LayoutNames);
  finally
    LayoutNames.Free;
  end;

  BarComboLayout.Text := ScriptSettings.Layout.EditLayout;
end;

procedure TFormScriptDebugger.SaveLayout;
begin
  if (FLayoutName = '') then
    FLayoutName := sScriptDebuggerLayoutNameDefault;

  DockingManager.SaveLayoutToRegistry(ScriptSettings.Layout.Key+FLayoutName);
end;

procedure TFormScriptDebugger.DockingManagerLayoutChanged(Sender: TdxCustomDockControl);
begin
  if (not FLauoutLoading) then
    BarComboLayout.ItemIndex := -1;
end;

procedure TFormScriptDebugger.BarComboLayoutChange(Sender: TObject);
begin
  if (BarComboLayout.Text = FLayoutName) then
    exit;

  if (BarComboLayout.ItemIndex <> -1) then
  begin
    FLayoutName := BarComboLayout.Text;

    FLauoutLoading := True;
    try
      DockingManager.LoadLayoutFromRegistry(ScriptSettings.Layout.Key+FLayoutName);
    finally
      FLauoutLoading := False;
    end;
  end else
    FLayoutName := '';
end;

procedure TFormScriptDebugger.ActionLayoutDefaultDebugExecute(Sender: TObject);
begin
  ScriptSettings.Layout.DebugLayout := BarComboLayout.Text;
end;

procedure TFormScriptDebugger.ActionLayoutDefaultDebugUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (BarComboLayout.ItemIndex <> -1);
  TAction(Sender).Checked := (FLayoutName = ScriptSettings.Layout.DebugLayout);
end;

procedure TFormScriptDebugger.ActionLayoutDefaultEditExecute(Sender: TObject);
begin
  ScriptSettings.Layout.EditLayout := BarComboLayout.Text;
end;

procedure TFormScriptDebugger.ActionLayoutDefaultEditUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (BarComboLayout.ItemIndex <> -1);
  TAction(Sender).Checked := (FLayoutName = ScriptSettings.Layout.EditLayout);
end;

procedure TFormScriptDebugger.ActionLayoutSaveExecute(Sender: TObject);
var
  s: string;
begin
  s := FLayoutName;

  if (not InputQueryCombo('Save layout', 'Enter layout name:', s, BarComboLayout.Items)) or (s = '') then
    exit;

  if (BarComboLayout.Items.IndexOf(s) <> -1) then
  begin
    if (MessageTaskDlgEx(Format('"%s" already exists', [s]), 'Do you want to replace it?', mtConfirmation, [mbYes, mbNo], mbNo) <> mrYes) then
      exit;
  end else
    BarComboLayout.Items.Add(s);

  FLayoutName := s;
  SaveLayout;

  BarComboLayout.Text := FLayoutName;
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.ActionMessagesClearExecute(Sender: TObject);
begin
  ListViewMessages.Items.Clear;
end;

procedure TFormScriptDebugger.ActionMessagesClearUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (ListViewMessages.Items.Count > 0);
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.FormShow(Sender: TObject);

  procedure EnsureVisible;
  var
    I: Integer;
    Ri: TRect;
  const
    Margin = 100;  // Number of pixels to be seen, at least
  begin
    I := 0;
    while I < Screen.MonitorCount do
    begin
      // Compute the intersection between screen and form
      Windows.IntersectRect(Ri, BoundsRect, Screen.Monitors[I].BoundsRect);

      // Check the intersection is large enough
      if (Ri.Right - Ri.Left > Margin) and (Ri.Bottom - Ri.Top > Margin) then
        Break;
      Inc(I);
    end;

    if I >= Screen.MonitorCount then
    begin
      // Form is outside of any monitor.
      // Move to center of main monitor
      Top := (Screen.Height - Height) div 2;
      Left := (Screen.Width  - Width)  div 2;
    end;
  end;

//var
//  I: Integer;
begin
//  BoundsRect := FIDESettingsRec.FormRect;
  EnsureVisible;

(*
  I := Max(FIDESettingsRec.RightPanelWidth, 30);
  I := Min(I, Width - 30);
  PanelRight.Width := I;

  I := Max(FIDESettingsRec.BottomPanelHeight, 30);
  I := Min(I, Height - 30);
  PanelBottom.Height := I;
*)

  if CanGotoHomePosition then
    GotoHomePosition;
end;

procedure TFormScriptDebugger.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormScriptDebugger.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Debugger.State = dsDebugSuspended then
  begin
    CanClose := False;

    if not(daCanEndDebug in Debugger.AllowedActions) then
      exit;

    if (Application.ModalLevel > 0) then
    begin
      MessageDlgEx('Debug session can not be terminated while a modal dialog is displayed', mtWarning, [mbOK], -1);
      exit;
    end;

    if (ConfirmDlg(RStrAbandonDebugging)) then
      ResetProgram;

    Exit;
  end;

(*
  if ProjectFilename = '' then
    Exit;

  if FileExists(ProjectFilename) then
    SaveProjectFileAs(ProjectFileName)
  else
    if not SaveProjectAs then
      Abort;
*)

  CanClose := EditorPagesCloseQuery;
end;

procedure TFormScriptDebugger.AddStatusMessage(const AStr: string);
begin
  StatusBar.Panels[3].Text := AStr;
  StatusBar.Update;
end;

procedure TFormScriptDebugger.ClearMessagesWindow;
begin
  ListViewMessages.Items.Clear;
end;

procedure TFormScriptDebugger.ClearOutputWindow;
begin
  MemoOutputWindow.Clear;
end;

procedure TFormScriptDebugger.AddMessage(const AMessage: string; const AScriptPos: TScriptPos; AKind: TMessageKind; Select: boolean);
var
  Item: TListItem;
  ScriptPos: PScriptPos;
  SaveActiveControl: TWinControl;
begin
  Item := ListViewMessages.Items.Add;
  Item.Caption := AMessage;
  if (AScriptPos.Defined) then
  begin
    New(ScriptPos);
    ScriptPos^ := AScriptPos;  // Note: This copies SourceFile reference so if SourceFile is destroyed, we're left with an invalid reference. The IncRefCount below tries to solve that.
    if (ScriptPos^.SourceFile <> nil) then
      ScriptPos^.SourceFile.IncRefCount;
    Item.Data := ScriptPos;
  end else
    Item.Data := nil;
  Item.ImageIndex := Ord(AKind)-1;
  if (Select) then
  begin
    Item.Selected := True;
    Item.MakeVisible(False);
  end;

  SaveActiveControl := ActiveControl;
  if (SaveActiveControl <> CurrentEditor) then
    SaveActiveControl := nil;
  DockPanelMessages.Activate;
  if (SaveActiveControl <> nil) then
    ActiveControl := SaveActiveControl;
(* Do not steal focus from editor
  if (Visible) and (DockPanelMessages.CanFocus) then
    DockPanelMessages.SetFocus;
*)

  ListViewMessages.Update;
//  PageControlBottomWindows.ActivePage := TabSheetMessages;
end;

procedure TFormScriptDebugger.AddMessage(const AMessage: string; AKind: TMessageKind; Select: boolean);
var
  ScriptPos: TScriptPos;
begin
  ScriptPos.Clear;
  AddMessage(AMessage, ScriptPos, AKind, Select);
end;

procedure TFormScriptDebugger.AddMessageInfo(Messages: TdwsMessageList; Index: integer);
var
  I: Integer;
  Kind: TMessageKind;
begin
  for I := 0 to Messages.Count - 1 do
  begin
    if (Messages[I].IsError) then
      Kind := mkError
    else
    if (Messages[I] is TWarningMessage) then
      Kind := mkWarning
    else
      Kind := mkInfo;

    if Messages[I] is TScriptMessage then
      AddMessage('  ' + Messages[I].AsInfo, TScriptMessage(Messages[I]).ScriptPos, Kind, (i = Index))
    else
      AddMessage('  ' + Messages[I].AsInfo, Kind, (i = Index));
  end;
end;

function TFormScriptDebugger.AddAlertMessage(const ACaption, AMessage: string; AImageIndex, ATimeout: integer): IScriptHostAlertWindow;
begin
  if (ScriptHostApplication <> nil) then
    Result := ScriptHostApplication.AddAlertMessage(ACaption, AMessage, AImageIndex, ATimeout);
end;

function TFormScriptDebugger.GetScriptProvider(var MainUnitName: string; const AScript: string): IScriptProvider;
begin
  if (AScript = '') and (MainUnit <> nil) then
  begin
    Result := MainUnit.ScriptProvider;
    if (Result <> nil) then
    begin
      // If the current script hasn't been modified use the page's provider...
      if (MainUnit.Modified) then
        // ...otherwise create a temporary provider with the modified script.
        Result := TStaticScriptProvider.Create(Result.ScriptName, MainUnit.Script, Result.Folder)
    end else
      Result := TStaticScriptProvider.Create(MainUnit.UnitName, MainUnit.Script);

    MainUnitName := MainUnit.UnitName;
  end else
  begin
    Result := TStaticScriptProvider.Create('', AScript);
    MainUnitName := '';
  end;
end;

function TFormScriptDebugger.CreateCompilerContext(const ScriptProvider: IScriptProvider): IScriptContext;
var
  DocumentProvider: IScriptDocumentProvider;
  Document: IScriptHostDocument;
begin
  if (ScriptProvider <> nil) and (Supports(ScriptProvider, IScriptDocumentProvider, DocumentProvider)) then
    Document := DocumentProvider.Document
  else
    Document := nil;

  Result := ScriptService.CreateContext(Document);
end;

procedure TFormScriptDebugger.Compile(ABuild: Boolean; const AScript: string = '');
var
  ScriptProvider: IScriptProvider;
  i: integer;
  Page: TEditorPage;
  Stopwatch: TStopwatch;
  Duration: Int64;
begin
  if (not ABuild) and (IsCompiled) then
    exit;

  NotifyDebuggerFrames(dnCompiling);

  // Make the implicit "main unit" explicit.
  Page := MainUnit;
  if (Page <> nil) then
    MainUnit := Page;

  FCompileContext := nil;
  ClearMessagesWindow;
  AddMessage(RStrCompileStarted, mkInfo);

//  FScript.Config.HintsLevel := hlPedantic;

  ScriptProvider := GetScriptProvider(FMainUnitName, AScript);
  FCompileContext := CreateCompilerContext(ScriptProvider);

  Stopwatch := TStopwatch.StartNew;
  try

    FCompileContext.Compile(ScriptProvider, False, True); // compile for debug

  finally
    Stopwatch.Stop;
  end;
  FProgram := FCompileContext.ScriptProgram;

  TScriptFileSystemFactory(Script.Config.RuntimeFileSystem).SetRoot(ScriptProvider.Folder);

  AddMessageInfo(FProgram.Msgs);

  if FProgram.Msgs.HasErrors then // did not compile - errors
  begin
    AddMessage('Compile completed with error(s)', mkWarning);
    for i := 0 to FProgram.Msgs.Count-1 do
      if (FProgram.Msgs[i].IsError) and (FProgram.Msgs[i] is TScriptMessage) then
      begin
        ViewScriptPos(TScriptMessage(FProgram.Msgs[i]).ScriptPos, AScript <> '');
        ErrorDlg(FProgram.Msgs[i].AsInfo);
        break;
      end;
  end else
  begin
    Duration := Stopwatch.ElapsedMilliseconds;
    if (Duration = 0) then
      Duration := 1;
    AddMessage(Format('Compiled %.0n lines of code in %.2n mS (%.0n lines/S)', [Int(FProgram.LineCount), 1.0*Duration, 1000*FProgram.LineCount/Duration]), mkInfo);
  end;

  if (IsCompiled) then
    NotifyDebuggerFrames(dnCompiled);
end;

function TFormScriptDebugger.NameToEditorPageIndex(const AName: string): Integer;
begin
  Result := EditorPageCount - 1;
  while (Result >= 0) do
  begin
    if AnsiSameText(EditorPage(Result).UnitName, AName) then
      break;
    dec(Result);
  end;
end;

procedure TFormScriptDebugger.NotifyDebuggerFrames(State: TScriptDebuggerNotification);
var
  DebuggerFrame: IScriptDebuggerWindow;
begin
  for DebuggerFrame in FDebuggerFrames do
    DebuggerFrame.DebuggerStateChanged(State);
end;

function TFormScriptDebugger.EditorPagesCloseAll(AExceptIndex: Integer): boolean;
var
  i: Integer;
begin
  Result := True;

  for i := EditorPageCount - 1 downto 0 do
    if (i <> AExceptIndex) then
      EditorPageClose(i);
end;

function TFormScriptDebugger.EditorPagesCloseQuery(AExceptIndex: Integer = -1): boolean;
var
  i: Integer;
  Page: TEditorPage;
begin
  Result := True;
  for i := EditorPageCount - 1 downto 0 do
    if (i <> AExceptIndex) then
    begin
      Page := EditorPage(i);
      Result := Page.CloseQuery;
      if (not Result) then
        exit;
    end;
end;

procedure TFormScriptDebugger.EditorSaveAllIfModified(APromptOverwrite: Boolean);
var
  I: Integer;
  Page: TEditorPage;
begin
  for I := 0 to EditorPageCount - 1 do
  begin
    Page := EditorPage(I);
    if (Page.Modified) then
      SavePage(Page);
  end;
end;

procedure TFormScriptDebugger.SavePage(Page: TEditorPage);
begin
  if (Page.ScriptProvider = nil) then
    CurrentEditorPage._SaveAs
  else
  if (Page.Save) then
    Page.ClearModified;
end;

procedure TFormScriptDebugger.MsgExecReset(var Msg: TMessage);
begin
  EndDebug;
end;

procedure TFormScriptDebugger.ResetProgram;
begin
  TdwsMainProgram(Debugger.Execution.Prog).FinalExpr.Free;
  TdwsMainProgram(Debugger.Execution.Prog).FinalExpr := nil;
  try

    Debugger.EndDebug;

  except
  end;
  PostMessage(Handle, MSG_EXEC_RESET, 0, 0);
end;

function TFormScriptDebugger.UnitMainScript(const AUnitName, AIdentifier: string): string;
const
  sScriptTemplate =
      'uses %s;'#13#10
    + 'begin'#13#10
    + '%s'#13#10
    + 'end;'#13#10;
begin
  Result := Format(sScriptTemplate, [AUnitName, AIdentifier]);
end;

procedure TFormScriptDebugger.RunFunctionMethodByName(const AUnit, AName: string; AWithDebugging, APrompt: Boolean);
var
  Exec: IdwsProgramExecution;
  Stopwatch: TStopwatch;
  sScript: string;
begin
  if APrompt and not ConfirmDlg(Format(RStrRunFunctionMethod, [AName])) then
    Exit;

  EditorSaveAllIfModified(False);

  sScript := UnitMainScript(AUnit, AName);

  Compile(True, sScript);

  if not IsCompiled then
    Exit;

  AddStatusMessage(RStrRunning);
  Update;
  ShowExecutableLines;

  Exec := FProgram.CreateNewExecution;
  Stopwatch := TStopwatch.Create;
  Stopwatch.Start;
  try
    Exec.Environment := Environment;
    if AWithDebugging then
      Debugger.BeginDebug(Exec)
    else
    begin
      Exec.BeginProgram;
      Exec.RunProgram(0);
    end;
  finally
    Stopwatch.Stop;
    if AWithDebugging then
      Debugger.EndDebug
    else
      Exec.EndProgram;

    ClearExecutableLines;
    if Exec.Msgs.Count > 0 then
    begin
      AddStatusMessage('Errors');
      ViewScriptPos(Exec.Msgs.LastMessagePos, True);
      ErrorDlg(Exec.Msgs.AsInfo);
    end else
    begin
      if Stopwatch.Elapsed.TotalSeconds < 1.0 then
        AddStatusMessage(Format('Completed in %0.3f ms', [Stopwatch.Elapsed.TotalMilliseconds]))
      else
        AddStatusMessage(Format('Completed in %0.3f s', [Stopwatch.Elapsed.TotalSeconds]));
    end;
  end;
end;

function TFormScriptDebugger.TryRunSelection(ADebug: Boolean): Boolean;
var
  S: string;
begin
  Result := CurrentEditor.SelAvail;
  if Result then
  begin
    S := CurrentEditor.SelText;
    if IsValidIdentifier(S) then
      RunFunctionMethodByName(CurrentEditorPage.InternalUnitName, S, ADebug, True {prompt});
  end;
end;

type
  TdwsCompilerCracker = class(TdwsCompiler);

procedure TFormScriptDebugger.ListSymbols;
begin
  DockPanelSymbols.Visible := True;
end;

procedure TFormScriptDebugger.ClearCurrentLine;
var
  I: Integer;
begin
  for I := 0 to EditorPageCount - 1 do
    EditorPage(I).SetCurrentLine(-1);
end;

procedure TFormScriptDebugger.ClearAllBreakpoints;
var
  I: Integer;
begin
  Debugger.Breakpoints.Clean;
  for I := 0 to EditorPageCount - 1 do
    EditorPage(I).Editor.Invalidate;
  ScriptDebuggerBreakPointsFrame.UpdateInfo;
end;

function TFormScriptDebugger.CurrentEditor: TSynEdit;
begin
  if HasEditorPage then
    Result := EditorPage(EditorCurrentPageIndex).Editor
  else
     Result := nil;
end;

function TFormScriptDebugger.CurrentEditorPage: TEditorPage;
begin
  Result := EditorPage(EditorCurrentPageIndex);
end;

function TFormScriptDebugger.GetMainUnit: TEditorPage;
begin
  Result := FMainUnit;

  if (Result = nil) then
    Result := CurrentEditorPage;
end;

procedure TFormScriptDebugger.SetMainUnit(const Value: TEditorPage);
begin
  if (FMainUnit = Value) then
    exit;

  ClearExecutableLines;
  ClearMessagesWindow;

  FMainUnit := Value;

  if (FMainUnit = nil) then
    FProgram := nil;

  PageControlEditor.ViewInfo.Calculate;
  PageControlEditor.InvalidateWithChildren;
end;

procedure TFormScriptDebugger.DoOnExecutionStarted(Execution: TdwsProgramExecution);
begin
  if (FScriptDebuggerHost <> nil) then
    FScriptDebuggerHost.NotifyExecution(Self, Execution, senStarted);
  if (Assigned(FOnBeforeExecution)) then
    FOnBeforeExecution(Execution);
end;

procedure TFormScriptDebugger.DoOnExecutionEnded(Execution: TdwsProgramExecution);
begin
  if (FScriptDebuggerHost <> nil) then
    FScriptDebuggerHost.NotifyExecution(Self, Execution, senEnded);
  if (Assigned(OnAfterExecution)) then
    OnAfterExecution(Execution);
end;

function TFormScriptDebugger.DoOnNeedUnit(const unitName: UnicodeString; var unitSource: UnicodeString): IdwsUnit;
var
  i: integer;
  Page: TEditorPage;
begin
  Result := nil;
  i := NameToEditorPageIndex(UnitName);
  if (i = -1) and (UnitName = MSG_MainModule) and (FMainUnitName <> '') then
    i := NameToEditorPageIndex(FMainUnitName);

  if (i <> -1) then
  begin
    Page := EditorPage(i);
    unitSource := Page.Script;
  end;
end;

procedure TFormScriptDebugger.DoSearch(AOptions: TSynSearchOptions; First: boolean);
var
  Editor: TSynEdit;
  SavePos: TBufferCoord;
begin
  Editor := CurrentEditor;

  if (Editor.SearchReplace(FSearchText, '', AOptions) <> 0) then
    exit;

  if (FSearchAutoWrap) then
  begin
    SavePos := Editor.CaretXY;
    if (Editor.SearchReplace(FSearchText, '', AOptions + [ssoEntireScope]) <> 0) then
    begin
      if (Editor.CaretXY = SavePos) then
        AddAlertMessage('Find', 'No more matches', -1, 1000);
      exit;
    end;
  end;

  AddAlertMessage('Find', 'Search text not found', -1, 1000);

  if (ssoBackwards in AOptions) then
    Editor.BlockEnd := Editor.BlockBegin
  else
    Editor.BlockBegin := Editor.BlockEnd;

  Editor.CaretXY := Editor.BlockBegin;
end;

procedure TFormScriptDebugger.DropFileTarget1Drop(Sender: TObject; ShiftState: TShiftState; APoint: TPoint; var Effect: Integer);
var
  i: integer;
  Any: boolean;
begin
  Any := False;
  for i := 0 to DropFileTarget1.Files.Count-1 do
    if (AnsiSameText(ExtractFileExt(DropFileTarget1.Files[i]), sScriptFileType)) then
    begin
      if (FileIsOpenInEditor(DropFileTarget1.Files[i])) or (EditorPageAddNew(DropFileTarget1.Files[i], True, True) <> nil) then
        Any := True;
    end;

  if (Any) then
    Effect := DROPEFFECT_COPY
  else
    Effect := DROPEFFECT_NONE;
end;

procedure TFormScriptDebugger.DropFileTarget1Enter(Sender: TObject; ShiftState: TShiftState; APoint: TPoint; var Effect: Integer);
var
  i: integer;
  Any: boolean;
begin
  Any := False;
  for i := 0 to DropFileTarget1.Files.Count-1 do
    if (AnsiSameText(ExtractFileExt(DropFileTarget1.Files[i]), sScriptFileType)) then
    begin
      Any := True;
      break;
    end;

  if (not Any) then
    Effect := DROPEFFECT_NONE;
end;

procedure TFormScriptDebugger.DebuggerDebugMessage(const msg: string);
var
  SaveActiveControl: TWinControl;
begin
  MemoOutputWindow.Lines.Add('ODS: ' + msg);

  SaveActiveControl := ActiveControl;
  if (SaveActiveControl <> CurrentEditor) then
    SaveActiveControl := nil;
  DockPanelOutput.Activate;
  if (SaveActiveControl <> nil) then
    ActiveControl := SaveActiveControl;
(* Do not steal focus from editor
  if (Visible) and (DockPanelOutput.CanFocus) then
    DockPanelOutput.SetFocus;
*)
end;

procedure TFormScriptDebugger.DebuggerDebugStop(exec: TdwsExecution);
begin
//
end;

procedure TFormScriptDebugger.DebuggerNotifyException(const exceptObj: IInfo);
var
  Expr: TExprBase;
begin
  if (exceptObj <> nil) then
  begin
    Expr := exceptObj.Exec.GetLastScriptErrorExpr;
    try
      FPendingExceptionMsg := exceptObj.scriptobj.asstring[0];
    except
      FPendingExceptionMsg := Format('Exception "%s" caught', [exceptObj.TypeSym.Name]);
    end;
  end else
  begin
    Expr := nil;
    FPendingExceptionMsg := 'Exception caught';
  end;


  if (Expr <> nil) then
  begin
    FPendingExceptionMsg := FPendingExceptionMsg + ': ' + Expr.ScriptPos.AsInfo;
    FPendingExceptionPos := Expr.ScriptPos;
  end else
    FPendingExceptionPos.Clear;
end;

procedure TFormScriptDebugger.DebuggerStateChanged(Sender: TObject);

  procedure UpdateDebugWindows;
  begin
    if (not ActionDebug.Visible) and (FFormEvaluate <> nil) then
      FFormEvaluate.Hide;
  end;

var
  Breakpoint: TdwsDebuggerBreakpoint;
begin
  ActionDebug.Visible  := not(Debugger.State in [dsIdle, dsDebugDone]);
  RibbonTabDebug.Visible := ActionDebug.Visible;

  case Debugger.State of
    dsDebugRun:
      begin
//        ActionLayoutDefaultEdit.Visible := False;
//        ActionLayoutDefaultDebug.Visible := True;

        ClearCurrentLine;
        AddStatusMessage(RStrRunning);

        if (FPreviousDebuggerState = dsDebugSuspended) then
        begin
          // AddMessage('Execution resumed', mkInfo);
          // Handle modal dialog
          if (Application.ModalLevel > 0) then
          begin
            if (IsWindowEnabledEx(Handle)) then
              EnableWindow(Handle, False);

            if (FSavedModalForm <> nil) and (fsModal in FSavedModalForm.FormState) then
            begin
              EnableWindow(FSavedModalForm.Handle, True);
              FSavedModalForm.BringToFront;
            end;
            FSavedModalForm := nil;
          end;
        end else
        begin
          RibbonDebug.ActiveTab := RibbonTabDebug;
        end;
        NotifyDebuggerFrames(dnDebugRun);
      end;

    dsDebugSuspending:
      NotifyDebuggerFrames(dnDebugSuspending);

    dsDebugSuspended:
      begin
        AddStatusMessage(RStrPaused);
        if (FPendingExceptionMsg <> '') then
        begin
          AddMessage(FPendingExceptionMsg, FPendingExceptionPos, mkInfo, True);
          FPendingExceptionMsg := '';
          ViewScriptPos(FPendingExceptionPos);
          FPendingExceptionPos.Clear;
        end;
        if (Debugger.CurrentScriptPos.Defined) then
        begin
          Breakpoint := Debugger.Breakpoints.BreakpointAt(Debugger.CurrentScriptPos);
          if (Breakpoint <> nil) and (Breakpoint.Enabled) then
            AddMessage('Execution paused on breakpoint', Debugger.CurrentScriptPos, mkInfo);
          ViewScriptPos(Debugger.CurrentScriptPos, True);
        end;
        NotifyDebuggerFrames(dnDebugSuspended);
        UpdateDebugWindows;

        // Handle modal dialog
        if (Application.ModalLevel > 0) then
        begin
          if (Screen.ActiveCustomForm <> nil) and (fsModal in Screen.ActiveCustomForm.FormState) then
          begin
            FSavedModalForm := Screen.ActiveCustomForm;
            EnableWindow(FSavedModalForm.Handle, False);
          end else
            FSavedModalForm := nil;

          if (not IsWindowEnabledEx(Handle)) then
            EnableWindow(Handle, True);
        end;
        BringToFront;
      end;

    dsDebugResuming:
      NotifyDebuggerFrames(dnDebugResuming);
      // Never happens. Transition from dsDebugResuming to dsDebugRun is handled internally in the debugger

    dsIdle,
    dsDebugDone:
      begin
        if (Debugger.State = dsIdle) then
          NotifyDebuggerFrames(dnIdle)
        else
          NotifyDebuggerFrames(dnDebugDone);
        ClearCurrentLine;
        UpdateDebugWindows;
        RibbonDebug.ActiveTab := RibbonTabEditor;
        if (not IsWindowEnabledEx(Handle)) then
          EnableWindow(Handle, True);

//        ActionLayoutDefaultDebug.Visible := False;
//        ActionLayoutDefaultEdit.Visible := True;
        // Switch to edit layout
        BarComboLayout.Text := ScriptSettings.Layout.EditLayout;
      end
  end;

  UpdateActions;
  FPreviousDebuggerState := Debugger.State;
end;


procedure TFormScriptDebugger.GotoHomePosition;
begin
  FHomePositionCaptionSuffix := '';
  if (ScriptSettings.Editor.HomePositionFileName <> '') then
    if OpenEditorPage(ScriptSettings.Editor.HomePositionFileName) then
    begin
      FHomePositionCaptionSuffix := ScriptSettings.Editor.HomePositionFileName;
      if ScriptSettings.Editor.HomePositionFileIdentifier <> '' then
      begin
        CurrentEditorPage.GotoIdentifier(ScriptSettings.Editor.HomePositionFileIdentifier);
        FHomePositionCaptionSuffix := Format('%s%s [%s]', [
          ScriptSettings.Editor.HomePositionFileName,
          sScriptFileType,
          ScriptSettings.Editor.HomePositionFileIdentifier]);
      end;
    end;
end;

function TFormScriptDebugger.CanGotoHomePosition: Boolean;
begin
  Result := ScriptSettings.Editor.HomePositionFileName <> '';
end;

procedure TFormScriptDebugger.dxBarButton12Click(Sender: TObject);
begin
  try
    Debugger.BeginOptions := [dboBeginSuspendedInMainModule, dboBeginSuspendedAnywhere];
    try

      ClearOutputWindow;

      DoExecute(True);

    finally
      Debugger.BeginOptions := [];
    end;

  except
    on E: EScriptStopped do
      ;
    on E: Exception do
      ErrorDlg(E.Message);
  end;
end;

procedure TFormScriptDebugger.EditorChange(Sender: TObject);
begin
  if IsCompiled then
  begin
    ClearExecutableLines;
    ClearMessagesWindow;
    FProgram := nil;
  end;
  //FScript.NotifyScriptModified;
end;

function TFormScriptDebugger.FileIsOpenInEditor(const AFileName: TFileName; Activate: boolean): Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := 0 to EditorPageCount - 1 do
    if AnsiSameText(AFileName, EditorPage(I).FileName) then
    begin
      if (Activate) then
        SetEditorCurrentPageIndex(i);
      Exit;
    end;
  Result := False;
end;

function TFormScriptDebugger.HasEditorPage: Boolean;
begin
  Result := EditorCurrentPageIndex <> -1;
end;

function TFormScriptDebugger.IsCompiled: Boolean;
begin
  Result := (FProgram <> nil) and (not FProgram.Msgs.HasErrors);
end;

procedure TFormScriptDebugger.SetScript(const Value: TDelphiWebScript);
begin
  FScript := Value;

  if (FScript = nil) then
    raise EDWScriptStudio.Create(RStrScriptCannotBeNil);

  if (FScript.Config.ScriptPaths.Count = 0) then
    raise EDWScriptStudio.Create(RStrScriptDoesNotDefineMainPath);

  // Script result type has been saved before calling the IDE form
  // so we can load an 'output window' connection here..
  FScript.Config.ResultType := TOutputWindowStringResultType.Create(FScript, Self);

  if (not Assigned(FSaveOnNeedUnit)) then
    FSaveOnNeedUnit := FScript.OnNeedUnit;
  FScript.OnNeedUnit := DoOnNeedUnit;
end;

procedure TFormScriptDebugger.SetEditorCurrentPageIndex(const Value: Integer);
var
  page: TEditorPage;
begin
  if Value = EditorCurrentPageIndex then
    Exit;

  if Value > FPages.Count - 1 then
    Exit;

  if EditorCurrentPageIndex >= 0 then
  begin
    page := EditorPage(Value);
(*
    page.Visible := False;
    page.Parent := nil;
*)
    // Disconnect search items
    page.Editor.SearchEngine := nil;
  end;

  if (Value >= 0) and (Value < FPages.Count) then
  begin
    page := EditorPage(Value);
(*
    page.Align := alClient;
    page.Parent := pnlPageControl;
    page.Visible := True;
    page.Editor.Repaint;
*)
    // Connect the search engine
    page.Editor.SearchEngine := SynEditSearch;

    PageControlEditor.ActivePageIndex := Value;

    // Focus the new editor now ...
    ActiveControl := page.Editor;
  end;
end;

procedure TFormScriptDebugger.UpdateTimerTimer(Sender: TObject);

{$ifdef DISABLED_STUFF}
  procedure UpdateFormCaption;
  begin
    if FHomePositionCaptionSuffix <> '' then
      Caption := Format('Home: %s', [FHomePositionCaptionSuffix])
    else
    if ProjectfileName = '' then
      Caption := '[No project]'
    else
      Caption := Format('%s  (%s)', [ExtractFileName(ProjectFilename), ExtractfileDir(ProjectFilename)]);
  end;
{$endif DISABLED_STUFF}

  procedure UpdateStatusBarPanels;
  resourcestring
    SModified  = 'Modified';
    SInsert    = 'Insert';
    SOverwrite = 'Overwrite';
    SReadOnly  = 'Read Only';
  const
    MacroRecorderStates: array[ TSynMacroState ] of string = (
      'Stopped', 'Recording', 'Playing', 'Paused');
  var
    ptCaret: TPoint;
    Editor: TSynEdit;
  begin
    Editor := CurrentEditor;
    if Editor <> nil then
    begin
      ptCaret := TPoint(Editor.CaretXY);
      if (ptCaret.X > 0) and (ptCaret.Y > 0) then
        StatusBar.Panels[0].Text := Format(' %6d:%3d ', [ptCaret.Y, ptCaret.X])
      else
        StatusBar.Panels[0].Text := '';

      if Editor.Modified then
        StatusBar.Panels[1].Text := SModified
      else
        StatusBar.Panels[1].Text := '';

      if Editor.ReadOnly then
        StatusBar.Panels[2].Text := SReadOnly
      else
        if Editor.InsertMode then
        begin
          if SynMacroRecorder.State <> msStopped then
            StatusBar.Panels[2].Text := UpperCase(MacroRecorderStates[SynMacroRecorder.State])
          else
            StatusBar.Panels[2].Text := SInsert
        end
        else
          StatusBar.Panels[2].Text := SOverwrite;
    end
    else
    begin
      StatusBar.Panels[0].Text := '';
      StatusBar.Panels[1].Text := '';
      StatusBar.Panels[2].Text := '';
    end;
  end;

begin
  UpdateStatusBarPanels;

{$ifdef DISABLED_STUFF}
  UpdateFormCaption;
{$endif DISABLED_STUFF}
end;

procedure TFormScriptDebugger.ShellListViewFileExplorerExecuteItem(Sender: TObject; APIDL: PItemIDList; var AHandled: Boolean);
var
  Filename: string;
begin
  AHandled := True;
  Filename := GetPidlName(APIDL);

  if (not FileIsOpenInEditor(Filename, True)) then
    EditorPageAddNew(Filename, True, True);
end;

procedure TFormScriptDebugger.ShowExecutableLines;
var
  I: Integer;
begin
  for I := 0 to EditorPageCount - 1 do
    EditorPage(I).ShowExecutableLines;
end;

procedure TFormScriptDebugger.SynCodeCompletionExecute(Kind: SynCompletionType;
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
  begin
    Proposal.Form.DoubleBuffered := True;
    Proposal.Resizeable := True;
  end;

  // use this handler only in case the kind is set to ctCode!
  Assert(Kind = ctCode);

  // get script program
  ScriptProgram := GetCompiledScript;
  if ScriptProgram = nil then
    Exit;

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

    Item := '\image{' + IntToStr(Ord(SuggestionCategory)) + '}';

    with CurrentEditor.Highlighter.KeywordAttribute do
      Item := Item + '\color{' + ColorToString(Foreground) + '}';

    case SuggestionCategory of
      scUnit:
        Item := Item + 'unit';
      scType:
        Item := Item + 'type';
      scClass:
        Item := Item + 'class';
      scRecord:
        Item := Item + 'record';
      scInterface:
        Item := Item + 'interface';
      scFunction:
        Item := Item + 'function';
      scProcedure:
        Item := Item + 'procedure';
      scMethod:
        Item := Item + 'method';
      scConstructor:
        Item := Item + 'constructor';
      scDestructor:
        Item := Item + 'destructor';
      scProperty:
        Item := Item + 'property';
      scEnum:
        Item := Item + 'enum';
      scElement:
        Item := Item + 'element';
      scParameter:
        Item := Item + 'param';
      scVariable:
        Item := Item + 'var';
      scConst:
        Item := Item + 'const';
      scReservedWord:
        Item := Item + 'reserved';
      scDelegate:
        Item := Item + 'delegate';
    end;

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
      n := PosEx(' : ', AddOn, n);
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
    Proposal.ItemList.AddObject(Item, TObject(pointer(Ord(SuggestionCategory))));
    Proposal.InsertList.AddObject(s, TObject(pointer(Ord(SuggestionCategory))));
  end;

  CanExecute := True;
end;

procedure TFormScriptDebugger.SynCodeCompletionShow(Sender: TObject);
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

procedure TFormScriptDebugger.SynParametersExecute(Kind: SynCompletionType;
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
          if not UnicodeSameText(Member.Name, methSym.Name) then
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
  ScriptProgram := GetCompiledScript;
  if ScriptProgram = nil then
    Exit;

  // check the proposal type
  if Sender is TSynCompletionProposal then
  begin
    Proposal := TSynCompletionProposal(Sender);
    Proposal.InsertList.Clear;
    Proposal.ItemList.Clear;
    ParameterInfoList := TStrings(Proposal.ItemList);

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

procedure TFormScriptDebugger.ListViewMessagesDblClick(Sender: TObject);
var
  sPos: PScriptPos;
begin
//  if (FProgram = nil) then
//    exit;

  if (ListViewMessages.Selected = nil) then
    Exit;

  sPos := PScriptPos(ListViewMessages.Selected.Data);

  if (sPos <> nil) then
    ViewScriptPos(sPos^);
end;

procedure TFormScriptDebugger.ListViewMessagesDeletion(Sender: TObject; Item: TListItem);
var
  ScriptPos: PScriptPos;
begin
  if (Item <> nil) and (Item.Data <> nil) then
  begin
    ScriptPos := PScriptPos(Item.Data);
    if (ScriptPos.SourceFile <> nil) then
      ScriptPos.SourceFile.DecRefCount;
    Dispose(ScriptPos);
    Item.Data := nil;
  end;
end;

procedure TFormScriptDebugger.ListViewMessagesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  s: string;
  i: integer;
begin
  if ((Key = VK_INSERT) and (Shift = [ssCtrl])) or ((Key = Ord('C')) and (Shift = [ssCtrl])) then
  begin
    s := '';
    for i := 0 to ListViewMessages.Items.Count-1 do
      if (ListViewMessages.Items[i].Selected) then
      begin
        if (s <> '') then
          s := s + #13;
        s := s + ListViewMessages.Items[i].Caption;
      end;
    Clipboard.AsText := s;
  end;
end;

procedure TFormScriptDebugger.ClearExecutableLines;
var
  I: Integer;
begin
  for I := 0 to EditorPageCount - 1 do
    EditorPage(I).ClearExecutableLines;
end;

procedure TFormScriptDebugger.ClearLinesChangedState;
var
  I: Integer;
begin
  for I := 0 to EditorPageCount - 1 do
    EditorPage(I).ClearLineChangeStates;
end;

procedure TFormScriptDebugger.EditorPageClose(AIndex: Integer);
var
  Page: TEditorPage;
begin
  Page := EditorPage(AIndex);

  if (Page = nil) then
    Exit;

  if (not Page.CanClose) then
    exit;

  if (not Page.CloseQuery) then
    exit;

  Page.Free;
end;

function TFormScriptDebugger.EditorPageCount: Integer;
begin
  Result := FPages.Count;
end;

function TFormScriptDebugger.EditorPage(AIndex: Integer): TEditorPage;
begin
  if (AIndex <> -1) and (AIndex < FPages.Count) then
    Result := FPages[AIndex]
  else
    Result := nil;
end;

function TFormScriptDebugger.EditorPageAddNew(const AName, AScript: string): IScriptDebugEditPage;
begin
  Result := EditorPageAddNew;

  if (AnsiSameText(ExtractFileExt(AName), sScriptFileType)) then
  begin
    Result.Caption := '';
    Result.FileName := AName;
  end else
    Result.Caption := AName;

  Result.Script := AScript;
end;

function TFormScriptDebugger.EditorPageAddNew(const ScriptProvider: IScriptProvider): IScriptDebugEditPage;
var
  EditorPage: TEditorPage;
  Page: TcxTabSheet;
  MenuLink: TdxBarPopupMenuLink;
  i: integer;
  UnitName: string;
  Filename: string;
const
  sScriptNewUnitNameTemplate = 'unit%d';
begin
  Page := TcxTabSheet.Create(Self);

  MenuLink := dxBarManager1.PopupMenuLinks.Add;
  MenuLink.Control := Page;
  MenuLink.PopupMenu := PopupMenuEditorTabs;

  EditorPage := TEditorPage.Create(Self, Page);
//  EditorPage.FileName := MSG_MainModule;
  i := 1;
  while (True) do
  begin
    UnitName := Format(sScriptNewUnitNameTemplate, [i]);
    if (NameToEditorPageIndex(UnitName) = -1) then
    begin
      EditorPage.FileName := UnitName + sScriptFileType;
      break;
    end;
    Inc(i);
  end;

  FPages.Add(EditorPage);

  Page.PageControl := PageControlEditor;

  ASSERT(FPages.Count = PageControlEditor.PageCount);

  SetEditorCurrentPageIndex(Page.TabIndex);

  Result := IScriptDebugEditPage(EditorPage);

  if (ScriptProvider <> nil) then
    try
      EditorPage.Caption := '';
      EditorPage.ScriptProvider := ScriptProvider;
    except
      Result := nil;
      EditorPage.Free;
      raise;
    end;

  if (ScriptProvider <> nil) then
  begin
    Filename := ScriptProvider.ScriptName;
    if (Filename <> '') then
    begin
      if (ExtractFileExt(Filename) <> sScriptFileType) then
        Filename := Filename + sScriptFileType;

      Filename := IncludeTrailingPathDelimiter(ScriptProvider.Folder) + Filename;

      AddRecentFile(Filename);
    end;
  end;
end;

function TFormScriptDebugger.OpenScriptStream(const Name: string; const CurrentScriptProvider: IScriptProvider): IScriptProvider;
var
  CompilerContext: IScriptContext;
  ContextFileSystems: IScriptContextFileSystems;
//  i: integer;
  Filename: string;
  FileSystem: IdwsFileSystem;
  ScriptFileSys: IScriptFileSystem;
  Stream: TStream;
begin
  CompilerContext := CreateCompilerContext(nil);

  ScriptFileSys := nil;
  ContextFileSystems := nil;
  try
    if (Supports(CompilerContext, IScriptContextFileSystems, ContextFileSystems)) then
    begin
      // Make paths relative to specified provider filesystem
      if (CurrentScriptProvider <> nil) then
      begin
        FileSystem := CurrentScriptProvider.CreateFileSystem;
        if (FileSystem = nil) or (not Supports(FileSystem, IScriptFileSystem, ScriptFileSys)) then
          ScriptFileSys := nil;

        TScriptFileSystemFactory(ContextFileSystems.CompilerFileSystem).SetRootFileSystem(ScriptFileSys);
        TScriptFileSystemFactory(ContextFileSystems.CompilerFileSystem).SetRoot(CurrentScriptProvider.Folder);
      end;
      FileSystem := ContextFileSystems.CompilerFileSystem.AllocateFileSystem
    end else
    begin
      ASSERT(FScript.Config.CompileFileSystem <> nil);
      FileSystem := FScript.Config.CompileFileSystem.AllocateFileSystem;
    end;

    Result := nil;
    Filename := Name;
  (*
    Filename := '';
    if (FScript.Config.ScriptPaths.Count = 0) then
    begin
      if (FileSystem.FileExists(Name)) then
        Filename := Name;
    end else
    begin
      for i := 0 to FScript.Config.ScriptPaths.Count-1 do
      begin
        Filename := FScript.Config.ScriptPaths[i];

        if (Filename <> '') then
          Filename := IncludeTrailingPathDelimiter(Filename) + Name
        else
          Filename := Name;

        if (FileSystem.FileExists(Filename)) then
          break
        else
          Filename := '';
      end;
    end;

    if (Filename <> '') then
    begin
  *)
      if (Supports(FileSystem, IScriptFileSystem, ScriptFileSys)) then
      begin

        Result := ScriptFileSys.OpenScriptProvider(Filename, True);

      end else
      begin
        try
          Stream := FileSystem.OpenFileStream(Filename, fomReadWrite);
        except
          Stream := FileSystem.OpenFileStream(Filename, fomFastSequentialRead);
        end;

        try
          Result := TStaticScriptProvider.Create(Name, Stream);
        finally
          Stream.Free;
        end;
      end;
  //  end;
  finally
    if (ScriptFileSys <> nil) then
      TScriptFileSystemFactory(ContextFileSystems.CompilerFileSystem).SetRootFileSystem(nil);
  end;
end;

function TFormScriptDebugger.EditorPageAddNew(const AFileName: TFileName; ALoadFile, AFileRequired: Boolean; const CurrentScriptProvider: IScriptProvider): IScriptDebugEditPage;
var
  EditorPage: TEditorPage;
  Filename: string;
  ScriptProvider: IScriptProvider;
begin
  if (AFileName = '') then
  begin
    MessageTaskDlgEx('Invalid operation', 'Filename required', mtWarning, [mbOK]);
    Result := nil;
    exit;
  end;

  if (ALoadFile) then
  begin
    if (ExtractFileExt(AFilename) <> sScriptFileType) then
      Filename := AFilename + sScriptFileType
    else
      Filename := AFilename;

    try
      ScriptProvider := OpenScriptStream(Filename, CurrentScriptProvider);

      if (ScriptProvider = nil) then
      begin
        if (not AFileRequired) then
          exit;

        MessageTaskDlgEx('File not found', Filename, mtWarning, [mbOK]);
        Result := nil;
        exit;
      end;
    except
      on E: Exception do
      begin
        MessageTaskDlgEx('Failed to load file', AFilename + '|' + E.Message, mtWarning, [mbOK]);
        Result := nil;
        exit;
      end;
    end;
  end else
    ScriptProvider := nil;

  Result := EditorPageAddNew(ScriptProvider);

  EditorPage := TEditorPage(Result);
  try

    EditorPage.Caption := '';
    EditorPage.FileName := AFilename;

  except
    Result := nil;
    EditorPage.Free;
    raise;
  end;

  AddRecentFile(Filename);
end;

procedure TFormScriptDebugger.ActionFileSaveProjectAsExecute(Sender: TObject);
begin
{$ifdef DISABLED_STUFF}
  SaveProjectAs;
{$endif DISABLED_STUFF}
end;

procedure TFormScriptDebugger.ActionViewASTExecute(Sender: TObject);
begin
  DockPanelAST.Visible := TAction(Sender).Checked;
end;

procedure TFormScriptDebugger.ActionViewASTUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := DockPanelAST.Visible;
end;

procedure TFormScriptDebugger.ActionViewBreakpointsExecute(Sender: TObject);
begin
  DockPanelBreakProints.Visible := TAction(Sender).Checked;
end;

procedure TFormScriptDebugger.ActionViewBreakpointsUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := DockPanelBreakProints.Visible;
end;

procedure TFormScriptDebugger.ActionViewCallStackExecute(Sender: TObject);
begin
  DockPanelCallStack.Visible := TAction(Sender).Checked;
end;

procedure TFormScriptDebugger.ActionViewCallStackUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := DockPanelCallStack.Visible;
end;

procedure TFormScriptDebugger.ActionViewFileExplorerExecute(Sender: TObject);
begin
  DockPanelFileExplorer.Visible := TAction(Sender).Checked;
end;

procedure TFormScriptDebugger.ActionViewFileExplorerUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := DockPanelFileExplorer.Visible;
end;

procedure TFormScriptDebugger.ActionViewLocalsExecute(Sender: TObject);
begin
  DockPanelLocalVars.Visible := TAction(Sender).Checked;
end;

procedure TFormScriptDebugger.ActionViewLocalsUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := DockPanelLocalVars.Visible;
end;

procedure TFormScriptDebugger.ActionViewMessagesExecute(Sender: TObject);
begin
  DockPanelMessages.Visible := TAction(Sender).Checked;
end;

procedure TFormScriptDebugger.ActionViewMessagesUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := DockPanelMessages.Visible;
end;

procedure TFormScriptDebugger.ActionViewOutputExecute(Sender: TObject);
begin
  DockPanelOutput.Visible := TAction(Sender).Checked;
end;

procedure TFormScriptDebugger.ActionViewOutputUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := DockPanelOutput.Visible;
end;

procedure TFormScriptDebugger.ActionViewProjectSourceExecute(Sender: TObject);
{$ifdef DISABLED_STUFF}
var
  I: Integer;
{$endif DISABLED_STUFF}
begin
{$ifdef DISABLED_STUFF}
  I := ProjectSourceFileIndex;
  if I >= 0 then
    EditorCurrentPageIndex := I
  else
    EditorPageAddNew(ProjectfileNameToProjectSourceFileName(ProjectFileName), True);
{$endif DISABLED_STUFF}
end;

procedure TFormScriptDebugger.ActionViewProjectSourceUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := False;//(ProjectFileName <> '');
end;

procedure TFormScriptDebugger.ActionFileNewProjectExecute(Sender: TObject);
{$ifdef DISABLED_STUFF}
var
  sFileName: TFileName;
{$endif DISABLED_STUFF}
begin
{$ifdef DISABLED_STUFF}
  sFileName := Format('%sProject1%s',
    [IncludeTrailingBackslash(FScriptFolder), sDwsIdeProjectFileExt]);
  sFileName := ModifyFileNameToUniqueInProject(sFileName);

  NewProjectFile(sFileName);

  sFileName := ProjectfileNameToProjectSourceFileName(sFileName);
  EditorPageAddNew(sFileName, False);
{$endif DISABLED_STUFF}
end;

procedure TFormScriptDebugger.ActionFileOpenProjectExecute(Sender: TObject);
begin
{$ifdef DISABLED_STUFF}
  if OpenProjectDialog.Execute then
    LoadProjectfile(OpenProjectDialog.FileName);
{$endif DISABLED_STUFF}
end;

{$ifdef DISABLED_STUFF}
function TFormScriptDebugger.ProjectfileNameToProjectSourceFileName(const AProjectfileName: TFileName): string;
begin
  if AProjectFileName = '' then
    Result := ''
  else
    Result := ChangeFileExt(AProjectFileName, sDwsIdeProjectSourceFileExt);
end;

procedure TFormScriptDebugger.SetProjectSourceFileName(const Value: TFileName);
var
  I: Integer;
begin
  I := ProjectSourceFileIndex;
  if I >= 0 then
  begin
    EditorPage(I).FileName := Value;
    FPages[i].Caption := ChangeFileExt(ExtractFileName(Value), '') + ' *' ;
  end;
end;

procedure TFormScriptDebugger.SetProjectFileName(const Value: TFileName);
begin
  if FileExists(Value) then
  begin
    FProjectFileName := Value;
    LoadProjectFile(FProjectFileName);
  end
  else
    FProjectFileName := '';
end;

function TFormScriptDebugger.FileIsProjectSource(const AFileName: TFileName): Boolean;
begin
  Result := SameText(ExtractFileExt(AFileName), sDwsIdeProjectSourceFileExt);
end;

function TFormScriptDebugger.GetProjectSourceFileName: TFileName;
var
  I: Integer;
begin
  I := ProjectSourceFileIndex;
  if I >= 0 then
    Result := EditorPage(I).FileName
  else
    Result := '';
end;

function TFormScriptDebugger.ProjectSourceScript: string;
var
  sFileName: TFileName;
begin
  EditorSaveAllIfModified(False);
  sFileName := ProjectSourceFileName;
  if FileExists(sFileName) then
    Result := LoadTextFromFile(sFileName)
  else
     Result := '';
end;

function TFormScriptDebugger.ProjectSourceFileIndex: Integer;
var
  S: string;
begin
  S := ExtractFileName(ProjectfileNameToProjectSourceFileName(ProjectFileName));
  Result := EditorPageCount - 1;
  while (Result >= 0) do
  begin
    if AnsiSameText(S, ExtractFileName(EditorPage(Result).FileName)) then
      break;
    dec(Result);
  end;
end;

function TFormScriptDebugger.HasProject: Boolean;
begin
  Result := (ProjectFileName <> '') and ((ProjectSourceFileIndex <> -1) or FileExists(ProjectSourceFileName));
end;

function TFormScriptDebugger.SaveProjectAs: Boolean;
var
  sFilename: TFileName;
begin
  SaveProjectDialog.FileName := ExtractFileName(FProjectFileName);
  Result := SaveProjectDialog.Execute;
  if Result then
  begin
    sFilename := SaveProjectDialog.FileName;
    ProjectSourceFileName := ProjectfileNameToProjectSourceFileName(SaveProjectDialog.FileName);
    SaveProjectFileAs(sFileName);
  end;
end;

procedure TFormScriptDebugger.MakeSettingsRec;
begin
  FIDESettingsRec.FormRect := BoundsRect;
end;

procedure TFormScriptDebugger.SaveProjectFileAs(const AProjectFileName: TFileName);

  procedure SaveBreakpoints(AData: IXMLProjectConfigType);
  var
    I: Integer;
    Breakpoint: IXMLBreakpointType;
  begin
    AData.Breakpoints.Clear;
    for I := 0 to Debugger.Breakpoints.Count - 1 do
    begin
      Breakpoint := AData.Breakpoints.Add;
      Breakpoint.SourceName := Debugger.Breakpoints[I].SourceName;
      Breakpoint.LineNum := Debugger.Breakpoints[I].Line;
      Breakpoint.Enabled := Debugger.Breakpoints[I].Enabled;
    end;
  end;

  procedure SaveWatches(AData: IXMLProjectConfigType);
  var
    I: Integer;
    Watch: IXMLWatchType;
  begin
    AData.Watches.Clear;
    for I := 0 to Debugger.Watches.Count - 1 do
    begin
      Watch := AData.Watches.Add;
      Watch.Expression := Debugger.Watches[I].ExpressionText;
    end;
  end;

var
  I: Integer;
  XMLPage: IXMLEditorPageType;
  XMLDocument: IXMLDocument;
  Data: IXMLProjectConfigType;
  Page: TEditorPage;
  S: string;
begin
  XMLDocument := NewXMLDocument;
  Data := XMLDocument.GetDocBinding('ProjectConfig', TXMLProjectConfigType) as IXMLProjectConfigType;

  // Make an empty Document source file if required
  S := ProjectfileNameToProjectSourceFileName(AProjectFilename);
  if not FileExists(S) then
    SaveTextToUTF8File(S, '');

  for I := 0 to EditorPageCount - 1 do
  begin
    Page := EditorPage(I);

    if (Page.Modified) then
      SavePage(Page);

    XMLPage := Data.EditorPages.EditorPage.Add;

    XMLPage.FileName := ExtractRelativePath(
      IncludeTrailingBackslash(FScriptFolder),
      Page.FileName);
    XMLPage.Name := JustFileName(Page.FileName);
  end;

  Data.EditorPages.ActivePageIndex := EditorCurrentPageIndex;

  SaveBreakpoints(Data);
  SaveWatches(Data);

  XMLDocument.XML.Text := FormatXMLData(XMLDocument.XML.Text);
  XMLDocument.Active := True;

  XMLDocument.SaveToFile(AProjectFileName);

  FProjectFileName := AProjectFileName;
end;

procedure TFormScriptDebugger.LoadProjectFile(const AProjectFileName: TFileName);

  procedure LoadBreakpoints(AData: IXMLProjectConfigType);
  var
    I, iEditorPage: Integer;
    Breakpoint: IXMLBreakpointType;
  begin
    Debugger.Breakpoints.Clean;
    for I := 0 to AData.Breakpoints.Count - 1 do
    begin
      Breakpoint := AData.Breakpoints[I];

      iEditorPage := NameToEditorPageIndex(Breakpoint.SourceName);
      if iEditorPage <> -1 then
        if (BreakPoint.LineNum >= 1) then
          if BreakPoint.LineNum <= EditorPage(iEditorPage).FEditor.Lines.Count then
          begin
            Debugger.Breakpoints.Add(Breakpoint.LineNum, Breakpoint.SourceName);
            Debugger.Breakpoints[I].Enabled := Breakpoint.Enabled;
          end;
    end;
  end;

  procedure LoadWatches(AData: IXMLProjectConfigType);
  var
    I: Integer;
    Watch: IXMLWatchType;
  begin
    Debugger.Watches.Clean;
    for I := 0 to AData.Watches.Count - 1 do
    begin
      Watch := AData.Watches[I];
      Debugger.Watches.Add(Watch.Expression);
    end;

    NotifyDebuggerFrames(dnUpdateWatches);
  end;

var
  I: Integer;
  sFileName: TFileName;
  XMLDocument: IXMLDocument;
  Data: IXMLProjectConfigType;
begin
  if not FileExists(AProjectFileName) then
    raise EDwsIde.CreateFmt(RStrProjectFileDoesNotExist, [AProjectFileName]);

  if (not EditorPagesCloseQuery) then
    exit;
  EditorPagesCloseAll;

  ClearOutputWindow;
  ClearMessagesWindow;

  FProjectFileName := AProjectFileName;

  FProgram := nil;

  XMLDocument := LoadXMLDocument(AProjectFileName);
  Data := XMLDocument.GetDocBinding('ProjectConfig', TXMLProjectConfigType) as IXMLProjectConfigType;
  for I := 0 to Data.EditorPages.EditorPage.Count - 1 do
  begin
    sFileName := IncludeTrailingBackslash(FScriptFolder) + Data.EditorPages.EditorPage[I].FileName;
    if FileExists(sFileName) and not FileIsOpenInEditor(sFileName) then
      EditorPageAddNew(sFileName, True);
  end;
  EditorCurrentPageIndex := Data.EditorPages.ActivePageIndex;

  LoadBreakpoints(Data);
  LoadWatches(Data);

  ClearExecutableLines;
end;

procedure TFormScriptDebugger.NewProjectFile(const AProjectFileName: TFileName);
begin
  if (not EditorPagesCloseQuery) then
    exit;
  EditorPagesCloseAll;

  ClearOutputWindow;
  ClearMessagesWindow;

  FProjectFileName := AProjectFileName;
end;

{$endif DISABLED_STUFF}

function TFormScriptDebugger.OpenEditorPage(const AName: string; FileMustExist: boolean; const CurrentScriptProvider: IScriptProvider): Boolean;
var
  I: Integer;
  S: string;
begin
  I := NameToEditorPageIndex(AName);
  if (I = -1) and (AName = MSG_MainModule) and (FMainUnitName <> '') then
    I := NameToEditorPageIndex(FMainUnitName);

  Result := I <> -1;

  if Result then
    EditorCurrentPageIndex := I
  else
  begin
//    S := ChangeFileExt(AName, sDwsIdeProjectSourceFileExt2);
//    Result := (EditorPageAddNew(S, True) <> nil);
    if (AnsiSameText(ExtractFileExt(AName), sScriptFileType)) then
      S := AName
    else
      S := AName + sScriptFileType;
    Result := (EditorPageAddNew(S, True, FileMustExist, CurrentScriptProvider) <> nil);
  end;
end;

procedure TFormScriptDebugger.PageControlEditorCanCloseEx(Sender: TObject; ATabIndex: Integer; var ACanClose: Boolean);
begin
  EditorPageClose(ATabIndex);

  // We have already closed (free'd) the tab (or chosen not to)
  ACanClose := False;
end;

procedure TFormScriptDebugger.PageControlEditorContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
var
  Index: integer;
begin
  Index := TcxPageControl(Sender).IndexOfTabAt(MousePos.X, MousePos.Y);
  if (Index >= 0) then
    TcxPageControl(Sender).ActivePageIndex := Index
  else
    Handled := True;
end;

procedure TFormScriptDebugger.PageControlEditorDrawTabEx(AControl: TcxCustomTabControl; ATab: TcxTab; Font: TFont);
var
  Page: TEditorPage;
begin
  if (ATab.Index = cxPCNewButtonIndex) then
    exit;

  Page := EditorPage(ATab.Index);
  if (Page <> nil) and (Page.Modified) then
    Font.Style := Font.Style + [fsBold];
end;

procedure TFormScriptDebugger.PageControlEditorGetImageIndex(Sender: TObject; TabIndex: Integer; var ImageIndex: Integer);
var
  EditorPage: TEditorPage;
begin
  if (TabIndex = cxPCNewButtonIndex) then
  begin
    ImageIndex := 7;
    exit;
  end;

  EditorPage := MainUnit;
  if (EditorPage <> nil) and (EditorPage.Index = TabIndex) then
  begin
    if (FMainUnit <> nil) then
      ImageIndex := 69
    else
      ImageIndex := 6;
  end else
    ImageIndex := -1;
end;

procedure TFormScriptDebugger.PageControlEditorMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Index: integer;
begin
  if (ssDouble in Shift) then
  begin
    Index := PageControlEditor.ViewInfo.IndexOfTabAt(X, Y);
    if (Index >= 0) then
      MainUnit := EditorPage(Index);
  end;
end;

procedure TFormScriptDebugger.PageControlEditorNewTabButtonClick(Sender: TObject; var AHandled: Boolean);
begin
  AHandled := True;
  ActionFileNewUnit.Execute;
end;

function TFormScriptDebugger.MainUnitName: string;
var
  EditorPage: TEditorPage;
begin
  Result := FMainUnitName;
  if (Result = '') then
  begin
    EditorPage := MainUnit;
    if (EditorPage <> nil) then
      Result := EditorPage.UnitName;

    if (Result = '') then
      Result := SYS_MainModule;
  end;
end;

function TFormScriptDebugger.ModifyFileNameToUniqueInProject(const AFileName: TFileName): string;
// if exists, increments any trailing number after the file name
// until the name is unique in the name's folder. if no trailing number
// adds '1'.
var
  I: Integer;
  sD, sF, sE: string;
begin
  Result := AFileName;
  I := 0;
  while FileIsOpenInEditor(Result) do
  begin
    Inc(I);
    sD := ExtractFileDir(Result) + '\';
    sF := JustFileName(Result);
    while (sF <> '') and CharInSet(sF[Length(sF) - 1], ['0'..'9']) do
      Delete(sF, Length(sF) - 1, 1);

    sE := ExtractFileExt(Result);
    Result := sD + sF + IntToStr(I) + sE;
  end;
end;

function TFormScriptDebugger.GetEditorCurrentPageIndex: Integer;
begin
  Result := PageControlEditor.ActivePageIndex;
  if (Result >= FPages.Count) then
    Result := -1;
end;

function TFormScriptDebugger.GetExecutableLines(const AUnitName: string): TLineNumbers;
// Returns the executable line numbers for this unit.

  procedure AppendLineNum(ALineNum: Integer);
  begin
    SetLength(Result, Length(Result) + 1);
    Result[Length(Result) - 1] := ALineNum;
  end;

var
  I: Integer;
  Breakpointables: TdwsBreakpointableLines;
  Lines: Tbits;
begin
  SetLength(Result, 0);

  Compile(False);
  if not IsCompiled then
    Exit;

  Breakpointables := TdwsBreakpointableLines.Create(FProgram);
  try
    Lines := Breakpointables.SourceLines[ AUnitName ];
    if Lines <> nil then
    begin
      for I := 1 to Lines.Size - 1 do
        if Lines[I] then
          AppendLineNum(I);
    end;
  finally
    Breakpointables.Free;
  end;
end;

function TFormScriptDebugger.GetGotoForm: TDwsIdeGotoLineNumber;
begin
  if not Assigned(FGotoForm) then
    FGotoForm := TDwsIdeGotoLineNumber.Create(Self);

  Result := FGotoForm;
end;

{$REGION 'Action Handler'}
procedure TFormScriptDebugger.ActionGotoLineNumberExecute(Sender: TObject);
begin
  CurrentEditorPage.GotoLineNumber;
end;

procedure TFormScriptDebugger.ActionGotoLineNumberUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (CurrentEditor <> nil);
end;

procedure TFormScriptDebugger.ActionBuildExecute(Sender: TObject);
begin
  Compile(True);
  if IsCompiled then
    ShowExecutableLines;
end;

procedure TFormScriptDebugger.ActionBuildUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := HasEditorPage and (Debugger.State in [dsIdle, dsDebugDone]);
end;

procedure TFormScriptDebugger.ActionClearAllBreakpointsExecute(Sender: TObject);
begin
  ClearAllBreakpoints;
end;

procedure TFormScriptDebugger.ActionEditClearOutputWindowExecute(Sender: TObject);
begin
  ClearOutputWindow;
end;

procedure TFormScriptDebugger.ActionEditClearOutputWindowUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (MemoOutputWindow.Text <> '');
end;

procedure TFormScriptDebugger.ActionEditCopyToClipboardExecute(Sender: TObject);
begin
  CurrentEditor.CopyToClipboard;
end;

procedure TFormScriptDebugger.ActionEditCopyToClipboardUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (CurrentEditor <> nil) and (CurrentEditor.SelAvail);
end;

procedure TFormScriptDebugger.ActionEditCutExecute(Sender: TObject);
begin
  CurrentEditor.CutToClipboard;
end;

procedure TFormScriptDebugger.ActionEditCutUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (CurrentEditor <> nil) and (not CurrentEditor.ReadOnly) and (CurrentEditor.SelAvail);
end;

procedure TFormScriptDebugger.ActionEditDeleteExecute(Sender: TObject);
begin
  CurrentEditor.SelText := '';
end;

procedure TFormScriptDebugger.ActionEditDeleteUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (CurrentEditor <> nil) and (not CurrentEditor.ReadOnly) and (CurrentEditor.SelAvail);
end;

procedure TFormScriptDebugger.ActionEditPasteExecute(Sender: TObject);
begin
  CurrentEditor.PasteFromClipboard;
end;

procedure TFormScriptDebugger.ActionEditPasteUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (CurrentEditor <> nil) and (not CurrentEditor.ReadOnly) and (CurrentEditor.CanPaste);
end;

procedure TFormScriptDebugger.ActionEditSelectAllExecute(Sender: TObject);
begin
  CurrentEditor.SelectAll;
end;

procedure TFormScriptDebugger.ActionEditSelectAllUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (CurrentEditor <> nil);
end;

procedure TFormScriptDebugger.ActionCloseAllOtherPagesExecute(Sender: TObject);
begin
  if (not EditorPagesCloseQuery(EditorCurrentPageIndex)) then
    exit;
  EditorPagesCloseAll(EditorCurrentPageIndex);
end;

procedure TFormScriptDebugger.ActionCloseAllOtherPagesUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (EditorPageCount > 1);
end;

procedure TFormScriptDebugger.ActionExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TFormScriptDebugger.ActionClosePageExecute(Sender: TObject);
begin
  EditorPageClose(EditorCurrentPageIndex);
end;

procedure TFormScriptDebugger.ActionClosePageUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (EditorCurrentPageIndex <> -1) and (CurrentEditorPage.CanClose);
end;

procedure TFormScriptDebugger.ActionDebugBreakOnPoopExecute(Sender: TObject);
begin
  Debugger.SuspendOnException := TAction(Sender).Checked;
end;

procedure TFormScriptDebugger.ActionDebugEvaluateExecute(Sender: TObject);
var
  Expression: string;
  ScriptProgram: IdwsProgram;
  CursorPos: TBufferCoord;
  ScriptPos: TScriptPos;
  SourceItem: TScriptSourceItem;
  Symbol: TSymbol;
begin
  ScriptProgram := GetCompiledScript;
  if (ScriptProgram = nil) then
    Exit;

  if (CurrentEditor.SelAvail) then
    Expression := CurrentEditor.SelText
  else
    Expression := '';

  ScriptPos := cNullPos;

  if (Expression = '') then
  begin
    CursorPos := CurrentEditorPage.Editor.CaretXY;
    CursorPos := CurrentEditorPage.Editor.WordStartEx(CursorPos);

    Expression := '';

    SourceItem := ScriptProgram.SourceList.FindScriptSourceItem(CurrentEditorPage.GetFilename);
    if (SourceItem = nil) and (CurrentEditorPage.IsMainUnit) then
      SourceItem := ScriptProgram.SourceList.MainScript;
    if (SourceItem <> nil) then
    begin

      ScriptPos := TScriptPos.Create(SourceItem.SourceFile, CursorPos.Line, CursorPos.Char);

      Symbol := ScriptProgram.SymbolDictionary.FindSymbolAtPosition(ScriptPos);

      if (Symbol <> nil) then
        Expression := Symbol.QualifiedName;
    end;
  end;

  if (Expression = '') then
    Expression := CurrentEditorPage.Editor.WordAtCursor;

  Evaluate(Expression, @ScriptPos);
end;

procedure TFormScriptDebugger.ActionDebugEvaluateUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := ActionDebug.Visible;
end;

procedure TFormScriptDebugger.ActionDebugExecute(Sender: TObject);
begin
//
end;

procedure TFormScriptDebugger.ActionDebugLiveObjectsExecute(Sender: TObject);
var
  ScriptObjInstance: TScriptObjInstance;
  ScriptObj: IScriptObj;
  Obj: TScriptObj;
  Count: integer;
  s, List: string;
begin
  ScriptObjInstance := TScriptObjInstance.Create(Debugger.Execution.Info.SystemTable.TypTObject, TdwsProgramExecution(Debugger.Execution));
  ScriptObj := ScriptObjInstance; // Used to keep object alive while we iterate the list
  Obj := ScriptObjInstance;

  // Make sure we're at start of the linked list
  while (Obj.PrevObject <> nil) do
    Obj := Obj.PrevObject;

  Count := 0;
  List := '';
  while (Obj <> nil) do
  begin
    if (Obj <> ScriptObjInstance) and (Supports(Obj, IScriptObj, ScriptObj)) and (ScriptObj.ClassSym <> nil) then
    begin
      Inc(Count);
      s := Format('%.2d : %s (%d references)', [Count, ScriptObj.ClassSym.Name, Obj.RefCount-1]);
      if (ScriptObj.Destroyed) then
        s := s + ' (destroyed)';
      if (List <> '') then
        List := List + #13;
      List := List + s;
    end;
    Obj := Obj.NextObject;
  end;

  if (List <> '') then
    MessageTaskDlgEx('Live objects', List, mtInformation, [mbOK])
  else
    MessageTaskDlgEx('Live objects', 'No live objects.', mtInformation, [mbOK]);
end;

procedure TFormScriptDebugger.ActionFileCloseAllExecute(Sender: TObject);
begin
  if (not EditorPagesCloseQuery) then
    exit;
  EditorPagesCloseAll;
{$ifdef DISABLED_STUFF}
  ProjectFileName := '';
{$endif DISABLED_STUFF}
end;

procedure TFormScriptDebugger.ActionFileCloseAllUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (FPages.Count > 1) or ((FPages.Count = 1) and (EditorCurrentPageIndex <> -1) and (CurrentEditorPage.CanClose));
end;

procedure TFormScriptDebugger.ActionFileMainUnitExecute(Sender: TObject);
begin
  MainUnit := CurrentEditorPage;
end;

procedure TFormScriptDebugger.ActionFileMainUnitUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (EditorCurrentPageIndex <> -1) and (Debugger.State in [dsIdle, dsDebugDone]);
  TAction(Sender).Checked := (FMainUnit <> nil) and (CurrentEditorPage = MainUnit);
end;

procedure TFormScriptDebugger.ActionFileNewIncludeFileExecute(Sender: TObject);
var
  sFileName: TFileName;
begin
  sFileName := 'IncludeFile1.inc';
  sFileName := ModifyFileNameToUniqueInProject(sFileName);

  EditorPageAddNew(sFileName, False);
end;

procedure TFormScriptDebugger.ActionFileNewUnitExecute(Sender: TObject);
begin
  EditorPageAddNew;
end;

procedure TFormScriptDebugger.ActionFileSaveAsAttachmentExecute(Sender: TObject);
var
  Name: string;
  Attachment: IScriptHostFile;
  Stream: TStream;
begin
  if not HasEditorPage then
    exit;

  Name := TPath.GetFileName(CurrentEditorPage.FileName);

  while (True) do
  begin
    if (not InputQueryEx('Save as attachment', 'Enter attachment name:', Name)) then
      exit;

    if (Name = '') then
      continue;

    if (ScriptHostApplication.ActiveDocument.Files.TryGetFile(Name, Attachment)) then
    begin
      MessageDlgEx('Duplicate attachment name.'#13#13'Please enter a unique name.', mtWarning, [mbOK], -1);
      continue;
    end;

    Attachment := nil;
    try
      Attachment := ScriptHostApplication.ActiveDocument.Files.Add(Name, Name);

      Stream := TDocumentAttachmentStream.Create(Attachment);
      try
        Stream.Size := 0;
        CurrentEditorPage.SaveToStream(Stream);
      finally
        Stream.Free;
      end;

      ScriptHostApplication.ActiveDocument.Changed;
    except
      if (Attachment <> nil) then
        ScriptHostApplication.ActiveDocument.Files.Remove(Attachment);
      raise;
    end;
    break;
  end;
end;

procedure TFormScriptDebugger.ActionFileSaveAsAttachmentUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (ScriptHostApplication <> nil) and (ScriptHostApplication.ActiveDocument <> nil) and (ScriptHostApplication.ActiveDocument.AllowEdit);
end;

procedure TFormScriptDebugger.ActionFileSaveAsFileExecute(Sender: TObject);
begin
  if HasEditorPage then
    CurrentEditorPage._SaveAs;
//    SavePage(CurrentEditorPage); // SaveAs...
end;

procedure TFormScriptDebugger.ActionFileSaveAsFileUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := HasEditorPage;
end;

procedure TFormScriptDebugger.ActionFileSaveExecute(Sender: TObject);
begin
  if HasEditorPage then
    SavePage(CurrentEditorPage);
end;

procedure TFormScriptDebugger.ActionFileSaveUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := HasEditorPage and CurrentEditor.Modified;
end;

procedure TFormScriptDebugger.ActionGotoDeclarationExecute(Sender: TObject);
begin
  CurrentEditorPage.FindDeclaration(CurrentEditor.CaretXY, suDeclaration);
end;

procedure TFormScriptDebugger.ActionGenericUpdateHasEditor(Sender: TObject);
begin
  TAction(Sender).Enabled := HasEditorPage;
end;

procedure TFormScriptDebugger.ActionGotoImplementationExecute(Sender: TObject);
begin
  CurrentEditorPage.FindDeclaration(CurrentEditor.CaretXY, suImplementation);
end;

procedure TFormScriptDebugger.ActionGotoHomePositionExecute(Sender: TObject);
begin
  GotoHomePosition;
end;

procedure TFormScriptDebugger.ActionGotoHomePositionUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := CanGotoHomePosition;
end;

procedure TFormScriptDebugger.ActionOpenFileExecute(Sender: TObject);
var
  Filename: TFileName;
  i: Integer;
begin
  if (CurrentEditorPage <> nil) then
  begin
    if (CurrentEditorPage.ScriptProvider <> nil) then
      Filename := CurrentEditorPage.ScriptProvider.Folder
    else
      Filename := TPath.GetDirectoryName(CurrentEditorPage.Filename);

    if (Filename = '') and (MainUnit <> nil) and (MainUnit.ScriptProvider <> nil) then
      Filename := MainUnit.ScriptProvider.Folder;

    if (Filename <> '') then
      OpenFileDialog.DefaultFolder := Filename
    else
      OpenFileDialog.DefaultFolder := ScriptSettings.Folders.FolderScript;
  end else
    OpenFileDialog.DefaultFolder := ScriptSettings.Folders.FolderScript;

  if (not OpenFileDialog.Execute) then
    Exit;

  ScriptSettings.Folders.FolderScript := TPath.GetDirectoryName(OpenFileDialog.FileName);

  for i := 0 to OpenFileDialog.Files.Count - 1 do
  begin
    Filename := OpenFileDialog.Files[i];
    if (Filename <> '') and (not FileIsOpenInEditor(Filename)) then
      EditorPageAddNew(Filename, True);
  end;
end;

procedure TFormScriptDebugger.ActionProgramResetExecute(Sender: TObject);
begin
  ResetProgram;
  AddMessage('Program aborted', mkInfo);
end;

procedure TFormScriptDebugger.ActionProgramResetUpdate(Sender: TObject);
begin
  // Cannot reset while modal dialog is visible
  TAction(Sender).Enabled := (daCanEndDebug in Debugger.AllowedActions);// and (Application.ModalLevel = 0);
end;

function TFormScriptDebugger.BeginDebug: Boolean;
var
  Exec: IdwsProgramExecution;
begin
  Result := False;

  ClearMessagesWindow;
  FPendingExceptionMsg := '';

  Compile(False);
  if not IsCompiled then
    Exit;

  ShowExecutableLines;

  AddStatusMessage(RStrRunning);

  Exec := FProgram.CreateNewExecution;
  Exec.Environment := Environment;

  AddMessage('Running program in debugger', mkInfo);

  TdwsProgramExecution(Exec).OnExecutionStarted := DoOnExecutionStarted;
  TdwsProgramExecution(Exec).OnExecutionEnded := DoOnExecutionEnded;

  Result := True;

  Debugger.AttachDebug(Exec);
  try
    // Switch to debug layout
    BarComboLayout.Text := ScriptSettings.Layout.DebugLayout;

    Exec.Debugger := Debugger;
    FIntializationFinalizationMode := True;
    FExecutingIntialization := True;
    try

      FDebugStopwatch := TStopwatch.Create;
      FDebugStopwatch.Start;

      Exec.BeginProgram;
      Exec.RunProgram(0);

    finally
      FExecutingIntialization := False;
    end;

  except
    FIntializationFinalizationMode := False;
    Debugger.DetachDebug;
    raise;
  end;

  // Terminate if Halt() was called
  if (Exec.ExecutionObject.Status = esrExit) then
    EndDebug;
end;

type
  TScriptLeakCheck = class(TNoResultExpr)
  private
    FExecution: TdwsProgramExecution;
  public
    procedure EvalNoResult(exec : TdwsExecution); override;

    constructor Create(AExecution: TdwsProgramExecution);
  end;

constructor TScriptLeakCheck.Create(AExecution: TdwsProgramExecution);
begin
  FExecution := AExecution;
end;

procedure TScriptLeakCheck.EvalNoResult(exec: TdwsExecution);
var
  ScriptObjInstance: TScriptObjInstance;
  ScriptObj: IScriptObj;
  Obj: TScriptObj;
  Count: integer;
  s, List: string;
begin
  ScriptObjInstance := TScriptObjInstance.Create(FExecution.ProgramInfo.SystemTable.TypTObject, FExecution);
  ScriptObj := ScriptObjInstance; // Used to keep object alive while we iterate the list
  Obj := ScriptObjInstance;

  // Make sure we're at start of the linked list
  while (Obj.PrevObject <> nil) do
    Obj := Obj.PrevObject;

  Count := 0;
  List := #13;
  while (Obj <> nil) do
  begin
    if (Obj <> ScriptObjInstance) and (Supports(Obj, IScriptObj, ScriptObj)) and (ScriptObj.ClassSym <> nil) then
    begin
      Inc(Count);
      s := Format('%.2d : %s', [Count, ScriptObj.ClassSym.Name]);
      if (ScriptObj.Destroyed) then
        s := s + ' (destroyed)';
      List := List + #13 + s;
    end;
    Obj := Obj.NextObject;
  end;
  if (Count > 0) then
    MessageTaskDlgEx('Script terminated with live objects', 'The following script objects were still being kept alive after finalization:'+List, mtInformation, [mbOK]);
end;

function TFormScriptDebugger.EndDebug: Boolean;
var
  Exec: IdwsProgramExecution;
  s: string;
{$ifdef LEAK_CHECK}
  LeakCheck: TScriptLeakCheck;
  LeakCheckIndex: integer;
{$endif LEAK_CHECK}
begin
  Result := False;

  if (not FIntializationFinalizationMode) then
    exit;

  FIntializationFinalizationMode := False;
  Exec := Debugger.Execution;

  AddMessage('Finalizing', mkInfo);

  Result := True;

  // Add leak checker
{$ifdef LEAK_CHECK}
  if (Exec.Prog.ProgramObject.FinalExpr <> nil) then
  begin
    LeakCheckIndex := Exec.Prog.ProgramObject.FinalExpr.StatementCount
    LeakCheck := TScriptLeakCheck.Create(TdwsProgramExecution(Exec));
  end else
    LeakCheck := nil;
  try
    if (Exec.Prog.ProgramObject.FinalExpr <> nil) then
      Exec.Prog.ProgramObject.FinalExpr.AddStatement(LeakCheck);
    try
{$endif LEAK_CHECK}
      try
        Exec.EndProgram;

        FDebugStopwatch.Stop;
      finally
        Debugger.DetachDebug;
      end;

{$ifdef LEAK_CHECK}
    finally
      if (LeakCheck <> nil) then
        Exec.Prog.ProgramObject.FinalExpr.ExtractStatement(LeakCheckIndex);
    end;
  finally
    LeakCheck.Free;
  end;
{$endif LEAK_CHECK}

  AddMessageInfo(Exec.Msgs);
  if Exec.Msgs.HasErrors then
  begin
    if (Exec.Msgs[Exec.Msgs.Count-1].Text = RTE_ScriptStopped) then
    begin
      AddMessage('Program was reset', mkInfo);
      AddStatusMessage('Terminated');
    end else
    begin
      AddMessage('Program terminated with errors', mkWarning);
      AddStatusMessage(RStrErrors);
      ViewScriptPos(Exec.Msgs.LastMessagePos);
      ErrorDlg(Exec.Msgs.AsInfo);
    end;
  end else
  begin
    if FDebugStopwatch.Elapsed.TotalSeconds < 1.0 then
      s := Format('Completed in %0.1n ms', [FDebugStopwatch.Elapsed.TotalMilliseconds])
    else
      s := Format('Completed in %0.2n s', [FDebugStopwatch.Elapsed.TotalSeconds]);
    AddMessage(s, mkInfo);
    AddStatusMessage(RStrProgramCompleted);
  end;
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.DockPanelDebugFrameClose(Sender: TdxCustomDockControl);
var
  DebuggerFrame: TControl;
  DebuggerWindow: IScriptDebuggerWindow;
begin
  if (Sender.ControlCount > 0) then
    DebuggerFrame := Sender.Controls[0]
  else
    DebuggerFrame := nil;

  if (DebuggerFrame = nil) then
    exit;

  if (not Supports(DebuggerWindow, IScriptDebuggerWindow, DebuggerFrame)) then
    exit;

  DebuggerWindow.Finalize;
  FDebuggerFrames.Remove(DebuggerWindow);

  FreeAndNil(DebuggerFrame);
end;

procedure TFormScriptDebugger.DockPanelDebugFrameVisibleChanged(Sender: TdxCustomDockControl);
var
  DebuggerFrameClassName: string;
  DebuggerFrameClass: TControlClass;
  DebuggerFrame: TControl;
  DebuggerWindow: IScriptDebuggerWindow;
begin
  if (not FLauoutLoading) then
    BarComboLayout.ItemIndex := -1;

  if (not Sender.Visible) then
    exit;

  if (Sender.ControlCount > 0) then
    exit;

  DebuggerFrameClassName := Sender.HelpKeyword;
  DebuggerFrameClass := TControlClass(FindClass(DebuggerFrameClassName));

  DebuggerFrame := DebuggerFrameClass.Create(Self);
  DebuggerFrame.Parent := Sender;

  DebuggerWindow := DebuggerFrame as IScriptDebuggerWindow;
  FDebuggerFrames.Add(DebuggerWindow);

  DebuggerWindow.Initialize(Self, SmallImages, ImageListSymbols);

  if (FProgram <> nil) then
  begin
    Update;
    DebuggerWindow.DebuggerStateChanged(dnCompiling);
    DebuggerWindow.DebuggerStateChanged(dnCompiled);
  end;
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.DockPanelDebugOtherVisibleChanged(Sender: TdxCustomDockControl);
begin
  if (not FLauoutLoading) then
    BarComboLayout.ItemIndex := -1;
end;

// -----------------------------------------------------------------------------

function TFormScriptDebugger.DoExecute(ADebug: Boolean): Boolean;
var
  Exec: IdwsProgramExecution;
  Stopwatch: TStopwatch;
  s: string;
begin
  FIntializationFinalizationMode := False;
  Result := False;

  ClearMessagesWindow;
  FPendingExceptionMsg := '';

  Compile(False);
  if not IsCompiled then
    Exit;

  ShowExecutableLines;

  AddStatusMessage(RStrRunning);

  Exec := FProgram.CreateNewExecution;
  Exec.Environment := Environment;

  if (ADebug) then
    AddMessage('Running program in debugger', mkInfo)
  else
    AddMessage('Running program', mkInfo);

  TdwsProgramExecution(Exec).OnExecutionStarted := DoOnExecutionStarted;
  TdwsProgramExecution(Exec).OnExecutionEnded := DoOnExecutionEnded;

  Result := True;

  try
    // Switch to debug layout
    BarComboLayout.Text := ScriptSettings.Layout.DebugLayout;
    try

      Stopwatch := TStopwatch.Create;
      Stopwatch.Start;
      try

        if (ADebug) then
        begin
          try
            Debugger.BeginDebug(Exec);
          finally
            Debugger.EndDebug;
            // Why?: ClearExecutableLines;
          end;
        end else
        begin
          Exec.BeginProgram;
          try

            Exec.RunProgram(0);

          finally
            Exec.EndProgram;
          end;
        end;

      finally
        Stopwatch.Stop;
      end;

    finally
      // Switch to edit layout
      BarComboLayout.Text := ScriptSettings.Layout.EditLayout;
    end;
  finally

    AddMessageInfo(Exec.Msgs);
    if Exec.Msgs.HasErrors then
    begin
      if (Exec.Msgs[Exec.Msgs.Count-1].Text = RTE_ScriptStopped) then
      begin
        AddMessage('Program was reset', mkInfo);
        AddStatusMessage('Terminated');
      end else
      begin
        AddMessage('Program terminated with errors', mkWarning);
        AddStatusMessage(RStrErrors);
        if (ADebug) then
          ViewScriptPos(Exec.Msgs.LastMessagePos);
        ErrorDlg(Exec.Msgs.AsInfo);
      end;
    end else
    begin
      if Stopwatch.Elapsed.TotalSeconds < 1.0 then
        s := Format('Completed in %0.1n ms', [Stopwatch.Elapsed.TotalMilliseconds])
      else
        s := Format('Completed in %0.2n s', [Stopwatch.Elapsed.TotalSeconds]);
      AddMessage(s, mkInfo);
      AddStatusMessage(RStrProgramCompleted);
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.ActionRefactorIdentifierRenameExecute(Sender: TObject);
var
  ScriptProgram: IdwsProgram;
  CursorPos: TBufferCoord;
  Symbol: TSymbol;
  SymbolPositionList: TSymbolPositionList;
  NewName: string;
  CurrentFilename: string;
  SymbolPosition: TSymbolPosition;
  s: string;
  i: integer;
  EditPage: IScriptDebugEditPage;
  List: TList<TSymbolPosition>;
  ScriptPos: TScriptPos;
  DeclarationFound: boolean;
  CurrentScriptProvider: IScriptProvider;
begin
  ScriptProgram := GetCompiledScript;
  if (ScriptProgram = nil) then
    Exit;

  CursorPos := CurrentEditorPage.Editor.CaretXY;
  CursorPos := CurrentEditorPage.Editor.WordStartEx(CursorPos);

  Symbol := ScriptProgram.SymbolDictionary.FindSymbolAtPosition(CursorPos.Char, CursorPos.Line, CurrentEditorPage.InternalUnitName);
  if (Symbol = nil) then
    exit;

  SymbolPositionList := ScriptProgram.ProgramObject.SymbolDictionary.FindSymbolPosList(Symbol);
  if (SymbolPositionList = nil) then
    exit;

  List := TList<TSymbolPosition>.Create;
  try
    DeclarationFound := False;
    for SymbolPosition in SymbolPositionList do
    begin
      // Ignore implicit references. We can only modify explicit references.
      if (suImplicit in SymbolPosition.SymbolUsages) then
        continue;

      List.Add(SymbolPosition);

      if (suDeclaration in SymbolPosition.SymbolUsages) then
        DeclarationFound := True;
    end;

    // Warn against declaration not found
    if (not DeclarationFound) then
    begin
      if (MessageTaskDlgEx('Declaration not found', Format('The declaration of "%s" was not located in any of the available source files.'#13#13'If you rename the symbol then the declation of it may no longer match the references to it.', [Symbol.Name]), mtWarning, [mbOK, mbCancel], mbCancel) <> mrOK) then
        exit;
    end;

    NewName := Symbol.Name;
    if (not InputQueryEx('Rename symbol', 'Enter new name:', NewName)) then
      exit;
    if (NewName = '') or (NewName = Symbol.Name) then
      exit;

    // Sort by file, line, column
    List.Sort(TComparer<TSymbolPosition>.Construct(
      function (const L, R: TSymbolPosition): integer
      begin
        Result := AnsiCompareStr(L.ScriptPos.SourceFile.Name, R.ScriptPos.SourceFile.Name);
        if (Result = 0) then
        begin
          Result := R.ScriptPos.Line-L.ScriptPos.Line;
          if (Result = 0) then
            Result := R.ScriptPos.Col-L.ScriptPos.Col;
        end;
      end));

    CurrentScriptProvider := CurrentEditorPage.ScriptProvider;

    CurrentFilename := '';
    EditPage := nil;

    for SymbolPosition in List do
    begin
      s := UnitNameFromScriptPos(SymbolPosition.ScriptPos);

      if (s <> CurrentFilename) then
      begin
        CurrentFilename := s;

        i := NameToEditorPageIndex(CurrentFilename);
        if (i = -1) then
        begin
          EditPage := EditorPageAddNew(SymbolPosition.ScriptPos.SourceName, True, True, CurrentScriptProvider);
          if (EditPage = nil) then
            continue;

          if (not EditPage.HasProvider) then
          begin
            EditPage.Script := SymbolPosition.ScriptPos.SourceCode;
            EditPage.IsReadOnly := True;
          end;
        end else
          EditPage := EditorPage(i);
      end;

      if (EditPage = nil) then
        exit;

      s := TEditorPage(EditPage).Editor.Lines[SymbolPosition.ScriptPos.Line-1];

      s := Copy(s, 1, SymbolPosition.ScriptPos.Col-1) + NewName + Copy(s, SymbolPosition.ScriptPos.Col+Length(Symbol.Name), MaxInt);

      TEditorPage(EditPage).Editor.Lines[SymbolPosition.ScriptPos.Line-1] := s;
      TEditorPage(EditPage).MarkModified(SymbolPosition.ScriptPos.Line-1);

      ScriptPos := TScriptPos.Create(SymbolPosition.ScriptPos.SourceFile, SymbolPosition.ScriptPos.Line, SymbolPosition.ScriptPos.Col);
      AddMessage(Format('Renamed symbol [%s, line: %d, column: %d]', [TEditorPage(EditPage).UnitName, SymbolPosition.ScriptPos.Line, SymbolPosition.ScriptPos.Col]), ScriptPos, mkInfo);
    end;
  finally
    List.Free;
  end;
end;

procedure TFormScriptDebugger.ActionGenericNotDebuggingUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := HasEditorPage and (Debugger.State in [dsIdle, dsDebugDone]);
//  TAction(Sender).Enabled := not ActionDebug.Visible;
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.OnCaseNormalize(Line, Col : Integer; const Name : string);
var
  ScriptPos: TScriptPos;
begin
  ScriptPos := TScriptPos.Create(FCaseNormalizeScriptProgram.SourceList.MainScript.SourceFile, Line, Col);
  AddMessage(Format('Normalized case [%s, line: %d, column: %d]: %s', [CurrentEditorPage.UnitName, Line, Col, Name]), ScriptPos, mkInfo);
  CurrentEditorPage.MarkModified(Line-1);
  // This sucks. We might not be operating on the main unit so blah blah...
  FMainUnitName := CurrentEditorPage.UnitName;
end;

procedure TFormScriptDebugger.ActionRefactorNormalizeCaseExecute(Sender: TObject);
var
  SourceFile: TSourceFile;
begin
  FCaseNormalizeScriptProgram := GetCompiledScript;
  try
    SourceFile := FCaseNormalizeScriptProgram.SourceList.MainScript.SourceFile;

    NormalizeSymbolsCase(CurrentEditor.Lines, SourceFile, FCaseNormalizeScriptProgram.SymbolDictionary, OnCaseNormalize);
  finally
    FCaseNormalizeScriptProgram := nil;
  end;
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.ActionRefactorSearchSymbolExecute(Sender: TObject);
var
  ScriptProgram: IdwsProgram;
  CursorPos: TBufferCoord;
  Symbol: TSymbol;
  SymbolPosList: TSymbolPositionList;
  i: integer;
  s: string;
  SymbolUsages : TSymbolUsages;
  ScriptPos: PScriptPos;
begin
  ScriptProgram := GetCompiledScript;
  if (ScriptProgram = nil) then
    Exit;

  CursorPos := CurrentEditor.CaretXY;
  CursorPos := CurrentEditor.WordStartEx(CursorPos);
  Symbol := ScriptProgram.SymbolDictionary.FindSymbolAtPosition(CursorPos.Char, CursorPos.Line, CurrentEditorPage.InternalUnitName);

  if (Symbol = nil) then
    Exit;

  SymbolPosList := ScriptProgram.SymbolDictionary.FindSymbolPosList(Symbol);

  if (SymbolPosList = nil) then
  begin
    AddMessage(Format('Symbol "%s" not found', [Symbol.Name]), mkWarning);
    exit;
  end;

  AddMessage(Format('Usage of symbol "%s": %d occurences found', [Symbol.Name, SymbolPosList.Count]), mkInfo, True);

  for i := 0 to SymbolPosList.Count-1 do
  begin
    SymbolUsages := SymbolPosList[i].SymbolUsages;
    while (SymbolUsages <> []) do
    begin
      if (suForward in SymbolUsages) then
      begin
        Exclude(SymbolUsages, suForward);
        s := 'Forward declaration';
      end else
      if (suDeclaration in SymbolUsages) then
      begin
        Exclude(SymbolUsages, suDeclaration);
        s := 'Declaration';
      end else
      if (suImplementation in SymbolUsages) then
      begin
        Exclude(SymbolUsages, suImplementation);
        s := 'Implementation';
      end else
      if (suReference in SymbolUsages) then
      begin
        Exclude(SymbolUsages, suReference);
        if (suRead in SymbolUsages) then
        begin
          if (suWrite in SymbolUsages) then
            s := 'Read/Write reference'
          else
            s := 'Read reference';
        end else
        if (suWrite in SymbolUsages) then
          s := 'Write reference'
        else
          s := 'Reference';
        Exclude(SymbolUsages, suRead);
        Exclude(SymbolUsages, suWrite);
        if (suImplicit in SymbolUsages) then
        begin
          Exclude(SymbolUsages, suImplicit);
          s := 'Implicit '+s;
        end;
      end else
      if (suRTTI in SymbolUsages) then
      begin
        Exclude(SymbolUsages, suRTTI);
        s := 'RTTI'
      end else
      begin
        SymbolUsages := [];
        s := 'Unknown';
      end;

      ScriptPos := @(SymbolPosList[i].ScriptPos);

      AddMessage(Format('  %s: [%s, line: %d, column: %d]', [s, UnitNameFromScriptPos(ScriptPos^), ScriptPos.Line, ScriptPos.Col]), ScriptPos^, mkInfo);
    end;
  end;
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.ActionRunExecute(Sender: TObject);
begin
  try

    if Debugger.State = dsDebugSuspended then
    begin
      Debugger.Resume;
    end else
    begin
      ClearOutputWindow;

      if TryRunSelection(True) then
        exit;

      DoExecute(True);
    end;

  except
    on E: EScriptStopped do
      ;
    on E: Exception do
      ErrorDlg(E.Message);
  end;
end;

procedure TFormScriptDebugger.ActionRunUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := HasEditorPage and (Debugger.State in [dsIdle, dsDebugDone]);
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.ActionRunFinalizationExecute(Sender: TObject);
begin
  EndDebug;
end;

procedure TFormScriptDebugger.ActionRunFinalizationUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (FIntializationFinalizationMode) and (not FExecutingIntialization) and (Debugger.State in [dsDebugRun])
//    (Debugger.Execution.ProgramState = psRunning);
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.ActionRunInitializationExecute(Sender: TObject);
begin
  BeginDebug;
end;

procedure TFormScriptDebugger.ActionRunInitializationUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := HasEditorPage and (Debugger.State in [dsIdle, dsDebugDone]);
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.ActionRunPauseExecute(Sender: TObject);
begin
  Debugger.Suspend;
end;

procedure TFormScriptDebugger.ActionRunPauseUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (Debugger.State = dsDebugRun) and (daCanSuspend in Debugger.AllowedActions);
  TAction(Sender).Checked := (Debugger.State = dsDebugSuspended);
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.ActionRunResumeUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (Debugger.State = dsDebugSuspended);
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.ActionRunStepOutExecute(Sender: TObject);
begin
  Debugger.StepOut;
end;

procedure TFormScriptDebugger.ActionRunStepOutUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (daCanStepOut in Debugger.AllowedActions);
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.ActionRunWithoutDebuggingExecute(Sender: TObject);
begin
  ClearOutputWindow;

  if TryRunSelection(False) then
    exit;

  DoExecute(False);
end;

procedure TFormScriptDebugger.ActionRunWithoutDebuggingUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := HasEditorPage and (Debugger.State in [dsIdle, dsDebugDone]);
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.ActionSearchAgainExecute(Sender: TObject);
begin
  DoSearch(FSearchOptions - [ssoEntireScope], False);
end;

procedure TFormScriptDebugger.ActionSearchAgainUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (FSearchText <> '') and (CurrentEditorPage <> nil);
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.ActionSearchFindExecute(Sender: TObject);
var
  SearchDialog: TFormScriptDebuggerSearch;
  Editor: TSynEdit;
  p: TPoint;
begin
  Editor := CurrentEditor;
  SearchDialog := TFormScriptDebuggerSearch.Create(Self);
  try
    p := ClientToScreen(Point(ClientWidth, ClientHeight));
    SearchDialog.Left := p.X - SearchDialog.Width;
    SearchDialog.Top := p.Y - SearchDialog.Height;

    SearchDialog.Options := FSearchOptions;
    SearchDialog.History := FSearchHistory;
    SearchDialog.RegularExpression := FSearchRegularExpression;
    SearchDialog.AutoWrap := FSearchAutoWrap;

    if (Editor.SelAvail) and (Editor.BlockBegin.Line = Editor.BlockEnd.Line) then
      SearchDialog.SearchText := Editor.SelText
    else
      SearchDialog.SearchText := Editor.GetWordAtRowCol(Editor.CaretXY);

    if (not SearchDialog.Execute) then
      exit;

    FSearchText := SearchDialog.SearchText;
    FSearchOptions := SearchDialog.Options;
    FSearchHistory := SearchDialog.History;
    FSearchRegularExpression := SearchDialog.RegularExpression;
    FSearchAutoWrap := SearchDialog.AutoWrap;

    if (FSearchRegularExpression) then
      Editor.SearchEngine := SynEditRegexSearch
    else
      Editor.SearchEngine := SynEditSearch;

    DoSearch(FSearchOptions, True);
  finally
    SearchDialog.Free;
  end;
end;

procedure TFormScriptDebugger.ActionSearchFindUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (CurrentEditorPage <> nil);
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.ActionShowExecutionPointExecute(Sender: TObject);
begin
  ViewScriptPos(Debugger.CurrentScriptPos, True);
end;

procedure TFormScriptDebugger.ActionShowExecutionPointUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (Debugger.State = dsDebugSuspended);
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.ActionStepOverExecute(Sender: TObject);
begin
  Debugger.StepOver;
end;

procedure TFormScriptDebugger.ActionStepOverUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (daCanStep in Debugger.AllowedActions);
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.ActionEditToggleReadOnlyExecute(Sender: TObject);
var
  Page: TEditorPage;
begin
  Page := CurrentEditorPage;
  Page.IsReadOnly := not Page.IsReadOnly;
end;

procedure TFormScriptDebugger.ActionEditToggleReadOnlyUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := HasEditorPage;
  TAction(Sender).Checked := TAction(Sender).Enabled and CurrentEditorPage.IsReadOnly;
end;

procedure TFormScriptDebugger.ActionEditUndoExecute(Sender: TObject);
begin
  CurrentEditor.Undo;
end;

procedure TFormScriptDebugger.ActionEditUndoUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (CurrentEditor <> nil) and (CurrentEditor.CanUndo);
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.ActionExitUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (Debugger.State <> dsDebugRun);
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.ActionToolBundleExecute(Sender: TObject);
{$ifdef FEATURE_SCRIPT_BUNDLE}
var
  FormBundleBuilder: TFormBundleBuilder;
{$endif FEATURE_SCRIPT_BUNDLE}
begin
{$ifdef FEATURE_SCRIPT_BUNDLE}
  FormBundleBuilder := TFormBundleBuilder.Create(nil);
  try
    FormBundleBuilder.Execute;
  finally
    FormBundleBuilder.Free;
  end;
{$else FEATURE_SCRIPT_BUNDLE}
  ShowMessage('Feature unavailable');
  Abort;
{$endif FEATURE_SCRIPT_BUNDLE}
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.ActionToolHeaderExecute(Sender: TObject);
var
  ProductID: string;
  AuthorID: string;
  s: string;
  s1, s2: string;
  Package: IScriptPackageInternal;
  Stream: TStream;
begin
  if (CurrentEditor = nil) then
    exit;

  ProductID := '';
  AuthorID := '';
  Package := ScriptService.CreateTemporaryPackage('', pkScript) as IScriptPackageInternal;
  try
    Stream := TStringStream.Create(CurrentEditorPage.Script);
    try

      if (Package.LoadFromStream(Stream)) then
      begin
        ProductID := Package.ProductID;
        AuthorID := Package.AuthorID;
      end;

    finally
      Stream.Free;
    end;
  finally
    Package := nil;
  end;

  if (ProductID <> '') or (AuthorID <> '') then
    if (MessageDlgEx('The script appears to already contain a header.'#13#13+
      'Are you sure you want to insert an empty header?'#13+
      '(existing text in the script will not be modified)', mtConfirmation, [mbYes, mbNo], -1, mbYes) <> mrYes) then
      exit;

  if (AuthorID = '') then
    AuthorID := sScriptAPIKeyPublic;

  if (ProductID <> '') then
    s1 := ProductID
  else
    s1 := sScriptHeaderTemplateProductID;

  if (AuthorID <> '') then
    s2 := AuthorID
  else
    s2 := sScriptHeaderTemplateAuthorID;

  s := Format(sScriptHeaderTemplate, [s1, s2]);

  CurrentEditorPage.Script := s + CurrentEditorPage.Script;
end;

procedure TFormScriptDebugger.ActionToolHeaderUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (CurrentEditorPage <> nil);
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.ActionToolCopyProtectExecute(Sender: TObject);
{$ifdef FEATURE_COPY_PROTECT}
var
  ProductID: string;
  AuthorID: string;
  Password: string;
  Res: integer;
  s: string;
  s1, s2: string;
  EncodedPassword: string;
  Content: string;
  Cipher: IScriptPersistenceCipher;
  i: integer;
  n: integer;
  Package: IScriptPackageInternal;
  Stream: TStream;
{$endif FEATURE_COPY_PROTECT}
begin
{$ifdef FEATURE_COPY_PROTECT}
  if (CurrentEditor = nil) then
    exit;

  Password := '';
  ProductID := '';
  AuthorID := '';
  Package := ScriptService.CreateTemporaryPackage('', pkScript) as IScriptPackageInternal;
  try
    Stream := TStringStream.Create(CurrentEditorPage.Script);
    try

      if (Package.LoadFromStream(Stream)) then
      begin
        ProductID := Package.ProductID;
        AuthorID := Package.AuthorID;
      end;

    finally
      Stream.Free;
    end;
  finally
    Package := nil;
  end;

  if (AuthorID = '') then
    AuthorID := sScriptAPIKeyPublic;

  if (ProductID <> '') and (AuthorID <> '') then
    Password := ProductID + AuthorID;

  if (ProductID = '') or (AuthorID = '') then
  begin
    Res := MessageTaskDlgEx('Copy protect source code', 'Your script does not contain a valid header section.'#13#13'In order to apply copy protection the script must contain a header section that specifies the "Product ID" and "Author ID" values.'#13#13+
      'Do you wish to have an empty script header template inserted that you can customize?|'+
      'If you answer "No" you will still be able to encrypt the script so it cannot be read by others, but it will not be copy protected.', mtWarning, [mbYes, mbNo, mbAbort], mrNo);
    if (Res = mrAbort) then
      exit;
    if (Res = mrYes) then
    begin
      if (ProductID <> '') then
        s1 := ProductID
      else
        s1 := sScriptHeaderTemplateProductID;
      if (AuthorID <> '') then
        s2 := AuthorID
      else
        s2 := sScriptHeaderTemplateAuthorID;
      s := Format(sScriptHeaderTemplate, [s1, s2]);
      CurrentEditorPage.Script := s + CurrentEditorPage.Script;
      exit;
    end;
  end;

  if (Password = '') then
  begin
    while (True) do
    begin
      if (not InputQueryEx('Encrypt source code', 'Enter password', Password)) then
        exit;

      if (Length(Password) < 8) then
        ShowMessage('Password too weak (min 8 chars)')
      else
      if (Length(Password) > 30) then
        ShowMessage('Password too long (max 30 chars)')
      else
        break;
    end;

    // Pad password with random chars to a width of 30 chars.
    n := 30 - Length(Password);
    SetLength(s, n);
    for i := 1 to n do
      s[i] := Char(1+Random(31));
    Password := s + Password;

    // Encrypt password
    Cipher := CreateLicenseCipher('Lorem ipsum dolor', ScriptContentProtectionCipher);
    EncodedPassword := Cipher.Encode(Password);
    ASSERT(Length(EncodedPassword) = 40);
  end else
    EncodedPassword := '';

  // Encrypt content
  Cipher := CreateLicenseCipher(Password, ScriptContentProtectionCipher);
  Content := CurrentEditor.SelText;
  Content := Cipher.Encode(Content);

  Content := EncodedPassword + Content;

  // Block encrypted content to lines with a width of 80 chars.
  i := 81;
  while (i < Length(Content)) do
  begin
    Insert(#13#10, Content, i);
    inc(i, 82);
  end;

  if (ProductID <> '') and (AuthorID <> '') then
  begin
    s := 'Version: '+IntToStr(ScriptContentProtectionVersion)+#13#10+
      'Product ID: '+ProductID+#13#10+
      'Author ID: '+AuthorID+#13#10;
  end else
    s := '';

  CurrentEditor.SelText :=
    sScriptObfuscationPatternBegin + #13#10 +
    s+
    Content + #13#10 +
    sScriptObfuscationPatternEnd;
{$endif FEATURE_COPY_PROTECT}
end;

procedure TFormScriptDebugger.ActionToolCopyProtectUpdate(Sender: TObject);
begin
{$ifdef FEATURE_COPY_PROTECT}
  TAction(Sender).Enabled := (CurrentEditor <> nil) and (CurrentEditor.SelAvail);
{$endif FEATURE_COPY_PROTECT}
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.ActionToolDocBuildExecute(Sender: TObject);
begin
//
end;

procedure TFormScriptDebugger.ActionToolDocBuildUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (GetProgram <> nil);
end;

procedure TFormScriptDebugger.ButtonToolDocumentBuildClick(Sender: TObject);
var
  ScriptProgram: IdwsProgram;
  DocumentationBuilder: TScriptCustomDocBuilder;
  Folder: string;
begin
  ScriptProgram := GetProgram;
  if (ScriptProgram = nil) then
    exit;

{$ifdef DEBUG}
  Folder := ExpandEnvironmentVariable(sScriptHelpRtlSourceFolder);
{$else DEBUG}
  Folder := ExtractFilePath(ExpandEnvironmentVariable(sScriptHelpRtlFilenameDownload));
{$endif DEBUG}

  DocumentationBuilder := TScriptSourceBuilder.Create(ScriptProgram, TPath.GetFileNameWithoutExtension(sScriptHelpRtlFilename));
  try

    DocumentationBuilder.Compile(IncludeTrailingPathDelimiter(Folder));

  finally
    DocumentationBuilder.Free;
  end;

  ShowMessage('Documentation has been compiled in:'+#13+Folder);
end;

procedure TFormScriptDebugger.ButtonToolDocumentSourceClick(Sender: TObject);
var
  ScriptProgram: IdwsProgram;
  DocumentationBuilder: TScriptCustomDocBuilder;
  Folder: string;
begin
  ScriptProgram := GetProgram;
  if (ScriptProgram = nil) then
    exit;

{$ifdef DEBUG}
  Folder := ExpandEnvironmentVariable(sScriptHelpRtlSourceFolder);
{$else DEBUG}
  Folder := ExtractFilePath(ExpandEnvironmentVariable(sScriptHelpRtlFilenameDownload));
{$endif DEBUG}

  DocumentationBuilder := TScriptSourceBuilder.Create(ScriptProgram, TPath.GetFileNameWithoutExtension(sScriptHelpRtlFilename));
  try

    DocumentationBuilder.Build(IncludeTrailingPathDelimiter(Folder));

  finally
    DocumentationBuilder.Free;
  end;

  ShowMessage('Documentation has been generated in:'+#13+Folder);
end;

procedure TFormScriptDebugger.ButtonToolDocumentXMLClick(Sender: TObject);
var
  ScriptProgram: IdwsProgram;
  DocumentationBuilder: TScriptCustomDocBuilder;
  Folder: string;
begin
  ScriptProgram := GetProgram;
  if (ScriptProgram = nil) then
    exit;

{$ifdef DEBUG}
  Folder := ExpandEnvironmentVariable(sScriptHelpRtlSourceFolder);
{$else DEBUG}
  Folder := ExtractFilePath(ExpandEnvironmentVariable(sScriptHelpRtlFilenameDownload));
{$endif DEBUG}

  DocumentationBuilder := TScriptDocumentationBuilder.Create(ScriptProgram);
  try

    DocumentationBuilder.Build(Folder);

  finally
    DocumentationBuilder.Free;
  end;

  ShowMessage('Documentation has been generated in:'+#13+Folder);
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.ActionTraceIntoExecute(Sender: TObject);
begin
  Debugger.StepDetailed;
end;

procedure TFormScriptDebugger.ActionTraceIntoUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (daCanStep in Debugger.AllowedActions);
end;

procedure TFormScriptDebugger.ActionViewStackExecute(Sender: TObject);
begin
  DockPanelStack.Visible := TAction(Sender).Checked;
end;

procedure TFormScriptDebugger.ActionViewStackUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := DockPanelStack.Visible;
end;

procedure TFormScriptDebugger.ActionViewSymbolsExecute(Sender: TObject);
begin
  if (TAction(Sender).Checked) then
    ListSymbols
  else
    DockPanelSymbols.Hide;
end;

procedure TFormScriptDebugger.ActionViewSymbolsUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (FProgram <> nil) and (FProgram.Table.Count > 0);
  TAction(Sender).Checked := DockPanelSymbols.Visible;
end;
procedure TFormScriptDebugger.ActionViewWatchesExecute(Sender: TObject);
begin
  DockPanelWatches.Visible := TAction(Sender).Checked;
end;

procedure TFormScriptDebugger.ActionViewWatchesUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := DockPanelWatches.Visible;
end;

{$ENDREGION}


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
//              ScriptDebuggerFactory
//
// -----------------------------------------------------------------------------
function ScriptDebuggerFactory(const ScriptDebuggerHost: IScriptDebuggerHost; CreateAsMainForm: boolean): IScriptDebugger;
var
  DebuggerForm: TFormScriptDebugger;
begin
  if (CreateAsMainForm) then
  begin
    Application.CreateForm(TFormScriptDebugger, DebuggerForm);
    Result := IScriptDebugger(DebuggerForm);
  end else
    Result := TFormScriptDebugger.Create(nil);

  TFormScriptDebugger(Result).SetDebuggerHost(ScriptDebuggerHost);
end;

initialization
  RegisterScriptDebuggerFactory(ScriptDebuggerFactory);
finalization
  RegisterScriptDebuggerFactory(nil);
end.
