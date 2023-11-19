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
  PixelsPerInch = 96
  TextHeight = 13
  object DockSiteMain: TdxDockSite
    Left = 0
    Top = 157
    Width = 1117
    Height = 581
    AllowDockClients = [dtClient, dtLeft, dtRight, dtBottom]
    Align = alClient
    DockingType = 5
    OriginalWidth = 1117
    OriginalHeight = 581
    object dxLayoutDockSite5: TdxLayoutDockSite
      Left = 225
      Top = 0
      Width = 892
      Height = 581
      ParentShowHint = False
      ShowHint = False
      DockingType = 0
      OriginalWidth = 300
      OriginalHeight = 200
      object dxLayoutDockSite4: TdxLayoutDockSite
        Left = 0
        Top = 0
        Width = 667
        Height = 581
        ParentShowHint = False
        ShowHint = False
        DockingType = 0
        OriginalWidth = 300
        OriginalHeight = 200
        object LayoutDockSiteLeft: TdxLayoutDockSite
          Left = 0
          Top = 0
          Width = 667
          Height = 441
          ParentShowHint = False
          ShowHint = False
          DockingType = 0
          OriginalWidth = 300
          OriginalHeight = 200
          object dxLayoutDockSite2: TdxLayoutDockSite
            Left = 169
            Top = 0
            Width = 498
            Height = 441
            ParentShowHint = False
            ShowHint = False
            DockingType = 0
            OriginalWidth = 300
            OriginalHeight = 200
            object dxLayoutDockSite1: TdxLayoutDockSite
              Left = 0
              Top = 0
              Width = 228
              Height = 441
              ParentShowHint = False
              ShowHint = False
              DockingType = 0
              OriginalWidth = 300
              OriginalHeight = 200
              object dxLayoutDockSite3: TdxLayoutDockSite
                Left = 0
                Top = 0
                Width = 228
                Height = 441
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
                Height = 441
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
                  Width = 224
                  Height = 417
                  Align = alClient
                  PopupMenu = PopupMenuEditorTabs
                  TabOrder = 0
                  TabStop = False
                  Properties.CloseButtonMode = cbmActiveAndHoverTabs
                  Properties.CloseTabWithMiddleClick = True
                  Properties.CustomButtons.Buttons = <>
                  Properties.Images = SmallImages
                  Properties.NewButtonMode = nbmTab
                  Properties.Style = 6
                  OnCanCloseEx = PageControlEditorCanCloseEx
                  OnContextPopup = PageControlEditorContextPopup
                  OnDrawTabEx = PageControlEditorDrawTabEx
                  OnGetImageIndex = PageControlEditorGetImageIndex
                  OnMouseDown = PageControlEditorMouseDown
                  OnNewTabButtonClick = PageControlEditorNewTabButtonClick
                  ClientRectBottom = 417
                  ClientRectRight = 224
                  ClientRectTop = 0
                end
                object StatusBar: TdxStatusBar
                  Left = 0
                  Top = 417
                  Width = 224
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
              Height = 441
              ParentShowHint = False
              ShowHint = False
              ActiveChildIndex = -1
              AllowFloating = True
              AutoHide = False
              CaptionButtons = [cbMaximize, cbHide]
              CustomCaptionButtons.Buttons = <>
              DockingType = 3
              OriginalWidth = 270
              OriginalHeight = 176
              object DockPanelCallStack: TdxDockPanel
                Left = 0
                Top = 0
                Width = 270
                Height = 142
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
                Top = 142
                Width = 270
                Height = 186
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
                Top = 328
                Width = 270
                Height = 113
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
            Height = 441
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
          Top = 441
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
            Width = 663
            Height = 87
            OnVisibleChanged = DockPanelDebugOtherVisibleChanged
            AllowFloating = True
            AutoHide = False
            Caption = 'Messages'
            CaptionButtons = [cbHide, cbClose]
            CustomCaptionButtons.Buttons = <>
            ImageIndex = 56
            TabsProperties.CustomButtons.Buttons = <>
            DockingType = 0
            OriginalWidth = 892
            OriginalHeight = 140
            object ListViewMessages: TListView
              Left = 0
              Top = 0
              Width = 663
              Height = 87
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
              SmallImages = ImageListMessage
              TabOrder = 0
              ViewStyle = vsReport
              OnDblClick = ListViewMessagesDblClick
              OnDeletion = ListViewMessagesDeletion
              OnKeyDown = ListViewMessagesKeyDown
            end
          end
          object DockPanelOutput: TdxDockPanel
            Left = 0
            Top = 0
            Width = 663
            Height = 87
            OnVisibleChanged = DockPanelDebugOtherVisibleChanged
            AllowFloating = True
            AutoHide = False
            Caption = 'Output'
            CaptionButtons = [cbHide, cbClose]
            CustomCaptionButtons.Buttons = <>
            ImageIndex = 57
            TabsProperties.CustomButtons.Buttons = <>
            DockingType = 0
            OriginalWidth = 892
            OriginalHeight = 140
            object MemoOutputWindow: TMemo
              Left = 0
              Top = 0
              Width = 663
              Height = 87
              Align = alClient
              BorderStyle = bsNone
              Ctl3D = False
              Lines.Strings = (
                '')
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 0
            end
          end
          object DockPanelBreakPoints: TdxDockPanel
            Left = 0
            Top = 0
            Width = 663
            Height = 87
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
            ExplicitLeft = 2
            ExplicitTop = -3
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
        Height = 581
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
          Width = 221
          Height = 528
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
          DockingType = 0
          OriginalWidth = 225
          OriginalHeight = 140
        end
        object DockPanelAST: TdxDockPanel
          Left = 0
          Top = 0
          Width = 221
          Height = 528
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
      Height = 581
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
      object ShellListViewFileExplorer: TcxShellListView
        Left = 0
        Top = 21
        Width = 221
        Height = 532
        Align = alClient
        ReadOnly = True
        TabOrder = 0
        ViewStyle = vsReport
        OnExecuteItem = ShellListViewFileExplorerExecuteItem
      end
      object ShellComboBoxFileExplorer: TcxShellComboBox
        Left = 0
        Top = 0
        Align = alTop
        ShellListView = ShellListViewFileExplorer
        TabOrder = 1
        Width = 221
      end
    end
  end
  object RibbonDebug: TdxRibbon
    Left = 0
    Top = 0
    Width = 1117
    Height = 157
    ApplicationButton.KeyTip = 'F'
    ApplicationButton.Menu = BarApplicationMenu
    ApplicationButton.Text = 'File'
    BarManager = dxBarManager1
    Style = rs2016
    ColorSchemeAccent = rcsaOrange
    ColorSchemeName = 'VisualStudio2013Blue'
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
      Active = True
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
    Images = SmallImages
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
  object SmallImages: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 23593404
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000019000000330000
          0033000000330000003300000033000000330000003300000021000000000000
          0000000000000000000000000000000000000000000035240495D88E0DFFD88E
          0DFFD88E0DFFD88E0DFFD88E0DFFD88E0DFFD88E0DFF573E0CB9000000000000
          000B0000000A0000000A0000000A0000000A00000007D88E0DFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD88E0DFF0000002F050C
          105F050B0F5C050B0F5C050B0F5C040A0D590206094ED88E0DFFFFFFFFFFFCF9
          F3FFFBF8F1FFFBF8F2FFFBF8F1FFFCF9F3FFFFFFFFFFD88E0DFF3D88BAF14298
          D2FF3F94D0FF3D92CFFF3D92CEFF3C92D2FF3294DFFFD88E0DFFFFFFFFFFF7F1
          E4FFF7F1E2FFF7F1E2FFF7F1E2FFF7F1E3FFFFFFFFFFD88E0DFF4399D2FF3E94
          D0FFABFBFFFF9BF3FFFF92F1FFFF92F2FFFF8BF6FFFFD88E0DFFFFFFFFFFF3EB
          D9FFF2EAD7FFF2E9D6FFF2E9D6FFF3EAD7FFFFFFFFFFD88E0DFF4297D1FF55AC
          DDFF8EDAF5FFA2EDFFFF82E5FEFF83E7FFFF7CEDFFFFD88E0DFFFFFFFFFFEFE5
          CCFFEEE4CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD88E0DFF4196D1FF70C4
          EAFF6BBCE6FFBBF2FFFF74DEFDFF74DFFFFF70E5FFFFD88E0DFFFFFFFFFFEBDF
          C0FFEBDEBEFFFFFFFFFFC69B4AFFD88E0DFFE2CCA0FFD88E0DFF3F95D0FF90DD
          F8FF43A0D8FFDDFCFFFFDAFAFFFFD9FBFFFFD5FFFFFFD88E0DFFFFFFFFFFE8D8
          B2FFE7D7B1FFFFFFFFFFD88E0DFFF7F2E6FFFFFFFFFFD88E0DFF3D93CFFFB2F6
          FFFF50ACDEFF348ACAFF348ACAFF328BCDFF2C8EDAFFD88E0DFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFE4CC9DFFFFFFFFFFF3DAB3FF796429E33C92CFFFB8F3
          FFFF76DFFEFF7AE0FEFF7BE1FEFF7AE1FFFF75E4FFFFA6A05CFFD88E0DFFD88E
          0DFFD88E0DFFD88E0DFFD88E0DFFD88E0DFFCCAF61FF3498E4FF3B92CFFFC0F3
          FFFF6FD9FBFF72DAFBFF73DAFBFF72DAFBFF71DCFFFF6FE0FFFF47AEEDFF3192
          DDFF3193DEFF3094DFFF3095E0FF3597E0FF3A98DCFF1D4664AD3A92CFFFCAF6
          FFFF68D5F9FF6BD5F9FF69D4F9FF68D4F9FF68D5FAFF68D6FCFF69D9FEFF6ADB
          FFFF6ADBFFFF68DBFFFFDAFEFFFF3B94D3FF0104052F000000003A92CFFFD5F7
          FFFF5FD1F9FF60D0F8FFB4EBFDFFD9F6FFFFDAF8FFFFDAF8FFFFDAF9FFFFDBF9
          FFFFDAF9FFFFDAFAFFFFDFFEFFFF3C94D0FF02060935000000003C94D0FFDCFC
          FFFFD8F7FFFFD8F7FFFFDBFAFFFF348ECDFF3891CEFF3992CFFF3992CFFF3992
          CFFF3992CFFF3992CFFF3C94D0FF377FB1EA00000000000000003A85B8EF3C94
          D0FF3992CFFF3992CFFF3C94D0FF3379A7E40104052B02050832020508330205
          0833020508330206083303070937000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000827D7BE0AEA9
          A6FFACA7A4FFABA7A3FFABA6A2FFABA6A1FFAAA5A0FFAAA59FFFAAA39EFFABA5
          9EFF807A76E00000000000000000000000000000000000000000BDB9B5FFFFFF
          FEFFFFFCFAFFFFFBF8FFFFFCF7FFFFFBF7FFFEFAF5FFFFFAF4FFFEF8F2FFFFFC
          F7FFBAB3ACFF0000000000000000000000000000000000000000BAB8B5FFFFFE
          FBFFFCF8F5FFFBF7F3FFFBF6F2FFFAF5F0FFFAF4EFFFFAF3EDFFF9F2EBFFFEF7
          F3FFB8B2ACFF0000000000000000000000000000000000000000BBB9B8FFFFFF
          FEFFFCFAF8FFFCF9F6FFFCF8F5FFFBF7F3FFFBF6F1FFFAF5EFFFFAF3EDFFFEF9
          F4FFB8B3ADFFAAA5A0FFAAA59FFFAAA39EFFABA59EFF807A76E0BDBBB9FFFFFF
          FFFFFDFDFDFFFDFCFAFFFCFBF9FFFCF9F7FFFBF8F5FFFBF7F3FFFAF5F0FFFFFA
          F6FFBAB5AFFFFEFAF5FFFFFAF4FFFEF8F2FFFFFCF7FFBAB3ACFFBCBBB9FFFFFF
          FFFFFFFFFFFFFEFEFEFFFEFDFEFFFDFCFCFFFDFBF9FFFCF9F7FFFBF7F4FFFFFB
          F8FFBAB5B1FFFAF4EFFFFAF3EDFFF9F2EBFFFEF7F3FFB8B2ACFFBCBAB8FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFDFFFDFBF9FFFCF9F6FFFFFD
          FAFFBAB8B4FFFBF6F1FFFAF5EFFFFAF3EDFFFEF9F4FFB8B3ADFFBBB9B6FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFEFCFCFFFEFAF9FFFFFE
          FCFFBDB9B6FFFBF8F5FFFBF7F3FFFAF5F0FFFFFAF6FFBAB5AFFFBBBAB6FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E0FFD1D1CFFFC1BFBDFFB3B1
          AEFF918F8DFFFDFBF9FFFCF9F7FFFBF7F4FFFFFBF8FFBAB5B1FFBBB8B6FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E7E7FFEDEDECFFF0EBE6FFBEB6
          ADFFAFACA8FFFEFEFDFFFDFBF9FFFCF9F6FFFFFDFAFFBAB8B4FFBBB8B5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEAFFFDF8F2FFC1B9AEFFBBB7
          B1FFFDFDFDFFFEFEFFFFFEFCFCFFFEFAF9FFFFFEFCFFBDB9B6FFBDBAB6FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEAFFB6AEA4FFC6C2BDFFFFFF
          FFFFFFFFFFFFE0E0E0FFD1D1CFFFC1BFBDFFB3B1AEFF888684F9827D7AE0ADAB
          A7FFADA9A6FFADAAA8FFADACA9FFAFAEADFF858484FFC3C2C0FFFFFFFFFFFFFF
          FFFFFFFFFFFFE6E7E7FFEDEDECFFF0EBE6FFBEB6ADFF2D2B299B000000000000
          0000000000000000000000000000BBB8B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFEAEAEAFFFDF8F2FFC1B9AEFF34322E9B00000003000000000000
          0000000000000000000000000000BDBAB6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFEAEAEAFFB4ACA2FE2A2825890000000000000000000000000000
          0000000000000000000000000000827D7AE0ADABA7FFADA9A6FFADAAA8FFADAC
          A9FFAFAEADFF787777F718181773000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000827D7BE0AEA9A6FFACA7A4FFACA7A3FFABA7A3FFABA6A2FFABA6A1FFAAA5
          A0FFAAA59FFFAAA39EFFABA59EFF807A76E00000000000000000000000000000
          0000BDB9B5FFFFFFFEFFFFFCFAFFFFFDF9FFFFFBF8FFFFFCF7FFFFFBF7FFFEFA
          F5FFFFFAF4FFFEF8F2FFFFFCF7FFBAB3ACFF0000000000000000000000000000
          0000BAB8B5FFFFFEFBFFC9C5C3FFE9E6E3FFEAE6E3FFE9E5E1FFE5E1DCFFE5E0
          DCFFE6E0DBFFE7E1DAFFFEF7F3FFB8B2ACFF0000000000000000000000000000
          0000BBB9B8FFFFFFFEFFDBDAD8FFDCDBD8FFD7D5D2FFDAD7D4FFD7D4D0FFD6D1
          CDFFD6D1CCFFDED8D3FFFEF9F4FFB8B3ADFF0000000000000000000000000000
          0000BDBAB8FFFFFFFFFFCDCCCCFFC4C4C2FFC8C7C5FFC9C7C5FFCBC9C6FFC3C0
          BDFFCBC6C3FFC2BEBAFFFFFAF5FFBAB5AFFF0000000000000000000000000000
          0000BCBCBAFFFFFFFFFFF9F9FAFFFCFDFBFFF9F9F8FFF8F7F5FFF9F6F4FFFAF7
          F4FFF9F6F2FFFBF6F1FFFFFBF7FFB9B4B0FF0000000000000000000000000000
          0000BCBCBAFFFFFFFFFFC9C9C9FFC9C9C9FFC7C7C7FFCCCBCCFFC9C9C8FFD2D0
          CEFFE0DEDBFFF9F5F1FFFFFBF7FFB9B5B1FF0000000000000000000000000000
          0000BCBAB8FFFFFFFFFFD8D8D8FFDADADAFFD7D7D7FFD3D3D3FFD6D5D5FFD8D7
          D6FFCFCECCFFEAE6E4FFFFFCF9FFBBB6B2FF0000000000000000000000000000
          0000BCBBB8FFFFFFFFFFD5D5D5FFD3D3D3FFD4D4D4FFD8D8D8FFD6D6D6FFCAC9
          C9FFD0CFCDFFE1DFDCFFFFFDF9FFBAB8B3FF0000000000000000000000000000
          0000BDB9B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF
          FFFFFDFCFAFFFCFAF7FFFFFEFBFFBAB7B5FF0000000000000000000000000000
          0000BBB9B6FFFFFFFFFFFFFFFFFFF0F0F0FFC8C8C8FFC3C3C3FFC6C6C6FFC3C3
          C4FFEAE8E8FFFEFAF9FFFFFEFCFFBDB9B6FF0000000000000000000000000000
          0000BBBAB6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0
          E0FFD1D1CFFFC1BFBDFFB3B1AEFF888684F90000000000000000000000000000
          0000BBB8B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E7
          E7FFEDEDECFFF0EBE6FFBEB6ADFF2D2B299B0000000000000000000000000000
          0000BBB8B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEA
          EAFFFDF8F2FFC1B9AEFF34322E9B000000030000000000000000000000000000
          0000BDBAB6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEA
          EAFFB4ACA2FE2A28258900000000000000000000000000000000000000000000
          0000827D7AE0ADABA7FFADA9A6FFADABA7FFADAAA8FFADACA9FFAFAEADFF7877
          77F7181817730000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000001E000000310000003300000033000000330000
          00310000001E0000000000000000000000000000000000000000000000000000
          00000000000E00000033473117AAAC7637F9B47B37FFB47B36FFB47B37FFAC76
          37F9473117AA000000330000000E000000000000000000000000000000000000
          0012150F076BB47B37FFDEC096FFFEF3DCFFFFFFF3FFFFFFF2FFFFFFF3FFFEF3
          DCFFDEC096FFB47B37FF150F076B0000000E0000000000000000000000001F16
          0B7CB98442FFF9EBD2FFFFFFEFFFFFFFECFFFFFFEDFFFFF7E1FFFFFFEDFFFFFF
          ECFFFFFFEFFFF9EBD2FFB98442FF150F076B00000000000000000000001EB57B
          37FFF9EBD4FFFFFEEBFFFBEDD1FFCBA06AFFB0752EFFB0752FFFB0752EFFCBA0
          6AFFFBEDD1FFFFFEEBFFF9EBD4FFB57B37FF0000001E00000000463217A9DEC0
          98FFFFFEEFFFFAE8CBFFB67D3BFFB27833FFD1AA75FFDCB98BFFD1AA75FFB278
          33FFB67D3BFFFAE8CBFFFFFEEFFFDEC098FF463217A900000000AC7637F9FFF4
          E4FFFFF6DDFFCA9F64FFB27833FFE5C79EFFFFF5D9FFFFF2D5FFFFF5D9FFE5C7
          9EFFB27833FFCA9F64FFFFF6DDFFFFF4E4FFAC7637F900000000B47B36FFFFFF
          FDFFFFEFD1FFB17630FFD1A772FFFFF0D3FFFCE9CAFFFBE7C8FFFCE9CAFFFFF0
          D3FFD1A772FFB17630FFFFEFD1FFFFFFFDFFB47B36FF00000000B47B36FFFFFF
          FEFFFFEBCAFFB17732FFDAB583FFFEE9C9FFFAE4C2FFFAE3C1FFFAE4C2FFFEE9
          C9FFDAB583FFB17732FFFFEBCAFFFFFFFEFFB47B36FF00000000B47B36FFFFFF
          FFFFFDE7C2FFB17732FFD0A56EFFFDE8C5FFFAE3BFFFFAE3C0FFFAE3BFFFFDE8
          C5FFD0A56EFFB17732FFFDE7C2FFFFFFFFFFB47B36FF00000000AA7736F8FFF4
          EAFFFEE8C7FFC99A5EFFB27936FFE2BE8FFFFDE4C0FFAD712BFFFDE4C0FFE2BE
          8FFFB27936FFC99A5EFFFEE8C7FFFFF4EAFFAA7736F8000000003E2B1495DFC1
          9EFFFFF9ECFFF3D2A5FFB67E3BFFB07833FFFEE5BFFFB07631FFFEE5BFFFB078
          33FFB67E3BFFF3D2A5FFFFF9ECFFDFC19EFF3E2B14950000000000000000B57C
          37FFF9EDE1FFFFEFD9FFF0CD9FFFC69556FFFCDEB5FFB07631FFFCDEB5FFC695
          56FFF0CD9FFFFFEFD9FFF9EDE1FFB57C37FF0000000000000000000000001710
          085BB98542FFF9EDE4FFFFF6E9FFF9DDB7FFF8D5A5FFAD7129FFF8D5A5FFF9DD
          B7FFFFF6E9FFF9EDE4FFB98542FF0D0904460000000000000000000000000000
          00000D090446B57C37FFDFC1A1FFFFF5F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFF5
          F1FFDFC1A1FFB57C37FF0D090446000000000000000000000000000000000000
          000000000000000000003E2B1495A97535F7B57C36FFB57C36FFB57C36FFA975
          35F73E2B14950000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000030302201A18
          17A943403DFF494643FF7B7774FF787471FF716D6AFF686360FF5F5A57FF5752
          4EFF524D49FF423E39FF32312FFF2C2B2BFF2C2A28FF22201DA90E0E0E982929
          29FF1E1E1EFF1A1B1BFFD3D1D1FFBBB7B6FFB6B1AFFFBDB9B5FFB1ADA9FFACA6
          A1FFA19A93FF9E9996FF252526FF313132FF19191AFF0D0D0EFF2B2B2BFF3435
          35FF1E1E1EFF181818FFC8C7C7FF151515FF111111FF9B9998FF9D9A98FF8F8B
          87FF84807BFF7D7977FF1D1D1DFF272727FF191919FF0D0D0DFF2F2E2EFF3939
          39FF1F1F1FFF181818FFC8C6C8FF141414FF0C0C0CFF636261FF656463FF615F
          5DFF5A5755FF504D4BFF121212FF191919FF101010FF080808FF323232FF4040
          40FF202020FF19191AFFCACACBFF918F8CFF8E8B88FF959392FF949291FF9492
          91FF949291FF949291FF949291FF949291FF949291FF8F8E8DFF363535FF4444
          44FF1E1E1FFF191A1BFFCBC7C4FF9C968FFF4D4C4AFF4D4C4BFF50504DFFF4F2
          EFFFF4F2EFFFF4F2EFFFF4F2EFFFF4F2EFFFEDE9E5FF92928FFF383838FF4949
          49FF242321FF242321FFC6C6C6FFA7A29AFFDADADAFF545454FFF1F1F1FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F4F2FF92928FFF3B3B3BFF4648
          4AFF8B735DFFD3AC7DFFF3DCBEFFA8A29AFFDADADAFF4D4D4DFFE5E5E5FFFEFE
          FEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFF7F4F2FF92928FFF3E3E3EFF4B4B
          4CFFD8B082FFEEC289FFF3DCBEFFA8A29AFF4D4D4AFF4F4D4DFF515150FFDAD9
          D8FFDAD9D8FFDAD9D8FFDAD9D8FFDCDADAFFDEDDDAFF8F8D8AFF424140FF5050
          50FFFAF4F0FFFEF9F4FFFCF8EFFFA9A49DFFA8A399FFA8A399FFA8A39AFFA8A3
          99FFA8A299FFA8A299FFA8A299FFA8A39AFF9E9890FF8B8784FF444342FF5657
          57FFFAF5F0FFF3E1CBFFF7ECDEFFF7EBDDFFF7EBDCFFF7EBDCFFF6EBDBFFF5E8
          D7FFF5E8D7FFF5E8D7FFF5E9D9FFF9F4F0FFC3C3C3FFB9B9B9FF464645FF4F4F
          4FFFFAF5F1FFFDFAF7FFFDFAF7FFFDF9F6FFFDF9F6FFFDF9F4FFFDF9F4FFFCF8
          F3FFFBF6F0FFFBF7F1FFFBF5F0FFF9F4F0FF4A4B4BFF2B2B2BFF484848FF4B4B
          4BFFFBF5F1FFF3E1CBFFF3E1CBFFF3E0CAFFF2E0C8FFF2DFC8FFF1DFC6FFF0DB
          C1FFEFDBC0FFEFDBC1FFF0DCC4FFF9F4F0FF525252FF2E2E2EFF4B4A4AFF2B2B
          2BFFF8F2EBFFFDFAF7FFFDFAF7FFFDF9F6FFFDF9F6FFFDF9F4FFFDF9F4FFFCF8
          F3FFFBF6F0FFFBF7F1FFFBF5F0FFF9F4F0FF4F4F4FFF2F2F2FFF4D4D4DFF4647
          47FF606161FF676767FF626262FF626262FF646262FF626262FF626161FF6160
          5EFF61605EFF61605EFF626161FF5D5D5CFF565656FF333232FF222121A93737
          37E6353535E6302F2DE62F2E2DE62F2D2DE62E2D2DE62C2C2CE62A2928E62525
          25E6242323E6242323E6242423E62A2929E6333333E61C1B1B98}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000827D7BE0AEA9A6FFACA7A4FFACA7A3FFABA7A3FFABA6A2FFABA6A1FFAAA5
          A0FFAAA59FFFAAA39EFFABA59EFF807A76E00000000000000000000000000000
          0000BDB9B5FFFFFFFEFFFFFCFAFFFFFDF9FFFFFBF8FFFFFCF7FFFFFBF7FFFEFA
          F5FFFFFAF4FFFEF8F2FFFFFCF7FFBAB3ACFF0000000000000000000000000000
          0000BAB8B5FFFFFEFBFFF5F1EEFFF2F0ECFFF9F5F1FFF6F1EDFFF3EEE9FFF2EC
          E7FFF8F1EBFFF6EFE8FFFEF7F3FFB8B2ACFF0000000000000000000000000000
          0000BBB9B8FFFFFFFEFF979695FFA3A2A1FF999796FF9D9B99FFB2B0AFFF9693
          91FFAFACA9FF9A9794FFFEF9F4FFB8B3ADFF0000000000000000000000000000
          0000BDBAB8FFFFFFFFFFFAF9F8FFFBFAF8FFF6F4F2FFF9F7F5FFF8F5F2FFEAE7
          E4FFF9F4F0FFF8F3EDFFFFFAF5FFBAB5AFFF0000000000000000000000000000
          0000BCBCBAFFFFFFFFFF888888FFECEDEBFFACACABFFC9C8C6FFACAAA9FF9190
          8EFFA2A19FFF939290FFFFFBF7FFB9B4B0FF0000000000000000000000000000
          0000BCBCBAFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFF6F5F6FFF2F1F1FFFDFA
          F8FFFCF9F6FFE3DFDCFFFFFBF7FFB9B5B1FF0000000000000000000000000000
          0000BCBAB8FFFFFFFFFFB4B4B4FFB2B2B2FF989898FF969696FFA2A2A2FF9696
          95FF969594FFA6A4A3FFFFFCF9FFBBB6B2FF0000000000000000000000000000
          0000BCBBB8FFFFFFFFFFF3F3F3FFF3F3F3FFF4F4F4FFEDEDEDFFFAFAFAFFFCFB
          FAFFFBF9F7FFFAF7F4FFFFFDF9FFBAB8B3FF0000000000000000000000000000
          0000BDB9B7FFFFFFFFFF9B9B9BFF9E9E9EFFA3A3A3FFC5C5C5FFACACACFF9E9F
          9FFFACACAAFFA1A09EFFFFFEFBFFBAB7B5FF0000000000000000000000000000
          0000BBB9B6FFFFFFFFFFF3F3F3FFF6F6F6FFF2F2F2FFF2F2F2FFF2F2F2FFEDED
          EEFFF2F0F0FFF0ECEBFFFFFEFCFFBDB9B6FF0000000000000000000000000000
          0000BBBAB6FFFFFFFFFFBBBBBBFFB2B2B2FFA8A8A8FFAFAFAFFFB8B8B8FFBFBF
          BFFFBFBFBEFFBDBBB9FFB3B1AEFF888684F90000000000000000000000000000
          0000BBB8B6FFFFFFFFFFEAEAEAFFEEEEEEFFF8F8F8FFFFFFFFFFECECECFFD4D5
          D5FFEDEDECFFF0EBE6FFBEB6ADFF2D2B299B0000000000000000000000000000
          0000BBB8B5FFFFFFFFFFCCCCCCFFC0C0C0FFFFFFFFFFFFFFFFFFA5A5A5FFC7C7
          C7FFFDF8F2FFC1B9AEFF34322E9B000000030000000000000000000000000000
          0000BDBAB6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEA
          EAFFB4ACA2FE2A28258900000000000000000000000000000000000000000000
          0000827D7AE0ADABA7FFADA9A6FFADABA7FFADAAA8FFADACA9FFAFAEADFF7877
          77F7181817730000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00300000003300000033000000330000002B0000000000000000000000230000
          0033000000330000002300000000000000000000000000000000000000003C7D
          C3F24897D8FF4A9CDAFF4897D8FF3670ADDD00000000000000002B5A8BBD4897
          D8FF4898D8FF2C5D8FC000000000000000000000000000000000000000003E82
          CDFF7CF6FFFF79F1FFFF7CF5FFFF3D80CCFF00000033000000334896D7FF7BF4
          FFFF7BF6FFFF3E82CDFF00000000000000000000000000000000000000003D81
          CCFF83F2FFFF55DAFFFF6BE5FFFF4E98D8FF4F9CDAFF4F9BDAFF59ADE2FF80EE
          FFFF7FF0FFFF3C81CCFF00000000000000000000000000000000000000003D82
          CDFF8DF6FFFF76E6FFFF58D9FFFF7BE8FFFF7CE9FFFF7CE9FFFF7BE7FFFF61DD
          FFFF8BF1FFFF3B7FCCFF0000002A000000330001013000000000000000002F65
          9CC04C96D8FF5EADE2FF93EEFFFF45CEFFFF49CFFFFF49D0FFFF49CFFFFF46CF
          FFFF95F0FFFF3E83CDFF316AA8DB3D84CEFF3C7EC2F100000000000000000000
          000000000000519BDAFF9EEFFFFF3ECAFFFF43CBFFFF45CCFFFF44CCFFFF40CB
          FFFF5ED7FFFF96EAFFFF76C7F0FFA1FAFFFF3D84CEFF00000000000000000000
          002300000033529BDAFFA7F0FFFF36C6FFFF3CC8FFFF3EC8FFFF3DC8FFFF38C6
          FFFF5ED5FFFF9EEAFFFF79C7F0FFAAFAFFFF3C84CEFF00000000000000002A5A
          8CBD4F96D8FF68ADE2FFB0EFFFFF2DC0FFFF34C2FFFF36C3FFFF34C2FFFF2DC0
          FFFFB2F1FFFF3E83CDFF306AA8D2448CD2FF3C7EC1EE00000000000000003A83
          CDFFB6F6FFFFB1EEFFFF50CBFFFF20BAFFFF27BCFFFF27BCFFFF24BBFFFF1DBA
          FFFFB9F3FFFF3980CCFF00000000000000000000000000000000000000003A83
          CDFFBFF6FFFFB9F0FFFFBCF0FFFFC1F1FFFF56CBFFFF56CBFFFFC2F1FFFFC0F2
          FFFFC2F6FFFF3A82CDFF00000000000000000000000000000000000000002A5C
          8FB05297D8FF589BDAFF589BDAFF5698D8FFB3E3FCFFBCE9FFFF5698D8FF5A9C
          DAFF5498D8FF2A5C8FB000000000000000000000000000000000000000000000
          00000000000000000000000000001F4B77AB90C6EFFFAFDDFAFF2B69A8DB0000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000003882CDFFDAF8FFFFDAF8FFFF3882CDFF0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000295C8FB05698D8FF5698D8FF397DC1EE0000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000001E0000003300000033000000330000001E00000000000000300000
          003300000033000000330000002B000000000000000000000027000000330000
          003300522AA9008C4BFF008B4AFF008C4CFF00552FAC0000001E3C7DC3F24897
          D8FF4A9CDAFF4897D8FF3670ADDD000000000000000030659ECE4E99E3FF1F90
          89FF009856FF00BB85FF77E0C6FF00BB86FF00995CFF00552FAC3E82CDFF7CF6
          FFFF79F1FFFF7CF5FFFF3D80CCFF00000033000000334997DAFF84F9FFFF0086
          38FF00C089FF00BC83FFFFFFFFFF00BC83FF00C18DFF008C4CFF3D81CCFF83F2
          FFFF55DAFFFF6BE5FFFF4E98D8FF4F9CDAFF4F9BDAFF5BAEE5FF8BF4FFFF0083
          36FF75E6CBFFFFFFFFFFFFFFFFFFFFFFFFFF77E7CEFF008B49FF3D82CDFF8DF6
          FFFF76E6FFFF58D9FFFF7BE8FFFF7CE9FFFF7CE9FFFF7DE8FFFF6CE2FFFF0082
          34FF00CA93FF00C88FFFFFFFFFFF00C990FF00CD99FF008C4BFF3A7BBEEA4C96
          D8FF5EADE2FF93EEFFFF45CEFFFF49CFFFFF49D0FFFF4AD0FFFF4DD2FFFF3FB3
          95FF009D58FF00D29AFF75EED3FF00D49DFF00A365FF00542D97000000000000
          0000519BDAFF9EEFFFFF3ECAFFFF43CBFFFF45CCFFFF44CCFFFF43CCFFFF68DB
          FFFF3FB396FF008336FF008538FF008A3CFF015A34A200000000000000270000
          0033529BDAFFA7F0FFFF36C6FFFF3CC8FFFF3EC8FFFF3DC8FFFF39C7FFFF61D6
          FFFFA4EDFFFF83CAFCFFB4FDFFFF4584DBFF00000000000000002F669ECE4F96
          D8FF68ADE2FFB0EFFFFF2DC0FFFF34C2FFFF36C3FFFF34C2FFFF2DC0FFFFB3F2
          FFFF3F84CEFF316BAAD2468DD4FF3772B0D600000000000000003A83CDFFB6F6
          FFFFB1EEFFFF50CBFFFF20BAFFFF27BCFFFF27BCFFFF24BBFFFF1DBAFFFFB9F3
          FFFF3980CCFF00000000000000000000000000000000000000003A83CDFFBFF6
          FFFFB9F0FFFFBCF0FFFFC1F1FFFF56CBFFFF56CBFFFFC2F1FFFFC0F2FFFFC2F6
          FFFF3A82CDFF00000000000000000000000000000000000000002A5C8FB05297
          D8FF589BDAFF589BDAFF5698D8FFB3E3FCFFBCE9FFFF5698D8FF5A9CDAFF5498
          D8FF2A5C8FB00000000000000000000000000000000000000000000000000000
          000000000000000000001F4B77AA90C6EFFFAFDDFAFF2B69A8DB000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000013882CDFFDAF8FFFFDAF8FFFF3882CDFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000001020203387DC1EE5698D8FF5698D8FF397DC0ED000101010000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000190000
          0033000000330000003300000033000000330000000800000008000000330000
          003300000033000000330000003300000033000000330000001934250796B782
          17FFB68013FFB37905FFD7CFD2FFD8CEC9FF0B0B0A5309060053D9CFCEFFD5CA
          C3FFD4CAC4FFD6CFD2FFB37905FFB68013FFB78217FF34250796B78217FFF6CD
          8BFFF2C67CFFF0C170FFFAF7FBFFFFFFFFFF4B4747FF989392FFFFFFFFFFF7EF
          EAFFF6EFEBFFF9F6FAFFF0C170FFF2C67CFFF6CD8BFFB78217FFB68115FFF3CA
          87FFEDBC6CFFEBB760FFF8F5F7FFFFFFFFFF494440FF948C88FFFFFFFFFFF1E8
          E0FFF0E7E0FFF7F4F7FFEBB760FFEDBC6CFFF3CA87FFB68115FFB68115FFF1CB
          89FFE9B761FFE7B256FFF9F8FBFFFDF7F2FF877E78FF494340FFFEF7F2FFEEE3
          D8FFEDE2D9FFF8F7FBFFE8B256FFE9B761FFF1CB89FFB68115FFB68115FFF3CC
          8EFFE8B259FFE7AE50FFFCFFFFFFECE0D7FFF1E4DAFFF1E5DAFFEDE0D5FFEADD
          D3FFE9DED5FFFBFFFFFFE7AE50FFE8B259FFF3CC8EFFB68115FFB68114FFF3CE
          94FFE6AE50FFE5AB4AFFE6C9A4FFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFDFF
          FFFFFEFFFFFFE6C9A4FFE5AC4AFFE6AE50FFF3CE94FFB68114FFB68114FFF3D0
          9AFFE5A844FFE3A63FFFE2A135FFE29E2EFFE19D2CFFE19D2BFFE19D2BFFE19D
          2CFFE29E2EFFE2A135FFE3A63FFFE5A844FFF3D09AFFB68114FFB68113FFF4D4
          A0FFE1A135FFF2DEB7FFFCFFFFFFFBFFFDFFFBFFFCFFFBFFFDFFFBFFFDFFFBFF
          FDFFFBFFFDFFFBFFFFFFF2DEB7FFE1A135FFF4D4A0FFB68113FFB68013FFF6D8
          A7FFE09C26FFFBFFFFFFFCFBF3FFFCF9EFFFFBF8EEFFFCFAF0FFFCFAF0FFFBF9
          EEFFF9F8EDFFFAF9F1FFFAFEFEFFE09B26FFF6D8A7FFB68013FFB68013FFF8DC
          B0FFE0981BFFFBFBF8FF78777AFFA2A0A2FFFCF6EAFF787778FFA3A1A3FFA09F
          A1FFFAF4E9FF9D9DA0FFF9F9F6FFE0981BFFF8DCB0FFB68013FFB68112FFFCE3
          BCFF9B6003FFFDFCF9FFFDF5E8FFFEF4E7FFFBF2E5FFFCF2E5FFFBF2E5FFFBF2
          E5FFFAF1E3FFF9F1E5FFFCFAF7FF9A6003FFFCE3BCFFB68112FFB68011FFFEE9
          C6FF704000FFFFFFFFFF787879FF797979FFA2A1A1FF9F9F9FFFF6ECDEFF7676
          76FFA1A1A1FF9E9FA0FFFFFFFFFF6F4000FFFEE9C6FFB68011FFB68011FFFDEC
          D1FFDA8600FFFFFFFFFFF1E5D8FFF2E5D8FFF2E5D7FFF0E3D6FFEFE2D5FFF1E4
          D7FFF1E4D6FFEFE3D6FFFFFFFFFFDA8600FFFDECD1FFB68011FFB78114FFFFEC
          CDFFFCE7C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCE7C3FFFFECCDFFB78114FF2B1E057CB781
          13FFB57D0EFFB57B0AFFB57B08FFB57B08FFB57B08FFB57B08FFB57B08FFB57B
          08FFB57B08FFB57B08FFB57B0AFFB57D0EFFB78113FF2B1E057C}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000230000
          0033000000330000003300000033000000330000003300000033000000330000
          003300000033000000330000003300000033000000330000000B5C5C5BC0AFAF
          ADFFAEAEACFFAEAEACFFAEAEACFFAEAEACFFAEAFACFFAFAFADFFAFAFADFFB0B0
          AEFFB5B3AFFFC2BAB1FF3E7BABFF467EAAFF4781ACFF050A0D5EB0B0ADFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF2F76AEFF6E9BBEFF1EADFFFF2B5367AD4391C6FFAEAEABFFFFFF
          FFFFFFFFFFFF969696FFC6C6C6FFFFFFFFFFBCBBBAFF767474FF6E6C6AFF6F6D
          6BFF73706EFF8C8580FFAFA59DFFA0C3D9FFB0ECFFFF3E91C6FFADADABFFFFFF
          FFFFFCFBFBFFFFFFFFFFFFFFFFFF8C8A89FF949493FFD5D5D9FFE1E3E7FFE1E2
          E6FFD6D6DAFF9B9998FF8A8480FFF6EDE7FFBFDFEBFF3E92CAFFADADABFFFFFF
          FFFFF8F8F8FFFEFEFEFFBCBBBAFF9A9998FFE9E6E5FFECC88EFFF5CE7EFFFADC
          8DFFF7E3A9FFE8E8E7FF9E9B9BFFB6AEA7FF3590CCFF00000000ADADABFFFFFF
          FFFFF7F7F6FFC4C4C4FF82807DFFE4E2E2FFF2C284FFFDCD82FFFFD885FFFFE9
          98FFFFF1A2FFF8E5A9FFE2E1E5FF8A807AFF0000000000000000ADADABFFFFFF
          FFFFF5F4F3FFFEFDFCFF7D7A77FFFDF7F4FF1588F5FF52AFFFFF0C8AFFFF489F
          E3FFFFE998FFF9DB8CFFF4F5FAFF878481FF0000000000000000ADADABFFFFFF
          FFFFF2F2F1FFC3C4C4FF827D7AFFFFFCFAFF94CCC0FFB8FBFFFF89F2FFFF088A
          FFFFFFD886FFF3CC7CFFFAFCFFFF898685FF0000000000000000ADADABFFFFFF
          FFFFEFEEEDFFF6F5F4FF8A8886FFF2F2F3FFECB77AFFDBE6F4FF91CDFFFF90C0
          EBFFF6CD8AFFF0CC93FFF1F4F8FF8D8A89FF0000000000000000ADADABFFFFFF
          FFFFECECEBFFBFBFBFFFBEBCBBFFAEADACFFFFFFFFFFE9B87EFFEDBC80FFEEBF
          82FFEEC78FFFFFFFFFFFB3B2B2FF252424810000000000000000ADAEABFFFFFF
          FFFFE9E8E7FFEEEDECFFF2F1F0FF9D9A99FFB1B0B1FFFBFDFFFFFFFFFFFFFFFF
          FFFFFBFDFFFFB4B3B4FF989694FF000000000000000000000000AEAEABFFFFFF
          FFFFE6E6E5FF9B9B9BFFBDBDBCFFE7E6E5FFBCBAB7FF939190FF8C8988FF8C89
          87FF969492FFAFAEACFF515250AB000000000000000000000000AEAEACFFFFFF
          FFFFE1E0DFFFE4E3E1FFE4E3E2FFE4E2E1FFE4E3E2FFFFFFFFFFAAAAA7FFFFFF
          FFFFEDEEEEFF4C4C4BA700000000000000000000000000000000AFAFADFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEA
          EAFF4A4A49A600000000000000000000000000000000000000009D9D9BEFB0B0
          ADFFAEAEACFFAEAEABFFAEAEABFFAEAEABFFADAEABFFAEAEABFFAFAFADFF9494
          93EA000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000060204063B0A1217730A13197A0000000000000000000000000000
          00000000000000000000000000000000000000000009030507400D181F832641
          52D43B6683FC467D9FFF508CB1FF2E5474FF0B141C8000000000000000000000
          000000000008040609470F1A228B284355DB3B6483FD477D9EFF5495BAFF61AB
          D4FF65B2DAFF67B5DDFF477A9FFF41515BFF11212FAA00000000000000000000
          0002294357DD4980A1FF599CC0FF68B4DBFF6CBBE1FF6ABADFFF68B6DCFF66B2
          D8FF64B0D7FF6EB6DBFF224D6DFF7B6E5BFF183247CF00000000000000000406
          08424E86A4FF7BCFF3FF76C8EBFF76C9EBFF76C9EAFF75C6E7FF73C2E6FF6FC0
          E2FF6FBDE3FF62A1C5FF4E6475FF857763FF214969F500000001000000001829
          319B70BDDDFF83D8F6FF81D5F5FF7DD1F1FF7BCEEFFF78CBECFF76C8EAFF74C5
          E7FF75C8EBFF416F90FF9EA4A7FF7D715FFF345F82FF0000011F000000064A78
          8BED8BE5FFFF88DEFCFF85DAF8FF82D7F6FF80D4F3FF7DD1F1FF7ACEEEFF78CC
          EDFF8AD0EEFF0D3655FFF7EBE3FF7B6F5EFF4C7B9AFF01040647080C0E4E75B9
          CEFF8EE5FFFF8AE1FEFF89E1FEFF87DDFCFF85DAF8FF82D7F6FF80D3F3FF7DD2
          F5FF6EAAC8FF415866FFFFFFF5FF7C6F5FFF6397B5FF040A0F6F293A3EA69EE7
          F7FF99EBFFFF8DE5FFFF8FE7FFFF9EEAFFFF8CE2FFFF89E1FEFF87DEFEFF9DE5
          FFFF477696FFA8B0B4FFFFFFF7FF7A7062FF7BB4CFFF0512199777969BF3BCFB
          FFFF97D8EFFF78B5D1FF5D93AFFF3E708EFF82C2DEFF72AECCFF5A8CA8FF3364
          85FF668395FFFFF8F3FFFFFDF7FF7C7467FF99D5EBFF091C2ABE222B308F2952
          68D2162B369F101F2589919CA2FFF4F6F5FF849FAEFFA3B5BFFFCED7D9FFFCF6
          F1FFFFFCF7FFFBF7F4FFFFFDF8FF7E7567FF74A5BDFF0F2330BB000000000000
          00000000000000000012AEAEAFFFFFFFFFFFFFFEFBFFFFFCFAFFFAF7F4FFFAFA
          F6FFFAF8F5FFF9F5F0FFF4EBE5FF7F7569F6040C106400000015000000000000
          00000000000000000000B4B5B4FEFFFFFFFFF9F8F6FFF7F5F2FFFBFAF8FFFBF8
          F8FFFBF7F6FFEBE3DCFFD6C8BAFF48443EBC0000000000000000000000000000
          00000000000000000000AEAEAEF8FFFFFDFFF7F5F2FFFBFBF9FFFCFBF9FFFDFD
          FBFFFEFBF8FFEAE0D3FF655F56E20101011C0000000000000000000000000000
          00000000000000000000BDBDBDFEFFFFFFFFFFFFFFFFFDFBFAFFECE9E5FFD9D6
          D1FFC8C2BAFF776E65EE0403032D000000000000000000000000000000000000
          000000000000000000006C6A67D3756D62EF4F493FD236312BB426231F971A16
          147A0E0D0C5D0101011D00000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000001E000000310000003300000033000000330000
          00310000001E0000000000000000000000000000000000000000000000000000
          00000000000E00000033473117AAAC7637F9B47B37FFB47B36FFB47B37FFAC76
          37F9473117AA000000330000000E000000000000000000000000000000000000
          000E150F076BB47B37FFDEC095FFFDF2DBFFFFFFF1FFFFFFF0FFFFFFF1FFFDF2
          DBFFDEC095FFB47B37FF150F076B0000000E000000000000000000000000150F
          076BB98442FFF8EAD1FFFFFEEBFFFFF9E2FFFFF8E1FFFFF7E1FFFFF7E0FFFFF9
          E2FFFFFEEBFFF8EAD1FFB98442FF150F076B00000000000000000000001EB47B
          37FFF8EAD2FFFFF9E5FFFFF3DAFFFFF4DBFFFFF7DFFFFCEFD4FFFFF5DCFFFFF3
          D9FFFFF3D9FFFFF9E5FFF8EAD2FFB47B37FF0000001E00000000463217A9DEC0
          98FFFFFBEAFFFDEFD3FFFDEED2FFFFF3D9FF8ACE6DFF54AC2BFFFFF8E0FFFEF1
          D6FFFDEED2FFFDEFD3FFFFFBEAFFDEC098FF463217A900000000AC7637F9FEF2
          E1FFFEEFD4FFFBEACBFFFCECCDFFFFF3D6FF56AD32FFA4F589FF57AD30FFFFF5
          DAFFFEEED0FFFCEBCCFFFEEFD4FFFEF2E1FFAC7637F900000000B47B36FFFFFF
          FBFFFBE7C6FFFAE6C6FFFBE8C8FFFFEFD3FF59AF36FF82E261FF93E776FF56AD
          32FFFFF0D4FFFCE9C9FFFBE7C6FFFFFFFBFFB47B36FF00000000B47B36FFFFFF
          FCFFFAE2BEFFF9E2BFFFFAE4C2FFFFEBCDFF5EB138FF6ED24DFF6DD14CFF69D0
          47FF55AC2DFFFCE6C6FFFAE2BFFFFFFFFCFFB47B36FF00000000B47B36FFFFFF
          FFFFF7DFB8FFF7DFB9FFF8E1BCFFFDE8C5FF5EB138FF5AC138FFA1DC8EFF5BAF
          34FFFDE9C7FFF9E1BDFFF8DFB8FFFFFFFFFFB47B36FF00000000AA7736F8FEF4
          E8FFFAE2BFFFF6DAB2FFF7DCB5FFFBE2BDFF59B035FFBBE4B0FF57AE33FFFCE4
          C1FFF8DEB8FFF6DBB3FFFAE2BFFFFEF4E8FFAA7736F8000000003E2B1495DEC1
          9EFFFFF5E8FFF5D7ABFFF5D8AEFFF8DDB5FF82CC63FF55AE31FFFBE1BAFFF7DB
          B3FFF5D8AEFFF5D7ACFFFFF5E8FFDEC19EFF3E2B14950000000000000000B57C
          37FFF8ECE0FFFEEBD4FFF4D2A4FFF5D4A9FFF7D7ADFFF7D8AEFFF6D6ABFFF4D3
          A7FFF4D2A4FFFEEBD4FFF8ECE0FFB57C37FF0000000000000000000000000D09
          0446B98542FFF8ECE3FFFFF3E6FFF7D9B2FFF3CF9FFFF3CF9FFFF3CF9FFFF6D9
          B1FFFFF3E6FFF8ECE3FFB98542FF0D0904460000000000000000000000000000
          00000D090446B57C37FFDFC1A1FFFFF4F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFF4
          F0FFDFC1A1FFB57C37FF0D090446000000000000000000000000000000000000
          000000000000000000003E2B1495A97535F7B47B36FFB47B36FFB47B36FFA975
          35F73E2B14950000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000001000000060000000F0000001500000016000000160000
          00150000000F0000000600000001000000000000000000000000000000000000
          0000000000030000000E00000020000000340000004000000043000000430000
          004000000034000000200000000E000000030000000000000000000000000000
          0003000000120000002D03040F691A2473D12A3ABFFF2A3ABEFF2A3ABEFF2A3A
          BFFF1A2473D103040F690000002D000000120000000300000000000000010000
          000E0000002D12184FB43243C7FF5063EBFF6477FFFF687BFFFF687BFFFF6477
          FFFF5063EBFF3243C7FF12184FB40000002D0000000E00000001000000060000
          002012184EB13445CAFF5F71FEFF6073FEFF5F72FDFF5E71FCFF5E71FCFF5F72
          FDFF6073FEFF5F71FEFF3445CAFF12184EB100000020000000060000000F0304
          0E5D3141C7FF5A6EFCFF5A6EFCFF586DFAFF586CF9FF586CF9FF586CF9FF586C
          F9FF586DFAFF5A6EFCFF5A6EFCFF3141C7FF03040E5D0000000F000000151B24
          72CD475AE6FF566BFAFF5368F8FF5368F7FF5368F7FF5368F7FF5368F7FF5368
          F7FF5368F7FF5368F8FF566BFAFF475AE6FF1B2472CD00000015000000162C3B
          BFFF4F64F6FF4F65F6FF4E64F4FF4E64F4FF4E64F4FF4E64F4FF4E64F4FF4E64
          F4FF4E64F4FF4E64F4FF4F65F6FF4F64F6FF2C3BBFFF00000016000000162B3A
          BFFF6074F8FF475EF3FF485FF2FF485FF2FF485FF2FF485FF2FF485FF2FF485F
          F2FF485FF2FF485FF2FF475EF3FF6074F8FF2B3ABFFF00000016000000152939
          BFFF7185F9FF4058F1FF425AF0FF435BF0FF435BF0FF435BF0FF435BF0FF435B
          F0FF435BF0FF425AF0FF4058F1FF7185F9FF2939BFFF000000150000000F2939
          C0FF94A2F7FF3852EDFF3C55EDFF3E57EDFF3E57EDFF3E57EDFF3E57EDFF3E57
          EDFF3E57EDFF3C55EDFF3852EDFF94A2F7FF2939C0FF0000000F000000061720
          6CC4848FE6FF5A71F0FF334EEBFF3751EBFF3953EBFF3953EBFF3953EBFF3953
          EBFF3751EBFF334EEBFF5A71F0FF848FE6FF17206DC400000006000000010202
          093F3847C7FFA6B2F6FF4C63EEFF2C47E9FF304AE9FF324CE9FF324CE9FF304A
          E9FF2C47E9FF4C63EEFFA6B2F6FF3847C7FF0202093E00000001000000000000
          0004131B59B13E4ECAFFAAB5F6FF7C8EF1FF3D56E9FF2441E5FF2441E5FF3D56
          E9FF7C8EF1FFAAB5F6FF3E4ECAFF0F14459C0000000300000000000000000000
          0000000000030F15449B3646C7FF7A89E3FFA7B2F5FFB0BCF8FFB0BCF8FFA7B2
          F5FF7A89E3FF3646C7FF0F15449B000000030000000000000000000000000000
          000000000000000000010102083817206ABF2737C0FF2636BFFF2636BFFF2737
          C0FF17206ABF0102083800000001000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000001E00000033000000330000
          00330000001E0000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000001E49350BACB78318FFB68217FFB783
          18FF49350BAC0000001E00000000000000000000000000000000000000000000
          000000000000000000000000000049350BACC5922EFFEDC073FFF1C479FFEDC0
          73FFC5922EFF49350BAC00000000000000000000000000000000000000000000
          0000000000000000000000000000B78419FFEAB45BFFE9B45BFFE8B35AFFE9B4
          5BFFEAB45BFFB78419FF00000000000000000000000000000000000000000000
          0000000000000000000000000000B78218FFEBB963FFE3A640FFE3A640FFE3A6
          40FFEBB963FFB78218FF00000000000000000000000000000000000000000000
          0000000000000000000000000000B78318FFEEC684FFE5AA48FFE2A640FFE5AA
          48FFEEC684FFB78318FF00000000000000000000000000000000000000000000
          0000000000000000000000000000402E0A97C6922DFFECC482FFEFC886FFECC4
          82FFC6912BFF402E0A9700000000000000000000000000000000000000000000
          000000000000000000000000000000000000402E0A97B78318FFB68216FFB783
          18FF402E0A970000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000001000000060000000F0000001500000016000000160000
          00150000000F0000000600000001000000000000000000000000000000000000
          0000000000030000000E00000020020202340303034003030343030303430303
          034002020234000000200000000E000000030000000000000000000000000000
          0003000000120101012D10101069595959D18D8D8DFF8D8D8DFF8D8D8DFF8D8D
          8DFF595959D1101010690101012D000000120000000300000000000000010000
          000E0101012D3F3F3FB4969696FFB8B8B8FFCCCCCCFFCFCFCFFFCFCFCFFFCCCC
          CCFFB8B8B8FF969696FF3F3F3FB40101012D0000000E00000001000000060000
          00203E3E3EB1989898FFC7C7C7FFC8C8C8FFC7C7C7FFC6C6C6FFC6C6C6FFC7C7
          C7FFC8C8C8FFC7C7C7FF989898FF3E3E3EB100000020000000060000000F0D0D
          0D5D949494FFC4C4C4FFC4C4C4FFC3C3C3FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2
          C2FFC3C3C3FFC4C4C4FFC4C4C4FF949494FF0D0D0D5D0000000F000000155757
          57CDAFAFAFFFC1C1C1FFBEBEBEFFBEBEBEFFBEBEBEFFBEBEBEFFBEBEBEFFBEBE
          BEFFBEBEBEFFBEBEBEFFC1C1C1FFAFAFAFFF575757CD00000015000000168E8E
          8EFFBBBBBBFFBBBBBBFFBABABAFFBABABAFFBABABAFFBABABAFFBABABAFFBABA
          BAFFBABABAFFBABABAFFBBBBBBFFBBBBBBFF8E8E8EFF00000016000000168D8D
          8DFFC8C8C8FFB5B5B5FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6
          B6FFB6B6B6FFB6B6B6FFB5B5B5FFC8C8C8FF8D8D8DFF00000016000000158C8C
          8CFFD4D4D4FFB0B0B0FFB1B1B1FFB2B2B2FFB2B2B2FFB2B2B2FFB2B2B2FFB2B2
          B2FFB2B2B2FFB1B1B1FFB0B0B0FFD4D4D4FF8C8C8CFF000000150000000F8D8D
          8DFFEAEAEAFFAAAAAAFFADADADFFAEAEAEFFAEAEAEFFAEAEAEFFAEAEAEFFAEAE
          AEFFAEAEAEFFADADADFFAAAAAAFFEAEAEAFF8D8D8DFF0000000F000000065050
          50C4D8D8D8FFC3C3C3FFA7A7A7FFA9A9A9FFABABABFFABABABFFABABABFFABAB
          ABFFA9A9A9FFA7A7A7FFC3C3C3FFD8D8D8FF515151C400000006000000010707
          073F999999FFF7F7F7FFB8B8B8FFA1A1A1FFA3A3A3FFA5A5A5FFA5A5A5FFA3A3
          A3FFA1A1A1FFB8B8B8FFF7F7F7FF999999FF0707073E00000001000000000000
          0004424242B1A0A0A0FFF9F9F9FFD9D9D9FFADADADFF9A9A9AFF9A9A9AFFADAD
          ADFFD9D9D9FFF9F9F9FFA0A0A0FF3333339C0000000300000000000000000000
          0000000000033232329B989898FFD3D3D3FFF7F7F7FFFFFFFFFFFFFFFFFFF7F7
          F7FFD3D3D3FF989898FF3232329B000000030000000000000000000000000000
          00000000000000000001060606384D4D4DBF8B8B8BFF8A8A8AFF8A8A8AFF8B8B
          8BFF4D4D4DBF0606063800000001000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000001000000060000000F0000001500000016000000160000
          00150000000F0000000600000001000000000000000000000000000000000000
          0000000000030000000E00000020000000340000004000000043000000430000
          004000000034000000200000000E000000030000000000000000000000000000
          0003000000120000002D03040F691A2473D12A3ABFFF2A3ABEFF2A3ABEFF2A3A
          BFFF1A2473D103040F690000002D000000120000000300000000000000010000
          000E0000002D12184FB43243C7FF5063EBFF6477FFFF596ADBFF5362CCFF5161
          D0FF5063EBFF3243C7FF12184FB40000002D0000000E00000001000000060000
          002012184EB13445CAFF5F71FEFF6073FEFF5F72FDFF16796EFF00C684FF0685
          53FF5060D5FF5F71FEFF3445CAFF12184EB100000020000000060000000F0304
          0E5D3141C7FF4D5ED9FF4858CAFF4657C8FF4656C7FF008847FF00E4A6FF00BE
          80FF0D8060FF4E60DCFF5A6EFCFF3141C7FF03040E5D0000000F000000151B24
          72CD475AE6FF14786EFF008A48FF008847FF008746FF008847FF00D9A1FF00D8
          A0FF00BC80FF167673FF4A5DD9FF475AE6FF1B2472CD00000015000000162C3B
          BFFF4F64F6FF008947FF42E7C2FF00D7A0FF00D7A0FF00D59FFF00D09CFF00D0
          9CFF00D39FFF00B981FF147771FF4F64F6FF2C3BBFFF00000016000000162B3A
          BFFF6074F8FF008845FF6EE7D0FF00C899FF00C899FF00C899FF00C797FF00C8
          98FF00CA9AFF62E5CDFF008A47FF6074F8FF2B3ABFFF00000016000000152939
          BFFF7185F9FF008946FF99EFE4FF4EE8D5FF50E7D4FF4CE5D1FF94E7D8FF00C3
          97FF5FDFC7FF00B281FF147A80FF7185F9FF2939BFFF000000150000000F2939
          C0FF94A2F7FF107779FF008946FF008744FF008642FF008847FF82E3D6FF59D9
          C4FF00AD7EFF147681FF3852EDFF94A2F7FF2939C0FF0000000F000000061720
          6CC4848FE6FF5A71F0FF334EEBFF3751EBFF3953EBFF008847FF79E3D8FF00AA
          7EFF0A7D65FF334EEBFF5A71F0FF848FE6FF17206DC400000006000000010202
          093F3847C7FFA6B2F6FF4C63EEFF2C47E9FF304AE9FF0F7577FF00AA85FF0384
          54FF2C47E9FF4C63EEFFA6B2F6FF3847C7FF0202093E00000001000000000000
          0004131B59B13E4ECAFFAAB5F6FF7C8EF1FF3D56E9FF2441E5FF2441E5FF3D56
          E9FF7C8EF1FFAAB5F6FF3E4ECAFF0F14459C0000000300000000000000000000
          0000000000030F15449B3646C7FF7A89E3FFA7B2F5FFB0BCF8FFB0BCF8FFA7B2
          F5FF7A89E3FF3646C7FF0F15449B000000030000000000000000000000000000
          000000000000000000010102083817206ABF2737C0FF2636BFFF2636BFFF2737
          C0FF17206ABF0102083800000001000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000024000000330000
          002F000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000004724C100C684FF0073
          3CED000000290000000000000000000000000000000000000000000000000000
          00000000000000000024000000330000003300000033008846FF00E4A6FF00BE
          80FF005E32D90000002100000000000000000000000000000000000000000000
          000000000000004724C1008A47FF008846FF008745FF008846FF00D9A1FF00D8
          A0FF00BC80FF004121B900000022000000000000000000000000000000000000
          000000000000008946FF42E8C2FF00D7A0FF00D7A0FF00D59FFF00D09CFF00D0
          9CFF00D39FFF00B981FF004424BD000000000000000000000000000000000000
          000000000000008844FF6EE8D0FF00C899FF00C899FF00C899FF00C797FF00C8
          98FF00CA9AFF62E6CDFF008A46FF000000000000000000000000000000000000
          000000000000008945FF99F0E4FF4EE9D5FF50E8D4FF4CE6D1FF94E8D8FF00C3
          97FF5FE0C7FF00B281FF003F20AC000000000000000000000000000000000000
          000000000000004222B2008945FF008743FF008641FF008846FF82E4D6FF59DA
          C4FF00AD7EFF003A1EA700000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000008846FF79E4D8FF00AA
          7EFF00592ECF0000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000004222B200AA85FF0072
          3AE9000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001000000000000
          00000A1E0074205F03C702070038000000000000000100000000000000000000
          0000000000000000000000000000000000000000000200000000000000020A19
          006B2D950AE235F810FF1F5605BE020700390000000000000001000000000000
          00000000000000000000000000000000000100000000000000020A1900693392
          10E136FF14FF27FD02FE3BEF16FE225A06BD0307003800000000000000000000
          000000000000000000000000000000000000000000080C1D026B3F9E1FE353FF
          35FF35F10FFE31EB0BFD3BFC18FF4DF22CFF28630EBE03080039000000000000
          000000000000000000000000000300000000050C0145327C0ED849B625F23A9A
          1ADF50E32FFD49EA24FF48C225F03A9F18E344AA1CF11D4F04B0000000000000
          000000000000000000000000000000000000000000120206002F01020020275C
          0DB766E045FF5EDF39FF5BC936FA0E2103720002001C0105002C000000000000
          0000000000000000000000000000000000030000000000000000000000002A61
          12B574DA51FF6AD047FD6AD244FF0A17035B0000000000000000000000000000
          0000000000000000000000000005010400250205012B020500290F21076755A3
          39DA7DE05AFF7BD856FE76DB52FE0C1C055F0000000000000004000000000101
          00320B090465010100320405042543A11FDC6DCC4DF165C542EE6ECB4DEF8DEC
          6FFC8DEE64FE92F06DFD74D356F20A180456000000000000000401010132C6A8
          4BFAC89F1FFFB08C21FA0B0C095461CB3EEFA4FD93FE95F278FC97F578FE8EEE
          68FD92F06DFD93F477FF468B2EC70206012C00000000000000020F0E0C66D8B3
          3FFF866000E7C89F20FF1818107F67D043F0ABFF9EFF9EF986FEA2FD8DFFA2FD
          8EFF96F47DFC66C049E51022086300000000000000020000000002020132DBC1
          74FAD9B442FFC6A94DFA090A084D3E971BCE60BC3EE35AB637E05AB838E153AB
          33D934701EB00915044E00000004000000000000000000000000000000000202
          01330F0F0D660201013300000002000100100101011301010113010101130101
          01120000000B0000000000000000000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000010100320B09046501010032000000000000000000000000000000000000
          0000010100320B09046501010032000000000000000000000000000000000101
          0132C6A84BFAC89F1FFFB08C21FA010100320000000000000000000000000101
          0132C6A84BFAC89F1FFFB08C21FA010100320000000000000000000000000F0E
          0C66D8B33FFF866000E7C89F20FF0B0905660000000000000000000000000F0E
          0C66D8B33FFF866000E7C89F20FF0B0905660000000000000000000000000202
          0132DBC174FAD9B442FFC6A94DFA010100320000000000000000000000000202
          0132DCC374FBD9B442FFC6A94DFA010100320000000000000000000000000000
          0000020201330F0F0D6602010133000000000000000000000000000000000713
          005C265B0AD638611EE00D1A047D000000000000000000000000000000001438
          0299246304CC246304CC143802990000000000000000000000000714015C2463
          04CC46FF24FF35FF10FF246304CC0714015C0000000000000000000000002767
          07CC48FE27FF45FE23FF276707CC00000000000000000814015C276707CC61FF
          4AFF28FE01FF28FE01FF3AFE17FF276707CC0814015C00000000000000002B6B
          0ACC49F829FF47F827FF2B6B0ACC000000000815025C2B6B0ACC81FD6EFF62FB
          46FF49F829FF36F613FF41F71AFF44F724FF2B6B0ACC0815025C000000002E6E
          0DCC5BEF3CFF59EE39FF2E6E0DCC00000000193D07992E6E0DCC2E6E0DCC2E6E
          0DCC68F24FFF4FEC2DFF2E6E0DCC2E6E0DCC2E6E0DCC193D0799000000002F73
          10CC7DEC5DFF69E54AFF2F7310CC000000000000000000000000000000002F73
          10CC74EA57FF63E23FFF2F7310CC000000000000000000000000000000003A82
          1CCA9AF77EFF97F67BFF448F25D10102001B00000000000000000102001B438F
          24D196F679FF94F677FF3A821CCA000000000000000000000000000000002F68
          17B28CE875F897F677FF65B84BE31C3E0E8A0102001B0102001B1C3E0E8A64B8
          48E397F677FF8DE772F82F6817B2000000000000000000000000000000001835
          0C7E6DC255E699F97CFF98F680FD68BB4EE34A972AD14A972AD168BB4DE397F5
          7FFD99F97CFF6AC251E618350C7E000000000000000000000000000000000103
          0020408324C185E071F3A0FD85FF9DFD85FF9EFE8AFF9EFE8AFF9DFD85FF9EFD
          83FF88E071F3408324C101030020000000000000000000000000000000000000
          0000070E0341428526C172C85AE793EE7EF8A0FF8FFFA0FF8FFF93EE7EF872C8
          5AE7428526C1070E034100000000000000000000000000000000000000000000
          000000000000010301201B380F7E36721EB2479227CA479227CA36721EB21B38
          0F7E010301200000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000001F1F1F209999999FE7E7E7EFF6F6
          F6FFF6F6F6FFE7E7E7EF9999999F1F1F1F200000000000000000000000000000
          00000000000000000000000000002E2E2E30E7E7E7EF7B85EEFF0F22E6FF0014
          E5FF0014E5FF0F22E6FF7B85EEFFE7E7E7EF2E2E2E3000000000000000000000
          000000000000000000001F1F1F20E7E7E7EF2E3EE8FF0014E5FF0014E5FF0014
          E5FF0014E5FF0014E5FF0014E5FF2E3EE8FFE7E7E7EF1F1F1F20000000000000
          000000000000000000009999999F7B85EEFF0014E5FF0014E5FF0014E5FF0014
          E5FF0014E5FF0014E5FF0014E5FF0014E5FF7B85EEFF9999999F000000000000
          00000000000000000000E7E7E7EF0F22E6FF0014E5FF0014E5FF0014E5FF0014
          E5FF0014E5FF0014E5FF0014E5FF0014E5FF0F22E6FFE7E7E7EF000000000000
          00000000000000000000F6F6F6FF0014E5FF0014E5FF0014E5FF0014E5FF0014
          E5FF0014E5FF0014E5FF0014E5FF0014E5FF0014E5FFF6F6F6FF000000000000
          00000000000000000000F6F6F6FF0014E5FF0014E5FF0014E5FF0014E5FF0014
          E5FF0014E5FF0014E5FF0014E5FF0014E5FF0014E5FFF6F6F6FF00000000A9A9
          A9AFF6F6F6FFE7E7E7EFF6F6F6FF0F22E6FF2E3EE8FFD7DAF4FFF6F6F6FF7B85
          EEFF0014E5FF0014E5FF0014E5FF0014E5FF0F22E6FFE7E7E7EF00000000F6F6
          F6FF424242FF868686FFF6F6F6FFA9AFF1FFC5C6D3FF6F6F6FFF9AA1F0FF0014
          E5FF0014E5FF0014E5FF0014E5FF0014E5FF7B85EEFF9999999F00000000E7E7
          E7EF868686FF424242FF9C9C9CFFB3B3B3FF646464FFBDC0E8FF0F22E6FF0014
          E5FF0014E5FF0014E5FF0014E5FF2E3EE8FFE7E7E7EF1F1F1F20000000002E2E
          2E30D7D7D7DF919191FF424242FF4D4D4DFFD4D4D4FF8A93EFFF0F22E6FF0014
          E5FF0014E5FF0F22E6FF7B85EEFFD8D9E6EF2E2E2E3000000000000000002E2E
          2E30D7D7D7DF919191FF424242FF4D4D4DFFD4D4D4FFE7E7E7EFE7E7E7EFE7E8
          F5FFD7DAF4FFE7E7E7EF9999999F1F1F1F20000000000000000000000000E7E7
          E7EF868686FF424242FF9C9C9CFFB3B3B3FF595959FFEBEBEBFF4D4D4D500000
          000000000000000000000000000000000000000000000000000000000000F6F6
          F6FF424242FF868686FFD7D7D7DF9999999FD4D4D4FF6F6F6FFFE7E7E7EF2E2E
          2E3000000000000000000000000000000000000000000000000000000000A9A9
          A9AFF6F6F6FFE7E7E7EF2E2E2E30000000009999999FF6F6F6FFF6F6F6FFD7D7
          D7DF0F0F0F100000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000003220BA70E57
          21F7000B03870000000A00000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000011712BFE76FF
          9EFF3BBE5BFF073A16E300030150000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000F6927FF67F9
          8CFF5FF185FF4EE573FF198235FF031E0AC20000002200000000000000000000
          00000000000009092A8F222290FD212192FF212091FF7978BBFF0F6727FF49D9
          6DFF40CA63FF3AC45EFF36BF59FF26AB48FF0C541FF70008036E000000000000
          0000000000001C1B80F4656AFAFF7B85FFFF7883FEFF9AA1FBFF0F6426FF31B5
          52FF2BAA4BFF25A045FF219740FF249441FF2F984AFF0A4E1CF9000000000000
          00000000000017177EF56A70FAFF8896FFFF8693FFFFA4AEFCFF0F6427FF37A5
          53FF399A52FF429858FF539A64FF48985DFF15692AFA02150685000000000000
          000000000000111179F5646AF7FF7783FFFF7581FEFF989FFBFF13652AFF57A2
          6AFF629B71FF629A71FF2A8342FF093F18CD0002002800000000000000000000
          0000000000000D0D73F55C61F0FF6971F7FF6870F6FF969BF6FF1F7B37FF7CA7
          88FF4A975EFF277A45FF5A788BFE000000000000000000000000000000000000
          0000000000000C0B78FD575BEAFF5D63EFFF585EEDFF8C8FF1FF4B9482FF2782
          43FF4B837DFF878DE5FF23237EF5000000000000000000000000000000000000
          000000000000060678FF6164E6FF6E70EAFF6D6FE9FF8384EBFF8D8FECFF9495
          ECFF8E8FECFF6869E4FF05056CF5000000000000000000000000000000000000
          000000000000000074FF6F70E4FF8283E9FF8081E8FF8081E8FF8081E8FF8081
          E8FF8283E9FF6B6CE1FF000069F5000000000000000000000000000000000000
          00000000000000006CFD6868DBFF7D7DE2FF7B7BE1FF7B7BE1FF7B7BE1FF7B7B
          E1FF7D7DE2FF6362D9FF000063F4000000000000000000000000000000000000
          00000000000000002498000069FD00006BFF00006BFF00006BFF00006BFF0000
          6BFF00006BFF000069FD00001F8F000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          200000000000000400000000000000000000000000000000000000000000706B
          67DCA39D96FEA19B95FEA19B95FEAAA49FFE7E7D7BFE303236FF1A1F23FF3135
          38FF878583FE878584FE333739FF1A1F23FF2C2F32FB0102035600000000A7A2
          9DFEFFFFFFFFFFFEFCFFFFFFFAFFFCFAF6FF33373BFF93938DFFDDD8C6FF8285
          83FF2F3235FF313436FF888B88FFDDD7C5FF898885FF111618E100000000A7A2
          9AFEFFFFFDFF55534FFF55524FFF787673FF21272EFF503B1AFF9D8560FF6B59
          3EFF191F23FF1B2226FF48361BFF9D855EFF685538FF181F24FB00000000A6A1
          9BFEFFFFFFFFFDFCFAFFFDFBFAFFFAF8F6FF373D3FFF1F2223FF25221EFF1C22
          25FF1D2429FF2D3439FF2C2F30FF312C25FF1A1F20FF121619E500000000A6A1
          9CFEFFFFFFFF504E4AFF575453FF706E6CFF3B3F3FFF8B9195FFC5C7C8FF4B52
          55FF1D2427FF40494DFFBABEC1FF707679FF293135FF090B0CAD00000000A6A3
          9BFEFFFFFFFFFFFFFFFFFEFEFEFFFCFCFCFFBFC1C2FF4A4E53FFD1D1D2FF5F66
          68FF1B2225FF495257FF9CA1A4FF5E6467FF282D30FF0000003D00000000A6A2
          9BFEFFFFFFFF5D5957FF605C5AFF5D5955FF74726FFF606365FF35393CFF1F26
          2AFF2D3235FF3E4649FF444649FF0F171BFF58595AFF0000000000000000A6A2
          9BFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFF8F8F8FFBFC0C0FF6D6F
          70FF2B2D2FFF252D2FFF656463FF9A9896FFB1ADA6FE0000000000000000A6A2
          9BFEFFFFFFFF676361FF686462FF686561FFC3C2C1FF64605EFF615E5BFFC9C8
          C7FF8A8785FFCCCAC7FF706D6AFFFDF8F3FFA9A39BFE0000000000000000A6A2
          9BFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFD
          FEFFFDFBFAFFFCF9F7FFFBF8F4FFFFFCF7FFA7A19BFE0000000000000000A6A2
          9BFEFFFFFFFF736F6BFFC9C8C8FF66625EFF66635FFF615D59FFC4C3C2FF6664
          60FF5D5956FF5B5653FFFBF8F4FFFFFBF6FFA7A09AFE0000000000000000A6A2
          9BFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
          FFFFFDFCFBFFFCFAF8FFFCF8F5FFFFFBF8FFA7A09AFE0000000000000000A6A2
          9BFEFFFFFFFF827C79FF77716EFF615C58FFC7C6C5FF5A5753FF696763FF726E
          6CFFC7C6C4FF787571FF5C5855FFFFFBF8FFA7A09AFE0000000000000000A6A2
          9BFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
          FFFFFDFCFBFFFCFBF9FFFCF8F5FFFFFBF6FFA7A09AFE0000000000000000A9A4
          9EFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFEFFFFFEFBFFFFFFFCFFA8A39DFE0000000000000000706C
          67DCA49E98FEA29C96FEA29C96FEA29C96FEA29C96FEA29C96FEA29D96FEA29B
          97FEA39C95FEA19C96FEA19B96FEA39D97FE716B67DC00000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000003000000033000000330000
          0033000000330000003300000033000000330000003300000030000000000000
          000000000000000000000000000000000000A57727F2B68123FFB57E1FFFB57E
          1EFFB57E1EFFB57E1EFFB57E1EFFB57E1FFFB68123FFA57727F2000000000000
          000000000000000000000000000000000000B68224FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB68123FF000000300000
          003300000033000000330000003300000033B58021FFFFFFFFFFEADDBAFFEADC
          B8FFE8D9B3FFE7D7B1FFE6D6AFFFE6D6AEFFFFFFFFFFB57E1EFFA57727F2B681
          23FFB57E1FFFB57E1EFFB57E1EFFB47D1DFFB37A19FFB07611FFB07511FFBB8A
          31FFEADCB8FFE7D7B1FFE6D6AFFFE5D5ACFFFFFFFFFFB47D1DFFB68123FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB075
          0FFFFCFBF4FFF9F4E9FFF8F2E6FFF8F2E5FFFFFFFFFFB47D1DFFB57E1EFFFFFF
          FFFFE6D6AEFFE6D6AFFFE6D7B0FFE6D7B0FFE6D6AFFFE6D6AEFFFFFFFFFFAE73
          0DFFF8F5E7FFF4EEDCFFF3ECD9FFF3ECD8FFFFFFFFFFB47D1DFFB47D1DFFFFFF
          FFFFE5D5ACFFE6D6AFFFE6D6AFFFE6D6AFFFE6D6AFFFE5D5ACFFFFFFFFFFAE73
          0DFFF6F0DEFFF1E8D1FFF0E6CDFFF0E7CDFFFFFFFFFFB47D1DFFB47D1DFFFFFF
          FFFFF8F2E5FFF8F2E6FFF8F3E7FFF8F3E7FFF8F2E6FFF8F2E5FFFFFFFFFFAE73
          0DFFF1EAD3FFF7F1E4FFFFFFFFFFFFFFFFFFFFFFFFFFB47E1DFFB47D1DFFFFFF
          FFFFF3ECD9FFF3ECD9FFF3ECDAFFF3ECD9FFF3ECD9FFF3ECD8FFFFFFFFFFAE73
          0DFFEFE4C7FFFFFFFFFFCFAB6CFFAC6F04FFFFFFFFFFB58021FFB47D1DFFFFFF
          FFFFF1E8CFFFF1E8D0FFF1E8D0FFF0E7CFFFF0E6CDFFF0E7CDFFFFFFFFFFAE73
          0DFFEBDEBCFFFFFFFFFFAC6F04FFFFFFFFFFECDCC4FF523B11ACB47D1DFFFFFF
          FFFFEDE3C7FFEDE3C8FFEDE3C7FFF6F0E1FFFFFFFFFFFFFFFFFFFFFFFFFFB075
          10FFFFFFFFFFFFFFFFFFFFFFFFFFECDCC4FF4D360EA700000000B47D1DFFFFFF
          FFFFEBDDBCFFEBDDBDFFEBDCBBFFFFFFFFFFCFAB6CFFAC6F04FFFFFFFFFFB37C
          1BFFB58020FFB57E1FFFB58021FF523B11AC0000000000000000B57E1EFFFFFF
          FFFFE7D8B1FFE7D8B1FFE7D7B0FFFFFFFFFFAC6F04FFFFFFFFFFECDCC3FF4A35
          0FA4000000000000000000000000000000000000000000000000B68123FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECDCC4FF4D360EA70000
          0000000000000000000000000000000000000000000000000000A27627EFB681
          23FFB57E1EFFB47D1DFFB47D1DFFB47E1EFFB58021FF805A1BD5000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000033000000330000001400000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000B97A3CFFB0763EFF23170C8400000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000C1803BFF00000000B2763EFF00000000000000000000
          0000000000000000002100000033000000230000000000000000000000000000
          00000000000000000000C98439FF00000010B97A3CFF00000000000000000000
          00000000002D50351BB0B0763EFF573B20BE0000000000000000000000000000
          00000000000000000000A0672BE01B120771C07E3BFF00000000000000000000
          002395622EE558391CAF00000016A46C3AF60000000000000000000000000000
          0000000000000000000004020126D08735FFC98234FF00000013000000216440
          1DBDA26A30EB0000002B2B1C0E8B905F30E30000000000000000000000000000
          000000000000000000000000000000000000B3906CFF1A1A1A7D603C16B5CC85
          37FFA16A2FE68A5A29D7BE7D3BFF000000000000000000000000000000000000
          000000000000000000000000000000000021AB8967FF9E958EFFE09B4CFF0000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000224C4E51B6D37B1CFFB98B5DFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000002F515050B9ECEDEFFFBDB4A8FFCACCD0FF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000001B93918EEDEBEBEBFF908F8FD3C4C3C3FFC7C6C6FF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00003837379DEBEAEBFFAAA9A8E300000000CDCBCAFFC8C7C5FF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000D4D4D3FFB9B8B7EB0000000000000000D4D2D1FFBDBBBAFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00007E7D7CD3000000000000000000000000D9D7D6FFC2C2C0FF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000D3D1D1FF949290EA000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000B6B4B2FC00000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000008000000080000000800000008000
          0000800000008000000080000000800000008000000080000000000000000000
          00000000000000000000000000000000000080000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080000000000000008686
          86000080800086868600008080008686860080000000FFFFFF00000000000000
          000000000000000000000000000000000000FFFFFF0080000000000000000080
          80008686860000808000868686000080800080000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080000000000000008686
          86000080800086868600008080008686860080000000FFFFFF00000000000000
          000000000000FFFFFF0080000000800000008000000080000000000000000080
          80008686860000808000868686000080800080000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF0080000000FFFFFF008000000000000000000000008686
          86000080800086868600008080008686860080000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF0080000000800000000000000000000000000000000080
          8000868686000080800086868600008080008000000080000000800000008000
          0000800000008000000080000000000000000000000000000000000000008686
          8600008080008686860000808000868686000080800086868600008080008686
          8600008080008686860000808000000000000000000000000000000000000080
          8000868686000000000000000000000000000000000000000000000000000000
          0000000000008686860086868600000000000000000000000000000000008686
          8600868686000000000000000000000000000000000000000000000000000000
          0000000000008686860000808000000000000000000000000000000000000080
          800086868600008080000000000000FFFF00000000000000000000FFFF000000
          0000868686000080800086868600000000000000000000000000000000000000
          00000000000000000000000000000000000000FFFF0000FFFF00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FC00000080000000000000000000000000000000000100000003
          00000003000000030000000300000FC300000003000080070000F87F0000FFFF
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00FFFF0000FFFF0000EFFD0000C7FF0000C3FB0000E3F70000F1E70000F8CF
          0000FC1F0000FE3F0000FC1F0000F8CF0000E1E70000C3F30000C7FD0000FFFF
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          200000000000000400000000000000000000000000000000000000000000706B
          67DCA39D96FEA19B95FEA19B95FEA19B95FEA19B95FEA19B95FEA19B96FEA19B
          94FEA19C94FEA19A95FEA19B95FEA39C95FE716B67DC0000000000000000A7A2
          9DFEFFFFFFFFFFFEFCFFFFFFFAFFFFFDF9FFFFFEF8FFFFFCF8FFFFFBF5FFFFFA
          F5FFFFF9F2FFFFF6F0FFFEF5EEFFFFF9EFFFA7A29BFE0000000000000000A7A2
          9AFEFFFFFDFFE6ECE4FFE6EBE4FFE7EBE4FFFCF8F5FFFBF7F5FFFBF6F2FFFAF5
          F0FFFAF4EEFFF9F3ECFFF9F1EAFFFDF5ECFFA6A099FE0000000000000000A6A1
          9BFEFFFFFFFF257239FF29723DFF2C713EFFFCFAF7FFFCF9F6FFFBF8F4FFFBF7
          F2FFFAF5F0FFFAF4EEFFF9F2ECFFFFF6EEFFA7A099FE0000000000000000A6A1
          9CFEFFFFFFFFFEFDFDFFFEFDFEFFE8F2F3FFE7F0F0FFE7EDEEFFEDF0EFFFEAEC
          EAFFE3E5E2FFFAF5F0FFFAF4EDFFFEF7F1FFA7A09AFE0000000000000000A6A3
          9BFEFFFFFFFFFFFFFFFFFEFEFEFF2E9DB5FF2993A9FF27899EFF6EACB9FF5297
          A4FF1B6575FFF7F2EEFFFAF5EFFFFEF8F1FFA7A09AFE0000000000000000A6A2
          9BFEFFFFFFFFFFFFFFFFFFFFFFFFF4F0EAFFF1ECE5FFF4EFEAFFFDFCFBFFFDFA
          F8FFFCF9F6FFFBF7F3FFFAF5F0FFFFF9F4FFA7A09AFE0000000000000000A6A2
          9BFEFFFFFFFFFFFFFFFFFFFFFFFFA1702FFF8A5712FF9A713EFFFEFDFEFFFDFB
          FAFFFCFAF7FFFCF8F5FFFBF6F2FFFFFBF4FFA7A199FE0000000000000000A6A2
          9BFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDFAFFE8E8F8FFE7E6
          F4FFE6E4F2FFE5E2EEFFE2DFEAFFFFFAF5FFA7A199FE0000000000000000A6A2
          9BFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5454D3FF2C2CC4FF2E2E
          C0FF2828BBFF2C2BB8FF1717AAFFFFFCF7FFA7A19BFE0000000000000000A6A2
          9BFEFFFFFFFFFFFFFFFFFFFFFFFFF8F3ECFFF6F1E9FFF8F4EEFFFFFFFFFFFEFF
          FDFFFDFCFAFFFCFAF7FFFBF8F4FFFDF9F4FFA7A09AFE0000000000000000A6A2
          9BFEFFFFFFFFFFFFFFFFFFFFFFFFC18B44FFB77E36FFBD9157FFFFFFFFFFFEFE
          FFFFFDFCFBFFFCFAF8FFFCF8F5FFFFFBF8FFA7A09AFE0000000000000000A6A2
          9BFEFFFFFFFFECF5EFFFECF5EFFFEAF3EDFFEBF4EDFFEAF3ECFFEDF4EFFFEBF2
          EDFFEAF0EBFFE9EEE7FFFCF8F5FFFFFBF8FFA7A09AFE0000000000000000A6A2
          9BFEFFFFFFFF4DA263FF459B5AFF328F4AFF439659FF2E8946FF4F9A63FF4995
          5CFF428E56FF3E8A51FFFCF8F5FFFFFBF6FFA7A09AFE0000000000000000A9A4
          9EFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFEFFFFFEFBFFFFFFFCFFA8A39DFE0000000000000000706C
          67DCABA5A0FEA8A29DFEA29C96FEA6A09AFEA29C96FEA29C96FEA6A19AFEA7A0
          9CFEA7A19AFEA5A09AFEA19B96FEA39D97FE716B67DC00000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          200000000000000400000000000000000000000000000000000000000000706B
          67DCA39D96FEA19B95FEA19B95FEA19B95FEA19B95FEA29C96FEB3AEAAFEAAB5
          B6FE417784FF136D80FF136E83FF417A86FF818B8DE20000000000000000A7A2
          9DFEFFFFFFFFFFFEFCFFFFFFFAFFFFFDF9FFFFFEF8FFFEFBF8FFD3DFDFFF1A6E
          7EFF1CA1BEFF1FA9C6FF1AA2BEFF1497B3FF156C80FF0002032C00000000A7A2
          9AFEFFFFFDFFE9E7E4FFE9E6E4FFEDEAE6FFFCF8F5FFFBF8F7FF518C96FF28B5
          D2FF33CCE9FF35CDE9FF2FC3DFFF22ADC9FF1497B3FF042D35B700000000A6A1
          9BFEFFFFFFFF423F3CFF464341FF65605AFFFCFAF7FFFCFBF9FF1F8194FF3CDC
          F8FF56E9FFFF5EECFFFF46E1FDFF31C7E3FF1EA8C6FF0C6275F700000000A6A1
          9CFEFFFFFFFFFEFDFDFFFEFDFEFFEDECEAFFEAE9E6FFF2F1EFFF228799FF55EC
          FFFF96FBFFFFACFEFFFF6DF1FFFF3CD7F4FF26B5D1FF0D6073F700000000A6A3
          9BFEFFFFFFFFFFFFFFFFFEFEFEFF5F5A54FF423F3BFF7C7A78FF468590FF51E1
          F8FFA4FFFFFFC5FFFFFF73F3FFFF3DDAF6FF25AFCCFF052C35B700000000A6A2
          9BFEFFFFFFFFFFFFFFFFFFFFFFFFEFEEEEFFEAEAE9FFF0EEEEFFD5E4E7FF2D8C
          9CFF5EE4F6FF70F7FFFF51EAFFFF30C4E0FF1C7284FF0002032D00000000A6A2
          9BFEFFFFFFFFFFFFFFFFFFFFFFFF605C55FF3E3934FF65625EFFFDFCFDFFD5E4
          E7FF5A99A6FF268EA2FF23879CFF55909CFFAFBABAFE0000000000000000A6A2
          9BFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEEFFEAE9E9FFECEB
          E9FFF0EEECFFF3F1F0FFF1EFEDFFFEFAF7FFB2ADA6FE0000000000000000A6A2
          9BFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A6661FF423C37FF4642
          3EFF433F3AFF5A554FFF403C38FFFFFCF7FFA7A19BFE0000000000000000A6A2
          9BFEFFFFFFFFFFFFFFFFFFFFFFFFF0EFEFFFEDECECFFF1F0F0FFFFFFFFFFFEFF
          FDFFFDFCFAFFFCFAF7FFFBF8F4FFFDF9F4FFA7A09AFE0000000000000000A6A2
          9BFEFFFFFFFFFFFFFFFFFFFFFFFF65605AFF55514AFF706B68FFFFFFFFFFFEFE
          FFFFFDFCFBFFFCFAF8FFFCF8F5FFFFFBF8FFA7A09AFE0000000000000000A6A2
          9BFEFFFFFFFFF0F0EFFFF1F1F0FFEFEFEEFFF0F0EFFFEFEFEEFFF1F0F0FFEFEE
          EEFFEEEDEBFFEFECE9FFFCF8F5FFFFFBF8FFA7A09AFE0000000000000000A6A2
          9BFEFFFFFFFF77736EFF706C67FF635E58FF6F6A66FF605B56FF7D7974FF726D
          6AFF6C6763FF726D68FFFCF8F5FFFFFBF6FFA7A09AFE0000000000000000A9A4
          9EFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFEFFFFFEFBFFFFFFFCFFA8A39DFE0000000000000000706C
          67DCABA5A0FEA8A29DFEA29C96FEA6A09AFEA29C96FEA29C96FEA6A19AFEA7A0
          9CFEA7A19AFEA5A09AFEA19B96FEA39D97FE716B67DC00000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          200000000000000400000000000000000000000000000000000000000000706B
          67DCA39D96FEA19B95FEA19B95FEA19B95FEA19B95FEA19B95FEA19B96FEA19B
          94FEA19C94FEA19A95FEA19B95FEA39C95FE716B67DC0000000000000000A7A2
          9DFEFFFFFFFFFFFEFCFFFFFFFAFFFFFDF9FFFFFEF8FFFFFCF8FFFFFBF5FFFFFA
          F5FFFFF9F2FFFFF6F0FFFEF5EEFFFFF9EFFFA7A29BFE0000000000000000A7A2
          9AFEFFFFFDFFE9E7E4FFE9E6E4FFEDEAE6FFFCF8F5FFFBF7F5FFFBF6F2FFFAF5
          F0FFFAF4EEFFF9F3ECFFF9F1EAFFFDF5ECFFA6A099FE0000000000000000A6A1
          9BFEFFFFFFFF423F3CFF464341FF65605AFFFCFAF7FFFCF9F6FFFBF8F4FFFBF7
          F2FFFAF5F0FFFAF4EEFFF9F2ECFFFFF6EEFFA7A099FE0000000000000000A6A1
          9CFEFFFFFFFFFEFDFDFFFEFDFEFFEDECEAFFEAE9E6FFEAE7E4FFEFECEAFFEDE9
          E6FFE5E2DDFFFAF5F0FFFAF4EDFFFEF7F1FFA7A09AFE0000000000000000A6A3
          9BFEFFFFFFFFFFFFFFFFFEFEFEFF5F5A54FF423F3BFF413D3AFF7D7A77FF6663
          60FF34322FFFF7F2EEFFFAF5EFFFFEF8F1FFA7A09AFE0000000000000000A6A2
          9BFEFEFEFEFFFEFEFEFFFEFEFEFFEFEEEEFFE9E9E8FFEEECECFFFDFCFBFFFDFA
          F8FFFCF9F6FFFBF7F3FFFAF5F0FFFFF9F4FFA7A09AFE0000000000000001B0B0
          ACFEEFFCFEFFD7F8FEFFCCF6FEFF7E9EA0FF697471FF787B77FFFDFCFDFFFDFB
          FAFFFCFAF7FFFCF8F5FFFBF6F2FFFFFBF4FFA7A199FE000000000000000B99D1
          D5FEA1EEFEFF82DEFEFF75DAFFFF82DFFEFF9FEEFEFFB8F2F8FFEAECECFFE9E8
          E6FFEAE8E5FFEBE8E5FFE8E4E0FFFFFAF5FFA7A199FE000000000000000F85D4
          E0FE68E2FFFF32BCFFFF39B5FFFF34BEFFFF67E3FFFF75C1D0FF6A7472FF4C48
          44FF433F3AFF5A554FFF403C38FFFFFCF7FFA7A19BFE00000000000506286BC7
          E4FE34BEFFFF6DCEFFFF63C3FFFF6DCFFFFF31BDFEFF7EDBFBFFD7F8FEFFFDFE
          FCFFFDFCFAFFFCFAF7FFFBF8F4FFFDF9F4FFA7A09AFE0000000000080A3363C6
          E9FF3CB5FFFF63C4FFFFF8FFFFFF63C4FFFF33ABF5FF56B9DEFFCCF6FEFFFDFD
          FEFFFDFCFBFFFCFAF8FFFCF8F5FFFFFBF8FFA7A09AFE00000000000506286BC6
          E4FE32BEFFFF6DCFFFFF63C3FFFF6DCEFFFF33BDFEFF7DDBFAFFD0F0F6FFEFEE
          EEFFEEEDEBFFEFECE9FFFCF8F5FFFFFBF8FFA7A09AFE000000000000000F87D2
          DFFE67E3FFFF2BB5F5FF31ADF7FF27B1F3FF58D1EDFF71C1CEFF97A29FFF7772
          6FFF6C6763FF726D68FFFCF8F5FFFFFBF6FFA7A09AFE00000000000000059AD2
          D5FE9FEEFEFF82DFFEFF75DAFFFF82DEFEFFA1EEFEFFBDF7FEFFF8FEFEFFFEFE
          FEFFFFFFFFFFFFFFFEFFFFFEFBFFFFFFFCFFA8A39DFE00000000000000007B7C
          77DDB5BEBBFEA6C4C6FE9DC4C9FEA4C2C5FEAEB7B5FEADACA8FEAAA6A0FEA69F
          9BFEA7A19AFEA5A09AFEA19B96FEA39D97FE716B67DC00000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          200000000000000400000000000000000000000000000000000000000000706B
          67DCA39D96FEA19B95FEA19B95FEA19B95FEA19B95FEA29C96FEB3AEAAFEAAB4
          A9FE3E724AFF126728FF156C2BFF467B52FF828B80E20000000000000000A7A2
          9DFEFFFFFFFFFFFEFCFFFFFFFAFFFFFDF9FFFFFEF8FFFEFBF8FFD2DED2FF1565
          2BFF169637FF199E3BFF159636FF128F32FF196C30FF0002002C00000000A7A2
          9AFEFFFFFDFF55534FFF55524FFF4F4C49FFC1BDBAFF8E8C8AFF386D45FF25AE
          49FF33C659FF34C95BFF2CBB51FF1DA240FF118E31FF052D10B700000000A6A1
          9BFEFFFFFFFFFDFCFAFFFDFBFAFFFDFBF9FFFCFAF7FFFCFBF9FF1C7934FF3CD9
          65FF54ED7BFF5CEF82FF45E16DFF30C156FF189D3AFF0A5D20F700000000A6A1
          9CFEFFFFFFFF504E4AFF575453FF575451FF595753FFDCDAD9FF1E8038FF51EF
          7AFFA6F7BCFFC0F9CFFF6EF392FF3BD463FF20AC46FF08571CF700000000A6A3
          9BFEFFFFFFFFFFFFFFFFFEFEFEFFFEFEFEFFFEFDFEFFFCFCFBFF569366FF4EE1
          75FFB7FAC8FFD7FBE0FF77F498FF3DD865FF1FA644FF04280DB700000000A6A2
          9BFEFFFFFFFF5D5957FF605C5AFF5A5652FF5B5854FFC9C8C7FF8D9A8DFF2584
          3DFF5CE581FF73F897FF4DED77FF2FBF55FF186C2DFF0002002D00000000A6A2
          9BFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFDFCFDFFD5E2
          D8FF579868FF23893EFF21843BFF538C60FFAEB9ACFE0000000000000000A6A2
          9BFEFFFFFFFF676361FF686462FF686561FFC3C2C1FF5F5B59FF565350FFC9C8
          C7FF999795FFDCDAD8FFA09E9CFFFEFAF7FFB2ADA6FE0000000000000000A6A2
          9BFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFD
          FEFFFDFBFAFFFCF9F7FFFBF8F4FFFFFCF7FFA7A19BFE0000000000000000A6A2
          9BFEFFFFFFFF736F6BFFC9C8C8FF66625EFF66635FFF615D59FFC4C3C2FF6664
          60FF5D5956FF5B5653FFFBF8F4FFFFFBF6FFA7A09AFE0000000000000000A6A2
          9BFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
          FFFFFDFCFBFFFCFAF8FFFCF8F5FFFFFBF8FFA7A09AFE0000000000000000A6A2
          9BFEFFFFFFFF827C79FF77716EFF615C58FFC7C6C5FF5A5753FF696763FF726E
          6CFFC7C6C4FF787571FF5C5855FFFFFBF8FFA7A09AFE0000000000000000A6A2
          9BFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
          FFFFFDFCFBFFFCFBF9FFFCF8F5FFFFFBF6FFA7A09AFE0000000000000000A9A4
          9EFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFEFFFFFEFBFFFFFFFCFFA8A39DFE0000000000000000706C
          67DCA49E98FEA29C96FEA29C96FEA29C96FEA29C96FEA29C96FEA29D96FEA29B
          97FEA39C95FEA19C96FEA19B96FEA39D97FE716B67DC00000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000230000
          0033000000330000003300000033000000330000002300000000000000000000
          00230000003300000033000000330000003300000033000000233F3F3DC07573
          71FF6F6C6BFF6C6968FF686664FF656261FF333130C000000000000000003F3F
          3DC0757371FF6F6C6BFF6C6968FF686664FF656261FF333130C0797775FF817D
          7CFF9C9996FF898583FF706E6BFF585655FF5F5C5BFF00000000000000007977
          75FF817D7CFF9C9996FF898583FF706E6BFF585655FF605D5CFF767472FFCFCF
          CFFFD9D7D6FFD0CFCEFFC8C8C7FFC3C1C1FF5D5958FF00000000000000007674
          72FFD0CFCFFFD9D7D6FFD0CFCEFFC8C8C7FFC3C1C1FF5D5A59FF757371FFB3B1
          AFFFCAC9C7FFB0AEADFF91908EFF747371FF5D5958FF00000033000000337674
          72FFB3B1AFFFCAC9C7FFB0AEADFF91908EFF747471FF5E5B5AFF757371FFB3B1
          AFFFCAC9C7FFB1AEAEFF939290FF767573FF5D5958FF797775FF63615FFF7674
          72FFB3B1AFFFCAC9C7FFB1AEAEFF939290FF767573FF5F5C5BFF757371FFB3B0
          AEFFCAC9C7FFB0ADADFF91908EFF747371FF5A5756FF757371FF605E5CFF7573
          71FFB3B1AFFFCAC9C7FFB0ADADFF91908EFF747472FF5E5B5AFF767371FFDEDD
          DDFFEBEBE9FFDBDAD9FFCAC9C8FFBBBAB9FF565352FFD6D5D3FF8C8B89FF7472
          70FFDEDDDCFFEBEBE9FFDBDAD9FFCAC9C8FFBCBCBBFF5D5A59FF797775FF6E6C
          6AFF656160FF5F5C5BFF5D5B59FF5D5959FF1A1A1A9BD3D2D0FF8A8987FF2423
          239B6B6967FF63605FFF615E5DFF605E5CFF605D5CFF2A2828A8000000007673
          72FFBCBAB8FFCDCBCAFFA5A3A2FF7D7B7AFF585554FFD6D5D3FF8C8C89FF7572
          71FFBCBAB7FFCCCAC9FFA4A2A1FF7D7B7AFF5E5B5AFF00000000000000007673
          72FFB9B7B5FFC9C7C6FFA2A09FFF7C7A79FF5B5757FF767371FF605E5CFF7673
          72FFB9B8B5FFC9C7C6FFA2A09FFF7D7B7AFF5F5C5BFF00000000000000007774
          73FFBDBBB9FFCECCCBFFA5A3A2FF7D7B7AFF5D5A59FF7A7876FF63615FFF7875
          74FFBCBBB8FFCECCCBFFA6A4A3FF807D7CFF5F5C5BFF00000000000000003837
          36AE706D6CFF686564FF635F5EFF615D5CFF252423AA00000000000000002F2E
          2DAA6E6B6AFF686564FF666362FF646160FF2E2C2CAE00000000000000000000
          000000000033777473FFCBCAC7FF9B9A99FF615D5CFF00000000000000007774
          73FFCAC8C6FF989796FF5F5C5BFF000000330000000000000000000000000000
          0000797875FF908D8CFF908E8CFF646360FF605D5CFF00000000000000007876
          74FF8E8B8AFF918F8DFF676563FF625F5EFF0000000000000000000000000000
          00007A7876FF72706EFF6C6A68FF686564FF615E5DFF00000000000000007A78
          76FF72706EFF6C6A68FF686564FF625F5EFF0000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000230000
          0033000000330000003300000033000000330000003300000033000000330000
          0033000000330000003300000033000000330000003300000023555555C0A2A2
          A2FFA09FA0FFA09FA0FFA1A0A0FFA09FA0FF9F9F9FFF9F9FA0FF9FA0A1FFA0A0
          A2FFA0A0A2FFA0A0A2FFA0A0A2FFA0A0A1FFA2A2A2FF555555C0A2A2A2FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA2A2A2FFA0A0A0FFFFFF
          FFFFFFFFFFFFFFFFFFFF00782BFFFFFFFFFFFFFFFFFFFFFFFFFFD2944EFFCA7C
          27FFD8A366FFD9A367FFC97B25FFD29148FFFFFFFFFFA0A0A1FFA1A0A0FFFFFF
          FFFF48AE81FF007C32FF008137FF00772AFFFFFFFFFFFFFFFFFFC97B26FFCB83
          31FFD69D5FFFCC8434FFCA812EFFF5EDE5FFFFFFFFFF9FA0A0FFA2A0A1FFFFFF
          FFFF00792CFFFFFFFFFF00792DFFFFFFFFFFFEFBFEFFFAFFFFFFCF8C41FFD49C
          5BFFFFFFFFFFCC8434FFCB802DFFFBFFFFFFFFFFFFFF9F9F9FFFA2A0A1FFFFFF
          FFFF007525FFFFFFFFFFFFFCFFFFFCF9FBFFF7F7F8FFF7FCFFFFF1ECE6FFD191
          49FFDEB68BFFCD8535FFCB802DFFF8FFFFFFFFFFFFFF9F9F9FFFA0A0A0FFFFFF
          FFFFFEF7FBFFFAF9FEFFF8FAFFFFF6FAFFFFF5F8FDFFF5FBFFFFCC8433FFD193
          4CFFE0BE98FFCD8535FFCB802CFFF6FCFFFFFFFFFFFF9F9F9FFF9F9F9FFFFFFF
          FFFFF2F5F8FFDBAF80FFCC8230FFCA7B25FFD9AB77FFF4FDFFFFCA7B26FFD191
          4CFFF5FFFFFFCC8332FFCA7D29FFF2F8FEFFFFFFFFFF9F9F9FFF9F9F9FFFFFFF
          FFFFEFF3F8FFC97820FFF1F9FFFFCE8A3EFFCB7D29FFF1FAFFFFE1C9AFFFCD84
          33FFCA7C27FFCB7D28FFD8A974FFEFF1F5FFFFFFFFFF9F9F9FFF9F9F9FFFFFFF
          FFFFECF2F7FFCA7A24FFEDF7FFFFCF8A3EFFCB7E29FFEDF4FBFFECF0F4FFEDF2
          F7FFEAEBEBFFEAEBEAFFECF0F4FFEAECECFFFFFFFFFF9F9F9FFF9F9F9FFFFFFF
          FFFFEAEFF5FFCB7C26FFCF8E46FFCB7D28FFD5A065FFEAEDF1FFE9E9E9FFE8E8
          E8FFE9E9E9FFE9E9E9FFE8E8E8FFE7E6E5FFFFFFFFFF9F9F9FFF9FA0A0FFFFFF
          FFFFE6EEF5FFCA7B23FFE8F3FDFFE7EEF4FFE6EAEEFFE5E7E7FFE5E5E4FFE4E5
          E4FFE4E5E4FFE4E5E4FFE4E4E3FFE3E3E2FFFFFFFFFF9F9F9FFFA0A0A0FFFFFF
          FFFFD0995AFFC9771DFFE2E2E0FFE2E3E4FFE1E1E1FFE1E0DFFFE1E0DFFFE1E0
          DFFFE1E0DFFFE1E0DFFFE1E0DFFFE1DFDEFFFFFFFFFFA0A0A0FFA2A2A2FFFFFF
          FFFFFFFFFFFFFCEBD8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA2A2A2FF919292EFA2A2
          A2FFA0A1A2FFA0A2A3FFA0A1A2FF9FA0A0FF9F9F9FFF9F9F9FFF9F9F9FFF9F9F
          9FFF9F9F9FFF9F9F9FFF9F9F9FFFA0A0A0FFA2A2A2FF919191EF}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000300000
          0033000000330000003300000033000000330000000000000000000000000000
          0000000000000000000000000000000000000000000000000000A5753CF2B782
          40FFB68241FFB78241FFB88341FFBA8544FF0000000000000000000000000000
          0000000000000000000000000000000000000000002400000031B7823FFFFDE6
          C3FFECBA6CFFEDBC6FFFF2D9B5FF523C22AF0000000000000000000000000000
          000000000000000000000000000000000021624624C1B18042F9B6803DFFF4DB
          B5FFDDA858FFDFAB5DFFC7934BFF5E4222BF00000030000000150000000A0000
          000A0000000A0000001500000031583F21B9BB8746FFBB8746FFB6803DFFF9ED
          D9FFEFD9B8FFDCAE6BFFD7A04FFFC48E46FFA6743BF4271C0E860C0804590C09
          045B0C080459281C0E87AC793CF6C29356FFBB8645FF0E0A0547B88240FFDFC0
          91FFC69453FFEDDABCFFE6CBA3FFDCB47AFFCFA05FFFC6995EFFC4965DFFC597
          5DFFC5975EFFCEA570FFE2C7A0FFC5975CFF523B1EAA00000000BA8544FF4B35
          1AA34732189FBD8B4DFFD9B98FFFE9D4B7FFECDBBFFFEDDBBFFFEDDBBFFFEDDC
          C0FFE7D1B0FFD3B081FFBC8947FF3F2D17960000000000000000000000000000
          000000000000070502334F381CA8A9763AF5B7813DFFB7803DFFB7813DFFB781
          3DFFB8823EFF50391CA80000000A000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000F5A
          3EFF0F5A3EFFBDDCCEFF0F5A3EFF0F5A3EFFBDDCCEFF0F5A3EFF0F5A3EFFBDDC
          CEFF0F5A3EFF0F5A3EFFBDDCCEFF0F5A3EFF0F5A3EFF0000000000000000135F
          42FFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDC
          CEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFF135F42FF0000000000000000BDDC
          CEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDC
          CEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFF00000000000000001E6A
          4CFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDC
          CEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFF1E6A4CFF00000000000000002471
          51FFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDC
          CEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFF247151FF0000000000000000BDDC
          CEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDC
          CEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFF00000000000000003180
          5EFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDC
          CEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFF31805EFF00000000000000003887
          64FFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDC
          CEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFF388764FF0000000000000000BDDC
          CEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDC
          CEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFF00000000000000004494
          6FFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDC
          CEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFF44946FFF00000000000000004A9A
          75FFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDC
          CEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFF4A9A75FF0000000000000000BDDC
          CEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDC
          CEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFF000000000000000053A4
          7DFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDC
          CEFFBDDCCEFFBDDCCEFFBDDCCEFFBDDCCEFF53A47DFF000000000000000056A7
          81FF56A781FFBDDCCEFF56A781FF56A781FFBDDCCEFF56A781FF56A781FFBDDC
          CEFF56A781FF56A781FFBDDCCEFF56A781FF56A781FF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000001E000000310000003300000033000000330000
          00310000001E0000000000000000000000000000000000000000000000000000
          00000000000E00000033473117AAAC7637F9B47B37FFB47B36FFB47B37FFAC76
          37F9473117AA000000330000000E000000000000000000000000000000000000
          000E150F076BB47B37FFDEC095FFFDF2DBFFFFFFF1FFFFFFF0FFFFFFF1FFFDF2
          DBFFDEC095FFB47B37FF150F076B0000000E000000000000000000000000150F
          076BB98442FFF8EAD1FFFFFEEBFFFFF9E2FFFFF8E1FFFFF7E1FFFFF7E0FFFFF9
          E2FFFFFEEBFFF8EAD1FFB98442FF150F076B00000000000000000000001EB47B
          37FFF8EAD2FFFFF9E5FFFFF3DAFFFFF4DBFFFFF7DFFFFCEFD4FFFFF5DCFFFFF3
          D9FFFFF3D9FFFFF9E5FFF8EAD2FFB47B37FF0000001E00000000463217A9DEC0
          98FFFFFBEAFFFDEFD3FFFDEED2FFFFF3D9FF536EE8FF1036C7FFFFF8E0FFFEF1
          D6FFFDEED2FFFDEFD3FFFFFBEAFFDEC098FF463217A900000000AC7637F9FEF2
          E1FFFEEFD4FFFBEACBFFFCECCDFFFFF3D6FF1637C9FF7E91FFFF1439C9FFFFF5
          DAFFFEEED0FFFCEBCCFFFEEFD4FFFEF2E1FFAC7637F900000000B47B36FFFFFF
          FBFFFBE7C6FFFAE6C6FFFBE8C8FFFFEFD3FF1A3BCBFF4861FBFF6075FDFF1637
          C9FFFFF0D4FFFCE9C9FFFBE7C6FFFFFFFBFFB47B36FF00000000B47B36FFFFFF
          FCFFFAE2BEFFF9E2BFFFFAE4C2FFFFEBCDFF1B40CEFF2F4AF0FF2E49EFFF2843
          EFFF1237C7FFFCE6C6FFFAE2BFFFFFFFFCFFB47B36FF00000000B47B36FFFFFF
          FFFFF7DFB8FFF7DFB9FFF8E1BCFFFDE8C5FF1B40CEFF1934E0FF798AF0FF183D
          CBFFFDE9C7FFF9E1BDFFF8DFB8FFFFFFFFFFB47B36FF00000000AA7736F8FEF4
          E8FFFAE2BFFFF6DAB2FFF7DCB5FFFBE2BDFF1839CDFFA1A8F3FF1738CAFFFCE4
          C1FFF8DEB8FFF6DBB3FFFAE2BFFFFEF4E8FFAA7736F8000000003E2B1495DEC1
          9EFFFFF5E8FFF5D7ABFFF5D8AEFFF8DDB5FF4765E8FF1536CAFFFBE1BAFFF7DB
          B3FFF5D8AEFFF5D7ACFFFFF5E8FFDEC19EFF3E2B14950000000000000000B57C
          37FFF8ECE0FFFEEBD4FFF4D2A4FFF5D4A9FFF7D7ADFFF7D8AEFFF6D6ABFFF4D3
          A7FFF4D2A4FFFEEBD4FFF8ECE0FFB57C37FF0000000000000000000000000D09
          0446B98542FFF8ECE3FFFFF3E6FFF7D9B2FFF3CF9FFFF3CF9FFFF3CF9FFFF6D9
          B1FFFFF3E6FFF8ECE3FFB98542FF0D0904460000000000000000000000000000
          00000D090446B57C37FFDFC1A1FFFFF4F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFF4
          F0FFDFC1A1FFB57C37FF0D090446000000000000000000000000000000000000
          000000000000000000003E2B1495A97535F7B47B36FFB47B36FFB47B36FFA975
          35F73E2B14950000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000001E000000310000003300000033000000330000
          00310000001E0000000000000000000000000000000000000000000000000000
          00000000000E00000033473117AAAC7637F9B47B37FFB47B36FFB47B37FFAC76
          37F9473117AA000000330000000E000000000000000000000000000000000000
          000E150F076BB47B37FFDEC095FFFDF2DBFFFFFFF1FFFFFFF0FFFFFFF1FFFDF2
          DBFFDEC095FFB47B37FF150F076B0000000E000000000000000000000000150F
          076BB98442FFF8EAD1FFFFFFECFFFFFAE4FFFFF8E2FFFFF8E1FFFFF8E2FFFFFA
          E4FFFFFFECFFF8EAD1FFB98442FF150F076B00000000000000000000001EB47B
          37FFF8EAD3FFFFFBE8FFFFF9E2FFFFFAE4FFFFFBE5FFFFFBE5FFFFFBE5FFFFFA
          E4FFFFF9E2FFFFFBE8FFF8EAD3FFB47B37FF0000001E00000000463217A9DEC0
          98FFFFFCEBFFFFF4DAFFCEA46FFFBA823CFFBA823CFFBA823CFFBA823CFFBA82
          3CFFCEA46FFFFFF4DAFFFFFCEBFFDEC098FF463217A900000000AC7637F9FEF2
          E1FFFFF1D6FFFFF3D6FFBA823CFFE8B973FFF0BE73FFEFBE73FFF0BE73FFF3C7
          82FFBA823CFFFFF3D6FFFFF1D6FFFEF2E1FFAC7637F900000000B47B36FFFFFF
          FBFFFCE8C8FFFFEFD2FFBA823CFFE0B87CFFDFAC5FFFDFAC61FFDFAC5FFFE0B8
          7CFFBA823CFFFFEFD2FFFCE8C8FFFFFFFBFFB47B36FF00000000B47B36FFFFFF
          FCFFFBE3C0FFFFEACBFFBA823CFFDEBB8AFFCF9A4AFFD09C4DFFCF9A4AFFDEBB
          8AFFBA823CFFFFEACBFFFBE3C0FFFFFFFCFFB47B36FF00000000B47B36FFFFFF
          FFFFF8E0BAFFFCE7C3FFBA823CFFDEC29AFFC08732FFC18835FFC08732FFDEC2
          9AFFBA823CFFFCE7C3FFF8E0BAFFFFFFFFFFB47B36FF00000000AA7736F8FEF4
          E8FFFBE3C1FFFBE1BBFFBA823CFFDDC5A2FFDDC5A3FFDEC5A3FFDDC5A3FFDDC5
          A2FFBA823CFFFBE1BBFFFBE3C1FFFEF4E8FFAA7736F8000000003E2B1495DEC1
          9EFFFFF6E9FFF8DCB2FFCC9D62FFBA823CFFBA823CFFBA823CFFBA823CFFBA82
          3CFFCC9D62FFF8DCB2FFFFF6E9FFDEC19EFF3E2B14950000000000000000B57C
          37FFF9ECE0FFFFEDD6FFF7D7AAFFF9D9AFFFF9DAB1FFF9DBB1FFF9DAB1FFF9D9
          AFFFF7D7AAFFFFEDD6FFF9ECE0FFB57C37FF0000000000000000000000000D09
          0446B98542FFF9ECE4FFFFF4E7FFF7DAB3FFF4D0A0FFF4D0A0FFF4D0A0FFF7DA
          B3FFFFF4E7FFF9ECE4FFB98542FF0D0904460000000000000000000000000000
          00000D090446B57C37FFDFC1A1FFFFF4F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFF4
          F0FFDFC1A1FFB57C37FF0D090446000000000000000000000000000000000000
          000000000000000000003E2B1495A97535F7B47B36FFB47B36FFB47B36FFA975
          35F73E2B14950000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000001E000000310000003300000033000000330000
          00310000001E0000000000000000000000000000000000000000000000000000
          00000000000E00000033473117AAAC7637F9B47B37FFB47B36FFB47B37FFAC76
          37F9473117AA000000330000000E000000000000000000000000000000000000
          000E150F076BB47B37FFDEC095FFFDF2DBFFFFFFF1FFFFFFF0FFFFFFF1FFFDF2
          DBFFDEC095FFB47B37FF150F076B0000000E000000000000000000000000150F
          076BB98442FFF8EAD1FFFFFFECFFFFFAE4FFFFF7E1FFFFF7E0FFFFF7E1FFFFFA
          E4FFFFFFECFFF8EAD1FFB98442FF150F076B00000000000000000000001EB47B
          37FFF8EAD3FFFFFBE8FFFFF9E1FFFFF9E2FFFFF7E0FFFFF6DDFFFFF7E0FFFFF9
          E2FFFFF9E1FFFFFBE8FFF8EAD3FFB47B37FF0000001E00000000463217A9DEC0
          98FFFFFCEBFFFFF4DAFFCEA46FFFAE732DFFCFA570FFFFF9E1FFCFA570FFAE73
          2DFFCEA46FFFFFF4DAFFFFFCEBFFDEC098FF463217A900000000AC7637F9FEF2
          E1FFFFF1D6FFFFF3D6FFAF7531FFF7C57AFFB07733FFFFFBE2FFB07733FFF7C5
          7AFFAF7531FFFFF3D6FFFFF1D6FFFEF2E1FFAC7637F900000000B47B36FFFFFF
          FBFFFCE8C8FFFFEFD2FFB07835FFF0BB75FFB27937FFFFF8DFFFB27937FFF0BB
          75FFB07835FFFFEFD2FFFCE8C8FFFFFFFBFFB47B36FF00000000B47B36FFFFFF
          FCFFFBE3C0FFFFEBCBFFB17936FFE7B26DFFB27B38FFFFF4D8FFB27B38FFE7B2
          6DFFB17936FFFFEBCBFFFBE3C0FFFFFFFCFFB47B36FF00000000B47B36FFFFFF
          FFFFF8E0BAFFFDE7C5FFB27A37FFDFA768FFB37B39FFFFF0D1FFB37B39FFDFA7
          68FFB27A37FFFDE7C5FFF8E0BAFFFFFFFFFFB47B36FF00000000AA7736F8FEF4
          E8FFFBE3C1FFFBE2BCFFB27935FFE5C092FFB27B38FFFFEAC8FFB27B38FFE5C0
          92FFB27935FFFBE2BCFFFBE3C1FFFEF4E8FFAA7736F8000000003E2B1495DEC1
          9EFFFFF6E9FFF8DCB2FFCC9E64FFB17835FFCDA067FFFCE2BCFFCDA067FFB178
          35FFCC9E64FFF8DCB2FFFFF6E9FFDEC19EFF3E2B14950000000000000000B57C
          37FFF9ECE0FFFFEDD6FFF7D7ABFFF8D9AFFFF7D8AEFFF6D7ACFFF7D8AEFFF8D9
          AFFFF7D7ABFFFFEDD6FFF9ECE0FFB57C37FF0000000000000000000000000D09
          0446B98542FFF9ECE4FFFFF4E7FFF7DAB2FFF3CF9FFFF3CF9FFFF3CF9FFFF7DA
          B2FFFFF4E7FFF9ECE4FFB98542FF0D0904460000000000000000000000000000
          00000D090446B57C37FFDFC1A1FFFFF4F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFF4
          F0FFDFC1A1FFB57C37FF0D090446000000000000000000000000000000000000
          000000000000000000003E2B1495A97535F7B47B36FFB47B36FFB47B36FFA975
          35F73E2B14950000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000001E000000310000003300000033000000330000
          00310000001E0000000000000000000000000000000000000000000000000000
          00000000000E00000033473117AAAC7637F9B47B37FFB47B36FFB47B37FFAC76
          37F9473117AA000000330000000E000000000000000000000000000000000000
          000E150F076BB47B37FFDEC095FFFDF2DBFFFFFFF1FFFFFFF0FFFFFFF1FFFDF2
          DBFFDEC095FFB47B37FF150F076B0000000E000000000000000000000000150F
          076BB98442FFF8EAD1FFFFFFECFFFFFAE4FFFFF7E0FFFFF6DFFFFFF7E0FFFFF9
          E3FFFFFFECFFF8EAD1FFB98442FF150F076B00000000000000000000001EB47B
          37FFF8EAD3FFFFFBE8FFFFF9E1FFFCEFD5FFFFF5DCFFFFF2D9FFFFF3DAFFFFF7
          DFFFFFF8E0FFFFFBE8FFF8EAD3FFB47B37FF0000001E00000000463217A9DEC0
          98FFFFFCEBFFFFF4DAFFCDA16BFFB17936FFFFF8E0FFFFF2D8FFFFF3DAFFCDA1
          6BFFCDA16BFFFFF5DBFFFFFCEBFFDEC098FF463217A900000000AC7637F9FEF2
          E1FFFFF1D6FFFFF3D6FFB17936FFF5CB89FFB17936FFFFF6DCFFFFF6DCFFCE99
          47FFB17936FFFFF4D8FFFFF1D6FFFEF2E1FFAC7637F900000000B47B36FFFFFF
          FBFFFCE8C8FFFFEFD2FFB17936FFE2AF61FFE7BA75FFB17936FFFFF6DDFFCE99
          47FFB17936FFFFF1D4FFFCE8C8FFFFFFFBFFB47B36FF00000000B47B36FFFFFF
          FCFFFBE3C0FFFFEBCCFFB17936FFD29E4EFFD19D4CFFD19D4CFFD19D4CFFCE99
          47FFB17936FFFFEDCDFFFBE4C1FFFFFFFCFFB47B36FF00000000B47B36FFFFFF
          FFFFF8E0BAFFFDE7C5FFB17936FFC28A37FFF5CB89FFB17936FFFFEECFFFCE99
          47FFB17936FFFFE9C6FFF9E1BAFFFFFFFFFFB47B36FF00000000AA7736F8FEF4
          E8FFFBE3C1FFFBE1BCFFB17936FFF5CB89FFB17936FFFDE5C2FFFDE5C2FFCE99
          47FFB17936FFFDE3BDFFFBE3C1FFFEF4E8FFAA7736F8000000003E2B1495DEC1
          9EFFFFF6E9FFF8DCB2FFCDA16BFFB17936FFFBE1BAFFF8DCB4FFF8DDB7FFD3A3
          61FFCDA16BFFFADDB3FFFFF7E9FFDEC19EFF3E2B14950000000000000000B57C
          37FFF9ECE0FFFFEDD6FFF7D7AAFFF7D8ADFFF6D6ABFFF4D4A9FFF5D5AAFFF7D7
          ACFFF8D7ABFFFFEDD7FFF9ECE0FFB57C37FF0000000000000000000000000D09
          0446B98542FFF9ECE4FFFFF4E7FFF7DAB2FFF3CF9FFFF3CF9EFFF3CF9EFFF7D9
          B2FFFFF4E7FFF9ECE4FFB98542FF0D0904460000000000000000000000000000
          00000D090446B57C37FFDFC1A1FFFFF4F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFF4
          F0FFDFC1A1FFB57C37FF0D090446000000000000000000000000000000000000
          000000000000000000003E2B1495A97535F7B47B36FFB47B36FFB47B36FFA975
          35F73E2B14950000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000001E000000310000003300000033000000330000
          00310000001E0000000000000000000000000000000000000000000000000000
          00000000000E00000033473117AAAC7637F9B47B37FFB47B36FFB47B37FFAC76
          37F9473117AA000000330000000E000000000000000000000000000000000000
          000E150F076BB47B37FFDEC095FFFDF2DBFFFFFFF1FFFFFFF0FFFFFFF1FFFEF2
          DCFFDEC096FFB47B37FF150F076B0000000E000000000000000000000000150F
          076BB98442FFF8EAD1FFFFFEEBFFFFF9E2FFFFF7DFFFFFF7E0FFFFFAE4FFFFFE
          E9FFFFFFEEFFF8EAD1FFB98442FF150F076B00000000000000000000001EB47B
          37FFF8EAD3FFFFFAE6FFFFF4DBFFFFF3D9FFFFF3D9FFFFF6DDFFFFFDE7FFBE84
          3CFFFFFBE4FFFFFBE8FFF8EAD3FFB47B37FF0000001E00000000463217A9DEC0
          98FFFFFDEDFFFFF4DAFFFFF5DBFFFFF3DAFFFFF3D9FFFFF9E2FFBE843CFFBE84
          3CFFFFFDE6FFFFF5DCFFFFFDEDFFDEC098FF463217A900000000AC7637F9FFF3
          E2FFFFF5DBFFCDA36BFFBE843CFFBE843CFFFFF5D9FFBE843CFFCC9E64FFBE84
          3CFFBE843CFFCDA36CFFFFF5DBFFFFF3E2FFAC7637F900000000B47B36FFFFFF
          FDFFFFEED0FFBE843CFFFFF6DBFFFFF2D6FFFFEED1FFFFF3D7FFBE843CFFBE84
          3CFFFFFBE1FFBE843CFFFFEED0FFFFFFFDFFB47B36FF00000000B47B36FFFFFF
          FEFFFFEAC9FFBE843CFFFFF2D5FFBE843CFFFFEDCFFFFFEACBFFFFEED0FFBE84
          3CFFFFF2D5FFBE843CFFFFEAC9FFFFFFFEFFB47B36FF00000000B47B36FFFFFF
          FFFFFCE6C1FFBE843CFFFFF2D2FFBE843CFFBE843CFFFFEAC9FFFCE7C4FFFFEA
          C9FFFFEDCDFFBE843CFFFCE6C1FFFFFFFFFFB47B36FF00000000AA7736F8FFF4
          EAFFFDE7C5FFCC9E64FFBE843CFFBE843CFFCC9E64FFBE843CFFFCE4BFFFBE84
          3CFFBE843CFFCB9D63FFFDE7C5FFFFF4EAFFAA7736F8000000003E2B1495DFC1
          9EFFFFF7EAFFF9DDB3FFFEE4BDFFBE843CFFBE843CFFFCE2BCFFF8DDB5FFF9DE
          B6FFFADEB6FFF8DBB2FFFFF7EAFFDFC19EFF3E2B14950000000000000000B57C
          37FFF9ECE0FFFFEDD6FFF9D9ACFFBE843CFFFADCB3FFF6D7ACFFF4D4A9FFF4D4
          A7FFF5D3A6FFFFECD5FFF9ECE0FFB57C37FF0000000000000000000000000D09
          0446B98542FFF9ECE4FFFFF6E8FFF9DDB6FFF5D1A1FFF3CF9FFFF3CF9EFFF6D9
          B1FFFFF3E6FFF8ECE3FFB98542FF0D0904460000000000000000000000000000
          00000D090446B57C37FFDFC1A1FFFFF5F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFF4
          F0FFDFC1A1FFB57C37FF0D090446000000000000000000000000000000000000
          000000000000000000003E2B1495A97535F7B47B36FFB47B36FFB47B36FFA975
          35F73E2B14950000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000010000
          0026000000330000003300000033000000260000000300000000000000300000
          0033000000330000003300000033000000330000003300000033000000386634
          0AC9AE5912FFAD5811FFAE5912FF67350DCA0201003D000000039F9F9DF2AFAF
          ADFFAEAEABFFADADABFFADADABFFAEAEACFFAFB2B3FFB2B0ABFFAD5914FFCD8D
          49FFE6B675FFE4B270FFE6B675FFCD8E4BFFAE5A14FF01000031B0B0ADFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC98B56FFC9823BFFDEAA
          66FFDAA25AFFFFFFFFFFDAA25AFFDEAA67FFCB8845FF68360DCAAEAEABFFFFFF
          FFFFFDFDFCFFFCFCFBFFFCFCFBFFFDFEFFFFFFFFFFFFA64800FFD99F59FFD69C
          57FFD3944BFFFFFFFFFFD3944BFFD69C57FFDBA35FFFAF5A14FFADADABFFFFFF
          FFFFF8F8F8FFF8F8F8FFF8F8F8FFF9FAFBFFFEFFFFFFA64800FFDCAB70FFD191
          48FFCF8C40FFFFFFFFFFCF8C40FFD19148FFDEAD75FFAE5912FFADADABFFFFFF
          FFFFF6F5F5FFF6F5F5FFF6F5F5FFF7F7F8FFFCFFFFFFA64700FFE8CAA5FFCB86
          38FFCA8435FFC8812FFFCA8435FFCB8739FFEACEABFFAE5911FFADADABFFFFFF
          FFFFF3F2F2FFF3F2F2FFF3F2F2FFF4F3F4FFF7FBFFFFC0804AFFCE9762FFDFB7
          89FFC88235FFFFFFFFFFC88335FFE1B98CFFD2A06FFF61330BBEADADABFFFFFF
          FFFFF0F0EFFFF0F0EFFFF0F0EFFFF0F1F0FFF2F5F6FFEBE6E1FFAB5104FFCB94
          5DFFE9CBAAFFE8CAA8FFEACEAFFFCF9C6AFFAE5810FF0000000DADADABFFFFFF
          FFFFEEECEBFFEEEDECFFEEEDECFFEEEDECFFEEEEEDFFF0F2F4FFE8E2DEFFBD7E
          47FFA74700FFAA4D00FFAD5409FF5F3109BC0000000D00000000ADADABFFFFFF
          FFFFEAE9E9FFEBEAEAFFEBEAEAFFEAE9E9FFF4F4F4FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFAFBBC3FF00000000000000000000000000000000ADADABFFFFFF
          FFFFE7E7E6FFE8E8E7FFE8E8E7FFE6E7E5FFFFFFFFFFCBCCCBFFA7A7A5FFA6A7
          A5FFFFFFFFFFAFB3B4FF00000000000000000000000000000000AEAEABFFFFFF
          FFFFE4E3E2FFE5E4E3FFE5E4E3FFE4E3E2FFFFFFFFFFA7A7A4FFEBEBEAFFFFFF
          FFFFE9E9E9FF4F4F4FAC00000000000000000000000000000000AEAEACFFFFFF
          FFFFE0DFDEFFE1DFDEFFE1DFDEFFE0DFDEFFFFFFFFFFA5A5A3FFFFFFFFFFE8E8
          E8FF4B4B49A70000000000000000000000000000000000000000AFAFADFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9FF4949
          48A60000000000000000000000000000000000000000000000009D9D9BEFB0B0
          ADFFAEAEACFFAEAEABFFAEAEABFFADAEABFFAEAEABFFAFAFADFF949493EA0000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000230000
          0033000000330000003300000033000000330000003300000033000000330000
          00330000003300000033000000220000000000000000000000005C5C5BC0AFAF
          ADFFAEAEABFFADADABFFADADABFFAEAEACFFB0AEADFFB1AFAEFFB5B0B0FFC5B4
          B9FF00843DFF00C482FF004323BD000000210000000000000000B0B0ADFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF00813BFF00E3A4FF00BE80FF004121B90000002100000000AEAEABFFFFFF
          FFFFFDFDFDFFFCFCFDFFFEFDFEFFFFFFFFFF4CB083FF007B32FF007D35FF0080
          39FF00803CFF00D8A1FF00D8A0FF00BC80FF004121B900000022ADADABFFFFFF
          FFFFFAF8F8FFF9F8F8FFFDFAFAFFFFFFFFFF007B30FF38E4BBFF00D59DFF00D6
          9FFF00D59EFF00D09CFF00D09CFF00D39FFF00B981FF004424BDADADABFFFFFF
          FFFFF6F6F6FFF6F6F6FFFAF8F9FFFFFFFFFF007B31FF69E6CDFF00C899FF00C8
          99FF00C899FF00C797FF00C898FF00CA9AFF62E6CDFF008A46FFADADABFFFFFF
          FFFFF4F4F3FFF4F4F3FFF7F6F5FFFFFDFFFF007B30FF90ECDEFF49E7D2FF4DE7
          D2FF4CE6D1FF93E8D7FF00C397FF5FE0C7FF00B281FF003F20ACADADABFFFFFF
          FFFFF2F1F0FFF2F1F0FFF4F2F1FFFFF7F9FF46AB7CFF007B30FF007C32FF007E
          35FF007E35FF81E4D5FF58DAC4FF00AD7DFF003A1EA700000000ADADABFFFFFF
          FFFFEFEFEEFFEFEFEEFFF0EFEEFFF4F1F1FFFDF5F7FFFFF7FCFFFFF9FEFFFFFE
          FFFF008035FF71E1D3FF00A97AFF00381CA40000000000000000ADADABFFFFFF
          FFFFECEBEAFFEDECEBFFEDECEBFFEEECEBFFEFECECFFF0ECECFFF2EDEEFFFFF3
          F7FF007A2CFF00A173FF40976BFF000000000000000000000000ADADABFFFFFF
          FFFFE9E9E8FFEAEAE9FFEAEAE9FFEAEAE9FFE9E9E8FFF3F4F2FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFC0B2B5FF000000000000000000000000ADAEABFFFFFF
          FFFFE7E5E4FFE8E7E6FFE8E7E6FFE8E7E6FFE7E5E4FFFFFFFFFFCCCCCAFFA8A7
          A5FFA8A6A4FFFFFFFFFFB2AFAEFF000000000000000000000000AEAEABFFFFFF
          FFFFE3E3E2FFE4E4E3FFE4E5E4FFE4E4E3FFE3E3E2FFFFFFFFFFA7A7A4FFEBEB
          EAFFFFFFFFFFE9E9E9FF4F4F4EAC000000000000000000000000AEAEACFFFFFF
          FFFFE0DFDEFFE1DFDEFFE1E0DFFFE1DFDEFFE0DFDEFFFFFFFFFFA5A5A3FFFFFF
          FFFFE8E8E8FF4B4B49A700000000000000000000000000000000AFAFADFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9
          E9FF494948A600000000000000000000000000000000000000009D9D9BEFB0B0
          ADFFAEAEACFFAEAEABFFAEAEABFFAEAEABFFADAEABFFAEAEABFFAFAFADFF9494
          93EA000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000230000
          0033000000330000003300000033000000330000002200000000000000000000
          00220000003300000033000000330000003300000033000000233F3F3DC07573
          71FF6F6C6BFF6C6968FF686664FF656261FE2E2D2CB900000000000000003B3A
          39B9757371FE6F6C6BFF6C6968FF686664FF656261FF333130C0797775FF7F7D
          7CFE989592FC85817FFB6C6A67FA514F4EF43A3736C600000000000000004947
          47C6757372F49A9794FD898583FF706E6BFF585655FF605D5CFF767472FEC7C7
          C7FAA8A6A5E0999998DB8F8F8FD86F6D6DC00404043A381D0299140A005C0606
          053A7C7B7BC5C7C5C4F4CECDCCFEC8C8C7FFC3C1C1FF5D5A59FF73716FFC8A88
          87E00D0D0D43040403270202022401010120000000086B3A07CC6B3A07CC180E
          03630909093A7A7978C6A4A4A3F78F8E8CFE747471FF5E5B5AFF716F6DFB8482
          81DB0505042844280A9C744410CD74440FCD74430FCC74430FCCFFC537FF7443
          0FCC1B1105630C0C0C3F888686E08F8E8CFC767573FF5F5C5BFF716F6DFB8482
          80DB040404257E4D17CDFFE392FFFFD569FFFFD15CFFFFD15CFFFFD15CFFFFD8
          72FF7E4D17CD0505052A838080DC8D8C8AFB747472FF5E5B5AFF726F6DFBA4A3
          A3DB050505284E32129C88571DCD87561DCD86561DCC86561DCCFFE597FF8656
          1DCC1F1408630E0E0E3FA8A8A8E0C5C4C3FCBCBCBBFF5D5A59FF777573FC5554
          52E007060643020202270101012401010120000000048F5E23CC8F5E23CC1E14
          07600505053A3C3A3AC65B5857F7605E5CFE605D5CFF2A2828A800000000726F
          6EFA918F8EE0979594DB767574D8474545C00404043A583C199E22170A640605
          053A706F6DC5BAB8B7F4A2A09FFE7D7B7AFF5E5B5AFF00000000000000007673
          72FEB5B3B1FCC3C1C0FB9C9A99FA72706FF4363434C607070741060606414745
          44C6A9A8A5F4C5C3C2FDA2A09FFF7D7B7AFF5F5C5BFF00000000000000007774
          73FFBDBBB9FFCECCCBFFA5A3A2FF7D7B7AFE575453F75E5C5BE04D4B49E0706D
          6DF7BAB9B6FECECCCBFFA6A4A3FF807D7CFF5F5C5BFF00000000000000003837
          36AE706D6CFF686564FF635F5EFF615D5CFF242323A900000000000000002E2E
          2CA96E6B6AFF686564FF666362FF646160FF2E2C2CAE00000000000000000000
          000000000033777473FFCBCAC7FF9B9A99FF615D5CFF00000000000000007774
          73FFCAC8C6FF989796FF5F5C5BFF000000330000000000000000000000000000
          0000797875FF908D8CFF908E8CFF646360FF605D5CFF00000000000000007876
          74FF8E8B8AFF918F8DFF676563FF625F5EFF0000000000000000000000000000
          00007A7876FF72706EFF6C6A68FF686564FF615E5DFF00000000000000007A78
          76FF72706EFF6C6A68FF686564FF625F5EFF0000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000030403220506
          052A0506052A0405042500000005000000000000000000000003000000000000
          00000000000000000000000000000000000000000000000000003E971BCE67D0
          43F061CB3EEF43A11FDC01040025000000030000000000000000000000000000
          000100000000000000000000000000000000000000000000000060BC3EE3ABFF
          9EFFA4FD93FE6DCC4DF10205012B0000000000000012050C0145000000080000
          00000000000200000000000000000000000000000000000000005AB637E09EF9
          86FE95F278FC65C542EE02050029000000000206002F327C0ED80C1D026B0000
          00020000000000000001000000000000000000000000000000005AB838E1A2FD
          8DFF97F578FE6ECB4DEF0F210767000000000102002049B625F23F9E1FE30A19
          006900000002000000000000000000000000000000000000000053AB33D9A2FD
          8EFF8EEE68FD8DEC6FFC55A339DA2A6112B5275C0DB73A9A1ADF53FF35FF3392
          10E10A19006B00000000010100320B090465010100320000000034701EB096F4
          7DFC92F06DFD8DEE64FE7DE05AFF74DA51FF66E045FF50E32FFD35F10FFE36FF
          14FF2D950AE21023038FC6A84BFAC89F1FFFB08C21FA010100320915044E66C0
          49E593F477FF92F06DFD7BD856FE6AD047FD5EDF39FF49EA24FF31EB0BFD27FD
          02FE35F810FF375F1DDDD8B33FFF866000E7C89F20FF0B090566000000041022
          0863468B2EC774D356F276DB52FE6AD244FF5BC936FA48C225F03BFC18FF3BEF
          16FE1F5605BE070D035FDBC174FAD9B442FFC6A94DFA01010032000000000000
          00000206012C0A1804560C1C055F0A17035B0E2103723A9F18E34DF22CFF225A
          06BD0207003900000000020201330F0F0D660201013300000000000000000000
          0002000000000000000000000000000000000002001C44AA1CF128630EBE0307
          0038000000000000000100000000000000000000000000000000000000000000
          0000000000020000000400000004000000000105002C1D4F04B0030800390000
          0000000000010000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000230000
          0033000000330000003300000033000000330000003300000033000000330000
          003300000033000000330000003300000033000000330000002360440CC0B67D
          0DFFB47A08FFB47906FFB47A08FFB67C0CFFB78011FFB67D0DFFB67B09FFB67B
          09FFB67B08FFB57B08FFB67B08FFB67C09FFB77E0EFF60440CC0B67D0DFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB17400FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB77E0EFFB47A08FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAE6F00FFFFFFFFFF929091FF8A87
          86FF7B7878FFFAFCFDFF8D8B8AFF797778FFE8ECF8FFB67D0AFFB47906FFFFFF
          FFFFFDFEFFFFFCFCFCFFFDFEFFFFFFFFFFFFAE6E00FFFFFFFFFF8B8988FFF8F7
          F7FF8E8B89FFF0F0EFFFF0EFEEFFEFEFF0FFFFFFFFFFB67C09FFB47906FFFFFF
          FFFFF7F8F9FFF7F7F6FFF7F8F9FFFFFFFFFFAE6F00FFFFFFFFFF939192FF8B88
          88FF7D7A79FFE2E3E2FF8F8C8CFF7A787AFFE8EDF9FFB77D0AFFB47906FFFFFF
          FFFFF2F3F3FFF2F2F1FFF2F3F3FFFFFFFFFFAF7000FFFFFFFFFFEFF5FEFFEFF2
          FCFFEBEFF8FFFFFFFFFFEFF3FCFFEBF0F9FFFFFFFFFFB77E0EFFB47907FFFFFF
          FFFFECEDEEFFECECEBFFECEDEEFFFFFFFFFFB07300FFB17300FFB17100FFB171
          00FFB17100FFB07000FFB07100FFB17100FFB37600FFB88111FFB47A07FFFFFF
          FFFFE8E8E8FFE8E7E6FFE8E8E8FFFFFFFFFFAF7000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB67D0CFFB47A07FFFFFF
          FFFFE2E2E3FFE3E2E1FFE2E2E3FFFFFFFFFFAE6E00FFFFFFFFFFEFF1F3FFF0F1
          F1FFF0F1F2FFF0F1F2FFF0F1F1FFEFF1F3FFFFFFFFFFB57A08FFB57A07FFFFFF
          FFFFDCDCDCFFDDDCDAFFDCDCDCFFFFFFFFFFAE6E00FFFFFFFFFFE4E4E4FFE5E4
          E3FFE5E4E3FFE5E4E3FFE5E4E3FFE4E4E4FFFFFFFFFFB47A07FFB57A07FFFFFF
          FFFFD4D5D5FFD5D5D4FFD5D5D6FFFFFFFFFFAD6E00FFFFFFFFFFD6D7D7FFD7D7
          D6FFD8D8D7FFD8D8D7FFD7D7D6FFD6D7D7FFFFFFFFFFB47A07FFB57B09FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAD7000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB57B09FFB67E0FFFF5DD
          B6FFDB9D36FFDB9D37FFDB9E38FFDCA03DFFDEA241FFDCA03DFFDB9E38FFDB9D
          38FFDB9D38FFDB9D38FFDB9D37FFDB9D36FFF5DDB6FFB67E0FFFB88215FFEFD0
          9EFFECCD99FFECCD99FFECCD9AFFECCE9BFFEDCE9BFFECCE9BFFECCD9AFFECCD
          9AFFECCD9AFFECCD9AFFECCD99FFECCD99FFEFD09EFFB88215FFA37418EFB882
          16FFB78114FFB68113FFB68114FFB68114FFB68114FFB68114FFB68114FFB681
          14FFB68114FFB68114FFB68113FFB78114FFB88216FFA37418EF}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000230000
          0033000000330000003300000033000000330000003300000033000000330000
          0033000000330000003300000033000000330000003300000023032E58C00553
          A8FF0450A6FF0450A6FF0450A6FF0450A6FF0450A6FF0450A6FF0450A6FF0450
          A6FF0450A6FF0450A6FF0350A6FF0450A6FF0553A8FF032E58C00757ABFF17D5
          FEFF04CBF9FF04CAF8FF07CBF8FF04CAF8FF04CAF8FF07CBF8FF04CAF7FF04CA
          F7FF07CBF8FF04CAF7FF01C9F7FF02CBF8FF16D5FEFF0657ABFF0759AEFF23CC
          F7FFF3FFFFFFF2FFFFFF00B9EFFFF6FFFFFFF6FFFFFF00B9EEFFF7FFFFFFF7FF
          FFFF00B9EEFFF5FFFFFFF0FFFFFFF3FFFFFF58DCFBFF0659AEFF085DB1FF35CC
          F5FF009DD4FF27A2D1FF009DD4FF00B2EBFF00B3EBFF00B4ECFF00B3EBFF00B3
          EBFF02B3EAFF00B2EAFF00B1EAFF00B2EAFF39CCF5FF085DB1FF0861B4FF42CA
          F3FFB6EEFDFFE3FCFFFFB9EEFDFF02B0EBFF0083BFFF00AFECFF0084BFFF02AF
          EAFF06AFE9FF07AFE9FF05AFE9FF01AEE9FF4FCEF4FF0A62B5FF0865B9FF5CCD
          F2FFE2FCFFFF1CB1E8FFE0FCFFFF1D96CBFFEAFFFFFF0077BBFFF3FFFFFF00A6
          E5FF04A9E6FF05A9E6FF03A8E6FF00A7E6FF62CFF3FF0B67B9FF096ABCFF64CB
          F0FFE2FDFFFF0093DEFFDFFBFFFFDFFCFFFFE3FEFFFFE9FFFFFFF0FFFFFF009F
          E1FF00A1E2FF009FE1FF009DE1FF009CE1FF70D0F2FF0B6ABCFF0A6EBFFF76CF
          F1FFE0FDFFFF008BDAFFE2FDFFFF22ACE5FF0094DDFF0096DEFF0098DEFF009A
          DFFF0099DEFFF6FFFFFFEFFFFFFFECFFFFFF9ADFF6FF0B6EBFFF0C72C4FF93D7
          F3FFAAE6F8FFDEFCFFFFA0DFF6FF0092DBFF0090DAFF0091DBFF0092DBFF0092
          DBFF0090DAFF008DDAFF008BD9FF008AD9FF93D8F3FF0D73C4FF1079C8FFA9DF
          F6FFA0D9F3FF9ED8F3FFA2D9F3FFA9DDF5FFAEDFF5FFAFDFF6FFAFDFF6FFAFDF
          F6FFAEDFF5FFACDEF5FFABDEF5FFAADEF5FFADE1F7FF1179C8FF0B3D61B0127D
          CBFF0F7BCBFF0E7BCAFF0F7BCBFF107BCBFF117CCBFF117CCBFF117CCBFF117C
          CBFF117CCBFF117CCBFF117CCBFF117CCBFF137ECCFF0B3D61B0000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000230000
          0033000000330000003300000033000000330000003300000033000000330000
          00330000003300000033000000230000000000000000000000005C5C5BC0AFAF
          ADFFAEAEACFFAEAEACFFAFAEADFFAFAFACFFAFAFADFFB0AFADFFAFAFACFFAEAE
          ABFFAEAEABFFAFAFADFF5C5C5BC0000000000000000000000000B0B0ADFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFB0B0ADFF000000000000000000000000AEAEABFFFFFF
          FFFFFFFFFFFFFFFFFFFF008241FFFFFFFFFF43576CFF365679FF357DCEFFFFFF
          FFFFFFFFFFFFFFFFFFFFAEAEABFF000000000000000000000000ADADABFFFFFF
          FFFFFFFDFFFF007E3DFFFFFFFFFF008944FF567B9CFF7CA3B4FF87CFFCFF1D57
          90FFFFFFFFFFFFFFFFFFAFAFACFF000000000000000000000000ADADABFFFFFF
          FFFFFCF8FAFFFFFBFEFFFFFCFFFFFFFFFFFF3AA7EFFF88E4FFFF7DD3FFFF0B95
          FFFF235B90FFFFFFFFFFB6B3AEFF000000000000000000000000ADADABFFFFFF
          FFFFF7F5F5FFFDF7F8FFFFF9FBFFFFFAF9FFFFFFF8FF1D6DC1FF3DC4FFFF29A9
          FFFF1298FFFF296095FFC5BBB1FF000000000000000000000000ADADABFFFFFF
          FFFFF9F3F3FFFFF8FBFF008241FFFFF9FCFFFFF8F6FFFFFFF5FF2573C4FF43C7
          FFFF2AABFFFF119BFFFF28659FFF000000330000000000000000ADADABFFFFFF
          FFFFF9F2F3FF00813FFFFFFAFFFF008342FFFFF8FAFFFFF8F6FFA0948BFF2573
          C4FF3FC6FFFF1FAAFFFF83B0D7FF7D7770FF0000003300000000ADADABFFFFFF
          FFFFF2EDEDFFF8F0F1FFFBF1F3FFFFF3F6FF00813FFFFAF1F1FFF9F2EFFFFFF7
          EEFF1B6FC4FFACD9EEFF91887EFFC1BFB8FF767B6DFF00000033ADADABFFFFFF
          FFFFEAE9E9FFECEAEAFFEDEBEBFFF1ECEDFFF3EDEEFFF9F5F5FFFFFFFFFFFFFF
          FFFFFFFFFFFF807872FFE9E6E2FF888B82FFBA79B6FF9868CAFFADAEABFFFFFF
          FFFFE7E5E4FFE8E7E6FFE8E7E6FFE9E7E6FFE8E6E5FFFFFFFFFFCCCCCAFFA8A7
          A5FFA9A8A6FFFFFFFFFF7C7D76FFE1B1DFFFCB96C6FFAE7CCEFFAEAEABFFFFFF
          FFFFE3E3E2FFE4E4E3FFE4E5E4FFE4E4E3FFE3E3E2FFFFFFFFFFA7A7A4FFEBEB
          EAFFFFFFFFFFEAEBEAFF3E403D98C087D5FFBE8AD3FF00000000AEAEACFFFFFF
          FFFFE0DFDEFFE1DFDEFFE1E0DFFFE1DFDEFFE0DFDEFFFFFFFFFFA5A5A3FFFFFF
          FFFFE8E8E8FF494948A600000000000000000000000000000000AFAFADFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9
          E9FF494948A600000000000000000000000000000000000000009D9D9BEFB0B0
          ADFFAEAEACFFAEAEABFFAEAEABFFAEAEABFFADAEABFFAEAEABFFAFAFADFF9494
          93EA000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000001E000000310000003300000033000000330000
          00310000001E0000000000000000000000000000000000000000000000000000
          00000000000E00000033473117AAAC7637F9B47B37FFB47B36FFB47B37FFAC76
          37F9473117AA000000330000000E000000000000000000000000000000000000
          000E150F076BB47B37FFDEC095FFFDF2DBFFFFFFF1FFFFFFF0FFFFFFF1FFFDF2
          DBFFDEC095FFB47B37FF150F076B0000000E000000000000000000000000150F
          076BB98442FFF8EAD1FFFFFEEBFFFFF9E2FFFFF8E1FFFFF7E1FFFFF7E0FFFFF9
          E2FFFFFEEBFFF8EAD1FFB98442FF150F076B00000000000000000000001EB47B
          37FFF8EAD2FFFFF9E5FFFFF3DAFFFFF4DBFFFFF7DFFFFCEFD4FFFFF5DCFFFFF3
          D9FFFFF3D9FFFFF9E5FFF8EAD2FFB47B37FF0000001E00000000463217A9DEC0
          98FFFFFBEAFF546FE8FF1137C7FFFFF3D9FFFFF7DFFF5570E8FF1238C7FFFEF1
          D6FFFDEED2FFFDEFD3FFFFFBEAFFDEC098FF463217A900000000AC7637F9FEF2
          E1FFFEEFD4FF1738C9FF7E91FFFF153AC9FFFEF4DAFFFEF5DCFF7E91FFFF163B
          C9FFFEEED0FFFCEBCCFFFEEFD4FFFEF2E1FFAC7637F900000000B47B36FFFFFF
          FBFFFBE7C6FF1B3CCBFF4962FBFF6175FDFF1738C9FFFDF0D5FFFDF2D7FF6275
          FDFF1839C9FFFCE9C9FFFBE7C6FFFFFFFBFFB47B36FF00000000B47B36FFFFFF
          FCFFFAE2BEFF1C41CEFF304BF0FF2F4AEFFF2944EFFF1338C7FFFCECCEFFFCEE
          D1FF2A45EFFF1439C7FFFAE2BFFFFFFFFCFFB47B36FF00000000B47B36FFFFFF
          FFFFF7DFB8FF1C41CEFF1A35E0FF7A8AF0FF193ECBFFFAE4C1FFFAE5C4FF7B8A
          F0FF1A3FCBFFF9E1BDFFF8DFB8FFFFFFFFFFB47B36FF00000000AA7736F8FEF4
          E8FFFAE2BFFF193ACDFFA1A8F3FF1839CAFFF8DCB5FFF8DDB7FFA1A8F3FF193A
          CAFFF8DEB8FFF6DBB3FFFAE2BFFFFEF4E8FFAA7736F8000000003E2B1495DEC1
          9EFFFFF5E8FF4865E8FF1637CAFFF8DDB5FFF7D8AFFF4965E8FF1738CAFFF7DB
          B3FFF5D8AEFFF5D7ACFFFFF5E8FFDEC19EFF3E2B14950000000000000000B57C
          37FFF8ECE0FFFEEBD4FFF4D2A4FFF5D4A9FFF7D7ADFFF7D8AEFFF6D6ABFFF4D3
          A7FFF4D2A4FFFEEBD4FFF8ECE0FFB57C37FF0000000000000000000000000D09
          0446B98542FFF8ECE3FFFFF3E6FFF7D9B2FFF3CF9FFFF3CF9FFFF3CF9FFFF6D9
          B1FFFFF3E6FFF8ECE3FFB98542FF0D0904460000000000000000000000000000
          00000D090446B57C37FFDFC1A1FFFFF4F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFF4
          F0FFDFC1A1FFB57C37FF0D090446000000000000000000000000000000000000
          000000000000000000003E2B1495A97535F7B47B36FFB47B36FFB47B36FFA975
          35F73E2B14950000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000001E000000310000003300000033000000330000
          00310000001E0000000000000000000000000000000000000000000000000000
          00000000000E00000033473117AAAC7637F9B47B37FFB47B36FFB47B37FFAC76
          37F9473117AA000000330000000E000000000000000000000000000000000000
          000E150F076BB47B37FFDEC095FFFDF2DBFFFFFFF1FFFFFFF0FFFFFFF1FFFDF2
          DBFFDEC095FFB47B37FF150F076B0000000E000000000000000000000000150F
          076BB98442FFF8EAD1FFFFFEEBFFFFF9E2FFFFF8E1FFFFF7E1FFFFF7E0FFFFF9
          E2FFFFFEEBFFF8EAD1FFB98442FF150F076B00000000000000000000001EB47B
          37FFF8EAD2FFFFF9E5FFFFF3DAFFFFF4DBFFFFF7DFFFFCEFD4FFFFF5DCFFFFF3
          D9FFFFF3D9FFFFF9E5FFF8EAD2FFB47B37FF0000001E00000000463217A9DEC0
          98FFFFFBEAFFFDF2D7FF546FE8FF1237C6FFBA823DFFBA823DFFBA823DFFBA82
          3DFFCEA46FFFFDEFD3FFFFFBEAFFDEC098FF463217A900000000AC7637F9FEF2
          E1FFFEEFD4FFFCEECFFF1838C8FF7E91FEFF163BC9FFEFBE73FFF0BE73FFF3C7
          82FFBA823DFFFCEBCCFFFEEFD4FFFEF2E1FFAC7637F900000000B47B36FFFFFF
          FBFFFBE7C6FFFBE9C6FF1C3CCAFF4A62FBFF6175FCFF1838C9FFDFAC5FFFE0B8
          7CFFBA823DFFFCE9C9FFFBE7C6FFFFFFFBFFB47B36FF00000000B47B36FFFFFF
          FCFFFAE2BEFFFAE4BEFF1D41CDFF314BF0FF304AEEFF2A44EEFF1438C7FFDEBB
          8AFFBA823DFFFBEACBFFFAE2BFFFFFFFFCFFB47B36FF00000000B47B36FFFFFF
          FFFFF7DFB8FFF9E0B8FF1D41CDFF1B36E0FF7A8AEFFF1A3ECAFFC08733FFDEC2
          9AFFBA823DFFF9E1BDFFF8DFB8FFFFFFFFFFB47B36FF00000000AA7736F8FEF4
          E8FFFAE2BFFFF9DEB4FF1A3ACCFFA1A8F3FF193ACAFFDEC5A3FFDDC5A3FFDDC5
          A2FFBA823CFFF6DBB3FFFAE2BFFFFEF4E8FFAA7736F8000000003E2B1495DEC1
          9EFFFFF5E8FFF9DDB3FF4965E7FF1737C9FFBA823CFFBA823CFFBA823CFFBA82
          3CFFCC9D62FFF5D7ACFFFFF5E8FFDEC19EFF3E2B14950000000000000000B57C
          37FFF8ECE0FFFEEBD4FFF4D2A4FFF5D4A9FFF7D7ADFFF7D8AEFFF6D6ABFFF4D3
          A7FFF4D2A4FFFEEBD4FFF8ECE0FFB57C37FF0000000000000000000000000D09
          0446B98542FFF8ECE3FFFFF3E6FFF7D9B2FFF3CF9FFFF3CF9FFFF3CF9FFFF6D9
          B1FFFFF3E6FFF8ECE3FFB98542FF0D0904460000000000000000000000000000
          00000D090446B57C37FFDFC1A1FFFFF4F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFF4
          F0FFDFC1A1FFB57C37FF0D090446000000000000000000000000000000000000
          000000000000000000003E2B1495A97535F7B47B36FFB47B36FFB47B36FFA975
          35F73E2B14950000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000B0000000A0000000A0000000A0000000A0000000A0000000A0000000A0000
          00090000001D0000003300000033000000330000001E000000000000002F0D20
          2D5F0C1D295C0C1D295C0C1D295C0C1D295C0C1D295C0C1D2A5C0C1D295B0C1B
          2858005127A7008C4AFF008B4AFF008C4AFF005429AA0000002F3588C2F1368F
          CEFF368ECCFF368ECCFF368ECCFF368ECCFF368ECCFF368ECEFF3B8FD5FF178E
          84FF009954FF00BB85FF77E0C6FF00BB85FF009956FF11856CEE368FCEFF84DF
          FFFF76D8FFFF76D7FFFF76D7FFFF76D7FFFF76D7FFFF78D8FFFF7FDBFFFF0088
          38FF00C089FF00BC83FFFFFFFFFF00BC83FF00C18CFF008C47FF358ECDFF88D9
          FFFF68CBFCFF69CBFBFF69CBFBFF69CBFBFF69CBFBFF6BCCFDFF73D0FFFF0085
          37FF75E6CBFFFFFFFFFFFFFFFFFFFFFFFFFF77E7CEFF008B48FF348ECDFF8FD9
          FCFF5DC4F8FF5FC4F7FF60C4F7FF60C4F7FF60C4F7FF61C5F9FF69C8FFFF0085
          35FF00CB94FF00C98FFFFFFFFFFF00C98FFF00CD97FF008B45FF338ECDFF9ADB
          FCFF54BCF3FF57BDF3FF58BDF3FF58BDF3FF58BDF3FF59BDF4FF5EBFFCFF23A0
          8FFF00A059FF00D39AFF76EFD3FF00D39AFF00A15CFF1A8E89FF338ECDFFA5DD
          FBFF49B5F0FF4EB6F0FF4FB7F0FF4FB7F0FF4FB7F0FF4FB7F0FF51B7F4FF56B9
          FDFF1E9C8EFF008636FF008537FF008536FF46B195FF3D91DCFF328ECDFFB4E1
          FBFF3CACECFF40AEEDFF41AEECFF41AEECFF41AEECFF41AEECFF41AEEDFF43AE
          F0FF46AFF5FF48B1FAFF48B1FBFF44AFFAFFBAE4FFFF358FD1FF328ECDFFC4E6
          FBFF91CFF4FF93D0F4FF93D0F4FF92CEF2FF92CEF2FF91CEF2FF91CEF2FF92CE
          F2FF93CFF4FF95D0F6FF95D1F7FF92D0F6FFC5E7FCFF328ECEFF358FCDFF74D8
          FFFF55B0E3FF3E8DC4FF59B3E5FF72D5FFFF71D4FFFF6FD2FFFF6FD2FFFF71D4
          FFFF72D5FFFF59B3E5FF3E8DC4FF55B0E3FF74D8FFFF358FCDFF256189AA58B8
          EDFF69CDFDFF69CDFDFF52ABE0FF3D8CC3FF54AEE1FF68CCFDFF68CCFDFF54AE
          E1FF3D8CC3FF52ABE0FF69CDFDFF69CDFDFF58B8EDFF26628BAC000000003180
          B7E44FB2E8FF5DC4F8FF5DC4F9FF5EC6FAFF50ABE1FF3884BBFF3884BBFF50AB
          E1FF5EC6FAFF5DC4F9FF5DC4F8FF4FB2E8FF245E86A700000000000000000000
          00003280B7E34AADE6FF49A6DEFF3D8DC5FF47A5DEFF53BFF7FF53BFF7FF47A5
          DEFF3D8DC5FF49A6DEFF4AADE6FF255E87A70000000000000000000000000000
          0000000000003485BCE83992CFFF3992D0FF3992CFFF3991CFFF3991CFFF3992
          CFFF3992D0FF3992CFFF26628CAC000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000002000000070000000C0000001000000012000000110000
          000E000000080000000200000000000000000000000000000000000000000000
          000100000004000101120D2A1D79184E36C6216B4BFF216B4BFF216C4BFF1A53
          3AD20F2F21840001011500000005000000010000000000000000000000000000
          0005050F0A351C5B40DC24805CFF29AC7EFF2CC592FF2DC894FF2DC693FF2AAE
          80FF258560FF1A563DD405110C3D00000007000000010000000000000003040E
          0A31206548ED299D74FF2FC896FF2EC996FF56D4ACFF68DAB5FF3BCD9DFF30C9
          96FF32CA99FF2BA479FF227050F805110C3D00000005000000000000000A1A57
          3DD02EA57CFF33CA99FF2EC896FF4CD2A8FF20835CFF00673BFF45BE96FF31CB
          99FF31CB98FF34CC9CFF31AD83FF1B5C41D300010113000000020B23185E2E8A
          66FF3BCD9EFF30CA97FF4BD3A9FF349571FF87AF9DFFB1CFC1FF238A60FF45D3
          A8FF36CF9FFF33CD9BFF3ED0A3FF319470FF0F32237F00000007184D37B63DB3
          8CFF39CD9FFF4BD5A9FF43A382FF699782FFF8F1EEFFF9F3EEFF357F5DFF56C4
          A1FF43D5A8FF3ED3A4FF3CD1A4FF41BC95FF1B5C43CD0000000B1C6446DF4BCA
          A4FF44D2A8FF4FB392FF4E826AFFF0E9E6FFC0C3B5FFEFE3DDFFCEDDD4FF1B75
          4FFF60DCB8FF48D8ACFF47D6AAFF51D4ACFF247A58F80000000E217050F266D9
          B8FF46D3A8FF0B6741FFD2D2CBFF6A8F77FF116B43FF73967EFFF1E8E3FF72A2
          8BFF46A685FF5EDFBAFF4CD9AFFF6BE2C2FF278460FF020604191E684ADC78D9
          BEFF52DAB1FF3DBA92FF096941FF2F9C76FF57DEB8FF2D9973FF73967EFFF0EA
          E7FF4F886CFF5ABB9AFF5BDEB9FF7FE2C7FF27835FF80000000C19523BAB77C8
          B0FF62E0BCFF56DDB7FF59DFBAFF5CE1BDFF5EE2BEFF5FE4C1FF288C67FF698E
          76FFE6E1DCFF176B47FF5FD8B4FF83D5BDFF1E674CC60000000909201747439C
          7BFF95ECD6FF5ADFBAFF5EE2BDFF61E4BFFF64E6C1FF67E6C5FF67E8C7FF39A1
          7EFF1F6D4AFF288B64FF98EFD9FF4DAC8CFF1036286D00000004000000041C5F
          46B578C6ADFF9AEED9FF65E5C0FF64E7C3FF69E7C6FF6BE8C8FF6CE9C9FF6BEA
          C9FF5ED6B6FF97EDD7FF86D3BBFF237759D20102010C0000000100000001030A
          0718247B5BDA70C1A8FFB5F2E3FF98F0DAFF85EDD4FF75EBCEFF88EFD6FF9CF2
          DDFFBAF4E7FF78CDB3FF2A906DEA0615102E0000000200000000000000000000
          0001030A07171E694FB844AB87FF85D2BBFFA8E6D6FFC5F4EBFFABE9D8FF89D8
          C1FF4BB692FF237F60CB05130E27000000030000000000000000000000000000
          000000000001000000030A241B411B60489D258464CF2C9D77EE258867CF1F71
          56B00E3226560000000600000002000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000006A46
          2F8F85573BB5AF724DEEB97852FFB57650FFB37550FFB0734FFFAC714EFFA970
          4EFFA76E4DFFA66D4CFFA46D4CFE9A6748F17F543AC40000000000000000A66F
          49DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996547ED0000000000000000C080
          57FEFFFFFFFFAE662BFFAC632AFFAC632AFFFFFFFFFFB9DDBCFFB2DAB6FFAAD8
          AEFFA2D6A5FF9ED4A1FF97D39BFFFFFFFFFFA56E4DFE0000000000000000C385
          59FFFFFFFFFFAE662BFFCD9E73FFAC632AFFFFFFFFFF7F81D6FFDDF3E0FFDDF3
          E0FFDCF2DFFFDAF2DDFF94D298FFFFFFFFFFA7704EFF0000000000000000C485
          5AFFFFFFFFFFAE662BFFCD9F74FFAC632AFFFFFFFFFF552BFFFF9B8FF1FFDEF4
          E1FFDDF3E0FFDCF2DFFF99D39DFFFFFFFFFFAB714FFF0000000000000000C787
          59FFFFFFFFFFB36D32FFD0A47DFFB16B2DFFFFFFFFFF552BFFFF562BFFFF9B8F
          F1FFDEF4E1FFDDF3E0FF9ED4A1FFFFFFFFFFB17550FF0000000000000000C889
          5AFFFFFFFFFFB6753FFFD1A582FFB57237FFFFFFFFFF552BFFFF562BFFFF562B
          FFFF9A8FF0FFDDF3E0FFA2D6A7FFFFFFFFFFB57752FF0000000000000000CA8B
          5BFFFFFFFFFFBB7E53FFB97C4BFFB97B49FFFFFFFFFF552BFFFF552BFFFF8482
          DBFFAFD9B3FFACD8B0FFA7D7ABFFFFFFFFFFB87B53FF0000000000000000CA8C
          5CFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF562BFFFFAA95FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB7D54FF0000000000000000C88C
          5BFAFFFFFFFFEDC39AFFEDC39AFFEDC39AFFEDC39AFFA177CDFFEDC39AFFEDC3
          9AFFEDC39AFFEDC39AFFEDC39AFFFFFFFFFFBD8056FF0000000000000000C188
          58F0FFFFFFFFEDC39BFFF4DAC0FFF4DAC0FFF4DBC1FFF4DBC1FFF4DBC1FFF4DB
          C1FFF4DBC1FFF4DBC1FFEDC39AFFFFFFFFFFBF8257FE0000000000000000AE7C
          50D8FFFFFFFFEDC39BFFEDC39BFFEDC39BFFEDC39AFFEDC39AFFEDC39AFFEDC3
          9AFFEDC39AFFEDC39AFFEDC39AFFFFFFFFFFC0875DF800000000000000007D59
          399BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6A988FF00000000000000005B41
          2A7174523590A5754BCCCE925EFFCC915EFECD915EFFCC8F5EFFCD9160FFCD92
          62FFCB9060FFBE8458EFA1734FCBD8AD8AFFD7AB8AFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00010000000B08271977051D11770000000B0000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000604190F501D7951FB11643EFB03110A520000000700000000000000020000
          000A0000000F000000100000001000000010000000110000001100000015020B
          0739147048ED20B175FF18AA6DFF0F5233EC0108052D00000004000000094633
          2CC160453BFF644A41FFB87D4EFFB97A4AFFB47444FFC69777FFC4A891FF3986
          5FFF26B07BFF1EB97CFF1EB87BFF1AA26AFF0B442BD1000201160000000D6F53
          47FF947869FF6A4F46FFD8B07BFFD7AE77FFD7AB74FFE5CFB4FF659674FF4BB5
          91FF8FE5CCFF7FE1C3FF5CD4ABFF69D8B4FF40A581FF093420A50000000C7357
          4AFF987D6EFF70564BFFFFFFFFFFF6EFEAFFF6EFE9FFF6F2EFFF208760FF2086
          5DFF1F845DFF97EBD4FF77E1C3FF1A774FFF1A764EFF19754FFF0000000B785C
          4EFF9D8273FF765C50FFFFFFFFFFF7F0EBFFF7F0EBFFFAF6F4FFF6F2F0FFEFEB
          E9FF218B63FFA8F1DFFF8CEBD2FF1C7B55FF0000000F000000070000000A7C60
          50FFA28777FF7B6154FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFA
          FAFF229067FFC7F8EFFFC5F8EDFF1C8158FF0000000600000000000000097F63
          54FFA78E7DFF977A6AFF967969FF957967FF84695CFF705548FF775C51FFBAAD
          A7FF4D9B7BFF24946BFF23936AFF19694CBD0000000300000000000000088367
          57FFAB9382FF634A41FF614740FF5E463DFF5C443CFF5B433BFF594139FF9485
          7FFFAA9E9AFFBBACA8FFAFA29DFF0000000C000000000000000000000007866A
          59FFAF9788FF674E44FFF3EAE4FFE7D5C8FFE7D4C6FFE6D3C5FFE6D3C5FFE6D3
          C5FF594139FF795D54FF674C40FF00000009000000000000000000000006886D
          5CFFB39C8CFF6B5248FFF4ECE6FFE9D9CDFFE8D7CAFF4B3D3AFF50433EFFE6D3
          C5FF5D453CFF7B6056FF6B4F43FF000000080000000000000000000000058B70
          5EFFB7A091FF70564DFFF6EFEAFFECDDD3FFEADAD0FF473A36FF473A36FFE7D4
          C7FF604740FF7D6257FF6E5347FF000000070000000000000000000000048E72
          60FFBBA595FF755A50FFF7F1ECFFF6F0EBFFF5EEE9FFF5EDE7FFF4ECE6FFF4EB
          E4FF654B43FF7F6459FF72574AFF000000060000000000000000000000026A56
          49BF8F7361FF795E54FF765D52FF745A50FF72584EFF70564CFF6E544AFF6B52
          48FF6A5047FF795D4EFF574439C0000000040000000000000000000000010000
          0002000000030000000300000003000000040000000400000004000000040000
          0004000000040000000400000003000000010000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000033000000330000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000334C80A9FF4B80AAFF0000003300000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000334B7FA8FF21A0FAFF31B8FFFF4792C6FF00000000000000000000
          00000000000300000022000000330000003300000033000000330000001F0000
          00334380B0FF1E9FFAFF2FB3FFFFCAF6FFFF4393C9FF00000000000000000000
          00060606063D4E4D4DBA737270FF727170FF727170FF737270FF484746B08078
          74FF75A1C0FF27B3FFFFC7F5FFFF3F8EC4FF0000000000000000000000030F0E
          0E4B767574FFAEAFAFFFDFE2E5FFE5E9EDFFE5E9EDFFDFE2E5FFAEAEAFFF7774
          71FFB2A9A4FFECF9FCFF3A8FC7FF0000000000000000000000000706062D8482
          80FFE2E3E3FFFAE8D0FFFFCF88FFFFCE7CFFFFCC7CFFFFCF87FFFBE8CFFFDFDF
          DFFF7C7875FFA1968FFF00000000000000000000000000000000545251BABEBE
          BDFF000000FF47321AFFFFD285FF000000FF453F2BFFFFF4A3FF000000FF413F
          3EFFBABAB9FF4D4A48B0000000000000000000000000000000007C7B79FFF4F6
          F9FFFFCB84FF000000FFFFE4A3FFFFEFA1FF000000FFFFFFC7FF000000FFFDC8
          81FFF2F4F7FF7C7A78FF000000000000000000000000000000007D7B7AFFFEFF
          FFFFECB266FF000000FFFFEEBDFFFFF0AEFF534B34FF000000FF544A31FFE9B0
          64FFFDFFFFFF7C7B7AFF000000000000000000000000000000007F7D7CFFFFFF
          FFFFE3AB5FFF000000FFFFFFDAFFFFF8C4FF000000FFFFFEADFF000000FFDFA7
          5DFFFFFFFFFF7F7D7CFF0000000000000000000000000000000083807EFFFFFF
          FFFF000000FF000000FF000000FF4C463AFF000000FFFFE8A6FF41331CFF0000
          00FFFFFFFFFF83807EFF00000000000000000000000000000000595756AACBCA
          CAFFFFF3DCFF000000FFFFFFF1FFFFFFE8FFFFEDC9FFEDCB9AFFB98744FFF6E8
          D5FFC8C8C9FF595756AA000000000000000000000000000000000707070D8684
          83FFFFFFFFFF505152FF000000FFAE7D39FFA77736FFB28A52FFEDE1D2FFF6F8
          FAFF858381FF0707070D00000000000000000000000000000000000000001010
          101E94928FFFD4D4D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBCBCDFF8684
          82FF1010101E0000000000000000000000000000000000000000000000000000
          00000707070D5D5C59A98A8885FF898785FF888784FF888784FF5C5B59A90707
          070D000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000F0F
          0F108A8A8A8FF6F6F6FFF6F6F6FFF6F6F6FF8A8A8A8F0F0F0F100F0F0F108A8A
          8A8FF6F6F6FFF6F6F6FFF6F6F6FF8A8A8A8F0F0F0F1000000000000000009999
          999FC9C9C9FF4D4D4DFF424242FF4D4D4DFFC9C9C9FF8A8A8A8F9999999FC9C9
          C9FF4D4D4DFF424242FF4D4D4DFFC9C9C9FF9999999F000000000F0F0F10F6F6
          F6FF4D4D4DFFD0CFCFFFF1EFF0FFD0CFCFFF4D4D4DFFF6F6F6FFF6F6F6FF4D4D
          4DFFD0CFCFFFF1EFF0FFD0CFCFFF4D4D4DFFF6F6F6FF0F0F0F108A8A8A8FC9C9
          C9FF424242FFF1EFF0FFF1EFF0FFF1EFF0FF585858FF9C9C9CFFA7A7A7FF5858
          58FFF1EFF0FFF1EFF0FFF1EFF0FF424242FFBEBEBEFF8A8A8A8FF6F6F6FF5959
          59FF424242FFD0CFCFFFF1EFF0FFD0CFCFFF424242FF424242FF424242FF4242
          42FFD0CFCFFFF1EFF0FFD0CFCFFF424242FF595959FFF6F6F6FFF6F6F6FF4242
          42FF424242FF424242FF424242FF424242FF424242FF595959FF595959FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FFF6F6F6FFF6F6
          F6FF868686FF424242FF919191FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FF919191FF424242FF868686FFF6F6F6FFF6F6F6FF000000009999
          999FF6F6F6FF868686FF424242FFBEBEBEFFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFBEBEBEFF424242FF868686FFF6F6F6FF9999999F00000000000000000000
          00009999999FF6F6F6FF868686FF4D4D4DFFE0E0E0FFF6F6F6FFF6F6F6FFE0E0
          E0FF4D4D4DFF868686FFF6F6F6FF9999999F0000000000000000000000000000
          0000000000009999999FF6F6F6FF868686FF646464FFF6F6F6FFF6F6F6FF6464
          64FF868686FFF6F6F6FF9999999F000000000000000000000000000000000000
          000000000000000000009999999FF6F6F6FF868686FFF6F6F6FFF6F6F6FF8686
          86FFF6F6F6FF9999999F00000000000000000000000000000000000000000000
          00000000000000000000000000009999999FF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FF9999999F0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000009999999FF6F6F6FFF6F6F6FF9999
          999F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          20000000000000040000000000000000000000000000000000000F0F0F10B8B8
          B8BFF6F6F6FFF6F6F6FFB8B8B8BF3E3E3E403E3E3E403E3E3E403E3E3E403E3E
          3E403E3E3E403E3E3E403E3E3E403E3E3E403E3E3E403E3E3E40B8B8B8BF9C9C
          9CFF424242FF424242FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF4242
          42FF424242FF424242FFF6F6F6FF424242FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FFF6F6F6FF4242
          42FF424242FF424242FFF6F6F6FF424242FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FFF6F6F6FF4242
          42FFF6F6F6FFF6F6F6FFF6F6F6FF424242FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FFF6F6F6FF4242
          42FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF4242
          42FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF4242
          42FFF6F6F6FFF6F6F6FFF6F6F6FF424242FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FFF6F6F6FF4242
          42FF424242FF424242FFF6F6F6FF424242FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FFF6F6F6FF4242
          42FF424242FF424242FFF6F6F6FF424242FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FFB8B8B8BF9C9C
          9CFF424242FF424242FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF0F0F0F10F6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF00000000F6F6
          F6FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FF00000000F6F6
          F6FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FF00000000F6F6
          F6FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FF00000000F6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00004D4D4D50C8C8C8CFF6F6F6FFF6F6F6FFF6F6F6FFC8C8C8CF4D4D4D500000
          0000000000000000000000000000000000000000000000000000000000007B7B
          7B80E0E0E0FF7A7A7AFF424242FF424242FF424242FF7A7A7AFFE0E0E0FF7B7B
          7B800000000000000000000000000000000000000000000000004D4D4D50E0E0
          E0FF4D4D4DFF424242FF424242FF424242FF424242FF424242FF4D4D4DFFE0E0
          E0FF4D4D4D500000000000000000000000000000000000000000C8C8C8CF7A7A
          7AFF424242FF424242FF424242FF424242FF424242FF424242FF424242FF7A7A
          7AFFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF4242
          42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FFC9C9C9FF424242FF424242FF424242FF424242FFF6F6F6FFF6F6F6FF4242
          42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FFF5F4F5FFF1EFF0FFF1EFF0FFF1EFF0FF424242FFF6F6F6FFF6F6F6FF4242
          42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FFF5F4F5FFF1EFF0FFF1EFF0FFF1EFF0FF424242FFF6F6F6FFC8C8C8CF7A7A
          7AFF424242FF424242FF424242FF424242FF424242FF424242FF424242FF7A7A
          7AFFF3F2F3FFF1EFF0FFF1EFF0FFF1EFF0FF424242FFF6F6F6FF4D4D4D50E0E0
          E0FF4D4D4DFF424242FF424242FF424242FF424242FF424242FF4D4D4DFFDFDE
          DEFFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FF424242FFF6F6F6FF000000007B7B
          7B80E0E0E0FF7A7A7AFF424242FF424242FF424242FF7A7A7AFFDFDEDEFFF2F0
          F1FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FF424242FFF6F6F6FF000000000000
          0000F6F6F6FF919191FFF5F4F5FFF5F4F5FFF5F4F5FFF3F2F3FFF1EFF0FFF1EF
          F0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FF424242FFF6F6F6FF000000000000
          0000F6F6F6FF424242FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EF
          F0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FF424242FFF6F6F6FF000000000000
          0000F6F6F6FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FF000000000000
          0000F6F6F6FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FF000000000000
          0000F6F6F6FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FF000000000000
          0000F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000F6F6F6FFC8C8C8CF0F0F0F10000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000F6F6F6FFB3B3B3FFC8C8C8CF0F0F0F100000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000F6F6F6FF424242FFB3B3B3FFC8C8C8CF0F0F
          0F10000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000F6F6F6FF424242FF424242FFB3B3B3FFC8C8
          C8CF0F0F0F10000000000000000000000000000000000000000000000000F6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF424242FF424242FF424242FFB3B3
          B3FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF00000000F6F6
          F6FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FF00000000F6F6
          F6FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FF00000000F6F6
          F6FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FF00000000F6F6
          F6FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FF00000000F6F6
          F6FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FF00000000F6F6
          F6FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FF00000000F6F6
          F6FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FF00000000F6F6
          F6FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FF00000000F6F6
          F6FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FF00000000F6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FF0000000000000000000000000000000000000000000000000000
          0000F6F6F6FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FFF6F6F6FF0000000000000000000000000000000000000000000000000000
          0000F6F6F6FF424242FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FF0000000000000000000000000000000000000000000000000000
          0000F6F6F6FF424242FFF6F6F6FF0000000000000000B3B3B3FF424242FF4242
          42FF646464FFF6F6F6FF00000000000000000000000000000000000000000000
          0000F6F6F6FF424242FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFD4D4D4FF4242
          42FF424242FF646464FFF6F6F6FF000000000000000000000000000000000000
          0000F6F6F6FF424242FFF6F6F6FFF6F6F6FF424242FF424242FF424242FF4242
          42FF424242FF424242FF646464FFF6F6F6FF0000000000000000000000000000
          0000F6F6F6FF424242FFF6F6F6FFF6F6F6FF424242FF424242FF424242FF4242
          42FF424242FF424242FF646464FFF6F6F6FF0000000000000000000000000000
          0000F6F6F6FF424242FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFD4D4D4FF4242
          42FF424242FF646464FFF6F6F6FF000000000000000000000000000000000000
          0000F6F6F6FF424242FFF6F6F6FF0000000000000000B3B3B3FF424242FF4242
          42FF646464FFF6F6F6FF00000000000000000000000000000000000000000000
          0000F6F6F6FF424242FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FF0000000000000000000000000000000000000000000000000000
          0000F6F6F6FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FFF6F6F6FF0000000000000000000000000000000000000000000000000000
          0000F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000F6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FF000000000000000000000000000000000000
          000000000000F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF4242
          42FF424242FF424242FFF6F6F6FF00000000000000000000000065656569F6F6
          F6FF92929297F6F6F6FF424242FF424242FF424242FFF6F6F6FFF6F6F6FF4242
          42FFF6F6F6FFF6F6F6FFF6F6F6FF000000000000000065656569F6F6F6FF6A6A
          6AFFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF424242FFF6F6F6FFF6F6F6FF4242
          42FFF6F6F6FF0000000000000000F6F6F6FFF6F6F6FFF6F6F6FF7F7F7FFF4242
          42FF424242FFF6F6F6FF00000000F6F6F6FF424242FFF6F6F6FFF6F6F6FF4242
          42FFF6F6F6FF0000000000000000F6F6F6FF424242FF424242FF424242FF4242
          42FF424242FFF6F6F6FF00000000F6F6F6FF424242FFF6F6F6FFF6F6F6FF4242
          42FFF6F6F6FF00000000D4D4D4DCF6F6F6FF424242FFF6F6F6FFF2F2F2FFB9B9
          B9FFF6F6F6FF0000000000000000F6F6F6FF424242FFF6F6F6FFF6F6F6FF4242
          42FFF6F6F6FFD3D3D3DC949494FFC4C4C4FF424242FFEBEBEBFF848484FF4242
          42FF686868FFF6F6F6FF00000000F6F6F6FF424242FFF6F6F6FFF6F6F6FF4242
          42FFF6F6F6FF8B8B8BFF424242FF484848FF424242FF424242FF424242FF4242
          42FF424242FFB9B9B9FFF6F6F6FFF6F6F6FF424242FFF6F6F6FFF6F6F6FF4242
          42FFF6F6F6FF8B8B8BFF424242FF424242FF4C4C4CFFCFCFCFFFF6F6F6FFDDDD
          DDFFB2B2B2FFF6F6F6FF00000000F6F6F6FF424242FFF6F6F6FFF6F6F6FF4242
          42FFF6F6F6FFDBDBDBE48B8B8BFF424242FF424242FF9C9C9CFFF6F6F6FFF6F6
          F6FFF6F6F6FF0000000000000000F6F6F6FF424242FFF6F6F6FFF6F6F6FF4242
          42FFF6F6F6FFF6F6F6FFF6F6F6FF8B8B8BFF969696FFF6F6F6FF000000000000
          000000000000F6F6F6FFF6F6F6FFF6F6F6FF424242FFF6F6F6FFF6F6F6FF4242
          42FF424242FF424242FFF6F6F6FFF6F6F6FFF6F6F6FF00000000000000000000
          000000000000F6F6F6FF424242FF424242FF424242FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FF000000000000000000000000000000000000
          000000000000F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000F6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF0000000000000000F6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF4242
          42FF424242FF424242FF424242FF424242FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FF424242FF424242FF424242FF424242FF424242FFF6F6F6FFF6F6F6FF4242
          42FFF1EFF0FFF1EFF0FFF1EFF0FF424242FFF6F6F6FF868686FF4D4D4DFFD4D4
          D4FF424242FFF1EFF0FFF1EFF0FFF1EFF0FF424242FFF6F6F6FFF6F6F6FF4242
          42FFF1EFF0FFF1EFF0FFF1EFF0FF424242FF424242FF424242FF424242FF5959
          59FF424242FFF1EFF0FFF1EFF0FFF1EFF0FF424242FFF6F6F6FFF6F6F6FF4242
          42FFF1EFF0FFF1EFF0FFF1EFF0FF424242FFF6F6F6FF868686FF4D4D4DFFD4D4
          D4FF424242FFF1EFF0FFF1EFF0FFF1EFF0FF424242FFF6F6F6FFF6F6F6FF4242
          42FF424242FF424242FF424242FF424242FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FF424242FF424242FF424242FF424242FF424242FFF6F6F6FFF6F6F6FFF6F6
          F6FFD4D4D4FF595959FFD4D4D4FFF6F6F6FFF6F6F6FF0000000000000000F6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF00000000F6F6
          F6FF4D4D4DFF424242FF4D4D4DFFF6F6F6FF0000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000F6F6
          F6FF868686FF424242FF868686FFF6F6F6FF0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000F6F6F6FFF6F6
          F6FFF6F6F6FF424242FFF6F6F6FFF6F6F6FFF6F6F6FF00000000000000000000
          0000000000000000000000000000000000000000000000000000F6F6F6FF4242
          42FF424242FF424242FF424242FF424242FFF6F6F6FF00000000000000000000
          0000000000000000000000000000000000000000000000000000F6F6F6FF4242
          42FFF1EFF0FFF1EFF0FFF1EFF0FF424242FFF6F6F6FF00000000000000000000
          0000000000000000000000000000000000000000000000000000F6F6F6FF4242
          42FFF1EFF0FFF1EFF0FFF1EFF0FF424242FFF6F6F6FF00000000000000000000
          0000000000000000000000000000000000000000000000000000F6F6F6FF4242
          42FFF1EFF0FFF1EFF0FFF1EFF0FF424242FFF6F6F6FF00000000000000000000
          0000000000000000000000000000000000000000000000000000F6F6F6FF4242
          42FF424242FF424242FF424242FF424242FFF6F6F6FF00000000000000000000
          0000000000000000000000000000000000000000000000000000F6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF00000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000F6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FF00000000000000000000000000000000F6F6F6FF4242
          42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FFF6F6F6FFF6F6F6FFF6F6F6FF0000000000000000F6F6F6FF4242
          42FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EF
          F0FF424242FFF6F6F6FF424242FFF6F6F6FF0000000000000000F6F6F6FF4242
          42FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FF929192FFE8E6E7FFF1EFF0FFCCCB
          CBFF424242FFF6F6F6FF424242FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF4242
          42FFC2C1C1FFF1EFF0FFF1EFF0FFA09F9FFF434343FF484848FFA2A1A1FF4343
          43FF424242FFF6F6F6FF424242FFF6F6F6FF424242FFF6F6F6FFF6F6F6FF4242
          42FF454545FFD1D0D0FFC8C7C7FF555455FFEAE8E9FFC9C8C9FF737373FFDEDC
          DDFF424242FFF6F6F6FF424242FFF6F6F6FF424242FFF6F6F6FFF6F6F6FF4242
          42FFC7C6C6FF454545FF474747FFE1E0E0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EF
          F0FF424242FFF6F6F6FF424242FFF6F6F6FF424242FFF6F6F6FFF6F6F6FF4242
          42FFF1EFF0FFBBBABBFFC6C5C5FFF1EFF0FF4D4D4DFF424242FFF1EFF0FFF1EF
          F0FF424242FFF6F6F6FF424242FFF6F6F6FF424242FFF6F6F6FFF6F6F6FF4242
          42FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FF575757FF4D4D4DFFF1EFF0FFF1EF
          F0FF424242FFF6F6F6FF424242FFF6F6F6FF424242FFF6F6F6FFF6F6F6FF4242
          42FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EF
          F0FF424242FFF6F6F6FF424242FFF6F6F6FF424242FFF6F6F6FFF6F6F6FF4242
          42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FFF6F6F6FF424242FFF6F6F6FF424242FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FF424242FFF6F6F6FF424242FFF6F6F6FF000000000000
          0000F6F6F6FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FFF6F6F6FF424242FFF6F6F6FF000000000000
          0000F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF424242FFF6F6F6FF000000000000
          00000000000000000000F6F6F6FF424242FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FF000000000000
          00000000000000000000F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00002E2E2E30E7E7E7EFF6F6F6FFE7E7E7EF2E2E2E3000000000000000000000
          0000000000000000000000000000000000000000000000000000000000002E2E
          2E30E7E7E7EFEAC16DFFE2A11BFFEAC16DFFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FF00000000000000000000000000000000000000002E2E2E30E7E7
          E7EFEAC16DFFE2A11BFFFFFFFFFFE2A11BFFEAC16DFFD4D4D4FF4D4D4DFF4242
          42FFF6F6F6FF0000000000000000000000000000000000000000E7E7E7EFEAC1
          6DFFE2A11BFFE2A11BFFE2A11BFFE2A11BFFE2A11BFFEAC16DFFD4D4D4FF4242
          42FFF6F6F6FF0000000000000000000000000000000000000000F6F6F6FFE2A1
          1BFFE2A11BFFE2A11BFFFFFFFFFFE2A11BFFE2A11BFFE2A11BFFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF0000000000000000E7E7E7EFEAC1
          6DFFE2A11BFFE2A11BFFFFFFFFFFE2A11BFFE2A11BFFEAC16DFFD4D4D4FF4242
          42FF424242FF424242FF424242FFF6F6F6FF00000000000000002E2E2E30E7E7
          E7EFEAC16DFFE2A11BFFFFFFFFFFE2A11BFFEAC16DFFD4D4D4FF4D4D4DFF4242
          42FF424242FF424242FF424242FFF6F6F6FF0000000000000000000000002E2E
          2E30E7E7E7EFEAC16DFFE2A11BFFEAC16DFFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF0000000000000000000000000000
          00002E2E2E30E7E7E7EFF6F6F6FFD4D4D4FF4D4D4DFF424242FF424242FF4242
          42FF424242FFF6F6F6FF00000000000000000000000000000000000000000000
          00000000000000000000F6F6F6FF424242FF424242FF424242FF424242FF4242
          42FF424242FFF6F6F6FF00000000000000000000000000000000000000000000
          00000000000000000000F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF000000000000
          00000000000000000000F6F6F6FF424242FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FF000000000000
          00000000000000000000F6F6F6FF424242FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FF000000000000
          00000000000000000000F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000F6F6F6FFF6F6
          F6FFF6F6F6FF4D4D4D5000000000000000005D5D5D60F6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF00000000D7D7D7DF4242
          42FF868686FFA9A9A9AF0000000000000000B8B8B8BF7A7A7AFF7A7A7AFFB3B3
          B3FF424242FF424242FF7A7A7AFF424242FFF6F6F6FF000000007B7B7B80A7A7
          A7FF4D4D4DFFF6F6F6FF7B7B7B807B7B7B80EBEBEBFF424242FFB3B3B3FF4242
          42FF9C9C9CFFF6F6F6FF868686FF424242FFF6F6F6FF000000001F1F1F20EBEB
          EBFF424242FF868686FF9C9C9CFF9C9C9CFF7A7A7AFF4D4D4DFFF6F6F6FF7A7A
          7AFF7A7A7AFFD4D4D4FFE0E0E0FF424242FFF6F6F6FF0000000000000000B8B8
          B8BF868686FF424242FF424242FF424242FF4D4D4DFF868686FFD7D7D7DFD4D4
          D4FF7A7A7AFF4D4D4DFF424242FF424242FFF6F6F6FF00000000000000005D5D
          5D60BEBEBEFF424242FFEBEBEBFFD4D4D4FF424242FFD4D4D4FF8A8A8A8FEBEB
          EBFFEBEBEBFFF6F6F6FFD4D4D4FF424242FFF6F6F6FF00000000000000000000
          0000E7E7E7EF595959FFB3B3B3FF919191FF646464FFD7D7D7DF3E3E3E40C9C9
          C9FF4D4D4DFF6F6F6FFF595959FF646464FFD7D7D7DF00000000000000000000
          00009999999F919191FF646464FF595959FFA7A7A7FF7B7B7B801F1F1F20D7D7
          D7DFD4D4D4FF9C9C9CFFB3B3B3FFEBEBEBFF4D4D4D5000000000000000000000
          00002E2E2E30E0E0E0FF424242FF424242FFEBEBEBFF1F1F1F20000000000000
          00003E3E3E407B7B7B806C6C6C701F1F1F200000000000000000000000000000
          000000000000D7D7D7DF868686FF9C9C9CFFB8B8B8BF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000005D5D5D60B8B8B8BFB8B8B8BF4D4D4D5000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000407
          192014288BAF1B37BDEF1B37BDEF14288BAF050B26300000000000000000905B
          2DDF6741209F150D072000000000000000000000000000000000050B26301B37
          BDEF0F1E658004071920040719201934B1DF1B37BDEF050B2630000000003E27
          1460A56834FFA56834FF6741209F150D0720000000000000000014288BAF0F1E
          6580000000000000000012257E9F1D3BCAFF1934B1DF162C97BF000000000000
          00009B6131EFA56834FFA56834FF000000001F140A30000000001D3BCAFF0204
          0D100000000012257E9F1D3BCAFF12257E9F02040D101D3BCAFF000000000000
          000053341A80A56834FF00000000A56834FF9B6131EF000000001D3BCAFF0204
          0D1012257E9F1D3BCAFF12257E9F00000000000000001D3BCAFF000000000000
          00000A07031000000000A56834FFA56834FFA56834FF0A070310162C97BF1830
          A4CF1D3BCAFF12257E9F00000000000000000D1A59701830A4CF000000000000
          0000000000001F140A309B6131EFA56834FFA56834FF53341A80070F33401D3B
          CAFF1830A4CF00000000000000000B164C601B37BDEF070F3340000000000000
          000000000000000000001F140A309B6131EFA56834FF9B6131EF1F140A30070F
          33401934B1DF1D3BCAFF1D3BCAFF1934B1DF09133F5000000000000000000000
          00000000000000000000000000001F140A309B6131EFA56834FFA56834FF5334
          1A800A0703100000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000001F140A309B6131EFA56834FFA568
          34FFA56834FF9B6131EF1F140A30000000000000000000000000000000000000
          000000000000000000000000000000000000000000001F140A309B6131EFA568
          34FFA56834FFA56834FF9B6131EF000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000001F140A309B61
          31EFA56834FFA56834FF000000009B6131EF1F140A3000000000000000000000
          0000000000000000000000000000000000000000000000000000000000001F14
          0A309B6131EF00000000A56834FFA56834FF9B6131EF150D0720000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000009B6131EFA56834FFA56834FF86542ACF0A070310000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000001F140A309B6131EF86542ACF0A07031000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000150D07200A0703100000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000000000000040000000F000000110000000B000000040000
          0001000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000E431B10FF31130BE1190A0598030407420000
          000C000000020000000000000000000000000000000000000000000000000000
          000000000000000000000000000D673C29DCB8C7D2FF7789A3FF224084FF040F
          34960000000F0000000200000000000000000000000000000000000000000000
          000000000000000000000000000841261A91869AB3FFC7E3F6FF1B65B9FF286B
          ABFF041237950000000E00000002000000000000000000000000000000000000
          00000000000000000000000000031013163E458BC6FFDDFEFDFF4DB4E6FF1B67
          BAFF2E73B1FF051439940000000D000000020000000000000000000000000000
          0000000000000000000000000001000000081B44628D439FD5FFDDFEFDFF55C0
          ECFF1D6ABCFF337BB6FF06163B920000000C0000000200000000000000080000
          000C0000000D0000000D0000000D0000000E000000161B44629248A5D8FFDDFE
          FDFF5DCBF2FF206EBFFF3883BCFF07193E910000000A00000002735146BFA070
          61FF9F6F61FF9F6F60FF9E6F60FFA07161FFB89489FFC8B0A9FF7A98B2FF4BAB
          DAFFDDFEFDFF64D5F7FF2474C1FF3C8BC1FF071B418E00000006A47667FFF9F6
          F4FFF6F5F3FFF7F5F4FFF4F3F1FFF7F5F4FFF1F0EEFFF2F1EFFFF3F2F1FF8CB4
          D1FF4EAFDDFFDDFEFDFF6BDEFBFF287AC5FF15438DFF00000008A87C6DFFF5F3
          F2FF643C2CFFE5E4E3FF633B2BFFEBEAE9FF643C2CFF643E2DFFD7CFCBFFF6F5
          F4FF92B9D5FF51B2DFFFDDFEFDFF4CA7D7FF0F2B4F8800000004AD8274FFF4F3
          F2FF68402FFF673F2FFF673F2FFFE9E8E6FF663E2EFFDEDCDBFF68402FFFF7F5
          F4FFF6F3EFFF93BBD8FF327FBFFF163A5A8B0000000500000001B1887AFFF6F5
          F4FF6E4433FFE9E7E6FF6D4432FFECEBEAFF6C4331FF6C4231FFB3A19AFFF6F5
          F3FFF9F4EFFFF9F6F3FFD2BBB4FF0000000E0000000100000000B78F80FFF8F7
          F6FF724836FFCFC4BFFF714836FFF1EFEEFF714635FFE8E6E5FF704635FFF7F6
          F5FFF8F1ECFFF8F1ECFFAF8576FF0000000A0000000000000000BB9587FFFBFA
          F9FFD8CDC8FF764A3BFFD7CBC6FFF7F6F5FF754B39FF754B39FFD6CAC5FFFBFA
          F9FFF8F2EEFFF8F2EDFFB38B7CFF000000090000000000000000C09C8DFFFDFB
          F9FFFDFDFCFFFBFBFAFFFDFDFCFFFDFDFCFFFAFAF9FFFAFAF9FFFCFBFBFFFDFA
          F8FFFBF9F7FFFBF9F7FFB89282FF00000008000000000000000091786DC1C4A1
          92FFC3A091FFC3A091FFC29F90FFC19D8FFFC09D8EFFC09C8DFFBF9B8CFFBF9A
          8BFFBE9A8BFFBD998AFF8C7064C2000000050000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00009999999FF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF9999
          999F0000000000000000F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF000000000000
          0000000000009999999FF6F6F6FF868686FF424242FF424242FF868686FFF6F6
          F6FF9999999F00000000F6F6F6FF424242FF424242FFF6F6F6FF000000000000
          000000000000000000009999999FF6F6F6FF868686FF424242FF424242FF8686
          86FFF6F6F6FF9999999FF6F6F6FF424242FF424242FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF919191FF424242FF4242
          42FF868686FFF6F6F6FFF6F6F6FF424242FF424242FFF6F6F6FFF6F6F6FF4242
          42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FF868686FFF6F6F6FF424242FF424242FFF6F6F6FFF6F6F6FF4242
          42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FF868686FFF6F6F6FF424242FF424242FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF868686FF424242FF4242
          42FF868686FFF6F6F6FFF6F6F6FF424242FF424242FFF6F6F6FF000000000000
          000000000000000000009999999FF6F6F6FF868686FF424242FF424242FF8686
          86FFF6F6F6FF9999999FF6F6F6FF424242FF424242FFF6F6F6FF000000000000
          0000000000009999999FF6F6F6FF868686FF424242FF424242FF868686FFF6F6
          F6FF9999999F00000000F6F6F6FF424242FF424242FFF6F6F6FF000000000000
          00009999999FF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF9999
          999F0000000000000000F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000F6F6F6FF424242FF424242FF424242FF424242FFF6F6F6FF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000F6F6F6FF424242FF424242FF424242FF424242FFF6F6F6FF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000F6F6F6FF424242FF424242FF424242FF424242FFF6F6F6FF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF00000000000000000000
          0000F6F6F6FF424242FF424242FF424242FF424242FFF6F6F6FFF6F6F6FF0000
          0000424242FFF6F6F6FFF6F6F6FF00000000F6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF0000
          0000F6F6F6FF9C5300FFE0CDB9FFF6F6F6FFF6F6F6FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FF424242FF4242
          42FF424242FF424242FF9C5300FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF424242FF9C53
          00FF9C5300FF9C5300FF9C5300FF9C5300FFF6F6F6FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FF424242FF9C5300FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF0000
          0000424242FF9C5300FFF6F6F6FFF6F6F6FFF6F6F6FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FF00000000F6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FF00000000000000000000000000000000000000000000
          000000000000F6F6F6FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FFF6F6F6FF00000000000000000000000000000000000000000000
          000000000000F6F6F6FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FFF6F6F6FF00000000000000000000000000000000000000000000
          000000000000F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FF00000000000000000000000000000000000000000000
          0000000000000000000000000000F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF000000000000
          0000000000000000000000000000F6F6F6FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FF000000000000
          0000000000000000000000000000F6F6F6FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FF000000000000
          0000000000000000000000000000F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF9999999FF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF00000000000000008A8A
          8A8FF6F6F6FFBE905CFF9C5300FFBE905CFFF6F6F6FF868686FF424242FF4242
          42FF424242FF424242FF424242FF424242FFF6F6F6FF00000000F6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFBE905CFF9C5300FFBE905CFFF6F6F6FF868686FF4242
          42FF424242FF424242FF424242FF424242FFF6F6F6FF00000000F6F6F6FF9C53
          00FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FFBE905CFFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF00000000F6F6F6FF9C53
          00FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FFBE905CFFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFBE905CFF9C5300FFBE905CFFF6F6F6FF868686FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FF000000009999
          999FF6F6F6FFBE905CFF9C5300FFBE905CFFF6F6F6FF868686FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FF9999999FF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000F6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FF0000000000000000000000000000000000000000F6F6F6FF4242
          42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FFF6F6F6FF0000000000000000000000000000000000000000F6F6F6FF4242
          42FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FF4242
          42FFF6F6F6FF0000000000000000000000000000000000000000F6F6F6FF4242
          42FFF1EFF0FFF1EFF0FFF1EFF0FF424242FFF1EFF0FFF1EFF0FFF1EFF0FF4242
          42FFF6F6F6FF0000000000000000000000000000000000000000F6F6F6FF4242
          42FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FF4242
          42FFF6F6F6FF0000000000000000000000000000000000000000F6F6F6FF4242
          42FFF1EFF0FFF1EFF0FFF1EFF0FF424242FFF1EFF0FFF1EFF0FFF1EFF0FF4242
          42FFF6F6F6FF0000000000000000000000000000000000000000F6F6F6FF4242
          42FFF1EFF0FFF1EFF0FFF1EFF0FF424242FFF1EFF0FFF1EFF0FFF1EFF0FF4242
          42FFF6F6F6FF0000000000000000000000000000000000000000F6F6F6FF4242
          42FFF1EFF0FFF1EFF0FFF1EFF0FF424242FFF1EFF0FFF1EFF0FFF1EFF0FF4242
          42FFF6F6F6FF0000000000000000000000000000000000000000F6F6F6FF4242
          42FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FF4242
          42FFF6F6F6FF0000000000000000000000000000000000000000F6F6F6FF4242
          42FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FFF6F6F6FF0000000000000000000000000000000000000000F6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000330000003300000022000000000000000000000000000000300000
          003300000033000000330000002B000000000000000000000026000000330000
          003300893CFF00C682FF005C30BD0000002100000000000000003C7DC3F24897
          D8FF4A9CDAFF4897D8FF3770AFDD000000000000001F3966ADCD549DEBFF589B
          F1FF00873DFF00E4A4FF00BE80FF005A2FB900000021000000003E82CDFF7CF6
          FFFF79F1FFFF7CF5FFFF3E80CEFF00000033005623B100893CFF00873AFF0087
          3CFF00833EFF00D9A1FF00D8A0FF00BC80FF005A2FB9000000223D81CCFF83F2
          FFFF55DAFFFF6BE5FFFF4F98DAFF579EE8FF008637FF40E8BEFF00D79EFF00D7
          9FFF00D59EFF00D09CFF00D09CFF00D39FFF00B981FF005D32BD3D82CDFF8DF6
          FFFF76E6FFFF58D9FFFF7CE9FFFF84EFFFFF008133FF6DE7CDFF00C899FF00C8
          99FF00C899FF00C797FF00C898FF00CA9AFF63E6CDFF008A47FF3A7BBEEA4C96
          D8FF5EADE2FF93EEFFFF46D0FFFF4FD5FFFF00812FFF96EDDDFF4DE8D2FF50E7
          D2FF4DE6D1FF93E8D7FF00C397FF60E0C6FF00B37FFF005E30AC000000000000
          0000519BDAFF9EEFFFFF3FCBFFFF47CFFFFF119F82FF00812FFF008131FF0081
          34FF008036FF81E4D5FF58DAC2FF00AE78FF005826A600000000000000270000
          0033529BDAFFA7F0FFFF36C6FFFF3EC9FFFF42CBFFFF43CDFFFF41CDFFFF6FDD
          FFFF008335FF77E3D2FF00AB75FF148875FF0F1B2C32000000002F669ECE4F96
          D8FF68ADE2FFB0EFFFFF2DC0FFFF35C2FFFF36C3FFFF35C3FFFF2FC1FFFFBAF4
          FFFF00852EFF00AB74FF138972FF3C72B8D600000000000000003A83CDFFB6F6
          FFFFB1EEFFFF50CBFFFF20BAFFFF27BCFFFF27BCFFFF24BBFFFF1DBAFFFFBBF3
          FFFF3E80D4FF00000000000000000000000000000000000000003A83CDFFBFF6
          FFFFB9F0FFFFBCF0FFFFC1F1FFFF56CBFFFF56CBFFFFC2F1FFFFC0F2FFFFC2F6
          FFFF3B82CEFF00000000000000000000000000000000000000002A5C8FB05297
          D8FF589BDAFF589BDAFF5698D8FFB3E3FCFFBCE9FFFF5698D8FF5A9CDAFF5498
          D8FF2A5C8FB00000000000000000000000000000000000000000000000000000
          000000000000000000001F4B77AA90C6EFFFAFDDFAFF2B69A8DB000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000013882CDFFDAF8FFFFDAF8FFFF3882CDFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000001020203387DC1EE5698D8FF5698D8FF397DC0ED000101010000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000002000000080000000C0000000D0000000D00000008000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000007674337BF8E5E4DFF8E5D4CFF8E5C4BFF644036BF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000009A67667FFE5D6CDFFE5D5CCFFE4D5CBFFA47463FF000000000000
          00000000000000000000000000000000000000000000000000004E362CFF4E35
          2CFF4C332BFFAB7C6CFFF3EBE7FFF3EBE6FFF3EBE6FFA87A69FF000000000000
          000000000000000000000000000000000000000000000000000050372EFF0000
          000000000004825F54C1AF8171FFAD8070FFAD806EFF7F5E51C2000000000000
          000000000000000000000000000000000000000000000000000052382FFF0000
          0000000000030000000B0000001100000013000000130000000C000000000000
          0000000000000000000000000000000000000000000000000000543A31FF0000
          00000000000779584CBFA67C6BFFA67B6AFFA67A69FF76574BBF000000000000
          0000000000000000000000000000000000000000000000000000563B32FF0000
          000000000009BB9486FFE5D6CDFFE5D5CCFFE4D5CBFFBA9283FF000000000000
          0000000000000000000000000000000000000000000000000000583D34FF573D
          33FF543B31FFBF998BFFF3EBE7FFF3EBE6FFF3EBE6FFBD9788FF000000000000
          00000000000000000000000000000000000000000000000000005A3F35FF0000
          00000000000490756AC1C29D8FFFC19C8EFFC19C8DFF8E7367C2000000000000
          00000000000000000000000000000000000000000000000000005B4037FF0000
          0000000000010000000300000005000000060000000600000004000000000000
          000000000000000000000000000000000002000000080000000C593F35FF0000
          000D000000080000000200000000000000000000000000000000000000000000
          00003B2822C200000000000000000000000779584CBFA67C6BFFA67B6AFFA67A
          69FF76574BBF0000000800000000000000000000000000000000000000003E2B
          24C251372FFF3D2923C20000000000000009BB9486FFE5D6CDFFE5D5CCFFE4D5
          CBFFBA9283FF0000000A00000000000000000000000000000000412D26C2553B
          31FF533A31FF523930FF3E2B25C200000008BF998BFFF3EBE7FFF3EBE6FFF3EB
          E6FFBD9788FF0000000900000000000000000000000000000000000000000000
          00000000000000000000000000000000000490756AC1C29D8FFFC19C8EFFC19C
          8DFF8E7367C20000000500000000000000000000000000000000}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D224C
          617965725F312220786D6C6E733D22687474703A2F2F7777772E77332E6F7267
          2F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F77
          77772E77332E6F72672F313939392F786C696E6B2220783D223070782220793D
          22307078222076696577426F783D2230203020333220333222207374796C653D
          22656E61626C652D6261636B67726F756E643A6E657720302030203332203332
          3B2220786D6C3A73706163653D227072657365727665223E262331333B262331
          303B3C7374796C6520747970653D22746578742F6373732220786D6C3A737061
          63653D227072657365727665223E2E426C75657B66696C6C3A23313137374437
          3B7D262331333B262331303B2623393B2E59656C6C6F777B66696C6C3A234646
          423131353B7D262331333B262331303B2623393B2E426C61636B7B66696C6C3A
          233732373237323B7D262331333B262331303B2623393B2E477265656E7B6669
          6C6C3A233033394332333B7D262331333B262331303B2623393B2E5265647B66
          696C6C3A234431314331433B7D262331333B262331303B2623393B2E7374307B
          6F7061636974793A302E37353B7D262331333B262331303B2623393B2E737431
          7B6F7061636974793A302E353B7D3C2F7374796C653E0D0A3C672069643D2246
          6F6C6465724F70656E223E0D0A09093C6720636C6173733D22737430223E0D0A
          0909093C7061746820636C6173733D2259656C6C6F772220643D224D322E322C
          32352E326C352E352D313063302E332D302E372C312D312E322C312E382D312E
          32483234762D3363302D302E362D302E342D312D312D31483132563763302D30
          2E362D302E342D312D312D31483343322E342C362C322C362E352C322C377631
          3820202623393B2623393B2623393B63302C302E322C302C302E332C302E312C
          302E3443322E312C32352E342C322E322C32352E332C322E322C32352E327A22
          2F3E0D0A09093C2F673E0D0A09093C7061746820636C6173733D2259656C6C6F
          772220643D224D32392E332C313648392E364C342C32366831392E3863302E35
          2C302C312E312D302E322C312E332D302E366C342E392D382E394333302E312C
          31362E322C32392E382C31362C32392E332C31367A222F3E0D0A093C2F673E0D
          0A3C2F7376673E0D0A}
        FileName = 'SVG Images\Icon Builder\Actions_FolderOpen.svg'
        Keywords = 'Icon Builder;Actions;FolderOpen'
      end>
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
    Images = SmallImages
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
  object dxBarManager1: TdxBarManager
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
    ImageOptions.Images = SmallImages
    ImageOptions.LargeImages = ImagesLarge
    ImageOptions.MakeDisabledImagesFaded = True
    ImageOptions.StretchGlyphs = False
    ImageOptions.UseLargeImagesForLargeIcons = True
    LookAndFeel.SkinName = 'VisualStudio2013Blue'
    MenusShowRecentItemsFirst = False
    NotDocking = [dsNone]
    PopupMenuLinks = <>
    ShowShortCutInHint = True
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
      DockedLeft = 311
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
      DockedLeft = 400
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
    object MenuItemFileExit: TdxBarButton
      Action = ActionExit
      Category = 1
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
  object ImageListMessage: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 26739132
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000002A000000330000
          002A000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000002D795632DDA77644FF7956
          32DD0000002D0000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000002D865F36E9C5A37DFFFBF4E7FFC5A3
          7DFF865F36E90000002D00000000000000000000000000000000000000000000
          000000000000000000000000002D855F36E8C4A47EFFF6EDDFFFC19E78FFF6ED
          DFFFC4A47EFF855F36E80000002D000000000000000000000000000000000000
          0000000000000000002D855F36E8C5A581FFF8F1E6FFB4895CFFA3713DFFB489
          5CFFF8F1E6FFC5A581FF855F36E80000002D0000000000000000000000000000
          00000000002D855F36E8C7A684FFFAF4EAFFB3895BFFA26F3BFFA3703CFFA26F
          3BFFB3895BFFFAF4EAFFC7A684FF855F36E80000002D00000000000000000000
          0026865E35E9C6A784FFFCF7EFFFB38A5EFFB89167FFFAF2E4FFF8EFE0FFFBF3
          E6FFB99268FFB38B5EFFFCF7EFFFC6A784FF865E35E90000002A000000006447
          2ACCC8A887FFFDF9F2FFB58C5FFFA67542FFA57441FFB89065FFFDF8EFFFA26E
          39FFA77644FFA67543FFB58C5FFFFDF9F2FFC8A887FF785632DD00000000A674
          42FFFFFFFFFFC4A481FFA3713DFFA87746FFA67441FFB99166FFFFFFFEFFA471
          3DFFA97949FFA97948FFA4713DFFC4A481FFFFFFFFFFA67442FF000000004B35
          1FACC9A989FFFFFFFCFFB48D61FFA57341FFBE9A73FFFFFFFFFFFFFFFFFFA573
          40FFA97948FFA77643FFB58D62FFFFFFFCFFC9A989FF5E4327C1000000000000
          000047321CA7C9AA8BFFFFFFFFFFB68C61FFA3713CFFA26F3AFFA26F3AFFA675
          42FFA67542FFB78D62FFFFFFFFFFC9AA8BFF47321CA700000000000000000000
          00000000000047321CA7CAAB8CFFFFFFFFFFB58C60FFBA946AFFFFFFFEFFA370
          3CFFB68E62FFFFFFFFFFCAAB8CFF47321CA70000000000000000000000000000
          0000000000000000000047321CA7CAAC8EFFFFFFFFFFB38A5EFFA06B35FFB48B
          5FFFFFFFFFFFCAAC8EFF47321CA7000000000000000000000000000000000000
          000000000000000000000000000046321CA7CBAD8EFFFFFFFFFFC6A886FFFFFF
          FFFFCBAD8FFF46321CA700000000000000000000000000000000000000000000
          00000000000000000000000000000000000046321CA7CBAE91FFFFFFFFFFCBAE
          91FF46321CA70000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000004B351FACA67440FF4B35
          1FAC000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000003
          0434001B2699001C289D001B279C001B279C001B279C001B279C001B279C001B
          279C001B279C001B279C001B279C001C289C0010177C0000002300000000034D
          69AB17C7F7FF06B2EAFF00B1E9FF00B0E9FF00B0E9FF00BAF5FF00BCF7FF00B0
          E9FF00B0E9FF00B0E9FF00B1E9FF00AEE7FF00A8E7FF00060857000000000016
          1F6237DAF7FF26DEFFFF0DD4FCFF05D2FCFF00D6FEFF007993FF00667BFF00D1
          FAFF00D2FDFF00D0FCFF00D2FCFF00D2FEFF007CA7E400000024000000000000
          0006117696D04CE6FEFF27D7FBFF19D5FCFF0DD5FDFF002128FF000303FF00C4
          ECFF00D2FEFF00CEFAFF00D1FCFF00C2F7FF000B106800000000000000000000
          0000000E144F45D3F1FE50E4FEFF31D9FBFF24DBFDFF14AECFFF09A1C0FF03D3
          FDFF00CEFAFF00CFFBFF00CFFEFF00506EC70000000800000000000000000000
          0000000000000B5570B56BEAFEFF53E0FCFF42E5FFFF249AB2FF128097FF18DE
          FFFF0AD0FAFF03D2FCFF00AEE0F9000203400000000000000000000000000000
          0000000000000006093746C4E2F87CEEFFFF60EDFFFF225D68FF0A2E36FF30DC
          FBFF23D9FEFF0FCFFFFF00243299000000000000000000000000000000000000
          00000000000000000000064259A386F1FFFF78DCEEFF0B181BFF000000FF3DB5
          CEFF3EE6FFFF0780A9E300000020000000000000000000000000000000000000
          000000000000000000000003052945BFDEF59AE5EEFF0A1113FF000000FF5CBF
          D0FF33D8FFFF000D126D00000000000000000000000000000000000000000000
          00000000000000000000000000000234479395F4FEFF81B5BCFF68A0A9FF76EE
          FFFF055372C80000000800000000000000000000000000000000000000000000
          00000000000000000000000000000001021A35A3C2E9C7FFFFFFBEFFFFFF37BE
          E6FA000204420000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000212E778EEDFBFF83EEFFFF0029
          3A9F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000C0A5F7CBD075470B80000
          0017000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000103230B122F7D223590DB273FB0F3253DAEF31D30
          8CDB090F2C7D0001032300000000000000000000000000000000000000000000
          000000000000060815532D42A6E65163D4FF8490E7FF95A0EEFF959FEDFF838E
          E5FF4B5CCEFF203599E603061353000000000000000000000000000000000000
          0000060916533951C1F47484E3FFA1ACF4FF7E8BECFF5B66E4FF5A65E3FF7C87
          EAFF9FA8F1FF6E7BDDFF253DAFF4040614530000000000000000000000000101
          0322384CB0E57788E6FFA3B0F5FF5666E7FF5564E6FF8992EDFF8892ECFF525E
          E2FF515CE1FF9FA9F2FF6E7CDDFF22369AE50001032200000000000000001319
          367E5F72E0FFA4B3F7FF596DEBFF586BEAFF5768E8FFFFFFFFFFFFFFFFFF5461
          E5FF5360E3FF525EE2FF9FA9F2FF4F60D1FF0A112F7E00000000000000003B50
          A9DB8E9FF0FF8499F4FF5B72EEFF5A6FECFF596DEBFF909DF1FFA6AFF3FF5666
          E7FF5564E6FF5461E5FF7C89EBFF8591E7FF233692DB00000000000000005068
          D9F6A0B3F7FF6480F2FF5E77F0FF5C75EFFF5B72EEFFD3D9FAFFFFFFFFFF586B
          EAFF5768E8FF5666E7FF5C6BE7FF99A5F1FF3149BCF60000000000000000546D
          DDF6A1B6F8FF6684F4FF5F7BF3FF5E79F1FF5E77F0FFFFFFFFFFFFFFFFFF5A6F
          ECFF596DEBFF586BEAFF5E6EE9FF9BA8F1FF354CC0F600000000000000004659
          B1DB91A6F3FF88A1F8FF6180F4FF607DF3FF5F7BF3FFFFFFFFFFFFFFFFFF5C75
          EFFF5B72EEFF5A6FECFF8293F1FF8998ECFF2D419ADB0000000000000000181E
          3B7E6B81ECFFA9BDFBFF6282F5FF6181F5FF6180F4FFFFFFFFFFFFFFFFFF5E79
          F1FF5E77F0FF5C75EFFFA5B5F8FF5C6FDDFF1016347E00000000000000000102
          04225165C6E58397F0FFA9BDFBFF6282F5FF6282F5FFFFFFFFFFFFFFFFFF607D
          F3FF5F7BF3FFA6B9F9FF7A8DEAFF3B50B2E50101032200000000000000000000
          00000B0D1A535D75E2F48497F1FFA9BDFBFF8AA3F8FF6A89F6FF6A89F6FF89A2
          F8FFA8BCFAFF7E92ECFF4A62D0F4080B17530000000000000000000000000000
          0000000000000B0D1A535469CBE66D83EEFF92A6F4FFA0B4F8FFA0B4F8FF91A6
          F3FF677CE9FF475DBFE6090B1853000000000000000000000000000000000000
          0000000000000000000002020423181F3C7D4B5FB7DB5B73E0F35971DEF3475A
          B3DB161D397D0102042300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end>
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
    Images = SmallImages
    LookAndFeel.SkinName = 'VisualStudio2013Blue'
    Options = [doActivateAfterDocking, doDblClickDocking, doFloatingOnTop, doTabContainerHasCaption, doTabContainerCanAutoHide, doSideContainerCanAutoHide, doTabContainerCanInSideContainer, doRedrawOnResize, doUseCaptionAreaToClientDocking]
    ResizeStyle = drsUpdate
    OnLayoutChanged = DockingManagerLayoutChanged
    Left = 232
    Top = 412
    PixelsPerInch = 96
  end
  object ImagesLarge: TcxImageList
    SourceDPI = 96
    Height = 32
    Width = 32
    FormatVersion = 1
    DesignInfo = 23069020
    ImageInfo = <
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000005000000100000001600000016000000160000
          0016000000160000001600000016000000160000001600000016000000160000
          0016000000160000001600000016000000150000000D00000004000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000010000000310000004200000043000000430000
          0043000000430000004300000043000000430000004300000043000000430000
          00430000004300000043000000430000003F0000002B0000000D000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000169C9C9BF1AFAFADFFAEAEABFFADADABFFADAD
          ABFFADADABFFADADABFFADADABFFADADABFFADADABFFADADABFFADADABFFADAD
          ABFFADADABFFADADABFFAEAEABFFAFAFADFF5E5E5DC400000015000000040000
          000D000000150000001600000016000000160000001600000016000000160000
          0016000000160000001600000027B0B0ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0ADFF000000160000000D0000
          002B0000003F0000004300000043000000430000004300000043000000430000
          0043000000430000004300000048B1B0ACFFFFFFFFFFFFFFFFFFFEFEFFFFFEFE
          FFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFE
          FFFFFEFEFFFFFEFEFFFFFFFFFFFFFFFFFFFFAEAEABFF00000016000000152137
          4EC43E6793FF3E6793FF3E6793FF3E6793FF3E6793FF3E6793FF3E6793FF3E67
          93FF3D6693FF366291FF366291FFB5B2ADFFFFFFFFFFFCFCFCFFFCFCFCFFFCFC
          FCFFFCFCFCFFFCFCFCFFFBFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFBFC
          FCFFFCFCFCFFFCFCFCFFFCFCFCFFFFFFFFFFADADABFF00000016000000163F67
          93FF4F85ACFF4B80AAFF4B80AAFF4B80AAFF4B80AAFF4B80AAFF4B80AAFF4B80
          AAFF4B80AAFF477CA9FF477CA9FFB6B2ADFFFFFFFFFFFDFCFCFFFFFEFEFFFFFE
          FEFFFFFEFEFFFEFDFDFFFEFCFCFFFFFEFEFFFFFEFEFFFFFEFEFFFEFDFDFFFEFC
          FCFFFFFEFEFFFEFDFDFFFCFBFBFFFFFFFFFFADADABFF00000016000000163E67
          94FF578AB1FF4B80AAFF4B80AAFF4B80AAFF4B80AAFF4B80AAFF4B80AAFF4B80
          AAFF4B80AAFF477DAAFF477DAAFFB6B2ACFFFFFFFFFFFDFDFDFF818181FFB6B6
          B6FFB5B5B5FFB3B3B3FFFFFFFFFF818181FFB6B6B6FFB5B5B5FFB3B3B3FFFFFF
          FFFF808080FFB3B3B3FFFBFCFCFFFFFFFFFFADADABFF00000016000000163F68
          94FF5E8FB5FF4B82ACFF4C82ACFF4C82ACFF4C82ACFF4C82ACFF4C82ACFF4C82
          ACFF4C82ACFF4880ACFF4880ACFFB6B2ACFFFFFFFFFFFCFBFBFFFFFFFFFFFFFF
          FFFFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
          FEFFFFFFFFFFFFFEFEFFFAF9F9FFFFFFFFFFADADABFF00000016000000163E69
          94FF6495BAFF4D82AEFF4E83AEFF4E83AEFF4E83AEFF4E83AEFF4E83AEFF4E83
          AEFF4E83AEFF4A81AEFF4A81AEFFB6B2ACFFFFFFFFFFFAFAF9FF818181FFB5B5
          B4FFFDFEFCFF828383FFB6B6B5FFB4B4B3FFFDFEFCFF838383FFB6B6B5FFB5B6
          B4FFB5B5B4FFB2B2B1FFF8F8F7FFFFFFFFFFADADABFF00000016000000163E69
          95FF6B9ABFFF4D84B0FF4F85B0FF4F85B0FF4F85B0FF4F85B0FF4F85B0FF4F85
          B0FF4F85B0FF4B83B0FF4B83B0FFB6B1ABFFFFFFFFFFF8F7F7FFFDFCFCFFFEFC
          FCFFFCFBFBFFFDFCFCFFFCFBFCFFFDFCFCFFFDFBFCFFFEFCFDFFFDFCFCFFFCFB
          FBFFFDFCFCFFFBFAFAFFF7F6F6FFFFFFFFFFADADABFF00000016000000163E69
          95FF729FC3FF4E86B1FF5087B2FF5087B2FF5087B2FF5087B2FF5087B2FF5087
          B2FF5087B2FF4C85B2FF4C85B2FFB6B1ABFFFFFFFFFFF6F7F5FF838384FFB6B6
          B5FFB4B4B3FFB3B3B2FFFAFAF9FF838484FFB5B5B4FFB5B5B4FFB3B3B2FFFAFA
          F9FF828282FFB3B3B2FFF5F5F4FFFFFFFFFFADADABFF00000016000000163D69
          96FF79A5C8FF4E86B3FF5088B4FF5188B4FF5188B4FF5188B4FF5188B4FF5188
          B4FF5188B4FF4D86B4FF4D86B4FFB6B1ABFFFFFFFFFFF5F4F2FFFAF9F8FFFAF9
          F8FFF9F8F7FFF9F8F7FFF9F8F7FFFAF9F7FFF9F8F7FFFAF9F8FFFAF9F7FFF9F8
          F7FFFAF9F8FFF8F7F5FFF3F2F1FFFFFFFFFFADADABFF00000016000000163E6A
          95FF81AACCFF5088B5FF538AB6FF538AB6FF538AB6FF538AB6FF538AB6FF538A
          B6FF538AB6FF4F88B6FF4F88B6FFB5B1ABFFFFFFFFFFF3F2F2FF828283FFB3B3
          B3FFF7F6F6FF848484FFB3B3B3FFB1B2B2FFF7F6F6FF848585FFB4B4B4FFB3B3
          B3FFB3B3B3FFB0B0B0FFF1F0F0FFFFFFFFFFADADABFF00000016000000163E6B
          96FF87B0CFFF518AB7FF538CB8FF548CB8FF548CB8FF548CB8FF548CB8FF548C
          B8FF548CB8FF508AB8FF508AB8FFB5B1ABFFFFFFFFFFF1F0EFFFF7F6F4FFF7F6
          F5FFF6F5F3FFF6F5F4FFF6F5F4FFF6F5F4FFF6F5F4FFF7F6F5FFF7F5F4FFF6F5
          F4FFF7F6F5FFF5F3F2FFF0EFEEFFFFFFFFFFADADABFF00000016000000163D6B
          97FF8EB4D4FF518BB9FF548DBAFF558DBAFF558DBAFF558DBAFF558DBAFF558D
          BAFF558DBAFF518BBAFF518BBAFFB5B1ABFFFFFFFFFFEFEEEEFF858585FFB3B3
          B3FFB2B2B2FFB0B0B1FFF4F2F3FF858585FFB3B3B3FFB2B2B2FFB0B1B1FFF4F3
          F3FF848484FFB0B0B1FFEEEDEDFFFFFFFFFFADADABFF00000016000000163E6B
          98FF94BAD8FF528DBBFF558FBCFF568FBCFF568FBCFF568FBCFF568FBCFF568F
          BCFF568FBCFF528DBCFF528DBCFFB5B1ABFFFFFFFFFFEDEDECFFF2F2F1FFF3F3
          F2FFF2F2F1FFF0F0EFFFF2F2F0FFF3F3F2FFF3F3F2FFF2F2F1FFF0F0EFFFF2F2
          F1FFF3F3F2FFF0F0EFFFECECEAFFFFFFFFFFADADABFF00000016000000163D6C
          98FF9ABDDBFF528DBEFF568FBFFF5790BFFF5790BFFF5790BFFF5790BFFF5790
          BFFF5790BFFF538EC0FF538EC0FFB5B1AAFFFFFFFFFFECEBEAFF858586FFB2B2
          B1FFB0B0AFFFF0EFEEFF868686FFB2B3B1FFB1B1B0FFB0B0AFFFF0EFEEFF8485
          85FFB2B2B1FFAFAFAEFFEBEAE8FFFFFFFFFFADADABFF00000016000000163E6D
          98FFA1C3DEFF548FC0FF5891C1FF5992C1FF5992C1FF5992C1FF5992C1FF5992
          C1FF5992C1FF5690C2FF5690C2FFB5B0AAFFFFFFFFFFE9E9E8FFEFEFEEFFEFEF
          EEFFEDEDECFFEEEEEDFFF0F0EFFFEFEFEEFFEEEEEDFFEFEFEEFFEEEFEDFFEFF0
          EEFFEFEFEEFFECEDECFFE8E8E7FFFFFFFFFFAEAEABFF00000016000000163D6D
          99FFA7C8E1FF5591C1FF5993C3FF5A94C3FF5A94C3FF5A94C3FF5A94C3FF5A94
          C3FF5A94C3FF5793C4FF5793C4FFB5B0AAFFFFFFFFFFE8E7E6FF848484FFB0AF
          AFFFECEBEAFF868686FFB1B0B0FFAFAEAEFFECEBEAFF868686FFB1B0B0FFB1B0
          B0FFB0AFAFFFAEADADFFE7E6E4FFFFFFFFFFAEAEABFF00000016000000163D6E
          99FFADCDE5FF5692C3FF5A94C5FF5B95C5FF5B95C5FF5B95C5FF5B95C5FF5B95
          C5FF5B95C5FF5894C6FF5894C6FFB5B0AAFFFFFFFFFFE4E3E3FFE7E6E6FFE7E6
          E6FFE6E5E6FFE8E7E7FFE8E7E7FFE7E6E6FFE6E5E5FFE8E7E7FFE8E7E7FFE7E6
          E6FFE7E6E6FFE6E5E5FFE3E2E2FFFFFFFFFFAEAEABFF00000016000000163E6D
          9AFFB3D0E8FF5694C5FF5B96C7FF5C97C7FF5C97C7FF5C97C7FF5C97C7FF5C97
          C7FF5C97C7FF5996C8FF5996C8FFB5B0AAFFFFFFFFFFE0DFDEFFE1E0DFFFE2E1
          DFFFE2E0DFFFE2E1DFFFE2E1DFFFE2E0DFFFE1E0DFFFE2E1DFFFE2E1DFFFE2E1
          DFFFE2E1DFFFE1E0DFFFE0DFDEFFFFFFFFFFAEAEACFF00000015000000163D6E
          9BFFB9D4EBFF5796C7FF5C98C9FF5D99C9FF5D99C9FF5D99C9FF5D99C9FF5D99
          C9FF5D99C9FF5A98CAFF5A98CAFFBAB3ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFADFF0000000D000000163D6F
          9AFFBFD9EEFF5996C9FF5E99CBFF5F9ACBFF5F9ACBFF5F9ACBFF5F9ACBFF5F9A
          CBFF5F9ACBFF5E99CBFF5998CDFF98AAB8FFBAB3AAFFB7B0A9FFB7B0A9FFB7B0
          A9FFB7B0A9FFB6B0A9FFB5AFA8FFB3AFA9FFB3B0ABFFB1AFACFFAFAEACFFAEAE
          ABFFAEAEABFFAEAEABFFAEAEACFFB0B0ADFF575755B400000004000000163D70
          9BFFC4DCF0FF5998CBFF5F9BCDFF609CCDFF609CCDFF609CCDFF5F9CCEFF5F9C
          CEFF5F9CCEFF5F9CCEFF5D9BCFFF5A9ACFFF5699CFFF5598CFFF5598CFFF5698
          CFFF5698CEFF5597CEFF5195CDFFBCD9F1FF2E6799FF00000016000000000000
          0000000000000000000000000000000000000000000000000000000000163D71
          9CFFCBE1F3FF5A9ACDFF5F9DCFFF619ECFFF609ED0FF5D9ED2FF5B9ED3FF5A9E
          D4FF5A9ED4FF5A9ED4FF5A9ED4FF599DD4FF599DD4FF5A9DD4FF5C9ED2FF5E9E
          D1FF5F9ED0FF5E9DCFFF599ACEFFC9E0F4FF386E9BFF00000016000000000000
          0000000000000000000000000000000000000000000000000000000000163E70
          9DFFD0E6F5FF5A9ACFFF609DD0FF619ED1FF5E9FD4FF8699A8FF9C948DFF9993
          8EFF99938EFF99938EFF99938EFF99938EFF99938EFF9C948DFF8699A8FF5E9F
          D4FF619ED1FF609DD0FF5A9ACFFFD0E6F5FF3D709DFF00000016000000000000
          0000000000000000000000000000000000000000000000000000000000153E72
          9DFFD8E8F8FF599CD1FF5D9ED2FF5E9FD3FF5A9FD7FF9A938DFFFAF7F5FFE7E4
          E3FFE7E4E3FFE7E4E3FFE7E4E3FFE7E4E3FFE7E4E3FFFAF7F5FF9B938DFF5A9F
          D7FF5E9FD3FF5D9ED2FF599CD1FFD8E8F8FF3E729DFF00000015000000000000
          00000000000000000000000000000000000000000000000000000000000D4175
          A0FFAFD2F1FFADD0EEFFAED0EDFFAED1EEFFAAD1F2FF97928EFFE6E4E2FFC8C4
          C3FFC7C4C3FFC7C4C3FFC7C4C3FFC7C4C3FFC8C4C3FFE6E4E2FF98928EFFAAD1
          F2FFAED1EEFFAED0EDFFADD0EEFFAFD2F1FF4175A0FF0000000D000000000000
          000000000000000000000000000000000000000000000000000000000004223B
          4FB44377A1FF4175A0FF4175A0FF4075A0FF3A73A2FF9B9692FFD7D3D2FFD2D0
          CFFFCFCDCCFFCECCCAFFCDCBCAFFCDCBCAFFCFCDCCFFD2CFCDFF9B9692FF3A73
          A2FF4075A0FF4175A0FF4175A0FF4377A1FF223B4FB400000004000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000000D9090
          90FFE5E5E5FFE3E3E3FFE3E3E3FFE5E5E5FF909091FF0000000D000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000044848
          48B3959595FF949494FF949494FF959595FF484848B300000004000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          BE000000424DBE000000000000003E0000002800000020000000200000000100
          010000000000800000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000050000
          0010000000160000001600000016000000160000001600000016000000160000
          00160000000F000000050000000000000000000000050000000F000000160000
          001600000016000000160000001600000016000000100000000B000000100000
          0010000000050000000000000000000000000000000000000000000000100000
          0031000000420000004300000043000000430000004300000043000000430000
          003F0000002B0000000D00000000000000000000000D0000002A0000003F0000
          0043000000430000004300000043000000420000003000000020000000310000
          00350000001A0000000500000000000000000000000000000000000000163C7F
          C2F33E83CEFF3D81CCFF3D81CCFF3D81CCFF3D81CCFF3D81CCFF3E82CDFF4086
          CFFF3978B6E50000000C00000000000000000000000B3A79B8E64086CFFF3E82
          CDFF3D81CCFF3D81CCFF3D81CCFF3E83CEFF3D7CC2F00000002C008E40FF0081
          44F1000000390000001700000003000000000000000000000000000000163E83
          CEFF7DF7FFFF7AF1FFFF7AF0FFFF7AF0FFFF7AF0FFFF7AF1FFFF7CF5FFFF57B0
          E4FF26517DA50000000300000000000000000000000323476E9354AAE2FF7EF7
          FFFF7CF3FFFF7CF1FFFF7CF2FFFF7FF8FFFF4083D2FF00000037008C3EFF00C7
          84FF007A41EC0000003300000014000000030000000000000000000000163D81
          CCFF80F1FFFF69E6FFFF69E5FFFF69E5FFFF69E5FFFF69E6FFFF7FF1FFFF4088
          D0FF0000001600000000000000000000000000000000000000154482D8FF80E8
          FFFF76EDFFFF74ECFFFF74EDFFFF89F6FFFF4682DCFF0000004E00883EFF00E5
          A4FF00C080FF00592FC100000032000000140000000300000000000000163C81
          CCFF84F0FFFF63E1FFFF64E0FFFF65E0FFFF64E0FFFF69E3FFFF76DAF8FF3879
          C0F30000001B0000000200000000000000000000000100000017067751E40084
          35FF008034FF007F34FF007F35FF008236FF008639FF00873CFF00833EFF00DC
          A1FF00DBA0FF00BC81FF005A2FC1000000320000001400000004000000163C81
          CCFF88F1FFFF60DFFFFF62DEFFFF62DEFFFF62DEFFFF60DFFFFF89F1FFFF3B7F
          CCFF0000002E0000001300000009000000090000001000000028008A3AFF36E7
          B9FF00D89FFF00D89FFF00D89FFF00D89FFF00D9A0FF00D9A0FF00D89FFF00D3
          9CFF00D39CFF00D6A0FF00BA80FF005A2FC10000002E0000000D000000163C81
          CCFF8EF1FFFF5BDCFFFF5CDCFFFF5DDCFFFF5DDCFFFF5CDCFFFF83ECFFFF4F9B
          DAFF19365493000000350000002800000028000000340B152363008737FF51E5
          C1FF00CF9AFF00CF9BFF00CF9BFF00CF9BFF00CF9BFF00CF9BFF00CF9BFF00CD
          9AFF00CD9AFF00CE9BFF00D29FFF00B881FF005E32BF00000012000000163C81
          CCFF91F1FFFF55DAFFFF56DAFFFF57DAFFFF58DAFFFF58DAFFFF69E0FFFF83DC
          F9FF3F85CEFF265282BF152C4488152C4588285484C0498ADEFF008535FF6BE5
          CBFF00C897FF00C898FF00C899FF00C899FF00C899FF00C899FF00C999FF00C9
          99FF00C99AFF00C999FF07CDA0FF2BDCB6FF008A47FF0000000E000000163C82
          CDFF97F4FFFF89ECFFFF96F0FFFF92EEFFFF80E8FFFF62DDFFFF51D8FFFF6CE1
          FFFF91E9FFFF6FBFEBFF5DABE0FF57A3DCFF71C1EEFF9AF0FFFF008132FF86E8
          D6FF00C397FF00C398FF00C399FF00C399FF00C399FF00C399FF00C398FF00C4
          98FF00C599FF00C599FF60E0C4FF00B27AFF005A28B40000000C000000113E85
          CEFF7ACEF3FF4C95D7FF3A7FCBFF4187CFFF5DAAE0FF96E9FFFF6ADFFFFF4ED4
          FFFF57D8FFFF6FE1FFFF83E7FFFF84E7FFFF76E3FFFF5FDEFFFF00802FFF9AED
          DFFF4CE8D1FF50E8D2FF51E8D2FF51E8D2FF51E8D2FF51E8D2FF4DE7D1FF93E6
          D7FF00BF97FF5EDAC2FF00AC73FF128373FF111F346800000012000000064088
          D0FF3A7ABBE911233649000000020204060A1D3F63844C93D6FF9AE9FFFF56D5
          FFFF4ED2FFFF4ED3FFFF4ED3FFFF4ED3FFFF4FD3FFFF54D7FFFF15A182FF0080
          2FFF008031FF008031FF008031FF008031FF008132FF008135FF008036FF81E3
          D5FF58D8C1FF00A671FF25A784FF90DAFFFF3E80CDFA00000016000000000000
          00000000000000000000000000000000000000000007265382AF6EB8E7FF7BE3
          FFFF49D0FFFF4CD1FFFF4CD1FFFF4CD1FFFF4DD1FFFF4FD3FFFF51D5FFFF53D6
          FFFF54D7FFFF54D7FFFF54D7FFFF54D7FFFF54D7FFFF58DBFFFF008336FF79E1
          D3FF00A673FF16A083FF4ED6FFFFA2F4FFFF3C82CEFF00000016000000000000
          000000000000000000000000000000000000000000050B182547549CDAFF8FE8
          FFFF45CEFFFF49CFFFFF4ACFFFFF4ACFFFFF4ACFFFFF4ACFFFFF4BD0FFFF4BD0
          FFFF4CD0FFFF4BD0FFFF4AD0FFFF48CFFFFF47D0FFFF4DD5FFFF008435FF00A6
          7AFF02915AFF4DD4FFFF43D0FFFFAAF4FFFF3B82CDFF00000011000000010000
          000300000002000000000000000000000000000000080C192750569DDAFF92E9
          FFFF40CCFFFF45CDFFFF46CDFFFF46CDFFFF46CDFFFF46CDFFFF46CDFFFF46CD
          FFFF46CDFFFF45CDFFFF42CCFFFF5AD4FFFFA1ECFFFFB7F7FFFF00872FFF159B
          5DFF64D9FFFF4CD3FFFF84E5FFFF91D8F8FF3B81CAFB00000008000000080000
          0017000000180000000E00000007000000090000001B1021346C569CDAFF95E8
          FFFF3DC9FFFF42CAFFFF43CAFFFF43CAFFFF43CAFFFF43CAFFFF43CAFFFF43CA
          FFFF43CAFFFF42CAFFFF3CC8FFFFB3F0FFFF5499D9FF3C81D0FF4284D7FF6FB1
          ECFF9FE1FFFFACEDFFFF85CAF1FF4289D1FF0D1C2A3B00000001000000121022
          346704090D4C0000003000000024000000290000003D2D67A1DA87C8EFFF70D9
          FFFF3AC7FFFF3EC8FFFF3FC8FFFF3FC8FFFF3FC8FFFF3FC8FFFF3FC8FFFF3FC8
          FFFF3FC8FFFF3DC8FFFF36C6FFFFB8F2FFFF387FCBFF00000016000000032044
          6A873676B7E53B82CDFF2D6299C108111A250000000100000000000000163F87
          CFFF448CD2FF224A74B20B172469142C44873271B1E86AABE0FFACEDFFFF3CC7
          FFFF3AC5FFFF3CC6FFFF3CC6FFFF3CC6FFFF3CC6FFFF3CC6FFFF3CC6FFFF3CC6
          FFFF3CC6FFFF3AC6FFFF33C4FFFFBCF3FFFF3981CCFF00000016000000000000
          0000000000000000000000000000000000000000000000000000000000163B84
          CEFFB8F1FFFF7ABAE8FF599CDAFF63A4DCFF8EC8EFFFAFEDFFFF49CAFFFF35C3
          FFFF38C4FFFF39C4FFFF39C4FFFF39C4FFFF39C4FFFF39C4FFFF39C4FFFF39C4
          FFFF39C4FFFF37C4FFFF2FC2FFFFC1F3FFFF3981CCFF00000016000000000000
          0000000000000000000000000000000000000000000000000000000000163981
          CCFFC1F4FFFF7BDBFFFF9FE6FFFF95E2FFFF6ED5FFFF35C3FFFF30C1FFFF34C2
          FFFF35C2FFFF35C2FFFF35C2FFFF35C2FFFF35C2FFFF35C2FFFF35C2FFFF35C2
          FFFF35C2FFFF33C2FFFF2AC0FFFFC5F3FFFF3981CCFF00000016000000000000
          0000000000000000000000000000000000000000000000000000000000163881
          CCFFC7F3FFFF1FBBFFFF26BCFFFF29BDFFFF2ABDFFFF2DBDFFFF2FBEFFFF30BE
          FFFF31BFFFFF32BFFFFF32BFFFFF31BFFFFF30BEFFFF30BEFFFF30BEFFFF30BE
          FFFF30BEFFFF2EBDFFFF25BCFFFFC9F3FFFF3881CCFF00000017000000000000
          0000000000000000000000000000000000000000000000000000000000163881
          CCFFCCF4FFFF18B8FFFF1EB9FFFF20BAFFFF20BAFFFF21BAFFFF21BAFFFF23BA
          FFFF27BBFFFF2BBCFFFF2CBCFFFF28BBFFFF23BAFFFF21BAFFFF21BAFFFF21BA
          FFFF21BAFFFF1FB9FFFF18B8FFFFCCF4FFFF3781CCFF00000018000000010000
          0000000000000000000000000000000000000000000000000000000000103A83
          CEFFD1F8FFFFD0F4FFFFD2F4FFFFD3F4FFFFD3F4FFFFD3F4FFFFD3F3FFFFD4F2
          FFFF62CDFFFF23B9FFFF24B9FFFF4AC6FFFFD4F2FFFFD3F3FFFFD3F4FFFFD3F4
          FFFFD3F4FFFFD2F4FFFFD0F3FFFFD0F7FFFF4D93D5FF04090D20000000000000
          0000000000000000000000000000000000000000000000000000000000053B7E
          C1EF3A83CEFF3881CCFF3881CCFF3881CCFF3881CCFF3881CCFF367FCBFF5192
          D4FFCCEFFFFF1AB6FFFF1BB6FFFFC1EBFFFF5B99D8FF367FCBFF3881CCFF3881
          CCFF3881CCFF3781CCFF3781CCFF4D93D5FF3D86CFFF00000006000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000040000001E357E
          C8FDC8E5FBFF2FBCFFFF15B4FFFFDCF4FFFF357FCBFF0000001C000000030000
          000000000000000000000000000004090D110000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000D010203334087
          CFFFE3F4FFFF16B4FFFF16B4FFFFE2F4FFFF357FCBFF0000002B0000000A0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000014275788BD8BBB
          E8FF96DCFFFF1BB5FFFF19B5FFFFB0E4FFFF76ADE1FF1F44699D000000100000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000163982CDFFD8EE
          FFFF2EBCFFFF1FB6FFFF1DB6FFFF54C8FFFFB8D9F8FF2F6BA7DB000000120000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000113882CDFFE2F6
          FFFF13B4FFFF1EB6FFFF1CB5FFFF47C4FFFFB8D8F7FF2F6AA7D80000000E0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000083477B9E9B8D9
          F8FF7AD4FFFF13B4FFFF12B4FFFF93DCFFFFA1CCF1FF2C639BC6000000060000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000211263A514289
          D0FFB8D9F8FFD5F1FFFFD4F1FFFFB7D9F8FF428AD0FF08111A29000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000021126
          3A4E3981CAFA4189D0FF4C91D4FF3880C9FA11263A4E00000002000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000030000000900000011000000150000001600000016000000160000
          0016000000150000001100000009000000030000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001000000060000
          00100000001B0000002900000038000000410000004300000043000000430000
          00430000004100000038000000290000001B0000001000000006000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000030000000D000000200000
          00350201004C2F201099805829DEB57C38FFB47B36FFB47B36FFB47B36FFB47B
          36FFB57C38FF80592ADE2F2110990201004C00000035000000200000000D0000
          0003000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000005000000160000002E0705025A825A
          2ADFBF8D4DFFD8B687FFF2E0C1FFFFF8E3FFFFFFEFFFFFFFEEFFFFFFEEFFFFFF
          EFFFFFF8E4FFEDD7B5FFD3AD7CFFB98441FF825A2BDF0705025A0000002E0000
          0016000000050000000000000000000000000000000000000000000000000000
          000000000000000000000000000500000019000000384B3419B4BE8B4DFFE7CF
          A9FFFFFFEEFFFFFCE7FFFFF8E2FFFFF6DFFFFFF5DEFFFFF5DDFFFFF5DDFFFFF5
          DEFFFFF6DFFFFFF8E4FFFFFDE8FFFFF8E4FFDDBF94FFB98542FF4B341AB40000
          0038000000190000000500000000000000000000000000000000000000000000
          00000000000000000005000000190000003A966730EDD2AC7AFFFFF7E1FFFFF8
          E4FFFFF5DEFFFFF3DBFFFEF3DAFFFEF2D9FFFEF2D9FFFEF2D9FFFEF2D9FFFEF2
          D9FFFEF2D9FFFEF3DAFFFFF4DBFFFFF5DFFFFFFAE6FFFCF0D8FFC89C64FF9768
          32ED0000003A0000001900000005000000000000000000000000000000000000
          000000000003000000160000003893652EEBE6CEA9FFFFFCE9FFFFF5DEFFFEF1
          D7FFFDF0D6FFFDF0D6FFFDF0D6FFFDF0D6FFFDF0D6FFFDF0D6FFFDF0D6FFFDF0
          D6FFFDF0D6FFFDF0D6FFFDF0D6FFFDF0D6FFFEF1D8FFFFF6DFFFFFFEEBFFD3B0
          7EFF946630EB0000003800000016000000030000000000000000000000000000
          00010000000D0000002E96682FECE7CDA9FFFFFAE6FFFFF3D9FFFDEFD4FFFDEF
          D4FFFDEFD4FFFDEFD4FFFDEFD4FFFDEFD4FFFDEFD4FFFDEFD4FFFDEFD4FFFDEF
          D4FFFDEFD4FFFDEFD4FFFDEFD4FFFDEFD4FFFDEFD4FFFDF0D4FFFFF3DBFFFFFC
          E9FFD5B080FF976932EC0000002E0000000D0000000100000000000000000000
          00060000001F483318B0D2AB78FFFFFBE8FFFEF2D8FFFCEED2FFFCEED2FFFCEE
          D2FFFCEFD3FFFDF0D4FFFCEFD3FFFCEED2FFFCEED2FFFCEED2FFFCEED2FFFCEE
          D2FFFCEED2FFFCEFD3FFFDF0D4FFFDF0D4FFFCEFD3FFFCEED2FFFCEFD2FFFEF2
          DAFFFFFDEBFFC4965BFF483319B00000001F0000000600000000000000000000
          00100604024CBE8C4DFFFFF4DFFFFFF2DAFFFCECD0FFFCECD0FFFCECD0FFFDEE
          D3FFFFF2D8FFFBEBCDFFFEEFD5FFFCEDD1FFFCECD0FFFCECD0FFFCECD0FFFCEC
          D0FFFDEED3FFFFF2D8FFFFF4DCFFFFF4DCFFFFF2D8FFFDEED3FFFCECD0FFFCEC
          D0FFFFF3DBFFFDEFD8FFB67E3BFF0604024C0000001000000000000000030000
          001B80592ADDE6CBA7FFFFF6E2FFFDECCEFFFCEBCEFFFCEBCEFFFDECD0FFFFF1
          D6FFCDA36EFFAD712BFFFFF6DDFFFFEFD3FFFDECCFFFFCEBCEFFFCEBCEFFFDEC
          D0FFFFF1D6FFCDA36EFFAE7430FFAE7430FFCDA36EFFFFF1D6FFFDECD0FFFCEB
          CEFFFDECCFFFFFF7E4FFD7B488FF815A2BDD0000001B00000003000000090101
          0032BE8C4BFFFFFBEAFFFCEFD3FFFBEACBFFFBEACBFFFBEACBFFFCECCDFFFFF3
          D6FFAF7530FFF8C77CFFAD722EFFFFF5DAFFFDEED0FFFBEBCCFFFBEACBFFFCEC
          CDFFFFF3D6FFAE7530FFF8CA81FFF8C77AFFAF7531FFFFF3D7FFFCECCDFFFBEA
          CBFFFBEACBFFFDEFD5FFFCF1DDFFB67E3BFF0101003200000009000000112B1E
          0E8DD6B386FFFFF6E4FFFBE8C9FFFBE8C9FFFBE8C9FFFBE8C9FFFCEACBFFFFF1
          D6FFB07633FFF2C582FFF1C480FFAD722EFFFFF2D7FFFEEBCEFFFCE9CAFFFCEA
          CBFFFFF1D6FFAF7633FFF2C785FFF1C075FFAF7633FFFFF1D6FFFCEACBFFFBE8
          C9FFFBE8C9FFFCE9C9FFFFF7E6FFC99E69FF2B1E0F8D00000011000000157E57
          29DAF0DABCFFFEF1D8FFFAE7C6FFFAE7C7FFFAE7C7FFFAE7C7FFFBE9C9FFFFF0
          D4FFB07633FFEEC385FFE7B468FFEDC382FFAD732FFFFFF1D5FFFCEBCCFFFCE9
          CAFFFFF0D4FFAF7633FFF0C687FFECBA6EFFB07734FFFFF0D4FFFBE9C9FFFAE7
          C7FFFAE7C7FFFAE7C7FFFFF2DBFFE2C49FFF7E572ADA0000001500000016B57C
          38FFFFF3E1FFFDECD0FFFAE5C4FFFAE5C5FFFAE5C5FFFAE5C5FFFBE7C7FFFFEE
          D1FFB07633FFEAC489FFE1AE61FFE2AF62FFEDC78DFFAD732EFFFFEED2FFFDEA
          CCFFFFEED2FFB07633FFEEC88DFFE9B668FFB07735FFFFEED2FFFBE7C7FFFAE5
          C5FFFAE5C5FFFAE5C4FFFEEDD2FFF5E6CEFFB67D3AFF0000001600000016B47B
          37FFFFFAECFFFBE7C9FFF9E4C2FFF9E4C3FFF9E4C3FFF9E4C3FFFAE6C5FFFFED
          CFFFB07733FFE8C48CFFDCA95BFFDCA95CFFDCA95BFFECCB9AFFAE732EFFFFEF
          D2FFFFF0D3FFB07733FFEDC892FFE4B162FFB07835FFFFEDD0FFFAE6C5FFF9E4
          C3FFF9E4C3FFF9E4C2FFFCE8CAFFF9ECD9FFB57C38FF0000001600000016B47B
          37FFFFFAEDFFFAE6C5FFF9E3C0FFF9E3C1FFF9E3C1FFF9E3C1FFFAE5C3FFFFEC
          CDFFB07733FFE6C592FFD7A254FFD7A356FFD7A255FFDAAA61FFECCEA1FFAF74
          2EFFFFF2D5FFB17834FFECCA98FFDFAB5CFFB17836FFFFECCEFFFAE5C3FFF9E3
          C1FFF9E3C1FFF9E3C0FFFBE6C9FFFFFBEEFFB57C37FF0000001600000016B47B
          37FFFFFBEDFFFAE6C6FFF8E0BDFFF8E1BEFFF8E1BEFFF8E1BEFFF9E3C0FFFEE9
          C9FFB17733FFE6C797FFD19D4DFFD29E50FFD19D4EFFD5A55CFFEBCFA5FFAF75
          2FFFFFF0D1FFB17834FFEACB9DFFDBA655FFB17936FFFEEACAFFF9E3C0FFF8E1
          BEFFF8E1BEFFF8E0BDFFFAE7C6FFFFFCEEFFB57C37FF0000001600000015B47C
          37FFFFFCEFFFFAE5C5FFF8DFBBFFF8E0BCFFF8E0BCFFF8E0BCFFF9E2BEFFFEE8
          C7FFB17733FFE5CA9FFFCB9747FFCC9849FFCB9545FFEAD3AEFFAE732EFFFFEB
          CAFFFFEBCBFFB17733FFEBCFA5FFD6A050FFB27937FFFEE9C8FFF9E2BEFFF8E0
          BCFFF8E0BCFFF8E0BBFFFBE6C6FFFBF0E1FFB57C38FF0000001500000011B57D
          38FFFEF5E6FFFBE7CAFFF7DEB8FFF7DFBAFFF7DFBAFFF7DFBAFFF8E1BCFFFDE7
          C5FFB17733FFE5CBA4FFC58E3CFFC58E3DFFE7CFAAFFAF7430FFFDE8C6FFFAE4
          C0FFFDE8C5FFB17732FFEBD1ACFFD19A4AFFB27A38FFFDE8C6FFF8E1BCFFF7DF
          BAFFF7DFBAFFF7DFB8FFFBE8CBFFF6EAD8FFB67D39FF00000011000000097B55
          28D6EAD4B7FFFDEED8FFF7DCB6FFF7DDB8FFF7DDB8FFF7DDB8FFF8DFBAFFFDE5
          C3FFB17732FFE5CEABFFBF852FFFE5CFADFFAF7530FFFDE6C4FFFAE0BDFFF9DF
          BBFFFDE5C2FFB07732FFECD5B4FFCD9543FFB27A38FFFDE6C4FFF8DFBAFFF7DD
          B8FFF7DDB8FFF7DCB6FFFDEFD9FFE4CBABFF7B5629D60000000900000003261A
          0D7CD4B285FFFFF8EBFFF6DBB3FFF6DBB5FFF6DCB6FFF6DCB6FFF7DEB8FFFCE4
          C0FFB17731FFE6D1B2FFE6D1B2FFAF742FFFFCE5C2FFF8DFBBFFF6DDB7FFF7DE
          B8FFFBE4C0FFB07631FFECD8BAFFC78E3AFFB27936FFFCE4C1FFF7DEB8FFF6DC
          B6FFF6DBB5FFF6DBB3FFFFF9ECFFCFAA79FF261A0D7C00000003000000000000
          001AB98542FFFFFBF2FFFAE5C6FFF6DAB2FFF6DBB4FFF6DBB4FFF7DDB6FFFBE2
          BDFFB07631FFE7D7BBFFAF742EFFFCE3BFFFF8DEB8FFF6DCB5FFF6DBB4FFF7DD
          B6FFFBE2BDFFB07630FFEEDEC3FFEFDFC5FFB07732FFFBE2BDFFF7DDB6FFF6DB
          B4FFF6DAB2FFFAE5C7FFFEF6EBFFB7813FFF0000001A00000000000000000000
          00067D5628D6E3C8A9FFFFF6EAFFF6DAB1FFF6D8AFFFF6D9B1FFF7DAB2FFF9DE
          B7FFCC9E64FFAE732EFFFCE1BBFFF9DCB5FFF7DAB2FFF6D9B1FFF6D9B1FFF7DA
          B2FFF9DEB7FFCC9E64FFB07631FFB07631FFCC9E65FFF9DEB7FFF7D9B2FFF6D8
          AFFFF6DAB1FFFFF7EAFFDEC29FFF7D5629D60000000600000000000000000000
          000103020129B98542FFFDF5EAFFFCEDD7FFF5D6ABFFF5D7AEFFF5D8AFFFF6DA
          B1FFF8DDB5FFF9DDB5FFF7DBB2FFF5D9B0FFF5D8AFFFF5D8AFFFF5D8AFFFF5D8
          AFFFF6DAB1FFF8DDB5FFFADFB7FFFADFB7FFF8DDB5FFF6DAB1FFF5D8AEFFF5D6
          ABFFFCEDD8FFFAF1E5FFB8823FFF030201290000000100000000000000000000
          000000000003402D159CCBA26FFFFFFFF9FFF9E3C4FFF5D5A9FFF5D7ABFFF5D7
          ADFFF6D8AEFFF6D8AEFFF5D7ADFFF5D7ADFFF5D7ADFFF5D7ADFFF5D7ADFFF5D7
          ADFFF5D7ADFFF6D8AEFFF6D8AFFFF6D8AFFFF6D8AEFFF5D7ACFFF5D5A9FFF9E3
          C4FFFFFEF7FFC99F6AFF402D159C000000030000000000000000000000000000
          0000000000000000000593662FE7DEC2A0FFFFFFFAFFF9E2C4FFF4D3A6FFF4D4
          A9FFF4D5AAFFF4D5ABFFF4D5ABFFF4D5ABFFF4D5ABFFF4D5ABFFF4D5ABFFF4D5
          ABFFF4D5ABFFF4D5ABFFF4D5ABFFF4D5AAFFF4D4A9FFF4D3A6FFF9E2C4FFFFFE
          F8FFD9BC99FF93662FE700000005000000000000000000000000000000000000
          000000000000000000000000000590642CE5DEC3A1FFFFFFFEFFFCEDD9FFF4D4
          A8FFF4D2A5FFF4D3A7FFF4D4A8FFF4D4A9FFF4D4A9FFF4D4A9FFF4D4A9FFF4D4
          A9FFF4D4A9FFF4D4A8FFF4D3A7FFF4D2A5FFF4D4A8FFFCEDD9FFFFFFFDFFDABF
          9BFF91642DE50000000500000000000000000000000000000000000000000000
          00000000000000000000000000000000000593662EE6CBA270FFFEFAF4FFFFFA
          F3FFF7E2C3FFF3D0A1FFF3D1A2FFF3D1A3FFF3D1A4FFF3D1A4FFF3D1A4FFF3D1
          A4FFF3D1A3FFF3D1A2FFF3D0A1FFF8E2C3FFFFFBF3FFFDF8F1FFCAA16EFF9366
          2FE6000000050000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000033F2C1599B88340FFE3CE
          B1FFFFFFFFFFFFFFFCFFFCEEDCFFF9E1C2FFF7DBB5FFF7DBB5FFF7DBB5FFF7DB
          B5FFF9E1C2FFFCEEDCFFFFFFFCFFFFFFFFFFE3CCB0FFB88340FF3F2C15990000
          0003000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001030201237A54
          28D3B98341FFD5B68EFFEAD8C2FFFEFCF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFCF9FFEAD8C2FFD5B58DFFB98341FF7A5428D303020123000000010000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000E23180C72785327D1B57C37FFB57B36FFB47B35FFB47B35FFB57B
          36FFB57C37FF785327D123180C720000000E0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          BE000000424DBE000000000000003E0000002800000020000000200000000100
          010000000000800000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000050000
          000F000000150000001600000016000000160000001600000016000000160000
          0016000000160000001600000016000000160000001600000016000000160000
          0016000000160000001600000016000000160000001600000016000000160000
          0016000000160000001600000016000000140000000D000000030000000F0000
          002E000000410000004300000043000000430000004300000043000000430000
          0043000000430000004300000043000000430000004300000043000000430000
          0043000000430000004300000043000000430000004300000043000000430000
          00430000004300000043000000430000003E0000002A0000000D00000015825E
          15DBBB871EFFBB871EFFBB871EFFBB871EFFBB871EFFBB871EFFBB871EFFBB87
          1EFFBB871EFFBB871EFFBB871EFFBB871EFFBB871EFFBB871EFFBB871EFFBB87
          1EFFBB871EFFBB871EFFBB871EFFBB871EFFBB871EFFBB871EFFBB871EFFBB87
          1EFFBB871EFFBB871EFFBB871EFFBB871EFF533B0DB60000001400000016BB87
          1EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFBB871EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB871EFF0000001600000016BB87
          1EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFBB871EFFFFFFFFFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
          FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
          FCFFFCFCFCFFFCFCFCFFFCFCFCFFFFFFFFFFBB871EFF0000001600000016BB87
          1EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFBB871EFFFFFFFFFFF6F6F5FFADAAA8FFA9A7A4FFA6A3A1FFA29F
          9DFF9E9C9AFF9B9896FFF6F6F5FFF6F6F5FFADAAA8FFA9A7A4FFA6A3A1FFA29F
          9DFF9E9C9AFF9B9896FFF6F6F5FFFFFFFFFFBB871EFF0000001600000016BB87
          1EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFBB871EFFFFFFFFFFF0F0EFFFA6A3A1FFF0F0EFFFF0F0EFFFF0F0
          EFFFF0F0EFFFA6A3A1FFF0F0EFFFF0F0EFFFF0F0EFFFF0F0EFFFF0F0EFFFF0F0
          EFFFF0F0EFFFF0F0EFFFF0F0EFFFFFFFFFFFBB871EFF0000001600000016BB87
          1EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFBB871EFFFFFFFFFFEBEAE9FF9B9897FFEBEAE9FFEBEAE9FFEBEA
          E9FFEBEAE9FF9B9897FFEBEAE9FFEBEAE9FFA5A3A0FFA19F9DFF9E9B99FF9B98
          96FF979593FF94918FFFEBEAE9FFFFFFFFFFBB871EFF0000001600000016BB87
          1EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFBB871EFFFFFFFFFFE5E5E3FF918F8CFFE5E5E3FFE5E5E3FFE5E5
          E3FFE5E5E3FF918F8CFFE5E5E3FFE5E5E3FFE5E5E3FFE5E5E3FFE5E5E3FFE5E5
          E3FFE5E5E3FFE5E5E3FFE5E5E3FFFFFFFFFFBB871EFF0000001600000016BB87
          1EFFFFFFFFFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFD
          FDFFFFFFFFFFBB871EFFFFFFFFFFE0DFDEFF9D9B98FF9A9795FF979492FF9391
          8EFF908E8BFF8D8A88FFE0DFDEFFE0DFDEFF9D9B98FF9A9795FF979492FF9391
          8EFF908E8BFF8D8A88FFE0DFDEFFFFFFFFFFBB871EFF0000001600000016BB87
          1EFFFFFFFFFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFB
          FBFFFFFFFFFFBB871EFFFFFFFFFFDAD9D7FFDAD9D7FFDAD9D7FFDAD9D7FFDAD9
          D7FFDAD9D7FFDAD9D7FFDAD9D7FFDAD9D7FFDAD9D7FFDAD9D7FFDAD9D7FFDAD9
          D7FFDAD9D7FFDAD9D7FFDAD9D7FFFFFFFFFFBB871EFF0000001600000016BB87
          1EFFFFFFFFFFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8
          F8FFFFFFFFFFBB871EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB871EFF0000001600000016BB87
          1EFFFFFFFFFFF6F5F5FFF6F5F5FFF6F5F5FFF6F5F5FFF6F5F5FFF6F5F5FFF6F5
          F5FFFFFFFFFFBB871EFFBB871EFFBB871EFFBB871EFFBB871EFFBB871EFFBB87
          1EFFBB871EFFBB871EFFBB871EFFBB871EFFBB871EFFBB871EFFBB871EFFBB87
          1EFFBB871EFFBB871EFFBB871EFFBB871EFFBB871EFF0000001600000016BB87
          1EFFFFFFFFFFF3F3F2FFF3F3F2FFF3F3F2FFF3F3F2FFF3F3F2FFF3F3F2FFF3F3
          F2FFFFFFFFFFBB871EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB871EFF0000001600000016BB87
          1EFFFFFFFFFFF0F0EFFFF0F0EFFFF0F0EFFFF0F0EFFFF0F0EFFFF0F0EFFFF0F0
          EFFFFFFFFFFFBB871EFFFFFFFFFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFD
          FDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFD
          FDFFFDFDFDFFFDFDFDFFFDFDFDFFFFFFFFFFBB871EFF0000001600000016BB87
          1EFFFFFFFFFFEEEDEDFFEEEDEDFFEEEDEDFFEEEDEDFFEEEDEDFFEEEDEDFFEEED
          EDFFFFFFFFFFBB871EFFFFFFFFFFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9
          F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9
          F9FFF9F9F9FFF9F9F9FFF9F9F9FFFFFFFFFFBB871EFF0000001600000016BB87
          1EFFFFFFFFFFEBEBEAFFEBEBEAFFEBEBEAFFEBEBEAFFEBEBEAFFEBEBEAFFEBEB
          EAFFFFFFFFFFBB871EFFFFFFFFFFF5F5F4FFF5F5F4FFF5F5F4FFF5F5F4FFF5F5
          F4FFF5F5F4FFF5F5F4FFF5F5F4FFF5F5F4FFF5F5F4FFF5F5F4FFF5F5F4FFF5F5
          F4FFF5F5F4FFF5F5F4FFF5F5F4FFFFFFFFFFBB871EFF0000001600000016BB87
          1EFFFFFFFFFFE9E8E7FFE9E8E7FFE9E8E7FFE9E8E7FFE9E8E7FFE9E8E7FFE9E8
          E7FFFFFFFFFFBB871EFFFFFFFFFFF1F1F0FFF1F1F0FFF1F1F0FFF1F1F0FFF1F1
          F0FFF1F1F0FFF1F1F0FFF1F1F0FFF1F1F0FFF1F1F0FFF1F1F0FFF1F1F0FFF1F1
          F0FFF1F1F0FFF1F1F0FFF1F1F0FFFFFFFFFFBB871EFF0000001600000016BB87
          1EFFFFFFFFFFE6E5E4FFE6E5E4FFE6E5E4FFE6E5E4FFE6E5E4FFE6E5E4FFE6E5
          E4FFFFFFFFFFBB871EFFFFFFFFFFEDEDECFFEDEDECFFEDEDECFFEDEDECFFEDED
          ECFFEDEDECFFEDEDECFFEDEDECFFEDEDECFFEDEDECFFEDEDECFFEDEDECFFEDED
          ECFFEDEDECFFEDEDECFFEDEDECFFFFFFFFFFBB871EFF0000001600000016BB87
          1EFFFFFFFFFFE3E3E1FFE3E3E1FFE3E3E1FFE3E3E1FFE3E3E1FFE3E3E1FFE3E3
          E1FFFFFFFFFFBB871EFFFFFFFFFFEAE9E8FFEAE9E8FFEAE9E8FFEAE9E8FFEAE9
          E8FFEAE9E8FFEAE9E8FFEAE9E8FFEAE9E8FFEAE9E8FFEAE9E8FFEAE9E8FFEAE9
          E8FFEAE9E8FFEAE9E8FFEAE9E8FFFFFFFFFFBB871EFF0000001600000016BB87
          1EFFFFFFFFFFE1E0DFFFE1E0DFFFE1E0DFFFE1E0DFFFE1E0DFFFE1E0DFFFE1E0
          DFFFFFFFFFFFBB871EFFFFFFFFFFE6E5E4FFE6E5E4FFE6E5E4FFE6E5E4FFE6E5
          E4FFE6E5E4FFE6E5E4FFE6E5E4FFE6E5E4FFE6E5E4FFE6E5E4FFE6E5E4FFE6E5
          E4FFE6E5E4FFE6E5E4FFE6E5E4FFFFFFFFFFBB871EFF0000001600000016BB87
          1EFFFFFFFFFFDEDDDCFFDEDDDCFFDEDDDCFFDEDDDCFFDEDDDCFFDEDDDCFFDEDD
          DCFFFFFFFFFFBB871EFFFFFFFFFFE2E1DFFFE2E1DFFFE2E1DFFFE2E1DFFFE2E1
          DFFFE2E1DFFFE2E1DFFFE2E1DFFFE2E1DFFFE2E1DFFFE2E1DFFFE2E1DFFFE2E1
          DFFFE2E1DFFFE2E1DFFFE2E1DFFFFFFFFFFFBB871EFF0000001600000016BB87
          1EFFFFFFFFFFDCDBD9FFDCDBD9FFDCDBD9FFDCDBD9FFDCDBD9FFDCDBD9FFDCDB
          D9FFFFFFFFFFBB871EFFFFFFFFFFDEDDDBFFDEDDDBFFDEDDDBFFDEDDDBFFDEDD
          DBFFDEDDDBFFDEDDDBFFDEDDDBFFDEDDDBFFDEDDDBFFDEDDDBFFDEDDDBFFDEDD
          DBFFDEDDDBFFDEDDDBFFDEDDDBFFFFFFFFFFBB871EFF0000001600000016BB87
          1EFFFFFFFFFFD9D8D6FFD9D8D6FFD9D8D6FFD9D8D6FFD9D8D6FFD9D8D6FFD9D8
          D6FFFFFFFFFFBB871EFFFFFFFFFFDAD9D7FFDAD9D7FFDAD9D7FFDAD9D7FFDAD9
          D7FFDAD9D7FFDAD9D7FFDAD9D7FFDAD9D7FFDAD9D7FFDAD9D7FFDAD9D7FFDAD9
          D7FFDAD9D7FFDAD9D7FFDAD9D7FFFFFFFFFFBB871EFF0000001600000016BB87
          1EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFBB871EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBB871EFF0000001600000016BB87
          1EFFF2D8B0FFE3B160FFE3B160FFE3B160FFE3B160FFE3B160FFE3B160FFE3B1
          60FFE3B160FFD8A54DFFE3B160FFE3B160FFE3B160FFE3B160FFE3B160FFE3B1
          60FFE3B160FFE3B160FFE3B160FFE3B160FFE3B160FFE3B160FFE3B160FFE3B1
          60FFE3B160FFE3B160FFE3B160FFF2D8B0FFBB871EFF0000001600000016BB87
          1EFFEED1A2FFDBA343FFDBA343FFDBA343FFDBA343FFDBA343FFDBA343FFDBA3
          43FFDBA343FFDBA343FFDBA343FFDBA343FFDBA343FFDBA343FFDBA343FFDBA3
          43FFDBA343FFDBA343FFDBA343FFDBA343FFDBA343FFDBA343FFDBA343FFDBA3
          43FFDBA343FFDBA343FFDBA343FFEED1A2FFBB871EFF0000001600000014BB87
          1EFFEACA94FFD49427FFD49427FFD49427FFD49427FFD49427FFD49427FFD494
          27FFD49427FFD49427FFD49427FFD49427FFD49427FFD49427FFD49427FFD494
          27FFD49427FFD49427FFD49427FFD49427FFD49427FFD49427FFD49427FFD494
          27FFD49427FFD49427FFD49427FFEACA94FFBB871EFF000000140000000DBB87
          1EFFE6C385FFE6C385FFE6C385FFE6C385FFE6C385FFE6C385FFE6C385FFE6C3
          85FFE6C385FFE6C385FFE6C385FFE6C385FFE6C385FFE6C385FFE6C385FFE6C3
          85FFE6C385FFE6C385FFE6C385FFE6C385FFE6C385FFE6C385FFE6C385FFE6C3
          85FFE6C385FFE6C385FFE6C385FFE6C385FFBB871EFF0000000D000000034A35
          0CA4BB871EFFBB871EFFBB871EFFBB871EFFBB871EFFBB871EFFBB871EFFBB87
          1EFFBB871EFFBB871EFFBB871EFFBB871EFFBB871EFFBB871EFFBB871EFFBB87
          1EFFBB871EFFBB871EFFBB871EFFBB871EFFBB871EFFBB871EFFBB871EFFBB87
          1EFFBB871EFFBB871EFFBB871EFFBB871EFF4A350CA400000003000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          BE000000424DBE000000000000003E0000002800000020000000200000000100
          010000000000800000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00040000000D0000001500000016000000160000001600000016000000160000
          0016000000160000001600000016000000160000001600000016000000160000
          0016000000160000001600000016000000160000001600000016000000160000
          00160000001600000016000000150000000D0000000400000000000000040000
          00150000002E0000003F00000043000000430000004300000043000000430000
          0043000000430000004300000043000000430000004300000043000000430000
          0043000000430000004300000043000000430000004300000043000000430000
          004300000043000000430000003F0000002E00000015000000040000000D0000
          002E032B56C50650A6FF064FA5FF064FA5FF064FA5FF064FA5FF064FA5FF064F
          A5FF064FA5FF064FA5FF064FA5FF064FA5FF064FA5FF064FA5FF064FA5FF064F
          A5FF064FA5FF064FA5FF064FA5FF064FA5FF064FA5FF064FA5FF064FA5FF064F
          A5FF064FA5FF064FA5FF0650A6FF032B56C50000002E0000000D00000015032B
          55C110A4DDFF11D1FBFF11CFFAFF11CEFAFF11CEFAFF11CEFAFF11CEFAFF11CE
          FAFF11CEFAFF11CEFAFF11CEFAFF11CEFAFF11CEFAFF11CEFAFF11CEFAFF11CE
          FAFF11CEFAFF11CEFAFF11CEFAFF11CEFAFF11CEFAFF11CEFAFF11CEFAFF11CE
          FAFF11CEFAFF11CFFAFF11D1FBFF10A4DDFF032B55C100000015000000160855
          AAFF1BD1FAFF0FC4F4FF0FC2F3FF0FC2F3FF0FC2F3FF0FC2F3FF0FC2F3FF0FC2
          F3FF0FC2F3FF0FC2F3FF0FC2F3FF0FC2F3FF0FC2F3FF0FC2F3FF0FC2F3FF0FC2
          F3FF0FC2F3FF0FC2F3FF0FC2F3FF0FC2F3FF0FC2F3FF0FC2F3FF0FC2F3FF0FC2
          F3FF0FC2F3FF0FC2F3FF0FC4F4FF1BD1FAFF0855AAFF00000016000000160856
          AAFF1FCDF8FF0CC0F2FF0CBFF2FF0BC0F2FF0BC0F2FF0CC0F2FF0CBFF1FF0CBF
          F2FF0BC0F2FF0BC0F2FF0CC0F2FF0CBFF1FF0CBFF2FF0BC0F2FF0BC0F2FF0CC0
          F2FF0CBFF1FF0CBFF2FF0BC0F2FF0BC0F2FF0CC0F2FF0CBFF1FF0CBFF2FF0BC0
          F2FF0BC0F2FF0CC0F2FF0CC0F2FF1FCDF8FF0856AAFF00000016000000160958
          ADFF25CCF5FF06BBF0FF0095CFFF0092CDFF0091CAFF008EC6FF02BAF0FF0095
          CFFF0092CDFF0091CAFF008FC6FF03BBF0FF0095CFFF0092CDFF0091CAFF008E
          C6FF02BAF0FF0095CFFF0092CDFF0091CAFF008FC6FF04BBF0FF0095CFFF0092
          CDFF0091CAFF008EC6FF07BCF0FF25CCF5FF0958ADFF00000016000000160A5B
          AFFF29CAF5FF00B5EDFFEFFFFFFFE8FDFFFFE7FDFFFFEFFFFFFF33C5F0FFECFE
          FFFFE8FDFFFFE8FDFFFFF1FFFFFF00B2EDFFEDFEFFFFE6FDFFFFE7FDFFFFEFFF
          FFFF33C5F0FFECFEFFFFE8FDFFFFE8FDFFFFF1FFFFFF00B2EDFFEEFEFFFFE8FD
          FFFFE8FDFFFFF3FFFFFF00B6EEFF2ACAF5FF0A5BAFFF00000016000000160A5D
          B1FF2EC9F4FF00B2EBFFF2FFFFFF00ACE9FFEFFEFFFF00AEE9FF00AFE9FFF1FF
          FFFF00ACE9FFEFFEFFFF00AFE9FF00AFE9FFF0FFFFFF2ABFEEFFEDFEFFFF00AE
          E9FF00AFE9FFF1FFFFFF00ACE9FFEFFEFFFF00AFE9FF00AFE9FFF2FFFFFF00AC
          E9FFEFFEFFFF00AFE9FF02B3EBFF30C9F4FF0A5DB1FF00000016000000160B5F
          B2FF35C8F3FF02B2EAFF00B0E9FF00B0E9FF00B0E9FF03B1EAFF04B1EAFF00B0
          E9FF00B0E9FF00B0E9FF03B1E9FF04B1E9FF00B0E9FF00AFE9FF00AFE9FF03B1
          E9FF03B1E9FF00B0E9FF00B0E9FF00B0E9FF03B1E9FF04B1E9FF00B0E9FF00B0
          E9FF00B0E9FF03B1EAFF05B3EAFF36C8F3FF0B5FB2FF00000016000000160C62
          B5FF3CC8F3FF04B0E9FF07B0E9FF07B0E9FF06B0EAFF06B1EBFF06B1EBFF06B0
          EBFF07B0EAFF07B0E9FF08B0E9FF08B0E9FF07B0E9FF07B0E9FF07B0E9FF08B0
          E9FF08B0E9FF07B0E9FF07B0E9FF07B0E9FF08B0E9FF08B0E9FF07B0E9FF07B0
          E9FF07B0E9FF07B0E9FF05B0E9FF3CC8F3FF0C62B5FF00000016000000160D64
          B7FF42C7F2FF03ADE7FF06ADE7FF02AAE7FF0090D0FF0086C5FF0084C4FF008F
          CCFF02AAE6FF06ADE7FF08ADE7FF08ADE7FF07ADE7FF06ADE8FF06ADE8FF06AD
          E8FF07ADE7FF08ADE7FF08ADE7FF08ADE7FF08ADE7FF08ADE7FF08ADE7FF08AD
          E7FF08ADE7FF07ADE7FF03ADE7FF42C7F2FF0D64B7FF00000016000000160D66
          B8FF49C7F0FF01A9E6FF01A8E6FF0498D5FFAEE2F4FFEBFFFFFFEBFFFFFFAEE1
          F2FF0495D1FF02A9E7FF06AAE6FF06AAE6FF02AAE7FF0085C3FF00A8E7FF0085
          C3FF02A9E7FF06AAE6FF07AAE6FF07AAE6FF07AAE6FF07AAE6FF07AAE6FF07AA
          E6FF07AAE6FF06AAE6FF02A9E6FF49C7F0FF0D66B8FF00000016000000160E69
          BAFF4EC7F0FF00A5E5FF00A3E4FF8FD0EBFFBAEDFCFF39BBECFF39BBECFFB9ED
          FDFF8ECFE8FF00A4E6FF02A7E7FF02A7E7FF00A4E6FFF5FFFFFF009FE4FFF5FF
          FFFF00A3E5FF04A7E5FF06A7E6FF05A7E7FF04A8E7FF05A8E7FF05A7E6FF05A8
          E7FF04A8E7FF04A7E7FF01A6E6FF4EC7F0FF0E69BAFF00000016000000160E6C
          BDFF55C7F0FF00A3E3FF009FE1FFEDFFFFFF2CB5E8FF009FE1FF009FE1FF2BB5
          E8FFE9FFFFFF007AC3FF007EC3FF007CC2FF0078BFFFE7FFFFFF0071BAFFE8FF
          FFFF0075B9FF00A3E3FF00A4E3FF0080C4FF007DC1FF007BBDFF00A3E4FF0080
          C4FF007DC1FF007BBDFF00A3E3FF54C7F0FF0E6CBDFF00000016000000160F6E
          BFFF5BC7EFFF009FE1FF009BE0FFEDFFFFFF0091D8FF00A0E2FF00A0E2FF0090
          D6FFE5FEFFFFE8FFFFFFEEFFFFFFEFFFFFFFEBFFFFFFE6FFFFFFE6FFFFFFE7FF
          FFFFF4FFFFFF009FE2FF009EE2FFF6FFFFFFEFFFFFFFF2FFFFFF2FB5E9FFF2FF
          FFFFEFFFFFFFF5FFFFFF009DE1FF59C7EFFF0F6EBFFF00000016000000161070
          C0FF61C7EFFF009CE0FF0098DFFFEEFFFFFF289FD6FF0090D7FF0090D5FF289D
          D3FFE9FFFFFF0094DEFF0097DFFF0098DFFF0098DFFF0098DFFF0098E0FF0099
          E1FF009BE1FF009DE3FF009DE2FF32B4E8FF2DB2E8FF2EB3E9FF01A0E2FF2EB3
          E9FF2CB2E9FF31B4E9FF009AE0FF5FC7EFFF1070C0FF00000016000000161073
          C2FF67C8EFFF0099DEFF0096DDFF8ED9F4FFB9E7F6FF359ED2FF359ED1FFB9E6
          F6FF8DD8F4FF0096DDFF009ADEFF009BDFFF009ADFFF009ADFFF0077C1FF0075
          BFFF0074BEFF0073BBFF0072B8FF0098DFFF0076C1FF0074C0FF0074BDFF0072
          BCFF0071B9FF0070B7FF0098DFFF65C7EFFF1073C2FF00000016000000161175
          C5FF6EC9EFFF0096DDFF0096DDFF0099DDFFAEE6F9FFEBFFFFFFEBFFFFFFAEE6
          F9FF0099DDFF0097DDFF0199DEFF0299DEFF0098DEFF0095DDFFFAFFFFFFF2FF
          FFFFF0FFFFFFF2FFFFFFF8FFFFFF0092DCFFF8FFFFFFF1FFFFFFF0FFFFFFF0FF
          FFFFF1FFFFFFF8FFFFFF0093DCFF6DC8EFFF1175C5FF00000016000000151277
          C6FF74CAEFFF0094DBFF0095DBFF0094DBFF0091DAFF008FD9FF008FD9FF0091
          DAFF0094DBFF0096DCFF0096DCFF0096DCFF0096DCFF0094DBFF0091DAFF008F
          D9FF008FD9FF008FD9FF0091DAFF0092DAFF0091DAFF008FD9FF008FD9FF008F
          D9FF008FD9FF0090DAFF0091DAFF73CAEFFF1277C6FF000000150000000D137A
          C8FF79CCEEFF008ED9FF008FD9FF008FD9FF008FD9FF008FD9FF008FD9FF008F
          D9FF008FD9FF0090DAFF0090DAFF0090DAFF0090DAFF008FD9FF008FD9FF008F
          D9FF008ED9FF008FD9FF008FD9FF008FD9FF008FD9FF008FD9FF008ED9FF008E
          D9FF008FD9FF008ED9FF008ED9FF78CBEEFF1379C8FF0000000D000000040A3C
          5FB357AEE1FF84CCEFFF84CCEEFF85CCEFFF85CCEFFF85CCEFFF85CCEFFF85CC
          EFFF85CCEFFF85CCEFFF85CCEFFF85CCEFFF85CCEFFF85CCEFFF85CCEFFF85CC
          EFFF85CCEFFF85CCEFFF85CCEFFF85CCEFFF85CCEFFF85CCEFFF85CCEFFF85CC
          EFFF85CCEFFF84CCEEFF83CCEFFF70BDE6FF0A3B5FB300000004000000000000
          00040A3B5EB0157ECDFF147DCCFF147DCCFF147DCCFF147DCCFF147DCCFF147D
          CCFF147DCCFF147DCCFF147DCCFF147DCCFF147DCCFF147DCCFF147DCCFF147D
          CCFF147DCCFF147DCCFF147DCCFF147DCCFF147DCCFF147DCCFF147DCCFF147D
          CCFF147DCCFF147DCCFF147ECDFF0A3B5EB00000000400000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          BE000000424DBE000000000000003E0000002800000020000000200000000100
          010000000000800000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000050000
          0010000000160000001600000016000000160000001600000016000000160000
          0016000000160000001600000016000000160000001600000016000000160000
          0016000000160000001600000016000000160000001600000016000000100000
          0005000000000000000000000000000000000000000000000000000000100000
          0031000000420000004300000043000000430000004300000043000000430000
          0043000000430000004300000043000000430000004300000043000000430000
          0043000000430000004300000043000000430000004300000042000000310000
          001000000000000000000000000000000000000000000000000000000016A0A0
          9EF3AFAFADFFAEAEABFFADADABFFADADABFFADADABFFADADABFFADADABFFADAD
          ABFFADADABFFADADABFFADADABFFADADABFFADADABFFADADABFFADADABFFADAD
          ABFFADADABFFADADABFFADADABFFADADABFFAEAEABFFAFAFADFFA0A09EF30000
          001600000000000000000000000000000000000000000000000000000016B0B0
          ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0ADFF0000
          001600000000000000000000000000000000000000000000000000000016AEAE
          ABFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFE
          FEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
          FEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFAEAEABFF0000
          001600000000000000000000000000000000000000000000000000000016ADAD
          ABFFFFFFFFFFFDFDFDFFFEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDFFFCFC
          FCFFFDFDFDFFFDFDFDFFFCFCFCFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFD
          FDFFFCFCFCFFFDFDFDFFFDFDFDFFFCFCFCFFFDFDFDFFFFFFFFFFADADABFF0000
          001600000000000000000000000000000000000000000000000000000016ADAD
          ABFFFFFFFFFFFEFDFDFFFFFEFFFFFFFFFFFF007E3EFFFFFFFFFFFFFFFFFFFFFE
          FEFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
          FEFFFEFEFEFFFFFFFFFFFEFEFEFFFCFCFCFFFCFCFCFFFFFFFFFFADADABFF0000
          001600000000000000000000000000000000000000000000000000000016ADAD
          ABFFFFFFFFFFFFFDFFFFFFFFFFFF00803FFFFFFFFFFF00803FFFFFFFFFFFFFFF
          FFFF979596FFC2C2C2FFFFFFFFFF979797FFC3C3C3FFC3C3C3FFC2C2C2FFC1C1
          C1FFFFFFFFFF959595FFC1C1C1FFFCFCFDFFFBFBFBFFFFFFFFFFADADABFF0000
          001600000000000000000000000000000000000000000000000000000016ADAD
          ABFFFFFFFFFFFFFEFFFF007D3CFFFFFFFFFFFFFFFFFFFFFFFFFF00803FFFFFFF
          FFFFFFFFFFFFFEFDFCFFFCFCFBFFFDFEFCFFFEFEFDFFFDFDFCFFFDFDFCFFFCFC
          FBFFFCFCFBFFFDFEFCFFFCFCFBFFFAFBF9FFFAFAF8FFFFFFFFFFADADABFF0000
          001600000000000000000000000000000000000000000000000000000016ADAD
          ABFFFFFFFFFFFEF9FAFFFFFBFDFFFFFAFBFFFCF9F9FFFFFAFCFFFFFFFFFF007E
          3DFFFFFDFFFFFBF9F9FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F7
          F8FFF8F7F7FFF9F8F8FFF9F7F8FFF8F7F7FFF8F7F7FFFFFFFFFFADADABFF0000
          001600000000000000000000000000000000000000000000000000000016ADAD
          ABFFFFFFFFFFF9F7F7FFF9F7F7FFF9F7F7FFF9F7F7FFFAF7F8FFFFF9FBFFFFFC
          FFFFFFFEFFFFFFFCFCFFFBF9F9FFF9F7F7FFF7F6F6FFF7F6F6FFF7F6F6FFF7F6
          F6FFF7F6F6FFF7F6F6FFF7F6F6FFF7F6F6FFF7F6F6FFFFFFFFFFADADABFF0000
          001600000000000000000000000000000000000000000000000000000016ADAD
          ABFFFFFFFFFFF6F5F5FFF8F6F6FFFDF8F9FFFFF9FCFFFDF8F9FFFAF7F8FFFFFC
          FCFF737C82FFB5C5CEFFFFFFFFFFFFFCFAFFFBF8F7FFF8F7F6FFF7F6F6FFF7F6
          F6FFF7F6F6FFF7F6F6FFF7F5F5FFF6F5F5FFF6F5F5FFFFFFFFFFADADABFF0000
          001600000000000000000000000000000000000000000000000000000016ADAD
          ABFFFFFFFFFFF6F5F5FFFCF7F9FFFFFCFFFF008140FFFFFCFFFFFDF8FAFFFEFC
          FCFFBACAD4FF453E3BFF405A70FFAAC5D8FFFFFFFBFFFFFDFAFFFCFAF9FFF9F9
          F8FFF8F8F8FFF7F7F7FFF7F7F7FFF5F5F5FFF4F4F4FFFFFFFFFFADADABFF0000
          001600000000000000000000000000000000000000000000000000000016ADAD
          ABFFFFFFFFFFFAF5F7FFFFFAFFFF008241FFFFFEFFFF008241FFFFFCFFFFFFFC
          FEFFA7A3A2FF476578FF556C79FF5FB4E7FF3272A5FF6C8192FFD2CBC6FFC7C5
          C3FFC2C1C1FFC0C0C0FFBEBEBEFFF5F5F5FFF3F3F3FFFFFFFFFFADADABFF0000
          001600000000000000000000000000000000000000000000000000000016ADAD
          ABFFFFFFFFFFFCF6F7FF00803DFFFFFAFDFFFFF8FAFFFFFAFEFF008241FFFFFC
          FFFFFFFEFCFFAFCADDFF66BDE9FFA4E1FFFF7AC9FAFF3F8ECCFF225D96FFFFFF
          FBFFFEFBF7FFF7F7F5FFF5F5F4FFF3F3F2FFF2F2F1FFFFFFFFFFADADABFF0000
          001600000000000000000000000000000000000000000000000000000016ADAD
          ABFFFFFFFFFFF6F3F3FFFBF4F6FFF8F4F4FFF5F3F2FFFAF4F5FFFFF9FBFF0081
          3EFFFFF8F8FFFFFAF6FF6A9DC2FFEFFDFFFFA9DEFBFF53B4FBFF0B95FFFF255C
          91FFFFFFF6FFFAF7F3FFF3F3F1FFF1F1F0FFF1F1F0FFFFFFFFFFADADABFF0000
          001600000000000000000000000000000000000000000000000000000016ADAD
          ABFFFFFFFFFFF0F0EFFFF2F0F0FFF2F1F0FFF2F1F0FFF3F1F1FFF7F3F3FFFBF4
          F5FFF6F3F2FFF9F5F2FFA3BDD0FF73B7D9FFEBFBFFFF5CBCFFFF1196FFFF0E96
          FFFF255C91FFFFFEF4FFF8F5F1FFF1F1EFFFF0F0EFFFFFFFFFFFADADABFF0000
          001600000000000000000000000000000000000000000000000000000016ADAD
          ABFFFFFFFFFFEFEDEEFFF1EEEFFFF6F0F2FFFAF2F4FFF6F0F2FFF2EFF0FFF1EF
          F0FFF1EFEFFFF4F1F0FFFFF6F1FF156BC3FF76DBFFFFDDF6FFFF61BDFFFF1397
          FFFF0E96FFFF255C91FFFFFCF3FFF7F3F0FFF0EEEEFFFFFFFFFFADADABFF0000
          001600000000000000000000000000000000000000000000000000000016ADAD
          ABFFFFFFFFFFEFEDEDFFF6F0F2FFFFF4F9FF008342FFFFF4F9FFF7F0F2FFF1EF
          F0FFF2F0F1FFF3F1F1FFF7F3F1FFFFF9F2FF1A6EC4FF78DCFFFFDFF6FFFF61BD
          FFFF1397FFFF0E96FFFF255C91FFFFFBF2FFF6F1EFFFFFFFFFFFADADABFF0000
          001600000000000000000000000000000000000000000000000000000016ADAD
          ABFFFFFFFFFFF3EEEEFFFFF3F6FF008443FFFFF7FCFF008443FFFFF4F7FFF8F2
          F2FF9B9A9AFFBFBFBDFFBEBEBCFFF9F4F0FFACA39BFF1B6EC4FF78DBFFFFDEF6
          FFFF61BDFFFF1397FFFF0E96FFFF255C91FFFFF9EFFFFFFFFFFFAFAFACFF0000
          001600000000000000000000000000000000000000000000000000000016ADAD
          ABFFFFFFFFFFF5EEEFFF00813FFFFFF2F5FFFBF0F2FFFFF3F6FF008443FFFFF3
          F7FFF6F1F1FFF1EFEEFFEFEEEDFFF0EEEDFFF6F1EDFFFFF6EDFF196CC2FF77DB
          FFFFDEF6FFFF61BDFFFF1397FFFF0E96FFFF255C91FFFFFFFFFFB6B3AEFF0000
          001600000000000000000000000000000000000000000000000000000016ADAD
          ABFFFFFFFFFFEEEBEBFFF4EDEEFFF1ECEDFFEDEBEBFFF2EDEEFFFDF1F4FF0082
          40FFF5EEEFFFECEBEBFFEAEAE9FFEAEAE9FFECEBEAFFF1EEEAFFFEF4EBFF186C
          C2FF77DAFFFFDEF6FFFF61BDFFFF1297FFFF0F97FFFF2A6195FFC7BCAFFF0000
          002200000006000000000000000000000000000000000000000000000016ADAD
          ABFFFFFFFFFFE9E8E7FFEAE9E9FFEAE9E8FFE9E9E8FFEBEAE9FFEFEBECFFF3ED
          EEFFEEEBEBFFEAE9E8FFE9E9E8FFE9E9E8FFE9E9E8FFEBEAE8FFF0ECE8FFFCF2
          E9FF186BC1FF77DBFFFFDEF6FFFF61BDFFFF1397FFFF1199FFFF336799FF0000
          003D0000001C000000060000000000000000000000000000000000000016ADAE
          ABFFFFFFFFFFE7E5E6FFE8E7E7FFE8E7E7FFE8E7E7FFE8E7E7FFE9E7E8FFEAE7
          E8FFE9E7E8FFE8E7E7FFE8E7E7FFE8E7E7FFE8E7E7FFE8E7E7FFE8E7E6FFF9F5
          F2FFFFFFFFFF1A6EC3FF78DBFFFFDEF6FFFF61BDFFFF1398FFFF159BFFFF3A6C
          9BFF0000003D0000001C0000000600000000000000000000000000000016AEAE
          ABFFFFFFFFFFE6E4E3FFE7E6E5FFE7E6E5FFE7E6E5FFE7E6E5FFE7E6E5FFE7E6
          E5FFE7E6E5FFE7E6E5FFE7E6E5FFE7E6E5FFE7E6E5FFE7E6E5FFE5E4E3FFFFFF
          FFFFD3CFCBFFB9AFA5FF1A6DC3FF77DBFFFFDEF6FFFF61BDFFFF1398FFFF129C
          FFFF316DA6FF0000003D0000001C00000006000000000000000000000016AEAE
          ABFFFFFFFFFFE4E3E2FFE6E5E4FFE6E5E4FFE6E5E4FFE6E5E4FFE6E5E4FFE6E5
          E4FFE6E5E4FFE6E5E4FFE6E5E4FFE6E5E4FFE6E5E4FFE6E5E4FFE4E3E2FFFFFF
          FFFFA8A7A5FFFFFFFFFFFFFFF7FF176BC1FF77DBFFFFDEF6FFFF5EBFFFFF099A
          FFFF8B7D70FF7A7670FF0000003D0000001C000000060000000000000016AEAE
          ABFFFFFFFFFFE3E2E1FFE5E4E3FFE5E4E3FFE5E4E3FFE5E4E3FFE5E4E3FFE5E4
          E3FFE5E4E3FFE5E4E3FFE5E4E3FFE5E4E3FFE5E4E3FFE5E4E3FFE3E2E1FFFFFF
          FFFFA7A7A5FFFAF9F8FFF4EFECFFFFFFFFFF1A6EC4FF78DDFFFFD7F9FFFFAB9E
          93FFA09997FF72706EFF74776BFF0000003D0000001C0000000600000016AEAE
          ABFFFFFFFFFFE2E1E0FFE3E2E1FFE4E3E2FFE4E3E2FFE4E3E2FFE4E3E2FFE4E3
          E2FFE4E3E2FFE4E3E2FFE4E3E2FFE4E3E2FFE4E3E2FFE3E2E1FFE2E1E0FFFFFF
          FFFFA7A7A4FFF0EFEFFFFFFFFFFFEDE9E6FF878077D91F76CCFFBBAEA6FFE9E5
          E2FFC3C2C0FF9B9C98FF7A8071FF9A69CDFF000000370000001100000015AEAE
          ACFFFFFFFFFFE0DFDEFFE1E0DFFFE1E0DFFFE1E0DFFFE1E0DFFFE1E0DFFFE1E0
          DFFFE1E0DFFFE1E0DFFFE1E0DFFFE1E0DFFFE1E0DFFFE1E0DFFFE0DFDEFFFFFF
          FFFFA5A5A3FFFFFFFFFFE7E7E7FF8D8D89E60000000500000006B0A69DFFD9D7
          D3FFE7E8E5FF868A81FFCA8CC9FFC184BAFF986AC8FF000000110000000DAFAF
          ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFE9E9E9FF4C4C4BAD00000003000000000000000000000006A8A6
          A0FF999C92FFDBA2DBFFD099CEFFC88FC2FF9F6FCAFF00000006000000045757
          55B4B0B0ADFFAEAEACFFAEAEABFFAEAEABFFAEAEABFFAEAEABFFAEAEABFFAEAE
          ABFFAEAEABFFAEAEABFFAEAEABFFAEAEABFFAEAEABFFAEAEABFFADAEABFFAEAE
          ABFFAFAFADFF515150B000000004000000000000000000000000000000000000
          0006C186D7FFE6B1E3FFDAA7D6FFAB7ACCFF0000000600000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000006BE8AD1FFB987D0FF000000060000000000000000}
        Mask.Data = {
          BE000000424DBE000000000000003E0000002800000020000000200000000100
          010000000000800000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000001000000060000000F0000001500000016000000160000
          00150000000F0000000600000001000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000030000000E00000020000000340000004000000043000000430000
          004000000034000000200000000E000000030000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0003000000120000002D001C0F69006637D1008A49FF008949FF008949FF008A
          49FF006637D1001C0F690000002D000000120000000300000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000010000
          000E0000002D00522CB4009152FF00B679FF00CD90FF00D194FF00D194FF00CD
          90FF00B679FF009152FF00522CB40000002D0000000E00000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000060000
          002000522CB1009656FF00CB8FFF00CD8FFF00C98AFF00C685FF00C685FF00C9
          8AFF00CD8FFF00CB8FFF009656FF00522CB10000002000000006000000040000
          000D000000150000001600000016000000160000001600000016000000160000
          00160000001600000016000000160000001600000016000000160000001F001C
          0E60009251FF00C98DFF00CA8CFF00C788FF00C380FFFFFFFFFFFFFFFFFF00C3
          80FF00C788FF00CA8CFF00C98DFF009251FF001C0F5D0000000F0000000D0000
          002B0000003F0000004300000043000000430000004300000043000000430000
          0043000000430000004300000043000000430000004300000043000000470062
          2ECC00B372FF00C88AFF00C586FF00C383FF00BE79FFFFFFFFFFFFFFFFFF00BE
          79FF00C383FF00C586FF00C88AFF00B374FF006737CD00000015000000152765
          90C4368FCEFF358ECCFF358ECCFF358ECCFF358ECCFF358ECCFF358ECCFF358E
          CCFF358ECCFF358ECCFF358ECCFF358ECCFF358ECCFF378ECFFF3D8FDCFF0088
          3BFF00C585FF00C383FF00BE7CFF00BC77FF00B86FFFFFFFFFFFFFFFFFFF00B8
          6FFF00BC77FF00BE7CFF00C383FF00C587FF008A4AFF0000001600000016368F
          CEFF85E0FFFF79D9FFFF79D9FFFF79D9FFFF79D9FFFF79D9FFFF79D9FFFF79D9
          FFFF79D9FFFF79D9FFFF79D9FFFF79D9FFFF79D9FFFF7BDAFFFF83DDFFFF0084
          37FF19CC93FF00BD7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF00BD7AFF1BCD96FF008949FF0000001600000016358E
          CDFF88DCFFFF6ED1FEFF6FD0FDFF6FD0FDFF6FD0FDFF6FD0FDFF6FD0FDFF6FD0
          FDFF6FD0FDFF6FD0FDFF6FD0FDFF6FD0FDFF6FD0FDFF71D1FFFF79D5FFFF0082
          35FF37D29FFF00BB76FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF00BB76FF39D3A2FF008947FF0000001600000016348D
          CCFF8EDDFFFF68CBFCFF6ACBFBFF6ACBFBFF6ACBFBFF6ACBFBFF6ACBFBFF6ACB
          FBFF6ACBFBFF6ACBFBFF6ACBFBFF6ACBFBFF6ACBFBFF6CCCFEFF73D0FFFF0082
          32FF6CDAB5FF00BB78FF00B974FF00B771FF00B268FFFFFFFFFFFFFFFFFF00B2
          68FF00B771FF00B974FF00BB78FF6EDCB8FF008944FF0000001600000016338D
          CCFF97DDFFFF63C8F9FF65C8F9FF66C8F9FF66C8F9FF66C8F9FF66C8F9FF66C8
          F9FF66C8F9FF66C8F9FF66C8F9FF66C8F9FF66C8F9FF67C9FBFF6CCBFFFF159A
          76FF5EC498FF29C894FF00BA78FF00B978FF00B46EFFFFFFFFFFFFFFFFFF00B4
          6EFF00B978FF00BA78FF29C894FF60C69BFF0C8C74FF0000001600000016338D
          CDFFA1E0FDFF5EC4F7FF61C5F7FF62C5F7FF62C5F7FF62C5F7FF62C5F7FF62C5
          F7FF62C5F7FF62C5F7FF62C5F7FF62C5F7FF62C5F7FF63C5F8FF66C7FDFF4BB7
          D2FF028F46FF8BE1C1FF1DC48AFF00B774FF00B36DFFFFFFFFFFFFFFFFFF00B3
          6DFF00B774FF1DC48AFF8BE1C2FF039249FF2C90B8FF0000001600000016328D
          CDFFAAE3FEFF58BFF5FF5CC1F5FF5DC1F5FF5DC1F5FF5DC1F5FF5DC1F5FF5DC1
          F5FF5DC1F5FF5DC1F5FF5DC1F5FF5DC1F5FF5DC1F5FF5DC1F5FF5FC2F8FF63C4
          FFFF189C80FF0D9651FF95E2C5FF5CD4AAFF0BBC7EFF00B068FF00B068FF0BBC
          7EFF5CD4AAFF95E2C5FF0A9551FF44B094FF3A91D9FF0000001600000016318D
          CDFFB4E4FEFF53BCF4FF58BEF4FF59BEF4FF59BEF4FF59BEF4FF59BEF4FF59BE
          F4FF59BEF4FF59BEF4FF59BEF4FF59BEF4FF59BEF4FF59BEF4FF59BEF5FF5BBF
          F9FF60C2FFFF1E9E8EFF019045FF5BC293FF93E1C3FF9DE7CCFF9DE7CCFF93E1
          C3FF5BC293FF008F45FF199D8EFFBDE8FFFF348ED1FF0000001600000016308D
          CDFFC1E9FDFF4EB9F2FF54BBF2FF55BBF2FF55BBF2FF55BBF2FF55BBF2FF55BB
          F2FF55BBF2FF55BBF2FF55BBF2FF55BBF2FF55BBF2FF55BBF2FF55BBF2FF55BB
          F3FF57BCF6FF5BBEFDFF3FAFCEFF0E9574FF008432FF008334FF008334FF0084
          32FF0E9574FF3EAECEFF53BCFDFFC4EBFFFF318DCEFF0000001600000016308D
          CDFFCBECFEFF47B4F0FF4EB6F0FF50B7F0FF50B7F0FF50B7F0FF50B7F0FF50B7
          F0FF50B7F0FF50B7F0FF50B7F0FF50B7F0FF50B7F0FF50B7F0FF50B7F0FF50B7
          F0FF50B7F1FF51B8F3FF53B9F6FF55BAFBFF56BAFEFF57BAFFFF57BAFFFF56BA
          FEFF55BAFBFF52B8F6FF48B5F2FFCCECFFFF308DCDFF00000016000000162F8C
          CDFFD9F1FEFF42B0EEFF4AB3EEFF4CB4EEFF4CB4EEFF4CB4EEFF4CB4EEFF4CB4
          EEFF4CB4EEFF4CB4EEFF4CB4EEFF4CB4EEFF4CB4EEFF4CB4EEFF4CB4EEFF4CB4
          EEFF4CB4EEFF4CB4EEFF4CB4EFFF4DB4F0FF4DB5F0FF4EB5F1FF4EB5F1FF4DB5
          F0FF4DB4F0FF4AB4EFFF42B0EEFFD9F1FEFF2F8CCDFF00000016000000162E8C
          CDFFE7F7FFFF3CABEBFF44AEECFF46AFECFF46AFECFF46AFECFF46AFECFF46AF
          ECFF46AFECFF46AFECFF46AFECFF46AFECFF46AFECFF46AFECFF46AFECFF46AF
          ECFF46AFECFF46AFECFF46AFECFF46AFECFF46AFECFF46AFECFF46AFECFF46AF
          ECFF46AFECFF44AEECFF3CABEBFFE7F7FFFF2E8CCDFF00000016000000142F8C
          CDFFF6FDFFFF33A6EAFF3AA9EAFF3BA9EAFF3BA9EAFF3BA8EAFF3BA8EAFF3BA8
          EAFF3BA8EAFF3BA8EAFF3BA8EAFF3BA8EAFF3BA8EAFF3BA8EAFF3BA8EAFF3BA8
          EAFF3BA8EAFF3BA8EAFF3BA8EAFF3BA8EAFF3BA8EAFF3BA8EAFF3BA8EAFF3BA9
          EAFF3BA9EAFF3AA9EAFF33A6EAFFF6FDFFFF2F8CCDFF000000140000000D328F
          CEFFB0E1FBFFAFDEF9FFB0DEF8FFB0DDF7FFAFDCF6FFAFDBF5FFAEDBF5FFAEDA
          F4FFAEDAF4FFAEDAF4FFAEDAF4FFAEDAF4FFAEDAF4FFAEDAF4FFAEDAF4FFAEDA
          F4FFAEDAF4FFAEDAF4FFAEDAF4FFAEDAF4FFAEDAF4FFAEDBF5FFAFDBF5FFAFDC
          F6FFB0DDF7FFB0DEF8FFAFDEF9FFB0E1FBFF328FCEFF0000000D000000042562
          8BB23D91CAFF2A78B4FF3D91C8FF4FA8DBFF64C4F4FF70D6FFFF6FD5FFFF6ED4
          FFFF6DD3FFFF6DD2FFFF6DD2FFFF6DD2FFFF6DD1FFFF6CD1FFFF6CD1FFFF6DD1
          FFFF6DD2FFFF6DD2FFFF6DD2FFFF6DD3FFFF6ED4FFFF6FD5FFFF70D6FFFF64C4
          F4FF4FA8DBFF3D91C8FF2A78B4FF3D91CAFF25628BB200000004000000000000
          0006338FCFFFF6FFFFFF54B7EDFF4DA7DDFF4092CAFF3B88C0FF4293C9FF55AE
          E0FF61C2F4FF68CCFDFF67CBFCFF66CAFBFF66C9FAFF66C8FAFF66C8FAFF66C9
          FAFF66CAFBFF67CBFCFF68CCFDFF61C2F4FF55AEE0FF4293C9FF3B88C0FF4092
          CAFF4DA7DDFF54B7EDFFF6FFFFFF338FCFFF0000000600000000000000000000
          0000000000062F8CCDFFD2EDFBFF59C4F9FF5DC4F9FF60C6F9FF5ABBF0FF4DA7
          DDFF4699D0FF4091C8FF489CD2FF52AFE3FF5FC5F9FF5FC4F8FF5FC4F8FF5FC5
          F9FF52AFE3FF489CD2FF4091C8FF4699D0FF4DA7DDFF5ABBF0FF60C6F9FF5DC4
          F9FF59C4F9FFD2EDFBFF2F8CCDFF000000060000000000000000000000000000
          00000000000000000006308CCDFFB2DCF5FF4EBAF4FF52BBF4FF54BCF4FF55BD
          F5FF55BFF7FF56C0F8FF4BA7DFFF3E8DC5FF3C8DC7FF4196CFFF4196CFFF3C8D
          C7FF3E8DC5FF4BA7DFFF56C0F8FF55BFF7FF55BDF5FF54BCF4FF52BBF4FF4EBA
          F4FFB2DCF5FF308CCDFF00000006000000000000000000000000000000000000
          0000000000000000000000000006338ECDFF91CBEFFF47B2F0FF49B4F0FF4BB5
          F1FF45A2DCFF3D8BC4FF449FDAFF4CB6F3FF4CB5F2FF4CB5F1FF4CB5F1FF4CB5
          F2FF4CB6F3FF449FDAFF3D8BC4FF45A2DCFF4BB5F1FF49B4F0FF47B2F0FF91CB
          EFFF338ECDFF0000000600000000000000000000000000000000000000000000
          000000000000000000000000000000000006368FCEFF6CBAE9FF3E9CD9FF3A8B
          C4FF3D9DD9FF41AFEFFF41AEEEFF41AEEDFF41ADEDFF41ADEDFF41ADEDFF41AD
          EDFF41AEEDFF41AEEEFF41AFEFFF3D9DD9FF3A8BC4FF3E9CD9FF6CBAE9FF368F
          CEFF000000060000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000426628AAE3992D0FF3B93
          D0FF3B93D0FF3A92CFFF3A92CFFF3A92CEFF3A91CEFF3A91CEFF3A91CEFF3A91
          CEFF3A92CEFF3A92CFFF3A92CFFF3B93D0FF3B93D0FF3992D0FF3484BBE90000
          0005000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object ImageListSymbols: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 29622592
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000024040048500701A35F0801C2500701A32404
          0048000000000000000000000000000000000000000000000000000000000000
          000000000000000000002A0801477E1D09C9C64E30F1EEEEEEFFC64D2FF17D1C
          09C92A0801470000000000000000000000000000000000000000000000000000
          000000000000000000006313019FC05335F1CD5634FFBD7B64FFC55230FFB948
          29F16313019F0000000000000000000000000000000000000000000000000000
          00000000000000000000791A01BAD2714FFCBA4E2CFFD2D2D2FFBE8B7AFFBD54
          32FC791A01BA0000000000000000000000000000000000000000000000000000
          000000000000000000006B19029DD47655F0BC5634FFB44E2CFFE6E6E6FFC261
          41F06B19029D0000000000000000000000000000000000000000000000000000
          00000000000000000000310C0145943012C4EBD0C7F5FFFFFFFFEBD0C6F5932F
          10C4310C01450000000000000000000000000000000000000000000000000000
          0000000000000000000000000000320D0145701D029A852202B7701D029A320D
          0145000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000F6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FF0000000000000000000000000000000000000000F6F6
          F6FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FFF6F6F6FF0000000000000000000000000000000000000000F6F6
          F6FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FFF6F6F6FF0000000000000000000000000000000000000000F6F6
          F6FF424242FF424242FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FF4242
          42FF424242FFF6F6F6FFF6F6F6FFF6F6F6FF000000000000000000000000F6F6
          F6FF424242FF424242FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FF4242
          42FF424242FFF6F6F6FF424242FFF6F6F6FF000000000000000000000000F6F6
          F6FF424242FF424242FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FF4242
          42FF424242FFF6F6F6FF424242FFF6F6F6FFF6F6F6FFF6F6F6FF00000000F6F6
          F6FF424242FF424242FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FF4242
          42FF424242FFF6F6F6FF424242FFF6F6F6FF424242FFF6F6F6FF00000000F6F6
          F6FF424242FF424242FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FF4242
          42FF424242FFF6F6F6FF424242FFF6F6F6FF424242FFF6F6F6FF00000000F6F6
          F6FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FFF6F6F6FF424242FFF6F6F6FF424242FFF6F6F6FF00000000F6F6
          F6FF424242FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FFF6F6F6FF424242FFF6F6F6FF424242FFF6F6F6FF00000000F6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FF424242FFF6F6F6FF424242FFF6F6F6FF000000000000
          000000000000F6F6F6FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FFF6F6F6FF424242FFF6F6F6FF000000000000
          000000000000F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF424242FFF6F6F6FF000000000000
          0000000000000000000000000000F6F6F6FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FF424242FF424242FFF6F6F6FF000000000000
          0000000000000000000000000000F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FF0000000000000000000000000000000000000000000000000000
          0000F6F6F6FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FFF6F6F6FF0000000000000000000000000000000000000000000000000000
          0000F6F6F6FF424242FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FF4242
          42FFF6F6F6FF0000000000000000000000000000000000000000000000000000
          0000F6F6F6FF424242FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FF4242
          42FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF0000000000000000000000000000
          0000F6F6F6FF424242FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FF4242
          42FF424242FF424242FF424242FFF6F6F6FF0000000000000000000000000000
          0000F6F6F6FF424242FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FF4242
          42FFF1EFF0FFF1EFF0FF424242FFF6F6F6FF0000000000000000000000000000
          0000F6F6F6FF424242FF424242FF424242FF424242FF424242FF424242FF4242
          42FFF1EFF0FFF1EFF0FF424242FFF6F6F6FF0000000000000000000000000000
          0000F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF424242FFF1EFF0FFF1EFF0FFF1EF
          F0FFF1EFF0FFF1EFF0FF424242FFF6F6F6FF0000000000000000000000000000
          0000000000000000000000000000F6F6F6FF424242FFF1EFF0FFF1EFF0FFF1EF
          F0FFF1EFF0FFF1EFF0FF424242FFF6F6F6FF0000000000000000000000000000
          0000000000000000000000000000F6F6F6FF424242FF424242FF424242FF4242
          42FF424242FF424242FF424242FFF6F6F6FF0000000000000000000000000000
          0000000000000000000000000000F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000F4F4F430F6F6F6EFF6F6F6EFF4F4F4300000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000F4F4
          F430F6F6F6EF868686FF868686FFF6F6F6EFF4F4F43000000000000000000000
          0000000000000000000000000000000000000000000000000000F4F4F430F6F6
          F6EF868686FFCC9966FFCC9966FF868686FFF6F6F6EFF4F4F430000000000000
          00000000000000000000000000000000000000000000F6F6F6FFF6F6F6FFF6F6
          F6FF919191FFCC9966FFCC9966FFCC9966FF868686FFF6F6F6EF000000000000
          00000000000000000000000000000000000000000000F6F6F6FFCC9966FFCC99
          66FFCC9966FFCC9966FFCC9966FFCC9966FF868686FFF6F6F6EF000000000000
          000000000000F4F4F430F4F4F4300000000000000000F6F6F6FFCC9966FFF6F6
          F6FFF6F6F6FFF6F6F6FF868686FF868686FFF6F6F6EFF4F4F430000000000000
          0000F4F4F430F6F6F6EFF6F6F6EFF4F4F43000000000F6F6F6FFCC9966FFF6F6
          F6FFF6F6F6FF868686FF868686FFF6F6F6FFF7F7F7600000000000000000F4F4
          F430F6F6F6EF868686FF868686FFF6F6F6EFF4F4F430F6F6F6FFCC9966FFF6F6
          F6FF868686FFCC9966FFCC9966FF868686FFF6F6F6EFF4F4F430F4F4F430F6F6
          F6EF868686FFCC9966FFCC9966FF868686FFF6F6F6FFF6F6F6FFCC9966FFF6F6
          F6FF919191FFCC9966FFCC9966FFCC9966FF868686FFF6F6F6EFF6F6F6EF8686
          86FFCC9966FFCC9966FFCC9966FFCC9966FFCC9966FFCC9966FFCC9966FFCC99
          66FFCC9966FFCC9966FFCC9966FFCC9966FF868686FFF6F6F6EFF6F6F6EF8686
          86FFCC9966FFCC9966FFCC9966FFCC9966FFCC9966FF868686FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FF868686FF868686FFF6F6F6EFF4F4F430F4F4F430F6F6
          F6EF868686FFCC9966FFCC9966FFCC9966FFCC9966FFCC9966FF868686FFF6F6
          F6FFF4F4F430F4F4F430F6F6F6EFF6F6F6EFF4F4F4300000000000000000F4F4
          F430F6F6F6EF868686FFCC9966FFCC9966FFCC9966FFCC9966FF868686FFF6F6
          F6EFF4F4F43000000000F4F4F430F4F4F4300000000000000000000000000000
          0000F4F4F430F6F6F6EF868686FFCC9966FFCC9966FF868686FFF6F6F6EFF4F4
          F430000000000000000000000000000000000000000000000000000000000000
          000000000000F4F4F430F6F6F6EF868686FF868686FFF6F6F6EFF4F4F4300000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000F4F4F430F6F6F6EFF6F6F6EFF4F4F430000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000F6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF0000000000000000F6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF0000000000000000F6F6F6FF9C53
          00FF9C5300FF9C5300FF9C5300FFF6F6F6FF0000000000000000F6F6F6FF9C53
          00FF9C5300FF9C5300FF9C5300FFF6F6F6FF0000000000000000F6F6F6FF9C53
          00FF9C5300FF9C5300FF9C5300FFF6F6F6FF0000000000000000F6F6F6FF9C53
          00FF9C5300FF9C5300FF9C5300FFF6F6F6FF0000000000000000F6F6F6FF9C53
          00FF9C5300FF9C5300FF9C5300FFF6F6F6FF0000000000000000F6F6F6FF9C53
          00FF9C5300FF9C5300FF9C5300FFF6F6F6FF0000000000000000F6F6F6FF9C53
          00FF9C5300FF9C5300FF9C5300FFF6F6F6FF0000000000000000F6F6F6FF9C53
          00FF9C5300FF9C5300FF9C5300FFF6F6F6FF0000000000000000F6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF0000000000000000F6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF0000000000000000F6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF0000000000000000F6F6F6FF9C53
          00FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FF9C53
          00FF9C5300FF9C5300FF9C5300FFF6F6F6FF0000000000000000F6F6F6FF9C53
          00FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FF9C53
          00FF9C5300FF9C5300FF9C5300FFF6F6F6FF0000000000000000F6F6F6FF9C53
          00FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FF9C53
          00FF9C5300FF9C5300FF9C5300FFF6F6F6FF0000000000000000F6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000F7F7F720F6F6
          F6AFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6AFF7F7F7200000000000000000F7F7
          F740F5F5F580F5F5F580F7F7F7400000000000000000F7F7F720F6F6F6EFC39A
          6CFF9C5300FF9C5300FF9C5300FFC39A6CFFF6F6F6EFF7F7F720F7F7F760EBE2
          D7FFC9A57BFFC9A57BFFEBE2D7FFF7F7F76000000000F6F6F6AFC39A6CFF9C53
          00FF9C5300FF9C5300FF9C5300FF9C5300FFC39A6CFFF6F6F6AFF6F6F6EFA767
          1FFF9C5300FF9C5300FFA7671FFFF6F6F6FFF6F6F6FFF6F6F6FF9C5300FF9C53
          00FFE1D2C3FFF1EFF0FFE1D2C3FF9C5300FF9C5300FFF6F6F6FFF6F6F6FF9C53
          00FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FF9C53
          00FFF1EFF0FFF1EFF0FFF1EFF0FF9C5300FF9C5300FFF6F6F6FFF6F6F6EFA767
          1FFF9C5300FF9C5300FFA7671FFFF6F6F6FFF6F6F6FFF6F6F6FF9C5300FF9C53
          00FFE1D2C3FFF1EFF0FFE1D2C3FF9C5300FF9C5300FFF6F6F6FFF7F7F760EBE2
          D7FFC9A57BFFC9A57BFFEBE2D7FFF7F7F76000000000F6F6F6AFC39A6CFF9C53
          00FF9C5300FF9C5300FF9C5300FF9C5300FFC39A6CFFF6F6F6AF00000000F7F7
          F740F5F5F580F5F5F580F7F7F7400000000000000000F7F7F720F6F6F6EFC39A
          6CFF9C5300FF9C5300FF9C5300FFC39A6CFFF6F6F6EFF7F7F720000000000000
          0000000000000000000000000000000000000000000000000000F7F7F720F6F6
          F6AFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6AFF7F7F72000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000F5F5F580F6F6F6FFF6F6F6FFF5F5F59F00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000EFEFEF10F6F6F6EF368CC9FFA4C9E3FFF5F5F59F000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000F5F5F580A4C9E3FF1A7DC2FFA4C9E3FFF5F5F59F0000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000EFEFEF10F6F6F6EF368CC9FF1A7DC2FFA4C9E3FFF5F5
          F59F000000000000000000000000000000000000000000000000000000000000
          000000000000F6F6F6FFF6F6F6FFF6F6F6FFA4C9E3FF1A7DC2FF1A7DC2FFA4C9
          E3FFF5F5F59F0000000000000000000000000000000000000000000000000000
          000000000000F6F6F6EF368CC9FF1A7DC2FF1A7DC2FF1A7DC2FF1A7DC2FF1A7D
          C2FFA4C9E3FFF5F5F59F00000000000000000000000000000000000000000000
          000000000000F5F5F580A4C9E3FF1A7DC2FF1A7DC2FF1A7DC2FF1A7DC2FF1A7D
          C2FF1A7DC2FFA4C9E3FFF5F5F570000000000000000000000000000000000000
          000000000000EFEFEF10F6F6F6EF368CC9FF1A7DC2FF6DAAD6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF5F5F580000000000000000000000000000000000000
          00000000000000000000F5F5F580A4C9E3FF1A7DC2FF1A7DC2FF6DAAD6FFF6F6
          F6EFF4F4F4300000000000000000000000000000000000000000000000000000
          00000000000000000000EFEFEF10F6F6F6EF368CC9FF1A7DC2FF1A7DC2FF6DAA
          D6FFF6F6F6EFF4F4F43000000000000000000000000000000000000000000000
          0000000000000000000000000000F5F5F580A4C9E3FF1A7DC2FF1A7DC2FF1A7D
          C2FF6DAAD6FFF6F6F6EF00000000000000000000000000000000000000000000
          0000000000000000000000000000EFEFEF10F6F6F6EFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FF00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEE
          EE10EFEEEE10FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F2EEA1ECE8
          DFFFECE8DFFFF3F0EAE0F4F0ED31FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F4F0FFCE6C
          28FFC27B40FFBF8853FFF6F4F1EFF7F6F620FFFFFF00F7F6F620FFFFFF00FFFF
          FF00FFFFFF00EFEEEE10EFEEEE10FFFFFF00FFFFFF00FFFFFF00F3F0EAE0D4C6
          AEFFE3DCCEFFCE6C28FFC29F76FFF5F2EEA1F6F4EFD0ECE8DFFFF6F4F1EFF7F4
          F261F5F2EEA1ECE8DFFFECE8DFFFF6F3EF91FFFFFF00FFFFFF00EFEEEE10F7F4
          F141F3F0EAE0C27B40FFC9702EFFF6F4F0FFF6F4F0FFCE6C28FFC27B40FFECE8
          DFFFE3DCCEFFC9702EFFC9702EFFD4C6AEFFF5F2EE82FFFFFF00FFFFFF00FFFF
          FF00F6F3EF91C0976AFFCE6C28FFD4C6AEFFF6F4F0FFC9B291FFCEBC9FFFC082
          49FFBF8853FFCE6C28FFC5A883FFC5A883FFF6F4F0FFF7F6F620FFFFFF00FFFF
          FF00F5F1ED52CEBC9FFFCE6C28FFC0976AFFF6F4F0B0F5F2EE82F5F2EEA1DBD0
          BDFFCE6C28FFC9702EFFF6F4F1EFF3F0EAE0F5F1ED52FFFFFF00FFFFFF00FFFF
          FF00EFEEEE10ECE8DFFFCE6C28FFC27B40FFF6F4EFD0F7F4F141F7F4F261DBD0
          BDFFCE6C28FFBF8853FFF3F0EAE0F5F2EE82F7F6F620FFFFFF00FFFFFF00FFFF
          FF00F5F2EEA1F6F4F0FFC27B40FFCE6C28FFECE8DFFFECE8DFFFECE8DFFFC097
          6AFFCE6C28FFC57637FFC5A883FFC5A883FFF6F4F1EFFFFFFF00FFFFFF00FFFF
          FF00F7F4F261CEBC9FFFCE6C28FFCE6C28FFCE6C28FFC9B291FFC57637FFCE6C
          28FFC9702EFFECE8DFFFC27B40FFCE6C28FFF6F4F0FFFFFFFF00FFFFFF00FFFF
          FF00F7F6F620F6F4F0FFD4C6AEFFCE6C28FFBF905FFFF6F4F0FFF6F4F0FFF6F4
          F0FFF6F4F0FFF5F3EEC0F6F4F1EFF6F4F0FFF6F4F0B0FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00F5F3EEC0C0976AFFC9702EFFCEBC9FFFC27B40FFF6F4
          F0FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00F7F6F620F6F4F1EFC29F76FFBF8853FFBF8853FFF6F4
          F0FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00EFEEEE10F6F3EF91F5F3EEC0F5F3EEC0F5F1
          ED52FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EEEF
          EE10EEEFEE10FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFF3EBA1E4EB
          D8FFE4EBD8FFEDF1E7E0EFF2EC31FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F2F5EDFF4699
          11FF5C9D27FF6EA33AFFF3F5EEEFF6F6F620FFFFFF00F6F6F620FFFFFF00FFFF
          FF00FFFFFF00EEEFEE10EEEFEE10FFFFFF00FFFFFF00FFFFFF00EDF1E7E0BBCE
          9EFFD6E1C4FF469911FF8CB25FFFEFF3EBA1F1F4EDD0E4EBD8FFF3F5EEEFF3F5
          F161EFF3EBA1E4EBD8FFE4EBD8FFF1F4ED91FFFFFF00FFFFFF00EEEFEE10F3F5
          F141EDF1E7E05C9D27FF4D9A17FFF2F5EDFFF2F5EDFF469911FF5C9D27FFE4EB
          D8FFD6E1C4FF4D9A17FF4D9A17FFBBCE9EFFF0F3EC82FFFFFF00FFFFFF00FFFF
          FF00F1F4ED9181AC52FF469911FFBBCE9EFFF2F5EDFFA3BF7DFFAFC68DFF65A0
          30FF6EA33AFF469911FF96B86DFF96B86DFFF2F5EDFFF6F6F620FFFFFF00FFFF
          FF00EFF2EB52AFC68DFF469911FF81AC52FFF1F4EEB0F0F3EC82EFF3EBA1C8D7
          B0FF469911FF4D9A17FFF3F5EEEFEDF1E7E0EFF2EB52FFFFFF00FFFFFF00FFFF
          FF00EEEFEE10E4EBD8FF469911FF5C9D27FFF1F4EDD0F3F5F141F3F5F161C8D7
          B0FF469911FF6EA33AFFEDF1E7E0F0F3EC82F6F6F620FFFFFF00FFFFFF00FFFF
          FF00EFF3EBA1F2F5EDFF5C9D27FF469911FFE4EBD8FFE4EBD8FFE4EBD8FF81AC
          52FF469911FF559B1FFF96B86DFF96B86DFFF3F5EEEFFFFFFF00FFFFFF00FFFF
          FF00F3F5F161AFC68DFF469911FF469911FF469911FFA3BF7DFF559B1FFF4699
          11FF4D9A17FFE4EBD8FF5C9D27FF469911FFF2F5EDFFFFFFFF00FFFFFF00FFFF
          FF00F6F6F620F2F5EDFFBBCE9EFF469911FF78A846FFF2F5EDFFF2F5EDFFF2F5
          EDFFF2F5EDFFF0F3ECC0F3F5EEEFF2F5EDFFF1F4EEB0FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00F0F3ECC081AC52FF4D9A17FFAFC68DFF5C9D27FFF2F5
          EDFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00F6F6F620F3F5EEEF8CB25FFF6EA33AFF6EA33AFFF2F5
          EDFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00EEEFEE10F1F4ED91F0F3ECC0F0F3ECC0EFF2
          EB52FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000F7F7F720F5F5F5BFF6F6F6FFF5F5F5BFF7F7
          F720000000000000000000000000000000000000000000000000000000000000
          00000000000000000000F5F5F580F0E9EDFFBD85A4FF902D65FFBD85A4FFF0E9
          EDFFF5F5F5800000000000000000000000000000000000000000000000000000
          0000F7F7F740F6F6F6CFD6B7C9FF9D4677FFB47699FF902D65FFB47699FF9D46
          77FFD6B7C9FFF6F6F6CFF7F7F740000000000000000000000000000000000000
          0000F6F6F6FFB06C92FF9C4576FFD9BFCDFFF1EFF0FF902D65FFF1EFF0FFD9BF
          CDFF9C4576FFB06C92FFF6F6F6FF000000000000000000000000000000000000
          0000F6F6F6FF902D65FFF1EFF0FFF1EFF0FFF1EFF0FF902D65FFF1EFF0FFF1EF
          F0FFF1EFF0FF902D65FFF6F6F6FF000000000000000000000000000000000000
          0000F6F6F6FF902D65FFF1EFF0FFF1EFF0FFDFCBD6FF902D65FFDFCBD6FFF1EF
          F0FFF1EFF0FF902D65FFF6F6F6FF000000000000000000000000000000000000
          0000F6F6F6FF902D65FFEBE3E7FFC18EABFFB47699FFE5D7DFFFB47699FFC18E
          ABFFEBE3E7FF902D65FFF6F6F6FF000000000000000000000000000000000000
          0000F6F6F6FF902D65FFA85E88FFD9BFCDFFF1EFF0FFF1EFF0FFF1EFF0FFD9BF
          CDFFA85E88FF902D65FFF6F6F6FF000000000000000000000000000000000000
          0000F6F6F6FFB06C92FF9C4576FFD9BFCDFFF1EFF0FFF1EFF0FFF1EFF0FFD9BF
          CDFF9C4576FFB06C92FFF6F6F6FF000000000000000000000000000000000000
          0000F7F7F740F6F6F6CFD6B7C9FF9D4677FFB47699FFE5D7DFFFB47699FF9D46
          77FFD6B7C9FFF6F6F6CFF7F7F740000000000000000000000000000000000000
          00000000000000000000F5F5F580F0E9EDFFBD85A4FF902D65FFBD85A4FFF0E9
          EDFFF5F5F5800000000000000000000000000000000000000000000000000000
          0000000000000000000000000000F7F7F720F5F5F5BFF6F6F6FFF5F5F5BFF7F7
          F720000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000D191A003A7880005CC0D50054B6D5002B
          62800007121A0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000034280807BBDFFFF93CCFFFF87C6FFFF6FB5
          FFFF002B64800000000000000000000000000000000000000000000000000000
          00000000000000000000000000000D72D5D5ACD8FFFF77C1FFFF6EBCFFFF88C5
          FFFF0057BAD50000000000000000000000000000000000000000000000000000
          00000000000000000000000000001378D5D5BCE1FFFF86CBFFFF75C0FFFF94CC
          FFFF005FC5D50000000000000000000000000000000000000000000000000000
          00000000000000000000000000000E4980808CC6FFFFBDE1FFFFB6DEFFFF7EC0
          FFFF003E7C800000000000000000000000000000000000000000000000000000
          0000000000000000000000000000030F1A1A0E4980801477D5D51076D5D50644
          8080000D1A1A0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000001717171A70707080BABABAD5B9B9B9D56E6E
          6E801616161A0000000000000000000000000000000000000000000000000000
          000000000000000000000000000072727280F0F0F0FFF6F6F6FFF5F5F5FFEFEF
          EFFF6E6E6E800000000000000000000000000000000000000000000000000000
          0000000000000000000000000000BEBEBED5F7F7F7FFF0F0F0FFEFEFEFFFF6F6
          F6FFBABABAD50000000000000000000000000000000000000000000000000000
          0000000000000000000000000000BFBFBFD5F7F7F7FFF2F2F2FFF0F0F0FFF6F6
          F6FFBBBBBBD50000000000000000000000000000000000000000000000000000
          000000000000000000000000000073737380F2F2F2FFF7F7F7FFF7F7F7FFF1F1
          F1FF717171800000000000000000000000000000000000000000000000000000
          00000000000000000000000000001717171A73737380BFBFBFD5BEBEBED57272
          72801717171A0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000E5D8B99BE7DBBFBFE5D8B99B000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000EAE0
          C7DAE4D4AEFFCEB06AFFEADDBEFFEAE0C7DA0000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000F0E7
          D0FF624F22FF624F22FF735C27FFEADDBEFFEAE0C7DA00000000000000000000
          000000000000000000000000000000000000000000000000000000000000F5EF
          E1FF735C27FF624F22FF624F22FF735C27FFEADDBEFFEAE0C7DA000000000000
          000000000000000000000000000000000000000000000000000000000000EAE0
          C7DAD9C28DFF624F22FF624F22FF624F22FF735C27FFEADDBEFFFBF8F1FFFBF8
          F1FFFBF8F1FFEDE3CDE5E1D1AE56000000000000000000000000000000000000
          0000EAE0C7DAD9C28DFF624F22FF624F22FF624F22FF735C27FF624F22FF624F
          22FF624F22FFC39E49FFEFE7D3FDE1D1AE560000000000000000000000000000
          000000000000EAE0C7DAD9C28DFF624F22FF624F22FF624F22FF624F22FF624F
          22FF624F22FF624F22FF957833FFF7F2E8FDDCCDA81E00000000000000000000
          00000000000000000000EDE3CDE5C8A75AFF624F22FF624F22FF624F22FF624F
          22FF624F22FF624F22FF624F22FFDFCB9DFFE5D8B99B00000000000000000000
          00000000000000000000EDE3CDE5B6923EFF624F22FF624F22FF624F22FF735C
          27FFCEB06AFF624F22FF624F22FFCEB06AFFE7DBBFBF00000000000000000000
          00000000000000000000EDE3CDE5B6923EFF624F22FF624F22FF735C27FFEADD
          BEFFFBF8F1FFD9C28DFF624F22FFCEB06AFFE7DBBFBF00000000000000000000
          00000000000000000000E6D9BBAED3B97BFF624F22FF624F22FF735C27FFEADD
          BEFFFBF8F1FFFBF8F1FFD9C28DFFE4D4AEFFE5D8B99B00000000000000000000
          00000000000000000000DCCDA81EEFE7D3FD957833FF624F22FF624F22FF735C
          27FFEADDBEFFFBF8F1FFFBF8F1FFF7F2E8FDDCCDA81E00000000000000000000
          0000000000000000000000000000E5D8B99BF5EFE1FFC39E49FF624F22FF624F
          22FF735C27FFF5EFE1FFFBF8F1FFE3D5B36F0000000000000000000000000000
          000000000000000000000000000000000000E3D5B36FEEE6D2EEFBF8F1FFFBF8
          F1FFFBF8F1FFEEE6D2EEE1D1AE56000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000F4F4F430F6F6F6EFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6EFF4F4
          F430000000000000000000000000000000000000000000000000000000000000
          0000F6F6F6EF6DAAD6FF1A7DC2FF1A7DC2FF1A7DC2FF1A7DC2FF6DAAD6FFF6F6
          F6EF000000000000000000000000000000000000000000000000000000000000
          0000F6F6F6FF1A7DC2FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FF1A7DC2FFF6F6
          F6FF000000000000000000000000000000000000000000000000000000000000
          0000F6F6F6FF1A7DC2FF1A7DC2FF1A7DC2FF1A7DC2FF1A7DC2FF1A7DC2FFF6F6
          F6FF000000000000000000000000000000000000000000000000000000000000
          0000F6F6F6FF1A7DC2FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FF1A7DC2FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6EFF4F4F4300000000000000000000000000000
          0000F6F6F6EF6DAAD6FF1A7DC2FF1A7DC2FF1A7DC2FF1A7DC2FF6DAAD6FFA4C9
          E3FF1A7DC2FF1A7DC2FF6DAAD6FFF6F6F6EF0000000000000000000000000000
          0000F4F4F430F6F6F6EFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF4F3F4FFF1EF
          F0FFF1EFF0FFF1EFF0FF1A7DC2FFF6F6F6FF0000000000000000000000000000
          000000000000000000000000000000000000F6F6F6FF1A7DC2FF1A7DC2FF1A7D
          C2FF1A7DC2FF1A7DC2FF1A7DC2FFF6F6F6FF0000000000000000000000000000
          000000000000000000000000000000000000F6F6F6FF1A7DC2FFF1EFF0FFF1EF
          F0FFF1EFF0FFF1EFF0FF1A7DC2FFF6F6F6FF0000000000000000000000000000
          000000000000000000000000000000000000F6F6F6EF6DAAD6FF1A7DC2FF1A7D
          C2FF1A7DC2FF1A7DC2FF6DAAD6FFF6F6F6EF0000000000000000000000000000
          000000000000000000000000000000000000F4F4F430F6F6F6EFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6EFF4F4F4300000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FF00000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00F6F6F6FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FFF6F6
          F6FF00000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00F6F6F6FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FFF6F6
          F6FF00000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00F6F6F6FF9C5300FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FF9C5300FFF6F6
          F6FF00000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00F6F6F6FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6EFF6F6F630FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00F6F6F6FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FFF6F6
          F6FF9C5300FF9C5300FFBE905CFFF6F6F6EFFFFFFF00FFFFFF00FFFFFF00FFFF
          FF00F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF1EFF0FFF1EFF0FF9C5300FFF6F6F6FFFFFFFF00FFFFFF00FFFFFF00FFFF
          FF0000000000000000000000000000000000F6F6F6FF9C5300FF9C5300FF9C53
          00FF9C5300FF9C5300FF9C5300FFF6F6F6FFFFFFFF00FFFFFF00FFFFFF00FFFF
          FF0000000000000000000000000000000000F6F6F6FF9C5300FFF1EFF0FFF1EF
          F0FFF1EFF0FFF1EFF0FF9C5300FFF6F6F6FFFFFFFF00FFFFFF00FFFFFF00FFFF
          FF0000000000000000000000000000000000F6F6F6EFBE905CFF9C5300FF9C53
          00FF9C5300FF9C5300FFBE905CFFF6F6F6EFFFFFFF00FFFFFF00FFFFFF00FFFF
          FF0000000000000000000000000000000000F6F6F630F6F6F6EFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6EFF6F6F630FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000033000000330000000A00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000338A8A8AFF8A8A8AFF1D1D1D5C00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000033858585FFFFFFFFFFFFFFFFFF868686FF00000033000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0033868686FFFFFFFFFFFBFEFCFFFDFFFDFFFFFFFFFF868786FF000000330000
          0000000000000000000000000000000000000000000000000000000000338787
          87FFFDFEFCFFF6FBF6FFF7FFF7FF9D288BFFFBFFFBFFFFFFFFFF878787FF0000
          00330000000000000000000000000000000000000000000000008B8B8BFFFBFA
          FAFFF3F4F2FFF2FCF3FF9F2F8DFFE391DCFFA0308EFFF6FFF7FFFAFDFAFF8788
          87FF0000003300000000000000000000000000000000000000008B8B8CFFF6F6
          F4FFEFF3EDFF9F2A8DFFDE9DDAFFD78DD2FFD78DD3FFA1318FFFF2FCF1FFF6F8
          F4FF888988FF00000033000000000000000000000000000000001D1D1D338788
          87FFF5F7F5FFEBF4EBFFA2318FFFD9A4D7FFCB85C8FFCD85C9FFA23190FFECF5
          ECFFF0F1EFFF888988FF00000033000000000000000000000000000000000000
          0000878888FFF5F7F4FFE7F0E7FFA23190FFD6AAD6FFC07EC0FFD7A9D6FFA22C
          8FFFE5E9E5FFEAE9E9FF888888FF000000330000000000000000000000000000
          000000000000888988FFF4F6F3FFE2EBE1FFA43191FFD4B1D7FFA43191FFE0E9
          DFFFDEE0DCFFDFDFDDFFE5E4E2FF868686FF0000003300000000000000000000
          00000000000000000000888988FFF4F7F2FFDDE4DBFFA32D90FFDCE3DBFFDADC
          D8FFDBDAD9FFDCDADAFFDDDADAFFEFEEEEFFACACACFF00000000000000000000
          0000000000000000000000000000888988FFF4F6F4FFD6D9D3FFD5D5D2FFD7D6
          D3FFA5A4A4FF848585FFA5A3A4FFEEEDEDFFAAAAAAFF00000000000000000000
          000000000000000000000000000000000000888988FFF5F5F4FFCFCFCDFFD2D1
          D0FF858586FF05050538848484FFF0EFEEFFAAAAAAFF00000000000000000000
          00000000000000000000000000000000000000000000888888FFF3F2F2FFCCCA
          C9FF9F9E9FFF848485FF9E9D9DFFF0EFEFFFAAAAAAFF00000000000000000000
          0000000000000000000000000000000000000000000000000000888888FFF6F4
          F3FFF4F3F2FFF4F3F2FFF3F2F0FFF3F2F1FFABABABFF00000000000000000000
          000000000000000000000000000000000000000000000000000000000000AEAE
          AEFFABABABFFAAAAAAFFAAAAAAFFABABABFF0000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000F6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF000000000000
          0000000000000000000000000000000000000000000000000000F6F6F6FF9C53
          00FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FFF6F6F6FF000000000000
          0000000000000000000000000000000000000000000000000000F6F6F6FF9C53
          00FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FFF6F6F6FF000000000000
          0000000000000000000000000000000000000000000000000000F6F6F6FF9C53
          00FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FFF6F6F6FF000000000000
          0000000000000000000000000000000000000000000000000000F6F6F6FF9C53
          00FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FF00000000000000000000000000000000F6F6F6FF9C53
          00FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FFF6F6F6FF9C5300FF9C53
          00FF9C5300FFF6F6F6FF00000000000000000000000000000000F6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FF9C5300FF9C53
          00FF9C5300FFF6F6F6FF00000000000000000000000000000000000000000000
          00000000000000000000F6F6F6FF9C5300FF9C5300FF9C5300FF9C5300FF9C53
          00FF9C5300FFF6F6F6FF00000000000000000000000000000000000000000000
          00000000000000000000F6F6F6FF9C5300FF9C5300FF9C5300FF9C5300FF9C53
          00FF9C5300FFF6F6F6FF00000000000000000000000000000000000000000000
          00000000000000000000F6F6F6FF9C5300FF9C5300FF9C5300FF9C5300FF9C53
          00FF9C5300FFF6F6F6FF00000000000000000000000000000000000000000000
          00000000000000000000F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FF00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000F4F4F430F6F6F6EFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6EFF4F4F4300000000000000000000000000000
          0000F6F6F6EF868686FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FF424242FF868686FFF6F6F6EF0000000000000000000000000000
          0000F6F6F6FF424242FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EF
          F0FFF1EFF0FFF1EFF0FF424242FFF6F6F6FF0000000000000000000000000000
          0000F6F6F6FF424242FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EF
          F0FFF1EFF0FFF1EFF0FF424242FFF6F6F6FF0000000000000000000000000000
          0000F6F6F6FF424242FFF1EFF0FFF1EFF0FF9C5300FF9C5300FF9C5300FF9C53
          00FFF1EFF0FFF1EFF0FF424242FFF6F6F6FF0000000000000000000000000000
          0000F6F6F6FF424242FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EF
          F0FFF1EFF0FFF1EFF0FF424242FFF6F6F6FF0000000000000000000000000000
          0000F6F6F6FF424242FFF1EFF0FFF1EFF0FF9C5300FF9C5300FF9C5300FF9C53
          00FFF1EFF0FFF1EFF0FF424242FFF6F6F6FF0000000000000000000000000000
          0000F6F6F6FF424242FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EF
          F0FFF1EFF0FFF1EFF0FF424242FFF6F6F6FF0000000000000000000000000000
          0000F6F6F6FF424242FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EFF0FFF1EF
          F0FFF1EFF0FFF1EFF0FF424242FFF6F6F6FF0000000000000000000000000000
          0000F6F6F6EF868686FF424242FF424242FF424242FF424242FF424242FF4242
          42FF424242FF424242FF868686FFF6F6F6EF0000000000000000000000000000
          0000F4F4F430F6F6F6EFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6EFF4F4F4300000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000002A2A2A46717171BE737373C42D2D
          2D4D000000000000000000000000000000000000000000000000000000000000
          000000000000000000001A1A1A2B646464A5999999FECDCDCDFFBDBDBDFFA1A1
          A1FF656565AC1C1C1C3100000000000000000000000000000000000000000000
          00000E0E0E1652525285939393EFC5C5C5FFEBEBEBFFE8E8E8FFCCCCCCFFCDCD
          CDFFB3B3B3FF8E8E8EF35252528D1010101B0000000000000000040404064040
          40658A8A8ADBC1C1C1FFE8E8E8FFEBEBEBFFDEDEDEFFD6D6D6FFBBBBBBFFBBBB
          BBFFCBCBCBFFC7C7C7FFABABABFF828282E03F3F3F6D0606060A797979BBBEBE
          BEFFE3E3E3FFF1F1F1FFE7E7E7FFDDDDDDFFDADADAFFD6D6D6FFBEBEBEFFC1C1
          C1FFC1C1C1FFBBBBBBFFCBCBCBFFC0C0C0FFA6A6A6FF707070C1A2A2A2F9F5F5
          F5FFF2F2F2FFE7E7E7FFE4E4E4FFDFDFDFFFDBDBDBFFD6D6D6FFC0C0C0FFC2C2
          C2FFC2C2C2FFC2C2C2FFBDBDBDFFBEBEBEFFC9C9C9FF919191F89F9F9FF0F3F3
          F3FFF0F0F0FFECECECFFEAEAEAFFE4E4E4FFDADADAFFD8D8D8FFC4C4C4FFBBBB
          BBFFBEBEBEFFC2C2C2FFC3C3C3FFC0C0C0FFCBCBCBFF8F8F8FF0A0A0A0F0F3F3
          F3FFF1F1F1FFEEEEEEFFE1E1E1FFC7C7C7FFCBCBCBFFD1D1D1FFD1D1D1FFCCCC
          CCFFB1B1B1FFBBBBBBFFC0C0C0FFC0C0C0FFCECECEFF909090F0A1A1A1F0F3F3
          F3FFE9E9E9FFDDDDDDFFDEDEDEFFC2C2C2FFDADADAFFFDFDFDFFFDFDFDFFDADA
          DAFFC3C3C3FFD7D7D7FFBBBBBBFFBBBBBBFFCFCFCFFF919191F0A9A9A9FBD8D8
          D8FFCDCDCDFFCECECEFFD1D1D1FFACACACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFACACACFFD1D1D1FFCCCCCCFFC1C1C1FFBEBEBEFF999999FB6C6C6C9FAEAE
          AEFFD5D5D5FFFDFDFDFFFDFDFDFFC7C7C7FFB5B5B5FFA3A3A3FFA3A3A3FFB5B5
          B5FFC7C7C7FFFCFCFCFFFBFBFBFFD2D2D2FFAEAEAEFF666666A600000000A4A4
          A4F8FFFFFFFFFFFFFFFFFFFFFFFFE0E0E0FFACACACFFD1D1D1FFD1D1D1FFABAB
          ABFFE0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFA4A4A4F800000000000000006666
          66869D9D9DDFA1A1A1FDA2A2A2FFB1B1B1FFD6D6D6FFFDFDFDFFFCFCFCFFD3D3
          D3FFB1B1B1FFA2A2A2FFA1A1A1FD9D9D9DDF6666668600000000000000000000
          000000000000000000000F0F0F16A6A6A6FAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFA6A6A6FA1111111A00000000000000000000000000000000000000000000
          000000000000000000000000000066666686A0A0A0E4A1A1A1FEA1A1A1FEA0A0
          A0E4666666860000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000001E000000310000003300000033000000330000
          00310000001E0000000000000000000000000000000000000000000000000000
          00000000000E00000033004A73AA0079BDF9007DC4FF007DC4FF007DC4FF0079
          BDF9004A73AA000000330000000E000000000000000000000000000000000000
          00120023366B007CC4FF0692D8FF0AA2E7FF0AA7ECFF0AA7ECFF0AA7ECFF0AA2
          E7FF0692D8FF007CC4FF0023366B0000000E000000000000000000000000002D
          467C007FC6FF15A5E6FF0FABECFF03A6ECFF00A6EEFF00A6EFFF00A6EEFF03A6
          ECFF0FABECFF15A5E6FF007FC6FF0023366B00000000000000000000001E007B
          C3FF21AAE7FF12ADEDFF00A9ECFF0062A1FF004382FF004583FF004382FF0062
          A1FF00A9ECFF12ADEDFF21AAE7FF007BC3FF0000001E00000000004A75A91A9D
          DDFF24B9F3FF00AEEEFF00AFF0FF00B2F2FF00B4F4FF00B5F5FF00B4F4FF00B2
          F2FF00AFF0FF00AEEEFF24B9F3FF1A9DDDFF004A75A900000000007ECBF93AC5
          FDFF03C1FFFF00BFFFFF00BFFFFF00C0FFFF00C1FFFF00C1FFFF00C1FFFF00C0
          FFFF00BFFFFF00BFFFFF03C1FFFF3AC5FDFF007ECBF9000000003D2F28FF9283
          7CFF311F1BFF2F1C18FF2B1713FF2B1713FF301C19FF34201CFF301D19FF2B17
          13FF2B1713FF2F1C18FF301F1BFF92837CFF3D2F28FF00000000373534FF8A88
          87FF2F2B2CFF898382FFFFFFFFFFFFFFFFFF888584FF2D2929FF898382FFFFFF
          FFFFFFFFFFFF888584FF2F2B2BFF8A8887FF373534FF00000000363636FF8888
          88FF323031FFE1DBD2FF626779FF62687AFFF2EFEAFF2B2A2CFFE1DBD2FF6367
          79FF62687AFFF3EFEAFF353435FF878787FF363636FF00000000363636FF8686
          86FF545353FFE0D5C3FFD5CCC3FF7C7D86FFFFFFFFFF353437FFE1D6C4FFD5CC
          C3FF7C7C86FFFFFFFFFF525151FF868686FF363636FF00000000363636FF8686
          86FF7A7A7AFF444243FF464444FF474545FF474546FF494748FF474646FF4645
          45FF464444FF434142FF79797AFF868686FF363636FF00000000373737FF8989
          89FF717171FF747373FF555251FF555352FF565453FF565453FF565453FF5553
          52FF555351FF747373FF717171FF898989FF373737FF000000003C3B3BFF5D5D
          5DFF201F1EFF6F6F6FFF7F7D7DFF686665FF5E5B59FF5E5A59FF5E5B59FF6866
          65FF7F7D7DFF6F6F6FFF201F1EFF5D5D5DFF3C3B3BFF00000000232323FF2221
          21FF0A13175F1F1D1DFF474645FF777676FF8A8B8BFF8A8A8AFF8A8B8BFF7776
          76FF474645FF1F1D1DFF0A13175F222121FF232323FF00000000252424FB0000
          00000000000000000000111B21951F1E1DF71E1E1EFF1D1D1EFF1E1E1EFF1F1E
          1DF7111B2195000000000000000000000000252424FB00000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000006000000320000003300000033000000330000
          0032000000060000000000000000000000000000000000000000000000000000
          00070000003300000031110B0E3B94617CFD93607BFF93607BFF93607BFF9462
          7CFD110C0E3B000000330000003300000003000000000000000000000000140D
          114A95637DFE8F5E78F6644154BCC290A2FFE3B4BDFFE1B2BCFFE3B4BDFFB786
          99FF644254BC96637DFF95637DFE080506390000000000000000000000168457
          6FE9C295A3FFC798A7FF905E79FFB78398FFDCA4B4FFD9A2B2FFDCA4B4FFB783
          98FF915E79FFC694A5FFC393A3FF855770EA0000001600000000402B368AA775
          8BFFE2B6BEFFDEADB8FFB68197FFA8718BFFDD9AB1FFDB98AFFFDC9AB1FFA871
          8BFFB17C93FFDEA9B7FFE1B3BBFFA5758BFF402B368A00000000905E78F9D9AD
          B5FFDBA9B6FFD8A1B1FFDC9CB0FF91576FFF9F5C6BFF8C647EFFA15D6EFF935B
          72FFD796ABFFD79EB0FFDAA7B5FFD8AAB4FF905E78F900000000935F7BFFF0D0
          D6FFE1B5C2FFD89FB1FFE096ACFF646C92FF008CE0FF009DEEFF008CE1FF6E69
          8AFFE095ACFFD99EB2FFE0B4C1FFF0CFD5FF935F7BFF00000000865771E6B58A
          9EFFDBB6C4FFECC4D2FFF9BECAFF008BE0FF00D3FFFF00D6FFFF00D3FFFF008B
          E0FFFABECBFFEDC4D1FFDCB6C4FFB5899CFF865870E5000000000000002E774D
          64D9905C77FF905A75FF9D576EFF0198E8FF20CDFCFF00BCF6FF20CDFCFF0298
          E8FF845C7CFF905974FF8F5C77FF84566EE90000002E00000000875971EBAC72
          8EFFBE839BFFCB91A4FFD896A2FF008EE1FF83DBFDFF91DFFDFF83DBFCFF018E
          E1FFDA9AA2FFCC94A6FFC389A0FFAD738DFF875971EA0000000094617BFFE4AD
          C3FFD38FAAFFD697ADFFE5A8B5FF96A9CCFF0088DDFF0C97E7FF0088DDFF8EA3
          C5FFE8B1BAFFD89CAFFFD594ACFFE5B1C5FF94617BFF00000000905F78F9DEB5
          C7FFD28DA9FFD290A9FFF1CED7FFA47086FFDB98A4FFEBA9B0FFE09FA9FFA46F
          86FFEFD0D7FFD698ADFFD493ACFFE4BECFFF905E78F900000000412B366EA979
          91FFEBC3D3FFE7BDCEFFC7A1B3FFA56D86FFDA9CAFFFD89AAEFFDA9CAFFFA56D
          86FFC19CABFFEDCBD8FFEBC3D2FFA87A91FF412A366E00000000000000008556
          6EE5CBA2B5FFD0ABBDFF8F5B76FFBA869DFFD798AFFFD08BA5FFD798AFFFBA86
          9DFF8F5A76FFD1AEBEFFD2ACBDFF83566EE50000000000000000000000000805
          070E895972EA8F5D76F5644153AEBF97ACFFF8DFEAFFF6DCE8FFF8DFEAFFBF97
          ACFF644153AE81556CDF95617CFF140D11220000000000000000000000000000
          00000000000000000000110B0E1D93607BFC925E79FF915D78FF925E79FF9360
          7BFC110B0E1D0000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000AF56
          00FFB05A03FFB15B05FFB25D07FFB15B05FFB15B05FFB25D07FFB15B05FFB15B
          05FFB25D08FFB15B05FFB15B05FFAF5600FF000000000000000000000000B15B
          06FFEACFADFFEACEACFFCDA371FFEACDABFFEACDABFFCDA371FFEACDABFFEACD
          ABFFCEA473FFEACDABFFEBD1AFFFB25C06FF000000000000000000000000B15B
          06FFEACFADFFEACEACFFCDA372FFEACEABFFEACEABFFCDA372FFEACEABFFEACE
          ABFFCEA473FFEACEABFFEBD1B0FFB25C06FF000000000000000000000000AF57
          00FFB05B06FFB15C08FFB25E09FFB15C08FFB15C08FFB25E09FFB15C08FFB15C
          08FFB35E0AFFB15C08FFB25C08FFAF5700FF0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000001A0000003300000033000000330000003300000018000000180000
          00330000003300000033000000330000001A0000000000000000000000000000
          002E5555559CA4A4A4FFA3A3A3FFA3A4A4FFA4A6A8FF4F5153954F515395A4A6
          A8FFA3A4A4FFA3A3A3FFA4A4A4FF5555559C0000002E000000000000001A9797
          97EDBAB9B9FFE5E4E3FFEEEDECFFEEEFEFFFE2E2E1FFB07C47FFB07C47FFE2E2
          E1FFEEEFEFFFEEEDECFFE5E4E3FFBAB9B9FF979797ED0000001A5556569CB8B8
          B7FFE8E7E4FFE4E3E1FFE3E2E0FFE4E6E7FFCBAC8EFFDBB489FFDBB489FFCBAC
          8EFFE4E6E7FFE3E2E0FFE4E3E1FFE8E7E4FFB8B8B7FF5556569CA5A5A5FFDAD9
          D8FFDFDCDBFFDCDAD9FFDCDBDBFFDEE0E4FFB17638FFFAE3C9FFFAE3C9FFB176
          38FFDEE0E4FFDCDBDBFFDCDAD9FFDFDCDBFFDAD9D8FFA5A5A5FFA4A4A4FFDEDD
          DCFFD6D5D4FFD6D5D4FFD6D6D6FFD8DBE0FFB4783AFFFAE3C7FFFAE6CBFFAF6F
          2FFFD8DCE0FFD6D7D6FFD6D5D4FFD6D5D4FFDEDDDCFFA4A4A4FFA4A4A4FFE6E5
          E4FFD1CFCDFFD2CFCDFFD2D1D0FFD4D6D9FFB4793BFFF7E3C7FFF7E3C7FFAF70
          2FFFD4D6D9FFD2D1D0FFD2CFCDFFD1CFCDFFE6E5E4FFA4A4A4FFA4A4A4FFE9E8
          E8FFD2D1CFFFCAC9C7FFCBCBC9FFCCCFD1FFB17538FFF8EAD6FFF8EAD6FFB175
          38FFCCCFD1FFCBCBC9FFCAC9C7FFD2D1CFFFE9E8E8FFA4A4A4FF55555583BCBC
          BBFFEFEEEDFFDAD8D7FFCFCDCDFFD0D1D3FFC6A788FFD8B38AFFD8B38AFFC6A7
          88FFD0D1D3FFCFCDCDFFDAD8D7FFEFEEEDFFBCBCBBFF55555583000000009595
          95E7BABBBBFFE6E5E5FFEFEEEDFFF0F0F1FFE3E2E2FFB17C47FFB17C47FFE3E2
          E2FFF0F0F1FFEFEEEDFFE6E5E5FFBABBBBFF969696E800000000000000000000
          000055555582A4A4A4FFA3A3A4FFA3A4A4FFA4A6A8FF4F51537A4F51537AA4A6
          A8FFA3A4A4FFA3A3A4FFA4A4A4FF555555830000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FF000000000000000000000000000000000000
          0000F6F6F6FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FF9C53
          00FF9C5300FF9C5300FFF6F6F6FF000000000000000000000000000000000000
          0000F6F6F6FF9C5300FFF1EFF0FFF1EFF0FFF1EFF0FF9C5300FFF1EFF0FF9C53
          00FF9C5300FF9C5300FFF6F6F6FF000000000000000000000000000000000000
          0000F6F6F6FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FFF1EF
          F0FF9C5300FF9C5300FFF6F6F6FF000000000000000000000000000000000000
          0000F6F6F6FF9C5300FFF1EFF0FFF1EFF0FFF1EFF0FF9C5300FF9C5300FF9C53
          00FFF1EFF0FF9C5300FFF6F6F6FF000000000000000000000000000000000000
          0000F6F6F6FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FF9C53
          00FF9C5300FF9C5300FFF6F6F6FF000000000000000000000000000000000000
          0000F6F6F6FF9C5300FF9C5300FFF1EFF0FF9C5300FF9C5300FF9C5300FF9C53
          00FF9C5300FF9C5300FFF6F6F6FF000000000000000000000000000000000000
          0000F6F6F6FF9C5300FFF1EFF0FFF1EFF0FFF1EFF0FF9C5300FFF1EFF0FFF1EF
          F0FFF1EFF0FF9C5300FFF6F6F6FF000000000000000000000000000000000000
          0000F6F6F6FF9C5300FF9C5300FFF1EFF0FF9C5300FF9C5300FF9C5300FF9C53
          00FF9C5300FF9C5300FFF6F6F6FF000000000000000000000000000000000000
          0000F6F6F6FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FF9C5300FF9C53
          00FF9C5300FF9C5300FFF6F6F6FF000000000000000000000000000000000000
          0000F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FF000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000186A3688186A36F2186A36FF186A36F2186A368800000000000000000000
          000000000000000000000000000000000000000000000000000000000000186A
          3684278B52FF63B98CFF94D2B1FF63B98CFF278B52FF186A368C000000000000
          0000000000000000000000000000000000000000000000000000000000001A6B
          38F761B98AFF5FB986FFFFFFFFFF5FB886FF66BB8EFF186A36F7000000000000
          000000000000000000000000000000000000000000000000000000000000307A
          4BFF9BD4B5FFFFFFFFFFFFFFFFFFFFFFFFFF94D2B1FF186A36FF000000000000
          0000000000000000000000000000000000000000000000000000000000004386
          5CF78FD3B0FF91D6B0FFFFFFFFFF64BB8BFF66BB8EFF186A36F7000000000000
          000000000000000000000000000000000000000000000000000000000000508E
          678060AA80FF94D4B3FFB9E6D0FF69BA8EFF2C8E56FF186A368C000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000058936E7C57936DF24E8D65FF3F8358F22D77487C00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000A456
          15CAAE5A13FFAD5912FFAE5A13FFA45615CA0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000AE5B15FFCD8E
          4CFFE6B676FFE4B271FFE6B676FFCD8E4CFFAE5B15FF00000000000000000000
          00000000000000000000000000000000000000000000A55716CACB8846FFDEAA
          68FFDAA25BFFFFFFFFFFDAA25BFFDEAA68FFCB8846FFA55716CA000000000000
          00000000000000000000000000000000000000000000AF5B15FFDBA360FFD69C
          58FFD3944CFFFFFFFFFFD3944CFFD69C58FFDBA360FFAF5B15FF000000000000
          00000000000000000000000000000000000000000000AE5A13FFDEAD76FFD191
          49FFCF8C41FFFFFFFFFFCF8C41FFD19149FFDEAD76FFAE5A13FF000000000000
          00000000000000000000000000000000000000000000AE5A12FFEACEABFFCB87
          3AFFCA8436FFC88130FFCA8436FFCB873AFFEACEABFFAE5A12FF000000000000
          00000000000000000000000000000000000000000000AE5C14BED2A070FFE1B9
          8CFFC88336FFFFFFFFFFC88336FFE1B98CFFD2A070FFAE5C14BE000000000000
          00000000000000000000000000000000000000000000B15F180DAE5911FFCF9C
          6BFFEACEAFFFE8CAA8FFEACEAFFFCF9C6BFFAE5911FFB15F180D000000000000
          0000000000000000000000000000000000000000000000000000B15F180DAF5B
          12BCAD550AFFAA4E00FFAD550AFFAF5B12BCB15F180D00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000000000000003189C4EC2F86C3F62E84C2F62C82C1F62A80
          C0F6287EBFF6277CBEF6257ABDF62478BCF62276BCF62175BBC3000000000000
          00000000000000000000000000003790C9E4DDECF6FFBCEEF9FFABEAF8FFAAEA
          F8FFAAEAF8FFAAEAF8FFACEAF8FFD4F3FBFFA3C8E4FF257ABDAB000000000000
          00000000000000000000000000003E98CD6B8DC1E1FF96E8F9FF60DCF6FF5ADB
          F5FF3187C1FF5ADBF5FF69DEF6FFB0E7F6FF2C82C1E92A80C02A000000000000
          0000000000000000000000000000449FD006429DCFCCAADBEFFF73E0F7FF57DA
          F5FF57DAF5FF5CDBF5FF8FE6F8FF91C0E1FF3189C47E00000000000000000000
          00000000000000000000000000000000000048A5D3487ABCDFFFA1EAF9FF60DC
          F6FF3086C1FF76E1F7FFB5DEF0FF3993CAD63790C90D00000000000000000000
          0000000000000000000000000000000000004EACD6024CA9D5A3ABD9ECFF81E3
          F8FF3287C1FFABEDFAFF429DCFFE409ACE530000000000000000000000000000
          0000000000000000000000000000000000000000000052B0D92A50AED7EDB3EB
          F8FF8DE6F8FFB4DDEEFF48A5D3B246A2D2050000000000000000000000000000
          000000000000000000000000000000000000000000000000000055B5DB7EA3D7
          EBFFDCF4FBFF50AED7EF4EACD635000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000005ABADD0E58B9
          DDD6AADBEDFF55B5DB8C00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000005DBE
          DF555BBCDEC85ABADD1600000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
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
    Left = 48
    Top = 648
    object Clear1: TMenuItem
      Action = ActionMessagesClear
    end
  end
  object PopupMenuEditorTabs: TdxRibbonPopupMenu
    BarManager = dxBarManager1
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
    BarManager = dxBarManager1
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
