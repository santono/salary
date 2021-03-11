object FormCMP1DFECB: TFormCMP1DFECB
  Left = 252
  Top = 125
  Width = 478
  Height = 191
  Caption = #1057#1088#1072#1074#1085#1077#1085#1080#1077' 1'#1044#1060' '#1080' ECB '
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
  object DBGrid1DFECB: TDBGrid
    Left = 8
    Top = 8
    Width = 409
    Height = 105
    DataSource = dso1DFECB
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnEditButtonClick = DBGrid1DFECBEditButtonClick
    Columns = <
      item
        Expanded = False
        FieldName = 'mnthname'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMAADD1DF'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMAADDT6'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMARAZN'
        Width = 93
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        Width = 20
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 120
    Width = 145
    Height = 25
    Caption = #1057#1087#1080#1089#1086#1082' '#1087#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072#1084
    TabOrder = 1
  end
  object BitBtn2: TBitBtn
    Left = 160
    Top = 120
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object ds1dfECB: TpFIBDataSet
    SelectSQL.Strings = (
      'select mnth,summaadd1df,summaaddt6 from PR_1DFCMPT6(:y,:m)'
      'order by mnth')
    OnCalcFields = ds1dfECBCalcFields
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    Left = 16
    Top = 16
    object ds1dfECBmnthname: TStringField
      DisplayLabel = #1052#1077#1089#1103#1094
      FieldKind = fkCalculated
      FieldName = 'mnthname'
      ReadOnly = True
      Calculated = True
    end
    object ds1dfECBMNTH: TFIBIntegerField
      FieldName = 'MNTH'
    end
    object ds1dfECBSUMMAADD1DF: TFIBBCDField
      DisplayLabel = '1'#1044#1060
      FieldName = 'SUMMAADD1DF'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
    object ds1dfECBSUMMAADDT6: TFIBBCDField
      DisplayLabel = #1058#1072#1073#1083#1080#1094#1072' 6'
      FieldName = 'SUMMAADDT6'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
    object ds1dfECBSUMMARAZN: TFloatField
      DisplayLabel = #1056#1072#1079#1085#1080#1094#1072
      FieldKind = fkCalculated
      FieldName = 'SUMMARAZN'
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
    Top = 16
  end
  object dso1DFECB: TDataSource
    DataSet = ds1dfECB
    Left = 96
    Top = 16
  end
end
