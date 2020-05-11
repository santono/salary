object FormPrikazyBrowse: TFormPrikazyBrowse
  Left = 233
  Top = 129
  Width = 696
  Height = 480
  Caption = #1055#1088#1080#1082#1072#1079#1099
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
    Left = 16
    Top = 416
    Width = 240
    Height = 25
    DataSource = dsoPrikazy
    Anchors = [akLeft, akBottom]
    TabOrder = 0
    OnClick = DBNavigator1Click
  end
  object dxDBGridPrikazy: TdxDBGrid
    Left = 8
    Top = 16
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
    DataSource = dsoPrikazy
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridPrikazyID: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ID'
    end
    object dxDBGridPrikazyTABNO: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
    end
    object dxDBGridPrikazyDATAPRIK: TdxDBGridDateColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATAPRIK'
    end
    object dxDBGridPrikazyNOMERPRIK: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NOMERPRIK'
    end
    object dxDBGridPrikazyDATABEG: TdxDBGridDateColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATABEG'
    end
    object dxDBGridPrikazyDATAEND: TdxDBGridDateColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATAEND'
    end
    object dxDBGridPrikazyCONTENT: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'CONTENT'
    end
  end
  object BitBtn1: TBitBtn
    Left = 264
    Top = 416
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1055#1077#1095#1072#1090#1100
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object dsoPrikazy: TDataSource
    DataSet = dsPrikazy
    Left = 136
    Top = 8
  end
  object dsPrikazy: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_PRIKAZY'
      'SET '
      ' TABNO      = :TABNO,'
      ' DATAPRIK   = :DATAPRIK,'
      ' NOMERPRIK  = :NOMERPRIK,'
      ' DATABEG    = :DATABEG,'
      ' DATAEND    = :DATAEND,'
      ' CONTENT    = :CONTENT,'
      ' SHIFRIDTYP = :SHIFRIDTYP,'
      ' Y          = :Y,'
      ' M          = :M,'
      ' KODKP      = :KODKP,'
      ' KODZKPPTR  = :KODZKPPTR,'
      ' NAMEDOL    = :NAMEDOL,'
      ' IDCLASSIFICATOR=:IDCLASSIFIKATOR,'
      ' NAMEPROF   = :NAMEPROF  '
      ''
      'WHERE'
      ' ID = :OLD_ID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_PRIKAZY'
      'WHERE'
      '  ID = :OLD_ID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_PRIKAZY('
      ' TABNO,'
      ' DATAPRIK,'
      ' NOMERPRIK,'
      ' DATABEG,'
      ' DATAEND,'
      ' CONTENT,'
      ' SHIFRIDTYP,'
      ' Y,'
      ' M,'
      ' KODKP,'
      ' KODZKPPTR,'
      ' NAMEDOL,'
      ' IDCLASSIFICATOR,'
      ' NAMEPROF '
      ')'
      'VALUES('
      ' :TABNO,'
      ' :DATAPRIK,'
      ' :NOMERPRIK,'
      ' :DATABEG,'
      ' :DATAEND,'
      ' :CONTENT,'
      ' :SHIFRIDTYP,'
      ' :Y,'
      ' :M,'
      ' :KODKP,'
      ' :KODZKPPTR,'
      ' :NAMEDOL,'
      ' :IDCLASSIFICATOR,'
      ' :NAMEPROF '
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' ID,'
      ' TABNO,'
      ' DATAPRIK,'
      ' NOMERPRIK,'
      ' DATABEG,'
      ' DATAEND,'
      ' CONTENT,'
      ' SHIFRIDTYP,'
      ' Y,'
      ' M,'
      ' KODKP,'
      ' KODZKPPTR,'
      ' NAMEDOL,'
      ' IDCLASSIFICATOR,'
      ' NAMEPROF '
      'FROM'
      ' TB_PRIKAZY'
      'where  TB_PRIKAZY.ID = :OLD_ID'
      '  '
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' ID,'
      ' TABNO,'
      ' DATAPRIK,'
      ' NOMERPRIK,'
      ' DATABEG,'
      ' DATAEND,'
      ' CONTENT,'
      ' SHIFRIDTYP,'
      ' Y,'
      ' M,'
      ' KODKP,'
      ' KODZKPPTR,'
      ' NAMEDOL,'
      ' IDCLASSIFICATOR,'
      ' NAMEPROF,'
      ' KODKP_OLD,'
      ' KODZKPPTR_OLD,'
      ' NAMEDOL_OLD,'
      ' IDCLASSIFICATOR_OLD,'
      ' NAMEPROF_OLD'
      ' FROM'
      ' TB_PRIKAZY'
      'where tabno=:old_tabno'
      'order by dataprik desc')
    AutoUpdateOptions.UpdateTableName = 'TB_PRIKAZY'
    AutoUpdateOptions.KeyFields = 'ID'
    AutoUpdateOptions.GeneratorName = 'G_PRIKAZY'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 16
    Top = 8
    object dsPrikazyID: TFIBIntegerField
      FieldName = 'ID'
    end
    object dsPrikazyTABNO: TFIBIntegerField
      DisplayLabel = #1058'.'#1085'.'
      FieldName = 'TABNO'
    end
    object dsPrikazyDATAPRIK: TFIBDateField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1080#1082#1072#1079#1072
      FieldName = 'DATAPRIK'
    end
    object dsPrikazyNOMERPRIK: TFIBStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1087#1088#1080#1082#1072#1079#1072
      FieldName = 'NOMERPRIK'
      Size = 15
      EmptyStrToNull = True
    end
    object dsPrikazyDATABEG: TFIBDateField
      DisplayLabel = #1057
      FieldName = 'DATABEG'
    end
    object dsPrikazyDATAEND: TFIBDateField
      DisplayLabel = #1055#1086
      FieldName = 'DATAEND'
    end
    object dsPrikazyCONTENT: TFIBStringField
      DisplayLabel = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077
      FieldName = 'CONTENT'
      Size = 1024
      EmptyStrToNull = True
    end
    object dsPrikazySHIFRIDTYP: TFIBIntegerField
      FieldName = 'SHIFRIDTYP'
    end
    object dsPrikazyNameType: TStringField
      FieldKind = fkLookup
      FieldName = 'NameType'
      LookupDataSet = dsPriType
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'SHIFRIDTYP'
      Size = 50
      Lookup = True
    end
    object dsPrikazyY: TFIBSmallIntField
      FieldName = 'Y'
    end
    object dsPrikazyM: TFIBSmallIntField
      FieldName = 'M'
    end
    object dsPrikazyKODKP: TFIBStringField
      FieldName = 'KODKP'
      Size = 10
      EmptyStrToNull = True
    end
    object dsPrikazyKODZKPPTR: TFIBStringField
      FieldName = 'KODZKPPTR'
      Size = 10
      EmptyStrToNull = True
    end
    object dsPrikazyNAMEDOL: TFIBStringField
      FieldName = 'NAMEDOL'
      Size = 512
      EmptyStrToNull = True
    end
    object dsPrikazyIDCLASSIFICATOR: TFIBIntegerField
      FieldName = 'IDCLASSIFICATOR'
    end
    object dsPrikazyNAMEPROF: TFIBStringField
      FieldName = 'NAMEPROF'
      Size = 512
      EmptyStrToNull = True
    end
    object dsPrikazyKODKP_OLD: TFIBStringField
      FieldName = 'KODKP_OLD'
      Size = 10
      EmptyStrToNull = True
    end
    object dsPrikazyKODZKPPTR_OLD: TFIBStringField
      FieldName = 'KODZKPPTR_OLD'
      Size = 10
      EmptyStrToNull = True
    end
    object dsPrikazyNAMEDOL_OLD: TFIBStringField
      FieldName = 'NAMEDOL_OLD'
      Size = 512
      EmptyStrToNull = True
    end
    object dsPrikazyIDCLASSIFICATOR_OLD: TFIBIntegerField
      FieldName = 'IDCLASSIFICATOR_OLD'
    end
    object dsPrikazyNAMEPROF_OLD: TFIBStringField
      FieldName = 'NAMEPROF_OLD'
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
  object dsPriType: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' ID,'
      ' NAME,'
      ' CONTENT'
      'FROM'
      ' TB_PRIKAZY_TYP '
      'order by id')
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    Left = 168
    Top = 8
    object dsPriTypeID: TFIBIntegerField
      FieldName = 'ID'
    end
    object dsPriTypeNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object dsPriTypeCONTENT: TFIBStringField
      FieldName = 'CONTENT'
      Size = 1024
      EmptyStrToNull = True
    end
  end
  object dsoPriType: TDataSource
    DataSet = dsPriType
    Left = 200
    Top = 8
  end
  object frxReport1: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42141.615852442130000000
    ReportOptions.LastChange = 42141.641668923610000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    Left = 112
    Top = 72
    Datasets = <
      item
        DataSet = frxDBDatasetPrikazy
        DataSetName = 'frxDBDatasetPrikazy'
      end>
    Variables = <
      item
        Name = ' Person'
        Value = Null
      end
      item
        Name = 'tabno'
        Value = ''
      end
      item
        Name = 'fio'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      object MasterData1: TfrxMasterData
        Height = 18.897637795275590000
        Top = 162.519790000000000000
        Width = 793.701300000000000000
        DataSet = frxDBDatasetPrikazy
        DataSetName = 'frxDBDatasetPrikazy'
        RowCount = 0
        object Memo2: TfrxMemoView
          Width = 37.795300000000000000
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
            '[Line]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 37.795300000000000000
          Width = 56.692913390000000000
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
            '[frxDBDatasetPrikazy."NOMERPRIK"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 94.488250000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd.mm.yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDatasetPrikazy."DATAPRIK"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 170.078850000000000000
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
            
              '[IIF(YearOf(<frxDBDatasetPrikazy."DATABEG">)>1990,FormatDateTime' +
              '('#39'dd.mm.yyyy'#39',<frxDBDatasetPrikazy."DATABEG">),'#39' '#39')]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 245.669450000000000000
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
            
              '[IIF(YearOf(<frxDBDatasetPrikazy."DATAEND">)>1990,FormatDateTime' +
              '('#39'dd.mm.yyyy'#39',<frxDBDatasetPrikazy."DATAEND">),'#39' '#39')]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 321.260050000000000000
          Width = 472.441250000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDatasetPrikazy."CONTENT"]')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 793.701300000000000000
        object Memo1: TfrxMemoView
          Left = 222.992270000000000000
          Width = 343.937230000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1038#1056#1111#1056#1105#1057#1027#1056#1109#1056#1108' '#1056#1111#1057#1026#1056#1105#1056#1108#1056#176#1056#183#1056#1109#1056#1030' [tabno] [fio]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 37.795275590000000000
        Top = 64.252010000000000000
        Width = 793.701300000000000000
        object Memo8: TfrxMemoView
          Top = -0.000041496062992120
          Width = 37.795300000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211
            #1056#1111'.'#1056#1111'.')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 37.795300000000000000
          Top = 18.897637795275590000
          Width = 56.692950000000000000
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
            #1074#8222#8211)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 94.488250000000000000
          Top = 18.897637795275590000
          Width = 75.590600000000000000
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
            #1056#8221#1056#176#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 37.795300000000000000
          Top = -0.000041496062992120
          Width = 132.283550000000000000
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
            #1056#1119#1057#1026#1056#1105#1056#1108#1056#176#1056#183)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 170.078850000000000000
          Top = 18.897637795275590000
          Width = 75.590600000000000000
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
            #1057#1027)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 245.669450000000000000
          Top = 18.897637795275590000
          Width = 75.590600000000000000
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
            #1056#1111#1056#1109)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 170.078850000000000000
          Top = -0.000041496062992120
          Width = 151.181200000000000000
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
            #1056#1119#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' '#1056#1169#1056#181#1056#8470#1057#1027#1057#8218#1056#1030#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 321.260050000000000000
          Top = -0.000041496062992120
          Width = 472.441250000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#1109#1056#1169#1056#181#1057#1026#1056#182#1056#176#1056#1029#1056#1105#1056#181' '#1056#1111#1057#1026#1056#1105#1056#1108#1056#176#1056#183#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBDatasetPrikazy: TfrxDBDataset
    UserName = 'frxDBDatasetPrikazy'
    CloseDataSource = False
    DataSet = dsPrikazy
    Left = 152
    Top = 72
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
    Left = 192
    Top = 72
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
    Left = 224
    Top = 72
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    Left = 256
    Top = 72
  end
end
