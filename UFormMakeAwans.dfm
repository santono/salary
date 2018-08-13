object FormMakeAwans: TFormMakeAwans
  Left = 213
  Top = 209
  Width = 577
  Height = 230
  Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103' '#1072#1074#1072#1085#1089#1072' '#1080' '#1076#1088#1091#1075#1080#1093' '#1091#1076#1077#1088#1078#1072#1085#1080#1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 8
    Top = 40
    Width = 66
    Height = 20
    Caption = #1055#1088#1086#1094#1077#1085#1090
  end
  object Label2: TLabel
    Left = 224
    Top = 40
    Width = 108
    Height = 20
    Caption = #1054#1082#1088#1091#1075#1083#1103#1090#1100' '#1076#1086' '
  end
  object Label3: TLabel
    Left = 184
    Top = 40
    Width = 14
    Height = 20
    Caption = '%'
  end
  object Label4: TLabel
    Left = 472
    Top = 40
    Width = 29
    Height = 20
    Caption = #1075#1088#1085'.'
  end
  object LabelPodr: TLabel
    Left = 8
    Top = 160
    Width = 72
    Height = 20
    Caption = 'LabelPodr'
  end
  object dxCalcEditProc: TdxCalcEdit
    Left = 80
    Top = 40
    Width = 97
    TabOrder = 0
    Alignment = taRightJustify
    Text = '0'
    StoredValues = 1
  end
  object dxCalcEditOkrugl: TdxCalcEdit
    Left = 344
    Top = 40
    Width = 121
    TabOrder = 1
    Alignment = taRightJustify
    Text = '0'
    StoredValues = 1
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 8
    Width = 545
    Height = 25
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1089#1090#1072#1090#1100#1102', '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103', '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1080' '#1089#1095#1077#1090#1072
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 8
    Top = 88
    Width = 153
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1088#1072#1089#1095#1077#1090
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 448
    Top = 88
    Width = 105
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 4
    Kind = bkClose
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 128
    Width = 545
    Height = 21
    TabOrder = 5
  end
  object CheckBoxIllSS: TCheckBox
    Left = 176
    Top = 88
    Width = 265
    Height = 17
    Caption = #1058#1086#1083#1100#1082#1086' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1077' '#1089#1086#1094'.'#1089#1090#1088#1072#1093#1072
    TabOrder = 6
  end
  object pFIBQueryBBB: TpFIBQuery
    Transaction = pFIBTransactionBBB
    Database = FIB.pFIBDatabaseSal
    Left = 136
    Top = 152
  end
  object pFIBTransactionBBB: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 168
    Top = 152
  end
end
