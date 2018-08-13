object FormRecalcNalPass: TFormRecalcNalPass
  Left = 205
  Top = 170
  Width = 696
  Height = 289
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
    Caption = #1053#1072#1095#1072#1090#1100' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090
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
  object DateTimePicker1: TDateTimePicker
    Left = 24
    Top = 168
    Width = 186
    Height = 28
    Date = 40812.927223356480000000
    Time = 40812.927223356480000000
    DateFormat = dfLong
    TabOrder = 5
  end
  object CheckBoxBlock: TCheckBox
    Left = 224
    Top = 168
    Width = 353
    Height = 17
    Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1072
    TabOrder = 6
  end
  object cbIndex: TCheckBox
    Left = 224
    Top = 192
    Width = 361
    Height = 17
    Caption = #1058#1086#1083#1100#1082#1086' '#1087#1088#1080' '#1085#1072#1083#1080#1095#1080#1080' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080
    TabOrder = 7
  end
  object cbFullYear: TCheckBox
    Left = 24
    Top = 216
    Width = 193
    Height = 17
    Caption = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090' '#1079#1072' '#1075#1086#1076
    TabOrder = 8
  end
end
