object GotoLineForm: TGotoLineForm
  Left = 587
  Top = 624
  ActiveControl = Line
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Go to line...'
  ClientHeight = 44
  ClientWidth = 279
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 17
  object GotoLabel: TLabel
    Left = 11
    Top = 12
    Width = 113
    Height = 17
    Caption = 'Go to line number :'
  end
  object Line: TSpinEdit
    Left = 130
    Top = 8
    Width = 65
    Height = 27
    MaxValue = 0
    MinValue = 0
    TabOrder = 0
    Value = 1
  end
  object BtnOK: TButton
    Left = 211
    Top = 8
    Width = 60
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
end
