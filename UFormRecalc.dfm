object FormRecalc: TFormRecalc
  Left = 192
  Top = 142
  Width = 756
  Height = 555
  Caption = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090#1099' '#1079#1072' '#1087#1088#1086#1096#1083#1099#1081' '#1087#1077#1088#1080#1086#1076
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
    740
    519)
  PixelsPerInch = 96
  TextHeight = 20
  object DateTimePicker1: TDateTimePicker
    Left = 544
    Top = 8
    Width = 177
    Height = 28
    Date = 38690.472113159720000000
    Time = 38690.472113159720000000
    DateFormat = dfLong
    TabOrder = 0
    OnChange = DateTimePicker1Change
  end
  object PageRec: TPageControl
    Left = 16
    Top = 40
    Width = 721
    Height = 457
    ActivePage = TabFZ
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object TabPod: TTabSheet
      Caption = #1055#1086#1076#1086#1093#1086#1076#1085#1099#1081
      object dxDBGridPod: TdxDBGrid
        Left = 0
        Top = 0
        Width = 705
        Height = 409
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'MONTHZA'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceRecac
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        object dxDBGridPodMonthZa: TdxDBGridColumn
          Caption = #1052#1094
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MONTHZA'
        end
        object dxDBGridPodNach: TdxDBGridColumn
          Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAPODADD'
        end
        object dxDBGridPodFakt: TdxDBGridColumn
          Caption = #1059#1076#1077#1088#1078#1072#1085#1086
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAPODUD'
        end
        object dxDBGridPodRas: TdxDBGridColumn
          Caption = #1056#1072#1089#1095#1077#1090#1085#1099#1081
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAPODRAS'
        end
        object dxDBGridPodRazn: TdxDBGridColumn
          Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAPODRAZN'
        end
      end
    end
    object TabPens: TTabSheet
      Caption = #1055#1077#1085#1089#1080#1086#1085#1085#1099#1081
      ImageIndex = 1
      object dxDBGridPens: TdxDBGrid
        Left = 0
        Top = 8
        Width = 705
        Height = 409
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'MONTHZA'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceRecac
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        object dxDBGridPensMONTHZA: TdxDBGridMaskColumn
          Caption = #1052#1094
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MONTHZA'
        end
        object dxDBGridPensSUMMAPENSADD: TdxDBGridCurrencyColumn
          Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAPENSADD'
          DisplayFormat = ',0.00'
          Nullable = False
        end
        object dxDBGridPensSUMMAPENSUD: TdxDBGridCurrencyColumn
          Caption = #1059#1076#1077#1088#1078#1072#1085#1086
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAPENSUD'
          DisplayFormat = ',0.00'
          Nullable = False
        end
        object dxDBGridPensSUMMAPENSRAS: TdxDBGridCurrencyColumn
          Caption = #1056#1072#1089#1095#1077#1090#1085#1099#1081
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAPENSRAS'
          DisplayFormat = ',0.00'
          Nullable = False
        end
        object dxDBGridPensSUMMAPENSRAZN: TdxDBGridCurrencyColumn
          Caption = #1056#1072#1079#1085#1080#1094#1072
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAPENSRAZN'
          DisplayFormat = ',0.00'
          Nullable = False
        end
      end
    end
    object TabSS: TTabSheet
      Caption = #1057#1086#1094'.'#1089#1090#1088#1072#1093
      ImageIndex = 2
      object dxDBGridSS: TdxDBGrid
        Left = 0
        Top = 8
        Width = 705
        Height = 401
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'MONTHZA'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceRecac
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        object dxDBGridSSMONTHZA: TdxDBGridMaskColumn
          Caption = #1052#1094
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MONTHZA'
        end
        object dxDBGridSSSUMMASSADD: TdxDBGridCurrencyColumn
          Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMASSADD'
          DisplayFormat = ',0.00'
          Nullable = False
        end
        object dxDBGridSSSUMMASSUD: TdxDBGridCurrencyColumn
          Caption = #1059#1076#1077#1088#1078#1072#1085#1086
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMASSUD'
          DisplayFormat = ',0.00'
          Nullable = False
        end
        object dxDBGridSSSUMMASSRAS: TdxDBGridCurrencyColumn
          Caption = #1056#1072#1089#1095#1077#1090#1085#1099#1081
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMASSRAS'
          DisplayFormat = ',0.00'
          Nullable = False
        end
        object dxDBGridSSSUMMASSRAZN: TdxDBGridCurrencyColumn
          Caption = #1056#1072#1079#1085#1080#1094#1072
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMASSRAZN'
          DisplayFormat = ',0.00'
          Nullable = False
        end
      end
    end
    object TabFZ: TTabSheet
      Caption = #1060#1086#1085#1076' '#1079#1072#1085#1103#1090#1086#1089#1090#1080
      ImageIndex = 3
      object dxDBGridFZ: TdxDBGrid
        Left = 0
        Top = 8
        Width = 705
        Height = 401
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'MONTHZA'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceRecac
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        object dxDBGridFZMONTHZA: TdxDBGridMaskColumn
          Caption = #1052#1094
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MONTHZA'
        end
        object dxDBGridFZSUMMAFZADD: TdxDBGridCurrencyColumn
          Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAFZADD'
          DisplayFormat = ',0.00'
          Nullable = False
        end
        object dxDBGridFZSUMMAFZUD: TdxDBGridCurrencyColumn
          Caption = #1059#1076#1077#1088#1078#1072#1085#1086
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAFZUD'
          DisplayFormat = ',0.00'
          Nullable = False
        end
        object dxDBGridFZSUMMAFZRAS: TdxDBGridCurrencyColumn
          Caption = #1056#1072#1089#1095#1077#1090#1085#1099#1081
          HeaderAlignment = taCenter
          Sorted = csUp
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAFZRAS'
          DisplayFormat = ',0.00'
          Nullable = False
        end
        object dxDBGridFZSUMMAFZRAZN: TdxDBGridCurrencyColumn
          Caption = #1056#1072#1079#1085#1080#1094#1072
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAFZRAZN'
          DisplayFormat = ',0.00'
          Nullable = False
        end
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 544
    Top = 40
    Width = 75
    Height = 25
    Caption = #1056#1072#1089#1095#1077#1090
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object pFIBDataSetRecalc: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    REC.MONTHZA,'
      '    REC.SUMMAPODADD,'
      '    REC.SUMMAPODUD,'
      '    REC.SUMMAPODRAS,'
      '    REC.SUMMAPODRAZN,'
      '    REC.SUMMAPENSADD,'
      '    REC.SUMMAPENSUD,'
      '    REC.SUMMAPENSRAS,'
      '    REC.SUMMAPENSRAZN,'
      '    REC.SUMMASSADD,'
      '    REC.SUMMASSUD,'
      '    REC.SUMMASSRAS,'
      '    REC.SUMMASSRAZN,'
      '    REC.SUMMAFZADD,'
      '    REC.SUMMAFZUD,'
      '    REC.SUMMAFZRAS,'
      '    REC.SUMMAFZRAZN'
      'FROM'
      '    RECALCPODOHYEAR(:TABNO,'
      '    :YEARZA) REC')
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    Left = 12
    Top = 7
    object pFIBDataSetRecalcMONTHZA: TFIBIntegerField
      FieldName = 'MONTHZA'
    end
    object pFIBDataSetRecalcSUMMAPODADD: TFIBBCDField
      FieldName = 'SUMMAPODADD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRecalcSUMMAPODUD: TFIBBCDField
      FieldName = 'SUMMAPODUD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRecalcSUMMAPODRAS: TFIBBCDField
      FieldName = 'SUMMAPODRAS'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRecalcSUMMAPODRAZN: TFIBBCDField
      FieldName = 'SUMMAPODRAZN'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRecalcSUMMAPENSADD: TFIBBCDField
      FieldName = 'SUMMAPENSADD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRecalcSUMMAPENSUD: TFIBBCDField
      FieldName = 'SUMMAPENSUD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRecalcSUMMAPENSRAS: TFIBBCDField
      FieldName = 'SUMMAPENSRAS'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRecalcSUMMAPENSRAZN: TFIBBCDField
      FieldName = 'SUMMAPENSRAZN'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRecalcSUMMASSADD: TFIBBCDField
      FieldName = 'SUMMASSADD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRecalcSUMMASSUD: TFIBBCDField
      FieldName = 'SUMMASSUD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRecalcSUMMASSRAS: TFIBBCDField
      FieldName = 'SUMMASSRAS'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRecalcSUMMASSRAZN: TFIBBCDField
      FieldName = 'SUMMASSRAZN'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRecalcSUMMAFZADD: TFIBBCDField
      FieldName = 'SUMMAFZADD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRecalcSUMMAFZUD: TFIBBCDField
      FieldName = 'SUMMAFZUD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRecalcSUMMAFZRAS: TFIBBCDField
      FieldName = 'SUMMAFZRAS'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRecalcSUMMAFZRAZN: TFIBBCDField
      FieldName = 'SUMMAFZRAZN'
      Size = 2
      RoundByScale = True
    end
  end
  object DataSourceRecac: TDataSource
    DataSet = pFIBDataSetRecalc
    Left = 52
    Top = 7
  end
end
