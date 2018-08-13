object FormSumLimit: TFormSumLimit
  Left = 348
  Top = 183
  Width = 509
  Height = 480
  Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1085#1072' '#1084#1072#1082#1089'. '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
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
    493
    442)
  PixelsPerInch = 96
  TextHeight = 20
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 8
    Width = 177
    Height = 28
    Date = 41724.878210358790000000
    Time = 41724.878210358790000000
    DateFormat = dfLong
    TabOrder = 0
  end
  object Button1: TButton
    Left = 192
    Top = 8
    Width = 153
    Height = 25
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
    TabOrder = 1
    OnClick = Button1Click
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 48
    Width = 481
    Height = 377
    ActivePage = TabSheetCDS2011
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object TabSheetZa: TTabSheet
      Caption = #1044#1072#1090#1072' '#1079#1072
      DesignSize = (
        473
        342)
      object dxDBGridZa: TdxDBGrid
        Left = 3
        Top = 8
        Width = 462
        Height = 329
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'TN'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = dsoZa
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridZaTN: TdxDBGridMaskColumn
          Width = 66
          BandIndex = 0
          RowIndex = 0
          FieldName = 'TN'
        end
        object dxDBGridZaFIO: TdxDBGridMaskColumn
          Width = 246
          BandIndex = 0
          RowIndex = 0
          FieldName = 'FIO'
        end
        object dxDBGridZaSZA: TdxDBGridCurrencyColumn
          Width = 146
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SZA'
          DisplayFormat = ',0.00'
          Nullable = False
        end
      end
    end
    object TabSheetVy: TTabSheet
      Caption = #1044#1072#1090#1072' '#1074
      ImageIndex = 1
      DesignSize = (
        473
        342)
      object dxDBGridVy: TdxDBGrid
        Left = 0
        Top = 0
        Width = 473
        Height = 337
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'TN'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = dsoVY
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridVyTN: TdxDBGridMaskColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'TN'
        end
        object dxDBGridVyFIO: TdxDBGridMaskColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'FIO'
        end
        object dxDBGridVySZA: TdxDBGridCurrencyColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SZA'
          DisplayFormat = ',0.00'
          Nullable = False
        end
      end
    end
    object TabSheetVy2011: TTabSheet
      Caption = #1042' '#1089' 2011'
      ImageIndex = 2
      object dxDBGridVy2011: TdxDBGrid
        Left = 0
        Top = 13
        Width = 473
        Height = 329
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'TABNO'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = dso2011
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
        object dxDBGridVy2011TABNO: TdxDBGridMaskColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'TABNO'
        end
        object dxDBGridVy2011FIO: TdxDBGridMaskColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'FIO'
        end
        object dxDBGridVy2011SUMMA: TdxDBGridCurrencyColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMA'
          DisplayFormat = ',0.00'
          Nullable = False
        end
      end
    end
    object TabSheetCDSVY: TTabSheet
      Caption = 'CDS '#1044#1072#1090#1072' '#1074
      ImageIndex = 3
      DesignSize = (
        473
        342)
      object dxDBGridCDSVy: TdxDBGrid
        Left = 0
        Top = 8
        Width = 473
        Height = 321
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'Tabno'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = dsoCDSVy
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridCDSVyTabno: TdxDBGridMaskColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'Tabno'
        end
        object dxDBGridCDSVyFIO: TdxDBGridMaskColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'FIO'
        end
        object dxDBGridCDSVySumma: TdxDBGridMaskColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'Summa'
        end
      end
    end
    object TabSheetCDSZa: TTabSheet
      Caption = 'CDS '#1044#1072#1090#1072' '#1079#1072
      ImageIndex = 4
      DesignSize = (
        473
        342)
      object dxDBGridCDSZa: TdxDBGrid
        Left = 0
        Top = 0
        Width = 473
        Height = 337
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'Tabno'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = dsoCDSZa
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridCDSZaTabno: TdxDBGridMaskColumn
          Width = 69
          BandIndex = 0
          RowIndex = 0
          FieldName = 'Tabno'
        end
        object dxDBGridCDSZaFIO: TdxDBGridMaskColumn
          Width = 249
          BandIndex = 0
          RowIndex = 0
          FieldName = 'FIO'
        end
        object dxDBGridCDSZaSummy: TdxDBGridMaskColumn
          Width = 151
          BandIndex = 0
          RowIndex = 0
          FieldName = 'Summy'
        end
      end
    end
    object TabSheetCDS2011: TTabSheet
      Caption = 'CDS '#1089' 2011'
      ImageIndex = 5
      DesignSize = (
        473
        342)
      object dxDBGridCDS2011: TdxDBGrid
        Left = 0
        Top = 0
        Width = 473
        Height = 337
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'Tabno'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = dsoCDS2011
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridCDS2011Tabno: TdxDBGridMaskColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'Tabno'
        end
        object dxDBGridCDS2011FIO: TdxDBGridMaskColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'FIO'
        end
        object dxDBGridCDS2011Summa: TdxDBGridMaskColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'Summa'
        end
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 352
    Top = 8
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 3
    Visible = False
    OnClick = BitBtn1Click
  end
  object pFIBdsZa: TpFIBDataSet
    SelectSQL.Strings = (
      'select tn,fio,sza from'
      '('
      'select a.tabno tn,a.fio fio,coalesce(('
      
        'select sum(coalesce(b.summa,0.00)) from fadd b where b.tabno=a.t' +
        'abno and b.year_za=:y and b.month_za=:m'
      '),0.00) sza from kadry a'
      'group by 1,2'
      ')'
      
        'where sza>(select first 1  c.minsal from sslimity c where  c.dat' +
        'efr<:dateFr'
      'order by c.datefr desc)*15')
    Transaction = pFIBtrZa
    Database = FIB.pFIBDatabaseSal
    Left = 56
    Top = 152
    object pFIBdsZaTN: TFIBIntegerField
      DisplayLabel = #1058#1072#1073'.'#1085#1086#1084'.'
      FieldName = 'TN'
    end
    object pFIBdsZaFIO: TFIBStringField
      DisplayLabel = #1060#1048#1054
      FieldName = 'FIO'
      Size = 51
      EmptyStrToNull = True
    end
    object pFIBdsZaSZA: TFIBBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SZA'
      DisplayFormat = '#.00'
      Size = 2
      RoundByScale = True
    end
  end
  object pFIBdsVy: TpFIBDataSet
    SelectSQL.Strings = (
      'select tn,fio,sza from'
      '('
      'select a.tabno tn,a.fio fio,coalesce(('
      
        'select sum(coalesce(b.summa,0.00)) from fadd b where b.tabno=a.t' +
        'abno and b.year_vy=:y and b.month_vy=:m'
      '),0.00) sza from kadry a'
      'group by 1,2'
      ')'
      
        'where sza>(select first 1  c.minsal from sslimity c where  c.dat' +
        'efr<:dateFr'
      'order by c.datefr desc)*15')
    Transaction = pFIBtrVy
    Database = FIB.pFIBDatabaseSal
    Left = 168
    Top = 152
    object pFIBdsVyTN: TFIBIntegerField
      DisplayLabel = #1058#1072#1073'.'#1085#1086#1084'.'
      FieldName = 'TN'
    end
    object pFIBdsVyFIO: TFIBStringField
      DisplayLabel = #1060#1048#1054
      FieldName = 'FIO'
      Size = 51
      EmptyStrToNull = True
    end
    object pFIBdsVySZA: TFIBBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SZA'
      DisplayFormat = '#.00'
      Size = 2
      RoundByScale = True
    end
  end
  object pFIBtrZa: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 88
    Top = 152
  end
  object pFIBtrVy: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 208
    Top = 152
  end
  object dsoZa: TDataSource
    DataSet = pFIBdsZa
    Left = 120
    Top = 152
  end
  object dsoVY: TDataSource
    DataSet = pFIBdsVy
    Left = 248
    Top = 152
  end
  object pFIBds2011: TpFIBDataSet
    SelectSQL.Strings = (
      'select tabno,fio,summa from pr_gt_limit_2014(:y,:m,:datefr)')
    Transaction = pFIBTr2011
    Database = FIB.pFIBDatabaseSal
    Left = 52
    Top = 199
    object pFIBds2011TABNO: TFIBIntegerField
      DisplayLabel = #1058#1072#1073'.'#1085#1086#1084'.'
      FieldName = 'TABNO'
    end
    object pFIBds2011FIO: TFIBStringField
      DisplayLabel = #1060#1048#1054
      FieldName = 'FIO'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBds2011SUMMA: TFIBBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
  end
  object pFIBTr2011: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 92
    Top = 199
  end
  object dso2011: TDataSource
    DataSet = pFIBds2011
    Left = 124
    Top = 199
  end
  object CDSVy: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Tabno'
        DataType = ftInteger
      end
      item
        Name = 'FIO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Summa'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 308
    Top = 191
    Data = {
      4E0000009619E0BD0100000018000000030000000000030000004E0005546162
      6E6F04000100000000000346494F010049000000010005574944544802000200
      32000553756D6D6108000400000000000000}
    object CDSVyTabno: TIntegerField
      DisplayLabel = #1058#1072#1073'.'#1085#1086#1084#1077#1088
      FieldName = 'Tabno'
    end
    object CDSVyFIO: TStringField
      DisplayLabel = #1060#1048#1054
      FieldName = 'FIO'
      Size = 50
    end
    object CDSVySumma: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'Summa'
      DisplayFormat = '0.00'
    end
  end
  object dsoCDSVy: TDataSource
    DataSet = CDSVy
    Left = 340
    Top = 191
  end
  object CDSZa: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Tabno'
        DataType = ftInteger
      end
      item
        Name = 'FIO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Summy'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 308
    Top = 231
    Data = {
      4E0000009619E0BD0100000018000000030000000000030000004E0005546162
      6E6F04000100000000000346494F010049000000010005574944544802000200
      32000553756D6D7908000400000000000000}
    object CDSZaTabno: TIntegerField
      DisplayLabel = #1058#1072#1073'.'#1085#1086#1084'.'
      FieldName = 'Tabno'
    end
    object CDSZaFIO: TStringField
      DisplayLabel = #1060#1048#1054
      FieldName = 'FIO'
      Size = 50
    end
    object CDSZaSummy: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'Summy'
      DisplayFormat = '0.00'
    end
  end
  object CDS2011: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Tabno'
        DataType = ftInteger
      end
      item
        Name = 'FIO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Summa'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 308
    Top = 263
    Data = {
      4E0000009619E0BD0100000018000000030000000000030000004E0005546162
      6E6F04000100000000000346494F010049000000010005574944544802000200
      32000553756D6D6108000400000000000000}
    object CDS2011Tabno: TIntegerField
      DisplayLabel = #1058#1072#1073'.'#1085#1086#1084'.'
      FieldName = 'Tabno'
    end
    object CDS2011FIO: TStringField
      DisplayLabel = #1060#1048#1054
      FieldName = 'FIO'
      Size = 50
    end
    object CDS2011Summa: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'Summa'
      DisplayFormat = '0.00'
    end
  end
  object dsoCDSZa: TDataSource
    DataSet = CDSZa
    Left = 348
    Top = 231
  end
  object dsoCDS2011: TDataSource
    DataSet = CDS2011
    Left = 348
    Top = 263
  end
end
