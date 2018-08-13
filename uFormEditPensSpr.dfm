object FormEditPensSpr: TFormEditPensSpr
  Left = 225
  Top = 183
  Width = 696
  Height = 488
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1077#1085#1089#1080#1086#1085#1085#1099#1093' '#1089#1087#1088#1072#1074#1086#1082
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
    441)
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridPensSpr: TdxDBGrid
    Left = 8
    Top = 8
    Width = 665
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
    DataSource = DataSource1
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridPensSprTABNO: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
    end
    object dxDBGridPensSprFIO: TdxDBGridMaskColumn
      Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048' '#1054
      HeaderAlignment = taCenter
      Width = 354
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
    object dxDBGridPensSprDATAVY: TdxDBGridDateColumn
      Caption = #1042#1099#1076#1072#1085#1072
      HeaderAlignment = taCenter
      Width = 90
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATAVY'
      SaveTime = False
    end
    object dxDBGridPensSprFIOOP: TdxDBGridMaskColumn
      Caption = #1041#1091#1093#1075#1072#1083#1090#1077#1088
      HeaderAlignment = taCenter
      Width = 200
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIOOP'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 400
    Width = 240
    Height = 25
    DataSource = DataSource1
    Anchors = [akLeft, akBottom]
    TabOrder = 1
    OnClick = DBNavigator1Click
  end
  object pFIBDataSet1: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_PENSSPR_2007'
      'SET '
      '    TABNO  = :TABNO,'
      '    FIO    = :FIO,'
      '    DATAVY = :DATAVY'
      'WHERE'
      '    SHIFRID = :OLD_SHIFRID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TB_PENSSPR_2007'
      'WHERE'
      '        SHIFRID = :OLD_SHIFRID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO TB_PENSSPR_2007('
      '    TABNO,'
      '    FIO,'
      '    DATAVY,'
      '    ShifrId'
      ')'
      'VALUES('
      '    :TABNO,'
      '    :FIO,'
      '    :DATAVY,'
      '    :SHIFRID'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    SHIFRID,'
      '    TABNO,'
      '    FIO,'
      '    DATAVY,'
      '    b.fioop'
      'FROM'
      '    TB_PENSSPR_2007 a join operatory b on a.shifrwrk=b.shifrwrk'
      ' WHERE '
      '        A.SHIFRID = :OLD_SHIFRID'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    TABNO,'
      '    FIO,'
      '    DATAVY,'
      '    fioop,'
      '    SHIFRID'
      'FROM'
      '    PR_GETLIST_PENSSPR')
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseArc
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 16
    Top = 40
    oRefreshDeletedRecord = True
    object pFIBDataSet1TABNO: TFIBIntegerField
      DisplayLabel = #1058'.'#1085'.'
      FieldName = 'TABNO'
    end
    object pFIBDataSet1FIO: TFIBStringField
      FieldName = 'FIO'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBDataSet1DATAVY: TFIBDateTimeField
      FieldName = 'DATAVY'
    end
    object pFIBDataSet1FIOOP: TFIBStringField
      FieldName = 'FIOOP'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBDataSet1SHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
  end
  object pFIBTransactionRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseArc
    TimeoutAction = TARollback
    Left = 64
    Top = 40
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseArc
    TimeoutAction = TARollback
    Left = 96
    Top = 40
  end
  object DataSource1: TDataSource
    DataSet = pFIBDataSet1
    Left = 128
    Top = 40
  end
end
