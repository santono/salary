object FormRepPensionery: TFormRepPensionery
  Left = 216
  Top = 290
  Width = 657
  Height = 283
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1077#1085#1089#1080#1086#1085#1077#1088#1086#1074' '#1080' '#1080#1085#1074#1072#1083#1080#1076#1086#1074' '#1085#1072' '#1091#1082#1072#1079#1072#1085#1085#1091#1102' '#1076#1072#1090#1091
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
  object rgKateg: TRadioGroup
    Left = 224
    Top = 24
    Width = 281
    Height = 49
    Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
    Columns = 2
    Items.Strings = (
      #1055#1077#1085#1089#1080#1086#1088#1077#1085#1099
      #1048#1085#1074#1072#1083#1080#1076#1099)
    TabOrder = 3
  end
  object dsoPens: TDataSource
    DataSet = dsPens
    Left = 224
    Top = 80
  end
  object dsPens: TpFIBDataSet
    SelectSQL.Strings = (
      'select a.tabno, a.nal_code,a.fio'
      
        ', sum((select sum(d1.summa) from fadd d1 where a.shifrid=d1.shif' +
        'ridperson)) summaadd'
      
        ', sum((select sum(d2.summa) from fud d2 where a.shifrid=d2.shifr' +
        'idperson and d2.shifrsta in (142,143,144,145,146))) summaecb'
      ''
      ' from person a'
      'where a.yearvy=:y'
      '  and a.monthvy=:m'
      
        '  and exists (select * from fcn b where a.shifrid=b.shifridperso' +
        'n and b.shifrsta=:shifr)'
      
        '  and (select sum(d.summa) from fadd d where a.shifrid=d.shifrid' +
        'person)>1.0'
      'group by 1,2,3'
      '  order by a.fio')
    Transaction = trRead
    Database = FIB.pFIBDatabaseArc
    Left = 264
    Top = 80
    object dsPensTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object dsPensNAL_CODE: TFIBStringField
      FieldName = 'NAL_CODE'
      Size = 10
      EmptyStrToNull = True
    end
    object dsPensFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 30
      EmptyStrToNull = True
    end
    object dsPensSUMMAADD: TFIBBCDField
      FieldName = 'SUMMAADD'
      Size = 2
      RoundByScale = True
    end
    object dsPensSUMMAECB: TFIBBCDField
      FieldName = 'SUMMAECB'
      Size = 2
      RoundByScale = True
    end
  end
  object trRead: TpFIBTransaction
    Active = True
    DefaultDatabase = FIB.pFIBDatabaseArc
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 304
    Top = 80
  end
end
