object FormUpdFac: TFormUpdFac
  Left = 231
  Top = 200
  Width = 696
  Height = 289
  Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 88
    Top = 16
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
  end
  object Label2: TLabel
    Left = 72
    Top = 56
    Width = 50
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
  end
  object Label3: TLabel
    Left = 72
    Top = 88
    Width = 59
    Height = 13
    Caption = #1053#1072' '#1091#1082#1088' '#1084#1086#1074#1110
  end
  object Label4: TLabel
    Left = 56
    Top = 120
    Width = 88
    Height = 13
    Caption = #1056#1086#1076#1086#1074#1080#1081' '#1074#1110#1076#1084#1110#1085#1086#1082
  end
  object Label5: TLabel
    Left = 64
    Top = 152
    Width = 75
    Height = 13
    Caption = #1044#1072#1090#1072' '#1079#1072#1082#1088#1080#1090#1090#1103
  end
  object cxDBTextEdit1: TcxDBTextEdit
    Left = 160
    Top = 16
    DataBinding.DataField = 'SHIFRID'
    DataBinding.DataSource = dmPO.dsFacList
    Enabled = False
    TabOrder = 0
    Width = 121
  end
  object cxDBTextEdit2: TcxDBTextEdit
    Left = 161
    Top = 52
    DataBinding.DataField = 'NAME'
    DataBinding.DataSource = dmPO.dsFacList
    TabOrder = 1
    Width = 425
  end
  object cxDBTextEdit3: TcxDBTextEdit
    Left = 160
    Top = 80
    DataBinding.DataField = 'NAME_K'
    DataBinding.DataSource = dmPO.dsFacList
    TabOrder = 2
    Width = 425
  end
  object cxDBTextEdit4: TcxDBTextEdit
    Left = 160
    Top = 112
    DataBinding.DataField = 'NAME_S'
    DataBinding.DataSource = dmPO.dsFacList
    TabOrder = 3
    Width = 425
  end
  object cxDBDateEdit1: TcxDBDateEdit
    Left = 160
    Top = 144
    DataBinding.DataField = 'DATECLOSE'
    DataBinding.DataSource = dmPO.dsFacList
    Properties.ClearKey = 46
    TabOrder = 4
    Width = 121
  end
  object BitBtn1: TBitBtn
    Left = 32
    Top = 192
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 440
    Top = 184
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 6
    Kind = bkClose
  end
end
