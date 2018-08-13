object FormMoveNewOkladToRazr: TFormMoveNewOkladToRazr
  Left = 226
  Top = 289
  Width = 674
  Height = 193
  Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1085#1086#1074#1099#1093' '#1086#1082#1083#1072#1076#1086#1074' '#1087#1086' '#1088#1072#1079#1088#1103#1076#1072#1084
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
    Top = 8
    Width = 564
    Height = 20
    Caption = 
      #1055#1077#1088#1077#1085#1086#1089' '#1086#1082#1083#1072#1076#1086#1074' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1074' '#1089#1086#1086#1090#1074#1077#1089#1090#1074#1080#1080' '#1089' '#1091#1082#1072#1079#1072#1085#1085#1099#1084#1080' '#1088#1072#1079#1088#1103#1076 +
      #1072#1084#1080
  end
  object Label2: TLabel
    Left = 24
    Top = 32
    Width = 426
    Height = 20
    Caption = #1041#1077#1088#1091#1090#1089#1103' '#1087#1086#1089#1083#1077#1076#1085#1080#1077' '#1076#1072#1085#1085#1099#1077' '#1087#1086' '#1086#1082#1083#1072#1076#1072#1084' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
  end
  object Label3: TLabel
    Left = 32
    Top = 64
    Width = 83
    Height = 20
    Caption = 'C '#1088#1072#1079#1088#1103#1076#1072' '
  end
  object Label4: TLabel
    Left = 176
    Top = 64
    Width = 77
    Height = 20
    Caption = #1087#1086' '#1088#1072#1079#1088#1103#1076
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 112
    Width = 177
    Height = 25
    Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1086#1082#1083#1072#1076#1099
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 224
    Top = 112
    Width = 113
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object SpinEditLoRazr: TSpinEdit
    Left = 120
    Top = 64
    Width = 49
    Height = 30
    MaxValue = 24
    MinValue = 1
    TabOrder = 2
    Value = 1
  end
  object SpinEditHiRazr: TSpinEdit
    Left = 256
    Top = 64
    Width = 73
    Height = 30
    MaxValue = 24
    MinValue = 1
    TabOrder = 3
    Value = 24
  end
  object BitBtn3: TBitBtn
    Left = 344
    Top = 64
    Width = 217
    Height = 25
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object ProgressBar1: TProgressBar
    Left = 424
    Top = 104
    Width = 161
    Height = 21
    TabOrder = 5
  end
  object cbRKoef: TCheckBox
    Left = 400
    Top = 136
    Width = 225
    Height = 17
    Caption = #1056#1072#1089#1095#1077#1090#1085#1099#1077' '#1082#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1099
    TabOrder = 6
  end
  object pFIBQuery1: TpFIBQuery
    Transaction = FIB.pFIBTransactionSAL
    Database = FIB.pFIBDatabaseSal
    Left = 352
    Top = 104
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 384
    Top = 104
  end
end
