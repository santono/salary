object FormRepFondy: TFormRepFondy
  Left = 253
  Top = 275
  Width = 657
  Height = 283
  Caption = #1057#1074#1086#1076' '#1087#1086' '#1092#1086#1085#1076#1072#1084' '#1076#1083#1103' '#1087#1083#1072#1085#1086#1074#1086#1075#1086' '#1086#1090#1076#1077#1083#1072
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
  object BitBtn1: TBitBtn
    Left = 16
    Top = 64
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
end
