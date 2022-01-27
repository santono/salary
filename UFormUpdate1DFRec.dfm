object FormUpdate1DFRec: TFormUpdate1DFRec
  Left = 192
  Top = 124
  Width = 472
  Height = 235
  Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1079#1072#1087#1080#1089#1080' '#1092#1086#1088#1084#1099' 1'#1044#1060
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 88
    Top = 16
    Width = 9
    Height = 13
    Caption = 'Id'
  end
  object Label2: TLabel
    Left = 40
    Top = 40
    Width = 60
    Height = 13
    Caption = #1058#1072#1073'.  '#1085#1086#1084#1077#1088
  end
  object Label3: TLabel
    Left = 72
    Top = 64
    Width = 27
    Height = 13
    Caption = #1060#1048#1054
  end
  object Label4: TLabel
    Left = 48
    Top = 88
    Width = 55
    Height = 13
    Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
  end
  object Label5: TLabel
    Left = 16
    Top = 112
    Width = 86
    Height = 13
    Caption = #1053#1072#1083#1086#1075' '#1085#1072' '#1076#1086#1093#1086#1076#1099
  end
  object Label6: TLabel
    Left = 240
    Top = 40
    Width = 24
    Height = 13
    Caption = #1048#1053#1053
  end
  object DBEdit1: TDBEdit
    Left = 112
    Top = 16
    Width = 121
    Height = 21
    DataField = 'SHIFRID'
    DataSource = Form1DF.DataSource1DF
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 112
    Top = 40
    Width = 121
    Height = 21
    DataField = 'TABNO'
    DataSource = Form1DF.DataSource1DF
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 112
    Top = 64
    Width = 289
    Height = 21
    DataField = 'FIO'
    DataSource = Form1DF.DataSource1DF
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 112
    Top = 88
    Width = 121
    Height = 21
    DataField = 'SUMMAADD'
    DataSource = Form1DF.DataSource1DF
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 112
    Top = 112
    Width = 121
    Height = 21
    DataField = 'SUMMAPOD'
    DataSource = Form1DF.DataSource1DF
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 280
    Top = 40
    Width = 121
    Height = 21
    DataField = 'NAL_CODE'
    DataSource = Form1DF.DataSource1DF
    TabOrder = 5
  end
  object BitBtn1: TBitBtn
    Left = 32
    Top = 152
    Width = 75
    Height = 25
    TabOrder = 6
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 120
    Top = 152
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 7
    Kind = bkClose
  end
end
