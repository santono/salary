object FormSBSSpr: TFormSBSSpr
  Left = 321
  Top = 109
  Width = 696
  Height = 492
  Caption = #1057#1087#1088#1072#1074#1082#1080' '#1085#1072' '#1089#1091#1073#1089#1080#1076#1080#1102
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
    454)
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridSBS: TdxDBGrid
    Left = 16
    Top = 8
    Width = 665
    Height = 413
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    SummaryGroups = <>
    SummarySeparator = ', '
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnDblClick = dxDBGridSBSDblClick
    DataSource = DataSourceSBS
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridSBSTABNO: TdxDBGridMaskColumn
      Caption = #1058'.'#1085'.'
      Width = 36
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
    end
    object dxDBGridSBSSHIFRID: TdxDBGridMaskColumn
      Visible = False
      Width = 138
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGridSBSNAL_CODE: TdxDBGridMaskColumn
      Caption = #1048#1076'.'#1082#1086#1076
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAL_CODE'
    end
    object dxDBGridSBSFIO: TdxDBGridMaskColumn
      Caption = #1060#1048#1054
      HeaderAlignment = taCenter
      Width = 258
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
    object dxDBGridSBSMONTH_VY: TdxDBGridMaskColumn
      Caption = #1052#1094
      Width = 35
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MONTH_VY'
    end
    object dxDBGridSBSYEAR_VY: TdxDBGridMaskColumn
      Caption = #1043#1086#1076
      Width = 50
      BandIndex = 0
      RowIndex = 0
      FieldName = 'YEAR_VY'
    end
    object dxDBGridSBSMODE_VY_ZA: TdxDBGridMaskColumn
      Visible = False
      Width = 52
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MODE_VY_ZA'
    end
    object dxDBGridSBSSUMMA_TOT: TdxDBGridCurrencyColumn
      Caption = #1057#1091#1084#1084#1072
      HeaderAlignment = taCenter
      Width = 79
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMA_TOT'
      DisplayFormat = ',0.00;-,0.00'
      Nullable = False
    end
    object dxDBGridSBSSHIFRWRK: TdxDBGridMaskColumn
      Visible = False
      Width = 37
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRWRK'
    end
    object dxDBGridSBSBUH_NAME: TdxDBGridMaskColumn
      Caption = #1041#1091#1093#1075#1072#1083#1090#1077#1088
      Sorted = csUp
      Width = 129
      BandIndex = 0
      RowIndex = 0
      FieldName = 'BUH_NAME'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 420
    Width = 234
    Height = 25
    DataSource = DataSourceSBS
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object DataSourceSBS: TDataSource
    DataSet = pFIBDataSetSBS
    Left = 176
    Top = 24
  end
  object pFIBTransactionRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 136
    Top = 24
  end
  object pFIBDataSetSBS: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TB_SPRSBSTABLE'
      'SET '
      ' TABNO = :TABNO,'
      ' NAL_CODE = :NAL_CODE,'
      ' FIO = :FIO,'
      ' MONTH_VY = :MONTH_VY,'
      ' YEAR_VY = :YEAR_VY,'
      ' MODE_VY_ZA = :MODE_VY_ZA,'
      ' BUH_NAME = :BUH_NAME,'
      ' SUMMA_TOT = :SUMMA_TOT,'
      ' SHIFRWRK = :SHIFRWRK'
      'WHERE'
      ' SHIFRID = :OLD_SHIFRID'
      ' ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_SPRSBSTABLE'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO TB_SPRSBSTABLE('
      ' TABNO,'
      ' SHIFRID,'
      ' NAL_CODE,'
      ' FIO,'
      ' MONTH_VY,'
      ' YEAR_VY,'
      ' MODE_VY_ZA,'
      ' BUH_NAME,'
      ' SUMMA_TOT,'
      ' SHIFRWRK'
      ')'
      'VALUES('
      ' :TABNO,'
      ' :SHIFRID,'
      ' :NAL_CODE,'
      ' :FIO,'
      ' :MONTH_VY,'
      ' :YEAR_VY,'
      ' :MODE_VY_ZA,'
      ' :BUH_NAME,'
      ' :SUMMA_TOT,'
      ' :SHIFRWRK'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      ' TABNO,'
      ' SHIFRID,'
      ' NAL_CODE,'
      ' FIO,'
      ' MONTH_VY,'
      ' YEAR_VY,'
      ' MODE_VY_ZA,'
      ' BUH_NAME,'
      ' SUMMA_TOT,'
      ' SHIFRWRK'
      'FROM'
      ' TB_SPRSBSTABLE'
      ''
      ' WHERE '
      '  TB_SPRSBSTABLE.SHIFRID = :OLD_SHIFRID'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' TABNO,'
      ' SHIFRID,'
      ' NAL_CODE,'
      ' FIO,'
      ' MONTH_VY,'
      ' YEAR_VY,'
      ' MODE_VY_ZA,'
      ' BUH_NAME,'
      ' SUMMA_TOT,'
      ' SHIFRWRK'
      'FROM'
      ' TB_SPRSBSTABLE'
      'ORDER BY YEAR_VY,MONTH_VY')
    AllowedUpdateKinds = [ukModify, ukDelete]
    Transaction = pFIBTransactionRead
    UpdateTransaction = pFIBTransactionWrite
    Left = 56
    Top = 24
    object pFIBDataSetSBSTABNO: TFIBSmallIntField
      FieldName = 'TABNO'
    end
    object pFIBDataSetSBSSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object pFIBDataSetSBSNAL_CODE: TFIBStringField
      FieldName = 'NAL_CODE'
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSetSBSFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 150
      EmptyStrToNull = True
    end
    object pFIBDataSetSBSMONTH_VY: TFIBSmallIntField
      FieldName = 'MONTH_VY'
    end
    object pFIBDataSetSBSYEAR_VY: TFIBSmallIntField
      FieldName = 'YEAR_VY'
    end
    object pFIBDataSetSBSMODE_VY_ZA: TFIBSmallIntField
      FieldName = 'MODE_VY_ZA'
    end
    object pFIBDataSetSBSBUH_NAME: TFIBStringField
      FieldName = 'BUH_NAME'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSetSBSSUMMA_TOT: TFIBBCDField
      FieldName = 'SUMMA_TOT'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetSBSSHIFRWRK: TFIBSmallIntField
      FieldName = 'SHIFRWRK'
    end
  end
  object pFIBTransactionWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 96
    Top = 24
  end
  object PopupMenu1: TPopupMenu
    Left = 160
    Top = 136
    object N1: TMenuItem
      Caption = #1053#1086#1074#1072#1103' '#1089#1087#1088#1072#1074#1082#1072
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1042#1099#1073#1086#1088
    end
    object N3: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #1056#1072#1089#1096#1080#1092#1088#1086#1074#1082#1072
      OnClick = N4Click
    end
  end
  object frxReport1: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40444.449353402800000000
    ReportOptions.LastChange = 43034.664577812500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure MemoSVDNOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '     if <SVDN>='#39'1'#39' then'
      '        MemoSVDN.Visible:=true'
      '     else'
      
        '        MemoSVDN.Visible:=false;                                ' +
        '                                        '
      'end;'
      ''
      'procedure MemoLNROnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   if <SVDN>='#39'1'#39' then'
      '        MemoLNR.Visible:=false'
      '     else'
      '        MemoLNR.Visible:=true;  '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    Left = 208
    Top = 136
    Datasets = <
      item
        DataSet = frxDBDatasetSBS
        DataSetName = 'frxDBDatasetSBS'
      end>
    Variables = <
      item
        Name = ' H'
        Value = Null
      end
      item
        Name = 'FIO'
        Value = Null
      end
      item
        Name = 'NAME_W_R'
        Value = Null
      end
      item
        Name = 'DOLGNAME'
        Value = Null
      end
      item
        Name = 'INN'
        Value = Null
      end
      item
        Name = ' f'
        Value = Null
      end
      item
        Name = 'prop1'
        Value = Null
      end
      item
        Name = 'prop2'
        Value = Null
      end
      item
        Name = 'period'
        Value = Null
      end
      item
        Name = 'summatot'
        Value = Null
      end
      item
        Name = 'prorektor'
        Value = Null
      end
      item
        Name = 'glbuh'
        Value = Null
      end
      item
        Name = 'buhname'
        Value = Null
      end
      item
        Name = 'DolgRektor'
        Value = ''
      end
      item
        Name = ' Mode'
        Value = Null
      end
      item
        Name = 'SVDN'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 30.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 30.000000000000000000
      BottomMargin = 10.000000000000000000
      ColumnWidth = 190.000000000000000000
      object Footer1: TfrxFooter
        Height = 340.157700000000000000
        Top = 529.134200000000000000
        Width = 642.520100000000000000
        object Memo22: TfrxMemoView
          Top = 18.897637800000000000
          Width = 120.944960000000000000
          Height = 34.015770000000000000
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1057#1027#1057#1034#1056#1109#1056#1110#1056#1109' '#1057#1027#1057#1107#1056#1112#1056#1112#1056#176
            #1056#1111#1057#1026#1056#1109#1056#1111#1056#1105#1057#1027#1056#1109#1056#1112)
        end
        object Memo23: TfrxMemoView
          Left = 120.944960000000000000
          Top = 18.897637795275600000
          Width = 385.512060000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftRight, ftBottom]
          Memo.UTF8 = (
            '[prop1]'
            '[prop2] ')
        end
        object Memo24: TfrxMemoView
          Left = 3.779530000000000000
          Top = 56.692950000000000000
          Width = 506.457020000000000000
          Height = 41.574830000000000000
          Memo.UTF8 = (
            
              #1056#1119#1057#1026#1056#1105#1056#1112#1057#8211#1057#8218#1056#1108#1056#176': '#1056#183#1056#176' '#1056#1030#1056#1105#1056#1029#1057#1039#1057#8218#1056#1108#1056#1109#1056#1112' '#1057#8224#1057#8211#1056#187#1057#1034#1056#1109#1056#1030#1056#1109#1057#8212' '#1056#1109#1056#1169#1056#1029#1056 +
              #1109#1057#1026#1056#176#1056#183#1056#1109#1056#1030#1056#1109#1057#8212' '#1056#1169#1056#1109#1056#1111#1056#1109#1056#1112#1056#1109#1056#1110#1056#1105', '#1057#8240#1056#1109' '#1056#1029#1056#181' '#1056#1111#1057#8211#1056#1169#1056#187#1057#1039#1056#1110#1056#176#1057#8221' '#1056#1109#1056 +
              #1111#1056#1109#1056#1169#1056#176#1057#8218#1056#1108#1057#1107#1056#1030#1056#176#1056#1029#1056#1029#1057#1035' ')
        end
        object Memo25: TfrxMemoView
          Left = 3.779530000000000000
          Top = 90.708720000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1110#1056#176#1056#187#1057#1034#1056#1029#1056#176' '#1057#1027#1057#1107#1056#1112#1056#176' '#1056#183#1056#176' '#1056#1111#1056#181#1057#1026#1057#8211#1056#1109#1056#1169' ')
        end
        object Memo26: TfrxMemoView
          Left = 162.519790000000000000
          Top = 90.708720000000000000
          Width = 347.716760000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[period]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 3.779530000000000000
          Top = 117.165430000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            #1056#183#1056#176' '#1056#1030#1056#1105#1056#1029#1057#1039#1057#8218#1056#1108#1056#1109#1056#1112' '#1056#176#1056#187#1057#8211#1056#1112#1056#181#1056#1029#1057#8218#1057#8211#1056#1030' '#1057#1027#1057#8218#1056#176#1056#1029#1056#1109#1056#1030#1056#1105#1057#8218#1057#1034' ')
        end
        object Memo28: TfrxMemoView
          Left = 215.433210000000000000
          Top = 117.165430000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            ' [summatot]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 347.716760000000000000
          Top = 117.165430000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            #1056#1110#1057#1026#1056#1105#1056#1030#1056#181#1056#1029#1057#1034)
        end
        object Memo30: TfrxMemoView
          Left = 151.181200000000000000
          Top = 188.976500000000000000
          Width = 75.590600000000000000
          Height = 79.370130000000000000
          DisplayFormat.DecimalSeparator = ','
          Memo.UTF8 = (
            #1056#8220#1056#1109#1056#187#1056#1109#1056#1030#1056#1029#1056#1105#1056#8470
            #1056#177#1057#1107#1057#8230#1056#1110#1056#176#1056#187#1057#8218#1056#181#1057#1026' '
            ''
            ''
            #1056#8216#1057#1107#1057#8230#1056#1110#1056#176#1056#187#1057#8218#1056#181#1057#1026' ')
        end
        object Memo31: TfrxMemoView
          Left = 313.700990000000000000
          Top = 154.960730000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8 = (
            '[prorektor]')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 313.700990000000000000
          Top = 200.315090000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8 = (
            '[glbuh]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 22.677180000000000000
          Top = 166.299320000000000000
          Width = 94.488250000000000000
          Height = 75.590600000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            ''
            ''
            #1056#1114' '#1056#1119)
        end
        object Memo34: TfrxMemoView
          Left = 313.700990000000000000
          Top = 245.669450000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8 = (
            '[buhname]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 230.551330000000000000
          Top = 264.566929133858000000
          Width = 71.811070000000000000
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Left = 230.551330000000000000
          Top = 219.212598430000000000
          Width = 71.811070000000000000
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          Left = 230.551330000000000000
          Top = 173.858380000000000000
          Width = 71.811070000000000000
          Frame.Typ = [ftTop]
        end
        object Memo35: TfrxMemoView
          Left = 249.448980000000000000
          Top = 219.212740000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8 = (
            #1056#1111#1057#8211#1056#1169#1056#1111#1056#1105#1057#1027)
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 245.669450000000000000
          Top = 173.858380000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8 = (
            #1056#1111#1057#8211#1056#1169#1056#1111#1056#1105#1057#1027)
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 253.228510000000000000
          Top = 264.567100000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8 = (
            #1056#1111#1057#8211#1056#1169#1056#1111#1056#1105#1057#1027)
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 120.944960000000000000
          Width = 128.503937010000000000
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
            '[SUM(<frxDBDatasetSBS."SUMMA">,MasterData1) #n%2,2f]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 377.953000000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[SUM(<frxDBDatasetSBS."SUMMA_ALIM">,MasterData1) #n%2,2f]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8217#1057#1027#1057#1034#1056#1109#1056#1110#1056#1109)
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 249.448980000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            ' ')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 132.283550000000000000
          Top = 158.740260000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[DolgRektor]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897637795275600000
        Top = 487.559370000000000000
        Width = 642.520100000000000000
        DataSet = frxDBDatasetSBS
        DataSetName = 'frxDBDatasetSBS'
        RowCount = 0
        object Memo18: TfrxMemoView
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Memo.UTF8 = (
            '[frxDBDatasetSBS."Y_M"]')
        end
        object Memo19: TfrxMemoView
          Left = 120.944960000000000000
          Width = 128.503937010000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[frxDBDatasetSBS."SUMMA" #n%2.2f]')
        end
        object Memo20: TfrxMemoView
          Left = 249.448980000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftBottom]
          Memo.UTF8 = (
            ' ')
        end
        object Memo21: TfrxMemoView
          Left = 377.953000000000000000
          Width = 128.503937010000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.UTF8 = (
            '[frxDBDatasetSBS."SUMMA_ALIM" #n%2.2f]')
        end
      end
      object Header1: TfrxHeader
        Height = 445.984251970000000000
        Top = 18.897650000000000000
        Width = 642.520100000000000000
        object MemoLNR: TfrxMemoView
          Left = 3.779530000000000000
          Width = 491.338900000000000000
          Height = 98.267780000000000000
          Visible = False
          OnBeforePrint = 'MemoLNROnBeforePrint'
          AllowHTMLTags = True
          Memo.UTF8 = (
            
              #1056#174#1057#1026#1056#1105#1056#1169#1056#1105#1057#8225#1056#1029#1056#176' '#1056#176#1056#1169#1057#1026#1056#181#1057#1027#1056#176': <BIG><B><i>'#1056#1108#1056#1030'. '#1056#1114#1056#1109#1056#187#1056#1109#1056#1169#1057#8211#1056#182#1056#1029 +
              #1056#1105#1056#8470', 20'#1056#176'</I></B>'
            #1056#1111#1057#8211#1056#1169#1056#1111#1057#1026#1056#1105#1057#8221#1056#1112#1057#1027#1057#8218#1056#1030#1056#176
            #1074#8222#8211' '#1057#8218#1056#181#1056#187#1056#181#1057#8222#1056#1109#1056#1029#1057#8211#1056#1030'          <BIG><B><I>41-71-32</I></B>'
            #1056#1113#1056#1109#1056#1169' '#1056#1115#1056#1113#1056#1119#1056#1115'             <BIG><B><I>02070714</I></B>'
            
              #1056#8221#1056#1119#1056#1106' '#1057#1026#1056#176#1056#8470#1056#1109#1056#1029#1057#1107'           <BIG><B><I>'#1056#1112#1057#8211#1057#1027#1057#1034#1056#1108#1056#176' '#1056#1029#1056#176#1056#187#1056#1109#1056#1110 +
              #1056#1109#1056#1030#1056#176' '#1057#8211#1056#1029#1057#1027#1056#1111#1056#181#1056#1108#1057#8224#1057#8211#1057#1039'</I></B>')
        end
        object Memo2: TfrxMemoView
          Left = 204.094620000000000000
          Top = 132.283550000000000000
          Width = 200.315090000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#1030#1057#8211#1056#1169#1056#1108#1056#176' '#1056#1111#1057#1026#1056#1109' '#1056#1169#1056#1109#1057#8230#1056#1109#1056#1169#1056#1105)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 7.559060000000000000
          Top = 170.078850000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            #1056#1030#1056#1105#1056#1169#1056#176#1056#1029#1056#176' '#1056#1110#1057#1026'.')
        end
        object Memo4: TfrxMemoView
          Left = 3.779530000000000000
          Top = 200.315090000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            
              #1056#1030' '#1057#8218#1056#1109#1056#1112#1057#1107', '#1057#8240#1056#1109' '#1056#1030#1057#8211#1056#1029' ('#1056#1030#1056#1109#1056#1029#1056#176')  '#1056#1169#1057#8211#1056#8470#1057#1027#1056#1029#1056#1109' '#1056#1111#1057#1026#1056#176#1057#8224#1057#1035#1057#8221' '#1057 +
              #1107)
        end
        object Memo5: TfrxMemoView
          Left = 3.779530000000000000
          Top = 226.771800000000000000
          Width = 559.370440000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8 = (
            
              #1056#1038#1057#8230#1057#8211#1056#1169#1056#1029#1056#1109#1057#1107#1056#1108#1057#1026#1056#176#1057#8212#1056#1029#1057#1027#1057#1034#1056#1108#1056#1109#1056#1112#1057#1107' '#1056#1029#1056#176#1057#8224#1057#8211#1056#1109#1056#1029#1056#176#1056#187#1057#1034#1056#1029#1056#1109#1056#1112#1057#1107' ' +
              #1057#1107#1056#1029#1057#8211#1056#1030#1056#181#1057#1026#1057#1027#1056#1105#1057#8218#1056#181#1057#8218#1057#8211' '#1057#8211#1056#1112#1056#181#1056#1029#1057#8211' '#1056#8217#1056#1109#1056#187#1056#1109#1056#1169#1056#1105#1056#1112#1056#1105#1057#1026#1056#176' '#1056#8221#1056#176#1056#187#1057 +
              #1039)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 3.779530000000000000
          Top = 260.787570000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            #1056#164#1056#1109#1057#1026#1056#1112#1056#176' '#1056#1111#1057#1026#1056#176#1057#8224#1056#181#1056#1030#1056#187#1056#176#1057#8364#1057#8218#1057#1107#1056#1030#1056#176#1056#1029#1056#1029#1057#1039' ')
        end
        object Memo7: TfrxMemoView
          Top = 283.464750000000000000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            
              '('#1056#183#1056#176#1056#183#1056#1029#1056#176#1057#8225#1056#1105#1057#8218#1056#1105' '#1056#1109#1057#1027#1056#1029#1056#1109#1056#1030#1056#1029#1056#181', '#1056#183#1056#176' '#1057#1027#1057#1107#1056#1112#1057#8211#1056#1029#1056#1105#1057#8224#1057#8218#1056#1030#1056#1109#1056#1112' ' +
              #1057#8225#1056#1105' '#1057#8211#1056#1029#1057#8364#1056#181')')
        end
        object Memo8: TfrxMemoView
          Top = 306.141930000000000000
          Width = 102.047310000000000000
          Height = 22.677180000000000000
          Memo.UTF8 = (
            #1056#183#1056#176#1056#8470#1056#1112#1056#176#1057#8221' '#1056#1111#1056#1109#1057#1027#1056#176#1056#1169#1057#1107)
        end
        object Memo9: TfrxMemoView
          Top = 332.598640000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            
              #1056#8224#1056#1029#1056#1169#1057#8211#1056#1030#1057#8211#1056#1169#1057#1107#1056#176#1056#187#1057#1034#1056#1029#1056#1105#1056#8470' '#1057#8211#1056#1169#1056#181#1056#1029#1057#8218#1057#8211#1057#8222#1057#8211#1056#1108#1056#176#1057#8224#1057#8211#1056#8470#1056#1029#1056#1105#1056#8470' '#1056#1029 +
              #1056#1109#1056#1112#1056#181#1057#1026)
        end
        object Memo10: TfrxMemoView
          Top = 359.055350000000000000
          Width = 120.944960000000000000
          Height = 86.929190000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '   '#1057#1026#1057#8211#1056#1108'          '#1056#1112#1057#8211#1057#1027#1057#1039#1057#8224#1057#1034)
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 120.944960000000000000
          Top = 359.055350000000000000
          Width = 128.504020000000000000
          Height = 86.929190000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#176#1057#1026#1056#176#1057#8230#1056#1109#1056#1030#1056#176#1056#1029#1056#176' '
            #1056#183#1056#176#1057#1026#1056#1109#1056#177#1057#8211#1057#8218#1056#1029#1056#176' '#1056#1111#1056#187#1056#176#1057#8218#1056#176
            #1057#1107' '#1057#8218'.'#1057#8225'. '#1056#1030' '#1056#1029#1056#176#1057#8218#1057#1107#1057#1026#1056#176#1056#187#1057#1034#1056#1029#1057#8211#1056#8470
            #1057#8222#1056#1109#1057#1026#1056#1112#1057#8211
            '('#1056#1110#1057#1026#1056#1105#1056#1030#1056#181#1056#1029#1057#1034')')
        end
        object Memo12: TfrxMemoView
          Left = 249.448980000000000000
          Top = 359.055350000000000000
          Width = 128.504020000000000000
          Height = 86.929190000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8224#1056#1029#1057#8364#1057#8211
            #1056#1029#1056#176#1057#1026#1056#176#1057#8230#1057#1107#1056#1030#1056#176#1056#1029#1056#1029#1057#1039
            #1057#1107' '#1057#8218'.'#1057#8225'. '#1056#1030' '#1056#1029#1056#176#1057#8218#1057#1107#1057#1026#1056#176#1056#187#1057#1034#1056#1029#1057#8211#1056#8470
            #1057#8222#1056#1109#1057#1026#1056#1112#1057#8211
            '('#1056#1110#1057#1026#1056#1105#1056#1030#1056#181#1056#1029#1057#1034')')
        end
        object Memo13: TfrxMemoView
          Left = 377.953000000000000000
          Top = 359.055350000000000000
          Width = 128.503937010000000000
          Height = 86.929190000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#1111#1056#187#1056#176#1057#8225#1056#181#1056#1029#1057#8211
            #1056#176#1056#187#1057#8211#1056#1112#1056#181#1056#1029#1057#8218#1056#1105
            '('#1056#1110#1057#1026#1056#1105#1056#1030#1056#181#1056#1029#1057#1034')')
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 75.590600000000000000
          Top = 170.078850000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.UTF8 = (
            '[FIO]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 181.417440000000000000
          Top = 260.787570000000000000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.UTF8 = (
            '[NAME_W_R]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 102.047310000000000000
          Top = 306.141930000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.UTF8 = (
            '[DOLGNAME]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 241.889920000000000000
          Top = 332.598640000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.UTF8 = (
            '[INN]')
          ParentFont = False
        end
        object MemoSVDN: TfrxMemoView
          Width = 313.700990000000000000
          Height = 132.283550000000000000
          Visible = False
          OnBeforePrint = 'MemoSVDNOnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            
              #1056#1114#1057#8211#1056#1029#1057#8211#1057#1027#1057#8218#1056#181#1057#1026#1057#1027#1057#8218#1056#1030#1056#1109' '#1056#1109#1057#1027#1056#1030#1057#8211#1057#8218#1056#1105' '#1057#8211' '#1056#1029#1056#176#1057#1107#1056#1108#1056#1105' '#1056#1032#1056#1108#1057#1026#1056#176#1057#8212#1056#1029 +
              #1056#1105
            
              #1056#1038#1057#8230#1057#8211#1056#1169#1056#1029#1056#1109#1057#1107#1056#1108#1057#1026#1056#176#1057#8212#1056#1029#1057#1027#1057#1034#1056#1108#1056#1105#1056#8470' '#1056#1029#1056#176#1057#8224#1057#8211#1056#1109#1056#1029#1056#176#1056#187#1057#1034#1056#1029#1056#1105#1056#8470' '#1057#1107#1056#1029 +
              #1057#8211#1056#1030#1056#181#1057#1026#1057#1027#1056#1105#1057#8218#1056#181#1057#8218
            #1057#8211#1056#1112#1056#181#1056#1029#1057#8211' '#1056#8217#1056#1109#1056#187#1056#1109#1056#1169#1056#1105#1056#1112#1056#1105#1057#1026#1056#176' '#1056#8221#1056#176#1056#187#1057#1039
            
              #1056#176#1056#1108#1057#1026#1056#181#1056#1169#1056#1105#1057#8218#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#8470' '#1056#183#1056#176' '#1057#1027#1057#8218#1056#176#1057#8218#1057#1107#1057#1027#1056#1109#1056#1112' '#1056#1030#1056#1105#1057#8240#1056#1109#1056#1110#1056#1109' '#1056#183 +
              #1056#176#1056#1108#1056#187#1056#176#1056#1169#1057#1107' '#1056#1109#1057#1027#1056#1030#1057#8211#1057#8218#1056#1105' IV ('#1057#8225#1056#181#1057#8218#1056#1030#1056#181#1057#1026#1057#8218#1056#1109#1056#1110#1056#1109')'
            
              #1057#1026#1057#8211#1056#1030#1056#1029#1057#1039' '#1056#1030#1057#8211#1056#1169#1056#1111#1056#1109#1056#1030#1057#8211#1056#1169#1056#1029#1056#1109' '#1056#1169#1056#1109' '#1057#1026#1057#8211#1057#8364#1056#181#1056#1029#1056#1029#1057#1039' '#1056#8221#1056#1106#1056#1113' '#1056#1030#1057#8211#1056 +
              #1169' 20 '#1056#1110#1057#1026#1057#1107#1056#1169#1056#1029#1057#1039' 2005 '#1057#1026#1056#1109#1056#1108#1057#1107
            '('#1056#1111#1057#1026#1056#1109#1057#8218#1056#1109#1056#1108#1056#1109#1056#187' '#1074#8222#8211' 58)'
            
              '                 93400, '#1056#8250#1057#1107#1056#1110#1056#176#1056#1029#1057#1027#1057#1034#1056#1108#1056#176' '#1056#1109#1056#177#1056#187'., '#1056#1112'. '#1056#1038#1057#8221#1056#1030#1057#8221 +
              #1057#1026#1056#1109#1056#1169#1056#1109#1056#1029#1056#181#1057#8224#1057#1034#1056#1108','
            
              '                 '#1056#1111#1057#1026#1056#1109#1057#1027#1056#1111'. '#1056#166#1056#181#1056#1029#1057#8218#1057#1026#1056#176#1056#187#1057#1034#1056#1029#1056#1105#1056#8470', 59-'#1056#176', '#1056#1038#1056#1116 +
              #1056#1032' '#1057#8211#1056#1112'. '#1056#8217'. '#1056#8221#1056#176#1056#187#1057#1039','
            '          e-mail: uni.snu.edu@gmail.com; '#1057#8218#1056#181#1056#187'. (06452) 4-03-42'
            #1042#171'___'#1042#187' ___________ 2017 '#1057#1026'.'#9'      '#1074#8222#8211'______')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDatasetSBS: TfrxDBDataset
    UserName = 'frxDBDatasetSBS'
    CloseDataSource = False
    DataSet = pFIBDataSetSBSPrt
    Left = 248
    Top = 136
  end
  object pFIBDataSetSBSPrt: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' SHIFRIDOWNER,'
      ' YEAR_ZA,'
      ' MONTH_ZA,'
      ' SUMMA,'
      ' SUMMA_ZARPL,'
      ' SUMMA_VNE,'
      ' SUMMA_ALIM'
      'FROM'
      ' TB_SPRSBSPRTABLE '
      'where'
      ' shifridowner=:shifridsbs'
      'order by year_za,month_za')
    OnCalcFields = pFIBDataSetSBSPrtCalcFields
    AllowedUpdateKinds = []
    Transaction = pFIBTransactionSbsPrt
    Database = FIB.pFIBDatabaseSal
    Left = 296
    Top = 136
    object pFIBDataSetSBSPrtSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetSBSPrtSUMMA_ALIM: TFIBBCDField
      FieldName = 'SUMMA_ALIM'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetSBSPrtYEAR_ZA: TFIBSmallIntField
      DefaultExpression = '0'
      FieldName = 'YEAR_ZA'
    end
    object pFIBDataSetSBSPrtMONTH_ZA: TFIBSmallIntField
      DefaultExpression = '0'
      FieldName = 'MONTH_ZA'
    end
    object pFIBDataSetSBSPrtY_M: TStringField
      FieldKind = fkCalculated
      FieldName = 'Y_M'
      Size = 15
      Calculated = True
    end
  end
  object pFIBTransactionSbsPrt: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 336
    Top = 136
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    Left = 384
    Top = 136
  end
  object pFIBQuerySBS: TpFIBQuery
    Transaction = pFIBTransactionSBS
    Database = FIB.pFIBDatabaseSal
    Left = 208
    Top = 88
  end
  object pFIBTransactionSBS: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 240
    Top = 88
  end
end
