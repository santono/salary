object DataModuleSPR: TDataModuleSPR
  OldCreateOrder = False
  Left = 508
  Top = 288
  Height = 209
  Width = 361
  object pFIBDataSetSSLimity: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SSLIMITY'
      'SET '
      ' DATEFR = :DATEFR,'
      ' LIMPROC = :LIMPROC,'
      ' LIMITMAX = :LIMITMAX,'
      ' PROCSSDOLIM = :PROCSSDOLIM,'
      ' PROCSSAFTERLIM = :PROCSSAFTERLIM,'
      ' MINSAL = :MINSAL,'
      ' PROGMIN = :PROGMIN'
      'WHERE'
      ' DATEFR = :OLD_DATEFR'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' SSLIMITY'
      'WHERE'
      '  DATEFR = :OLD_DATEFR'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO SSLIMITY('
      ' DATEFR,'
      ' LIMPROC,'
      ' LIMITMAX,'
      ' PROCSSDOLIM,'
      ' PROCSSAFTERLIM,'
      ' MINSAL,'
      ' PROGMIN'
      ')'
      'VALUES('
      ' :DATEFR,'
      ' :LIMPROC,'
      ' :LIMITMAX,'
      ' :PROCSSDOLIM,'
      ' :PROCSSAFTERLIM,'
      ' :MINSAL,'
      ' :PROGMIN'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' DATEFR,'
      ' LIMPROC,'
      ' LIMITMAX,'
      ' PROCSSDOLIM,'
      ' PROCSSAFTERLIM,'
      ' MINSAL,'
      ' PROGMIN'
      'FROM'
      ' SSLIMITY '
      ''
      ' WHERE '
      '  SSLIMITY.DATEFR = :OLD_DATEFR'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' DATEFR,'
      ' LIMPROC,'
      ' LIMITMAX,'
      ' PROCSSDOLIM,'
      ' PROCSSAFTERLIM,'
      ' MINSAL,'
      ' PROGMIN'
      'FROM'
      ' SSLIMITY '
      'ORDER BY'
      ' DATEFR ')
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    Left = 72
    Top = 16
    object pFIBDataSetSSLimityDATEFR: TFIBDateField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DATEFR'
    end
    object pFIBDataSetSSLimityLIMPROC: TFIBBCDField
      DisplayLabel = #1055#1086#1088#1086#1075' % '#1089#1086#1094'.'#1089#1090#1088#1072#1093#1072
      FieldName = 'LIMPROC'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetSSLimityLIMITMAX: TFIBBCDField
      DisplayLabel = #1051#1080#1084#1080#1090' '#1076#1083#1103' '#1089#1089
      FieldName = 'LIMITMAX'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetSSLimityPROCSSDOLIM: TFIBBCDField
      DisplayLabel = #1055#1088#1086#1094' '#1089#1089' '#1076#1086' '#1083#1080#1084#1080#1090#1072
      FieldName = 'PROCSSDOLIM'
      Size = 3
      RoundByScale = True
    end
    object pFIBDataSetSSLimityPROCSSAFTERLIM: TFIBBCDField
      DisplayLabel = #1055#1088#1086#1094' '#1089#1089' '#1087#1086#1089#1083#1077' '#1083#1080#1084#1080#1090#1072
      FieldName = 'PROCSSAFTERLIM'
      Size = 3
      RoundByScale = True
    end
    object pFIBDataSetSSLimityMINSAL: TFIBBCDField
      DisplayLabel = #1052#1080#1085' '#1079' '#1087
      FieldName = 'MINSAL'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetSSLimityPROGMIN: TFIBBCDField
      DisplayLabel = #1055#1088#1086#1078' '#1084#1080#1085#1080#1084
      FieldName = 'PROGMIN'
      Size = 2
      RoundByScale = True
    end
  end
  object DataSourceSSLimity: TDataSource
    DataSet = pFIBDataSetSSLimity
    Left = 40
    Top = 72
  end
end
