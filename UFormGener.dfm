object FormGener: TFormGener
  Left = 229
  Top = 134
  Width = 696
  Height = 480
  Caption = 'FormGener'
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
    Left = 32
    Top = 48
    Width = 432
    Height = 20
    Caption = ' 1. '#1055#1077#1088#1077#1085#1086#1089' '#1082#1072#1083#1077#1085#1076#1072#1088#1077#1081' '#1080#1079' DAY.TXT '#1080' monthYY.txt '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 32
    Top = 80
    Width = 390
    Height = 20
    Caption = ' 2. '#1055#1077#1088#1077#1085#1086#1089' '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1086#1081' '#1079#1072#1088#1087#1083#1072#1090#1099' '#1074' '#1041#1044' SQL '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 32
    Top = 112
    Width = 263
    Height = 20
    Caption = ' 3. '#1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1085#1086#1074#1086#1081' '#1076#1072#1090#1099' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 32
    Top = 144
    Width = 245
    Height = 20
    Caption = ' 4. '#1043#1077#1085#1077#1088#1072#1094#1080#1103' '#1085#1086#1074#1086#1075#1086' '#1084#1077#1089#1103#1094#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 32
    Top = 176
    Width = 207
    Height = 20
    Caption = ' 5. '#1055#1077#1088#1077#1088#1072#1089#1095#1077#1090' '#1085#1072#1083#1086#1075#1086#1074' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 496
    Top = 48
    Width = 61
    Height = 20
    Caption = #1043#1086#1090#1086#1074#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label12: TLabel
    Left = 496
    Top = 80
    Width = 61
    Height = 20
    Caption = #1043#1086#1090#1086#1074#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label13: TLabel
    Left = 496
    Top = 112
    Width = 61
    Height = 20
    Caption = #1043#1086#1090#1086#1074#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label14: TLabel
    Left = 496
    Top = 144
    Width = 61
    Height = 20
    Caption = #1043#1086#1090#1086#1074#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label15: TLabel
    Left = 496
    Top = 176
    Width = 61
    Height = 20
    Caption = #1043#1086#1090#1086#1074#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BitBtnStart: TBitBtn
    Left = 24
    Top = 392
    Width = 137
    Height = 25
    Caption = #1053#1072#1095#1072#1090#1100' '#1075#1077#1085#1077#1088#1072#1094#1080#1102
    TabOrder = 0
    OnClick = BitBtnStartClick
  end
  object BitBtnClose: TBitBtn
    Left = 520
    Top = 392
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object cbNeedArc: TCheckBox
    Left = 40
    Top = 16
    Width = 281
    Height = 17
    Caption = #1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1086' '#1089#1076#1077#1083#1072#1090#1100' '#1072#1088#1093#1080#1074' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 24
    Top = 216
    Width = 609
    Height = 129
    TabOrder = 3
    object LabelNextMonth: TLabel
      Left = 8
      Top = 16
      Width = 593
      Height = 24
      Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103' '#1076#1072#1085#1085#1099#1093' '#1076#1083#1103' '#1087#1077#1088#1077#1093#1086#1076#1072' '#1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LabelDC: TLabel
      Left = 8
      Top = 64
      Width = 72
      Height = 24
      Caption = 'LabelDC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
end
