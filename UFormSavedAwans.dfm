object FormSavedAwans: TFormSavedAwans
  Left = 209
  Top = 111
  Width = 696
  Height = 530
  Caption = #1047#1072#1092#1080#1082#1089#1080#1088#1086#1074#1072#1085#1085#1099#1081' '#1072#1074#1072#1085#1089
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    680
    492)
  PixelsPerInch = 96
  TextHeight = 13
  object dxDBGridAwans: TdxDBGrid
    Left = 8
    Top = 32
    Width = 665
    Height = 424
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = dsoAwans
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridAwansSHIFRID: TdxDBGridMaskColumn
      Visible = False
      Width = 210
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGridAwansNAME: TdxDBGridMaskColumn
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      HeaderAlignment = taCenter
      Width = 494
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
    object dxDBGridAwansYEARVY: TdxDBGridMaskColumn
      Caption = #1043#1086#1076
      HeaderAlignment = taCenter
      Width = 82
      BandIndex = 0
      RowIndex = 0
      FieldName = 'YEARVY'
    end
    object dxDBGridAwansMONTHVY: TdxDBGridMaskColumn
      Caption = #1052'-'#1094
      HeaderAlignment = taCenter
      Width = 85
      BandIndex = 0
      RowIndex = 0
      FieldName = 'MONTHVY'
    end
    object dxDBGridAwansDATESA: TdxDBGridDateColumn
      Visible = False
      Width = 210
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATESA'
    end
    object dxDBGridAwansSHIFRWRK: TdxDBGridMaskColumn
      Visible = False
      Width = 210
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRWRK'
    end
    object dxDBGridAwansDATEWRK: TdxDBGridDateColumn
      Visible = False
      Width = 210
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATEWRK'
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 680
    Height = 29
    Caption = 'ToolBar1'
    Images = ImageList1
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1090#1077#1082#1091#1097#1080#1077' '#1074#1099#1087#1083#1072#1090#1099' '#1074' '#1041#1044
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton1Click
    end
    object ToolButton2: TToolButton
      Left = 23
      Top = 2
      Hint = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1087#1088#1086#1074#1077#1088#1082#1091'  '#1091#1082#1072#1079#1072#1085#1085#1086#1081' '#1089#1090#1088#1086#1082#1080
      Caption = 'ToolButton2'
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton2Click
    end
    object ToolButton3: TToolButton
      Left = 46
      Top = 2
      Hint = #1057#1074#1086#1076' '#1087#1086' '#1091#1082#1072#1079#1072#1085#1085#1086#1081' '#1089#1090#1088#1086#1082#1077
      Caption = 'ToolButton3'
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton3Click
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 463
    Width = 240
    Height = 25
    DataSource = dsoAwans
    Anchors = [akLeft, akBottom]
    TabOrder = 2
  end
  object dsoAwans: TDataSource
    DataSet = dsAwans
    Left = 600
    Top = 48
  end
  object dsAwans: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      ' TB_SAVED_AWANS_HAT'
      'WHERE'
      '  SHIFRID = :OLD_SHIFRID'
      ' ')
    RefreshSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' NAME,'
      ' YEARVY,'
      ' MONTHVY,'
      ' DATESA,'
      ' SHIFRWRK,'
      ' DATEWRK'
      'FROM'
      ' TB_SAVED_AWANS_HAT '
      'WHERE(  YEARVY=:Y AND MONTHVY=:M'
      '  ) and (  TB_SAVED_AWANS_HAT.SHIFRID = :OLD_SHIFRID'
      '  )'
      ' ')
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRID,'
      ' NAME,'
      ' YEARVY,'
      ' MONTHVY,'
      ' DATESA,'
      ' SHIFRWRK,'
      ' DATEWRK'
      'FROM'
      ' TB_SAVED_AWANS_HAT '
      'WHERE YEARVY=:Y AND MONTHVY=:M')
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    UpdateTransaction = trWrite
    Left = 504
    Top = 48
    object dsAwansSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
    end
    object dsAwansNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 256
      EmptyStrToNull = True
    end
    object dsAwansYEARVY: TFIBIntegerField
      FieldName = 'YEARVY'
    end
    object dsAwansMONTHVY: TFIBIntegerField
      FieldName = 'MONTHVY'
    end
    object dsAwansDATESA: TFIBDateField
      FieldName = 'DATESA'
    end
    object dsAwansSHIFRWRK: TFIBIntegerField
      FieldName = 'SHIFRWRK'
    end
    object dsAwansDATEWRK: TFIBDateField
      FieldName = 'DATEWRK'
    end
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 536
    Top = 48
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 568
    Top = 48
  end
  object ImageList1: TImageList
    Left = 104
    Top = 216
    Bitmap = {
      494C010104000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
      00000000000008621B950C9228DE0FAE31FF0FAE31FF0C9228DE08621B950000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C0000000000000000000000000000EA3
      2AFF1DC945FF1FCF4CFF1ECE4BFF1ECD4BFF1ECD4BFF1ECE4BFF1FCF4CFF1DC9
      45FF0EA32AFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B9B9B9FFB9B9
      B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9
      B9FFB9B9B9FF000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000000000008080800000000000808080008080
      8000C0C0C0000000000000000000C0C0C0000000000000000000076818AB1FD1
      50FF1FCF50FF1ECE4FFF20D152FF20D354FF20D354FF20D152FF1ECE4FFF1FCF
      50FF1FD150FF076818AB00000000000000000000000000000000000000000000
      0000000000000D301138296A2F6F000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B9B9
      B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9
      B9FFB9B9B9FF000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000000000008080800000000000808080008080
      8000C0C0C0000000000000000000C0C0C000000000000D9922FF1FD150FF1ECD
      4FFF1ECD4FFF19D04EFF4AA451FFFFFFFFFFFFFFFFFF4AA451FF19D04EFF1ECD
      4FFF1ECD4FFF1FD150FF0D9922FF000000000000000000000000000000000000
      000007280A365CD965FF8FFF9AFF4D7452740000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005050
      506FB9B9B9FFB9B9B9FF00000000000000000000000000000000000000000000
      0000B9B9B9FF000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C0000000000019C748FF1ECF52FF1DCD
      50FF1DCD50FF17D04EFF45A44DFFFFFFFFFFFFFFFFFF45A44DFF17D04EFF1DCD
      50FF1DCD50FF1ECF52FF19C748FF000000000000000000000000000000000122
      043552C759FF5CFC6BFF63FF72FF6DFF7BFF276D2E7300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B9B9B9FFB9B9B9FF0A0A0A0F000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000C0C0C000054F0D951CD058FF1CCF57FF16D1
      55FF16D054FF0FD453FF41A84CFFFFFFFFFFFFFFFFFF41A84CFF0FD453FF16D0
      54FF16D155FF1CCF57FF1CD058FF054F0D950000000000000000001C033755BF
      5EFF45E454FF88F191FF81F38CFF54F363FF55F665FF1A622175000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B9B9B9FFB9B9B9FF000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000C0C0C00006700BDE17CD53FF1DD15AFF50AE
      5BFF47AB54FF42AA51FF80BC80FFFFFFFFFFFFFFFFFF80BC80FF42AA51FF47AB
      54FF50AE5BFF1DD15AFF17CD53FF06700BDE00000000031806355FB868FF28C9
      37FF8CE494FF85E68FFF7FE788FF79E983FF45E454FF47E956FF0C5413730000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002D2D2D3FB9B9B9FFB9B9B9FF0000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000C0C0C0000A8712FF6BE09FFF30DB74FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF30DB74FF6BE09FFF0A800FFF0116032F73B879FFA3DFA9FF96DD
      9DFF8DDC95FF54C85FFFC9F0CDFF77DE81FF71DF7BFF35D444FF36D846FF0145
      0875000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B9B9B9FFB9B9B9FF1616161F00000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000C0C0C000037909FF63DE9BFF6CE4A6FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF6CE4A6FF63DE9BFF037909FF000C01189CD2A2FFAAD8AFFF9DD8
      A3FF50BF59FF0111031A0004000611B120FF70D37AFF69D473FF25C434FF26C7
      35FF012E06750000000000000000000000000000000000000000000000000000
      00000000000000000000ADADADEFB9B9B9FFB9B9B9FF00000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C0000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000C0C0C000005E00DE5CE19DFF62E1A2FF63C3
      76FF5CC171FF58C070FF89CE93FFFFFFFFFFFFFFFFFF89CE93FF58C070FF5CC1
      71FF63C376FF62E1A2FF5CE19DFF005E00DE00000000000E011831B23CFF55BF
      5FFF0011011C00000000000000000004000604A413FF68C971FF60C969FF12B1
      21FF13B522FF0123057300000000000000000000000000000000000000000000
      00000000000000000000B9B9B9FFB9B9B9FFB9B9B9FF00000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C0000000000000FFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000C0C0C000024201958DEDC2FF5AE19EFF5EE3
      A3FF5DE3A3FF5CE5A6FF58C475FFFFFFFFFFFFFFFFFF58C475FF5CE5A6FF5DE3
      A3FF5EE3A3FF5AE19EFF8DEDC2FF024201950000000000000000000D0215010F
      0218000000000000000000000000000000000003000600900CFF67BB6EFF5BBA
      64FF009C0FFF00A10EFF19321B75000000000000000000000000000000000000
      000000000000B9B9B9FFB9B9B9FFB9B9B9FF0000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C0000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000C0C0C0000000000052C278FFA9F1D6FF5AE1
      A1FF5CE1A3FF5CE3A7FF5FCF84FFFFFFFFFFFFFFFFFF5FCF84FF5CE3A7FF5CE1
      A3FF5AE1A1FFA9F1D6FF52C278FF000000000000000000000000000000000000
      000000000000000000000000000000000000000000000003000600950CFF6BAD
      70FF5EA766FF007A0CFF81C488FF000600180000000000000000000000000000
      0000969696CFB9B9B9FFB9B9B9FF7E7E7EAF0000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C0000000000000FF
      FF0000FFFF0000FFFF000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C00000000000006600FF79E2AEFF95EB
      C8FF70E4B3FF55E3A7FF67D288FFFFFFFFFFFFFFFFFF67D288FF55E3A7FF70E4
      B3FF95EBC8FF79E2AEFF006600FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000300060096
      0CFF6EA974FF76AD7BFF00150239000000000000000000000000000000000000
      0000B9B9B9FFB9B9B9FFB9B9B9FF000000000000000000000000000000000000
      0000ADADADEF000000000000000000000000C0C0C0000000000000FFFF0000FF
      FF0000FFFF0000000000C0C0C00000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000004300AB6DDD
      A7FF98EED3FF98EBCDFF9CECD1FF9FEDD4FF9FEDD4FF9CECD1FF98EBCDFF98EE
      D3FF6DDDA7FF004300AB00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000003
      000600930CFF071E09370000000000000000000000000000000000000000B9B9
      B9FFB9B9B9FFB9B9B9FF00000000000000000000000000000000000000002222
      222FB9B9B9FF000000000000000000000000C0C0C000C0C0C0000000000000FF
      FF0000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000060
      00FF46BC74FF97EFD4FF9AEED5FF96ECCFFF96ECCFFF9AEED5FF97EFD4FF46BC
      74FF006000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007E7E7EAFB9B9
      B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9B9FFB9B9
      B9FFB9B9B9FF000000000000000000000000C0C0C000C0C0C000C0C0C0000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
      000000000000013C0095004D00DE006400FF006400FF004D00DE013C00950000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E007FFFFC0030000E003F8FFC003
      00008001F07FE00300008000E03FE1F300000000C01FF0FF00000000800FF8FF
      000000000007F87F000000000003FC3F000000000001FC3F000000008200F83F
      00000000C700F07F00008000FF80F0F300008000FFC0E0F30000C003FFE1C003
      0000E003FFFBC0030000F80FFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end