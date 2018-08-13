object FormTestE4: TFormTestE4
  Left = 241
  Top = 222
  Width = 696
  Height = 480
  Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1074#1099#1087#1086#1085#1077#1085#1085#1086#1086#1075#1086' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103' '#1045#1057#1042
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
    680
    442)
  PixelsPerInch = 96
  TextHeight = 20
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 665
    Height = 393
    ActivePage = TabMinZP
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object Tab6: TTabSheet
      Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103
      DesignSize = (
        657
        358)
      object dxDBGridAdd: TdxDBGrid
        Left = 12
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
          Caption = #1053#1072#1095#1080#1089#1083' '#1074' '#1090'.6'
          HeaderAlignment = taCenter
          Width = 126
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUM_TOTAL'
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
      Caption = #1045#1057#1042
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
        object dxDBGridPensSUM_INS: TdxDBGridCurrencyColumn
          Caption = #1045#1057#1042' '#1074' '#1090'.6'
          HeaderAlignment = taCenter
          Width = 103
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUM_INS'
          DisplayFormat = ',0.00'
          Nullable = False
        end
        object dxDBGridPensSUM_ECB: TdxDBGridCurrencyColumn
          Caption = #1045#1057#1042' '#1074' '#1072#1088#1093
          HeaderAlignment = taCenter
          Sorted = csDown
          Width = 101
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUM_ECB'
          DisplayFormat = ',0.00;'
          Nullable = False
        end
      end
    end
    object TabMinZP: TTabSheet
      Caption = #1052#1080#1085'. '#1047#1055
      ImageIndex = 2
      OnResize = TabMinZPResize
      object Label1: TLabel
        Left = 24
        Top = 8
        Width = 229
        Height = 20
        Caption = #1045#1089#1090#1100' '#1074' '#1090#1072#1073#1083'.6, '#1085#1086' '#1085#1077#1090' '#1074' '#1089#1087#1080#1089#1082#1077
      end
      object Label2: TLabel
        Left = 344
        Top = 8
        Width = 229
        Height = 20
        Caption = #1045#1089#1090#1100' '#1074' '#1089#1087#1080#1089#1082#1077' '#1085#1086' '#1085#1077#1090' '#1074' '#1090#1072#1073#1083'. 6'
      end
      object Splitter1: TSplitter
        Left = 0
        Top = 0
        Height = 358
      end
      object dxDBGridE6MZ: TdxDBGrid
        Left = 3
        Top = 0
        Width = 313
        Height = 358
        Hint = #1045#1089#1090#1100' '#1074' '#1090#1072#1073#1083#1080#1094#1077' 6 , '#1085#1086' '#1085#1077#1090' '#1074' '#1089#1087#1080#1089#1082#1077
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'Key'
        ShowSummaryFooter = True
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alLeft
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        DataSource = dsoE6MZ
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        object dxDBGridE6MZTABNO: TdxDBGridMaskColumn
          Caption = #1090'.'#1085'.'
          Width = 24
          BandIndex = 0
          RowIndex = 0
          FieldName = 'TABNO'
        end
        object dxDBGridE6MZFIO: TdxDBGridMaskColumn
          Caption = #1055#1030#1041
          HeaderAlignment = taCenter
          Sorted = csUp
          Width = 152
          BandIndex = 0
          RowIndex = 0
          FieldName = 'FIO'
        end
        object dxDBGridE6MZPAY_YEAR: TdxDBGridMaskColumn
          Caption = #1056#1110#1082
          HeaderAlignment = taCenter
          Width = 25
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PAY_YEAR'
        end
        object dxDBGridE6MZPAY_MNTH: TdxDBGridMaskColumn
          Caption = #1052'-'#1094
          HeaderAlignment = taCenter
          Width = 30
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PAY_MNTH'
        end
        object dxDBGridE6MZSUM_DIFF: TdxDBGridCurrencyColumn
          Caption = #1057#1091#1084#1072
          HeaderAlignment = taCenter
          Width = 102
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUM_DIFF'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryType = cstSum
          SummaryField = 'SUM_DIFF'
        end
        object dxDBGridE6MZKey: TdxDBGridColumn
          Visible = False
          Width = 385
          BandIndex = 0
          RowIndex = 0
          FieldName = 'Key'
        end
      end
      object dxDBGridMZE6: TdxDBGrid
        Left = 316
        Top = 0
        Width = 341
        Height = 358
        Hint = #1045#1089#1090#1100' '#1074' '#1089#1087#1080#1089#1082#1077', '#1085#1086' '#1085#1077#1090' '#1074' '#1090#1072#1073#1083#1080#1094#1077' 6'
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'key'
        ShowSummaryFooter = True
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        DataSource = dsoMZE6
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        object dxDBGridMZE6TABNO: TdxDBGridMaskColumn
          Caption = #1090'.'#1085'.'
          HeaderAlignment = taCenter
          Width = 29
          BandIndex = 0
          RowIndex = 0
          FieldName = 'TABNO'
        end
        object dxDBGridMZE6FIO: TdxDBGridMaskColumn
          Caption = #1055#1030#1041
          HeaderAlignment = taCenter
          Width = 70
          BandIndex = 0
          RowIndex = 0
          FieldName = 'FIO'
        end
        object dxDBGridMZE6YEAR_ZA: TdxDBGridMaskColumn
          Caption = #1056#1110#1082
          HeaderAlignment = taCenter
          Width = 43
          BandIndex = 0
          RowIndex = 0
          FieldName = 'YEAR_ZA'
        end
        object dxDBGridMZE6MONTH_ZA: TdxDBGridMaskColumn
          Caption = #1052'-'#1094
          HeaderAlignment = taCenter
          Width = 43
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MONTH_ZA'
        end
        object dxDBGridMZE6SUMMA_RAZN: TdxDBGridCurrencyColumn
          Caption = #1057#1091#1084#1072
          HeaderAlignment = taCenter
          Width = 70
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_RAZN'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMA_RAZN'
        end
        object dxDBGridMZE6WORKDAY: TdxDBGridMaskColumn
          Caption = #1044#1085
          HeaderAlignment = taCenter
          Width = 30
          BandIndex = 0
          RowIndex = 0
          FieldName = 'WORKDAY'
        end
        object dxDBGridMZE6KOEF: TdxDBGridCurrencyColumn
          Caption = #1057#1090'.'
          HeaderAlignment = taCenter
          Width = 32
          BandIndex = 0
          RowIndex = 0
          FieldName = 'KOEF'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
        end
        object dxDBGridMZE6key: TdxDBGridColumn
          Visible = False
          Width = 97
          BandIndex = 0
          RowIndex = 0
          FieldName = 'key'
        end
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 408
    Width = 177
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1087#1088#1086#1074#1077#1088#1082#1091
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object pFIBDataSetAdd: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' TABNO,'
      ' FIO,'
      ' NAL_CODE,'
      ' SUM_TOTAL,'
      ' SUM_SAL'
      'FROM'
      ' TB_TEST_e04 '
      '  where sum_total<>sum_sal'
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
    object pFIBDataSetAddSUM_SAL: TFIBBCDField
      FieldName = 'SUM_SAL'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetAddSUM_TOTAL: TFIBBCDField
      FieldName = 'SUM_TOTAL'
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
      ' SUM_INS,'
      ' SUM_ECB'
      'FROM'
      ' TB_TEST_E04 '
      '  where sum_ins<>sum_ecb'
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
    object pFIBDataSetPensSUM_INS: TFIBBCDField
      FieldName = 'SUM_INS'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetPensSUM_ECB: TFIBBCDField
      FieldName = 'SUM_ECB'
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
  object dsoE6MZ: TDataSource
    DataSet = dsE6MZ
    Left = 156
    Top = 159
  end
  object dsoMZE6: TDataSource
    DataSet = dsMZE6
    Left = 156
    Top = 191
  end
  object dsE6MZ: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select zz.tabno,zz.fio,zz.pay_year,zz.pay_mnth,zz.sum_diff  from' +
        ' tb_e04t06c zz'
      '  where not exists ('
      '        select * from tb_sv_less_min_zp bz'
      '           where  zz.yearvy  = bz.y'
      '             and  zz.monthvy = bz.m'
      '             and  zz.tabno    = bz.tabno'
      '             and  zz.pay_mnth = bz.month_za'
      '             and  zz.pay_year = bz.year_za'
      '      )'
      '      and zz.pay_tp=13'
      '      and zz.yearvy=:Y'
      '      and zz.monthvy=:M')
    OnCalcFields = dsE6MZCalcFields
    Transaction = pFIBTransactionMZ
    Database = FIB.pFIBDatabaseSal
    Left = 52
    Top = 159
    object dsE6MZTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object dsE6MZFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 100
      EmptyStrToNull = True
    end
    object dsE6MZPAY_YEAR: TFIBSmallIntField
      FieldName = 'PAY_YEAR'
    end
    object dsE6MZPAY_MNTH: TFIBSmallIntField
      FieldName = 'PAY_MNTH'
    end
    object dsE6MZSUM_DIFF: TFIBBCDField
      FieldName = 'SUM_DIFF'
      Size = 2
      RoundByScale = True
    end
    object dsE6MZKey: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Key'
      Calculated = True
    end
  end
  object dsMZE6: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select z.tabno,z.fio,z.year_za,z.month_za,z.summa_razn,z.workday' +
        ',z.koef  from tb_sv_less_min_zp z'
      '  where not exists ('
      '        select * from tb_e04t06c az'
      '           where  az.yearvy  = z.y'
      '             and  az.monthvy = z.m'
      '             and az.tabno    = z.tabno'
      '             and az.pay_tp   = 13'
      '             and az.pay_mnth = z.month_za'
      '             and az.pay_year = z.year_za'
      '             and abs(abs(az.sum_diff)-abs(z.summa_razn))<0.01'
      '      )'
      '      and z.y=:y'
      '      and z.m=:m')
    OnCalcFields = dsMZE6CalcFields
    Transaction = pFIBTransactionMZ
    Database = FIB.pFIBDatabaseSal
    Left = 52
    Top = 191
    object dsMZE6TABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object dsMZE6FIO: TFIBStringField
      FieldName = 'FIO'
      Size = 50
      EmptyStrToNull = True
    end
    object dsMZE6YEAR_ZA: TFIBIntegerField
      FieldName = 'YEAR_ZA'
    end
    object dsMZE6MONTH_ZA: TFIBIntegerField
      FieldName = 'MONTH_ZA'
    end
    object dsMZE6SUMMA_RAZN: TFIBBCDField
      FieldName = 'SUMMA_RAZN'
      Size = 2
      RoundByScale = True
    end
    object dsMZE6WORKDAY: TFIBIntegerField
      FieldName = 'WORKDAY'
    end
    object dsMZE6KOEF: TFIBBCDField
      FieldName = 'KOEF'
      Size = 2
      RoundByScale = True
    end
    object dsMZE6key: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'key'
      Calculated = True
    end
  end
  object pFIBTransactionMZ: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 92
    Top = 159
  end
  object pFIBTransaction7: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 112
    Top = 64
  end
end
