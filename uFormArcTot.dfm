object FormArcTot: TFormArcTot
  Left = 230
  Top = 184
  Width = 696
  Height = 480
  Caption = #1040#1088#1093#1080#1074' '#1079#1072#1088#1072#1073#1086#1090#1085#1086#1081' '#1087#1083#1072#1090#1099' '#1088#1072#1073#1086#1090#1085#1080#1082#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    680
    442)
  PixelsPerInch = 96
  TextHeight = 20
  object LabelFio: TLabel
    Left = 8
    Top = 16
    Width = 5
    Height = 20
    Caption = 'r'
  end
  object StringGridArc: TStringGrid
    Left = 8
    Top = 56
    Width = 665
    Height = 369
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 13
    RowCount = 13
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnDblClick = StringGridArcDblClick
    OnDrawCell = StringGridArcDrawCell
  end
  object DateTimePickerFr: TDateTimePicker
    Left = 440
    Top = 16
    Width = 113
    Height = 28
    Anchors = [akTop, akRight]
    Date = 39103.812012256950000000
    Time = 39103.812012256950000000
    TabOrder = 1
  end
  object DateTimePickerTo: TDateTimePicker
    Left = 560
    Top = 16
    Width = 114
    Height = 28
    Anchors = [akTop, akRight]
    Date = 40179.816494317130000000
    Time = 40179.816494317130000000
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 400
    Top = 16
    Width = 33
    Height = 25
    Caption = '. . .'
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object PopupMenu1: TPopupMenu
    Left = 208
    Top = 168
    object N1: TMenuItem
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' ('#1056#1077#1078#1080#1084' '#1047#1072')'
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1058
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' ('#1056#1077#1078#1080#1084' '#1042'))'
      OnClick = N4Click
    end
  end
  object frxReportT: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39529.945233460600000000
    ReportOptions.LastChange = 39948.943547453700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      ''
      'begin'
      ''
      'end.')
    OnBeforePrint = frxReportTBeforePrint
    Left = 312
    Top = 168
    Datasets = <>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'FIO'
        Value = ''
      end
      item
        Name = 'SummaTot'
        Value = ''
      end
      item
        Name = 'New Variable3'
        Value = ''
      end>
    Style = <>
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 151.181200000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            
              #1056#8221#1056#1109#1056#1030#1057#8211#1056#1169#1056#1108#1056#176' '#1056#1111#1057#1026#1056#1109' '#1056#183#1056#176#1057#1026#1056#1109#1056#177#1057#8211#1057#8218#1056#1109#1056#1108' '#1056#1169#1056#187#1057#1039' '#1056#1109#1056#177#1057#8225#1056#1105#1057#1027#1056#187#1056#181#1056#1029 +
              #1056#1029#1057#1039' '#1056#1111#1056#181#1056#1029#1057#1027#1057#8211#1057#8212)
        end
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Top = 22.677180000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1025#1056#1118#1056#1106#1056#1114#1056#1119)
        end
        object Memo4: TfrxMemoView
          Left = 3.779530000000000000
          Top = 34.015770000000010000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            #1056#1109#1057#1026#1056#1110#1056#176#1056#1029#1057#1107', '#1057#8240#1056#1109' '#1056#1030#1056#1105#1056#1169#1056#176#1056#1030' '#1056#1169#1056#1109#1056#1030#1057#8211#1056#1169#1056#1108#1057#1107)
        end
        object Memo5: TfrxMemoView
          Left = 302.362400000000000000
          Top = 56.692949999999990000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8217#1056#1105#1056#1169#1056#176#1056#1029#1056#1109' ')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 264.567100000000000000
          Top = 83.149660000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            
              #1056#1111#1057#1026#1056#1109' '#1057#8218#1056#181', '#1057#8240#1056#1109' '#1056#8470#1056#1109#1056#1110#1056#1109' ('#1057#8212#1057#8212') '#1056#183#1056#176#1057#1026#1056#1109#1056#177#1057#8211#1057#8218#1056#1109#1056#1108', '#1057#1039#1056#1108#1056#1105#1056#8470' '#1056 +
              #1030#1057#1026#1056#176#1057#8230#1056#1109#1056#1030#1057#1107#1057#8221#1057#8218#1057#1034#1057#1027#1057#1039)
        end
        object Memo7: TfrxMemoView
          Left = 260.787570000000000000
          Top = 109.606370000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            #1056#1111#1057#1026#1056#1105' '#1056#1109#1056#177#1057#8225#1056#1105#1057#1027#1056#187#1056#181#1056#1029#1056#1029#1057#8211' '#1056#1111#1056#181#1056#1029#1057#1027#1057#8211#1057#8212', '#1057#1027#1056#1108#1056#187#1056#176#1056#1030' ('#1056#1110#1057#1026#1056#1029'.)')
        end
        object Memo17: TfrxMemoView
          Left = 389.291590000000000000
          Top = 56.692949999999990000
          Width = 325.039580000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo17OnBeforePrint'
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8 = (
            '[FIO]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 514.016080000000000000
          Top = 109.606370000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[SummaTot]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 230.551330000000000000
        Width = 1046.929810000000000000
        RowCount = 1
        object Cross1: TfrxCrossView
          Left = 7.559060000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DownThenAcross = False
          ShowColumnTotal = False
          Memos = {
            3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574
            662D38223F3E3C63726F73733E3C63656C6C6D656D6F733E3C546672784D656D
            6F56696577204C6566743D2236342220546F703D223332222057696474683D22
            353222204865696768743D22323222205265737472696374696F6E733D223822
            20446973706C6179466F726D61742E446563696D616C536570617261746F723D
            222C2220446973706C6179466F726D61742E466F726D61745374723D2225322E
            326E2220446973706C6179466F726D61742E4B696E643D22666B4E756D657269
            632220466F6E742E436861727365743D22312220466F6E742E436F6C6F723D22
            2D31363737373230382220466F6E742E4865696768743D222D31332220466F6E
            742E4E616D653D22417269616C2220466F6E742E5374796C653D223022204672
            616D652E5479703D2231352220476170583D22332220476170593D2233222048
            416C69676E3D22686152696768742220506172656E74466F6E743D2246616C73
            6522205374796C653D2263656C6C222056416C69676E3D22766143656E746572
            2220546578743D2230222F3E3C546672784D656D6F56696577204C6566743D22
            302220546F703D2230222057696474683D223022204865696768743D22302220
            5265737472696374696F6E733D223822204672616D652E5479703D2231352220
            48416C69676E3D2268615269676874222056416C69676E3D22766143656E7465
            722220546578743D22222F3E3C546672784D656D6F56696577204C6566743D22
            302220546F703D2230222057696474683D223022204865696768743D22302220
            5265737472696374696F6E733D223822204672616D652E5479703D2231352220
            48416C69676E3D2268615269676874222056416C69676E3D22766143656E7465
            722220546578743D22222F3E3C546672784D656D6F56696577204C6566743D22
            302220546F703D2230222057696474683D223022204865696768743D22302220
            5265737472696374696F6E733D223822204672616D652E5479703D2231352220
            48416C69676E3D2268615269676874222056416C69676E3D22766143656E7465
            722220546578743D22222F3E3C2F63656C6C6D656D6F733E3C63656C6C686561
            6465726D656D6F733E3C546672784D656D6F56696577204C6566743D22302220
            546F703D2230222057696474683D223022204865696768743D22302220526573
            7472696374696F6E733D223822204672616D652E5479703D223135222056416C
            69676E3D22766143656E7465722220546578743D22222F3E3C546672784D656D
            6F56696577204C6566743D22302220546F703D2230222057696474683D223022
            204865696768743D223022205265737472696374696F6E733D22382220467261
            6D652E5479703D223135222056416C69676E3D22766143656E74657222205465
            78743D22222F3E3C2F63656C6C6865616465726D656D6F733E3C636F6C756D6E
            6D656D6F733E3C546672784D656D6F56696577205461673D2231303022204C65
            66743D2236342220546F703D223130222057696474683D223532222048656967
            68743D22323222205265737472696374696F6E733D2232342220466F6E742E43
            6861727365743D22312220466F6E742E436F6C6F723D222D3136373737323038
            2220466F6E742E4865696768743D222D31332220466F6E742E4E616D653D2241
            7269616C2220466F6E742E5374796C653D223022204672616D652E5479703D22
            31352220476170583D22332220476170593D2233222048416C69676E3D226861
            43656E7465722220506172656E74466F6E743D2246616C736522205374796C65
            3D22636F6C756D6E222056416C69676E3D22766143656E746572222054657874
            3D22222F3E3C2F636F6C756D6E6D656D6F733E3C636F6C756D6E746F74616C6D
            656D6F733E3C546672784D656D6F56696577205461673D2233303022204C6566
            743D223134332220546F703D223130222057696474683D223831222048656967
            68743D22323222205265737472696374696F6E733D2238222056697369626C65
            3D2246616C73652220466F6E742E436861727365743D22312220466F6E742E43
            6F6C6F723D222D31363737373230382220466F6E742E4865696768743D222D31
            332220466F6E742E4E616D653D22417269616C2220466F6E742E5374796C653D
            223122204672616D652E5479703D2231352220476170583D2233222047617059
            3D2233222048416C69676E3D22686143656E7465722220506172656E74466F6E
            743D2246616C736522205374796C653D22636F6C6772616E64222056416C6967
            6E3D22766143656E7465722220546578743D224772616E6420546F74616C222F
            3E3C2F636F6C756D6E746F74616C6D656D6F733E3C636F726E65726D656D6F73
            3E3C546672784D656D6F56696577204C6566743D22302220546F703D22302220
            57696474683D223022204865696768743D223022205265737472696374696F6E
            733D223822204672616D652E5479703D223135222048416C69676E3D22686143
            656E746572222056416C69676E3D22766143656E7465722220546578743D2222
            2F3E3C546672784D656D6F56696577204C6566743D22302220546F703D223022
            2057696474683D223022204865696768743D223022205265737472696374696F
            6E733D223822204672616D652E5479703D223135222048416C69676E3D226861
            43656E746572222056416C69676E3D22766143656E7465722220546578743D22
            222F3E3C546672784D656D6F56696577204C6566743D22302220546F703D2230
            222057696474683D223022204865696768743D22302220526573747269637469
            6F6E733D223822204672616D652E5479703D223135222048416C69676E3D2268
            6143656E746572222056416C69676E3D22766143656E7465722220546578743D
            22222F3E3C546672784D656D6F56696577204C6566743D22302220546F703D22
            30222057696474683D223022204865696768743D223022205265737472696374
            696F6E733D223822204672616D652E5479703D223135222048416C69676E3D22
            686143656E746572222056416C69676E3D22766143656E746572222054657874
            3D22222F3E3C2F636F726E65726D656D6F733E3C726F776D656D6F733E3C5466
            72784D656D6F56696577205461673D2232303022204C6566743D223130222054
            6F703D223332222057696474683D22353422204865696768743D223232222052
            65737472696374696F6E733D2232342220466F6E742E436861727365743D2231
            2220466F6E742E436F6C6F723D222D31363737373230382220466F6E742E4865
            696768743D222D31332220466F6E742E4E616D653D22417269616C2220466F6E
            742E5374796C653D223022204672616D652E5479703D2231352220476170583D
            22332220476170593D2233222048416C69676E3D22686143656E746572222050
            6172656E74466F6E743D2246616C736522205374796C653D22726F7722205641
            6C69676E3D22766143656E7465722220546578743D22222F3E3C2F726F776D65
            6D6F733E3C726F77746F74616C6D656D6F733E3C546672784D656D6F56696577
            205461673D2234303022204C6566743D2231302220546F703D22353422205769
            6474683D22353422204865696768743D22323222205265737472696374696F6E
            733D22382220466F6E742E436861727365743D22312220466F6E742E436F6C6F
            723D222D31363737373230382220466F6E742E4865696768743D222D31332220
            466F6E742E4E616D653D22417269616C2220466F6E742E5374796C653D223122
            204672616D652E5479703D2231352220476170583D22332220476170593D2233
            222048416C69676E3D22686143656E7465722220506172656E74466F6E743D22
            46616C736522205374796C653D22726F776772616E64222056416C69676E3D22
            766143656E7465722220546578743D22D092D181D18CD0BED0B3D0BE222F3E3C
            2F726F77746F74616C6D656D6F733E3C63656C6C66756E6374696F6E733E3C69
            74656D20312F3E3C2F63656C6C66756E6374696F6E733E3C636F6C756D6E736F
            72743E3C6974656D20302F3E3C2F636F6C756D6E736F72743E3C726F77736F72
            743E3C6974656D20322F3E3C2F726F77736F72743E3C2F63726F73733E}
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 162.519790000000000000
        Top = 313.700990000000000000
        Width = 1046.929810000000000000
        object Memo8: TfrxMemoView
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#1113#1056#181#1057#1026#1057#8211#1056#1030#1056#1029#1056#1105#1056#1108)
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 491.338900000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo9: TfrxMemoView
          Left = 634.961040000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo10: TfrxMemoView
          Left = 634.961040000000000000
          Top = 15.118119999999980000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1111#1057#1026#1057#8211#1056#183#1056#1030#1056#1105#1057#8240#1056#181)
        end
        object Memo11: TfrxMemoView
          Left = 3.779530000000000000
          Top = 60.472480000000010000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8220#1056#1109#1056#187#1056#1109#1056#1030#1056#1029#1056#1105#1056#8470' '#1056#177#1057#1107#1057#8230#1056#1110#1056#176#1056#187#1057#8218#1056#181#1057#1026)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 491.338900000000000000
          Top = 60.472480000000010000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo13: TfrxMemoView
          Left = 638.740570000000000000
          Top = 64.252009999999990000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo14: TfrxMemoView
          Left = 638.740570000000000000
          Top = 79.370130000000010000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1111#1057#1026#1057#8211#1056#183#1056#1030#1056#1105#1057#8240#1056#181)
        end
        object Memo15: TfrxMemoView
          Left = 3.779530000000000000
          Top = 120.944960000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            #1056#8217#1056#1105#1056#1108#1056#1109#1056#1029#1056#176#1056#1030#1056#181#1057#8224#1057#1034)
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 3.779530000000000000
          Top = 139.842610000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            #1057#8218#1056#181#1056#187'.41-71-32')
        end
      end
    end
  end
  object frxCrossObject1: TfrxCrossObject
    Left = 360
    Top = 168
  end
  object frxReportTT: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39530.744509548610000000
    ReportOptions.LastChange = 39530.745185000000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnBeforePrint = frxReportTTBeforePrint
    Left = 312
    Top = 208
    Datasets = <>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 718.009912533333500000
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 102.047310000000000000
        Width = 718.009912533333500000
        RowCount = 0
        object Cross1: TfrxCrossView
          Left = 3.779530000000000000
          Top = 3.779530000000008000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DownThenAcross = False
          ShowColumnTotal = False
          Memos = {
            3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574
            662D38223F3E3C63726F73733E3C63656C6C6D656D6F733E3C546672784D656D
            6F56696577204C6566743D2239312220546F703D223332222057696474683D22
            353222204865696768743D22323222205265737472696374696F6E733D223822
            204672616D652E5479703D2231352220476170583D22332220476170593D2233
            222048416C69676E3D226861526967687422205374796C653D2263656C6C2220
            56416C69676E3D22766143656E7465722220546578743D2230222F3E3C546672
            784D656D6F56696577204C6566743D22302220546F703D223022205769647468
            3D223022204865696768743D223022205265737472696374696F6E733D223822
            204672616D652E5479703D223135222048416C69676E3D226861526967687422
            2056416C69676E3D22766143656E7465722220546578743D22222F3E3C546672
            784D656D6F56696577204C6566743D22302220546F703D223022205769647468
            3D223022204865696768743D223022205265737472696374696F6E733D223822
            204672616D652E5479703D223135222048416C69676E3D226861526967687422
            2056416C69676E3D22766143656E7465722220546578743D22222F3E3C546672
            784D656D6F56696577204C6566743D22302220546F703D223022205769647468
            3D223022204865696768743D223022205265737472696374696F6E733D223822
            204672616D652E5479703D223135222048416C69676E3D226861526967687422
            2056416C69676E3D22766143656E7465722220546578743D22222F3E3C2F6365
            6C6C6D656D6F733E3C63656C6C6865616465726D656D6F733E3C546672784D65
            6D6F56696577204C6566743D22302220546F703D2230222057696474683D2230
            22204865696768743D223022205265737472696374696F6E733D223822204672
            616D652E5479703D223135222056416C69676E3D22766143656E746572222054
            6578743D22222F3E3C546672784D656D6F56696577204C6566743D2230222054
            6F703D2230222057696474683D223022204865696768743D2230222052657374
            72696374696F6E733D223822204672616D652E5479703D223135222056416C69
            676E3D22766143656E7465722220546578743D22222F3E3C2F63656C6C686561
            6465726D656D6F733E3C636F6C756D6E6D656D6F733E3C546672784D656D6F56
            696577205461673D2231303022204C6566743D2239312220546F703D22313022
            2057696474683D22353222204865696768743D22323222205265737472696374
            696F6E733D22323422204672616D652E5479703D2231352220476170583D2233
            2220476170593D2233222048416C69676E3D22686143656E7465722220537479
            6C653D22636F6C756D6E222056416C69676E3D22766143656E74657222205465
            78743D22222F3E3C2F636F6C756D6E6D656D6F733E3C636F6C756D6E746F7461
            6C6D656D6F733E3C546672784D656D6F56696577205461673D2233303022204C
            6566743D223134332220546F703D223130222057696474683D22383122204865
            696768743D22323222205265737472696374696F6E733D223822205669736962
            6C653D2246616C73652220466F6E742E436861727365743D22312220466F6E74
            2E436F6C6F723D22302220466F6E742E4865696768743D222D31332220466F6E
            742E4E616D653D22417269616C2220466F6E742E5374796C653D223122204672
            616D652E5479703D2231352220476170583D22332220476170593D2233222048
            416C69676E3D22686143656E7465722220506172656E74466F6E743D2246616C
            736522205374796C653D22636F6C6772616E64222056416C69676E3D22766143
            656E7465722220546578743D224772616E6420546F74616C222F3E3C2F636F6C
            756D6E746F74616C6D656D6F733E3C636F726E65726D656D6F733E3C54667278
            4D656D6F56696577204C6566743D22302220546F703D2230222057696474683D
            223022204865696768743D223022205265737472696374696F6E733D22382220
            4672616D652E5479703D223135222048416C69676E3D22686143656E74657222
            2056416C69676E3D22766143656E7465722220546578743D22222F3E3C546672
            784D656D6F56696577204C6566743D22302220546F703D223022205769647468
            3D223022204865696768743D223022205265737472696374696F6E733D223822
            204672616D652E5479703D223135222048416C69676E3D22686143656E746572
            222056416C69676E3D22766143656E7465722220546578743D22222F3E3C5466
            72784D656D6F56696577204C6566743D22302220546F703D2230222057696474
            683D223022204865696768743D223022205265737472696374696F6E733D2238
            22204672616D652E5479703D223135222048416C69676E3D22686143656E7465
            72222056416C69676E3D22766143656E7465722220546578743D22222F3E3C54
            6672784D656D6F56696577204C6566743D22302220546F703D22302220576964
            74683D223022204865696768743D223022205265737472696374696F6E733D22
            3822204672616D652E5479703D223135222048416C69676E3D22686143656E74
            6572222056416C69676E3D22766143656E7465722220546578743D22222F3E3C
            2F636F726E65726D656D6F733E3C726F776D656D6F733E3C546672784D656D6F
            56696577205461673D2232303022204C6566743D2231302220546F703D223332
            222057696474683D22383122204865696768743D223232222052657374726963
            74696F6E733D22323422204672616D652E5479703D2231352220476170583D22
            332220476170593D2233222048416C69676E3D22686143656E74657222205374
            796C653D22726F77222056416C69676E3D22766143656E746572222054657874
            3D22222F3E3C2F726F776D656D6F733E3C726F77746F74616C6D656D6F733E3C
            546672784D656D6F56696577205461673D2234303022204C6566743D22313022
            20546F703D223534222057696474683D22383122204865696768743D22323222
            205265737472696374696F6E733D22382220466F6E742E436861727365743D22
            312220466F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D
            31332220466F6E742E4E616D653D22417269616C2220466F6E742E5374796C65
            3D223122204672616D652E5479703D2231352220476170583D22332220476170
            593D2233222048416C69676E3D22686143656E7465722220506172656E74466F
            6E743D2246616C736522205374796C653D22726F776772616E64222056416C69
            676E3D22766143656E7465722220546578743D224772616E6420546F74616C22
            2F3E3C2F726F77746F74616C6D656D6F733E3C63656C6C66756E6374696F6E73
            3E3C6974656D20312F3E3C2F63656C6C66756E6374696F6E733E3C636F6C756D
            6E736F72743E3C6974656D20302F3E3C2F636F6C756D6E736F72743E3C726F77
            736F72743E3C6974656D20302F3E3C2F726F77736F72743E3C2F63726F73733E}
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 185.196970000000000000
        Width = 718.009912533333500000
        object Memo1: TfrxMemoView
          Left = 642.419312533333400000
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
