object FormMoveAwans2017_12: TFormMoveAwans2017_12
  Left = 192
  Top = 145
  Width = 696
  Height = 480
  Caption = #1042#1083#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1072#1074#1085#1089#1072' '#1074' 12 2017'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 56
    Width = 227
    Height = 13
    Caption = #1044#1083#1103' '#1087#1077#1088#1077#1085#1086#1089#1072' '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082#1091' '#1055#1045#1056#1045#1053#1045#1057#1058#1048
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 24
    Width = 657
    Height = 21
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 384
    Width = 75
    Height = 25
    Caption = #1055#1077#1088#1077#1085#1077#1089#1090#1080
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 568
    Top = 384
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object pFIBDataSet1: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' TABNO,'
      ' SHIFRPOD,'
      ' DOLG,'
      ' SUMMA,'
      ' SHIFRGRU,'
      ' SHIFRKAT,'
      ' WR,'
      ' MOVED'
      'FROM'
      ' TB_AWANS_17_12 ')
    Transaction = pFIBTransaction1
    Database = FIB.pFIBDatabaseSal
    Left = 96
    Top = 120
    object pFIBDataSet1TABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object pFIBDataSet1SHIFRPOD: TFIBSmallIntField
      FieldName = 'SHIFRPOD'
    end
    object pFIBDataSet1DOLG: TFIBStringField
      FieldName = 'DOLG'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBDataSet1SUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet1SHIFRGRU: TFIBSmallIntField
      FieldName = 'SHIFRGRU'
    end
    object pFIBDataSet1SHIFRKAT: TFIBSmallIntField
      FieldName = 'SHIFRKAT'
    end
    object pFIBDataSet1WR: TFIBSmallIntField
      FieldName = 'WR'
    end
    object pFIBDataSet1MOVED: TFIBSmallIntField
      FieldName = 'MOVED'
    end
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 136
    Top = 120
  end
end
