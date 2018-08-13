object FormMoveOtpHelp2010: TFormMoveOtpHelp2010
  Left = 214
  Top = 172
  Width = 696
  Height = 226
  Caption = #1055#1077#1088#1077#1085#1086#1089' '#1087#1088#1077#1084#1080#1080' '#1074#1084#1077#1089#1090#1086' '#1086#1090#1087#1091#1089#1085#1099#1093' '#1079#1072' 2010'
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
  object LabelMon: TLabel
    Left = 32
    Top = 8
    Width = 70
    Height = 20
    Caption = 'LabelMon'
  end
  object LabelPodr: TLabel
    Left = 32
    Top = 56
    Width = 72
    Height = 20
    Caption = 'LabelPodr'
  end
  object ProgressBarMonth: TProgressBar
    Left = 32
    Top = 32
    Width = 617
    Height = 21
    TabOrder = 0
  end
  object ProgressBarP: TProgressBar
    Left = 32
    Top = 80
    Width = 617
    Height = 21
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 56
    Top = 128
    Width = 145
    Height = 25
    Caption = #1053#1072#1095#1072#1090#1100' '#1087#1077#1088#1077#1085#1086#1089
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 552
    Top = 120
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 3
    Kind = bkClose
  end
  object pFIBQueryOtp: TpFIBQuery
    Transaction = pFIBTransactionOtpR
    Database = FIB.pFIBDatabaseSal
    Left = 112
    Top = 40
  end
  object pFIBTransactionOtpR: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 152
    Top = 40
  end
end
