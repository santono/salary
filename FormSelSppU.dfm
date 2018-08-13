object FormSelSPP: TFormSelSPP
  Left = 279
  Top = 240
  Width = 696
  Height = 480
  Caption = #1059#1082#1072#1078#1080#1090#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1074#1099#1073#1086#1088#1072' '#1087#1083#1072#1090'.'#1074#1077#1076#1086#1084#1086#1089#1090#1077#1081
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
    688
    436)
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridSBB: TdxDBGrid
    Left = 8
    Top = 8
    Width = 673
    Height = 401
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    OnDblClick = dxDBGridSBBDblClick
    DataSource = DataSourceSBB
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridSBBSHIFRID: TdxDBGridMaskColumn
      Visible = False
      Width = 62
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGridSBBNAME: TdxDBGridMaskColumn
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      HeaderAlignment = taCenter
      Width = 482
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
    object dxDBGridSBBUK: TdxDBGridMaskColumn
      Caption = #1050#1086#1083#1076#1078
      Width = 39
      BandIndex = 0
      RowIndex = 0
      FieldName = 'UK'
    end
    object dxDBGridSBBPRIM: TdxDBGridMaskColumn
      Caption = #1055#1088#1080#1084
      Sorted = csUp
      Width = 148
      BandIndex = 0
      RowIndex = 0
      FieldName = 'PRIM'
    end
  end
  object pFIBDataSetSPP: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' NAME,'
      ' CASE'
      '  when MODE_U_K=1 THEN '#39#1050#1083#1083#1076#1078'.'#39
      '  else '#39#1059#1085#1080#1074'.'#39
      ' end as uk,'
      
        ' CAST(SHIFRSTA||'#39' '#39'||COALESCE((SELECT FIRST 1 B.NAME FROM SHIFR ' +
        'B WHERE B.SHIFR=A.SHIFRSTA),'#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39') AS VARCHAR(120))||'#39' '#39'||'
      
        ' trim(CAST(COALESCE((SELECT FIRST 1 C.name FROM TB_NAME_PODR_SEL' +
        'ECTION_DET C WHERE C.SHIFRID=A.shifrpodlist AND C.shifridowner=1' +
        '),'#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39') AS VARCHAR(120)))||'#39' '#39'||'
      
        ' trim(CAST(COALESCE((SELECT FIRST 1 C.name FROM TB_NAME_PODR_SEL' +
        'ECTION_DET C WHERE C.SHIFRID=A.SHIFRGRULIST AND C.shifridowner=2' +
        '),'#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39') AS VARCHAR(120))) AS PRIM'
      'FROM'
      ' TB_SEL_PAR_PLAT A'
      '')
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    Left = 16
    Top = 16
    object pFIBDataSetSPPSHIFRID: TFIBSmallIntField
      FieldName = 'SHIFRID'
      ReadOnly = True
    end
    object pFIBDataSetSPPNAME: TFIBStringField
      FieldName = 'NAME'
      ReadOnly = True
      Size = 80
      EmptyStrToNull = True
    end
    object pFIBDataSetSPPUK: TFIBStringField
      FieldName = 'UK'
      ReadOnly = True
      Size = 6
      EmptyStrToNull = True
    end
    object pFIBDataSetSPPPRIM: TFIBStringField
      FieldName = 'PRIM'
      ReadOnly = True
      Size = 362
      EmptyStrToNull = True
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
    Top = 16
  end
  object DataSourceSBB: TDataSource
    DataSet = pFIBDataSetSPP
    Left = 96
    Top = 16
  end
end
