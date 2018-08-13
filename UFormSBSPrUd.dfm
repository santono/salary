object FormSbsPrUd: TFormSbsPrUd
  Left = 250
  Top = 217
  Width = 696
  Height = 480
  Caption = #1059#1076#1077#1088#1078#1072#1085#1080#1103' ('#1072#1083#1080#1084#1077#1085#1090#1099')'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DataSourceSbsUd: TDataSource
    DataSet = pFIBDataSetSBSUd
    Left = 48
    Top = 56
  end
  object pFIBDataSetSBSUd: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' W_PLACE,'
      ' (select first 1 name from podr where shifrpod=w_place'
      ' ) as NamePod,'
      ' W_R,'
      ' (case when w_r=1 then '#39#1086#1089#1085#39' else '#39#1089#1074#1084#39' end'
      ' ) as namewr,'
      ' SHIFRGRU,'
      ' (select first 1 name from gruppy where shifr=shifrgru'
      ' ) as namegru,'
      ' SHIFRKAT,'
      ' (select first 1 name from kateg where shifr=shifrkat'
      ' ) as namekat,'
      ' SHIFRSTA,'
      ' (select first 1 shortname from shifr where shifr=shifrsta'
      ' ) as namesta,'
      ' MONTH_ZA,'
      ' YEAR_ZA,'
      ' MONTH_VY,'
      ' YEAR_VY,'
      ' SUMMA,'
      ' MARK'
      'FROM'
      ' TB_SBS_SUD_TABLE '
      'where ShifrIdOwner=:ShifrIdOwner')
    AllowedUpdateKinds = [ukModify]
    Transaction = pFIBTransactionSBSUd
    Database = FIB.pFIBDatabaseSal
    Left = 88
    Top = 56
    object pFIBDataSetSBSUdSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      ReadOnly = True
    end
    object pFIBDataSetSBSUdW_PLACE: TFIBSmallIntField
      DisplayLabel = #1055#1076#1088
      FieldName = 'W_PLACE'
      ReadOnly = True
    end
    object pFIBDataSetSBSUdNAMEPOD: TFIBStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      FieldName = 'NAMEPOD'
      ReadOnly = True
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSetSBSUdW_R: TFIBSmallIntField
      DisplayLabel = #1042#1088
      FieldName = 'W_R'
      ReadOnly = True
    end
    object pFIBDataSetSBSUdNAMEWR: TFIBStringField
      DisplayLabel = #1042'.'#1056'.'
      FieldName = 'NAMEWR'
      ReadOnly = True
      Size = 3
      EmptyStrToNull = True
    end
    object pFIBDataSetSBSUdSHIFRGRU: TFIBSmallIntField
      FieldName = 'SHIFRGRU'
      ReadOnly = True
    end
    object pFIBDataSetSBSUdNAMEGRU: TFIBStringField
      DisplayLabel = #1057#1095#1077#1090
      FieldName = 'NAMEGRU'
      ReadOnly = True
      EmptyStrToNull = True
    end
    object pFIBDataSetSBSUdSHIFRKAT: TFIBSmallIntField
      FieldName = 'SHIFRKAT'
      ReadOnly = True
    end
    object pFIBDataSetSBSUdNAMEKAT: TFIBStringField
      DisplayLabel = #1050#1072#1090#1077#1075'.'
      FieldName = 'NAMEKAT'
      ReadOnly = True
      Size = 40
      EmptyStrToNull = True
    end
    object pFIBDataSetSBSUdSHIFRSTA: TFIBSmallIntField
      DisplayLabel = #1064#1092#1088
      FieldName = 'SHIFRSTA'
      ReadOnly = True
    end
    object pFIBDataSetSBSUdNAMESTA: TFIBStringField
      DisplayLabel = #1057#1090#1072#1090#1100#1103
      FieldName = 'NAMESTA'
      ReadOnly = True
      EmptyStrToNull = True
    end
    object pFIBDataSetSBSUdMONTH_ZA: TFIBSmallIntField
      DisplayLabel = #1052#1079#1072
      FieldName = 'MONTH_ZA'
      ReadOnly = True
    end
    object pFIBDataSetSBSUdYEAR_ZA: TFIBSmallIntField
      DisplayLabel = #1043#1079#1072
      FieldName = 'YEAR_ZA'
      ReadOnly = True
    end
    object pFIBDataSetSBSUdMONTH_VY: TFIBSmallIntField
      DisplayLabel = #1052#1074
      FieldName = 'MONTH_VY'
      ReadOnly = True
    end
    object pFIBDataSetSBSUdYEAR_VY: TFIBSmallIntField
      DisplayLabel = #1043#1074
      FieldName = 'YEAR_VY'
      ReadOnly = True
    end
    object pFIBDataSetSBSUdSUMMA: TFIBBCDField
      FieldName = #1057#1091#1084#1084#1072
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetSBSUdMARK: TFIBSmallIntField
      FieldName = 'MARK'
    end
  end
  object pFIBTransactionSBSUd: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 128
    Top = 56
  end
end
