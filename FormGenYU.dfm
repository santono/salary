object FormGenYSpr: TFormGenYSpr
  Left = 192
  Top = 172
  Width = 696
  Height = 210
  Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103' '#1089#1087#1088#1072#1074#1082#1080' '#1086' '#1075#1086#1076#1086#1074#1086#1081' '#1079#1072#1088#1087#1083#1072#1090#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object LabelFIO: TLabel
    Left = 8
    Top = 24
    Width = 157
    Height = 20
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
  end
  object Label1: TLabel
    Left = 16
    Top = 62
    Width = 271
    Height = 20
    Caption = #1047#1072' '#1082#1072#1082#1086#1081' '#1075#1086#1076' '#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100' '#1089#1087#1088#1072#1074#1082#1091
  end
  object BitBtn1: TBitBtn
    Left = 632
    Top = 16
    Width = 35
    Height = 25
    Caption = '. . .'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object SpinEdit1: TSpinEdit
    Left = 296
    Top = 56
    Width = 121
    Height = 30
    MaxValue = 2030
    MinValue = 1991
    TabOrder = 1
    Value = 1991
  end
  object BitBtn2: TBitBtn
    Left = 16
    Top = 112
    Width = 169
    Height = 25
    Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103' '#1089#1087#1088#1072#1074#1082#1080
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 312
    Top = 112
    Width = 105
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 3
    Kind = bkClose
  end
  object RadioGroupZaV: TRadioGroup
    Left = 424
    Top = 48
    Width = 249
    Height = 57
    BiDiMode = bdLeftToRight
    Caption = #1056#1077#1078#1080#1084' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103' '#1089#1087#1088#1072#1074#1082#1080
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #1079#1072
      #1074)
    ParentBiDiMode = False
    TabOrder = 4
  end
end
