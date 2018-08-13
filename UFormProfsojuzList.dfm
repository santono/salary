object FormProfsojuzList: TFormProfsojuzList
  Left = 209
  Top = 267
  Width = 697
  Height = 159
  Caption = #1057#1087#1080#1089#1082#1086' '#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1086#1074' '#1087#1088#1086#1092#1089#1086#1102#1079#1085#1099#1093' '#1074#1079#1085#1086#1089#1086#1074
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
    Width = 177
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1086#1090#1095#1077#1090
    TabOrder = 1
    OnClick = btn1Click
    Kind = bkOK
  end
  object btn2: TBitBtn
    Left = 208
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
        Size = 50
      end
      item
        Name = 'summa'
        DataType = ftFloat
      end
      item
        Name = 'summaMax'
        DataType = ftFloat
      end
      item
        Name = 'summa22'
        DataType = ftFloat
      end
      item
        Name = 'summa22Cor'
        DataType = ftFloat
      end
      item
        Name = 'summa22Res'
        DataType = ftFloat
      end
      item
        Name = 'isInvalid'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 280
    Top = 72
    Data = {
      B80000009619E0BD010000001800000009000000000003000000B80008736869
      6672506F640400010000000000057461626E6F04000100000000000366696F01
      004900000001000557494454480200020032000573756D6D6108000400000000
      000873756D6D614D617808000400000000000773756D6D613232080004000000
      00000A73756D6D613232436F7208000400000000000A73756D6D613232526573
      0800040000000000096973496E76616C696402000300000000000000}
    object dsTestshifrPod: TIntegerField
      FieldName = 'shifrPod'
    end
    object dsTesttabno: TIntegerField
      FieldName = 'tabno'
    end
    object dsTestsumma: TFloatField
      FieldName = 'summa'
    end
    object dsTestfio: TStringField
      FieldName = 'fio'
      Size = 50
    end
    object dsTestsummaMax: TFloatField
      FieldName = 'summaMax'
    end
    object dsTestsumma22: TFloatField
      FieldName = 'summa22'
    end
    object dsTestsumma22Cor: TFloatField
      FieldName = 'summa22Cor'
    end
    object dsTestsumma22Res: TFloatField
      FieldName = 'summa22Res'
    end
    object dsTestisInvalid: TBooleanField
      FieldName = 'isInvalid'
    end
  end
  object frxrprtProf: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42171.753148645830000000
    ReportOptions.LastChange = 42443.458660462970000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxrprtProfGetValue
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
      end
      item
        Name = 'procStr'
        Value = ''
      end
      item
        Name = 'procVal'
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
        Height = 37.795275590000000000
        Top = 18.897650000000000000
        Width = 793.701300000000000000
        object Memo1: TfrxMemoView
          Left = 185.196970000000000000
          Width = 483.779840000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              'C'#1056#1111#1056#1105#1057#1027#1056#1109#1056#1108' '#1056#1111#1056#187#1056#176#1057#8218#1056#181#1056#187#1057#1034#1057#8240#1056#1105#1056#1108#1056#1109#1056#1030' '#1056#1111#1057#1026#1056#1109#1057#8222#1057#1027#1056#1109#1057#1035#1056#183#1056#1029#1057#8249#1057#8230' '#1056#1030#1056#183 +
              #1056#1029#1056#1109#1057#1027#1056#1109#1056#1030' '#1056#1030' [Month] [Year]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897637800000000000
        Top = 117.165430000000000000
        Width = 793.701300000000000000
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
        object Memo4: TfrxMemoView
          Left = 37.795300000000000000
          Width = 56.692950000000000000
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
          Left = 102.047310000000000000
          Width = 578.268090000000000000
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
