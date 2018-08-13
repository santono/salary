object FormProgress: TFormProgress
  Left = 192
  Top = 142
  Width = 696
  Height = 153
  Caption = #1054#1073#1088#1072#1073#1086#1090#1082#1072
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
  object Gauge: TGauge
    Left = 16
    Top = 40
    Width = 657
    Height = 33
    ForeColor = clAqua
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Progress = 0
  end
  object LabelHeader: TLabel
    Left = 24
    Top = 8
    Width = 92
    Height = 20
    Caption = 'LabelHeader'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelFooter: TLabel
    Left = 24
    Top = 80
    Width = 86
    Height = 20
    Caption = 'LabelFooter'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
end
