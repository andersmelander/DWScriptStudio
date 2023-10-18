object FormScriptDebugger: TFormScriptDebugger
  Left = 0
  Top = 0
  Caption = 'DWScript debugger'
  ClientHeight = 738
  ClientWidth = 1117
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 15
  object DockSiteMain: TdxDockSite
    Left = 0
    Top = 154
    Width = 1117
    Height = 584
    AllowDockClients = [dtClient, dtLeft, dtRight, dtBottom]
    Align = alClient
    ExplicitTop = 124
    ExplicitHeight = 614
    DockingType = 5
    OriginalWidth = 1117
    OriginalHeight = 584
    object dxLayoutDockSite5: TdxLayoutDockSite
      Left = 225
      Top = 0
      Width = 892
      Height = 584
      ParentShowHint = False
      ShowHint = False
      ExplicitHeight = 614
      DockingType = 0
      OriginalWidth = 300
      OriginalHeight = 200
      object dxLayoutDockSite4: TdxLayoutDockSite
        Left = 0
        Top = 0
        Width = 667
        Height = 584
        ParentShowHint = False
        ShowHint = False
        DockingType = 0
        OriginalWidth = 300
        OriginalHeight = 200
        object LayoutDockSiteLeft: TdxLayoutDockSite
          Left = 0
          Top = 0
          Width = 667
          Height = 444
          ParentShowHint = False
          ShowHint = False
          ExplicitHeight = 474
          DockingType = 0
          OriginalWidth = 300
          OriginalHeight = 200
          object dxLayoutDockSite2: TdxLayoutDockSite
            Left = 169
            Top = 0
            Width = 498
            Height = 444
            ParentShowHint = False
            ShowHint = False
            DockingType = 0
            OriginalWidth = 300
            OriginalHeight = 200
            object dxLayoutDockSite1: TdxLayoutDockSite
              Left = 0
              Top = 0
              Width = 228
              Height = 444
              ParentShowHint = False
              ShowHint = False
              ExplicitHeight = 474
              DockingType = 0
              OriginalWidth = 300
              OriginalHeight = 200
              object dxLayoutDockSite3: TdxLayoutDockSite
                Left = 0
                Top = 0
                Width = 228
                Height = 444
                ParentShowHint = False
                ShowHint = False
                DockingType = 0
                OriginalWidth = 300
                OriginalHeight = 200
              end
              object DockPanelMain: TdxDockPanel
                Left = 0
                Top = 0
                Width = 228
                Height = 444
                AllowDockClients = []
                AllowFloating = False
                AutoHide = False
                CaptionButtons = [cbHide, cbClose]
                CustomCaptionButtons.Buttons = <>
                ShowCaption = False
                TabsProperties.CustomButtons.Buttons = <>
                DockingType = 0
                OriginalWidth = 185
                OriginalHeight = 140
                object PageControlEditor: TcxPageControl
                  Left = 0
                  Top = 0
                  Width = 222
                  Height = 418
                  Align = alClient
                  PopupMenu = PopupMenuEditorTabs
                  TabOrder = 0
                  TabStop = False
                  Properties.CloseButtonMode = cbmActiveAndHoverTabs
                  Properties.CloseTabWithMiddleClick = True
                  Properties.CustomButtons.Buttons = <>
                  Properties.Images = DataModuleDebuggerViewData.SmallImages
                  Properties.NewButtonMode = nbmTab
                  Properties.Style = 6
                  OnCanCloseEx = PageControlEditorCanCloseEx
                  OnContextPopup = PageControlEditorContextPopup
                  OnDrawTabEx = PageControlEditorDrawTabEx
                  OnGetImageIndex = PageControlEditorGetImageIndex
                  OnMouseDown = PageControlEditorMouseDown
                  OnNewTabButtonClick = PageControlEditorNewTabButtonClick
                  ExplicitHeight = 448
                  ClientRectBottom = 418
                  ClientRectRight = 222
                  ClientRectTop = 0
                end
                object StatusBar: TdxStatusBar
                  Left = 0
                  Top = 418
                  Width = 222
                  Height = 20
                  Panels = <
                    item
                      PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
                      Width = 84
                    end
                    item
                      PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
                      Width = 72
                    end
                    item
                      PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
                      Width = 84
                    end
                    item
                      PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
                      Fixed = False
                    end>
                  PaintStyle = stpsUseLookAndFeel
                  SizeGrip = False
                  ParentFont = True
                  ExplicitTop = 448
                end
              end
            end
            object dxVertContainerDockSite1: TdxVertContainerDockSite
              Left = 228
              Top = 0
              Width = 270
              Height = 444
              ParentShowHint = False
              ShowHint = False
              ActiveChildIndex = -1
              AllowFloating = True
              AutoHide = False
              CaptionButtons = [cbMaximize, cbHide]
              CustomCaptionButtons.Buttons = <>
              ExplicitHeight = 474
              DockingType = 3
              OriginalWidth = 270
              OriginalHeight = 176
              object DockPanelCallStack: TdxDockPanel
                Left = 0
                Top = 0
                Width = 270
                Height = 143
                HelpKeyword = 'TScriptDebuggerCallStackFrame'
                OnVisibleChanged = DockPanelDebugFrameVisibleChanged
                AllowFloating = True
                AutoHide = False
                Caption = 'Call stack'
                CaptionButtons = [cbHide, cbClose]
                CustomCaptionButtons.Buttons = <>
                ImageIndex = 54
                TabsProperties.CustomButtons.Buttons = <>
                OnClose = DockPanelDebugFrameClose
                DockingType = 2
                OriginalWidth = 270
                OriginalHeight = 141
              end
              object DockPanelLocalVars: TdxDockPanel
                Left = 0
                Top = 143
                Width = 270
                Height = 187
                HelpKeyword = 'TScriptDebuggerLocalVariablesFrame'
                OnVisibleChanged = DockPanelDebugFrameVisibleChanged
                AllowFloating = True
                AutoHide = False
                Caption = 'Local variables'
                CaptionButtons = [cbHide, cbClose]
                CustomCaptionButtons.Buttons = <>
                ImageIndex = 58
                TabsProperties.CustomButtons.Buttons = <>
                OnClose = DockPanelDebugFrameClose
                DockingType = 2
                OriginalWidth = 270
                OriginalHeight = 185
              end
              object DockPanelWatches: TdxDockPanel
                Left = 0
                Top = 330
                Width = 270
                Height = 114
                HelpKeyword = 'TScriptDebuggerWatchesFrame'
                OnVisibleChanged = DockPanelDebugFrameVisibleChanged
                AllowFloating = True
                AutoHide = False
                Caption = 'Watches'
                CaptionButtons = [cbHide, cbClose]
                CustomCaptionButtons.Buttons = <>
                ImageIndex = 53
                TabsProperties.CustomButtons.Buttons = <>
                OnClose = DockPanelDebugFrameClose
                DockingType = 2
                OriginalWidth = 270
                OriginalHeight = 113
              end
            end
          end
          object DockPanelSymbols: TdxDockPanel
            Left = 0
            Top = 0
            Width = 169
            Height = 444
            HelpKeyword = 'TScriptDebuggerSymbolsFrame'
            OnVisibleChanged = DockPanelDebugFrameVisibleChanged
            AllowFloating = True
            AutoHide = False
            Caption = 'Symbols'
            CaptionButtons = [cbHide, cbClose]
            CustomCaptionButtons.Buttons = <>
            ImageIndex = 61
            TabsProperties.CustomButtons.Buttons = <>
            OnClose = DockPanelDebugFrameClose
            DockingType = 1
            OriginalWidth = 169
            OriginalHeight = 161
          end
        end
        object TabContainerDockSiteBottom: TdxTabContainerDockSite
          Left = 0
          Top = 444
          Width = 667
          Height = 140
          ParentShowHint = False
          ShowHint = False
          ActiveChildIndex = 2
          AllowFloating = True
          AutoHide = False
          CustomCaptionButtons.Buttons = <>
          TabsProperties.CustomButtons.Buttons = <>
          DockingType = 4
          OriginalWidth = 185
          OriginalHeight = 140
          object DockPanelMessages: TdxDockPanel
            Left = 0
            Top = 0
            Width = 661
            Height = 74
            OnVisibleChanged = DockPanelDebugOtherVisibleChanged
            AllowFloating = True
            AutoHide = False
            Caption = 'Messages'
            CaptionButtons = [cbHide, cbClose]
            CustomCaptionButtons.Buttons = <>
            ImageIndex = 56
            TabsProperties.CustomButtons.Buttons = <>
            ExplicitHeight = 80
            DockingType = 0
            OriginalWidth = 892
            OriginalHeight = 140
            object ListViewMessages: TListView
              Left = 0
              Top = 0
              Width = 661
              Height = 74
              Align = alClient
              BorderStyle = bsNone
              Columns = <
                item
                  AutoSize = True
                end>
              MultiSelect = True
              ReadOnly = True
              RowSelect = True
              PopupMenu = PopupMenuMessages
              ShowColumnHeaders = False
              SmallImages = DataModuleDebuggerViewData.ImageListMessage
              TabOrder = 0
              ViewStyle = vsReport
              OnDblClick = ListViewMessagesDblClick
              OnDeletion = ListViewMessagesDeletion
              OnKeyDown = ListViewMessagesKeyDown
              ExplicitHeight = 80
            end
          end
          object DockPanelOutput: TdxDockPanel
            Left = 0
            Top = 0
            Width = 661
            Height = 74
            OnVisibleChanged = DockPanelDebugOtherVisibleChanged
            AllowFloating = True
            AutoHide = False
            Caption = 'Output'
            CaptionButtons = [cbHide, cbClose]
            CustomCaptionButtons.Buttons = <>
            ImageIndex = 57
            TabsProperties.CustomButtons.Buttons = <>
            ExplicitHeight = 80
            DockingType = 0
            OriginalWidth = 892
            OriginalHeight = 140
            object MemoOutputWindow: TMemo
              Left = 0
              Top = 0
              Width = 661
              Height = 74
              Align = alClient
              BorderStyle = bsNone
              Ctl3D = False
              Lines.Strings = (
                '')
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 0
              ExplicitHeight = 80
            end
          end
          object DockPanelBreakPoints: TdxDockPanel
            Left = 0
            Top = 0
            Width = 661
            Height = 74
            HelpType = htKeyword
            HelpKeyword = 'TScriptDebuggerBreakPointsFrame'
            OnVisibleChanged = DockPanelDebugFrameVisibleChanged
            AllowFloating = True
            AutoHide = False
            Caption = 'Break points'
            CaptionButtons = [cbHide, cbClose]
            CustomCaptionButtons.Buttons = <>
            ImageIndex = 55
            TabsProperties.CustomButtons.Buttons = <>
            OnClose = DockPanelDebugFrameClose
            ExplicitHeight = 80
            DockingType = 0
            OriginalWidth = 892
            OriginalHeight = 140
          end
        end
      end
      object dxTabContainerDockSite1: TdxTabContainerDockSite
        Left = 667
        Top = 0
        Width = 225
        Height = 584
        ParentShowHint = False
        ShowHint = False
        ActiveChildIndex = 0
        AllowFloating = True
        AutoHide = False
        CustomCaptionButtons.Buttons = <>
        TabsProperties.CustomButtons.Buttons = <>
        DockingType = 3
        OriginalWidth = 225
        OriginalHeight = 140
        object DockPanelStack: TdxDockPanel
          Left = 0
          Top = 0
          Width = 219
          Height = 518
          HelpKeyword = 'TScriptDebuggerStackFrame'
          OnVisibleChanged = DockPanelDebugFrameVisibleChanged
          AllowFloating = True
          AutoHide = False
          Caption = 'Data stack'
          CaptionButtons = [cbHide, cbClose]
          CustomCaptionButtons.Buttons = <>
          ImageIndex = 60
          TabsProperties.CustomButtons.Buttons = <>
          OnClose = DockPanelDebugFrameClose
          ExplicitHeight = 554
          DockingType = 0
          OriginalWidth = 225
          OriginalHeight = 140
        end
        object DockPanelAST: TdxDockPanel
          Left = 0
          Top = 0
          Width = 219
          Height = 518
          HelpKeyword = 'TScriptDebuggerASTFrame'
          OnVisibleChanged = DockPanelDebugFrameVisibleChanged
          AllowFloating = True
          AutoHide = False
          Caption = 'Abstract Syntax Tree'
          CaptionButtons = [cbHide, cbClose]
          CustomCaptionButtons.Buttons = <>
          ImageIndex = 59
          TabsProperties.CustomButtons.Buttons = <>
          OnClose = DockPanelDebugFrameClose
          ExplicitHeight = 554
          DockingType = 0
          OriginalWidth = 225
          OriginalHeight = 209
        end
      end
    end
    object DockPanelFileExplorer: TdxDockPanel
      Left = 0
      Top = 0
      Width = 225
      Height = 560
      HelpType = htKeyword
      HelpKeyword = 'TScriptDebuggerFileSystemStructureFrame'
      Visible = False
      OnVisibleChanged = DockPanelDebugFrameVisibleChanged
      AllowFloating = True
      AutoHide = False
      Caption = 'Explorer'
      CustomCaptionButtons.Buttons = <>
      TabsProperties.CustomButtons.Buttons = <>
      OnClose = DockPanelDebugFrameClose
      DockingType = 1
      OriginalWidth = 225
      OriginalHeight = 320
    end
  end
  object RibbonDebug: TdxRibbon
    Left = 0
    Top = 0
    Width = 1117
    Height = 154
    ApplicationButton.KeyTip = 'F'
    ApplicationButton.Menu = BarApplicationMenu
    ApplicationButton.Text = 'File'
    BarManager = BarManager
    Style = rs2016
    ColorSchemeName = 'TheBezier'
    EnableTabAero = False
    QuickAccessToolbar.Toolbar = BarManagerBarQuickAccess
    SupportNonClientDrawing = True
    Contexts = <
      item
        Caption = 'Debug'
        Color = 16756834
        Visible = True
      end>
    TabAreaToolbar.Toolbar = BarManagerBarLayout
    TabOrder = 1
    TabStop = False
    object RibbonTabFile: TdxRibbonTab
      Caption = 'File'
      Groups = <
        item
          Caption = 'File'
          ToolbarName = 'dxBarManager1Bar9'
        end>
      Visible = False
      Index = 0
    end
    object RibbonTabEditor: TdxRibbonTab
      Caption = 'Editor'
      Groups = <
        item
          Caption = 'Clipboard'
          ToolbarName = 'dxBarManager1Bar1'
        end
        item
          Caption = 'Properties'
          ToolbarName = 'dxBarManager1Bar4'
        end
        item
          Caption = 'Edit'
          ToolbarName = 'dxBarManager1Bar5'
        end
        item
          Caption = 'Refactoring'
          ToolbarName = 'dxBarManager1Bar2'
        end
        item
          Caption = 'View'
          ToolbarName = 'dxBarManager1Bar6'
        end
        item
          Caption = 'Search'
          ToolbarName = 'dxBarManager1Bar7'
        end
        item
          Caption = 'Project'
          ToolbarName = 'dxBarManager1Bar8'
        end
        item
        end>
      Index = 1
    end
    object RibbonTabDebug: TdxRibbonTab
      Active = True
      Caption = 'Debug'
      Groups = <
        item
          Caption = 'Run'
          ToolbarName = 'dxBarManager1Bar11'
        end
        item
          Caption = 'Step'
          ToolbarName = 'dxBarManager1Bar10'
        end
        item
          Caption = 'View'
          ToolbarName = 'dxBarManager1Bar12'
        end>
      Index = 2
      ContextIndex = 0
    end
    object RibbonDebugTabTools: TdxRibbonTab
      Caption = 'Tools'
      Groups = <
        item
          Caption = 'Documentation'
          ToolbarName = 'dxBarManager1Bar3'
        end
        item
          Caption = 'Content'
          ToolbarName = 'dxBarManager1Bar13'
        end>
      Index = 3
    end
  end
  object ActionList: TActionList
    Images = DataModuleDebuggerViewData.SmallImages
    Left = 480
    Top = 192
    object ActionFileNewProject: TAction
      Category = 'File'
      Caption = 'New Project'
      ImageIndex = 6
      Visible = False
      OnExecute = ActionFileNewProjectExecute
    end
    object ActionGotoHomePosition: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'Goto Home Position'
      Hint = 'Go to the file and line number at which the IDE opened'
      OnExecute = ActionGotoHomePositionExecute
      OnUpdate = ActionGotoHomePositionUpdate
    end
    object ActionFileNewUnit: TAction
      Category = 'File'
      Caption = 'New Unit'
      ImageIndex = 7
      ShortCut = 16462
      OnExecute = ActionFileNewUnitExecute
    end
    object ActionFileNewIncludeFile: TAction
      Category = 'File'
      Caption = 'New Include File'
      ImageIndex = 5
      OnExecute = ActionFileNewIncludeFileExecute
    end
    object ActionOpenFile: TAction
      Category = 'File'
      Caption = 'Open File'
      Hint = 'Opens a file for editing'
      ImageIndex = 0
      SecondaryShortCuts.Strings = (
        'F3')
      ShortCut = 16463
      OnExecute = ActionOpenFileExecute
    end
    object ActionFileOpenProject: TAction
      Category = 'File'
      Caption = 'Open Project...'
      ImageIndex = 10
      ShortCut = 16506
      Visible = False
      OnExecute = ActionFileOpenProjectExecute
    end
    object ActionFileSave: TAction
      Category = 'File'
      Caption = 'Save'
      ImageIndex = 8
      SecondaryShortCuts.Strings = (
        'F2')
      ShortCut = 16467
      OnExecute = ActionFileSaveExecute
      OnUpdate = ActionFileSaveUpdate
    end
    object ActionViewProjectSource: TAction
      Category = 'View'
      Caption = 'View Project Source'
      ImageIndex = 9
      OnExecute = ActionViewProjectSourceExecute
      OnUpdate = ActionViewProjectSourceUpdate
    end
    object ActionFileSaveAsFile: TAction
      Category = 'File'
      Caption = 'File...'
      ShortCut = 24659
      OnExecute = ActionFileSaveAsFileExecute
      OnUpdate = ActionFileSaveAsFileUpdate
    end
    object ActionFileSaveAsAttachment: TAction
      Category = 'File'
      Caption = 'Attachment...'
      OnExecute = ActionFileSaveAsAttachmentExecute
      OnUpdate = ActionFileSaveAsAttachmentUpdate
    end
    object ActionFileSaveProjectAs: TAction
      Category = 'File'
      Caption = 'Save Project As...'
      ImageIndex = 4
      OnExecute = ActionFileSaveProjectAsExecute
    end
    object ActionClosePage: TAction
      Category = 'File'
      Caption = 'Close Page'
      ImageIndex = 2
      ShortCut = 16499
      OnExecute = ActionClosePageExecute
      OnUpdate = ActionClosePageUpdate
    end
    object ActionCloseAllOtherPages: TAction
      Category = 'File'
      Caption = 'Close All Other Pages'
      ImageIndex = 1
      ShortCut = 24691
      OnExecute = ActionCloseAllOtherPagesExecute
      OnUpdate = ActionCloseAllOtherPagesUpdate
    end
    object ActionFileCloseAll: TAction
      Category = 'File'
      Caption = 'Close All'
      OnExecute = ActionFileCloseAllExecute
      OnUpdate = ActionFileCloseAllUpdate
    end
    object ActionEditToggleReadOnly: TAction
      Category = 'Edit'
      Caption = 'Read Only'
      ImageIndex = 63
      OnExecute = ActionEditToggleReadOnlyExecute
      OnUpdate = ActionEditToggleReadOnlyUpdate
    end
    object ActionRun: TAction
      Category = 'Run'
      Caption = 'Run'
      Hint = 'Execute from start to end with debugging '
      ImageIndex = 34
      ShortCut = 120
      OnExecute = ActionRunExecute
      OnUpdate = ActionRunUpdate
    end
    object ActionBuild: TAction
      Category = 'Project'
      Caption = 'Build'
      Hint = 'Compile script'
      ImageIndex = 40
      ShortCut = 16504
      OnExecute = ActionBuildExecute
      OnUpdate = ActionBuildUpdate
    end
    object ActionClearAllBreakpoints: TAction
      Category = 'Run'
      Caption = 'Clear All Breakpoints'
      ImageIndex = 19
      OnExecute = ActionClearAllBreakpointsExecute
    end
    object ActionProgramReset: TAction
      Category = 'Run'
      Caption = 'Program Reset'
      Hint = 'Terminates execution immediately'
      ImageIndex = 35
      ShortCut = 16497
      OnExecute = ActionProgramResetExecute
      OnUpdate = ActionProgramResetUpdate
    end
    object ActionStepOver: TAction
      Category = 'Run'
      Caption = 'Step Over'
      Hint = 'Step to next source line'
      ImageIndex = 18
      ShortCut = 119
      OnExecute = ActionStepOverExecute
      OnUpdate = ActionStepOverUpdate
    end
    object ActionTraceInto: TAction
      Category = 'Run'
      Caption = 'Trace Into'
      Hint = 'Step into method call'
      ImageIndex = 17
      ShortCut = 118
      OnExecute = ActionTraceIntoExecute
      OnUpdate = ActionTraceIntoUpdate
    end
    object ActionRunStepOut: TAction
      Category = 'Run'
      Caption = 'Step out'
      Hint = 'Run until return'
      ImageIndex = 42
      ShortCut = 8311
      OnExecute = ActionRunStepOutExecute
      OnUpdate = ActionRunStepOutUpdate
    end
    object ActionRunWithoutDebugging: TAction
      Category = 'Run'
      Caption = 'Run without debugging'
      Hint = 'Execute from start to end without debugging '
      ImageIndex = 11
      ShortCut = 24696
      OnExecute = ActionRunWithoutDebuggingExecute
      OnUpdate = ActionRunWithoutDebuggingUpdate
    end
    object ActionShowExecutionPoint: TAction
      Category = 'Run'
      Caption = 'Show Execution Point'
      ImageIndex = 21
      OnExecute = ActionShowExecutionPointExecute
      OnUpdate = ActionShowExecutionPointUpdate
    end
    object ActionViewSymbols: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'View Symbols'
      ImageIndex = 61
      OnExecute = ActionViewSymbolsExecute
      OnUpdate = ActionViewSymbolsUpdate
    end
    object ActionEditSelectAll: TAction
      Category = 'Edit'
      Caption = 'Select &All'
      Hint = 'Select All|Selects the entire document'
      ImageIndex = 33
      ShortCut = 16449
      OnExecute = ActionEditSelectAllExecute
      OnUpdate = ActionEditSelectAllUpdate
    end
    object ActionEditCopyToClipboard: TAction
      Category = 'Edit'
      Caption = '&Copy'
      Hint = 'Copy|Copies the selection and puts it on the Clipboard'
      ImageIndex = 22
      SecondaryShortCuts.Strings = (
        'Ctrl+Ins')
      ShortCut = 16451
      OnExecute = ActionEditCopyToClipboardExecute
      OnUpdate = ActionEditCopyToClipboardUpdate
    end
    object ActionEditCut: TAction
      Category = 'Edit'
      Caption = 'Cu&t'
      Hint = 'Cut|Cuts the selection and puts it on the Clipboard'
      ImageIndex = 23
      SecondaryShortCuts.Strings = (
        'Shift+Del')
      ShortCut = 16472
      OnExecute = ActionEditCutExecute
      OnUpdate = ActionEditCutUpdate
    end
    object ActionEditPaste: TAction
      Category = 'Edit'
      Caption = '&Paste'
      Hint = 'Paste|Inserts Clipboard contents'
      ImageIndex = 24
      SecondaryShortCuts.Strings = (
        'Shift+Ins')
      ShortCut = 16470
      OnExecute = ActionEditPasteExecute
      OnUpdate = ActionEditPasteUpdate
    end
    object ActionEditDelete: TAction
      Category = 'Edit'
      Caption = '&Delete'
      Hint = 'Delete|Erases the selection'
      ImageIndex = 25
      ShortCut = 16430
      OnExecute = ActionEditDeleteExecute
      OnUpdate = ActionEditDeleteUpdate
    end
    object ActionEditClearOutputWindow: TAction
      Category = 'Edit'
      Caption = 'Clear output window'
      OnExecute = ActionEditClearOutputWindowExecute
      OnUpdate = ActionEditClearOutputWindowUpdate
    end
    object ActionSearchFind: TAction
      Category = 'Search'
      Caption = '&Find...'
      Hint = 'Find|Finds the specified text'
      ImageIndex = 30
      SecondaryShortCuts.Strings = (
        'Ctrl+Q+F')
      ShortCut = 16454
      OnExecute = ActionSearchFindExecute
      OnUpdate = ActionSearchFindUpdate
    end
    object ActionSearchReplace: TAction
      Category = 'Search'
      Caption = '&Replace'
      Hint = 'Replace|Replaces specific text with different text'
      ImageIndex = 31
      SecondaryShortCuts.Strings = (
        'Ctrl+Q+R')
      ShortCut = 16466
    end
    object ActionEditUndo: TAction
      Category = 'Edit'
      Caption = '&Undo'
      Hint = 'Undo|Reverts the last action'
      ImageIndex = 32
      SecondaryShortCuts.Strings = (
        'Alt+bksp')
      ShortCut = 16474
      OnExecute = ActionEditUndoExecute
      OnUpdate = ActionEditUndoUpdate
    end
    object ActionGotoLineNumber: TAction
      Category = 'Search'
      Caption = 'Go to Line Number'
      ShortCut = 32839
      OnExecute = ActionGotoLineNumberExecute
      OnUpdate = ActionGotoLineNumberUpdate
    end
    object ActionExit: TAction
      Category = 'File'
      Caption = 'Exit'
      ImageIndex = 3
      ShortCut = 32883
      OnExecute = ActionExitExecute
      OnUpdate = ActionExitUpdate
    end
    object ActionRunResume: TAction
      Category = 'Run'
      Caption = 'Resume'
      ImageIndex = 37
      ShortCut = 120
      OnExecute = ActionRunExecute
      OnUpdate = ActionRunResumeUpdate
    end
    object ActionRunPause: TAction
      Category = 'Run'
      Caption = 'Pause'
      Hint = 'Suspend execution temporarily'
      ImageIndex = 36
      ShortCut = 144
      OnExecute = ActionRunPauseExecute
      OnUpdate = ActionRunPauseUpdate
    end
    object ActionSearchAgain: TAction
      Category = 'Search'
      Caption = 'Find again'
      Hint = 'Continue last search from current position'
      ImageIndex = 41
      ShortCut = 114
      OnExecute = ActionSearchAgainExecute
      OnUpdate = ActionSearchAgainUpdate
    end
    object ActionDebugEvaluate: TAction
      Category = 'Debug'
      Caption = 'Evaluate / Modify'
      ImageIndex = 52
      ShortCut = 16502
      OnExecute = ActionDebugEvaluateExecute
      OnUpdate = ActionDebugEvaluateUpdate
    end
    object ActionDebug: TAction
      Category = 'Debug'
      Caption = 'Debug'
      Visible = False
      OnExecute = ActionDebugExecute
    end
    object ActionDebugBreakOnPoop: TAction
      Category = 'Debug'
      AutoCheck = True
      Caption = 'Break on exceptions'
      Hint = 'Break into debugger if an exception is raised'
      ImageIndex = 68
      OnExecute = ActionDebugBreakOnPoopExecute
    end
    object ActionViewCallStack: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'Call stack'
      ImageIndex = 54
      OnExecute = ActionViewCallStackExecute
      OnUpdate = ActionViewCallStackUpdate
    end
    object ActionViewLocals: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'Local variables'
      ImageIndex = 58
      OnExecute = ActionViewLocalsExecute
      OnUpdate = ActionViewLocalsUpdate
    end
    object ActionViewWatches: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'Watches'
      ImageIndex = 53
      OnExecute = ActionViewWatchesExecute
      OnUpdate = ActionViewWatchesUpdate
    end
    object ActionViewStack: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'Data stack'
      ImageIndex = 60
      OnExecute = ActionViewStackExecute
      OnUpdate = ActionViewStackUpdate
    end
    object ActionViewMessages: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'Messages'
      ImageIndex = 56
      OnExecute = ActionViewMessagesExecute
      OnUpdate = ActionViewMessagesUpdate
    end
    object ActionViewOutput: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'Output log'
      ImageIndex = 57
      OnExecute = ActionViewOutputExecute
      OnUpdate = ActionViewOutputUpdate
    end
    object ActionViewBreakpoints: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'Breakpoints'
      ImageIndex = 55
      OnExecute = ActionViewBreakpointsExecute
      OnUpdate = ActionViewBreakpointsUpdate
    end
    object ActionViewAST: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'Abstract Syntax Tree'
      ImageIndex = 59
      OnExecute = ActionViewASTExecute
      OnUpdate = ActionViewASTUpdate
    end
    object ActionToolDocBuild: TAction
      Category = 'Tools'
      Caption = 'Build documentation'
      ImageIndex = 45
      OnExecute = ActionToolDocBuildExecute
      OnUpdate = ActionToolDocBuildUpdate
    end
    object ActionToolCopyProtect: TAction
      Category = 'Tools'
      Caption = 'Protect content'
      Hint = 
        'Applies copy protectetion to the selected text by encrypting it ' +
        'with your public API key'
      ImageIndex = 44
      OnExecute = ActionToolCopyProtectExecute
      OnUpdate = ActionToolCopyProtectUpdate
    end
    object ActionRunInitialization: TAction
      Category = 'Run'
      Caption = 'Start execution'
      Hint = 'Execute script initialization and main body'
      ImageIndex = 46
      ShortCut = 8312
      OnExecute = ActionRunInitializationExecute
      OnUpdate = ActionRunInitializationUpdate
    end
    object ActionRunFinalization: TAction
      Category = 'Run'
      Caption = 'End execution'
      Hint = 'Execute script finalization and terminate'
      ImageIndex = 47
      ShortCut = 8312
      OnExecute = ActionRunFinalizationExecute
      OnUpdate = ActionRunFinalizationUpdate
    end
    object ActionToolBundle: TAction
      Category = 'Tools'
      Caption = 'Create add-in bundle'
      ImageIndex = 48
      OnExecute = ActionToolBundleExecute
    end
    object ActionLayoutDefaultEdit: TAction
      Category = 'Layout'
      AutoCheck = True
      Caption = 'Set as default edit layout'
      Hint = 
        'Use the current layout when the debugger is not executing a scri' +
        'pt'
      ImageIndex = 49
      Visible = False
      OnExecute = ActionLayoutDefaultEditExecute
      OnUpdate = ActionLayoutDefaultEditUpdate
    end
    object ActionLayoutDefaultDebug: TAction
      Category = 'Layout'
      Caption = 'Set as default debug layout'
      Hint = 'Use the current layout when the debugger is executing a script'
      ImageIndex = 50
      OnExecute = ActionLayoutDefaultDebugExecute
      OnUpdate = ActionLayoutDefaultDebugUpdate
    end
    object ActionLayoutSave: TAction
      Category = 'Layout'
      Caption = 'Save current layout'
      Hint = 'Save the current layout - optionally with a new name'
      ImageIndex = 51
      OnExecute = ActionLayoutSaveExecute
    end
    object ActionRefactorNormalizeCase: TAction
      Category = 'Refactor'
      Caption = 'Normalize case'
      Hint = 
        'Change all occurrences of any given symbol to use the same case ' +
        'as the declaration'
      ImageIndex = 62
      ShortCut = 24654
      OnExecute = ActionRefactorNormalizeCaseExecute
      OnUpdate = ActionGenericNotDebuggingUpdate
    end
    object ActionRefactorIdentifierRename: TAction
      Category = 'Refactor'
      Caption = 'Rename symbol'
      Hint = 'Rename all occurences of a symbol'
      ImageIndex = 64
      ShortCut = 24645
      OnExecute = ActionRefactorIdentifierRenameExecute
      OnUpdate = ActionGenericNotDebuggingUpdate
    end
    object ActionMessagesClear: TAction
      Caption = 'Clear messages'
      OnExecute = ActionMessagesClearExecute
      OnUpdate = ActionMessagesClearUpdate
    end
    object ActionViewFileExplorer: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'File explorer'
      ImageIndex = 70
      OnExecute = ActionViewFileExplorerExecute
      OnUpdate = ActionViewFileExplorerUpdate
    end
    object ActionGotoDeclaration: TAction
      Category = 'View'
      Caption = 'Goto declaration'
      ImageIndex = 66
      OnExecute = ActionGotoDeclarationExecute
      OnUpdate = ActionGenericUpdateHasEditor
    end
    object ActionGotoImplementation: TAction
      Category = 'View'
      Caption = 'Goto implementation'
      ImageIndex = 67
      OnExecute = ActionGotoImplementationExecute
      OnUpdate = ActionGenericUpdateHasEditor
    end
    object ActionToolHeader: TAction
      Category = 'Tools'
      Caption = 'Insert header'
      ImageIndex = 44
      OnExecute = ActionToolHeaderExecute
      OnUpdate = ActionToolHeaderUpdate
    end
    object ActionRefactorSearchSymbol: TAction
      Category = 'Refactor'
      Caption = 'Search for usage'
      Hint = 'Find and list all occurences of a symbol'
      ShortCut = 24659
      OnExecute = ActionRefactorSearchSymbolExecute
      OnUpdate = ActionGenericUpdateHasEditor
    end
    object ActionFileMainUnit: TAction
      Category = 'File'
      AutoCheck = True
      Caption = 'Designate as main unit'
      ImageIndex = 69
      OnExecute = ActionFileMainUnitExecute
      OnUpdate = ActionFileMainUnitUpdate
    end
    object ActionDebugLiveObjects: TAction
      Category = 'Debug'
      Caption = 'Live objects'
      Hint = 'Display list of currently live objects'
      OnExecute = ActionDebugLiveObjectsExecute
    end
    object ActionJIT: TAction
      Category = 'Project'
      AutoCheck = True
      Caption = 'Enable jitter'
      Hint = 'Enable JIT native compilation'
      OnExecute = ActionDummyExecute
    end
  end
  object OpenFileDialog: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = 'All Script Files'
        FileMask = '*.pas;*.inc'
      end
      item
        DisplayName = 'Unit Files'
        FileMask = '*.pas'
      end
      item
        DisplayName = 'Include Files'
        FileMask = '*.inc'
      end
      item
        DisplayName = 'Text Files'
        FileMask = '*.txt'
      end
      item
        DisplayName = 'Project Source Files'
        FileMask = '*.scriptproject'
      end
      item
        DisplayName = 'Any File'
        FileMask = '*.*'
      end>
    Options = [fdoAllowMultiSelect]
    Title = 'Open Editor File'
    Left = 56
    Top = 280
  end
  object SaveProjectDialog: TFileSaveDialog
    DefaultExtension = 'dwsproj'
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = 'Project Files'
        FileMask = '*.dwsproj'
      end>
    Options = [fdoOverWritePrompt, fdoStrictFileTypes]
    Title = 'Save Project File'
    Left = 60
    Top = 372
  end
  object OpenProjectDialog: TFileOpenDialog
    DefaultExtension = '*.dwsproj'
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = 'Project File'
        FileMask = '*.dwsproj'
      end
      item
        DisplayName = 'Project Source Files'
        FileMask = '*.dws'
      end
      item
        DisplayName = 'Unit Files'
        FileMask = '*.pas'
      end
      item
        DisplayName = 'Text Files'
        FileMask = '*.txt'
      end
      item
        DisplayName = 'Any File'
        FileMask = '*.*'
      end>
    Options = []
    Title = 'Open Editor File'
    Left = 56
    Top = 328
  end
  object UpdateTimer: TTimer
    OnTimer = UpdateTimerTimer
    Left = 236
    Top = 308
  end
  object Debugger: TdwsDebugger
    OnDebugStop = DebuggerDebugStop
    OnDebugMessage = DebuggerDebugMessage
    OnNotifyException = DebuggerNotifyException
    OnStateChanged = DebuggerStateChanged
    Left = 576
    Top = 216
  end
  object SaveSourceDialog: TFileSaveDialog
    DefaultExtension = 'pas'
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = 'Unit Files'
        FileMask = '*.pas'
      end
      item
        DisplayName = 'Any File'
        FileMask = '*.*'
      end>
    Options = [fdoOverWritePrompt, fdoStrictFileTypes]
    Title = 'Save File As'
    Left = 60
    Top = 428
  end
  object EditorPagePopupMenu: TPopupMenu
    Images = DataModuleDebuggerViewData.SmallImages
    Left = 392
    Top = 212
    object Debug1: TMenuItem
      Action = ActionDebug
      object EvaluateModify1: TMenuItem
        Action = ActionDebugEvaluate
      end
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object MenuItemRun1: TMenuItem
      Action = ActionRun
    end
    object MenuItemRunWithoutDebugging: TMenuItem
      Action = ActionRunWithoutDebugging
    end
    object MenuItemBuild: TMenuItem
      Action = ActionBuild
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object MenuItemCut: TMenuItem
      Action = ActionEditCut
    end
    object MenuItemCopy: TMenuItem
      Action = ActionEditCopyToClipboard
    end
    object MenuItemPaste: TMenuItem
      Action = ActionEditPaste
    end
    object MenuItemDelete: TMenuItem
      Action = ActionEditDelete
    end
    object MenuItemSelectAll: TMenuItem
      Action = ActionEditSelectAll
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object MenuItemClosePagexx: TMenuItem
      Action = ActionClosePage
    end
    object MenuItemCloseAllOtherPages: TMenuItem
      Action = ActionCloseAllOtherPages
    end
    object N12: TMenuItem
      Caption = '-'
    end
    object MenuItemSave: TMenuItem
      Action = ActionFileSave
    end
    object N13: TMenuItem
      Caption = '-'
    end
    object MenuItemReadOnly: TMenuItem
      Action = ActionEditToggleReadOnly
    end
  end
  object BarManager: TdxBarManager
    AllowReset = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Default'
      'File'
      'Edit'
      'Search'
      'View'
      'Project'
      'Run'
      'Menus'
      'Layout'
      'Editor')
    Categories.ItemsVisibles = (
      2
      2
      2
      2
      2
      2
      2
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True
      True
      True
      True
      True
      True
      True
      True)
    ImageOptions.HotImages = DataModuleDebuggerViewData.SmallImages
    ImageOptions.Images = DataModuleDebuggerViewData.SmallImages
    ImageOptions.LargeImages = DataModuleDebuggerViewData.ImagesLarge
    ImageOptions.MakeDisabledImagesFaded = True
    ImageOptions.StretchGlyphs = False
    ImageOptions.UseLargeImagesForLargeIcons = True
    ImageOptions.UseLeftBottomPixelAsTransparent = False
    MenusShowRecentItemsFirst = False
    NotDocking = [dsNone]
    PopupMenuLinks = <>
    ShowShortCutInHint = True
    Style = bmsUseLookAndFeel
    UseSystemFont = False
    Left = 444
    Top = 260
    PixelsPerInch = 96
    object dxBarManager1Bar4: TdxBar
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockedLeft = 108
      DockedTop = 0
      FloatLeft = 1065
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'MenuItemEditReadOnly'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar5: TdxBar
      Caption = 'Custom 2'
      CaptionButtons = <>
      DockedLeft = 198
      DockedTop = 0
      FloatLeft = 1065
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'MenuItemEditUndo'
        end
        item
          Visible = True
          ItemName = 'MenuItemEditSelectAll'
        end
        item
          Visible = True
          ItemName = 'MenuItemEditDelete'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar6: TdxBar
      Caption = 'Custom 3'
      CaptionButtons = <>
      DockedLeft = 403
      DockedTop = 0
      FloatLeft = 1065
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'BarSubItemDebugPanes'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'MenuItemViewProjectSource'
        end
        item
          ViewLevels = [ivlSmallIconWithText, ivlSmallIcon, ivlControlOnly]
          Visible = True
          ItemName = 'BarSubItemGoto'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar7: TdxBar
      Caption = 'Custom 4'
      CaptionButtons = <>
      DockedLeft = 598
      DockedTop = 0
      FloatLeft = 1065
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'MenuItemSearchFind'
        end
        item
          Visible = True
          ItemName = 'MenuItemSearchReplace'
        end
        item
          Visible = True
          ItemName = 'dxBarButton5'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar8: TdxBar
      Caption = 'Custom 5'
      CaptionButtons = <>
      DockedLeft = 689
      DockedTop = 0
      FloatLeft = 1065
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarLargeButton3'
        end
        item
          Visible = True
          ItemName = 'MenuItemRunStart'
        end
        item
          Visible = True
          ItemName = 'dxBarButton6'
        end
        item
          Visible = True
          ItemName = 'dxBarButton12'
        end
        item
          Visible = True
          ItemName = 'dxBarButton7'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton25'
        end
        item
          Visible = True
          ItemName = 'dxBarButton26'
        end
        item
          Visible = True
          ItemName = 'dxBarButton10'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar9: TdxBar
      Caption = 'Custom 6'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1065
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'MenuItemFileOpen'
        end
        item
          Visible = True
          ItemName = 'dxBarButton11'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'MenuItemFileSave'
        end
        item
          ViewLevels = [ivlLargeControlOnly, ivlSmallIconWithText, ivlSmallIcon, ivlControlOnly]
          Visible = True
          ItemName = 'dxBarSubItem1'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'MenuItemFileClose'
        end
        item
          Visible = True
          ItemName = 'MenuItemFileCloseAll'
        end
        item
          Visible = True
          ItemName = 'MenuItemFileExit'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar10: TdxBar
      Caption = 'Custom 7'
      CaptionButtons = <>
      DockedLeft = 310
      DockedTop = 0
      FloatLeft = 1065
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'MenuItemRunStepOver'
        end
        item
          Visible = True
          ItemName = 'MenuItemRunTraceInto'
        end
        item
          Visible = True
          ItemName = 'dxBarButton4'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar11: TdxBar
      Caption = 'Custom 8'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1065
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarLargeButton2'
        end
        item
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'MenuItemRunReset'
        end
        item
          Visible = True
          ItemName = 'dxBarButton26'
        end
        item
          BeginGroup = True
          Distributed = False
          Visible = True
          ItemName = 'dxBarButton8'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar12: TdxBar
      Caption = 'Custom 9'
      CaptionButtons = <>
      DockedLeft = 395
      DockedTop = 0
      FloatLeft = 1065
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'BarSubItemDebugPanes'
        end
        item
          Distributed = False
          Visible = True
          ItemName = 'dxBarButton9'
        end
        item
          Distributed = False
          ViewLevels = [ivlSmallIconWithText, ivlSmallIcon, ivlControlOnly]
          Visible = True
          ItemName = 'BarSubItemGoto'
        end
        item
          Distributed = False
          Visible = True
          ItemName = 'MenuItemRunShowExecutionPoint'
        end
        item
          Distributed = False
          Visible = True
          ItemName = 'BarButtonLiveObjects'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'MenuItemRunClearAllBreakpoints'
        end
        item
          Visible = True
          ItemName = 'dxBarButton22'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar1: TdxBar
      Caption = 'Custom 10'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1065
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarLargeButton1'
        end
        item
          Visible = True
          ItemName = 'MenuItemEditCopy'
        end
        item
          Visible = True
          ItemName = 'MenuItemEditCut'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar2: TdxBar
      Caption = 'Custom 11'
      CaptionButtons = <>
      DockedLeft = 282
      DockedTop = 0
      FloatLeft = 1151
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'ButtonRefactorRename'
        end
        item
          Visible = True
          ItemName = 'ButtonRefactorNormalizeCase'
        end
        item
          Visible = True
          ItemName = 'ButtonRefactorUsage'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar3: TdxBar
      Caption = 'Custom 12'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1151
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'ButtonToolDocument'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar13: TdxBar
      Caption = 'Custom 13'
      CaptionButtons = <>
      DockedLeft = 116
      DockedTop = 0
      FloatLeft = 1151
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'ButtonToolProtect'
        end
        item
          Visible = True
          ItemName = 'ButtonToolHeader'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarLargeButton5'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object BarManagerBarQuickAccess: TdxBar
      Caption = 'Quick Access'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1151
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'MenuItemFileNewUnit'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'MenuItemFileOpen'
        end
        item
          Visible = True
          ItemName = 'MenuItemFileSave'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object BarManagerBarLayout: TdxBar
      Caption = 'Layout'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1151
      FloatTop = 8
      FloatClientWidth = 100
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'BarButtonLayoutDefaultEdit'
        end
        item
          UserDefine = [udWidth]
          UserWidth = 156
          Visible = True
          ItemName = 'BarComboLayout'
        end
        item
          Visible = True
          ItemName = 'BarButtonLayoutSave'
        end
        item
          Visible = True
          ItemName = 'BarButtonLayoutDefaultDebug'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'Save as...'
      Category = 0
      Visible = ivAlways
      ImageIndex = 4
      ItemLinks = <
        item
          Visible = True
          ItemName = 'MenuItemFileSaveAs'
        end
        item
          Visible = True
          ItemName = 'dxBarButton3'
        end>
    end
    object dxBarButton3: TdxBarButton
      Action = ActionFileSaveAsAttachment
      Category = 0
    end
    object dxBarButton8: TdxBarButton
      Action = ActionDebugBreakOnPoop
      Category = 0
      ButtonStyle = bsChecked
    end
    object dxBarButton9: TdxBarButton
      Action = ActionDebugEvaluate
      Category = 0
    end
    object dxBarButton10: TdxBarButton
      Action = ActionDebugBreakOnPoop
      Category = 0
      ButtonStyle = bsChecked
    end
    object dxBarButton11: TdxBarButton
      Action = ActionFileNewUnit
      Category = 0
    end
    object ButtonRefactorNormalizeCase: TdxBarButton
      Action = ActionRefactorNormalizeCase
      Category = 0
    end
    object dxBarButton13: TdxBarButton
      Action = ActionViewCallStack
      Category = 0
      ButtonStyle = bsChecked
    end
    object dxBarButton14: TdxBarButton
      Action = ActionViewLocals
      Category = 0
      ButtonStyle = bsChecked
    end
    object dxBarButton15: TdxBarButton
      Action = ActionViewWatches
      Category = 0
      ButtonStyle = bsChecked
    end
    object dxBarButton16: TdxBarButton
      Action = ActionViewStack
      Category = 0
      ButtonStyle = bsChecked
    end
    object dxBarButton17: TdxBarButton
      Action = ActionViewSymbols
      Category = 0
      ButtonStyle = bsChecked
    end
    object dxBarButton18: TdxBarButton
      Action = ActionViewMessages
      Category = 0
      ButtonStyle = bsChecked
    end
    object dxBarButton19: TdxBarButton
      Action = ActionViewOutput
      Category = 0
      ButtonStyle = bsChecked
    end
    object dxBarButton20: TdxBarButton
      Action = ActionViewBreakpoints
      Category = 0
      ButtonStyle = bsChecked
    end
    object dxBarButton21: TdxBarButton
      Action = ActionViewMessages
      Category = 0
      ButtonStyle = bsChecked
    end
    object dxBarButton22: TdxBarButton
      Action = ActionEditClearOutputWindow
      Category = 0
    end
    object dxBarButton23: TdxBarButton
      Action = ActionViewAST
      Category = 0
      ButtonStyle = bsChecked
    end
    object dxBarButton24: TdxBarButton
      Action = ActionViewAST
      Category = 0
      ButtonStyle = bsChecked
    end
    object BarSubItemDebugPanes: TdxBarSubItem
      Caption = 'Panes'
      Category = 0
      Visible = ivAlways
      ImageIndex = 43
      LargeImageIndex = 3
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton18'
        end
        item
          Visible = True
          ItemName = 'dxBarButton20'
        end
        item
          Visible = True
          ItemName = 'dxBarButton19'
        end
        item
          Visible = True
          ItemName = 'dxBarButton17'
        end
        item
          Visible = True
          ItemName = 'dxBarButton13'
        end
        item
          Visible = True
          ItemName = 'dxBarButton14'
        end
        item
          Visible = True
          ItemName = 'dxBarButton15'
        end
        item
          Visible = True
          ItemName = 'dxBarButton16'
        end
        item
          Visible = True
          ItemName = 'dxBarButton24'
        end
        item
          Visible = True
          ItemName = 'dxBarButton27'
        end>
    end
    object ButtonToolProtect: TdxBarLargeButton
      Action = ActionToolCopyProtect
      Category = 0
      Visible = ivNever
      LargeImageIndex = 4
      SyncImageIndex = False
      ImageIndex = 44
    end
    object dxBarLargeButton5: TdxBarLargeButton
      Action = ActionToolBundle
      Category = 0
      LargeImageIndex = 6
      SyncImageIndex = False
      ImageIndex = 10
    end
    object ButtonToolDocument: TdxBarSubItem
      Action = ActionToolDocBuild
      Category = 0
      LargeImageIndex = 5
      ItemLinks = <
        item
          Visible = True
          ItemName = 'ButtonToolDocumentXML'
        end
        item
          Visible = True
          ItemName = 'ButtonToolDocumentSource'
        end
        item
          Visible = True
          ItemName = 'ButtonToolDocumentBuild'
        end>
    end
    object ButtonToolDocumentXML: TdxBarButton
      Caption = 'XML format'
      Category = 0
      Enabled = False
      Hint = 'Generate documentation in XML format'
      Visible = ivAlways
      OnClick = ButtonToolDocumentXMLClick
    end
    object ButtonToolDocumentSource: TdxBarButton
      Caption = 'Generate source code'
      Category = 0
      Hint = 'Generate documentation in pascal format'
      Visible = ivAlways
      OnClick = ButtonToolDocumentSourceClick
    end
    object ButtonRefactorRename: TdxBarButton
      Action = ActionRefactorIdentifierRename
      Category = 0
    end
    object ButtonRefactorUsage: TdxBarButton
      Action = ActionRefactorSearchSymbol
      Category = 0
    end
    object ButtonToolHeader: TdxBarLargeButton
      Action = ActionToolHeader
      Category = 0
      LargeImageIndex = 4
      SyncImageIndex = False
      ImageIndex = 44
    end
    object dxBarButton12: TdxBarButton
      Caption = 'Run and break'
      Category = 0
      Hint = 'Run and break'
      Visible = ivNever
      OnClick = dxBarButton12Click
    end
    object MenuItemFileCloseOtherPages: TdxBarButton
      Action = ActionCloseAllOtherPages
      Category = 0
    end
    object MenuItemFileMainUnit: TdxBarButton
      Action = ActionFileMainUnit
      Category = 0
      ButtonStyle = bsChecked
    end
    object BarButtonLiveObjects: TdxBarButton
      Action = ActionDebugLiveObjects
      Category = 0
    end
    object BarStaticSpacer: TdxBarStatic
      Category = 0
      Visible = ivAlways
      Height = 80
      ShowCaption = False
    end
    object dxBarButton27: TdxBarButton
      Action = ActionViewFileExplorer
      Category = 0
      ButtonStyle = bsChecked
    end
    object ButtonToolDocumentBuild: TdxBarButton
      Caption = 'Build help file'
      Category = 0
      Hint = 'Build help file from generated source files'
      Visible = ivAlways
      OnClick = ButtonToolDocumentBuildClick
    end
    object dxBarButton7: TdxBarButton
      Action = ActionJIT
      Category = 0
      ButtonStyle = bsChecked
    end
    object MenuItemFileNew: TdxBarSubItem
      Caption = 'New ...'
      Category = 1
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'MenuItemFileNewProject'
        end
        item
          Visible = True
          ItemName = 'MenuItemFileNewUnit'
        end
        item
          Visible = True
          ItemName = 'MenuItemFileNewInclude'
        end>
    end
    object MenuItemFileNewProject: TdxBarButton
      Action = ActionFileNewProject
      Category = 1
    end
    object MenuItemFileNewUnit: TdxBarButton
      Action = ActionFileNewUnit
      Category = 1
    end
    object MenuItemFileNewInclude: TdxBarButton
      Action = ActionFileNewIncludeFile
      Category = 1
    end
    object MenuItemFileOpen: TdxBarButton
      Action = ActionOpenFile
      Caption = 'Open ...'
      Category = 1
    end
    object MenuItemFileOpenProject: TdxBarButton
      Action = ActionFileOpenProject
      Category = 1
    end
    object MenuItemFileSave: TdxBarButton
      Action = ActionFileSave
      Category = 1
    end
    object MenuItemFileSaveAs: TdxBarButton
      Action = ActionFileSaveAsFile
      Category = 1
    end
    object MenuItemFileSaveProjectAs: TdxBarButton
      Action = ActionFileSaveProjectAs
      Category = 1
    end
    object MenuItemFileClose: TdxBarButton
      Action = ActionClosePage
      Category = 1
    end
    object MenuItemFileCloseAll: TdxBarButton
      Action = ActionFileCloseAll
      Category = 1
    end
    object MenuItemFileExit: TdxBarLargeButton
      Action = ActionExit
      Category = 1
      HotImageIndex = 72
    end
    object MenuItemFileReadOnlyToggle: TdxBarButton
      Action = ActionEditToggleReadOnly
      Category = 1
      ButtonStyle = bsChecked
    end
    object MenuItemEditCut: TdxBarButton
      Action = ActionEditCut
      Category = 2
    end
    object MenuItemEditCopy: TdxBarButton
      Action = ActionEditCopyToClipboard
      Category = 2
    end
    object MenuItemEditPaste: TdxBarButton
      Action = ActionEditPaste
      Category = 2
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Action = ActionEditPaste
      Category = 2
      LargeImageIndex = 0
      SyncImageIndex = False
      ImageIndex = 24
    end
    object MenuItemEditDelete: TdxBarButton
      Action = ActionEditDelete
      Category = 2
    end
    object MenuItemEditSelectAll: TdxBarButton
      Action = ActionEditSelectAll
      Category = 2
    end
    object MenuItemEditUndo: TdxBarButton
      Action = ActionEditUndo
      Category = 2
    end
    object MenuItemEditReadOnly: TdxBarButton
      Action = ActionEditToggleReadOnly
      Category = 2
      ButtonStyle = bsChecked
    end
    object MenuItemSearchFind: TdxBarButton
      Action = ActionSearchFind
      Category = 3
    end
    object dxBarButton5: TdxBarButton
      Action = ActionSearchAgain
      Category = 3
    end
    object MenuItemSearchReplace: TdxBarButton
      Action = ActionSearchReplace
      Category = 3
    end
    object MenuItemViewProjectSource: TdxBarButton
      Action = ActionViewProjectSource
      Category = 4
    end
    object MenuItemViewSymbols: TdxBarButton
      Action = ActionViewSymbols
      Category = 4
      ButtonStyle = bsChecked
    end
    object ButtonGotoHomePosition: TdxBarButton
      Action = ActionGotoHomePosition
      Category = 4
    end
    object BarSubItemGoto: TdxBarSubItem
      Caption = 'Goto...'
      Category = 4
      Visible = ivAlways
      ImageIndex = 65
      ItemLinks = <
        item
          Visible = True
          ItemName = 'ButtonGotoDeclaration'
        end
        item
          Visible = True
          ItemName = 'ButtonGotoImplementation'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'ButtonGotoHomePosition'
        end>
    end
    object ButtonGotoDeclaration: TdxBarButton
      Action = ActionGotoDeclaration
      Category = 4
    end
    object ButtonGotoImplementation: TdxBarButton
      Action = ActionGotoImplementation
      Category = 4
    end
    object MenuItemProjectBuild: TdxBarButton
      Action = ActionBuild
      Category = 5
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Action = ActionBuild
      Category = 5
      LargeImageIndex = 1
      SyncImageIndex = False
      ImageIndex = 40
    end
    object dxBarButton6: TdxBarButton
      Action = ActionRunWithoutDebugging
      Category = 6
    end
    object MenuItemRunStart: TdxBarButton
      Action = ActionRun
      Category = 6
    end
    object MenuItemRunStepOver: TdxBarButton
      Action = ActionStepOver
      Category = 6
    end
    object MenuItemRunTraceInto: TdxBarButton
      Action = ActionTraceInto
      Category = 6
    end
    object dxBarButton4: TdxBarButton
      Action = ActionRunStepOut
      Category = 6
    end
    object MenuItemRunReset: TdxBarButton
      Action = ActionProgramReset
      Category = 6
    end
    object dxBarButton1: TdxBarButton
      Action = ActionRunPause
      Category = 6
      ButtonStyle = bsChecked
    end
    object dxBarButton2: TdxBarButton
      Action = ActionRunResume
      Category = 6
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Action = ActionRunResume
      Category = 6
      LargeImageIndex = 2
      SyncImageIndex = False
      ImageIndex = 37
    end
    object MenuItemRunShowExecutionPoint: TdxBarButton
      Action = ActionShowExecutionPoint
      Category = 6
    end
    object MenuItemRunClearAllBreakpoints: TdxBarButton
      Action = ActionClearAllBreakpoints
      Category = 6
    end
    object dxBarButton25: TdxBarButton
      Action = ActionRunInitialization
      Category = 6
    end
    object dxBarButton26: TdxBarButton
      Action = ActionRunFinalization
      Category = 6
    end
    object BarComboLayout: TdxBarCombo
      Caption = 'Layout'
      Category = 8
      Hint = 'Saved layouts'
      Visible = ivAlways
      OnChange = BarComboLayoutChange
      ShowEditor = False
      Sorted = True
      ItemIndex = -1
    end
    object BarButtonLayoutSave: TdxBarButton
      Action = ActionLayoutSave
      Category = 8
    end
    object BarButtonLayoutDefaultEdit: TdxBarButton
      Action = ActionLayoutDefaultEdit
      Category = 8
      ButtonStyle = bsChecked
    end
    object BarButtonLayoutDefaultDebug: TdxBarButton
      Action = ActionLayoutDefaultDebug
      Category = 8
      ButtonStyle = bsChecked
    end
  end
  object DockingManager: TdxDockingManager
    Color = clBtnFace
    DefaultHorizContainerSiteProperties.CaptionButtons = [cbMaximize, cbHide]
    DefaultHorizContainerSiteProperties.CustomCaptionButtons.Buttons = <>
    DefaultHorizContainerSiteProperties.Dockable = True
    DefaultHorizContainerSiteProperties.ImageIndex = -1
    DefaultVertContainerSiteProperties.CaptionButtons = [cbMaximize, cbHide]
    DefaultVertContainerSiteProperties.CustomCaptionButtons.Buttons = <>
    DefaultVertContainerSiteProperties.Dockable = True
    DefaultVertContainerSiteProperties.ImageIndex = -1
    DefaultTabContainerSiteProperties.CaptionButtons = [cbMaximize, cbHide]
    DefaultTabContainerSiteProperties.CustomCaptionButtons.Buttons = <>
    DefaultTabContainerSiteProperties.Dockable = True
    DefaultTabContainerSiteProperties.ImageIndex = -1
    DefaultTabContainerSiteProperties.TabsProperties.CustomButtons.Buttons = <>
    DockStyle = dsVS2005
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Images = DataModuleDebuggerViewData.SmallImages
    Options = [doActivateAfterDocking, doDblClickDocking, doFloatingOnTop, doTabContainerHasCaption, doTabContainerCanAutoHide, doSideContainerCanAutoHide, doTabContainerCanInSideContainer, doRedrawOnResize, doUseCaptionAreaToClientDocking]
    ResizeStyle = drsUpdate
    OnLayoutChanged = DockingManagerLayoutChanged
    Left = 232
    Top = 412
    PixelsPerInch = 96
  end
  object Action1: TAction
    Category = 'File'
    Caption = 'Action1'
  end
  object DropFileTarget1: TDropFileTarget
    DragTypes = [dtCopy, dtLink]
    GetDataOnEnter = True
    OnEnter = DropFileTarget1Enter
    OnDrop = DropFileTarget1Drop
    Target = Owner
    OptimizedMove = True
    Left = 264
    Top = 160
  end
  object PopupMenuMessages: TPopupMenu
    Left = 60
    Top = 556
    object Clear1: TMenuItem
      Action = ActionMessagesClear
    end
  end
  object PopupMenuEditorTabs: TdxRibbonPopupMenu
    BarManager = BarManager
    ItemLinks = <
      item
        Visible = True
        ItemName = 'MenuItemFileClose'
      end
      item
        Visible = True
        ItemName = 'MenuItemFileCloseOtherPages'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'MenuItemFileMainUnit'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'MenuItemFileSave'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'MenuItemFileReadOnlyToggle'
      end>
    Ribbon = RibbonDebug
    UseOwnFont = False
    Left = 220
    Top = 216
    PixelsPerInch = 96
  end
  object BarApplicationMenu: TdxBarApplicationMenu
    BarManager = BarManager
    Buttons = <
      item
        Item = MenuItemFileExit
      end>
    ExtraPane.Items = <>
    ExtraPane.OnItemClick = BarApplicationMenuExtraPaneItemClick
    ItemLinks = <
      item
        Visible = True
        ItemName = 'MenuItemFileOpen'
      end
      item
        Visible = True
        ItemName = 'MenuItemFileNewUnit'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'MenuItemFileSave'
      end
      item
        Visible = True
        ItemName = 'dxBarSubItem1'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'MenuItemFileClose'
      end
      item
        Visible = True
        ItemName = 'MenuItemFileCloseAll'
      end
      item
        Visible = True
        ItemName = 'BarStaticSpacer'
      end
      item
        Visible = False
        ItemName = 'MenuItemFileExit'
      end>
    ItemOptions.ShowShortCuts = True
    ItemOptions.Size = misNormal
    UseOwnFont = False
    OnPopup = BarApplicationMenuPopup
    Left = 100
    Top = 208
    PixelsPerInch = 96
  end
end
