object FormPovLNR: TFormPovLNR
  Left = 245
  Top = 177
  Width = 696
  Height = 480
  Caption = #1056#1072#1079#1088#1103#1076#1099' - '#1086#1082#1083#1072#1076#1099' '#1051#1053#1056
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
  object LabelFio: TLabel
    Left = 8
    Top = 8
    Width = 61
    Height = 20
    Caption = 'LabelFio'
  end
  object LabelPodr: TLabel
    Left = 8
    Top = 56
    Width = 4
    Height = 20
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 208
    Width = 105
    Height = 25
    Caption = #1055#1086#1074#1099#1089#1080#1090#1100
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 120
    Top = 208
    Width = 129
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 32
    Width = 617
    Height = 17
    TabOrder = 2
  end
  object BitBtn3: TBitBtn
    Left = 8
    Top = 136
    Width = 545
    Height = 25
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
    TabOrder = 3
    OnClick = BitBtn3Click
  end
end
