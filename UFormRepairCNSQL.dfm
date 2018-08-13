object FormRepairCNSQL: TFormRepairCNSQL
  Left = 192
  Top = 124
  Width = 696
  Height = 244
  Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' CN '#1092#1083#1072#1075#1072' AUTOMATIC'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 64
    Top = 16
    Width = 11
    Height = 20
    Caption = #1057
  end
  object Label2: TLabel
    Left = 216
    Top = 16
    Width = 18
    Height = 20
    Caption = #1087#1086
  end
  object LabelPodr: TLabel
    Left = 32
    Top = 48
    Width = 72
    Height = 20
    Caption = 'LabelPodr'
  end
  object LabelFio: TLabel
    Left = 40
    Top = 96
    Width = 66
    Height = 20
    Caption = 'LabelFIO'
  end
  object LabelMonth: TLabel
    Left = 488
    Top = 96
    Width = 84
    Height = 20
    Caption = 'LabelMonth'
  end
  object LabelAmnt: TLabel
    Left = 384
    Top = 16
    Width = 77
    Height = 20
    Caption = 'LabelAmnt'
  end
  object DateTimePickerFr: TDateTimePicker
    Left = 80
    Top = 16
    Width = 113
    Height = 28
    Date = 40926.920089317130000000
    Time = 40926.920089317130000000
    TabOrder = 0
  end
  object DateTimePickerTo: TDateTimePicker
    Left = 256
    Top = 16
    Width = 113
    Height = 28
    Date = 40926.920520613430000000
    Time = 40926.920520613430000000
    TabOrder = 1
  end
  object Button1: TButton
    Left = 24
    Top = 152
    Width = 177
    Height = 25
    Caption = #1053#1072#1095#1072#1090#1100' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077
    TabOrder = 2
    OnClick = Button1Click
  end
  object BitBtn1: TBitBtn
    Left = 480
    Top = 144
    Width = 121
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 3
    Kind = bkClose
  end
  object ProgressBar1: TProgressBar
    Left = 24
    Top = 72
    Width = 609
    Height = 17
    TabOrder = 4
  end
end
