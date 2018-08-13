object FormEditDayClock: TFormEditDayClock
  Left = 326
  Top = 184
  Width = 487
  Height = 480
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1085#1086#1088#1084#1072#1090#1080#1074#1085#1099#1093' '#1076#1085#1077#1081' '#1080' '#1095#1072#1089#1086#1074
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
    479
    433)
  PixelsPerInch = 96
  TextHeight = 13
  object dxDBGridDC: TdxDBGrid
    Left = 8
    Top = 8
    Width = 457
    Height = 369
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRIDYM'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = DataSourceDC
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridDCYEARZA: TdxDBGridSpinColumn
      HeaderAlignment = taCenter
      Width = 39
      BandIndex = 0
      RowIndex = 0
      FieldName = 'YEARZA'
    end
    object dxDBGridDCMONTHZA: TdxDBGridSpinColumn
      Caption = #1052#1077#1089#1103#1094
      HeaderAlignment = taCenter
      Width = 57
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MONTHZA'
    end
    object dxDBGridDCMonthName: TdxDBGridColumn
      Caption = #1052#1077#1089#1103#1094
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'monthName'
    end
    object dxDBGridDCWDAYS: TdxDBGridSpinColumn
      Caption = #1056#1072#1073'. '#1076#1085#1077#1081
      HeaderAlignment = taCenter
      Width = 88
      BandIndex = 0
      RowIndex = 0
      FieldName = 'WDAYS'
    end
    object dxDBGridDCCLOCKS: TdxDBGridCalcColumn
      Caption = #1056#1072#1073'.'#1095#1072#1089#1086#1074
      HeaderAlignment = taCenter
      Width = 133
      BandIndex = 0
      RowIndex = 0
      FieldName = 'CLOCKS'
    end
    object dxDBGridDCSHIFRIDYM: TdxDBGridMaskColumn
      Visible = False
      Width = 111
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRIDYM'
    end
    object dxDBGridDCWDaysCol: TdxDBGridSpinColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'WDAYSCOLEDG'
    end
    object dxDBGridDCWClocksCol: TdxDBGridCalcColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'WCLOCKSCOLEDG'
    end
  end
  object DBNavigatorDC: TDBNavigator
    Left = 8
    Top = 376
    Width = 240
    Height = 25
    DataSource = DataSourceDC
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object DataSourceDC: TDataSource
    DataSet = pFIBDataSetDC
    Left = 32
    Top = 48
  end
  object pFIBDataSetDC: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_DAYS'
      'SET '
      ' YEARZA        = :YEARZA,'
      ' MONTHZA       = :MONTHZA,'
      ' WDAYS         = :WDAYS,'
      ' CLOCKS        = :CLOCKS,'
      ' WDAYSCOLEDG   = :WDAYSCOLEDG,'
      ' WCLOCKSCOLEDG = :WCLOCKSCOLEDG'
      'WHERE'
      ' SHIFRIDYM = :OLD_SHIFRIDYM'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_DAYS'
      'WHERE'
      '  SHIFRIDYM = :OLD_SHIFRIDYM'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_DAYS('
      ' YEARZA,'
      ' MONTHZA,'
      ' WDAYS,'
      ' CLOCKS,'
      ' WDAYSCOLEDG,'
      ' WCLOCKSCOLEDG, '
      ' SHIFRIDYM '
      ')'
      'VALUES('
      ' :YEARZA,'
      ' :MONTHZA,'
      ' :WDAYS,'
      ' :CLOCKS,'
      ' :WDAYSCOLEDG,'
      ' :WCLOCKSCOLEDG, '
      ' :YEARZA*12+:MONTHZA'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' YEARZA  ,'
      ' MONTHZA ,'
      ' WDAYS   ,'
      ' CLOCKS  ,'
      ' WDAYSCOLEDG,'
      ' WCLOCKSCOLEDG,'
      ' SHIFRIDYM'
      'FROM'
      ' TB_DAYS '
      ''
      ' WHERE '
      '  TB_DAYS.SHIFRIDYM = :OLD_SHIFRIDYM'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' YEARZA  ,'
      ' MONTHZA ,'
      ' WDAYS   ,'
      ' CLOCKS  ,'
      ' SHIFRIDYM,'
      ' WDAYSCOLEDG,'
      ' WCLOCKSCOLEDG '
      'FROM'
      ' TB_DAYS '
      'ORDER BY'
      '  SHIFRIDYM desc')
    BeforeInsert = pFIBDataSetDCBeforeInsert
    OnCalcFields = pFIBDataSetDCCalcFields
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 72
    Top = 48
    object pFIBDataSetDCYEARZA: TFIBSmallIntField
      DefaultExpression = '1990'
      DisplayLabel = #1043#1086#1076
      FieldName = 'YEARZA'
      MaxValue = 2020
    end
    object pFIBDataSetDCMONTHZA: TFIBSmallIntField
      DefaultExpression = '1'
      FieldName = 'MONTHZA'
      MaxValue = 12
    end
    object pFIBDataSetDCWDAYS: TFIBSmallIntField
      FieldName = 'WDAYS'
      MaxValue = 31
    end
    object pFIBDataSetDCCLOCKS: TFIBBCDField
      FieldName = 'CLOCKS'
      MaxValue = 800.000000000000000000
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetDCSHIFRIDYM: TFIBIntegerField
      FieldName = 'SHIFRIDYM'
    end
    object pFIBDataSetDCmonthName: TStringField
      FieldKind = fkCalculated
      FieldName = 'monthName'
      ReadOnly = True
      Size = 10
      Calculated = True
    end
    object pFIBDataSetDCWDAYSCOLEDG: TFIBSmallIntField
      DisplayLabel = #1056'.'#1076#1085'.'#1082'-'#1078
      FieldName = 'WDAYSCOLEDG'
    end
    object pFIBDataSetDCWCLOCKSCOLEDG: TFIBBCDField
      DisplayLabel = #1056'.'#1095#1072#1089#1086#1074'.'#1082'-'#1078
      FieldName = 'WCLOCKSCOLEDG'
      Size = 2
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
    Left = 112
    Top = 48
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 160
    Top = 48
  end
end
