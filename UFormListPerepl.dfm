object FormListPerepl: TFormListPerepl
  Left = 201
  Top = 175
  Width = 711
  Height = 486
  Caption = #1055#1077#1088#1077#1087#1083#1072#1090#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  DesignSize = (
    695
    448)
  PixelsPerInch = 96
  TextHeight = 20
  object StringGridPerepl: TStringGrid
    Left = 8
    Top = 8
    Width = 686
    Height = 393
    Anchors = [akLeft, akTop, akRight, akBottom]
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 408
    Width = 153
    Height = 25
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object ProgressBar1: TProgressBar
    Left = 176
    Top = 408
    Width = 497
    Height = 17
    TabOrder = 2
  end
end
