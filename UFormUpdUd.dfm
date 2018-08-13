object FormUpdUd: TFormUpdUd
  Left = 228
  Top = 275
  Width = 696
  Height = 192
  Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1091#1076#1077#1088#1078#1072#1085#1080#1103
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
    Width = 56
    Height = 20
    Caption = #1057#1090#1072#1090#1100#1103
  end
  object ShifrText: TLabel
    Left = 80
    Top = 8
    Width = 74
    Height = 24
    Caption = 'ShifrText'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 48
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
  object Label3: TLabel
    Left = 256
    Top = 48
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
  object Label4: TLabel
    Left = 8
    Top = 88
    Width = 69
    Height = 24
    Caption = #1044#1072#1090#1072' '#1079#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 600
    Top = 8
    Width = 49
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
  object dxCalcEditSumm: TdxCalcEdit
    Left = 88
    Top = 48
    Width = 161
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Alignment = taRightJustify
    Text = '0.00'
    OnChange = dxCalcEditSummChange
    Precision = 10
    StoredValues = 1
  end
  object BitBtn2: TBitBtn
    Left = 312
    Top = 48
    Width = 97
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 312
    Top = 88
    Width = 97
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 3
    Kind = bkClose
  end
  object DateTimePickerZa: TDateTimePicker
    Left = 88
    Top = 88
    Width = 161
    Height = 32
    Date = 40658.568517604170000000
    Format = 'MMMM yyyy'
    Time = 40658.568517604170000000
    DateFormat = dfLong
    DateMode = dmUpDown
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnChange = DateTimePickerZaChange
  end
end
