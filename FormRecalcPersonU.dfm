object FormTestRecalcPerson: TFormTestRecalcPerson
  Left = 254
  Top = 198
  Width = 553
  Height = 185
  Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1072' '#1088#1072#1073#1086#1090#1085#1080#1082#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 80
    Top = 8
    Width = 153
    Height = 13
    Caption = #1043#1086#1076' '#1080' '#1084#1077#1089#1103#1094'  '#1076#1083#1103' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1072
  end
  object DateTimePicker1: TDateTimePicker
    Left = 72
    Top = 32
    Width = 186
    Height = 21
    Date = 39279.810144305560000000
    Time = 39279.810144305560000000
    DateFormat = dfLong
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 72
    Width = 177
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 216
    Top = 72
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
end
