object FormRptTstECB1: TFormRptTstECB1
  Left = 258
  Top = 177
  Width = 671
  Height = 352
  Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1088#1072#1089#1095#1077#1090#1072' '#1077#1076#1080#1085#1086#1075#1086' '#1089#1086#1094'.'#1085#1072#1083#1086#1075#1072
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
  object LabelPodr: TLabel
    Left = 24
    Top = 40
    Width = 72
    Height = 20
    Caption = 'LabelPodr'
  end
  object LabelFIO: TLabel
    Left = 384
    Top = 40
    Width = 61
    Height = 20
    Caption = 'LabelFio'
  end
  object Label1: TLabel
    Left = 24
    Top = 264
    Width = 119
    Height = 20
    Caption = #1055#1077#1088#1080#1086#1076' ('#1084#1077#1089#1103#1094')'
  end
  object Label2: TLabel
    Left = 208
    Top = 264
    Width = 253
    Height = 20
    Caption = #1076#1083#1103' '#1074#1089#1077#1093' '#1088#1077#1078#1080#1084#1086#1074' '#1082#1088#1086#1084#1077' '#1087#1077#1088#1074#1086#1075#1086
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
  object RadioGroupMode: TRadioGroup
    Left = 24
    Top = 104
    Width = 481
    Height = 145
    Caption = #1056#1077#1078#1080#1084
    Items.Strings = (
      #1041#1086#1083#1100#1085#1080#1095#1085#1099#1077' '#1080' '#1045#1057#1042
      #1041#1086#1083#1100#1085#1080#1095#1085#1099#1077' '#1080' '#1045#1057#1042' '#1079#1072' '#1091#1082#1072#1079#1072#1085#1085#1099#1081' '#1084#1077#1089#1103#1094
      #1054#1090#1087#1091#1089#1082#1085#1099#1077' '#1080' '#1045#1057#1042' '#1079#1072' '#1091#1082#1072#1079#1072#1085#1085#1099#1081' '#1084#1077#1089#1103#1094
      #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1080' '#1045#1057#1042' '#1076#1083#1103' '#1076#1088' '#1084#1077#1089#1103#1094' ('#1085#1077#1074#1077#1088#1085#1099#1081' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090')')
    TabOrder = 3
  end
  object WPeriod: TSpinEdit
    Left = 152
    Top = 256
    Width = 49
    Height = 30
    MaxValue = 12
    MinValue = 1
    TabOrder = 4
    Value = 1
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
    ReportOptions.LastChange = 40596.547290937500000000
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
          Width = 451.200000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            
              #1056#1038#1056#1111#1056#1105#1057#1027#1056#1109#1056#1108' '#1056#1109#1057#8364#1056#1105#1056#177#1056#1109#1056#1108' '#1056#8226#1056#1038#1056#8217' ('#1056#1109#1056#177#1056#176' '#1056#8226#1056#1038#1056#8217') [month] [year] ' +
              #1056#1110'.')
        end
        object DMPMemo7: TfrxDMPMemoView
          Top = 17.000000000000000000
          Width = 662.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            
              ' '#1056#1116#1056#1112#1057#1026'  '#1056#1118'.'#1056#1029#1056#1109#1056#1112'   '#1056#164#1056#176#1056#1112#1056#1105#1056#187#1056#1105#1057#1039' '#1056#152#1056#1112#1057#1039' '#1056#1115#1057#8218#1057#8225#1056#181#1057#1027#1057#8218#1056#1030#1056#1109'     ' +
              '  '#1056#8221#1056#1109#1056#187#1056#182#1056#1029#1056#1109#1057#1027#1057#8218#1057#1034'   '#1056#1119#1056#1169#1057#1026'      ')
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
          Left = 384.000000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[frxUserDataSetSl."dolg"]')
        end
        object DMPMemo6: TfrxDMPMemoView
          Left = 480.000000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[frxUserDataSetSl."shifrpod"]')
        end
        object DMPMemo8: TfrxDMPMemoView
          Left = 585.600000000000000000
          Width = 182.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[frxUserDataSetSl."comment"]')
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
      'shifrpod'
      'comment')
    OnGetValue = frxUserDataSetSlGetValue
    Left = 216
    Top = 64
  end
end
