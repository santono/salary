object FormMoveIskra: TFormMoveIskra
  Left = 281
  Top = 231
  Width = 531
  Height = 326
  Caption = #1055#1077#1088#1074#1086#1085#1072#1095#1072#1083#1100#1085#1086#1077' '#1085#1072#1087#1086#1083#1085#1077#1085#1080#1077' '#1048#1057#1050#1056#1067
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 152
    Width = 75
    Height = 25
    Caption = #1055#1077#1088#1077#1085#1086#1089
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 328
    Top = 152
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object BitBtn3: TBitBtn
    Left = 104
    Top = 152
    Width = 201
    Height = 25
    Caption = #1063#1080#1089#1090#1082#1072' 3-'#1075#1086' '#1080' 82 '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
    TabOrder = 2
    OnClick = BitBtn3Click
  end
  object btn1: TBitBtn
    Left = 104
    Top = 184
    Width = 201
    Height = 25
    Caption = #1063#1080#1089#1090#1082#1072' '#1048#1089#1082#1088#1099
    TabOrder = 3
    OnClick = btn1Click
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 144
    Top = 32
  end
  object pFIBQuery1: TpFIBQuery
    Transaction = pFIBTransaction1
    Database = FIB.pFIBDatabaseSal
    Left = 96
    Top = 32
  end
end
