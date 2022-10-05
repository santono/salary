object FormRepRLForBoln: TFormRepRLForBoln
  Left = 219
  Top = 142
  Width = 696
  Height = 312
  Caption = #1056#1072#1089#1096#1080#1092#1088#1086#1074#1082#1072' '#1089#1091#1084#1084' '#1073#1086#1083#1100#1085#1080#1095#1085#1086#1075#1086
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object rgWr: TRadioGroup
    Left = 40
    Top = 16
    Width = 385
    Height = 41
    Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099
    Columns = 3
    Items.Strings = (
      #1054#1089#1085#1086#1074#1085#1072#1103
      #1057#1086#1074#1084#1077#1097#1077#1085#1080#1077
      #1054#1089#1085' '#1080' '#1089#1086#1074#1084)
    TabOrder = 0
  end
  object rgMark: TRadioGroup
    Left = 40
    Top = 72
    Width = 385
    Height = 41
    Caption = #1056#1077#1078#1080#1084' '#1086#1090#1084#1077#1090#1082#1080
    Columns = 3
    Items.Strings = (
      #1054#1090#1084#1077#1095#1077#1085#1085#1099#1077
      #1053#1077' '#1086#1090#1084#1077#1095#1077#1085#1085#1099#1077
      #1042#1089#1077)
    TabOrder = 1
  end
  object BitOk: TBitBtn
    Left = 40
    Top = 224
    Width = 75
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100
    TabOrder = 2
    OnClick = BitOkClick
    Kind = bkOK
  end
  object rgPart: TRadioGroup
    Left = 40
    Top = 120
    Width = 385
    Height = 41
    Caption = #1063#1072#1089#1090#1100' '#1076#1072#1085#1085#1099#1093
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      '1-'#1103' '#1095#1072#1089#1090#1100
      '2-'#1103' '#1095#1072#1089#1090#1100)
    TabOrder = 3
  end
  object frxReport1: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44811.682354502300000000
    ReportOptions.LastChange = 44816.887190138890000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    Left = 72
    Top = 168
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end
      item
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
      end
      item
        DataSet = frxDBDataset3
        DataSetName = 'frxDBDataset3'
      end
      item
        DataSet = frxDBDataset4
        DataSetName = 'frxDBDataset4'
      end
      item
        DataSet = frxDBDataset5
        DataSetName = 'frxDBDataset5'
      end
      item
        DataSet = frxDBDataset6
        DataSetName = 'frxDBDataset6'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'Month1'
        Value = Null
      end
      item
        Name = 'Month2'
        Value = Null
      end
      item
        Name = 'Month3'
        Value = Null
      end
      item
        Name = 'Month4'
        Value = Null
      end
      item
        Name = 'Month5'
        Value = Null
      end
      item
        Name = 'Month6'
        Value = Null
      end
      item
        Name = 'Header'
        Value = Null
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
      TopMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 1122.520410000000000000
        object Memo9: TfrxMemoView
          Left = 105.826840000000000000
          Width = 721.890230000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[Header]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 226.771800000000000000
        Top = 102.047310000000000000
        Width = 1122.520410000000000000
        Child = frxReport1.Child1
        RowCount = 1
        Stretched = True
        object Memo1: TfrxMemoView
          Left = 37.795300000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Month1]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 340.157700000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Month2]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 642.520100000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Month3]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Subreport1: TfrxSubreport
          Left = 37.795300000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = frxReport1.Page2
          PrintOnParent = True
        end
        object Subreport2: TfrxSubreport
          Left = 340.157700000000000000
          Top = 18.897650000000000000
          Width = 94.488188980000000000
          Height = 18.897637800000000000
          Page = frxReport1.Page3
        end
        object Subreport3: TfrxSubreport
          Left = 642.520100000000000000
          Top = 18.897637800000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = frxReport1.Page4
        end
      end
      object Child1: TfrxChild
        Height = 230.551330000000000000
        Top = 351.496290000000000000
        Width = 1122.520410000000000000
        object Memo4: TfrxMemoView
          Left = 37.795300000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Month4]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 340.157700000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Month5]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 642.520100000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Month6]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Subreport4: TfrxSubreport
          Left = 37.795300000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = frxReport1.Page5
        end
        object Subreport5: TfrxSubreport
          Left = 340.157700000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = frxReport1.Page6
        end
        object Subreport6: TfrxSubreport
          Left = 642.520100000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = frxReport1.Page7
        end
        object Subreport7: TfrxSubreport
          Left = 944.882500000000000000
          Top = 18.897637795275590000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = frxReport1.Page8
        end
      end
    end
    object Page2: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData2: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo7: TfrxMemoView
          Left = 18.897637800000000000
          Width = 18.897637795275600000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset1."shifrSta"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 37.795300000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."nameSta"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 151.181200000000000000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."summa"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 188.976500000000000000
          Width = 37.795287800000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."ZaS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 226.771800000000000000
          Width = 37.795287800000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."VyS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 264.567100000000000000
          Width = 30.236220472440940000
          Height = 18.897637795275590000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset1."nameWR"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 294.803149610000000000
          Width = 18.897637800000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset1."shifrPod"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset1."MrkS"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object Page3: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData3: TfrxMasterData
        Height = 18.897637800000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
        RowCount = 0
        object Memo11: TfrxMemoView
          Left = 18.897637800000000000
          Width = 18.897637800000000000
          Height = 18.897650000000000000
          DataField = 'shifrSta'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset2."shifrSta"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 37.795300000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset2."nameSta"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 151.181200000000000000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset2."summa"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 188.976500000000000000
          Width = 37.795287800000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset2."ZaS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 226.771800000000000000
          Width = 37.795287800000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset2."VyS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 264.567100000000000000
          Width = 30.236220470000000000
          Height = 18.897637800000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset2."nameWR"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 294.803149610000000000
          Width = 18.897637800000000000
          Height = 18.897650000000000000
          DataField = 'shifrPod'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset2."shifrPod"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          DataField = 'MrkS'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset2."MrkS"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object Page4: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData4: TfrxMasterData
        Height = 18.897637800000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset3
        DataSetName = 'frxDBDataset3'
        RowCount = 0
        object Memo25: TfrxMemoView
          Left = 18.897637800000000000
          Width = 18.897637800000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset3."shifrSta"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 37.795300000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset3."nameSta"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 151.181200000000000000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset3."summa"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 188.976500000000000000
          Width = 37.795287800000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset3."ZaS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 226.771800000000000000
          Width = 37.795287800000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset3."VyS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 264.567100000000000000
          Width = 30.236220470000000000
          Height = 18.897637800000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset3."nameWR"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 294.803149610000000000
          Width = 18.897637800000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset3."shifrPod"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset3."MrkS"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object Page5: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData5: TfrxMasterData
        Height = 18.897637795275590000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset4
        DataSetName = 'frxDBDataset4'
        RowCount = 0
        object Memo33: TfrxMemoView
          Left = 18.897637800000000000
          Width = 18.897637800000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset4."shifrSta"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 37.795300000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset4."nameSta"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 151.181200000000000000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset4."summa"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 188.976500000000000000
          Width = 37.795287800000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset4."ZaS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 226.771800000000000000
          Width = 37.795287800000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset4."VyS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 264.567100000000000000
          Width = 30.236220470000000000
          Height = 18.897637800000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset4."nameWR"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 294.803149610000000000
          Width = 18.897637800000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset4."shifrPod"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset4."MrkS"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object Page6: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData6: TfrxMasterData
        Height = 18.897637795275590000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset5
        DataSetName = 'frxDBDataset5'
        RowCount = 0
        object Memo41: TfrxMemoView
          Left = 18.897637800000000000
          Width = 18.897637800000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset5."shifrSta"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 37.795300000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset5."nameSta"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 151.181200000000000000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset5."summa"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 188.976500000000000000
          Width = 37.795287800000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset5."ZaS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 226.771800000000000000
          Width = 37.795287800000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset5."VyS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 264.567100000000000000
          Width = 30.236220470000000000
          Height = 18.897637800000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset5."nameWR"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 294.803149610000000000
          Width = 18.897637800000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset5."shifrPod"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset5."MrkS"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object Page7: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData7: TfrxMasterData
        Height = 18.897637795275590000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset6
        DataSetName = 'frxDBDataset6'
        RowCount = 0
        object Memo49: TfrxMemoView
          Left = 18.897637800000000000
          Width = 18.897637800000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset6."shifrSta"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 37.795300000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset6."nameSta"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 151.181200000000000000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset6."summa"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          Left = 188.976500000000000000
          Width = 37.795287800000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset6."ZaS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 226.771800000000000000
          Width = 37.795287800000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset6."VyS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 264.567100000000000000
          Width = 30.236220470000000000
          Height = 18.897637800000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDataset6."nameWR"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 294.803149610000000000
          Width = 18.897637800000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset6."shifrPod"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDataset6."MrkS"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object Page8: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = cds1
    Left = 112
    Top = 168
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    DataSet = cds2
    Left = 152
    Top = 168
  end
  object frxDBDataset3: TfrxDBDataset
    UserName = 'frxDBDataset3'
    CloseDataSource = False
    DataSet = cds3
    Left = 192
    Top = 168
  end
  object frxDBDataset4: TfrxDBDataset
    UserName = 'frxDBDataset4'
    CloseDataSource = False
    DataSet = cds4
    Left = 232
    Top = 168
  end
  object frxDBDataset5: TfrxDBDataset
    UserName = 'frxDBDataset5'
    CloseDataSource = False
    DataSet = cds5
    Left = 272
    Top = 168
  end
  object frxDBDataset6: TfrxDBDataset
    UserName = 'frxDBDataset6'
    CloseDataSource = False
    DataSet = cds6
    Left = 312
    Top = 168
  end
  object cds1: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'shifrSta'
        DataType = ftInteger
      end
      item
        Name = 'nameSta'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'shifrKat'
        DataType = ftInteger
      end
      item
        Name = 'nameKat'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'shifrGru'
        DataType = ftInteger
      end
      item
        Name = 'nameGru'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'yearZa'
        DataType = ftInteger
      end
      item
        Name = 'monthZa'
        DataType = ftInteger
      end
      item
        Name = 'yearVy'
        DataType = ftInteger
      end
      item
        Name = 'monthVy'
        DataType = ftInteger
      end
      item
        Name = 'Mark'
        DataType = ftInteger
      end
      item
        Name = 'shifrWr'
        DataType = ftInteger
      end
      item
        Name = 'nameWR'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'shifrPod'
        DataType = ftInteger
      end
      item
        Name = 'namePod'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'summa'
        DataType = ftFloat
      end
      item
        Name = 'MrkS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ZaS'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'VyS'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 112
    Top = 208
    Data = {
      9B0100009619E0BD0100000018000000130000000000030000009B0108736869
      66725374610400010000000000076E616D655374610100490000000100055749
      4454480200020028000873686966724B61740400010000000000076E616D654B
      6174010049000000010005574944544802000200140008736869667247727504
      00010000000000076E616D654772750100490000000100055749445448020002
      00140006796561725A610400010000000000076D6F6E74685A61040001000000
      0000067965617256790400010000000000076D6F6E7468567904000100000000
      00044D61726B040001000000000007736869667257720400010000000000066E
      616D6557520100490000000100055749445448020002000A0008736869667250
      6F640400010000000000076E616D65506F640100490000000100055749445448
      020002001E000573756D6D610800040000000000044D726B5301004900000001
      00055749445448020002000100035A6153010049000000010005574944544802
      00020007000356795301004900000001000557494454480200020014000000}
    object cds1shifrSta: TIntegerField
      FieldName = 'shifrSta'
    end
    object cds1nameSta: TStringField
      FieldName = 'nameSta'
      Size = 40
    end
    object cds1shifrKat: TIntegerField
      FieldName = 'shifrKat'
    end
    object cds1nameKat: TStringField
      FieldName = 'nameKat'
    end
    object cds1shifrGru: TIntegerField
      FieldName = 'shifrGru'
    end
    object cds1nameGru: TStringField
      FieldName = 'nameGru'
    end
    object cds1yearZa: TIntegerField
      FieldName = 'yearZa'
    end
    object cds1monthZa: TIntegerField
      FieldName = 'monthZa'
    end
    object cds1yearVy: TIntegerField
      FieldName = 'yearVy'
    end
    object cds1monthVy: TIntegerField
      FieldName = 'monthVy'
    end
    object cds1Mark: TIntegerField
      FieldName = 'Mark'
    end
    object cds1shifrWr: TIntegerField
      FieldName = 'shifrWr'
    end
    object cds1nameWR: TStringField
      FieldName = 'nameWR'
      Size = 10
    end
    object cds1shifrPod: TIntegerField
      FieldName = 'shifrPod'
    end
    object cds1namePod: TStringField
      FieldName = 'namePod'
      Size = 30
    end
    object cds1summa: TFloatField
      FieldName = 'summa'
    end
    object cds1MrkS: TStringField
      FieldName = 'MrkS'
      Size = 1
    end
    object cds1ZaS: TStringField
      FieldName = 'ZaS'
      Size = 7
    end
    object cds1VyS: TStringField
      FieldName = 'VyS'
    end
  end
  object cds2: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'shifrSta'
        DataType = ftInteger
      end
      item
        Name = 'nameSta'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'shifrKat'
        DataType = ftInteger
      end
      item
        Name = 'nameKat'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'shifrGru'
        DataType = ftInteger
      end
      item
        Name = 'nameGru'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'yearZa'
        DataType = ftInteger
      end
      item
        Name = 'monthZa'
        DataType = ftInteger
      end
      item
        Name = 'yearVy'
        DataType = ftInteger
      end
      item
        Name = 'monthVy'
        DataType = ftInteger
      end
      item
        Name = 'Mark'
        DataType = ftInteger
      end
      item
        Name = 'shifrWr'
        DataType = ftInteger
      end
      item
        Name = 'nameWR'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'shifrPod'
        DataType = ftInteger
      end
      item
        Name = 'namePod'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'summa'
        DataType = ftFloat
      end
      item
        Name = 'MrkS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ZaS'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'VyS'
        DataType = ftString
        Size = 7
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 152
    Top = 208
    Data = {
      9B0100009619E0BD0100000018000000130000000000030000009B0108736869
      66725374610400010000000000076E616D655374610100490000000100055749
      4454480200020028000873686966724B61740400010000000000076E616D654B
      6174010049000000010005574944544802000200140008736869667247727504
      00010000000000076E616D654772750100490000000100055749445448020002
      00140006796561725A610400010000000000076D6F6E74685A61040001000000
      0000067965617256790400010000000000076D6F6E7468567904000100000000
      00044D61726B040001000000000007736869667257720400010000000000066E
      616D6557520100490000000100055749445448020002000A0008736869667250
      6F640400010000000000076E616D65506F640100490000000100055749445448
      020002001E000573756D6D610800040000000000044D726B5301004900000001
      00055749445448020002000100035A6153010049000000010005574944544802
      00020014000356795301004900000001000557494454480200020007000000}
    object cds2shifrSta: TIntegerField
      FieldName = 'shifrSta'
    end
    object cds2nameSta: TStringField
      FieldName = 'nameSta'
      Size = 40
    end
    object cds2shifrKat: TIntegerField
      FieldName = 'shifrKat'
    end
    object cds2nameKat: TStringField
      FieldName = 'nameKat'
    end
    object cds2shifrGru: TIntegerField
      FieldName = 'shifrGru'
    end
    object cds2nameGru: TStringField
      FieldName = 'nameGru'
    end
    object cds2yearZa: TIntegerField
      FieldName = 'yearZa'
    end
    object cds2monthZa: TIntegerField
      FieldName = 'monthZa'
    end
    object cds2yearVy: TIntegerField
      FieldName = 'yearVy'
    end
    object cds2monthVy: TIntegerField
      FieldName = 'monthVy'
    end
    object cds2Mark: TIntegerField
      FieldName = 'Mark'
    end
    object cds2shifrWr: TIntegerField
      FieldName = 'shifrWr'
    end
    object cds2nameWR: TStringField
      FieldName = 'nameWR'
      Size = 10
    end
    object cds2shifrPod: TIntegerField
      FieldName = 'shifrPod'
    end
    object cds2namePod: TStringField
      FieldName = 'namePod'
      Size = 30
    end
    object cds2summa: TFloatField
      FieldName = 'summa'
    end
    object cds2MrkS: TStringField
      FieldName = 'MrkS'
      Size = 1
    end
    object cds2ZaS: TStringField
      FieldName = 'ZaS'
    end
    object cds2VyS: TStringField
      FieldName = 'VyS'
      Size = 7
    end
  end
  object cds3: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'shifrSta'
        DataType = ftInteger
      end
      item
        Name = 'nameSta'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'shifrKat'
        DataType = ftInteger
      end
      item
        Name = 'nameKat'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'shifrGru'
        DataType = ftInteger
      end
      item
        Name = 'nameGru'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'yearZa'
        DataType = ftInteger
      end
      item
        Name = 'monthZa'
        DataType = ftInteger
      end
      item
        Name = 'yearVy'
        DataType = ftInteger
      end
      item
        Name = 'monthVy'
        DataType = ftInteger
      end
      item
        Name = 'Mark'
        DataType = ftInteger
      end
      item
        Name = 'shifrWr'
        DataType = ftInteger
      end
      item
        Name = 'nameWR'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'shifrPod'
        DataType = ftInteger
      end
      item
        Name = 'namePod'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'summa'
        DataType = ftFloat
      end
      item
        Name = 'MrkS'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ZaS'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'VyS'
        DataType = ftString
        Size = 7
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 192
    Top = 208
    Data = {
      9B0100009619E0BD0100000018000000130000000000030000009B0108736869
      66725374610400010000000000076E616D655374610100490000000100055749
      4454480200020028000873686966724B61740400010000000000076E616D654B
      6174010049000000010005574944544802000200140008736869667247727504
      00010000000000076E616D654772750100490000000100055749445448020002
      00140006796561725A610400010000000000076D6F6E74685A61040001000000
      0000067965617256790400010000000000076D6F6E7468567904000100000000
      00044D61726B040001000000000007736869667257720400010000000000066E
      616D6557520100490000000100055749445448020002000A0008736869667250
      6F640400010000000000076E616D65506F640100490000000100055749445448
      020002001E000573756D6D610800040000000000044D726B5301004900000001
      00055749445448020002001400035A6153010049000000010005574944544802
      00020007000356795301004900000001000557494454480200020007000000}
    object cds3shifrSta: TIntegerField
      FieldName = 'shifrSta'
    end
    object cds3nameSta: TStringField
      FieldName = 'nameSta'
      Size = 40
    end
    object cds3shifrKat: TIntegerField
      FieldName = 'shifrKat'
    end
    object cds3nameKat: TStringField
      FieldName = 'nameKat'
    end
    object cds3shifrGru: TIntegerField
      FieldName = 'shifrGru'
    end
    object cds3nameGru: TStringField
      FieldName = 'nameGru'
    end
    object cds3yearZa: TIntegerField
      FieldName = 'yearZa'
    end
    object cds3monthZa: TIntegerField
      FieldName = 'monthZa'
    end
    object cds3yearVy: TIntegerField
      FieldName = 'yearVy'
    end
    object cds3monthVy: TIntegerField
      FieldName = 'monthVy'
    end
    object cds3Mark: TIntegerField
      FieldName = 'Mark'
    end
    object cds3shifrWr: TIntegerField
      FieldName = 'shifrWr'
    end
    object cds3nameWR: TStringField
      FieldName = 'nameWR'
      Size = 10
    end
    object cds3shifrPod: TIntegerField
      FieldName = 'shifrPod'
    end
    object cds3namePod: TStringField
      FieldName = 'namePod'
      Size = 30
    end
    object cds3summa: TFloatField
      FieldName = 'summa'
    end
    object cds3MrkS: TStringField
      FieldName = 'MrkS'
    end
    object cds3ZaS: TStringField
      FieldName = 'ZaS'
      Size = 7
    end
    object cds3VyS: TStringField
      FieldName = 'VyS'
      Size = 7
    end
  end
  object cds4: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'shifrSta'
        DataType = ftInteger
      end
      item
        Name = 'nameSta'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'shifrKat'
        DataType = ftInteger
      end
      item
        Name = 'nameKat'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'shifrGru'
        DataType = ftInteger
      end
      item
        Name = 'nameGru'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'yearZa'
        DataType = ftInteger
      end
      item
        Name = 'monthZa'
        DataType = ftInteger
      end
      item
        Name = 'yearVy'
        DataType = ftInteger
      end
      item
        Name = 'monthVy'
        DataType = ftInteger
      end
      item
        Name = 'Mark'
        DataType = ftInteger
      end
      item
        Name = 'shifrWr'
        DataType = ftInteger
      end
      item
        Name = 'nameWR'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'shifrPod'
        DataType = ftInteger
      end
      item
        Name = 'namePod'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'summa'
        DataType = ftFloat
      end
      item
        Name = 'MrkS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ZaS'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'VyS'
        DataType = ftString
        Size = 7
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 232
    Top = 208
    Data = {
      9B0100009619E0BD0100000018000000130000000000030000009B0108736869
      66725374610400010000000000076E616D655374610100490000000100055749
      4454480200020028000873686966724B61740400010000000000076E616D654B
      6174010049000000010005574944544802000200140008736869667247727504
      00010000000000076E616D654772750100490000000100055749445448020002
      00140006796561725A610400010000000000076D6F6E74685A61040001000000
      0000067965617256790400010000000000076D6F6E7468567904000100000000
      00044D61726B040001000000000007736869667257720400010000000000066E
      616D6557520100490000000100055749445448020002000A0008736869667250
      6F640400010000000000076E616D65506F640100490000000100055749445448
      020002001E000573756D6D610800040000000000044D726B5301004900000001
      00055749445448020002000100035A6153010049000000010005574944544802
      00020007000356795301004900000001000557494454480200020007000000}
    object cds4shifrSta: TIntegerField
      FieldName = 'shifrSta'
    end
    object cds4nameSta: TStringField
      FieldName = 'nameSta'
      Size = 40
    end
    object cds4shifrKat: TIntegerField
      FieldName = 'shifrKat'
    end
    object cds4nameKat: TStringField
      FieldName = 'nameKat'
    end
    object cds4shifrGru: TIntegerField
      FieldName = 'shifrGru'
    end
    object cds4nameGru: TStringField
      FieldName = 'nameGru'
    end
    object cds4yearZa: TIntegerField
      FieldName = 'yearZa'
    end
    object cds4monthZa: TIntegerField
      FieldName = 'monthZa'
    end
    object cds4yearVy: TIntegerField
      FieldName = 'yearVy'
    end
    object cds4monthVy: TIntegerField
      FieldName = 'monthVy'
    end
    object cds4Mark: TIntegerField
      FieldName = 'Mark'
    end
    object cds4shifrWr: TIntegerField
      FieldName = 'shifrWr'
    end
    object cds4nameWR: TStringField
      FieldName = 'nameWR'
      Size = 10
    end
    object cds4shifrPod: TIntegerField
      FieldName = 'shifrPod'
    end
    object cds4namePod: TStringField
      FieldName = 'namePod'
      Size = 30
    end
    object cds4summa: TFloatField
      FieldName = 'summa'
    end
    object cds4MrkS: TStringField
      FieldName = 'MrkS'
      Size = 1
    end
    object cds4ZaS: TStringField
      FieldName = 'ZaS'
      Size = 7
    end
    object cds4VyS: TStringField
      FieldName = 'VyS'
      Size = 7
    end
  end
  object cds5: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'shifrSta'
        DataType = ftInteger
      end
      item
        Name = 'nameSta'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'shifrKat'
        DataType = ftInteger
      end
      item
        Name = 'nameKat'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'shifrGru'
        DataType = ftInteger
      end
      item
        Name = 'nameGru'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'yearZa'
        DataType = ftInteger
      end
      item
        Name = 'monthZa'
        DataType = ftInteger
      end
      item
        Name = 'yearVy'
        DataType = ftInteger
      end
      item
        Name = 'monthVy'
        DataType = ftInteger
      end
      item
        Name = 'Mark'
        DataType = ftInteger
      end
      item
        Name = 'shifrWr'
        DataType = ftInteger
      end
      item
        Name = 'nameWR'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'shifrPod'
        DataType = ftInteger
      end
      item
        Name = 'namePod'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'summa'
        DataType = ftFloat
      end
      item
        Name = 'MrkS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ZaS'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'VyS'
        DataType = ftString
        Size = 7
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 272
    Top = 208
    Data = {
      9B0100009619E0BD0100000018000000130000000000030000009B0108736869
      66725374610400010000000000076E616D655374610100490000000100055749
      4454480200020028000873686966724B61740400010000000000076E616D654B
      6174010049000000010005574944544802000200140008736869667247727504
      00010000000000076E616D654772750100490000000100055749445448020002
      00140006796561725A610400010000000000076D6F6E74685A61040001000000
      0000067965617256790400010000000000076D6F6E7468567904000100000000
      00044D61726B040001000000000007736869667257720400010000000000066E
      616D6557520100490000000100055749445448020002000A0008736869667250
      6F640400010000000000076E616D65506F640100490000000100055749445448
      020002001E000573756D6D610800040000000000044D726B5301004900000001
      00055749445448020002000100035A6153010049000000010005574944544802
      00020007000356795301004900000001000557494454480200020007000000}
    object cds5shifrSta: TIntegerField
      FieldName = 'shifrSta'
    end
    object cds5nameSta: TStringField
      FieldName = 'nameSta'
      Size = 40
    end
    object cds5shifrKat: TIntegerField
      FieldName = 'shifrKat'
    end
    object cds5nameKat: TStringField
      FieldName = 'nameKat'
    end
    object cds5shifrGru: TIntegerField
      FieldName = 'shifrGru'
    end
    object cds5nameGru: TStringField
      FieldName = 'nameGru'
    end
    object cds5yearZa: TIntegerField
      FieldName = 'yearZa'
    end
    object cds5monthZa: TIntegerField
      FieldName = 'monthZa'
    end
    object cds5yearVy: TIntegerField
      FieldName = 'yearVy'
    end
    object cds5monthVy: TIntegerField
      FieldName = 'monthVy'
    end
    object cds5Mark: TIntegerField
      FieldName = 'Mark'
    end
    object cds5shifrWr: TIntegerField
      FieldName = 'shifrWr'
    end
    object cds5nameWR: TStringField
      FieldName = 'nameWR'
      Size = 10
    end
    object cds5shifrPod: TIntegerField
      FieldName = 'shifrPod'
    end
    object cds5namePod: TStringField
      FieldName = 'namePod'
      Size = 30
    end
    object cds5summa: TFloatField
      FieldName = 'summa'
    end
    object cds5MrkS: TStringField
      FieldName = 'MrkS'
      Size = 1
    end
    object cds5ZaS: TStringField
      FieldName = 'ZaS'
      Size = 7
    end
    object cds5VyS: TStringField
      FieldName = 'VyS'
      Size = 7
    end
  end
  object cds6: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'shifrSta'
        DataType = ftInteger
      end
      item
        Name = 'nameSta'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'shifrKat'
        DataType = ftInteger
      end
      item
        Name = 'nameKat'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'shifrGru'
        DataType = ftInteger
      end
      item
        Name = 'nameGru'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'yearZa'
        DataType = ftInteger
      end
      item
        Name = 'monthZa'
        DataType = ftInteger
      end
      item
        Name = 'yearVy'
        DataType = ftInteger
      end
      item
        Name = 'monthVy'
        DataType = ftInteger
      end
      item
        Name = 'Mark'
        DataType = ftInteger
      end
      item
        Name = 'shifrWr'
        DataType = ftInteger
      end
      item
        Name = 'nameWR'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'shifrPod'
        DataType = ftInteger
      end
      item
        Name = 'namePod'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'summa'
        DataType = ftFloat
      end
      item
        Name = 'MrkS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ZaS'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'VyS'
        DataType = ftString
        Size = 7
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 312
    Top = 208
    Data = {
      9B0100009619E0BD0100000018000000130000000000030000009B0108736869
      66725374610400010000000000076E616D655374610100490000000100055749
      4454480200020028000873686966724B61740400010000000000076E616D654B
      6174010049000000010005574944544802000200140008736869667247727504
      00010000000000076E616D654772750100490000000100055749445448020002
      00140006796561725A610400010000000000076D6F6E74685A61040001000000
      0000067965617256790400010000000000076D6F6E7468567904000100000000
      00044D61726B040001000000000007736869667257720400010000000000066E
      616D6557520100490000000100055749445448020002000A0008736869667250
      6F640400010000000000076E616D65506F640100490000000100055749445448
      020002001E000573756D6D610800040000000000044D726B5301004900000001
      00055749445448020002000100035A6153010049000000010005574944544802
      00020007000356795301004900000001000557494454480200020007000000}
    object cds6shifrSta: TIntegerField
      FieldName = 'shifrSta'
    end
    object cds6nameSta: TStringField
      FieldName = 'nameSta'
      Size = 40
    end
    object cds6shifrKat: TIntegerField
      FieldName = 'shifrKat'
    end
    object cds6nameKat: TStringField
      FieldName = 'nameKat'
    end
    object cds6shifrGru: TIntegerField
      FieldName = 'shifrGru'
    end
    object cds6nameGru: TStringField
      FieldName = 'nameGru'
    end
    object cds6yearZa: TIntegerField
      FieldName = 'yearZa'
    end
    object cds6monthZa: TIntegerField
      FieldName = 'monthZa'
    end
    object cds6yearVy: TIntegerField
      FieldName = 'yearVy'
    end
    object cds6monthVy: TIntegerField
      FieldName = 'monthVy'
    end
    object cds6Mark: TIntegerField
      FieldName = 'Mark'
    end
    object cds6shifrWr: TIntegerField
      FieldName = 'shifrWr'
    end
    object cds6nameWR: TStringField
      FieldName = 'nameWR'
      Size = 10
    end
    object cds6shifrPod: TIntegerField
      FieldName = 'shifrPod'
    end
    object cds6namePod: TStringField
      FieldName = 'namePod'
      Size = 30
    end
    object cds6summa: TFloatField
      FieldName = 'summa'
    end
    object cds6MrkS: TStringField
      FieldName = 'MrkS'
      Size = 1
    end
    object cds6ZaS: TStringField
      FieldName = 'ZaS'
      Size = 7
    end
    object cds6VyS: TStringField
      FieldName = 'VyS'
      Size = 7
    end
  end
  object dsSummy: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' SEL,'
      ' MONTH_ZA,'
      ' YEAR_ZA'
      'FROM'
      ' BOLN_SUMMY '
      'where'
      ' shifridboln=:shifridboln'
      'order by'
      '  year_za desc, month_za desc ')
    Transaction = trSummy
    Database = FIB.pFIBDatabaseSal
    Left = 448
    Top = 24
    object dsSummySHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object dsSummySEL: TFIBSmallIntField
      FieldName = 'SEL'
    end
    object dsSummyMONTH_ZA: TFIBSmallIntField
      FieldName = 'MONTH_ZA'
    end
    object dsSummyYEAR_ZA: TFIBSmallIntField
      FieldName = 'YEAR_ZA'
    end
  end
  object dsBolnA: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' W_PLACE,'
      ' W_R,'
      ' SHIFRGRU,'
      ' SHIFRKAT,'
      ' SHIFRSTA,'
      ' MONTH_ZA,'
      ' YEAR_ZA,'
      ' MONTH_VY,'
      ' YEAR_VY,'
      ' SUMMA,'
      ' VYPL,'
      ' MARKED'
      'FROM'
      ' BOLNA '
      'WHERE SHIFRIDBOLNSUMMY=:SHIFRIDBOLNSUMMY')
    Transaction = trBolnA
    Database = FIB.pFIBDatabaseSal
    Left = 496
    Top = 24
    object dsBolnAW_PLACE: TFIBSmallIntField
      FieldName = 'W_PLACE'
    end
    object dsBolnAW_R: TFIBSmallIntField
      FieldName = 'W_R'
    end
    object dsBolnASHIFRGRU: TFIBSmallIntField
      FieldName = 'SHIFRGRU'
    end
    object dsBolnASHIFRKAT: TFIBSmallIntField
      FieldName = 'SHIFRKAT'
    end
    object dsBolnASHIFRSTA: TFIBSmallIntField
      FieldName = 'SHIFRSTA'
    end
    object dsBolnAMONTH_ZA: TFIBSmallIntField
      FieldName = 'MONTH_ZA'
    end
    object dsBolnAYEAR_ZA: TFIBSmallIntField
      FieldName = 'YEAR_ZA'
    end
    object dsBolnAMONTH_VY: TFIBSmallIntField
      FieldName = 'MONTH_VY'
    end
    object dsBolnAYEAR_VY: TFIBSmallIntField
      FieldName = 'YEAR_VY'
    end
    object dsBolnASUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object dsBolnAVYPL: TFIBSmallIntField
      FieldName = 'VYPL'
    end
    object dsBolnAMARKED: TFIBSmallIntField
      FieldName = 'MARKED'
    end
  end
  object trSummy: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 448
    Top = 64
  end
  object trBolnA: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 496
    Top = 64
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
    Left = 352
    Top = 168
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    Left = 392
    Top = 168
  end
  object frxSimpleTextExport1: TfrxSimpleTextExport
    UseFileCache = True
    ShowProgress = True
    Frames = False
    EmptyLines = False
    OEMCodepage = False
    Left = 432
    Top = 168
  end
  object frxTXTExport1: TfrxTXTExport
    UseFileCache = True
    ShowProgress = True
    ScaleWidth = 1.000000000000000000
    ScaleHeight = 1.000000000000000000
    Borders = False
    Pseudogrpahic = False
    PageBreaks = True
    OEMCodepage = False
    EmptyLines = False
    LeadSpaces = False
    PrintAfter = False
    PrinterDialog = True
    UseSavedProps = True
    Left = 472
    Top = 168
  end
end
