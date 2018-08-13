object FormEditiKat: TFormEditiKat
  Left = 487
  Top = 225
  Width = 544
  Height = 445
  Caption = #1048#1089#1082#1083'.'#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1080#1079' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    536
    401)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 513
    Height = 393
    ActivePage = TabSheet1
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #1041#1086#1083#1100#1085#1080#1095#1085#1099#1077
    end
    object TabSheet2: TTabSheet
      Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077
      ImageIndex = 1
    end
    object TabSheet3: TTabSheet
      Caption = #1050#1086#1084#1087#1077#1085#1089#1072#1094#1080#1103
      ImageIndex = 2
    end
    object TabSheet4: TTabSheet
      Caption = #1052#1072#1075#1080#1089#1090#1088#1072#1090#1091#1088#1072
      ImageIndex = 3
    end
  end
  object dxDBGridIKat: TdxDBGrid
    Left = 8
    Top = 40
    Width = 489
    Height = 329
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 1
    DataSource = DataSourceIKat
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridIKatSHIFR_KAT: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 57
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFR_KAT'
    end
    object dxDBGridIKatSHIFRID: TdxDBGridMaskColumn
      Visible = False
      Width = 68
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGridIKatNAME_KAT: TdxDBGridLookupColumn
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      HeaderAlignment = taCenter
      Width = 428
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME_KAT'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 368
    Width = 240
    Height = 25
    DataSource = DataSourceIKat
    Anchors = [akLeft, akBottom]
    TabOrder = 2
  end
  object pFIBDataSetIKat: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE I_KAT'
      'SET SHIFR_KAT=:Shifr_kAT'
      'WHERE'
      '    SHIFRID = :OLD_SHIFRID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    I_KAT'
      'WHERE'
      '        SHIFRID = :OLD_SHIFRID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO I_KAT('
      '    SHIFR_KAT,'
      '    MODE'
      ')'
      'VALUES('
      '    :SHIFR_KAT,'
      '    :MODE'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    I_K.SHIFR_KAT'
      'FROM'
      '    I_KAT I_K'
      ' WHERE '
      '        I_K.SHIFRID = :OLD_SHIFRID'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    SHIFR_KAT,'
      '    SHIFRID'
      'FROM'
      '    I_KAT'
      'where'
      '    MODE=:MODE')
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 152
    Top = 144
    object pFIBDataSetIKatSHIFR_KAT: TFIBSmallIntField
      DisplayLabel = #1064#1092#1088
      FieldName = 'SHIFR_KAT'
    end
    object pFIBDataSetIKatSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object pFIBDataSetIKatNAME_KAT: TStringField
      FieldKind = fkLookup
      FieldName = 'NAME_KAT'
      LookupDataSet = pFIBDataSetKat
      LookupKeyFields = 'SHIFR'
      LookupResultField = 'NAME'
      KeyFields = 'SHIFR_KAT'
      Size = 50
      Lookup = True
    end
  end
  object pFIBDataSetKat: TpFIBDataSet
    UpdateRecordTypes = [cusUnmodified]
    SelectSQL.Strings = (
      'SELECT'
      '    KAT.SHIFR,'
      '    KAT.NAME'
      'FROM'
      '    KATEG KAT')
    AllowedUpdateKinds = []
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    AutoCommit = True
    Left = 200
    Top = 112
    object pFIBDataSetKatSHIFR: TFIBIntegerField
      FieldName = 'SHIFR'
      ReadOnly = True
    end
    object pFIBDataSetKatNAME: TFIBStringField
      FieldName = 'NAME'
      ReadOnly = True
      Size = 40
      EmptyStrToNull = True
    end
  end
  object DataSourceIKat: TDataSource
    DataSet = pFIBDataSetIKat
    Left = 152
    Top = 112
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
    Left = 200
    Top = 144
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 200
    Top = 176
  end
end
