object FormYSprRec: TFormYSprRec
  Left = 249
  Top = 173
  Width = 696
  Height = 480
  Caption = #1047#1072#1087#1080#1089#1080' '#1089#1087#1088#1072#1074#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object dxDBGrid1: TdxDBGrid
    Left = 8
    Top = 8
    Width = 625
    Height = 377
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    ShowSummaryFooter = True
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = dsYRec
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoUseBitmap]
    object dxDBGrid1SHIFRID: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGrid1SHIFRIDOWNER: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRIDOWNER'
    end
    object dxDBGrid1PERIOD: TdxDBGridMaskColumn
      Caption = #1052'-'#1094
      BandIndex = 0
      RowIndex = 0
      FieldName = 'PERIOD'
    end
    object dxDBGrid1SUMMAADD: TdxDBGridCurrencyColumn
      Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMAADD'
      SummaryFooterType = cstSum
      SummaryFooterField = 'SUMMAADD'
      DisplayFormat = ',0.00'
      Nullable = False
      SummaryField = 'SUMMAADD'
    end
    object dxDBGrid1SUMMAPOD: TdxDBGridCurrencyColumn
      Caption = #1053#1072#1083#1086#1075' '#1089' '#1076#1086#1093#1086#1076#1072
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMAPOD'
      SummaryFooterType = cstSum
      SummaryFooterField = 'SUMMAPOD'
      DisplayFormat = ',0.00'
      Nullable = False
      SummaryField = 'SUMMAPOD'
    end
    object dxDBGrid1SUMMAECB: TdxDBGridCurrencyColumn
      Caption = #1045#1057#1042
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMAECB'
      SummaryFooterType = cstSum
      SummaryFooterField = 'SUMMAECB'
      DisplayFormat = ',0.00'
      Nullable = False
      SummaryField = 'SUMMAECB'
    end
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 392
    Width = 161
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1090#1086#1075#1086#1074#1091#1102' '#1089#1091#1084#1084#1091
    TabOrder = 1
  end
  object pFIBdsYRec: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_SPR_ZARPL_PR'
      'SET '
      ' PERIOD = :PERIOD,'
      ' SUMMAADD = :SUMMAADD,'
      ' SUMMAPOD = :SUMMAPOD,'
      ' SUMMAECB = :SUMMAECB'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_SPR_ZARPL_PR'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_SPR_ZARPL_PR('
      ' SHIFRIDOWNER,'
      ' PERIOD,'
      ' SUMMAADD,'
      ' SUMMAPOD,'
      ' SUMMAECB'
      ')'
      'VALUES('
      ' :SHIFRIDOWNER,'
      ' :PERIOD,'
      ' :SUMMAADD,'
      ' :SUMMAPOD,'
      ' :SUMMAECB'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' SHIFRIDOWNER,'
      ' PERIOD,'
      ' SUMMAADD,'
      ' SUMMAPOD,'
      ' SUMMAECB'
      'FROM'
      ' TB_SPR_ZARPL_PR '
      'where'
      '  TB_SPR_ZARPL_PR.SHIFRID = :OLD_SHIFRID'
      '  '
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' SHIFRIDOWNER,'
      ' PERIOD,'
      ' SUMMAADD,'
      ' SUMMAPOD,'
      ' SUMMAECB'
      'FROM'
      ' TB_SPR_ZARPL_PR '
      'where shifridowner=:shifridowner'
      'order by period')
    Transaction = pFIBTransaction1
    Database = FIB.pFIBDatabaseSal
    AutoCommit = True
    Left = 32
    Top = 8
    object pFIBdsYRecSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object pFIBdsYRecSHIFRIDOWNER: TFIBIntegerField
      FieldName = 'SHIFRIDOWNER'
    end
    object pFIBdsYRecPERIOD: TFIBSmallIntField
      FieldName = 'PERIOD'
    end
    object pFIBdsYRecSUMMAADD: TFIBBCDField
      FieldName = 'SUMMAADD'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsYRecSUMMAPOD: TFIBBCDField
      FieldName = 'SUMMAPOD'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsYRecSUMMAECB: TFIBBCDField
      FieldName = 'SUMMAECB'
      Size = 2
      RoundByScale = True
    end
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 72
    Top = 8
  end
  object dsYRec: TDataSource
    DataSet = pFIBdsYRec
    Left = 112
    Top = 8
  end
end
