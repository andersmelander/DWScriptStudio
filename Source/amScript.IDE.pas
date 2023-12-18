unit amScript.IDE;

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

{.$define SHELL_EXPLORER}
{.$define FEATURE_SCRIPT_BUNDLE}
{.$define FEATURE_PACKAGE_INSTALLER}
{.$define FEATURE_COPY_PROTECT}
{.$define FEATURE_LICENSING}

{$ifdef DISABLED_STUFF}
{$endif DISABLED_STUFF}
uses
  System.Generics.Collections,
  System.Types, System.SysUtils, System.Variants, System.Classes,
  System.ImageList, System.Diagnostics,
  WinApi.Windows, WinApi.Messages,
  WinApi.ActiveX, WinApi.UxTheme,
  Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Themes, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ActnList, Vcl.ComCtrls,
  Vcl.StdActns, Vcl.Menus, Vcl.ToolWin, Vcl.ActnCtrls, Vcl.ImgList,
  System.Actions, Winapi.ShlObj,
  XML.XMLIntf, XML.XMLDoc,

  dxSkinsCore, dxSkinscxPCPainter, cxPCdxBarPopupMenu, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxPC, dxSkinsdxBarPainter, dxBar, cxClasses, dxSkinsdxDockControlPainter,
  dxDockControl, dxDockPanel, dxSkinsdxStatusBarPainter, dxStatusBar, dxRibbonSkins, dxSkinsdxRibbonPainter, dxRibbon,
  dxRibbonForm,
  dxBarBuiltInMenu, dxRibbonCustomizationForm, dxSkinsForm, dxBarApplicationMenu,
  dxBarExtItems, cxImageList, cxContainer,
  dxCore,

{$ifdef SHELL_EXPLORER}
  cxDropDownEdit,
  cxListView,
  cxEdit, cxTextEdit, cxMaskEdit,
  cxShellCommon, cxShellComboBox, cxShellListView,
{$endif SHELL_EXPLORER}

  SynEdit,
  SynEditTypes,
  SynEditHighlighter, SynHighlighterDWS,
  SynEditKeyCmds, SynEditPlugins,
  SynMacroRecorder, SynCompletionProposal,
  SynEditSearch, SynEditRegexSearch,

  DragDrop, DropTarget, DragDropFile,

  dwsExprs, dwsComp, dwsCompiler, dwsDebugger, dwsStringResult, dwsErrors,
  dwsFunctions, dwsUtils, dwsSymbols, dwsUnitSymbols, dwsStrings,
  dwsSymbolDictionary,
  dwsInfo,
  dwsScriptSource,

  // UDwsIdeConfig,
  amScript.API,
  amScript.Debugger.API,
  amScript.Host.API,
  amScript.Module,
  amScript.Provider.API,
  amScript.Editor.API,
  amScript.Editor.Dialog.GotoLine, // TODO : Move this out of IDE unit
  amScript.Debugger.Dialog.Evaluate,
  amScript.Debugger.Frame.LocalVariables,
  amScript.Debugger.Frame.Watches,
  amScript.Debugger.Frame.CallStack,
  amScript.Debugger.Frame.Symbols,
  amScript.Debugger.Frame.Stack,
  amScript.Debugger.Frame.AST,
  amScript.Debugger.Frame.BreakPoints,
  amScript.Debugger.Frame.FileSystemStructure;

const
  MSG_EXEC_RESET = WM_USER;
  MSG_FORM_MAXIMIZE = WM_USER+1;

type
  TMessageKind = (mkNone, mkInfo, mkWarning, mkError);

  TDebuggerExecutionEvent = procedure(const Execution: IdwsProgramExecution) of object;

// -----------------------------------------------------------------------------
//
//              TFormScriptDebugger
//
// -----------------------------------------------------------------------------
  TFormScriptDebugger = class(TdxRibbonForm,
    IScriptDebugger,
    IScriptDebuggerSetup,
    IScriptHostApplicationNotification,
    IScriptHostApplicationCloseNotification,
    IScriptEditorHost,
    IScriptEditorNotification,
    IScriptEditorActionHandler)

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
    UpdateTimer: TTimer;
    ActionExit: TAction;
    BarManager: TdxBarManager;
    MenuItemFileNewProject: TdxBarButton;
    MenuItemFileNewUnit: TdxBarButton;
    MenuItemFileNewInclude: TdxBarButton;
    MenuItemFileNew: TdxBarSubItem;
    MenuItemFileOpen: TdxBarButton;
    MenuItemFileOpenProject: TdxBarButton;
    MenuItemFileSave: TdxBarButton;
    MenuItemFileSaveAsFile: TdxBarButton;
    MenuItemFileSaveProjectAs: TdxBarButton;
    MenuItemFileCloseAll: TdxBarButton;
    MenuItemFileExit: TdxBarLargeButton;
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
    MenuItemProjectBuild: TdxBarButton;
    MenuItemRunStart: TdxBarButton;
    MenuItemRunStepOver: TdxBarButton;
    MenuItemRunTraceInto: TdxBarButton;
    MenuItemRunReset: TdxBarButton;
    MenuItemRunShowExecutionPoint: TdxBarButton;
    MenuItemRunClearAllBreakpoints: TdxBarButton;
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
    ActionSearchAgain: TAction;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    DockPanelBreakPoints: TdxDockPanel;
    ActionDebugEvaluate: TAction;
    ActionDebug: TAction;
    Debug1: TMenuItem;
    N2: TMenuItem;
    EvaluateModify1: TMenuItem;
    MenuItemFileSaveAsEx: TdxBarSubItem;
    ActionFileSaveAsAttachment: TAction;
    MenuItemFileSaveAsAttachment: TdxBarButton;
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
    dxBarButton27: TdxBarButton;
    ActionViewFileExplorer: TAction;
    dxLayoutDockSite4: TdxLayoutDockSite;
    dxLayoutDockSite5: TdxLayoutDockSite;
    ButtonToolDocumentBuild: TdxBarButton;
    ActionJIT: TAction;
    dxBarButton7: TdxBarButton;
    BarManagerBarMainMenu: TdxBar;
    BarSubMenuItemFile: TdxBarSubItem;
    BarSubMenuItemEdit: TdxBarSubItem;
    BarSubMenuItemRefactoring: TdxBarSubItem;
    BarSubMenuItemView: TdxBarSubItem;
    BarSubMenuItemSearch: TdxBarSubItem;
    BarSubMenuItemRun: TdxBarSubItem;
    BarSubMenuItemDebug: TdxBarSubItem;
    BarSubMenuItemLayout: TdxBarSubItem;
    BarButtonViewRibbon: TdxBarButton;
    ActionViewRibbon: TAction;
    ActionViewMainMenu: TAction;
    BarButtonViewMainMenu: TdxBarButton;
    ActionViewLayout: TAction;
    MenuItemFileSaveAs: TdxBarButton;
    ActionFileSaveAs: TAction;
    ActionFileSaveAsEx: TAction;
    procedure FormCreate(Sender: TObject);
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
    procedure ActionFileNewUnitExecute(Sender: TObject);
    procedure ActionFileSaveAsFileExecute(Sender: TObject);
    procedure ActionFileSaveAsFileUpdate(Sender: TObject);
    procedure ActionFileSaveExecute(Sender: TObject);
    procedure ActionFileSaveUpdate(Sender: TObject);
    procedure ActionOpenFileExecute(Sender: TObject);
    procedure ActionProgramResetExecute(Sender: TObject);
    procedure ActionProgramResetUpdate(Sender: TObject);
    procedure ActionRunExecute(Sender: TObject);
    procedure ActionRunUpdate(Sender: TObject);
    procedure ActionRunWithoutDebuggingExecute(Sender: TObject);
    procedure ActionRunWithoutDebuggingUpdate(Sender: TObject);
    procedure ActionShowExecutionPointExecute(Sender: TObject);
    procedure ActionShowExecutionPointUpdate(Sender: TObject);
    procedure ActionStepOverExecute(Sender: TObject);
    procedure ActionStepOverUpdate(Sender: TObject);
    procedure ActionEditToggleReadOnlyExecute(Sender: TObject);
    procedure ActionEditToggleReadOnlyUpdate(Sender: TObject);
    procedure ActionTraceIntoExecute(Sender: TObject);
    procedure ActionTraceIntoUpdate(Sender: TObject);
    procedure ActionViewProjectSourceUpdate(Sender: TObject);
    procedure ActionViewSymbolsExecute(Sender: TObject);
    procedure ActionViewSymbolsUpdate(Sender: TObject);
    procedure DebuggerStateChanged(Sender: TObject);
    procedure UpdateTimerTimer(Sender: TObject);
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
    procedure ButtonToolDocumentBuildClick(Sender: TObject);
    procedure ActionDummyExecute(Sender: TObject);
    procedure BarButtonRibbonClick(Sender: TObject);
    procedure ActionViewRibbonExecute(Sender: TObject);
    procedure ActionViewRibbonUpdate(Sender: TObject);
    procedure ActionViewMainMenuExecute(Sender: TObject);
    procedure ActionViewMainMenuUpdate(Sender: TObject);
    procedure ActionJITUpdate(Sender: TObject);
    procedure ActionJITExecute(Sender: TObject);
  private
    FScript: TDelphiWebScript;
    FCompileContext: IScriptContext;
    FProgram: IdwsProgram;
    FMainUnitName: string;
    FMainUnit: IScriptEditor;
    FSaveOnNeedUnit: TdwsOnNeedUnitEvent;


    FGotoForm: TDwsIdeGotoLineNumber;

    FSavedModalForm: TCustomForm;
    FPreviousDebuggerState: TdwsDebuggerState;
    FPendingExceptionMsg: string;
    FPendingExceptionPos: TScriptPos;

  private
    // Editor container and view management
    FActiveEditor: IScriptEditor;
    // FEditorContainers maps from container control to editor
    FEditorContainers: TDictionary<TWinControl, IScriptEditor>;
    FEditors: TList<IScriptEditor>;
    function EditorByName(const AName: string): IScriptEditor;
    function EditorByContainer(const AContainer: TWinControl): IScriptEditor;
    function ContainerByEditor(const AEditor: IScriptEditor): TWinControl;
    procedure CloseEditor(const AEditor: IScriptEditor);
  protected
    procedure WMWindowPosChanged(var Msg: TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;
    procedure WMDpiChanged(var Message: TWMDpi); message WM_DPICHANGED;
    procedure MsgExecReset(var Msg: TMessage); message MSG_EXEC_RESET;
    procedure MsgFormMaximize(var Msg: TMessage); message MSG_FORM_MAXIMIZE;
    procedure DoCreate; override;
    procedure CreateParams(var Params: TCreateParams); override;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  private
    // Recent files
    procedure LoadRecentFiles;
    procedure SaveRecentFiles;
    procedure AddRecentFile(const Filename: string);
  private
    // HighDPI
    FDPIScale: Double;
  private
    // Layout
    FLayoutName: string; // Currently selected layout
    FLayoutLoading: boolean;
    procedure LoadLayouts;
    procedure SaveLayout;
  private
    // Frames
    FDebuggerFrames: TList<IScriptDebuggerWindow>;
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
    // Help
    class var FHasCheckedHelpVersion: boolean;
  private
    FEnvironment: IdwsEnvironment;
    FFormEvaluate: TFormDebugEvaluate;

    function OpenScriptStream(const Name: string; const CurrentScriptProvider: IScriptProvider = nil): IScriptProvider;
    function  TryRunSelection(ADebug: Boolean): Boolean;
    function  DoExecute(ADebug: Boolean): Boolean;
    function  BeginDebug: Boolean;
    function  EndDebug: Boolean;
    procedure NotifyEditors(Notification: TScriptEditorHostNotification);
    procedure EditorChange(const AEditor: IScriptEditor);
    procedure EditorPageClose(const AEditor: IScriptEditor);
    function EditorPagesCloseQuery(const AExceptEditor: IScriptEditor = nil): boolean;
    function EditorPagesCloseAll(const AExceptEditor: IScriptEditor = nil): boolean;
    procedure EditorSaveAllIfModified(APromptOverwrite: Boolean);
    procedure ResetProgram;
    procedure SetScript(const Value: TDelphiWebScript);
    procedure AddMessage(const AMessage: string; const AScriptPos: TScriptPos; AKind: TMessageKind = mkNone; Select: boolean = False); overload;
    procedure AddMessage(const AMessage: string; AKind: TMessageKind = mkNone; Select: boolean = False); overload;
    procedure ClearMessagesWindow;
    procedure ClearOutputWindow;
    function AddAlertMessage(const ACaption, AMessage: string; AImageIndex: integer = -1; ATimeout: integer = -1): IScriptHostAlertWindow;
    function UnitMainScript(const AUnitName, AIdentifier: string): string;

    function  HasEditorPage: Boolean;

    function  FileIsOpenInEditor(const AFileName: TFileName; Activate: boolean = False): Boolean;
    function  ModifyFileNameToUniqueInProject(const AFileName: TFileName): string;

    procedure ClearCurrentLine;
    procedure ClearAllBreakpoints;
    procedure AddStatusMessage(const AStr: string);
    function GetScriptProvider(var MainUnitName: string; const AScript: string = ''): IScriptProvider;
    function CreateCompilerContext(const ScriptProvider: IScriptProvider): IScriptContext;
    procedure Compile(ABuild: Boolean; const AScript: string = '');
    function IsCompiled: Boolean;

    procedure ListSymbols;

   procedure RunFunctionMethodByName(const AUnit, AName: string; AWithDebugging, APrompt: Boolean);

    function GetGotoForm: TDwsIdeGotoLineNumber;

    property GotoForm: TDwsIdeGotoLineNumber read GetGotoForm;
    procedure SavePage(const Page: IScriptEditor);

    function DoOnNeedUnit(const unitName : UnicodeString; var unitSource : UnicodeString) : IdwsUnit;

  private
    FSearchText: string;
    FSearchOptions: TSearchReplaceOptions;
    FSearchHistory: string;
    FSearchAutoWrap: boolean;
    procedure DoSearch(AOptions: TSearchReplaceOptions; First: boolean);
  private
    // Shell explorer
{$ifdef SHELL_EXPLORER}
    FShellListViewFileExplorer: TcxShellListView;
    FShellComboBoxFileExplorer: TcxShellComboBox;
    procedure ShellListViewFileExplorerExecuteItem(Sender: TObject; APIDL: PItemIDList; var AHandled: Boolean);
{$endif SHELL_EXPLORER}
  protected
    // IScriptHostApplicationNotification
    procedure ApplicationNotify(const ScriptHostApplication: IScriptHostApplication; Notification: TScriptHostApplicationNotification);
    // IScriptHostApplicationCloseNotification
    procedure ApplicationCloseQuery(const ScriptHostApplication: IScriptHostApplication; var CanClose: boolean);
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
  private
    FDebuggerSubscriptions: TList<IScriptDebuggerNotification>;
    procedure DebuggerNotify(Notification: TScriptDebuggerNotification);
  private
    // IScriptDebugger
    procedure DebuggerSubscribe(const Subscriber: IScriptDebuggerNotification);
    procedure IScriptDebugger.Subscribe = DebuggerSubscribe;
    procedure DebuggerUnsubscribe(const Subscriber: IScriptDebuggerNotification);
    procedure IScriptDebugger.Unsubscribe = DebuggerUnsubscribe;
    function GetDebugger: TdwsDebugger;
    function GetProgram: IdwsProgram;
    procedure ViewScriptPos(const AScriptPos: TScriptPos; AMoveCurrent: boolean = False; AHiddenMainModule: Boolean = False);
    function GetExecutableLines(const AUnitName: string): TLineNumbers;
    function FindBreakPoint(const ScriptPos: TScriptPos): TBreakpointStatus;
    procedure AddBreakpoint(const ScriptPos: TScriptPos; AEnabled: Boolean = True);
    procedure ClearBreakpoint(const ScriptPos: TScriptPos);
    procedure NotifyBreakPoint(Breakpoint: TdwsDebuggerBreakpoint; Notification: TScriptDebuggerBreakpointNotification; Updates: TBreakpointUpdates = []);
    function SymbolToImageIndex(Symbol: TSymbol): integer;
    procedure AddWatch(const Expression: string);
    function GetCompiledScript: IdwsProgram;
    procedure Evaluate(const Expression: string; ScriptPos: PScriptPos = nil);
    function UnitNameFromScriptPos(const ScriptPos: TScriptPos): string;
    function UnitNameFromInternalName(const Name: string): string;
  protected
    // IScriptEditorHost
    function CreateEditor(const AName: string; FileMustExist: boolean = False; const CurrentScriptProvider: IScriptProvider = nil): Boolean; overload;
    function GetMainUnit: IScriptEditor;
    procedure SetMainUnit(const Value: IScriptEditor);
    property MainUnit: IScriptEditor read GetMainUnit write SetMainUnit;
    function GetMainUnitName: string;
    property MainUnitName: string read GetMainUnitName;
    function GetActiveEditor: IScriptEditor;
    procedure SetActiveEditor(const Editor: IScriptEditor);
    function GetEditorPagePopupMenu: TPopupMenu;
    function PromptSaveScript(var Filename: string; const Foldername: string = ''): boolean;
    function DpiScale(Value: Integer): Integer;
  protected
    // IScriptEditorNotification
    procedure ScriptEditorNotification(const AEditor: IScriptEditor; ANotification: TScriptEditorNotification);
    // IScriptEditorActionHandler
    function EditorActionHandler(const AEditor: IScriptEditor; AAction: TScriptEditorAction): boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;

    property Script: TDelphiWebScript read FScript write SetScript;
    property Environment: IdwsEnvironment read FEnvironment write FEnvironment;

    property ActiveEditor: IScriptEditor read FActiveEditor;

    // Create an editor. Optionally load a script into it.
    function CreateEditor(const ScriptProvider: IScriptProvider = nil): IScriptEditor; overload;
    // Create an editor with the specified filename. Optionally load a script from the file.
    function CreateEditor(const AFileName: TFileName; ALoadfile: Boolean = False; AFileRequired: boolean = False; const CurrentScriptProvider: IScriptProvider = nil): IScriptEditor; overload;
    // Create an editor with the specified Name. Load the specified script into it.
    function CreateEditor(const AName, AScript: string): IScriptEditor; overload;
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
  System.UITypes,
  System.Generics.Defaults,
  System.Win.Registry,
  System.Math,
  System.StrUtils,
  System.IniFiles,
  System.HelpIntfs,
  Vcl.HtmlHelpViewer,
  Vcl.Consts,
  Vcl.Clipbrd,

  dwsXPlatform,
  dwsSuggestions,
  dwsDebugFunctions,
  dwsTokenizer,
  dwsFileSystem,
  dwsDataContext,
  dwsCaseNormalizer,

  dwsContextMap,

  dwsJIT,
{$ifdef WIN32}
  dwsJITx86,
{$endif}
{$ifdef WIN64}
  dwsJITx86_64,
{$endif}

  SynTaskDialog,

  IOUtils, amIOUtils, // Bug fix
  amDialogs,
  amCursorService,
  amInputQueryDialog,
  amEnvironment,
  amURLUtils,

  amScript.IDE.Data,
  amScript.Editor.Dialog.Search, // TODO : Move this out of IDE unit
  amScript.Editor.SynEdit.Data, // TODO : Abstract this out of IDE unit
  amScript.Editor.SynEdit, // This registers the SynEdit-based editor
{$ifdef FEATURE_SCRIPT_BUNDLE}
  amScript.IDE.Dialog.BundleBuilder,
{$endif FEATURE_SCRIPT_BUNDLE}
  amScript.DocBuilder,
  amScript.FileSystem.API,
  amScript.FileSystem,
  amScript.Provider,
  amScript.Host.Provider,
  amScript.Package.API,
  amScript.IDE.Settings;

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
  RStrProjectFileDoesNotExist = 'Project file does not exist (%s)';
  RStrCannotRunWithoutProjectFile = 'Cannot run without a project file';
  RStrProgramCompleted = 'Program completed';


const
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
//              TFormScriptDebugger
//
// -----------------------------------------------------------------------------
constructor TFormScriptDebugger.Create(AOwner: TComponent);
begin
  // Ensure datamodule has been instantiated before form loads
  DataModuleDebuggerViewData;

  inherited Create(AOwner);

  DisableAero := True; // Enables skinning of caption bar

  FSearchHistory := '';
  FSearchOptions := [];

  FDebuggerFrames := TList<IScriptDebuggerWindow>.Create;
  FEditorContainers := TDictionary<TWinControl, IScriptEditor>.Create;
  FEditors := TList<IScriptEditor>.Create;
end;

procedure TFormScriptDebugger.AfterConstruction;
var
  DebuggerFrame: IScriptDebuggerWindow;
//  sProjectFileName: TFileName;
//  S: string;
begin
  inherited;

  // Set up callback links
  for DebuggerFrame in FDebuggerFrames do
    DebuggerFrame.Initialize(Self, DataModuleDebuggerViewData.SmallImages, DataModuleDebuggerViewData.ImageListSymbols);

  ClearOutputWindow;

  DebuggerNotify(sdNotifyInitialize);
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

destructor TFormScriptDebugger.Destroy;
begin
  DebuggerNotify(sdNotifyFinalize);
  FreeAndNil(FDebuggerSubscriptions);

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

  FMainUnit := nil;
  FActiveEditor := nil;
  for var Editor in FEditors.ToArray do
    CloseEditor(Editor);

  SaveRecentFiles;
  ScriptSettings.Forms.Main.PrepareSettings(Self);
  ScriptSettings.WriteConfig;

  ClearMessagesWindow;
  Debugger.Breakpoints.Clean;
  Debugger.Watches.Clean;
  FProgram := nil;

  FEditorContainers.Clear;
  FEditors.Clear;

  FreeAndNil(FEditorContainers);
  FreeAndNil(FEditors);

  FDebuggerFrames.Free;

  FGotoForm.Free;

  inherited;
end;

procedure TFormScriptDebugger.BeforeDestruction;
begin

  inherited;
end;

procedure TFormScriptDebugger.MsgFormMaximize(var Msg: TMessage);
begin
  WindowState := wsMaximized;
end;

procedure TFormScriptDebugger.CreateParams(var Params: TCreateParams);
begin
  inherited;

  // See: https://stackoverflow.com/questions/53000291/how-to-smooth-ugly-jitter-flicker-jumping-when-resizing-windows-especially-drag
  Params.WindowClass.hbrBackground := COLOR_WINDOW+1;
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.FormCreate(Sender: TObject);

  procedure ApplyFeature(Enabled: boolean; Action: TAction); overload;
  begin
    if (Enabled) then
      exit;

    Action.Visible := False;
  end;

  procedure ApplyFeature(Enabled: boolean; Action: TAction; var DockPanel: TdxDockPanel); overload;
  begin
    if (Enabled) then
      exit;

    ApplyFeature(Enabled, Action);
    FreeAndNil(DockPanel);
  end;

begin
  RibbonDebug.ActiveTab := RibbonTabEditor;
  RibbonTabDebug.Visible := False;

  for var i := 0 to ComponentCount-1 do
    if (Components[i] is TdxDockPanel) and (TdxDockPanel(Components[i]).ControlCount = 0) then
      TdxDockPanel(Components[i]).Visible := False;

  ScriptSettings.ReadConfig;

  RibbonDebug.Visible := not ScriptSettings.Forms.Main.DisplayMainMenu;
  BarManagerBarMainMenu.Visible := ScriptSettings.Forms.Main.DisplayMainMenu;
  ActionViewMainMenu.Visible := ScriptSettings.Forms.Main.DisplayMainMenuToggle;
  ActionViewRibbon.Visible := ScriptSettings.Forms.Main.DisplayMainMenuToggle;

  ApplyFeature(ScriptSettings.Features.ViewFileExplorer, ActionViewFileExplorer, DockPanelFileExplorer);
  ApplyFeature(ScriptSettings.Features.ViewSymbols, ActionViewSymbols, DockPanelSymbols);
  ApplyFeature(ScriptSettings.Features.ViewCallStack, ActionViewCallStack, DockPanelCallStack);
  ApplyFeature(ScriptSettings.Features.ViewLocalVariables, ActionViewLocals, DockPanelLocalVars);
  ApplyFeature(ScriptSettings.Features.ViewWatches, ActionViewWatches, DockPanelWatches);
  ApplyFeature(ScriptSettings.Features.ViewDataStack, ActionViewStack, DockPanelStack);
  ApplyFeature(ScriptSettings.Features.ViewAST, ActionViewAST, DockPanelAST);
  ApplyFeature(ScriptSettings.Features.ViewLiveObjects, ActionDebugLiveObjects);
  ApplyFeature(ScriptSettings.Features.DebugAllowJIT, ActionJIT);
  ApplyFeature(ScriptSettings.Features.ToolsDocumentationBuilder, ActionToolDocBuild);
  ApplyFeature(ScriptSettings.Features.ToolsBundleBuilder, ActionToolBundle);
  ApplyFeature(ScriptSettings.Features.ToolsCopyProtection, ActionToolCopyProtect);
  ApplyFeature(ScriptSettings.Features.ToolsInsertHeader, ActionToolHeader);
  ApplyFeature(ScriptSettings.Features.IDELayout, ActionViewLayout);
  RibbonDebugTabTools.Visible := ScriptSettings.Features.ToolsMenu;
  BarManagerBarLayout.Visible := ScriptSettings.Features.IDELayout;

  ActionFileSaveAsEx.Visible := (ScriptHostApplication <> nil) and (ScriptHostApplication.HasDocuments);
  ActionFileSaveAs.Visible := (ScriptHostApplication = nil) or (not ScriptHostApplication.HasDocuments);

  LoadLayouts;
  LoadRecentFiles;

  if (ScriptSettings.Folders.FolderScript = '') then
    ScriptSettings.Folders.FolderScript := TPath.GetDirectoryName(Application.ExeName);

  OpenFileDialog.DefaultFolder := ScriptSettings.Folders.FolderScript;
  SaveSourceDialog.DefaultFolder := ScriptSettings.Folders.FolderScript;
  SaveProjectDialog.DefaultFolder := ScriptSettings.Folders.FolderScript;

{$ifdef SHELL_EXPLORER}
  FShellListViewFileExplorer := TcxShellListView.Create(Self);
  FShellListViewFileExplorer.Align := alClient;
  FShellListViewFileExplorer.Parent := DockPanelFileExplorer;
  FShellListViewFileExplorer.ReadOnly := True;
  FShellListViewFileExplorer.ViewStyle := vsReport;
  FShellListViewFileExplorer.OnExecuteItem := ShellListViewFileExplorerExecuteItem;

  FShellComboBoxFileExplorer := TcxShellComboBox.Create(Self);
  FShellComboBoxFileExplorer.Align := alTop;
  FShellComboBoxFileExplorer.Parent := DockPanelFileExplorer;
  FShellComboBoxFileExplorer.ShellListView := FShellListViewFileExplorer;

  FShellComboBoxFileExplorer.Path := ScriptSettings.Folders.FolderScript;
{$endif SHELL_EXPLORER}

  if (ScriptHostApplication <> nil) then
    ScriptHostApplication.Subscribe(Self);
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

procedure TFormScriptDebugger.DebuggerSubscribe(const Subscriber: IScriptDebuggerNotification);
begin
  if (FDebuggerSubscriptions = nil) then
    FDebuggerSubscriptions := TList<IScriptDebuggerNotification>.Create;
  FDebuggerSubscriptions.Add(Subscriber);
end;

procedure TFormScriptDebugger.DebuggerUnsubscribe(const Subscriber: IScriptDebuggerNotification);
begin
  if (FDebuggerSubscriptions = nil) then
    exit;
  FDebuggerSubscriptions.Remove(Subscriber);
end;

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
  EditPage: IScriptEditor;
  ScriptProvider: IScriptProvider;
begin
  if (not AScriptPos.Defined) then
    exit;

  ScriptName := UnitNameFromScriptPos(AScriptPos);
  EditPage := EditorByName(ScriptName);

  if (EditPage = nil) then
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
      EditPage := CreateEditor(ScriptProvider);
    end else
    begin
      EditPage := CreateEditor(ScriptName, AScriptPos.SourceCode);
      // Read-only because we have no file to associate the source with
      EditPage.IsReadOnly := True;
    end;
  end;

  if (EditPage <> nil) then
  begin
    SetActiveEditor(EditPage);
    ActiveEditor.GotoLine(AScriptPos.Line, AScriptPos.Col, AMoveCurrent);
  end;
end;

procedure TFormScriptDebugger.WMDpiChanged(var Message: TWMDpi);
begin
  inherited;

  FDPIScale := Monitor.PixelsPerInch / 96;

  NotifyEditors(ehNotifyDpiChanged);
end;

procedure TFormScriptDebugger.WMWindowPosChanged(var Msg: TWMWindowPosChanged);
begin
  // This is just here to experiment with solutions to the DevExpress ribbon form shadow appearing before the form
  inherited;
//  OutputDebugString(Format('%8.X', [Msg.WindowPos.flags]));
//  if (Msg.WindowPos.flags and $8100 = $8100) then
//  if (Msg.WindowPos.flags and $10000000 = $10000000) then
//    MessageBeep(1);
(*
 SetWindowPos undocumented flags
 #define SWP_NOCLIENTSIZE 0x0800
 #define SWP_NOCLIENTMOVE 0x1000
 #define SWP_STATECHANGED 0x8000
*)
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
  Breakpoint: TdwsDebuggerBreakpoint;
  WasAdded: Boolean;
  Index: Integer;
begin
  Breakpoint := TdwsDebuggerBreakpoint.Create;
  try
    Breakpoint.Line := ScriptPos.Line;
    Breakpoint.SourceName := ScriptPos.SourceName;

    NotifyBreakPoint(Breakpoint, dnBreakPointAdd);

    Index := Debugger.Breakpoints.AddOrFind(Breakpoint, WasAdded);

  finally
    if (not WasAdded) then
      Breakpoint.Free;
  end;

  Debugger.Breakpoints[Index].Enabled := AEnabled;

  if (ActiveEditor <> nil) then
    ActiveEditor.InvalidateLine(ScriptPos.Line);

  NotifyBreakPoint(Debugger.Breakpoints[Index], dnBreakPointAdded);

  Debugger.Breakpoints.BreakPointsChanged;
end;

procedure TFormScriptDebugger.ClearBreakpoint(const ScriptPos: TScriptPos);
var
  Test, Breakpoint: TdwsDebuggerBreakpoint;
  Index: Integer;
begin
  if (Debugger.Breakpoints.Count = 0) then
    Exit;

  Test := TdwsDebuggerBreakpoint.Create;
  try
    Test.Line := ScriptPos.Line;
    Test.SourceName := ScriptPos.SourceName;

    Index := Debugger.Breakpoints.IndexOf(Test);
  finally
    Test.Free;
  end;

  if (Index = -1) then
    exit;

  Breakpoint := Debugger.Breakpoints[Index];
  NotifyBreakPoint(Breakpoint, dnBreakPointRemove);

  Debugger.Breakpoints.Extract(Breakpoint);
  try

    NotifyBreakPoint(Breakpoint, dnBreakPointRemoved);

  finally
    Breakpoint.Free;
  end;

  if (ActiveEditor <> nil) then
    ActiveEditor.InvalidateLine(ScriptPos.Line);

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
      DebuggerNotify(dnUpdateWatches);
    end;
  finally
    Watch.Free;
  end;
end;

function TFormScriptDebugger.GetMainUnit: IScriptEditor;
begin
  Result := FMainUnit;

  if (Result = nil) then
    Result := ActiveEditor;
end;

procedure TFormScriptDebugger.SetMainUnit(const Value: IScriptEditor);
begin
  if (FMainUnit = Value) then
    exit;

  NotifyEditors(ehNotifyResetDebugState);
  ClearMessagesWindow;

  FMainUnit := Value;

  if (FMainUnit = nil) then
    FProgram := nil;

  PageControlEditor.ViewInfo.Calculate;
  PageControlEditor.InvalidateWithChildren;
end;

function TFormScriptDebugger.GetMainUnitName: string;
begin
  Result := FMainUnitName;

  if (Result = '') then
  begin
    if (FMainUnit <> nil) then
      Result := FMainUnit.UnitName;

    if (Result = '') then
      Result := SYS_MainModule;
  end;
end;

function TFormScriptDebugger.GetActiveEditor: IScriptEditor;
begin
  Result := FActiveEditor;
end;

procedure TFormScriptDebugger.SetActiveEditor(const Editor: IScriptEditor);
begin
  if (Editor = FActiveEditor) then
    exit;

  if (FActiveEditor <> nil) then
    FActiveEditor.EditorDeactivated;

  FActiveEditor := Editor;

  if (FActiveEditor <> nil) then
  begin
    var Container := ContainerByEditor(FActiveEditor);
    PageControlEditor.ActivePage := Container as TcxTabSheet;

    FActiveEditor.EditorActivated;
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
  CreateEditor(FileName, True, True);
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

procedure TFormScriptDebugger.BarButtonRibbonClick(Sender: TObject);
begin
  RibbonDebug.Visible := TdxBarButton(Sender).Down;
  BarManagerBarMainMenu.Visible := not RibbonDebug.Visible;
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.LoadLayouts;
var
  LayoutNames: TStringList;
  i: integer;
begin
  if (not ScriptSettings.Features.IDELayout) then
    exit;

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
  if (not ScriptSettings.Features.IDELayout) then
    exit;

  if (FLayoutName = '') then
    FLayoutName := sScriptDebuggerLayoutNameDefault;

  DockingManager.SaveLayoutToRegistry(ScriptSettings.Layout.KeyPath+FLayoutName);
end;

procedure TFormScriptDebugger.DockingManagerLayoutChanged(Sender: TdxCustomDockControl);
begin
  if (not FLayoutLoading) then
    BarComboLayout.ItemIndex := -1;
end;

procedure TFormScriptDebugger.BarComboLayoutChange(Sender: TObject);
begin
  if (not ScriptSettings.Features.IDELayout) then
    exit;

  if (BarComboLayout.Text = FLayoutName) then
    exit;

  if (BarComboLayout.ItemIndex <> -1) then
  begin
    FLayoutName := BarComboLayout.Text;

    FLayoutLoading := True;
    try
      DockingManager.LoadLayoutFromRegistry(ScriptSettings.Layout.KeyPath+FLayoutName);
    finally
      FLayoutLoading := False;
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
      IntersectRect(Ri, BoundsRect, Screen.Monitors[I].BoundsRect);

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
  if (not DockPanelMain.Active) then
    SaveActiveControl := nil;

  DockPanelMessages.Activate;

  if (SaveActiveControl <> nil) then
    ActiveControl := SaveActiveControl;

  ListViewMessages.Update;
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
  Stopwatch: TStopwatch;
  Duration: Int64;
begin
  if (not ABuild) and (IsCompiled) then
    exit;

  ActionJIT.Enabled := True;

  DebuggerNotify(dnCompiling);

  // Make the implicit "main unit" explicit.
  var Page := MainUnit;
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
  begin
    DebuggerNotify(dnCompiled);
    NotifyEditors(ehNotifyCompiled);
  end;
end;

// -----------------------------------------------------------------------------

function TFormScriptDebugger.ContainerByEditor(const AEditor: IScriptEditor): TWinControl;
begin
  for var Pair in FEditorContainers do
    if (Pair.Value = AEditor) then
      Exit(Pair.Key);
  Result := nil;
end;

function TFormScriptDebugger.EditorByContainer(const AContainer: TWinControl): IScriptEditor;
begin
  if (not FEditorContainers.TryGetValue(AContainer, Result)) then
    Result := nil;
end;

// -----------------------------------------------------------------------------

function TFormScriptDebugger.EditorByName(const AName: string): IScriptEditor;
begin
  for var Editor in FEditors do
    if AnsiSameText(Editor.UnitName, AName) then
      Exit(Editor);
  Result := nil;
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.CloseEditor(const AEditor: IScriptEditor);
begin
  var Container := ContainerByEditor(AEditor);
  FEditorContainers.Remove(Container);
  FEditors.Remove(AEditor);

  (AEditor as IScriptEditorInternal).Finalize;

  // Do not destroy the container until editor has had a chance to
  // detach the editor control from it.
  Container.Free;
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;

  if (Operation <> opRemove) then
    exit;

  if (not (AComponent is TWinControl)) then
    exit;

  var Editor: IScriptEditor;
  if (FEditorContainers <> nil) and (FEditorContainers.TryGetValue(TWinControl(AComponent), Editor)) then
  begin
    FEditorContainers.Remove(TWinControl(AComponent));
    FEditors.Remove(Editor);

    (Editor as IScriptEditorInternal).Finalize;
    Editor := nil;
  end;
end;

procedure TFormScriptDebugger.NotifyBreakPoint(Breakpoint: TdwsDebuggerBreakpoint; Notification: TScriptDebuggerBreakpointNotification; Updates: TBreakpointUpdates);
var
  Handler: IScriptDebuggerBreakPointHandler;
  DebuggerFrame: IScriptDebuggerWindow;
begin
  if (ActiveEditor <> nil) then
    ActiveEditor.InvalidateLine;

  for DebuggerFrame in FDebuggerFrames do
    if (Supports(DebuggerFrame, IScriptDebuggerBreakPointHandler, Handler)) then
      Handler.BreakPointNotification(Breakpoint, Notification, Updates);

  Debugger.Breakpoints.BreakPointsChanged;
end;

procedure TFormScriptDebugger.DebuggerNotify(Notification: TScriptDebuggerNotification);
begin
  if (FDebuggerSubscriptions <> nil) then
    for var Subscriber in FDebuggerSubscriptions.ToArray do
      Subscriber.ScriptDebuggerNotification(Notification);
end;

procedure TFormScriptDebugger.NotifyEditors(Notification: TScriptEditorHostNotification);
begin
  for var Editor in FEditors.ToArray do
    Editor.HostNotification(Notification);
end;

function TFormScriptDebugger.EditorPagesCloseAll(const AExceptEditor: IScriptEditor): boolean;
begin
  Result := True;
  for var Editor in FEditors.ToArray do
    if (Editor <> AExceptEditor) then
      EditorPageClose(Editor);
end;

function TFormScriptDebugger.EditorPagesCloseQuery(const AExceptEditor: IScriptEditor): boolean;
begin
  Result := True;
  for var Editor in FEditors.ToArray do
    if (Editor <> AExceptEditor) then
    begin
      Result := Editor.CloseQuery;
      if (not Result) then
        exit;
    end;
end;

procedure TFormScriptDebugger.EditorSaveAllIfModified(APromptOverwrite: Boolean);
begin
  for var Editor in FEditors.ToArray do
    if (Editor.Modified) then
      SavePage(Editor);
end;

procedure TFormScriptDebugger.SavePage(const Page: IScriptEditor);
begin
  if (Page.ScriptProvider = nil) then
    ActiveEditor._SaveAs
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

    NotifyEditors(ehNotifyResetDebugState); // TODO : Why?

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
begin
  Result := ActiveEditor.HasSelection;

  if Result then
  begin
    var S := ActiveEditor.SelectedText;
    if IsValidIdentifier(S) then
      RunFunctionMethodByName(ActiveEditor.InternalUnitName, S, ADebug, True {prompt});
  end;
end;

type
  TdwsCompilerCracker = class(TdwsCompiler);

procedure TFormScriptDebugger.ListSymbols;
begin
  DockPanelSymbols.Visible := True;
end;

procedure TFormScriptDebugger.ClearCurrentLine;
begin
  for var Editor in FEditors do
    Editor.GotoLine(-1);
end;

procedure TFormScriptDebugger.ClearAllBreakpoints;
begin
  Debugger.Breakpoints.Clean;
  NotifyBreakPoint(nil, dnBreakPointsClear);

  NotifyEditors(ehNotifyInvalidate);
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
begin
  Result := nil;

  var Editor := EditorByName(UnitName);
  if (Editor = nil) and (UnitName = MSG_MainModule) and (FMainUnitName <> '') then
    Editor := EditorByName(FMainUnitName);

  if (Editor <> nil) then
    unitSource := Editor.Script;
end;

procedure TFormScriptDebugger.DoSearch(AOptions: TSearchReplaceOptions; First: boolean);
begin
  var Editor := ActiveEditor;

  if (Editor.SearchReplace(FSearchText, '', AOptions) <> 0) then
    exit;

  if (FSearchAutoWrap) then
  begin
    var SavePos := Editor.CaretPos;
    if (Editor.SearchReplace(FSearchText, '', AOptions + [srEntireScope]) <> 0) then
    begin
      if (Editor.CaretPos = SavePos) then
        AddAlertMessage('Find', 'No more matches', -1, 1000);
      exit;
    end;
  end;

  AddAlertMessage('Find', 'Search text not found', -1, 1000);

  if (srBackwards in AOptions) then
    Editor.BlockEnd := Editor.BlockBegin
  else
    Editor.BlockBegin := Editor.BlockEnd;

  Editor.CaretPos := Editor.BlockBegin;
end;

function TFormScriptDebugger.DpiScale(Value: Integer): Integer;
begin
  if (FDPIScale = 0.0) then
    FDPIScale := Monitor.PixelsPerInch / 96;

  Result := Round(Value * FDPIScale);
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
      if (FileIsOpenInEditor(DropFileTarget1.Files[i])) or (CreateEditor(DropFileTarget1.Files[i], True, True) <> nil) then
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
  if (not DockPanelMain.Active) then
    SaveActiveControl := nil;

  DockPanelOutput.Activate;

  if (SaveActiveControl <> nil) then
    ActiveControl := SaveActiveControl;
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
    FPendingExceptionMsg := Format('Exception "%s" caught', [exceptObj.TypeSym.Name]);
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
        DebuggerNotify(dnDebugRun);
      end;

    dsDebugSuspending:
      begin
        DebuggerNotify(dnDebugSuspending);
      end;

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
        DebuggerNotify(dnDebugSuspended);
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
      begin
        // Never happens. Transition from dsDebugResuming to dsDebugRun is handled internally in the debugger
        DebuggerNotify(dnDebugResuming);
      end;

    dsIdle,
    dsDebugDone:
      begin
        if (Debugger.State = dsIdle) then
          DebuggerNotify(dnIdle)
        else
          DebuggerNotify(dnDebugDone);
        ClearCurrentLine;
        UpdateDebugWindows;
        RibbonDebug.ActiveTab := RibbonTabEditor;
        if (not IsWindowEnabledEx(Handle)) then
          EnableWindow(Handle, True);

//        ActionLayoutDefaultDebug.Visible := False;
//        ActionLayoutDefaultEdit.Visible := True;
        // Switch to edit layout
        if (ScriptSettings.Features.IDELayout) then
          BarComboLayout.Text := ScriptSettings.Layout.EditLayout;
      end
  end;

  UpdateActions;
  FPreviousDebuggerState := Debugger.State;
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

function TFormScriptDebugger.EditorActionHandler(const AEditor: IScriptEditor; AAction: TScriptEditorAction): boolean;

  procedure HandleOpenFileUnderCursor;
  var
    ScriptProgram: IdwsProgram;
    Symbol: TSymbol;
    WordStart: TBufferPos;
  begin
    ScriptProgram := GetCompiledScript;
    if (ScriptProgram = nil) then
      Exit;

    WordStart := AEditor.WordStart(AEditor.CaretPos);
    Symbol := ScriptProgram.SymbolDictionary.FindSymbolAtPosition(WordStart.Column, WordStart.Line, AEditor.InternalUnitName);

    if (Symbol is TUnitMainSymbol) then
    begin
      CreateEditor(TUnitMainSymbol(Symbol).Name);
      // eventually move caret position here...
    end;
  end;

  procedure HandleToggleDeclImpl;
  var
    ScriptProgram: IdwsProgram;
    ScriptPos: TScriptPos;
    Symbol: TSymbol;
    SymDict: TdwsSymbolDictionary;
    BufferPos: TBufferPos;
    Context: TdwsSourceContext;
    SymbolPositionList: TSymbolPositionList;
    SymbolPosition: TSymbolPosition;
  begin
    ScriptProgram := GetCompiledScript;
    if (ScriptProgram = nil) then
      Exit;

    SymDict := ScriptProgram.SymbolDictionary;
    Assert(SymDict <> nil);

    BufferPos := AEditor.CaretPos;
    Context := ScriptProgram.SourceContextMap.FindContext(BufferPos.Column, BufferPos.Line, AEditor.InternalUnitName);

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
              // TODO -cRevival : We should take advantage of new DeclarationPosition etc.
              ScriptPos := TFuncSymbol(Symbol).DeclarationPosition;

            if (ScriptPos.Line > 0) and (ScriptPos.Col > 0) then
            begin
              BufferPos.Line := ScriptPos.Line;
              BufferPos.Column := ScriptPos.Col;
              AEditor.CaretPos := BufferPos;
              Exit;
            end;
          end;
        end;
      end;

      Context := Context.Parent;
    end;
  end;

  procedure HandleContextHelp;
  var
    ScriptProgram: IdwsProgram;
    Symbol: TSymbol;
    i: integer;
    ChildSymbol: TCompositeTypeSymbol;
    WordStart: TBufferPos;
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
    var BufferPos := AEditor.CaretPos;
    Keyword := AEditor.WordAt(BufferPos);

    if (Keyword = '') and (BufferPos.Column > 1) then
    begin
      Dec(BufferPos.Column);
      // Try one char to the left in case we're positioned just past the end of the word
      Keyword := AEditor.WordAt(BufferPos);
    end;

    //PerformSearch := True;

    ScriptProgram := GetCompiledScript;
    if (ScriptProgram <> nil) then
    begin
      WordStart := AEditor.WordStart(BufferPos);
      UnitName := AEditor.InternalUnitName;

      Symbol := ScriptProgram.SymbolDictionary.FindSymbolAtPosition(WordStart.Column, WordStart.Line, UnitName);
      if (Symbol = nil) and (UnitName <> MSG_MainModule) then
        Symbol := ScriptProgram.SymbolDictionary.FindSymbolAtPosition(WordStart.Column, WordStart.Line, MSG_MainModule);

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
        if (ScriptSettings.Features.PackageInstaller) then
          NeedDownload := PackageInstallerService.AutoUpdateCheck(sPackageIDAppScriptHelpRtl, DownloadURL, [], 'script RTL help file')
        else
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
        if (ScriptSettings.Features.PackageInstaller) then
          DownloadIsPackage := (AnsiSameText(URLExtractFileExt(DownloadURL), sPackageInstallerFileType))
        else
  {$else FEATURE_PACKAGE_INSTALLER}
          DownloadIsPackage := False;
  {$endif FEATURE_PACKAGE_INSTALLER}

        if (DownloadIsPackage) then
          HelpDownloadPackage := ExtractFilePath(HelpDownloadFilename) + URLExtractFilename(DownloadURL)
        else
          HelpDownloadPackage := HelpDownloadFilename;

  {$ifdef FEATURE_PACKAGE_INSTALLER}
        if (ScriptSettings.Features.PackageInstaller) then
          PackageInstallerService.AutoUpdateExecute(DownloadURL, HelpDownloadPackage, DownloadIsPackage)
        else
  {$else FEATURE_PACKAGE_INSTALLER}
        begin
          ShowMessage('Auto update feature not enabled - Help will not be available');
          Abort;
        end;
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

begin
  case AAction of
    seActionGotoLineNumber:
      begin
        if (GotoForm.ShowModal = mrOK) then
          AEditor.GotoLine(GotoForm.LineNumber);
        Result := True;
      end;

    seActionOpenFileUnderCursor:
      begin
        HandleOpenFileUnderCursor;
        Result := True;
      end;

    seActionToggleDeclImpl:
      begin
        HandleToggleDeclImpl;
        Result := True;
      end;

    seActionRepeatSearch:
      begin
        if (FSearchText <> '') then
          DoSearch(FSearchOptions - [srEntireScope], False);
        Result := True;
      end;

//    seActionToggleBreakPoint,
//    seActionAutoCompletionPropose:

    seActionContextHelp:
      if (ScriptSettings.Features.OnlineHelp) then
      begin
        HandleContextHelp;
        Result := True;
      end;

    seActionSelectNextTab:
      begin
        PageControlEditor.SelectNextPage(True);
        Result := True;
      end;

    seActionSelectPrevTab:
      begin
        PageControlEditor.SelectNextPage(False);
        Result := True;
      end;
  else
    Result := False;
  end;
end;

procedure TFormScriptDebugger.ScriptEditorNotification(const AEditor: IScriptEditor; ANotification: TScriptEditorNotification);
begin
  case ANotification of
    seNotifyInitialize:
      ;

    seNotifyFinalize:
      begin
        AEditor.Unsubscribe(Self);

        if (FMainUnit = AEditor) then
          FMainUnit := nil;

        if (FActiveEditor = AEditor) then
          FActiveEditor := nil;
      end;

    seNotifySaving,
    seNotifySaved:
      ;
    seNotifyChanged:
      EditorChange(AEditor);
  end;
end;

procedure TFormScriptDebugger.EditorChange(const AEditor: IScriptEditor);
begin
  var Container := ContainerByEditor(AEditor) as TcxTabSheet;

  // Force recalc of tab caption width (bold text is wider than normal text)
  Container.PageControl.ViewInfo.Calculate;
  // Redraw
  Container.PageControl.Invalidate;

  if IsCompiled then
  begin
    NotifyEditors(ehNotifyResetDebugState);
    ClearMessagesWindow;
    FProgram := nil;
  end;
  //FScript.NotifyScriptModified;
end;

function TFormScriptDebugger.FileIsOpenInEditor(const AFileName: TFileName; Activate: boolean): Boolean;
begin
  Result := False;
  for var Editor in FEditors do
    if AnsiSameText(AFileName, Editor.FileName) then
    begin
      if (Activate) then
        SetActiveEditor(Editor);
      Result := True;
      break;
    end;
end;

function TFormScriptDebugger.HasEditorPage: Boolean;
begin
  Result := (FActiveEditor <> nil);
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

procedure TFormScriptDebugger.UpdateTimerTimer(Sender: TObject);

  procedure UpdateStatusBarPanels;
  resourcestring
    SModified  = 'Modified';
    SInsert    = 'Insert';
    SOverwrite = 'Overwrite';
    SReadOnly  = 'Read Only';
  const
    MacroRecorderStates: array[ TSynMacroState ] of string = (
      'Stopped', 'Recording', 'Playing', 'Paused');
  begin
    var Editor := ActiveEditor;

    if Editor <> nil then
    begin
      var CaretPos := Editor.CaretPos;

      if (CaretPos.Column > 0) and (CaretPos.Line > 0) then
        StatusBar.Panels[0].Text := Format(' %6d:%3d ', [CaretPos.Line, CaretPos.Column])
      else
        StatusBar.Panels[0].Text := '';

      if Editor.Modified then
        StatusBar.Panels[1].Text := SModified
      else
        StatusBar.Panels[1].Text := '';

      if Editor.IsReadOnly then
        StatusBar.Panels[2].Text := SReadOnly
      else
      if Editor.InsertMode then
      begin
        if DataModuleEditorSynEditData.SynMacroRecorder.State <> msStopped then
          StatusBar.Panels[2].Text := UpperCase(MacroRecorderStates[DataModuleEditorSynEditData.SynMacroRecorder.State])
        else
          StatusBar.Panels[2].Text := SInsert
      end else
        StatusBar.Panels[2].Text := SOverwrite;
    end else
    begin
      StatusBar.Panels[0].Text := '';
      StatusBar.Panels[1].Text := '';
      StatusBar.Panels[2].Text := '';
    end;
  end;

begin
  UpdateStatusBarPanels;
end;

{$ifdef SHELL_EXPLORER}
procedure TFormScriptDebugger.ShellListViewFileExplorerExecuteItem(Sender: TObject; APIDL: PItemIDList; var AHandled: Boolean);
begin
  AHandled := True;
  var Filename := GetPidlName(APIDL);

  if (not FileIsOpenInEditor(Filename, True)) then
    CreateEditor(Filename, True, True);
end;
{$endif SHELL_EXPLORER}

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

procedure TFormScriptDebugger.EditorPageClose(const AEditor: IScriptEditor);
begin
  if (AEditor = nil) then
    Exit;

  if (not AEditor.CanClose) then
    exit;

  if (not AEditor.CloseQuery) then
    exit;

  CloseEditor(AEditor);
end;

function TFormScriptDebugger.CreateEditor(const AName, AScript: string): IScriptEditor;
begin
  Result := CreateEditor;

  if (AnsiSameText(ExtractFileExt(AName), sScriptFileType)) then
  begin
    Result.Caption := '';
    Result.FileName := AName;
  end else
    Result.Caption := AName;

  Result.Script := AScript;
end;

function TFormScriptDebugger.CreateEditor(const ScriptProvider: IScriptProvider): IScriptEditor;
const
  sScriptNewUnitNameTemplate = 'unit%d';
begin
  var TabSheet := TcxTabSheet.Create(Self);
  try

    var MenuLink := BarManager.PopupMenuLinks.Add;
    try
      MenuLink.Control := TabSheet;
      MenuLink.PopupMenu := PopupMenuEditorTabs;

      Result := ScriptEditorFactory.CreateEditor(Self, TabSheet);
    except
      MenuLink.Free;
      raise;
    end;
  except
    TabSheet.Free;
    raise;
  end;

  var i := 1;
  while (True) do
  begin
    var UnitName := Format(sScriptNewUnitNameTemplate, [i]);
    if (EditorByName(UnitName) = nil) then
    begin
      Result.FileName := UnitName + sScriptFileType;
      break;
    end;
    Inc(i);
  end;

  FEditorContainers.Add(TabSheet, Result);
  FEditors.Add(Result);

  Result.Subscribe(Self);

  try
    ASSERT(FEditorContainers.Count = FEditors.Count);

    TabSheet.PageControl := PageControlEditor;

    if (ScriptProvider <> nil) then
    begin
      Result.Caption := '';
      Result.ScriptProvider := ScriptProvider;
    end;

    if (ScriptProvider <> nil) then
    begin
      var Filename := ScriptProvider.ScriptName;
      if (Filename <> '') then
      begin
        if (ExtractFileExt(Filename) <> sScriptFileType) then
          Filename := Filename + sScriptFileType;

        Filename := IncludeTrailingPathDelimiter(ScriptProvider.Folder) + Filename;

        AddRecentFile(Filename);
      end;
    end;

    (Result as IScriptEditorInternal).Initialize(DataModuleDebuggerViewData.SmallImages);

    TabSheet.AllowCloseButton := Result.CanClose;

    SetActiveEditor(Result);
  except
    CloseEditor(Result);
    raise;
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

function TFormScriptDebugger.CreateEditor(const AFileName: TFileName; ALoadFile, AFileRequired: Boolean; const CurrentScriptProvider: IScriptProvider): IScriptEditor;
var
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

  Result := CreateEditor(ScriptProvider);

  Result.Caption := '';
  Result.FileName := AFilename;

  AddRecentFile(Filename);
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
  DockPanelBreakPoints.Visible := TAction(Sender).Checked;
end;

procedure TFormScriptDebugger.ActionViewBreakpointsUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := DockPanelBreakPoints.Visible;
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

procedure TFormScriptDebugger.ActionViewMainMenuExecute(Sender: TObject);
begin
  ScriptSettings.Forms.Main.DisplayMainMenu := TAction(Sender).Checked;

  RibbonDebug.Visible := not ScriptSettings.Forms.Main.DisplayMainMenu;
  BarManagerBarMainMenu.Visible := ScriptSettings.Forms.Main.DisplayMainMenu;
end;

procedure TFormScriptDebugger.ActionViewMainMenuUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := ScriptSettings.Forms.Main.DisplayMainMenu;
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

procedure TFormScriptDebugger.ActionViewProjectSourceUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := False;//(ProjectFileName <> '');
end;

procedure TFormScriptDebugger.ActionViewRibbonExecute(Sender: TObject);
begin
  ScriptSettings.Forms.Main.DisplayMainMenu := not TAction(Sender).Checked;

  RibbonDebug.Visible := not ScriptSettings.Forms.Main.DisplayMainMenu;
  BarManagerBarMainMenu.Visible := ScriptSettings.Forms.Main.DisplayMainMenu;
end;

procedure TFormScriptDebugger.ActionViewRibbonUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := not ScriptSettings.Forms.Main.DisplayMainMenu;
end;

function TFormScriptDebugger.CreateEditor(const AName: string; FileMustExist: boolean; const CurrentScriptProvider: IScriptProvider): Boolean;
var
  s: string;
begin
  var Editor := EditorByName(AName);

  if (Editor = nil) and (AName = MSG_MainModule) and (FMainUnitName <> '') then
    Editor := EditorByName(FMainUnitName);

  Result := (Editor <> nil);

  if Result then
    SetActiveEditor(Editor)
  else
  begin
    if (AnsiSameText(ExtractFileExt(AName), sScriptFileType)) then
      s := AName
    else
      s := AName + sScriptFileType;

    Editor := CreateEditor(s, True, FileMustExist, CurrentScriptProvider);

    Result := (Editor <> nil);
  end;
end;

procedure TFormScriptDebugger.PageControlEditorCanCloseEx(Sender: TObject; ATabIndex: Integer; var ACanClose: Boolean);
begin
  var Container := PageControlEditor.Pages[ATabIndex];
  var Editor := EditorByContainer(Container);

  EditorPageClose(Editor);
  Editor := nil;

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
begin
  if (ATab.Index = cxPCNewButtonIndex) then
    exit;

  var Editor := EditorByContainer(AControl);
  if (Editor <> nil) and (Editor.Modified) then
    Font.Style := Font.Style + [fsBold];
end;

procedure TFormScriptDebugger.PageControlEditorGetImageIndex(Sender: TObject; TabIndex: Integer; var ImageIndex: Integer);
begin
  if (TabIndex = cxPCNewButtonIndex) then
  begin
    ImageIndex := ImageIndexFileTypeScriptNew;
    exit;
  end;

  var MainEditor := MainUnit;
  var Container := PageControlEditor.Pages[TabIndex];

  var Editor := EditorByContainer(Container);

  if (MainEditor <> nil) and (MainEditor = Editor) then
  begin
    if (FMainUnit <> nil) then
      ImageIndex := ImageIndexFileTypeScriptMain
    else
      ImageIndex := ImageIndexFileTypeScript;
  end else
    ImageIndex := -1;
end;

procedure TFormScriptDebugger.PageControlEditorMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (ssDouble in Shift) then
  begin
    var Index := PageControlEditor.ViewInfo.IndexOfTabAt(X, Y);
    if (Index >= 0) then
      MainUnit := EditorByContainer(PageControlEditor.Pages[Index]);
  end;
end;

procedure TFormScriptDebugger.PageControlEditorNewTabButtonClick(Sender: TObject; var AHandled: Boolean);
begin
  AHandled := True;
  ActionFileNewUnit.Execute;
end;

function TFormScriptDebugger.PromptSaveScript(var Filename: string; const Foldername: string): boolean;
begin
  if (Foldername <> '') then
    SaveSourceDialog.DefaultFolder := FolderName;

  SaveSourceDialog.FileName := Filename;

  Result := SaveSourceDialog.Execute;

  if (Result) then
    Filename := SaveSourceDialog.FileName;
end;

function TFormScriptDebugger.ModifyFileNameToUniqueInProject(const AFileName: TFileName): string;
// if exists, increments any trailing number after the file name
// until the name is unique in the name's folder. if no trailing number
// adds '1'.
var
  Index: Integer;
  Path, FileName, FileType: string;
begin
  Result := AFileName;
  Index := 0;
  while FileIsOpenInEditor(Result) do
  begin
    Inc(Index);
    Path := ExtractFileDir(Result) + '\';
    FileName := JustFileName(Result);
    while (FileName <> '') and CharInSet(FileName[Length(FileName) - 1], ['0'..'9']) do
      Delete(FileName, Length(FileName) - 1, 1);

    FileType := ExtractFileExt(Result);
    Result := Path + FileName + IntToStr(Index) + FileType;
  end;
end;

function TFormScriptDebugger.GetEditorPagePopupMenu: TPopupMenu;
begin
  Result := EditorPagePopupMenu;
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
    Lines := Breakpointables.SourceLines[AUnitName];
    if (Lines <> nil) then
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
  EditorActionHandler(ActiveEditor, seActionGotoLineNumber);
end;

procedure TFormScriptDebugger.ActionGotoLineNumberUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (ActiveEditor <> nil);
end;

procedure TFormScriptDebugger.ActionJITExecute(Sender: TObject);
begin
  // Require recompile if we disable the jitter
  if (TAction(Sender).Checked) and IsCompiled then
    FProgram := nil;
end;

procedure TFormScriptDebugger.ActionJITUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (Debugger.State in [dsIdle, dsDebugDone]);
end;

procedure TFormScriptDebugger.ActionDummyExecute(Sender: TObject);
begin
  //
end;

procedure TFormScriptDebugger.ActionBuildExecute(Sender: TObject);
begin
  Compile(True);
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
  ActiveEditor.CopyToClipboard;
end;

procedure TFormScriptDebugger.ActionEditCopyToClipboardUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (ActiveEditor <> nil) and (ActiveEditor.HasSelection);
end;

procedure TFormScriptDebugger.ActionEditCutExecute(Sender: TObject);
begin
  ActiveEditor.CutToClipboard;
end;

procedure TFormScriptDebugger.ActionEditCutUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (ActiveEditor <> nil) and (not ActiveEditor.IsReadOnly) and (ActiveEditor.HasSelection);
end;

procedure TFormScriptDebugger.ActionEditDeleteExecute(Sender: TObject);
begin
  ActiveEditor.SelectedText := '';
end;

procedure TFormScriptDebugger.ActionEditDeleteUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (ActiveEditor <> nil) and (not ActiveEditor.IsReadOnly) and (ActiveEditor.HasSelection);
end;

procedure TFormScriptDebugger.ActionEditPasteExecute(Sender: TObject);
begin
  ActiveEditor.PasteFromClipboard;
end;

procedure TFormScriptDebugger.ActionEditPasteUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (ActiveEditor <> nil) and (not ActiveEditor.IsReadOnly) and (ActiveEditor.CanPaste);
end;

procedure TFormScriptDebugger.ActionEditSelectAllExecute(Sender: TObject);
begin
  ActiveEditor.SelectAll;
end;

procedure TFormScriptDebugger.ActionEditSelectAllUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (ActiveEditor <> nil);
end;

procedure TFormScriptDebugger.ActionCloseAllOtherPagesExecute(Sender: TObject);
begin
  if (not EditorPagesCloseQuery(FActiveEditor)) then
    exit;
  EditorPagesCloseAll(FActiveEditor);
end;

procedure TFormScriptDebugger.ActionCloseAllOtherPagesUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (FEditors.Count > 1);
end;

procedure TFormScriptDebugger.ActionExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TFormScriptDebugger.ActionClosePageExecute(Sender: TObject);
begin
  EditorPageClose(FActiveEditor);
end;

procedure TFormScriptDebugger.ActionClosePageUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (FActiveEditor <> nil) and (FActiveEditor.CanClose);
end;

procedure TFormScriptDebugger.ActionDebugBreakOnPoopExecute(Sender: TObject);
begin
  Debugger.SuspendOnException := TAction(Sender).Checked;
end;

procedure TFormScriptDebugger.ActionDebugEvaluateExecute(Sender: TObject);
var
  Expression: string;
  ScriptProgram: IdwsProgram;
  CursorPos: TBufferPos;
  ScriptPos: TScriptPos;
  SourceItem: TScriptSourceItem;
  Symbol: TSymbol;
begin
  ScriptProgram := GetCompiledScript;
  if (ScriptProgram = nil) then
    Exit;

  if (ActiveEditor.HasSelection) then
    Expression := ActiveEditor.SelectedText
  else
    Expression := '';

  ScriptPos := cNullPos;

  if (Expression = '') then
  begin
    CursorPos := ActiveEditor.CaretPos;
    CursorPos := ActiveEditor.WordStart(CursorPos);

    Expression := '';

    SourceItem := ScriptProgram.SourceList.FindScriptSourceItem(ActiveEditor.GetFilename);

    if (SourceItem = nil) and (ActiveEditor = FMainUnit) then
      SourceItem := ScriptProgram.SourceList.MainScript;

    if (SourceItem <> nil) then
    begin

      ScriptPos := TScriptPos.Create(SourceItem.SourceFile, CursorPos.Line, CursorPos.Column);

      Symbol := ScriptProgram.SymbolDictionary.FindSymbolAtPosition(ScriptPos);

      if (Symbol <> nil) then
        Expression := Symbol.QualifiedName;
    end;
  end;

  if (Expression = '') then
    Expression := ActiveEditor.WordAt(ActiveEditor.CaretPos);

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

type
  TDataContextCracker = class(TDataContext);

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
      s := Format('%.2d : %s (%d references)', [Count, ScriptObj.ClassSym.Name, TDataContextCracker(Obj).RefCount-1]);
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
end;

procedure TFormScriptDebugger.ActionFileCloseAllUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (FEditors.Count > 1) or ((FEditors.Count = 1) and (FActiveEditor <> nil) and (FActiveEditor.CanClose));
end;

procedure TFormScriptDebugger.ActionFileMainUnitExecute(Sender: TObject);
begin
  MainUnit := ActiveEditor;
end;

procedure TFormScriptDebugger.ActionFileMainUnitUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (FActiveEditor <> nil) and (Debugger.State in [dsIdle, dsDebugDone]);
  TAction(Sender).Checked := (FMainUnit <> nil) and (FActiveEditor = FMainUnit);
end;

procedure TFormScriptDebugger.ActionFileNewIncludeFileExecute(Sender: TObject);
var
  sFileName: TFileName;
begin
  sFileName := 'IncludeFile1.inc';
  sFileName := ModifyFileNameToUniqueInProject(sFileName);

  CreateEditor(sFileName, False);
end;

procedure TFormScriptDebugger.ActionFileNewUnitExecute(Sender: TObject);
begin
  CreateEditor;
end;

procedure TFormScriptDebugger.ActionFileSaveAsAttachmentExecute(Sender: TObject);
var
  Name: string;
  Attachment: IScriptHostFile;
  Stream: TStream;
begin
  if not HasEditorPage then
    exit;

  Name := TPath.GetFileName(ActiveEditor.FileName);

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
        ActiveEditor.SaveToStream(Stream);
      finally
        Stream.Free;
      end;

      if (AnsiSameText(ExtractFileExt(Name), sScriptFileType)) then
      begin
        ActiveEditor.Caption := '';
        ActiveEditor.FileName := Name;
      end else
        ActiveEditor.Caption := Name;

      var SavePos := ActiveEditor.CaretPos;
      ActiveEditor.ScriptProvider := Attachment.CreateScriptProvider;
      ActiveEditor.CaretPos := SavePos;

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
  TAction(Sender).Enabled := (ScriptHostApplication <> nil) and (ScriptHostApplication.HasDocuments) and
    (ScriptHostApplication.ActiveDocument <> nil) and (ScriptHostApplication.ActiveDocument.AllowEdit);
end;

procedure TFormScriptDebugger.ActionFileSaveAsFileExecute(Sender: TObject);
begin
  if HasEditorPage then
    ActiveEditor._SaveAs;
end;

procedure TFormScriptDebugger.ActionFileSaveAsFileUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := HasEditorPage;
end;

procedure TFormScriptDebugger.ActionFileSaveExecute(Sender: TObject);
begin
  if HasEditorPage then
    SavePage(ActiveEditor);
end;

procedure TFormScriptDebugger.ActionFileSaveUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (ActiveEditor <> nil) and (ActiveEditor.Modified);
end;

procedure TFormScriptDebugger.ActionGotoDeclarationExecute(Sender: TObject);
begin
  ActiveEditor.FindDeclaration(ActiveEditor.CaretPos, suDeclaration);
end;

procedure TFormScriptDebugger.ActionGenericUpdateHasEditor(Sender: TObject);
begin
  TAction(Sender).Enabled := (ActiveEditor <> nil);
end;

procedure TFormScriptDebugger.ActionGotoImplementationExecute(Sender: TObject);
begin
  ActiveEditor.FindDeclaration(ActiveEditor.CaretPos, suImplementation);
end;

procedure TFormScriptDebugger.ActionOpenFileExecute(Sender: TObject);
var
  Filename: TFileName;
  i: Integer;
begin
  if (ActiveEditor <> nil) then
  begin
    if (ActiveEditor.ScriptProvider <> nil) then
      Filename := ActiveEditor.ScriptProvider.Folder
    else
      Filename := TPath.GetDirectoryName(ActiveEditor.Filename);

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
      CreateEditor(Filename, True);
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
    if (ScriptSettings.Features.IDELayout) then
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

  var DebuggerNotification: IScriptDebuggerNotification;
  if (Supports(DebuggerFrame, IScriptDebuggerNotification, DebuggerNotification)) then
  begin
    DebuggerNotification.ScriptDebuggerNotification(sdNotifyFinalize);
    DebuggerNotification := nil;
  end;

  if (Supports(DebuggerFrame, IScriptDebuggerWindow, DebuggerWindow)) then
  begin
    FDebuggerFrames.Remove(DebuggerWindow);
    DebuggerWindow := nil;
    FreeAndNil(DebuggerFrame);
  end;
end;

procedure TFormScriptDebugger.DockPanelDebugFrameVisibleChanged(Sender: TdxCustomDockControl);
var
  DebuggerFrameClassName: string;
  DebuggerFrameClass: TControlClass;
  DebuggerFrame: TControl;
  DebuggerWindow: IScriptDebuggerWindow;
begin
  if (not FLayoutLoading) then
    BarComboLayout.ItemIndex := -1;

  if (not Sender.Visible) then
    exit;

  if (Sender.ControlCount > 0) then
    exit;

  DebuggerFrameClassName := Sender.HelpKeyword;
  DebuggerFrameClass := TControlClass(FindClass(DebuggerFrameClassName));

  // Look for existing frame
  for DebuggerWindow in FDebuggerFrames do
    if (TObject(DebuggerWindow) is DebuggerFrameClass) then
    begin
      TControl(DebuggerWindow).Show;
      exit;
    end;

  // Create new frame
  DebuggerFrame := DebuggerFrameClass.Create(Self);
  DebuggerFrame.Parent := Sender;

  DebuggerWindow := DebuggerFrame as IScriptDebuggerWindow;
  FDebuggerFrames.Add(DebuggerWindow);

  DebuggerWindow.Initialize(Self, DataModuleDebuggerViewData.SmallImages, DataModuleDebuggerViewData.ImageListSymbols);

  if (FProgram <> nil) then
    Update;
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.DockPanelDebugOtherVisibleChanged(Sender: TdxCustomDockControl);
begin
  if (not FLayoutLoading) then
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

  AddStatusMessage(RStrRunning);

  Exec := FProgram.CreateNewExecution;
  Exec.Environment := Environment;

  if (ADebug) then
    AddMessage('Running program in debugger', mkInfo)
  else
    AddMessage('Running program', mkInfo);

  if (ActionJIT.Checked) and (ActionJIT.Enabled) then
  begin
    AddMessage('Applying jitter', mkInfo);
{$ifdef WIN32}
    var Jitter := TdwsJITx86.Create;
{$endif}
{$ifdef WIN64}
    var Jitter := TdwsJITx86_64.Create;
{$endif};
    Jitter.Options := Jitter.Options - [jitoNoBranchAlignment];
    Jitter.GreedyJIT(FProgram.ProgramObject);
    Jitter.Free;

    // We will need a recompile before jitter can be applied again
    ActionJIT.Enabled := False;
  end;

  TdwsProgramExecution(Exec).OnExecutionStarted := DoOnExecutionStarted;
  TdwsProgramExecution(Exec).OnExecutionEnded := DoOnExecutionEnded;

  Result := True;

  try
    // Switch to debug layout
    if (ScriptSettings.Features.IDELayout) then
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
      if (ScriptSettings.Features.IDELayout) then
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
  CursorPos: TBufferPos;
  Symbol: TSymbol;
  SymbolPositionList: TSymbolPositionList;
  NewName: string;
  CurrentFilename: string;
  SymbolPosition: TSymbolPosition;
  s: string;
  EditPage: IScriptEditor;
  List: TList<TSymbolPosition>;
  ScriptPos: TScriptPos;
  DeclarationFound: boolean;
  CurrentScriptProvider: IScriptProvider;
begin
  ScriptProgram := GetCompiledScript;
  if (ScriptProgram = nil) then
    Exit;

  CursorPos := ActiveEditor.CaretPos;
  CursorPos := ActiveEditor.WordStart(CursorPos);

  Symbol := ScriptProgram.SymbolDictionary.FindSymbolAtPosition(CursorPos.Column, CursorPos.Line, ActiveEditor.InternalUnitName);
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

    CurrentScriptProvider := ActiveEditor.ScriptProvider;

    CurrentFilename := '';
    EditPage := nil;

    for SymbolPosition in List do
    begin
      s := UnitNameFromScriptPos(SymbolPosition.ScriptPos);

      if (s <> CurrentFilename) then
      begin
        CurrentFilename := s;

        EditPage := EditorByName(CurrentFilename);
        if (EditPage = nil) then
        begin
          EditPage := CreateEditor(SymbolPosition.ScriptPos.SourceName, True, True, CurrentScriptProvider);
          if (EditPage = nil) then
            continue;

          if (not EditPage.HasProvider) then
          begin
            EditPage.Script := SymbolPosition.ScriptPos.SourceCode;
            EditPage.IsReadOnly := True;
          end;
        end;
      end;

      if (EditPage = nil) then
        exit;

      s := EditPage.Lines[SymbolPosition.ScriptPos.Line-1];

      s := Copy(s, 1, SymbolPosition.ScriptPos.Col-1) + NewName + Copy(s, SymbolPosition.ScriptPos.Col+Length(Symbol.Name), MaxInt);

      EditPage.Lines[SymbolPosition.ScriptPos.Line-1] := s;
      EditPage.MarkModified(SymbolPosition.ScriptPos.Line-1);

      ScriptPos := TScriptPos.Create(SymbolPosition.ScriptPos.SourceFile, SymbolPosition.ScriptPos.Line, SymbolPosition.ScriptPos.Col);
      AddMessage(Format('Renamed symbol [%s, line: %d, column: %d]', [EditPage.UnitName, SymbolPosition.ScriptPos.Line, SymbolPosition.ScriptPos.Col]), ScriptPos, mkInfo);
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
  AddMessage(Format('Normalized case [%s, line: %d, column: %d]: %s', [ActiveEditor.UnitName, Line, Col, Name]), ScriptPos, mkInfo);
  ActiveEditor.MarkModified(Line-1);
  // This sucks. We might not be operating on the main unit so blah blah...
  FMainUnitName := ActiveEditor.UnitName;
end;

procedure TFormScriptDebugger.ActionRefactorNormalizeCaseExecute(Sender: TObject);
var
  SourceFile: TSourceFile;
begin
  FCaseNormalizeScriptProgram := GetCompiledScript;
  try
    SourceFile := FCaseNormalizeScriptProgram.SourceList.MainScript.SourceFile;

    NormalizeSymbolsCase(ActiveEditor.Lines, SourceFile, FCaseNormalizeScriptProgram.SymbolDictionary, OnCaseNormalize);
  finally
    FCaseNormalizeScriptProgram := nil;
  end;
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.ActionRefactorSearchSymbolExecute(Sender: TObject);
var
  ScriptProgram: IdwsProgram;
  CursorPos: TBufferPos;
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

  CursorPos := ActiveEditor.CaretPos;
  CursorPos := ActiveEditor.WordStart(CursorPos);
  Symbol := ScriptProgram.SymbolDictionary.FindSymbolAtPosition(CursorPos.Column, CursorPos.Line, ActiveEditor.InternalUnitName);

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
  TAction(Sender).Enabled := HasEditorPage and (Debugger.State in [dsIdle, dsDebugDone]) and
    (not ActionJIT.Checked);
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
  DoSearch(FSearchOptions - [srEntireScope], False);
end;

procedure TFormScriptDebugger.ActionSearchAgainUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (FSearchText <> '') and (ActiveEditor <> nil);
end;

// -----------------------------------------------------------------------------

procedure TFormScriptDebugger.ActionSearchFindExecute(Sender: TObject);
var
  SearchDialog: TFormScriptDebuggerSearch;
  p: TPoint;
begin
  var Editor := ActiveEditor;
  SearchDialog := TFormScriptDebuggerSearch.Create(Self);
  try
    p := ClientToScreen(Point(ClientWidth, ClientHeight));
    SearchDialog.Left := p.X - SearchDialog.Width;
    SearchDialog.Top := p.Y - SearchDialog.Height;

    SearchDialog.Options := FSearchOptions;
    SearchDialog.History := FSearchHistory;
    SearchDialog.AutoWrap := FSearchAutoWrap;

    if (Editor.HasSelection) and (Editor.BlockBegin.Line = Editor.BlockEnd.Line) then
      SearchDialog.SearchText := Editor.SelectedText
    else
      SearchDialog.SearchText := Editor.WordAt(Editor.CaretPos);

    if (not SearchDialog.Execute) then
      exit;

    FSearchText := SearchDialog.SearchText;
    FSearchOptions := SearchDialog.Options;
    FSearchHistory := SearchDialog.History;
    FSearchAutoWrap := SearchDialog.AutoWrap;

    DoSearch(FSearchOptions, True);
  finally
    SearchDialog.Free;
  end;
end;

procedure TFormScriptDebugger.ActionSearchFindUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (ActiveEditor <> nil);
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
begin
  FActiveEditor.IsReadOnly := not FActiveEditor.IsReadOnly;
end;

procedure TFormScriptDebugger.ActionEditToggleReadOnlyUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (FActiveEditor <> nil);
  TAction(Sender).Checked := (FActiveEditor <> nil) and (FActiveEditor.IsReadOnly);
end;

procedure TFormScriptDebugger.ActionEditUndoExecute(Sender: TObject);
begin
  FActiveEditor.Undo;
end;

procedure TFormScriptDebugger.ActionEditUndoUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (FActiveEditor <> nil) and (FActiveEditor.CanUndo);
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
  if (FActiveEditor = nil) then
    exit;

  ProductID := '';
  AuthorID := '';
  Package := ScriptService.CreateTemporaryPackage('', pkScript) as IScriptPackageInternal;
  try
    Stream := TStringStream.Create(ActiveEditor.Script);
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

  ActiveEditor.Script := s + ActiveEditor.Script;
end;

procedure TFormScriptDebugger.ActionToolHeaderUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (ActiveEditor <> nil);
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
  if (ActiveEditor = nil) then
    exit;

  Password := '';
  ProductID := '';
  AuthorID := '';
  Package := ScriptService.CreateTemporaryPackage('', pkScript) as IScriptPackageInternal;
  try
    Stream := TStringStream.Create(ActiveEditor.Script);
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
      ActiveEditor.Script := s + ActiveEditor.Script;
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
  Content := ActiveEditor.SeledtedText;
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

  ActiveEditor.SelectedText :=
    sScriptObfuscationPatternBegin + #13#10 +
    s+
    Content + #13#10 +
    sScriptObfuscationPatternEnd;
{$endif FEATURE_COPY_PROTECT}
end;

procedure TFormScriptDebugger.ActionToolCopyProtectUpdate(Sender: TObject);
begin
{$ifdef FEATURE_COPY_PROTECT}
  TAction(Sender).Enabled := (ActiveEditor <> nil) and (ActiveEditor.HasSelection);
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
//              ScriptDebuggerFactory
//
// -----------------------------------------------------------------------------
function IDEFactory(const ScriptDebuggerHost: IScriptDebuggerHost; CreateAsMainForm: boolean): IScriptDebugger;
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
  ScriptDebuggerFactory.RegisterFactory(IDEFactory);
finalization
  ScriptDebuggerFactory.RegisterFactory(nil);
end.
