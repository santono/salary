object FormBolnAbo: TFormBolnAbo
  Left = 244
  Top = 172
  Width = 733
  Height = 470
  Caption = 'FormBolnAbo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridBA: TdxDBGrid
    Left = 8
    Top = 8
    Width = 673
    Height = 417
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = DataSourceBA
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    object dxDBGridBAYEAR_VY: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'YEAR_VY'
    end
    object dxDBGridBAMONTH_VY: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MONTH_VY'
    end
    object dxDBGridBAF_DATA: TdxDBGridDateColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'F_DATA'
    end
    object dxDBGridBAL_DATA: TdxDBGridDateColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'L_DATA'
    end
    object dxDBGridBAK_WO_DAY: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'K_WO_DAY'
    end
    object dxDBGridBASUMMA_BOL: TdxDBGridCurrencyColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMA_BOL'
      Nullable = False
    end
    object dxDBGridBANOMER_B: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Sorted = csUp
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NOMER_B'
    end
    object dxDBGridBAdata_p: TdxDBGridColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'data_p'
    end
  end
  object pFIBDataSetBA: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select Year_Vy,Month_Vy,f_data,l_data,k_wo_day,summa_bol,ShifrId' +
        ',ShifrKat,ShifrGru,Nomer_B,Data_P_Bud,code_reason_ill from boln'
      'where Tabno=:Tabno'
      'order by Year_Vy desc, Month_Vy desc')
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    Left = 56
    Top = 40
    object pFIBDataSetBAYEAR_VY: TFIBSmallIntField
      DisplayLabel = #1043#1086#1076
      FieldName = 'YEAR_VY'
    end
    object pFIBDataSetBAMONTH_VY: TFIBSmallIntField
      DisplayLabel = #1052#1094
      FieldName = 'MONTH_VY'
    end
    object pFIBDataSetBAF_DATA: TFIBDateField
      DisplayLabel = #1057
      FieldName = 'F_DATA'
    end
    object pFIBDataSetBAL_DATA: TFIBDateField
      DisplayLabel = #1055#1086
      FieldName = 'L_DATA'
    end
    object pFIBDataSetBAK_WO_DAY: TFIBSmallIntField
      DisplayLabel = #1044#1085#1077#1081
      FieldName = 'K_WO_DAY'
    end
    object pFIBDataSetBASUMMA_BOL: TFIBBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA_BOL'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetBASHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object pFIBDataSetBANOMER_B: TFIBStringField
      DisplayLabel = #8470' '#1041#1083#1085
      FieldName = 'NOMER_B'
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSetBADATA_P_BUD: TFIBDateField
      FieldName = 'DATA_P_BUD'
    end
    object pFIBDataSetBAdata_p: TStringField
      DisplayLabel = #1055#1077#1088#1077#1085#1077#1089#1077#1085#1086
      FieldKind = fkCalculated
      FieldName = 'data_p'
      Size = 10
      Calculated = True
    end
    object pFIBDataSetBACODE_REASON_ILL: TFIBIntegerField
      FieldName = 'CODE_REASON_ILL'
    end
  end
  object DataSourceBA: TDataSource
    DataSet = pFIBDataSetBA
    Left = 8
    Top = 40
  end
end
