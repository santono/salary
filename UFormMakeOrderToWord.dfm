object FormMakeOrderToWord: TFormMakeOrderToWord
  Left = 219
  Top = 239
  Width = 696
  Height = 195
  Caption = #1055#1077#1088#1077#1085#1086#1089' '#1074' MSWord'
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
  object LabelVar: TLabel
    Left = 248
    Top = 48
    Width = 104
    Height = 20
    Caption = '                          '
  end
  object LabelPodrFIO: TLabel
    Left = 16
    Top = 0
    Width = 652
    Height = 20
    Caption = 
      '                                                                ' +
      '                                                                ' +
      '                                   '
  end
  object ProgressBarOrder: TProgressBar
    Left = 8
    Top = 24
    Width = 665
    Height = 21
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 104
    Width = 145
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' Word'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 584
    Top = 104
    Width = 83
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object CheckBoxVisible: TCheckBox
    Left = 176
    Top = 112
    Width = 393
    Height = 17
    Caption = #1042#1080#1079#1091#1072#1083#1080#1079#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1086#1094#1077#1089#1089' ('#1084#1077#1076#1083#1077#1085#1085#1072#1103' '#1088#1072#1073#1086#1090#1072')'
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object rgModeFac: TRadioGroup
    Left = 16
    Top = 48
    Width = 441
    Height = 49
    Caption = #1056#1077#1078#1080#1084' '#1075#1077#1085#1077#1088#1072#1094#1080#1080
    Columns = 3
    Items.Strings = (
      #1050#1072#1092#1077#1076#1088#1099
      #1044#1077#1082#1072#1085#1099
      #1047#1072#1084#1076#1077#1082#1072#1085#1099)
    TabOrder = 4
  end
  object WA_Ord: TWordApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 192
    Top = 88
  end
  object WD_Ord: TWordDocument
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 232
    Top = 88
  end
  object WordFont1: TWordFont
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 272
    Top = 96
  end
  object WordParagraphFormat1: TWordParagraphFormat
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 312
    Top = 96
  end
end
