object FormUpdOtp: TFormUpdOtp
  Left = 247
  Top = 77
  Width = 780
  Height = 620
  Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1086#1090#1087#1091#1089#1082#1085#1086#1075#1086
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
  DesignSize = (
    764
    582)
  PixelsPerInch = 96
  TextHeight = 20
  object LabelFio: TLabel
    Left = 8
    Top = 8
    Width = 61
    Height = 20
    Caption = 'LabelFio'
  end
  object LabelODay: TLabel
    Left = 400
    Top = 32
    Width = 61
    Height = 20
    Caption = #1050'-'#1074#1086' '#1076#1085'.'
  end
  object Label1: TLabel
    Left = 272
    Top = 32
    Width = 56
    Height = 20
    Caption = #1056#1072#1079#1088#1103#1076
  end
  object LabelODCap: TLabel
    Left = 12
    Top = 34
    Width = 133
    Height = 20
    Caption = #1044#1085#1080' '#1082#1086#1084#1087#1077#1085#1089#1072#1094#1080#1080
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 64
    Width = 749
    Height = 477
    ActivePage = TabSheet3
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #1048#1089#1093' '#1076#1072#1085#1085#1099#1077
      DesignSize = (
        741
        442)
      object dxDBGridSummy: TdxDBGrid
        Left = 8
        Top = 5
        Width = 741
        Height = 355
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
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        OnChangedColumnsWidth = dxDBGridSummyChangedColumnsWidth
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridSummyCONNID: TdxDBGridMaskColumn
          Visible = False
          Width = 171
          BandIndex = 0
          RowIndex = 0
          FieldName = 'CONNID'
        end
        object dxDBGridSummySHIFRID: TdxDBGridMaskColumn
          Visible = False
          Width = 171
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRID'
        end
        object dxDBGridSummySHIFRIDOTP: TdxDBGridMaskColumn
          Visible = False
          Width = 193
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRIDOTP'
        end
        object dxDBGridSummySEL: TdxDBGridCheckColumn
          Width = 24
          BandIndex = 0
          RowIndex = 0
          OnChange = dxDBGridSummySELChange
          FieldName = 'SEL'
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dxDBGridSummyMC: TdxDBGridCheckColumn
          Caption = #1056#1078
          HeaderAlignment = taCenter
          Width = 24
          BandIndex = 0
          RowIndex = 0
          OnChange = dxDBGridSummyMCChange
          FieldName = 'MANUAL_CALC'
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dxDBGridSummyMONTH_ZA: TdxDBGridColumn
          Caption = #1052'-'#1094
          DisableEditor = True
          Width = 27
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MONTH_ZA'
        end
        object dxDBGridSummyYEAR_ZA: TdxDBGridColumn
          Caption = #1043#1086#1076
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'YEAR_ZA'
        end
        object dxDBGridSummySUMMA_BUD: TdxDBGridCalcColumn
          Caption = #1041#1102#1076#1078#1077#1090
          HeaderAlignment = taCenter
          Width = 66
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_BUD'
        end
        object dxDBGridSummySUMMA_VNE: TdxDBGridCalcColumn
          Caption = #1042#1085#1077#1073#1102#1076#1078
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_VNE'
        end
        object dxDBGridSummySUMMA_GN: TdxDBGridCalcColumn
          Caption = #1043' '#1053
          HeaderAlignment = taCenter
          Width = 66
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_GN'
        end
        object dxDBGridSummySUMMA_NIS: TdxDBGridCalcColumn
          Caption = #1053' '#1048' '#1057
          HeaderAlignment = taCenter
          Width = 67
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_NIS'
        end
        object dxDBGridSummyOKLAD_M: TdxDBGridCalcColumn
          Caption = #1054#1082#1083#1072#1076
          HeaderAlignment = taCenter
          Width = 51
          BandIndex = 0
          RowIndex = 0
          FieldName = 'OKLAD_M'
        end
        object dxDBGridSummyDAY_WORK: TdxDBGridCalcColumn
          Caption = #1056'.'#1044#1085'.'
          HeaderAlignment = taCenter
          Width = 51
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DAY_WORK'
        end
        object dxDBGridSummyKOEF: TdxDBGridCalcColumn
          Caption = #1050#1086#1101#1092'.'
          HeaderAlignment = taCenter
          Width = 60
          BandIndex = 0
          RowIndex = 0
          FieldName = 'KOEF'
        end
        object dxDBGridSummyDAY_KALEND: TdxDBGridCalcColumn
          Caption = #1050'.'#1076#1085'.'
          HeaderAlignment = taCenter
          Width = 69
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DAY_KALEND'
        end
        object dxDBGridSummyDay_Calend_Work: TdxDBGridColumn
          Caption = #1050'.'#1076#1088
          Width = 54
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DAY_KALEND_WORK'
        end
        object dxDBGridSummyButton: TdxDBGridButtonColumn
          Caption = #1040#1088#1093#1080#1074
          Width = 50
          BandIndex = 0
          RowIndex = 0
          ButtonOnly = True
          Buttons = <
            item
              Default = True
            end>
          OnButtonClick = dxDBGridSummyButtonButtonClick
        end
      end
      object StringGridFot: TStringGrid
        Left = 0
        Top = 360
        Width = 737
        Height = 81
        Anchors = [akLeft, akRight, akBottom]
        Color = clBtnFace
        ColCount = 7
        Enabled = False
        FixedCols = 0
        RowCount = 3
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
        ScrollBars = ssNone
        TabOrder = 1
        OnDrawCell = StringGridFotDrawCell
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099
      ImageIndex = 1
      DesignSize = (
        741
        442)
      object dxDBGridRes: TdxDBGrid
        Left = 0
        Top = 0
        Width = 733
        Height = 437
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
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridResCONNID: TdxDBGridMaskColumn
          Visible = False
          Width = 101
          BandIndex = 0
          RowIndex = 0
          FieldName = 'CONNID'
        end
        object dxDBGridResSHIFRID: TdxDBGridMaskColumn
          Visible = False
          Width = 101
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRID'
        end
        object dxDBGridResSHIFRIDOTP: TdxDBGridMaskColumn
          Visible = False
          Width = 113
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRIDOTP'
        end
        object dxDBGridResSHIFRSTA: TdxDBGridMaskColumn
          HeaderAlignment = taCenter
          Width = 47
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRSTA'
        end
        object dxDBGridResO_DAY: TdxDBGridCalcColumn
          Caption = #1044#1085
          HeaderAlignment = taCenter
          Width = 48
          BandIndex = 0
          RowIndex = 0
          FieldName = 'O_DAY'
          SummaryFooterType = cstSum
        end
        object dxDBGridResMONTH_ZA: TdxDBGridCalcColumn
          Caption = #1052#1094
          HeaderAlignment = taCenter
          Width = 57
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MONTH_ZA'
        end
        object dxDBGridResYEAR_ZA: TdxDBGridCalcColumn
          Caption = #1043#1086#1076
          HeaderAlignment = taCenter
          Width = 59
          BandIndex = 0
          RowIndex = 0
          FieldName = 'YEAR_ZA'
        end
        object dxDBGridResSUMMA_O_BUD: TdxDBGridCalcColumn
          Caption = #1041#1102#1076#1078#1077#1090
          HeaderAlignment = taCenter
          Width = 111
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_O_BUD'
          SummaryFooterType = cstSum
        end
        object dxDBGridResSUMMA_O_VNE: TdxDBGridCalcColumn
          Caption = #1042#1085#1077' '#1073#1102#1076
          HeaderAlignment = taCenter
          Width = 113
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_O_VNE'
          SummaryFooterType = cstSum
        end
        object dxDBGridResSUMMA_O_GN: TdxDBGridCalcColumn
          Caption = #1043' '#1053
          HeaderAlignment = taCenter
          Width = 145
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_O_GN'
          SummaryFooterType = cstSum
        end
        object dxDBGridResSUMMA_O_NIS: TdxDBGridCalcColumn
          Caption = #1053' '#1048' '#1057
          HeaderAlignment = taCenter
          Width = 149
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_O_NIS'
          SummaryFooterType = cstSum
        end
        object dxDBGridResSHIFRIDTMP: TdxDBGridMaskColumn
          Visible = False
          Width = 114
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRIDTMP'
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1057#1088#1077#1076#1085#1077#1076#1085#1077#1074#1085#1099#1077
      ImageIndex = 2
      object Label2: TLabel
        Left = 408
        Top = 32
        Width = 119
        Height = 20
        Caption = #1053#1086#1084#1077#1088' '#1087#1088#1080#1082#1072#1079#1072' '
      end
      object Label3: TLabel
        Left = 416
        Top = 64
        Width = 104
        Height = 20
        Caption = #1044#1072#1090#1072' '#1087#1088#1080#1082#1072#1079#1072
      end
      object Label4: TLabel
        Left = 392
        Top = 96
        Width = 137
        Height = 20
        Caption = #1055#1077#1088#1080#1086#1076' '#1074' '#1087#1088#1080#1082#1072#1079#1077
      end
      object StringGridMean: TStringGrid
        Left = 40
        Top = 32
        Width = 345
        Height = 137
        ColCount = 4
        DefaultColWidth = 80
        TabOrder = 0
      end
      object StringGridIRas: TStringGrid
        Left = 16
        Top = 192
        Width = 713
        Height = 105
        ColCount = 6
        RowCount = 4
        TabOrder = 1
        ColWidths = (
          64
          82
          113
          64
          64
          64)
      end
      object DateTimePickerData_Pri: TDateTimePicker
        Left = 536
        Top = 56
        Width = 169
        Height = 28
        Date = 41685.541900312500000000
        Time = 41685.541900312500000000
        DateFormat = dfLong
        TabOrder = 2
      end
      object EditNomerPri: TEdit
        Left = 536
        Top = 24
        Width = 161
        Height = 28
        TabOrder = 3
        Text = 'EditNomerPri'
      end
      object EditPeriodPri: TEdit
        Left = 392
        Top = 128
        Width = 337
        Height = 28
        TabOrder = 4
        Text = 'EditPeriodPri'
      end
      object rgMode_25_07_2016: TRadioGroup
        Left = 40
        Top = 312
        Width = 425
        Height = 73
        Caption = #1056#1072#1089#1095#1077#1090' '#1089#1088#1077#1076#1085#1077#1076#1085#1077#1074#1085#1086#1081' '#1079' '#1087
        Columns = 2
        Items.Strings = (
          #1076#1086' 25 07 2016'
          #1089' 25 07 2016')
        TabOrder = 5
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1054#1090#1084#1077#1090#1082#1072' '#1087#1077#1088#1077#1085#1086#1089#1072
      ImageIndex = 3
      PopupMenu = PopupMenu2
      OnEnter = TabSheet4Enter
      DesignSize = (
        741
        442)
      object dxDBGridPereRas: TdxDBGrid
        Left = 0
        Top = 0
        Width = 737
        Height = 433
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFRIDTMP'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourcePereRas
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCanAppend, edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridPereRasSHIFRIDOTP: TdxDBGridMaskColumn
          Visible = False
          Width = 144
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRIDOTP'
        end
        object dxDBGridPereRasSHIFRSTA: TdxDBGridMaskColumn
          Caption = #1064#1092#1088
          HeaderAlignment = taCenter
          Width = 43
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRSTA'
        end
        object dxDBGridPereRasO_DAY: TdxDBGridMaskColumn
          Caption = #1044#1085#1077#1081
          HeaderAlignment = taCenter
          Width = 54
          BandIndex = 0
          RowIndex = 0
          FieldName = 'O_DAY'
        end
        object dxDBGridPereRasMONTH_ZA: TdxDBGridMaskColumn
          Caption = #1052#1077#1089
          HeaderAlignment = taCenter
          Width = 54
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MONTH_ZA'
        end
        object dxDBGridPereRasYEAR_ZA: TdxDBGridMaskColumn
          Caption = #1043#1086#1076
          HeaderAlignment = taCenter
          Width = 54
          BandIndex = 0
          RowIndex = 0
          FieldName = 'YEAR_ZA'
        end
        object dxDBGridPereRasNEED_PERE_BUD: TdxDBGridCheckColumn
          Caption = #1041
          HeaderAlignment = taCenter
          Width = 27
          BandIndex = 0
          RowIndex = 0
          OnChange = dxDBGridPereRasNEED_PERE_BUDChange
          FieldName = 'NEED_PERE_BUD'
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dxDBGridPereRasNEED_PERE_VNE: TdxDBGridCheckColumn
          Caption = #1042
          HeaderAlignment = taCenter
          Width = 29
          BandIndex = 0
          RowIndex = 0
          OnChange = dxDBGridPereRasNEED_PERE_VNEChange
          FieldName = 'NEED_PERE_VNE'
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dxDBGridPereRasNEED_PERE_GN: TdxDBGridCheckColumn
          Caption = #1043
          HeaderAlignment = taCenter
          Width = 28
          BandIndex = 0
          RowIndex = 0
          OnChange = dxDBGridPereRasNEED_PERE_GNChange
          FieldName = 'NEED_PERE_GN'
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dxDBGridPereRasNEED_PERE_NIS: TdxDBGridCheckColumn
          Caption = #1053
          HeaderAlignment = taCenter
          Width = 31
          BandIndex = 0
          RowIndex = 0
          OnChange = dxDBGridPereRasNEED_PERE_NISChange
          FieldName = 'NEED_PERE_NIS'
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dxDBGridPereRasDATA_PERE_BUD: TdxDBGridDateColumn
          Caption = #1044#1072#1090#1072' '#1041
          HeaderAlignment = taCenter
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DATA_PERE_BUD'
        end
        object dxDBGridPereRasDATA_PERE_VNE: TdxDBGridDateColumn
          Caption = #1044#1072#1090#1072' '#1042
          HeaderAlignment = taCenter
          Width = 98
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DATA_PERE_VNE'
        end
        object dxDBGridPereRasDATA_PERE_GN: TdxDBGridDateColumn
          Caption = #1044#1072#1090#1072' '#1043
          HeaderAlignment = taCenter
          Width = 107
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DATA_PERE_GN'
        end
        object dxDBGridPereRasDATA_PERE_NIS: TdxDBGridDateColumn
          Caption = #1044#1072#1090#1072' '#1053
          HeaderAlignment = taCenter
          Sorted = csUp
          Width = 108
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DATA_PERE_NIS'
        end
        object dxDBGridPereRasSHIFRIDTMP: TdxDBGridMaskColumn
          Visible = False
          Width = 70
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRIDTMP'
        end
        object dxDBGridPereRasSumma_Bud: TdxDBGridColumn
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_O_BUD'
        end
        object dxDBGridPereRasSumma_Vne: TdxDBGridColumn
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_O_VNE'
        end
        object dxDBGridPereRasSumma_GN: TdxDBGridColumn
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_O_GN'
        end
        object dxDBGridPereRasSumma_NIS: TdxDBGridColumn
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA_O_NIS'
        end
      end
    end
  end
  object DateTimePickerFr: TDateTimePicker
    Left = 24
    Top = 32
    Width = 113
    Height = 28
    Date = 38670.921723622680000000
    Time = 38670.921723622680000000
    TabOrder = 1
  end
  object DateTimePickerTo: TDateTimePicker
    Left = 160
    Top = 32
    Width = 113
    Height = 28
    Date = 38670.922258750000000000
    Time = 38670.922258750000000000
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 712
    Top = 8
    Width = 51
    Height = 25
    Caption = '. . .'
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object SpinEditRazr: TSpinEdit
    Left = 336
    Top = 32
    Width = 57
    Height = 30
    MaxValue = 25
    MinValue = 0
    TabOrder = 4
    Value = 0
    OnChange = SpinEditRazrChange
  end
  object BitBtn2: TBitBtn
    Left = 8
    Top = 545
    Width = 137
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1048#1085#1080#1094#1080#1072#1083#1080#1079#1072#1094#1080#1103
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 152
    Top = 545
    Width = 153
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1056#1072#1089#1095#1077#1090' '#1086#1090#1087#1091#1089#1082#1085#1099#1093
    TabOrder = 6
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 312
    Top = 545
    Width = 89
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 7
    OnClick = BitBtn4Click
  end
  object ComboBoxMode: TComboBox
    Left = 464
    Top = 32
    Width = 129
    Height = 28
    ItemHeight = 20
    ItemIndex = 0
    TabOrder = 8
    Text = #1054#1090#1087#1091#1089#1082#1085#1099#1077
    OnChange = ComboBoxModeChange
    Items.Strings = (
      #1054#1090#1087#1091#1089#1082#1085#1099#1077
      #1050#1086#1084#1087#1077#1085#1089#1072#1094#1080#1103
      #1052#1072#1075#1080#1089#1090#1088#1072#1090#1091#1088#1072)
  end
  object dxCalcEditODay: TdxCalcEdit
    Left = 152
    Top = 32
    Width = 65
    TabOrder = 9
    Alignment = taRightJustify
    Text = '0'
    OnChange = dxCalcEditODayChange
    StoredValues = 1
  end
  object ComboBoxModeDC: TComboBox
    Left = 600
    Top = 32
    Width = 153
    Height = 28
    ItemHeight = 20
    ItemIndex = 0
    TabOrder = 10
    Text = #1057#1088#1077#1076#1085#1077#1076#1085#1077#1074#1085#1072#1103
    OnChange = ComboBoxModeDCChange
    Items.Strings = (
      #1057#1088#1077#1076#1085#1077#1076#1085#1077#1074#1085#1072#1103
      #1057#1088#1077#1076#1085#1077#1095#1072#1089#1086#1074#1072#1103)
  end
  object comboboxKindsOtp: TComboBox
    Left = 416
    Top = 544
    Width = 337
    Height = 28
    ItemHeight = 20
    TabOrder = 11
    Text = 'comboboxKindsOtp'
    OnChange = comboboxKindsOtpChange
  end
  object ComboBoxModeWR: TComboBox
    Left = 512
    Top = 64
    Width = 241
    Height = 28
    ItemHeight = 20
    TabOrder = 12
    Text = 'ComboBoxModeWR'
    OnChange = ComboBoxModeWRChange
    Items.Strings = (
      #1042#1089#1077
      #1054#1089#1085#1086#1074#1085#1072#1103
      #1057#1086#1074#1084#1077#1097#1077#1085#1080#1077)
  end
  object pFIBStoredProcCrTmp: TpFIBStoredProc
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    SQL.Strings = (
      'EXECUTE PROCEDURE CRTMPOTP (?SHIFRID)')
    StoredProcName = 'CRTMPOTP'
    Left = 24
    Top = 168
  end
  object pFIBDataSetSummy: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TMP_OTP_SUMMY'
      'SET '
      '    CONNID = :CONNID,'
      '    SHIFRID = :SHIFRID,'
      '    SHIFRIDOTP = :SHIFRIDOTP,'
      '    SEL = :SEL,'
      '    MONTH_ZA = :MONTH_ZA,'
      '    YEAR_ZA = :YEAR_ZA,'
      '    SUMMA_BUD = :SUMMA_BUD,'
      '    SUMMA_VNE = :SUMMA_VNE,'
      '    SUMMA_GN = :SUMMA_GN,'
      '    SUMMA_NIS = :SUMMA_NIS,'
      '    OKLAD_M = :OKLAD_M,'
      '    DAY_WORK = :DAY_WORK,'
      '    KOEF = :KOEF,'
      '    DAY_KALEND = :DAY_KALEND,'
      '    DAY_KALEND_WORK = :DAY_KALEND_WORK,'
      '    SHIFRIDTMP = :SHIFRIDTMP'
      'WHERE'
      '    SHIFRIDTMP = :OLD_SHIFRIDTMP'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TMP_OTP_SUMMY'
      'WHERE'
      '        SHIFRIDTMP = :OLD_SHIFRIDTMP'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_OTP_SUMMY('
      '    CONNID,'
      '    SHIFRID,'
      '    SHIFRIDOTP,'
      '    SEL,'
      '    MONTH_ZA,'
      '    YEAR_ZA,'
      '    SUMMA_BUD,'
      '    SUMMA_VNE,'
      '    SUMMA_GN,'
      '    SUMMA_NIS,'
      '    OKLAD_M,'
      '    DAY_WORK,'
      '    KOEF,'
      '    DAY_KALEND,'
      '    DAY_KALEND_WORK,'
      '    SHIFRIDTMP'
      ')'
      'VALUES('
      '    :CONNID,'
      '    :SHIFRID,'
      '    :SHIFRIDOTP,'
      '    :SEL,'
      '    :MONTH_ZA,'
      '    :YEAR_ZA,'
      '    :SUMMA_BUD,'
      '    :SUMMA_VNE,'
      '    :SUMMA_GN,'
      '    :SUMMA_NIS,'
      '    :OKLAD_M,'
      '    :DAY_WORK,'
      '    :KOEF,'
      '    :DAY_KALEND,'
      '    :DAY_KALEND_WORK,'
      '    :SHIFRIDTMP'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    TMP.CONNID,'
      '    TMP.SHIFRID,'
      '    TMP.SHIFRIDOTP,'
      '    TMP.SEL,'
      '    TMP.MONTH_ZA,'
      '    TMP.YEAR_ZA,'
      '    TMP.SUMMA_BUD,'
      '    TMP.SUMMA_VNE,'
      '    TMP.SUMMA_GN,'
      '    TMP.SUMMA_NIS,'
      '    TMP.OKLAD_M,'
      '    TMP.DAY_WORK,'
      '    TMP.KOEF,'
      '    TMP.DAY_KALEND,'
      '    TMP.DAY_KALEND_WORK,'
      '    TMP.ShifrIdTMP '
      'FROM'
      '    TMP_OTP_SUMMY TMP'
      'where(  connid=CURRENT_CONNECTION'
      '     ) and (     TMP.SHIFRIDTMP = :OLD_SHIFRIDTMP'
      '     )'
      '    '
      '')
    SelectSQL.Strings = (
      'SELECT'
      '    TMP.CONNID,'
      '    TMP.SHIFRID,'
      '    TMP.SHIFRIDOTP,'
      '    TMP.SEL,'
      '    TMP.MONTH_ZA,'
      '    TMP.YEAR_ZA,'
      '    TMP.SUMMA_BUD,'
      '    TMP.SUMMA_VNE,'
      '    TMP.SUMMA_GN,'
      '    TMP.SUMMA_NIS,'
      '    TMP.OKLAD_M,'
      '    TMP.DAY_WORK,'
      '    TMP.KOEF,'
      '    TMP.DAY_KALEND,'
      '    TMP.ShifrIdTMP,'
      '    TMP.Manual_Calc,'
      '    TMP.DAY_KALEND_WORK '
      'FROM'
      '    TMP_OTP_SUMMY TMP'
      'where connid=CURRENT_CONNECTION'
      'order by TMP.YEAR_ZA desc,TMP.MONTH_ZA DESC'
      '')
    AutoUpdateOptions.UpdateTableName = 'TMP_OTP_SUMMY'
    AutoUpdateOptions.KeyFields = 'SHIFRIDTMP'
    AutoUpdateOptions.AutoReWriteSqls = True
    AutoUpdateOptions.CanChangeSQLs = True
    AutoUpdateOptions.GeneratorName = 'GOTP_SUMMY_TMP'
    AutoUpdateOptions.UpdateOnlyModifiedFields = True
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    AutoUpdateOptions.AutoParamsToFields = True
    Transaction = FIB.pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = FIB.pFIBTransactionSAL
    AutoCommit = True
    Left = 20
    Top = 127
    object pFIBDataSetSummyCONNID: TFIBIntegerField
      FieldName = 'CONNID'
      Origin = 'TMP_OTP_SUMMY.CONNID'
    end
    object pFIBDataSetSummySHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      Origin = 'TMP_OTP_SUMMY.SHIFRID'
    end
    object pFIBDataSetSummySHIFRIDOTP: TFIBIntegerField
      FieldName = 'SHIFRIDOTP'
      Origin = 'TMP_OTP_SUMMY.SHIFRIDOTP'
    end
    object pFIBDataSetSummySEL: TFIBSmallIntField
      FieldName = 'SEL'
      Origin = 'TMP_OTP_SUMMY.SEL'
      MaxValue = 1
    end
    object pFIBDataSetSummyMONTH_ZA: TFIBSmallIntField
      FieldName = 'MONTH_ZA'
      Origin = 'TMP_OTP_SUMMY.MONTH_ZA'
    end
    object pFIBDataSetSummyYEAR_ZA: TFIBSmallIntField
      FieldName = 'YEAR_ZA'
      Origin = 'TMP_OTP_SUMMY.YEAR_ZA'
    end
    object pFIBDataSetSummySUMMA_BUD: TFIBBCDField
      FieldName = 'SUMMA_BUD'
      Origin = 'TMP_OTP_SUMMY.SUMMA_BUD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetSummySUMMA_VNE: TFIBBCDField
      FieldName = 'SUMMA_VNE'
      Origin = 'TMP_OTP_SUMMY.SUMMA_VNE'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetSummySUMMA_GN: TFIBBCDField
      FieldName = 'SUMMA_GN'
      Origin = 'TMP_OTP_SUMMY.SUMMA_GN'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetSummySUMMA_NIS: TFIBBCDField
      FieldName = 'SUMMA_NIS'
      Origin = 'TMP_OTP_SUMMY.SUMMA_NIS'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetSummyOKLAD_M: TFIBBCDField
      FieldName = 'OKLAD_M'
      Origin = 'TMP_OTP_SUMMY.OKLAD_M'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetSummyDAY_WORK: TFIBSmallIntField
      FieldName = 'DAY_WORK'
      Origin = 'TMP_OTP_SUMMY.DAY_WORK'
    end
    object pFIBDataSetSummyKOEF: TFIBBCDField
      FieldName = 'KOEF'
      Origin = 'TMP_OTP_SUMMY.KOEF'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetSummyDAY_KALEND: TFIBSmallIntField
      FieldName = 'DAY_KALEND'
      Origin = 'TMP_OTP_SUMMY.DAY_KALEND'
    end
    object pFIBDataSetSummySHIFRIDTMP: TFIBIntegerField
      FieldName = 'SHIFRIDTMP'
      Origin = 'TMP_OTP_SUMMY.SHIFRIDTMP'
    end
    object pFIBDataSetSummyMANUAL_CALC: TFIBSmallIntField
      FieldName = 'MANUAL_CALC'
    end
    object pFIBDataSetSummyDAY_KALEND_WORK: TFIBSmallIntField
      FieldName = 'DAY_KALEND_WORK'
    end
  end
  object pFIBDataSetRes: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TMP_OTP_RES'
      'SET '
      '    CONNID = :CONNID,'
      '    SHIFRID = :SHIFRID,'
      '    SHIFRIDOTP = :SHIFRIDOTP,'
      '    SHIFRSTA = :SHIFRSTA,'
      '    O_DAY = :O_DAY,'
      '    MONTH_ZA = :MONTH_ZA,'
      '    YEAR_ZA = :YEAR_ZA,'
      '    SUMMA_O_BUD = :SUMMA_O_BUD,'
      '    SUMMA_O_VNE = :SUMMA_O_VNE,'
      '    SUMMA_O_GN = :SUMMA_O_GN,'
      '    SUMMA_O_NIS = :SUMMA_O_NIS,'
      '    SHIFRIDTMP = :SHIFRIDTMP'
      'WHERE'
      '    SHIFRIDTMP = :OLD_SHIFRIDTMP'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TMP_OTP_RES'
      'WHERE'
      '        SHIFRIDTMP = :OLD_SHIFRIDTMP'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_OTP_RES('
      '    CONNID,'
      '    SHIFRID,'
      '    SHIFRIDOTP,'
      '    SHIFRSTA,'
      '    O_DAY,'
      '    MONTH_ZA,'
      '    YEAR_ZA,'
      '    SUMMA_O_BUD,'
      '    SUMMA_O_VNE,'
      '    SUMMA_O_GN,'
      '    SUMMA_O_NIS,'
      '    SHIFRIDTMP'
      ')'
      'VALUES('
      '    :CONNID,'
      '    :SHIFRID,'
      '    :SHIFRIDOTP,'
      '    :SHIFRSTA,'
      '    :O_DAY,'
      '    :MONTH_ZA,'
      '    :YEAR_ZA,'
      '    :SUMMA_O_BUD,'
      '    :SUMMA_O_VNE,'
      '    :SUMMA_O_GN,'
      '    :SUMMA_O_NIS,'
      '    :SHIFRIDTMP'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    TMP.CONNID,'
      '    TMP.SHIFRID,'
      '    TMP.SHIFRIDOTP,'
      '    TMP.SHIFRSTA,'
      '    TMP.O_DAY,'
      '    TMP.MONTH_ZA,'
      '    TMP.YEAR_ZA,'
      '    TMP.SUMMA_O_BUD,'
      '    TMP.SUMMA_O_VNE,'
      '    TMP.SUMMA_O_GN,'
      '    TMP.SUMMA_O_NIS,'
      '    TMP.ShifrIdTMP'
      'FROM'
      '    TMP_OTP_RES TMP'
      'where(  connid=CURRENT_CONNECTION'
      '     ) and (     TMP.SHIFRIDTMP = :OLD_SHIFRIDTMP'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    TMP.CONNID,'
      '    TMP.SHIFRID,'
      '    TMP.SHIFRIDOTP,'
      '    TMP.SHIFRSTA,'
      '    TMP.O_DAY,'
      '    TMP.MONTH_ZA,'
      '    TMP.YEAR_ZA,'
      '    TMP.SUMMA_O_BUD,'
      '    TMP.SUMMA_O_VNE,'
      '    TMP.SUMMA_O_GN,'
      '    TMP.SUMMA_O_NIS,'
      '    TMP.ShifrIdTMP'
      'FROM'
      '    TMP_OTP_RES TMP'
      'where connid=CURRENT_CONNECTION'
      'order by TMP.YEAR_ZA,TMP.MONTH_ZA')
    Transaction = FIB.pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = FIB.pFIBTransactionSAL
    Left = 68
    Top = 127
    oStartTransaction = False
    object pFIBDataSetResCONNID: TFIBIntegerField
      FieldName = 'CONNID'
      Origin = 'TMP_OTP_RES.CONNID'
    end
    object pFIBDataSetResSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      Origin = 'TMP_OTP_RES.SHIFRID'
    end
    object pFIBDataSetResSHIFRIDOTP: TFIBIntegerField
      FieldName = 'SHIFRIDOTP'
      Origin = 'TMP_OTP_RES.SHIFRIDOTP'
    end
    object pFIBDataSetResSHIFRSTA: TFIBSmallIntField
      DisplayLabel = #1064#1092#1088
      FieldName = 'SHIFRSTA'
      Origin = 'TMP_OTP_RES.SHIFRSTA'
    end
    object pFIBDataSetResO_DAY: TFIBSmallIntField
      FieldName = 'O_DAY'
      Origin = 'TMP_OTP_RES.O_DAY'
    end
    object pFIBDataSetResMONTH_ZA: TFIBSmallIntField
      FieldName = 'MONTH_ZA'
      Origin = 'TMP_OTP_RES.MONTH_ZA'
    end
    object pFIBDataSetResYEAR_ZA: TFIBSmallIntField
      FieldName = 'YEAR_ZA'
      Origin = 'TMP_OTP_RES.YEAR_ZA'
    end
    object pFIBDataSetResSUMMA_O_BUD: TFIBBCDField
      FieldName = 'SUMMA_O_BUD'
      Origin = 'TMP_OTP_RES.SUMMA_O_BUD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetResSUMMA_O_VNE: TFIBBCDField
      FieldName = 'SUMMA_O_VNE'
      Origin = 'TMP_OTP_RES.SUMMA_O_VNE'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetResSUMMA_O_GN: TFIBBCDField
      FieldName = 'SUMMA_O_GN'
      Origin = 'TMP_OTP_RES.SUMMA_O_GN'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetResSUMMA_O_NIS: TFIBBCDField
      FieldName = 'SUMMA_O_NIS'
      Origin = 'TMP_OTP_RES.SUMMA_O_NIS'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetResSHIFRIDTMP: TFIBIntegerField
      FieldName = 'SHIFRIDTMP'
      Origin = 'TMP_OTP_RES.SHIFRIDTMP'
    end
  end
  object DataSourceSummy: TDataSource
    DataSet = pFIBDataSetSummy
    Left = 20
    Top = 87
  end
  object DataSourceRes: TDataSource
    DataSet = pFIBDataSetRes
    Left = 68
    Top = 63
  end
  object pFIBStoredProcMkSummy: TpFIBStoredProc
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    SQL.Strings = (
      
        'EXECUTE PROCEDURE MKTMPOTPSUMMY (?TABNO, ?DATEFR, ?CURRMONTH, ?C' +
        'URRYEAR, ?RAZRIJAD, ?MODE,?MODEDC,?KIND_OTP)')
    StoredProcName = 'MKTMPOTPSUMMY'
    Left = 28
    Top = 207
    qoAutoCommit = True
    qoStartTransaction = True
  end
  object pFIBStoredProcSave: TpFIBStoredProc
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    SQL.Strings = (
      
        'EXECUTE PROCEDURE PUTOTP (?SHIFRID, ?TABNO, ?F_DATA, ?L_DATA, ?D' +
        'ATAVY, ?SHIFRSTA, ?O_DAY, ?MEANDAY_BUD, ?MEANDAY_VNE, ?MEANDAY_G' +
        'N, ?MEANDAY_NIS, ?RAZRIJAD, ?MODE, ?MODEDC, ?KIND_OTP, ?NOMER_PR' +
        'I, ?DATA_PRI, ?PERIOD_PRI, ?MODE_25_07_2016)')
    StoredProcName = 'PUTOTP'
    Left = 76
    Top = 207
    qoStartTransaction = True
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 76
    Top = 167
  end
  object pFIBDataSetPereRes: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TMP_OTP_RES'
      'SET '
      ' NEED_PERE_BUD = :NEED_PERE_BUD,'
      ' NEED_PERE_VNE = :NEED_PERE_VNE,'
      ' NEED_PERE_GN  = :NEED_PERE_GN,'
      ' NEED_PERE_NIS = :NEED_PERE_NIS,'
      ' DATA_PERE_BUD = :DATA_PERE_BUD,'
      ' DATA_PERE_VNE = :DATA_PERE_VNE,'
      ' DATA_PERE_GN  = :DATA_PERE_GN,'
      ' DATA_PERE_NIS = :DATA_PERE_NIS'
      'WHERE'
      ' SHIFRIDTMP = :OLD_SHIFRIDTMP'
      ' ')
    RefreshSQL.Strings = (
      'SELECT'
      '    TMP.CONNID,'
      '    TMP.SHIFRID,'
      '    TMP.SHIFRIDOTP,'
      '    TMP.SHIFRSTA,'
      '    TMP.O_DAY,'
      '    TMP.MONTH_ZA,'
      '    TMP.YEAR_ZA,'
      '    TMP.NEED_PERE_BUD, '
      '    TMP.NEED_PERE_VNE, '
      '    TMP.NEED_PERE_GN, '
      '    TMP.NEED_PERE_NIS, '
      '    TMP.DATA_PERE_BUD, '
      '    TMP.DATA_PERE_VNE, '
      '    TMP.DATA_PERE_GN, '
      '    TMP.DATA_PERE_NIS, '
      '    TMP.ShifrIdTMP'
      'FROM'
      '    TMP_OTP_RES TMP'
      'where connid=CURRENT_CONNECTION'
      'and (     TMP.SHIFRIDTMP = :OLD_SHIFRIDTMP'
      '     )')
    SelectSQL.Strings = (
      'SELECT'
      '    TMP.CONNID,'
      '    TMP.SHIFRID,'
      '    TMP.SHIFRIDOTP,'
      '    TMP.SHIFRSTA,'
      '    TMP.O_DAY,'
      '    TMP.MONTH_ZA,'
      '    TMP.YEAR_ZA,'
      '    TMP.NEED_PERE_BUD, '
      '    TMP.NEED_PERE_VNE, '
      '    TMP.NEED_PERE_GN, '
      '    TMP.NEED_PERE_NIS, '
      '    TMP.DATA_PERE_BUD, '
      '    TMP.DATA_PERE_VNE, '
      '    TMP.DATA_PERE_GN, '
      '    TMP.DATA_PERE_NIS, '
      '    TMP.SUMMA_O_BUD,'
      '    TMP.SUMMA_O_VNE,'
      '    TMP.SUMMA_O_NIS,'
      '    TMP.SUMMA_O_GN,'
      '    TMP.ShifrIdTMP'
      'FROM'
      '    TMP_OTP_RES TMP'
      'where connid=CURRENT_CONNECTION'
      'order by TMP.YEAR_ZA,TMP.MONTH_ZA')
    AutoCalcFields = False
    Transaction = FIB.pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionPereWrite
    AutoCommit = True
    Left = 132
    Top = 127
    object pFIBDataSetPereResCONNID: TFIBIntegerField
      FieldName = 'CONNID'
      ReadOnly = True
    end
    object pFIBDataSetPereResSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      ReadOnly = True
    end
    object pFIBDataSetPereResSHIFRIDOTP: TFIBIntegerField
      FieldName = 'SHIFRIDOTP'
      ReadOnly = True
    end
    object pFIBDataSetPereResSHIFRSTA: TFIBSmallIntField
      FieldName = 'SHIFRSTA'
      ReadOnly = True
    end
    object pFIBDataSetPereResO_DAY: TFIBSmallIntField
      FieldName = 'O_DAY'
      ReadOnly = True
    end
    object pFIBDataSetPereResMONTH_ZA: TFIBSmallIntField
      FieldName = 'MONTH_ZA'
      ReadOnly = True
    end
    object pFIBDataSetPereResYEAR_ZA: TFIBSmallIntField
      FieldName = 'YEAR_ZA'
    end
    object pFIBDataSetPereResNEED_PERE_BUD: TFIBSmallIntField
      FieldName = 'NEED_PERE_BUD'
    end
    object pFIBDataSetPereResNEED_PERE_VNE: TFIBSmallIntField
      FieldName = 'NEED_PERE_VNE'
    end
    object pFIBDataSetPereResNEED_PERE_GN: TFIBSmallIntField
      FieldName = 'NEED_PERE_GN'
    end
    object pFIBDataSetPereResNEED_PERE_NIS: TFIBSmallIntField
      FieldName = 'NEED_PERE_NIS'
    end
    object pFIBDataSetPereResDATA_PERE_BUD: TFIBDateField
      FieldName = 'DATA_PERE_BUD'
    end
    object pFIBDataSetPereResDATA_PERE_VNE: TFIBDateField
      FieldName = 'DATA_PERE_VNE'
    end
    object pFIBDataSetPereResDATA_PERE_GN: TFIBDateField
      FieldName = 'DATA_PERE_GN'
    end
    object pFIBDataSetPereResDATA_PERE_NIS: TFIBDateField
      FieldName = 'DATA_PERE_NIS'
    end
    object pFIBDataSetPereResSHIFRIDTMP: TFIBIntegerField
      FieldName = 'SHIFRIDTMP'
    end
    object pFIBDataSetPereResSUMMA_O_BUD: TFIBBCDField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1041
      FieldName = 'SUMMA_O_BUD'
      DisplayFormat = '#######.00'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetPereResSUMMA_O_VNE: TFIBBCDField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1042#1073
      FieldName = 'SUMMA_O_VNE'
      DisplayFormat = '#######.00'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetPereResSUMMA_O_NIS: TFIBBCDField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1053#1048#1057
      FieldName = 'SUMMA_O_NIS'
      DisplayFormat = '#######.00'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetPereResSUMMA_O_GN: TFIBBCDField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1043#1053
      FieldName = 'SUMMA_O_GN'
      DisplayFormat = '#######.00'
      Size = 2
      RoundByScale = True
    end
  end
  object DataSourcePereRas: TDataSource
    DataSet = pFIBDataSetPereRes
    Left = 344
    Top = 128
  end
  object PopupMenu1: TPopupMenu
    Left = 324
    Top = 263
    object N1: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072
      OnClick = N1Click
    end
    object N9: TMenuItem
      Caption = #1054#1090#1084#1077#1090#1082#1072' '#1074#1080#1076#1072' '#1088#1072#1073#1086#1090#1099
      object N10: TMenuItem
        Caption = #1054#1089#1085#1086#1074#1085#1072#1103
        OnClick = N10Click
      end
      object N11: TMenuItem
        Caption = #1057#1086#1074#1084#1077#1097#1077#1085#1080#1077
        OnClick = N11Click
      end
    end
  end
  object pFIBTransactionPereWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 172
    Top = 127
  end
  object PopupMenu2: TPopupMenu
    Left = 388
    Top = 263
    object N2: TMenuItem
      Caption = #1054#1090#1084#1077#1090#1080#1090#1100' '#1074#1089#1077
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1057#1073#1088#1086#1089' '#1076#1072#1090' '#1087#1077#1088#1077#1085#1086#1089#1072' '
      object N4: TMenuItem
        Caption = #1058#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1086#1090#1084#1077#1095#1077#1085#1085#1099#1093
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1042#1089#1077' '#1076#1072#1090#1099
        OnClick = N5Click
      end
    end
    object N6: TMenuItem
      Caption = #1054#1090#1084#1077#1090#1080#1090#1100' '#1074#1080#1076' '#1088#1072#1073#1086#1090#1099
      object N7: TMenuItem
        Caption = #1054#1089#1085#1086#1074#1085#1072#1103
        OnClick = N7Click
      end
      object N8: TMenuItem
        Caption = #1057#1086#1074#1084#1077#1097#1077#1085#1080#1077
        OnClick = N8Click
      end
    end
  end
end
