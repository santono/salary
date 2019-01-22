object FormSaveAwans: TFormSaveAwans
  Left = 197
  Top = 419
  Width = 696
  Height = 152
  Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1072#1074#1072#1085#1089
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
    Left = 16
    Top = 16
    Width = 50
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
  end
  object LabelPodr: TLabel
    Left = 184
    Top = 72
    Width = 48
    Height = 13
    Caption = 'LabelPodr'
  end
  object EditName: TEdit
    Left = 80
    Top = 8
    Width = 537
    Height = 21
    TabOrder = 0
    Text = 'EditName'
  end
  object BitBtnSave: TBitBtn
    Left = 8
    Top = 72
    Width = 73
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 1
    OnClick = BitBtnSaveClick
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 40
    Width = 665
    Height = 17
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 96
    Top = 72
    Width = 75
    Height = 25
    Caption = '&'#1047#1072#1082#1088#1099#1090#1100
    TabOrder = 3
    Kind = bkClose
  end
  object BitBtn2: TBitBtn
    Left = 240
    Top = 72
    Width = 393
    Height = 25
    Caption = #1042#1099#1073#1086#1088' '#1096#1080#1092#1088#1086#1074' '#1089#1090#1072#1090#1077#1081
    TabOrder = 4
    OnClick = BitBtn2Click
  end
end
