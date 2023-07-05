object FormCheckMovedOtpFromSQL: TFormCheckMovedOtpFromSQL
  Left = 239
  Top = 146
  Width = 696
  Height = 180
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
  object LabelPodr: TLabel
    Left = 8
    Top = 56
    Width = 72
    Height = 20
    Caption = 'LabelPodr'
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 32
    Width = 665
    Height = 17
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 96
    Width = 233
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1087#1088#1086#1074#1077#1088#1082#1091
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 256
    Top = 96
    Width = 89
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
end
