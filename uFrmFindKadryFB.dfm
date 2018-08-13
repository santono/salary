object FormFindKadryFB: TFormFindKadryFB
  Left = 208
  Top = 150
  Width = 811
  Height = 612
  Caption = #1057#1087#1080#1089#1086#1082' '#1088#1072#1073#1086#1090#1085#1080#1082#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    795
    574)
  PixelsPerInch = 96
  TextHeight = 20
  object BitBtn1: TBitBtn
    Left = 24
    Top = 528
    Width = 75
    Height = 25
    Anchors = [akLeft]
    Caption = #1042#1099#1073#1086#1088
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 128
    Top = 528
    Width = 89
    Height = 25
    Anchors = [akLeft]
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object DBNavigator1: TDBNavigator
    Left = 264
    Top = 528
    Width = 128
    Height = 25
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Anchors = [akLeft, akBottom]
    TabOrder = 2
  end
  object dxDBGrid1: TdxDBGrid
    Left = 8
    Top = 8
    Width = 785
    Height = 505
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'TABNO'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 3
    OnDblClick = dxDBGrid1DblClick
    DataSource = DataSource1
    Filter.Active = True
    Filter.Criteria = {00000000}
    OptionsBehavior = [edgoAutoSearch, edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
    OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    OnColumnClick = dxDBGrid1ColumnClick
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGrid1TABNO: TdxDBGridMaskColumn
      Caption = #1058'.'#1085#1086#1084'.'
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
    end
    object dxDBGrid1FIO: TdxDBGridMaskColumn
      Caption = #1060' '#1048' '#1054
      HeaderAlignment = taCenter
      Sorted = csUp
      Width = 300
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
    object dxDBGrid1NAL_CODE: TdxDBGridMaskColumn
      Caption = ' '#1048' '#1053' '#1053
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAL_CODE'
    end
    object dxDBGrid1NAME: TdxDBGridMaskColumn
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      Width = 300
      BandIndex = 0
      RowIndex = 0
      FieldName = 'CASE'
    end
    object dxDBGrid1SHIFR_POD: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFR_POD'
    end
  end
  object DataSource1: TDataSource
    DataSet = pFIBDataSet1
    Left = 112
    Top = 64
  end
  object pFIBDataSet1: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE KADRY'
      'SET '
      '    TABNO = :TABNO,'
      '    FIO = :FIO,'
      '    NAL_CODE = :NAL_CODE,'
      '    SHIFR_POD = :SHIFR_POD'
      'WHERE'
      '    TABNO = :OLD_TABNO'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    KADRY'
      'WHERE'
      '        TABNO = :OLD_TABNO'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO KADRY('
      '    TABNO,'
      '    FIO,'
      '    NAL_CODE,'
      '    SHIFR_POD'
      ')'
      'VALUES('
      '    :TABNO,'
      '    :FIO,'
      '    :NAL_CODE,'
      '    :SHIFR_POD'
      ')')
    RefreshSQL.Strings = (
      'select tabno,fio,nal_code,name,shifr_pod from kadry'
      'join podr on kadry.shifr_pod=podr.shifrpod'
      ' WHERE '
      '        KADRY.TABNO = :OLD_TABNO'
      '    ')
    SelectSQL.Strings = (
      
        'select tabno,fio,nal_code,case when kadry.shifr_pod>0 then podr.' +
        'name else '#39#39' end,shifr_pod,SWID_SS_SER,SWID_SS_NOM,BANK_COUNT,PI' +
        'B from kadry'
      'left outer join podr on kadry.shifr_pod=podr.shifrpod'
      'where strlen(ltrim(rtrim(fio)))>2'
      'order by tabno ')
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    BeforeStartTransaction = pFIBDataSet1BeforeStartTransaction
    Left = 112
    Top = 104
    object pFIBDataSet1TABNO: TFIBIntegerField
      DisplayWidth = 7
      FieldName = 'TABNO'
      Origin = 'KADRY.TABNO'
      ReadOnly = True
    end
    object pFIBDataSet1FIO: TFIBStringField
      DisplayWidth = 49
      FieldName = 'FIO'
      Origin = 'KADRY.FIO'
      ReadOnly = True
      Size = 51
      EmptyStrToNull = True
    end
    object pFIBDataSet1NAL_CODE: TFIBStringField
      DisplayWidth = 16
      FieldName = 'NAL_CODE'
      Origin = 'KADRY.NAL_CODE'
      ReadOnly = True
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSet1SHIFR_POD: TFIBIntegerField
      DisplayWidth = 12
      FieldName = 'SHIFR_POD'
      Origin = 'KADRY.SHIFR_POD'
      ReadOnly = True
    end
    object pFIBDataSet1CASE: TFIBStringField
      DisplayLabel = 'NAME'
      FieldName = 'CASE'
      ReadOnly = True
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSet1SWID_SS_SER: TFIBStringField
      FieldName = 'SWID_SS_SER'
      Size = 6
      EmptyStrToNull = True
    end
    object pFIBDataSet1SWID_SS_NOM: TFIBStringField
      FieldName = 'SWID_SS_NOM'
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSet1BANK_COUNT: TFIBStringField
      FieldName = 'BANK_COUNT'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSet1PIB: TFIBStringField
      FieldName = 'PIB'
      Size = 60
      EmptyStrToNull = True
    end
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 112
    Top = 136
  end
  object pFIBTransactionRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 112
    Top = 176
  end
end
