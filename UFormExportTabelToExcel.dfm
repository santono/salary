object FormExportTabelToExcel: TFormExportTabelToExcel
  Left = 200
  Top = 167
  Width = 258
  Height = 139
  Caption = #1069#1082#1089#1087#1086#1088#1090' '#1090#1072#1073#1077#1083#1103' '#1074' Excel'
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
    Left = 8
    Top = 72
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object BitBtnDoExport: TBitBtn
    Left = 24
    Top = 16
    Width = 121
    Height = 25
    Caption = #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 0
    OnClick = BitBtnDoExportClick
  end
  object BitBtn1: TBitBtn
    Left = 152
    Top = 16
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 48
    Width = 225
    Height = 17
    TabOrder = 2
  end
end
