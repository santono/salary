object FormEditPrzB: TFormEditPrzB
  Left = 404
  Top = 214
  Width = 346
  Height = 390
  Caption = #1055#1088#1072#1079#1076#1085#1080#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    338
    346)
  PixelsPerInch = 96
  TextHeight = 20
  object PageControl1: TPageControl
    Left = 16
    Top = 8
    Width = 305
    Height = 318
    ActivePage = TabSheet2
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1041#1086#1083#1100#1085#1080#1095#1085#1099#1077
      DesignSize = (
        297
        283)
      object dxDBGrid1: TdxDBGrid
        Left = 8
        Top = 10
        Width = 281
        Height = 239
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFRID'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSource1
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCanAppend, edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGrid1DATEPRZ: TdxDBGridDateColumn
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DATEPRZ'
        end
        object dxDBGrid1DoW: TdxDBGridColumn
          Caption = #1044#1077#1085#1100' '#1085#1077#1076#1077#1083#1080
          HeaderAlignment = taCenter
          ReadOnly = True
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DayOfWeek'
        end
        object dxDBGrid1ShifrId: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRID'
        end
      end
      object DBNavigator1: TDBNavigator
        Left = 8
        Top = 256
        Width = 240
        Height = 25
        DataSource = DataSource1
        Anchors = [akLeft, akBottom]
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077
      ImageIndex = 1
      DesignSize = (
        297
        283)
      object dxDBGridOtp: TdxDBGrid
        Left = 0
        Top = 0
        Width = 297
        Height = 257
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
        OptionsDB = [edgoCanAppend, edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridOtpDATEPRZ: TdxDBGridDateColumn
          Caption = #1044#1072#1090#1072
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DATEPRZ'
        end
        object dxDBGridOtpDayOfWeek: TdxDBGridColumn
          Caption = #1044#1077#1085#1100' '#1085#1077#1076#1077#1083#1080
          ReadOnly = True
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DayOfWeek'
        end
        object dxDBGridOtpShifrId: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRID'
        end
      end
      object DBNavigator2: TDBNavigator
        Left = 8
        Top = 256
        Width = 240
        Height = 25
        DataSource = DataSourceOtp
        Anchors = [akLeft, akBottom]
        TabOrder = 1
      end
    end
  end
  object pFIBDataSet1: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE PRAZDNIKI'
      'SET '
      '    DATEPRZ = :DATEPRZ'
      'WHERE'
      '    SHIFRID = :OLD_SHIFRID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    PRAZDNIKI'
      'WHERE'
      '        SHIFRID = :OLD_SHIFRID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO PRAZDNIKI('
      '    MODE,'
      '    DATEPRZ'
      ')'
      'VALUES('
      '    1,'
      '    :DATEPRZ'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    DATEPRZ'
      'FROM'
      '    PRAZDNIKI'
      'where '
      '    PRAZDNIKI.SHIFRID = :OLD_SHIFRID'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    DATEPRZ,'
      '    shifrid'
      'FROM'
      '    PRAZDNIKI'
      'where mode=1'
      'order by 1 desc')
    OnCalcFields = pFIBDataSet1CalcFields
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 56
    Top = 48
    object pFIBDataSet1DATEPRZ: TFIBDateField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DATEPRZ'
    end
    object pFIBDataSet1DayOfWeek: TStringField
      FieldKind = fkCalculated
      FieldName = 'DayOfWeek'
      Size = 11
      Calculated = True
    end
    object pFIBDataSet1SHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
  end
  object DataSource1: TDataSource
    DataSet = pFIBDataSet1
    Left = 96
    Top = 48
  end
  object pFIBDataSetOtp: TpFIBDataSet
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted, cusDeleted, cusUninserted, cusDeletedApplied]
    UpdateSQL.Strings = (
      'UPDATE PRAZDNIKI'
      'SET '
      '    DATEPRZ = :DATEPRZ'
      'WHERE'
      '    SHIFRID = :OLD_SHIFRID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    PRAZDNIKI'
      'WHERE'
      '        SHIFRID = :OLD_SHIFRID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO PRAZDNIKI('
      '    MODE,'
      '    DATEPRZ    '
      ')'
      'VALUES('
      '    2, '
      '    :DATEPRZ'
      '    )')
    RefreshSQL.Strings = (
      'SELECT'
      '    DATEPRZ'
      'FROM'
      '    PRAZDNIKI'
      'where(PRAZDNIKI.SHIFRID = :OLD_SHIFRID)'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    DATEPRZ,'
      '    shifrid'
      'FROM'
      '    PRAZDNIKI'
      'where mode=2'
      'order by 1 desc')
    AfterInsert = pFIBDataSetOtpAfterInsert
    BeforeInsert = pFIBDataSetOtpBeforeInsert
    OnCalcFields = pFIBDataSetOtpCalcFields
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 148
    Top = 47
    object pFIBDataSetOtpDATEPRZ: TFIBDateField
      FieldName = 'DATEPRZ'
    end
    object pFIBDataSetOtpDayOfWeek: TStringField
      FieldKind = fkCalculated
      FieldName = 'DayOfWeek'
      Size = 11
      Calculated = True
    end
    object pFIBDataSetOtpSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
  end
  object DataSourceOtp: TDataSource
    DataSet = pFIBDataSetOtp
    Left = 188
    Top = 47
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 52
    Top = 111
  end
end
