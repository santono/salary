object FormListLogForDeti: TFormListLogForDeti
  Left = 245
  Top = 145
  Width = 530
  Height = 480
  Caption = #1057#1087#1080#1089#1086#1082' '#1083#1100#1075#1086#1090#1085#1080#1082#1086#1074' '#1087#1086' '#1087'.'#1085'. '#1085#1072' '#1076#1077#1090#1077#1081
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
    514
    442)
  PixelsPerInch = 96
  TextHeight = 13
  object dxDBGridLgoD: TdxDBGrid
    Left = 8
    Top = 32
    Width = 505
    Height = 393
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'TABNO'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = dsoLgoD
    Filter.Criteria = {00000000}
    OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEnterShowEditor, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridLgoDTABNO: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
    end
    object dxDBGridLgoDFIO: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
    object dxDBGridLgoDPRIM: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'PRIM'
    end
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 0
    Width = 145
    Height = 21
    Date = 41738.861552002320000000
    Time = 41738.861552002320000000
    DateFormat = dfLong
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 160
    Top = 0
    Width = 97
    Height = 25
    Caption = #1051#1100#1075#1086#1090#1099' '#1085#1072' '#1076#1077#1090#1077#1081
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 264
    Top = 0
    Width = 75
    Height = 25
    Caption = #1055#1077#1085#1089#1080#1086#1085#1077#1088#1099
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 344
    Top = 0
    Width = 75
    Height = 25
    Caption = #1048#1085#1074#1072#1083#1080#1076#1099
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object pFIBdsLgoD: TpFIBDataSet
    SelectSQL.Strings = (
      ' select distinct a.tabno,a.fio,b.prim from person a'
      ' join fcn b on a.shifrid=b.shifridperson'
      ' where a.yearvy=:y'
      '   and a.monthvy=:m'
      '   and b.shifrsta in (:d,:d+500)'
      ' order by a.fio')
    Transaction = pFIBLgoD
    Database = FIB.pFIBDatabaseSal
    Left = 32
    Top = 24
    object pFIBdsLgoDTABNO: TFIBIntegerField
      DisplayLabel = #1058'.'#1085'.'
      FieldName = 'TABNO'
    end
    object pFIBdsLgoDFIO: TFIBStringField
      DisplayLabel = #1060#1048#1054
      FieldName = 'FIO'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBdsLgoDPRIM: TFIBIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'PRIM'
    end
  end
  object pFIBLgoD: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 72
    Top = 24
  end
  object dsoLgoD: TDataSource
    DataSet = pFIBdsLgoD
    Left = 104
    Top = 24
  end
end
