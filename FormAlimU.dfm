object FormAlim: TFormAlim
  Left = 241
  Top = 170
  Width = 696
  Height = 522
  Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1080' '#1072#1083#1080#1084#1077#1085#1090#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    680
    484)
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridAlim: TdxDBGrid
    Left = 8
    Top = 8
    Width = 673
    Height = 441
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFR'
    SummaryGroups = <>
    SummarySeparator = ', '
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    TabOrder = 0
    DataSource = DataSourceAlim
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridAlimSHIFR: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFR'
    end
    object dxDBGridAlimFIO_WOMEN: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO_WOMEN'
    end
    object dxDBGridAlimADRES: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ADRES'
    end
    object dxDBGridAlimPROCENT: TdxDBGridCurrencyColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'PROCENT'
      DisplayFormat = ',0.00'
      Nullable = False
    end
    object dxDBGridAlimPROCENTPST: TdxDBGridCurrencyColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'PROCENTPST'
      DisplayFormat = ',0.00'
      Nullable = False
    end
    object dxDBGridAlimDATAFR: TdxDBGridDateColumn
      Caption = 'C'
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATAFR'
    end
    object dxDBGridAlimDATATO: TdxDBGridDateColumn
      Caption = #1055#1086
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATATO'
    end
    object dxDBGridAlimTABNO: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
    end
    object dxDBGridAlimFIO_WORKER: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO_WORKER'
    end
    object dxDBGridAlimSel: TdxDBGridButtonColumn
      BandIndex = 0
      RowIndex = 0
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = dxDBGridAlimSelButtonClick
    end
  end
  object DBNavigatorAlim: TDBNavigator
    Left = 8
    Top = 448
    Width = 240
    Height = 25
    DataSource = DataSourceAlim
    Anchors = [akLeft, akBottom]
    TabOrder = 1
    OnClick = DBNavigatorAlimClick
  end
  object BitBtn1: TBitBtn
    Left = 264
    Top = 448
    Width = 75
    Height = 25
    Caption = #1042#1099#1073#1086#1088
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object pFIBDataSetAlim: TpFIBDataSet
    CachedUpdates = True
    UpdateSQL.Strings = (
      'UPDATE ALIMENTY'
      'SET '
      '    SHIFR = :SHIFR,'
      '    FIO_WOMEN = :FIO_WOMEN,'
      '    ADRES = :ADRES,'
      '    TABNO = :TABNO,'
      '    FIO_WORKER = :FIO_WORKER,'
      '    PROCENT = :PROCENT,'
      '    PROCENTPST = :PROCENTPST,'
      '    DATATO = :DATATO,'
      '    DATAFR = :DATAFR'
      'WHERE'
      '    SHIFR = :OLD_SHIFR'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    ALIMENTY'
      'WHERE'
      '        SHIFR = :OLD_SHIFR'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO ALIMENTY('
      '    SHIFR,'
      '    FIO_WOMEN,'
      '    ADRES,'
      '    TABNO,'
      '    FIO_WORKER,'
      '    PROCENT,'
      '    PROCENTPST,'
      '    DATATO,'
      '    DATAFR'
      ')'
      'VALUES('
      '    :SHIFR,'
      '    :FIO_WOMEN,'
      '    :ADRES,'
      '    :TABNO,'
      '    :FIO_WORKER,'
      '    :PROCENT,'
      '    :PROCENTPST,'
      '    :DATATO,'
      '    :DATAFR'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    ALI.SHIFR,'
      '    ALI.FIO_WOMEN,'
      '    ALI.ADRES,'
      '    ALI.TABNO,'
      '    ALI.FIO_WORKER,'
      '    ALI.PROCENT,'
      '    ALI.PROCENTPST,'
      '    ALI.DATATO,'
      '    ALI.DATAFR'
      'FROM'
      '    ALIMENTY ALI'
      ' WHERE '
      '        ALI.SHIFR = :OLD_SHIFR'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    ALI.SHIFR,'
      '    ALI.FIO_WOMEN,'
      '    ALI.ADRES,'
      '    ALI.TABNO,'
      '    ALI.FIO_WORKER,'
      '    ALI.PROCENT,'
      '    ALI.PROCENTPST,'
      '    ALI.DATATO,'
      '    ALI.DATAFR,'
      '    ALI.MODE'
      'FROM'
      '    ALIMENTY ALI'
      'WHERE (:NEED=1) OR '
      
        ' (COALESCE(ALI.DATATO,CURRENT_DATE)>EXTRACT(YEAR from CURRENT_DA' +
        'TE)||'#39'-'#39'||EXTRACT(MONTH from CURRENT_DATE)||'#39'-'#39'||(select first 1' +
        ' l from lenmonth(current_date)))'
      ''
      'ORDER BY ALI.SHIFR')
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 40
    Top = 80
    object pFIBDataSetAlimSHIFR: TFIBIntegerField
      DisplayLabel = #1064#1080#1092#1088
      FieldName = 'SHIFR'
      Origin = 'ALIMENTY.SHIFR'
    end
    object pFIBDataSetAlimFIO_WOMEN: TFIBStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldName = 'FIO_WOMEN'
      Origin = 'ALIMENTY.FIO_WOMEN'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBDataSetAlimADRES: TFIBStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      FieldName = 'ADRES'
      Origin = 'ALIMENTY.ADRES'
      Size = 79
      EmptyStrToNull = True
    end
    object pFIBDataSetAlimTABNO: TFIBIntegerField
      DisplayLabel = #1058'.'#1085'.'
      FieldName = 'TABNO'
      Origin = 'ALIMENTY.TABNO'
      ReadOnly = True
    end
    object pFIBDataSetAlimFIO_WORKER: TFIBStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldName = 'FIO_WORKER'
      Origin = 'ALIMENTY.FIO_WORKER'
      ReadOnly = True
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBDataSetAlimPROCENT: TFIBBCDField
      DisplayLabel = '%'
      FieldName = 'PROCENT'
      Origin = 'ALIMENTY.PROCENT'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetAlimPROCENTPST: TFIBBCDField
      DisplayLabel = '% '#1055#1095#1090
      FieldName = 'PROCENTPST'
      Origin = 'ALIMENTY.PROCENTPST'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetAlimDATATO: TFIBDateField
      DisplayLabel = #1057
      FieldName = 'DATATO'
      Origin = 'ALIMENTY.DATATO'
    end
    object pFIBDataSetAlimDATAFR: TFIBDateField
      DisplayLabel = #1055#1086
      FieldName = 'DATAFR'
      Origin = 'ALIMENTY.DATAFR'
    end
    object pFIBDataSetAlimMODE: TFIBIntegerField
      FieldName = 'MODE'
    end
  end
  object DataSourceAlim: TDataSource
    DataSet = pFIBDataSetAlim
    Left = 72
    Top = 80
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 48
    Top = 128
  end
  object PopupMenu1: TPopupMenu
    Left = 88
    Top = 128
    object DOS1: TMenuItem
      Caption = #1055#1077#1088#1077#1085#1086#1089' '#1080#1079' DOS'
      OnClick = DOS1Click
    end
    object N1: TMenuItem
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1072#1083#1080#1084#1077#1085#1090#1097#1080#1082#1086#1074
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1055#1077#1088#1077#1085#1086#1089' '#1074' DOS'
      OnClick = N2Click
    end
  end
end
