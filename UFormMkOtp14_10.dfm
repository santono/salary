object FormMkOtp14_10: TFormMkOtp14_10
  Left = 275
  Top = 180
  Width = 696
  Height = 253
  Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077' 2014 '#1074' '#1086#1082#1090#1103#1073#1088#1077
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
    Left = 192
    Top = 80
    Width = 201
    Height = 25
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 408
    Top = 80
    Width = 81
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object BitBtn4: TBitBtn
    Left = 16
    Top = 80
    Width = 169
    Height = 25
    Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077
    TabOrder = 3
    OnClick = BitBtn4Click
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 120
    Width = 185
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1072#1088#1099#1077' '#1088#1072#1089#1095#1077#1090#1099
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 336
    Top = 8
  end
  object pFIBQuery1: TpFIBQuery
    Transaction = pFIBTransaction1
    Database = FIB.pFIBDatabaseSal
    Left = 288
    Top = 8
  end
end
