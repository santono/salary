object FormPlatGen: TFormPlatGen
  Left = 201
  Top = 185
  Width = 748
  Height = 509
  Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103' '#1087#1083#1072#1090#1077#1078#1085#1099#1093' '#1074#1077#1076#1086#1084#1086#1089#1090#1077#1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    740
    465)
  PixelsPerInch = 96
  TextHeight = 20
  object LabelSta: TLabel
    Left = 8
    Top = 8
    Width = 125
    Height = 20
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1089#1090#1072#1090#1100#1102
  end
  object LabelCnt: TLabel
    Left = 16
    Top = 440
    Width = 4
    Height = 20
    Anchors = [akLeft, akBottom]
  end
  object GaugePodr: TGauge
    Left = 96
    Top = 160
    Width = 100
    Height = 100
    Kind = gkPie
    Progress = 0
    Visible = False
  end
  object Label1: TLabel
    Left = 584
    Top = 285
    Width = 43
    Height = 20
    Caption = 'N '#1087#1083#1090
  end
  object LabelPodr: TLabel
    Left = 16
    Top = 360
    Width = 72
    Height = 20
    Caption = 'LabelPodr'
    Visible = False
  end
  object LabelGruppa: TLabel
    Left = 16
    Top = 392
    Width = 93
    Height = 20
    Caption = 'LabelGruppa'
    Visible = False
  end
  object BitBtn1: TBitBtn
    Left = 496
    Top = 8
    Width = 33
    Height = 25
    Caption = '. . .'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object CheckBoxYellow: TCheckBox
    Left = 536
    Top = 8
    Width = 89
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #1046#1077#1083#1090#1080#1090#1100
    TabOrder = 1
  end
  object dxDBGridPodr: TdxDBGrid
    Left = 0
    Top = 32
    Width = 549
    Height = 401
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRPOD'
    SummaryGroups = <>
    SummarySeparator = ', '
    PopupMenu = PopupMenu1
    TabOrder = 2
    OnClick = dxDBGridPodrClick
    OnKeyDown = dxDBGridPodrKeyDown
    OnKeyPress = dxDBGridPodrKeyPress
    DataSource = DataSourcePodr
    Filter.Criteria = {00000000}
    OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoTabThrough, edgoVertThrough]
    OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridPodrSHIFRPOD: TdxDBGridMaskColumn
      Caption = #1064#1092#1088
      HeaderAlignment = taCenter
      Width = 44
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRPOD'
    end
    object dxDBGridPodrNAME: TdxDBGridMaskColumn
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      HeaderAlignment = taCenter
      Width = 289
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
  end
  object dxDBGridGRU: TdxDBGrid
    Left = 572
    Top = 32
    Width = 161
    Height = 242
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFR'
    SummaryGroups = <>
    SummarySeparator = ', '
    PopupMenu = PopupMenu2
    TabOrder = 3
    DataSource = DataSourceGru
    Filter.Criteria = {00000000}
    OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoTabThrough, edgoVertThrough]
    OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    Anchors = [akTop, akRight, akBottom]
    object dxDBGridGRUSHIFR: TdxDBGridMaskColumn
      Caption = ' '
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFR'
    end
    object dxDBGridGRUNAME: TdxDBGridMaskColumn
      Caption = #1057#1095#1077#1090
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
  end
  object BitBtn2: TBitBtn
    Left = 571
    Top = 347
    Width = 121
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 572
    Top = 440
    Width = 121
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 5
    Kind = bkClose
  end
  object dxCalcEditNomerPlt: TdxCalcEdit
    Left = 636
    Top = 280
    Width = 97
    TabOrder = 6
    Anchors = [akRight, akBottom]
    Alignment = taRightJustify
    Text = '0'
    StoredValues = 1
  end
  object ComboBoxBank: TComboBox
    Left = 572
    Top = 314
    Width = 161
    Height = 28
    Anchors = [akRight, akBottom]
    ItemHeight = 20
    TabOrder = 7
    Text = #1055#1088#1080#1074#1072#1090#1073#1072#1085#1082
  end
  object BitBtn4: TBitBtn
    Left = 572
    Top = 376
    Width = 121
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1056#1077#1077#1089#1090#1088' '#1087#1083'.'#1074#1077#1076'.'
    TabOrder = 8
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 572
    Top = 408
    Width = 121
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1048#1090#1086#1075#1080
    TabOrder = 9
    OnClick = BitBtn5Click
  end
  object CheckBoxColedge: TCheckBox
    Left = 632
    Top = 8
    Width = 89
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #1050#1086#1083#1077#1076#1078
    TabOrder = 10
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 440
    Width = 150
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 11
    Visible = False
  end
  object pFIBDataSetPodr: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    SHIFRPOD,'
      '    NAME'
      'FROM'
      '    PODR '
      'ORDER BY SHIFRPOD')
    Transaction = pFIBTransactionPodr
    Database = FIB.pFIBDatabaseSal
    Left = 24
    Top = 80
    object pFIBDataSetPodrSHIFRPOD: TFIBIntegerField
      FieldName = 'SHIFRPOD'
      ReadOnly = True
    end
    object pFIBDataSetPodrNAME: TFIBStringField
      FieldName = 'NAME'
      ReadOnly = True
      Size = 100
      EmptyStrToNull = True
    end
  end
  object DataSourcePodr: TDataSource
    DataSet = pFIBDataSetPodr
    Left = 64
    Top = 80
  end
  object pFIBDataSetGru: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    SHIFR,'
      '    NAME'
      'FROM'
      '    GRUPPY '
      'ORDER BY SHIFR')
    Transaction = pFIBTransactionGru
    Database = FIB.pFIBDatabaseSal
    Left = 584
    Top = 96
    object pFIBDataSetGruSHIFR: TFIBIntegerField
      FieldName = 'SHIFR'
      ReadOnly = True
    end
    object pFIBDataSetGruNAME: TFIBStringField
      FieldName = 'NAME'
      ReadOnly = True
      EmptyStrToNull = True
    end
  end
  object DataSourceGru: TDataSource
    DataSet = pFIBDataSetGru
    Left = 624
    Top = 96
  end
  object pFIBTransactionPodr: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 24
    Top = 112
  end
  object pFIBTransactionGru: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 584
    Top = 136
  end
  object PopupMenu1: TPopupMenu
    Left = 64
    Top = 112
    object N1: TMenuItem
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1096#1072#1073#1083#1086#1085
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100'  '#1074#1099#1073#1086#1088
      OnClick = N2Click
    end
    object N5: TMenuItem
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077
      OnClick = N5Click
    end
  end
  object pFIBQueryP: TpFIBQuery
    Transaction = pFIBTransactionP
    Database = FIB.pFIBDatabaseSal
    Left = 24
    Top = 144
  end
  object pFIBTransactionP: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 64
    Top = 144
  end
  object PopupMenu2: TPopupMenu
    Left = 624
    Top = 136
    object N3: TMenuItem
      Caption = #1042#1099#1073#1086#1088#1072#1090#1100' '#1096#1072#1073#1083#1086#1085
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074#1099#1073#1086#1088
      OnClick = N4Click
    end
  end
end
