object FormOtp: TFormOtp
  Left = 240
  Top = 125
  Width = 696
  Height = 581
  Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077
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
    543)
  PixelsPerInch = 96
  TextHeight = 20
  object DateTimePicker1: TDateTimePicker
    Left = 16
    Top = 8
    Width = 186
    Height = 28
    Date = 38669.961580578700000000
    Time = 38669.961580578700000000
    DateFormat = dfLong
    TabOrder = 0
    OnChange = DateTimePicker1Change
  end
  object dxDBGridOtp: TdxDBGrid
    Left = 8
    Top = 40
    Width = 673
    Height = 465
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    ShowSummaryFooter = True
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 1
    OnKeyDown = dxDBGridOtpKeyDown
    OnKeyPress = dxDBGridOtpKeyPress
    DataSource = DataSourceOtp
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    OnCustomDrawCell = dxDBGridOtpCustomDrawCell
    OnDeletion = dxDBGridOtpDeletion
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridOtpTABNO: TdxDBGridColumn
      Caption = #1058'.'#1085'.'
      HeaderAlignment = taCenter
      Width = 35
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
    end
    object dxDBGridOtpFIO: TdxDBGridColumn
      Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048' '#1054
      HeaderAlignment = taCenter
      Width = 151
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
    object dxDBGridOtpColumnDolg: TdxDBGridColumn
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      HeaderAlignment = taCenter
      Width = 151
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DOLG'
      SummaryFooterType = cstCount
    end
    object dxDBGridOtpF_DATA: TdxDBGridColumn
      Caption = #1057
      HeaderAlignment = taCenter
      Width = 51
      BandIndex = 0
      RowIndex = 0
      FieldName = 'F_DATA'
    end
    object dxDBGridOtpL_DATA: TdxDBGridColumn
      Caption = #1055#1086
      HeaderAlignment = taCenter
      Width = 51
      BandIndex = 0
      RowIndex = 0
      FieldName = 'L_DATA'
    end
    object dxDBGridOtpSHIFRID: TdxDBGridMaskColumn
      Visible = False
      Width = 31
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGridOtpSHIFRKAT: TdxDBGridMaskColumn
      Visible = False
      Width = 31
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRKAT'
    end
    object dxDBGridOtpSHIFRGRU: TdxDBGridMaskColumn
      Visible = False
      Width = 31
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRGRU'
    end
    object dxDBGridOtpColumnSumma: TdxDBGridColumn
      Caption = #1057#1091#1084#1084#1072
      HeaderAlignment = taCenter
      Width = 75
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ITOGO_O'
      SummaryFooterType = cstSum
    end
    object dxDBGridOtpColumnSta: TdxDBGridColumn
      Visible = False
      Width = 33
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRSTA'
    end
    object dxDBGridOtpDataPere: TdxDBGridDateColumn
      Caption = #1055#1077#1088#1077#1085#1077#1089#1077#1085
      Width = 115
      BandIndex = 0
      RowIndex = 0
      OnCustomDrawCell = dxDBGridOtpDataPereCustomDrawCell
      FieldName = 'DATA_PERE'
    end
    object dxDBGridOtpMode: TdxDBGridColumn
      Visible = False
      Width = 43
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MODE'
    end
    object dxDBGridOtpMarked: TdxDBGridCheckColumn
      Caption = #1052#1088#1082
      Width = 40
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MARKED'
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dxDBGridOtpNameWR: TdxDBGridColumn
      Caption = #1042'.'#1088'.'
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAMEWR'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 512
    Width = 240
    Height = 25
    DataSource = DataSourceOtp
    Anchors = [akLeft, akBottom]
    TabOrder = 2
    OnClick = DBNavigator1Click
  end
  object pFIBDataSetOtp: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE OTPUSKA'
      'SET '
      '    TABNO    = :TABNO,'
      '    FIO      = :FIO,'
      '    DOLG     = :DOLG,'
      '    F_DATA   = :F_DATA,'
      '    L_DATA   = :L_DATA,'
      '    ITOGO_O  = :ITOGO_O,'
      '    SHIFRID  = :SHIFRID,'
      '    SHIFRKAT = :SHIFRKAT,'
      '    SHIFRGRU = :SHIFRGRU,'
      '    MARKED   = :MARKED'
      'WHERE'
      '    SHIFRID = :OLD_SHIFRID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    OTPUSKA'
      'WHERE'
      '        SHIFRID = :OLD_SHIFRID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO OTPUSKA('
      '    TABNO,'
      '    FIO,'
      '    DOLG,'
      '    F_DATA,'
      '    L_DATA,'
      '    ITOGO_O,'
      '    SHIFRID,'
      '    SHIFRKAT,'
      '    SHIFRGRU,'
      '    MARKED'
      ')'
      'VALUES('
      '    :TABNO,'
      '    :FIO,'
      '    :DOLG,'
      '    :F_DATA,'
      '    :L_DATA,'
      '    :ITOGO_O,'
      '    :SHIFRID,'
      '    :SHIFRKAT,'
      '    :SHIFRGRU,'
      '    :MARKED'
      ')')
    RefreshSQL.Strings = (
      
        'select tabno,fio,dolg,f_data,l_data,itogo_o,ShifrId,ShifrKat,Shi' +
        'frGru,MARKED from otpuska'
      'where(  Year_Vy=:WantedYear and Month_Vy=:WantedMonth'
      '     ) and (     OTPUSKA.SHIFRID = :OLD_SHIFRID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      
        'select tabno,fio,dolg,f_data,l_data,itogo_o,ShifrId,ShifrKat,Shi' +
        'frGru,Razrijad,ITOGO_O_DAY,itogo_o,ShifrId,ShifrKat,ShifrGru,Raz' +
        'rijad,DATA_PERE,mean_day_bud,mean_day_vne,mean_day_gn,mean_day_n' +
        'is,ShifrSta,Mode,Marked,Mode_Day_CLock,'
      'kind_otp, '
      
        '(select first 1 name from tb_kindsotp where tb_kindsotp.shifrkin' +
        'd=kind_otp) as namekindotp,'
      ' nomer_pri,data_pri,period_pri,0 as modeWR,'#39#39' as GUID'
      ' from otpuska'
      'where Year_Vy=:WantedYear and Month_Vy=:WantedMonth'
      'order by fio')
    AfterDelete = pFIBDataSetOtpAfterDelete
    BeforeDelete = pFIBDataSetOtpBeforeDelete
    OnCalcFields = pFIBDataSetOtpCalcFields
    Transaction = FIB.pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = FIB.pFIBTransactionSAL
    AutoCommit = True
    Left = 32
    Top = 120
    object pFIBDataSetOtpTABNO: TFIBSmallIntField
      FieldName = 'TABNO'
      Origin = 'OTPUSKA.TABNO'
    end
    object pFIBDataSetOtpFIO: TFIBStringField
      FieldName = 'FIO'
      Origin = 'OTPUSKA.FIO'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBDataSetOtpF_DATA: TFIBDateField
      FieldName = 'F_DATA'
      Origin = 'OTPUSKA.F_DATA'
    end
    object pFIBDataSetOtpL_DATA: TFIBDateField
      FieldName = 'L_DATA'
      Origin = 'OTPUSKA.L_DATA'
    end
    object pFIBDataSetOtpSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object pFIBDataSetOtpSHIFRKAT: TFIBSmallIntField
      FieldName = 'SHIFRKAT'
    end
    object pFIBDataSetOtpSHIFRGRU: TFIBSmallIntField
      FieldName = 'SHIFRGRU'
    end
    object pFIBDataSetOtpDOLG: TFIBStringField
      FieldName = 'DOLG'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSetOtpITOGO_O: TFIBBCDField
      FieldName = 'ITOGO_O'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetOtpRAZRIJAD: TFIBSmallIntField
      FieldName = 'RAZRIJAD'
    end
    object pFIBDataSetOtpITOGO_O_DAY: TFIBSmallIntField
      FieldName = 'ITOGO_O_DAY'
    end
    object pFIBDataSetOtpITOGO_O1: TFIBBCDField
      FieldName = 'ITOGO_O1'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetOtpSHIFRID1: TFIBIntegerField
      FieldName = 'SHIFRID1'
    end
    object pFIBDataSetOtpSHIFRKAT1: TFIBSmallIntField
      FieldName = 'SHIFRKAT1'
    end
    object pFIBDataSetOtpSHIFRGRU1: TFIBSmallIntField
      FieldName = 'SHIFRGRU1'
    end
    object pFIBDataSetOtpRAZRIJAD1: TFIBSmallIntField
      FieldName = 'RAZRIJAD1'
    end
    object pFIBDataSetOtpDATA_PERE: TFIBDateTimeField
      FieldName = 'DATA_PERE'
    end
    object pFIBDataSetOtpMEAN_DAY_BUD: TFIBBCDField
      FieldName = 'MEAN_DAY_BUD'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetOtpMEAN_DAY_VNE: TFIBBCDField
      FieldName = 'MEAN_DAY_VNE'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetOtpMEAN_DAY_GN: TFIBBCDField
      FieldName = 'MEAN_DAY_GN'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetOtpMEAN_DAY_NIS: TFIBBCDField
      FieldName = 'MEAN_DAY_NIS'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetOtpSHIFRSTA: TFIBSmallIntField
      FieldName = 'SHIFRSTA'
    end
    object pFIBDataSetOtpMODE: TFIBSmallIntField
      FieldName = 'MODE'
    end
    object pFIBDataSetOtpMARKED: TFIBSmallIntField
      FieldName = 'MARKED'
    end
    object pFIBDataSetOtpMODE_DAY_CLOCK: TFIBSmallIntField
      FieldName = 'MODE_DAY_CLOCK'
    end
    object pFIBDataSetOtpKIND_OTP: TFIBSmallIntField
      FieldName = 'KIND_OTP'
    end
    object pFIBDataSetOtpNAMEKINDOTP: TFIBStringField
      FieldName = 'NAMEKINDOTP'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBDataSetOtpNOMER_PRI: TFIBStringField
      FieldName = 'NOMER_PRI'
      Size = 15
      EmptyStrToNull = True
    end
    object pFIBDataSetOtpDATA_PRI: TFIBDateField
      FieldName = 'DATA_PRI'
    end
    object pFIBDataSetOtpPERIOD_PRI: TFIBStringField
      FieldName = 'PERIOD_PRI'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSetOtpMODEWR: TFIBIntegerField
      FieldName = 'MODEWR'
    end
    object pFIBDataSetOtpNAMEWR: TStringField
      FieldKind = fkCalculated
      FieldName = 'NAMEWR'
      Size = 7
      Calculated = True
    end
    object pFIBDataSetOtpGUID: TFIBStringField
      FieldName = 'GUID'
      Size = 0
      EmptyStrToNull = True
    end
  end
  object DataSourceOtp: TDataSource
    DataSet = pFIBDataSetOtp
    Left = 16
    Top = 72
  end
end
