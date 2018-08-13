object FormRepPensInv: TFormRepPensInv
  Left = 253
  Top = 275
  Width = 657
  Height = 146
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1077#1085#1089#1080#1086#1085#1077#1088#1086#1074' '#1080#1083#1080' '#1080#1085#1074#1072#1083#1080#1076#1086#1074
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
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1086#1090#1095#1077#1090
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
      #1055#1077#1085#1089#1080#1086#1085#1077#1088#1099
      #1048#1085#1074#1072#1083#1080#1076#1099)
    TabOrder = 3
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
      ' PR_LIST_PENS_INV(:Y,'
      ' :M,'
      ' :MODE) '
      'order by namekind desc,fio')
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
    ReportOptions.LastChange = 42103.878044710650000000
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
        Top = 192.756030000000000000
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
          Left = 453.543600000000000000
          Width = 340.157480310000000000
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
        object frxDBDataset1SUMMA: TfrxMemoView
          Left = 377.953000000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataField = 'SUMMA'
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
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset1."SUMMA"]')
          ParentFont = False
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
          Left = 453.543600000000000000
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
        object Memo7: TfrxMemoView
          Left = 377.953000000000000000
          Width = 75.590551181102360000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 22.677180000000000000
        Top = 321.260050000000000000
        Width = 793.701300000000000000
        object Memo8: TfrxMemoView
          Left = 377.953000000000000000
          Top = 3.779530000000000000
          Width = 75.590600000000000000
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
            '[SUM(<frxDBDataset1."SUMMA">,MasterData1)]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 154.960730000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109)
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 147.401670000000000000
        Width = 793.701300000000000000
        Condition = 'frxDBDataset1."NAMEKIND"'
        object frxDBDataset1NAMEKIND: TfrxMemoView
          Left = 30.236240000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          DataField = 'NAMEKIND'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."NAMEKIND"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 238.110390000000000000
        Width = 793.701300000000000000
        object frxDBDataset1SUMMA1: TfrxMemoView
          Left = 377.953000000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
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
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."SUMMA">,MasterData1)]')
          ParentFont = False
        end
        object frxDBDataset1NAMEKIND1: TfrxMemoView
          Left = 56.692950000000000000
          Width = 309.921460000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' [frxDBDataset1."NAMEKIND"]')
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
end
