object FormRecalcPodr: TFormRecalcPodr
  Left = 272
  Top = 345
  Width = 696
  Height = 151
  Caption = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
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
  object LabelFIO: TLabel
    Left = 16
    Top = 40
    Width = 4
    Height = 20
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 8
    Width = 649
    Height = 21
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 72
    Width = 113
    Height = 25
    Caption = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090
    Enabled = False
    TabOrder = 1
    Visible = False
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 512
    Top = 72
    Width = 137
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    Enabled = False
    TabOrder = 2
    Visible = False
    Kind = bkClose
  end
end
