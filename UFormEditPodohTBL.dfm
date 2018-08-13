object FormEditPodohTBL: TFormEditPodohTBL
  Left = 211
  Top = 184
  Width = 708
  Height = 496
  Caption = #1058#1072#1073#1083#1080#1094#1099' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1087#1086#1076#1086#1093#1086#1076#1085#1086#1075#1086' '#1085#1072#1083#1086#1075#1072
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
    692
    458)
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridPo: TdxDBGrid
    Left = 8
    Top = 8
    Width = 673
    Height = 417
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'DATEFR'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = DataSourcePo
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridPoDATEFR: TdxDBGridDateColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATEFR'
    end
    object dxDBGridPoSUMMALGOTY: TdxDBGridCalcColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMALGOTY'
    end
    object dxDBGridPoLIMITLGOTY: TdxDBGridCalcColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'LIMITLGOTY'
    end
    object dxDBGridPoPROC: TdxDBGridCalcColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'PROC'
    end
    object dxDBGridPoLimitSec: TdxDBGridCalcColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'LIMITFORSEC'
    end
    object dxDBGridPoAddPodoh: TdxDBGridCalcColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ADDPODOH'
    end
    object dxDBGridPoProcAdd: TdxDBGridCalcColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'PROCADD'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 432
    Width = 240
    Height = 25
    DataSource = DataSourcePo
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object pFIBDataSetPodoh: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE PODOHTBL'
      'SET '
      ' SUMMALGOTY  = :SUMMALGOTY  ,'
      ' LIMITLGOTY  = :LIMITLGOTY  ,'
      ' PROC        = :PROC        ,'
      ' LIMITFORSEC = :LIMITFORSEC ,'
      ' ADDPODOH    = :ADDPODOH    ,'
      ' PROCADD     = :PROCADD'
      ''
      'WHERE'
      ' DATEFR = :OLD_DATEFR'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' PODOHTBL'
      'WHERE'
      '  DATEFR = :OLD_DATEFR'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO PODOHTBL('
      ' DATEFR,'
      ' SUMMALGOTY,'
      ' LIMITLGOTY,'
      ' PROC,'
      ' LIMITFORSEC,'
      ' ADDPODOH,'
      ' PROCADD'
      ')'
      'VALUES('
      ' :DATEFR,'
      ' :SUMMALGOTY,'
      ' :LIMITLGOTY,'
      ' :PROC,'
      ' :LIMITFORSEC,'
      ' :ADDPODOH,'
      ' :PROCADD'
      ''
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' DATEFR      ,'
      ' SUMMALGOTY  ,'
      ' LIMITLGOTY  ,'
      ' PROC        , '
      ' LIMITFORSEC ,'
      ' ADDPODOH    ,'
      ' PROCADD'
      ''
      'FROM'
      ' PODOHTBL '
      ''
      ' WHERE '
      '  PODOHTBL.DATEFR = :OLD_DATEFR'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' DATEFR,'
      ' SUMMALGOTY,'
      ' LIMITLGOTY,'
      ' PROC,'
      ' LIMITFORSEC,'
      ' ADDPODOH,'
      ' PROCADD '
      'FROM'
      ' PODOHTBL '
      'ORDER BY DATEFR DESC')
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 72
    Top = 80
    object pFIBDataSetPodohDATEFR: TFIBDateField
      DisplayLabel = #1044#1072#1090#1072' '#1089
      FieldName = 'DATEFR'
    end
    object pFIBDataSetPodohSUMMALGOTY: TFIBBCDField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1083#1100#1075#1086#1090#1099
      FieldName = 'SUMMALGOTY'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetPodohLIMITLGOTY: TFIBBCDField
      DisplayLabel = #1051#1080#1084#1080#1090' '#1076#1083#1103' '#1083#1100#1075#1086#1090#1099
      FieldName = 'LIMITLGOTY'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetPodohPROC: TFIBBCDField
      DisplayLabel = #1055#1088#1086#1094'.'#1087'.'#1085#1072#1083#1086#1075#1072
      FieldName = 'PROC'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetPodohLIMITFORSEC: TFIBBCDField
      DisplayLabel = #1051#1080#1084#1080#1090'17'
      FieldName = 'LIMITFORSEC'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetPodohADDPODOH: TFIBBCDField
      DisplayLabel = #1052#1072#1082#1089' 15'
      FieldName = 'ADDPODOH'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetPodohPROCADD: TFIBBCDField
      DisplayLabel = #1055#1088#1086#1094'2'
      FieldName = 'PROCADD'
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
    Left = 120
    Top = 80
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 160
    Top = 80
  end
  object DataSourcePo: TDataSource
    DataSet = pFIBDataSetPodoh
    Left = 192
    Top = 80
  end
end
