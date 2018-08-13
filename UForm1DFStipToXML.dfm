object Form1DFStipToXML: TForm1DFStipToXML
  Left = 195
  Top = 351
  Width = 658
  Height = 185
  Caption = #1050#1086#1085#1074#1077#1088#1090#1072#1094#1080#1103' '#1089#1090#1080#1087#1077#1085#1076#1080#1080' '#1080#1079' DBF '#1074' XML'
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
  object Label1: TLabel
    Left = 208
    Top = 48
    Width = 18
    Height = 13
    Caption = #1043#1086#1076
  end
  object Label2: TLabel
    Left = 8
    Top = 80
    Width = 105
    Height = 13
    Caption = #1044#1072#1090#1072' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103
  end
  object FNameEdit: TEdit
    Left = 8
    Top = 8
    Width = 473
    Height = 21
    TabOrder = 0
    Text = 'FNameEdit'
  end
  object BitBtn1: TBitBtn
    Left = 488
    Top = 8
    Width = 75
    Height = 25
    Caption = #1060#1072#1081#1083
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object rgKwartal: TRadioGroup
    Left = 16
    Top = 40
    Width = 185
    Height = 33
    Caption = #1050#1074#1072#1088#1090#1072#1083
    Columns = 4
    Items.Strings = (
      '1'
      '2'
      '3'
      '4')
    TabOrder = 2
  end
  object cxYear: TcxCalcEdit
    Left = 240
    Top = 48
    EditValue = 0.000000000000000000
    TabOrder = 3
    Width = 121
  end
  object DateTimePicker1: TDateTimePicker
    Left = 120
    Top = 80
    Width = 161
    Height = 21
    Date = 42194.412283113420000000
    Time = 42194.412283113420000000
    DateFormat = dfLong
    TabOrder = 4
  end
  object BitBtn2: TBitBtn
    Left = 16
    Top = 112
    Width = 97
    Height = 25
    Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 128
    Top = 112
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 6
    Kind = bkClose
  end
  object OpenDialog1: TOpenDialog
    Left = 568
    Top = 8
  end
end
