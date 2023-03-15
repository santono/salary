object FormUpdateLgotnik: TFormUpdateLgotnik
  Left = 302
  Top = 123
  Width = 696
  Height = 480
  Caption = 'FormUpdateLgotnik'
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
    Left = 144
    Top = 24
    Width = 135
    Height = 20
    Caption = #1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
  end
  object Label2: TLabel
    Left = 72
    Top = 96
    Width = 200
    Height = 20
    Caption = #1057#1091#1084#1084#1072' '#1085#1072#1083#1086#1075#1086#1074#1086#1075#1086' '#1074#1099#1095#1077#1090#1072
  end
  object Label3: TLabel
    Left = 16
    Top = 136
    Width = 268
    Height = 20
    Caption = #1053#1072#1082#1086#1087#1080#1090#1077#1083#1100#1085#1099#1077' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1079#1072' '#1075#1086#1076
  end
  object Label4: TLabel
    Left = 104
    Top = 176
    Width = 175
    Height = 20
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1076#1077#1081#1089#1090#1074#1080#1103
  end
  object Label5: TLabel
    Left = 80
    Top = 216
    Width = 200
    Height = 20
    Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1076#1077#1081#1089#1090#1074#1080#1103
  end
  object Label6: TLabel
    Left = 240
    Top = 64
    Width = 38
    Height = 20
    Caption = #1060#1048#1054
  end
  object Label7: TLabel
    Left = 184
    Top = 288
    Width = 95
    Height = 20
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object cxDBDateEdit1: TcxDBDateEdit
    Left = 288
    Top = 176
    DataBinding.DataField = 'DATAFR'
    DataBinding.DataSource = FormEditLgotniki.dsoLgotniki
    TabOrder = 0
    Width = 121
  end
  object cxDBDateEdit2: TcxDBDateEdit
    Left = 288
    Top = 216
    DataBinding.DataField = 'DATAEND'
    DataBinding.DataSource = FormEditLgotniki.dsoLgotniki
    TabOrder = 1
    Width = 121
  end
  object cxDBCalcEdit1: TcxDBCalcEdit
    Left = 288
    Top = 96
    DataBinding.DataField = 'SUMMAVY'
    DataBinding.DataSource = FormEditLgotniki.dsoLgotniki
    Properties.Precision = 10
    TabOrder = 2
    Width = 121
  end
  object cxDBCalcEdit2: TcxDBCalcEdit
    Left = 288
    Top = 136
    DataBinding.DataField = 'SUMMAYEARLIMIT'
    DataBinding.DataSource = FormEditLgotniki.dsoLgotniki
    Properties.Precision = 10
    TabOrder = 3
    Width = 121
  end
  object cxDBCheckBox1: TcxDBCheckBox
    Left = 288
    Top = 256
    Caption = #1040#1082#1090#1080#1074#1085#1072
    DataBinding.DataField = 'ENABLED'
    DataBinding.DataSource = FormEditLgotniki.dsoLgotniki
    Properties.ValueChecked = 1
    Properties.ValueUnchecked = 0
    TabOrder = 4
    Width = 121
  end
  object cxDBButtonEditTn: TcxDBButtonEdit
    Left = 288
    Top = 24
    DataBinding.DataField = 'TABNO'
    DataBinding.DataSource = FormEditLgotniki.dsoLgotniki
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = cxDBButtonEdit1PropertiesButtonClick
    TabOrder = 5
    Width = 121
  end
  object cxDBTextEditFIO: TcxDBTextEdit
    Left = 288
    Top = 62
    DataBinding.DataField = 'FIO'
    DataBinding.DataSource = FormEditLgotniki.dsoLgotniki
    TabOrder = 6
    Width = 385
  end
  object BitBtn1: TBitBtn
    Left = 40
    Top = 408
    Width = 129
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 7
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 184
    Top = 408
    Width = 89
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 8
    Kind = bkClose
  end
  object cxMemo1: TcxMemo
    Left = 288
    Top = 288
    TabOrder = 9
    Height = 113
    Width = 385
  end
end
