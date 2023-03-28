object FormCalcPrem_11_2017: TFormCalcPrem_11_2017
  Left = 192
  Top = 145
  Width = 696
  Height = 480
  Caption = #1056#1072#1089#1095#1077#1090' '#1087#1088#1077#1084#1080#1080' '#1074' '#1072#1087#1088#1077#1083#1077' 2023'
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
    Left = 24
    Top = 344
    Width = 218
    Height = 13
    Caption = #1044#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082#1091' '#1056#1040#1057#1063#1048#1058#1040#1058#1068
  end
  object LabelPodr: TLabel
    Left = 16
    Top = 8
    Width = 3
    Height = 13
  end
  object Label2: TLabel
    Left = 352
    Top = 104
    Width = 123
    Height = 13
    Caption = #1055#1088#1086#1094#1077#1085#1090' '#1087#1088#1077#1084#1080#1080' (1..100)'
  end
  object Label3: TLabel
    Left = 128
    Top = 200
    Width = 146
    Height = 58
    Caption = 'Label3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 24
    Width = 657
    Height = 21
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 384
    Width = 75
    Height = 25
    Caption = #1056#1072#1089#1095#1080#1090#1072#1090#1100
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 568
    Top = 384
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object BitBtn3: TBitBtn
    Left = 272
    Top = 56
    Width = 393
    Height = 25
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081', '#1082#1072#1090#1077#1075#1086#1088#1080#1081', '#1089#1095#1077#1090#1086#1074' '#1080' '#1089#1090#1072#1090#1100#1080
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object cxCalcEdit1: TcxCalcEdit
    Left = 488
    Top = 104
    EditValue = 0.000000000000000000
    TabOrder = 4
    Width = 121
  end
  object rgModeRead: TRadioGroup
    Left = 8
    Top = 56
    Width = 257
    Height = 65
    Caption = #1056#1077#1078#1080#1084' '#1088#1072#1089#1095#1077#1090#1072' '#1080' '#1079#1072#1087#1080#1089#1080
    ItemIndex = 0
    Items.Strings = (
      #1058#1086#1083#1100#1082#1086' '#1088#1072#1089#1095#1077#1090' - '#1073#1077#1079' '#1079#1072#1087#1080#1089#1080' '#1074' '#1073#1072#1079#1091' '#1076#1072#1085#1085#1099#1093
      #1056#1072#1089#1095#1077#1090' '#1080' '#1079#1072#1087#1080#1089#1100' '#1074' '#1073#1072#1079#1091' '#1076#1072#1085#1085#1099#1093)
    TabOrder = 5
  end
end
