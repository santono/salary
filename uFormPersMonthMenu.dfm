object FormPersMonthMenu: TFormPersMonthMenu
  Left = 240
  Top = 177
  Width = 325
  Height = 274
  Caption = #1045#1078#1077#1084#1077#1089#1103#1095#1085#1072#1103' '#1087#1077#1088#1089#1086#1085#1086#1092#1080#1082#1072#1094#1080#1103' '#1089' '#1103#1085#1074#1072#1088#1103' 2010 '#1075'.'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 20
  object LabelD: TLabel
    Left = 32
    Top = 8
    Width = 51
    Height = 20
    Caption = 'LabelD'
  end
  object DateTimePicker1: TDateTimePicker
    Left = 32
    Top = 40
    Width = 186
    Height = 28
    Date = 40221.818714189820000000
    Time = 40221.818714189820000000
    TabOrder = 0
    OnChange = DateTimePicker1Change
  end
  object BitBtn4: TBitBtn
    Left = 8
    Top = 184
    Width = 121
    Height = 25
    Caption = #1058#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077
    TabOrder = 1
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 144
    Top = 88
    Width = 145
    Height = 25
    Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103
    TabOrder = 2
    OnClick = BitBtn5Click
  end
  object BitBtn6: TBitBtn
    Left = 144
    Top = 120
    Width = 145
    Height = 25
    Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' DBF'
    TabOrder = 3
    OnClick = BitBtn6Click
  end
  object BitBtn7: TBitBtn
    Left = 144
    Top = 184
    Width = 145
    Height = 25
    Caption = '&'#1047#1072#1082#1088#1099#1090#1100
    TabOrder = 4
    Kind = bkClose
  end
  object BitBtn8: TBitBtn
    Left = 144
    Top = 152
    Width = 145
    Height = 25
    Caption = #1048#1084#1087#1086#1088#1090' DRFO'
    TabOrder = 5
    OnClick = BitBtn8Click
  end
  object pFIBQuery1: TpFIBQuery
    Transaction = pFIBTransaction1
    Database = FIB.pFIBDatabaseSal
    Left = 224
    Top = 40
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 256
    Top = 40
  end
end
