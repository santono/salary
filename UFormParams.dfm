object FormParams: TFormParams
  Left = 206
  Top = 165
  Width = 696
  Height = 497
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '
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
    459)
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridParam: TdxDBGrid
    Left = 0
    Top = 0
    Width = 673
    Height = 434
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = dsoParams
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridParamSHIFRID: TdxDBGridMaskColumn
      Width = 35
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGridParamNAME: TdxDBGridMaskColumn
      Width = 223
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
    object dxDBGridParamCOMMENT: TdxDBGridMaskColumn
      Width = 207
      BandIndex = 0
      RowIndex = 0
      FieldName = 'COMMENT'
    end
    object dxDBGridParamDATEFR: TdxDBGridDateColumn
      Width = 130
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATEFR'
    end
    object dxDBGridParamCODEMES: TdxDBGridMaskColumn
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'CODEMES'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 432
    Width = 240
    Height = 25
    DataSource = dsoParams
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object dsParams: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_PARAM'
      'SET '
      ' NAME = :NAME,'
      ' COMMENT = :COMMENT,'
      ' DATEFR = :DATEFR,'
      ' CODEMES = :CODEMES'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_PARAM'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_PARAM('
      ' SHIFRID,'
      ' NAME,'
      ' COMMENT,'
      ' DATEFR,'
      ' CODEMES'
      ')'
      'VALUES('
      ' :SHIFRID,'
      ' :NAME,'
      ' :COMMENT,'
      ' :DATEFR,'
      ' :CODEMES'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' NAME,'
      ' COMMENT,'
      ' DATEFR,'
      ' CODEMES'
      'FROM'
      ' TB_PARAM '
      ''
      ' WHERE '
      '  TB_PARAM.SHIFRID = :OLD_SHIFRID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' NAME,'
      ' COMMENT,'
      ' DATEFR,'
      ' CODEMES'
      'FROM'
      ' TB_PARAM ')
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 32
    Top = 16
    object dsParamsSHIFRID: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'SHIFRID'
    end
    object dsParamsNAME: TFIBStringField
      DisplayLabel = #1047#1085#1072#1095#1077#1085#1080#1077
      FieldName = 'NAME'
      Size = 250
      EmptyStrToNull = True
    end
    object dsParamsCOMMENT: TFIBStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077
      FieldName = 'COMMENT'
      Size = 50
      EmptyStrToNull = True
    end
    object dsParamsDATEFR: TFIBDateField
      DisplayLabel = #1044#1077#1081#1089#1090#1074#1091#1077#1090' '#1089
      FieldName = 'DATEFR'
    end
    object dsParamsCODEMES: TFIBSmallIntField
      DisplayLabel = #1050#1086#1076' '#1087#1072#1088
      FieldName = 'CODEMES'
    end
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 72
    Top = 16
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
    Left = 112
    Top = 16
  end
  object dsoParams: TDataSource
    DataSet = dsParams
    Left = 144
    Top = 16
  end
end
