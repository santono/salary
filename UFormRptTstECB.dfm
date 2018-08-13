object FormRptTstECB: TFormRptTstECB
  Left = 258
  Top = 177
  Width = 671
  Height = 257
  Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1088#1072#1089#1095#1077#1090#1072' '#1077#1076#1080#1085#1086#1075#1086' '#1089#1086#1094'.'#1085#1072#1083#1086#1075#1072' '#1080' '#1085#1072#1083#1086#1075#1072' '#1085#1072' '#1076#1086#1093#1086#1076#1099
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
    Left = 8
    Top = 64
    Width = 97
    Height = 25
    Caption = #1045#1057#1042
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
  object chkExcel: TCheckBox
    Left = 112
    Top = 72
    Width = 193
    Height = 17
    Caption = #1042#1099#1074#1086#1076#1080#1090#1100' '#1074' EXCEL'
    TabOrder = 3
  end
  object CheckBox1: TCheckBox
    Left = 112
    Top = 96
    Width = 313
    Height = 17
    Caption = #1042#1099#1074#1086#1076#1080#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1085#1077#1074#1077#1088#1085#1099#1093' '#1074' Excel'
    TabOrder = 4
    OnClick = CheckBox1Click
  end
  object CheckBoxOtherPeriod: TCheckBox
    Left = 112
    Top = 120
    Width = 313
    Height = 17
    Caption = #1056#1072#1079#1073#1080#1074#1072#1090#1100' '#1089#1074#1086#1076#1099' '#1087#1086' '#1087#1077#1088#1080#1086#1076#1072#1084
    TabOrder = 5
  end
  object CheckBoxOnlyLim: TCheckBox
    Left = 112
    Top = 144
    Width = 321
    Height = 17
    Caption = #1042#1099#1074#1077#1089#1090#1080' '#1089' '#1089#1091#1084#1084#1072#1084#1080' '#1073#1086#1083#1100#1096#1077' '#1083#1080#1084#1080#1090#1072
    TabOrder = 6
    OnClick = CheckBoxOnlyLimClick
  end
  object BitBtn2: TBitBtn
    Left = 8
    Top = 96
    Width = 97
    Height = 25
    Caption = #1055#1086#1076'.'#1085#1072#1083#1086#1075
    TabOrder = 7
    OnClick = BitBtn2Click
  end
  object cbCurrentMonthOnly: TCheckBox
    Left = 112
    Top = 168
    Width = 321
    Height = 17
    Caption = #1058#1086#1083#1100#1082#1086' '#1079#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
    TabOrder = 8
  end
  object frxReportSL: TfrxReport
    Version = '4.3'
    DataSet = frxUserDataSetSl
    DataSetName = 'frxUserDataSetSl'
    DotMatrixReport = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40564.625080138910000000
    ReportOptions.LastChange = 40596.871765405100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReportSLGetValue
    Left = 120
    Top = 40
    Datasets = <
      item
        DataSet = frxUserDataSetSl
        DataSetName = 'frxUserDataSetSl'
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
      PaperWidth = 210.819863845504600000
      PaperHeight = 296.862308276425900000
      PaperSize = 9
      LeftMargin = 2.539998359584390000
      RightMargin = 2.539998359584390000
      TopMargin = 4.497913761764030000
      BottomMargin = 4.497913761764030000
      FontStyle = []
      object MasterData1: TfrxMasterData
        Height = 34.000000000000000000
        Top = 17.000000000000000000
        Width = 777.600000000000000000
        RowCount = 1
        object DMPMemo1: TfrxDMPMemoView
          Left = 134.400000000000000000
          Width = 336.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            #1056#1038#1056#1111#1056#1105#1057#1027#1056#1109#1056#1108' '#1056#1109#1057#8364#1056#1105#1056#177#1056#1109#1056#1108' '#1056#8226#1056#1038#1056#8217' [month] [year] '#1056#1110'.')
        end
        object DMPMemo7: TfrxDMPMemoView
          Top = 17.000000000000000000
          Width = 662.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            
              ' '#1056#1116#1056#1112#1057#1026'  '#1056#1118'.'#1056#1029#1056#1109#1056#1112'   '#1056#164#1056#176#1056#1112#1056#1105#1056#187#1056#1105#1057#1039' '#1056#152#1056#1112#1057#1039' '#1056#1115#1057#8218#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109'     ' +
              '  '#1056#8221#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034'   '#1056#1119#1056#1169#1057#1026'      '#1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
        end
      end
      object DetailData1: TfrxDetailData
        Height = 68.000000000000000000
        Top = 68.000000000000000000
        Width = 777.600000000000000000
        DataSet = frxUserDataSetSl
        DataSetName = 'frxUserDataSetSl'
        RowCount = 0
        object DMPMemo2: TfrxDMPMemoView
          Width = 48.000000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[Line#]')
        end
        object DMPMemo3: TfrxDMPMemoView
          Left = 57.600000000000000000
          Width = 57.600000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[frxUserDataSetSl."tabno"]')
        end
        object DMPMemo4: TfrxDMPMemoView
          Left = 124.800000000000000000
          Width = 259.200000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[frxUserDataSetSl."fio"]')
        end
        object DMPMemo6: TfrxDMPMemoView
          Top = 17.000000000000000000
          Width = 105.600000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxUserDataSetSl."summanadd" #n%2,2f]')
        end
        object DMPMemo5: TfrxDMPMemoView
          Left = 115.200000000000000000
          Top = 17.000000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxUserDataSetSl."summanmaxadd" #n%2,2f]')
        end
        object DMPMemo8: TfrxDMPMemoView
          Left = 211.200000000000000000
          Top = 17.000000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxUserDataSetSl."summanecb" #n%2,2f]')
        end
        object DMPMemo9: TfrxDMPMemoView
          Left = 374.400000000000000000
          Top = 17.000000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxUserDataSetSl."summaadd" #n%2,2f]')
        end
        object DMPMemo10: TfrxDMPMemoView
          Left = 470.400000000000000000
          Top = 17.000000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxUserDataSetSl."summamaxadd" #n%2,2f]')
        end
        object DMPMemo11: TfrxDMPMemoView
          Left = 566.400000000000000000
          Top = 17.000000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxUserDataSetSl."summaecb" #n%2,2f]')
        end
        object DMPMemo12: TfrxDMPMemoView
          Top = 34.000000000000000000
          Width = 105.600000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxUserDataSetSl."summadpadd" #n%2,2f]')
        end
        object DMPMemo13: TfrxDMPMemoView
          Left = 115.200000000000000000
          Top = 34.000000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxUserDataSetSl."summadpmaxadd" #n%2,2f]')
        end
        object DMPMemo14: TfrxDMPMemoView
          Left = 211.200000000000000000
          Top = 34.000000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxUserDataSetSl."summadpecb" #n%2,2f]')
        end
        object DMPMemo15: TfrxDMPMemoView
          Left = 374.400000000000000000
          Top = 34.000000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxUserDataSetSl."summailladd" #n%2,2f]')
        end
        object DMPMemo16: TfrxDMPMemoView
          Left = 470.400000000000000000
          Top = 34.000000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxUserDataSetSl."summaillmaxadd" #n%2,2f]')
        end
        object DMPMemo17: TfrxDMPMemoView
          Left = 566.400000000000000000
          Top = 34.000000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxUserDataSetSl."summaillecb" #n%2,2f]')
        end
      end
    end
  end
  object frxDotMatrixExportSL: TfrxDotMatrixExport
    UseFileCache = True
    ShowProgress = True
    EscModel = 0
    GraphicFrames = False
    SaveToFile = False
    UseIniSettings = True
    Left = 168
    Top = 40
  end
  object frxUserDataSetSl: TfrxUserDataSet
    UserName = 'frxUserDataSetSl'
    OnCheckEOF = frxUserDataSetSlCheckEOF
    OnFirst = frxUserDataSetSlFirst
    OnNext = frxUserDataSetSlNext
    Fields.Strings = (
      'tabno'
      'fio'
      'summanadd'
      'summanmaxadd'
      'summanecb'
      'summaadd'
      'summamaxadd'
      'summaecb'
      'summadpadd'
      'summadpmaxadd'
      'summadpecb'
      'summailladd'
      'summaillmaxadd'
      'summaillecb'
      '')
    OnGetValue = frxUserDataSetSlGetValue
    Left = 288
    Top = 40
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    ShowProgress = True
    FixedWidth = True
    Background = True
    Centered = False
    EmptyLines = True
    Left = 328
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
    Left = 360
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
    Left = 392
    Top = 40
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
    ReportOptions.LastChange = 40813.953208321750000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxrprtswod1GetValue
    Left = 424
    Top = 40
    Datasets = <
      item
        DataSet = frxsrdtst1
        DataSetName = 'frxsrdtst1'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'New Variable1'
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
        Height = 98.267780000000000000
        Top = 18.897650000000000000
        Width = 1122.520410000000000000
        RowCount = 1
        object Memo1: TfrxMemoView
          Left = 321.260050000000000000
          Top = 15.118120000000000000
          Width = 502.677490000000000000
          Height = 30.236240000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1038#1056#1030#1056#1109#1056#1169' '#1056#1111#1056#1109' '#1056#1109#1056#1110#1057#1026#1056#176#1056#1029#1056#1105#1057#8225#1056#181#1056#1029#1056#1105#1057#1035' '#1056#1169#1056#187#1057#1039' '#1057#1107#1056#1169#1056#181#1057#1026#1056#182#1056#176#1056#1029#1056#1105#1056#8470'  ' +
              ' [DATAZA]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 3.779530000000000000
          Top = 56.692949999999990000
          Width = 895.748610000000000000
          Height = 26.456710000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#8217#1056#1105#1056#1169'                     '#1056#1116#1056#176#1057#8225#1056#1105#1057#1027#1056#187' '#1056#1030#1057#1027#1056#181#1056#1110#1056#1109'       '#1056#1119#1056#1109' '#1056#1109 +
              #1056#1110#1057#1026#1056#176#1056#1029#1056#1105#1057#8225#1056#181#1056#1029#1056#1105#1057#1035'        '#1056#8226#1056#1038#1056#8217' '#1057#8222#1056#176#1056#1108#1057#8218'         '#1056#8226#1056#1038#1056#8217' '#1057#1026#1056#176#1057 +
              #1027'              '#1056#8226#1056#1038#1056#8217'  '#1056#1111#1057#1026#1057#8218)
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
            '[frxsrdtst1."summaecb" #n%2,2f]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 612.283860000000000000
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
            '[frxsrdtst1."summaecbras" #n%2,2f]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 767.244590000000000000
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
            '[frxsrdtst1."summaecbpereras" #n%2,2f]')
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
        object Memo13: TfrxMemoView
          Left = 767.244590000000000000
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
            '[SUM(<frxsrdtst1."summaecbpereras">,DetailData1) #n%2,2f]')
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
      'summaecbras'
      'summaecbpereras')
    OnGetValue = frxsrdtst1GetValue
    Left = 456
    Top = 40
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
    ReportOptions.LastChange = 40811.641127384260000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxrprtswod2GetValue
    Left = 488
    Top = 40
    Datasets = <
      item
        DataSet = frxsrdtst2
        DataSetName = 'frxsrdtst2'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'DATAZA'
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
        Height = 83.149660000000000000
        Top = 18.897650000000000000
        Width = 793.701300000000000000
        RowCount = 1
        object Memo1: TfrxMemoView
          Left = 230.551330000000000000
          Width = 521.575140000000100000
          Height = 30.236240000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              'II. '#1056#1038#1056#1030#1056#1109#1056#1169' '#1056#1111#1056#1109' '#1056#1109#1056#1110#1057#1026#1056#176#1056#1029#1056#1105#1057#8225#1056#181#1056#1029#1056#1105#1057#1035' '#1056#1169#1056#187#1057#1039' '#1056#1029#1056#176#1057#8225#1056#1105#1057#1027#1056#187#1056#181#1056#1029 +
              #1056#1105#1056#8470' [DATAZA]')
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
    Left = 520
    Top = 40
  end
  object pFIBQuery: TpFIBQuery
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    Left = 208
    Top = 40
  end
  object pFIBTransaction: TpFIBTransaction
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 248
    Top = 40
  end
  object frxUserDataSetPod: TfrxUserDataSet
    UserName = 'frxUserDataSetPod'
    OnCheckEOF = frxUserDataSetPodCheckEOF
    OnFirst = frxUserDataSetPodFirst
    OnNext = frxUserDataSetPodNext
    Fields.Strings = (
      'Tabno'
      'FIO'
      'Podr'
      'Y'
      'M'
      'SummaPodAdd'
      'SummaPodFakt'
      'SummaPodRas'
      'SummaPodRazn')
    OnGetValue = frxUserDataSetPodGetValue
    Left = 600
    Top = 40
  end
  object frxReportPod: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41687.465296331020000000
    ReportOptions.LastChange = 41689.878484513890000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 560
    Top = 40
    Datasets = <
      item
        DataSet = frxUserDataSetPod
        DataSetName = 'frxUserDataSetPod'
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
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 793.701300000000000000
        object Memo1: TfrxMemoView
          Left = 245.669450000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1109#1056#1030#1056#181#1057#1026#1056#1108#1056#176' '#1057#1026#1056#176#1057#1027#1057#8225#1056#181#1057#8218#1056#176' '#1056#1029#1056#176#1056#187#1056#1109#1056#1110#1056#176' '#1057#1027' '#1056#1169#1056#1109#1057#8230#1056#1109#1056#1169#1056#176' ')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897637795275590000
        Top = 102.047310000000000000
        Width = 793.701300000000000000
        DataSet = frxUserDataSetPod
        DataSetName = 'frxUserDataSetPod'
        RowCount = 0
        object Memo2: TfrxMemoView
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 37.795300000000000000
          Width = 56.692913385826770000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxUserDataSetPod."Tabno"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 94.488250000000000000
          Width = 151.181090160000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxUserDataSetPod."FIO"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 245.669450000000000000
          Width = 56.692913390000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxUserDataSetPod."Podr"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 302.362400000000000000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxUserDataSetPod."Y"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 340.157700000000000000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxUserDataSetPod."M"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 377.953000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxUserDataSetPod."SummaPodAdd" #n%2,2f]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 472.441250000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxUserDataSetPod."SummaPodFakt" #n%2,2f]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 566.929500000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxUserDataSetPod."SummaPodRas" #n%2,2f]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 661.417750000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxUserDataSetPod."SummaPodRazn" #n%2,2f]')
          ParentFont = False
        end
      end
    end
  end
end
