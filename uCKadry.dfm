object frmKadry: TfrmKadry
  Left = 264
  Top = 204
  Width = 696
  Height = 480
  Caption = 'frmKadry'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 364
    Top = 306
    Width = 61
    Height = 20
    TabOrder = 0
    Kind = bkClose
  end
  object BitBtn2: TBitBtn
    Left = 72
    Top = 299
    Width = 60
    Height = 20
    Caption = 'BitBtn2'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object tblCKADRYdbf: TTable
    TableName = 'd:\fp26\ckadry.dbf'
    Left = 16
    Top = 16
  end
end
