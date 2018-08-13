object FormUpdPriType: TFormUpdPriType
  Left = 248
  Top = 174
  Width = 696
  Height = 480
  Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1079#1072#1087#1080#1089#1080' '#1090#1080#1087#1072' '#1087#1088#1080#1082#1072#1079#1072
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
    Left = 76
    Top = 16
    Width = 30
    Height = 20
    Caption = #1050#1086#1076
  end
  object Label2: TLabel
    Left = 32
    Top = 48
    Width = 74
    Height = 20
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
  end
  object Label3: TLabel
    Left = 10
    Top = 80
    Width = 96
    Height = 20
    Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077
  end
  object dxDBEdit1: TdxDBEdit
    Left = 120
    Top = 16
    Width = 89
    Enabled = False
    TabOrder = 0
    DataField = 'ID'
    DataSource = FormBrowsePrikazyTyp.dsoPriType
  end
  object dxDBEdit2: TdxDBEdit
    Left = 120
    Top = 48
    Width = 545
    TabOrder = 1
    DataField = 'NAME'
    DataSource = FormBrowsePrikazyTyp.dsoPriType
  end
  object dxDBMemo1: TdxDBMemo
    Left = 120
    Top = 80
    Width = 545
    TabOrder = 2
    DataField = 'CONTENT'
    DataSource = FormBrowsePrikazyTyp.dsoPriType
    Height = 289
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 400
    Width = 129
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 3
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 160
    Top = 400
    Width = 97
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 4
    Kind = bkClose
  end
end
