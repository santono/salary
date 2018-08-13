object FormMoveGUID: TFormMoveGUID
  Left = 276
  Top = 178
  Width = 696
  Height = 223
  Caption = #1055#1077#1088#1077#1085#1086#1089' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088#1086#1074' '#1074' SQL'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LabelPodr: TLabel
    Left = 8
    Top = 56
    Width = 48
    Height = 13
    Caption = 'LabelPodr'
  end
  object LabelFIO: TLabel
    Left = 8
    Top = 112
    Width = 43
    Height = 13
    Caption = 'LabelFIO'
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 80
    Width = 665
    Height = 21
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 136
    Width = 75
    Height = 25
    Caption = #1055#1077#1088#1077#1085#1077#1089#1090#1080
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 600
    Top = 136
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object pFIBQueryGUID: TpFIBQuery
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    Left = 104
    Top = 8
  end
  object pFIBTransactionGUID: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 144
    Top = 8
  end
end
