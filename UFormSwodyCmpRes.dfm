object FormSwodyCmpRes: TFormSwodyCmpRes
  Left = 189
  Top = 127
  Width = 807
  Height = 546
  Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1072#1085#1072#1083#1080#1079#1072' '#1085#1077#1089#1086#1074#1087#1072#1076#1077#1085#1080#1081' '#1089#1074#1086#1076#1086#1074
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
    791
    508)
  PixelsPerInch = 96
  TextHeight = 20
  object PageControl: TPageControl
    Left = 8
    Top = 8
    Width = 777
    Height = 481
    ActivePage = TabSheetUd
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabSheetAdd: TTabSheet
      Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103
      DesignSize = (
        769
        446)
      object dxDBGridAdd: TdxDBGrid
        Left = 8
        Top = 0
        Width = 761
        Height = 441
        Bands = <
          item
            Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
            Fixed = bfLeft
            Width = 229
          end
          item
            Caption = #1053#1086#1074#1099#1081' '#1089#1074#1086#1076
            Width = 234
          end
          item
            Caption = #1057#1090#1072#1088#1099#1081' '#1089#1074#1086#1076
            Fixed = bfRight
            Width = 262
          end>
        DefaultLayout = False
        HeaderPanelRowCount = 1
        KeyField = 'ShifrIdCalc'
        ShowSummaryFooter = True
        SummaryGroups = <
          item
            DefaultGroup = False
            SummaryItems = <
              item
                ColumnName = 'dxDBGridAddSUMMAFR'
                SummaryField = 'SUMMAFR'
                SummaryFormat = '0.##'
                SummaryType = cstSum
              end
              item
                ColumnName = 'dxDBGridAddSUMMATO'
                SummaryField = 'SUMMATO'
                SummaryFormat = '0.##'
                SummaryType = cstSum
              end
              item
                ColumnName = 'dxDBGridAddNMBOFRECFR'
                SummaryField = 'NMBOFRECFR'
                SummaryFormat = '0'
                SummaryType = cstSum
              end
              item
                ColumnName = 'dxDBGridAddNMBOFRECTO'
                SummaryField = 'NMBOFRECTO'
                SummaryFormat = '0'
                SummaryType = cstSum
              end>
            Name = 'dxDBGridAddSummaryGroup2'
          end>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceAdd
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
        ShowBands = True
        ShowRowFooter = True
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridAddSHIFRSTA: TdxDBGridMaskColumn
          HeaderAlignment = taCenter
          Sorted = csUp
          Visible = False
          Width = 112
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRSTA'
          GroupIndex = 0
          SummaryGroupName = 'dxDBGridAddSummaryGroup2'
        end
        object dxDBGridAddNAMESTA: TdxDBGridMaskColumn
          HeaderAlignment = taCenter
          Visible = False
          Width = 367
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAMESTA'
        end
        object dxDBGridAddStaName: TdxDBGridColumn
          Caption = #1057#1090#1072#1090#1100#1103
          HeaderAlignment = taCenter
          Width = 432
          BandIndex = 0
          RowIndex = 0
          FieldName = 'STANAME'
        end
        object dxDBGridAddSHIFRPOD: TdxDBGridMaskColumn
          HeaderAlignment = taCenter
          Width = 119
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRPOD'
        end
        object dxDBGridAddNMBOFRECFR: TdxDBGridMaskColumn
          HeaderAlignment = taCenter
          Width = 106
          BandIndex = 1
          RowIndex = 0
          FieldName = 'NMBOFRECFR'
        end
        object dxDBGridAddPERIOD: TdxDBGridMaskColumn
          HeaderAlignment = taCenter
          Width = 110
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PERIOD'
        end
        object dxDBGridAddSUMMAFR: TdxDBGridCurrencyColumn
          HeaderAlignment = taCenter
          Width = 128
          BandIndex = 1
          RowIndex = 0
          FieldName = 'SUMMAFR'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
        end
        object dxDBGridAddNMBOFRECTO: TdxDBGridMaskColumn
          HeaderAlignment = taCenter
          Width = 127
          BandIndex = 2
          RowIndex = 0
          FieldName = 'NMBOFRECTO'
        end
        object dxDBGridAddSUMMATO: TdxDBGridCurrencyColumn
          HeaderAlignment = taCenter
          Sorted = csUp
          Width = 135
          BandIndex = 2
          RowIndex = 0
          FieldName = 'SUMMATO'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
        end
        object dxDBGridAddMODE: TdxDBGridMaskColumn
          Visible = False
          Width = 129
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MODE'
        end
        object dxDBGridAddShifrIdCalc: TdxDBGridColumn
          Visible = False
          Width = 129
          BandIndex = 0
          RowIndex = 0
          FieldName = 'ShifrIdCalc'
        end
      end
    end
    object TabSheetUd: TTabSheet
      Caption = #1059#1076#1077#1088#1078#1072#1085#1080#1103
      ImageIndex = 1
      DesignSize = (
        769
        446)
      object dxDBGridUd: TdxDBGrid
        Left = 0
        Top = 0
        Width = 769
        Height = 441
        Bands = <
          item
            Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
            Width = 420
          end
          item
            Caption = #1053#1086#1074#1099#1081' '#1089#1074#1086#1076
            Width = 173
          end
          item
            Caption = #1057#1090#1072#1088#1099#1081' '#1089#1074#1086#1076
            Width = 172
          end>
        DefaultLayout = False
        HeaderPanelRowCount = 1
        KeyField = 'ShifrIdCalc'
        ShowSummaryFooter = True
        SummaryGroups = <
          item
            DefaultGroup = False
            SummaryItems = <
              item
                ColumnName = 'dxDBGridUdSUMMATO'
                SummaryField = 'SUMMATO'
                SummaryFormat = '0.##'
                SummaryType = cstSum
              end
              item
                ColumnName = 'dxDBGridUdSUMMAFR'
                SummaryField = 'SUMMAFR'
                SummaryFormat = '0.##'
                SummaryType = cstSum
              end
              item
                ColumnName = 'dxDBGridUdNMBOFRECTO'
                SummaryField = 'NMBOFRECTO'
                SummaryFormat = '0'
                SummaryType = cstSum
              end
              item
                ColumnName = 'dxDBGridUdNMBOFRECFR'
                SummaryField = 'NMBOFRECFR'
                SummaryFormat = '0'
                SummaryType = cstSum
              end>
            Name = 'dxDBGridUdSummaryGroup2'
          end>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceUd
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
        ShowBands = True
        ShowRowFooter = True
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridUdSHIFRSTA: TdxDBGridMaskColumn
          HeaderAlignment = taCenter
          Sorted = csUp
          Visible = False
          Width = 101
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRSTA'
          GroupIndex = 0
          SummaryGroupName = 'dxDBGridUdSummaryGroup2'
        end
        object dxDBGridUdNAMESTA: TdxDBGridMaskColumn
          HeaderAlignment = taCenter
          Visible = False
          Width = 486
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAMESTA'
        end
        object dxDBGridUdStaName: TdxDBGridColumn
          Caption = #1057#1090#1072#1090#1100#1103
          HeaderAlignment = taCenter
          Width = 254
          BandIndex = 0
          RowIndex = 0
          FieldName = 'STANAME'
        end
        object dxDBGridUdSHIFRPOD: TdxDBGridMaskColumn
          HeaderAlignment = taCenter
          Width = 82
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRPOD'
        end
        object dxDBGridUdPERIOD: TdxDBGridMaskColumn
          HeaderAlignment = taCenter
          Width = 84
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PERIOD'
        end
        object dxDBGridUdNMBOFRECFR: TdxDBGridMaskColumn
          HeaderAlignment = taCenter
          Width = 87
          BandIndex = 1
          RowIndex = 0
          FieldName = 'NMBOFRECFR'
        end
        object dxDBGridUdSUMMAFR: TdxDBGridCurrencyColumn
          HeaderAlignment = taCenter
          Width = 86
          BandIndex = 1
          RowIndex = 0
          FieldName = 'SUMMAFR'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
        end
        object dxDBGridUdNMBOFRECTO: TdxDBGridMaskColumn
          HeaderAlignment = taCenter
          Width = 86
          BandIndex = 2
          RowIndex = 0
          FieldName = 'NMBOFRECTO'
        end
        object dxDBGridUdSUMMATO: TdxDBGridCurrencyColumn
          HeaderAlignment = taCenter
          Width = 86
          BandIndex = 2
          RowIndex = 0
          FieldName = 'SUMMATO'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
        end
        object dxDBGridUdMODE: TdxDBGridMaskColumn
          Visible = False
          Width = 101
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MODE'
        end
        object dxDBGridUdShifrIdCalc: TdxDBGridColumn
          Visible = False
          Width = 101
          BandIndex = 0
          RowIndex = 0
          FieldName = 'ShifrIdCalc'
        end
      end
    end
  end
  object DataSourceAdd: TDataSource
    DataSet = pFIBDataSetAdd
    Left = 128
    Top = 40
  end
  object DataSourceUd: TDataSource
    DataSet = pFIBDataSetUd
    Left = 128
    Top = 80
  end
  object pFIBDataSetAdd: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select a.shifrsta,a.namesta, a.shifrpod,a.period, a.nmbofrecfr,a' +
        '.summafr,a.nmbofrecto,a.summato,b.mode from pr_swody_cmp(:fr,:to' +
        ') a'
      'join shifr b on b.shifr=a.shifrsta'
      'where b.mode=1'
      'order by 1,4,3')
    OnCalcFields = pFIBDataSetAddCalcFields
    Transaction = pFIBTrAddRead
    Database = FIB.pFIBDatabaseSal
    Left = 32
    Top = 40
    object pFIBDataSetAddSHIFRSTA: TFIBIntegerField
      DisplayLabel = #1064#1092#1088
      FieldName = 'SHIFRSTA'
    end
    object pFIBDataSetAddNAMESTA: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAMESTA'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBDataSetAddSHIFRPOD: TFIBIntegerField
      DisplayLabel = #1055#1076#1088
      FieldName = 'SHIFRPOD'
    end
    object pFIBDataSetAddPERIOD: TFIBIntegerField
      DisplayLabel = #1052#1094
      FieldName = 'PERIOD'
    end
    object pFIBDataSetAddNMBOFRECFR: TFIBIntegerField
      DisplayLabel = #1050'-'#1074#1086' '#1085'.'
      FieldName = 'NMBOFRECFR'
    end
    object pFIBDataSetAddSUMMAFR: TFIBBCDField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1085'.'
      FieldName = 'SUMMAFR'
      DisplayFormat = '######.##'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetAddNMBOFRECTO: TFIBIntegerField
      DisplayLabel = #1050'-'#1074#1086' '#1089'.'
      FieldName = 'NMBOFRECTO'
    end
    object pFIBDataSetAddSUMMATO: TFIBBCDField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1089'.'
      FieldName = 'SUMMATO'
      DisplayFormat = '########.##'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetAddMODE: TFIBSmallIntField
      FieldName = 'MODE'
      Visible = False
    end
    object pFIBDataSetAddShifrIdCalc: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ShifrIdCalc'
      Calculated = True
    end
    object pFIBDataSetAddSTANAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'STANAME'
      Size = 40
      Calculated = True
    end
  end
  object pFIBDataSetUd: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select a.shifrsta,a.namesta, a.shifrpod,a.period, a.nmbofrecfr,a' +
        '.summafr,a.nmbofrecto,a.summato,b.mode from pr_swody_cmp(:fr,:to' +
        ') a'
      'join shifr b on b.shifr=a.shifrsta'
      'where b.mode=0'
      'order by 1,4,3')
    OnCalcFields = pFIBDataSetUdCalcFields
    Transaction = pFIBTUdRead
    Database = FIB.pFIBDatabaseSal
    Left = 32
    Top = 80
    object pFIBDataSetUdSHIFRSTA: TFIBIntegerField
      DisplayLabel = #1064#1092#1088
      FieldName = 'SHIFRSTA'
    end
    object pFIBDataSetUdNAMESTA: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAMESTA'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBDataSetUdSHIFRPOD: TFIBIntegerField
      DisplayLabel = #1055#1076#1088
      FieldName = 'SHIFRPOD'
    end
    object pFIBDataSetUdPERIOD: TFIBIntegerField
      DisplayLabel = #1052#1094
      FieldName = 'PERIOD'
    end
    object pFIBDataSetUdNMBOFRECFR: TFIBIntegerField
      DisplayLabel = #1050'-'#1074#1086' '#1085'.'
      FieldName = 'NMBOFRECFR'
    end
    object pFIBDataSetUdSUMMAFR: TFIBBCDField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1085'.'
      FieldName = 'SUMMAFR'
      DisplayFormat = '#######.##'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetUdNMBOFRECTO: TFIBIntegerField
      DisplayLabel = #1050'-'#1074#1086' '#1089'.'
      FieldName = 'NMBOFRECTO'
    end
    object pFIBDataSetUdSUMMATO: TFIBBCDField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1089'.'
      FieldName = 'SUMMATO'
      DisplayFormat = '######.##'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetUdMODE: TFIBSmallIntField
      FieldName = 'MODE'
      Visible = False
    end
    object pFIBDataSetUdShifrIdCalc: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ShifrIdCalc'
      Visible = False
      Calculated = True
    end
    object pFIBDataSetUdSTANAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'STANAME'
      Size = 40
      Calculated = True
    end
  end
  object pFIBTrAddRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 80
    Top = 40
  end
  object pFIBTUdRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 80
    Top = 80
  end
end
