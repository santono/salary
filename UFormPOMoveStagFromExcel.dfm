object FormPOMoveStagFromExcel: TFormPOMoveStagFromExcel
  Left = 226
  Top = 156
  Width = 514
  Height = 272
  Caption = #1055#1077#1088#1077#1085#1086#1089' '#1087#1077#1076' '#1089#1090#1072#1078#1072' '#1080#1079' Excel'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 24
    Top = 56
    Width = 89
    Height = 20
    Caption = #1044#1072#1090#1072' '#1089#1090#1072#1078#1072
  end
  object Label2: TLabel
    Left = 24
    Top = 109
    Width = 207
    Height = 20
    Caption = #1053#1086#1084#1077#1088' '#1082#1086#1083#1086#1085#1082#1080' '#1090#1072#1073'.'#1085#1086#1084#1077#1088#1072
  end
  object Label3: TLabel
    Left = 23
    Top = 142
    Width = 166
    Height = 20
    Caption = #1053#1086#1084#1077#1088' '#1082#1086#1083#1086#1085#1082#1080' '#1089#1090#1072#1078#1072
  end
  object Label4: TLabel
    Left = 320
    Top = 104
    Width = 48
    Height = 20
    Caption = 'Label4'
  end
  object Label5: TLabel
    Left = 320
    Top = 136
    Width = 48
    Height = 20
    Caption = 'Label5'
  end
  object EditExlName: TEdit
    Left = 24
    Top = 16
    Width = 385
    Height = 28
    TabOrder = 0
    Text = 'EditExlName'
  end
  object BitBtn1: TBitBtn
    Left = 416
    Top = 16
    Width = 33
    Height = 25
    Caption = '. . .'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object DateTimePickerFr: TDateTimePicker
    Left = 120
    Top = 56
    Width = 186
    Height = 28
    Date = 41400.701695775460000000
    Time = 41400.701695775460000000
    DateFormat = dfLong
    TabOrder = 2
  end
  object dxCalcEditColTabno: TdxCalcEdit
    Left = 240
    Top = 104
    Width = 57
    TabOrder = 3
    Text = '0'
  end
  object dxCalcEditColStag: TdxCalcEdit
    Left = 240
    Top = 136
    Width = 57
    TabOrder = 4
    Text = '0'
  end
  object BitBtn2: TBitBtn
    Left = 24
    Top = 184
    Width = 137
    Height = 25
    Caption = #1053#1072#1095#1072#1090#1100' '#1087#1077#1088#1077#1085#1086#1089
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 184
    Top = 184
    Width = 97
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 6
    Kind = bkClose
  end
  object OpenDialog1: TOpenDialog
    Left = 328
    Top = 56
  end
end
