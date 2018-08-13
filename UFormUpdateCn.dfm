object FormUpdateCn: TFormUpdateCn
  Left = 250
  Top = 244
  Width = 696
  Height = 330
  Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 50
    Height = 24
    Caption = #1064#1080#1092#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object ShifrText: TLabel
    Left = 72
    Top = 8
    Width = 64
    Height = 24
    Caption = #1057#1090#1072#1090#1100#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 64
    Width = 61
    Height = 24
    Caption = #1056#1077#1078#1080#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 104
    Width = 58
    Height = 24
    Caption = #1057#1091#1084#1084#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 272
    Top = 104
    Width = 36
    Height = 24
    Caption = #1075#1088#1074'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelPrim: TLabel
    Left = 16
    Top = 144
    Width = 48
    Height = 24
    Caption = #1055#1088#1080#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelPrim1: TLabel
    Left = 8
    Top = 184
    Width = 63
    Height = 24
    Caption = #1055#1088#1080#1084' 1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelAlim: TLabel
    Left = 280
    Top = 144
    Width = 69
    Height = 20
    Caption = 'LabelAlim'
  end
  object LabelPSbor: TLabel
    Left = 280
    Top = 176
    Width = 83
    Height = 20
    Caption = 'LabelPSbor'
  end
  object LabelAdres: TLabel
    Left = 280
    Top = 208
    Width = 81
    Height = 20
    Caption = 'LabelAdres'
  end
  object BitBtn1: TBitBtn
    Left = 576
    Top = 8
    Width = 41
    Height = 25
    Caption = '. . .'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object CheckBox1: TCheckBox
    Left = 64
    Top = 40
    Width = 113
    Height = 17
    Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1077' '#1092#1083#1072#1078#1086#1082', '#1077#1089#1083#1080' '#1096#1080#1092#1088#1090' '#1089#1083#1091#1078#1077#1073#1085#1092#1081
    Caption = #1057#1083#1091#1078#1077#1073#1085#1099#1081
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object ComboBoxKodAdd: TComboBox
    Left = 72
    Top = 64
    Width = 265
    Height = 28
    Hint = #1056#1077#1078#1080#1084' '#1088#1072#1089#1095#1077#1090#1072' '#1089#1090#1072#1090#1100#1080
    ItemHeight = 20
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnChange = ComboBoxKodAddChange
    OnSelect = ComboBoxKodAddSelect
  end
  object dxCalcEditSumm: TdxCalcEdit
    Left = 72
    Top = 104
    Width = 193
    Hint = #1057#1091#1084#1084#1072
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Alignment = taRightJustify
    Text = '0.00'
    OnChange = dxCalcEditSummChange
    Precision = 10
    StoredValues = 1
  end
  object dxCalcEditPrim: TdxCalcEdit
    Left = 72
    Top = 144
    Width = 193
    TabOrder = 4
    Alignment = taRightJustify
    Text = '0'
    OnChange = dxCalcEditPrimChange
    Precision = 10
    StoredValues = 1
  end
  object MaskEdit1: TMaskEdit
    Left = 72
    Top = 184
    Width = 193
    Height = 28
    TabOrder = 5
    OnChange = MaskEdit1Change
  end
  object BitBtn2: TBitBtn
    Left = 16
    Top = 232
    Width = 113
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 6
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 160
    Top = 232
    Width = 89
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 7
    Kind = bkClose
  end
  object BitBtn4: TBitBtn
    Left = 280
    Top = 232
    Width = 105
    Height = 25
    Caption = #1040#1083#1080#1084#1077#1085#1090#1099
    TabOrder = 8
    OnClick = BitBtn4Click
  end
  object ComboBoxKodUd: TComboBox
    Left = 344
    Top = 64
    Width = 233
    Height = 28
    Hint = #1056#1077#1078#1080#1084' '#1088#1072#1089#1077#1090#1072' '#1089#1090#1072#1090#1100#1080
    ItemHeight = 20
    TabOrder = 9
    OnChange = ComboBoxKodUdChange
    OnSelect = ComboBoxKodUdSelect
  end
  object ComboBoxKodBlock: TComboBox
    Left = 344
    Top = 32
    Width = 233
    Height = 28
    ItemHeight = 20
    TabOrder = 10
    OnChange = ComboBoxKodBlockChange
    OnSelect = ComboBoxKodBlockSelect
  end
  object dtpDataUw: TDateTimePicker
    Left = 424
    Top = 144
    Width = 186
    Height = 28
    Date = 40678.977971643510000000
    Time = 40678.977971643510000000
    DateFormat = dfLong
    Enabled = False
    TabOrder = 11
    Visible = False
    OnChange = dtpDataUwChange
  end
  object dtpDataPri: TDateTimePicker
    Left = 424
    Top = 176
    Width = 186
    Height = 28
    Date = 41357.617984664350000000
    Time = 41357.617984664350000000
    DateFormat = dfLong
    TabOrder = 12
    OnChange = dtpDataPriChange
  end
  object btnPodr: TBitBtn
    Left = 384
    Top = 232
    Width = 185
    Height = 25
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
    TabOrder = 13
    OnClick = btnPodrClick
  end
end
