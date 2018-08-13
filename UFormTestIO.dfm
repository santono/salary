object FormTestIO: TFormTestIO
  Left = 441
  Top = 302
  Width = 244
  Height = 263
  Caption = #1058#1077#1089#1090' '#1074#1074#1086#1076#1072'-'#1074#1099#1074#1086#1076#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 40
    Width = 193
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 24
    Top = 72
    Width = 56
    Height = 13
    Caption = #1050'-'#1074#1086' '#1096#1072#1075#1086#1074
  end
  object Label3: TLabel
    Left = 104
    Top = 72
    Width = 51
    Height = 13
    Caption = #1047#1072#1076#1077#1088#1078#1082#1072
  end
  object Label4: TLabel
    Left = 24
    Top = 128
    Width = 80
    Height = 13
    Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 168
    Width = 75
    Height = 25
    Caption = #1057#1090#1072#1088#1090' '#1090#1077#1089#1090#1072
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 104
    Top = 168
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 16
    Width = 185
    Height = 17
    TabOrder = 2
  end
  object cxNmbOfStep: TcxSpinEdit
    Left = 24
    Top = 96
    TabOrder = 3
    Width = 73
  end
  object cxDelayVal: TcxSpinEdit
    Left = 104
    Top = 96
    TabOrder = 4
    Width = 70
  end
  object cxWantedNSRV: TcxSpinEdit
    Left = 112
    Top = 128
    TabOrder = 5
    Width = 81
  end
end
