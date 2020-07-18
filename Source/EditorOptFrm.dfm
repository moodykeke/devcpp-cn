object EditorOptForm: TEditorOptForm
  Left = 879
  Top = 375
  BorderStyle = bsDialog
  Caption = 'Editor Options'
  ClientHeight = 492
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    492
    492)
  PixelsPerInch = 96
  TextHeight = 17
  object PagesMain: TPageControl
    Left = 0
    Top = 0
    Width = 485
    Height = 455
    ActivePage = tabGeneral
    TabOrder = 0
    OnChange = PagesMainChange
    object tabGeneral: TTabSheet
      Caption = 'General'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      object grpEditorOpts: TGroupBox
        Left = 9
        Top = 16
        Width = 452
        Height = 241
        Caption = '  Editor Options  '
        TabOrder = 0
        object cbFunctionHint: TCheckBox
          Left = 241
          Top = 191
          Width = 208
          Height = 17
          Caption = 'Show function hints'
          TabOrder = 15
        end
        object cbTrimTrailingSpaces: TCheckBox
          Left = 240
          Top = 214
          Width = 209
          Height = 17
          Caption = 'Trim Trailing Spaces'
          TabOrder = 7
        end
        object cbAutoIndent: TCheckBox
          Left = 14
          Top = 26
          Width = 209
          Height = 17
          Caption = 'Auto Indent'
          TabOrder = 0
        end
        object cbAddIndent: TCheckBox
          Left = 14
          Top = 49
          Width = 209
          Height = 17
          Caption = 'Add indent to {} and :'
          TabOrder = 2
        end
        object cbDropFiles: TCheckBox
          Left = 14
          Top = 142
          Width = 209
          Height = 17
          Caption = 'Insert Dropped Files'
          TabOrder = 5
        end
        object cbEHomeKey: TCheckBox
          Left = 241
          Top = 26
          Width = 208
          Height = 17
          Caption = 'Enhance home key'
          TabOrder = 8
        end
        object cbInsertMode: TCheckBox
          Left = 14
          Top = 72
          Width = 209
          Height = 17
          Caption = 'Insert Mode'
          TabOrder = 1
        end
        object cbParserHints: TCheckBox
          Left = 240
          Top = 168
          Width = 208
          Height = 17
          Caption = 'Show editor hints'
          TabOrder = 14
        end
        object cbHalfPage: TCheckBox
          Left = 241
          Top = 122
          Width = 208
          Height = 17
          Caption = 'Half Page Scrolling'
          TabOrder = 12
        end
        object cbGroupUndo: TCheckBox
          Left = 14
          Top = 118
          Width = 209
          Height = 17
          Caption = 'Group Undo'
          TabOrder = 4
        end
        object cbFindText: TCheckBox
          Left = 14
          Top = 95
          Width = 209
          Height = 17
          Caption = 'Find Text at Cursor'
          TabOrder = 3
        end
        object cbPastEOL: TCheckBox
          Left = 241
          Top = 76
          Width = 208
          Height = 17
          Caption = 'Cursor Past EOL'
          TabOrder = 10
        end
        object cbPastEOF: TCheckBox
          Left = 241
          Top = 53
          Width = 208
          Height = 17
          Caption = 'Cursor Past EOF'
          TabOrder = 9
        end
        object cbScrollHint: TCheckBox
          Left = 241
          Top = 145
          Width = 208
          Height = 17
          Caption = 'Scroll Hint'
          TabOrder = 13
        end
        object cbSmartScroll: TCheckBox
          Left = 241
          Top = 99
          Width = 208
          Height = 17
          Caption = 'Scollbars on need'
          TabOrder = 11
        end
        object cbSpecialChars: TCheckBox
          Left = 14
          Top = 165
          Width = 209
          Height = 17
          Caption = 'Show Special Line Chars'
          TabOrder = 6
        end
        object cbUseCodeFold: TCheckBox
          Left = 14
          Top = 188
          Width = 209
          Height = 17
          Caption = 'Show Code Folding on Gutter'
          TabOrder = 16
          OnClick = cbUseCodeFoldClick
        end
        object cbClickCodeFold: TCheckBox
          Left = 30
          Top = 211
          Width = 204
          Height = 17
          Caption = 'Click to Fold/Unfold Code'
          TabOrder = 17
        end
      end
      object grpCaret: TGroupBox
        Left = 9
        Top = 272
        Width = 232
        Height = 124
        Caption = '  Caret  '
        TabOrder = 1
        object lblInsertCaret: TLabel
          Left = 14
          Top = 24
          Width = 68
          Height = 17
          Caption = 'Insert caret:'
        end
        object lblOverCaret: TLabel
          Left = 14
          Top = 55
          Width = 92
          Height = 17
          Caption = 'Overwrite caret:'
        end
        object cboInsertCaret: TComboBox
          Left = 136
          Top = 21
          Width = 89
          Height = 25
          Style = csDropDownList
          TabOrder = 0
          Items.Strings = (
            'Vertical Line'
            'Horizontal Line'
            'Half Block'
            'Block')
        end
        object cboOverwriteCaret: TComboBox
          Left = 136
          Top = 52
          Width = 89
          Height = 25
          Style = csDropDownList
          TabOrder = 1
          Items.Strings = (
            'Vertical Line'
            'Horizontal Line'
            'Half Block'
            'Block')
        end
        object cbMatch: TCheckBox
          Left = 14
          Top = 91
          Width = 203
          Height = 17
          Caption = 'Highlight matching symbols'
          TabOrder = 2
        end
      end
      object grpTabs: TGroupBox
        Left = 247
        Top = 272
        Width = 214
        Height = 124
        Caption = '  Tabs  '
        TabOrder = 2
        object lblTabSize: TLabel
          Left = 22
          Top = 87
          Width = 52
          Height = 17
          Caption = 'Tab Size:'
        end
        object seTabSize: TSpinEdit
          Left = 96
          Top = 87
          Width = 57
          Height = 27
          MaxValue = 64
          MinValue = 0
          TabOrder = 2
          Value = 0
        end
        object cbUseTabs: TCheckBox
          Left = 16
          Top = 28
          Width = 169
          Height = 17
          Caption = 'Use Tab Character'
          TabOrder = 0
        end
        object cbSmartTabs: TCheckBox
          Left = 16
          Top = 51
          Width = 185
          Height = 17
          Caption = 'Smart Tabs'
          TabOrder = 1
        end
      end
    end
    object tabDisplay: TTabSheet
      Caption = 'Fonts'
      object ScrollHint: TLabel
        Left = 3
        Top = 121
        Width = 473
        Height = 33
        Alignment = taCenter
        AutoSize = False
        Caption = 
          'It is also possible to edit text size by using Control+Scroll, j' +
          'ust like in browsers!'
      end
      object grpGutter: TGroupBox
        Left = 3
        Top = 156
        Width = 462
        Height = 185
        Caption = '  Gutter  '
        TabOrder = 1
        DesignSize = (
          462
          185)
        object lblGutterFont: TLabel
          Left = 8
          Top = 91
          Width = 28
          Height = 17
          Anchors = [akLeft, akRight, akBottom]
          Caption = 'Font:'
        end
        object lblGutterWidth: TLabel
          Left = 364
          Top = 29
          Width = 95
          Height = 14
          Anchors = [akLeft, akRight, akBottom]
          AutoSize = False
          Caption = 'Gutter Width'
          WordWrap = True
        end
        object lblGutterFontSize: TLabel
          Left = 366
          Top = 84
          Width = 23
          Height = 17
          Anchors = [akLeft, akRight, akBottom]
          Caption = 'Size'
        end
        object cbLeadZero: TCheckBox
          Left = 175
          Top = 66
          Width = 162
          Height = 15
          Caption = 'Show Leading Zeros'
          TabOrder = 5
        end
        object cbFirstZero: TCheckBox
          Left = 175
          Top = 46
          Width = 162
          Height = 15
          Caption = 'Start at Zero'
          TabOrder = 4
        end
        object cbLineNum: TCheckBox
          Left = 175
          Top = 26
          Width = 162
          Height = 15
          Caption = 'Show Line Numbers'
          TabOrder = 3
          OnClick = cbLineNumClick
        end
        object cbGutterVis: TCheckBox
          Left = 12
          Top = 25
          Width = 145
          Height = 15
          Caption = 'Visible'
          TabOrder = 0
        end
        object cbGutterAuto: TCheckBox
          Left = 12
          Top = 46
          Width = 145
          Height = 15
          Caption = 'Auto Size'
          TabOrder = 1
        end
        object cbGutterFnt: TCheckBox
          Left = 12
          Top = 67
          Width = 145
          Height = 15
          Caption = 'Use Custom Font'
          TabOrder = 2
          OnClick = cbGutterFntClick
        end
        object cboGutterFont: TComboBox
          Left = 12
          Top = 107
          Width = 341
          Height = 66
          AutoComplete = False
          Style = csOwnerDrawVariable
          ItemHeight = 60
          Sorted = True
          TabOrder = 6
          OnDrawItem = cboGutterFontDrawItem
        end
        object edGutterSize: TSpinEdit
          Left = 366
          Top = 107
          Width = 80
          Height = 27
          MaxValue = 999
          MinValue = 1
          TabOrder = 7
          Value = 10
          OnChange = edGutterSizeChange
        end
        object edGutterWidth: TSpinEdit
          Left = 364
          Top = 49
          Width = 80
          Height = 27
          MaxValue = 999
          MinValue = 1
          TabOrder = 8
          Value = 32
        end
      end
      object grpEditorFont: TGroupBox
        Left = 9
        Top = 3
        Width = 456
        Height = 109
        Caption = '  Editor Font  '
        TabOrder = 0
        object lblEditorSize: TLabel
          Left = 360
          Top = 16
          Width = 26
          Height = 17
          Caption = 'Size:'
        end
        object lblEditorFont: TLabel
          Left = 8
          Top = 16
          Width = 28
          Height = 17
          Caption = 'Font:'
        end
        object cboEditorFont: TComboBox
          Left = 12
          Top = 32
          Width = 341
          Height = 66
          AutoComplete = False
          Style = csOwnerDrawVariable
          ItemHeight = 60
          Sorted = True
          TabOrder = 0
          OnChange = cboEditorFontChange
          OnDrawItem = cboEditorFontDrawItem
        end
        object edEditorSize: TSpinEdit
          Left = 360
          Top = 32
          Width = 80
          Height = 27
          MaxValue = 999
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = edEditorSizeChange
        end
      end
      object grpMargin: TGroupBox
        Left = 3
        Top = 347
        Width = 462
        Height = 62
        Caption = '  Right Margin  '
        TabOrder = 2
        object lblMarginWidth: TLabel
          Left = 175
          Top = 31
          Width = 34
          Height = 17
          Caption = 'Width'
        end
        object lblMarginColor: TLabel
          Left = 305
          Top = 31
          Width = 32
          Height = 17
          Caption = 'Color'
        end
        object cpMarginColor: TColorBox
          Left = 343
          Top = 26
          Width = 97
          Height = 22
          DefaultColorColor = cl3DLight
          Style = [cbStandardColors, cbCustomColor, cbPrettyNames]
          TabOrder = 0
        end
        object edMarginWidth: TSpinEdit
          Left = 229
          Top = 23
          Width = 60
          Height = 27
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 0
        end
        object cbMarginVis: TCheckBox
          Left = 12
          Top = 32
          Width = 145
          Height = 17
          Caption = 'Show  Right Margin'
          TabOrder = 2
        end
      end
    end
    object tabSyntax: TTabSheet
      Caption = 'Colors'
      object lblForeground: TLabel
        Left = 13
        Top = 237
        Width = 72
        Height = 17
        Caption = 'Foreground:'
      end
      object lblBackground: TLabel
        Left = 13
        Top = 288
        Width = 72
        Height = 17
        Caption = 'Background:'
      end
      object lblSpeed: TLabel
        Left = 18
        Top = 3
        Width = 120
        Height = 17
        Caption = 'Color Speed Setting:'
      end
      object btnSaveSyntax: TSpeedButton
        Left = 18
        Top = 28
        Width = 23
        Height = 23
        Hint = 'Save color theme'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000CE0E0000D80E0000000000000000000000FF0000FF00
          00FF0000FF0000FF0000000000000000000000000000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF00000000666148A89F77DD
          DDDD9B9A8F00000000000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF00000000A89F77A89F77E9E9E9B2B0A7D5D4D29392894848480000
          0000FF0000FF0000FF0000FF0000FF0000FF00000000B9B294A89F77756E534A
          473AACA47EDADAD5E0E0E0B4B4B476736500000000FF0000FF0000FF0000FF00
          00FF00000000A89F77A89F77756E53F3F3F3F1F1F1E7E7E7E1E1E1B4B2A96661
          48635E464A463400000000FF0000FF00000000B2AA87F0EFE8EBE9E0A89F7763
          5E46ADABA4EAEAEAE4E4E4646360A89F77A89F7700000000000000FF0000FF00
          000000EBE9E0FFFFFFFFFFFFF5F4F0A89F77A89F77635E465A574B787255A89F
          77A89F7700000000FF0000FF00000000B2AA87F2F1EBFFFFFFFFFFFFFFFFFFF5
          F4F0EBE9E0A89F77A89F77756E53756E5300000000000000FF0000FF00000000
          EBE9E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F6F2EBE9E0A89F77A89F
          7700000000FF0000FF000000008D8A78F2F1EBFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF0EFE800000000000000FF0000FF00000000B9B294
          DFDCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEECE40000
          0000FF0000FF0000FF0000FF00000000000000C9C4AED5D1BFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF9F8F500000000000000FF0000FF0000FF0000FF0000FF00
          00FF00000000000000C9C4AED5D1BFD5D1BFFFFFFFF4F3EEA89F7700000000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00000000000000D5
          D1BFC5C1A8EDECE400000000000000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF00000000000000A89F7700000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000000000000000FF0000FF0000FF0000FF0000FF00}
        ParentShowHint = False
        ShowHint = True
        OnClick = btnSaveSyntaxClick
      end
      object CppEdit: TSynEdit
        Left = 144
        Top = 57
        Width = 329
        Height = 329
        Align = alCustom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        TabOrder = 3
        CodeFolding.GutterShapeSize = 11
        CodeFolding.CollapsedLineColor = clGrayText
        CodeFolding.FolderBarLinesColor = clGrayText
        CodeFolding.IndentGuidesColor = clGray
        CodeFolding.IndentGuides = True
        CodeFolding.ShowCollapsedLine = False
        CodeFolding.ShowHintMark = True
        UseCodeFolding = False
        ClickCodeFolding = False
        Gutter.AutoSize = True
        Gutter.BorderStyle = gbsNone
        Gutter.DigitCount = 2
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -12
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = []
        Gutter.LeftOffset = 4
        Gutter.RightOffset = 21
        Gutter.ShowLineNumbers = True
        Gutter.Width = 32
        Gutter.GradientEndColor = clBackground
        HideSelection = True
        Highlighter = cpp
        Lines.Strings = (
          '#include <iostream>'
          'using namespace std;'
          ''
          'int main(int argc, char **argv)'
          '{'
          #9'int num[20];'
          #9'double av, tt; //breakpoint'
          #9'for (int i = 0; i <= 19; i++)'
          #9'{ // active breakpoint'
          #9#9'num[i] = i;'
          #9#9'Tt += i; // error line'
          #9'}'
          #9'av = tt / 20; // comment'
          #9'cout << "Average: " << av << endl;'
          #9'cout << "OK!";'#9'//selected text'
          '}  //current line')
        Options = [eoAutoIndent, eoDisableScrollArrows, eoHideShowScrollbars, eoNoCaret, eoNoSelection, eoSmartTabs, eoTrimTrailingSpaces]
        ReadOnly = True
        RightEdge = 0
        ScrollHintFormat = shfTopToBottom
        TabWidth = 4
        WantTabs = True
        OnGutterClick = OnGutterClick
        OnSpecialLineColors = CppEditSpecialLineColors
        OnStatusChange = cppEditStatusChange
        FontSmoothing = fsmNone
        RemovedKeystrokes = <
          item
            Command = ecDeleteLastChar
            ShortCut = 8200
          end
          item
            Command = ecLineBreak
            ShortCut = 8205
          end
          item
            Command = ecContextHelp
            ShortCut = 112
          end>
        AddedKeystrokes = <>
      end
      object ElementList: TListBox
        Left = 8
        Top = 57
        Width = 130
        Height = 174
        ImeName = 'CN'#177'??i(CN'#177'U)'
        IntegralHeight = True
        ItemHeight = 17
        Items.Strings = (
          'Comment'
          'Identifier'
          'Keyword'
          'Number'
          'Background'
          'String'
          'Symbol'
          'WhiteSpace'
          'Directives')
        TabOrder = 0
        OnClick = ElementListClick
      end
      object grpStyle: TGroupBox
        Left = 13
        Top = 339
        Width = 110
        Height = 73
        Caption = '  Style:  '
        TabOrder = 2
        object cbBold: TCheckBox
          Left = 8
          Top = 15
          Width = 100
          Height = 17
          Caption = 'Bold'
          TabOrder = 0
          OnClick = StyleChange
        end
        object cbItalic: TCheckBox
          Left = 8
          Top = 32
          Width = 100
          Height = 17
          Caption = 'Italic'
          TabOrder = 1
          OnClick = StyleChange
        end
        object cbUnderlined: TCheckBox
          Left = 8
          Top = 50
          Width = 100
          Height = 17
          Caption = 'Underlined'
          TabOrder = 2
          OnClick = StyleChange
        end
      end
      object cboQuickColor: TComboBox
        Left = 47
        Top = 26
        Width = 130
        Height = 25
        Style = csDropDownList
        TabOrder = 1
        OnSelect = cboQuickColorSelect
        Items.Strings = (
          'Classic'
          'Classic Plus'
          'Twilight'
          'Ocean'
          'Visual Studio'
          'Borland'
          'Matrix'
          'Obsidian'
          'GSS Hacker'
          'Obvilion'
          'PlasticCodeWrap')
      end
      object edSyntaxExt: TEdit
        Left = 214
        Top = 26
        Width = 254
        Height = 25
        TabOrder = 4
      end
      object cbSyntaxHighlight: TCheckBox
        Left = 214
        Top = 3
        Width = 300
        Height = 17
        Caption = 'Use Syntax Highlighting'
        TabOrder = 5
        OnClick = cbSyntaxHighlightClick
      end
      object cpForeground: TColorBox
        Left = 13
        Top = 260
        Width = 110
        Height = 22
        Style = [cbStandardColors, cbCustomColor, cbPrettyNames]
        TabOrder = 6
        OnChange = StyleChange
      end
      object cpBackground: TColorBox
        Left = 13
        Top = 311
        Width = 110
        Height = 22
        Style = [cbStandardColors, cbCustomColor, cbPrettyNames]
        TabOrder = 7
        OnChange = StyleChange
      end
      object cbHighCurrLine: TCheckBox
        Left = 167
        Top = 392
        Width = 185
        Height = 17
        Caption = 'Highlight Current line'
        TabOrder = 8
      end
    end
    object tabCode: TTabSheet
      Caption = 'Snippets'
      object PagesSnippets: TPageControl
        Left = 0
        Top = 0
        Width = 477
        Height = 423
        ActivePage = tabCPInserts
        Align = alClient
        TabOrder = 0
        object tabCPInserts: TTabSheet
          Caption = 'Inserts'
          object lblMacros: TLabel
            Left = 3
            Top = 361
            Width = 47
            Height = 17
            Caption = 'Macros:'
          end
          object btnAdd: TButton
            Left = 384
            Top = 45
            Width = 78
            Height = 24
            Caption = 'Add'
            TabOrder = 0
            OnClick = btnAddClick
          end
          object btnRemove: TButton
            Left = 382
            Top = 77
            Width = 80
            Height = 24
            Caption = 'Remove'
            TabOrder = 1
            OnClick = btnRemoveClick
          end
          object CodeIns: TSynEdit
            Left = -3
            Top = 176
            Width = 469
            Height = 173
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            TabOrder = 2
            TabStop = False
            CodeFolding.GutterShapeSize = 11
            CodeFolding.CollapsedLineColor = clGrayText
            CodeFolding.FolderBarLinesColor = clGrayText
            CodeFolding.IndentGuidesColor = clGray
            CodeFolding.IndentGuides = True
            CodeFolding.ShowCollapsedLine = False
            CodeFolding.ShowHintMark = True
            UseCodeFolding = False
            ClickCodeFolding = False
            Gutter.AutoSize = True
            Gutter.BorderStyle = gbsNone
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -12
            Gutter.Font.Name = 'Courier New'
            Gutter.Font.Style = []
            Gutter.LeftOffset = 4
            Gutter.RightOffset = 21
            Gutter.ShowLineNumbers = True
            Highlighter = cpp
            Options = [eoAutoIndent, eoHideShowScrollbars, eoKeepCaretX, eoSmartTabs, eoTabIndent, eoTrimTrailingSpaces]
            TabWidth = 4
            WantTabs = True
            OnStatusChange = CodeInsStatusChange
            FontSmoothing = fsmNone
            RemovedKeystrokes = <
              item
                Command = ecContextHelp
                ShortCut = 112
              end>
            AddedKeystrokes = <
              item
                Command = ecContextHelp
                ShortCut = 16496
              end>
          end
          object lvCodeIns: TStringGrid
            Left = 3
            Top = 3
            Width = 366
            Height = 171
            ColCount = 3
            DefaultColWidth = 115
            DefaultRowHeight = 18
            FixedCols = 0
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs, goAlwaysShowEditor]
            TabOrder = 3
            OnSelectCell = lvCodeInsSelectCell
            ColWidths = (
              147
              53
              133)
          end
          object Edit1: TEdit
            Left = 80
            Top = 358
            Width = 382
            Height = 25
            ReadOnly = True
            TabOrder = 4
            Text = 
              '$PROGRAM$, $COPYRIGHT$, $AUTHOR$, $DATETIME$,  $DESCRIPTION$, <D' +
              'ATETIME>, *|*'
          end
        end
        object tabCPDefault: TTabSheet
          Caption = 'Default Insert'
          object cbDefaultCode: TCheckBox
            Left = 4
            Top = 2
            Width = 461
            Height = 17
            Caption = 'Insert Default Code into Empty Projects'
            TabOrder = 0
          end
          object seDefault: TSynEdit
            Left = 0
            Top = 24
            Width = 468
            Height = 364
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            TabOrder = 1
            TabStop = False
            CodeFolding.GutterShapeSize = 11
            CodeFolding.CollapsedLineColor = clGrayText
            CodeFolding.FolderBarLinesColor = clGrayText
            CodeFolding.IndentGuidesColor = clGray
            CodeFolding.IndentGuides = True
            CodeFolding.ShowCollapsedLine = False
            CodeFolding.ShowHintMark = True
            UseCodeFolding = False
            ClickCodeFolding = False
            Gutter.AutoSize = True
            Gutter.BorderStyle = gbsNone
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -12
            Gutter.Font.Name = 'Courier New'
            Gutter.Font.Style = []
            Gutter.LeftOffset = 4
            Gutter.RightOffset = 21
            Gutter.ShowLineNumbers = True
            Highlighter = cpp
            Options = [eoAutoIndent, eoHideShowScrollbars, eoKeepCaretX, eoSmartTabs, eoTabIndent, eoTrimTrailingSpaces]
            TabWidth = 4
            WantTabs = True
            OnStatusChange = CodeInsStatusChange
            FontSmoothing = fsmNone
            RemovedKeystrokes = <
              item
                Command = ecContextHelp
                ShortCut = 112
              end>
            AddedKeystrokes = <
              item
                Command = ecContextHelp
                ShortCut = 16496
              end>
          end
        end
      end
    end
    object tabCBCompletion: TTabSheet
      Caption = 'Completion'
      object PagesCompletion: TPageControl
        Left = 0
        Top = 0
        Width = 477
        Height = 423
        ActivePage = tabCodeCompletion
        Align = alClient
        TabOrder = 0
        object tabCodeCompletion: TTabSheet
          Caption = 'Code Completion'
          ImageIndex = 1
          object lblCompletionColor: TLabel
            Left = 328
            Top = 108
            Width = 106
            Height = 17
            Caption = 'Background color:'
          end
          object lblCompletionDelay: TLabel
            Left = 8
            Top = 108
            Width = 64
            Height = 17
            Caption = 'Delay (ms):'
          end
          object chkEnableCompletion: TCheckBox
            Left = 8
            Top = 8
            Width = 457
            Height = 17
            Caption = 'Enable code-completion'
            TabOrder = 0
            OnClick = chkEnableCompletionClick
          end
          object cpCompletionBackground: TColorBox
            Left = 333
            Top = 128
            Width = 112
            Height = 22
            DefaultColorColor = clWhite
            Style = [cbStandardColors, cbCustomColor, cbPrettyNames]
            TabOrder = 1
          end
          object gbCBEngine: TGroupBox
            Left = 8
            Top = 36
            Width = 457
            Height = 65
            Caption = 'Engine behaviour'
            TabOrder = 2
            object chkCBParseLocalH: TCheckBox
              Left = 8
              Top = 20
              Width = 345
              Height = 17
              Caption = 'Scan local files referenced in #include'#39's'
              TabOrder = 0
            end
            object chkCBParseGlobalH: TCheckBox
              Left = 8
              Top = 40
              Width = 345
              Height = 17
              Caption = 'Scan global files referenced in #include'#39's'
              TabOrder = 1
            end
          end
          object tbCompletionDelay: TTrackBar
            Left = 16
            Top = 132
            Width = 297
            Height = 37
            Max = 2000
            Min = 1
            ParentShowHint = False
            Frequency = 50
            Position = 1000
            ShowHint = False
            TabOrder = 3
            TickMarks = tmBoth
            OnChange = tbCompletionDelayChange
          end
        end
        object tabSymbolCompletion: TTabSheet
          Caption = 'Symbol Completion'
          ImageIndex = 2
          object grpSpecific: TGroupBox
            Left = 16
            Top = 40
            Width = 273
            Height = 201
            Caption = 'Specific completion options'
            TabOrder = 1
            object cbParenth: TCheckBox
              Left = 16
              Top = 48
              Width = 240
              Height = 17
              Caption = 'Complete parentheses '#39'()'#39
              TabOrder = 1
            end
            object cbBraces: TCheckBox
              Left = 16
              Top = 24
              Width = 240
              Height = 17
              Caption = 'Complete braces '#39'{}'#39
              TabOrder = 0
            end
            object cbInclude: TCheckBox
              Left = 16
              Top = 72
              Width = 240
              Height = 17
              Caption = 'Complete includes '#39'<>'#39
              TabOrder = 2
            end
            object cbComments: TCheckBox
              Left = 16
              Top = 120
              Width = 240
              Height = 17
              Caption = 'Complete multiline comments '#39'/**/'#39
              TabOrder = 4
            end
            object cbArray: TCheckBox
              Left = 16
              Top = 96
              Width = 240
              Height = 17
              Caption = 'Complete square braces '#39'[]'#39
              TabOrder = 3
            end
            object cbSingleQuotes: TCheckBox
              Left = 16
              Top = 143
              Width = 240
              Height = 17
              Caption = 'Complete single quotes '#39#39#39#39
              TabOrder = 5
            end
            object cbDoubleQuotes: TCheckBox
              Left = 16
              Top = 168
              Width = 240
              Height = 17
              Caption = 'Complete double quotes '#39'""'#39
              TabOrder = 6
            end
          end
          object cbSymbolComplete: TCheckBox
            Left = 8
            Top = 8
            Width = 465
            Height = 17
            Caption = 'Enable symbol completion'
            TabOrder = 0
            OnClick = cbSymbolCompleteClick
          end
          object cbDeleteCompleted: TCheckBox
            Left = 8
            Top = 256
            Width = 449
            Height = 17
            Caption = 'Delete completed symbols as pairs'
            TabOrder = 2
          end
        end
      end
    end
    object tabAutosave: TTabSheet
      Caption = 'Autosave'
      ImageIndex = 5
      object cbAutoSave: TCheckBox
        Left = 8
        Top = 8
        Width = 457
        Height = 17
        Caption = 'Enable editor autosave'
        TabOrder = 0
        OnClick = cbAutoSaveClick
      end
      object OptionsGroup: TGroupBox
        Left = 8
        Top = 32
        Width = 457
        Height = 385
        Caption = ' Options '
        TabOrder = 1
        object SaveInterval: TLabel
          Left = 16
          Top = 36
          Width = 45
          Height = 17
          Caption = 'Interval:'
        end
        object lblTimeStampExample: TLabel
          Left = 24
          Top = 296
          Width = 52
          Height = 17
          Caption = 'Example:'
        end
        object MinutesDelay: TTrackBar
          Left = 144
          Top = 24
          Width = 297
          Height = 40
          Max = 60
          Min = 1
          PageSize = 1
          Position = 1
          TabOrder = 0
          TickMarks = tmBoth
          OnChange = MinutesDelayChange
        end
        object FileOptions: TRadioGroup
          Left = 16
          Top = 80
          Width = 239
          Height = 97
          Caption = 'Files'
          Items.Strings = (
            'Save only the currently visible file'
            'Save all open files after each interval'
            'Save all project files')
          TabOrder = 1
        end
        object NameOptions: TRadioGroup
          Left = 16
          Top = 188
          Width = 239
          Height = 97
          Caption = 'Filenames'
          Items.Strings = (
            'Overwrite file'
            'Append UNIX timestamp'
            'Append formatted timestamp')
          TabOrder = 2
          OnClick = NameOptionsClick
        end
      end
    end
  end
  object btnOk: TBitBtn
    Left = 218
    Top = 460
    Width = 85
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 1
    OnClick = btnOkClick
  end
  object btnCancel: TBitBtn
    Left = 308
    Top = 460
    Width = 85
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
    OnClick = btnCancelClick
  end
  object btnHelp: TBitBtn
    Left = 398
    Top = 460
    Width = 85
    Height = 25
    Anchors = [akRight, akBottom]
    Enabled = False
    Kind = bkHelp
    NumGlyphs = 2
    TabOrder = 3
    OnClick = btnHelpClick
  end
  object cpp: TSynCppSyn
    DefaultFilter = 'C++ Files (*.c,*.cpp,*.h,*.hpp)|*.c;*.cpp;*.h;*.hpp'
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    Left = 5
    Top = 458
  end
end
