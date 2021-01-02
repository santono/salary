object FormAnalyzeNalogi: TFormAnalyzeNalogi
  Left = 240
  Top = 131
  Width = 696
  Height = 560
  Caption = #1040#1085#1072#1083#1080#1079' '#1088#1072#1089#1095#1077#1090#1072' '#1085#1072#1083#1086#1075#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    680
    522)
  PixelsPerInch = 96
  TextHeight = 20
  object PageControlNal: TPageControl
    Left = 8
    Top = 32
    Width = 671
    Height = 481
    ActivePage = TabSheetMatHelp
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabSheetPod: TTabSheet
      Caption = #1053#1072#1083#1086#1075' '#1089' '#1076#1086#1093#1086#1076#1072
      OnEnter = TabSheetPodEnter
      object dxDBGridPod: TdxDBGrid
        Left = 0
        Top = 8
        Width = 657
        Height = 369
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFRIDPERSON'
        ShowSummaryFooter = True
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourcePod
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
        OnCustomDrawCell = dxDBGridPodCustomDrawCell
        object dxDBGridPodSHIFRIDPERSON: TdxDBGridMaskColumn
          Visible = False
          Width = 256
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRIDPERSON'
        end
        object dxDBGridPodPERSONFLD: TdxDBGridColumn
          Caption = #1057#1090#1072#1074#1082#1072
          HeaderAlignment = taCenter
          Width = 266
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PERSONFLD'
        end
        object dxDBGridPodYEARVY: TdxDBGridMaskColumn
          Caption = #1043#1086#1076
          HeaderAlignment = taCenter
          Width = 47
          BandIndex = 0
          RowIndex = 0
          FieldName = 'YEARVY'
        end
        object dxDBGridPodMONTHVY: TdxDBGridMaskColumn
          Caption = #1052'-'#1094
          HeaderAlignment = taCenter
          Sorted = csDown
          Width = 52
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MONTHVY'
        end
        object dxDBGridPodSUMMAADD: TdxDBGridCurrencyColumn
          Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
          HeaderAlignment = taCenter
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAADD'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAADD'
          DisplayFormat = ',0.00;-,0.00'#39
          Nullable = False
          SummaryType = cstSum
          SummaryField = 'SUMMAADD'
        end
        object dxDBGridPodSUMMAUD: TdxDBGridCurrencyColumn
          Caption = #1059#1076#1077#1088#1078#1072#1085#1086
          HeaderAlignment = taCenter
          Width = 93
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAUD'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAUD'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAUD'
        end
        object dxDBGridPodMODEPRSN: TdxDBGridMaskColumn
          Visible = False
          Width = 95
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MODEPRSN'
        end
      end
    end
    object TabSheetECBN: TTabSheet
      Caption = #1045#1057#1042' ('#1053')'
      ImageIndex = 1
      OnEnter = TabSheetECBNEnter
      DesignSize = (
        663
        446)
      object dxDBGridECBN: TdxDBGrid
        Left = 0
        Top = 0
        Width = 657
        Height = 441
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFRIDPERSON'
        ShowSummaryFooter = True
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceECBN
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
        OnCustomDrawCell = dxDBGridECBNCustomDrawCell
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridECBNSHIFRIDPERSON: TdxDBGridMaskColumn
          Visible = False
          Width = 349
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRIDPERSON'
        end
        object dxDBGridECBNPersonFld: TdxDBGridColumn
          Caption = #1057#1090#1072#1074#1082#1072
          HeaderAlignment = taCenter
          Width = 258
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PersonFld'
        end
        object dxDBGridECBNYEARVY: TdxDBGridMaskColumn
          Caption = #1043#1086#1076
          HeaderAlignment = taCenter
          Width = 56
          BandIndex = 0
          RowIndex = 0
          FieldName = 'YEARVY'
        end
        object dxDBGridECBNMONTHVY: TdxDBGridMaskColumn
          Caption = #1052'-'#1094
          HeaderAlignment = taCenter
          Width = 50
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MONTHVY'
        end
        object dxDBGridECBNSUMMAADD: TdxDBGridCurrencyColumn
          Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
          HeaderAlignment = taCenter
          Width = 148
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAADD'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAADD'
        end
        object dxDBGridECBNSUMMAADDMAX: TdxDBGridCurrencyColumn
          Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
          Visible = False
          Width = 338
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAADDMAX'
          Nullable = False
        end
        object dxDBGridECBNSUMMAUD: TdxDBGridCurrencyColumn
          Caption = #1059#1076#1077#1088#1078#1072#1085#1086
          HeaderAlignment = taCenter
          Sorted = csUp
          Width = 141
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAUD'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAUD'
        end
        object dxDBGridECBNSUMMAUDR: TdxDBGridCurrencyColumn
          Visible = False
          Width = 255
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAUDR'
          Nullable = False
        end
        object dxDBGridECBNSUMMAUDN: TdxDBGridCurrencyColumn
          Visible = False
          Width = 253
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAUDN'
          Nullable = False
        end
        object dxDBGridECBNMODEPRSN: TdxDBGridMaskColumn
          Visible = False
          Width = 243
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MODEPRSN'
        end
      end
    end
    object TabSheetECB: TTabSheet
      Caption = #1045#1057#1042
      ImageIndex = 2
      OnEnter = TabSheetECBEnter
      DesignSize = (
        663
        446)
      object dxDBGridECB: TdxDBGrid
        Left = 8
        Top = 8
        Width = 640
        Height = 427
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFRIDPERSON'
        ShowSummaryFooter = True
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceECB
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
        OnCustomDrawCell = dxDBGridECBCustomDrawCell
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridECBSHIFRIDPERSON: TdxDBGridMaskColumn
          Visible = False
          Width = 80
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRIDPERSON'
        end
        object dxDBGridECBPersonFld: TdxDBGridColumn
          Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
          HeaderAlignment = taCenter
          Width = 310
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PersonFld'
        end
        object dxDBGridECBYEARVY: TdxDBGridMaskColumn
          Caption = #1043#1086#1076
          HeaderAlignment = taCenter
          Sorted = csUp
          BandIndex = 0
          RowIndex = 0
          FieldName = 'YEARVY'
        end
        object dxDBGridECBMONTHVY: TdxDBGridMaskColumn
          Caption = #1052'-'#1094
          HeaderAlignment = taCenter
          Width = 60
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MONTHVY'
        end
        object dxDBGridECBSUMMAADD: TdxDBGridCurrencyColumn
          Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
          HeaderAlignment = taCenter
          Width = 101
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAADD'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAADD'
        end
        object dxDBGridECBSUMMAUD: TdxDBGridCurrencyColumn
          Caption = #1059#1076#1077#1088#1078#1072#1085#1086
          HeaderAlignment = taCenter
          Width = 94
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAUD'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAUD'
        end
        object dxDBGridECBMODEPRSN: TdxDBGridMaskColumn
          Visible = False
          Width = 55
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MODEPRSN'
        end
      end
    end
    object TabSheetECBDP: TTabSheet
      Caption = #1045#1057#1042' ('#1044#1055')'
      ImageIndex = 3
      OnEnter = TabSheetECBDPEnter
      DesignSize = (
        663
        446)
      object dxDBGridECBDp: TdxDBGrid
        Left = 0
        Top = 0
        Width = 657
        Height = 441
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFRIDPERSON'
        ShowSummaryFooter = True
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceDP
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
        OnCustomDrawCell = dxDBGridECBDpCustomDrawCell
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridECBDpSHIFRIDPERSON: TdxDBGridMaskColumn
          Visible = False
          Width = 277
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRIDPERSON'
        end
        object dxDBGridECBDpPersonFld: TdxDBGridColumn
          Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
          HeaderAlignment = taCenter
          Width = 286
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PersonFld'
        end
        object dxDBGridECBDpYEARVY: TdxDBGridMaskColumn
          Caption = #1043#1086#1076
          HeaderAlignment = taCenter
          Width = 66
          BandIndex = 0
          RowIndex = 0
          FieldName = 'YEARVY'
        end
        object dxDBGridECBDpMONTHVY: TdxDBGridMaskColumn
          Caption = #1052'-'#1094
          HeaderAlignment = taCenter
          Width = 70
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MONTHVY'
        end
        object dxDBGridECBDpSUMMAADD: TdxDBGridCurrencyColumn
          Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
          HeaderAlignment = taCenter
          Width = 118
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAADD'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAADD'
        end
        object dxDBGridECBDpSUMMAUD: TdxDBGridCurrencyColumn
          Caption = #1059#1076#1077#1088#1078#1072#1085#1086
          HeaderAlignment = taCenter
          Width = 113
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAUD'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAUD'
        end
        object dxDBGridECBDpMODEPRSN: TdxDBGridMaskColumn
          Visible = False
          Width = 194
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MODEPRSN'
        end
      end
    end
    object TabSheetIll: TTabSheet
      Caption = 'ECB ('#1041')'
      ImageIndex = 4
      OnEnter = TabSheetIllEnter
      object dxDBGridIll: TdxDBGrid
        Left = 0
        Top = 8
        Width = 657
        Height = 377
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFRIDPERSON'
        ShowSummaryFooter = True
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceECBIll
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
        OnCustomDrawCell = dxDBGridIllCustomDrawCell
        object dxDBGridIllSHIFRIDPERSON: TdxDBGridMaskColumn
          Visible = False
          Width = 322
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRIDPERSON'
        end
        object dxDBGridIllPersonFld: TdxDBGridColumn
          Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
          HeaderAlignment = taCenter
          Width = 259
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PersonFld'
        end
        object dxDBGridIllYEARVY: TdxDBGridMaskColumn
          Caption = #1043#1086#1076
          HeaderAlignment = taCenter
          Width = 65
          BandIndex = 0
          RowIndex = 0
          FieldName = 'YEARVY'
        end
        object dxDBGridIllMONTHVY: TdxDBGridMaskColumn
          Caption = #1052'-'#1094
          HeaderAlignment = taCenter
          Width = 62
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MONTHVY'
        end
        object dxDBGridIllSUMMAADD: TdxDBGridCurrencyColumn
          Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
          HeaderAlignment = taCenter
          Width = 139
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAADD'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAADD'
        end
        object dxDBGridIllSUMMAUD: TdxDBGridCurrencyColumn
          Caption = #1059#1076#1077#1088#1078#1072#1085#1086
          HeaderAlignment = taCenter
          Width = 128
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAUD'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAUD'
        end
        object dxDBGridIllMODEPRSN: TdxDBGridMaskColumn
          Visible = False
          Width = 226
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MODEPRSN'
        end
      end
    end
    object TabSheetPodI: TTabSheet
      Caption = #1053#1072#1083#1086#1075' ('#1048#1090#1086#1075#1080')'
      ImageIndex = 5
      object lbl1: TLabel
        Left = 8
        Top = 24
        Width = 134
        Height = 20
        Caption = #1048#1090#1086#1075#1086' '#1085#1072#1095#1080#1089#1083#1077#1085#1086' '
      end
      object lbSummaAddPod: TLabel
        Left = 204
        Top = 24
        Width = 40
        Height = 24
        Alignment = taRightJustify
        Caption = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblLgSobstw: TLabel
        Left = 8
        Top = 64
        Width = 197
        Height = 20
        Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1072#1103' '#1083#1100#1075#1086#1090#1072' - '#1085#1077#1090
      end
      object lblLgDop: TLabel
        Left = 8
        Top = 96
        Width = 232
        Height = 20
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1083#1100#1075#1086#1090#1099' - '#1085#1077#1090
      end
      object lblECB: TLabel
        Left = 8
        Top = 136
        Width = 114
        Height = 20
        Caption = #1059#1076#1077#1088#1078#1072#1085#1086' '#1045#1057#1042
      end
      object lblSummaECB: TLabel
        Left = 204
        Top = 136
        Width = 40
        Height = 24
        Alignment = taRightJustify
        Caption = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPodR: TLabel
        Left = 8
        Top = 176
        Width = 131
        Height = 20
        Caption = #1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1085#1072#1083#1086#1075
      end
      object lblSummaPodRas: TLabel
        Left = 204
        Top = 176
        Width = 40
        Height = 24
        Alignment = taRightJustify
        Caption = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPF: TLabel
        Left = 8
        Top = 216
        Width = 132
        Height = 20
        Caption = #1059#1076#1077#1088#1078#1072#1085#1086' ('#1092#1072#1082#1090')'
      end
      object lblSummaPodFakt: TLabel
        Left = 204
        Top = 216
        Width = 40
        Height = 24
        Alignment = taRightJustify
        Caption = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNN: TLabel
        Left = 8
        Top = 256
        Width = 63
        Height = 20
        Caption = #1056#1072#1079#1085#1080#1094#1072
      end
      object lblSummaPodRazn: TLabel
        Left = 204
        Top = 256
        Width = 40
        Height = 24
        Alignment = taRightJustify
        Caption = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object TabSheetECBI: TTabSheet
      Caption = #1045#1057#1042' ('#1048#1090#1086#1075#1080')'
      ImageIndex = 6
      object lblECBN: TLabel
        Left = 24
        Top = 48
        Width = 56
        Height = 20
        Caption = #1045#1057#1042' ('#1085')'
      end
      object lblECBT: TLabel
        Left = 50
        Top = 80
        Width = 33
        Height = 20
        Caption = #1045#1057#1042
      end
      object lblECBDp: TLabel
        Left = 12
        Top = 112
        Width = 67
        Height = 20
        Caption = #1045#1057#1042' ('#1076#1087')'
      end
      object lblECBIll: TLabel
        Left = 27
        Top = 144
        Width = 56
        Height = 20
        Caption = #1045#1057#1042' ('#1073')'
      end
      object lblSummaADDECBN: TLabel
        Left = 169
        Top = 48
        Width = 31
        Height = 20
        Alignment = taRightJustify
        Caption = '0.00'
      end
      object lblSummaMaxECBN: TLabel
        Left = 269
        Top = 48
        Width = 31
        Height = 20
        Alignment = taRightJustify
        Caption = '0.00'
      end
      object lblSummaUdECBN: TLabel
        Left = 369
        Top = 48
        Width = 31
        Height = 20
        Alignment = taRightJustify
        Caption = '0.00'
      end
      object lblSummaECBNRas: TLabel
        Left = 469
        Top = 48
        Width = 31
        Height = 20
        Alignment = taRightJustify
        Caption = '0.00'
      end
      object lblSummaECBNRazn: TLabel
        Left = 569
        Top = 48
        Width = 31
        Height = 20
        Alignment = taRightJustify
        Caption = '0.00'
      end
      object lblSummaAddECB: TLabel
        Left = 169
        Top = 80
        Width = 31
        Height = 20
        Alignment = taRightJustify
        Caption = '0.00'
      end
      object lblSummaMaxECB: TLabel
        Left = 269
        Top = 80
        Width = 31
        Height = 20
        Alignment = taRightJustify
        Caption = '0.00'
      end
      object lblSummaUdECB: TLabel
        Left = 369
        Top = 80
        Width = 31
        Height = 20
        Alignment = taRightJustify
        Caption = '0.00'
      end
      object lblSummaECBRas: TLabel
        Left = 469
        Top = 80
        Width = 31
        Height = 20
        Alignment = taRightJustify
        Caption = '0.00'
      end
      object lblSummaECBRAZN: TLabel
        Left = 569
        Top = 80
        Width = 31
        Height = 20
        Alignment = taRightJustify
        Caption = '0.00'
      end
      object lblSummaAddECBDp: TLabel
        Left = 169
        Top = 112
        Width = 31
        Height = 20
        Alignment = taRightJustify
        Caption = '0.00'
      end
      object lblSummaMaxECBDp: TLabel
        Left = 269
        Top = 112
        Width = 31
        Height = 20
        Alignment = taRightJustify
        Caption = '0.00'
      end
      object lblSummaUdECBDp: TLabel
        Left = 369
        Top = 112
        Width = 31
        Height = 20
        Alignment = taRightJustify
        Caption = '0.00'
      end
      object lblSummaECBDpRas: TLabel
        Left = 469
        Top = 112
        Width = 31
        Height = 20
        Alignment = taRightJustify
        Caption = '0.00'
      end
      object lblSummaECBDpRazn: TLabel
        Left = 569
        Top = 112
        Width = 31
        Height = 20
        Alignment = taRightJustify
        Caption = '0.00'
      end
      object lblSummaAddECBIll: TLabel
        Left = 169
        Top = 144
        Width = 31
        Height = 20
        Alignment = taRightJustify
        Caption = '0.00'
      end
      object lblSummaMaxECBIll: TLabel
        Left = 269
        Top = 144
        Width = 31
        Height = 20
        Alignment = taRightJustify
        Caption = '0.00'
      end
      object lblSummaECBIllRas: TLabel
        Left = 469
        Top = 144
        Width = 31
        Height = 20
        Alignment = taRightJustify
        Caption = '0.00'
      end
      object lblSummaECBIllRazn: TLabel
        Left = 569
        Top = 144
        Width = 31
        Height = 20
        Alignment = taRightJustify
        Caption = '0.00'
      end
      object lblSummaUdECBIll: TLabel
        Left = 369
        Top = 144
        Width = 31
        Height = 20
        Alignment = taRightJustify
        Caption = '0.00'
      end
    end
    object TabSheetMatHelp: TTabSheet
      Caption = #1053#1072#1083#1086#1075' '#1052' '#1055
      ImageIndex = 7
      DesignSize = (
        663
        446)
      object lblMatHeloLimit: TLabel
        Left = 0
        Top = 304
        Width = 170
        Height = 20
        Caption = #1053#1077#1086#1073#1083#1072#1075#1072#1077#1084#1099#1081' '#1083#1080#1084#1080#1090' '
      end
      object lblMatHelpLimitSumma: TLabel
        Left = 248
        Top = 304
        Width = 58
        Height = 20
        Caption = '2690.00'
      end
      object Label1: TLabel
        Left = 328
        Top = 216
        Width = 48
        Height = 20
        Caption = 'Label1'
      end
      object lblMatHelpNeed: TLabel
        Left = 0
        Top = 334
        Width = 243
        Height = 20
        Caption = #1055#1086#1076#1083#1077#1078#1080#1090' '#1086#1073#1083#1086#1078#1077#1085#1080#1102' '#1085#1072#1083#1086#1075#1086#1084' '
      end
      object lblMatHelpMustObl: TLabel
        Left = 248
        Top = 334
        Width = 31
        Height = 20
        Caption = '0.00'
      end
      object Label2: TLabel
        Left = 0
        Top = 364
        Width = 131
        Height = 20
        Caption = #1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1085#1072#1083#1086#1075
      end
      object Label3: TLabel
        Left = 336
        Top = 224
        Width = 48
        Height = 20
        Caption = 'Label3'
      end
      object Label4: TLabel
        Left = 0
        Top = 394
        Width = 171
        Height = 20
        Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080' '#1091#1076#1077#1088#1078#1072#1085#1086
      end
      object lblMatHelpNalRas: TLabel
        Left = 248
        Top = 364
        Width = 31
        Height = 20
        Caption = '0.00'
      end
      object lblMatHelpNalFakt: TLabel
        Left = 248
        Top = 394
        Width = 31
        Height = 20
        Caption = '0.00'
      end
      object Label7: TLabel
        Left = 0
        Top = 424
        Width = 63
        Height = 20
        Caption = #1056#1072#1079#1085#1080#1094#1072
      end
      object lblMatHelpNalRazn: TLabel
        Left = 248
        Top = 424
        Width = 31
        Height = 20
        Caption = '0.00'
        Color = clBtnFace
        ParentColor = False
      end
      object Label5: TLabel
        Left = 352
        Top = 334
        Width = 117
        Height = 20
        Caption = #1042#1110#1081#1089#1100#1082#1086#1074#1080#1081' '#1079#1073#1110#1088
      end
      object lblMatHelpWSRas: TLabel
        Left = 384
        Top = 364
        Width = 31
        Height = 20
        Caption = '0.00'
      end
      object lblMatHelpWSFakt: TLabel
        Left = 384
        Top = 394
        Width = 31
        Height = 20
        Caption = '0.00'
      end
      object lblMatHelpWSRazn: TLabel
        Left = 384
        Top = 424
        Width = 31
        Height = 20
        Caption = '0.00'
      end
      object dxDBGridMatHelp: TdxDBGrid
        Left = 0
        Top = 0
        Width = 657
        Height = 289
        Bands = <
          item
            Caption = #1053#1072#1088#1072#1093#1086#1074#1072#1085#1086
          end
          item
            Caption = #1053#1072#1083#1086#1075
          end
          item
            Caption = #1042'. '#1089#1073#1086#1088
          end>
        DefaultLayout = False
        KeyField = 'id'
        ShowSummaryFooter = True
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = dsoMatHelp
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoHeaderPanelHeight, edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        ShowBands = True
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridMatHelpshifrAdd: TdxDBGridMaskColumn
          Caption = #1064#1092#1088
          HeaderAlignment = taCenter
          Width = 51
          BandIndex = -1
          RowIndex = 0
          FieldName = 'shifrAdd'
        end
        object dxDBGridMatHelpmonthVyAdd: TdxDBGridMaskColumn
          Caption = #1052#1094
          HeaderAlignment = taCenter
          Width = 49
          BandIndex = 0
          RowIndex = 0
          FieldName = 'monthVyAdd'
        end
        object dxDBGridMatHelpyearVy: TdxDBGridMaskColumn
          Caption = #1056#1110#1082
          HeaderAlignment = taCenter
          Width = 48
          BandIndex = 0
          RowIndex = 0
          FieldName = 'yearVy'
        end
        object dxDBGridMatHelpsummaAdd: TdxDBGridMaskColumn
          Caption = #1053#1072#1088#1072#1093#1086#1074#1072#1085#1086
          HeaderAlignment = taCenter
          Width = 141
          BandIndex = 0
          RowIndex = 0
          FieldName = 'summaAdd'
          SummaryFooterType = cstSum
          SummaryField = 'summaAdd'
        end
        object dxDBGridMatHelpmonthVyNal: TdxDBGridMaskColumn
          Caption = #1052#1094
          HeaderAlignment = taCenter
          Width = 38
          BandIndex = 1
          RowIndex = 0
          FieldName = 'monthVyNal'
        end
        object dxDBGridMatHelpsummaNal: TdxDBGridMaskColumn
          Caption = #1057#1091#1084#1072
          HeaderAlignment = taCenter
          Width = 106
          BandIndex = 1
          RowIndex = 0
          FieldName = 'summaNal'
          SummaryFooterType = cstSum
        end
        object dxDBGridMatHelpmonthVyWS: TdxDBGridMaskColumn
          Caption = #1052#1094
          HeaderAlignment = taCenter
          Sorted = csUp
          Width = 65
          BandIndex = 2
          RowIndex = 0
          FieldName = 'monthVyWS'
        end
        object dxDBGridMatHelpsummaWS: TdxDBGridMaskColumn
          Caption = #1057#1091#1084#1072
          HeaderAlignment = taCenter
          Width = 155
          BandIndex = 2
          RowIndex = 0
          FieldName = 'summaWS'
          SummaryFooterType = cstSum
        end
        object dxDBGridMatHelpshifrNal: TdxDBGridMaskColumn
          Visible = False
          Width = 169
          BandIndex = -1
          RowIndex = 0
          FieldName = 'shifrNal'
        end
        object dxDBGridMatHelpshifrWS: TdxDBGridMaskColumn
          Visible = False
          Width = 169
          BandIndex = -1
          RowIndex = 0
          FieldName = 'shifrWS'
        end
        object dxDBGridMatHelpid: TdxDBGridMaskColumn
          Visible = False
          Width = 169
          BandIndex = 0
          RowIndex = 0
          FieldName = 'id'
        end
      end
    end
  end
  object dtpDataZa: TDateTimePicker
    Left = 8
    Top = 0
    Width = 161
    Height = 28
    Date = 40670.578828657410000000
    Format = 'MMMM yyyy'
    Time = 40670.578828657410000000
    DateFormat = dfLong
    DateMode = dmUpDown
    MaxDate = 47848.000000000000000000
    MinDate = 40544.000000000000000000
    TabOrder = 1
  end
  object btnFill: TBitBtn
    Left = 176
    Top = 2
    Width = 105
    Height = 25
    Caption = #1055#1077#1088#1072#1088#1072#1089#1095#1077#1090
    TabOrder = 2
    OnClick = btnFillClick
  end
  object btnExit: TBitBtn
    Left = 288
    Top = 2
    Width = 105
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 3
    Kind = bkClose
  end
  object pFIBDataSetPod: TpFIBDataSet
    SelectSQL.Strings = (
      'select * from PR_PERSON_ANALYZE_REC(:TABNO,:Y,:M,:MODE)')
    OnCalcFields = pFIBDataSetPodCalcFields
    AllowedUpdateKinds = []
    Transaction = pFIBTransactionPodR
    Database = FIB.pFIBDatabaseSal
    Left = 332
    Top = 119
    oStartTransaction = False
    object pFIBDataSetPodSHIFRIDPERSON: TFIBIntegerField
      FieldName = 'SHIFRIDPERSON'
    end
    object pFIBDataSetPodYEARVY: TFIBIntegerField
      FieldName = 'YEARVY'
    end
    object pFIBDataSetPodMONTHVY: TFIBIntegerField
      FieldName = 'MONTHVY'
    end
    object pFIBDataSetPodDOLG: TFIBStringField
      FieldName = 'DOLG'
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSetPodSHIFRKAT: TFIBIntegerField
      FieldName = 'SHIFRKAT'
    end
    object pFIBDataSetPodKATNAME: TFIBStringField
      FieldName = 'KATNAME'
      Size = 40
      EmptyStrToNull = True
    end
    object pFIBDataSetPodSHIFRGRU: TFIBIntegerField
      FieldName = 'SHIFRGRU'
    end
    object pFIBDataSetPodGRUNAME: TFIBStringField
      FieldName = 'GRUNAME'
      Size = 40
      EmptyStrToNull = True
    end
    object pFIBDataSetPodKOEF: TFIBBCDField
      FieldName = 'KOEF'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetPodW_R: TFIBIntegerField
      FieldName = 'W_R'
    end
    object pFIBDataSetPodW_R_NAME: TFIBStringField
      FieldName = 'W_R_NAME'
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSetPodW_PLACE: TFIBIntegerField
      FieldName = 'W_PLACE'
    end
    object pFIBDataSetPodW_P_NAME: TFIBStringField
      FieldName = 'W_P_NAME'
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSetPodSUMMAADD: TFIBBCDField
      FieldName = 'SUMMAADD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetPodSUMMAADDMAX: TFIBBCDField
      FieldName = 'SUMMAADDMAX'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetPodSUMMAUD: TFIBBCDField
      FieldName = 'SUMMAUD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetPodSUMMAUDR: TFIBBCDField
      FieldName = 'SUMMAUDR'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetPodSUMMAUDN: TFIBBCDField
      FieldName = 'SUMMAUDN'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetPodMODEPRSN: TFIBIntegerField
      FieldName = 'MODEPRSN'
    end
    object pFIBDataSetPodPERSONFLD: TStringField
      FieldKind = fkCalculated
      FieldName = 'PERSONFLD'
      Size = 80
      Calculated = True
    end
  end
  object pFIBTransactionPodR: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 364
    Top = 119
  end
  object DataSourcePod: TDataSource
    DataSet = pFIBDataSetPod
    Left = 404
    Top = 119
  end
  object DataSourceECBN: TDataSource
    DataSet = pFIBDataSetECBN
    Left = 404
    Top = 159
  end
  object DataSourceECB: TDataSource
    DataSet = pFIBDataSetECB
    Left = 404
    Top = 199
  end
  object DataSourceDP: TDataSource
    DataSet = pFIBDataSetECBDp
    Left = 404
    Top = 239
  end
  object pFIBDataSetECBN: TpFIBDataSet
    UpdateRecordTypes = [cusUnmodified, cusModified]
    SelectSQL.Strings = (
      'select * from PR_PERSON_ANALYZE_REC(:TABNO,:Y,:M,:MODE)')
    OnCalcFields = pFIBDataSetECBNCalcFields
    AllowedUpdateKinds = []
    Transaction = pFIBTransactionECBN
    Database = FIB.pFIBDatabaseSal
    Left = 332
    Top = 159
    oStartTransaction = False
    object pFIBDataSetECBNSHIFRIDPERSON: TFIBIntegerField
      FieldName = 'SHIFRIDPERSON'
    end
    object pFIBDataSetECBNYEARVY: TFIBIntegerField
      FieldName = 'YEARVY'
    end
    object pFIBDataSetECBNMONTHVY: TFIBIntegerField
      FieldName = 'MONTHVY'
    end
    object pFIBDataSetECBNDOLG: TFIBStringField
      FieldName = 'DOLG'
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSetECBNSHIFRKAT: TFIBIntegerField
      FieldName = 'SHIFRKAT'
    end
    object pFIBDataSetECBNKATNAME: TFIBStringField
      FieldName = 'KATNAME'
      Size = 40
      EmptyStrToNull = True
    end
    object pFIBDataSetECBNSHIFRGRU: TFIBIntegerField
      FieldName = 'SHIFRGRU'
    end
    object pFIBDataSetECBNGRUNAME: TFIBStringField
      FieldName = 'GRUNAME'
      Size = 40
      EmptyStrToNull = True
    end
    object pFIBDataSetECBNKOEF: TFIBBCDField
      FieldName = 'KOEF'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetECBNW_R: TFIBIntegerField
      FieldName = 'W_R'
    end
    object pFIBDataSetECBNW_R_NAME: TFIBStringField
      FieldName = 'W_R_NAME'
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSetECBNW_PLACE: TFIBIntegerField
      FieldName = 'W_PLACE'
    end
    object pFIBDataSetECBNW_P_NAME: TFIBStringField
      FieldName = 'W_P_NAME'
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSetECBNSUMMAADD: TFIBBCDField
      FieldName = 'SUMMAADD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetECBNSUMMAADDMAX: TFIBBCDField
      FieldName = 'SUMMAADDMAX'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetECBNSUMMAUD: TFIBBCDField
      FieldName = 'SUMMAUD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetECBNSUMMAUDR: TFIBBCDField
      FieldName = 'SUMMAUDR'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetECBNSUMMAUDN: TFIBBCDField
      FieldName = 'SUMMAUDN'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetECBNMODEPRSN: TFIBIntegerField
      FieldName = 'MODEPRSN'
    end
    object pFIBDataSetECBNPersonFld: TStringField
      FieldKind = fkCalculated
      FieldName = 'PersonFld'
      Size = 80
      Calculated = True
    end
  end
  object pFIBDataSetECB: TpFIBDataSet
    SelectSQL.Strings = (
      'select * from PR_PERSON_ANALYZE_REC(:TABNO,:Y,:M,:MODE)')
    OnCalcFields = pFIBDataSetECBCalcFields
    Transaction = pFIBTransactionECB
    Database = FIB.pFIBDatabaseSal
    Left = 332
    Top = 199
    oStartTransaction = False
    object pFIBDataSetECBSHIFRIDPERSON: TFIBIntegerField
      FieldName = 'SHIFRIDPERSON'
    end
    object pFIBDataSetECBYEARVY: TFIBIntegerField
      FieldName = 'YEARVY'
    end
    object pFIBDataSetECBMONTHVY: TFIBIntegerField
      FieldName = 'MONTHVY'
    end
    object pFIBDataSetECBDOLG: TFIBStringField
      FieldName = 'DOLG'
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSetECBSHIFRKAT: TFIBIntegerField
      FieldName = 'SHIFRKAT'
    end
    object pFIBDataSetECBKATNAME: TFIBStringField
      FieldName = 'KATNAME'
      Size = 40
      EmptyStrToNull = True
    end
    object pFIBDataSetECBSHIFRGRU: TFIBIntegerField
      FieldName = 'SHIFRGRU'
    end
    object pFIBDataSetECBGRUNAME: TFIBStringField
      FieldName = 'GRUNAME'
      Size = 40
      EmptyStrToNull = True
    end
    object pFIBDataSetECBKOEF: TFIBBCDField
      FieldName = 'KOEF'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetECBW_R: TFIBIntegerField
      FieldName = 'W_R'
    end
    object pFIBDataSetECBW_R_NAME: TFIBStringField
      FieldName = 'W_R_NAME'
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSetECBW_PLACE: TFIBIntegerField
      FieldName = 'W_PLACE'
    end
    object pFIBDataSetECBW_P_NAME: TFIBStringField
      FieldName = 'W_P_NAME'
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSetECBSUMMAADD: TFIBBCDField
      FieldName = 'SUMMAADD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetECBSUMMAADDMAX: TFIBBCDField
      FieldName = 'SUMMAADDMAX'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetECBSUMMAUD: TFIBBCDField
      FieldName = 'SUMMAUD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetECBSUMMAUDR: TFIBBCDField
      FieldName = 'SUMMAUDR'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetECBSUMMAUDN: TFIBBCDField
      FieldName = 'SUMMAUDN'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetECBMODEPRSN: TFIBIntegerField
      FieldName = 'MODEPRSN'
    end
    object pFIBDataSetECBPersonFld: TStringField
      FieldKind = fkCalculated
      FieldName = 'PersonFld'
      Size = 80
      Calculated = True
    end
  end
  object pFIBDataSetECBDp: TpFIBDataSet
    SelectSQL.Strings = (
      'select * from PR_PERSON_ANALYZE_REC(:TABNO,:Y,:M,:MODE)')
    OnCalcFields = pFIBDataSetECBDpCalcFields
    Transaction = pFIBTransactionECBDp
    Database = FIB.pFIBDatabaseSal
    Left = 332
    Top = 239
    oStartTransaction = False
    object pFIBDataSetECBDpSHIFRIDPERSON: TFIBIntegerField
      FieldName = 'SHIFRIDPERSON'
    end
    object pFIBDataSetECBDpYEARVY: TFIBIntegerField
      FieldName = 'YEARVY'
    end
    object pFIBDataSetECBDpMONTHVY: TFIBIntegerField
      FieldName = 'MONTHVY'
    end
    object pFIBDataSetECBDpDOLG: TFIBStringField
      FieldName = 'DOLG'
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSetECBDpSHIFRKAT: TFIBIntegerField
      FieldName = 'SHIFRKAT'
    end
    object pFIBDataSetECBDpKATNAME: TFIBStringField
      FieldName = 'KATNAME'
      Size = 40
      EmptyStrToNull = True
    end
    object pFIBDataSetECBDpSHIFRGRU: TFIBIntegerField
      FieldName = 'SHIFRGRU'
    end
    object pFIBDataSetECBDpGRUNAME: TFIBStringField
      FieldName = 'GRUNAME'
      Size = 40
      EmptyStrToNull = True
    end
    object pFIBDataSetECBDpKOEF: TFIBBCDField
      FieldName = 'KOEF'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetECBDpW_R: TFIBIntegerField
      FieldName = 'W_R'
    end
    object pFIBDataSetECBDpW_R_NAME: TFIBStringField
      FieldName = 'W_R_NAME'
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSetECBDpW_PLACE: TFIBIntegerField
      FieldName = 'W_PLACE'
    end
    object pFIBDataSetECBDpW_P_NAME: TFIBStringField
      FieldName = 'W_P_NAME'
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSetECBDpSUMMAADD: TFIBBCDField
      FieldName = 'SUMMAADD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetECBDpSUMMAADDMAX: TFIBBCDField
      FieldName = 'SUMMAADDMAX'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetECBDpSUMMAUD: TFIBBCDField
      FieldName = 'SUMMAUD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetECBDpSUMMAUDR: TFIBBCDField
      FieldName = 'SUMMAUDR'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetECBDpSUMMAUDN: TFIBBCDField
      FieldName = 'SUMMAUDN'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetECBDpMODEPRSN: TFIBIntegerField
      FieldName = 'MODEPRSN'
    end
    object pFIBDataSetECBDpPersonFld: TStringField
      FieldKind = fkCalculated
      FieldName = 'PersonFld'
      Size = 80
      Calculated = True
    end
  end
  object pFIBTransactionECBN: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 364
    Top = 159
  end
  object pFIBTransactionECB: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 364
    Top = 199
  end
  object pFIBTransactionECBDp: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 364
    Top = 239
  end
  object pFIBDataSetECBIll: TpFIBDataSet
    SelectSQL.Strings = (
      'select * from PR_PERSON_ANALYZE_REC(:TABNO,:Y,:M,:MODE)')
    OnCalcFields = pFIBDataSetECBIllCalcFields
    Transaction = pFIBTransactionECBIll
    Database = FIB.pFIBDatabaseSal
    Left = 332
    Top = 279
    object pFIBDataSetECBIllSHIFRIDPERSON: TFIBIntegerField
      FieldName = 'SHIFRIDPERSON'
    end
    object pFIBDataSetECBIllYEARVY: TFIBIntegerField
      FieldName = 'YEARVY'
    end
    object pFIBDataSetECBIllMONTHVY: TFIBIntegerField
      FieldName = 'MONTHVY'
    end
    object pFIBDataSetECBIllDOLG: TFIBStringField
      FieldName = 'DOLG'
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSetECBIllSHIFRKAT: TFIBIntegerField
      FieldName = 'SHIFRKAT'
    end
    object pFIBDataSetECBIllKATNAME: TFIBStringField
      FieldName = 'KATNAME'
      Size = 40
      EmptyStrToNull = True
    end
    object pFIBDataSetECBIllSHIFRGRU: TFIBIntegerField
      FieldName = 'SHIFRGRU'
    end
    object pFIBDataSetECBIllGRUNAME: TFIBStringField
      FieldName = 'GRUNAME'
      Size = 40
      EmptyStrToNull = True
    end
    object pFIBDataSetECBIllKOEF: TFIBBCDField
      FieldName = 'KOEF'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetECBIllW_R: TFIBIntegerField
      FieldName = 'W_R'
    end
    object pFIBDataSetECBIllW_R_NAME: TFIBStringField
      FieldName = 'W_R_NAME'
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSetECBIllW_PLACE: TFIBIntegerField
      FieldName = 'W_PLACE'
    end
    object pFIBDataSetECBIllW_P_NAME: TFIBStringField
      FieldName = 'W_P_NAME'
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSetECBIllSUMMAADD: TFIBBCDField
      FieldName = 'SUMMAADD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetECBIllSUMMAADDMAX: TFIBBCDField
      FieldName = 'SUMMAADDMAX'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetECBIllSUMMAUD: TFIBBCDField
      FieldName = 'SUMMAUD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetECBIllSUMMAUDR: TFIBBCDField
      FieldName = 'SUMMAUDR'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetECBIllSUMMAUDN: TFIBBCDField
      FieldName = 'SUMMAUDN'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetECBIllMODEPRSN: TFIBIntegerField
      FieldName = 'MODEPRSN'
    end
    object pFIBDataSetECBIllPersonFld: TStringField
      FieldKind = fkCalculated
      FieldName = 'PersonFld'
      Size = 80
      Calculated = True
    end
  end
  object pFIBTransactionECBIll: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 364
    Top = 279
  end
  object DataSourceECBIll: TDataSource
    DataSet = pFIBDataSetECBIll
    Left = 404
    Top = 279
  end
  object ImageListAnalyze: TImageList
    Left = 508
    Top = 191
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008000000080000000800000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000800000008000000080000000800000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000800000008000000080000000800000008000000080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080000000800000008000000080000000800000008000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000008000000080000000FC000000FC000000FC0000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000008000000080000000FF000000FF000000FF000000800000008000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000080000000FC000000FC000000FC000000FC000000FC00000080000000
      8000000080000000000000000000000000000000000000000000000000000080
      00000080000000FF000000FF000000FF000000FF000000FF0000008000000080
      0000008000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      80000000FC000000FC000000FC000000FC000000FC000000FC000000FC000000
      8000000080000000000000000000000000000000000000000000000000000080
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000080
      0000008000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      80000000FC000000FC000000FC000000FC000000FC000000FC000000FC000000
      8000000080000000000000000000000000000000000000000000000000000080
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000080
      0000008000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      80000000FC000000FC000000FC000000FC000000FC000000FC000000FC000000
      8000000080000000000000000000000000000000000000000000000000000080
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000080
      0000008000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000080000000FC000000FC000000FC000000FC000000FC00000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      00000080000000FF000000FF000000FF000000FF000000FF0000008000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000080000000FC000000FC000000FC0000008000000080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080000000FF000000FF000000FF000000800000008000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008000000080000000800000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000800000008000000080000000800000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFFFFF00000000
      FFFFFFFF00000000FC3FFC3F00000000F81FF81F00000000F00FF00F00000000
      E007E00700000000E007E00700000000E007E00700000000E007E00700000000
      F00FF00F00000000F81FF81F00000000FC3FFC3F00000000FFFFFFFF00000000
      FFFFFFFF00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object DataSourceWS: TDataSource
    Left = 404
    Top = 319
  end
  object pFIBDataSetWS: TpFIBDataSet
    SelectSQL.Strings = (
      'select * from PR_PERSON_ANALYZE_REC(:TABNO,:Y,:M,:MODE)')
    Transaction = pFIBTransactionWS
    Database = FIB.pFIBDatabaseSal
    Left = 332
    Top = 319
    object pFIBDataSetWSSHIFRIDPERSON: TFIBIntegerField
      FieldName = 'SHIFRIDPERSON'
    end
    object pFIBDataSetWSYEARVY: TFIBIntegerField
      FieldName = 'YEARVY'
    end
    object pFIBDataSetWSMONTHVY: TFIBIntegerField
      FieldName = 'MONTHVY'
    end
    object pFIBDataSetWSDOLG: TFIBStringField
      FieldName = 'DOLG'
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSetWSSHIFRKAT: TFIBIntegerField
      FieldName = 'SHIFRKAT'
    end
    object pFIBDataSetWSKATNAME: TFIBStringField
      FieldName = 'KATNAME'
      Size = 40
      EmptyStrToNull = True
    end
    object pFIBDataSetWSSHIFRGRU: TFIBIntegerField
      FieldName = 'SHIFRGRU'
    end
    object pFIBDataSetWSGRUNAME: TFIBStringField
      FieldName = 'GRUNAME'
      Size = 40
      EmptyStrToNull = True
    end
    object pFIBDataSetWSKOEF: TFIBBCDField
      FieldName = 'KOEF'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetWSW_R: TFIBIntegerField
      FieldName = 'W_R'
    end
    object pFIBDataSetWSW_R_NAME: TFIBStringField
      FieldName = 'W_R_NAME'
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSetWSW_PLACE: TFIBIntegerField
      FieldName = 'W_PLACE'
    end
    object pFIBDataSetWSW_P_NAME: TFIBStringField
      FieldName = 'W_P_NAME'
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSetWSSUMMAADD: TFIBBCDField
      FieldName = 'SUMMAADD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetWSSUMMAADDMAX: TFIBBCDField
      FieldName = 'SUMMAADDMAX'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetWSSUMMAUD: TFIBBCDField
      FieldName = 'SUMMAUD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetWSSUMMAUDR: TFIBBCDField
      FieldName = 'SUMMAUDR'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetWSSUMMAUDN: TFIBBCDField
      FieldName = 'SUMMAUDN'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetWSMODEPRSN: TFIBIntegerField
      FieldName = 'MODEPRSN'
    end
  end
  object pFIBTransactionWS: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 364
    Top = 319
  end
  object cdsMatHelp: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'shifrAdd'
        DataType = ftInteger
      end
      item
        Name = 'monthVyAdd'
        DataType = ftInteger
      end
      item
        Name = 'yearVy'
        DataType = ftInteger
      end
      item
        Name = 'summaAdd'
        DataType = ftFloat
      end
      item
        Name = 'summaNal'
        DataType = ftFloat
      end
      item
        Name = 'summaWS'
        DataType = ftFloat
      end
      item
        Name = 'shifrNal'
        DataType = ftInteger
      end
      item
        Name = 'monthVyNal'
        DataType = ftInteger
      end
      item
        Name = 'monthVyWS'
        DataType = ftInteger
      end
      item
        Name = 'shifrWS'
        DataType = ftInteger
      end
      item
        Name = 'id'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 332
    Top = 359
    Data = {
      D00000009619E0BD01000000180000000B000000000003000000D00008736869
      667241646404000100000000000A6D6F6E746856794164640400010000000000
      0679656172567904000100000000000873756D6D614164640800040000000000
      0873756D6D614E616C08000400000000000773756D6D61575308000400000000
      000873686966724E616C04000100000000000A6D6F6E746856794E616C040001
      0000000000096D6F6E7468567957530400010000000000077368696672575304
      0001000000000002696404000100000000000000}
    object cdsMatHelpshifrAdd: TIntegerField
      FieldName = 'shifrAdd'
    end
    object cdsMatHelpmonthVyAdd: TIntegerField
      FieldName = 'monthVyAdd'
    end
    object cdsMatHelpyearVy: TIntegerField
      FieldName = 'yearVy'
    end
    object cdsMatHelpsummaAdd: TFloatField
      FieldName = 'summaAdd'
      DisplayFormat = '######0.00'
    end
    object cdsMatHelpsummaWS: TFloatField
      FieldName = 'summaWS'
      DisplayFormat = '#######0.00'
    end
    object cdsMatHelpshifrNal: TIntegerField
      FieldName = 'shifrNal'
    end
    object cdsMatHelpmonthVyNal: TIntegerField
      FieldName = 'monthVyNal'
    end
    object cdsMatHelpmonthVyWS: TIntegerField
      FieldName = 'monthVyWS'
    end
    object cdsMatHelpshifrWS: TIntegerField
      FieldName = 'shifrWS'
    end
    object cdsMatHelpsummaNal: TFloatField
      FieldName = 'summaNal'
      DisplayFormat = '#######0.00'
    end
    object cdsMatHelpid: TIntegerField
      FieldName = 'id'
    end
  end
  object DataSource1: TDataSource
    Left = 336
    Top = 264
  end
  object dsoMatHelp: TDataSource
    DataSet = cdsMatHelp
    Left = 364
    Top = 359
  end
  object pFIBQueryMatHelp: TpFIBQuery
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    Left = 404
    Top = 359
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
    Left = 436
    Top = 359
  end
end
