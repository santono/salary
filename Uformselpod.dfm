object FormSelPodr: TFormSelPodr
  Left = 242
  Top = 197
  Width = 696
  Height = 480
  Caption = #1059#1082#1072#1078#1080#1090#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    688
    436)
  PixelsPerInch = 96
  TextHeight = 20
  object LabelCnt: TLabel
    Left = 16
    Top = 408
    Width = 64
    Height = 20
    Caption = 'LabelCnt'
  end
  object dxDBGridPodr: TdxDBGrid
    Left = 8
    Top = 8
    Width = 665
    Height = 393
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
  object BitBtn1: TBitBtn
    Left = 504
    Top = 408
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 592
    Top = 408
    Width = 75
    Height = 25
    TabOrder = 2
    OnClick = BitBtn2Click
    Kind = bkClose
  end
  object BitBtn3: TBitBtn
    Left = 272
    Top = 408
    Width = 177
    Height = 25
    Caption = #1054#1090#1084#1077#1090#1080#1090#1100' '#1082#1072#1092#1077#1076#1088#1099
    TabOrder = 3
    Visible = False
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
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    Left = 152
    Top = 16
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
    Left = 200
    Top = 16
  end
end
