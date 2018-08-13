object FormSelLeraSwodMode: TFormSelLeraSwodMode
  Left = 306
  Top = 173
  Width = 521
  Height = 165
  Caption = #1056#1077#1078#1080#1084' '#1089#1074#1086#1076#1072' '#1076#1083#1103' '#1051#1077#1088#1099
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
  object ComboBox1: TComboBox
    Left = 32
    Top = 32
    Width = 169
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 20
    ItemIndex = 0
    ParentFont = False
    TabOrder = 0
    Text = '811 '#1089#1095#1077#1090
    Items.Strings = (
      '811 '#1089#1095#1077#1090
      #1052#1072#1075#1080#1089#1090#1088#1072#1090#1091#1088#1072' (802'#1052#1043')'
      #1052#1072#1075#1080#1089#1090#1088#1072#1090#1091#1088#1072' (811/4'#1052#1043')'
      #1044#1086#1075#1086#1074#1086#1088#1072' '#1087#1086#1076#1088#1103#1076#1072)
  end
  object ComboBox2: TComboBox
    Left = 232
    Top = 32
    Width = 257
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 20
    ItemIndex = 0
    ParentFont = False
    TabOrder = 1
    Text = #1055#1086#1083#1085#1099#1081' ('#1074#1089#1077' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103')'
    Items.Strings = (
      #1055#1086#1083#1085#1099#1081' ('#1074#1089#1077' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103')'
      #1041#1077#1079' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093' '#1080' '#1082#1072#1089#1089#1099
      #1058#1086#1083#1100#1082#1086' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1077
      #1058#1086#1083#1100#1082#1086' '#1082#1072#1089#1089#1072)
  end
  object BitBtn1: TBitBtn
    Left = 32
    Top = 80
    Width = 75
    Height = 25
    Caption = #1057#1074#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 120
    Top = 80
    Width = 97
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Kind = bkClose
  end
  object CheckBoxDebug: TCheckBox
    Left = 248
    Top = 88
    Width = 217
    Height = 17
    Caption = #1042#1099#1074#1086#1076#1080#1090#1100' '#1086#1090#1083#1072#1076#1072#1086#1095#1085#1091#1102' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102
    TabOrder = 4
  end
  object CheckBoxBol: TCheckBox
    Left = 248
    Top = 64
    Width = 209
    Height = 17
    Caption = #1042#1082#1083#1102#1095#1072#1090#1100' '#1073#1086#1083#1085'. '#1083#1080#1089#1090#1099' '#1087#1086' '#1089#1086#1094'.'#1089#1090#1088#1072#1093#1091
    TabOrder = 5
  end
end
