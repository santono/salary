object FormAskData: TFormAskData
  Left = 249
  Top = 163
  Width = 379
  Height = 196
  Caption = #1059#1082#1072#1078#1080#1090#1077' '#1076#1072#1090#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DateTimePickerData: TDateTimePicker
    Left = 56
    Top = 32
    Width = 186
    Height = 28
    Date = 42552.816578587960000000
    Format = 'MMMM yyyy'
    Time = 42552.816578587960000000
    DateFormat = dfLong
    DateMode = dmUpDown
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxDate = 43465.000000000000000000
    MinDate = 40909.000000000000000000
    ParentFont = False
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 88
    Width = 75
    Height = 25
    Caption = #1042#1099#1073#1086#1088
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 232
    Top = 88
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
end
