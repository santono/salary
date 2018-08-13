object FormOtpUhod: TFormOtpUhod
  Left = 232
  Top = 152
  Width = 696
  Height = 499
  Caption = #1054#1090#1087#1091#1089#1082#1072' '#1087#1086' '#1091#1093#1086#1076#1091' '#1079#1072' '#1088#1077#1073#1077#1085#1082#1086#1084
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
    461)
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBOtpUhod: TdxDBGrid
    Left = 8
    Top = 8
    Width = 673
    Height = 401
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = dsOtpUhod
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBOtpUhodSHIFRID: TdxDBGridMaskColumn
      Visible = False
      Width = 137
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBOtpUhodTABNO: TdxDBGridButtonColumn
      HeaderAlignment = taCenter
      Sorted = csUp
      Width = 98
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = dxDBOtpUhodTABNOButtonClick
    end
    object dxDBOtpUhodFIO: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 321
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
    object dxDBOtpUhodDATEFR: TdxDBGridDateColumn
      HeaderAlignment = taCenter
      Width = 125
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATEFR'
    end
    object dxDBOtpUhodDATETO: TdxDBGridDateColumn
      HeaderAlignment = taCenter
      Width = 125
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATETO'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 416
    Width = 240
    Height = 25
    DataSource = dsOtpUhod
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 1
  end
  object dsOtpUhod: TDataSource
    DataSet = pFIBDataSetOtpUhod
    Left = 192
    Top = 24
  end
  object pFIBDataSetOtpUhod: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_OTP_UHOD'
      'SET '
      ' TABNO  = :TABNO,'
      ' FIO    = :FIO,'
      ' DATEFR = :DATEFR,'
      ' DATETO = :DATETO'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_OTP_UHOD'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_OTP_UHOD('
      ' SHIFRID,'
      ' TABNO,'
      ' FIO,'
      ' DATEFR,'
      ' DATETO'
      ')'
      'VALUES('
      ' :SHIFRID,'
      ' :TABNO,'
      ' :FIO,'
      ' :DATEFR,'
      ' :DATETO'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' TABNO,'
      ' FIO,'
      ' DATEFR,'
      ' DATETO'
      'FROM'
      ' TB_OTP_UHOD '
      ''
      ' WHERE '
      '  TB_OTP_UHOD.SHIFRID = :OLD_SHIFRID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' TABNO,'
      ' FIO,'
      ' DATEFR,'
      ' DATETO'
      'FROM'
      ' TB_OTP_UHOD '
      'order by shifrid')
    AutoUpdateOptions.UpdateTableName = 'TB_OTP_UHOD'
    AutoUpdateOptions.KeyFields = 'SHIFRID'
    AutoUpdateOptions.GeneratorName = 'G_OTP_UHOD'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = pFIBTrOtpUhodRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTrOtpUhod
    AutoCommit = True
    Left = 80
    Top = 24
    object pFIBDataSetOtpUhodSHIFRID: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'SHIFRID'
      Visible = False
    end
    object pFIBDataSetOtpUhodTABNO: TFIBIntegerField
      DisplayLabel = #1058#1072#1073'.'#1085#1086#1084'.'
      FieldName = 'TABNO'
    end
    object pFIBDataSetOtpUhodFIO: TFIBStringField
      DisplayLabel = #1060#1048#1054
      FieldName = 'FIO'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBDataSetOtpUhodDATEFR: TFIBDateField
      DisplayLabel = #1057
      FieldName = 'DATEFR'
    end
    object pFIBDataSetOtpUhodDATETO: TFIBDateField
      DisplayLabel = #1055#1086
      FieldName = 'DATETO'
    end
  end
  object pFIBTrOtpUhod: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 120
    Top = 24
  end
  object pFIBTrOtpUhodRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 160
    Top = 24
  end
end
