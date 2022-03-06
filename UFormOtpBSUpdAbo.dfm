object FormOtpBSUpdAbo: TFormOtpBSUpdAbo
  Left = 255
  Top = 178
  Width = 584
  Height = 282
  Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1080' '#1086#1090#1087#1091#1089#1082#1072' '#1073#1077#1079' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103
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
    Left = 56
    Top = 16
    Width = 54
    Height = 13
    Caption = #1058#1072#1073'.'#1085#1086#1084#1077#1088
    Visible = False
  end
  object Label2: TLabel
    Left = 40
    Top = 48
    Width = 74
    Height = 13
    Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
    Visible = False
  end
  object Label5: TLabel
    Left = 32
    Top = 80
    Width = 79
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1087#1088#1080#1082#1072#1079#1072
  end
  object Label6: TLabel
    Left = 40
    Top = 112
    Width = 71
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1088#1080#1082#1072#1079#1072
  end
  object Label7: TLabel
    Left = 48
    Top = 144
    Width = 64
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
  end
  object Label8: TLabel
    Left = 32
    Top = 176
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
  end
  object cxDBMaskEditTabno: TcxDBMaskEdit
    Left = 120
    Top = 16
    DataBinding.DataField = 'TABNO'
    DataBinding.DataSource = FormOtpBSListAbo.dsoOtpBS
    TabOrder = 0
    Visible = False
    Width = 89
  end
  object cxDBTextEditFIO: TcxDBTextEdit
    Left = 120
    Top = 48
    DataBinding.DataField = 'FIO'
    DataBinding.DataSource = FormOtpBSListAbo.dsoOtpBS
    TabOrder = 1
    Visible = False
    Width = 433
  end
  object cxDBTextEditNomerPrik: TcxDBTextEdit
    Left = 120
    Top = 80
    DataBinding.DataField = 'NOMER_PRI'
    DataBinding.DataSource = FormOtpBSListAbo.dsoOtpBS
    TabOrder = 2
    Width = 121
  end
  object cxDBDateEditDatePrik: TcxDBDateEdit
    Left = 120
    Top = 112
    DataBinding.DataField = 'DATA_PRI'
    DataBinding.DataSource = FormOtpBSListAbo.dsoOtpBS
    TabOrder = 3
    Width = 121
  end
  object cxDBDateEditDateFR: TcxDBDateEdit
    Left = 120
    Top = 144
    DataBinding.DataField = 'DATEFR'
    DataBinding.DataSource = FormOtpBSListAbo.dsoOtpBS
    TabOrder = 4
    Width = 121
  end
  object cxDBDateEditDateTo: TcxDBDateEdit
    Left = 120
    Top = 176
    DataBinding.DataField = 'DATETO'
    DataBinding.DataSource = FormOtpBSListAbo.dsoOtpBS
    TabOrder = 5
    Width = 121
  end
  object BitBtnSave: TBitBtn
    Left = 120
    Top = 208
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 6
    OnClick = BitBtnSaveClick
  end
  object BitBtnExit: TBitBtn
    Left = 216
    Top = 208
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 7
    Kind = bkClose
  end
  object ButtonFind: TButton
    Left = 224
    Top = 16
    Width = 33
    Height = 25
    Caption = '. . .'
    TabOrder = 8
    Visible = False
    OnClick = ButtonFindClick
  end
end
