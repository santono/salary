object FormPlanSwod: TFormPlanSwod
  Left = 271
  Top = 214
  Width = 463
  Height = 162
  Caption = #1057#1074#1086#1076#1099' '#1076#1083#1103' '#1087#1083#1072#1085#1086#1074#1086#1075#1086' '#1086#1090#1076#1077#1083#1072
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
  object DateTimePicker1: TDateTimePicker
    Left = 16
    Top = 8
    Width = 177
    Height = 28
    Date = 40367.468057175920000000
    Time = 40367.468057175920000000
    DateFormat = dfLong
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object RadioGroup1: TRadioGroup
    Left = 16
    Top = 48
    Width = 177
    Height = 57
    Caption = #1056#1077#1078#1080#1084
    Items.Strings = (
      #1059#1085#1080#1074#1077#1088#1089#1080#1090#1077#1090
      #1050#1086#1083#1077#1076#1078)
    TabOrder = 1
  end
  object Bi: TBitBtn
    Left = 200
    Top = 8
    Width = 153
    Height = 25
    Caption = #1044#1080#1072#1087#1072#1079#1086#1085#1099
    TabOrder = 2
    OnClick = BiClick
  end
  object BitBtn1: TBitBtn
    Left = 200
    Top = 48
    Width = 153
    Height = 25
    Caption = #1060#1086#1085#1076' '#1086#1087#1083#1072#1090#1099' '#1079#1072' '#1082#1074#1072#1088#1090#1072#1083
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object pFIBDataSetGrid: TpFIBDataSet
    SelectSQL.Strings = (
      'select summafr,summato,nmbofprsn,nmbofwmn'
      'from pr_plan_grid_mk(:y,:m,:mode)'
      'order by 1')
    AllowedUpdateKinds = []
    Transaction = pFIBTransaction1
    Database = FIB.pFIBDatabaseSal
    Left = 360
    Top = 8
    object pFIBDataSetGridSUMMAFR: TFIBBCDField
      FieldName = 'SUMMAFR'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetGridSUMMATO: TFIBBCDField
      FieldName = 'SUMMATO'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetGridNMBOFPRSN: TFIBIntegerField
      FieldName = 'NMBOFPRSN'
    end
    object pFIBDataSetGridNMBOFWMN: TFIBIntegerField
      FieldName = 'NMBOFWMN'
    end
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 392
    Top = 8
  end
  object frxDBDatasetGrid: TfrxDBDataset
    UserName = 'frxDBDatasetGrid'
    CloseDataSource = False
    DataSet = pFIBDataSetGrid
    Left = 360
    Top = 48
  end
  object frxReportGrid: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40367.486658703700000000
    ReportOptions.LastChange = 40367.492930949100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReportGridGetValue
    Left = 392
    Top = 48
    Datasets = <
      item
        DataSet = frxDBDatasetGrid
        DataSetName = 'frxDBDatasetGrid'
      end>
    Variables = <
      item
        Name = ' h'
        Value = Null
      end
      item
        Name = 'd'
        Value = Null
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object Header1: TfrxHeader
        Height = 49.133890000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            #1056#1038#1056#1030#1056#1109#1056#1169' '#1056#1111#1056#1109' '#1056#1169#1056#1105#1056#176#1056#1111#1056#176#1056#183#1056#1109#1056#1029#1056#176#1056#1112' [d]')
        end
        object Memo7: TfrxMemoView
          Top = 30.236240000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211)
        end
        object Memo8: TfrxMemoView
          Left = 37.795300000000000000
          Top = 30.236240000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038)
        end
        object Memo9: TfrxMemoView
          Left = 113.385900000000000000
          Top = 30.236240000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109)
        end
        object Memo10: TfrxMemoView
          Left = 207.874150000000000000
          Top = 30.236240000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1057#1027#1056#181#1056#1110#1056#1109)
        end
        object Memo11: TfrxMemoView
          Left = 287.244280000000000000
          Top = 30.236240000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217' '#1057#8218'.'#1057#8225'. '#1056#182#1056#1029#1057#8240#1056#1029)
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 90.708720000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDatasetGrid
        DataSetName = 'frxDBDatasetGrid'
        RowCount = 0
        object Memo2: TfrxMemoView
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[Line]')
        end
        object Memo3: TfrxMemoView
          Left = 37.795300000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          DataField = 'SUMMAFR'
          DataSet = frxDBDatasetGrid
          DataSetName = 'frxDBDatasetGrid'
          DisplayFormat.FormatStr = '%10.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDatasetGrid."SUMMAFR"]')
        end
        object Memo4: TfrxMemoView
          Left = 113.385900000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataField = 'SUMMATO'
          DataSet = frxDBDatasetGrid
          DataSetName = 'frxDBDatasetGrid'
          DisplayFormat.FormatStr = '%12.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDatasetGrid."SUMMATO"]')
        end
        object Memo5: TfrxMemoView
          Left = 207.874150000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'NMBOFPRSN'
          DataSet = frxDBDatasetGrid
          DataSetName = 'frxDBDatasetGrid'
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDatasetGrid."NMBOFPRSN"]')
        end
        object Memo6: TfrxMemoView
          Left = 287.244280000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'NMBOFWMN'
          DataSet = frxDBDatasetGrid
          DataSetName = 'frxDBDatasetGrid'
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDatasetGrid."NMBOFWMN"]')
        end
      end
    end
  end
  object pFIBQueryFondy: TpFIBQuery
    Transaction = pFIBTransaction1
    Database = FIB.pFIBDatabaseSal
    Left = 360
    Top = 80
  end
  object frxReportFondy: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40367.945205254630000000
    ReportOptions.LastChange = 40368.971936666670000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnManualBuild = frxReportFondyManualBuild
    Left = 392
    Top = 80
    Datasets = <>
    Variables = <
      item
        Name = ' h'
        Value = Null
      end
      item
        Name = 'd'
        Value = ''
      end
      item
        Name = 'nmbosntotmon'
        Value = ''
      end
      item
        Name = 'summaosntotmon'
        Value = ''
      end
      item
        Name = 'nmbosnwmnmon'
        Value = ''
      end
      item
        Name = 'summaosnwmnmon'
        Value = ''
      end
      item
        Name = 'nmbswmtotmon'
        Value = ''
      end
      item
        Name = 'summaswmtotmon'
        Value = ''
      end
      item
        Name = 'nmbswmwmnmon'
        Value = ''
      end
      item
        Name = 'summaswmwmnmon'
        Value = ''
      end
      item
        Name = 'nmbosntotkwa'
        Value = ''
      end
      item
        Name = 'summaosntotkwa'
        Value = ''
      end
      item
        Name = 'nmbosnwmnkwa'
        Value = ''
      end
      item
        Name = 'summaosnwmnkwa'
        Value = ''
      end
      item
        Name = 'nmbswmtotkwa'
        Value = ''
      end
      item
        Name = 'summaswmtotkwa'
        Value = ''
      end
      item
        Name = 'nmbswmwmnkwa'
        Value = ''
      end
      item
        Name = 'summaswmwmnkwa'
        Value = ''
      end
      item
        Name = 'nmbosntotyea'
        Value = ''
      end
      item
        Name = 'summaosntotyea'
        Value = ''
      end
      item
        Name = 'nmbosnwmnyea'
        Value = ''
      end
      item
        Name = 'summaosnwmnyea'
        Value = ''
      end
      item
        Name = 'nmbswmtotyea'
        Value = ''
      end
      item
        Name = 'summaswmtotyea'
        Value = ''
      end
      item
        Name = 'nmbswmwmnyea'
        Value = ''
      end
      item
        Name = 'summaswmwmnyea'
        Value = ''
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 434.645950000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        RowCount = 0
        object Memo1: TfrxMemoView
          Left = 113.385900000000000000
          Top = 3.779530000000001000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8 = (
            #1056#164#1056#1109#1056#1029#1056#1169' '#1056#1109#1056#1111#1056#187#1056#176#1057#8218#1057#8249' '#1057#8218#1057#1026#1057#1107#1056#1169#1056#176' [d]')
        end
        object Memo2: TfrxMemoView
          Left = 151.181200000000000000
          Top = 132.283550000000000000
          Width = 75.590551181102360000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[nmbosntotmon]')
        end
        object Memo3: TfrxMemoView
          Left = 226.771800000000000000
          Top = 132.283550000000000000
          Width = 113.385826771653500000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[summaosntotmon]')
        end
        object Memo4: TfrxMemoView
          Left = 377.953000000000000000
          Top = 132.283550000000000000
          Width = 75.590551181102360000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[nmbosnwmnmon]')
        end
        object Memo5: TfrxMemoView
          Left = 453.543600000000000000
          Top = 132.283550000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[summaosnwmnmon]')
        end
        object Memo6: TfrxMemoView
          Left = 151.181200000000000000
          Top = 170.078850000000000000
          Width = 75.590551181102360000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[nmbswmtotmon]')
        end
        object Memo7: TfrxMemoView
          Left = 226.771800000000000000
          Top = 170.078850000000000000
          Width = 113.385826771653500000
          Height = 18.897650000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[summaswmtotmon]')
        end
        object Memo8: TfrxMemoView
          Left = 377.953000000000000000
          Top = 170.078850000000000000
          Width = 75.590551181102360000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[nmbswmwmnmon]')
        end
        object Memo9: TfrxMemoView
          Left = 453.543600000000000000
          Top = 170.078850000000000000
          Width = 113.385826771653500000
          Height = 18.897650000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[summaswmwmnmon]')
        end
        object Memo10: TfrxMemoView
          Left = 151.181200000000000000
          Top = 245.669450000000000000
          Width = 75.590551181102360000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[nmbosntotkwa]')
        end
        object Memo11: TfrxMemoView
          Left = 226.771800000000000000
          Top = 245.669450000000000000
          Width = 113.385826771653500000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[summaosntotkwa]')
        end
        object Memo12: TfrxMemoView
          Left = 377.953000000000000000
          Top = 245.669450000000000000
          Width = 75.590551181102360000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[nmbosnwmnkwa]')
        end
        object Memo13: TfrxMemoView
          Left = 453.543600000000000000
          Top = 245.669450000000000000
          Width = 113.385826771653500000
          Height = 18.897650000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[summaosnwmnkwa]')
        end
        object Memo14: TfrxMemoView
          Left = 151.181200000000000000
          Top = 283.464750000000000000
          Width = 75.590551181102360000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[nmbswmtotkwa]')
        end
        object Memo15: TfrxMemoView
          Left = 226.771800000000000000
          Top = 283.464750000000000000
          Width = 113.385826771653500000
          Height = 18.897650000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[summaswmtotkwa]')
        end
        object Memo16: TfrxMemoView
          Left = 377.953000000000000000
          Top = 283.464750000000000000
          Width = 75.590551181102360000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[nmbswmwmnkwa]')
        end
        object Memo17: TfrxMemoView
          Left = 453.543600000000000000
          Top = 283.464750000000000000
          Width = 113.385826771653500000
          Height = 18.897650000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[summaswmwmnkwa]')
        end
        object Memo18: TfrxMemoView
          Left = 151.181200000000000000
          Top = 359.055350000000000000
          Width = 75.590551181102360000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[nmbosntotyea]')
        end
        object Memo19: TfrxMemoView
          Left = 226.771800000000000000
          Top = 359.055350000000000000
          Width = 113.385826771653500000
          Height = 18.897650000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[summaosntotyea]')
        end
        object Memo20: TfrxMemoView
          Left = 377.953000000000000000
          Top = 359.055350000000000000
          Width = 75.590551181102360000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            '[nmbosnwmnyea]')
        end
        object Memo21: TfrxMemoView
          Left = 453.543600000000000000
          Top = 359.055350000000000000
          Width = 113.385826771653500000
          Height = 18.897650000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[summaosnwmnyea]')
        end
        object Memo22: TfrxMemoView
          Left = 151.181200000000000000
          Top = 396.850650000000000000
          Width = 75.590551181102360000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[nmbswmtotyea]')
        end
        object Memo23: TfrxMemoView
          Left = 226.771800000000000000
          Top = 396.850650000000000000
          Width = 113.385826771653500000
          Height = 18.897650000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[summaswmtotyea]')
        end
        object Memo24: TfrxMemoView
          Left = 377.953000000000000000
          Top = 396.850650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[nmbswmwmnyea]')
        end
        object Memo25: TfrxMemoView
          Left = 453.543600000000000000
          Top = 396.850650000000000000
          Width = 113.385826771653500000
          Height = 18.897650000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[summaswmwmnyea]')
        end
        object Memo26: TfrxMemoView
          Left = 151.181200000000000000
          Top = 71.811070000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113'-'#1056#1030#1056#1109)
        end
        object Memo27: TfrxMemoView
          Left = 377.953000000000000000
          Top = 75.590600000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113'-'#1056#1030#1056#1109)
        end
        object Memo28: TfrxMemoView
          Left = 226.771800000000000000
          Top = 71.811070000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
        end
        object Memo29: TfrxMemoView
          Left = 453.543600000000000000
          Top = 75.590600000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
        end
        object Memo30: TfrxMemoView
          Left = 309.921460000000000000
          Top = 102.047310000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8212#1056#176' '#1056#1112#1056#181#1057#1027#1057#1039#1057#8224)
        end
        object Memo31: TfrxMemoView
          Left = 309.921460000000000000
          Top = 207.874150000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8212#1056#176' '#1056#1108#1056#1030#1056#176#1057#1026#1057#8218#1056#176#1056#187)
        end
        object Memo32: TfrxMemoView
          Left = 313.700990000000000000
          Top = 321.260050000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038' '#1056#1029#1056#176#1057#8225#1056#176#1056#187#1056#176' '#1056#1110#1056#1109#1056#1169#1056#176)
        end
        object Memo33: TfrxMemoView
          Left = 3.779530000000000000
          Top = 132.283550000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            #1056#1115#1057#1027#1056#1029#1056#1109#1056#1030#1056#1029#1057#8249#1056#181' '#1057#1026#1056#176#1056#177#1056#1109#1057#8218#1056#1029#1056#1105#1056#1108#1056#1105)
        end
        object Memo34: TfrxMemoView
          Top = 245.669450000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            #1056#1115#1057#1027#1056#1029#1056#1109#1056#1030#1056#1029#1057#8249#1056#181' '#1057#1026#1056#176#1056#177#1056#1109#1057#8218#1056#1029#1056#1105#1056#1108#1056#1105)
        end
        object Memo35: TfrxMemoView
          Top = 359.055350000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            #1056#1115#1057#1027#1056#1029#1056#1109#1056#1030#1056#1029#1057#8249#1056#181' '#1057#1026#1056#176#1056#177#1056#1109#1057#8218#1056#1029#1056#1105#1056#1108#1056#1105)
        end
        object Memo36: TfrxMemoView
          Top = 170.078850000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            #1056#1119#1056#1109' '#1057#1027#1056#1109#1056#1030#1056#1112#1056#181#1057#1027#1057#8218#1056#1105#1057#8218#1056#181#1056#187#1057#1034#1057#1027#1057#8218#1056#1030#1057#1107)
        end
        object Memo37: TfrxMemoView
          Top = 283.464750000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            #1056#1119#1056#1109' '#1057#1027#1056#1109#1056#1030#1056#1112#1056#181#1057#1027#1057#8218#1056#1105#1057#8218#1056#181#1056#187#1057#1034#1057#1027#1057#8218#1056#1030#1057#1107)
        end
        object Memo38: TfrxMemoView
          Top = 396.850650000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            #1056#1119#1056#1109' '#1057#1027#1056#1109#1056#1030#1056#1112#1056#181#1057#1027#1057#8218#1056#1105#1057#8218#1056#181#1056#187#1057#1034#1057#1027#1057#8218#1056#1030#1057#1107)
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
    Left = 208
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
    Left = 248
    Top = 80
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    Left = 288
    Top = 80
  end
end
