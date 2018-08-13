object FormSwodKafGru: TFormSwodKafGru
  Left = 192
  Top = 142
  Width = 696
  Height = 480
  Caption = #1057#1074#1086#1076' '#1087#1086' '#1082#1072#1092#1077#1076#1088#1072#1084' '#1080' '#1089#1095#1077#1090#1072#1084
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 20
  object GaugePodr: TGauge
    Left = 24
    Top = 32
    Width = 649
    Height = 25
    ForeColor = clYellow
    Progress = 0
  end
  object LabelKaf: TLabel
    Left = 24
    Top = 8
    Width = 63
    Height = 20
    Caption = 'LabelKaf'
  end
  object GaugePerson: TGauge
    Left = 24
    Top = 64
    Width = 100
    Height = 100
    BorderStyle = bsNone
    ForeColor = clYellow
    Kind = gkPie
    Progress = 0
  end
  object BitBtn1: TBitBtn
    Left = 144
    Top = 64
    Width = 161
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1074#1086#1076
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 144
    Top = 104
    Width = 161
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object CheckBox1: TCheckBox
    Left = 328
    Top = 64
    Width = 281
    Height = 17
    Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1077' '#1080' '#1082#1072#1089#1089#1091
    Checked = True
    State = cbChecked
    TabOrder = 2
  end
end
