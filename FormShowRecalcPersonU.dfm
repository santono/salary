object FormShowRecalcPerson: TFormShowRecalcPerson
  Left = 269
  Top = 167
  Width = 696
  Height = 480
  Caption = #1044#1072#1085#1085#1099#1077' '#1076#1083#1103' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1072' '#1087#1086#1076#1086#1093#1086#1076#1085#1086#1075#1086' '#1085#1072#1083#1086#1075#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    680
    442)
  PixelsPerInch = 96
  TextHeight = 20
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 673
    Height = 417
    ActivePage = TabSheetECB
    Anchors = [akLeft, akTop, akRight, akBottom]
    PopupMenu = PopupMenu1
    TabOrder = 0
    object TabSheetPod: TTabSheet
      Caption = #1053#1072#1083#1086#1075' '#1089' '#1076#1086#1093#1086#1076#1072
      DesignSize = (
        665
        382)
      object TreeViewPod: TTreeView
        Left = 0
        Top = 0
        Width = 665
        Height = 377
        Anchors = [akLeft, akTop, akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = []
        Indent = 21
        ParentFont = False
        PopupMenu = PopupMenu1
        TabOrder = 0
      end
    end
    object TabSheetPens: TTabSheet
      Caption = #1055#1077#1085#1089#1080#1086#1085#1085#1099#1081
      ImageIndex = 1
      TabVisible = False
      DesignSize = (
        665
        382)
      object TreeViewPens: TTreeView
        Left = 0
        Top = 0
        Width = 665
        Height = 377
        Anchors = [akLeft, akTop, akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = []
        Indent = 21
        ParentFont = False
        TabOrder = 0
      end
    end
    object TabSheetSS: TTabSheet
      Caption = #1057#1086#1094' '#1089#1090#1088#1072#1093
      ImageIndex = 2
      TabVisible = False
      DesignSize = (
        665
        382)
      object TreeViewSS: TTreeView
        Left = 0
        Top = 0
        Width = 665
        Height = 377
        Anchors = [akLeft, akTop, akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = []
        Indent = 21
        ParentFont = False
        TabOrder = 0
      end
    end
    object TabSheetFZ: TTabSheet
      Caption = #1060#1086#1085#1076' '#1079#1072#1085#1103#1090#1086#1089#1090#1080
      ImageIndex = 3
      TabVisible = False
      DesignSize = (
        665
        382)
      object TreeViewFZ: TTreeView
        Left = -8
        Top = 0
        Width = 657
        Height = 377
        Anchors = [akLeft, akTop, akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = []
        Indent = 21
        ParentFont = False
        TabOrder = 0
      end
    end
    object TabSheetECB: TTabSheet
      Caption = #1045#1057#1042
      ImageIndex = 4
      DesignSize = (
        665
        382)
      object TreeViewECB: TTreeView
        Left = 0
        Top = 0
        Width = 665
        Height = 377
        Anchors = [akLeft, akTop, akRight, akBottom]
        Indent = 22
        TabOrder = 0
      end
    end
    object TabSheetECBN: TTabSheet
      Caption = #1045#1057#1042' ('#1053')'
      ImageIndex = 5
      DesignSize = (
        665
        382)
      object TreeViewECBN: TTreeView
        Left = 0
        Top = 0
        Width = 665
        Height = 377
        Anchors = [akLeft, akTop, akRight, akBottom]
        Indent = 22
        TabOrder = 0
      end
    end
    object TabSheetECBDP: TTabSheet
      Caption = #1045#1057#1042' ('#1044#1055')'
      ImageIndex = 6
      DesignSize = (
        665
        382)
      object TreeViewECBDP: TTreeView
        Left = 0
        Top = 0
        Width = 665
        Height = 377
        Anchors = [akLeft, akTop, akRight, akBottom]
        Indent = 22
        TabOrder = 0
      end
    end
    object TabSheetECBIll: TTabSheet
      Caption = #1045#1057#1042' ('#1041')'
      ImageIndex = 7
      DesignSize = (
        665
        382)
      object TreeViewECBIll: TTreeView
        Left = 0
        Top = 0
        Width = 665
        Height = 377
        Anchors = [akLeft, akTop, akRight, akBottom]
        Indent = 22
        TabOrder = 0
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 120
    Top = 104
    object N1: TMenuItem
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
      OnClick = N2Click
    end
  end
  object frxReport1: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39600.900216469900000000
    ReportOptions.LastChange = 39602.986258310200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo3OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnBeforePrint = frxReport1BeforePrint
    OnManualBuild = frxReport1ManualBuild
    Left = 204
    Top = 103
    Datasets = <>
    Variables = <
      item
        Name = ' Global'
        Value = Null
      end
      item
        Name = 'FIO'
        Value = ''
      end
      item
        Name = 'HatLine'
        Value = ''
      end
      item
        Name = 'DetF'
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
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object Header: TfrxReportTitle
        Height = 60.472480000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 506.457020000000000000
          Top = 34.015770000000010000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            '[DATE]')
        end
        object SysMemo2: TfrxSysMemoView
          Left = 619.842920000000000000
          Top = 34.015770000000010000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            '[TIME]')
        end
        object Memo3: TfrxMemoView
          Left = 79.370130000000000000
          Top = 30.236239999999990000
          Width = 393.071120000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo3OnBeforePrint'
          Memo.UTF8 = (
            '[FIO]')
        end
        object Memo2: TfrxMemoView
          Left = 41.574830000000000000
          Top = 3.779530000000001000
          Width = 638.740570000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          HAlign = haCenter
          Memo.UTF8 = (
            '[HatLine]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 139.842610000000000000
        Width = 718.110700000000000000
        RowCount = 0
        object Memo4: TfrxMemoView
          Left = 11.338590000000000000
          Width = 699.213050000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8 = (
            '[DetF]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 222.992270000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 642.419312533333000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[Page#]')
        end
      end
    end
  end
end
