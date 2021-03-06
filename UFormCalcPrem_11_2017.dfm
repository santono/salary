object FormCalcPrem_11_2017: TFormCalcPrem_11_2017
  Left = 192
  Top = 145
  Width = 696
  Height = 480
  Caption = #1056#1072#1089#1095#1077#1090' '#1087#1088#1077#1084#1080#1080' '#1074' '#1085#1086#1103#1073#1088#1077' 2017'
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
    Width = 203
    Height = 13
    Caption = #1044#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082#1091' '#1056#1040#1057#1057#1063#1045#1058
  end
  object LabelPodr: TLabel
    Left = 16
    Top = 8
    Width = 3
    Height = 13
  end
  object Label2: TLabel
    Left = 352
    Top = 104
    Width = 123
    Height = 13
    Caption = #1055#1088#1086#1094#1077#1085#1090' '#1087#1088#1077#1084#1080#1080' (1..100)'
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
    Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100
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
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081', '#1082#1072#1090#1077#1075#1086#1088#1080#1081', '#1089#1095#1077#1090#1086#1074' '#1080' '#1089#1090#1072#1090#1100#1080
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object cxCalcEdit1: TcxCalcEdit
    Left = 488
    Top = 104
    EditValue = 0.000000000000000000
    TabOrder = 4
    Width = 121
  end
  object pFIBDataSet1: TpFIBDataSet
    UpdateRecordTypes = [cusUnmodified, cusModified]
    UpdateSQL.Strings = (
      'UPDATE TB_PREM_04'
      'SET '
      ' MOVED = :MOVED'
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
      ' FIOS,'
      ' MOVED,'
      ' SHIFRPOD'
      'FROM'
      ' TB_PREM_04 '
      ' where(  tabno is not null'
      ' and shifrpod=:shifrpod'
      '  ) and (  TB_PREM_04.TABNO = :OLD_TABNO'
      '  )'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' NPP,'
      ' TABNO,'
      ' FIO,'
      ' DOLG,'
      ' PROC,'
      ' SUMMA,'
      ' FIOS,'
      ' MOVED,'
      ' SHIFRPOD'
      'FROM'
      ' TB_PREM_04 '
      ' where tabno is not null'
      ' and abs(coalesce(shifrpod,0))=:shifrpod')
    AllowedUpdateKinds = [ukModify]
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    Left = 96
    Top = 120
    object pFIBDataSet1NPP: TFIBIntegerField
      FieldName = 'NPP'
    end
    object pFIBDataSet1TABNO: TFIBSmallIntField
      FieldName = 'TABNO'
    end
    object pFIBDataSet1FIO: TFIBStringField
      FieldName = 'FIO'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBDataSet1DOLG: TFIBStringField
      FieldName = 'DOLG'
      Size = 40
      EmptyStrToNull = True
    end
    object pFIBDataSet1PROC: TFIBBCDField
      FieldName = 'PROC'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet1SUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet1FIOS: TFIBStringField
      FieldName = 'FIOS'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBDataSet1MOVED: TFIBSmallIntField
      FieldName = 'MOVED'
    end
    object pFIBDataSet1SHIFRPOD: TFIBSmallIntField
      FieldName = 'SHIFRPOD'
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
