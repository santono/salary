object FormBrowseNadbPlanoviy: TFormBrowseNadbPlanoviy
  Left = 177
  Top = 127
  Width = 870
  Height = 502
  Caption = 'FormBrowseNadbPlanoviy'
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
    854
    464)
  PixelsPerInch = 96
  TextHeight = 13
  object dxDBGrid1: TdxDBGrid
    Left = 24
    Top = 0
    Width = 841
    Height = 417
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'ID'
    ShowSummaryFooter = True
    SummaryGroups = <>
    SummarySeparator = ', '
    PopupMenu = PopupMenu1
    TabOrder = 0
    DataSource = dsoNadb
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    OnCustomDrawCell = dxDBGrid1CustomDrawCell
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGrid1ID: TdxDBGridMaskColumn
      Visible = False
      Width = 214
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ID'
    end
    object dxDBGrid1NPP: TdxDBGridMaskColumn
      Caption = #8470
      HeaderAlignment = taCenter
      Width = 40
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NPP'
    end
    object dxDBGrid1TABNO: TdxDBGridMaskColumn
      Caption = #1058#1072#1073'.'#1085#1086#1084'.'
      HeaderAlignment = taCenter
      Width = 78
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
    end
    object dxDBGrid1FIO: TdxDBGridMaskColumn
      Caption = #1060#1048#1054
      HeaderAlignment = taCenter
      Width = 303
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
    object dxDBGrid1DOLG: TdxDBGridMaskColumn
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      HeaderAlignment = taCenter
      Width = 159
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DOLG'
    end
    object dxDBGrid1PROC: TdxDBGridCurrencyColumn
      Caption = #1053#1072#1076#1073#1072#1074#1082#1072
      HeaderAlignment = taCenter
      Width = 105
      BandIndex = 0
      RowIndex = 0
      FieldName = 'PROC'
      DisplayFormat = '###'
      Nullable = False
    end
    object dxDBGrid1ProcSAl: TdxDBGridColumn
      Caption = '% '#1074' '#1079'.'#1087'.'
      Sorted = csUp
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'PROC_SAL'
    end
    object dxDBGrid1PROC_SAL_MARK: TdxDBGridColumn
      Caption = 'F4'
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'PROC_SAL_MARK'
    end
    object dxDBGrid1Oklad: TdxDBGridColumn
      Caption = #1054#1082#1083#1072#1076
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'OKLAD'
    end
    object dxDBGrid1SummaNadbRas: TdxDBGridColumn
      Caption = #1056#1072#1089#1095#1077#1090#1085#1072#1103
      HeaderAlignment = taCenter
      Width = 70
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMANADB_RAS'
      SummaryFooterType = cstSum
      SummaryFooterField = 'SUMMANADB_RAS'
      SummaryField = 'SUMMANADB_RAS'
    end
    object dxDBGrid1SummaNadbFakt: TdxDBGridColumn
      Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1072#1103
      HeaderAlignment = taCenter
      Width = 82
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMANADB_FAKT'
      SummaryFooterType = cstSum
      SummaryField = 'SUMMANADB_FAKT'
    end
    object dxDBGrid1WorkDay: TdxDBGridColumn
      Caption = #1056'.'#1076#1085'.'
      BandIndex = 0
      RowIndex = 0
      FieldName = 'WORKDAY'
    end
    object dxDBGrid1SummaNadbRazn: TdxDBGridColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMANADB_RAZN'
    end
    object dxDBGrid1Calc: TdxDBGridButtonColumn
      BandIndex = 0
      RowIndex = 0
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = dxDBGrid1CalcButtonClick
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 432
    Width = 232
    Height = 25
    DataSource = dsoNadb
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
    Anchors = [akLeft, akBottom]
    TabOrder = 1
    OnClick = DBNavigator1Click
  end
  object cbUniv: TCheckBox
    Left = 264
    Top = 440
    Width = 145
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = #1090#1086#1083#1100#1082#1086' '#1091#1085#1080#1074#1077#1088#1089#1080#1090#1077#1090
    TabOrder = 2
    OnClick = cbUnivClick
  end
  object dsNadb: TpFIBDataSet
    UpdateRecordTypes = [cusUnmodified, cusModified]
    UpdateSQL.Strings = (
      'UPDATE TB_NADB_PLANOVIY'
      'SET '
      ' PROC = :PROC,'
      ' TABNO = :TABNO'
      'WHERE'
      ' ID = :OLD_ID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_NADB_PLANOVIY'
      'WHERE'
      '  ID = :OLD_ID'
      ' ')
    RefreshSQL.Strings = (
      'SELECT'
      ' ID,'
      ' NPP,'
      ' FIO,'
      ' DOLG,'
      ' PROC,'
      ' PROC_SAL,'
      ' TABNO,'
      ' SHIFRPOD,        '
      ' RAZR,            '
      ' OKLAD,           '
      ' SUMMANADB_RAS,   '
      ' SUMMANADB_FAKT,  '
      ' WORKDAY,         '
      ' NOTNEED,'
      ' SUMMANADB_RAZN,'
      ' NADBINCN,'
      ' GUID           '
      ''
      'FROM'
      ' TB_NADB_PLANOVIY '
      'WHERE'
      '   TB_NADB_PLANOVIY.ID = :OLD_ID'
      '  '
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' ID,'
      ' NPP,'
      ' FIO,'
      ' DOLG,'
      ' PROC,'
      ' PROC_SAL,'
      ' TABNO,'
      ' SHIFRPOD,        '
      ' RAZR,            '
      ' OKLAD,           '
      ' SUMMANADB_RAS,   '
      ' SUMMANADB_FAKT,  '
      ' WORKDAY,         '
      ' NOTNEED,'
      ' SUMMANADB_RAZN,'
      ' NADBINCN,'
      ' GUID           '
      ''
      'FROM'
      ' TB_NADB_PLANOVIY '
      'WHERE'
      '   YEARZA=:YEARZA'
      'AND'
      '   MONTHZA=:MONTHZA'
      'ORDER BY FIO'
      '')
    OnCalcFields = Valueelds
    AllowedUpdateKinds = [ukModify]
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 152
    Top = 64
    object dsNadbID: TFIBIntegerField
      FieldName = 'ID'
    end
    object dsNadbNPP: TFIBIntegerField
      FieldName = 'NPP'
    end
    object dsNadbFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 50
      EmptyStrToNull = True
    end
    object dsNadbDOLG: TFIBStringField
      FieldName = 'DOLG'
      Size = 150
      EmptyStrToNull = True
    end
    object dsNadbPROC: TFIBBCDField
      FieldName = 'PROC'
      DisplayFormat = '###'
      Size = 2
      RoundByScale = True
    end
    object dsNadbTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object dsNadbSHIFRPOD: TFIBIntegerField
      FieldName = 'SHIFRPOD'
    end
    object dsNadbRAZR: TFIBIntegerField
      FieldName = 'RAZR'
    end
    object dsNadbOKLAD: TFIBBCDField
      FieldName = 'OKLAD'
      DisplayFormat = '#######.00'
      Size = 2
      RoundByScale = True
    end
    object dsNadbSUMMANADB_RAS: TFIBBCDField
      FieldName = 'SUMMANADB_RAS'
      DisplayFormat = '#######.00'
      Size = 2
      RoundByScale = True
    end
    object dsNadbSUMMANADB_FAKT: TFIBBCDField
      FieldName = 'SUMMANADB_FAKT'
      DisplayFormat = '########.00'
      Size = 2
      RoundByScale = True
    end
    object dsNadbWORKDAY: TFIBIntegerField
      FieldName = 'WORKDAY'
    end
    object dsNadbNOTNEED: TFIBIntegerField
      FieldName = 'NOTNEED'
    end
    object dsNadbPROC_SAL: TFIBBCDField
      FieldName = 'PROC_SAL'
      DisplayFormat = '###'
      Size = 2
      RoundByScale = True
    end
    object dsNadbSUMMANADB_RAZN: TFIBBCDField
      DisplayLabel = #1056#1072#1079#1085#1080#1094#1072
      FieldName = 'SUMMANADB_RAZN'
      DisplayFormat = '#######.00'
      Size = 2
      RoundByScale = True
    end
    object dsNadbNADBINCN: TFIBIntegerField
      FieldName = 'NADBINCN'
    end
    object dsNadbINCN: TStringField
      FieldKind = fkCalculated
      FieldName = 'INCN'
      Size = 2
      Calculated = True
    end
    object dsNadbPROC_SAL_MARK: TStringField
      FieldKind = fkCalculated
      FieldName = 'PROC_SAL_MARK'
      Size = 5
      Calculated = True
    end
    object dsNadbGUID: TFIBStringField
      FieldName = 'GUID'
      Size = 60
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
    Left = 192
    Top = 64
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 232
    Top = 64
  end
  object dsoNadb: TDataSource
    DataSet = dsNadb
    Left = 264
    Top = 64
  end
  object PopupMenu1: TPopupMenu
    Left = 304
    Top = 64
    object N1: TMenuItem
      Caption = '1. '#1048#1084#1087#1086#1088#1090' '#1087#1088#1080#1082#1072#1079#1072
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = '2. '#1042#1079#1103#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1080#1079' '#1079#1072#1088#1087#1083#1072#1090#1099
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = '3. '#1055#1077#1095#1072#1090#1100
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = '( '#1055#1086#1080#1089#1082' '#1090#1072#1073'. '#1085#1086#1084#1077#1088#1086#1074')'
      OnClick = N4Click
    end
  end
  object frxReport1: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43967.711492303240000000
    ReportOptions.LastChange = 43967.764336678240000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 432
    Top = 96
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo14: TfrxMemoView
          Left = 411.968770000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1109#1057#8218#1056#1109#1056#1108#1056#1109#1056#187' '#1056#1105#1056#1112#1056#1111#1056#1109#1057#1026#1057#8218#1056#176' '#1056#1029#1056#176#1056#1169#1056#177#1056#176#1056#1030#1056#1109#1056#1108)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 18.897637795275590000
        Top = 64.252010000000000000
        Width = 1046.929810000000000000
        object Memo15: TfrxMemoView
          Left = 3.779527560000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 41.574803150000000000
          Width = 188.976377952755900000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#152#1056#1115)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 230.551330000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 532.913730000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#8218'.'#1056#1029'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 608.504330000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '% '#1056#1111#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 684.094463780000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '% '#1056#183#1056#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 759.685014960000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176' '#1056#1119#1056#1115)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 854.173203940000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176' '#1056#183#1056#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 948.661392910000000000
          Width = 94.488188976377950000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#176#1056#183#1056#1029#1056#1105#1057#8224#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897637800000000000
        Top = 143.622140000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 41.574830000000000000
          Width = 188.976377950000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."FIO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 230.551330000000000000
          Width = 302.362204724409400000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."DOLG"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 532.913730000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."TABNO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 608.504330000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."PROC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 684.094930000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."PROC_SAL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 759.685530000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset1."SUMMANADB_RAS" #n%2,2f]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 854.173780000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset1."SUMMANADB_FAKT" #n%2,2n]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 948.662030000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset1."SUMMANADB_RAZN" #n%2,2n]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 18.897637795275590000
        Top = 222.992270000000000000
        Width = 1046.929810000000000000
        object Memo10: TfrxMemoView
          Left = 759.685530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."SUMMANADB_RAS">,MasterData1) #n%2,2f]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 854.173780000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."SUMMANADB_FAKT">,MasterData1) #n%2,2f]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 948.662030000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."SUMMANADB_RAZN">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 3.779530000000000000
          Width = 755.906000000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = dsNadb
    Left = 392
    Top = 96
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Background = False
    Creator = 'FastReport (http://www.fast-report.com)'
    HTMLTags = True
    Left = 472
    Top = 96
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 512
    Top = 96
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    Left = 552
    Top = 96
  end
  object frxSimpleTextExport1: TfrxSimpleTextExport
    UseFileCache = True
    ShowProgress = True
    Frames = False
    EmptyLines = False
    OEMCodepage = False
    Left = 584
    Top = 96
  end
  object frxTXTExport1: TfrxTXTExport
    UseFileCache = True
    ShowProgress = True
    ScaleWidth = 1.000000000000000000
    ScaleHeight = 1.000000000000000000
    Borders = False
    Pseudogrpahic = False
    PageBreaks = True
    OEMCodepage = False
    EmptyLines = False
    LeadSpaces = False
    PrintAfter = False
    PrinterDialog = True
    UseSavedProps = True
    Left = 624
    Top = 96
  end
end
