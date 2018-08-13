object FormMovECBtoDBF: TFormMovECBtoDBF
  Left = 257
  Top = 285
  Width = 696
  Height = 185
  Caption = #1055#1077#1088#1077#1085#1086#1089' '#1076#1072#1085#1085#1099#1093' '#1087#1077#1088#1089#1086#1085#1086#1092#1080#1082#1072#1094#1080#1080' '#1074' DBF'
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
  object LabelUp: TLabel
    Left = 16
    Top = 8
    Width = 60
    Height = 20
    Caption = 'LabelUp'
  end
  object LabelDown: TLabel
    Left = 16
    Top = 72
    Width = 80
    Height = 20
    Caption = 'LabelDown'
  end
  object ProgressBarPFU: TProgressBar
    Left = 16
    Top = 40
    Width = 649
    Height = 21
    TabOrder = 0
  end
  object BitBtn2: TBitBtn
    Left = 584
    Top = 104
    Width = 83
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object BitBtn6: TBitBtn
    Left = 16
    Top = 104
    Width = 113
    Height = 25
    Caption = #1042#1089#1077' '#1090#1072#1073#1083#1080#1094#1099
    TabOrder = 2
    OnClick = BitBtn6Click
  end
  object pFIBQueryECB: TpFIBQuery
    Transaction = pFIBTransactionECBRead
    Database = FIB.pFIBDatabaseSal
    Left = 192
    Top = 72
  end
  object pFIBTransactionECBRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 232
    Top = 72
  end
end
