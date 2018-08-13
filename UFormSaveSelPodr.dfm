object FormSaveSelPodr: TFormSaveSelPodr
  Left = 192
  Top = 172
  Width = 534
  Height = 220
  Caption = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1089#1087#1080#1089#1082#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object LabelName: TLabel
    Left = 8
    Top = 56
    Width = 74
    Height = 20
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 136
    Width = 97
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 248
    Top = 136
    Width = 89
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object EditName: TEdit
    Left = 112
    Top = 56
    Width = 401
    Height = 28
    TabOrder = 2
    Text = 'EditName'
  end
  object pFIBQuerySave: TpFIBQuery
    Transaction = pFIBTransactionSave
    Database = FIB.pFIBDatabaseSal
    Left = 24
    Top = 16
  end
  object pFIBTransactionSave: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 64
    Top = 16
  end
end
