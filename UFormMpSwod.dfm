object FormMPSwod: TFormMPSwod
  Left = 214
  Top = 285
  Width = 737
  Height = 237
  Caption = #1057#1074#1086#1076' '#1087#1086' '#1084#1072#1090'.'#1087#1086#1084#1086#1097#1080', '#1086#1079#1076#1086#1088#1086#1074#1083#1077#1085#1080#1102','#1087#1086#1095#1072#1089#1086#1074#1082#1077
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
    Left = 24
    Top = 24
    Width = 248
    Height = 20
    Caption = #1044#1072#1090#1072', '#1085#1072' '#1082#1086#1090#1086#1088#1091#1102' '#1089#1086#1079#1076#1072#1090#1100' '#1086#1090#1095#1077#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DateTimePicker1: TDateTimePicker
    Left = 280
    Top = 16
    Width = 186
    Height = 28
    Date = 39925.986535011570000000
    Time = 39925.986535011570000000
    DateFormat = dfLong
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object RadioGroup1: TRadioGroup
    Left = 24
    Top = 56
    Width = 377
    Height = 49
    Caption = #1056#1077#1078#1080#1084' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1086#1090#1095#1077#1090#1072
    Columns = 2
    Items.Strings = (
      #1047#1072' '#1091#1082#1072#1079#1072#1085#1085#1099#1081' '#1084#1077#1089#1103#1094
      #1047#1072' '#1074#1077#1089#1100' '#1075#1086#1076)
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 480
    Top = 56
    Width = 153
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1086#1090#1095#1077#1090
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 480
    Top = 16
    Width = 153
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 3
    Kind = bkClose
  end
  object RadioGroup2: TRadioGroup
    Left = 24
    Top = 120
    Width = 377
    Height = 49
    Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
    Columns = 2
    Items.Strings = (
      #1059#1085#1080#1074#1077#1088#1089#1080#1090#1077#1090
      #1050#1086#1083#1077#1076#1078)
    TabOrder = 4
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
    Left = 16
    Top = 8
  end
  object pFIBQueryMkMP: TpFIBQuery
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    Left = 56
    Top = 8
  end
end
