object FormSelPKGSave: TFormSelPKGSave
  Left = 224
  Top = 170
  Width = 796
  Height = 532
  Caption = #1059#1082#1072#1078#1080#1090#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
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
    788
    488)
  PixelsPerInch = 96
  TextHeight = 20
  object BitBtn1: TBitBtn
    Left = 291
    Top = 460
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Enabled = False
    TabOrder = 0
    Visible = False
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 384
    Top = 460
    Width = 105
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    OnClick = BitBtn2Click
    Kind = bkClose
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 0
    Width = 769
    Height = 457
    ActivePage = TabSheet1
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
      DesignSize = (
        761
        422)
      object LabelCnt: TLabel
        Left = 8
        Top = 400
        Width = 64
        Height = 20
        Anchors = [akLeft, akBottom]
        Caption = 'LabelCnt'
      end
      object dxDBGridPodr: TdxDBGrid
        Left = 8
        Top = 8
        Width = 713
        Height = 385
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFRPOD'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        OnClick = dxDBGridPodrClick
        OnKeyDown = dxDBGridPodrKeyDown
        OnKeyPress = dxDBGridPodrKeyPress
        DataSource = DataSourcePodr
        Filter.Criteria = {00000000}
        OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoTabThrough, edgoVertThrough]
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridPodrSHIFRPOD: TdxDBGridMaskColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRPOD'
        end
        object dxDBGridPodrNAME: TdxDBGridMaskColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAME'
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080
      ImageIndex = 1
      DesignSize = (
        761
        422)
      object LabelKat: TLabel
        Left = 8
        Top = 400
        Width = 63
        Height = 20
        Caption = 'LabelKat'
      end
      object dxDBGridKat: TdxDBGrid
        Left = 8
        Top = 16
        Width = 721
        Height = 377
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFR'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        OnClick = dxDBGridKatClick
        OnKeyDown = dxDBGridKatKeyDown
        OnKeyPress = dxDBGridKatKeyPress
        DataSource = DataSourceKat
        Filter.Criteria = {00000000}
        OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoTabThrough, edgoVertThrough]
        OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight]
        object dxDBGridKatSHIFR: TdxDBGridMaskColumn
          Caption = #1064#1092#1088
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFR'
        end
        object dxDBGridKatNAME: TdxDBGridMaskColumn
          Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAME'
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1057#1095#1077#1090#1072
      ImageIndex = 2
      object LabelGru: TLabel
        Left = 8
        Top = 392
        Width = 66
        Height = 20
        Caption = 'LabelGru'
      end
      object dxDBGridGRU: TdxDBGrid
        Left = 0
        Top = 16
        Width = 753
        Height = 361
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFR'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        OnClick = dxDBGridGRUClick
        OnKeyDown = dxDBGridGRUKeyDown
        OnKeyPress = dxDBGridGRUKeyPress
        DataSource = DataSourceGru
        Filter.Criteria = {00000000}
        OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoTabThrough, edgoVertThrough]
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
        object dxDBGridGRUSHIFR: TdxDBGridMaskColumn
          Caption = #1064#1092#1088
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFR'
        end
        object dxDBGridGRUNAME: TdxDBGridMaskColumn
          Caption = #1057#1095#1077#1090
          Width = 221
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAME'
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1057#1090#1072#1090#1100#1080
      ImageIndex = 3
      DesignSize = (
        761
        422)
      object LabelSta: TLabel
        Left = 0
        Top = 400
        Width = 64
        Height = 20
        Caption = 'LabelSta'
      end
      object dxDBGridSta: TdxDBGrid
        Left = 0
        Top = 8
        Width = 745
        Height = 385
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFR'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        OnClick = dxDBGridStaClick
        OnKeyDown = dxDBGridStaKeyDown
        OnKeyPress = dxDBGridStaKeyPress
        DataSource = DataSourceShifrAdd
        Filter.Criteria = {00000000}
        OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoTabThrough, edgoVertThrough]
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridStaSHIFR: TdxDBGridMaskColumn
          Caption = #1064#1092#1088
          HeaderAlignment = taCenter
          Width = 89
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFR'
        end
        object dxDBGridStaNAME: TdxDBGridMaskColumn
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          HeaderAlignment = taCenter
          Width = 652
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAME'
        end
      end
    end
  end
  object BitBtn3: TBitBtn
    Left = 16
    Top = 460
    Width = 153
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074#1099#1073#1086#1088
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object pFIBDataSetPodr: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    POD.SHIFRPOD,'
      '    POD.NAME'
      'FROM'
      '    PODR POD'
      'ORDER BY SHIFRPOD')
    AllowedUpdateKinds = []
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    Left = 32
    Top = 80
    object pFIBDataSetPodrSHIFRPOD: TFIBIntegerField
      DisplayLabel = #1064#1080#1092#1088
      FieldName = 'SHIFRPOD'
      Origin = 'PODR.SHIFRPOD'
    end
    object pFIBDataSetPodrNAME: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Origin = 'PODR.NAME'
      Size = 100
      EmptyStrToNull = True
    end
  end
  object DataSourcePodr: TDataSource
    DataSet = pFIBDataSetPodr
    Left = 72
    Top = 80
  end
  object pFIBDataSetKat: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    SHIFR,'
      '    NAME'
      'FROM'
      '    KATEG '
      'order'
      '    by shifr')
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    Left = 32
    Top = 112
    object pFIBDataSetKatSHIFR: TFIBIntegerField
      FieldName = 'SHIFR'
      ReadOnly = True
    end
    object pFIBDataSetKatNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 40
      EmptyStrToNull = True
    end
  end
  object DataSourceKat: TDataSource
    DataSet = pFIBDataSetKat
    Left = 72
    Top = 112
  end
  object pFIBDataSetGru: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    SHIFR,'
      '    NAME'
      'FROM'
      '    GRUPPY '
      'ORDER BY SHIFR'
      '    ')
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    Left = 32
    Top = 144
    object pFIBDataSetGruSHIFR: TFIBIntegerField
      FieldName = 'SHIFR'
    end
    object pFIBDataSetGruNAME: TFIBStringField
      FieldName = 'NAME'
      EmptyStrToNull = True
    end
  end
  object DataSourceGru: TDataSource
    DataSet = pFIBDataSetGru
    Left = 72
    Top = 144
  end
  object pFIBDataSetShifrAdd: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    SHIFR,'
      '    NAME'
      'FROM'
      '    SHIFR '
      'ORDER BY SHIFR')
    AllowedUpdateKinds = []
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    Left = 28
    Top = 175
    object pFIBDataSetShifrAddSHIFR: TFIBIntegerField
      FieldName = 'SHIFR'
    end
    object pFIBDataSetShifrAddNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 52
      EmptyStrToNull = True
    end
  end
  object DataSourceShifrAdd: TDataSource
    DataSet = pFIBDataSetShifrAdd
    Left = 68
    Top = 175
  end
  object pFIBQuerySave: TpFIBQuery
    Transaction = pFIBTransactionSave
    Database = FIB.pFIBDatabaseSal
    Left = 116
    Top = 79
  end
  object pFIBTransactionSave: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 156
    Top = 79
  end
end
