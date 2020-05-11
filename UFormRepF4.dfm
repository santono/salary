object FormRepF4: TFormRepF4
  Left = 270
  Top = 168
  Width = 657
  Height = 331
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
  object cbNRC: TCheckBox
    Left = 40
    Top = 104
    Width = 241
    Height = 17
    Caption = #1053#1077#1087#1086#1074#1085#1080#1081' '#1088#1086#1073#1086#1095#1080#1081' '#1095#1072#1089
    TabOrder = 4
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
      
        '       substr(coalesce(pr.kodkp,'#39#39')||'#39'         '#39',1,6) kodkp,subs' +
        'tr(coalesce(pr.kodzkpptr,'#39#39')||'#39'       '#39',1,5) kodzkpptr, coalesce' +
        '(pr.namedol,'#39#39') namedol, coalesce(pr.nameprof,'#39#39') nameprof,'
      '       coalesce(pr.idclassificator_old,0) idclassificator_old,'
      
        '       substr(coalesce(pr.kodkp_old,'#39' '#39')||'#39'         '#39',1,6) kodkp' +
        '_old,substr(coalesce(pr.kodzkpptr_old,'#39' '#39')||'#39'        '#39',1,5) kodz' +
        'kpptr_old, coalesce(pr.namedol_old,'#39' '#39') namedol_old, coalesce(pr' +
        '.nameprof_old,'#39' '#39') nameprof_old,'
      '       databeg,dataend'
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
    object dsPerevodyIDCLASSIFICATOR_OLD: TFIBIntegerField
      FieldName = 'IDCLASSIFICATOR_OLD'
    end
    object dsPerevodyKODKP_OLD: TFIBStringField
      FieldName = 'KODKP_OLD'
      Size = 80
      EmptyStrToNull = True
    end
    object dsPerevodyKODZKPPTR_OLD: TFIBStringField
      FieldName = 'KODZKPPTR_OLD'
      Size = 80
      EmptyStrToNull = True
    end
    object dsPerevodyNAMEDOL_OLD: TFIBStringField
      FieldName = 'NAMEDOL_OLD'
      Size = 512
      EmptyStrToNull = True
    end
    object dsPerevodyNAMEPROF_OLD: TFIBStringField
      FieldName = 'NAMEPROF_OLD'
      Size = 512
      EmptyStrToNull = True
    end
    object dsPerevodyDATABEG: TFIBDateField
      FieldName = 'DATABEG'
    end
    object dsPerevodyDATAEND: TFIBDateField
      FieldName = 'DATAEND'
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
      
        'select b.tabno,b.fio,b.inn,b.date_fr,b.date_to,coalesce(b.kind,4' +
        ') kind from tb_dekr_ecb b'
      '       join kadry k on b.tabno=k.tabno'
      '       where'
      '        not ( b.date_fr > cast((:y1||'#39'-'#39'||:m1||'#39'-28'#39') as date)'
      '              or'
      '              b.date_to < cast((:y2||'#39'-'#39'||:m2||'#39'-01'#39') as date)'
      '            )'
      '--        and exists ('
      '--        select first 1 * from person fa '
      '--               where fa.tabno=b.tabno'
      '--                 and fa.shifrkat=1'
      '--        )')
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    Left = 352
    Top = 56
    object dsDekr6TABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object dsDekr6FIO: TFIBStringField
      FieldName = 'FIO'
      Size = 51
      EmptyStrToNull = True
    end
    object dsDekr6INN: TFIBStringField
      FieldName = 'INN'
      Size = 10
      EmptyStrToNull = True
    end
    object dsDekr6DATE_FR: TFIBDateField
      FieldName = 'DATE_FR'
    end
    object dsDekr6DATE_TO: TFIBDateField
      FieldName = 'DATE_TO'
    end
    object dsDekr6KIND: TFIBIntegerField
      FieldName = 'KIND'
    end
  end
  object dsSowm: TpFIBDataSet
    SelectSQL.Strings = (
      'select kk.tabno'
      '       ,kk.fio'
      '       ,kk.nal_code'
      '       ,kk.data_pri'
      '       ,kk.data_uw'
      '       ,kk.code_uwol'
      
        '       ,pr.nomerprik,pr.dataprik,coalesce(pr.idclassificator,0) ' +
        'idclassificator'
      
        '       ,substr(pr.kodkp,1,6) kodkp,substr(pr.kodzkpptr,1,5) kodz' +
        'kpptr, coalesce(pr.namedol,'#39#39') namedol, coalesce(pr.nameprof,'#39#39')' +
        ' nameprof'
      '       ,pr.databeg'
      '       ,pr.dataend'
      '       from kadry kk'
      '            join tb_prikazy pr on kk.tabno=pr.tabno'
      '       where pr.y=:y'
      '         and pr.m=:m'
      '         and not pr.content is null'
      '         and (upper(pr.content) like '#39'%'#1057#1059#1052#1030#1057'%'#39')'
      '         and (upper(pr.content) like '#39'%'#1055#1056#1048#1049#1053#1071#1058#1048'%'#39')')
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    Left = 384
    Top = 56
    object dsSowmTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object dsSowmFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 51
      EmptyStrToNull = True
    end
    object dsSowmNAL_CODE: TFIBStringField
      FieldName = 'NAL_CODE'
      Size = 10
      EmptyStrToNull = True
    end
    object dsSowmDATA_PRI: TFIBDateField
      FieldName = 'DATA_PRI'
    end
    object dsSowmDATA_UW: TFIBDateField
      FieldName = 'DATA_UW'
    end
    object dsSowmCODE_UWOL: TFIBSmallIntField
      FieldName = 'CODE_UWOL'
    end
    object dsSowmNOMERPRIK: TFIBStringField
      FieldName = 'NOMERPRIK'
      Size = 15
      EmptyStrToNull = True
    end
    object dsSowmDATAPRIK: TFIBDateField
      FieldName = 'DATAPRIK'
    end
    object dsSowmIDCLASSIFICATOR: TFIBIntegerField
      FieldName = 'IDCLASSIFICATOR'
    end
    object dsSowmKODKP: TFIBStringField
      FieldName = 'KODKP'
      Size = 80
      EmptyStrToNull = True
    end
    object dsSowmKODZKPPTR: TFIBStringField
      FieldName = 'KODZKPPTR'
      Size = 80
      EmptyStrToNull = True
    end
    object dsSowmNAMEDOL: TFIBStringField
      FieldName = 'NAMEDOL'
      Size = 512
      EmptyStrToNull = True
    end
    object dsSowmNAMEPROF: TFIBStringField
      FieldName = 'NAMEPROF'
      Size = 512
      EmptyStrToNull = True
    end
    object dsSowmDATABEG: TFIBDateField
      FieldName = 'DATABEG'
    end
    object dsSowmDATAEND: TFIBDateField
      FieldName = 'DATAEND'
    end
  end
  object dsPriUwPrik: TpFIBDataSet
    SelectSQL.Strings = (
      'select pr.tabno'
      '     , pr.databeg'
      '     , pr.dataend'
      '     , pr.shifridtyp'
      '     , pr.dataprik'
      '     , pr.nomerprik'
      '     , pr.fio'
      '     , pr.kodzkpptr'
      '     , pr.kodkp'
      '     , pr.namedol'
      '     , pr.nameprof'
      '     , pr.id'
      '     from tb_prikazy pr'
      'where '
      '     ('
      '    (extract(year from pr.dataprik)=:y'
      'and extract(month from pr.dataprik)=:m)'
      '    or ((not pr.databeg is null and'
      '    extract(year from pr.dataprik)=:y'
      'and extract(month from pr.dataprik)=:m'
      '    and pr.shifridtyp=13'
      '    )'
      '    )'
      '    )'
      '     and pr.shifridtyp in (5,13)')
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    Left = 296
    Top = 96
    object dsPriUwPrikTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object dsPriUwPrikDATABEG: TFIBDateField
      FieldName = 'DATABEG'
    end
    object dsPriUwPrikDATAEND: TFIBDateField
      FieldName = 'DATAEND'
    end
    object dsPriUwPrikSHIFRIDTYP: TFIBIntegerField
      FieldName = 'SHIFRIDTYP'
    end
    object dsPriUwPrikDATAPRIK: TFIBDateField
      FieldName = 'DATAPRIK'
    end
    object dsPriUwPrikNOMERPRIK: TFIBStringField
      FieldName = 'NOMERPRIK'
      Size = 15
      EmptyStrToNull = True
    end
    object dsPriUwPrikFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 50
      EmptyStrToNull = True
    end
    object dsPriUwPrikKODZKPPTR: TFIBStringField
      FieldName = 'KODZKPPTR'
      Size = 10
      EmptyStrToNull = True
    end
    object dsPriUwPrikKODKP: TFIBStringField
      FieldName = 'KODKP'
      Size = 10
      EmptyStrToNull = True
    end
    object dsPriUwPrikNAMEDOL: TFIBStringField
      FieldName = 'NAMEDOL'
      Size = 512
      EmptyStrToNull = True
    end
    object dsPriUwPrikNAMEPROF: TFIBStringField
      FieldName = 'NAMEPROF'
      Size = 512
      EmptyStrToNull = True
    end
    object dsPriUwPrikID: TFIBIntegerField
      FieldName = 'ID'
    end
  end
  object pQDekr6: TpFIBQuery
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    SQL.Strings = (
      
        'select b.tabno,b.fio,b.inn,b.date_fr,b.date_to,coalesce(b.kind,4' +
        ') kind from tb_dekr_ecb b join kadry k on b.tabno=k.tabno where ' +
        'not ( b.date_fr > cast((2020||'#39'-'#39'||4||'#39'-28'#39') as date) or b.date_' +
        'to < cast((2020||'#39'-'#39'||4||'#39'-01'#39') as date) ) and exists ( select f' +
        'irst 1 * from person fa where fa.tabno=b.tabno and fa.shifrkat=1' +
        ' )')
    Left = 336
    Top = 96
  end
end
