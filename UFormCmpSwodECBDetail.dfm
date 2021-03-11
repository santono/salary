object FormCmpSwodECBDetail: TFormCmpSwodECBDetail
  Left = 263
  Top = 206
  Width = 696
  Height = 480
  Caption = #1055#1077#1088#1077#1083'i'#1082' c'#1087'i'#1074#1088#1086#1073'i'#1090#1085#1080#1082'i'#1074' '#1079' '#1085#1077#1089#1087'i'#1074#1087#1072#1076'i'#1085#1085#1103#1084' '#1076#1072#1085#1080#1093' '#1079#1074'i'#1090#1091' '#1079' '#1090#1072#1073#1083#1080#1094#1077#1102' 6'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    680
    442)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1DFECBPerson: TDBGrid
    Left = 0
    Top = 0
    Width = 537
    Height = 409
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dso1DFECBPerson
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'TABNO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIO'
        Width = 255
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMAADDSWOD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMAADDT6'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'summarazn'
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 416
    Width = 240
    Height = 25
    DataSource = dso1DFECBPerson
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object dsSwodECBPerson: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select tabno,(select first 1 fio from kadry where kadry.tabno=a.' +
        'tabno) fio,summaaddswod, summaaddt6 from PR_T6CMPSWODPERSON(:y,:' +
        'm) a')
    OnCalcFields = dsSwodECBPersonCalcFields
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    Left = 16
    Top = 8
    object dsSwodECBPersonTABNO: TFIBIntegerField
      DisplayLabel = #1058'.'#1085'.'
      FieldName = 'TABNO'
      ReadOnly = True
    end
    object dsSwodECBPersonFIO: TFIBStringField
      DisplayLabel = #1055'I'#1041
      FieldName = 'FIO'
      ReadOnly = True
      Size = 51
      EmptyStrToNull = True
    end
    object dsSwodECBPersonSUMMAADDSWOD: TFIBBCDField
      DisplayLabel = #1042' '#1089#1074#1086#1076#1077
      FieldName = 'SUMMAADDSWOD'
      Size = 2
      RoundByScale = True
    end
    object dsSwodECBPersonSUMMAADDT6: TFIBBCDField
      DisplayLabel = #1058#1072#1073#1083#1080#1094#1103' 6'
      FieldName = 'SUMMAADDT6'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
    object dsSwodECBPersonsummarazn: TFloatField
      DisplayLabel = #1056'i'#1079#1085#1080#1094#1103
      FieldKind = fkCalculated
      FieldName = 'summarazn'
      ReadOnly = True
      Calculated = True
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
    Top = 8
  end
  object dso1DFECBPerson: TDataSource
    DataSet = dsSwodECBPerson
    Left = 88
    Top = 8
  end
end
