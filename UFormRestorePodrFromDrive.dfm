object FormRestorePodrFromDrive: TFormRestorePodrFromDrive
  Left = 254
  Top = 142
  Width = 696
  Height = 480
  Caption = #1057#1087#1080#1089#1086#1082', '#1080#1084#1077#1102#1097#1080#1093#1089#1103' '#1082#1086#1087#1080#1081' '#1092#1072#1081#1083#1086#1074
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
  object StringGridFiles: TStringGrid
    Left = 8
    Top = 8
    Width = 665
    Height = 417
    ColCount = 4
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = PopupMenu1
    TabOrder = 0
    ColWidths = (
      384
      106
      98
      64)
  end
  object PopupMenu1: TPopupMenu
    Left = 216
    Top = 184
    object N1: TMenuItem
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      OnClick = N1Click
    end
  end
end
