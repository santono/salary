object FormReeBoln: TFormReeBoln
  Left = 234
  Top = 186
  Width = 696
  Height = 473
  Caption = #1056#1077#1077#1089#1090#1088#1099' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093' '#1083#1080#1089#1090#1082#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    680
    435)
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridRB: TdxDBGrid
    Left = 8
    Top = 0
    Width = 665
    Height = 401
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    ShowSummaryFooter = True
    SummaryGroups = <>
    SummarySeparator = ', '
    PopupMenu = PopupMenu1
    TabOrder = 0
    DataSource = DataSourceRB
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridRBSHIFRID: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGridRBNOMER: TdxDBGridMaskColumn
      Caption = #1053#1086#1084#1077#1088
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NOMER'
    end
    object dxDBGridRBDATEFORM: TdxDBGridDateColumn
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATEFORM'
    end
    object dxDBGridRBDATEREE: TdxDBGridDateColumn
      Caption = #1054#1090#1086#1089#1083#1072#1085
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATEREE'
    end
    object dxDBGridRBDATERCV: TdxDBGridDateColumn
      Caption = #1055#1086#1083#1091#1095#1077#1085
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATERCV'
    end
    object dxDBGridRBNMBOFBLN: TdxDBGridMaskColumn
      Caption = #1050'-'#1074#1086
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NMBOFBLN'
      SummaryFooterType = cstSum
      SummaryFooterField = 'NMBOFBLN'
      SummaryFooterFormat = '0.'
      SummaryField = 'NMBOFBLN'
      SummaryFormat = '0.'
    end
    object dxDBGridRBSUMMA: TdxDBGridCurrencyColumn
      Caption = #1057#1091#1084#1084#1072
      HeaderAlignment = taCenter
      Sorted = csUp
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMA'
      SummaryFooterType = cstSum
      SummaryFooterField = 'SUMMA'
      DisplayFormat = ',0.00;-,0.00'
      Nullable = False
      SummaryField = 'SUMMA'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 408
    Width = 240
    Height = 25
    DataSource = DataSourceRB
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object pFIBDataSetRB: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_REE_BOLN'
      'SET '
      ' NOMER    = :NOMER    ,'
      ' DATEFORM = :DATEFORM ,'
      ' DATEREE  = :DATEREE  ,'
      ' DATERCV  = :DATERCV  ,'
      ' NMBOFBLN = :NMBOFBLN ,'
      ' SUMMA    = :SUMMA'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_REE_BOLN'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_REE_BOLN('
      ' SHIFRID,'
      ' NOMER,'
      ' DATEFORM,'
      ' DATEREE,'
      ' DATERCV'
      ')'
      'VALUES('
      ' :SHIFRID,'
      ' :NOMER,'
      ' :DATEFORM,'
      ' :DATEREE,'
      ' :DATERCV'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRID  ,'
      ' NOMER    ,'
      ' DATEFORM ,'
      ' DATEREE  ,'
      ' DATERCV  ,'
      ' NMBOFBLN ,'
      ' SUMMA'
      'FROM'
      ' TB_REE_BOLN '
      ' WHERE '
      '  TB_REE_BOLN.SHIFRID = :OLD_SHIFRID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID  ,'
      ' NOMER    ,'
      ' DATEFORM ,'
      ' DATEREE  ,'
      ' DATERCV  ,'
      ' NMBOFBLN ,'
      ' SUMMA'
      'FROM'
      ' TB_REE_BOLN ')
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = pFIBTransactionWrite
    AutoCommit = True
    Left = 16
    Top = 16
    object pFIBDataSetRBSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object pFIBDataSetRBNOMER: TFIBStringField
      FieldName = 'NOMER'
      Size = 15
      EmptyStrToNull = True
    end
    object pFIBDataSetRBDATEFORM: TFIBDateField
      FieldName = 'DATEFORM'
    end
    object pFIBDataSetRBDATEREE: TFIBDateField
      FieldName = 'DATEREE'
    end
    object pFIBDataSetRBDATERCV: TFIBDateField
      FieldName = 'DATERCV'
    end
    object pFIBDataSetRBNMBOFBLN: TFIBSmallIntField
      FieldName = 'NMBOFBLN'
    end
    object pFIBDataSetRBSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
  end
  object pFIBTransactionRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 56
    Top = 16
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 96
    Top = 16
  end
  object DataSourceRB: TDataSource
    DataSet = pFIBDataSetRB
    Left = 136
    Top = 16
  end
  object PopupMenu1: TPopupMenu
    Left = 88
    Top = 152
    object N1: TMenuItem
      Caption = #1042#1099#1073#1086#1088
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1056#1072#1089#1095#1077#1090
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
      object Ecxelc0620121: TMenuItem
        Caption = #1055#1077#1095#1072#1090#1100' '#1074' Ecxel c 06 2012'
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1055#1077#1095#1072#1090#1100' FR '#1076#1086' 06 2012'
        OnClick = N5Click
      end
    end
  end
  object pFIBQueryB: TpFIBQuery
    Transaction = pFIBTransactionQ
    Database = FIB.pFIBDatabaseSal
    Left = 88
    Top = 96
  end
  object pFIBTransactionQ: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 136
    Top = 96
  end
  object pFIBDataSetRR: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select fio,swidss,nomer_b,codeill,periodill,daytot,dayss,summato' +
        't,summass from PR_FILL_B_REE_LINE(:shifrid) order by fio')
    Transaction = pFIBTransactionRR
    Database = FIB.pFIBDatabaseSal
    Left = 280
    Top = 56
    object pFIBDataSetRRFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 51
      EmptyStrToNull = True
    end
    object pFIBDataSetRRSWIDSS: TFIBStringField
      FieldName = 'SWIDSS'
      Size = 15
      EmptyStrToNull = True
    end
    object pFIBDataSetRRNOMER_B: TFIBStringField
      FieldName = 'NOMER_B'
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSetRRCODEILL: TFIBIntegerField
      FieldName = 'CODEILL'
    end
    object pFIBDataSetRRPERIODILL: TFIBStringField
      FieldName = 'PERIODILL'
      Size = 25
      EmptyStrToNull = True
    end
    object pFIBDataSetRRDAYTOT: TFIBIntegerField
      FieldName = 'DAYTOT'
    end
    object pFIBDataSetRRDAYSS: TFIBIntegerField
      FieldName = 'DAYSS'
    end
    object pFIBDataSetRRSUMMATOT: TFIBBCDField
      FieldName = 'SUMMATOT'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRRSUMMASS: TFIBBCDField
      FieldName = 'SUMMASS'
      Size = 2
      RoundByScale = True
    end
  end
  object pFIBTransactionRR: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 320
    Top = 56
  end
  object frxReportRR: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40582.390444861100000000
    ReportOptions.LastChange = 40895.635321354160000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 360
    Top = 56
    Datasets = <
      item
        DataSet = frxDBDatasetRR
        DataSetName = 'frxDBDatasetRR'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 359.055350000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo2: TfrxMemoView
          Left = 389.291590000000000000
          Top = 170.078850000000000000
          Width = 204.094620000000000000
          Height = 188.976500000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            ' '#1056#1119#1057#1026#1056#1105#1057#8225#1056#1105#1056#1029#1056#176' '#1056#1029#1056#181#1056#1111#1057#1026#1056#176#1057#8224#1056#181#1056#183#1056#1169#1056#176#1057#8218#1056#1029#1056#1109#1057#1027#1057#8218#1057#8211':'
            ' '#1056#183#1056#176#1057#8230#1056#1030#1056#1109#1057#1026#1057#1035#1056#1030#1056#176#1056#1029#1056#1029#1057#1039' '#1056#183#1056#176#1056#1110#1056#176#1056#187#1057#1034#1056#1029#1056#181'-1;'
            ' '#1056#1029#1056#176#1057#1027#1056#187#1057#8211#1056#1169#1056#1109#1056#1108' '#1056#176#1056#1030#1056#176#1057#1026#1057#8211#1057#8212' '#1056#1029#1056#176' '#1056#167#1056#1106#1056#8226#1056#1038'-3;'
            '    '#1056#1029#1056#181#1056#1030#1056#1105#1057#1026#1056#1109#1056#177#1056#1029#1056#1105#1057#8225#1057#8211' '#1057#8218#1057#1026#1056#176#1056#1030#1056#1112#1056#1105'-5;'
            '     '#1056#1108#1056#1109#1056#1029#1057#8218#1056#176#1056#1108#1057#8218' '#1056#183' '#1057#8230#1056#1030#1056#1109#1057#1026#1056#1105#1056#1112#1056#1105' '#1056#1029#1056#176
            '   '#1057#8211#1056#1029#1057#8222#1056#181#1056#1108#1057#8224#1057#8211#1056#8470#1056#1029#1057#8211' '#1056#183#1056#176#1057#8230#1056#1030#1056#1109#1057#1026#1057#1035#1056#1030#1056#176#1056#1029#1056#1029#1057#1039' '#1057#8218#1056#176
            #1056#177#1056#176#1056#1108#1057#8218#1056#181#1057#1026#1057#8211#1056#1109#1056#1029#1056#1109#1057#1027#1057#8211#1056#8470#1057#1027#1057#8218#1056#1030#1056#1109'-6; '#1057#1027#1056#176#1056#1029#1056#176#1057#8218#1056#1109#1057#1026#1056#1029#1056#1109'-'
            '       '#1056#1108#1057#1107#1057#1026#1056#1109#1057#1026#1057#8218#1056#1029#1056#181' '#1056#187#1057#8211#1056#1108#1057#1107#1056#1030#1056#176#1056#1029#1056#1029#1057#1039'-7;'
            '      '#1056#1030#1056#176#1056#1110#1057#8211#1057#8218#1056#1029#1057#8211#1057#1027#1057#8218#1057#1034' '#1057#8218#1056#176' '#1056#1111#1056#1109#1056#187#1056#1109#1056#1110#1056#1105'-8;'
            '  '#1056#1109#1057#1026#1057#8218#1056#1109#1056#1111#1056#181#1056#1169#1056#1105#1057#8225#1056#1029#1056#181' '#1056#1111#1057#1026#1056#1109#1057#8218#1056#181#1056#183#1057#1107#1056#1030#1056#176#1056#1029#1056#1029#1057#1039'-9;'
            '                  '#1056#1169#1056#1109#1056#1110#1056#187#1057#1039#1056#1169'-10')
        end
        object Memo3: TfrxMemoView
          Left = 306.141930000000000000
          Top = 170.078850000000000000
          Width = 83.149660000000000000
          Height = 188.976500000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#187#1056#1105#1057#1027#1057#8218#1056#1108#1056#176
            #1056#1029#1056#181#1056#1111#1057#1026#1056#176#1057#8224#1056#181#1056#183#1056#1169#1056#176#1057#8218#1056#1029#1056#1109#1057#1027#1057#8218#1057#8211)
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 960.000620000000000000
          Top = 207.874150000000000000
          Width = 86.929190000000000000
          Height = 151.181200000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1030' '#1057#8218'.'#1057#8225'. '#1056#183#1056#176' '#1057#1026#1056#176#1057#8230#1057#1107#1056#1029#1056#1109#1056#1108' '
            #1056#1108#1056#1109#1057#8364#1057#8218#1057#8211#1056#1030' '#1056#164#1056#1109#1056#1029#1056#1169#1057#1107)
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 873.071430000000000000
          Top = 207.874150000000000000
          Width = 86.929190000000000000
          Height = 151.181200000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1026#1056#176#1056#183#1056#1109#1056#1112)
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 797.480830000000000000
          Top = 207.874150000000000000
          Width = 75.590600000000000000
          Height = 151.181200000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1030' '#1057#8218'.'#1057#8225'. '#1056#183#1056#176' '#1057#1026#1056#176#1057#8230#1057#1107#1056#1029#1056#1109#1056#1108' '
            #1056#1108#1056#1109#1057#8364#1057#8218#1057#8211#1056#1030' '#1056#164#1056#1109#1056#1029#1056#1169#1057#1107)
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 729.449290000000000000
          Top = 207.874150000000000000
          Width = 68.031540000000000000
          Height = 151.181200000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1057#1026#1056#176#1056#183#1056#1109#1056#1112)
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 873.071430000000000000
          Top = 170.078850000000000000
          Width = 173.858380000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#176)
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 729.449290000000000000
          Top = 170.078850000000000000
          Width = 143.622140000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1057#8211#1056#187#1057#1034#1056#1108#1057#8211#1057#1027#1057#8218#1057#1034' '#1056#1169#1056#1029#1057#8211#1056#1030','
            #1057#8240#1056#1109' '#1056#1111#1057#8211#1056#1169#1056#187#1057#1039#1056#1110#1056#176#1057#1035#1057#8218#1057#1034' '#1056#1109#1056#1111#1056#187#1056#176#1057#8218#1057#8211)
        end
        object Memo20: TfrxMemoView
          Left = 593.386210000000000000
          Top = 170.078850000000000000
          Width = 136.063080000000000000
          Height = 188.976500000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#181#1057#1026#1057#8211#1056#1109#1056#1169
            #1056#1029#1056#181#1056#1111#1057#1026#1056#176#1057#8224#1056#181#1056#183#1056#1169#1056#176#1056#1029#1056#1109#1057#1027#1057#8218#1057#8211)
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 215.433210000000000000
          Top = 170.078850000000000000
          Width = 90.708720000000000000
          Height = 188.976500000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1057#1027#1057#8218#1056#176#1057#8230#1056#1109#1056#1030#1056#1109#1056#1110#1056#1109' '#1057#1027#1056#1030#1057#8211#1056#1169#1056#1109#1057#8224#1057#8218#1056#1030#1056#176)
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 34.015770000000000000
          Top = 170.078850000000000000
          Width = 181.417440000000000000
          Height = 188.976500000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1057#1026#1057#8211#1056#183#1056#1030#1056#1105#1057#8240#1056#181' '#1056#8224' '#1056#1119)
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Top = 170.078850000000000000
          Width = 34.015770000000000000
          Height = 188.976500000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1074#8222#8211' '#1056#183'.'#1056#1111'.')
          Rotation = 90
          VAlign = vaCenter
        end
      end
      object Memo1: TfrxMemoView
        Left = 812.598950000000000000
        Width = 211.653680000000000000
        Height = 143.622140000000000000
        Memo.UTF8 = (
          #1056#8212#1056#1030#1056#1109#1057#1026#1056#1109#1057#8218#1056#1029#1056#1105#1056#8470' '#1056#177#1057#8211#1056#1108' '#1056#1169#1056#1109' '#1056#183#1056#176#1057#1039#1056#1030#1056#1105'-'#1057#1026#1056#1109#1056#183#1057#1026#1056#176#1057#8230#1057#1107#1056#1029#1056#1108#1057#1107
          #1056#1169#1056#187#1057#1039' '#1056#1029#1056#176#1056#1169#1056#176#1056#1029#1056#1029#1057#1039' '#1056#1108#1056#1109#1057#8364#1057#8218#1057#8211#1056#1030
          #1056#164#1056#1109#1056#1029#1056#1169#1057#1107' '#1057#1027#1056#1109#1057#8224#1057#8211#1056#176#1056#187#1057#1034#1056#1029#1056#1109#1056#1110#1056#1109' '#1057#1027#1057#8218#1057#1026#1056#176#1057#8230#1057#1107#1056#1030#1056#176#1056#1029#1056#1029#1057#1039
          
            #1056#183' '#1057#8218#1056#1105#1056#1112#1057#8225#1056#176#1057#1027#1056#1109#1056#1030#1056#1109#1057#8212' '#1056#1030#1057#8218#1057#1026#1056#176#1057#8218#1056#1105' '#1056#1111#1057#1026#1056#176#1057#8224#1056#181#1056#183#1056#1169#1056#176#1057#8218#1056#1029#1056#1109#1057#1027#1057#8218#1057 +
            #8211
          
            #1056#1029#1056#176' '#1056#1030#1056#1105#1056#1111#1056#187#1056#176#1057#8218#1057#1107' '#1056#1112#1056#176#1057#8218#1056#181#1057#1026#1057#8211#1056#176#1056#187#1057#1034#1056#1029#1056#1109#1056#1110#1056#1109' '#1056#183#1056#176#1056#177#1056#181#1056#183#1056#1111#1056#181#1057#8225#1056 +
            #181#1056#1029#1056#1029#1057#1039
          #1056#183#1056#176#1057#1027#1057#8218#1057#1026#1056#176#1057#8230#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#1112' '#1056#1109#1057#1027#1056#1109#1056#177#1056#176#1056#1112)
      end
      object PageHeader1: TfrxPageHeader
        Height = 18.897650000000000000
        Top = 400.630180000000000000
        Width = 1046.929810000000000000
        object Memo24: TfrxMemoView
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '1')
        end
        object Memo25: TfrxMemoView
          Left = 34.015770000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '2')
        end
        object Memo26: TfrxMemoView
          Left = 215.433210000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '3')
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 306.141930000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '4')
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 389.291590000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '5')
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 593.386210000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '6')
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 729.449290000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '7')
        end
        object Memo31: TfrxMemoView
          Left = 797.480830000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '8')
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 873.071430000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '9')
        end
        object Memo33: TfrxMemoView
          Left = 960.000620000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '10')
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897637800000000000
        Top = 480.000310000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDatasetRR
        DataSetName = 'frxDBDatasetRR'
        RowCount = 0
        Stretched = True
        object Memo4: TfrxMemoView
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[Line]')
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 34.015770000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'FIO'
          DataSet = frxDBDatasetRR
          DataSetName = 'frxDBDatasetRR'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDatasetRR."FIO"]')
        end
        object Memo6: TfrxMemoView
          Left = 215.433210000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'SWIDSS'
          DataSet = frxDBDatasetRR
          DataSetName = 'frxDBDatasetRR'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDatasetRR."SWIDSS"]')
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 306.141930000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'NOMER_B'
          DataSet = frxDBDatasetRR
          DataSetName = 'frxDBDatasetRR'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          GapX = 5.000000000000000000
          Memo.UTF8 = (
            '[frxDBDatasetRR."NOMER_B"]')
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 389.291590000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'CODEILL'
          DataSet = frxDBDatasetRR
          DataSetName = 'frxDBDatasetRR'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxDBDatasetRR."CODEILL"]')
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 593.386210000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'PERIODILL'
          DataSet = frxDBDatasetRR
          DataSetName = 'frxDBDatasetRR'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frxDBDatasetRR."PERIODILL"]')
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 729.449290000000000000
          Width = 68.031540000000010000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'DAYTOT'
          DataSet = frxDBDatasetRR
          DataSetName = 'frxDBDatasetRR'
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDatasetRR."DAYTOT"]')
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 797.480830000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'DAYSS'
          DataSet = frxDBDatasetRR
          DataSetName = 'frxDBDatasetRR'
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDatasetRR."DAYSS"]')
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 960.000620000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'SUMMASS'
          DataSet = frxDBDatasetRR
          DataSetName = 'frxDBDatasetRR'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDatasetRR."SUMMASS"]')
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 873.071430000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'SUMMATOT'
          DataSet = frxDBDatasetRR
          DataSetName = 'frxDBDatasetRR'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDatasetRR."SUMMATOT"]')
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 128.504020000000000000
        Top = 521.575140000000100000
        Width = 1046.929810000000000000
        object Memo34: TfrxMemoView
          Left = 960.000620000000000000
          Width = 86.929133859999990000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDatasetRR."SUMMASS">,MasterData1)]')
        end
        object Memo41: TfrxMemoView
          Left = 873.071430000000000000
          Width = 86.929133859999990000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDatasetRR."SUMMATOT">,MasterData1)]')
        end
        object Memo42: TfrxMemoView
          Left = 797.480830000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDatasetRR."DAYSS">,MasterData1)]')
        end
        object Memo43: TfrxMemoView
          Left = 729.449290000000000000
          Width = 68.031540000000010000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDatasetRR."DAYTOT">,MasterData1)]')
        end
        object Memo48: TfrxMemoView
          Left = 313.700990000000000000
          Top = 34.015769999999970000
          Width = 684.094930000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            
              #1056#1113#1056#181#1057#1026#1057#8211#1056#1030#1056#1029#1056#1105#1056#1108' '#1056#1111#1057#8211#1056#1169#1056#1111#1057#1026#1056#1105#1057#8221#1056#1112#1057#1027#1057#8218#1056#176' ('#1057#1107#1057#1027#1057#8218#1056#176#1056#1029#1056#1109#1056#1030#1056#1105')______' +
              '__________________________________________________________')
        end
        object Memo49: TfrxMemoView
          Left = 551.811380000000000000
          Top = 52.913419999999970000
          Width = 317.480520000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            
              '('#1056#1111#1057#8211#1056#1169#1056#1111#1056#1105#1057#1027')                          ('#1056#1111#1057#1026#1057#8211#1056#183#1056#1030#1056#1105#1057#8240#1056#181', '#1057#8211#1056#1112#39 +
              #1057#1039', '#1056#1111#1056#1109#1056#177#1056#176#1057#8218#1057#1034#1056#1108#1056#1109#1056#1030#1057#8211')')
        end
        object Memo50: TfrxMemoView
          Left = 313.700990000000000000
          Top = 86.929189999999950000
          Width = 684.094930000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            
              #1056#8220#1056#1109#1056#187#1056#1109#1056#1030#1056#1029#1056#1105#1056#8470' '#1056#177#1057#1107#1057#8230#1056#1110#1056#176#1056#187#1057#8218#1056#181#1057#1026'_____________________________' +
              '___________________________________')
        end
        object Memo51: TfrxMemoView
          Left = 551.811380000000000000
          Top = 105.826840000000000000
          Width = 317.480520000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            
              '('#1056#1111#1057#8211#1056#1169#1056#1111#1056#1105#1057#1027')                          ('#1056#1111#1057#1026#1057#8211#1056#183#1056#1030#1056#1105#1057#8240#1056#181', '#1057#8211#1056#1112#39 +
              #1057#1039', '#1056#1111#1056#1109#1056#177#1056#176#1057#8218#1057#1034#1056#1108#1056#1109#1056#1030#1057#8211')')
        end
        object Memo52: TfrxMemoView
          Left = 7.559060000000000000
          Top = 56.692949999999990000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            '__ _____________ 201_ '#1057#1026#1056#1109#1056#1108#1057#1107)
        end
        object Memo53: TfrxMemoView
          Left = 45.354360000000000000
          Top = 102.047310000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            #1056#1114'.'#1056#1119'.')
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677165350000000000
        Top = 710.551640000000000000
        Width = 1046.929810000000000000
        object Memo44: TfrxMemoView
          Left = 729.449290000000000000
          Top = 3.779530000000022000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDatasetRR."DAYTOT">,MasterData1)]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 797.480314960000000000
          Top = 3.779530000000022000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDatasetRR."DAYSS">,MasterData1)]')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 873.071430000000000000
          Top = 3.779530000000022000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDatasetRR."SUMMATOT">,MasterData1)]')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 960.000620000000000000
          Top = 3.779530000000022000
          Width = 86.929133860000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frxDBDatasetRR."SUMMASS">,MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDatasetRR: TfrxDBDataset
    UserName = 'frxDBDatasetRR'
    CloseDataSource = False
    DataSet = pFIBDataSetRR
    Left = 408
    Top = 56
  end
  object frxTXTExport1: TfrxTXTExport
    UseFileCache = True
    ShowProgress = True
    ScaleWidth = 1.000000000000000000
    ScaleHeight = 1.000000000000000000
    Borders = False
    Pseudogrpahic = False
    PageBreaks = True
    OEMCodepage = False
    EmptyLines = False
    LeadSpaces = False
    PrintAfter = False
    PrinterDialog = True
    UseSavedProps = True
    Left = 280
    Top = 112
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 328
    Top = 112
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    Left = 376
    Top = 112
  end
  object pFIBDataSetRR062012: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select fio,swidss,nomer_b,codeill,datafr,datato,daytot,dayss,sum' +
        'matot,summass from PR_FILL_B_REE_LINE_06_2012(:shifrid) order by' +
        ' fio')
    Transaction = pFIBTransactionRR062012
    Database = FIB.pFIBDatabaseSal
    Left = 288
    Top = 168
    object pFIBDataSetRR062012FIO: TFIBStringField
      FieldName = 'FIO'
      Size = 51
      EmptyStrToNull = True
    end
    object pFIBDataSetRR062012SWIDSS: TFIBStringField
      FieldName = 'SWIDSS'
      Size = 15
      EmptyStrToNull = True
    end
    object pFIBDataSetRR062012NOMER_B: TFIBStringField
      FieldName = 'NOMER_B'
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSetRR062012CODEILL: TFIBIntegerField
      FieldName = 'CODEILL'
    end
    object pFIBDataSetRR062012DATAFR: TFIBStringField
      FieldName = 'DATAFR'
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSetRR062012DATATO: TFIBStringField
      FieldName = 'DATATO'
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSetRR062012DAYTOT: TFIBIntegerField
      FieldName = 'DAYTOT'
    end
    object pFIBDataSetRR062012DAYSS: TFIBIntegerField
      FieldName = 'DAYSS'
    end
    object pFIBDataSetRR062012SUMMATOT: TFIBBCDField
      FieldName = 'SUMMATOT'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRR062012SUMMASS: TFIBBCDField
      FieldName = 'SUMMASS'
      Size = 2
      RoundByScale = True
    end
  end
  object pFIBTransactionRR062012: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 336
    Top = 168
  end
  object dsRRLnr: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select fio,swidss,nomer_b,codeill,datafr,datato,daytot,dayss,sum' +
        'matot,summass from PR_FILL_B_REE_LINE_LNR(:shifrid) order by fio')
    Transaction = pfbtrnsctnRRLnr
    Database = FIB.pFIBDatabaseSal
    Left = 288
    Top = 208
    object dsRRLnrFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 51
      EmptyStrToNull = True
    end
    object dsRRLnrSWIDSS: TFIBStringField
      FieldName = 'SWIDSS'
      Size = 15
      EmptyStrToNull = True
    end
    object dsRRLnrNOMER_B: TFIBStringField
      FieldName = 'NOMER_B'
      Size = 10
      EmptyStrToNull = True
    end
    object dsRRLnrCODEILL: TFIBIntegerField
      FieldName = 'CODEILL'
    end
    object dsRRLnrDATAFR: TFIBStringField
      FieldName = 'DATAFR'
      Size = 10
      EmptyStrToNull = True
    end
    object dsRRLnrDATATO: TFIBStringField
      FieldName = 'DATATO'
      Size = 10
      EmptyStrToNull = True
    end
    object dsRRLnrDAYTOT: TFIBIntegerField
      FieldName = 'DAYTOT'
    end
    object dsRRLnrDAYSS: TFIBIntegerField
      FieldName = 'DAYSS'
    end
    object dsRRLnrSUMMATOT: TFIBBCDField
      FieldName = 'SUMMATOT'
      Size = 2
      RoundByScale = True
    end
    object dsRRLnrSUMMASS: TFIBBCDField
      FieldName = 'SUMMASS'
      Size = 2
      RoundByScale = True
    end
  end
  object pfbtrnsctnRRLnr: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 336
    Top = 208
  end
end
