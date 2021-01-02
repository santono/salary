object FormTestIOSemaphore: TFormTestIOSemaphore
  Left = 198
  Top = 172
  Width = 280
  Height = 143
  Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1089#1077#1084#1072#1092#1086#1088#1072
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
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 115
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
  end
  object LabelResult: TLabel
    Left = 16
    Top = 40
    Width = 225
    Height = 13
    Caption = 'LabelResult'
  end
  object EditNSRV: TEdit
    Left = 112
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '1'
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 64
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 104
    Top = 64
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    OnClick = BitBtn2Click
    Kind = bkClose
  end
  object pFIBDataSet1: TpFIBDataSet
    Left = 208
    Top = 72
  end
end
