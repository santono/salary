object FormMovECBtoExcel: TFormMovECBtoExcel
  Left = 257
  Top = 285
  Width = 696
  Height = 307
  Caption = #1055#1077#1088#1077#1085#1086#1089' '#1090#1072#1073#1083#1080#1094#1099' 6 '#1074' Excel'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 20
  object LabelUp: TLabel
    Left = 16
    Top = 8
    Width = 60
    Height = 20
    Caption = 'LabelUp'
  end
  object LabelDown: TLabel
    Left = 16
    Top = 72
    Width = 80
    Height = 20
    Caption = 'LabelDown'
  end
  object ProgressBarPFU: TProgressBar
    Left = 16
    Top = 40
    Width = 649
    Height = 21
    TabOrder = 0
  end
  object BitBtn2: TBitBtn
    Left = 584
    Top = 104
    Width = 83
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object gb6: TGroupBox
    Left = 24
    Top = 104
    Width = 185
    Height = 121
    Caption = #1058#1072#1073#1083#1080#1094#1072' 6'
    TabOrder = 2
    object BitBtn6: TBitBtn
      Left = 8
      Top = 24
      Width = 137
      Height = 25
      Caption = #1044#1083#1103' '#1087#1077#1095#1072#1090#1080
      TabOrder = 0
      OnClick = BitBtn6Click
    end
    object BtnDisk: TBitBtn
      Left = 8
      Top = 56
      Width = 137
      Height = 25
      Caption = #1044#1083#1103' '#1076#1080#1089#1082#1072
      TabOrder = 1
      OnClick = BtnDiskClick
    end
    object BtnSta: TBitBtn
      Left = 8
      Top = 88
      Width = 137
      Height = 25
      Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
      TabOrder = 2
      OnClick = BtnStaClick
    end
  end
  object gb5: TGroupBox
    Left = 224
    Top = 112
    Width = 185
    Height = 113
    Caption = #1058#1072#1073#1083#1080#1094#1072' 5'
    TabOrder = 3
    object BitBtn1: TBitBtn
      Left = 16
      Top = 24
      Width = 137
      Height = 25
      Caption = #1044#1083#1103' '#1087#1077#1095#1072#1090#1080
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn3: TBitBtn
      Left = 16
      Top = 56
      Width = 137
      Height = 25
      Caption = #1044#1083#1103' '#1076#1080#1089#1082#1072
      TabOrder = 1
      OnClick = BitBtn3Click
    end
  end
  object pFIBQueryECB: TpFIBQuery
    Transaction = pFIBTransactionECBRead
    Database = FIB.pFIBDatabaseSal
    Left = 192
    Top = 72
  end
  object pFIBTransactionECBRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 232
    Top = 72
  end
end
