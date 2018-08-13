object FormSelParentBoln: TFormSelParentBoln
  Left = 209
  Top = 168
  Width = 696
  Height = 480
  Caption = #1042#1099#1073#1086#1088' '#1080#1089#1093#1086#1076#1085#1086#1075#1086' '#1073'.'#1083#1080#1089#1090#1082#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    688
    436)
  PixelsPerInch = 96
  TextHeight = 20
  object LabelFio: TLabel
    Left = 24
    Top = 8
    Width = 633
    Height = 20
    Caption = 'r '
  end
  object dxDBGridSelBoln: TdxDBGrid
    Left = 8
    Top = 40
    Width = 673
    Height = 353
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 0
    DataSource = DataSource1
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    Anchors = [akLeft, akTop, akRight, akBottom]
    object dxDBGridSelBolnSHIFRID: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Visible = False
      Width = 68
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SHIFRID'
    end
    object dxDBGridSelBolnNOMER_B: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 94
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NOMER_B'
    end
    object dxDBGridSelBolnF_DATA: TdxDBGridDateColumn
      HeaderAlignment = taCenter
      Width = 101
      BandIndex = 0
      RowIndex = 0
      FieldName = 'F_DATA'
    end
    object dxDBGridSelBolnL_DATA: TdxDBGridDateColumn
      HeaderAlignment = taCenter
      Width = 110
      BandIndex = 0
      RowIndex = 0
      FieldName = 'L_DATA'
    end
    object dxDBGridSelBolnSUMMA_BOL: TdxDBGridCurrencyColumn
      HeaderAlignment = taCenter
      Width = 101
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SUMMA_BOL'
      DisplayFormat = ',0.00;-,0.00'
      Nullable = False
    end
    object dxDBGridSelBolnFIO: TdxDBGridMaskColumn
      Alignment = taLeftJustify
      HeaderAlignment = taCenter
      Width = 263
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FIO'
    end
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 400
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1042#1099#1073#1086#1088
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 568
    Top = 400
    Width = 97
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    OnClick = BitBtn2Click
    Kind = bkClose
  end
  object pFIBDataSetSelBoln: TpFIBDataSet
    SelectSQL.Strings = (
      'select ShifrId,Fio,Summa_Bol,F_Data,L_Data,Nomer_B from boln'
      'where tabno=:tabno and ShifrId<>:ShifrId'
      'order by f_data desc')
    AllowedUpdateKinds = []
    Transaction = pFIBTransactionRead
    Database = FIB.pFIBDatabaseSal
    Left = 32
    Top = 24
    object pFIBDataSetSelBolnNOMER_B: TFIBStringField
      DisplayLabel = #8470' '#1073#1086#1083#1085'.'
      FieldName = 'NOMER_B'
      ReadOnly = True
      Size = 10
      EmptyStrToNull = True
    end
    object pFIBDataSetSelBolnF_DATA: TFIBDateField
      DisplayLabel = #1057
      FieldName = 'F_DATA'
      ReadOnly = True
    end
    object pFIBDataSetSelBolnL_DATA: TFIBDateField
      DisplayLabel = #1055#1086
      FieldName = 'L_DATA'
      ReadOnly = True
    end
    object pFIBDataSetSelBolnSUMMA_BOL: TFIBBCDField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1073#1086#1083#1085'.'
      FieldName = 'SUMMA_BOL'
      ReadOnly = True
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetSelBolnFIO: TFIBStringField
      DisplayLabel = #1060#1048#1054
      FieldName = 'FIO'
      ReadOnly = True
      Size = 51
      EmptyStrToNull = True
    end
    object pFIBDataSetSelBolnSHIFRID: TFIBIntegerField
      FieldName = 'SHIFRID'
      ReadOnly = True
      Visible = False
    end
  end
  object pFIBTransactionRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 32
    Top = 64
  end
  object DataSource1: TDataSource
    DataSet = pFIBDataSetSelBoln
    Left = 72
    Top = 24
  end
end
