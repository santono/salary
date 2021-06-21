object FormOtpA: TFormOtpA
  Left = 237
  Top = 138
  Width = 704
  Height = 533
  Caption = #1056#1072#1089#1096#1080#1092#1088#1086#1074#1082#1072' '#1089#1091#1084#1084#1099
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
    688
    478)
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 128
    Top = 455
    Width = 77
    Height = 20
    Anchors = [akLeft, akBottom]
    Caption = #1054#1090#1084#1077#1095#1077#1085#1086
  end
  object LabelSumma: TLabel
    Left = 266
    Top = 455
    Width = 31
    Height = 20
    Alignment = taRightJustify
    Anchors = [akLeft, akBottom]
    Caption = '0.00'
  end
  object dxDBGridOtpA: TdxDBGrid
    Left = 8
    Top = 0
    Width = 681
    Height = 451
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRIDTMP'
    ShowSummaryFooter = True
    SummaryGroups = <>
    SummarySeparator = ', '
    PopupMenu = PopupMenu1
    TabOrder = 0
    DataSource = DataSourceOtpA
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridOtpASEL: TdxDBGridCheckColumn
      Caption = 'M'
      HeaderAlignment = taCenter
      MinWidth = 20
      Width = 20
      BandIndex = 0
      RowIndex = 0
      OnChange = dxDBGridOtpASELChange
      FieldName = 'SEL'
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnToggleClick = dxDBGridOtpASELToggleClick
    end
    object dxDBGridOtpASHIFRSTA: TdxDBGridColumn
      Caption = #1064#1092#1086
      HeaderAlignment = taCenter
      Width = 32
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRSTA'
    end
    object dxDBGridOtpANAME3: TdxDBGridColumn
      Caption = #1057#1090#1072#1090#1100#1103
      HeaderAlignment = taCenter
      Width = 158
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME3'
    end
    object dxDBGridOtpASUMMA: TdxDBGridColumn
      Caption = #1057#1091#1084#1084#1072
      HeaderAlignment = taCenter
      Width = 78
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMA'
      SummaryFooterType = cstSum
    end
    object dxDBGridOtpAMONTH_VY: TdxDBGridColumn
      Caption = #1052#1094
      HeaderAlignment = taCenter
      Width = 34
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MONTH_VY'
    end
    object dxDBGridOtpAMONTH_ZA: TdxDBGridColumn
      Caption = #1052#1094
      HeaderAlignment = taCenter
      Visible = False
      Width = 34
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MONTH_ZA'
    end
    object dxDBGridOtpAYEAR_ZA: TdxDBGridColumn
      Caption = #1043#1086#1076
      HeaderAlignment = taCenter
      Width = 39
      BandIndex = 0
      RowIndex = 0
      FieldName = 'YEAR_ZA'
    end
    object dxDBGridOtpAWRN: TdxDBGridColumn
      Caption = #1042'-'#1088
      HeaderAlignment = taCenter
      Width = 28
      BandIndex = 0
      RowIndex = 0
      FieldName = 'WRN'
    end
    object dxDBGridOtpANAME2: TdxDBGridColumn
      Caption = #1050#1072#1090
      HeaderAlignment = taCenter
      Width = 42
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME2'
    end
    object dxDBGridOtpANAME1: TdxDBGridColumn
      Caption = #1057#1095#1077#1090
      HeaderAlignment = taCenter
      Width = 40
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME1'
    end
    object dxDBGridOtpAW_PLACE: TdxDBGridMaskColumn
      Caption = #1055#1076#1088
      HeaderAlignment = taCenter
      Sorted = csUp
      Width = 44
      BandIndex = 0
      RowIndex = 0
      FieldName = 'W_PLACE'
    end
    object dxDBGridOtpAW_R: TdxDBGridMaskColumn
      Visible = False
      Width = 54
      BandIndex = 0
      RowIndex = 0
      FieldName = 'W_R'
    end
    object dxDBGridOtpANAME: TdxDBGridColumn
      Caption = #1055#1086#1076#1088
      HeaderAlignment = taCenter
      Width = 162
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
    object dxDBGridOtpASHIFRGRU: TdxDBGridMaskColumn
      Visible = False
      Width = 54
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRGRU'
    end
    object dxDBGridOtpASHIFRKAT: TdxDBGridMaskColumn
      Visible = False
      Width = 54
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRKAT'
    end
    object dxDBGridOtpAYEAR_VY: TdxDBGridColumn
      Visible = False
      Width = 61
      BandIndex = 0
      RowIndex = 0
      FieldName = 'YEAR_VY'
    end
    object dxDBGridOtpAVYPL: TdxDBGridColumn
      Visible = False
      Width = 54
      BandIndex = 0
      RowIndex = 0
      FieldName = 'VYPL'
    end
    object dxDBGridOtpAID_CLAR: TdxDBGridMaskColumn
      Visible = False
      Width = 54
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ID_CLAR'
    end
    object dxDBGridOtpASHIFRIDTMP: TdxDBGridMaskColumn
      Visible = False
      Width = 59
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRIDTMP'
    end
  end
  object BitBtn1: TBitBtn
    Left = 600
    Top = 458
    Width = 89
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkClose
  end
  object BitBtn2: TBitBtn
    Left = 16
    Top = 458
    Width = 105
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object DBNavigator1: TDBNavigator
    Left = 312
    Top = 448
    Width = 231
    Height = 25
    DataSource = DataSourceOtpA
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel, nbRefresh]
    Anchors = [akLeft, akBottom]
    TabOrder = 3
    OnClick = DBNavigator1Click
  end
  object pFIBDataSetOtpA: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TMP_OTP_ADD'
      'SET '
      '    SEL = :SEL'
      'WHERE'
      '    SHIFRIDTMP = :OLD_SHIFRIDTMP'
      '    ')
    DeleteSQL.Strings = (
      ''
      '    ')
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
      '    TMP.SEL,'
      '    TMP.ID_CLAR,'
      '    TMP.SHIFRIDTMP'
      'FROM'
      '    TMP_OTP_ADD TMP '
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
      '    TMP.SEL,'
      '    TMP.ID_CLAR,'
      '    TMP.SHIFRIDTMP'
      'FROM'
      '    TMP_OTP_ADD TMP '
      '    JOIN SHIFR S  ON TMP.SHIFRSTA = S.SHIFR'
      '    JOIN PODR P   ON TMP.W_PLACE  = P.SHIFRPOD'
      '    JOIN KATEG K  ON TMP.SHIFRKAT = K.SHIFR'
      '    JOIN GRUPPY G ON TMP.SHIFRGRU = G.SHIFR'
      'WHERE '
      '    TMP.YEAR_ZA  = :YEAR_ZA  AND'
      '    TMP.MONTH_ZA = :MONTH_ZA AND'
      '    TMP.CONNID   = CURRENT_CONNECTION'
      '   '
      'ORDER BY TMP.SHIFRSTA,'
      '         TMP.W_PLACE,'
      '         TMP.SHIFRKAT,'
      '         TMP.SHIFRGRU')
    AutoUpdateOptions.UpdateTableName = 'TMP_OTP_ADD'
    AutoUpdateOptions.KeyFields = 'SHIFRIDTMP'
    AllowedUpdateKinds = [ukModify]
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 32
    Top = 72
    object pFIBDataSetOtpAW_PLACE: TFIBSmallIntField
      FieldName = 'W_PLACE'
      Origin = 'TMP_OTP_ADD.W_PLACE'
    end
    object pFIBDataSetOtpANAME: TFIBStringField
      FieldName = 'NAME'
      Origin = 'PODR.NAME'
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSetOtpAW_R: TFIBSmallIntField
      FieldName = 'W_R'
      Origin = 'TMP_OTP_ADD.W_R'
    end
    object pFIBDataSetOtpAWRN: TFIBStringField
      FieldName = 'WRN'
      Size = 3
      EmptyStrToNull = True
    end
    object pFIBDataSetOtpASHIFRGRU: TFIBSmallIntField
      FieldName = 'SHIFRGRU'
      Origin = 'TMP_OTP_ADD.SHIFRGRU'
    end
    object pFIBDataSetOtpANAME1: TFIBStringField
      FieldName = 'NAME1'
      Origin = 'GRUPPY.NAME'
      EmptyStrToNull = True
    end
    object pFIBDataSetOtpASHIFRKAT: TFIBSmallIntField
      FieldName = 'SHIFRKAT'
      Origin = 'TMP_OTP_ADD.SHIFRKAT'
    end
    object pFIBDataSetOtpANAME2: TFIBStringField
      FieldName = 'NAME2'
      Origin = 'KATEG.NAME'
      Size = 40
      EmptyStrToNull = True
    end
    object pFIBDataSetOtpASHIFRSTA: TFIBSmallIntField
      FieldName = 'SHIFRSTA'
      Origin = 'TMP_OTP_ADD.SHIFRSTA'
    end
    object pFIBDataSetOtpANAME3: TFIBStringField
      FieldName = 'NAME3'
      Origin = 'SHIFR.NAME'
      Size = 52
      EmptyStrToNull = True
    end
    object pFIBDataSetOtpAMONTH_ZA: TFIBSmallIntField
      FieldName = 'MONTH_ZA'
      Origin = 'TMP_OTP_ADD.MONTH_ZA'
    end
    object pFIBDataSetOtpAYEAR_ZA: TFIBSmallIntField
      FieldName = 'YEAR_ZA'
      Origin = 'TMP_OTP_ADD.YEAR_ZA'
    end
    object pFIBDataSetOtpAMONTH_VY: TFIBSmallIntField
      FieldName = 'MONTH_VY'
      Origin = 'TMP_OTP_ADD.MONTH_VY'
    end
    object pFIBDataSetOtpAYEAR_VY: TFIBSmallIntField
      FieldName = 'YEAR_VY'
      Origin = 'TMP_OTP_ADD.YEAR_VY'
    end
    object pFIBDataSetOtpASUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Origin = 'TMP_OTP_ADD.SUMMA'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetOtpAVYPL: TFIBSmallIntField
      FieldName = 'VYPL'
      Origin = 'TMP_OTP_ADD.VYPL'
    end
    object pFIBDataSetOtpASEL: TFIBSmallIntField
      FieldName = 'SEL'
      Origin = 'TMP_OTP_ADD.SEL'
      OnChange = pFIBDataSetOtpASELChange
    end
    object pFIBDataSetOtpAID_CLAR: TFIBIntegerField
      FieldName = 'ID_CLAR'
      Origin = 'TMP_OTP_ADD.ID_CLAR'
    end
    object pFIBDataSetOtpASHIFRIDTMP: TFIBIntegerField
      FieldName = 'SHIFRIDTMP'
      Origin = 'TMP_OTP_ADD.SHIFRIDTMP'
    end
  end
  object DataSourceOtpA: TDataSource
    DataSet = pFIBDataSetOtpA
    Left = 32
    Top = 40
  end
  object PopupMenu1: TPopupMenu
    Left = 136
    Top = 64
    object N1: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1086#1090#1084#1077#1090#1082#1080
      OnClick = N1Click
    end
  end
  object pFIBQueryMark: TpFIBQuery
    Transaction = pFIBTransactionMark
    Database = FIB.pFIBDatabaseSal
    Left = 208
    Top = 48
  end
  object pFIBTransactionMark: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 248
    Top = 48
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 32
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
    Left = 32
    Top = 152
  end
end
