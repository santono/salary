object FormFIOHistory: TFormFIOHistory
  Left = 260
  Top = 177
  Width = 585
  Height = 500
  Caption = #1048#1089#1090#1086#1088#1080#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1092#1072#1084#1080#1083#1080#1080' '#1076#1083#1103' '#1090#1072#1073#1077#1083#1100#1085#1086#1075#1086' '#1085#1086#1084#1077#1088#1072
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
  object BitBtn1: TBitBtn
    Left = 8
    Top = 408
    Width = 177
    Height = 25
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1080#1089#1090#1086#1088#1080#1102
    Default = True
    TabOrder = 0
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 200
    Top = 408
    Width = 89
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object Memo1: TMemo
    Left = 8
    Top = 16
    Width = 513
    Height = 329
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object dsFioHistory: TpFIBDataSet
    SelectSQL.Strings = (
      'select distinct fio,'
      '('
      
        ' select first 1 b.yearvy||'#39'-'#39'||b.monthvy from person b where a.t' +
        'abno=b.tabno and b.fio=a.fio'
      ' order by b.yearvy asc,'
      '          b.monthvy asc'
      ')  f ,'
      '('
      
        ' select first 1 c.yearvy||'#39'-'#39'||c.monthvy from person c where a.t' +
        'abno=c.tabno and c.fio=a.fio'
      ' order by c.yearvy desc,'
      '          c.monthvy desc'
      ')  t'
      ''
      '  from person a'
      'where a.tabno=:tabno')
    Transaction = trFioHistory
    Database = FIB.pFIBDatabaseArc
    UpdateTransaction = FIB.pFIBTransactionArcWrite
    Left = 312
    Top = 408
    object dsFioHistoryFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 50
      EmptyStrToNull = True
    end
    object dsFioHistoryF: TFIBStringField
      FieldName = 'F'
      Size = 13
      EmptyStrToNull = True
    end
    object dsFioHistoryT: TFIBStringField
      FieldName = 'T'
      Size = 13
      EmptyStrToNull = True
    end
  end
  object dsoFIOHistory: TDataSource
    DataSet = dsFioHistory
    Left = 352
    Top = 408
  end
  object trFioHistory: TpFIBTransaction
    Active = True
    DefaultDatabase = FIB.pFIBDatabaseArc
    TimeoutAction = TARollback
    Left = 392
    Top = 408
  end
end
