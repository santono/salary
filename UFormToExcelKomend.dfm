object FormToExcelKomend: TFormToExcelKomend
  Left = 246
  Top = 176
  Width = 608
  Height = 512
  Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1074#1099#1087#1083#1072#1090' '#1074' Excel '
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
  object LabelPodr: TLabel
    Left = 8
    Top = 200
    Width = 3
    Height = 13
  end
  object Label1: TLabel
    Left = 320
    Top = 88
    Width = 75
    Height = 13
    Caption = #1050#1086#1101#1092'.'#1074#1099#1087#1083#1072#1090#1099
  end
  object Label2: TLabel
    Left = 320
    Top = 368
    Width = 88
    Height = 13
    Caption = '% '#1074#1099#1089#1086#1090#1099' '#1089#1090#1088#1086#1082#1080
  end
  object rgMode: TRadioGroup
    Left = 8
    Top = 8
    Width = 185
    Height = 161
    Caption = #1056#1077#1078#1080#1084' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103
    Items.Strings = (
      #1056#1077#1082#1090#1086#1088#1072#1090
      #1040#1059#1055
      #1055#1055#1057
      #1059#1042#1055
      #1040#1061#1063
      #1050#1086#1083#1077#1076#1078' '#1055#1055#1057
      #1050#1086#1083#1077#1076#1078' '#1059#1042#1055)
    TabOrder = 0
    Visible = False
  end
  object BitBtn1: TBitBtn
    Left = 200
    Top = 16
    Width = 105
    Height = 25
    Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 1
    Visible = False
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 200
    Top = 48
    Width = 105
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 216
    Width = 569
    Height = 17
    TabOrder = 3
  end
  object BitBtn3: TBitBtn
    Left = 320
    Top = 16
    Width = 265
    Height = 25
    Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1091#1085#1080#1074#1077#1088#1089#1080#1090#1077#1090' '#1074' '#1088#1091#1073#1083#1103#1093' ('#1089' 15 04 15)'
    TabOrder = 4
    Visible = False
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 320
    Top = 48
    Width = 265
    Height = 25
    Caption = #1050#1086#1083#1077#1076#1078' '#1074' '#1088#1091#1073#1083#1103#1093
    TabOrder = 5
    Visible = False
    OnClick = BitBtn4Click
  end
  object dxCalcEdit1: TdxCalcEdit
    Left = 400
    Top = 88
    Width = 121
    TabOrder = 6
    Visible = False
    Text = '0'
    OnValidate = dxCalcEdit1Validate
  end
  object btn1: TBitBtn
    Left = 320
    Top = 120
    Width = 265
    Height = 25
    Caption = #1057' '#1088#1072#1079#1073#1080#1074#1082#1086#1081' '#1087#1086' '#1089#1090#1088#1072#1085#1080#1094#1072#1084' ('#1091#1085#1080#1074#1077#1088#1089#1080#1090#1077#1090')'
    TabOrder = 7
    OnClick = btn1Click
  end
  object btn2: TBitBtn
    Left = 320
    Top = 152
    Width = 265
    Height = 25
    Caption = #1057' '#1088#1072#1079#1073#1080#1074#1082#1086#1081' '#1087#1086' '#1089#1090#1088#1072#1085#1080#1094#1072#1084' ('#1082#1086#1083#1083#1077#1076#1078')'
    TabOrder = 8
    OnClick = btn2Click
  end
  object btn3: TBitBtn
    Left = 16
    Top = 184
    Width = 297
    Height = 25
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081' '#1080' '#1089#1095#1077#1090#1086#1074
    TabOrder = 9
    OnClick = btn3Click
  end
  object btn4: TBitBtn
    Left = 320
    Top = 184
    Width = 265
    Height = 25
    Caption = #1057' '#1088#1072#1079#1073#1080#1074#1082#1086#1081' '#1087#1086' '#1089#1088#1072#1085#1080#1094#1072#1084' '#1076#1083#1103' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
    TabOrder = 10
    OnClick = btn4Click
  end
  object BitBtn5: TBitBtn
    Left = 320
    Top = 240
    Width = 265
    Height = 25
    Caption = #1057' '#1088#1072#1079#1073#1080#1074#1082#1086#1081' '#1087#1086' '#1089#1090#1088#1072#1085#1080#1094#1072#1084' VIP '#1091#1085#1080#1074#1077#1088#1089#1080#1090#1077#1090' '
    TabOrder = 11
    OnClick = BitBtn5Click
  end
  object BitBtn6: TBitBtn
    Left = 320
    Top = 272
    Width = 265
    Height = 25
    Caption = #1057' '#1088#1072#1079#1073#1080#1074#1082#1086#1081' '#1087#1086' '#1089#1090#1088#1072#1085#1080#1094#1072#1084' '#1086#1089#1090#1072#1083#1100#1085#1086#1081' '#1091#1085#1080#1074#1077#1088#1089#1080#1090#1077#1090
    TabOrder = 12
    OnClick = BitBtn6Click
  end
  object BitBtn7: TBitBtn
    Left = 8
    Top = 288
    Width = 297
    Height = 25
    Caption = #1059#1085#1080#1074#1077#1088#1089#1080#1090#1077#1090' '#1080#1079' '#1087#1072#1084#1103#1090#1080
    TabOrder = 13
    OnClick = BitBtn7Click
  end
  object BitBtn8: TBitBtn
    Left = 8
    Top = 320
    Width = 297
    Height = 25
    Caption = #1050#1086#1083#1083#1077#1076#1078' '#1080#1079' '#1087#1072#1084#1103#1090#1080
    TabOrder = 14
    OnClick = BitBtn8Click
  end
  object BitBtn9: TBitBtn
    Left = 8
    Top = 352
    Width = 297
    Height = 25
    Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103' '#1080#1079' '#1087#1072#1084#1103#1090#1080
    TabOrder = 15
    OnClick = BitBtn9Click
  end
  object BitBtn10: TBitBtn
    Left = 8
    Top = 384
    Width = 297
    Height = 25
    Caption = 'VIP '#1091#1085#1080#1074#1088#1077#1089#1080#1090#1077#1090' '#1080#1079' '#1087#1072#1084#1103#1090#1080
    TabOrder = 16
    OnClick = BitBtn10Click
  end
  object BitBtn11: TBitBtn
    Left = 8
    Top = 416
    Width = 297
    Height = 25
    Caption = #1054#1089#1090#1072#1083#1100#1085#1086#1081' '#1091#1085#1080#1074#1077#1088#1089#1080#1090#1077#1090' '#1080#1079' '#1087#1072#1084#1103#1090#1080
    TabOrder = 17
    OnClick = BitBtn11Click
  end
  object BitBtn12: TBitBtn
    Left = 320
    Top = 320
    Width = 265
    Height = 25
    Caption = #1044#1077#1087#1086#1085#1077#1085#1090#1099
    TabOrder = 18
    OnClick = BitBtn12Click
  end
  object rgKassa: TRadioGroup
    Left = 8
    Top = 240
    Width = 185
    Height = 33
    Caption = #1050#1072#1089#1089#1072
    Columns = 3
    Items.Strings = (
      #1042#1089#1077
      #1041#1072#1085#1082
      #1050#1072#1089#1089#1072)
    TabOrder = 19
  end
  object cxCalcEdit1: TcxCalcEdit
    Left = 416
    Top = 368
    EditValue = 0.000000000000000000
    TabOrder = 20
    Width = 105
  end
  object cbVypl: TCheckBox
    Left = 208
    Top = 248
    Width = 97
    Height = 17
    Caption = #1046#1077#1083#1090#1080#1090#1100
    TabOrder = 21
  end
  object pFIBQuery1: TpFIBQuery
    Transaction = pfbtrnsctnRead
    Database = FIB.pFIBDatabaseSal
    Left = 200
    Top = 80
  end
  object pfbtrnsctnRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 240
    Top = 80
  end
  object frxrprt1: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42152.501412581000000000
    ReportOptions.LastChange = 42213.566179791670000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure PageFooter1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '     if <Page>=<TotalPages> then'
      
        '       PageFooter1.Visible:=false;                              ' +
        '                               '
      'end;'
      ''
      'begin'
      ''
      'end.                                 ')
    OnGetValue = frxrprt1GetValue
    Left = 200
    Top = 120
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = ' RptVariables'
        Value = Null
      end
      item
        Name = 'SummaPropRub'
        Value = ''
      end
      item
        Name = 'SummaPropGrn'
        Value = ''
      end
      item
        Name = 'SummaRub'
        Value = ''
      end
      item
        Name = 'SummaGrn'
        Value = ''
      end
      item
        Name = 'SummaRubKop'
        Value = ''
      end
      item
        Name = 'SummaGrnKop'
        Value = ''
      end
      item
        Name = 'DateFrS'
        Value = ''
      end
      item
        Name = 'DateToS'
        Value = ''
      end
      item
        Name = 'NamePodr'
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
      TopMargin = 7.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object ReportTitle1: TfrxReportTitle
        Height = 529.133858270000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Left = 593.386210000000000000
          Top = 79.370130000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1169)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 593.386210000000000000
          Top = 94.488250000000000000
          Width = 83.149660000000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '0301011')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 593.386210000000000000
          Top = 109.606370000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 593.386210000000000000
          Top = 124.724490000000000000
          Width = 83.149660000000000000
          Height = 30.236240000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 495.118430000000000000
          Top = 94.488250000000000000
          Width = 94.488250000000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#164#1056#1109#1057#1026#1056#1112#1056#176' '#1056#1111#1056#1109' '#1056#1115#1056#1113#1056#1032#1056#8221)
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 495.118430000000000000
          Top = 109.606370000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1111#1056#1109' '#1056#173#1056#8220#1056#160#1056#174#1056#8250)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 37.795300000000000000
          Top = 105.826840000000000000
          Width = 411.968770000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#8250#1057#1107#1056#1110#1056#176#1056#1029#1057#1027#1056#1108#1056#1105#1056#8470' '#1056#1110#1056#1109#1057#1027#1057#1107#1056#1169#1056#176#1057#1026#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1057#8249#1056#8470' '#1057#1107#1056#1029#1056#1105#1056#1030#1056#181#1057#1026#1057#1027 +
              #1056#1105#1057#8218#1056#181#1057#8218' '#1056#1105#1056#1112#1056#181#1056#1029#1056#1105' '#1056#8217#1056#187#1056#176#1056#1169#1056#1105#1056#1112#1056#1105#1057#1026#1056#176' '#1056#8221#1056#176#1056#187#1057#1039)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 147.401670000000000000
          Top = 124.724490000000000000
          Width = 215.433210000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1056#1109#1057#1026#1056#1110#1056#176#1056#1029#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1105')')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 37.795300000000000000
          Top = 136.063080000000000000
          Width = 411.968770000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[NamePodr]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 147.401670000000000000
          Top = 154.960730000000000000
          Width = 215.433210000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1027#1057#8218#1057#1026#1057#1107#1056#1108#1057#8218#1057#1107#1057#1026#1056#1029#1056#1109#1056#181' '#1056#1111#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181')')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 37.795300000000000000
          Top = 181.417440000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8217' '#1056#1108#1056#176#1057#1027#1057#1027#1057#1107' '#1056#1169#1056#187#1057#1039' '#1056#1109#1056#1111#1056#187#1056#176#1057#8218#1057#8249' '#1056#1030' '#1057#1027#1057#1026#1056#1109#1056#1108)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 37.795300000000000000
          Top = 200.315090000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              #1057#1027' "     "___________________201_'#1056#1110'.   '#1056#1111#1056#1109'   "     "___________' +
              '________201_'#1056#1110'.')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 37.795300000000000000
          Top = 219.212740000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176' ')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 75.590600000000000000
          Top = 219.212740000000000000
          Width = 604.724800000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SummaPropRub]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 241.889920000000000000
          Top = 238.110390000000000000
          Width = 215.433210000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1057#1026#1056#1109#1056#1111#1056#1105#1057#1027#1057#1034#1057#1035')')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 37.795300000000000000
          Top = 253.228510000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 325.039580000000000000
          Top = 253.228510000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '   '#1057#1026#1057#1107#1056#177'.')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 366.614410000000000000
          Top = 253.228510000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SummaRubKop]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 415.748300000000000000
          Top = 253.228510000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '  '#1056#1108#1056#1109#1056#1111'.')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 449.764070000000000000
          Top = 253.228510000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '(')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 457.323130000000000000
          Top = 253.228510000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SummaRub]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 570.709030000000000000
          Top = 253.228510000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SummaRubKop]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 529.134200000000000000
          Top = 253.228510000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '   '#1057#1026#1057#1107#1056#177'.')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 600.945270000000000000
          Top = 253.228510000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '  '#1056#1108#1056#1109#1056#1111'.')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 634.961040000000000000
          Top = 253.228510000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            ')')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 453.543600000000000000
          Top = 272.126160000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#8224#1056#1105#1057#8222#1057#1026#1056#176#1056#1112#1056#1105')')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 37.795300000000000000
          Top = 283.464750000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176' ')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 75.590600000000000000
          Top = 283.464750000000000000
          Width = 604.724800000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SummaPropGrn]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 241.889920000000000000
          Top = 302.362400000000000000
          Width = 215.433210000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1057#1026#1056#1109#1056#1111#1056#1105#1057#1027#1057#1034#1057#1035')')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 37.795300000000000000
          Top = 317.480520000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 325.039580000000000000
          Top = 317.480520000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '   '#1056#1110#1057#1026#1056#1029'.')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 366.614410000000000000
          Top = 317.480520000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[SummaGrnKop]')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 415.748300000000000000
          Top = 317.480520000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '  '#1056#1108#1056#1109#1056#1111'.')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 449.764070000000000000
          Top = 317.480520000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '(')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 457.323130000000000000
          Top = 317.480520000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SummaGrn]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 570.709030000000000000
          Top = 317.480520000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SummaGrnKop]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 529.134200000000000000
          Top = 317.480520000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '   '#1056#1110#1057#1026#1056#1029'.')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 600.945270000000000000
          Top = 317.480520000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '  '#1056#1108#1056#1109#1056#1111'.')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 634.961040000000000000
          Top = 317.480520000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            ')')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 457.323130000000000000
          Top = 336.378170000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#8224#1056#1105#1057#8222#1057#1026#1056#176#1056#1112#1056#1105')')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 37.795300000000000000
          Top = 351.496290000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#160#1057#1107#1056#1108#1056#1109#1056#1030#1056#1109#1056#1169#1056#1105#1057#8218#1056#181#1056#187#1057#1034' '#1056#1109#1057#1026#1056#1110#1056#176#1056#1029#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1105)
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 188.976500000000000000
          Top = 351.496290000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#181#1056#1108#1057#8218#1056#1109#1057#1026)
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 321.260050000000000000
          Top = 351.496290000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 449.764070000000000000
          Top = 351.496290000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 188.976500000000000000
          Top = 370.393940000000000000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034')')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 321.260050000000000000
          Top = 370.393940000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#187#1056#1105#1057#8225#1056#1029#1056#176#1057#1039' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 449.764070000000000000
          Top = 370.393940000000000000
          Width = 162.519790000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 37.795300000000000000
          Top = 396.850650000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8220#1056#187#1056#176#1056#1030#1056#1029#1057#8249#1056#8470' '#1056#177#1057#1107#1057#8230#1056#1110#1056#176#1056#187#1057#8218#1056#181#1057#1026)
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 151.181200000000000000
          Top = 396.850650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 151.181200000000000000
          Top = 415.748300000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#187#1056#1105#1057#8225#1056#1029#1056#176#1057#1039' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 264.567100000000000000
          Top = 396.850650000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160'.'#1056#8220'. '#1056#1119#1057#1039#1057#8218#1056#1108#1056#1109#1056#1030#1057#1027#1056#1108#1056#176#1057#1039)
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 264.567100000000000000
          Top = 415.748300000000000000
          Width = 162.519790000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 75.590600000000000000
          Top = 453.543600000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1114'.'#1056#1119'.')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 200.315090000000000000
          Top = 453.543600000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            ' "       "___________________201_'#1056#1110'. ')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 154.960730000000000000
          Top = 487.559370000000000000
          Width = 132.283550000000000000
          Height = 41.574830000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1056#8250#1056#1106#1056#1118#1056#8226#1056#8211#1056#1116#1056#1106#1056#1031' '#1056#8217#1056#8226#1056#8221#1056#1115#1056#1114#1056#1115#1056#1038#1056#1118#1056#172)
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 291.023810000000000000
          Top = 487.559370000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#1109#1056#1112#1056#181#1057#1026' '#1056#1169#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 385.512060000000000000
          Top = 487.559370000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#187#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 291.023810000000000000
          Top = 506.457020000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 385.512060000000000000
          Top = 506.457020000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 506.457020000000000000
          Top = 495.118430000000000000
          Width = 75.590551180000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038)
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Left = 582.047620000000000000
          Top = 495.118430000000000000
          Width = 75.590551180000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109)
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 506.457020000000000000
          Top = 510.236550000000000000
          Width = 151.181200000000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Left = 506.457020000000000000
          Top = 480.000310000000000000
          Width = 151.181200000000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#176#1057#1027#1057#8225#1056#181#1057#8218#1056#1029#1057#8249#1056#8470' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169)
          ParentFont = False
        end
        object Memo94: TfrxMemoView
          Left = 506.457020000000000000
          Top = 506.457020000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[DateFrS]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo95: TfrxMemoView
          Left = 582.047620000000000000
          Top = 506.457020000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[DateToS]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 75.590551180000000000
        Top = 570.709030000000000000
        Width = 718.110700000000000000
        object Memo66: TfrxMemoView
          Width = 52.913420000000000000
          Height = 56.692901180000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#1109#1056#1112#1056#181#1057#1026' '#1056#1111#1056#1109
            #1056#1111#1056#1109#1057#1026#1057#1039#1056#1169#1056#1108#1057#1107)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Left = 52.913420000000000000
          Width = 60.472480000000000000
          Height = 56.692901180000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1118#1056#176#1056#177#1056#181#1056#187#1057#1034#1056#1029#1057#8249#1056#8470
            #1056#1029#1056#1109#1056#1112#1056#181#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 113.385900000000000000
          Width = 226.771800000000000000
          Height = 56.692901180000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#176#1056#1112#1056#1105#1056#187#1056#1105#1057#1039', '#1056#1105#1056#1029#1056#1105#1057#8224#1056#1105#1056#176#1056#187#1057#8249)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 340.157700000000000000
          Width = 75.590600000000000000
          Height = 56.692901180000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176', '
            #1057#1026#1057#1107#1056#177'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Left = 415.748300000000000000
          Width = 86.929190000000000000
          Height = 56.692901180000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034' '#1056#1030' '#1056#1111#1056#1109#1056#187#1057#1107#1057#8225#1056#181#1056#1029#1056#1105#1056#1105' '#1056#1169#1056#181#1056#1029#1056#181#1056#1110' ('#1056#183#1056#176#1056#1111#1056#1105#1057#1027#1057#1034' '#1056#1109 +
              ' '#1056#1169#1056#181#1056#1111#1056#1109#1056#1029#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#1105')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 502.677490000000000000
          Width = 75.590600000000000000
          Height = 56.692901180000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176', '
            #1056#1110#1057#1026#1056#1029'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 578.268090000000000000
          Width = 86.929190000000000000
          Height = 56.692901180000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034' '#1056#1030' '#1056#1111#1056#1109#1056#187#1057#1107#1057#8225#1056#181#1056#1029#1056#1105#1056#1105' '#1056#1169#1056#181#1056#1029#1056#181#1056#1110' ('#1056#183#1056#176#1056#1111#1056#1105#1057#1027#1057#1034' '#1056#1109 +
              ' '#1056#1169#1056#181#1056#1111#1056#1109#1056#1029#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#1105')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo85: TfrxMemoView
          Left = 665.197280000000000000
          Width = 52.913395590000000000
          Height = 56.692950000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176
            #1056#1111#1056#1109#1056#187#1057#1107#1057#8225#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo84: TfrxMemoView
          Top = 56.692950000000000000
          Width = 52.913420000000000000
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
            '1')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo87: TfrxMemoView
          Left = 52.913420000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
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
            '2')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo88: TfrxMemoView
          Left = 113.385900000000000000
          Top = 56.692950000000000000
          Width = 226.771800000000000000
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
            '3')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo89: TfrxMemoView
          Left = 340.157700000000000000
          Top = 56.692950000000000000
          Width = 75.590600000000000000
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
            '4')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo90: TfrxMemoView
          Left = 415.748300000000000000
          Top = 56.692950000000000000
          Width = 86.929190000000000000
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
            '5')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo91: TfrxMemoView
          Left = 502.677490000000000000
          Top = 56.692950000000000000
          Width = 75.590600000000000000
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
            '6')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo92: TfrxMemoView
          Left = 578.268090000000000000
          Top = 56.692950000000000000
          Width = 86.929190000000000000
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
            '7')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo93: TfrxMemoView
          Left = 665.197280000000000000
          Top = 56.692950000000000000
          Width = 52.913395590000000000
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
            '8')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 37.795275590551200000
        Top = 706.772110000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo73: TfrxMemoView
          Width = 52.913420000000000000
          Height = 37.795275590551200000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
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
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 52.913420000000000000
          Width = 60.472480000000000000
          Height = 37.795275590551200000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."TABNO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 113.385900000000000000
          Width = 226.771800000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."FIO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo76: TfrxMemoView
          Left = 340.157700000000000000
          Width = 75.590600000000000000
          Height = 37.795275590551200000
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
            '[frxDBDataset1."SUMMA_RUB"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          Left = 415.748300000000000000
          Width = 86.929190000000000000
          Height = 37.795275590551200000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 502.677490000000000000
          Width = 75.590600000000000000
          Height = 37.795275590551200000
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
            '[frxDBDataset1."SUMMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo79: TfrxMemoView
          Left = 578.268090000000000000
          Width = 86.929190000000000000
          Height = 37.795275590551200000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo86: TfrxMemoView
          Left = 665.197280000000000000
          Width = 52.913395590000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 37.795275590000000000
        Top = 1262.363020000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'PageFooter1OnBeforePrint'
        object Memo80: TfrxMemoView
          Width = 340.157700000000000000
          Height = 22.677165350000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1057#1027#1057#8218#1057#1026#1056#176#1056#1029#1056#1105#1057#8224#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo81: TfrxMemoView
          Left = 340.157700000000000000
          Width = 75.590600000000000000
          Height = 22.677165350000000000
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
            '[SUM(<frxDBDataset1."SUMMA_RUB">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          Left = 415.748300000000000000
          Width = 86.929190000000000000
          Height = 22.677165350000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          Left = 502.677490000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
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
            '[SUM(<frxDBDataset1."SUMMA">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo98: TfrxMemoView
          Left = 578.268090000000000000
          Width = 139.842610000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 434.645950000000000000
        Top = 805.039890000000000000
        Width = 718.110700000000000000
        object Memo164: TfrxMemoView
          Width = 340.157700000000000000
          Height = 22.677165350000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1056#1111#1056#187#1056#176#1057#8218#1056#181#1056#182#1056#1029#1056#1109#1056#8470' '#1056#1030#1056#181#1056#1169#1056#1109#1056#1112#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo165: TfrxMemoView
          Left = 340.157700000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
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
            '[SUM(<frxDBDataset1."SUMMA_RUB">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo166: TfrxMemoView
          Left = 415.748300000000000000
          Width = 86.929190000000000000
          Height = 22.677165350000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo167: TfrxMemoView
          Left = 502.677490000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
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
            '[SUM(<frxDBDataset1."SUMMA">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo168: TfrxMemoView
          Left = 578.268090000000000000
          Width = 139.842610000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo169: TfrxMemoView
          Left = 449.764070000000000000
          Top = 30.236240000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109' '#1056#187#1056#1105#1057#1027#1057#8218#1056#1109#1056#1030)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo170: TfrxMemoView
          Left = 578.268090000000000000
          Top = 30.236240000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[TotalPages]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo171: TfrxMemoView
          Top = 45.354360000000000000
          Width = 238.110390000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#1109' '#1056#1029#1056#176#1057#1027#1057#8218#1056#1109#1057#1039#1057#8240#1056#181#1056#8470' '#1056#1111#1056#187#1056#176#1057#8218#1056#181#1056#182#1056#1029#1056#1109#1056#8470' '#1056#1030#1056#181#1056#1169#1056#1109#1056#1112#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo172: TfrxMemoView
          Top = 71.811070000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1030#1057#8249#1056#1111#1056#187#1056#176#1057#8225#1056#181#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo173: TfrxMemoView
          Left = 117.165430000000000000
          Top = 71.811070000000000000
          Width = 461.102660000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo174: TfrxMemoView
          Left = 117.165430000000000000
          Top = 86.929190000000000000
          Width = 461.102660000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1057#1026#1056#1109#1056#1111#1056#1105#1057#1027#1057#1034#1057#1035')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo175: TfrxMemoView
          Top = 105.826840000000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo176: TfrxMemoView
          Left = 275.905690000000000000
          Top = 105.826840000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1026#1057#1107#1056#177'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo177: TfrxMemoView
          Left = 317.480520000000000000
          Top = 105.826840000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo178: TfrxMemoView
          Left = 377.953000000000000000
          Top = 105.826840000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1111'.  (')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo179: TfrxMemoView
          Left = 419.527830000000000000
          Top = 105.826840000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo180: TfrxMemoView
          Left = 491.338900000000000000
          Top = 105.826840000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1026#1057#1107#1056#177'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo181: TfrxMemoView
          Left = 529.134200000000000000
          Top = 105.826840000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo182: TfrxMemoView
          Left = 578.268090000000000000
          Top = 105.826840000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1111'.)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo183: TfrxMemoView
          Left = 415.748300000000000000
          Top = 120.944960000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#8224#1056#1105#1057#8222#1057#1026#1056#176#1056#1112#1056#1105')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo184: TfrxMemoView
          Top = 139.842610000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1105' '#1056#1169#1056#181#1056#1111#1056#1109#1056#1029#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo185: TfrxMemoView
          Left = 151.181200000000000000
          Top = 139.842610000000000000
          Width = 427.086890000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo186: TfrxMemoView
          Left = 151.181200000000000000
          Top = 154.960730000000000000
          Width = 427.086890000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1057#1026#1056#1109#1056#1111#1056#1105#1057#1027#1057#1034#1057#1035')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo187: TfrxMemoView
          Top = 173.858380000000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo188: TfrxMemoView
          Left = 275.905690000000000000
          Top = 173.858380000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1026#1057#1107#1056#177'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo189: TfrxMemoView
          Left = 317.480520000000000000
          Top = 173.858380000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo190: TfrxMemoView
          Left = 377.953000000000000000
          Top = 173.858380000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1111'.  (')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo191: TfrxMemoView
          Left = 419.527830000000000000
          Top = 173.858380000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo192: TfrxMemoView
          Left = 491.338900000000000000
          Top = 173.858380000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1026#1057#1107#1056#177'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo193: TfrxMemoView
          Left = 529.134200000000000000
          Top = 173.858380000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo194: TfrxMemoView
          Left = 578.268090000000000000
          Top = 173.858380000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1111'.)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo195: TfrxMemoView
          Left = 415.748300000000000000
          Top = 188.976500000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#8224#1056#1105#1057#8222#1057#1026#1056#176#1056#1112#1056#1105')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo196: TfrxMemoView
          Left = 117.165430000000000000
          Top = 207.874150000000000000
          Width = 461.102660000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo197: TfrxMemoView
          Left = 117.165430000000000000
          Top = 222.992270000000000000
          Width = 461.102660000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1057#1026#1056#1109#1056#1111#1056#1105#1057#1027#1057#1034#1057#1035')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo198: TfrxMemoView
          Top = 207.874150000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1030#1057#8249#1056#1111#1056#187#1056#176#1057#8225#1056#181#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo199: TfrxMemoView
          Top = 245.669450000000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo200: TfrxMemoView
          Left = 275.905690000000000000
          Top = 245.669450000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1110#1057#1026#1056#1029'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo201: TfrxMemoView
          Left = 317.480520000000000000
          Top = 245.669450000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo202: TfrxMemoView
          Left = 377.953000000000000000
          Top = 245.669450000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1111'.  (')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo203: TfrxMemoView
          Left = 419.527830000000000000
          Top = 245.669450000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo204: TfrxMemoView
          Left = 491.338900000000000000
          Top = 245.669450000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1110#1057#1026#1056#1029'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo205: TfrxMemoView
          Left = 529.134200000000000000
          Top = 245.669450000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo206: TfrxMemoView
          Left = 578.268090000000000000
          Top = 245.669450000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1111'.)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo207: TfrxMemoView
          Left = 415.748300000000000000
          Top = 260.787570000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#8224#1056#1105#1057#8222#1057#1026#1056#176#1056#1112#1056#1105')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo208: TfrxMemoView
          Top = 279.685220000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1105' '#1056#1169#1056#181#1056#1111#1056#1109#1056#1029#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo209: TfrxMemoView
          Left = 151.181200000000000000
          Top = 279.685220000000000000
          Width = 427.086890000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo210: TfrxMemoView
          Left = 151.181200000000000000
          Top = 294.803340000000000000
          Width = 427.086890000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1057#1026#1056#1109#1056#1111#1056#1105#1057#1027#1057#1034#1057#1035')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo211: TfrxMemoView
          Top = 313.700990000000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo212: TfrxMemoView
          Left = 275.905690000000000000
          Top = 313.700990000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1110#1057#1026#1056#1029'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo213: TfrxMemoView
          Left = 377.953000000000000000
          Top = 313.700990000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1111'.  (')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo214: TfrxMemoView
          Left = 419.527830000000000000
          Top = 313.700990000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo215: TfrxMemoView
          Left = 491.338900000000000000
          Top = 313.700990000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1110#1057#1026#1056#1029'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo216: TfrxMemoView
          Left = 529.134200000000000000
          Top = 313.700990000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo217: TfrxMemoView
          Left = 578.268090000000000000
          Top = 313.700990000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1111'.)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo218: TfrxMemoView
          Top = 343.937230000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8217#1057#8249#1056#1111#1056#187#1056#176#1057#8218#1057#1107' '#1056#1111#1057#1026#1056#1109#1056#1105#1056#183#1056#1030#1056#181#1056#187)
          ParentFont = False
        end
        object Memo219: TfrxMemoView
          Left = 113.385900000000000000
          Top = 343.937230000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo220: TfrxMemoView
          Left = 253.228510000000000000
          Top = 343.937230000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo221: TfrxMemoView
          Left = 366.614410000000000000
          Top = 343.937230000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo222: TfrxMemoView
          Left = 113.385900000000000000
          Top = 362.834880000000000000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034')')
          ParentFont = False
        end
        object Memo223: TfrxMemoView
          Left = 253.228510000000000000
          Top = 362.834880000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#187#1056#1105#1057#8225#1056#1029#1056#176#1057#1039' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo224: TfrxMemoView
          Left = 366.614410000000000000
          Top = 362.834880000000000000
          Width = 162.519790000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
        object Memo225: TfrxMemoView
          Top = 377.953000000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#160#1056#176#1057#1027#1057#8230#1056#1109#1056#1169#1056#1029#1057#8249#1056#8470' '#1056#1108#1056#176#1057#1027#1057#1027#1056#1109#1056#1030#1057#8249#1056#8470' '#1056#1109#1057#1026#1056#1169#1056#181#1057#1026' '#1074#8222#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo226: TfrxMemoView
          Left = 158.740260000000000000
          Top = 377.953000000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo227: TfrxMemoView
          Left = 249.448980000000000000
          Top = 377.953000000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1109#1057#8218' "___"___________________201__'#1056#1110'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo228: TfrxMemoView
          Top = 396.850650000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1109#1056#1030#1056#181#1057#1026#1056#1105#1056#187' '#1056#177#1057#1107#1057#8230#1056#1110#1056#176#1056#187#1057#8218#1056#181#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo229: TfrxMemoView
          Left = 113.385900000000000000
          Top = 396.850650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo230: TfrxMemoView
          Left = 226.771800000000000000
          Top = 396.850650000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo231: TfrxMemoView
          Left = 113.385900000000000000
          Top = 415.748300000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#187#1056#1105#1057#8225#1056#1029#1056#176#1057#1039' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo232: TfrxMemoView
          Left = 226.771800000000000000
          Top = 415.748300000000000000
          Width = 162.519790000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = dsRub
    Left = 232
    Top = 120
  end
  object dsRub: TpFIBDataSet
    SelectSQL.Strings = (
      'select npp,'
      '       fio,'
      '       tabno,'
      '       summa,'
      '       summa_rub '
      'from PR_LIST_KOMEND_RUB_BY_PODR('
      ':y,'
      ':m,'
      ':shifrsta,'
      ':umode,'
      ':koefvypl,'
      ':vip_mode,'
      ':koefrub'
      ') order by fio')
    Transaction = pfbtrnsctnRead
    Database = FIB.pFIBDatabaseSal
    Left = 264
    Top = 120
    object dsRubNPP: TFIBIntegerField
      FieldName = 'NPP'
    end
    object dsRubFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 51
      EmptyStrToNull = True
    end
    object dsRubTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object dsRubSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object dsRubSUMMA_RUB: TFIBBCDField
      FieldName = 'SUMMA_RUB'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
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
    Top = 152
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
    Left = 240
    Top = 152
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    Left = 272
    Top = 152
  end
  object frxrprt2: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42152.501412581000000000
    ReportOptions.LastChange = 43564.878927453700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure PageFooter1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '     if <Page>=<TotalPages> then'
      
        '       PageFooter1.Visible:=false;                              ' +
        '                               '
      'end;'
      ''
      'begin'
      ''
      'end.                                 ')
    OnGetValue = frxrprt2GetValue
    Left = 56
    Top = 216
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = ' RptVariables'
        Value = Null
      end
      item
        Name = 'SummaPropRub'
        Value = Null
      end
      item
        Name = 'SummaRub'
        Value = Null
      end
      item
        Name = 'SummaRubKop'
        Value = Null
      end
      item
        Name = 'DateFrS'
        Value = Null
      end
      item
        Name = 'DateToS'
        Value = Null
      end
      item
        Name = 'NamePodr'
        Value = Null
      end
      item
        Name = 'NAMEUNI'
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
      TopMargin = 7.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object ReportTitle1: TfrxReportTitle
        Height = 377.952755910000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Left = 589.606680000000000000
          Top = 3.779530000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1169)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 589.606680000000000000
          Top = 18.897650000000000000
          Width = 83.149660000000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '0301011')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 589.606680000000000000
          Top = 34.015770000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 589.606680000000000000
          Top = 49.133890000000000000
          Width = 83.149660000000000000
          Height = 30.236240000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 491.338900000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#164#1056#1109#1057#1026#1056#1112#1056#176' '#1056#1111#1056#1109' '#1056#1115#1056#1113#1056#1032#1056#8221)
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 491.338900000000000000
          Top = 34.015770000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1111#1056#1109' '#1056#173#1056#8220#1056#160#1056#174#1056#8250)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 34.015770000000000000
          Top = 30.236240000000000000
          Width = 411.968770000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[NAMEUNI]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 143.622140000000000000
          Top = 49.133890000000000000
          Width = 215.433210000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1056#1109#1057#1026#1056#1110#1056#176#1056#1029#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1105')')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 34.015770000000000000
          Top = 60.472480000000000000
          Width = 411.968770000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[NamePodr]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 143.622140000000000000
          Top = 79.370130000000000000
          Width = 215.433210000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1027#1057#8218#1057#1026#1057#1107#1056#1108#1057#8218#1057#1107#1057#1026#1056#1029#1056#1109#1056#181' '#1056#1111#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181')')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 34.015770000000000000
          Top = 105.826840000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8217' '#1056#1108#1056#176#1057#1027#1057#1027#1057#1107' '#1056#1169#1056#187#1057#1039' '#1056#1109#1056#1111#1056#187#1056#176#1057#8218#1057#8249' '#1056#1030' '#1057#1027#1057#1026#1056#1109#1056#1108)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 34.015770000000000000
          Top = 124.724490000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              #1057#1027' "     "___________________201_'#1056#1110'.   '#1056#1111#1056#1109'   "     "___________' +
              '________201_'#1056#1110'.')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 34.015770000000000000
          Top = 143.622140000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176' ')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 71.811070000000000000
          Top = 143.622140000000000000
          Width = 604.724800000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SummaPropRub]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 238.110390000000000000
          Top = 162.519790000000000000
          Width = 215.433210000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1057#1026#1056#1109#1056#1111#1056#1105#1057#1027#1057#1034#1057#1035')')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 34.015770000000000000
          Top = 177.637910000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 321.260050000000000000
          Top = 177.637910000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1057#1026#1056#1109#1057#1027'.'#1057#1026#1057#1107#1056#177'.')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 362.834880000000000000
          Top = 177.637910000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SummaRubKop]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 411.968770000000000000
          Top = 177.637910000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '  '#1056#1108#1056#1109#1056#1111'.')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 445.984540000000000000
          Top = 177.637910000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '(')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 453.543600000000000000
          Top = 177.637910000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SummaRub]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 566.929500000000000000
          Top = 177.637910000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SummaRubKop]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 525.354670000000000000
          Top = 177.637910000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1057#1026#1056#1109#1057#1027'.'#1057#1026#1057#1107#1056#177'.')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 597.165740000000000000
          Top = 177.637910000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '  '#1056#1108#1056#1109#1056#1111'.')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 631.181510000000000000
          Top = 177.637910000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            ')')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 449.764070000000000000
          Top = 196.535560000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#8224#1056#1105#1057#8222#1057#1026#1056#176#1056#1112#1056#1105')')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 34.015770000000000000
          Top = 211.653680000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#160#1057#1107#1056#1108#1056#1109#1056#1030#1056#1109#1056#1169#1056#1105#1057#8218#1056#181#1056#187#1057#1034' '#1056#1109#1057#1026#1056#1110#1056#176#1056#1029#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1105)
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 185.196970000000000000
          Top = 211.653680000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#181#1056#1108#1057#8218#1056#1109#1057#1026)
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 317.480520000000000000
          Top = 211.653680000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 445.984540000000000000
          Top = 211.653680000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 185.196970000000000000
          Top = 230.551330000000000000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034')')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 317.480520000000000000
          Top = 230.551330000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#187#1056#1105#1057#8225#1056#1029#1056#176#1057#1039' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 445.984540000000000000
          Top = 230.551330000000000000
          Width = 162.519790000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 34.015770000000000000
          Top = 257.008040000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8220#1056#187#1056#176#1056#1030#1056#1029#1057#8249#1056#8470' '#1056#177#1057#1107#1057#8230#1056#1110#1056#176#1056#187#1057#8218#1056#181#1057#1026)
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 147.401670000000000000
          Top = 257.008040000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 147.401670000000000000
          Top = 275.905690000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#187#1056#1105#1057#8225#1056#1029#1056#176#1057#1039' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 260.787570000000000000
          Top = 257.008040000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160'.'#1056#8220'. '#1056#1119#1057#1039#1057#8218#1056#1108#1056#1109#1056#1030#1057#1027#1056#1108#1056#176#1057#1039)
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 260.787570000000000000
          Top = 275.905690000000000000
          Width = 162.519790000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 71.811070000000000000
          Top = 306.141930000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1114'.'#1056#1119'.')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 196.535560000000000000
          Top = 306.141930000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            ' "       "___________________201_'#1056#1110'. ')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 147.401670000000000000
          Top = 336.378170000000000000
          Width = 132.283550000000000000
          Height = 41.574830000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1056#8250#1056#1106#1056#1118#1056#8226#1056#8211#1056#1116#1056#1106#1056#1031' '#1056#8217#1056#8226#1056#8221#1056#1115#1056#1114#1056#1115#1056#1038#1056#1118#1056#172)
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 283.464750000000000000
          Top = 340.157700000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#1109#1056#1112#1056#181#1057#1026' '#1056#1169#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 377.953000000000000000
          Top = 340.157700000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#187#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 283.464750000000000000
          Top = 359.055350000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 377.953000000000000000
          Top = 359.055350000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 498.897960000000000000
          Top = 343.937230000000000000
          Width = 75.590551180000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038)
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Left = 574.488560000000000000
          Top = 343.937230000000000000
          Width = 75.590551180000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109)
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 498.897960000000000000
          Top = 359.055350000000000000
          Width = 151.181200000000000000
          Height = 18.897640240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Left = 498.897960000000000000
          Top = 328.819110000000000000
          Width = 151.181200000000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#176#1057#1027#1057#8225#1056#181#1057#8218#1056#1029#1057#8249#1056#8470' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169)
          ParentFont = False
        end
        object Memo94: TfrxMemoView
          Left = 498.897960000000000000
          Top = 359.055350000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[DateFrS]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo95: TfrxMemoView
          Left = 574.488560000000000000
          Top = 359.055350000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[DateToS]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 75.590551180000000000
        Top = 419.527830000000000000
        Width = 718.110700000000000000
        object Memo66: TfrxMemoView
          Width = 52.913420000000000000
          Height = 56.692901180000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#1109#1056#1112#1056#181#1057#1026' '#1056#1111#1056#1109
            #1056#1111#1056#1109#1057#1026#1057#1039#1056#1169#1056#1108#1057#1107)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Left = 52.913420000000000000
          Width = 60.472480000000000000
          Height = 56.692901180000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1118#1056#176#1056#177#1056#181#1056#187#1057#1034#1056#1029#1057#8249#1056#8470
            #1056#1029#1056#1109#1056#1112#1056#181#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 113.385900000000000000
          Width = 389.291590000000000000
          Height = 56.692901180000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#176#1056#1112#1056#1105#1056#187#1056#1105#1057#1039', '#1056#1105#1056#1029#1056#1105#1057#8224#1056#1105#1056#176#1056#187#1057#8249)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 502.677490000000000000
          Width = 75.590600000000000000
          Height = 56.692901180000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176', '
            #1057#1026#1056#1109#1057#1027'.'#1057#1026#1057#1107#1056#177'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Left = 578.268090000000000000
          Width = 86.929190000000000000
          Height = 56.692901180000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034' '#1056#1030' '#1056#1111#1056#1109#1056#187#1057#1107#1057#8225#1056#181#1056#1029#1056#1105#1056#1105' '#1056#1169#1056#181#1056#1029#1056#181#1056#1110' ('#1056#183#1056#176#1056#1111#1056#1105#1057#1027#1057#1034' '#1056#1109 +
              ' '#1056#1169#1056#181#1056#1111#1056#1109#1056#1029#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#1105')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo85: TfrxMemoView
          Left = 665.197280000000000000
          Width = 52.913395590000000000
          Height = 56.692950000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176
            #1056#1111#1056#1109#1056#187#1057#1107#1057#8225#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo84: TfrxMemoView
          Top = 56.692950000000000000
          Width = 52.913420000000000000
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
            '1')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo87: TfrxMemoView
          Left = 52.913420000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
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
            '2')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo88: TfrxMemoView
          Left = 113.385900000000000000
          Top = 56.692950000000000000
          Width = 389.291590000000000000
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
            '3')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo89: TfrxMemoView
          Left = 502.677490000000000000
          Top = 56.692950000000000000
          Width = 75.590600000000000000
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
            '4')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo90: TfrxMemoView
          Left = 578.268090000000000000
          Top = 56.692950000000000000
          Width = 86.929190000000000000
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
            '5')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo93: TfrxMemoView
          Left = 665.197280000000000000
          Top = 56.692950000000000000
          Width = 52.913395590000000000
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
            '6')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 37.795275590551200000
        Top = 555.590910000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo73: TfrxMemoView
          Width = 52.913420000000000000
          Height = 37.795275590551200000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
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
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 52.913420000000000000
          Width = 60.472480000000000000
          Height = 37.795275590551200000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."TABNO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 113.385900000000000000
          Width = 389.291590000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDataset1."FIO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo76: TfrxMemoView
          Left = 502.677490000000000000
          Width = 75.590600000000000000
          Height = 37.795275590000000000
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
            '[frxDBDataset1."SUMMA_RUB"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          Left = 578.268090000000000000
          Width = 86.929190000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo86: TfrxMemoView
          Left = 665.197280000000000000
          Width = 52.913395590000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 37.795275590000000000
        Top = 978.898270000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'PageFooter1OnBeforePrint'
        object Memo80: TfrxMemoView
          Width = 502.677490000000000000
          Height = 22.677165350000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1057#1027#1057#8218#1057#1026#1056#176#1056#1029#1056#1105#1057#8224#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo81: TfrxMemoView
          Left = 502.677490000000000000
          Width = 75.590600000000000000
          Height = 22.677165350000000000
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
            '[SUM(<frxDBDataset1."SUMMA_RUB">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo98: TfrxMemoView
          Left = 578.268090000000000000
          Width = 139.842610000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 302.362204720000000000
        Top = 653.858690000000000000
        Width = 718.110700000000000000
        object Memo164: TfrxMemoView
          Width = 502.677490000000000000
          Height = 22.677165350000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1056#1111#1056#187#1056#176#1057#8218#1056#181#1056#182#1056#1029#1056#1109#1056#8470' '#1056#1030#1056#181#1056#1169#1056#1109#1056#1112#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo165: TfrxMemoView
          Left = 502.677490000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
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
            '[SUM(<frxDBDataset1."SUMMA_RUB">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo168: TfrxMemoView
          Left = 578.268090000000000000
          Width = 139.842610000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo169: TfrxMemoView
          Left = 449.764070000000000000
          Top = 30.236240000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109' '#1056#187#1056#1105#1057#1027#1057#8218#1056#1109#1056#1030)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo170: TfrxMemoView
          Left = 578.268090000000000000
          Top = 30.236240000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[TotalPages]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo171: TfrxMemoView
          Top = 45.354360000000000000
          Width = 238.110390000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#1109' '#1056#1029#1056#176#1057#1027#1057#8218#1056#1109#1057#1039#1057#8240#1056#181#1056#8470' '#1056#1111#1056#187#1056#176#1057#8218#1056#181#1056#182#1056#1029#1056#1109#1056#8470' '#1056#1030#1056#181#1056#1169#1056#1109#1056#1112#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo172: TfrxMemoView
          Top = 71.811070000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1030#1057#8249#1056#1111#1056#187#1056#176#1057#8225#1056#181#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo173: TfrxMemoView
          Left = 117.165430000000000000
          Top = 71.811070000000000000
          Width = 461.102660000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo174: TfrxMemoView
          Left = 117.165430000000000000
          Top = 86.929190000000000000
          Width = 461.102660000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1057#1026#1056#1109#1056#1111#1056#1105#1057#1027#1057#1034#1057#1035')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo175: TfrxMemoView
          Top = 105.826840000000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo176: TfrxMemoView
          Left = 275.905690000000000000
          Top = 105.826840000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1026#1056#1109#1057#1027'.'#1057#1026#1057#1107#1056#177'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo177: TfrxMemoView
          Left = 325.039370078740200000
          Top = 105.826840000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo178: TfrxMemoView
          Left = 385.511811020000000000
          Top = 105.826840000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1111'. (')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo179: TfrxMemoView
          Left = 423.307360000000000000
          Top = 105.826840000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo180: TfrxMemoView
          Left = 495.118430000000000000
          Top = 105.826840000000000000
          Width = 49.133860710000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1026#1056#1109#1057#1027'.'#1057#1026#1057#1107#1056#177'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo181: TfrxMemoView
          Left = 544.251970940000000000
          Top = 105.826840000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo182: TfrxMemoView
          Left = 593.385829210000000000
          Top = 105.826840000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1111'.)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo183: TfrxMemoView
          Left = 415.748300000000000000
          Top = 120.944960000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#8224#1056#1105#1057#8222#1057#1026#1056#176#1056#1112#1056#1105')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo184: TfrxMemoView
          Top = 139.842610000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1105' '#1056#1169#1056#181#1056#1111#1056#1109#1056#1029#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo185: TfrxMemoView
          Left = 151.181200000000000000
          Top = 139.842610000000000000
          Width = 427.086890000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo186: TfrxMemoView
          Left = 151.181200000000000000
          Top = 154.960730000000000000
          Width = 427.086890000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1057#1026#1056#1109#1056#1111#1056#1105#1057#1027#1057#1034#1057#1035')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo187: TfrxMemoView
          Top = 173.858380000000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo188: TfrxMemoView
          Left = 275.905690000000000000
          Top = 173.858380000000000000
          Width = 49.133858270000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1026#1056#1109#1057#1027'.'#1057#1026#1057#1107#1056#177'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo189: TfrxMemoView
          Left = 325.039580000000000000
          Top = 173.858380000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo190: TfrxMemoView
          Left = 385.512060000000000000
          Top = 173.858380000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1111'. (')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo191: TfrxMemoView
          Left = 423.307360000000000000
          Top = 173.858380000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo192: TfrxMemoView
          Left = 495.118430000000000000
          Top = 173.858380000000000000
          Width = 49.133860710000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1026#1056#1109#1057#1027'.'#1057#1026#1057#1107#1056#177'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo193: TfrxMemoView
          Left = 544.251970940000000000
          Top = 173.858380000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo194: TfrxMemoView
          Left = 593.385829210000000000
          Top = 173.858380000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1111'.)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo195: TfrxMemoView
          Left = 415.748300000000000000
          Top = 188.976500000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#8224#1056#1105#1057#8222#1057#1026#1056#176#1056#1112#1056#1105')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo218: TfrxMemoView
          Top = 211.653680000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8217#1057#8249#1056#1111#1056#187#1056#176#1057#8218#1057#1107' '#1056#1111#1057#1026#1056#1109#1056#1105#1056#183#1056#1030#1056#181#1056#187)
          ParentFont = False
        end
        object Memo219: TfrxMemoView
          Left = 113.385900000000000000
          Top = 211.653680000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo220: TfrxMemoView
          Left = 253.228510000000000000
          Top = 211.653680000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo221: TfrxMemoView
          Left = 366.614410000000000000
          Top = 211.653680000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo222: TfrxMemoView
          Left = 113.385900000000000000
          Top = 230.551330000000000000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034')')
          ParentFont = False
        end
        object Memo223: TfrxMemoView
          Left = 253.228510000000000000
          Top = 230.551330000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#187#1056#1105#1057#8225#1056#1029#1056#176#1057#1039' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo224: TfrxMemoView
          Left = 366.614410000000000000
          Top = 230.551330000000000000
          Width = 162.519790000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
        object Memo225: TfrxMemoView
          Top = 245.669450000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#160#1056#176#1057#1027#1057#8230#1056#1109#1056#1169#1056#1029#1057#8249#1056#8470' '#1056#1108#1056#176#1057#1027#1057#1027#1056#1109#1056#1030#1057#8249#1056#8470' '#1056#1109#1057#1026#1056#1169#1056#181#1057#1026' '#1074#8222#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo226: TfrxMemoView
          Left = 158.740260000000000000
          Top = 245.669450000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo227: TfrxMemoView
          Left = 249.448980000000000000
          Top = 245.669450000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1109#1057#8218' "___"___________________201__'#1056#1110'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo228: TfrxMemoView
          Top = 264.567100000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1109#1056#1030#1056#181#1057#1026#1056#1105#1056#187' '#1056#177#1057#1107#1057#8230#1056#1110#1056#176#1056#187#1057#8218#1056#181#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo229: TfrxMemoView
          Left = 113.385900000000000000
          Top = 264.567100000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo230: TfrxMemoView
          Left = 226.771800000000000000
          Top = 264.567100000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo231: TfrxMemoView
          Left = 113.385900000000000000
          Top = 283.464750000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#187#1056#1105#1057#8225#1056#1029#1056#176#1057#1039' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo232: TfrxMemoView
          Left = 226.771800000000000000
          Top = 283.464750000000000000
          Width = 162.519790000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
      end
    end
  end
  object cdsRub: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NPP'
        DataType = ftInteger
      end
      item
        Name = 'TABNO'
        DataType = ftInteger
      end
      item
        Name = 'FIO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'SUMMA'
        DataType = ftFloat
      end
      item
        Name = 'SUMMA_RUB'
        DataType = ftFloat
      end
      item
        Name = 'IDCODE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'BANKCOUNT'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 176
    Top = 216
    Data = {
      A50000009619E0BD010000001800000007000000000003000000A500034E5050
      0400010000000000055441424E4F04000100000000000346494F010049000000
      01000557494454480200020032000553554D4D4108000400000000000953554D
      4D415F5255420800040000000000064944434F44450100490000000100055749
      4454480200020014000942414E4B434F554E5401004900000001000557494454
      480200020014000000}
    object cdsRubNPP: TIntegerField
      FieldName = 'NPP'
    end
    object cdsRubTABNO: TIntegerField
      FieldName = 'TABNO'
    end
    object cdsRubFIO: TStringField
      FieldName = 'FIO'
      Size = 50
    end
    object cdsRubSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object cdsRubSUMMA_RUB: TFloatField
      FieldName = 'SUMMA_RUB'
    end
    object cdsRubIDCODE: TStringField
      FieldName = 'IDCODE'
    end
    object cdsRubBANKCOUNT: TStringField
      FieldName = 'BANKCOUNT'
    end
  end
  object frxReportMem: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42152.501412581000000000
    ReportOptions.LastChange = 43564.874326284720000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var Y:real;'
      
        '    pageFooterPrinted:boolean;                                  ' +
        '                                                          '
      'procedure PageFooter1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   //  if <Page>=<TotalPages> then'
      '   //    PageFooter1.Visible:=false;'
      '     Engine.CurY       := Y;'
      
        '     pageFooterPrinted := true;                                 ' +
        '                      '
      'end;'
      ''
      ''
      'procedure MasterData1OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '   Y:=Engine.CurY;'
      '   PageFooter1.Visible := True;'
      '   PageHeader1.Visible := true;  '
      '   pageFooterPrinted  := false;       '
      'end;            '
      ''
      
        'procedure ReportSummary1OnAfterCalcHeight(Sender: TfrxComponent)' +
        ';'
      'begin'
      '  Engine.ShowBand(PageFooter1) ;'
      '  pageFooterPrinted   := false;'
      '                                                            '
      'end;'
      ''
      'procedure ReportSummary1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  PageHeader1.Visible := false;  '
      'end;'
      ''
      'procedure Memo164OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '  PageHeader1.Visible := false;  '
      'end;'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  PageHeader1.Visible := true;  '
      '    '
      'end;'
      ''
      'begin'
      '    y:=0;'
      
        '    pageFooterPrinted := false;                                 ' +
        '     '
      'end.                                 ')
    OnGetValue = frxReportMemGetValue
    Left = 96
    Top = 208
    Datasets = <
      item
        DataSet = frxDBDatasetMem
        DataSetName = 'frxDBDatasetMem'
      end>
    Variables = <
      item
        Name = ' RptVariables'
        Value = Null
      end
      item
        Name = 'SummaPropRub'
        Value = Null
      end
      item
        Name = 'SummaRub'
        Value = Null
      end
      item
        Name = 'SummaRubKop'
        Value = Null
      end
      item
        Name = 'DateFrS'
        Value = Null
      end
      item
        Name = 'DateToS'
        Value = Null
      end
      item
        Name = 'NamePodr'
        Value = Null
      end
      item
        Name = 'NAMEUNI'
        Value = Null
      end
      item
        Name = 'Y'
        Value = Null
      end
      item
        Name = 'NAMEGLBUH'
        Value = Null
      end
      item
        Name = 'NAMEREKTOR'
        Value = Null
      end
      item
        Name = 'NAMEDOLGREKTOR'
        Value = Null
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
      TopMargin = 7.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object ReportTitle1: TfrxReportTitle
        Height = 377.952755910000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo3: TfrxMemoView
          Left = 589.606680000000000000
          Top = 3.779530000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1169)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 589.606680000000000000
          Top = 18.897650000000000000
          Width = 83.149660000000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '0301011')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 589.606680000000000000
          Top = 34.015770000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 589.606680000000000000
          Top = 49.133890000000000000
          Width = 83.149660000000000000
          Height = 30.236240000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 491.338900000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#164#1056#1109#1057#1026#1056#1112#1056#176' '#1056#1111#1056#1109' '#1056#1115#1056#1113#1056#1032#1056#8221)
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 491.338900000000000000
          Top = 34.015770000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1111#1056#1109' '#1056#173#1056#8220#1056#160#1056#174#1056#8250)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 34.015770000000000000
          Top = 30.236240000000000000
          Width = 411.968770000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[NAMEUNI]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 143.622140000000000000
          Top = 49.133890000000000000
          Width = 215.433210000000000000
          Height = 11.338590000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1029#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181' '#1056#1109#1057#1026#1056#1110#1056#176#1056#1029#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1105')')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 34.015770000000000000
          Top = 60.472480000000000000
          Width = 411.968770000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[NamePodr]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 143.622140000000000000
          Top = 79.370130000000000000
          Width = 215.433210000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1027#1057#8218#1057#1026#1057#1107#1056#1108#1057#8218#1057#1107#1057#1026#1056#1029#1056#1109#1056#181' '#1056#1111#1056#1109#1056#1169#1057#1026#1056#176#1056#183#1056#1169#1056#181#1056#187#1056#181#1056#1029#1056#1105#1056#181')')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 34.015770000000000000
          Top = 105.826840000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8217' '#1056#1108#1056#176#1057#1027#1057#1027#1057#1107' '#1056#1169#1056#187#1057#1039' '#1056#1109#1056#1111#1056#187#1056#176#1057#8218#1057#8249' '#1056#1030' '#1057#1027#1057#1026#1056#1109#1056#1108)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 34.015770000000000000
          Top = 124.724490000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            
              #1057#1027' "     "___________________201_'#1056#1110'.   '#1056#1111#1056#1109'   "     "___________' +
              '________201_'#1056#1110'.')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 34.015770000000000000
          Top = 143.622140000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176' ')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 71.811070000000000000
          Top = 143.622140000000000000
          Width = 604.724800000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SummaPropRub]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 238.110390000000000000
          Top = 162.519790000000000000
          Width = 215.433210000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1057#1026#1056#1109#1056#1111#1056#1105#1057#1027#1057#1034#1057#1035')')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 34.015770000000000000
          Top = 177.637910000000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 309.921460000000000000
          Top = 177.637910000000000000
          Width = 52.913385830000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1057#1026#1056#1109#1057#1027'. '#1057#1026#1057#1107#1056#177'.')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 362.834880000000000000
          Top = 177.637910000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SummaRubKop]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 411.968770000000000000
          Top = 177.637910000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '  '#1056#1108#1056#1109#1056#1111'.')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 445.984540000000000000
          Top = 177.637910000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '(')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 453.543600000000000000
          Top = 177.637910000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SummaRub]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 578.267716535433100000
          Top = 177.637910000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SummaRubKop]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 525.354670000000000000
          Top = 177.637910000000000000
          Width = 52.913385830000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1057#1026#1056#1109#1057#1027'. '#1057#1026#1057#1107#1056#177'.')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 608.503937007874000000
          Top = 177.637910000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            '  '#1056#1108#1056#1109#1056#1111'.')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 642.519685039370100000
          Top = 177.637910000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            ')')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 449.764070000000000000
          Top = 196.535560000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#8224#1056#1105#1057#8222#1057#1026#1056#176#1056#1112#1056#1105')')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 34.015770000000000000
          Top = 211.653680000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#160#1057#1107#1056#1108#1056#1109#1056#1030#1056#1109#1056#1169#1056#1105#1057#8218#1056#181#1056#187#1057#1034' '#1056#1109#1057#1026#1056#1110#1056#176#1056#1029#1056#1105#1056#183#1056#176#1057#8224#1056#1105#1056#1105)
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 185.196970000000000000
          Top = 211.653680000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[NAMEDOLGREKTOR]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 317.480520000000000000
          Top = 211.653680000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 445.984540000000000000
          Top = 211.653680000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[NAMEREKTOR]')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 185.196970000000000000
          Top = 230.551330000000000000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034')')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 317.480520000000000000
          Top = 230.551330000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#187#1056#1105#1057#8225#1056#1029#1056#176#1057#1039' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 445.984540000000000000
          Top = 230.551330000000000000
          Width = 162.519790000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 34.015770000000000000
          Top = 257.008040000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8220#1056#187#1056#176#1056#1030#1056#1029#1057#8249#1056#8470' '#1056#177#1057#1107#1057#8230#1056#1110#1056#176#1056#187#1057#8218#1056#181#1057#1026)
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 147.401670000000000000
          Top = 257.008040000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 147.401670000000000000
          Top = 275.905690000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#187#1056#1105#1057#8225#1056#1029#1056#176#1057#1039' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 260.787570000000000000
          Top = 257.008040000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[NAMEGLBUH]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 260.787570000000000000
          Top = 275.905690000000000000
          Width = 162.519790000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 71.811070000000000000
          Top = 306.141930000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1114'.'#1056#1119'.')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 196.535560000000000000
          Top = 306.141930000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            ' "       "___________________201_'#1056#1110'. ')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 147.401670000000000000
          Top = 336.378170000000000000
          Width = 132.283550000000000000
          Height = 41.574830000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1056#8250#1056#1106#1056#1118#1056#8226#1056#8211#1056#1116#1056#1106#1056#1031' '#1056#8217#1056#8226#1056#8221#1056#1115#1056#1114#1056#1115#1056#1038#1056#1118#1056#172)
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 283.464750000000000000
          Top = 340.157700000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#1109#1056#1112#1056#181#1057#1026' '#1056#1169#1056#1109#1056#1108#1057#1107#1056#1112#1056#181#1056#1029#1057#8218#1056#176)
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 377.953000000000000000
          Top = 340.157700000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1057#1027#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#187#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 283.464750000000000000
          Top = 359.055350000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 377.953000000000000000
          Top = 359.055350000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 498.897960000000000000
          Top = 343.937230000000000000
          Width = 75.590551180000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038)
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Left = 574.488560000000000000
          Top = 343.937230000000000000
          Width = 75.590551180000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109)
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 498.897960000000000000
          Top = 359.055350000000000000
          Width = 151.181200000000000000
          Height = 18.897640240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Left = 498.897960000000000000
          Top = 328.819110000000000000
          Width = 151.181200000000000000
          Height = 15.118110240000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#160#1056#176#1057#1027#1057#8225#1056#181#1057#8218#1056#1029#1057#8249#1056#8470' '#1056#1111#1056#181#1057#1026#1056#1105#1056#1109#1056#1169)
          ParentFont = False
        end
        object Memo94: TfrxMemoView
          Left = 498.897960000000000000
          Top = 359.055350000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[DateFrS]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo95: TfrxMemoView
          Left = 574.488560000000000000
          Top = 359.055350000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[DateToS]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 75.590551180000000000
        Top = 419.527830000000000000
        Width = 718.110700000000000000
        object Memo66: TfrxMemoView
          Width = 52.913420000000000000
          Height = 56.692901180000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#1109#1056#1112#1056#181#1057#1026' '#1056#1111#1056#1109
            #1056#1111#1056#1109#1057#1026#1057#1039#1056#1169#1056#1108#1057#1107)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Left = 52.913420000000000000
          Width = 60.472480000000000000
          Height = 56.692901180000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1118#1056#176#1056#177#1056#181#1056#187#1057#1034#1056#1029#1057#8249#1056#8470
            #1056#1029#1056#1109#1056#1112#1056#181#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 113.385900000000000000
          Width = 389.291590000000000000
          Height = 56.692901180000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#176#1056#1112#1056#1105#1056#187#1056#1105#1057#1039', '#1056#1105#1056#1029#1056#1105#1057#8224#1056#1105#1056#176#1056#187#1057#8249)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 502.677490000000000000
          Width = 75.590600000000000000
          Height = 56.692901180000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176', '
            #1057#1026#1056#1109#1057#1027'. '#1057#1026#1057#1107#1056#177'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Left = 578.268090000000000000
          Width = 86.929190000000000000
          Height = 56.692901180000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#1119#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034' '#1056#1030' '#1056#1111#1056#1109#1056#187#1057#1107#1057#8225#1056#181#1056#1029#1056#1105#1056#1105' '#1056#1169#1056#181#1056#1029#1056#181#1056#1110' ('#1056#183#1056#176#1056#1111#1056#1105#1057#1027#1057#1034' '#1056#1109 +
              ' '#1056#1169#1056#181#1056#1111#1056#1109#1056#1029#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#1105')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo85: TfrxMemoView
          Left = 665.197280000000000000
          Width = 52.913395590000000000
          Height = 56.692950000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176
            #1056#1111#1056#1109#1056#187#1057#1107#1057#8225#1056#181#1056#1029#1056#1105#1057#1039)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo84: TfrxMemoView
          Top = 56.692950000000000000
          Width = 52.913420000000000000
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
            '1')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo87: TfrxMemoView
          Left = 52.913420000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
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
            '2')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo88: TfrxMemoView
          Left = 113.385900000000000000
          Top = 56.692950000000000000
          Width = 389.291590000000000000
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
            '3')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo89: TfrxMemoView
          Left = 502.677490000000000000
          Top = 56.692950000000000000
          Width = 75.590600000000000000
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
            '4')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo90: TfrxMemoView
          Left = 578.268090000000000000
          Top = 56.692950000000000000
          Width = 86.929190000000000000
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
            '5')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo93: TfrxMemoView
          Left = 665.197280000000000000
          Top = 56.692950000000000000
          Width = 52.913395590000000000
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
            '6')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 37.795275590000000000
        Top = 555.590910000000000000
        Width = 718.110700000000000000
        OnAfterPrint = 'MasterData1OnAfterPrint'
        DataSet = frxDBDatasetMem
        DataSetName = 'frxDBDatasetMem'
        RowCount = 0
        object Memo73: TfrxMemoView
          Width = 52.913420000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
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
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 52.913420000000000000
          Width = 60.472480000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDatasetMem."TABNO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 113.385900000000000000
          Width = 389.291590000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDatasetMem."FIO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo76: TfrxMemoView
          Left = 502.677490000000000000
          Width = 75.590600000000000000
          Height = 37.795275590000000000
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
            '[frxDBDatasetMem."SUMMA_RUB"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          Left = 578.268090000000000000
          Width = 86.929190000000000000
          Height = 37.795275590000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo86: TfrxMemoView
          Left = 665.197280000000000000
          Width = 52.913395590000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677165354330700000
        Top = 978.898270000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'PageFooter1OnBeforePrint'
        PrintOnLastPage = False
        object Memo80: TfrxMemoView
          Width = 502.677490000000000000
          Height = 22.677165350000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1057#1027#1057#8218#1057#1026#1056#176#1056#1029#1056#1105#1057#8224#1056#181)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo81: TfrxMemoView
          Left = 502.677490000000000000
          Width = 75.590600000000000000
          Height = 22.677165350000000000
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
            '[SUM(<frxDBDatasetMem."SUMMA_RUB">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo98: TfrxMemoView
          Left = 578.268090000000000000
          Width = 139.842610000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Height = 302.362204720000000000
        ParentFont = False
        Top = 653.858690000000000000
        Width = 718.110700000000000000
        OnAfterCalcHeight = 'ReportSummary1OnAfterCalcHeight'
        OnBeforePrint = 'ReportSummary1OnBeforePrint'
        AllowSplit = True
        object Memo164: TfrxMemoView
          Width = 502.677490000000000000
          Height = 22.677165350000000000
          OnAfterPrint = 'Memo164OnAfterPrint'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1056#1111#1056#187#1056#176#1057#8218#1056#181#1056#182#1056#1029#1056#1109#1056#8470' '#1056#1030#1056#181#1056#1169#1056#1109#1056#1112#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo165: TfrxMemoView
          Left = 502.677490000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
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
            '[SUM(<frxDBDatasetMem."SUMMA_RUB">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo168: TfrxMemoView
          Left = 578.268090000000000000
          Width = 139.842610000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo169: TfrxMemoView
          Left = 449.764070000000000000
          Top = 30.236240000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#187#1056#1105#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109' '#1056#187#1056#1105#1057#1027#1057#8218#1056#1109#1056#1030)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo170: TfrxMemoView
          Left = 578.268090000000000000
          Top = 30.236240000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[TotalPages]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo171: TfrxMemoView
          Top = 45.354360000000000000
          Width = 238.110390000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#1109' '#1056#1029#1056#176#1057#1027#1057#8218#1056#1109#1057#1039#1057#8240#1056#181#1056#8470' '#1056#1111#1056#187#1056#176#1057#8218#1056#181#1056#182#1056#1029#1056#1109#1056#8470' '#1056#1030#1056#181#1056#1169#1056#1109#1056#1112#1056#1109#1057#1027#1057#8218#1056#1105)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo172: TfrxMemoView
          Top = 71.811070000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1030#1057#8249#1056#1111#1056#187#1056#176#1057#8225#1056#181#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo173: TfrxMemoView
          Left = 117.165430000000000000
          Top = 71.811070000000000000
          Width = 461.102660000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo174: TfrxMemoView
          Left = 117.165430000000000000
          Top = 86.929190000000000000
          Width = 461.102660000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1057#1026#1056#1109#1056#1111#1056#1105#1057#1027#1057#1034#1057#1035')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo175: TfrxMemoView
          Top = 105.826840000000000000
          Width = 268.346471340000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo176: TfrxMemoView
          Left = 268.346456690000000000
          Top = 105.826840000000000000
          Width = 52.913385830000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1026#1056#1109#1057#1027'. '#1057#1026#1057#1107#1056#177'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo177: TfrxMemoView
          Left = 321.260050000000000000
          Top = 105.826840000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo178: TfrxMemoView
          Left = 377.953000000000000000
          Top = 105.826840000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1111'.  (')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo179: TfrxMemoView
          Left = 419.527830000000000000
          Top = 105.826840000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo180: TfrxMemoView
          Left = 491.338900000000000000
          Top = 105.826840000000000000
          Width = 52.913385830000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1026#1056#1109#1057#1027'. '#1057#1026#1057#1107#1056#177'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo181: TfrxMemoView
          Left = 544.252320000000000000
          Top = 105.826840000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo182: TfrxMemoView
          Left = 578.268090000000000000
          Top = 105.826840000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1111'.)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo183: TfrxMemoView
          Left = 415.748300000000000000
          Top = 120.944960000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#8224#1056#1105#1057#8222#1057#1026#1056#176#1056#1112#1056#1105')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo184: TfrxMemoView
          Top = 139.842610000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1105' '#1056#1169#1056#181#1056#1111#1056#1109#1056#1029#1056#1105#1057#1026#1056#1109#1056#1030#1056#176#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#1112#1056#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo185: TfrxMemoView
          Left = 151.181200000000000000
          Top = 139.842610000000000000
          Width = 427.086890000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo186: TfrxMemoView
          Left = 151.181200000000000000
          Top = 154.960730000000000000
          Width = 427.086890000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1111#1057#1026#1056#1109#1056#1111#1056#1105#1057#1027#1057#1034#1057#1035')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo187: TfrxMemoView
          Top = 173.858380000000000000
          Width = 268.346630000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo188: TfrxMemoView
          Left = 264.567100000000000000
          Top = 173.858380000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1026#1056#1109#1057#1027'. '#1057#1026#1057#1107#1056#177'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo189: TfrxMemoView
          Left = 321.260050000000000000
          Top = 173.858380000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo190: TfrxMemoView
          Left = 377.953000000000000000
          Top = 173.858380000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1111'.  (')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo191: TfrxMemoView
          Left = 419.527830000000000000
          Top = 173.858380000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo192: TfrxMemoView
          Left = 491.338900000000000000
          Top = 173.858380000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1026#1056#1109#1057#1027'. '#1057#1026#1057#1107#1056#177'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo193: TfrxMemoView
          Left = 544.252320000000000000
          Top = 173.858380000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo194: TfrxMemoView
          Left = 578.268090000000000000
          Top = 173.858380000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1108#1056#1109#1056#1111'.)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo195: TfrxMemoView
          Left = 415.748300000000000000
          Top = 188.976500000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#8224#1056#1105#1057#8222#1057#1026#1056#176#1056#1112#1056#1105')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo218: TfrxMemoView
          Top = 211.653680000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8217#1057#8249#1056#1111#1056#187#1056#176#1057#8218#1057#1107' '#1056#1111#1057#1026#1056#1109#1056#1105#1056#183#1056#1030#1056#181#1056#187)
          ParentFont = False
        end
        object Memo219: TfrxMemoView
          Left = 113.385900000000000000
          Top = 211.653680000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo220: TfrxMemoView
          Left = 253.228510000000000000
          Top = 211.653680000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo221: TfrxMemoView
          Left = 366.614410000000000000
          Top = 211.653680000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo222: TfrxMemoView
          Left = 113.385900000000000000
          Top = 230.551330000000000000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#1169#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034')')
          ParentFont = False
        end
        object Memo223: TfrxMemoView
          Left = 253.228510000000000000
          Top = 230.551330000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#187#1056#1105#1057#8225#1056#1029#1056#176#1057#1039' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo224: TfrxMemoView
          Left = 366.614410000000000000
          Top = 230.551330000000000000
          Width = 162.519790000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
        object Memo225: TfrxMemoView
          Top = 245.669450000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#160#1056#176#1057#1027#1057#8230#1056#1109#1056#1169#1056#1029#1057#8249#1056#8470' '#1056#1108#1056#176#1057#1027#1057#1027#1056#1109#1056#1030#1057#8249#1056#8470' '#1056#1109#1057#1026#1056#1169#1056#181#1057#1026' '#1074#8222#8211)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo226: TfrxMemoView
          Left = 158.740260000000000000
          Top = 245.669450000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo227: TfrxMemoView
          Left = 249.448980000000000000
          Top = 245.669450000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1109#1057#8218' "___"___________________201__'#1056#1110'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo228: TfrxMemoView
          Top = 264.567100000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#1109#1056#1030#1056#181#1057#1026#1056#1105#1056#187' '#1056#177#1057#1107#1057#8230#1056#1110#1056#176#1056#187#1057#8218#1056#181#1057#1026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo229: TfrxMemoView
          Left = 113.385900000000000000
          Top = 264.567100000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo230: TfrxMemoView
          Left = 226.771800000000000000
          Top = 264.567100000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo231: TfrxMemoView
          Left = 113.385900000000000000
          Top = 283.464750000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1056#187#1056#1105#1057#8225#1056#1029#1056#176#1057#1039' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1057#1034')')
          ParentFont = False
        end
        object Memo232: TfrxMemoView
          Left = 226.771800000000000000
          Top = 283.464750000000000000
          Width = 162.519790000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '('#1057#1026#1056#176#1057#1027#1057#8364#1056#1105#1057#8222#1057#1026#1056#1109#1056#1030#1056#1108#1056#176' '#1056#1111#1056#1109#1056#1169#1056#1111#1056#1105#1057#1027#1056#1105')')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDatasetMem: TfrxDBDataset
    UserName = 'frxDBDatasetMem'
    CloseDataSource = False
    FieldAliases.Strings = (
      'NPP=NPP'
      'TABNO=TABNO'
      'FIO=FIO'
      'SUMMA=SUMMA'
      'SUMMA_RUB=SUMMA_RUB'
      'IDCODE=IDCODE'
      'BANKCOUNT=BANKCOUNT')
    DataSet = cdsRub
    Left = 136
    Top = 216
  end
  object frxReportDot: TfrxReport
    Version = '4.3'
    DotMatrixReport = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42292.382502824100000000
    ReportOptions.LastChange = 42744.006693611110000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReportDotGetValue
    Left = 224
    Top = 216
    Datasets = <
      item
        DataSet = frxDBDatasetMem
        DataSetName = 'frxDBDatasetMem'
      end>
    Variables = <
      item
        Name = ' Parameters'
        Value = Null
      end
      item
        Name = 'Hat'
        Value = ''
      end
      item
        Name = 'dolgRektor'
        Value = ''
      end
      item
        Name = 'fioRektor'
        Value = ''
      end
      item
        Name = 'dolgGlBuh'
        Value = ''
      end
      item
        Name = 'fioGlBuh'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxDMPPage
      PaperWidth = 210.819863845504600000
      PaperHeight = 296.862308276425900000
      PaperSize = 9
      LeftMargin = 7.620000000000000000
      RightMargin = 7.620000000000000000
      TopMargin = 22.489583333333300000
      BottomMargin = 22.489583333333300000
      FontStyle = []
      object ReportTitle1: TfrxReportTitle
        Height = 68.000000000000000000
        Top = 17.000000000000000000
        Width = 739.199962800000000000
        object DMPMemo1: TfrxDMPMemoView
          Width = 729.600000000000000000
          Height = 51.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            
              #1056#8220#1056#1109#1057#1027#1057#1107#1056#1169#1056#176#1057#1026#1057#1027#1057#8218#1056#1030#1056#181#1056#1029#1056#1029#1056#1109#1056#181' '#1056#1109#1056#177#1057#1026#1056#176#1056#183#1056#1109#1056#1030#1056#176#1057#8218#1056#181#1056#187#1057#1034#1056#1029#1056#1109#1056#181' '#1057#1107 +
              #1057#8225#1057#1026#1056#181#1056#182#1056#1169#1056#181#1056#1029#1056#1105#1056#181' '#1056#1030#1057#8249#1057#1027#1057#8364#1056#181#1056#1110#1056#1109' '#1056#1111#1057#1026#1056#1109#1057#8222#1056#181#1057#1027#1057#1027#1056#1105#1056#1109#1056#1029#1056#176#1056#187#1057#1034#1056#1029#1056#1109 +
              #1056#1110#1056#1109' '#1056#1109#1056#177#1057#1026#1056#176#1056#183#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1057#1039' '#1056#8250#1056#1116#1056#160' "'#1056#8250#1057#1107#1056#1110#1056#176#1056#1029#1057#1027#1056#1108#1056#1105#1056#8470' '#1056#1029#1056#176#1057#8224#1056#1105#1056 +
              #1109#1056#1029#1056#176#1056#187#1057#1034#1056#1029#1057#8249#1056#8470' '#1057#1107#1056#1029#1056#1105#1056#1030#1056#181#1057#1026#1057#1027#1056#1105#1057#8218#1056#181#1057#8218' '#1056#1105#1056#1112#1056#181#1056#1029#1056#1105' '#1056#8217#1056#187#1056#176#1056#1169#1056#1105#1056#1112#1056#1105 +
              #1057#1026#1056#176' '#1056#8221#1056#176#1056#187#1057#1039'"'
            #1056#1113#1056#1109#1056#1169' '#1056#1111#1056#1109' '#1056#8226#1056#8220#1056#160#1056#174#1056#8250' 61113706')
        end
        object DMPMemo21: TfrxDMPMemoView
          Top = 51.000000000000000000
          Width = 729.600000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            '[Hat]')
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 17.000000000000000000
        Top = 187.000000000000000000
        Width = 739.199962800000000000
        DataSet = frxDBDatasetMem
        DataSetName = 'frxDBDatasetMem'
        RowCount = 0
        Stretched = True
        object DMPMemo3: TfrxDMPMemoView
          Width = 48.000000000000000000
          Height = 17.000000000000000000
          StretchMode = smActualHeight
          DisplayFormat.DecimalSeparator = ','
          HAlign = haRight
          Memo.UTF8 = (
            '[Line]')
          VAlign = vaCenter
        end
        object DMPMemo2: TfrxDMPMemoView
          ShiftMode = smWhenOverlapped
          Left = 57.600000000000000000
          Width = 326.400000000000000000
          Height = 17.000000000000000000
          StretchMode = smActualHeight
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            '[frxDBDatasetMem."FIO"]')
          VAlign = vaCenter
        end
        object DMPMemo4: TfrxDMPMemoView
          Left = 633.600000000000000000
          Width = 105.600000000000000000
          Height = 17.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDatasetMem."SUMMA_RUB"]')
          VAlign = vaCenter
        end
        object DMPMemo5: TfrxDMPMemoView
          Left = 384.000000000000000000
          Width = 105.600000000000000000
          Height = 17.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            '[frxDBDatasetMem."IDCODE"]')
          VAlign = vaCenter
        end
        object DMPMemo6: TfrxDMPMemoView
          Left = 489.600000000000000000
          Width = 144.000000000000000000
          Height = 17.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            '[frxDBDatasetMem."BANKCOUNT"]')
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 51.000000000000000000
        Top = 102.000000000000000000
        Width = 739.199962800000000000
        object DMPMemo7: TfrxDMPMemoView
          Top = 17.000000000000000000
          Width = 48.000000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#1111'.'#1056#1111)
        end
        object DMPMemo8: TfrxDMPMemoView
          Left = 57.600000000000000000
          Top = 17.000000000000000000
          Width = 326.400000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#176#1056#1112#1056#1105#1056#187#1056#1105#1057#1039' '#1056#1105#1056#1112#1057#1039' '#1056#1109#1057#8218#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109)
        end
        object DMPMemo9: TfrxDMPMemoView
          Left = 384.000000000000000000
          Top = 17.000000000000000000
          Width = 105.600000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1056#1169'.'#1056#1108#1056#1109#1056#1169)
          VAlign = vaCenter
        end
        object DMPMemo10: TfrxDMPMemoView
          Left = 489.600000000000000000
          Top = 17.000000000000000000
          Width = 144.000000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#8225#1056#181#1057#8218)
          VAlign = vaCenter
        end
        object DMPMemo11: TfrxDMPMemoView
          Left = 633.600000000000000000
          Top = 17.000000000000000000
          Width = 105.600000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
          VAlign = vaCenter
        end
        object DMPMemo19: TfrxDMPMemoView
          Top = 34.000000000000000000
          Width = 739.200000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            
              '----------------------------------------------------------------' +
              '-------------')
        end
        object DMPMemo20: TfrxDMPMemoView
          Width = 739.200000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            
              '----------------------------------------------------------------' +
              '-------------')
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 17.000000000000000000
        Top = 391.000000000000000000
        Width = 739.199962800000000000
        object DMPMemo12: TfrxDMPMemoView
          Left = 48.000000000000000000
          Width = 585.600000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1057#1027#1057#8218#1057#1026#1056#176#1056#1029#1056#1105#1057#8224#1056#181)
          VAlign = vaCenter
        end
        object DMPMemo13: TfrxDMPMemoView
          Left = 633.600000000000000000
          Width = 105.600000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDatasetMem."SUMMA_RUB">,MasterData1)]')
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 136.000000000000000000
        Top = 238.000000000000000000
        Width = 739.199962800000000000
        object DMPMemo14: TfrxDMPMemoView
          Left = 48.000000000000000000
          Top = 17.000000000000000000
          Width = 585.600000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#1109' '#1056#1111#1056#187#1056#176#1057#8218#1056#181#1056#182#1056#1029#1056#1109#1056#8470' '#1056#1030#1056#181#1056#1169#1056#1109#1056#1112#1056#1109#1057#1027#1057#8218#1056#1105)
          VAlign = vaCenter
        end
        object DMPMemo15: TfrxDMPMemoView
          Left = 633.600000000000000000
          Top = 17.000000000000000000
          Width = 105.600000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDatasetMem."SUMMA_RUB">,MasterData1)]')
          VAlign = vaCenter
        end
        object DMPMemo16: TfrxDMPMemoView
          Left = 48.000000000000000000
          Top = 51.000000000000000000
          Width = 278.400000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            '[dolgRektor]')
          VAlign = vaCenter
        end
        object DMPMemo18: TfrxDMPMemoView
          Width = 739.200000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            
              '----------------------------------------------------------------' +
              '-------------')
        end
        object DMPMemo22: TfrxDMPMemoView
          Left = 547.200000000000000000
          Top = 51.000000000000000000
          Width = 182.400000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            '[fioRektor]')
          VAlign = vaCenter
        end
        object DMPMemo23: TfrxDMPMemoView
          Left = 547.200000000000000000
          Top = 85.000000000000000000
          Width = 182.400000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            '[fioGlBuh]')
          VAlign = vaCenter
        end
        object DMPMemo17: TfrxDMPMemoView
          Left = 48.000000000000000000
          Top = 85.000000000000000000
          Width = 278.400000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            '[dolgGlBuh]')
        end
      end
    end
  end
end
