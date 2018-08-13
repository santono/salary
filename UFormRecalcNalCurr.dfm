object FormRecalcNalCurr: TFormRecalcNalCurr
  Left = 205
  Top = 170
  Width = 696
  Height = 280
  Caption = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090' '#1085#1072#1083#1086#1075#1086#1074' '
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
  object LabelFio: TLabel
    Left = 16
    Top = 8
    Width = 61
    Height = 20
    Caption = 'LabelFio'
  end
  object LabelCnt: TLabel
    Left = 16
    Top = 56
    Width = 64
    Height = 20
    Caption = 'LabelCnt'
  end
  object LabelPdr: TLabel
    Left = 16
    Top = 104
    Width = 63
    Height = 20
    Caption = 'LabelPdr'
  end
  object LabelMon: TLabel
    Left = 520
    Top = 8
    Width = 70
    Height = 20
    Caption = 'LabelMon'
  end
  object ProgressBarPrsn: TProgressBar
    Left = 16
    Top = 32
    Width = 657
    Height = 21
    TabOrder = 0
  end
  object ProgressBarPdr: TProgressBar
    Left = 16
    Top = 80
    Width = 657
    Height = 21
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 136
    Width = 185
    Height = 25
    Caption = #1053#1072#1095#1072#1090#1100' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 208
    Top = 136
    Width = 193
    Height = 25
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 584
    Top = 136
    Width = 89
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 4
    Kind = bkClose
  end
  object CheckBoxTN: TCheckBox
    Left = 480
    Top = 184
    Width = 201
    Height = 17
    Caption = #1058#1072#1073'.'#1085#1086#1084#1077#1088#1072' '#1080#1079' '#1089#1087#1080#1089#1082#1072
    TabOrder = 5
  end
  object RadioGroupMode: TRadioGroup
    Left = 8
    Top = 168
    Width = 465
    Height = 49
    Caption = #1056#1077#1078#1080#1084
    Columns = 3
    Items.Strings = (
      #1042#1089#1077
      #1054#1089#1085'.'#1084#1077#1089#1090#1086' '#1088#1072#1073'.'
      #1057#1086#1074#1084#1077#1097#1077#1085#1080#1103)
    TabOrder = 6
  end
  object BitBtn4: TBitBtn
    Left = 408
    Top = 136
    Width = 169
    Height = 25
    Caption = #1056#1072#1089#1095#1077#1090' '#1087#1086#1089#1083#1077' '#1075#1077#1085#1077#1088#1072#1094#1080#1080
    TabOrder = 7
    OnClick = BitBtn4Click
  end
end
