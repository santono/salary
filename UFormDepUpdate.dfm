object FormDepUpdate: TFormDepUpdate
  Left = 223
  Top = 249
  Width = 696
  Height = 162
  Caption = 'FormDepUpdate'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Rjl: TLabel
    Left = 40
    Top = 8
    Width = 25
    Height = 13
    Caption = #1050#1086#1076
  end
  object Label1: TLabel
    Left = 16
    Top = 40
    Width = 50
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
  end
  object cxDBCalcEditId: TcxDBCalcEdit
    Left = 72
    Top = 8
    DataBinding.DataField = 'ID'
    DataBinding.DataSource = FormDepartmentBrowse.dsoDep
    TabOrder = 0
    Width = 121
  end
  object cxDBTextEditName: TcxDBTextEdit
    Left = 72
    Top = 40
    DataBinding.DataField = 'NAME'
    DataBinding.DataSource = FormDepartmentBrowse.dsoDep
    TabOrder = 1
    Width = 385
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 72
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 112
    Top = 72
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 3
    Kind = bkClose
  end
end
