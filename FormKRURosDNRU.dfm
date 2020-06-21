object FormKRURosDNR: TFormKRURosDNR
  Left = 213
  Top = 177
  Width = 870
  Height = 500
  Caption = #1057#1074#1086#1076' '#1087#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabelFio: TLabel
    Left = 16
    Top = 16
    Width = 40
    Height = 13
    Caption = 'LabelFio'
  end
  object Label1: TLabel
    Left = 40
    Top = 45
    Width = 7
    Height = 13
    Caption = 'C'
  end
  object Label2: TLabel
    Left = 216
    Top = 45
    Width = 12
    Height = 13
    Caption = #1087#1086
  end
  object Label3: TLabel
    Left = 40
    Top = 72
    Width = 31
    Height = 13
    Caption = #1040#1074#1072#1085#1089
  end
  object Label4: TLabel
    Left = 24
    Top = 96
    Width = 48
    Height = 13
    Caption = #1047#1072#1088#1087#1083#1072#1090#1072
  end
  object dpDateFr: TDateTimePicker
    Left = 56
    Top = 40
    Width = 153
    Height = 21
    Date = 44000.881829398150000000
    Time = 44000.881829398150000000
    DateFormat = dfLong
    TabOrder = 0
  end
  object dpDateTo: TDateTimePicker
    Left = 232
    Top = 40
    Width = 153
    Height = 21
    Date = 44000.883366331020000000
    Time = 44000.883366331020000000
    DateFormat = dfLong
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 576
    Top = 16
    Width = 75
    Height = 25
    Caption = '. . .'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object EditAwans: TEdit
    Left = 80
    Top = 72
    Width = 425
    Height = 21
    TabOrder = 3
    Text = 'EditAwans'
  end
  object EditZarplata: TEdit
    Left = 80
    Top = 96
    Width = 425
    Height = 21
    TabOrder = 4
    Text = 'EditZarplata'
  end
  object BitBtn2: TBitBtn
    Left = 32
    Top = 128
    Width = 75
    Height = 25
    Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object pFIBQuery1: TpFIBQuery
    Transaction = pFIBTransaction1
    Database = FIB.pFIBDatabaseArc
    Left = 96
    Top = 8
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseArc
    TimeoutAction = TARollback
    Left = 136
    Top = 8
  end
end
