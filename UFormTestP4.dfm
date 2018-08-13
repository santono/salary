object FormTestP4: TFormTestP4
  Left = 216
  Top = 178
  Width = 696
  Height = 480
  Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1074#1099#1087#1086#1085#1077#1085#1085#1086#1081' '#1087#1077#1088#1089#1086#1085#1086#1092#1080#1082#1072#1094#1080#1080
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
    436)
  PixelsPerInch = 96
  TextHeight = 20
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 665
    Height = 393
    ActivePage = Tab6
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object Tab6: TTabSheet
      Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103
      DesignSize = (
        657
        358)
      object dxDBGridAdd: TdxDBGrid
        Left = 4
        Top = 8
        Width = 649
        Height = 345
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'TABNO'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceAdd
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridAddTABNO: TdxDBGridMaskColumn
          Caption = #1058#1072#1073' '#1085#1086#1084
          Width = 43
          BandIndex = 0
          RowIndex = 0
          FieldName = 'TABNO'
        end
        object dxDBGridAddFIO: TdxDBGridMaskColumn
          Caption = #1060' '#1048' '#1054
          HeaderAlignment = taCenter
          Width = 150
          BandIndex = 0
          RowIndex = 0
          FieldName = 'FIO'
        end
        object dxDBGridAddNAL_CODE: TdxDBGridMaskColumn
          Caption = #1048#1076' '#1082#1086#1076
          HeaderAlignment = taCenter
          Width = 101
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAL_CODE'
        end
        object dxDBGridAddSUM_TOTAL_6: TdxDBGridCurrencyColumn
          Caption = #1058#1072#1073#1083' 6'
          HeaderAlignment = taCenter
          Width = 126
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUM_TOTAL_6'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
        end
        object dxDBGridAddSUM_TOTAL_7: TdxDBGridCurrencyColumn
          Caption = #1058#1072#1073#1083' 7'
          HeaderAlignment = taCenter
          Width = 109
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUM_TOTAL_7'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
        end
        object dxDBGridAddSUM_SAL: TdxDBGridCurrencyColumn
          Caption = #1053#1072#1095'.'#1072#1088#1093'.'
          HeaderAlignment = taCenter
          Sorted = csUp
          Width = 116
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUM_SAL'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
        end
      end
    end
    object Tab7: TTabSheet
      Caption = #1055#1077#1085#1089' '#1074#1079#1085#1086#1089#1099
      ImageIndex = 1
      DesignSize = (
        657
        358)
      object dxDBGridPens: TdxDBGrid
        Left = 0
        Top = 8
        Width = 657
        Height = 345
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'TABNO'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourcePens
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridPensTABNO: TdxDBGridMaskColumn
          Caption = #1058#1072#1073' '#1085#1086#1084
          HeaderAlignment = taCenter
          Width = 45
          BandIndex = 0
          RowIndex = 0
          FieldName = 'TABNO'
        end
        object dxDBGridPensFIO: TdxDBGridMaskColumn
          Caption = #1060' '#1048' '#1054
          HeaderAlignment = taCenter
          Width = 198
          BandIndex = 0
          RowIndex = 0
          FieldName = 'FIO'
        end
        object dxDBGridPensNAL_CODE: TdxDBGridMaskColumn
          Caption = #1048#1076' '#1082#1086#1076
          HeaderAlignment = taCenter
          Width = 103
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAL_CODE'
        end
        object dxDBGridPensSUM_INS_6: TdxDBGridCurrencyColumn
          Caption = #1055#1077#1085#1089' 6'
          HeaderAlignment = taCenter
          Width = 103
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUM_INS_6'
          DisplayFormat = ',0.00'#39';-,0.00'
          Nullable = False
        end
        object dxDBGridPensSUM_INS_7: TdxDBGridCurrencyColumn
          Caption = #1055#1077#1085#1089' 7'
          HeaderAlignment = taCenter
          Width = 103
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUM_INS_7'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
        end
        object dxDBGridPensSUM_PENS: TdxDBGridCurrencyColumn
          Caption = #1055#1077#1085#1089' '#1072#1088#1093
          HeaderAlignment = taCenter
          Sorted = csUp
          Width = 101
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUM_PENS'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
        end
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 408
    Width = 177
    Height = 25
    Caption = #1042#1099#1087#1086#1085#1080#1090#1100' '#1087#1088#1086#1074#1077#1088#1082#1091
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object pFIBDataSetAdd: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' TABNO,'
      ' FIO,'
      ' NAL_CODE,'
      ' SUM_TOTAL_6,'
      ' sum_total_7,'
      ' SUM_SAL'
      'FROM'
      ' TB_TEST_P04 '
      '  where sum_total_6+sum_total_7<>sum_sal'
      'ORDER BY 1')
    AllowedUpdateKinds = []
    Transaction = pFIBTransaction1
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransaction2
    Left = 52
    Top = 55
    object pFIBDataSetAddTABNO: TFIBIntegerField
      FieldName = 'TABNO'
      ReadOnly = True
    end
    object pFIBDataSetAddFIO: TFIBStringField
      FieldName = 'FIO'
      ReadOnly = True
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSetAddNAL_CODE: TFIBStringField
      FieldName = 'NAL_CODE'
      ReadOnly = True
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSetAddSUM_TOTAL_6: TFIBBCDField
      FieldName = 'SUM_TOTAL_6'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetAddSUM_TOTAL_7: TFIBBCDField
      FieldName = 'SUM_TOTAL_7'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetAddSUM_SAL: TFIBBCDField
      FieldName = 'SUM_SAL'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 92
    Top = 55
  end
  object pFIBTransaction2: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 124
    Top = 55
  end
  object DataSourceAdd: TDataSource
    DataSet = pFIBDataSetAdd
    Left = 156
    Top = 55
  end
  object pFIBDataSetPens: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' TABNO,'
      ' FIO,'
      ' NAL_CODE,'
      ' SUM_INS_6,'
      ' sum_INS_7,'
      ' SUM_PENS'
      'FROM'
      ' TB_TEST_P04 '
      '  where sum_ins_6+sum_ins_7<>sum_pens'
      'ORDER BY 1')
    AllowedUpdateKinds = []
    Transaction = pFIBTransaction3
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransaction4
    Left = 52
    Top = 87
    object pFIBDataSetPensTABNO: TFIBIntegerField
      FieldName = 'TABNO'
      ReadOnly = True
    end
    object pFIBDataSetPensFIO: TFIBStringField
      FieldName = 'FIO'
      ReadOnly = True
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSetPensNAL_CODE: TFIBStringField
      FieldName = 'NAL_CODE'
      ReadOnly = True
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSetPensSUM_INS_6: TFIBBCDField
      FieldName = 'SUM_INS_6'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetPensSUM_INS_7: TFIBBCDField
      FieldName = 'SUM_INS_7'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetPensSUM_PENS: TFIBBCDField
      FieldName = 'SUM_PENS'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
  end
  object pFIBTransaction3: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 92
    Top = 87
  end
  object pFIBTransaction4: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 124
    Top = 87
  end
  object DataSourcePens: TDataSource
    DataSet = pFIBDataSetPens
    Left = 156
    Top = 87
  end
  object pFIBQuery1: TpFIBQuery
    Transaction = pFIBTransaction5
    Database = FIB.pFIBDatabaseSal
    Left = 52
    Top = 119
  end
  object pFIBTransaction5: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 100
    Top = 119
  end
end
