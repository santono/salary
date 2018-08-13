object FormEditShifr: TFormEditShifr
  Left = 227
  Top = 161
  Width = 696
  Height = 500
  Caption = #1057#1090#1072#1090#1100#1080' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1081
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
    680
    462)
  PixelsPerInch = 96
  TextHeight = 20
  object PageControlShifr: TPageControl
    Left = 8
    Top = 0
    Width = 673
    Height = 417
    ActivePage = TabSheetAdd
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabSheetAdd: TTabSheet
      Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103
      DesignSize = (
        665
        382)
      object dxDBGridAdd: TdxDBGrid
        Left = 0
        Top = 0
        Width = 665
        Height = 361
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFR'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceAdd
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridAddSHIFR: TdxDBGridMaskColumn
          Caption = #1064#1092#1088
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFR'
        end
        object dxDBGridAddNAME: TdxDBGridMaskColumn
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          HeaderAlignment = taCenter
          Sorted = csUp
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAME'
        end
        object dxDBGridAddSHORTNAME: TdxDBGridMaskColumn
          Caption = #1050#1088#1072#1090#1082#1086#1077' '#1085#1072#1079#1074
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHORTNAME'
        end
        object dxDBGridAddPODOH: TdxDBGridCheckColumn
          Caption = #1055#1086#1076
          MinWidth = 20
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PODOH'
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dxDBGridAddPENS: TdxDBGridCheckColumn
          Caption = #1055#1077#1085#1089
          MinWidth = 20
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PENS'
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dxDBGridAddSS: TdxDBGridCheckColumn
          Caption = #1057' '#1057
          MinWidth = 20
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SS'
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dxDBGridAddFONDZ: TdxDBGridCheckColumn
          Caption = #1060#1047
          MinWidth = 20
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'FONDZ'
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dxDBGridAddBOLN: TdxDBGridCheckColumn
          Caption = #1041#1086#1083#1085
          MinWidth = 20
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'BOLN'
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dxDBGridAddOTP: TdxDBGridCheckColumn
          Caption = #1054#1090#1087
          MinWidth = 20
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'OTP'
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dxDBGridAddPROF: TdxDBGridCheckColumn
          Caption = #1055#1088#1086#1092
          MinWidth = 20
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PROF'
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dxDBGridAddALIM: TdxDBGridCheckColumn
          Caption = #1040#1083#1080#1084
          MinWidth = 20
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'ALIM'
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dxDBGridAddInd: TdxDBGridCheckColumn
          Caption = #1048#1085#1076
          HeaderAlignment = taCenter
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'IND'
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dxDBGridAddDekr: TdxDBGridCheckColumn
          Caption = #1044#1082#1088
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DEKR'
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dxDBGridAddKomand: TdxDBGridCheckColumn
          Caption = #1050#1084#1076
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'KOMAND'
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dxDBGridAddECB: TdxDBGridCheckColumn
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'ECB'
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dxDBGridAddECB_INV: TdxDBGridCheckColumn
          Caption = 'ECB'#1048#1085#1074
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'ECB_INV'
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dxDBGridAddECB_ILL: TdxDBGridCheckColumn
          Caption = 'ECB'#1041#1083#1085
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'ECB_ILL'
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dxDBGridAddWS: TdxDBGridCheckColumn
          Caption = #1042#1089
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'WS'
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dxDBGridAddOTP_25_07_2016: TdxDBGridCheckColumn
          Caption = #1054#1087#1090'2'
          HeaderAlignment = taCenter
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'OTP_25_07_2016'
          ValueChecked = '1'
          ValueGrayed = '0'
          ValueUnchecked = '0'
        end
      end
      object DBNavigatorAdd: TDBNavigator
        Left = 8
        Top = 360
        Width = 240
        Height = 25
        DataSource = DataSourceAdd
        Anchors = [akLeft, akBottom]
        TabOrder = 1
        OnClick = DBNavigatorAddClick
      end
    end
    object TabSheetUd: TTabSheet
      Caption = #1059#1076#1077#1088#1078#1072#1085#1080#1103
      ImageIndex = 1
      DesignSize = (
        665
        382)
      object dxDBGridUd: TdxDBGrid
        Left = 0
        Top = 0
        Width = 657
        Height = 361
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFR'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = DataSourceUd
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridUdSHIFR: TdxDBGridMaskColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFR'
        end
        object dxDBGridUdNAME: TdxDBGridMaskColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAME'
        end
        object dxDBGridUdSHORTNAME: TdxDBGridMaskColumn
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHORTNAME'
        end
      end
      object DBNavigatorUd: TDBNavigator
        Left = 0
        Top = 360
        Width = 240
        Height = 25
        DataSource = DataSourceUd
        Anchors = [akLeft, akBottom]
        TabOrder = 1
        OnClick = DBNavigatorUdClick
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 568
    Top = 424
    Width = 107
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&'#1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
    Kind = bkClose
  end
  object pFIBDataSetAdd: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SHIFR'
      'SET '
      '    SHIFR  = :SHIFR,'
      '    NAME   = :NAME,'
      '    SHORTNAME = :SHORTNAME,'
      '    NAMEFORSWOD = :NAMEFORSWOD,'
      '    PODOH  = :PODOH,'
      '    PENS   = :PENS,'
      '    SS     = :SS,'
      '    FONDZ  = :FONDZ,'
      '    BOLN   = :BOLN,'
      '    OTP    = :OTP,'
      '    PROF   = :PROF,'
      '    ALIM   = :ALIM,'
      '    IND    = :IND,'
      '    DEKR   = :DEKR,'
      '    KOMAND = :KOMAND,'
      '    ECB    = :ECB,'
      '    ECB_INV= :ECB_INV,'
      '    ECB_ILL= :ECB_ILL,'
      '    WS     = :WS,'
      '    OTP_25_07_2016=:OTP_25_07_2016'
      ''
      'WHERE'
      '    SHIFR = :OLD_SHIFR'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    SHIFR'
      'WHERE'
      '        SHIFR = :OLD_SHIFR'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO SHIFR('
      '    SHIFR,'
      '    NAME,'
      '    SHORTNAME,'
      '    NAMEFORSWOD,'
      '    PODOH,'
      '    PENS,'
      '    SS,'
      '    FONDZ,'
      '    BOLN,'
      '    OTP,'
      '    PROF,'
      '    ALIM,'
      '    IND,'
      '    DEKR,'
      '    KOMAND,'
      '    ECB,'
      '    ECB_INV,'
      '    ECB_ILL,'
      '    MODE,'
      '    WS,'
      '    OTP_25_07_2016'
      ')'
      'VALUES('
      '    :SHIFR,'
      '    :NAME,'
      '    :SHORTNAME,'
      '    :NAMEFORSWOD,'
      '    :PODOH,'
      '    :PENS,'
      '    :SS,'
      '    :FONDZ,'
      '    :BOLN,'
      '    :OTP,'
      '    :PROF,'
      '    :ALIM,'
      '    :IND,'
      '    :DEKR,'
      '    :KOMAND,'
      '    :ECB,'
      '    :ECB_INV,'
      '    :ECB_ILL,'
      '    1,'
      '    :WS,'
      '    :OTP_25_07_2016  '
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    SHI.SHIFR,'
      '    SHI.NAME,'
      '    SHI.SHORTNAME,'
      '    SHI.NAMEFORSWOD,'
      '    SHI.PODOH,'
      '    SHI.PENS,'
      '    SHI.SS,'
      '    SHI.FONDZ,'
      '    SHI.BOLN,'
      '    SHI.OTP,'
      '    SHI.PROF,'
      '    SHI.ALIM,'
      '    SHI.IND,'
      '    SHI.DEKR,'
      '    SHI.KOMAND,'
      '    SHI.ECB,'
      '    SHI.ECB_INV,'
      '    SHI.ECB_ILL,'
      '    SHI.WS,'
      '    SHI.OTP_25_07_2016'
      'FROM'
      '    SHIFR SHI'
      'WHERE(  SHI.MODE>0'
      '     ) and (     SHI.SHIFR = :OLD_SHIFR'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT'
      '    SHI.SHIFR,'
      '    SHI.NAME,'
      '    SHI.SHORTNAME,'
      '    SHI.NAMEFORSWOD,'
      '    SHI.PODOH,'
      '    SHI.PENS,'
      '    SHI.SS,'
      '    SHI.FONDZ,'
      '    SHI.BOLN,'
      '    SHI.OTP,'
      '    SHI.PROF,'
      '    SHI.ALIM,'
      '    SHI.IND,'
      '    SHI.DEKR,'
      '    SHI.KOMAND,'
      '    SHI.ECB,'
      '    SHI.ECB_INV,'
      '    SHI.ECB_ILL,'
      '    SHI.MODE,'
      '    SHI.WS,'
      '    SHI.OTP_25_07_2016'
      'FROM'
      '    SHIFR SHI'
      'WHERE SHI.MODE>0'
      'order by shi.shifr')
    Transaction = trAddRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = trAddWrite
    AutoCommit = True
    Left = 20
    Top = 31
    object pFIBDataSetAddSHIFR: TFIBIntegerField
      FieldName = 'SHIFR'
      Origin = 'SHIFR.SHIFR'
    end
    object pFIBDataSetAddNAME: TFIBStringField
      FieldName = 'NAME'
      Origin = 'SHIFR.NAME'
      Size = 52
      EmptyStrToNull = True
    end
    object pFIBDataSetAddSHORTNAME: TFIBStringField
      FieldName = 'SHORTNAME'
      Origin = 'SHIFR.SHORTNAME'
      EmptyStrToNull = True
    end
    object pFIBDataSetAddPODOH: TFIBSmallIntField
      FieldName = 'PODOH'
      Origin = 'SHIFR.PODOH'
    end
    object pFIBDataSetAddPENS: TFIBSmallIntField
      FieldName = 'PENS'
      Origin = 'SHIFR.PENS'
    end
    object pFIBDataSetAddSS: TFIBSmallIntField
      FieldName = 'SS'
      Origin = 'SHIFR.SS'
    end
    object pFIBDataSetAddFONDZ: TFIBSmallIntField
      FieldName = 'FONDZ'
      Origin = 'SHIFR.FONDZ'
    end
    object pFIBDataSetAddBOLN: TFIBSmallIntField
      FieldName = 'BOLN'
      Origin = 'SHIFR.BOLN'
    end
    object pFIBDataSetAddOTP: TFIBSmallIntField
      FieldName = 'OTP'
      Origin = 'SHIFR.OTP'
    end
    object pFIBDataSetAddPROF: TFIBSmallIntField
      FieldName = 'PROF'
      Origin = 'SHIFR.PROF'
    end
    object pFIBDataSetAddALIM: TFIBSmallIntField
      FieldName = 'ALIM'
      Origin = 'SHIFR.ALIM'
    end
    object pFIBDataSetAddIND: TFIBSmallIntField
      FieldName = 'IND'
    end
    object pFIBDataSetAddDEKR: TFIBSmallIntField
      FieldName = 'DEKR'
    end
    object pFIBDataSetAddKOMAND: TFIBSmallIntField
      FieldName = 'KOMAND'
    end
    object pFIBDataSetAddECB: TFIBSmallIntField
      FieldName = 'ECB'
    end
    object pFIBDataSetAddECB_INV: TFIBSmallIntField
      FieldName = 'ECB_INV'
    end
    object pFIBDataSetAddECB_ILL: TFIBSmallIntField
      FieldName = 'ECB_ILL'
    end
    object pFIBDataSetAddNAMEFORSWOD: TFIBStringField
      DisplayLabel = #1044#1083#1103' '#1089#1074#1086#1076#1072
      FieldName = 'NAMEFORSWOD'
      Size = 15
      EmptyStrToNull = True
    end
    object pFIBDataSetAddWS: TFIBSmallIntField
      FieldName = 'WS'
    end
    object pFIBDataSetAddOTP_25_07_2016: TFIBSmallIntField
      FieldName = 'OTP_25_07_2016'
    end
  end
  object DataSourceAdd: TDataSource
    DataSet = pFIBDataSetAdd
    Left = 148
    Top = 31
  end
  object pFIBDataSetUd: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SHIFR'
      'SET '
      '    SHIFR = :SHIFR,'
      '    NAME = :NAME,'
      '    SHORTNAME = :SHORTNAME,'
      '    NAMEFORSWOD = :NAMEFORSWOD'
      'WHERE'
      '    SHIFR = :OLD_SHIFR'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    SHIFR'
      'WHERE'
      '        SHIFR = :OLD_SHIFR'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO SHIFR('
      '    SHIFR,'
      '    NAME,'
      '    SHORTNAME,'
      '    NAMEFORSWOD,'
      '    Mode '
      ')'
      'VALUES('
      '    :SHIFR,'
      '    :NAME,'
      '    :SHORTNAME,'
      '    :NAMEFORSWOD,'
      '    0'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    SHI.SHIFR,'
      '    SHI.NAME,'
      '    SHI.SHORTNAME,'
      '    SHI.NAMEFORSWOD,'
      '    SHI.PODOH,'
      '    SHI.PENS,'
      '    SHI.SS,'
      '    SHI.FONDZ,'
      '    SHI.BOLN,'
      '    SHI.OTP,'
      '    SHI.PROF,'
      '    SHI.ALIM'
      'FROM'
      '    SHIFR SHI'
      'where( '
      '    SHI.MODE=0'
      '     ) and (     SHI.SHIFR = :OLD_SHIFR'
      '     )'
      '    '
      '')
    SelectSQL.Strings = (
      'SELECT'
      '    SHI.SHIFR,'
      '    SHI.NAME,'
      '    SHI.SHORTNAME,'
      '    SHI.NAMEFORSWOD'
      'FROM'
      '    SHIFR SHI'
      'where'
      '    SHI.MODE=0'
      'order by SHI.shifr'
      '    '
      '')
    Transaction = trUdRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = trUdWrite
    AutoCommit = True
    DataSource = DataSourceAdd
    Left = 524
    Top = 31
    object pFIBDataSetUdSHIFR: TFIBIntegerField
      DisplayLabel = #1064#1080#1092#1088
      FieldName = 'SHIFR'
      Origin = 'SHIFR.SHIFR'
    end
    object pFIBDataSetUdNAME: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Origin = 'SHIFR.NAME'
      Size = 52
      EmptyStrToNull = True
    end
    object pFIBDataSetUdSHORTNAME: TFIBStringField
      DisplayLabel = #1050#1088#1072#1090#1082'. '#1085#1072#1079#1074'.'
      FieldName = 'SHORTNAME'
      Origin = 'SHIFR.SHORTNAME'
      EmptyStrToNull = True
    end
    object pFIBDataSetUdNAMEFORSWOD: TFIBStringField
      DisplayLabel = #1044#1083#1103' '#1089#1074#1086#1076#1072
      FieldName = 'NAMEFORSWOD'
      Size = 15
      EmptyStrToNull = True
    end
  end
  object DataSourceUd: TDataSource
    DataSet = pFIBDataSetUd
    Left = 644
    Top = 31
  end
  object trAddWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 52
    Top = 31
  end
  object trAddRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 100
    Top = 31
  end
  object trUdWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 556
    Top = 31
  end
  object trUdRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 604
    Top = 31
  end
end
