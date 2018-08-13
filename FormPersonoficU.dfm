object FormPersonofic: TFormPersonofic
  Left = 233
  Top = 243
  Width = 696
  Height = 480
  Caption = #1055#1077#1088#1089#1086#1085#1086#1092#1080#1082#1072#1094#1080#1103
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
  object dxDBGrid1: TdxDBGrid
    Left = 8
    Top = 8
    Width = 673
    Height = 385
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    SummaryGroups = <>
    SummarySeparator = ', '
    PopupMenu = PopupMenu1
    TabOrder = 0
    DataSource = DataSourceANK
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGrid1TIN: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TIN'
    end
    object dxDBGrid1FULLN_U: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Sorted = csUp
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FULLN_U'
    end
    object dxDBGrid1NAME_U: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME_U'
    end
    object dxDBGrid1FATH_U: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FATH_U'
    end
    object dxDBGrid1D_ROG: TdxDBGridDateColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'D_ROG'
    end
    object dxDBGrid1POL: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'POL'
    end
    object dxDBGrid1SHIFRID: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGrid1TABNO: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
    end
  end
  object DBNavigatorANK: TDBNavigator
    Left = 8
    Top = 392
    Width = 240
    Height = 25
    DataSource = DataSourceANK
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object pFIBDataSetAnk: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_APM_ANK'
      'SET '
      ' TIN     = :TIN,'
      ' FULLN_U = :FULLN_U,'
      ' NAME_U  = :NAME_U,'
      ' FATH_U  = :FATH_U,'
      ' D_ROG   = :D_ROG,'
      ' POL     = :POL,'
      ' TABNO   = :TABNO'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_APM_ANK'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_APM_ANK('
      ' TIN,'
      ' FULLN_U,'
      ' NAME_U,'
      ' FATH_U,'
      ' D_ROG,'
      ' POL,'
      ' SHIFRID,'
      ' TABNO'
      ')'
      'VALUES('
      ' :TIN,'
      ' :FULLN_U,'
      ' :NAME_U,'
      ' :FATH_U,'
      ' :D_ROG,'
      ' :POL,'
      ' :SHIFRID,'
      ' :TABNO'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' TIN,'
      ' FULLN_U,'
      ' NAME_U,'
      ' FATH_U,'
      ' D_ROG,'
      ' POL,'
      ' TABNO'
      'FROM'
      ' TB_APM_ANK '
      ''
      ' WHERE '
      '  TB_APM_ANK.SHIFRID = :OLD_SHIFRID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' TIN,'
      ' FULLN_U,'
      ' NAME_U,'
      ' FATH_U,'
      ' D_ROG,'
      ' POL,'
      ' SHIFRID,'
      ' TABNO'
      'FROM'
      ' TB_APM_ANK ')
    AutoUpdateOptions.UpdateTableName = 'TB_APM_ANK'
    AutoUpdateOptions.KeyFields = 'SHIFRID'
    AutoUpdateOptions.GeneratorName = 'G_APM'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = FIB.pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = FIB.pFIBTransactionSAL
    AutoCommit = True
    Left = 40
    Top = 40
    oRefreshAfterDelete = True
    oRefreshDeletedRecord = True
    object pFIBDataSetAnkTIN: TFIBStringField
      DisplayLabel = #1048#1076'.'#1082#1086#1076
      FieldName = 'TIN'
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSetAnkFULLN_U: TFIBStringField
      DisplayLabel = #1055#1088#1110#1079#1074#1080#1097#1077
      FieldName = 'FULLN_U'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSetAnkNAME_U: TFIBStringField
      DisplayLabel = #1030#1084#39#1103
      FieldName = 'NAME_U'
      Size = 15
      EmptyStrToNull = True
    end
    object pFIBDataSetAnkFATH_U: TFIBStringField
      DisplayLabel = #1055#1086#1073#1072#1090#1100#1082#1086#1074#1110
      FieldName = 'FATH_U'
      EmptyStrToNull = True
    end
    object pFIBDataSetAnkD_ROG: TFIBDateField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1086#1078#1076
      FieldName = 'D_ROG'
    end
    object pFIBDataSetAnkPOL: TFIBStringField
      DisplayLabel = #1055#1086#1083
      FieldName = 'POL'
      Size = 1
      EmptyStrToNull = True
    end
    object pFIBDataSetAnkSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      Visible = False
    end
    object pFIBDataSetAnkTABNO: TFIBIntegerField
      DisplayLabel = #1058#1072#1073'.'#1085#1086#1084'.'
      FieldName = 'TABNO'
    end
  end
  object DataSourceANK: TDataSource
    DataSet = pFIBDataSetAnk
    Left = 72
    Top = 40
  end
  object PopupMenu1: TPopupMenu
    Left = 96
    Top = 120
    object N1: TMenuItem
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1092#1072#1084#1080#1083#1080#1102
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1044#1072#1085#1085#1099#1077
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1057#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1087#1086' '#1074#1089#1077#1084' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072#1084
      OnClick = N3Click
    end
    object DBF1: TMenuItem
      Caption = #1055#1077#1088#1077#1085#1086#1089' '#1074' DBF'
      OnClick = DBF1Click
    end
    object N4: TMenuItem
      Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103' '#1086#1076#1085#1086#1075#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      OnClick = N4Click
    end
  end
  object pFIBStoredProc1: TpFIBStoredProc
    Transaction = pFIBTransactionProc
    Database = FIB.pFIBDatabaseSal
    SQL.Strings = (
      'EXECUTE PROCEDURE PR_FIILL_PERS_PERSON_ANK (?TABNO, ?Y)')
    StoredProcName = 'PR_FIILL_PERS_PERSON_ANK'
    Left = 168
    Top = 56
  end
  object pFIBQueryAnk: TpFIBQuery
    Transaction = pFIBTransactionQuery
    Database = FIB.pFIBDatabaseSal
    Left = 216
    Top = 56
  end
  object pFIBTransactionProc: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 168
    Top = 88
  end
  object pFIBTransactionQuery: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 216
    Top = 88
  end
  object TableANK: TTable
    TableName = 'D:\ZARPLATA\VUGU\CLARION\APM_ANK.DBF'
    Left = 296
    Top = 64
    object TableANKTIN: TStringField
      FieldName = 'TIN'
      Size = 10
    end
    object TableANKFULLN_U: TStringField
      FieldName = 'FULLN_U'
      Size = 30
    end
    object TableANKNAME_U: TStringField
      FieldName = 'NAME_U'
      Size = 15
    end
    object TableANKFATH_U: TStringField
      FieldName = 'FATH_U'
    end
    object TableANKD_ROG: TDateField
      FieldName = 'D_ROG'
    end
    object TableANKPOL: TStringField
      FieldName = 'POL'
      Size = 1
    end
    object TableANKD_TIN: TDateField
      FieldName = 'D_TIN'
    end
    object TableANKKRPOU: TStringField
      FieldName = 'KRPOU'
      Size = 12
    end
    object TableANKRNPD: TFloatField
      FieldName = 'RNPD'
    end
    object TableANKDFPV: TDateField
      FieldName = 'DFPV'
    end
    object TableANKKOP: TStringField
      FieldName = 'KOP'
      Size = 10
    end
    object TableANKTOZ: TStringField
      FieldName = 'TOZ'
      Size = 6
    end
  end
  object TableInd: TTable
    TableName = 'D:\ZARPLATA\VUGU\CLARION\APM_IND.DBF'
    Left = 336
    Top = 64
    object TableIndKTF: TStringField
      FieldName = 'KTF'
      Size = 1
    end
    object TableIndTIN: TStringField
      FieldName = 'TIN'
      Size = 10
    end
    object TableIndZVIT_R: TSmallintField
      FieldName = 'ZVIT_R'
    end
    object TableIndZVIT_P: TStringField
      FieldName = 'ZVIT_P'
      Size = 1
    end
    object TableIndSPLAT_R: TSmallintField
      FieldName = 'SPLAT_R'
    end
    object TableIndKRPOU: TStringField
      FieldName = 'KRPOU'
      Size = 12
    end
    object TableIndOTK: TStringField
      FieldName = 'OTK'
      Size = 1
    end
    object TableIndKTSZ: TStringField
      FieldName = 'KTSZ'
      Size = 1
    end
    object TableIndSVR: TFloatField
      FieldName = 'SVR'
    end
    object TableIndSVZ: TFloatField
      FieldName = 'SVZ'
    end
    object TableIndSZ1: TFloatField
      FieldName = 'SZ1'
    end
    object TableIndSZP1: TFloatField
      FieldName = 'SZP1'
    end
    object TableIndSL1: TFloatField
      FieldName = 'SL1'
    end
    object TableIndSPD1: TFloatField
      FieldName = 'SPD1'
    end
    object TableIndKD1: TSmallintField
      FieldName = 'KD1'
    end
    object TableIndSZ2: TFloatField
      FieldName = 'SZ2'
    end
    object TableIndSZP2: TFloatField
      FieldName = 'SZP2'
    end
    object TableIndSL2: TFloatField
      FieldName = 'SL2'
    end
    object TableIndSPD2: TFloatField
      FieldName = 'SPD2'
    end
    object TableIndKD2: TSmallintField
      FieldName = 'KD2'
    end
    object TableIndSZ3: TFloatField
      FieldName = 'SZ3'
    end
    object TableIndSZP3: TFloatField
      FieldName = 'SZP3'
    end
    object TableIndSL3: TFloatField
      FieldName = 'SL3'
    end
    object TableIndSPD3: TFloatField
      FieldName = 'SPD3'
    end
    object TableIndKD3: TSmallintField
      FieldName = 'KD3'
    end
    object TableIndSZ4: TFloatField
      FieldName = 'SZ4'
    end
    object TableIndSZP4: TFloatField
      FieldName = 'SZP4'
    end
    object TableIndSL4: TFloatField
      FieldName = 'SL4'
    end
    object TableIndSPD4: TFloatField
      FieldName = 'SPD4'
    end
    object TableIndKD4: TSmallintField
      FieldName = 'KD4'
    end
    object TableIndSZ5: TFloatField
      FieldName = 'SZ5'
    end
    object TableIndSZP5: TFloatField
      FieldName = 'SZP5'
    end
    object TableIndSL5: TFloatField
      FieldName = 'SL5'
    end
    object TableIndSPD5: TFloatField
      FieldName = 'SPD5'
    end
    object TableIndKD5: TSmallintField
      FieldName = 'KD5'
    end
    object TableIndSZ6: TFloatField
      FieldName = 'SZ6'
    end
    object TableIndSZP6: TFloatField
      FieldName = 'SZP6'
    end
    object TableIndSL6: TFloatField
      FieldName = 'SL6'
    end
    object TableIndSPD6: TFloatField
      FieldName = 'SPD6'
    end
    object TableIndKD6: TSmallintField
      FieldName = 'KD6'
    end
    object TableIndSZ7: TFloatField
      FieldName = 'SZ7'
    end
    object TableIndSZP7: TFloatField
      FieldName = 'SZP7'
    end
    object TableIndSL7: TFloatField
      FieldName = 'SL7'
    end
    object TableIndSPD7: TFloatField
      FieldName = 'SPD7'
    end
    object TableIndKD7: TSmallintField
      FieldName = 'KD7'
    end
    object TableIndSZ8: TFloatField
      FieldName = 'SZ8'
    end
    object TableIndSZP8: TFloatField
      FieldName = 'SZP8'
    end
    object TableIndSL8: TFloatField
      FieldName = 'SL8'
    end
    object TableIndSPD8: TFloatField
      FieldName = 'SPD8'
    end
    object TableIndKD8: TSmallintField
      FieldName = 'KD8'
    end
    object TableIndSZ9: TFloatField
      FieldName = 'SZ9'
    end
    object TableIndSZP9: TFloatField
      FieldName = 'SZP9'
    end
    object TableIndSL9: TFloatField
      FieldName = 'SL9'
    end
    object TableIndSPD9: TFloatField
      FieldName = 'SPD9'
    end
    object TableIndKD9: TSmallintField
      FieldName = 'KD9'
    end
    object TableIndSZ10: TFloatField
      FieldName = 'SZ10'
    end
    object TableIndSZP10: TFloatField
      FieldName = 'SZP10'
    end
    object TableIndSL10: TFloatField
      FieldName = 'SL10'
    end
    object TableIndSPD10: TFloatField
      FieldName = 'SPD10'
    end
    object TableIndKD10: TSmallintField
      FieldName = 'KD10'
    end
    object TableIndSZ11: TFloatField
      FieldName = 'SZ11'
    end
    object TableIndSZP11: TFloatField
      FieldName = 'SZP11'
    end
    object TableIndSL11: TFloatField
      FieldName = 'SL11'
    end
    object TableIndSPD11: TFloatField
      FieldName = 'SPD11'
    end
    object TableIndKD11: TSmallintField
      FieldName = 'KD11'
    end
    object TableIndSZ12: TFloatField
      FieldName = 'SZ12'
    end
    object TableIndSZP12: TFloatField
      FieldName = 'SZP12'
    end
    object TableIndSL12: TFloatField
      FieldName = 'SL12'
    end
    object TableIndSPD12: TFloatField
      FieldName = 'SPD12'
    end
    object TableIndKD12: TSmallintField
      FieldName = 'KD12'
    end
    object TableIndSZ: TFloatField
      FieldName = 'SZ'
    end
    object TableIndSZP: TFloatField
      FieldName = 'SZP'
    end
    object TableIndSL: TFloatField
      FieldName = 'SL'
    end
    object TableIndSP: TFloatField
      FieldName = 'SP'
    end
    object TableIndKD: TSmallintField
      FieldName = 'KD'
    end
    object TableIndDPR: TDateField
      FieldName = 'DPR'
    end
    object TableIndDZR: TDateField
      FieldName = 'DZR'
    end
    object TableIndKPM: TSmallintField
      FieldName = 'KPM'
    end
    object TableIndKPD: TSmallintField
      FieldName = 'KPD'
    end
    object TableIndKPLG1: TStringField
      FieldName = 'KPLG1'
      Size = 8
    end
    object TableIndKMZ1: TSmallintField
      FieldName = 'KMZ1'
    end
    object TableIndKST1: TStringField
      FieldName = 'KST1'
      Size = 1
    end
    object TableIndSSM1: TSmallintField
      FieldName = 'SSM1'
    end
    object TableIndSSD1: TSmallintField
      FieldName = 'SSD1'
    end
    object TableIndSST1: TSmallintField
      FieldName = 'SST1'
    end
    object TableIndSSG1: TSmallintField
      FieldName = 'SSG1'
    end
    object TableIndSSH1: TSmallintField
      FieldName = 'SSH1'
    end
    object TableIndSSZ1: TSmallintField
      FieldName = 'SSZ1'
    end
    object TableIndNST1: TFloatField
      FieldName = 'NST1'
    end
    object TableIndKSZ1: TStringField
      FieldName = 'KSZ1'
      Size = 1
    end
    object TableIndKPLG2: TStringField
      FieldName = 'KPLG2'
      Size = 8
    end
    object TableIndKMZ2: TSmallintField
      FieldName = 'KMZ2'
    end
    object TableIndKST2: TStringField
      FieldName = 'KST2'
      Size = 1
    end
    object TableIndSSM2: TSmallintField
      FieldName = 'SSM2'
    end
    object TableIndSSD2: TSmallintField
      FieldName = 'SSD2'
    end
    object TableIndSST2: TSmallintField
      FieldName = 'SST2'
    end
    object TableIndSSG2: TSmallintField
      FieldName = 'SSG2'
    end
    object TableIndSSH2: TSmallintField
      FieldName = 'SSH2'
    end
    object TableIndSSZ2: TSmallintField
      FieldName = 'SSZ2'
    end
    object TableIndNST2: TFloatField
      FieldName = 'NST2'
    end
    object TableIndKSZ2: TStringField
      FieldName = 'KSZ2'
      Size = 1
    end
    object TableIndKPLG3: TStringField
      FieldName = 'KPLG3'
      Size = 8
    end
    object TableIndKMZ3: TSmallintField
      FieldName = 'KMZ3'
    end
    object TableIndKST3: TStringField
      FieldName = 'KST3'
      Size = 1
    end
    object TableIndSSM3: TSmallintField
      FieldName = 'SSM3'
    end
    object TableIndSSD3: TSmallintField
      FieldName = 'SSD3'
    end
    object TableIndSST3: TSmallintField
      FieldName = 'SST3'
    end
    object TableIndSSG3: TSmallintField
      FieldName = 'SSG3'
    end
    object TableIndSSH3: TSmallintField
      FieldName = 'SSH3'
    end
    object TableIndSSZ3: TSmallintField
      FieldName = 'SSZ3'
    end
    object TableIndNST3: TFloatField
      FieldName = 'NST3'
    end
    object TableIndKSZ3: TStringField
      FieldName = 'KSZ3'
      Size = 1
    end
    object TableIndKPLG4: TStringField
      FieldName = 'KPLG4'
      Size = 8
    end
    object TableIndKMZ4: TSmallintField
      FieldName = 'KMZ4'
    end
    object TableIndKST4: TStringField
      FieldName = 'KST4'
      Size = 1
    end
    object TableIndSSM4: TSmallintField
      FieldName = 'SSM4'
    end
    object TableIndSSD4: TSmallintField
      FieldName = 'SSD4'
    end
    object TableIndSST4: TSmallintField
      FieldName = 'SST4'
    end
    object TableIndSSG4: TSmallintField
      FieldName = 'SSG4'
    end
    object TableIndSSH4: TSmallintField
      FieldName = 'SSH4'
    end
    object TableIndSSZ4: TSmallintField
      FieldName = 'SSZ4'
    end
    object TableIndNST4: TFloatField
      FieldName = 'NST4'
    end
    object TableIndKSZ4: TStringField
      FieldName = 'KSZ4'
      Size = 1
    end
    object TableIndRNPD: TFloatField
      FieldName = 'RNPD'
    end
    object TableIndDFPV: TDateField
      FieldName = 'DFPV'
    end
    object TableIndNPD: TFloatField
      FieldName = 'NPD'
    end
    object TableIndDFD: TDateField
      FieldName = 'DFD'
    end
    object TableIndKPFU: TStringField
      FieldName = 'KPFU'
      Size = 8
    end
    object TableIndNZV: TStringField
      FieldName = 'NZV'
      Size = 1
    end
    object TableIndKOP: TStringField
      FieldName = 'KOP'
      Size = 10
    end
    object TableIndTOZ: TStringField
      FieldName = 'TOZ'
      Size = 6
    end
  end
  object pFIBQueryIndB: TpFIBQuery
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    Left = 168
    Top = 152
  end
end
