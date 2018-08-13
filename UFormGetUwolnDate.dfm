object FormGetUwolnDate: TFormGetUwolnDate
  Left = 229
  Top = 165
  Width = 411
  Height = 229
  Caption = #1055#1077#1088#1077#1085#1086#1089' '#1076#1072#1090' '#1091#1074#1086#1083#1100#1085#1077#1085#1080#1103
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
    Left = 16
    Top = 24
    Width = 344
    Height = 20
    Caption = #1052#1077#1089#1103#1094' '#1080' '#1075#1086#1076', '#1080#1079' '#1082#1086#1090#1086#1088#1086#1075#1086' '#1073#1088#1072#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102
  end
  object Label2: TLabel
    Left = 24
    Top = 104
    Width = 329
    Height = 20
    Caption = 'Label2'
  end
  object Label3: TLabel
    Left = 24
    Top = 152
    Width = 337
    Height = 20
    Caption = 'Label3'
  end
  object DateTimePicker1: TDateTimePicker
    Left = 224
    Top = 16
    Width = 145
    Height = 28
    Date = 41613.486827905090000000
    Format = 'MMMM yyyy'
    Time = 41613.486827905090000000
    DateFormat = dfLong
    DateMode = dmUpDown
    TabOrder = 0
  end
  object Button1: TButton
    Left = 24
    Top = 72
    Width = 169
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1087#1077#1088#1077#1085#1086#1089
    TabOrder = 1
    OnClick = Button1Click
  end
  object BitBtn1: TBitBtn
    Left = 216
    Top = 72
    Width = 105
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object ProgressBar1: TProgressBar
    Left = 24
    Top = 128
    Width = 329
    Height = 21
    TabOrder = 3
  end
  object pFIBQuery1: TpFIBQuery
    Transaction = pFIBTransaction1
    Database = FIB.pFIBDatabaseSal
    Left = 328
    Top = 72
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 360
    Top = 72
  end
end
