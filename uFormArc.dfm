object FormArc: TFormArc
  Left = 276
  Top = 150
  Width = 922
  Height = 582
  Caption = #1040#1088#1093#1080#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    906
    544)
  PixelsPerInch = 96
  TextHeight = 20
  object Fio: TLabel
    Left = 16
    Top = 8
    Width = 22
    Height = 20
    Caption = 'Fio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 568
    Top = 8
    Width = 25
    Height = 25
    Caption = '. . .'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 608
    Top = 8
    Width = 180
    Height = 28
    Date = 38650.741651273150000000
    Time = 38650.741651273150000000
    DateFormat = dfLong
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ImeMode = imAlpha
    MaxDate = 51434.000000000000000000
    MinDate = 32874.000000000000000000
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnChange = DateTimePicker1Change
  end
  object PageControl1: TPageControl
    Left = 16
    Top = 40
    Width = 883
    Height = 481
    ActivePage = tab20114v
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = #1042
      DesignSize = (
        875
        446)
      object dxDBGridVy: TdxDBGrid
        Left = 8
        Top = 8
        Width = 859
        Height = 442
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        ShowSummaryFooter = True
        SummaryGroups = <
          item
            DefaultGroup = False
            SummaryItems = <
              item
                ColumnName = 'dxDBGridVySUMMA'
                SummaryField = 'SUMMA'
                SummaryFormat = '0.##'
                SummaryType = cstSum
              end>
            Name = 'dxDBGrid1SummaryGroup2'
          end>
        SummarySeparator = ', '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        BandFont.Charset = DEFAULT_CHARSET
        BandFont.Color = clWindowText
        BandFont.Height = -11
        BandFont.Name = 'MS Sans Serif'
        BandFont.Style = []
        DataSource = DataSourceVy
        Filter.Criteria = {00000000}
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -16
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Style = []
        OptionsDB = [edgoCancelOnExit, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
        PreviewFont.Charset = DEFAULT_CHARSET
        PreviewFont.Color = clBlue
        PreviewFont.Height = -11
        PreviewFont.Name = 'MS Sans Serif'
        PreviewFont.Style = []
        ShowBands = True
        ShowPreviewGrid = False
        ShowRowFooter = True
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridVySHIFRSTA: TdxDBGridMaskColumn
          Caption = #1064#1092#1088
          HeaderAlignment = taCenter
          Width = 29
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRSTA'
        end
        object dxDBGridVySHORTNAME: TdxDBGridMaskColumn
          Caption = #1057#1090#1072#1090#1100#1103
          HeaderAlignment = taCenter
          Sorted = csUp
          Width = 142
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHORTNAME'
        end
        object dxDBGridVySUMMA: TdxDBGridCurrencyColumn
          Caption = #1057#1091#1084#1084#1072
          HeaderAlignment = taCenter
          Width = 55
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA'
          DisplayFormat = ',0.00;-,0.00'#39
          Nullable = False
        end
        object dxDBGridVyYEAR_ZA: TdxDBGridMaskColumn
          Caption = #1043#1086#1076
          HeaderAlignment = taCenter
          Width = 32
          BandIndex = 0
          RowIndex = 0
          FieldName = 'YEAR_ZA'
        end
        object dxDBGridVyMONTH_ZA: TdxDBGridMaskColumn
          Caption = #1052'-'#1094
          HeaderAlignment = taCenter
          Width = 24
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MONTH_ZA'
        end
        object dxDBGridW_R: TdxDBGridColumn
          Caption = #1042' '#1088
          BandIndex = 0
          RowIndex = 0
          FieldName = 'W_R'
        end
        object dxDBGridVyColumnNameKat: TdxDBGridColumn
          Caption = #1050#1072#1090
          Width = 30
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAMEKAT'
        end
        object dxDBGridVyColumnNameGru: TdxDBGridColumn
          Caption = #1043#1088
          HeaderAlignment = taCenter
          Width = 30
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAMEGRU'
        end
        object dxDBGridVyCode: TdxDBGridColumn
          Caption = ' '
          Sorted = csDown
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'CODE'
          GroupIndex = 0
          SummaryType = cstSum
          SummaryField = 'SUMMA'
          SummaryFormat = '0.##'
          SummaryGroupName = 'dxDBGrid1SummaryGroup2'
        end
        object dxDBGridVyShifrPod: TdxDBGridColumn
          Caption = #1055#1076#1088
          HeaderAlignment = taCenter
          Width = 40
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRPOD'
        end
        object dxDBGridVyPodr: TdxDBGridColumn
          Caption = #1055#1086#1076#1088
          HeaderAlignment = taCenter
          Width = 200
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAME'
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1047#1072
      ImageIndex = 1
      DesignSize = (
        875
        446)
      object dxDBGridZa: TdxDBGrid
        Left = 0
        Top = 24
        Width = 867
        Height = 441
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        ShowGroupPanel = True
        SummaryGroups = <
          item
            DefaultGroup = False
            SummaryItems = <
              item
                ColumnName = 'dxDBGridZaSUMMA'
                SummaryField = 'SUMMA'
                SummaryFormat = '0.##'
                SummaryType = cstSum
              end>
            Name = 'dxDBGridZaSummaryGroup2'
          end>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceZa
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        ShowRowFooter = True
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridZaSHIFRID: TdxDBGridMaskColumn
          Visible = False
          Width = 88
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRID'
        end
        object dxDBGridZaSHIFRSTA: TdxDBGridMaskColumn
          Caption = #1064#1092#1088
          Width = 52
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRSTA'
        end
        object dxDBGridZaSHORTNAME: TdxDBGridMaskColumn
          Caption = #1057#1090#1072#1090#1100#1103
          HeaderAlignment = taCenter
          Width = 82
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHORTNAME'
        end
        object dxDBGridZaSUMMA: TdxDBGridCurrencyColumn
          Caption = #1057#1091#1084#1084#1072
          HeaderAlignment = taCenter
          Width = 74
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA'
          DisplayFormat = ',0.00'
          Nullable = False
        end
        object dxDBGridZaYearVy: TdxDBGridColumn
          Caption = #1043#1086#1076
          Width = 20
          BandIndex = 0
          RowIndex = 0
          FieldName = 'YEAR_VY'
        end
        object dxDBGridZaMonth_Vy: TdxDBGridColumn
          Caption = #1052'-'#1094
          HeaderAlignment = taCenter
          Width = 47
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MONTH_VY'
        end
        object dxDBGridZaW_R: TdxDBGridMaskColumn
          Caption = #1042#1080#1076
          HeaderAlignment = taCenter
          Width = 43
          BandIndex = 0
          RowIndex = 0
          FieldName = 'W_R'
        end
        object dxDBGridZaNAMEKAT: TdxDBGridMaskColumn
          Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
          HeaderAlignment = taCenter
          Width = 134
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAMEKAT'
        end
        object dxDBGridZaNAMEGRU: TdxDBGridMaskColumn
          Caption = #1043#1088
          HeaderAlignment = taCenter
          Width = 76
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAMEGRU'
        end
        object dxDBGridZaShifrPod: TdxDBGridColumn
          Caption = #1055#1076#1088
          HeaderAlignment = taCenter
          Width = 40
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRPOD'
        end
        object dxDBGridZaNAME: TdxDBGridMaskColumn
          Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
          HeaderAlignment = taCenter
          Sorted = csDown
          Width = 302
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAME'
        end
        object dxDBGridZaCODE: TdxDBGridMaskColumn
          Caption = ' '
          Sorted = csUp
          Visible = False
          Width = 79
          BandIndex = 0
          RowIndex = 0
          FieldName = 'CODE'
          GroupIndex = 0
          SummaryType = cstSum
          SummaryField = 'SUMMA'
          SummaryFormat = '0.##'
          SummaryGroupName = 'dxDBGridZaSummaryGroup2'
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1043#1086#1076' '#1074
      ImageIndex = 2
      object dxDBGridYearVy: TdxDBGrid
        Left = 8
        Top = 8
        Width = 825
        Height = 425
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'MONTH_VY'
        ShowSummaryFooter = True
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceYearVy
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        object dxDBGridYearVyMONTH_VY: TdxDBGridMaskColumn
          Caption = #1052'-'#1094
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MONTH_VY'
        end
        object dxDBGridYearVySUMMAADD: TdxDBGridCurrencyColumn
          Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAADD'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAADD'
          DisplayFormat = ',0.00'
          Nullable = False
          SummaryField = 'SUMMAADD'
        end
        object dxDBGridYearVySUMMAMP: TdxDBGridCurrencyColumn
          Caption = #1052#1072#1090'.'#1087#1086#1084
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAMP'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00'
          Nullable = False
        end
        object dxDBGridYearVySUMMAKASSA: TdxDBGridCurrencyColumn
          Caption = #1042#1085' '#1074' '#1082#1072#1089#1089#1091
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAKASSA'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00'
          Nullable = False
        end
        object dxDBGridYearVySUMMAPOD: TdxDBGridCurrencyColumn
          Caption = #1055#1086#1076' '#1085#1072#1083#1086#1075
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAPOD'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00'
          Nullable = False
        end
        object dxDBGridYearVySUMMAPENS: TdxDBGridCurrencyColumn
          Caption = #1055#1077#1085#1089' '#1092#1086#1085#1076
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAPENS'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00'
          Nullable = False
        end
        object dxDBGridYearVySUMMASS: TdxDBGridCurrencyColumn
          Caption = #1057#1086#1094' '#1089#1090#1088#1072#1093
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMASS'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00'
          Nullable = False
        end
        object dxDBGridYearVySUMMAFZ: TdxDBGridCurrencyColumn
          Caption = #1060#1086#1085#1076' '#1079
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAFZ'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00'
          Nullable = False
        end
        object dxDBGridYearVySUMMAPROF: TdxDBGridCurrencyColumn
          Caption = #1055#1088#1086#1092' '#1074#1079#1085
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAPROF'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00'
          Nullable = False
        end
        object dxDBGridYearVyWS: TdxDBGridColumn
          Caption = #1042'.'#1089#1073#1086#1088
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAWS'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAWS'
          SummaryField = 'SUMMAWS'
        end
        object dxDBGridYearVySUMMAKVYD: TdxDBGridCurrencyColumn
          Caption = #1050' '#1074#1099#1076#1072#1095#1077
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAKVYD'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00'
          Nullable = False
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1043#1086#1076' '#1079#1072
      ImageIndex = 3
      object dxDBGridYearZa: TdxDBGrid
        Left = 0
        Top = 8
        Width = 833
        Height = 425
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'MONTH_ZA'
        ShowSummaryFooter = True
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceYearZa
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        object dxDBGridYearZaMONTH_ZA: TdxDBGridMaskColumn
          Caption = #1052'-'#1094
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MONTH_ZA'
        end
        object dxDBGridYearZaSUMMAADD: TdxDBGridCurrencyColumn
          Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAADD'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00'
          Nullable = False
        end
        object dxDBGridYearZaSUMMAMP: TdxDBGridCurrencyColumn
          Caption = #1052#1072#1090' '#1087#1086#1084
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAMP'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00'
          Nullable = False
        end
        object dxDBGridYearZaSUMMAKASSA: TdxDBGridCurrencyColumn
          Caption = #1042#1085' '#1074' '#1082#1072#1089#1089#1091
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAKASSA'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00'
          Nullable = False
        end
        object dxDBGridYearZaSUMMAPOD: TdxDBGridCurrencyColumn
          Caption = #1055#1086#1076' '#1085#1072#1083#1086#1075
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAPOD'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00'
          Nullable = False
        end
        object dxDBGridYearZaSUMMAPENS: TdxDBGridCurrencyColumn
          Caption = #1055#1077#1085#1089' '#1085#1072#1083
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAPENS'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00'
          Nullable = False
        end
        object dxDBGridYearZaSUMMASS: TdxDBGridCurrencyColumn
          Caption = #1057#1086#1094' '#1089#1090#1088#1072#1093
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMASS'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00'
          Nullable = False
        end
        object dxDBGridYearZaSUMMAFZ: TdxDBGridCurrencyColumn
          Caption = #1060#1086#1085#1076' '#1079
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAFZ'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00'
          Nullable = False
        end
        object dxDBGridYearZaSUMMAPROF: TdxDBGridCurrencyColumn
          Caption = #1055#1088#1086#1092' '#1074#1079
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAPROF'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00'
          Nullable = False
        end
        object dxDBGridYearZaWS: TdxDBGridColumn
          Caption = #1042'.'#1089#1073#1086#1088
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAWS'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAWS'
          SummaryField = 'SUMMAWS'
        end
        object dxDBGridYearZaSUMMAKVYD: TdxDBGridCurrencyColumn
          Caption = #1050' '#1074#1099#1076#1072#1095#1077
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAKVYD'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00'
          Nullable = False
        end
      end
    end
    object TabSheetVyY11: TTabSheet
      Caption = #1043#1086#1076' '#1074' ('#1089' 11)'
      ImageIndex = 4
      DesignSize = (
        875
        446)
      object dxDBGridYearVy11: TdxDBGrid
        Left = 0
        Top = 8
        Width = 875
        Height = 433
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'MONTH_VY'
        ShowSummaryFooter = True
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceYearVy11
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridYearVy11MONTH_VY: TdxDBGridMaskColumn
          Caption = #1052'-'#1094
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MONTH_VY'
        end
        object dxDBGridYearVy11SUMMAADD: TdxDBGridCurrencyColumn
          Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAADD'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAADD'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAADD'
        end
        object dxDBGridYearVy11SUMMAMP: TdxDBGridCurrencyColumn
          Caption = #1052'.'#1087#1086#1084
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAMP'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAMP'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAMP'
        end
        object dxDBGridYearVy11SUMMAKASSA: TdxDBGridCurrencyColumn
          Caption = #1042#1085'.'#1074' '#1082#1072#1089#1089#1091
          HeaderAlignment = taRightJustify
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAKASSA'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAKASSA'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAKASSA'
        end
        object dxDBGridYearVy11SUMMAPOD: TdxDBGridCurrencyColumn
          Caption = #1053'.'#1089' '#1076#1086#1093#1086#1076#1072
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAPOD'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAPOD'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAPOD'
        end
        object dxDBGridYearVy11SUMMAECB: TdxDBGridCurrencyColumn
          Caption = #1045#1057#1042
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAECB'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAECB'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAECB'
        end
        object dxDBGridYearVy11SUMMAECBN: TdxDBGridCurrencyColumn
          Caption = #1045#1057#1042' '#1053'.'
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAECBN'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAECBN'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAECBN'
        end
        object dxDBGridYearVy11SUMMAECBILL: TdxDBGridCurrencyColumn
          Caption = #1045#1057#1042' '#1041'.'
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAECBILL'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAECBILL'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAECBILL'
        end
        object dxDBGridYearVy11SUMMAECBDP: TdxDBGridCurrencyColumn
          Caption = #1045#1057#1042' '#1062#1055#1061
          HeaderAlignment = taCenter
          ReadOnly = True
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAECBDP'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAECBDP'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAECBDP'
        end
        object dxDBGridYearVy11SUMMAPROF: TdxDBGridCurrencyColumn
          Caption = #1055#1088#1086#1092'.'
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAPROF'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAPROF'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAPROF'
        end
        object dxDBGridYearVy11WS: TdxDBGridColumn
          Caption = #1042'.'#1089#1073#1086#1088
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAWS'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAWS'
          SummaryField = 'SUMMAWS'
        end
        object dxDBGridYearVy11SUMMAKVYD: TdxDBGridCurrencyColumn
          Caption = #1050' '#1074#1099#1076#1072#1095#1077
          HeaderAlignment = taCenter
          Sorted = csUp
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAKVYD'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAKVYD'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAKVYD'
        end
      end
    end
    object TabSheetZaY11: TTabSheet
      Caption = #1043#1086#1076' '#1079#1072' ('#1089' 11 )'
      ImageIndex = 5
      DesignSize = (
        875
        446)
      object dxDBGridYearZa11: TdxDBGrid
        Left = 0
        Top = 0
        Width = 875
        Height = 441
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'MONTH_ZA'
        ShowSummaryFooter = True
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceYearZa11
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridYearZa11MONTH_ZA: TdxDBGridMaskColumn
          Caption = #1052'-'#1094
          HeaderAlignment = taCenter
          Width = 50
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MONTH_ZA'
        end
        object dxDBGridYearZa11SUMMAADD: TdxDBGridCurrencyColumn
          Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
          HeaderAlignment = taCenter
          Width = 74
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAADD'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAADD'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAADD'
        end
        object dxDBGridYearZa11SUMMAMP: TdxDBGridCurrencyColumn
          Caption = #1052'.'#1087#1086#1084'.'
          HeaderAlignment = taCenter
          Width = 68
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAMP'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAMP'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAMP'
        end
        object dxDBGridYearZa11SUMMAKASSA: TdxDBGridCurrencyColumn
          Caption = #1042#1085'.'#1074' '#1082#1072#1089#1089#1091
          HeaderAlignment = taCenter
          Width = 87
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAKASSA'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAKASSA'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAKASSA'
        end
        object dxDBGridYearZa11SUMMAPOD: TdxDBGridCurrencyColumn
          Caption = #1053'.'#1089' '#1076#1086#1093#1086#1076#1072
          HeaderAlignment = taCenter
          Width = 73
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAPOD'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAPOD'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAPOD'
        end
        object dxDBGridYearZa11SUMMAECB: TdxDBGridCurrencyColumn
          Caption = #1045#1057#1042
          HeaderAlignment = taCenter
          Width = 72
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAECB'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAECB'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAECB'
        end
        object dxDBGridYearZa11SUMMAECBN: TdxDBGridCurrencyColumn
          Caption = 'ECB '#1053'.'
          HeaderAlignment = taCenter
          Sorted = csUp
          Width = 80
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAECBN'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAECBN'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAECBN'
        end
        object dxDBGridYearZa11SUMMAECBILL: TdxDBGridCurrencyColumn
          Caption = 'ECB '#1041'.'
          HeaderAlignment = taCenter
          Width = 88
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAECBILL'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAECBILL'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAECBILL'
        end
        object dxDBGridYearZa11SUMMAECBDP: TdxDBGridCurrencyColumn
          Caption = #1045'C'#1042' '#1062#1055#1061
          HeaderAlignment = taCenter
          Width = 88
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAECBDP'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAECBDP'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAECBDP'
        end
        object dxDBGridYearZa11SUMMAPROF: TdxDBGridCurrencyColumn
          Caption = #1055#1088#1086#1092'.'
          HeaderAlignment = taCenter
          Width = 80
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAPROF'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAPROF'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAPROF'
        end
        object dxDBGridYearZa11WS: TdxDBGridColumn
          Caption = #1042'.'#1089#1073#1086#1088
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAWS'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAWS'
          SummaryType = cstSum
          SummaryField = 'SUMMAWS'
        end
        object dxDBGridYearZa11SUMMAKVYD: TdxDBGridCurrencyColumn
          Caption = #1050' '#1074#1099#1076#1072#1095#1077
          Width = 77
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAKVYD'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAKVYD'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAKVYD'
        end
      end
    end
    object tab20114v: TTabSheet
      Caption = '2011 04 '#1074
      ImageIndex = 6
      DesignSize = (
        875
        446)
      object dxDBGridYearVy20114: TdxDBGrid
        Left = 8
        Top = 0
        Width = 875
        Height = 441
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'MONTH_VY'
        ShowSummaryFooter = True
        SummaryGroups = <>
        SummarySeparator = ', '
        PopupMenu = PopupMenu1
        TabOrder = 0
        DataSource = DataSource20114v
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridYearVy20114MONTH_VY: TdxDBGridMaskColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MONTH_VY'
        end
        object dxDBGridYearVy20114SUMMAADD: TdxDBGridCurrencyColumn
          Sorted = csUp
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAADD'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAADD'
        end
        object dxDBGridYearVy20114SUMMAMP: TdxDBGridCurrencyColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAMP'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAMP'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAMP'
        end
        object dxDBGridYearVy20114SUMMAKASSA: TdxDBGridCurrencyColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAKASSA'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAKASSA'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryType = cstSum
          SummaryField = 'SUMMAKASSA'
        end
        object dxDBGridYearVy20114SUMMAPOD: TdxDBGridCurrencyColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAPOD'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAPOD'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryType = cstSum
          SummaryField = 'SUMMAPOD'
        end
        object dxDBGridYearVy20114SUMMAECB: TdxDBGridCurrencyColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAECB'
          SummaryFooterType = cstSum
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAECB'
        end
        object dxDBGridYearVy20114SUMMAECBN: TdxDBGridCurrencyColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAECBN'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAECBN'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryType = cstSum
          SummaryField = 'SUMMAECBN'
        end
        object dxDBGridYearVy20114SUMMAECBILL: TdxDBGridCurrencyColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAECBILL'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAECBILL'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryType = cstSum
          SummaryField = 'SUMMAECBILL'
        end
        object dxDBGridYearVy20114SUMMAECBDP: TdxDBGridCurrencyColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAECBDP'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAECBDP'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryField = 'SUMMAECBDP'
        end
        object dxDBGridYearVy20114SUMMAPROF: TdxDBGridCurrencyColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAPROF'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAPROF'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryType = cstSum
          SummaryField = 'SUMMAPROF'
        end
        object dxDBGridYearVy20114WS: TdxDBGridColumn
          Caption = #1042'.'#1089#1073#1086#1088
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAWS'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAWS'
          SummaryField = 'SUMMAWS'
        end
        object dxDBGridYearVy20114SUMMAKVYD: TdxDBGridCurrencyColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAKVYD'
          SummaryFooterType = cstSum
          SummaryFooterField = 'SUMMAKVYD'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
          SummaryType = cstSum
          SummaryField = 'SUMMAKVYD'
        end
      end
    end
  end
  object BitBtn2: TBitBtn
    Left = 656
    Top = 40
    Width = 161
    Height = 25
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 824
    Top = 40
    Width = 75
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 792
    Top = 8
    Width = 75
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100' '#1055
    TabOrder = 5
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 584
    Top = 40
    Width = 75
    Height = 25
    Caption = #1048#1079#1084'.'#1092#1072#1084'.'
    TabOrder = 6
    OnClick = BitBtn5Click
  end
  object pFIBDataSetVy: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select Fadd.ShifrId,Fadd.ShifrSta,Shifr.ShortName,FADD.Summa,FAd' +
        'd.Year_Za,Fadd.Month_Za,'
      'case when fadd.w_r=1 then '#39#1086#1089#1085#39' else '#39#1089#1074#1084#39' end as w_r,'
      'kateg.name as namekat,'
      'gruppy.name as namegru,'
      'Podr.ShifrPod,'
      
        '(select first 1 retval from pr_get_podr_name_hist(fadd.w_place,f' +
        'add.year_vy,fadd.month_vy)) name,'
      #39#1053#1072#1095#1080#1089#1083#1077#1085#1086#39' as code '
      'from FADD join'
      'shifr on FADD.ShifrSta=shifr.shifr '
      'join podr on FADD.W_Place=Podr.ShifrPod'
      'join kateg on kateg.shifr=fadd.shifrkat'
      'join gruppy on gruppy.shifr=fadd.shifrgru'
      
        'where FADD.Tabno=:Tabno and FADD.Year_Vy=:WantedYear and FADD.Mo' +
        'nth_Vy=:WantedMonth'
      'union'
      
        'select FUD.ShifrId,FUD.ShifrSta,Shifr.ShortName,FUD.Summa,FUD.Ye' +
        'ar_Za,FUD.Month_Za,'
      'case when FUD.w_r=1 then '#39#1086#1089#1085#39' else '#39#1089#1074#1084#39' end as w_r,'
      'kateg.name as namekat,'
      'gruppy.name as namegru,'
      'Podr.ShifrPod,'
      
        '(select first 1 retval from pr_get_podr_name_hist(fud.w_place,fu' +
        'd.year_vy,fud.month_vy)) name,'
      #39#1059#1076#1077#1088#1078#1072#1085#1086' '#39' as code'
      'from FUD join'
      'shifr on FUD.ShifrSta=shifr.shifr '
      'join podr on FUD.W_Place=Podr.ShifrPod'
      'join kateg on kateg.shifr=FUD.shifrkat'
      'join gruppy on gruppy.shifr=FUD.shifrgru'
      
        'where FUD.Tabno=:Tabno and FUD.Year_Vy=:WantedYear and FUD.Month' +
        '_Vy=:WantedMonth')
    AllowedUpdateKinds = []
    Transaction = pFIBTransactionVy
    Database = FIB.pFIBDatabaseArc
    Left = 60
    Top = 168
    object pFIBDataSetVySHIFRSTA: TFIBSmallIntField
      FieldName = 'SHIFRSTA'
    end
    object pFIBDataSetVySHORTNAME: TFIBStringField
      FieldName = 'SHORTNAME'
      Size = 256
      EmptyStrToNull = True
    end
    object pFIBDataSetVySUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetVyYEAR_ZA: TFIBSmallIntField
      FieldName = 'YEAR_ZA'
    end
    object pFIBDataSetVyMONTH_ZA: TFIBSmallIntField
      FieldName = 'MONTH_ZA'
    end
    object pFIBDataSetVySHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object pFIBDataSetVyNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 200
      EmptyStrToNull = True
    end
    object pFIBDataSetVyW_R: TFIBStringField
      FieldName = 'W_R'
      Size = 3
      EmptyStrToNull = True
    end
    object pFIBDataSetVyNAMEKAT: TFIBStringField
      FieldName = 'NAMEKAT'
      Size = 40
      EmptyStrToNull = True
    end
    object pFIBDataSetVyNAMEGRU: TFIBStringField
      FieldName = 'NAMEGRU'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSetVyCODE: TFIBStringField
      FieldName = 'CODE'
      Size = 9
      EmptyStrToNull = True
    end
    object pFIBDataSetVySHIFRPOD: TFIBIntegerField
      FieldName = 'SHIFRPOD'
    end
  end
  object DataSourceVy: TDataSource
    DataSet = pFIBDataSetVy
    Left = 60
    Top = 128
  end
  object pFIBDataSetZa: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select Fadd.ShifrId,Fadd.ShifrSta,Shifr.ShortName,FADD.Summa,FAd' +
        'd.Year_Vy,Fadd.Month_Vy,'
      'case when fadd.w_r=1 then '#39#1086#1089#1085#39' else '#39#1089#1074#1084#39' end as w_r,'
      'kateg.name as namekat,'
      'gruppy.name as namegru,'
      'Podr.ShifrPod,'
      
        '(select first 1 retval from pr_get_podr_name_hist(fadd.w_place,f' +
        'add.year_vy,fadd.month_vy)) name,'
      #39#1053#1072#1095#1080#1089#1083#1077#1085#1086#39' as code '
      'from FADD join'
      'shifr on FADD.ShifrSta=shifr.shifr '
      'join podr on FADD.W_Place=Podr.ShifrPod'
      'join kateg on kateg.shifr=fadd.shifrkat'
      'join gruppy on gruppy.shifr=fadd.shifrgru'
      
        'where FADD.Tabno=:Tabno and FADD.Year_Za=:WantedYear and FADD.Mo' +
        'nth_Za=:WantedMonth'
      'union'
      
        'select FUD.ShifrId,FUD.ShifrSta,Shifr.ShortName,FUD.Summa,FUD.Ye' +
        'ar_Vy,FUD.Month_Vy,'
      'case when FUD.w_r=1 then '#39#1086#1089#1085#39' else '#39#1089#1074#1084#39' end as w_r,'
      'kateg.name as namekat,'
      'gruppy.name as namegru,'
      'Podr.ShifrPod,'
      
        '(select first 1 retval from pr_get_podr_name_hist(fud.w_place,fu' +
        'd.year_vy,fud.month_vy)) name,'
      #39#1059#1076#1077#1088#1078#1072#1085#1086' '#39' as code'
      'from FUD join'
      'shifr on FUD.ShifrSta=shifr.shifr '
      'join podr on FUD.W_Place=Podr.ShifrPod'
      'join kateg on kateg.shifr=FUD.shifrkat'
      'join gruppy on gruppy.shifr=FUD.shifrgru'
      
        'where FUD.Tabno=:Tabno and FUD.Year_Za=:WantedYear and FUD.Month' +
        '_Za=:WantedMonth')
    Transaction = pFIBTransactionZa
    Database = FIB.pFIBDatabaseArc
    AutoCommit = True
    Left = 124
    Top = 167
    object pFIBDataSetZaSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object pFIBDataSetZaSHIFRSTA: TFIBSmallIntField
      FieldName = 'SHIFRSTA'
    end
    object pFIBDataSetZaSHORTNAME: TFIBStringField
      FieldName = 'SHORTNAME'
      EmptyStrToNull = True
    end
    object pFIBDataSetZaSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetZaW_R: TFIBStringField
      FieldName = 'W_R'
      Size = 3
      EmptyStrToNull = True
    end
    object pFIBDataSetZaNAMEKAT: TFIBStringField
      FieldName = 'NAMEKAT'
      Size = 40
      EmptyStrToNull = True
    end
    object pFIBDataSetZaNAMEGRU: TFIBStringField
      FieldName = 'NAMEGRU'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSetZaNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 200
      EmptyStrToNull = True
    end
    object pFIBDataSetZaCODE: TFIBStringField
      FieldName = 'CODE'
      Size = 9
      EmptyStrToNull = True
    end
    object pFIBDataSetZaYEAR_VY: TFIBSmallIntField
      FieldName = 'YEAR_VY'
    end
    object pFIBDataSetZaMONTH_VY: TFIBSmallIntField
      FieldName = 'MONTH_VY'
    end
    object pFIBDataSetZaSHIFRPOD: TFIBIntegerField
      FieldName = 'SHIFRPOD'
    end
  end
  object DataSourceZa: TDataSource
    DataSet = pFIBDataSetZa
    Left = 124
    Top = 127
  end
  object pFIBDataSetYearVy: TpFIBDataSet
    SelectSQL.Strings = (
      'select MONTH_VY, SUMMAADD,SUMMAMP,SUMMAKASSA,'
      '       SUMMAPOD,SUMMAPENS,SUMMASS,SUMMAFZ,SUMMAPROF,'
      '       SUMMAWS,SUMMAKVYD '
      'from ArcYearVy(:Tabno,:Y)')
    Transaction = pFIBTransactionYearVy
    Database = FIB.pFIBDatabaseArc
    AutoCommit = True
    Left = 180
    Top = 167
    object pFIBDataSetYearVyMONTH_VY: TFIBIntegerField
      FieldName = 'MONTH_VY'
    end
    object pFIBDataSetYearVySUMMAADD: TFIBBCDField
      FieldName = 'SUMMAADD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVySUMMAMP: TFIBBCDField
      FieldName = 'SUMMAMP'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVySUMMAKASSA: TFIBBCDField
      FieldName = 'SUMMAKASSA'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVySUMMAPOD: TFIBBCDField
      FieldName = 'SUMMAPOD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVySUMMAPENS: TFIBBCDField
      FieldName = 'SUMMAPENS'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVySUMMASS: TFIBBCDField
      FieldName = 'SUMMASS'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVySUMMAFZ: TFIBBCDField
      FieldName = 'SUMMAFZ'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVySUMMAPROF: TFIBBCDField
      FieldName = 'SUMMAPROF'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVySUMMAWS: TFIBBCDField
      FieldName = 'SUMMAWS'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVySUMMAKVYD: TFIBBCDField
      FieldName = 'SUMMAKVYD'
      Size = 2
      RoundByScale = True
    end
  end
  object DataSourceYearVy: TDataSource
    DataSet = pFIBDataSetYearVy
    Left = 180
    Top = 127
  end
  object pFIBDataSetYearZa: TpFIBDataSet
    SelectSQL.Strings = (
      'select MONTH_ZA, SUMMAADD,SUMMAMP,SUMMAKASSA,'
      '       SUMMAPOD,SUMMAPENS,SUMMASS,SUMMAFZ,SUMMAPROF,'
      '       SUMMAWS,SUMMAKVYD '
      'from ArcYearZa(:Tabno,:Y)')
    Transaction = pFIBTransactionYearZa
    Database = FIB.pFIBDatabaseArc
    AutoCommit = True
    Left = 228
    Top = 167
    object pFIBDataSetYearZaMONTH_ZA: TFIBIntegerField
      FieldName = 'MONTH_ZA'
    end
    object pFIBDataSetYearZaSUMMAADD: TFIBBCDField
      FieldName = 'SUMMAADD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearZaSUMMAMP: TFIBBCDField
      FieldName = 'SUMMAMP'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearZaSUMMAKASSA: TFIBBCDField
      FieldName = 'SUMMAKASSA'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearZaSUMMAPOD: TFIBBCDField
      FieldName = 'SUMMAPOD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearZaSUMMAPENS: TFIBBCDField
      FieldName = 'SUMMAPENS'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearZaSUMMASS: TFIBBCDField
      FieldName = 'SUMMASS'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearZaSUMMAFZ: TFIBBCDField
      FieldName = 'SUMMAFZ'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearZaSUMMAPROF: TFIBBCDField
      FieldName = 'SUMMAPROF'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearZaSUMMAKVYD: TFIBBCDField
      FieldName = 'SUMMAKVYD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearZaSUMMAWS: TFIBBCDField
      FieldName = 'SUMMAWS'
      Size = 2
      RoundByScale = True
    end
  end
  object DataSourceYearZa: TDataSource
    DataSet = pFIBDataSetYearZa
    Left = 228
    Top = 127
  end
  object pFIBTransactionVy: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseArc
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 60
    Top = 207
  end
  object pFIBTransactionZa: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseArc
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 124
    Top = 207
  end
  object pFIBTransactionYearVy: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseArc
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 180
    Top = 207
  end
  object pFIBTransactionYearZa: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseArc
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 228
    Top = 207
  end
  object pFIBDataSetYearVy11: TpFIBDataSet
    SelectSQL.Strings = (
      'select MONTH_VY, SUMMAADD,SUMMAMP,SUMMAKASSA,'
      '       SUMMAPOD,SUMMAECB,SUMMAECBN,SUMMAECBILL,'
      '       SUMMAECBDP,SUMMAPROF,SUMMAWS,SUMMAKVYD '
      'from ArcYearVy11(:Tabno,:Y)')
    AllowedUpdateKinds = []
    Transaction = pFIBTransactionYearVy11
    Database = FIB.pFIBDatabaseArc
    Left = 268
    Top = 167
    object pFIBDataSetYearVy11MONTH_VY: TFIBIntegerField
      FieldName = 'MONTH_VY'
    end
    object pFIBDataSetYearVy11SUMMAADD: TFIBBCDField
      FieldName = 'SUMMAADD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVy11SUMMAMP: TFIBBCDField
      FieldName = 'SUMMAMP'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVy11SUMMAKASSA: TFIBBCDField
      FieldName = 'SUMMAKASSA'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVy11SUMMAPOD: TFIBBCDField
      FieldName = 'SUMMAPOD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVy11SUMMAECB: TFIBBCDField
      FieldName = 'SUMMAECB'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVy11SUMMAECBN: TFIBBCDField
      FieldName = 'SUMMAECBN'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVy11SUMMAECBILL: TFIBBCDField
      FieldName = 'SUMMAECBILL'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVy11SUMMAECBDP: TFIBBCDField
      FieldName = 'SUMMAECBDP'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVy11SUMMAPROF: TFIBBCDField
      FieldName = 'SUMMAPROF'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVy11SUMMAKVYD: TFIBBCDField
      FieldName = 'SUMMAKVYD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVy11SUMMAWS: TFIBBCDField
      FieldName = 'SUMMAWS'
      Size = 2
      RoundByScale = True
    end
  end
  object pFIBDataSetYearZa11: TpFIBDataSet
    SelectSQL.Strings = (
      'select MONTH_ZA, SUMMAADD,SUMMAMP,SUMMAKASSA,'
      '       SUMMAPOD,SUMMAECB,SUMMAECBN,SUMMAECBILL,'
      '       SUMMAECBDP,SUMMAPROF,SUMMAWS,SUMMAKVYD '
      'from ArcYearZa11(:Tabno,:Y)')
    Transaction = pFIBTransactionYearZa11
    Database = FIB.pFIBDatabaseArc
    Left = 308
    Top = 167
    object pFIBDataSetYearZa11MONTH_ZA: TFIBIntegerField
      FieldName = 'MONTH_ZA'
    end
    object pFIBDataSetYearZa11SUMMAADD: TFIBBCDField
      FieldName = 'SUMMAADD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearZa11SUMMAMP: TFIBBCDField
      FieldName = 'SUMMAMP'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearZa11SUMMAKASSA: TFIBBCDField
      FieldName = 'SUMMAKASSA'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearZa11SUMMAPOD: TFIBBCDField
      FieldName = 'SUMMAPOD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearZa11SUMMAECB: TFIBBCDField
      FieldName = 'SUMMAECB'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearZa11SUMMAECBN: TFIBBCDField
      FieldName = 'SUMMAECBN'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearZa11SUMMAECBILL: TFIBBCDField
      FieldName = 'SUMMAECBILL'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearZa11SUMMAECBDP: TFIBBCDField
      FieldName = 'SUMMAECBDP'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearZa11SUMMAPROF: TFIBBCDField
      FieldName = 'SUMMAPROF'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearZa11SUMMAKVYD: TFIBBCDField
      FieldName = 'SUMMAKVYD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearZa11SUMMAWS: TFIBBCDField
      FieldName = 'SUMMAWS'
      Size = 2
      RoundByScale = True
    end
  end
  object pFIBTransactionYearVy11: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseArc
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 268
    Top = 207
  end
  object pFIBTransactionYearZa11: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseArc
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 308
    Top = 207
  end
  object DataSourceYearVy11: TDataSource
    DataSet = pFIBDataSetYearVy11
    Left = 268
    Top = 127
  end
  object DataSourceYearZa11: TDataSource
    DataSet = pFIBDataSetYearZa11
    Left = 308
    Top = 127
  end
  object DataSource20114v: TDataSource
    DataSet = pFIBDataSetYearVy114
    Left = 356
    Top = 127
  end
  object pFIBDataSetYearVy114: TpFIBDataSet
    SelectSQL.Strings = (
      'select MONTH_VY, SUMMAADD,SUMMAMP,SUMMAKASSA,'
      '       SUMMAPOD,SUMMAECB,SUMMAECBN,SUMMAECBILL,'
      '       SUMMAECBDP,SUMMAPROF,SUMMAWS,SUMMAKVYD '
      'from ArcYearVy1104(:Tabno,:Y)'
      'order by 1')
    AllowedUpdateKinds = []
    Transaction = pFIBTransaction20114v
    Database = FIB.pFIBDatabaseArc
    Left = 356
    Top = 167
    object pFIBDataSetYearVy114MONTH_VY: TFIBIntegerField
      DisplayLabel = #1052'-'#1094
      FieldName = 'MONTH_VY'
      ReadOnly = True
    end
    object pFIBDataSetYearVy114SUMMAADD: TFIBBCDField
      DisplayLabel = #1053#1072#1095#1080#1089#1083
      FieldName = 'SUMMAADD'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVy114SUMMAMP: TFIBBCDField
      DisplayLabel = #1052'.'#1087#1086#1084'.'
      FieldName = 'SUMMAMP'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVy114SUMMAKASSA: TFIBBCDField
      DisplayLabel = #1042#1085#1077#1089' '#1074' '#1082
      FieldName = 'SUMMAKASSA'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVy114SUMMAPOD: TFIBBCDField
      DisplayLabel = #1053#1072#1083' '#1089' '#1076#1086#1093
      FieldName = 'SUMMAPOD'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVy114SUMMAECB: TFIBBCDField
      DisplayLabel = #1045#1057#1042
      FieldName = 'SUMMAECB'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVy114SUMMAECBN: TFIBBCDField
      DisplayLabel = #1045#1057#1042' '#1053
      FieldName = 'SUMMAECBN'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVy114SUMMAECBILL: TFIBBCDField
      DisplayLabel = #1045#1057#1042' '#1083#1110#1082
      FieldName = 'SUMMAECBILL'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVy114SUMMAECBDP: TFIBBCDField
      DisplayLabel = #1045#1057#1042' '#1062#1055#1061
      FieldName = 'SUMMAECBDP'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVy114SUMMAPROF: TFIBBCDField
      DisplayLabel = #1055#1088#1086#1092
      FieldName = 'SUMMAPROF'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVy114SUMMAKVYD: TFIBBCDField
      DisplayLabel = #1044#1086' '#1074#1080#1076'.'
      FieldName = 'SUMMAKVYD'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYearVy114SUMMAWS: TFIBBCDField
      FieldName = 'SUMMAWS'
      Size = 2
      RoundByScale = True
    end
  end
  object pFIBTransaction20114v: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseArc
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 356
    Top = 207
  end
  object PopupMenu1: TPopupMenu
    Left = 468
    Top = 199
    object N1: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1073#1077#1079' '#1103#1085#1074' '#1080' '#1092#1074#1088' '#1076#1083#1103' '#1050#1056#1059
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1048#1089#1090#1086#1088#1080#1103' '#1080#1079#1084#1077#1085#1077#1085#1077#1085#1080#1103' '#1092#1072#1084#1080#1083#1080#1081
      OnClick = N2Click
    end
  end
end
