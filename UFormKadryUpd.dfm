object FormKadryUpd: TFormKadryUpd
  Left = 249
  Top = 102
  Width = 696
  Height = 524
  Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 20
  object LabelTabno: TLabel
    Left = 8
    Top = 16
    Width = 78
    Height = 20
    Caption = #1058#1072#1073'.'#1085#1086#1084#1077#1088
  end
  object LabelPIB: TLabel
    Left = 8
    Top = 48
    Width = 40
    Height = 20
    Caption = #1055'.'#1030'.'#1041'.'
  end
  object LabelPIBDp: TLabel
    Left = 8
    Top = 80
    Width = 85
    Height = 20
    Caption = #1044#1072#1074#1072#1083#1100#1085#1080#1081
  end
  object LabelPIBRp: TLabel
    Left = 8
    Top = 112
    Width = 83
    Height = 20
    Caption = #1056#1086#1076#1086#1074#1080#1081' '#1074'.'
  end
  object LabelPedStag: TLabel
    Left = 8
    Top = 144
    Width = 73
    Height = 20
    Caption = #1055#1077#1076'.'#1089#1090#1072#1078
  end
  object LabelPedStagY: TLabel
    Left = 184
    Top = 144
    Width = 38
    Height = 20
    Caption = #1088#1086#1082#1110#1074
  end
  object LabelPedStM: TLabel
    Left = 296
    Top = 144
    Width = 74
    Height = 20
    Caption = #1084#1110#1089#1103#1094#1110#1074' '#1085#1072
  end
  object LabelPrinjat: TLabel
    Left = 8
    Top = 208
    Width = 75
    Height = 20
    Caption = #1055#1088#1080#1081#1085#1103#1090#1086
  end
  object LabelZwil: TLabel
    Left = 216
    Top = 208
    Width = 78
    Height = 20
    Caption = #1047#1074#1110#1083#1100#1085#1077#1085#1086
  end
  object Label1: TLabel
    Left = 144
    Top = 176
    Width = 82
    Height = 20
    Caption = #1055'.'#1089#1090#1072#1078' '#1075'.'#1075#1075
  end
  object LabelDataVer: TLabel
    Left = 368
    Top = 16
    Width = 99
    Height = 20
    Caption = 'LabelDataVer'
  end
  object dxDBCalcEdit1: TdxDBCalcEdit
    Left = 96
    Top = 16
    Width = 121
    Enabled = False
    TabOrder = 0
    DataField = 'TABNO'
    DataSource = dmPO.dsKadry
  end
  object dxDBEdit1: TdxDBEdit
    Left = 96
    Top = 48
    Width = 465
    TabOrder = 1
    DataField = 'FIO'
    DataSource = dmPO.dsKadry
  end
  object dxDBEdit2: TdxDBEdit
    Left = 96
    Top = 80
    Width = 465
    TabOrder = 2
    DataField = 'PIB_DAT_PAD'
    DataSource = dmPO.dsKadry
  end
  object dxDBEdit3: TdxDBEdit
    Left = 96
    Top = 112
    Width = 465
    TabOrder = 3
    DataField = 'PIB_ROD_PAD'
    DataSource = dmPO.dsKadry
  end
  object dxDBSpinEdit1: TdxDBSpinEdit
    Left = 96
    Top = 144
    Width = 81
    TabOrder = 4
    DataField = 'STAG_P_DO_Y'
    DataSource = dmPO.dsKadry
    MaxValue = 60.000000000000000000
    StoredValues = 16
  end
  object dxDBSpinEdit2: TdxDBSpinEdit
    Left = 232
    Top = 144
    Width = 57
    TabOrder = 5
    DataField = 'STAG_P_DO_M'
    DataSource = dmPO.dsKadry
    MaxValue = 12.000000000000000000
    StoredValues = 16
  end
  object dxDBDateEdit1: TdxDBDateEdit
    Left = 376
    Top = 144
    Width = 121
    TabOrder = 6
    DataField = 'DATE_STAG_P'
    DataSource = dmPO.dsKadry
  end
  object dxDBDateEdit2: TdxDBDateEdit
    Left = 88
    Top = 208
    Width = 121
    TabOrder = 7
    DataField = 'DATA_PRI'
    DataSource = dmPO.dsKadry
  end
  object dxDBDateEdit3: TdxDBDateEdit
    Left = 304
    Top = 208
    Width = 121
    TabOrder = 8
    DataField = 'DATA_UW'
    DataSource = dmPO.dsKadry
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 384
    Width = 113
    Height = 25
    Caption = #1047#1073#1077#1088#1110#1075#1090#1080
    TabOrder = 9
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 144
    Top = 384
    Width = 105
    Height = 25
    Caption = '&'#1042#1110#1076#1084#1086#1074#1072
    TabOrder = 10
    Kind = bkClose
  end
  object dxDBGrid1: TdxDBGrid
    Left = 24
    Top = 240
    Width = 513
    Height = 137
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SHIFRID'
    SummaryGroups = <>
    SummarySeparator = ', '
    TabOrder = 11
    DataSource = dmPO.dsKadryPr
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
    OnChangeNodeEx = dxDBGrid1ChangeNodeEx
    object dxDBGrid1DateFr: TdxDBGridDateColumn
      HeaderAlignment = taCenter
      Sorted = csUp
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATEFR'
    end
    object dxDBGrid1DateTo: TdxDBGridDateColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATETO'
    end
    object dxDBGrid1Column2: TdxDBGridButtonColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
      Buttons = <
        item
          Default = True
        end>
      OnButtonClick = dxDBGrid1Column2ButtonClick
    end
    object dxDBGrid1DatePodtv: TdxDBGridDateColumn
      Caption = #1055#1086#1076#1090#1074#1077#1088#1078#1076'.'
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATEPODTV'
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 264
    Top = 384
    Width = 240
    Height = 25
    DataSource = dmPO.dsKadryPr
    TabOrder = 12
  end
  object dxDBCheckEdit1: TdxDBCheckEdit
    Left = 504
    Top = 144
    Width = 177
    TabOrder = 13
    Caption = #1057#1090#1072#1078' '#1087#1088#1080#1073#1083#1080#1079#1080#1090#1077#1083#1100#1085#1099#1081
    DataField = 'PEDSTAGISPRIBLISIT'
    DataSource = dmPO.dsKadry
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object dxDBCalcEdit2: TdxDBCalcEdit
    Left = 248
    Top = 176
    Width = 121
    TabOrder = 14
    DataField = 'PEDSTAGY'
    DataSource = dmPO.dsKadry
    OnChange = dxDBCalcEdit2Change
  end
  object BitBtn3: TBitBtn
    Left = 376
    Top = 176
    Width = 25
    Height = 25
    Caption = #1056
    TabOrder = 15
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 512
    Top = 384
    Width = 25
    Height = 25
    Caption = #1044
    TabOrder = 16
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 568
    Top = 80
    Width = 49
    Height = 25
    Caption = #1044'.'#1087'.'
    TabOrder = 17
    OnClick = BitBtn5Click
  end
  object dxDBCheckEdit2: TdxDBCheckEdit
    Left = 416
    Top = 176
    Width = 121
    TabOrder = 18
    Caption = #1055#1055#1057
    DataField = 'IS_PED'
    DataSource = dmPO.dsKadry
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object DBCheckBoxVer: TDBCheckBox
    Left = 224
    Top = 16
    Width = 129
    Height = 17
    Caption = #1055#1088#1086#1074#1077#1088#1077#1085#1086
    DataField = 'VERIFIED'
    DataSource = dmPO.dsKadry
    TabOrder = 19
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object BitBtn6: TBitBtn
    Left = 432
    Top = 208
    Width = 73
    Height = 25
    Caption = #1050#1072#1092
    TabOrder = 20
    OnClick = BitBtn6Click
  end
  object BitBtn7: TBitBtn
    Left = 568
    Top = 112
    Width = 49
    Height = 25
    Caption = #1056'.'#1087'.'
    TabOrder = 21
    OnClick = BitBtn7Click
  end
end
