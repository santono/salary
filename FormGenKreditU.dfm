object FormGenKredit: TFormGenKredit
  Left = 201
  Top = 172
  Width = 696
  Height = 191
  Caption = #1043#1077#1085#1077#1088#1094#1080#1103' '#1089#1087#1088#1072#1074#1082#1080' '#1076#1083#1103' '#1087#1086#1083#1091#1095#1077#1085#1080#1103' '#1082#1088#1077#1076#1080#1090#1072
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
    Left = 24
    Top = 20
    Width = 61
    Height = 20
    Caption = 'LabelFio'
  end
  object Label1: TLabel
    Left = 16
    Top = 59
    Width = 86
    Height = 20
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
  end
  object BitBtn1: TBitBtn
    Left = 592
    Top = 16
    Width = 41
    Height = 25
    Caption = '. . .'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object Edit1: TEdit
    Left = 144
    Top = 56
    Width = 489
    Height = 28
    TabOrder = 1
    Text = #1059#1082#1072#1078#1080#1090#1077' '#1076#1086#1083#1078#1078#1085#1086#1089#1090#1100' '#1076#1083#1103' '#1087#1077#1095#1072#1090#1080' '#1074' '#1089#1087#1088#1072#1074#1082#1077
  end
  object BitBtn2: TBitBtn
    Left = 24
    Top = 104
    Width = 177
    Height = 25
    Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103' '#1089#1087#1088#1072#1074#1082#1080
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 520
    Top = 96
    Width = 113
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 3
    Kind = bkClose
  end
end
