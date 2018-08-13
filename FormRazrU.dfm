object FormRazr: TFormRazr
  Left = 213
  Top = 177
  Width = 696
  Height = 528
  Anchors = [akLeft, akBottom]
  Caption = #1056#1072#1079#1088#1103#1076#1099' '#1080' '#1089#1090#1072#1074#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    688
    484)
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridR: TdxDBGrid
    Left = 8
    Top = 40
    Width = 665
    Height = 409
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = DataSourceR
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridRRAZR: TdxDBGridSpinColumn
      Width = 69
      BandIndex = 0
      RowIndex = 0
      FieldName = 'RAZR'
      MinValue = 1.000000000000000000
      MaxValue = 25.000000000000000000
    end
    object dxDBGridRDATEFR: TdxDBGridDateColumn
      HeaderAlignment = taCenter
      Width = 117
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATEFR'
    end
    object dxDBGridROKLAD: TdxDBGridCalcColumn
      HeaderAlignment = taCenter
      Sorted = csUp
      Width = 117
      BandIndex = 0
      RowIndex = 0
      FieldName = 'OKLAD'
    end
    object dxDBGridRPROC: TdxDBGridCalcColumn
      HeaderAlignment = taCenter
      Width = 117
      BandIndex = 0
      RowIndex = 0
      FieldName = 'PROC'
    end
    object dxDBGridRKOEF_BOLN: TdxDBGridCalcColumn
      HeaderAlignment = taCenter
      Width = 125
      BandIndex = 0
      RowIndex = 0
      FieldName = 'KOEF_BOLN'
    end
    object dxDBGridRSHIFRID: TdxDBGridColumn
      Visible = False
      Width = 101
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGridRKOEF_OTP: TdxDBGridCalcColumn
      HeaderAlignment = taCenter
      Width = 116
      BandIndex = 0
      RowIndex = 0
      FieldName = 'KOEF_OTP'
    end
  end
  object ComboBoxData: TComboBox
    Left = 8
    Top = 8
    Width = 185
    Height = 28
    Style = csDropDownList
    ItemHeight = 20
    TabOrder = 1
    OnSelect = ComboBoxDataSelect
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 456
    Width = 240
    Height = 25
    DataSource = DataSourceR
    Anchors = [akLeft, akBottom]
    TabOrder = 2
  end
  object pFIBDataSetR: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_RAZR_PROC'
      'SET '
      ' PROC      = :PROC,'
      ' OKLAD     = :OKLAD,'
      ' KOEF_BOLN = :KOEF_BOLN,'
      ' KOEF_OTP  = :KOEF_OTP,'
      ' RAZR      = :RAZR,'
      ' DATEFR    = :DATEFR'
      'WHERE'
      ' SHIFRID=:OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_RAZR_PROC'
      'WHERE'
      '  SHIFRID=:OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_RAZR_PROC('
      ' PROC,'
      ' OKLAD,'
      ' KOEF_BOLN,'
      ' KOEF_OTP,'
      ' RAZR,'
      ' DATEFR'
      ')'
      'VALUES('
      ' :PROC,'
      ' :OKLAD,'
      ' :KOEF_BOLN,'
      ' :KOEF_OTP,'
      ' :RAZR,'
      ' :DATEFR '
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' RAZR,'
      ' PROC,'
      ' OKLAD,'
      ' DATEFR,'
      ' KOEF_BOLN,'
      ' KOEF_OTP'
      'FROM'
      ' TB_RAZR_PROC'
      ''
      ' WHERE '
      '  TB_RAZR_PROC.SHIFRID = :OLD_SHIFRID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' RAZR,'
      ' PROC,'
      ' OKLAD,'
      ' DATEFR,'
      ' KOEF_BOLN,'
      ' KOEF_OTP,'
      ' SHIFRID'
      'FROM'
      ' TB_RAZR_PROC'
      'WHERE'
      ' DATEFR=:DATEFR'
      'ORDER BY DATEFR,RAZR ')
    AutoUpdateOptions.UpdateTableName = 'TB_RAZR_PROC'
    AutoUpdateOptions.KeyFields = 'SHIFRID'
    AutoUpdateOptions.GeneratorName = 'G_TR_RAZR'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = pFIBTransactionRRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 216
    Top = 8
    object pFIBDataSetRRAZR: TFIBIntegerField
      DisplayLabel = #1056#1072#1079#1088#1103#1076
      FieldName = 'RAZR'
      MaxValue = 1
      MinValue = 25
    end
    object pFIBDataSetRDATEFR: TFIBDateField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DATEFR'
    end
    object pFIBDataSetRPROC: TFIBBCDField
      DisplayLabel = #1055#1088#1086#1094
      FieldName = 'PROC'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetROKLAD: TFIBBCDField
      DisplayLabel = #1054#1082#1083#1072#1076
      FieldName = 'OKLAD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRKOEF_BOLN: TFIBBCDField
      DisplayLabel = #1050#1086#1101#1092'.'#1073#1086#1083#1085'.'
      FieldName = 'KOEF_BOLN'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetRKOEF_OTP: TFIBBCDField
      DisplayLabel = #1050#1086#1101#1092'.'#1086#1090#1087'.'
      FieldName = 'KOEF_OTP'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetRSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      Visible = False
    end
  end
  object DataSourceR: TDataSource
    DataSet = pFIBDataSetR
    Left = 256
    Top = 8
  end
  object pFIBTransactionRRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 288
    Top = 8
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 328
    Top = 8
  end
  object pFIBDataSetData: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' DATEFR'
      'FROM'
      ' TB_RAZR_PROC '
      'GROUP BY 1')
    Transaction = pFIBTransactionRRead
    Database = FIB.pFIBDatabaseSal
    Left = 368
    Top = 8
    object pFIBDataSetDataDATEFR: TFIBDateField
      FieldName = 'DATEFR'
    end
  end
  object DataSourceData: TDataSource
    DataSet = pFIBDataSetData
    Left = 408
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    Left = 120
    Top = 136
    object N1: TMenuItem
      Caption = #1044#1072#1090#1099' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1089#1090#1072#1074#1086#1082' '#1088#1072#1079#1088#1103#1076#1086#1074
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1079#1072#1087#1080#1089#1077#1081' '#1076#1083#1103' '#1091#1082#1072#1079#1072#1085#1085#1086#1081' '#1076#1072#1090#1099
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1056#1072#1089#1095#1077#1090' '#1082#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1086#1074' '#1086#1090#1087#1091#1089#1082#1085#1099#1093
      OnClick = N3Click
    end
  end
end
