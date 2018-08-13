object FormKomand: TFormKomand
  Left = 229
  Top = 144
  Width = 696
  Height = 546
  Caption = #1057#1087#1080#1089#1086#1082' '#1082#1086#1084#1072#1085#1076#1080#1088#1086#1074#1086#1082
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
    680
    508)
  PixelsPerInch = 96
  TextHeight = 20
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 8
    Width = 186
    Height = 28
    Date = 38656.028459918980000000
    Format = 'MMMM yyyy'
    Time = 38656.028459918980000000
    DateFormat = dfLong
    TabOrder = 0
    OnChange = DateTimePicker1Change
  end
  object dxDBGrid1: TdxDBGrid
    Left = 0
    Top = 48
    Width = 681
    Height = 425
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    ShowSummaryFooter = True
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 1
    DataSource = DataSourceKomand
    Filter.Criteria = {00000000}
    OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoTabThrough, edgoVertThrough]
    OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGrid1TABNO: TdxDBGridMaskColumn
      Caption = #1058'.'#1085'.'
      HeaderAlignment = taCenter
      Width = 60
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
    end
    object dxDBGrid1FIO: TdxDBGridMaskColumn
      Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048' '#1054
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
    object dxDBGrid1F_DATA: TdxDBGridDateColumn
      Caption = #1057
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'F_DATA'
    end
    object dxDBGrid1L_DATA: TdxDBGridDateColumn
      Caption = #1087#1086
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'L_DATA'
    end
    object dxDBGrid1K_WO_DAY: TdxDBGridMaskColumn
      Caption = #1044#1085#1077#1081
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'K_WO_DAY'
      SummaryFooterType = cstSum
    end
    object dxDBGrid1SUMMA_BOL: TdxDBGridCurrencyColumn
      Caption = #1057#1091#1084#1084#1072
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMA_BOL'
      SummaryFooterType = cstSum
      DisplayFormat = ',0.00'
      Nullable = False
    end
    object dxDBGrid1Data_P: TdxDBGridColumn
      Caption = #1055#1088#1085#1089
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATA_P'
    end
    object dxDBGrid1SHIFRID: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGrid1ShifrSta: TdxDBGridDateColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFR_STA'
    end
    object dxDBGrid1ColumnModeIll: TdxDBGridColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MODE_ILL'
    end
    object dxDBGrid1Data_P_V: TdxDBGridColumn
      Caption = #1055#1088#1085#1089
      HeaderAlignment = taCenter
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATA_P_V'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 477
    Width = 144
    Height = 25
    DataSource = DataSourceKomand
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbEdit]
    Anchors = [akLeft, akBottom]
    TabOrder = 2
    BeforeAction = DBNavigator1BeforeAction
    OnClick = DBNavigator1Click
  end
  object DataSourceKomand: TDataSource
    DataSet = pFIBDataSetKomand
    Left = 8
    Top = 56
  end
  object pFIBDataSetKomand: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE BOLN'
      'SET '
      '    TABNO = :TABNO,'
      '    FIO = :FIO,'
      '    F_DATA = :F_DATA,'
      '    L_DATA = :L_DATA,'
      '    K_WO_DAY = :K_WO_DAY,'
      '    SUMMA_BOL = :SUMMA_BOL'
      'WHERE'
      '    SHIFRID = :OLD_SHIFRID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    BOLN'
      'WHERE'
      '        SHIFRID = :OLD_SHIFRID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO BOLN('
      '    TABNO,'
      '    FIO,'
      '    F_DATA,'
      '    L_DATA,'
      '    K_WO_DAY,'
      '    SUMMA_BOL,'
      '    SHIFRID'
      ')'
      'VALUES('
      '    :TABNO,'
      '    :FIO,'
      '    :F_DATA,'
      '    :L_DATA,'
      '    :K_WO_DAY,'
      '    :SUMMA_BOL,'
      '    :SHIFRID'
      ')')
    RefreshSQL.Strings = (
      
        'select tabno,fio,f_data,l_data,k_wo_day,summa_bol,ShifrId from b' +
        'oln'
      'where(  Year_Vy=:WantedYear and Month_Vy=:WantedMonth'
      '     ) and (     BOLN.SHIFRID = :OLD_SHIFRID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      
        'select tabno,fio,f_data,l_data,k_wo_day,summa_kmd,ShifrId,ShifrK' +
        'at,ShifrGru,Data_P_Bud,Mode_V_Z,Shifr_Sta,MEAN_DAY,MEAN_DAY_BUD,' +
        'MEAN_DAY_VNE,MEAN_DAY_GN,MEAN_DAY_NIS,Data_P_Vne,SHIFRBUH from t' +
        'b_komand'
      'where Year_Vy=:WantedYear and Month_Vy=:WantedMonth'
      'order by fio')
    OnCalcFields = pFIBDataSetKomandCalcFields
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionSecond
    AutoCommit = True
    Left = 8
    Top = 88
    object pFIBDataSetKomandTABNO: TFIBIntegerField
      FieldName = 'TABNO'
      Origin = 'BOLN.TABNO'
    end
    object pFIBDataSetKomandFIO: TFIBStringField
      FieldName = 'FIO'
      Origin = 'BOLN.FIO'
      Size = 51
      EmptyStrToNull = True
    end
    object pFIBDataSetKomandF_DATA: TFIBDateField
      FieldName = 'F_DATA'
      Origin = 'BOLN.F_DATA'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object pFIBDataSetKomandL_DATA: TFIBDateField
      FieldName = 'L_DATA'
      Origin = 'BOLN.L_DATA'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object pFIBDataSetKomandK_WO_DAY: TFIBSmallIntField
      FieldName = 'K_WO_DAY'
      Origin = 'BOLN.K_WO_DAY'
    end
    object pFIBDataSetKomandSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      Origin = 'BOLN.SHIFRID'
    end
    object pFIBDataSetKomandSHIFRKAT: TFIBSmallIntField
      FieldName = 'SHIFRKAT'
      Origin = 'BOLN.SHIFRKAT'
    end
    object pFIBDataSetKomandSHIFRGRU: TFIBSmallIntField
      FieldName = 'SHIFRGRU'
      Origin = 'BOLN.SHIFRGRU'
    end
    object pFIBDataSetKomandDATA_P: TStringField
      FieldKind = fkCalculated
      FieldName = 'DATA_P'
      Origin = 'CALCULATED.DATA_P'
      Size = 10
      Calculated = True
    end
    object pFIBDataSetKomandDATA_P_BUD: TFIBDateField
      FieldName = 'DATA_P_BUD'
      Origin = 'BOLN.DATA_P_BUD'
    end
    object pFIBDataSetKomandMODE_V_Z: TFIBSmallIntField
      FieldName = 'MODE_V_Z'
    end
    object pFIBDataSetKomandSHIFR_STA: TFIBSmallIntField
      FieldName = 'SHIFR_STA'
    end
    object pFIBDataSetKomandMEAN_DAY_BUD: TFIBBCDField
      FieldName = 'MEAN_DAY_BUD'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetKomandMEAN_DAY_VNE: TFIBBCDField
      FieldName = 'MEAN_DAY_VNE'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetKomandMEAN_DAY_GN: TFIBBCDField
      FieldName = 'MEAN_DAY_GN'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetKomandMEAN_DAY_NIS: TFIBBCDField
      FieldName = 'MEAN_DAY_NIS'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetKomandMEAN_DAY: TFIBBCDField
      FieldName = 'MEAN_DAY'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetKomandDATA_P_VNE: TFIBDateField
      FieldName = 'DATA_P_VNE'
    end
    object pFIBDataSetKomandDATA_P_V: TStringField
      FieldKind = fkCalculated
      FieldName = 'DATA_P_V'
      Size = 10
      Calculated = True
    end
    object pFIBDataSetKomandSHIFRBUH: TFIBIntegerField
      FieldName = 'SHIFRBUH'
    end
    object pFIBDataSetKomandSUMMA_KMD: TFIBBCDField
      FieldName = 'SUMMA_KMD'
      Size = 2
      RoundByScale = True
    end
  end
  object pFIBTransactionSecond: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 80
    Top = 88
  end
  object pFIBTransactionRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed'
      '')
    TPBMode = tpbDefault
    Left = 48
    Top = 88
  end
end
