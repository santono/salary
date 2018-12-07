object FormUpdateDogovora: TFormUpdateDogovora
  Left = 211
  Top = 145
  Width = 637
  Height = 389
  Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1076#1086#1075#1086#1074#1086#1088#1072
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
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 64
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
  end
  object Label2: TLabel
    Left = 0
    Top = 48
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
  end
  object Label3: TLabel
    Left = 48
    Top = 80
    Width = 34
    Height = 13
    Caption = #1053#1086#1084#1077#1088
  end
  object Label4: TLabel
    Left = 8
    Top = 112
    Width = 50
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
  end
  object cxDBDateEditFr: TcxDBDateEdit
    Left = 88
    Top = 16
    DataBinding.DataField = 'DATEFR'
    DataBinding.DataSource = FormBrowseDogovora.dsoDogovora
    TabOrder = 0
    Width = 121
  end
  object cxDBDateEditTo: TcxDBDateEdit
    Left = 88
    Top = 48
    DataBinding.DataField = 'DATETO'
    DataBinding.DataSource = FormBrowseDogovora.dsoDogovora
    TabOrder = 1
    Width = 121
  end
  object cxDBTextEditNomer: TcxDBTextEdit
    Left = 88
    Top = 80
    DataBinding.DataField = 'NOMER'
    DataBinding.DataSource = FormBrowseDogovora.dsoDogovora
    TabOrder = 2
    Width = 121
  end
  object cxDBMemoName: TcxDBMemo
    Left = 88
    Top = 112
    DataBinding.DataField = 'NAME'
    DataBinding.DataSource = FormBrowseDogovora.dsoDogovora
    TabOrder = 3
    Height = 145
    Width = 465
  end
  object BitBtnSave: TBitBtn
    Left = 88
    Top = 272
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 4
    OnClick = BitBtnSaveClick
  end
  object BitBtn1: TBitBtn
    Left = 176
    Top = 272
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 5
    OnClick = BitBtn1Click
    Kind = bkClose
  end
end
