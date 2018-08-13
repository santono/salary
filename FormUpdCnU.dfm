object FormUpdCN: TFormUpdCN
  Left = 211
  Top = 187
  Width = 591
  Height = 300
  Caption = #1055#1086#1089#1090
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
    Left = 8
    Top = 8
    Width = 561
    Height = 193
    DefaultRowHeight = 30
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Strings.Strings = (
      #1057#1090#1072#1090#1100#1103'='
      #1050#1086#1076'='
      #1057#1091#1084#1084#1072'='
      #1055#1088#1080#1084'='
      #1055#1088#1080#1084' 1=')
    TabOrder = 0
    TitleCaptions.Strings = (
      #1055#1072#1088#1072#1084#1077#1090#1088
      #1047#1085#1072#1095#1077#1085#1080#1077)
    OnGetPickList = ValueListEditor1GetPickList
    OnStringsChange = ValueListEditor1StringsChange
    OnValidate = ValueListEditor1Validate
    ColWidths = (
      100
      455)
  end
  object BitBtn1: TBitBtn
    Left = 176
    Top = 216
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkClose
  end
  object BitBtn2: TBitBtn
    Left = 24
    Top = 216
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = BitBtn2Click
  end
end
