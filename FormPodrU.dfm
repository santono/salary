object FormPodr: TFormPodr
  Left = 304
  Top = 145
  Width = 532
  Height = 494
  Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    516
    456)
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 8
    Top = 0
    Width = 61
    Height = 20
    Caption = #1060#1080#1083#1100#1090#1088
  end
  object LabelFilter: TLabel
    Left = 72
    Top = 0
    Width = 4
    Height = 20
  end
  object StringGrid1: TStringGrid
    Left = 4
    Top = 28
    Width = 509
    Height = 423
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 2
    DefaultRowHeight = 20
    RowCount = 169
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing]
    TabOrder = 0
    OnDblClick = StringGrid1DblClick
    OnKeyPress = StringGrid1KeyPress
    OnMouseDown = StringGrid1MouseDown
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      64
      542)
  end
  object BitBtnClearFilter: TBitBtn
    Left = 448
    Top = 0
    Width = 65
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1057#1073#1088#1086#1089
    TabOrder = 1
    OnClick = BitBtnClearFilterClick
  end
  object BitBtnUp: TBitBtn
    Left = 416
    Top = 0
    Width = 27
    Height = 25
    Anchors = [akTop, akRight]
    Caption = '<'
    TabOrder = 2
    OnClick = BitBtnUpClick
  end
  object BitBtnDown: TBitBtn
    Left = 384
    Top = 0
    Width = 27
    Height = 25
    Anchors = [akTop, akRight]
    Caption = '>'
    TabOrder = 3
    OnClick = BitBtnDownClick
  end
end
