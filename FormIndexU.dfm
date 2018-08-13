object FormIndex: TFormIndex
  Left = 223
  Top = 179
  Width = 782
  Height = 419
  Caption = #1056#1072#1089#1095#1077#1090' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 96
    Top = 8
    Width = 60
    Height = 20
    Caption = #1044#1072#1090#1072' '#1079#1072
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 160
    Height = 20
    Caption = #1055#1088#1086#1094#1077#1085#1090' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080
  end
  object Label3: TLabel
    Left = 312
    Top = 48
    Width = 172
    Height = 20
    Caption = '('#1073#1086#1083#1100#1096#1077' 0 '#1080' '#1084#1077#1085#1100#1096#1077' 1)'
  end
  object Label4: TLabel
    Left = 8
    Top = 80
    Width = 106
    Height = 20
    Caption = #1055#1088#1086#1078#1080#1090#1086#1095#1085#1099#1081
  end
  object Label5: TLabel
    Left = 8
    Top = 96
    Width = 67
    Height = 20
    Caption = #1084#1080#1085#1080#1084#1091#1084
  end
  object Label6: TLabel
    Left = 312
    Top = 88
    Width = 29
    Height = 20
    Caption = #1075#1088#1085'.'
  end
  object GaugePodr: TGauge
    Left = 16
    Top = 200
    Width = 100
    Height = 100
    BorderStyle = bsNone
    ForeColor = clYellow
    Kind = gkPie
    Progress = 0
  end
  object GaugePerson: TGauge
    Left = 152
    Top = 200
    Width = 100
    Height = 100
    BorderStyle = bsNone
    ForeColor = clYellow
    Kind = gkPie
    Progress = 0
  end
  object LabelPodr: TLabel
    Left = 16
    Top = 176
    Width = 72
    Height = 20
    Caption = 'LabelPodr'
  end
  object LabelPerson: TLabel
    Left = 16
    Top = 312
    Width = 89
    Height = 20
    Caption = 'LabelPerson'
  end
  object LabelTimer: TLabel
    Left = 288
    Top = 296
    Width = 78
    Height = 20
    Caption = 'LabelTimer'
  end
  object Label7: TLabel
    Left = 416
    Top = 72
    Width = 67
    Height = 20
    Caption = #1056#1072#1079#1088#1103#1076#1099
  end
  object Label8: TLabel
    Left = 360
    Top = 96
    Width = 8
    Height = 20
    Caption = 'c'
  end
  object Label9: TLabel
    Left = 456
    Top = 96
    Width = 18
    Height = 20
    Caption = #1087#1086
  end
  object Label10: TLabel
    Left = 584
    Top = 16
    Width = 114
    Height = 20
    Caption = #1041#1072#1079#1086#1074#1099#1077' '#1076#1072#1090#1099' '
  end
  object Label11: TLabel
    Left = 560
    Top = 48
    Width = 11
    Height = 20
    Caption = #1057
  end
  object Label12: TLabel
    Left = 552
    Top = 80
    Width = 21
    Height = 20
    Caption = #1055#1086
  end
  object DateTimePickerDateZa: TDateTimePicker
    Left = 184
    Top = 8
    Width = 186
    Height = 28
    Hint = #1044#1072#1090#1072', '#1079#1072' '#1082#1086#1090#1086#1088#1091#1102' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1089#1103' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1103
    Date = 0.911289039351686400
    Time = 0.911289039351686400
    DateFormat = dfLong
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object EditProcInd: TEdit
    Left = 184
    Top = 48
    Width = 121
    Height = 28
    Hint = #1055#1088#1086#1094#1077#1085#1090' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Text = '0'
    OnChange = EditProcIndChange
    OnExit = EditProcIndExit
  end
  object EditLimitSumma: TEdit
    Left = 184
    Top = 88
    Width = 121
    Height = 28
    Hint = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1080#1085#1076#1077#1082#1089#1080#1088#1091#1077#1084#1072#1103' '#1089#1091#1084#1084#1072
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Text = '0'
    OnChange = EditLimitSummaChange
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 136
    Width = 201
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1102
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 216
    Top = 136
    Width = 345
    Height = 25
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081', '#1082#1072#1090#1077#1075#1086#1088#1080#1081' '#1080' '#1089#1095#1077#1090#1086#1074
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 456
    Top = 168
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 5
    Kind = bkClose
  end
  object BitBtn4: TBitBtn
    Left = 216
    Top = 168
    Width = 225
    Height = 25
    Caption = #1055#1086#1074#1099#1089#1080#1090#1100' '#1086#1082#1083#1072#1076#1099
    Enabled = False
    TabOrder = 6
    Visible = False
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 272
    Top = 200
    Width = 281
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1076#1074#1086#1081#1085#1080#1082#1086#1074' '#1087#1086' '#1079' '#1087
    TabOrder = 7
    OnClick = BitBtn5Click
  end
  object BitBtn6: TBitBtn
    Left = 272
    Top = 232
    Width = 281
    Height = 25
    Caption = #1055#1088#1086#1094#1077#1085#1090#1080' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080' '#1087#1086' '#1076#1072#1090#1072#1084
    TabOrder = 8
    OnClick = BitBtn6Click
  end
  object CheckBox1: TCheckBox
    Left = 200
    Top = 320
    Width = 361
    Height = 17
    Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1072#1085#1085#1099#1084' '#1088#1072#1089#1089#1095#1080#1090#1099#1074#1072#1090#1100' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1102
    TabOrder = 9
  end
  object RazrFrEdit: TSpinEdit
    Left = 384
    Top = 96
    Width = 57
    Height = 30
    MaxValue = 25
    MinValue = 1
    TabOrder = 10
    Value = 1
  end
  object RazrToEdit: TSpinEdit
    Left = 488
    Top = 96
    Width = 57
    Height = 30
    MaxValue = 25
    MinValue = 1
    TabOrder = 11
    Value = 1
  end
  object BitBtn7: TBitBtn
    Left = 272
    Top = 264
    Width = 281
    Height = 25
    Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1073#1072#1079#1086#1074#1099#1077' '#1076#1072#1090#1099
    TabOrder = 12
    OnClick = BitBtn7Click
  end
  object Button1: TButton
    Left = 352
    Top = 344
    Width = 193
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1102
    TabOrder = 13
    OnClick = Button1Click
  end
  object CheckBoxUdIndOtherRazr: TCheckBox
    Left = 16
    Top = 344
    Width = 329
    Height = 17
    Caption = #1059#1076#1072#1083#1103#1090#1100' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1102' '#1076#1088#1091#1075#1080#1084' '#1088#1072#1079#1088#1103#1076#1072#1084
    TabOrder = 14
  end
  object DateTimePicker1: TDateTimePicker
    Left = 576
    Top = 40
    Width = 186
    Height = 28
    Date = 41750.649469398150000000
    Time = 41750.649469398150000000
    DateFormat = dfLong
    TabOrder = 15
  end
  object DateTimePicker2: TDateTimePicker
    Left = 576
    Top = 80
    Width = 186
    Height = 28
    Date = 41750.650054432880000000
    Time = 41750.650054432880000000
    DateFormat = dfLong
    TabOrder = 16
  end
  object Timer1: TTimer
    Left = 320
    Top = 296
  end
  object pFIBQuery: TpFIBQuery
    Transaction = pFIBTransaction
    Database = FIB.pFIBDatabaseSal
    Left = 392
    Top = 8
  end
  object pFIBTransaction: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 432
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    Left = 392
    Top = 288
    object N11: TMenuItem
      Caption = #1057#1087#1080#1089#1086#1082' '#1076#1074#1086#1081#1085#1080#1082#1086#1074' < 1'
    end
    object N1: TMenuItem
      Caption = #1057#1087#1080#1089#1086#1082' '#1089' '#1073#1072#1079#1086#1074#1086#1081' '#1076#1072#1090#1086#1081
    end
    object N2: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1102' ('#1073#1072#1079#1086#1074' '#1076#1072#1090#1072' > '#1084#1072#1082#1089')'
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1055#1077#1088#1077#1085#1086#1089' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080' '#1089' 2012 07'
      OnClick = N3Click
    end
    object N20121: TMenuItem
      Caption = #1048#1085#1076#1077#1082#1089#1072#1094#1080#1103' '#1089' '#1080#1102#1083#1103' 2012'
      OnClick = N20121Click
    end
    object n20140104: TMenuItem
      Caption = #1055#1077#1088#1077#1085#1086#1089' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080' '#1084#1072#1103' 2014 '#1074' '#1080#1102#1085#1100' 2014 '#1089' '#1084#1080#1085#1091#1089#1086#1084
      OnClick = n20140104Click
    end
    object N20151: TMenuItem
      Caption = #1048#1085#1076#1077#1082#1089#1072#1094#1080#1103'  '#1085#1086#1103#1073#1088#1100' 2015'
      OnClick = N20151Click
    end
    object N20152: TMenuItem
      Caption = #1055#1088#1077#1084#1080#1103' '#1074#1089#1077#1084' '#1074' '#1085#1086#1103#1073#1088#1077' 2015'
      OnClick = N20152Click
    end
    object N1220151: TMenuItem
      Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1082#1072' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080' '#1074' 12 2015'
      OnClick = N1220151Click
    end
    object N122015N1: TMenuItem
      Caption = #1055#1077#1088#1077#1085#1086#1089' '#1080#1085#1076' '#1074' 12 2015 '#1080#1079' '#1057'N'
      OnClick = N122015N1Click
    end
    object F41: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1092#1080#1082#1089#1080#1074#1088#1086#1074#1072#1085#1085#1099#1077' '#1089#1091#1084#1084#1099' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080' '#1080#1079' F4'
      OnClick = F41Click
    end
  end
  object pFIBQuery1: TpFIBQuery
    Transaction = pFIBTransaction1
    Database = FIB.pFIBDatabaseSal
    Left = 472
    Top = 8
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 512
    Top = 8
  end
end
