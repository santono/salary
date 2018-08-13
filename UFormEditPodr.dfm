object FormEditPodr: TFormEditPodr
  Left = 255
  Top = 111
  Width = 696
  Height = 571
  Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
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
    680
    533)
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridPodr: TdxDBGrid
    Left = 8
    Top = 8
    Width = 673
    Height = 489
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRPOD'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = DataSourcePodr
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridPodrSHIFRPOD: TdxDBGridMaskColumn
      Caption = #1064#1080#1092#1088
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRPOD'
    end
    object dxDBGridPodrNAME: TdxDBGridMaskColumn
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
    object dxDBGridPodrMO_BUD: TdxDBGridCheckColumn
      Caption = #1041#1091#1076
      MinWidth = 20
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MO_BUD'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridPodrMO_VNE: TdxDBGridCheckColumn
      Caption = #1042#1085#1077
      MinWidth = 20
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MO_VNE'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridPodrMO_KOL_BUD: TdxDBGridCheckColumn
      Caption = #1050#1073#1091#1076
      MinWidth = 20
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MO_KOL_BUD'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridPodrMO_KOL_VNE: TdxDBGridCheckColumn
      Caption = #1050#1074#1085#1077
      MinWidth = 20
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MO_KOL_VNE'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridPodrMO_GN: TdxDBGridCheckColumn
      Caption = #1043#1053
      MinWidth = 20
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MO_GN'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridPodrMO_NIS: TdxDBGridCheckColumn
      Caption = #1053#1048#1057
      MinWidth = 20
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MO_NIS'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridPodrMO_MAG_BUD: TdxDBGridCheckColumn
      Caption = #1052#1072#1075#1073
      MinWidth = 20
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MO_MAG_BUD'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridPodrMO_MAG_VNE: TdxDBGridCheckColumn
      Caption = #1052#1072#1075#1074
      MinWidth = 20
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MO_MAG_VNE'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridPodrMO_MP: TdxDBGridCheckColumn
      Caption = #1052#1055
      MinWidth = 20
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MO_MP'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridPodrEmpty: TdxDBGridCheckColumn
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'CANBEEMPTY'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
  end
  object DBNavigatorPodr: TDBNavigator
    Left = 8
    Top = 496
    Width = 240
    Height = 25
    DataSource = DataSourcePodr
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 608
    Top = 496
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object pFIBDataSetPodr: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE PODR'
      'SET '
      '    SHIFRPOD = :SHIFRPOD,'
      '    NAME = :NAME,'
      '    MO_BUD = :MO_BUD,'
      '    MO_VNE = :MO_VNE,'
      '    MO_KOL_BUD = :MO_KOL_BUD,'
      '    MO_KOL_VNE = :MO_KOL_VNE,'
      '    MO_GN = :MO_GN,'
      '    MO_NIS = :MO_NIS,'
      '    MO_MAG_BUD = :MO_MAG_BUD,'
      '    MO_MAG_VNE = :MO_MAG_VNE,'
      '    MO_MP = :MO_MP,'
      '    CANBEEMPTY = :CANBEEMPTY'
      'WHERE'
      '    SHIFRPOD = :OLD_SHIFRPOD'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    PODR'
      'WHERE'
      '        SHIFRPOD = :OLD_SHIFRPOD'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO PODR('
      '    SHIFRPOD,'
      '    NAME,'
      '    MO_BUD,'
      '    MO_VNE,'
      '    MO_KOL_BUD,'
      '    MO_KOL_VNE,'
      '    MO_GN,'
      '    MO_NIS,'
      '    MO_MAG_BUD,'
      '    MO_MAG_VNE,'
      '    MO_MP,'
      '    CANBEEMPTY'
      ')'
      'VALUES('
      '    :SHIFRPOD,'
      '    :NAME,'
      '    :MO_BUD,'
      '    :MO_VNE,'
      '    :MO_KOL_BUD,'
      '    :MO_KOL_VNE,'
      '    :MO_GN,'
      '    :MO_NIS,'
      '    :MO_MAG_BUD,'
      '    :MO_MAG_VNE,'
      '    :MO_MP,'
      '    :CANBEEMPTY'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    POD.SHIFRPOD,'
      '    POD.NAME,'
      '    POD.MO_BUD,'
      '    POD.MO_VNE,'
      '    POD.MO_KOL_BUD,'
      '    POD.MO_KOL_VNE,'
      '    POD.MO_GN,'
      '    POD.MO_NIS,'
      '    POD.MO_MAG_BUD,'
      '    POD.MO_MAG_VNE,'
      '    POD.MO_MP,'
      '    POD.CANBEEMPTY'
      'FROM'
      '    PODR POD'
      ' WHERE '
      '        POD.SHIFRPOD = :OLD_SHIFRPOD'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    POD.SHIFRPOD,'
      '    POD.NAME,'
      '    POD.MO_BUD,'
      '    POD.MO_VNE,'
      '    POD.MO_KOL_BUD,'
      '    POD.MO_KOL_VNE,'
      '    POD.MO_GN,'
      '    POD.MO_NIS,'
      '    POD.MO_MAG_BUD,'
      '    POD.MO_MAG_VNE,'
      '    POD.MO_MP,'
      '    POD.CANBEEMPTY'
      'FROM'
      '    PODR POD')
    Transaction = pFIBTransaction1
    Database = FIB.pFIBDatabaseSal
    AutoCommit = True
    Left = 32
    Top = 56
    object pFIBDataSetPodrSHIFRPOD: TFIBIntegerField
      FieldName = 'SHIFRPOD'
    end
    object pFIBDataSetPodrNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSetPodrMO_BUD: TFIBIntegerField
      FieldName = 'MO_BUD'
    end
    object pFIBDataSetPodrMO_VNE: TFIBIntegerField
      FieldName = 'MO_VNE'
    end
    object pFIBDataSetPodrMO_KOL_BUD: TFIBIntegerField
      FieldName = 'MO_KOL_BUD'
    end
    object pFIBDataSetPodrMO_KOL_VNE: TFIBIntegerField
      FieldName = 'MO_KOL_VNE'
    end
    object pFIBDataSetPodrMO_GN: TFIBIntegerField
      FieldName = 'MO_GN'
    end
    object pFIBDataSetPodrMO_NIS: TFIBIntegerField
      FieldName = 'MO_NIS'
    end
    object pFIBDataSetPodrMO_MAG_BUD: TFIBIntegerField
      FieldName = 'MO_MAG_BUD'
    end
    object pFIBDataSetPodrMO_MAG_VNE: TFIBIntegerField
      FieldName = 'MO_MAG_VNE'
    end
    object pFIBDataSetPodrMO_MP: TFIBIntegerField
      FieldName = 'MO_MP'
    end
    object pFIBDataSetPodrCANBEEMPTY: TFIBSmallIntField
      DisplayLabel = #1055#1091#1089#1090#1086#1077
      FieldName = 'CANBEEMPTY'
      MaxValue = 1
    end
  end
  object DataSourcePodr: TDataSource
    DataSet = pFIBDataSetPodr
    Left = 72
    Top = 56
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 48
    Top = 128
  end
end
