object FormListDblVpl: TFormListDblVpl
  Left = 204
  Top = 147
  Width = 757
  Height = 480
  Caption = #1057#1087#1080#1089#1086#1082' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1089' '#1076#1074#1086#1081#1085#1086#1081' '#1089#1090#1072#1090#1100#1077#1081' '#1074#1099#1087#1083#1072#1090#1099
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
    741
    442)
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 634
    Top = 8
    Width = 107
    Height = 20
    Anchors = [akTop, akRight]
    Caption = #1053#1086#1084#1077#1088' '#1089#1090#1072#1090#1100#1080
  end
  object StringGridDblVpl: TStringGrid
    Left = 8
    Top = 8
    Width = 505
    Height = 393
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
  end
  object ProgressBar1: TProgressBar
    Left = 160
    Top = 408
    Width = 345
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object Button1: TButton
    Left = 8
    Top = 408
    Width = 145
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
    TabOrder = 2
    OnClick = Button1Click
  end
  object dxCalcEditSta: TdxCalcEdit
    Left = 634
    Top = 40
    Width = 105
    TabOrder = 3
    Anchors = [akTop, akRight]
    Text = '102'
  end
  object RadioGroupAdd: TRadioGroup
    Left = 544
    Top = 88
    Width = 185
    Height = 105
    Caption = #1056#1077#1078#1080#1084
    ItemIndex = 0
    Items.Strings = (
      #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103
      #1059#1076#1077#1088#1078#1072#1085#1080#1103)
    TabOrder = 4
  end
  object Mode: TGroupBox
    Left = 544
    Top = 208
    Width = 185
    Height = 97
    Caption = #1056#1077#1078#1080#1084#1099' '#1089#1088#1072#1074#1085#1077#1085#1080#1103
    TabOrder = 5
    object chkPeriod: TCheckBox
      Left = 16
      Top = 32
      Width = 161
      Height = 17
      Caption = #1089#1088#1072#1074#1085#1080#1074#1072#1090#1100' '#1084#1077#1089#1103#1094
      TabOrder = 0
    end
    object chkSumma: TCheckBox
      Left = 16
      Top = 56
      Width = 97
      Height = 17
      Caption = #1089#1088#1072#1074#1085#1080#1090#1100' '
      TabOrder = 1
    end
  end
end
