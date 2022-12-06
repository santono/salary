object FormMakeOkr: TFormMakeOkr
  Left = 198
  Top = 160
  Width = 696
  Height = 149
  Caption = #1054#1082#1088#1091#1075#1083#1077#1085#1080#1077' '#1089#1091#1084#1084
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 40
    Width = 48
    Height = 13
    Caption = 'LabelPodr'
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 64
    Width = 161
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1086#1082#1088#1091#1075#1083#1077#1085#1080#1077
    TabOrder = 0
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 184
    Top = 64
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 16
    Width = 665
    Height = 17
    TabOrder = 2
  end
end
