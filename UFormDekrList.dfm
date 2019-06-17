object FormDekrList: TFormDekrList
  Left = 274
  Top = 176
  Width = 696
  Height = 480
  Caption = #1057#1087#1080#1089#1086#1082' '#1076#1077#1082#1088#1077#1090#1085#1099#1093' '#1086#1090#1087#1091#1089#1082#1086#1074' '#1076#1083#1103' '#1092#1086#1088#1084#1099' 5 '#1045#1057#1042
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
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 416
    Width = 240
    Height = 25
    DataSource = dsoDekr
    Anchors = [akLeft, akBottom]
    TabOrder = 0
    OnClick = DBNavigator1Click
  end
  object grDekr: TdxDBGrid
    Left = 8
    Top = 8
    Width = 665
    Height = 401
    Bands = <
      item
      end
      item
        Caption = #1055#1088#1080#1082#1072#1079
      end
      item
        Caption = #1044#1072#1090#1080
      end>
    DefaultLayout = False
    HeaderPanelRowCount = 1
    KeyField = 'ID'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 1
    DataSource = dsoDekr
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoPartialLoad, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    ShowBands = True
    Anchors = [akLeft, akTop, akRight, akBottom]
    object grDekrID: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ID'
    end
    object grDekrTABNOButton: TdxDBGridButtonColumn
      Caption = #1058'.'#1085'.'
      HeaderAlignment = taCenter
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = grDekrTABNOButtonButtonClick
    end
    object grDekrTABNO: TdxDBGridMaskColumn
      Caption = #1058'.'#1085'.'
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
    end
    object grDekrINN: TdxDBGridMaskColumn
      Caption = 'I'#1053#1053
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'INN'
    end
    object grDekrFIO: TdxDBGridMaskColumn
      Caption = #1055'I'#1041
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
    object grDekrNOMER_PRIK: TdxDBGridMaskColumn
      Caption = #1053#1086#1084#1077#1088
      HeaderAlignment = taCenter
      BandIndex = 1
      RowIndex = 0
      FieldName = 'NOMER_PRIK'
    end
    object grDekrDATA_PRIK: TdxDBGridDateColumn
      Caption = #1044#1072#1090#1072
      HeaderAlignment = taCenter
      BandIndex = 1
      RowIndex = 0
      FieldName = 'DATA_PRIK'
    end
    object grDekrDATE_FR: TdxDBGridDateColumn
      Caption = #1047
      HeaderAlignment = taCenter
      BandIndex = 2
      RowIndex = 0
      FieldName = 'DATE_FR'
    end
    object grDekrDATE_TO: TdxDBGridDateColumn
      Caption = #1055#1086
      HeaderAlignment = taCenter
      BandIndex = 2
      RowIndex = 0
      FieldName = 'DATE_TO'
    end
    object grDekrNameD: TdxDBGridColumn
      Caption = #1058#1080#1087
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'nameK'
    end
  end
  object dsoDekr: TDataSource
    DataSet = dsDekr
    Left = 48
    Top = 24
  end
  object dsDekr: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_DEKR_ECB'
      'SET '
      ' TABNO = :TABNO,'
      ' INN = :INN,'
      ' FIO = :FIO,'
      ' NOMER_PRIK = :NOMER_PRIK,'
      ' DATA_PRIK = :DATA_PRIK,'
      ' DATE_FR = :DATE_FR,'
      ' DATE_TO = :DATE_TO,'
      ' KIND    = :KIND'
      'WHERE'
      ' ID = :OLD_ID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_DEKR_ECB'
      'WHERE'
      '  ID = :OLD_ID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_DEKR_ECB('
      ' ID,'
      ' TABNO,'
      ' INN,'
      ' FIO,'
      ' NOMER_PRIK,'
      ' DATA_PRIK,'
      ' DATE_FR,'
      ' DATE_TO,'
      ' KIND'
      ')'
      'VALUES('
      ' :ID,'
      ' :TABNO,'
      ' :INN,'
      ' :FIO,'
      ' :NOMER_PRIK,'
      ' :DATA_PRIK,'
      ' :DATE_FR,'
      ' :DATE_TO,'
      ' :KIND'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' ID,'
      ' TABNO,'
      ' INN,'
      ' FIO,'
      ' NOMER_PRIK,'
      ' DATA_PRIK,'
      ' DATE_FR,'
      ' DATE_TO,'
      ' KIND'
      'FROM'
      ' TB_DEKR_ECB '
      ''
      ' WHERE '
      '  TB_DEKR_ECB.ID = :OLD_ID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' ID,'
      ' TABNO,'
      ' INN,'
      ' FIO,'
      ' NOMER_PRIK,'
      ' DATA_PRIK,'
      ' DATE_FR,'
      ' DATE_TO,'
      ' kind'
      'FROM'
      ' TB_DEKR_ECB '
      'order by id')
    AutoUpdateOptions.UpdateTableName = 'TB_DEKR_ECB'
    AutoUpdateOptions.KeyFields = 'ID'
    OnCalcFields = dsDekrCalcFields
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 96
    Top = 24
    object dsDekrID: TFIBIntegerField
      FieldName = 'ID'
    end
    object dsDekrTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object dsDekrINN: TFIBStringField
      FieldName = 'INN'
      Size = 10
      EmptyStrToNull = True
    end
    object dsDekrFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 51
      EmptyStrToNull = True
    end
    object dsDekrNOMER_PRIK: TFIBStringField
      FieldName = 'NOMER_PRIK'
      Size = 10
      EmptyStrToNull = True
    end
    object dsDekrDATA_PRIK: TFIBDateField
      FieldName = 'DATA_PRIK'
    end
    object dsDekrDATE_FR: TFIBDateField
      FieldName = 'DATE_FR'
    end
    object dsDekrDATE_TO: TFIBDateField
      FieldName = 'DATE_TO'
    end
    object dsDekrKIND: TFIBSmallIntField
      DisplayLabel = #1058#1080#1087
      FieldName = 'KIND'
    end
    object dsDekrnameKind: TStringField
      FieldKind = fkLookup
      FieldName = 'nameKind'
      LookupDataSet = cdsKind
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'KIND'
      Size = 16
      Lookup = True
    end
    object dsDekrnameK: TStringField
      FieldKind = fkCalculated
      FieldName = 'nameK'
      Size = 16
      Calculated = True
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
    Left = 144
    Top = 24
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 176
    Top = 24
  end
  object cdsKind: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'name'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 88
    Top = 64
    Data = {
      3E0000009619E0BD0100000018000000020000000000030000003E0002696404
      00010000000000046E616D650100490000000100055749445448020002001400
      0000}
    object cdsKindid: TIntegerField
      FieldName = 'id'
    end
    object cdsKindname: TStringField
      FieldName = 'name'
    end
  end
  object dsoKind: TDataSource
    DataSet = cdsKind
    Left = 56
    Top = 64
  end
end
