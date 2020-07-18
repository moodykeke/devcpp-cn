{
    This file is part of Dev-C++
    Copyright (c) 2004 Bloodshed Software

    Dev-C++ is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    Dev-C++ is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Dev-C++; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
}

unit EditorOptFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Spin,
  SynEdit, SynEditHighlighter, SynHighlighterCpp,
  Buttons, ClassBrowser, CppParser, CppTokenizer, StrUtils, Grids,
  CppPreprocessor;

type
  // Keep history of what we have accessed (does not mean changed)
  TEditorOptFormTabs = (taGeneral, taFonts, taColors, taSnippets, taCompletion, taAutosave);
  TEditorOptFormHistory = set of TEditorOptFormTabs;

  TEditorOptForm = class(TForm)
    PagesMain: TPageControl;
    tabDisplay: TTabSheet;
    grpGutter: TGroupBox;
    cbGutterVis: TCheckBox;
    cbGutterAuto: TCheckBox;
    cbLineNum: TCheckBox;
    cbFirstZero: TCheckBox;
    cbLeadZero: TCheckBox;
    cbGutterFnt: TCheckBox;
    lblGutterFont: TLabel;
    cboGutterFont: TComboBox;
    lblGutterWidth: TLabel;
    lblGutterFontSize: TLabel;
    edGutterSize: TSpinEdit;
    tabGeneral: TTabSheet;
    tabSyntax: TTabSheet;
    lblForeground: TLabel;
    lblBackground: TLabel;
    CppEdit: TSynEdit;
    ElementList: TListBox;
    grpStyle: TGroupBox;
    cbBold: TCheckBox;
    cbItalic: TCheckBox;
    cbUnderlined: TCheckBox;
    cpp: TSynCppSyn;
    grpEditorFont: TGroupBox;
    lblEditorSize: TLabel;
    lblEditorFont: TLabel;
    cboEditorFont: TComboBox;
    edEditorSize: TSpinEdit;
    grpCaret: TGroupBox;
    lblInsertCaret: TLabel;
    lblOverCaret: TLabel;
    cboInsertCaret: TComboBox;
    cboOverwriteCaret: TComboBox;
    tabCode: TTabSheet;
    PagesSnippets: TPageControl;
    tabCPInserts: TTabSheet;
    tabCPDefault: TTabSheet;
    btnAdd: TButton;
    btnRemove: TButton;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    btnHelp: TBitBtn;
    cboQuickColor: TComboBox;
    lblSpeed: TLabel;
    CodeIns: TSynEdit;
    btnSaveSyntax: TSpeedButton;
    tabCBCompletion: TTabSheet;
    lblCompletionDelay: TLabel;
    lblCompletionColor: TLabel;
    tbCompletionDelay: TTrackBar;
    chkEnableCompletion: TCheckBox;
    cbMatch: TCheckBox;
    grpEditorOpts: TGroupBox;
    edGutterWidth: TSpinEdit;
    cbSpecialChars: TCheckBox;
    cbSmartScroll: TCheckBox;
    cbScrollHint: TCheckBox;
    cbPastEOL: TCheckBox;
    cbPastEOF: TCheckBox;
    cbParserHints: TCheckBox;
    cbInsertMode: TCheckBox;
    cbHalfPage: TCheckBox;
    cbGroupUndo: TCheckBox;
    cbFindText: TCheckBox;
    cbEHomeKey: TCheckBox;
    cbDropFiles: TCheckBox;
    cbAddIndent: TCheckBox;
    cbAutoIndent: TCheckBox;
    cbTrimTrailingSpaces: TCheckBox;
    ScrollHint: TLabel;
    tabAutosave: TTabSheet;
    cbAutoSave: TCheckBox;
    OptionsGroup: TGroupBox;
    SaveInterval: TLabel;
    MinutesDelay: TTrackBar;
    FileOptions: TRadioGroup;
    cbFunctionHint: TCheckBox;
    edSyntaxExt: TEdit;
    cbSyntaxHighlight: TCheckBox;
    grpTabs: TGroupBox;
    seTabSize: TSpinEdit;
    lblTabSize: TLabel;
    cbUseTabs: TCheckBox;
    cbSmartTabs: TCheckBox;
    cbDefaultCode: TCheckBox;
    seDefault: TSynEdit;
    NameOptions: TRadioGroup;
    lvCodeIns: TStringGrid;
    gbCBEngine: TGroupBox;
    chkCBParseGlobalH: TCheckBox;
    chkCBParseLocalH: TCheckBox;
    lblTimeStampExample: TLabel;
    cpForeground: TColorBox;
    cpBackground: TColorBox;
    cpCompletionBackground: TColorBox;
    PagesCompletion: TPageControl;
    tabSymbolCompletion: TTabSheet;
    grpSpecific: TGroupBox;
    cbParenth: TCheckBox;
    cbBraces: TCheckBox;
    cbInclude: TCheckBox;
    cbComments: TCheckBox;
    cbArray: TCheckBox;
    cbSymbolComplete: TCheckBox;
    tabCodeCompletion: TTabSheet;
    cbDeleteCompleted: TCheckBox;
    cbSingleQuotes: TCheckBox;
    cbDoubleQuotes: TCheckBox;
    cbHighCurrLine: TCheckBox;
    grpMargin: TGroupBox;
    lblMarginWidth: TLabel;
    lblMarginColor: TLabel;
    cpMarginColor: TColorBox;
    cbUseCodeFold: TCheckBox;
    cbClickCodeFold: TCheckBox;
    edMarginWidth: TSpinEdit;
    cbMarginVis: TCheckBox;
    lblMacros: TLabel;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure SetGutter;
    procedure ElementListClick(Sender: TObject);
    procedure cppEditStatusChange(Sender: TObject; Changes: TSynStatusChanges);
    procedure StyleChange(Sender: TObject);
    procedure cbLineNumClick(Sender: TObject);
    procedure cbSyntaxHighlightClick(Sender: TObject);
    procedure cbGutterFntClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure CodeInsStatusChange(Sender: TObject; Changes: TSynStatusChanges);
    procedure cboQuickColorSelect(Sender: TObject);
    procedure CppEditSpecialLineColors(Sender: TObject; Line: Integer; var Special: Boolean; var FG, BG: TColor);
    procedure tbCompletionDelayChange(Sender: TObject);
    procedure chkEnableCompletionClick(Sender: TObject);
    procedure btnSaveSyntaxClick(Sender: TObject);
    procedure OnGutterClick(Sender: TObject; Button: TMouseButton; X, Y, Line: Integer; Mark: TSynEditMark);
    procedure cbAutoSaveClick(Sender: TObject);
    procedure MinutesDelayChange(Sender: TObject);
    procedure cbSymbolCompleteClick(Sender: TObject);
    procedure cboEditorFontDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure cboGutterFontDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure edEditorSizeChange(Sender: TObject);
    procedure edGutterSizeChange(Sender: TObject);
    procedure cboEditorFontChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lvCodeInsSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure PagesMainChange(Sender: TObject);
    procedure NameOptionsClick(Sender: TObject);
    procedure cbUseCodeFoldClick(Sender: TObject);
  private
    ffgColor: TColor;
    fbgColor: TColor;
    fGutColor: TPoint;
    fBPColor: TPoint;
    fErrColor: TPoint;
    fABPColor: TPoint;
    fSelColor: TPoint;
    fCurColor: TPoint;
    fFoldColor: TPoint;
    fColorElems: array[0..25] of string;
    procedure LoadFonts;
    procedure LoadText;
    procedure LoadCodeIns;
    procedure SaveCodeIns;
    procedure ClearCodeIns;
    procedure UpdateCIButtons;
    procedure LoadSyntax(const Value: String);
    procedure FillSyntaxSets;
  public
    AccessedTabs: TEditorOptFormHistory;
  end;

implementation

uses
  shlobj, MultiLangSupport, devcfg, version, utils, math, CommCtrl, DateUtils, CodeInsList, DataFrm, IniFiles, editor,
  main;

{$R *.dfm}
const
  cBreakLine = 7;
  cABreakLine = 9;
  cErrorLine = 11;
  cSelection = 15;
  cCurrent   = 16;

procedure TEditorOptForm.FormCreate(Sender: TObject);
var
  AttrName: String;
  Attribute: TSynHighlighterAttributes;
  I: integer;
begin
  LoadText;

  with devEditor do begin
    // Make editors look similar to main ones (assign same font)
    CppEdit.Font.Assign(Font);
    CppEdit.Font.Size := 12;
    CodeIns.Font.Assign(devEditor.Font);
    CodeIns.Font.Size := 12;
    seDefault.Font.Assign(devEditor.Font);
    seDefault.Font.Size := 12;

    // Gutters too
    CppEdit.Gutter.Font.Assign(Gutterfont);
    CppEdit.Gutter.Font.Size := 12;
    CodeIns.Gutter.Font.Assign(Gutterfont);
    CodeIns.Gutter.Font.Size := 12;
    seDefault.Gutter.Font.Assign(Gutterfont);
    seDefault.Gutter.Font.Assign(Gutterfont);


    //1. General
    cbGutterAuto.Checked := GutterAuto;
    cbGutterVis.Checked := GutterVis;
    edGutterWidth.Value := GutterSize;
    cbLineNum.Checked := LineNumbers;
    cbLeadZero.Checked := LeadZero;
    cbFirstZero.Checked := FirstLineZero;
    cbAutoIndent.Checked := AutoIndent;
    cbAddIndent.Checked := AddIndent;
    cbInsertMode.Checked := InsertMode;
    cbUseTabs.Checked := UseTabs;
    cbSmartTabs.Checked := SmartTabs;
    cbGroupUndo.Checked := GroupUndo;
    cbEHomeKey.Checked := EHomeKey;
    cbPastEOF.Checked := PastEOF;
    cbPastEOL.Checked := PastEOL;
    cbFindText.Checked := FindText;
    cbSmartScroll.Checked := Scrollbars;
    cbHalfPage.Checked := HalfPageScroll;
    cbScrollHint.Checked := ScrollHint;
    cbSpecialChars.Checked := SpecialChars;
    cbFunctionHint.Checked := ShowFunctionTip;

    cbUseCodeFold.Checked := UseCodeFold;
    cbClickCodeFold.Checked := ClickCodeFold;
    cbClickCodeFold.Enabled := UseCodefold;
    cbTrimTrailingSpaces.Checked := TrimTrailingSpaces;
    cbMarginVis.Checked := MarginVis;
    edMarginWidth.Value := MarginSize;
    cpMarginColor.Selected := MarginColor;
    seTabSize.Value := TabSize;
    cbSyntaxHighlight.Checked := UseSyntax;
    edSyntaxExt.Text := SyntaxExt;
    cboInsertCaret.ItemIndex := InsertCaret;
    cboOverwriteCaret.ItemIndex := OverwriteCaret;
    cbDropFiles.Checked := InsDropFiles;
    cbParserHints.Checked := ParserHints;
    cbMatch.Checked := Match;
    cbDefaultCode.Checked := DefaultCode;
    cbHighCurrLine.Checked := HighCurrLine;

    //2. Fonts
    LoadFonts; // fill dropdowns
    cboEditorFont.ItemIndex := cboEditorFont.Items.IndexOf(Font.Name);
    edEditorSize.Value := Font.Size;
    cbGutterFnt.Checked := Gutterfnt;
    cboGutterFont.ItemIndex := cboGutterFont.Items.IndexOf(Gutterfont.Name);
    edGutterSize.Value := GutterFont.Size;

    //3. Colors (Syntax Highlighter)
    FillSyntaxSets; // Load color themes

    cboQuickColor.ItemIndex := SyntaxIndex;
    StrtoPoint(fGutColor, Syntax.Values[cGut]);
    StrtoPoint(fbpColor, Syntax.Values[cBP]);
    StrtoPoint(fErrColor, Syntax.Values[cErr]);
    StrtoPoint(fABPColor, Syntax.Values[cABP]);
    StrtoPoint(fFoldColor, Syntax.Values[cFld]);
    StrtoPoint(fSelColor, Syntax.Values[cSel]);
    StrtoPoint(fCurColor, Syntax.Values[cCur]);
  end;

  //3. Colors (Syntax Highlighter), cont.
  ElementList.Items.BeginUpdate;
  try
    ElementList.Clear;
    for I := 0 to cpp.AttrCount - 1 do begin
      AttrName := cpp.Attribute[I].Name;

      if devEditor.Syntax.IndexOfName(AttrName) <> -1 then begin
        Attribute := TSynHighlighterAttributes.Create(AttrName);
        try
          StrtoAttr(Attribute, devEditor.Syntax.Values[AttrName]);
          cpp.Attribute[I].Assign(Attribute);
          ElementList.Items.Add(Lang[ID_COLOR_ELEMENT + I])
        finally
          Attribute.Free;
        end;
      end else begin
        devEditor.Syntax.Append(AttrName);
        ElementList.Items.Add(AttrName);
      end;

      fColorElems[I] := pchar(AttrName); // Add inner name to inner list
    end;

   // breakpoint
    if devEditor.Syntax.IndexOfName(cBP) = -1 then
      devEditor.Syntax.Add(cBP);
    //ElementList.Items.Add(cBP);
    ElementList.Items.Add(Lang[ID_COLOR_BREAKPOINTS]);
    //I := I + 1;
    fColorElems[I] := pchar(cBP);

    // active breakpoint
    if devEditor.Syntax.IndexOfName(cABP) = -1 then
      devEditor.Syntax.Add(cABP);
    //ElementList.Items.Add(cABP);
    ElementList.Items.Add(Lang[ID_COLOR_ACTIVEBREAK]);
    I := I + 1;
    fColorElems[I] := pchar(cABP);

    // error line
    if devEditor.Syntax.IndexOfName(cErr) = -1 then
      devEditor.Syntax.Add(cErr);
    //ElementList.Items.Add(cErr);
    ElementList.Items.Add(Lang[ID_COLOR_ERRORLINE]);
    I := I + 1;
    fColorElems[I] := pchar(cErr);

    // selection color
    if devEditor.Syntax.IndexofName(cSel) = -1 then
      devEditor.Syntax.Add(cSel);
    //ElementList.Items.Add(cSel);
    ElementList.Items.Add(Lang[ID_COLOR_SELECTED]);
    I := I + 1;
    fColorElems[I] := pchar(cSel);

    // gutter colors
    if devEditor.Syntax.IndexofName(cGut) = -1 then
      devEditor.Syntax.Add(cGut);
    //ElementList.Items.Add(cGut);
    ElementList.Items.Add(Lang[ID_COLOR_GUTTER]);
    I := I + 1;
    fColorElems[I] := pchar(cGut);

    // folding color
    if devEditor.Syntax.IndexofName(cFld) = -1 then
      devEditor.Syntax.Add(cFld);
    //ElementList.Items.Add(cFld);
    ElementList.Items.Add(Lang[ID_COLOR_FOLDINGLINE]);
    I := I + 1;
    fColorElems[I] := pchar(cFld);

    // Current Line color
    if devEditor.Syntax.IndexofName(cCur) = -1 then
      devEditor.Syntax.Add(cCur);
    //ElementList.Items.Add(cCur);
    ElementList.Items.Add(Lang[ID_COLOR_CURRENT]);
    I := I + 1;
    fColorElems[I] := pchar(cCur);

    ffgColor := cpp.WhitespaceAttribute.Foreground;
    fbgColor := cpp.WhitespaceAttribute.Background;
  finally
     ElementList.Items.EndUpdate; // redraw once
   end;

  // Ensure UI is set correctly
  if ElementList.Items.Count > 0 then begin
    ElementList.ItemIndex := 5;   //focus to "reserved words"
    ElementListClick(nil);
  end;

  //4. Snippets, Inserts
  LoadCodeIns;
  UpdateCIButtons;

  // Snippets, Default Insert
  if FileExists(devDirs.Config + DEV_DEFAULTCODE_FILE) then
    seDefault.Lines.LoadFromFile(devDirs.Config + DEV_DEFAULTCODE_FILE);

  //5. Code Completion
  chkEnableCompletion.Checked := devCodeCompletion.Enabled;
  chkCBParseLocalH.Checked := devCodeCompletion.ParseLocalHeaders;
  chkCBParseGlobalH.Checked := devCodeCompletion.ParseGlobalHeaders;
  tbCompletionDelay.Position := devCodeCompletion.Delay;
  cpCompletionBackground.Selected := devCodeCompletion.BackColor;
  chkEnableCompletionClick(nil);

  // Symbol Completion
  with devEditor do begin
    cbSymbolComplete.Checked := CompleteSymbols;
    cbDeleteCompleted.Checked := DeleteSymbolPairs;
    cbArray.Checked := ArrayComplete;
    cbBraces.Checked := BraceComplete;
    cbComments.Checked := CommentComplete;
    cbInclude.Checked := IncludeComplete;
    cbParenth.Checked := ParentheseComplete;
    cbSingleQuotes.Checked := SingleQuoteComplete;
    cbDoubleQuotes.Checked := DoubleQuoteComplete;

    // Completion. Only enable if CompleteSymbols is true
    cbSymbolCompleteClick(nil);

    //7. Autosave
    MinutesDelay.Position := devEditor.Interval;
    FileOptions.ItemIndex := devEditor.AutoSaveFilter;
    NameOptions.ItemIndex := devEditor.AutoSaveMode;
    cbAutoSave.Checked := devEditor.EnableAutoSave;
    cbAutoSaveClick(nil);
  end;

  //3. Colors (Syntax Highlighter), cont. 2
  SetGutter;

  // Set defaults of color buttons, don't want all system colors too
  cpMarginColor.Items.InsertObject(1, 'Default', TObject(cpMarginColor.DefaultColorColor));
  cpCompletionBackground.Items.InsertObject(1, 'Default', TObject(cpCompletionBackground.DefaultColorColor));
end;


procedure TEditorOptForm.cboEditorFontDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State:
  TOwnerDrawState);
var
  alignleft: integer;
  aligntop: integer;
begin
  with TComboBox(Control) do begin
    Canvas.Font.Name := Items.Strings[Index];
    Canvas.Font.Size := edEditorSize.Value;
    Canvas.FillRect(Rect);
    alignleft := (Rect.Right - Rect.Left) div 2 - Canvas.TextWidth(Canvas.Font.Name) div 2;
    aligntop := Rect.Top + (Rect.Bottom - Rect.Top) div 2 - Canvas.TextHeight(Canvas.Font.Name) div 2;
    Canvas.TextOut(alignleft, aligntop, Canvas.Font.Name);
  end;
end;

procedure TEditorOptForm.cboGutterFontDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State:
  TOwnerDrawState);
var
  alignleft: integer;
  aligntop: integer;
begin
  with TComboBox(Control) do begin

    if cbGutterFnt.Checked then begin
      Canvas.Font.Name := Items.Strings[Index];
      Canvas.Font.Size := edGutterSize.Value;
    end else begin
      Canvas.Font.Name := cboEditorFont.Text;
      Canvas.Font.Size := edEditorSize.Value;
    end;
    Canvas.FillRect(Rect);
    alignleft := (Rect.Right - Rect.Left) div 2 - Canvas.TextWidth(Canvas.Font.Name) div 2;
    aligntop := Rect.Top + (Rect.Bottom - Rect.Top) div 2 - Canvas.TextHeight(Canvas.Font.Name) div 2;
    Canvas.TextOut(alignleft, aligntop, Canvas.Font.Name);
  end;
end;

procedure TEditorOptForm.cboEditorFontChange(Sender: TObject);
begin
  if not cbGutterfnt.Checked then
    cboGutterFont.ItemIndex := cboEditorFont.ItemIndex;
  cboGutterFont.Repaint;
end;

procedure TEditorOptForm.edEditorSizeChange(Sender: TObject);
begin
  if not cbGutterfnt.Checked then
    edGutterSize.Value := edEditorSize.Value;
  cboEditorFont.Repaint;
  cboGutterFont.Repaint;
end;

procedure TEditorOptForm.edGutterSizeChange(Sender: TObject);
begin
  cboGutterFont.Repaint;
end;

procedure TEditorOptForm.cbGutterFntClick(Sender: TObject);
begin
  cboGutterFont.Enabled := cbGutterFnt.Checked;
  edGutterSize.Enabled := cbGutterfnt.Checked;
  if not cbGutterfnt.Checked then begin
    cboGutterFont.ItemIndex := cboEditorFont.ItemIndex;
    edGutterSize.Value := edEditorSize.Value;
  end;
end;

// Fill listboxes with available fonts

procedure TEditorOptForm.LoadFonts;
var
  idx: integer;

  //filter the monosapce fonts
  //TFont.Pitch Property Specifies whether the characters in the font all have the same width.
  //https://stackoverflow.com/questions/43861156/how-can-i-detect-monospace-fonts-in-delphi?r=SearchResults
  function EnumFontsProc(var elf: TEnumLogFont; var tm: TNewTextMetric;
                       FontType: Integer; Data: LPARAM): Integer; stdcall;
  begin;
    Result := Integer(FIXED_PITCH = (elf.elfLogFont.lfPitchAndFamily and FIXED_PITCH));
  end;
  //TODO: select Charset.
  //TFont.Charset: Specifies the character set of the font. (TFontCharset )

begin
  // Sum up all the available fonts
  cboEditorFont.Items.Assign(Screen.Fonts);  //Editor Fonts list
  //Screen.Fonts: Lists the face names for all fonts supported by the screen.

  for idx := cboEditorFont.Items.count downto 0  do begin
    //delete the useless fonts which include "@"
    if POS('@', cboEditorFont.Items[idx])>0 then begin
      cboEditorFont.Items.Delete(idx);
      continue;
    end;
    //delete unmonospace fonts.
    if not EnumFontFamilies(Canvas.Handle,
                      PChar(cboEditorFont.Items[idx]),
                      @EnumFontsProc,0)   then
      cboEditorFont.Items.Delete(idx);
  end;

  cboGutterFont.Items := cboEditorFont.Items;  //Gutter Fonts list

  cbLineNumClick(nil);
  cbGutterFntClick(nil);
end;

{ ---------- Form Init/Done Methods ----------}

procedure TEditorOptForm.LoadText;
begin
  // Set interface font
  Font.Name := devData.InterfaceFont;
  Font.Size := devData.InterfaceFontSize;

  btnOk.Caption := Lang[ID_BTN_OK];
  btnCancel.Caption := Lang[ID_BTN_CANCEL];
  btnHelp.Caption := Lang[ID_BTN_HELP];

  // Top level tabs
  Caption := Lang[ID_EOPT];
  tabGeneral.Caption := Lang[ID_EOPT_GENTAB];
  tabDisplay.Caption := Lang[ID_EOPT_DISPLAYTAB];
  tabSyntax.Caption := Lang[ID_EOPT_SYNTAXTAB];
  tabCode.Caption := Lang[ID_EOPT_CODETAB];
  tabCBCompletion.Caption := Lang[ID_EOPT_COMPLETIONTAB];
  tabCodeCompletion.Caption := Lang[ID_EOPT_CODECOMPLETIONTAB];
  tabAutosave.Caption := Lang[ID_EOPT_AUTOSAVETAB];

  // Sub tabs (inserts)
  tabCPInserts.Caption := Lang[ID_EOPT_CPINSERTS];
  tabCPDefault.Caption := Lang[ID_EOPT_CPDEFAULT];

  // Sub tabs (completion)
  tabSymbolCompletion.Caption := Lang[ID_EOPT_CPSYMBOLS];

  // General Tab
  grpEditorOpts.Caption := Lang[ID_EOPT_EDOPTIONS];
  cbAutoIndent.Caption := Lang[ID_EOPT_AUTOINDENT2];
  cbInsertMode.Caption := Lang[ID_EOPT_INSERTMODE];

  cbGroupUndo.Caption := Lang[ID_EOPT_GROUPUNDO];
  cbDropFiles.Caption := Lang[ID_EOPT_DROPFILES];
  cbSpecialChars.Caption := Lang[ID_EOPT_SPECIALCHARS];
  cbTrimTrailingSpaces.Caption := Lang[ID_EOPT_TRIMTRAILINGSPACES];
  cbEHomeKey.Caption := Lang[ID_EOPT_EHOMEKEY];
  cbPastEOF.Caption := Lang[ID_EOPT_PASTEOF];
  cbPastEOL.Caption := Lang[ID_EOPT_PASTEOL];
  cbAddIndent.Caption := Lang[ID_EOPT_ADDINDENT];
  cbFindText.Caption := Lang[ID_EOPT_FINDTEXT];
  cbSmartScroll.Caption := Lang[ID_EOPT_SMARTSCROLL];
  cbHalfPage.Caption := Lang[ID_EOPT_HALFPAGE];
  cbScrollHint.Caption := Lang[ID_EOPT_SCROLLHINT];
  cbParserHints.Caption := Lang[ID_EOPT_PARSERHINTS];
  cbFunctionHint.Caption := Lang[ID_EOPT_CLOSEBRACE];
  ScrollHint.Caption := Lang[ID_EOPT_CTRLSCROLLHINT];
  cbSyntaxHighlight.Caption := Lang[ID_EOPT_USESYNTAX];

  cbUseCodeFold.Caption := Lang[ID_EOPT_USECODEFOLDING];
  cbClickCodeFold.Caption := Lang[ID_EOPT_CLICKCODEFOLDING];

  grpMargin.Caption := Lang[ID_EOPT_MARGIN];
  cbMarginVis.Caption := Lang[ID_EOPT_GENERICENABLED];
  lblMarginWidth.Caption := Lang[ID_EOPT_WIDTH];
  lblMarginColor.Caption := Lang[ID_EOPT_COLOR];
  //grpHighCurLine.Caption := Lang[ID_EOPT_HIGHCURLINE];
  //cbHighlightColor.Caption := Lang[ID_EOPT_COLOR];

  grpCaret.Caption := Lang[ID_EOPT_CARET];
  lblInsertCaret.Caption := Lang[ID_EOPT_INSCARET];
  lblOverCaret.Caption := Lang[ID_EOPT_OVERCARET];
  cbMatch.Caption := Lang[ID_EOPT_MATCH];

  grpTabs.Caption := Lang[ID_EOPT_TABS];
  lblTabSize.Caption := Lang[ID_EOPT_TABSIZE];
  cbUseTabs.Caption := Lang[ID_EOPT_TAB2SPC];
  cbSmartTabs.Caption := Lang[ID_EOPT_SMARTTABS];

  cbHighCurrLine.Caption := Lang[ID_EOPT_HIGHCURLINE];

  cboInsertCaret.Clear;
  cboInsertCaret.Items.Add(Lang[ID_EOPT_CARET1]);
  cboInsertCaret.Items.Add(Lang[ID_EOPT_CARET2]);
  cboInsertCaret.Items.Add(Lang[ID_EOPT_CARET3]);
  cboInsertCaret.Items.Add(Lang[ID_EOPT_CARET4]);

  cboOverwriteCaret.Clear;
  cboOverwriteCaret.Items.Add(Lang[ID_EOPT_CARET1]);
  cboOverwriteCaret.Items.Add(Lang[ID_EOPT_CARET2]);
  cboOverwriteCaret.Items.Add(Lang[ID_EOPT_CARET3]);
  cboOverwriteCaret.Items.Add(Lang[ID_EOPT_CARET4]);

  // Fonts Tab
  grpEditorFont.Caption := Lang[ID_EOPT_EDFONT];
  lblEditorFont.Caption := Lang[ID_EOPT_FONT];
  lblEditorSize.Caption := Lang[ID_EOPT_SIZE];

  grpGutter.Caption := Lang[ID_EOPT_GUTTER];
  cbGutterVis.Caption := Lang[ID_EOPT_VISIBLE];
  cbGutterAuto.Caption := Lang[ID_EOPT_GUTTERAUTO];
  cbLineNum.Caption := Lang[ID_EOPT_LINENUM];
  cbLeadZero.Caption := Lang[ID_EOPT_LEADZERO];
  cbFirstZero.Caption := Lang[ID_EOPT_FIRSTZERO];
  cbGutterFnt.Caption := Lang[ID_EOPT_GUTTERFNT];
  lblGutterWidth.Caption := Lang[ID_EOPT_GUTTERWIDTH];
  lblGutterFont.Caption := Lang[ID_EOPT_FONT];
  lblGutterFontSize.Caption := Lang[ID_EOPT_SIZE];

  // Colors tab
  lblForeground.Caption := Lang[ID_EOPT_FORE];
  lblBackground.Caption := Lang[ID_EOPT_BACK];
  grpStyle.Caption := Lang[ID_EOPT_STYLE];
  cbBold.Caption := Lang[ID_EOPT_BOLD];
  cbItalic.Caption := Lang[ID_EOPT_ITALIC];
  cbUnderlined.Caption := Lang[ID_EOPT_UNDERLINE];
  lblSpeed.Caption := Lang[ID_EOPT_SPEED];
  btnSaveSyntax.Hint := Lang[ID_EOPT_SAVESYNTAX];

  cboQuickColor.Items[0] := Lang[ID_COLOR_SYNTAX];
  cboQuickColor.Items[1] := Lang[ID_COLOR_SYNTAX1];
  cboQuickColor.Items[2] := Lang[ID_COLOR_SYNTAX2];
  cboQuickColor.Items[3] := Lang[ID_COLOR_SYNTAX3];
  cboQuickColor.Items[4] := Lang[ID_COLOR_SYNTAX4];
  cboQuickColor.Items[5] := Lang[ID_COLOR_SYNTAX5];
  cboQuickColor.Items[6] := Lang[ID_COLOR_SYNTAX6];
  cboQuickColor.Items[7] := Lang[ID_COLOR_SYNTAX7];
  cboQuickColor.Items[8] := Lang[ID_COLOR_SYNTAX8];
  cboQuickColor.Items[9] := Lang[ID_COLOR_SYNTAX9];
  cboQuickColor.Items[10] := Lang[ID_COLOR_SYNTAX10];

  // Snippets tab
  btnAdd.Caption := Lang[ID_BTN_ADD];
  btnRemove.Caption := Lang[ID_BTN_REMOVE];
  lvCodeIns.Cols[0][0] := Lang[ID_EOPT_CIMENU];
  lvCodeIns.Cols[1][0] := Lang[ID_EOPT_CISECTION];
  lvCodeIns.Cols[2][0] := Lang[ID_EOPT_CIDESC];
  lblMacros.Caption := Lang[ID_EOPT_MACROS];
  cbDefaultCode.Caption := Lang[ID_EOPT_DEFCODE];

  // Completion tab, code
  chkEnableCompletion.Caption := Lang[ID_EOPT_COMPLETIONENABLE];
  lblCompletionColor.Caption := Lang[ID_EOPT_COMPLETIONCOLOR];
  gbCBEngine.Caption := Lang[ID_EOPT_BROWSERENGINE];
  chkCBParseLocalH.Caption := Lang[ID_EOPT_BROWSERLOCAL];
  chkCBParseGlobalH.Caption := Lang[ID_EOPT_BROWSERGLOBAL];

  // Completion tab, symbol
  cbSymbolComplete.Caption := Lang[ID_EOPT_SYMBOLCOMPLETE];
  grpSpecific.Caption := Lang[ID_EOPT_SYMBOLGROUP];
  cbBraces.Caption := Lang[ID_EOPT_SYMBOLBRACES];
  cbParenth.Caption := Lang[ID_EOPT_SYMBOLPARENT];
  cbInclude.Caption := Lang[ID_EOPT_SYMBOLINCLUDE];
  cbArray.Caption := Lang[ID_EOPT_SYMBOLSQUARE];
  cbComments.Caption := Lang[ID_EOPT_SYMBOLCOMMENT];
  cbSingleQuotes.Caption := Lang[ID_EOPT_SYMBOLSINGLEQUOTE];
  cbDoubleQuotes.Caption := Lang[ID_EOPT_SYMBOLDOUBLEQUOTE];
  cbDeleteCompleted.Caption := Lang[ID_EOPT_DELETESYMBOLPAIRS];

  // Autosave
  cbAutoSave.Caption := Lang[ID_EOPT_ENABLEAUTOSAVE];
  OptionsGroup.Caption := Lang[ID_EOPT_OPTIONS];

  FileOptions.Caption := Lang[ID_EOPT_AUTOSAVEFILE];
  FileOptions.Items[0] := Lang[ID_EOPT_AUTOSAVEONLYOPENFILE];
  FileOptions.Items[1] := Lang[ID_EOPT_AUTOSAVEALLFILES];
  FileOptions.Items[2] := Lang[ID_EOPT_AUTOSAVEPROJECT];

  NameOptions.Caption := Lang[ID_EOPT_AUTOSAVEMODE];
  NameOptions.Items[0] := Lang[ID_EOPT_AUTOSAVEOVERWRITE];
  NameOptions.Items[1] := Lang[ID_EOPT_AUTOSAVEUNIX];
  NameOptions.Items[2] := Lang[ID_EOPT_AUTOSAVETIME];

  tbCompletionDelayChange(nil);
  MinutesDelayChange(nil);
  NameOptionsClick(nil);
end;

procedure TEditorOptForm.btnOkClick(Sender: TObject);
var
  s, aName: String;
  a, idx: integer;
begin
  with devEditor do begin
    //1. general
    AutoIndent := cbAutoIndent.Checked;
    AddIndent := cbAddIndent.Checked;
    InsertMode := cbInsertMode.Checked;
    UseTabs := cbUseTabs.Checked;
    SmartTabs := cbSmartTabs.Checked;
    GroupUndo := cbGroupUndo.Checked;
    EHomeKey := cbEHomeKey.Checked;
    PastEOF := cbPastEOF.Checked;
    PastEOL := cbPastEOL.Checked;
    FindText := cbFindText.Checked;
    Scrollbars := cbSmartScroll.Checked;
    HalfPageScroll := cbHalfPage.Checked;
    ScrollHint := cbScrollHint.Checked;
    SpecialChars := cbSpecialChars.Checked;
    ShowFunctionTip := cbFunctionHint.Checked;
    TrimTrailingSpaces := cbTrimTrailingSpaces.Checked;
    UseCodeFold := cbUseCodeFold.Checked;
    ClickCodeFold := cbClickCodeFold.Checked;

    MarginVis := cbMarginVis.Checked;
    MarginSize := edMarginWidth.Value;
    MarginColor := cpMarginColor.Selected;
    InsertCaret := cboInsertCaret.ItemIndex;
    OverwriteCaret := cboOverwriteCaret.ItemIndex;
    Match := cbMatch.Checked;

    UseSyntax := cbSyntaxHighlight.Checked;
    SyntaxExt := edSyntaxExt.Text;
    TabSize := seTabSize.Value;

    //2. Fonts
    Font.Name := cboEditorFont.Text;
    Font.Size := edEditorSize.Value;
    Gutterfont.Name := cboGutterFont.Text;
    GutterFont.Size := edGutterSize.Value;

    Gutterfnt := cbGutterFnt.Checked;
    GutterAuto := cbGutterAuto.Checked;
    GutterVis := cbGutterVis.Checked;
    GutterSize := edGutterWidth.Value;
    LineNumbers := cbLineNum.Checked;
    LeadZero := cbLeadZero.Checked;
    FirstLineZero := cbFirstZero.Checked;
    InsDropFiles := cbDropFiles.Checked;

    ParserHints := cbParserHints.Checked;

    //5.2 Completion: Symbol
    CompleteSymbols := cbSymbolComplete.Checked;
    ArrayComplete := cbArray.Checked;
    BraceComplete := cbBraces.Checked;
    CommentComplete := cbComments.Checked;
    IncludeComplete := cbInclude.Checked;
    ParentheseComplete := cbParenth.Checked;
    SingleQuoteComplete := cbSingleQuotes.Checked;
    DoubleQuoteComplete := cbDoubleQuotes.Checked;
    DeleteSymbolPairs := cbDeleteCompleted.Checked;

    //6. Autosave
    devEditor.EnableAutoSave := cbAutoSave.Checked;
    devEditor.Interval := MinutesDelay.Position;
    devEditor.AutoSaveFilter := FileOptions.ItemIndex;
    devEditor.AutoSaveMode := NameOptions.ItemIndex;

    //3. Colors (Syntax Highlighter)
    //load in attributes
    SyntaxIndex := cboQuickColor.ItemIndex;
    for idx := 0 to pred(cpp.AttrCount) do begin
      aName := cpp.Attribute[idx].Name;
      a := Syntax.IndexOfName(aName);
      if a = -1 then
        Syntax.Append(format('%s=%s', [aName, AttrtoStr(cpp.Attribute[idx])]))
      else
        Syntax.Values[aName] := AttrtoStr(cpp.Attribute[idx]);
    end;

    // selected text
    s := PointtoStr(fSelColor);
    a := Syntax.IndexofName(cSel);
    if a = -1 then
      Syntax.Append(format('%s=%s', [cSel, s]))
    else
      Syntax.Values[cSel] := s;

    // Current Line text
    s := PointtoStr(fCurColor);
    a := Syntax.IndexofName(cCur);
    if a = -1 then
      Syntax.Append(format('%s=%s', [cCur, s]))
    else
      Syntax.Values[cCur] := s;
    HighCurrLine := cbHighCurrLine.Checked;
    HighColor := fCurColor.x;

    // gutter
    s := PointtoStr(fGutColor);
    a := Syntax.IndexofName(cGut);
    if a = -1 then
      Syntax.Append(format('%s=%s', [cGut, s]))
    else
      Syntax.Values[cGut] := s;

    // breakpoints
    s := PointtoStr(fbpColor);
    a := Syntax.IndexofName(cBP);
    if a = -1 then
      Syntax.Append(format('%s=%s', [cBP, s]))
    else
      Syntax.Values[cBP] := s;

    // error line
    s := PointtoStr(fErrColor);
    a := Syntax.IndexofName(cErr);
    if a = -1 then
      Syntax.Append(format('%s=%s', [cErr, s]))
    else
      Syntax.Values[cErr] := s;

    // active breakpoint
    s := PointtoStr(fAbpColor);
    a := Syntax.IndexofName(cABP);
    if a = -1 then
      Syntax.Append(format('%s=%s', [cABP, s]))
    else
      Syntax.Values[cABP] := s;

    // fold bar
    s := PointtoStr(fFoldColor);
    a := Syntax.IndexofName(cFld);
    if a = -1 then
      Syntax.Append(format('%s=%s', [cFld, s]))
    else
      Syntax.Values[cFld] := s;
  end;

  //4. Snippets
  //4.1 Save our code snippet even if we opted not to use it (user may want to keep it)
  if seDefault.GetTextLen > 0 then //if not seDefault.IsEmpty then //abli
    seDefault.Lines.SavetoFile(devDirs.Config + DEV_DEFAULTCODE_FILE)
  else
    DeleteFile(devDirs.Config + DEV_DEFAULTCODE_FILE);
  SaveCodeIns;
  //4.2 Default source
  devEditor.DefaultCode := cbDefaultCode.Checked;

  //5.1 Code Completion
  with devCodeCompletion do begin
    Enabled := chkEnableCompletion.Checked;
    Delay := tbCompletionDelay.Position;
    BackColor := cpCompletionBackground.Selected;
    ParseLocalHeaders := chkCBParseLocalH.Checked;
    ParseGlobalHeaders := chkCBParseGlobalH.Checked;
  end;

  // Only create the timer if autosaving is enabled
  if devEditor.EnableAutoSave then begin
    if not Assigned(MainForm.AutoSaveTimer) then
      MainForm.AutoSaveTimer := TTimer.Create(nil);
    MainForm.AutoSaveTimer.Interval := devEditor.Interval * 60 * 1000; // miliseconds to minutes
    MainForm.AutoSaveTimer.Enabled := devEditor.EnableAutoSave;
    MainForm.AutoSaveTimer.OnTimer := MainForm.EditorSaveTimer;
  end else begin
    MainForm.AutoSaveTimer.Free;
    MainForm.AutoSaveTimer := nil;
  end;

  SaveOptions;
  dmMain.LoadDataMod;
end;

procedure TEditorOptForm.btnHelpClick(Sender: TObject);
begin
  OpenHelpFile('index.htm');
end;

procedure TEditorOptForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

{ ---------- Syntax Style Methods ---------- }

procedure TEditorOptForm.SetGutter;
begin
  // update preview
  cppedit.Gutter.Color := fgutColor.x;
  cppedit.Gutter.Font.Color := fgutColor.y;
  cppedit.CodeFolding.FolderBarLinesColor := fFoldColor.y;

  // update snippet edit
  CodeIns.Gutter.Color := fgutColor.x;
  CodeIns.Gutter.Font.Color := fgutColor.y;
  CodeIns.CodeFolding.FolderBarLinesColor := fFoldColor.y;

  // update default source edit
  seDefault.Gutter.Color := fgutColor.x;
  seDefault.Gutter.Font.Color := fgutColor.y;
  seDefault.CodeFolding.FolderBarLinesColor := fFoldColor.y;
end;

procedure TEditorOptForm.ElementListClick(Sender: TObject);
var
  pt: TPoint;
begin
  //set these combobox disabled
  cbBold.Enabled := False;
  cbItalic.Enabled := False;
  cbUnderlined.Enabled := False;

  // Special additions not directly exposed by TSynHighlighter
  if ElementList.ItemIndex > pred(cpp.AttrCount) then begin

    // Select proper color for special items. Disable background for fold colors?
    // TODO: support specific colors for folds
    //if SameText(ElementList.Items[ElementList.ItemIndex], cSel) then begin
    if SameText(fColorElems[ElementList.ItemIndex], cSel) then begin
      pt := fSelColor;
      cpBackground.Enabled := True;

    end else if SameText(fColorElems[ElementList.ItemIndex], cBP) then begin
      pt := fBPColor;
      cpBackground.Enabled := True;
    end else if SameText(fColorElems[ElementList.ItemIndex], cErr) then begin
      pt := fErrColor;
      cpBackground.Enabled := True;
    end else if SameText(fColorElems[ElementList.ItemIndex], cABP) then begin
      pt := fABPColor;
      cpBackground.Enabled := True;
    end else if SameText(fColorElems[ElementList.ItemIndex], cGut) then begin
      pt := fGutColor;
      cpBackground.Enabled := True;
    end else if SameText(fColorElems[ElementList.ItemIndex], cFld) then begin
      pt := fFoldColor;
      cpBackground.Enabled := false;
    end else if SameText(fColorElems[ElementList.ItemIndex], cCur) then begin
      pt := fCurColor;
      cpBackground.Enabled := True;
    end;

    cpBackground.Selected := pt.x;
    cpForeground.Selected := pt.y;

    cbBold.Checked := False;
    cbItalic.Checked := False;
    cbUnderlined.Checked := False;

    cbBold.Enabled := False;
    cbItalic.Enabled := False;
    cbUnderlined.Enabled := False;

    // regular SynEdit attributes
  end else if ElementList.ItemIndex <> -1 then begin
    with Cpp.Attribute[ElementList.ItemIndex] do begin

      if Foreground = clNone then
        cpForeground.Selected := ffgcolor //clNone
      else
        cpForeground.Selected := Foreground;
      if Background = clNone then
        cpBackground.Selected := fbgcolor //clNone
      else
        cpBackground.Selected := Background;

      cpBackground.Enabled := True;

      //Assign value to comboboxes. Will trigger "StyleChange"!
      //So, in "StyleChange", should check whether the comboboes are enabled or not.
      cbBold.Checked := fsBold in Style;
      cbItalic.Checked := fsItalic in Style;
      cbUnderlined.Checked := fsUnderline in Style;
      //Enable these comboboxes.
      cbBold.Enabled := True;
      cbItalic.Enabled := True;
      cbUnderlined.Enabled := True;
    end;
  end;
end;

procedure TEditorOptForm.StyleChange(Sender: TObject);
var
  attr: TSynHighlighterAttributes;
  pt: TPoint;
  s: String;
begin
  if (ElementList.ItemIndex < 0) or (ElementList.ItemIndex >= ElementList.Items.Count) then
    Exit;

  // Special additions not directly exposed by TSynHighlighter
  if ElementList.ItemIndex > pred(cpp.AttrCount) then begin
    pt.x := cpBackground.Selected;
    pt.y := cpForeground.Selected;

    // use local String just to ease readability
    //s := ElementList.Items[ElementList.ItemIndex];
    s := fColorElems[ElementList.ItemIndex];

    // if either value is clnone set to Whitespace color values
    if pt.x = clNone then
      pt.x := fbgColor;
    if pt.y = clNone then
      pt.y := ffgColor;

    if SameText(s, cSel) then
      fSelColor := pt
    else if SameText(s, cCur) then
      fCurColor := pt
    else if SameText(s, cBP) then
      fBPColor := pt
    else if SameText(s, cABP) then
      fABPColor := pt
    else if SameText(s, cerr) then
      fErrColor := pt
    else if SameText(s, cGut) then begin
      fGutColor := pt;
      SetGutter;
    end else if SameText(s, cFld) then begin
      fFoldColor := pt;
      SetGutter;
    end;

    // regular SynEdit attributes
  end else begin
    Attr := TSynHighlighterAttributes.Create(fColorElems[ElementList.ItemIndex]);
    Attr.Assign(cpp.Attribute[ElementList.ItemIndex]);
    with Attr do try
      Foreground := cpForeground.Selected;
      Background := cpBackground.Selected;

      // Update default color
      if SameText(Name, 'WhiteSpace') then begin
        ffgColor := Foreground;
        fbgColor := Background;
      end;

      Style := cpp.Attribute[ElementList.ItemIndex].Style;
      if cbBold.Enabled then
        if cbBold.checked then
          Style := Style + [fsBold]
        else
           Style := Style - [fsBold];
      if cbItalic.Enabled then
        if  cbItalic.Checked then
          Style := Style + [fsItalic]
        else
          Style := Style - [fsItalic];
      if cbUnderlined.enabled then
        if cbUnderlined.Checked then
          Style := Style + [fsUnderline]
        else
          Style := Style - [fsUnderline];

      cpp.Attribute[ElementList.ItemIndex].Assign(Attr);
    finally
      Free;
    end;
  end;

  cppEdit.Repaint;
end;

procedure TEditorOptForm.cppEditStatusChange(Sender: TObject;
  Changes: TSynStatusChanges);
var
  Token: String;
  attr: TSynHighlighterAttributes;
  idx: integer;
begin
  if assigned(cppEdit.Highlighter) and
    (Changes * [scAll, scCaretX, scCaretY] <> []) then
    //todo: here need to change to translated text //abli
    case cppEdit.CaretY of
      cBreakLine: begin
          //ElementList.ItemIndex := ElementList.Items.Indexof(cBP);
          for idx := 0 to 25 do
            if sametext(fColorElems[idx], cBP) then  break;
          ElementList.ItemIndex := idx;
          ElementListClick(Self);
        end;
      cABreakLine: begin
          for idx := 0 to 25 do
            if sametext(fColorElems[idx], cABP) then  break;
          //ElementList.ItemIndex := ElementList.Items.Indexof(cABP);
          ElementList.ItemIndex := idx;
          ElementListClick(Self);
        end;
      cErrorLine: begin
          for idx := 0 to 25 do
            if sametext(fColorElems[idx], cErr) then  break;
          //ElementList.ItemIndex := ElementList.Items.Indexof(cErr);
          ElementList.ItemIndex := idx;
          ElementListClick(Self);
        end;
      cSelection: begin
          //ElementList.ItemIndex := ElementList.Items.Indexof(cSel);
          for idx := 0 to 25 do
            if sametext(fColorElems[idx], cSel) then  break;
          ElementList.ItemIndex := idx;
          ElementListClick(Self);
        end;
      cCurrent: begin
          //ElementList.ItemIndex := ElementList.Items.Indexof(cCur);
          for idx := 0 to 25 do
            if sametext(fColorElems[idx], cCur) then  break;
          ElementList.ItemIndex := idx;
          ElementListClick(Self);
        end;

    else begin
        if not cppEdit.GetHighlighterAttriAtRowCol(cppEdit.CaretXY, Token, Attr) then
          Attr := cppEdit.Highlighter.WhiteSpaceAttribute;
        if assigned(Attr) then begin
          //ElementList.ItemIndex := ElementList.Items.Indexof(Attr.Name);
          for idx := 0 to 25 do
            if sametext(fColorElems[idx], Attr.Name) then  break;
          ElementList.ItemIndex := idx;
          ElementListClick(Self);
        end;
      end;
    end;
end;

procedure TEditorOptForm.CppEditSpecialLineColors(Sender: TObject;
  Line: Integer; var Special: Boolean; var FG, BG: TColor);
begin
  case Line of
    cSelection: begin
        if fSelColor.x <> clNone then
          BG := fSelColor.x;
        if fSelColor.y <> clNone then
          FG := fSelColor.y;
        Special := TRUE;
      end;
    cCurrent: begin
        if fCurColor.x <> clNone then
          BG := fCurColor.x;
        if fCurColor.y <> clNone then
          FG := fCurColor.y;
        Special := TRUE;
      end;
    cBreakLine: begin
        if fBPColor.x <> clNone then
          BG := fBPColor.x;
        if fBPColor.y <> clNone then
          FG := fBPColor.y;
        Special := TRUE;
      end;
    cABreakLine: begin
        if fABPColor.x <> clNone then
          BG := fABPColor.X;
        if fABPColor.y <> clNone then
          FG := fABPColor.y;
        Special := TRUE;
      end;
    cErrorLine: begin
        if fErrColor.x <> clNone then
          BG := fErrColor.x;
        if fErrColor.y <> clNone then
          FG := fErrColor.y;
        Special := TRUE;
      end;
  end;
end;

procedure TEditorOptForm.cbLineNumClick(Sender: TObject);
begin
  cbLeadZero.Enabled := cbLineNum.Checked;
  cbFirstZero.Enabled := cbLineNum.Checked;
end;

procedure TEditorOptForm.cbSyntaxHighlightClick(Sender: TObject);
begin
  edSyntaxExt.Enabled := cbSyntaxHighlight.Checked;
end;



procedure TEditorOptForm.cbUseCodeFoldClick(Sender: TObject);
begin
  cbClickCodeFold.Enabled := cbUseCodeFold.Checked;
end;

procedure TEditorOptForm.cboQuickColorSelect(Sender: TObject);
var
  offset: integer;
  i: integer;
  attr: TSynHighlighterAttributes;
begin
  if cboQuickColor.ItemIndex > 10 then begin // 10 == number of built-in styles
    // custom style; load from disk
    LoadSyntax(cboQuickColor.Items[cboQuickColor.ItemIndex]);
  end else begin  //built-in styles

    offset := cboQuickColor.ItemIndex * 1000;  //string index in "DefaultFiles.rc"
    for i := 0 to pred(cpp.AttrCount) do begin
      attr := TSynHighlighterAttributes.Create(cpp.Attribute[i].Name);
      try
        StrtoAttr(Attr, LoadStr(i + offset + 1));
        cpp.Attribute[i].Assign(Attr);
      finally
        Attr.Free;
      end;
    end;

    StrtoPoint(fBPColor, LoadStr(offset + 17)); // breakpoints
    StrtoPoint(fErrColor, LoadStr(offset + 18)); // error line
    StrtoPoint(fABPColor, LoadStr(offset + 19)); // active breakpoint
    StrtoPoint(fgutColor, LoadStr(offset + 20)); // gutter
    StrtoPoint(fSelColor, LoadStr(offset + 21)); // selected text
    StrtoPoint(fFoldColor, LoadStr(offset + 22)); // folding bar lines
    StrtoPoint(fCurColor, LoadStr(offset + 23)); // Current line
  end;

  SetGutter;
  cppEdit.Repaint;
  ElementListClick(nil);
end;

{ ---------- Code insert methods ---------- }

procedure TEditorOptForm.btnAddClick(Sender: TObject);
begin
  CodeIns.ClearAll; // clear example editor

  lvCodeIns.RowCount := lvCodeIns.RowCount + 1; // add blank row, assume fixedrows remains at 1

  // Fill
  lvCodeIns.Objects[0, lvCodeIns.RowCount - 1] := TStringList.Create;
  lvCodeIns.Cells[0, lvCodeIns.RowCount - 1] := '';
  lvCodeIns.Cells[1, lvCodeIns.RowCount - 1] := '';
  lvCodeIns.Cells[2, lvCodeIns.RowCount - 1] := '';

  lvCodeIns.Row := lvCodeIns.RowCount - 1; // set selection
  lvCodeIns.Col := 0; // set selection
  lvCodeIns.SetFocus;

  UpdateCIButtons;
end;

procedure TEditorOptForm.btnRemoveClick(Sender: TObject);
var
  I: integer;
  sl: TStringList;
begin
  if (lvCodeIns.Row >= lvCodeIns.FixedRows) then begin
    if (lvCodeIns.RowCount > 2) then begin // remove completely
      dmMain.CodeInserts.Delete(lvCodeIns.Row);

      // Delete object containing text too
      TStringList(lvCodeIns.Objects[0, lvCodeIns.Row]).Free;
      lvCodeIns.Objects[0, lvCodeIns.Row] := nil;

      for I := lvCodeIns.Row to lvCodeins.RowCount - 2 do
        lvCodeIns.Rows[i].Assign(lvCodeIns.Rows[i + 1]); // moves objects too

      lvCodeIns.RowCount := lvCodeIns.RowCount - 1;
    end else begin // leave blank row
      sl := TStringList(lvCodeIns.Objects[0, lvCodeIns.Row]); // leave blank data
      sl.Clear;
      lvCodeIns.Rows[lvCodeIns.RowCount - 1].Text := ''; // removes data pointer
      lvCodeIns.Objects[0, lvCodeIns.Row] := sl;
    end;

    lvCodeIns.Repaint;
    CodeIns.ClearAll;
    UpdateCIButtons;
  end;
end;

procedure TEditorOptForm.UpdateCIButtons;
begin
  btnAdd.Enabled := true;
  btnRemove.Enabled := lvCodeIns.Row > 0;
end;

procedure TEditorOptForm.lvCodeInsSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  CodeIns.ClearAll;
  if (lvCodeIns.Row >= lvCodeIns.FixedRows) then begin
    CodeIns.Text := StrToCodeIns(TStringList(lvCodeIns.Objects[0, ARow]).Text); // store code in first column object
    UpdateCIButtons;
  end;
end;

procedure TEditorOptForm.CodeInsStatusChange(Sender: TObject; Changes: TSynStatusChanges);
begin
  if (lvCodeIns.Row >= lvCodeIns.FixedRows) then begin
    if (scModified in Changes) then begin
      TStringList(lvCodeIns.Objects[0, lvCodeIns.Row]).Text := CodeInstoStr(CodeIns.Text); // store text in hidden field
      CodeIns.Modified := false;
    end;
  end;
end;

procedure TEditorOptForm.LoadCodeIns;
var
  ins: PCodeIns;
  I: integer;
  sl: TStringList;
  canselect: boolean;
begin
  lvCodeIns.FixedRows := 0;
  lvCodeIns.RowCount := 1; // re-add fixed row later on

  for I := 0 to dmMain.CodeInserts.Count - 1 do begin
    lvCodeIns.RowCount := lvCodeIns.RowCount + 1; // add new blank row

    // Don't forget to delete!
    sl := TStringList.Create;

    // Fill cols
    ins := dmMain.CodeInserts[I];
    sl.Text := ins^.Line;
    lvCodeIns.Objects[0, lvCodeIns.RowCount - 1] := sl;
    lvCodeIns.Cells[0, lvCodeIns.RowCount - 1] := ins^.Caption;
    lvCodeIns.Cells[1, lvCodeIns.RowCount - 1] := IntToStr(ins^.Sep);
    lvCodeIns.Cells[2, lvCodeIns.RowCount - 1] := ins^.Desc;
  end;

  // Add empty, but configured row
  if lvCodeIns.RowCount = 1 then begin
    lvCodeIns.RowCount := lvCodeIns.RowCount + 1;

    // Fill
    lvCodeIns.Objects[0, lvCodeIns.RowCount - 1] := TStringList.Create;
    lvCodeIns.Cells[0, lvCodeIns.RowCount - 1] := '';
    lvCodeIns.Cells[1, lvCodeIns.RowCount - 1] := '';
    lvCodeIns.Cells[2, lvCodeIns.RowCount - 1] := '';
  end;

  lvCodeIns.FixedRows := 1; // gets reset to 0 when removing all editable rows

  lvCodeInsSelectCell(nil, 0, 1, canselect);
end;

procedure TEditorOptForm.SaveCodeIns;
var
  I: integer;
  Item: PCodeIns;
begin
  dmMain.CodeInserts.Clear;
  for I := lvCodeIns.FixedRows to lvCodeIns.RowCount - 1 do begin
    if lvCodeIns.Cells[0, I] <> '' then begin
      Item := new(PCodeIns);

      // Get snippet from attached object
      Item.Caption := lvCodeIns.Cells[0, I];
      Item.Sep := StrToIntDef(lvCodeIns.Cells[1, I], 0);
      Item.Desc := lvCodeIns.Cells[2, I];
      Item.Line := TStringList(lvCodeIns.Objects[0, I]).Text;

      dmMain.CodeInserts.AddItem(Item);
    end;
  end;
  dmMain.CodeInserts.SaveCode;
end;

procedure TEditorOptForm.ClearCodeIns;
var
  I: integer;
begin
  // Clear the code insertion string grid objects
  for I := 1 to lvCodeIns.RowCount - 1 do begin
    if Assigned(lvCodeIns.Objects[0, I]) then begin
      TStringList(lvCodeIns.Objects[0, I]).Free;
      lvCodeIns.Objects[0, I] := nil;
    end;
  end;
end;

{ ---------- Code completion ---------- }

procedure TEditorOptForm.tbCompletionDelayChange(Sender: TObject);
begin
  lblCompletionDelay.Caption := Lang[ID_EOPT_COMPLETIONDELAY] + ' ' + IntToStr(tbCompletionDelay.Position) + ' ms';
end;

procedure TEditorOptForm.chkEnableCompletionClick(Sender: TObject);
begin
  with chkEnableCompletion do begin
    tbCompletionDelay.Enabled := Checked;
    cpCompletionBackground.Enabled := Checked;
    chkCBParseGlobalH.Enabled := Checked;
    chkCBParseLocalH.Enabled := Checked;
  end;
end;

procedure TEditorOptForm.btnSaveSyntaxClick(Sender: TObject);
var
  idx: integer;
  fINI: TIniFile;
  S: String;
  pt: TPoint;
begin
  s := 'New syntax';
  if not InputQuery(Lang[ID_EOPT_SAVESYNTAX], Lang[ID_EOPT_SAVESYNTAXQUESTION], s) or (s = '') then
    Exit;

  fINI := TIniFile.Create(devDirs.Config + s + SYNTAX_EXT);
  try
    for idx := 0 to pred(Cpp.AttrCount) do
      fINI.WriteString('Editor.Custom', Cpp.Attribute[idx].Name, AttrtoStr(Cpp.Attribute[idx]));

    for idx := Cpp.AttrCount to pred(ElementList.Items.Count) do begin
      //if CompareText(ElementList.Items[idx], cSel) = 0 then
      if CompareText(fColorElems[idx], cSel) = 0 then
        pt := fSelColor
      else if CompareText(fColorElems[idx], cBP) = 0 then
        pt := fBPColor
      else if CompareText(fColorElems[idx], cErr) = 0 then
        pt := fErrColor
      else if CompareText(fColorElems[idx], cABP) = 0 then
        pt := fABPColor
      else if CompareText(fColorElems[idx], cGut) = 0 then
        pt := fGutColor
      else if CompareText(fColorElems[idx], cFld) = 0 then
        pt := fFoldColor
      else if CompareText(fColorElems[idx], cCur) = 0 then
        pt := fCurColor;

      fINI.WriteString('Editor.Custom', fColorElems[idx], PointtoStr(pt));
    end;
  finally
    fINI.Free;
  end;
  if cboQuickColor.Items.IndexOf(S) = -1 then
    cboQuickColor.Items.Add(S);
  cboQuickColor.ItemIndex := cboQuickColor.Items.IndexOf(S);
end;

procedure TEditorOptForm.LoadSyntax(const Value: String);
var
  idx: integer;
  fINI: TIniFile;
  Attr: TSynHighlighterAttributes;
  pt: TPoint;
begin
  fINI := TIniFile.Create(devDirs.Config + Value + SYNTAX_EXT);
  try
    for idx := 0 to pred(Cpp.AttrCount) do begin
      Attr := TSynHighlighterAttributes.Create(Cpp.Attribute[idx].Name);
      try
        StrToAttr(Attr, fINI.ReadString('Editor.Custom', Cpp.Attribute[idx].Name,
          devEditor.Syntax.Values[Cpp.Attribute[idx].Name]));
        Cpp.Attribute[idx].Assign(Attr);
      finally
        Attr.Free;
      end;
    end;

    for idx := Cpp.AttrCount to pred(ElementList.Items.Count) do begin
      StrToPoint(pt, fINI.ReadString('Editor.Custom', ElementList.Items[idx], PointToStr(Point(clNone, clNone))));
      if CompareText(ElementList.Items[idx], cSel) = 0 then
        fSelColor := pt
      else if CompareText(ElementList.Items[idx], cCur) = 0 then
        fCurColor := pt
      else if CompareText(ElementList.Items[idx], cBP) = 0 then
        fBPColor := pt
      else if CompareText(ElementList.Items[idx], cErr) = 0 then
        fErrColor := pt
      else if CompareText(ElementList.Items[idx], cABP) = 0 then
        fABPColor := pt
      else if CompareText(ElementList.Items[idx], cGut) = 0 then begin
        fGutColor := pt;
        SetGutter;
      end else if CompareText(ElementList.Items[idx], cFld) = 0 then begin
        fFoldColor := pt;
        SetGutter;
      end;
    end;
  finally
    fINI.Free;
  end;
  ElementListClick(nil);
end;

procedure TEditorOptForm.FillSyntaxSets;
var
  SR: TSearchRec;
begin
  if FindFirst(devDirs.Config + '*' + SYNTAX_EXT, faAnyFile, SR) = 0 then
    repeat
      cboQuickColor.Items.Add(StringReplace(SR.Name, SYNTAX_EXT, '', [rfIgnoreCase]));
    until FindNext(SR) <> 0;
end;

procedure TEditorOptForm.OnGutterClick(Sender: TObject; Button: TMouseButton; X, Y, Line: Integer; Mark: TSynEditMark);
var
  idx: integer;
begin
  idx := ElementList.Items.IndexOf(cGut);
  if idx <> -1 then begin
    ElementList.ItemIndex := idx;
    ElementListClick(Self);
  end;
end;


procedure TEditorOptForm.cbAutoSaveClick(Sender: TObject);
begin
  MinutesDelay.Enabled := cbAutoSave.Checked;
  SaveInterval.Enabled := cbAutoSave.Checked;
  FileOptions.Enabled := cbAutoSave.Checked;
  OptionsGroup.Enabled := cbAutoSave.Checked;
  NameOptions.Enabled := cbAutoSave.Checked;
  lblTimeStampExample.Enabled := cbAutoSave.Checked;
end;

procedure TEditorOptForm.MinutesDelayChange(Sender: TObject);
begin
  if MinutesDelay.Position = 1 then
    SaveInterval.Caption := Lang[ID_EOPT_AUTOSAVEINTERNAL] + ' ' + IntToStr(MinutesDelay.Position) + ' minute'
  else
    SaveInterval.Caption := Lang[ID_EOPT_AUTOSAVEINTERNAL] + ' ' + IntToStr(MinutesDelay.Position) + ' minutes';
end;

procedure TEditorOptForm.cbSymbolCompleteClick(Sender: TObject);
begin
  cbArray.Enabled := cbSymbolComplete.Checked;
  cbBraces.Enabled := cbSymbolComplete.Checked;
  cbComments.Enabled := cbSymbolComplete.Checked;
  cbInclude.Enabled := cbSymbolComplete.Checked;
  cbParenth.Enabled := cbSymbolComplete.Checked;
  cbSingleQuotes.Enabled := cbSymbolComplete.Checked;
  cbDoubleQuotes.Enabled := cbSymbolComplete.Checked;
  cbDeleteCompleted.Enabled := cbSymbolComplete.Checked;
end;

procedure TEditorOptForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClearCodeIns;
  // Our caller needs the form, so let it call Free instead
  action := caHide;
end;


procedure TEditorOptForm.PagesMainChange(Sender: TObject);
begin
  case PagesMain.ActivePageIndex of
    0:
      AccessedTabs := AccessedTabs + [taGeneral];
    1:
      AccessedTabs := AccessedTabs + [taFonts];
    2:
      AccessedTabs := AccessedTabs + [taColors];
    3:
      AccessedTabs := AccessedTabs + [taSnippets];
    4:
      AccessedTabs := AccessedTabs + [taCompletion];
    5:
      AccessedTabs := AccessedTabs + [taAutosave];
  end;
end;

procedure TEditorOptForm.NameOptionsClick(Sender: TObject);
begin
  case NameOptions.ItemIndex of
    0: begin
        lblTimeStampExample.Caption := Format(Lang[ID_EOPT_AUTOSAVEEXAMPLE],
          ['main.cpp']);
      end;
    1: begin
        lblTimeStampExample.Caption := Format(Lang[ID_EOPT_AUTOSAVEEXAMPLE],
          [ChangeFileExt('main.cpp', '.' + IntToStr(DateTimeToUnix(Now)) + ExtractFileExt('main.cpp'))]);
      end;
    2: begin
        lblTimeStampExample.Caption := Format(Lang[ID_EOPT_AUTOSAVEEXAMPLE],
          [ChangeFileExt('main.cpp', '.' + FormatDateTime('yyyy mm dd hh mm ss', Now) + ExtractFileExt('main.cpp'))]);
      end;
  end;
end;

end.

