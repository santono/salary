object FormTestRecalcPerson: TFormTestRecalcPerson
  Left = 254
  Top = 198
  Width = 553
  Height = 185
  Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1072' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
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
  object Label1: TLabel
    Left = 32
    Top = 8
    Width = 369
    Height = 13
    Caption = 'Label1'
  end
  object DateTimePicker1: TDateTimePicker
    Left = 72
    Top = 32
    Width = 186
    Height = 21
    Date = 39279.810144305560000000
    Time = 39279.810144305560000000
    DateFormat = dfLong
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 72
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 120
    Top = 72
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkClose
  end
end
