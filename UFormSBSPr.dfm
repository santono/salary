object FormSbsPr: TFormSbsPr
  Left = 251
  Top = 168
  Width = 455
  Height = 480
  Caption = #1056#1072#1089#1096#1080#1092#1088#1086#1074#1082#1072' '#1089#1087#1088#1072#1074#1082#1080' '#1076#1083#1103' '#1089#1091#1073#1089#1080#1076#1080#1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object LabelFio: TLabel
    Left = 8
    Top = 8
    Width = 61
    Height = 20
    Caption = 'LabelFio'
  end
  object dxDBGridSbs: TdxDBGrid
    Left = 8
    Top = 40
    Width = 425
    Height = 385
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = DataSource1
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    object dxDBGridSbsSHIFRID: TdxDBGridMaskColumn
      Visible = False
      Width = 26
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGridSbsSHIFRIDOWNER: TdxDBGridMaskColumn
      Visible = False
      Width = 37
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRIDOWNER'
    end
    object dxDBGridSbsYEAR_ZA: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Sorted = csUp
      Width = 90
      BandIndex = 0
      RowIndex = 0
      FieldName = 'YEAR_ZA'
    end
    object dxDBGridSbsMONTH_ZA: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 90
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MONTH_ZA'
    end
    object dxDBGridSbsSUMMA: TdxDBGridCurrencyColumn
      Width = 90
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00;-,0.00'
      Nullable = False
    end
    object dxDBGridSbsSUMMA_ALIM: TdxDBGridCurrencyColumn
      Width = 134
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMA_ALIM'
      Nullable = False
    end
    object dxDBGridSbsColumn7: TdxDBGridButtonColumn
      Width = 20
      BandIndex = 0
      RowIndex = 0
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = dxDBGridSbsColumn7ButtonClick
    end
  end
  object DataSource1: TDataSource
    DataSet = pFIBDataSetSBSPr
    Left = 160
    Top = 40
  end
  object pFIBDataSetSBSPr: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' SHIFRIDOWNER,'
      ' YEAR_ZA,'
      ' MONTH_ZA,'
      ' SUMMA,'
      ' SUMMA_ALIM'
      'FROM'
      ' TB_SPRSBSPRTABLE'
      'WHERE SHIFRIDOWNER=:SHIFRID'
      'ORDER BY YEAR_ZA,MONTH_ZA'
      ' ')
    AllowedUpdateKinds = []
    Transaction = pFIBTransactionSbsPr
    Database = FIB.pFIBDatabaseSal
    Left = 80
    Top = 40
    object pFIBDataSetSBSPrSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      ReadOnly = True
    end
    object pFIBDataSetSBSPrSHIFRIDOWNER: TFIBIntegerField
      FieldName = 'SHIFRIDOWNER'
      ReadOnly = True
    end
    object pFIBDataSetSBSPrYEAR_ZA: TFIBSmallIntField
      DisplayLabel = #1043#1086#1076
      FieldName = 'YEAR_ZA'
      ReadOnly = True
    end
    object pFIBDataSetSBSPrMONTH_ZA: TFIBSmallIntField
      DisplayLabel = #1052#1094
      FieldName = 'MONTH_ZA'
      ReadOnly = True
    end
    object pFIBDataSetSBSPrSUMMA: TFIBBCDField
      DisplayLabel = #1053#1072#1095#1080#1089#1083#1077#1085#1086
      FieldName = 'SUMMA'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetSBSPrSUMMA_ALIM: TFIBBCDField
      DisplayLabel = #1040#1083#1080#1084#1077#1085#1090#1099
      FieldName = 'SUMMA_ALIM'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
  end
  object pFIBTransactionSbsPr: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 120
    Top = 40
  end
end
