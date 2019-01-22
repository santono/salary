object FormAwansSwod: TFormAwansSwod
  Left = 458
  Top = 184
  Width = 428
  Height = 480
  Caption = #1057#1074#1086#1076' '#1087#1086' '#1074#1099#1087#1083#1072#1090#1072#1084
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  DesignSize = (
    412
    442)
  PixelsPerInch = 96
  TextHeight = 13
  object dxDBGridSwodAwans: TdxDBGrid
    Left = 8
    Top = 8
    Width = 393
    Height = 409
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
    DataSource = cdsoAwans
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridSwodAwansshifrsta: TdxDBGridMaskColumn
      Caption = #1057#1090#1072#1090#1100#1103
      BandIndex = 0
      RowIndex = 0
      FieldName = 'shifrsta'
    end
    object dxDBGridSwodAwansshifrgru: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'shifrgru'
    end
    object dxDBGridSwodAwansnamegru: TdxDBGridMaskColumn
      Caption = #1057#1095#1077#1090
      HeaderAlignment = taCenter
      Sorted = csDown
      BandIndex = 0
      RowIndex = 0
      FieldName = 'namegru'
    end
    object dxDBGridSwodAwanssumma: TdxDBGridMaskColumn
      Caption = #1057#1091#1084#1084#1072
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'summa'
      SummaryFooterType = cstSum
    end
  end
  object cdsoAwans: TDataSource
    DataSet = cdsAwans
    Left = 152
    Top = 88
  end
  object cdsAwans: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'shifrsta'
        DataType = ftInteger
      end
      item
        Name = 'shifrgru'
        DataType = ftInteger
      end
      item
        Name = 'summa'
        DataType = ftFloat
      end
      item
        Name = 'namegru'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'id'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 112
    Top = 88
    Data = {
      710000009619E0BD010000001800000005000000000003000000710008736869
      6672737461040001000000000008736869667267727504000100000000000573
      756D6D610800040000000000076E616D65677275010049000000010005574944
      544802000200140002696404000100000000000000}
    object cdsAwansshifrsta: TIntegerField
      FieldName = 'shifrsta'
    end
    object cdsAwansshifrgru: TIntegerField
      FieldName = 'shifrgru'
    end
    object cdsAwanssumma: TFloatField
      FieldName = 'summa'
      DisplayFormat = '########.00'
      currency = True
    end
    object cdsAwansnamegru: TStringField
      FieldName = 'namegru'
    end
    object cdsAwansid: TIntegerField
      FieldName = 'id'
    end
  end
  object qAwans: TpFIBQuery
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    Left = 32
    Top = 88
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
    Top = 88
  end
end
