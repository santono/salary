object FormRepBolnPlan: TFormRepBolnPlan
  Left = 216
  Top = 290
  Width = 657
  Height = 283
  Caption = #1057#1074#1086#1076' '#1087#1086' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1084'  '#1076#1083#1103' '#1087#1083#1072#1085#1086#1074#1086#1075#1086
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
  object Label2: TLabel
    Left = 16
    Top = 32
    Width = 11
    Height = 20
    Caption = #1042
    Visible = False
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 64
    Width = 273
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1086#1090#1095#1077#1090' '#1091#1085#1080#1074#1077#1088#1089#1080#1090#1077#1090
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 528
    Top = 64
    Width = 91
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object dtIn: TDateTimePicker
    Left = 32
    Top = 24
    Width = 186
    Height = 28
    Date = 42103.810000277780000000
    Time = 42103.810000277780000000
    DateFormat = dfLong
    TabOrder = 2
    Visible = False
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 152
    Width = 609
    Height = 17
    TabOrder = 3
  end
  object Button1: TButton
    Left = 16
    Top = 104
    Width = 273
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1086#1090#1095#1077#1090' '#1082#1086#1083#1083#1077#1076#1078
    TabOrder = 4
    OnClick = Button1Click
  end
end
