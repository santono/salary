object FormReeBolPr: TFormReeBolPr
  Left = 229
  Top = 188
  Width = 696
  Height = 480
  Caption = #1057#1087#1080#1089#1082' '#1073#1086#1083#1085'.'#1083#1080#1089#1090#1086#1074' '#1080#1079' '#1088#1077#1077#1089#1090#1088#1072
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
    688
    436)
  PixelsPerInch = 96
  TextHeight = 20
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 408
    Width = 240
    Height = 25
    DataSource = DataSourceRBPr
    Anchors = [akLeft, akBottom]
    TabOrder = 0
  end
  object dxDBGridRB: TdxDBGrid
    Left = 16
    Top = 0
    Width = 673
    Height = 401
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    ShowSummaryFooter = True
    SummaryGroups = <>
    SummarySeparator = ', '
    PopupMenu = PopupMenu1
    TabOrder = 1
    DataSource = DataSourceRBPr
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridRBSHIFRID: TdxDBGridMaskColumn
      Visible = False
      Width = 45
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGridRBNOMER_B: TdxDBGridMaskColumn
      Width = 34
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NOMER_B'
    end
    object dxDBGridRBFIO: TdxDBGridMaskColumn
      Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048' '#1054
      HeaderAlignment = taCenter
      Sorted = csUp
      Width = 114
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
    object dxDBGridRBF_DATA: TdxDBGridDateColumn
      Caption = 'c'
      HeaderAlignment = taCenter
      Width = 76
      BandIndex = 0
      RowIndex = 0
      FieldName = 'F_DATA'
    end
    object dxDBGridRBL_DATA: TdxDBGridDateColumn
      Caption = #1087#1086
      HeaderAlignment = taCenter
      Width = 59
      BandIndex = 0
      RowIndex = 0
      FieldName = 'L_DATA'
    end
    object dxDBGridRBSUMMA_B: TdxDBGridCalcColumn
      Caption = #1041#1086#1083#1100#1085#1080#1095#1085' '#1057#1057
      HeaderAlignment = taCenter
      Width = 59
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMA_B'
      SummaryFooterType = cstSum
      SummaryFooterField = 'SUMMA_B'
      SummaryField = 'SUMMA_B'
    end
    object dxDBGridRBSUMMA_P: TdxDBGridCalcColumn
      Caption = #1055'.'#1085'.'
      HeaderAlignment = taCenter
      Width = 59
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMA_P'
      SummaryFooterType = cstSum
      SummaryFooterField = 'SUMMA_P'
      SummaryField = 'SUMMA_P'
    end
    object dxDBGridRBSUMMA_E: TdxDBGridCalcColumn
      Caption = #1045#1057#1042
      HeaderAlignment = taCenter
      Width = 61
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMA_E'
      SummaryFooterType = cstSum
      SummaryFooterField = 'SUMMA_E'
      SummaryField = 'SUMMA_E'
    end
    object dxDBGridRBSUMMA_BA: TdxDBGridCalcColumn
      Caption = #1041#1072#1085#1082
      HeaderAlignment = taCenter
      Width = 97
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMA_BA'
      SummaryFooterType = cstSum
      SummaryFooterField = 'SUMMA_BA'
      SummaryField = 'SUMMA_BA'
    end
    object dxDBGridRBColumn10: TdxDBGridLookupColumn
      Caption = #1059#1095#1072#1089#1090#1086#1082
      HeaderAlignment = taCenter
      Width = 110
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAMEBUH'
      ListFieldName = 'FIOOP'
      ListFieldIndex = 1
    end
  end
  object DataSourceRBPr: TDataSource
    DataSet = pFIBDataSetRBPr
    Left = 192
    Top = 16
  end
  object pFIBDataSetRBPr: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_REE_BOLN_DET'
      'SET '
      ' NOMER_B = :NOMER_B,'
      ' FIO = :FIO,'
      ' DATEFR = :F_DATA,'
      ' DATETO = :L_DATA,'
      ' SUMMASS = :SUMMA_B,'
      ' SUMMAPODSS = :SUMMA_P,'
      ' SUMMAECBSS = :SUMMA_E,'
      ' SUMMABANKSS = :SUMMA_BA,'
      ' SHIFRBUH    = :SHIFRBUH'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_REE_BOLN_DET'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_REE_BOLN_DET('
      ' SHIFRID,'
      ' NOMER_B,'
      ' FIO,'
      ' DATEFR,'
      ' DATETO,'
      ' SUMMASS,'
      ' SUMMAPODSS,'
      ' SUMMAECBSS,'
      ' SUMMABANKSS,'
      ' SHIFRBUH'
      ')'
      'VALUES('
      ' :SHIFRID,'
      ' :NOMER_B,'
      ' :FIO,'
      ' :F_DATA,'
      ' :L_DATA,'
      ' :SUMMA_B,'
      ' :SUMMA_P,'
      ' :SUMMA_E,'
      ' :SUMMA_BA,'
      ' :SHIFRBUH'
      ')')
    RefreshSQL.Strings = (
      
        'select a.shifrid,a.nomer_b,a.fio,a.datefr as f_data,a.dateto as ' +
        'l_data,'
      'a.summass as summa_b,'
      'a.summapodss as summa_p,'
      'a.summaecbss as summa_e,'
      'a.summabankss as summa_ba,'
      'a.shifrbuh '
      ' from tb_ree_boln_det a'
      'where(  a.shifridree=:shifridree'
      '  ) and (  A.SHIFRID = :OLD_SHIFRID'
      '  )'
      ' '
      '')
    SelectSQL.Strings = (
      
        'select a.shifrid,a.nomer_b,a.fio,a.datefr as f_data,a.dateto as ' +
        'l_data,'
      'coalesce(a.summass,0) as summa_b,'
      'coalesce(a.summapodss,0) as summa_p,'
      'coalesce(a.summaecbss,0) as summa_e,'
      'coalesce(a.summabankss,0) as summa_ba,'
      'a.tabno,a.inn,a.shifrbuh,a.shifridboln'
      ' from tb_ree_boln_det a'
      'where a.shifridree=:shifridree'
      '')
    AutoUpdateOptions.UpdateTableName = 'TB_REE_BOLN_DET'
    AutoUpdateOptions.KeyFields = 'SHIFRID'
    AutoUpdateOptions.GeneratorName = 'G_REE_BOLN_DET'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    BeforeDelete = pFIBDataSetRBPrBeforeDelete
    OnCalcFields = pFIBDataSetRBPrCalcFields
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 16
    Top = 16
    object pFIBDataSetRBPrSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      ReadOnly = True
    end
    object pFIBDataSetRBPrNOMER_B: TFIBStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'NOMER_B'
      Size = 15
      EmptyStrToNull = True
    end
    object pFIBDataSetRBPrFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 51
      EmptyStrToNull = True
    end
    object pFIBDataSetRBPrF_DATA: TFIBDateField
      FieldName = 'F_DATA'
    end
    object pFIBDataSetRBPrL_DATA: TFIBDateField
      FieldName = 'L_DATA'
    end
    object pFIBDataSetRBPrSUMMA_B: TFIBBCDField
      FieldName = 'SUMMA_B'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRBPrSUMMA_P: TFIBBCDField
      FieldName = 'SUMMA_P'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRBPrSUMMA_E: TFIBBCDField
      FieldName = 'SUMMA_E'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRBPrSUMMA_BA: TFIBBCDField
      FieldName = 'SUMMA_BA'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRBPrSHORFIO: TStringField
      FieldKind = fkCalculated
      FieldName = 'SHORFIO'
      Size = 50
      Calculated = True
    end
    object pFIBDataSetRBPrTABNO: TFIBSmallIntField
      FieldName = 'TABNO'
    end
    object pFIBDataSetRBPrsummab: TStringField
      FieldKind = fkCalculated
      FieldName = 'summab'
      Size = 12
      Calculated = True
    end
    object pFIBDataSetRBPrINN: TFIBStringField
      FieldName = 'INN'
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSetRBPrSHIFRBUH: TFIBSmallIntField
      FieldName = 'SHIFRBUH'
    end
    object pFIBDataSetRBPrNAMEBUH: TStringField
      FieldKind = fkLookup
      FieldName = 'NAMEBUH'
      LookupDataSet = pFIBDataSetBuh
      LookupKeyFields = 'SHIFRWRK'
      LookupResultField = 'FIOOP'
      KeyFields = 'SHIFRBUH'
      Size = 30
      Lookup = True
    end
    object pFIBDataSetRBPrSHIFRIDBOLN: TFIBIntegerField
      FieldName = 'SHIFRIDBOLN'
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
    Left = 56
    Top = 16
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 96
    Top = 16
  end
  object PopupMenu1: TPopupMenu
    Left = 160
    Top = 128
    object N1: TMenuItem
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1082#1072' '#1076#1080#1089#1082#1077#1090#1099
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #1087#1077#1095#1072#1090#1100' '#1087#1086' '#1091#1095#1072#1089#1090#1082#1072#1084
      OnClick = N4Click
    end
  end
  object frxReportPlt: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40583.900814340280000000
    ReportOptions.LastChange = 40583.938155914350000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 280
    Top = 80
    Datasets = <
      item
        DataSet = frxDBDatasetPlt
        DataSetName = 'frxDBDatasetPlt'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 109.606370000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 151.181200000000000000
          Width = 502.677490000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1038#1057#8230#1057#8211#1056#1169#1056#1029#1056#1109#1057#1107#1056#1108#1057#1026#1056#176#1057#8212#1056#1029#1057#1027#1057#1034#1056#1108#1056#1105#1056#8470' '#1056#1029#1056#176#1057#8224#1057#8211#1056#1109#1056#1029#1056#176#1056#187#1057#1034#1056#1029#1056#1105#1056#8470' '#1057#1107#1056#1029 +
              #1057#8211#1056#1030#1056#181#1057#1026#1057#1027#1056#1105#1057#8218#1056#181#1057#8218' '#1057#8211#1056#1112'.'#1056#8217'.'#1056#8221#1056#176#1056#187#1057#1039)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 207.874150000000000000
          Top = 34.015770000000010000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#187#1056#176#1057#8218#1057#8211#1056#182#1056#1029#1056#176' '#1056#1030#1057#8211#1056#1169#1056#1109#1056#1112#1057#8211#1057#1027#1057#8218#1057#1034' '#1074#8222#8211)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 7.559060000000000000
          Top = 75.590600000000000000
          Width = 404.409710000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#8250#1057#8211#1056#1108#1056#176#1057#1026#1056#1029#1057#1039#1056#1029#1057#8211' '#1056#183' '#1057#8222#1056#1109#1056#1029#1056#1169#1057#1107' '#1057#1027#1056#1109#1057#8224#1057#8211#1056#176#1056#187#1057#1034#1056#1029#1056#1109#1056#1110#1056#1109' '#1057#1027#1057#8218#1057#1026#1056#176 +
              #1057#8230#1057#1107#1056#1030#1056#176#1056#1029#1056#1029#1057#1039)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 570.709030000000000000
          Top = 75.590600000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[Date  #ddd.mm.yyyy]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 26.456710000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1032#1056#1108#1057#1026#1056#176#1057#8212#1056#1029#1056#176)
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 75.590600000000000000
        Top = 151.181200000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          Left = 597.165740000000000000
          Top = 3.779529999999994000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1057#1027#1057#8218#1056#1109#1057#1026#1057#8211#1056#1029#1056#1108#1056#176' [Page]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 585.827150000000000000
          Top = 26.456709999999990000
          Width = 132.283550000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#1109#1056#183#1056#1111#1056#1105#1057#1027' '#1056#1030' '#1056#1109#1056#1169#1056#181#1057#1026#1056#182#1056#176#1056#1029#1056#1029#1057#8211)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 453.543600000000000000
          Top = 26.456709999999990000
          Width = 132.283550000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 377.953000000000000000
          Top = 26.456709999999990000
          Width = 75.590600000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1118#1056#176#1056#177'. '#1056#1029#1056#1109#1056#1112#1056#181#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 45.354360000000000000
          Top = 26.456709999999990000
          Width = 332.598425200000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1057#1026#1057#8211#1056#183#1056#1030#1056#1105#1057#8240#1056#181' '#1056#8224'. '#1056#8216'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Top = 26.456709999999990000
          Width = 45.354360000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211
            #1056#183'.'#1056#1111'.')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 37.795275590551180000
        Top = 555.590910000000000000
        Width = 718.110700000000000000
        PrintOnLastPage = False
        object Memo17: TfrxMemoView
          Width = 453.543600000000000000
          Height = 37.795275590000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#176#1056#183#1056#1109#1056#1112' '#1056#1111#1056#1109' '#1057#1027#1057#8218#1056#1109#1057#1026#1056#1105#1056#1029#1057#8224#1057#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 585.827150000000000000
          Width = 132.283550000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object SysMemo2: TfrxSysMemoView
          Left = 453.543600000000000000
          Width = 132.283550000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDatasetPlt."SUMMA_BA">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo1: TfrxSysMemoView
          Left = 102.047310000000000000
          Top = 34.015769999999970000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 147.401596770000000000
        Top = 385.512060000000000000
        Width = 718.110700000000000000
        object Memo20: TfrxMemoView
          Width = 453.543600000000000000
          Height = 37.795275590000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1032#1057#1027#1057#1034#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1056#1111#1056#187#1056#176#1057#8218#1057#8211#1056#182#1056#1029#1057#8211#1056#8470' '#1056#1030#1057#8211#1056#1169#1056#1109#1056#1112#1056#1109#1057#1027#1057#8218#1057#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo3: TfrxSysMemoView
          Left = 453.543600000000000000
          Width = 132.283464566929100000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDatasetPlt."SUMMA_BA">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 585.827150000000000000
          Width = 132.283550000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo21: TfrxMemoView
          Left = 37.795300000000000000
          Top = 71.811069999999910000
          Width = 551.811380000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#160#1056#181#1056#1108#1057#8218#1056#1109#1057#1026'                                                    ' +
              '          '#1056#8220#1056#1109#1056#187#1057#1107#1056#177#1056#181#1056#1029#1056#1108#1056#1109' '#1056#1115'.'#1056#8250'.')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 34.015770000000010000
          Top = 113.385900000000000000
          Width = 555.590910000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#8220#1056#1109#1056#187#1056#1109#1056#1030#1056#1029#1056#1105#1056#8470' '#1056#177#1057#1107#1057#8230#1056#1110#1056#176#1056#187#1057#8218#1056#181#1057#1026'                             ' +
              '           '#1056#8216#1057#8221#1056#187#1056#1109#1057#1107#1057#1027#1056#1109#1056#1030#1056#176' '#1056#8250'.'#1056#8224'.')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 37.795275590000000000
        Top = 287.244280000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDatasetPlt
        DataSetName = 'frxDBDatasetPlt'
        RowCount = 0
        object Memo7: TfrxMemoView
          Width = 45.354335590000000000
          Height = 37.795275590000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 45.354360000000000000
          Width = 332.598444720000000000
          Height = 37.795275590000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[frxDBDatasetPlt."SHORFIO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 377.953000000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDatasetPlt."TABNO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 453.543600000000000000
          Width = 132.283550000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDatasetPlt."summab"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 585.827150000000000000
          Width = 132.283550000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
      end
    end
  end
  object frxDBDatasetPlt: TfrxDBDataset
    UserName = 'frxDBDatasetPlt'
    CloseDataSource = False
    DataSet = pFIBDataSetRBPr
    Left = 320
    Top = 80
  end
  object pFIBDataSetBuh: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRWRK,'
      ' FIOOP'
      'FROM'
      ' OPERATORY '
      'where shifrpra=2'
      'and fioop is not null'
      'order by fioop')
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    Left = 40
    Top = 80
    object pFIBDataSetBuhSHIFRWRK: TFIBIntegerField
      FieldName = 'SHIFRWRK'
      Visible = False
    end
    object pFIBDataSetBuhFIOOP: TFIBStringField
      DisplayLabel = #1059#1095#1072#1089#1090#1086#1082
      FieldName = 'FIOOP'
      Size = 50
      EmptyStrToNull = True
    end
  end
  object pFIBTransactionBuh: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 80
    Top = 80
  end
  object DataSourceBuh: TDataSource
    DataSet = pFIBDataSetBuh
    Left = 120
    Top = 80
  end
  object frxReportBay: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40647.011252789350000000
    ReportOptions.LastChange = 40647.029398680560000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 288
    Top = 120
    Datasets = <
      item
        DataSet = frxDBDatasetPlt
        DataSetName = 'frxDBDatasetPlt'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      object ReportTitle1: TfrxReportTitle
        Height = 90.708720000000000000
        Top = 18.897650000000000000
        Width = 793.701300000000000000
        object Memo7: TfrxMemoView
          Left = 177.637910000000000000
          Top = 15.118120000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1038#1056#1030#1056#1109#1056#1169' '#1056#177#1056#1109#1056#187#1057#1034#1056#1029#1056#1105#1057#8225#1056#1029#1057#8249#1057#8230' '#1056#1111#1056#1109' '#1057#1107#1057#8225#1056#176#1057#1027#1057#8218#1056#1108#1056#176#1056#1112)
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 215.433210000000000000
        Width = 793.701300000000000000
        Condition = 'frxDBDatasetPlt."NAMEBUH"'
        object Memo1: TfrxMemoView
          Left = 253.228510000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDatasetPlt."NAMEBUH"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 158.740260000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1032#1057#8225#1056#176#1057#1027#1057#8218#1056#1109#1056#1108)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 260.787570000000000000
        Width = 793.701300000000000000
        DataSet = frxDBDatasetPlt
        DataSetName = 'frxDBDatasetPlt'
        RowCount = 0
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Line][Line# #n]')
          ParentFont = False
        end
        object frxDBDatasetPltNOMER_B: TfrxMemoView
          Left = 49.133890000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'NOMER_B'
          DataSet = frxDBDatasetPlt
          DataSetName = 'frxDBDatasetPlt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDatasetPlt."NOMER_B"]')
          ParentFont = False
        end
        object frxDBDatasetPltFIO: TfrxMemoView
          Left = 113.385900000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          DataField = 'FIO'
          DataSet = frxDBDatasetPlt
          DataSetName = 'frxDBDatasetPlt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDatasetPlt."FIO"]')
          ParentFont = False
        end
        object frxDBDatasetPltF_DATA: TfrxMemoView
          Left = 302.362400000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'F_DATA'
          DataSet = frxDBDatasetPlt
          DataSetName = 'frxDBDatasetPlt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDatasetPlt."F_DATA"]')
          ParentFont = False
        end
        object frxDBDatasetPltL_DATA: TfrxMemoView
          Left = 385.512060000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'L_DATA'
          DataSet = frxDBDatasetPlt
          DataSetName = 'frxDBDatasetPlt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDatasetPlt."L_DATA"]')
          ParentFont = False
        end
        object frxDBDatasetPltSUMMA_E: TfrxMemoView
          Left = 468.661720000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDatasetPlt
          DataSetName = 'frxDBDatasetPlt'
          DisplayFormat.DecimalSeparator = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDatasetPlt."SUMMA_B"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 306.141930000000000000
        Width = 793.701300000000000000
        object Memo3: TfrxMemoView
          Left = 472.441250000000000000
          Top = 3.779530000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDatasetPlt."SUMMA_B">,MasterData1)]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 181.417440000000000000
          Top = 3.779530000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1057#1107#1057#8225#1056#176#1057#1027#1057#8218#1056#1108#1057#1107' [frxDBDatasetPlt."NAMEBUH"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 22.677180000000000000
        Top = 132.283550000000000000
        Width = 793.701300000000000000
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 434.645950000000000000
        Width = 793.701300000000000000
      end
      object ReportSummary1: TfrxReportSummary
        Height = 22.677180000000000000
        Top = 389.291590000000000000
        Width = 793.701300000000000000
        object Memo4: TfrxMemoView
          Left = 472.441250000000000000
          Top = 3.779530000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDatasetPlt."SUMMA_B">,MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object pFIBQueryB: TpFIBQuery
    Transaction = pFIBTransactionQ
    Database = FIB.pFIBDatabaseSal
    Left = 400
    Top = 56
  end
  object pFIBTransactionQ: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 440
    Top = 56
  end
end
