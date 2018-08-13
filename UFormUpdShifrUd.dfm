object FormUpdShifrUd: TFormUpdShifrUd
  Left = 223
  Top = 164
  Width = 791
  Height = 264
  Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1079#1072#1087#1080#1089#1080' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 90
    Top = 28
    Width = 30
    Height = 20
    Caption = #1050#1086#1076
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 113
    Height = 20
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object Label3: TLabel
    Left = 41
    Top = 90
    Width = 83
    Height = 20
    Caption = #1057#1086#1082#1088'.'#1085#1072#1080#1084'.'
  end
  object Label4: TLabel
    Left = 12
    Top = 123
    Width = 110
    Height = 20
    Caption = #1053#1072#1080#1084'.'#1076'. '#1089#1074#1086#1076#1072
  end
  object dxDBEdit1: TdxDBEdit
    Left = 128
    Top = 56
    Width = 577
    TabOrder = 0
    DataField = 'NAME'
    DataSource = FormEditShifr.DataSourceUd
  end
  object dxDBCalcEdit1: TdxDBCalcEdit
    Left = 128
    Top = 24
    Width = 121
    TabOrder = 1
    DataField = 'SHIFR'
    DataSource = FormEditShifr.DataSourceUd
  end
  object dxDBEdit2: TdxDBEdit
    Left = 128
    Top = 88
    Width = 289
    TabOrder = 2
    DataField = 'SHORTNAME'
    DataSource = FormEditShifr.DataSourceUd
  end
  object dxDBEdit3: TdxDBEdit
    Left = 128
    Top = 120
    Width = 169
    TabOrder = 3
    DataField = 'NAMEFORSWOD'
    DataSource = FormEditShifr.DataSourceUd
  end
  object BitBtnSave: TBitBtn
    Left = 24
    Top = 168
    Width = 121
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 4
    OnClick = BitBtnSaveClick
  end
  object BitBtnClose: TBitBtn
    Left = 488
    Top = 168
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 5
    Kind = bkClose
  end
end
