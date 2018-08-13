object Form1DF: TForm1DF
  Left = 253
  Top = 136
  Width = 696
  Height = 480
  Anchors = [akLeft, akBottom]
  Caption = #1060#1086#1088#1084#1072' 1'#1044#1060
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
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 0
    Width = 129
    Height = 28
    Date = 40364.497438414350000000
    Time = 40364.497438414350000000
    DateFormat = dfLong
    TabOrder = 0
    OnChange = DateTimePicker1Change
  end
  object dxDBGrid1DF: TdxDBGrid
    Left = 8
    Top = 32
    Width = 665
    Height = 377
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    SummaryGroups = <>
    SummarySeparator = ', '
    PopupMenu = PopupMenu1
    TabOrder = 1
    DataSource = DataSource1DF
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGrid1DFSHIFRID: TdxDBGridMaskColumn
      Visible = False
      Width = 90
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGrid1DFTABNO: TdxDBGridCalcColumn
      Width = 31
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
    end
    object dxDBGrid1DFNAL_CODE: TdxDBGridMaskColumn
      Width = 52
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAL_CODE'
    end
    object dxDBGrid1DFFIO: TdxDBGridMaskColumn
      Caption = #1060#1048#1054
      HeaderAlignment = taCenter
      Width = 165
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
    object dxDBGrid1DFW_R: TdxDBGridMaskColumn
      MinWidth = 16
      Width = 49
      BandIndex = 0
      RowIndex = 0
      FieldName = 'W_R'
    end
    object dxDBGrid1DFSUMMAADD: TdxDBGridCalcColumn
      Width = 47
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMAADD'
    end
    object dxDBGrid1DFSUMMAPOD: TdxDBGridCalcColumn
      Width = 47
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMAPOD'
    end
    object dxDBGrid1DFDATAPRI: TdxDBGridDateColumn
      Width = 44
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATAPRI'
    end
    object dxDBGrid1DFDATAUW: TdxDBGridDateColumn
      Width = 44
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATAUW'
    end
    object dxDBGrid1DFCODE_PRIZ: TdxDBGridMaskColumn
      MinWidth = 16
      Width = 69
      BandIndex = 0
      RowIndex = 0
      FieldName = 'CODE_PRIZ'
    end
    object dxDBGrid1DFOZN_PILG: TdxDBGridMaskColumn
      Width = 44
      BandIndex = 0
      RowIndex = 0
      FieldName = 'OZN_PILG'
    end
    object dxDBGrid1DFINVALID: TdxDBGridMaskColumn
      MinWidth = 16
      Sorted = csUp
      Width = 69
      BandIndex = 0
      RowIndex = 0
      FieldName = 'INVALID'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 408
    Width = 240
    Height = 25
    DataSource = DataSource1DF
    Anchors = [akLeft, akBottom]
    TabOrder = 2
  end
  object pFIBDataSet1DF: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' TABNO,'
      ' NAL_CODE,'
      ' FIO,'
      ' W_R,'
      ' SUMMAADD,'
      ' SUMMAPOD,'
      ' DATAPRI,'
      ' DATAUW,'
      ' CODE_PRIZ,'
      ' OZN_PILG,'
      ' INVALID'
      'FROM'
      ' TB_1DF'
      'where'
      ' y=:y and m=:m '
      'order by nal_code')
    AllowedUpdateKinds = [ukModify]
    Transaction = FIB.pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    Left = 16
    Top = 64
    object pFIBDataSet1DFSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object pFIBDataSet1DFTABNO: TFIBIntegerField
      DisplayLabel = #1058' '#1085
      FieldName = 'TABNO'
    end
    object pFIBDataSet1DFNAL_CODE: TFIBStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'NAL_CODE'
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSet1DFFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSet1DFW_R: TFIBSmallIntField
      DisplayLabel = #1042#1056
      FieldName = 'W_R'
    end
    object pFIBDataSet1DFSUMMAADD: TFIBBCDField
      DisplayLabel = #1053#1072#1095#1080#1089#1083#1077#1085#1086
      FieldName = 'SUMMAADD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet1DFSUMMAPOD: TFIBBCDField
      DisplayLabel = #1055#1086#1076'.'#1085#1072#1083#1086#1075
      FieldName = 'SUMMAPOD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet1DFDATAPRI: TFIBDateField
      DisplayLabel = #1055#1088#1080#1085#1103#1090
      FieldName = 'DATAPRI'
    end
    object pFIBDataSet1DFDATAUW: TFIBDateField
      DisplayLabel = #1059#1074#1086#1083#1077#1085
      FieldName = 'DATAUW'
    end
    object pFIBDataSet1DFCODE_PRIZ: TFIBSmallIntField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082
      FieldName = 'CODE_PRIZ'
    end
    object pFIBDataSet1DFOZN_PILG: TFIBSmallIntField
      DisplayLabel = #1054#1079#1085' '#1087#1110#1083#1100#1075
      FieldName = 'OZN_PILG'
    end
    object pFIBDataSet1DFINVALID: TFIBSmallIntField
      DisplayLabel = #1030#1085#1074#1072#1083#1110#1076
      FieldName = 'INVALID'
      MaxValue = 1
    end
  end
  object DataSource1DF: TDataSource
    DataSet = pFIBDataSet1DF
    Left = 56
    Top = 64
  end
  object PopupMenu1: TPopupMenu
    Left = 88
    Top = 128
    object N1: TMenuItem
      Caption = #1057#1074#1086#1076' '#1091#1076#1077#1088#1078#1072#1085#1080#1081' '#1087#1086' '#1089#1095#1077#1090#1072#1084
      OnClick = N1Click
    end
    object DBF1: TMenuItem
      Caption = #1055#1077#1088#1077#1085#1086#1089' '#1074' DBF'
      OnClick = DBF1Click
    end
    object N2: TMenuItem
      Caption = #1057#1087#1080#1089#1086#1082' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1073#1077#1079' '#1082#1086#1076#1086#1074
      OnClick = N2Click
    end
    object N11: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1091#1102' '#1089#1087#1088#1072#1074#1082#1091' 1'#1044#1060
      OnClick = N11Click
    end
    object N3: TMenuItem
      Caption = #1057#1091#1084#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1076#1072#1085#1085#1099#1093
      OnClick = N3Click
    end
    object XMLJ05001051: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074'  XML J0500105'
      OnClick = XMLJ05001051Click
    end
    object XMLj05001052: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1089#1090#1080#1087#1077#1085#1076#1080#1080' '#1074' XML j0500105'
      OnClick = XMLj05001052Click
    end
    object Excel1: TMenuItem
      Caption = #1055#1077#1088#1077#1085#1086#1089' '#1074' Excel'
      object N4: TMenuItem
        Caption = #1044#1083#1103' '#1087#1077#1095#1072#1090#1080
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1044#1083#1103' '#1092#1072#1081#1083#1072
        OnClick = N5Click
      end
    end
    object N12: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1089#1087#1088#1072#1074#1082#1080' 1'#1044#1060
      OnClick = N12Click
    end
  end
  object pFIBDataSetSwodUd: TpFIBDataSet
    SelectSQL.Strings = (
      'select shifrgru,namegru,summa1,summa2,summa3,summat'
      'from pr_1df_swod_ud(:y,:kw)')
    AllowedUpdateKinds = []
    Transaction = pFIBTransaction1
    Database = FIB.pFIBDatabaseSal
    Left = 16
    Top = 96
    object pFIBDataSetSwodUdSHIFRGRU: TFIBIntegerField
      FieldName = 'SHIFRGRU'
    end
    object pFIBDataSetSwodUdNAMEGRU: TFIBStringField
      FieldName = 'NAMEGRU'
      EmptyStrToNull = True
    end
    object pFIBDataSetSwodUdSUMMA1: TFIBBCDField
      FieldName = 'SUMMA1'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetSwodUdSUMMA2: TFIBBCDField
      FieldName = 'SUMMA2'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetSwodUdSUMMA3: TFIBBCDField
      FieldName = 'SUMMA3'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetSwodUdSUMMAT: TFIBBCDField
      FieldName = 'SUMMAT'
      Size = 2
      RoundByScale = True
    end
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 184
    Top = 96
  end
  object DataSourceSwodUd: TDataSource
    DataSet = pFIBDataSetSwodUd
    Left = 56
    Top = 96
  end
  object frxReportSwodUd: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40364.548360763900000000
    ReportOptions.LastChange = 40365.611562604170000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReportSwodUdGetValue
    Left = 96
    Top = 184
    Datasets = <
      item
        DataSet = frxDBDatasetSwodUd
        DataSetName = 'frxDBDatasetSwodUd'
      end>
    Variables = <
      item
        Name = ' H'
        Value = Null
      end
      item
        Name = 'm1'
        Value = ''
      end
      item
        Name = 'm2'
        Value = ''
      end
      item
        Name = 'm3'
        Value = ''
      end
      item
        Name = 'd'
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
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 60.472480000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          Left = 162.519790000000000000
          Width = 404.409710000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8 = (
            
              #1056#1038#1056#1030#1056#1109#1056#1169' '#1056#1029#1056#176#1056#187#1056#1109#1056#1110#1056#176' '#1057#1027' '#1056#1169#1056#1109#1057#8230#1056#1109#1056#1169#1056#176' '#1057#1027' '#1057#1026#1056#176#1056#183#1056#177#1056#1105#1056#1030#1056#1108#1056#1109#1056#8470' '#1056#1111#1056#1109 +
              ' '#1057#1027#1057#8225#1056#181#1057#8218#1056#176#1056#1112' [d]')
        end
        object Memo9: TfrxMemoView
          Top = 41.574830000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8216#1056#176#1056#187#1056#176#1056#1029#1057#1027#1056#1109#1056#1030#1056#1105#1056#8470' '#1057#1026#1056#176#1057#8230#1057#1107#1056#1029#1056#1109#1056#1108)
        end
        object Memo10: TfrxMemoView
          Left = 241.889920000000000000
          Top = 41.574830000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[m1]')
        end
        object Memo11: TfrxMemoView
          Left = 355.275820000000000000
          Top = 41.574830000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[m2]')
        end
        object Memo12: TfrxMemoView
          Left = 468.661720000000000000
          Top = 41.574830000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[m3]')
        end
        object Memo13: TfrxMemoView
          Left = 582.047620000000000000
          Top = 41.574830000000000000
          Width = 113.385826771653500000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#176#1056#183#1056#1109#1056#1112)
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 139.842610000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDatasetSwodUd
        DataSetName = 'frxDBDatasetSwodUd'
        RowCount = 0
        object Memo1: TfrxMemoView
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataField = 'SHIFRGRU'
          DataSet = frxDBDatasetSwodUd
          DataSetName = 'frxDBDatasetSwodUd'
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDatasetSwodUd."SHIFRGRU"]')
        end
        object Memo2: TfrxMemoView
          Left = 241.889920000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          DataSet = frxDBDatasetSwodUd
          DataSetName = 'frxDBDatasetSwodUd'
          DisplayFormat.FormatStr = '%15.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDatasetSwodUd."SUMMA1"]')
        end
        object Memo3: TfrxMemoView
          Left = 355.275820000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          DataSet = frxDBDatasetSwodUd
          DataSetName = 'frxDBDatasetSwodUd'
          DisplayFormat.FormatStr = '%15.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDatasetSwodUd."SUMMA2"]')
        end
        object Memo4: TfrxMemoView
          Left = 468.661720000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          DataSet = frxDBDatasetSwodUd
          DataSetName = 'frxDBDatasetSwodUd'
          DisplayFormat.FormatStr = '%15.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDatasetSwodUd."SUMMA3"]')
        end
        object Memo5: TfrxMemoView
          Left = 582.047620000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          DataSet = frxDBDatasetSwodUd
          DataSetName = 'frxDBDatasetSwodUd'
          DisplayFormat.DecimalSeparator = ' '
          DisplayFormat.FormatStr = '%15.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDatasetSwodUd."SUMMAT"]')
        end
        object Memo7: TfrxMemoView
          Left = 83.149660000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = 'NAMEGRU'
          DataSet = frxDBDatasetSwodUd
          DataSetName = 'frxDBDatasetSwodUd'
          Frame.Typ = [ftRight, ftBottom]
          Memo.UTF8 = (
            '[frxDBDatasetSwodUd."NAMEGRU"]')
        end
      end
      object Footer1: TfrxFooter
        Height = 18.897650000000000000
        Top = 181.417440000000000000
        Width = 718.110700000000000000
        object Memo8: TfrxMemoView
          Left = 241.889920000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%15.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SUM(<frxDBDatasetSwodUd."SUMMA1">,MasterData1)]')
        end
        object Memo14: TfrxMemoView
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Memo.UTF8 = (
            #1056#160#1056#176#1056#183#1056#1109#1056#1112)
        end
        object Memo15: TfrxMemoView
          Left = 355.275820000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ' '
          DisplayFormat.FormatStr = '%15.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SUM(<frxDBDatasetSwodUd."SUMMA2">,MasterData1)]')
        end
        object Memo16: TfrxMemoView
          Left = 468.661720000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%15.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SUM(<frxDBDatasetSwodUd."SUMMA3">,MasterData1)]')
        end
        object Memo17: TfrxMemoView
          Left = 582.047620000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%15.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SUM(<frxDBDatasetSwodUd."SUMMAT">,MasterData1)]')
        end
      end
    end
  end
  object frxDBDatasetSwodUd: TfrxDBDataset
    UserName = 'frxDBDatasetSwodUd'
    CloseDataSource = False
    DataSet = pFIBDataSetSwodUd
    Left = 144
    Top = 184
  end
  object pFIBQuery1DF: TpFIBQuery
    Transaction = pFIBTransactionQ1DF
    Database = FIB.pFIBDatabaseSal
    Left = 280
    Top = 80
  end
  object pFIBTransactionQ1DF: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 320
    Top = 80
  end
  object pFIBDataSetBK: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select a.tabno,a.fio,a.summaadd,a.summapod,a.datapri,a.datauw   ' +
        'from tb_1df a'
      'where char_length(trim(coalesce(nal_code,'#39#39')))<>10'
      'and y=:y'
      'and m=:m'
      'order by fio')
    AllowedUpdateKinds = []
    Transaction = pFIBTransactionQ1DF
    Database = FIB.pFIBDatabaseSal
    Left = 280
    Top = 128
    object pFIBDataSetBKTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object pFIBDataSetBKFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSetBKSUMMAADD: TFIBBCDField
      FieldName = 'SUMMAADD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetBKSUMMAPOD: TFIBBCDField
      FieldName = 'SUMMAPOD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetBKDATAPRI: TFIBDateField
      FieldName = 'DATAPRI'
    end
    object pFIBDataSetBKDATAUW: TFIBDateField
      FieldName = 'DATAUW'
    end
  end
  object frxDBDatasetBK: TfrxDBDataset
    UserName = 'frxDBDatasetBK'
    CloseDataSource = False
    DataSet = pFIBDataSetBK
    Left = 320
    Top = 128
  end
  object frxReportBK: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40365.527831620370000000
    ReportOptions.LastChange = 40365.942223483800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReportBKGetValue
    Left = 360
    Top = 128
    Datasets = <
      item
        DataSet = frxDBDatasetBK
        DataSetName = 'frxDBDatasetBK'
      end>
    Variables = <
      item
        Name = ' h'
        Value = Null
      end
      item
        Name = 'd'
        Value = ''
      end>
    Style = <>
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object Header1: TfrxHeader
        Height = 64.252010000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo8: TfrxMemoView
          Left = 253.228510000000000000
          Width = 362.834880000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8 = (
            
              #1056#1038#1056#1111#1056#1105#1057#1027#1056#1109#1056#1108' '#1057#1027#1056#1109#1057#8218#1057#1026#1057#1107#1056#1169#1056#1029#1056#1105#1056#1108#1056#1109#1056#1030' '#1056#1169#1056#187#1057#1039' '#1057#8222#1056#1109#1057#1026#1056#1112#1057#8249' 1'#1056#8221#1056#164', '#1056#1029#1056 +
              #181' '#1056#1105#1056#1112#1056#181#1057#1035#1057#8240#1056#1105#1057#8230' '#1056#1108#1056#1109#1056#1169#1056#1109#1056#1030)
        end
        object Memo9: TfrxMemoView
          Top = 45.354360000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111' '#1056#1111)
        end
        object Memo10: TfrxMemoView
          Left = 37.795300000000000000
          Top = 45.354360000000000000
          Width = 56.692913390000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1118'.'#1056#1029'.')
        end
        object Memo11: TfrxMemoView
          Left = 94.488250000000000000
          Top = 45.354360000000000000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#152#1056#1115)
        end
        object Memo12: TfrxMemoView
          Left = 377.953000000000000000
          Top = 45.354360000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#1109#1057#8230#1056#1109#1056#1169)
        end
        object Memo13: TfrxMemoView
          Left = 491.338900000000000000
          Top = 45.354360000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#187#1056#1109#1056#1110)
        end
        object Memo14: TfrxMemoView
          Left = 604.724800000000000000
          Top = 45.354360000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1105#1056#1029#1057#1039#1057#8218)
        end
        object Memo15: TfrxMemoView
          Left = 684.094930000000000000
          Top = 45.354360000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1032#1056#1030#1056#1109#1056#187#1056#181#1056#1029)
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 355.275820000000000000
          Top = 18.897650000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[d]')
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 105.826840000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDatasetBK
        DataSetName = 'frxDBDatasetBK'
        RowCount = 0
        object Memo1: TfrxMemoView
          Left = 37.795300000000000000
          Width = 56.692913390000000000
          Height = 18.897650000000000000
          DataField = 'TABNO'
          DataSet = frxDBDatasetBK
          DataSetName = 'frxDBDatasetBK'
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDatasetBK."TABNO"]')
        end
        object Memo2: TfrxMemoView
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          DataSet = frxDBDatasetBK
          DataSetName = 'frxDBDatasetBK'
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[Line]')
        end
        object Memo3: TfrxMemoView
          Left = 94.488250000000000000
          Width = 283.464603540000000000
          Height = 18.897650000000000000
          DataField = 'FIO'
          DataSet = frxDBDatasetBK
          DataSetName = 'frxDBDatasetBK'
          Frame.Typ = [ftRight, ftBottom]
          Memo.UTF8 = (
            '[frxDBDatasetBK."FIO"]')
        end
        object Memo4: TfrxMemoView
          Left = 377.953000000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          DataField = 'SUMMAADD'
          DataSet = frxDBDatasetBK
          DataSetName = 'frxDBDatasetBK'
          DisplayFormat.FormatStr = '%15.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDatasetBK."SUMMAADD"]')
        end
        object Memo5: TfrxMemoView
          Left = 491.338900000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          DataField = 'SUMMAPOD'
          DataSet = frxDBDatasetBK
          DataSetName = 'frxDBDatasetBK'
          DisplayFormat.FormatStr = '%15.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDatasetBK."SUMMAPOD"]')
        end
        object Memo6: TfrxMemoView
          Left = 604.724800000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'DATAPRI'
          DataSet = frxDBDatasetBK
          DataSetName = 'frxDBDatasetBK'
          Frame.Typ = [ftRight, ftBottom]
          Memo.UTF8 = (
            '[frxDBDatasetBK."DATAPRI"]')
        end
        object Memo7: TfrxMemoView
          Left = 684.094930000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'DATAUW'
          DataSet = frxDBDatasetBK
          DataSetName = 'frxDBDatasetBK'
          Frame.Typ = [ftRight, ftBottom]
          Memo.UTF8 = (
            '[frxDBDatasetBK."DATAUW"]')
        end
      end
      object Footer1: TfrxFooter
        Height = 22.677180000000000000
        Top = 147.401670000000000000
        Width = 1046.929810000000000000
        object Memo16: TfrxMemoView
          Left = 128.504020000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152' '#1057#8218' '#1056#1109' '#1056#1110' '#1056#1109)
        end
        object Memo17: TfrxMemoView
          Left = 377.953000000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%15.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SUM(<frxDBDatasetBK."SUMMAADD">,MasterData1)]')
        end
        object Memo18: TfrxMemoView
          Left = 491.338900000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%15.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SUM(<frxDBDatasetBK."SUMMAPOD">,MasterData1)]')
        end
      end
    end
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OpenExcelAfterExport = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 272
    Top = 200
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    OpenAfterExport = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    Left = 320
    Top = 200
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OpenAfterExport = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Background = False
    Creator = 'FastReport (http://www.fast-report.com)'
    HTMLTags = True
    Left = 368
    Top = 192
  end
  object pFIBDataSetSummy: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' NAMEB,'
      ' NMBOFLINE,'
      ' SUMMAADD,'
      ' SUMMAPOD'
      'FROM'
      ' PR_1DF_ITOGI(:Y,'
      ' :M) ')
    AllowedUpdateKinds = []
    Transaction = pFIBTransaction1
    Database = FIB.pFIBDatabaseSal
    Left = 128
    Top = 256
    object pFIBDataSetSummyNAMEB: TFIBStringField
      FieldName = 'NAMEB'
      EmptyStrToNull = True
    end
    object pFIBDataSetSummyNMBOFLINE: TFIBIntegerField
      FieldName = 'NMBOFLINE'
    end
    object pFIBDataSetSummySUMMAADD: TFIBBCDField
      FieldName = 'SUMMAADD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetSummySUMMAPOD: TFIBBCDField
      FieldName = 'SUMMAPOD'
      Size = 2
      RoundByScale = True
    end
  end
  object frxDBDatasetSummy: TfrxDBDataset
    UserName = 'frxDBDatasetSummy'
    CloseDataSource = False
    FieldAliases.Strings = (
      'NAMEB=NAMEB'
      'NMBOFLINE=NMBOFLINE'
      'SUMMAADD=SUMMAADD'
      'SUMMAPOD=SUMMAPOD')
    DataSet = pFIBDataSetSummy
    Left = 176
    Top = 256
  end
  object frxReportSummy: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40366.476863391200000000
    ReportOptions.LastChange = 40366.513058321760000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReportSummyGetValue
    Left = 216
    Top = 256
    Datasets = <
      item
        DataSet = frxDBDatasetSummy
        DataSetName = 'frxDBDatasetSummy'
      end>
    Variables = <
      item
        Name = ' h'
        Value = Null
      end
      item
        Name = 'd'
        Value = ''
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object Header1: TfrxHeader
        Height = 45.354360000000000000
        Top = 18.897650000000000000
        Width = 718.169912636666600000
        object Memo1: TfrxMemoView
          Left = 173.858380000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8 = (
            #1056#1038#1056#1030#1056#1109#1056#1169' '#1056#1111#1056#1109' '#1056#1105#1057#8218#1056#1109#1056#1110#1056#176#1056#1112' '#1057#1027#1056#1111#1057#1026#1056#176#1056#1030#1056#1108#1056#1105' 1'#1056#8221#1056#164' [d]')
        end
        object Memo6: TfrxMemoView
          Top = 26.456710000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#176#1057#8218#1056#181#1056#1110#1056#1109#1057#1026#1056#1105#1057#1039)
        end
        object Memo7: TfrxMemoView
          Left = 113.385900000000000000
          Top = 26.456710000000000000
          Width = 75.590551181102360000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187'-'#1056#1030#1056#1109)
        end
        object Memo8: TfrxMemoView
          Left = 188.976500000000000000
          Top = 26.456710000000000000
          Width = 113.385826771653500000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176' '#1056#1169#1056#1109#1057#8230#1056#1109#1056#1169#1056#176)
        end
        object Memo9: TfrxMemoView
          Left = 302.362400000000000000
          Top = 26.456710000000000000
          Width = 113.385826771653500000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176' '#1056#1029#1056#176#1056#187#1056#1109#1056#1110#1056#176)
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 86.929190000000000000
        Width = 718.169912636666600000
        DataSet = frxDBDatasetSummy
        DataSetName = 'frxDBDatasetSummy'
        RowCount = 0
        object Memo2: TfrxMemoView
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          DataField = 'NAMEB'
          DataSet = frxDBDatasetSummy
          DataSetName = 'frxDBDatasetSummy'
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Memo.UTF8 = (
            '[frxDBDatasetSummy."NAMEB"]')
        end
        object Memo3: TfrxMemoView
          Left = 113.385826771653500000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          DataField = 'NMBOFLINE'
          DataSet = frxDBDatasetSummy
          DataSetName = 'frxDBDatasetSummy'
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDatasetSummy."NMBOFLINE"]')
        end
        object Memo4: TfrxMemoView
          Left = 188.976377950000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          DataField = 'SUMMAADD'
          DataSet = frxDBDatasetSummy
          DataSetName = 'frxDBDatasetSummy'
          DisplayFormat.FormatStr = '%15.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDatasetSummy."SUMMAADD"]')
        end
        object Memo5: TfrxMemoView
          Left = 302.362204720000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          DataField = 'SUMMAPOD'
          DataSet = frxDBDatasetSummy
          DataSetName = 'frxDBDatasetSummy'
          DisplayFormat.FormatStr = '%15.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDatasetSummy."SUMMAPOD"]')
        end
      end
    end
  end
  object frxReportFull: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42776.510164571800000000
    ReportOptions.LastChange = 42795.827758252320000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReportFullGetValue
    Left = 280
    Top = 256
    Datasets = <
      item
        DataSet = frxDBPrint
        DataSetName = 'frxDBPrint'
      end>
    Variables = <
      item
        Name = ' Header'
        Value = Null
      end
      item
        Name = 'kwaS'
        Value = Null
      end
      item
        Name = 'Y1S'
        Value = Null
      end
      item
        Name = 'Y2S'
        Value = Null
      end
      item
        Name = 'Y3S'
        Value = Null
      end
      item
        Name = 'Y4S'
        Value = Null
      end
      item
        Name = 'PR1DOG'
        Value = Null
      end
      item
        Name = 'PR2DOG'
        Value = Null
      end
      item
        Name = 'PR3DOG'
        Value = Null
      end
      item
        Name = 'PR4DOG'
        Value = Null
      end
      item
        Name = 'PR5DOG'
        Value = Null
      end
      item
        Name = 'R1S'
        Value = ''
      end
      item
        Name = 'R2S'
        Value = ''
      end
      item
        Name = 'R3S'
        Value = ''
      end
      item
        Name = 'R4S'
        Value = ''
      end
      item
        Name = 'summaWarSbor'
        Value = ''
      end>
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
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object ReportTitle1: TfrxReportTitle
        Height = 385.511811020000000000
        Top = 18.897650000000000000
        Width = 1122.520410000000000000
        object Memo1: TfrxMemoView
          Width = 264.566929130000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1057#8211#1056#1169#1056#1112#1057#8211#1057#8218#1056#1108#1056#176' '#1056#1111#1057#1026#1056#1109' '#1056#1109#1056#1169#1056#181#1057#1026#1056#182#1056#176#1056#1029#1056#1029#1057#1039' ('#1057#8364#1057#8218#1056#176#1056#1112#1056#1111' '
            #1056#1108#1056#1109#1056#1029#1057#8218#1057#1026#1056#1109#1056#187#1057#1035#1057#1035#1057#8225#1056#1109#1056#1110#1056#1109' '#1056#1109#1057#1026#1056#1110#1056#176#1056#1029#1057#1107')')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 642.519685040000000000
          Width = 238.110390000000000000
          Height = 41.574830000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8212#1056#1106#1056#1118#1056#8217#1056#8226#1056#160#1056#8221#1056#8211#1056#8226#1056#1116#1056#1115
            
              #1056#1116#1056#176#1056#1108#1056#176#1056#183' '#1056#1114#1057#8211#1056#1029#1057#8211#1057#1027#1057#8218#1056#181#1057#1026#1057#1027#1057#8218#1056#1030#1056#176' '#1057#8222#1057#8211#1056#1029#1056#176#1057#1027#1057#8211#1056#1030' '#1056#1032#1056#1108#1057#1026#1056#176#1057#8212#1056#1029#1056 +
              #1105
            '13 '#1057#1027#1057#8211#1057#8225#1056#1029#1057#1039' 2015 '#1057#1026#1056#1109#1056#1108#1057#1107' '#1074#8222#8211' 4 ')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 52.913420000000000000
          Top = 75.590600000000000000
          Width = 26.456692910000000000
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
            '2')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 79.370130000000000000
          Top = 75.590600000000000000
          Width = 26.456692910000000000
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
            '0')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 105.826840000000000000
          Top = 75.590600000000000000
          Width = 26.456692910000000000
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
            '7')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 132.283550000000000000
          Top = 75.590600000000000000
          Width = 26.456692910000000000
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
            '0')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 158.740260000000000000
          Top = 75.590600000000000000
          Width = 26.456692910000000000
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
            '7')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 26.456710000000000000
          Top = 75.590600000000000000
          Width = 26.456692910000000000
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
            '0')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 185.196970000000000000
          Top = 75.590600000000000000
          Width = 26.456692910000000000
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
            '1')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 211.653680000000000000
          Top = 75.590600000000000000
          Width = 26.456692910000000000
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
            '4')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 238.110390000000000000
          Top = 75.590600000000000000
          Width = 26.456692910000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 264.567100000000000000
          Top = 75.590600000000000000
          Width = 26.456692910000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 22.677180000000000000
          Top = 94.488250000000000000
          Width = 268.346630000000000000
          Height = 26.456710000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1111#1056#1109#1056#1169#1056#176#1057#8218#1056#1108#1056#1109#1056#1030#1056#1105#1056#8470' '#1056#1029#1056#1109#1056#1112#1056#181#1057#1026' '#1057#1035#1057#1026#1056#1105#1056#1169#1056#1105#1057#8225#1056#1029#1056#1109#1057#8212' '#1056#1109#1057#1027#1056#1109#1056#177#1056#1105' ('#1056 +
              #1111#1056#1109#1056#1169#1056#176#1057#8218#1056#1108#1056#1109#1056#1030#1056#1105#1056#8470' '#1056#1029#1056#1109#1056#1112#1056#181#1057#1026' '#1056#176#1056#177#1056#1109
            
              #1057#1027#1056#181#1057#1026#1057#8211#1057#1039' '#1057#8218#1056#176' '#1056#1029#1056#1109#1056#1112#1056#181#1057#1026' '#1056#1111#1056#176#1057#1027#1056#1111#1056#1109#1057#1026#1057#8218#1056#176'* '#1057#1027#1056#176#1056#1112#1056#1109#1056#183#1056#176#1056#8470#1056#1029#1057#1039#1057 +
              #8218#1056#1109#1057#8212' '#1057#8222#1057#8211#1056#183#1056#1105#1057#8225#1056#1029#1056#1109#1057#8212' '#1056#1109#1057#1027#1056#1109#1056#177#1056#1105')')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 642.520100000000000000
          Top = 56.692950000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1038#1057#8218#1056#1109#1057#1026)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 854.173780000000000000
          Top = 56.692950000000000000
          Width = 26.456692910000000000
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
            '1')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 827.717070000000000000
          Top = 56.692950000000000000
          Width = 26.456692910000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 801.260360000000000000
          Top = 56.692950000000000000
          Width = 26.456692910000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 774.803650000000000000
          Top = 56.692950000000000000
          Width = 26.456692910000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 748.346940000000000000
          Top = 56.692950000000000000
          Width = 26.456692910000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 3.779530000000000000
          Top = 132.283550000000000000
          Width = 34.015770000000000000
          Height = 11.338582680000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 37.795300000000000000
          Top = 132.283550000000000000
          Width = 374.173470000000000000
          Height = 11.338582680000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#174#1057#1026#1056#1105#1056#1169#1056#1105#1057#8225#1056#1029#1056#176' '#1056#1109#1057#1027#1056#1109#1056#177#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 3.779530000000000000
          Top = 143.622140000000000000
          Width = 34.015770000000000000
          Height = 11.338582680000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 37.795300000000000000
          Top = 143.622140000000000000
          Width = 374.173470000000000000
          Height = 11.338582680000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1038#1056#176#1056#1112#1056#1109#1056#183#1056#176#1056#8470#1056#1029#1057#1039#1057#8218#1056#176' '#1057#8222#1057#8211#1056#183#1056#1105#1057#8225#1056#1029#1056#176' '#1056#1109#1057#1027#1056#1109#1056#177#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 680.315400000000000000
          Top = 143.622140000000000000
          Width = 336.378170000000000000
          Height = 11.338582680000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1032#1057#8218#1056#1109#1057#8225#1056#1029#1057#1035#1057#1035#1057#8225#1056#1105#1056#8470)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 646.299630000000000000
          Top = 143.622140000000000000
          Width = 34.015770000000000000
          Height = 11.338582680000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 680.315400000000000000
          Top = 132.283550000000000000
          Width = 336.378170000000000000
          Height = 11.338582680000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#8212#1056#1030#1057#8211#1057#8218#1056#1029#1056#1105#1056#8470' '#1056#1029#1056#1109#1056#1030#1056#1105#1056#8470)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 680.315400000000000000
          Top = 120.944960000000000000
          Width = 336.378170000000000000
          Height = 11.338582680000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#8212#1056#1030#1057#8211#1057#8218#1056#1029#1056#1105#1056#8470)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 646.299630000000000000
          Top = 132.283550000000000000
          Width = 34.015770000000000000
          Height = 11.338582680000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 646.299630000000000000
          Top = 120.944960000000000000
          Width = 34.015770000000000000
          Height = 11.338582680000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1168)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 544.252320000000000000
          Top = 113.385900000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#164#1056#1109#1057#1026#1056#1112#1056#176' 1 '#1056#8221#1056#164)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 423.307360000000000000
          Top = 162.519790000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#1169#1056#176#1057#8218#1056#1108#1056#1109#1056#1030#1056#1105#1056#8470' '#1057#1026#1056#1109#1056#183#1057#1026#1056#176#1057#8230#1057#1107#1056#1029#1056#1109#1056#1108)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 200.315090000000000000
          Top = 177.637910000000000000
          Width = 653.858690000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              #1057#1027#1057#1107#1056#1112' '#1056#1169#1056#1109#1057#8230#1056#1109#1056#1169#1057#1107', '#1056#1029#1056#176#1057#1026#1056#176#1057#8230#1056#1109#1056#1030#1056#176#1056#1029#1056#1109#1056#1110#1056#1109' ('#1057#1027#1056#1111#1056#187#1056#176#1057#8225#1056#181#1056#1029#1056#1109#1056 +
              #1110#1056#1109') '#1056#1029#1056#176' '#1056#1108#1056#1109#1057#1026#1056#1105#1057#1027#1057#8218#1057#1034' '#1057#8222#1057#8211#1056#183#1056#1105#1057#8225#1056#1029#1056#1105#1057#8230' '#1056#1109#1057#1027#1057#8211#1056#177', '#1057#8211' '#1057#1027#1057#1107#1056#1112' '#1057#1107 +
              #1057#8218#1057#1026#1056#1105#1056#1112#1056#176#1056#1029#1056#1109#1056#1110#1056#1109' '#1056#183' '#1056#1029#1056#1105#1057#8230' '#1056#1111#1056#1109#1056#1169#1056#176#1057#8218#1056#1108#1057#1107)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 196.535560000000000000
          Top = 196.535560000000000000
          Width = 653.858690000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1038#1057#8230#1057#8211#1056#1169#1056#1029#1056#1109#1057#1107#1056#1108#1057#1026#1056#176#1057#8212#1056#1029#1057#1027#1057#1034#1056#1108#1056#1105#1056#8470' '#1056#1029#1056#176#1057#8224#1057#8211#1056#1109#1056#1029#1056#176#1056#187#1057#1034#1056#1029#1056#1105#1056#8470' '#1057#1107#1056#1029 +
              #1057#8211#1056#1030#1056#181#1057#1026#1057#1027#1056#1105#1057#8218#1056#181#1057#8218' '#1057#8211#1056#1112#1056#181#1056#1029#1057#8211' '#1056#8217#1056#1109#1056#187#1056#1109#1056#1169#1056#1105#1056#1112#1056#1105#1057#1026#1056#176' '#1056#8221#1056#176#1056#187#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 196.535560000000000000
          Top = 211.653680000000000000
          Width = 653.858690000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              '('#1056#1029#1056#176#1056#8470#1056#1112#1056#181#1056#1029#1057#1107#1056#1030#1056#176#1056#1029#1056#1029#1057#1039' '#1057#1035#1057#1026#1056#1105#1056#1169#1056#1105#1057#8225#1056#1029#1056#1109#1057#8212' '#1056#1109#1057#1027#1056#1109#1056#177#1056#1105' '#1057#8225#1056#1105' '#1056#1111#1057 +
              #1026#1057#8211#1056#183#1056#1030#1056#1105#1057#8240#1056#181', '#1057#8211#1056#1112#39#1057#1039' '#1057#8218#1056#176' '#1056#1111#1056#1109#1056#177#1056#176#1057#8218#1057#1034#1056#1108#1056#1109#1056#1030#1057#8211' '#1057#1027#1056#176#1056#1112#1056#1109#1056#183#1056#176#1056#8470#1056 +
              #1029#1057#1039#1057#8218#1056#1109#1057#8212' '#1057#8222#1057#8211#1056#183#1056#1105#1057#8225#1056#1029#1056#1109#1057#8212' '#1056#1109#1057#1027#1056#1109#1056#177#1056#1105')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 196.535560000000000000
          Top = 230.551330000000000000
          Width = 653.858690000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1111#1057#1026#1056#1109#1057#1027#1056#1111#1056#181#1056#1108#1057#8218' '#1056#166#1056#181#1056#1029#1057#8218#1057#1026#1056#176#1056#187#1057#1034#1056#1029#1056#1105#1056#8470', '#1056#177#1057#1107#1056#1169'. 59'#1056#176', '#1056#1112'.'#1056#1038#1056#8222#1056#8217 +
              #1056#8222#1056#160#1056#1115#1056#8221#1056#1115#1056#1116#1056#8226#1056#166#1056#172#1056#1113', '#1056#8250#1056#1032#1056#8220#1056#1106#1056#1116#1056#1038#1056#172#1056#1113#1056#1106' '#1056#1109#1056#177#1056#187', 91034')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 196.535560000000000000
          Top = 245.669450000000000000
          Width = 653.858690000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              '('#1056#1111#1056#1109#1056#1169#1056#176#1057#8218#1056#1108#1056#1109#1056#1030#1056#176' '#1056#176#1056#1169#1057#1026#1056#181#1057#1027#1056#176' '#1057#1035#1057#1026#1056#1105#1056#1169#1056#1105#1057#8225#1056#1029#1056#1109#1057#8212' '#1056#1109#1057#1027#1056#1109#1056#177#1056#1105' '#1057 +
              #8225#1056#1105' '#1057#1027#1056#176#1056#1112#1056#1109#1056#183#1056#176#1056#8470#1056#1029#1057#1039#1057#8218#1056#1109#1057#8212' '#1057#8222#1057#8211#1056#183#1056#1105#1057#8225#1056#1029#1056#1109#1057#8212' '#1056#1109#1057#1027#1056#1109#1056#177#1056#1105')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 196.535560000000000000
          Top = 264.567100000000000000
          Width = 653.858690000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#8221#1056#1119#1056#8224' '#1057#1107' '#1056#1038#1056#8222#1056#8217#1056#8222#1056#160#1056#1115#1056#8221#1056#1115#1056#1116#1056#8226#1056#166#1056#172#1056#1113#1056#1032' '#1056#8220#1056#1032' '#1056#8221#1056#164#1056#1038' '#1056#1032' '#1056#8250#1056#1032#1056#8220#1056#1106#1056#1116 +
              #1056#1038#1056#172#1056#1113#1056#8224#1056#8482' '#1056#1115#1056#8216#1056#8250#1056#1106#1056#1038#1056#1118#1056#8224)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 196.535560000000000000
          Top = 279.685220000000000000
          Width = 653.858690000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              '('#1056#1029#1056#176#1056#8470#1056#1112#1056#181#1056#1029#1057#1107#1056#1030#1056#176#1056#1029#1056#1029#1057#1039' '#1056#1108#1056#1109#1056#1029#1057#8218#1057#1026#1056#1109#1056#187#1057#1035#1057#1035#1057#8225#1056#1109#1056#1110#1056#1109' '#1056#1109#1057#1026#1056#1110#1056#176#1056#1029#1057 +
              #1107')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 377.953000000000000000
          Top = 309.921460000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8212#1056#1030#1057#8211#1057#8218#1056#1029#1056#1105#1056#8470' '#1056#1111#1056#181#1057#1026#1057#8211#1056#1109#1056#1169)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 453.543600000000000000
          Top = 309.921460000000000000
          Width = 26.456692910000000000
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
            ' ')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 480.000310000000000000
          Top = 309.921460000000000000
          Width = 26.456692910000000000
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
            '[kwaS] ')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 544.252320000000000000
          Top = 309.921460000000000000
          Width = 26.456692910000000000
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
            '[Y1S] ')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 570.709030000000000000
          Top = 309.921460000000000000
          Width = 26.456692910000000000
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
            '[Y2S] ')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 597.165740000000000000
          Top = 309.921460000000000000
          Width = 26.456692910000000000
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
            '[Y3S] ')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 623.622450000000000000
          Top = 309.921460000000000000
          Width = 26.456692910000000000
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
            '[Y4S]')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 453.543600000000000000
          Top = 325.039580000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1030#1056#176#1057#1026#1057#8218#1056#176#1056#187)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 570.709030000000000000
          Top = 325.039580000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1026#1057#8211#1056#1108)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 3.779530000000000000
          Top = 343.937230000000000000
          Width = 328.819110000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1119#1057#1026#1056#176#1057#8224#1057#1035#1056#1030#1056#176#1056#187#1056#1109' '#1056#183#1056#176' '#1057#8218#1057#1026#1057#1107#1056#1169#1056#1109#1056#1030#1056#1105#1056#1112#1056#1105' '#1056#1169#1056#1109#1056#1110#1056#1109#1056#1030#1056#1109#1057#1026#1056#176#1056#1112#1056#1105' ' +
              '('#1056#1108#1056#1109#1056#1029#1057#8218#1057#1026#1056#176#1056#1108#1057#8218#1056#176#1056#1112#1056#1105')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 442.205010000000000000
          Top = 343.937230000000000000
          Width = 26.456692910000000000
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
            ' ')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 468.661720000000000000
          Top = 343.937230000000000000
          Width = 26.456692910000000000
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
            ' ')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 495.118430000000000000
          Top = 343.937230000000000000
          Width = 26.456692910000000000
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
            ' ')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 336.378170000000000000
          Top = 343.937230000000000000
          Width = 26.456692910000000000
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
            ' ')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 362.834880000000000000
          Top = 343.937230000000000000
          Width = 26.456692910000000000
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
            ' ')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 389.291590000000000000
          Top = 343.937230000000000000
          Width = 26.456692910000000000
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
            ' ')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 415.748300000000000000
          Top = 343.937230000000000000
          Width = 26.456692910000000000
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
            ' ')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 3.779530000000000000
          Top = 362.834880000000000000
          Width = 328.819110000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1119#1057#1026#1056#176#1057#8224#1057#1035#1056#1030#1056#176#1056#187#1056#1109' '#1056#183#1056#176' '#1057#8224#1056#1105#1056#1030#1057#8211#1056#187#1057#1034#1056#1029#1056#1109'-'#1056#1111#1057#1026#1056#176#1056#1030#1056#1109#1056#1030#1056#1105#1056#1112#1056#1105' '#1056#1169#1056#1109 +
              #1056#1110#1056#1109#1056#1030#1056#1109#1057#1026#1056#176#1056#1112#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Left = 336.378170000000000000
          Top = 362.834880000000000000
          Width = 26.456692910000000000
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
            ' ')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 362.834880000000000000
          Top = 362.834880000000000000
          Width = 26.456692910000000000
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
            ' ')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 389.291590000000000000
          Top = 362.834880000000000000
          Width = 26.456692910000000000
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
            ' ')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 415.748300000000000000
          Top = 362.834880000000000000
          Width = 26.456692910000000000
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
            ' ')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 442.205010000000000000
          Top = 362.834880000000000000
          Width = 26.456692910000000000
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
            ' ')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 468.661720000000000000
          Top = 362.834880000000000000
          Width = 26.456692910000000000
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
            ' ')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Left = 495.118430000000000000
          Top = 362.834880000000000000
          Width = 26.456692910000000000
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
            ' ')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 555.590910000000000000
          Top = 362.834880000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1056#1109#1057#1026#1057#8224#1057#8211#1057#1039' '#1074#8222#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 627.401980000000000000
          Top = 362.834880000000000000
          Width = 26.456692910000000000
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
            ' ')
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          Left = 653.858690000000000000
          Top = 362.834880000000000000
          Width = 26.456692910000000000
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
            ' ')
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          Left = 680.315400000000000000
          Top = 362.834880000000000000
          Width = 26.456692910000000000
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
            ' ')
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          Left = 706.772110000000000000
          Top = 362.834880000000000000
          Width = 26.456692910000000000
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
            ' ')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 83.149660000000000000
        Top = 427.086890000000000000
        Width = 1122.520410000000000000
        object Memo69: TfrxMemoView
          Left = 3.779530000000000000
          Width = 1118.740880000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            
              '1. '#1056#160#1056#1109#1056#183#1056#1111#1056#1109#1056#1169#1057#8211#1056#187' '#1057#1027#1057#1107#1056#1112' '#1056#1169#1056#1109#1057#8230#1056#1109#1056#1169#1057#1107', '#1056#1029#1056#176#1057#1026#1056#176#1057#8230#1056#1109#1056#1030#1056#176#1056#1029#1056#1109#1056#1110#1056 +
              #1109' ('#1057#1027#1056#1111#1056#187#1056#176#1057#8225#1056#181#1056#1029#1056#1109#1056#1110#1056#1109') '#1056#1029#1056#176' '#1056#1108#1056#1109#1057#1026#1056#1105#1057#1027#1057#8218#1057#1034'  '#1057#8222#1057#8211#1056#183#1056#1105#1057#8225#1056#1029#1056#1105#1057#8230' '#1056 +
              #1109#1057#1027#1057#8211#1056#177', '#1056#1105' '#1057#1027#1057#1107#1056#1112#1056#1105' '#1057#1107#1057#8218#1057#1026#1056#1105#1056#1112#1056#176#1056#1029#1056#1109#1056#1110#1056#1109' '#1056#183' '#1056#1029#1056#1105#1057#8230' '#1056#1111#1056#1109#1056#1169#1056#176#1057#8218#1056#1108 +
              #1057#1107)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Left = 3.779530000000000000
          Top = 18.897650000000000000
          Width = 37.795275590000000000
          Height = 45.354360000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#183'.'#1056#1111'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 41.574830000000000000
          Top = 18.897650000000000000
          Width = 113.385875590000000000
          Height = 45.354360000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#1169#1056#176#1056#1108#1056#1109#1056#1030#1056#1105#1056#8470' '#1056#1029#1056#1109#1056#1112#1056#181#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 154.960730000000000000
          Top = 18.897650000000000000
          Width = 94.488188980000000000
          Height = 45.354360000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#176' '#1056#1029#1056#176#1057#1026#1056#176#1057#8230#1056#1109#1056#1030#1056#176#1056#1029#1056#1109#1056#1110#1056#1109' '#1056#1169#1056#1109#1057#8230#1056#1109#1056#1169#1057#1107','
            ' '#1056#1110#1057#1026#1056#1029'. '#1056#1108#1056#1109#1056#1111'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Left = 249.448980000000000000
          Top = 18.897650000000000000
          Width = 94.488188980000000000
          Height = 45.354360000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#176' '#1056#1030#1056#1105#1056#1111#1056#187#1056#176#1057#8225#1056#181#1056#1029#1056#1109#1056#1110#1056#1109' '#1056#1169#1056#1109#1057#8230#1056#1109#1056#1169#1057#1107','
            ' '#1056#1110#1057#1026#1056#1029'. '#1056#1108#1056#1109#1056#1111'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 343.937230000000000000
          Top = 41.574830000000000000
          Width = 94.488188980000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176#1057#1026#1056#176#1057#8230#1056#1109#1056#1030#1056#176#1056#1029#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 438.425480000000000000
          Top = 41.574830000000000000
          Width = 94.488188980000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1111#1056#181#1057#1026#1056#181#1057#1026#1056#176#1057#8230#1056#1109#1056#1030#1056#176#1056#1029#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo76: TfrxMemoView
          Left = 343.937230000000000000
          Top = 18.897650000000000000
          Width = 188.976438980000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#176' '#1057#1107#1057#8218#1057#1026#1056#1105#1056#1112#1056#176#1056#1029#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109#1056#1169#1056#176#1057#8218#1056#1108#1057#1107' ('#1056#1110#1057#1026#1056#1029'., '#1056#1108#1056#1109#1056#1111'.)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          Left = 532.913730000000000000
          Top = 18.897650000000000000
          Width = 37.795275590000000000
          Height = 45.354360000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1056#183#1056#1029#1056#176#1056#1108#1056#176
            #1056#1169#1056#1109#1057#8230#1056#1109#1056#1169#1057#1107)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 570.709030000000000000
          Top = 41.574830000000000000
          Width = 94.488188980000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1111#1057#1026#1056#1105#1056#8470#1056#1029#1057#1039#1057#8218#1057#8218#1057#1039' '#1056#1029#1056#176' '#1057#1026#1056#1109#1056#177#1056#1109#1057#8218#1057#1107)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo79: TfrxMemoView
          Left = 665.197280000000000000
          Top = 41.574830000000000000
          Width = 94.488188980000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#183#1056#1030#1057#8211#1056#187#1057#1034#1056#1029#1056#181#1056#1029#1056#1029#1057#1039' '#1056#183' '#1057#1026#1056#1109#1056#177#1056#1109#1057#8218#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo80: TfrxMemoView
          Left = 570.709030000000000000
          Top = 18.897650000000000000
          Width = 188.976438980000000000
          Height = 22.677180000000000000
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
          VAlign = vaCenter
        end
        object Memo81: TfrxMemoView
          Left = 759.685530000000000000
          Top = 18.897650000000000000
          Width = 49.133865590000000000
          Height = 45.354360000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1056#183#1056#1029#1056#176#1056#1108#1056#176
            #1056#1111#1056#1109#1056#1169#1056#176#1057#8218'.'#1057#1027#1056#1109#1057#8224'.'
            #1056#1111#1057#8211#1056#187#1057#1034#1056#1110#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          Left = 808.819420000000000000
          Top = 18.897650000000000000
          Width = 49.133865590000000000
          Height = 45.354360000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1056#183#1056#1029#1056#176#1056#1108#1056#176
            '(0,1)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          Left = 857.953310000000000000
          Top = 18.897650000000000000
          Width = 264.567075590000000000
          Height = 45.354360000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1057#1026#1057#8211#1056#183#1056#1030#1056#1105#1057#8240#1056#181' '#1056#8224' '#1056#1119)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo84: TfrxMemoView
          Left = 3.779530000000000000
          Top = 64.252010000000000000
          Width = 37.795275590000000000
          Height = 18.897637800000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '1')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo85: TfrxMemoView
          Left = 41.574830000000000000
          Top = 64.252010000000000000
          Width = 113.385875590000000000
          Height = 18.897637800000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '2')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo86: TfrxMemoView
          Left = 154.960730000000000000
          Top = 64.252010000000000000
          Width = 94.488225590000000000
          Height = 18.897637800000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '3')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo87: TfrxMemoView
          Left = 249.448980000000000000
          Top = 64.252010000000000000
          Width = 94.488225590000000000
          Height = 18.897637800000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '4')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo88: TfrxMemoView
          Left = 343.937230000000000000
          Top = 64.252010000000000000
          Width = 94.488225590000000000
          Height = 18.897637800000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '5')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo89: TfrxMemoView
          Left = 438.425480000000000000
          Top = 64.252010000000000000
          Width = 94.488225590000000000
          Height = 18.897637800000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '6')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo90: TfrxMemoView
          Left = 532.913730000000000000
          Top = 64.252010000000000000
          Width = 37.795275590000000000
          Height = 18.897637800000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '7')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo91: TfrxMemoView
          Left = 570.709030000000000000
          Top = 64.252010000000000000
          Width = 94.488225590000000000
          Height = 18.897637800000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '8')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo92: TfrxMemoView
          Left = 665.197280000000000000
          Top = 64.252010000000000000
          Width = 94.488225590000000000
          Height = 18.897637800000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '9')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo93: TfrxMemoView
          Left = 759.685530000000000000
          Top = 64.252010000000000000
          Width = 49.133865590000000000
          Height = 18.897637800000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '10')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo94: TfrxMemoView
          Left = 808.819420000000000000
          Top = 64.252010000000000000
          Width = 49.133865590000000000
          Height = 18.897637800000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '11')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo95: TfrxMemoView
          Left = 857.953310000000000000
          Top = 64.252010000000000000
          Width = 264.567075590000000000
          Height = 18.897637800000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '11')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897637800000000000
        Top = 570.709030000000000000
        Width = 1122.520410000000000000
        DataSet = frxDBPrint
        DataSetName = 'frxDBPrint'
        RowCount = 0
        object Memo96: TfrxMemoView
          Left = 3.779530000000000000
          Width = 37.795300000000000000
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
            '[frxDBPrint."lineno"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo97: TfrxMemoView
          Left = 41.574830000000000000
          Width = 113.385900000000000000
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
            '[frxDBPrint."INN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo98: TfrxMemoView
          Left = 154.960730000000000000
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
            '[frxDBPrint."summaAdd"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo99: TfrxMemoView
          Left = 249.448980000000000000
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
            '[frxDBPrint."summaAdd"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo100: TfrxMemoView
          Left = 343.937230000000000000
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
            '[frxDBPrint."summaPod"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo101: TfrxMemoView
          Left = 438.425480000000000000
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
            '[frxDBPrint."summaPod"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo102: TfrxMemoView
          Left = 532.913730000000000000
          Width = 37.795300000000000000
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
            '[frxDBPrint."ozndox"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo103: TfrxMemoView
          Left = 570.709030000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd.mm.yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBPrint."dataPri"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo104: TfrxMemoView
          Left = 665.197280000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd.mm.yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBPrint."dataUw"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo105: TfrxMemoView
          Left = 759.685530000000000000
          Width = 49.133890000000000000
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
            '[frxDBPrint."oznpilg"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo106: TfrxMemoView
          Left = 808.819420000000000000
          Width = 49.133890000000000000
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
            '[frxDBPrint."oznaka"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo107: TfrxMemoView
          Left = 857.953310000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBPrint."PIB"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 502.677490000000000000
        Top = 650.079160000000000000
        Width = 1122.520410000000000000
        object Memo108: TfrxMemoView
          Left = 154.960730000000000000
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
            '[SUM(<frxDBPrint."summaAdd">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo109: TfrxMemoView
          Left = 249.448980000000000000
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
            '[SUM(<frxDBPrint."summaAdd">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo110: TfrxMemoView
          Left = 343.937230000000000000
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
            '[SUM(<frxDBPrint."summaPod">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo111: TfrxMemoView
          Left = 438.425480000000000000
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
            '[SUM(<frxDBPrint."summaPod">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo112: TfrxMemoView
          Left = 3.779530000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1057#1027#1057#1034#1056#1109#1056#1110#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo113: TfrxMemoView
          Left = 41.574830000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo114: TfrxMemoView
          Left = 532.913730000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo115: TfrxMemoView
          Left = 570.709030000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo116: TfrxMemoView
          Left = 665.197280000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo117: TfrxMemoView
          Left = 759.685530000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo118: TfrxMemoView
          Left = 808.819420000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo119: TfrxMemoView
          Left = 857.953310000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo120: TfrxMemoView
          Left = 3.779530000000000000
          Top = 18.897650000000000000
          Width = 1118.740880000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            
              #1056#160#1056#1109#1056#183#1056#1169#1057#8211#1056#187' II, '#1056#1115#1056#1111#1056#1109#1056#1169#1056#176#1057#8218#1056#1108#1057#1107#1056#1030#1056#176#1056#1029#1056#1029#1057#1039' '#1056#1111#1057#1026#1056#1109#1057#8224#1056#181#1056#1029#1057#8218#1057#8211#1056#1030', ' +
              #1056#1030#1056#1105#1056#1110#1057#1026#1056#176#1057#8364#1057#8211#1056#1030' ('#1056#1111#1057#1026#1056#1105#1056#183#1057#8211#1056#1030') '#1057#1107' '#1056#187#1056#1109#1057#8218#1056#181#1057#1026#1056#181#1057#1035' '#1057#8218#1056#176' '#1056#1030#1057#8211#1056#8470#1057#1027#1057 +
              #1034#1056#1108#1056#1109#1056#1030#1056#1105#1056#8470' '#1056#183#1056#177#1057#8211#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo121: TfrxMemoView
          Top = 34.015770000000000000
          Width = 1122.520410000000000000
          Height = 461.102660000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo122: TfrxMemoView
          Left = 154.960730000000000000
          Top = 34.015770000000000000
          Width = 94.488250000000000000
          Height = 56.692950000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1110#1056#176#1056#187#1057#1034#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#176
            #1056#1029#1056#176#1057#1026#1056#176#1057#8230#1056#1109#1056#1030#1056#176#1056#1029#1056#1109#1056#1110#1056#1109
            #1056#1169#1056#1109#1057#8230#1056#1109#1056#1169#1057#1107' '
            '('#1056#1110#1057#1026#1056#1029'. '#1056#1108#1056#1109#1056#1111'.)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo123: TfrxMemoView
          Left = 249.448980000000000000
          Top = 34.015770000000000000
          Width = 94.488250000000000000
          Height = 56.692950000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1110#1056#176#1056#187#1057#1034#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#176
            #1057#1027#1056#1111#1056#187#1056#176#1057#8225#1056#181#1056#1029#1056#1109#1056#1110#1056#1109
            #1056#1169#1056#1109#1057#8230#1056#1109#1056#1169#1057#1107' '
            '('#1056#1110#1057#1026#1056#1029'. '#1056#1108#1056#1109#1056#1111'.)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo124: TfrxMemoView
          Left = 343.937230000000000000
          Top = 34.015770000000000000
          Width = 188.976500000000000000
          Height = 30.236240000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1110#1056#176#1056#187#1057#1034#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#176' '#1057#1107#1057#8218#1057#1026#1056#1105#1056#1112#1056#176#1056#1029#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109#1056#1169#1056#176#1057#8218#1056#1108#1057#1107','
            #1056#183#1056#177#1056#1109#1057#1026#1057#1107' ('#1056#1110#1057#1026#1056#1029'. '#1056#1108#1056#1109#1056#1111'.)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo125: TfrxMemoView
          Left = 343.937230000000000000
          Top = 64.252010000000000000
          Width = 94.488250000000000000
          Height = 26.456710000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176#1057#1026#1056#176#1057#8230#1056#1109#1056#1030#1056#176#1056#1029#1056#1109#1056#1110#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo126: TfrxMemoView
          Left = 438.425480000000000000
          Top = 64.252010000000000000
          Width = 94.488250000000000000
          Height = 26.456710000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1111#1056#181#1057#1026#1056#181#1057#1026#1056#176#1057#8230#1056#1109#1056#1030#1056#176#1056#1029#1056#1109#1056#1110#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo127: TfrxMemoView
          Left = 532.913730000000000000
          Top = 34.015770000000000000
          Width = 589.606680000000000000
          Height = 56.692950000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1168)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo128: TfrxMemoView
          Left = 3.779530000000000000
          Top = 34.015770000000000000
          Width = 37.795300000000000000
          Height = 56.692950000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo129: TfrxMemoView
          Left = 41.574830000000000000
          Top = 34.015770000000000000
          Width = 113.385900000000000000
          Height = 56.692950000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo130: TfrxMemoView
          Left = 3.779530000000000000
          Top = 90.708720000000000000
          Width = 37.795300000000000000
          Height = 30.236215590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo131: TfrxMemoView
          Left = 41.574830000000000000
          Top = 90.708720000000000000
          Width = 113.385900000000000000
          Height = 30.236215590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1115#1056#1111#1056#1109#1056#1169#1056#176#1057#8218#1056#1108#1057#1107#1056#1030#1056#176#1056#1029#1056#1029#1057#1039' '#1056#1111#1057#1026#1056#1109#1057#8224#1056#181#1056#1029#1057#8218#1057#8211#1056#1030)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo132: TfrxMemoView
          Left = 154.960730000000000000
          Top = 90.708720000000000000
          Width = 94.488250000000000000
          Height = 30.236215590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo133: TfrxMemoView
          Left = 249.448980000000000000
          Top = 90.708720000000000000
          Width = 94.488250000000000000
          Height = 30.236215590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo134: TfrxMemoView
          Left = 343.937230000000000000
          Top = 90.708720000000000000
          Width = 94.488250000000000000
          Height = 30.236215590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo135: TfrxMemoView
          Left = 438.425480000000000000
          Top = 90.708720000000000000
          Width = 94.488250000000000000
          Height = 30.236215590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo136: TfrxMemoView
          Left = 532.913730000000000000
          Top = 90.708720000000000000
          Width = 589.606680000000000000
          Height = 30.236215590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1168)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo137: TfrxMemoView
          Left = 3.779530000000000000
          Top = 120.944960000000000000
          Width = 37.795300000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo138: TfrxMemoView
          Left = 41.574830000000000000
          Top = 120.944960000000000000
          Width = 113.385900000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1115#1056#1111#1056#1109#1056#1169#1056#176#1057#8218#1056#1108#1057#1107#1056#1030#1056#176#1056#1029#1056#1029#1057#1039' '#1056#1111#1057#1026#1056#1109#1057#8224#1056#181#1056#1029#1057#8218#1057#8211#1056#1030
            #1056#1030#1056#1105#1056#1108#1056#187#1057#1035#1057#8225#1056#181#1056#1029#1056#1029#1057#1039' **')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo139: TfrxMemoView
          Left = 154.960730000000000000
          Top = 120.944960000000000000
          Width = 94.488250000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo140: TfrxMemoView
          Left = 249.448980000000000000
          Top = 120.944960000000000000
          Width = 94.488250000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo141: TfrxMemoView
          Left = 343.937230000000000000
          Top = 120.944960000000000000
          Width = 94.488250000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo142: TfrxMemoView
          Left = 438.425480000000000000
          Top = 120.944960000000000000
          Width = 94.488250000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo143: TfrxMemoView
          Left = 532.913730000000000000
          Top = 120.944960000000000000
          Width = 589.606680000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo144: TfrxMemoView
          Left = 3.779530000000000000
          Top = 158.740260000000000000
          Width = 37.795300000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo145: TfrxMemoView
          Left = 41.574830000000000000
          Top = 158.740260000000000000
          Width = 113.385900000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1115#1056#1111#1056#1109#1056#1169#1056#176#1057#8218#1056#1108#1057#1107#1056#1030#1056#176#1056#1029#1056#1029#1057#1039' '#1056#1030#1056#1105#1056#1110#1057#1026#1056#176#1057#8364#1057#8211#1056#1030' ('#1056#1111#1057#1026#1056#1105#1056#183#1057#8211#1056#1030') '#1057#1107
            #1056#187#1056#1109#1057#8218#1056#181#1057#1026#1056#181#1057#1035)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo146: TfrxMemoView
          Left = 154.960730000000000000
          Top = 158.740260000000000000
          Width = 94.488250000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo147: TfrxMemoView
          Left = 249.448980000000000000
          Top = 158.740260000000000000
          Width = 94.488250000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo148: TfrxMemoView
          Left = 343.937230000000000000
          Top = 158.740260000000000000
          Width = 94.488250000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo149: TfrxMemoView
          Left = 438.425480000000000000
          Top = 158.740260000000000000
          Width = 94.488250000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo150: TfrxMemoView
          Left = 532.913730000000000000
          Top = 158.740260000000000000
          Width = 589.606680000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo151: TfrxMemoView
          Left = 3.779530000000000000
          Top = 196.535560000000000000
          Width = 37.795300000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo152: TfrxMemoView
          Left = 41.574830000000000000
          Top = 196.535560000000000000
          Width = 113.385900000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1115#1056#1111#1056#1109#1056#1169#1056#176#1057#8218#1056#1108#1057#1107#1056#1030#1056#176#1056#1029#1056#1029#1057#1039' '#1056#1030#1056#1105#1056#1110#1057#1026#1056#176#1057#8364#1057#8211#1056#1030' ('#1056#1111#1057#1026#1056#1105#1056#183#1057#8211#1056#1030') '#1057#1107
            #1056#187#1056#1109#1057#8218#1056#181#1057#1026#1056#181#1057#1035)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo153: TfrxMemoView
          Left = 154.960730000000000000
          Top = 196.535560000000000000
          Width = 94.488250000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo154: TfrxMemoView
          Left = 249.448980000000000000
          Top = 196.535560000000000000
          Width = 94.488250000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo155: TfrxMemoView
          Left = 343.937230000000000000
          Top = 196.535560000000000000
          Width = 94.488250000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo156: TfrxMemoView
          Left = 438.425480000000000000
          Top = 196.535560000000000000
          Width = 94.488250000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo157: TfrxMemoView
          Left = 532.913730000000000000
          Top = 196.535560000000000000
          Width = 589.606680000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo158: TfrxMemoView
          Left = 3.779530000000000000
          Top = 234.330860000000000000
          Width = 37.795300000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo159: TfrxMemoView
          Left = 41.574830000000000000
          Top = 234.330860000000000000
          Width = 113.385900000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1115#1056#1111#1056#1109#1056#1169#1056#176#1057#8218#1056#1108#1057#1107#1056#1030#1056#176#1056#1029#1056#1029#1057#1039' '#1056#1030#1056#1105#1056#1110#1057#1026#1056#176#1057#8364#1057#8211#1056#1030' ('#1056#1111#1057#1026#1056#1105#1056#183#1057#8211#1056#1030') '#1057#1107
            #1056#187#1056#1109#1057#8218#1056#181#1057#1026#1056#181#1057#1035' '#1056#1030#1056#1105#1056#1108#1056#187#1057#1035#1057#8225#1056#181#1056#1029#1056#1029#1057#1039' ***')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo160: TfrxMemoView
          Left = 154.960730000000000000
          Top = 234.330860000000000000
          Width = 94.488250000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo161: TfrxMemoView
          Left = 249.448980000000000000
          Top = 234.330860000000000000
          Width = 94.488250000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo162: TfrxMemoView
          Left = 343.937230000000000000
          Top = 234.330860000000000000
          Width = 94.488250000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo163: TfrxMemoView
          Left = 438.425480000000000000
          Top = 234.330860000000000000
          Width = 94.488250000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo164: TfrxMemoView
          Left = 532.913730000000000000
          Top = 234.330860000000000000
          Width = 589.606680000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo165: TfrxMemoView
          Left = 3.779530000000000000
          Top = 272.126160000000000000
          Width = 37.795300000000000000
          Height = 18.897625590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo166: TfrxMemoView
          Left = 41.574830000000000000
          Top = 272.126160000000000000
          Width = 113.385900000000000000
          Height = 18.897625590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#8217#1057#8211#1056#8470#1057#1027#1057#1034#1056#1108#1056#1109#1056#1030#1056#1105#1056#8470' '#1056#183#1056#177#1057#8211#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo167: TfrxMemoView
          Left = 154.960730000000000000
          Top = 272.126160000000000000
          Width = 94.488250000000000000
          Height = 18.897625590000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBPrint."summaAdd">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo168: TfrxMemoView
          Left = 249.448980000000000000
          Top = 272.126160000000000000
          Width = 94.488250000000000000
          Height = 18.897625590000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBPrint."summaAdd">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo169: TfrxMemoView
          Left = 343.937230000000000000
          Top = 272.126160000000000000
          Width = 94.488250000000000000
          Height = 18.897625590000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[summaWarSbor]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo170: TfrxMemoView
          Left = 438.425480000000000000
          Top = 272.126160000000000000
          Width = 94.488250000000000000
          Height = 18.897625590000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[summaWarSbor]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo171: TfrxMemoView
          Left = 532.913730000000000000
          Top = 272.126160000000000000
          Width = 589.606680000000000000
          Height = 18.897625590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo172: TfrxMemoView
          Left = 3.779530000000000000
          Top = 291.023810000000000000
          Width = 37.795300000000000000
          Height = 22.677155590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo173: TfrxMemoView
          Left = 41.574830000000000000
          Top = 291.023810000000000000
          Width = 113.385900000000000000
          Height = 22.677155590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#8217#1057#8211#1056#8470#1057#1027#1057#1034#1056#1108#1056#1109#1056#1030#1056#1105#1056#8470' '#1056#183#1056#177#1057#8211#1057#1026
            #1056#1030#1056#1105#1056#1108#1056#187#1057#1035#1057#8225#1056#181#1056#1029#1056#1029#1057#1039' ****')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo174: TfrxMemoView
          Left = 154.960730000000000000
          Top = 291.023810000000000000
          Width = 94.488250000000000000
          Height = 22.677155590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo175: TfrxMemoView
          Left = 249.448980000000000000
          Top = 291.023810000000000000
          Width = 94.488250000000000000
          Height = 22.677155590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo176: TfrxMemoView
          Left = 343.937230000000000000
          Top = 291.023810000000000000
          Width = 94.488250000000000000
          Height = 22.677155590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo177: TfrxMemoView
          Left = 438.425480000000000000
          Top = 291.023810000000000000
          Width = 94.488250000000000000
          Height = 22.677155590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo178: TfrxMemoView
          Left = 532.913730000000000000
          Top = 291.023810000000000000
          Width = 589.606680000000000000
          Height = 22.677155590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo179: TfrxMemoView
          Left = 3.779530000000000000
          Top = 317.480520000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1113#1057#8211#1056#187#1057#1034#1056#1108#1057#8211#1057#1027#1057#8218#1057#1034' '#1057#1026#1057#1039#1056#1169#1056#1108#1057#8211#1056#1030
            '('#1057#1026#1056#1109#1056#183#1056#1169#1057#8211#1056#187' 1)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo180: TfrxMemoView
          Left = 98.267780000000000000
          Top = 321.260050000000000000
          Width = 15.118110240000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo181: TfrxMemoView
          Left = 113.385900000000000000
          Top = 321.260050000000000000
          Width = 15.118110240000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo182: TfrxMemoView
          Left = 128.504020000000000000
          Top = 321.260050000000000000
          Width = 15.118110236220500000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo183: TfrxMemoView
          Left = 143.622140000000000000
          Top = 321.260050000000000000
          Width = 15.118110240000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[R1S]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo184: TfrxMemoView
          Left = 158.740260000000000000
          Top = 321.260050000000000000
          Width = 15.118110240000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[R2S]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo185: TfrxMemoView
          Left = 173.858380000000000000
          Top = 321.260050000000000000
          Width = 15.118110240000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[R3S]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo186: TfrxMemoView
          Left = 188.976500000000000000
          Top = 321.260050000000000000
          Width = 15.118110240000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[R4S]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo187: TfrxMemoView
          Left = 207.874150000000000000
          Top = 317.480520000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1113#1057#8211#1056#187#1057#1034#1056#1108#1057#8211#1057#1027#1057#8218#1057#1034' '#1057#8222#1056#1105#1056#183#1056#1105#1057#8225#1056#1029#1056#1105#1057#8230' '#1056#1109#1057#1027#1057#8211#1056#177
            '('#1057#1026#1056#1109#1056#183#1056#1169#1057#8211#1056#187' 1)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo188: TfrxMemoView
          Left = 328.819110000000000000
          Top = 321.260050000000000000
          Width = 15.118110240000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo189: TfrxMemoView
          Left = 343.937230000000000000
          Top = 321.260050000000000000
          Width = 15.118110240000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo190: TfrxMemoView
          Left = 359.055350000000000000
          Top = 321.260050000000000000
          Width = 15.118110240000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo191: TfrxMemoView
          Left = 374.173470000000000000
          Top = 321.260050000000000000
          Width = 15.118110240000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo192: TfrxMemoView
          Left = 389.291590000000000000
          Top = 321.260050000000000000
          Width = 15.118110240000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo193: TfrxMemoView
          Left = 404.409710000000000000
          Top = 321.260050000000000000
          Width = 15.118110240000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo194: TfrxMemoView
          Left = 423.307360000000000000
          Top = 321.260050000000000000
          Width = 79.370130000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1113#1057#8211#1056#187#1057#1034#1056#1108#1057#8211#1057#1027#1057#8218#1057#1034' '#1057#1027#1057#8218#1056#1109#1057#1026#1057#8211#1056#1029#1056#1109#1056#1108)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo195: TfrxMemoView
          Left = 506.457020000000000000
          Top = 321.260050000000000000
          Width = 15.118110240000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo196: TfrxMemoView
          Left = 521.575140000000000000
          Top = 321.260050000000000000
          Width = 15.118110240000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo197: TfrxMemoView
          Left = 536.693260000000000000
          Top = 321.260050000000000000
          Width = 15.118110240000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo198: TfrxMemoView
          Left = 551.811380000000000000
          Top = 321.260050000000000000
          Width = 15.118110240000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo199: TfrxMemoView
          Left = 566.929500000000000000
          Top = 321.260050000000000000
          Width = 15.118110240000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo200: TfrxMemoView
          Left = 3.779530000000000000
          Top = 351.496290000000000000
          Width = 117.165430000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1113#1056#181#1057#1026#1057#8211#1056#1030#1056#1029#1056#1105#1056#1108' '#1057#1035#1057#1026#1056#1105#1056#1169#1056#1105#1057#8225#1056#1029#1056#1109#1057#8212' '#1056#1109#1057#1027#1056#1109#1056#177#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo201: TfrxMemoView
          Left = 120.944960000000000000
          Top = 355.275820000000000000
          Width = 11.338582680000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '2')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo202: TfrxMemoView
          Left = 132.283550000000000000
          Top = 355.275820000000000000
          Width = 11.338582680000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '2')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo203: TfrxMemoView
          Left = 143.622140000000000000
          Top = 355.275820000000000000
          Width = 11.338582680000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '4')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo204: TfrxMemoView
          Left = 154.960730000000000000
          Top = 355.275820000000000000
          Width = 11.338582680000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '7')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo205: TfrxMemoView
          Left = 166.299320000000000000
          Top = 355.275820000000000000
          Width = 11.338582680000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '7')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo206: TfrxMemoView
          Left = 177.637910000000000000
          Top = 355.275820000000000000
          Width = 11.338582680000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '0')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo207: TfrxMemoView
          Left = 188.976500000000000000
          Top = 355.275820000000000000
          Width = 11.338582680000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '9')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo208: TfrxMemoView
          Left = 200.315090000000000000
          Top = 355.275820000000000000
          Width = 11.338582680000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '5')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo209: TfrxMemoView
          Left = 211.653680000000000000
          Top = 355.275820000000000000
          Width = 11.338582680000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '8')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo210: TfrxMemoView
          Left = 222.992270000000000000
          Top = 355.275820000000000000
          Width = 11.338582680000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '1')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo211: TfrxMemoView
          Left = 238.110390000000000000
          Top = 351.496290000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo212: TfrxMemoView
          Left = 340.157700000000000000
          Top = 351.496290000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1115#1056#160#1056#1113#1056#1032#1056#1031#1056#1116' '#1056#1115#1056#8250#1056#172#1056#8220#1056#1106' '#1056#8217#1056#8224#1056#1113#1056#1118#1056#1115#1056#160#1056#8224#1056#8217#1056#1116#1056#1106)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo213: TfrxMemoView
          Left = 491.338900000000000000
          Top = 351.496290000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '412225')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo214: TfrxMemoView
          Left = 585.827150000000000000
          Top = 351.496290000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1056#1111#1056#1109#1056#1169#1056#176#1056#1029#1056#1029#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo215: TfrxMemoView
          Left = 657.638220000000000000
          Top = 351.496290000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo216: TfrxMemoView
          Left = 687.874460000000000000
          Top = 351.496290000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo217: TfrxMemoView
          Left = 718.110700000000000000
          Top = 351.496290000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo218: TfrxMemoView
          Left = 355.275820000000000000
          Top = 370.393940000000000000
          Width = 94.488250000000000000
          Height = 7.559060000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#8211#1056#1029#1057#8211#1057#8224#1057#8211#1056#176#1056#187#1056#1105', '#1056#1111#1057#1026#1057#8211#1056#183#1056#1030#1056#1105#1057#8240#1056#181')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo219: TfrxMemoView
          Left = 491.338900000000000000
          Top = 370.393940000000000000
          Width = 75.590600000000000000
          Height = 7.559060000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#8218#1056#181#1056#187'.)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo220: TfrxMemoView
          Left = 120.944960000000000000
          Top = 370.393940000000000000
          Width = 113.385900000000000000
          Height = 26.456710000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1056#176#1057#8218#1056#1108#1056#1109#1056#1030#1056#1105#1056#8470' '#1056#1029#1056#1109#1056#1112#1056#181#1057#1026' '#1056#176#1056#177#1056#1109
            #1057#1027#1056#181#1057#1026#1057#8211#1057#1039' '#1057#8218#1056#176' '#1056#1029#1056#1109#1056#1112#1056#181#1057#1026' '#1056#1111#1056#176#1057#1027#1056#1111#1056#1109#1057#1026#1057#8218#1056#176'*'
            #1056#1108#1056#181#1057#1026#1057#8211#1056#1030#1056#1029#1056#1105#1056#1108#1056#176' '#1057#1035#1057#1026#1056#1105#1056#1169#1056#1105#1057#8225#1056#1029#1056#1109#1057#8212' '#1056#1109#1057#1027#1056#1109#1056#177#1056#1105')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo221: TfrxMemoView
          Top = 411.968770000000000000
          Width = 117.165430000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8220#1056#1109#1056#187#1056#1109#1056#1030#1056#1029#1056#1105#1056#8470' '#1056#177#1057#1107#1057#8230#1056#1110#1056#176#1056#187#1057#8218#1056#181#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo222: TfrxMemoView
          Left = 120.944960000000000000
          Top = 434.645950000000000000
          Width = 113.385900000000000000
          Height = 26.456710000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1056#1109#1056#1169#1056#176#1057#8218#1056#1108#1056#1109#1056#1030#1056#1105#1056#8470' '#1056#1029#1056#1109#1056#1112#1056#181#1057#1026' '#1056#176#1056#177#1056#1109
            #1057#1027#1056#181#1057#1026#1057#8211#1057#1039' '#1057#8218#1056#176' '#1056#1029#1056#1109#1056#1112#1056#181#1057#1026' '#1056#1111#1056#176#1057#1027#1056#1111#1056#1109#1057#1026#1057#8218#1056#176'*'
            #1056#1108#1056#181#1057#1026#1057#8211#1056#1030#1056#1029#1056#1105#1056#1108#1056#176' '#1057#1035#1057#1026#1056#1105#1056#1169#1056#1105#1057#8225#1056#1029#1056#1109#1057#8212' '#1056#1109#1057#1027#1056#1109#1056#177#1056#1105')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo223: TfrxMemoView
          Left = 117.165430000000000000
          Top = 415.748300000000000000
          Width = 11.338582680000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '2')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo224: TfrxMemoView
          Left = 128.504020000000000000
          Top = 415.748300000000000000
          Width = 11.338582680000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '0')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo225: TfrxMemoView
          Left = 139.842610000000000000
          Top = 415.748300000000000000
          Width = 11.338582680000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '3')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo226: TfrxMemoView
          Left = 151.181200000000000000
          Top = 415.748300000000000000
          Width = 11.338582680000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '5')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo227: TfrxMemoView
          Left = 162.519790000000000000
          Top = 415.748300000000000000
          Width = 11.338582680000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '9')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo228: TfrxMemoView
          Left = 173.858380000000000000
          Top = 415.748300000000000000
          Width = 11.338582680000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '0')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo229: TfrxMemoView
          Left = 185.196970000000000000
          Top = 415.748300000000000000
          Width = 11.338582680000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '5')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo230: TfrxMemoView
          Left = 196.535560000000000000
          Top = 415.748300000000000000
          Width = 11.338582680000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '6')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo231: TfrxMemoView
          Left = 207.874150000000000000
          Top = 415.748300000000000000
          Width = 11.338582680000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '4')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo232: TfrxMemoView
          Left = 219.212740000000000000
          Top = 415.748300000000000000
          Width = 11.338582680000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '0')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo233: TfrxMemoView
          Left = 238.110390000000000000
          Top = 415.748300000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo234: TfrxMemoView
          Left = 238.110390000000000000
          Top = 370.393940000000000000
          Width = 94.488250000000000000
          Height = 7.559060000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1057#8211#1056#1169#1056#1111#1056#1105#1057#1027')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo235: TfrxMemoView
          Left = 238.110390000000000000
          Top = 434.645950000000000000
          Width = 94.488250000000000000
          Height = 7.559060000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1057#8211#1056#1169#1056#1111#1056#1105#1057#1027')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo236: TfrxMemoView
          Left = 340.157700000000000000
          Top = 415.748300000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8216#1056#8222#1056#8250#1056#1115#1056#1032#1056#1038#1056#1115#1056#8217#1056#1106' '#1056#8250#1056#174#1056#8216#1056#1115#1056#8217' '#1056#8224#1056#8217#1056#1106#1056#1116#1056#8224#1056#8217#1056#1116#1056#1106)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo237: TfrxMemoView
          Left = 355.275820000000000000
          Top = 434.645950000000000000
          Width = 94.488250000000000000
          Height = 7.559060000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#8211#1056#1029#1057#8211#1057#8224#1057#8211#1056#176#1056#187#1056#1105', '#1056#1111#1057#1026#1057#8211#1056#183#1056#1030#1056#1105#1057#8240#1056#181')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo238: TfrxMemoView
          Left = 491.338900000000000000
          Top = 415.748300000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '416239')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo239: TfrxMemoView
          Left = 491.338900000000000000
          Top = 434.645950000000000000
          Width = 75.590600000000000000
          Height = 7.559060000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#8218#1056#181#1056#187'.)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo240: TfrxMemoView
          Left = 574.488560000000000000
          Top = 408.189240000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1030#1056#181#1056#1169#1056#181#1056#1029#1056#176' '#1057#8211#1056#1029#1057#8222#1056#1109#1057#1026#1056#1112#1056#176#1057#8224#1057#8211#1057#1039' '#1057#8221' '#1056#1111#1057#1026#1056#176#1056#1030#1056#1105#1056#187#1057#1034#1056#1029#1056#1109#1057#1035)
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object cds1DF: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'lineno'
        DataType = ftInteger
      end
      item
        Name = 'INN'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PIB'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'summaAdd'
        DataType = ftFloat
      end
      item
        Name = 'summaPod'
        DataType = ftFloat
      end
      item
        Name = 'ozndox'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'dataPri'
        DataType = ftDate
      end
      item
        Name = 'dataUw'
        DataType = ftDate
      end
      item
        Name = 'oznpilg'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'oznaka'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 328
    Top = 264
    Data = {
      EC0000009619E0BD01000000180000000A000000000003000000EC00066C696E
      656E6F040001000000000003494E4E0100490000000100055749445448020002
      000A000350494201004900000001000557494454480200020032000873756D6D
      6141646408000400000000000873756D6D61506F640800040000000000066F7A
      6E646F7801004900000001000557494454480200020002000764617461507269
      0400060000000000066461746155770400060000000000076F7A6E70696C6701
      00490000000100055749445448020002000200066F7A6E616B61010049000000
      01000557494454480200020014000000}
    object cds1DFlineno: TIntegerField
      FieldName = 'lineno'
    end
    object cds1DFINN: TStringField
      FieldName = 'INN'
      Size = 10
    end
    object cds1DFPIB: TStringField
      FieldName = 'PIB'
      Size = 50
    end
    object cds1DFsummaAdd: TFloatField
      FieldName = 'summaAdd'
    end
    object cds1DFsummaPod: TFloatField
      FieldName = 'summaPod'
    end
    object cds1DFozndox: TStringField
      FieldName = 'ozndox'
      Size = 2
    end
    object cds1DFdataPri: TDateField
      FieldName = 'dataPri'
    end
    object cds1DFdataUw: TDateField
      FieldName = 'dataUw'
    end
    object cds1DFoznpilg: TStringField
      FieldName = 'oznpilg'
      Size = 2
    end
    object cds1DFoznaka: TStringField
      FieldName = 'oznaka'
    end
  end
  object frxDBPrint: TfrxDBDataset
    UserName = 'frxDBPrint'
    CloseDataSource = False
    DataSet = cds1DF
    Left = 392
    Top = 264
  end
end
