object FormKomandA: TFormKomandA
  Left = 264
  Top = 185
  Width = 696
  Height = 495
  Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103
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
    457)
  PixelsPerInch = 96
  TextHeight = 20
  object LabelSumma: TLabel
    Left = 72
    Top = 416
    Width = 77
    Height = 20
    Anchors = [akLeft, akBottom]
    Caption = #1054#1090#1084#1077#1095#1077#1085#1086
  end
  object LabelSummaSel: TLabel
    Left = 210
    Top = 416
    Width = 31
    Height = 20
    Alignment = taRightJustify
    Anchors = [akLeft, akBottom]
    Caption = '0.00'
  end
  object dxDBGridKomandA: TdxDBGrid
    Left = 8
    Top = 8
    Width = 665
    Height = 401
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRIDTMP'
    ShowSummaryFooter = True
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = DataSourceKomandA
    Filter.Criteria = {00000000}
    OptionsCustomize = [edgoBandMoving, edgoBandSizing, edgoColumnMoving, edgoColumnSizing, edgoFullSizing, edgoHeaderPanelSizing]
    OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridKomandAMARKED: TdxDBGridCheckColumn
      MinWidth = 20
      Width = 20
      BandIndex = 0
      RowIndex = 0
      OnChange = dxDBGridKomandAMARKEDChange
      FieldName = 'MARKED'
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnToggleClick = dxDBGridKomandAMARKEDToggleClick
    end
    object dxDBGridKomandASHIFRSTA: TdxDBGridMaskColumn
      Caption = #1064#1092#1088
      Width = 35
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRSTA'
    end
    object dxDBGridKomandANAMESta: TdxDBGridMaskColumn
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      HeaderAlignment = taCenter
      Width = 111
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME3'
    end
    object dxDBGridKomandASUMMA: TdxDBGridCurrencyColumn
      Caption = #1057#1091#1084#1084#1072
      HeaderAlignment = taCenter
      Width = 55
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMA'
      SummaryFooterType = cstSum
      DisplayFormat = ',0.00'
      Nullable = False
    end
    object dxDBGridKomandAMONTH_VY: TdxDBGridMaskColumn
      Caption = #1052#1094
      Width = 20
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MONTH_VY'
    end
    object dxDBGridKomandAYEAR_VY: TdxDBGridMaskColumn
      Caption = #1043#1086#1076
      HeaderAlignment = taCenter
      Width = 38
      BandIndex = 0
      RowIndex = 0
      FieldName = 'YEAR_VY'
    end
    object dxDBGridKomandAMONTH_ZA: TdxDBGridMaskColumn
      Caption = #1052#1094' '#1079#1072
      HeaderAlignment = taCenter
      Width = 55
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MONTH_ZA'
    end
    object dxDBGridKomandAYEAR_ZA: TdxDBGridMaskColumn
      Caption = #1043#1086#1076' '#1079#1072
      HeaderAlignment = taCenter
      Width = 28
      BandIndex = 0
      RowIndex = 0
      FieldName = 'YEAR_ZA'
    end
    object dxDBGridKomandAWRN: TdxDBGridMaskColumn
      Caption = #1042#1088
      HeaderAlignment = taCenter
      Width = 50
      BandIndex = 0
      RowIndex = 0
      FieldName = 'WRN'
    end
    object dxDBGridKomandANAME1: TdxDBGridMaskColumn
      Caption = #1050#1072#1090
      HeaderAlignment = taCenter
      Width = 52
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME1'
    end
    object dxDBGridKomandANAME2: TdxDBGridMaskColumn
      Caption = #1043#1088
      HeaderAlignment = taCenter
      Width = 42
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME2'
    end
    object dxDBGridKomandANAME: TdxDBGridMaskColumn
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      HeaderAlignment = taCenter
      Width = 155
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
    object dxDBGridKomandAVYPL: TdxDBGridMaskColumn
      Visible = False
      Width = 93
      BandIndex = 0
      RowIndex = 0
      FieldName = 'VYPL'
    end
    object dxDBGridKomandASHIFRIDTMP: TdxDBGridMaskColumn
      Visible = False
      Width = 48
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRIDTMP'
    end
  end
  object BitBtn1: TBitBtn
    Left = 576
    Top = 416
    Width = 97
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkClose
  end
  object BitBtn2: TBitBtn
    Left = 496
    Top = 416
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object DBNavigator1: TDBNavigator
    Left = 256
    Top = 408
    Width = 231
    Height = 25
    DataSource = DataSourceKomandA
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel, nbRefresh]
    Anchors = [akLeft, akBottom]
    TabOrder = 3
    OnClick = DBNavigator1Click
  end
  object DataSourceKomandA: TDataSource
    DataSet = pFIBDataSetKomandA
    Left = 48
    Top = 56
  end
  object pFIBDataSetKomandA: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TMP_KOMAND_ADD'
      'SET '
      '    W_PLACE = :W_PLACE,'
      '    W_R = :W_R,'
      '    SHIFRGRU = :SHIFRGRU,'
      '    SHIFRKAT = :SHIFRKAT,'
      '    SHIFRSTA = :SHIFRSTA,'
      '    MONTH_ZA = :MONTH_ZA,'
      '    YEAR_ZA = :YEAR_ZA,'
      '    MONTH_VY = :MONTH_VY,'
      '    YEAR_VY = :YEAR_VY,'
      '    SUMMA = :SUMMA,'
      '    VYPL = :VYPL,'
      '    MARKED = :MARKED,'
      '    ID_CLAR = :ID_CLAR,'
      '    SHIFRIDTMP = :SHIFRIDTMP'
      'WHERE'
      '    SHIFRIDTMP = :OLD_SHIFRIDTMP'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TMP_KOMAND_ADD'
      'WHERE'
      '        SHIFRIDTMP = :OLD_SHIFRIDTMP'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_KOMAND_ADD('
      '    W_PLACE,'
      '    W_R,'
      '    SHIFRGRU,'
      '    SHIFRKAT,'
      '    SHIFRSTA,'
      '    MONTH_ZA,'
      '    YEAR_ZA,'
      '    MONTH_VY,'
      '    YEAR_VY,'
      '    SUMMA,'
      '    VYPL,'
      '    MARKED,'
      '    ID_CLAR,'
      '    SHIFRIDTMP'
      ')'
      'VALUES('
      '    :W_PLACE,'
      '    :W_R,'
      '    :SHIFRGRU,'
      '    :SHIFRKAT,'
      '    :SHIFRSTA,'
      '    :MONTH_ZA,'
      '    :YEAR_ZA,'
      '    :MONTH_VY,'
      '    :YEAR_VY,'
      '    :SUMMA,'
      '    :VYPL,'
      '    :MARKED,'
      '    :ID_CLAR,'
      '    :SHIFRIDTMP'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    TMP.W_PLACE,'
      '    P.NAME,'
      '    TMP.W_R,'
      '    CASE WHEN TMP.W_R=1 THEN '#39#1054#1089#1085#39' ELSE '#39#1057#1074#1084#39' END AS WRN,'
      '    TMP.SHIFRGRU,'
      '    G.NAME,'
      '    TMP.SHIFRKAT,'
      '    K.NAME,'
      '    TMP.SHIFRSTA,'
      '    S.NAME,'
      '    TMP.MONTH_ZA,'
      '    TMP.YEAR_ZA,'
      '    TMP.MONTH_VY,'
      '    TMP.YEAR_VY,'
      '    TMP.SUMMA,'
      '    TMP.VYPL,'
      '    TMP.MARKED,'
      '    TMP.ID_CLAR,'
      '    TMP.SHIFRIDTMP'
      'FROM'
      '    TMP_KOMAND_ADD TMP '
      '    JOIN SHIFR S  ON TMP.SHIFRSTA = S.SHIFR'
      '    JOIN PODR P   ON TMP.W_PLACE  = P.SHIFRPOD'
      '    JOIN KATEG K  ON TMP.SHIFRKAT = K.SHIFR'
      '    JOIN GRUPPY G ON TMP.SHIFRGRU = G.SHIFR'
      'WHERE(  '
      '    TMP.YEAR_ZA  = :YEAR_ZA  AND'
      '    TMP.MONTH_ZA = :MONTH_ZA AND'
      '    TMP.CONNID   = CURRENT_CONNECTION'
      '     ) and (     TMP.SHIFRIDTMP = :OLD_SHIFRIDTMP'
      '     )'
      '    '
      '   ')
    SelectSQL.Strings = (
      'SELECT'
      '    TMP.W_PLACE,'
      '    P.NAME,'
      '    TMP.W_R,'
      '    CASE WHEN TMP.W_R=1 THEN '#39#1054#1089#1085#39' ELSE '#39#1057#1074#1084#39' END AS WRN,'
      '    TMP.SHIFRGRU,'
      '    G.NAME,'
      '    TMP.SHIFRKAT,'
      '    K.NAME,'
      '    TMP.SHIFRSTA,'
      '    S.NAME,'
      '    TMP.MONTH_ZA,'
      '    TMP.YEAR_ZA,'
      '    TMP.MONTH_VY,'
      '    TMP.YEAR_VY,'
      '    TMP.SUMMA,'
      '    TMP.VYPL,'
      '    TMP.MARKED,'
      '    TMP.ID_CLAR,'
      '    TMP.SHIFRIDTMP'
      'FROM'
      '    TMP_KOMAND_ADD TMP '
      '    JOIN SHIFR S  ON TMP.SHIFRSTA = S.SHIFR'
      '    JOIN PODR P   ON TMP.W_PLACE  = P.SHIFRPOD'
      '    JOIN KATEG K  ON TMP.SHIFRKAT = K.SHIFR'
      '    JOIN GRUPPY G ON TMP.SHIFRGRU = G.SHIFR'
      'WHERE '
      '     ('
      '       (:MODE_V_Z=1 AND '
      
        '         (TMP.YEAR_VY  = :YEAR_ZA AND TMP.MONTH_VY = :MONTH_ZA A' +
        'ND TMP.SHIFRSTA NOT IN (5,6))'
      '         or'
      
        '         (TMP.YEAR_ZA  = :YEAR_ZA AND TMP.MONTH_ZA = :MONTH_ZA A' +
        'ND TMP.SHIFRSTA  IN (5,6))'
      '       ) '
      '      or'
      
        '      (:MODE_V_Z=0 AND TMP.YEAR_ZA  = :YEAR_ZA AND TMP.MONTH_ZA ' +
        '= :MONTH_ZA)'
      '      ) AND'
      '    TMP.CONNID   = CURRENT_CONNECTION'
      '   '
      'ORDER BY TMP.SHIFRSTA,'
      '         TMP.W_PLACE,'
      '         TMP.SHIFRKAT,'
      '         TMP.SHIFRGRU')
    AutoUpdateOptions.UpdateTableName = 'TMP_KOMAND_ADD'
    AutoUpdateOptions.KeyFields = 'SHIFRIDTMP'
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 48
    Top = 96
    object pFIBDataSetKomandAW_PLACE: TFIBSmallIntField
      FieldName = 'W_PLACE'
      Origin = 'TMP_BOLNA.W_PLACE'
    end
    object pFIBDataSetKomandANAME: TFIBStringField
      FieldName = 'NAME'
      Origin = 'PODR.NAME'
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSetKomandAW_R: TFIBSmallIntField
      FieldName = 'W_R'
      Origin = 'TMP_BOLNA.W_R'
    end
    object pFIBDataSetKomandASHIFRGRU: TFIBSmallIntField
      FieldName = 'SHIFRGRU'
      Origin = 'TMP_BOLNA.SHIFRGRU'
    end
    object pFIBDataSetKomandANAME1: TFIBStringField
      FieldName = 'NAME1'
      Origin = 'GRUPPY.NAME'
      EmptyStrToNull = True
    end
    object pFIBDataSetKomandASHIFRKAT: TFIBSmallIntField
      FieldName = 'SHIFRKAT'
      Origin = 'TMP_BOLNA.SHIFRKAT'
    end
    object pFIBDataSetKomandANAME2: TFIBStringField
      FieldName = 'NAME2'
      Origin = 'KATEG.NAME'
      Size = 40
      EmptyStrToNull = True
    end
    object pFIBDataSetKomandASHIFRSTA: TFIBSmallIntField
      FieldName = 'SHIFRSTA'
      Origin = 'TMP_BOLNA.SHIFRSTA'
    end
    object pFIBDataSetKomandANAME3: TFIBStringField
      FieldName = 'NAME3'
      Origin = 'SHIFR.NAME'
      Size = 52
      EmptyStrToNull = True
    end
    object pFIBDataSetKomandAMONTH_ZA: TFIBSmallIntField
      FieldName = 'MONTH_ZA'
      Origin = 'TMP_BOLNA.MONTH_ZA'
    end
    object pFIBDataSetKomandAYEAR_ZA: TFIBSmallIntField
      FieldName = 'YEAR_ZA'
      Origin = 'TMP_BOLNA.YEAR_ZA'
    end
    object pFIBDataSetKomandAMONTH_VY: TFIBSmallIntField
      FieldName = 'MONTH_VY'
      Origin = 'TMP_BOLNA.MONTH_VY'
    end
    object pFIBDataSetKomandAYEAR_VY: TFIBSmallIntField
      FieldName = 'YEAR_VY'
      Origin = 'TMP_BOLNA.YEAR_VY'
    end
    object pFIBDataSetKomandASUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Origin = 'TMP_BOLNA.SUMMA'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetKomandAVYPL: TFIBSmallIntField
      FieldName = 'VYPL'
      Origin = 'TMP_BOLNA.VYPL'
    end
    object pFIBDataSetKomandAMARKED: TFIBSmallIntField
      FieldName = 'MARKED'
      Origin = 'TMP_BOLNA.MARKED'
      OnChange = pFIBDataSetKomandAMARKEDChange
    end
    object pFIBDataSetKomandAID_CLAR: TFIBIntegerField
      FieldName = 'ID_CLAR'
      Origin = 'TMP_BOLNA.ID_CLAR'
    end
    object pFIBDataSetKomandASHIFRIDTMP: TFIBIntegerField
      FieldName = 'SHIFRIDTMP'
      Origin = 'TMP_BOLNA.SHIFRIDTMP'
    end
    object pFIBDataSetKomandAWRN: TFIBStringField
      DisplayLabel = #1042'-'#1088
      FieldName = 'WRN'
      Size = 3
      EmptyStrToNull = True
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
    Left = 104
    Top = 72
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 176
    Top = 88
  end
end
