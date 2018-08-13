object FormMinSalSpr: TFormMinSalSpr
  Left = 224
  Top = 169
  Width = 696
  Height = 480
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1084#1080#1085#1080#1084#1072#1083#1100#1085#1099#1093' '#1079#1072#1088' '#1087#1083#1072#1090' '#1080' '#1089#1086#1094' '#1089#1090#1088#1072#1093#1072
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
  object dxDBGridMinSal: TdxDBGrid
    Left = 8
    Top = 8
    Width = 673
    Height = 409
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'DATEFR'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = DataSourceMinSal
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCanAppend, edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridMinSalDATEFR: TdxDBGridDateColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATEFR'
    end
    object dxDBGridMinSalLIMPROC: TdxDBGridCalcColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'LIMPROC'
    end
    object dxDBGridMinSalLIMITMAX: TdxDBGridCalcColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'LIMITMAX'
    end
    object dxDBGridMinSalPROCSSDOLIM: TdxDBGridCalcColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'PROCSSDOLIM'
    end
    object dxDBGridMinSalPROCSSAFTERLIM: TdxDBGridCalcColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'PROCSSAFTERLIM'
    end
    object dxDBGridMinSalMINSAL: TdxDBGridCalcColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MINSAL'
    end
    object dxDBGridMinSalPROGMIN: TdxDBGridCalcColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'PROGMIN'
    end
  end
  object pFIBDataSetMinSal: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SSLIMITY'
      'SET '
      ' LIMPROC = :LIMPROC,'
      ' LIMITMAX = :LIMITMAX,'
      ' PROCSSDOLIM = :PROCSSDOLIM,'
      ' PROCSSAFTERLIM = :PROCSSAFTERLIM,'
      ' MINSAL = :MINSAL,'
      ' PROGMIN = :PROGMIN'
      'WHERE'
      ' DATEFR = :OLD_DATEFR'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' SSLIMITY'
      'WHERE'
      '  DATEFR = :OLD_DATEFR'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO SSLIMITY('
      ' DATEFR,'
      ' LIMPROC,'
      ' LIMITMAX,'
      ' PROCSSDOLIM,'
      ' PROCSSAFTERLIM,'
      ' MINSAL,'
      ' PROGMIN'
      ')'
      'VALUES('
      ' :DATEFR,'
      ' :LIMPROC,'
      ' :LIMITMAX,'
      ' :PROCSSDOLIM,'
      ' :PROCSSAFTERLIM,'
      ' :MINSAL,'
      ' :PROGMIN'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' DATEFR,'
      ' LIMPROC,'
      ' LIMITMAX,'
      ' PROCSSDOLIM,'
      ' PROCSSAFTERLIM,'
      ' MINSAL,'
      ' PROGMIN'
      'FROM'
      ' SSLIMITY '
      ''
      ' WHERE '
      '  SSLIMITY.DATEFR = :OLD_DATEFR'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' DATEFR,'
      ' LIMPROC,'
      ' LIMITMAX,'
      ' PROCSSDOLIM,'
      ' PROCSSAFTERLIM,'
      ' MINSAL,'
      ' PROGMIN'
      'FROM'
      ' SSLIMITY '
      'Order by 1 desc')
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 104
    Top = 64
    object pFIBDataSetMinSalDATEFR: TFIBDateField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DATEFR'
    end
    object pFIBDataSetMinSalLIMPROC: TFIBBCDField
      DisplayLabel = #1051#1080#1084#1080#1090' '#1076#1083#1103' '#1080#1079#1084'. %'
      FieldName = 'LIMPROC'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetMinSalLIMITMAX: TFIBBCDField
      DisplayLabel = #1051#1080#1084#1080#1090' '#1089' '#1089
      FieldName = 'LIMITMAX'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetMinSalPROCSSDOLIM: TFIBBCDField
      DisplayLabel = #1055#1088#1086#1094'.'#1089'.'#1089'. '#1076#1083' '#1083#1080#1084#1080#1090#1072
      FieldName = 'PROCSSDOLIM'
      Size = 3
      RoundByScale = True
    end
    object pFIBDataSetMinSalPROCSSAFTERLIM: TFIBBCDField
      DisplayLabel = #1055#1088#1086#1094'.'#1089'.'#1089'.'#1087#1086#1089#1083#1077' '#1083#1080#1084#1080#1090#1072
      FieldName = 'PROCSSAFTERLIM'
      Size = 3
      RoundByScale = True
    end
    object pFIBDataSetMinSalMINSAL: TFIBBCDField
      DisplayLabel = #1052#1080#1085' '#1079#1072#1088#1087#1083#1072#1090#1072
      FieldName = 'MINSAL'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetMinSalPROGMIN: TFIBBCDField
      DisplayLabel = #1055#1088#1086#1078'.'#1084#1080#1085#1080#1084#1091#1084
      FieldName = 'PROGMIN'
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
    Left = 144
    Top = 64
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 192
    Top = 64
  end
  object DataSourceMinSal: TDataSource
    DataSet = pFIBDataSetMinSal
    Left = 232
    Top = 64
  end
end
