object FormChangeTabno: TFormChangeTabno
  Left = 192
  Top = 124
  Width = 696
  Height = 283
  Caption = #1048#1079#1084#1077#1085#1077#1080#1077' '#1090#1072#1073#1077#1083#1100#1085#1086#1075#1086' '#1085#1086#1084#1077#1088#1072' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
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
  object LabelNmes: TLabel
    Left = 16
    Top = 32
    Width = 53
    Height = 13
    Caption = 'LabelNmes'
  end
  object LabelPodr: TLabel
    Left = 16
    Top = 80
    Width = 48
    Height = 13
    Caption = 'LabelPodr'
  end
  object Label1: TLabel
    Left = 16
    Top = 128
    Width = 147
    Height = 13
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1090#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088' '
  end
  object Label2: TLabel
    Left = 248
    Top = 128
    Width = 105
    Height = 13
    Caption = #1085#1072' '#1090#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 56
    Width = 649
    Height = 17
    TabOrder = 0
  end
  object ProgressBar2: TProgressBar
    Left = 16
    Top = 96
    Width = 649
    Height = 17
    TabOrder = 1
  end
  object cxCalcEditOld: TcxCalcEdit
    Left = 168
    Top = 128
    EditValue = 0.000000000000000000
    TabOrder = 2
    Width = 73
  end
  object cxCalcEditNew: TcxCalcEdit
    Left = 360
    Top = 128
    EditValue = 0.000000000000000000
    TabOrder = 3
    Width = 81
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 184
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 104
    Top = 184
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 5
    Kind = bkClose
  end
end
