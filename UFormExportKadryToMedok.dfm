object FormExportKadryToMedok: TFormExportKadryToMedok
  Left = 192
  Top = 124
  Width = 696
  Height = 172
  Caption = #1069#1082#1089#1087#1086#1088#1090' '#1082#1072#1076#1088#1086#1074' '#1074' '#1084#1077#1076#1086#1082
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
  object LabelFIO: TLabel
    Left = 24
    Top = 48
    Width = 43
    Height = 13
    Caption = 'LabelFIO'
  end
  object Label1: TLabel
    Left = 48
    Top = 104
    Width = 219
    Height = 13
    Caption = #1060#1072#1081#1083' '#1101#1082#1089#1087#1086#1088#1090#1072' '#1082#1072#1076#1088#1086#1074' '#1080#1079' '#1052#1077#1076#1082#1072' '#1085#1072#1079#1086#1074#1080#1090#1077
  end
  object Label2: TLabel
    Left = 272
    Top = 96
    Width = 130
    Height = 24
    Caption = ' personsold.dbf'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object ProgressBar1: TProgressBar
    Left = 24
    Top = 24
    Width = 641
    Height = 17
    TabOrder = 0
  end
  object BitBtnExport: TBitBtn
    Left = 24
    Top = 72
    Width = 75
    Height = 25
    Caption = #1053#1072#1095#1072#1090#1100
    TabOrder = 1
    OnClick = BitBtnExportClick
  end
  object BitBtn1: TBitBtn
    Left = 584
    Top = 64
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object ceValue: TcxCalcEdit
    Left = 208
    Top = 72
    EditValue = 0.000000000000000000
    TabOrder = 3
    Visible = False
    Width = 185
  end
  object dsKadry: TpFIBDataSet
    SelectSQL.Strings = (
      'select nal_code,fio from kadry'
      'where '
      '--nal_code not in (select num from tb_medok_person)'
      '--and '
      'fio is not null'
      'and nal_code is not null'
      
        'and exists (select * from fadd where fadd.year_vy>=2014 and fadd' +
        '.tabno=kadry.tabno)'
      'order by fio')
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    Left = 112
    Top = 72
    object dsKadryNAL_CODE: TFIBStringField
      FieldName = 'NAL_CODE'
      Size = 10
      EmptyStrToNull = True
    end
    object dsKadryFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 51
      EmptyStrToNull = True
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
    Left = 152
    Top = 72
  end
end
