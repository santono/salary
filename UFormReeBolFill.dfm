object FormReeBolPrFill: TFormReeBolPrFill
  Left = 203
  Top = 176
  Width = 696
  Height = 480
  Caption = #1057#1087#1080#1089#1082' '#1073#1086#1083#1085'.'#1083#1080#1089#1090#1086#1074' '#1080#1079' '#1088#1077#1077#1089#1090#1088#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  DesignSize = (
    688
    436)
  PixelsPerInch = 96
  TextHeight = 20
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 408
    Width = 240
    Height = 25
    DataSource = DataSourceRBPr
    Anchors = [akLeft, akBottom]
    TabOrder = 0
  end
  object dxDBGridRB: TdxDBGrid
    Left = 8
    Top = 48
    Width = 673
    Height = 353
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    SummaryGroups = <>
    SummarySeparator = ', '
    PopupMenu = PopupMenu1
    TabOrder = 1
    DataSource = DataSourceRBPr
    Filter.Criteria = {00000000}
    OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoTabThrough, edgoVertThrough]
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridRBSHIFRID: TdxDBGridMaskColumn
      Visible = False
      Width = 118
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGridRBNOMER_B: TdxDBGridMaskColumn
      Width = 56
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NOMER_B'
    end
    object dxDBGridRBFIO: TdxDBGridMaskColumn
      Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048' '#1054
      HeaderAlignment = taCenter
      Width = 191
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
    object dxDBGridRBF_DATA: TdxDBGridDateColumn
      Caption = 'c'
      HeaderAlignment = taCenter
      Width = 70
      BandIndex = 0
      RowIndex = 0
      FieldName = 'F_DATA'
    end
    object dxDBGridRBL_DATA: TdxDBGridDateColumn
      Caption = #1087#1086
      HeaderAlignment = taCenter
      Width = 70
      BandIndex = 0
      RowIndex = 0
      FieldName = 'L_DATA'
    end
    object dxDBGridRBSUMMA_B: TdxDBGridCurrencyColumn
      Caption = #1041#1086#1083#1100#1085#1080#1095#1085' '#1057#1057
      HeaderAlignment = taCenter
      Width = 70
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMA_B'
      DisplayFormat = ',0.00;-,0.00'
      Nullable = False
    end
    object dxDBGridRBSUMMA_P: TdxDBGridCurrencyColumn
      Caption = #1055'.'#1085'.'
      HeaderAlignment = taCenter
      Width = 70
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMA_P'
      DisplayFormat = ',0.00;-,0.00'
      Nullable = False
    end
    object dxDBGridRBSUMMA_E: TdxDBGridCurrencyColumn
      Caption = #1045#1057#1042
      HeaderAlignment = taCenter
      Width = 70
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMA_E'
      DisplayFormat = ',0.00;-,0.00'
      Nullable = False
    end
    object dxDBGridRBSUMMA_BA: TdxDBGridCurrencyColumn
      Caption = #1041#1072#1085#1082
      HeaderAlignment = taCenter
      Width = 72
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMA_BA'
      DisplayFormat = ',0.00;-,0.00'
      Nullable = False
    end
  end
  object DateTimePickerRBPr: TDateTimePicker
    Left = 16
    Top = 8
    Width = 186
    Height = 28
    Date = 40581.940183831020000000
    Time = 40581.940183831020000000
    DateFormat = dfLong
    TabOrder = 2
    OnChange = DateTimePickerRBPrChange
  end
  object BitBtn1: TBitBtn
    Left = 272
    Top = 408
    Width = 169
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074#1099#1073#1086#1088
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object RadioGroupM: TRadioGroup
    Left = 216
    Top = 0
    Width = 393
    Height = 41
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #1058#1086#1083#1100#1082#1086' '#1085#1077' '#1074#1085#1077#1089#1077#1085#1085#1099#1077
      #1042#1089#1077)
    TabOrder = 4
    OnClick = RadioGroupMClick
  end
  object DataSourceRBPr: TDataSource
    DataSet = pFIBDataSetRBPr
    Left = 128
    Top = 88
  end
  object pFIBDataSetRBPr: TpFIBDataSet
    SelectSQL.Strings = (
      'select a.shifrid,a.nomer_b,a.fio,a.f_data,a.l_data,'
      
        'coalesce(sum(b.summa_b_bud)+sum(b.summa_b_vne)+sum(b.summa_b_gn)' +
        '+sum(b.summa_b_nis),0) as summa_b,'
      
        'coalesce(sum(b.summa_p_bud)+sum(b.summa_p_vne)+sum(b.summa_p_gn)' +
        '+sum(b.summa_p_nis),0) as summa_p,'
      
        'coalesce(sum(b.summa_e_bud)+sum(b.summa_e_vne)+sum(b.summa_e_gn)' +
        '+sum(b.summa_e_nis),0) as summa_e,'
      
        'coalesce(sum(b.summa_ba_bud)+sum(b.summa_ba_vne)+sum(b.summa_ba_' +
        'gn)+sum(b.summa_ba_nis),0) as summa_ba'
      ' from boln a'
      'join boln_res b on a.shifrid=b.shifridboln'
      
        'where ((((a.shifridreb=0) or (a.shifridreb is null)) and (:mode=' +
        '0)) or (:mode=1))'
      'and a.year_vy=:y and a.month_vy=:m and'
      'b.shifrsta<>12 and mode_ill<>10 and a.code_reason_ill<>12 '
      'group by 1,2,3,4,5')
    AllowedUpdateKinds = []
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    Left = 16
    Top = 88
    object pFIBDataSetRBPrSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      ReadOnly = True
    end
    object pFIBDataSetRBPrNOMER_B: TFIBStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'NOMER_B'
      ReadOnly = True
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSetRBPrFIO: TFIBStringField
      FieldName = 'FIO'
      ReadOnly = True
      Size = 51
      EmptyStrToNull = True
    end
    object pFIBDataSetRBPrF_DATA: TFIBDateField
      FieldName = 'F_DATA'
      ReadOnly = True
    end
    object pFIBDataSetRBPrL_DATA: TFIBDateField
      FieldName = 'L_DATA'
      ReadOnly = True
    end
    object pFIBDataSetRBPrSUMMA_B: TFIBBCDField
      FieldName = 'SUMMA_B'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRBPrSUMMA_P: TFIBBCDField
      FieldName = 'SUMMA_P'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRBPrSUMMA_E: TFIBBCDField
      FieldName = 'SUMMA_E'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRBPrSUMMA_BA: TFIBBCDField
      FieldName = 'SUMMA_BA'
      Size = 2
      RoundByScale = True
    end
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
    Left = 56
    Top = 88
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 88
    Top = 88
  end
  object PopupMenu1: TPopupMenu
    Left = 160
    Top = 128
    object N1: TMenuItem
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100
    end
  end
  object pFIBQueryPutB: TpFIBQuery
    Transaction = pFIBTransactionQ
    Database = FIB.pFIBDatabaseSal
    Left = 224
    Top = 96
  end
  object pFIBTransactionQ: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 264
    Top = 96
  end
end
