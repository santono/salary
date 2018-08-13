object FormEditSelPodrList: TFormEditSelPodrList
  Left = 192
  Top = 172
  Width = 696
  Height = 480
  Caption = #1057#1087#1080#1089#1082#1080' '#1074#1099#1073#1086#1088#1072' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  DesignSize = (
    688
    436)
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridSelWidPodr: TdxDBGrid
    Left = 8
    Top = 8
    Width = 273
    Height = 113
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = DataSourceSelWidPodr
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    object dxDBGridSelWidPodrSHIFRID: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 31
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGridSelWidPodrNAME: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Sorted = csUp
      Width = 238
      BandIndex = 0
      RowIndex = 0
      FieldName = #1053#1072#1079#1074#1072#1085#1080#1077
    end
  end
  object dxDBGridSelNameHat: TdxDBGrid
    Left = 8
    Top = 128
    Width = 273
    Height = 281
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 1
    DataSource = DataSourceSelPodrName
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akBottom]
    object dxDBGridSelNameHatSHIFRID: TdxDBGridMaskColumn
      Caption = #1050#1086#1076
      Sorted = csUp
      Width = 39
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGridSelNameHatNAME: TdxDBGridMaskColumn
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      HeaderAlignment = taCenter
      Width = 230
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
  end
  object dxDBGridSelPodr: TdxDBGrid
    Left = 288
    Top = 8
    Width = 393
    Height = 401
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 2
    Filter.Criteria = {00000000}
  end
  object pFIBDataSetSelWidPodr: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' NAME'
      'FROM'
      ' TB_WIDY_PODR_SELECTION ')
    Transaction = FIB.pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = FIB.pFIBTransactionSAL
    Left = 24
    Top = 16
    object pFIBDataSetSelWidPodrSHIFRID: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'SHIFRID'
    end
    object pFIBDataSetSelWidPodrNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 128
      EmptyStrToNull = True
    end
  end
  object pFIBTransactionSelWidPodr: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 64
    Top = 16
  end
  object DataSourceSelWidPodr: TDataSource
    DataSet = pFIBDataSetSelWidPodr
    Left = 96
    Top = 16
  end
  object pFIBDataSetSelPodrName: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_NAME_PODR_SELECTION_DET'
      'SET '
      ' NAME = :NAME'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_NAME_PODR_SELECTION_DET'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_NAME_PODR_SELECTION_DET('
      ' SHIFRID,'
      ' SHIFRIDOWNER, '
      ' NAME'
      ')'
      'VALUES('
      ' :SHIFRID,'
      ' :MAS_SHIFRIDOWNER,'
      ' :NAME'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '      SHIFRID,'
      '      NAME'
      'FROM'
      '      TB_NAME_PODR_SELECTION_DET '
      'WHERE(  '
      ' TB_NAME_PODR_SELECTION_DET.SHIFRIDOWNER=:MAS_SHIFRID'
      '  ) and (  TB_NAME_PODR_SELECTION_DET.SHIFRID = :OLD_SHIFRID'
      '  )'
      '  ')
    SelectSQL.Strings = (
      'SELECT'
      '      SHIFRID,'
      '      NAME'
      'FROM'
      '      TB_NAME_PODR_SELECTION_DET '
      'WHERE '
      ' TB_NAME_PODR_SELECTION_DET.SHIFRIDOWNER=:MAS_SHIFRID ')
    Transaction = FIB.pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionSelPodrName
    DataSource = DataSourceSelWidPodr
    Left = 16
    Top = 144
    object pFIBDataSetSelPodrNameSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object pFIBDataSetSelPodrNameNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 128
      EmptyStrToNull = True
    end
  end
  object pFIBTransactionSelPodrName: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 56
    Top = 144
  end
  object DataSourceSelPodrName: TDataSource
    DataSet = pFIBDataSetSelPodrName
    Left = 96
    Top = 144
  end
  object pFIBDataSetSelPodr: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_PODR_SELECTION_LIST'
      'SET '
      ' SHIFRPOD = :SHIFRPOD'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_PODR_SELECTION_LIST'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_PODR_SELECTION_LIST('
      ' SHIFRID,'
      ' SHIFRPOD,'
      ' SHIFRIDOWNER'
      ')'
      'VALUES('
      ' :SHIFRID,'
      ' :SHIFRPOD,'
      ' :MAS_SHIFRID'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' SHIFRPOD'
      'FROM'
      ' TB_PODR_SELECTION_LIST '
      'WHERE  '
      '   TB_PODR_SELECTION_LIST.SHIFRID = :OLD_SHIFRID'
      '  '
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' SHIFRPOD'
      'FROM'
      ' TB_PODR_SELECTION_LIST '
      'WHERE '
      '  SHIFRIDOWNER=:MAS_SHIFRID'
      'ORDER BY SHIFRPOD')
    Transaction = FIB.pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionSelPodr
    DataSource = DataSourceSelPodrName
    Left = 312
    Top = 72
    object pFIBDataSetSelPodrSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object pFIBDataSetSelPodrSHIFRPOD: TFIBIntegerField
      FieldName = 'SHIFRPOD'
    end
  end
  object pFIBTransactionSelPodr: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 352
    Top = 72
  end
  object DataSource1: TDataSource
    Left = 384
    Top = 72
  end
end
