object FormSBSUpd: TFormSBSUpd
  Left = 287
  Top = 156
  Width = 696
  Height = 480
  Caption = #1057#1087#1088#1072#1074#1082#1072' '#1085#1072' '#1089#1091#1073#1089#1080#1076#1080#1102
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object LabelFIO: TLabel
    Left = 16
    Top = 8
    Width = 27
    Height = 20
    Caption = 'FIO'
  end
  object Label1: TLabel
    Left = 16
    Top = 40
    Width = 161
    Height = 20
    Caption = #1057#1087#1088#1072#1074#1082#1072' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1089' '
  end
  object Label2: TLabel
    Left = 384
    Top = 40
    Width = 18
    Height = 20
    Caption = #1087#1086
  end
  object Label3: TLabel
    Left = 16
    Top = 80
    Width = 196
    Height = 20
    Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#1082#1086#1076
  end
  object Label4: TLabel
    Left = 16
    Top = 120
    Width = 108
    Height = 20
    Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099
  end
  object LabelNamePod: TLabel
    Left = 224
    Top = 120
    Width = 124
    Height = 20
    Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
  end
  object Label5: TLabel
    Left = 16
    Top = 152
    Width = 86
    Height = 20
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
  end
  object LabelPeriod: TLabel
    Left = 48
    Top = 192
    Width = 59
    Height = 20
    Caption = #1055#1077#1088#1080#1086#1076
  end
  object Label6: TLabel
    Left = 24
    Top = 232
    Width = 83
    Height = 20
    Caption = #1055#1088#1086#1088#1077#1082#1090#1086#1088
  end
  object Label7: TLabel
    Left = 8
    Top = 272
    Width = 99
    Height = 20
    Caption = #1043#1083'.'#1073#1091#1093#1075#1072#1083#1090#1077#1088
  end
  object Label8: TLabel
    Left = 24
    Top = 312
    Width = 78
    Height = 20
    Caption = #1041#1091#1093#1075#1072#1083#1090#1077#1088
  end
  object Label9: TLabel
    Left = 56
    Top = 360
    Width = 49
    Height = 20
    Caption = #1057#1091#1084#1084#1072
  end
  object Label10: TLabel
    Left = 256
    Top = 360
    Width = 29
    Height = 20
    Caption = #1075#1088#1085'.'
  end
  object BitBtnFIO: TBitBtn
    Left = 576
    Top = 8
    Width = 97
    Height = 25
    Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
    TabOrder = 0
    OnClick = BitBtnFIOClick
  end
  object DateTimePickerFr: TDateTimePicker
    Left = 184
    Top = 40
    Width = 193
    Height = 28
    Date = 40440.953966493060000000
    Time = 40440.953966493060000000
    DateFormat = dfLong
    MaxDate = 54789.000000000000000000
    MinDate = 33239.000000000000000000
    TabOrder = 1
  end
  object DateTimePickerTo: TDateTimePicker
    Left = 408
    Top = 40
    Width = 186
    Height = 28
    Date = 40440.955282025460000000
    Time = 40440.955282025460000000
    DateFormat = dfLong
    TabOrder = 2
  end
  object BitBtnNew: TBitBtn
    Left = 8
    Top = 408
    Width = 121
    Height = 25
    Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103
    TabOrder = 3
    OnClick = BitBtnNewClick
  end
  object MaskEditNal_Code: TMaskEdit
    Left = 224
    Top = 80
    Width = 169
    Height = 28
    TabOrder = 4
  end
  object EditNameDol: TEdit
    Left = 112
    Top = 152
    Width = 561
    Height = 28
    TabOrder = 5
  end
  object EditPeriod: TEdit
    Left = 112
    Top = 192
    Width = 273
    Height = 28
    TabOrder = 6
  end
  object EditProrektor: TEdit
    Left = 112
    Top = 232
    Width = 273
    Height = 28
    TabOrder = 7
  end
  object EditGlBuhName: TEdit
    Left = 112
    Top = 272
    Width = 273
    Height = 28
    TabOrder = 8
  end
  object EditBuhName: TEdit
    Left = 112
    Top = 312
    Width = 273
    Height = 28
    TabOrder = 9
  end
  object EditSumma: TEdit
    Left = 112
    Top = 352
    Width = 137
    Height = 28
    TabOrder = 10
  end
  object dxCalcEditShifrPod: TdxCalcEdit
    Left = 128
    Top = 120
    Width = 89
    TabOrder = 11
    Text = '0'
  end
  object RadioGroupMode_Vy_Za: TRadioGroup
    Left = 400
    Top = 192
    Width = 185
    Height = 49
    Caption = #1056#1077#1078#1080#1084
    Columns = 2
    ItemIndex = 1
    Items.Strings = (
      #1079#1072
      #1074)
    TabOrder = 12
  end
  object BitBtn1: TBitBtn
    Left = 136
    Top = 408
    Width = 113
    Height = 25
    Caption = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090
    TabOrder = 13
    OnClick = BitBtn1Click
  end
  object ButtonSave: TButton
    Left = 256
    Top = 408
    Width = 113
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 14
    OnClick = ButtonSaveClick
  end
  object pFIBTransactionSBS: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 160
    Top = 8
  end
  object pFIBQuery: TpFIBQuery
    Transaction = pFIBTransactionSBS
    Database = FIB.pFIBDatabaseSal
    Left = 192
    Top = 8
  end
end
