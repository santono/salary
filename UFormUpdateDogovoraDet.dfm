object FormUpdateDogovoraDet: TFormUpdateDogovoraDet
  Left = 206
  Top = 183
  Width = 696
  Height = 480
  Caption = 'FormUpdateDogovoraDet'
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
    Left = 24
    Top = 24
    Width = 54
    Height = 13
    Caption = #1058#1072#1073'.'#1085#1086#1084#1077#1088
  end
  object Label2: TLabel
    Left = 40
    Top = 56
    Width = 35
    Height = 13
    Caption = #1044#1072#1090#1072' '#1089
  end
  object Label3: TLabel
    Left = 32
    Top = 88
    Width = 41
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086
  end
  object Label4: TLabel
    Left = 32
    Top = 120
    Width = 43
    Height = 13
    Caption = #1055#1088#1080#1095#1080#1085#1072
  end
  object Label5: TLabel
    Left = 24
    Top = 136
    Width = 53
    Height = 13
    Caption = #1086#1082#1086#1085#1095#1072#1085#1080#1103
  end
  object Label6: TLabel
    Left = 224
    Top = 56
    Width = 84
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1072
  end
  object cxDBCalcEditTabno: TcxDBCalcEdit
    Left = 80
    Top = 24
    DataBinding.DataField = 'TABNO'
    DataBinding.DataSource = FormBrowseDogovoraDet.dsoDogovoraDet
    TabOrder = 0
    Width = 89
  end
  object cxDBTextEditFIO: TcxDBTextEdit
    Left = 176
    Top = 24
    DataBinding.DataField = 'FIO'
    DataBinding.DataSource = FormBrowseDogovoraDet.dsoDogovoraDet
    TabOrder = 1
    Width = 273
  end
  object cxDBDateEditDateFr: TcxDBDateEdit
    Left = 80
    Top = 56
    DataBinding.DataField = 'DATEFR'
    DataBinding.DataSource = FormBrowseDogovoraDet.dsoDogovoraDet
    TabOrder = 2
    Width = 121
  end
  object cxDBDateEditDateTo: TcxDBDateEdit
    Left = 80
    Top = 88
    DataBinding.DataField = 'DATETO'
    DataBinding.DataSource = FormBrowseDogovoraDet.dsoDogovoraDet
    TabOrder = 3
    Width = 121
  end
  object cxDBMemoReasonOk: TcxDBMemo
    Left = 80
    Top = 120
    DataBinding.DataField = 'REASONOK'
    DataBinding.DataSource = FormBrowseDogovoraDet.dsoDogovoraDet
    TabOrder = 4
    Height = 57
    Width = 425
  end
  object BitBtnSave: TBitBtn
    Left = 80
    Top = 184
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 5
    OnClick = BitBtnSaveClick
  end
  object BitBtn2: TBitBtn
    Left = 168
    Top = 184
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 6
    OnClick = BitBtn2Click
    Kind = bkClose
  end
  object BitBtnFindKadry: TBitBtn
    Left = 456
    Top = 24
    Width = 33
    Height = 25
    Caption = '. . .'
    TabOrder = 7
    OnClick = BitBtnFindKadryClick
  end
  object cxDBTextEditNomer: TcxDBTextEdit
    Left = 320
    Top = 56
    DataBinding.DataField = 'NOMER'
    DataBinding.DataSource = FormBrowseDogovoraDet.dsoDogovoraDet
    TabOrder = 8
    Width = 121
  end
end
