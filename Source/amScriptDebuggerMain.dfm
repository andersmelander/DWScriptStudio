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
    Top = 157
    Width = 1117
    Height = 581
    AllowDockClients = [dtClient, dtLeft, dtRight, dtBottom]
    Align = alClient
    ExplicitTop = 124
    ExplicitHeight = 614
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
      ExplicitHeight = 614
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
          ExplicitHeight = 474
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
              ExplicitHeight = 474
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
                  Width = 222
                  Height = 415
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
                  ExplicitHeight = 448
                  ClientRectBottom = 415
                  ClientRectRight = 222
                  ClientRectTop = 0
                end
                object StatusBar: TdxStatusBar
                  Left = 0
                  Top = 415
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
              Height = 441
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
          ExplicitTop = 474
          DockingType = 4
          OriginalWidth = 185
          OriginalHeight = 140
          object DockPanelMessages: TdxDockPanel
            Left = 0
            Top = 0
            Width = 661
            Height = 80
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
              Width = 661
              Height = 80
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
            Width = 661
            Height = 80
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
              Width = 661
              Height = 80
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
            Width = 661
            Height = 80
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
          Width = 219
          Height = 521
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
          Height = 521
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
      Height = 581
      Visible = False
      OnVisibleChanged = DockPanelDebugFrameVisibleChanged
      AllowFloating = True
      AutoHide = False
      Caption = 'Explorer'
      CustomCaptionButtons.Buttons = <>
      TabsProperties.CustomButtons.Buttons = <>
      OnClose = DockPanelDebugFrameClose
      ExplicitHeight = 614
      DockingType = 1
      OriginalWidth = 225
      OriginalHeight = 320
      object ShellListViewFileExplorer: TcxShellListView
        Left = 0
        Top = 23
        Width = 219
        Height = 528
        Align = alClient
        ReadOnly = True
        TabOrder = 0
        ViewStyle = vsReport
        OnExecuteItem = ShellListViewFileExplorerExecuteItem
        ExplicitTop = 21
        ExplicitHeight = 563
      end
      object ShellComboBoxFileExplorer: TcxShellComboBox
        Left = 0
        Top = 0
        Align = alTop
        ShellListView = ShellListViewFileExplorer
        TabOrder = 1
        Width = 219
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
    Left = 444
    Top = 360
    Bitmap = {
      494C010149005800040010001000FFFFFFFF2100FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003001000001002000000000000030
      0100000000000000000000000000000000000000000000000000000000000000
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
      00000000000805052A73121289CF1B1BC9FB1B1BCAFB12128CD105052C760000
      000A000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      021B12128DD11B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1B1BD1FF1414
      93D60000031F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000071212
      8BD01B1BD1FF141494D70202124D00000008000000080202114912128FD31B1B
      D1FF141493D60000000A00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000505266E1B1B
      D1FF141496D800000011000000000000000000000000000000000000000E1212
      8FD31B1BD1FF05052C7600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000111182C91B1B
      D1FF020215520000000000000000000000000000000000000000000000000202
      114A1B1BD1FF12128CD100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001919BDF31B1B
      D1FF0000000F0000000000000000000000000000000000000000000000000000
      00081B1BD1FF1B1BCAFB00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001818BCF21B1B
      D1FF000000100000000000000000000000000000000000000000000000000000
      00091B1BD1FF1A1AC9FA00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000011117FC71B1B
      D1FF0202165300000000000000001919BDF21919C3F600000000000000000202
      124D1B1BD1FF12128ACF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000505256C1B1B
      D1FF14149ADB00000114000000001B1BD1FF1B1BD1FF00000000000000111414
      96D81B1BD1FF05052B7400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000071212
      8ACF1B1BD1FF14149DDD000000001B1BD1FF1B1BD1FF00000000141499DA1B1B
      D1FF131392D50000000900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      021A12128ACF1B1BD1FF000000001B1BD1FF1B1BD1FF000000001B1BD1FF1212
      8FD30000021E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000060404246A000000001B1BD1FF1B1BD1FF000000000505266E0000
      0008000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001818B6EE1919BCF200000000000000000000
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
      00000000000000000000000000000000000000000000000000000000001E0000
      0000202020FF000000000000001E0000000000000000003B51BB001821770000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000191B1B1BE81414
      14C9202020FF141414CB1B1B1BE90000001E000000000006083C006D97FE000D
      1258000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000191919E12020
      20FF202020FF191919E100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000131313C30808
      08830000001D0707077B151515CB000000000000000000000000003B51BB0068
      91F80006083E06060674202020FF202020FF202020FF202020FF1C1C1CED0303
      0356000000000000000000000000000000000000000000000000000000000000
      0000191919E1202020FF202020FF202020FF202020FF202020FF202020FF0000
      001900000019202020FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000F0F0FAA131313C21313
      13C2131313C2131313C2131313C2131313C200000008202020FF202020FF0000
      0024000000190000001D202020FF202020FF0006083C006E99FF006E99FF006E
      99FF005F84ED000203290000000F000000191B1B1BE70202024B020202441C1C
      1CED000000000000000000000000000000000000000000000000000000000000
      0000202020FF0000000000000000000000000000000000000000202020FF0000
      001900000019202020FF000000000000000000000000000304230A557BB114B1
      FFFF14B1FFFF14B1FFFF14B1FFFF14B1FFFF14B1FFFF14B1FFFF14B1FFFF14B1
      FFFF094D70A900000000000000000000000000000000131313C2000000130000
      0013000000130000001300000013000000130000000300000000121212C10909
      09890000002408080883141414C90000000000000000003B51BB006E99FF003C
      53BD0000000200000000000000030F0F0FB1191919E000000019000000192020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000202020FF0000000000000000000000000000000000000000191919DD2020
      20FF202020FF191919DD00000000000000000000000006354D8C0004052714AA
      F5FA14B1FFFF14B1FFFF14B1FFFF14B1FFFF14B1FFFF14B1FFFF14B1FFFF14B1
      FFFF14B1FFFF010A0E3D000000000000000000000000131313C2000000130000
      0013000000130000001302020243000000140000000A000000191B1B1BE81212
      12C2202020FF131313C31B1B1BE80000001E000000000006083C006E99FF006E
      99FF00171F750000000800000019000000190000001900000019000000192020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000202020FF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B638FBF01070B36063A
      549314B1FFFF14B1FFFF14B1FFFF14B1FFFF14B1FFFF14B1FFFF14B1FFFF14B1
      FFFF14B1FFFF0C6C9BC7000000010000000000000000131313C2000000130000
      0013000000130101013C202020FF020202430000001200000005000000190000
      0000202020FF0000000000000019000000000000000000000000003B51BB006E
      99FF006991F9000405320000000F000000190000001900000019000000192020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000202020FF0000000000000000000000000000000000000000191919E12020
      20FF202020FF191919E10000000000000000000000000B638FBF0742609D0001
      0116129BE0EF14B1FFFF14B1FFFF14B1FFFF14B1FFFF14B1FFFF14B1FFFF14B1
      FFFF14B1FFFF14B1FFFF02131C560000000000000000131313C2000000130000
      001300000013000000130101013B0000001300000013000000120000000A0000
      0020000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000001000000150000001900000019000000192020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF202020FF202020FF202020FF202020FF202020FF0000
      001900000019202020FF0000000000000000000000000B638FBF0B638FBF010E
      14490424347414B1FFFF14B1FFFF14B1FFFF14B1FFFF14B1FFFF14B1FFFF14B1
      FFFF14B1FFFF14B1FFFF0F7DB5D70000000100000000131313C2000000130000
      00130000001300000013202020FF000000130000001300000013000000131313
      13C2000000000000000000000000000000000000000000000000000000000000
      0000202020FF0000001900000019000000190000001900000019000000192020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000202020FF0000000000000000000000000000000000000000202020FF0000
      001900000019202020FF0000000000000000000000000B638FBF0B638FBF094F
      71AA000101140000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000131313C2000000130000
      00130000001300000013202020FF000000130000001300000013000000131313
      13C2000000000000000000000000000000000000000000000000000000000000
      0000202020FF0000001900000019000000190000001900000019000000192020
      20FF202020FF202020FF191919E1000000000000000000000000000000000000
      0000202020FF0000000000000000000000000000000000000000191919DD2020
      20FF202020FF191919DD0000000000000000000000000B638FBF0B638FBF0B63
      8FBF0B638FBF0B638FBF0B638FBF0B638FBF0B638FBF0B638FBF0B638FBF0B63
      8FBF0000000000000000000000000000000000000000131313C2000000130000
      00130000001300000013202020FF000000130000001300000013000000131313
      13C2000000000000000000000000000000000000000000000000000000000000
      0000202020FF0000001900000019000000190000001900000019000000192020
      20FF0000001900000019202020FF000000000000000000000000191919E12020
      20FF202020FF202020FF191919E1000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B638FBF0B638FBF0B63
      8FBF0B638FBF0B638FBF0B638FBF0B638FBF0B638FBF0B638FBF0B638FBF0A59
      80B50000000000000000000000000000000000000000131313C2000000130000
      0013000000130000001300000013000000130000001300000013000000131313
      13C2000000000000000000000000000000000000000000000000000000000000
      0000191919E30303035300000019000000190000001900000019000000191A1A
      1AE5030303530202024C1B1B1BEB000000000000000000000000202020FF0000
      00190000001900000019202020FF000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B638FBF0B638FBF0B63
      8FBF0B638FBF0B638FBF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000131313C2000000130000
      0013000000130000001300000013000000130000001300000013000000131313
      13C2000000000000000000000000000000000000000000000000000000000000
      00000202024A191919E3202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF1A1A1AE503030350000000000000000000000000202020FF0000
      00190000001900000019202020FF000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A557BB10B638FBF0B63
      8FBF0B638FBF0A5980B500000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000E0E0EA7131313C21313
      13C2131313C2131313C2131313C2131313C2131313C2131313C2131313C20E0E
      0EA7000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000202020FF0000
      00190000001900000019202020FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000191919DD2020
      20FF202020FF202020FF191919DD000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000202020FF141414C90202
      0249121212C2202020FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000001050505662020
      20FF0505056D0000000200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000202020FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000202020FF2020
      20FF202020FF202020FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000202020FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000F0F0FAA131313C21313
      13C2131313C2131313C2131313C2131313C2131313C2131313C2000000002020
      20FF00000000131313C20F0F0FAA000000000000000000000000000000000000
      0000000000000000000000000000000000090000001B00000000000000000000
      000000000000202020FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000202020FF2020
      20FF202020FF202020FF00000000000000000000000000000000000000000000
      0000202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF0000000000000000000000000000000000000000131313C2000000130000
      0013000000130000001300000013000000130000001300000013000000002020
      20FF0000000000000013131313C2000000000000000000000000000000000000
      00000000000000000000000000000303034E181818DC0000001E000000000000
      000000000000202020FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000131313C2000000130909
      0989090909890909098909090989090909890000001300000013000000002020
      20FF0000000000000013131313C2000000000000000000000000000000000000
      0000000000000000000000000000000000000505056C181818DC0000001E0000
      000000000000202020FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000202020FF2020
      20FF202020FF202020FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000131313C2000000130909
      0989090909890909098909090989090909890000001300000013000000002020
      20FF0000000000000013131313C2000000000000000000000000202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF0B0B0B990000
      000000000000202020FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF202020FF202020FF202020FF00000000202020FF2020
      20FF202020FF202020FF000000000000000000000000131313C2000000130000
      0013000000130000001300000013000000130000001300000013000000002020
      20FF0000000000000013131313C2000000000000000000000000000000000000
      00000000000000000000000000000000000006060674171717D90000001A0000
      000000000000202020FF00000000000000000000000000000000000000000000
      0000000000000000000000000000202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000E0E0EA7131313C21313
      13C2131313C2131313C2131313C2131313C2131313C2131313C2000000002020
      20FF00000000131313C20E0E0EA7000000000000000000000000000000000000
      000000000000000000000000000003030350171717D90000001A000000000000
      000000000000202020FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000060000001700000000000000000000
      000000000000202020FF00000000000000000000000000000000000000002814
      00770D0600450000000000000000202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF00000000000000000000000000000000000000002814
      00770D060045000000000000000000000000202020FF202020FF202020FF2020
      20FF202020FF202020FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000002060606702020
      20FF060606730000000300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000202020FF00000000000000000000000000000000000000000904
      003A9A4D00E80D06004500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000904
      003A9A4D00E80D06004500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000202020FF121212BE0202
      0240111111BC202020FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000202020FF0000000000000000BA5C00FFBA5C00FFBA5C00FFBA5C
      00FFBA5C00FF864200D900000000202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF0000000000000000BA5C00FFBA5C00FFBA5C00FFBA5C
      00FFBA5C00FF864200D900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000B05
      003F9B4D00E90B05003F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000B05
      003F9B4D00E90B05003F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002110
      006C0B05003F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002110
      006C0B05003F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000F0F0FB00505056A000000100000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000005290B0561B3150A
      B8F7150ABAF80B0564B60000062D00000000000000000F0F0FAA131313C21313
      13C2131313C2131313C2131313C2131313C2131313C2131313C2131313C21313
      13C2131313C2131313C20F0F0FAA0000000000000000000000210A0A0A8F0000
      00000101013D0000000100000024010101380000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000191919E1202020FF2020
      20FF202020FF202020FF0000000000000000000004281409ADEF160AC5FF160A
      C5FF160AC5FF160AC5FF1409B1F20000062D00000000131313C2000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      00130000001300000013131313C2000000000000000000000000121212BF0000
      00000707077B03030352101010B3010101300000000300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000202020FF000000000000
      0000000000000000000000000000000000000A055BAE160AC5FF160AC5FF160A
      C5FF160AC5FF160AC5FF160AC5FF0B0564B600000000131313C2000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      00130000001300000013131313C20000000000000000000000000F0F0FAD0000
      0012000000000101012E0D0D0D9F000000000000000000000000000000000000
      000000000000000000000000000000000000F6F6F6FFF6F6F6FFF6F6F6FF1818
      1850000000000000000022222260F6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
      F6FFF6F6F6FFF6F6F6FFF6F6F6FF0000000000000000202020FF000000009148
      00E1BA5C00FFBA5C00FFBA5C00FF0000000D140AAEF0160AC5FF8B85E2FF8B85
      E2FF8B85E2FF8B85E2FF160AC5FF150ABAF800000000131313C2131313C41313
      13C4131313C4131313C4131313C4131313C4131313C4131313C4131313C41313
      13C4131313C4131313C4131313C2000000000000000000000000060606770202
      024800000000030303530C0C0C9C0000001A0000000300000000000000000000
      000000000000000000000000000000000000BCBCBCDF414141FF868686FF7474
      74AF00000000000000008A8A8ABF797979FF797979FFB3B3B3FF414141FF4141
      41FF797979FF414141FFF6F6F6FF0000000000000000202020FF00000000BA5C
      00FF010000196F3700C501000019000000021309ACEF160AC5FF8B85E2FF8B85
      E2FF8B85E2FF8B85E2FF160AC5FF150AB9F700000000131313C2000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      00130000001300000013131313C2000000000000000000000003090909880E0E
      0EAE040404610C0C0C9B00000016090909870303034D00000000000000000000
      0000000000000000000000000000000000003D3D3D80A7A7A7FF4C4C4CFFF6F6
      F6FF3D3D3D803D3D3D80EBEBEBFF414141FFB3B3B3FF414141FF9C9C9CFFF6F6
      F6FF868686FF414141FFF6F6F6FF0000000000000000202020FF00000000BA5C
      00FF010000196F3700C501000019000000070A0458AB160AC5FF160AC5FF160A
      C5FF160AC5FF160AC5FF160AC5FF0B0561B300000000131313C2000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      00130000001300000013131313C20000000000000000000000000000000A0E0E
      0EA600000000000000000000000000000000130900526E3600C4B15800F9B258
      00FA713700C7150A0056000000000000000003030320EBEBEBFF414141FF8686
      86FF9C9C9CFF9C9C9CFF797979FF4C4C4CFFF6F6F6FF797979FF797979FFD4D4
      D4FFE0E0E0FF414141FFF6F6F6FF00000000000000000000000000000000BA5C
      00FF010000196F3700C50100001900000012000004251309A8EC160AC5FF160A
      C5FF160AC5FF160AC5FF1409ADEF0000052A00000000131313C2131313C41313
      13C4131313C4131313C4131313C4131313C4131313C4131313C4131313C41313
      13C4131313C4131313C4131313C2000000000000000000000000000000000202
      024A0707077F0505056400000000361A008A8A4400DC864200D84422009B3E1F
      00948B4400DC864200D83D1E009200000000000000008A8A8ABF868686FF4141
      41FF414141FF414141FF4C4C4CFF868686FFBCBCBCDFD4D4D4FF797979FF4C4C
      4CFF414141FF414141FFF6F6F6FF00000000000000000000000000000000BA5C
      00FF01000019562B00AE6F3700C56F3700C51C0E0064000004250A0458AB1409
      ACEF1409AEF00A045CAE000004280000000000000000131313C2000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      00130000001300000013131313C2000000000000000000000000000000000000
      000000000000000000001108004F8D4600DE09040039A65200F1040200290402
      0026A65200F10904003B874200D9150A00570000000022222260BEBEBEFF4141
      41FFEBEBEBFFD4D4D4FF414141FFD4D4D4FF4D4D4D8FEBEBEBFFEBEBEBFFF6F6
      F6FFD4D4D4FF414141FFF6F6F6FF00000000000000000000000000000000BA5C
      00FF010000190100001901000019010000190100001900000012000000070000
      00010000000D00000000000000000000000000000000131313C2000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      00130000001300000013131313C2000000000000000000000000000000000000
      00000000000000000000683400BFBA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C
      00FFBA5C00FFBA5C00FFBA5C00FF713700C70000000000000000D8D8D8EF5858
      58FFB3B3B3FF919191FF636363FFBCBCBCDF0F0F0F40C9C9C9FF4C4C4CFF6E6E
      6EFF585858FF636363FFBCBCBCDF00000000000000000000000000000000BA5C
      00FF01000019BA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FF010000190100
      0019BA5C00FF000000000000000000000000000000001F1F1FF8202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF1F1F1FF8000000000000000000000000000000000000
      00000000000000000000A75300F2040200283017008240200097010000190100
      00193B1D0090351A008903010021B25800FA00000000000000005F5F5F9F9191
      91FF636363FF585858FFA7A7A7FF3D3D3D8003030320BCBCBCDFD4D4D4FF9C9C
      9CFFB3B3B3FFEBEBEBFF181818500000000000000000202020FF00000000BA5C
      00FF01000019BA5C00FF010000190100001901000019BA5C00FF010000190201
      001EBA5C00FF00000000202020FF0000000000000000202020FF000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      00190000001900000019202020FF000000000000000000000000000000000000
      00000000000000000000A65200F1040200292F17008141210098010000190100
      00193C1E0091351A008903010022B15800F9000000000000000008080830E0E0
      E0FF414141FF414141FFEBEBEBFF0303032000000000000000000F0F0F403D3D
      3D802F2F2F7003030320000000000000000000000000202020FF00000000BA5C
      00FF01000019BA5C00FF010000190100001901000019BA5C00FF0201001E5F2E
      00B6532900AB00000000202020FF0000000000000000202020FF000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      00190000001900000019202020FF000000000000000000000000000000000000
      00000000000000000000653200BCBA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C
      00FFBA5C00FFBA5C00FFBA5C00FF6E3600C4000000000000000000000000BCBC
      BCDF868686FF9C9C9CFF8A8A8ABF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000202020FF000000008B45
      00DDBA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FF5128
      00A90000000500000000202020FF0000000000000000191919DD202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF191919DD000000000000000000000000000000000000
      000000000000000000000F07004A914800E10904003AA75300F20502002C0402
      0028A65200F10A05003C8B4500DD120900510000000000000000000000002222
      22608A8A8ABF8A8A8ABF18181850000000000000000000000000000000000000
      00000000000000000000000000000000000000000000202020FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000202020FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000030180083904700E0884300DA492400A04221
      00998B4500DD8B4500DD351A0089000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000191919DD202020FF2020
      20FF202020FF202020FF00000000000000000000000000000000202020FF2020
      20FF202020FF202020FF191919DD000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000F07004A653200BCA65200F1A753
      00F2683400BF1108004E00000000000000000000000000000000000000000000
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
      00000F0F0FB00202024500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000202020FF1B1B1BEA02020245000000000000000000000000000000000000
      00000000000000000000000000000000000000000000191919E1202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF191919E1000000000000
      00000000000000000000000000000000000000000000191919E1202020FF2020
      20FF00000000080400385F2F00B7261300740000001300000000000000000000
      000000000000202020FF202020FF191919E10000000000000000000000000000
      0000000000000000000000000000000000000000000000000000191919E12020
      20FF202020FF202020FF191919E1000000000000000000000000000000000000
      0000202020FF0303034D1B1B1BEA020202450000000000000000000000000000
      00000000000000000000000000000000000000000000202020FF000000190000
      00190000001900000019000000190000001900000019202020FF000000000000
      00000000000000000000000000000000000000000000202020FF000000000000
      000008040038592C00B16E3700C4251200725C2E00B3190C005F000000080000
      0000000000000000000000000000202020FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000202020FF0000
      00190000001900000019202020FF0000000000000000191919E1202020FF2020
      20FF191919E0000000190303034D1C1C1CEF202020FF202020FF202020FF2020
      20FF202020FF202020FF191919E10000000000000000202020FF000000190000
      00190000001900000019000000190000001900000019202020FF000000002814
      00770D06004500000000000000000000000000000000202020FF000000000804
      0038592C00B1080400376E3700C4010000130402002933190086542A00AC0F07
      0049000000020000000000000000202020FF0000000000000000000000000000
      0000000000000000000000000000000000000000000704040460202020FF0000
      00190000001900000019202020FF0000000000000000202020FF000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      00190000001900000019202020FF0000000000000000202020FF000000190000
      00190000001900000019000000190000001900000019202020FF000000000904
      003A9A4D00E80D060045000000000000000000000000202020FF000000006131
      00B9080400370201001B8D4600DE070300320100001301000013080400384221
      00994623009E0703003200000000202020FF0000000000000000000000000000
      00000000000000000000000000000101013A0E0E0EA60808087E202020FF0000
      00190000001900000019202020FF0000000000000000202020FF000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      00190000001900000019202020FF0000000000000000202020FF000000190000
      0019000000000000000000000000000000000000000000000000000000000000
      00000904003A9A4D00E80D0600450000000000000000202020FF000000006B35
      00C20201001B693400BF753A00CAA15000EE3F1F009503010023010000130100
      00131008004B663200BD00000000202020FF00000000191919E1202020FF2020
      20FF202020FF191919E1090909860D0D0DA00101013200000000202020FF2020
      20FF202020FF202020FF202020FF0000000000000000202020FF000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      00190000001900000019202020FF0000000000000000202020FF000000190000
      001900000000BA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C
      00FFBA5C00FFBA5C00FF864200D90000000000000000202020FF000000006E37
      00C4693400BF592C00B00502002C0A05003D502800A89D4E00EB2B15007B0100
      0019010000136B3500C200000000202020FF00000000202020FF000000190000
      001900000019202020FF04040458000000040000000000000000202020FF0000
      00190000001900000019202020FF0000000000000000202020FF000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      00190000001900000019202020FF0000000000000000202020FF000000190000
      0019000000000000000000000000000000000000000000000000000000000000
      00000B05003F9B4D00E90B05003F0000000000000000202020FF000000009B4D
      00E9643100BB0502002C0502002A0502002A0502002A1008004D693400C08D46
      00DE1A0D00616B3500C200000000202020FF00000000202020FF000000190000
      001900000019202020FF121212BF121212BF121212BF121212BF202020FF0000
      00190000001900000019202020FF0000000000000000202020FF000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      00190000001900000019202020FF0000000000000000202020FF000000190000
      00190000001900000019000000190000001900000019202020FF000000000B05
      003F9B4D00E90B05003F000000000000000000000000202020FF000000002412
      00729F4F00EC4622009D080400370502002A0502002A0502002A0502002A1A0D
      0061854200D89B4D00E900000000202020FF00000000202020FF000000190000
      001900000019202020FF0404045E000000060000000000000000202020FF0000
      00190000001900000019202020FF0000000000000000202020FF000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      00190000001900000019202020FF0000000000000000202020FF000000190000
      00190000001900000019000000190000001900000019202020FF000000002110
      006C0B05003F00000000000000000000000000000000202020FF000000000000
      0000010000184321009A9E4E00EB321900850603002E0502002A0502002A0904
      003A844200D7351A008900000000202020FF00000000191919DD202020FF2020
      20FF202020FF191919DD080808800E0E0EA40101013900000000202020FF2020
      20FF202020FF202020FF202020FF0000000000000000202020FF000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      00190000001900000019202020FF0000000000000000202020FF000000190000
      00190000001900000019000000190000001900000019202020FF000000000000
      00000000000000000000000000000000000000000000202020FF000000000000
      000000000000000000000502002C5F2E00B68F4700E02211006E0904003A8442
      00D7371B008B0000000000000000202020FF0000000000000000000000000000
      0000000000000000000000000000010101340D0D0DA208080885202020FF0000
      00190000001900000019202020FF0000000000000000202020FF000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      00190000001900000019202020FF0000000000000000191919DD202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF191919DD000000000000
      00000000000000000000000000000000000000000000202020FF000000000000
      0000000000000000000000000000000000000D0600457C3D00D0AA5400F4371B
      008B000000000000000000000000202020FF0000000000000000000000000000
      000000000000000000000000000000000000000000050404045A202020FF0000
      00190000001900000019202020FF0000000000000000191919DD202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF191919DD000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000191919DD202020FF2020
      20FF000000000000000000000000000000000000000000000002060300300000
      000000000000202020FF202020FF191919DD0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000202020FF0000
      00190000001900000019202020FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000191919DD2020
      20FF202020FF202020FF191919DD000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000E000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005C2D00B3130900530000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000F0B0050876400EBA076
      00FF7C5C00E10000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000001000016A35100EF0000000B0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000815F00E50E0A004C0101
      0019A07600FF00000000191919E1202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF191919E100000000000000000F0F0FAA131313C21313
      13C2131313C2131313C2131313C2131313C2131313C2131313C2131313C21313
      13C2131313C2131313C20F0F0FAA000000000000000000000000000000000000
      000000000000000000004824009F000000082211006E4A2500A1000000000000
      0000000000000000000000000000000000000505056C202020FF202020FF2020
      20FF202020FF1C1C1CEC0000001600000000000000101B1B1BE9202020FF2020
      20FF202020FF202020FF060606730000000000000000A07600FF01010019805F
      00E4785800DD00000000202020FF000000190000001900000019000000190000
      00190000001900000019202020FF0000000000000000131313C200000013140A
      B2F3160AC5FF160ABEFB00000013000000130000001300000013000000130000
      00130000001300000013131313C2000000000000000000000000000000000000
      00000000000000000000BA5C00FF753A00CA7F3F00D3150A0057030100210502
      002C000000000000000000000000000000000F0F0FB104040462000000190000
      0019000000190E0E0EA80606067600000000050505690F0F0FAF000000190000
      0019000000190404045C111111B90000000000000000A07600FF01010019A076
      00FF0000000000000000191919DD202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF191919DD0000000000000000131313C2000000130703
      388D140AB3F307043E9300000013000000130000001300000013000000130000
      00130000001300000013131313C20000000000000000191919E1202020FF2020
      20FF202020FF00000000BA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FF1F10
      006A0202024B202020FC191919E1000000001A1A1AE401010134000000190000
      0019000000190202024B171717D900000000151515CB03030353000000190000
      0019000000190101012E1B1B1BEB0000000000000000A07600FF01010019A076
      00FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000131313C2000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      00130000001300000013131313C20000000000000000202020FF000000190000
      00190000001900000000BA5C00FFBA5C00FFBA5C00FFBA5C00FF3F1F00950000
      00040000001800000019202020FF000000001E1E1EF700000019000000190000
      00190000001900000019202020FF202020FF202020FF0000001A000000190000
      001900000019000000191F1F1FF80000000000000000A07600FF01010019A076
      00FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000131313C2000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      00130000001300000013131313C20000000000000000202020FF000000190000
      00190000001900000000BA5C00FFBA5C00FFBA5C00FF643100BB000000060000
      00160000001900000019202020FF000000001B1B1BE9202020FF202020FF2020
      20FF202020FF202020FF191919DD00000000191919DD202020FF202020FF2020
      20FF202020FF202020FF1D1D1DF00000000000000000A07600FF010100197C5B
      00E07C5C00E100000000191919E1202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF191919E10000000000000000131313C2000000130704
      3E93160ABFFB0804439A00000013000000130000001300000013000000130000
      00130000001300000013131313C20000000000000000202020FF000000190000
      00190000001900000000BA5C00FFBA5C00FF864200D900000012000000130000
      00190000001900000019202020FF00000000050505650606066E000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000050505680505056B00000000000000007E5D00E3110C00530101
      0019A07600FF00000000202020FF000000190000001900000019000000190000
      00190000001900000019202020FF0000000000000000131313C200000013140A
      B4F4160AC5FF160ABFFB00000013000000130000001300000013000000130000
      00130000001300000013131313C20000000000000000202020FF000000190000
      00190000001900000000BA5C00FFA25000EE040200270000000F000000190000
      00190000001900000019202020FF000000000000000F0F0F0FB0000000150000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000110F0F0FB00000001300000000000000000D0A004A7E5D00E3A076
      00FF785800DD00000000191919DD202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF191919DD0000000000000000131313C2000000130703
      368B140AB2F307043E9300000013000000130000001300000013000000130000
      00130000001300000013131313C20000000000000000202020FF000000190000
      00190000001900000000B45900FB0D0600440000000B00000019000000190000
      00190000001900000019202020FF0000000000000000050505650606066E0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000050505680505056B00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000131313C2000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      00130000001300000013131313C20000000000000000202020FF000000190000
      001900000019000000001F10006A000000070000001900000019000000190000
      00190000001900000019202020FF00000000000000000000000F0F0F0FB00000
      0015000000000000000000000000000000000000000000000000000000000000
      00110F0F0FB00000001300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001F1F1FF8202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF1F1F1FF80000000000000000202020FF000000190000
      0019000000190000000000000004000000180000001900000019000000190000
      00190000001900000019202020FF0000000000000000000000000404045D1212
      12BF121212BF0000000000000000000000000000000000000000121212BF1212
      12BF0404046200000000000000000000000000000000191919E1202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF191919E10000000000000000202020FF000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      00190000001900000019202020FF0000000000000000191919DD202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF191919DD000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000202020FF000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      00190000001900000019202020FF0000000000000000202020FF000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      00190000001900000019202020FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000191919DD202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF191919DD0000000000000000191919DD202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF191919DD000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005677E1006E99FF006E99FF006E
      99FF006E99FF006E99FF006E99FF006E99FF006E99FF006E99FF006E99FF006E
      99FF006E99FF006E99FF005677E1000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000191919E12020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF191919E10000000000000000006E99FF00010119000101190001
      0119000101190001011900010119000101190001011900010119000101190001
      01190001011900010119006E99FF000000000000000000000000202020FF0000
      00000000000003030350131313C41F1F1FF91F1F1FF9141414C6030303550000
      000000000000202020FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000202020FF0000
      00190000001900000019000000190909098C0909098C00000019000000190000
      001900000019202020FF0000000000000000006E99FF0001011900010119006E
      99FF000101190001011900010119006E99FF000101190001011900010119006E
      99FF0001011900010119006E99FF000000000000000000000000202020FF0000
      000508080886171717DA0404045E00000021000000200404045B171717D60909
      098E00000003202020FF0000000000000000000000000E0E0EA9121212BF1212
      12BF121212BF121212BF121212BF121212BF121212BF121212BF121212BF1212
      12BF121212BF121212BF0E0E0EA9000000000000000000000000202020FF0000
      00190000001900000019000000190909098C0909098C00000019000000190000
      001900000019202020FF0000000000000000006E99FF0001011900010119006E
      99FF00010119006E99FF00010119006E99FF00010119006E99FF00010119006E
      99FF0001011900010119006E99FF0000000000000000000000000F0F0FB01212
      12C0171717DB000000270000001D00000019000000190000001C000000251717
      17D6121212BF111111B8000000000000000000000000131313C2000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      00130000001300000013131313C2000000000000000000000000202020FF0000
      00190000001900000019000000190909098C0909098C00000019000000190000
      001900000019202020FF0000000000000000005273DD006E99FF006E99FF006E
      99FF006E99FF006E99FF006E99FF006E99FF006E99FF006E99FF006E99FF006E
      99FF006E99FF006E99FF005273DD0000000000000000000000000000000F1B1B
      1BE80404046205050567111111BC0000001F0000001E101010B60606066E0404
      045B1C1C1CEE00000013000000000000000000000000131313C2000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      00130000001300000013131313C2000000000000000000000000202020FF0000
      00190000001900000019000000190909098C0909098C00000019000000190000
      001900000019202020FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001D1D
      1DF0000000270000001C0F0F0FB0111111BC101010B6101010B60000001E0000
      00201F1F1FF800000000000000000000000000000000131313C2000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      00130000001300000013131313C2000000000000000000000000202020FF0000
      00190000001900000019000000190909098C0909098C00000019000000190000
      001900000019202020FF00000000000000000000000000000000191919E12020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF1010
      10B50000000000000000000000000000000000000000202020FF000000002020
      20FF0000001900000019000000211B1B1BE91C1C1CED00000024000000190000
      0019202020FF00000000202020FF0000000000000000131313C2000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      00130000001300000013131313C2000000000000000000000000202020FF0000
      00190000001900000019000000190909098C0909098C00000019000000190000
      001900000019202020FF00000000000000000000000000000000202020FF0000
      00190000001900000019000000190000001900000019030303521B1B1BEA0101
      013F0000000000000000000000000000000000000000202020FF000000001D1D
      1DF1000000280000001E101010B6101010B60F0F0FB0111111BC0000001F0000
      00211F1F1FF900000000202020FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000A00000013000000130000
      00130000001300000013131313C2000000000000000000000000202020FF0000
      00190000001900000019000000190909098C0909098C00000019000000190000
      001900000019202020FF00000000000000000000000000000000202020FF0000
      001900000019000000190000001900000019030303521B1B1BEA0101013F0000
      00000000000000000000000000000000000000000000191919DD202020FF2020
      20FF0505056704040461101010B60000001E0000001C0F0F0FB0050505680404
      045F202020FF202020FF191919DD00000000914800E1BA5C00FFBA5C00FFBA5C
      00FFBA5C00FFBA5C00FFBA5C00FF914800E10000000000000013000000130000
      00130000001300000013131313C2000000000000000000000000202020FF0000
      00190000001900000019000000190909098C0909098C00000019000000190000
      001900000019202020FF00000000000000000000000000000000202020FF0000
      0019000000190000001900000019030303521B1B1BEA0101013F000000000000
      0000000000000000000000000000000000000000000000000000000000000303
      034D191919E00000002B0000001A00000019000000190000001A000000281717
      17DB03030356000000000000000000000000BA5C00FF01000019010000190100
      0019010000190100001901000019BA5C00FF0000000000000013000000130000
      00130000001300000013131313C2000000000000000000000000191919DD2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF191919DD00000000000000000000000000000000202020FF0000
      00190000001900000019030303521B1B1BEA0101013F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000071010
      10B4161616D2191919E005050568000000290000002805050566191919DD1515
      15D0111111BB000000090000000000000000BA5C00FF01000019010000190100
      0019010000190100001901000019BA5C00FF00000000202020FF202020FF2020
      20FF202020FF202020FF1F1F1FF8000000000000000000000000000000000101
      012D1A1A1AE50101012F0101012D1A1A1AE5191919E0010101350000002A1919
      19E0010101360000000000000000000000000000000000000000202020FF0000
      001900000019030303521B1B1BEA0101013F0000000000000000000000000000
      00000000000000000000000000000000000000000000000000000E0E0EAB0E0E
      0EAA00000004060606741D1D1DF01D1D1DF01D1D1DF11C1C1CEF0707077A0000
      00030D0D0DA3111111B60000000000000000BA5C00FF01000019010000190100
      0019010000190100001901000019BA5C00FF0000000000000019000000190000
      00190000001900000019202020FF000000000000000000000000000000000202
      0248141414C6000000030F0F0FAD070707790606066E101010B5000000031212
      12BC030303530000000000000000000000000000000000000000202020FF0000
      0019030303521B1B1BEA0101013F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000202020FF0000
      000500000000060606760B0B0B9700000019000000190A0A0A900707077E0000
      000000000004202020FF0000000000000000BA5C00FF01000019944900E4BA5C
      00FF944900E40100001901000019BA5C00FF0000000000000019000000190000
      00190000001900000019202020FF000000000000000000000000000000000000
      0005111111B61E1E1EF3131313C40000000A00000006111111BB1D1D1DF31111
      11BD000000080000000000000000000000000000000000000000202020FF0303
      03521B1B1BEA0101013F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000202020FF0000
      0000000000000101013E191919E00101013A01010138181818DC020202460000
      000000000000202020FF0000000000000000BA5C00FF01000019BA5C00FF0100
      0019BA5C00FF0100001913090052A65200F100000004202020FF202020FF2020
      20FF202020FF202020FF191919DD000000000000000000000000000000000000
      0000000000000000001100000001000000000000000000000000000000110000
      0000000000000000000000000000000000000000000000000000202020FF1B1B
      1BEA0101013F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000101013F1C1C1CED1B1B1BE71B1B1BE91C1C1CEE020202450000
      000000000000000000000000000000000000BA5C00FF01000019BA5C00FF0100
      0019BA5C00FF130900529D4D00EA0B05003F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000E0E0EAC0101
      013F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000505056C0101013F00000000000000000101013A060606710000
      0000000000000000000000000000000000008B4500DDBA5C00FFBA5C00FFBA5C
      00FFBA5C00FFA35100EF0B05003F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000040200295C2D00B3AE56
      00F7B05700F85F2E00B60502002D000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000101010B40202
      0245000000000101013F101010B5000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000004020028A35100EFBA5C00FFD193
      54FFD2975AFFBA5C00FFA75300F20502002D0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000202020FF1B1B
      1BEA070707781B1B1BEA202020FF000000000000000000000000000000000000
      000000000000000000000000000000000000000000000F0F0FAA131313C21313
      13C2131313C2131313C2131313C201010131562B00AEBA5C00FFBA5C00FFC06A
      16FFC16C18FFBA5C00FFBA5C00FF5F2E00B60000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000202020FF0303
      034D171717D503030352202020FF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000131313C2000000130000
      001300000013000000130000001300000001A55100F0BA5C00FFBA5C00FFCF8F
      4FFFE8C9A9FFBB5D01FFBA5C00FFB05700F80000000000000000000000001E80
      1EFF0000000000000000000000000C330CA20411045E00000001000000000000
      00000000000000000000000000000000000000000000041204600A280A900000
      000E000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000202020FF0000
      00190000001900000019202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF191919E10000000000000000131313C2000000130000
      001300000013000000130000001300000001A35100EFBA5C00FFBA5C00FFBA5C
      00FFE1B990FFDDAF81FFBA5C00FFAE5600F70000000000000000000000001E80
      1EFF0000000000000000000000001E801EFF1C731CF2104610BD000200260000
      000000000000000000000000000000000000000000000D360DA71C731CF31865
      18E3030D03520000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000202020FF0000
      00190000001900000019202020FF00000019202020FF00000019202020FF0000
      0019202020FF00000019202020FF0000000000000000131313C2000000131313
      13C4131313C4131313C4131313C401010134532900ABBA5C00FFDDAE80FFCE8B
      48FFCE8A47FFE8C8A9FFBA5C00FF5C2D00B30000000000000000000000001E80
      1EFF0000000000000000000000001E801EFF114811C0175E17DB1C751CF4071F
      077E00000007000000000000000000000000000000000D360DA7155915D51453
      14CE1C751CF50F3D0FB10001001E00000000000000000104012E0E3A0EAD0D38
      0DA90D380DA90D380DA90C350CA6000000000000000000000000202020FF1717
      17DA202020FE191919DD202020FF000000190000001900000019000000190000
      001900000019202020FF202020FF0000000000000000131313C2000000130000
      00130000001300000013000000130000000D030100249F4F00ECC3701FFFEACD
      B0FFEACFB3FFC47324FFA35100EF040200290000000000000000000000001E80
      1EFF0000000000000000000000001E801EFF114711BF114711BF124D12C61A6C
      1AEB155A15D70107013F0000000000000000000000000D360DA7155915D51147
      11BF114911C1176117DE1B711BF1061906720000000402080240145414CF1147
      11BF114711BF114711BF155715D3000000000000000003030357191919E10303
      034D0000001B02020249181818DC0606066E0000001900000019000000190000
      00190000001900000019202020FF0000000000000000131313C2000000130000
      0013000000130000001300000013000000130000000903010024532900ABA351
      00EFA55100F0562B00AE04020028000000000000000000000000000000001E80
      1EFF0000000000000000000000001E801EFF114711BF114711BF114711BF1147
      11BF155715D31C771CF70924098800000000000000000D360DA7155915D51147
      11BF114711BF114711BF124E12C81A6E1AEE145214CE020B024C145414CF1147
      11BF114711BF114711BF155715D30000000000000000161616D2030303510000
      0019000000190000001902020249191919DE0000001900000019000000190000
      001900000019202020FF202020FF0000000000000000131313C2000000131313
      13C4131313C4131313C4131313C4131313C4131313C40A0A0A8D000000050000
      000B000000000000000000000000000000000000000000000000000000001E80
      1EFF0000000000000000000000001E801EFF114711BF114711BF114711BF1147
      11BF155915D51C771CF70820088100000000000000000D360DA7155915D51147
      11BF114711BF114711BF124F12CA1B701BF0124D12C6020A024B145414CF1147
      11BF114711BF114711BF155715D300000000000000001E1E1EF6000000220000
      001900000019000000190000001B202020FE00000019202020FF202020FF2020
      20FF0000001900000019202020FF0000000000000000131313C2000000130000
      0013000000130000001300000013000000130000001300000013000000131313
      13C2000000000000000000000000000000000000000000000000000000001E80
      1EFF0000000000000000000000001E801EFF114711BF114711BF124D12C71A6E
      1AED145414D0010601370000000000000000000000000D360DA7155915D51147
      11BF114911C1176217E01A6E1AEE051505690000000202080240145414CF1147
      11BF114711BF114711BF155715D30000000000000000161616D1030303540000
      001900000019000000190303034D191919DD0000001900000019000000190000
      001900000019202020FF202020FF0000000000000000131313C2000000130000
      0013000000130000001300000013000000130000001300000013000000131313
      13C2000000000000000000000000000000000000000000000000000000001E80
      1EFF0000000000000000000000001E801EFF114811C0175F17DD1B721BF2061A
      067500000004000000000000000000000000000000000D360DA7155915D51455
      14D01C761CF60D370DA80001001900000000000000000103012C0C360CA60C34
      0CA30C340CA30C340CA30B310B9F000000000000000003030354191919E30303
      03540000002203030351191919E10505056C00000019202020FF202020FF2020
      20FF0000001900000019202020FF0000000000000000131313C2000000131313
      13C4131313C4131313C4131313C400000013131313C4131313C4131313C41111
      11B6000000000000000000000000000000000000000000000000000000001E80
      1EFF0000000000000000000000001E801EFF1C741CF40F3F0FB4000200200000
      000000000000000000000000000000000000000000000D360DA71C751CF51760
      17DE020A02490000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000202020FF1717
      17D71F1F1FFB171717D90505056A000000190000001900000019000000190000
      001900000019202020FF202020FF0000000000000000131313C2000000130000
      001300000013000000130000001300000013131313C4131313C4111111B90101
      012F000000000000000000000000000000000000000000000000000000001E80
      1EFF0000000000000000000000000B2E0B99030E035500000000000000000000
      000000000000000000000000000000000000000000000310035B082308870000
      000A000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000202020FF0000
      0019202020FF00000019202020FF00000019202020FF00000019202020FF0000
      0019202020FF00000019202020FF0000000000000000131313C2000000130000
      001300000013000000130000001300000013131313C4111111B90101012F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000191919DD2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF191919DD00000000000000000E0E0EA7131313C21313
      13C2131313C2131313C2131313C2131313C2101010B50101012F000000000000
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
      000000000000000000000000000000000000000000000E0E0EA9121212BF1212
      12BF121212BF121212BF121212BF121212BF121212BF121212BF121212BF1212
      12BF121212BF121212BF0E0E0EA9000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000241200710D060045000000000000000000000000000000000000
      00000000000000000000080400372C15007D0A05003C00000000000000000000
      00000000000000000000000000000000000000000000191919E1000000192020
      20FF00000019202020FF00000019202020FF00000019202020FF000000192020
      20FF00000019191919E1000000000000000000000000121212BF000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      00130000001300000013121212BF000000000000000006060671020202450000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000904003A9A4D00E80D0600450000000000000000000000000000
      00000000000007030034B45A00FBBA5C00FFB65A00FD0A05003C000000000000
      0000000000000000000000000000000000000000000000000019000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      00190000001900000019000000000000000000000000121212BF000000130000
      001300000013202020FF202020FF0000001300000013202020FF202020FF0000
      00130000001300000013121212BF00000000000000000101013A1B1B1BE80202
      0245000000000000000000000000000000000000000000000000BA5C00FFBA5C
      00FFBA5C00FFBA5C00FFBA5C00FF864200D90000000000000000000000000000
      00000000000026130075BA5C00FFBA5C00FFBA5C00FF2C16007D000000000000
      00000000000000000000000000000000000000000000202020FF000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      001900000019202020FF000000000000000000000000121212BF000000130000
      001300000013202020FF202020FF0000001300000013202020FF202020FF0000
      00130000001300000013121212BF0000000000000000000000000101013A1B1B
      1BE8020202450000000000000000000000000000000000000000000000000000
      0000000000000B05003F9B4D00E90B05003F0000000000000000000000000000
      00000000000006030031B25800FABA5C00FFB45A00FB08040037000000000000
      0000000000000000000000000000000000000000000000000019000000192020
      20FF202020FF202020FF202020FF00000019202020FF202020FF202020FF2020
      20FF0000001900000019000000000000000000000000121212BF000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      00130000001300000013121212BF000000000000000000000000000000000101
      013A1B1B1BE80202024500000000000000000000000000000000000000000000
      0000000000002110006C0B05003F000000000000000000000000000000000000
      0000000000000000000006030031261300750703003400000000000000000000
      00000000000000000000000000000000000000000000202020FF000000192020
      20FF0000001900000019202020FF00000019202020FF00000019000000192020
      20FF00000019202020FF000000000000000000000000121212BF000000132020
      20FF202020FF0000001300000013202020FF202020FF00000013000000132020
      20FF202020FF00000013121212BF000000000000000000000000000000000000
      00000101013A1B1B1BE805050566101010B31E1E1EF71F1F1FF8111111B60101
      012D000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000019000000192020
      20FF202020FF202020FF202020FF00000019202020FF202020FF202020FF2020
      20FF0000001900000019000000000000000000000000121212BF000000132020
      20FF202020FF0000001300000013202020FF202020FF00000013000000132020
      20FF202020FF00000013121212BF000000000000000000000000000000000000
      0000000000000404045C1F1F1FF9070707790000002400000023060606751B1B
      1BEA0101012D0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BA5C00FF0000000000000000000000000000
      00000000000000000000000000000000000000000000202020FF000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      001900000019202020FF000000000000000000000000121212BF000000130000
      0013000000130000001300000008000000020000000800000013000000130000
      00130000001300000013121212BF000000000000000000000000000000000000
      0000000000000F0F0FAE0707077C000000190000001900000019000000190606
      0675111111B60000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BA5C00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000019000000192020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF0000001900000019000000000000000000000000121212BF000000130000
      001300000013000000080B05003F864200D90D06004500000007000000130000
      00130000001300000013121212BF000000000000000000000000000000000000
      0000000000001D1D1DF00000002A000000190000001900000019000000190000
      00231F1F1FF80000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BA5C00FF0000000000000000000000000000
      00000000000000000000000000000000000000000000202020FF000000192020
      20FF000000190000001900000019000000190000001900000019000000192020
      20FF00000019202020FF000000000000000000000000121212BF000000130000
      0013000000080B05003F9B4D00E9BA5C00FF9A4D00E80D060045000000070000
      00130000001300000013121212BF000000000000000000000000000000000000
      0000000000001C1C1CEF0101012B000000190000001900000019000000190000
      00241E1E1EF70000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BA5C00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000019000000192020
      20FF000000190000001900000019000000190000001900000019000000192020
      20FF000000190000001900000000000000000000000000000000000000000000
      00000201001C9A4D00E80B05003FBA5C00FF0904003A9A4D00E8030100210000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000E0E0EAB08080880000000190000001900000019000000190707
      0779101010B30000000000000000000000000000000000000000000000000000
      0000000000040000000000000000BA5C00FF0000000000000000000000040000
      00000000000000000000000000000000000000000000202020FF000000192020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF00000019202020FF00000000000000000000000000000000000000000000
      0000000000000201001B00000000BA5C00FF000000000201001B000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000241B1B1BE7080808800000002B0000002A0707077C1B1B
      1BE8000000290000000000000000000000000000000000000000000000000000
      0002753A00CA0D06004500000000BA5C00FF000000000B05003F7A3C00CE0000
      0004000000000000000000000000000000000000000000000019000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019000000190000001900000000000000000000000000000000000000000000
      0000000000000000000000000000BA5C00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000240E0E0EAB1C1C1CEF1D1D1DF00F0F0FAE0000
      0028000000000000000000000000000000000000000000000000000000000000
      00000904003A9A4D00E80D060045BA5C00FF0B05003F9B4D00E90B05003F0000
      00000000000000000000000000000000000000000000191919DD000000192020
      20FF00000019202020FF00000019202020FF00000019202020FF000000192020
      20FF00000019191919DD00000000000000000000000000000000000000000000
      0000000000000000000000000000BA5C00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000904003A9A4D00E8BA5C00FF9B4D00E90B05003F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BA5C00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000904003A7C3E00D10B05003F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000001E00000031000000330000003300000033000000310000001E0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000100000026000000330000
      0033000000330000002600000003000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000E0000
      00332F200FAAA87235F9B47A36FFB47A35FFB47A36FFA87235F92F200FAA0000
      00330000000E0000000000000000000000000000003000000033000000330000
      00330000003300000033000000330000003300000038502807C9AE5811FFAD57
      10FFAE5811FF51290ACA0000003D000000030000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000114811C0071C07780000
      00040000000000000000114711BF061A06750000000300000000000000000000
      000000000000000000000000000000000000000000000000000E0806026BB47A
      36FFDEC095FFFDF2DBFFFFFFF1FFFFFFF0FFFFFFF1FFFEF2DCFFDEC096FFB47A
      36FF0806026B0000000E0000000000000000979795F2AFAFADFFAEAEABFFADAD
      ABFFADADABFFAEAEACFFAFB2B3FFB2B0ABFFAD5813FFCD8D48FFE6B674FFE4B2
      6FFFE6B674FFCD8E4AFFAE5913FF000000310000000000000000000000001919
      19E1202020FF202020FF191919E10000000000000000191919E1202020FF2020
      20FF191919E1000000000000000000000000000000001E801EFF124A12C2124F
      12C90003002A000000001E801EFF1E801EFF124D12C700030028000000000000
      000000000000000000000000000000000000000000000806026BB98441FFF8EA
      D1FFFFFEEBFFFFF9E2FFFFF7DFFFFFF7E0FFFFFAE4FFFFFEE9FFFFFFEEFFF8EA
      D1FFB98441FF0806026B0000000000000000B0B0ADFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFC98B55FFC9823AFFDEAA65FFDAA259FFFFFF
      FFFFDAA259FFDEAA66FFCB8844FF522A0ACA0000000000000000000000002020
      20FF121212BF121212BF202020FF0000000000000000202020FF121212BF1212
      12BF202020FF000000000000000000000000000000001E801EFF0001001A061B
      06761A6C1AEC000000001E801EFF1E801EFF1E801EFF1C771CF7061A06750000
      0003000000000000000000000000000000000000001EB47A36FFF8EAD3FFFFFA
      E6FFFFF4DBFFFFF3D9FFFFF3D9FFFFF6DDFFFFFDE7FFBE843BFFFFFBE4FFFFFB
      E8FFF8EAD3FFB47A36FF0000001E00000000AEAEABFFFFFFFFFFFDFDFCFFFCFC
      FBFFFCFCFBFFFDFEFFFFFFFFFFFFA64700FFD99F58FFD69C56FFD3944AFFFFFF
      FFFFD3944AFFD69C56FFDBA35EFFAF5913FF0000000000000000000000002020
      20FF121212BF121212BF202020FF0000000000000000202020FF121212BF1212
      12BF202020FF000000000000000000000000000000001E801EFF000100190001
      001901050136000000001E801EFF1E801EFF1E801EFF1E801EFF1E801EFF124D
      12C7000300280000000000000000000000002E210FA9DEC098FFFFFDEDFFFFF4
      DAFFFFF5DBFFFFF3DAFFFFF3D9FFFFF9E2FFBE843BFFBE843BFFFFFDE6FFFFF5
      DCFFFFFDEDFFDEC098FF2E210FA900000000ADADABFFFFFFFFFFF8F8F8FFF8F8
      F8FFF8F8F8FFF9FAFBFFFEFFFFFFA64700FFDCAB6FFFD19147FFCF8C3FFFFFFF
      FFFFCF8C3FFFD19147FFDEAD74FFAE5811FF0000000000000000000000002020
      20FF121212BF121212BF202020FF0000000000000000202020FF121212BF1212
      12BF202020FF000000000000000000000000000000001E801EFF000100190001
      001900010019000000001E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E80
      1EFF1C771CF7061A06750000000300000000A87235F9FFF3E2FFFFF5DBFFCDA3
      6AFFBE843BFFBE843BFFFFF5D9FFBE843BFFCC9E63FFBE843BFFBE843BFFCDA3
      6BFFFFF5DBFFFFF3E2FFA87235F900000000ADADABFFFFFFFFFFF6F5F5FFF6F5
      F5FFF6F5F5FFF7F7F8FFFCFFFFFFA64600FFE8CAA5FFCB8637FFCA8434FFC881
      2EFFCA8434FFCB8738FFEACEABFFAE5810FF0000000000000000000000002020
      20FF121212BF121212BF202020FF0000000000000000202020FF121212BF1212
      12BF202020FF000000000000000000000000000000001E801EFF000100190001
      001900010019000000001E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E80
      1EFF1E801EFF1E801EFF124D12C700030028B47A35FFFFFFFDFFFFEED0FFBE84
      3BFFFFF6DBFFFFF2D6FFFFEED1FFFFF3D7FFBE843BFFBE843BFFFFFBE1FFBE84
      3BFFFFEED0FFFFFFFDFFB47A35FF00000000ADADABFFFFFFFFFFF3F2F2FFF3F2
      F2FFF3F2F2FFF4F3F4FFF7FBFFFFC08049FFCE9761FFDFB789FFC88234FFFFFF
      FFFFC88334FFE1B98CFFD2A06EFF472508BE0000000000000000000000002020
      20FF121212BF121212BF202020FF0000000000000000202020FF121212BF1212
      12BF202020FF000000000000000000000000000000001E801EFF000100190001
      001900010019000000001E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E80
      1EFF1E801EFF1E801EFF1E801EFF124C12C5B47A35FFFFFFFEFFFFEAC9FFBE84
      3BFFFFF2D5FFBE843BFFFFEDCFFFFFEACBFFFFEED0FFBE843BFFFFF2D5FFBE84
      3BFFFFEAC9FFFFFFFEFFB47A35FF00000000ADADABFFFFFFFFFFF0F0EFFFF0F0
      EFFFF0F0EFFFF0F1F0FFF2F5F6FFEBE6E1FFAB5003FFCB945CFFE9CBAAFFE8CA
      A8FFEACEAFFFCF9C69FFAE570FFF0000000D0000000000000000000000002020
      20FF121212BF121212BF202020FF0000000000000000202020FF121212BF1212
      12BF202020FF000000000000000000000000000000001E801EFF000100190001
      001900010019000000001E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E80
      1EFF1E801EFF1E801EFF114811C000020023B47A35FFFFFFFFFFFCE6C1FFBE84
      3BFFFFF2D2FFBE843BFFBE843BFFFFEAC9FFFCE7C4FFFFEAC9FFFFEDCDFFBE84
      3BFFFCE6C1FFFFFFFFFFB47A35FF00000000ADADABFFFFFFFFFFEEECEBFFEEED
      ECFFEEEDECFFEEEDECFFEEEEEDFFF0F2F4FFE8E2DEFFBD7D46FFA74600FFAA4C
      00FFAD5308FF452306BC0000000D000000000000000000000000000000002020
      20FF121212BF121212BF202020FF0000000000000000202020FF121212BF1212
      12BF202020FF000000000000000000000000000000001E801EFF000100190001
      001900010019000000001E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E80
      1EFF1C751CF40517056D0000000200000000A57334F8FFF4EAFFFDE7C5FFCC9E
      63FFBE843BFFBE843BFFCC9E63FFBE843BFFFCE4BFFFBE843BFFBE843BFFCB9D
      62FFFDE7C5FFFFF4EAFFA57334F800000000ADADABFFFFFFFFFFEAE9E9FFEBEA
      EAFFEBEAEAFFEAE9E9FFF4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFBB
      C3FF000000000000000000000000000000000000000000000000000000002020
      20FF121212BF121212BF202020FF0000000000000000202020FF121212BF1212
      12BF202020FF000000000000000000000000000000001E801EFF000100190001
      00190106013A000000001E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1148
      11C00002002300000000000000000000000024190B95DFC19EFFFFF7EAFFF9DD
      B3FFFEE4BDFFBE843BFFBE843BFFFCE2BCFFF8DDB5FFF9DEB6FFFADEB6FFF8DB
      B2FFFFF7EAFFDFC19EFF24190B9500000000ADADABFFFFFFFFFFE7E7E6FFE8E8
      E7FFE8E8E7FFE6E7E5FFFFFFFFFFCBCCCBFFA7A7A5FFA6A7A5FFFFFFFFFFAFB3
      B4FF000000000000000000000000000000000000000000000000000000001919
      19DD202020FF202020FF191919DD0000000000000000191919DD202020FF2020
      20FF191919DD000000000000000000000000000000001E801EFF0001001B071F
      077E1A6C1AEB000000001E801EFF1E801EFF1E801EFF1C751CF40517056D0000
      00020000000000000000000000000000000000000000B57B36FFF9ECE0FFFFED
      D6FFF9D9ACFFBE843BFFFADCB3FFF6D7ACFFF4D4A9FFF4D4A7FFF5D3A6FFFFEC
      D5FFF9ECE0FFB57B36FF0000000000000000AEAEABFFFFFFFFFFE4E3E2FFE5E4
      E3FFE5E4E3FFE4E3E2FFFFFFFFFFA7A7A4FFEBEBEAFFFFFFFFFFE9E9E9FF3535
      35AC000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001E801EFF124E12C8124A
      12C300020023000000001E801EFF1E801EFF114811C000020023000000000000
      0000000000000000000000000000000000000000000003020146B98541FFF9EC
      E4FFFFF6E8FFF9DDB6FFF5D1A1FFF3CF9FFFF3CF9EFFF6D9B1FFFFF3E6FFF8EC
      E3FFB98541FF030201460000000000000000AEAEACFFFFFFFFFFE0DFDEFFE1DF
      DEFFE1DFDEFFE0DFDEFFFFFFFFFFA5A5A3FFFFFFFFFFE8E8E8FF30302FA70000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000F420FB8061806700000
      000200000000000000000F410FB70517056D0000000200000000000000000000
      000000000000000000000000000000000000000000000000000003020146B57B
      36FFDFC1A1FFFFF5F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F0FFDFC1A1FFB57B
      36FF03020146000000000000000000000000AFAFADFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9FF2F2F2EA6000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000024190B95A47033F7B47A35FFB47A35FFB47A35FFA47033F724190B950000
      000000000000000000000000000000000000939391EFB0B0ADFFAEAEACFFAEAE
      ABFFAEAEABFFADAEABFFAEAEABFFAFAFADFF888887EA00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000150A00572110006C0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000006060677020202450000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000502002D000000005D2E00B40603002F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000101013A1B1B1BE80202024500000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AA5400F41F0F0069773B00CC000000000000
      0000000000000000000000000000000000000000000000000000000000001147
      11BF061A06750000000300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000101013A1B1B1BE802020245000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BA5C00FFBA5C00FFAA5400F4A14F00ED3C1E
      0091000000000000000000000000000000000000000000000000000000001E80
      1EFF124A12C2124D12C700030028000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001108
      99E1160AC5FF160AC5FF160AC5FF160AC5FF160AC5FF160AC5FF160AC5FF160A
      C5FF110899E10000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000101013A1B1B1BE8020202450000
      000000000000000000000000000000000000000000000F0F0FAD000000191313
      13C400000013131313C400000000BA5C00FFBA5C00FFBA5C00FF643100BB0000
      0006000000100F0F0FAD00000000000000000000000000000000000000001E80
      1EFF0001001A061B06761A6C1AEB061A06750000000300000000000000000000
      000000000000000000000000000000000000000000000000000000000000160A
      C5FF0C056FBF0C056FBF0C056FBF0C056FBF0C056FBF0C056FBF0C056FBF0C05
      6FBF160AC5FF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000101013A1B1B1BE80202
      0245000000000000000000000000000000000000000000000013000000130000
      0013000000130000001300000000BA5C00FFBA5C00FF864200D9000000110000
      000E000000130000001300000000000000000000000000000000000000001E80
      1EFF000100190001001901050136124A12C2124D12C700030028000000000000
      000000000000000000000000000000000000000000000000000000000000160A
      C5FF0C056FBF0C056FBF0C056FBF0C056FBF0C056FBF0C056FBF0C056FBF0C05
      6FBF160AC5FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000101013A1B1B
      1BE80202024500000000000000000000000000000000131313C4000000130000
      0013000000130000001300000000BA5C00FFA25000EE040200270000000C0000
      001300000013131313C400000000000000000000000000000000000000001E80
      1EFF0001001900010019000100190001001A061B06761A6C1AEB061A06750000
      000300000000000000000000000000000000000000000000000000000000160A
      C5FF0C056FBF0C056FBF0C056FBF0C056FBF0C056FBF0C056FBF0C056FBF0C05
      6FBF160AC5FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      013A1B1B1BE90101012C00000000000000000000000000000013000000130000
      0013000000130000001300000000B45900FB0D06004400000009000000130000
      0013000000130000001300000000000000000000000000000000000000001E80
      1EFF000100190001001900010019000100190001001901050136124A12C2124D
      12C700030028000000000000000000000000000000000000000000000000160A
      C5FF0C056FBF0C056FBF0C056FBF0C056FBF0C056FBF0C056FBF0C056FBF0C05
      6FBF160AC5FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000505056C0F0F0FAD000000000000000000000000131313C4000000132020
      20FF202020FF202020FF000000001F10006A0202024B202020FC202020FF0000
      001300000013131313C400000000000000000000000000000000000000001E80
      1EFF0001001900010019000100190001001900010019000100190001001C124C
      12C5124C12C5000000000000000000000000000000000000000000000000160A
      C5FF0C056FBF0C056FBF0C056FBF0C056FBF0C056FBF0C056FBF0C056FBF0C05
      6FBF160AC5FF0000000000000000000000000000000000000000191919E12020
      20FF202020FF202020FF202020FF202020FF0000000000000000000000000000
      0000000000141C1C1CEF00000000000000000000000000000013000000130000
      0013000000130000001300000000000000030000001200000013000000130000
      0013000000130000001300000000000000000000000000000000000000001E80
      1EFF00010019000100190001001900010019000100190106013A124E12C81148
      11C000020023000000000000000000000000000000000000000000000000160A
      C5FF0C056FBF0C056FBF0C056FBF0C056FBF0C056FBF0C056FBF0C056FBF0C05
      6FBF160AC5FF0000000000000000000000000000000000000000202020FF1B1B
      1BE8020202450000000000000000000000000000000000000000000000000000
      000000000005202020FB000000000000000000000000131313C4000000132020
      20FF202020FF202020FF00000014191919DD202020FF202020FF000000130000
      001300000013131313C400000000000000000000000000000000000000001E80
      1EFF0001001900010019000100190001001B071F077E1A6C1AEB0517056D0000
      000200000000000000000000000000000000000000000000000000000000160A
      C5FF0C056FBF0C056FBF0C056FBF0C056FBF0C056FBF0C056FBF0C056FBF0C05
      6FBF160AC5FF0000000000000000000000000000000000000000202020FF0101
      013A1B1B1BE80202024500000000000000000000000000000000000000000000
      000001010134171717D600000000000000000000000000000013000000130000
      001300000013000000130000000E000000130000001300000013000000130000
      0013000000130000001300000000000000000000000000000000000000001E80
      1EFF00010019000100190106013A124E12C8114811C000020023000000000000
      000000000000000000000000000000000000000000000000000000000000160A
      C5FF0C056FBF0C056FBF0C056FBF0C056FBF0C056FBF0C056FBF0C056FBF0C05
      6FBF160AC5FF0000000000000000000000000000000000000000202020FF0000
      00000101013A1B1B1BE802020245000000000000000000000000000000000000
      0002101010B306060676000000000000000000000000131313C4000000132020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF00000013131313C400000000000000000000000000000000000000001E80
      1EFF0001001B071F077E1A6C1AEB0517056D0000000200000000000000000000
      0000000000000000000000000000000000000000000000000000000000001108
      94DD160AC5FF160AC5FF160AC5FF160AC5FF160AC5FF160AC5FF160AC5FF160A
      C5FF110894DD0000000000000000000000000000000000000000202020FF0000
      0000000000000101013A1B1B1BE8070707790000001C0000000A010101391111
      11B6111111BC0000000600000000000000000000000000000013000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      0013000000130000001300000000000000000000000000000000000000001E80
      1EFF124E12C8114811C000020023000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000202020FF0000
      00000000000000000000000000210C0C0C9C191919E31E1E1EF3151515CD0606
      066F00000005000000000000000000000000000000000F0F0FAA000000131313
      13C400000013131313C400000013131313C400000013131313C4000000131313
      13C4000000130F0F0FAD00000000000000000000000000000000000000000F41
      0FB70517056D0000000200000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000605B58DCA29C95FEA09A
      94FEA09A94FEA09A94FEA09A94FEA09A94FEA09A95FEA09A93FEA09B93FEA099
      94FEA09A94FEA29B94FE615B58DC0000000000000000605B58DCA29C95FEA09A
      94FEA09A94FEA09A94FEA09A94FEA19B95FEB2ADA9FEA9B3A8FE3D7149FF1166
      27FF146B2AFF457A51FF737B71E2000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000002300000033000000330000
      0033000000330000003300000033000000330000003300000033000000330000
      00330000003300000033000000330000002300000000A6A19CFEFFFFFFFFFFFE
      FCFFFFFFFAFFFFFDF9FFFFFEF8FFFFFCF8FFFFFBF5FFFFFAF5FFFFF9F2FFFFF6
      F0FFFEF5EEFFFFF9EFFFA6A19AFE0000000000000000A6A19CFEFFFFFFFFFFFE
      FCFFFFFFFAFFFFFDF9FFFFFEF8FFFEFBF8FFD2DED2FF14642AFF159636FF189E
      3AFF149635FF118F31FF186B2FFF0000002C00000000060606710202024B0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F3FC0A2A2A2FFA09FA0FFA09F
      A0FFA1A0A0FFA09FA0FF9F9F9FFF9F9FA0FF9FA0A1FFA0A0A2FFA0A0A2FFA0A0
      A2FFA0A0A2FFA0A0A1FFA2A2A2FF3F3F3FC000000000A6A199FEFFFFFDFFE9E7
      E4FFE9E6E4FFEDEAE6FFFCF8F5FFFBF7F5FFFBF6F2FFFAF5F0FFFAF4EEFFF9F3
      ECFFF9F1EAFFFDF5ECFFA59F98FE0000000000000000A6A199FEFFFFFDFF5452
      4EFF54514EFF4E4B48FFC1BDBAFF8E8C8AFF376C44FF24AE48FF32C658FF33C9
      5AFF2BBB50FF1CA23FFF108E30FF03200BB700000000010101341B1B1BE80202
      024B000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A2A2A2FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFA2A2A2FF00000000A5A09AFEFFFFFFFF413E
      3BFF454240FF645F59FFFCFAF7FFFCF9F6FFFBF8F4FFFBF7F2FFFAF5F0FFFAF4
      EEFFF9F2ECFFFFF6EEFFA69F98FE0000000000000000A5A09AFEFFFFFFFFFDFC
      FAFFFDFBFAFFFDFBF9FFFCFAF7FFFCFBF9FF1B7833FF3BD964FF53ED7AFF5BEF
      82FF44E16CFF2FC155FF179D39FF09591EF70000000000000000010101341B1B
      1BE80202024B0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A0A0A0FFFFFFFFFFFFFFFFFFFFFF
      FFFF00772AFFFFFFFFFFFFFFFFFFFFFFFFFFD2944DFFCA7B26FFD8A365FFD9A3
      66FFC97A24FFD29147FFFFFFFFFFA0A0A1FF00000000A5A09BFEFFFFFFFFFEFD
      FDFFFEFDFEFFEDECEAFFEAE9E6FFEAE7E4FFEFECEAFFEDE9E6FFE5E2DDFFFAF5
      F0FFFAF4EDFFFEF7F1FFA69F99FE0000000000000000A5A09BFEFFFFFFFF4F4D
      49FF565352FF565350FF585652FFDCDAD9FF1D8037FF50EF79FFA6F7BCFFC0F9
      CFFF6DF392FF3AD462FF1FAC45FF07531BF70000000000000000000000000101
      01341B1B1BE80202024B00000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1A0A0FFFFFFFFFF47AE81FF007B
      31FF008136FF007629FFFFFFFFFFFFFFFFFFC97A25FFCB8330FFD69D5EFFCC84
      33FFCA812DFFF5EDE5FFFFFFFFFF9FA0A0FF00000000A5A29AFEFFFFFFFFFFFF
      FFFFFEFEFEFF5E5953FF413E3AFF403C39FF7C7976FF65625FFF33312EFFF7F2
      EEFFFAF5EFFFFEF8F1FFA69F99FE0000000000000000A5A29AFEFFFFFFFFFFFF
      FFFFFEFEFEFFFEFEFEFFFEFDFEFFFCFCFBFF559365FF4DE174FFB7FAC8FFD7FB
      E0FF76F498FF3CD864FF1EA643FF021C09B70000000000000000000000000000
      0000010101341B1B1BE80202024B0303034D121212C21F1F1FF81F1F1FFA1414
      14C703030356000000000000000000000000A2A0A1FFFFFFFFFF00782BFFFFFF
      FFFF00782CFFFFFFFFFFFEFBFEFFFAFFFFFFCF8C40FFD49C5AFFFFFFFFFFCC84
      33FFCB802CFFFBFFFFFFFFFFFFFF9F9F9FFF00000000A5A19AFEFEFEFEFFFEFE
      FEFFFEFEFEFFEFEEEEFFE9E9E8FFEEECECFFFDFCFBFFFDFAF8FFFCF9F6FFFBF7
      F3FFFAF5F0FFFFF9F4FFA69F99FE0000000000000000A5A19AFEFFFFFFFF5C58
      56FF5F5B59FF595551FF5A5753FFC9C8C7FF8D9A8DFF24843CFF5BE581FF72F8
      97FF4CED76FF2EBF54FF176B2CFF0000002D0000000000000000000000000000
      000000000000010101341D1D1DF2171717D90404045D00000020000000200404
      045B171717D60A0A0A920000000000000000A2A0A1FFFFFFFFFF007424FFFFFF
      FFFFFFFCFFFFFCF9FBFFF7F7F8FFF7FCFFFFF1ECE6FFD19148FFDEB68BFFCD85
      34FFCB802CFFF8FFFFFFFFFFFFFF9F9F9FFF00000001AFAFABFEEFFCFEFFD7F8
      FEFFCCF6FEFF7D9EA0FF687370FF777A76FFFDFCFDFFFDFBFAFFFCFAF7FFFCF8
      F5FFFBF6F2FFFFFBF4FFA6A098FE0000000000000000A5A19AFEFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFDFCFDFFD5E2D8FF569867FF2289
      3DFF20843AFF528C5FFFADB8ABFE000000000000000000000000000000000000
      0000000000000202024A171717DB000000280000001900000019000000190000
      001900000025171717D60303035700000000A0A0A0FFFFFFFFFFFEF7FBFFFAF9
      FEFFF8FAFFFFF6FAFFFFF5F8FDFFF5FBFFFFCC8432FFD1934BFFE0BE98FFCD85
      34FFCB802BFFF6FCFFFFFFFFFFFF9F9F9FFF0000000B98D0D4FEA1EEFEFF82DE
      FEFF74DAFFFF82DFFEFF9FEEFEFFB8F2F8FFEAECECFFE9E8E6FFEAE8E5FFEBE8
      E5FFE8E4E0FFFFFAF5FFA6A098FE0000000000000000A5A19AFEFFFFFFFF6662
      60FF676361FF676460FFC3C2C1FF5E5A58FF55524FFFC9C8C7FF999795FFDCDA
      D8FFA09E9CFFFEFAF7FFB1ACA5FE000000000000000000000000000000000000
      000000000000121212BC04040462000000190000001900000019000000190000
      0019000000190404045B141414C7000000009F9F9FFFFFFFFFFFF2F5F8FFDBAF
      80FFCC822FFFCA7A24FFD9AB76FFF4FDFFFFCA7A25FFD1914BFFF5FFFFFFCC83
      31FFCA7C28FFF2F8FEFFFFFFFFFF9F9F9FFF0000000F84D3DFFE67E2FFFF31BC
      FFFF38B5FFFF33BEFFFF66E3FFFF74C1D0FF697371FF4B4743FF423E39FF5954
      4EFF3F3B37FFFFFCF7FFA6A09AFE0000000000000000A5A19AFEFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFDFEFFFDFBFAFFFCF9
      F7FFFBF8F4FFFFFCF7FFA6A09AFE000000000000000000000000000000000000
      0000000000001D1D1DF100000027000000190000001900000019000000190000
      001900000019000000201F1F1FFA000000009F9F9FFFFFFFFFFFEFF3F8FFC977
      1FFFF1F9FFFFCE8A3DFFCB7C28FFF1FAFFFFE1C9AFFFCD8432FFCA7B26FFCB7C
      27FFD8A973FFEFF1F5FFFFFFFFFF9F9F9FFF000000286AC6E3FE33BEFFFF6CCE
      FFFF62C3FFFF6CCFFFFF30BDFEFF7DDBFBFFD7F8FEFFFDFEFCFFFDFCFAFFFCFA
      F7FFFBF8F4FFFDF9F4FFA69F99FE0000000000000000A5A19AFEFFFFFFFF726E
      6AFFC9C8C8FF65615DFF65625EFF605C58FFC4C3C2FF65635FFF5C5855FF5A55
      52FFFBF8F4FFFFFBF6FFA69F99FE000000000000000000000000000000000000
      0000000000001D1D1DF100000028000000190000001900000019000000190000
      001900000019000000201F1F1FF9000000009F9F9FFFFFFFFFFFECF2F7FFCA79
      23FFEDF7FFFFCF8A3DFFCB7D28FFEDF4FBFFECF0F4FFEDF2F7FFEAEBEBFFEAEB
      EAFFECF0F4FFEAECECFFFFFFFFFF9F9F9FFF0001013362C6E9FF3BB5FFFF62C4
      FFFFF8FFFFFF62C4FFFF32ABF5FF55B9DEFFCCF6FEFFFDFDFEFFFDFCFBFFFCFA
      F8FFFCF8F5FFFFFBF8FFA69F99FE0000000000000000A5A19AFEFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFDFCFBFFFCFA
      F8FFFCF8F5FFFFFBF8FFA69F99FE000000000000000000000000000000000000
      000000000000121212BC05050565000000190000001900000019000000190000
      0019000000190404045D131313C4000000009F9F9FFFFFFFFFFFEAEFF5FFCB7B
      25FFCF8E45FFCB7C27FFD5A064FFEAEDF1FFE9E9E9FFE8E8E8FFE9E9E9FFE9E9
      E9FFE8E8E8FFE7E6E5FFFFFFFFFF9F9F9FFF000000286AC5E3FE31BEFFFF6CCF
      FFFF62C3FFFF6CCEFFFF32BDFEFF7CDBFAFFD0F0F6FFEFEEEEFFEEEDEBFFEFEC
      E9FFFCF8F5FFFFFBF8FFA69F99FE0000000000000000A5A19AFEFFFFFFFF827B
      78FF76706DFF605B57FFC7C6C5FF595652FF686662FF716D6BFFC7C6C4FF7774
      70FF5B5754FFFFFBF8FFA69F99FE000000000000000000000000000000000000
      0000000000000202024A191919DE0000002B0000001900000019000000190000
      001900000028171717DA03030352000000009FA0A0FFFFFFFFFFE6EEF5FFCA7A
      22FFE8F3FDFFE7EEF4FFE6EAEEFFE5E7E7FFE5E5E4FFE4E5E4FFE4E5E4FFE4E5
      E4FFE4E4E3FFE3E3E2FFFFFFFFFF9F9F9FFF0000000F86D1DEFE66E3FFFF2AB5
      F5FF30ADF7FF26B1F3FF57D1EDFF70C1CEFF97A29FFF76716EFF6B6662FF716C
      67FFFCF8F5FFFFFBF6FFA69F99FE0000000000000000A5A19AFEFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFDFCFBFFFCFB
      F9FFFCF8F5FFFFFBF6FFA69F99FE000000000000000000000000000000000000
      0000000000000000000008080881191919DE0505056500000028000000270404
      0462171717DB0909098A0000000000000000A0A0A0FFFFFFFFFFD09959FFC976
      1CFFE2E2E0FFE2E3E4FFE1E1E1FFE1E0DFFFE1E0DFFFE1E0DFFFE1E0DFFFE1E0
      DFFFE1E0DFFFE1DFDEFFFFFFFFFFA0A0A0FF0000000599D1D4FE9FEEFEFF82DF
      FEFF74DAFFFF82DEFEFFA1EEFEFFBDF7FEFFF8FEFEFFFEFEFEFFFFFFFFFFFFFF
      FEFFFFFEFBFFFFFFFCFFA7A29CFE0000000000000000A8A39DFEFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FEFFFFFEFBFFFFFFFCFFA7A29CFE000000000000000000000000000000000000
      000000000000000000000000000002020249111111BC1D1D1DF11D1D1DF21212
      12BF0303034E000000000000000000000000A2A2A2FFFFFFFFFFFFFFFFFFFCEB
      D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFA2A2A2FF000000006A6B66DDB4BDBAFEA5C3
      C5FE9CC3C8FEA3C1C4FEADB6B4FEACABA7FEA9A59FFEA59E9AFEA6A099FEA49F
      99FEA09A95FEA29C96FE615B58DC0000000000000000605C58DCA39D97FEA19B
      95FEA19B95FEA19B95FEA19B95FEA19B95FEA19C95FEA19A96FEA29B94FEA09B
      95FEA09A95FEA29C96FE615B58DC000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000888989EFA2A2A2FFA0A1A2FFA0A2
      A3FFA0A1A2FF9FA0A0FF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F
      9FFF9F9F9FFFA0A0A0FFA2A2A2FF888888EF0000000000000000000000000000
      000000000000000000000000000000000000191919E1202020FF202020FF2020
      20FF202020FF202020FF191919E1000000000000000000000000191919E12020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF191919E100000000000000000000000000000000605B58DCA29C95FEA09A
      94FEA09A94FEA09A94FEA09A94FEA09A94FEA09A95FEA09A93FEA09B93FEA099
      94FEA09A94FEA29B94FE615B58DC0000000000000000605B58DCA29C95FEA09A
      94FEA09A94FEA09A94FEA09A94FEA19B95FEB2ADA9FEA9B4B5FE407684FF126C
      80FF126D83FF407986FF727B7DE2000000000000000000000000191919E12020
      20FF202020FF202020FF202020FF00000000202020FF00000019000000190000
      00190000001900000019202020FF000000000000000000000000202020FF0000
      0019000000190000001900000019000000190000001900000019000000190000
      0019202020FF00000000000000000000000000000000A6A19CFEFFFFFFFFFFFE
      FCFFFFFFFAFFFFFDF9FFFFFEF8FFFFFCF8FFFFFBF5FFFFFAF5FFFFF9F2FFFFF6
      F0FFFEF5EEFFFFF9EFFFA6A19AFE0000000000000000A6A19CFEFFFFFFFFFFFE
      FCFFFFFFFAFFFFFDF9FFFFFEF8FFFEFBF8FFD3DFDFFF196D7DFF1BA1BEFF1EA9
      C6FF19A2BEFF1397B3FF146B80FF0000002C0000000000000000202020FF0000
      001900000019000000190000001900000000202020FF00000019000000190000
      00190000001900000019202020FF000000000000000000000000202020FF0000
      0019000000190000001900000019000000190000001900000019000000190000
      0019202020FF00000000000000000000000000000000A6A199FEFFFFFDFFE6EC
      E4FFE6EBE4FFE7EBE4FFFCF8F5FFFBF7F5FFFBF6F2FFFAF5F0FFFAF4EEFFF9F3
      ECFFF9F1EAFFFDF5ECFFA59F98FE0000000000000000A6A199FEFFFFFDFFE9E7
      E4FFE9E6E4FFEDEAE6FFFCF8F5FFFBF8F7FF508C96FF27B5D2FF32CCE9FF34CD
      E9FF2EC3DFFF21ADC9FF1397B3FF022025B70000000000000000202020FF0000
      001900000019000000190000001900000000202020FF00000019000000190000
      00190000001900000019202020FF000000000000000000000000202020FF0000
      001900000019202020FF00000019202020FF00000019202020FF000000190000
      0019202020FF00000000000000000000000000000000A5A09AFEFFFFFFFF2471
      38FF28713CFF2B703DFFFCFAF7FFFCF9F6FFFBF8F4FFFBF7F2FFFAF5F0FFFAF4
      EEFFF9F2ECFFFFF6EEFFA69F98FE0000000000000000A5A09AFEFFFFFFFF413E
      3BFF454240FF645F59FFFCFAF7FFFCFBF9FF1E8194FF3BDCF8FF55E9FFFF5DEC
      FFFF45E1FDFF30C7E3FF1DA8C6FF0B5E70F70000000000000000202020FF0000
      001900000019000000190000001900000000202020FF00000019000000190000
      00190000001900000019202020FF000000000000000000000000202020FF0000
      001900000019202020FF00000019202020FF00000019202020FF000000190000
      0019202020FF00000000000000000000000000000000A5A09BFEFFFFFFFFFEFD
      FDFFFEFDFEFFE8F2F3FFE7F0F0FFE7EDEEFFEDF0EFFFEAECEAFFE3E5E2FFFAF5
      F0FFFAF4EDFFFEF7F1FFA69F99FE0000000000000000A5A09BFEFFFFFFFFFEFD
      FDFFFEFDFEFFEDECEAFFEAE9E6FFF2F1EFFF218799FF54ECFFFF96FBFFFFACFE
      FFFF6CF1FFFF3BD7F4FF25B5D1FF0C5C6EF70000000000000000202020FF0000
      001900000019000000190000001900000000202020FF00000019000000190000
      00190000001900000019202020FF000000000000000000000000202020FF0000
      001900000019202020FF00000019202020FF00000019202020FF000000190000
      0019202020FF00000000000000000000000000000000A5A29AFEFFFFFFFFFFFF
      FFFFFEFEFEFF2D9DB5FF2893A9FF26899EFF6DACB9FF5197A4FF1A6474FFF7F2
      EEFFFAF5EFFFFEF8F1FFA69F99FE0000000000000000A5A29AFEFFFFFFFFFFFF
      FFFFFEFEFEFF5E5953FF413E3AFF7B7977FF458590FF50E1F8FFA4FFFFFFC5FF
      FFFF72F3FFFF3CDAF6FF24AFCCFF031F25B70000000000000000202020FF0000
      001900000019000000190000001900000000202020FF00000019000000190000
      00190000001900000019202020FF000000000000000000000000202020FF0000
      001900000019202020FF00000019202020FF00000019202020FF000000190000
      0019202020FF00000000000000000000000000000000A5A19AFEFFFFFFFFFFFF
      FFFFFFFFFFFFF4F0EAFFF1ECE5FFF4EFEAFFFDFCFBFFFDFAF8FFFCF9F6FFFBF7
      F3FFFAF5F0FFFFF9F4FFA69F99FE0000000000000000A5A19AFEFFFFFFFFFFFF
      FFFFFFFFFFFFEFEEEEFFEAEAE9FFF0EEEEFFD5E4E7FF2C8C9CFF5DE4F6FF6FF7
      FFFF50EAFFFF2FC4E0FF1B7184FF0000002D0000000000000000202020FF0000
      001900000019000000190000001900000000191919DD202020FF202020FF2020
      20FF202020FF202020FF191919DD000000000000000000000000202020FF0000
      001900000019202020FF00000019202020FF00000019202020FF000000190000
      0019202020FF00000000000000000000000000000000A5A19AFEFFFFFFFFFFFF
      FFFFFFFFFFFFA16F2EFF8A5611FF9A703DFFFEFDFEFFFDFBFAFFFCFAF7FFFCF8
      F5FFFBF6F2FFFFFBF4FFA6A098FE0000000000000000A5A19AFEFFFFFFFFFFFF
      FFFFFFFFFFFF5F5B54FF3D3833FF64615DFFFDFCFDFFD5E4E7FF5999A6FF258E
      A2FF22879CFF54909CFFAEB9B9FE000000000000000000000000202020FF0000
      00190000001900000019000000190000000F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000202020FF0000
      001900000019202020FF00000019202020FF00000019202020FF000000190000
      0019202020FF00000000000000000000000000000000A5A19AFEFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDFAFFE8E8F8FFE7E6F4FFE6E4F2FFE5E2
      EEFFE2DFEAFFFFFAF5FFA6A098FE0000000000000000A5A19AFEFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEEFFEAE9E9FFECEBE9FFF0EEECFFF3F1
      F0FFF1EFEDFFFEFAF7FFB1ACA5FE000000000000000000000000202020FF0000
      0019000000190000001900000019000000190000001900000019000000190000
      0019202020FF0000000000000000000000000000000000000000202020FF0000
      001900000019202020FF00000019202020FF00000019202020FF000000190000
      0019202020FF00000000000000000000000000000000A5A19AFEFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF5353D3FF2B2BC4FF2D2DC0FF2727BBFF2B2A
      B8FF1616AAFFFFFCF7FFA6A09AFE0000000000000000A5A19AFEFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF696560FF413B36FF45413DFF423E39FF5954
      4EFF3F3B37FFFFFCF7FFA6A09AFE000000000000000000000000202020FF0000
      0019000000190000001900000019000000190000001900000019000000190000
      0019202020FF0000000000000000000000000000000000000000202020FF0000
      001900000019202020FF00000019202020FF00000019202020FF000000190000
      0019202020FF00000000000000000000000000000000A5A19AFEFFFFFFFFFFFF
      FFFFFFFFFFFFF8F3ECFFF6F1E9FFF8F4EEFFFFFFFFFFFEFFFDFFFDFCFAFFFCFA
      F7FFFBF8F4FFFDF9F4FFA69F99FE0000000000000000A5A19AFEFFFFFFFFFFFF
      FFFFFFFFFFFFF0EFEFFFEDECECFFF1F0F0FFFFFFFFFFFEFFFDFFFDFCFAFFFCFA
      F7FFFBF8F4FFFDF9F4FFA69F99FE000000000000000000000000202020FF0000
      0019000000190000001900000019000000190000001900000019000000190000
      0019202020FF0000000000000000000000000000000000000000202020FF0000
      0019000000190000001900000019000000190000001900000019000000190000
      0019202020FF00000000000000000000000000000000A5A19AFEFFFFFFFFFFFF
      FFFFFFFFFFFFC18B43FFB77D35FFBD9156FFFFFFFFFFFEFEFFFFFDFCFBFFFCFA
      F8FFFCF8F5FFFFFBF8FFA69F99FE0000000000000000A5A19AFEFFFFFFFFFFFF
      FFFFFFFFFFFF645F59FF545049FF6F6A67FFFFFFFFFFFEFEFFFFFDFCFBFFFCFA
      F8FFFCF8F5FFFFFBF8FFA69F99FE000000000000000000000000191919DD2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF191919DD0000000000000000000000000000000000000000202020FF0000
      0019000000190000001900000019000000190000001900000019000000190000
      0019202020FF00000000000000000000000000000000A5A19AFEFFFFFFFFECF5
      EFFFECF5EFFFEAF3EDFFEBF4EDFFEAF3ECFFEDF4EFFFEBF2EDFFEAF0EBFFE9EE
      E7FFFCF8F5FFFFFBF8FFA69F99FE0000000000000000A5A19AFEFFFFFFFFF0F0
      EFFFF1F1F0FFEFEFEEFFF0F0EFFFEFEFEEFFF1F0F0FFEFEEEEFFEEEDEBFFEFEC
      E9FFFCF8F5FFFFFBF8FFA69F99FE000000000000000000000000000000000000
      0000202020FF202020FF101010B3000000080F0F0FAC202020FF202020FF0000
      00000000000000000000000000000000000000000000202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF000000000000000000000000A5A19AFEFFFFFFFF4CA2
      62FF449B59FF318F49FF429658FF2D8945FF4E9A62FF48955BFF418E55FF3D8A
      50FFFCF8F5FFFFFBF6FFA69F99FE0000000000000000A5A19AFEFFFFFFFF7672
      6DFF6F6B66FF625D57FF6E6965FF5F5A55FF7C7873FF716C69FF6B6662FF716C
      67FFFCF8F5FFFFFBF6FFA69F99FE000000000000000000000000000000000000
      00000000000004040464111111B6000000100F0F0FB00505056C000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000202020FF000000000000000000000000202020FF000000000000
      00000000000000000000000000000000000000000000A8A39DFEFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FEFFFFFEFBFFFFFFFCFFA7A29CFE0000000000000000A8A39DFEFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FEFFFFFEFBFFFFFFFCFFA7A29CFE000000000000000000000000000000000000
      000000000000000000080E0E0EAB1E1E1EF40F0F0FB00000000B000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000121212BE202020FF202020FF202020FF141414C6000000000000
      00000000000000000000000000000000000000000000605C58DCAAA49FFEA7A1
      9CFEA19B95FEA59F99FEA19B95FEA19B95FEA5A099FEA69F9BFEA6A099FEA49F
      99FEA09A95FEA29C96FE615B58DC0000000000000000605C58DCAAA49FFEA7A1
      9CFEA19B95FEA59F99FEA19B95FEA19B95FEA5A099FEA69F9BFEA6A099FEA49F
      99FEA09A95FEA29C96FE615B58DC000000000000000000000000000000000000
      000000000000000000000000000000000000011607A70D531FF7000501870000
      000A000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000010702AFE75FF9EFF3ABE5AFF0633
      13E30000005000000000000000000000000000000000121212BF121212BF1212
      12BF121212BF121212BF121212BF121212BF121212BF121212BF121212BF1212
      12BF121212BF121212BF121212BF0000000000000000191919E1202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF191919E1000000000000
      0000000000000000000000000000000000000000000000000000000000000303
      03501B1B1BEB1C1C1CED030303560000000000000000030303501B1B1BEB1C1C
      1CED030303560000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000E6826FF66F98CFF5EF185FF4DE5
      72FF188234FF021607C200000022000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000202020FF000000190000
      00190000001900000019000000190000001900000019202020FF000000000000
      0000000000000000000000000000000000000000000000000000000000001A1A
      1AE50202024C020202441C1C1CED00000000000000001A1A1AE50202024C0202
      02441C1C1CED0000000000000000000000000000000000000000000000000505
      178F21218FFD202092FF201F91FF7877BBFF0E6626FF48D96CFF3FCA62FF39C4
      5DFF35BF58FF25AB47FF0B511DF70003016E00000000202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF0000
      00000000000000000000000000000000000000000000202020FF000000190000
      00190000001900000019000000190000001900000019202020FF000000000000
      0000000000000000000000000000000000000000000000000000000000001919
      19E3030303530202024C1B1B1BEB0000000000000000191919E3030303530202
      024C1B1B1BEB0000000000000000000000000000000000000000000000001A19
      7AF46469FAFF7A85FFFF7783FEFF9AA1FBFF0E6325FF30B551FF2AAA4AFF24A0
      44FF20973FFF239440FF2E9849FF094B1BF900000000202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF0000
      00000000000000000000000000000000000000000000202020FF000000190000
      00190000001900000019000000190000001900000019202020FF131313C21313
      13C2131313C2131313C20F0F0FAA000000000000000000000000000000000202
      024A191919E31D1D1DF10A0A0A900000000000000000090909891D1D1DF01A1A
      1AE5030303500000000000000000000000000000000000000000000000001616
      78F5696FFAFF8896FFFF8693FFFFA4AEFCFF0E6326FF36A552FF389A51FF4198
      57FF529A63FF47985CFF146629FA010A03850000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000202020FF000000190000
      00190000001900000019000000190000001900000019202020FF000000130000
      00130000001300000013131313C2000000000000000000000000000000000000
      000000000000000000100F0F0FB200000014000000100F0F0FB2000000140000
      0000000000000000000000000000000000000000000000000000000000001010
      73F56369F7FF7683FFFF7481FEFF989FFBFF126429FF56A269FF619B70FF619A
      70FF298341FF073213CD000000280000000000000000020202420D0600458642
      00D90B05003F0202024C121212BE121212BF121212BF121212BF121212BF1212
      12BF121212BF121212BF121212BF0000000000000000202020FF000000190000
      00190000001900000019000000190000001900000019202020FF000000130000
      00130000001300000013131313C2000000000000000000000000000000000000
      000000000000000000000505056A0505056B0505056506060670000000000000
      0000000000000000000000000000000000000000000000000000000000000C0C
      6EF55B60F0FF6870F7FF676FF6FF969BF6FF1E7A36FF7BA788FF49975DFF2679
      44FF59778AFE000000000000000000000000000000000D0600459A4D00E8BA5C
      00FF9B4D00E90B05003F00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000202020FF000000190000
      00190000001900000019000000190000001900000019202020FF000000130000
      00130000001300000013131313C2000000000000000000000000000000000000
      0000000000000000000000000013141414C5141414C500000017000000000000
      0000000000000000000000000000000000000000000000000000000000000B0A
      76FD565AEAFF5C62EFFF575DEDFF8C8FF1FF4A9482FF268242FF4A837CFF878D
      E5FF212178F5000000000000000000000000030100249A4D00E80904003ABA5C
      00FF0B05003F9A4D00E80201001C000000000000000000000000000000000000
      00000000000000000000000000000000000000000000202020FF000000190000
      00190000001900000019000000190000001900000019202020FF000000130000
      00130000001300000013131313C2000000000000000000000000000000000000
      00000000000000000000000000001C1C1CEF1E1E1EF700000000000000000000
      0000000000000000000000000000000000000000000000000000000000000505
      77FF6063E6FF6D6FEAFF6C6EE9FF8384EBFF8D8FECFF9495ECFF8E8FECFF6768
      E4FF040467F5000000000000000000000000000000000201001E00000000BA5C
      00FF000000000201001B00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000202020FF000000190000
      00190000001900000019000000190000001900000019202020FF000000130000
      00130000001300000013131313C2000000000000000000000000000000000000
      000000000000000000000000000B131313C3141414C60000000E000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      73FF6E6FE4FF8283E9FF8081E8FF8081E8FF8081E8FF8081E8FF8283E9FF6A6B
      E1FF000064F5000000000000000000000000000000000000000000000000BA5C
      00FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000202020FF000000190000
      00190000001900000019000000190000001900000019202020FF000000130000
      00130000001300000013131313C2000000000000000000000000000000000000
      000000000000000000000404045C070707790606067304040462000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      6AFD6767DBFF7C7CE2FF7A7AE1FF7A7AE1FF7A7AE1FF7A7AE1FF7C7CE2FF6261
      D9FF00005EF4000000000000000000000000000000000000000000000000BA5C
      00FF000000000000000000000000BA5C00FF0000000000000000000000000000
      00000000000000000000000000000000000000000000191919DD202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF191919E0000000130000
      00130000001300000013131313C2000000000000000000000000000000000000
      000000000000000000090F0F0FAE0000001E000000190F0F0FB00000000C0000
      0000000000000000000000000000000000000000000000000000000000000000
      1598000067FD00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF0000
      67FD0000118F000000000000000000000000000000000000000000000000B459
      00FB000000050000000000000003B85C00FE0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000131313C2000000130000001300000013000000130000
      00130000001300000013131313C2000000000000000000000000000000000000
      000000000000030303570808087E0000000000000000070707770404045D0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006834
      00BF2A15007B0000000C271300766E3700C40000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000131313C2000000130000001300000013000000130000
      00130000001300000013131313C2000000000000000000000000000000000000
      0000000000060E0E0EAC0000002200000000000000000000001D0F0F0FAF0000
      0009000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000201
      001F673300BEAC5500F56B3400C1030100210000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000E0E0EA7131313C2131313C2131313C2131313C21313
      13C2131313C2131313C20E0E0EA7000000000000000000000000000000000000
      0000000000050707077A00000000000000000000000000000000070707770000
      0008000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000900000000000000000000000000000000000000090000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000160A0A0A941A1A1AE6202020FF1B1B1BE80B0B0B97000000190000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000080400372C15007D0A05003C00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000080400372C15007D0904003B00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00261A1A1AE5202020FF202020FF202020FF202020FF202020FF1B1B1BE90000
      002B000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010B40202024500000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000007030034B45A00FBBA5C00FFB65A00FD0A05003C000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000007030034B45A00FBBA5C00FFB65A00FD0905003B000000000000
      0000000000000000000000000000000000000000000000000000000000021515
      15CD202020FF202020FF202020FF202020FF202020FF202020FF202020FF1717
      17D3000000030000000000000000000000000000000000000000000000000000
      0000000000000000000000000000202020FF24282AF602020245000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000026130075BA5C00FFBA5C00FFBA5C00FF2C16007D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000026130075BA5C00FFBA5C00FFBA5C00FF2C16007D000000000000
      0000000000000000000000000000000000000000000000000000020202402020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF020202470000000000000000000000000000000000000000000000000000
      0000000000000000000000000000202020FF7DB7CDFF24282AF6020202450000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000006030031B25800FABA5C00FFB45A00FB08040037000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000006030031B25800FABA5C00FFB45A00FB08040038000000000000
      0000000000000000000000000000000000000000000000000000060606722020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF0707077A020202420000001D0000000000000000191919E1202020FF2020
      20FF202020FF202020FF202020FF303A3EFF99E3FFFF7DB7CDFF24282AF60202
      0245000000000000000000000000000000000000000000000000000000000000
      0000000000000000000006030031261300750703003400000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000006030031261300750703003500000000000000000000
      0000000000000000000000000000000000000000000000000000060606722020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF0707077A040404620F0F0FAC0000001200000000202020FF99E3FFFF99E3
      FFFF99E3FFFF99E3FFFF99E3FFFF99E3FFFF99E3FFFF99E3FFFF7DB7CDFF2428
      2AF6020202450000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000007000000080000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000101013C2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF0202024508080881121212BF0606066F00000000202020FF99E3FFFF99E3
      FFFF99E3FFFF99E3FFFF99E3FFFF99E3FFFF99E3FFFF99E3FFFF99E3FFFF7DB7
      CDFF24282AF60202024500000000000000000000000000000000000000000000
      000000000000000000000B05003F7F3F00D30D06004500000000000000000000
      000000000000000000000000000000000000000000004B2500A21F0F00690000
      000000000000000000000000000000000000000000002E170080BA5C00FFBA5C
      00FFBA5C00FF914800E100000000000000000000000000000000000000011414
      14C8202020FF202020FF202020FF202020FF202020FF202020FF202020FF1515
      15CE00000010111111B7121212BF0E0E0EAC00000000202020FF99E3FFFF99E3
      FFFF99E3FFFF99E3FFFF99E3FFFF99E3FFFF99E3FFFF99E3FFFF99E3FFFF99E3
      FFFF648E9EFF171717D900000000000000000000000000000000000000000000
      0000000000000B05003F9D4E00EBBA5C00FF9D4E00EB0D060045000000000000
      000000000000000000000000000000000000000000000A05003C8E4600DF0000
      000D000000000000000000000000000000000000000000000000000000000000
      000B8B4400DCBA5C00FF00000000000000000000000000000000000000000000
      0022191919E0202020FF202020FF202020FF202020FF202020FF1A1A1AE30000
      002606060675121212BF121212BF121212BF00000000202020FF99E3FFFF99E3
      FFFF99E3FFFF99E3FFFF99E3FFFF99E3FFFF99E3FFFF99E3FFFF99E3FFFF7AB3
      C8FF232627F40101013F00000000000000000000000000000000000000000000
      00000B05003F9D4E00EB0D060045BA5C00FF0B05003F9D4E00EB0D0600450000
      00000000000000000000000000000000000000000000000000003E1F00946431
      00BB0000000E00000000000000000000000000000000000000000000000C5F2E
      00B640200096BA5C00FF00000000000000000000000000000000000000000000
      0000000000130909098B191919DD1E1E1EF7191919E00A0A0A8F000000160505
      0563121212BF121212BF121212BF0F0F0FAC00000000202020FF99E3FFFF99E3
      FFFF99E3FFFF99E3FFFF99E3FFFF99E3FFFF99E3FFFF99E3FFFF7AB3C8FF2326
      27F40101013F0000000000000000000000000000000000000000000000000000
      00005F2F00B60D06004500000000BA5C00FF000000000B05003F643100BB0000
      0001000000000000000000000000000000000000000000000000000000043E1F
      00948E4600DF1E0F00680201001F000000080201001E1D0E00668D4600DE4020
      009600000004BA5C00FF00000000000000000402256F01000C3F000000000000
      00000100093A05022975000000040000000600000013020202430B0B0B981212
      12BF121212BF121212BF121212BF0606066F00000000191919DD202020FF2020
      20FF202020FF202020FF202020FF2E373AFF99E3FFFF7AB3C8FF232627F40101
      013F000000000000000000000000000000000000000000000000000000000000
      0000000000010000000000000000BA5C00FF0000000000000000000000010000
      0000000000000000000000000000000000000000000000000000000000000000
      00000905003B4F2700A7944900E4AE5600F7964A00E5502800A80A05003D0000
      0000000000002E17008000000000000000000100083412089CE301000C3F0100
      093A12089DE40100093A0000000B0E0E0EA5121212BF121212BF121212BF1212
      12BF121212BF121212BF0F0F0FAC000000120000000000000000000000000000
      0000000000000000000000000000202020FF7AB3C8FF232627F40101013F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BA5C00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000100083412089CE31208
      9DE40100093A0000000000000000000000170A0A0A93121212BF121212BF1212
      12BF121212BF0C0C0C9A0000001D000000000000000000000000000000000000
      0000000000000000000000000000202020FF232627F40101013F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BA5C00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000100093A12089DE41208
      9CE301000C3F000000000000000000000000000000000101012C030303540303
      0356010101300000000100000000000000000000000000000000000000000000
      00000000000000000000000000000E0E0EAC0101013F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BA5C00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000100093A12089DE40100093A0100
      083412089CE301000C3F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BA5C00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000402256F0100093A000000000000
      0000010008340402287400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0001000000060000000F000000150000001600000016000000150000000F0000
      0006000000010000000000000000000000000000000000000000000000000000
      0000000001150603348510068DD81409B9F71409B6F60F068DD7060333830000
      0113000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000001140301206709044FA20C056FBF0C056FBF090451A40301216A0000
      0116000000000000000000000000000000000000000000000000000000030000
      000E000000200000003400000040000000430000004300000040000000340000
      00200000000E0000000300000000000000000000000000000000000000000201
      15551408B1F2100796DE0E057FCD0C0672C20C0672C20E057FCD100796DE1408
      AEF0020014520000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000100
      0D430B0460B20402287401000834000001160000011600000733040226710B04
      61B301000F480000000000000000000000000000000000000003000000120000
      002D01010669151D5DD12939BFFF2939BEFF2939BEFF2939BFFF151D5DD10101
      06690000002D0000001200000003000000000000000000000000020115551309
      ADF00E067DCB0B056FBF0B056FBF0B056FBF0B056FBF0B056FBF0B056FBF0E06
      7DCB1309AEF00200135100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000001000D430A04
      5BAD000007320000011300000113000001130000011300000113000001130000
      062F0A0459AB01000F480000000000000000000000010000000E0000002D0C10
      37B43142C7FF4F62EBFF6376FFFF5869DBFF5261CCFF5060D0FF4F62EBFF3142
      C7FF0C1037B40000002D0000000E0000000100000000000001161408B1F20E06
      7DCB0B056FBF0B056FBF0B056FBF0B056FBF0B056FBF0B056FBF0B056FBF0B05
      6FBF0E067DCB1408AEF000000114000000000000000000000000000000000000
      000000000000000000000000001E0000003300000033000000330000001E0000
      00000000000000000000000000000000000000000000000000120B0460B20000
      0733000001130000011300000113000001130000011300000113000001130000
      01130000062F0B0561B3000001160000000000000006000000200C1035B13344
      CAFF5E70FEFF5F72FEFF5E71FDFF15786DFF00C684FF058552FF4F5FD5FF5E70
      FEFF3344CAFF0C1035B100000020000000060000000006033686100795DF0B05
      6FBF0B056FBF0B056FBF0B056FBF0B056FBF0B056FBF0B056FBF0B056FBF0B05
      6FBF0B056FBF100796DE05023383000000000000000000000000000000000000
      0000000000000000001E312307ACB78317FFB68216FFB78317FF312307AC0000
      001E000000000000000000000000000000000000000003011D6305022A760000
      0113000001130000011300000113000001130000011300000113000001130000
      011300000113040226710302216A000000000000000F0101055D3040C7FF4C5D
      D9FF4757CAFF4556C8FF4555C7FF008846FF00E4A6FF00BE80FF0C805FFF4D5F
      DCFF596DFCFF3040C7FF0101055D0000000F0000000011078FDA0E057FCD0B05
      6FBF0B056FBF0B056FBF0B056FBF0B056FBF0B056FBF0B056FBF0B056FBF0B05
      6FBF0B056FBF0E057FCD0F068DD7000000000000000000000000000000000000
      000000000000312307ACC5922DFFEDC072FFF1C478FFEDC072FFC5922DFF3123
      07AC000000000000000000000000000000000000000008044A9D010009380000
      0113000001130000011300000113000001130000011300000113000001130000
      01130000011300000733090451A40000000000000015151C5BCD4659E6FF1377
      6DFF008A47FF008846FF008745FF008846FF00D9A1FF00D8A0FF00BC80FF1575
      72FF495CD9FF4659E6FF151C5BCD00000015000000001409B6F60C0672C20B05
      6FBF0B056FBF0B056FBF0B056FBF0B056FBF0B056FBF0B056FBF0B056FBF0B05
      6FBF0B056FBF0C0673C31409B4F5000000000000000000000000000000000000
      000000000000B78418FFEAB45AFFE9B45AFFE8B359FFE9B45AFFEAB45AFFB784
      18FF00000000000000000000000000000000000000000C0567B80000021B0000
      0113000001130000011300000113000001130000011300000113000001130000
      011300000113000001160D056FBF00000000000000162B3ABFFF4E63F6FF0089
      46FF41E7C2FF00D7A0FF00D7A0FF00D59FFF00D09CFF00D09CFF00D39FFF00B9
      81FF137670FF4E63F6FF2B3ABFFF00000016000000001409B9F70C0672C20B05
      6FBF0B056FBF0B056FBF0B056FBF0B056FBF0B056FBF0B056FBF0B056FBF0B05
      6FBF0B056FBF0C0672C21409B6F6000000000000000000000000000000000000
      000000000000B78217FFEBB962FFE3A63FFFE3A63FFFE3A63FFFEBB962FFB782
      17FF00000000000000000000000000000000000000000C0567B80000021C0000
      0113000001130000011300000113000001130000011300000113000001130000
      011300000113000001160D056FBF00000000000000162A39BFFF5F73F8FF0088
      44FF6DE7D0FF00C899FF00C899FF00C899FF00C797FF00C898FF00CA9AFF61E5
      CDFF008A46FF5F73F8FF2A39BFFF0000001600000000110790DB0E057FCD0B05
      6FBF0B056FBF0B056FBF0B056FBF0B056FBF0B056FBF0B056FBF0B056FBF0B05
      6FBF0B056FBF0E057FCD10078ED9000000000000000000000000000000000000
      000000000000B78317FFEEC684FFE5AA47FFE2A63FFFE5AA47FFEEC684FFB783
      17FF00000000000000000000000000000000000000000804499C01000A390000
      0113000001130000011300000113000001130000011300000113000001130000
      0113000001130100083509044FA200000000000000152838BFFF7085F9FF0089
      45FF99EFE4FF4DE8D5FF4FE7D4FF4BE5D1FF94E7D8FF00C397FF5EDFC7FF00B2
      81FF137980FF7085F9FF2838BFFF000000150000000006033787100796DE0B05
      6FBF0B056FBF0B056FBF0B056FBF0B056FBF0B056FBF0B056FBF0B056FBF0B05
      6FBF0B056FBF100795DF06033485000000000000000000000000000000000000
      000000000000251B0597C6922CFFECC482FFEFC886FFECC482FFC6912AFF251B
      0597000000000000000000000000000000000000000003011C6105022C790000
      0113000001130000011300000113000001130000011300000113000001130000
      0113000001130402287403012067000000000000000F2838C0FF94A2F7FF0F76
      78FF008945FF008743FF008641FF008846FF82E3D6FF58D9C4FF00AD7DFF1375
      81FF3751EDFF94A2F7FF2838C0FF0000000F00000000000001161408B1F20E07
      7DCB0B056FBF0B056FBF0B056FBF0B056FBF0B056FBF0B056FBF0B056FBF0B05
      6FBF0E067ECB1408B1F200000115000000000000000000000000000000000000
      00000000000000000000251B0597B78317FFB68215FFB78317FF251B05970000
      00000000000000000000000000000000000000000000000000100B0460B20100
      0836000001130000011300000113000001130000011300000113000001130000
      0113000007320B0460B2000001140000000000000006111852C4848FE6FF5970
      F0FF324DEBFF3650EBFF3852EBFF008846FF78E3D8FF00AA7DFF097C64FF324D
      EBFF5970F0FF848FE6FF111853C4000000060000000000000000020116561309
      AEF10E077DCB0B056FBF0B056FBF0B056FBF0B056FBF0B056FBF0B056FBF0E06
      7DCB1309ADF00201155500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000001000B3E0A04
      5DAF010008360000011300000113000001130000011300000113000001130000
      07330A045BAD01000D440000000000000000000000010000023F3746C7FFA6B2
      F6FF4B62EEFF2B46E9FF2F49E9FF0E7476FF00AA85FF028453FF2B46E9FF4B62
      EEFFA6B2F6FF3746C7FF0000023E000000010000000000000000000000000201
      16561408B1F2100796DE0E057FCD0C0672C20C0672C20E057FCD100796DF1408
      B1F2020115550000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000100
      0B3E0B0460B105022C7901000A390000021C0000021B0100093905022A770B04
      60B201000D4300000000000000000000000000000000000000040D123DB13D4D
      CAFFAAB5F6FF7B8EF1FF3C55E9FF2340E5FF2340E5FF3C55E9FF7B8EF1FFAAB5
      F6FF3D4DCAFF090C2A9C00000003000000000000000000000000000000000000
      0000000001160603378711078FDA140ABAF8140ABAF810078FD9060336860000
      0116000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000001003011C610804499C0C0567B80C0568B908044A9D03011D630000
      001200000000000000000000000000000000000000000000000000000003090C
      299B3545C7FF7989E3FFA7B2F5FFB0BCF8FFB0BCF8FFA7B2F5FF7989E3FF3545
      C7FF090C299B0000000300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00010000013811174FBF2636C0FF2535BFFF2535BFFF2636C0FF11174FBF0000
      0138000000010000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000002300000033000000330000
      0033000000330000003300000033000000330000003300000033000000330000
      00330000003300000033000000330000000B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000060000
      013B04080A7304090B7A00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000914800E1BA5C00FFBA5C
      00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C
      00FFBA5C00FFBA5C00FF914800E100000000454544C0AFAFADFFAEAEACFFAEAE
      ACFFAEAEACFFAEAEACFFAEAFACFFAFAFADFFAFAFADFFB0B0AEFFB5B3AFFFC2BA
      B1FF3D7AABFF457DAAFF4681ACFF0103045E0000000000000000000000000000
      000000000000000000000000000900010140060C0F831F3543D43A6481FC457C
      9FFF4F8CB1FF2D5373FF050A0E80000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA5C00FF010000196F37
      00C5010000190100001901000019010000190100001901000019010000190100
      00196F3700C501000019BA5C00FF00000000B0B0ADFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E75
      AEFF6D9BBEFF1DADFFFF1D3845AD4291C6FF0000000000000000000000080101
      0247080E128B223948DB3A6282FD467C9EFF5395BAFF60ABD4FF64B2DAFF66B5
      DDFF46799FFF40505AFF0B151FAA000000000000000000000000000000001147
      11BF061A06750000000300000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA5C00FF010000196F37
      00C5010000190100001901000019010000190100001901000019010000190100
      00196F3700C501000019BA5C00FF00000000AEAEABFFFFFFFFFFFFFFFFFF9696
      96FFC6C6C6FFFFFFFFFFBCBBBAFF757373FF6D6B69FF6E6C6AFF726F6DFF8C85
      80FFAFA59DFFA0C3D9FFB0ECFFFF3D91C6FF000000000000000223394BDD4880
      A1FF589CC0FF67B4DBFF6BBBE1FF69BADFFF67B6DCFF65B2D8FF63B0D7FF6DB6
      DBFF214C6CFF7A6D5AFF132839CF000000000000000000000000000000001E80
      1EFF1E801EFF124D12C700030028000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA5C00FF010000196F37
      00C5010000190100001901000019010000190100001901000019010000190100
      00196F3700C501000019BA5C00FF00000000ADADABFFFFFFFFFFFCFBFBFFFFFF
      FFFFFFFFFFFF8C8A89FF949493FFD5D5D9FFE1E3E7FFE1E2E6FFD6D6DAFF9B99
      98FF8A8480FFF6EDE7FFBFDFEBFF3D92CAFF00000000010102424D86A4FF7ACF
      F3FF75C8EBFF75C9EBFF75C9EAFF74C6E7FF72C2E6FF6EC0E2FF6EBDE3FF61A1
      C5FF4D6374FF857662FF1F4564F5000000010000000000000000000000001E80
      1EFF1E801EFF1E801EFF1C771CF7061A06750000000300000000000000000000
      00000000000000000000000000000000000000000000BA5C00FF010000196F37
      00C5010000190100001901000019010000190100001901000019010000190100
      00196F3700C501000019BA5C00FF00000000ADADABFFFFFFFFFFF8F8F8FFFEFE
      FEFFBCBBBAFF9A9998FFE9E6E5FFECC88EFFF5CE7DFFFADC8DFFF7E3A9FFE8E8
      E7FF9E9B9BFFB6AEA7FF3490CCFF00000000000000000E181D9B6FBDDDFF83D8
      F6FF81D5F5FF7CD1F1FF7ACEEFFF77CBECFF75C8EAFF73C5E7FF74C8EBFF406E
      90FF9EA4A7FF7C705EFF335E82FF0000001F0000000000000000000000001E80
      1EFF1E801EFF1E801EFF1E801EFF1E801EFF124D12C700030028000000000000
      00000000000000000000000000000000000000000000BA5C00FF010000196F37
      00C5010000190100001901000019010000190100001901000019010000190100
      00196F3700C501000019BA5C00FF00000000ADADABFFFFFFFFFFF7F7F6FFC4C4
      C4FF82807CFFE4E2E2FFF2C284FFFDCD82FFFFD885FFFFE998FFFFF1A2FFF8E5
      A9FFE2E1E5FF8A8079FF000000000000000000000006446F81ED8BE5FFFF88DE
      FCFF85DAF8FF82D7F6FF80D4F3FF7CD1F1FF79CEEEFF77CCEDFF8AD0EEFF0C35
      54FFF7EBE3FF7A6E5DFF4B7A9AFF000101470000000000000000000000001E80
      1EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1C771CF7061A06750000
      00030000000000000000000000000000000000000000BA5C00FF01000019562B
      00AE6F3700C56F3700C56F3700C56F3700C56F3700C56F3700C56F3700C56F37
      00C5562B00AE01000019BA5C00FF00000000ADADABFFFFFFFFFFF5F4F3FFFEFD
      FCFF7C7976FFFDF7F4FF1488F5FF51AFFFFF0B8AFFFF479FE3FFFFE998FFF9DB
      8CFFF4F5FAFF878481FF00000000000000000203044E74B9CEFF8EE5FFFF8AE1
      FEFF89E1FEFF87DDFCFF85DAF8FF82D7F6FF80D3F3FF7CD2F5FF6DAAC8FF4057
      65FFFFFFF5FF7B6E5EFF6297B5FF0104066F0000000000000000000000001E80
      1EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF124D
      12C70003002800000000000000000000000000000000BA5C00FF010000190100
      0019010000190100001901000019010000190100001901000019010000190100
      00190100001901000019BA5C00FF00000000ADADABFFFFFFFFFFF2F2F1FFC3C4
      C4FF827C79FFFFFCFAFF94CCC0FFB8FBFFFF89F2FFFF078AFFFFFFD886FFF3CC
      7BFFFAFCFFFF898685FF00000000000000001A2528A69EE7F7FF99EBFFFF8DE5
      FFFF8FE7FFFF9EEAFFFF8CE2FFFF89E1FEFF87DEFEFF9DE5FFFF467596FFA8B0
      B4FFFFFFF7FF796F61FF7AB4CFFF020A0E970000000000000000000000001E80
      1EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E80
      1EFF124C12C500000000000000000000000000000000BA5C00FF010000190100
      0019944900E4BA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FF9449
      00E40100001901000019BA5C00FF00000000ADADABFFFFFFFFFFEFEEEDFFF6F5
      F4FF8A8886FFF2F2F3FFECB779FFDBE6F4FF91CDFFFF90C0EBFFF6CD8AFFF0CC
      93FFF1F4F8FF8D8A89FF0000000000000000708F94F3BCFBFFFF97D8EFFF77B5
      D1FF5C93AFFF3D6F8EFF82C2DEFF71AECCFF598CA8FF326385FF658395FFFFF8
      F3FFFFFDF7FF7B7366FF99D5EBFF06141FBE0000000000000000000000001E80
      1EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1148
      11C00002002300000000000000000000000000000000BA5C00FF010000190100
      0019BA5C00FF010000190100001901000019010000190100001901000019BA5C
      00FF0100001901000019BA5C00FF00000000ADADABFFFFFFFFFFECECEBFFBFBF
      BFFFBEBCBBFFAEADACFFFFFFFFFFE9B87DFFEDBC80FFEEBF82FFEEC78FFFFFFF
      FFFFB3B2B2FF12121281000000000000000012181A8F214355D20D1A219F0810
      1389919CA2FFF4F6F5FF849FAEFFA3B5BFFFCED7D9FFFCF6F1FFFFFCF7FFFBF7
      F4FFFFFDF8FF7D7466FF73A5BDFF0A1923BB0000000000000000000000001E80
      1EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1C751CF40517056D0000
      00020000000000000000000000000000000000000000BA5C00FF010000190100
      0019BA5C00FF010000190100001901000019010000190100001901000019BA5C
      00FF0100001901000019BA5C00FF00000000ADAEABFFFFFFFFFFE9E8E7FFEEED
      ECFFF2F1F0FF9D9A99FFB1B0B1FFFBFDFFFFFFFFFFFFFFFFFFFFFBFDFFFFB4B3
      B4FF989694FF0000000000000000000000000000000000000000000000000000
      0012AEAEAFFFFFFFFFFFFFFEFBFFFFFCFAFFFAF7F4FFFAFAF6FFFAF8F5FFF9F5
      F0FFF4EBE5FF7A7064F601040664000000150000000000000000000000001E80
      1EFF1E801EFF1E801EFF1E801EFF1E801EFF114811C000020023000000000000
      00000000000000000000000000000000000000000000BA5C00FF010000190100
      0019BA5C00FF010000190100001901000019010000190100001901000019BA5C
      00FF0100001913090052A65200F100000000AEAEABFFFFFFFFFFE6E6E5FF9B9B
      9BFFBDBDBCFFE7E6E5FFBCBAB7FF939190FF8C8988FF8C8987FF969492FFAFAE
      ACFF363635AB0000000000000000000000000000000000000000000000000000
      0000B3B4B3FEFFFFFFFFF9F8F6FFF7F5F2FFFBFAF8FFFBF8F8FFFBF7F6FFEBE3
      DCFFD6C8BAFF34312DBC00000000000000000000000000000000000000001E80
      1EFF1E801EFF1E801EFF1C751CF40517056D0000000200000000000000000000
      00000000000000000000000000000000000000000000BA5C00FF010000190100
      0019BA5C00FF010000190100001901000019010000190100001901000019BA5C
      00FF130900529D4D00EA0B05003F00000000AEAEACFFFFFFFFFFE1E0DFFFE4E3
      E1FFE4E3E2FFE4E2E1FFE4E3E2FFFFFFFFFFAAAAA7FFFFFFFFFFEDEEEEFF3131
      30A7000000000000000000000000000000000000000000000000000000000000
      0000A9A9A9F8FFFFFDFFF7F5F2FFFBFBF9FFFCFBF9FFFDFDFBFFFEFBF8FFEAE0
      D3FF59534BE20000001C00000000000000000000000000000000000000001E80
      1EFF1E801EFF114811C000020023000000000000000000000000000000000000
      000000000000000000000000000000000000000000008B4500DDBA5C00FFBA5C
      00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C
      00FFA35100EF0B05003F0000000000000000AFAFADFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEAFF2F2F2FA60000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BCBCBCFEFFFFFFFFFFFFFFFFFDFBFAFFECE9E5FFD9D6D1FFC8C2BAFF6E66
      5DEE0000002D0000000000000000000000000000000000000000000000000F41
      0FB70517056D0000000200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000939391EFB0B0ADFFAEAEACFFAEAE
      ABFFAEAEABFFAEAEABFFADAEABFFAEAEABFFAFAFADFF888887EA000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000595754D36D655BEF403B33D225221EB4161412970C0A097A0504045D0000
      001D000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000726D6BE0AEA9
      A6FFACA7A4FFACA7A3FFABA7A3FFABA6A2FFABA6A1FFAAA5A0FFAAA59FFFAAA3
      9EFFABA59EFF706A67E000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000E0E0EAA080808870000001000000000000000000000
      0000000000000000000000000000000000000000000000000000BDB9B5FFFFFF
      FEFFFFFCFAFFFFFDF9FFFFFBF8FFFFFCF7FFFFFBF7FFFEFAF5FFFFFAF4FFFEF8
      F2FFFFFCF7FFBAB3ACFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000B0B0B96202020FF1C1C1CEC0505056D000000000000
      0000000000000000000000000000000000000000000000000000BAB8B5FFFFFE
      FBFFF5F1EEFFF2F0ECFFF9F5F1FFF6F1EDFFF3EEE9FFF2ECE7FFF8F1EBFFF6EF
      E8FFFEF7F3FFB8B2ACFF000000000000000000000000000000000303034E1B1B
      1BEA202020FF202020FF202020FF202020FF202020FF202020FF1C1C1CED0303
      0356000000000000000000000000000000000000000000000000000000000303
      034D1B1B1BEA202020FF202020FF202020FF202020FF202020FF202020FF1C1C
      1CED030303560000000000000000000000000000000000000000000000000000
      000000000000000000000000001F1F1F1FFA1D1D1DF3171717D50909098B0000
      0000000000000000000000000000000000000000000000000000BBB9B8FFFFFF
      FEFF979695FFA3A2A1FF999796FF9D9B99FFB2B0AFFF969391FFAFACA9FF9A97
      94FFFEF9F4FFB8B3ADFF000000000000000000000000000000001A1A1AE40202
      024C000000190000001900000019000000191B1B1BE70202024B020202441C1C
      1CED000000000000000000000000000000000000000000000000000000001A1A
      1AE40202024C000000190000001900000019000000191B1B1BE70202024B0202
      02441C1C1CED00000000000000000000000000000000914800E1BA5C00FFBA5C
      00FFBA5C00FFBA5C00FF0D0600440C0C0C9C0F0F0FB200000029151515D00909
      098B000000000000000000000000000000000000000000000000BDBAB8FFFFFF
      FFFFFAF9F8FFFBFAF8FFF6F4F2FFF9F7F5FFF8F5F2FFEAE7E4FFF9F4F0FFF8F3
      EDFFFFFAF5FFBAB5AFFF00000000000000000000000000000000191919DD2020
      20FF202020FF202020FF202020FF202020FF191919E000000019000000192020
      20FF000000000000000000000000000000000000000000000000000000001919
      19DD202020FF202020FF202020FF202020FF202020FF191919E0000000190000
      0019202020FF00000000000000000000000000000000BA5C00FF010000196F37
      00C501000019010000190100001400000011141414CB0C0C0C9D000000291515
      15D00909098B0000000000000000000000000000000000000000BCBCBAFFFFFF
      FFFF888888FFECEDEBFFACACABFFC9C8C6FFACAAA9FF91908EFFA2A19FFF9392
      90FFFFFBF7FFB9B4B0FF00000000000000000000000000000000000000000000
      0000202020FF0000001900000019000000190000001900000019000000192020
      20FF000000000000000000000000000000000000000000000000000000000000
      000000000000202020FF00000019000000190000001900000019000000190000
      0019202020FF00000000000000000000000000000000BA5C00FF010000196F37
      00C50100001901000019010000190000001200000011141414CB0C0C0C9D0000
      0029151515D00909098B00000000000000000000000000000000BCBCBAFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFEFEFFF6F5F6FFF2F1F1FFFDFAF8FFFCF9F6FFE3DF
      DCFFFFFBF7FFB9B5B1FF00000000000000000000000000000000000000000000
      0000202020FF0000001900000019000000190000001900000019000000192020
      20FF000000000000000000000000000000000000000000000000000000000000
      000000000000202020FF00000019000000190000001900000019000000190000
      0019202020FF00000000000000000000000000000000BA5C00FF010000196F37
      00C5010000190100001901000019010000190000001200000016141414CB0C0C
      0C9D00000029151515D00909098D000000010000000000000000BCBAB8FFFFFF
      FFFFB4B4B4FFB2B2B2FF989898FF969696FFA2A2A2FF969695FF969594FFA6A4
      A3FFFFFCF9FFBBB6B2FF00000000000000000000000000000000000000000000
      0000202020FF0000001900000019000000190000001900000019000000192020
      20FF000000000000000000000000000000000000000000000000000000000000
      000000000000202020FF00000019000000190000001900000019000000190000
      0019202020FF00000000000000000000000000000000BA5C00FF010000196F37
      00C50100001901000019010000190100001901000019371B008B000000111414
      14CB0C0C0C9D00000029161616D30404045C0000000000000000BCBBB8FFFFFF
      FFFFF3F3F3FFF3F3F3FFF4F4F4FFEDEDEDFFFAFAFAFFFCFBFAFFFBF9F7FFFAF7
      F4FFFFFDF9FFBAB8B3FF00000000000000000000000000000000000000000000
      0000202020FF0000001900000019000000190000001900000019000000192020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000000000000606067500000018000000190000001900000019000000190000
      0019202020FF00000000000000000000000000000000BA5C00FF01000019562B
      00AE6F3700C56F3700C56F3700C56F3700C56F3700C5562B00AE000000120000
      0018141414CB0E0E0EA7131313C30606066F0000000000000000BDB9B7FFFFFF
      FFFF9B9B9BFF9E9E9EFFA3A3A3FFC5C5C5FFACACACFF9E9F9FFFACACAAFFA1A0
      9EFFFFFEFBFFBAB7B5FF00000000000000000000000000000000000000000000
      0000202020FF0000001900000019000000190000001900000019000000192020
      20FF202020FF202020FF191919E100000000000000000001021E00000000006E
      99FF000000000001021E00000005000000180000001900000019000000190000
      0019202020FF202020FF202020FF191919E100000000BA5C00FF010000190100
      0019010000190100001901000019010000190100001901000019010000195D2E
      00B4000000100909098E09090987000000090000000000000000BBB9B6FFFFFF
      FFFFF3F3F3FFF6F6F6FFF2F2F2FFF2F2F2FFF2F2F2FFEDEDEEFFF2F0F0FFF0EC
      EBFFFFFEFCFFBDB9B6FF00000000000000000000000000000000000000000000
      0000202020FF0000001900000019000000190000001900000019000000192020
      20FF0000001900000019202020FF0000000000010119005B7EE800080B45006E
      99FF0006093F005B80E90001021E0000000B0000001900000019000000190000
      0019202020FF0000001900000019202020FF00000000BA5C00FF010000190100
      0019BA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FF0100001901000019BA5C
      00FF000000000000000000000000000000000000000000000000BBBAB6FFFFFF
      FFFFBBBBBBFFB2B2B2FFA8A8A8FFAFAFAFFFB8B8B8FFBFBFBFFFBFBFBEFFBDBB
      B9FFB3B1AEFF858381F900000000000000000000000000000000000000000000
      0000191919E30303035300000019000000190000001900000019000000191A1A
      1AE5030303530202024B1B1B1BEB00000000000000000005073A002A3B9F0006
      083C0028379A0006093F00000000000000030000001900000019000000190000
      0019191919E5030303530202024B1B1B1BEB00000000BA5C00FF010000190100
      0019BA5C00FF010000190100001901000019BA5C00FF010000190201001EBA5C
      00FF000000000000000000000000000000000000000000000000BBB8B6FFFFFF
      FFFFEAEAEAFFEEEEEEFFF8F8F8FFFFFFFFFFECECECFFD4D5D5FFEDEDECFFF0EB
      E6FFBEB6ADFF1B1A189B00000000000000000000000000000000000000000000
      00000202024A191919E3202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF1A1A1AE50303035000000000006E99FF006E99FF000709400000
      000000070940006E99FF006E99FF00000000202020FE202020FF202020FF2020
      20FF202020FF202020FF1A1A1AE40303035000000000BA5C00FF010000190100
      0019BA5C00FF010000190100001901000019BA5C00FF0201001E5F2E00B65329
      00AB000000000000000000000000000000000000000000000000BBB8B5FFFFFF
      FFFFCCCCCCFFC0C0C0FFFFFFFFFFFFFFFFFFA5A5A5FFC7C7C7FFFDF8F2FFC1B9
      AEFF1F1E1B9B0000000300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000006093F002E3FA50007
      0A44002B3B9F00080B4500000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008B4500DDBA5C00FFBA5C
      00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FF512800A90000
      0005000000000000000000000000000000000000000000000000BDBAB6FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEAFFB3ABA1FE1615
      1389000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000010119005B7EE80006093F006E
      99FF0005073A005B7EE80001021E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000726D6AE0ADAB
      A7FFADA9A6FFADABA7FFADAAA8FFADACA9FFAFAEADFF737272F70A0A0A730000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000001011900000000006E
      99FF000000000001011900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000191919E1202020FF202020FF202020FF202020FF202020FF2020
      20FF191919E10000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000202020FF00000019000000190000001900000019000000190000
      0019202020FF00000000000000000000000000000000000000000F0F0FAA1313
      13C2131313C2131313C2131313C2131313C2131313C2131313C2131313C21313
      13C2131313C20F0F0FAA00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005171DB006E99FF006E
      99FF006E99FF006E99FF006E99FF006E99FF006E99FF006E99FF006E99FF006E
      99FF00597CE50000000C000000000000000000000000000000000F0F0FAA1313
      13C2131313C2202020FF00000019000000190000001900000019000000190000
      0019202020FF0000000000000000000000000000000000000000131313C20000
      0013000000130000001300000013000000130000001300000013000000130000
      001300000013131313C200000000000000000000000000000000000000000000
      00000000000800000073000000CF000000FB000000FB000000D1000000760000
      000A0000000000000000000000000000000000000000006E99FF00202D8B0006
      093F0006093F0006093F0006093F0006093F0006093F0006093F0006093F0014
      1C6E004059C30011176500000000000000000000000000000000131313C20000
      001300000013202020FF00000019000000190000001900000019000000190000
      0019202020FF0000000000000000000000000000000000000000131313C20000
      0013000000130000001300000013000000130000001300000013000000130000
      001300000013131313C200000000000000000000000000000000000000000000
      001B000000D1000000FF000000FF000000FF000000FF000000FF000000FF0000
      00D60000001F00000000000000000000000000000000006E99FF004E6DD70006
      093F0006093F0006093F0006093F0006093F0006093F0006093F0006093F0014
      1C6E0017207600455FCA00000000000000000000000000000000131313C20000
      001300000013202020FF00000019000000190202024B03030352030303520303
      0352202020FF131313C2131313C20F0F0FAA0000000000000000131313C20000
      0013000000130000001300000013000000130000001300000013000000130000
      001300000013131313C200000000000000000000000000000000000000070000
      00D0000000FF000000D70000004D000000080000000800000049000000D30000
      00FF000000D60000000A000000000000000000000000006E99FF005474DE0010
      17640006093F0006093F0006093F0006093F0006093F0006093F0006093F0014
      1C6E00070941005B7EE800040532000000000000000000000000131313C20000
      001300000013202020FF00000019000000190303035200000019000000190000
      0019202020FF0000001300000013131313C20000000000000000131313C20000
      0013000000130000001300000013000000130000001300000013000000130000
      001300000013131313C2000000000000000000000000000000000000006E0000
      00FF000000D800000011000000000000000000000000000000000000000E0000
      00D3000000FF00000076000000000000000000000000006E99FF001E29850035
      49B10006093F0006093F0006093F0006093F0006093F0006093F0006093F0014
      1C6E0006093F0029399D00263597000000000000000000000000131313C20000
      001300000013202020FF00000019000000190303035200000019000000190000
      0019202020FF0000001300000013131313C20000000000000000131313C20000
      0013000000130000001300000013000000130000001300000013000000130000
      001300000013131313C200000000000000000000000000000000000000C90000
      00FF000000520000000000000000000000000000000000000000000000000000
      004A000000FF000000D1000000000000000000000000006E99FF0003052F0060
      85EE006E99FF006E99FF006E99FF006E99FF006E99FF006E99FF006E99FF006E
      99FF006E99FF006E99FF003A50B9000000000000000000000000131313C20000
      001300000013202020FF00000019000000190303035200000019000000190000
      0019202020FF0000001300000013131313C20000000000000000131313C20000
      0013000000130000001300000013000000130000001300000013000000130000
      001300000013131313C200000000000000000000000000000000000000F30000
      00FF0000000F0000000000000000000000000000000000000000000000000000
      0008000000FF000000FB000000000000000000000000006E99FF000101190001
      011900010119000101190001011900010119000101190001011900010119006E
      99FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000E0303035200000019000000190000
      0019202020FF0000001300000013131313C20000000000000000000000000000
      00000000000000000000000000000000000A0000001300000013000000130000
      001300000013131313C200000000000000000000000000000000000000F20000
      00FF000000100000000000000000000000000000000000000000000000000000
      0009000000FF000000FA000000000000000000000000006E99FF000101190001
      011900010119000101190001011900010119000101190001011900010119006E
      99FF00000000000000000000000000000000191919E1202020FF202020FF2020
      20FF202020FF202020FF191919E100000000202020FF202020FF202020FF2020
      20FF191919E00000001300000013131313C2191919E1202020FF202020FF2020
      20FF202020FF202020FF191919E1000000000000001300000013000000130000
      001300000013131313C200000000000000000000000000000000000000C70000
      00FF000000530000000000000000000000F2000000F600000000000000000000
      004D000000FF000000CF000000000000000000000000006E99FF000101190001
      011900010119000B0F5200668DF5006E99FF00000000BA5C00FF000000000052
      73DD00000000000000000000000000000000202020FF575757FF5C5C5CFF2020
      20FF575757FF8E8E8EFF202020FF00000000131313C200000013000000130000
      0013000000130000001300000013131313C2202020FF575757FF5C5C5CFF2020
      20FF575757FF8E8E8EFF202020FF000000000000001300000013000000130000
      001300000013131313C2000000000000000000000000000000000000006C0000
      00FF000000DB0000001400000000000000FF000000FF00000000000000110000
      00D8000000FF00000074000000000000000000000000005273DD006E99FF006E
      99FF006E99FF006186EF0006093F00000000000000009D4E00EB0201001D0000
      0000241200710D0600450000000000000000202020FF525252FFEBEBEBFF8989
      89FFEBEBEBFF575757FF202020FF00000000131313C200000013000000130000
      0013000000130000001300000013131313C2202020FF525252FFEBEBEBFF8989
      89FFEBEBEBFF575757FF202020FF000000000000001300000013131313C41313
      13C4131313C4111111B600000000000000000000000000000000000000070000
      00CF000000FF000000DD00000000000000FF000000FF00000000000000DA0000
      00FF000000D50000000900000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000381B008C5E2E00B50201
      001C0904003A9A4D00E80D06004500000000202020FF202020FF828282FFFFFF
      FFFF898989FF202020FF202020FF00000000131313C200000013000000130000
      0013000000130000001300000013131313C2202020FF202020FF828282FFFFFF
      FFFF898989FF202020FF202020FF000000000000001300000013131313C41313
      13C4111111B90101012F00000000000000000000000000000000000000000000
      001A000000CF000000FF00000000000000FF000000FF00000000000000FF0000
      00D30000001E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000005371B008C9D4E
      00EBBA5C00FFBA5C00FF864200D900000000202020FF575757FFEBEBEBFF8282
      82FFEBEBEBFF5C5C5CFF202020FF000000000E0E0EA7131313C2131313C21313
      13C2131313C2131313C2131313C20E0E0EA7202020FF575757FFEBEBEBFF8282
      82FFEBEBEBFF5C5C5CFF202020FF000000000000001300000013131313C41111
      11B90101012F0000000000000000000000000000000000000000000000000000
      0000000000060000006A00000000000000FF000000FF000000000000006E0000
      0008000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000B05003F9B4D00E90B05003F00000000202020FF525252FF575757FF2020
      20FF525252FF575757FF202020FF000000000000000000000000000000000000
      000000000000000000000000000000000000202020FF525252FF575757FF2020
      20FF525252FF575757FF202020FF00000000131313C2131313C2101010B50101
      012F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000EE000000F200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002110006C0B05003F0000000000000000191919DD202020FF202020FF2020
      20FF202020FF202020FF191919DD000000000000000000000000000000000000
      000000000000000000000000000000000000191919DD202020FF202020FF2020
      20FF202020FF202020FF191919DD000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300100000100010000000000800900000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
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
      00000000000000000000000000000000}
    DesignInfo = 23593404
    ImageInfo = <
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D79
          656C6C6F772D31307B66696C6C3A20233939366630303B206F7061636974793A
          20302E313B7D2E6C696768742D79656C6C6F772D32357B66696C6C3A20233939
          366630303B206F7061636974793A20302E32353B7D2E6C696768742D79656C6C
          6F777B66696C6C3A20233939366630303B206F7061636974793A20313B7D2E6C
          696768742D626C75657B66696C6C3A20233030356462613B206F706163697479
          3A20313B7D3C2F7374796C653E0D0A093C2F646566733E0D0A093C7469746C65
          3E49636F6E4C696768744F70656E466F6C6465723C2F7469746C653E0D0A093C
          672069643D2263616E7661732220636C6173733D2263616E766173223E0D0A09
          093C7061746820636C6173733D2263616E7661732220643D224D31362C313648
          3056304831365A222F3E0D0A093C2F673E0D0A093C672069643D226C6576656C
          2D31223E0D0A09093C7061746820636C6173733D226C696768742D79656C6C6F
          772D31302220643D224D31312E352C36563848332E3433316C2D2E3436342E33
          31344C312E352C31312E39383156342E3568344C372C3668342E355A222F3E0D
          0A09093C7061746820636C6173733D226C696768742D79656C6C6F772D323522
          20643D224D31342E352C382E356C2D322C3548312E356C322D355A222F3E0D0A
          09093C7061746820636C6173733D226C696768742D79656C6C6F772D32352220
          643D224D31322C3133483131563968315A222F3E0D0A09093C7061746820636C
          6173733D226C696768742D79656C6C6F772220643D224D31342E3433312C3848
          313256352E354C31312E352C35483131563848332E3433316C2D2E3436342E33
          31344C322C31302E38563548352E3239336C312C314838563548362E3730376C
          2D2E3835332D2E3835344C352E352C34682D344C312C342E3576382E3836344C
          312E3433312C31346831316C2E3436342D2E3331342C322D355A6D2D322E3333
          392C3548322E3136396C312E362D3468392E3932325A222F3E0D0A09093C7061
          746820636C6173733D226C696768742D626C75652220643D224D31342E383534
          2C322E313436762E3730386C2D322C322D2E3730372D2E3730384C31332E3239
          332C3348313261322C322C302C302C302D322C3256364839563561332C332C30
          2C302C312C332D3368312E3239334C31322E3134372E3835346C2E3730372D2E
          3730385A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265797B66696C6C3A20233231323132313B206F7061636974
          793A20313B7D2E77686974657B66696C6C3A20236666666666663B206F706163
          6974793A20313B7D2E6C696768742D64656661756C74677265792D31307B6669
          6C6C3A20233231323132313B206F7061636974793A20302E313B7D2E6C696768
          742D64656661756C74677265792D32357B66696C6C3A20233231323132313B20
          6F7061636974793A20302E32353B7D2E636C732D317B6F7061636974793A302E
          37353B7D3C2F7374796C653E0D0A093C2F646566733E0D0A093C7469746C653E
          436C6F7365446F63756D656E7447726F75703C2F7469746C653E0D0A093C6720
          69643D2263616E766173223E0D0A09093C7061746820636C6173733D2263616E
          7661732220643D224D31362C3136483056304831365A222F3E0D0A093C2F673E
          0D0A093C672069643D226C6576656C2D31223E0D0A09093C7061746820636C61
          73733D226C696768742D64656661756C74677265792220643D224D372C2E3576
          364C362E352C37482E354C302C362E35562E354C2E352C3068365A222F3E0D0A
          09093C7061746820636C6173733D2277686974652220643D224D352E3134362C
          352E3835342C332E352C342E3230372C322C352E3730372C312E3239332C356C
          312E352D312E354C312E3239332C322C322C312E3239336C312E352C312E354C
          352C312E3239332C352E3730372C326C2D312E352C312E354C352E3835342C35
          2E3134365A222F3E0D0A09093C6720636C6173733D22636C732D31223E0D0A09
          09093C7061746820636C6173733D226C696768742D64656661756C7467726579
          2D31302220643D224D382E352C322E35563668346C2E352E35763568322E3576
          2D395A222F3E0D0A0909093C7061746820636C6173733D226C696768742D6465
          6661756C74677265792D31302220643D224D322E352C3876352E35483556385A
          222F3E0D0A0909093C7061746820636C6173733D226C696768742D6465666175
          6C74677265792220643D224D31352E352C32682D374C382C322E355636483956
          3368367638483133763168322E356C2E352D2E35762D395A4D332C3848327635
          2E356C2E352E35483556313348335A222F3E0D0A09093C2F673E0D0A09093C70
          61746820636C6173733D226C696768742D64656661756C74677265792D313022
          20643D224D382C362E35762E34314C362E39312C3848352E3576372E35683776
          2D395A222F3E0D0A09093C7061746820636C6173733D226C696768742D646566
          61756C74677265792220643D224D31322E352C364838762E39314C372E39312C
          37483132763848365638483576372E356C2E352E3568376C2E352D2E35762D39
          5A222F3E0D0A09093C7061746820636C6173733D226C696768742D6465666175
          6C74677265792D32352220643D224D392C31315637483876342E356C2E352E35
          4831325631315A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D2E77686974657B
          66696C6C3A20236666666666663B206F7061636974793A20313B7D2E636C732D
          317B6F7061636974793A302E37353B7D3C2F7374796C653E0D0A093C2F646566
          733E0D0A093C7469746C653E49636F6E4C69676874436C6F7365446F63756D65
          6E743C2F7469746C653E0D0A093C672069643D2263616E766173223E0D0A0909
          3C7061746820636C6173733D2263616E7661732220643D224D31362C31364830
          56304831365A222F3E0D0A093C2F673E0D0A093C672069643D226C6576656C2D
          31223E0D0A09093C6720636C6173733D22636C732D31223E0D0A0909093C7061
          746820636C6173733D226C696768742D64656661756C74677265792D31302220
          643D224D31332E352C342E3576313048322E35563848362E3931344C382C362E
          39313456312E3568322E355A222F3E0D0A0909093C7061746820636C6173733D
          226C696768742D64656661756C74677265792220643D224D31342C342E357631
          306C2D2E352E3548322E354C322C31342E355638483376364831335635483130
          56324838563168322E356C2E3335342E3134362C332C335A222F3E0D0A09093C
          2F673E0D0A09093C7061746820636C6173733D226C696768742D64656661756C
          74677265792220643D224D372C2E3576364C362E352C37482E354C302C362E35
          562E354C2E352C3068365A222F3E0D0A09093C7061746820636C6173733D2277
          686974652220643D224D352E3134362C352E3835342C332E352C342E3230372C
          322C352E3730372C312E3239332C356C312E352D312E354C312E3239332C322C
          322C312E3239336C312E352C312E354C352C312E3239332C352E3730372C326C
          2D312E352C312E354C352E3835342C352E3134365A222F3E0D0A093C2F673E0D
          0A3C2F7376673E0D0A}
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
          303B3C7061746820643D224D32302C342E3776342E3463322E342C312E342C34
          2C342C342C362E3963302C342E342D332E362C382D382C38732D382D332E362D
          382D3863302D332C312E362D352E352C342D362E3956342E3743372E332C362E
          332C342C31302E382C342C313620202623393B63302C362E362C352E342C3132
          2C31322C313263362E362C302C31322D352E342C31322D31324332382C31302E
          382C32342E372C362E332C32302C342E377A222F3E0D0A3C7061746820643D22
          4D31372C3134682D32632D302E362C302D312D302E342D312D31563363302D30
          2E362C302E342D312C312D31683263302E362C302C312C302E342C312C317631
          304331382C31332E362C31372E362C31342C31372C31347A222F3E0D0A3C2F73
          76673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D62
          6C75652D31307B66696C6C3A20233030356462613B206F7061636974793A2030
          2E313B7D2E6C696768742D626C75657B66696C6C3A20233030356462613B206F
          7061636974793A20313B7D2E6C696768742D64656661756C74677265792D3130
          7B66696C6C3A20233231323132313B206F7061636974793A20302E313B7D2E6C
          696768742D64656661756C74677265797B66696C6C3A20233231323132313B20
          6F7061636974793A20313B7D2E636C732D317B6F7061636974793A302E37353B
          7D3C2F7374796C653E0D0A093C2F646566733E0D0A093C7469746C653E49636F
          6E4C696768745361766541733C2F7469746C653E0D0A093C672069643D226361
          6E7661732220636C6173733D2263616E766173223E0D0A09093C706174682063
          6C6173733D2263616E7661732220643D224D31362C3136483056304831365A22
          2F3E0D0A093C2F673E0D0A093C672069643D226C6576656C2D31223E0D0A0909
          3C7061746820636C6173733D226C696768742D626C75652D31302220643D224D
          362E3438372C31314832563248392E3739334C31312C332E32303856362E324C
          362E3736322C31302E3433355A222F3E0D0A09093C7061746820636C6173733D
          226C696768742D626C75652220643D224D362E3438372C313148325632483456
          3548395632682E3739334C31312C332E32303856362E326C312D3156336C2D2E
          3134362D2E3335342D312E352D312E354C31302C3148312E354C312C312E3576
          31306C2E352E3548365A4D352C324838563448355A222F3E0D0A09093C706174
          6820636C6173733D226C696768742D64656661756C74677265792D3130222064
          3D224D31342E3639322C372E3632372C392E3133352C31332E3138342C372E36
          35322C31312E3636366C352E35342D352E35333961312E3034332C312E303433
          2C302C302C312C2E3734362D2E3330392C312E3036322C312E3036322C302C30
          2C312C2E3735342C312E3830395A222F3E0D0A09093C7061746820636C617373
          3D226C696768742D64656661756C74677265792220643D224D31352E3034322C
          352E37373661312E3535392C312E3535392C302C302C302D322E322C306C2D35
          2E32352C352E32354C362E3031312C31342E3237316C2E3637342E3637352C33
          2D312E3632392C352E3336342D352E33333641312E3536312C312E3536312C30
          2C302C302C31352E3034322C352E3737365A6D2D2E372C312E352D352E322C35
          2E322D2E3738332D2E382C352E3138392D352E313839612E3536312E3536312C
          302C302C312C2E3739332E3739335A222F3E0D0A09093C6720636C6173733D22
          636C732D31223E0D0A0909093C7061746820636C6173733D226C696768742D62
          6C75652220643D224D392C3748347634483356362E354C332E352C3668366C2E
          352E35762E376C2D312C315A222F3E0D0A09093C2F673E0D0A093C2F673E0D0A
          3C2F7376673E0D0A}
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
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D3C2F7374796C65
          3E0D0A093C2F646566733E0D0A093C7469746C653E49636F6E4C696768745363
          726970743C2F7469746C653E0D0A093C672069643D2263616E7661732220636C
          6173733D2263616E766173223E0D0A09093C7061746820636C6173733D226361
          6E7661732220643D224D31362C3136483056304831365A222F3E0D0A093C2F67
          3E0D0A093C672069643D226C6576656C2D31223E0D0A09093C7061746820636C
          6173733D226C696768742D64656661756C74677265792D31302220643D224D38
          2C313261312E3938342C312E3938342C302C302C302C2E3236392C3148346131
          2C312C302C302C312D312D315A4D352C35763648382E356C2E352E3556313261
          312C312C302C302C302C322C30563561312E3937382C312E3937382C302C302C
          312C2E3237382D31483641312C312C302C302C302C352C355A6D382D3161312C
          312C302C302C302D312C3156366832563541312C312C302C302C302C31332C34
          5A222F3E0D0A09093C7061746820636C6173733D226C696768742D6465666175
          6C74677265792220643D224D31332C33483641322C322C302C302C302C342C35
          763648322E356C2D2E352E3556313261322E3032332C322E3032332C302C302C
          302C312E3939332C3248313061322C322C302C302C302C322D32563768322E35
          6C2E352D2E35563541322C322C302C302C302C31332C335A4D342C313361312C
          312C302C302C312D312D31483861312E3938342C312E3938342C302C302C302C
          2E3236392C315A6D372D38763761312C312C302C302C312D322C30762D2E354C
          382E352C31314835563541312C312C302C302C312C362C3468352E3237384131
          2E3937382C312E3937382C302C302C302C31312C355A6D332C31483132563561
          312C312C302C302C312C322C305A222F3E0D0A093C2F673E0D0A3C2F7376673E
          0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D2E6C696768742D
          79656C6C6F777B66696C6C3A20233939366630303B206F7061636974793A2031
          3B7D3C2F7374796C653E0D0A093C2F646566733E0D0A093C7469746C653E4963
          6F6E4C696768744E65775363726970743C2F7469746C653E0D0A093C67206964
          3D2263616E7661732220636C6173733D2263616E766173223E0D0A09093C7061
          746820636C6173733D2263616E7661732220643D224D31362C31364830563048
          31365A222F3E0D0A093C2F673E0D0A093C672069643D226C6576656C2D31223E
          0D0A09093C7061746820636C6173733D226C696768742D64656661756C746772
          65792D31302220643D224D31342C3461312C312C302C302C302D312C31563668
          32563541312C312C302C302C302C31342C345A4D372E39372C3441342E343434
          2C342E3434342C302C302C312C362C372E323456313148392E356C2E352E3556
          313261312C312C302C302C302C322C30563561322C322C302C302C312C2E3238
          2D315A4D392C3132483461312C312C302C302C302C312C3148392E323741322C
          322C302C302C312C392C31325A222F3E0D0A09093C7061746820636C6173733D
          226C696768742D64656661756C74677265792220643D224D31342C3348372E39
          3761342E3138322C342E3138322C302C302C312C302C3168342E333141322C32
          2C302C302C302C31322C35763761312C312C302C302C312D322C30762D2E354C
          392E352C3131483656372E323461342E30372C342E30372C302C302C312D312C
          2E3556313148332E356C2D2E352E3556313261322E3032392C322E3032392C30
          2C302C302C312E39392C3248313161322E3030362C322E3030362C302C302C30
          2C322D32563768322E356C2E352D2E35563541322E3030362C322E3030362C30
          2C302C302C31342C335A4D352C313361312C312C302C302C312D312D31483961
          322C322C302C302C302C2E32372C315A4D31352C36483133563561312C312C30
          2C302C312C322C305A222F3E0D0A09093C7061746820636C6173733D226C6967
          68742D79656C6C6F772220643D224D332C322C332C3048344C342C326C2D2E35
          2E355A6D2E352C322E354C332C355637483456355A6D312D314C352C342C372C
          3456334C352C335A6D2D322C304C322C332C302C3356344C322C345A6D312E37
          30382D2E37682E3730384C362E3332382C312E3337382C352E36322E3637312C
          342E3230382C322E3038385A4D322E3739322C342E32303648322E3038354C2E
          3637332C352E3632336C2E3730372E3730364C322E3739332C342E3931335A6D
          312E3431342C30762E3730384C352E3632332C362E3332386C2E3730362D2E37
          30384C342E3931332C342E3230385A4D322E3739342C322E37393256322E3038
          354C312E3337382E3637332E3637312C312E33382C322E3038382C322E373933
          5A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D62
          6C75652D31307B66696C6C3A20233030356462613B206F7061636974793A2030
          2E313B7D2E6C696768742D626C75657B66696C6C3A20233030356462613B206F
          7061636974793A20313B7D2E636C732D317B6F7061636974793A302E37353B7D
          3C2F7374796C653E0D0A093C2F646566733E0D0A093C7469746C653E53617665
          3C2F7469746C653E0D0A093C672069643D2263616E7661732220636C6173733D
          2263616E766173223E0D0A09093C7061746820636C6173733D2263616E766173
          2220643D224D31362C3136483056304831365A222F3E0D0A093C2F673E0D0A09
          3C672069643D226C6576656C2D31223E0D0A09093C7061746820636C6173733D
          226C696768742D626C75652D31302220643D224D31342E3531352C332E357631
          31682D313356312E356831315A222F3E0D0A09093C7061746820636C6173733D
          226C696768742D626C75652220643D224D31342E3835342C332E3134366C2D32
          2D324C31322E352C3148312E354C312C312E357631336C2E352E356831336C2E
          352D2E3556332E355A4D352C326836563648355A6D392C313248325632483456
          362E356C2E352E3568376C2E352D2E355632682E3239334C31342C332E373037
          5A222F3E0D0A09093C6720636C6173733D22636C732D31223E0D0A0909093C70
          61746820636C6173733D226C696768742D626C75652220643D224D31332C382E
          3576364831325639483476352E354833762D364C332E352C3868395A222F3E0D
          0A09093C2F673E0D0A093C2F673E0D0A3C2F7376673E0D0A}
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
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D67
          7265656E7B66696C6C3A20233166383031663B206F7061636974793A20313B7D
          3C2F7374796C653E0D0A093C2F646566733E0D0A093C7469746C653E49636F6E
          4C6967687452756E3C2F7469746C653E0D0A093C672069643D2263616E766173
          2220636C6173733D2263616E766173223E0D0A09093C7061746820636C617373
          3D2263616E7661732220643D224D31362C3136483056304831365A222F3E0D0A
          093C2F673E0D0A093C672069643D226C6576656C2D31223E0D0A09093C706174
          6820636C6173733D226C696768742D677265656E2220643D224D332E3737372C
          312E3038342C332C312E357631326C2E3737372E3431362C392D3656372E3038
          345A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000000467414D410000B18F0BFC6105000000206348524D00007A26000080
          840000FA00000080E8000075300000EA6000003A98000017709CBA513C000000
          06624B474400FF00FF00FFA0BDA793000000097048597300000EC300000EC301
          C76FA864000001444944415438CBA5924B2E04511885BF73315135D1421B780C
          A463098244620D1E73C49C9DB43156A0598444EF819810F1EC66A03A06E21E03
          A9F20A4A9CE19F9CEF3FF7FC17FE297D1E1C26D541E18D68CD238F02C83A45DE
          03D5673AD737DF029A4975C9661BDCB2B997E800D824121550BF8256A7B3ABDD
          2F8066525D7AC65B018E31D93789538B5A5058CB21CA63634E908F7E30E71B53
          A389E7A0F1D9ECEA36BC0EBD016EFD66063064C66DD9EB0001205A0B98FBD2CD
          9B3B998502203C4C782DAC94021DF0480130B8B4F9AD7C1700D03991A4ACDB91
          DE00676F4F901B1695D2EB455FB41BEF13D485FA81B4843F05559EBABA370BC0
          4CE7FA4641AB16B55F2029A2267B792EBB6CE565146AA6438B8EDE29BE727E99
          4882E8035582E3CAD4E3EDFEFB363FE8201D1A90BD1EEC7960CCE000A7516AF4
          84AEFAE4C345FB8F17FB592F059285452DBE56BB000000257445587464617465
          3A63726561746500323032302D30372D32395430323A32393A35382B30303A30
          30F0CF14E30000002574455874646174653A6D6F6469667900323032302D3037
          2D32395430323A32393A35382B30303A30308192AC5F0000000049454E44AE42
          6082}
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
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D72
          65642D31307B66696C6C3A20236335306231373B206F7061636974793A20302E
          313B7D2E6C696768742D7265647B66696C6C3A20236335306231373B206F7061
          636974793A20313B7D2E636C732D317B6F7061636974793A302E37353B7D3C2F
          7374796C653E0D0A093C2F646566733E0D0A093C7469746C653E49636F6E4C69
          676874427265616B706F696E7444697361626C65643C2F7469746C653E0D0A09
          3C672069643D2263616E7661732220636C6173733D2263616E766173223E0D0A
          09093C7061746820636C6173733D2263616E7661732220643D224D31362C3136
          483056304831365A222F3E0D0A093C2F673E0D0A093C672069643D226C657665
          6C2D31223E0D0A09093C6720636C6173733D22636C732D31223E0D0A0909093C
          7061746820636C6173733D226C696768742D7265642D31302220643D224D312E
          352C3841362E352C362E352C302C312C312C382C31342E352C362E352C362E35
          2C302C302C312C312E352C385A222F3E0D0A0909093C7061746820636C617373
          3D226C696768742D7265642220643D224D382C313561372C372C302C312C312C
          372D3741372E3030382C372E3030382C302C302C312C382C31355A4D382C3261
          362C362C302C312C302C362C3641362E3030362C362E3030362C302C302C302C
          382C325A222F3E0D0A09093C2F673E0D0A093C2F673E0D0A3C2F7376673E0D0A}
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
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6461726B2D7965
          6C6C6F777B66696C6C3A20236666633733333B206F7061636974793A20313B7D
          2E77686974657B66696C6C3A20236666666666663B206F7061636974793A2031
          3B7D2E6C696768742D64656661756C74677265797B66696C6C3A202332313231
          32313B206F7061636974793A20313B7D2E636C732D317B6F7061636974793A30
          2E353B7D3C2F7374796C653E0D0A093C2F646566733E0D0A093C7469746C653E
          49636F6E4C6967687443757272656E74496E737472756374696F6E506F696E74
          65723C2F7469746C653E0D0A093C672069643D2263616E7661732220636C6173
          733D2263616E766173223E0D0A09093C7061746820636C6173733D2263616E76
          61732220643D224D31362C3136483056304831365A222F3E0D0A093C2F673E0D
          0A093C672069643D226C6576656C2D31223E0D0A09093C7061746820636C6173
          733D226461726B2D79656C6C6F772220643D224D372E352C31332E35762D3368
          2D36762D366836762D336C362C365A222F3E0D0A09093C6720636C6173733D22
          636C732D31223E0D0A0909093C7061746820636C6173733D2277686974652220
          643D224D372E352C31332E35762D33682D36762D366836762D336C362C365A22
          2F3E0D0A09093C2F673E0D0A09093C7061746820636C6173733D226C69676874
          2D64656661756C74677265792220643D224D372E3835342C31332E3835342C37
          2C31332E3556313148312E354C312C31302E35762D364C312E352C3448375631
          2E356C2E3835342D2E3335342C362C36762E3730385A4D322C313048372E356C
          2E352E3576312E3739334C31322E3739332C372E352C382C322E37303756342E
          354C372E352C3548325A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D62
          6C75657B66696C6C3A20233030356462613B206F7061636974793A20313B7D3C
          2F7374796C653E0D0A093C2F646566733E0D0A093C7469746C653E49636F6E4C
          6967687453746570496E746F3C2F7469746C653E0D0A093C672069643D226361
          6E7661732220636C6173733D2263616E766173223E0D0A09093C706174682063
          6C6173733D2263616E7661732220643D224D31362C3136483056304831365A22
          2F3E0D0A093C2F673E0D0A093C672069643D226C6576656C2D31223E0D0A0909
          3C7061746820636C6173733D226C696768742D626C75652220643D224D372E35
          2C31342E3561322C322C302C312C312C322D3241322C322C302C302C312C372E
          352C31342E355A222F3E0D0A09093C7061746820636C6173733D226C69676874
          2D626C75652220643D224D31312E3033362C352E3635372C372E3835342C382E
          38333948372E3134364C332E3936342C352E3635376C2E3730382D2E3730374C
          372C372E3237385630483856372E3237384C31302E3332382C342E39355A222F
          3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D62
          6C75657B66696C6C3A20233030356462613B206F7061636974793A20313B7D3C
          2F7374796C653E0D0A093C2F646566733E0D0A093C7469746C653E49636F6E4C
          69676874537465704F7665723C2F7469746C653E0D0A093C672069643D226361
          6E7661732220636C6173733D2263616E766173223E0D0A09093C706174682063
          6C6173733D2263616E7661732220643D224D31362C3136483056304831365A22
          2F3E0D0A093C2F673E0D0A093C672069643D226C6576656C2D31223E0D0A0909
          3C7061746820636C6173733D226C696768742D626C75652220643D224D392E35
          2C31322E3561322C322C302C312C312D322D3241322C322C302C302C312C392E
          352C31322E355A222F3E0D0A09093C7061746820636C6173733D226C69676874
          2D626C75652220643D224D31342C342E3576346C2D2E352E35682D3456386832
          2E383941352E3439342C352E3439342C302C302C302C322E3136382C392E3134
          364C312E322C382E3941362E3438352C362E3438352C302C302C312C31332C37
          2E30363956342E355A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265797B66696C6C3A20233231323132313B206F7061636974
          793A20313B7D2E6C696768742D7265647B66696C6C3A20236335306231373B20
          6F7061636974793A20313B7D2E636C732D317B6F7061636974793A302E37353B
          7D3C2F7374796C653E0D0A093C2F646566733E0D0A093C7469746C653E49636F
          6E4C69676874436C656172427265616B706F696E7447726F75703C2F7469746C
          653E0D0A093C672069643D2263616E7661732220636C6173733D2263616E7661
          73223E0D0A09093C7061746820636C6173733D2263616E7661732220643D224D
          31362C3136483056304831365A222F3E0D0A093C2F673E0D0A093C672069643D
          226C6576656C2D31223E0D0A09093C6720636C6173733D22636C732D31223E0D
          0A0909093C7061746820636C6173733D226C696768742D64656661756C746772
          65792220643D224D31362C372E3561342E3938332C342E3938332C302C302C31
          2D322E3536362C342E333441352E3935352C352E3935352C302C302C302C362E
          36362C352E3036362C342E3938332C342E3938332C302C302C312C31362C372E
          355A222F3E0D0A09093C2F673E0D0A09093C7061746820636C6173733D226C69
          6768742D64656661756C74677265792220643D224D31322E352C313161352C35
          2C302C312C312D352D3541352E3030362C352E3030362C302C302C312C31322E
          352C31315A222F3E0D0A09093C7061746820636C6173733D226C696768742D72
          65642220643D224D332E3638312C332C352E38342C352E3135356C2D2E36382E
          36384C332C332E3637342E38342C352E3833356C2D2E36382D2E36384C322E33
          31392C332C2E31362E3833372E38342E3135372C332C322E3331382C352E3136
          2E3135376C2E36382E36385A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
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
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265797B66696C6C3A20233231323132313B206F7061636974
          793A20313B7D2E6C696768742D626C75657B66696C6C3A20233030356462613B
          206F7061636974793A20313B7D2E636C732D317B6F7061636974793A302E3735
          3B7D3C2F7374796C653E0D0A093C2F646566733E0D0A093C7469746C653E4963
          6F6E4C69676874476F546F43757272656E744C696E653C2F7469746C653E0D0A
          093C672069643D2263616E7661732220636C6173733D2263616E766173223E0D
          0A09093C7061746820636C6173733D2263616E7661732220643D224D31362C31
          36483056304831365A222F3E0D0A093C2F673E0D0A093C672069643D226C6576
          656C2D31223E0D0A09093C6720636C6173733D22636C732D31223E0D0A090909
          3C7061746820636C6173733D226C696768742D64656661756C74677265792220
          643D224D312E3834332C3130482E39393356392E31355A6D31332E31352D3176
          3148352E3037396C312D315A6D2D31342C356831347631682D31345A222F3E0D
          0A09093C2F673E0D0A09093C7061746820636C6173733D226C696768742D6465
          6661756C74677265792220643D224D31302E3939332C31317632682D31305631
          315A222F3E0D0A09093C7061746820636C6173733D226C696768742D626C7565
          2220643D224D372E3939332C332E355635682D3156332E3561312E352C312E35
          2C302C302C302D332C3056382E3235384C352E3630372C362E3634346C2E3730
          372E3730372D322E352C322E3548332E3130376C2D322E352D322E352E373037
          2D2E3730374C322E3939332C382E33323256332E3561322E352C322E352C302C
          302C312C352C305A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D2E636C732D317B
          6F7061636974793A302E37353B7D3C2F7374796C653E0D0A093C2F646566733E
          0D0A093C7469746C653E49636F6E4C69676874436F70793C2F7469746C653E0D
          0A093C672069643D2263616E7661732220636C6173733D2263616E766173223E
          0D0A09093C7061746820636C6173733D2263616E7661732220643D224D31362C
          3136483056304831365A222F3E0D0A093C2F673E0D0A093C672069643D226C65
          76656C2D31223E0D0A09093C6720636C6173733D22636C732D31223E0D0A0909
          093C7061746820636C6173733D226C696768742D64656661756C74677265792D
          31302220643D224D31342E352C312E35763130483130762D374C392E352C3468
          2D3356312E355A222F3E0D0A0909093C7061746820636C6173733D226C696768
          742D64656661756C74677265792220643D224D362E352C3168386C2E352E3576
          31306C2D2E352E354831305631316834563248375634483656312E355A222F3E
          0D0A09093C2F673E0D0A09093C7061746820636C6173733D226C696768742D64
          656661756C74677265792D31302220643D224D392E352C342E35763130682D38
          56342E355A222F3E0D0A09093C7061746820636C6173733D226C696768742D64
          656661756C74677265792220643D224D312C342E357631306C2E352E3568386C
          2E352D2E3556342E354C392E352C34682D385A4D322C354839763948325A222F
          3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265797B66696C6C3A20233231323132313B206F7061636974
          793A20313B7D2E6C696768742D64656661756C74677265792D31307B66696C6C
          3A20233231323132313B206F7061636974793A20302E313B7D2E636C732D317B
          6F7061636974793A302E37353B7D3C2F7374796C653E0D0A093C2F646566733E
          0D0A093C7469746C653E49636F6E4C696768744375743C2F7469746C653E0D0A
          093C672069643D2263616E7661732220636C6173733D2263616E766173223E0D
          0A09093C7061746820636C6173733D2263616E7661732220643D224D31362C31
          36483056304831365A222F3E0D0A093C2F673E0D0A093C672069643D226C6576
          656C2D31223E0D0A09093C6720636C6173733D22636C732D31223E0D0A090909
          3C7061746820636C6173733D226C696768742D64656661756C74677265792220
          643D224D31302E3637332C31312E3734386C2D2E392E3433384C342E3833392C
          322E3036352C352E3234392E3632375A222F3E0D0A0909093C7061746820636C
          6173733D226C696768742D64656661756C74677265792220643D224D31312E31
          36312C322E3036352C362E3232352C31322E3138366C2D2E392D2E3433384C31
          302E3735312E3632375A222F3E0D0A09093C2F673E0D0A09093C706174682063
          6C6173733D226C696768742D64656661756C74677265792D31302220643D224D
          362E352C313341312E352C312E352C302C312C312C352C31312E352C312E352C
          312E352C302C302C312C362E352C31335A6D362C3041312E352C312E352C302C
          312C312C31312C31312E352C312E352C312E352C302C302C312C31322E352C31
          335A222F3E0D0A09093C7061746820636C6173733D226C696768742D64656661
          756C74677265792220643D224D352C313161322C322C302C312C302C322C3241
          322C322C302C302C302C352C31315A6D302C3361312C312C302C312C312C312D
          3141312C312C302C302C312C352C31345A6D362D3361322C322C302C312C302C
          322C3241322C322C302C302C302C31312C31315A6D302C3361312C312C302C31
          2C312C312D3141312C312C302C302C312C31312C31345A222F3E0D0A09093C70
          61746820636C6173733D226C696768742D64656661756C74677265792220643D
          224D392C372E3561312C312C302C312C312D312D3141312C312C302C302C312C
          392C372E355A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D3C2F7374796C65
          3E0D0A093C2F646566733E0D0A093C7469746C653E49636F6E4C696768745061
          7374653C2F7469746C653E0D0A093C672069643D2263616E7661732220636C61
          73733D2263616E766173223E0D0A09093C7061746820636C6173733D2263616E
          7661732220643D224D31362C3136483056304831365A222F3E0D0A093C2F673E
          0D0A093C672069643D226C6576656C2D31223E0D0A09093C7061746820636C61
          73733D226C696768742D64656661756C74677265792D31302220643D224D372C
          31342E3548322E3556332E35683130563748382E3038364C372C382E3038365A
          222F3E0D0A09093C7061746820636C6173733D226C696768742D64656661756C
          74677265792D31302220643D224D31342E352C382E357637682D36762D375A22
          2F3E0D0A09093C7061746820636C6173733D226C696768742D64656661756C74
          677265792220643D224D31342E352C38682D364C382C382E3576376C2E352E35
          68366C2E352D2E35762D375A4D31342C31354839563968355A222F3E0D0A0909
          3C7061746820636C6173733D226C696768742D64656661756C74677265792220
          643D224D372C313548322E354C322C31342E3556332E354C322E352C33683130
          6C2E352E3556374831325634483356313448375A222F3E0D0A09093C70617468
          20636C6173733D226C696768742D64656661756C74677265792220643D224D39
          2E352C3261322C322C302C302C302D342C3048345634683756325A6D2D322C31
          61312C312C302C312C312C312D3141312C312C302C302C312C372E352C335A22
          2F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D3C2F7374796C65
          3E0D0A093C2F646566733E0D0A093C7469746C653E44656C6574653C2F746974
          6C653E0D0A093C672069643D2263616E766173223E0D0A09093C706174682063
          6C6173733D2263616E7661732220643D224D31362C3136483056304831365A22
          2F3E0D0A093C2F673E0D0A093C672069643D226C6576656C2D31223E0D0A0909
          3C7061746820636C6173733D226C696768742D64656661756C74677265792D31
          302220643D224D31322E352C322E3576313348322E3556322E355A222F3E0D0A
          09093C7061746820636C6173733D226C696768742D64656661756C7467726579
          2220643D224D31342C32483130563141312C312C302C302C302C392C30483641
          312C312C302C302C302C352C3156324831563348325631352E356C2E352E3568
          31306C2E352D2E35563368315A4D362C314839563248365A6D362C3134483356
          3368395A4D352C31335635483676385A6D352C304839563568315A4D382C3133
          4837563548385A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
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
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D3C2F7374796C65
          3E0D0A093C2F646566733E0D0A093C7469746C653E49636F6E4C696768745365
          617263683C2F7469746C653E0D0A093C672069643D2263616E766173223E0D0A
          09093C7061746820636C6173733D2263616E7661732220643D224D31362C3136
          483056304831365A222F3E0D0A093C2F673E0D0A093C672069643D226C657665
          6C2D31223E0D0A09093C7061746820636C6173733D226C696768742D64656661
          756C74677265792D31302220643D224D31342E352C3641342E352C342E352C30
          2C312C312C31302C312E352C342E352C342E352C302C302C312C31342E352C36
          5A222F3E0D0A09093C7061746820636C6173733D226C696768742D6465666175
          6C74677265792220643D224D31302C3141352E3030362C352E3030362C302C30
          2C302C352C362C342E3935352C342E3935352C302C302C302C362E3136332C39
          2E3136374C312E3137372C31342E3135326C2E3730372E3730374C362E383734
          2C392E383741342E3934362C342E3934362C302C302C302C31302C31312C352C
          352C302C302C302C31302C315A6D302C3961342C342C302C312C312C342D3441
          342C342C302C302C312C31302C31305A222F3E0D0A093C2F673E0D0A3C2F7376
          673E0D0A}
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
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265797B66696C6C3A20233231323132313B206F7061636974
          793A20313B7D3C2F7374796C653E0D0A093C2F646566733E0D0A093C7469746C
          653E49636F6E4C69676874556E646F3C2F7469746C653E0D0A093C672069643D
          2263616E766173223E0D0A09093C7061746820636C6173733D2263616E766173
          2220643D224D31362C3136483056304831365A222F3E0D0A09093C7061746820
          636C6173733D2263616E7661732220643D224D31362C3136483056304831365A
          222F3E0D0A093C2F673E0D0A093C672069643D226C6576656C2D31223E0D0A09
          093C7061746820636C6173733D226C696768742D64656661756C746772657922
          20643D224D31332E3937332C352E36383941342E3537312C342E3537312C302C
          302C312C31322E38352C382E3835346C2D362C362D2E3730372D2E3730372C36
          2D3661332E36312C332E36312C302C302C302C2E38332D322E3435342C332E36
          37342C332E3637342C302C302C302D312E3032382D322E3633392C332E383932
          2C332E3839322C302C302C302D352E312D2E324C332E3730352C364838563748
          322E354C322C362E355631483356352E3239314C362E3134332C322E31343861
          342E3932362C342E3932362C302C302C312C362E3437382E313741342E363737
          2C342E3637372C302C302C312C31332E3937332C352E3638395A222F3E0D0A09
          3C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D2E6C696768742D
          626C75657B66696C6C3A20233030356462613B206F7061636974793A20313B7D
          2E636C732D317B6F7061636974793A302E37353B7D3C2F7374796C653E0D0A09
          3C2F646566733E0D0A093C7469746C653E49636F6E4C6967687453656C656374
          416C6C3C2F7469746C653E0D0A093C672069643D2263616E7661732220636C61
          73733D2263616E766173223E0D0A09093C7061746820636C6173733D2263616E
          7661732220643D224D31362C30563136483056305A222F3E0D0A093C2F673E0D
          0A093C672069643D226C6576656C2D31223E0D0A09093C6720636C6173733D22
          636C732D31223E0D0A0909093C7061746820636C6173733D226C696768742D64
          656661756C74677265792D31302220643D224D31342C312E34395631312E356C
          2D2E352E354831322E34374C392E31332C382C372E34372C362C362E36332C35
          2C362C342E323456313248312E354C312C31312E3556312E34394C312E34392C
          314831332E35315A222F3E0D0A0909093C7061746820636C6173733D226C6967
          68742D64656661756C74677265792220643D224D312C313148322E3031763148
          312E354C312C31312E355A4D322C334831563448325A4D332C32483456314833
          5A4D332C3132483456313148335A6D322C30483656313148355A4D322C314831
          2E34396C2D2E352E35563248325A4D322C354831563648325A4D322C37483156
          3848325A4D312C31304832563948315A6D31322C30683156394831335A6D302D
          36683156334831335A6D302C32683156354831335A4D31332E352E3939483133
          5632683156312E34395A4D31332C38683156374831335A4D372C324838563148
          375A4D352C324836563148355A6D382C3130682E356C2E352D2E35762D2E3531
          4831335A4D392C326831563148395A6D322C30683156314831315A222F3E0D0A
          09093C2F673E0D0A09093C7061746820636C6173733D226C696768742D646566
          61756C74677265792220643D224D382E332C37483131563848392E31335A4D33
          2C364836563548335A6D372D3148362E36336C2E38342C314831305A4D332C38
          4836563748335A4D332C335634683956335A222F3E0D0A09093C706174682063
          6C6173733D226C696768742D626C75652220643D224D392E3537352C31322E38
          36316C312E3033322C322E38342D2E3738332E3238352D312E3035352D322E39
          4C372C31342E3556376C352C365A222F3E0D0A093C2F673E0D0A3C2F7376673E
          0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C7376672069643D226C6576656C2D312220786D6C6E733D
          22687474703A2F2F7777772E77332E6F72672F323030302F7376672220766965
          77426F783D22302030203136203136223E0D0A093C646566733E0D0A09093C73
          74796C653E2E63616E7661737B66696C6C3A206E6F6E653B206F706163697479
          3A20303B7D2E6C696768742D677265656E2D31307B66696C6C3A202331663830
          31663B206F7061636974793A20302E313B7D2E6C696768742D677265656E7B66
          696C6C3A20233166383031663B206F7061636974793A20313B7D3C2F7374796C
          653E0D0A093C2F646566733E0D0A093C7469746C653E52756E4F75746C696E65
          3C2F7469746C653E0D0A093C7061746820636C6173733D2263616E7661732220
          643D224D31362C3136483056304831365A222F3E0D0A093C7061746820636C61
          73733D226C696768742D677265656E2D31302220643D224D31322E352C372E34
          37316C2D392C36762D31325A222F3E0D0A093C7061746820636C6173733D226C
          696768742D677265656E2220643D224D332E3737372C312E3038342C332C312E
          357631326C2E3737372E3431362C392D3656372E3038345A4D342C31322E3536
          3556322E3433354C31312E362C372E355A222F3E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D72
          65647B66696C6C3A20236335306231373B206F7061636974793A20313B7D2E63
          6C732D317B6F7061636974793A302E37353B7D3C2F7374796C653E0D0A093C2F
          646566733E0D0A093C7469746C653E49636F6E4C6967687453746F703C2F7469
          746C653E0D0A093C672069643D2263616E7661732220636C6173733D2263616E
          766173223E0D0A09093C7061746820636C6173733D2263616E7661732220643D
          224D31362C3136483056304831365A222F3E0D0A093C2F673E0D0A093C672069
          643D226C6576656C2D31223E0D0A09093C6720636C6173733D22636C732D3122
          3E0D0A0909093C7061746820636C6173733D226C696768742D7265642220643D
          224D31322E352C332E357639682D39762D395A222F3E0D0A09093C2F673E0D0A
          09093C7061746820636C6173733D226C696768742D7265642220643D224D3132
          2E352C33682D394C332C332E3576396C2E352E3568396C2E352D2E35762D395A
          4D31322C31324834563468385A222F3E0D0A093C2F673E0D0A3C2F7376673E0D
          0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265797B66696C6C3A20233231323132313B206F7061636974
          793A20313B7D2E636C732D317B6F7061636974793A302E37353B7D3C2F737479
          6C653E0D0A093C2F646566733E0D0A093C7469746C653E49636F6E4C69676874
          50617573653C2F7469746C653E0D0A093C672069643D2263616E766173222063
          6C6173733D2263616E766173223E0D0A09093C7061746820636C6173733D2263
          616E7661732220643D224D31362C3136483056304831365A222F3E0D0A093C2F
          673E0D0A093C672069643D226C6576656C2D31223E0D0A09093C6720636C6173
          733D22636C732D31223E0D0A0909093C7061746820636C6173733D226C696768
          742D64656661756C74677265792220643D224D362E352C332E357639682D3376
          2D395A222F3E0D0A0909093C7061746820636C6173733D226C696768742D6465
          6661756C74677265792220643D224D31322E352C332E357639682D33762D395A
          222F3E0D0A09093C2F673E0D0A09093C7061746820636C6173733D226C696768
          742D64656661756C74677265792220643D224D31322E352C33682D334C392C33
          2E3576396C2E352E3568336C2E352D2E35762D395A4D31322C31324831305634
          68325A4D362E352C33682D334C332C332E3576396C2E352E3568336C2E352D2E
          35762D395A4D362C31324834563448365A222F3E0D0A093C2F673E0D0A3C2F73
          76673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D67
          7265656E2D31307B66696C6C3A20233166383031663B206F7061636974793A20
          302E313B7D2E6C696768742D677265656E7B66696C6C3A20233166383031663B
          206F7061636974793A20313B7D3C2F7374796C653E0D0A093C2F646566733E0D
          0A093C7469746C653E52756E416C6C3C2F7469746C653E0D0A093C672069643D
          2263616E766173223E0D0A09093C7061746820636C6173733D2263616E766173
          2220643D224D31362C3136483056304831365A222F3E0D0A093C2F673E0D0A09
          3C672069643D226C6576656C2D31223E0D0A09093C7061746820636C6173733D
          226C696768742D677265656E2D31302220643D224D312E352C312E3437763132
          4C352C31312E313456332E385A222F3E0D0A09093C7061746820636C6173733D
          226C696768742D677265656E2220643D224D312E37382C312E30382C312C312E
          357631326C2E37382E34324C352C31312E3737762D312E326C2D332C3256322E
          34336C332C3256332E32335A222F3E0D0A09093C7061746820636C6173733D22
          6C696768742D677265656E2220643D224D362E3737372C312E3038342C362C31
          2E357631326C2E3737372E3431362C392D3656372E3038345A222F3E0D0A093C
          2F673E0D0A3C2F7376673E0D0A}
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
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D2E6C696768742D
          626C75657B66696C6C3A20233030356462613B206F7061636974793A20313B7D
          2E636C732D317B6F7061636974793A302E37353B7D3C2F7374796C653E0D0A09
          3C2F646566733E0D0A093C7469746C653E4275696C64536F6C7574696F6E3C2F
          7469746C653E0D0A093C672069643D2263616E766173223E0D0A09093C706174
          6820636C6173733D2263616E7661732220643D224D31362C3136483056304831
          365A222F3E0D0A093C2F673E0D0A093C672069643D226C6576656C2D31223E0D
          0A09093C6720636C6173733D22636C732D31223E0D0A0909093C706174682063
          6C6173733D226C696768742D64656661756C74677265792D31302220643D224D
          31342C3576394832563548332E3837384C362E3733322C372E38353448382E32
          36384C31312E3132322C355A222F3E0D0A0909093C7061746820636C6173733D
          226C696768742D64656661756C74677265792220643D224D31352C3576392E35
          6C2D2E352E3548312E354C312C31342E3556354832763948313456355A222F3E
          0D0A09093C2F673E0D0A09093C7061746820636C6173733D226C696768742D64
          656661756C74677265792220643D224D31312C3131763248395631315A4D372C
          3131763248355631315A4D352C387632483356385A4D392C387632483756385A
          6D342C30763248313156385A222F3E0D0A09093C7061746820636C6173733D22
          6C696768742D626C75652220643D224D31302E3335342C342E3335346C2D322E
          352C322E3548372E3134366C2D322E352D322E352E3730382D2E3730374C372C
          352E3239335630483856352E3239334C392E3634362C332E3634375A222F3E0D
          0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265797B66696C6C3A20233231323132313B206F7061636974
          793A20313B7D2E6C696768742D64656661756C74677265792D31307B66696C6C
          3A20233231323132313B206F7061636974793A20302E313B7D2E6C696768742D
          626C75657B66696C6C3A20233030356462613B206F7061636974793A20313B7D
          3C2F7374796C653E0D0A093C2F646566733E0D0A093C7469746C653E49636F6E
          4C6967687446696E644E6578743C2F7469746C653E0D0A093C672069643D2263
          616E766173223E0D0A09093C7061746820636C6173733D2263616E7661732220
          643D224D31362C3136483056304831365A222F3E0D0A093C2F673E0D0A093C67
          2069643D226C6576656C2D31223E0D0A09093C7061746820636C6173733D226C
          696768742D64656661756C74677265792220643D224D362E3536342C392E3135
          6C2D342E37312C342E372D2E3730382D2E3730382C342E37312D342E3741342E
          3031352C342E3031352C302C302C302C362E3536342C392E31355A222F3E0D0A
          09093C7061746820636C6173733D226C696768742D64656661756C7467726579
          2D31302220643D224D31322E352C3641332E352C332E352C302C312C312C392C
          322E352C332E352C332E352C302C302C312C31322E352C365A222F3E0D0A0909
          3C7061746820636C6173733D226C696768742D64656661756C74677265792220
          643D224D392C313061342C342C302C312C312C342D3441342C342C302C302C31
          2C392C31305A4D392C3361332C332C302C312C302C332C3341332C332C302C30
          2C302C392C335A222F3E0D0A09093C7061746820636C6173733D226C69676874
          2D626C75652220643D224D31302C313268342E3239346C2D312E3134382D312E
          3134372E3730382D2E3730382C322C32762E3730386C2D322C322D2E3730382D
          2E3730384C31342E3239322C31334831305A222F3E0D0A093C2F673E0D0A3C2F
          7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D62
          6C75657B66696C6C3A20233030356462613B206F7061636974793A20313B7D3C
          2F7374796C653E0D0A093C2F646566733E0D0A093C7469746C653E49636F6E4C
          69676874537465704F75743C2F7469746C653E0D0A093C672069643D2263616E
          7661732220636C6173733D2263616E766173223E0D0A09093C7061746820636C
          6173733D2263616E7661732220643D224D31362C3136483056304831365A222F
          3E0D0A093C2F673E0D0A093C672069643D226C6576656C2D31223E0D0A09093C
          7061746820636C6173733D226C696768742D626C75652220643D224D372E352C
          31342E3561322C322C302C312C312C322D3241322C322C302C302C312C372E35
          2C31342E355A222F3E0D0A09093C7061746820636C6173733D226C696768742D
          626C75652220643D224D31302E342C342E312C382C312E373037563948375631
          2E3730374C342E362C342E312C332E392C332E342C372E3134362E313436682E
          3730384C31312E312C332E345A222F3E0D0A093C2F673E0D0A3C2F7376673E0D
          0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D3C2F7374796C65
          3E0D0A093C2F646566733E0D0A093C7469746C653E4C61796F757450616E656C
          3C2F7469746C653E0D0A093C672069643D2263616E766173223E0D0A09093C70
          61746820636C6173733D2263616E7661732220643D224D31362C313648305630
          4831365A222F3E0D0A093C2F673E0D0A093C672069643D226C6576656C2D3122
          3E0D0A09093C7061746820636C6173733D226C696768742D64656661756C7467
          7265792D31302220643D224D31342C322E357631326C2D2E352E3548312E354C
          312C31342E3556334C322C324831332E355A222F3E0D0A09093C706174682063
          6C6173733D226C696768742D64656661756C74677265792220643D224D31332C
          31346831762E356C2D2E352E354831335A4D392C3135683156313448395A6D32
          2C3068315631344831315A4D372C3135483856313448375A4D352C3135483656
          313448355A4D332C3135483456313448335A6D2D322D2E352E352E3548325631
          3448315A4D312C3131483256313048315A6D302C32483256313248315A4D312C
          394832563848315A4D312C374832563648315A4D312C354832563448315A4D34
          2C324833563348345A4D362C324835563348365A6D342C304839563368315A6D
          312C31683156324831315A4D382C324837563348385A6D352E352C3048313356
          33683156322E355A4D312C322E3556334832563248312E355A4D31332C313168
          315631304831335A6D302C3268315631324831335A6D302D3468315638483133
          5A6D302D32683156364831335A6D302D32683156344831335A4D332C34683956
          3848335A4D342C376837563548345A4D382C396834763348385A6D312C326832
          56313048395A4D372C31324833563948375A4D362C31304834763148365A222F
          3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D3C2F7374796C65
          3E0D0A093C2F646566733E0D0A093C7469746C653E49636F6E4C696768744365
          7274696669636174653C2F7469746C653E0D0A093C672069643D2263616E7661
          732220636C6173733D2263616E766173223E0D0A09093C7061746820636C6173
          733D2263616E7661732220643D224D31362C3136483056304831365A222F3E0D
          0A093C2F673E0D0A093C672069643D226C6576656C2D31223E0D0A09093C7061
          746820636C6173733D226C696768742D64656661756C74677265792D31302220
          643D224D31342E352C312E35763130483756382E393432483741332E3439332C
          332E3439332C302C302C302C322E352C332E36333556312E355A222F3E0D0A09
          093C7061746820636C6173733D226C696768742D64656661756C746772657922
          20643D224D31322C345635483956345A4D392C376833563648395A222F3E0D0A
          09093C7061746820636C6173733D226C696768742D64656661756C7467726579
          2220643D224D31352C312E357631306C2D2E352E354837563131483856313048
          3976316831563130683176316831563130683176316831563130483133563968
          3156384831335637683156364831335635683156344831335633683156324831
          3356334831325632483131563348313056324839563348385632483756334836
          56324835563348345632483356332E33353161332E3531352C332E3531352C30
          2C302C302D312C2E37303756312E354C322E352C316831325A222F3E0D0A0909
          3C7061746820636C6173733D226C696768742D64656661756C74677265792D31
          302220643D224D342E352C313061332E34382C332E34382C302C302C302C322D
          2E3633355631342E356C2D322D322D322C3256392E33363541332E34382C332E
          34382C302C302C302C342E352C31305A6D302D362E3561332C332C302C312C30
          2C332C3341332C332C302C302C302C342E352C332E355A222F3E0D0A09093C70
          61746820636C6173733D226C696768742D64656661756C74677265792220643D
          224D382C362E3541332E352C332E352C302C312C302C322C382E393432483256
          31342E356C2E3835342E3335344C342E352C31332E3230376C312E3634362C31
          2E3634374C372C31342E3556382E393432483741332E3438352C332E3438352C
          302C302C302C382C362E355A4D362C392E36343976332E3634344C342E383534
          2C31322E31343648342E3134364C332C31332E32393356392E36343948336133
          2E3338312C332E3338312C302C302C302C332C305A4D342E352C3941322E352C
          322E352C302C312C312C372C362E352C322E352C322E352C302C302C312C342E
          352C395A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D2E6C696768742D
          626C75657B66696C6C3A20233030356462613B206F7061636974793A20313B7D
          2E77686974657B66696C6C3A20236666666666663B206F7061636974793A2031
          3B7D2E636C732D317B6F7061636974793A302E37353B7D3C2F7374796C653E0D
          0A093C2F646566733E0D0A093C7469746C653E436F6D70696C656448656C7046
          696C653C2F7469746C653E0D0A093C672069643D2263616E766173223E0D0A09
          093C7061746820636C6173733D2263616E7661732220643D224D31362C313648
          3056304831365A222F3E0D0A093C2F673E0D0A093C672069643D226C6576656C
          2D31223E0D0A09093C6720636C6173733D22636C732D31223E0D0A0909093C70
          61746820636C6173733D226C696768742D64656661756C74677265792D313022
          20643D224D372E3235342C31332E3548312E3556312E3568376C332C3356372E
          303541342E3930372C342E3930372C302C302C302C372E3235342C31332E355A
          222F3E0D0A0909093C7061746820636C6173733D226C696768742D6465666175
          6C74677265792220643D224D372E3432322C313448312E354C312C31332E3556
          312E354C312E352C3168376C2E3335342E3134362C332C334C31322C342E3556
          3761342E3938382C342E3938382C302C302C302D312C2E315635483856324832
          56313348372E3141342E3936382C342E3936382C302C302C302C372E3432322C
          31345A222F3E0D0A0909093C7061746820636C6173733D226C696768742D6465
          6661756C74677265792220643D224D372C354833563448375A6D332C322E3432
          3256374833563848392E30323741352E3031362C352E3031362C302C302C312C
          31302C372E3432325A4D372E3432322C31304833763148372E3141342E393638
          2C342E3936382C302C302C312C372E3432322C31305A222F3E0D0A09093C2F67
          3E0D0A09093C7061746820636C6173733D226C696768742D626C75652220643D
          224D31322C313661342C342C302C312C312C342D3441342C342C302C302C312C
          31322C31365A222F3E0D0A09093C7061746820636C6173733D22776869746522
          20643D224D31312E3537312C31342E383133762D2E38682E383538762E385A4D
          31322C392E31383861312E3733312C312E3733312C302C302C312C2E3636332E
          3132352C312E38362C312E38362C302C302C312C2E3534392E3334352C312E34
          38382C312E3438382C302C302C312C2E3336382E3530392C312E3630382C312E
          3630382C302C302C312C2E3133342E3632382C312E3239332C312E3239332C30
          2C302C312D2E3039332E3530382C312E3730362C312E3730362C302C302C312D
          2E3234382E3430382C332C332C302C302C312D2E3334382E333538712D2E322E
          3136392D2E342E333634612E3534332E3534332C302C302C302D2E3136372E32
          36342C312E3533322C312E3533322C302C302C302D2E30342E33762E31612E38
          2E382C302C302C302C2E3030372E313036682D2E383538762D2E3361312E3239
          2C312E32392C302C302C312C2E3039342D2E35303841312E3639322C312E3639
          322C302C302C312C31312E392C313261312E3934332C312E3934332C302C302C
          312C2E3331342D2E3331342C322E3734352C322E3734352C302C302C302C2E33
          30382D2E323832632E30392D2E312E31372D2E3139312E3234312D2E32383361
          2E3435372E3435372C302C302C302C2E3039342D2E3332362E3733312E373331
          2C302C302C302D2E3036372D2E3331342E3738332E3738332C302C302C302D2E
          3138312D2E3235312E3932322E3932322C302C302C302D2E3237342D2E313736
          412E3737322E3737322C302C302C302C31322C392E393931612E3837362E3837
          362C302C302C302D2E3333352E3036332E3836372E3836372C302C302C302D2E
          3236382E3136392E3837372E3837372C302C302C302D2E3138372E3235382E36
          33392E3633392C302C302C302D2E3036372E333134682D2E38353761312E3435
          322C312E3435322C302C302C312C2E3133342D2E3632322C312E3731392C312E
          3731392C302C302C312C2E3336382D2E3531352C312E3632382C312E3632382C
          302C302C312C2E3534322D2E33343541312E3934362C312E3934362C302C302C
          312C31322C392E3138385A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D67
          7265656E7B66696C6C3A20233166383031663B206F7061636974793A20313B7D
          2E636C732D317B6F7061636974793A302E37353B7D3C2F7374796C653E0D0A09
          3C2F646566733E0D0A093C7469746C653E49636F6E4C6967687452756E506175
          7365643C2F7469746C653E0D0A093C672069643D2263616E7661732220636C61
          73733D2263616E766173223E0D0A09093C7061746820636C6173733D2263616E
          7661732220643D224D31362C3136483056304831365A222F3E0D0A093C2F673E
          0D0A093C672069643D226C6576656C2D31223E0D0A09093C6720636C6173733D
          22636C732D31223E0D0A0909093C7061746820636C6173733D226C696768742D
          677265656E2220643D224D31342E352C386C2D372C342E33373556332E363235
          5A222F3E0D0A09093C2F673E0D0A09093C7061746820636C6173733D226C6967
          68742D677265656E2220643D224D342C33563133483356335A222F3E0D0A0909
          3C7061746820636C6173733D226C696768742D677265656E2220643D224D372E
          3736352C332E322C372C332E36323576382E37356C2E3736352E3432342C372D
          342E33373556372E3537365A4D382C31312E34373356342E3532374C31332E35
          35372C385A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C7376672076696577426F783D2230203020313620313622
          2076657273696F6E3D22312E31222069643D2273766732302220786D6C6E733D
          22687474703A2F2F7777772E77332E6F72672F323030302F7376672220786D6C
          6E733A7376673D22687474703A2F2F7777772E77332E6F72672F323030302F73
          76672220786D6C6E733A7264663D22687474703A2F2F7777772E77332E6F7267
          2F313939392F30322F32322D7264662D73796E7461782D6E73232220786D6C6E
          733A63633D22687474703A2F2F6372656174697665636F6D6D6F6E732E6F7267
          2F6E73232220786D6C6E733A64633D22687474703A2F2F7075726C2E6F72672F
          64632F656C656D656E74732F312E312F223E0D0A093C646566732069643D2264
          65667334223E0D0A09093C7374796C652069643D227374796C6532223E2E6361
          6E7661737B66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C69
          6768742D677265656E7B66696C6C3A20233166383031663B206F706163697479
          3A20313B7D2E636C732D317B6F7061636974793A302E37353B7D3C2F7374796C
          653E0D0A093C2F646566733E0D0A093C7469746C652069643D227469746C6536
          223E49636F6E4C6967687452756E46696E616C697A6174696F6E3C2F7469746C
          653E0D0A093C672069643D2263616E7661732220636C6173733D2263616E7661
          73223E0D0A09093C7061746820636C6173733D2263616E7661732220643D224D
          31362C3136483056304831365A222069643D227061746838222F3E0D0A093C2F
          673E0D0A093C672069643D226C6576656C2D3122207472616E73666F726D3D22
          7472616E736C61746528302E323836303631392C35652D3429223E0D0A09093C
          7061746820636C6173733D226C696768742D677265656E2220643D224D203134
          2E3339323033342C352E3536313032393620562031302E343337393720482039
          2E37303936373731205620352E35363130323936205A222069643D2270617468
          313522207374796C653D227374726F6B652D77696474683A302E353B66696C6C
          3A233166383031663B66696C6C2D6F7061636974793A302E3734393031393632
          3B7374726F6B653A233166383031663B7374726F6B652D6F7061636974793A31
          3B7374726F6B652D6461736861727261793A6E6F6E65222F3E0D0A09093C6720
          636C6173733D22636C732D31222069643D2267313322207472616E73666F726D
          3D227472616E736C617465282D352E3936343135373829223E0D0A0909093C70
          61746820636C6173733D226C696768742D677265656E2220643D226D2031342E
          352C372E39393935202D372C342E3337352076202D382E3735207A222069643D
          22706174683131222F3E0D0A09093C2F673E0D0A09093C7061746820636C6173
          733D226C696768742D677265656E2220643D226D20312E383030383432322C33
          2E32202D302E3736352C302E343235207620382E3735206C20302E3736352C30
          2E34323420372C2D342E333735205620372E353736205A206D20302E3233352C
          382E323733205620342E353237206C20352E3535372C332E343733207A222069
          643D22706174683137222F3E0D0A093C2F673E0D0A093C6D6574616461746120
          69643D226D6574616461746133303937223E0D0A09093C7264663A5244463E0D
          0A0909093C63633A576F726B207264663A61626F75743D22223E0D0A09090909
          3C64633A7469746C653E49636F6E4C6967687452756E46696E616C697A617469
          6F6E3C2F64633A7469746C653E0D0A0909093C2F63633A576F726B3E0D0A0909
          3C2F7264663A5244463E0D0A093C2F6D657461646174613E0D0A3C2F7376673E
          0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D3C2F7374796C65
          3E0D0A093C2F646566733E0D0A093C7469746C653E49636F6E4C696768745061
          636B6167653C2F7469746C653E0D0A093C672069643D2263616E766173223E0D
          0A09093C7061746820636C6173733D2263616E7661732220643D224D31362C31
          36483056304831365A222F3E0D0A093C2F673E0D0A093C672069643D226C6576
          656C2D31223E0D0A09093C7061746820636C6173733D226C696768742D646566
          61756C74677265792D31302220643D224D322E352C352E35683131763948322E
          355A222F3E0D0A09093C7061746820636C6173733D226C696768742D64656661
          756C74677265792220643D224D31312E392C3561312E3831362C312E3831362C
          302C302C302C2E3433322D2E3837382C312E3931332C312E3931332C302C302C
          302D312E3536332D322E3243392E3538382C312E3732322C392C322E3537352C
          382E3631322C332E333432632D2E3037362E3135312D2E3239352E3634312D2E
          3532362C312E31364C382C342E3638356C2D2E312D2E32313751372E3635372C
          332E392C372E342C332E333432632D2E3338362D2E3736372D2E3937312D312E
          36322D322E3135372D312E34323361312E39312C312E39312C302C302C302D31
          2E3536342C322E3241312E3831362C312E3831362C302C302C302C342E313036
          2C3548322E354C322C352E3576396C2E352E356831316C2E352D2E35762D394C
          31332E352C355A4D392E3530362C332E373931632E3435382D2E3931332E3736
          342D2E3934322C312E312D2E383835612E39312E39312C302C302C312C2E3734
          342C312E3034392C312E3037312C312E3037312C302C302C312D2E3531362E36
          3841372E3237362C372E3237362C302C302C312C31302E3138372C3548382E39
          35384C392C342E393143392E3232322C342E3430392C392E3433322C332E3933
          372C392E3530362C332E3739315A6D2D342E33332E38343361312E30372C312E
          30372C302C302C312D2E3531352D2E363739412E3930382E3930382C302C302C
          312C352E342C322E3930366830632E33332D2E3035372E3633382D2E3032362C
          312E3039352E3838362E3037322E3134332E3237342E362E3439322C312E3038
          354C372E3034382C3548352E38313941372E3238372C372E3238372C302C302C
          312C352E3137362C342E3633345A4D372E352C31344833563648372E355A4D31
          332C313448382E3556364831335A222F3E0D0A093C2F673E0D0A3C2F7376673E
          0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D79
          656C6C6F772D31307B66696C6C3A20233939366630303B206F7061636974793A
          20302E313B7D2E6C696768742D64656661756C74677265792D31307B66696C6C
          3A20233231323132313B206F7061636974793A20302E313B7D2E6C696768742D
          79656C6C6F777B66696C6C3A20233939366630303B206F7061636974793A2031
          3B7D2E6C696768742D64656661756C74677265797B66696C6C3A202332313231
          32313B206F7061636974793A20313B7D3C2F7374796C653E0D0A093C2F646566
          733E0D0A093C7469746C653E49636F6E4C6967687444657369676E4D6F64653C
          2F7469746C653E0D0A093C672069643D2243616E766173223E0D0A09093C7061
          746820636C6173733D2263616E7661732220643D224D31362C31364830563048
          31365A222F3E0D0A093C2F673E0D0A093C672069643D226C6576656C2D31223E
          0D0A09093C7061746820636C6173733D226C696768742D79656C6C6F772D3130
          2220643D224D31342E352C31352E35482E35762D346831345A222F3E0D0A0909
          3C7061746820636C6173733D226C696768742D64656661756C74677265792D31
          302220643D224D31312E352C392E35682D39562E355A222F3E0D0A09093C7061
          746820636C6173733D226C696768742D79656C6C6F772220643D224D31342E35
          2C3131482E356C2D2E352E3576346C2E352E356831346C2E352D2E35762D345A
          4D31342C31354831563132483376324834563132483576314836563132483776
          32483856313248397631683156313268317632683156313268325A222F3E0D0A
          09093C7061746820636C6173733D226C696768742D64656661756C7467726579
          2220643D224D31312E352C3130682D394C322C392E35562E354C322E3835342E
          3134366C392C395A4D332C3968372E3239334C332C312E3730375A222F3E0D0A
          093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D3C2F7374796C65
          3E0D0A093C2F646566733E0D0A093C7469746C653E49636F6E4C696768744465
          6275673C2F7469746C653E0D0A093C672069643D2263616E7661732220636C61
          73733D2263616E766173223E0D0A09093C7061746820636C6173733D2263616E
          7661732220643D224D31362C3136483056304831365A222F3E0D0A093C2F673E
          0D0A093C672069643D226C6576656C2D31223E0D0A09093C7061746820636C61
          73733D226C696768742D64656661756C74677265792D31302220643D224D3132
          2E352C313061342E352C342E352C302C302C312D392C30563961342E352C342E
          352C302C302C312C392C305A222F3E0D0A09093C7061746820636C6173733D22
          6C696768742D64656661756C74677265792D31302220643D224D362E3437372C
          342E37383361322C322C302C312C312C332E3034362C3041342E3435362C342E
          3435362C302C302C302C382C342E352C342E3435362C342E3435362C302C302C
          302C362E3437372C342E3738335A222F3E0D0A09093C7061746820636C617373
          3D226C696768742D64656661756C74677265792220643D224D31342E352C3748
          31322E35373661342E3933352C342E3933352C302C302C302D2E3437352D2E38
          34366C312E3735372D312E384C31342C34563248313356332E386C2D312E3535
          342C312E3661352C352C302C302C302D312E322D2E38333541322E3431352C32
          2E3431352C302C302C302C31302E352C332E3561322E34382C322E34382C302C
          302C302D2E3633392D312E3635346C2E3939332D2E3939324C31302E3134362E
          3134362C392E3035332C312E323461322E34332C322E34332C302C302C302D32
          2E3130362C304C352E3835342E3134362C352E3134362E3835346C2E3939332E
          39393241322E34382C322E34382C302C302C302C352E352C332E3561322E3431
          352C322E3431352C302C302C302C2E3235312C312E3035392C352C352C302C30
          2C302D312E322E3833354C332C332E385632483256346C2E3134322E3334394C
          332E392C362E31353441342E3933352C342E3933352C302C302C302C332E3432
          342C3748312E354C312C372E355631304832563848332E3141352C352C302C30
          2C302C332C39763161342E3933372C342E3933372C302C302C302C2E322C312E
          3332384C322E31312C31322E3638372C322C3133763248335631332E3137366C
          2E3633342D2E37383961342E3935342C342E3935342C302C302C302C382E3733
          322C306C2E3633342E37383956313568315631336C2D2E31312D2E3331334C31
          322E382C31312E33323841342E3933372C342E3933372C302C302C302C31332C
          3130563961352C352C302C302C302D2E312D314831347632683156372E355A4D
          362E3637372C342E31393241312E3433332C312E3433332C302C302C312C362E
          352C332E3561312E352C312E352C302C302C312C332C302C312E3433332C312E
          3433332C302C302C312D2E3137372E363932632D2E3032382D2E3030382D2E30
          35362D2E30312D2E3038342D2E3031382D2E3133392D2E3033362D2E3237382D
          2E3036382D2E3432322D2E30393141342E3535362C342E3535362C302C302C30
          2C382C3461342E3535362C342E3535362C302C302C302D2E3831372E30383363
          2D2E3134342E3032332D2E3238332E3035352D2E3432322E30393143362E3733
          332C342E3138322C362E3730352C342E3138342C362E3637372C342E3139325A
          4D382C313461342C342C302C302C312D342D34563941342C342C302C302C312C
          362E3634352C352E323532683061342E3633352C342E3633352C302C302C312C
          2E3635392D2E31383341332E3937342C332E3937342C302C302C312C382C3561
          332E3937342C332E3937342C302C302C312C2E372E30372C342E3633352C342E
          3633352C302C302C312C2E3635392E313833683041342C342C302C302C312C31
          322C39763141342C342C302C302C312C382C31345A222F3E0D0A09093C706174
          6820636C6173733D226C696768742D64656661756C74677265792220643D224D
          382E3730372C392E356C312E392C312E394C392E392C31322E312C382C31302E
          3230372C362E312C31322E312C352E342C31312E346C312E392D312E394C352E
          342C372E362C362E312C362E392C382C382E3739332C392E392C362E392C3130
          2E362C372E365A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D2E6C696768742D
          626C75652D31307B66696C6C3A20233030356462613B206F7061636974793A20
          302E313B7D2E6C696768742D626C75657B66696C6C3A20233030356462613B20
          6F7061636974793A20313B7D2E636C732D317B6F7061636974793A302E37353B
          7D3C2F7374796C653E0D0A093C2F646566733E0D0A093C7469746C653E536176
          6546696C654469616C6F673C2F7469746C653E0D0A093C672069643D2263616E
          766173223E0D0A09093C7061746820636C6173733D2263616E7661732220643D
          224D31362C3136483056304831365A222F3E0D0A093C2F673E0D0A093C672069
          643D226C6576656C2D31223E0D0A09093C7061746820636C6173733D226C6967
          68742D64656661756C74677265792D31302220643D224D392C33563568355633
          5A222F3E0D0A09093C7061746820636C6173733D226C696768742D6465666175
          6C74677265792220643D224D31342E352C3248382E38384C392C322E33563368
          3556354839563668352E356C2E352D2E35762D335A222F3E0D0A09093C672063
          6C6173733D22636C732D31223E0D0A0909093C7061746820636C6173733D226C
          696768742D64656661756C74677265792D31302220643D224D392C3556372E39
          314C372E39312C3948312E35763468313356355A222F3E0D0A0909093C706174
          6820636C6173733D226C696768742D64656661756C74677265792220643D224D
          31342E352C35483956366835763748325639483176342E356C2E352E35683133
          6C2E352D2E35762D385A222F3E0D0A09093C2F673E0D0A09093C706174682063
          6C6173733D226C696768742D626C75652D31302220643D224D2E352E3568356C
          322C327635482E355A222F3E0D0A09093C7061746820636C6173733D226C6967
          68742D626C75652220643D224D372E3835342C322E3134366C2D322D324C352E
          352C30482E354C302C2E3576374C2E352C3868374C382C372E35762D355A4D34
          2C315633483356315A4D372C3748315631483256332E356C2E352E3568324C35
          2C332E355631682E3239334C372C322E3730375A222F3E0D0A093C2F673E0D0A
          3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D2E6C696768742D
          626C75657B66696C6C3A20233030356462613B206F7061636974793A20313B7D
          3C2F7374796C653E0D0A093C2F646566733E0D0A093C7469746C653E496E7370
          6563743C2F7469746C653E0D0A093C672069643D2263616E766173223E0D0A09
          093C7061746820636C6173733D2263616E7661732220643D224D31362C313648
          3056304831365A222F3E0D0A093C2F673E0D0A093C672069643D226C6576656C
          2D31223E0D0A09093C7061746820636C6173733D226C696768742D6465666175
          6C74677265792D31302220643D224D31342E352C322E3576384831322E373138
          6C2D362E3636372D385A6D2D31332C384835762D3848312E355A222F3E0D0A09
          093C7061746820636C6173733D226C696768742D64656661756C746772657922
          20643D224D31352C322E3576386C2D2E352E354831332E3133344C31322E332C
          31304831345633483276374835763148312E354C312C31302E35762D384C312E
          352C326831335A222F3E0D0A09093C7061746820636C6173733D226C69676874
          2D626C75652220643D224D392E30392C31312E3033346C312E33382C332E382D
          2E39342E3334324C382E3132332C31312E332C362C313356346C362C372E325A
          222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D2E636C732D317B
          6F7061636974793A302E37353B7D3C2F7374796C653E0D0A093C2F646566733E
          0D0A093C7469746C653E49636F6E4C6967687457617463683C2F7469746C653E
          0D0A093C672069643D2263616E766173223E0D0A09093C7061746820636C6173
          733D2263616E7661732220643D224D31362C30563136483056305A222F3E0D0A
          093C2F673E0D0A093C672069643D226C6576656C2D31223E0D0A09093C706174
          6820636C6173733D226C696768742D64656661756C74677265792D3130222064
          3D224D31342C31322E3548392E354C382E352C313056382E3568365631305A6D
          2D31332C3048352E356C312D322E3556382E35482E355631305A222F3E0D0A09
          093C7061746820636C6173733D226C696768742D64656661756C746772657922
          20643D224D31342E352C38682D364C382C382E35563948362E3938394C372C38
          2E352C362E352C38482E354C302C382E356C2E30312C312E362E352C322E354C
          312C313348352E356C2E3436342D2E3331342C312D322E3556313048386C312E
          3033362C322E3638364C392E352C31334831346C2E34392D2E344C31352C3130
          56382E355A4D362C392E392C352E3136322C313248312E3430384C312C313056
          3948365A4D31332E35392C313248392E3833384C392C392E39563968356C2E30
          30372E395A222F3E0D0A09093C6720636C6173733D22636C732D31223E0D0A09
          09093C7061746820636C6173733D226C696768742D64656661756C7467726579
          2220643D224D31342E3934372C382E3237366C2D322E352D354C31322C334831
          30563468312E3639316C322C344831342E356C2E352E355A4D302C382E352E35
          2C38682E3830396C322D344835563348336C2D2E3434372E3237362D322E352C
          355A222F3E0D0A09093C2F673E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D6C
          69676874626C75652D31307B66696C6C3A20233030373761303B206F70616369
          74793A20302E313B7D2E6C696768742D6C69676874626C75657B66696C6C3A20
          233030373761303B206F7061636974793A20313B7D2E6C696768742D64656661
          756C74677265792D31307B66696C6C3A20233231323132313B206F7061636974
          793A20302E313B7D2E6C696768742D64656661756C74677265797B66696C6C3A
          20233231323132313B206F7061636974793A20313B7D3C2F7374796C653E0D0A
          093C2F646566733E0D0A093C7469746C653E49636F6E4C6967687443616C6C53
          7461636B57696E646F773C2F7469746C653E0D0A093C672069643D2263616E76
          61732220636C6173733D2263616E766173223E0D0A09093C7061746820636C61
          73733D2263616E7661732220643D224D31362C3136483056304831365A222F3E
          0D0A093C2F673E0D0A093C672069643D226C6576656C2D31223E0D0A09093C70
          61746820636C6173733D226C696768742D6C69676874626C75652D3130222064
          3D224D332C31342E3541312E352C312E352C302C302C312C312E352C31335638
          41312E352C312E352C302C302C312C332C362E3548342E357632682D31763468
          3176325A222F3E0D0A09093C7061746820636C6173733D226C696768742D6C69
          676874626C75652220643D224D342C37563848332E354C332C382E3576346C2E
          352E3548347631483361312C312C302C302C312D312D31563841312C312C302C
          302C312C332C375A4D312C38763561322C322C302C302C302C322C3248342E35
          6C2E352D2E35762D324C342E352C313248345639682E354C352C382E35762D32
          4C342E352C36483341322C322C302C302C302C312C385A222F3E0D0A09093C70
          61746820636C6173733D226C696768742D64656661756C74677265792D313022
          20643D224D31342E352C312E35763248312E35762D325A6D2D382C376838762D
          32682D385A6D302C356838762D32682D385A222F3E0D0A09093C706174682063
          6C6173733D226C696768742D64656661756C74677265792220643D224D31342E
          352C3148312E354C312C312E3576326C2E352E356831336C2E352D2E35762D32
          5A4D31342C33483256324831345A4D362E352C362C362C362E3576326C2E352E
          3568386C2E352D2E35762D324C31342E352C365A4D31342C384837563768375A
          4D362E352C31316C2D2E352E3576326C2E352E3568386C2E352D2E35762D326C
          2D2E352D2E355A4D31342C3133483756313268375A222F3E0D0A093C2F673E0D
          0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D2E6C696768742D
          7265647B66696C6C3A20236335306231373B206F7061636974793A20313B7D2E
          636C732D317B6F7061636974793A302E37353B7D3C2F7374796C653E0D0A093C
          2F646566733E0D0A093C7469746C653E49636F6E4C69676874427265616B706F
          696E747357696E646F773C2F7469746C653E0D0A093C672069643D2263616E76
          61732220636C6173733D2263616E766173223E0D0A09093C7061746820636C61
          73733D2263616E7661732220643D224D31362C3136483056304831365A222F3E
          0D0A093C2F673E0D0A093C672069643D226C6576656C2D31223E0D0A09093C67
          20636C6173733D22636C732D31223E0D0A0909093C7061746820636C6173733D
          226C696768742D64656661756C74677265792D31302220643D224D31342E352C
          3576382E3548312E3556355A222F3E0D0A0909093C7061746820636C6173733D
          226C696768742D64656661756C74677265792220643D224D31352C342E357639
          6C2D2E352E3548312E354C312C31332E35762D396C2E352E3548327638483134
          5635682E355A222F3E0D0A09093C2F673E0D0A09093C7061746820636C617373
          3D226C696768742D7265642220643D224D332C372E3541312E352C312E352C30
          2C312C312C342E352C392C312E352C312E352C302C302C312C332C372E355A4D
          342E352C313141312E352C312E352C302C302C302C332C31322E3561312E3438
          332C312E3438332C302C302C302C2E3039322E3548352E39303841312E343833
          2C312E3438332C302C302C302C362C31322E352C312E352C312E352C302C302C
          302C342E352C31315A222F3E0D0A09093C7061746820636C6173733D226C6967
          68742D64656661756C74677265792D31302220643D224D31342E352C312E3576
          3348312E35762D335A222F3E0D0A09093C7061746820636C6173733D226C6967
          68742D64656661756C74677265792220643D224D31342E352C3148312E354C31
          2C312E3576336C2E352E356831336C2E352D2E35762D335A4D31342C34483256
          324831345A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D3C2F7374796C65
          3E0D0A093C2F646566733E0D0A093C7469746C653E49636F6E4C696768744D65
          7373616765427562626C653C2F7469746C653E0D0A093C672069643D2263616E
          766173223E0D0A09093C7061746820636C6173733D2263616E7661732220643D
          224D31362C3136483056304831365A222F3E0D0A093C2F673E0D0A093C672069
          643D226C6576656C2D31223E0D0A09093C7061746820636C6173733D226C6967
          68742D64656661756C74677265792D31302220643D224D31342E352C322E3576
          39682D376C2D332C322E3938335631312E35682D33762D395A222F3E0D0A0909
          3C7061746820636C6173733D226C696768742D64656661756C74677265792220
          643D224D31342E352C3248312E354C312C322E3576396C2E352E35483476322E
          3438336C2E3835332E3335354C372E3730362C31324831342E356C2E352D2E35
          762D395A4D31342C313148372E356C2D2E3335332E3134364C352C31332E3238
          315631312E354C342E352C3131483256334831345A222F3E0D0A093C2F673E0D
          0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D2E6C696768742D
          626C75657B66696C6C3A20233030356462613B206F7061636974793A20313B7D
          3C2F7374796C653E0D0A093C2F646566733E0D0A093C7469746C653E4F757470
          75743C2F7469746C653E0D0A093C672069643D2263616E766173223E0D0A0909
          3C7061746820636C6173733D2263616E7661732220643D224D31362C31364830
          56304831365A222F3E0D0A093C2F673E0D0A093C672069643D226C6576656C2D
          31223E0D0A09093C7061746820636C6173733D226C696768742D64656661756C
          74677265792D31302220643D224D392C31307633483256346838563748347633
          5A222F3E0D0A09093C7061746820636C6173733D226C696768742D6465666175
          6C74677265792220643D224D312C31332E3556332E354C312E352C3368386C2E
          352E35563748395634483276394839563130683176332E356C2D2E352E35682D
          385A222F3E0D0A09093C7061746820636C6173733D226C696768742D626C7565
          2220643D224D31342E3835342C382E313436762E3730386C2D332C332D2E3730
          382D2E3730384C31332E3239332C394835563868382E3239334C31312E313436
          2C352E3835346C2E3730382D2E3730385A222F3E0D0A093C2F673E0D0A3C2F73
          76673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D62
          6C75652D31307B66696C6C3A20233030356462613B206F7061636974793A2030
          2E313B7D2E6C696768742D626C75657B66696C6C3A20233030356462613B206F
          7061636974793A20313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D2E636C732D317B
          6F7061636974793A302E37353B7D3C2F7374796C653E0D0A093C2F646566733E
          0D0A093C7469746C653E49636F6E4C696768744C6F63616C5661726961626C65
          3C2F7469746C653E0D0A093C672069643D2263616E766173223E0D0A09093C70
          61746820636C6173733D2263616E7661732220643D224D31362C313648305630
          4831365A222F3E0D0A09093C7061746820636C6173733D2263616E7661732220
          643D224D31362C3136483056304831365A222F3E0D0A093C2F673E0D0A093C67
          2069643D226C6576656C2D31223E0D0A09093C6720636C6173733D22636C732D
          31223E0D0A0909093C7061746820636C6173733D226C696768742D626C75652D
          31302220643D224D31302E3439342C332E3136392C31332E352C362E31373676
          332E356C2D372C332E3838394C332E3439342C31302E353536762D332E355A22
          2F3E0D0A0909093C7061746820636C6173733D226C696768742D626C75652220
          643D224D31342C362E31373676332E356C2D2E3235362E3433374C362E373434
          2C31346C2D2E362D2E3038344C332E31342C31302E39312C332C31302E353536
          762D332E356C2E3235312D2E3433372D2E3131312E3739312E3835342E383533
          76322E3038344C362C31322E3335355631302E3237316C2E3134372E3134372E
          362E3038344C372C31302E33353976322E3335344C31332C392E333856372E30
          32366C2E3734342D2E3431332E31312D2E3739315A222F3E0D0A09093C2F673E
          0D0A09093C7061746820636C6173733D226C696768742D626C75652D31302220
          643D224D31332E352C362E3137366C2D372C332E3838394C332E3439342C372E
          3035386C372D332E3838395A222F3E0D0A09093C7061746820636C6173733D22
          6C696768742D626C75652220643D224D362E3734342C31302E356C2D2E362D2E
          3038344C332E31342C372E3431326C2E3131312D2E3739312C372D332E383839
          2E362E3038342C332E3030362C332E3030362D2E31312E3739315A4D342E3331
          362C372E3137332C362E3538372C392E3434346C362E3039312D332E3338334C
          31302E3430372C332E3738395A222F3E0D0A09093C7061746820636C6173733D
          226C696768742D64656661756C74677265792220643D224D342C313448312E35
          4C312C31332E3556322E354C312E352C3248345633483256313348345A4D3135
          2E352C3248313356336832563133483133763168322E356C2E352D2E3556322E
          355A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D2E636C732D317B
          6F7061636974793A302E37353B7D3C2F7374796C653E0D0A093C2F646566733E
          0D0A093C7469746C653E49636F6E4C6967687447726170684C656674546F5269
          6768743C2F7469746C653E0D0A093C672069643D2263616E766173223E0D0A09
          093C7061746820636C6173733D2263616E7661732220643D224D31362C313648
          3056304831365A222F3E0D0A093C2F673E0D0A093C672069643D226C6576656C
          2D31223E0D0A09093C7061746820636C6173733D226C696768742D6465666175
          6C74677265792D31302220643D224D312E3437342C392E35762D34683476345A
          222F3E0D0A09093C7061746820636C6173733D226C696768742D64656661756C
          74677265792220643D224D2E3937342C392E35762D346C2E352D2E3568346C2E
          352E3576346C2D2E352E35682D345A6D312D332E355639683356365A222F3E0D
          0A09093C7061746820636C6173733D226C696768742D64656661756C74677265
          792D31302220643D224D31302E3437342C31332E3556312E3538376834563133
          2E355A222F3E0D0A09093C7061746820636C6173733D226C696768742D646566
          61756C74677265792220643D224D31342E3937342C31332E3556312E356C2D2E
          352D2E35682D346C2D2E352E357631326C2E352E3568345A6D2D312D31312E35
          5635682D3356325A6D302C345639682D3356365A6D2D332C3756313068337633
          5A222F3E0D0A09093C6720636C6173733D22636C732D31223E0D0A0909093C70
          61746820636C6173733D226C696768742D64656661756C74677265792220643D
          224D352E3937342C392E33383356382E3231376C342C322E3476312E3136365A
          222F3E0D0A0909093C7061746820636C6173733D226C696768742D6465666175
          6C74677265792220643D224D352E3937342C385637683456385A222F3E0D0A09
          09093C7061746820636C6173733D226C696768742D64656661756C7467726579
          2220643D224D392E3937342C332E32313756342E3338336C2D342C322E345635
          2E3631375A222F3E0D0A09093C2F673E0D0A093C2F673E0D0A3C2F7376673E0D
          0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D2E636C732D317B
          6F7061636974793A302E37353B7D3C2F7374796C653E0D0A093C2F646566733E
          0D0A093C7469746C653E49636F6E4C69676874446174614C6973743C2F746974
          6C653E0D0A093C672069643D2263616E7661732220636C6173733D2263616E76
          6173223E0D0A09093C7061746820636C6173733D2263616E7661732220643D22
          4D31362C3136483056304831365A222F3E0D0A093C2F673E0D0A093C67206964
          3D226C6576656C2D31223E0D0A09093C7061746820636C6173733D226C696768
          742D64656661756C74677265792D31302220643D224D31342E352C322E357633
          48312E35762D335A222F3E0D0A09093C7061746820636C6173733D226C696768
          742D64656661756C74677265792220643D224D31342E352C3648312E354C312C
          352E35762D334C312E352C326831336C2E352E3576335A4D322C354831345633
          48325A222F3E0D0A09093C6720636C6173733D22636C732D31223E0D0A090909
          3C7061746820636C6173733D226C696768742D64656661756C74677265792D31
          302220643D224D312E352C3668313376382E3548312E355A222F3E0D0A090909
          3C7061746820636C6173733D226C696768742D64656661756C74677265792220
          643D224D31342C3656384832563648312E354C312C352E3576396C2E352E3568
          31336C2E352D2E35762D396C2D2E352E355A6D302C3848325631324831345A6D
          302D33483256394831345A222F3E0D0A09093C2F673E0D0A093C2F673E0D0A3C
          2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265797B66696C6C3A20233231323132313B206F7061636974
          793A20313B7D2E6C696768742D626C75652D31307B66696C6C3A202330303564
          62613B206F7061636974793A20302E313B7D2E6C696768742D626C75657B6669
          6C6C3A20233030356462613B206F7061636974793A20313B7D3C2F7374796C65
          3E0D0A093C2F646566733E0D0A093C7469746C653E49636F6E4C69676874476C
          6F62616C5661726961626C653C2F7469746C653E0D0A093C672069643D226361
          6E766173223E0D0A09093C7061746820636C6173733D2263616E766173222064
          3D224D31362C3136483056304831365A222F3E0D0A093C2F673E0D0A093C6720
          69643D226C6576656C2D31223E0D0A09093C7061746820636C6173733D226C69
          6768742D64656661756C74677265792220643D224D382E3434362C31302E3661
          2E3431312E3431312C302C302C312D2E3034342E322E3436352E3436352C302C
          302C312D2E3131362E3134332E3435332E3435332C302C302C312D2E31372E30
          38352E392E392C302C302C312D2E322E3033312C312E3037372C312E3037372C
          302C302C312D2E3235392D2E3033362C322E3632382C322E3632382C302C302C
          312D2E3235342D2E3037362C312E38322C312E38322C302C302C302D2E323337
          2E323337632D2E3038332E312D2E3136332E322D2E3234312E333038732D2E31
          35322E3231372D2E3232332E33332D2E3133312E32312D2E3137392E32393163
          2E30332E3132322E3035382E3234322E3038352E333631732E3035372E32342E
          3038392E3336322E3036332E3232352E312E33343461312E3139342C312E3139
          342C302C302C302C2E3135312E3332352E3934352E3934352C302C302C302C2E
          3233332E3234362E3537362E3537362C302C302C302C2E3334382E31632E3033
          352C302C2E3037372C302C2E3132352C3061312E3138392C312E3138392C302C
          302C302C2E3134332D2E3031386C2E3134322D2E303237612E3430392E343039
          2C302C302C302C2E3132312D2E30346C2D2E3037312E3236332D2E32352E3130
          3761322E3331322C322E3331322C302C302C312D2E3233372E3038352C312E37
          33382C312E3733382C302C302C312D2E3234312E3035342C322E33362C322E33
          362C302C302C312D2E3237372E3032322E3833342E3833342C302C302C312D2E
          3332312D2E3035332E3533392E3533392C302C302C312D2E32312D2E3135372E
          3834322E3834322C302C302C312D2E3133392D2E323435632D2E3033352D2E31
          2D2E3037312D2E322D2E3130372D2E3331332D2E3034312D2E3133312D2E3037
          382D2E32362D2E3131312D2E333838732D2E3036362D2E3235392D2E312D2E33
          3933712D2E3137312E3236382D2E33342E353133742D2E33372E343932632D2E
          30362E3037312D2E3131392E3133392D2E3137392E32303561312E3331332C31
          2E3331332C302C302C312D2E3139322E3137342E3835372E3835372C302C302C
          312D2E3232382E3132312E382E382C302C302C312D2E3236372E3034342E3434
          382E3434382C302C302C312D2E3330382D2E3130372E342E342C302C302C312D
          2E3132352D2E332E3433312E3433312C302C302C312C2E3034342D2E322E3437
          382E3437382C302C302C312C2E3132312D2E3134382E3431372E3431372C302C
          302C312C2E3137342D2E3038352C312E3632382C312E3632382C302C302C312C
          2E3230352D2E3033312E3638352E3638352C302C302C312C2E3235352E303439
          2C322E312C322E312C302C302C302C2E3235342E3038352C352E3337372C352E
          3337372C302C302C302C2E3437332D2E35342C342E3936372C342E3936372C30
          2C302C302C2E3339332D2E364C352E392C31322E333636632D2E3031322D2E30
          35362D2E3032392D2E3133322D2E3035332D2E323238732D2E3034392D2E322D
          2E3037362D2E3330382D2E30362D2E3232342D2E312D2E3334332D2E3037352D
          2E3232372D2E3130382D2E33323261312E3236372C312E3236372C302C302C30
          2D2E3131362D2E3235342E3637392E3637392C302C302C302D2E3132312D2E31
          3634632D2E3037322D2E3036332D2E3136342D2E3131352D2E3633332D2E312D
          2E3335392E30312D312E3235352E3031372D312E3235352E3031376C2D2E3730
          392C332E33313761322E3932312C322E3932312C302C302C312D2E3235392E37
          30352C332E3038392C332E3038392C302C302C312D2E3434372E3635322C322E
          3230392C322E3230392C302C302C312D2E3630372E34373841312E3537332C31
          2E3537332C302C302C312C2E3638332C313661312E332C312E332C302C302C31
          2D2E3233372D2E303232412E3732322E3732322C302C302C312C2E3232382C31
          352E39612E3437332E3437332C302C302C312D2E3136312D2E313433412E3431
          392E3431392C302C302C312C302C31352E353237612E3435352E3435352C302C
          302C312C2E3130372D2E332E3338372E3338372C302C302C312C2E332D2E3132
          392E342E342C302C302C312C2E322E3034392E3634362E3634362C302C302C31
          2C2E3136312E3132352C312E3031332C312E3031332C302C302C312C2E313239
          2E3137632E3033392E3036322E3037362E3132322E3131322E3137386C2E3033
          312E303534612E3436312E3436312C302C302C302C2E3235392D2E312E383831
          2E3838312C302C302C302C2E3230352D2E3232332C322E31362C322E31362C30
          2C302C302C2E3136362D2E332C322E3531332C322E3531332C302C302C302C2E
          3132352D2E333335632E3033322D2E3131332E3036322D2E32322E3038392D2E
          333231732E3034382D2E3138392E3036322D2E3236346C2E3734362D332E3436
          3848312E3930364C322C31302E33682E3737326C2E3035332D2E32373741332E
          3136312C332E3136312C302C302C312C332E3036322C392E332C322E3632392C
          322E3632392C302C302C312C332E352C382E36353261322E3231332C322E3231
          332C302C302C312C2E3539332D2E34363941312E3537352C312E3537352C302C
          302C312C342E38332C3861312E3238332C312E3238332C302C302C312C2E3233
          372E3032322E3736372E3736372C302C302C312C2E3231392E3037362E353237
          2E3532372C302C302C312C2E3136352E3134332E3335362E3335362C302C302C
          312C2E3036322E3233322E34392E34392C302C302C312D2E312E3331332E3337
          322E3337322C302C302C312D2E332E3132392E3437382E3437382C302C302C31
          2D2E3233372D2E3035332E3533362E3533362C302C302C312D2E3136312D2E31
          34332C312E3533352C312E3533352C302C302C312D2E31322D2E313838632D2E
          3033362D2E3036352D2E3037352D2E3133322D2E3131362D2E32612E3437322E
          3437322C302C302C302D2E3239352E3132352C312E3133392C312E3133392C30
          2C302C302D2E3232382E3239352C322E3538342C322E3538342C302C302C302D
          2E3137342E342C332E3737352C332E3737352C302C302C302D2E31322E343333
          632D2E30332E31342D2E30362E3237352D2E30392E343036732D2E3034392E32
          33342D2E3035382E33303863302C302C2E3937332D2E3031372C312E3434362D
          2E3035372E3131342D2E30312E352D2E3033322E352D2E303332612E3735382E
          3735382C302C302C312C2E3332362E303632412E3636342E3636342C302C302C
          312C362C31302E343436612E3835372E3835372C302C302C312C2E3134382E32
          3539632E3033352E312E3037312E322E3130372E333137732E3036322E323334
          2E3038392E3335332E3035342E32342E3038312E3336326C2E3030382E303335
          762E3031346C302C2E303133712E3038352D2E3133332E3138332D2E33632E30
          36352D2E3131342E3133372D2E32332E3231342D2E333439732E31362D2E3233
          352E3234362D2E33343861322E332C322E332C302C302C312C2E3238312D2E33
          30382C312E3234362C312E3234362C302C302C312C2E3331332D2E3231342E39
          2E392C302C302C312C2E3334382D2E3038352E3431312E3431312C302C302C31
          2C2E3431392E3431315A222F3E0D0A09093C7061746820636C6173733D226C69
          6768742D626C75652D31302220643D224D31352E352C3541342E352C342E352C
          302C312C312C31312C2E352C342E352C342E352C302C302C312C31352E352C35
          5A222F3E0D0A09093C7061746820636C6173733D226C696768742D626C756522
          20643D224D31312C3061352C352C302C312C302C352C3541352E3030362C352E
          3030362C302C302C302C31312C305A6D332E3434342C334831332E3232356137
          2E3438362C372E3438362C302C302C302D2E3731322D312E3741342E3031312C
          342E3031312C302C302C312C31342E3434342C335A4D31352C3561332E393339
          2C332E3933392C302C302C312D2E3134322C314831332E34323641372E353833
          2C372E3538332C302C302C302C31332E352C3561372E3538332C372E3538332C
          302C302C302D2E3037342D3168312E34333241332E3933392C332E3933392C30
          2C302C312C31352C355A4D31312C39632D2E3033372C302D2E3037322D2E3031
          2D2E3130392D2E30313141362E352C362E352C302C302C312C392E3833322C37
          68322E33333661362E352C362E352C302C302C312D312E3036312C312E393839
          4331312E3037312C382E39392C31312E3033372C392C31312C395A6D312E3431
          322D3348392E35383841362E3431392C362E3431392C302C302C312C392E352C
          3561362E3431392C362E3431392C302C302C312C2E3038382D3168322E383234
          41362E3431392C362E3431392C302C302C312C31322E352C352C362E3431392C
          362E3431392C302C302C312C31322E3431322C365A6D2D2E3234342D3348392E
          38333261362E352C362E352C302C302C312C312E3035392D312E393839433130
          2E3932382C312E30312C31302E3936332C312C31312C31732E3037322E30312E
          31312E30313141362E35342C362E35342C302C302C312C31322E3136382C335A
          4D392E3438372C312E3341372E3438362C372E3438362C302C302C302C382E37
          37352C3348372E35353641342E3031312C342E3031312C302C302C312C392E34
          38372C312E335A4D382E3537342C3648372E31343241332E3933392C332E3933
          392C302C302C312C372C3561332E3933392C332E3933392C302C302C312C2E31
          34322D3148382E35373441372E3538332C372E3538332C302C302C302C382E35
          2C352C372E3538332C372E3538332C302C302C302C382E3537342C365A4D372E
          3535362C3748382E37373561372E3438362C372E3438362C302C302C302C2E37
          31322C312E3741342E3031312C342E3031312C302C302C312C372E3535362C37
          5A6D342E3935372C312E3741372E3533342C372E3533342C302C302C302C3133
          2E3232362C3768312E32313841342E3031312C342E3031312C302C302C312C31
          322E3531332C382E375A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
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
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D62
          6C75652D31307B66696C6C3A20233030356462613B206F7061636974793A2030
          2E313B7D2E6C696768742D7265647B66696C6C3A20236335306231373B206F70
          61636974793A20313B7D2E6C696768742D64656661756C74677265797B66696C
          6C3A20233231323132313B206F7061636974793A20313B7D2E6C696768742D62
          6C75657B66696C6C3A20233030356462613B206F7061636974793A20313B7D2E
          77686974657B66696C6C3A20236666666666663B206F7061636974793A20313B
          7D2E636C732D317B6F7061636974793A302E37353B7D3C2F7374796C653E0D0A
          093C2F646566733E0D0A093C7469746C653E49636F6E4C696768744E6F506572
          7369737453636F70653C2F7469746C653E0D0A093C672069643D2263616E7661
          73223E0D0A09093C7061746820636C6173733D2263616E7661732220643D224D
          31362C30563136483056305A222F3E0D0A093C2F673E0D0A093C672069643D22
          6C6576656C2D31223E0D0A09093C7061746820636C6173733D226C696768742D
          626C75652D31302220643D224D372E30352C31322E3548332E353135762D3968
          372E356C312E352C312E3556372E30353241342E3838312C342E3838312C302C
          302C302C31322C3761352C352C302C302C302D352C3543372C31322E3137312C
          372E3033342C31322E3333322C372E30352C31322E355A222F3E0D0A09093C70
          61746820636C6173733D226C696768742D7265642220643D224D31322C386134
          2C342C302C312C302C342C3441342C342C302C302C302C31322C385A222F3E0D
          0A09093C7061746820636C6173733D226C696768742D64656661756C74677265
          792220643D224D312E352C314836563248325636483156312E355A6D302C3134
          48365631344832563130483176342E355A6D31332D3134483130563268345636
          683156312E355A222F3E0D0A09093C6720636C6173733D22636C732D31223E0D
          0A0909093C7061746820636C6173733D226C696768742D626C75652220643D22
          4D382E3032332C3948367633483556382E354C352E352C3848392E3032374134
          2E3938312C342E3938312C302C302C302C382E3032332C395A222F3E0D0A0909
          3C2F673E0D0A09093C7061746820636C6173733D226C696768742D626C756522
          20643D224D372C3132483456344835563768355634682E3739334C31322C352E
          323038563761342E3938382C342E3938382C302C302C312C312C2E3156356C2D
          2E3134362D2E3335342D312E352D312E354C31312C3348332E354C332C332E35
          76392E3031374C332E3438352C313348372E3141342E3938352C342E3938352C
          302C302C312C372C31325A4D362C344839563648365A222F3E0D0A09093C7061
          746820636C6173733D2277686974652220643D224D31342C31322E3548313076
          2D3168345A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265797B66696C6C3A20233231323132313B206F7061636974
          793A20313B7D2E6C696768742D64656661756C74677265792D31307B66696C6C
          3A20233231323132313B206F7061636974793A20302E313B7D2E636C732D317B
          6F7061636974793A302E37353B7D3C2F7374796C653E0D0A093C2F646566733E
          0D0A093C7469746C653E49636F6E4C6967687452656E616D653C2F7469746C65
          3E0D0A093C672069643D2263616E766173223E0D0A09093C7061746820636C61
          73733D2263616E7661732220643D224D31362C3136483056304831365A222F3E
          0D0A093C2F673E0D0A093C672069643D226C6576656C2D31223E0D0A09093C70
          61746820636C6173733D226C696768742D64656661756C74677265792220643D
          224D31322C332E37363576382E3436374C31332E3135322C3133483134763148
          31336C2D2E3237372D2E3038344C31312E352C31332E316C2D312E3139342E38
          31314C31302E3032372C31344839563133682E3837344C31312C31322E323335
          56332E3736384C392E3834382C334839563268316C2E3237372E3038344C3131
          2E352C322E396C312E3139342D2E3831314C31322E3937332C32483134563368
          2D2E3837345A222F3E0D0A09093C6720636C6173733D22636C732D31223E0D0A
          0909093C7061746820636C6173733D226C696768742D64656661756C74677265
          792D31302220643D224D31302C31302E3548312E35762D3548392E3937315A22
          2F3E0D0A0909093C7061746820636C6173733D226C696768742D64656661756C
          74677265792220643D224D31302C3130763148312E354C312C31302E35762D35
          4C312E352C3548392E3937325636483276345A222F3E0D0A0909093C70617468
          20636C6173733D226C696768742D64656661756C74677265792D31302220643D
          224D31342E352C352E357635483133762D355A222F3E0D0A0909093C70617468
          20636C6173733D226C696768742D64656661756C74677265792220643D224D31
          352C352E3576356C2D2E352E3548313356313068315636483133563568312E35
          5A222F3E0D0A09093C2F673E0D0A09093C7061746820636C6173733D226C6967
          68742D64656661756C74677265792220643D224D382C372E3576314833762D31
          5A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265797B66696C6C3A20233231323132313B206F7061636974
          793A20313B7D3C2F7374796C653E0D0A093C2F646566733E0D0A093C7469746C
          653E49636F6E4C69676874476F546F4C6173743C2F7469746C653E0D0A093C67
          2069643D2263616E766173223E0D0A09093C7061746820636C6173733D226361
          6E7661732220643D224D31362C3136483056304831365A222F3E0D0A093C2F67
          3E0D0A093C672069643D226C6576656C2D31223E0D0A09093C7061746820636C
          6173733D226C696768742D64656661756C74677265792220643D224D372E342C
          392E3634362C392E3034332C384832563748392E3034334C372E342C352E3335
          342C382E312C342E3634366C322E352C322E35762E3730386C2D322E352C322E
          355A222F3E0D0A09093C7061746820636C6173733D226C696768742D64656661
          756C74677265792220643D224D31342C313356324831335631335A222F3E0D0A
          093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265797B66696C6C3A20233231323132313B206F7061636974
          793A20313B7D2E6C696768742D626C75657B66696C6C3A20233030356462613B
          206F7061636974793A20313B7D3C2F7374796C653E0D0A093C2F646566733E0D
          0A093C7469746C653E49636F6E4C69676874476F546F4465636C61726174696F
          6E3C2F7469746C653E0D0A093C672069643D2263616E766173223E0D0A09093C
          7061746820636C6173733D2263616E7661732220643D224D31362C3136483056
          304831365A222F3E0D0A093C2F673E0D0A093C672069643D226C6576656C2D31
          223E0D0A09093C7061746820636C6173733D226C696768742D64656661756C74
          677265792220643D224D31342C334837563268375A6D302C314837563568375A
          6D302C324837563768375A6D302C32483130563968345A6D302C324831307631
          68345A6D302C32483130763168345A222F3E0D0A09093C7061746820636C6173
          733D226C696768742D626C75652220643D224D342E3239332C322C332E313436
          2E3835342C332E3835342E3134366C322C32762E3730386C2D322C322D2E3730
          382D2E3730384C342E3239332C33483056325A222F3E0D0A093C2F673E0D0A3C
          2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265797B66696C6C3A20233231323132313B206F7061636974
          793A20313B7D2E6C696768742D626C75657B66696C6C3A20233030356462613B
          206F7061636974793A20313B7D3C2F7374796C653E0D0A093C2F646566733E0D
          0A093C7469746C653E49636F6E4C69676874476F546F536F75726365436F6465
          3C2F7469746C653E0D0A093C672069643D2263616E766173223E0D0A09093C70
          61746820636C6173733D2263616E7661732220643D224D31362C313648305630
          4831365A222F3E0D0A093C2F673E0D0A093C672069643D226C6576656C2D3122
          3E0D0A09093C7061746820636C6173733D226C696768742D64656661756C7467
          7265792220643D224D392C3134483256313348395A6D332D344834763168385A
          4D392C374834563848395A6D352C30483130563868345A6D302D334838563568
          365A222F3E0D0A09093C7061746820636C6173733D226C696768742D626C7565
          2220643D224D342E3239332C322C332E3134362E3835342C332E3835342E3134
          366C322C32762E3730386C2D322C322D2E3730382D2E3730384C342E3239332C
          33483056325A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D2E636C732D317B
          6F7061636974793A302E37353B7D3C2F7374796C653E0D0A093C2F646566733E
          0D0A093C7469746C653E49636F6E4C69676874457863657074696F6E53657474
          696E67733C2F7469746C653E0D0A093C672069643D2263616E7661732220636C
          6173733D2263616E766173223E0D0A09093C7061746820636C6173733D226361
          6E7661732220643D224D31362C3136483056304831365A222F3E0D0A093C2F67
          3E0D0A093C672069643D226C6576656C2D31223E0D0A09093C6720636C617373
          3D22636C732D31223E0D0A0909093C7061746820636C6173733D226C69676874
          2D64656661756C74677265792D31302220643D224D382C31322E3548312E3556
          322E3568313056382E31323141342E352C342E352C302C302C302C382C31322E
          355A222F3E0D0A0909093C7061746820636C6173733D226C696768742D646566
          61756C74677265792220643D224D382E3035312C313348312E354C312C31322E
          3556322E354C312E352C326831306C2E352E3556382E30353161342E3438352C
          342E3438352C302C302C302D312C2E32323556334832763948382E3035314134
          2E3334322C342E3334322C302C302C302C382C31322E352C342E3334322C342E
          3334322C302C302C302C382E3035312C31335A222F3E0D0A09093C2F673E0D0A
          09093C7061746820636C6173733D226C696768742D64656661756C7467726579
          2D31302220643D224D31342E352C31322E3561322C322C302C312C312D322D32
          41322C322C302C302C312C31342E352C31322E355A222F3E0D0A09093C706174
          6820636C6173733D226C696768742D64656661756C74677265792220643D224D
          31362C31335631324831342E39343961322E3437332C322E3437332C302C302C
          302D2E3336352D2E3837366C2E3734352D2E3734352D2E3730372D2E3730372D
          2E3734352E37343541322E3436392C322E3436392C302C302C302C31332C3130
          2E303531563948313276312E30353161322E3436392C322E3436392C302C302C
          302D2E3837372E3336366C2D2E3734352D2E3734352D2E3730372E3730372E37
          34352E37343561322E3437332C322E3437332C302C302C302D2E3336352E3837
          364839763168312E30353161322E3437332C322E3437332C302C302C302C2E33
          36352E3837366C2D2E3734352E3734352E3730372E3730372E3734352D2E3734
          3561322E3436392C322E3436392C302C302C302C2E3837372E33363656313668
          315631342E39343961322E3436392C322E3436392C302C302C302C2E3837372D
          2E3336366C2E3734352E3734352E3730372D2E3730372D2E3734352D2E373435
          41322E3437332C322E3437332C302C302C302C31342E3934392C31335A6D2D33
          2E352C3141312E352C312E352C302C312C312C31342C31322E352C312E352C31
          2E352C302C302C312C31322E352C31345A222F3E0D0A09093C7061746820636C
          6173733D226C696768742D64656661756C74677265792220643D224D372C3848
          36563548375A6D2D2E352E3735612E37352E37352C302C312C302C2E37352E37
          35412E37352E37352C302C302C302C362E352C382E37355A222F3E0D0A093C2F
          673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D2E6C696768742D
          79656C6C6F777B66696C6C3A20233939366630303B206F7061636974793A2031
          3B7D3C2F7374796C653E0D0A093C2F646566733E0D0A093C7469746C653E4963
          6F6E4C69676874547269676765725363726970743C2F7469746C653E0D0A093C
          672069643D2263616E7661732220636C6173733D2263616E766173223E0D0A09
          093C7061746820636C6173733D2263616E7661732220643D224D31362C313648
          3056304831365A222F3E0D0A093C2F673E0D0A093C672069643D226C6576656C
          2D31223E0D0A09093C7061746820636C6173733D226C696768742D6465666175
          6C74677265792D31302220643D224D31342E352C3556362E3239336C2D2E3230
          372E3230374831312E3556313241312E352C312E352C302C302C312C31302C31
          332E3548352E3531374C372E372C313148352E334C372E34342C3848342E3556
          3541312E352C312E352C302C302C312C362C332E35683741312E352C312E352C
          302C302C312C31342E352C355A222F3E0D0A09093C7061746820636C6173733D
          226C696768742D64656661756C74677265792220643D224D31332C3348364132
          2C322C302C302C302C342C3556384835563541312C312C302C302C312C362C34
          68352E32373841312E3937382C312E3937382C302C302C302C31312C35763761
          312C312C302C302C312D322C30762D2E354C382E352C313148372E376C2D2E38
          37352C31483861312E3938342C312E3938342C302C302C302C2E3236392C3148
          352E3935346C2D2E3837352C3148313061322C322C302C302C302C322D325637
          68322E356C2E352D2E35563541322C322C302C302C302C31332C335A6D312C33
          483132563561312C312C302C302C312C322C305A222F3E0D0A09093C70617468
          20636C6173733D226C696768742D79656C6C6F772220643D224D352E352C3132
          2C322C313648316C312E352D33482E356C322D3468334C332E3336332C31325A
          222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D3C2F7374796C65
          3E0D0A093C2F646566733E0D0A093C7469746C653E49636F6E4C696768744D65
          6173757265547265653C2F7469746C653E0D0A093C672069643D2263616E7661
          73223E0D0A09093C7061746820636C6173733D2263616E7661732220643D224D
          31362C30563136483056305A222F3E0D0A093C2F673E0D0A093C672069643D22
          6C6576656C2D31223E0D0A09093C7061746820636C6173733D226C696768742D
          64656661756C74677265792D31302220643D224D31332E352C31312E35763368
          2D33762D335A222F3E0D0A09093C7061746820636C6173733D226C696768742D
          64656661756C74677265792D31302220643D224D31302E352C362E3568337633
          682D335A222F3E0D0A09093C7061746820636C6173733D226C696768742D6465
          6661756C74677265792D31302220643D224D322E352C352E35762D3468347634
          5A222F3E0D0A09093C7061746820636C6173733D226C696768742D6465666175
          6C74677265792220643D224D31302E352C313068336C2E352D2E35762D334C31
          332E352C36682D336C2D2E352E3556384835563648362E354C372C352E35762D
          344C362E352C31682D344C322C312E3576346C2E352E35483476372E356C2E35
          2E35483130762E356C2E352E3568336C2E352D2E35762D336C2D2E352D2E3568
          2D336C2D2E352E35563133483556396835762E355A4D31312C37683256394831
          315A4D332C355632483656355A6D382C37683276324831315A222F3E0D0A093C
          2F673E0D0A3C2F7376673E0D0A}
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
          303B3C7374796C6520747970653D22746578742F637373223E2E5265647B6669
          6C6C3A234431314331433B7D3C2F7374796C653E0D0A3C7061746820636C6173
          733D225265642220643D224D32302C342E3776342E3463322E342C312E342C34
          2C342C342C362E3963302C342E342D332E362C382D382C38732D382D332E362D
          382D3863302D332C312E362D352E352C342D362E3956342E3743372E332C362E
          332C342C31302E382C342C313620202623393B63302C362E362C352E342C3132
          2C31322C313263362E362C302C31322D352E342C31322D31324332382C31302E
          382C32342E372C362E332C32302C342E377A222F3E0D0A3C7061746820636C61
          73733D225265642220643D224D31372C3134682D32632D302E362C302D312D30
          2E342D312D31563363302D302E362C302E342D312C312D31683263302E362C30
          2C312C302E342C312C317631304331382C31332E362C31372E362C31342C3137
          2C31347A222F3E0D0A3C2F7376673E0D0A}
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
    ImageOptions.HotImages = SmallImages
    ImageOptions.Images = SmallImages
    ImageOptions.LargeImages = ImagesLarge
    ImageOptions.MakeDisabledImagesFaded = True
    ImageOptions.StretchGlyphs = False
    ImageOptions.UseLargeImagesForLargeIcons = True
    ImageOptions.UseLeftBottomPixelAsTransparent = False
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
      DockedLeft = 312
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
      DockedLeft = 399
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
    Left = 348
    Top = 352
    Bitmap = {
      494C010107000800040020002000FFFFFFFF2100FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000004000000001002000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000070300344522009C8E4600DFB85C00FEBA5C00FF914800E14A2500A10904
      003A000000000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000000000000000000A4422
      009BB85C00FEBA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C
      00FF4E2700A60000000E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000101013A0B0B0B960000001C000000000000000000000000000000000000
      00150B0B0B960202024000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000009663200BDBA5C
      00FFBA5C00FFBA5C00FFBA5C00FFE1B88EFFE3BF99FFBA5C00FFBA5C00FFBA5C
      00FFBA5C00FF753A00CA0000000E000000000000000000000000000000000000
      000009090988202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF0909
      0988000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF181818DB0000001C0000000000000000000000151616
      16D2202020FF202020FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000041200097BA5C00FFBA5C
      00FFBA5C00FFBA5C00FFBA5C00FFEFD9C2FFF2E2D1FFBA5C00FFBA5C00FFBA5C
      00FFBA5C00FFBA5C00FF4E2700A6000000000000000000000000000000000000
      0000202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF202020FF181818DB0000001C00000015161616D22020
      20FF202020FF202020FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000050505661212
      12BF121212BF121212BF121212BF121212BF121212BF121212BF121212BF1212
      12BF121212BF121212BF0808087F000000000502002DB75A00FDBA5C00FFBA5C
      00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C
      00FFBA5C00FFBA5C00FFBA5C00FF0904003A0000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      0019000000190000001900000019202020FF202020FF00000019000000190000
      0019000000190000001900000019000000190000001900000019202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF151515CE202020FF181818DB161616D2202020FF1717
      17D7202020FF202020FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000121212BF1313
      13C4131313C4131313C4131313C4131313C4131313C4131313C4131313C41313
      13C4131313C4131313C402020246000000003B1D0090BA5C00FFBA5C00FFBA5C
      00FFBA5C00FFBA5C00FFBA5C00FFD3975AFFD49B61FFBA5C00FFBA5C00FFBA5C
      00FFBA5C00FFBA5C00FFBA5C00FF4A2500A10000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      0019000000190000001900000019202020FF202020FF00000019000000190000
      0019000000190000001900000019000000190000001900000019202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000027151515CE202020FF202020FF171717D70101
      012C202020FF202020FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000121212BF1313
      13C4000000130000001300000013000000130000001300000013000000130000
      0013000000130000001300000003000000007F3F00D2BA5C00FFBA5C00FFBA5C
      00FFBA5C00FFBA5C00FFBA5C00FFF0DDC9FFFBF6F0FFBC6006FFBA5C00FFBA5C
      00FFBA5C00FFBA5C00FFBA5C00FF914800E10000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      0019000000190000001900000019202020FF202020FF00000019000000190000
      0019000000190000001900000019000000190000001900000019202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000270E0E0EAA0E0E0EAE0101012C0000
      0019202020FF202020FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000121212BF1313
      13C4000000130000001300000013000000130000001300000013000000130000
      001300000013000000130000000100000000A35100EFBA5C00FFBA5C00FFBA5C
      00FFBA5C00FFBA5C00FFBA5C00FFD9A673FFFFFFFFFFE9CDAFFFBC6208FFBA5C
      00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FF0000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      0019000000190000001900000019202020FF202020FF00000019000000190000
      0019000000190000001900000019000000190000001900000019202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      0019202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF0909098800000000000000000000000000000000121212BF1313
      13C4000000130000001300000013000000130000001300000013000000130000
      001300000013000000130000000100000000A15000EEBA5C00FFBA5C00FFBA5C
      00FFBA5C00FFBA5C00FFBA5C00FFBB5E02FFE5C29EFFFFFFFFFFEBD0B5FFBB5D
      01FFBA5C00FFBA5C00FFBA5C00FFB85C00FE0000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      0019000000190000001900000019202020FF202020FF00000019000000190000
      0019000000190000001900000019000000190000001900000019202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      0019202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF00000000000000000000000000000000121212BF1313
      13C4000000130000001300000013000000130000001300000013000000130000
      0013000000130000001300000003000000007A3C00CEBA5C00FFBA5C00FFBA5C
      00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5D00FFE6C4A2FFFFFFFFFFCF8F
      4DFFBA5C00FFBA5C00FFBA5C00FF8E4600DF0000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      0019000000190000001900000019202020FF202020FF00000019000000190000
      0019000000190000001900000019000000190000001900000019202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      0019202020FF202020FF0000001900000019202020FF202020FF000000190000
      0019202020FF202020FF0000001900000019202020FF202020FF000000190000
      0019202020FF202020FF00000000000000000000000000000000121212BF1313
      13C40000001300000013131313C4131313C4131313C4131313C4131313C41313
      13C4131313C4131313C40202024800000000371B008BBA5C00FFBA5C00FFBA5C
      00FFCA833AFFE5C29FFFCA8239FFBA5C00FFBA5C00FFCD8B47FFFFFFFFFFD8A3
      6EFFBA5C00FFBA5C00FFBA5C00FF4522009C0000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      0019000000190000001900000019202020FF202020FF00000019000000190000
      0019000000190000001900000019000000190000001900000019202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      0019202020FF202020FF0000001900000019202020FF202020FF000000190000
      0019202020FF202020FF0000001900000019202020FF202020FF000000190000
      0019202020FF202020FF00000000000000000000000000000000121212BF1313
      13C40000001300000013131313C4131313C4131313C4131313C4131313C41313
      13C4131313C4131313C4090909870000000004020026B45A00FBBA5C00FFBA5C
      00FFC57729FFFFFEFEFFF1DECBFFC26F1DFFC16C18FFEED6BEFFFFFFFFFFC981
      38FFBA5C00FFBA5C00FFB85C00FE070300340000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      0019000000190000001900000019202020FF202020FF00000019000000190000
      0019000000190000001900000019000000190000001900000019202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF0A0A0A92171717DA202020FD202020FE191919DE0B0B
      0B97202020FF202020FF00000019000000190000001900000019000000190000
      0019000000190000001900000019000000190000001900000019202020FF2020
      20FF202020FF202020FF00000000000000000000000000000000121212BF1313
      13C4000000130000001300000013000000130000001300000013000000130000
      00130000001300000013000000130000000200000000361B008BBA5C00FFBA5C
      00FFBA5C00FFDDAF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2BA92FFBA5C
      00FFBA5C00FFBA5C00FF4422009B000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      0019000000190000001900000019202020FF202020FF00000019000000190000
      0019000000190000001900000019000000190000001900000019202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF00000019000000190000001900000019000000190000
      0019000000190000001900000019000000190000001900000019202020FF2020
      20FF202020FF202020FF00000000000000000000000000000000121212BF1313
      13C4000000130000001300000013000000130000001300000013000000130000
      00130000001300000013000000130000000D0000000000000005592C00B1BA5C
      00FFBA5C00FFBA5C00FFCA843CFFDEB286FFDFB58AFFCC8843FFBA5C00FFBA5C
      00FFBA5C00FF663200BD00000009000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      0019000000190000001900000019202020FF202020FF00000019000000190000
      0019000000190000001900000019000000190000001900000019202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000303
      0355202020FF202020FF101010B40202024C0000001D0000001C020202480E0E
      0EAC202020FF202020FF06060673000000190000001900000019000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019202020FF202020FF00000000000000000000000000000000121212BF1313
      13C4000000130000001300000013000000130000001300000013000000130000
      001300000013000000130000001300000013000000080000000000000005361B
      008BB45A00FBBA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FFBA5C00FFB75A
      00FD402000970000000900000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      0019000000190000001900000019202020FF202020FF00000019000000190000
      0019000000190000001900000019000000190000001900000019202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000171D1D
      1DF1202020FF0808088700000019000000190000001900000019000000190000
      001906060674202020FF1E1E1EF7010101360000001900000019000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019202020FF202020FF00000000000000000000000000000000121212BF1313
      13C4000000130000001300000013000000130000001300000013000000130000
      0013000000130000001300000013000000130000001300000008000000000000
      000004020026371B008B793C00CEA25000EEA35100EF7E3F00D23B1D00900502
      002D000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      0019000000190000001900000019202020FF202020FF00000019000000190000
      0019000000190000001900000019000000190000001900000019202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000080808802020
      20FF111111BB0000001900000019000000190000001900000019000000190000
      0019000000190E0E0EAC202020FF0C0C0C9A0000001900000019000000190000
      0019000000190000001900000019000000190000001900000019202020FF2020
      20FF202020FF202020FF00000000000000000000000000000000121212BF1313
      13C40000001300000013131313C4131313C4131313C4131313C4131313C41313
      13C4131313C4131313C4131313C4131313C4131313C4131313C40A0A0A910000
      001E000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      0019000000190000001900000019202020FF202020FF00000019000000190000
      0019000000190000001900000019000000190000001900000019202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000151515CC2020
      20FF030303550000001900000019000000190000001900000019000000190000
      00190000001902020248202020FF191919E00000001900000019000000190000
      0019000000190000001900000019000000190000001900000019202020FF2020
      20FF202020FF202020FF00000000000000000000000000000000121212BF1313
      13C40000001300000013131313C4131313C4131313C4131313C4131313C41313
      13C4131313C4131313C4131313C4131313C4131313C4131313C4131313C41313
      13C20000000D000000070000001F0000000C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      0019000000190000001900000019202020FF202020FF00000019000000190000
      0019000000190000001900000019000000190000001900000019202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001C1C1CEE2020
      20FF0000002A0000001900000019000000190000001900000019000000190000
      0019000000190000001C202020FF202020FD0000001800000019202020FF2020
      20FF202020FF202020FF202020FF202020FF0000001900000019000000190000
      0019202020FF202020FF00000000000000000000000000000000121212BF1313
      13C4000000130000001300000013000000130000001300000013000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      00130000001300000013131313C4121212BF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      0019000000190000001900000019202020FF202020FF00000019000000190000
      0019000000190000001900000019000000190000001900000019202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001C1C1CED2020
      20FF0101012B0000001900000019000000190000001900000019000000190000
      0019000000190000001D202020FF202020FD0000001800000019202020FF2020
      20FF202020FF202020FF202020FF202020FF0000001900000019000000190000
      0019202020FF202020FF00000000000000000000000000000000121212BF1313
      13C4000000130000001300000013000000130000001300000013000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      00130000001300000013131313C4121212BF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      0019000000190000001900000019202020FF202020FF00000019000000190000
      0019000000190000001900000019000000190000001900000019202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000141414C92020
      20FF0404045B0000001900000019000000190000001900000019000000190000
      0019000000190202024C202020FF191919DE0000001900000019000000190000
      0019000000190000001900000019000000190000001900000019202020FF2020
      20FF202020FF202020FF00000000000000000000000000000000121212BF1313
      13C4000000130000001300000013000000130000001300000013000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      00130000001300000013131313C4121212BF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000707077E2020
      20FF121212C20000001A00000019000000190000001900000019000000190000
      001900000019101010B5202020FF0B0B0B990000001900000019000000190000
      0019000000190000001900000019000000190000001900000019202020FF2020
      20FF202020FF202020FF00000000000000000000000000000000121212BF1313
      13C4000000130000001300000013000000130000001300000013000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      00130000001300000013131313C4121212BF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000007070778202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF0707
      0778000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000141C1C
      1CED202020FF0A0A0A900000001A000000190000001900000019000000190000
      001908080887202020FF1E1E1EF5010101330000001900000019202020FF2020
      20FF202020FF202020FF202020FF202020FF0000001900000019000000190000
      0019202020FF202020FF00000000000000000000000000000000121212BF1313
      13C40000001300000013131313C4131313C4131313C4131313C4131313C41313
      13C4131313C4131313C40000001300000013131313C4131313C4131313C41313
      13C4131313C4131313C4131313C4121212BF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000281E1E1EF7202020FF0D0D0DA20000
      00190000000000000021202020FB1F1F1FF91E1E1EF3202020FF010101300000
      0000000000140A0A0A94202020FE202020FC0101013700000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000303
      0350202020FF202020FF121212C20404045B0000002B0000002A030303561111
      11BB202020FF202020FE0505056D000000190000001900000019202020FF2020
      20FF202020FF202020FF202020FF202020FF0000001900000019000000190000
      0019202020FF202020FF00000000000000000000000000000000121212BF1313
      13C40000001300000013131313C4131313C4131313C4131313C4131313C41313
      13C4131313C4131313C40000001300000013131313C4131313C4131313C41313
      13C4131313C4131313C4131313C10A0A0A940000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000009090989202020FF0C0C0C9D000000000000
      0000000000000A0A0A92202020FF0D0D0D9F0909098D202020FF0D0D0DA30000
      0000000000000000000009090988202020FF0D0D0DA000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF1E1E1EF30505056C00000019000000190000001900000019000000190000
      0019000000190000001900000019000000190000001900000019202020FF2020
      20FF202020FF202020FF00000000000000000000000000000000121212BF1313
      13C4000000130000001300000013000000130000001300000013000000130000
      001300000013000000130000001300000013131313C4131313C4131313C41313
      13C4131313C4131313C10C0C0C9D000000100000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000E0E0EA6202020FF0404045C000000000000
      0000000000161E1E1EF3202020FF0101012E0000001F202020FB1F1F1FF90000
      0021000000000000000002020246202020FF121212BC00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF0909098C161616D11E1E1EF71E1E1EF6161616D40A0A
      0A910101012F0000001900000019000000190000001900000019000000190000
      0019000000190000001900000019000000190000001900000019202020FF2020
      20FF202020FF202020FF00000000000000000000000000000000121212BF1313
      13C4000000130000001300000013000000130000001300000013000000130000
      001300000013000000130000001300000013131313C4131313C4131313C41313
      13C4131313C10C0C0C9D00000010000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000007070779202020FF121212BE0000000A0000
      00030E0E0EAC202020FF111111B600000000000000000C0C0C9E202020FF1111
      11BA00000006000000060F0F0FAE202020FF0A0A0A8E00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF0000001900000019202020FF202020FF000000190000
      0019202020FF202020FF0000001900000019202020FF202020FF000000190000
      0019202020FF202020FF0000001900000019202020FF202020FF000000190000
      0019202020FF202020FF00000000000000000000000000000000121212BF1313
      13C4000000130000001300000013000000130000001300000013000000130000
      001300000013000000130000001300000013131313C4131313C4131313C41313
      13C10C0C0C9D0000001000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000131B1B1BE7202020FF1C1C1CED1919
      19E2202020FF1E1E1EF3000000260000000000000000000000181B1B1BE82020
      20FF1A1A1AE51B1B1BE9202020FF1D1D1DF00000002000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF0000001900000019202020FF202020FF000000190000
      0019202020FF202020FF0000001900000019202020FF202020FF000000190000
      0019202020FF202020FF0000001900000019202020FF202020FF000000190000
      0019202020FF202020FF00000000000000000000000000000000121212BF1313
      13C4000000130000001300000013000000130000001300000013000000130000
      001300000013000000130000001300000013131313C4131313C4131313C10C0C
      0C9D000000100000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000002A141414C9202020FF2020
      20FF191919E00101013F000000000000000000000000000000000101012D1717
      17D7202020FF202020FF151515D0010101340000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF00000000000000000000000000000000121212BF1313
      13C4131313C4131313C4131313C4131313C4131313C4131313C4131313C41313
      13C4131313C4131313C4131313C4131313C4131313C4131313C10C0C0C9D0000
      0010000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000001C0000
      0029000000030000000000000000000000000000000000000000000000000000
      0001000000260000001E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000007070778202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF07070778000000000000000000000000000000000404045A1212
      12BF121212BF121212BF121212BF121212BF121212BF121212BF121212BF1212
      12BF121212BF121212BF121212BF121212BF121212BF0A0A0A8F000000100000
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
      00000000000000000000000000000000000009090988202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF0909098800000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF00000000000000000000000000000000000000000000
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
      000009090988202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF0000000000000000202020FF202020FF000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019202020FF202020FF00000000000000000000000000000000050505661212
      12BF121212BF121212BF121212BF121212BF121212BF121212BF121212BF1212
      12BF121212BF121212BF121212BF121212BF121212BF121212BF121212BF1212
      12BF121212BF121212BF121212BF121212BF121212BF121212BF121212BF1212
      12BF121212BF0505056600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000090909882020
      20FF0000001900000019202020FF202020FF0000001900000019202020FF2020
      20FF0000001900000019202020FF202020FF0000001900000019202020FF2020
      20FF0000001900000019202020FF202020FF0000001900000019202020FF0909
      0988000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF0000000000000000202020FF202020FF000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019202020FF202020FF00000000000000000000000000000000121212BF1212
      12BF121212BF121212BF121212BF121212BF121212BF121212BF121212BF1212
      12BF121212BF121212BF121212BF121212BF121212BF121212BF121212BF1212
      12BF121212BF121212BF121212BF121212BF121212BF121212BF121212BF1212
      12BF121212BF121212BF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000202020FF2020
      20FF0000001900000019202020FF202020FF0000001900000019202020FF2020
      20FF0000001900000019202020FF202020FF0000001900000019202020FF2020
      20FF0000001900000019202020FF202020FF0000001900000019202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      001900000019000000190000000000000000202020FF202020FF000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019202020FF202020FF00000000000000000000000000000000121212BF1212
      12BF000000130000001300000013000000130000001300000013000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      0013121212BF121212BF00000000000000000000000000000000020A024A0F42
      0FB8020902460000000000000000000000000000000000000000000000000000
      0000020A02490F410FB602080241000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      001900000019000000190000000000000000202020FF202020FF000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019202020FF202020FF00000000000000000000000000000000121212BF1212
      12BF000000130000001300000013000000130000001300000013000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      0013121212BF121212BF000000000000000000000000000000001E801EFF1E80
      1EFF1E7F1EFE0B2E0B9A0000000E000000000000000000000000000000000000
      00001E801EFF1E801EFF1E7F1EFE0A2B0A940000000C00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      001900000019000000190000000000000000202020FF202020FF000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019202020FF202020FF00000000000000000000000000000000121212BF1212
      12BF000000130000001300000013000000130000001300000013202020FF2020
      20FF202020FF202020FF00000013000000130000001300000013202020FF2020
      20FF202020FF202020FF00000013000000130000001300000013000000130000
      0013121212BF121212BF000000000000000000000000000000001E801EFF1E80
      1EFF1D791DF91E801EFF176317E1020902460000000000000000000000000000
      00001E801EFF1E801EFF1E801EFF1E801EFF176117DE02080241000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000202020FF2020
      20FF000000190000001900000019000000190000001900000019000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019000000190000001900000019000000190000001900000019202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      001900000019000000190000000000000000202020FF202020FF000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019202020FF202020FF00000000000000000000000000000000121212BF1212
      12BF000000130000001300000013000000130000001300000013202020FF2020
      20FF202020FF202020FF00000013000000130000001300000013202020FF2020
      20FF202020FF202020FF00000013000000130000001300000013000000130000
      0013121212BF121212BF000000000000000000000000000000001E801EFF1E80
      1EFF02080241145514D01E801EFF1E7F1EFE0B2E0B9A0000000E000000000000
      00001E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E7F1EFE0A2B0A940000
      000C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000202020FF2020
      20FF000000190000001900000019000000190000001900000019000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019000000190000001900000019000000190000001900000019202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      001900000019000000190000000000000000202020FF202020FF000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019202020FF202020FF00000000000000000000000000000000121212BF1212
      12BF000000130000001300000013000000130000001300000013202020FF2020
      20FF202020FF202020FF00000013000000130000001300000013202020FF2020
      20FF202020FF202020FF00000013000000130000001300000013000000130000
      0013121212BF121212BF000000000000000000000000000000001E801EFF1E80
      1EFF000100190001001D092409881D791DF91E801EFF176317E1000000000000
      00001E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1761
      17DE020802410000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000190000
      00190000001900000019202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF0000001900000019202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF0000001900000019000000190000
      0019000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      001900000019000000190000000000000000202020FF202020FF000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019202020FF202020FF00000000000000000000000000000000121212BF1212
      12BF000000130000001300000013000000130000001300000013202020FF2020
      20FF202020FF202020FF00000013000000130000001300000013202020FF2020
      20FF202020FF202020FF00000013000000130000001300000013000000130000
      0013121212BF121212BF000000000000000000000000000000001E801EFF1E80
      1EFF00010019000100190001001902080241145514D01E801EFF000000000000
      00001E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E80
      1EFF1E7F1EFE0A2B0A940000000C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000190000
      00190000001900000019202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF0000001900000019202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF0000001900000019000000190000
      0019000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      001900000019000000190000000000000000202020FF202020FF000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019202020FF202020FF00000000000000000000000000000000121212BF1212
      12BF000000130000001300000013000000130000001300000013000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      0013121212BF121212BF000000000000000000000000000000001E801EFF1E80
      1EFF000100190001001900010019000100190001001D09240988000000000000
      00001E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E80
      1EFF1E801EFF1E801EFF176117DE020802410000000000000000000000000000
      0000000000000000000000000000000000000000000000000000202020FF2020
      20FF0000001900000019202020FF202020FF0000001900000019000000190000
      0019202020FF202020FF0000001900000019202020FF202020FF000000190000
      00190000001900000019202020FF202020FF0000001900000019202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      001900000019000000190000000000000000202020FF202020FF000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019202020FF202020FF00000000000000000000000000000000121212BF1212
      12BF000000130000001300000013000000130000001300000013000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      0013121212BF121212BF000000000000000000000000000000001E801EFF1E80
      1EFF000100190001001900010019000100190001001900010019000000000000
      00001E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E80
      1EFF1E801EFF1E801EFF1E801EFF1E7F1EFE0A2B0A940000000C000000000000
      0000000000000000000000000000000000000000000000000000202020FF2020
      20FF0000001900000019202020FF202020FF0000001900000019000000190000
      0019202020FF202020FF0000001900000019202020FF202020FF000000190000
      00190000001900000019202020FF202020FF0000001900000019202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      001900000019000000190000000000000000202020FF202020FF000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019202020FF202020FF00000000000000000000000000000000121212BF1212
      12BF0000001300000013202020FF202020FF202020FF202020FF000000130000
      00130000001300000013202020FF202020FF202020FF202020FF000000130000
      00130000001300000013202020FF202020FF202020FF202020FF000000130000
      0013121212BF121212BF000000000000000000000000000000001E801EFF1E80
      1EFF000100190001001900010019000100190001001900010019000000000000
      00001E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E80
      1EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF176117DE020802410000
      0000000000000000000000000000000000000000000000000000000000190000
      00190000001900000019202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF0000001900000019202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF0000001900000019000000190000
      0019000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      001900000019000000190000000000000000202020FF202020FF000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019202020FF202020FF00000000000000000000000000000000121212BF1212
      12BF0000001300000013202020FF202020FF202020FF202020FF000000130000
      00130000001300000013202020FF202020FF202020FF202020FF000000130000
      00130000001300000013202020FF202020FF202020FF202020FF000000130000
      0013121212BF121212BF000000000000000000000000000000001E801EFF1E80
      1EFF000100190001001900010019000100190001001900010019000000000000
      00001E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E80
      1EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E7F1EFE0A2B
      0A940000000C0000000000000000000000000000000000000000000000190000
      00190000001900000019202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF0000001900000019202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF0000001900000019000000190000
      0019000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      001900000019000000190000000000000000202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF00000000000000000000000000000000121212BF1212
      12BF0000001300000013202020FF202020FF202020FF202020FF000000130000
      00130000001300000013202020FF202020FF202020FF202020FF000000130000
      00130000001300000013202020FF202020FF202020FF202020FF000000130000
      0013121212BF121212BF000000000000000000000000000000001E801EFF1E80
      1EFF000100190001001900010019000100190001001900010019000000000000
      00001E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E80
      1EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E80
      1EFF176117DE0208024100000000000000000000000000000000202020FF2020
      20FF000000190000001900000019000000190000001900000019000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019000000190000001900000019000000190000001900000019202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      00190000001900000019000000010000000007070778202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF0707077800000000000000000000000000000000121212BF1212
      12BF0000001300000013202020FF202020FF202020FF202020FF000000130000
      00130000001300000013202020FF202020FF202020FF202020FF000000130000
      00130000001300000013202020FF202020FF202020FF202020FF000000130000
      0013121212BF121212BF000000000000000000000000000000001E801EFF1E80
      1EFF000100190001001900010019000100190001001900010019000000000000
      00001E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E80
      1EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E80
      1EFF1E801EFF1E7F1EFE0A2B0A940000000C0000000000000000202020FF2020
      20FF000000190000001900000019000000190000001900000019000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019000000190000001900000019000000190000001900000019202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      0019000000190000001900000011000000010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000121212BF1212
      12BF000000130000001300000013000000130000001300000013000000130000
      0013000000130000000700000005000000050000000700000012000000130000
      0013000000130000001300000013000000130000001300000013000000130000
      0013121212BF121212BF000000000000000000000000000000001E801EFF1E80
      1EFF000100190001001900010019000100190001001900010019000000000000
      00001E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E80
      1EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E80
      1EFF1E801EFF1E801EFF1E801EFF0926098C0000000000000000000000190000
      00190000001900000019202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF0000001900000019000000190000
      0019000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      0019000000190000001900000019000000110000000100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000121212BF1212
      12BF000000130000001300000013000000130000001300000013000000130000
      0013000000060000000000000000000000000000000000000005000000120000
      0013000000130000001300000013000000130000001300000013000000130000
      0013121212BF121212BF000000000000000000000000000000001E801EFF1E80
      1EFF000100190001001900010019000100190001001900010019000000000000
      00001E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E80
      1EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E80
      1EFF1E801EFF1E801EFF1E801EFF082408880000000000000000000000190000
      00190000001900000019202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF0000001900000019000000190000
      0019000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      001900000019000000190000001900000019202020FF202020FF000000000000
      0000000000000000000000000000000000000000000000000000121212BF1212
      12BF000000130000001300000013000000130000001300000013000000130000
      00060000000001000015592C00B05E2E00B50201001C00000000000000050000
      0012000000130000001300000013000000130000001300000013000000130000
      0013121212BF121212BF000000000000000000000000000000001E801EFF1E80
      1EFF000100190001001900010019000100190001001900010019000000000000
      00001E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E80
      1EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E80
      1EFF1E801EFF1E7B1EFB08220885000000070000000000000000202020FF2020
      20FF0000001900000019202020FF202020FF0000001900000019000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      00190000001900000019202020FF202020FF0000001900000019202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      001900000019000000190000001900000019202020FF202020FF000000000000
      0000000000000000000000000000000000000000000000000000121212BF1212
      12BF000000130000001300000013000000130000001300000013000000060000
      0000010000157E3F00D2BA5C00FFBA5C00FF894400DB0201001C000000000000
      0005000000120000001300000013000000130000001300000013000000130000
      0013121212BF121212BF000000000000000000000000000000001E801EFF1E80
      1EFF000100190001001900010019000100190001001900010019000000000000
      00001E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E80
      1EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E80
      1EFF155715D30105013400000000000000000000000000000000202020FF2020
      20FF0000001900000019202020FF202020FF0000001900000019000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      00190000001900000019202020FF202020FF0000001900000019202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      001900000019000000190000001900000019202020FF202020FF000000000000
      0000000000000000000000000000000000000000000000000000121212BF1212
      12BF000000130000001300000013000000130000001300000006000000000100
      00157E3F00D2BA5C00FFBA5C00FFBA5C00FFBA5C00FF894400DB0201001C0000
      0000000000050000001200000013000000130000001300000013000000130000
      0013121212BF121212BF000000000000000000000000000000001E801EFF1E80
      1EFF000100190001001900010019000100190001001900010019000000000000
      00001E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E80
      1EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E7B1EFB0822
      0885000000070000000000000000000000000000000000000000000000190000
      00190000001900000019202020FF202020FF0000001900000019000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      00190000001900000019202020FF202020FF0000001900000019000000190000
      0019000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      001900000019000000190000001900000019202020FF202020FF000000000000
      0000000000000000000000000000000000000000000000000000121212BF1212
      12BF000000130000001300000013000000130000000600000000010000157E3F
      00D2BA5C00FF7E3F00D2BA5C00FFBA5C00FF723900C8BA5C00FF894400DB0201
      001C000000000000000500000012000000130000001300000013000000130000
      0013121212BF121212BF000000000000000000000000000000001E801EFF1E80
      1EFF000100190001001900010019000100190001001900010019000000000000
      00001E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E80
      1EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF155715D3010501340000
      0000000000000000000000000000000000000000000000000000000000190000
      00190000001900000019202020FF202020FF0000001900000019000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      00190000001900000019202020FF202020FF0000001900000019000000190000
      0019000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      001900000019000000190000001900000019202020FF202020FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000010000157E3F00D2BA5C
      00FF7E3F00D201000015BA5C00FFBA5C00FF0000000F723900C8BA5C00FF8944
      00DB0201001C0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001E801EFF1E80
      1EFF000100190001001900010019000100190001001900010019000000000000
      00001E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E80
      1EFF1E801EFF1E801EFF1E801EFF1E7B1EFB0822088500000007000000000000
      0000000000000000000000000000000000000000000000000000202020FF2020
      20FF0000001900000019202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF0000001900000019202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF00000019000000190000001900000019000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      001900000019000000190000001900000019202020FF202020FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000160B0059B85C00FE7E3F
      00D20100001500000000BA5C00FFBA5C00FF000000000000000F723900C8BA5C
      00FF1E0F00680000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001E801EFF1E80
      1EFF00010019000100190001001900010019000200200A2B0A96000000000000
      00001E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E80
      1EFF1E801EFF1E801EFF155715D3010501340000000000000000000000000000
      0000000000000000000000000000000000000000000000000000202020FF2020
      20FF0000001900000019202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF0000001900000019202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      0000202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000160B00590100
      00150000000000000000BA5C00FFBA5C00FF00000000000000000000000F190C
      005F000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001E801EFF1E80
      1EFF000100190001001900010019020B024B175E17DB1E801EFF000000000000
      00001E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E80
      1EFF1E7B1EFB0822088500000007000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019000000000000000000000000000000000000000000000000000000000000
      000007070778202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF202020FF202020FF2020
      20FF202020FF202020FF202020FF202020FF202020FF07070778000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BA5C00FFBA5C00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001E801EFF1E80
      1EFF00010019000200200A2B0A961E7D1EFC1E801EFF155715D3000000000000
      00001E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1557
      15D3010501340000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019000000190000001900000019000000190000001900000019000000190000
      0019000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000202020FF202020FF202020FF2020
      20FF202020FF0F0F0FAE000000130000000F0D0D0DA2202020FF202020FF2020
      20FF202020FF202020FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BA5C00FFBA5C00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001E801EFF1E80
      1EFF020B024B175E17DB1E801EFF1E7D1EFC0823088600000007000000000000
      00001E801EFF1E801EFF1E801EFF1E801EFF1E801EFF1E7B1EFB082208850000
      0007000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000202020FF2020
      20FF0000001900000019202020FF202020FF0000001900000019202020FF2020
      20FF0000001900000019202020FF202020FF0000001900000019202020FF2020
      20FF0000001900000019202020FF202020FF0000001900000019202020FF2020
      20FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000202020FF202020FF202020FF2020
      20FF202020FF0000001F00000000000000000000000F202020FF202020FF2020
      20FF202020FF202020FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BA5C00FFBA5C00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001E801EFF1E80
      1EFF1E7D1EFC1E801EFF155A15D7010601380000000000000000000000000000
      00001E801EFF1E801EFF1E801EFF1E801EFF155715D301050134000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000070707782020
      20FF0000001900000019202020FF202020FF0000001900000019202020FF2020
      20FF0000001900000019202020FF202020FF0000001900000019202020FF2020
      20FF0000001900000019202020FF202020FF0000001900000019202020FF0707
      0778000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001B1B
      1BE8202020FF00000023000000000000000000000013202020FF1F1F1FF80000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BA5C00FFBA5C00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001E801EFF1E80
      1EFF1E7D1EFC0926098B00000008000000000000000000000000000000000000
      00001E801EFF1E801EFF1E7B1EFB082208850000000700000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000E0E
      0EA4202020FF111111B9000000230000001F0F0F0FAE202020FF101010B40000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BA5C00FFBA5C00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000010601390D37
      0DA8010601380000000000000000000000000000000000000000000000000000
      0000010601390C360CA601050134000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00201B1B1BEA202020FF202020FF202020FF202020FF1D1D1DF00000002A0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BA5C00FFBA5C00FF0000000000000000000000000000
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
      0000000000200D0D0DA41B1B1BE81B1B1BEA0E0E0EAA00000027000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BA5C00FFBA5C00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000400000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
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
      00000000000000000000000000000000}
    DesignInfo = 23069020
    ImageInfo = <
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D3C2F7374796C65
          3E0D0A093C2F646566733E0D0A093C7469746C653E49636F6E4C696768745061
          7374653C2F7469746C653E0D0A093C672069643D2263616E7661732220636C61
          73733D2263616E766173223E0D0A09093C7061746820636C6173733D2263616E
          7661732220643D224D31362C3136483056304831365A222F3E0D0A093C2F673E
          0D0A093C672069643D226C6576656C2D31223E0D0A09093C7061746820636C61
          73733D226C696768742D64656661756C74677265792D31302220643D224D372C
          31342E3548322E3556332E35683130563748382E3038364C372C382E3038365A
          222F3E0D0A09093C7061746820636C6173733D226C696768742D64656661756C
          74677265792D31302220643D224D31342E352C382E357637682D36762D375A22
          2F3E0D0A09093C7061746820636C6173733D226C696768742D64656661756C74
          677265792220643D224D31342E352C38682D364C382C382E3576376C2E352E35
          68366C2E352D2E35762D375A4D31342C31354839563968355A222F3E0D0A0909
          3C7061746820636C6173733D226C696768742D64656661756C74677265792220
          643D224D372C313548322E354C322C31342E3556332E354C322E352C33683130
          6C2E352E3556374831325634483356313448375A222F3E0D0A09093C70617468
          20636C6173733D226C696768742D64656661756C74677265792220643D224D39
          2E352C3261322C322C302C302C302D342C3048345634683756325A6D2D322C31
          61312C312C302C312C312C312D3141312C312C302C302C312C372E352C335A22
          2F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D2E6C696768742D
          626C75657B66696C6C3A20233030356462613B206F7061636974793A20313B7D
          2E636C732D317B6F7061636974793A302E37353B7D3C2F7374796C653E0D0A09
          3C2F646566733E0D0A093C7469746C653E4275696C64536F6C7574696F6E3C2F
          7469746C653E0D0A093C672069643D2263616E766173223E0D0A09093C706174
          6820636C6173733D2263616E7661732220643D224D31362C3136483056304831
          365A222F3E0D0A093C2F673E0D0A093C672069643D226C6576656C2D31223E0D
          0A09093C6720636C6173733D22636C732D31223E0D0A0909093C706174682063
          6C6173733D226C696768742D64656661756C74677265792D31302220643D224D
          31342C3576394832563548332E3837384C362E3733322C372E38353448382E32
          36384C31312E3132322C355A222F3E0D0A0909093C7061746820636C6173733D
          226C696768742D64656661756C74677265792220643D224D31352C3576392E35
          6C2D2E352E3548312E354C312C31342E3556354832763948313456355A222F3E
          0D0A09093C2F673E0D0A09093C7061746820636C6173733D226C696768742D64
          656661756C74677265792220643D224D31312C3131763248395631315A4D372C
          3131763248355631315A4D352C387632483356385A4D392C387632483756385A
          6D342C30763248313156385A222F3E0D0A09093C7061746820636C6173733D22
          6C696768742D626C75652220643D224D31302E3335342C342E3335346C2D322E
          352C322E3548372E3134366C2D322E352D322E352E3730382D2E3730374C372C
          352E3239335630483856352E3239334C392E3634362C332E3634375A222F3E0D
          0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D67
          7265656E2D31307B66696C6C3A20233166383031663B206F7061636974793A20
          302E313B7D2E6C696768742D677265656E7B66696C6C3A20233166383031663B
          206F7061636974793A20313B7D3C2F7374796C653E0D0A093C2F646566733E0D
          0A093C7469746C653E52756E416C6C3C2F7469746C653E0D0A093C672069643D
          2263616E766173223E0D0A09093C7061746820636C6173733D2263616E766173
          2220643D224D31362C3136483056304831365A222F3E0D0A093C2F673E0D0A09
          3C672069643D226C6576656C2D31223E0D0A09093C7061746820636C6173733D
          226C696768742D677265656E2D31302220643D224D312E352C312E3437763132
          4C352C31312E313456332E385A222F3E0D0A09093C7061746820636C6173733D
          226C696768742D677265656E2220643D224D312E37382C312E30382C312C312E
          357631326C2E37382E34324C352C31312E3737762D312E326C2D332C3256322E
          34336C332C3256332E32335A222F3E0D0A09093C7061746820636C6173733D22
          6C696768742D677265656E2220643D224D362E3737372C312E3038342C362C31
          2E357631326C2E3737372E3431362C392D3656372E3038345A222F3E0D0A093C
          2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D3C2F7374796C65
          3E0D0A093C2F646566733E0D0A093C7469746C653E4C61796F757450616E656C
          3C2F7469746C653E0D0A093C672069643D2263616E766173223E0D0A09093C70
          61746820636C6173733D2263616E7661732220643D224D31362C313648305630
          4831365A222F3E0D0A093C2F673E0D0A093C672069643D226C6576656C2D3122
          3E0D0A09093C7061746820636C6173733D226C696768742D64656661756C7467
          7265792D31302220643D224D31342C322E357631326C2D2E352E3548312E354C
          312C31342E3556334C322C324831332E355A222F3E0D0A09093C706174682063
          6C6173733D226C696768742D64656661756C74677265792220643D224D31332C
          31346831762E356C2D2E352E354831335A4D392C3135683156313448395A6D32
          2C3068315631344831315A4D372C3135483856313448375A4D352C3135483656
          313448355A4D332C3135483456313448335A6D2D322D2E352E352E3548325631
          3448315A4D312C3131483256313048315A6D302C32483256313248315A4D312C
          394832563848315A4D312C374832563648315A4D312C354832563448315A4D34
          2C324833563348345A4D362C324835563348365A6D342C304839563368315A6D
          312C31683156324831315A4D382C324837563348385A6D352E352C3048313356
          33683156322E355A4D312C322E3556334832563248312E355A4D31332C313168
          315631304831335A6D302C3268315631324831335A6D302D3468315638483133
          5A6D302D32683156364831335A6D302D32683156344831335A4D332C34683956
          3848335A4D342C376837563548345A4D382C396834763348385A6D312C326832
          56313048395A4D372C31324833563948375A4D362C31304834763148365A222F
          3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D3C2F7374796C65
          3E0D0A093C2F646566733E0D0A093C7469746C653E49636F6E4C696768744365
          7274696669636174653C2F7469746C653E0D0A093C672069643D2263616E7661
          732220636C6173733D2263616E766173223E0D0A09093C7061746820636C6173
          733D2263616E7661732220643D224D31362C3136483056304831365A222F3E0D
          0A093C2F673E0D0A093C672069643D226C6576656C2D31223E0D0A09093C7061
          746820636C6173733D226C696768742D64656661756C74677265792D31302220
          643D224D31342E352C312E35763130483756382E393432483741332E3439332C
          332E3439332C302C302C302C322E352C332E36333556312E355A222F3E0D0A09
          093C7061746820636C6173733D226C696768742D64656661756C746772657922
          20643D224D31322C345635483956345A4D392C376833563648395A222F3E0D0A
          09093C7061746820636C6173733D226C696768742D64656661756C7467726579
          2220643D224D31352C312E357631306C2D2E352E354837563131483856313048
          3976316831563130683176316831563130683176316831563130483133563968
          3156384831335637683156364831335635683156344831335633683156324831
          3356334831325632483131563348313056324839563348385632483756334836
          56324835563348345632483356332E33353161332E3531352C332E3531352C30
          2C302C302D312C2E37303756312E354C322E352C316831325A222F3E0D0A0909
          3C7061746820636C6173733D226C696768742D64656661756C74677265792D31
          302220643D224D342E352C313061332E34382C332E34382C302C302C302C322D
          2E3633355631342E356C2D322D322D322C3256392E33363541332E34382C332E
          34382C302C302C302C342E352C31305A6D302D362E3561332C332C302C312C30
          2C332C3341332C332C302C302C302C342E352C332E355A222F3E0D0A09093C70
          61746820636C6173733D226C696768742D64656661756C74677265792220643D
          224D382C362E3541332E352C332E352C302C312C302C322C382E393432483256
          31342E356C2E3835342E3335344C342E352C31332E3230376C312E3634362C31
          2E3634374C372C31342E3556382E393432483741332E3438352C332E3438352C
          302C302C302C382C362E355A4D362C392E36343976332E3634344C342E383534
          2C31322E31343648342E3134364C332C31332E32393356392E36343948336133
          2E3338312C332E3338312C302C302C302C332C305A4D342E352C3941322E352C
          322E352C302C312C312C372C362E352C322E352C322E352C302C302C312C342E
          352C395A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D2E6C696768742D
          626C75657B66696C6C3A20233030356462613B206F7061636974793A20313B7D
          2E77686974657B66696C6C3A20236666666666663B206F7061636974793A2031
          3B7D2E636C732D317B6F7061636974793A302E37353B7D3C2F7374796C653E0D
          0A093C2F646566733E0D0A093C7469746C653E436F6D70696C656448656C7046
          696C653C2F7469746C653E0D0A093C672069643D2263616E766173223E0D0A09
          093C7061746820636C6173733D2263616E7661732220643D224D31362C313648
          3056304831365A222F3E0D0A093C2F673E0D0A093C672069643D226C6576656C
          2D31223E0D0A09093C6720636C6173733D22636C732D31223E0D0A0909093C70
          61746820636C6173733D226C696768742D64656661756C74677265792D313022
          20643D224D372E3235342C31332E3548312E3556312E3568376C332C3356372E
          303541342E3930372C342E3930372C302C302C302C372E3235342C31332E355A
          222F3E0D0A0909093C7061746820636C6173733D226C696768742D6465666175
          6C74677265792220643D224D372E3432322C313448312E354C312C31332E3556
          312E354C312E352C3168376C2E3335342E3134362C332C334C31322C342E3556
          3761342E3938382C342E3938382C302C302C302D312C2E315635483856324832
          56313348372E3141342E3936382C342E3936382C302C302C302C372E3432322C
          31345A222F3E0D0A0909093C7061746820636C6173733D226C696768742D6465
          6661756C74677265792220643D224D372C354833563448375A6D332C322E3432
          3256374833563848392E30323741352E3031362C352E3031362C302C302C312C
          31302C372E3432325A4D372E3432322C31304833763148372E3141342E393638
          2C342E3936382C302C302C312C372E3432322C31305A222F3E0D0A09093C2F67
          3E0D0A09093C7061746820636C6173733D226C696768742D626C75652220643D
          224D31322C313661342C342C302C312C312C342D3441342C342C302C302C312C
          31322C31365A222F3E0D0A09093C7061746820636C6173733D22776869746522
          20643D224D31312E3537312C31342E383133762D2E38682E383538762E385A4D
          31322C392E31383861312E3733312C312E3733312C302C302C312C2E3636332E
          3132352C312E38362C312E38362C302C302C312C2E3534392E3334352C312E34
          38382C312E3438382C302C302C312C2E3336382E3530392C312E3630382C312E
          3630382C302C302C312C2E3133342E3632382C312E3239332C312E3239332C30
          2C302C312D2E3039332E3530382C312E3730362C312E3730362C302C302C312D
          2E3234382E3430382C332C332C302C302C312D2E3334382E333538712D2E322E
          3136392D2E342E333634612E3534332E3534332C302C302C302D2E3136372E32
          36342C312E3533322C312E3533322C302C302C302D2E30342E33762E31612E38
          2E382C302C302C302C2E3030372E313036682D2E383538762D2E3361312E3239
          2C312E32392C302C302C312C2E3039342D2E35303841312E3639322C312E3639
          322C302C302C312C31312E392C313261312E3934332C312E3934332C302C302C
          312C2E3331342D2E3331342C322E3734352C322E3734352C302C302C302C2E33
          30382D2E323832632E30392D2E312E31372D2E3139312E3234312D2E32383361
          2E3435372E3435372C302C302C302C2E3039342D2E3332362E3733312E373331
          2C302C302C302D2E3036372D2E3331342E3738332E3738332C302C302C302D2E
          3138312D2E3235312E3932322E3932322C302C302C302D2E3237342D2E313736
          412E3737322E3737322C302C302C302C31322C392E393931612E3837362E3837
          362C302C302C302D2E3333352E3036332E3836372E3836372C302C302C302D2E
          3236382E3136392E3837372E3837372C302C302C302D2E3138372E3235382E36
          33392E3633392C302C302C302D2E3036372E333134682D2E38353761312E3435
          322C312E3435322C302C302C312C2E3133342D2E3632322C312E3731392C312E
          3731392C302C302C312C2E3336382D2E3531352C312E3632382C312E3632382C
          302C302C312C2E3534322D2E33343541312E3934362C312E3934362C302C302C
          312C31322C392E3138385A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C73766720786D6C6E733D22687474703A2F2F7777772E77
          332E6F72672F323030302F737667222076696577426F783D2230203020313620
          3136223E0D0A093C646566733E0D0A09093C7374796C653E2E63616E7661737B
          66696C6C3A206E6F6E653B206F7061636974793A20303B7D2E6C696768742D64
          656661756C74677265792D31307B66696C6C3A20233231323132313B206F7061
          636974793A20302E313B7D2E6C696768742D64656661756C74677265797B6669
          6C6C3A20233231323132313B206F7061636974793A20313B7D3C2F7374796C65
          3E0D0A093C2F646566733E0D0A093C7469746C653E49636F6E4C696768745061
          636B6167653C2F7469746C653E0D0A093C672069643D2263616E766173223E0D
          0A09093C7061746820636C6173733D2263616E7661732220643D224D31362C31
          36483056304831365A222F3E0D0A093C2F673E0D0A093C672069643D226C6576
          656C2D31223E0D0A09093C7061746820636C6173733D226C696768742D646566
          61756C74677265792D31302220643D224D322E352C352E35683131763948322E
          355A222F3E0D0A09093C7061746820636C6173733D226C696768742D64656661
          756C74677265792220643D224D31312E392C3561312E3831362C312E3831362C
          302C302C302C2E3433322D2E3837382C312E3931332C312E3931332C302C302C
          302D312E3536332D322E3243392E3538382C312E3732322C392C322E3537352C
          382E3631322C332E333432632D2E3037362E3135312D2E3239352E3634312D2E
          3532362C312E31364C382C342E3638356C2D2E312D2E32313751372E3635372C
          332E392C372E342C332E333432632D2E3338362D2E3736372D2E3937312D312E
          36322D322E3135372D312E34323361312E39312C312E39312C302C302C302D31
          2E3536342C322E3241312E3831362C312E3831362C302C302C302C342E313036
          2C3548322E354C322C352E3576396C2E352E356831316C2E352D2E35762D394C
          31332E352C355A4D392E3530362C332E373931632E3435382D2E3931332E3736
          342D2E3934322C312E312D2E383835612E39312E39312C302C302C312C2E3734
          342C312E3034392C312E3037312C312E3037312C302C302C312D2E3531362E36
          3841372E3237362C372E3237362C302C302C312C31302E3138372C3548382E39
          35384C392C342E393143392E3232322C342E3430392C392E3433322C332E3933
          372C392E3530362C332E3739315A6D2D342E33332E38343361312E30372C312E
          30372C302C302C312D2E3531352D2E363739412E3930382E3930382C302C302C
          312C352E342C322E3930366830632E33332D2E3035372E3633382D2E3032362C
          312E3039352E3838362E3037322E3134332E3237342E362E3439322C312E3038
          354C372E3034382C3548352E38313941372E3238372C372E3238372C302C302C
          312C352E3137362C342E3633345A4D372E352C31344833563648372E355A4D31
          332C313448382E3556364831335A222F3E0D0A093C2F673E0D0A3C2F7376673E
          0D0A}
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
