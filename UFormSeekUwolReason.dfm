object FormSeekUwolReason: TFormSeekUwolReason
  Left = 192
  Top = 124
  Width = 696
  Height = 480
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1087#1088#1080#1095#1080#1085' '#1091#1074#1086#1083#1100#1085#1077#1085#1080#1103
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
  object dxUwol: TdxDBGrid
    Left = 8
    Top = 8
    Width = 665
    Height = 401
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'ID'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    OnDblClick = dxUwolDblClick
    DataSource = dsoUwol
    Filter.Criteria = {00000000}
    OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEnterShowEditor, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
    OptionsCustomize = [edgoBandMoving, edgoBandSizing, edgoColumnMoving, edgoColumnSizing, edgoRowSizing]
    OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowAutoHeight, edgoRowSelect, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxUwolID: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ID'
    end
    object dxUwolCODE_EIAC: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'CODE_EIAC'
    end
    object dxUwolREASON: TdxDBGridMaskColumn
      Caption = #1055#1088#1080#1095#1080#1085#1072
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'REASON'
    end
    object dxUwolNAME: TdxDBGridMaskColumn
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 416
    Width = 240
    Height = 25
    DataSource = dsoUwol
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object dsoUwol: TDataSource
    DataSet = dsUwolSpr
    Left = 120
    Top = 16
  end
  object dsUwolSpr: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' ID,'
      ' CODE_EIAC,'
      ' NAME,'
      ' REASON'
      'FROM'
      ' TB_DISMIS '
      'order by id')
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    Left = 32
    Top = 16
    object dsUwolSprID: TFIBSmallIntField
      FieldName = 'ID'
      ReadOnly = True
    end
    object dsUwolSprCODE_EIAC: TFIBStringField
      FieldName = 'CODE_EIAC'
      ReadOnly = True
      Size = 24
      EmptyStrToNull = True
    end
    object dsUwolSprREASON: TFIBStringField
      FieldName = 'REASON'
      ReadOnly = True
      Size = 128
      EmptyStrToNull = True
    end
    object dsUwolSprNAME: TFIBStringField
      FieldName = 'NAME'
      ReadOnly = True
      Size = 256
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
    Left = 72
    Top = 16
  end
end
