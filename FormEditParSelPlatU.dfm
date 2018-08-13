object FormEditParSelPlat: TFormEditParSelPlat
  Left = 240
  Top = 164
  Width = 696
  Height = 482
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1074#1099#1073#1086#1088#1072' '#1087#1083#1072#1090#1077#1078#1085#1099#1093' '#1074#1077#1076#1086#1084#1086#1089#1090#1077#1081
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
    438)
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridSPP: TdxDBGrid
    Left = 8
    Top = 8
    Width = 673
    Height = 401
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = DataSourceSPP
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCanAppend, edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridSPPSHIFRID: TdxDBGridMaskColumn
      Visible = False
      Width = 39
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGridSPPSHIFRPODLIST: TdxDBGridMaskColumn
      Visible = False
      Width = 50
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRPODLIST'
    end
    object dxDBGridSPPSHIFRGRULIST: TdxDBGridMaskColumn
      Caption = #1057#1095#1077#1090#1072
      Visible = False
      Width = 50
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRGRULIST'
    end
    object dxDBGridSPPMODE_U_K: TdxDBGridCheckColumn
      Caption = #1050#1083#1076#1078
      Width = 73
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MODE_U_K'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridSPPNAME: TdxDBGridMaskColumn
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      Sorted = csUp
      Width = 289
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
    object dxDBGridSPPSHIFRSTA: TdxDBGridCalcColumn
      Caption = #1064#1092#1088
      Width = 44
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRSTA'
    end
    object dxDBGridSPPNAMESTA: TdxDBGridLookupColumn
      Caption = #1057#1090#1072#1090#1100#1103
      Width = 113
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAMESTA'
    end
    object dxDBGridSPPNAMEPOD: TdxDBGridLookupColumn
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
      Width = 90
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAMEPOD'
    end
    object dxDBGridSPPNAMEGRU: TdxDBGridLookupColumn
      Caption = #1057#1095#1077#1090#1072
      Width = 60
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAMEGRU'
    end
  end
  object DBNavigatorSPP: TDBNavigator
    Left = 8
    Top = 408
    Width = 240
    Height = 25
    DataSource = DataSourceSPP
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object pFIBDataSetSPP: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_SEL_PAR_PLAT'
      'SET '
      ' SHIFRPODLIST = :SHIFRPODLIST,'
      ' SHIFRGRULIST = :SHIFRGRULIST,'
      ' SHIFRSTA = :SHIFRSTA,'
      ' MODE_U_K = :MODE_U_K,'
      ' NAME = :NAME'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_SEL_PAR_PLAT'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_SEL_PAR_PLAT('
      ' SHIFRID,'
      ' SHIFRPODLIST,'
      ' SHIFRGRULIST,'
      ' SHIFRSTA,'
      ' MODE_U_K,'
      ' NAME'
      ')'
      'VALUES('
      ' :SHIFRID,'
      ' :SHIFRPODLIST,'
      ' :SHIFRGRULIST,'
      ' :SHIFRSTA,'
      ' :MODE_U_K,'
      ' :NAME'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' SHIFRPODLIST,'
      ' SHIFRGRULIST,'
      ' SHIFRSTA,'
      ' MODE_U_K,'
      ' NAME'
      'FROM'
      ' TB_SEL_PAR_PLAT '
      ''
      ' WHERE '
      '  TB_SEL_PAR_PLAT.SHIFRID = :OLD_SHIFRID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' SHIFRPODLIST,'
      ' SHIFRGRULIST,'
      ' SHIFRSTA,'
      ' MODE_U_K,'
      ' NAME'
      'FROM'
      ' TB_SEL_PAR_PLAT '
      'order by shifrid')
    AutoUpdateOptions.UpdateTableName = 'TB_SEL_PAR_PLAT'
    AutoUpdateOptions.KeyFields = 'SHIFRID'
    AutoUpdateOptions.GeneratorName = 'G_S_P_P'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    BeforeInsert = pFIBDataSetSPPBeforeInsert
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionRW
    AutoCommit = True
    Left = 16
    Top = 24
    object pFIBDataSetSPPSHIFRID: TFIBSmallIntField
      FieldName = 'SHIFRID'
    end
    object pFIBDataSetSPPSHIFRPODLIST: TFIBIntegerField
      FieldName = 'SHIFRPODLIST'
    end
    object pFIBDataSetSPPSHIFRGRULIST: TFIBIntegerField
      FieldName = 'SHIFRGRULIST'
    end
    object pFIBDataSetSPPSHIFRSTA: TFIBIntegerField
      FieldName = 'SHIFRSTA'
    end
    object pFIBDataSetSPPMODE_U_K: TFIBSmallIntField
      FieldName = 'MODE_U_K'
      MaxValue = 1
    end
    object pFIBDataSetSPPNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 80
      EmptyStrToNull = True
    end
    object pFIBDataSetSPPNAMESTA: TFIBStringField
      FieldKind = fkLookup
      FieldName = 'NAMESTA'
      LookupDataSet = pFIBDataSetShifry
      LookupKeyFields = 'SHIFR'
      LookupResultField = 'NAME'
      KeyFields = 'SHIFRSTA'
      Size = 80
      EmptyStrToNull = True
      Lookup = True
    end
    object pFIBDataSetSPPNAMEPOD: TFIBStringField
      FieldKind = fkLookup
      FieldName = 'NAMEPOD'
      LookupDataSet = pFIBDataSetPodrList
      LookupKeyFields = 'SHIFRID'
      LookupResultField = 'NAME'
      KeyFields = 'SHIFRPODLIST'
      Size = 80
      EmptyStrToNull = True
      Lookup = True
    end
    object pFIBDataSetSPPNAMEGRU: TFIBStringField
      FieldKind = fkLookup
      FieldName = 'NAMEGRU'
      LookupDataSet = pFIBDataSetGruList
      LookupKeyFields = 'SHIFRID'
      LookupResultField = 'NAME'
      KeyFields = 'SHIFRGRULIST'
      Size = 80
      EmptyStrToNull = True
      Lookup = True
    end
  end
  object pFIBDataSetShifry: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFR,'
      ' NAME'
      'FROM'
      ' SHIFR '
      'WHERE'
      ' MODE=0'
      'ORDER BY SHIFR')
    AllowedUpdateKinds = []
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionRW
    Left = 16
    Top = 64
    object pFIBDataSetShifrySHIFR: TFIBIntegerField
      FieldName = 'SHIFR'
    end
    object pFIBDataSetShifryNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 52
      EmptyStrToNull = True
    end
  end
  object pFIBDataSetPodrList: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' NAME'
      'FROM'
      ' TB_NAME_PODR_SELECTION_DET '
      'WHERE '
      '  SHIFRIDOWNER=1'
      'ORDER BY 1')
    AllowedUpdateKinds = []
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionRW
    Left = 16
    Top = 104
    object pFIBDataSetPodrListSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object pFIBDataSetPodrListNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 128
      EmptyStrToNull = True
    end
  end
  object pFIBDataSetGruList: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' NAME'
      'FROM'
      ' TB_NAME_PODR_SELECTION_DET '
      'WHERE '
      '  SHIFRIDOWNER=2'
      'ORDER BY 1')
    AllowedUpdateKinds = []
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionRW
    Left = 16
    Top = 144
    object pFIBDataSetGruListSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object pFIBDataSetGruListNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 128
      EmptyStrToNull = True
    end
  end
  object pFIBTransactionRW: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 64
    Top = 24
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
    Left = 64
    Top = 64
  end
  object DataSourceSPP: TDataSource
    DataSet = pFIBDataSetSPP
    Left = 104
    Top = 24
  end
end
