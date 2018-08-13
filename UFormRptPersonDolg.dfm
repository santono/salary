object FormRptPersonDolg: TFormRptPersonDolg
  Left = 262
  Top = 143
  Width = 671
  Height = 205
  Caption = #1057#1087#1080#1089#1086#1082' '#1088#1072#1073#1086#1090#1085#1080#1082#1086#1074' '#1080' '#1076#1086#1083#1078#1085#1086#1089#1090#1077#1081' '#1074' '#1088#1072#1079#1088#1077#1079#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
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
    Visible = False
    OnClick = btn1Click
  end
  object rgMode: TRadioGroup
    Left = 16
    Top = 96
    Width = 625
    Height = 57
    Caption = #1056#1077#1078#1080#1084
    Columns = 3
    Items.Strings = (
      #1042#1089#1077
      #1042#1085#1077#1096#1085#1080#1077' '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1080
      #1076#1090#1085', '#1087#1088#1086#1092' '#1080' '#1082#1090#1085'. '#1076#1086#1094)
    TabOrder = 4
  end
  object cdsDolg: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ShifrPod'
        DataType = ftInteger
      end
      item
        Name = 'tabno'
        DataType = ftInteger
      end
      item
        Name = 'FIO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Dolg'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = cdsDolgCalcFields
    Left = 112
    Top = 40
    Data = {
      6A0000009619E0BD0100000018000000040000000000030000006A0008536869
      6672506F640400010000000000057461626E6F04000100000000000346494F01
      0049000000010005574944544802000200140004446F6C670100490000000100
      0557494454480200020014000000}
    object cdsDolgShifrPod: TIntegerField
      FieldName = 'ShifrPod'
    end
    object cdsDolgtabno: TIntegerField
      FieldName = 'tabno'
    end
    object cdsDolgFIO: TStringField
      FieldName = 'FIO'
    end
    object cdsDolgDolg: TStringField
      FieldName = 'Dolg'
    end
    object cdsDolgnamePod: TStringField
      FieldKind = fkCalculated
      FieldName = 'namePod'
      Size = 255
      Calculated = True
    end
  end
  object frxReportDolg: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41767.460167592600000000
    ReportOptions.LastChange = 42047.793246608800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReportDolgGetValue
    Left = 160
    Top = 40
    Datasets = <
      item
        DataSet = frxDBDatasetDolg
        DataSetName = 'frxDBDatasetDolg'
      end>
    Variables = <
      item
        Name = ' Hat'
        Value = Null
      end
      item
        Name = 'Namedata'
        Value = ''
      end
      item
        Name = 'nameMode'
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
      object ReportTitle1: TfrxReportTitle
        Height = 49.133890000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 158.740260000000000000
          Width = 340.157700000000000000
          Height = 41.574830000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1038#1056#1030#1056#1109#1056#1169' '#1057#1026#1056#176#1056#177#1056#1109#1057#8218#1056#1029#1056#1105#1056#1108#1056#1109#1056#1030' '#1056#1030' [Namedata]'
            '[nameMode]'
            ''
            '')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 22.677180000000000000
        Top = 90.708720000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          Top = 3.779530000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111'.'#1056#1111)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 41.574830000000000000
          Top = 3.779530000000000000
          Width = 188.976500000000000000
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
            #1056#164#1056#152#1056#1115)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 230.551330000000000000
          Top = 3.779530000000000000
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
            #1056#1118#1056#176#1056#177'.'#1056#1029'.')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 287.244280000000000000
          Top = 3.779530000000000000
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
            #1056#8221#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034'.')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 18.897637800000000000
        Top = 173.858380000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDatasetDolg."ShifrPod"'
        object Memo7: TfrxMemoView
          Width = 680.315400000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDatasetDolg."namePod"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897637800000000000
        Top = 215.433210000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDatasetDolg
        DataSetName = 'frxDBDatasetDolg'
        RowCount = 0
        object Memo2: TfrxMemoView
          Width = 41.574805590000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 41.574830000000000000
          Width = 188.976377950000000000
          Height = 18.897650000000000000
          DataField = 'FIO'
          DataSet = frxDBDatasetDolg
          DataSetName = 'frxDBDatasetDolg'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDatasetDolg."FIO"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 230.551330000000000000
          Width = 56.692913390000000000
          Height = 18.897650000000000000
          DataSet = frxDBDatasetDolg
          DataSetName = 'frxDBDatasetDolg'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDatasetDolg."tabno"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 287.244280000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          DataSet = frxDBDatasetDolg
          DataSetName = 'frxDBDatasetDolg'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDatasetDolg."Dolg"]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDatasetDolg: TfrxDBDataset
    UserName = 'frxDBDatasetDolg'
    CloseDataSource = False
    DataSet = cdsDolg
    Left = 200
    Top = 40
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
    Left = 232
    Top = 40
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
    Left = 272
    Top = 40
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    Left = 312
    Top = 40
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
    Left = 352
    Top = 40
  end
end
