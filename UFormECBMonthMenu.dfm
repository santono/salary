object FormECBMonthMenu: TFormECBMonthMenu
  Left = 381
  Top = 270
  Width = 341
  Height = 282
  Caption = #1045#1057#1042' '#1077#1078#1077#1084#1077#1089#1103#1095#1085#1099#1081
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
  object LabelD: TLabel
    Left = 16
    Top = 8
    Width = 51
    Height = 20
    Caption = 'LabelD'
  end
  object DateTimePicker1: TDateTimePicker
    Left = 16
    Top = 32
    Width = 186
    Height = 28
    Date = 40580.802782118060000000
    Time = 40580.802782118060000000
    DateFormat = dfLong
    TabOrder = 0
    OnChange = DateTimePicker1Change
  end
  object BitBtn1: TBitBtn
    Left = 168
    Top = 200
    Width = 153
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object BitBtn2: TBitBtn
    Left = 168
    Top = 72
    Width = 153
    Height = 25
    Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 168
    Top = 104
    Width = 153
    Height = 25
    Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' DBF'
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 168
    Top = 136
    Width = 153
    Height = 25
    Caption = #1048#1084#1087#1086#1088#1090' '#1044#1056#1060#1054
    TabOrder = 4
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 8
    Top = 200
    Width = 153
    Height = 25
    Caption = #1058#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077
    TabOrder = 5
    OnClick = BitBtn5Click
  end
  object btnExportExcel: TBitBtn
    Left = 168
    Top = 168
    Width = 153
    Height = 25
    Caption = #1069#1082#1089#1087#1086#1088#1090' Excel'
    TabOrder = 6
    OnClick = btnExportExcelClick
  end
  object pFIBQuery1: TpFIBQuery
    Transaction = pFIBTransaction1
    Database = FIB.pFIBDatabaseSal
    Left = 208
    Top = 32
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 248
    Top = 32
  end
end
