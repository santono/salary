object FormMkEmpList: TFormMkEmpList
  Left = 194
  Top = 122
  Width = 733
  Height = 568
  Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1089#1087#1080#1089#1082#1072' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
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
  object BitBtn3: TBitBtn
    Left = 408
    Top = 80
    Width = 81
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object BitBtn4: TBitBtn
    Left = 16
    Top = 80
    Width = 377
    Height = 25
    Caption = '1. '#1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1089#1087#1080#1089#1082#1072
    TabOrder = 2
    OnClick = BitBtn4Click
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 112
    Width = 377
    Height = 25
    Caption = '2. '#1054#1089#1090#1072#1074#1080#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1086#1089#1085#1086#1074#1085#1086#1077' '#1084#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 16
    Top = 144
    Width = 377
    Height = 25
    Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1089#1087#1080#1089#1082#1072' '#1074' '#1041#1044
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object EditFName: TEdit
    Left = 16
    Top = 184
    Width = 401
    Height = 28
    TabOrder = 5
    Text = 'EditFName'
  end
  object BitBtn5: TBitBtn
    Left = 424
    Top = 184
    Width = 33
    Height = 25
    Caption = '...'
    TabOrder = 6
    OnClick = BitBtn5Click
  end
  object BitBtn6: TBitBtn
    Left = 16
    Top = 224
    Width = 385
    Height = 25
    Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1082#1086#1077#1092' =1'
    TabOrder = 7
    OnClick = BitBtn6Click
  end
  object BitBtn7: TBitBtn
    Left = 16
    Top = 256
    Width = 385
    Height = 25
    Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1074#1089#1077#1084' '#1073#1102#1076#1078#1077#1090
    TabOrder = 8
    OnClick = BitBtn7Click
  end
  object BitBtn8: TBitBtn
    Left = 16
    Top = 288
    Width = 385
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1086#1094'.'#1089#1090#1088#1072#1093' ('#1096#1080#1092#1088' 109)'
    TabOrder = 9
    OnClick = BitBtn8Click
  end
  object BitBtn9: TBitBtn
    Left = 16
    Top = 320
    Width = 385
    Height = 25
    Caption = #1055#1077#1088#1077#1074#1086#1076' '#1085#1072' '#1088#1091#1089#1089#1082#1080#1081' '#1103#1079#1099#1082
    TabOrder = 10
    OnClick = BitBtn9Click
  end
  object Button1: TButton
    Left = 16
    Top = 352
    Width = 385
    Height = 25
    Caption = #1055#1086#1078#1077#1083#1090#1080#1090#1100' '#1074#1089#1077#1093
    TabOrder = 11
    OnClick = Button1Click
  end
  object BitBtn10: TBitBtn
    Left = 16
    Top = 384
    Width = 385
    Height = 25
    Caption = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090' '#1086#1082#1083#1072#1076#1086#1074' '#1076#1086' 10-11 1-6 '#1088#1072#1079#1088
    TabOrder = 12
    OnClick = BitBtn10Click
  end
  object BitBtn11: TBitBtn
    Left = 16
    Top = 416
    Width = 377
    Height = 25
    Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1079#1072' '#1089#1077#1085#1090#1103#1073#1088#1100
    TabOrder = 13
    OnClick = BitBtn11Click
  end
  object BitBtn12: TBitBtn
    Left = 16
    Top = 448
    Width = 377
    Height = 25
    Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1089#1077#1085#1090' 14 '#1080#1093' '#1041#1044
    TabOrder = 14
    OnClick = BitBtn12Click
  end
  object BitBtn13: TBitBtn
    Left = 408
    Top = 352
    Width = 305
    Height = 25
    Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1090#1072#1073#1077#1083#1103' '#1091#1074#1086#1083#1100#1085#1103#1077#1084#1099#1093
    TabOrder = 15
    OnClick = BitBtn13Click
  end
  object BitBtn14: TBitBtn
    Left = 16
    Top = 480
    Width = 377
    Height = 25
    Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1086#1092#1089#1086#1102#1079' '#1074#1089#1077#1084
    TabOrder = 16
    OnClick = BitBtn14Click
  end
  object btn1: TBitBtn
    Left = 408
    Top = 384
    Width = 233
    Height = 25
    Caption = #1055#1077#1088#1077#1074#1086#1076' '#1082#1086#1087#1077#1077#1082' '#1074' '#1088#1091#1073#1083#1080
    TabOrder = 17
    OnClick = btn1Click
  end
  object BitBtn15: TBitBtn
    Left = 400
    Top = 480
    Width = 265
    Height = 25
    Caption = #1059#1073#1088#1072#1090#1100' '#1087#1088#1086#1092#1089#1086#1102#1079' '#1091' '#1074#1089#1077#1093
    TabOrder = 18
    OnClick = BitBtn15Click
  end
  object BitBtn16: TBitBtn
    Left = 408
    Top = 416
    Width = 241
    Height = 25
    Caption = #1055#1077#1088#1077#1085#1086#1089' '#1087#1088#1077#1084#1080#1080' '#1074' 10 2021'
    TabOrder = 19
    OnClick = BitBtn16Click
  end
  object BitBtn17: TBitBtn
    Left = 408
    Top = 448
    Width = 241
    Height = 25
    Caption = #1055#1077#1088#1077#1074#1086#1076' '#1092#1072#1084#1080#1083#1080#1081' '#1085#1072' '#1088#1091#1089'.'#1103#1079
    TabOrder = 20
    OnClick = BitBtn17Click
  end
  object btnMov0416: TButton
    Left = 408
    Top = 320
    Width = 265
    Height = 25
    Caption = #1055#1077#1088#1077#1085#1086#1089' '#1076#1086#1087#1083' '#1076#1086' '#1084#1080#1085' '#1074' 156'
    TabOrder = 21
    OnClick = btnMov0416Click
  end
  object BitBtn18: TBitBtn
    Left = 408
    Top = 288
    Width = 305
    Height = 25
    Caption = #1055#1077#1088#1077#1085#1086#1089' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1072' '#1086#1090#1087#1091#1089#1082#1085#1099#1093' '#1074' 2021'
    TabOrder = 22
    OnClick = BitBtn18Click
  end
  object BitBtn19: TBitBtn
    Left = 408
    Top = 256
    Width = 281
    Height = 25
    Caption = #1048#1084#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1080#1079' '#1048#1057#1059' '#1080' '#1046#1050#1061
    TabOrder = 23
    OnClick = BitBtn19Click
  end
  object BitBtn20: TBitBtn
    Left = 408
    Top = 224
    Width = 305
    Height = 25
    Caption = #1057#1087#1080#1089#1086#1082' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1086#1074' '#1086#1090#1087#1091#1089#1082#1085#1099#1093' '#1079#1072' 2015'
    TabOrder = 24
    OnClick = BitBtn20Click
  end
  object pFIBQuery1: TpFIBQuery
    Transaction = pFIBTransaction1
    Database = FIB.pFIBDatabaseSal
    Left = 208
    Top = 56
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 248
    Top = 56
  end
  object OpenDialog1: TOpenDialog
    Left = 464
    Top = 184
  end
end
