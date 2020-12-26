object FormMakeOtpTableFromSQL: TFormMakeOtpTableFromSQL
  Left = 227
  Top = 157
  Width = 696
  Height = 179
  Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1086#1090#1087#1091#1089#1082#1086#1075#1086' '#1090#1072#1073#1077#1083#1103' '#1080#1079' SQL'
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
  object BitBtn3: TBitBtn
    Left = 96
    Top = 80
    Width = 449
    Height = 25
    Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1090#1072#1073#1077#1083#1103' '#1087#1086#1089#1083#1077' '#1082#1086#1084#1087#1077#1085#1089#1072#1094#1080#1080' '#1074' 12 2020'
    TabOrder = 3
    OnClick = BitBtn3Click
  end
end
