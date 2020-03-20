object FormRptPremGM: TFormRptPremGM
  Left = 206
  Top = 255
  Width = 671
  Height = 212
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1086' '#1089#1090#1072#1090#1100#1077' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
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
  object Label1: TLabel
    Left = 104
    Top = 64
    Width = 188
    Height = 20
    Caption = #1064#1080#1092#1088' '#1089#1090#1072#1090#1100' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
    Enabled = False
    Visible = False
  end
  object Label2: TLabel
    Left = 397
    Top = 68
    Width = 59
    Height = 20
    Caption = #1055#1077#1088#1080#1086#1076
  end
  object Button1: TButton
    Left = 24
    Top = 64
    Width = 75
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object BitBtn1: TBitBtn
    Left = 536
    Top = 64
    Width = 89
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 16
    Width = 609
    Height = 17
    TabOrder = 2
  end
  object cxCalcEditSta: TcxCalcEdit
    Left = 296
    Top = 64
    EditValue = 0.000000000000000000
    Enabled = False
    TabOrder = 3
    Visible = False
    Width = 65
  end
  object cxCalcEditPe: TcxCalcEdit
    Left = 464
    Top = 64
    EditValue = 0.000000000000000000
    TabOrder = 4
    Width = 65
  end
  object BitBtn2: TBitBtn
    Left = 24
    Top = 112
    Width = 75
    Height = 25
    Caption = #1042' Excel'
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 120
    Top = 112
    Width = 425
    Height = 25
    Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103', '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1080' '#1089#1095#1077#1090#1072' '
    TabOrder = 6
    OnClick = BitBtn3Click
  end
  object frxReportAddL: TfrxReport
    Version = '4.3'
    DataSet = frxUserDataSetAddl
    DataSetName = 'frxUserDataSetAddl'
    DotMatrixReport = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40564.625080138890000000
    ReportOptions.LastChange = 43892.577949745370000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReportAddLGetValue
    Left = 120
    Top = 64
    Datasets = <
      item
        DataSet = frxUserDataSetAddl
        DataSetName = 'frxUserDataSetAddl'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'month'
        Value = ''
      end
      item
        Name = 'year'
        Value = ''
      end
      item
        Name = 'namesta'
        Value = ''
      end
      item
        Name = 'periodglo'
        Value = ''
      end
      item
        Name = 'summatot'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxDMPPage
      Orientation = poLandscape
      PaperWidth = 297.179808071374000000
      PaperHeight = 211.401946802909400000
      PaperSize = 9
      LeftMargin = 2.539998359584393000
      RightMargin = 2.539998359584393000
      TopMargin = 4.497913761764029000
      BottomMargin = 4.497913761764029000
      FontStyle = []
      object MasterData1: TfrxMasterData
        Height = 34.000000000000000000
        Top = 17.000000000000000000
        Width = 1104.000000000000000000
        RowCount = 1
        object DMPMemo1: TfrxDMPMemoView
          Left = 134.400000000000000000
          Width = 336.000000000000000000
          Height = 17.000000000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            '[namesta] '#1057#1107' [month] [year] '#1057#1026'. [periodglo]')
        end
        object DMPMemo7: TfrxDMPMemoView
          Top = 17.000000000000000000
          Width = 1104.000000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            
              ' '#1056#1116#1056#1112#1057#1026'  '#1056#1118'.'#1056#1029#1056#1109#1056#1112'   '#1056#1119#1057#1026'i'#1056#183#1056#1030#1056#1105#1057#8240#1056#181' I'#1056#1112#39#1057#1039' '#1056#1119#1056#1109#1056#177#1056#176#1057#8218#1057#1034#1056#1108#1056#1109#1056#1030'i ' +
              '                '#1056#1119#1056#1109#1057#1027#1056#176#1056#1169#1056#176'          '#1056#1119'i'#1056#1169#1057#1026#1056#1109#1056#183#1056#1169'i'#1056#187'          ' +
              '              '#1056#1038#1057#1107#1056#1112#1056#176)
        end
      end
      object DetailData1: TfrxDetailData
        Height = 17.000000000000000000
        Top = 68.000000000000000000
        Width = 1104.000000000000000000
        DataSet = frxUserDataSetAddl
        DataSetName = 'frxUserDataSetAddl'
        RowCount = 0
        Stretched = True
        object DMPMemo2: TfrxDMPMemoView
          Width = 48.000000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[Line#]')
        end
        object DMPMemo3: TfrxDMPMemoView
          Left = 57.600000000000000000
          Width = 57.600000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[frxUserDataSetAddl."tabno"]')
        end
        object DMPMemo4: TfrxDMPMemoView
          Left = 124.800000000000000000
          Width = 345.600000000000000000
          Height = 17.000000000000000000
          StretchMode = smMaxHeight
          Memo.UTF8 = (
            '[frxUserDataSetAddl."fio"]')
        end
        object DMPMemo5: TfrxDMPMemoView
          Left = 633.600000000000000000
          Width = 345.600000000000000000
          Height = 17.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            '[frxUserDataSetAddl."w_place"]')
          VAlign = vaBottom
        end
        object DMPMemo6: TfrxDMPMemoView
          Left = 979.200000000000000000
          Width = 105.600000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[frxUserDataSetAddl."summa"]')
        end
        object DMPMemo8: TfrxDMPMemoView
          Left = 470.400000000000000000
          Width = 163.200000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[frxUserDataSetAddl."dolg"]')
        end
      end
      object Footer1: TfrxFooter
        Height = 17.000000000000000000
        Top = 102.000000000000000000
        Width = 1104.000000000000000000
        object DMPMemo10: TfrxDMPMemoView
          Left = 979.200000000000000000
          Width = 105.600000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[summatot]')
        end
      end
    end
  end
  object frxDotMatrixExportAddL: TfrxDotMatrixExport
    UseFileCache = True
    ShowProgress = True
    EscModel = 0
    GraphicFrames = False
    SaveToFile = False
    UseIniSettings = True
    Left = 168
    Top = 64
  end
  object frxUserDataSetAddl: TfrxUserDataSet
    UserName = 'frxUserDataSetAddl'
    OnCheckEOF = frxUserDataSetAddlCheckEOF
    OnFirst = frxUserDataSetAddlFirst
    OnNext = frxUserDataSetAddlNext
    Fields.Strings = (
      'tabno'
      'fio'
      'dolg'
      'w_place'
      'summa'
      'shifrsta'
      'period')
    OnGetValue = frxUserDataSetAddlGetValue
    Left = 208
    Top = 64
  end
  object frxXLSExportAddL: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 240
    Top = 64
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    Left = 136
    Top = 32
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    ShowProgress = True
    FixedWidth = True
    Background = False
    Centered = False
    EmptyLines = True
    Left = 176
    Top = 40
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
    Left = 216
    Top = 40
  end
end
