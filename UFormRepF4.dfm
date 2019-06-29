object FormRepF4: TFormRepF4
  Left = 276
  Top = 349
  Width = 657
  Height = 283
  Caption = #1057#1074#1086#1076' '#1087#1086' '#1045#1057#1042
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 20
  object Label2: TLabel
    Left = 16
    Top = 32
    Width = 11
    Height = 20
    Caption = #1042
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 64
    Width = 185
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1086#1090#1095#1077#1090
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 528
    Top = 64
    Width = 91
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object dtIn: TDateTimePicker
    Left = 32
    Top = 24
    Width = 186
    Height = 28
    Date = 42103.810000277780000000
    Time = 42103.810000277780000000
    DateFormat = dfLong
    TabOrder = 2
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 152
    Width = 609
    Height = 17
    TabOrder = 3
  end
  object dsMinSal: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    ID,'
      '    Y,'
      '    M,'
      '    TABNO,'
      '    YEAR_ZA,'
      '    MONTH_ZA,'
      '    SUMMA,'
      '    SUMMA_DB,'
      '    SUMMA_RAZN,'
      '    WORKDAY,'
      '    KOEF,'
      '    FIO,'
      '    NEED_NOT'
      'FROM'
      ' TB_SV_LESS_MIN_ZP'
      ' where y=:y and m=:m and need_not=0')
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    Left = 232
    Top = 24
    object dsMinSalID: TFIBIntegerField
      FieldName = 'ID'
    end
    object dsMinSalY: TFIBIntegerField
      FieldName = 'Y'
    end
    object dsMinSalM: TFIBIntegerField
      FieldName = 'M'
    end
    object dsMinSalTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object dsMinSalYEAR_ZA: TFIBIntegerField
      FieldName = 'YEAR_ZA'
    end
    object dsMinSalMONTH_ZA: TFIBIntegerField
      FieldName = 'MONTH_ZA'
    end
    object dsMinSalSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object dsMinSalSUMMA_DB: TFIBBCDField
      FieldName = 'SUMMA_DB'
      Size = 2
      RoundByScale = True
    end
    object dsMinSalSUMMA_RAZN: TFIBBCDField
      FieldName = 'SUMMA_RAZN'
      Size = 2
      RoundByScale = True
    end
    object dsMinSalWORKDAY: TFIBIntegerField
      FieldName = 'WORKDAY'
    end
    object dsMinSalKOEF: TFIBBCDField
      FieldName = 'KOEF'
      Size = 2
      RoundByScale = True
    end
    object dsMinSalFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 50
      EmptyStrToNull = True
    end
    object dsMinSalNEED_NOT: TFIBSmallIntField
      FieldName = 'NEED_NOT'
    end
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 272
    Top = 24
  end
  object dsoMinSal: TDataSource
    DataSet = dsMinSal
    Left = 312
    Top = 24
  end
  object dsPrinjatUwolen: TpFIBDataSet
    SelectSQL.Strings = (
      'select tabno'
      '     , data_pri'
      '     , data_uw'
      '     , code_uwol '
      ' from kadry'
      'where '
      '    (extract(year from kadry.data_pri)=:y1 '
      'and extract(month from kadry.data_pri)=:m1) '
      '    or'
      '    (extract(year from kadry.data_uw)=:y2 '
      ' and extract(month from kadry.data_uw)=:m2)')
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    Left = 232
    Top = 56
    object dsPrinjatUwolenTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object dsPrinjatUwolenDATA_PRI: TFIBDateField
      FieldName = 'DATA_PRI'
    end
    object dsPrinjatUwolenDATA_UW: TFIBDateField
      FieldName = 'DATA_UW'
    end
    object dsPrinjatUwolenCODE_UWOL: TFIBSmallIntField
      FieldName = 'CODE_UWOL'
    end
  end
  object dsPerevody: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select kk.tabno, kk.fio, kk.nal_code,kk.data_pri,kk.data_uw,kk.c' +
        'ode_uwol,'
      
        '       pr.nomerprik,pr.dataprik,coalesce(pr.idclassificator,0) i' +
        'dclassificator,'
      
        '       substr(pr.kodkp,1,6) kodkp,substr(pr.kodzkpptr,1,5) kodzk' +
        'pptr, coalesce(pr.namedol,'#39#39') namedol, coalesce(pr.nameprof,'#39#39') ' +
        'nameprof'
      '       from kadry kk'
      '            join tb_prikazy pr on kk.tabno=pr.tabno'
      '       where pr.y=:y'
      '         and pr.m=:m'
      '         and pr.shifridtyp=7')
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    Left = 272
    Top = 56
    object dsPerevodyTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object dsPerevodyFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 51
      EmptyStrToNull = True
    end
    object dsPerevodyNAL_CODE: TFIBStringField
      FieldName = 'NAL_CODE'
      Size = 10
      EmptyStrToNull = True
    end
    object dsPerevodyDATA_PRI: TFIBDateField
      FieldName = 'DATA_PRI'
    end
    object dsPerevodyDATA_UW: TFIBDateField
      FieldName = 'DATA_UW'
    end
    object dsPerevodyCODE_UWOL: TFIBSmallIntField
      FieldName = 'CODE_UWOL'
    end
    object dsPerevodyNOMERPRIK: TFIBStringField
      FieldName = 'NOMERPRIK'
      Size = 15
      EmptyStrToNull = True
    end
    object dsPerevodyDATAPRIK: TFIBDateField
      FieldName = 'DATAPRIK'
    end
    object dsPerevodyIDCLASSIFICATOR: TFIBIntegerField
      FieldName = 'IDCLASSIFICATOR'
    end
    object dsPerevodyKODKP: TFIBStringField
      FieldName = 'KODKP'
      Size = 80
      EmptyStrToNull = True
    end
    object dsPerevodyKODZKPPTR: TFIBStringField
      FieldName = 'KODZKPPTR'
      Size = 80
      EmptyStrToNull = True
    end
    object dsPerevodyNAMEDOL: TFIBStringField
      FieldName = 'NAMEDOL'
      Size = 512
      EmptyStrToNull = True
    end
    object dsPerevodyNAMEPROF: TFIBStringField
      FieldName = 'NAMEPROF'
      Size = 512
      EmptyStrToNull = True
    end
  end
  object dsDekr: TpFIBDataSet
    SelectSQL.Strings = (
      
        '           select b.tabno tabno,b.fio fio,b.inn inn,b.date_fr f_' +
        'data,b.date_to l_data,coalesce(b.kind,4) modeill from tb_dekr_ec' +
        'b b'
      '                    join kadry k on b.tabno=k.tabno'
      '    --                where'
      '    --                    ('
      
        '    --                       ((extract(month from b.date_fr)=:m1' +
        ')'
      
        '    --                    and (extract(year from b.date_fr)=:y1)' +
        ')'
      '    --                       or'
      
        '    --                       ((extract(month from b.date_to)=:m2' +
        ')'
      
        '    --                    and (extract(year from b.date_to)=:y2)' +
        ')'
      '    --                    )')
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    Left = 312
    Top = 56
    object dsDekrTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object dsDekrF_DATA: TFIBDateField
      FieldName = 'F_DATA'
    end
    object dsDekrL_DATA: TFIBDateField
      FieldName = 'L_DATA'
    end
    object dsDekrMODEILL: TFIBIntegerField
      FieldName = 'MODEILL'
    end
    object dsDekrFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 51
      EmptyStrToNull = True
    end
    object dsDekrINN: TFIBStringField
      FieldName = 'INN'
      Size = 10
      EmptyStrToNull = True
    end
  end
  object dsDekr6: TpFIBDataSet
    SelectSQL.Strings = (
      
        '           select b.tabno,b.fio,b.inn,b.date_fr,b.date_to,coales' +
        'ce(b.kind,4) from tb_dekr_ecb b'
      '                    join kadry k on b.tabno=k.tabno'
      '                    where'
      
        '                        not ( b.date_fr > cast((:y1||'#39'-'#39'||:m1||'#39 +
        '-28'#39') as date)'
      '                              or'
      
        '                              b.date_to < cast((:y2||'#39'-'#39'||:m2||'#39 +
        '-01'#39') as date)'
      '                            )')
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    Left = 352
    Top = 56
  end
end
