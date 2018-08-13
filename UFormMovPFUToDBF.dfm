object FormMovPFUToDBF: TFormMovPFUToDBF
  Left = 192
  Top = 172
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
  object BitBtn1: TBitBtn
    Left = 16
    Top = 104
    Width = 105
    Height = 25
    Caption = #1058#1072#1073#1083#1080#1094#1072' 5'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 584
    Top = 104
    Width = 83
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object BitBtn3: TBitBtn
    Left = 128
    Top = 104
    Width = 105
    Height = 25
    Caption = #1058#1072#1073#1083#1080#1094#1072' 6'
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 240
    Top = 104
    Width = 105
    Height = 25
    Caption = #1058#1072#1073#1083#1080#1094#1072' 7'
    TabOrder = 4
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 352
    Top = 104
    Width = 105
    Height = 25
    Caption = #1058#1072#1073#1083#1080#1094#1072' 8'
    TabOrder = 5
    OnClick = BitBtn5Click
  end
  object BitBtn6: TBitBtn
    Left = 464
    Top = 104
    Width = 113
    Height = 25
    Caption = #1042#1089#1077' '#1090#1072#1073#1083#1080#1094#1099
    TabOrder = 6
    OnClick = BitBtn6Click
  end
  object pFIBQueryPFU: TpFIBQuery
    Transaction = pFIBTransactionPFURead
    Database = FIB.pFIBDatabaseSal
    Left = 192
    Top = 72
  end
  object pFIBTransactionPFURead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 232
    Top = 72
  end
end
