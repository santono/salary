object FormBolKoe: TFormBolKoe
  Left = 240
  Top = 140
  Width = 539
  Height = 539
  Anchors = [akLeft, akTop, akRight, akBottom]
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
  object PageControl1: TPageControl
    Left = 16
    Top = 8
    Width = 497
    Height = 481
    ActivePage = TabSheet2
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1041#1086#1083#1100#1085#1080#1095#1085#1099#1077
      DesignSize = (
        489
        446)
      object dxDBGridBolKoe: TdxDBGrid
        Left = 8
        Top = 0
        Width = 473
        Height = 409
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFRID'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceBolKoe
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCanAppend, edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoCalcPreviewLines, edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridBolKoeColumnDataFr: TdxDBGridDateColumn
          Alignment = taCenter
          Caption = #1044#1072#1090#1072' '#1089
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DATEB'
        end
        object dxDBGridBolKoeColumnDataZa: TdxDBGridDateColumn
          Alignment = taCenter
          Caption = #1044#1072#1090#1072' '#1079#1072
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DATEZA'
        end
        object dxDBGridBolKoeColumnKoef3: TdxDBGridCalcColumn
          Alignment = taCenter
          Caption = #1050#1086#1101#1092#1092#1080#1094#1077#1085#1090
          BandIndex = 0
          RowIndex = 0
          FieldName = 'KOEF'
        end
      end
      object DBNavigator1: TDBNavigator
        Left = 16
        Top = 416
        Width = 240
        Height = 25
        DataSource = DataSourceBolKoe
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077
      ImageIndex = 1
      object dxDBGridOtpKoe: TdxDBGrid
        Left = 0
        Top = 0
        Width = 489
        Height = 409
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFRID'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceOtpKoe
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        object dxDBGridOtpKoeDATEB: TdxDBGridDateColumn
          Alignment = taCenter
          Caption = #1044#1072#1090#1072' '#1074
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DATEB'
        end
        object dxDBGridOtpKoeDATEZA: TdxDBGridDateColumn
          Alignment = taCenter
          Caption = #1044#1072#1090#1072' '#1079#1072
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DATEZA'
        end
        object dxDBGridOtpKoeKOEF: TdxDBGridCalcColumn
          Alignment = taCenter
          Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'KOEF'
        end
      end
      object DBNavigator2: TDBNavigator
        Left = 0
        Top = 408
        Width = 240
        Height = 25
        DataSource = DataSourceOtpKoe
        TabOrder = 1
      end
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
      '    DATEB  = :DATEB,'
      '    DATEZA = :DATEZA,'
      '    KOEF   = :KOEF'
      'WHERE'
      '    SHIFRID = :OLD_SHIFRID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    BOL_KOE'
      'WHERE'
      '    BOL_KOE.SHIFRID=:OLD_SHIFRID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO BOL_KOE('
      '    DATEB,'
      '    DATEZA,'
      '    KOEF,'
      '    SHIFRKAT,'
      '    MODE'
      ')'
      'VALUES('
      '    :DATEB,'
      '    :DATEZA,'
      '    :KOEF,'
      '    1,'
      '    1'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    BOL.DATEB,'
      '    BOL.DATEZA,'
      '    BOL.KOEF'
      'FROM'
      '    BOL_KOE BOL'
      ' WHERE '
      '    BOL.SHIFRID = :OLD_SHIFRID'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    BOL.DATEB,'
      '    BOL.DATEZA,'
      '    BOL.KOEF,'
      '    BOL.SHIFRID'
      ''
      'FROM'
      '    BOL_KOE BOL'
      'WHERE'
      '    BOL.MODE=1'
      'order by 1 desc,2 desc')
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionSalWrite
    AutoCommit = True
    Left = 120
    Top = 120
    object pFIBDataSetBolKoeDATEB: TFIBDateField
      FieldName = 'DATEB'
      Origin = 'BOL_KOE.DATEB'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object pFIBDataSetBolKoeDATEZA: TFIBDateField
      FieldName = 'DATEZA'
      Origin = 'BOL_KOE.DATEZA'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object pFIBDataSetBolKoeKOEF: TFIBBCDField
      FieldName = 'KOEF'
      Origin = 'BOL_KOE.KOEF'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetBolKoeSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
  end
  object pFIBTransactionSalWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 160
    Top = 120
  end
  object pFIBDataSetOtpKoe: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE BOL_KOE'
      'SET '
      '    DATEB  = :DATEB,'
      '    DATEZA = :DATEZA,'
      '    KOEF   = :KOEF'
      'WHERE'
      '    SHIFRID = :OLD_SHIFRID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    BOL_KOE'
      'WHERE'
      '        SHIFRID = :OLD_SHIFRID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO BOL_KOE('
      '    DATEB,'
      '    DATEZA,'
      '    KOEF,'
      '    MODE,'
      '    SHIFRKAT'
      ')'
      'VALUES('
      '    :DATEB,'
      '    :DATEZA,'
      '    :KOEF,'
      '    2,'
      '    1   '
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    DATEB,'
      '    DATEZA,'
      '    KOEF,'
      '    SHIFRID'
      'FROM'
      '    BOL_KOE '
      'WHERE'
      '    BOL_KOE.SHIFRID = :OLD_SHIFRID'
      '     '
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    BOL.DATEB,'
      '    BOL.DATEZA,'
      '    BOL.KOEF,'
      '    BOL.SHIFRID'
      'FROM'
      '    BOL_KOE BOL'
      'WHERE'
      '    BOL.MODE=2'
      'ORDER BY 1 DESC, 2 DESC ')
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionSalWrite
    AutoCommit = True
    Left = 124
    Top = 159
    object pFIBDataSetOtpKoeDATEB: TFIBDateField
      FieldName = 'DATEB'
    end
    object pFIBDataSetOtpKoeDATEZA: TFIBDateField
      FieldName = 'DATEZA'
    end
    object pFIBDataSetOtpKoeKOEF: TFIBBCDField
      FieldName = 'KOEF'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetOtpKoeSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
  end
  object DataSourceOtpKoe: TDataSource
    DataSet = pFIBDataSetOtpKoe
    Left = 84
    Top = 159
  end
end
