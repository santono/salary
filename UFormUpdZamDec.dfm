object FormUpdZamDec: TFormUpdZamDec
  Left = 268
  Top = 180
  Width = 696
  Height = 339
  Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1079#1072#1084'.'#1076#1077#1082#1072#1085#1072
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
    Left = 8
    Top = 24
    Width = 53
    Height = 13
    Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 56
    Height = 13
    Caption = #1060#1072#1082#1091#1083#1100#1090#1077#1090
  end
  object lbl1: TLabel
    Left = 7
    Top = 94
    Width = 58
    Height = 13
    Caption = #1053#1072#1079#1085#1072#1095#1077#1085' '#1089
  end
  object Label3: TLabel
    Left = 232
    Top = 88
    Width = 38
    Height = 13
    Caption = #1059#1074#1086#1083#1077#1085
  end
  object Label4: TLabel
    Left = 464
    Top = 88
    Width = 35
    Height = 13
    Caption = '% '#1085#1072#1076#1073
  end
  object cxDBLookupComboBox1: TcxDBLookupComboBox
    Left = 96
    Top = 24
    DataBinding.DataField = 'SHIFRIDKADRY'
    DataBinding.DataSource = dmPO.dsZamDec
    Properties.KeyFieldNames = 'SHIFRID'
    Properties.ListColumns = <
      item
        FieldName = 'FIO'
      end>
    Properties.ListSource = dmPO.dsKadry
    TabOrder = 0
    Width = 529
  end
  object cxDBLookupComboBox2: TcxDBLookupComboBox
    Left = 96
    Top = 56
    DataBinding.DataField = 'SHIFRFAC'
    DataBinding.DataSource = dmPO.dsZamDec
    Properties.KeyFieldNames = 'SHIFRID'
    Properties.ListColumns = <
      item
        FieldName = 'NAME'
      end>
    Properties.ListSource = dmPO.dsFacList
    TabOrder = 1
    Width = 529
  end
  object cxDBDateEdit1: TcxDBDateEdit
    Left = 96
    Top = 88
    DataBinding.DataField = 'DATEFR'
    DataBinding.DataSource = dmPO.dsZamDec
    Properties.ClearKey = 46
    TabOrder = 2
    Width = 121
  end
  object cxDBDateEdit2: TcxDBDateEdit
    Left = 280
    Top = 88
    DataBinding.DataField = 'DATETO'
    DataBinding.DataSource = dmPO.dsZamDec
    Properties.ClearKey = 46
    TabOrder = 3
    Width = 121
  end
  object cxDBRadioGroup1: TcxDBRadioGroup
    Left = 312
    Top = 128
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
    DataBinding.DataField = 'CODEDOLG'
    DataBinding.DataSource = dmPO.dsZamDec
    Properties.Items = <
      item
        Caption = #1044#1077#1082#1072#1085
        Value = 1
      end
      item
        Caption = #1047#1072#1084'.'#1076#1077#1082#1072#1085#1072
        Value = 2
      end
      item
        Caption = #1044#1080#1088#1077#1082#1090#1086#1088
        Value = 3
      end
      item
        Caption = #1047#1072#1084' '#1076#1080#1088#1077#1082#1090#1086#1088#1072
        Value = 4
      end>
    TabOrder = 4
    Height = 105
    Width = 185
  end
  object BitBtn1: TBitBtn
    Left = 32
    Top = 128
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 32
    Top = 184
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 6
    Kind = bkClose
  end
  object cxDBCalcEdit1: TcxDBCalcEdit
    Left = 504
    Top = 88
    DataBinding.DataField = 'PROCZAMDEC'
    DataBinding.DataSource = dmPO.dsZamDec
    TabOrder = 7
    Width = 121
  end
end
