object FormParNadb: TFormParNadb
  Left = 228
  Top = 184
  Width = 696
  Height = 257
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1085#1072#1076#1073#1072#1074#1086#1082
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 147
    Height = 13
    Caption = #1053#1072#1076#1073#1072#1074#1082#1072' '#1079#1072' '#1091#1095#1077#1085#1091#1102' '#1089#1090#1077#1087#1077#1085#1100
  end
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 141
    Height = 13
    Caption = #1053#1072#1076#1073#1072#1074#1082#1072' '#1079#1072' '#1091#1095#1077#1085#1086#1077' '#1079#1074#1072#1085#1080#1077
  end
  object Label3: TLabel
    Left = 16
    Top = 112
    Width = 93
    Height = 13
    Caption = #1053#1072#1076#1073#1072#1074#1082#1072' '#1079#1072' '#1089#1090#1072#1078
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 152
    Width = 75
    Height = 25
    Caption = #1047#1072#1085#1077#1089#1090#1080
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 104
    Top = 152
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object rgStep: TRadioGroup
    Left = 176
    Top = 8
    Width = 185
    Height = 33
    Caption = #1047#1072' '#1089#1090#1077#1087#1077#1085#1100' (*)'
    Columns = 3
    Items.Strings = (
      #1085#1077#1090
      '15'
      '25')
    TabOrder = 2
  end
  object rgZwan: TRadioGroup
    Left = 176
    Top = 56
    Width = 185
    Height = 33
    Caption = #1047#1072' '#1079#1074#1072#1085#1080#1077' (%)'
    Columns = 3
    Items.Strings = (
      '0'
      '25'
      '33')
    TabOrder = 3
  end
  object rgStag: TRadioGroup
    Left = 175
    Top = 102
    Width = 185
    Height = 33
    Caption = #1047#1072' '#1089#1090#1072#1078' (%)'
    Columns = 4
    Items.Strings = (
      '0'
      '10'
      '20'
      '30')
    TabOrder = 4
  end
end
