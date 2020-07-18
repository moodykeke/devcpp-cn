object PrintForm: TPrintForm
  Left = 623
  Top = 463
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Print file'
  ClientHeight = 249
  ClientWidth = 432
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
  PixelsPerInch = 96
  TextHeight = 17
  object btnCancel: TBitBtn
    Left = 333
    Top = 217
    Width = 75
    Height = 24
    Caption = '&Cancel'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
  end
  object btnOk: TBitBtn
    Left = 244
    Top = 217
    Width = 75
    Height = 24
    Caption = '&OK'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 0
  end
  object grpParams: TGroupBox
    Left = 8
    Top = 8
    Width = 417
    Height = 104
    Caption = 'Parameters : '
    TabOrder = 2
    object cbColors: TCheckBox
      Left = 13
      Top = 25
      Width = 145
      Height = 17
      Caption = '&Colors'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object cbHighlight: TCheckBox
      Left = 13
      Top = 48
      Width = 153
      Height = 17
      Caption = '&Highlight'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object rbLN: TRadioButton
      Left = 188
      Top = 25
      Width = 200
      Height = 17
      Caption = 'Print line numbers'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
    object rbLNMargin: TRadioButton
      Left = 188
      Top = 48
      Width = 229
      Height = 17
      Caption = 'Print line numbers in margin'
      TabOrder = 3
    end
    object cbWordWrap: TCheckBox
      Left = 13
      Top = 71
      Width = 161
      Height = 17
      Caption = '&Word wrap'
      TabOrder = 4
    end
    object rbNoLN: TRadioButton
      Left = 188
      Top = 71
      Width = 200
      Height = 17
      Caption = 'Don'#39't print line numbers'
      TabOrder = 5
    end
  end
  object grpPages: TGroupBox
    Left = 8
    Top = 118
    Width = 417
    Height = 76
    Caption = 'Pages :'
    TabOrder = 3
    object lblCopies: TLabel
      Left = 8
      Top = 20
      Width = 113
      Height = 17
      Caption = 'Number of copies :'
    end
    object seCopies: TSpinEdit
      Left = 16
      Top = 40
      Width = 75
      Height = 27
      MaxValue = 10000000
      MinValue = 1
      TabOrder = 0
      Value = 1
    end
    object cbSelection: TCheckBox
      Left = 152
      Top = 20
      Width = 200
      Height = 17
      Caption = 'Print &selection only'
      TabOrder = 1
    end
  end
end
