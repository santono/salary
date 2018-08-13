object FormGrid: TFormGrid
  Left = 230
  Top = 122
  Width = 696
  Height = 453
  Caption = #1044#1080#1072#1087#1072#1079#1086#1085#1099' '#1076#1083#1103' '#1087#1083#1072#1085#1086#1074#1086#1075#1086' '#1086#1090#1076#1077#1083#1072
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
    417)
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridGrid: TdxDBGrid
    Left = 8
    Top = 8
    Width = 665
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
    DataSource = DataSourceGrid
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridGridSHIFRID: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGridGridDATAFR: TdxDBGridDateColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATAFR'
    end
    object dxDBGridGridSUMMAFR: TdxDBGridCalcColumn
      Caption = #1053#1080#1078#1085#1103#1103' '#1075#1088#1072#1085#1080#1094#1072
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMAFR'
    end
    object dxDBGridGridSUMMATO: TdxDBGridCalcColumn
      Caption = #1042#1077#1088#1093#1085#1103#1103' '#1075#1088#1072#1085#1080#1094#1072
      HeaderAlignment = taCenter
      Sorted = csUp
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMATO'
    end
  end
  object DBNavigatorGrid: TDBNavigator
    Left = 8
    Top = 392
    Width = 240
    Height = 25
    DataSource = DataSourceGrid
    TabOrder = 1
  end
  object pFIBDataSetGrid: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_PLAN_GRID'
      'SET '
      ' DATAFR = :DATAFR,'
      ' SUMMAFR = :SUMMAFR,'
      ' SUMMATO = :SUMMATO'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_PLAN_GRID'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_PLAN_GRID('
      ' SHIFRID,'
      ' DATAFR,'
      ' SUMMAFR,'
      ' SUMMATO'
      ')'
      'VALUES('
      ' :SHIFRID,'
      ' :DATAFR,'
      ' :SUMMAFR,'
      ' :SUMMATO'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' DATAFR,'
      ' SUMMAFR,'
      ' SUMMATO'
      'FROM'
      ' TB_PLAN_GRID '
      ''
      ' WHERE '
      '  TB_PLAN_GRID.SHIFRID = :OLD_SHIFRID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' DATAFR,'
      ' SUMMAFR,'
      ' SUMMATO'
      'FROM'
      ' TB_PLAN_GRID '
      'ORDER BY 2,3')
    AutoUpdateOptions.UpdateTableName = 'TB_PLAN_GRID'
    AutoUpdateOptions.KeyFields = 'SHIFRID'
    AutoUpdateOptions.GeneratorName = 'G_GRID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = pFIBTransactionWrite
    Database = FIB.pFIBDatabaseSal
    Left = 104
    Top = 80
    object pFIBDataSetGridSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object pFIBDataSetGridDATAFR: TFIBDateField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DATAFR'
    end
    object pFIBDataSetGridSUMMAFR: TFIBBCDField
      FieldName = 'SUMMAFR'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetGridSUMMATO: TFIBBCDField
      FieldName = 'SUMMATO'
      Size = 2
      RoundByScale = True
    end
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 144
    Top = 80
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
    Left = 192
    Top = 80
  end
  object DataSourceGrid: TDataSource
    DataSet = pFIBDataSetGrid
    Left = 224
    Top = 80
  end
end
