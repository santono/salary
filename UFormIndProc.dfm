object FormIndProc: TFormIndProc
  Left = 262
  Top = 169
  Width = 696
  Height = 480
  Caption = #1055#1088#1086#1094#1077#1085#1090#1099' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080' '#1086#1090' '#1073#1072#1079#1086#1074#1099#1093' '#1076#1072#1090
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    688
    442)
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridProc: TdxDBGrid
    Left = 8
    Top = 8
    Width = 673
    Height = 401
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'DATAB'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = DataSourceProc
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridProcDATAB: TdxDBGridDateColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATAB'
    end
    object dxDBGridProcKOEF: TdxDBGridCalcColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'KOEF'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 408
    Width = 240
    Height = 25
    DataSource = DataSourceProc
    TabOrder = 1
  end
  object pFIBDataSetProc: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_PROC_IND_KOE'
      'SET '
      ' KOEF = :KOEF'
      'WHERE'
      ' DATAB = :OLD_DATAB'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_PROC_IND_KOE'
      'WHERE'
      '  DATAB = :OLD_DATAB'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_PROC_IND_KOE('
      ' DATAB,'
      ' KOEF'
      ')'
      'VALUES('
      ' :DATAB,'
      ' :KOEF'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' DATAB,'
      ' KOEF'
      'FROM'
      ' TB_PROC_IND_KOE '
      ''
      ' WHERE '
      '  TB_PROC_IND_KOE.DATAB = :OLD_DATAB'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' DATAB,'
      ' KOEF'
      'FROM'
      ' TB_PROC_IND_KOE ')
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 16
    Top = 8
    object pFIBDataSetProcDATAB: TFIBDateField
      DisplayLabel = #1041#1072#1079#1086#1074#1072#1103' '#1076#1072#1090#1072
      FieldName = 'DATAB'
    end
    object pFIBDataSetProcKOEF: TFIBBCDField
      DisplayLabel = #1055#1088#1086#1094#1077#1085#1090' (>1)'
      FieldName = 'KOEF'
      Size = 4
      RoundByScale = True
    end
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 16
    Top = 40
  end
  object pFIBTransactionRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 16
    Top = 72
  end
  object DataSourceProc: TDataSource
    DataSet = pFIBDataSetProc
    Left = 72
    Top = 64
  end
end
