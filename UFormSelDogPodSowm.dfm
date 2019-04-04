object FormSelDogPodSowm: TFormSelDogPodSowm
  Left = 192
  Top = 124
  Width = 696
  Height = 480
  Caption = 'FormSelDogPodSowm'
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
    Top = 408
    Width = 224
    Height = 25
    DataSource = dsoWorkersDog
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel, nbRefresh]
    Anchors = [akLeft, akBottom]
    TabOrder = 0
    OnClick = DBNavigator1Click
  end
  object dxDBGridWorkerDogs: TdxDBGrid
    Left = 8
    Top = 8
    Width = 665
    Height = 385
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'ID'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 1
    OnDblClick = dxDBGridWorkerDogsDblClick
    DataSource = dsoWorkersDog
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridWorkerDogsID: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ID'
    end
    object dxDBGridWorkerDogsIDDOG: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'IDDOG'
    end
    object dxDBGridWorkerDogsTABNO: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
    end
    object dxDBGridWorkerDogsFIO: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
    object dxDBGridWorkerDogsDATEFR: TdxDBGridDateColumn
      Caption = #1044#1072#1090#1072' '#1089
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATEFR'
    end
    object dxDBGridWorkerDogsDATETO: TdxDBGridDateColumn
      Caption = #1044#1072#1090#1072' '#1087#1086
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATETO'
    end
    object dxDBGridWorkerDogsNOMER: TdxDBGridMaskColumn
      Caption = #1053#1086#1084#1077#1088
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NOMER'
    end
    object dxDBGridWorkerDogsGUID: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'GUID'
    end
    object dxDBGridWorkerDogsREASONOK: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'REASONOK'
    end
    object dxDBGridWorkerDogsNOMERDOGGN: TdxDBGridMaskColumn
      Caption = #1053#1086#1084#1077#1088' '#1043#1053
      Sorted = csUp
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NOMERDOGGN'
    end
  end
  object BitBtn1: TBitBtn
    Left = 240
    Top = 408
    Width = 75
    Height = 25
    Caption = #1042#1099#1073#1088#1072#1090#1100
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object dsoWorkersDog: TDataSource
    DataSet = dsWorkerDogs
    Left = 104
    Top = 112
  end
  object dsWorkerDogs: TpFIBDataSet
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
      ' REASONOK,'
      
        ' (SELECT FIRST 1 NOMER FROM TB_DOGOVORA_GN WHERE TB_DOGOVORA_GN.' +
        'ID=IDDOG) NOMERDOGGN'
      ''
      'FROM'
      ' TB_DOGOVORA_GN_DET '
      'WHERE TABNO=:TABNO')
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    Left = 40
    Top = 112
    object dsWorkerDogsID: TFIBIntegerField
      FieldName = 'ID'
    end
    object dsWorkerDogsIDDOG: TFIBIntegerField
      FieldName = 'IDDOG'
    end
    object dsWorkerDogsTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object dsWorkerDogsFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 50
      EmptyStrToNull = True
    end
    object dsWorkerDogsDATEFR: TFIBDateField
      FieldName = 'DATEFR'
    end
    object dsWorkerDogsDATETO: TFIBDateField
      FieldName = 'DATETO'
    end
    object dsWorkerDogsNOMER: TFIBStringField
      FieldName = 'NOMER'
      Size = 10
      EmptyStrToNull = True
    end
    object dsWorkerDogsGUID: TFIBStringField
      FieldName = 'GUID'
      Size = 64
      EmptyStrToNull = True
    end
    object dsWorkerDogsREASONOK: TFIBStringField
      FieldName = 'REASONOK'
      Size = 512
      EmptyStrToNull = True
    end
    object dsWorkerDogsNOMERDOGGN: TFIBStringField
      FieldName = 'NOMERDOGGN'
      Size = 64
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
    Left = 72
    Top = 112
  end
end
