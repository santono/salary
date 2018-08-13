object FormUpdAlim: TFormUpdAlim
  Left = 242
  Top = 180
  Width = 696
  Height = 480
  Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1072#1083#1080#1084#1077#1085#1090#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 48
    Top = 8
    Width = 50
    Height = 20
    Caption = #1053#1086#1084#1077#1088
  end
  object Label2: TLabel
    Left = 8
    Top = 45
    Width = 93
    Height = 20
    Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
  end
  object Label3: TLabel
    Left = 8
    Top = 112
    Width = 247
    Height = 20
    Caption = #1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088' '#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1072' '
  end
  object Label4: TLabel
    Left = 56
    Top = 144
    Width = 38
    Height = 20
    Caption = #1060#1048#1054
  end
  object Label5: TLabel
    Left = 88
    Top = 184
    Width = 11
    Height = 20
    Caption = #1057
  end
  object Label6: TLabel
    Left = 304
    Top = 184
    Width = 18
    Height = 20
    Caption = #1087#1086
  end
  object Label7: TLabel
    Left = 8
    Top = 216
    Width = 148
    Height = 20
    Caption = #1055#1088#1086#1094#1077#1085#1090' '#1080#1083#1080' '#1089#1091#1084#1084#1072
  end
  object Label8: TLabel
    Left = 8
    Top = 248
    Width = 115
    Height = 20
    Caption = #1055#1088#1086#1094#1077#1085#1090' '#1087#1086#1095#1090#1077
  end
  object Label9: TLabel
    Left = 48
    Top = 80
    Width = 48
    Height = 20
    Caption = #1040#1076#1088#1077#1089
  end
  object SpinEditNomer: TSpinEdit
    Left = 104
    Top = 8
    Width = 73
    Height = 30
    MaxValue = 1000
    MinValue = 0
    TabOrder = 0
    Value = 0
  end
  object EditWomen: TEdit
    Left = 104
    Top = 40
    Width = 569
    Height = 28
    TabOrder = 1
    Text = 'EditWomen'
  end
  object SpinEditTabno: TSpinEdit
    Left = 256
    Top = 104
    Width = 121
    Height = 30
    MaxValue = 10000
    MinValue = 0
    TabOrder = 2
    Value = 0
  end
  object EditFIO: TEdit
    Left = 104
    Top = 136
    Width = 569
    Height = 28
    TabOrder = 3
    Text = 'EditFIO'
  end
  object DateTimePickerFr: TDateTimePicker
    Left = 104
    Top = 176
    Width = 185
    Height = 28
    Date = 39271.031694467600000000
    Time = 39271.031694467600000000
    DateFormat = dfLong
    TabOrder = 4
  end
  object DateTimePickerTo: TDateTimePicker
    Left = 328
    Top = 176
    Width = 186
    Height = 28
    Date = 39271.033142847220000000
    Time = 39271.033142847220000000
    DateFormat = dfLong
    TabOrder = 5
  end
  object RadioGroupKod: TRadioGroup
    Left = 328
    Top = 216
    Width = 225
    Height = 49
    Caption = #1056#1077#1078#1080#1084' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #1055#1088#1086#1094#1077#1085#1090
      #1057#1091#1084#1084#1072)
    TabOrder = 6
  end
  object EditAdres: TEdit
    Left = 104
    Top = 72
    Width = 569
    Height = 28
    TabOrder = 7
    Text = 'EditAdres'
  end
  object RadioGroupModePST: TRadioGroup
    Left = 48
    Top = 288
    Width = 185
    Height = 105
    Caption = #1055#1086#1095#1090#1086#1074#1099#1081' '#1089#1073#1086#1088
    Items.Strings = (
      #1051#1091#1075#1072#1085#1089#1082
      #1042#1085#1077' '#1051#1091#1075#1072#1085#1089#1082#1072
      #1050#1072#1089#1089#1072
      #1055#1088#1080#1074#1072#1090#1073#1072#1085#1082
      #1055#1088#1072#1074#1077#1082#1089#1073#1072#1085#1082)
    TabOrder = 8
  end
  object BitBtn1: TBitBtn
    Left = 56
    Top = 400
    Width = 113
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 9
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 192
    Top = 400
    Width = 97
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 10
    Kind = bkClose
  end
  object BitBtn3: TBitBtn
    Left = 384
    Top = 106
    Width = 153
    Height = 25
    Caption = #1042#1099#1073#1086#1088' '#1088#1072#1073#1086#1090#1085#1080#1082#1072
    TabOrder = 11
    OnClick = BitBtn3Click
  end
  object dxCalcEditProcent: TdxCalcEdit
    Left = 160
    Top = 216
    Width = 121
    TabOrder = 12
    Alignment = taRightJustify
    Text = '0.00'
    StoredValues = 1
  end
  object dxCalcEditProcPst: TdxCalcEdit
    Left = 160
    Top = 248
    Width = 121
    TabOrder = 13
    Alignment = taRightJustify
    Text = '0.00'
    StoredValues = 1
  end
  object pFIBQuery1: TpFIBQuery
    Transaction = pFIBTransactionWrite
    Database = FIB.pFIBDatabaseSal
    Left = 616
    Top = 8
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 648
    Top = 8
  end
end
