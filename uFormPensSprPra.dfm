object FormPensSprPra: TFormPensSprPra
  Left = 273
  Top = 200
  Width = 696
  Height = 480
  Anchors = [akLeft, akTop, akRight, akBottom]
  Caption = #1057#1090#1072#1090#1100#1080', '#1074#1093#1086#1076#1103#1097#1080#1077' '#1074' '#1089#1087#1088#1072#1074#1082#1091
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
    688
    433)
  PixelsPerInch = 96
  TextHeight = 13
  object dxDBGrid1: TdxDBGrid
    Left = 8
    Top = 8
    Width = 673
    Height = 417
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'ShifrIdCalc'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = DataSource1
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGrid1shifrsta: TdxDBGridLookupColumn
      Caption = #1064#1092#1088
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      OnChange = dxDBGrid1shifrstaChange
      FieldName = 'SHIFRSTAL'
      DropDownWidth = 400
      ListFieldName = 'SHIFR;SHORTNAME'
      ListFieldIndex = 1
    end
    object dxDBGrid1WIDRABOTY: TdxDBGridCheckColumn
      Caption = #1042'-'#1056
      HeaderAlignment = taCenter
      MinWidth = 20
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'WIDRABOTY'
      ValueChecked = '1'
      ValueUnchecked = '2'
    end
    object dxDBGrid1NAMESTA: TdxDBGridMaskColumn
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAMESTA'
    end
  end
  object pFIBDataSetPensSprSpra1: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_SHIFRY_FOR_PENSSPR'
      'SET '
      '    NAMESTA = :NAMESTA'
      'WHERE'
      '    SHIFRSTA = :OLD_SHIFRSTA'
      '    and WIDRABOTY = :OLD_WIDRABOTY'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TB_SHIFRY_FOR_PENSSPR'
      'WHERE'
      '        SHIFRSTA = :OLD_SHIFRSTA'
      '    and WIDRABOTY = :OLD_WIDRABOTY'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO TB_SHIFRY_FOR_PENSSPR('
      '    SHIFRSTA,'
      '    WIDRABOTY,'
      '    NAMESTA'
      ')'
      'VALUES('
      '    :SHIFRSTA,'
      '    :WIDRABOTY,'
      '    :NAMESTA'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    SHIFRSTA,'
      '    WIDRABOTY,'
      '    NAMESTA'
      'FROM'
      '    TB_SHIFRY_FOR_PENSSPR '
      ' WHERE '
      '        TB_SHIFRY_FOR_PENSSPR.SHIFRSTA = :OLD_SHIFRSTA'
      '    and TB_SHIFRY_FOR_PENSSPR.WIDRABOTY = :OLD_WIDRABOTY'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    SHIFRSTA,'
      '    WIDRABOTY,'
      '    NAMESTA'
      'FROM'
      '    TB_SHIFRY_FOR_PENSSPR '
      'order by shifrsta,widraboty')
    Transaction = FIB.pFIBTransactionArc
    Database = FIB.pFIBDatabaseArc
    UpdateTransaction = FIB.pFIBTransactionArcWrite
    AutoCommit = True
    DataSource = DataSource2
    Left = 24
    Top = 40
    object pFIBDataSetPensSprSpra1shifrsta: TFIBIntegerField
      FieldKind = fkLookup
      FieldName = 'SHIFRSTAL'
      LookupDataSet = pFIBDataSetLook
      LookupKeyFields = 'SHIFR'
      LookupResultField = 'SHIFR'
      KeyFields = 'SHIFRSTA'
      Lookup = True
    end
    object pFIBDataSetPensSprSpra1WIDRABOTY: TFIBIntegerField
      FieldName = 'WIDRABOTY'
    end
    object pFIBDataSetPensSprSpra1NAMESTA: TFIBStringField
      FieldName = 'NAMESTA'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBDataSetPensSprSpra1SHIFRSTA2: TFIBIntegerField
      FieldName = 'SHIFRSTA'
    end
    object pFIBDataSetPensSprSpra1ShifrIdCalc: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ShifrIdCalc'
      Calculated = True
    end
  end
  object pFIBDataSetLook: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SHIFR'
      'SET '
      '    SHORTNAME = :SHORTNAME'
      'WHERE'
      '    SHIFR = :OLD_SHIFR'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    SHIFR'
      'WHERE'
      '        SHIFR = :OLD_SHIFR'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO SHIFR('
      '    SHIFR,'
      '    SHORTNAME'
      ')'
      'VALUES('
      '    :SHIFR,'
      '    :SHORTNAME'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    SHIFR,'
      '    shortname'
      'FROM'
      '    SHIFR '
      'where(  mode=1'
      '     ) and (     SHIFR.SHIFR = :OLD_SHIFR'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    SHIFR,'
      '    shortname'
      'FROM'
      '    SHIFR '
      'where mode=1'
      'order by shifr')
    OnCalcFields = pFIBDataSetLookCalcFields
    Transaction = FIB.pFIBTransactionArc
    Database = FIB.pFIBDatabaseArc
    UpdateTransaction = FIB.pFIBTransactionArcWrite
    Left = 64
    Top = 40
    object pFIBDataSetLookSHIFR: TFIBIntegerField
      FieldName = 'SHIFR'
    end
    object pFIBDataSetLookSHORTNAME: TFIBStringField
      FieldName = 'SHORTNAME'
      EmptyStrToNull = True
    end
  end
  object DataSource1: TDataSource
    DataSet = pFIBDataSetPensSprSpra1
    Left = 40
    Top = 72
  end
  object DataSource2: TDataSource
    DataSet = pFIBDataSetLook
    Left = 88
    Top = 72
  end
end
