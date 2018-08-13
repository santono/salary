object FormDepartmentBrowse: TFormDepartmentBrowse
  Left = 192
  Top = 124
  Width = 696
  Height = 495
  Caption = #1044#1077#1087#1072#1088#1090#1072#1084#1077#1085#1090#1099' '#1080' '#1080#1085#1089#1090#1080#1090#1091#1090#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    680
    457)
  PixelsPerInch = 96
  TextHeight = 13
  object dxDBTreeList1: TdxDBTreeList
    Left = 24
    Top = 48
    Width = 649
    Height = 369
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'ID'
    ParentField = 'IDOWNER'
    TabOrder = 0
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsoDep
    OptionsView = [etoAutoWidth, etoBandHeaderWidth, etoRowSelect, etoUseBitmap, etoUseImageIndexForSelected]
    PreviewFieldName = 'NAME'
    TreeLineColor = clGrayText
    object dxDBTreeList1ID: TdxDBTreeListMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ID'
    end
    object dxDBTreeList1IDOWNER: TdxDBTreeListMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'IDOWNER'
    end
    object dxDBTreeList1NAME: TdxDBTreeListMaskColumn
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
    object dxDBTreeList1IDPODR: TdxDBTreeListMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'IDPODR'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 24
    Top = 424
    Width = 240
    Height = 25
    DataSource = dsoDep
    Anchors = [akLeft, akBottom]
    TabOrder = 1
    OnClick = DBNavigator1Click
  end
  object dsDep: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_TREE_PODR'
      'SET '
      ' IDOWNER = :IDOWNER,'
      ' NAME = :NAME,'
      ' IDPODR = :IDPODR'
      'WHERE'
      ' ID = :OLD_ID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_TREE_PODR'
      'WHERE'
      '  ID = :OLD_ID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_TREE_PODR('
      ' ID,'
      ' IDOWNER,'
      ' NAME,'
      ' IDPODR'
      ')'
      'VALUES('
      ' :ID,'
      ' :IDOWNER,'
      ' :NAME,'
      ' :IDPODR'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' ID,'
      ' IDOWNER,'
      ' NAME,'
      ' IDPODR'
      'FROM'
      ' TB_TREE_PODR '
      ''
      ' WHERE '
      '  TB_TREE_PODR.ID = :OLD_ID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' ID,'
      ' IDOWNER,'
      ' NAME,'
      ' IDPODR'
      'FROM'
      ' TB_TREE_PODR ')
    Transaction = trDepRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = trDepWrte
    AutoCommit = True
    Left = 72
    Top = 8
    object dsDepID: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID'
    end
    object dsDepIDOWNER: TFIBIntegerField
      DisplayLabel = #1050#1086#1076' '#1074#1083#1072#1076#1077#1083#1100#1094#1072
      FieldName = 'IDOWNER'
    end
    object dsDepNAME: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object dsDepIDPODR: TFIBIntegerField
      DisplayLabel = #1050#1086#1076' '#1073#1091#1093
      FieldName = 'IDPODR'
    end
    object dsDepnameBuh: TFIBStringField
      DisplayLabel = #1048#1079' '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1080#1080
      FieldKind = fkLookup
      FieldName = 'nameBuh'
      LookupDataSet = dsPodr
      LookupKeyFields = 'SHIFRPOD'
      LookupResultField = 'PODSEARCH'
      KeyFields = 'IDPODR'
      Size = 128
      EmptyStrToNull = True
      Lookup = True
    end
    object dsDepnameowner: TFIBStringField
      FieldKind = fkLookup
      FieldName = 'nameowner'
      LookupDataSet = dsDepSearch
      LookupKeyFields = 'ID'
      LookupResultField = 'NSEARCH'
      KeyFields = 'IDOWNER'
      Size = 128
      EmptyStrToNull = True
      Lookup = True
    end
  end
  object trDepRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 112
    Top = 8
  end
  object dsPodr: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRPOD,'
      ' NAME,'
      ' trim(cast(shifrpod  as varchar(25)))||'#39' '#39'||trim(name) podsearch'
      ' '
      ' '
      'FROM'
      ' PODR '
      'order by shifrpod')
    Transaction = trPodrRead
    Database = FIB.pFIBDatabaseSal
    Left = 256
    Top = 8
    object dsPodrSHIFRPOD: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'SHIFRPOD'
    end
    object dsPodrNAME: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 100
      EmptyStrToNull = True
    end
    object dsPodrPODSEARCH: TFIBStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      FieldName = 'PODSEARCH'
      Size = 126
      EmptyStrToNull = True
    end
  end
  object trPodrRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 288
    Top = 8
  end
  object dsoDep: TDataSource
    DataSet = dsDep
    Left = 40
    Top = 8
  end
  object dsoPodr: TDataSource
    DataSet = dsPodr
    Left = 216
    Top = 8
  end
  object trDepWrte: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 144
    Top = 8
  end
  object dsoDepSearch: TDataSource
    DataSet = dsDepSearch
    Left = 368
    Top = 8
  end
  object dsDepSearch: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' ID,'
      ' NAME,'
      ' trim(cast(id as varchar(10)))||'#39' '#39'||trim(name) nsearch'
      'FROM'
      ' TB_TREE_PODR '
      'where coalesce(idowner,0)=0'
      'order by id')
    Transaction = trDetSearchRead
    Database = FIB.pFIBDatabaseSal
    Left = 400
    Top = 8
    object dsDepSearchID: TFIBIntegerField
      FieldName = 'ID'
    end
    object dsDepSearchNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object dsDepSearchNSEARCH: TFIBStringField
      FieldName = 'NSEARCH'
      Size = 266
      EmptyStrToNull = True
    end
  end
  object trDetSearchRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 432
    Top = 8
  end
end
