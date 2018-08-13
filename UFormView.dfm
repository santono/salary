object FormViewASCII: TFormViewASCII
  Left = 223
  Top = 195
  Width = 696
  Height = 499
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  DesignSize = (
    688
    455)
  PixelsPerInch = 96
  TextHeight = 13
  object MemoView: TMemo
    Left = 0
    Top = 8
    Width = 688
    Height = 409
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 472
    Top = 424
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object BitBtn2: TBitBtn
    Left = 16
    Top = 424
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1055#1077#1095#1072#1090#1100
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 104
    Top = 424
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1041#1083#1086#1082#1085#1086#1090
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 192
    Top = 424
    Width = 129
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1052#1072#1090#1088#1080#1095#1085#1099#1081' '#1087#1088#1080#1085#1090#1077#1088
    TabOrder = 4
    OnClick = BitBtn4Click
  end
end
