object ProcessListForm: TProcessListForm
  Left = 511
  Top = 339
  BorderIcons = []
  Caption = 'Attach to process'
  ClientHeight = 97
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 17
  object MainLabel: TLabel
    Left = 16
    Top = 8
    Width = 184
    Height = 17
    Caption = 'Attach to the following process:'
  end
  object OKBtn: TBitBtn
    Left = 246
    Top = 64
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 0
  end
  object CancelBtn: TBitBtn
    Left = 326
    Top = 64
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
  end
  object ProcessCombo: TComboBox
    Left = 16
    Top = 32
    Width = 385
    Height = 25
    Style = csDropDownList
    TabOrder = 2
  end
end
