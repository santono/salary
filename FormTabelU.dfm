object FormTabel: TFormTabel
  Left = 262
  Top = 101
  Width = 1001
  Height = 629
  Caption = #1058#1072#1073#1077#1083#1100
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StringGridT: TStringGrid
    Left = 0
    Top = 16
    Width = 617
    Height = 529
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSizing]
    ParentFont = False
    TabOrder = 0
    OnKeyPress = StringGridTKeyPress
    OnSelectCell = StringGridTSelectCell
    OnTopLeftChanged = StringGridTTopLeftChanged
  end
  object StringGridS: TStringGrid
    Left = 632
    Top = 8
    Width = 185
    Height = 545
    ColCount = 3
    Enabled = False
    FixedCols = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 544
    Width = 65
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BoxTabel: TComboBox
    Left = 96
    Top = 544
    Width = 305
    Height = 28
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 20
    ParentFont = False
    TabOrder = 3
  end
  object BoxDirection: TComboBox
    Left = 416
    Top = 544
    Width = 145
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 20
    ParentFont = False
    TabOrder = 4
    Text = 'BoxDirection'
  end
end
