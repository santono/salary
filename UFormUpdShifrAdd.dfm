object FormUpdShifrAdd: TFormUpdShifrAdd
  Left = 223
  Top = 164
  Width = 791
  Height = 480
  Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1079#1072#1087#1080#1089#1080' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
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
    Left = 90
    Top = 28
    Width = 30
    Height = 20
    Caption = #1050#1086#1076
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 113
    Height = 20
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object Label3: TLabel
    Left = 41
    Top = 90
    Width = 83
    Height = 20
    Caption = #1057#1086#1082#1088'.'#1085#1072#1080#1084'.'
  end
  object Label4: TLabel
    Left = 12
    Top = 123
    Width = 110
    Height = 20
    Caption = #1053#1072#1080#1084'.'#1076'. '#1089#1074#1086#1076#1072
  end
  object dxDBEdit1: TdxDBEdit
    Left = 128
    Top = 56
    Width = 577
    TabOrder = 0
    DataField = 'NAME'
    DataSource = FormEditShifr.DataSourceAdd
  end
  object dxDBCalcEdit1: TdxDBCalcEdit
    Left = 128
    Top = 24
    Width = 121
    TabOrder = 1
    DataField = 'SHIFR'
    DataSource = FormEditShifr.DataSourceAdd
  end
  object dxDBEdit2: TdxDBEdit
    Left = 128
    Top = 88
    Width = 289
    TabOrder = 2
    DataField = 'SHORTNAME'
    DataSource = FormEditShifr.DataSourceAdd
  end
  object dxDBEdit3: TdxDBEdit
    Left = 128
    Top = 120
    Width = 169
    TabOrder = 3
    DataField = 'NAMEFORSWOD'
    DataSource = FormEditShifr.DataSourceAdd
  end
  object BitBtnSave: TBitBtn
    Left = 24
    Top = 400
    Width = 121
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 4
    OnClick = BitBtnSaveClick
  end
  object BitBtnClose: TBitBtn
    Left = 480
    Top = 400
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 5
    Kind = bkClose
  end
  object GroupBox1: TGroupBox
    Left = 352
    Top = 152
    Width = 185
    Height = 169
    Caption = #1042#1093#1086#1076#1080#1090' '#1074' '#1088#1072#1089#1095#1077#1090
    TabOrder = 6
    object dxDBCheckEdit8: TdxDBCheckEdit
      Left = 16
      Top = 133
      Width = 121
      TabOrder = 0
      Caption = #1076#1077#1082#1088'.'#1073#1086#1083#1085'.'
      DataField = 'DEKR'
      DataSource = FormEditShifr.DataSourceAdd
      ValueChecked = '1'
      ValueGrayed = '0'
      ValueUnchecked = '0'
    end
    object dxDBCheckEdit7: TdxDBCheckEdit
      Left = 16
      Top = 106
      Width = 121
      TabOrder = 1
      Caption = #1080#1085#1076#1077#1082#1089#1072#1094#1080#1080
      DataField = 'IND'
      DataSource = FormEditShifr.DataSourceAdd
      ValueChecked = '1'
      ValueGrayed = '0'
      ValueUnchecked = '0'
    end
    object dxDBCheckEdit6: TdxDBCheckEdit
      Left = 16
      Top = 78
      Width = 145
      TabOrder = 2
      Caption = #1082#1086#1084#1072#1085#1076#1080#1088#1086#1074#1086#1082
      DataField = 'KOMAND'
      DataSource = FormEditShifr.DataSourceAdd
      ValueChecked = '1'
      ValueGrayed = '0'
      ValueUnchecked = '0'
    end
    object dxDBCheckEdit5: TdxDBCheckEdit
      Left = 16
      Top = 51
      Width = 121
      TabOrder = 3
      Caption = #1086#1090#1087#1091#1089#1082#1085#1099#1093
      DataField = 'OTP'
      DataSource = FormEditShifr.DataSourceAdd
      ValueChecked = '1'
      ValueGrayed = '0'
      ValueUnchecked = '0'
    end
    object dxDBCheckEdit4: TdxDBCheckEdit
      Left = 16
      Top = 24
      Width = 121
      TabOrder = 4
      Caption = #1073#1086#1083#1100#1085#1080#1095#1085#1099#1077
      DataField = 'BOLN'
      DataSource = FormEditShifr.DataSourceAdd
      ValueChecked = '1'
      ValueGrayed = '0'
      ValueUnchecked = '0'
    end
  end
  object GroupBox2: TGroupBox
    Left = 80
    Top = 168
    Width = 185
    Height = 145
    Caption = #1059#1076#1077#1088#1078#1080#1074#1072#1102#1090#1089#1103' '#1085#1072#1083#1086#1075#1080
    TabOrder = 7
    object dxDBCheckEdit3: TdxDBCheckEdit
      Left = 8
      Top = 82
      Width = 169
      TabOrder = 0
      Caption = #1045#1057#1042' ('#1073#1086#1083#1085')'
      DataField = 'ECB_ILL'
      DataSource = FormEditShifr.DataSourceAdd
      ValueChecked = '1'
      ValueGrayed = '0'
      ValueUnchecked = '0'
    end
    object dxDBCheckEdit2: TdxDBCheckEdit
      Left = 8
      Top = 56
      Width = 169
      TabOrder = 1
      Caption = #1045#1057#1042
      DataField = 'ECB'
      DataSource = FormEditShifr.DataSourceAdd
      ValueChecked = '1'
      ValueGrayed = '0'
      ValueUnchecked = '0'
    end
    object dxDBCheckEdit1: TdxDBCheckEdit
      Left = 8
      Top = 29
      Width = 169
      TabOrder = 2
      Caption = #1053#1072#1083#1086#1075' '#1089' '#1076#1086#1093#1086#1076#1072
      DataField = 'PODOH'
      DataSource = FormEditShifr.DataSourceAdd
      ValueChecked = '1'
      ValueGrayed = '0'
      ValueUnchecked = '0'
    end
    object dxDBCheckEdit9: TdxDBCheckEdit
      Left = 8
      Top = 109
      Width = 121
      TabOrder = 3
      Caption = #1072#1083#1080#1084#1077#1085#1090#1099
      DataField = 'ALIM'
      DataSource = FormEditShifr.DataSourceAdd
      ValueChecked = '1'
      ValueGrayed = '0'
      ValueUnchecked = '0'
    end
  end
end
