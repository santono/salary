object FormDeponenty: TFormDeponenty
  Left = 256
  Top = 140
  Width = 696
  Height = 480
  Anchors = [akLeft, akTop, akRight, akBottom]
  Caption = #1044#1077#1087#1086#1085#1077#1085#1090#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  DesignSize = (
    680
    442)
  PixelsPerInch = 96
  TextHeight = 13
  object dxDBGrid1: TdxDBGrid
    Left = 8
    Top = 0
    Width = 665
    Height = 409
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'NPP'
    ShowSummaryFooter = True
    SummaryGroups = <>
    SummarySeparator = ', '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    BandFont.Charset = DEFAULT_CHARSET
    BandFont.Color = clWindowText
    BandFont.Height = -11
    BandFont.Name = 'MS Sans Serif'
    BandFont.Style = []
    DataSource = dsDeponent
    Filter.Criteria = {00000000}
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'MS Sans Serif'
    HeaderFont.Style = []
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    PreviewFont.Charset = DEFAULT_CHARSET
    PreviewFont.Color = clBlue
    PreviewFont.Height = -11
    PreviewFont.Name = 'MS Sans Serif'
    PreviewFont.Style = []
    object dxDBGrid1NPP: TdxDBGridMaskColumn
      Visible = False
      Width = 83
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NPP'
    end
    object dxDBGrid1TABNO: TdxDBGridMaskColumn
      Caption = 'T'#1085
      HeaderAlignment = taCenter
      Width = 58
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TABNO'
    end
    object dxDBGrid1FIO: TdxDBGridMaskColumn
      Caption = #1060#1048#1054
      HeaderAlignment = taCenter
      Width = 239
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
    object dxDBGrid1SUMMA: TdxDBGridCalcColumn
      Caption = #1057#1091#1084#1084#1072
      HeaderAlignment = taCenter
      Width = 128
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMA'
      SummaryFooterType = cstSum
      SummaryFooterField = 'SUMMA'
      SummaryField = 'SUMMA'
    end
    object dxDBGrid1SUMMA_RUB: TdxDBGridMaskColumn
      Visible = False
      Width = 83
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMA_RUB'
      EditMask = ',0.00;-,0.00;1;_'
    end
    object dxDBGrid1IDCODE: TdxDBGridMaskColumn
      Caption = #1048#1076'.'#1082#1086#1076
      HeaderAlignment = taCenter
      Width = 101
      BandIndex = 0
      RowIndex = 0
      FieldName = 'IDCODE'
    end
    object dxDBGrid1BANKCOUNT: TdxDBGridMaskColumn
      Caption = #1056'/C'
      HeaderAlignment = taCenter
      Width = 101
      BandIndex = 0
      RowIndex = 0
      FieldName = 'BANKCOUNT'
    end
    object dxDBGridButt: TdxDBGridButtonColumn
      Alignment = taCenter
      HeaderAlignment = taCenter
      Width = 34
      BandIndex = 0
      RowIndex = 0
      Buttons = <
        item
          Default = True
          Width = 10
        end>
      OnButtonClick = dxDBGridButtButtonClick
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 408
    Width = 240
    Height = 25
    DataSource = dsDeponent
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object dsDeponent: TDataSource
    DataSet = FormToExcelKomend.cdsRub
    Left = 40
    Top = 48
  end
  object PopupMenu1: TPopupMenu
    Left = 160
    Top = 96
    object N1: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
      OnClick = N1Click
    end
  end
end
