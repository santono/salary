object FormMoveRussianOklady: TFormMoveRussianOklady
  Left = 192
  Top = 124
  Width = 696
  Height = 206
  Caption = #1055#1077#1088#1077#1085#1086#1089' '#1086#1082#1083#1072#1076#1086#1074'  '#1074' '#1080#1102#1085#1077' 2023 '#1075'.'
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
  object LabelPodr: TLabel
    Left = 8
    Top = 72
    Width = 48
    Height = 13
    Caption = 'LabelPodr'
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 48
    Width = 665
    Height = 17
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 136
    Width = 113
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 128
    Top = 136
    Width = 73
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object BitBtn3: TBitBtn
    Left = 8
    Top = 96
    Width = 665
    Height = 25
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081', '#1082#1072#1090#1077#1075#1086#1088#1080#1081', '#1089#1095#1077#1090#1086#1074' '#1080' '#1085#1072#1076#1073#1072#1074#1086#1082
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object dsDolg: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRIDDOLOG,'
      ' NAMEDOLG,'
      ' SUMMA,'
      ' AMNT,'
      ' SHIFRDOLRUS,'
      
        ' (SELECT first 1 coalesce(oklad,0)  from TB_RUSDOLG where lineno' +
        '=TB_DOLG_RUS.SHIFRDOLRUS) OKLAD'
      'FROM'
      ' TB_DOLG_RUS '
      'where not SHIFRDOLRUS is null'
      '')
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    Left = 16
    Top = 16
    object dsDolgSHIFRIDDOLOG: TFIBIntegerField
      FieldName = 'SHIFRIDDOLOG'
    end
    object dsDolgNAMEDOLG: TFIBStringField
      FieldName = 'NAMEDOLG'
      Size = 50
      EmptyStrToNull = True
    end
    object dsDolgSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object dsDolgAMNT: TFIBIntegerField
      FieldName = 'AMNT'
    end
    object dsDolgSHIFRDOLRUS: TFIBIntegerField
      FieldName = 'SHIFRDOLRUS'
    end
    object dsDolgOKLAD: TFIBBCDField
      FieldName = 'OKLAD'
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
    Left = 56
    Top = 16
  end
end
