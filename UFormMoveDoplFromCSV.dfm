object FormMoveDoplFromCSV: TFormMoveDoplFromCSV
  Left = 192
  Top = 145
  Width = 696
  Height = 480
  Caption = #1055#1077#1088#1077#1085#1086#1089' '#1076#1086#1087#1083#1072#1090
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
    Left = 16
    Top = 56
    Width = 227
    Height = 13
    Caption = #1044#1083#1103' '#1087#1077#1088#1077#1085#1086#1089#1072' '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082#1091' '#1055#1045#1056#1045#1053#1045#1057#1058#1048
  end
  object LabelPodr: TLabel
    Left = 16
    Top = 8
    Width = 3
    Height = 13
  end
  object Label2: TLabel
    Left = 16
    Top = 96
    Width = 144
    Height = 13
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1092#1072#1081#1083'  '#1089' '#1076#1086#1087#1083#1072#1090#1072#1084#1080
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 24
    Width = 657
    Height = 21
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 384
    Width = 75
    Height = 25
    Caption = #1055#1077#1088#1077#1085#1077#1089#1090#1080
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 568
    Top = 384
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object BitBtn3: TBitBtn
    Left = 272
    Top = 56
    Width = 393
    Height = 25
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081', '#1089#1095#1077#1090#1086#1074
    TabOrder = 3
    Visible = False
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 16
    Top = 120
    Width = 75
    Height = 25
    Caption = '. . .'
    TabOrder = 4
    OnClick = BitBtn4Click
  end
  object OpenDialog1: TOpenDialog
    Left = 312
    Top = 88
  end
end
