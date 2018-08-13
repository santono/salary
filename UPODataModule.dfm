object dmPO: TdmPO
  OldCreateOrder = False
  Left = 165
  Top = 115
  Height = 788
  Width = 701
  object pFIBdsWUS: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_K_WIDUCHST'
      'SET '
      ' NAME = :NAME'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_K_WIDUCHST'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_K_WIDUCHST('
      ' SHIFRID,'
      ' NAME'
      ')'
      'VALUES('
      ' :SHIFRID,'
      ' :NAME'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' NAME'
      'FROM'
      ' TB_K_WIDUCHST'
      ''
      ' WHERE '
      '  TB_K_WIDUCHST.SHIFRID = :OLD_SHIFRID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' NAME'
      'FROM'
      ' TB_K_WIDUCHST'
      'ORDER BY SHIFRID; ')
    Transaction = pFIBTrWUSRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTrWUS
    AutoCommit = True
    Left = 32
    Top = 16
    object pFIBdsWUSSHIFRID: TFIBSmallIntField
      DisplayLabel = #1050#1086#1076
      FieldName = 'SHIFRID'
    end
    object pFIBdsWUSNAME: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 30
      EmptyStrToNull = True
    end
  end
  object pFIBTrWUS: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 80
    Top = 16
  end
  object pFIBTrWUSRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 136
    Top = 16
  end
  object dsWUS: TDataSource
    DataSet = pFIBdsWUS
    Left = 200
    Top = 16
  end
  object pFIBdsWN: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_K_WIDNADB'
      'SET '
      ' NAME = :NAME,'
      ' SOKRNAME = :SOKRNAME,'
      ' DATEFR = :DATEFR,'
      ' DATETO = :DATETO,'
      ' PRIORITY = :PRIORITY'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_K_WIDNADB'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_K_WIDNADB('
      ' SHIFRID,'
      ' NAME,'
      ' SOKRNAME,'
      ' DATEFR,'
      ' DATETO,'
      ' PRIORITY'
      ')'
      'VALUES('
      ' :SHIFRID,'
      ' :NAME,'
      ' :SOKRNAME,'
      ' :DATEFR,'
      ' :DATETO,'
      ' :PRIORITY'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' NAME,'
      ' SOKRNAME,'
      ' DATEFR,'
      ' DATETO,'
      ' PRIORITY'
      'FROM'
      ' TB_K_WIDNADB '
      ''
      ' WHERE '
      '  TB_K_WIDNADB.SHIFRID = :OLD_SHIFRID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' NAME,'
      ' SOKRNAME,'
      ' DATEFR,'
      ' DATETO,'
      ' PRIORITY'
      'FROM'
      ' TB_K_WIDNADB '
      'ORDER BY'
      ' SHIFRID ')
    AutoUpdateOptions.UpdateTableName = 'TB_K_WIDNADB'
    AutoUpdateOptions.KeyFields = 'SHIFRID'
    AutoUpdateOptions.GeneratorName = 'G_K_WIDNADB'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = pFIBTrWNRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTrWN
    AutoCommit = True
    Left = 32
    Top = 64
    object pFIBdsWNSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      Visible = False
    end
    object pFIBdsWNNAME: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBdsWNSOKRNAME: TFIBStringField
      DisplayLabel = #1057#1086#1082#1088'.'#1085#1072#1079#1074'.'
      FieldName = 'SOKRNAME'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBdsWNDATEFR: TFIBDateField
      DisplayLabel = #1057
      FieldName = 'DATEFR'
    end
    object pFIBdsWNDATETO: TFIBDateField
      DisplayLabel = #1055#1086
      FieldName = 'DATETO'
    end
    object pFIBdsWNPRIORITY: TFIBSmallIntField
      DisplayLabel = #1055#1088#1080#1086#1088#1080#1090#1077#1090
      FieldName = 'PRIORITY'
    end
  end
  object pFIBTrWN: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 80
    Top = 64
  end
  object pFIBTrWNRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 136
    Top = 64
  end
  object dsWN: TDataSource
    DataSet = pFIBdsWN
    Left = 200
    Top = 64
  end
  object dsWNS: TDataSource
    DataSet = pFIBdsWNS
    Left = 200
    Top = 120
  end
  object pFIBdsWNS: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_K_WIDNADBSTW'
      'SET '
      ' DATEFR = :DATEFR,'
      ' SUMMA = :SUMMA,'
      ' KIND = :KIND'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_K_WIDNADBSTW'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_K_WIDNADBSTW('
      ' SHIFRID,'
      ' SHIFRIDOWNER,'
      ' DATEFR,'
      ' SUMMA,'
      ' KIND'
      ')'
      'VALUES('
      ' :SHIFRID,'
      ' :MAS_SHIFRID,'
      ' :DATEFR,'
      ' :SUMMA,'
      ' :KIND'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' SHIFRIDOWNER,'
      ' DATEFR,'
      ' SUMMA,'
      ' KIND'
      'FROM'
      ' TB_K_WIDNADBSTW '
      'where  TB_K_WIDNADBSTW.SHIFRID = :OLD_SHIFRID'
      '  '
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' SHIFRIDOWNER,'
      ' DATEFR,'
      ' SUMMA,'
      ' KIND'
      'FROM'
      ' TB_K_WIDNADBSTW '
      'where SHIFRIDOWNER=:MAS_SHIFRID')
    Transaction = pFIBTrWUSRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTrWUS
    AutoCommit = True
    DataSource = dsWN
    Left = 32
    Top = 120
    object pFIBdsWNSSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      Visible = False
    end
    object pFIBdsWNSSHIFRIDOWNER: TFIBIntegerField
      FieldName = 'SHIFRIDOWNER'
      Visible = False
    end
    object pFIBdsWNSDATEFR: TFIBDateField
      DisplayLabel = #1044#1072#1090#1072' '#1089
      FieldName = 'DATEFR'
    end
    object pFIBdsWNSSUMMA: TFIBBCDField
      DisplayLabel = #1057#1090#1072#1074#1082#1072
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsWNSKIND: TFIBSmallIntField
      DisplayLabel = #1042#1080#1076
      FieldName = 'KIND'
    end
  end
  object pFIBTrWNS: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 80
    Top = 120
  end
  object pFIBTrWNSRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 136
    Top = 120
  end
  object pFIBdsWUZ: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_K_USZ'
      'SET '
      ' NAMEFULL = :NAMEFULL,'
      ' NAMESOKR = :NAMESOKR'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_K_USZ'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_K_USZ('
      ' SHIFRID,'
      ' NAMEFULL,'
      ' NAMESOKR'
      ')'
      'VALUES('
      ' :SHIFRID,'
      ' :NAMEFULL,'
      ' :NAMESOKR'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' NAMEFULL,'
      ' NAMESOKR'
      'FROM'
      ' TB_K_USZ '
      ''
      ' WHERE '
      '  TB_K_USZ.SHIFRID = :OLD_SHIFRID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' NAMEFULL,'
      ' NAMESOKR'
      'FROM'
      ' TB_K_USZ ')
    AutoUpdateOptions.UpdateTableName = 'TB_K_USZ'
    AutoUpdateOptions.KeyFields = 'SHIFRID'
    AutoUpdateOptions.GeneratorName = 'G_K_USZ'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = pFIBTrWUZRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTrWUZ
    AutoCommit = True
    Left = 32
    Top = 168
    object pFIBdsWUZSHIFRID: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'SHIFRID'
    end
    object pFIBdsWUZNAMEFULL: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAMEFULL'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBdsWUZNAMESOKR: TFIBStringField
      DisplayLabel = #1057#1086#1082#1088'.'#1085#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAMESOKR'
      Size = 15
      EmptyStrToNull = True
    end
  end
  object pFIBTrWUZ: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 80
    Top = 168
  end
  object pFIBTrWUZRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 136
    Top = 168
  end
  object dsWUZ: TDataSource
    DataSet = pFIBdsWUZ
    Left = 200
    Top = 168
  end
  object dsWUSPr: TDataSource
    DataSet = pFIBdsWUSPr
    Left = 200
    Top = 216
  end
  object pFIBdsWUSPr: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_K_UCH_ST_SPR'
      'SET '
      ' NAME = :NAME,'
      ' SHORTNAME = :SHORTNAME,'
      ' SHIFRWIDUCHST = :SHIFRWIDUCHST'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_K_UCH_ST_SPR'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_K_UCH_ST_SPR('
      ' SHIFRID,'
      ' NAME,'
      ' SHORTNAME,'
      ' SHIFRWIDUCHST'
      ')'
      'VALUES('
      ' :SHIFRID,'
      ' :NAME,'
      ' :SHORTNAME,'
      ' :SHIFRWIDUCHST'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' NAME,'
      ' SHORTNAME,'
      ' SHIFRWIDUCHST'
      'FROM'
      ' TB_K_UCH_ST_SPR '
      ''
      ' WHERE '
      '  TB_K_UCH_ST_SPR.SHIFRID = :OLD_SHIFRID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' NAME,'
      ' SHORTNAME,'
      ' SHIFRWIDUCHST'
      'FROM'
      ' TB_K_UCH_ST_SPR ')
    Transaction = pFIBTrWUSPrRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTrWUSPr
    AutoCommit = True
    Left = 32
    Top = 216
    object pFIBdsWUSPrSHIFRID: TFIBSmallIntField
      DisplayLabel = #1050#1086#1076
      FieldName = 'SHIFRID'
    end
    object pFIBdsWUSPrNAME: TFIBStringField
      DisplayLabel = #1059#1095'.'#1089#1090#1077#1087#1077#1085#1100
      FieldName = 'NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBdsWUSPrSHORTNAME: TFIBStringField
      DisplayLabel = #1057#1086#1082#1088'.'#1085#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'SHORTNAME'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBdsWUSPrSHIFRWIDUCHST: TFIBSmallIntField
      DisplayLabel = #1050#1086#1076' '#1074#1080#1076#1072
      FieldName = 'SHIFRWIDUCHST'
    end
  end
  object pFIBTrWUSPr: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 80
    Top = 216
  end
  object pFIBTrWUSPrRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 136
    Top = 216
  end
  object dsKadry: TDataSource
    DataSet = pFIBdsKadry
    OnDataChange = dsKadryDataChange
    Left = 200
    Top = 264
  end
  object dsKadryPr: TDataSource
    DataSet = pFIBdsKadryPr
    Left = 200
    Top = 312
  end
  object pFIBdsKadry: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_K_KADRY'
      'SET '
      ' TABNO = :TABNO,'
      ' FIO = :FIO,'
      ' NAL_CODE = :NAL_CODE,'
      ' SHIFR_POD = :SHIFR_POD,'
      ' PIB = :PIB,'
      ' PIB_ROD_PAD = :PIB_ROD_PAD,'
      ' PIB_DAT_PAD = :PIB_DAT_PAD,'
      ' DATA_PRI = :DATA_PRI,'
      ' DATA_UW = :DATA_UW,'
      ' DATA_BIRTH = :DATA_BIRTH,'
      ' STAG_DO_Y = :STAG_DO_Y,'
      ' STAG_DO_M = :STAG_DO_M,'
      ' STAG_P_DO_Y = :STAG_P_DO_Y,'
      ' STAG_P_DO_M = :STAG_P_DO_M,'
      ' DATE_STAG_P = :DATE_STAG_P,'
      ' PASP_SER = :PASP_SER,'
      ' PASP_N = :PASP_N,'
      ' PASP_DATA = :PASP_DATA,'
      ' PASP_VYD = :PASP_VYD,'
      ' SHIFR_POL = :SHIFR_POL,'
      ' PROF = :PROF,'
      ' ADRES = :ADRES,'
      ' MESTO_R = :MESTO_R,'
      ' COMMENT = :COMMENT,'
      ' SWID_SS_SER = :SWID_SS_SER,'
      ' SWID_SS_NOM = :SWID_SS_NOM,'
      ' PEDSTAGISPRIBLISIT =  :PEDSTAGISPRIBLISIT,'
      ' PEDSTAGY = :PEDSTAGY,'
      ' IS_PED = :IS_PED,'
      ' verified=:verified'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_K_KADRY'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_K_KADRY('
      ' SHIFRID,'
      ' TABNO,'
      ' FIO,'
      ' NAL_CODE,'
      ' SHIFR_POD,'
      ' PIB,'
      ' PIB_ROD_PAD,'
      ' PIB_DAT_PAD,'
      ' DATA_PRI,'
      ' DATA_UW,'
      ' DATA_BIRTH,'
      ' STAG_DO_Y,'
      ' STAG_DO_M,'
      ' STAG_P_DO_Y,'
      ' STAG_P_DO_M,'
      ' DATE_STAG_P,'
      ' PASP_SER,'
      ' PASP_N,'
      ' PASP_DATA,'
      ' PASP_VYD,'
      ' SHIFR_POL,'
      ' PROF,'
      ' ADRES,'
      ' MESTO_R,'
      ' COMMENT,'
      ' SWID_SS_SER,'
      ' SWID_SS_NOM,'
      ' PEDSTAGISPRIBLISIT,'
      ' PEDSTAGY,'
      ' IS_PED'
      '   '
      ')'
      'VALUES('
      ' :SHIFRID,'
      ' :TABNO,'
      ' :FIO,'
      ' :NAL_CODE,'
      ' :SHIFR_POD,'
      ' :PIB,'
      ' :PIB_ROD_PAD,'
      ' :PIB_DAT_PAD,'
      ' :DATA_PRI,'
      ' :DATA_UW,'
      ' :DATA_BIRTH,'
      ' :STAG_DO_Y,'
      ' :STAG_DO_M,'
      ' :STAG_P_DO_Y,'
      ' :STAG_P_DO_M,'
      ' :DATE_STAG_P,'
      ' :PASP_SER,'
      ' :PASP_N,'
      ' :PASP_DATA,'
      ' :PASP_VYD,'
      ' :SHIFR_POL,'
      ' :PROF,'
      ' :ADRES,'
      ' :MESTO_R,'
      ' :COMMENT,'
      ' :SWID_SS_SER,'
      ' :SWID_SS_NOM,'
      ' :PEDSTAGISPRIBLISIT,'
      ' :PEDSTAGY,'
      ' :IS_PED '
      ''
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' TABNO,'
      ' FIO,'
      ' NAL_CODE,'
      ' SHIFR_POD,'
      ' PIB,'
      ' PIB_ROD_PAD,'
      ' PIB_DAT_PAD,'
      ' DATA_PRI,'
      ' DATA_UW,'
      ' DATA_BIRTH,'
      ' STAG_DO_Y,'
      ' STAG_DO_M,'
      ' STAG_P_DO_Y,'
      ' STAG_P_DO_M,'
      ' DATE_STAG_P,'
      ' PASP_SER,'
      ' PASP_N,'
      ' PASP_DATA,'
      ' PASP_VYD,'
      ' SHIFR_POL,'
      ' PROF,'
      ' ADRES,'
      ' MESTO_R,'
      ' COMMENT,'
      ' SWID_SS_SER,'
      ' SWID_SS_NOM,'
      ' PEDSTAGISPRIBLISIT,'
      ' PEDSTAGY,'
      ' IS_PED,'
      ' VERIFIED,'
      ' DATEVER'
      ' '
      'FROM'
      ' TB_K_KADRY '
      ''
      ' WHERE '
      '  TB_K_KADRY.SHIFRID = :OLD_SHIFRID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' TABNO,'
      ' FIO,'
      ' NAL_CODE,'
      ' SHIFR_POD,'
      ' PIB,'
      ' PIB_ROD_PAD,'
      ' PIB_DAT_PAD,'
      ' DATA_PRI,'
      ' DATA_UW,'
      ' DATA_BIRTH,'
      ' STAG_DO_Y,'
      ' STAG_DO_M,'
      ' STAG_P_DO_Y,'
      ' STAG_P_DO_M,'
      ' DATE_STAG_P,'
      ' PASP_SER,'
      ' PASP_N,'
      ' PASP_DATA,'
      ' PASP_VYD,'
      ' SHIFR_POL,'
      ' PROF,'
      ' ADRES,'
      ' MESTO_R,'
      ' COMMENT,'
      ' SWID_SS_SER,'
      ' SWID_SS_NOM,'
      ' PEDSTAGISPRIBLISIT,'
      ' pedstagy,'
      ' is_ped,'
      ' verified,'
      ' datever '
      'FROM'
      ' TB_K_KADRY'
      'where strlen(trim(coalesce(pib,'#39' '#39')))>1'
      '')
    Transaction = pFIBTrKadryRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTrKadry
    AutoCommit = True
    Left = 32
    Top = 272
    object pFIBdsKadrySHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      Visible = False
    end
    object pFIBdsKadryTABNO: TFIBIntegerField
      DisplayLabel = #1058#1072#1073'.'#1085#1086#1084#1077#1088
      FieldName = 'TABNO'
    end
    object pFIBdsKadryFIO: TFIBStringField
      DisplayLabel = #1060#1048#1054
      FieldName = 'FIO'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBdsKadryNAL_CODE: TFIBStringField
      DisplayLabel = #1048#1076'.'#1082#1086#1076
      FieldName = 'NAL_CODE'
      Size = 15
      EmptyStrToNull = True
    end
    object pFIBdsKadrySHIFR_POD: TFIBSmallIntField
      DisplayLabel = #1050#1086#1076' '#1087#1086#1076#1088
      FieldName = 'SHIFR_POD'
    end
    object pFIBdsKadryPIB: TFIBStringField
      DisplayLabel = #1055#1030#1041
      FieldName = 'PIB'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBdsKadryPIB_ROD_PAD: TFIBStringField
      DisplayLabel = #1056#1086#1076' '#1087#1072#1076#1077#1078
      FieldName = 'PIB_ROD_PAD'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBdsKadryPIB_DAT_PAD: TFIBStringField
      DisplayLabel = #1044#1072#1090#1077#1083#1100#1085#1099#1081' '#1087#1072#1076#1077#1078
      FieldName = 'PIB_DAT_PAD'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBdsKadryDATA_PRI: TFIBDateField
      DisplayLabel = #1055#1088#1080#1085#1103#1090
      FieldName = 'DATA_PRI'
    end
    object pFIBdsKadryDATA_UW: TFIBDateField
      DisplayLabel = #1059#1074#1086#1083#1077#1085
      FieldName = 'DATA_UW'
    end
    object pFIBdsKadryDATA_BIRTH: TFIBDateField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
      FieldName = 'DATA_BIRTH'
    end
    object pFIBdsKadrySTAG_DO_Y: TFIBSmallIntField
      FieldName = 'STAG_DO_Y'
    end
    object pFIBdsKadrySTAG_DO_M: TFIBSmallIntField
      FieldName = 'STAG_DO_M'
    end
    object pFIBdsKadrySTAG_P_DO_Y: TFIBSmallIntField
      DisplayLabel = #1055#1077#1076' '#1089#1090#1072#1078' '#1076#1086' ('#1075#1086#1076')'
      FieldName = 'STAG_P_DO_Y'
    end
    object pFIBdsKadrySTAG_P_DO_M: TFIBSmallIntField
      DisplayLabel = #1055#1077#1076'. '#1089#1090#1072#1078' '#1076#1086' ('#1084#1077#1089')'
      FieldName = 'STAG_P_DO_M'
    end
    object pFIBdsKadryDATE_STAG_P: TFIBDateField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1087#1077#1076' '#1089#1090#1072#1078#1072
      FieldName = 'DATE_STAG_P'
    end
    object pFIBdsKadryPASP_SER: TFIBStringField
      DisplayLabel = #1055#1072#1089#1087#1086#1088#1090' '#1089#1077#1088#1080#1103
      FieldName = 'PASP_SER'
      Visible = False
      Size = 8
      EmptyStrToNull = True
    end
    object pFIBdsKadryPASP_N: TFIBStringField
      DisplayLabel = #1055#1072#1089#1087#1086#1088#1090' '#1085#1086#1084#1077#1088
      FieldName = 'PASP_N'
      Visible = False
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBdsKadryPASP_DATA: TFIBDateField
      DisplayLabel = #1055#1072#1089#1087#1086#1088#1090' '#1076#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
      FieldName = 'PASP_DATA'
      Visible = False
    end
    object pFIBdsKadryPASP_VYD: TFIBStringField
      DisplayLabel = #1055#1072#1089#1087#1086#1088#1090' '#1074#1099#1076#1072#1085
      FieldName = 'PASP_VYD'
      Visible = False
      Size = 80
      EmptyStrToNull = True
    end
    object pFIBdsKadrySHIFR_POL: TFIBSmallIntField
      DisplayLabel = #1055#1086#1083
      FieldName = 'SHIFR_POL'
      Visible = False
    end
    object pFIBdsKadryPROF: TFIBSmallIntField
      FieldName = 'PROF'
      Visible = False
    end
    object pFIBdsKadryADRES: TFIBStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      FieldName = 'ADRES'
      Visible = False
      Size = 80
      EmptyStrToNull = True
    end
    object pFIBdsKadryMESTO_R: TFIBStringField
      FieldName = 'MESTO_R'
      Size = 80
      EmptyStrToNull = True
    end
    object pFIBdsKadryCOMMENT: TFIBStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'COMMENT'
      Visible = False
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBdsKadrySWID_SS_SER: TFIBStringField
      DisplayLabel = #1057#1086#1094' '#1089#1090#1088#1072#1093' '#1089#1074#1084#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086' '#1089#1077#1088#1080#1103
      FieldName = 'SWID_SS_SER'
      Visible = False
      Size = 6
      EmptyStrToNull = True
    end
    object pFIBdsKadrySWID_SS_NOM: TFIBStringField
      DisplayLabel = #1057#1086#1094' '#1089#1090#1088#1072#1093' '#1089#1074#1084#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086' '#1085#1086#1084#1077#1088
      FieldName = 'SWID_SS_NOM'
      Visible = False
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBdsKadryPEDSTAGISPRIBLISIT: TFIBSmallIntField
      DisplayLabel = #1055'.'#1089#1090#1072#1078'.'#1087#1088#1080#1073#1083#1080#1079#1080#1090'.'
      FieldName = 'PEDSTAGISPRIBLISIT'
    end
    object pFIBdsKadryPEDSTAGY: TFIBBCDField
      DisplayLabel = #1055#1077#1076'.'#1089#1090#1072#1078'.('#1075'.'#1075#1075')'
      FieldName = 'PEDSTAGY'
      OnChange = pFIBdsKadryPEDSTAGYChange
      Size = 2
      RoundByScale = True
    end
    object pFIBdsKadryIS_PED: TFIBSmallIntField
      DisplayLabel = #1055#1055#1057
      FieldName = 'IS_PED'
    end
    object pFIBdsKadryVERIFIED: TFIBSmallIntField
      DisplayLabel = #1055#1088#1086#1074#1077#1088#1077#1085#1086
      FieldName = 'VERIFIED'
      MaxValue = 1
    end
    object pFIBdsKadryDATEVER: TFIBDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1088#1082#1080
      FieldName = 'DATEVER'
      ReadOnly = True
    end
  end
  object pFIBdsKadryPr: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_K_KADRYPR'
      'SET '
      ' SHIFRIDOWNER = :MAS_SHIFRID,'
      ' CODETYPE  = :CODETYPE,'
      ' SHIFRUSZ  = :SHIFRUSZ,'
      ' DATEFR    = :DATEFR,'
      ' DATETO    = :DATETO,'
      ' NAME      = :NAME,'
      ' DATEPODTV = :DATEPODTV'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_K_KADRYPR'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_K_KADRYPR('
      ' SHIFRID,'
      ' SHIFRIDOWNER,'
      ' CODETYPE,'
      ' SHIFRUSZ,'
      ' DATEFR,'
      ' DATETO,'
      ' NAME,'
      ' DATEPODTV'
      ')'
      'VALUES('
      ' :SHIFRID,'
      ' :MAS_SHIFRID,'
      ' :CODETYPE,'
      ' :SHIFRUSZ,'
      ' :DATEFR,'
      ' :DATETO,'
      ' :NAME,'
      ' :DATEPODTV '
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' SHIFRIDOWNER,'
      ' CODETYPE,'
      ' SHIFRUSZ,'
      ' DATEFR,'
      ' DATETO,'
      ' NAME,'
      ' DATEPODTV'
      'FROM'
      ' TB_K_KADRYPR'
      'where SHIFRIDOWNER=:OLD_SHIFRID'
      '   '
      '  ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' SHIFRIDOWNER,'
      ' CODETYPE,'
      ' SHIFRUSZ,'
      ' DATEFR,'
      ' DATETO,'
      ' NAME,'
      ' DATEPODTV '
      'FROM'
      ' TB_K_KADRYPR'
      'where SHIFRIDOWNER=:MAS_SHIFRID ')
    Transaction = pFIBTrKadryPrRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTrKadryPr
    AutoCommit = True
    DataSource = dsKadry
    Left = 32
    Top = 312
    object pFIBdsKadryPrSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      Visible = False
    end
    object pFIBdsKadryPrSHIFRIDOWNER: TFIBIntegerField
      FieldName = 'SHIFRIDOWNER'
      Visible = False
    end
    object pFIBdsKadryPrCODETYPE: TFIBSmallIntField
      DisplayLabel = #1050#1086#1076
      FieldName = 'CODETYPE'
    end
    object pFIBdsKadryPrSHIFRUSZ: TFIBSmallIntField
      FieldName = 'SHIFRUSZ'
    end
    object pFIBdsKadryPrDATEFR: TFIBDateField
      DisplayLabel = #1057
      FieldName = 'DATEFR'
    end
    object pFIBdsKadryPrDATETO: TFIBDateField
      DisplayLabel = #1055#1086
      FieldName = 'DATETO'
    end
    object pFIBdsKadryPrNAME: TFIBStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBdsKadryPrDATEPODTV: TFIBDateField
      DisplayLabel = #1055#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1086
      FieldName = 'DATEPODTV'
    end
  end
  object pFIBTrKadry: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 80
    Top = 264
  end
  object pFIBTrKadryRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 136
    Top = 264
  end
  object pFIBTrKadryPr: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TPBMode = tpbDefault
    Left = 80
    Top = 312
  end
  object pFIBTrKadryPrRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 136
    Top = 312
  end
  object pFIBdsWidNSpr: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select 2 as F_1,b.shifrid as F_2,b.namesokr as F_3 from tb_k_usz' +
        ' b'
      'union'
      'select 3,a.shifrid,a.shortname  from tb_k_uch_st_spr a'
      'union'
      'select 4,c.shifrid,c.shortname  from tb_k_widyzasl c'
      'union '
      'select first 1 5,1,'#39#1079#1072#1074'.'#1082#1072#1092#39' from tb_k_widyzasl d'
      'union '
      'select first 1 6,1,'#39#1076#1077#1082#1072#1085#39' from tb_k_widyzasl e'
      'union '
      'select first 1 7,1,'#39#1079#1072#1084'.'#1076#1077#1082#1072#1085#1072#39' from tb_k_widyzasl f'
      'union '
      'select first 1 8,1,'#39#1076#1086#1083#1078#1085#1086#1089#1090#1100' '#1076#1086#1094#1077#1085#1090#39' from tb_k_widyzasl g'
      'union '
      'select first 1 8,2,'#39#1076#1086#1083#1078#1085#1086#1089#1090#1100' '#1087#1088#1086#1092#1077#1089#1089#1086#1088#39' from tb_k_widyzasl g'
      ' ')
    AllowedUpdateKinds = []
    Transaction = pFIBTrWidNSprRead
    Database = FIB.pFIBDatabaseSal
    AutoCommit = True
    Left = 32
    Top = 360
    oFetchAll = True
    object pFIBdsWidNSprF_1: TFIBIntegerField
      FieldName = 'F_1'
    end
    object pFIBdsWidNSprF_2: TFIBIntegerField
      FieldName = 'F_2'
    end
    object pFIBdsWidNSprF_3: TFIBStringField
      FieldName = 'F_3'
      Size = 30
      EmptyStrToNull = True
    end
  end
  object pFIBTrWidNSprRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 80
    Top = 360
  end
  object dsWidNSpr: TDataSource
    DataSet = pFIBdsWidNSpr
    Left = 200
    Top = 360
  end
  object dsPodr: TDataSource
    DataSet = pFIBdsPodr
    Left = 200
    Top = 416
  end
  object pFIBdsPodr: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_K_PODR'
      'SET '
      ' NAME_K = :NAME_K'
      'WHERE'
      ' SHIFRPOD = :OLD_SHIFRPOD'
      ' ')
    DeleteSQL.Strings = (
      ''
      ' ')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRPOD,'
      ' NAME,'
      ' NAME_K'
      'FROM'
      ' TB_K_PODR '
      ''
      ' WHERE '
      '  TB_K_PODR.SHIFRPOD = :OLD_SHIFRPOD'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRPOD,'
      ' NAME,'
      ' NAME_K'
      'FROM'
      ' TB_K_PODR ')
    BeforePost = pFIBdsPodrBeforePost
    AllowedUpdateKinds = [ukModify]
    Transaction = pFIBTrPodrRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTrPodr
    AutoCommit = True
    Left = 32
    Top = 416
    object pFIBdsPodrSHIFRPOD: TFIBIntegerField
      DisplayLabel = #1064#1092#1088
      FieldName = 'SHIFRPOD'
      ReadOnly = True
    end
    object pFIBdsPodrNAME: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      ReadOnly = True
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBdsPodrNAME_K: TFIBStringField
      DisplayLabel = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
      FieldName = 'NAME_K'
      OnChange = pFIBdsPodrNAME_KChange
      Size = 150
      EmptyStrToNull = True
    end
  end
  object pFIBTrPodr: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 80
    Top = 416
  end
  object pFIBTrPodrRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 136
    Top = 416
  end
  object dsShtatRaspPed: TDataSource
    DataSet = pFIBdsShtatRasPed
    Left = 560
    Top = 16
  end
  object pFIBdsShtatRasPed: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_K_SHTRASPPED'
      'SET '
      ' SHIFRPOD = :SHIFRPOD,'
      ' DATEFR = :DATEFR,'
      ' DATETO = :DATETO'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_K_SHTRASPPED'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_K_SHTRASPPED('
      ' SHIFRID,'
      ' SHIFRPOD,'
      ' DATEFR,'
      ' DATETO'
      ')'
      'VALUES('
      ' :SHIFRID,'
      ' :SHIFRPOD,'
      ' :DATEFR,'
      ' :DATETO'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' SHIFRPOD,'
      ' DATEFR,'
      ' DATETO'
      'FROM'
      ' TB_K_SHTRASPPED '
      ''
      ' WHERE '
      '  TB_K_SHTRASPPED.SHIFRID = :OLD_SHIFRID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' SHIFRPOD,'
      ' DATEFR,'
      ' DATETO,'
      ' shifrfac'
      ' '
      'FROM'
      ' TB_K_SHTRASPPED '
      'WHERE SHIFRPOD IS NOT NULL '
      'or SHIFRFAC IS NOT NULL')
    OnCalcFields = pFIBdsShtatRasPedCalcFields
    Transaction = pFIBTrShtatRaspPedRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTrShtatRaspPed
    AutoCommit = True
    Left = 352
    Top = 16
    object pFIBdsShtatRasPedSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      Visible = False
    end
    object pFIBdsShtatRasPedDATEFR: TFIBDateField
      DisplayLabel = 'C'
      FieldName = 'DATEFR'
    end
    object pFIBdsShtatRasPedDATETO: TFIBDateField
      DisplayLabel = #1055#1086
      FieldName = 'DATETO'
    end
    object pFIBdsShtatRasPedSHIFRPOD: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'SHIFRPOD'
    end
    object pFIBdsShtatRasPedSHIFRFAC: TFIBIntegerField
      FieldName = 'SHIFRFAC'
    end
    object pFIBdsShtatRasPednamepod: TStringField
      FieldKind = fkCalculated
      FieldName = 'namepod'
      Size = 64
      Calculated = True
    end
  end
  object pFIBTrShtatRaspPed: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 400
    Top = 16
  end
  object pFIBTrShtatRaspPedRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 464
    Top = 16
  end
  object pFIBdsShtatRaspPedRec: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_K_SHTRASPPEDREC'
      'SET '
      ' SHIFRIDOWN  = :SHIFRIDOWN,'
      ' LINENO      = :LINENO,'
      ' SHIFRIDK    = :SHIFRIDK,'
      ' TABNO       = :TABNO,'
      ' FIO         = :FIO,'
      ' SHIFRUS     = :SHIFRUS,'
      ' SHIFRUZ     = :SHIFRUZ,'
      ' SHIFRDOL    = :SHIFRDOL,'
      ' KOEFBUD     = :KOEFBUD,'
      ' KOEFVNE     = :KOEFVNE,'
      ' SHIFRPODOSN = :SHIFRPODOSN,'
      ' SHIFRWR     = :SHIFRWR,'
      ' DATEFR      = :DATEFR,'
      ' DATETO      = :DATETO,'
      ' SHIFRZASL   = :SHIFRZASL,'
      ' STAGP       = :STAGP,'
      ' iszawkaf    = :iszawkaf,'
      ' isdekan     = :isdekan,'
      ' iszamdekana = :iszamdekana,'
      ' ISDOCONOTHERSTAWKA = :ISDOCONOTHERSTAWKA,'
      ' PROCNUZ      = :PROCNUZ     ,'
      ' SUMMANUZV    = :SUMMANUZV   ,'
      ' SUMMANUZB    = :SUMMANUZB   , '
      ' PROCNUS      = :PROCNUS     ,'
      ' SUMMANUSV    = :SUMMANUSV   ,'
      ' SUMMANUSB    = :SUMMANUSB   , '
      ' PROCNZASL    = :PROCNZASL   ,'
      ' SUMMANZASLV  = :SUMMANZASLV ,'
      ' SUMMANZASLB  = :SUMMANZASLB ,'
      ' PROCNPSTAG   = :PROCNPSTAG  ,'
      ' SUMMANPSTAGB = :SUMMANPSTAGB,'
      ' SUMMANPSTAGV = :SUMMANPSTAGV,'
      ' RAZR         = :RAZR        ,'
      ' OKLADRAZR    = :OKLADRAZR   ,'
      ' OKLADB       = :OKLADB      ,'
      ' OKLADV       = :OKLADV      ,'
      ' SUMMAPOV     = :SUMMAPOV    ,'
      ' SUMMAPOVBUD  = :SUMMAPOVBUD ,'
      ' SUMMAPOVVNE  = :SUMMAPOVVNE ,'
      ' PROCNADBZAWKAF     = :PROCNADBZAWKAF     ,'
      ' SUMMANADBZAWKAFBUD = :SUMMANADBZAWKAFBUD ,'
      ' SUMMANADBZAWKAFVNE = :SUMMANADBZAWKAFVNE,'
      ' FIXED              = :FIXED,'
      ' NOTPRINT           = :NOTPRINT,'
      ' summazamdecbud     = :summazamdecbud,'
      ' summazamdecvne     = :summazamdecvne,'
      ' summazamdectot     = :summazamdectot,'
      ' proczamdec         = :proczamdec'
      ' '
      ''
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_K_SHTRASPPEDREC'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_K_SHTRASPPEDREC('
      ' SHIFRID,'
      ' SHIFRIDOWN,'
      ' LINENO,'
      ' SHIFRIDK,'
      ' TABNO,'
      ' FIO,'
      ' SHIFRUS,'
      ' SHIFRUZ,'
      ' SHIFRDOL,'
      ' KOEFBUD,'
      ' KOEFVNE,'
      ' SHIFRPODOSN,'
      ' SHIFRWR,'
      ' DATEFR,'
      ' DATETO,'
      ' ShifrZasl,'
      ' STAGP,'
      ' iszawkaf,'
      ' isdekan,'
      ' iszamdekana,'
      ' ISDOCONOTHERSTAWKA,'
      ' PROCNUZ,'
      ' SUMMANUZV,'
      ' SUMMANUZB, '
      ' PROCNUS,'
      ' SUMMANUSV,'
      ' SUMMANUSB, '
      ' PROCNZASL,'
      ' SUMMANZASLV,'
      ' SUMMANZASLB,'
      ' PROCNPSTAG,'
      ' SUMMANPSTAGB,'
      ' SUMMANPSTAGV,'
      ' RAZR,'
      ' OKLADRAZR,'
      ' OKLADB,'
      ' OKLADV,'
      ' SUMMAPOV,'
      ' SUMMAPOVBUD,'
      ' SUMMAPOVVNE,'
      ' PROCNADBZAWKAF,'
      ' SUMMANADBZAWKAFBUD,'
      ' SUMMANADBZAWKAFVNE,'
      ' FIXED,'
      ' NOTPRINT,'
      ' summazamdecbud,'
      ' summazamdecvne,'
      ' summazamdectot,'
      ' proczamdec '
      ''
      ' '
      ')'
      'VALUES('
      ' :SHIFRID,'
      ' :MAS_SHIFRID,'
      ' :LINENO,'
      ' :SHIFRIDK,'
      ' :TABNO,'
      ' :FIO,'
      ' :SHIFRUS,'
      ' :SHIFRUZ,'
      ' :SHIFRDOL,'
      ' :KOEFBUD,'
      ' :KOEFVNE,'
      ' :SHIFRPODOSN,'
      ' :SHIFRWR,'
      ' :DATEFR,'
      ' :DATETO,'
      ' :SHIFRZASL,'
      ' :stagp,'
      ' :iszawkaf,'
      ' :isdekan,'
      ' :iszamdekana,'
      ' :ISDOCONOTHERSTAWKA, '
      ' :PROCNUZ,'
      ' :SUMMANUZV,'
      ' :SUMMANUZB, '
      ' :PROCNUS,'
      ' :SUMMANUSV,'
      ' :SUMMANUSB, '
      ' :PROCNZASL,'
      ' :SUMMANZASLV,'
      ' :SUMMANZASLB,'
      ' :PROCNPSTAG,'
      ' :SUMMANPSTAGB,'
      ' :SUMMANPSTAGV,'
      ' :RAZR,'
      ' :OKLADRAZR,'
      ' :OKLADB,'
      ' :OKLADV,'
      ' :SUMMAPOV,'
      ' :SUMMAPOVBUD,'
      ' :SUMMAPOVVNE,'
      ' :PROCNADBZAWKAF,'
      ' :SUMMANADBZAWKAFBUD,'
      ' :SUMMANADBZAWKAFVNE,'
      ' :FIXED,'
      ' :NOTPRINT,'
      ' :summazamdecbud,'
      ' :summazamdecvne,'
      ' :summazamdectot,'
      ' :proczamdec '
      ''
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' SHIFRIDOWN,'
      ' LINENO,'
      ' SHIFRIDK,'
      ' TABNO,'
      ' FIO,'
      ' SHIFRUS,'
      ' SHIFRUZ,'
      ' SHIFRDOL,'
      ' KOEFBUD,'
      ' KOEFVNE,'
      ' SHIFRPODOSN,'
      ' SHIFRWR,'
      ' DATEFR,'
      ' DATETO,'
      ' SHIFRZASL,'
      ' STAGP,'
      ' iszawkaf,'
      ' isdekan,'
      ' iszamdekana,'
      ' ISDOCONOTHERSTAWKA,'
      ' PROCNUZ,'
      ' SUMMANUZV,'
      ' SUMMANUZB, '
      ' PROCNUS,'
      ' SUMMANUSV,'
      ' SUMMANUSB, '
      ' PROCNZASL,'
      ' SUMMANZASLV,'
      ' SUMMANZASLB,'
      ' PROCNZASL,'
      ' SUMMANZASLV,'
      ' SUMMANZASLB,'
      ' PROCNZASL,'
      ' SUMMANZASLV,'
      ' SUMMANZASLB,'
      ' PROCNPSTAG,'
      ' SUMMANPSTAGB,'
      ' SUMMANPSTAGV,'
      ' RAZR,'
      ' OKLADRAZR,'
      ' OKLADB,'
      ' OKLADV,'
      ' SUMMAPOV,'
      ' SUMMAPOVBUD,'
      ' SUMMAPOVVNE,'
      ' PROCNADBZAWKAF,'
      ' SUMMANADBZAWKAFBUD,'
      ' SUMMANADBZAWKAFVNE,'
      ' FIXED,'
      ' NOTPRINT,'
      ' summazamdecbud,'
      ' summazamdecvne,'
      ' summazamdectot,'
      ' proczamdec '
      ''
      'FROM'
      ' TB_K_SHTRASPPEDREC '
      'where TB_K_SHTRASPPEDREC.SHIFRID = :OLD_SHIFRID'
      '  '
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' SHIFRIDOWN,'
      ' LINENO,'
      ' SHIFRIDK,'
      ' TABNO,'
      ' FIO,'
      ' SHIFRUS,'
      ' SHIFRUZ,'
      ' SHIFRDOL,'
      ' KOEFBUD,'
      ' KOEFVNE,'
      ' SHIFRPODOSN,'
      ' SHIFRWR,'
      ' DATEFR,'
      ' DATETO,'
      ' ShifrZASl,'
      ' STAGP,'
      ' iszawkaf,'
      ' isdekan,'
      ' iszamdekana,'
      ' ISDOCONOTHERSTAWKA,'
      ' PROCNUZ,'
      ' SUMMANUZV,'
      ' SUMMANUZB, '
      ' PROCNUS,'
      ' SUMMANUSV,'
      ' SUMMANUSB, '
      ' PROCNZASL,'
      ' SUMMANZASLV,'
      ' SUMMANZASLB,'
      ' PROCNPSTAG,'
      ' SUMMANPSTAGB,'
      ' SUMMANPSTAGV,'
      ' RAZR,'
      ' OKLADRAZR,'
      ' OKLADB,'
      ' OKLADV,'
      ' SUMMAPOV,'
      ' SUMMAPOVBUD,'
      ' SUMMAPOVVNE,'
      ' PROCNADBZAWKAF,'
      ' SUMMANADBZAWKAFBUD,'
      ' SUMMANADBZAWKAFVNE,'
      ' FIXED,'
      ' NOTPRINT,'
      ' summazamdecbud,'
      ' summazamdecvne,'
      ' summazamdectot,'
      ' proczamdec '
      ''
      'FROM'
      ' TB_K_SHTRASPPEDREC '
      'where SHIFRIDOWN=:MAS_SHIFRID'
      'order by priority desc,fio')
    OnCalcFields = pFIBdsShtatRaspPedRecCalcFields
    Transaction = pFIBTrShtatRaspPedRecRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTrShtatRaspPedRec
    AutoCommit = True
    DataSource = dsShtatRaspPed
    Left = 352
    Top = 64
    object pFIBdsShtatRaspPedRecSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      Visible = False
    end
    object pFIBdsShtatRaspPedRecSHIFRIDOWN: TFIBIntegerField
      FieldName = 'SHIFRIDOWN'
      Visible = False
    end
    object pFIBdsShtatRaspPedRecLINENO: TFIBIntegerField
      DisplayLabel = #8470' '#1087'.'#1087'.'
      FieldName = 'LINENO'
    end
    object pFIBdsShtatRaspPedRecSHIFRIDK: TFIBIntegerField
      FieldName = 'SHIFRIDK'
      Visible = False
    end
    object pFIBdsShtatRaspPedRecTABNO: TFIBIntegerField
      DisplayLabel = #1058'.'#1085'.'
      FieldName = 'TABNO'
    end
    object pFIBdsShtatRaspPedRecFIOSpr: TFIBStringField
      DisplayLabel = #1060#1048#1054
      FieldKind = fkLookup
      FieldName = 'FIOSpr'
      LookupDataSet = pFIBdsKadry
      LookupKeyFields = 'SHIFRID'
      LookupResultField = 'FIO'
      KeyFields = 'SHIFRIDK'
      Size = 50
      EmptyStrToNull = True
      Lookup = True
    end
    object pFIBdsShtatRaspPedRecFIO: TFIBStringField
      FieldName = 'FIO'
      Visible = False
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBdsShtatRaspPedRecSHIFRUS: TFIBIntegerField
      FieldName = 'SHIFRUS'
      Visible = False
    end
    object pFIBdsShtatRaspPedRecUSName: TStringField
      DisplayLabel = #1059#1095'.'#1089#1090#1077#1087'.'
      FieldKind = fkLookup
      FieldName = 'USName'
      LookupDataSet = pFIBdsWUSPr
      LookupKeyFields = 'SHIFRID'
      LookupResultField = 'SHORTNAME'
      KeyFields = 'SHIFRUS'
      Size = 15
      Lookup = True
    end
    object pFIBdsShtatRaspPedRecSHIFRUZ: TFIBIntegerField
      FieldName = 'SHIFRUZ'
      Visible = False
    end
    object pFIBdsShtatRaspPedRecUZName: TStringField
      DisplayLabel = #1059#1095'.'#1079#1074'.'
      FieldKind = fkLookup
      FieldName = 'UZName'
      LookupDataSet = pFIBdsWUZ
      LookupKeyFields = 'SHIFRID'
      LookupResultField = 'NAMESOKR'
      KeyFields = 'SHIFRUZ'
      Size = 15
      Lookup = True
    end
    object pFIBdsShtatRaspPedRecSHIFRDOL: TFIBIntegerField
      FieldName = 'SHIFRDOL'
      Visible = False
    end
    object pFIBdsShtatRaspPedRecDolgName: TStringField
      DisplayLabel = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      FieldKind = fkLookup
      FieldName = 'DolgName'
      LookupDataSet = pFIBDsDolg
      LookupKeyFields = 'SHIFRDOL'
      LookupResultField = 'NAME'
      KeyFields = 'SHIFRDOL'
      Size = 15
      Lookup = True
    end
    object pFIBdsShtatRaspPedRecKOEFBUD: TFIBBCDField
      DisplayLabel = #1041#1102#1076#1078#1077#1090
      FieldName = 'KOEFBUD'
      Size = 4
      RoundByScale = True
    end
    object pFIBdsShtatRaspPedRecKOEFVNE: TFIBBCDField
      DisplayLabel = #1042#1085#1077#1073#1102#1076#1078#1077#1090
      FieldName = 'KOEFVNE'
      Size = 4
      RoundByScale = True
    end
    object pFIBdsShtatRaspPedRecSHIFRPODOSN: TFIBIntegerField
      FieldName = 'SHIFRPODOSN'
      Visible = False
    end
    object pFIBdsShtatRaspPedRecOsnPodrName: TStringField
      DisplayLabel = #1052#1077#1089#1090#1086' '#1086#1089#1085' '#1088#1072#1073#1086#1090#1099
      FieldKind = fkLookup
      FieldName = 'OsnPodrName'
      LookupDataSet = pFIBdsPodr
      LookupKeyFields = 'SHIFRPOD'
      LookupResultField = 'NAME'
      KeyFields = 'SHIFRPODOSN'
      Size = 50
      Lookup = True
    end
    object pFIBdsShtatRaspPedRecSHIFRWR: TFIBSmallIntField
      DisplayLabel = #1054#1089#1085'(1)/'#1057#1074#1084'(2)'
      FieldName = 'SHIFRWR'
    end
    object pFIBdsShtatRaspPedRecDATEFR: TFIBDateField
      DisplayLabel = #1057
      FieldName = 'DATEFR'
    end
    object pFIBdsShtatRaspPedRecDATETO: TFIBDateField
      DisplayLabel = #1055#1086
      FieldName = 'DATETO'
    end
    object pFIBdsShtatRaspPedRecSHIFRZASL: TFIBSmallIntField
      FieldName = 'SHIFRZASL'
      Visible = False
    end
    object pFIBdsShtatRaspPedRecSTAGP: TFIBBCDField
      FieldName = 'STAGP'
      Visible = False
      Size = 2
      RoundByScale = True
    end
    object pFIBdsShtatRaspPedRecDolCalcName: TStringField
      FieldKind = fkCalculated
      FieldName = 'DolCalcName'
      Size = 15
      Calculated = True
    end
    object pFIBdsShtatRaspPedRecuzscalcname: TStringField
      FieldKind = fkCalculated
      FieldName = 'uzscalcname'
      Size = 30
      Calculated = True
    end
    object pFIBdsShtatRaspPedRecWRCalcName: TStringField
      FieldKind = fkCalculated
      FieldName = 'WRCalcName'
      Size = 3
      Calculated = True
    end
    object pFIBdsShtatRaspPedRecISZAWKAF: TFIBSmallIntField
      DisplayLabel = #1047#1072#1074'.'#1082#1072#1092'.'
      FieldName = 'ISZAWKAF'
      Visible = False
    end
    object pFIBdsShtatRaspPedRecISDEKAN: TFIBSmallIntField
      DisplayLabel = #1044#1077#1082#1072#1085
      FieldName = 'ISDEKAN'
      Visible = False
    end
    object pFIBdsShtatRaspPedRecISZAMDEKANA: TFIBSmallIntField
      DisplayLabel = #1047#1072#1084'.'#1076#1077#1082#1072#1085#1072
      FieldName = 'ISZAMDEKANA'
      Visible = False
    end
    object pFIBdsShtatRaspPedRecISDOCONOTHERSTAWKA: TFIBSmallIntField
      DisplayLabel = #1044#1086#1094'._'#1076'.'
      FieldName = 'ISDOCONOTHERSTAWKA'
      Visible = False
    end
    object pFIBdsShtatRaspPedRecPROCNUZ: TFIBBCDField
      DisplayLabel = #1055#1088#1086#1094'.'#1091#1095'.'#1079#1074'.'
      FieldName = 'PROCNUZ'
      Visible = False
      Size = 2
      RoundByScale = True
    end
    object pFIBdsShtatRaspPedRecSUMMANUZV: TFIBBCDField
      DisplayLabel = #1053#1072#1076#1073'.'#1091#1095'.'#1079#1074'. '#1074#1085#1077
      FieldName = 'SUMMANUZV'
      Visible = False
      Size = 2
      RoundByScale = True
    end
    object pFIBdsShtatRaspPedRecSUMMANUZB: TFIBBCDField
      DisplayLabel = #1053#1072#1076#1073'.'#1091#1095'.'#1079#1074'.'#1073#1091#1076'.'
      FieldName = 'SUMMANUZB'
      Visible = False
      Size = 2
      RoundByScale = True
    end
    object pFIBdsShtatRaspPedRecPROCNUS: TFIBBCDField
      DisplayLabel = #1055#1088#1086#1094'.'#1091#1095'.'#1089#1090'.'
      FieldName = 'PROCNUS'
      Visible = False
      Size = 2
      RoundByScale = True
    end
    object pFIBdsShtatRaspPedRecSUMMANUSV: TFIBBCDField
      DisplayLabel = #1053#1072#1073#1076'.'#1091#1095'.'#1089#1090'.'#1074#1085#1077
      FieldName = 'SUMMANUSV'
      Visible = False
      Size = 2
      RoundByScale = True
    end
    object pFIBdsShtatRaspPedRecSUMMANUSB: TFIBBCDField
      DisplayLabel = #1053#1072#1076#1073'.'#1091#1095'.'#1089#1090'.'#1073#1091#1076
      FieldName = 'SUMMANUSB'
      Visible = False
      Size = 2
      RoundByScale = True
    end
    object pFIBdsShtatRaspPedRecPROCNZASL: TFIBBCDField
      DisplayLabel = #1055#1088#1086#1094'.'#1079#1072#1089#1083'.'
      FieldName = 'PROCNZASL'
      Visible = False
      Size = 2
      RoundByScale = True
    end
    object pFIBdsShtatRaspPedRecSUMMANZASLV: TFIBBCDField
      DisplayLabel = #1053#1072#1076#1073'.'#1079#1072#1089#1083'.'#1074#1085#1077
      FieldName = 'SUMMANZASLV'
      Visible = False
      Size = 2
      RoundByScale = True
    end
    object pFIBdsShtatRaspPedRecSUMMANZASLB: TFIBBCDField
      DisplayLabel = #1053#1072#1076#1073'.'#1079#1072#1089#1083'.'#1073#1091#1076'.'
      FieldName = 'SUMMANZASLB'
      Visible = False
      Size = 2
      RoundByScale = True
    end
    object pFIBdsShtatRaspPedRecPROCNPSTAG: TFIBBCDField
      DisplayLabel = #1053#1072#1076#1073'.'#1087'.'#1089#1090#1072#1078'.'
      FieldName = 'PROCNPSTAG'
      Visible = False
      Size = 2
      RoundByScale = True
    end
    object pFIBdsShtatRaspPedRecSUMMANPSTAGB: TFIBBCDField
      DisplayLabel = #1053#1072#1076#1073'.'#1087'.'#1089#1090#1072#1078'.'#1073#1102#1076'.'
      FieldName = 'SUMMANPSTAGB'
      Visible = False
      Size = 2
      RoundByScale = True
    end
    object pFIBdsShtatRaspPedRecSUMMANPSTAGV: TFIBBCDField
      DisplayLabel = #1053#1072#1073#1076'.'#1087'.'#1089#1090#1072#1078'.'#1074#1085#1077
      FieldName = 'SUMMANPSTAGV'
      Visible = False
      Size = 2
      RoundByScale = True
    end
    object pFIBdsShtatRaspPedRecRAZR: TFIBSmallIntField
      DisplayLabel = #1056#1072#1079#1088#1103#1076
      FieldName = 'RAZR'
      Visible = False
    end
    object pFIBdsShtatRaspPedRecOKLADRAZR: TFIBBCDField
      DisplayLabel = #1054#1082#1083#1072#1076' '#1087#1086' '#1088#1072#1079#1088#1103#1076#1091
      FieldName = 'OKLADRAZR'
      Visible = False
      Size = 2
      RoundByScale = True
    end
    object pFIBdsShtatRaspPedRecOKLADB: TFIBBCDField
      DisplayLabel = #1054#1082#1083#1072#1076' '#1073#1102#1076
      FieldName = 'OKLADB'
      Visible = False
      Size = 2
      RoundByScale = True
    end
    object pFIBdsShtatRaspPedRecOKLADV: TFIBBCDField
      DisplayLabel = #1054#1082#1083#1072#1076' '#1074#1085#1077
      FieldName = 'OKLADV'
      Visible = False
      Size = 2
      RoundByScale = True
    end
    object pFIBdsShtatRaspPedRecSUMMAPOV: TFIBBCDField
      DisplayLabel = #1055#1086#1074#1099#1096#1077#1085#1080#1077
      FieldName = 'SUMMAPOV'
      Visible = False
      Size = 2
      RoundByScale = True
    end
    object pFIBdsShtatRaspPedRecSUMMAPOVBUD: TFIBBCDField
      DisplayLabel = #1055#1086#1074#1099#1096#1077#1085#1080#1077' '#1073#1102#1076'.'
      FieldName = 'SUMMAPOVBUD'
      Visible = False
      Size = 2
      RoundByScale = True
    end
    object pFIBdsShtatRaspPedRecSUMMAPOVVNE: TFIBBCDField
      DisplayLabel = #1055#1086#1074#1099#1096#1077#1085#1080#1077' '#1074#1085#1077
      FieldName = 'SUMMAPOVVNE'
      Visible = False
      Size = 2
      RoundByScale = True
    end
    object pFIBdsShtatRaspPedRecPROCNADBZAWKAF: TFIBBCDField
      DisplayLabel = #1055#1088#1086#1094'.'#1079#1072#1074'.'#1082#1072#1092'.'
      FieldName = 'PROCNADBZAWKAF'
      Visible = False
      Size = 2
      RoundByScale = True
    end
    object pFIBdsShtatRaspPedRecSUMMANADBZAWKAFBUD: TFIBBCDField
      DisplayLabel = #1053#1072#1076#1073'.'#1079#1072#1074'.'#1082#1072#1092'.'#1073#1102#1076'.'
      FieldName = 'SUMMANADBZAWKAFBUD'
      Visible = False
      Size = 2
      RoundByScale = True
    end
    object pFIBdsShtatRaspPedRecSUMMANADBZAWKAFVNE: TFIBBCDField
      DisplayLabel = #1053#1072#1076#1073'.'#1079#1072#1074'.'#1082#1072#1092'.'#1074#1085#1077'.'
      FieldName = 'SUMMANADBZAWKAFVNE'
      Visible = False
      Size = 2
      RoundByScale = True
    end
    object pFIBdsShtatRaspPedRecFIXED: TFIBSmallIntField
      DisplayLabel = #1047#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1085#1086
      FieldName = 'FIXED'
      Visible = False
    end
    object pFIBdsShtatRaspPedRecNOTPRINT: TFIBSmallIntField
      DisplayLabel = #1053#1077' '#1087#1077#1095#1072#1090#1072#1090#1100
      FieldName = 'NOTPRINT'
      Visible = False
    end
    object pFIBdsShtatRaspPedRecSUMMAZAMDECBUD: TFIBBCDField
      FieldName = 'SUMMAZAMDECBUD'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsShtatRaspPedRecSUMMAZAMDECVNE: TFIBBCDField
      FieldName = 'SUMMAZAMDECVNE'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsShtatRaspPedRecSUMMAZAMDECTOT: TFIBBCDField
      FieldName = 'SUMMAZAMDECTOT'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsShtatRaspPedRecPROCZAMDEC: TFIBBCDField
      FieldName = 'PROCZAMDEC'
      Size = 2
      RoundByScale = True
    end
  end
  object pFIBTrShtatRaspPedRec: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 400
    Top = 64
  end
  object pFIBTrShtatRaspPedRecRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 464
    Top = 64
  end
  object dsShtatRaspPedRec: TDataSource
    DataSet = pFIBdsShtatRaspPedRec
    Left = 544
    Top = 64
  end
  object dsDolg: TDataSource
    DataSet = pFIBDsDolg
    Left = 544
    Top = 112
  end
  object pFIBDsDolg: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRDOL,'
      ' NAME,'
      ' RAZR,'
      ' OKLAD,'
      ' NEED_STAG'
      'FROM'
      ' TB_DOLG ')
    Transaction = pFIBTrDolgRead
    Database = FIB.pFIBDatabaseSal
    Left = 352
    Top = 120
    object pFIBDsDolgSHIFRDOL: TFIBIntegerField
      FieldName = 'SHIFRDOL'
    end
    object pFIBDsDolgNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBDsDolgRAZR: TFIBIntegerField
      FieldName = 'RAZR'
    end
    object pFIBDsDolgOKLAD: TFIBBCDField
      FieldName = 'OKLAD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDsDolgNEED_STAG: TFIBSmallIntField
      FieldName = 'NEED_STAG'
    end
  end
  object pFIBTrDolgRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 400
    Top = 120
  end
  object dsOrder: TDataSource
    DataSet = pFIBdsOrder
    Left = 544
    Top = 168
  end
  object pFIBdsOrder: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' NOMERORD,'
      ' NOMERORDALPHA,'
      ' DATEORD,'
      ' SHIFRIDWIDORD,'
      ' NAMEORD,'
      ' SHIFRISP,'
      ' NAMEISP,'
      ' SHIFRWRK,'
      ' DATEWRK'
      'FROM'
      ' TB_K_ORDERS ')
    AllowedUpdateKinds = []
    Transaction = FIB.pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    Left = 352
    Top = 176
    object pFIBdsOrderSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      ReadOnly = True
      Visible = False
    end
    object pFIBdsOrderNOMERORD: TFIBIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'NOMERORD'
    end
    object pFIBdsOrderDATEORD: TFIBDateField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DATEORD'
    end
    object pFIBdsOrderNAMEORD: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAMEORD'
      Size = 30
      EmptyStrToNull = True
    end
  end
  object pFIBTrOrderRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 408
    Top = 176
  end
  object pFIBQueryR: TpFIBQuery
    Transaction = pFIBTrQueryRRead
    Database = FIB.pFIBDatabaseSal
    Left = 352
    Top = 232
  end
  object pFIBTrQueryRRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 408
    Top = 232
  end
  object pFIBQueryRIn: TpFIBQuery
    Transaction = pFIBTrQueryRInRead
    Database = FIB.pFIBDatabaseSal
    Left = 488
    Top = 232
  end
  object pFIBTrQueryRInRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 544
    Top = 232
  end
  object pFIBQueryW: TpFIBQuery
    Transaction = pFIBtrQueryW
    Database = FIB.pFIBDatabaseSal
    Left = 352
    Top = 280
  end
  object pFIBtrQueryW: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 408
    Top = 280
  end
  object dsWidyZasl: TDataSource
    DataSet = pFIBdsWidyZ
    Left = 552
    Top = 328
  end
  object pFIBdsWidyZ: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_K_WIDYZASL'
      'SET '
      ' NAME = :NAME,'
      ' SHORTNAME = :SHORTNAME,'
      ' SHIFRNADB = :SHIFRNADB'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_K_WIDYZASL'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_K_WIDYZASL('
      ' SHIFRID,'
      ' NAME,'
      ' SHORTNAME,'
      ' SHIFRNADB'
      ')'
      'VALUES('
      ' :SHIFRID,'
      ' :NAME,'
      ' :SHORTNAME,'
      ' :SHIFRNADB'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' NAME,'
      ' SHORTNAME,'
      ' SHIFRNADB'
      'FROM'
      ' TB_K_WIDYZASL '
      ''
      ' WHERE '
      '  TB_K_WIDYZASL.SHIFRID = :OLD_SHIFRID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' NAME,'
      ' SHORTNAME,'
      ' SHIFRNADB'
      'FROM'
      ' TB_K_WIDYZASL ')
    AutoUpdateOptions.UpdateTableName = 'TB_K_WIDYZASL'
    AutoUpdateOptions.KeyFields = 'SHIFRID'
    AutoUpdateOptions.GeneratorName = 'G_K_WIDYZASL'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = pFIBTrWidyZRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTrWidyZ
    AutoCommit = True
    Left = 352
    Top = 328
    object pFIBdsWidyZSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      Visible = False
    end
    object pFIBdsWidyZNAME: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBdsWidyZSHORTNAME: TFIBStringField
      DisplayLabel = #1057#1086#1082#1088'.'#1085#1072#1079#1074'.'
      FieldName = 'SHORTNAME'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBdsWidyZSHIFRNADB: TFIBIntegerField
      DisplayLabel = #1050#1086#1076'.'#1085#1072#1076#1073'.'
      FieldName = 'SHIFRNADB'
    end
  end
  object pFIBTrWidyZ: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 400
    Top = 328
  end
  object pFIBTrWidyZRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 480
    Top = 328
  end
  object dsOrderRec: TDataSource
    DataSet = pFIBdsOrderRec
    Left = 552
    Top = 384
  end
  object pFIBdsOrderRec: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_K_ORDERRECTEXT'
      'SET '
      ' SHIFRIDOWNER = :SHIFRIDOWNER,'
      ' SHIFRPOD = :SHIFRPOD,'
      ' LINENO = :LINENO,'
      ' TABNO = :TABNO,'
      ' FIO = :FIO,'
      ' TEXT = :TEXT,'
      ' FIXED = :FIXED,'
      ' SHIFRIDSHTRASPREC = :SHIFRIDSHTRASPREC'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_K_ORDERRECTEXT'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_K_ORDERRECTEXT('
      ' SHIFRID,'
      ' SHIFRIDOWNER,'
      ' SHIFRPOD,'
      ' LINENO,'
      ' TABNO,'
      ' FIO,'
      ' TEXT,'
      ' FIXED,'
      ' SHIFRIDSHTRASPREC'
      ')'
      'VALUES('
      ' :SHIFRID,'
      ' :MAS_SHIFRID,'
      ' :SHIFRPOD,'
      ' :LINENO,'
      ' :TABNO,'
      ' :FIO,'
      ' :TEXT,'
      ' :FIXED,'
      ' :MAS_SHIFRID'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' SHIFRIDOWNER,'
      ' SHIFRPOD,'
      ' LINENO,'
      ' TABNO,'
      ' FIO,'
      ' TEXT,'
      ' FIXED,'
      ' SHIFRIDSHTRASPREC'
      'FROM'
      ' TB_K_ORDERRECTEXT '
      ''
      ' WHERE '
      '  TB_K_ORDERRECTEXT.SHIFRID = :OLD_SHIFRID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' SHIFRIDOWNER,'
      ' SHIFRPOD,'
      ' LINENO,'
      ' TABNO,'
      ' FIO,'
      ' TEXT,'
      ' FIXED,'
      ' SHIFRIDSHTRASPREC'
      'FROM'
      ' TB_K_ORDERRECTEXT '
      'where '
      '  SHIFRIDSHTRASPREC=:MAS_SHIFRID')
    Transaction = pFIBtrOrderRecRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBtrOrderReadWrite
    AutoCommit = True
    DataSource = dsShtatRaspPedRec
    Left = 352
    Top = 376
    object pFIBdsOrderRecSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object pFIBdsOrderRecSHIFRIDOWNER: TFIBIntegerField
      FieldName = 'SHIFRIDOWNER'
      Visible = False
    end
    object pFIBdsOrderRecSHIFRPOD: TFIBIntegerField
      FieldName = 'SHIFRPOD'
      Visible = False
    end
    object pFIBdsOrderRecLINENO: TFIBIntegerField
      FieldName = 'LINENO'
      Visible = False
    end
    object pFIBdsOrderRecTABNO: TFIBIntegerField
      FieldName = 'TABNO'
      Visible = False
    end
    object pFIBdsOrderRecFIO: TFIBStringField
      FieldName = 'FIO'
      Visible = False
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBdsOrderRecTEXT: TFIBStringField
      DisplayLabel = #1058#1077#1082#1089#1090' '#1087#1088#1080#1082#1072#1079#1072
      FieldName = 'TEXT'
      Size = 4096
      EmptyStrToNull = True
    end
    object pFIBdsOrderRecFIXED: TFIBSmallIntField
      DisplayLabel = #1060#1080#1082#1089#1080#1088#1086#1074#1072#1085#1086
      FieldName = 'FIXED'
    end
    object pFIBdsOrderRecSHIFRIDSHTRASPREC: TFIBIntegerField
      FieldName = 'SHIFRIDSHTRASPREC'
      Visible = False
    end
  end
  object pFIBtrOrderRecRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 400
    Top = 376
  end
  object pFIBtrOrderReadWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 480
    Top = 376
  end
  object pFIBtrShtCmpRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 400
    Top = 424
  end
  object pFIBdsShtCmp: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' TABNO,'
      ' FIO,'
      ' MES'
      'FROM'
      ' PR_K_CMPSHTRASP(:DATEFR,'
      ' :DATETO,'
      ' :SHIFRWR) ')
    Transaction = pFIBtrShtCmpRead
    Database = FIB.pFIBDatabaseSal
    Left = 352
    Top = 424
    object pFIBdsShtCmpTABNO: TFIBIntegerField
      DisplayLabel = #1058'.'#1085'.'
      FieldName = 'TABNO'
    end
    object pFIBdsShtCmpFIO: TFIBStringField
      DisplayLabel = #1060#1048#1054
      FieldName = 'FIO'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBdsShtCmpMES: TFIBStringField
      DisplayLabel = #1057#1086#1086#1073#1097#1077#1085#1080#1077
      FieldName = 'MES'
      Size = 1024
      EmptyStrToNull = True
    end
  end
  object dsShtCmp: TDataSource
    DataSet = pFIBdsShtCmp
    Left = 480
    Top = 424
  end
  object dsExl: TDataSource
    DataSet = pFIBdsExl
    Left = 560
    Top = 472
  end
  object pFIBdsExl: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_K_EXL_SAL'
      'SET '
      ' TABNO    = :TABNO,'
      ' SHIFRUNI = :SHIFRUNI,'
      ' COMMENT  = :COMMENT,'
      ' DATEFR   = :DATEFR'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_K_EXL_SAL'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_K_EXL_SAL('
      ' SHIFRID  ,'
      ' TABNO    ,'
      ' SHIFRUNI ,'
      ' COMMENT  ,'
      ' DATEFR'
      ')'
      'VALUES('
      ' :SHIFRID  ,'
      ' :TABNO    ,'
      ' :SHIFRUNI ,'
      ' :COMMENT  ,'
      ' :DATEFR'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' TABNO,'
      ' SHIFRUNI,'
      ' COMMENT,'
      ' DATEFR'
      'FROM'
      ' TB_K_EXL_SAL '
      ' WHERE '
      '  TB_K_EXL_SAL.SHIFRID = :OLD_SHIFRID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' TABNO,'
      ' SHIFRUNI,'
      ' COMMENT,'
      ' DATEFR'
      'FROM'
      ' TB_K_EXL_SAL ')
    AutoUpdateOptions.UpdateTableName = 'TB_K_EXL_SAL'
    AutoUpdateOptions.KeyFields = 'SHIFRID'
    AutoUpdateOptions.GeneratorName = 'G_K_EXL_SAL'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = pFIBtrExlRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBtrExl
    AutoCommit = True
    Left = 352
    Top = 472
    object pFIBdsExlSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      Visible = False
    end
    object pFIBdsExlTABNO: TFIBIntegerField
      DisplayLabel = #1058'.'#1085'.'
      FieldName = 'TABNO'
    end
    object pFIBdsExlSHIFRUNI: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'SHIFRUNI'
    end
    object pFIBdsExlCOMMENT: TFIBStringField
      DisplayLabel = #1057#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'COMMENT'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBdsExlDATEFR: TFIBDateField
      DisplayLabel = #1044#1072#1090#1072' '#1089
      FieldName = 'DATEFR'
    end
  end
  object pFIBtrExl: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 400
    Top = 472
  end
  object pFIBtrExlRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 480
    Top = 472
  end
  object pFIBdsFacList: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_K_FACULTETY'
      'SET '
      ' NAME = :NAME,'
      ' DATECLOSE = :DATECLOSE,'
      ' NAME_S = :NAME_S,'
      ' NAME_K = :NAME_K'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_K_FACULTETY'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_K_FACULTETY('
      ' SHIFRID,'
      ' NAME,'
      ' DATECLOSE,'
      ' NAME_S,'
      ' NAME_K'
      ')'
      'VALUES('
      ' :SHIFRID,'
      ' :NAME,'
      ' :DATECLOSE,'
      ' :NAME_S,'
      ' :NAME_K'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' NAME,'
      ' DATECLOSE,'
      ' NAME_S,'
      ' NAME_K'
      'FROM'
      ' TB_K_FACULTETY '
      ''
      ' WHERE '
      '  TB_K_FACULTETY.SHIFRID = :OLD_SHIFRID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' NAME,'
      ' DATECLOSE,'
      ' NAME_S,'
      ' NAME_K'
      'FROM'
      ' TB_K_FACULTETY ')
    Transaction = pFIBtrFacListRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBtrFacList
    Left = 32
    Top = 472
    object pFIBdsFacListSHIFRID: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'SHIFRID'
    end
    object pFIBdsFacListNAME: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 128
      EmptyStrToNull = True
    end
    object pFIBdsFacListDATECLOSE: TFIBDateField
      DisplayLabel = #1047#1072#1082#1088#1099#1090
      FieldName = 'DATECLOSE'
    end
    object pFIBdsFacListNAME_S: TFIBStringField
      FieldName = 'NAME_S'
      Visible = False
      Size = 512
      EmptyStrToNull = True
    end
    object pFIBdsFacListNAME_K: TFIBStringField
      FieldName = 'NAME_K'
      Visible = False
      Size = 512
      EmptyStrToNull = True
    end
  end
  object pFIBtrFacList: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 80
    Top = 472
  end
  object pFIBtrFacListRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 136
    Top = 472
  end
  object dsFacList: TDataSource
    DataSet = pFIBdsFacList
    Left = 200
    Top = 472
  end
  object pFIBdsZamDec: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_K_DECANY'
      'SET '
      ' SHIFRIDKADRY = :SHIFRIDKADRY,'
      ' SHIFRFAC     = :SHIFRFAC,'
      ' DATEFR       = :DATEFR,'
      ' DATETO       = :DATETO,'
      ' CODEDOLG     = :CODEDOLG,'
      ' PROCZAMDEC   = :PROCZAMDEC'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_K_DECANY'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_K_DECANY('
      ' SHIFRID,'
      ' SHIFRIDKADRY,'
      ' SHIFRFAC,'
      ' DATEFR,'
      ' DATETO,'
      ' CODEDOLG,'
      ' PROCZAMDEC'
      ')'
      'VALUES('
      ' :SHIFRID,'
      ' :SHIFRIDKADRY,'
      ' :SHIFRFAC,'
      ' :DATEFR,'
      ' :DATETO,'
      ' :CODEDOLG,'
      ' :PROCZAMDEC'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' SHIFRIDKADRY,'
      ' SHIFRFAC,'
      ' DATEFR,'
      ' DATETO,'
      ' CODEDOLG,'
      ' PROCZAMDEC'
      'FROM'
      ' TB_K_DECANY '
      ''
      ' WHERE '
      '  TB_K_DECANY.SHIFRID = :OLD_SHIFRID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' SHIFRIDKADRY,'
      ' SHIFRFAC,'
      ' DATEFR,'
      ' DATETO,'
      ' CODEDOLG,'
      ' PROCZAMDEC'
      'FROM'
      ' TB_K_DECANY ')
    OnCalcFields = pFIBdsZamDecCalcFields
    Transaction = pFIBtrZamDecRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBtrZamDec
    AutoCommit = True
    Left = 32
    Top = 528
    object pFIBdsZamDecSHIFRID: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'SHIFRID'
    end
    object pFIBdsZamDecSHIFRIDKADRY: TFIBIntegerField
      FieldName = 'SHIFRIDKADRY'
      Visible = False
    end
    object pFIBdsZamDecFIO: TStringField
      DisplayLabel = #1060#1048#1054
      FieldKind = fkLookup
      FieldName = 'FIO'
      LookupDataSet = pFIBdsKadry
      LookupKeyFields = 'SHIFRID'
      LookupResultField = 'FIO'
      KeyFields = 'SHIFRIDKADRY'
      LookupCache = True
      Size = 50
      Lookup = True
    end
    object pFIBdsZamDecnamedolg: TStringField
      DisplayLabel = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      FieldKind = fkCalculated
      FieldName = 'namedolg'
      Size = 25
      Calculated = True
    end
    object pFIBdsZamDecNameFac: TStringField
      DisplayLabel = #1060#1072#1082#1091#1083#1100#1090#1077#1090
      FieldKind = fkLookup
      FieldName = 'NameFac'
      LookupDataSet = pFIBdsFacList
      LookupKeyFields = 'SHIFRID'
      LookupResultField = 'NAME'
      KeyFields = 'SHIFRFAC'
      Size = 128
      Lookup = True
    end
    object pFIBdsZamDecSHIFRFAC: TFIBIntegerField
      FieldName = 'SHIFRFAC'
      Visible = False
    end
    object pFIBdsZamDecDATEFR: TFIBDateField
      DisplayLabel = #1057
      FieldName = 'DATEFR'
    end
    object pFIBdsZamDecDATETO: TFIBDateField
      DisplayLabel = #1055#1086
      FieldName = 'DATETO'
    end
    object pFIBdsZamDecCODEDOLG: TFIBSmallIntField
      FieldName = 'CODEDOLG'
      Visible = False
    end
    object pFIBdsZamDecPROCZAMDEC: TFIBBCDField
      DisplayLabel = #1055#1088#1086#1094'.'
      FieldName = 'PROCZAMDEC'
      Size = 2
      RoundByScale = True
    end
  end
  object pFIBtrZamDec: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 72
    Top = 528
  end
  object pFIBtrZamDecRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 128
    Top = 528
  end
  object dsZamDec: TDataSource
    DataSet = pFIBdsZamDec
    Left = 192
    Top = 528
  end
end
