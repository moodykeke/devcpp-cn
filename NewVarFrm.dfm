object NewVarForm: TNewVarForm
  Left = 1171
  Top = 586
  BorderStyle = bsDialog
  Caption = 'New variable'
  ClientHeight = 406
  ClientWidth = 444
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object lblType: TLabel
    Left = 8
    Top = 12
    Width = 71
    Height = 16
    Caption = 'Return type:'
  end
  object lblName: TLabel
    Left = 8
    Top = 36
    Width = 91
    Height = 16
    Caption = 'Variable name:'
  end
  object lblImplementIn: TLabel
    Left = 8
    Top = 60
    Width = 78
    Height = 16
    Caption = 'Implement in:'
  end
  object rgScope: TRadioGroup
    Left = 8
    Top = 88
    Width = 425
    Height = 57
    Caption = 'Access scope'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Private'
      'Protected'
      'Public')
    TabOrder = 3
  end
  object txtType: TEdit
    Left = 105
    Top = 8
    Width = 331
    Height = 24
    TabOrder = 0
    OnChange = txtTypeChange
  end
  object txtName: TEdit
    Left = 105
    Top = 32
    Width = 331
    Height = 24
    TabOrder = 1
    OnChange = txtTypeChange
  end
  object btnCreate: TButton
    Left = 226
    Top = 367
    Width = 75
    Height = 25
    Caption = 'Create'
    Default = True
    ModalResult = 1
    TabOrder = 4
    OnClick = btnCreateClick
  end
  object btnCancel: TButton
    Left = 339
    Top = 367
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
  end
  object cmbClass: TComboBox
    Left = 105
    Top = 56
    Width = 331
    Height = 24
    AutoDropDown = True
    Sorted = True
    TabOrder = 2
    Items.Strings = (
      'bool'
      'double'
      'float'
      'int'
      'void')
  end
  object grpReadFunc: TGroupBox
    Left = 8
    Top = 176
    Width = 425
    Height = 70
    TabOrder = 6
    object Label3: TLabel
      Left = 8
      Top = 22
      Width = 40
      Height = 16
      Alignment = taRightJustify
      Caption = 'Name:'
    end
    object chkInlineR: TCheckBox
      Left = 8
      Top = 44
      Width = 53
      Height = 17
      Caption = 'Inline'
      Enabled = False
      TabOrder = 0
    end
    object txtReadFunc: TEdit
      Left = 97
      Top = 16
      Width = 320
      Height = 24
      TabOrder = 1
      OnChange = txtTypeChange
      OnKeyUp = txtReadFuncKeyUp
    end
  end
  object grpWriteFunc: TGroupBox
    Left = 8
    Top = 284
    Width = 425
    Height = 77
    TabOrder = 7
    object Label4: TLabel
      Left = 8
      Top = 22
      Width = 40
      Height = 16
      Alignment = taRightJustify
      Caption = 'Name:'
    end
    object chkInlineW: TCheckBox
      Left = 8
      Top = 44
      Width = 53
      Height = 17
      Caption = 'Inline'
      Enabled = False
      TabOrder = 0
    end
    object txtWriteFunc: TEdit
      Left = 97
      Top = 16
      Width = 320
      Height = 24
      TabOrder = 1
      OnChange = txtTypeChange
      OnKeyUp = txtWriteFuncKeyUp
    end
  end
  object chkReadFunc: TCheckBox
    Left = 16
    Top = 151
    Width = 333
    Height = 17
    Caption = 'Create member function to read from this variable'
    TabOrder = 8
    OnClick = chkReadFuncClick
  end
  object chkWriteFunc: TCheckBox
    Left = 16
    Top = 261
    Width = 333
    Height = 17
    Caption = 'Create member function to write to this variable'
    TabOrder = 9
    OnClick = chkWriteFuncClick
  end
end
