object FormYSpr: TFormYSpr
  Left = 228
  Top = 197
  Width = 717
  Height = 480
  Caption = #1057#1087#1088#1072#1074#1082#1080' '#1086' '#1079#1072#1088#1072#1073#1086#1090#1085#1086#1081' '#1087#1083#1072#1090#1077
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
    701
    442)
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridY: TdxDBGrid
    Left = 8
    Top = 8
    Width = 689
    Height = 417
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
    DataSource = DataSourceY
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridYSHIFRID: TdxDBGridMaskColumn
      Visible = False
      Width = 219
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGridYTABNO: TdxDBGridMaskColumn
      Width = 33
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
    end
    object dxDBGridYY: TdxDBGridColumn
      Caption = #1047#1072
      HeaderAlignment = taCenter
      Width = 54
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Y'
    end
    object dxDBGridYFIO: TdxDBGridMaskColumn
      Width = 266
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
    object dxDBGridYSUMMATOT: TdxDBGridCurrencyColumn
      Width = 78
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMATOT'
      DisplayFormat = ',0.00;-,0.00'
      Nullable = False
    end
    object dxDBGridYSUMMAPODOHTOT: TdxDBGridCurrencyColumn
      Sorted = csUp
      Width = 82
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMAPODOHTOT'
      DisplayFormat = ',0.00;-,0.00'
      Nullable = False
    end
    object dxDBGridYECBTOT: TdxDBGridCurrencyColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMAECBTOT'
      DisplayFormat = ',0.00;-,0.00'
      Nullable = False
    end
    object dxDBGridYF_1: TdxDBGridMaskColumn
      Visible = False
      Width = 96
      BandIndex = 0
      RowIndex = 0
      FieldName = 'F_1'
    end
    object dxDBGridYDATAFR: TdxDBGridDateColumn
      Visible = False
      Width = 76
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATAFR'
    end
    object dxDBGridYModeVZ: TdxDBGridColumn
      Caption = #1056#1078#1084
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MODEZV'
    end
  end
  object pFIBDataSetY: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_SPR_ZARPL'
      'SET '
      ' TABNO = :TABNO,'
      ' FIO = :FIO,'
      ' SUMMATOT = :SUMMATOT,'
      ' SUMMAPODOHTOT = :SUMMAPODOHTOT,'
      ' SUMMAECBTOT = :SUMMAECBTOT,'
      ' DATAFR = :DATAFR,'
      ' Y = :Y'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_SPR_ZARPL'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_SPR_ZARPL('
      ' SHIFRID,'
      ' TABNO,'
      ' FIO,'
      ' SUMMATOT,'
      ' SUMMAPODOHTOT,'
      ' SUMMAECBTOT,'
      ' DATAFR,'
      ' Y'
      ')'
      'VALUES('
      ' :SHIFRID,'
      ' :TABNO,'
      ' :FIO,'
      ' :SUMMATOT,'
      ' :SUMMAPODOHTOT,'
      ' :SUMMAECBTOT,'
      ' :DATAFR,'
      ' :Y'
      ')')
    RefreshSQL.Strings = (
      
        'select a.shifrid,a.tabno,a.fio,a.summatot,a.summapodohtot,a.summ' +
        'aecbtot,'
      
        '       (select first 1 fio from pr_getfioope(a.shifrwrk)) as F_1' +
        ','
      
        'a.datafr,a.y,case when a.mode_za=2 then '#39#1042#39' else '#39#1047#1072#39' end as mod' +
        'ezv from tb_spr_zarpl a '
      ' WHERE '
      '  A.SHIFRID = :OLD_SHIFRID'
      ' ')
    SelectSQL.Strings = (
      
        'select a.shifrid,a.tabno,a.fio,a.summatot,a.summapodohtot,a.summ' +
        'aecbtot,'
      
        '       (select first 1 fio from pr_getfioope(a.shifrwrk)) as F_1' +
        ','
      
        'a.datafr,a.y,case when a.mode_za=2 then '#39#1042#39' else '#39#1047#1072#39' end as mod' +
        'ezv from tb_spr_zarpl a order by 3')
    Transaction = FIB.pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = FIB.pFIBTransactionSAL
    Left = 32
    Top = 16
    object pFIBDataSetYSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      ReadOnly = True
    end
    object pFIBDataSetYTABNO: TFIBIntegerField
      DisplayLabel = #1058' '#1085#1086#1084
      FieldName = 'TABNO'
      ReadOnly = True
    end
    object pFIBDataSetYFIO: TFIBStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103' '#1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'FIO'
      ReadOnly = True
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSetYSUMMATOT: TFIBBCDField
      DisplayLabel = #1053#1072#1095#1080#1089#1083#1077#1085#1086
      FieldName = 'SUMMATOT'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYSUMMAPODOHTOT: TFIBBCDField
      DisplayLabel = #1053#1072#1083#1086#1075' '
      FieldName = 'SUMMAPODOHTOT'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetYF_1: TFIBStringField
      DisplayLabel = #1041#1091#1093#1075#1072#1083#1090#1077#1088
      DisplayWidth = 30
      FieldName = 'F_1'
      ReadOnly = True
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBDataSetYDATAFR: TFIBDateField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DATAFR'
      ReadOnly = True
    end
    object pFIBDataSetYY: TFIBSmallIntField
      FieldName = 'Y'
    end
    object pFIBDataSetYMODEZV: TFIBStringField
      FieldName = 'MODEZV'
      ReadOnly = True
      Size = 2
      EmptyStrToNull = True
    end
    object pFIBDataSetYSUMMAECBTOT: TFIBBCDField
      DisplayLabel = #1045#1057#1042
      FieldName = 'SUMMAECBTOT'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
  end
  object DataSourceY: TDataSource
    DataSet = pFIBDataSetY
    Left = 72
    Top = 16
  end
  object PopupMenu1: TPopupMenu
    Left = 144
    Top = 112
    object N1: TMenuItem
      Caption = #1053#1086#1074#1072#1103' '#1089#1087#1088#1072#1074#1082#1072
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
      OnClick = N2Click
    end
  end
  object ActionList1: TActionList
    Left = 104
    Top = 192
    object actEditList: TAction
      Caption = 'actEditList'
      ShortCut = 16460
      OnExecute = actEditListExecute
    end
    object actCalcItogi: TAction
      Caption = 'actCalcItogi'
      ShortCut = 16457
      OnExecute = actCalcItogiExecute
    end
  end
end
