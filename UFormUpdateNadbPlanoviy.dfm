object FormUpdateNadbPlanoviy: TFormUpdateNadbPlanoviy
  Left = 251
  Top = 174
  Width = 870
  Height = 228
  Caption = #1056#1077#1082#1074#1080#1079#1080#1099' '#1085#1072#1076#1073#1072#1074#1082#1080
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
    Left = 104
    Top = 24
    Width = 38
    Height = 20
    Caption = #1060#1048#1054
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 64
    Top = 56
    Width = 78
    Height = 20
    Caption = #1058#1072#1073'.'#1085#1086#1084#1077#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 88
    Width = 126
    Height = 20
    Caption = #1055#1088#1086#1094#1077#1085#1090' '#1087#1088#1077#1084#1080#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelFioSal: TLabel
    Left = 368
    Top = 56
    Width = 473
    Height = 20
    Caption = 'LabelFioSal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object cxDBTextEditFIO: TcxDBTextEdit
    Left = 152
    Top = 24
    DataBinding.DataField = 'FIO'
    DataBinding.DataSource = FormBrowseNadbPlanoviy.dsoNadb
    Enabled = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 0
    Width = 161
  end
  object cxDBTextEditTabno: TcxDBTextEdit
    Left = 152
    Top = 56
    DataBinding.DataField = 'TABNO'
    DataBinding.DataSource = FormBrowseNadbPlanoviy.dsoNadb
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 1
    Width = 121
  end
  object cxDBCalcEditProc: TcxDBCalcEdit
    Left = 152
    Top = 88
    DataBinding.DataField = 'PROC'
    DataBinding.DataSource = FormBrowseNadbPlanoviy.dsoNadb
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 2
    Width = 121
  end
  object BitBtn1: TBitBtn
    Left = 32
    Top = 136
    Width = 113
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 160
    Top = 136
    Width = 113
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Kind = bkClose
  end
  object BitBtn3: TBitBtn
    Left = 280
    Top = 56
    Width = 75
    Height = 25
    Caption = '. . .'
    TabOrder = 5
    OnClick = BitBtn3Click
  end
end
