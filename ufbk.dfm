object FormBolKoe: TFormBolKoe
  Left = 240
  Top = 140
  Width = 583
  Height = 539
  Caption = #1050#1086#1108#1092#1092#1080#1094#1080#1077#1085#1090#1099' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridBolKoe: TdxDBGrid
    Left = 40
    Top = 56
    Width = 425
    Height = 369
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = DataSourceBolKoe
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCanAppend, edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoUseBookmarks]
    OptionsView = [edgoAutoCalcPreviewLines, edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    object dxDBGridBolKoeColumnDataFr: TdxDBGridDateColumn
      Caption = #1044#1072#1090#1072' '#1089
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATEB'
    end
    object dxDBGridBolKoeColumnDataZa: TdxDBGridDateColumn
      Caption = #1044#1072#1090#1072' '#1079#1072
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATEZA'
    end
    object dxDBGridBolKoeColumnKoef3: TdxDBGridCalcColumn
      Caption = #1050#1086#1101#1092#1092#1080#1094#1077#1085#1090
      BandIndex = 0
      RowIndex = 0
      FieldName = 'KOEF'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 40
    Top = 432
    Width = 240
    Height = 25
    DataSource = DataSourceBolKoe
    TabOrder = 1
  end
  object PageControl1: TPageControl
    Left = 16
    Top = 8
    Width = 497
    Height = 457
    ActivePage = TabSheet1
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = #1041#1086#1083#1100#1085#1080#1095#1085#1099#1077
    end
    object TabSheet2: TTabSheet
      Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077
      ImageIndex = 1
    end
  end
  object DataSourceBolKoe: TDataSource
    DataSet = pFIBDataSetBolKoe
    Left = 80
    Top = 120
  end
  object pFIBDataSetBolKoe: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE BOL_KOE'
      'SET '
      '    DATEB = :DATEB,'
      '    DATEZA = :DATEZA,'
      '    KOEF = :KOEF,'
      '    SHIFRKAT = :SHIFRKAT'
      'WHERE'
      '    DATEB = :OLD_DATEB'
      '    and DATEZA = :OLD_DATEZA'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    BOL_KOE'
      'WHERE'
      '        DATEB = :OLD_DATEB'
      '    and DATEZA = :OLD_DATEZA'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO BOL_KOE('
      '    DATEB,'
      '    DATEZA,'
      '    KOEF,'
      '    SHIFRKAT'
      ')'
      'VALUES('
      '    :DATEB,'
      '    :DATEZA,'
      '    :KOEF,'
      '    :SHIFRKAT'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    BOL.DATEB,'
      '    BOL.DATEZA,'
      '    BOL.KOEF,'
      '    BOL.SHIFRKAT'
      ''
      'FROM'
      '    BOL_KOE BOL'
      ' WHERE '
      '        BOL.DATEB = :OLD_DATEB'
      '    and BOL.DATEZA = :OLD_DATEZA'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    BOL.DATEB,'
      '    BOL.DATEZA,'
      '    BOL.KOEF,'
      '    BOL.SHIFRKAT'
      ''
      'FROM'
      '    BOL_KOE BOL'
      'order by 1,2')
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionSalWrite
    AutoCommit = True
    Left = 120
    Top = 120
    object pFIBDataSetBolKoeDATEB: TFIBDateField
      FieldName = 'DATEB'
      Origin = 'BOL_KOE.DATEB'
    end
    object pFIBDataSetBolKoeDATEZA: TFIBDateField
      FieldName = 'DATEZA'
      Origin = 'BOL_KOE.DATEZA'
    end
    object pFIBDataSetBolKoeKOEF: TFIBBCDField
      FieldName = 'KOEF'
      Origin = 'BOL_KOE.KOEF'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetBolKoeSHIFRKAT: TFIBIntegerField
      FieldName = 'SHIFRKAT'
      Origin = 'BOL_KOE.SHIFRKAT'
    end
  end
  object pFIBTransactionSalWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 160
    Top = 120
  end
end
