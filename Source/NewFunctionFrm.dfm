object NewFunctionForm: TNewFunctionForm
  Left = 297
  Top = 417
  BorderStyle = bsDialog
  Caption = 'New member function'
  ClientHeight = 283
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
  object lblReturnType: TLabel
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
  object lblArguments: TLabel
    Left = 8
    Top = 58
    Width = 67
    Height = 16
    Caption = 'Arguments:'
  end
  object lblImplementIn: TLabel
    Left = 8
    Top = 88
    Width = 78
    Height = 16
    Caption = 'Implement in:'
  end
  object rgScope: TRadioGroup
    Left = 8
    Top = 112
    Width = 137
    Height = 97
    Caption = 'Access scope'
    ItemIndex = 2
    Items.Strings = (
      'Private'
      'Protected'
      'Public')
    TabOrder = 4
  end
  object txtType: TEdit
    Left = 105
    Top = 6
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
  object txtArguments: TEdit
    Left = 105
    Top = 58
    Width = 331
    Height = 24
    TabOrder = 2
  end
  object btnCreate: TButton
    Left = 214
    Top = 250
    Width = 75
    Height = 25
    Caption = 'Create'
    Default = True
    ModalResult = 1
    TabOrder = 7
    OnClick = btnCreateClick
  end
  object btnCancel: TButton
    Left = 347
    Top = 250
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 8
  end
  object cmbClass: TComboBox
    Left = 105
    Top = 86
    Width = 331
    Height = 24
    AutoDropDown = True
    Sorted = True
    TabOrder = 3
    Items.Strings = (
      'bool'
      'double'
      'float'
      'int'
      'void')
  end
  object chkToDo: TCheckBox
    Left = 12
    Top = 216
    Width = 421
    Height = 17
    Caption = 'Add TODO item'
    Checked = True
    State = cbChecked
    TabOrder = 6
  end
  object grpAttr: TGroupBox
    Left = 160
    Top = 113
    Width = 209
    Height = 97
    Caption = 'Attributes'
    TabOrder = 5
    object chkStatic: TCheckBox
      Left = 12
      Top = 20
      Width = 157
      Height = 17
      Caption = 'Static'
      TabOrder = 0
      OnClick = chkStaticClick
    end
    object chkVirtual: TCheckBox
      Left = 12
      Top = 44
      Width = 69
      Height = 17
      Caption = 'Virtual'
      TabOrder = 1
      OnClick = chkStaticClick
    end
    object chkPure: TCheckBox
      Left = 96
      Top = 44
      Width = 57
      Height = 17
      Caption = 'Pure'
      TabOrder = 2
      OnClick = chkStaticClick
    end
    object chkInline: TCheckBox
      Left = 12
      Top = 68
      Width = 157
      Height = 17
      Caption = 'Inline'
      TabOrder = 3
      OnClick = chkStaticClick
    end
  end
end
