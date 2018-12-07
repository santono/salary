object FormBrowseDogovoraDet: TFormBrowseDogovoraDet
  Left = 220
  Top = 126
  Width = 696
  Height = 480
  Caption = 'FormBrowseDogovoraDet'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  DesignSize = (
    680
    442)
  PixelsPerInch = 96
  TextHeight = 13
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 416
    Width = 240
    Height = 25
    DataSource = dsoDogovoraDet
    Anchors = [akLeft, akBottom]
    TabOrder = 0
    OnClick = DBNavigator1Click
  end
  object dxDBGridDogovoraDet: TdxDBGrid
    Left = 8
    Top = 8
    Width = 665
    Height = 401
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'ID'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 1
    DataSource = dsoDogovoraDet
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    object dxDBGridDogovoraDetID: TdxDBGridMaskColumn
      Visible = False
      Width = 46
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ID'
    end
    object dxDBGridDogovoraDetIDDOG: TdxDBGridMaskColumn
      Visible = False
      Width = 46
      BandIndex = 0
      RowIndex = 0
      FieldName = 'IDDOG'
    end
    object dxDBGridDogovoraDetTABNO: TdxDBGridMaskColumn
      Caption = #1058#1072#1073'.'#1085#1086#1084'.'
      HeaderAlignment = taCenter
      Width = 27
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
    end
    object dxDBGridDogovoraDetFIO: TdxDBGridMaskColumn
      Caption = #1060#1048#1054
      Width = 153
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
    object dxDBGridDogovoraDetDATEFR: TdxDBGridDateColumn
      Caption = #1044#1072#1090#1072' '#1089
      HeaderAlignment = taCenter
      Sorted = csDown
      Width = 63
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATEFR'
    end
    object dxDBGridDogovoraDetDATETO: TdxDBGridDateColumn
      Caption = #1044#1072#1090#1072' '#1087#1086
      HeaderAlignment = taCenter
      Width = 55
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATETO'
    end
    object dxDBGridDogovoraDetNOMER: TdxDBGridMaskColumn
      Visible = False
      Width = 46
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NOMER'
    end
    object dxDBGridDogovoraDetGUID: TdxDBGridMaskColumn
      Visible = False
      Width = 270
      BandIndex = 0
      RowIndex = 0
      FieldName = 'GUID'
    end
    object dxDBGridDogovoraDetREASONOK: TdxDBGridMaskColumn
      Caption = #1055#1088#1080#1095#1080#1085#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
      Width = 363
      BandIndex = 0
      RowIndex = 0
      FieldName = 'REASONOK'
    end
  end
  object dsoDogovoraDet: TDataSource
    DataSet = dsDogovoraDet
    Left = 160
    Top = 72
  end
  object dsDogovoraDet: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_DOGOVORA_GN_DET'
      'SET '
      ' IDDOG = :IDDOG,'
      ' TABNO = :TABNO,'
      ' FIO = :FIO,'
      ' DATEFR = :DATEFR,'
      ' DATETO = :DATETO,'
      ' NOMER = :NOMER,'
      ' GUID = :GUID,'
      ' REASONOK = :REASONOK'
      'WHERE'
      ' ID = :OLD_ID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_DOGOVORA_GN_DET'
      'WHERE'
      '  ID = :OLD_ID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_DOGOVORA_GN_DET('
      ' ID,'
      ' IDDOG,'
      ' TABNO,'
      ' FIO,'
      ' DATEFR,'
      ' DATETO,'
      ' NOMER,'
      ' GUID,'
      ' REASONOK'
      ')'
      'VALUES('
      ' :ID,'
      ' :IDDOG,'
      ' :TABNO,'
      ' :FIO,'
      ' :DATEFR,'
      ' :DATETO,'
      ' :NOMER,'
      ' :GUID,'
      ' :REASONOK'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' ID,'
      ' IDDOG,'
      ' TABNO,'
      ' FIO,'
      ' DATEFR,'
      ' DATETO,'
      ' NOMER,'
      ' GUID,'
      ' REASONOK'
      'FROM'
      ' TB_DOGOVORA_GN_DET '
      'where(  iddog=:iddog'
      '  ) and (  TB_DOGOVORA_GN_DET.ID = :OLD_ID'
      '  )'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' ID,'
      ' IDDOG,'
      ' TABNO,'
      ' FIO,'
      ' DATEFR,'
      ' DATETO,'
      ' NOMER,'
      ' GUID,'
      ' REASONOK'
      'FROM'
      ' TB_DOGOVORA_GN_DET '
      'where iddog=:iddog')
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 48
    Top = 72
    object dsDogovoraDetID: TFIBIntegerField
      FieldName = 'ID'
    end
    object dsDogovoraDetIDDOG: TFIBIntegerField
      FieldName = 'IDDOG'
    end
    object dsDogovoraDetTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object dsDogovoraDetFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 50
      EmptyStrToNull = True
    end
    object dsDogovoraDetDATEFR: TFIBDateField
      FieldName = 'DATEFR'
    end
    object dsDogovoraDetDATETO: TFIBDateField
      FieldName = 'DATETO'
    end
    object dsDogovoraDetNOMER: TFIBStringField
      FieldName = 'NOMER'
      Size = 10
      EmptyStrToNull = True
    end
    object dsDogovoraDetGUID: TFIBStringField
      FieldName = 'GUID'
      Size = 64
      EmptyStrToNull = True
    end
    object dsDogovoraDetREASONOK: TFIBStringField
      FieldName = 'REASONOK'
      Size = 512
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
    Left = 88
    Top = 72
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 128
    Top = 72
  end
end
