object FormNotUkr: TFormNotUkr
  Left = 232
  Top = 222
  Width = 696
  Height = 480
  Caption = #1055#1077#1088#1077#1083#1110#1082' '#1085#1077' '#1075#1088#1086#1084#1072#1076#1103#1085' '#1059#1082#1088#1072#1111#1085#1080
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
    436)
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridNU: TdxDBGrid
    Left = 8
    Top = 8
    Width = 665
    Height = 393
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'TABNO'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = DataSourceNU
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridNUTABNO: TdxDBGridMaskColumn
      Caption = #1058' '#1085#1086#1084
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
    end
    object dxDBGridNUFIO: TdxDBGridPickColumn
      Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048' '#1054
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
      OnEditButtonClick = dxDBGridNUFIOEditButtonClick
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 408
    Width = 240
    Height = 25
    DataSource = DataSourceNU
    Anchors = [akLeft]
    TabOrder = 1
  end
  object pFIBDataSetNU: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_NOTUKRGROMAD'
      'SET '
      ' FIO = :FIO'
      'WHERE'
      ' TABNO = :OLD_TABNO'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_NOTUKRGROMAD'
      'WHERE'
      '  TABNO = :OLD_TABNO'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_NOTUKRGROMAD('
      ' TABNO,'
      ' FIO'
      ')'
      'VALUES('
      ' :TABNO,'
      ' :FIO'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' TABNO,'
      ' FIO'
      'FROM'
      ' TB_NOTUKRGROMAD '
      ''
      ' WHERE '
      '  TB_NOTUKRGROMAD.TABNO = :OLD_TABNO'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' TABNO,'
      ' FIO'
      'FROM'
      ' TB_NOTUKRGROMAD ')
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 16
    Top = 16
    object pFIBDataSetNUTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object pFIBDataSetNUFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 50
      EmptyStrToNull = True
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
    Left = 16
    Top = 56
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 56
    Top = 56
  end
  object DataSourceNU: TDataSource
    DataSet = pFIBDataSetNU
    Left = 56
    Top = 16
  end
end
