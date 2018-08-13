object FormRepAUP_PPS: TFormRepAUP_PPS
  Left = 253
  Top = 275
  Width = 657
  Height = 283
  Caption = #1057#1087#1080#1089#1086#1082' '#1088#1072#1073#1086#1090#1085#1080#1082#1086#1074' '#1087#1086' '#1086#1089#1085#1086#1074#1085#1086#1081' '#1076#1086#1083#1078#1085#1086#1089#1090#1080
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
  object rgSort: TRadioGroup
    Left = 16
    Top = 104
    Width = 617
    Height = 41
    Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086
    Columns = 4
    Items.Strings = (
      #1072#1083#1092#1072#1074#1080#1090#1091
      #1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103#1084
      #1076#1086#1083#1078#1085#1086#1089#1090#1103#1084
      #1089#1095#1077#1090#1072#1084)
    TabOrder = 3
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 152
    Width = 609
    Height = 17
    TabOrder = 4
  end
end
