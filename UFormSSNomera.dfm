object FormSSNomera: TFormSSNomera
  Left = 226
  Top = 182
  Width = 696
  Height = 480
  Caption = #1053#1086#1084#1077#1088#1072' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074' '#1089#1086#1094'.'#1089#1090#1088#1072#1093#1072
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
  object dxDBGridSS: TdxDBGrid
    Left = 8
    Top = 8
    Width = 665
    Height = 401
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'TABNO'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = DataSourceSS
    Filter.Criteria = {00000000}
    OptionsBehavior = [edgoAutoSearch, edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridSSTABNO: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
    end
    object dxDBGridSSFIO: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
    object dxDBGridSSNAL_CODE: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAL_CODE'
    end
    object dxDBGridSSSWID_SS_SER: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SWID_SS_SER'
    end
    object dxDBGridSSSWID_SS_NOM: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SWID_SS_NOM'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 16
    Top = 408
    Width = 232
    Height = 25
    DataSource = DataSourceSS
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object pFIBDataSetSS: TpFIBDataSet
    UpdateRecordTypes = [cusUnmodified, cusModified]
    UpdateSQL.Strings = (
      'UPDATE KADRY'
      'SET '
      ' SWID_SS_SER = :SWID_SS_SER,'
      ' SWID_SS_NOM = :SWID_SS_NOM'
      'WHERE'
      ' TABNO = :OLD_TABNO'
      ' ')
    RefreshSQL.Strings = (
      'SELECT'
      ' TABNO,'
      ' FIO,'
      ' NAL_CODE,'
      ' SWID_SS_SER,'
      ' SWID_SS_NOM'
      'FROM'
      ' KADRY '
      ''
      ' WHERE '
      '  KADRY.TABNO = :OLD_TABNO'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' TABNO,'
      ' FIO,'
      ' NAL_CODE,'
      ' SWID_SS_SER,'
      ' SWID_SS_NOM'
      'FROM'
      ' KADRY ')
    AllowedUpdateKinds = [ukModify]
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 16
    Top = 8
    object pFIBDataSetSSTABNO: TFIBIntegerField
      DisplayLabel = #1058'.'#1085#1086#1084'.'
      FieldName = 'TABNO'
      ReadOnly = True
    end
    object pFIBDataSetSSFIO: TFIBStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048' '#1054
      FieldName = 'FIO'
      ReadOnly = True
      Size = 51
      EmptyStrToNull = True
    end
    object pFIBDataSetSSNAL_CODE: TFIBStringField
      DisplayLabel = #1048#1076'.'#1082#1086#1076
      FieldName = 'NAL_CODE'
      ReadOnly = True
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSetSSSWID_SS_SER: TFIBStringField
      DisplayLabel = #1057#1077#1088#1080#1103
      FieldName = 'SWID_SS_SER'
      Size = 6
      EmptyStrToNull = True
    end
    object pFIBDataSetSSSWID_SS_NOM: TFIBStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'SWID_SS_NOM'
      Size = 10
      EmptyStrToNull = True
    end
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
    Left = 56
    Top = 8
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 96
    Top = 8
  end
  object DataSourceSS: TDataSource
    DataSet = pFIBDataSetSS
    Left = 128
    Top = 8
  end
end
