object FormMakeNORASCHS: TFormMakeNORASCHS
  Left = 276
  Top = 235
  Width = 696
  Height = 162
  Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1092#1072#1081#1083#1072' '#1076#1083#1103' '#1080#1084#1087#1086#1088#1090#1072' '#1074' '#1076#1088#1091#1075#1091#1102' '#1087#1088#1086#1075#1088#1072#1084#1084#1091' '
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
    Left = 24
    Top = 40
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 328
    Top = 48
    Width = 194
    Height = 13
    Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1081' '#1084#1077#1089#1103#1094' '#1086#1090#1095#1077#1090#1085#1086#1075#1086' '#1082#1074#1072#1088#1090#1072#1083#1072
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 16
    Width = 649
    Height = 17
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 72
    Width = 185
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1092#1072#1081#1083' '#1076#1083#1103' '#1087#1077#1088#1077#1085#1086#1089#1072
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 208
    Top = 72
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object dtWanted: TDateTimePicker
    Left = 336
    Top = 64
    Width = 186
    Height = 21
    Date = 45073.540729421290000000
    Time = 45073.540729421290000000
    DateFormat = dfLong
    TabOrder = 3
  end
end
