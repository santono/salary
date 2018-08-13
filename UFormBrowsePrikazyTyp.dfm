object FormBrowsePrikazyTyp: TFormBrowsePrikazyTyp
  Left = 254
  Top = 162
  Width = 696
  Height = 480
  Caption = #1058#1080#1087#1099' '#1087#1088#1080#1082#1072#1079#1086#1074
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
    442)
  PixelsPerInch = 96
  TextHeight = 20
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 416
    Width = 240
    Height = 25
    DataSource = dsoPriType
    Anchors = [akLeft, akBottom]
    TabOrder = 0
    OnClick = DBNavigator1Click
  end
  object dxDBGridPriType: TdxDBGrid
    Left = 8
    Top = 0
    Width = 665
    Height = 409
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'ID'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 1
    DataSource = dsoPriType
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridPriTypeID: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 85
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ID'
    end
    object dxDBGridPriTypeNAME: TdxDBGridMaskColumn
      Width = 99
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
    object dxDBGridPriTypeCONTENT: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 477
      BandIndex = 0
      RowIndex = 0
      FieldName = 'CONTENT'
    end
  end
  object dsoPriType: TDataSource
    DataSet = dsPriType
    Left = 128
    Top = 8
  end
  object dsPriType: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_PRIKAZY_TYP'
      'SET '
      ' NAME = :NAME,'
      ' CONTENT = :CONTENT'
      'WHERE'
      ' ID = :OLD_ID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_PRIKAZY_TYP'
      'WHERE'
      '  ID = :OLD_ID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_PRIKAZY_TYP('
      ' NAME,'
      ' CONTENT'
      ')'
      'VALUES('
      ' :NAME,'
      ' :CONTENT'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' ID,'
      ' NAME,'
      ' CONTENT'
      'FROM'
      ' TB_PRIKAZY_TYP '
      ''
      ' WHERE '
      '  TB_PRIKAZY_TYP.ID = :OLD_ID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' ID,'
      ' NAME,'
      ' CONTENT'
      'FROM'
      ' TB_PRIKAZY_TYP '
      'ORDER BY ID')
    AutoUpdateOptions.UpdateTableName = 'TB_PRIKAZY_TYP'
    AutoUpdateOptions.KeyFields = 'ID'
    AutoUpdateOptions.GeneratorName = 'G_PRIKAZY_TYP'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 16
    Top = 8
    object dsPriTypeID: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID'
    end
    object dsPriTypeNAME: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object dsPriTypeCONTENT: TFIBStringField
      DisplayLabel = #1064#1072#1073#1083#1086#1085' '#1090#1077#1082#1089#1090#1072' '#1087#1088#1080#1082#1072#1079#1072
      FieldName = 'CONTENT'
      Size = 1024
      EmptyStrToNull = True
    end
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 56
    Top = 8
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 96
    Top = 8
  end
end
