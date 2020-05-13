object FormPrikazRekvizityTot: TFormPrikazRekvizityTot
  Left = 335
  Top = 79
  Width = 696
  Height = 679
  Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1087#1088#1080#1082#1072#1079#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
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
    Top = 88
    Width = 127
    Height = 20
    Caption = #1055#1077#1088#1080#1086#1076' '#1076#1077#1089#1090#1074#1080#1103
  end
  object Label4: TLabel
    Left = 8
    Top = 112
    Width = 11
    Height = 20
    Caption = #1057
  end
  object Label5: TLabel
    Left = 192
    Top = 112
    Width = 18
    Height = 20
    Caption = #1087#1086
  end
  object Label6: TLabel
    Left = 64
    Top = 192
    Width = 161
    Height = 20
    Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1087#1088#1080#1082#1072#1079#1072
  end
  object Label7: TLabel
    Left = 16
    Top = 152
    Width = 59
    Height = 20
    Caption = #1064#1072#1073#1083#1086#1085
    OnClick = btn1Click
  end
  object Label8: TLabel
    Left = 440
    Top = 88
    Width = 97
    Height = 20
    Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1074
  end
  object Label9: TLabel
    Left = 400
    Top = 112
    Width = 29
    Height = 20
    Caption = #1043#1086#1076
  end
  object Label10: TLabel
    Left = 520
    Top = 112
    Width = 48
    Height = 20
    Caption = #1052#1077#1089#1103#1094
  end
  object LabelFIO: TLabel
    Left = 104
    Top = 56
    Width = 66
    Height = 20
    Caption = 'LabelFIO'
  end
  object dxDBDateEdit1: TdxDBDateEdit
    Left = 280
    Top = 16
    Width = 161
    TabOrder = 0
    DataField = 'DATAPRIK'
    DataSource = FormPrikazyBrowseTot.dsoPrikazy
  end
  object dxDBEdit1: TdxDBEdit
    Left = 128
    Top = 16
    Width = 121
    TabOrder = 1
    DataField = 'NOMERPRIK'
    DataSource = FormPrikazyBrowseTot.dsoPrikazy
  end
  object dxDBDateEdit2: TdxDBDateEdit
    Left = 24
    Top = 112
    Width = 161
    TabOrder = 2
    DataField = 'DATABEG'
    DataSource = FormPrikazyBrowseTot.dsoPrikazy
  end
  object dxDBDateEdit3: TdxDBDateEdit
    Left = 216
    Top = 112
    Width = 145
    TabOrder = 3
    DataField = 'DATAEND'
    DataSource = FormPrikazyBrowseTot.dsoPrikazy
  end
  object dxDBMemo1: TdxDBMemo
    Left = 24
    Top = 216
    Width = 625
    TabOrder = 4
    DataField = 'CONTENT'
    DataSource = FormPrikazyBrowseTot.dsoPrikazy
    Height = 217
  end
  object btn1: TBitBtn
    Left = 16
    Top = 608
    Width = 120
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 5
    OnClick = btn1Click
    Kind = bkOK
  end
  object BitBtn1: TBitBtn
    Left = 144
    Top = 608
    Width = 120
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 6
    Kind = bkClose
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 88
    Top = 152
    Width = 353
    Height = 28
    DataField = 'SHIFRIDTYP'
    DataSource = FormPrikazyBrowseTot.dsoPrikazy
    KeyField = 'ID'
    ListField = 'NAME'
    ListSource = FormPrikazyBrowseTot.dsoPriType
    TabOrder = 7
    OnClick = DBLookupComboBox1Click
  end
  object dxDBSpinEditY: TdxDBSpinEdit
    Left = 440
    Top = 112
    Width = 73
    TabOrder = 8
    DataField = 'Y'
    DataSource = FormPrikazyBrowseTot.dsoPrikazy
    MaxValue = 2025.000000000000000000
    StoredValues = 16
  end
  object dxDBSpinEditM: TdxDBSpinEdit
    Left = 576
    Top = 112
    Width = 65
    TabOrder = 9
    DataField = 'M'
    DataSource = FormPrikazyBrowseTot.dsoPrikazy
    MaxValue = 12.000000000000000000
    StoredValues = 48
  end
  object BitBtnFIO: TBitBtn
    Left = 16
    Top = 56
    Width = 57
    Height = 25
    Caption = '. . .'
    TabOrder = 10
    OnClick = BitBtnFIOClick
  end
  object PageControl1: TPageControl
    Left = 24
    Top = 448
    Width = 649
    Height = 153
    ActivePage = tbDolgOld
    TabOrder = 11
    object tbDolg: TTabSheet
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1076#1086#1083#1078#1085#1086#1089#1090#1080
      object LabelDolg: TLabel
        Left = 16
        Top = 50
        Width = 86
        Height = 20
        Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      end
      object LabelKodKP: TLabel
        Left = 8
        Top = 10
        Width = 56
        Height = 20
        Caption = #1050#1086#1076' '#1050#1055
      end
      object LabelProf: TLabel
        Left = 8
        Top = 82
        Width = 88
        Height = 20
        Caption = #1055#1088#1086#1092#1077#1089#1089#1080#1103
      end
      object LabelKodZKPPTR: TLabel
        Left = 144
        Top = 10
        Width = 98
        Height = 20
        Caption = #1050#1086#1076' '#1047#1050#1055#1055#1058#1056
      end
      object dxDBEditKodKP: TdxDBEdit
        Left = 72
        Top = 10
        Width = 73
        TabOrder = 0
        DataField = 'KODKP'
        DataSource = FormPrikazyBrowseTot.dsoPrikazy
        ReadOnly = True
        StoredValues = 64
      end
      object dxDBEditKodZKPPTR: TdxDBEdit
        Left = 248
        Top = 10
        Width = 121
        TabOrder = 1
        DataField = 'KODZKPPTR'
        DataSource = FormPrikazyBrowseTot.dsoPrikazy
      end
      object dxDBEditProf: TdxDBEdit
        Left = 104
        Top = 82
        Width = 529
        TabOrder = 2
        DataField = 'NAMEPROF'
        DataSource = FormPrikazyBrowseTot.dsoPrikazy
        ReadOnly = True
        StoredValues = 64
      end
      object dxDBEditDolg: TdxDBEdit
        Left = 104
        Top = 50
        Width = 313
        TabOrder = 3
        DataField = 'NAMEDOL'
        DataSource = FormPrikazyBrowseTot.dsoPrikazy
      end
      object BitBtnKP: TBitBtn
        Left = 432
        Top = 10
        Width = 201
        Height = 63
        Caption = #1050#1083#1072#1089#1089#1080#1092#1080#1082#1072#1090#1086#1088' '#1044#1050' 003:2010 '
        TabOrder = 4
        OnClick = BitBtnKPClick
      end
    end
    object tbDolgOld: TTabSheet
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1090#1072#1088#1086#1081' '#1076#1086#1083#1078#1085#1086#1089#1090#1080
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 641
        Height = 121
        Caption = 'Panel1'
        Color = cl3DLight
        TabOrder = 0
        object LabelProfOld: TLabel
          Left = 8
          Top = 82
          Width = 88
          Height = 20
          Caption = #1055#1088#1086#1092#1077#1089#1089#1080#1103
        end
        object Label1DolgOld: TLabel
          Left = 8
          Top = 50
          Width = 86
          Height = 20
          Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
        end
        object Label1ZKPOld: TLabel
          Left = 144
          Top = 10
          Width = 98
          Height = 20
          Caption = #1050#1086#1076' '#1047#1050#1055#1055#1058#1056
        end
        object Label1KodKpOld: TLabel
          Left = 8
          Top = 18
          Width = 56
          Height = 20
          Caption = #1050#1086#1076' '#1050#1055
        end
        object BitBtnKPOld: TBitBtn
          Left = 424
          Top = 10
          Width = 201
          Height = 63
          Caption = #1050#1083#1072#1089#1089#1080#1092#1080#1082#1072#1090#1086#1088' '#1044#1050' 003:2010 '
          TabOrder = 0
          OnClick = BitBtnKPOldClick
        end
        object dxDBEditProfOld: TdxDBEdit
          Left = 104
          Top = 82
          Width = 529
          TabOrder = 1
          DataField = 'NAMEPROF_OLD'
          DataSource = FormPrikazyBrowseTot.dsoPrikazy
          ReadOnly = True
          StoredValues = 64
        end
        object dxDBEdit2: TdxDBEdit
          Left = 104
          Top = 50
          Width = 313
          TabOrder = 2
          DataField = 'NAMEDOL_OLD'
          DataSource = FormPrikazyBrowseTot.dsoPrikazy
        end
        object dxEditZkpOld: TdxDBEdit
          Left = 248
          Top = 10
          Width = 121
          TabOrder = 3
          DataField = 'KODZKPPTR_OLD'
          DataSource = FormPrikazyBrowseTot.dsoPrikazy
        end
        object dsEditKodKpOld: TdxDBEdit
          Left = 72
          Top = 10
          Width = 73
          TabOrder = 4
          DataField = 'KODKP_OLD'
          DataSource = FormPrikazyBrowseTot.dsoPrikazy
          ReadOnly = True
          StoredValues = 64
        end
      end
    end
  end
end
