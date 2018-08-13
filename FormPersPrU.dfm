object FormPersPr: TFormPersPr
  Left = 217
  Top = 198
  Width = 746
  Height = 535
  Caption = #1044#1072#1085#1085#1099#1077' '#1087#1077#1088#1089#1086#1085#1086#1092#1080#1082#1072#1094#1080#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    738
    491)
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 504
    Top = 24
    Width = 66
    Height = 20
    Anchors = [akTop, akRight]
    Caption = #1055#1088#1080#1081#1085#1103#1090
  end
  object Label2: TLabel
    Left = 504
    Top = 56
    Width = 69
    Height = 20
    Anchors = [akTop, akRight]
    Caption = #1047#1074#1110#1083#1100#1085#1077#1085
  end
  object Label3: TLabel
    Left = 512
    Top = 80
    Width = 40
    Height = 20
    Anchors = [akTop, akRight]
    Caption = #1057#1090#1072#1078
  end
  object Label4: TLabel
    Left = 504
    Top = 104
    Width = 52
    Height = 20
    Anchors = [akTop, akRight]
    Caption = #1084#1110#1089#1103#1094#1110#1074
  end
  object Label5: TLabel
    Left = 624
    Top = 104
    Width = 32
    Height = 20
    Anchors = [akTop, akRight]
    Caption = #1076#1085#1110#1074
  end
  object dxDBGrid1: TdxDBGrid
    Left = 8
    Top = 8
    Width = 489
    Height = 321
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = DataSourceIndBody
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    object dxDBGrid1PERIOD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 44
      BandIndex = 0
      RowIndex = 0
      FieldName = 'PERIOD'
    end
    object dxDBGrid1SZ: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 96
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SZ'
    end
    object dxDBGrid1SZP: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 86
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SZP'
    end
    object dxDBGrid1SL: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 86
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SL'
    end
    object dxDBGrid1SPD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 86
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SPD'
    end
    object dxDBGrid1KD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Sorted = csUp
      Width = 87
      BandIndex = 0
      RowIndex = 0
      FieldName = 'KD'
    end
    object dxDBGrid1SHIFRID: TdxDBGridMaskColumn
      Visible = False
      Width = 101
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
  end
  object dxDBDateEditPri: TdxDBDateEdit
    Left = 576
    Top = 16
    Width = 145
    TabOrder = 1
    Anchors = [akTop, akRight]
    DataField = 'DPR'
    DataSource = DataSourceInd
  end
  object dxDBDateEditUw: TdxDBDateEdit
    Left = 576
    Top = 48
    Width = 145
    TabOrder = 2
    Anchors = [akTop, akRight]
    DataField = 'DZR'
    DataSource = DataSourceInd
  end
  object dxDBCalcEditKPM: TdxDBCalcEdit
    Left = 560
    Top = 104
    Width = 57
    TabOrder = 3
    Anchors = [akTop, akRight]
    DataField = 'KPM'
    DataSource = DataSourceInd
  end
  object dxDBCalcEditKPD: TdxDBCalcEdit
    Left = 664
    Top = 104
    Width = 65
    TabOrder = 4
    Anchors = [akTop, akRight]
    DataField = 'KPD'
    DataSource = DataSourceInd
  end
  object dxDBMaskEditSZ: TdxDBMaskEdit
    Left = 32
    Top = 335
    Width = 95
    TabOrder = 5
    Anchors = [akLeft, akBottom]
    DataField = 'SZ'
    DataSource = DataSourceInd
    EditMask = '!#999999,99;1; '
    IgnoreMaskBlank = False
    ReadOnly = True
    StoredValues = 68
  end
  object dxDBMaskEditSZP: TdxDBMaskEdit
    Left = 136
    Top = 335
    Width = 88
    TabOrder = 6
    Anchors = [akLeft, akBottom]
    DataField = 'SZP'
    DataSource = DataSourceInd
    EditMask = '!#999999,99;1; '
    IgnoreMaskBlank = False
    ReadOnly = True
    StoredValues = 68
  end
  object dxDBMaskEditSL: TdxDBMaskEdit
    Left = 232
    Top = 335
    Width = 87
    TabOrder = 7
    Anchors = [akLeft, akBottom]
    DataField = 'SL'
    DataSource = DataSourceInd
    EditMask = '!#999999,99;1; '
    IgnoreMaskBlank = False
    ReadOnly = True
    StoredValues = 68
  end
  object dxDBMaskEditKD: TdxDBMaskEdit
    Left = 432
    Top = 335
    Width = 64
    TabOrder = 8
    Anchors = [akLeft, akBottom]
    DataField = 'KD'
    DataSource = DataSourceInd
    EditMask = '!999;1; '
    IgnoreMaskBlank = False
    ReadOnly = True
    StoredValues = 68
  end
  object dxDBMaskEditSP: TdxDBMaskEdit
    Left = 328
    Top = 335
    Width = 95
    TabOrder = 9
    Anchors = [akLeft, akBottom]
    DataField = 'SP'
    DataSource = DataSourceInd
    EditMask = '!#99999,99;1; '
    IgnoreMaskBlank = False
    ReadOnly = True
    StoredValues = 68
  end
  object BitBtn1: TBitBtn
    Left = 512
    Top = 216
    Width = 89
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 10
    Kind = bkClose
  end
  object dxDBCheckEditPensioner: TdxDBCheckEdit
    Left = 504
    Top = 136
    Width = 105
    TabOrder = 11
    Anchors = [akTop, akRight]
    Caption = #1055#1077#1085#1089#1110#1086#1085#1077#1088
    DataField = 'ISPENSIONER'
    DataSource = DataSourceInd
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object dxDBCheckEditInvalid: TdxDBCheckEdit
    Left = 616
    Top = 137
    Width = 89
    TabOrder = 12
    Anchors = [akLeft, akTop, akRight]
    Caption = #1030#1085#1074#1072#1083#1110#1076
    DataField = 'ISINVALID'
    DataSource = DataSourceInd
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object dxDBMaskEditSVR: TdxDBMaskEdit
    Left = 328
    Top = 366
    Width = 96
    TabOrder = 13
    Anchors = [akLeft, akBottom]
    DataField = 'SVR'
    DataSource = DataSourceInd
    EditMask = '!#999999,99;1; '
    IgnoreMaskBlank = False
    ReadOnly = True
    StoredValues = 68
  end
  object dxDBGridSS: TdxDBGrid
    Left = 24
    Top = 404
    Width = 473
    Height = 76
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 14
    DataSource = DataSourceSS
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akBottom]
    object dxDBGridSSSHIFRID: TdxDBGridMaskColumn
      Visible = False
      Width = 90
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGridSSKPLG: TdxDBGridMaskColumn
      Caption = #1051#1100#1075#1086#1090#1072
      HeaderAlignment = taCenter
      Width = 90
      BandIndex = 0
      RowIndex = 0
      FieldName = 'KPLG'
    end
    object dxDBGridSSKMZ: TdxDBGridMaskColumn
      Caption = #1050'-'#1074#1086' '#1084#1077#1089
      HeaderAlignment = taCenter
      Sorted = csUp
      Width = 112
      BandIndex = 0
      RowIndex = 0
      FieldName = 'KMZ'
    end
    object dxDBGridSSKSL: TdxDBGridMaskColumn
      Width = 53
      BandIndex = 0
      RowIndex = 0
      FieldName = 'KSL'
    end
    object dxDBGridSSSSM: TdxDBGridMaskColumn
      Width = 107
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SSM'
    end
    object dxDBGridSSNSL: TdxDBGridMaskColumn
      Width = 107
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NSL'
    end
  end
  object BitBtn2: TBitBtn
    Left = 512
    Top = 176
    Width = 89
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 15
    OnClick = BitBtn2Click
  end
  object pFIBDataSetIndBody: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select tb_apm_ind_body.period ,tb_apm_ind_body.sz,tb_apm_ind_bod' +
        'y.szp,tb_apm_ind_body.sl,tb_apm_ind_body.spd,tb_apm_ind_body.kd,' +
        'tb_apm_ind_body.shifrid from tb_apm_ind'
      
        'join tb_apm_ind_body on tb_apm_ind.shifrid=tb_apm_ind_body.shifr' +
        'idind'
      'where tb_apm_ind.shifridank=:shifridank'
      'order by period')
    AutoUpdateOptions.UpdateTableName = 'TB_APM_IND_BODY'
    AutoUpdateOptions.KeyFields = 'SHIFRID'
    AutoUpdateOptions.GeneratorName = 'G_APM'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = FIB.pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = FIB.pFIBTransactionSAL
    AutoCommit = True
    Left = 24
    Top = 32
    object pFIBDataSetIndBodyPERIOD: TFIBSmallIntField
      DisplayLabel = #1052#1094
      FieldName = 'PERIOD'
    end
    object pFIBDataSetIndBodySZ: TFIBFloatField
      DisplayLabel = #1053#1072#1088#1072#1093#1086#1074#1072#1085#1086
      FieldName = 'SZ'
    end
    object pFIBDataSetIndBodySZP: TFIBFloatField
      DisplayLabel = #1044#1083#1103' '#1087' '#1085
      FieldName = 'SZP'
    end
    object pFIBDataSetIndBodySL: TFIBFloatField
      DisplayLabel = #1051#1110#1082#1072#1088#1085#1103#1085#1110
      FieldName = 'SL'
    end
    object pFIBDataSetIndBodySPD: TFIBFloatField
      DisplayLabel = #1042#1085#1077#1089#1082#1080
      FieldName = 'SPD'
    end
    object pFIBDataSetIndBodyKD: TFIBIntegerField
      DisplayLabel = #1044#1085#1077#1081
      FieldName = 'KD'
    end
    object pFIBDataSetIndBodySHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      Visible = False
    end
  end
  object DataSourceIndBody: TDataSource
    DataSet = pFIBDataSetIndBody
    Left = 64
    Top = 32
  end
  object pFIBDataSetInd: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_APM_IND'
      'SET '
      ' SVR = :SVR,'
      ' SVZ = :SVZ,'
      ' SZ = :SZ,'
      ' SZP = :SZP,'
      ' SL = :SL,'
      ' SP = :SP,'
      ' KD = :KD,'
      ' DPR = :DPR,'
      ' DZR = :DZR,'
      ' KPM = :KPM,'
      ' KPD = :KPD,'
      ' ISPENSIONER = :ISPENSIONER,'
      ' ISINVALID = :ISINVALID'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' SVR,'
      ' SVZ,'
      ' SZ,'
      ' SZP,'
      ' SL,'
      ' SP,'
      ' KD,'
      ' DPR,'
      ' DZR,'
      ' KPM,'
      ' KPD,'
      ' ISPENSIONER,'
      ' ISINVALID'
      'FROM'
      ' TB_APM_IND '
      'where TB_APM_IND.SHIFRID = :OLD_SHIFRID'
      '  '
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' SVR,'
      ' SVZ,'
      ' SZ,'
      ' SZP,'
      ' SL,'
      ' SP,'
      ' KD,'
      ' DPR,'
      ' DZR,'
      ' KPM,'
      ' KPD,'
      ' ISPENSIONER,'
      ' ISINVALID'
      'FROM'
      ' TB_APM_IND '
      'where shifridank=:shifridank')
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    AutoCommit = True
    Left = 368
    Top = 72
    object pFIBDataSetIndSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      Visible = False
    end
    object pFIBDataSetIndSVR: TFIBBCDField
      FieldName = 'SVR'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetIndSVZ: TFIBBCDField
      FieldName = 'SVZ'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetIndSZ: TFIBBCDField
      FieldName = 'SZ'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetIndSZP: TFIBBCDField
      FieldName = 'SZP'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetIndSL: TFIBBCDField
      FieldName = 'SL'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetIndSP: TFIBBCDField
      FieldName = 'SP'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetIndKD: TFIBIntegerField
      FieldName = 'KD'
    end
    object pFIBDataSetIndDPR: TFIBDateField
      FieldName = 'DPR'
    end
    object pFIBDataSetIndDZR: TFIBDateField
      FieldName = 'DZR'
    end
    object pFIBDataSetIndKPM: TFIBIntegerField
      FieldName = 'KPM'
    end
    object pFIBDataSetIndKPD: TFIBIntegerField
      FieldName = 'KPD'
    end
    object pFIBDataSetIndISPENSIONER: TFIBSmallIntField
      FieldName = 'ISPENSIONER'
    end
    object pFIBDataSetIndISINVALID: TFIBSmallIntField
      FieldName = 'ISINVALID'
    end
  end
  object DataSourceInd: TDataSource
    DataSet = pFIBDataSetInd
    Left = 400
    Top = 72
  end
  object pFIBDataSetSS: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_APM_IND_SS'
      'SET '
      ' KPLG = :KPLG,'
      ' KMZ = :KMZ,'
      ' KSL = :KSL,'
      ' SSM = :SSM,'
      ' NSL = :NSL'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' KPLG,'
      ' KMZ,'
      ' KSL,'
      ' SSM,'
      ' NSL'
      'FROM'
      ' TB_APM_IND_SS '
      'where TB_APM_IND_SS.SHIFRID = :OLD_SHIFRID'
      ''
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' KPLG,'
      ' KMZ,'
      ' KSL,'
      ' SSM,'
      ' NSL'
      'FROM'
      ' TB_APM_IND_SS '
      'where shifridind=:shifrind and ssm>0')
    Transaction = FIB.pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = FIB.pFIBTransactionSAL
    AutoCommit = True
    Left = 40
    Top = 432
    object pFIBDataSetSSSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      Visible = False
    end
    object pFIBDataSetSSKPLG: TFIBStringField
      FieldName = 'KPLG'
      Size = 8
      EmptyStrToNull = True
    end
    object pFIBDataSetSSKMZ: TFIBIntegerField
      FieldName = 'KMZ'
    end
    object pFIBDataSetSSKSL: TFIBStringField
      FieldName = 'KSL'
      Size = 1
      EmptyStrToNull = True
    end
    object pFIBDataSetSSSSM: TFIBIntegerField
      FieldName = 'SSM'
    end
    object pFIBDataSetSSNSL: TFIBFloatField
      FieldName = 'NSL'
    end
  end
  object DataSourceSS: TDataSource
    DataSet = pFIBDataSetSS
    Left = 80
    Top = 432
  end
end
