object FormKadry: TFormKadry
  Left = 193
  Top = 139
  Width = 955
  Height = 618
  Caption = #1057#1087#1080#1089#1086#1082' '#1082#1072#1092#1077#1076#1088#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object Splitter1: TSplitter
    Left = 200
    Top = 0
    Height = 580
  end
  object PanelList: TPanel
    Left = 0
    Top = 0
    Width = 200
    Height = 580
    Align = alLeft
    Caption = 'PanelList'
    TabOrder = 0
    OnResize = PanelListResize
    DesignSize = (
      200
      580)
    object StringGrid1: TStringGrid
      Left = 1
      Top = 2
      Width = 194
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
        125)
    end
  end
  object PanelForm: TPanel
    Left = 203
    Top = 0
    Width = 736
    Height = 580
    Align = alClient
    TabOrder = 1
    object LabelUw: TLabel
      Left = 99
      Top = 371
      Width = 63
      Height = 20
      Caption = #1044#1072#1090#1072' '#1076#1086
    end
    object LabelTemy: TLabel
      Left = 124
      Top = 282
      Width = 38
      Height = 20
      Caption = #1058#1077#1084#1072
    end
    object LabelOklad: TLabel
      Left = 112
      Top = 252
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
    object LabelBank: TLabel
      Left = 125
      Top = 430
      Width = 37
      Height = 20
      Caption = #1041#1072#1085#1082
    end
    object Label9: TLabel
      Left = 71
      Top = 192
      Width = 91
      Height = 20
      Caption = #1056#1077#1078#1080#1084' '#1089#1086#1074#1084
    end
    object Label8: TLabel
      Left = 72
      Top = 222
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
    object Label7: TLabel
      Left = 66
      Top = 103
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
    object Label6: TLabel
      Left = 51
      Top = 133
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
    object Label5f: TLabel
      Left = 16
      Top = 280
      Width = 53
      Height = 20
      Caption = 'Label5f'
    end
    object Label5: TLabel
      Left = 267
      Top = 254
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
    object Label3: TLabel
      Left = 76
      Top = 73
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
    object Label2: TLabel
      Left = 124
      Top = 14
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
    object Label17: TLabel
      Left = 106
      Top = 163
      Width = 56
      Height = 20
      Caption = #1056#1072#1079#1088#1103#1076
    end
    object Label16: TLabel
      Left = 108
      Top = 460
      Width = 54
      Height = 20
      Caption = #1048#1076'.'#1082#1086#1076
    end
    object Label14: TLabel
      Left = 80
      Top = 401
      Width = 82
      Height = 20
      Caption = #1055#1088#1086#1092#1089#1086#1102#1079
    end
    object Label12: TLabel
      Left = 32
      Top = 341
      Width = 130
      Height = 20
      Caption = #1054#1090#1082#1091#1076#1072' '#1087#1086#1089#1090#1091#1087#1080#1083
    end
    object Label11: TLabel
      Left = 24
      Top = 311
      Width = 138
      Height = 20
      Caption = #1052#1077#1089#1090#1086' '#1086#1089#1085'.'#1088#1072#1073#1086#1090#1099
    end
    object Label1: TLabel
      Left = 82
      Top = 44
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
    object EditRazr: TEdit
      Left = 167
      Top = 163
      Width = 121
      Height = 28
      TabOrder = 0
      Text = '0'
      OnChange = EditRazrChange
    end
    object EditOklad: TEdit
      Left = 167
      Top = 252
      Width = 97
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'EditOklad'
      OnChange = EditOkladChange
    end
    object EditKwoD: TEdit
      Left = 15
      Top = 496
      Width = 121
      Height = 28
      Enabled = False
      TabOrder = 2
      Text = '0'
      Visible = False
      OnChange = EditKwoDChange
    end
    object EditKoef: TEdit
      Left = 167
      Top = 103
      Width = 121
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = 'EditKoef'
      OnChange = EditKoefChange
    end
    object EditIdCode: TMaskEdit
      Left = 167
      Top = 460
      Width = 121
      Height = 28
      EditMask = '0000000000;0; '
      MaxLength = 10
      TabOrder = 4
      OnChange = EditIdCodeChange
    end
    object EditDolg: TEdit
      Left = 167
      Top = 73
      Width = 217
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      Text = 'EditDolg'
      OnChange = EditDolgChange
    end
    object DateTimePickerUw: TDateTimePicker
      Left = 167
      Top = 371
      Width = 161
      Height = 28
      Date = 41594.870955312500000000
      Time = 41594.870955312500000000
      DateFormat = dfLong
      TabOrder = 6
      OnChange = DateTimePickerUwChange
    end
    object ComboBoxWR: TComboBox
      Left = 167
      Top = 222
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
    object ComboBoxTemy: TComboBox
      Left = 167
      Top = 282
      Width = 169
      Height = 28
      ItemHeight = 20
      TabOrder = 8
      Text = 'ComboBoxTemy'
      OnChange = ComboBoxTemyChange
    end
    object ComboBoxSwm: TComboBox
      Left = 167
      Top = 192
      Width = 217
      Height = 28
      ItemHeight = 20
      TabOrder = 9
      Text = 'ComboBoxSwm'
      OnChange = ComboBoxSwmChange
    end
    object ComboBoxProf: TComboBox
      Left = 167
      Top = 401
      Width = 145
      Height = 28
      ItemHeight = 20
      TabOrder = 10
      Text = 'ComboBoxProf'
      OnChange = ComboBoxProfChange
    end
    object ComboBoxMOR: TComboBox
      Left = 167
      Top = 311
      Width = 233
      Height = 28
      ItemHeight = 20
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      Text = 'ComboBoxMOR'
      OnChange = ComboBoxMORChange
    end
    object ComboBoxKat: TComboBox
      Left = 167
      Top = 46
      Width = 217
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 20
      ParentFont = False
      TabOrder = 12
      Text = 'ComboBoxKat'
      OnChange = ComboBoxKatChange
    end
    object ComboBoxGru: TComboBox
      Left = 167
      Top = 14
      Width = 217
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 20
      ParentFont = False
      TabOrder = 13
      Text = 'ComboBoxGru'
      OnChange = ComboBoxGruChange
    end
    object ComboBoxFrom: TComboBox
      Left = 167
      Top = 341
      Width = 233
      Height = 28
      ItemHeight = 20
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      Text = 'ComboBoxFrom'
      OnChange = ComboBoxFromChange
    end
    object ComboBoxDol: TComboBox
      Left = 167
      Top = 133
      Width = 217
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 20
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
      Text = 'ComboBoxDol'
      OnChange = ComboBoxDolChange
    end
    object ComboBoxBank: TComboBox
      Left = 167
      Top = 430
      Width = 225
      Height = 28
      ItemHeight = 20
      TabOrder = 16
      Text = 'ComboBoxBank'
      OnChange = ComboBoxBankChange
    end
    object ChgTabno: TBitBtn
      Left = 24
      Top = 496
      Width = 75
      Height = 25
      Caption = #1048#1079#1084' '#1090'.'#1085'.'
      TabOrder = 17
      OnClick = ChgTabnoClick
    end
    object btSearchDolg: TBitBtn
      Left = 295
      Top = 104
      Width = 25
      Height = 25
      Caption = '...'
      TabOrder = 18
      OnClick = btSearchDolgClick
    end
    object btnSave: TButton
      Left = 111
      Top = 528
      Width = 273
      Height = 33
      Caption = #1047#1072#1087#1086#1084#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '
      TabOrder = 19
      OnClick = btnSaveClick
    end
    object btnChgFam: TBitBtn
      Left = 24
      Top = 528
      Width = 75
      Height = 25
      Caption = #1048#1079#1084'.'#1060#1048#1054
      TabOrder = 20
      OnClick = btnChgFamClick
    end
    object BitBtnUwEn: TBitBtn
      Left = 167
      Top = 371
      Width = 313
      Height = 25
      Caption = #1042#1074#1077#1089#1090#1080' '#1076#1072#1090#1091' '#1091#1074#1086#1083#1100#1085#1077#1085#1080#1103
      TabOrder = 21
      OnClick = BitBtnUwEnClick
    end
    object BitBtnUw: TBitBtn
      Left = 327
      Top = 371
      Width = 65
      Height = 25
      Caption = #1057#1073#1088#1086#1089
      TabOrder = 22
      OnClick = BitBtnUwClick
    end
    object BitBtnDogPodSowm: TBitBtn
      Left = 338
      Top = 282
      Width = 30
      Height = 25
      Caption = '. . .'
      TabOrder = 23
      OnClick = BitBtnDogPodSowmClick
    end
    object BitBtn3: TBitBtn
      Left = 295
      Top = 252
      Width = 97
      Height = 25
      Caption = #1055#1086' '#1088#1072#1079#1088#1103#1076#1091
      TabOrder = 24
      OnClick = BitBtn3Click
    end
    object BitBtn2: TBitBtn
      Left = 408
      Top = 528
      Width = 88
      Height = 24
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 25
      OnClick = BitBtn2Click
    end
    object BitBtn1: TBitBtn
      Left = 408
      Top = 496
      Width = 88
      Height = 24
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 26
      OnClick = BitBtn1Click
    end
    object UpDownRazr: TUpDown
      Left = 288
      Top = 163
      Width = 20
      Height = 28
      Associate = EditRazr
      Max = 24
      TabOrder = 27
    end
    object UpDown1: TUpDown
      Left = 136
      Top = 496
      Width = 20
      Height = 28
      Associate = EditKwoD
      Min = -15
      Max = 15
      TabOrder = 28
      Visible = False
    end
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
