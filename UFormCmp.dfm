object FormCmp: TFormCmp
  Left = 215
  Top = 143
  Width = 768
  Height = 129
  Caption = #1057#1088#1072#1074#1085#1077#1085#1080#1077' '#1096#1090'. '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1081
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 65
    Height = 20
    Caption = '1-'#1103' '#1076#1072#1090#1072
  end
  object Label2: TLabel
    Left = 272
    Top = 8
    Width = 65
    Height = 20
    Caption = '2-'#1103' '#1076#1072#1090#1072
  end
  object DateTimePickerFr: TDateTimePicker
    Left = 80
    Top = 8
    Width = 177
    Height = 28
    Date = 41236.654500891210000000
    Time = 41236.654500891210000000
    DateFormat = dfLong
    TabOrder = 0
  end
  object DateTimePickerTo: TDateTimePicker
    Left = 368
    Top = 8
    Width = 186
    Height = 28
    Date = 41236.654810358800000000
    Time = 41236.654810358800000000
    DateFormat = dfLong
    TabOrder = 1
  end
  object RadioGroupWR: TRadioGroup
    Left = 560
    Top = 8
    Width = 185
    Height = 65
    Caption = #1056#1077#1078#1080#1084' '#1088#1072#1073#1086#1090#1099
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #1054#1089#1085
      #1057#1086#1074#1084)
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 48
    Width = 113
    Height = 25
    Caption = #1057#1088#1072#1074#1085#1080#1090#1100
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 424
    Top = 48
    Width = 105
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 4
    Kind = bkClose
  end
end
