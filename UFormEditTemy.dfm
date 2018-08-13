object FormEditTemy: TFormEditTemy
  Left = 232
  Top = 202
  Width = 696
  Height = 492
  Caption = #1057#1087#1080#1089#1082#1080' '#1093#1086#1079#1088#1072#1089#1095#1077#1090#1085#1099#1093' '#1090#1077#1084
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    688
    448)
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridTemy: TdxDBGrid
    Left = 8
    Top = 8
    Width = 241
    Height = 389
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = DataSourceTemy
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akBottom]
    object dxDBGridTemySHIFRID: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 29
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGridTemyNAME: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 200
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
    object dxDBGridTemyDATEWRK: TdxDBGridDateColumn
      Visible = False
      Width = 160
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATEWRK'
    end
    object dxDBGridTemySHIFRWRK: TdxDBGridMaskColumn
      Visible = False
      Width = 91
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRWRK'
    end
  end
  object DBNavigatorTemy: TDBNavigator
    Left = 8
    Top = 396
    Width = 240
    Height = 25
    DataSource = DataSourceTemy
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object DBNavigatorTK: TDBNavigator
    Left = 256
    Top = 396
    Width = 240
    Height = 25
    DataSource = DataSourceTK
    Anchors = [akLeft, akBottom]
    TabOrder = 2
  end
  object dxDBGridTK: TdxDBGrid
    Left = 256
    Top = 8
    Width = 425
    Height = 389
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'ShifrID'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 3
    DataSource = DataSourceTK
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridTKSHIFRKAF: TdxDBGridCalcColumn
      Caption = #1050#1086#1076
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRKAF'
    end
    object dxDBGridTKNAMEKAF: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAMEKAF'
    end
    object dxDBGridTKShifrID: TdxDBGridColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ShifrID'
    end
    object dxDBGridTKNAMEKLOOKUP: TdxDBGridLookupColumn
      Caption = #1050#1072#1092#1077#1076#1088#1072
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAMEKLOOKUP'
    end
  end
  object BitBtn1: TBitBtn
    Left = 504
    Top = 400
    Width = 113
    Height = 25
    Caption = #1048#1084#1087#1086#1088#1090' '#1090#1077#1084
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object pFIBDataSetTemy: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_TEMY'
      'SET '
      ' NAME = :NAME'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_TEMY'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_TEMY('
      ' SHIFRID,'
      ' NAME'
      ')'
      'VALUES('
      ' :SHIFRID,'
      ' :NAME'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' NAME,'
      ' DATEWRK,'
      ' SHIFRWRK'
      'FROM'
      ' TB_TEMY '
      'WHERE '
      '  TB_TEMY.SHIFRID = :OLD_SHIFRID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' NAME,'
      ' DATEWRK,'
      ' SHIFRWRK'
      'FROM'
      ' TB_TEMY ')
    AutoUpdateOptions.UpdateTableName = 'TB_TEMY'
    AutoUpdateOptions.KeyFields = 'SHIFRID'
    AutoUpdateOptions.GeneratorName = 'GTEMY'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = pFIBTransactionTRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionTWrite
    AutoCommit = True
    Left = 8
    Top = 40
    object pFIBDataSetTemySHIFRID: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'SHIFRID'
      ReadOnly = True
    end
    object pFIBDataSetTemyNAME: TFIBStringField
      DisplayLabel = #1058#1077#1084#1072
      FieldName = 'NAME'
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSetTemyDATEWRK: TFIBDateTimeField
      FieldName = 'DATEWRK'
      ReadOnly = True
    end
    object pFIBDataSetTemySHIFRWRK: TFIBIntegerField
      FieldName = 'SHIFRWRK'
      ReadOnly = True
    end
  end
  object pFIBTransactionTWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 40
    Top = 40
  end
  object pFIBTransactionTRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 72
    Top = 40
  end
  object DataSourceTemy: TDataSource
    DataSet = pFIBDataSetTemy
    Left = 104
    Top = 40
  end
  object DataSourceTK: TDataSource
    DataSet = pFIBDataSetTK
    Left = 424
    Top = 40
  end
  object pFIBDataSetTK: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_TEMY_KAF'
      'SET '
      ' SHIFRKAF = :SHIFRKAF,'
      ' NAMEKAF = :NAMEKAF'
      'WHERE'
      ' SHIFRKAF=:OLD_SHIFRKAF AND SHIFRIDTEMY=:MAS_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_TEMY_KAF'
      'WHERE'
      ' SHIFRIDTEMY = :MAS_SHIFRID AND'
      ' SHIFRKAF    = :OLD_SHIFRKAF'
      '  ')
    InsertSQL.Strings = (
      'INSERT INTO TB_TEMY_KAF('
      ' SHIFRIDTEMY, '
      ' SHIFRKAF,'
      ' NAMEKAF'
      ')'
      'VALUES('
      ' :MAS_SHIFRID, '
      ' :SHIFRKAF,'
      ' :NAMEKAF'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRKAF,'
      ' NAMEKAF'
      'FROM'
      ' TB_TEMY_KAF '
      'WHERE SHIFRIDTEMY=:MAS_SHIFRID'
      'and SHIFRKAF=:OLD_SHIFRKAF')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRKAF,'
      ' NAMEKAF'
      'FROM'
      ' TB_TEMY_KAF '
      'WHERE SHIFRIDTEMY=:MAS_SHIFRID')
    OnCalcFields = pFIBDataSetTKCalcFields
    Transaction = pFIBTransactionTKWrite
    Database = FIB.pFIBDatabaseSal
    AutoCommit = True
    DataSource = DataSourceTemy
    Left = 304
    Top = 40
    object pFIBDataSetTKSHIFRKAF: TFIBIntegerField
      FieldName = 'SHIFRKAF'
    end
    object pFIBDataSetTKNAMEKAF: TFIBStringField
      FieldName = 'NAMEKAF'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBDataSetTKShifrID: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ShifrID'
      Calculated = True
    end
    object pFIBDataSetTKNAMEKLOOKUP: TStringField
      FieldKind = fkLookup
      FieldName = 'NAMEKLOOKUP'
      LookupDataSet = pFIBDataSetPodr
      LookupKeyFields = 'SHIFRPOD'
      LookupResultField = 'NAME'
      KeyFields = 'SHIFRKAF'
      Size = 100
      Lookup = True
    end
  end
  object pFIBTransactionTKWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 344
    Top = 40
  end
  object pFIBTransactionTKRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 384
    Top = 40
  end
  object pFIBDataSetPodr: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRPOD,'
      ' NAME'
      'FROM'
      ' PODR '
      'ORDER BY SHIFRPOD')
    AllowedUpdateKinds = []
    Transaction = pFIBTransactionPodrRead
    Database = FIB.pFIBDatabaseSal
    Left = 304
    Top = 80
    object pFIBDataSetPodrSHIFRPOD: TFIBIntegerField
      FieldName = 'SHIFRPOD'
      ReadOnly = True
    end
    object pFIBDataSetPodrNAME: TFIBStringField
      FieldName = 'NAME'
      ReadOnly = True
      Size = 100
      EmptyStrToNull = True
    end
  end
  object pFIBTransactionPodrRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 344
    Top = 80
  end
  object pFIBQueryT: TpFIBQuery
    Transaction = pFIBTransactionQT
    Database = FIB.pFIBDatabaseSal
    Left = 24
    Top = 112
  end
  object pFIBTransactionQT: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 64
    Top = 112
  end
end
