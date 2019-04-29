object FormSearchClassificator: TFormSearchClassificator
  Left = 245
  Top = 131
  Width = 696
  Height = 527
  Caption = #1050#1083#1072#1089#1089#1080#1092#1080#1082#1072#1090#1086#1088' '#1076#1086#1083#1078#1085#1086#1089#1090#1077#1081
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
    489)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 40
    Height = 13
    Caption = #1060#1080#1083#1100#1090#1088
  end
  object dxDBGridCla: TdxDBGrid
    Left = 8
    Top = 40
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
    OnDblClick = dxDBGridClaDblClick
    DataSource = dsoClassificator
    Filter.Criteria = {00000000}
    OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEnterShowEditor, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
    OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridClaKODKP: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 38
      BandIndex = 0
      RowIndex = 0
      FieldName = 'KODKP'
    end
    object dxDBGridClaKODZKPPTR: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 57
      BandIndex = 0
      RowIndex = 0
      FieldName = 'KODZKPPTR'
    end
    object dxDBGridClaETKD: TdxDBGridMaskColumn
      Visible = False
      Width = 58
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ETKD'
    end
    object dxDBGridClaDKHP: TdxDBGridMaskColumn
      Visible = False
      Width = 58
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DKHP'
    end
    object dxDBGridClaNAME: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Sorted = csUp
      Width = 566
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
    object dxDBGridClaID: TdxDBGridMaskColumn
      Visible = False
      Width = 58
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ID'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 456
    Width = 240
    Height = 25
    DataSource = dsoClassificator
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object cxTextEditFilter: TcxTextEdit
    Left = 56
    Top = 8
    TabOrder = 2
    Width = 313
  end
  object BitBtn1: TBitBtn
    Left = 376
    Top = 8
    Width = 49
    Height = 25
    Caption = #1055#1086#1080#1089#1082
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 432
    Top = 8
    Width = 75
    Height = 25
    Caption = #1057#1073#1088#1086#1089
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object dsClassificator: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' KODKP,'
      ' KODZKPPTR,'
      ' ETKD,'
      ' DKHP,'
      ' NAME,'
      ' ID'
      'FROM'
      ' TB_CLASSIFICATOR'
      'ORDER BY NAME ')
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    Left = 40
    Top = 48
    object dsClassificatorKODKP: TFIBStringField
      DisplayLabel = #1050#1055
      FieldName = 'KODKP'
      Size = 10
      EmptyStrToNull = True
    end
    object dsClassificatorKODZKPPTR: TFIBStringField
      DisplayLabel = #1047#1050#1055#1055#1058#1056
      FieldName = 'KODZKPPTR'
      Size = 10
      EmptyStrToNull = True
    end
    object dsClassificatorETKD: TFIBStringField
      FieldName = 'ETKD'
      Visible = False
      Size = 10
      EmptyStrToNull = True
    end
    object dsClassificatorDKHP: TFIBStringField
      FieldName = 'DKHP'
      Visible = False
      Size = 10
      EmptyStrToNull = True
    end
    object dsClassificatorNAME: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 512
      EmptyStrToNull = True
    end
    object dsClassificatorID: TFIBIntegerField
      FieldName = 'ID'
      Visible = False
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
    Top = 48
  end
  object dsoClassificator: TDataSource
    DataSet = dsClassificator
    Left = 104
    Top = 48
  end
end
