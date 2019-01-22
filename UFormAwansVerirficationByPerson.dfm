object FormAwansVerirficationByPerson: TFormAwansVerirficationByPerson
  Left = 196
  Top = 129
  Width = 696
  Height = 499
  Caption = #1053#1077#1089#1086#1074#1087#1072#1076#1077#1085#1080#1103' '#1074#1099#1087#1083#1072#1090
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    680
    461)
  PixelsPerInch = 96
  TextHeight = 13
  object dxDBGridValidate: TdxDBGrid
    Left = 8
    Top = 8
    Width = 665
    Height = 417
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'id'
    ShowSummaryFooter = True
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = dsoValidate
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridValidateid: TdxDBGridMaskColumn
      Visible = False
      Width = 110
      BandIndex = 0
      RowIndex = 0
      FieldName = 'id'
    end
    object dxDBGridValidatetabno: TdxDBGridMaskColumn
      Caption = #1058'.'#1085'.'
      HeaderAlignment = taCenter
      Width = 57
      BandIndex = 0
      RowIndex = 0
      FieldName = 'tabno'
    end
    object dxDBGridValidateFIO: TdxDBGridMaskColumn
      Caption = #1060#1048#1054
      HeaderAlignment = taCenter
      Width = 126
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
    object dxDBGridValidateshifrpod: TdxDBGridMaskColumn
      Caption = #1055#1086#1076#1088'.'
      HeaderAlignment = taCenter
      Width = 81
      BandIndex = 0
      RowIndex = 0
      FieldName = 'shifrpod'
    end
    object dxDBGridValidateshifrgru: TdxDBGridMaskColumn
      Visible = False
      Width = 110
      BandIndex = 0
      RowIndex = 0
      FieldName = 'shifrgru'
    end
    object dxDBGridValidatenamegru: TdxDBGridMaskColumn
      Caption = #1057#1095#1077#1090
      HeaderAlignment = taCenter
      Width = 110
      BandIndex = 0
      RowIndex = 0
      FieldName = 'namegru'
    end
    object dxDBGridValidateshifrsta: TdxDBGridMaskColumn
      Caption = #1057#1090#1072#1090#1100#1103
      HeaderAlignment = taCenter
      Width = 97
      BandIndex = 0
      RowIndex = 0
      FieldName = 'shifrsta'
    end
    object dxDBGridValidatesummafixed: TdxDBGridMaskColumn
      Caption = #1042#1099#1076#1072#1085#1086
      Width = 97
      BandIndex = 0
      RowIndex = 0
      FieldName = 'summafixed'
      SummaryFooterType = cstSum
    end
    object dxDBGridValidatesummacurr: TdxDBGridMaskColumn
      Caption = #1058#1077#1082#1091#1097#1072#1103
      HeaderAlignment = taCenter
      Width = 93
      BandIndex = 0
      RowIndex = 0
      FieldName = 'summacurr'
      SummaryFooterType = cstSum
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 424
    Width = 240
    Height = 25
    DataSource = dsoValidate
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object ProgressBar1: TProgressBar
    Left = 256
    Top = 432
    Width = 417
    Height = 17
    TabOrder = 2
  end
  object dsoValidate: TDataSource
    DataSet = cdsValidate
    Left = 592
    Top = 56
  end
  object cdsValidate: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'tabno'
        DataType = ftInteger
      end
      item
        Name = 'FIO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'shifrpod'
        DataType = ftInteger
      end
      item
        Name = 'shifrgru'
        DataType = ftInteger
      end
      item
        Name = 'namegru'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'shifrsta'
        DataType = ftInteger
      end
      item
        Name = 'summafixed'
        DataType = ftFloat
      end
      item
        Name = 'summacurr'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 552
    Top = 56
    Data = {
      BF0000009619E0BD010000001800000009000000000003000000BF0002696404
      00010000000000057461626E6F04000100000000000346494F01004900000001
      00055749445448020002003200087368696672706F6404000100000000000873
      686966726772750400010000000000076E616D65677275010049000000010005
      574944544802000200140008736869667273746104000100000000000A73756D
      6D61666978656408000400000000000973756D6D616375727208000400000000
      000000}
    object cdsValidateid: TIntegerField
      FieldName = 'id'
    end
    object cdsValidatetabno: TIntegerField
      FieldName = 'tabno'
    end
    object cdsValidateFIO: TStringField
      FieldName = 'FIO'
      Size = 50
    end
    object cdsValidateshifrpod: TIntegerField
      FieldName = 'shifrpod'
    end
    object cdsValidateshifrgru: TIntegerField
      FieldName = 'shifrgru'
    end
    object cdsValidatenamegru: TStringField
      FieldName = 'namegru'
    end
    object cdsValidateshifrsta: TIntegerField
      FieldName = 'shifrsta'
    end
    object cdsValidatesummafixed: TFloatField
      FieldName = 'summafixed'
      DisplayFormat = '#########.00'
      currency = True
    end
    object cdsValidatesummacurr: TFloatField
      FieldName = 'summacurr'
      DisplayFormat = '#########.00'
      currency = True
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
    Left = 512
    Top = 56
  end
  object qAwans: TpFIBQuery
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    Left = 472
    Top = 56
  end
end
