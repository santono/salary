object Form1: TForm1
  Left = 192
  Top = 124
  Width = 870
  Height = 500
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MaskEdit1: TMaskEdit
    Left = 32
    Top = 16
    Width = 633
    Height = 21
    TabOrder = 0
    Text = 'MaskEdit1'
  end
  object BitBtn1: TBitBtn
    Left = 40
    Top = 56
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 144
    Top = 56
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkClose
  end
  object OpenDialog1: TOpenDialog
    Left = 672
    Top = 8
  end
end
