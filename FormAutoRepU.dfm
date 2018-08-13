object FormAutoRep: TFormAutoRep
  Left = 271
  Top = 148
  Width = 483
  Height = 184
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1087#1088#1086#1080#1079#1074#1086#1083#1100#1085#1086#1075#1086' '#1086#1090#1095#1077#1090#1072
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
    Top = 12
    Width = 11
    Height = 20
    Caption = #1057
  end
  object Label2: TLabel
    Left = 231
    Top = 12
    Width = 18
    Height = 20
    Caption = #1087#1086
  end
  object BitBtn1: TBitBtn
    Left = 40
    Top = 104
    Width = 401
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 0
    Kind = bkClose
  end
  object BitBtn2: TBitBtn
    Left = 40
    Top = 72
    Width = 401
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1086#1090#1095#1077#1090
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object DateFr: TDateTimePicker
    Left = 40
    Top = 8
    Width = 186
    Height = 28
    Date = 39397.582945057870000000
    Time = 39397.582945057870000000
    DateFormat = dfLong
    TabOrder = 2
  end
  object DateTo: TDateTimePicker
    Left = 256
    Top = 8
    Width = 186
    Height = 28
    Date = 39397.584850983800000000
    Time = 39397.584850983800000000
    DateFormat = dfLong
    TabOrder = 3
  end
  object BitBtn3: TBitBtn
    Left = 40
    Top = 40
    Width = 401
    Height = 25
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object pFIBQuery: TpFIBQuery
    Transaction = FIB.pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    Left = 48
    Top = 40
  end
end
