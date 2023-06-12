object FormSetUpLgotniki: TFormSetUpLgotniki
  Left = 235
  Top = 126
  Width = 687
  Height = 159
  Caption = #1040#1082#1090#1091#1072#1083#1080#1079#1072#1094#1080#1103' '#1085#1072#1083#1086#1075#1086#1074#1099#1093' '#1074#1099#1095#1077#1090#1086#1074' '#1074' '#1090#1077#1082#1091#1097#1077#1084' '#1084#1077#1089#1103#1094#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 24
  object LabelPodr: TLabel
    Left = 8
    Top = 48
    Width = 86
    Height = 24
    Caption = 'LabelPodr'
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 24
    Width = 657
    Height = 17
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 80
    Width = 145
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 168
    Top = 80
    Width = 129
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
end
