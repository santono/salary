object FormSowm: TFormSowm
  Left = 191
  Top = 71
  Width = 666
  Height = 565
  Caption = #1057#1086#1074#1084#1077#1097#1077#1085#1080#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    650
    527)
  PixelsPerInch = 96
  TextHeight = 20
  object StringGrid1: TStringGrid
    Left = 8
    Top = 8
    Width = 640
    Height = 457
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 6
    DefaultRowHeight = 20
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnDrawCell = StringGrid1DrawCell
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      64
      310
      64
      64
      64
      64)
  end
  object ComboBoxFrom: TComboBox
    Left = 8
    Top = 472
    Width = 321
    Height = 28
    Anchors = [akLeft, akBottom]
    ItemHeight = 20
    TabOrder = 1
    Text = 'ComboBoxFrom'
    OnChange = ComboBoxFromChange
  end
  object PopupMenu1: TPopupMenu
    Left = 88
    Top = 80
    object N1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = N2Click
    end
  end
end
