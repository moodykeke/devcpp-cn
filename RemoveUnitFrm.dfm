object RemoveUnitForm: TRemoveUnitForm
  Left = 687
  Top = 393
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Remove from project'
  ClientHeight = 283
  ClientWidth = 338
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    338
    283)
  PixelsPerInch = 96
  TextHeight = 16
  object UnitList: TListBox
    Left = 0
    Top = 0
    Width = 338
    Height = 244
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    MultiSelect = True
    TabOrder = 0
    OnKeyPress = UnitListKeyPress
  end
  object DelBtn: TButton
    Left = 132
    Top = 250
    Width = 75
    Height = 25
    Anchors = [akBottom]
    Caption = 'Delete'
    TabOrder = 1
    OnClick = DelBtnClick
  end
end
