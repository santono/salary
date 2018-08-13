object FormVipTabno: TFormVipTabno
  Left = 221
  Top = 153
  Width = 696
  Height = 480
  Caption = #1057#1087#1080#1089#1086#1073' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1076#1083#1103' '#1086#1090#1076#1077#1083#1100#1085#1099#1093' '#1087#1083#1072#1090#1077#1078#1085#1099#1093' '#1074#1077#1076#1086#1084#1086#1089#1090#1077#1081
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
    442)
  PixelsPerInch = 96
  TextHeight = 20
  object dxVipTabno: TdxDBGrid
    Left = 8
    Top = 8
    Width = 665
    Height = 401
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'TABNO'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = dsoVipTabno
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxVipTabnoTABNO: TdxDBGridMaskColumn
      Caption = #1058'.'#1085'.'
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
    end
    object dxVipTabnoFIO: TdxDBGridMaskColumn
      Caption = #1060#1048#1054
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
    object dxVipTabnoKind: TdxDBGridSpinColumn
      Caption = #1058#1080#1087
      BandIndex = 0
      RowIndex = 0
      FieldName = 'KIND'
      MinValue = 1.000000000000000000
      MaxValue = 10.000000000000000000
    end
    object dxVipTabnoButton: TdxDBGridButtonColumn
      BandIndex = 0
      RowIndex = 0
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = dxVipTabnoButtonButtonClick
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 408
    Width = 240
    Height = 25
    DataSource = dsoVipTabno
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object dsVipTabno: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_VIP_TABNO'
      'SET '
      ' FIO = :FIO,'
      ' KIND = :KIND'
      'WHERE'
      ' TABNO = :OLD_TABNO'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_VIP_TABNO'
      'WHERE'
      '  TABNO = :OLD_TABNO'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_VIP_TABNO('
      ' TABNO,'
      ' FIO,'
      ' KIND'
      ')'
      'VALUES('
      ' :TABNO,'
      ' :FIO,'
      ' :KIND'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' TABNO,'
      ' FIO,'
      ' KIND'
      'FROM'
      ' TB_VIP_TABNO '
      ''
      ' WHERE '
      '  TB_VIP_TABNO.TABNO = :OLD_TABNO'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' TABNO,'
      ' FIO,'
      ' KIND'
      'FROM'
      ' TB_VIP_TABNO '
      'order by fio')
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 24
    Top = 8
    object dsVipTabnoTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object dsVipTabnoFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 50
      EmptyStrToNull = True
    end
    object dsVipTabnoKIND: TFIBSmallIntField
      FieldName = 'KIND'
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
    Left = 64
    Top = 8
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 96
    Top = 8
  end
  object dsoVipTabno: TDataSource
    DataSet = dsVipTabno
    Left = 128
    Top = 8
  end
end
