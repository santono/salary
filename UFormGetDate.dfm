object FormGetDate: TFormGetDate
  Left = 394
  Top = 268
  Width = 254
  Height = 225
  Caption = #1042#1074#1086#1076' '#1076#1072#1090#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DateTimePicker1: TDateTimePicker
    Left = 40
    Top = 16
    Width = 153
    Height = 28
    Date = 40655.904678090280000000
    Format = 'MMMM yyyy'
    Time = 40655.904678090280000000
    DateFormat = dfLong
    DateMode = dmUpDown
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 96
    Width = 81
    Height = 25
    Caption = #1056#1072#1089#1095#1077#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 128
    Top = 96
    Width = 89
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Kind = bkClose
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 56
    Width = 225
    Height = 33
    Caption = #1056#1077#1078#1080#1084
    Columns = 3
    Items.Strings = (
      #1055#1088#1086#1094' '
      #1055#1086#1083#1085
      #1040#1074#1090)
    TabOrder = 3
  end
  object Button1: TButton
    Left = 40
    Top = 136
    Width = 169
    Height = 25
    Caption = #1053#1086#1074#1099#1081' '#1088#1072#1089#1095#1077#1090
    Enabled = False
    TabOrder = 4
    Visible = False
    OnClick = Button1Click
  end
end
