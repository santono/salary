object FormFindPerson: TFormFindPerson
  Left = 196
  Top = 194
  Width = 696
  Height = 170
  Caption = #1055#1086#1080#1089#1082' '#1088#1072#1073#1086#1090#1085#1080#1082#1072
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
  object LabelFIO: TLabel
    Left = 8
    Top = 16
    Width = 66
    Height = 20
    Caption = 'LabelFIO'
  end
  object BitBtn1: TBitBtn
    Left = 464
    Top = 16
    Width = 193
    Height = 25
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1088#1072#1073#1086#1090#1085#1080#1082#1072
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 40
    Width = 649
    Height = 21
    TabOrder = 1
  end
  object BitBtn2: TBitBtn
    Left = 8
    Top = 88
    Width = 75
    Height = 25
    Caption = #1055#1086#1080#1089#1082
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 96
    Top = 88
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 3
    Kind = bkClose
  end
  object cdsPlaces: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'shifrPod'
        DataType = ftInteger
      end
      item
        Name = 'namePod'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'shifrWR'
        DataType = ftInteger
      end
      item
        Name = 'nameWR'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'dolg'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'summaAdd'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 512
    Top = 64
    Data = {
      9C0000009619E0BD0100000018000000060000000000030000009C0008736869
      6672506F640400010000000000076E616D65506F640100490000000100055749
      44544802000200320007736869667257520400010000000000066E616D655752
      010049000000010005574944544802000200140004646F6C6701004900000001
      000557494454480200020014000873756D6D6141646408000400000000000000}
    object cdsPlacesshifrPod: TIntegerField
      FieldName = 'shifrPod'
    end
    object cdsPlacesnamePod: TStringField
      FieldName = 'namePod'
      Size = 50
    end
    object cdsPlacesshifrWR: TIntegerField
      FieldName = 'shifrWR'
    end
    object cdsPlacesnameWR: TStringField
      FieldName = 'nameWR'
    end
    object cdsPlacesdolg: TStringField
      FieldName = 'dolg'
    end
    object cdsPlacessummaAdd: TFloatField
      FieldName = 'summaAdd'
    end
  end
  object frxReport1: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42197.800964618060000000
    ReportOptions.LastChange = 42197.823944768520000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    Left = 208
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
        Name = 'FIO'
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
        Height = 56.692950000000010000
        Top = 18.897650000000000000
        Width = 793.701300000000000000
        object Memo1: TfrxMemoView
          Left = 158.740260000000000000
          Top = 3.779530000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1038#1056#1111#1056#1105#1057#1027#1056#1109#1056#1108' '#1056#1112#1056#181#1057#1027#1057#8218' '#1057#1026#1056#176#1056#177#1056#1109#1057#8218#1057#8249' [FIO]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 177.637910000000000000
        Width = 793.701300000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo2: TfrxMemoView
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 37.795300000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."namePod"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 336.378170000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."nameWR"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 415.748300000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."dolg"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 18.897637795275590000
        Top = 98.267780000000000000
        Width = 793.701300000000000000
        object Memo8: TfrxMemoView
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
            #1074#8222#8211' '#1056#1111#1056#1111)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 37.795300000000000000
          Width = 298.582870000000000000
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
            #1056#1119#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 336.378170000000000000
          Width = 79.370130000000000000
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
            #1056#8217#1056#1105#1056#1169'.'#1057#1026'.')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 415.748300000000000000
          Width = 94.488250000000000000
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
            #1056#8221#1056#1109#1056#187#1056#182#1056#1029'.')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = cdsPlaces
    Left = 248
    Top = 72
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
    Left = 288
    Top = 72
  end
end
