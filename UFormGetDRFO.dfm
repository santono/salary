object FormGetDRFO: TFormGetDRFO
  Left = 192
  Top = 172
  Width = 696
  Height = 204
  Caption = #1048#1084#1087#1086#1088#1090' DRFO'
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
    Left = 16
    Top = 16
    Width = 48
    Height = 20
    Caption = 'Label1'
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 120
    Width = 113
    Height = 25
    Caption = #1055#1077#1088#1077#1085#1077#1089#1090#1080
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 552
    Top = 120
    Width = 115
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object ProgressBarDRFO: TProgressBar
    Left = 16
    Top = 48
    Width = 641
    Height = 21
    TabOrder = 2
  end
  object OpenDialogDRFO: TOpenDialog
    Left = 168
    Top = 120
  end
  object pFIBTransactionDRFO: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 208
    Top = 120
  end
  object pFIBQueryDRFO: TpFIBQuery
    Transaction = pFIBTransactionDRFO
    Database = FIB.pFIBDatabaseSal
    Left = 248
    Top = 120
  end
end
