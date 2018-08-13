object FormShifr: TFormShifr
  Left = 192
  Top = 121
  Width = 696
  Height = 498
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 7
    Top = 7
    Width = 546
    Height = 325
    ColCount = 10
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected]
    TabOrder = 0
    ColWidths = (
      64
      234
      30
      27
      28
      28
      31
      30
      24
      25)
  end
  object BitBtn1: TBitBtn
    Left = 423
    Top = 345
    Width = 60
    Height = 20
    TabOrder = 1
    Kind = bkClose
  end
  object BitBtn2: TBitBtn
    Left = 143
    Top = 345
    Width = 61
    Height = 20
    Caption = 'ExporShifr'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
end
