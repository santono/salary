object FormShowCalc: TFormShowCalc
  Left = 191
  Top = 167
  Width = 562
  Height = 276
  Caption = 'FormShowCalc'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object StringGridS: TStringGrid
    Left = 16
    Top = 24
    Width = 513
    Height = 161
    ColCount = 7
    RowCount = 6
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 200
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkClose
  end
end
