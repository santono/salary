object FormPrepRl: TFormPrepRl
  Left = 372
  Top = 200
  Width = 444
  Height = 280
  Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1082#1072' '#1088#1072#1089#1095#1077#1090#1085#1099#1093' '#1083#1080#1089#1090#1082#1086#1074' '
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
  object LabelFio: TLabel
    Left = 56
    Top = 104
    Width = 313
    Height = 20
    Caption = 'LabelFio'
  end
  object LabelPodr: TLabel
    Left = 8
    Top = 136
    Width = 417
    Height = 20
    Caption = 'LabelPodr'
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 168
    Width = 217
    Height = 25
    Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1080#1090#1100' '#1088#1072#1089'.'#1083#1080#1089#1090#1082#1080
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 232
    Top = 168
    Width = 193
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 200
    Width = 417
    Height = 21
    TabOrder = 2
  end
  object DateTimePicker1: TDateTimePicker
    Left = 96
    Top = 48
    Width = 186
    Height = 28
    Date = 40490.877183692130000000
    Time = 40490.877183692130000000
    DateFormat = dfLong
    TabOrder = 3
  end
end
