object FormBrowseInd: TFormBrowseInd
  Left = 258
  Top = 188
  Width = 696
  Height = 480
  Caption = #1056#1072#1089#1095#1077#1090' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080' '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  DesignSize = (
    680
    442)
  PixelsPerInch = 96
  TextHeight = 20
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 400
    Width = 240
    Height = 25
    DataSource = dsInd
    Anchors = [akLeft, akBottom]
    TabOrder = 0
  end
  object DateTimePickerYM: TDateTimePicker
    Left = 264
    Top = 400
    Width = 153
    Height = 28
    Anchors = [akLeft, akBottom]
    Date = 41254.810760625000000000
    Format = 'MMMM yyyy'
    Time = 41254.810760625000000000
    DateFormat = dfLong
    DateMode = dmUpDown
    TabOrder = 1
    OnChange = DateTimePickerYMChange
  end
  object dxDBGridInd: TdxDBGrid
    Left = 8
    Top = 8
    Width = 673
    Height = 385
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 2
    OnDblClick = dxDBGridIndDblClick
    DataSource = dsInd
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridIndSHIFRID: TdxDBGridMaskColumn
      Visible = False
      Width = 93
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGridIndTABNO: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 40
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
    end
    object dxDBGridIndFIO: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 192
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
    object dxDBGridIndSHIFRPOD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 44
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRPOD'
    end
    object dxDBGridIndDOLG: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 190
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DOLG'
    end
    object dxDBGridIndDATABASEIND: TdxDBGridDateColumn
      Width = 40
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATABASEIND'
    end
    object dxDBGridIndSUMMAINDBUD: TdxDBGridCurrencyColumn
      Width = 40
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMAINDBUD'
      DisplayFormat = ',0.00;-,0.00'
      Nullable = False
    end
    object dxDBGridIndSUMMAINDVNE: TdxDBGridCurrencyColumn
      Width = 40
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMAINDVNE'
      DisplayFormat = ',0.00;-,0.00'
      Nullable = False
    end
    object dxDBGridIndMOVEDBUD: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 42
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MOVEDBUD'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridIndMOVEDVNE: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 41
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MOVEDVNE'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
  end
  object pFIBdsInd: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' TABNO,'
      ' FIO,'
      ' SHIFRPOD,'
      ' DOLG,'
      ' DATABASEIND,'
      ' SUMMAINDBUD,'
      ' SUMMAINDVNE,'
      ' MOVEDBUD,'
      ' MOVEDVNE  '
      'FROM'
      ' TB_IND_CALC_12_7 '
      'where yearza=:yearza and monthza=:monthza')
    Transaction = FIB.pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    Left = 56
    Top = 48
    object pFIBdsIndSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      Visible = False
    end
    object pFIBdsIndTABNO: TFIBIntegerField
      DisplayLabel = #1058'.'#1085'.'
      FieldName = 'TABNO'
    end
    object pFIBdsIndFIO: TFIBStringField
      DisplayLabel = #1060#1048#1054
      FieldName = 'FIO'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBdsIndSHIFRPOD: TFIBSmallIntField
      DisplayLabel = #1055#1076#1088'.'
      FieldName = 'SHIFRPOD'
    end
    object pFIBdsIndDOLG: TFIBStringField
      DisplayLabel = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      FieldName = 'DOLG'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBdsIndDATABASEIND: TFIBDateField
      DisplayLabel = #1041'.'#1076#1072#1090#1072
      FieldName = 'DATABASEIND'
    end
    object pFIBdsIndSUMMAINDBUD: TFIBBCDField
      DisplayLabel = #1041#1102#1076#1078#1077#1090
      FieldName = 'SUMMAINDBUD'
      DisplayFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsIndSUMMAINDVNE: TFIBBCDField
      DisplayLabel = #1042#1085#1077#1041#1102#1076#1078
      FieldName = 'SUMMAINDVNE'
      DisplayFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsIndMOVEDBUD: TFIBSmallIntField
      DisplayLabel = #1055'.'#1073'.'
      FieldName = 'MOVEDBUD'
    end
    object pFIBdsIndMOVEDVNE: TFIBSmallIntField
      DisplayLabel = #1055'.'#1074'.'
      FieldName = 'MOVEDVNE'
    end
  end
  object pFIBtrRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'isc_tpb_nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 96
    Top = 48
  end
  object dsInd: TDataSource
    DataSet = pFIBdsInd
    Left = 136
    Top = 48
  end
end
