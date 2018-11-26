object FormMovePremFromSQL: TFormMovePremFromSQL
  Left = 192
  Top = 145
  Width = 696
  Height = 480
  Caption = #1055#1077#1088#1077#1085#1086#1089' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1072' '#1087#1086#1076'.'#1085#1072#1083#1086#1075#1072' 2012'
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
    Left = 16
    Top = 56
    Width = 227
    Height = 13
    Caption = #1044#1083#1103' '#1087#1077#1088#1077#1085#1086#1089#1072' '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082#1091' '#1055#1045#1056#1045#1053#1045#1057#1058#1048
  end
  object LabelPodr: TLabel
    Left = 16
    Top = 8
    Width = 3
    Height = 13
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 24
    Width = 657
    Height = 21
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 384
    Width = 75
    Height = 25
    Caption = #1055#1077#1088#1077#1085#1077#1089#1090#1080
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 568
    Top = 384
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object BitBtn3: TBitBtn
    Left = 272
    Top = 56
    Width = 393
    Height = 25
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081', '#1089#1095#1077#1090#1086#1074
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object pFIBDataSet1: TpFIBDataSet
    UpdateRecordTypes = [cusUnmodified, cusModified]
    UpdateSQL.Strings = (
      'UPDATE TB_PREM_2018'
      'SET '
      ' MOVED = :MOVED,'
      ' MOVED_VNE = :MOVED_VNE'
      'WHERE'
      ' TABNO = :OLD_TABNO'
      ' ')
    DeleteSQL.Strings = (
      ''
      ' ')
    RefreshSQL.Strings = (
      'SELECT'
      ' NPP,'
      ' TABNO,'
      ' FIO,'
      ' DOLG,'
      ' PROC,'
      ' SUMMA,'
      ' MOVED,'
      ' SHIFRPOD'
      'FROM'
      ' TB_PREM_2018 '
      ' where(  tabno is not null'
      ' and shifrpod=:shifrpod'
      '  ) and (  TB_PREM_2018.TABNO = :OLD_TABNO'
      '  )'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' PODR,'
      ' NPP,'
      ' TABNO,'
      ' FIO,'
      ' DOLG,'
      ' KOEF,'
      ' OKLAD,'
      ' PROC,'
      ' GUID_BUD,'
      ' SUMMA,'
      ' FIOF,'
      ' MOVED,'
      ' SHIFRPOD,'
      ' TABNOS,'
      ' KOEF_VNE,'
      ' OKLAD_VNE,'
      ' SUMMA_VNE,'
      ' GUID_VNE,'
      ' MOVED_VNE'
      'FROM'
      ' TB_PREM_2018 '
      ' where tabno is not null'
      ' and abs(coalesce(shifrpod,0))=:shifrpod'
      ' and ((coalesce(summa,0.00)>1.00) '
      '   or (coalesce(summa_vne,0.00)>1.00)) ')
    AllowedUpdateKinds = [ukModify]
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    Left = 96
    Top = 120
    object pFIBDataSet1PODR: TFIBStringField
      FieldName = 'PODR'
      Size = 69
      EmptyStrToNull = True
    end
    object pFIBDataSet1NPP: TFIBStringField
      FieldName = 'NPP'
      Size = 60
      EmptyStrToNull = True
    end
    object pFIBDataSet1TABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object pFIBDataSet1FIO: TFIBStringField
      FieldName = 'FIO'
      Size = 64
      EmptyStrToNull = True
    end
    object pFIBDataSet1DOLG: TFIBStringField
      FieldName = 'DOLG'
      Size = 180
      EmptyStrToNull = True
    end
    object pFIBDataSet1KOEF: TFIBBCDField
      FieldName = 'KOEF'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet1OKLAD: TFIBBCDField
      FieldName = 'OKLAD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet1PROC: TFIBBCDField
      FieldName = 'PROC'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet1GUID_BUD: TFIBStringField
      FieldName = 'GUID_BUD'
      Size = 32
      EmptyStrToNull = True
    end
    object pFIBDataSet1SUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet1FIOF: TFIBStringField
      FieldName = 'FIOF'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSet1MOVED: TFIBIntegerField
      FieldName = 'MOVED'
    end
    object pFIBDataSet1SHIFRPOD: TFIBIntegerField
      FieldName = 'SHIFRPOD'
    end
    object pFIBDataSet1TABNOS: TFIBStringField
      FieldName = 'TABNOS'
      Size = 15
      EmptyStrToNull = True
    end
    object pFIBDataSet1KOEF_VNE: TFIBBCDField
      FieldName = 'KOEF_VNE'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet1OKLAD_VNE: TFIBBCDField
      FieldName = 'OKLAD_VNE'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet1SUMMA_VNE: TFIBBCDField
      FieldName = 'SUMMA_VNE'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet1GUID_VNE: TFIBStringField
      FieldName = 'GUID_VNE'
      Size = 32
      EmptyStrToNull = True
    end
    object pFIBDataSet1MOVED_VNE: TFIBIntegerField
      FieldName = 'MOVED_VNE'
    end
  end
  object pFIBTransactionRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 136
    Top = 120
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 176
    Top = 120
  end
end
