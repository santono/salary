object FormKindListLnr: TFormKindListLnr
  Left = 206
  Top = 138
  Width = 696
  Height = 480
  Caption = #1042#1080#1076#1099' '#1089#1087#1080#1089#1082#1086#1074
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
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 665
    Height = 41
    Anchors = [akLeft, akTop, akRight]
    Columns = 7
    Items.Strings = (
      #1088#1077#1082#1090#1086#1088#1072#1090
      #1040#1059#1055
      #1055#1055#1057
      #1059#1042#1055
      #1040#1061#1063
      #1050'-'#1055#1055#1057
      #1050'-'#1059#1042#1055)
    TabOrder = 0
    OnClick = RadioGroup1Click
  end
  object dxDBGrid1: TdxDBGrid
    Left = 8
    Top = 56
    Width = 665
    Height = 353
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'TABNO'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 1
    DataSource = dsoAUP
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGrid1TABNO: TdxDBGridMaskColumn
      Caption = #1058'.'#1085'.'
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
    end
    object dxDBGrid1FIO: TdxDBGridMaskColumn
      Caption = #1060#1048#1054
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
    object dxDBGrid1DOLG: TdxDBGridMaskColumn
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      HeaderAlignment = taCenter
      Sorted = csUp
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DOLG'
    end
    object dxDBGrid1KIND: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'KIND'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 408
    Width = 240
    Height = 25
    DataSource = dsoAUP
    Anchors = [akLeft, akBottom]
    TabOrder = 2
  end
  object dsAUP: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_LNR_KIND_OF_LISTS'
      'SET '
      ' TABNO = :TABNO,'
      ' DOLG = :DOLG,'
      ' KIND = :KIND'
      'WHERE'
      ' TABNO = :OLD_TABNO'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_LNR_KIND_OF_LISTS'
      'WHERE'
      '  TABNO = :OLD_TABNO'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_LNR_KIND_OF_LISTS('
      ' TABNO,'
      ' DOLG,'
      ' KIND'
      ')'
      'VALUES('
      ' :TABNO,'
      ' :DOLG,'
      ' :KIND'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' TABNO,'
      ' DOLG,'
      ' KIND'
      'FROM'
      ' TB_LNR_KIND_OF_LISTS '
      'where '
      '  TB_LNR_KIND_OF_LISTS.TABNO = :OLD_TABNO'
      '  '
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' TABNO,'
      ' DOLG,'
      ' KIND,'
      ' (select pib from kadry where kadry.tabno=a.tabno) fio'
      'FROM'
      ' TB_LNR_KIND_OF_LISTS a'
      'where kind=:kind')
    Transaction = trAUPRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = trAUPWrite
    AutoCommit = True
    Left = 104
    Top = 104
    object dsAUPTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object dsAUPDOLG: TFIBStringField
      FieldName = 'DOLG'
      Size = 51
      EmptyStrToNull = True
    end
    object dsAUPKIND: TFIBIntegerField
      FieldName = 'KIND'
    end
    object dsAUPFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 60
      EmptyStrToNull = True
    end
  end
  object trAUPWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 136
    Top = 104
  end
  object trAUPRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 168
    Top = 104
  end
  object dsoAUP: TDataSource
    DataSet = dsAUP
    Left = 200
    Top = 104
  end
end
