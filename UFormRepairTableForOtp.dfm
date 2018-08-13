object FormRepairTableForOtp: TFormRepairTableForOtp
  Left = 144
  Top = 232
  Width = 870
  Height = 139
  Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1090#1072#1073#1077#1083#1103'  '#1076#1083#1103' '#1086#1090#1087#1091#1089#1082#1085#1099#1093' '#1079#1072' '#1080#1102#1085#1100' 2013'
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
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 16
    Width = 793
    Height = 17
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 56
    Width = 129
    Height = 25
    Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 720
    Top = 56
    Width = 75
    Height = 25
    Caption = '&'#1047#1072#1082#1088#1099#1090#1100
    TabOrder = 2
    Kind = bkClose
  end
  object CheckBoxCorr: TCheckBox
    Left = 160
    Top = 64
    Width = 129
    Height = 17
    Caption = #1048#1089#1087#1088#1072#1074#1083#1103#1090#1100
    TabOrder = 3
  end
  object BitBtn3: TBitBtn
    Left = 304
    Top = 48
    Width = 273
    Height = 25
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object ClientDataSetOtp: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Tabno'
        DataType = ftInteger
      end
      item
        Name = 'Fio'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Dolg'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RbB'
        DataType = ftInteger
      end
      item
        Name = 'RbA'
        DataType = ftInteger
      end
      item
        Name = 'ShifrPod'
        DataType = ftInteger
      end
      item
        Name = 'Block'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'SummaOklad'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 592
    Top = 48
    Data = {
      AF0000009619E0BD010000001800000008000000000003000000AF0005546162
      6E6F04000100000000000346696F010049000000010005574944544802000200
      140004446F6C6701004900000001000557494454480200020014000352624204
      00010000000000035262410400010000000000085368696672506F6404000100
      0000000005426C6F636B01004900000001000557494454480200020002000A53
      756D6D614F6B6C616408000400000000000000}
    object ClientDataSetOtpTabno: TIntegerField
      FieldName = 'Tabno'
    end
    object ClientDataSetOtpFio: TStringField
      FieldName = 'Fio'
    end
    object ClientDataSetOtpDolg: TStringField
      FieldName = 'Dolg'
    end
    object ClientDataSetOtpRbB: TIntegerField
      FieldName = 'RbB'
    end
    object ClientDataSetOtpRbA: TIntegerField
      FieldName = 'RbA'
    end
    object ClientDataSetOtpShifrPod: TIntegerField
      FieldName = 'ShifrPod'
    end
    object ClientDataSetOtpBlock: TStringField
      FieldName = 'Block'
      Size = 2
    end
    object ClientDataSetOtpSummaOklad: TFloatField
      FieldName = 'SummaOklad'
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
    ReportOptions.CreateDate = 41098.928784178240000000
    ReportOptions.LastChange = 41098.949121817130000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 672
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
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo1: TfrxMemoView
          Width = 49.133890000000000000
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
        object Memo2: TfrxMemoView
          Left = 49.133890000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."Tabno"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 113.385900000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."Fio"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 302.362400000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."Dolg"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 377.953000000000000000
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
            '[frxDBDataset1."RbB"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 419.527830000000000000
          Width = 34.015770000000010000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."RbA"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 453.543600000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."ShifrPod"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 498.897960000000000000
          Width = 34.015770000000010000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."Block"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 532.913730000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."SummaOklad"]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = ClientDataSetOtp
    Left = 632
    Top = 48
  end
end
