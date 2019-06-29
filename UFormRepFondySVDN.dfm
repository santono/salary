object FormRepFondySVDN: TFormRepFondySVDN
  Left = 216
  Top = 290
  Width = 657
  Height = 283
  Caption = #1057#1074#1086#1076' '#1087#1086' '#1092#1086#1085#1076#1072#1084' '#1076#1083#1103' '#1087#1083#1072#1085#1086#1074#1086#1075#1086' '#1086#1090#1076#1077#1083#1072
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
    Visible = False
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
    Visible = False
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 152
    Width = 609
    Height = 17
    TabOrder = 3
  end
  object dsFondy: TpFIBDataSet
    SelectSQL.Strings = (
      'select a.razr'
      ' , coalesce(a.nmbofpers,0.00)  nmbofpers'
      ' , coalesce(a.summafop,0.00)   summafop'
      ' , coalesce(a.summaokl,0.00)   summaokl'
      ' , coalesce(a.summadoplo,0.00) summadoplo'
      ' , coalesce(a.summadopln,0.00) summadopln'
      ' , coalesce(a.summadomin,0.00) summadomin'
      ' , coalesce(a.summaprem,0.00)  summaprem'
      ' , coalesce(a.summaoth,0.00)   summaoth'
      ' , coalesce(a.summaprem102,0.00) summaprem102'
      ' , coalesce(b.nmbofpers,0.00)  nmbofpers1'
      ' , coalesce(b.summafop,0.00)   summafop1'
      ' , coalesce(b.summaokl,0.00)   summaokl1'
      ' , coalesce(b.summadoplo,0.00) summadoplo1'
      ' , coalesce(b.summadopln,0.00) summadopln1'
      ' , coalesce(b.summadomin,0.00) summadomin1'
      ' , coalesce(b.summaprem,0.00)  summaprem1'
      ' , coalesce(b.summaoth,0.00)   summaoth1'
      ' , coalesce(b.summaprem102,0.00) summaprem1021'
      ' from pr_fondy(2018,1,12,1) a'
      'join PR_FONDY(2019,1,5,1) b on a.razr=b.razr'
      'order by a.razr')
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    Left = 208
    Top = 64
    object dsFondyRAZR: TFIBIntegerField
      FieldName = 'RAZR'
    end
    object dsFondyNMBOFPERS: TFIBBCDField
      FieldName = 'NMBOFPERS'
      Size = 2
      RoundByScale = True
    end
    object dsFondySUMMAFOP: TFIBBCDField
      FieldName = 'SUMMAFOP'
      Size = 2
      RoundByScale = True
    end
    object dsFondySUMMAOKL: TFIBBCDField
      FieldName = 'SUMMAOKL'
      Size = 2
      RoundByScale = True
    end
    object dsFondySUMMADOPLO: TFIBBCDField
      FieldName = 'SUMMADOPLO'
      Size = 2
      RoundByScale = True
    end
    object dsFondySUMMADOPLN: TFIBBCDField
      FieldName = 'SUMMADOPLN'
      Size = 2
      RoundByScale = True
    end
    object dsFondySUMMADOMIN: TFIBBCDField
      FieldName = 'SUMMADOMIN'
      Size = 2
      RoundByScale = True
    end
    object dsFondySUMMAPREM: TFIBBCDField
      FieldName = 'SUMMAPREM'
      Size = 2
      RoundByScale = True
    end
    object dsFondySUMMAOTH: TFIBBCDField
      FieldName = 'SUMMAOTH'
      Size = 2
      RoundByScale = True
    end
    object dsFondySUMMAPREM102: TFIBBCDField
      FieldName = 'SUMMAPREM102'
      Size = 2
      RoundByScale = True
    end
    object dsFondyNMBOFPERS1: TFIBBCDField
      FieldName = 'NMBOFPERS1'
      Size = 2
      RoundByScale = True
    end
    object dsFondySUMMAFOP1: TFIBBCDField
      FieldName = 'SUMMAFOP1'
      Size = 2
      RoundByScale = True
    end
    object dsFondySUMMAOKL1: TFIBBCDField
      FieldName = 'SUMMAOKL1'
      Size = 2
      RoundByScale = True
    end
    object dsFondySUMMADOPLO1: TFIBBCDField
      FieldName = 'SUMMADOPLO1'
      Size = 2
      RoundByScale = True
    end
    object dsFondySUMMADOPLN1: TFIBBCDField
      FieldName = 'SUMMADOPLN1'
      Size = 2
      RoundByScale = True
    end
    object dsFondySUMMADOMIN1: TFIBBCDField
      FieldName = 'SUMMADOMIN1'
      Size = 2
      RoundByScale = True
    end
    object dsFondySUMMAOTH1: TFIBBCDField
      FieldName = 'SUMMAOTH1'
      Size = 2
      RoundByScale = True
    end
    object dsFondySUMMAPREM1021: TFIBBCDField
      FieldName = 'SUMMAPREM1021'
      Size = 2
      RoundByScale = True
    end
    object dsFondySUMMAPREM1: TFIBBCDField
      FieldName = 'SUMMAPREM1'
      Size = 2
      RoundByScale = True
    end
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 248
    Top = 64
  end
end
