object FormIGruppy: TFormIGruppy
  Left = 433
  Top = 230
  Width = 504
  Height = 500
  Caption = #1057#1095#1077#1090#1072', '#1080#1089#1082#1083#1102#1095#1072#1077#1084#1099#1077' '#1080#1079' '#1088#1072#1089#1095#1077#1090#1072
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
    488
    464)
  PixelsPerInch = 96
  TextHeight = 20
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 473
    Height = 449
    ActivePage = TabSheet4
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1041#1086#1083#1100#1085#1080#1095#1085#1099#1077
      DesignSize = (
        465
        414)
      object dxDBGridBoln: TdxDBGrid
        Left = 0
        Top = 5
        Width = 457
        Height = 377
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFRID'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceBoln
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridBolnSHIFRID: TdxDBGridMaskColumn
          Visible = False
          Width = 113
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRID'
        end
        object dxDBGridBolnSHIFR_GRU: TdxDBGridMaskColumn
          Caption = #1064#1092#1088
          HeaderAlignment = taCenter
          Width = 67
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFR_GRU'
        end
        object dxDBGridBolnNAME_GRU: TdxDBGridLookupColumn
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          HeaderAlignment = taCenter
          Width = 386
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAME_GRU'
        end
      end
      object DBNavigatorBoln: TDBNavigator
        Left = 0
        Top = 384
        Width = 240
        Height = 25
        DataSource = DataSourceBoln
        Anchors = [akLeft, akBottom]
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077
      ImageIndex = 1
      DesignSize = (
        465
        414)
      object dxDBGridOtp: TdxDBGrid
        Left = 0
        Top = 0
        Width = 465
        Height = 369
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFRID'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceOtp
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridOtpSHIFR_GRU: TdxDBGridMaskColumn
          Caption = #1064#1092#1088
          HeaderAlignment = taCenter
          Width = 62
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFR_GRU'
        end
        object dxDBGridOtpSHIFRID: TdxDBGridMaskColumn
          Visible = False
          Width = 114
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRID'
        end
        object dxDBGridOtpNAME_GRU: TdxDBGridLookupColumn
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          HeaderAlignment = taCenter
          Width = 399
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAME_GRU'
        end
      end
      object DBNavigatorOtp: TDBNavigator
        Left = 0
        Top = 376
        Width = 240
        Height = 25
        DataSource = DataSourceOtp
        Anchors = [akLeft, akBottom]
        TabOrder = 1
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1050#1086#1084#1087#1077#1085#1089#1072#1094#1080#1103
      ImageIndex = 2
      DesignSize = (
        465
        414)
      object dxDBGridKomp: TdxDBGrid
        Left = 0
        Top = 5
        Width = 465
        Height = 380
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
        object dxDBGridKompSHIFR_GRU: TdxDBGridMaskColumn
          Caption = #1064#1092#1088
          HeaderAlignment = taCenter
          Width = 87
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFR_GRU'
        end
        object dxDBGridKompSHIFRID: TdxDBGridMaskColumn
          Visible = False
          Width = 108
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRID'
        end
        object dxDBGridKompNAME_GRU: TdxDBGridLookupColumn
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          HeaderAlignment = taCenter
          Width = 374
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAME_GRU'
        end
      end
      object DBNavigatorKomp: TDBNavigator
        Left = 0
        Top = 384
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
        465
        414)
      object dxDBGridMag: TdxDBGrid
        Left = 0
        Top = 0
        Width = 457
        Height = 377
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFRID'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceMag
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridMagSHIFR_GRU: TdxDBGridMaskColumn
          Caption = #1064#1092#1088
          HeaderAlignment = taCenter
          Width = 79
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFR_GRU'
        end
        object dxDBGridMagSHIFRID: TdxDBGridMaskColumn
          Visible = False
          Width = 109
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRID'
        end
        object dxDBGridMagNAME_GRU: TdxDBGridLookupColumn
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          HeaderAlignment = taCenter
          Width = 374
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAME_GRU'
        end
      end
      object DBNavigatorMag: TDBNavigator
        Left = 0
        Top = 376
        Width = 240
        Height = 25
        DataSource = DataSourceMag
        Anchors = [akLeft, akBottom]
        TabOrder = 1
      end
    end
  end
  object pFIBDataSetGru: TpFIBDataSet
    UpdateRecordTypes = [cusUnmodified, cusModified]
    SelectSQL.Strings = (
      'select shifr,name'
      'from gruppy'
      'order by shifr')
    AllowedUpdateKinds = []
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    AutoCommit = True
    Left = 28
    Top = 63
    object pFIBDataSetGruSHIFR: TFIBIntegerField
      FieldName = 'SHIFR'
      ReadOnly = True
    end
    object pFIBDataSetGruNAME: TFIBStringField
      FieldName = 'NAME'
      ReadOnly = True
      EmptyStrToNull = True
    end
  end
  object pFIBDataSetBoln: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE I_GRUPPY'
      'SET '
      ' SHIFR_GRU = :SHIFR_GRU'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' I_GRUPPY'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO I_GRUPPY('
      ' SHIFR_GRU,'
      ' MODE'
      ')'
      'VALUES('
      ' :SHIFR_GRU,'
      ' 1 '
      ')')
    RefreshSQL.Strings = (
      'select shifrid,shifr_gru'
      'from i_gruppy'
      'where(  mode=1'
      '  ) and (  I_GRUPPY.SHIFRID = :OLD_SHIFRID'
      '  )'
      ' ')
    SelectSQL.Strings = (
      'select shifrid,shifr_gru'
      'from i_gruppy'
      'where mode=1'
      'order by shifrid')
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 76
    Top = 63
    object pFIBDataSetBolnSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object pFIBDataSetBolnSHIFR_GRU: TFIBSmallIntField
      FieldName = 'SHIFR_GRU'
    end
    object pFIBDataSetBolnNAME_GRU: TStringField
      FieldKind = fkLookup
      FieldName = 'NAME_GRU'
      LookupDataSet = pFIBDataSetGru
      LookupKeyFields = 'SHIFR'
      LookupResultField = 'NAME'
      KeyFields = 'SHIFR_GRU'
      Size = 25
      Lookup = True
    end
  end
  object pFIBDataSetOtp: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE I_GRUPPY'
      'SET '
      ' SHIFR_GRU = :SHIFR_GRU'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' I_GRUPPY'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO I_GRUPPY('
      ' SHIFR_GRU,'
      ' MODE '
      ')'
      'VALUES('
      ' :SHIFR_GRU,'
      ' 2 '
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFR_GRU,'
      ' SHIFRID'
      'FROM'
      ' I_GRUPPY'
      ''
      ' WHERE '
      '  I_GRUPPY.SHIFRID = :OLD_SHIFRID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFR_GRU,'
      ' SHIFRID'
      'FROM'
      ' I_GRUPPY'
      'WHERE MODE=2'
      'ORDER BY SHIFR_GRU ')
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 116
    Top = 63
    object pFIBDataSetOtpSHIFR_GRU: TFIBSmallIntField
      FieldName = 'SHIFR_GRU'
    end
    object pFIBDataSetOtpSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object pFIBDataSetOtpNAME_GRU: TStringField
      FieldKind = fkLookup
      FieldName = 'NAME_GRU'
      LookupDataSet = pFIBDataSetGru
      LookupKeyFields = 'SHIFR'
      LookupResultField = 'NAME'
      KeyFields = 'SHIFR_GRU'
      Size = 25
      Lookup = True
    end
  end
  object pFIBDataSetKomp: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE I_GRUPPY'
      'SET '
      ' SHIFR_GRU = :SHIFR_GRU'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' I_GRUPPY'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO I_GRUPPY('
      ' SHIFR_GRU,'
      ' MODE'
      ')'
      'VALUES('
      ' :SHIFR_GRU,'
      ' 3'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFR_GRU,'
      ' SHIFRID'
      'FROM'
      ' I_GRUPPY '
      'WHERE(  '
      ' MODE = 3'
      '  ) and (  I_GRUPPY.SHIFRID = :OLD_SHIFRID'
      '  )'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFR_GRU,'
      ' SHIFRID'
      'FROM'
      ' I_GRUPPY '
      'WHERE '
      ' MODE = 3'
      'ORDER BY SHIFR_GRU ')
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 156
    Top = 63
    object pFIBDataSetKompSHIFR_GRU: TFIBSmallIntField
      FieldName = 'SHIFR_GRU'
    end
    object pFIBDataSetKompSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object pFIBDataSetKompNAME_GRU: TStringField
      FieldKind = fkLookup
      FieldName = 'NAME_GRU'
      LookupDataSet = pFIBDataSetGru
      LookupKeyFields = 'SHIFR'
      LookupResultField = 'NAME'
      KeyFields = 'SHIFR_GRU'
      Size = 25
      Lookup = True
    end
  end
  object pFIBDataSetMag: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE I_GRUPPY'
      'SET '
      ' SHIFR_GRU = :SHIFR_GRU'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' I_GRUPPY'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO I_GRUPPY('
      ' SHIFR_GRU,'
      ' MODE'
      ')'
      'VALUES('
      ' :SHIFR_GRU,'
      ' 4'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFR_GRU,'
      ' SHIFRID'
      'FROM'
      ' I_GRUPPY '
      'WHERE( '
      ' MODE=4'
      '  ) and (  I_GRUPPY.SHIFRID = :OLD_SHIFRID'
      '  )'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFR_GRU,'
      ' SHIFRID'
      'FROM'
      ' I_GRUPPY '
      'WHERE'
      ' MODE=4'
      'ORDER BY SHIFR_GRU')
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 196
    Top = 63
    object pFIBDataSetMagSHIFR_GRU: TFIBSmallIntField
      FieldName = 'SHIFR_GRU'
    end
    object pFIBDataSetMagSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object pFIBDataSetMagNAME_GRU: TStringField
      FieldKind = fkLookup
      FieldName = 'NAME_GRU'
      LookupDataSet = pFIBDataSetGru
      LookupKeyFields = 'SHIFR'
      LookupResultField = 'NAME'
      KeyFields = 'SHIFR_GRU'
      Size = 25
      Lookup = True
    end
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
    Left = 28
    Top = 175
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 68
    Top = 175
  end
  object DataSourceKomp: TDataSource
    DataSet = pFIBDataSetKomp
    Left = 156
    Top = 103
  end
  object DataSourceMag: TDataSource
    DataSet = pFIBDataSetMag
    Left = 196
    Top = 103
  end
  object DataSourceBoln: TDataSource
    DataSet = pFIBDataSetBoln
    Left = 76
    Top = 103
  end
  object DataSourceOtp: TDataSource
    DataSet = pFIBDataSetOtp
    Left = 116
    Top = 103
  end
end
