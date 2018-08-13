object FormKadryCl: TFormKadryCl
  Left = 217
  Top = 125
  Width = 696
  Height = 581
  Caption = #1050#1072#1076#1088#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 16
    Top = 512
    Width = 75
    Height = 25
    Caption = #1042#1099#1073#1086#1088
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object StringGridKadry: TStringGrid
    Left = 16
    Top = 8
    Width = 625
    Height = 497
    FixedCols = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnDblClick = StringGridKadryDblClick
    OnDrawCell = StringGridKadryDrawCell
    OnMouseDown = StringGridKadryMouseDown
  end
  object PopupMenu1: TPopupMenu
    Left = 144
    Top = 112
    object Find: TMenuItem
      Caption = #1055#1086#1080#1089#1082
      OnClick = FindClick
    end
  end
end
