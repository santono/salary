object FormTabnoSecret: TFormTabnoSecret
  Left = 244
  Top = 114
  Width = 725
  Height = 480
  Caption = #1057#1087#1080#1089#1086#1082' '#1089#1077#1082#1088#1077#1090#1085#1099#1093' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
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
  DesignSize = (
    717
    436)
  PixelsPerInch = 96
  TextHeight = 20
  object DBNavigator1: TDBNavigator
    Left = 16
    Top = 408
    Width = 240
    Height = 25
    DataSource = DataSource1
    Anchors = [akLeft, akBottom]
    TabOrder = 0
  end
  object dxDBGrid1: TdxDBGrid
    Left = 8
    Top = 8
    Width = 697
    Height = 401
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'FIO'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 1
    DataSource = DataSource1
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    object dxDBGrid1TABNO: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
    end
    object dxDBGrid1FIO: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
    object dxDBGrid1Column3: TdxDBGridButtonColumn
      BandIndex = 0
      RowIndex = 0
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = dxDBGrid1Column3ButtonClick
    end
  end
  object pFIBDataSetT: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_SECRET_TABNO'
      'SET '
      '    TABNO=:TABNO'
      'WHERE'
      '    TABNO = :OLD_TABNO'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TB_SECRET_TABNO'
      'WHERE'
      '        TABNO = :OLD_TABNO'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO TB_SECRET_TABNO('
      '    TABNO'
      ')'
      'VALUES('
      '    :TABNO'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    a.TABNO,'
      '    b.fio'
      'FROM'
      '    TB_SECRET_TABNO a join kadry b on a.tabno=b.tabno'
      ' WHERE '
      '        A.TABNO = :OLD_TABNO'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    a.TABNO,'
      '    b.fio'
      'FROM'
      '    TB_SECRET_TABNO a join kadry b on a.tabno=b.tabno')
    Transaction = pFIBTransaction1
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransaction2
    AutoCommit = True
    Left = 24
    Top = 80
    object pFIBDataSetTTABNO: TFIBIntegerField
      DisplayLabel = #1058' '#1085
      FieldName = 'TABNO'
    end
    object pFIBDataSetTFIO: TFIBStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048' '#1054
      FieldName = 'FIO'
      ReadOnly = True
      Size = 51
      EmptyStrToNull = True
    end
  end
  object DataSource1: TDataSource
    DataSet = pFIBDataSetT
    Left = 248
    Top = 80
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 64
    Top = 80
  end
  object pFIBTransaction2: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 128
    Top = 80
  end
end
