object FormRepPodohByPerson: TFormRepPodohByPerson
  Left = 260
  Top = 234
  Width = 657
  Height = 283
  Caption = #1044#1077#1090#1072#1083#1100#1085#1099#1081' '#1089#1074#1086#1076' '#1087#1086' '#1087#1086#1076#1086#1093#1086#1076#1085#1086#1084#1091' '#1085#1072#1083#1086#1075#1091
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
  object LabelFio: TLabel
    Left = 24
    Top = 176
    Width = 61
    Height = 20
    Caption = 'LabelFio'
  end
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 37
    Height = 20
    Caption = #1050#1086#1084#1091
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 96
    Width = 185
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1086#1090#1095#1077#1090
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 528
    Top = 64
    Width = 91
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 152
    Width = 609
    Height = 17
    TabOrder = 2
  end
  object cbpodrMode: TComboBox
    Left = 72
    Top = 16
    Width = 249
    Height = 28
    ItemHeight = 20
    TabOrder = 3
    Items.Strings = (
      #1042#1089#1077
      #1059#1085#1080#1074#1077#1088#1089#1080#1090#1077#1090
      #1050#1086#1083#1077#1076#1078
      #1040#1083#1095#1077#1074#1089#1082
      #1057#1077#1074#1077#1088#1086#1076#1086#1085#1077#1094#1082' '#1057#1058#1048
      #1057#1077#1074#1077#1088#1086#1076#1086#1085#1077#1094' - '#1082#1086#1083#1077#1076#1078)
  end
end
