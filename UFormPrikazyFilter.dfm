object FormPrikazyFilter: TFormPrikazyFilter
  Left = 192
  Top = 124
  Width = 696
  Height = 225
  Caption = #1060#1080#1083#1100#1090#1088' '#1087#1077#1088#1077#1083#1110#1082#1091' '#1087#1088#1080#1082#1072#1079#1110#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 232
    Top = 32
    Width = 17
    Height = 13
    Caption = 'c'
  end
  object Label2: TLabel
    Left = 382
    Top = 32
    Width = 12
    Height = 13
    Caption = #1087#1086
  end
  object LabelFio: TLabel
    Left = 312
    Top = 104
    Width = 40
    Height = 13
    Caption = 'LabelFio'
  end
  object cbNeedDateFilter: TCheckBox
    Left = 64
    Top = 32
    Width = 129
    Height = 17
    Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1076#1072#1090#1072#1084
    TabOrder = 0
  end
  object cbNeedTypeFilter: TCheckBox
    Left = 64
    Top = 64
    Width = 129
    Height = 17
    Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1096#1072#1073#1083#1086#1085#1072#1084
    TabOrder = 1
  end
  object cbNeedTabnoFilter: TCheckBox
    Left = 64
    Top = 104
    Width = 153
    Height = 17
    Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072#1084
    TabOrder = 2
  end
  object dtFr: TDateTimePicker
    Left = 256
    Top = 32
    Width = 121
    Height = 21
    Date = 43720.899647395830000000
    Time = 43720.899647395830000000
    DateFormat = dfLong
    TabOrder = 3
  end
  object dtTo: TDateTimePicker
    Left = 400
    Top = 32
    Width = 121
    Height = 21
    Date = 43720.899736770840000000
    Time = 43720.899736770840000000
    DateFormat = dfLong
    TabOrder = 4
  end
  object ComboBox1: TComboBox
    Left = 256
    Top = 64
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Text = 'cbType'
  end
  object BitBtnFio: TBitBtn
    Left = 232
    Top = 96
    Width = 75
    Height = 25
    Caption = '. . .'
    TabOrder = 6
  end
  object BitBtnSet: TBitBtn
    Left = 32
    Top = 144
    Width = 75
    Height = 25
    Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
    TabOrder = 7
    OnClick = BitBtnSetClick
  end
  object BitBtn2: TBitBtn
    Left = 120
    Top = 144
    Width = 75
    Height = 25
    Caption = #1057#1073#1088#1086#1089#1080#1090#1100
    TabOrder = 8
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 208
    Top = 144
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 9
    Kind = bkClose
  end
  object dxLookupEdit1: TdxLookupEdit
    Left = 408
    Top = 64
    Width = 121
    TabOrder = 10
    ListFieldName = 'NAME'
    KeyFieldName = 'ID'
    ListSource = FormPrikazyBrowseTot.dsoPriType
    LookupKeyValue = 0
  end
end
