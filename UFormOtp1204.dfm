object FormOtp1204: TFormOtp1204
  Left = 255
  Top = 159
  Width = 679
  Height = 512
  Caption = #1057#1087#1080#1089#1086#1082' '#1086#1090#1087#1091#1089#1082#1086#1074' '#1073#1077#1079' '#1086#1087#1083#1072#1090#1099' '#1074' '#1072#1087#1088'-'#1084#1072#1077' 2012 '#1075#1086#1076#1072
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
    671
    465)
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridOtp1204: TdxDBGrid
    Left = 8
    Top = 0
    Width = 657
    Height = 409
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'TABNO'
    ShowSummaryFooter = True
    SummaryGroups = <>
    SummarySeparator = ', '
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnDblClick = dxDBGridOtp1204DblClick
    DataSource = DataSourceOtp1204
    Filter.Criteria = {00000000}
    OptionsBehavior = [edgoAutoSearch, edgoAutoSort, edgoDragScroll, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
    OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridOtp1204TABNO: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 22
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
    end
    object dxDBGridOtp1204FIO: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Sorted = csUp
      Width = 236
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
    object dxDBGridOtp1204APR30: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 24
      BandIndex = 0
      RowIndex = 0
      FieldName = 'APR30'
      SummaryFooterType = cstSum
      SummaryFooterField = 'SELECTED'
      SummaryFooterFormat = '####'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridOtp1204May03: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 16
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MAY03'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridOtp1204May04: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 26
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MAY04'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridOtp1204May07: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 17
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MAY07'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridOtp1204May08: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 27
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MAY08'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridOtp1204May10: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 26
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MAY10'
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object dxDBGridOtp1204May11: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 30
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MAY11'
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object dxDBGridOtp1204WPlace: TdxDBGridColumn
      Width = 59
      BandIndex = 0
      RowIndex = 0
      FieldName = 'W_PLACE'
    end
    object dxDBGridOtp1204NamePodr: TdxDBGridColumn
      Width = 170
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAMEPODR'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 416
    Width = 240
    Height = 25
    DataSource = DataSourceOtp1204
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 448
    Width = 633
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 2
  end
  object dxCalcEditShifrPod: TdxCalcEdit
    Left = 272
    Top = 416
    Width = 65
    TabOrder = 3
    Anchors = [akLeft, akBottom]
    Text = '0'
  end
  object BitBtn1: TBitBtn
    Left = 344
    Top = 416
    Width = 209
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object pFIBDataSetOtp1204: TpFIBDataSet
    UpdateRecordTypes = [cusUnmodified, cusModified]
    UpdateSQL.Strings = (
      'UPDATE TB_OTPUSK_2012_04'
      'SET '
      ' APR30 = :APR30,'
      ' MAY03 = :MAY03,'
      ' MAY04 = :MAY04,'
      ' MAY07 = :MAY07,'
      ' MAY08 = :MAY08,'
      ' MAY10 = :MAY10,'
      ' MAY11 = :MAY11'
      'WHERE'
      ' TABNO = :OLD_TABNO'
      ' ')
    RefreshSQL.Strings = (
      
        'select a.tabno,(select first 1 b.fio from kadry b where b.tabno=' +
        'a.tabno) as fio,'
      'a.apr30,a.may03,a.may04,a.may07,a.may08,a.may10,a.may11'
      'from tb_otpusk_2012_04 a'
      ' WHERE '
      '  A.TABNO = :OLD_TABNO'
      ' order by 2'
      ' ')
    SelectSQL.Strings = (
      
        'select a.tabno,(select first 1 b.fio from kadry b where b.tabno=' +
        'a.tabno) as fio,'
      'a.apr30,a.may03,a.may04,a.may07,a.may08,a.may10,a.may11,'
      'w_place,'
      'case'
      
        '    when exists(select * from podr c where c.shifrpod=a.w_place)' +
        ' then'
      
        '         (select first 1 d.name from podr d where d.shifrpod=a.w' +
        '_place)'
      '    else '#39#39
      'end as namepodr'
      ' from tb_otpusk_2012_04 a order by 2')
    AllowedUpdateKinds = [ukModify]
    Transaction = pFIBTransactionOtp1204Read
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionOtp1204Wrire
    Left = 32
    Top = 16
    object pFIBDataSetOtp1204TABNO: TFIBIntegerField
      DisplayLabel = #1058'.'#1085'.'
      FieldName = 'TABNO'
      ReadOnly = True
    end
    object pFIBDataSetOtp1204FIO: TFIBStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048' '#1054
      FieldName = 'FIO'
      ReadOnly = True
      Size = 51
      EmptyStrToNull = True
    end
    object pFIBDataSetOtp1204W_PLACE: TFIBIntegerField
      DisplayLabel = #1055#1086#1076#1088
      FieldName = 'W_PLACE'
      ReadOnly = True
    end
    object pFIBDataSetOtp1204NAMEPODR: TFIBStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      FieldName = 'NAMEPODR'
      ReadOnly = True
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSetOtp1204APR30: TFIBSmallIntField
      DisplayLabel = '30'
      FieldName = 'APR30'
    end
    object pFIBDataSetOtp1204MAY03: TFIBSmallIntField
      DisplayLabel = '3'
      FieldName = 'MAY03'
    end
    object pFIBDataSetOtp1204MAY04: TFIBSmallIntField
      DisplayLabel = '4'
      FieldName = 'MAY04'
    end
    object pFIBDataSetOtp1204MAY07: TFIBSmallIntField
      DisplayLabel = '7'
      FieldName = 'MAY07'
    end
    object pFIBDataSetOtp1204MAY08: TFIBSmallIntField
      DisplayLabel = '8'
      FieldName = 'MAY08'
    end
    object pFIBDataSetOtp1204MAY10: TFIBSmallIntField
      DisplayLabel = '10'
      FieldName = 'MAY10'
    end
    object pFIBDataSetOtp1204MAY11: TFIBSmallIntField
      DisplayLabel = '11'
      FieldName = 'MAY11'
    end
  end
  object pFIBTransactionOtp1204Wrire: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 72
    Top = 16
  end
  object pFIBTransactionOtp1204Read: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 112
    Top = 16
  end
  object DataSourceOtp1204: TDataSource
    DataSet = pFIBDataSetOtp1204
    Left = 152
    Top = 16
  end
  object PopupMenu1: TPopupMenu
    Left = 248
    Top = 144
    object N1: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081' '#1076#1083#1103' '#1087#1077#1088#1077#1085#1086#1089#1072
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1055#1077#1088#1077#1085#1077#1089#1090#1080' '#1089#1087#1080#1089#1086#1082' '#1086#1090#1087#1091#1089#1082#1085#1080#1082#1086#1074
      OnClick = N2Click
    end
  end
end
