object FormPensSpr2006: TFormPensSpr2006
  Left = 188
  Top = 107
  Width = 736
  Height = 513
  Caption = #1057#1087#1088#1072#1074#1082#1072' '#1074' '#1087#1077#1085#1089#1080#1086#1085#1085#1099#1081' '#1092#1086#1085#1076' '#1089' '#1103#1085#1074#1072#1088#1103' 2007'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object LabelFIO: TLabel
    Left = 16
    Top = 8
    Width = 5
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object StringGridS: TStringGrid
    Left = 24
    Top = 40
    Width = 593
    Height = 361
    ColCount = 9
    RowCount = 14
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing]
    TabOrder = 0
    OnDblClick = StringGridSDblClick
    OnDrawCell = StringGridSDrawCell
  end
  object BitBtn1: TBitBtn
    Left = 648
    Top = 8
    Width = 33
    Height = 25
    Caption = '. . .'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 16
    Top = 409
    Width = 137
    Height = 25
    Caption = #1048#1085#1080#1094#1080#1072#1083#1080#1079#1072#1094#1080#1103
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 160
    Top = 409
    Width = 105
    Height = 25
    Caption = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 272
    Top = 409
    Width = 75
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100
    TabOrder = 4
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 352
    Top = 409
    Width = 113
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100' 2015'
    TabOrder = 5
    OnClick = BitBtn5Click
  end
  object BitBtn6: TBitBtn
    Left = 464
    Top = 410
    Width = 185
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100' ('#1074#1072#1088#1080#1072#1085#1090' '#1054#1083#1080')'
    TabOrder = 6
    OnClick = BitBtn6Click
  end
  object BitBtnLnr2013: TBitBtn
    Left = 16
    Top = 440
    Width = 97
    Height = 25
    Caption = '2013-2015'
    TabOrder = 7
    OnClick = BitBtnLnr2013Click
  end
  object BitBtnLNR2015: TBitBtn
    Left = 240
    Top = 440
    Width = 105
    Height = 25
    Caption = '2015-2019'
    TabOrder = 8
    OnClick = BitBtnLNR2015Click
  end
  object BitBtnLnr2009: TBitBtn
    Left = 120
    Top = 440
    Width = 113
    Height = 25
    Caption = '2009-2015'
    TabOrder = 9
    OnClick = BitBtnLnr2009Click
  end
end
