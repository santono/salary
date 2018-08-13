object FormMakeAllChain: TFormMakeAllChain
  Left = 249
  Top = 191
  Width = 696
  Height = 161
  Caption = #1055#1086#1089#1090#1088#1086#1077#1085#1080#1077' '#1094#1077#1087#1086#1095#1077#1082' '#1074' '#1073#1072#1079#1077' '#1076#1072#1085#1085#1099#1093
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
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 80
    Height = 13
    Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 32
    Width = 657
    Height = 21
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 72
    Width = 305
    Height = 25
    Caption = #1053#1072#1095#1072#1090#1100' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1094#1077#1087#1086#1095#1077#1082' '#1079#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 592
    Top = 72
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
end
