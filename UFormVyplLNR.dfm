object FormVyplLNR: TFormVyplLNR
  Left = 217
  Top = 159
  Width = 696
  Height = 480
  Caption = #1042#1099#1087#1083#1072#1090#1099
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
    680
    442)
  PixelsPerInch = 96
  TextHeight = 20
  object dtZA: TDateTimePicker
    Left = 8
    Top = 8
    Width = 186
    Height = 28
    Date = 42149.874894560180000000
    Time = 42149.874894560180000000
    DateFormat = dfLong
    TabOrder = 0
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 416
    Width = 240
    Height = 25
    DataSource = dsoVypl
    TabOrder = 1
    OnClick = DBNavigator1Click
  end
  object dxDBGrid1: TdxDBGrid
    Left = 8
    Top = 40
    Width = 665
    Height = 369
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'ID'
    SummaryGroups = <>
    SummarySeparator = ', '
    PopupMenu = pm1
    TabOrder = 2
    DataSource = dsoVypl
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGrid1ID: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ID'
    end
    object dxDBGrid1YZA: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'YZA'
    end
    object dxDBGrid1MZA: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MZA'
    end
    object dxDBGrid1YVY: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'YVY'
    end
    object dxDBGrid1MVY: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MVY'
    end
    object dxDBGrid1PROCENT: TdxDBGridCurrencyColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'PROCENT'
      Nullable = False
    end
    object dxDBGrid1COMMENT: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'COMMENT'
    end
    object dxDBGrid1NOMER: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NOMER'
    end
    object dxDBGrid1DATAVYPL: TdxDBGridDateColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATAVYPL'
    end
    object dxDBGrid1Summa: TdxDBGridColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMA'
    end
    object dxDBGrid1SummaVypl: TdxDBGridColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMAVYPL'
    end
    object dxDBGrid1SummaNeVypl: TdxDBGridColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMANEVYPL'
    end
    object dxDBGrid1IsUniv: TdxDBGridCheckColumn
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ISUNIVER'
      ValueChecked = '1'
      ValueUnchecked = '0'
      DisplayChecked = '1'
      DisplayUnChecked = '0'
    end
    object dxDBGrid1IsDebet: TdxDBGridCheckColumn
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ISDEBET'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
  end
  object BitBtn1: TBitBtn
    Left = 200
    Top = 8
    Width = 153
    Height = 25
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object dsVypl: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_VYPLATY_LNR'
      'SET '
      ' YZA         = :YZA,'
      ' MZA         = :MZA,'
      ' YVY         = :YVY,'
      ' MVY         = :MVY,'
      ' PROCENT     = :PROCENT,'
      ' COMMENT     = :COMMENT,'
      ' NOMER       = :NOMER,'
      ' DATAVYPL    = :DATAVYPL,'
      ' summa       = :SUMMA,'
      ' SUMMAVYPL   = :SUMMAVYPL,'
      ' SUMMANEVYPL = :SUMMANEVYPL,'
      ' isUniver    = :isUniver,'
      ' isDebet     = :isDebet'
      'WHERE'
      ' ID = :OLD_ID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_VYPLATY_LNR'
      'WHERE'
      '  ID = :OLD_ID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_VYPLATY_LNR('
      ' YZA,'
      ' MZA,'
      ' YVY,'
      ' MVY,'
      ' PROCENT,'
      ' COMMENT,'
      ' NOMER,'
      ' DATAVYPL,'
      ' summa,'
      ' summavypl,'
      ' summanevypl,'
      ' isUniver,'
      ' isDebet '
      ''
      ')'
      'VALUES('
      ' :YZA,'
      ' :MZA,'
      ' :YVY,'
      ' :MVY,'
      ' :PROCENT,'
      ' :COMMENT,'
      ' :NOMER,'
      ' :DATAVYPL, '
      ' :summa,'
      ' :summavypl,'
      ' :summanevypl,'
      ' :isUniver,'
      ' :isDebet '
      ''
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' ID,'
      ' YZA,'
      ' MZA,'
      ' YVY,'
      ' MVY,'
      ' PROCENT,'
      ' COMMENT,'
      ' NOMER,'
      ' DATAVYPL,'
      ' summa,'
      ' summavypl,'
      ' summanevypl,'
      ' isUniver,'
      ' isDebet '
      ''
      'FROM'
      ' TB_VYPLATY_LNR'
      'where'
      '  TB_VYPLATY_LNR.ID = :OLD_ID'
      '  '
      '   ')
    SelectSQL.Strings = (
      'SELECT'
      ' ID,'
      ' YZA,'
      ' MZA,'
      ' YVY,'
      ' MVY,'
      ' PROCENT,'
      ' COMMENT,'
      ' nomer,'
      ' datavypl,'
      ' summa,'
      ' summavypl,'
      ' summanevypl,'
      ' isUniver,'
      ' isDebet '
      'FROM'
      ' TB_VYPLATY_LNR'
      'where yza=:y'
      '  and mza=:m  ')
    AutoUpdateOptions.UpdateTableName = 'TB_VYPLATY_LNR'
    AutoUpdateOptions.KeyFields = 'ID'
    AutoUpdateOptions.GeneratorName = 'G_VYPL'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 200
    Top = 8
    object dsVyplID: TFIBIntegerField
      FieldName = 'ID'
    end
    object dsVyplYZA: TFIBSmallIntField
      DisplayLabel = #1043#1086#1076' '#1079#1072
      FieldName = 'YZA'
    end
    object dsVyplMZA: TFIBSmallIntField
      DisplayLabel = #1052'-'#1094' '#1079#1072
      FieldName = 'MZA'
    end
    object dsVyplYVY: TFIBSmallIntField
      DisplayLabel = #1043#1086#1076' '#1074
      FieldName = 'YVY'
    end
    object dsVyplMVY: TFIBSmallIntField
      DisplayLabel = #1052'-'#1094' '#1074
      FieldName = 'MVY'
    end
    object dsVyplPROCENT: TFIBBCDField
      DisplayLabel = '%'
      FieldName = 'PROCENT'
      Size = 4
      RoundByScale = True
    end
    object dsVyplCOMMENT: TFIBStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'COMMENT'
      Size = 50
      EmptyStrToNull = True
    end
    object dsVyplNOMER: TFIBSmallIntField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'NOMER'
    end
    object dsVyplDATAVYPL: TFIBDateField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1099#1087#1083'.'
      FieldName = 'DATAVYPL'
    end
    object dsVyplSUMMA: TFIBBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object dsVyplSUMMAVYPL: TFIBBCDField
      DisplayLabel = #1042#1099#1087#1083#1072#1095#1077#1085#1086
      FieldName = 'SUMMAVYPL'
      Size = 2
      RoundByScale = True
    end
    object dsVyplSUMMANEVYPL: TFIBBCDField
      DisplayLabel = #1053#1077' '#1074#1099#1087#1083#1072#1095#1077#1085#1086
      FieldName = 'SUMMANEVYPL'
      Size = 2
      RoundByScale = True
    end
    object dsVyplISUNIVER: TFIBSmallIntField
      DisplayLabel = #1059#1085#1080#1074
      FieldName = 'ISUNIVER'
    end
    object dsVyplISDEBET: TFIBSmallIntField
      DisplayLabel = #1044#1077#1073'-'#1050#1088#1077
      FieldName = 'ISDEBET'
      MaxValue = 1
    end
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 232
    Top = 8
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 264
    Top = 8
  end
  object dsoVypl: TDataSource
    DataSet = dsVypl
    Left = 296
    Top = 8
  end
  object pm1: TPopupMenu
    Left = 144
    Top = 112
    object mniG1: TMenuItem
      Caption = #1056#1072#1089#1095#1077#1090' '#1089#1091#1084#1084
    end
    object mniExcel1: TMenuItem
      Caption = #1048#1084#1087#1086#1088#1090' Excel'
      OnClick = mniExcel1Click
    end
  end
end
