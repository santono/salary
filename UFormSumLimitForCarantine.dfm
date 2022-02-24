object FormSumLimitForCarantine: TFormSumLimitForCarantine
  Left = 219
  Top = 150
  Width = 1009
  Height = 585
  Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1085#1072' '#1084#1072#1082#1089'. '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
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
    993
    547)
  PixelsPerInch = 96
  TextHeight = 20
  object Button1: TButton
    Left = 8
    Top = 512
    Width = 153
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
    TabOrder = 0
    OnClick = Button1Click
  end
  object dxDBGridCDS2011: TdxDBGrid
    Left = 10
    Top = 8
    Width = 972
    Height = 499
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'Tabno'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 1
    DataSource = dsoCDS2011
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridCDS2011Tabno: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Tabno'
    end
    object dxDBGridCDS2011FIO: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Sorted = csUp
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
    object dxDBGridCDS2011Summa: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Summa'
    end
    object dxDBGridCDS2011SummaOsn: TdxDBGridMaskColumn
      Caption = #1054#1089#1085
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SummaOsn'
    end
    object dxDBGridCDS2011SummaSowm: TdxDBGridMaskColumn
      Caption = #1057#1086#1074#1084
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SummaSowm'
    end
    object dxDBGridCDS2011SummaPochas: TdxDBGridMaskColumn
      Caption = #1055#1086#1095#1072#1089#1086#1074#1082#1072
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SummaPochas'
    end
  end
  object BitBtn1: TBitBtn
    Left = 176
    Top = 512
    Width = 105
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object CheckBox1: TCheckBox
    Left = 312
    Top = 512
    Width = 193
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = #1042#1099#1074#1086#1076#1080#1090#1100' '#1087#1077#1088#1074#1099#1093' 100'
    TabOrder = 3
  end
  object cbWR: TComboBox
    Left = 512
    Top = 512
    Width = 145
    Height = 28
    Anchors = [akLeft, akBottom]
    Enabled = False
    ItemHeight = 20
    TabOrder = 4
    Text = 'cbWR'
    Visible = False
    OnChange = cbWRChange
    Items.Strings = (
      #1054#1089#1085' '#1080' '#1089#1086#1074#1084
      #1054#1089#1085#1086#1074#1085#1072#1103
      #1057#1086#1074#1084#1077#1097#1077#1085#1080#1077)
  end
  object CDS2011: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Tabno'
        DataType = ftInteger
      end
      item
        Name = 'FIO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Summa'
        DataType = ftFloat
      end
      item
        Name = 'SummaOsn'
        DataType = ftFloat
      end
      item
        Name = 'SummaSowm'
        DataType = ftFloat
      end
      item
        Name = 'SummaPochas'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 308
    Top = 263
    Data = {
      850000009619E0BD010000001800000006000000000003000000850005546162
      6E6F04000100000000000346494F010049000000010005574944544802000200
      32000553756D6D6108000400000000000853756D6D614F736E08000400000000
      000953756D6D61536F776D08000400000000000B53756D6D61506F6368617308
      000400000000000000}
    object CDS2011Tabno: TIntegerField
      DisplayLabel = #1058#1072#1073'.'#1085#1086#1084'.'
      FieldName = 'Tabno'
    end
    object CDS2011FIO: TStringField
      DisplayLabel = #1060#1048#1054
      FieldName = 'FIO'
      Size = 50
    end
    object CDS2011Summa: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'Summa'
      DisplayFormat = '0.00'
    end
    object CDS2011SummaOsn: TFloatField
      FieldName = 'SummaOsn'
    end
    object CDS2011SummaSowm: TFloatField
      FieldName = 'SummaSowm'
    end
    object CDS2011SummaPochas: TFloatField
      FieldName = 'SummaPochas'
    end
  end
  object dsoCDS2011: TDataSource
    DataSet = CDS2011
    Left = 348
    Top = 263
  end
end
