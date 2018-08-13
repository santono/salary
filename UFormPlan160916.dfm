object FormPlan160916: TFormPlan160916
  Left = 209
  Top = 267
  Width = 697
  Height = 216
  Caption = #1056#1072#1079#1073#1080#1074#1082#1072' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072' '#1088#1072#1073#1086#1090#1085#1080#1082#1086#1074' '#1087#1086' '#1060#1047#1055
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
  object lbl1: TLabel
    Left = 32
    Top = 16
    Width = 24
    Height = 20
    Caption = 'lbl1'
  end
  object pb1: TProgressBar
    Left = 24
    Top = 40
    Width = 625
    Height = 17
    TabOrder = 0
  end
  object btn1: TBitBtn
    Left = 24
    Top = 80
    Width = 137
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 1
    OnClick = btn1Click
    Kind = bkOK
  end
  object btn2: TBitBtn
    Left = 176
    Top = 80
    Width = 89
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 120
    Width = 489
    Height = 25
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object dsTest: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'shifrPod'
        DataType = ftInteger
      end
      item
        Name = 'tabno'
        DataType = ftInteger
      end
      item
        Name = 'fio'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'summa'
        DataType = ftFloat
      end
      item
        Name = 'summaOtp'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 280
    Top = 72
    Data = {
      700000009619E0BD010000001800000005000000000003000000700008736869
      6672506F640400010000000000057461626E6F04000100000000000366696F01
      004900000001000557494454480200020032000573756D6D6108000400000000
      000873756D6D614F747008000400000000000000}
    object dsTestshifrPod: TIntegerField
      FieldName = 'shifrPod'
    end
    object dsTesttabno: TIntegerField
      FieldName = 'tabno'
    end
    object dsTestsumma: TFloatField
      FieldName = 'summa'
    end
    object dsTestsummaOtp: TFloatField
      FieldName = 'summaOtp'
    end
    object dsTestfio: TStringField
      FieldName = 'fio'
      Size = 50
    end
  end
  object frxrprt1: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42171.753148645830000000
    ReportOptions.LastChange = 42360.671844837960000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxrprt1GetValue
    Left = 320
    Top = 72
    Datasets = <>
    Variables = <
      item
        Name = ' New Category1'
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
        Name = 'NmbTot'
        Value = ''
      end
      item
        Name = 'NmbBef2978'
        Value = ''
      end
      item
        Name = 'NmbFr2979To5000'
        Value = ''
      end
      item
        Name = 'NmbFr5000To6000'
        Value = ''
      end
      item
        Name = 'NmbFr6000To7000'
        Value = ''
      end
      item
        Name = 'NmbFr7000To8000'
        Value = ''
      end
      item
        Name = 'NmbGt8000'
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
      object ReportTitle1: TfrxReportTitle
        Height = 317.480495590000000000
        Top = 18.897650000000000000
        Width = 793.701300000000000000
        object Memo1: TfrxMemoView
          Left = 185.196970000000000000
          Top = 3.779530000000000000
          Width = 502.677490000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#160#1056#176#1056#183#1056#177#1056#1105#1056#1030#1056#1108#1056#176' '#1056#1108#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#176' '#1057#1027#1056#1109#1057#8218#1057#1026#1057#1107#1056#1169#1056#1029#1056#1105#1056#1108#1056#1109#1056#1030' '#1056#1111#1056 +
              #1109' '#1056#1169#1056#1105#1056#176#1056#1111#1056#176#1056#183#1056#1109#1056#1029#1056#176#1056#1112' '#1056#183' '#1056#1111' [Month] [Year]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 22.677180000000000000
          Top = 56.692950000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1057#1026#1056#176#1056#177#1056#1109#1057#8218#1056#1029#1056#1105#1056#1108#1056#1109#1056#1030)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 22.677180000000000000
          Top = 75.590600000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1169#1056#1109' 2978')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 22.677180000000000000
          Top = 94.488250000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1109#1057#8218' 2979 '#1056#1169#1056#1109' 5000')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 22.677180000000000000
          Top = 113.385900000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1109#1057#8218' 5000 '#1056#1169#1056#1109' 6000')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 22.677180000000000000
          Top = 132.283550000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1109#1057#8218' 6000 '#1056#1169#1056#1109' 7000')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 22.677180000000000000
          Top = 151.181200000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1109#1057#8218' 7000 '#1056#1169#1056#1109' 8000')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 22.677180000000000000
          Top = 170.078850000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1057#1027#1056#1030#1057#8249#1057#8364#1056#181' 8000')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 170.078850000000000000
          Top = 56.692950000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[NmbTot]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 170.078850000000000000
          Top = 75.590600000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[NmbBef2978]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 170.078850000000000000
          Top = 94.488250000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[NmbFr2979To5000]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 170.078850000000000000
          Top = 113.385900000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[NmbFr5000To6000]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 170.078850000000000000
          Top = 132.283550000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[NmbFr6000To7000]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 170.078850000000000000
          Top = 151.181200000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[NmbFr7000To8000]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 170.078850000000000000
          Top = 170.078850000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[NmbGt8000]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = dsTest
    Left = 360
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
    Left = 392
    Top = 72
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    Left = 432
    Top = 72
  end
end
