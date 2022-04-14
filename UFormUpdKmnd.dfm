object FormUpdKmnd: TFormUpdKmnd
  Left = 313
  Top = 130
  Width = 790
  Height = 712
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
    Left = 296
    Top = 48
    Width = 91
    Height = 20
    Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099
  end
  object Label1: TLabel
    Left = 560
    Top = 24
    Width = 56
    Height = 20
    Caption = #1057#1090#1072#1090#1100#1103
  end
  object LabelTabel: TLabel
    Left = 470
    Top = 80
    Width = 70
    Height = 20
    Caption = #1042' '#1090#1072#1073#1077#1083#1100
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
    Left = 16
    Top = 576
    Width = 75
    Height = 25
    TabOrder = 3
    OnClick = BitBtn2Click
    Kind = bkOK
  end
  object BitBtn3: TBitBtn
    Left = 96
    Top = 576
    Width = 153
    Height = 25
    Caption = #1048#1085#1080#1094#1080#1072#1083#1080#1079#1072#1094#1080#1103
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 112
    Width = 737
    Height = 449
    ActivePage = TabSheet1
    TabOrder = 5
    object TabSheet1: TTabSheet
      Caption = #1048#1089#1093'.'#1076#1072#1085#1085#1099#1077
      OnShow = TabSheet1Show
      DesignSize = (
        729
        414)
      object dxDBGridSum: TdxDBGrid
        Left = 0
        Top = 8
        Width = 721
        Height = 400
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
          Width = 61
          BandIndex = 0
          RowIndex = 0
          FieldName = 'CONNID'
        end
        object dxDBGridSumSEL: TdxDBGridCheckColumn
          Caption = #1042
          MinWidth = 20
          Width = 24
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
          Width = 39
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
          Width = 43
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MONTH_ZA'
        end
        object dxDBGridSumYEAR_ZA: TdxDBGridCalcColumn
          Caption = #1043#1086#1076
          Width = 46
          BandIndex = 0
          RowIndex = 0
          FieldName = 'YEAR_ZA'
        end
        object dxDBGridSumSUMMA_BUD: TdxDBGridCalcColumn
          Caption = #1041#1102#1076#1078#1077#1090
          Width = 57
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_BUD'
        end
        object dxDBGridSumSUMMA_VNE: TdxDBGridCalcColumn
          Caption = #1042#1085#1077' '#1073#1102#1076#1078#1077#1090
          HeaderAlignment = taCenter
          Width = 81
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_VNE'
        end
        object dxDBGridSumSUMMA_GN: TdxDBGridCalcColumn
          Caption = #1043' '#1085
          HeaderAlignment = taCenter
          Width = 55
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_GN'
        end
        object dxDBGridSumSUMMA_NIS: TdxDBGridCalcColumn
          Caption = #1053#1048#1057
          HeaderAlignment = taCenter
          Width = 55
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_NIS'
        end
        object dxDBGridSumOKLAD_M: TdxDBGridCalcColumn
          Caption = #1054#1082#1083#1072#1076
          Width = 52
          BandIndex = 0
          RowIndex = 0
          FieldName = 'OKLAD_M'
        end
        object dxDBGridSumDAYS: TdxDBGridCalcColumn
          Caption = #1044#1085
          HeaderAlignment = taCenter
          Width = 44
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DAYS'
        end
        object dxDBGridSumGRAPHIC_DAY: TdxDBGridMaskColumn
          Caption = #1043#1088'.'#1076#1085'.'
          Width = 47
          BandIndex = 0
          RowIndex = 0
          FieldName = 'GRAPHIC_DAY'
        end
        object dxDBGridSumKOEF: TdxDBGridCalcColumn
          Caption = #1050#1086#1101#1092
          HeaderAlignment = taCenter
          Width = 71
          BandIndex = 0
          RowIndex = 0
          FieldName = 'KOEF'
        end
        object dxDBGridSumDayKalend: TdxDBGridColumn
          Caption = #1050#1088#1076
          HeaderAlignment = taCenter
          Width = 65
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DAY_KALEND_WORK'
        end
        object dxDBGridSumColumnButton: TdxDBGridButtonColumn
          Caption = #1055#1089#1084
          Sorted = csUp
          Width = 38
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
    object TabSheetRas: TTabSheet
      Caption = #1056#1072#1089#1095#1077#1090
      ImageIndex = 3
      OnShow = TabSheetRasShow
      object LabelCalc: TLabel
        Left = 8
        Top = 384
        Width = 70
        Height = 20
        Caption = 'LabelCalc'
      end
      object dxDBGridRas: TdxDBGrid
        Left = 0
        Top = 0
        Width = 729
        Height = 377
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFRIDTMP'
        ShowSummaryFooter = True
        SummaryGroups = <>
        SummarySeparator = ', '
        PopupMenu = PopupMenu1
        TabOrder = 0
        DataSource = DataSourceSummy
        Filter.Criteria = {00000000}
        OptionsBehavior = [edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
        OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
        object dxDBGridRasCONNID: TdxDBGridMaskColumn
          Visible = False
          Width = 84
          BandIndex = 0
          RowIndex = 0
          FieldName = 'CONNID'
        end
        object dxDBGridRasSEL: TdxDBGridCheckColumn
          MinWidth = 20
          Width = 20
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SEL'
          ValueChecked = '1'
          ValueGrayed = '0'
          ValueUnchecked = '0'
        end
        object dxDBGridRasMANUAL_CALC: TdxDBGridCheckColumn
          Caption = #1056'.'#1088'.'
          MinWidth = 20
          Width = 38
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MANUAL_CALC'
          ValueChecked = '1'
          ValueGrayed = '0'
          ValueUnchecked = '0'
        end
        object dxDBGridRasMONTH_ZA: TdxDBGridMaskColumn
          Caption = #1052#1094
          Width = 44
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MONTH_ZA'
        end
        object dxDBGridRasYEAR_ZA: TdxDBGridMaskColumn
          Caption = #1043#1086#1076
          HeaderAlignment = taCenter
          Width = 55
          BandIndex = 0
          RowIndex = 0
          FieldName = 'YEAR_ZA'
        end
        object dxDBGridRasSUMMA_BUD: TdxDBGridCurrencyColumn
          Visible = False
          Width = 97
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_BUD'
          Nullable = False
        end
        object dxDBGridRasSUMMA_VNE: TdxDBGridCurrencyColumn
          Visible = False
          Width = 97
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_VNE'
          Nullable = False
        end
        object dxDBGridRasSUMMA_GN: TdxDBGridCurrencyColumn
          Visible = False
          Width = 91
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_GN'
          Nullable = False
        end
        object dxDBGridRasSUMMA_NIS: TdxDBGridCurrencyColumn
          Visible = False
          Width = 93
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_NIS'
          Nullable = False
        end
        object dxDBGridRasOKLAD_M: TdxDBGridCurrencyColumn
          Visible = False
          Width = 84
          BandIndex = 0
          RowIndex = 0
          FieldName = 'OKLAD_M'
          Nullable = False
        end
        object dxDBGridRasGRAPHIC_DAY: TdxDBGridMaskColumn
          Visible = False
          Width = 111
          BandIndex = 0
          RowIndex = 0
          FieldName = 'GRAPHIC_DAY'
        end
        object dxDBGridRasSHIFRIDTMP: TdxDBGridMaskColumn
          Visible = False
          Width = 95
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRIDTMP'
        end
        object dxDBGridRasSumma: TdxDBGridColumn
          HeaderAlignment = taCenter
          Width = 102
          BandIndex = 0
          RowIndex = 0
          FieldName = 'Summa'
          SummaryFooterType = cstSum
        end
        object dxDBGridRasSummaSel: TdxDBGridColumn
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          Width = 141
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SummaSel'
          SummaryFooterType = cstSum
        end
        object dxDBGridRasKOEF: TdxDBGridCurrencyColumn
          Caption = #1050#1086#1101#1092
          HeaderAlignment = taCenter
          Width = 114
          BandIndex = 0
          RowIndex = 0
          FieldName = 'KOEF'
          DisplayFormat = '0.00'
          Nullable = False
        end
        object dxDBGridRasSummaSelUw: TdxDBGridColumn
          HeaderAlignment = taCenter
          Width = 143
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SummaSelUw'
          SummaryFooterType = cstSum
          OnSummary = dxDBGridRasSummaSelUwSummary
        end
        object dxDBGridRasDAY_KALEND_WORK: TdxDBGridMaskColumn
          Caption = #1056#1072#1073'.'#1076#1085'.'
          HeaderAlignment = taCenter
          Visible = False
          Width = 41
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DAY_KALEND_WORK'
          SummaryFooterType = cstSum
        end
        object dxDBGridRasDAYS: TdxDBGridMaskColumn
          Caption = #1056#1072#1073'.'#1076#1085'.'
          HeaderAlignment = taCenter
          Width = 68
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DAYS'
          SummaryFooterType = cstSum
        end
      end
      object cbRas: TComboBox
        Left = 584
        Top = 384
        Width = 145
        Height = 28
        ItemHeight = 20
        TabOrder = 1
        Text = 'cbRas'
        OnChange = cbRasChange
        Items.Strings = (
          #1041#1102#1076#1078#1077#1090
          #1042#1085#1077#1073#1102#1076#1078#1077#1090
          #1043#1053
          #1053#1048#1057)
      end
    end
  end
  object BitBtn4: TBitBtn
    Left = 256
    Top = 576
    Width = 89
    Height = 25
    Caption = #1056#1072#1089#1095#1077#1090
    TabOrder = 6
    OnClick = BitBtn4Click
  end
  object Save: TBitBtn
    Left = 360
    Top = 576
    Width = 105
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 7
    OnClick = SaveClick
  end
  object RadioGroupModeZaVy: TRadioGroup
    Left = 488
    Top = 576
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
    Left = 632
    Top = 578
    Width = 97
    Height = 25
    Caption = #1059#1076'.'#1085#1077' '#1086#1090#1084'.'
    TabOrder = 9
    OnClick = BitBtnDelNotSelClick
  end
  object BitBtn5: TBitBtn
    Left = 632
    Top = 608
    Width = 97
    Height = 25
    Caption = #1057#1093#1088'.'#1090#1077#1082'.'#1084#1077#1089'.'
    TabOrder = 10
    OnClick = BitBtn5Click
  end
  object RadioGroupModeDC: TRadioGroup
    Left = 256
    Top = 600
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
    Left = 448
    Top = 632
    Width = 281
    Height = 28
    ItemHeight = 20
    TabOrder = 12
    Text = #1059#1095#1072#1089#1090#1086#1082' '#1085#1077' '#1091#1082#1072#1079#1072#1085
    OnChange = ComboBoxBuhChange
  end
  object cbWR: TComboBox
    Left = 392
    Top = 48
    Width = 145
    Height = 28
    ItemHeight = 20
    TabOrder = 13
    Text = 'cbWR'
    OnChange = cbWRChange
    Items.Strings = (
      #1054#1089#1085'. '#1080' '#1089#1086#1074#1084'.'
      #1054#1089#1085#1086#1074#1085#1072#1103
      #1057#1086#1074#1084#1077#1097#1077#1085#1080#1077)
  end
  object cbShifrSta: TComboBox
    Left = 544
    Top = 48
    Width = 217
    Height = 28
    ItemHeight = 20
    TabOrder = 14
    Text = 'cbShifrSta'
    OnChange = cbShifrStaChange
    Items.Strings = (
      '138 '#1050#1086#1084#1072#1085#1076#1080#1088#1086#1074#1082#1072
      '173 '#1043#1086#1089#1086#1073#1103#1079#1072#1085#1085#1086#1089#1090#1080)
  end
  object cbShifrTabel: TComboBox
    Left = 544
    Top = 80
    Width = 217
    Height = 28
    ItemHeight = 20
    TabOrder = 15
    OnChange = cbShifrTabelChange
    Items.Strings = (
      #1043'    '#1075#1086#1089#1086#1073#1103#1079#1072#1085#1086#1089#1090#1080
      #1044#1085' '#1076#1088#1091#1075#1072#1103' '#1085#1077#1103#1074#1082#1072' ')
  end
  object BitSinglPerson: TBitBtn
    Left = 416
    Top = 80
    Width = 49
    Height = 25
    Hint = #1054#1090#1084#1077#1090#1080#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
    Caption = #1069#1090#1086#1090
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
    OnClick = BitSinglPersonClick
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
    OnCalcFields = pFIBDataSetSummyCalcFields
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
    object pFIBDataSetSummysumma: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldKind = fkCalculated
      FieldName = 'Summa'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object pFIBDataSetSummySummaSel: TFloatField
      DisplayLabel = #1054#1090#1084#1077#1095#1077#1085#1086
      FieldKind = fkCalculated
      FieldName = 'SummaSel'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object pFIBDataSetSummySummaSelUw: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1091#1074'..'
      FieldKind = fkCalculated
      FieldName = 'SummaSelUw'
      DisplayFormat = '0.00'
      Calculated = True
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
  object frxReport1: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44639.773050671300000000
    ReportOptions.LastChange = 44639.842125555560000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    Left = 308
    Top = 223
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = ' MyVariables'
        Value = Null
      end
      item
        Name = 'Header'
        Value = ''
      end
      item
        Name = 'Meanday'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      TitleBeforeHeader = False
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 139.842610000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo1: TfrxMemoView
          Left = 37.795300000000000000
          Width = 37.795275590551180000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."SEL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 75.590600000000000000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."MANUAL_CALC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 188.976500000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."Summa"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 283.464750000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."SummaSel"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 377.953000000000000000
          Width = 56.692913390000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."KOEF"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 434.645950000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."SummaSelUw"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 113.385900000000000000
          Width = 37.795275590551180000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."MONTH_ZA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 151.181200000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."YEAR_ZA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 529.134200000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'DAYS'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."DAYS"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 83.149660000000000000
        Top = 219.212740000000000000
        Width = 1046.929810000000000000
        object Memo19: TfrxMemoView
          Left = 188.976500000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."Summa">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 283.464750000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."SummaSel">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 434.645950000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."SummaSelUw">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 529.134200000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."DAYS">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 3.779530000000000000
          Top = 45.354360000000000000
          Width = 619.842920000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1026#1056#181#1056#1169#1056#1029#1056#181#1056#1169#1056#1029#1056#181#1056#1030#1056#1029#1056#176#1057#1039' [Meanday]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 60.472480000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo23: TfrxMemoView
          Width = 623.622450000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Header]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 37.795300000000000000
          Top = 30.236240000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1057#1026#1056#1108)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 75.590600000000000000
          Top = 30.236240000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160'.'#1057#1026'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 113.385900000000000000
          Top = 30.236240000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1057#8224'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 151.181200000000000000
          Top = 30.236240000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8220#1056#1109#1056#1169)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 188.976500000000000000
          Top = 30.236240000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 283.464750000000000000
          Top = 30.236240000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176' '#1056#1109#1057#8218#1056#1112'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 377.953000000000000000
          Top = 30.236240000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1057#1036#1057#8222'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 434.645950000000000000
          Top = 30.236240000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176' '#1057#1107#1056#1030'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 529.134200000000000000
          Top = 30.236240000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#1029#1056#181#1056#8470)
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = pFIBDataSetSummy
    Left = 356
    Top = 223
  end
  object PopupMenu1: TPopupMenu
    Left = 348
    Top = 319
    object N1: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
      OnClick = N1Click
    end
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Background = False
    Creator = 'FastReport (http://www.fast-report.com)'
    HTMLTags = True
    Left = 404
    Top = 223
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 436
    Top = 223
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    Left = 476
    Top = 223
  end
end
