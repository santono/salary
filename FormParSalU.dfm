object FormParSal: TFormParSal
  Left = 197
  Top = 118
  Width = 696
  Height = 453
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1088#1072#1073#1086#1090#1099' '#1087#1088#1086#1075#1088#1072#1084#1084#1085#1086#1075#1086' '#1082#1086#1084#1087#1083#1077#1082#1089#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 216
    Width = 36
    Height = 13
    Caption = 'LabelTr'
  end
  object CheckBoxPodoh: TCheckBox
    Left = 8
    Top = 8
    Width = 209
    Height = 17
    Caption = #1042#1099#1074#1086#1076' '#1087#1088#1086#1090#1086#1082#1086#1083#1072' '#1088#1072#1089#1095#1077#1090#1072' '#1085#1072#1083#1086#1075#1086#1074
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 376
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object GroupBoxNalogi: TGroupBox
    Left = 8
    Top = 40
    Width = 249
    Height = 105
    Caption = #1056#1077#1078#1080#1084#1099' '#1072#1085#1072#1083#1080#1079#1072' '#1085#1072#1083#1086#1075#1086#1074
    TabOrder = 2
    object CheckBox1: TCheckBox
      Left = 8
      Top = 24
      Width = 233
      Height = 17
      Caption = #1042#1099#1074#1086#1076' '#1087#1088#1086#1090#1086#1082#1086#1083#1072' '#1088#1072#1089#1095#1077#1090#1072' '#1085#1072#1083#1086#1075#1086#1074
      TabOrder = 0
    end
    object CheckBoxModeRecalcPerson: TCheckBox
      Left = 8
      Top = 48
      Width = 233
      Height = 17
      Caption = #1056#1077#1078#1080#1084' '#1088#1072#1089#1095#1077#1090#1072' '#1045#1057#1042' '#1086#1090' 20 09 2011'
      TabOrder = 1
    end
    object CheckBoxNeedLogForRecalcNalogiPerson: TCheckBox
      Left = 8
      Top = 72
      Width = 225
      Height = 17
      Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1078#1091#1088#1085#1072#1083' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1072
      TabOrder = 2
    end
  end
  object GroupBoxReCalc: TGroupBox
    Left = 272
    Top = 40
    Width = 281
    Height = 129
    Caption = #1056#1077#1078#1080#1084#1099' '#1088#1072#1089#1095#1077#1090#1086#1074
    TabOrder = 3
    object CheckBox2: TCheckBox
      Left = 8
      Top = 24
      Width = 209
      Height = 17
      Caption = #1056#1072#1089#1095#1077#1090' '#1087#1086#1089#1083#1077' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1090#1072#1073#1077#1083#1103
      TabOrder = 0
    end
    object CheckBox3: TCheckBox
      Left = 8
      Top = 48
      Width = 257
      Height = 17
      Caption = #1056#1072#1089#1095#1077#1090' '#1087#1086#1089#1083#1077' '#1080#1079#1084#1077#1085#1077#1085#1080' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
      TabOrder = 1
    end
    object CheckBox4: TCheckBox
      Left = 8
      Top = 72
      Width = 241
      Height = 17
      Caption = #1056#1072#1089#1095#1077#1090' '#1087#1086#1089#1083#1077' '#1080#1079#1084#1077#1085#1077#1085#1080#1081' F4'
      TabOrder = 2
    end
    object CheckBoxNeedDelOtherMonthNalogi: TCheckBox
      Left = 8
      Top = 96
      Width = 257
      Height = 17
      Caption = #1059#1076#1072#1083#1103#1090#1100' '#1085#1072#1083#1086#1075#1080' '#1079#1072' '#1076#1088' '#1084#1077#1089' '#1073#1077#1079' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
      TabOrder = 3
    end
  end
  object GroupBoxBoln: TGroupBox
    Left = 8
    Top = 152
    Width = 249
    Height = 49
    Caption = #1055#1077#1095#1072#1090#1100' '#1073#1086#1083#1085'.'#1083#1080#1089#1090#1082#1086#1074
    TabOrder = 4
    object CheckBox5: TCheckBox
      Left = 8
      Top = 16
      Width = 225
      Height = 17
      Caption = #1043#1086#1090#1086#1074#1080#1090#1100' '#1092#1072#1081#1083' '#1076#1083#1103' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103
      TabOrder = 0
    end
  end
  object rgIOSQLMonitor: TRadioGroup
    Left = 272
    Top = 176
    Width = 361
    Height = 49
    Caption = 'SQL '#1084#1086#1085#1080#1090#1086#1088
    Columns = 3
    Items.Strings = (
      #1074#1099#1082#1083#1102#1095#1077#1085
      #1079#1072#1087#1080#1089#1100
      #1095#1090#1077#1085#1080#1077' '#1080' '#1079#1072#1087#1080#1089#1100)
    TabOrder = 5
  end
  object BitBtnChangeNMES: TBitBtn
    Left = 16
    Top = 240
    Width = 425
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1088#1072#1073#1086#1095#1091#1102' '#1076#1072#1090#1091' '#1076#1083#1103' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1079#1072#1088#1087#1083#1072#1090#1099' '#1074' YEAR.TXT'
    TabOrder = 6
    OnClick = BitBtnChangeNMESClick
  end
  object BtnProtectedPodr: TBitBtn
    Left = 16
    Top = 280
    Width = 425
    Height = 25
    Caption = #1044#1086#1089#1090#1091#1087' '#1082' '#1079#1072#1097#1080#1096#1077#1085#1085#1099#1084' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103#1084
    TabOrder = 7
    OnClick = BtnProtectedPodrClick
  end
  object cbRoundNalogi: TCheckBox
    Left = 16
    Top = 320
    Width = 193
    Height = 17
    Caption = #1054#1082#1088#1091#1075#1083#1103#1090#1100' '#1088#1072#1089#1095#1077#1090#1099' '#1085#1072#1083#1086#1075#1086#1074
    TabOrder = 8
    OnClick = cbRoundNalogiClick
  end
  object cxSpinEdit1: TcxSpinEdit
    Left = 216
    Top = 320
    Properties.MaxValue = 2.000000000000000000
    Properties.MinValue = -2.000000000000000000
    Properties.OnChange = cxSpinEdit1PropertiesChange
    TabOrder = 9
    Width = 121
  end
  object cbCheckMem: TCheckBox
    Left = 24
    Top = 344
    Width = 225
    Height = 17
    Caption = #1058#1077#1089#1090#1080#1088#1086#1074#1072#1090#1100' '#1084#1077#1084#1086#1088#1080#1072#1083#1100#1085#1099#1081' '#1086#1088#1076#1077#1088
    TabOrder = 10
  end
end
