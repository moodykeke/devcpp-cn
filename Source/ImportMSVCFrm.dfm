object ImportMSVCForm: TImportMSVCForm
  Left = 915
  Top = 369
  BorderStyle = bsDialog
  Caption = 'Import MS Visual C++(tm) project'
  ClientHeight = 240
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
    Width = 171
    Height = 16
    Caption = 'Select Visual C++ project file:'
  end
  object btnBrowse: TSpeedButton
    Left = 334
    Top = 30
    Width = 23
    Height = 23
    Caption = '...'
    OnClick = btnBrowseClick
  end
  object txtVC: TEdit
    Left = 8
    Top = 30
    Width = 328
    Height = 24
    TabOrder = 0
    Text = 'txtVC'
    OnChange = txtDevChange
  end
  object gbOptions: TGroupBox
    Left = 8
    Top = 64
    Width = 349
    Height = 134
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
      Top = 72
      Width = 153
      Height = 16
      Caption = 'Dev-C++ project filename:'
    end
    object btnBrowseDev: TSpeedButton
      Left = 314
      Top = 99
      Width = 23
      Height = 23
      Caption = '...'
      OnClick = btnBrowseDevClick
    end
    object cmbConf: TComboBox
      Left = 16
      Top = 42
      Width = 321
      Height = 24
      Style = csDropDownList
      TabOrder = 0
    end
    object txtDev: TEdit
      Left = 16
      Top = 94
      Width = 297
      Height = 24
      TabOrder = 1
      Text = 'txtDev'
      OnChange = txtDevChange
    end
  end
  object btnImport: TButton
    Left = 154
    Top = 204
    Width = 75
    Height = 25
    Caption = 'Import'
    Default = True
    TabOrder = 2
    OnClick = btnImportClick
  end
  object btnCancel: TButton
    Left = 261
    Top = 204
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object OpenDialog1: TOpenDialog
    Filter = 'MSVC++ files|*.dsp'
    Left = 212
    Top = 48
  end
  object SaveDialog1: TSaveDialog
    Left = 284
    Top = 124
  end
end
