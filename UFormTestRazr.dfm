object FormTestRazr: TFormTestRazr
  Left = 216
  Top = 249
  Width = 697
  Height = 265
  Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1103' '#1088#1072#1079#1088#1103#1076#1086#1074' '#1076#1086#1083#1078#1085#1086#1089#1090#1103#1084
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
  object LabelDolgCode: TLabel
    Left = 232
    Top = 120
    Width = 126
    Height = 20
    Caption = #1050#1086#1076' '#1076#1086#1083#1078#1085#1086#1075#1089#1090#1080
  end
  object LabelRazr: TLabel
    Left = 216
    Top = 160
    Width = 142
    Height = 20
    Caption = #1058#1088#1077#1073#1091#1077#1084#1099#1081' '#1088#1072#1079#1088#1103#1076
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
  object cbMode: TCheckBox
    Left = 48
    Top = 120
    Width = 161
    Height = 17
    Caption = #1042#1099#1073#1086#1088' '#1076#1086#1083#1078#1085#1089#1090#1080
    TabOrder = 3
    OnClick = cbModeClick
  end
  object dxCalcDolgCode: TdxCalcEdit
    Left = 368
    Top = 112
    Width = 121
    TabOrder = 4
    Text = '0'
  end
  object dxCalcRazr: TdxCalcEdit
    Left = 368
    Top = 152
    Width = 121
    TabOrder = 5
    Text = '0'
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
        Name = 'Dolg'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'DolgPerson'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RazrNeed'
        DataType = ftInteger
      end
      item
        Name = 'RazrFakt'
        DataType = ftInteger
      end
      item
        Name = 'dolgCode'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 280
    Top = 72
    Data = {
      BC0000009619E0BD010000001800000008000000000003000000BC0008736869
      6672506F640400010000000000057461626E6F04000100000000000366696F01
      0049000000010005574944544802000200140004446F6C670100490000000100
      0557494454480200020028000A446F6C67506572736F6E010049000000010005
      57494454480200020014000852617A724E65656404000100000000000852617A
      7246616B74040001000000000008646F6C67436F646504000100000000000000}
    object dsTestshifrPod: TIntegerField
      FieldName = 'shifrPod'
    end
    object dsTesttabno: TIntegerField
      FieldName = 'tabno'
    end
    object dsTestfio: TStringField
      FieldName = 'fio'
    end
    object dsTestDolg: TStringField
      FieldName = 'Dolg'
      Size = 40
    end
    object dsTestDolgPerson: TStringField
      FieldName = 'DolgPerson'
    end
    object dsTestRazrNeed: TIntegerField
      FieldName = 'RazrNeed'
    end
    object dsTestRazrFakt: TIntegerField
      FieldName = 'RazrFakt'
    end
    object dsTestdolgCode: TIntegerField
      FieldName = 'dolgCode'
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
    ReportOptions.LastChange = 42557.945604027780000000
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
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
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
        Height = 37.795275590551180000
        Top = 18.897650000000000000
        Width = 1122.520410000000000000
        object Memo1: TfrxMemoView
          Left = 185.196970000000000000
          Top = 3.779530000000000000
          Width = 445.984540000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              #1056#1118#1056#181#1057#1027#1057#8218#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1057#1027#1056#1109#1056#1109#1057#8218#1056#1030#1056#181#1057#8218#1057#1027#1057#8218#1056#1030#1056#1105#1057#1039' '#1057#1026#1056#176#1056#183#1057#1026#1057#1039#1056#1169#1056#1109 +
              #1056#1030' '#1056#1169#1056#1109#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1039#1056#1112' [Month] [Year]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897637800000000000
        Top = 117.165430000000000000
        Width = 1122.520410000000000000
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
        RowCount = 0
        object Memo2: TfrxMemoView
          Width = 37.795275590551180000
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
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'shifrPod'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset2."shifrPod"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 132.283550000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'tabno'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset2."tabno"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 226.771800000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          DataField = 'fio'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset2."fio"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 532.913730000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          DataField = 'Dolg'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset2."Dolg"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 721.890230000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          DataField = 'DolgPerson'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset2."DolgPerson"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 869.291900000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset2."RazrNeed"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 963.780150000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset2."RazrFakt"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 453.543600000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset2."dolgCode"]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    DataSet = dsTest
    Left = 360
    Top = 72
  end
end
