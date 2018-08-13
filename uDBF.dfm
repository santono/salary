object FormDBF: TFormDBF
  Left = 192
  Top = 121
  Width = 696
  Height = 480
  Caption = 'FormDBF'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 104
    Top = 256
    Width = 41
    Height = 16
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 112
    Top = 96
    Width = 41
    Height = 16
    Caption = 'Label2'
  end
  object BitBtn1: TBitBtn
    Left = 48
    Top = 336
    Width = 75
    Height = 25
    Caption = #1055#1077#1088#1077#1085#1086#1089
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 384
    Top = 328
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkClose
  end
  object ProgressBar1: TProgressBar
    Left = 96
    Top = 224
    Width = 489
    Height = 20
    Min = 0
    Max = 100
    TabOrder = 2
  end
  object ProgressBar2: TProgressBar
    Left = 104
    Top = 120
    Width = 489
    Height = 20
    Min = 0
    Max = 100
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
