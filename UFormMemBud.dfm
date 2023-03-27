object FormMemBud: TFormMemBud
  Left = 192
  Top = 142
  Width = 706
  Height = 439
  Caption = 'Rows'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object GaugeMem: TGauge
    Left = 16
    Top = 24
    Width = 657
    Height = 25
    ForeColor = clYellow
    Progress = 0
  end
  object LabelPodr: TLabel
    Left = 24
    Top = 0
    Width = 72
    Height = 20
    Caption = 'LabelPodr'
  end
  object LabelFio: TLabel
    Left = 16
    Top = 56
    Width = 61
    Height = 20
    Caption = 'LabelFio'
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 96
    Width = 249
    Height = 33
    Caption = #1041#1102#1076#1078#1077#1090' ('#1091#1085#1080#1074#1077#1088#1089#1080#1090#1077#1090')'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 24
    Top = 144
    Width = 249
    Height = 33
    Caption = #1042#1085#1077' '#1073#1102#1076#1078#1077#1090' ('#1091#1085#1080#1074#1077#1088#1089#1080#1090#1077#1090')'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 24
    Top = 192
    Width = 249
    Height = 33
    Caption = #1050#1086#1083#1077#1076#1078' '#1073#1102#1076#1078#1077#1090
    TabOrder = 2
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 24
    Top = 240
    Width = 249
    Height = 33
    Caption = #1050#1086#1083#1077#1076#1078' '#1074#1085#1077#1073#1102#1076#1078#1077#1090
    TabOrder = 3
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 304
    Top = 96
    Width = 249
    Height = 33
    Caption = #1052#1072#1075#1080#1089#1090#1088#1072#1090#1091#1088#1072' '#1073#1102#1076#1078#1077#1090
    TabOrder = 4
    OnClick = BitBtn5Click
  end
  object BitBtn6: TBitBtn
    Left = 304
    Top = 144
    Width = 249
    Height = 33
    Caption = #1052#1072#1075#1080#1089#1090#1088#1072#1090#1091#1088#1072' '#1074#1085#1077#1073#1102#1076#1078#1077#1090
    TabOrder = 5
    OnClick = BitBtn6Click
  end
  object BitBtn7: TBitBtn
    Left = 304
    Top = 192
    Width = 249
    Height = 33
    Caption = #1043' '#1053
    TabOrder = 6
    OnClick = BitBtn7Click
  end
  object BitBtn8: TBitBtn
    Left = 304
    Top = 240
    Width = 249
    Height = 33
    Caption = #1053' '#1048' '#1057
    TabOrder = 7
    OnClick = BitBtn8Click
  end
  object BitBtn9: TBitBtn
    Left = 304
    Top = 296
    Width = 249
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 8
    Kind = bkClose
  end
  object BitBtn10: TBitBtn
    Left = 24
    Top = 288
    Width = 249
    Height = 33
    Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1100#1085#1072#1103' '#1087#1086#1084#1086#1097#1100
    TabOrder = 9
    OnClick = BitBtn10Click
  end
  object CheckBoxBol: TCheckBox
    Left = 9
    Top = 75
    Width = 385
    Height = 17
    Caption = #1042#1082#1083#1102#1095#1072#1090#1100' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1077' '#1083#1080#1089#1090#1099' '#1087#1086' '#1089#1086#1094'.'#1089#1090#1088#1072#1093#1091
    TabOrder = 10
  end
  object BitBtn11: TBitBtn
    Left = 24
    Top = 336
    Width = 249
    Height = 41
    Caption = #1048#1089#1082#1088#1072
    TabOrder = 11
    OnClick = BitBtn11Click
  end
  object cbNeedPlan: TCheckBox
    Left = 400
    Top = 72
    Width = 289
    Height = 17
    Caption = #1056#1072#1079#1073#1080#1074#1082#1072' "'#1085#1072' '#1088#1091#1082#1080'" '#1087#1086' '#1082#1072#1090#1077#1075#1086#1088#1080#1103#1084
    TabOrder = 12
  end
end
