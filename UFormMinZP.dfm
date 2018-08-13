object FormMinZP: TFormMinZP
  Left = 226
  Top = 200
  Width = 696
  Height = 480
  Caption = 'FormMinZP'
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
    Top = 400
    Width = 240
    Height = 25
    DataSource = dsoMinZP
    Anchors = [akLeft, akBottom]
    TabOrder = 0
  end
  object dxDBGridMZ: TdxDBGrid
    Left = 8
    Top = 32
    Width = 665
    Height = 369
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'ID'
    ShowSummaryFooter = True
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 1
    DataSource = dsoMinZP
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridMZID: TdxDBGridMaskColumn
      Visible = False
      Width = 22
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ID'
    end
    object dxDBGridMZTABNO: TdxDBGridMaskColumn
      Caption = #1058'.'#1085'.'
      HeaderAlignment = taCenter
      Width = 44
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
    end
    object dxDBGridMZFIO: TdxDBGridMaskColumn
      Caption = #1055#1030#1041
      HeaderAlignment = taCenter
      Width = 207
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
    object dxDBGridMZYEAR_ZA: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 30
      BandIndex = 0
      RowIndex = 0
      FieldName = 'YEAR_ZA'
    end
    object dxDBGridMZMONTH_ZA: TdxDBGridMaskColumn
      Caption = #1052#1094
      HeaderAlignment = taCenter
      Width = 30
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MONTH_ZA'
    end
    object dxDBGridMZSUMMA: TdxDBGridCurrencyColumn
      Caption = #1057#1091#1084#1072
      HeaderAlignment = taCenter
      Width = 86
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMA'
      SummaryFooterType = cstSum
      DisplayFormat = ',0.00;-,0.00'
      Nullable = False
    end
    object dxDBGridMZSUMMA_DB: TdxDBGridCurrencyColumn
      Caption = #1047' '#1041#1044
      HeaderAlignment = taCenter
      Width = 89
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMA_DB'
      SummaryFooterType = cstSum
      DisplayFormat = ',0.00;-,0.00'
      Nullable = False
    end
    object dxDBGridMZSUMMA_RAZN: TdxDBGridCurrencyColumn
      Caption = #1056#1110#1079#1085'.'
      HeaderAlignment = taCenter
      Width = 93
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMA_RAZN'
      SummaryFooterType = cstSum
      DisplayFormat = ',0.00;-,0.00'
      Nullable = False
    end
    object dxDBGridMZWORKDAY: TdxDBGridMaskColumn
      Caption = #1044#1085
      HeaderAlignment = taCenter
      Sorted = csDown
      Width = 45
      BandIndex = 0
      RowIndex = 0
      FieldName = 'WORKDAY'
    end
    object dxDBGridMZKOEF: TdxDBGridCurrencyColumn
      Caption = #1057#1090
      HeaderAlignment = taCenter
      Width = 22
      BandIndex = 0
      RowIndex = 0
      FieldName = 'KOEF'
      DisplayFormat = ',0.00;-,0.00'
      Nullable = False
    end
    object dxDBGridMZChk: TdxDBGridCheckColumn
      Caption = #1053'.'#1091'.'
      HeaderAlignment = taCenter
      Width = 16
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NEED_NOT'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
  end
  object DateTimePicker1: TDateTimePicker
    Left = 16
    Top = 0
    Width = 153
    Height = 21
    Date = 42675.614230590280000000
    Time = 42675.614230590280000000
    DateFormat = dfLong
    TabOrder = 2
    OnChange = DateTimePicker1Change
  end
  object dsoMinZP: TDataSource
    DataSet = dsMinZP
    Left = 264
  end
  object dsMinZP: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_SV_LESS_MIN_ZP'
      'SET '
      ' TABNO = :TABNO,'
      ' YEAR_ZA = :YEAR_ZA,'
      ' MONTH_ZA = :MONTH_ZA,'
      ' SUMMA = :SUMMA,'
      ' SUMMA_DB = :SUMMA_DB,'
      ' SUMMA_RAZN = :SUMMA_RAZN,'
      ' WORKDAY = :WORKDAY,'
      ' KOEF = :KOEF,'
      ' FIO = :FIO,'
      ' NEED_NOT = :NEED_NOT'
      'WHERE'
      ' ID = :OLD_ID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_SV_LESS_MIN_ZP'
      'WHERE'
      '  ID = :OLD_ID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_SV_LESS_MIN_ZP('
      ' TABNO,'
      ' YEAR_ZA,'
      ' MONTH_ZA,'
      ' SUMMA,'
      ' SUMMA_DB,'
      ' SUMMA_RAZN,'
      ' WORKDAY,'
      ' KOEF,'
      ' FIO,'
      ' NEED_NOT'
      ')'
      'VALUES('
      ' :TABNO,'
      ' :YEAR_ZA,'
      ' :MONTH_ZA,'
      ' :SUMMA,'
      ' :SUMMA_DB,'
      ' :SUMMA_RAZN,'
      ' :WORKDAY,'
      ' :KOEF,'
      ' :FIO,'
      ' :NEED_NOT'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' ID,'
      ' TABNO,'
      ' YEAR_ZA,'
      ' MONTH_ZA,'
      ' SUMMA,'
      ' SUMMA_DB,'
      ' SUMMA_RAZN,'
      ' WORKDAY,'
      ' KOEF,'
      ' FIO,'
      ' NEED_NOT'
      'FROM'
      ' TB_SV_LESS_MIN_ZP '
      'WHERE '
      ' TB_SV_LESS_MIN_ZP.ID = :OLD_ID'
      '  '
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' ID,'
      ' TABNO,'
      ' YEAR_ZA,'
      ' MONTH_ZA,'
      ' SUMMA,'
      ' SUMMA_DB,'
      ' SUMMA_RAZN,'
      ' WORKDAY,'
      ' KOEF,'
      ' FIO,'
      ' NEED_NOT'
      'FROM'
      ' TB_SV_LESS_MIN_ZP '
      'WHERE Y=:Y'
      '  AND M=:M')
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 168
    object dsMinZPID: TFIBIntegerField
      FieldName = 'ID'
      Visible = False
    end
    object dsMinZPTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object dsMinZPYEAR_ZA: TFIBIntegerField
      DisplayLabel = #1056'.'
      FieldName = 'YEAR_ZA'
    end
    object dsMinZPMONTH_ZA: TFIBIntegerField
      FieldName = 'MONTH_ZA'
    end
    object dsMinZPSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object dsMinZPSUMMA_DB: TFIBBCDField
      FieldName = 'SUMMA_DB'
      Size = 2
      RoundByScale = True
    end
    object dsMinZPSUMMA_RAZN: TFIBBCDField
      FieldName = 'SUMMA_RAZN'
      Size = 2
      RoundByScale = True
    end
    object dsMinZPWORKDAY: TFIBIntegerField
      FieldName = 'WORKDAY'
    end
    object dsMinZPKOEF: TFIBBCDField
      FieldName = 'KOEF'
      Size = 2
      RoundByScale = True
    end
    object dsMinZPFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 50
      EmptyStrToNull = True
    end
    object dsMinZPNEED_NOT: TFIBSmallIntField
      FieldName = 'NEED_NOT'
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
    Left = 200
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 232
  end
end
