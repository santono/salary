object FormExportFroPlanLNR: TFormExportFroPlanLNR
  Left = 201
  Top = 141
  Width = 696
  Height = 480
  Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' Excel '#1076#1083#1103' '#1087#1083#1072#1085#1086#1074#1086#1075#1086
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
  object lblFio: TLabel
    Left = 32
    Top = 272
    Width = 37
    Height = 20
    Caption = 'lblFio'
  end
  object btn2: TBitBtn
    Left = 32
    Top = 88
    Width = 297
    Height = 25
    Caption = #1055#1077#1088#1077#1085#1086#1089
    TabOrder = 0
    OnClick = btn2Click
  end
  object dtpDate: TDateTimePicker
    Left = 120
    Top = 16
    Width = 186
    Height = 28
    Date = 42552.640078518520000000
    Time = 42552.640078518520000000
    DateFormat = dfLong
    TabOrder = 1
  end
  object pb1: TProgressBar
    Left = 32
    Top = 248
    Width = 601
    Height = 17
    TabOrder = 2
  end
  object cbVisual: TCheckBox
    Left = 360
    Top = 16
    Width = 241
    Height = 17
    Caption = #1057' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1077#1084' Excel ('#1084#1077#1076#1083#1077#1085#1085#1086')'
    TabOrder = 3
  end
  object dsLists: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' TABNO,'
      ' FIO,'
      ' ZW,'
      ' ST,'
      ' DOLG,'
      ' razr,'
      ' procusfinal,'
      ' procuzfinal,'
      ' stag,'
      ' procvyslfinal,'
      ' koef,'
      ' procpzwfinal,'
      ' pzw'
      '  '
      'FROM'
      ' PR_PL_TOEXCEL(:Y,'
      ' :M,'
      ' :MODE,'
      ' :w_r) '
      'order by fio')
    Transaction = pfbtrnsctn1
    Database = FIB.pFIBDatabaseSal
    Left = 32
    Top = 16
    object fbntgrfldListsTABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object dsListsFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 50
      EmptyStrToNull = True
    end
    object dsListsZW: TFIBStringField
      FieldName = 'ZW'
      Size = 100
      EmptyStrToNull = True
    end
    object dsListsST: TFIBStringField
      FieldName = 'ST'
      Size = 100
      EmptyStrToNull = True
    end
    object dsListsDOLG: TFIBStringField
      FieldName = 'DOLG'
      Size = 50
      EmptyStrToNull = True
    end
    object fbntgrfldListsRAZR: TFIBIntegerField
      FieldName = 'RAZR'
    end
    object dsListsPROCUSFINAL: TFIBBCDField
      FieldName = 'PROCUSFINAL'
      Size = 2
      RoundByScale = True
    end
    object dsListsPROCUZFINAL: TFIBBCDField
      FieldName = 'PROCUZFINAL'
      Size = 2
      RoundByScale = True
    end
    object dsListsSTAG: TFIBBCDField
      FieldName = 'STAG'
      Size = 2
      RoundByScale = True
    end
    object dsListsPROCVYSLFINAL: TFIBBCDField
      FieldName = 'PROCVYSLFINAL'
      Size = 2
      RoundByScale = True
    end
    object dsListsKOEF: TFIBBCDField
      FieldName = 'KOEF'
      Size = 3
      RoundByScale = True
    end
    object dsListsPROCPZWFINAL: TFIBBCDField
      FieldName = 'PROCPZWFINAL'
      Size = 2
      RoundByScale = True
    end
    object dsListsPZW: TFIBStringField
      FieldName = 'PZW'
      Size = 50
      EmptyStrToNull = True
    end
  end
  object pfbtrnsctn1: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 64
    Top = 16
  end
  object pfbqryL: TpFIBQuery
    Transaction = pfbtrnsctn1
    Database = FIB.pFIBDatabaseSal
    Left = 320
    Top = 16
  end
end
