object FormListVypl: TFormListVypl
  Left = 192
  Top = 142
  Width = 470
  Height = 231
  Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103' '#1089#1087#1080#1089#1082#1072' '#1074#1099#1087#1083#1072#1090
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 11
    Height = 20
    Caption = #1057
  end
  object Label2: TLabel
    Left = 232
    Top = 8
    Width = 18
    Height = 20
    Caption = #1087#1086
  end
  object DateTimePickerFr: TDateTimePicker
    Left = 40
    Top = 8
    Width = 186
    Height = 28
    Date = 39250.816300810180000000
    Time = 39250.816300810180000000
    DateFormat = dfLong
    MaxDate = 40544.000000000000000000
    MinDate = 33239.000000000000000000
    TabOrder = 0
  end
  object DateTimePickerTo: TDateTimePicker
    Left = 256
    Top = 8
    Width = 186
    Height = 28
    Date = 39250.818008171300000000
    Time = 39250.818008171300000000
    DateFormat = dfLong
    MaxDate = 40544.000000000000000000
    MinDate = 33239.000000000000000000
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 48
    Width = 433
    Height = 25
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081', '#1082#1072#1090#1077#1075#1086#1088#1080#1081' '#1080' '#1089#1095#1077#1090#1086#1074
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 16
    Top = 152
    Width = 89
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 3
    Kind = bkClose
  end
  object BitBtn4: TBitBtn
    Left = 16
    Top = 88
    Width = 433
    Height = 25
    Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103' '#1089#1087#1080#1089#1082#1072' '#1074#1099#1087#1083#1072#1090' ('#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' SQL)'
    TabOrder = 4
    OnClick = BitBtn4Click
  end
  object BitBtn3: TBitBtn
    Left = 16
    Top = 120
    Width = 433
    Height = 25
    Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103' '#1089#1087#1080#1089#1082#1072' '#1074#1099#1087#1083#1072#1090' ('#1091#1076#1077#1088#1078#1072#1085#1080#1103' DOS)'
    TabOrder = 5
    OnClick = BitBtn3Click
  end
end
