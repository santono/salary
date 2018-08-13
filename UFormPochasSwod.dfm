object FormPochasSwod: TFormPochasSwod
  Left = 238
  Top = 285
  Width = 715
  Height = 330
  Caption = #1057#1074#1086#1076' '#1087#1086' '#1087#1086#1095#1072#1089#1086#1074#1082#1077
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
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 673
    Height = 241
    ActivePage = TabSheetSwod
    TabOrder = 0
    object TabSheetSwod: TTabSheet
      Caption = #1057#1074#1086#1076
      object LabelFio: TLabel
        Left = -8
        Top = 8
        Width = 61
        Height = 20
        Caption = 'LabelFio'
      end
      object LabelPodr: TLabel
        Left = 0
        Top = 64
        Width = 72
        Height = 20
        Caption = 'LabelPodr'
      end
      object ProgressBar1: TProgressBar
        Left = 0
        Top = 32
        Width = 665
        Height = 21
        TabOrder = 0
      end
      object BitBtn1: TBitBtn
        Left = 8
        Top = 96
        Width = 129
        Height = 25
        Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1074#1086#1076
        TabOrder = 1
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 568
        Top = 96
        Width = 97
        Height = 25
        Caption = '&'#1042#1099#1093#1086#1076
        TabOrder = 2
        Kind = bkClose
      end
    end
    object TabSheetPar: TTabSheet
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
      ImageIndex = 1
      object RadioGroupUch: TRadioGroup
        Left = 0
        Top = 8
        Width = 265
        Height = 49
        Caption = #1055#1086
        Columns = 2
        Items.Strings = (
          #1091#1085#1080#1074#1077#1088#1089#1080#1090#1077#1090#1091
          #1091#1095#1072#1089#1090#1082#1091)
        TabOrder = 0
        OnClick = RadioGroupUchClick
      end
      object ComboBoxUch: TComboBox
        Left = 272
        Top = 24
        Width = 361
        Height = 28
        ItemHeight = 0
        TabOrder = 1
        Text = 'ComboBoxUch'
        OnChange = ComboBoxUchChange
      end
      object RadioGroupSort: TRadioGroup
        Left = 0
        Top = 64
        Width = 585
        Height = 57
        Caption = #1059#1087#1086#1088#1103#1076#1086#1095#1080#1090#1100' '#1087#1086' '
        Columns = 3
        Items.Strings = (
          #1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103#1084
          #1090#1072#1073'.'#1085#1086#1084#1077#1088#1072#1084
          #1092#1072#1084#1080#1083#1080#1103#1084)
        TabOrder = 2
      end
      object BitBtn3: TBitBtn
        Left = 8
        Top = 136
        Width = 577
        Height = 25
        Caption = #1042#1099#1073#1086#1088' '#1089#1095#1077#1090#1086#1074
        TabOrder = 3
        OnClick = BitBtn3Click
      end
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
    ReportOptions.CreateDate = 40860.588234409720000000
    ReportOptions.LastChange = 41096.977667199080000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    Left = 200
    Top = 208
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
        Name = 'YM'
        Value = ''
      end
      item
        Name = 'ModeName'
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
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 68.031540000000010000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 245.669450000000000000
          Top = 3.779530000000001000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1038#1056#1030#1056#1109#1056#1169' '#1056#1111#1056#1109' '#1056#1111#1056#1109#1057#8225#1056#176#1057#1027#1056#1109#1056#1030#1056#1108#1056#181' [YM]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Top = 49.133890000000010000
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
            #1074#8222#8211' '#1056#1111'.'#1056#1111'.')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 37.795300000000000000
          Top = 49.133890000000010000
          Width = 56.692950000000010000
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
            #1057#8218'.'#1056#1029'.')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 94.488250000000000000
          Top = 49.133890000000010000
          Width = 151.181200000000000000
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
            #1056#164' '#1056#152' '#1056#1115)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 245.669450000000000000
          Top = 49.133890000000010000
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
            #1056#8221#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034)
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 340.157700000000000000
          Top = 49.133890000000010000
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
            #1056#8220#1056#1109#1056#1169)
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 377.953000000000000000
          Top = 49.133890000000010000
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
            #1056#1114'-'#1057#8224)
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 415.748300000000000000
          Top = 49.133890000000010000
          Width = 56.692950000000010000
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
            #1056#167#1056#176#1057#1027#1056#1109#1056#1030)
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 472.441250000000000000
          Top = 49.133890000000010000
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
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 566.929499999999900000
          Top = 49.133890000000010000
          Width = 56.692950000000010000
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
            #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1057#8225#1056#176#1057#1027#1056#1109#1056#1030)
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 245.669450000000000000
          Top = 30.236239999999990000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[ModeName]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 623.622450000000000000
          Top = 49.133890000000010000
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
            #1056#1119#1056#1109#1056#1169#1057#1026)
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 661.417750000000000000
          Top = 49.133890000000010000
          Width = 56.692913385826770000
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
            #1056#1038#1057#8225#1056#181#1057#8218)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897637800000000000
        Top = 147.401670000000000000
        Width = 718.110700000000000000
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
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[Line#]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 37.795300000000000000
          Width = 56.692913390000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."Tabno"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 94.488250000000000000
          Width = 151.181102360000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."FIO"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 245.669450000000000000
          Width = 94.488250000000000000
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
        object Memo6: TfrxMemoView
          Left = 340.157700000000000000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."Y"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 377.953000000000000000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."M"]')
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
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."Summa" #n%2,2f]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 566.929499999999900000
          Width = 56.692913390000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset1."ClockTot" #n%2,2f]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 623.622450000000000000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset1."Podr"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 415.748300000000000000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.1f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            ' [frxDBDataset1."Clock" #n%2,1f]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 661.417750000000000000
          Width = 56.692913390000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."GruppaName"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 18.897637795275590000
        Top = 188.976500000000000000
        Width = 718.110700000000000000
        object Memo11: TfrxMemoView
          Left = 472.441250000000000000
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
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."Summa">,MasterData1)]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 415.748300000000000000
          Width = 56.692950000000010000
          Height = 18.897637800000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."Clock">,MasterData1) #n%2,1f]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'Tabno=Tabno'
      'FIO=FIO'
      'Dolg=Dolg'
      'Y=Y'
      'M=M'
      'Clock=Clock'
      'ClockTot=ClockTot'
      'Summa=Summa'
      'Podr=Podr'
      'PodrName=PodrName'
      'ShifrGru=ShifrGru'
      'GruppaName=GruppaName')
    DataSet = cdsPochas
    Left = 240
    Top = 208
  end
  object cdsPochas: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
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
        Name = 'Y'
        DataType = ftInteger
      end
      item
        Name = 'M'
        DataType = ftInteger
      end
      item
        Name = 'Clock'
        DataType = ftFloat
      end
      item
        Name = 'ClockTot'
        DataType = ftFloat
      end
      item
        Name = 'Summa'
        DataType = ftFloat
      end
      item
        Name = 'Podr'
        DataType = ftInteger
      end
      item
        Name = 'PodrName'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ShifrGru'
        DataType = ftInteger
      end
      item
        Name = 'GruppaName'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 160
    Top = 208
    Data = {
      F40000009619E0BD01000000180000000C000000000003000000F40005546162
      6E6F04000100000000000346494F010049000000010005574944544802000200
      140004446F6C670100490000000100055749445448020002000A000159040001
      0000000000014D040001000000000005436C6F636B080004000000000008436C
      6F636B546F7408000400000000000553756D6D61080004000000000004506F64
      72040001000000000008506F64724E616D650100490000000100055749445448
      02000200140008536869667247727504000100000000000A4772757070614E61
      6D6501004900000001000557494454480200020014000000}
    object cdsPochasTabno: TIntegerField
      FieldName = 'Tabno'
    end
    object cdsPochasFIO: TStringField
      FieldName = 'FIO'
    end
    object cdsPochasDolg: TStringField
      FieldName = 'Dolg'
      Size = 10
    end
    object cdsPochasY: TIntegerField
      FieldName = 'Y'
    end
    object cdsPochasM: TIntegerField
      FieldName = 'M'
    end
    object cdsPochasClock: TFloatField
      FieldName = 'Clock'
    end
    object cdsPochasClockTot: TFloatField
      FieldName = 'ClockTot'
    end
    object cdsPochasSumma: TFloatField
      FieldName = 'Summa'
    end
    object cdsPochasPodr: TIntegerField
      FieldName = 'Podr'
    end
    object cdsPochasPodrName: TStringField
      FieldName = 'PodrName'
    end
    object cdsPochasShifrGru: TIntegerField
      FieldName = 'ShifrGru'
    end
    object cdsPochasGruppaName: TStringField
      FieldName = 'GruppaName'
    end
  end
  object pFIBDataSetUch: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' NOMEROP,'
      ' FIOOP||'#39' '#39'||NAMEOP as op,'
      ' SHIFRWRK'
      'FROM'
      ' OPERATORY '
      'where SHIFRPRA=2'
      
        'and (select count(*) from bay where bay.shifrbuh=operatory.shifr' +
        'wrk) > 0'
      'ORDER BY NOMEROP')
    AllowedUpdateKinds = []
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    Left = 276
    Top = 207
    object pFIBDataSetUchNOMEROP: TFIBSmallIntField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'NOMEROP'
    end
    object pFIBDataSetUchOP: TFIBStringField
      DisplayLabel = #1041#1091#1093#1075#1072#1083#1090#1077#1088
      FieldName = 'OP'
      Size = 82
      EmptyStrToNull = True
    end
    object pFIBDataSetUchSHIFRWRK: TFIBIntegerField
      FieldName = 'SHIFRWRK'
      Visible = False
    end
  end
  object pFIBTransactionRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 316
    Top = 207
  end
  object DataSourceUch: TDataSource
    DataSet = pFIBDataSetUch
    Left = 348
    Top = 207
  end
  object pFIBQueryUch: TpFIBQuery
    Transaction = pFIBTransactionReadQ
    Database = FIB.pFIBDatabaseSal
    SQL.Strings = (
      'SELECT'
      ' SHIFRPOD,'
      ' SHIFRBUH'
      'FROM'
      ' BAY '
      'where SHIFRBUH=:SHIFRBUH')
    Left = 380
    Top = 207
  end
  object pFIBTransactionReadQ: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 412
    Top = 207
  end
end
