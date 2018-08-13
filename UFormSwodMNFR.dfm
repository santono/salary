object FormSwodMNFR: TFormSwodMNFR
  Left = 210
  Top = 122
  Width = 678
  Height = 103
  Caption = #1057#1074#1086#1076' '#1087#1086' '#1079#1072#1088#1087#1083#1072#1090#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object frxReport1: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40359.888440208300000000
    ReportOptions.LastChange = 42920.478273703700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnManualBuild = frxReport1ManualBuild
    OnClosePreview = frxReport1ClosePreview
    Left = 8
    Top = 8
    Datasets = <>
    Variables = <
      item
        Name = ' Header'
        Value = Null
      end
      item
        Name = 'NameData'
        Value = Null
      end
      item
        Name = 'H1'
        Value = Null
      end
      item
        Name = 'H2'
        Value = Null
      end
      item
        Name = 'H3'
        Value = Null
      end
      item
        Name = 'nameUni'
        Value = ''
      end
      item
        Name = 'nameTitle'
        Value = ''
      end
      item
        Name = 'nameHatAdd'
        Value = ''
      end
      item
        Name = 'nameHatUd'
        Value = ''
      end
      item
        Name = 'nameHatAdd1'
        Value = ''
      end
      item
        Name = 'nameHatUd1'
        Value = ''
      end
      item
        Name = 'nameHatSumma'
        Value = ''
      end
      item
        Name = 'nameHatRub'
        Value = ''
      end
      item
        Name = 'nameHatPeriod'
        Value = ''
      end
      item
        Name = 'nameHatIzNih'
        Value = ''
      end
      item
        Name = ' Body'
        Value = Null
      end
      item
        Name = 'ShifrAdd'
        Value = Null
      end
      item
        Name = 'NameAdd'
        Value = Null
      end
      item
        Name = 'PeriodAdd'
        Value = Null
      end
      item
        Name = 'SummaAdd'
        Value = Null
      end
      item
        Name = 'SummaFZP'
        Value = Null
      end
      item
        Name = 'SummaFMP'
        Value = Null
      end
      item
        Name = 'SummaOTH'
        Value = Null
      end
      item
        Name = 'ShifrUd'
        Value = Null
      end
      item
        Name = 'NameUd'
        Value = Null
      end
      item
        Name = 'PeriodUd'
        Value = Null
      end
      item
        Name = 'SummaUd'
        Value = Null
      end
      item
        Name = ' Footer'
        Value = Null
      end
      item
        Name = 'SummaKVyd'
        Value = Null
      end
      item
        Name = 'SummaDolgOst'
        Value = Null
      end
      item
        Name = 'SummaDolgZaRab'
        Value = Null
      end
      item
        Name = 'nameFootAdd'
        Value = ''
      end
      item
        Name = 'nameFootUd'
        Value = ''
      end
      item
        Name = 'nameFootVyd'
        Value = ''
      end
      item
        Name = 'nameFootBorgZal'
        Value = ''
      end
      item
        Name = 'nameFootBorg'
        Value = ''
      end
      item
        Name = ' FooterSvdn'
        Value = Null
      end
      item
        Name = 's_summa'
        Value = Null
      end
      item
        Name = 's_summa_mp_31'
        Value = Null
      end
      item
        Name = 's_summa_mp_ne_31'
        Value = Null
      end
      item
        Name = 's_summa_vyh_pos_23'
        Value = Null
      end
      item
        Name = 's_summa_pogr_165'
        Value = Null
      end
      item
        Name = 's_summa_invalidy'
        Value = Null
      end
      item
        Name = 's_summa_gt_max_sal'
        Value = Null
      end
      item
        Name = 's_summa_lt_min_sal'
        Value = Null
      end
      item
        Name = 'footerStr'
        Value = Null
      end
      item
        Name = 's_summa_kompens_1'
        Value = Null
      end
      item
        Name = ' New Category1'
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
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 188.976426770000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        RowCount = 0
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Width = 861.732840000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            '[<nameUni>]')
        end
        object Memo2: TfrxMemoView
          Left = 90.708720000000000000
          Top = 20.787406460000000000
          Width = 476.220780000000000000
          Height = 34.015770000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8 = (
            '[nameTitle] [NameData]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Top = 45.354360000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8 = (
            '[H1]')
        end
        object Memo4: TfrxMemoView
          Top = 68.031540000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8 = (
            '[H2]')
        end
        object Memo16: TfrxMemoView
          Left = 117.165430000000000000
          Top = 113.385826770000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[nameHatAdd]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 763.465060000000000000
          Top = 113.385826770000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[nameHatUd]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 86.929170470000000000
          Top = 139.842519690000000000
          Width = 109.606370000000000000
          Height = 49.133890000000000000
          DisplayFormat.DecimalSeparator = ','
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1056#1105#1056#1169
            '[nameHatAdd1]')
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 7.559060000000000000
          Top = 136.062992125984000000
          Width = 26.456710000000000000
          Height = 49.133890000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1025#1056#1105#1057#8222#1057#1026)
          Rotation = 90
        end
        object Memo20: TfrxMemoView
          Left = 279.685124800000000000
          Top = 136.062992130000000000
          Width = 18.897637800000000000
          Height = 49.133890000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            '[nameHatPeriod]')
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 306.141822600000000000
          Top = 136.062992130000000000
          Width = 75.590551180000000000
          Height = 49.133890000000000000
          DisplayFormat.DecimalSeparator = ','
          HAlign = haCenter
          Memo.UTF8 = (
            '[nameHatSumma]'
            '[nameHatRub]')
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 468.661563780000000000
          Top = 132.283464570000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          HAlign = haCenter
          Memo.UTF8 = (
            '[nameHatIzNih]')
        end
        object Memo23: TfrxMemoView
          Left = 396.850493780000000000
          Top = 151.181102362205000000
          Width = 75.590600000000000000
          Height = 34.015770000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#8212#1056#1119' '#1056#1113#1056#8226#1056#1113'B 1111')
        end
        object Memo24: TfrxMemoView
          Left = 498.897754960000000000
          Top = 151.181102362205000000
          Width = 75.590551180000000000
          Height = 34.015770000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#164#1056#1114#1056#1119' '#1056#1113#1056#8226#1056#1113'B 1113')
        end
        object Memo25: TfrxMemoView
          Left = 585.826896140000000000
          Top = 151.181102362205000000
          Width = 75.590551180000000000
          Height = 34.015770000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '652 '#1056#187'.'#1056#187'. '#1056#1113#1056#8226#1056#1113#1056#8217' 1120')
        end
        object Memo26: TfrxMemoView
          Left = 676.535870000000000000
          Top = 136.062992125984000000
          Width = 26.456710000000000000
          Height = 49.133890000000000000
          Memo.UTF8 = (
            #1056#1025#1056#1105#1057#8222#1057#1026)
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 767.244590000000000000
          Top = 139.842519690000000000
          Width = 109.606370000000000000
          Height = 49.133890000000000000
          DisplayFormat.DecimalSeparator = ','
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1056#1105#1056#1169
            '[nameHatUd1]')
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 907.086797240000000000
          Top = 136.062992130000000000
          Width = 18.897637800000000000
          Height = 49.133890000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            '[nameHatPeriod]')
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 944.881889760000000000
          Top = 136.062992130000000000
          Width = 75.590551180000000000
          Height = 49.133890000000000000
          DisplayFormat.DecimalSeparator = ','
          HAlign = haCenter
          Memo.UTF8 = (
            '[nameHatSumma]'
            '[nameHatRub]')
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Left = 3.779530000000000000
          Top = 113.385826771654000000
          Width = 1016.693570000000000000
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          Left = 3.779530000000000000
          Top = 136.062992125984000000
          Width = 1016.693570000000000000
          Frame.Typ = [ftTop]
        end
        object Line4: TfrxLineView
          Left = 676.535433070000000000
          Top = 113.385826771654000000
          Height = 75.590600000000000000
          Frame.Typ = [ftLeft]
        end
        object Line5: TfrxLineView
          Left = 925.984850000000000000
          Top = 136.062992125984000000
          Height = 52.913420000000000000
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          Left = 298.582870000000000000
          Top = 139.842519685039000000
          Height = 49.133890000000000000
          Frame.Typ = [ftLeft]
        end
        object Line7: TfrxLineView
          Left = 393.071120000000000000
          Top = 136.062992125984000000
          Height = 52.913420000000000000
          Frame.Typ = [ftLeft]
        end
        object Line8: TfrxLineView
          Left = 393.071120000000000000
          Top = 151.181102362205000000
          Width = 283.464750000000000000
          Frame.Typ = [ftTop]
        end
        object Line9: TfrxLineView
          Left = 487.559370000000000000
          Top = 151.181102362205000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft]
        end
        object Line10: TfrxLineView
          Left = 582.047620000000000000
          Top = 151.181102362205000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft]
        end
        object Line11: TfrxLineView
          Left = 702.992177240000000000
          Top = 136.062992125984000000
          Height = 52.913420000000000000
          Frame.Typ = [ftLeft]
        end
        object Line13: TfrxLineView
          Left = 30.236240000000000000
          Top = 136.062992125984000000
          Height = 52.913420000000000000
          Frame.Typ = [ftLeft]
        end
        object Line14: TfrxLineView
          Left = 279.685220000000000000
          Top = 136.062992125984000000
          Height = 52.913420000000000000
          Frame.Typ = [ftLeft]
        end
        object Line23: TfrxLineView
          Left = 1020.473100000000000000
          Top = 113.385826771654000000
          Height = 75.590600000000000000
          Frame.Typ = [ftLeft]
        end
        object Line24: TfrxLineView
          Left = 907.087200000000000000
          Top = 136.062992125984000000
          Height = 52.913420000000000000
          Frame.Typ = [ftLeft]
        end
        object Line26: TfrxLineView
          Left = 3.779527560000000000
          Top = 113.385826771654000000
          Height = 75.590600000000000000
          Frame.Typ = [ftLeft]
        end
        object SysMemo1: TfrxSysMemoView
          Left = 880.630490000000000000
          Top = 3.779530000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8 = (
            '[PAGE#] of [TOTALPAGES#]')
        end
        object Line1: TfrxLineView
          Left = 3.779527560000000000
          Top = 188.976377952756000000
          Width = 1016.693570000000000000
          Frame.Typ = [ftTop]
        end
        object Memo43: TfrxMemoView
          Top = 90.708720000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8 = (
            '[H3]')
        end
      end
      object MasterData2: TfrxMasterData
        Height = 18.897650000000000000
        Top = 230.551330000000000000
        Width = 1046.929810000000000000
        RowCount = 0
        object Memo5: TfrxMemoView
          Left = 3.779530000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[ShifrAdd]')
        end
        object Memo6: TfrxMemoView
          Left = 30.236240000000000000
          Width = 249.448818900000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftBottom]
          Memo.UTF8 = (
            '[NameAdd]')
        end
        object Memo7: TfrxMemoView
          Left = 279.685220000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[PeriodAdd]')
        end
        object Memo8: TfrxMemoView
          Left = 298.582870000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SummaAdd]')
        end
        object Memo9: TfrxMemoView
          Left = 393.071120000000000000
          Width = 94.488188976378000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SummaFZP]')
        end
        object Memo10: TfrxMemoView
          Left = 487.559370000000000000
          Width = 94.488188976378000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SummaFMP]')
        end
        object Memo11: TfrxMemoView
          Left = 582.047620000000000000
          Width = 94.488188976378000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SummaOTH]')
        end
        object Memo12: TfrxMemoView
          Left = 676.535870000000000000
          Width = 26.456692910000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[ShifrUd]')
        end
        object Memo13: TfrxMemoView
          Left = 702.992113780000000000
          Width = 204.094488190000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftBottom]
          Memo.UTF8 = (
            '[NameUd]')
        end
        object Memo14: TfrxMemoView
          Left = 925.984239760000000000
          Width = 94.488188976378000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SummaUd]')
        end
        object Memo15: TfrxMemoView
          Left = 907.087200000000000000
          Width = 18.897637800000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[PeriodUd]')
        end
      end
      object MasterData3: TfrxMasterData
        Height = 52.913385830000000000
        Top = 272.126160000000000000
        Width = 1046.929810000000000000
        RowCount = 0
        object Memo30: TfrxMemoView
          Left = 298.582762600000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SummaAdd]')
        end
        object Memo31: TfrxMemoView
          Left = 393.071120000000000000
          Width = 94.488188976378000000
          Height = 18.897650000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SummaFZP]')
        end
        object Memo32: TfrxMemoView
          Left = 487.559370000000000000
          Width = 94.488188976378000000
          Height = 18.897650000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SummaFMP]')
        end
        object Memo33: TfrxMemoView
          Left = 582.047219690000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SummaOTH]')
        end
        object Memo34: TfrxMemoView
          Left = 925.984239760000000000
          Width = 94.488188976378000000
          Height = 18.897650000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SummaUd]')
        end
        object Memo35: TfrxMemoView
          Left = 113.385900000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          HAlign = haRight
          Memo.UTF8 = (
            '[nameFootAdd]')
        end
        object Memo36: TfrxMemoView
          Left = 763.465060000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          HAlign = haRight
          Memo.UTF8 = (
            '[nameFootUd]')
        end
        object Memo37: TfrxMemoView
          Left = 298.582870000000000000
          Top = 26.456710000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SummaKVyd]')
        end
        object Memo38: TfrxMemoView
          Left = 109.606370000000000000
          Top = 26.456710000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          HAlign = haRight
          Memo.UTF8 = (
            '[nameFootVyd]')
        end
        object Memo39: TfrxMemoView
          Left = 582.047219690000000000
          Top = 26.456710000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SummaDolgOst]')
        end
        object Memo40: TfrxMemoView
          Left = 404.409710000000000000
          Top = 26.456710000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          HAlign = haRight
          Memo.UTF8 = (
            '[nameFootBorgZal]')
        end
        object Memo41: TfrxMemoView
          Left = 925.984239760000000000
          Top = 26.456692910000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SummaDolgZaRab]')
        end
        object Memo42: TfrxMemoView
          Left = 763.465060000000000000
          Top = 26.456710000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          HAlign = haRight
          Memo.UTF8 = (
            '[nameFootBorg]')
        end
        object Line15: TfrxLineView
          Left = 3.779530000000000000
          Top = 45.354360000000000000
          Width = 1016.693570000000000000
          Frame.Typ = [ftTop]
        end
        object Line16: TfrxLineView
          Left = 298.582870000000000000
          Height = 45.354360000000000000
          Frame.Typ = [ftLeft]
        end
        object Line17: TfrxLineView
          Left = 393.071120000000000000
          Height = 45.354360000000000000
          Frame.Typ = [ftLeft]
        end
        object Line18: TfrxLineView
          Left = 3.779530000000000000
          Top = 22.677165350000100000
          Width = 1016.693570000000000000
          Frame.Typ = [ftTop]
        end
        object Line19: TfrxLineView
          Left = 487.559370000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Line20: TfrxLineView
          Left = 582.047620000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Line21: TfrxLineView
          Left = 676.535870000000000000
          Height = 45.354360000000000000
          Frame.Typ = [ftLeft]
        end
        object Line22: TfrxLineView
          Left = 925.984435040000000000
          Height = 45.354360000000000000
          Frame.Typ = [ftLeft]
        end
        object Line12: TfrxLineView
          Left = 1020.473100000000000000
          Height = 45.354360000000000000
          Frame.Typ = [ftLeft]
        end
        object Line25: TfrxLineView
          Left = 3.779527559055120000
          Height = 45.354360000000000000
          Frame.Typ = [ftLeft]
        end
      end
      object MasterData4: TfrxMasterData
        Height = 234.330860000000000000
        Top = 347.716760000000000000
        Width = 1046.929810000000000000
        RowCount = 0
        object Memo44: TfrxMemoView
          Left = 109.606370000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1029#1056#176#1057#8225#1056#1105#1057#1027#1056#187#1056#181#1056#1029#1056#1109)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 302.362400000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[s_summa]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 109.606370000000000000
          Top = 22.677180000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1114#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1056#176' '#1056#1111#1056#1109#1056#1112#1056#1109#1057#8240#1057#1034' (31)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 302.362400000000000000
          Top = 22.677180000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[s_summa_mp_31]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 109.606370000000000000
          Top = 41.574830000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1114#1056#176#1057#8218#1056#181#1057#1026#1056#1105#1056#176#1056#187#1057#1034#1056#1029#1056#176' '#1056#1111#1056#1109#1056#1112#1056#1109#1057#8240#1057#1034' (141)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 109.606370000000000000
          Top = 60.472480000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8217#1057#8249#1057#8230#1056#1109#1056#1169#1056#1029#1056#1109#1056#181' '#1056#1111#1056#1109#1057#1027#1056#1109#1056#177#1056#1105#1056#181' (23)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 109.606370000000000000
          Top = 98.267716535433070000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1056#1109#1056#1112#1056#1109#1057#8240#1057#1034' '#1056#1029#1056#176' '#1056#1111#1056#1109#1056#1110#1057#1026#1056#181#1056#177#1056#181#1056#1029#1056#1105#1056#181' (165)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 109.606370000000000000
          Top = 117.165354330000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#152#1056#1029#1056#1030#1056#176#1056#187#1056#1105#1056#1169#1057#8249)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          Left = 109.606370000000000000
          Top = 136.062992130000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1119#1057#1026#1056#181#1056#1030#1057#8249#1057#8364#1056#181#1056#1029#1056#1105#1056#181' '#1056#1112#1056#176#1056#1108#1057#1027'. '#1056#183'.'#1056#1111'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 109.606370000000000000
          Top = 154.960629921259800000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#1111#1056#187#1056#176#1057#8218#1056#176' '#1056#1111#1056#1109' '#1056#1112#1056#1105#1056#1029#1056#1105#1056#1112#1056#176#1056#187#1057#1034#1056#1029#1056#1109#1056#8470'. '#1056#183'.'#1056#1111'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 109.606370000000000000
          Top = 173.858267720000000000
          Width = 914.646260000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[footerStr]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 302.362204720000000000
          Top = 41.574830000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[s_summa_mp_ne_31]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Left = 302.362204720000000000
          Top = 60.472480000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[s_summa_vyh_pos_23]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Left = 302.362400000000000000
          Top = 98.267716535433070000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[s_summa_pogr_165]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Left = 302.362204720000000000
          Top = 117.165354330708700000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[s_summa_invalidy]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 302.362204720000000000
          Top = 136.062992125984300000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[s_summa_gt_max_sal]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Left = 302.362204720000000000
          Top = 154.960730000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[s_summa_lt_min_sal]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 109.606370000000000000
          Top = 79.370066540000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1112#1056#1111#1056#181#1056#1029#1057#1027#1056#176#1057#8224#1056#1105#1057#1039' 1')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          Left = 302.362204724409400000
          Top = 79.370078740000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[s_summa_kompens_1]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
end
