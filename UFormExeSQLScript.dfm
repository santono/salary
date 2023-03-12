object FormExeSQLScript: TFormExeSQLScript
  Left = 225
  Top = 150
  Width = 526
  Height = 294
  Caption = #1042#1099#1087#1086#1083#1085#1077#1085#1080#1077' SQL '#1089#1082#1088#1080#1087#1090#1072
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
  object BitBtn1: TBitBtn
    Left = 8
    Top = 40
    Width = 161
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1089#1082#1088#1080#1087#1090
    TabOrder = 0
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 72
    Width = 489
    Height = 17
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 8
    Top = 96
    Width = 489
    Height = 145
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object trExec: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 248
    Top = 16
  end
  object qExec: TpFIBQuery
    Transaction = trExec
    Database = FIB.pFIBDatabaseSal
    Left = 184
    Top = 16
  end
  object FIBSQLLogger1: TFIBSQLLogger
    LogFileName = 'FIBLog.log'
    ForceSaveLog = False
    Left = 296
    Top = 16
  end
end
