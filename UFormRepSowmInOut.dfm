object FormRepSowmInOut: TFormRepSowmInOut
  Left = 253
  Top = 275
  Width = 657
  Height = 223
  Caption = #1057#1087#1080#1089#1086#1082' '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1077#1081
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
  object Label2: TLabel
    Left = 16
    Top = 32
    Width = 11
    Height = 20
    Caption = #1042
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 64
    Width = 185
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1086#1090#1095#1077#1090' '#1080#1079' '#1041#1044
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 528
    Top = 64
    Width = 91
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object dtIn: TDateTimePicker
    Left = 32
    Top = 24
    Width = 186
    Height = 28
    Date = 42103.810000277780000000
    Time = 42103.810000277780000000
    DateFormat = dfLong
    TabOrder = 2
  end
  object rgMode: TRadioGroup
    Left = 224
    Top = 8
    Width = 281
    Height = 49
    Caption = #1056#1077#1078#1080#1084
    Columns = 2
    Items.Strings = (
      #1042#1085#1077#1096#1085#1080#1077
      #1042#1085#1091#1090#1088#1077#1085#1085#1080#1077)
    TabOrder = 3
  end
  object cbSummy: TCheckBox
    Left = 264
    Top = 72
    Width = 209
    Height = 17
    Caption = #1058#1086#1083#1100#1082#1086' '#1089' '#1089#1091#1084#1084#1072#1084#1080
    TabOrder = 4
  end
  object BitBtn3: TBitBtn
    Left = 16
    Top = 104
    Width = 217
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1086#1090#1095#1077#1090' '#1080#1079' '#1092#1072#1081#1083#1086#1074
    TabOrder = 5
    OnClick = BitBtn3Click
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 144
    Width = 609
    Height = 17
    TabOrder = 6
  end
  object dsoREP: TDataSource
    DataSet = pFIBdsRep
    Left = 296
    Top = 64
  end
  object pFIBdsRep: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' TABNO,'
      ' FIO,'
      ' SHIFRPOD,'
      ' NAMEPOD,'
      ' SUMMA,'
      ' namekind'
      'FROM'
      ' PR_LIST_SOWM_IN_OUT(:Y,'
      ' :M,'
      ' :MODE,'
      ' :NEEDSUMMA) '
      'order by shifrpod,fio')
    Transaction = pFIBTrRepRead
    Database = FIB.pFIBDatabaseSal
    Left = 224
    Top = 64
    object pFIBdsRepTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object pFIBdsRepFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 60
      EmptyStrToNull = True
    end
    object pFIBdsRepSHIFRPOD: TFIBIntegerField
      FieldName = 'SHIFRPOD'
    end
    object pFIBdsRepNAMEPOD: TFIBStringField
      FieldName = 'NAMEPOD'
      Size = 256
      EmptyStrToNull = True
    end
    object pFIBdsRepSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsRepNAMEKIND: TFIBStringField
      FieldName = 'NAMEKIND'
      Size = 32
      EmptyStrToNull = True
    end
  end
  object pFIBTrRepRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 264
    Top = 64
  end
  object frxReport1: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41618.384121944440000000
    ReportOptions.LastChange = 42136.828083796300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    Left = 336
    Top = 64
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
        Name = 'Year'
        Value = ''
      end
      item
        Name = 'Month'
        Value = ''
      end
      item
        Name = 'Mode'
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
        Height = 22.677165354330710000
        Top = 18.897650000000000000
        Width = 793.701300000000000000
        object Memo1: TfrxMemoView
          Left = 147.401670000000000000
          Width = 430.866420000000000000
          Height = 22.677165354330710000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#1111#1056#1105#1057#1027#1056#1109#1056#1108' [Mode] '#1056#183#1056#176' [Year]  [Month],'
            '')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 147.401670000000000000
        Width = 793.701300000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
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
        object frxDBDataset1TABNO: TfrxMemoView
          Left = 41.574830000000000000
          Width = 52.913395590000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataField = 'TABNO'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."TABNO"]')
          ParentFont = False
        end
        object frxDBDataset1FIO1: TfrxMemoView
          Left = 94.488188980000000000
          Width = 283.464566930000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
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
        object frxDBDataset1W_PLACE: TfrxMemoView
          Left = 377.953000000000000000
          Width = 381.732310310000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."SHIFRPOD"] [frxDBDataset1."NAMEPOD"]')
          ParentFont = False
          SuppressRepeated = True
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 22.677180000000000000
        Top = 64.252010000000000000
        Width = 793.701300000000000000
        object Memo3: TfrxMemoView
          Width = 37.795275590551180000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111'.'#1056#1111'.')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 37.795275590000000000
          Width = 56.692925590000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1118#1056#176#1056#177'.'#1056#1029#1056#1109#1056#1112#1056#181#1057#1026)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 94.488188976377950000
          Width = 283.464566929133900000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#176#1056#1112#1056#1105#1056#187#1056#1105#1057#1039' '#1056#152#1056#1112#1057#1039' '#1056#1115#1057#8218#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 377.953000000000000000
          Width = 377.953000000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181)
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'TABNO=TABNO'
      'FIO=FIO'
      'SHIFRPOD=SHIFRPOD'
      'NAMEPOD=NAMEPOD'
      'SUMMA=SUMMA'
      'NAMEKIND=NAMEKIND')
    DataSet = pFIBdsRep
    Left = 376
    Top = 64
  end
  object cdsSwm: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
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
        Name = 'shifrpod'
        DataType = ftInteger
      end
      item
        Name = 'namepod'
        DataType = ftString
        Size = 96
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 376
    Top = 96
    Data = {
      7B0000009619E0BD0100000018000000050000000000030000007B0005746162
      6E6F04000100000000000366696F010049000000010005574944544802000200
      32000573756D6D610800040000000000087368696672706F6404000100000000
      00076E616D65706F6401004900000001000557494454480200020060000000}
    object cdsSwmtabno: TIntegerField
      FieldName = 'tabno'
    end
    object cdsSwmfio: TStringField
      FieldName = 'fio'
      Size = 50
    end
    object cdsSwmsumma: TFloatField
      FieldName = 'summa'
    end
    object cdsSwmshifrpod: TIntegerField
      FieldName = 'shifrpod'
    end
    object cdsSwmnamepod: TStringField
      FieldName = 'namepod'
      Size = 96
    end
  end
  object frxReport2: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42648.642568344910000000
    ReportOptions.LastChange = 42648.654591377320000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReport2GetValue
    Left = 272
    Top = 104
    Datasets = <
      item
        DataSet = frxDBDatasetCDS
        DataSetName = 'frxDBDatasetCDS'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'comment'
        Value = ''
      end
      item
        Name = 'data'
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
        Height = 117.165430000000000000
        Top = 18.897650000000000000
        Width = 793.701300000000000000
        object Memo9: TfrxMemoView
          Left = 222.992270000000000000
          Width = 510.236550000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#1111#1056#1105#1057#1027#1056#1109#1056#1108' '#1057#1027#1056#1109#1056#1030#1056#1112#1056#181#1057#1027#1057#8218#1056#1105#1057#8218#1056#181#1056#187#1056#181#1056#8470' [comment]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 238.110390000000000000
        Width = 793.701300000000000000
        DataSet = frxDBDatasetCDS
        DataSetName = 'frxDBDatasetCDS'
        RowCount = 0
        Stretched = True
        object Memo1: TfrxMemoView
          Width = 37.795300000000000000
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
            '[Line]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 37.795300000000000000
          Width = 94.488250000000000000
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
            '[frxDBDatasetCDS."tabno"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 132.283550000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDatasetCDS."fio"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 419.527830000000000000
          Width = 359.055350000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDatasetCDS."namepod"]')
          ParentFont = False
          SuppressRepeated = True
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 18.897650000000000000
        Top = 158.740260000000000000
        Width = 793.701300000000000000
        object Memo5: TfrxMemoView
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
            #1074#8222#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 37.795300000000000000
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
            #1056#1118#1056#176#1056#177'.'#1056#1029'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 132.283550000000000000
          Width = 287.244280000000000000
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
            #1056#164#1056#152#1056#1115)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 419.527830000000000000
          Width = 359.055350000000000000
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
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBDatasetCDS: TfrxDBDataset
    UserName = 'frxDBDatasetCDS'
    CloseDataSource = False
    DataSet = cdsSwm
    Left = 312
    Top = 104
  end
end
