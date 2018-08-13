object FormShtRasp: TFormShtRasp
  Left = 212
  Top = 194
  Width = 369
  Height = 206
  Caption = #1064#1090#1072#1090#1085#1086#1077' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 7
    Height = 13
    Caption = 'C'
  end
  object Label2: TLabel
    Left = 175
    Top = 11
    Width = 12
    Height = 13
    Caption = #1087#1086
  end
  object dtFr: TDateTimePicker
    Left = 32
    Top = 8
    Width = 129
    Height = 21
    Date = 42096.558811967600000000
    Time = 42096.558811967600000000
    DateFormat = dfLong
    TabOrder = 0
  end
  object dtTo: TDateTimePicker
    Left = 200
    Top = 8
    Width = 113
    Height = 21
    Date = 42096.559649699080000000
    Time = 42096.559649699080000000
    DateFormat = dfLong
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 80
    Width = 161
    Height = 25
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1086#1090#1095#1077#1090
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 192
    Top = 80
    Width = 121
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 3
    Kind = bkClose
  end
  object rgKat: TRadioGroup
    Left = 8
    Top = 32
    Width = 257
    Height = 41
    Caption = 'rgKat'
    Columns = 5
    Items.Strings = (
      #1040#1059#1055
      #1055#1055#1057
      #1059#1042#1055
      #1040#1061#1063
      #1053'.'#1057'.')
    TabOrder = 4
  end
  object BitBtn3: TBitBtn
    Left = 16
    Top = 112
    Width = 161
    Height = 25
    Caption = #1055#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103#1084
    TabOrder = 5
    OnClick = BitBtn3Click
  end
  object dsRep: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' TABNO,'
      ' FIO,'
      ' DOLG,'
      ' OKLAD,'
      ' COMMENT,'
      ' SUMMAOPL,'
      ' SUMMAOKL,'
      ' SUMMAST,'
      ' SUMMAZW,'
      ' SUMMAVYSL,'
      ' PROCST,'
      ' PROCZW,'
      ' PROCVYSL'
      'FROM'
      ' PR_REP_GANNA_SVDN(:DATEFR,'
      ' :DATETO,'
      ' :SHIFRKAT)'
      'order by fio ')
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    Left = 272
    Top = 40
    object dsRepTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object dsRepFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 128
      EmptyStrToNull = True
    end
    object dsRepDOLG: TFIBStringField
      FieldName = 'DOLG'
      Size = 32
      EmptyStrToNull = True
    end
    object dsRepOKLAD: TFIBBCDField
      FieldName = 'OKLAD'
      Size = 2
      RoundByScale = True
    end
    object dsRepCOMMENT: TFIBStringField
      FieldName = 'COMMENT'
      Size = 128
      EmptyStrToNull = True
    end
    object dsRepSUMMAOPL: TFIBBCDField
      FieldName = 'SUMMAOPL'
      Size = 2
      RoundByScale = True
    end
    object dsRepSUMMAOKL: TFIBBCDField
      FieldName = 'SUMMAOKL'
      Size = 2
      RoundByScale = True
    end
    object dsRepSUMMAST: TFIBBCDField
      FieldName = 'SUMMAST'
      Size = 2
      RoundByScale = True
    end
    object dsRepSUMMAZW: TFIBBCDField
      FieldName = 'SUMMAZW'
      Size = 2
      RoundByScale = True
    end
    object dsRepSUMMAVYSL: TFIBBCDField
      FieldName = 'SUMMAVYSL'
      Size = 2
      RoundByScale = True
    end
    object dsRepPROCST: TFIBBCDField
      FieldName = 'PROCST'
      Size = 2
      RoundByScale = True
    end
    object dsRepPROCZW: TFIBBCDField
      FieldName = 'PROCZW'
      Size = 2
      RoundByScale = True
    end
    object dsRepPROCVYSL: TFIBBCDField
      FieldName = 'PROCVYSL'
      Size = 2
      RoundByScale = True
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
    Left = 312
    Top = 40
  end
  object dsByKaf: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' TABNO,'
      ' FIO,'
      ' DOLG,'
      ' OKLAD,'
      ' COMMENT,'
      ' SUMMAOPL,'
      ' SUMMAOKL,'
      ' SUMMAST,'
      ' SUMMAZW,'
      ' SUMMAVYSL,'
      ' PROCST,'
      ' PROCZW,'
      ' PROCVYSL,'
      ' SHIFRKAF'
      'FROM'
      ' PR_REP_GANNA_SVDN(:DATEFR,'
      ' :DATETO,'
      ' :SHIFRKAT) '
      'ORDER BY SHIFRKAF,FIO')
    Transaction = FIB.pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    Left = 272
    Top = 72
    object dsByKafTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object dsByKafFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 128
      EmptyStrToNull = True
    end
    object dsByKafDOLG: TFIBStringField
      FieldName = 'DOLG'
      Size = 32
      EmptyStrToNull = True
    end
    object dsByKafOKLAD: TFIBBCDField
      FieldName = 'OKLAD'
      Size = 2
      RoundByScale = True
    end
    object dsByKafCOMMENT: TFIBStringField
      FieldName = 'COMMENT'
      Size = 128
      EmptyStrToNull = True
    end
    object dsByKafSUMMAOPL: TFIBBCDField
      FieldName = 'SUMMAOPL'
      Size = 2
      RoundByScale = True
    end
    object dsByKafSUMMAOKL: TFIBBCDField
      FieldName = 'SUMMAOKL'
      Size = 2
      RoundByScale = True
    end
    object dsByKafSUMMAST: TFIBBCDField
      FieldName = 'SUMMAST'
      Size = 2
      RoundByScale = True
    end
    object dsByKafSUMMAZW: TFIBBCDField
      FieldName = 'SUMMAZW'
      Size = 2
      RoundByScale = True
    end
    object dsByKafSUMMAVYSL: TFIBBCDField
      FieldName = 'SUMMAVYSL'
      Size = 2
      RoundByScale = True
    end
    object dsByKafPROCST: TFIBBCDField
      FieldName = 'PROCST'
      Size = 2
      RoundByScale = True
    end
    object dsByKafPROCZW: TFIBBCDField
      FieldName = 'PROCZW'
      Size = 2
      RoundByScale = True
    end
    object dsByKafPROCVYSL: TFIBBCDField
      FieldName = 'PROCVYSL'
      Size = 2
      RoundByScale = True
    end
    object dsByKafSHIFRKAF: TFIBIntegerField
      FieldName = 'SHIFRKAF'
    end
  end
end
