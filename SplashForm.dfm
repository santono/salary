object AboutBox: TAboutBox
  Left = 285
  Top = 216
  BorderStyle = bsNone
  ClientHeight = 241
  ClientWidth = 412
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 24
  object LabelAppSize: TLabel
    Left = 16
    Top = 184
    Width = 99
    Height = 20
    Caption = 'LabelAppSize'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 393
    Height = 169
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentColor = True
    TabOrder = 0
    object ProductName: TLabel
      Left = 32
      Top = 56
      Width = 313
      Height = 29
      Caption = #1088#1072#1089#1095#1077#1090#1072' '#1079#1072#1088#1072#1073#1086#1090#1085#1086#1081' '#1087#1083#1072#1090#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      IsControl = True
    end
    object Version: TLabel
      Left = 16
      Top = 104
      Width = 195
      Height = 24
      Caption = 'Version 1.0  30.05.2022'
      IsControl = True
    end
    object Copyright: TLabel
      Left = 8
      Top = 136
      Width = 80
      Height = 24
      Caption = 'Copyright'
      IsControl = True
    end
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 359
      Height = 29
      Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1079#1080#1088#1086#1074#1072#1085#1085#1072#1103'  '#1089#1080#1089#1090#1077#1084#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object OKButton: TButton
    Left = 175
    Top = 212
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 256
    Top = 120
  end
  object ActionList1: TActionList
    Left = 144
    Top = 120
  end
end
