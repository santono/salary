object FormSearchDolg: TFormSearchDolg
  Left = 192
  Top = 124
  Width = 696
  Height = 480
  Caption = #1055#1086#1080#1089#1082' '#1076#1086#1083#1078#1085#1086#1089#1090#1080
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
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 416
    Width = 240
    Height = 25
    DataSource = dsoDolg
    Anchors = [akLeft, akBottom]
    TabOrder = 0
  end
  object dxDBGridDolg: TdxDBGrid
    Left = 8
    Top = 40
    Width = 665
    Height = 369
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRDOL'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 1
    OnDblClick = dxDBGridDolgDblClick
    DataSource = dsoDolg
    Filter.Criteria = {00000000}
    OptionsBehavior = [edgoAutoSearch, edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridDolgSHIFRDOL: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRDOL'
    end
    object dxDBGridDolgNAME: TdxDBGridMaskColumn
      Sorted = csDown
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
  end
  object FilterString: TEdit
    Left = 8
    Top = 8
    Width = 425
    Height = 28
    TabOrder = 2
    Text = 'FilterString'
  end
  object btnSearch: TBitBtn
    Left = 440
    Top = 8
    Width = 75
    Height = 25
    Caption = #1055#1086#1080#1089#1082
    TabOrder = 3
    OnClick = btnSearchClick
  end
  object btnReset: TBitBtn
    Left = 520
    Top = 8
    Width = 75
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1082#1072
    TabOrder = 4
    OnClick = btnResetClick
  end
  object dsDolg: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRDOL,'
      ' NAME'
      ''
      ''
      'FROM'
      ' TB_DOLG '
      'ORDER BY SHIFRDOL')
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    OnFilterRecord = dsDolgFilterRecord
    Left = 48
    Top = 16
    object dsDolgSHIFRDOL: TFIBIntegerField
      DisplayLabel = #1064#1080#1092#1088
      FieldName = 'SHIFRDOL'
    end
    object dsDolgNAME: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 50
      EmptyStrToNull = True
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
    Left = 88
    Top = 16
  end
  object dsoDolg: TDataSource
    DataSet = dsDolg
    Left = 128
    Top = 16
  end
end
