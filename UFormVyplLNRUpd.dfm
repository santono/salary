object FormVyplLNRUpd: TFormVyplLNRUpd
  Left = 247
  Top = 157
  Width = 696
  Height = 480
  Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1079#1072#1087#1080#1089#1080
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
    Left = 20
    Top = 21
    Width = 111
    Height = 20
    Caption = #1044#1072#1090#1072' '#1074#1099#1087#1083#1072#1090#1099
  end
  object Label2: TLabel
    Left = 80
    Top = 60
    Width = 50
    Height = 20
    Caption = #1053#1086#1084#1077#1088
  end
  object Label3: TLabel
    Left = 6
    Top = 99
    Width = 127
    Height = 20
    Caption = #1055#1088#1086#1094#1077#1085#1090' '#1086#1087#1083#1072#1090#1099
  end
  object Label4: TLabel
    Left = 8
    Top = 200
    Width = 49
    Height = 20
    Caption = #1057#1091#1084#1084#1072
  end
  object Label5: TLabel
    Left = 7
    Top = 245
    Width = 124
    Height = 20
    Caption = #1057#1091#1084#1084#1072' '#1087#1086#1083#1091#1095#1077#1085#1086
  end
  object Label6: TLabel
    Left = 8
    Top = 284
    Width = 146
    Height = 20
    Caption = #1057#1091#1084#1084#1072' '#1085#1077' '#1087#1086#1083#1091#1095#1077#1085#1086
  end
  object Label7: TLabel
    Left = 58
    Top = 325
    Width = 95
    Height = 20
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 408
    Width = 121
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 0
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 152
    Top = 408
    Width = 89
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object cxDBDateEdit1: TcxDBDateEdit
    Left = 160
    Top = 16
    DataBinding.DataField = 'DATAVYPL'
    DataBinding.DataSource = FormVyplLNR.dsoVypl
    TabOrder = 2
    Width = 177
  end
  object cxDBCalcEdit1: TcxDBCalcEdit
    Left = 160
    Top = 56
    DataBinding.DataField = 'NOMER'
    DataBinding.DataSource = FormVyplLNR.dsoVypl
    TabOrder = 3
    Width = 177
  end
  object cxDBCalcEdit2: TcxDBCalcEdit
    Left = 160
    Top = 96
    DataBinding.DataField = 'PROCENT'
    DataBinding.DataSource = FormVyplLNR.dsoVypl
    TabOrder = 4
    Width = 177
  end
  object cxDBCalcEdit3: TcxDBCalcEdit
    Left = 160
    Top = 200
    DataBinding.DataField = 'SUMMA'
    DataBinding.DataSource = FormVyplLNR.dsoVypl
    TabOrder = 5
    Width = 177
  end
  object cxDBCalcEdit4: TcxDBCalcEdit
    Left = 160
    Top = 240
    DataBinding.DataField = 'SUMMAVYPL'
    DataBinding.DataSource = FormVyplLNR.dsoVypl
    TabOrder = 6
    Width = 177
  end
  object cxDBCalcEdit5: TcxDBCalcEdit
    Left = 160
    Top = 280
    DataBinding.DataField = 'SUMMANEVYPL'
    DataBinding.DataSource = FormVyplLNR.dsoVypl
    TabOrder = 7
    Width = 177
  end
  object DBCheckBox1: TDBCheckBox
    Left = 160
    Top = 136
    Width = 329
    Height = 25
    Caption = #1059#1085#1080#1074#1077#1088#1089#1080#1090' ('#1086#1090#1084#1077#1095#1077#1085#1086') '#1080#1083#1080' '#1082#1086#1083#1083#1077#1076#1078
    DataField = 'ISUNIVER'
    DataSource = FormVyplLNR.dsoVypl
    TabOrder = 8
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object DBCheckBox2: TDBCheckBox
    Left = 160
    Top = 168
    Width = 297
    Height = 17
    Caption = #1044#1077#1073#1077#1090' ('#1086#1090#1084#1077#1095#1077#1085#1086') '#1080#1083#1080' '#1082#1088#1077#1076#1080#1090
    DataField = 'ISDEBET'
    DataSource = FormVyplLNR.dsoVypl
    TabOrder = 9
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object cxDBTextEdit1: TcxDBTextEdit
    Left = 160
    Top = 320
    DataBinding.DataField = 'COMMENT'
    DataBinding.DataSource = FormVyplLNR.dsoVypl
    TabOrder = 10
    Width = 489
  end
end
