object FormRptDolgSummy: TFormRptDolgSummy
  Left = 262
  Top = 143
  Width = 671
  Height = 149
  Caption = #1057#1087#1080#1089#1086#1082' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1087#1086' '#1076#1086#1083#1078#1085#1086#1089#1090#1103#1084
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 20
  object Button1: TButton
    Left = 16
    Top = 64
    Width = 75
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object BitBtn1: TBitBtn
    Left = 536
    Top = 64
    Width = 89
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 16
    Width = 609
    Height = 17
    TabOrder = 2
  end
  object btn1: TButton
    Left = 192
    Top = 64
    Width = 337
    Height = 25
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081', '#1082#1072#1090#1077#1075#1086#1088#1080#1081' '#1080' '#1089#1095#1077#1090#1086#1074
    TabOrder = 3
    OnClick = btn1Click
  end
  object frxReportDS: TfrxReport
    Version = '4.3'
    DataSet = frxUserDataSetDS
    DataSetName = 'frxUserDataSetDS'
    DotMatrixReport = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40564.625080138890000000
    ReportOptions.LastChange = 40717.980434745370000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReportDSGetValue
    Left = 96
    Top = 64
    Datasets = <
      item
        DataSet = frxUserDataSetDS
        DataSetName = 'frxUserDataSetDS'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'month'
        Value = ''
      end
      item
        Name = 'year'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxDMPPage
      Orientation = poLandscape
      PaperWidth = 297.179808071374000000
      PaperHeight = 211.401946802909400000
      PaperSize = 9
      LeftMargin = 2.539998359584393000
      RightMargin = 2.539998359584393000
      TopMargin = 4.497913761764029000
      BottomMargin = 4.497913761764029000
      FontStyle = []
      object MasterData1: TfrxMasterData
        Height = 34.000000000000000000
        Top = 17.000000000000000000
        Width = 1104.000000000000000000
        RowCount = 1
        object DMPMemo1: TfrxDMPMemoView
          Left = 134.400000000000000000
          Width = 336.000000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            #1056#1038#1056#1111#1056#1105#1057#1027#1056#1109#1056#1108' '#1056#1029#1056#176#1057#8225#1056#1105#1057#1027#1056#187#1056#181#1056#1029#1056#1105#1056#8470' '#1056#1030' [month] [year] '#1056#1110'.')
        end
        object DMPMemo7: TfrxDMPMemoView
          Top = 17.000000000000000000
          Width = 710.400000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            
              ' '#1056#1116#1056#1112#1057#1026'        '#1056#8221#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034'         '#1056#1113'-'#1056#1030#1056#1109'  '#1056#1115#1057#1027#1056#1029#1056#1109#1056#1030#1056#1029#1057 +
              #8249#1056#181'   '#1056#1038#1056#1030#1056#1112' '#1056#1030#1056#1029#1057#8218#1057#1026'   '#1056#1038#1056#1030#1056#1112' '#1056#1030#1056#1029#1056#181#1057#8364'    '#1056#152#1057#8218#1056#1109#1056#1110#1056#1109)
        end
      end
      object DetailData1: TfrxDetailData
        Height = 17.000000000000000000
        Top = 68.000000000000000000
        Width = 1104.000000000000000000
        DataSet = frxUserDataSetDS
        DataSetName = 'frxUserDataSetDS'
        RowCount = 0
        Stretched = True
        object DMPMemo2: TfrxDMPMemoView
          Width = 48.000000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[Line#]')
        end
        object DMPMemo4: TfrxDMPMemoView
          Left = 48.000000000000000000
          Width = 240.000000000000000000
          Height = 17.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            '[frxUserDataSetDS."namedol"]')
        end
        object DMPMemo5: TfrxDMPMemoView
          Left = 518.400000000000000000
          Width = 105.600000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxUserDataSetDS."sowmvnu"]')
        end
        object DMPMemo6: TfrxDMPMemoView
          Left = 691.200000000000000000
          Width = 115.200000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxUserDataSetDS."sowmvne"]')
        end
        object DMPMemo8: TfrxDMPMemoView
          Left = 345.600000000000000000
          Width = 105.600000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxUserDataSetDS."osn"]')
        end
        object DMPMemo9: TfrxDMPMemoView
          Left = 873.600000000000000000
          Width = 115.200000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxUserDataSetDS."tot"]')
        end
        object DMPMemo13: TfrxDMPMemoView
          Left = 288.000000000000000000
          Width = 48.000000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxUserDataSetDS."kwoosn" #n%4d]')
        end
        object DMPMemo14: TfrxDMPMemoView
          Left = 220.800000000000000000
          Width = 48.000000000000000000
        end
        object DMPMemo15: TfrxDMPMemoView
          Left = 460.800000000000000000
          Width = 48.000000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%4d'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxUserDataSetDS."kwovnu"]')
        end
        object DMPMemo16: TfrxDMPMemoView
          Left = 633.600000000000000000
          Width = 48.000000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%4d'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxUserDataSetDS."kwovne"]')
        end
        object DMPMemo17: TfrxDMPMemoView
          Left = 816.000000000000000000
          Width = 48.000000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxUserDataSetDS."kwotot" #n%4d]')
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 17.000000000000000000
        Top = 119.000000000000000000
        Width = 1104.000000000000000000
        object DMPMemo10: TfrxDMPMemoView
          Left = 345.600000000000000000
          Width = 105.600000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxUserDataSetDS."osn">,DetailData1)]')
        end
        object DMPMemo3: TfrxDMPMemoView
          Left = 518.400000000000000000
          Width = 105.600000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxUserDataSetDS."sowmvnu">,DetailData1)]')
        end
        object DMPMemo11: TfrxDMPMemoView
          Left = 691.200000000000000000
          Width = 115.200000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxUserDataSetDS."sowmvne">,DetailData1)]')
        end
        object DMPMemo12: TfrxDMPMemoView
          Left = 873.600000000000000000
          Width = 115.200000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxUserDataSetDS."tot">,DetailData1)]')
        end
        object DMPMemo18: TfrxDMPMemoView
          Left = 288.000000000000000000
          Width = 48.000000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SUM(<frxUserDataSetDS."kwoosn">,DetailData1) #n%4d]')
        end
        object DMPMemo19: TfrxDMPMemoView
          Left = 460.800000000000000000
          Width = 48.000000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SUM(<frxUserDataSetDS."kwovnu">,DetailData1) #n%4d]')
        end
        object DMPMemo20: TfrxDMPMemoView
          Left = 633.600000000000000000
          Width = 48.000000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SUM(<frxUserDataSetDS."kwovne">,DetailData1) #n%4d]')
        end
        object DMPMemo21: TfrxDMPMemoView
          Left = 816.000000000000000000
          Width = 48.000000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SUM(<frxUserDataSetDS."kwotot">,DetailData1) #n%4d]')
        end
      end
    end
  end
  object frxDotMatrixExportDS: TfrxDotMatrixExport
    UseFileCache = True
    ShowProgress = True
    EscModel = 0
    GraphicFrames = False
    SaveToFile = False
    UseIniSettings = True
    Left = 128
    Top = 64
  end
  object frxUserDataSetDS: TfrxUserDataSet
    UserName = 'frxUserDataSetDS'
    OnCheckEOF = frxUserDataSetDSCheckEOF
    OnFirst = frxUserDataSetDSFirst
    OnNext = frxUserDataSetDSNext
    Fields.Strings = (
      'kod'
      'namedol'
      'kwoosn'
      'osn'
      'kwovnu'
      'sowmvnu'
      'kwovne'
      'sowmvne'
      'kwotot'
      'tot')
    OnGetValue = frxUserDataSetDSGetValue
    Left = 160
    Top = 64
  end
  object frxReportLaserDS: TfrxReport
    Version = '4.3'
    DataSet = frxUserDataSetDS
    DataSetName = 'frxUserDataSetDS'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40721.871021585650000000
    ReportOptions.LastChange = 40721.974604849540000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReportLaserDSGetValue
    Left = 104
    Top = 40
    Datasets = <
      item
        DataSet = frxUserDataSetDS
        DataSetName = 'frxUserDataSetDS'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'month'
        Value = ''
      end
      item
        Name = 'year'
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
      object MasterData1: TfrxMasterData
        Height = 94.488250000000000000
        Top = 18.897650000000000000
        Width = 1122.520410000000000000
        RowCount = 0
        object Memo10: TfrxMemoView
          Left = 196.535560000000000000
          Top = 3.779530000000001000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[month]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 283.464750000000000000
          Top = 3.779530000000001000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[year]')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        Height = 22.677180000000000000
        Top = 136.063080000000000000
        Width = 1122.520410000000000000
        DataSet = frxUserDataSetDS
        DataSetName = 'frxUserDataSetDS'
        RowCount = 0
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
        end
        object frxUserDataSetDSnamedol: TfrxMemoView
          Left = 45.354360000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          DataSet = frxUserDataSetDS
          DataSetName = 'frxUserDataSetDS'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxUserDataSetDS."namedol"]')
          ParentFont = False
        end
        object frxUserDataSetDSkwoosn: TfrxMemoView
          Left = 226.771800000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          DataSet = frxUserDataSetDS
          DataSetName = 'frxUserDataSetDS'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxUserDataSetDS."kwoosn"]')
          ParentFont = False
        end
        object frxUserDataSetDSosn: TfrxMemoView
          Left = 302.362400000000000000
          Width = 132.283464570000000000
          Height = 18.897650000000000000
          DataSet = frxUserDataSetDS
          DataSetName = 'frxUserDataSetDS'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxUserDataSetDS."osn" ]')
          ParentFont = False
        end
        object frxUserDataSetDSkwovnu: TfrxMemoView
          Left = 434.645950000000000000
          Width = 75.590551181102360000
          Height = 18.897650000000000000
          DataField = 'kwovnu'
          DataSet = frxUserDataSetDS
          DataSetName = 'frxUserDataSetDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxUserDataSetDS."kwovnu"]')
          ParentFont = False
        end
        object frxUserDataSetDSsowmvnu: TfrxMemoView
          Left = 510.236550000000000000
          Width = 132.283464570000000000
          Height = 18.897650000000000000
          DataSet = frxUserDataSetDS
          DataSetName = 'frxUserDataSetDS'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxUserDataSetDS."sowmvnu"]')
          ParentFont = False
        end
        object frxUserDataSetDSkwovne: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          DataField = 'kwovne'
          DataSet = frxUserDataSetDS
          DataSetName = 'frxUserDataSetDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxUserDataSetDS."kwovne"]')
          ParentFont = False
        end
        object frxUserDataSetDSsowmvne: TfrxMemoView
          Left = 718.110700000000000000
          Width = 132.283464570000000000
          Height = 18.897650000000000000
          DataSet = frxUserDataSetDS
          DataSetName = 'frxUserDataSetDS'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxUserDataSetDS."sowmvne"]')
          ParentFont = False
        end
        object frxUserDataSetDSkwotot: TfrxMemoView
          Left = 850.394250000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          DataField = 'kwotot'
          DataSet = frxUserDataSetDS
          DataSetName = 'frxUserDataSetDS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxUserDataSetDS."kwotot"]')
          ParentFont = False
        end
        object frxUserDataSetDStot: TfrxMemoView
          Left = 925.984850000000000000
          Width = 132.283464570000000000
          Height = 18.897650000000000000
          DataSet = frxUserDataSetDS
          DataSetName = 'frxUserDataSetDS'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxUserDataSetDS."tot"]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 22.677180000000000000
        Top = 219.212740000000000000
        Width = 1122.520410000000000000
        object Memo2: TfrxMemoView
          Left = 226.771800000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxUserDataSetDS."kwoosn">,DetailData1)]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 302.362400000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxUserDataSetDS."osn">,DetailData1)]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 434.645950000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxUserDataSetDS."kwovnu">,DetailData1)]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 510.236550000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxUserDataSetDS."sowmvnu">,DetailData1)]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590514570000000000
          Height = 18.897637800000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxUserDataSetDS."kwovne">,DetailData1)]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 718.110700000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxUserDataSetDS."sowmvne">,DetailData1)]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 850.394250000000000000
          Width = 79.370130000000000000
          Height = 18.897637800000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxUserDataSetDS."kwotot">,DetailData1)]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 933.543910000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxUserDataSetDS."tot">,DetailData1)]')
          ParentFont = False
        end
      end
    end
  end
end
