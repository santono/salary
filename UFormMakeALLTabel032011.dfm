object FormMakeALLTabel032011: TFormMakeALLTabel032011
  Left = 271
  Top = 310
  Width = 679
  Height = 159
  Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1090#1072#1073#1077#1083#1103' '#1074' '#1089#1077#1085#1090#1103#1073#1088#1077' 2022'
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
  object BitBtn1: TBitBtn
    Left = 16
    Top = 72
    Width = 75
    Height = 25
    Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 392
    Top = 72
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkClose
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 16
    Width = 633
    Height = 21
    TabOrder = 2
  end
  object BitBtn3: TBitBtn
    Left = 104
    Top = 72
    Width = 273
    Height = 25
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
    TabOrder = 3
    Visible = False
    OnClick = BitBtn3Click
  end
  object cxSpinEditAmntOfDay: TcxSpinEdit
    Left = 496
    Top = 72
    TabOrder = 4
    Visible = False
    Width = 121
  end
end
