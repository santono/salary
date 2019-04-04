object FormRecalcJan2019: TFormRecalcJan2019
  Left = 192
  Top = 124
  Width = 696
  Height = 154
  Caption = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090' '#1103#1085#1074#1072#1088#1103' '#1074' '#1092#1077#1074#1088#1072#1083#1077' 2019'
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
  object LabelPodr: TLabel
    Left = 144
    Top = 48
    Width = 48
    Height = 13
    Caption = 'LabelPodr'
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 24
    Width = 649
    Height = 17
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 72
    Width = 145
    Height = 25
    Caption = #1042#1099#1087#1086#1085#1080#1090#1100' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 192
    Top = 72
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object BitBtn3: TBitBtn
    Left = 280
    Top = 72
    Width = 377
    Height = 25
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
    TabOrder = 3
    OnClick = BitBtn3Click
  end
end
