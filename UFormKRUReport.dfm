object FormKRUReport: TFormKRUReport
  Left = 250
  Top = 203
  Width = 375
  Height = 230
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1089#1074#1086#1076' '#1076#1083#1103' '#1050#1056#1059' '#1079#1072' 2016-2019'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object rgGruppy: TRadioGroup
    Left = 24
    Top = 16
    Width = 257
    Height = 49
    Caption = #1042#1099#1073#1086#1088' '#1089#1095#1077#1090#1086#1074
    Columns = 3
    Items.Strings = (
      #1074#1089#1077' '#1089#1095#1077#1090#1072
      #1073#1102#1076#1078#1077#1090
      #1074#1085#1077' '#1073#1102#1076#1078#1077#1090)
    TabOrder = 0
  end
  object rgKoledg: TRadioGroup
    Left = 24
    Top = 80
    Width = 185
    Height = 57
    Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
    Columns = 3
    Items.Strings = (
      #1091#1085#1080#1074#1077#1088#1089#1080#1090#1077#1090
      #1082#1086#1083#1083#1077#1076#1078)
    TabOrder = 1
  end
  object ButtonStart: TButton
    Left = 24
    Top = 152
    Width = 75
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100
    TabOrder = 2
    OnClick = ButtonStartClick
  end
  object BitBtn1: TBitBtn
    Left = 112
    Top = 152
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 3
    Kind = bkCancel
  end
  object cbGenerate: TCheckBox
    Left = 224
    Top = 88
    Width = 97
    Height = 17
    Caption = #1057#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1041#1044
    TabOrder = 4
  end
  object dsKRU: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' Y,'
      ' M,'
      ' SHIFRSTA,'
      ' NAME,'
      ' MODE,'
      ' ISKOLEDG,'
      ' SUMMA'
      'FROM'
      ' TB_KRU_REPORT ')
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    Left = 200
    Top = 144
    object dsKRUY: TFIBIntegerField
      FieldName = 'Y'
    end
    object dsKRUM: TFIBIntegerField
      FieldName = 'M'
    end
    object dsKRUSHIFRSTA: TFIBBCDField
      FieldName = 'SHIFRSTA'
      Size = 0
      RoundByScale = True
    end
    object dsKRUNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 64
      EmptyStrToNull = True
    end
    object dsKRUMODE: TFIBIntegerField
      FieldName = 'MODE'
    end
    object dsKRUISKOLEDG: TFIBIntegerField
      FieldName = 'ISKOLEDG'
    end
    object dsKRUSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
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
    Left = 240
    Top = 144
  end
end
