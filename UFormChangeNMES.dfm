object FormChangeNMES: TFormChangeNMES
  Left = 215
  Top = 124
  Width = 460
  Height = 171
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1079#1072#1088#1087#1083#1072#1090#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 40
    Width = 168
    Height = 13
    Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1088#1072#1073#1086#1095#1080#1081' '#1084#1077#1089#1103#1094' '#1080' '#1075#1086#1076
  end
  object dtNMES: TDateTimePicker
    Left = 200
    Top = 40
    Width = 145
    Height = 21
    Date = 42922.868938055560000000
    Time = 42922.868938055560000000
    DateFormat = dfLong
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 88
    Width = 75
    Height = 25
    Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 120
    Top = 88
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
end
