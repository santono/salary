object FormKadry: TFormKadry
  Left = 206
  Top = 98
  Width = 699
  Height = 618
  Caption = #1057#1087#1080#1089#1086#1082' '#1082#1072#1092#1077#1076#1088#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    683
    580)
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 358
    Top = 40
    Width = 80
    Height = 20
    Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 400
    Top = 8
    Width = 38
    Height = 20
    Caption = #1057#1095#1077#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 352
    Top = 72
    Width = 86
    Height = 20
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelOklad: TLabel
    Left = 344
    Top = 264
    Width = 50
    Height = 20
    Caption = #1054#1082#1083#1072#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 552
    Top = 270
    Width = 29
    Height = 20
    Caption = #1075#1088#1085'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 328
    Top = 136
    Width = 111
    Height = 20
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100' ('#1057')'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 344
    Top = 107
    Width = 96
    Height = 20
    Caption = #1044#1086#1083#1103' '#1089#1090#1072#1074#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 352
    Top = 236
    Width = 91
    Height = 20
    Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 352
    Top = 203
    Width = 91
    Height = 20
    Caption = #1056#1077#1078#1080#1084' '#1089#1086#1074#1084
  end
  object LabelTemy: TLabel
    Left = 400
    Top = 296
    Width = 38
    Height = 20
    Caption = #1058#1077#1084#1072
  end
  object Label11: TLabel
    Left = 304
    Top = 332
    Width = 138
    Height = 20
    Caption = #1052#1077#1089#1090#1086' '#1086#1089#1085'.'#1088#1072#1073#1086#1090#1099
  end
  object Label12: TLabel
    Left = 312
    Top = 362
    Width = 130
    Height = 20
    Caption = #1054#1090#1082#1091#1076#1072' '#1087#1086#1089#1090#1091#1087#1080#1083
  end
  object LabelUw: TLabel
    Left = 376
    Top = 392
    Width = 63
    Height = 20
    Caption = #1044#1072#1090#1072' '#1076#1086
  end
  object Label14: TLabel
    Left = 360
    Top = 424
    Width = 82
    Height = 20
    Caption = #1055#1088#1086#1092#1089#1086#1102#1079
  end
  object LabelBank: TLabel
    Left = 400
    Top = 464
    Width = 37
    Height = 20
    Caption = #1041#1072#1085#1082
  end
  object Label16: TLabel
    Left = 384
    Top = 496
    Width = 54
    Height = 20
    Caption = #1048#1076'.'#1082#1086#1076
  end
  object Label17: TLabel
    Left = 384
    Top = 168
    Width = 56
    Height = 20
    Caption = #1056#1072#1079#1088#1103#1076
  end
  object Label5f: TLabel
    Left = 312
    Top = 296
    Width = 53
    Height = 20
    Caption = 'Label5f'
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 8
    Width = 292
    Height = 560
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 2
    DefaultRowHeight = 20
    FixedCols = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnDrawCell = StringGrid1DrawCell
    OnEnter = StringGrid1Enter
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      64
      64)
  end
  object ComboBoxKat: TComboBox
    Left = 448
    Top = 40
    Width = 217
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 20
    ParentFont = False
    TabOrder = 1
    Text = 'ComboBoxKat'
    OnChange = ComboBoxKatChange
  end
  object ComboBoxGru: TComboBox
    Left = 448
    Top = 8
    Width = 217
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 20
    ParentFont = False
    TabOrder = 2
    Text = 'ComboBoxGru'
    OnChange = ComboBoxGruChange
  end
  object EditDolg: TEdit
    Left = 448
    Top = 72
    Width = 217
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = 'EditDolg'
    OnChange = EditDolgChange
  end
  object EditOklad: TEdit
    Left = 448
    Top = 264
    Width = 97
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = 'EditOklad'
    OnChange = EditOkladChange
  end
  object ComboBoxDol: TComboBox
    Left = 448
    Top = 136
    Width = 217
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 20
    ParentFont = False
    TabOrder = 5
    Text = 'ComboBoxDol'
    OnChange = ComboBoxDolChange
  end
  object EditKoef: TEdit
    Left = 448
    Top = 104
    Width = 121
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Text = 'EditKoef'
    OnChange = EditKoefChange
  end
  object ComboBoxWR: TComboBox
    Left = 448
    Top = 232
    Width = 217
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 20
    ParentFont = False
    TabOrder = 7
    Text = 'ComboBoxWR'
    OnChange = ComboBoxWRChange
  end
  object ComboBoxSwm: TComboBox
    Left = 448
    Top = 200
    Width = 217
    Height = 28
    ItemHeight = 20
    TabOrder = 8
    Text = 'ComboBoxSwm'
    OnChange = ComboBoxSwmChange
  end
  object ComboBoxTemy: TComboBox
    Left = 448
    Top = 296
    Width = 169
    Height = 28
    ItemHeight = 20
    TabOrder = 9
    Text = 'ComboBoxTemy'
    OnChange = ComboBoxTemyChange
  end
  object ComboBoxMOR: TComboBox
    Left = 448
    Top = 328
    Width = 233
    Height = 28
    ItemHeight = 20
    TabOrder = 10
    Text = 'ComboBoxMOR'
    OnChange = ComboBoxMORChange
  end
  object ComboBoxFrom: TComboBox
    Left = 448
    Top = 360
    Width = 233
    Height = 28
    ItemHeight = 20
    TabOrder = 11
    Text = 'ComboBoxFrom'
    OnChange = ComboBoxFromChange
  end
  object EditKwoD: TEdit
    Left = 448
    Top = 392
    Width = 121
    Height = 28
    Enabled = False
    TabOrder = 12
    Text = '0'
    Visible = False
    OnChange = EditKwoDChange
  end
  object UpDown1: TUpDown
    Left = 569
    Top = 392
    Width = 20
    Height = 28
    Associate = EditKwoD
    Min = -15
    Max = 15
    TabOrder = 13
  end
  object ComboBoxProf: TComboBox
    Left = 448
    Top = 424
    Width = 145
    Height = 28
    ItemHeight = 20
    TabOrder = 14
    Text = 'ComboBoxProf'
    OnChange = ComboBoxProfChange
  end
  object ComboBoxBank: TComboBox
    Left = 448
    Top = 456
    Width = 225
    Height = 28
    ItemHeight = 20
    TabOrder = 15
    Text = 'ComboBoxBank'
    OnChange = ComboBoxBankChange
  end
  object BitBtn1: TBitBtn
    Left = 592
    Top = 496
    Width = 88
    Height = 24
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 16
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 592
    Top = 528
    Width = 88
    Height = 24
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 17
    OnClick = BitBtn2Click
  end
  object UpDownRazr: TUpDown
    Left = 569
    Top = 168
    Width = 20
    Height = 28
    Associate = EditRazr
    Max = 24
    TabOrder = 18
  end
  object EditRazr: TEdit
    Left = 448
    Top = 168
    Width = 121
    Height = 28
    TabOrder = 19
    Text = '0'
    OnChange = EditRazrChange
  end
  object EditIdCode: TMaskEdit
    Left = 448
    Top = 496
    Width = 121
    Height = 28
    EditMask = '0000000000;0; '
    MaxLength = 10
    TabOrder = 20
    OnChange = EditIdCodeChange
  end
  object btnSave: TButton
    Left = 312
    Top = 536
    Width = 273
    Height = 33
    Caption = #1047#1072#1087#1086#1084#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '
    TabOrder = 21
    OnClick = btnSaveClick
  end
  object btnChgFam: TBitBtn
    Left = 320
    Top = 464
    Width = 75
    Height = 25
    Caption = #1048#1079#1084'.'#1060#1048#1054
    TabOrder = 22
    OnClick = btnChgFamClick
  end
  object DateTimePickerUw: TDateTimePicker
    Left = 448
    Top = 392
    Width = 161
    Height = 28
    Date = 41594.870955312500000000
    Time = 41594.870955312500000000
    DateFormat = dfLong
    TabOrder = 23
    OnChange = DateTimePickerUwChange
  end
  object BitBtnUw: TBitBtn
    Left = 616
    Top = 392
    Width = 65
    Height = 25
    Caption = #1057#1073#1088#1086#1089
    TabOrder = 24
    OnClick = BitBtnUwClick
  end
  object BitBtnUwEn: TBitBtn
    Left = 368
    Top = 392
    Width = 313
    Height = 25
    Caption = #1042#1074#1077#1089#1090#1080' '#1076#1072#1090#1091' '#1091#1074#1086#1083#1100#1085#1077#1085#1080#1103
    TabOrder = 25
    OnClick = BitBtnUwEnClick
  end
  object BitBtn3: TBitBtn
    Left = 581
    Top = 267
    Width = 97
    Height = 25
    Caption = #1055#1086' '#1088#1072#1079#1088#1103#1076#1091
    TabOrder = 26
    OnClick = BitBtn3Click
  end
  object ChgTabno: TBitBtn
    Left = 320
    Top = 496
    Width = 75
    Height = 25
    Caption = #1048#1079#1084' '#1090'.'#1085'.'
    TabOrder = 27
    OnClick = ChgTabnoClick
  end
  object btSearchDolg: TBitBtn
    Left = 640
    Top = 104
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 28
    OnClick = btSearchDolgClick
  end
  object BitBtnDogPodSowm: TBitBtn
    Left = 624
    Top = 296
    Width = 30
    Height = 25
    Caption = '. . .'
    TabOrder = 29
    OnClick = BitBtnDogPodSowmClick
  end
  object ActionList1: TActionList
    Left = 120
    Top = 200
    object ActionCopyPerson: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      OnExecute = ActionCopyPersonExecute
    end
    object ActionSetPersonMainParameter: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1086#1089#1090#1103#1085#1080#1077' '#1087#1077#1088#1077#1074#1086#1076#1072
      OnExecute = ActionSetPersonMainParameterExecute
    end
    object actCopyPersonFromPreviousMonth: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '#1080#1079' '#1087#1088#1086#1096#1083#1086#1075#1086' '#1084#1077#1089#1103#1094#1072
      OnExecute = actCopyPersonFromPreviousMonthExecute
    end
    object actCopyPersonFromPM: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077' '#1080#1079' '#1076#1088' '#1087#1086#1076#1088' '#1080' '#1076#1088' '#1084#1077#1089
      OnExecute = actCopyPersonFromPMExecute
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 184
    Top = 136
    object N1: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      object N3: TMenuItem
        Action = ActionCopyPerson
      end
      object N4: TMenuItem
        Action = actCopyPersonFromPreviousMonth
      end
      object N5: TMenuItem
        Action = actCopyPersonFromPM
      end
    end
    object N2: TMenuItem
      Action = ActionSetPersonMainParameter
    end
  end
end
