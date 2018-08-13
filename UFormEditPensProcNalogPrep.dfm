object FormEditPensProcNalogPrep: TFormEditPensProcNalogPrep
  Left = 189
  Top = 215
  Width = 773
  Height = 480
  Caption = #1058#1072#1073#1083#1080#1094#1099' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1087#1077#1085#1089#1080#1086#1085#1085#1086#1075#1086' '#1085#1072#1083#1086#1075#1072' '#1087#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1077#1081
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
    765
    436)
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridHea: TdxDBGrid
    Left = 8
    Top = 8
    Width = 273
    Height = 417
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'ID'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = DataSourceHea
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akBottom]
    object dxDBGridHeaDATEFR: TdxDBGridDateColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATEFR'
    end
    object dxDBGridHeaLIMITPENS: TdxDBGridCalcColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'LIMITPENS'
    end
    object dxDBGridHeaID: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ID'
    end
  end
  object dxDBGridPr: TdxDBGrid
    Left = 288
    Top = 8
    Width = 465
    Height = 417
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 1
    DataSource = DataSourcePr
    Filter.Criteria = {00000000}
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridPrIDPENS: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'IDPENS'
    end
    object dxDBGridPrSUMMAADD: TdxDBGridCalcColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMAADD'
    end
    object dxDBGridPrSUMMAFR: TdxDBGridCalcColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMAFR'
    end
    object dxDBGridPrSUMMATO: TdxDBGridCalcColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMATO'
    end
    object dxDBGridPrPROCPENS: TdxDBGridCalcColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'PROCPENS'
    end
  end
  object pFIBDataSetHea: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE PENSHEA'
      'SET '
      ' DATEFR = :DATEFR,'
      ' LIMITPENS = :LIMITPENS'
      'WHERE'
      ' ID = :OLD_ID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' PENSHEA'
      'WHERE'
      '  ID = :OLD_ID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO PENSHEA('
      ' DATEFR,'
      ' LIMITPENS,'
      ' ID'
      ')'
      'VALUES('
      ' :DATEFR,'
      ' :LIMITPENS,'
      ' :ID'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' DATEFR,'
      ' LIMITPENS,'
      ' ID'
      'FROM'
      ' PENSHEA '
      ''
      ' WHERE '
      '  PENSHEA.ID = :OLD_ID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' DATEFR,'
      ' LIMITPENS,'
      ' ID'
      'FROM'
      ' PENSHEA ')
    AfterInsert = pFIBDataSetHeaAfterInsert
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    Left = 64
    Top = 48
    object pFIBDataSetHeaDATEFR: TFIBDateField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DATEFR'
    end
    object pFIBDataSetHeaLIMITPENS: TFIBBCDField
      DisplayLabel = #1051#1080#1084#1080#1090' '#1076#1083#1103' '#1087#1077#1085#1089' '#1085#1072#1083#1086#1075#1072
      FieldName = 'LIMITPENS'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetHeaID: TFIBSmallIntField
      FieldName = 'ID'
    end
  end
  object pFIBDataSetPr: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE PENSPR'
      'SET '
      ' IDPENS = :MAS_ID,'
      ' SUMMAADD = :SUMMAADD,'
      ' SUMMAFR = :SUMMAFR,'
      ' SUMMATO = :SUMMATO,'
      ' PROCPENS = :PROCPENS'
      'WHERE'
      ' IDPENS=:IDPENS AND SUMMAADD=:SUMMAADD'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' PENSPR'
      'WHERE'
      '   IDPENS=:IDPENS AND SUMMAADD=:SUMMAADD')
    InsertSQL.Strings = (
      'INSERT INTO PENSPR('
      ' IDPENS,'
      ' SUMMAADD,'
      ' SUMMAFR,'
      ' SUMMATO,'
      ' PROCPENS'
      ')'
      'VALUES('
      ' :MAS_ID,'
      ' :SUMMAADD,'
      ' :SUMMAFR,'
      ' :SUMMATO,'
      ' :PROCPENS'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' IDPENS,'
      ' SUMMAADD,'
      ' SUMMAFR,'
      ' SUMMATO,'
      ' PROCPENS'
      'FROM'
      ' PENSPR '
      'where '
      '  IDPENS=:MAS_ID AND'
      '  IDPENS=:IDPENS AND SUMMAADD=:SUMMAADD'
      '')
    SelectSQL.Strings = (
      'SELECT'
      ' IDPENS,'
      ' SUMMAADD,'
      ' SUMMAFR,'
      ' SUMMATO,'
      ' PROCPENS'
      'FROM'
      ' PENSPR '
      'where '
      '  IDPENS=:MAS_ID')
    Transaction = pFIBTransactionReadFr
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWritePr
    DataSource = DataSourceHea
    Left = 120
    Top = 48
    object pFIBDataSetPrIDPENS: TFIBIntegerField
      FieldName = 'IDPENS'
    end
    object pFIBDataSetPrSUMMAADD: TFIBBCDField
      DisplayLabel = #1053#1072#1095'. '#1089#1091#1084#1084#1072
      FieldName = 'SUMMAADD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetPrSUMMAFR: TFIBBCDField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1089
      FieldName = 'SUMMAFR'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetPrSUMMATO: TFIBBCDField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1076#1086
      FieldName = 'SUMMATO'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetPrPROCPENS: TFIBBCDField
      DisplayLabel = #1055#1088#1086#1094'.'#1087#1077#1085#1089'.'#1085#1072#1083'.'
      FieldName = 'PROCPENS'
      Size = 3
      RoundByScale = True
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
    Left = 176
    Top = 48
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 232
    Top = 48
  end
  object DataSourceHea: TDataSource
    DataSet = pFIBDataSetHea
    Left = 64
    Top = 88
  end
  object DataSourcePr: TDataSource
    DataSet = pFIBDataSetPr
    Left = 128
    Top = 88
  end
  object pFIBTransactionWritePr: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 176
    Top = 88
  end
  object pFIBTransactionReadFr: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 232
    Top = 88
  end
end
