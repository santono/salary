object FormMovUkrFIO: TFormMovUkrFIO
  Left = 192
  Top = 142
  Width = 696
  Height = 287
  Caption = 'FormMovUkrFIO'
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
    Left = 88
    Top = 24
    Width = 11
    Height = 20
    Caption = 'C'
  end
  object Label2: TLabel
    Left = 304
    Top = 24
    Width = 18
    Height = 20
    Caption = #1087#1086
  end
  object LabelPodr: TLabel
    Left = 32
    Top = 56
    Width = 72
    Height = 20
    Caption = 'LabelPodr'
  end
  object LabelFio: TLabel
    Left = 32
    Top = 104
    Width = 61
    Height = 20
    Caption = 'LabelFio'
  end
  object LabelMonth: TLabel
    Left = 32
    Top = 168
    Width = 84
    Height = 20
    Caption = 'LabelMonth'
  end
  object DateTimePickerFr: TDateTimePicker
    Left = 104
    Top = 16
    Width = 186
    Height = 28
    Date = 39341.604300844900000000
    Time = 39341.604300844900000000
    DateFormat = dfLong
    MaxDate = 39814.000000000000000000
    MinDate = 33239.000000000000000000
    TabOrder = 0
  end
  object DateTimePickerTo: TDateTimePicker
    Left = 328
    Top = 16
    Width = 186
    Height = 28
    Date = 39341.606143842590000000
    Time = 39341.606143842590000000
    DateFormat = dfLong
    MaxDate = 39814.000000000000000000
    MinDate = 33239.000000000000000000
    TabOrder = 1
  end
  object ProgressBar1: TProgressBar
    Left = 32
    Top = 80
    Width = 641
    Height = 21
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 192
    Width = 137
    Height = 25
    Caption = #1050#1086#1085#1074#1077#1088#1090#1072#1094#1080#1103
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 592
    Top = 192
    Width = 75
    Height = 25
    TabOrder = 4
    Kind = bkClose
  end
  object ProgressBar2: TProgressBar
    Left = 32
    Top = 144
    Width = 641
    Height = 21
    TabOrder = 5
  end
  object BitBtn3: TBitBtn
    Left = 176
    Top = 192
    Width = 225
    Height = 25
    Caption = #1048#1089#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1092#1072#1084#1080#1083#1080#1081
    TabOrder = 6
    OnClick = BitBtn3Click
  end
end
