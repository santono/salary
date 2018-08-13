object FormSwodSwmMode: TFormSwodSwmMode
  Left = 252
  Top = 144
  Width = 359
  Height = 214
  Caption = #1059#1082#1072#1078#1080#1090#1077' '#1088#1077#1078#1080#1084' '#1074#1099#1073#1086#1088#1072' '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1077#1081
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
  object rgmode: TRadioGroup
    Left = 8
    Top = 8
    Width = 321
    Height = 105
    Caption = #1056#1077#1078#1080#1084' '#1074#1099#1074#1086#1076#1072' '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1077#1081
    Items.Strings = (
      #1042#1089#1077' - '#1086#1089#1085#1086#1074#1085#1099#1077' '#1080' '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1080
      #1058#1086#1083#1100#1082#1086' '#1086#1089#1085#1086#1074#1085#1099#1077
      #1057#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1080' '#1074#1085#1091#1090#1088#1077#1085#1085#1080#1077
      #1057#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1080' '#1074#1085#1077#1096#1085#1080#1077)
    TabOrder = 0
  end
  object btn1: TBitBtn
    Left = 16
    Top = 128
    Width = 75
    Height = 25
    Caption = #1042#1099#1073#1088#1072#1090#1100
    TabOrder = 1
    OnClick = btn1Click
  end
  object btn2: TBitBtn
    Left = 248
    Top = 128
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
end
