object FormImportDayTxt: TFormImportDayTxt
  Left = 220
  Top = 135
  Width = 262
  Height = 132
  Caption = #1048#1084#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1080#1079' Day.txt'
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
    Left = 32
    Top = 16
    Width = 41
    Height = 13
    Caption = #1044#1072#1090#1072' '#1079#1072
  end
  object DateTimePicker1: TDateTimePicker
    Left = 80
    Top = 16
    Width = 145
    Height = 21
    Date = 42914.413187071760000000
    Time = 42914.413187071760000000
    DateFormat = dfLong
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 56
    Width = 121
    Height = 25
    Caption = #1055#1077#1088#1077#1085#1086#1089' '#1076#1072#1085#1085#1099#1093' '#1074' '#1041#1044
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 152
    Top = 56
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
end
