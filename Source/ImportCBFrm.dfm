object ImportCBForm: TImportCBForm
  Left = 572
  Top = 319
  BorderStyle = bsDialog
  Caption = 'Import Code::Blocks project'
  ClientHeight = 243
  ClientWidth = 365
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object lbSelect: TLabel
    Left = 8
    Top = 8
    Width = 188
    Height = 16
    Caption = 'Select Code::Blocks project file:'
  end
  object btnBrowse: TSpeedButton
    Left = 334
    Top = 25
    Width = 23
    Height = 23
    Caption = '...'
    OnClick = btnBrowseClick
  end
  object txtCB: TEdit
    Left = 8
    Top = 27
    Width = 320
    Height = 24
    TabOrder = 0
    Text = 'txtCB'
    OnChange = txtDevChange
  end
  object gbOptions: TGroupBox
    Left = 8
    Top = 72
    Width = 349
    Height = 132
    Caption = '  Import options  '
    TabOrder = 1
    object lbConf: TLabel
      Left = 16
      Top = 20
      Width = 135
      Height = 16
      Caption = 'Configuration to import:'
    end
    object lbDev: TLabel
      Left = 16
      Top = 68
      Width = 153
      Height = 16
      Caption = 'Dev-C++ project filename:'
    end
    object btnBrowseDev: TSpeedButton
      Left = 314
      Top = 91
      Width = 23
      Height = 23
      Caption = '...'
      OnClick = btnBrowseDevClick
    end
    object cmbConf: TComboBox
      Left = 11
      Top = 38
      Width = 321
      Height = 24
      Style = csDropDownList
      TabOrder = 0
    end
    object txtDev: TEdit
      Left = 11
      Top = 90
      Width = 297
      Height = 24
      TabOrder = 1
      Text = 'txtDev'
      OnChange = txtDevChange
    end
  end
  object btnImport: TButton
    Left = 127
    Top = 210
    Width = 75
    Height = 25
    Caption = 'Import'
    Default = True
    TabOrder = 2
    OnClick = btnImportClick
  end
  object btnCancel: TButton
    Left = 246
    Top = 210
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Code::Blocks project files|*.cbp'
    Left = 212
    Top = 48
  end
  object SaveDialog1: TSaveDialog
    Left = 268
    Top = 124
  end
end
