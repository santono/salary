object FormPlatReestr: TFormPlatReestr
  Left = 223
  Top = 165
  Width = 696
  Height = 480
  Caption = #1056#1077#1077#1089#1090#1088' '#1087#1083#1072#1090#1077#1078#1085#1099#1093' '#1074#1077#1076#1086#1084#1086#1089#1090#1077#1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    680
    442)
  PixelsPerInch = 96
  TextHeight = 20
  object LabelHea: TLabel
    Left = 7
    Top = 5
    Width = 4
    Height = 20
    Caption = ' '
  end
  object dxDBGridPlatReestr: TdxDBGrid
    Left = 16
    Top = 32
    Width = 673
    Height = 369
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    ShowSummaryFooter = True
    SummaryGroups = <
      item
        DefaultGroup = False
        SummaryItems = <
          item
            ColumnName = 'dxDBGridPlatReestrSUMMATOT'
            SummaryField = 'SUMMATOT'
            SummaryFormat = '0.##'
            SummaryType = cstSum
          end>
        Name = 'dxDBGridPlatReestrSummaryGroup2'
      end>
    SummarySeparator = ', '
    PopupMenu = PopupMenu1
    TabOrder = 0
    DataSource = DataSourcePlatReestr
    Filter.Criteria = {00000000}
    OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoTabThrough, edgoVertThrough]
    OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridPlatReestrNOMER: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 39
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NOMER'
    end
    object dxDBGridPlatReestrNameGru: TdxDBGridColumn
      Caption = #1057#1095#1077#1090
      HeaderAlignment = taCenter
      Sorted = csDown
      Visible = False
      Width = 53
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAMEGRU'
      SummaryFooterType = cstSum
      SummaryFooterField = 'SUMMATOT'
      SummaryFooterFormat = '0.00'
      GroupIndex = 0
      SummaryType = cstSum
      SummaryField = 'SUMMATOT'
      SummaryFormat = '0.00'
      SummaryGroupName = 'dxDBGridPlatReestrSummaryGroup2'
    end
    object dxDBGridPlatReestrSHIFRPOD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 41
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRPOD'
    end
    object dxDBGridPlatReestrNAME: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 386
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
    object dxDBGridPlatReestrNMBOFREC: TdxDBGridMaskColumn
      Caption = #1050'-'#1074#1086
      HeaderAlignment = taCenter
      Width = 41
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NMBOFREC'
      SummaryFooterType = cstSum
      SummaryFooterField = 'NMBOFREC'
      SummaryType = cstSum
      SummaryField = 'NMBOFREC'
    end
    object dxDBGridPlatReestrSUMMATOT: TdxDBGridCurrencyColumn
      Caption = #1057#1091#1084#1084#1072
      HeaderAlignment = taCenter
      Width = 41
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMATOT'
      SummaryFooterType = cstSum
      SummaryFooterField = 'SUMMATOT'
      DisplayFormat = ',0.00'
      Nullable = False
      SummaryField = 'SUMMATOT'
    end
    object dxDBGridPlatReestrDATEWRK: TdxDBGridDateColumn
      Caption = #1044#1072#1090#1072
      HeaderAlignment = taCenter
      Width = 68
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATEWRK'
    end
    object dxDBGridPlatReestrShifrGru: TdxDBGridColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRGRU'
      SummaryType = cstSum
      SummaryField = 'SUMMATOT'
      SummaryFormat = '0.00'
      SummaryGroupName = 'dxDBGridPlatReestrSummaryGroup2'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 400
    Width = 231
    Height = 25
    DataSource = DataSourcePlatReestr
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel, nbRefresh]
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object CheckBoxASCIIPrinter: TCheckBox
    Left = 480
    Top = 408
    Width = 185
    Height = 17
    Anchors = [akRight, akBottom]
    Caption = #1052#1072#1090#1088#1080#1095#1085#1099#1081' '#1087#1088#1080#1085#1090#1077#1088
    TabOrder = 2
  end
  object CheckBoxAllPltWed: TCheckBox
    Left = 280
    Top = 408
    Width = 161
    Height = 17
    Anchors = [akRight, akBottom]
    Caption = #1042#1089#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
    TabOrder = 3
  end
  object pFIBDataSetPlatRee: TpFIBDataSet
    SelectSQL.Strings = (
      'select tb_plat_hat.nomer,tb_plat_hat.shifrpod,podr.name,'
      'tb_plat_hat.nmbofrec,tb_plat_hat.summatot,tb_plat_hat.datewrk,'
      'tb_plat_hat.ShifrId,tb_plat_hat.ShifrGru,gruppy.name as namegru'
      '  from  tb_plat_hat join podr on'
      'tb_plat_hat.shifrpod=podr.shifrpod'
      'join gruppy on gruppy.shifr=tb_plat_hat.ShifrGru'
      'where tb_plat_hat.monthvy   = :MonthVy    and'
      '      tb_plat_hat.yearvy    = :YearVy     and'
      '      tb_plat_hat.shifrban  = :ShifrBan   and'
      '      tb_plat_hat.shifrsta  = :ShifrSta   and'
      '      tb_plat_hat.mode_u_k  = :Mode_U_K'
      'order by tb_plat_hat.nomer')
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    Left = 88
    Top = 120
    object pFIBDataSetPlatReeNOMER: TFIBIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'NOMER'
      ReadOnly = True
    end
    object pFIBDataSetPlatReeSHIFRPOD: TFIBSmallIntField
      DisplayLabel = #1055#1076#1088
      FieldName = 'SHIFRPOD'
      ReadOnly = True
    end
    object pFIBDataSetPlatReeNAME: TFIBStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      FieldName = 'NAME'
      ReadOnly = True
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSetPlatReeNMBOFREC: TFIBSmallIntField
      FieldName = 'NMBOFREC'
      ReadOnly = True
    end
    object pFIBDataSetPlatReeSUMMATOT: TFIBBCDField
      FieldName = 'SUMMATOT'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetPlatReeDATEWRK: TFIBDateTimeField
      FieldName = 'DATEWRK'
      ReadOnly = True
    end
    object pFIBDataSetPlatReeSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      ReadOnly = True
    end
    object pFIBDataSetPlatReeSHIFRGRU: TFIBSmallIntField
      FieldName = 'SHIFRGRU'
    end
    object pFIBDataSetPlatReeNAMEGRU: TFIBStringField
      FieldName = 'NAMEGRU'
      EmptyStrToNull = True
    end
  end
  object DataSourcePlatReestr: TDataSource
    DataSet = pFIBDataSetPlatRee
    Left = 176
    Top = 128
  end
  object PopupMenu1: TPopupMenu
    Left = 24
    Top = 104
    object N1: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
      OnClick = N1Click
      object N5: TMenuItem
        Caption = #1055#1077#1095#1072#1090#1100
        OnClick = N5Click
      end
      object FR3: TMenuItem
        Caption = #1055#1077#1095#1072#1090#1100' FR'
        OnClick = FR3Click
      end
    end
    object N2: TMenuItem
      Caption = #1056#1077#1077#1089#1090#1088
      OnClick = N2Click
    end
    object FR1: TMenuItem
      Caption = #1056#1077#1077#1089#1090#1088' FR'
      OnClick = FR1Click
      object FR2: TMenuItem
        Caption = #1056#1077#1077#1089#1090#1088' FR'
        OnClick = FR2Click
      end
      object EPSON1: TMenuItem
        Caption = #1056#1077#1077#1089#1090#1088' EPSON'
        OnClick = EPSON1Click
      end
    end
    object N3: TMenuItem
      Caption = #1055#1091#1090#1100' '#1082' '#1092#1072#1081#1083#1072#1084' '#1076#1083#1103' '#1076#1080#1089#1082#1077#1090#1099
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1082#1072' '#1076#1080#1089#1082#1077#1090#1099
      OnClick = N4Click
    end
    object DBF1: TMenuItem
      Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1082#1072' DBF '#1076#1083#1103' '#1073#1072#1085#1082#1072
      OnClick = DBF1Click
    end
    object N6: TMenuItem
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      OnClick = N6Click
    end
  end
  object frxReport1: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40132.764034282410000000
    ReportOptions.LastChange = 40132.874735960650000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    Left = 256
    Top = 144
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = ' Head'
        Value = Null
      end
      item
        Name = 'Month'
        Value = ''
      end
      item
        Name = 'Year'
        Value = ''
      end
      item
        Name = 'ShifrNameSta'
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
        Height = 79.370130000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo19: TfrxMemoView
          Width = 718.110700000000000000
          Height = 75.590600000000000000
          Color = 15790320
          Frame.Color = 15790320
        end
        object Memo14: TfrxMemoView
          Left = 75.590600000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            #1056#160#1056#181#1056#181#1057#1027#1057#8218#1057#1026' '#1056#1111#1056#187#1056#176#1057#8218#1056#181#1056#182#1056#1029#1057#8249#1057#8230' '#1056#1030#1056#181#1056#1169#1056#1109#1056#1112#1056#1109#1057#1027#1057#8218#1056#181#1056#8470' '#1056#183#1056#176' ')
        end
        object Memo15: TfrxMemoView
          Left = 298.582870000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            '[Month]')
        end
        object Memo17: TfrxMemoView
          Left = 75.590600000000000000
          Top = 22.677180000000000000
          Width = 461.102660000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            '[ShifrNameSta]')
        end
        object Memo20: TfrxMemoView
          Left = 7.559060000000000000
          Top = 56.692949999999990000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#1109#1056#1112#1056#181#1057#1026)
        end
        object Memo21: TfrxMemoView
          Left = 64.252010000000000000
          Top = 56.692949999999990000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#8225#1056#181#1057#8218)
        end
        object Memo22: TfrxMemoView
          Left = 117.165430000000000000
          Top = 56.692949999999990000
          Width = 408.189240000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181)
        end
        object Memo23: TfrxMemoView
          Left = 525.354670000000000000
          Top = 56.692949999999990000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113'-'#1056#1030#1056#1109)
        end
        object Memo24: TfrxMemoView
          Left = 604.724800000000000000
          Top = 56.692949999999990000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 158.740260000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset1."SHIFRGRU"'
        object Memo18: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Color = 15790320
        end
        object Memo8: TfrxMemoView
          Left = 7.559060000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = 'NAMEGRU'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8 = (
            '[frxDBDataset1."NAMEGRU"]')
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo1: TfrxMemoView
          Left = 7.559060000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataField = 'NOMER'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8 = (
            '[frxDBDataset1."NOMER"]')
        end
        object Memo3: TfrxMemoView
          Left = 158.740260000000000000
          Width = 366.614410000000000000
          Height = 18.897650000000000000
          DataField = 'NAME'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8 = (
            '[frxDBDataset1."NAME"]')
        end
        object Memo4: TfrxMemoView
          Left = 117.165430000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataField = 'SHIFRPOD'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8 = (
            '[frxDBDataset1."SHIFRPOD"]')
        end
        object Memo5: TfrxMemoView
          Left = 64.252010000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'NAMEGRU'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8 = (
            '[frxDBDataset1."NAMEGRU"]')
        end
        object Memo6: TfrxMemoView
          Left = 525.354670000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."NMBOFREC"]')
        end
        object Memo2: TfrxMemoView
          Left = 604.724800000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."SUMMATOT" #n%2,2n]')
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 249.448980000000000000
        Width = 718.110700000000000000
        object Memo16: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Color = 15790320
        end
        object Memo9: TfrxMemoView
          Left = 604.724800000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."SUMMATOT">,MasterData1) #n%2,2n]')
        end
        object Memo12: TfrxMemoView
          Left = 41.574830000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109)
        end
        object Memo13: TfrxMemoView
          Left = 105.826840000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataField = 'NAMEGRU'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8 = (
            '[frxDBDataset1."NAMEGRU"]')
        end
      end
      object Footer1: TfrxFooter
        Height = 22.677180000000000000
        Top = 294.803340000000000000
        Width = 718.110700000000000000
        object Memo11: TfrxMemoView
          Left = 22.677180000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            #1056#152' '#1057#8218' '#1056#1109' '#1056#1110' '#1056#1109)
        end
        object Memo7: TfrxMemoView
          Left = 3.779530000000000000
          Width = 714.331170000000000000
          Height = 18.897650000000000000
          Color = 15790320
        end
        object Memo10: TfrxMemoView
          Left = 604.724800000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."SUMMATOT">,MasterData1) #n%2,2n]')
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = pFIBDataSetPlatRee
    Left = 280
    Top = 184
  end
  object frxDotMatrixExport1: TfrxDotMatrixExport
    UseFileCache = True
    ShowProgress = True
    EscModel = 0
    GraphicFrames = False
    SaveToFile = False
    UseIniSettings = True
    Left = 192
    Top = 184
  end
  object frxReport2: TfrxReport
    Version = '4.3'
    DotMatrixReport = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40136.662293113400000000
    ReportOptions.LastChange = 42152.682712546300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReport2GetValue
    Left = 432
    Top = 128
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = ' Header'
        Value = Null
      end
      item
        Name = 'M'
        Value = Null
      end
      item
        Name = 'StaList'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxDMPPage
      PaperWidth = 210.819863845504600000
      PaperHeight = 296.862308276425900000
      PaperSize = 9
      LeftMargin = 2.539998359584393000
      RightMargin = 2.539998359584393000
      TopMargin = 4.497913761764029000
      BottomMargin = 4.497913761764029000
      FontStyle = []
      object ReportTitle1: TfrxReportTitle
        Height = 34.000000000000000000
        Top = 17.000000000000000000
        Width = 777.600000000000000000
        object DMPMemo1: TfrxDMPMemoView
          Align = baWidth
          Width = 777.600000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#181#1056#181#1057#1027#1057#8218#1057#1026' '#1056#1111#1056#187#1056#176#1057#8218#1056#181#1056#182#1056#1029#1057#8249#1057#8230' '#1056#1030#1056#181#1056#1169#1056#1109#1056#1112#1056#1109#1057#1027#1057#8218#1056#181#1056#8470' '#1056#183#1056#176' [M]')
          VAlign = vaCenter
        end
        object DMPMemo27: TfrxDMPMemoView
          Top = 17.000000000000000000
          Width = 604.800000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[StaList]')
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 51.000000000000000000
        Top = 68.000000000000000000
        Width = 777.600000000000000000
        object DMPMemo3: TfrxDMPMemoView
          Left = 9.600000000000000000
          Top = 17.000000000000000000
          Width = 48.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            #1056#1116#1056#1109#1056#1112#1056#181#1057#1026)
        end
        object DMPMemo5: TfrxDMPMemoView
          Left = 67.200000000000000000
          Top = 17.000000000000000000
          Width = 403.200000000000000000
          Height = 17.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181)
        end
        object DMPMemo6: TfrxDMPMemoView
          Left = 480.000000000000000000
          Top = 17.000000000000000000
          Width = 124.800000000000000000
          Height = 17.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
        end
        object DMPMemo20: TfrxDMPMemoView
          Top = 17.000000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo21: TfrxDMPMemoView
          Left = 57.600000000000000000
          Top = 17.000000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo4: TfrxDMPMemoView
          Left = 470.400000000000000000
          Top = 17.000000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo22: TfrxDMPMemoView
          Left = 604.800000000000000000
          Top = 17.000000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo23: TfrxDMPMemoView
          Top = 34.000000000000000000
          Width = 614.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':-----:------------------------------------------:-------------:')
        end
        object DMPMemo24: TfrxDMPMemoView
          Width = 614.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':--------------------------------------------------------------:')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 17.000000000000000000
        Top = 153.000000000000000000
        Width = 777.600000000000000000
        Condition = 'frxDBDataset1."NAMEGRU"'
        object DMPMemo2: TfrxDMPMemoView
          Align = baWidth
          Left = 9.600000000000000000
          Width = 595.200000000000000000
          Height = 17.000000000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8 = (
            '[frxDBDataset1."NAMEGRU"]')
          VAlign = vaCenter
        end
        object DMPMemo19: TfrxDMPMemoView
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo32: TfrxDMPMemoView
          Left = 604.800000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
      end
      object MasterData1: TfrxMasterData
        Height = 17.000000000000000000
        Top = 187.000000000000000000
        Width = 777.600000000000000000
        AllowSplit = True
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object DMPMemo7: TfrxDMPMemoView
          Left = 9.600000000000000000
          Width = 48.000000000000000000
          Height = 17.000000000000000000
          DataField = 'NOMER'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8 = (
            '[frxDBDataset1."NOMER"]')
        end
        object DMPMemo8: TfrxDMPMemoView
          Left = 67.200000000000000000
          Width = 28.800000000000000000
          Height = 17.000000000000000000
          DataField = 'SHIFRPOD'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8 = (
            '[frxDBDataset1."SHIFRPOD"]')
        end
        object DMPMemo9: TfrxDMPMemoView
          Left = 105.600000000000000000
          Width = 364.800000000000000000
          Height = 17.000000000000000000
          StretchMode = smActualHeight
          DataField = 'NAME'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8 = (
            '[frxDBDataset1."NAME"]')
        end
        object DMPMemo10: TfrxDMPMemoView
          Left = 480.000000000000000000
          Width = 124.800000000000000000
          Height = 17.000000000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."SUMMATOT" #n%2,2n]')
        end
        object DMPMemo14: TfrxDMPMemoView
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo15: TfrxDMPMemoView
          Left = 57.600000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo16: TfrxDMPMemoView
          Left = 96.000000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo17: TfrxDMPMemoView
          Left = 470.400000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo18: TfrxDMPMemoView
          Left = 604.800000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 17.000000000000000000
        Top = 221.000000000000000000
        Width = 777.600000000000000000
        object DMPMemo13: TfrxDMPMemoView
          Left = 480.000000000000000000
          Width = 124.800000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."SUMMATOT">,MasterData1) #n%2,2n]')
        end
        object DMPMemo25: TfrxDMPMemoView
          Left = 9.600000000000000000
          Width = 144.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1057#1027#1057#8225#1056#181#1057#8218#1057#1107)
        end
        object DMPMemo26: TfrxDMPMemoView
          Left = 153.600000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[frxDBDataset1."NAMEGRU"]')
        end
        object DMPMemo29: TfrxDMPMemoView
          Left = 470.400000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo30: TfrxDMPMemoView
          Left = 604.800000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo31: TfrxDMPMemoView
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 17.000000000000000000
        Top = 340.000000000000000000
        Width = 777.600000000000000000
        object DMPMemo11: TfrxDMPMemoView
          Left = 9.600000000000000000
          Width = 403.200000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1026#1056#176#1056#1029#1056#1105#1057#8224#1056#176' [Page] '#1056#8221#1056#176#1057#8218#1056#176' [Date] '#1056#8217#1057#1026#1056#181#1056#1112#1057#1039' [Time]')
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 51.000000000000000000
        Top = 272.000000000000000000
        Width = 777.600000000000000000
        object DMPMemo12: TfrxDMPMemoView
          Left = 19.200000000000000000
          Top = 17.000000000000000000
          Width = 163.200000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1057#1026#1056#181#1056#181#1057#1027#1057#8218#1057#1026#1057#1107)
        end
        object DMPMemo28: TfrxDMPMemoView
          Left = 480.000000000000000000
          Top = 17.000000000000000000
          Width = 124.800000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."SUMMATOT">,MasterData1) #n%2,2n]')
        end
        object DMPMemo33: TfrxDMPMemoView
          Left = 470.400000000000000000
          Top = 17.000000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo34: TfrxDMPMemoView
          Left = 604.800000000000000000
          Top = 17.000000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo35: TfrxDMPMemoView
          Top = 17.000000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo36: TfrxDMPMemoView
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo37: TfrxDMPMemoView
          Left = 604.800000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo38: TfrxDMPMemoView
          Left = 470.400000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo39: TfrxDMPMemoView
          Left = 9.600000000000000000
          Width = 460.800000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '------------------------------------------------')
        end
        object DMPMemo40: TfrxDMPMemoView
          Left = 480.000000000000000000
          Width = 124.800000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '-------------')
        end
        object DMPMemo41: TfrxDMPMemoView
          Top = 34.000000000000000000
          Width = 614.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '----------------------------------------------------------------')
        end
      end
    end
  end
  object frxReport3: TfrxReport
    Version = '4.3'
    DotMatrixReport = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40137.995719039300000000
    ReportOptions.LastChange = 43081.756600092590000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnManualBuild = frxReport3ManualBuild
    Left = 408
    Top = 200
    Datasets = <>
    Variables = <
      item
        Name = ' Hat'
        Value = Null
      end
      item
        Name = 'NAMESTA'
        Value = Null
      end
      item
        Name = 'NOMER'
        Value = Null
      end
      item
        Name = 'NAMEPODR'
        Value = Null
      end
      item
        Name = 'PAGENO'
        Value = Null
      end
      item
        Name = 'NAMEGRU'
        Value = Null
      end
      item
        Name = 'NAMEORGHAT'
        Value = Null
      end
      item
        Name = ' Line'
        Value = Null
      end
      item
        Name = 'LINENO'
        Value = Null
      end
      item
        Name = 'FIO'
        Value = Null
      end
      item
        Name = 'TABNO'
        Value = Null
      end
      item
        Name = 'SUMMA'
        Value = Null
      end
      item
        Name = ' PAGEFOT'
        Value = Null
      end
      item
        Name = 'PAGESUMMA'
        Value = Null
      end
      item
        Name = ' PODRFOT'
        Value = Null
      end
      item
        Name = 'PODRSUMMA'
        Value = Null
      end
      item
        Name = 'DirektName'
        Value = '<DirektName><DirektName><DirektName>'
      end
      item
        Name = 'GlBuhName'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxDMPPage
      PaperWidth = 210.819863845504600000
      PaperHeight = 296.862308276425900000
      PaperSize = 9
      LeftMargin = 2.539998359584390000
      RightMargin = 2.539998359584390000
      TopMargin = 4.497913761764030000
      BottomMargin = 4.497913761764030000
      FontStyle = []
      object MasterDataHat: TfrxMasterData
        Height = 153.000000000000000000
        Top = 17.000000000000000000
        Width = 777.600000000000000000
        RowCount = 0
        object DMPMemo1: TfrxDMPMemoView
          Left = 182.400000000000000000
          Width = 67.200000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            #1056#1032#1056#1113#1056#160#1056#1106#1056#8225#1056#1116#1056#1106)
        end
        object DMPMemo2: TfrxDMPMemoView
          Left = 38.400000000000000000
          Top = 17.000000000000000000
          Width = 499.200000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            '[NAMEORGHAT]')
        end
        object DMPMemo3: TfrxDMPMemoView
          Top = 85.000000000000000000
          Width = 614.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '----------------------------------------------------------------')
        end
        object DMPMemo4: TfrxDMPMemoView
          Top = 136.000000000000000000
          Width = 614.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':---:--------------------:--:-----:------------:---------------:')
        end
        object DMPMemo5: TfrxDMPMemoView
          Top = 102.000000000000000000
          Width = 614.400000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            
              ': N :     '#1056#1119#1056#160#1056#8224#1056#8212#1056#8217#1056#152#1056#169#1056#8226'       :  : '#1056#1118#1056#1106#1056#8216' :    '#1056#1038#1056#1032#1056#1114#1056#1106'    : ' +
              '  '#1056#1119#1056#8224#1056#8221#1056#1119#1056#152#1056#1038' '#1056#1119#1056#160#1056#1115'  :')
        end
        object DMPMemo6: TfrxDMPMemoView
          Top = 119.000000000000000000
          Width = 614.400000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            
              ':'#1056#1119'/'#1056#1119':  '#1056#8224#39#1056#1114#1056#1031' '#1056#1119#1056#1115#1056#8216#1056#1106#1056#1118#1056#172#1056#1113#1056#1115#1056#8217#1056#8224'   :  :  N  :            : ' +
              '  '#1056#1115#1056#8221#1056#8226#1056#160#1056#8211#1056#1106#1056#1116#1056#1116#1056#1031'   :')
        end
        object DMPMemo7: TfrxDMPMemoView
          Left = 38.400000000000000000
          Top = 34.000000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            #1056#8217#1056#8224#1056#8221#1056#1115#1056#1114#1056#8224#1056#1038#1056#1118#1056#172)
        end
        object DMPMemo8: TfrxDMPMemoView
          Left = 518.400000000000000000
          Top = 34.000000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[NOMER]')
        end
        object DMPMemo11: TfrxDMPMemoView
          Left = 38.400000000000000000
          Top = 68.000000000000000000
          Width = 470.400000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[NAMEPODR]')
        end
        object DMPMemo10: TfrxDMPMemoView
          Left = 518.400000000000000000
          Top = 68.000000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#8250#1056#1105#1057#1027#1057#8218' '#1074#8222#8211'[PAGENO]')
        end
        object DMPMemo9: TfrxDMPMemoView
          Left = 38.400000000000000000
          Top = 51.000000000000000000
          Width = 576.000000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[NAMEGRU]')
        end
        object DMPMemo33: TfrxDMPMemoView
          Left = 134.400000000000000000
          Top = 34.000000000000000000
          Width = 384.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[NAMESTA]')
        end
      end
      object MasterDataLine: TfrxMasterData
        Height = 34.000000000000000000
        Top = 187.000000000000000000
        Width = 777.600000000000000000
        RowCount = 0
        object DMPMemo12: TfrxDMPMemoView
          Top = 17.000000000000000000
          Width = 614.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':   :                    :  :     :            :               :')
        end
        object DMPMemo13: TfrxDMPMemoView
          Width = 614.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':   :                    :  :     :            :               :')
        end
        object DMPMemo15: TfrxDMPMemoView
          Left = 336.000000000000000000
          Width = 115.200000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUMMA]')
        end
        object DMPMemo16: TfrxDMPMemoView
          Left = 278.400000000000000000
          Width = 48.000000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[TABNO]')
        end
        object DMPMemo17: TfrxDMPMemoView
          Left = 48.000000000000000000
          Width = 192.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[FIO]')
        end
        object DMPMemo21: TfrxDMPMemoView
          Left = 9.600000000000000000
          Width = 28.800000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[LINENO]')
        end
      end
      object MasterDataPage: TfrxMasterData
        Height = 51.000000000000000000
        Top = 238.000000000000000000
        Width = 777.600000000000000000
        RowCount = 0
        object DMPMemo18: TfrxDMPMemoView
          Width = 614.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':---:--------------------:--:-----:------------:---------------:')
        end
        object DMPMemo19: TfrxDMPMemoView
          Top = 34.000000000000000000
          Width = 614.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '----------------------------------------------------------------')
        end
        object DMPMemo20: TfrxDMPMemoView
          Top = 17.000000000000000000
          Width = 614.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            
              ':  '#1056#1032#1056#1038#1056#172#1056#1115#1056#8220#1056#1115' '#1056#1119#1056#1115' '#1056#1038#1056#1118#1056#1115#1056#160'I'#1056#1116#1056#166'I             :            :  ' +
              '             :')
        end
        object DMPMemo14: TfrxDMPMemoView
          Left = 336.000000000000000000
          Top = 17.000000000000000000
          Width = 115.200000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[PAGESUMMA]')
        end
      end
      object MasterDataFot: TfrxMasterData
        Height = 255.000000000000000000
        Top = 306.000000000000000000
        Width = 777.600000000000000000
        RowCount = 0
        object DMPMemo22: TfrxDMPMemoView
          Width = 614.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            
              ':'#1056#1032#1056#1038#1056#172#1056#1115#1056#8220#1056#1115' '#1056#1119#1056#1115'                        :            :        ' +
              '       :')
        end
        object DMPMemo23: TfrxDMPMemoView
          Top = 17.000000000000000000
          Width = 614.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '----------------------------------------------------------------')
        end
        object DMPMemo24: TfrxDMPMemoView
          Left = 336.000000000000000000
          Width = 115.200000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[PODRSUMMA]')
        end
        object DMPMemo25: TfrxDMPMemoView
          Top = 34.000000000000000000
          Width = 614.400000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            
              ': '#1056#8212#1056#176' '#1057#8224#1057#8211#1057#8221#1057#1035' '#1056#1030#1057#8211#1056#1169#1056#1109#1056#1112#1057#8211#1057#1027#1057#8218#1057#1035' '#1056#1030#1056#1105#1056#1111#1056#187#1056#176#1057#8218' '#1056#1030#1056#1105#1056#1111#1056#187#1056#176#1057#8225#1056#181#1056#1029 +
              #1056#1109' '#1056#1110#1057#1026#1056#1029'.                      :')
        end
        object DMPMemo26: TfrxDMPMemoView
          Top = 51.000000000000000000
          Width = 614.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':                                                              :')
        end
        object DMPMemo28: TfrxDMPMemoView
          Top = 85.000000000000000000
          Width = 614.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':                                                              :')
        end
        object DMPMemo29: TfrxDMPMemoView
          Top = 136.000000000000000000
          Width = 614.400000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            
              ': '#1056#8216#1057#1107#1057#8230#1056#1110#1056#176#1056#187#1057#8218#1056#181#1057#1026'                                            ' +
              '        :')
        end
        object DMPMemo30: TfrxDMPMemoView
          Top = 153.000000000000000000
          Width = 614.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '----------------------------------------------------------------')
        end
        object DMPMemo31: TfrxDMPMemoView
          Left = 28.800000000000000000
          Top = 68.000000000000000000
          Width = 547.200000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            '[DirektName]                                          ')
        end
        object DMPMemo32: TfrxDMPMemoView
          Left = 28.800000000000000000
          Top = 102.000000000000000000
          Width = 547.200000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            '[GlBuhName]                                            ')
        end
        object DMPMemo34: TfrxDMPMemoView
          Left = 105.600000000000000000
          Width = 220.800000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[NAMEPODR]')
        end
        object DMPMemo27: TfrxDMPMemoView
          Top = 119.000000000000000000
          Width = 614.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':                                                              :')
        end
        object DMPMemo35: TfrxDMPMemoView
          Top = 68.000000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo36: TfrxDMPMemoView
          Left = 604.800000000000000000
          Top = 68.000000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo37: TfrxDMPMemoView
          Left = 604.800000000000000000
          Top = 102.000000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo38: TfrxDMPMemoView
          Top = 102.000000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            ':')
        end
      end
    end
  end
end
