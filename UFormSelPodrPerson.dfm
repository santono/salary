object FormSelPodrPerson: TFormSelPodrPerson
  Left = 192
  Top = 124
  Width = 778
  Height = 480
  Caption = #1042#1099#1073#1086#1088' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1103' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    762
    442)
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 190
    Height = 20
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
  end
  object StringGridPodr: TStringGrid
    Left = 8
    Top = 32
    Width = 505
    Height = 393
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    TabOrder = 0
    ColWidths = (
      64
      431)
  end
  object btnPodr: TBitBtn
    Left = 520
    Top = 96
    Width = 233
    Height = 25
    Caption = '1. '#1042#1099#1073#1088#1072#1090#1100' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
    TabOrder = 1
    OnClick = btnPodrClick
  end
  object btnPerson: TBitBtn
    Left = 520
    Top = 128
    Width = 233
    Height = 25
    Caption = '3. '#1042#1099#1073#1088#1072#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
    TabOrder = 2
    OnClick = btnPersonClick
  end
  object BitBtn3: TBitBtn
    Left = 520
    Top = 160
    Width = 233
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 3
    Kind = bkClose
  end
  object btnMonth: TBitBtn
    Left = 520
    Top = 64
    Width = 233
    Height = 25
    Caption = '1. '#1042#1099#1073#1088#1072#1090#1100' '#1080#1077#1089#1103#1094
    TabOrder = 4
    OnClick = btnMonthClick
  end
end
