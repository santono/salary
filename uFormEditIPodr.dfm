object FormEditIPodr: TFormEditIPodr
  Left = 303
  Top = 187
  Width = 570
  Height = 466
  Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103' '#1080#1089#1082#1083#1102#1095#1072#1077#1084#1099#1077' '#1080#1079' '#1088#1072#1089#1095#1077#1090#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    562
    419)
  PixelsPerInch = 96
  TextHeight = 20
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 545
    Height = 409
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1041#1086#1083#1100#1085#1080#1095#1085'. '#1080' '#1082#1086#1084#1072#1085#1076#1080#1088#1086#1074#1082#1080
      DesignSize = (
        537
        374)
      object dxDBGridIPodr: TdxDBGrid
        Left = 16
        Top = 8
        Width = 513
        Height = 329
        Hint = 
          #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103', '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1082#1086#1090#1086#1088#1099#1093' '#1085#1077' '#1074#1082#1083#1102#1095#1072#1102#1090#1089#1103' '#1074' '#1088#1072#1089#1095#1077#1090' '#1073#1086#1083#1100#1085#1080#1095 +
          #1085#1099#1093
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFRID'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceIPodr
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCanAppend, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoSmartRefresh, edgoSmartReload, edgoSyncSelection, edgoUseBookmarks, edgoUseLocate]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoShowButtonAlways, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridIPodrShifrPod: TdxDBGridColumn
          Caption = #1064#1092#1088
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFR_POD'
        end
        object dxDBGridIPodrNAME: TdxDBGridLookupColumn
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          HeaderAlignment = taCenter
          Width = 500
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NamePod'
          DropDownRows = 15
          ListFieldName = 'SHIFRPOD;NAME'
          ListFieldIndex = 1
        end
        object dxDBGridIPodrId: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
        end
      end
      object DBNavigator1: TDBNavigator
        Left = 16
        Top = 344
        Width = 240
        Height = 25
        DataSource = DataSourceIPodr
        Anchors = [akLeft, akBottom]
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077
      ImageIndex = 1
      object dxDBGridOtp: TdxDBGrid
        Left = 8
        Top = 0
        Width = 537
        Height = 345
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFRID'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceOTP
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        object dxDBGridOtpSHIFR_POD: TdxDBGridMaskColumn
          Caption = #1064#1092#1088
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFR_POD'
        end
        object dxDBGridOtpSHIFRID: TdxDBGridMaskColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRID'
        end
        object dxDBGridOtpNAME_POD: TdxDBGridLookupColumn
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAME_POD'
          DropDownRows = 15
          ListFieldName = 'SHIFRPOD;NAME'
        end
      end
      object DBNavigator2: TDBNavigator
        Left = 0
        Top = 344
        Width = 240
        Height = 25
        DataSource = DataSourceOTP
        TabOrder = 1
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1050#1086#1084#1087#1077#1085#1089#1072#1094#1080#1103
      ImageIndex = 2
      DesignSize = (
        537
        374)
      object dxDBGridKomp: TdxDBGrid
        Left = 0
        Top = 0
        Width = 529
        Height = 345
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFRID'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceKomp
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridKompSHIFR_POD: TdxDBGridMaskColumn
          Caption = #1064#1080#1092#1088
          HeaderAlignment = taCenter
          Width = 54
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFR_POD'
        end
        object dxDBGridKompSHIFRID: TdxDBGridMaskColumn
          Visible = False
          Width = 92
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRID'
        end
        object dxDBGridKompNAME_PODR: TdxDBGridLookupColumn
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          HeaderAlignment = taCenter
          Width = 471
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAME_PODR'
          ListFieldName = 'SHIFRPOD;NAME'
          ListFieldIndex = 1
        end
      end
      object DBNavigator3: TDBNavigator
        Left = 0
        Top = 344
        Width = 240
        Height = 25
        DataSource = DataSourceKomp
        Anchors = [akLeft, akBottom]
        TabOrder = 1
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1052#1072#1075#1080#1089#1090#1088#1072#1090#1091#1088#1072
      ImageIndex = 3
      DesignSize = (
        537
        374)
      object dxDBGridMag: TdxDBGrid
        Left = 0
        Top = 0
        Width = 537
        Height = 345
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFR_POD'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceMag
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridMagSHIFR_POD: TdxDBGridMaskColumn
          Caption = #1064#1080#1092#1088
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFR_POD'
        end
        object dxDBGridMagSHIFRID: TdxDBGridMaskColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRID'
        end
        object dxDBGridMagNAME_PODR: TdxDBGridLookupColumn
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAME_PODR'
          ListFieldName = 'SHIFRPOD;NAME'
          ListFieldIndex = 1
        end
      end
      object DBNavigator4: TDBNavigator
        Left = 0
        Top = 344
        Width = 240
        Height = 25
        DataSource = DataSourceMag
        Anchors = [akLeft, akBottom]
        TabOrder = 1
      end
    end
    object TabSheet5: TTabSheet
      Caption = #1048#1085#1076#1077#1082#1089#1072#1094#1080#1103
      ImageIndex = 4
      DesignSize = (
        537
        374)
      object dxDBGridInd: TdxDBGrid
        Left = 0
        Top = 0
        Width = 529
        Height = 345
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFRID'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceInd
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridIndSHIFR_POD: TdxDBGridMaskColumn
          Caption = #1064#1092#1088
          HeaderAlignment = taCenter
          Width = 55
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFR_POD'
        end
        object dxDBGridIndSHIFRID: TdxDBGridMaskColumn
          Visible = False
          Width = 90
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRID'
        end
        object dxDBGridIndNAME_PODR: TdxDBGridLookupColumn
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          HeaderAlignment = taCenter
          Width = 300
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAME_PODR'
        end
      end
      object DBNavigatorInd: TDBNavigator
        Left = 0
        Top = 344
        Width = 240
        Height = 25
        DataSource = DataSourceInd
        TabOrder = 1
      end
    end
    object TabSheet6: TTabSheet
      Caption = #1053#1077' '#1087#1088#1085#1089' '#1086#1090#1087
      ImageIndex = 5
      DesignSize = (
        537
        374)
      object dxDBGridNPOtp: TdxDBGrid
        Left = 0
        Top = 0
        Width = 537
        Height = 345
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFRID'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceNPOtp
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        object dxDBGridNPOtpSHIFR_POD: TdxDBGridMaskColumn
          Caption = #1064#1092#1088
          HeaderAlignment = taCenter
          Width = 49
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFR_POD'
        end
        object dxDBGridNPOtpSHIFRID: TdxDBGridMaskColumn
          Visible = False
          Width = 96
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRID'
        end
        object dxDBGridNPOtpNAME_PODR: TdxDBGridLookupColumn
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          HeaderAlignment = taCenter
          Sorted = csUp
          Width = 484
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAME_PODR'
        end
      end
      object DBNavigator5: TDBNavigator
        Left = 0
        Top = 344
        Width = 240
        Height = 25
        DataSource = DataSourceNPOtp
        Anchors = [akLeft, akBottom]
        TabOrder = 1
      end
    end
  end
  object pFIBDataSetIPodr: TpFIBDataSet
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted, cusDeleted, cusUninserted, cusDeletedApplied]
    UpdateSQL.Strings = (
      'UPDATE I_PODR'
      'SET '
      '    SHIFR_POD = :SHIFR_POD'
      'WHERE'
      '    SHIFRID = :OLD_SHIFRID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    I_PODR'
      'WHERE'
      '        SHIFRID = :OLD_SHIFRID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO I_PODR('
      '    SHIFR_POD,'
      '    MODE'
      ')'
      'VALUES('
      '    :SHIFR_POD,'
      '    1'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    I_P.SHIFR_POD,'
      '    I_P.SHIFRID'
      ''
      'FROM'
      '    I_PODR I_P '
      'WHERE '
      '    I_P.SHIFRID = :OLD_SHIFRID'
      '     '
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    I_P.SHIFR_POD,'
      '    I_P.SHIFRID'
      ''
      'FROM'
      '    I_PODR I_P '
      'WHERE'
      '    I_P.MODE=1'
      'order by i_p.shifr_pod')
    AfterDelete = pFIBDataSetIPodrAfterDelete
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 16
    Top = 64
    oRefreshDeletedRecord = True
    oFetchAll = True
    object pFIBDataSetIPodrSHIFR_POD: TFIBSmallIntField
      FieldName = 'SHIFR_POD'
      Origin = 'I_PODR.SHIFR_POD'
    end
    object pFIBDataSetIPodrNamePod: TFIBStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      FieldKind = fkLookup
      FieldName = 'NamePod'
      LookupDataSet = pFIBDataSetPodr
      LookupKeyFields = 'SHIFRPOD'
      LookupResultField = 'NAME'
      KeyFields = 'SHIFR_POD'
      Origin = 'PODR.NAME'
      Size = 50
      EmptyStrToNull = True
      Lookup = True
    end
    object pFIBDataSetIPodrSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
  end
  object DataSourceIPodr: TDataSource
    DataSet = pFIBDataSetIPodr
    Left = 64
    Top = 144
  end
  object pFIBDataSetPodr: TpFIBDataSet
    SelectSQL.Strings = (
      'select shifrpod,name from podr')
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    Left = 16
    Top = 152
    oRefreshDeletedRecord = True
    object pFIBDataSetPodrSHIFRPOD: TFIBIntegerField
      FieldName = 'SHIFRPOD'
      Origin = 'PODR.SHIFRPOD'
    end
    object pFIBDataSetPodrNAME: TFIBStringField
      FieldName = 'NAME'
      Origin = 'PODR.NAME'
      Size = 100
      EmptyStrToNull = True
    end
  end
  object DataSourcePodr: TDataSource
    DataSet = pFIBDataSetPodr
    Left = 16
    Top = 120
  end
  object pFIBDataSetOtp: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE I_PODR'
      'SET '
      '    SHIFR_POD = :SHIFR_POD'
      'WHERE'
      '    SHIFRID = :OLD_SHIFRID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    I_PODR'
      'WHERE'
      '        SHIFRID = :OLD_SHIFRID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO I_PODR('
      '    SHIFR_POD,'
      '    mode'
      ')'
      'VALUES('
      '    :SHIFR_POD,'
      '    2'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    SHIFR_POD,'
      '    SHIFRID'
      'FROM'
      '    I_PODR '
      'where'
      '    I_PODR.SHIFRID = :OLD_SHIFRID'
      '    '
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    SHIFR_POD,'
      '    SHIFRID'
      'FROM'
      '    I_PODR '
      'where MODE=2'
      'order by shifr_pod'
      '    ')
    AfterDelete = pFIBDataSetOtpAfterDelete
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 68
    Top = 111
    object pFIBDataSetOtpSHIFR_POD: TFIBSmallIntField
      FieldName = 'SHIFR_POD'
    end
    object pFIBDataSetOtpSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object pFIBDataSetOtpNAME_POD: TStringField
      FieldKind = fkLookup
      FieldName = 'NAME_POD'
      LookupDataSet = pFIBDataSetPodr
      LookupKeyFields = 'SHIFRPOD'
      LookupResultField = 'NAME'
      KeyFields = 'SHIFR_POD'
      Size = 50
      Lookup = True
    end
  end
  object DataSourceOTP: TDataSource
    DataSet = pFIBDataSetOtp
    Left = 68
    Top = 79
  end
  object pFIBTransactionRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 140
    Top = 127
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 116
    Top = 167
  end
  object pFIBDataSetKomp: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE I_PODR'
      'SET '
      ' SHIFR_POD = :SHIFR_POD'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' I_PODR'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO I_PODR('
      '    SHIFR_POD,'
      '    mode'
      ')'
      'VALUES('
      '    :SHIFR_POD,'
      '    3'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    SHIFR_POD,'
      '    SHIFRID'
      'FROM'
      '    I_PODR '
      'where(  MODE=3'
      '  ) and (  I_PODR.SHIFRID = :OLD_SHIFRID'
      '  )'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      '    SHIFR_POD,'
      '    SHIFRID'
      'FROM'
      '    I_PODR '
      'where MODE=3'
      'order by shifr_pod')
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    Left = 212
    Top = 95
    object pFIBDataSetKompSHIFR_POD: TFIBSmallIntField
      FieldName = 'SHIFR_POD'
    end
    object pFIBDataSetKompSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object pFIBDataSetKompNAME_PODR: TStringField
      FieldKind = fkLookup
      FieldName = 'NAME_PODR'
      LookupDataSet = pFIBDataSetPodr
      LookupKeyFields = 'SHIFRPOD'
      LookupResultField = 'NAME'
      KeyFields = 'SHIFR_POD'
      Size = 120
      Lookup = True
    end
  end
  object pFIBDataSetMag: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE I_PODR'
      'SET '
      ' SHIFR_POD = :SHIFR_POD'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' I_PODR'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO I_PODR('
      '    SHIFR_POD,'
      '    mode'
      ')'
      'VALUES('
      '    :SHIFR_POD,'
      '    4'
      ')'
      '')
    RefreshSQL.Strings = (
      'SELECT'
      '    SHIFR_POD,'
      '    SHIFRID'
      'FROM'
      '    I_PODR '
      'where(  MODE=4'
      '  ) and (  I_PODR.SHIFRID = :OLD_SHIFRID'
      '  )'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      '    SHIFR_POD,'
      '    SHIFRID'
      'FROM'
      '    I_PODR '
      'where MODE=4'
      'order by shifr_pod')
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    Left = 300
    Top = 95
    object pFIBDataSetMagSHIFR_POD: TFIBSmallIntField
      FieldName = 'SHIFR_POD'
    end
    object pFIBDataSetMagSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object pFIBDataSetMagNAME_PODR: TStringField
      FieldKind = fkLookup
      FieldName = 'NAME_PODR'
      LookupDataSet = pFIBDataSetPodr
      LookupKeyFields = 'SHIFRPOD'
      LookupResultField = 'NAME'
      KeyFields = 'SHIFR_POD'
      Size = 120
      Lookup = True
    end
  end
  object DataSourceKomp: TDataSource
    DataSet = pFIBDataSetKomp
    Left = 212
    Top = 135
  end
  object DataSourceMag: TDataSource
    DataSet = pFIBDataSetMag
    Left = 300
    Top = 135
  end
  object pFIBDataSetInd: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE I_PODR'
      'SET '
      ' SHIFR_POD = :SHIFR_POD'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' I_PODR'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO I_PODR('
      ' SHIFR_POD,'
      ' MODE'
      ')'
      'VALUES('
      ' :SHIFR_POD,'
      ' 5'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    SHIFR_POD,'
      '    SHIFRID'
      'FROM'
      '    I_PODR '
      'where(  MODE=5'
      '  ) and (  I_PODR.SHIFRID = :OLD_SHIFRID'
      '  )'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      '    SHIFR_POD,'
      '    SHIFRID'
      'FROM'
      '    I_PODR '
      'where MODE=5'
      'order by shifr_pod')
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    Left = 380
    Top = 95
    object pFIBDataSetIndSHIFR_POD: TFIBSmallIntField
      FieldName = 'SHIFR_POD'
    end
    object pFIBDataSetIndSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object pFIBDataSetIndNAME_PODR: TStringField
      FieldKind = fkLookup
      FieldName = 'NAME_PODR'
      LookupDataSet = pFIBDataSetPodr
      LookupKeyFields = 'SHIFRPOD'
      LookupResultField = 'NAME'
      KeyFields = 'SHIFR_POD'
      Size = 80
      Lookup = True
    end
  end
  object DataSourceInd: TDataSource
    DataSet = pFIBDataSetInd
    Left = 380
    Top = 135
  end
  object pFIBDataSetNPOtp: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE I_PODR'
      'SET '
      ' SHIFR_POD = :SHIFR_POD'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' I_PODR'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO I_PODR('
      ' SHIFR_POD,'
      ' mode'
      ')'
      'VALUES('
      ' :SHIFR_POD,'
      ' 6'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    SHIFR_POD'
      '    '
      'FROM'
      '    I_PODR '
      'where(  MODE=6'
      '  ) and (  I_PODR.SHIFRID = :OLD_SHIFRID'
      '  )'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      '    SHIFR_POD,'
      '    SHIFRID'
      'FROM'
      '    I_PODR '
      'where MODE=6'
      'order by shifr_pod')
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    Left = 436
    Top = 95
    object pFIBDataSetNPOtpSHIFR_POD: TFIBSmallIntField
      FieldName = 'SHIFR_POD'
    end
    object pFIBDataSetNPOtpSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object pFIBDataSetNPOtpNAME_PODR: TStringField
      FieldKind = fkLookup
      FieldName = 'NAME_PODR'
      LookupDataSet = pFIBDataSetPodr
      LookupKeyFields = 'SHIFRPOD'
      LookupResultField = 'NAME'
      KeyFields = 'SHIFR_POD'
      Size = 80
      Lookup = True
    end
  end
  object DataSourceNPOtp: TDataSource
    DataSet = pFIBDataSetNPOtp
    Left = 436
    Top = 135
  end
end
