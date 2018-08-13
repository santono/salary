object FormUpdateUd: TFormUpdateUd
  Left = 382
  Top = 271
  Width = 524
  Height = 240
  Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1091#1076#1077#1088#1078#1072#1085#1080#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ValueListEditor1: TValueListEditor
    Left = 24
    Top = 16
    Width = 481
    Height = 137
    DefaultRowHeight = 25
    DropDownRows = 15
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Strings.Strings = (
      #1057#1090#1072#1090#1100#1103'='
      #1057#1091#1084#1084#1072'='
      #1052#1077#1089#1103#1094'='
      #1043#1086#1076'=')
    TabOrder = 0
    TitleCaptions.Strings = (
      #1055#1072#1088#1072#1084#1077#1090#1088
      #1047#1085#1072#1095#1077#1085#1080#1077)
    OnGetPickList = ValueListEditor1GetPickList
    OnValidate = ValueListEditor1Validate
    ColWidths = (
      109
      366)
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 168
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 120
    Top = 168
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkClose
  end
end
