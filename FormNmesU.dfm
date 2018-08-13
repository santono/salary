object FormNmes: TFormNmes
  Left = 318
  Top = 161
  Width = 277
  Height = 371
  Caption = #1059#1082#1072#1078#1080#1090#1077' '#1084#1077#1089#1103#1094
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object StringGrid1: TStringGrid
    Left = 8
    Top = 16
    Width = 257
    Height = 305
    ColCount = 2
    DefaultRowHeight = 20
    RowCount = 12
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected]
    TabOrder = 0
    OnDblClick = StringGrid1DblClick
  end
end
