object FormReturnSZNadb2014: TFormReturnSZNadb2014
  Left = 275
  Top = 180
  Width = 696
  Height = 236
  Caption = #1042#1086#1079#1074#1088#1072#1090' '#1085#1072#1076#1073#1072#1074#1086#1082' '#1079#1072' '#1087#1088#1086#1096#1083#1099#1077' '#1084#1077#1089#1103#1094#1099' '#1074' '#1073#1102#1076#1078#1077#1090
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 128
    Top = 8
    Width = 48
    Height = 20
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 128
    Top = 56
    Width = 48
    Height = 20
    Caption = 'Label2'
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 32
    Width = 665
    Height = 21
    TabOrder = 0
  end
  object BitBtn2: TBitBtn
    Left = 328
    Top = 144
    Width = 201
    Height = 25
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 592
    Top = 96
    Width = 81
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object BitBtn4: TBitBtn
    Left = 144
    Top = 144
    Width = 169
    Height = 25
    Caption = #1042#1077#1088#1085#1091#1090#1100' '#1074' '#1073#1102#1076#1078#1077#1090
    TabOrder = 3
    OnClick = BitBtn4Click
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 64
    Width = 129
    Height = 105
    Caption = #1057#1090#1072#1090#1100#1080
    Items.Strings = (
      #1089#1090#1077#1087#1077#1085#1100
      #1079#1074#1072#1085#1080#1077
      #1074#1099#1089#1083#1091#1075#1072)
    TabOrder = 4
  end
  object dtpData: TDateTimePicker
    Left = 160
    Top = 80
    Width = 186
    Height = 28
    Date = 41721.505871481480000000
    Time = 41721.505871481480000000
    DateFormat = dfLong
    TabOrder = 5
  end
  object pFIBdsList: TpFIBDataSet
    SelectSQL.Strings = (
      'select a.tabno,a.summa from fadd a'
      'join person b on a.shifridperson=b.shifrid'
      'where b.yearvy=:y'
      '  and b.monthvy=:m'
      
        '  and (select first 1 shifriddolg from pr_get_dolg_person_by_id(' +
        'b.shifrid))=1520'
      '  and b.shifrgru=:shifrgru'
      '  and a.shifrsta=:shifrsta'
      '  and b.w_place=:shifrpod')
    Transaction = pFIBTrRead
    Database = FIB.pFIBDatabaseSal
    Left = 392
    Top = 72
    object pFIBdsListTABNO: TFIBSmallIntField
      FieldName = 'TABNO'
    end
    object pFIBdsListSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
  end
  object pFIBTrRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 440
    Top = 72
  end
  object dsoList: TDataSource
    DataSet = pFIBdsList
    Left = 480
    Top = 72
  end
end
