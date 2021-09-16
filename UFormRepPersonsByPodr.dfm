object FormRepPersonsByPodr: TFormRepPersonsByPodr
  Left = 434
  Top = 343
  Width = 669
  Height = 242
  Caption = #1055#1077#1088#1077#1083'i'#1082' '#1089#1087'i'#1074#1088#1086#1073'i'#1090#1085#1080#1082'i'#1074' '#1079#1072' '#1084'i'#1089#1094#1077#1084' '#1087#1088#1072#1094'i'
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
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 353
    Height = 49
    Caption = #1042'i'#1076' '#1088#1086#1073#1086#1090#1080
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      #1054#1089#1085
      #1057#1091#1084
      #1054#1089#1085#1058#1072#1057#1091#1084)
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 112
    Width = 465
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1089#1074#1086#1076#1072
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 16
    Top = 144
    Width = 465
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 176
    Width = 465
    Height = 21
    Smooth = True
    TabOrder = 3
  end
  object BitBtn3: TBitBtn
    Left = 8
    Top = 72
    Width = 473
    Height = 25
    Caption = #1054#1073#1088#1072#1085#1085#1103' '#1087'i'#1076#1088#1086#1079#1076'i'#1083'i'#1074' '#1090#1072' '#1088#1072#1093#1091#1085#1082'i'#1074
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object cdsList: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'tabno'
        DataType = ftInteger
      end
      item
        Name = 'PIB'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'INN'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'POSADA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'katname'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'koef'
        DataType = ftFloat
      end
      item
        Name = 'OKLAD'
        DataType = ftFloat
      end
      item
        Name = 'Vysl'
        DataType = ftInteger
      end
      item
        Name = 'Stepen'
        DataType = ftInteger
      end
      item
        Name = 'Zwan'
        DataType = ftInteger
      end
      item
        Name = 'Skladnist'
        DataType = ftInteger
      end
      item
        Name = 'Doplata'
        DataType = ftInteger
      end
      item
        Name = 'shifrpod'
        DataType = ftInteger
      end
      item
        Name = 'namePod'
        DataType = ftString
        Size = 96
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 504
    Top = 120
    Data = {
      220100009619E0BD01000000180000000E000000000003000000220105746162
      6E6F040001000000000003504942010049000000010005574944544802000200
      320003494E4E0100490000000100055749445448020002000A0006504F534144
      410100490000000100055749445448020002001E00076B61746E616D65010049
      0000000100055749445448020002000A00046B6F65660800040000000000054F
      4B4C41440800040000000000045679736C04000100000000000653746570656E
      0400010000000000045A77616E040001000000000009536B6C61646E69737404
      0001000000000007446F706C6174610400010000000000087368696672706F64
      0400010000000000076E616D65506F6401004900000001000557494454480200
      020060000000}
    object cdsListtabno: TIntegerField
      FieldName = 'tabno'
    end
    object cdsListPIB: TStringField
      FieldName = 'PIB'
      Size = 50
    end
    object cdsListINN: TStringField
      FieldName = 'INN'
      Size = 10
    end
    object cdsListPOSADA: TStringField
      FieldName = 'POSADA'
      Size = 30
    end
    object cdsListkatname: TStringField
      FieldName = 'katname'
      Size = 10
    end
    object cdsListkoef: TFloatField
      FieldName = 'koef'
    end
    object cdsListOKLAD: TFloatField
      FieldName = 'OKLAD'
    end
    object cdsListVysl: TIntegerField
      FieldName = 'Vysl'
    end
    object cdsListStepen: TIntegerField
      FieldName = 'Stepen'
    end
    object cdsListZwan: TIntegerField
      FieldName = 'Zwan'
    end
    object cdsListSkladnist: TIntegerField
      FieldName = 'Skladnist'
    end
    object cdsListDoplata: TIntegerField
      FieldName = 'Doplata'
    end
    object cdsListshifrpod: TIntegerField
      FieldName = 'shifrpod'
    end
    object cdsListnamePod: TStringField
      FieldName = 'namePod'
      Size = 96
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = cdsList
    Left = 544
    Top = 120
  end
  object frxReport1: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42669.514654178240000000
    ReportOptions.LastChange = 44455.895147256950000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    Left = 584
    Top = 120
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
        Name = 'LIMITSUMMA'
        Value = ''
      end
      item
        Name = 'CURRENTDATA'
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
        Height = 49.133890000000000000
        Top = 18.897650000000000000
        Width = 1122.520410000000000000
      end
      object MasterData1: TfrxMasterData
        Height = 18.897637795275590000
        Top = 238.110390000000000000
        Width = 1122.520410000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[Line]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 41.574830000000000000
          Width = 60.472443390000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."tabno"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 102.047310000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."INN"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 188.976500000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."PIB"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 411.968770000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."POSADA"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 529.134200000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."katname"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 623.622450000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."koef"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 680.315400000000000000
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
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."OKLAD"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 774.803650000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset1."Vysl"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 831.496600000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset1."Stepen"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 888.189550000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset1."Zwan"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 944.882500000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset1."Skladnist"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 997.795920000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset1."Doplata"]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 37.795275590000000000
        Top = 317.480520000000000000
        Width = 1122.520410000000000000
      end
      object PageHeader1: TfrxPageHeader
        Height = 22.677165350000000000
        Top = 90.708720000000000000
        Width = 1122.520410000000000000
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 41.574830000000000000
        Top = 173.858380000000000000
        Width = 1122.520410000000000000
        Condition = 'frxDBDataset1."shifrpod"'
        object Memo20: TfrxMemoView
          Left = 529.133980310000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#176#1057#8218#1056#181#1056#1110#1056#1109#1057#1026'i'#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 623.622169290000000000
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#187#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 680.315400000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1115#1056#1108#1056#187#1056#176#1056#1169)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 774.803650000000000000
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1056#1105#1057#1027#1056#187#1057#1107#1056#1110#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 831.496600000000000000
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8212#1056#1030#1056#176#1056#1029#1056#1029#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 888.189550000000000000
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#8218#1057#1107#1056#1111'i'#1056#1029#1057#1034)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 944.882500000000000000
          Top = 18.897650000000000000
          Width = 52.913395590000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#1108#1056#187#1056#176#1056#1169#1056#1029)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 997.795920000000000000
          Top = 18.897650000000000000
          Width = 64.251985590000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#1111#1056#187)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 188.976500000000000000
          Top = 18.897650000000000000
          Width = 222.992270000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#8224#1056#8216)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 41.574830000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1118'.'#1056#1029'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 3.779530000000000000
          Top = 18.897650000000000000
          Width = 37.795300000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211#1056#1111#1056#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 411.968770000000000000
          Top = 18.897650000000000000
          Width = 117.165430000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1057#1027#1056#176#1056#1169#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 102.047310000000000000
          Top = 18.897650000000000000
          Width = 86.929190000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'I'#1056#1169'.'#1056#1108#1056#1109#1056#1169)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Left = 34.015770000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."shifrpod"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 86.929190000000000000
          Width = 744.567410000000000000
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
      end
    end
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
    Left = 504
    Top = 80
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
    Left = 544
    Top = 80
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    Left = 584
    Top = 80
  end
end
