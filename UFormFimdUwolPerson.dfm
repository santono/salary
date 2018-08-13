object FormFimdUwolPerson: TFormFimdUwolPerson
  Left = 192
  Top = 124
  Width = 696
  Height = 175
  Caption = #1055#1086#1080#1089#1082' '#1088#1077#1082#1074#1080#1079#1080#1090#1086#1074'  '#1091#1074#1086#1083#1077#1085#1085#1099#1093' 31 08 2016'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 256
    Top = 80
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object ProgressBar1: TProgressBar
    Left = 24
    Top = 56
    Width = 641
    Height = 17
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 88
    Width = 75
    Height = 25
    Caption = #1053#1072#1095#1072#1090#1100
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 120
    Top = 88
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object dsoUwol: TDataSource
    DataSet = dsUwol
    Left = 152
    Top = 16
  end
  object dsUwol: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_08_2015_UWOL'
      'SET '
      ' INN = :INN,'
      ' FIO = :FIO,'
      ' FIO_KADRY = :FIO_KADRY,'
      ' TABNO = :TABNO,'
      ' FAM = :FAM,'
      ' NAM = :NAM,'
      ' OTC = :OTC,'
      ' REASON = :REASON,'
      ' DAY_UW = :DAY_UW'
      'WHERE'
      ' ID = :OLD_ID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_08_2015_UWOL'
      'WHERE'
      '  ID = :OLD_ID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_08_2015_UWOL('
      ' INN,'
      ' FIO,'
      ' FIO_KADRY,'
      ' TABNO,'
      ' FAM,'
      ' NAM,'
      ' OTC,'
      ' REASON,'
      ' DAY_UW'
      ')'
      'VALUES('
      ' :INN,'
      ' :FIO,'
      ' :FIO_KADRY,'
      ' :TABNO,'
      ' :FAM,'
      ' :NAM,'
      ' :OTC,'
      ' :REASON,'
      ' :DAY_UW'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' INN,'
      ' FIO,'
      ' FIO_KADRY,'
      ' TABNO,'
      ' FAM,'
      ' NAM,'
      ' OTC,'
      ' REASON,'
      ' DAY_UW,'
      ' ID'
      'FROM'
      ' TB_08_2015_UWOL '
      ''
      ' WHERE '
      '  TB_08_2015_UWOL.ID = :OLD_ID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' INN,'
      ' FIO,'
      ' FIO_KADRY,'
      ' TABNO,'
      ' FAM,'
      ' NAM,'
      ' OTC,'
      ' REASON,'
      ' DAY_UW,'
      ' ID'
      'FROM'
      ' TB_08_2015_UWOL ')
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = trWrite
    Left = 32
    Top = 16
    object dsUwolINN: TFIBStringField
      FieldName = 'INN'
      Size = 15
      EmptyStrToNull = True
    end
    object dsUwolFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 87
      EmptyStrToNull = True
    end
    object dsUwolFIO_KADRY: TFIBStringField
      FieldName = 'FIO_KADRY'
      Size = 50
      EmptyStrToNull = True
    end
    object dsUwolFAM: TFIBStringField
      FieldName = 'FAM'
      Size = 50
      EmptyStrToNull = True
    end
    object dsUwolNAM: TFIBStringField
      FieldName = 'NAM'
      Size = 50
      EmptyStrToNull = True
    end
    object dsUwolOTC: TFIBStringField
      FieldName = 'OTC'
      Size = 50
      EmptyStrToNull = True
    end
    object dsUwolREASON: TFIBStringField
      FieldName = 'REASON'
      Size = 50
      EmptyStrToNull = True
    end
    object dsUwolDAY_UW: TFIBSmallIntField
      FieldName = 'DAY_UW'
    end
    object dsUwolID: TFIBSmallIntField
      FieldName = 'ID'
    end
    object dsUwolTABNO: TFIBIntegerField
      FieldName = 'TABNO'
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
    Left = 72
    Top = 16
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 112
    Top = 16
  end
  object dsoKadry: TDataSource
    DataSet = dsKadry
    Left = 344
    Top = 16
  end
  object dsKadry: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' TABNO,'
      ' FIO,'
      ' NAL_CODE,'
      ' SHIFR_POD,'
      ' PIB'
      'FROM'
      ' KADRY ')
    Transaction = trKadryRead
    Database = FIB.pFIBDatabaseSal
    Left = 280
    Top = 16
    object dsKadryTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object dsKadryFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 51
      EmptyStrToNull = True
    end
    object dsKadryNAL_CODE: TFIBStringField
      FieldName = 'NAL_CODE'
      Size = 10
      EmptyStrToNull = True
    end
    object dsKadrySHIFR_POD: TFIBIntegerField
      FieldName = 'SHIFR_POD'
    end
    object dsKadryPIB: TFIBStringField
      FieldName = 'PIB'
      Size = 60
      EmptyStrToNull = True
    end
  end
  object trKadryRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 312
    Top = 16
  end
end
