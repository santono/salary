object FormRepKOS: TFormRepKOS
  Left = 207
  Top = 171
  Width = 696
  Height = 172
  Caption = #1057#1074#1077#1088#1082#1072' '#1082#1086#1101#1092#1080#1094#1080#1077#1085#1090#1086#1074', '#1086#1082#1083#1072#1076#1086#1074', '#1088#1072#1079#1088#1103#1076#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LabelPodr: TLabel
    Left = 24
    Top = 48
    Width = 48
    Height = 13
    Caption = 'LabelPodr'
  end
  object LabelFio: TLabel
    Left = 16
    Top = 8
    Width = 40
    Height = 13
    Caption = 'LabelFio'
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 24
    Width = 641
    Height = 17
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 80
    Width = 145
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1089#1074#1077#1088#1082#1091
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 488
    Top = 80
    Width = 147
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object BitBtn3: TBitBtn
    Left = 192
    Top = 80
    Width = 129
    Height = 25
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object ClientDataSetSverka: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ShifrPod'
        DataType = ftInteger
      end
      item
        Name = 'Tabno'
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
        Size = 10
      end
      item
        Name = 'Razr'
        DataType = ftInteger
      end
      item
        Name = 'Koef'
        DataType = ftFloat
      end
      item
        Name = 'Oklad'
        DataType = ftFloat
      end
      item
        Name = 'OkladCalc'
        DataType = ftFloat
      end
      item
        Name = 'OkladRazr'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 248
    Top = 48
    Data = {
      B60000009619E0BD010000001800000009000000000003000000B60008536869
      6672506F640400010000000000055461626E6F04000100000000000346494F01
      0049000000010005574944544802000200140004446F6C670100490000000100
      055749445448020002000A000452617A720400010000000000044B6F65660800
      040000000000054F6B6C61640800040000000000094F6B6C616443616C630800
      040000000000094F6B6C616452617A7208000400000000000000}
    object ClientDataSetSverkaShifrPod: TIntegerField
      FieldName = 'ShifrPod'
    end
    object ClientDataSetSverkaTabno: TIntegerField
      FieldName = 'Tabno'
    end
    object ClientDataSetSverkaFIO: TStringField
      FieldName = 'FIO'
    end
    object ClientDataSetSverkaDolg: TStringField
      FieldName = 'Dolg'
      Size = 10
    end
    object ClientDataSetSverkaRazr: TIntegerField
      FieldName = 'Razr'
    end
    object ClientDataSetSverkaKoef: TFloatField
      FieldName = 'Koef'
    end
    object ClientDataSetSverkaOklad: TFloatField
      FieldName = 'Oklad'
    end
    object ClientDataSetSverkaOkladCalc: TFloatField
      FieldName = 'OkladCalc'
    end
    object ClientDataSetSverkaOkladRazr: TFloatField
      FieldName = 'OkladRazr'
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = ClientDataSetSverka
    Left = 288
    Top = 48
  end
  object frxReport1: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41323.527223067130000000
    ReportOptions.LastChange = 41323.688894108790000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 328
    Top = 48
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
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
      object Header1: TfrxHeader
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 793.701300000000000000
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 64.252010000000000000
        Width = 793.701300000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1ShifrPod: TfrxMemoView
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'ShifrPod'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."ShifrPod"]')
          ParentFont = False
        end
        object frxDBDataset1Tabno: TfrxMemoView
          Left = 60.472480000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'Tabno'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."Tabno"]')
          ParentFont = False
        end
        object frxDBDataset1FIO: TfrxMemoView
          Left = 139.842610000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = 'FIO'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."FIO"]')
          ParentFont = False
        end
        object frxDBDataset1Dolg: TfrxMemoView
          Left = 298.582870000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'Dolg'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."Dolg"]')
          ParentFont = False
        end
        object frxDBDataset1Razr: TfrxMemoView
          Left = 377.953000000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'Razr'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."Razr"]')
          ParentFont = False
        end
        object frxDBDataset1Koef: TfrxMemoView
          Left = 430.866420000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'Koef'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."Koef"]')
          ParentFont = False
        end
        object frxDBDataset1Oklad: TfrxMemoView
          Left = 510.236550000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'Oklad'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."Oklad"]')
          ParentFont = False
        end
        object frxDBDataset1OkladCalc: TfrxMemoView
          Left = 589.606680000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'OkladCalc'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."OkladCalc"]')
          ParentFont = False
        end
        object frxDBDataset1OkladRazr: TfrxMemoView
          Left = 668.976810000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'OkladRazr'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."OkladRazr"]')
          ParentFont = False
        end
      end
    end
  end
end
