object FormRepPlanFondy: TFormRepPlanFondy
  Left = 253
  Top = 275
  Width = 657
  Height = 283
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 20
  object Label2: TLabel
    Left = 16
    Top = 32
    Width = 11
    Height = 20
    Caption = #1042
  end
  object LabelFio: TLabel
    Left = 24
    Top = 176
    Width = 61
    Height = 20
    Caption = 'LabelFio'
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 96
    Width = 185
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1086#1090#1095#1077#1090
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 528
    Top = 64
    Width = 91
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object dtIn: TDateTimePicker
    Left = 32
    Top = 24
    Width = 186
    Height = 28
    Date = 42103.810000277780000000
    Time = 42103.810000277780000000
    DateFormat = dfLong
    TabOrder = 2
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 152
    Width = 609
    Height = 17
    TabOrder = 3
  end
  object cbListToExcel: TCheckBox
    Left = 16
    Top = 64
    Width = 489
    Height = 17
    Caption = #1047#1072#1087#1080#1089#1072#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1074' Excel ('#1076#1083#1103' '#1087#1088#1086#1074#1077#1088#1082#1080' '#1076#1072#1085#1085#1099#1093')'
    TabOrder = 4
  end
end
