object FormDelWantedECB: TFormDelWantedECB
  Left = 227
  Top = 157
  Width = 696
  Height = 179
  Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1045#1057#1042' '#1079#1072' '#1091#1082#1072#1079#1072#1085#1085#1099#1081' '#1084#1077#1089'.'
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
    Top = 48
    Width = 576
    Height = 20
    Caption = 
      #1053#1086#1084#1077#1088' '#1084#1077#1089#1103#1094#1072' '#1091#1082#1072#1079#1099#1074#1072#1077#1090#1089#1103' '#1085#1072' '#1074#1090#1086#1088#1086#1084' '#1096#1072#1075#1077' '#1087#1086#1089#1083#1077' '#1085#1072#1078#1072#1090#1080#1103' '#1082#1085#1086#1087#1082#1080' '#1053#1040#1063 +
      #1040#1058#1068
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 16
    Width = 649
    Height = 17
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 80
    Width = 75
    Height = 25
    Caption = #1053#1072#1095#1072#1090#1100
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 584
    Top = 80
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object rg1: TRadioGroup
    Left = 104
    Top = 80
    Width = 369
    Height = 49
    Caption = #1063#1090#1086' '#1091#1076#1072#1083#1103#1090#1100
    Columns = 3
    Items.Strings = (
      #1045#1057#1042
      #1042#1086#1077#1085#1085#1099#1081' '#1089#1073#1086#1088
      #1055#1088#1086#1092#1089#1086#1102#1079)
    TabOrder = 3
  end
end
