object FormRList: TFormRList
  Left = 192
  Top = 172
  Width = 420
  Height = 172
  Caption = #1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1083#1080#1089#1090#1086#1082
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
  object Label1: TLabel
    Left = 48
    Top = 32
    Width = 39
    Height = 20
    Caption = #1044#1072#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 8
    Width = 38
    Height = 20
    Caption = #1060#1048#1054
  end
  object DateTimePickerRList: TDateTimePicker
    Left = 96
    Top = 32
    Width = 186
    Height = 28
    Hint = #1044#1072#1090#1072' '#1076#1083#1103' '#1075#1077#1085#1077#1088#1072#1094#1080#1080' '#1088#1072#1089#1095#1077#1090#1085#1086#1075#1086' '#1083#1080#1089#1090#1082#1072
    Date = 38858.544565231480000000
    Time = 38858.544565231480000000
    DateFormat = dfLong
    MaxDate = 44196.000000000000000000
    MinDate = 33239.000000000000000000
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 96
    Width = 145
    Height = 25
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1083#1080#1089#1090#1086#1082
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 176
    Top = 96
    Width = 97
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object cbDopPodr: TCheckBox
    Left = 72
    Top = 64
    Width = 313
    Height = 17
    Caption = #1042#1082#1083#1102#1095#1072#1090#1100' '#1076#1086#1087#1086#1083#1085#1080#1090'. '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
    TabOrder = 3
  end
end
