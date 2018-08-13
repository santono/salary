object FormSbsPrAdd: TFormSbsPrAdd
  Left = 255
  Top = 149
  Width = 696
  Height = 480
  Caption = #1056#1072#1089#1096#1080#1092#1088#1086#1074#1082#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    680
    444)
  PixelsPerInch = 96
  TextHeight = 20
  object LabelCmnt: TLabel
    Left = 8
    Top = 8
    Width = 77
    Height = 20
    Caption = 'LabelCmnt'
  end
  object dxDBGridSBSPrAdd: TdxDBGrid
    Left = 8
    Top = 32
    Width = 665
    Height = 377
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    OnDblClick = dxDBGridSBSPrAddDblClick
    DataSource = DataSourceSBSPrADD
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridSBSPrAddSHIFRID: TdxDBGridMaskColumn
      Visible = False
      Width = 118
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGridSBSPrAddMARK: TdxDBGridCheckColumn
      Width = 35
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MARK'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridSBSPrAddSUMMA: TdxDBGridCurrencyColumn
      Width = 72
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00;-,0.00'
      Nullable = False
    end
    object dxDBGridSBSPrAddW_PLACE: TdxDBGridMaskColumn
      Sorted = csUp
      Width = 35
      BandIndex = 0
      RowIndex = 0
      FieldName = 'W_PLACE'
    end
    object dxDBGridSBSPrAddNAMEPOD: TdxDBGridMaskColumn
      Width = 114
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAMEPOD'
    end
    object dxDBGridSBSPrAddW_R: TdxDBGridMaskColumn
      Visible = False
      Width = 118
      BandIndex = 0
      RowIndex = 0
      FieldName = 'W_R'
    end
    object dxDBGridSBSPrAddNAMEWR: TdxDBGridMaskColumn
      Width = 22
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAMEWR'
    end
    object dxDBGridSBSPrAddSHIFRGRU: TdxDBGridMaskColumn
      Visible = False
      Width = 118
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRGRU'
    end
    object dxDBGridSBSPrAddNAMEGRU: TdxDBGridMaskColumn
      Width = 57
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAMEGRU'
    end
    object dxDBGridSBSPrAddSHIFRKAT: TdxDBGridMaskColumn
      Visible = False
      Width = 118
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRKAT'
    end
    object dxDBGridSBSPrAddNAMEKAT: TdxDBGridMaskColumn
      Width = 57
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAMEKAT'
    end
    object dxDBGridSBSPrAddSHIFRSTA: TdxDBGridMaskColumn
      Width = 29
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRSTA'
    end
    object dxDBGridSBSPrAddNAMESTA: TdxDBGridMaskColumn
      Width = 75
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAMESTA'
    end
    object dxDBGridSBSPrAddMONTH_ZA: TdxDBGridMaskColumn
      Width = 37
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MONTH_ZA'
    end
    object dxDBGridSBSPrAddYEAR_ZA: TdxDBGridMaskColumn
      Width = 45
      BandIndex = 0
      RowIndex = 0
      FieldName = 'YEAR_ZA'
    end
    object dxDBGridSBSPrAddMONTH_VY: TdxDBGridMaskColumn
      Width = 45
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MONTH_VY'
    end
    object dxDBGridSBSPrAddYEAR_VY: TdxDBGridMaskColumn
      Width = 46
      BandIndex = 0
      RowIndex = 0
      FieldName = 'YEAR_VY'
    end
  end
  object DataSourceSBSPrADD: TDataSource
    DataSet = pFIBDataSetSBSPrAdd
    Left = 48
    Top = 88
  end
  object pFIBDataSetSBSPrAdd: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_SBS_SAD_TABLE'
      'SET '
      ' MARK = :MARK'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_SBS_SAD_TABLE'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_SBS_SAD_TABLE('
      ' MARK'
      ')'
      'VALUES('
      ' :MARK'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' W_PLACE,'
      ' W_R,'
      ' SHIFRGRU,'
      ' SHIFRKAT,'
      ' SHIFRSTA,'
      ' MONTH_ZA,'
      ' YEAR_ZA,'
      ' MONTH_VY,'
      ' YEAR_VY,'
      ' SUMMA,'
      ' MARK'
      'FROM'
      ' TB_SBS_SAD_TABLE '
      'where(  ShifrIdOwner=:ShifrIdOwner'
      '  ) and (  TB_SBS_SAD_TABLE.SHIFRID = :OLD_SHIFRID'
      '  )'
      ' ')
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
      ' TB_SBS_SAD_TABLE '
      'where ShifrIdOwner=:ShifrIdOwner')
    Transaction = pFIBTransactionSBSPrAdd
    Database = FIB.pFIBDatabaseSal
    Left = 96
    Top = 80
    object pFIBDataSetSBSPrAddSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      ReadOnly = True
    end
    object pFIBDataSetSBSPrAddW_PLACE: TFIBSmallIntField
      DisplayLabel = #1055#1076#1088
      FieldName = 'W_PLACE'
      ReadOnly = True
    end
    object pFIBDataSetSBSPrAddNAMEPOD: TFIBStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      FieldName = 'NAMEPOD'
      ReadOnly = True
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSetSBSPrAddW_R: TFIBSmallIntField
      FieldName = 'W_R'
      ReadOnly = True
    end
    object pFIBDataSetSBSPrAddNAMEWR: TFIBStringField
      DisplayLabel = #1042'.'#1088'.'
      FieldName = 'NAMEWR'
      ReadOnly = True
      Size = 3
      EmptyStrToNull = True
    end
    object pFIBDataSetSBSPrAddSHIFRGRU: TFIBSmallIntField
      FieldName = 'SHIFRGRU'
      ReadOnly = True
    end
    object pFIBDataSetSBSPrAddNAMEGRU: TFIBStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      FieldName = 'NAMEGRU'
      ReadOnly = True
      EmptyStrToNull = True
    end
    object pFIBDataSetSBSPrAddSHIFRKAT: TFIBSmallIntField
      FieldName = 'SHIFRKAT'
      ReadOnly = True
    end
    object pFIBDataSetSBSPrAddNAMEKAT: TFIBStringField
      DisplayLabel = #1050#1072#1090#1077#1075
      FieldName = 'NAMEKAT'
      ReadOnly = True
      Size = 40
      EmptyStrToNull = True
    end
    object pFIBDataSetSBSPrAddSHIFRSTA: TFIBSmallIntField
      DisplayLabel = #1064#1092#1088
      FieldName = 'SHIFRSTA'
      ReadOnly = True
    end
    object pFIBDataSetSBSPrAddNAMESTA: TFIBStringField
      DisplayLabel = #1057#1090#1072#1090#1100#1103
      FieldName = 'NAMESTA'
      ReadOnly = True
      EmptyStrToNull = True
    end
    object pFIBDataSetSBSPrAddMONTH_ZA: TFIBSmallIntField
      DisplayLabel = #1052'-'#1094' '#1079#1072
      FieldName = 'MONTH_ZA'
      ReadOnly = True
    end
    object pFIBDataSetSBSPrAddYEAR_ZA: TFIBSmallIntField
      DisplayLabel = #1043#1086#1076' '#1079#1072
      FieldName = 'YEAR_ZA'
      ReadOnly = True
    end
    object pFIBDataSetSBSPrAddMONTH_VY: TFIBSmallIntField
      DisplayLabel = #1052'-'#1094' '#1074
      FieldName = 'MONTH_VY'
      ReadOnly = True
    end
    object pFIBDataSetSBSPrAddYEAR_VY: TFIBSmallIntField
      DisplayLabel = #1043#1086#1076' '#1074
      FieldName = 'YEAR_VY'
      ReadOnly = True
    end
    object pFIBDataSetSBSPrAddSUMMA: TFIBBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetSBSPrAddMARK: TFIBSmallIntField
      DisplayLabel = #1052#1088#1082
      FieldName = 'MARK'
    end
  end
  object pFIBTransactionSBSPrAdd: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 136
    Top = 72
  end
end
