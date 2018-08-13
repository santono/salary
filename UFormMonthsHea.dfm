object FormMonthsHea: TFormMonthsHea
  Left = 320
  Top = 164
  Width = 528
  Height = 433
  Caption = #1050#1072#1083#1077#1085#1076#1072#1088#1080' '#1088#1072#1073#1086#1095#1080#1093' '#1076#1085#1077#1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    512
    395)
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridMHea: TdxDBGrid
    Left = 8
    Top = 8
    Width = 489
    Height = 369
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'DATEFR'
    SummaryGroups = <>
    SummarySeparator = ', '
    PopupMenu = PopupMenu1
    TabOrder = 0
    DataSource = DataSourceMHea
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridMHeaDATEFR: TdxDBGridDateColumn
      HeaderAlignment = taCenter
      Width = 107
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATEFR'
    end
    object dxDBGridMHeaWORK_DAY_5: TdxDBGridCalcColumn
      HeaderAlignment = taCenter
      Width = 76
      BandIndex = 0
      RowIndex = 0
      FieldName = 'WORK_DAY_5'
    end
    object dxDBGridMHeaWORK_DAY_6: TdxDBGridCalcColumn
      HeaderAlignment = taCenter
      Width = 76
      BandIndex = 0
      RowIndex = 0
      FieldName = 'WORK_DAY_6'
    end
    object dxDBGridMHeaWORK_CLOCK_5: TdxDBGridCalcColumn
      HeaderAlignment = taCenter
      Width = 76
      BandIndex = 0
      RowIndex = 0
      FieldName = 'WORK_CLOCK_5'
    end
    object dxDBGridMHeaWORK_CLOCK_6: TdxDBGridCalcColumn
      HeaderAlignment = taCenter
      Width = 76
      BandIndex = 0
      RowIndex = 0
      FieldName = 'WORK_CLOCK_6'
    end
    object dxDBGridMHeaColumnPr: TdxDBGridButtonColumn
      Caption = #1050#1072#1083#1077#1076#1076#1072#1088#1100
      Width = 74
      BandIndex = 0
      RowIndex = 0
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = dxDBGridMHeaColumnPrButtonClick
    end
  end
  object pFIBDataSetMHea: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_MONTHS_HEA'
      'SET '
      ' WORK_DAY_5 = :WORK_DAY_5,'
      ' WORK_DAY_6 = :WORK_DAY_6,'
      ' WORK_CLOCK_5 = :WORK_CLOCK_5,'
      ' WORK_CLOCK_6 = :WORK_CLOCK_6'
      'WHERE'
      ' DATEFR = :OLD_DATEFR'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_MONTHS_HEA'
      'WHERE'
      '  DATEFR = :OLD_DATEFR'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_MONTHS_HEA('
      ' DATEFR,'
      ' WORK_DAY_5,'
      ' WORK_DAY_6,'
      ' WORK_CLOCK_5,'
      ' WORK_CLOCK_6'
      ')'
      'VALUES('
      ' :DATEFR,'
      ' :WORK_DAY_5,'
      ' :WORK_DAY_6,'
      ' :WORK_CLOCK_5,'
      ' :WORK_CLOCK_6'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' DATEFR,'
      ' WORK_DAY_5,'
      ' WORK_DAY_6,'
      ' WORK_CLOCK_5,'
      ' WORK_CLOCK_6'
      'FROM'
      ' TB_MONTHS_HEA '
      ''
      ' WHERE '
      '  TB_MONTHS_HEA.DATEFR = :OLD_DATEFR'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' DATEFR,'
      ' WORK_DAY_5,'
      ' WORK_DAY_6,'
      ' WORK_CLOCK_5, '
      ' WORK_CLOCK_6 '
      'FROM'
      ' TB_MONTHS_HEA '
      'ORDER BY DATEFR DESC')
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    Left = 48
    Top = 32
    object pFIBDataSetMHeaDATEFR: TFIBDateField
      DisplayLabel = #1052#1077#1089#1103#1094
      FieldName = 'DATEFR'
    end
    object pFIBDataSetMHeaWORK_DAY_5: TFIBSmallIntField
      DisplayLabel = #1056#1072#1073'.'#1076#1085'.5'
      FieldName = 'WORK_DAY_5'
    end
    object pFIBDataSetMHeaWORK_DAY_6: TFIBSmallIntField
      DisplayLabel = #1056#1072#1073'.'#1076#1085'.6'
      FieldName = 'WORK_DAY_6'
    end
    object pFIBDataSetMHeaWORK_CLOCK_5: TFIBSmallIntField
      DisplayLabel = #1056#1072#1073'.'#1095'.5'
      FieldName = 'WORK_CLOCK_5'
    end
    object pFIBDataSetMHeaWORK_CLOCK_6: TFIBSmallIntField
      DisplayLabel = #1056#1072#1073'.'#1095'.6'
      FieldName = 'WORK_CLOCK_6'
    end
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 88
    Top = 32
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
    Left = 128
    Top = 32
  end
  object DataSourceMHea: TDataSource
    DataSet = pFIBDataSetMHea
    Left = 160
    Top = 32
  end
  object PopupMenu1: TPopupMenu
    Left = 168
    Top = 112
    object Daytxt1: TMenuItem
      Caption = #1048#1084#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1080#1079' Day.txt'
      OnClick = Daytxt1Click
    end
  end
end
