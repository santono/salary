object FormMonthForGener: TFormMonthForGener
  Left = 288
  Top = 197
  Width = 520
  Height = 307
  Caption = #1050#1072#1083#1077#1085#1076#1072#1088#1100
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
  DesignSize = (
    504
    269)
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 40
    Top = 8
    Width = 104
    Height = 20
    Caption = #1056#1072#1073#1086#1095#1080#1093' '#1076#1085#1077#1081
  end
  object LabelRDay: TLabel
    Left = 152
    Top = 8
    Width = 12
    Height = 20
    Caption = '   '
  end
  object StringGridMPr: TStringGrid
    Left = 16
    Top = 32
    Width = 465
    Height = 185
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 7
    FixedCols = 0
    RowCount = 7
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing]
    TabOrder = 0
    OnDblClick = StringGridMPrDblClick
    OnDrawCell = StringGridMPrDrawCell
    OnSelectCell = StringGridMPrSelectCell
    RowHeights = (
      24
      24
      24
      24
      24
      24
      24)
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 232
    Width = 153
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1041#1044
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 392
    Top = 232
    Width = 89
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object BitBtn3: TBitBtn
    Left = 184
    Top = 232
    Width = 193
    Height = 25
    Caption = #1057#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object EditWorkClock: TEdit
    Left = 328
    Top = 0
    Width = 121
    Height = 28
    TabOrder = 4
    Text = '0'
  end
  object UpDownWorkClock: TUpDown
    Left = 449
    Top = 0
    Width = 16
    Height = 28
    Associate = EditWorkClock
    Max = 248
    TabOrder = 5
    OnChanging = UpDownWorkClockChanging
  end
  object DataSource1: TDataSource
    Left = 120
    Top = 112
  end
  object pFIBDataSetMPr: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_MONTHS_PR'
      'SET '
      ' CODE = :CODE'
      'WHERE'
      ' DATEFR = :OLD_DATEFR'
      ' and NB_DAY = :OLD_NB_DAY'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_MONTHS_PR'
      'WHERE'
      '  DATEFR = :OLD_DATEFR'
      ' and NB_DAY = :OLD_NB_DAY'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_MONTHS_PR('
      ' DATEFR,'
      ' NB_DAY,'
      ' CODE'
      ')'
      'VALUES('
      ' :DATEFR,'
      ' :NB_DAY,'
      ' :CODE'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' DATEFR,'
      ' NB_DAY,'
      ' CODE'
      'FROM'
      ' TB_MONTHS_PR '
      'WHERE'
      '   (  TB_MONTHS_PR.DATEFR = :OLD_DATEFR'
      ' and TB_MONTHS_PR.NB_DAY = :OLD_NB_DAY'
      '  )'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' DATEFR,'
      ' NB_DAY,'
      ' CODE'
      'FROM'
      ' TB_MONTHS_PR '
      'WHERE DATEFR=:DATEFR'
      'ORDER BY NB_DAY')
    Transaction = pFIBTransactionMPr
    Database = FIB.pFIBDatabaseSal
    Left = 40
    Top = 112
    object pFIBDataSetMPrDATEFR: TFIBDateField
      FieldName = 'DATEFR'
    end
    object pFIBDataSetMPrNB_DAY: TFIBSmallIntField
      FieldName = 'NB_DAY'
    end
    object pFIBDataSetMPrCODE: TFIBSmallIntField
      FieldName = 'CODE'
    end
  end
  object pFIBTransactionMPr: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 80
    Top = 112
  end
  object pFIBQueryMPr: TpFIBQuery
    Transaction = pFIBTransactionMPr
    Database = FIB.pFIBDatabaseSal
    Left = 48
    Top = 152
  end
end
