object FormRecalcPPSZ: TFormRecalcPPSZ
  Left = 206
  Top = 237
  Width = 696
  Height = 347
  Caption = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090' '#1074#1089#1077#1093' '#1085#1072#1083#1086#1075#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 20
  object GaugePodr: TGauge
    Left = 24
    Top = 32
    Width = 649
    Height = 25
    Color = clLime
    ParentColor = False
    Progress = 0
  end
  object GaugePerson: TGauge
    Left = 24
    Top = 96
    Width = 649
    Height = 25
    Color = clAqua
    ParentColor = False
    Progress = 0
  end
  object LabelPodr: TLabel
    Left = 24
    Top = 8
    Width = 72
    Height = 20
    Caption = 'LabelPodr'
  end
  object LabelPerson: TLabel
    Left = 24
    Top = 72
    Width = 89
    Height = 20
    Caption = 'LabelPerson'
  end
  object LabelTimer: TLabel
    Left = 408
    Top = 72
    Width = 78
    Height = 20
    Caption = 'LabelTimer'
  end
  object Label1: TLabel
    Left = 24
    Top = 184
    Width = 11
    Height = 20
    Caption = 'C'
  end
  object Label2: TLabel
    Left = 248
    Top = 184
    Width = 18
    Height = 20
    Caption = #1087#1086
  end
  object BitBtn1: TBitBtn
    Left = 600
    Top = 136
    Width = 75
    Height = 25
    TabOrder = 0
    Kind = bkClose
  end
  object BitBtn2: TBitBtn
    Left = 24
    Top = 136
    Width = 177
    Height = 25
    Caption = #1053#1072#1095#1072#1090#1100' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 216
    Top = 136
    Width = 185
    Height = 25
    Hint = #1059#1082#1072#1078#1080#1090#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103' '#1076#1083#1103' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1086#1074
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = BitBtn3Click
  end
  object DateTimePickerFr: TDateTimePicker
    Left = 48
    Top = 176
    Width = 186
    Height = 28
    Hint = #1055#1077#1088#1074#1099#1081' '#1084#1077#1089#1103#1094' '#1076#1083#1103' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1072' ('#1076#1077#1085#1100' '#1085#1077' '#1080#1084#1077#1077#1090' '#1079#1085#1072#1095#1077#1085#1080#1103') '
    Date = 38865.788110324070000000
    Time = 38865.788110324070000000
    DateFormat = dfLong
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object DateTimePickerTo: TDateTimePicker
    Left = 272
    Top = 176
    Width = 186
    Height = 28
    Hint = #1055#1086#1089#1083#1077#1076#1085#1080#1081' '#1084#1077#1089#1103#1094' '#1076#1083#1103' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1072' ('#1076#1077#1085#1100' '#1085#1077' '#1080#1084#1077#1077#1090' '#1079#1085#1072#1095#1077#1085#1080#1103')'
    Date = 38865.789364490740000000
    Time = 38865.789364490740000000
    DateFormat = dfLong
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object CheckBoxPodoh: TCheckBox
    Left = 480
    Top = 176
    Width = 177
    Height = 17
    Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1077' '#1076#1083#1103' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1072' '#1087#1086#1076#1086#1093#1086#1076#1085#1086#1075#1086' '#1085#1072#1083#1086#1075#1072
    Caption = #1055#1086#1076#1086#1093#1086#1076#1085#1099#1081' '#1085#1072#1083#1086#1075
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object CheckBoxPens: TCheckBox
    Left = 480
    Top = 200
    Width = 185
    Height = 17
    Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1077' '#1076#1083#1103' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1072' '#1087#1077#1085#1089#1080#1086#1085#1085#1086#1075#1086' '#1085#1072#1083#1086#1075#1072
    Caption = #1055#1077#1085#1089#1080#1086#1085#1085#1099#1081' '#1085#1072#1083#1086#1075
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object CheckBoxSS: TCheckBox
    Left = 480
    Top = 224
    Width = 97
    Height = 17
    Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1077' '#1076#1083#1103' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1072' '#1089#1086#1094'.'#1089#1090#1088#1072#1093#1072
    Caption = #1057#1086#1094'.'#1089#1090#1088#1072#1093
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object CheckBoxFZ: TCheckBox
    Left = 480
    Top = 248
    Width = 185
    Height = 17
    Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1077' '#1076#1083#1103' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1072' '#1092#1086#1085#1076#1072' '#1079#1072#1085#1103#1090#1086#1089#1090#1080
    Caption = #1060#1086#1085#1076' '#1079#1072#1085#1103#1090#1086#1089#1090#1080
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
  end
  object CheckBoxECB: TCheckBox
    Left = 480
    Top = 272
    Width = 193
    Height = 17
    Caption = #1045#1057#1042
    TabOrder = 9
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 440
    Top = 64
  end
end
