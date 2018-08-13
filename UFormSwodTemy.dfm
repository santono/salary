object FormSwodTemy: TFormSwodTemy
  Left = 266
  Top = 294
  Width = 558
  Height = 305
  Caption = #1057#1074#1086#1076' '#1087#1086' '#1090#1077#1084#1072#1084
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
    Top = 56
    Width = 8
    Height = 20
    Caption = #1089
  end
  object Label2: TLabel
    Left = 288
    Top = 56
    Width = 18
    Height = 20
    Caption = #1087#1086
  end
  object ProgressBar: TProgressBar
    Left = 16
    Top = 16
    Width = 513
    Height = 21
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 160
    Width = 513
    Height = 25
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081', '#1082#1072#1090#1077#1075#1086#1088#1080#1081' '#1080' '#1089#1095#1077#1090#1086#1074
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 8
    Top = 192
    Width = 513
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1086#1090#1095#1077#1090#1072
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 8
    Top = 224
    Width = 513
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 3
    Kind = bkClose
  end
  object dtFrom: TDateTimePicker
    Left = 32
    Top = 48
    Width = 186
    Height = 28
    Date = 42033.783935115740000000
    Time = 42033.783935115740000000
    DateFormat = dfLong
    TabOrder = 4
  end
  object dtTo: TDateTimePicker
    Left = 328
    Top = 48
    Width = 186
    Height = 28
    Date = 42033.784003935190000000
    Time = 42033.784003935190000000
    DateFormat = dfLong
    TabOrder = 5
  end
  object rgMode: TRadioGroup
    Left = 24
    Top = 88
    Width = 153
    Height = 49
    Caption = #1056#1077#1078#1080#1084
    Columns = 2
    Items.Strings = (
      #1074
      #1079#1072)
    TabOrder = 6
  end
end
