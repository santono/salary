object FormMovePod12Recalc: TFormMovePod12Recalc
  Left = 192
  Top = 145
  Width = 696
  Height = 480
  Caption = #1055#1077#1088#1077#1085#1086#1089' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1072' '#1087#1086#1076'.'#1085#1072#1083#1086#1075#1072' 2012'
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
      ' SUMMAREZ1,'
      ' SUMMAREZ2,'
      ' SUMMAREZ3,'
      ' SUMMAREZ4,'
      ' SUMMAREZ5,'
      ' SUMMAREZ6,'
      ' SUMMAREZ7,'
      ' SUMMAREZ8,'
      ' SUMMAREZ9,'
      ' SUMMAREZ10,'
      ' SUMMAREZ11,'
      ' SUMMAREZ12'
      'FROM'
      ' TB_R_2012 ')
    Transaction = pFIBTransaction1
    Database = FIB.pFIBDatabaseSal
    Left = 96
    Top = 120
    object pFIBDataSet1TABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object pFIBDataSet1SUMMAREZ1: TFIBBCDField
      FieldName = 'SUMMAREZ1'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet1SUMMAREZ2: TFIBBCDField
      FieldName = 'SUMMAREZ2'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet1SUMMAREZ3: TFIBBCDField
      FieldName = 'SUMMAREZ3'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet1SUMMAREZ4: TFIBBCDField
      FieldName = 'SUMMAREZ4'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet1SUMMAREZ5: TFIBBCDField
      FieldName = 'SUMMAREZ5'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet1SUMMAREZ6: TFIBBCDField
      FieldName = 'SUMMAREZ6'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet1SUMMAREZ7: TFIBBCDField
      FieldName = 'SUMMAREZ7'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet1SUMMAREZ8: TFIBBCDField
      FieldName = 'SUMMAREZ8'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet1SUMMAREZ9: TFIBBCDField
      FieldName = 'SUMMAREZ9'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet1SUMMAREZ10: TFIBBCDField
      FieldName = 'SUMMAREZ10'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet1SUMMAREZ11: TFIBBCDField
      FieldName = 'SUMMAREZ11'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSet1SUMMAREZ12: TFIBBCDField
      FieldName = 'SUMMAREZ12'
      Size = 2
      RoundByScale = True
    end
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 136
    Top = 120
  end
end
