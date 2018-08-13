object FormEditChangeRazrGrid: TFormEditChangeRazrGrid
  Left = 324
  Top = 306
  Width = 613
  Height = 347
  Caption = #1058#1072#1073#1083#1080#1094#1072' '#1076#1072#1090' '#1080#1079#1084#1077#1085#1077#1085#1080#1081' '#1089#1090#1072#1074#1086#1082' '#1088#1072#1079#1088#1103#1076#1086#1074
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
    605
    303)
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridCRD: TdxDBGrid
    Left = 8
    Top = 0
    Width = 250
    Height = 265
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'DATEFR'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = DataSourceCRD
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridCRDDATEFR: TdxDBGridDateColumn
      Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1088#1072#1079#1088#1103#1076#1086#1074
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATEFR'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 264
    Width = 240
    Height = 25
    DataSource = DataSourceCRD
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object pFIBDataSetCRD: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_CHANGE_RAZR_GRID'
      'SET '
      '   DATEFR=:DATEFR'
      'WHERE'
      ' DATEFR = :OLD_DATEFR'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_CHANGE_RAZR_GRID'
      'WHERE'
      '  DATEFR = :OLD_DATEFR'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_CHANGE_RAZR_GRID('
      ' DATEFR'
      ')'
      'VALUES('
      ' :DATEFR'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' DATEFR'
      'FROM'
      ' TB_CHANGE_RAZR_GRID '
      ''
      ' WHERE '
      '  TB_CHANGE_RAZR_GRID.DATEFR = :OLD_DATEFR'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' DATEFR'
      'FROM'
      ' TB_CHANGE_RAZR_GRID '
      'ORDER BY DATEFR')
    Transaction = pFIBTransactionCRDRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionCRDWrite
    Left = 16
    Top = 8
    object pFIBDataSetCRDDATEFR: TFIBDateField
      FieldName = 'DATEFR'
    end
  end
  object pFIBTransactionCRDWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 56
    Top = 8
  end
  object pFIBTransactionCRDRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 88
    Top = 8
  end
  object DataSourceCRD: TDataSource
    DataSet = pFIBDataSetCRD
    Left = 120
    Top = 8
  end
end
