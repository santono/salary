object FormMoveNabdToDB: TFormMoveNabdToDB
  Left = 267
  Top = 152
  Width = 870
  Height = 191
  Caption = #1048#1084#1087#1086#1088#1090' '#1085#1072#1076#1073#1072#1074#1086#1082' '#1074' '#1041#1044
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Label3: TLabel
    Left = 24
    Top = 104
    Width = 32
    Height = 13
    Caption = 'Label3'
  end
  object Label4: TLabel
    Left = 24
    Top = 128
    Width = 32
    Height = 13
    Caption = 'Label4'
  end
  object BitBtn1: TBitBtn
    Left = 648
    Top = 8
    Width = 83
    Height = 25
    Caption = #1042#1099#1073#1086#1088' '#1092#1072#1081#1083#1072
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 296
    Top = 32
    Width = 75
    Height = 25
    Caption = #1055#1077#1088#1077#1085#1086#1089
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 384
    Top = 32
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object ProgressBar1: TProgressBar
    Left = 24
    Top = 72
    Width = 617
    Height = 17
    TabOrder = 3
  end
  object cbCmpPassMonth: TCheckBox
    Left = 32
    Top = 40
    Width = 217
    Height = 17
    Caption = #1057#1088#1072#1074#1085#1080#1090#1100' '#1089' '#1087#1088#1086#1096#1083#1099#1084' '#1084#1077#1089#1103#1094#1077#1084
    TabOrder = 4
  end
  object OpenDialog1: TOpenDialog
    Left = 744
    Top = 8
  end
end
