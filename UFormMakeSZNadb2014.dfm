object FormMakeSZNadb2014: TFormMakeSZNadb2014
  Left = 275
  Top = 180
  Width = 696
  Height = 186
  Caption = #1055#1077#1088#1077#1085#1086#1089' '#1085#1072#1076#1073#1072#1074#1086#1082' '#1079#1072' '#1089#1090#1077#1087#1077#1085#1100' '#1080' '#1079#1074#1072#1085#1080#1077' '#1085#1072' '#1074#1085#1077#1073#1102#1076#1078#1077#1090
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
  object BitBtn1: TBitBtn
    Left = 144
    Top = 80
    Width = 169
    Height = 25
    Caption = #1055#1077#1088#1077#1085#1086#1089' '#1057#1047
    Enabled = False
    TabOrder = 1
    Visible = False
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 328
    Top = 80
    Width = 201
    Height = 25
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 592
    Top = 96
    Width = 81
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 3
    Kind = bkClose
  end
  object BitBtn4: TBitBtn
    Left = 144
    Top = 112
    Width = 169
    Height = 25
    Caption = #1055#1077#1088#1077#1085#1086#1089' '#1074#1099#1089#1083#1091#1075#1080
    TabOrder = 4
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 144
    Top = 80
    Width = 169
    Height = 25
    Caption = #1047#1072#1084#1077#1085#1072' 1920 '#1085#1072' 1520'
    Enabled = False
    TabOrder = 5
    Visible = False
    OnClick = BitBtn5Click
  end
end
