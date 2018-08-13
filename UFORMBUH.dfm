object FormOpe: TFormOpe
  Left = 226
  Top = 155
  Width = 987
  Height = 547
  Caption = #1057#1087#1080#1089#1086#1082' '#1086#1087#1077#1088#1072#1090#1086#1088#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridOpe: TdxDBGrid
    Left = 8
    Top = 8
    Width = 313
    Height = 441
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRWRK'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = DataSourceSal
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCanAppend, edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    object dxDBGridOpeSHIFRWRK: TdxDBGridMaskColumn
      Width = 26
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRWRK'
    end
    object dxDBGridOpeFIOOP: TdxDBGridMaskColumn
      Width = 167
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIOOP'
    end
    object dxDBGridOpeNAMEOP: TdxDBGridMaskColumn
      Width = 114
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAMEOP'
    end
    object dxDBGridOpeLOGIN: TdxDBGridMaskColumn
      Width = 108
      BandIndex = 0
      RowIndex = 0
      FieldName = 'LOGIN'
    end
    object dxDBGridOpePSSWD: TdxDBGridMaskColumn
      Width = 108
      BandIndex = 0
      RowIndex = 0
      FieldName = 'PSSWD'
    end
    object dxDBGridOpeSHIFRPRA: TdxDBGridMaskColumn
      Width = 94
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRPRA'
    end
    object dxDBGridOpeNomerOpe: TdxDBGridCalcColumn
      Caption = #1053#1086#1084#1077#1088
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NOMEROP'
    end
  end
  object PageControl1: TPageControl
    Left = 328
    Top = 8
    Width = 633
    Height = 465
    ActivePage = TabSheetBay
    TabOrder = 1
    object TabSheetBay: TTabSheet
      Caption = #1059#1095#1072#1089#1090#1086#1082
      DesignSize = (
        625
        430)
      object dxDBGridPodr: TdxDBGrid
        Left = 8
        Top = 5
        Width = 609
        Height = 396
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFRPOD'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourcePodr
        Filter.Criteria = {00000000}
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridPodrSHIFRPOD: TdxDBGridMaskColumn
          Width = 51
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRPOD'
        end
        object dxDBGridPodrNAMEPOD: TdxDBGridLookupColumn
          HeaderAlignment = taCenter
          Width = 533
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAMEPOD'
          DropDownRows = 15
          ListFieldName = 'SHIFRPOD;NAME'
          ListFieldIndex = 1
        end
      end
      object DBNavigator1: TDBNavigator
        Left = 8
        Top = 405
        Width = 240
        Height = 25
        DataSource = DataSourcePodr
        Anchors = [akLeft, akBottom]
        TabOrder = 1
      end
    end
    object TabSheetAccess: TTabSheet
      Caption = #1044#1086#1089#1090#1091#1087
      ImageIndex = 1
      DesignSize = (
        625
        430)
      object dxDBGridAcc: TdxDBGrid
        Left = 8
        Top = 8
        Width = 609
        Height = 377
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFRPOD'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceAcc
        Filter.Criteria = {00000000}
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridAccSHIFRPOD: TdxDBGridMaskColumn
          Caption = #1064#1092#1088
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRPOD'
        end
        object dxDBGridAccSHIFRBUH: TdxDBGridMaskColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRBUH'
        end
        object dxDBGridAccNAMEPOD: TdxDBGridLookupColumn
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAMEPOD'
        end
        object dxDBGridAccShifrIdAcc: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'ShifrIdAcc'
        end
      end
      object DBNavigator2: TDBNavigator
        Left = 8
        Top = 392
        Width = 240
        Height = 25
        DataSource = DataSourceAcc
        Anchors = [akLeft, akBottom]
        TabOrder = 1
      end
    end
    object TabSheetDop: TTabSheet
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
      ImageIndex = 2
      DesignSize = (
        625
        430)
      object dxDBGridDop: TdxDBGrid
        Left = 0
        Top = 0
        Width = 625
        Height = 393
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'ShifrIdDop'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceDop
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridDopSHIFRPOD: TdxDBGridMaskColumn
          Caption = #1064#1080#1092#1088
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRPOD'
        end
        object dxDBGridDopSHIFRBUH: TdxDBGridMaskColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRBUH'
        end
        object dxDBGridDopNAMEPOD: TdxDBGridLookupColumn
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          HeaderAlignment = taCenter
          Sorted = csUp
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAMEPOD'
        end
        object dxDBGridDopShifrIdDop: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'ShifrIdDop'
        end
      end
      object DBNavigatorDop: TDBNavigator
        Left = 0
        Top = 400
        Width = 240
        Height = 25
        DataSource = DataSourceDop
        TabOrder = 1
      end
    end
  end
  object pFIBDataSetOpe: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE OPERATORY'
      'SET '
      '    SHIFRWRK = :SHIFRWRK,'
      '    LOGIN    = :LOGIN,'
      '    PSSWD    = :PSSWD,'
      '    SHIFRPRA = :SHIFRPRA,'
      '    FIOOP    = :FIOOP,'
      '    NAMEOP   = :NAMEOP,'
      '    NOMEROP  = :NOMEROP'
      'WHERE'
      '    SHIFRWRK = :OLD_SHIFRWRK'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    OPERATORY'
      'WHERE'
      '        SHIFRWRK = :OLD_SHIFRWRK'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO OPERATORY('
      '    SHIFRWRK,'
      '    LOGIN,'
      '    PSSWD,'
      '    SHIFRPRA,'
      '    FIOOP,'
      '    NAMEOP,'
      '    NOMEROP'
      ')'
      'VALUES('
      '    :SHIFRWRK,'
      '    :LOGIN,'
      '    :PSSWD,'
      '    :SHIFRPRA,'
      '    :FIOOP,'
      '    :NAMEOP,'
      '    :NOMEROP'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    OPE.SHIFRWRK,'
      '    OPE.LOGIN,'
      '    OPE.PSSWD,'
      '    OPE.SHIFRPRA,'
      '    OPE.FIOOP,'
      '    OPE.NAMEOP,'
      '    OPE.NOMEROP'
      'FROM'
      '    OPERATORY OPE'
      'WHERE(  OPE.SHIFRWRK>1'
      '     ) and (     OPE.SHIFRWRK = :OLD_SHIFRWRK'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    OPE.SHIFRWRK,'
      '    OPE.LOGIN,'
      '    OPE.PSSWD,'
      '    OPE.SHIFRPRA,'
      '    OPE.FIOOP,'
      '    OPE.NAMEOP,'
      '    OPE.NOMEROP'
      'FROM'
      '    OPERATORY OPE'
      'WHERE OPE.SHIFRWRK>1'
      'ORDER BY OPE.SHIFRWRK')
    AfterScroll = pFIBDataSetOpeAfterScroll
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    Left = 8
    Top = 8
    object pFIBDataSetOpeSHIFRWRK: TFIBIntegerField
      DisplayLabel = #8470
      FieldName = 'SHIFRWRK'
      Origin = 'OPERATORY.SHIFRWRK'
    end
    object pFIBDataSetOpeFIOOP: TFIBStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'FIOOP'
      Origin = 'OPERATORY.FIOOP'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBDataSetOpeNAMEOP: TFIBStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'NAMEOP'
      Origin = 'OPERATORY.NAMEOP'
      Size = 31
      EmptyStrToNull = True
    end
    object pFIBDataSetOpeLOGIN: TFIBStringField
      FieldName = 'LOGIN'
      Origin = 'OPERATORY.LOGIN'
      EmptyStrToNull = True
    end
    object pFIBDataSetOpePSSWD: TFIBStringField
      FieldName = 'PSSWD'
      Origin = 'OPERATORY.PSSWD'
      EmptyStrToNull = True
    end
    object pFIBDataSetOpeSHIFRPRA: TFIBIntegerField
      FieldName = 'SHIFRPRA'
      Origin = 'OPERATORY.SHIFRPRA'
    end
    object pFIBDataSetOpeNOMEROP: TFIBSmallIntField
      FieldName = 'NOMEROP'
    end
  end
  object DataSourceSal: TDataSource
    DataSet = pFIBDataSetOpe
    Left = 40
    Top = 8
  end
  object pFIBDataSetPodr: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE BAY'
      'SET '
      '    SHIFRPOD = :SHIFRPOD'
      'WHERE SHIFRPOD=:OLD_SHIFRPOD AND SHIFRBUH=:MAS_SHIFRWRK'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    BAY'
      'WHERE SHIFRPOD=:OLD_SHIFRPOD AND SHIFRBUH=:MAS_SHIFRWRK'
      '        ')
    InsertSQL.Strings = (
      'INSERT INTO BAY('
      '    SHIFRPOD,'
      '    SHIFRBUH'
      ')'
      'VALUES('
      '    :SHIFRPOD,'
      '    :MAS_SHIFRWRK'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    BAY.SHIFRPOD'
      'FROM'
      '    BAY BAY '
      'WHERE BAY.SHIFRBUH=:MAS_SHIFRWRK'
      '')
    SelectSQL.Strings = (
      'SELECT'
      '    BAY.SHIFRPOD,'
      '    BAY.ShifrBUH'
      'FROM'
      '    BAY BAY '
      'WHERE BAY.SHIFRBUH=:MAS_SHIFRWRK'
      '')
    AutoUpdateOptions.UpdateTableName = 'BAY'
    AutoUpdateOptions.KeyFields = 'SHIFRBUH;Shifrpod'
    AutoUpdateOptions.AutoReWriteSqls = True
    AutoUpdateOptions.CanChangeSQLs = True
    AutoUpdateOptions.ParamsToFieldsLinks.Strings = (
      'SHIFRBUH=MAS_SHIFRWRK')
    AutoUpdateOptions.AutoParamsToFields = True
    BeforePost = pFIBDataSetPodrBeforePost
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    DataSource = DataSourceSal
    Left = 368
    Top = 104
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
    oRefreshAfterPost = False
    object pFIBDataSetPodrSHIFRPOD: TFIBIntegerField
      DisplayLabel = #1064#1092#1088
      FieldName = 'SHIFRPOD'
      Origin = 'BAY.SHIFRPOD'
    end
    object pFIBDataSetPodrNAMEPOD: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldKind = fkLookup
      FieldName = 'NAMEPOD'
      LookupDataSet = pFIBDataSetSelPodr
      LookupKeyFields = 'SHIFRPOD'
      LookupResultField = 'NAME'
      KeyFields = 'SHIFRPOD'
      Origin = 'PODR.NAME'
      Size = 40
      Lookup = True
    end
    object pFIBDataSetPodrSHIFRBUH: TFIBIntegerField
      FieldName = 'SHIFRBUH'
    end
  end
  object DataSourcePodr: TDataSource
    DataSet = pFIBDataSetPodr
    Left = 408
    Top = 104
  end
  object pFIBDataSetSelPodr: TpFIBDataSet
    SelectSQL.Strings = (
      'select shifrpod,name from podr'
      'order by SHIFRPOD')
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    Left = 456
    Top = 144
    object pFIBDataSetSelPodrSHIFRPOD: TFIBIntegerField
      FieldName = 'SHIFRPOD'
    end
    object pFIBDataSetSelPodrNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 100
      EmptyStrToNull = True
    end
  end
  object DataSourceSelPodr: TDataSource
    DataSet = pFIBDataSetSelPodr
    Left = 496
    Top = 144
  end
  object pFIBDataSetAcc: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_BUH_ACCESS'
      'SET '
      ' SHIFRPOD = :SHIFRPOD'
      'WHERE'
      ' SHIFRPOD     = :OLD_SHIFRPOD'
      ' and SHIFRBUH = :MAS_SHIFRWRK'
      ' '
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_BUH_ACCESS'
      'WHERE'
      '  SHIFRPOD = :OLD_SHIFRPOD'
      ' and SHIFRBUH = :OLD_SHIFRBUH'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_BUH_ACCESS('
      ' SHIFRPOD,'
      ' SHIFRBUH'
      ')'
      'VALUES('
      ' :SHIFRPOD,'
      ' :MAS_SHIFRWRK'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    TB_BUH_ACCESS.SHIFRPOD'
      ' FROM'
      '    TB_BUH_ACCESS TB_BUH_ACCESS '
      'WHERE (  TB_BUH_ACCESS.SHIFRBUH=:MAS_SHIFRWRK'
      '  ) and (  TB_BUH_ACCESS.SHIFRPOD = :OLD_SHIFRPOD )'
      '')
    SelectSQL.Strings = (
      'SELECT'
      '    TB_BUH_ACCESS.SHIFRPOD,'
      '    TB_BUH_ACCESS.ShifrBUH'
      'FROM'
      '    TB_BUH_ACCESS TB_BUH_ACCESS '
      'WHERE TB_BUH_ACCESS.SHIFRBUH=:MAS_SHIFRWRK')
    OnCalcFields = pFIBDataSetAccCalcFields
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    DataSource = DataSourceSal
    Left = 364
    Top = 143
    object pFIBDataSetAccSHIFRPOD: TFIBIntegerField
      FieldName = 'SHIFRPOD'
    end
    object pFIBDataSetAccSHIFRBUH: TFIBIntegerField
      FieldName = 'SHIFRBUH'
    end
    object pFIBDataSetAccNAMEPOD: TStringField
      FieldKind = fkLookup
      FieldName = 'NAMEPOD'
      LookupDataSet = pFIBDataSetSelPodr
      LookupKeyFields = 'SHIFRPOD'
      LookupResultField = 'NAME'
      KeyFields = 'SHIFRPOD'
      Size = 120
      Lookup = True
    end
    object pFIBDataSetAccShifrIdAcc: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ShifrIdAcc'
      Calculated = True
    end
  end
  object DataSourceAcc: TDataSource
    DataSet = pFIBDataSetAcc
    Left = 412
    Top = 143
  end
  object pFIBDataSetDop: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_BUH_DOP_PODR'
      'SET '
      ' SHIFRPOD = :SHIFRPOD'
      'WHERE'
      ' SHIFRPOD     = :OLD_SHIFRPOD'
      ' and SHIFRBUH = :MAS_SHIFRWRK'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_BUH_DOP_PODR'
      'WHERE'
      '  SHIFRPOD = :OLD_SHIFRPOD'
      ' and SHIFRBUH = :OLD_SHIFRBUH'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_BUH_DOP_PODR('
      ' SHIFRPOD,'
      ' SHIFRBUH'
      ')'
      'VALUES('
      ' :SHIFRPOD,'
      ' :MAS_SHIFRWRK'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    TB_BUH_DOP_PODR.SHIFRPOD'
      ' FROM'
      '    TB_BUH_DOP_PODR TB_BUH_DOP_PODR '
      'WHERE (  TB_BUH_DOP_PODR.SHIFRBUH=:MAS_SHIFRWRK'
      '  ) and (  TB_BUH_DOP_PODR.SHIFRPOD = :OLD_SHIFRPOD )')
    SelectSQL.Strings = (
      'SELECT'
      '    TB_BUH_DOP_PODR.SHIFRPOD,'
      '    TB_BUH_DOP_PODR.ShifrBUH'
      'FROM'
      '    TB_BUH_DOP_PODR TB_BUH_DOP_PODR'
      'WHERE TB_BUH_DOP_PODR.SHIFRBUH=:MAS_SHIFRWRK')
    OnCalcFields = pFIBDataSetDopCalcFields
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    DataSource = DataSourceSal
    Left = 364
    Top = 183
    object pFIBDataSetDopSHIFRPOD: TFIBIntegerField
      FieldName = 'SHIFRPOD'
    end
    object pFIBDataSetDopSHIFRBUH: TFIBIntegerField
      FieldName = 'SHIFRBUH'
    end
    object pFIBDataSetDopNAMEPOD: TStringField
      FieldKind = fkLookup
      FieldName = 'NAMEPOD'
      LookupDataSet = pFIBDataSetSelPodr
      LookupKeyFields = 'SHIFRPOD'
      LookupResultField = 'NAME'
      KeyFields = 'SHIFRPOD'
      Size = 150
      Lookup = True
    end
    object pFIBDataSetDopShifrIdDop: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ShifrIdDop'
      Calculated = True
    end
  end
  object DataSourceDop: TDataSource
    DataSet = pFIBDataSetDop
    Left = 412
    Top = 183
  end
end
