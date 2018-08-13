object FormUpdAdd: TFormUpdAdd
  Left = 264
  Top = 281
  Width = 598
  Height = 263
  Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
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
    Left = 24
    Top = 8
    Width = 56
    Height = 20
    Caption = #1057#1090#1072#1090#1100#1103
  end
  object ShifrText: TLabel
    Left = 88
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
  object Label3: TLabel
    Left = 24
    Top = 48
    Width = 49
    Height = 20
    Caption = #1057#1091#1084#1084#1072
  end
  object Label4: TLabel
    Left = 16
    Top = 82
    Width = 59
    Height = 20
    Caption = #1055#1077#1088#1080#1086#1076
  end
  object Label5: TLabel
    Left = 32
    Top = 128
    Width = 39
    Height = 20
    Caption = #1044#1085#1077#1081
  end
  object Label2: TLabel
    Left = 224
    Top = 48
    Width = 29
    Height = 20
    Caption = #1075#1088#1085'.'
  end
  object BitBtn1: TBitBtn
    Left = 528
    Top = 8
    Width = 49
    Height = 25
    Caption = '. . .'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object dxCalcEditSumm: TdxCalcEdit
    Left = 88
    Top = 48
    Width = 129
    TabOrder = 1
    Alignment = taRightJustify
    Text = '0.00'
    OnChange = dxCalcEditSummChange
    PopupAlignment = taRightJustify
    Precision = 10
    StoredValues = 1
  end
  object BitBtn2: TBitBtn
    Left = 56
    Top = 152
    Width = 97
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 56
    Top = 184
    Width = 97
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 3
    Kind = bkClose
  end
  object dxSpinEditDay: TdxSpinEdit
    Left = 88
    Top = 120
    Width = 65
    TabOrder = 4
    Alignment = taRightJustify
    OnChange = dxSpinEditDayChange
    MaxValue = 31.000000000000000000
    StoredValues = 17
  end
  object RadioGroup1: TRadioGroup
    Left = 168
    Top = 120
    Width = 113
    Height = 81
    Caption = #1060#1086#1085#1076
    ItemIndex = 0
    Items.Strings = (
      #1060#1047#1055' '
      #1060#1052#1055' '
      #1055#1088#1086#1095#1080#1077)
    TabOrder = 5
    OnClick = RadioGroup1Click
  end
  object PanelNP: TPanel
    Left = 313
    Top = 40
    Width = 256
    Height = 161
    TabOrder = 6
    object LabelWC: TLabel
      Left = 192
      Top = 16
      Width = 44
      Height = 20
      Caption = #1095#1072#1089#1086#1074
    end
    object LabelMClock: TLabel
      Left = 16
      Top = 64
      Width = 70
      Height = 20
      Caption = #1042' '#1084#1077#1089#1103#1094#1077
    end
    object Label6: TLabel
      Left = 8
      Top = 24
      Width = 85
      Height = 20
      Caption = #1054#1090#1088#1072#1073#1086#1090#1072#1083
    end
    object Label7: TLabel
      Left = 192
      Top = 64
      Width = 44
      Height = 20
      Caption = #1095#1072#1089#1086#1074
    end
    object LabelOklad: TLabel
      Left = 8
      Top = 96
      Width = 80
      Height = 20
      Caption = 'LabelOklad'
    end
    object dxCalcEditWClock: TdxCalcEdit
      Left = 96
      Top = 16
      Width = 89
      TabOrder = 0
      Alignment = taRightJustify
      Text = '0'
      OnChange = dxCalcEditWClockChange
      StoredValues = 1
    end
    object dxCalcEditMClock: TdxCalcEdit
      Left = 96
      Top = 56
      Width = 89
      TabOrder = 1
      Alignment = taRightJustify
      Text = '0'
      OnChange = dxCalcEditMClockChange
      StoredValues = 1
    end
    object BitBtn4: TBitBtn
      Left = 80
      Top = 128
      Width = 75
      Height = 25
      Caption = #1056#1072#1089#1095#1077#1090
      TabOrder = 2
      OnClick = BitBtn4Click
    end
  end
  object DateTimePickerZa: TDateTimePicker
    Left = 88
    Top = 80
    Width = 153
    Height = 28
    Date = 40658.554356909720000000
    Format = 'MMMM yyyy'
    Time = 40658.554356909720000000
    DateFormat = dfLong
    DateMode = dmUpDown
    TabOrder = 7
    OnChange = DateTimePickerZaChange
  end
  object PanelToTClock: TPanel
    Left = 312
    Top = 40
    Width = 257
    Height = 161
    TabOrder = 8
    object LabelPClock: TLabel
      Left = 24
      Top = 32
      Width = 47
      Height = 20
      Caption = #1063#1072#1089#1086#1074
    end
    object LabelTotClockForPochas: TLabel
      Left = 24
      Top = 72
      Width = 178
      Height = 20
      Caption = 'LabelTotClockForPochas'
    end
    object LabelClockPrice: TLabel
      Left = 24
      Top = 96
      Width = 113
      Height = 20
      Caption = 'LabelClockPrice'
    end
    object LabelTotForTest: TLabel
      Left = 24
      Top = 120
      Width = 117
      Height = 20
      Caption = 'LabelTotForTest'
    end
    object dxCalcEditPClock: TdxCalcEdit
      Left = 80
      Top = 32
      Width = 89
      TabOrder = 0
      Text = '0'
      OnChange = dxCalcEditPClockChange
    end
  end
end
