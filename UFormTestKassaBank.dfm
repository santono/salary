object FormTestKassaBank: TFormTestKassaBank
  Left = 228
  Top = 157
  Width = 870
  Height = 500
  Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1082#1072#1089#1089#1088#1074#1099#1093' '#1074#1099#1087#1083#1072#1090' '#1074' '#1073#1072#1085#1082#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    854
    462)
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 0
    Top = 8
    Width = 833
    Height = 425
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 6
    TabOrder = 0
    ColWidths = (
      64
      38
      120
      57
      64
      64)
  end
  object BitBtn1: TBitBtn
    Left = 0
    Top = 432
    Width = 137
    Height = 25
    Anchors = [akLeft, akTop, akBottom]
    Caption = #1042#1099#1087#1086#1083#1080#1085#1090#1100' '#1087#1088#1086#1074#1077#1088#1082#1091
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 152
    Top = 432
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object ProgressBar1: TProgressBar
    Left = 240
    Top = 432
    Width = 593
    Height = 17
    Anchors = [akLeft, akBottom]
    TabOrder = 3
  end
end
