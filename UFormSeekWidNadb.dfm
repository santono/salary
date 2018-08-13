object FormSeekWidNadb: TFormSeekWidNadb
  Left = 260
  Top = 139
  Width = 274
  Height = 521
  Caption = #1042#1099#1073#1086#1088' '#1074#1080#1076#1086#1074' '#1085#1072#1091#1095#1085#1099#1093' '#1085#1072#1076#1073#1072#1074#1086#1082
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
    266
    474)
  PixelsPerInch = 96
  TextHeight = 20
  object dxDBGridSeek: TdxDBGrid
    Left = 8
    Top = 8
    Width = 250
    Height = 425
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    OnDblClick = dxDBGridSeekDblClick
    DataSource = dmPO.dsWidNSpr
    Filter.Criteria = {00000000}
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridSeekF_1: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'F_1'
    end
    object dxDBGridSeekF_2: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'F_2'
    end
    object dxDBGridSeekF_3: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'F_3'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 440
    Width = 246
    Height = 25
    DataSource = dmPO.dsWidNSpr
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbCancel, nbRefresh]
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
end
