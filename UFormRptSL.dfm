object FormRptSL: TFormRptSL
  Left = 192
  Top = 122
  Width = 671
  Height = 149
  Caption = #1057#1087#1080#1089#1086#1082' '#1089#1086#1094#1080#1072#1083#1100#1085#1099#1093' '#1083#1100#1075#1086#1090
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
  object frxReportSL: TfrxReport
    Version = '4.3'
    DataSet = frxUserDataSetSl
    DataSetName = 'frxUserDataSetSl'
    DotMatrixReport = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40564.625080138890000000
    ReportOptions.LastChange = 40564.817182071760000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReportSLGetValue
    Left = 120
    Top = 64
    Datasets = <
      item
        DataSet = frxUserDataSetSl
        DataSetName = 'frxUserDataSetSl'
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
      end>
    Style = <>
    object Page1: TfrxDMPPage
      PaperWidth = 210.819863845504600000
      PaperHeight = 296.862308276425900000
      PaperSize = 9
      LeftMargin = 2.539998359584393000
      RightMargin = 2.539998359584393000
      TopMargin = 4.497913761764029000
      BottomMargin = 4.497913761764029000
      FontStyle = []
      object MasterData1: TfrxMasterData
        Height = 34.000000000000000000
        Top = 17.000000000000000000
        Width = 777.600000000000000000
        RowCount = 1
        object DMPMemo1: TfrxDMPMemoView
          Left = 134.400000000000000000
          Width = 336.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            #1056#1038#1056#1111#1056#1105#1057#1027#1056#1109#1056#1108' '#1056#187#1057#1034#1056#1110#1056#1109#1057#8218#1056#1029#1056#1105#1056#1108#1056#1109#1056#1030' [month] [year] '#1056#1110'.')
        end
        object DMPMemo7: TfrxDMPMemoView
          Top = 17.000000000000000000
          Width = 662.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            
              ' '#1056#1116#1056#1112#1057#1026'  '#1056#1118'.'#1056#1029#1056#1109#1056#1112'   '#1056#164#1056#176#1056#1112#1056#1105#1056#187#1056#1105#1057#1039' '#1056#152#1056#1112#1057#1039' '#1056#1115#1057#8218#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109'     ' +
              '  '#1056#8221#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034'   '#1056#1119#1056#1169#1057#1026'      '#1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
        end
      end
      object DetailData1: TfrxDetailData
        Height = 17.000000000000000000
        Top = 68.000000000000000000
        Width = 777.600000000000000000
        DataSet = frxUserDataSetSl
        DataSetName = 'frxUserDataSetSl'
        RowCount = 0
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
            '[frxUserDataSetSl."tabno"]')
        end
        object DMPMemo4: TfrxDMPMemoView
          Left = 124.800000000000000000
          Width = 259.200000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[frxUserDataSetSl."fio"]')
        end
        object DMPMemo5: TfrxDMPMemoView
          Left = 489.600000000000000000
          Width = 57.600000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[frxUserDataSetSl."w_place"]')
        end
        object DMPMemo6: TfrxDMPMemoView
          Left = 556.800000000000000000
          Width = 105.600000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[frxUserDataSetSl."summa"]')
        end
        object DMPMemo8: TfrxDMPMemoView
          Left = 384.000000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[frxUserDataSetSl."dolg"]')
        end
      end
    end
  end
  object frxDotMatrixExportSL: TfrxDotMatrixExport
    UseFileCache = True
    ShowProgress = True
    EscModel = 0
    GraphicFrames = False
    SaveToFile = False
    UseIniSettings = True
    Left = 168
    Top = 64
  end
  object frxUserDataSetSl: TfrxUserDataSet
    UserName = 'frxUserDataSetSl'
    OnCheckEOF = frxUserDataSetSlCheckEOF
    OnFirst = frxUserDataSetSlFirst
    OnNext = frxUserDataSetSlNext
    Fields.Strings = (
      'tabno'
      'fio'
      'dolg'
      'w_place'
      'summa')
    OnGetValue = frxUserDataSetSlGetValue
    Left = 208
    Top = 64
  end
end
