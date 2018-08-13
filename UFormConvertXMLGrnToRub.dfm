object FormConvertXMLGrnToRub: TFormConvertXMLGrnToRub
  Left = 216
  Top = 165
  Width = 573
  Height = 137
  Caption = #1050#1086#1085#1074#1077#1088#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1075#1088#1080#1074#1077#1085' '#1074' '#1088#1091#1073#1083#1080' '#1076#1083#1103' '#1045#1057#1042' '#1092#1086#1088#1084#1072' 6'
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
    Left = 8
    Top = 16
    Width = 449
    Height = 20
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 464
    Top = 16
    Width = 33
    Height = 25
    Caption = '. . .'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 8
    Top = 56
    Width = 113
    Height = 25
    Caption = #1050#1086#1085#1074#1077#1088#1090#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 128
    Top = 56
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object OpenDialog1: TOpenDialog
    Left = 504
    Top = 16
  end
end
