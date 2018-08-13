object FormSwodyCmp: TFormSwodyCmp
  Left = 207
  Top = 149
  Width = 696
  Height = 480
  Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1089#1074#1086#1076#1086#1074
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
  object dxDBGridSwody: TdxDBGrid
    Left = 8
    Top = 48
    Width = 665
    Height = 393
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    SummaryGroups = <>
    SummarySeparator = ', '
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnDblClick = dxDBGridSwodyDblClick
    DataSource = dsSwodyCmp
    Filter.Criteria = {00000000}
    OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoTabThrough, edgoVertThrough]
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowAutoHeight, edgoRowSelect, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridSwodySHIFRID: TdxDBGridMaskColumn
      Visible = False
      Width = 80
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGridSwodyNAME: TdxDBGridMaskColumn
      Visible = False
      Width = 382
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
    object dxDBGridSwodyYEARVY: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'YEARVY'
    end
    object dxDBGridSwodyMONTHVY: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Visible = False
      Width = 63
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MONTHVY'
    end
    object dxDBGridSwodySHIFRWRK: TdxDBGridMaskColumn
      Visible = False
      Width = 80
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRWRK'
    end
    object dxDBGridSwodyCheck: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 52
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SEL'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridSwodyDATEWRK: TdxDBGridDateColumn
      HeaderAlignment = taCenter
      Width = 91
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATEWRK'
    end
    object dxDBGridSwodyNAMEDET: TdxDBGridMemoColumn
      HeaderAlignment = taCenter
      Width = 518
      BandIndex = 0
      RowIndex = 0
      HeaderMaxLineCount = 1
      FieldName = 'NAMEDET'
      MaxDisplayLength = 100
    end
  end
  object DateTimePicker: TDateTimePicker
    Left = 16
    Top = 8
    Width = 185
    Height = 28
    Date = 41214.394112395840000000
    Format = 'MMMM yyyy'
    Time = 41214.394112395840000000
    DateFormat = dfLong
    DateMode = dmUpDown
    TabOrder = 1
    OnChange = DateTimePickerChange
  end
  object pFIBdsSwodyCmp: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_SWODY_HAT'
      'SET '
      ' SEL = :SEL'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_SWODY_HAT'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_SWODY_HAT('
      ' SHIFRID,'
      ' NAME,'
      ' YEARVY,'
      ' MONTHVY,'
      ' SHIFRWRK,'
      ' DATEWRK,'
      ' NAMEDET,'
      ' SEL'
      ')'
      'VALUES('
      ' :SHIFRID,'
      ' :NAME,'
      ' :YEARVY,'
      ' :MONTHVY,'
      ' :SHIFRWRK,'
      ' :DATEWRK,'
      ' :NAMEDET,'
      ' :SEL'
      ') ')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' NAME,'
      ' YEARVY,'
      ' MONTHVY,'
      ' SHIFRWRK,'
      ' DATEWRK,'
      ' NAMEDET,sel'
      'FROM'
      ' TB_SWODY_HAT '
      'where(  yearvy=:yearvy'
      'and monthvy=:monthvy'
      '  ) and (  TB_SWODY_HAT.SHIFRID = :OLD_SHIFRID'
      '  )'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' NAME,'
      ' YEARVY,'
      ' MONTHVY,'
      ' SHIFRWRK,'
      ' DATEWRK,'
      ' NAMEDET,sel'
      'FROM'
      ' TB_SWODY_HAT '
      'where yearvy=:yearvy'
      'and monthvy=:monthvy'
      'order by datewrk desc')
    AllowedUpdateKinds = [ukModify]
    Transaction = pFIBTrSwodyRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTrSwodyWrite
    AutoCommit = True
    Left = 32
    Top = 24
    object pFIBdsSwodyCmpSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      Visible = False
    end
    object pFIBdsSwodyCmpNAME: TFIBStringField
      FieldName = 'NAME'
      Visible = False
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBdsSwodyCmpYEARVY: TFIBIntegerField
      DisplayLabel = #1043#1086#1076
      FieldName = 'YEARVY'
    end
    object pFIBdsSwodyCmpMONTHVY: TFIBIntegerField
      DisplayLabel = #1052#1094
      FieldName = 'MONTHVY'
    end
    object pFIBdsSwodyCmpSHIFRWRK: TFIBIntegerField
      FieldName = 'SHIFRWRK'
    end
    object pFIBdsSwodyCmpDATEWRK: TFIBDateTimeField
      DisplayLabel = #1057#1086#1079#1076#1072#1085
      FieldName = 'DATEWRK'
    end
    object pFIBdsSwodyCmpNAMEDET: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAMEDET'
      Size = 4096
      EmptyStrToNull = True
    end
    object pFIBdsSwodyCmpSEL: TFIBSmallIntField
      DisplayLabel = #1052#1088#1082
      FieldName = 'SEL'
      MaxValue = 1
    end
  end
  object dsSwodyCmp: TDataSource
    DataSet = pFIBdsSwodyCmp
    Left = 80
    Top = 24
  end
  object pFIBTrSwodyRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 120
    Top = 24
  end
  object pFIBTrSwodyWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 168
    Top = 24
  end
  object PopupMenu1: TPopupMenu
    Left = 200
    Top = 168
    object N1: TMenuItem
      Caption = #1053#1072#1081#1090#1080' '#1088#1072#1079#1083#1080#1095#1080#1103' '#1074' '#1076#1074#1091#1093' '#1089#1074#1086#1076#1072#1093
      OnClick = N1Click
    end
  end
end
