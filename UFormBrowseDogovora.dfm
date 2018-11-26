object FormBrowseDogovora: TFormBrowseDogovora
  Left = 192
  Top = 124
  Width = 696
  Height = 480
  Caption = #1057#1087#1080#1089#1086#1082' '#1076#1086#1075#1086#1074#1086#1088#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    680
    442)
  PixelsPerInch = 96
  TextHeight = 13
  object dxDBGridDogovora: TdxDBGrid
    Left = 8
    Top = 8
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
    TabOrder = 0
    DataSource = dsoDogovora
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridDogovoraID: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ID'
    end
    object dxDBGridDogovoraNOMER: TdxDBGridMaskColumn
      Caption = #1053#1086#1084#1077#1088
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NOMER'
    end
    object dxDBGridDogovoraDATEFR: TdxDBGridDateColumn
      Caption = #1044#1072#1090#1072' '#1079#1072#1082#1083'.'
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATEFR'
    end
    object dxDBGridDogovoraDATETO: TdxDBGridDateColumn
      Caption = #1044#1072#1090#1072' '#1086#1082'.'
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATETO'
    end
    object dxDBGridDogovoraNAME: TdxDBGridMaskColumn
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
    object dxDBGridDogovoraREASONOK: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'REASONOK'
    end
    object dxDBGridDogovoraButton: TdxDBGridButtonColumn
      Caption = #1056#1072#1073#1086#1090#1085#1080#1082#1080
      BandIndex = 0
      RowIndex = 0
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = dxDBGridDogovoraButtonButtonClick
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 416
    Width = 240
    Height = 25
    DataSource = dsoDogovora
    Anchors = [akLeft, akBottom]
    TabOrder = 1
    OnClick = DBNavigator1Click
  end
  object dsoDogovora: TDataSource
    DataSet = dsDogovora
    Left = 136
    Top = 8
  end
  object dsDogovora: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_DOGOVORA_GN'
      'SET '
      ' DATEFR = :DATEFR,'
      ' DATETO = :DATETO,'
      ' NAME = :NAME,'
      ' NOMER = :NOMER,'
      ' REASONOK = :REASONOK'
      'WHERE'
      ' ID = :OLD_ID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_DOGOVORA_GN'
      'WHERE'
      '  ID = :OLD_ID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_DOGOVORA_GN('
      ' ID,'
      ' DATEFR,'
      ' DATETO,'
      ' NAME,'
      ' NOMER,'
      ' REASONOK'
      ')'
      'VALUES('
      ' :ID,'
      ' :DATEFR,'
      ' :DATETO,'
      ' :NAME,'
      ' :NOMER,'
      ' :REASONOK'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' ID,'
      ' DATEFR,'
      ' DATETO,'
      ' NAME,'
      ' NOMER,'
      ' REASONOK'
      'FROM'
      ' TB_DOGOVORA_GN '
      ''
      ' WHERE '
      '  TB_DOGOVORA_GN.ID = :OLD_ID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' ID,'
      ' DATEFR,'
      ' DATETO,'
      ' NAME,'
      ' NOMER,'
      ' REASONOK'
      'FROM'
      ' TB_DOGOVORA_GN ')
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 16
    Top = 8
    object dsDogovoraID: TFIBIntegerField
      FieldName = 'ID'
    end
    object dsDogovoraDATEFR: TFIBDateField
      FieldName = 'DATEFR'
    end
    object dsDogovoraDATETO: TFIBDateField
      FieldName = 'DATETO'
    end
    object dsDogovoraNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 512
      EmptyStrToNull = True
    end
    object dsDogovoraNOMER: TFIBStringField
      FieldName = 'NOMER'
      Size = 64
      EmptyStrToNull = True
    end
    object dsDogovoraREASONOK: TFIBStringField
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
