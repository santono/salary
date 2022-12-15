object FormRepPlanSowmVne: TFormRepPlanSowmVne
  Left = 203
  Top = 265
  Width = 657
  Height = 283
  Caption = #1057#1087#1080#1089#1086#1082' '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1077#1081
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
  object Label2: TLabel
    Left = 16
    Top = 32
    Width = 11
    Height = 20
    Caption = 'C'
  end
  object LabelFio: TLabel
    Left = 24
    Top = 176
    Width = 61
    Height = 20
    Caption = 'LabelFio'
  end
  object Label1: TLabel
    Left = 224
    Top = 32
    Width = 18
    Height = 20
    Caption = #1087#1086
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 120
    Width = 185
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1086#1090#1095#1077#1090
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 224
    Top = 120
    Width = 91
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object dtFr: TDateTimePicker
    Left = 32
    Top = 24
    Width = 186
    Height = 28
    Date = 42103.810000277780000000
    Time = 42103.810000277780000000
    DateFormat = dfLong
    TabOrder = 2
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 152
    Width = 609
    Height = 17
    TabOrder = 3
  end
  object dtTo: TDateTimePicker
    Left = 248
    Top = 24
    Width = 186
    Height = 28
    Date = 44839.882660775460000000
    Time = 44839.882660775460000000
    DateFormat = dfLong
    TabOrder = 4
  end
  object rgMode: TRadioGroup
    Left = 24
    Top = 56
    Width = 529
    Height = 57
    Caption = #1044#1086#1075#1086#1074#1086#1088#1072' '#1087#1086#1076#1088#1103#1076#1072
    Columns = 3
    Items.Strings = (
      #1042#1089#1077' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
      #1058#1086#1083#1100#1082#1086' '#1076#1086#1075#1086#1074#1086#1088#1072
      #1041#1077#1079' '#1076#1086#1075#1086#1074#1086#1088#1086#1074)
    TabOrder = 5
  end
end
