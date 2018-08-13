object FormEkonom: TFormEkonom
  Left = 230
  Top = 167
  Width = 696
  Height = 236
  Caption = #1056#1072#1089#1095#1077#1090' '#1101#1082#1086#1085#1086#1084#1080#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object LabelPodr: TLabel
    Left = 32
    Top = 32
    Width = 48
    Height = 13
    Caption = 'LabelPodr'
  end
  object LabelFIO: TLabel
    Left = 32
    Top = 80
    Width = 43
    Height = 13
    Caption = 'LabelFIO'
  end
  object ProgressBarPodr: TProgressBar
    Left = 32
    Top = 56
    Width = 593
    Height = 17
    TabOrder = 0
  end
  object ProgressBarFio: TProgressBar
    Left = 32
    Top = 96
    Width = 593
    Height = 17
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 32
    Top = 128
    Width = 75
    Height = 25
    Caption = #1056#1072#1089#1095#1077#1090
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 520
    Top = 136
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkClose
  end
  object BitBtn3: TBitBtn
    Left = 160
    Top = 128
    Width = 113
    Height = 25
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1089#1095#1077#1090#1072
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object CheckBoxBlock: TCheckBox
    Left = 296
    Top = 128
    Width = 169
    Height = 17
    Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1073#1083#1086#1082#1080#1088#1086#1074#1072#1085#1085#1099#1077
    TabOrder = 5
  end
  object BitBtn4: TBitBtn
    Left = 32
    Top = 160
    Width = 217
    Height = 25
    Caption = #1042#1099#1074#1086#1076' '#1072#1087#1088#1077#1083#1103' '#1074' '#1084#1072#1077' 2012'
    TabOrder = 6
    OnClick = BitBtn4Click
  end
end
