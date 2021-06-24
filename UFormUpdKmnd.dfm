object FormUpdKmnd: TFormUpdKmnd
  Left = 226
  Top = 131
  Width = 790
  Height = 639
  Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1079#1072#1087#1080#1089#1080' '#1088#1072#1089#1095#1077#1090#1072' '#1082#1086#1084#1072#1085#1076#1080#1088#1086#1074#1086#1095#1085#1099#1093
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object LabelFIO: TLabel
    Left = 40
    Top = 16
    Width = 46
    Height = 20
    Caption = #1060' '#1048' '#1054
  end
  object LabelBDay: TLabel
    Left = 248
    Top = 48
    Width = 39
    Height = 20
    Caption = #1044#1085#1077#1081
  end
  object LabelWR: TLabel
    Left = 336
    Top = 48
    Width = 91
    Height = 20
    Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099
  end
  object BitBtn1: TBitBtn
    Left = 712
    Top = 16
    Width = 49
    Height = 25
    Caption = '. . .'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object DateTimePickerFr: TDateTimePicker
    Left = 8
    Top = 48
    Width = 113
    Height = 28
    Date = 38656.991369699080000000
    Time = 38656.991369699080000000
    TabOrder = 1
  end
  object DateTimePickerTo: TDateTimePicker
    Left = 128
    Top = 48
    Width = 113
    Height = 28
    Date = 38656.991818379640000000
    Time = 38656.991818379640000000
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 8
    Top = 496
    Width = 75
    Height = 25
    TabOrder = 3
    OnClick = BitBtn2Click
    Kind = bkOK
  end
  object BitBtn3: TBitBtn
    Left = 88
    Top = 496
    Width = 153
    Height = 25
    Caption = #1048#1085#1080#1094#1080#1072#1083#1080#1079#1072#1094#1080#1103
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 80
    Width = 737
    Height = 409
    ActivePage = TabSheet1
    TabOrder = 5
    object TabSheet1: TTabSheet
      Caption = #1048#1089#1093'.'#1076#1072#1085#1085#1099#1077
      OnShow = TabSheet1Show
      DesignSize = (
        729
        374)
      object dxDBGridSum: TdxDBGrid
        Left = 0
        Top = 8
        Width = 721
        Height = 360
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFRIDTMP'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceSummy
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridSumCONNID: TdxDBGridMaskColumn
          Visible = False
          Width = 62
          BandIndex = 0
          RowIndex = 0
          FieldName = 'CONNID'
        end
        object dxDBGridSumSEL: TdxDBGridCheckColumn
          Caption = #1042
          MinWidth = 20
          Width = 22
          BandIndex = 0
          RowIndex = 0
          OnChange = dxDBGridSumSELChange
          FieldName = 'SEL'
          ValueChecked = '1'
          ValueGrayed = '0'
          ValueUnchecked = '0'
          DisplayChecked = '1'
          DisplayUnChecked = '0'
        end
        object dxDBGridSumManual_calc: TdxDBGridCheckColumn
          Alignment = taLeftJustify
          Caption = #1056'.'#1088'.'
          HeaderAlignment = taCenter
          Width = 34
          BandIndex = 0
          RowIndex = 0
          OnChange = dxDBGridSumManual_calcChange
          FieldName = 'MANUAL_CALC'
          ValueChecked = '1'
          ValueGrayed = '0'
          ValueUnchecked = '0'
          DisplayChecked = '1'
          DisplayUnChecked = '0'
        end
        object dxDBGridSumMONTH_ZA: TdxDBGridCalcColumn
          Caption = #1052'-'#1094
          Width = 47
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MONTH_ZA'
        end
        object dxDBGridSumYEAR_ZA: TdxDBGridCalcColumn
          Caption = #1043#1086#1076
          Width = 52
          BandIndex = 0
          RowIndex = 0
          FieldName = 'YEAR_ZA'
        end
        object dxDBGridSumSUMMA_BUD: TdxDBGridCalcColumn
          Caption = #1041#1102#1076#1078#1077#1090
          Width = 78
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_BUD'
        end
        object dxDBGridSumSUMMA_VNE: TdxDBGridCalcColumn
          Caption = #1042#1085#1077' '#1073#1102#1076#1078#1077#1090
          HeaderAlignment = taCenter
          Width = 127
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_VNE'
        end
        object dxDBGridSumSUMMA_GN: TdxDBGridCalcColumn
          Caption = #1043' '#1085
          HeaderAlignment = taCenter
          Width = 73
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_GN'
        end
        object dxDBGridSumSUMMA_NIS: TdxDBGridCalcColumn
          Caption = #1053#1048#1057
          HeaderAlignment = taCenter
          Width = 71
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_NIS'
        end
        object dxDBGridSumOKLAD_M: TdxDBGridCalcColumn
          Caption = #1054#1082#1083#1072#1076
          Width = 65
          BandIndex = 0
          RowIndex = 0
          FieldName = 'OKLAD_M'
        end
        object dxDBGridSumDAYS: TdxDBGridCalcColumn
          Caption = #1044#1085
          HeaderAlignment = taCenter
          Width = 49
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DAYS'
        end
        object dxDBGridSumGRAPHIC_DAY: TdxDBGridMaskColumn
          Caption = #1043#1088'.'#1076#1085'.'
          Width = 55
          BandIndex = 0
          RowIndex = 0
          FieldName = 'GRAPHIC_DAY'
        end
        object dxDBGridSumKOEF: TdxDBGridCalcColumn
          Caption = #1050#1086#1101#1092
          HeaderAlignment = taCenter
          Width = 105
          BandIndex = 0
          RowIndex = 0
          FieldName = 'KOEF'
        end
        object dxDBGridSumDayKalend: TdxDBGridColumn
          Caption = #1050#1088#1076
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DAY_KALEND_WORK'
        end
        object dxDBGridSumColumnButton: TdxDBGridButtonColumn
          Caption = #1055#1089#1084
          Width = 44
          BandIndex = 0
          RowIndex = 0
          ButtonOnly = True
          Buttons = <
            item
              Default = True
            end>
          OnButtonClick = dxDBGridSumColumnButtonButtonClick
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1056#1072#1089#1095#1077#1090#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
      ImageIndex = 1
      OnShow = TabSheet2Show
      object dxDBGridRes: TdxDBGrid
        Left = 8
        Top = 8
        Width = 713
        Height = 353
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFRIDTMP'
        ShowSummaryFooter = True
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceRes
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        OnBeforeCalcSummary = dxDBGridResBeforeCalcSummary
        OnCustomDrawFooter = dxDBGridResCustomDrawFooter
        object dxDBGridResYEAR_ZA: TdxDBGridCalcColumn
          Caption = #1043#1086#1076
          HeaderAlignment = taCenter
          Width = 86
          BandIndex = 0
          RowIndex = 0
          FieldName = 'YEAR_ZA'
        end
        object dxDBGridResMONTH_ZA: TdxDBGridCalcColumn
          Caption = #1052#1094
          HeaderAlignment = taCenter
          Width = 50
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MONTH_ZA'
        end
        object dxDBGridResSHIFRSTA: TdxDBGridCalcColumn
          Caption = #1064#1092#1088
          HeaderAlignment = taCenter
          Width = 69
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRSTA'
        end
        object dxDBGridResB_DAY: TdxDBGridCalcColumn
          Caption = #1044#1085
          HeaderAlignment = taCenter
          Width = 97
          BandIndex = 0
          RowIndex = 0
          FieldName = 'KMD_DAY'
          SummaryFooterType = cstSum
        end
        object dxDBGridResSUMMA_K_BUD: TdxDBGridCalcColumn
          Caption = #1041#1102#1076#1078#1077#1090
          HeaderAlignment = taCenter
          Width = 97
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_K_BUD'
          SummaryFooterType = cstSum
        end
        object dxDBGridResSUMMA_K_VNE: TdxDBGridCalcColumn
          Caption = #1042#1085#1077' '#1073#1102#1076
          HeaderAlignment = taCenter
          Width = 97
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_K_VNE'
          SummaryFooterType = cstSum
        end
        object dxDBGridResSUMMA_K_GN: TdxDBGridCalcColumn
          Caption = #1043#1053
          HeaderAlignment = taCenter
          Width = 97
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_K_GN'
          SummaryFooterType = cstSum
        end
        object dxDBGridResSUMMA_K_NIS: TdxDBGridCalcColumn
          Caption = #1053#1048#1057
          HeaderAlignment = taCenter
          Width = 95
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_K_NIS'
          SummaryFooterType = cstSum
        end
        object dxDBGridResColumn9: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRIDTMP'
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1057#1088#1077#1076#1085#1077#1076#1085#1077#1074#1085#1099#1077
      ImageIndex = 2
      OnShow = TabSheet3Show
      object StringGridMean: TStringGrid
        Left = 8
        Top = 8
        Width = 273
        Height = 137
        ColCount = 4
        TabOrder = 0
      end
    end
  end
  object BitBtn4: TBitBtn
    Left = 248
    Top = 496
    Width = 89
    Height = 25
    Caption = #1056#1072#1089#1095#1077#1090
    TabOrder = 6
    OnClick = BitBtn4Click
  end
  object Save: TBitBtn
    Left = 352
    Top = 496
    Width = 105
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 7
    OnClick = SaveClick
  end
  object RadioGroupModeZaVy: TRadioGroup
    Left = 480
    Top = 496
    Width = 137
    Height = 41
    Hint = #1056#1077#1078#1080#1084' '#1080#1085#1080#1094#1080#1072#1083#1080#1079#1072#1094#1080#1080' '#1074' '#1080#1083#1080' '#1079#1072
    Caption = #1056#1077#1078#1080#1084' '#1088#1072#1089#1095#1077#1090#1072
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #1074' '
      #1079#1072)
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
  end
  object BitBtnDelNotSel: TBitBtn
    Left = 624
    Top = 498
    Width = 97
    Height = 25
    Caption = #1059#1076'.'#1085#1077' '#1086#1090#1084'.'
    TabOrder = 9
    OnClick = BitBtnDelNotSelClick
  end
  object BitBtn5: TBitBtn
    Left = 624
    Top = 528
    Width = 97
    Height = 25
    Caption = #1057#1093#1088'.'#1090#1077#1082'.'#1084#1077#1089'.'
    TabOrder = 10
    OnClick = BitBtn5Click
  end
  object RadioGroupModeDC: TRadioGroup
    Left = 248
    Top = 520
    Width = 185
    Height = 49
    Caption = #1057#1088#1077#1076#1085#1077
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #1076#1085#1077#1074#1085#1072#1103
      #1095#1072#1089#1086#1074#1072#1103)
    TabOrder = 11
    OnClick = RadioGroupModeDCClick
  end
  object ComboBoxBuh: TComboBox
    Left = 440
    Top = 552
    Width = 281
    Height = 28
    ItemHeight = 20
    TabOrder = 12
    Text = #1059#1095#1072#1089#1090#1086#1082' '#1085#1077' '#1091#1082#1072#1079#1072#1085
    OnChange = ComboBoxBuhChange
  end
  object cbWR: TComboBox
    Left = 432
    Top = 48
    Width = 145
    Height = 28
    ItemHeight = 20
    TabOrder = 13
    Text = 'cbWR'
    Items.Strings = (
      #1054#1089#1085'. '#1080' '#1089#1086#1074#1084'.'
      #1054#1089#1085#1086#1074#1085#1072#1103
      #1057#1086#1074#1084#1077#1097#1077#1085#1080#1077)
  end
  object DataSourceSummy: TDataSource
    DataSet = pFIBDataSetSummy
    Left = 80
    Top = 168
  end
  object pFIBDataSetSummy: TpFIBDataSet
    DeleteSQL.Strings = (
      '')
    RefreshSQL.Strings = (
      'SELECT'
      '    SHIFRID,'
      '    SEL,'
      '    MONTH_ZA,'
      '    YEAR_ZA,'
      '    SUMMA_BUD,'
      '    SUMMA_VNE,'
      '    SUMMA_GN,'
      '    SUMMA_NIS,'
      '    OKLAD_M,'
      '    DAYS,'
      '    GRAPHIC_DAY,'
      '    KOEF,  '
      '    Manual_Calc '
      'FROM'
      '    TB_KOMAND_SUMMY '
      'where'
      '    SHIFRID=:OLD_SHIFRID'
      'order by year_za desc,month_za desc')
    SelectSQL.Strings = (
      'SELECT'
      '    TMP.CONNID,'
      '    TMP.SEL,'
      '    TMP.MONTH_ZA,'
      '    TMP.YEAR_ZA,'
      '    TMP.SUMMA_BUD,'
      '    TMP.SUMMA_VNE,'
      '    TMP.SUMMA_GN,'
      '    TMP.SUMMA_NIS,'
      '    TMP.OKLAD_M,'
      '    TMP.DAYS,'
      '    TMP.GRAPHIC_DAY,'
      '    TMP.KOEF,'
      '    TMP.ShifrIdTMP,'
      '    TMP.Manual_Calc,'
      '    TMP.Day_Kalend_Work '
      'FROM'
      '    TMP_KOMAND_SUMMY TMP'
      'where'
      '  TMP.CONNID=CURRENT_CONNECTION'
      'order by year_za desc,month_za desc')
    AutoUpdateOptions.UpdateTableName = 'TMP_KOMAND_SUMMY'
    AutoUpdateOptions.KeyFields = 'SHIFRIDTMP'
    AutoUpdateOptions.AutoReWriteSqls = True
    AutoUpdateOptions.GeneratorName = 'GKOMANDTMPSUMMY'
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 40
    Top = 160
    object pFIBDataSetSummyCONNID: TFIBIntegerField
      FieldName = 'CONNID'
      Origin = 'TMP_KOMAND_SUMMY.CONNID'
    end
    object pFIBDataSetSummySEL: TFIBSmallIntField
      FieldName = 'SEL'
      Origin = 'TMP_KOMAND_SUMMY.SEL'
    end
    object pFIBDataSetSummyMONTH_ZA: TFIBSmallIntField
      FieldName = 'MONTH_ZA'
      Origin = 'TMP_BOLN_SUMMY.MONTH_ZA'
    end
    object pFIBDataSetSummyYEAR_ZA: TFIBSmallIntField
      FieldName = 'YEAR_ZA'
      Origin = 'TMP_KOMAND_SUMMY.YEAR_ZA'
    end
    object pFIBDataSetSummySUMMA_BUD: TFIBBCDField
      FieldName = 'SUMMA_BUD'
      Origin = 'TMP_KOMAND_SUMMY.SUMMA_BUD'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetSummySUMMA_VNE: TFIBBCDField
      FieldName = 'SUMMA_VNE'
      Origin = 'TMP_KOMAND_SUMMY.SUMMA_VNE'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetSummySUMMA_GN: TFIBBCDField
      FieldName = 'SUMMA_GN'
      Origin = 'TMP_KOMAND_SUMMY.SUMMA_GN'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetSummySUMMA_NIS: TFIBBCDField
      FieldName = 'SUMMA_NIS'
      Origin = 'TMP_KOMAND_SUMMY.SUMMA_NIS'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetSummyOKLAD_M: TFIBBCDField
      FieldName = 'OKLAD_M'
      Origin = 'TMP_KOMAND_SUMMY.OKLAD_M'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetSummyDAYS: TFIBSmallIntField
      FieldName = 'DAYS'
      Origin = 'TMP_KOMAND_SUMMY.DAYS'
    end
    object pFIBDataSetSummyGRAPHIC_DAY: TFIBSmallIntField
      FieldName = 'GRAPHIC_DAY'
      Origin = 'TMP_KOMAND_SUMMY.GRAPHIC_DAY'
    end
    object pFIBDataSetSummyKOEF: TFIBBCDField
      FieldName = 'KOEF'
      Origin = 'TMP_KOMAND_SUMMY.KOEF'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetSummySHIFRIDTMP: TFIBSmallIntField
      FieldName = 'SHIFRIDTMP'
    end
    object pFIBDataSetSummyDAY_KALEND_WORK: TFIBSmallIntField
      FieldName = 'DAY_KALEND_WORK'
    end
    object pFIBDataSetSummyMANUAL_CALC: TFIBSmallIntField
      FieldName = 'MANUAL_CALC'
    end
  end
  object pFIBDataSetRes: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TMP_KOMAND_RES'
      'SET '
      '    YEAR_ZA = :YEAR_ZA,'
      '    MONTH_ZA = :MONTH_ZA,'
      '    SHIFRSTA = :SHIFRSTA,'
      '    KMD_DAY = :KMD_DAY,'
      '    SUMMA_K_BUD = :SUMMA_k_BUD,'
      '    SUMMA_K_VNE = :SUMMA_k_VNE,'
      '    SUMMA_k_GN = :SUMMA_K_GN,'
      '    SUMMA_K_NIS = :SUMMA_k_NIS'
      'WHERE'
      '    YEAR_ZA = :OLD_YEAR_ZA'
      '    and MONTH_ZA = :OLD_MONTH_ZA'
      '    and SHIFRSTA = :OLD_SHIFRSTA'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TMP_KOMAND_RES'
      'WHERE'
      '        YEAR_ZA = :OLD_YEAR_ZA'
      '    and MONTH_ZA = :OLD_MONTH_ZA'
      '    and SHIFRSTA = :OLD_SHIFRSTA'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_KOMAND_RES('
      '    YEAR_ZA,'
      '    MONTH_ZA,'
      '    SHIFRSTA,'
      '    KMD_DAY,'
      '    SUMMA_K_BUD,'
      '    SUMMA_K_VNE,'
      '    SUMMA_K_GN,'
      '    SUMMA_K_NIS'
      ')'
      'VALUES('
      '    :YEAR_ZA,'
      '    :MONTH_ZA,'
      '    :SHIFRSTA,'
      '    :KMD_DAY,'
      '    :SUMMA_K_BUD,'
      '    :SUMMA_K_VNE,'
      '    :SUMMA_K_GN,'
      '    :SUMMA_K_NIS'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    TMP.YEAR_ZA,'
      '    TMP.MONTH_ZA,'
      '    TMP.SHIFRSTA,'
      '    TMP.KMD_DAY,'
      '    TMP.SUMMA_K_BUD,'
      '    TMP.SUMMA_K_VNE,'
      '    TMP.SUMMA_K_GN,'
      '    TMP.SUMMA_K_NIS'
      'FROM'
      '    TMP_KOMAND_RES TMP'
      'where(  '
      '    TMP.CONNID=CURRENT_CONNECTION'
      '     ) and (     TMP.YEAR_ZA = :OLD_YEAR_ZA'
      '    and TMP.MONTH_ZA = :OLD_MONTH_ZA'
      '    and TMP.SHIFRSTA = :OLD_SHIFRSTA'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    TMP.YEAR_ZA,'
      '    TMP.MONTH_ZA,'
      '    TMP.SHIFRSTA,'
      '    TMP.KMD_DAY,'
      '    TMP.SUMMA_K_BUD,'
      '    TMP.SUMMA_K_VNE,'
      '    TMP.SUMMA_K_GN,'
      '    TMP.SUMMA_K_NIS,'
      '    TMP.ShifrIdTmp'
      'FROM'
      '    TMP_KOMAND_RES TMP'
      'where '
      '    TMP.CONNID=CURRENT_CONNECTION'
      'ORDER BY'
      '    TMP.YEAR_ZA,TMP.MONTH_ZA')
    AutoUpdateOptions.UpdateTableName = 'TMP_KOMAND_RES'
    AutoUpdateOptions.KeyFields = 'SHIFRIDTMP'
    AutoUpdateOptions.CanChangeSQLs = True
    AutoUpdateOptions.GeneratorName = 'GKOMANDRESTMP'
    AutoUpdateOptions.AutoParamsToFields = True
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 132
    Top = 159
    object pFIBDataSetResYEAR_ZA: TFIBSmallIntField
      FieldName = 'YEAR_ZA'
      Origin = 'TMP_KOAMND_RES.YEAR_ZA'
    end
    object pFIBDataSetResMONTH_ZA: TFIBSmallIntField
      FieldName = 'MONTH_ZA'
      Origin = 'TMP_KOMAND_RES.MONTH_ZA'
    end
    object pFIBDataSetResSHIFRSTA: TFIBSmallIntField
      FieldName = 'SHIFRSTA'
      Origin = 'TMP_KOAMND_RES.SHIFRSTA'
    end
    object pFIBDataSetResKMD_DAY: TFIBSmallIntField
      FieldName = 'KMD_DAY'
      Origin = 'TMP_KOMAND_RES.KMD_DAY'
    end
    object pFIBDataSetResSUMMA_K_BUD: TFIBBCDField
      FieldName = 'SUMMA_K_BUD'
      Origin = 'TMP_KOMAND_RES.SUMMA_K_BUD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetResSUMMA_B_VNE: TFIBBCDField
      FieldName = 'SUMMA_K_VNE'
      Origin = 'TMP_BOLN_RES.SUMMA_B_VNE'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetResSUMMA_K_GN: TFIBBCDField
      FieldName = 'SUMMA_K_GN'
      Origin = 'TMP_KOMAND_RES.SUMMA_K_GN'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetResSUMMA_K_NIS: TFIBBCDField
      FieldName = 'SUMMA_K_NIS'
      Origin = 'TMP_KOMAND_RES.SUMMA_K_NIS'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetResSHIFRIDTMP: TFIBSmallIntField
      FieldName = 'SHIFRIDTMP'
    end
  end
  object DataSourceRes: TDataSource
    DataSet = pFIBDataSetRes
    Left = 204
    Top = 151
  end
  object pFIBDataSetSel: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    TMP.MONTH_ZA,'
      '    TMP.YEAR_ZA'
      'FROM'
      '    TMP_KOMAND_SUMMY TMP'
      'where'
      '  TMP.CONNID=CURRENT_CONNECTION AND'
      '  TMP.SEL=0 ')
    Transaction = FIB.pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    Left = 156
    Top = 199
    object pFIBDataSetSelMONTH_ZA: TFIBSmallIntField
      FieldName = 'MONTH_ZA'
    end
    object pFIBDataSetSelYEAR_ZA: TFIBSmallIntField
      FieldName = 'YEAR_ZA'
    end
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 92
    Top = 247
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
    Left = 196
    Top = 311
  end
end
