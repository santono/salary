object FormEditGruppy: TFormEditGruppy
  Left = 221
  Top = 181
  Width = 779
  Height = 521
  Caption = #1048#1089#1090#1086#1095#1085#1080#1082#1080' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
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
    763
    483)
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridGru: TdxDBGrid
    Left = 8
    Top = 8
    Width = 756
    Height = 441
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFR'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = DataSourceGru
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridGruSHIFR: TdxDBGridMaskColumn
      Caption = #1064#1092#1088
      Width = 48
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFR'
    end
    object dxDBGridGruNAME: TdxDBGridMaskColumn
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      Width = 95
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
    object dxDBGridGruName_Plat: TdxDBGridColumn
      Caption = #1055#1083#1090
      HeaderAlignment = taCenter
      Width = 51
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME_PLAT'
    end
    object dxDBGridGruMO_BUD: TdxDBGridCheckColumn
      Caption = #1041#1091#1076
      HeaderAlignment = taCenter
      MinWidth = 20
      Width = 51
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MO_BUD'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridGruMO_VNE: TdxDBGridCheckColumn
      Caption = #1042#1085#1077
      HeaderAlignment = taCenter
      MinWidth = 20
      Width = 51
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MO_VNE'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridGruMO_KOL_BUD: TdxDBGridCheckColumn
      Caption = #1050#1073#1091#1076
      HeaderAlignment = taCenter
      MinWidth = 20
      Width = 51
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MO_KOL_BUD'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridGruMO_KOL_VNE: TdxDBGridCheckColumn
      Caption = #1050#1074#1085#1077
      HeaderAlignment = taCenter
      MinWidth = 20
      Width = 51
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MO_KOL_VNE'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridGruMO_GN: TdxDBGridCheckColumn
      Caption = #1043#1053
      HeaderAlignment = taCenter
      MinWidth = 20
      Width = 51
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MO_GN'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridGruMO_NIS: TdxDBGridCheckColumn
      Caption = #1053#1048#1057
      MinWidth = 20
      Width = 51
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MO_NIS'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridGruMO_MAG_BUD: TdxDBGridCheckColumn
      Caption = #1052#1073#1091#1076
      MinWidth = 20
      Width = 51
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MO_MAG_BUD'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridGruMO_MAG_VNE: TdxDBGridCheckColumn
      Caption = #1052#1074#1085#1077
      HeaderAlignment = taCenter
      MinWidth = 20
      Width = 51
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MO_MAG_VNE'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridGruMO_MP: TdxDBGridCheckColumn
      Caption = #1052#1055
      HeaderAlignment = taCenter
      Width = 81
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MO_MP'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridGruActive: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ACTIVE'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridGruName_GRUM: TdxDBGridLookupColumn
      Caption = #1043#1088#1091#1087#1087#1072
      HeaderAlignment = taCenter
      Width = 69
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME_GRUM'
      ListFieldIndex = -1
    end
  end
  object DBNavigatorGru: TDBNavigator
    Left = 16
    Top = 448
    Width = 240
    Height = 25
    DataSource = DataSourceGru
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 683
    Top = 448
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object pFIBDataSetGru: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE GRUPPY'
      'SET '
      '    SHIFR      = :SHIFR,'
      '    NAME       = :NAME,'
      '    NAME_PLAT  = :NAME_PLAT,'
      '    MO_BUD     = :MO_BUD,'
      '    MO_VNE     = :MO_VNE,'
      '    MO_KOL_BUD = :MO_KOL_BUD,'
      '    MO_KOL_VNE = :MO_KOL_VNE,'
      '    MO_GN      = :MO_GN,'
      '    MO_NIS     = :MO_NIS,'
      '    MO_MAG_BUD = :MO_MAG_BUD,'
      '    MO_MAG_VNE = :MO_MAG_VNE,'
      '    MO_MP      = :MO_MP,'
      '    SHIFRGRUM  = :SHIFRGRUM,'
      '    ACTIVE     = :ACTIVE'
      'WHERE'
      '    SHIFR = :OLD_SHIFR'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    GRUPPY'
      'WHERE'
      '        SHIFR = :OLD_SHIFR'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO GRUPPY('
      '    SHIFR,'
      '    NAME,'
      '    NAME_PLAT,'
      '    MO_BUD,'
      '    MO_VNE,'
      '    MO_KOL_BUD,'
      '    MO_KOL_VNE,'
      '    MO_GN,'
      '    MO_NIS,'
      '    MO_MAG_BUD,'
      '    MO_MAG_VNE,'
      '    MO_MP,'
      '    SHIFRGRUM,'
      '    ACTIVE'
      ')'
      'VALUES('
      '    :SHIFR,'
      '    :NAME,'
      '    :NAME_PLAT,'
      '    :MO_BUD,'
      '    :MO_VNE,'
      '    :MO_KOL_BUD,'
      '    :MO_KOL_VNE,'
      '    :MO_GN,'
      '    :MO_NIS,'
      '    :MO_MAG_BUD,'
      '    :MO_MAG_VNE,'
      '    :MO_MP,'
      '    :SHIFRGRUM,'
      '    :ACTIVE'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    GRU.SHIFR,'
      '    GRU.NAME,'
      '    GRU.NAME_PLAT,'
      '    GRU.MO_BUD,'
      '    GRU.MO_VNE,'
      '    GRU.MO_KOL_BUD,'
      '    GRU.MO_KOL_VNE,'
      '    GRU.MO_GN,'
      '    GRU.MO_NIS,'
      '    GRU.MO_MAG_BUD,'
      '    GRU.MO_MAG_VNE,'
      '    GRU.MO_MP,'
      '    GRU.SHIFRGRUM,'
      '    GRU.ACTIVE'
      'FROM'
      '    GRUPPY GRU'
      ' WHERE '
      '        GRU.SHIFR = :OLD_SHIFR'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    GRU.SHIFR,'
      '    GRU.NAME,'
      '    GRU.NAME_PLAT,'
      '    GRU.MO_BUD,'
      '    GRU.MO_VNE,'
      '    GRU.MO_KOL_BUD,'
      '    GRU.MO_KOL_VNE,'
      '    GRU.MO_GN,'
      '    GRU.MO_NIS,'
      '    GRU.MO_MAG_BUD,'
      '    GRU.MO_MAG_VNE,'
      '    GRU.MO_MP,'
      '    GRU.SHIFRGRUM,'
      '    GRU.ACTIVE'
      'FROM'
      '    GRUPPY GRU'
      'ORDER BY '
      '    GRU.SHIFR'
      '    ')
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 24
    Top = 56
    object pFIBDataSetGruSHIFR: TFIBIntegerField
      FieldName = 'SHIFR'
      Origin = 'GRUPPY.SHIFR'
    end
    object pFIBDataSetGruNAME: TFIBStringField
      FieldName = 'NAME'
      Origin = 'GRUPPY.NAME'
      EmptyStrToNull = True
    end
    object pFIBDataSetGruMO_BUD: TFIBSmallIntField
      FieldName = 'MO_BUD'
      Origin = 'GRUPPY.MO_BUD'
    end
    object pFIBDataSetGruMO_VNE: TFIBSmallIntField
      FieldName = 'MO_VNE'
      Origin = 'GRUPPY.MO_VNE'
    end
    object pFIBDataSetGruMO_KOL_BUD: TFIBSmallIntField
      FieldName = 'MO_KOL_BUD'
      Origin = 'GRUPPY.MO_KOL_BUD'
    end
    object pFIBDataSetGruMO_KOL_VNE: TFIBSmallIntField
      FieldName = 'MO_KOL_VNE'
      Origin = 'GRUPPY.MO_KOL_VNE'
    end
    object pFIBDataSetGruMO_GN: TFIBSmallIntField
      FieldName = 'MO_GN'
      Origin = 'GRUPPY.MO_GN'
    end
    object pFIBDataSetGruMO_NIS: TFIBSmallIntField
      FieldName = 'MO_NIS'
      Origin = 'GRUPPY.MO_NIS'
    end
    object pFIBDataSetGruMO_MAG_BUD: TFIBSmallIntField
      FieldName = 'MO_MAG_BUD'
      Origin = 'GRUPPY.MO_MAG_BUD'
    end
    object pFIBDataSetGruMO_MAG_VNE: TFIBSmallIntField
      FieldName = 'MO_MAG_VNE'
      Origin = 'GRUPPY.MO_MAG_VNE'
    end
    object pFIBDataSetGruMO_MP: TFIBIntegerField
      FieldName = 'MO_MP'
    end
    object pFIBDataSetGruNAME_PLAT: TFIBStringField
      FieldName = 'NAME_PLAT'
      Size = 8
      EmptyStrToNull = True
    end
    object pFIBDataSetGruSHIFRGRUM: TFIBSmallIntField
      FieldName = 'SHIFRGRUM'
    end
    object pFIBDataSetGruNAME_GRUM: TStringField
      FieldKind = fkLookup
      FieldName = 'NAME_GRUM'
      LookupDataSet = pFIBDataSetGruM
      LookupKeyFields = 'SHIFRGRUM'
      LookupResultField = 'NAME'
      KeyFields = 'SHIFRGRUM'
      Lookup = True
    end
    object pFIBDataSetGruACTIVE: TFIBSmallIntField
      DisplayLabel = #1040#1082#1090
      FieldName = 'ACTIVE'
      MaxValue = 1
    end
  end
  object DataSourceGru: TDataSource
    DataSet = pFIBDataSetGru
    Left = 72
    Top = 56
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
    Left = 24
    Top = 96
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 72
    Top = 96
  end
  object pFIBDataSetGruM: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRGRUM,'
      ' NAME'
      'FROM'
      ' TB_GRUPPY_GRU ')
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    Left = 120
    Top = 56
    object pFIBDataSetGruMSHIFRGRUM: TFIBSmallIntField
      FieldName = 'SHIFRGRUM'
      ReadOnly = True
    end
    object pFIBDataSetGruMNAME: TFIBStringField
      FieldName = 'NAME'
      ReadOnly = True
      EmptyStrToNull = True
    end
  end
end
