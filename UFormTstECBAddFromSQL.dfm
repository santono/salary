object FormTstECBAddFromSQL: TFormTstECBAddFromSQL
  Left = 192
  Top = 142
  Width = 696
  Height = 123
  Caption = #1040#1085#1072#1083#1080#1079' '#1076#1072#1085#1085#1099#1093' '#1080#1079' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
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
  object LabelFIO: TLabel
    Left = 8
    Top = 40
    Width = 4
    Height = 20
    Caption = ' '
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 8
    Width = 673
    Height = 21
    TabOrder = 0
  end
  object pFIBQuery: TpFIBQuery
    Transaction = pFIBTransaction
    Database = FIB.pFIBDatabaseSal
    Left = 344
    Top = 32
  end
  object pFIBTransaction: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 384
    Top = 32
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 424
    Top = 32
  end
end
