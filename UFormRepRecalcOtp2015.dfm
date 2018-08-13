object FormRepRecalcOtp2015: TFormRepRecalcOtp2015
  Left = 253
  Top = 275
  Width = 657
  Height = 283
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1086#1074' '#1086#1090#1087#1091#1089#1082#1085#1099#1093' '#1079#1072' 2016'
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
  object BitBtn1: TBitBtn
    Left = 16
    Top = 64
    Width = 185
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1086#1090#1095#1077#1090
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 528
    Top = 64
    Width = 91
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object rgSort: TRadioGroup
    Left = 232
    Top = 16
    Width = 361
    Height = 41
    Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
    Columns = 2
    Items.Strings = (
      #1087#1086' '#1072#1083#1092#1072#1074#1080#1090#1091
      #1087#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103#1084)
    TabOrder = 2
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 96
    Width = 601
    Height = 17
    TabOrder = 3
  end
end
