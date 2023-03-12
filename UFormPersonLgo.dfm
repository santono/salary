object FormPersonLgo: TFormPersonLgo
  Left = 210
  Top = 125
  Width = 782
  Height = 522
  Caption = #1051#1100#1075#1086#1090#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 64
    Width = 136
    Height = 13
    Caption = #1057#1091#1084#1084#1072' '#1085#1072#1083#1086#1075#1086#1074#1099#1093' '#1074#1099#1095#1077#1090#1086#1074
  end
  object Label2: TLabel
    Left = 280
    Top = 64
    Width = 20
    Height = 13
    Caption = #1088#1091#1073'.'
  end
  object Label3: TLabel
    Left = 32
    Top = 104
    Width = 114
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1076#1077#1081#1089#1090#1074#1080#1103
  end
  object Label4: TLabel
    Left = 8
    Top = 144
    Width = 132
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1076#1077#1081#1089#1090#1074#1080#1103
  end
  object Label5: TLabel
    Left = 80
    Top = 184
    Width = 58
    Height = 13
    Caption = #1058#1080#1087' '#1083#1100#1075#1086#1090#1099
  end
  object Label6: TLabel
    Left = 8
    Top = 256
    Width = 128
    Height = 13
    Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086' '#1089' '#1085#1072#1095#1072#1083#1072' '#1075#1086#1076#1072
  end
  object Label7: TLabel
    Left = 280
    Top = 256
    Width = 20
    Height = 13
    Caption = #1088#1091#1073'.'
  end
  object Label8: TLabel
    Left = 64
    Top = 304
    Width = 70
    Height = 13
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
  end
  object SSummVy: TdxCalcEdit
    Left = 152
    Top = 60
    Width = 121
    TabOrder = 0
    Text = '0'
  end
  object dtFrom: TDateTimePicker
    Left = 152
    Top = 104
    Width = 121
    Height = 21
    Date = 44997.676477997690000000
    Time = 44997.676477997690000000
    DateFormat = dfLong
    TabOrder = 1
  end
  object dtTo: TDateTimePicker
    Left = 152
    Top = 144
    Width = 121
    Height = 21
    Date = 44997.677425555560000000
    Time = 44997.677425555560000000
    DateFormat = dfLong
    TabOrder = 2
  end
  object cbEnabled: TCheckBox
    Left = 152
    Top = 216
    Width = 153
    Height = 17
    Caption = #1044#1077#1081#1089#1090#1074#1091#1102#1097#1072#1103' '#1083#1100#1075#1086#1090#1072
    TabOrder = 3
  end
  object cbLgota: TComboBox
    Left = 152
    Top = 184
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    Text = 'cbLgota'
    Items.Strings = (
      '3000'
      '1400'
      '300')
  end
  object SSSummaLimit: TdxCalcEdit
    Left = 152
    Top = 252
    Width = 121
    TabOrder = 5
    Text = '0'
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 408
    Width = 97
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 6
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 120
    Top = 408
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 7
    Kind = bkClose
  end
  object MemoComment: TMemo
    Left = 152
    Top = 296
    Width = 329
    Height = 89
    Lines.Strings = (
      '')
    TabOrder = 8
  end
  object dsLgotniki: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_LGOTNIKI'
      'SET '
      ' TABNO = :TABNO,'
      ' DATAFR = :DATAFR,'
      ' SUMMAVY = :SUMMAVY,'
      ' FIO = :FIO,'
      ' SUMMAYEARLIMIT = :SUMMAYEARLIMIT,'
      ' SHIFRLG = :SHIFRLG,'
      ' COMMENT = :COMMENT,'
      ' DATAEND = :DATAEND,'
      ' GUID = :GUID,'
      ' ENABLED = :ENABLED'
      'WHERE'
      ' ID = :OLD_ID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_LGOTNIKI'
      'WHERE'
      '  ID = :OLD_ID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_LGOTNIKI('
      ' TABNO,'
      ' DATAFR,'
      ' SUMMAVY,'
      ' FIO,'
      ' SUMMAYEARLIMIT,'
      ' SHIFRLG,'
      ' COMMENT,'
      ' DATAEND,'
      ' GUID,'
      ' ENABLED'
      ')'
      'VALUES('
      ' :TABNO,'
      ' :DATAFR,'
      ' :SUMMAVY,'
      ' :FIO,'
      ' :SUMMAYEARLIMIT,'
      ' :SHIFRLG,'
      ' :COMMENT,'
      ' :DATAEND,'
      ' :GUID,'
      ' :ENABLED'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' TABNO,'
      ' DATAFR,'
      ' SUMMAVY,'
      ' FIO,'
      ' SUMMAYEARLIMIT,'
      ' SHIFRLG,'
      ' COMMENT,'
      ' DATAEND,'
      ' GUID,'
      ' ENABLED'
      'FROM'
      ' TB_LGOTNIKI '
      ''
      ' WHERE '
      '  TB_LGOTNIKI.ID = :OLD_ID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' ID,'
      ' TABNO,'
      ' DATAFR,'
      ' SUMMAVY,'
      ' FIO,'
      ' SUMMAYEARLIMIT,'
      ' SHIFRLG,'
      ' COMMENT,'
      ' DATAEND,'
      ' GUID,'
      ' ENABLED'
      'FROM'
      ' TB_LGOTNIKI '
      'where tabno=?1')
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = trWrite
    Left = 16
    Top = 8
    object dsLgotnikiID: TFIBIntegerField
      FieldName = 'ID'
    end
    object dsLgotnikiTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object dsLgotnikiDATAFR: TFIBDateField
      FieldName = 'DATAFR'
    end
    object dsLgotnikiSUMMAVY: TFIBBCDField
      FieldName = 'SUMMAVY'
      Size = 2
      RoundByScale = True
    end
    object dsLgotnikiFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 75
      EmptyStrToNull = True
    end
    object dsLgotnikiSUMMAYEARLIMIT: TFIBBCDField
      FieldName = 'SUMMAYEARLIMIT'
      Size = 2
      RoundByScale = True
    end
    object dsLgotnikiSHIFRLG: TFIBIntegerField
      FieldName = 'SHIFRLG'
    end
    object dsLgotnikiCOMMENT: TFIBStringField
      FieldName = 'COMMENT'
      Size = 512
      EmptyStrToNull = True
    end
    object dsLgotnikiDATAEND: TFIBDateField
      FieldName = 'DATAEND'
    end
    object dsLgotnikiGUID: TFIBStringField
      FieldName = 'GUID'
      Size = 64
      EmptyStrToNull = True
    end
    object dsLgotnikiENABLED: TFIBIntegerField
      FieldName = 'ENABLED'
    end
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 56
    Top = 8
  end
  object dsLgotyDet: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' ID,'
      ' IDLGO,'
      ' NAME'
      'FROM'
      ' TB_NAL_LGOTY_DET ')
    Transaction = trReadLgDet
    Database = FIB.pFIBDatabaseSal
    Left = 152
    Top = 8
    object dsLgotyDetID: TFIBIntegerField
      FieldName = 'ID'
    end
    object dsLgotyDetIDLGO: TFIBIntegerField
      FieldName = 'IDLGO'
    end
    object dsLgotyDetNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 1024
      EmptyStrToNull = True
    end
    object dsLgotyDetSummaVy: TFIBFloatField
      FieldKind = fkLookup
      FieldName = 'SummaVy'
      LookupDataSet = dsNalLgoty
      LookupKeyFields = 'ID'
      LookupResultField = 'SUMMAVY'
      KeyFields = 'IDLGO'
      Lookup = True
    end
  end
  object trReadLgDet: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 192
    Top = 8
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
    Left = 88
    Top = 8
  end
  object dsNalLgoty: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' ID,'
      ' SHIFRLGO,'
      ' SUMMAVY,'
      ' DATEFR,'
      ' SUMMALIMITYEAR'
      'FROM'
      ' TB_NAL_LGOTY ')
    Transaction = trReadLg
    Database = FIB.pFIBDatabaseSal
    Left = 232
    Top = 8
    object dsNalLgotyID: TFIBIntegerField
      FieldName = 'ID'
    end
    object dsNalLgotySHIFRLGO: TFIBIntegerField
      FieldName = 'SHIFRLGO'
    end
    object dsNalLgotySUMMAVY: TFIBBCDField
      FieldName = 'SUMMAVY'
      Size = 2
      RoundByScale = True
    end
    object dsNalLgotyDATEFR: TFIBDateField
      FieldName = 'DATEFR'
    end
    object dsNalLgotySUMMALIMITYEAR: TFIBBCDField
      FieldName = 'SUMMALIMITYEAR'
      Size = 2
      RoundByScale = True
    end
  end
  object trReadLg: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 272
    Top = 8
  end
end
