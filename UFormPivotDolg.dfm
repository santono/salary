object FormPivotDolg: TFormPivotDolg
  Left = 256
  Top = 173
  Width = 696
  Height = 508
  Caption = #1057#1074#1086#1076' '#1087#1086' '#1076#1086#1083#1078#1085#1086#1089#1090#1103#1084
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    688
    464)
  PixelsPerInch = 96
  TextHeight = 20
  object cxDBPivotGridPivotDolg: TcxDBPivotGrid
    Left = 8
    Top = 8
    Width = 673
    Height = 420
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSourcePivotTable
    Groups = <>
    TabOrder = 0
    TabStop = True
    object cxDBPivotGridPivotDolgFieldDolg: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 1
      DataBinding.FieldName = 'NAMEDOL'
      Visible = True
    end
    object cxDBPivotGridPivotDolgFieldPodr: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 0
      DataBinding.FieldName = 'NAMEPOD'
      Visible = True
    end
    object cxDBPivotGridPivotDolgFieldGru: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 2
      DataBinding.FieldName = 'NAMECOU'
      Visible = True
    end
    object cxDBPivotGridPivotDolgFieldKwo: TcxDBPivotGridField
      Area = faData
      AreaIndex = 0
      DataBinding.FieldName = 'COUNT'
      Visible = True
    end
    object cxDBPivotGridPivotDolgFieldKoe: TcxDBPivotGridField
      Area = faData
      AreaIndex = 1
      DataBinding.FieldName = 'SUMMAKOE'
      Visible = True
    end
    object cxDBPivotGridPivotDolgFieldOkl: TcxDBPivotGridField
      Area = faData
      AreaIndex = 2
      DataBinding.FieldName = 'SUMMAOKL'
      Visible = True
    end
  end
  object BitBtn1: TBitBtn
    Left = 520
    Top = 435
    Width = 89
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object DateTimePicker1: TDateTimePicker
    Left = 16
    Top = 432
    Width = 186
    Height = 25
    Anchors = [akLeft, akBottom]
    Date = 40417.015856481480000000
    Time = 40417.015856481480000000
    DateFormat = dfLong
    DateMode = dmUpDown
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 208
    Top = 432
    Width = 161
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object pFIBDataSetPivotDolg: TpFIBDataSet
    UpdateRecordTypes = [cusUnmodified, cusDeleted]
    SelectSQL.Strings = (
      
        'select b.prim,c.name as namedol,d.shifrpod,d.shifrpod||'#39' '#39'||d.na' +
        'me as namepod,a.shifrgru,f.name as namecou, count(*),sum(e.summa' +
        ') as summakoe,sum(a.oklad) as summaokl from person a'
      'join fcn b on a.shifrid=b.shifridperson'
      'join tb_dolg c on b.prim=c.shifrdol'
      'join podr d on a.w_place=d.shifrpod'
      'join fcn e on  a.shifrid=e.shifridperson'
      'join gruppy f on a.shifrgru=f.shifr'
      'where b.shifrsta=100+500'
      'and e.shifrsta in (98+500,99+500)'
      'and a.yearvy=:y'
      'and a.monthvy=:m'
      'group by 1,2,3,4,5,6')
    AllowedUpdateKinds = []
    Transaction = pFIBTransactionPivot
    Database = FIB.pFIBDatabaseSal
    Left = 424
    Top = 144
    object pFIBDataSetPivotDolgPRIM: TFIBIntegerField
      DisplayLabel = #1050#1086#1076' '#1076#1086#1083#1078'.'
      FieldName = 'PRIM'
      ReadOnly = True
    end
    object pFIBDataSetPivotDolgNAMEDOL: TFIBStringField
      DisplayLabel = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      FieldName = 'NAMEDOL'
      ReadOnly = True
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBDataSetPivotDolgSHIFRPOD: TFIBIntegerField
      DisplayLabel = #1050#1086#1076' '#1087#1086#1076#1088'.'
      FieldName = 'SHIFRPOD'
      ReadOnly = True
    end
    object pFIBDataSetPivotDolgNAMEPOD: TFIBStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      FieldName = 'NAMEPOD'
      ReadOnly = True
      Size = 112
      EmptyStrToNull = True
    end
    object pFIBDataSetPivotDolgSHIFRGRU: TFIBSmallIntField
      DisplayLabel = #1050#1086#1076' '#1089#1095#1077#1090#1072
      FieldName = 'SHIFRGRU'
      ReadOnly = True
    end
    object pFIBDataSetPivotDolgNAMECOU: TFIBStringField
      DisplayLabel = #1057#1095#1077#1090
      FieldName = 'NAMECOU'
      ReadOnly = True
      EmptyStrToNull = True
    end
    object pFIBDataSetPivotDolgCOUNT: TFIBIntegerField
      DisplayLabel = #1050'-'#1074#1086' '#1089#1090#1088#1086#1082
      FieldName = 'COUNT'
      ReadOnly = True
    end
    object pFIBDataSetPivotDolgSUMMAKOE: TFIBBCDField
      DisplayLabel = #1050'-'#1074#1086' '#1089#1090#1072#1074#1086#1082
      FieldName = 'SUMMAKOE'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetPivotDolgSUMMAOKL: TFIBBCDField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1086#1082#1083#1072#1076#1086#1074
      FieldName = 'SUMMAOKL'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
  end
  object pFIBTransactionPivot: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 464
    Top = 144
  end
  object DataSourcePivotTable: TDataSource
    DataSet = pFIBDataSetPivotDolg
    Left = 384
    Top = 144
  end
end
