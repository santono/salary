object FormECBPerson: TFormECBPerson
  Left = 192
  Top = 124
  Width = 696
  Height = 480
  Caption = 'FormECBPerson'
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
  object gbTB5: TGroupBox
    Left = 16
    Top = 16
    Width = 649
    Height = 113
    Caption = #1058#1072#1073#1083#1080#1094#1103' 5'
    TabOrder = 0
  end
  object gbTB6: TGroupBox
    Left = 16
    Top = 144
    Width = 649
    Height = 105
    Caption = #1058#1072#1073#1083#1080#1094#1103' 6'
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 67
      Height = 13
      Caption = #1050#1072#1090#1077#1075#1086#1088'i'#1103' '#1047#1054
    end
    object Label2: TLabel
      Left = 0
      Top = 40
      Width = 80
      Height = 13
      Caption = #1058#1080#1087' '#1085#1072#1088#1093#1091#1074#1072#1085#1085#1103
    end
    object cbZO6: TComboBox
      Left = 88
      Top = 13
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'cbZO6'
      Items.Strings = (
        ' 1- '#1086#1073#1099#1095#1085#1099#1080#1081
        ' 2 - '#1080#1085#1074#1072#1083#1080#1076' - '#1086#1073#1099#1095#1085#1099#1081
        '25 - '#1085#1072#1091#1095#1085#1099#1081' '#1089#1090#1072#1078
        '26 - '#1076#1086#1075#1086#1074#1086#1088#1072' '#1087#1086#1076#1088#1103#1076#1072
        '29 - '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1081
        '32 - '#1085#1072#1091#1095#1085#1099#1081' '#1080#1085#1074#1072#1083#1080#1076
        '36 - '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1081' '#1080#1085#1074#1072#1083#1080#1076
        '42 - '#1076#1077#1082#1088#1077#1090#1085#1099#1081
        '43 - '#1076#1077#1082#1088#1077#1090#1085#1099#1081' - '#1080#1085#1074#1072#1083#1080#1076#1086#1074)
    end
    object cbPayTP: TComboBox
      Left = 88
      Top = 40
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = 'cbPayTP'
      Items.Strings = (
        '  0 - '#1079#1072#1088#1087#1083#1072#1090#1072' (PayTP - '#1085#1077' '#1091#1082#1072#1079#1099#1074#1072#1077#1090#1089#1103')'
        '10 - '#1086#1090#1087#1091#1089#1082#1085#1099#1077'  (zo=1 '#1080#1083#1080' 25 '#1080#1083#1080' '#1080#1085#1074#1072#1083#1080#1076#1099')'
        '13 - '#1088#1072#1079#1085#1080#1094#1072' '#1084#1077#1078#1076#1091' '#1084#1080#1085' '#1079#1087' '#1080' '#1079#1087' '#1088#1072#1073#1086#1090#1085#1080#1082#1072)
    end
    object cbOTK: TCheckBox
      Left = 240
      Top = 16
      Width = 193
      Height = 17
      Caption = #1058#1088#1091#1076#1086#1074#1072' '#1082#1085#1080#1078#1082#1072' '#1091' '#1088#1072#1073#1086#1090#1086#1076#1072#1074#1094#1103
      TabOrder = 2
    end
    object cbNRC: TCheckBox
      Left = 433
      Top = 17
      Width = 169
      Height = 17
      Caption = #1053#1077#1087#1086#1074#1085#1080#1081' '#1088#1086#1073#1086#1095#1080#1081' '#1095#1072#1089
      TabOrder = 3
    end
    object cbEXP: TCheckBox
      Left = 240
      Top = 40
      Width = 185
      Height = 17
      Caption = #1057#1087#1077#1094#1089#1090#1072#1078' ('#1085#1072#1091#1082#1086#1074#1094'i)'
      TabOrder = 4
    end
    object gbDay: TGroupBox
      Left = 368
      Top = 40
      Width = 265
      Height = 57
      Caption = #1044#1085'i'#1074
      TabOrder = 5
      object Label3: TLabel
        Left = 16
        Top = 16
        Width = 22
        Height = 13
        Hint = #1050'i'#1083#1100#1082'i'#1089#1090#1100' '#1076#1085'i'#1074' '#1087#1088#1086#1076#1086#1074#1078#1077#1085#1085#1103' '#1090#1088#1091#1076#1086#1074#1080#1093' '#1074'i'#1076#1085#1086#1089#1080#1085
        Caption = #1055#1058#1042
      end
      object Label4: TLabel
        Left = 84
        Top = 16
        Width = 16
        Height = 13
        Hint = #1050'i'#1083#1100#1082'i'#1089#1090#1100' '#1076#1085'i'#1074'  '#1090#1080#1084#1095#1072#1089#1086#1074#1086'i '#1085#1077#1087#1088#1072#1094#1077#1079#1076#1072#1090#1085#1086#1089#1090'i'
        Caption = #1053#1055
      end
      object Label5: TLabel
        Left = 148
        Top = 16
        Width = 23
        Height = 13
        Hint = #1050'i'#1083#1100#1082'i'#1089#1090#1100' '#1076#1085'i'#1074'  '#1074'i'#1076#1087#1091#1089#1090#1082#1080' '#1073#1077#1079' '#1079#1073#1077#1088#1077#1078#1077#1085#1085#1103' '#1079#1072#1088#1072#1073'i'#1090#1085#1086'i '#1087#1083#1072#1090#1080
        Caption = #1053#1047#1055
      end
      object Label6: TLabel
        Left = 212
        Top = 16
        Width = 15
        Height = 13
        Hint = #1050'i'#1083#1100#1082'i'#1089#1090#1100' '#1076#1085'i'#1074'  '#1074#1072#1075'i'#1090#1085'i'#1089#1090#1100' '#1090#1072' '#1087#1086#1083#1086#1075#1080
        Caption = #1042#1055
      end
      object meKDPTV: TMaskEdit
        Left = 8
        Top = 32
        Width = 31
        Height = 21
        Hint = #1050'i'#1083#1100#1082'i'#1089#1090#1100' '#1076#1085'i'#1074' '#1087#1088#1086#1076#1086#1074#1078#1077#1085#1085#1103' '#1090#1088#1091#1076#1086#1074#1080#1093' '#1074'i'#1076#1085#1086#1089#1080#1085
        EditMask = '09;; '
        MaxLength = 2
        TabOrder = 0
        Text = '  '
      end
      object UpDown1: TUpDown
        Left = 40
        Top = 32
        Width = 17
        Height = 25
        Hint = #1050'i'#1083#1100#1082'i'#1089#1090#1100' '#1076#1085'i'#1074' '#1087#1088#1086#1076#1086#1074#1078#1077#1085#1085#1103' '#1090#1088#1091#1076#1086#1074#1080#1093' '#1074'i'#1076#1085#1086#1089#1080#1085
        Max = 31
        TabOrder = 1
        OnClick = UpDown1Click
      end
      object meKDNP: TMaskEdit
        Left = 72
        Top = 32
        Width = 31
        Height = 21
        Hint = #1050'i'#1083#1100#1082'i'#1089#1090#1100' '#1076#1085'i'#1074'  '#1090#1080#1084#1095#1072#1089#1086#1074#1086'i '#1085#1077#1087#1088#1072#1094#1077#1079#1076#1072#1090#1085#1086#1089#1090'i'
        EditMask = '09;; '
        MaxLength = 2
        TabOrder = 2
        Text = '  '
      end
      object meKDNZP: TMaskEdit
        Left = 136
        Top = 32
        Width = 31
        Height = 21
        Hint = #1050'i'#1083#1100#1082'i'#1089#1090#1100' '#1076#1085'i'#1074'  '#1074'i'#1076#1087#1091#1089#1090#1082#1080' '#1073#1077#1079' '#1079#1073#1077#1088#1077#1078#1077#1085#1085#1103' '#1079#1072#1088#1072#1073'i'#1090#1085#1086'i '#1087#1083#1072#1090#1080
        EditMask = '09;; '
        MaxLength = 2
        TabOrder = 3
        Text = '  '
      end
      object meKDVP: TMaskEdit
        Left = 200
        Top = 32
        Width = 31
        Height = 21
        Hint = #1050'i'#1083#1100#1082'i'#1089#1090#1100' '#1076#1085'i'#1074'  '#1074#1072#1075'i'#1090#1085'i'#1089#1090#1100' '#1090#1072' '#1087#1086#1083#1086#1075#1080
        EditMask = '09;; '
        MaxLength = 2
        TabOrder = 4
        Text = '  '
      end
      object UpDown2: TUpDown
        Left = 104
        Top = 32
        Width = 17
        Height = 25
        Hint = #1050'i'#1083#1100#1082'i'#1089#1090#1100' '#1076#1085'i'#1074'  '#1090#1080#1084#1095#1072#1089#1086#1074#1086'i '#1085#1077#1087#1088#1072#1094#1077#1079#1076#1072#1090#1085#1086#1089#1090'i'
        Max = 31
        TabOrder = 5
        OnClick = UpDown2Click
      end
      object UpDown3: TUpDown
        Left = 166
        Top = 32
        Width = 17
        Height = 25
        Hint = #1050'i'#1083#1100#1082'i'#1089#1090#1100' '#1076#1085'i'#1074'  '#1074'i'#1076#1087#1091#1089#1090#1082#1080' '#1073#1077#1079' '#1079#1073#1077#1088#1077#1078#1077#1085#1085#1103' '#1079#1072#1088#1072#1073'i'#1090#1085#1086'i '#1087#1083#1072#1090#1080
        Max = 31
        TabOrder = 6
        OnClick = UpDown3Click
      end
      object UpDown4: TUpDown
        Left = 230
        Top = 32
        Width = 17
        Height = 25
        Hint = #1050'i'#1083#1100#1082'i'#1089#1090#1100' '#1076#1085'i'#1074'  '#1074#1072#1075'i'#1090#1085'i'#1089#1090#1100' '#1090#1072' '#1087#1086#1083#1086#1075#1080
        Max = 31
        TabOrder = 7
        OnClick = UpDown4Click
      end
    end
  end
  object gbTB7: TGroupBox
    Left = 16
    Top = 256
    Width = 649
    Height = 105
    Caption = #1058#1072#1073#1083#1080#1094#1103' 7'
    TabOrder = 2
  end
end
