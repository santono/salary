object FormRepPomKOtp: TFormRepPomKOtp
  Left = 253
  Top = 275
  Width = 657
  Height = 148
  Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1089#1074#1086#1076#1072' '#1087#1086#1084#1086#1097#1080' '#1082' '#1086#1090#1087#1091#1089#1082#1091
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
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1074#1086#1076
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
  object cxSpinEditWantedYear: TcxSpinEdit
    Left = 40
    Top = 32
    TabOrder = 2
    Width = 121
  end
  object dsPomKOtp: TpFIBDataSet
    SelectSQL.Strings = (
      'select p.shifrkat'
      '      , k.name'
      '      , count(distinct p.tabno) cnt'
      '      ,sum(a.summa) summa from person p'
      'join fadd a on p.shifrid=a.shifridperson'
      'join kateg k on k.shifr=p.shifrkat'
      'where p.yearvy=:wantedYear'
      'and a.shifrsta=20'
      'group by 1,2')
    Transaction = trRead
    Database = FIB.pFIBDatabaseArc
    Left = 16
    object dsPomKOtpSHIFRKAT: TFIBSmallIntField
      FieldName = 'SHIFRKAT'
    end
    object dsPomKOtpNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 40
      EmptyStrToNull = True
    end
    object dsPomKOtpCNT: TFIBIntegerField
      FieldName = 'CNT'
    end
    object dsPomKOtpSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseArc
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 48
  end
  object dsoPomKOtp: TDataSource
    DataSet = dsPomKOtp
    Left = 80
  end
end
