object FormInfProc: TFormInfProc
  Left = 240
  Top = 174
  Width = 327
  Height = 480
  Caption = #1055#1088#1086#1094#1077#1085#1090#1099' '#1080#1085#1092#1083#1103#1094#1080#1080
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
    319
    433)
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridIP: TdxDBGrid
    Left = 8
    Top = 8
    Width = 297
    Height = 385
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'DATA'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = DataSourceIP
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridIPColumn1: TdxDBGridDateColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATA'
    end
    object dxDBGridIPProc: TdxDBGridCalcColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'PROCINF'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 400
    Width = 240
    Height = 25
    DataSource = DataSourceIP
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object pFIBDataSetIP: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_INFPROC'
      'SET '
      ' PROCINF = :PROCINF,'
      ' DATA    = :DATA'
      'WHERE'
      ' DATA = :OLD_DATA'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_INFPROC'
      'WHERE'
      '  DATA = :OLD_DATA'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_INFPROC('
      ' DATA,'
      ' PROCINF'
      ')'
      'VALUES('
      ' :DATA,'
      ' :PROCINF'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' DATA,'
      ' PROCINF'
      'FROM'
      ' TB_INFPROC '
      ''
      ' WHERE '
      '  TB_INFPROC.DATA = :OLD_DATA'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' DATA,'
      ' PROCINF'
      'FROM'
      ' TB_INFPROC ')
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 152
    Top = 248
    object pFIBDataSetIPDATA: TFIBDateField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DATA'
    end
    object pFIBDataSetIPPROCINF: TFIBBCDField
      DisplayLabel = '% '#1080#1085#1092#1083#1103#1094#1080#1080
      FieldName = 'PROCINF'
      Size = 2
      RoundByScale = True
    end
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
    Left = 192
    Top = 248
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 232
    Top = 248
  end
  object DataSourceIP: TDataSource
    DataSet = pFIBDataSetIP
    Left = 272
    Top = 248
  end
end
