object FormMakeOtpChoice: TFormMakeOtpChoice
  Left = 472
  Top = 265
  Width = 401
  Height = 222
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1086#1090#1084#1077#1090#1086#1082
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 20
  object BitBtn1: TBitBtn
    Left = 16
    Top = 16
    Width = 361
    Height = 25
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081', '#1082#1072#1090#1077#1075#1086#1088#1080#1081' '#1080' '#1089#1095#1077#1090#1086#1074
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 16
    Top = 56
    Width = 361
    Height = 25
    Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1086#1090#1084#1077#1090#1082#1080
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 16
    Top = 96
    Width = 361
    Height = 25
    Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1086#1090#1084#1077#1090#1082#1080
    TabOrder = 2
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 16
    Top = 136
    Width = 361
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 3
    Kind = bkClose
  end
  object pFIBQueryOtpA: TpFIBQuery
    Transaction = pFIBTransaction1
    Database = FIB.pFIBDatabaseSal
    Left = 24
    Top = 88
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 64
    Top = 88
  end
end
