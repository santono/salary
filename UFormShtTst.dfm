object FormShtTst: TFormShtTst
  Left = 236
  Top = 163
  Width = 606
  Height = 279
  Caption = #1058#1077#1089#1090#1099' '#1096#1090#1072#1090#1085#1086#1075#1086' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1103
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
    Left = 16
    Top = 16
    Width = 157
    Height = 20
    Caption = #1044#1072#1090#1072' '#1096#1090'.'#1088#1072#1089#1087#1080#1089#1072#1085#1080#1103
  end
  object DateTimePickerFr: TDateTimePicker
    Left = 184
    Top = 16
    Width = 186
    Height = 28
    Date = 41238.456043645840000000
    Time = 41238.456043645840000000
    DateFormat = dfLong
    TabOrder = 0
  end
  object RadioGroupWr: TRadioGroup
    Left = 400
    Top = 16
    Width = 185
    Height = 49
    Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099
    Columns = 2
    Items.Strings = (
      #1054#1089#1085'.'
      #1057#1086#1074#1084'.')
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 80
    Width = 241
    Height = 25
    Caption = #1041#1086#1083#1100#1096#1077' '#1086#1090#1076#1085#1086#1081' '#1089#1090#1072#1074#1082#1080
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 16
    Top = 112
    Width = 241
    Height = 25
    Caption = #1057#1088#1072#1074#1085#1077#1085#1080#1077' '#1087#1088#1080#1082#1072#1079#1072' '#1080' '#1079'.'#1087'.'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 272
    Top = 80
    Width = 89
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 4
    Kind = bkClose
  end
  object Button1: TButton
    Left = 272
    Top = 112
    Width = 225
    Height = 25
    Caption = #1044#1086#1094#1077#1085#1090#1099' '#1085#1072' '#1076#1088'. '#1089#1090#1072#1074#1082#1077
    TabOrder = 5
    OnClick = Button1Click
  end
  object BitBtn4: TBitBtn
    Left = 16
    Top = 144
    Width = 241
    Height = 25
    Caption = #1057#1090#1088#1086#1082' '#1076#1083#1103' '#1089#1086#1090#1088' > 1'
    TabOrder = 6
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 272
    Top = 144
    Width = 225
    Height = 25
    Caption = #1057#1087#1080#1089#1086#1082' '#1092#1080#1082#1089'. '#1074' '#1096#1090'.'#1088#1072#1089#1087'.'
    TabOrder = 7
    OnClick = BitBtn5Click
  end
end
