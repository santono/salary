object FormKreditSpr: TFormKreditSpr
  Left = 214
  Top = 175
  Width = 696
  Height = 480
  Caption = #1057#1087#1088#1072#1074#1082#1080' '#1085#1072' '#1082#1088#1077#1076#1080#1090
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
    680
    442)
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridKredit: TdxDBGrid
    Left = 8
    Top = 8
    Width = 673
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
    DataSource = DataSourceKredit
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridKreditSHIFRID: TdxDBGridMaskColumn
      Visible = False
      Width = 200
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGridKreditTABNO: TdxDBGridMaskColumn
      Width = 85
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
    end
    object dxDBGridKreditFIO: TdxDBGridMaskColumn
      Width = 176
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
    object dxDBGridKreditDolg: TdxDBGridColumn
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      Width = 121
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DOLG'
    end
    object dxDBGridKreditSUMMATOT: TdxDBGridCurrencyColumn
      Width = 37
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMATOT'
      Nullable = False
    end
    object dxDBGridKreditDATEFR: TdxDBGridDateColumn
      Width = 37
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATEFR'
    end
    object dxDBGridKreditF_1: TdxDBGridMaskColumn
      Width = 175
      BandIndex = 0
      RowIndex = 0
      FieldName = 'F_1'
    end
    object dxDBGridKreditY: TdxDBGridMaskColumn
      Width = 38
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Y'
    end
  end
  object pFIBDataSetKredit: TpFIBDataSet
    UpdateRecordTypes = [cusUnmodified, cusModified]
    UpdateSQL.Strings = (
      'UPDATE TB_KREDIT_SPR'
      'SET '
      ' TABNO = :TABNO,'
      ' FIO = :FIO,'
      ' SUMMATOT = :SUMMATOT,'
      ' DATEFR = :DATEFR,'
      ' Y = :Y,'
      ' DOLG = :DOLG'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_KREDIT_SPR'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    RefreshSQL.Strings = (
      'select a.shifrid,a.tabno,a.fio,a.summatot,'
      
        '       (select first 1 fio from pr_getfioope(tb_kredit_spr.shifr' +
        'wrk)),'
      'a.datefr,a.y,a.dolg from tb_kredit_spr a '
      ' WHERE '
      '  A.SHIFRID = :OLD_SHIFRID'
      ' ')
    SelectSQL.Strings = (
      'select a.shifrid,a.tabno,a.fio,a.summatot,'
      
        '       (select first 1 fio from pr_getfioope(a.shifrwrk)) as F_1' +
        ','
      'a.datefr,a.y,a.dolg from tb_kredit_spr a order by 3')
    Transaction = FIB.pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = FIB.pFIBTransactionSAL
    Left = 56
    Top = 40
    object pFIBDataSetKreditSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object pFIBDataSetKreditTABNO: TFIBIntegerField
      DisplayLabel = #1058'.'#1085'.'
      FieldName = 'TABNO'
    end
    object pFIBDataSetKreditFIO: TFIBStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048' '#1054
      FieldName = 'FIO'
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSetKreditSUMMATOT: TFIBBCDField
      DisplayLabel = 'C'#1091#1084#1084#1072
      FieldName = 'SUMMATOT'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetKreditDATEFR: TFIBDateField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DATEFR'
    end
    object pFIBDataSetKreditF_1: TFIBStringField
      DisplayLabel = #1041#1091#1093#1075#1072#1083#1090#1077#1088
      FieldName = 'F_1'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBDataSetKreditY: TFIBSmallIntField
      DisplayLabel = #1043#1086#1076
      FieldName = 'Y'
    end
    object pFIBDataSetKreditDOLG: TFIBStringField
      FieldName = 'DOLG'
      Size = 100
      EmptyStrToNull = True
    end
  end
  object DataSourceKredit: TDataSource
    DataSet = pFIBDataSetKredit
    Left = 88
    Top = 40
  end
  object PopupMenu1: TPopupMenu
    Left = 112
    Top = 120
    object N1: TMenuItem
      Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103' '#1085#1086#1074#1086#1081' '#1089#1087#1088#1072#1074#1082#1080
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1089#1087#1088#1072#1074#1082#1080
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      OnClick = N3Click
    end
  end
end
