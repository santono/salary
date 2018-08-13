object FormRestorePodr: TFormRestorePodr
  Left = 290
  Top = 222
  Width = 696
  Height = 340
  Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
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
    Left = 24
    Top = 8
    Width = 201
    Height = 20
    Caption = #1058#1077#1082#1091#1097#1077#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 128
    Width = 224
    Height = 20
    Caption = #1057#1086#1093#1088#1072#1085#1077#1085#1085#1086#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object PanelCurr: TPanel
    Left = 8
    Top = 32
    Width = 665
    Height = 89
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object LabelCurrPodr: TLabel
      Left = 16
      Top = 8
      Width = 609
      Height = 25
      Caption = 'LabelCurrPodr'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LabelCurrNmb: TLabel
      Left = 16
      Top = 48
      Width = 609
      Height = 20
      Caption = 'LabelCurrNmb'
    end
  end
  object PanelSaved: TPanel
    Left = 8
    Top = 152
    Width = 665
    Height = 81
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object LabelSavedPodr: TLabel
      Left = 16
      Top = 8
      Width = 641
      Height = 20
      Caption = 'LabelSavedPodr'
    end
    object LabelSavedNmb: TLabel
      Left = 16
      Top = 40
      Width = 609
      Height = 20
      Caption = 'LabelSavedNmb'
    end
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 248
    Width = 153
    Height = 25
    Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 592
    Top = 248
    Width = 81
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Kind = bkClose
  end
end
