object FormDolg: TFormDolg
  Left = 211
  Top = 128
  Width = 765
  Height = 560
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1076#1086#1083#1078#1085#1086#1089#1090#1077#1081
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
    757
    516)
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridDolg: TdxDBGrid
    Left = 8
    Top = 8
    Width = 737
    Height = 473
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRDOL'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = DataSourceDolg
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akBottom]
    object dxDBGridDolgSHIFRDOL: TdxDBGridCalcColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRDOL'
    end
    object dxDBGridDolgNAME: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
    object dxDBGridDolgRAZR: TdxDBGridCalcColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'RAZR'
    end
    object dxDBGridDolgOKLAD: TdxDBGridCalcColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'OKLAD'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 480
    Width = 240
    Height = 25
    DataSource = DataSourceDolg
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object pFIBDataSetDolg: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_DOLG'
      'SET '
      ' NAME = :NAME,'
      ' RAZR = :RAZR,'
      ' OKLAD = :OKLAD'
      'WHERE'
      ' SHIFRDOL = :OLD_SHIFRDOL'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_DOLG'
      'WHERE'
      '  SHIFRDOL = :OLD_SHIFRDOL'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_DOLG('
      ' SHIFRDOL,'
      ' NAME,'
      ' RAZR,'
      ' OKLAD'
      ')'
      'VALUES('
      ' :SHIFRDOL,'
      ' :NAME,'
      ' :RAZR,'
      ' :OKLAD'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    SHIFRDOL ,'
      '    NAME ,'
      '    RAZR ,'
      '    OKLAD '
      'FROM TB_DOLG'
      ''
      ' WHERE '
      '  TB_DOLG.SHIFRDOL = :OLD_SHIFRDOL'
      ' ')
    SelectSQL.Strings = (
      'select'
      '    SHIFRDOL ,'
      '    NAME ,'
      '    RAZR ,'
      '    OKLAD '
      'FROM TB_DOLG'
      'ORDER BY SHIFRDOL')
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 96
    Top = 120
    object pFIBDataSetDolgSHIFRDOL: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'SHIFRDOL'
    end
    object pFIBDataSetDolgNAME: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBDataSetDolgRAZR: TFIBIntegerField
      DisplayLabel = #1056#1072#1079#1088#1103#1076
      FieldName = 'RAZR'
    end
    object pFIBDataSetDolgOKLAD: TFIBBCDField
      DisplayLabel = #1054#1082#1083#1072#1076
      FieldName = 'OKLAD'
      Size = 2
      RoundByScale = True
    end
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 96
    Top = 168
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
    Left = 96
    Top = 208
  end
  object DataSourceDolg: TDataSource
    DataSet = pFIBDataSetDolg
    Left = 144
    Top = 128
  end
end
