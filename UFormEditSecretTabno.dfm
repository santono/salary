object FormEditSecretTabno: TFormEditSecretTabno
  Left = 255
  Top = 193
  Width = 696
  Height = 480
  Caption = #1055#1088#1080#1074#1072#1090#1085#1099#1077' '#1088#1072#1073#1086#1090#1085#1080#1082#1080
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
    688
    436)
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGrid1: TdxDBGrid
    Left = 16
    Top = 8
    Width = 649
    Height = 385
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'TABNO'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = DataSourceST
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGrid1TABNO: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
    end
    object dxDBGrid1FIO: TdxDBGridLookupColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 16
    Top = 392
    Width = 240
    Height = 25
    DataSource = DataSourceST
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object DataSourceST: TDataSource
    DataSet = pFIBDataSetST
    Left = 120
    Top = 136
  end
  object pFIBDataSetST: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_SECRET_TABNO'
      'SET '
      '   tabno=:tabno'
      'WHERE'
      ' TABNO = :OLD_TABNO'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_SECRET_TABNO'
      'WHERE'
      '  TABNO = :OLD_TABNO'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_SECRET_TABNO('
      ' TABNO'
      ')'
      'VALUES('
      ' :TABNO'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' TABNO'
      'FROM'
      ' TB_SECRET_TABNO '
      ''
      ' WHERE '
      '  TB_SECRET_TABNO.TABNO = :OLD_TABNO'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' TABNO'
      'FROM'
      ' TB_SECRET_TABNO '
      'order by tabno')
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    Left = 72
    Top = 80
    object pFIBDataSetSTTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object pFIBDataSetSTFIO: TStringField
      FieldKind = fkLookup
      FieldName = 'FIO'
      LookupDataSet = pFIBDataSetKadry
      LookupKeyFields = 'TABNO'
      LookupResultField = 'FIO'
      KeyFields = 'TABNO'
      Size = 120
      Lookup = True
    end
  end
  object pFIBDataSetKadry: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' TABNO,'
      ' FIO'
      'FROM'
      ' KADRY '
      'order by tabno')
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    Left = 232
    Top = 80
    object pFIBDataSetKadryTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object pFIBDataSetKadryFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 51
      EmptyStrToNull = True
    end
  end
end
