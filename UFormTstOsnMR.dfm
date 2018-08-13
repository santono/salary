object FormTstOsnMR: TFormTstOsnMR
  Left = 258
  Top = 177
  Width = 671
  Height = 149
  Caption = #1055#1088#1086#1074#1077#1088#1082#1072' c'#1089#1099#1083#1086#1082' '#1085#1072' '#1086#1089#1085#1086#1074#1085#1086#1077' '#1084#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099
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
  object LabelPodr: TLabel
    Left = 24
    Top = 40
    Width = 72
    Height = 20
    Caption = 'LabelPodr'
  end
  object LabelFIO: TLabel
    Left = 384
    Top = 40
    Width = 61
    Height = 20
    Caption = 'LabelFio'
  end
  object Button1: TButton
    Left = 24
    Top = 64
    Width = 129
    Height = 25
    Caption = #1053#1072#1095#1072#1090#1100' '#1090#1077#1089#1090
    TabOrder = 0
    OnClick = Button1Click
  end
  object BitBtn1: TBitBtn
    Left = 536
    Top = 64
    Width = 89
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 16
    Width = 609
    Height = 17
    TabOrder = 2
  end
end
