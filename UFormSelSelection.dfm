object FormSelSelection: TFormSelSelection
  Left = 220
  Top = 174
  Width = 704
  Height = 480
  Caption = #1042#1099#1073#1086#1088' '#1089#1087#1080#1089#1082#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridSelSel: TdxDBGrid
    Left = 8
    Top = 8
    Width = 673
    Height = 393
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    OnDblClick = dxDBGridSelSelDblClick
    DataSource = DataSourceSelSel
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    object dxDBGridSelSelSHIFRID: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGridSelSelNAME: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
  end
  object pFIBDataSetSelSel: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    SHIFRID,'
      '    NAME'
      'FROM'
      '    TB_NAME_PODR_SELECTION_DET '
      'WHERE SHIFRIDOWNER=:SHIFRIDOWNER')
    Transaction = pFIBTransactionSelSel
    Database = FIB.pFIBDatabaseSal
    Left = 8
    Top = 8
    object pFIBDataSetSelSelSHIFRID: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'SHIFRID'
      ReadOnly = True
    end
    object pFIBDataSetSelSelNAME: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      ReadOnly = True
      Size = 128
      EmptyStrToNull = True
    end
  end
  object pFIBTransactionSelSel: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 48
    Top = 8
  end
  object DataSourceSelSel: TDataSource
    DataSet = pFIBDataSetSelSel
    Left = 88
    Top = 8
  end
end
