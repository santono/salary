object FormSwodSS: TFormSwodSS
  Left = 192
  Top = 172
  Width = 569
  Height = 190
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1089#1074#1086#1076#1072' '#1087#1086' '#1089#1086#1094'.'#1089#1090#1088#1072#1093#1091
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
  object ProgressBar: TProgressBar
    Left = 24
    Top = 24
    Width = 489
    Height = 21
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 64
    Width = 489
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1074#1086#1076
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 24
    Top = 104
    Width = 489
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object pFIBTransactionQ: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 528
    Top = 8
  end
  object pFIBQueryQ: TpFIBQuery
    Transaction = pFIBTransactionQ
    Database = FIB.pFIBDatabaseSal
    Left = 528
    Top = 40
  end
end
