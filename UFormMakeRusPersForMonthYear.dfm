object FormMakeRusPersForMonthYear: TFormMakeRusPersForMonthYear
  Left = 260
  Top = 200
  Width = 696
  Height = 167
  Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1087#1077#1088#1089#1086#1085#1086#1092#1080#1082#1072#1094#1080#1080' '#1079#1072' '#1091#1082#1072#1079#1072#1085#1085#1099#1077' '#1084#1077#1089#1103#1094' '#1080' '#1075#1086#1076
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
    Width = 77
    Height = 13
    Caption = #1052#1077#1089#1103#1094' '#1080' '#1075#1086#1076' '#1079#1072
  end
  object LabelPodr: TLabel
    Left = 8
    Top = 64
    Width = 3
    Height = 13
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 40
    Width = 665
    Height = 17
    TabOrder = 0
  end
  object DateTimePicker1: TDateTimePicker
    Left = 144
    Top = 8
    Width = 186
    Height = 21
    Date = 45203.899468252310000000
    Time = 45203.899468252310000000
    DateFormat = dfLong
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 88
    Width = 145
    Height = 25
    Caption = 'C'#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 2
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 168
    Top = 88
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 3
    Kind = bkClose
  end
end
