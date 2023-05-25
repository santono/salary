object FormSwodAlla: TFormSwodAlla
  Left = 223
  Top = 161
  Width = 696
  Height = 279
  Caption = #1057#1074#1086#1076' '#1079#1072' '#1087#1077#1088#1080#1086#1076
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 24
    Top = 208
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 0
    Kind = bkClose
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 665
    Height = 193
    ActivePage = TabSheetKRU
    TabOrder = 1
    object TabSheetAlla: TTabSheet
      Caption = #1057#1074#1086#1076' '#1074' '#1076#1074#1077' '#1082#1086#1083#1086#1085#1082#1080
      object Label1: TLabel
        Left = 24
        Top = 24
        Width = 7
        Height = 13
        Caption = 'C'
      end
      object Label2: TLabel
        Left = 192
        Top = 16
        Width = 12
        Height = 13
        Caption = #1087#1086
      end
      object dtFR: TDateTimePicker
        Left = 40
        Top = 16
        Width = 137
        Height = 21
        Date = 42754.968500995370000000
        Time = 42754.968500995370000000
        DateFormat = dfLong
        TabOrder = 0
        OnChange = dtFRChange
      end
      object dtTo: TDateTimePicker
        Left = 208
        Top = 16
        Width = 129
        Height = 21
        Date = 42754.968985173610000000
        Time = 42754.968985173610000000
        DateFormat = dfLong
        TabOrder = 1
        OnChange = dtToChange
      end
      object rgModeGru: TRadioGroup
        Left = 32
        Top = 48
        Width = 257
        Height = 41
        Caption = #1056#1077#1078#1080#1084
        Columns = 2
        Items.Strings = (
          #1042#1089#1077' '#1089#1095#1077#1090#1072
          #1059#1082#1072#1079#1072#1085#1085#1099#1081' '#1089#1095#1077#1090)
        TabOrder = 2
        OnClick = rgModeGruClick
      end
      object btCreate: TBitBtn
        Left = 32
        Top = 96
        Width = 137
        Height = 25
        Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1074#1086#1076' '#1082#1072#1082' '#1074' '#1047#1055
        TabOrder = 3
        OnClick = btCreateClick
      end
      object cbShifrGru: TComboBox
        Left = 200
        Top = 96
        Width = 145
        Height = 21
        ItemHeight = 0
        TabOrder = 4
        Text = 'cbShifrGru'
      end
      object cbPeriod: TCheckBox
        Left = 304
        Top = 56
        Width = 153
        Height = 17
        Caption = #1056#1072#1079#1073#1080#1074#1072#1090#1100' '#1087#1086' '#1087#1077#1088#1080#1086#1076#1072#1084
        TabOrder = 5
      end
    end
    object TabSheetKRU: TTabSheet
      Caption = #1057#1074#1086#1076' '#1074' Excel '#1079#1072' '#1075#1086#1076
      ImageIndex = 1
      object Label3: TLabel
        Left = 16
        Top = 8
        Width = 18
        Height = 13
        Caption = #1043#1086#1076
      end
      object btSelPKG: TButton
        Left = 8
        Top = 56
        Width = 417
        Height = 25
        Caption = 
          #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081', '#1082#1072#1090#1077#1075#1086#1088#1080#1081' '#1080' '#1089#1095#1077#1090#1086#1074' ('#1076#1077#1081#1089#1090#1074#1091#1077#1090' '#1090#1086#1083#1100#1082#1086' '#1076#1083#1103' 2-' +
          #1075#1086' '#1089#1074#1086#1076#1072')'
        TabOrder = 0
        OnClick = btSelPKGClick
      end
      object btSwodKRU: TButton
        Left = 8
        Top = 96
        Width = 137
        Height = 25
        Caption = #1057#1074#1086#1076' '#1079#1072' '#1075#1086#1076' '#1087#1086' '#1084#1077#1089#1103#1094#1072#1084
        TabOrder = 1
        OnClick = btSwodKRUClick
      end
      object dtYearZa: TDateTimePicker
        Left = 40
        Top = 8
        Width = 145
        Height = 21
        Date = 45058.926604583340000000
        Time = 45058.926604583340000000
        DateFormat = dfLong
        TabOrder = 2
      end
    end
    object TabSheet1: TTabSheet
      Caption = #1057#1087#1080#1089#1082#1080' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
      ImageIndex = 2
      object Label4: TLabel
        Left = -8
        Top = 8
        Width = 77
        Height = 13
        Caption = #1043#1086#1076' '#1080' '#1084#1077#1089#1103#1094' '#1079#1072
      end
      object Label5: TLabel
        Left = 368
        Top = 80
        Width = 112
        Height = 48
        Caption = 'Label5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -36
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dtListZa: TDateTimePicker
        Left = 80
        Top = 8
        Width = 153
        Height = 21
        Date = 45068.890344849540000000
        Time = 45068.890344849540000000
        DateFormat = dfLong
        TabOrder = 0
      end
      object btSelPKGL: TButton
        Left = 16
        Top = 64
        Width = 337
        Height = 25
        Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081', '#1082#1072#1090#1077#1075#1086#1088#1080#1081' '#1080' '#1089#1095#1077#1090#1086#1074
        TabOrder = 1
        OnClick = btSelPKGLClick
      end
      object btnMakeList: TBitBtn
        Left = 16
        Top = 104
        Width = 201
        Height = 25
        Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1087#1080#1089#1086#1082
        TabOrder = 2
        OnClick = btnMakeListClick
      end
    end
  end
  object dsSwod: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select a.lineno linenoadd, a.shifrsta shifrstaadd,a.namesta name' +
        'add, a.summa summaadd,'
      
        '       b.lineno linenoud, b.shifrsta shifrstaud,b.namesta anmeud' +
        ', b.summa summaud, a.period aperiod, b.period bperiod'
      ' from pr_add_for_swod(:dfra,:dtoa,:shifrgrua,:needperiod) a'
      
        'full outer join pr_ud_for_swod(:dfru,:dtou,:shifrgruu,:needperio' +
        'd) b on a.lineno=b.lineno')
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    Left = 320
    Top = 56
    object dsSwodLINENOADD: TFIBIntegerField
      FieldName = 'LINENOADD'
    end
    object dsSwodSHIFRSTAADD: TFIBIntegerField
      FieldName = 'SHIFRSTAADD'
    end
    object dsSwodNAMEADD: TFIBStringField
      FieldName = 'NAMEADD'
      Size = 52
      EmptyStrToNull = True
    end
    object dsSwodSUMMAADD: TFIBBCDField
      FieldName = 'SUMMAADD'
      Size = 2
      RoundByScale = True
    end
    object dsSwodLINENOUD: TFIBIntegerField
      FieldName = 'LINENOUD'
    end
    object dsSwodSHIFRSTAUD: TFIBIntegerField
      FieldName = 'SHIFRSTAUD'
    end
    object dsSwodANMEUD: TFIBStringField
      FieldName = 'ANMEUD'
      Size = 52
      EmptyStrToNull = True
    end
    object dsSwodSUMMAUD: TFIBBCDField
      FieldName = 'SUMMAUD'
      Size = 2
      RoundByScale = True
    end
    object dsSwodAPERIOD: TFIBIntegerField
      FieldName = 'APERIOD'
    end
    object dsSwodBPERIOD: TFIBIntegerField
      FieldName = 'BPERIOD'
    end
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 360
    Top = 56
  end
  object dsoSwod: TDataSource
    DataSet = dsSwod
    Left = 392
    Top = 56
  end
  object frxReport1: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42754.982500706020000000
    ReportOptions.LastChange = 43977.771768437500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    Left = 16
    Top = 160
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
        Name = 'period'
        Value = ''
      end
      item
        Name = 'nameGru'
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
        Height = 56.692950000000000000
        Top = 18.897650000000000000
        Width = 793.701300000000000000
        object Memo1: TfrxMemoView
          Left = 15.118120000000000000
          Width = 699.213050000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#187#1056#1029#1057#8249#1056#8470' '#1057#1027#1056#1030#1056#1109#1056#1169' '#1056#183#1056#176' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169' [period] [nameGru]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 3.779530000000000000
          Top = 37.795300000000000000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1025#1056#1105#1057#8222#1057#1026)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 41.574830000000000000
          Top = 37.795300000000000000
          Width = 245.669425590000000000
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
            #1056#1116#1056#176#1056#183#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 306.141930000000000000
          Top = 37.795300000000000000
          Width = 94.488225590000000000
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
        object Memo11: TfrxMemoView
          Left = 665.197280000000000000
          Top = 37.795300000000000000
          Width = 94.488225590000000000
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
        object Memo12: TfrxMemoView
          Left = 400.630180000000000000
          Top = 37.795300000000000000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1025#1056#1105#1057#8222#1057#1026)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 438.425480000000000000
          Top = 37.795300000000000000
          Width = 207.874015748031500000
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
            #1056#1116#1056#176#1056#183#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 3.779530000000000000
          Top = 18.897650000000000000
          Width = 396.850625590000000000
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
            #1056#1116#1056#176#1057#8225#1056#1105#1057#1027#1056#187#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 400.630180000000000000
          Top = 18.897650000000000000
          Width = 359.055325590000000000
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
            #1056#1032#1056#1169#1056#181#1057#1026#1056#182#1056#176#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 287.244280000000000000
          Top = 37.795300000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1114#1057#8224)
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 646.299630000000000000
          Top = 37.795300000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1114#1057#8224)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897637800000000000
        Top = 136.063080000000000000
        Width = 793.701300000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Width = 37.795275590000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
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
            '[frxDBDataset1."SHIFRSTAADD"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 41.574830000000000000
          Width = 245.669279130000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."NAMEADD"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 306.141732280000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
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
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset1."SUMMAADD"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 400.630180000000000000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
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
            '[frxDBDataset1."SHIFRSTAUD"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 438.425480000000000000
          Width = 207.874015748031500000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."ANMEUD"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 665.197280000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
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
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset1."SUMMAUD"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 287.244094490000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
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
            '[frxDBDataset1."APERIOD"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 646.299630000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
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
            '[frxDBDataset1."BPERIOD"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 22.677180000000000000
        Top = 215.433210000000000000
        Width = 793.701300000000000000
        object Memo16: TfrxMemoView
          Left = 306.141930000000000000
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
            '[SUM(<frxDBDataset1."SUMMAADD">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 3.779530000000000000
          Width = 302.362216930000000000
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
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1029#1056#176#1057#8225#1056#1105#1057#1027#1056#187#1056#181#1056#1029#1056#1109)
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 400.630180000000000000
          Width = 264.567100000000000000
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
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1057#1107#1056#1169#1056#181#1057#1026#1056#182#1056#176#1056#1029#1056#1109)
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 665.197280000000000000
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
            '[SUM(<frxDBDataset1."SUMMAUD">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = dsSwod
    Left = 64
    Top = 160
  end
  object dsKRU: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRSTA,'
      ' NAMESTA,'
      ' SUMMA01,'
      ' SUMMA02,'
      ' SUMMA03,'
      ' SUMMA04,'
      ' SUMMA05,'
      ' SUMMA06,'
      ' SUMMA07,'
      ' SUMMA08,'
      ' SUMMA09,'
      ' SUMMA10,'
      ' SUMMA11,'
      ' SUMMA12,'
      ' SUMMATOT,'
      ' ISADD '
      'FROM'
      ' PR_SWOD_YEAR_KRU(:Y) '
      'order by isadd desc,shifrsta')
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    Left = 128
    Top = 168
    object dsKRUSHIFRSTA: TFIBIntegerField
      FieldName = 'SHIFRSTA'
    end
    object dsKRUNAMESTA: TFIBStringField
      FieldName = 'NAMESTA'
      Size = 128
      EmptyStrToNull = True
    end
    object dsKRUSUMMA01: TFIBBCDField
      FieldName = 'SUMMA01'
      Size = 2
      RoundByScale = True
    end
    object dsKRUSUMMA02: TFIBBCDField
      FieldName = 'SUMMA02'
      Size = 2
      RoundByScale = True
    end
    object dsKRUSUMMA03: TFIBBCDField
      FieldName = 'SUMMA03'
      Size = 2
      RoundByScale = True
    end
    object dsKRUSUMMA04: TFIBBCDField
      FieldName = 'SUMMA04'
      Size = 2
      RoundByScale = True
    end
    object dsKRUSUMMA05: TFIBBCDField
      FieldName = 'SUMMA05'
      Size = 2
      RoundByScale = True
    end
    object dsKRUSUMMA06: TFIBBCDField
      FieldName = 'SUMMA06'
      Size = 2
      RoundByScale = True
    end
    object dsKRUSUMMA07: TFIBBCDField
      FieldName = 'SUMMA07'
      Size = 2
      RoundByScale = True
    end
    object dsKRUSUMMA08: TFIBBCDField
      FieldName = 'SUMMA08'
      Size = 2
      RoundByScale = True
    end
    object dsKRUSUMMA09: TFIBBCDField
      FieldName = 'SUMMA09'
      Size = 2
      RoundByScale = True
    end
    object dsKRUSUMMA10: TFIBBCDField
      FieldName = 'SUMMA10'
      Size = 2
      RoundByScale = True
    end
    object dsKRUSUMMA11: TFIBBCDField
      FieldName = 'SUMMA11'
      Size = 2
      RoundByScale = True
    end
    object dsKRUSUMMA12: TFIBBCDField
      FieldName = 'SUMMA12'
      Size = 2
      RoundByScale = True
    end
    object dsKRUSUMMATOT: TFIBBCDField
      FieldName = 'SUMMATOT'
      Size = 2
      RoundByScale = True
    end
    object dsKRUISADD: TFIBIntegerField
      FieldName = 'ISADD'
    end
  end
  object dsPersonList: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' TABNO,'
      ' SHIFRGRU,'
      ' NAMEGRU,'
      ' FIO,'
      ' SHIFRPOD,'
      ' NAMEPOD,'
      ' DOLG,'
      ' OKLAD,'
      ' SUMMAADD,'
      ' KOEF,'
      ' GUID'
      'FROM'
      ' PR_LIST_2022_23(:Y,'
      ' :M) ')
    Transaction = trReadList
    Database = FIB.pFIBDatabaseSal
    Left = 452
    Top = 56
    object dsPersonListTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object dsPersonListSHIFRGRU: TFIBIntegerField
      FieldName = 'SHIFRGRU'
    end
    object dsPersonListNAMEGRU: TFIBStringField
      FieldName = 'NAMEGRU'
      Size = 25
      EmptyStrToNull = True
    end
    object dsPersonListFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 50
      EmptyStrToNull = True
    end
    object dsPersonListSHIFRPOD: TFIBIntegerField
      FieldName = 'SHIFRPOD'
    end
    object dsPersonListNAMEPOD: TFIBStringField
      FieldName = 'NAMEPOD'
      Size = 128
      EmptyStrToNull = True
    end
    object dsPersonListDOLG: TFIBStringField
      FieldName = 'DOLG'
      Size = 50
      EmptyStrToNull = True
    end
    object dsPersonListOKLAD: TFIBBCDField
      FieldName = 'OKLAD'
      Size = 2
      RoundByScale = True
    end
    object dsPersonListSUMMAADD: TFIBBCDField
      FieldName = 'SUMMAADD'
      Size = 2
      RoundByScale = True
    end
    object dsPersonListKOEF: TFIBBCDField
      FieldName = 'KOEF'
      Size = 4
      RoundByScale = True
    end
    object dsPersonListGUID: TFIBStringField
      FieldName = 'GUID'
      Size = 32
      EmptyStrToNull = True
    end
  end
  object trReadList: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 500
    Top = 56
  end
end
