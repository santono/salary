object FormBoln: TFormBoln
  Left = 262
  Top = 193
  Width = 696
  Height = 546
  Caption = #1057#1087#1080#1089#1086#1082' '#1083#1080#1089#1090#1086#1074' '#1074#1088#1077#1084#1077#1085#1085#1086#1081' '#1085#1077#1090#1088#1091#1076#1086#1089#1087#1086#1089#1086#1073#1085#1086#1089#1090#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    680
    508)
  PixelsPerInch = 96
  TextHeight = 20
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 8
    Width = 186
    Height = 28
    Date = 38656.028459918980000000
    Time = 38656.028459918980000000
    DateFormat = dfLong
    TabOrder = 0
    OnChange = DateTimePicker1Change
  end
  object dxDBGrid1: TdxDBGrid
    Left = 0
    Top = 48
    Width = 681
    Height = 425
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    ShowSummaryFooter = True
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 1
    DataSource = DataSourceBoln
    Filter.Criteria = {00000000}
    OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoTabThrough, edgoVertThrough]
    OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    OnCustomDrawCell = dxDBGrid1CustomDrawCell
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGrid1TABNO: TdxDBGridMaskColumn
      Caption = #1058'.'#1085'.'
      HeaderAlignment = taCenter
      Width = 60
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
    end
    object dxDBGrid1FIO: TdxDBGridMaskColumn
      Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048' '#1054
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
    object dxDBGrid1F_DATA: TdxDBGridDateColumn
      Caption = #1057
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'F_DATA'
    end
    object dxDBGrid1L_DATA: TdxDBGridDateColumn
      Caption = #1087#1086
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'L_DATA'
    end
    object dxDBGrid1K_WO_DAY: TdxDBGridMaskColumn
      Caption = #1044#1085#1077#1081
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'K_WO_DAY'
      SummaryFooterType = cstSum
    end
    object dxDBGrid1SUMMA_BOL: TdxDBGridCurrencyColumn
      Caption = #1057#1091#1084#1084#1072
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMA_BOL'
      SummaryFooterType = cstSum
      DisplayFormat = ',0.00'
      Nullable = False
    end
    object dxDBGrid1Data_P: TdxDBGridColumn
      Caption = #1055#1088#1089' 5'
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATA_P'
    end
    object dxDBGrid1SHIFRID: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGrid1ShifrSta: TdxDBGridDateColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFR_STA'
    end
    object dxDBGrid1ColumnModeIll: TdxDBGridColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MODE_ILL'
    end
    object dxDBGrid1Data_P_V: TdxDBGridColumn
      Caption = #1055#1088#1089' '#1057' '#1057
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATA_P_V'
    end
    object dxDBGrid1MODEWRNAME: TdxDBGridColumn
      Caption = #1042#1056
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'modewrname'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 477
    Width = 144
    Height = 25
    DataSource = DataSourceBoln
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbEdit]
    Anchors = [akLeft, akBottom]
    TabOrder = 2
    BeforeAction = DBNavigator1BeforeAction
    OnClick = DBNavigator1Click
  end
  object DataSourceBoln: TDataSource
    DataSet = pFIBDataSetBoln
    Left = 8
    Top = 56
  end
  object pFIBDataSetBoln: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE BOLN'
      'SET '
      '    TABNO = :TABNO,'
      '    FIO = :FIO,'
      '    F_DATA = :F_DATA,'
      '    L_DATA = :L_DATA,'
      '    K_WO_DAY = :K_WO_DAY,'
      '    SUMMA_BOL = :SUMMA_BOL'
      'WHERE'
      '    SHIFRID = :OLD_SHIFRID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    BOLN'
      'WHERE'
      '        SHIFRID = :OLD_SHIFRID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO BOLN('
      '    TABNO,'
      '    FIO,'
      '    F_DATA,'
      '    L_DATA,'
      '    K_WO_DAY,'
      '    SUMMA_BOL,'
      '    SHIFRID'
      ')'
      'VALUES('
      '    :TABNO,'
      '    :FIO,'
      '    :F_DATA,'
      '    :L_DATA,'
      '    :K_WO_DAY,'
      '    :SUMMA_BOL,'
      '    :SHIFRID'
      ')')
    RefreshSQL.Strings = (
      
        'select tabno,fio,f_data,l_data,k_wo_day,summa_bol,ShifrId from b' +
        'oln'
      'where(  Year_Vy=:WantedYear and Month_Vy=:WantedMonth'
      '     ) and (     BOLN.SHIFRID = :OLD_SHIFRID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      
        'select tabno,fio,f_data,l_data,k_wo_day,summa_bol,ShifrId,ShifrK' +
        'at,ShifrGru,Nomer_B,Data_P_Bud,Mode_V_Z,Shifr_Sta,Mode_Ill,PROCE' +
        'NT,MEAN_DAY,MEAN_DAY_BUD,MEAN_DAY_VNE,MEAN_DAY_GN,MEAN_DAY_NIS,M' +
        'ODE_DAY_CLOCK,Data_P_Vne,SwidSS,CODE_REASON_ILL,SHIFRBUH,0 as mo' +
        'deWR  from boln'
      'where Year_Vy=:WantedYear and Month_Vy=:WantedMonth'
      'order by fio')
    OnCalcFields = pFIBDataSetBolnCalcFields
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    AutoCommit = True
    Left = 8
    Top = 88
    object pFIBDataSetBolnTABNO: TFIBIntegerField
      FieldName = 'TABNO'
      Origin = 'BOLN.TABNO'
    end
    object pFIBDataSetBolnFIO: TFIBStringField
      FieldName = 'FIO'
      Origin = 'BOLN.FIO'
      Size = 51
      EmptyStrToNull = True
    end
    object pFIBDataSetBolnF_DATA: TFIBDateField
      FieldName = 'F_DATA'
      Origin = 'BOLN.F_DATA'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object pFIBDataSetBolnL_DATA: TFIBDateField
      FieldName = 'L_DATA'
      Origin = 'BOLN.L_DATA'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object pFIBDataSetBolnK_WO_DAY: TFIBSmallIntField
      FieldName = 'K_WO_DAY'
      Origin = 'BOLN.K_WO_DAY'
    end
    object pFIBDataSetBolnSUMMA_BOL: TFIBBCDField
      FieldName = 'SUMMA_BOL'
      Origin = 'BOLN.SUMMA_BOL'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetBolnSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      Origin = 'BOLN.SHIFRID'
    end
    object pFIBDataSetBolnSHIFRKAT: TFIBSmallIntField
      FieldName = 'SHIFRKAT'
      Origin = 'BOLN.SHIFRKAT'
    end
    object pFIBDataSetBolnSHIFRGRU: TFIBSmallIntField
      FieldName = 'SHIFRGRU'
      Origin = 'BOLN.SHIFRGRU'
    end
    object pFIBDataSetBolnNOMER_B: TFIBStringField
      FieldName = 'NOMER_B'
      Origin = 'BOLN.NOMER_B'
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSetBolnDATA_P: TStringField
      FieldKind = fkCalculated
      FieldName = 'DATA_P'
      Origin = 'CALCULATED.DATA_P'
      Size = 10
      Calculated = True
    end
    object pFIBDataSetBolnDATA_P_BUD: TFIBDateField
      FieldName = 'DATA_P_BUD'
      Origin = 'BOLN.DATA_P_BUD'
    end
    object pFIBDataSetBolnMODE_V_Z: TFIBSmallIntField
      FieldName = 'MODE_V_Z'
    end
    object pFIBDataSetBolnSHIFR_STA: TFIBSmallIntField
      FieldName = 'SHIFR_STA'
    end
    object pFIBDataSetBolnMODE_ILL: TFIBSmallIntField
      FieldName = 'MODE_ILL'
    end
    object pFIBDataSetBolnPROCENT: TFIBBCDField
      FieldName = 'PROCENT'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetBolnMEAN_DAY_BUD: TFIBBCDField
      FieldName = 'MEAN_DAY_BUD'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetBolnMEAN_DAY_VNE: TFIBBCDField
      FieldName = 'MEAN_DAY_VNE'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetBolnMEAN_DAY_GN: TFIBBCDField
      FieldName = 'MEAN_DAY_GN'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetBolnMEAN_DAY_NIS: TFIBBCDField
      FieldName = 'MEAN_DAY_NIS'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetBolnMEAN_DAY: TFIBBCDField
      FieldName = 'MEAN_DAY'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetBolnMODE_DAY_CLOCK: TFIBSmallIntField
      FieldName = 'MODE_DAY_CLOCK'
    end
    object pFIBDataSetBolnDATA_P_VNE: TFIBDateField
      FieldName = 'DATA_P_VNE'
    end
    object pFIBDataSetBolnDATA_P_V: TStringField
      FieldKind = fkCalculated
      FieldName = 'DATA_P_V'
      Size = 10
      Calculated = True
    end
    object pFIBDataSetBolnSWIDSS: TFIBStringField
      FieldName = 'SWIDSS'
      Size = 15
      EmptyStrToNull = True
    end
    object pFIBDataSetBolnCODE_REASON_ILL: TFIBIntegerField
      FieldName = 'CODE_REASON_ILL'
    end
    object pFIBDataSetBolnSHIFRBUH: TFIBIntegerField
      FieldName = 'SHIFRBUH'
    end
    object pFIBDataSetBolnMODEWR: TFIBIntegerField
      FieldName = 'MODEWR'
    end
    object pFIBDataSetBolnmodewrname: TStringField
      FieldKind = fkCalculated
      FieldName = 'modewrname'
      Size = 10
      Calculated = True
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 72
    Top = 144
    object N1: TMenuItem
      Caption = #1056#1077#1077#1089#1090#1088' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093' '#1083#1080#1089#1090#1082#1086#1074
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1073#1086#1083#1100#1085#1080#1095#1085#1086#1075#1086' '#1083#1080#1089#1090#1082#1072
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1057#1074#1086#1076' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093' '#1083#1080#1089#1090#1082#1086#1074
    end
    object N4: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1073#1086#1083#1100#1085' '#1083#1080#1089#1090#1086#1074' ('#1085')'
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #1050#1086#1088#1086#1090#1082#1080#1081' '#1088#1077#1077#1089#1090#1088' '#1073' '#1083#1080#1089#1090#1082#1086#1074
      object N6: TMenuItem
        Caption = #1055#1086#1083#1085#1099#1081' '#1089#1074#1086#1076
        OnClick = N6Click
      end
      object N7: TMenuItem
        Caption = #1057#1074#1086#1076' '#1087#1086' '#1091#1095#1072#1089#1090#1082#1072#1084
        OnClick = N7Click
      end
    end
    object N8: TMenuItem
      Caption = #1057#1074#1086#1076' '#1073' '#1083#1080#1089#1090#1082#1086#1074' '#1087#1086' '#1091#1095#1072#1089#1090#1082#1072#1084
      OnClick = N8Click
    end
    object N10: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1074#1089#1077#1093' '#1086#1090#1084#1077#1095#1077#1085#1085#1099#1093' '#1083#1080#1089#1090#1082#1086#1074' '#1060#1056
      object FR1: TMenuItem
        Caption = #1052#1072#1090#1088#1080#1095#1085' '#1087#1088#1080#1085#1090#1077#1088'  FR 1'
        OnClick = FR1Click
      end
      object N21: TMenuItem
        Caption = #1052#1072#1090#1088#1080#1095#1085#1099#1081' '#1087#1088#1080#1085#1090#1077#1088' FR 2'
        OnClick = N21Click
      end
    end
  end
  object pFIBQuerySecond: TpFIBQuery
    Transaction = pFIBTransactionSecond
    Database = FIB.pFIBDatabaseSal
    Left = 160
    Top = 96
  end
  object pFIBTransactionSecond: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 248
    Top = 112
  end
  object pFIBDataSetBolnUchSwod: TpFIBDataSet
    UpdateRecordTypes = [cusUnmodified]
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRKATB,'
      ' NAMEKATB,'
      ' SHIFRBAY,'
      ' NAMEBAY,'
      ' DAY_5,'
      ' SUMMA_5,'
      ' DAY_O,'
      ' SUMMA_O,'
      ' DAY_UH,'
      ' SUMMA_UH,'
      ' DAY_DEK,'
      ' SUMMA_DEK,'
      ' DAY_5_TOT,'
      ' SUMMA_5_TOT,'
      ' DAY_TOT,'
      ' SUMMA_TOT'
      'FROM'
      ' PR_BOLN_SWOD_LINES(:Y,'
      ' :M) ')
    AllowedUpdateKinds = []
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    Left = 336
    Top = 88
    object pFIBDataSetBolnUchSwodSHIFRKATB: TFIBIntegerField
      FieldName = 'SHIFRKATB'
    end
    object pFIBDataSetBolnUchSwodNAMEKATB: TFIBStringField
      FieldName = 'NAMEKATB'
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSetBolnUchSwodSHIFRBAY: TFIBIntegerField
      FieldName = 'SHIFRBAY'
    end
    object pFIBDataSetBolnUchSwodNAMEBAY: TFIBStringField
      FieldName = 'NAMEBAY'
      Size = 25
      EmptyStrToNull = True
    end
    object pFIBDataSetBolnUchSwodDAY_5: TFIBIntegerField
      FieldName = 'DAY_5'
    end
    object pFIBDataSetBolnUchSwodSUMMA_5: TFIBBCDField
      FieldName = 'SUMMA_5'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetBolnUchSwodDAY_O: TFIBIntegerField
      FieldName = 'DAY_O'
    end
    object pFIBDataSetBolnUchSwodSUMMA_O: TFIBBCDField
      FieldName = 'SUMMA_O'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetBolnUchSwodDAY_UH: TFIBIntegerField
      FieldName = 'DAY_UH'
    end
    object pFIBDataSetBolnUchSwodSUMMA_UH: TFIBBCDField
      FieldName = 'SUMMA_UH'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetBolnUchSwodDAY_DEK: TFIBIntegerField
      FieldName = 'DAY_DEK'
    end
    object pFIBDataSetBolnUchSwodSUMMA_DEK: TFIBBCDField
      FieldName = 'SUMMA_DEK'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetBolnUchSwodDAY_5_TOT: TFIBIntegerField
      FieldName = 'DAY_5_TOT'
    end
    object pFIBDataSetBolnUchSwodSUMMA_5_TOT: TFIBBCDField
      FieldName = 'SUMMA_5_TOT'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetBolnUchSwodDAY_TOT: TFIBIntegerField
      FieldName = 'DAY_TOT'
    end
    object pFIBDataSetBolnUchSwodSUMMA_TOT: TFIBBCDField
      FieldName = 'SUMMA_TOT'
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
      'isc_tpb_read_committed'
      '')
    TPBMode = tpbDefault
    Left = 392
    Top = 88
  end
  object DataSourceBolnUchSwod: TDataSource
    DataSet = pFIBDataSetBolnUchSwod
    Left = 344
    Top = 128
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSource = DataSourceBolnUchSwod
    Left = 168
    Top = 216
  end
  object frxReport1: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40113.890987766200000000
    ReportOptions.LastChange = 40132.899472291670000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      
        'procedure Memo2OnPreviewClick(Sender: TfrxView; Button: TMouseBu' +
        'tton; Shift: Integer; var Modified: Boolean);'
      'begin'
      ''
      'end;'
      ''
      'procedure Memo2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    Left = 56
    Top = 232
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = ' Header'
        Value = Null
      end
      item
        Name = 'y'
        Value = ''
      end
      item
        Name = 'm'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 68.031540000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo34: TfrxMemoView
          Top = 26.456710000000000000
          Width = 52.913420000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            #1056#1032#1057#8225#1056#176#1057#1027#1057#8218#1056#1109#1056#1108)
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 52.913420000000000000
          Top = 45.354360000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#1029#1056#1105)
        end
        object Memo36: TfrxMemoView
          Left = 102.047310000000000000
          Top = 45.354360000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
        end
        object Memo37: TfrxMemoView
          Left = 52.913420000000000000
          Top = 26.456710000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#181#1057#1026#1056#1030#1057#8249#1056#181' 5 '#1056#1169#1056#1029#1056#181#1056#8470)
        end
        object Memo38: TfrxMemoView
          Left = 181.417440000000000000
          Top = 45.354360000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#1029#1056#1105)
        end
        object Memo39: TfrxMemoView
          Left = 230.551330000000000000
          Top = 45.354360000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
        end
        object Memo40: TfrxMemoView
          Left = 177.637910000000000000
          Top = 26.456710000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#1109#1057#8224'.'#1057#1027#1057#8218#1057#1026#1056#176#1057#8230)
        end
        object Memo41: TfrxMemoView
          Left = 306.141930000000000000
          Top = 45.354360000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#1029#1056#1105)
        end
        object Memo42: TfrxMemoView
          Left = 355.275820000000000000
          Top = 45.354360000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
        end
        object Memo43: TfrxMemoView
          Left = 306.141930000000000000
          Top = 26.456710000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#1109' '#1057#1107#1057#8230#1056#1109#1056#1169#1057#1107)
        end
        object Memo44: TfrxMemoView
          Left = 434.645950000000000000
          Top = 45.354360000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#1029#1056#1105)
        end
        object Memo45: TfrxMemoView
          Left = 483.779840000000000000
          Top = 45.354360000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
        end
        object Memo46: TfrxMemoView
          Left = 434.645950000000000000
          Top = 26.456710000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#181#1056#1108#1057#1026#1056#181#1057#8218#1056#1029#1057#8249#1056#8470)
        end
        object Memo47: TfrxMemoView
          Left = 563.149970000000000000
          Top = 45.354360000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#1029#1056#1105)
        end
        object Memo48: TfrxMemoView
          Left = 619.842920000000000000
          Top = 45.354360000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
        end
        object Memo49: TfrxMemoView
          Left = 563.149970000000000000
          Top = 26.456710000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#152#1057#8218#1056#1109#1056#1110#1056#1109' '#1056#1111#1056#181#1057#1026#1056#1030#1057#8249#1056#181' 5 '#1056#1169#1056#1029#1056#181#1056#8470)
        end
        object Memo50: TfrxMemoView
          Left = 714.331170000000000000
          Top = 45.354360000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8221#1056#1029#1056#1105)
        end
        object Memo51: TfrxMemoView
          Left = 771.024120000000000000
          Top = 45.354360000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#1112#1056#176)
        end
        object Memo52: TfrxMemoView
          Left = 714.331170000000000000
          Top = 26.456710000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1057#1027#1056#181#1056#1110#1056#1109' '#1057#1027#1056#1109#1057#8224#1057#1027#1057#8218#1057#1026#1056#176#1057#8230)
        end
        object Memo60: TfrxMemoView
          Left = 45.354360000000000000
          Top = 3.779530000000001000
          Width = 702.992580000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            #1056#1038#1056#1030#1056#1109#1056#1169' '#1056#177#1056#1109#1056#187#1057#1034#1056#1029#1056#1105#1057#8225#1056#1029#1057#8249#1057#8230' '#1056#187#1056#1105#1057#1027#1057#8218#1056#1109#1056#1030' '#1056#183#1056#176'  [m] [y] '#1056#1110'.')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 147.401670000000000000
        Width = 1046.929810000000000000
        Condition = 'frxDBDataset1."SHIFRKATB"'
        object Memo61: TfrxMemoView
          Left = 3.779530000000000000
          Width = 865.512370000000000000
          Height = 18.897650000000000000
          Color = 15790320
        end
        object Memo1: TfrxMemoView
          Left = 18.897650000000000000
          Width = 801.260360000000000000
          Height = 18.897650000000000000
          DataField = 'NAMEKATB'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8 = (
            '[frxDBDataset1."NAMEKATB"]')
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 192.756030000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo2: TfrxMemoView
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo2OnBeforePrint'
          DataField = 'NAMEBAY'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            '[frxDBDataset1."NAMEBAY"]')
        end
        object Memo3: TfrxMemoView
          Left = 52.913420000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataField = 'DAY_5'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."DAY_5"]')
        end
        object Memo4: TfrxMemoView
          Left = 102.047310000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'SUMMA_5'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."SUMMA_5"]')
        end
        object Memo5: TfrxMemoView
          Left = 181.417440000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."DAY_O"]')
        end
        object Memo6: TfrxMemoView
          Left = 230.551330000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'SUMMA_O'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."SUMMA_O"]')
        end
        object Memo7: TfrxMemoView
          Left = 309.921460000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataField = 'DAY_UH'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."DAY_UH"]')
        end
        object Memo8: TfrxMemoView
          Left = 359.055350000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'SUMMA_UH'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."SUMMA_UH"]')
        end
        object Memo9: TfrxMemoView
          Left = 438.425480000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataField = 'DAY_DEK'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."DAY_DEK"]')
        end
        object Memo10: TfrxMemoView
          Left = 487.559370000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'SUMMA_DEK'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."SUMMA_DEK"]')
        end
        object Memo11: TfrxMemoView
          Left = 566.929500000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataField = 'DAY_5_TOT'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."DAY_5_TOT"]')
        end
        object Memo12: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'SUMMA_5_TOT'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."SUMMA_5_TOT"]')
        end
        object Memo13: TfrxMemoView
          Left = 718.110700000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataField = 'DAY_TOT'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."DAY_TOT"]')
        end
        object Memo14: TfrxMemoView
          Left = 774.803650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'SUMMA_TOT'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDataset1."SUMMA_TOT"]')
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 238.110390000000000000
        Width = 1046.929810000000000000
        object Memo62: TfrxMemoView
          Width = 869.291900000000000000
          Height = 18.897650000000000000
          Color = 15790320
        end
        object Memo15: TfrxMemoView
          Left = 52.913420000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."DAY_5">,MasterData1)]')
        end
        object Memo16: TfrxMemoView
          Left = 102.047310000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."SUMMA_5">,MasterData1)]')
        end
        object Memo17: TfrxMemoView
          Left = 181.417440000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."DAY_O">,MasterData1)]')
        end
        object Memo18: TfrxMemoView
          Left = 230.551330000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."SUMMA_O">,MasterData1)]')
        end
        object Memo19: TfrxMemoView
          Left = 309.921460000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."DAY_UH">,MasterData1)]')
        end
        object Memo20: TfrxMemoView
          Left = 359.055350000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."SUMMA_UH">,MasterData1)]')
        end
        object Memo21: TfrxMemoView
          Left = 438.425480000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."DAY_DEK">,MasterData1)]')
        end
        object Memo22: TfrxMemoView
          Left = 487.559370000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."SUMMA_DEK">,MasterData1)]')
        end
        object Memo23: TfrxMemoView
          Left = 566.929500000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."DAY_5_TOT">,MasterData1)]')
        end
        object Memo24: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."SUMMA_5_TOT">,MasterData1)]')
        end
        object Memo25: TfrxMemoView
          Left = 718.110700000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."DAY_TOT">,MasterData1)]')
        end
        object Memo26: TfrxMemoView
          Left = 774.803650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."SUMMA_TOT">,MasterData1)]')
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 22.677180000000000000
        Top = 321.260050000000000000
        Width = 1046.929810000000000000
        object Memo63: TfrxMemoView
          Width = 869.291900000000000000
          Height = 18.897650000000000000
          Color = 15790320
        end
        object Memo27: TfrxMemoView
          Left = 52.913420000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."DAY_5">)]')
        end
        object Memo28: TfrxMemoView
          Left = 102.047310000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."SUMMA_5">)]')
        end
        object Memo29: TfrxMemoView
          Left = 181.417440000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."DAY_O">)]')
        end
        object Memo30: TfrxMemoView
          Left = 230.551330000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."SUMMA_O">)]')
        end
        object Memo31: TfrxMemoView
          Left = 309.921460000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."DAY_UH">)]')
        end
        object Memo32: TfrxMemoView
          Left = 359.055350000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."SUMMA_UH">)]')
        end
        object Memo33: TfrxMemoView
          Left = 438.425480000000000000
          Width = 3.779530000000000000
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."DAY_DEK">)]')
        end
        object Memo53: TfrxMemoView
          Left = 438.425480000000000000
          Width = 3.779530000000000000
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."SUMMA_DEK">)]')
        end
        object Memo54: TfrxMemoView
          Left = 438.425480000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."DAY_DEK">)]')
        end
        object Memo55: TfrxMemoView
          Left = 487.559370000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."SUMMA_DEK">)]')
        end
        object Memo56: TfrxMemoView
          Left = 566.929500000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."DAY_5_TOT">)]')
        end
        object Memo57: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."SUMMA_5_TOT">)]')
        end
        object Memo58: TfrxMemoView
          Left = 718.110700000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."DAY_TOT">)]')
        end
        object Memo59: TfrxMemoView
          Left = 774.803650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDataset1."SUMMA_TOT">)]')
        end
      end
    end
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Background = False
    Creator = 'FastReport (http://www.fast-report.com)'
    HTMLTags = True
    Left = 272
    Top = 224
  end
  object frxDotMatrixExport1: TfrxDotMatrixExport
    UseFileCache = True
    ShowProgress = True
    EscModel = 0
    GraphicFrames = False
    SaveToFile = False
    UseIniSettings = True
    Left = 416
    Top = 216
  end
  object frxReport2: TfrxReport
    Version = '4.3'
    DotMatrixReport = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40230.996126840280000000
    ReportOptions.LastChange = 40233.079051284720000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnManualBuild = frxReport2ManualBuild
    Left = 392
    Top = 264
    Datasets = <>
    Variables = <
      item
        Name = ' HAT'
        Value = Null
      end
      item
        Name = 's1'
        Value = ''
      end
      item
        Name = 's2'
        Value = ''
      end
      item
        Name = 's3'
        Value = ''
      end
      item
        Name = 's4'
        Value = ''
      end
      item
        Name = 's5'
        Value = ''
      end
      item
        Name = 's6'
        Value = ''
      end
      item
        Name = ' detsum'
        Value = Null
      end
      item
        Name = 'm'
        Value = ''
      end
      item
        Name = 'days'
        Value = ''
      end
      item
        Name = 'summabud'
        Value = ''
      end
      item
        Name = 'summavne'
        Value = ''
      end
      item
        Name = 'summagn'
        Value = ''
      end
      item
        Name = 'summanis'
        Value = ''
      end
      item
        Name = 'fond'
        Value = ''
      end
      item
        Name = ' itg'
        Value = Null
      end
      item
        Name = 'razom'
        Value = ''
      end>
    Style = <>
    object Page1: TfrxDMPPage
      PaperWidth = 210.819863845504600000
      PaperHeight = 296.862308276425900000
      PaperSize = 9
      LeftMargin = 2.539998359584393000
      RightMargin = 2.539998359584393000
      TopMargin = 4.497913761764029000
      BottomMargin = 4.497913761764029000
      FontStyle = []
      object MasterData1: TfrxMasterData
        Height = 136.000000000000000000
        Top = 17.000000000000000000
        Width = 777.600000000000000000
        RowCount = 0
        object DMPMemo1: TfrxDMPMemoView
          Width = 672.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[s1]')
        end
        object DMPMemo2: TfrxDMPMemoView
          Top = 17.000000000000000000
          Width = 672.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[s2]')
        end
        object DMPMemo3: TfrxDMPMemoView
          Top = 34.000000000000000000
          Width = 672.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[s3]')
        end
        object DMPMemo4: TfrxDMPMemoView
          Top = 51.000000000000000000
          Width = 672.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[s4]')
        end
        object DMPMemo5: TfrxDMPMemoView
          Top = 68.000000000000000000
          Width = 672.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[s5]')
        end
        object DMPMemo6: TfrxDMPMemoView
          Top = 85.000000000000000000
          Width = 672.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[s6]')
        end
        object DMPMemo7: TfrxDMPMemoView
          Left = 259.200000000000000000
          Top = 102.000000000000000000
          Width = 115.200000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            #1056#8217#1057#8230#1057#8211#1056#1169#1056#1029#1057#8211' '#1056#1169#1056#176#1056#1029#1057#8211)
        end
        object DMPMemo8: TfrxDMPMemoView
          Left = 9.600000000000000000
          Top = 119.000000000000000000
          Width = 489.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            
              ' '#1056#1114#1057#8211#1057#1027' '#1056#8221#1056#1029#1057#8211#1056#1030' '#1056#8216#1057#1035#1056#1169#1056#182#1056#181#1057#8218'     '#1056#8217#1056#1029#1056#181' '#1056#177#1057#1035#1056#1169#1056#182#1056#181#1057#8218'     '#1056#8220' '#1056#1116' ' +
              '     '#1056#1116' '#1056#8224' '#1056#1038'  ')
        end
      end
      object MasterDataSum: TfrxMasterData
        Height = 17.000000000000000000
        Top = 170.000000000000000000
        Width = 777.600000000000000000
        RowCount = 0
        object DMPMemo9: TfrxDMPMemoView
          Left = 19.200000000000000000
          Width = 28.800000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[m]')
        end
        object DMPMemo10: TfrxDMPMemoView
          Left = 57.600000000000000000
          Width = 38.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[days]')
        end
        object DMPMemo11: TfrxDMPMemoView
          Left = 105.600000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[summabud]')
        end
        object DMPMemo12: TfrxDMPMemoView
          Left = 211.200000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[summavne]')
        end
        object DMPMemo13: TfrxDMPMemoView
          Left = 316.800000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[summagn]')
        end
        object DMPMemo14: TfrxDMPMemoView
          Left = 422.400000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[summanis]')
        end
        object DMPMemo16: TfrxDMPMemoView
          Left = 528.000000000000000000
          Width = 28.800000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[fond]')
        end
      end
      object MasterDataLic: TfrxMasterData
        Height = 17.000000000000000000
        Top = 204.000000000000000000
        Width = 777.600000000000000000
        RowCount = 0
        object DMPMemo15: TfrxDMPMemoView
          Left = 259.200000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            #1056#8250#1057#8211#1056#1108#1056#176#1057#1026#1056#1029#1057#1039#1056#1029#1057#8211)
        end
      end
      object MasterDataItg: TfrxMasterData
        Height = 51.000000000000000000
        Top = 238.000000000000000000
        Width = 777.600000000000000000
        RowCount = 0
        object DMPMemo17: TfrxDMPMemoView
          Left = 9.600000000000000000
          Top = 34.000000000000000000
          Width = 153.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            #1056#8216#1057#1107#1057#8230#1056#1110#1056#176#1056#187#1057#8218#1056#181#1057#1026' '#1056#160' '#1056#8217)
        end
        object DMPMemo18: TfrxDMPMemoView
          Left = 19.200000000000000000
          Width = 556.800000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[razom]')
        end
      end
      object MasterDataEmpty: TfrxMasterData
        Height = 17.000000000000000000
        Top = 306.000000000000000000
        Width = 777.600000000000000000
        RowCount = 0
      end
    end
  end
  object frxReport3: TfrxReport
    Version = '4.3'
    DotMatrixReport = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40233.825421365740000000
    ReportOptions.LastChange = 40237.617865659720000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnManualBuild = frxReport3ManualBuild
    Left = 336
    Top = 256
    Datasets = <>
    Variables = <
      item
        Name = ' hat'
        Value = Null
      end
      item
        Name = 's1'
        Value = ''
      end
      item
        Name = 's2'
        Value = ''
      end
      item
        Name = 's3'
        Value = ''
      end
      item
        Name = 's4'
        Value = ''
      end
      item
        Name = 's5'
        Value = ''
      end
      item
        Name = 's6'
        Value = ''
      end>
    Style = <>
    object Page1: TfrxDMPPage
      Orientation = poLandscape
      PaperWidth = 419.099729331424800000
      PaperHeight = 296.862308276425900000
      PaperSize = 8
      LeftMargin = 2.539998359584393000
      RightMargin = 2.539998359584393000
      TopMargin = 4.497913761764029000
      BottomMargin = 4.497913761764029000
      FontStyle = []
      object MasterData1: TfrxMasterData
        Height = 102.000000000000000000
        Top = 17.000000000000000000
        Width = 1564.800000000000000000
        RowCount = 1
        object DMPMemo1: TfrxDMPMemoView
          Width = 758.400000000000000000
          Height = 17.000000000000000000
          AutoWidth = True
          Memo.UTF8 = (
            '[s1]')
        end
        object DMPMemo2: TfrxDMPMemoView
          Top = 17.000000000000000000
          Width = 316.800000000000000000
          Height = 17.000000000000000000
          AutoWidth = True
          Memo.UTF8 = (
            '[s2]')
        end
        object DMPMemo3: TfrxDMPMemoView
          Top = 34.000000000000000000
          Width = 297.600000000000000000
          Height = 17.000000000000000000
          AutoWidth = True
          Memo.UTF8 = (
            '[s3]')
        end
        object DMPMemo4: TfrxDMPMemoView
          Top = 51.000000000000000000
          Width = 288.000000000000000000
          Height = 17.000000000000000000
          AutoWidth = True
          Memo.UTF8 = (
            '[s4]')
        end
        object DMPMemo5: TfrxDMPMemoView
          Top = 68.000000000000000000
          Width = 307.200000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[s5]')
        end
        object DMPMemo6: TfrxDMPMemoView
          Top = 85.000000000000000000
          Width = 758.400000000000000000
          Height = 17.000000000000000000
          AutoWidth = True
          Memo.UTF8 = (
            '[s6]')
        end
      end
      object MasterDataSB: TfrxMasterData
        Height = 17.000000000000000000
        Top = 136.000000000000000000
        Width = 1564.800000000000000000
        PrintIfDetailEmpty = True
        RowCount = 0
        object SubreportSum: TfrxSubreport
          Width = 499.200000000000000000
          Height = 17.000000000000000000
          Page = frxReport3.SubReportPage
          PrintOnParent = True
        end
      end
    end
    object SubReportPage: TfrxDMPPage
      Orientation = poLandscape
      PaperWidth = 419.099729331424800000
      PaperHeight = 296.862308276425900000
      PaperSize = 8
      LeftMargin = 2.539998359584393000
      RightMargin = 2.539998359584393000
      TopMargin = 4.497913761764029000
      BottomMargin = 4.497913761764029000
      FontStyle = []
      object MasterDataHS: TfrxMasterData
        Height = 34.000000000000000000
        Top = 17.000000000000000000
        Width = 1564.800000000000000000
        RowCount = 1
        object DMPMemo7: TfrxDMPMemoView
          Width = 393.600000000000000000
          Height = 17.000000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1056#1105#1057#8230#1057#8211#1056#1169#1056#1029#1057#8211' '#1056#1169#1056#176#1056#1029#1057#8211)
        end
        object CrossSum: TfrxCrossView
          Top = 17.000000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          DownThenAcross = False
          GapX = 0
          GapY = 0
          ShowColumnTotal = False
          Memos = {
            3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574
            662D38223F3E3C63726F73733E3C63656C6C6D656D6F733E3C54667278444D50
            4D656D6F56696577204C6566743D223130352C362220546F703D223638222057
            696474683D22343822204865696768743D22313722205265737472696374696F
            6E733D22382220466F6E745374796C653D223022204672616D652E5479703D22
            3135222048416C69676E3D22686152696768742220506172656E74466F6E743D
            2246616C7365222056416C69676E3D22766143656E7465722220546578743D22
            30222F3E3C54667278444D504D656D6F56696577204C6566743D22302220546F
            703D2230222057696474683D223022204865696768743D223022205265737472
            696374696F6E733D223822204672616D652E5479703D223135222048416C6967
            6E3D2268615269676874222056416C69676E3D22766143656E74657222205465
            78743D22222F3E3C54667278444D504D656D6F56696577204C6566743D223022
            20546F703D2230222057696474683D223022204865696768743D223022205265
            737472696374696F6E733D223822204672616D652E5479703D22313522204841
            6C69676E3D2268615269676874222056416C69676E3D22766143656E74657222
            20546578743D22222F3E3C54667278444D504D656D6F56696577204C6566743D
            22302220546F703D2230222057696474683D223022204865696768743D223022
            205265737472696374696F6E733D223822204672616D652E5479703D22313522
            2048416C69676E3D2268615269676874222056416C69676E3D22766143656E74
            65722220546578743D22222F3E3C2F63656C6C6D656D6F733E3C63656C6C6865
            616465726D656D6F733E3C54667278444D504D656D6F56696577204C6566743D
            22302220546F703D2230222057696474683D223022204865696768743D223022
            205265737472696374696F6E733D223822204672616D652E5479703D22313522
            2056416C69676E3D22766143656E7465722220546578743D22222F3E3C546672
            78444D504D656D6F56696577204C6566743D22302220546F703D223022205769
            6474683D223022204865696768743D223022205265737472696374696F6E733D
            223822204672616D652E5479703D223135222056416C69676E3D22766143656E
            7465722220546578743D22222F3E3C2F63656C6C6865616465726D656D6F733E
            3C636F6C756D6E6D656D6F733E3C54667278444D504D656D6F56696577205461
            673D2231303022204C6566743D223130352C362220546F703D22333422205769
            6474683D22343822204865696768743D22313722205265737472696374696F6E
            733D2232342220466F6E745374796C653D223022204672616D652E5479703D22
            3135222048416C69676E3D22686143656E7465722220506172656E74466F6E74
            3D2246616C7365222056416C69676E3D22766143656E7465722220546578743D
            22222F3E3C2F636F6C756D6E6D656D6F733E3C636F6C756D6E746F74616C6D65
            6D6F733E3C54667278444D504D656D6F56696577205461673D2233303022204C
            6566743D223230312C362220546F703D223334222057696474683D223130352C
            3622204865696768743D22313722205265737472696374696F6E733D22382220
            56697369626C653D2246616C73652220466F6E745374796C653D223022204672
            616D652E5479703D223135222048416C69676E3D22686143656E746572222050
            6172656E74466F6E743D2246616C7365222056416C69676E3D22766143656E74
            65722220546578743D224772616E6420546F74616C222F3E3C2F636F6C756D6E
            746F74616C6D656D6F733E3C636F726E65726D656D6F733E3C54667278444D50
            4D656D6F56696577204C6566743D22302220546F703D2230222057696474683D
            223022204865696768743D223022205265737472696374696F6E733D22382220
            4672616D652E5479703D223135222048416C69676E3D22686143656E74657222
            2056416C69676E3D22766143656E7465722220546578743D22222F3E3C546672
            78444D504D656D6F56696577204C6566743D22302220546F703D223022205769
            6474683D223022204865696768743D223022205265737472696374696F6E733D
            223822204672616D652E5479703D223135222048416C69676E3D22686143656E
            746572222056416C69676E3D22766143656E7465722220546578743D22222F3E
            3C54667278444D504D656D6F56696577204C6566743D22302220546F703D2230
            222057696474683D223022204865696768743D22302220526573747269637469
            6F6E733D223822204672616D652E5479703D223135222048416C69676E3D2268
            6143656E746572222056416C69676E3D22766143656E7465722220546578743D
            22222F3E3C54667278444D504D656D6F56696577204C6566743D22302220546F
            703D2230222057696474683D223022204865696768743D223022205265737472
            696374696F6E733D223822204672616D652E5479703D223135222048416C6967
            6E3D22686143656E746572222056416C69676E3D22766143656E746572222054
            6578743D22222F3E3C2F636F726E65726D656D6F733E3C726F776D656D6F733E
            3C54667278444D504D656D6F56696577205461673D2232303022204C6566743D
            2231392C322220546F703D223638222057696474683D2237362C382220486569
            6768743D22313722205265737472696374696F6E733D2232342220466F6E7453
            74796C653D223022204672616D652E5479703D223135222048416C69676E3D22
            686143656E7465722220506172656E74466F6E743D2246616C7365222056416C
            69676E3D22766143656E7465722220546578743D22222F3E3C2F726F776D656D
            6F733E3C726F77746F74616C6D656D6F733E3C54667278444D504D656D6F5669
            6577205461673D2234303022204C6566743D2231392C322220546F703D223130
            32222057696474683D2237362C3822204865696768743D223137222052657374
            72696374696F6E733D22382220466F6E745374796C653D223022204672616D65
            2E5479703D223135222048416C69676E3D22686143656E746572222050617265
            6E74466F6E743D2246616C7365222056416C69676E3D22766143656E74657222
            20546578743D224772616E6420546F74616C222F3E3C2F726F77746F74616C6D
            656D6F733E3C63656C6C66756E6374696F6E733E3C6974656D20312F3E3C2F63
            656C6C66756E6374696F6E733E3C636F6C756D6E736F72743E3C6974656D2030
            2F3E3C2F636F6C756D6E736F72743E3C726F77736F72743E3C6974656D20302F
            3E3C2F726F77736F72743E3C2F63726F73733E}
        end
      end
    end
  end
  object frxCrossObject1: TfrxCrossObject
    Left = 288
    Top = 288
  end
  object frxReport4: TfrxReport
    Version = '4.3'
    DotMatrixReport = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40240.790550844900000000
    ReportOptions.LastChange = 40462.675823136570000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnManualBuild = frxReport4ManualBuild
    Left = 504
    Top = 248
    Datasets = <>
    Variables = <
      item
        Name = ' Hat'
        Value = Null
      end
      item
        Name = 's1'
        Value = ''
      end
      item
        Name = 's2'
        Value = ''
      end
      item
        Name = 's3'
        Value = ''
      end
      item
        Name = 's4'
        Value = ''
      end
      item
        Name = 's5'
        Value = ''
      end
      item
        Name = 's6'
        Value = ''
      end
      item
        Name = 's7'
        Value = ''
      end
      item
        Name = ' Det'
        Value = Null
      end
      item
        Name = 'mis'
        Value = ''
      end
      item
        Name = 'day'
        Value = ''
      end
      item
        Name = 'summa_bud'
        Value = ''
      end
      item
        Name = 'summa_vne'
        Value = ''
      end
      item
        Name = 'summa_gn'
        Value = ''
      end
      item
        Name = 'summa_nis'
        Value = ''
      end
      item
        Name = 'mis_b'
        Value = ''
      end
      item
        Name = 'shifr_sta'
        Value = ''
      end
      item
        Name = 'day_b'
        Value = ''
      end
      item
        Name = 'summa_b_bud'
        Value = ''
      end
      item
        Name = 'summa_b_vne'
        Value = ''
      end
      item
        Name = 'summa_b_gn'
        Value = ''
      end
      item
        Name = 'summa_b_nis'
        Value = ''
      end
      item
        Name = 'fond'
        Value = ''
      end
      item
        Name = ' Itg'
        Value = Null
      end
      item
        Name = 'razom'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxDMPPage
      Orientation = poLandscape
      PaperWidth = 419.099729331424800000
      PaperHeight = 296.862308276425900000
      PaperSize = 8
      LeftMargin = 2.539998359584393000
      RightMargin = 2.539998359584393000
      TopMargin = 4.497913761764029000
      BottomMargin = 4.497913761764029000
      FontStyle = []
      object MasterData1: TfrxMasterData
        Height = 102.000000000000000000
        Top = 17.000000000000000000
        Width = 1564.800000000000000000
        RowCount = 0
        object DMPMemo1: TfrxDMPMemoView
          Width = 480.000000000000000000
          Height = 17.000000000000000000
          AutoWidth = True
          Memo.UTF8 = (
            '[s1]')
        end
        object DMPMemo2: TfrxDMPMemoView
          Top = 17.000000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          AutoWidth = True
          Memo.UTF8 = (
            '[s2]')
        end
        object DMPMemo3: TfrxDMPMemoView
          Top = 34.000000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          AutoWidth = True
          Memo.UTF8 = (
            '[s3]')
        end
        object DMPMemo4: TfrxDMPMemoView
          Top = 51.000000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          AutoWidth = True
          Memo.UTF8 = (
            '[s4]')
        end
        object DMPMemo5: TfrxDMPMemoView
          Top = 68.000000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          AutoWidth = True
          Memo.UTF8 = (
            '[s5]')
        end
        object DMPMemo6: TfrxDMPMemoView
          Top = 85.000000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          AutoWidth = True
          Memo.UTF8 = (
            '[s6]')
        end
      end
      object MasterData2: TfrxMasterData
        Height = 51.000000000000000000
        Top = 136.000000000000000000
        Width = 1564.800000000000000000
        RowCount = 0
        object DMPMemo8: TfrxDMPMemoView
          Width = 1027.200000000000000000
          Height = 51.000000000000000000
          AutoWidth = True
          Memo.UTF8 = (
            
              '              '#1056#8217#1056#1105#1057#8230'i'#1056#1169#1056#1029'i '#1056#1169#1056#176#1056#1029'i                              ' +
              '                       '#1056#8250'i'#1056#1108#1056#176#1057#1026#1056#1029#1057#1039#1056#1029'i'
            
              '----------------------------------------------------------------' +
              '-------------------------------------------'
            '')
        end
        object DMPMemo41: TfrxDMPMemoView
          Top = 34.000000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          AutoWidth = True
          Memo.UTF8 = (
            '[s7]')
        end
      end
      object MasterData3: TfrxMasterData
        Height = 17.000000000000000000
        Top = 204.000000000000000000
        Width = 1564.800000000000000000
        RowCount = 0
        object DMPMemo9: TfrxDMPMemoView
          Width = 1027.200000000000000000
          Height = 17.000000000000000000
          AutoWidth = True
          Memo.UTF8 = (
            
              ':---:----:---------:---------:---------:---------:---:---:----:-' +
              '--------:---------:---------:---------:---:')
        end
      end
      object MasterData4: TfrxMasterData
        Height = 17.000000000000000000
        Top = 238.000000000000000000
        Width = 1564.800000000000000000
        RowCount = 0
        object DMPMemo10: TfrxDMPMemoView
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo11: TfrxDMPMemoView
          Left = 9.600000000000000000
          Width = 28.800000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[mis]')
        end
        object DMPMemo12: TfrxDMPMemoView
          Left = 38.400000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo13: TfrxDMPMemoView
          Left = 48.000000000000000000
          Width = 38.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[day]')
        end
        object DMPMemo14: TfrxDMPMemoView
          Left = 86.400000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo15: TfrxDMPMemoView
          Left = 96.000000000000000000
          Width = 86.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[summa_bud]')
        end
        object DMPMemo16: TfrxDMPMemoView
          Left = 182.400000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo17: TfrxDMPMemoView
          Left = 192.000000000000000000
          Width = 86.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[summa_vne]')
        end
        object DMPMemo18: TfrxDMPMemoView
          Left = 278.400000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo19: TfrxDMPMemoView
          Left = 288.000000000000000000
          Width = 86.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[summa_gn]')
        end
        object DMPMemo20: TfrxDMPMemoView
          Left = 374.400000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo21: TfrxDMPMemoView
          Left = 384.000000000000000000
          Width = 86.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[summa_nis]')
        end
        object DMPMemo22: TfrxDMPMemoView
          Left = 470.400000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo23: TfrxDMPMemoView
          Left = 480.000000000000000000
          Width = 28.800000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[mis_b]')
        end
        object DMPMemo24: TfrxDMPMemoView
          Left = 508.800000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo25: TfrxDMPMemoView
          Left = 518.400000000000000000
          Width = 28.800000000000000000
          Height = 17.000000000000000000
          HideZeros = True
          Memo.UTF8 = (
            '[shifr_sta]')
        end
        object DMPMemo26: TfrxDMPMemoView
          Left = 547.200000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo27: TfrxDMPMemoView
          Left = 556.800000000000000000
          Width = 38.400000000000000000
          Height = 17.000000000000000000
          HideZeros = True
          Memo.UTF8 = (
            '[day_b]')
        end
        object DMPMemo28: TfrxDMPMemoView
          Left = 595.200000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo29: TfrxDMPMemoView
          Left = 604.800000000000000000
          Width = 86.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[summa_b_bud]')
        end
        object DMPMemo30: TfrxDMPMemoView
          Left = 691.200000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo31: TfrxDMPMemoView
          Left = 700.800000000000000000
          Width = 86.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[summa_b_vne]')
        end
        object DMPMemo32: TfrxDMPMemoView
          Left = 787.200000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo33: TfrxDMPMemoView
          Left = 796.800000000000000000
          Width = 86.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[summa_b_gn]')
        end
        object DMPMemo34: TfrxDMPMemoView
          Left = 883.200000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo35: TfrxDMPMemoView
          Left = 892.800000000000000000
          Width = 86.400000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[summa_b_nis]')
        end
        object DMPMemo36: TfrxDMPMemoView
          Left = 979.200000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
        object DMPMemo37: TfrxDMPMemoView
          Left = 988.800000000000000000
          Width = 28.800000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[fond]')
        end
        object DMPMemo38: TfrxDMPMemoView
          Left = 1017.600000000000000000
          Width = 9.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            ':')
        end
      end
      object MasterData5: TfrxMasterData
        Height = 17.000000000000000000
        Top = 272.000000000000000000
        Width = 1564.800000000000000000
        RowCount = 0
        object DMPMemo39: TfrxDMPMemoView
          Width = 1027.200000000000000000
          Height = 17.000000000000000000
          AutoWidth = True
          Memo.UTF8 = (
            
              '----------------------------------------------------------------' +
              '-------------------------------------------')
        end
      end
      object MasterDataItg: TfrxMasterData
        Height = 68.000000000000000000
        Top = 306.000000000000000000
        Width = 1564.800000000000000000
        RowCount = 0
        object DMPMemo7: TfrxDMPMemoView
          Left = 28.800000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          AutoWidth = True
          Memo.UTF8 = (
            '[razom]')
        end
        object DMPMemo40: TfrxDMPMemoView
          Left = 9.600000000000000000
          Top = 34.000000000000000000
          Width = 124.800000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            #1056#8216#1057#1107#1057#8230#1056#1110#1056#176#1056#187#1057#8218#1056#181#1057#1026' '#1057#1026' '#1056#1030)
        end
      end
      object MasterDataEmpty: TfrxMasterData
        Height = 17.000000000000000000
        Top = 391.000000000000000000
        Width = 1564.800000000000000000
        RowCount = 0
      end
    end
  end
  object frxTXTExport1: TfrxTXTExport
    UseFileCache = True
    ShowProgress = True
    ScaleWidth = 1.000000000000000000
    ScaleHeight = 1.000000000000000000
    Borders = False
    Pseudogrpahic = False
    PageBreaks = True
    OEMCodepage = False
    EmptyLines = False
    LeadSpaces = False
    PrintAfter = False
    PrinterDialog = True
    UseSavedProps = True
    Left = 472
    Top = 200
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    Left = 544
    Top = 184
  end
end
