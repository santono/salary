object FormRepPersDolgOsn: TFormRepPersDolgOsn
  Left = 253
  Top = 275
  Width = 657
  Height = 283
  Caption = #1057#1087#1080#1089#1086#1082' '#1088#1072#1073#1086#1090#1085#1080#1082#1086#1074' '#1087#1086' '#1086#1089#1085#1086#1074#1085#1086#1081' '#1076#1086#1083#1078#1085#1086#1089#1090#1080
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
  object rgSort: TRadioGroup
    Left = 232
    Top = 16
    Width = 361
    Height = 41
    Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
    Columns = 2
    Items.Strings = (
      #1087#1086' '#1072#1083#1092#1072#1074#1080#1090#1091
      #1087#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103#1084)
    TabOrder = 3
  end
  object dsoREP: TDataSource
    DataSet = pFIBdsRep
    Left = 296
    Top = 64
  end
  object pFIBdsRep: TpFIBDataSet
    SelectSQL.Strings = (
      'select k.tabno tabno,'
      ' k.fio fio,'
      ' p.dolg dolg,'
      ' p.w_place shifrpod,'
      '(select d.name from tb_dolg d where d.shifrdol='
      
        '(select shifriddolg from pr_get_dolg_person_by_id(p.shifrid))) d' +
        'olg1'
      ' from person p'
      'join kadry k on p.tabno=k.tabno'
      'where p.yearvy=:y'
      '  and p.monthvy=:m'
      
        '  and (select sum(a.summa) from fadd a where a.shifridperson=p.s' +
        'hifrid)>1'
      '  and p.w_r=1'
      '  and p.w_place not in (11,76,81,82,102,105,106,121,140)'
      '  and p.dolg not like '#39#1091#1074#1086#1083'%'#39)
    Transaction = pFIBTrRepRead
    Database = FIB.pFIBDatabaseSal
    Left = 224
    Top = 64
    object pFIBdsRepTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object pFIBdsRepFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 51
      EmptyStrToNull = True
    end
    object pFIBdsRepDOLG: TFIBStringField
      FieldName = 'DOLG'
      Size = 25
      EmptyStrToNull = True
    end
    object pFIBdsRepSHIFRPOD: TFIBSmallIntField
      FieldName = 'SHIFRPOD'
    end
    object pFIBdsRepDOLG1: TFIBStringField
      FieldName = 'DOLG1'
      Size = 50
      EmptyStrToNull = True
    end
  end
  object pFIBTrRepRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 264
    Top = 64
  end
end
