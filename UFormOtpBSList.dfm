object FormOtpBSList: TFormOtpBSList
  Left = 257
  Top = 176
  Width = 696
  Height = 480
  Caption = #1057#1087#1080#1089#1086#1082' '#1086#1090#1087#1091#1089#1082#1086#1074' '#1073#1077#1079' '#1086#1087#1083#1072#1090#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    680
    442)
  PixelsPerInch = 96
  TextHeight = 13
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 416
    Width = 240
    Height = 25
    DataSource = dsoOtpBS
    Anchors = [akLeft, akBottom]
    TabOrder = 0
    OnClick = DBNavigator1Click
  end
  object grOtpBS: TdxDBGrid
    Left = 8
    Top = 8
    Width = 665
    Height = 401
    Bands = <
      item
      end
      item
        Caption = #1055#1088#1080#1082#1072#1079
      end
      item
        Caption = #1044#1072#1090#1099' '#1086#1090#1087#1091#1089#1082#1072
      end>
    DefaultLayout = False
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 1
    DataSource = dsoOtpBS
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoPartialLoad, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    ShowBands = True
    Anchors = [akLeft, akTop, akRight, akBottom]
    object grOtpBSID: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object grOtpBSTABNOButton: TdxDBGridButtonColumn
      Caption = #1058'.'#1085'.'
      HeaderAlignment = taCenter
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = grOtpBSTABNOButtonButtonClick
    end
    object grOtpBSTABNO: TdxDBGridMaskColumn
      Caption = #1058'.'#1085'.'
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
    end
    object grOtpBSFIO: TdxDBGridMaskColumn
      Caption = #1060#1072#1084#1080#1083#1083#1080#1103' '#1048'.'#1054'.'
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
    object grOtpBSNOMER_PRIK: TdxDBGridMaskColumn
      Caption = #1053#1086#1084#1077#1088
      HeaderAlignment = taCenter
      BandIndex = 1
      RowIndex = 0
      FieldName = 'NOMER_PRI'
    end
    object grOtpBSDATA_PRIK: TdxDBGridDateColumn
      Caption = #1044#1072#1090#1072
      HeaderAlignment = taCenter
      BandIndex = 1
      RowIndex = 0
      FieldName = 'DATA_PRI'
    end
    object grOtpBSDATE_FR: TdxDBGridDateColumn
      Caption = 'C'
      HeaderAlignment = taCenter
      BandIndex = 2
      RowIndex = 0
      FieldName = 'DATEFR'
    end
    object grOtpBSDATE_TO: TdxDBGridDateColumn
      Caption = #1055#1086
      HeaderAlignment = taCenter
      BandIndex = 2
      RowIndex = 0
      FieldName = 'DATETO'
    end
  end
  object dsoOtpBS: TDataSource
    DataSet = dsOtpBS
    Left = 48
    Top = 24
  end
  object dsOtpBS: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_OTP_BS'
      'SET '
      ' SHIFRID = :SHIFRID,'
      ' TABNO = :TABNO,'
      ' FIO = :FIO,'
      ' DATEFR = :DATEFR,'
      ' DATETO = :DATETO,'
      ' OTPDAY = :OTPDAY,'
      ' NOMER_PRI = :NOMER_PRI,'
      ' DATA_PRI = :DATA_PRI'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_OTP_BS'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_OTP_BS('
      ' SHIFRID,'
      ' TABNO,'
      ' FIO,'
      ' DATEFR,'
      ' DATETO,'
      ' OTPDAY,'
      ' NOMER_PRI,'
      ' DATA_PRI'
      ')'
      'VALUES('
      ' :SHIFRID,'
      ' :TABNO,'
      ' :FIO,'
      ' :DATEFR,'
      ' :DATETO,'
      ' :OTPDAY,'
      ' :NOMER_PRI,'
      ' :DATA_PRI'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' TABNO,'
      ' FIO,'
      ' DATEFR,'
      ' DATETO,'
      ' OTPDAY,'
      ' NOMER_PRI,'
      ' DATA_PRI'
      'FROM'
      ' TB_OTP_BS '
      ''
      ' WHERE '
      '  TB_OTP_BS.SHIFRID = :OLD_SHIFRID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' TABNO,'
      ' FIO,'
      ' DATEFR,'
      ' DATETO,'
      ' OTPDAY,'
      ' NOMER_PRI,'
      ' DATA_PRI'
      'FROM'
      ' TB_OTP_BS ')
    AutoUpdateOptions.UpdateTableName = 'TB_OTP_BS'
    AutoUpdateOptions.KeyFields = 'SHIFRID'
    AutoUpdateOptions.GeneratorName = 'G_OTP_BS'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    BeforeInsert = dsOtpBSBeforeInsert
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 96
    Top = 24
    object dsOtpBSSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object dsOtpBSTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object dsOtpBSFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 50
      EmptyStrToNull = True
    end
    object dsOtpBSDATEFR: TFIBDateField
      FieldName = 'DATEFR'
    end
    object dsOtpBSDATETO: TFIBDateField
      FieldName = 'DATETO'
    end
    object dsOtpBSOTPDAY: TFIBIntegerField
      FieldName = 'OTPDAY'
    end
    object dsOtpBSNOMER_PRI: TFIBStringField
      FieldName = 'NOMER_PRI'
      Size = 24
      EmptyStrToNull = True
    end
    object dsOtpBSDATA_PRI: TFIBDateField
      FieldName = 'DATA_PRI'
    end
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 144
    Top = 24
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TPBMode = tpbDefault
    Left = 176
    Top = 24
  end
end
