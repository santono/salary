object FormCheckMovedOtpFromSQL: TFormCheckMovedOtpFromSQL
  Left = 239
  Top = 146
  Width = 696
  Height = 180
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
    Left = 8
    Top = 56
    Width = 72
    Height = 20
    Caption = 'LabelPodr'
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 32
    Width = 665
    Height = 17
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 96
    Width = 233
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1087#1088#1086#1074#1077#1088#1082#1091
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 256
    Top = 96
    Width = 89
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object cdsCheck: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'nsrv'
        DataType = ftInteger
      end
      item
        Name = 'tabno'
        DataType = ftInteger
      end
      item
        Name = 'FIO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'dolg'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 360
    Top = 64
    Data = {
      660000009619E0BD0100000018000000040000000000030000006600046E7372
      760400010000000000057461626E6F04000100000000000346494F0100490000
      00010005574944544802000200320004646F6C67010049000000010005574944
      54480200020032000000}
    object cdsChecknsrv: TIntegerField
      FieldName = 'nsrv'
    end
    object cdsChecktabno: TIntegerField
      FieldName = 'tabno'
    end
    object cdsCheckFIO: TStringField
      FieldName = 'FIO'
      Size = 50
    end
    object cdsCheckdolg: TStringField
      FieldName = 'dolg'
      Size = 50
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
    ReportOptions.CreateDate = 45113.535124270830000000
    ReportOptions.LastChange = 45113.540261122680000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 400
    Top = 64
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
      object ReportTitle1: TfrxReportTitle
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 793.701300000000000000
        object Memo1: TfrxMemoView
          Left = 109.606370000000000000
          Width = 336.378170000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            ' '#1056#1116#1056#181' '#1057#1107#1056#1108#1056#176#1056#183#1056#176#1056#1029#1057#8249' '#1056#1030' '#1057#8218#1056#176#1056#177#1056#181#1056#187#1056#181' '#1056#1169#1056#1029#1056#1105' '#1056#1109#1057#8218#1056#1111#1057#1107#1057#1027#1056#1108#1056#176)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 102.047310000000000000
        Width = 793.701300000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo2: TfrxMemoView
          Left = 41.574830000000000000
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
            '[Line]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 79.370130000000000000
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
            '[frxDBDataset1."nsrv"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 136.063080000000000000
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
            '[frxDBDataset1."tabno"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 192.756030000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."FIO"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 343.937230000000000000
          Width = 188.976377950000000000
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
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = cdsCheck
    Left = 440
    Top = 64
  end
end
