object FormSwodMode: TFormSwodMode
  Left = 373
  Top = 158
  Width = 590
  Height = 640
  Caption = #1056#1077#1078#1080#1084' '#1089#1074#1086#1076#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    574
    585)
  PixelsPerInch = 96
  TextHeight = 13
  object LabelCnt: TLabel
    Left = 11
    Top = 529
    Width = 3
    Height = 13
    Anchors = [akLeft, akBottom]
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 464
    Width = 153
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1074#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 8
    Top = 488
    Width = 153
    Height = 25
    Caption = '&'#1054#1090#1082#1072#1079
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Kind = bkClose
  end
  object StringGridGrp: TStringGrid
    Left = 8
    Top = 80
    Width = 161
    Height = 369
    ColCount = 1
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 6
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnDrawCell = StringGridGrpDrawCell
    OnKeyDown = StringGridGrpKeyDown
    OnMouseDown = StringGridGrpMouseDown
  end
  object StringGridKat: TStringGrid
    Left = 176
    Top = 80
    Width = 105
    Height = 169
    ColCount = 1
    DefaultRowHeight = 20
    FixedCols = 0
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnDrawCell = StringGridKatDrawCell
    OnKeyDown = StringGridKatKeyDown
    OnMouseDown = StringGridKatMouseDown
  end
  object ComboBoxMode: TComboBox
    Left = 8
    Top = 8
    Width = 529
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 20
    ParentFont = False
    TabOrder = 4
    Text = #1054#1073#1097#1072#1103
    OnChange = ComboBoxModeChange
    Items.Strings = (
      #1054#1073#1097#1072#1103
      #1055#1086' '#1080#1089#1090#1086#1095#1085#1080#1082#1072#1084' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
      #1055#1086' '#1082#1072#1090#1077#1075#1086#1088#1080#1103#1084' '#1088#1072#1073#1086#1090#1085#1080#1082#1086#1074
      #1055#1086' '#1082#1072#1090#1077#1075#1086#1088#1080#1103#1084' '#1089#1083#1091#1078#1072#1097#1080#1093' '#1080' '#1080#1089#1090#1086#1095#1085#1080#1082#1072#1084' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
      #1057#1086#1093#1088#1072#1085#1077#1085#1085#1099#1077' '#1089#1074#1086#1076#1099)
  end
  object ComboBoxUch: TComboBox
    Left = 8
    Top = 40
    Width = 529
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 20
    ItemIndex = 0
    ParentFont = False
    TabOrder = 5
    Text = #1055#1086' '#1091#1085#1080#1074#1077#1088#1089#1080#1090#1077#1090#1091
    OnChange = ComboBoxUchChange
    Items.Strings = (
      #1055#1086' '#1091#1085#1080#1074#1077#1088#1089#1080#1090#1077#1090#1091
      #1055#1086' '#1091#1095#1072#1089#1090#1082#1072#1084
      #1055#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1102)
  end
  object dxDBGridOpe: TdxDBGrid
    Left = 296
    Top = 80
    Width = 241
    Height = 169
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'shifrwrk'
    SummaryGroups = <>
    SummarySeparator = ', '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    BandFont.Charset = DEFAULT_CHARSET
    BandFont.Color = clWindowText
    BandFont.Height = -11
    BandFont.Name = 'MS Sans Serif'
    BandFont.Style = []
    DataSource = DataSourceOpe
    Filter.Criteria = {00000000}
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'MS Sans Serif'
    HeaderFont.Style = []
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    PreviewFont.Charset = DEFAULT_CHARSET
    PreviewFont.Color = clBlue
    PreviewFont.Height = -11
    PreviewFont.Name = 'MS Sans Serif'
    PreviewFont.Style = []
    object dxDBGridOpeNomerOp: TdxDBGridColumn
      Caption = #1053#1084#1088
      Width = 37
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NOMEROP'
    end
    object dxDBGridOpeFIOOP: TdxDBGridMaskColumn
      Width = 200
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIOOP'
    end
    object dxDBGridOpeSHIFRWRK: TdxDBGridMaskColumn
      Visible = False
      Width = 45
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRWRK'
    end
  end
  object dxDBGridPodr: TdxDBGrid
    Left = 176
    Top = 256
    Width = 361
    Height = 193
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRPOD'
    SummaryGroups = <>
    SummarySeparator = ', '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    BandFont.Charset = DEFAULT_CHARSET
    BandFont.Color = clWindowText
    BandFont.Height = -11
    BandFont.Name = 'MS Sans Serif'
    BandFont.Style = []
    DataSource = DataSourcePodr
    Filter.Criteria = {00000000}
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'MS Sans Serif'
    HeaderFont.Style = []
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    PreviewFont.Charset = DEFAULT_CHARSET
    PreviewFont.Color = clBlue
    PreviewFont.Height = -11
    PreviewFont.Name = 'MS Sans Serif'
    PreviewFont.Style = []
    object dxDBGridPodrSHIFRPOD: TdxDBGridMaskColumn
      Width = 40
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRPOD'
    end
    object dxDBGridPodrNAME: TdxDBGridMaskColumn
      Width = 317
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
  end
  object RadioGroupM: TRadioGroup
    Left = 320
    Top = 456
    Width = 257
    Height = 33
    Caption = #1056#1077#1078#1080#1084
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      #1042#1089#1077
      #1055#1077#1085#1089#1080#1086#1085#1077#1088#1099
      #1048#1085#1074#1072#1083#1080#1076#1099)
    TabOrder = 8
  end
  object RadioGroupP: TRadioGroup
    Left = 160
    Top = 456
    Width = 153
    Height = 33
    Caption = #1055#1083#1072#1085#1086#1074#1099#1081
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #1042#1089#1077
      #1055#1083#1072#1085#1086#1074#1099#1081)
    TabOrder = 9
  end
  object CheckBoxDogPod: TCheckBox
    Left = 176
    Top = 496
    Width = 169
    Height = 17
    Caption = #1044#1086#1075#1086#1074#1086#1088#1072' '#1087#1086#1076#1088#1103#1076#1072' '#1074#1083#1102#1095#1072#1090#1100
    TabOrder = 10
  end
  object CheckBoxTotal: TCheckBox
    Left = 352
    Top = 496
    Width = 129
    Height = 17
    Caption = #1057#1074#1086#1076' ('#1074#1089#1077' '#1076#1083#1103' '#1040#1083#1083#1099') '
    TabOrder = 11
  end
  object RadioGroupPrintMode: TRadioGroup
    Left = 288
    Top = 520
    Width = 289
    Height = 33
    Caption = #1056#1077#1078#1080#1084' '#1087#1077#1095#1072#1090#1080
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      #1060#1072#1089#1090#1056#1077#1087#1086#1088#1090
      'Excel'
      'DOS')
    TabOrder = 12
  end
  object dxDBGridSelPKG: TdxDBGrid
    Left = 8
    Top = 80
    Width = 529
    Height = 362
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    SummaryGroups = <>
    SummarySeparator = ', '
    PopupMenu = PopupMenu1
    TabOrder = 13
    DataSource = DataSourceSelPKG
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight]
    object dxDBGridSelPKGSHIFRID: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGridSelPKGNAME: TdxDBGridMaskColumn
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1086#1090#1095#1077#1090#1072
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
  end
  object DBNavigatorSelPKG: TDBNavigator
    Left = 8
    Top = 441
    Width = 234
    Height = 25
    DataSource = DataSourceSelPKG
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
    TabOrder = 14
  end
  object RadioGroupIllSS: TRadioGroup
    Left = 8
    Top = 520
    Width = 273
    Height = 33
    Caption = #1041#1086#1083#1100#1085#1080#1095#1085#1099#1077' '#1089#1086#1094'.'#1089#1090#1088#1072#1093'.'
    Columns = 3
    Items.Strings = (
      #1074#1082#1083#1102#1095#1072#1090#1100
      #1085#1077' '#1074#1082#1083#1102#1095#1072#1090#1100
      #1090#1086#1083#1100#1082#1086' '#1073#1086#1083#1085'. '#1057#1057)
    TabOrder = 15
  end
  object btnSowmMode: TButton
    Left = 488
    Top = 496
    Width = 81
    Height = 25
    Caption = 'btnSowmMode'
    TabOrder = 16
    OnClick = btnSowmModeClick
  end
  object RadioGroupChernob: TRadioGroup
    Left = 8
    Top = 552
    Width = 217
    Height = 33
    Caption = #1063#1077#1088#1085#1086#1073#1099#1083#1100#1089#1082#1080#1081' '#1086#1090#1087#1091#1089#1082
    Columns = 2
    Items.Strings = (
      #1053#1077' '#1074#1082#1083#1102#1095#1072#1090#1100
      #1042#1082#1083#1102#1095#1072#1090#1100)
    TabOrder = 17
  end
  object pFIBDataSetOpe: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    OPE.SHIFRWRK,'
      '    OPE.FIOOP,'
      '    OPE.NOMEROP'
      'FROM'
      '    OPERATORY OPE'
      'where '
      
        '    OPE.SHIFRWRK>1 and OPE.NOMEROP is not null and OPE.NOMEROP >' +
        ' 0'
      'order by OPE.NOMEROP')
    Transaction = FIB.pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    Left = 304
    Top = 112
    object pFIBDataSetOpeSHIFRWRK: TFIBIntegerField
      DisplayLabel = #1064#1092#1088
      FieldName = 'shifrwrk'
    end
    object pFIBDataSetOpeFIOOP: TFIBStringField
      DisplayLabel = #1059#1095#1072#1089#1090#1086#1082
      FieldName = 'FIOOP'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBDataSetOpeNOMEROP: TFIBSmallIntField
      FieldName = 'NOMEROP'
    end
  end
  object DataSourceOpe: TDataSource
    DataSet = pFIBDataSetOpe
    Left = 352
    Top = 112
  end
  object pFIBDataSetPodr: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    POD.SHIFRPOD,'
      '    POD.NAME'
      'FROM'
      '    PODR POD'
      'order by POD.SHIFRPOD'
      '')
    Transaction = FIB.pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    Left = 184
    Top = 264
    object pFIBDataSetPodrSHIFRPOD: TFIBIntegerField
      DisplayLabel = #1064#1092#1088
      FieldName = 'SHIFRPOD'
    end
    object pFIBDataSetPodrNAME: TFIBStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      FieldName = 'NAME'
      Size = 100
      EmptyStrToNull = True
    end
  end
  object DataSourcePodr: TDataSource
    DataSet = pFIBDataSetPodr
    Left = 216
    Top = 264
  end
  object pFIBDataSetSelPKG: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_NAME_PODR_SELECTION_DET'
      'SET '
      ' NAME = :NAME'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_NAME_PODR_SELECTION_DET'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' NAME'
      'FROM'
      ' TB_NAME_PODR_SELECTION_DET '
      'where(  SHIFRIDOWNER=3'
      '  ) and (  TB_NAME_PODR_SELECTION_DET.SHIFRID = :OLD_SHIFRID'
      '  )'
      '   ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' NAME'
      'FROM'
      ' TB_NAME_PODR_SELECTION_DET '
      'where SHIFRIDOWNER=3  ')
    Transaction = pFIBTransactionSelPKG
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 16
    Top = 128
    object pFIBDataSetSelPKGSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object pFIBDataSetSelPKGNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 128
      EmptyStrToNull = True
    end
  end
  object pFIBTransactionSelPKG: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 96
    Top = 128
  end
  object DataSourceSelPKG: TDataSource
    DataSet = pFIBDataSetSelPKG
    Left = 56
    Top = 128
  end
  object PopupMenu1: TPopupMenu
    Left = 144
    Top = 216
    object N1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1042#1099#1073#1088#1072#1090#1100
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    end
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 96
    Top = 160
  end
  object pFIBQuerySel: TpFIBQuery
    Transaction = pFIBTransactionSel
    Database = FIB.pFIBDatabaseSal
    Left = 304
    Top = 208
  end
  object pFIBTransactionSel: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 336
    Top = 208
  end
end
