object FormPrikazRekvizity: TFormPrikazRekvizity
  Left = 224
  Top = 140
  Width = 696
  Height = 635
  Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1087#1088#1080#1082#1072#1079#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 115
    Height = 20
    Caption = #1053#1086#1084#1077#1088' '#1087#1088#1080#1082#1072#1079#1072
  end
  object Label2: TLabel
    Left = 256
    Top = 16
    Width = 22
    Height = 20
    Caption = #1086#1090' '
  end
  object Label3: TLabel
    Left = 120
    Top = 48
    Width = 127
    Height = 20
    Caption = #1055#1077#1088#1080#1086#1076' '#1076#1077#1089#1090#1074#1080#1103
  end
  object Label4: TLabel
    Left = 8
    Top = 72
    Width = 11
    Height = 20
    Caption = #1057
  end
  object Label5: TLabel
    Left = 192
    Top = 72
    Width = 18
    Height = 20
    Caption = #1087#1086
  end
  object Label6: TLabel
    Left = 64
    Top = 152
    Width = 161
    Height = 20
    Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1087#1088#1080#1082#1072#1079#1072
  end
  object Label7: TLabel
    Left = 16
    Top = 112
    Width = 59
    Height = 20
    Caption = #1064#1072#1073#1083#1086#1085
    OnClick = btn1Click
  end
  object Label8: TLabel
    Left = 440
    Top = 48
    Width = 97
    Height = 20
    Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1074
  end
  object Label9: TLabel
    Left = 400
    Top = 72
    Width = 29
    Height = 20
    Caption = #1043#1086#1076
  end
  object Label10: TLabel
    Left = 520
    Top = 72
    Width = 48
    Height = 20
    Caption = #1052#1077#1089#1103#1094
  end
  object LabelKodKP: TLabel
    Left = 24
    Top = 416
    Width = 56
    Height = 20
    Caption = #1050#1086#1076' '#1050#1055
  end
  object LabelKodZKPPTR: TLabel
    Left = 160
    Top = 416
    Width = 98
    Height = 20
    Caption = #1050#1086#1076' '#1047#1050#1055#1055#1058#1056
  end
  object LabelProf: TLabel
    Left = 24
    Top = 448
    Width = 88
    Height = 20
    Caption = #1055#1088#1086#1092#1077#1089#1089#1080#1103
  end
  object LabelDolg: TLabel
    Left = 24
    Top = 488
    Width = 86
    Height = 20
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
  end
  object dxDBDateEdit1: TdxDBDateEdit
    Left = 280
    Top = 16
    Width = 161
    TabOrder = 0
    DataField = 'DATAPRIK'
    DataSource = FormPrikazyBrowse.dsoPrikazy
  end
  object dxDBEdit1: TdxDBEdit
    Left = 128
    Top = 16
    Width = 121
    TabOrder = 1
    DataField = 'NOMERPRIK'
    DataSource = FormPrikazyBrowse.dsoPrikazy
  end
  object dxDBDateEdit2: TdxDBDateEdit
    Left = 24
    Top = 72
    Width = 161
    TabOrder = 2
    DataField = 'DATABEG'
    DataSource = FormPrikazyBrowse.dsoPrikazy
  end
  object dxDBDateEdit3: TdxDBDateEdit
    Left = 216
    Top = 72
    Width = 145
    TabOrder = 3
    DataField = 'DATAEND'
    DataSource = FormPrikazyBrowse.dsoPrikazy
  end
  object dxDBMemo1: TdxDBMemo
    Left = 24
    Top = 176
    Width = 625
    TabOrder = 4
    DataField = 'CONTENT'
    DataSource = FormPrikazyBrowse.dsoPrikazy
    Height = 217
  end
  object btn1: TBitBtn
    Left = 16
    Top = 552
    Width = 120
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 5
    OnClick = btn1Click
    Kind = bkOK
  end
  object BitBtn1: TBitBtn
    Left = 144
    Top = 552
    Width = 120
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 6
    Kind = bkClose
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 88
    Top = 112
    Width = 353
    Height = 28
    DataField = 'SHIFRIDTYP'
    DataSource = FormPrikazyBrowse.dsoPrikazy
    KeyField = 'ID'
    ListField = 'NAME'
    ListSource = FormPrikazyBrowse.dsoPriType
    TabOrder = 7
    OnClick = DBLookupComboBox1Click
  end
  object dxDBSpinEditY: TdxDBSpinEdit
    Left = 440
    Top = 72
    Width = 73
    TabOrder = 8
    DataField = 'Y'
    DataSource = FormPrikazyBrowse.dsoPrikazy
    MaxValue = 2025.000000000000000000
    StoredValues = 16
  end
  object dxDBSpinEditM: TdxDBSpinEdit
    Left = 576
    Top = 72
    Width = 65
    TabOrder = 9
    DataField = 'M'
    DataSource = FormPrikazyBrowse.dsoPrikazy
    MaxValue = 12.000000000000000000
    StoredValues = 48
  end
  object dxDBEditDolg: TdxDBEdit
    Left = 120
    Top = 488
    Width = 313
    TabOrder = 10
    DataField = 'NAMEDOL'
    DataSource = FormPrikazyBrowse.dsoPrikazy
  end
  object BitBtnKP: TBitBtn
    Left = 400
    Top = 416
    Width = 249
    Height = 25
    Caption = #1050#1083#1072#1089#1089#1080#1092#1080#1082#1072#1090#1086#1088' '#1044#1050' 003:2010 '
    TabOrder = 11
    OnClick = BitBtnKPClick
  end
  object dxDBEditProf: TdxDBEdit
    Left = 120
    Top = 448
    Width = 529
    Enabled = False
    TabOrder = 12
    DataField = 'NAMEPROF'
    DataSource = FormPrikazyBrowse.dsoPrikazy
    ReadOnly = True
    StoredValues = 64
  end
  object dxDBEditKodKP: TdxDBEdit
    Left = 80
    Top = 408
    Width = 73
    Enabled = False
    TabOrder = 13
    DataField = 'KODKP'
    DataSource = FormPrikazyBrowse.dsoPrikazy
    ReadOnly = True
    StoredValues = 64
  end
  object dxDBEditKodZKPPTR: TdxDBEdit
    Left = 264
    Top = 408
    Width = 121
    TabOrder = 14
    DataField = 'KODZKPPTR'
    DataSource = FormPrikazyBrowse.dsoPrikazy
  end
end
