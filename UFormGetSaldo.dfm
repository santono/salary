object FormGetSaldo: TFormGetSaldo
  Left = 205
  Top = 170
  Width = 696
  Height = 270
  Caption = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090' '#1085#1072#1083#1086#1075#1086#1074' '
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
  object LabelFio: TLabel
    Left = 16
    Top = 8
    Width = 61
    Height = 20
    Caption = 'LabelFio'
  end
  object LabelCnt: TLabel
    Left = 16
    Top = 56
    Width = 64
    Height = 20
    Caption = 'LabelCnt'
  end
  object LabelPdr: TLabel
    Left = 16
    Top = 104
    Width = 63
    Height = 20
    Caption = 'LabelPdr'
  end
  object ProgressBarPrsn: TProgressBar
    Left = 16
    Top = 32
    Width = 657
    Height = 21
    TabOrder = 0
  end
  object ProgressBarPdr: TProgressBar
    Left = 16
    Top = 80
    Width = 657
    Height = 21
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 136
    Width = 185
    Height = 25
    Caption = #1048#1084#1087#1086#1088#1090' '#1089#1072#1083#1100#1076#1086
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 216
    Top = 136
    Width = 193
    Height = 25
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 568
    Top = 136
    Width = 105
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 4
    Kind = bkClose
  end
  object dtWanted: TDateTimePicker
    Left = 16
    Top = 176
    Width = 186
    Height = 28
    Date = 41992.403264872690000000
    Time = 41992.403264872690000000
    DateFormat = dfLong
    TabOrder = 5
  end
end
