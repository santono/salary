object FormSelBay: TFormSelBay
  Left = 338
  Top = 231
  Width = 500
  Height = 211
  Caption = #1042#1099#1073#1086#1088' '#1091#1095#1072#1089#1090#1082#1072
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
    492
    167)
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 32
    Top = 56
    Width = 128
    Height = 20
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1091#1095#1072#1089#1090#1086#1082
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 120
    Width = 145
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1057#1074#1086#1076' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 352
    Top = 120
    Width = 89
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object dxDBGridBay: TdxDBGrid
    Left = 168
    Top = 8
    Width = 313
    Height = 105
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRWRK'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 2
    DataSource = DataSourceBay
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridBayFIOOP: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIOOP'
    end
    object dxDBGridBaySHIFRWRK: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRWRK'
    end
  end
  object pFIBDataSetBay: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    O.FIOOP,'
      '    O.SHIFRWRK'
      'FROM'
      '    OPERATORY O'
      'ORDER BY 1')
    OnCalcFields = pFIBDataSetBayCalcFields
    AllowedUpdateKinds = []
    Transaction = pFIBTransactionBay
    Database = FIB.pFIBDatabaseSal
    Left = 8
    Top = 8
    object pFIBDataSetBayFIOOP: TFIBStringField
      DisplayLabel = #1041#1091#1093#1075#1072#1083#1090#1077#1088
      FieldName = 'FIOOP'
      ReadOnly = True
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBDataSetBaySHIFRWRK: TFIBIntegerField
      FieldName = 'SHIFRWRK'
    end
  end
  object DataSourceBay: TDataSource
    DataSet = pFIBDataSetBay
    Left = 40
    Top = 8
  end
  object pFIBTransactionBay: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 72
    Top = 8
  end
end
