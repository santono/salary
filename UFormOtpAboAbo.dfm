object FormBlnAbo: TFormBlnAbo
  Left = 193
  Top = 169
  Width = 696
  Height = 484
  Caption = 'FormBlnAbo'
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
    688
    440)
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridBA: TdxDBGrid
    Left = 8
    Top = 32
    Width = 673
    Height = 393
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = DataSourceBA
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridBAYEAR_VY: TdxDBGridColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'YEAR_VY'
    end
    object dxDBGridBAMONTH_VY: TdxDBGridColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MONTH_VY'
    end
    object dxDBGridBAF_DATA: TdxDBGridDateColumn
      Sorted = csUp
      BandIndex = 0
      RowIndex = 0
      FieldName = 'F_DATA'
    end
    object dxDBGridBAL_DATA: TdxDBGridDateColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'L_DATA'
    end
    object dxDBGridBAK_WO_DAY: TdxDBGridColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'K_WO_DAY'
    end
    object dxDBGridBASUMMA_BOL: TdxDBGridColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMA_BOL'
    end
    object dxDBGridBANOMER_B: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NOMER_B'
    end
    object dxDBGridBADATA_P: TdxDBGridColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATA_P'
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 688
    Height = 33
    ButtonHeight = 28
    ButtonWidth = 38
    Caption = 'ToolBar1'
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1073#1086#1083#1100#1085#1080#1095#1085#1086#1075#1086' '#1083#1080#1089#1090#1072
      Action = ActionSelectBoln
      Caption = #1042#1073#1088
    end
    object ToolButton2: TToolButton
      Left = 38
      Top = 2
      Action = ActionDelBoln
      Caption = #1059#1076#1083
    end
    object ToolButton3: TToolButton
      Left = 76
      Top = 2
      Action = ActionInsBoln
      Caption = #1044#1073#1074
    end
    object ToolButton4: TToolButton
      Left = 114
      Top = 2
      Action = ActionMoveBoln
    end
  end
  object pFIBDataSetBA: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE BOLN'
      'SET '
      '    YEAR_VY = :YEAR_VY,'
      '    MONTH_VY = :MONTH_VY,'
      '    F_DATA = :F_DATA,'
      '    L_DATA = :L_DATA,'
      '    K_WO_DAY = :K_WO_DAY,'
      '    SUMMA_BOL = :SUMMA_BOL,'
      '    SHIFRID = :SHIFRID,'
      '    SHIFRKAT = :SHIFRKAT,'
      '    SHIFRGRU = :SHIFRGRU,'
      '    NOMER_B = :NOMER_B,'
      '    DATA_P_BUD = :DATA_P_BUD'
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
      '    YEAR_VY,'
      '    MONTH_VY,'
      '    F_DATA,'
      '    L_DATA,'
      '    K_WO_DAY,'
      '    SUMMA_BOL,'
      '    SHIFRID,'
      '    SHIFRKAT,'
      '    SHIFRGRU,'
      '    NOMER_B,'
      '    DATA_P_BUD'
      ')'
      'VALUES('
      '    :YEAR_VY,'
      '    :MONTH_VY,'
      '    :F_DATA,'
      '    :L_DATA,'
      '    :K_WO_DAY,'
      '    :SUMMA_BOL,'
      '    :SHIFRID,'
      '    :SHIFRKAT,'
      '    :SHIFRGRU,'
      '    :NOMER_B,'
      '    :DATA_P_BUD'
      ')')
    RefreshSQL.Strings = (
      
        'select Year_Vy,Month_Vy,f_data,l_data,k_wo_day,summa_bol,ShifrId' +
        ',ShifrKat,ShifrGru,Nomer_B,Data_P_Bud from boln'
      'where(  Tabno=:Tabno'
      '     ) and (     BOLN.SHIFRID = :OLD_SHIFRID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      
        'select Year_Vy,Month_Vy,f_data,l_data,k_wo_day,summa_bol,ShifrId' +
        ',ShifrKat,ShifrGru,Nomer_B,Data_P_Bud from boln'
      'where Tabno=:Tabno'
      'order by F_data desc')
    OnCalcFields = pFIBDataSetBACalcFields
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    Left = 16
    Top = 48
    object pFIBDataSetBAYEAR_VY: TFIBSmallIntField
      DisplayLabel = #1043#1086#1076
      FieldName = 'YEAR_VY'
      Origin = 'BOLN.YEAR_VY'
    end
    object pFIBDataSetBAMONTH_VY: TFIBSmallIntField
      DisplayLabel = #1052'-'#1094
      FieldName = 'MONTH_VY'
      Origin = 'BOLN.MONTH_VY'
    end
    object pFIBDataSetBAF_DATA: TFIBDateField
      DisplayLabel = #1057
      FieldName = 'F_DATA'
      Origin = 'BOLN.F_DATA'
    end
    object pFIBDataSetBAL_DATA: TFIBDateField
      DisplayLabel = #1055#1086
      FieldName = 'L_DATA'
      Origin = 'BOLN.L_DATA'
    end
    object pFIBDataSetBAK_WO_DAY: TFIBSmallIntField
      DisplayLabel = #1044#1085#1077#1081
      FieldName = 'K_WO_DAY'
      Origin = 'BOLN.K_WO_DAY'
    end
    object pFIBDataSetBASUMMA_BOL: TFIBBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA_BOL'
      Origin = 'BOLN.SUMMA_BOL'
      DisplayFormat = '#.00'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetBASHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      Origin = 'BOLN.SHIFRID'
    end
    object pFIBDataSetBANOMER_B: TFIBStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'NOMER_B'
      Origin = 'BOLN.NOMER_B'
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSetBADATA_P_BUD: TFIBDateField
      FieldName = 'DATA_P_BUD'
      Origin = 'BOLN.DATA_P_BUD'
    end
    object pFIBDataSetBADATA_P: TStringField
      DisplayLabel = #1055#1077#1088#1077#1085#1077#1089#1077#1085
      FieldKind = fkCalculated
      FieldName = 'DATA_P'
      Origin = 'CALCULATED.DATA_P'
      Size = 10
      Calculated = True
    end
    object pFIBDataSetBASHIFRKAT: TFIBSmallIntField
      FieldName = 'SHIFRKAT'
      Origin = 'BOLN.SHIFRKAT'
    end
    object pFIBDataSetBASHIFRGRU: TFIBSmallIntField
      FieldName = 'SHIFRGRU'
      Origin = 'BOLN.SHIFRGRU'
    end
  end
  object DataSourceBA: TDataSource
    DataSet = pFIBDataSetBA
    Left = 48
    Top = 48
  end
  object ActionList1: TActionList
    Left = 56
    Top = 144
    object ActionSelectBoln: TAction
      Caption = 'ActionSelectBoln'
      OnExecute = ActionSelectBolnExecute
    end
    object ActionInsBoln: TAction
      Caption = 'ActionInsBoln'
      Hint = #1057#1086#1079#1076#1072#1085#1080#1077' '#1085#1086#1074#1086#1075#1086' '#1073#1086#1083#1100#1085#1080#1095#1085#1086#1075#1086' '#1083#1080#1089#1090#1072
      OnExecute = ActionInsBolnExecute
    end
    object ActionDelBoln: TAction
      Caption = 'ActionDelBoln'
      Hint = #1059#1076#1072#1083#1077#1085#1080#1077' '#1073#1086#1083#1100#1085#1080#1095#1085#1086#1075#1086' '#1083#1080#1089#1090#1072
      OnExecute = ActionDelBolnExecute
    end
    object ActionMoveBoln: TAction
      Caption = #1055#1088#1089
      OnExecute = ActionMoveBolnExecute
    end
  end
end
