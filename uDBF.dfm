object FormDBF: TFormDBF
  Left = 192
  Top = 121
  Width = 696
  Height = 480
  Caption = 'FormDBF'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 85
    Top = 208
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 91
    Top = 78
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object BitBtn1: TBitBtn
    Left = 39
    Top = 273
    Width = 61
    Height = 20
    Caption = #1055#1077#1088#1077#1085#1086#1089
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 312
    Top = 267
    Width = 61
    Height = 20
    TabOrder = 1
    Kind = bkClose
  end
  object ProgressBar1: TProgressBar
    Left = 78
    Top = 182
    Width = 397
    Height = 16
    TabOrder = 2
  end
  object ProgressBar2: TProgressBar
    Left = 85
    Top = 98
    Width = 397
    Height = 16
    TabOrder = 3
  end
  object dbfPerson: TTable
    DatabaseName = 'SalaryDBF'
    TableName = 'PERSON.DBF'
    Left = 48
    Top = 40
  end
  object dbfADD: TTable
    DatabaseName = 'SalaryDBF'
    TableName = 'ADD.DBF'
    Left = 104
    Top = 40
  end
  object dbfUD: TTable
    DatabaseName = 'SalaryDBF'
    TableName = 'UD.DBF'
    Left = 152
    Top = 40
  end
  object dbfCN: TTable
    DatabaseName = 'SalaryDBF'
    TableName = 'CN.DBF'
    Left = 200
    Top = 40
  end
end
