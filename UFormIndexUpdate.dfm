object FormIndexUpdate: TFormIndexUpdate
  Left = 192
  Top = 145
  Width = 712
  Height = 579
  HorzScrollBar.Position = 18
  VertScrollBar.Position = 5
  Caption = #1056#1072#1089#1095#1077#1090' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080' '#1089' 07 2012'
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
  object Label27: TLabel
    Left = 134
    Top = 203
    Width = 78
    Height = 20
    Caption = #1042#1085#1077#1041#1102#1076#1078'.'
  end
  object GroupBoxPrev: TGroupBox
    Left = -2
    Top = 35
    Width = 313
    Height = 137
    Caption = 'GroupBoxPrev'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 89
      Height = 20
      Caption = #1050'-'#1074#1086' '#1089#1090#1072#1074#1086#1082
    end
    object Label3: TLabel
      Left = 184
      Top = 26
      Width = 56
      Height = 20
      Caption = #1056#1072#1079#1088#1103#1076
    end
    object Label5: TLabel
      Left = 8
      Top = 101
      Width = 61
      Height = 20
      Caption = #1053#1072#1095#1080#1089#1083'.'
    end
    object Label8: TLabel
      Left = 48
      Top = 64
      Width = 236
      Height = 20
      Caption = #1048#1079' '#1088#1072#1089#1095#1077#1090#1072' '#1082#1072#1083#1077#1085#1076#1072#1088#1085#1099#1093' '#1076#1085#1077#1081' '
    end
    object Label9: TLabel
      Left = 204
      Top = 95
      Width = 25
      Height = 20
      Caption = #1044#1085'.'
    end
    object dxDBCalcEdit1: TdxDBCalcEdit
      Left = 104
      Top = 24
      Width = 72
      TabOrder = 0
      DataField = 'KOEFB'
      DataSource = dsI
    end
    object dxDBCalcEdit3: TdxDBCalcEdit
      Left = 248
      Top = 24
      Width = 57
      TabOrder = 1
      DataField = 'RAZRB'
      DataSource = dsI
    end
    object dxDBCalcEdit5: TdxDBCalcEdit
      Left = 80
      Top = 94
      Width = 121
      TabOrder = 2
      DataField = 'SUMMABF'
      DataSource = dsI
    end
    object dxDBCalcEdit6: TdxDBCalcEdit
      Left = 232
      Top = 95
      Width = 57
      TabOrder = 3
      DataField = 'KALENDDAYA'
      DataSource = dsI
    end
  end
  object dxDBEdit1: TdxDBEdit
    Left = -10
    Top = 3
    Width = 361
    Enabled = False
    TabOrder = 1
    DataField = 'FIO'
    DataSource = dsI
    ReadOnly = True
    StoredValues = 64
  end
  object dxDBEdit2: TdxDBEdit
    Left = 358
    Top = 3
    Width = 193
    Enabled = False
    TabOrder = 2
    DataField = 'DOLG'
    DataSource = dsI
    ReadOnly = True
    StoredValues = 64
  end
  object dxDBDateEdit1: TdxDBDateEdit
    Left = 558
    Top = 3
    Width = 121
    Enabled = False
    TabOrder = 3
    DataField = 'DATABASEIND'
    DataSource = dsI
    ReadOnly = True
    StoredValues = 64
  end
  object Button1: TButton
    Left = -2
    Top = 395
    Width = 89
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 4
    Visible = False
  end
  object BitBtn1: TBitBtn
    Left = -2
    Top = 427
    Width = 145
    Height = 25
    Caption = #1055#1077#1088#1077#1085#1077#1089#1090#1080' '#1074' '#1079'.'#1087'.'
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = -2
    Top = 459
    Width = 81
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 6
    Kind = bkClose
  end
  object BitBtn3: TBitBtn
    Left = 102
    Top = 395
    Width = 113
    Height = 25
    Caption = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090
    TabOrder = 7
    Visible = False
  end
  object BitBtn4: TBitBtn
    Left = 150
    Top = 427
    Width = 75
    Height = 25
    Caption = #1055#1088#1077#1076'.'#1084'.'
    TabOrder = 8
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 230
    Top = 427
    Width = 75
    Height = 25
    Caption = #1057#1083#1077#1076'.'#1084'.'
    TabOrder = 9
    OnClick = BitBtn5Click
  end
  object GroupBoxRes: TGroupBox
    Left = -2
    Top = 235
    Width = 313
    Height = 145
    Caption = #1044#1083#1103' '#1087#1077#1088#1077#1085#1086#1089#1072
    TabOrder = 10
    object Label6: TLabel
      Left = 0
      Top = 48
      Width = 38
      Height = 20
      Caption = #1041#1102#1076'.'
    end
    object Label28: TLabel
      Left = 0
      Top = 88
      Width = 46
      Height = 20
      Caption = #1042#1085#1077' '#1073'.'
    end
    object Label29: TLabel
      Left = 88
      Top = 24
      Width = 36
      Height = 20
      Caption = #1056#1072#1089#1095
    end
    object Label30: TLabel
      Left = 160
      Top = 24
      Width = 40
      Height = 20
      Caption = #1042' '#1079'.'#1087'.'
    end
    object Label31: TLabel
      Left = 216
      Top = 24
      Width = 83
      Height = 20
      Caption = #1050' '#1087#1077#1088#1077#1085#1086#1089#1091
    end
    object SummaFBud: TdxDBMaskEdit
      Left = 136
      Top = 48
      Width = 81
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      DataField = 'SUMMABUD'
      DataSource = dsFaktNach
      IgnoreMaskBlank = False
      ReadOnly = True
      StoredValues = 64
    end
    object SummaFVne: TdxDBEdit
      Left = 136
      Top = 88
      Width = 81
      Enabled = False
      TabOrder = 1
      DataField = 'SUMMAVNE'
      DataSource = dsFaktNach
    end
    object SummaBudR: TEdit
      Left = 48
      Top = 48
      Width = 81
      Height = 28
      Enabled = False
      ReadOnly = True
      TabOrder = 2
      Text = 'SummaBudR'
    end
    object SummaVneR: TEdit
      Left = 48
      Top = 88
      Width = 83
      Height = 28
      Enabled = False
      ReadOnly = True
      TabOrder = 3
      Text = 'SummaVneR'
    end
    object SummaKBud: TEdit
      Left = 224
      Top = 48
      Width = 81
      Height = 28
      TabOrder = 4
      Text = 'SummaKBud'
    end
    object SummaKVne: TEdit
      Left = 224
      Top = 88
      Width = 81
      Height = 28
      Enabled = False
      ReadOnly = True
      TabOrder = 5
      Text = 'SummaKVne'
    end
  end
  object PageControl1: TPageControl
    Left = 318
    Top = 43
    Width = 361
    Height = 481
    ActivePage = ts1
    TabOrder = 11
    object ts1: TTabSheet
      Caption = #1048#1089#1093'.'#1076#1072#1085#1085#1099#1077
      object GroupBoxCurr: TGroupBox
        Left = 0
        Top = 5
        Width = 353
        Height = 481
        Caption = 'GroupBoxCurr'
        TabOrder = 0
        object Label10: TLabel
          Left = 160
          Top = 176
          Width = 78
          Height = 20
          Caption = #1042#1085#1077#1041#1102#1076#1078'.'
        end
        object Label11: TLabel
          Left = 16
          Top = 176
          Width = 49
          Height = 20
          Caption = #1041#1102#1076#1078'.'
        end
        object Label12: TLabel
          Left = 86
          Top = 59
          Width = 85
          Height = 20
          Caption = #1054#1090#1088#1072#1073#1086#1090#1072#1083
        end
        object Label14: TLabel
          Left = 72
          Top = 93
          Width = 232
          Height = 20
          Caption = #1048#1079' '#1088#1072#1089#1095#1077#1090#1072' '#1082#1072#1083#1077#1085#1076#1072#1088#1085#1099#1093' '#1076#1085#1077#1081
        end
        object Label16: TLabel
          Left = 176
          Top = 24
          Width = 56
          Height = 20
          Caption = #1056#1072#1079#1088#1103#1076
        end
        object Label17: TLabel
          Left = 8
          Top = 24
          Width = 89
          Height = 20
          Caption = #1050'-'#1074#1086' '#1089#1090#1072#1074#1086#1082
        end
        object Label18: TLabel
          Left = 14
          Top = 124
          Width = 61
          Height = 20
          Caption = #1053#1072#1095#1080#1089#1083'.'
        end
        object Label19: TLabel
          Left = 217
          Top = 124
          Width = 21
          Height = 20
          Caption = #1044#1085
        end
        object Label20: TLabel
          Left = 104
          Top = 152
          Width = 126
          Height = 20
          Caption = #1044#1086#1083#1080' '#1086#1089#1085'.'#1089#1090#1072#1074#1082#1080
        end
        object Label21: TLabel
          Left = 8
          Top = 232
          Width = 96
          Height = 20
          Caption = #1055#1086#1089#1090#1086#1103#1085#1085#1072#1103' '
        end
        object Label22: TLabel
          Left = 8
          Top = 270
          Width = 114
          Height = 20
          Caption = #1056#1072#1089#1095#1077#1090#1085#1072#1103' '#1080#1085#1076
        end
        object Label23: TLabel
          Left = 8
          Top = 302
          Width = 93
          Height = 20
          Caption = #1048#1085#1076' '#1079#1072' '#1088'.'#1076#1085'.'
        end
        object Label24: TLabel
          Left = 80
          Top = 357
          Width = 175
          Height = 20
          Caption = #1056#1072#1089#1095#1077#1090#1085#1072#1103' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1103
        end
        object Label25: TLabel
          Left = 64
          Top = 376
          Width = 49
          Height = 20
          Caption = #1041#1102#1076#1078'.'
        end
        object Label26: TLabel
          Left = 192
          Top = 376
          Width = 78
          Height = 20
          Caption = #1042#1085#1077#1041#1102#1076#1078'.'
        end
        object Label2: TLabel
          Left = 237
          Top = 58
          Width = 38
          Height = 20
          Caption = #1076#1085#1077#1081
        end
        object dxDBCalcEdit7: TdxDBCalcEdit
          Left = 101
          Top = 24
          Width = 72
          TabOrder = 0
          DataField = 'KOEFA'
          DataSource = dsI
        end
        object dxDBCalcEdit8: TdxDBCalcEdit
          Left = 240
          Top = 24
          Width = 57
          TabOrder = 1
          DataField = 'RAZRA'
          DataSource = dsI
        end
        object dxDBCalcEdit10: TdxDBCalcEdit
          Left = 176
          Top = 55
          Width = 57
          TabOrder = 2
          DataField = 'WORKDAYA'
          DataSource = dsI
        end
        object dxdbclcdtSUMMABF: TdxDBCalcEdit
          Left = 80
          Top = 118
          Width = 121
          TabOrder = 3
          DataField = 'SUMMAAF'
          DataSource = dsI
        end
        object dxdbclcdtKALENDDAYB: TdxDBCalcEdit
          Left = 256
          Top = 119
          Width = 57
          TabOrder = 4
          DataField = 'KALENDDAYA'
          DataSource = dsI
        end
        object dxDBCalcEdit13: TdxDBCalcEdit
          Left = 72
          Top = 176
          Width = 81
          TabOrder = 5
          DataField = 'KOEFOSNBUD'
          DataSource = dsI
        end
        object dxDBCalcEdit14: TdxDBCalcEdit
          Left = 248
          Top = 176
          Width = 65
          TabOrder = 6
        end
        object dxdbclcdtSUMMAPOSTIND: TdxDBCalcEdit
          Left = 120
          Top = 232
          Width = 121
          TabOrder = 7
          DataField = 'SUMMAPOSTIND'
          DataSource = dsI
        end
        object dxDBCalcEdit16: TdxDBCalcEdit
          Left = 48
          Top = 400
          Width = 121
          TabOrder = 8
          DataField = 'SUMMAINDBUD'
          DataSource = dsI
        end
        object dxDBCalcEdit17: TdxDBCalcEdit
          Left = 120
          Top = 264
          Width = 121
          TabOrder = 9
          DataField = 'SUMMAINDCALC'
          DataSource = dsI
        end
        object dxDBCalcEdit18: TdxDBCalcEdit
          Left = 184
          Top = 400
          Width = 121
          TabOrder = 10
          DataField = 'SUMMAINDVNE'
          DataSource = dsI
        end
        object dxDBCalcEdit9: TdxDBCalcEdit
          Left = 120
          Top = 296
          Width = 121
          TabOrder = 11
          DataField = 'SUMMAINDWDAY'
          DataSource = dsI
        end
      end
    end
    object ts2: TTabSheet
      Caption = #1056#1072#1089#1095#1077#1090#1085'.'#1076#1072#1085#1085#1099#1077
      ImageIndex = 1
      object Label32: TLabel
        Left = 8
        Top = 24
        Width = 133
        Height = 20
        Caption = #1055#1088#1086#1094'.'#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080
      end
      object Label33: TLabel
        Left = 8
        Top = 72
        Width = 121
        Height = 20
        Caption = #1059#1074#1077#1083#1080#1095#1077#1085#1080#1077' '#1079'.'#1087'.'
      end
      object dxdbclcdtPROCIND: TdxDBCalcEdit
        Left = 152
        Top = 24
        Width = 121
        TabOrder = 0
        DataField = 'PROCIND'
        DataSource = dsI
      end
      object dxdbclcdtSUMMAUW: TdxDBCalcEdit
        Left = 152
        Top = 64
        Width = 121
        TabOrder = 1
        DataField = 'SUMMAUW'
        DataSource = dsI
      end
      object dxDBCalcEdit12: TdxDBCalcEdit
        Left = 152
        Top = 104
        Width = 121
        TabOrder = 2
        Visible = False
      end
      object dxDBCalcEdit15: TdxDBCalcEdit
        Left = 152
        Top = 152
        Width = 121
        TabOrder = 3
        Visible = False
      end
      object dxDBCalcEdit19: TdxDBCalcEdit
        Left = 152
        Top = 192
        Width = 121
        TabOrder = 4
        Visible = False
      end
      object dxDBMemo1: TdxDBMemo
        Left = 0
        Top = 288
        Width = 185
        Enabled = False
        TabOrder = 5
        DataField = 'COMMENT'
        DataSource = dsI
        ReadOnly = True
        Height = 89
        StoredValues = 64
      end
    end
    object TabSheet1: TTabSheet
      Caption = #1042#1089#1077
      ImageIndex = 2
      DesignSize = (
        353
        446)
      object dxDBGridAll: TdxDBGrid
        Left = 8
        Top = 24
        Width = 337
        Height = 249
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'SHIFRID'
        SummaryGroups = <>
        SummarySeparator = ', '
        TabOrder = 0
        DataSource = dsAll
        Filter.Criteria = {00000000}
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
        Anchors = [akLeft, akTop, akRight, akBottom]
        object dxDBGridAllSHIFRID: TdxDBGridMaskColumn
          Visible = False
          Width = 83
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRID'
        end
        object dxDBGridAllYEARZA: TdxDBGridMaskColumn
          Width = 43
          BandIndex = 0
          RowIndex = 0
          FieldName = 'YEARZA'
        end
        object dxDBGridAllMONTHZA: TdxDBGridMaskColumn
          Width = 45
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MONTHZA'
        end
        object dxDBGridAllSHIFRPOD: TdxDBGridMaskColumn
          Width = 57
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHIFRPOD'
        end
        object dxDBGridAllDOLG: TdxDBGridMaskColumn
          Width = 454
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DOLG'
        end
        object dxDBGridAllDATABASEIND: TdxDBGridDateColumn
          Width = 94
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DATABASEIND'
        end
        object dxDBGridAllKOEFA: TdxDBGridCurrencyColumn
          Width = 47
          BandIndex = 0
          RowIndex = 0
          FieldName = 'KOEFA'
          Nullable = False
        end
        object dxDBGridAllSUMMABF: TdxDBGridCurrencyColumn
          Width = 94
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMABF'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
        end
        object dxDBGridAllSUMMAAF: TdxDBGridCurrencyColumn
          Width = 94
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAAF'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
        end
        object dxDBGridAllWORKDAYA: TdxDBGridMaskColumn
          Width = 94
          BandIndex = 0
          RowIndex = 0
          FieldName = 'WORKDAYA'
        end
        object dxDBGridAllSUMMAINDCALC: TdxDBGridCurrencyColumn
          Width = 94
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAINDCALC'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
        end
        object dxDBGridAllSUMMAPOSTIND: TdxDBGridCurrencyColumn
          Width = 94
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAPOSTIND'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
        end
        object dxDBGridAllSUMMAINDBUD: TdxDBGridCurrencyColumn
          Width = 94
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAINDBUD'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
        end
        object dxDBGridAllSUMMAINDVNE: TdxDBGridCurrencyColumn
          Width = 94
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAINDVNE'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
        end
        object dxDBGridAllSUMMAINDWDAY: TdxDBGridCurrencyColumn
          Width = 99
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMAINDWDAY'
          DisplayFormat = ',0.00;-,0.00'
          Nullable = False
        end
      end
    end
  end
  object dsI: TDataSource
    DataSet = pFIBdsI
    Left = 184
    Top = 24
  end
  object pFIBdsI: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_IND_CALC_12_7'
      'SET '
      ' TABNO = :TABNO,'
      ' FIO = :FIO,'
      ' YEARZA = :YEARZA,'
      ' MONTHZA = :MONTHZA,'
      ' DATAZA = :DATAZA,'
      ' SHIFRPOD = :SHIFRPOD,'
      ' DOLG = :DOLG,'
      ' DATABASEIND = :DATABASEIND,'
      ' RAZRB = :RAZRB,'
      ' KOEFB = :KOEFB,'
      ' RAZRA = :RAZRA,'
      ' KOEFA = :KOEFA,'
      ' KOEFBUD = :KOEFBUD,'
      ' KOEFVNE = :KOEFVNE,'
      ' PROCIND = :PROCIND,'
      ' SUMMAB = :SUMMAB,'
      ' SUMMABF = :SUMMABF,'
      ' WORKDAYB = :WORKDAYB,'
      ' KALENDDAYB = :KALENDDAYB,'
      ' SUMMAA = :SUMMAA,'
      ' SUMMAAF = :SUMMAAF,'
      ' WORKDAYA = :WORKDAYA,'
      ' KALENDDAYA = :KALENDDAYA,'
      ' SUMMAINDBF = :SUMMAINDBF,'
      ' SUMMAUW = :SUMMAUW,'
      ' SUMMAINDCALC = :SUMMAINDCALC,'
      ' SUMMAPOSTIND = :SUMMAPOSTIND,'
      ' SUMMAINDBUD = :SUMMAINDBUD,'
      ' SUMMAINDVNE = :SUMMAINDVNE,'
      ' NEEDIND = :NEEDIND,'
      ' COMMENT = :COMMENT,'
      ' ISPOVRAZR = :ISPOVRAZR,'
      ' MOVEDBUD = :MOVEDBUD,'
      ' MOVEDVNE = :MOVEDVNE,'
      ' SUMMAINDWDAY = :SUMMAINDWDAY,'
      ' KOEFOSN = :KOEFOSN,'
      ' KOEFOSNBUD = :KOEFOSNBUD,'
      ' KOEFOSNVNE = :KOEFOSNVNE,'
      ' SUMMAFIXPREV = :SUMMAFIXPREV'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_IND_CALC_12_7'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_IND_CALC_12_7('
      ' SHIFRID,'
      ' TABNO,'
      ' FIO,'
      ' YEARZA,'
      ' MONTHZA,'
      ' DATAZA,'
      ' SHIFRPOD,'
      ' DOLG,'
      ' DATABASEIND,'
      ' RAZRB,'
      ' KOEFB,'
      ' RAZRA,'
      ' KOEFA,'
      ' KOEFBUD,'
      ' KOEFVNE,'
      ' PROCIND,'
      ' SUMMAB,'
      ' SUMMABF,'
      ' WORKDAYB,'
      ' KALENDDAYB,'
      ' SUMMAA,'
      ' SUMMAAF,'
      ' WORKDAYA,'
      ' KALENDDAYA,'
      ' SUMMAINDBF,'
      ' SUMMAUW,'
      ' SUMMAINDCALC,'
      ' SUMMAPOSTIND,'
      ' SUMMAINDBUD,'
      ' SUMMAINDVNE,'
      ' NEEDIND,'
      ' COMMENT,'
      ' ISPOVRAZR,'
      ' MOVEDBUD,'
      ' MOVEDVNE,'
      ' SUMMAINDWDAY,'
      ' KOEFOSN,'
      ' KOEFOSNBUD,'
      ' KOEFOSNVNE,'
      ' SUMMAFIXPREV'
      ')'
      'VALUES('
      ' :SHIFRID,'
      ' :TABNO,'
      ' :FIO,'
      ' :YEARZA,'
      ' :MONTHZA,'
      ' :DATAZA,'
      ' :SHIFRPOD,'
      ' :DOLG,'
      ' :DATABASEIND,'
      ' :RAZRB,'
      ' :KOEFB,'
      ' :RAZRA,'
      ' :KOEFA,'
      ' :KOEFBUD,'
      ' :KOEFVNE,'
      ' :PROCIND,'
      ' :SUMMAB,'
      ' :SUMMABF,'
      ' :WORKDAYB,'
      ' :KALENDDAYB,'
      ' :SUMMAA,'
      ' :SUMMAAF,'
      ' :WORKDAYA,'
      ' :KALENDDAYA,'
      ' :SUMMAINDBF,'
      ' :SUMMAUW,'
      ' :SUMMAINDCALC,'
      ' :SUMMAPOSTIND,'
      ' :SUMMAINDBUD,'
      ' :SUMMAINDVNE,'
      ' :NEEDIND,'
      ' :COMMENT,'
      ' :ISPOVRAZR,'
      ' :MOVEDBUD,'
      ' :MOVEDVNE,'
      ' :SUMMAINDWDAY,'
      ' :KOEFOSN,'
      ' :KOEFOSNBUD,'
      ' :KOEFOSNVNE,'
      ' :SUMMAFIXPREV'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' TABNO, '
      ' FIO,'
      ' YEARZA,'
      ' MONTHZA,'
      ' DATAZA,'
      ' SHIFRPOD,'
      ' DOLG,'
      ' DATABASEIND,'
      ' RAZRB,'
      ' KOEFB,'
      ' RAZRA,'
      ' KOEFA,'
      ' KOEFBUD,'
      ' KOEFVNE,'
      ' PROCIND,'
      ' SUMMAB,'
      ' SUMMABF,'
      ' WORKDAYB,'
      ' KALENDDAYB,'
      ' SUMMAA,'
      ' SUMMAAF,'
      ' WORKDAYA,'
      ' KALENDDAYA,'
      ' SUMMAINDBF,'
      ' SUMMAUW,'
      ' SUMMAINDCALC,'
      ' SUMMAPOSTIND,'
      ' SUMMAINDBUD,'
      ' SUMMAINDVNE,'
      ' NEEDIND,'
      ' COMMENT,'
      ' ISPOVRAZR,'
      ' MOVEDBUD,'
      ' MOVEDVNE,'
      ' SUMMAINDWDAY,'
      ' KOEFOSN,'
      ' KOEFOSNBUD,'
      ' KOEFOSNVNE,'
      ' SUMMAFIXPREV'
      'FROM'
      ' TB_IND_CALC_12_7 '
      'where'
      ' TB_IND_CALC_12_7.SHIFRID = :OLD_SHIFRID'
      ''
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' TABNO, '
      ' FIO,'
      ' YEARZA,'
      ' MONTHZA,'
      ' DATAZA,'
      ' SHIFRPOD,'
      ' DOLG,'
      ' DATABASEIND,'
      ' RAZRB,'
      ' KOEFB,'
      ' RAZRA,'
      ' KOEFA,'
      ' KOEFBUD,'
      ' KOEFVNE,'
      ' PROCIND,'
      ' SUMMAB,'
      ' SUMMABF,'
      ' WORKDAYB,'
      ' KALENDDAYB,'
      ' SUMMAA,'
      ' SUMMAAF,'
      ' WORKDAYA,'
      ' KALENDDAYA,'
      ' SUMMAINDBF,'
      ' SUMMAUW,'
      ' SUMMAINDCALC,'
      ' SUMMAPOSTIND,'
      ' SUMMAINDBUD,'
      ' SUMMAINDVNE,'
      ' NEEDIND,'
      ' COMMENT,'
      ' ISPOVRAZR,'
      ' MOVEDBUD,'
      ' MOVEDVNE,'
      ' SUMMAINDWDAY,'
      ' KOEFOSN,'
      ' KOEFOSNBUD,'
      ' KOEFOSNVNE,'
      ' SUMMAFIXPREV'
      'FROM'
      ' TB_IND_CALC_12_7 '
      'where'
      ' TABNO=:TABNO AND'
      ' YEARZA=:Y AND'
      ' MONTHZA=:M')
    Transaction = pFIBTrIRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTrIWrite
    Left = 72
    Top = 24
    object pFIBdsISHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object pFIBdsITABNO: TFIBIntegerField
      FieldName = 'TABNO'
    end
    object pFIBdsIFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBdsIYEARZA: TFIBSmallIntField
      FieldName = 'YEARZA'
    end
    object pFIBdsIMONTHZA: TFIBSmallIntField
      FieldName = 'MONTHZA'
    end
    object pFIBdsIDATAZA: TFIBDateField
      FieldName = 'DATAZA'
    end
    object pFIBdsISHIFRPOD: TFIBSmallIntField
      FieldName = 'SHIFRPOD'
    end
    object pFIBdsIDOLG: TFIBStringField
      FieldName = 'DOLG'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBdsIDATABASEIND: TFIBDateField
      FieldName = 'DATABASEIND'
    end
    object pFIBdsIRAZRB: TFIBSmallIntField
      FieldName = 'RAZRB'
    end
    object pFIBdsIKOEFB: TFIBBCDField
      FieldName = 'KOEFB'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsIRAZRA: TFIBSmallIntField
      FieldName = 'RAZRA'
    end
    object pFIBdsIKOEFA: TFIBBCDField
      FieldName = 'KOEFA'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsIKOEFBUD: TFIBBCDField
      FieldName = 'KOEFBUD'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsIKOEFVNE: TFIBBCDField
      FieldName = 'KOEFVNE'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsIPROCIND: TFIBBCDField
      FieldName = 'PROCIND'
      Size = 4
      RoundByScale = True
    end
    object pFIBdsISUMMAB: TFIBBCDField
      FieldName = 'SUMMAB'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsISUMMABF: TFIBBCDField
      FieldName = 'SUMMABF'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsIWORKDAYB: TFIBSmallIntField
      FieldName = 'WORKDAYB'
    end
    object pFIBdsIKALENDDAYB: TFIBSmallIntField
      FieldName = 'KALENDDAYB'
    end
    object pFIBdsISUMMAA: TFIBBCDField
      FieldName = 'SUMMAA'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsISUMMAAF: TFIBBCDField
      FieldName = 'SUMMAAF'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsIWORKDAYA: TFIBSmallIntField
      FieldName = 'WORKDAYA'
    end
    object pFIBdsIKALENDDAYA: TFIBSmallIntField
      FieldName = 'KALENDDAYA'
    end
    object pFIBdsISUMMAINDBF: TFIBBCDField
      FieldName = 'SUMMAINDBF'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsISUMMAUW: TFIBBCDField
      FieldName = 'SUMMAUW'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsISUMMAINDCALC: TFIBBCDField
      FieldName = 'SUMMAINDCALC'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsISUMMAPOSTIND: TFIBBCDField
      FieldName = 'SUMMAPOSTIND'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsISUMMAINDBUD: TFIBBCDField
      FieldName = 'SUMMAINDBUD'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsISUMMAINDVNE: TFIBBCDField
      FieldName = 'SUMMAINDVNE'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsINEEDIND: TFIBSmallIntField
      FieldName = 'NEEDIND'
    end
    object pFIBdsICOMMENT: TFIBStringField
      FieldName = 'COMMENT'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBdsIISPOVRAZR: TFIBSmallIntField
      FieldName = 'ISPOVRAZR'
    end
    object pFIBdsIMOVEDBUD: TFIBSmallIntField
      FieldName = 'MOVEDBUD'
    end
    object pFIBdsIMOVEDVNE: TFIBSmallIntField
      FieldName = 'MOVEDVNE'
    end
    object pFIBdsISUMMAINDWDAY: TFIBBCDField
      FieldName = 'SUMMAINDWDAY'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsIKOEFOSN: TFIBBCDField
      FieldName = 'KOEFOSN'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsIKOEFOSNBUD: TFIBBCDField
      FieldName = 'KOEFOSNBUD'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsIKOEFOSNVNE: TFIBBCDField
      FieldName = 'KOEFOSNVNE'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsISUMMAFIXPREV: TFIBBCDField
      FieldName = 'SUMMAFIXPREV'
      Size = 2
      RoundByScale = True
    end
  end
  object pFIBTrIWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 104
    Top = 24
  end
  object pFIBTrIRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 144
    Top = 24
  end
  object pFIBdsFaktNach: TpFIBDataSet
    SelectSQL.Strings = (
      'select first 1'
      'coalesce((select sum(a.summa) from fadd a'
      '        join person b on a.shifridperson=b.shifrid'
      'where b.tabno=:t1 and a.year_za=:y1'
      '                   and a.month_za=:m1'
      '                   and a.shifrsta=28'
      '                   and b.shifrgru=1),0) as summabud,'
      ''
      'coalesce((select sum(a.summa) from fadd a'
      '        join person b on a.shifridperson=b.shifrid'
      'where b.tabno=:t2 and a.year_za=:y2'
      '                   and a.month_za=:m2'
      '                   and a.shifrsta=28'
      '                   and b.shifrgru<>1),0) as summavne'
      ''
      'from rdb$database')
    Transaction = pFIBTrIRead
    Database = FIB.pFIBDatabaseSal
    Left = 216
    Top = 24
    object pFIBdsFaktNachSUMMABUD: TFIBBCDField
      FieldName = 'SUMMABUD'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
    object pFIBdsFaktNachSUMMAVNE: TFIBBCDField
      FieldName = 'SUMMAVNE'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
  end
  object dsFaktNach: TDataSource
    DataSet = pFIBdsFaktNach
    Left = 248
    Top = 24
  end
  object dsAll: TDataSource
    DataSet = pFIBdsAll
    Left = 360
    Top = 24
  end
  object pFIBdsAll: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' SHIFRPOD,'
      ' DOLG,'
      ' DATABASEIND,'
      ' KOEFA,'
      ' SUMMABF,'
      ' SUMMAAF,'
      ' WORKDAYA,'
      ' SUMMAINDCALC,'
      ' SUMMAPOSTIND,'
      ' SUMMAINDBUD,'
      ' SUMMAINDVNE,'
      ' SUMMAINDWDAY,'
      ' YearZA,'
      ' MonthZA'
      'FROM'
      ' TB_IND_CALC_12_7 '
      'where tabno=:tabno'
      'order by yearza,monthza')
    Transaction = pFIBTrIRead
    Database = FIB.pFIBDatabaseSal
    Left = 296
    Top = 24
    object pFIBdsAllSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      Visible = False
    end
    object pFIBdsAllSHIFRPOD: TFIBSmallIntField
      DisplayLabel = #1055#1076#1088
      FieldName = 'SHIFRPOD'
    end
    object pFIBdsAllDOLG: TFIBStringField
      DisplayLabel = #1044#1086#1083#1078#1085
      FieldName = 'DOLG'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBdsAllDATABASEIND: TFIBDateField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DATABASEIND'
    end
    object pFIBdsAllKOEFA: TFIBBCDField
      DisplayLabel = #1050'-'#1090
      FieldName = 'KOEFA'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsAllSUMMABF: TFIBBCDField
      DisplayLabel = #1053#1072#1095' '#1076#1086
      FieldName = 'SUMMABF'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsAllSUMMAAF: TFIBBCDField
      DisplayLabel = #1053#1072#1095' '#1087#1086#1089#1083#1077
      FieldName = 'SUMMAAF'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsAllWORKDAYA: TFIBSmallIntField
      DisplayLabel = #1056'.'#1076#1085
      FieldName = 'WORKDAYA'
    end
    object pFIBdsAllSUMMAINDCALC: TFIBBCDField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1080#1085#1076
      FieldName = 'SUMMAINDCALC'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsAllSUMMAPOSTIND: TFIBBCDField
      DisplayLabel = #1055#1086#1089#1090
      FieldName = 'SUMMAPOSTIND'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsAllSUMMAINDBUD: TFIBBCDField
      DisplayLabel = #1048#1085#1076' '#1073#1102#1076
      FieldName = 'SUMMAINDBUD'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsAllSUMMAINDVNE: TFIBBCDField
      DisplayLabel = #1048#1085#1076' '#1074#1085#1077
      FieldName = 'SUMMAINDVNE'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsAllSUMMAINDWDAY: TFIBBCDField
      DisplayLabel = #1048#1085#1076' '#1079#1072' '#1088' '#1076#1085'.'
      FieldName = 'SUMMAINDWDAY'
      Size = 2
      RoundByScale = True
    end
    object pFIBdsAllYEARZA: TFIBSmallIntField
      DisplayLabel = #1043#1086#1076
      FieldName = 'YEARZA'
    end
    object pFIBdsAllMONTHZA: TFIBSmallIntField
      DisplayLabel = #1052#1094
      FieldName = 'MONTHZA'
    end
  end
end
