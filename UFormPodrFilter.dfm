object FormPodrFilter: TFormPodrFilter
  Left = 235
  Top = 163
  Width = 696
  Height = 480
  Caption = #1059#1082#1072#1078#1080#1090#1077' '#1082#1072#1092#1077#1076#1088#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dxDBGrid: TdxDBGrid
    Left = 8
    Top = 8
    Width = 665
    Height = 385
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRPOD'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = dmPO.dsPodr
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    object dxDBGridSHIFRPOD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 44
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRPOD'
    end
    object dxDBGridNAME: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 249
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
    object dxDBGridNAME_K: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 368
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME_K'
    end
  end
end
