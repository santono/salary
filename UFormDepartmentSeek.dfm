object FormDepartmentSeek: TFormDepartmentSeek
  Left = 192
  Top = 124
  Width = 696
  Height = 495
  Caption = #1059#1082#1072#1078#1080#1090#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
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
    457)
  PixelsPerInch = 96
  TextHeight = 13
  object dxDBTreeList1: TdxDBTreeList
    Left = 24
    Top = 48
    Width = 649
    Height = 369
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'ID'
    ParentField = 'IDOWNER'
    TabOrder = 0
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsoDep
    OptionsView = [etoAutoWidth, etoBandHeaderWidth, etoRowSelect, etoUseBitmap, etoUseImageIndexForSelected]
    PreviewFieldName = 'NAME'
    TreeLineColor = clGrayText
    object dxDBTreeList1ID: TdxDBTreeListMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ID'
    end
    object dxDBTreeList1IDOWNER: TdxDBTreeListMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'IDOWNER'
    end
    object dxDBTreeList1NAME: TdxDBTreeListMaskColumn
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
    object dxDBTreeList1IDPODR: TdxDBTreeListMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'IDPODR'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 24
    Top = 424
    Width = 228
    Height = 25
    DataSource = dsoDep
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbCancel, nbRefresh]
    Anchors = [akLeft, akBottom]
    TabOrder = 1
    OnClick = DBNavigator1Click
  end
  object BitBtn1: TBitBtn
    Left = 272
    Top = 424
    Width = 75
    Height = 25
    Caption = #1042#1099#1073#1086#1088
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object dsDep: TpFIBDataSet
    RefreshSQL.Strings = (
      'SELECT'
      ' ID,'
      ' IDOWNER,'
      ' NAME,'
      ' IDPODR'
      'FROM'
      ' TB_TREE_PODR '
      ''
      ' WHERE '
      '  TB_TREE_PODR.ID = :OLD_ID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' ID,'
      ' IDOWNER,'
      ' NAME,'
      ' IDPODR'
      'FROM'
      ' TB_TREE_PODR ')
    Transaction = trDepRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = trDepWrte
    AutoCommit = True
    Left = 72
    Top = 8
    object dsDepID: TFIBIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'ID'
    end
    object dsDepIDOWNER: TFIBIntegerField
      DisplayLabel = #1050#1086#1076' '#1074#1083#1072#1076#1077#1083#1100#1094#1072
      FieldName = 'IDOWNER'
    end
    object dsDepNAME: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object dsDepIDPODR: TFIBIntegerField
      DisplayLabel = #1050#1086#1076' '#1073#1091#1093
      FieldName = 'IDPODR'
    end
  end
  object trDepRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 112
    Top = 8
  end
  object dsoDep: TDataSource
    DataSet = dsDep
    Left = 40
    Top = 8
  end
  object trDepWrte: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 144
    Top = 8
  end
end
