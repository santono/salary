object FormTstGruPrsnAddUd: TFormTstGruPrsnAddUd
  Left = 192
  Top = 142
  Width = 696
  Height = 480
  Caption = #1055#1086#1080#1089#1082' '#1085#1077#1089#1086#1074#1087#1072#1076#1077#1085#1080#1103' '#1089#1095#1077#1090#1086#1074' F2 '#1080' '#1085#1072#1095#1080#1089#1083'-'#1091#1076#1077#1088#1078
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    680
    442)
  PixelsPerInch = 96
  TextHeight = 20
  object LabelPodr: TLabel
    Left = 352
    Top = 384
    Width = 4
    Height = 20
  end
  object Button1: TButton
    Left = 8
    Top = 408
    Width = 153
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
    TabOrder = 0
    OnClick = Button1Click
  end
  object ProgressBar1: TProgressBar
    Left = 168
    Top = 408
    Width = 457
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object StringGridL: TStringGrid
    Left = 8
    Top = 8
    Width = 665
    Height = 361
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 8
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    TabOrder = 2
  end
  object CheckBoxC: TCheckBox
    Left = 8
    Top = 384
    Width = 337
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = #1048#1089#1087#1088#1072#1074#1083#1103#1090#1100' '#1085#1072#1081#1076#1077#1085#1085#1099#1077' '#1085#1077#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1103
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
end
