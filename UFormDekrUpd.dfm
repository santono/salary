object FormDekrUpd: TFormDekrUpd
  Left = 255
  Top = 178
  Width = 696
  Height = 347
  Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1080' '#1076#1077#1082#1088#1077#1090#1085#1086#1075#1086' '#1086#1090#1087#1091#1089#1082#1072
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
    Left = 56
    Top = 16
    Width = 54
    Height = 13
    Caption = #1058#1072#1073'.'#1085#1086#1084#1077#1088
  end
  object Label2: TLabel
    Left = 96
    Top = 48
    Width = 18
    Height = 13
    Caption = #1055#1030#1041
  end
  object Label3: TLabel
    Left = 96
    Top = 80
    Width = 19
    Height = 13
    Caption = #1030#1053#1053
  end
  object Label4: TLabel
    Left = 40
    Top = 112
    Width = 70
    Height = 13
    Caption = #1058#1080#1087' '#1074#1110#1076#1087#1091#1089#1090#1082#1080
  end
  object Label5: TLabel
    Left = 32
    Top = 144
    Width = 79
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1087#1088#1080#1082#1072#1079#1072
  end
  object Label6: TLabel
    Left = 40
    Top = 176
    Width = 71
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1088#1080#1082#1072#1079#1072
  end
  object Label7: TLabel
    Left = 48
    Top = 208
    Width = 68
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091
  end
  object Label8: TLabel
    Left = 32
    Top = 240
    Width = 84
    Height = 13
    Caption = #1044#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103
  end
  object cxDBMaskEditTabno: TcxDBMaskEdit
    Left = 120
    Top = 16
    DataBinding.DataField = 'TABNO'
    DataBinding.DataSource = FormDekrList.dsoDekr
    TabOrder = 0
    Width = 89
  end
  object cxDBTextEditFIO: TcxDBTextEdit
    Left = 120
    Top = 48
    DataBinding.DataField = 'FIO'
    DataBinding.DataSource = FormDekrList.dsoDekr
    TabOrder = 1
    Width = 433
  end
  object cxDBTextEditINN: TcxDBTextEdit
    Left = 120
    Top = 80
    DataBinding.DataField = 'INN'
    DataBinding.DataSource = FormDekrList.dsoDekr
    TabOrder = 2
    Width = 121
  end
  object dxDBLookupEditKind: TdxDBLookupEdit
    Left = 120
    Top = 112
    Width = 265
    TabOrder = 3
    DataField = 'KIND'
    DataSource = FormDekrList.dsoDekr
    ListFieldName = 'name'
    KeyFieldName = 'id'
    ListSource = FormDekrList.dsoKind
    LookupKeyValue = Null
  end
  object cxDBTextEditNomerPrik: TcxDBTextEdit
    Left = 120
    Top = 144
    DataBinding.DataField = 'NOMER_PRIK'
    DataBinding.DataSource = FormDekrList.dsoDekr
    TabOrder = 4
    Width = 121
  end
  object cxDBDateEditDatePrik: TcxDBDateEdit
    Left = 120
    Top = 176
    DataBinding.DataField = 'DATA_PRIK'
    DataBinding.DataSource = FormDekrList.dsoDekr
    TabOrder = 5
    Width = 121
  end
  object cxDBDateEditDateFR: TcxDBDateEdit
    Left = 120
    Top = 208
    DataBinding.DataField = 'DATE_FR'
    DataBinding.DataSource = FormDekrList.dsoDekr
    TabOrder = 6
    Width = 121
  end
  object cxDBDateEditDateTo: TcxDBDateEdit
    Left = 120
    Top = 240
    DataBinding.DataField = 'DATE_TO'
    DataBinding.DataSource = FormDekrList.dsoDekr
    TabOrder = 7
    Width = 121
  end
  object BitBtnSave: TBitBtn
    Left = 120
    Top = 280
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 8
    OnClick = BitBtnSaveClick
  end
  object BitBtnExit: TBitBtn
    Left = 216
    Top = 280
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 9
    Kind = bkClose
  end
  object ButtonFind: TButton
    Left = 224
    Top = 16
    Width = 33
    Height = 25
    Caption = '. . .'
    TabOrder = 10
    OnClick = ButtonFindClick
  end
end
