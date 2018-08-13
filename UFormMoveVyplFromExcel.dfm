object FormMoveVyplFromExcel: TFormMoveVyplFromExcel
  Left = 219
  Top = 183
  Width = 696
  Height = 226
  Caption = #1048#1084#1087#1086#1088#1090' '#1074#1099#1087#1083#1072#1090' '#1080#1079' Excel '
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
  object lbl1: TLabel
    Left = 8
    Top = 56
    Width = 67
    Height = 20
    Caption = #1057#1090#1088#1086#1082#1080' '#1089
  end
  object lbl2: TLabel
    Left = 208
    Top = 56
    Width = 18
    Height = 20
    Caption = #1087#1086
  end
  object EditFileName: TEdit
    Left = 32
    Top = 16
    Width = 433
    Height = 28
    TabOrder = 0
    Text = 'EditFileName'
  end
  object BitBtn1: TBitBtn
    Left = 472
    Top = 16
    Width = 41
    Height = 25
    Caption = '. . .'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object cxCalcEditFrom: TcxCalcEdit
    Left = 80
    Top = 56
    EditValue = 0.000000000000000000
    TabOrder = 2
    Width = 121
  end
  object cxCalcEditTo: TcxCalcEdit
    Left = 232
    Top = 56
    EditValue = 0.000000000000000000
    TabOrder = 3
    Width = 121
  end
  object pb1: TProgressBar
    Left = 16
    Top = 104
    Width = 521
    Height = 17
    TabOrder = 4
  end
  object btn1: TBitBtn
    Left = 16
    Top = 136
    Width = 177
    Height = 25
    Caption = #1053#1072#1095#1072#1090#1100' '#1080#1084#1087#1086#1088#1090
    TabOrder = 5
    OnClick = btn1Click
  end
  object btn2: TBitBtn
    Left = 320
    Top = 136
    Width = 89
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 6
    Kind = bkClose
  end
  object OpenDialog1: TOpenDialog
    Left = 520
    Top = 16
  end
end
