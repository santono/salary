object FormMarkPGKForOtp: TFormMarkPGKForOtp
  Left = 205
  Top = 150
  Width = 696
  Height = 510
  Caption = 'FormMarkPGKForOtp'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    688
    466)
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 112
    Top = 440
    Width = 544
    Height = 20
    Caption = 
      #1044#1083#1103' '#1091#1089#1090#1085#1086#1074#1082#1080' '#1080#1083#1080' '#1089#1073#1088#1086#1089#1072' '#1086#1090#1084#1077#1090#1082#1080' '#1076#1074#1072#1078#1076#1099' '#1082#1083#1080#1082#1085#1080#1090#1077' '#1087#1086' '#1079#1072#1087#1080#1089#1080' ('#1089#1090#1088#1086#1082 +
      #1077')'
  end
  object PageControl1: TPageControl
    Left = 16
    Top = 16
    Width = 678
    Height = 418
    ActivePage = TabSheetPodr
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabSheetPodr: TTabSheet
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
      DesignSize = (
        670
        383)
      object StringGridPodr: TStringGrid
        Left = 0
        Top = 0
        Width = 662
        Height = 377
        Anchors = [akLeft, akTop, akRight, akBottom]
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 0
        OnDblClick = StringGridPodrDblClick
        OnDrawCell = StringGridPodrDrawCell
      end
    end
    object TabSheetKat: TTabSheet
      Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080
      ImageIndex = 1
      DesignSize = (
        670
        383)
      object StringGridKat: TStringGrid
        Left = 0
        Top = 0
        Width = 662
        Height = 378
        Anchors = [akLeft, akTop, akRight, akBottom]
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 0
        OnDblClick = StringGridKatDblClick
        OnDrawCell = StringGridKatDrawCell
      end
    end
    object TabSheetGru: TTabSheet
      Caption = #1057#1095#1077#1090#1072
      ImageIndex = 2
      DesignSize = (
        670
        383)
      object StringGridGru: TStringGrid
        Left = 0
        Top = 0
        Width = 662
        Height = 378
        Anchors = [akLeft, akTop, akRight, akBottom]
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 0
        OnDblClick = StringGridGruDblClick
        OnDrawCell = StringGridGruDrawCell
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 435
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    TabOrder = 1
    Kind = bkOK
  end
end
