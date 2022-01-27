object FormSetBaseData: TFormSetBaseData
  Left = 287
  Top = 178
  Width = 546
  Height = 476
  Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1073#1072#1079#1086#1074#1099#1093' '#1076#1072#1090' '#1076#1083#1103' '#1088#1072#1079#1088#1103#1076#1086#1074
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
    Left = 8
    Top = 30
    Width = 90
    Height = 20
    Caption = #1053#1086#1074#1072#1103' '#1076#1072#1090#1072
  end
  object Label2: TLabel
    Left = 8
    Top = 64
    Width = 201
    Height = 20
    Caption = #1044#1072#1090#1072' '#1087#1086#1076#1083#1077#1078#1072#1097#1072#1103' '#1079#1072#1084#1077#1085#1077
  end
  object Label3: TLabel
    Left = 16
    Top = 195
    Width = 79
    Height = 20
    Caption = #1057' '#1088#1072#1079#1088#1103#1076#1072
  end
  object Label4: TLabel
    Left = 168
    Top = 192
    Width = 77
    Height = 20
    Caption = #1087#1086' '#1088#1072#1079#1088#1103#1076
  end
  object DateTimePickerNeed: TDateTimePicker
    Left = 216
    Top = 24
    Width = 121
    Height = 28
    Date = 40343.897375208330000000
    Time = 40343.897375208330000000
    TabOrder = 0
  end
  object DateTimePicker1: TDateTimePicker
    Left = 216
    Top = 64
    Width = 121
    Height = 28
    Date = 40343.899062673610000000
    Time = 40343.899062673610000000
    TabOrder = 1
  end
  object RadioGroup1: TRadioGroup
    Left = 32
    Top = 104
    Width = 385
    Height = 73
    Caption = #1056#1077#1078#1080#1084' '#1079#1072#1084#1077#1085#1099
    ItemIndex = 0
    Items.Strings = (
      #1047#1072#1084#1077#1085#1080#1090#1100' '#1089#1090#1072#1088#1091#1102' '#1076#1072#1090#1091
      #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1074#1089#1077#1084', '#1080#1075#1085#1086#1088#1080#1088#1091#1103' '#1089#1090#1072#1088#1091#1102' '#1076#1072#1090#1091)
    TabOrder = 2
  end
  object SpinEditRazrFr: TSpinEdit
    Left = 104
    Top = 192
    Width = 57
    Height = 30
    MaxValue = 25
    MinValue = 1
    TabOrder = 3
    Value = 1
  end
  object SpinEditRazrTo: TSpinEdit
    Left = 256
    Top = 192
    Width = 57
    Height = 30
    MaxValue = 25
    MinValue = 1
    TabOrder = 4
    Value = 5
  end
  object Button1: TButton
    Left = 24
    Top = 304
    Width = 369
    Height = 25
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081', '#1082#1072#1090#1077#1075#1086#1088#1080#1081', '#1089#1095#1077#1090#1086#1074
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 24
    Top = 336
    Width = 369
    Height = 25
    Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1073#1072#1079#1086#1074#1091#1102' '#1076#1072#1090#1091' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080
    Enabled = False
    TabOrder = 6
    OnClick = Button2Click
  end
  object ProgressBar1: TProgressBar
    Left = 24
    Top = 368
    Width = 369
    Height = 21
    TabOrder = 7
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 400
    Width = 369
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 8
    Kind = bkClose
  end
  object RadioGroupNadb: TRadioGroup
    Left = 32
    Top = 232
    Width = 177
    Height = 65
    Caption = #1053#1072#1076#1073#1072#1074#1082#1080
    ItemIndex = 0
    Items.Strings = (
      #1089' '#1085#1072#1076#1073#1072#1074#1082#1072#1084#1080
      #1073#1077#1079' '#1085#1072#1076#1073#1072#1074#1086#1082)
    TabOrder = 9
  end
  object cbLeaveNewer: TCheckBox
    Left = 232
    Top = 248
    Width = 193
    Height = 17
    Caption = #1054#1089#1090#1072#1074#1080#1090#1100' '#1073#1086#1083#1077#1077' '#1085#1086#1074#1099#1077
    TabOrder = 10
  end
  object BitBtn2: TBitBtn
    Left = 480
    Top = 368
    Width = 75
    Height = 25
    Caption = 'BitBtn2'
    TabOrder = 11
  end
  object BitBtn3: TBitBtn
    Left = 232
    Top = 272
    Width = 281
    Height = 25
    Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1073#1072#1079#1086#1074#1091#1102' '#1076#1072#1090#1091' '#1074' 2021 12'
    TabOrder = 12
    OnClick = BitBtn3Click
  end
end
