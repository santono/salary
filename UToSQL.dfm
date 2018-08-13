object FormToSQL: TFormToSQL
  Left = 246
  Top = 200
  Width = 696
  Height = 350
  Caption = #1055#1077#1088#1077#1085#1086#1089' '#1076#1072#1085#1085#1099#1093
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 59
    Top = 56
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 59
    Top = 4
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object Label3: TLabel
    Left = 56
    Top = 96
    Width = 32
    Height = 13
    Caption = 'Label3'
  end
  object Gauge3: TGauge
    Left = 80
    Top = 112
    Width = 489
    Height = 25
    ForeColor = clLime
    Progress = 0
  end
  object Gauge2: TGauge
    Left = 80
    Top = 24
    Width = 489
    Height = 25
    ForeColor = clLime
    Progress = 0
  end
  object Gauge1: TGauge
    Left = 80
    Top = 72
    Width = 489
    Height = 25
    ForeColor = clLime
    Progress = 0
  end
  object BitBtn1: TBitBtn
    Left = 40
    Top = 152
    Width = 78
    Height = 20
    Caption = '2 - '#1055#1045#1056#1045#1053#1054#1057
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 134
    Top = 152
    Width = 61
    Height = 20
    TabOrder = 1
    Kind = bkClose
  end
  object BitBtn3: TBitBtn
    Left = 48
    Top = 200
    Width = 113
    Height = 25
    Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
    TabOrder = 2
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 48
    Top = 232
    Width = 113
    Height = 25
    Caption = #1057#1090#1072#1090#1100#1080
    TabOrder = 3
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 184
    Top = 200
    Width = 121
    Height = 25
    Caption = '1 - '#1050#1072#1076#1088#1099
    TabOrder = 4
    OnClick = BitBtn5Click
  end
  object BitBtn6: TBitBtn
    Left = 184
    Top = 232
    Width = 121
    Height = 25
    Caption = #1041#1086#1083#1100#1085#1080#1095#1085#1099#1077
    Enabled = False
    TabOrder = 5
    Visible = False
    OnClick = BitBtn6Click
  end
  object DateTimePickerFr: TDateTimePicker
    Left = 208
    Top = 152
    Width = 129
    Height = 21
    Date = 38618.775425879630000000
    Time = 38618.775425879630000000
    DateFormat = dfLong
    TabOrder = 6
    OnChange = DateTimePickerFrChange
  end
  object DateTimePickerTo: TDateTimePicker
    Left = 368
    Top = 152
    Width = 121
    Height = 21
    Date = 38618.796630312500000000
    Time = 38618.796630312500000000
    DateFormat = dfLong
    TabOrder = 7
    OnChange = DateTimePickerToChange
  end
  object BitByn7: TBitBtn
    Left = 312
    Top = 232
    Width = 89
    Height = 25
    Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077
    Enabled = False
    TabOrder = 8
    Visible = False
    OnClick = BitByn7Click
  end
  object CheckBoxClear: TCheckBox
    Left = 504
    Top = 152
    Width = 97
    Height = 17
    Hint = 
      #1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1072#1103' '#1086#1095#1080#1089#1090#1082#1072' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093' '#1079#1072' '#1091#1082#1072#1079#1072#1085#1085#1099#1081' '#1087#1077#1088#1080#1086#1076' '#1076#1083#1103' '#1082#1072#1078#1076 +
      #1086#1075#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
    Caption = #1063#1080#1089#1090#1082#1072' '#1073#1072#1079#1099
    Checked = True
    ParentShowHint = False
    ShowHint = True
    State = cbChecked
    TabOrder = 9
  end
  object CheckBoxArc: TCheckBox
    Left = 504
    Top = 176
    Width = 97
    Height = 17
    Hint = #1055#1077#1088#1077#1085#1086#1089' '#1076#1072#1085#1085#1099#1093' '#1074' '#1072#1088#1093#1080#1074#1085#1091#1102' '#1073#1072#1079#1091
    Caption = #1040#1088#1093#1080#1074
    Checked = True
    ParentShowHint = False
    ShowHint = True
    State = cbChecked
    TabOrder = 10
  end
  object CheckBoxNeedIb: TCheckBox
    Left = 504
    Top = 200
    Width = 145
    Height = 17
    Caption = #1054#1090#1083#1072#1076#1086#1095#1085#1072#1103' '#1087#1077#1095#1072#1090#1100' SQL'
    TabOrder = 11
  end
  object BitBtn7: TBitBtn
    Left = 320
    Top = 200
    Width = 89
    Height = 25
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1080
    TabOrder = 12
    OnClick = BitBtn7Click
  end
  object BitBtn8: TBitBtn
    Left = 48
    Top = 264
    Width = 113
    Height = 25
    Caption = #1050#1072#1083#1077#1085#1076#1072#1088#1080
    Enabled = False
    TabOrder = 13
    Visible = False
    OnClick = BitBtn8Click
  end
  object BitBtn9: TBitBtn
    Left = 184
    Top = 264
    Width = 217
    Height = 25
    Caption = #1055#1077#1088#1077#1085#1086#1089' '#1082#1072#1076#1088#1086#1074' '#1080#1079' '#1086#1089#1085' '#1073#1072#1079#1099' '#1074' '#1072#1088#1093#1080#1074
    Enabled = False
    TabOrder = 14
    Visible = False
    OnClick = BitBtn9Click
  end
  object BitBtnGener: TBitBtn
    Left = 184
    Top = 232
    Width = 201
    Height = 25
    Caption = #1055#1077#1088#1077#1076' '#1075#1077#1085#1077#1088#1072#1094#1080#1077#1081' '#1085#1086#1074#1086#1075#1086' '#1084#1077#1089#1103#1094#1072
    TabOrder = 15
    OnClick = BitBtnGenerClick
  end
  object PopupMenu1: TPopupMenu
    Left = 440
    Top = 184
    object N1: TMenuItem
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
      OnClick = N1Click
    end
  end
end
