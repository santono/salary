object FormRptSwodECB: TFormRptSwodECB
  Left = 258
  Top = 177
  Width = 671
  Height = 149
  Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1088#1072#1089#1095#1077#1090#1072' '#1077#1076#1080#1085#1086#1075#1086' '#1089#1086#1094'.'#1085#1072#1083#1086#1075#1072
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
  object LabelPodr: TLabel
    Left = 24
    Top = 40
    Width = 72
    Height = 20
    Caption = 'LabelPodr'
  end
  object LabelFIO: TLabel
    Left = 384
    Top = 40
    Width = 61
    Height = 20
    Caption = 'LabelFio'
  end
  object Button1: TButton
    Left = 24
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
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    ShowProgress = True
    FixedWidth = True
    Background = True
    Centered = False
    EmptyLines = True
    Left = 264
    Top = 64
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
    Left = 312
    Top = 64
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
    Top = 64
  end
  object frxrprtswod1: TfrxReport
    Version = '4.3'
    DataSet = frxsrdtst1
    DataSetName = 'frxsrdtst1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40687.984803055600000000
    ReportOptions.LastChange = 40688.830325729170000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxrprtswod1GetValue
    Left = 392
    Top = 64
    Datasets = <
      item
        DataSet = frxsrdtst1
        DataSetName = 'frxsrdtst1'
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
      object MasterData1: TfrxMasterData
        Height = 98.267780000000000000
        Top = 18.897650000000000000
        Width = 1122.520410000000000000
        RowCount = 1
        object Memo1: TfrxMemoView
          Left = 321.260050000000000000
          Top = 15.118120000000000000
          Width = 355.275820000000000000
          Height = 30.236240000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1038#1056#1030#1056#1109#1056#1169' '#1056#1111#1056#1109' '#1056#1109#1056#1110#1057#1026#1056#176#1056#1029#1056#1105#1057#8225#1056#181#1056#1029#1056#1105#1057#1035' '#1056#1169#1056#187#1057#1039' '#1057#1107#1056#1169#1056#181#1057#1026#1056#182#1056#176#1056#1029#1056#1105#1056#8470)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 3.779530000000000000
          Top = 56.692949999999990000
          Width = 767.244590000000000000
          Height = 26.456710000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#8217#1056#1105#1056#1169'                     '#1056#1116#1056#176#1057#8225#1056#1105#1057#1027#1056#187' '#1056#1030#1057#1027#1056#181#1056#1110#1056#1109'       '#1056#1119#1056#1109' '#1056#1109 +
              #1056#1110#1057#1026#1056#176#1056#1029#1056#1105#1057#8225#1056#181#1056#1029#1056#1105#1057#1035'        '#1056#8226#1056#1038#1056#8217' '#1057#8222#1056#176#1056#1108#1057#8218'       '#1056#8226#1056#1038#1056#8217' '#1057#1026#1056#176#1057#1027)
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        Height = 22.677180000000000000
        Top = 139.842610000000000000
        Width = 1122.520410000000000000
        DataSet = frxsrdtst1
        DataSetName = 'frxsrdtst1'
        RowCount = 0
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxsrdtst1."name"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 151.181200000000000000
          Width = 151.181102362205000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxsrdtst1."summaadd" #n%2,2f]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 306.141930000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxsrdtst1."summaaddlim"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 457.323130000000000000
          Width = 151.181102362205000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxsrdtst1."summaecb" #n%2,2f]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 612.283860000000000000
          Width = 151.181102362205000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxsrdtst1."summaecbras" #n%2,2f]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 22.677180000000000000
        Top = 222.992270000000000000
        Width = 1122.520410000000000000
        object Memo8: TfrxMemoView
          Left = 151.181200000000000000
          Width = 151.181102360000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxsrdtst1."summaadd">,DetailData1) #n%2,2f]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 302.362400000000000000
          Width = 151.181102360000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxsrdtst1."summaaddlim">,DetailData1) #n%2,2f]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 457.323130000000000000
          Width = 151.181102360000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxsrdtst1."summaecb">,DetailData1) #n%2,2f]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 612.283860000000000000
          Width = 151.181102360000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxsrdtst1."summaecbras">,DetailData1) #n%2,2f]')
          ParentFont = False
        end
      end
    end
  end
  object frxsrdtst1: TfrxUserDataSet
    UserName = 'frxsrdtst1'
    OnCheckEOF = frxsrdtst1CheckEOF
    OnFirst = frxsrdtst1First
    OnNext = frxsrdtst1Next
    Fields.Strings = (
      'name'
      'summaadd'
      'summaaddlim'
      'summaecb'
      'summaecbras')
    OnGetValue = frxsrdtst1GetValue
    Left = 432
    Top = 64
  end
  object frxrprtswod2: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40688.894176643510000000
    ReportOptions.LastChange = 40688.916981550920000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 464
    Top = 64
    Datasets = <
      item
        DataSet = frxsrdtst2
        DataSetName = 'frxsrdtst2'
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
      object MasterData1: TfrxMasterData
        Height = 83.149660000000000000
        Top = 18.897650000000000000
        Width = 793.701300000000000000
        RowCount = 1
        object Memo1: TfrxMemoView
          Left = 230.551330000000000000
          Width = 370.393940000000000000
          Height = 30.236240000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              'II. '#1056#1038#1056#1030#1056#1109#1056#1169' '#1056#1111#1056#1109' '#1056#1109#1056#1110#1057#1026#1056#176#1056#1029#1056#1105#1057#8225#1056#181#1056#1029#1056#1105#1057#1035' '#1056#1169#1056#187#1057#1039' '#1056#1029#1056#176#1057#8225#1056#1105#1057#1027#1056#187#1056#181#1056#1029 +
              #1056#1105#1056#8470)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 264.567100000000000000
          Top = 60.472479999999990000
          Width = 445.984540000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '   '#1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1056#1029#1056#176#1057#8225#1056#1105#1057#1027#1056#187'     '#1056#1119#1056#1109' '#1056#1109#1056#1110#1057#1026#1056#176#1056#1029#1056#1105#1057#8225#1056#181#1056#1029#1056#1105#1057#1035'      ' +
              '   '#1056#8226#1056#1038#1056#8217)
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        Height = 26.456710000000000000
        Top = 124.724490000000000000
        Width = 793.701300000000000000
        DataSet = frxsrdtst2
        DataSetName = 'frxsrdtst2'
        RowCount = 0
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Width = 260.787570000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxsrdtst2."name"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 268.346630000000000000
          Width = 151.181102360000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxsrdtst2."summaadd" #n%2,2f]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 419.527830000000000000
          Width = 151.181102360000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxsrdtst2."summalim" #n%2,2f]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 570.709030000000000000
          Width = 151.181102360000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxsrdtst2."summaecb" #n%2,2f]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 22.677180000000000000
        Top = 211.653680000000000000
        Width = 793.701300000000000000
        object Memo6: TfrxMemoView
          Left = 268.346630000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxsrdtst2."summaadd">,DetailData1) #n%2,2f]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 419.527830000000000000
          Width = 151.181102360000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxsrdtst2."summalim">,DetailData1)]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 570.709030000000000000
          Width = 151.181102362204700000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxsrdtst2."summaecb">,DetailData1) #n%2,2f]')
          ParentFont = False
        end
      end
    end
  end
  object frxsrdtst2: TfrxUserDataSet
    UserName = 'frxsrdtst2'
    OnCheckEOF = frxsrdtst2CheckEOF
    OnFirst = frxsrdtst2First
    OnNext = frxsrdtst2Next
    Fields.Strings = (
      'name'
      'summaadd'
      'summalim'
      'summaecb')
    OnGetValue = frxsrdtst2GetValue
    Left = 496
    Top = 64
  end
end
