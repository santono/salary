object FormPersonMainState: TFormPersonMainState
  Left = 190
  Top = 124
  Width = 698
  Height = 367
  Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1087#1077#1088#1077#1074#1086#1076#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 48
    Top = 8
    Width = 48
    Height = 20
    Caption = 'Label1'
  end
  object rgMain: TRadioGroup
    Left = 48
    Top = 56
    Width = 529
    Height = 209
    Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
    Items.Strings = (
      #1041#1099#1074#1096#1077#1077' '#1086#1089#1085#1086#1074#1085#1086#1077' '#1084#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099' ('#1089#1077#1081#1095#1072#1089' '#1087#1077#1088#1077#1074#1077#1076#1077#1085')'
      #1054#1089#1085#1086#1074#1085#1086#1077' '#1084#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099
      #1055#1077#1088#1077#1074#1077#1076#1077#1085' '#1074' '#1101#1090#1086#1084' '#1084#1077#1089#1103#1094#1077
      #1050#1086#1076' 3'
      #1050#1086#1076' 4')
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 48
    Top = 280
    Width = 105
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 376
    Top = 280
    Width = 97
    Height = 25
    Caption = '&'#1042#1099#1081#1090#1080
    TabOrder = 2
    Kind = bkClose
  end
end
