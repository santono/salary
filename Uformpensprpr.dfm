object FormEditPensSprPrPr: TFormEditPensSprPrPr
  Left = 256
  Top = 209
  Width = 696
  Height = 513
  Caption = #1056#1072#1089#1096#1080#1092#1088#1086#1074#1082#1072' '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    688
    469)
  PixelsPerInch = 96
  TextHeight = 20
  object LabelHeader: TLabel
    Left = 8
    Top = 8
    Width = 92
    Height = 20
    Caption = 'LabelHeader'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object dxDBGridPPrPr: TdxDBGrid
    Left = 8
    Top = 48
    Width = 673
    Height = 393
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    ShowSummaryFooter = True
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = DataSource1
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridPPrPrNeed: TdxDBGridCheckColumn
      Width = 34
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NEED'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridPPrPrShifrSta: TdxDBGridColumn
      Caption = #1064#1080#1092#1088
      HeaderAlignment = taCenter
      Width = 37
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRSTA'
    end
    object dxDBGridPPrPrSHORTNAME: TdxDBGridMaskColumn
      Caption = #1057#1090#1072#1090#1100#1103
      HeaderAlignment = taCenter
      Width = 53
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHORTNAME'
    end
    object dxDBGridPPrPrSUMMA: TdxDBGridCurrencyColumn
      Caption = #1057#1091#1084#1084#1072
      HeaderAlignment = taCenter
      Sorted = csUp
      Width = 104
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMA'
      SummaryFooterType = cstSum
      SummaryFooterField = 'SUMMA'
      DisplayFormat = ',0.00'
      Nullable = False
      SummaryType = cstMax
      SummaryField = 'SUMMA'
    end
    object dxDBGridPPrPrYEAR_VY: TdxDBGridMaskColumn
      Caption = #1043#1086#1076' '#1074
      HeaderAlignment = taCenter
      Width = 32
      BandIndex = 0
      RowIndex = 0
      FieldName = 'YEAR_VY'
    end
    object dxDBGridPPrPrMONTH_VY: TdxDBGridMaskColumn
      Caption = #1052#1094' '#1074
      HeaderAlignment = taCenter
      Width = 32
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MONTH_VY'
    end
    object dxDBGridPPrPrShifrPod: TdxDBGridColumn
      Caption = #1055#1076#1088
      HeaderAlignment = taCenter
      Width = 32
      BandIndex = 0
      RowIndex = 0
      FieldName = 'W_PLACE'
    end
    object dxDBGridPPrPrPodrNAME: TdxDBGridMaskColumn
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      HeaderAlignment = taCenter
      Width = 156
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
    object dxDBGridPPrPrGruppa: TdxDBGridMaskColumn
      Caption = #1057#1095#1077#1090
      Width = 46
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME1'
    end
    object dxDBGridPPrPrKateg: TdxDBGridMaskColumn
      Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME2'
    end
    object dxDBGridPPrPrDolg: TdxDBGridMaskColumn
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      Width = 53
      BandIndex = 0
      RowIndex = 0
      FieldName = 'CASE'
    end
    object dxDBGridPPrPrWidR: TdxDBGridColumn
      Caption = #1042' '#1056
      HeaderAlignment = taCenter
      Width = 20
      BandIndex = 0
      RowIndex = 0
      FieldName = 'CASE2'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 441
    Width = 231
    Height = 25
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel, nbRefresh]
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 256
    Top = 440
    Width = 185
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1080
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object pFIBDataSet1: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE tb_pensspr_2007_pr_pr'
      'SET '
      '    NEED = :NEED'
      'WHERE'
      '    SHIFRID = :OLD_SHIFRID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TB_PENSSPR_2007_PR_PR'
      'WHERE'
      '        SHIFRID = :OLD_SHIFRID'
      '    ')
    InsertSQL.Strings = (
      'insert into tb_pensspr_2007_pr_pr (shifrid) values (1);'
      ''
      ''
      ''
      '')
    RefreshSQL.Strings = (
      
        'select a.need,b.shortname,a.summa,a.year_vy,a.month_vy,c.name,g.' +
        'name,k.name, '
      '       case when exists (select first 1 a1.w_r from fadd a1'
      
        '                                join person p on a1.shifridperso' +
        'n=p.shifrid'
      '                                where a1.shifrid=a.shifridadd)'
      '        then (select first 1 p.dolg from fadd a1'
      
        '                                join person p on a1.shifridperso' +
        'n=p.shifrid'
      '                                where a1.shifrid=a.shifridadd)'
      '        else '#39#39' end,'
      '       case when exists (select first 1 a1.w_r from fadd a1'
      
        '                                join person p on a1.shifridperso' +
        'n=p.shifrid'
      '                                where a1.shifrid=a.shifridadd)'
      '        then (select first 1 a1.shifridperson from fadd a1'
      
        '                                join person p on a1.shifridperso' +
        'n=p.shifrid'
      '                                where a1.shifrid=a.shifridadd)'
      '        else 1 end,a.ShifrId'
      'from tb_pensspr_2007_pr_pr a'
      '     join shifr b on a.shifrsta=b.shifr'
      '     join podr c on a.w_place=c.shifrpod'
      '     join gruppy g on a.shifrgru=g.shifr'
      '     join kateg k on k.shifr=a.shifrkat'
      'where(  a.shifridpensspr=:shifridpensspr and'
      '      a.year_za=:year_za and'
      '      a.month_za=:month_za'
      '     ) and (     A.SHIFRID = :OLD_SHIFRID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      
        'select a.need,b.shortname,a.summa,a.year_vy,a.month_vy,c.name,g.' +
        'name,k.name, '
      '       case when exists (select first 1 a1.w_r from fadd a1'
      
        '                                join person p on a1.shifridperso' +
        'n=p.shifrid'
      '                                where a1.shifrid=a.shifridadd)'
      '        then (select first 1 p.dolg from fadd a1'
      
        '                                join person p on a1.shifridperso' +
        'n=p.shifrid'
      '                                where a1.shifrid=a.shifridadd)'
      '        else '#39#39' end,'
      '       case when exists (select first 1 a1.w_r from fadd a1'
      
        '                                join person p on a1.shifridperso' +
        'n=p.shifrid'
      '                                where a1.shifrid=a.shifridadd)'
      '        then (select first 1 a1.shifridperson from fadd a1'
      
        '                                join person p on a1.shifridperso' +
        'n=p.shifrid'
      '                                where a1.shifrid=a.shifridadd)'
      '        else 1 end,a.ShifrId,a.SHIFRSTA,a.W_PLACE,'
      
        '        CASE WHEN (P.w_r=1 or EXISTS (SELECT * FROM FCN CN WHERE' +
        ' CN.shifridperson=P.shifrid AND CN.shifrsta IN (82,82+500))) THE' +
        'N '#39#1086#1089#1085#39' ELSE '#39#1089#1074#1084#39' END'
      'from tb_pensspr_2007_pr_pr a'
      '     join shifr b on a.shifrsta=b.shifr'
      '     join podr c on a.w_place=c.shifrpod'
      '     join gruppy g on a.shifrgru=g.shifr'
      '     join kateg k on k.shifr=a.shifrkat'
      '     join fadd a1 on a1.shifrid=a.shifridadd'
      '     join person p on p.shifrid=a1.shifridperson'
      '     join tb_pensspr_2007_pr prr on prr.shifrid=a.shifridpensspr'
      'where prr.shifridown=:shifridpensspr and'
      '      extract(year from prr.dataza)=:year_za and'
      '      extract(month from prr.dataza)=:month_za'
      'order by c.shifrpod,10,a.shifrsta')
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseArc
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 40
    Top = 72
    object pFIBDataSet1NEED: TFIBSmallIntField
      FieldName = 'NEED'
    end
    object pFIBDataSet1SHORTNAME: TFIBStringField
      FieldName = 'SHORTNAME'
      EmptyStrToNull = True
    end
    object pFIBDataSet1SUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet1YEAR_VY: TFIBSmallIntField
      FieldName = 'YEAR_VY'
    end
    object pFIBDataSet1MONTH_VY: TFIBSmallIntField
      FieldName = 'MONTH_VY'
    end
    object pFIBDataSet1PODR: TFIBStringField
      FieldName = 'NAME'
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSet1GRUPPA: TFIBStringField
      FieldName = 'NAME1'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSet1KATEG: TFIBStringField
      FieldName = 'NAME2'
      Size = 40
      EmptyStrToNull = True
    end
    object pFIBDataSet1DOLGE: TFIBStringField
      FieldName = 'CASE'
      Size = 25
      EmptyStrToNull = True
    end
    object pFIBDataSet1ShifrIdPerson: TFIBIntegerField
      FieldName = 'CASE1'
      ReadOnly = True
    end
    object pFIBDataSet1SHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      ReadOnly = True
    end
    object pFIBDataSet1SHIFRSTA: TFIBSmallIntField
      FieldName = 'SHIFRSTA'
    end
    object pFIBDataSet1W_PLACE: TFIBSmallIntField
      FieldName = 'W_PLACE'
    end
    object pFIBDataSet1WidR: TFIBStringField
      FieldName = 'CASE2'
      Size = 3
      EmptyStrToNull = True
    end
  end
  object pFIBTransactionRead: TpFIBTransaction
    Active = True
    DefaultDatabase = FIB.pFIBDatabaseArc
    TimeoutAction = TARollback
    Left = 88
    Top = 72
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseArc
    TimeoutAction = TARollback
    Left = 128
    Top = 72
  end
  object DataSource1: TDataSource
    DataSet = pFIBDataSet1
    Left = 168
    Top = 72
  end
  object pFIBQueryRPP: TpFIBQuery
    Transaction = pFIBTransactionRPP
    Database = FIB.pFIBDatabaseArc
    Left = 48
    Top = 128
  end
  object pFIBTransactionRPP: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseArc
    TimeoutAction = TARollback
    Left = 96
    Top = 128
  end
end
