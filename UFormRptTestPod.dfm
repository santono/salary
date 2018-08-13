object FormRptTestPod: TFormRptTestPod
  Left = 209
  Top = 267
  Width = 697
  Height = 159
  Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1088#1072#1089#1095#1077#1090#1072' '#1085#1072#1083#1086#1075#1072' '#1089' '#1076#1086#1093#1086#1076#1072
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
    Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100
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
        Size = 20
      end
      item
        Name = 'summaAdd'
        DataType = ftFloat
      end
      item
        Name = 'summaPodFakt'
        DataType = ftFloat
      end
      item
        Name = 'summaPodRas'
        DataType = ftFloat
      end
      item
        Name = 'summaPodRazn'
        DataType = ftFloat
      end
      item
        Name = 'summaLgSob'
        DataType = ftFloat
      end
      item
        Name = 'summaLgDeti'
        DataType = ftFloat
      end
      item
        Name = 'y'
        DataType = ftInteger
      end
      item
        Name = 'm'
        DataType = ftInteger
      end
      item
        Name = 'isLgotyPN'
        DataType = ftInteger
      end
      item
        Name = 'kd'
        DataType = ftInteger
      end
      item
        Name = 'summaAddOld'
        DataType = ftFloat
      end
      item
        Name = 'summaPodOld'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 280
    Top = 72
    Data = {
      200100009619E0BD01000000180000000F000000000003000000200108736869
      6672506F640400010000000000057461626E6F04000100000000000366696F01
      004900000001000557494454480200020014000873756D6D6141646408000400
      000000000C73756D6D61506F6446616B7408000400000000000B73756D6D6150
      6F6452617308000400000000000C73756D6D61506F6452617A6E080004000000
      00000A73756D6D614C67536F6208000400000000000B73756D6D614C67446574
      69080004000000000001790400010000000000016D0400010000000000096973
      4C676F7479504E0400010000000000026B6404000100000000000B73756D6D61
      4164644F6C6408000400000000000B73756D6D61506F644F6C64080004000000
      00000000}
    object dsTestshifrPod: TIntegerField
      FieldName = 'shifrPod'
    end
    object dsTesttabno: TIntegerField
      FieldName = 'tabno'
    end
    object dsTestfio: TStringField
      FieldName = 'fio'
    end
    object dsTestsummaAdd: TFloatField
      FieldName = 'summaAdd'
    end
    object dsTestsummaPodFakt: TFloatField
      FieldName = 'summaPodFakt'
    end
    object dsTestsummaPodRas: TFloatField
      FieldName = 'summaPodRas'
    end
    object dsTestsummaPodRazn: TFloatField
      FieldName = 'summaPodRazn'
    end
    object dsTestsummaLgSob: TFloatField
      FieldName = 'summaLgSob'
    end
    object dsTestsummaLgDeti: TFloatField
      FieldName = 'summaLgDeti'
    end
    object dsTesty: TIntegerField
      FieldName = 'y'
    end
    object dsTestm: TIntegerField
      FieldName = 'm'
    end
    object dsTestisLgotyPN: TIntegerField
      FieldName = 'isLgotyPN'
    end
    object dsTestkd: TIntegerField
      FieldName = 'kd'
    end
    object dsTestsummaAddOld: TFloatField
      FieldName = 'summaAddOld'
    end
    object dsTestsummaPodOld: TFloatField
      FieldName = 'summaPodOld'
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
    ReportOptions.LastChange = 42386.767103993060000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxrprt1GetValue
    Left = 320
    Top = 72
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
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
      object ReportTitle1: TfrxReportTitle
        Height = 37.795275590000000000
        Top = 18.897650000000000000
        Width = 1122.520410000000000000
        object Memo1: TfrxMemoView
          Left = 185.196970000000000000
          Top = 3.779530000000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1109#1056#1030#1056#181#1057#1026#1056#1108#1056#176' '#1057#1026#1056#176#1057#1027#1057#8225#1056#181#1057#8218#1056#176' '#1056#1029#1056#176#1056#187#1056#1109#1056#1110#1056#176' '#1057#1027' '#1056#1169#1056#1109#1057#8230#1056#1109#1056#1169#1056#176)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 415.748300000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1057#8225#1056#1105#1057#1027#1056#187#1056#181#1056#1029#1056#1109)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 510.236550000000000000
          Top = 18.897650000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1032#1056#1169#1056#181#1057#1026#1056#182#1056#176#1056#1029#1056#1109)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 793.701300000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#176#1057#1027#1057#8225#1056#181#1057#8218#1056#1029#1057#8249#1056#8470)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 888.189550000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#1109#1057#1107#1056#1169#1056#181#1057#1026#1056#182#1056#176#1057#8218#1057#1034)
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 600.945270000000000000
          Top = 18.897650000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1029#1056#176#1057#8225' '#1056#1030' '#1056#1111#1057#1026' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169#1056#176#1057#8230)
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 699.213050000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1107#1056#1169' '#1056#1030' '#1056#1111#1057#1026)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897637800000000000
        Top = 117.165430000000000000
        Width = 1122.520410000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo2: TfrxMemoView
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
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
          Width = 37.795275590551180000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."shifrPod"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 75.590600000000000000
          Width = 56.692913390000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."tabno"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 132.283550000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."fio"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 793.700787401574800000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."summaPodRas"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 888.188976377952800000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset1."summaPodRazn"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 510.236550000000000000
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
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."summaPodFakt"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 415.748300000000000000
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
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."summaAdd"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 377.953000000000000000
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
            '[frxDBDataset1."m"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 321.260050000000000000
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
            '[frxDBDataset1."y"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 604.724800000000000000
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
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset1."summaAddOld"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 699.213050000000000000
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
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset1."summaPodOld"]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 22.677180000000000000
        Top = 196.535560000000000000
        Width = 1122.520410000000000000
        object Memo7: TfrxMemoView
          Left = 415.748300000000000000
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
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."summaAdd">,MasterData1)]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 11.338590000000000000
          Width = 408.189240000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152' '#1057#8218' '#1056#1109' '#1056#1110' '#1056#1109)
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
  object dsoOld: TDataSource
    DataSet = dsOld
    Left = 568
    Top = 72
  end
  object dsOld: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select tn,coalesce(summaadd,0.00) sad,coalesce(summaud,0.00) sud' +
        ' from'
      '(select  p.tabno tn,'
      '  (select sum(a.summa) from fadd a join shifr s'
      '    on s.shifr=a.shifrsta'
      '    where a.shifridperson=p.shifrid'
      
        '     and ((select first 1 retval from pr_isotherperiodecbshifr(a' +
        '.shifrsta))=1)'
      '     and a.year_za=:y'
      '     and a.month_za=:m'
      '     and coalesce(s.podoh,0)=1) summaadd,'
      
        '  (select sum(u.summa) from fud u where u.shifridperson=p.shifri' +
        'd'
      '     and u.shifrsta=50'
      '     and u.year_za=:y'
      '     and u.month_za=:m) summaud'
      ''
      ' from person p'
      '  where (p.yearvy<:y)'
      '     or (p.yearvy=:y and p.monthvy<:m)'
      ') where coalesce(summaadd,0.00)>0'
      '    or coalesce(summaud,0.00)>0')
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    Left = 472
    Top = 72
    object dsOldTN: TFIBIntegerField
      FieldName = 'TN'
    end
    object dsOldSAD: TFIBBCDField
      FieldName = 'SAD'
      Size = 2
      RoundByScale = True
    end
    object dsOldSUD: TFIBBCDField
      FieldName = 'SUD'
      Size = 2
      RoundByScale = True
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
    Left = 504
    Top = 72
  end
end
