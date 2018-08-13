object FormUtility: TFormUtility
  Left = 225
  Top = 153
  Width = 696
  Height = 480
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1096#1090'.'#1088#1072#1089#1087#1080#1089#1072#1085#1080#1081' '#1080' '#1087#1088#1080#1082#1072#1079#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 24
    Top = 40
    Width = 585
    Height = 41
    Alignment = taLeftJustify
    Caption = #1064#1090' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1077
    TabOrder = 0
    object DateTimePickerSht: TDateTimePicker
      Left = 120
      Top = 8
      Width = 97
      Height = 21
      Date = 42552.879486759260000000
      Time = 42552.879486759260000000
      MaxDate = 43101.000000000000000000
      MinDate = 40909.000000000000000000
      TabOrder = 0
      OnChange = DateTimePickerShtChange
    end
    object BitBtn1: TBitBtn
      Left = 432
      Top = 8
      Width = 145
      Height = 25
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1096#1090'. '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1077
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object Panel2: TPanel
    Left = 24
    Top = 112
    Width = 585
    Height = 65
    Alignment = taLeftJustify
    Caption = #1058#1077#1082#1089#1090' '#1087#1088#1080#1082#1072#1079#1072
    TabOrder = 1
    object DateTimePickerOrd: TDateTimePicker
      Left = 120
      Top = 8
      Width = 97
      Height = 21
      Date = 42552.892861145830000000
      Time = 42552.892861145830000000
      MaxDate = 43101.000000000000000000
      MinDate = 40909.000000000000000000
      TabOrder = 0
      OnChange = DateTimePickerOrdChange
    end
    object RadioGroup1: TRadioGroup
      Left = 224
      Top = 8
      Width = 201
      Height = 41
      Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #1054#1089#1085#1086#1074#1085#1099#1077
        #1057#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1080)
      TabOrder = 1
      OnClick = RadioGroup1Click
    end
    object BitBtn2: TBitBtn
      Left = 432
      Top = 16
      Width = 145
      Height = 25
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1087#1088#1080#1082#1072#1079
      TabOrder = 2
      OnClick = BitBtn2Click
    end
  end
  object BitBtn3: TBitBtn
    Left = 520
    Top = 376
    Width = 89
    Height = 25
    Caption = '&'#1047#1072#1082#1088#1099#1090#1100
    TabOrder = 2
    Kind = bkClose
  end
  object Panel3: TPanel
    Left = 24
    Top = 208
    Width = 585
    Height = 65
    Alignment = taLeftJustify
    Caption = #1055#1088#1080#1082#1072#1079' '#1074' WORD'
    TabOrder = 3
    object DateTimePickerPrint: TDateTimePicker
      Left = 112
      Top = 16
      Width = 105
      Height = 21
      Date = 42552.915200370370000000
      Time = 42552.915200370370000000
      MaxDate = 43101.000000000000000000
      MinDate = 40909.000000000000000000
      TabOrder = 0
    end
    object RadioGroup2: TRadioGroup
      Left = 232
      Top = 8
      Width = 193
      Height = 41
      Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #1054#1089#1085#1086#1074#1085#1099#1077
        #1057#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1080)
      TabOrder = 1
    end
    object BitBtn4: TBitBtn
      Left = 432
      Top = 8
      Width = 145
      Height = 33
      Caption = #1050#1086#1085#1074#1077#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' WORD'
      TabOrder = 2
      OnClick = BitBtn4Click
    end
  end
  object Panel4: TPanel
    Left = 24
    Top = 288
    Width = 585
    Height = 49
    Alignment = taLeftJustify
    Caption = #1060#1080#1082#1089#1080#1088#1086#1074#1072#1085#1085#1099#1093
    TabOrder = 4
    object Label1: TLabel
      Left = 96
      Top = 16
      Width = 12
      Height = 13
      Caption = #1085#1072
    end
    object Label2: TLabel
      Left = 240
      Top = 16
      Width = 12
      Height = 13
      Caption = #1080#1079
    end
    object Button1: TButton
      Left = 432
      Top = 16
      Width = 137
      Height = 25
      Caption = #1053#1072#1082#1072#1090#1080#1090#1100
      TabOrder = 0
      OnClick = Button1Click
    end
    object DateTimePickerFNew: TDateTimePicker
      Left = 120
      Top = 16
      Width = 97
      Height = 21
      Date = 42552.619896817130000000
      Time = 42552.619896817130000000
      MaxDate = 43101.000000000000000000
      MinDate = 40909.000000000000000000
      TabOrder = 1
    end
    object DateTimePickerFOld: TDateTimePicker
      Left = 264
      Top = 16
      Width = 105
      Height = 21
      Date = 41255.620038182870000000
      Time = 41255.620038182870000000
      MaxDate = 43101.000000000000000000
      MinDate = 40909.000000000000000000
      TabOrder = 2
    end
  end
  object rgMode: TRadioGroup
    Left = 24
    Top = 352
    Width = 321
    Height = 57
    Caption = #1056#1077#1078#1080#1084
    Columns = 2
    Items.Strings = (
      #1055#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1080
      #1044#1077#1082#1072#1085#1072#1090#1099)
    TabOrder = 5
  end
end
