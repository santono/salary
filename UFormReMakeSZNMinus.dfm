object FormReMakeSZNMinus: TFormReMakeSZNMinus
  Left = 275
  Top = 180
  Width = 696
  Height = 174
  Caption = #1042#1099#1074#1086#1076' '#1085#1072#1076#1073#1072#1074#1086#1082' '#1085#1072' 0'
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
  object Label1: TLabel
    Left = 128
    Top = 8
    Width = 48
    Height = 20
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 128
    Top = 56
    Width = 48
    Height = 20
    Caption = 'Label2'
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 32
    Width = 665
    Height = 21
    TabOrder = 0
  end
  object BitBtn2: TBitBtn
    Left = 192
    Top = 80
    Width = 201
    Height = 25
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 408
    Top = 80
    Width = 81
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object BitBtn4: TBitBtn
    Left = 16
    Top = 80
    Width = 169
    Height = 25
    Caption = #1042#1099#1074#1077#1089#1090#1080' '#1085#1072' 0'
    TabOrder = 3
    OnClick = BitBtn4Click
  end
  object BtnUpdPodoh: TBitBtn
    Left = 504
    Top = 80
    Width = 129
    Height = 25
    Caption = #1048#1079#1084' '#1087#1077#1088#1080#1086#1076' '#1087#1086#1076' '#1085#1072#1083#1086#1075#1072
    TabOrder = 4
    OnClick = BtnUpdPodohClick
  end
end
