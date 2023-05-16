object FormRepAbsentPSB: TFormRepAbsentPSB
  Left = 192
  Top = 124
  Width = 696
  Height = 166
  Caption = #1057#1087#1080#1089#1086#1082' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1073#1077#1079' '#1089#1095#1077#1090#1072' '#1074' '#1055#1057#1041
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
    Left = 24
    Top = 40
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 16
    Width = 649
    Height = 17
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 72
    Width = 185
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1087#1080#1089#1086#1082
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 208
    Top = 72
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
end
