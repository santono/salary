object FormMovRecalc08: TFormMovRecalc08
  Left = 218
  Top = 267
  Width = 775
  Height = 334
  Caption = #1055#1077#1088#1077#1085#1086#1089' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1086#1074' '#1079' '#1087' '#1079#1072' 01 02 03 2008'
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
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 16
    Top = 56
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object Label3: TLabel
    Left = 328
    Top = 144
    Width = 268
    Height = 13
    Caption = #1043#1088#1072#1085#1080#1095#1085#1099#1077' '#1089#1091#1084#1084#1099' '#1076#1083#1103' '#1087#1077#1088#1077#1085#1086#1089#1072'  '#1076#1086#1087#1083#1072#1090' '#1087#1086' '#1086#1082#1083#1072#1076#1072#1084
  end
  object Label4: TLabel
    Left = 344
    Top = 160
    Width = 7
    Height = 13
    Caption = #1057
  end
  object Label5: TLabel
    Left = 448
    Top = 160
    Width = 38
    Height = 13
    Caption = #1075#1088#1085'.  '#1087#1086
  end
  object Label6: TLabel
    Left = 584
    Top = 160
    Width = 20
    Height = 13
    Caption = #1075#1088#1085'.'
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 32
    Width = 641
    Height = 21
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 80
    Width = 129
    Height = 25
    Caption = #1053#1077#1095#1072#1090#1100' '#1087#1077#1088#1077#1085#1086#1089
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 584
    Top = 80
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object BitBtn3: TBitBtn
    Left = 24
    Top = 192
    Width = 281
    Height = 25
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1080' '#1089#1095#1077#1090#1072
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 24
    Top = 120
    Width = 281
    Height = 25
    Caption = #1055#1077#1088#1077#1085#1086#1089' '#1090#1072#1073#1077#1083#1100#1085#1099#1093' '#1085#1086#1084#1077#1088#1086#1074' '#1050#1088#1099#1084#1072' '#1074' '#1041#1044
    Enabled = False
    TabOrder = 4
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 24
    Top = 160
    Width = 281
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1079#1074#1072#1085#1080#1103' '#1080' '#1089#1090#1077#1087#1077#1085#1080' '#1074' '#1055#1054#1042#1067#1064#1045#1053#1048#1048
    Enabled = False
    TabOrder = 5
    OnClick = BitBtn5Click
  end
  object CheckBox1: TCheckBox
    Left = 328
    Top = 96
    Width = 177
    Height = 17
    Caption = #1063#1080#1089#1090#1080#1090#1100' '#1089#1090#1072#1088#1099#1077' '#1087#1077#1088#1077#1085#1077#1089#1077#1085#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
    TabOrder = 6
  end
  object CheckBox2: TCheckBox
    Left = 328
    Top = 120
    Width = 281
    Height = 17
    Caption = #1055#1077#1088#1077#1085#1086#1089' '#1085#1077' '#1085#1077#1087#1077#1088#1077#1085#1077#1089#1077#1085#1085#1099#1093' '#1085#1077' '#1089#1074#1077#1088#1103#1103' '#1076#1086#1083#1078#1085#1086#1089#1090#1080
    Enabled = False
    TabOrder = 7
    Visible = False
  end
  object dxCalcEditLoSumma: TdxCalcEdit
    Left = 360
    Top = 160
    Width = 81
    TabOrder = 8
    Alignment = taRightJustify
    Text = '0'
    StoredValues = 1
  end
  object dxCalcEditHiSumma: TdxCalcEdit
    Left = 496
    Top = 160
    Width = 81
    TabOrder = 9
    Alignment = taRightJustify
    Text = '0'
    StoredValues = 1
  end
  object BitBtn6: TBitBtn
    Left = 328
    Top = 192
    Width = 305
    Height = 25
    Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' 23-'#1075#1086' '#1088#1072#1079#1088#1103#1076#1072
    Enabled = False
    TabOrder = 10
    Visible = False
    OnClick = BitBtn6Click
  end
  object BitBtn7: TBitBtn
    Left = 328
    Top = 224
    Width = 305
    Height = 25
    Caption = #1043#1083' '#1073#1091#1093#1075' '#1080' '#1079#1072#1084#1099
    Enabled = False
    TabOrder = 11
    Visible = False
    OnClick = BitBtn7Click
  end
  object Button1: TButton
    Left = 152
    Top = 80
    Width = 153
    Height = 25
    Caption = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080
    Enabled = False
    TabOrder = 12
    Visible = False
    OnClick = Button1Click
  end
  object BitBtn8: TBitBtn
    Left = 24
    Top = 224
    Width = 273
    Height = 25
    Caption = #1055#1077#1088#1077#1085#1086#1089' '#1087#1086#1095#1072#1089#1086#1074#1082#1080
    TabOrder = 13
    OnClick = BitBtn8Click
  end
  object pFIBQueryR: TpFIBQuery
    Transaction = pFIBTransactionR
    Database = FIB.pFIBDatabaseSal
    Left = 328
    Top = 64
  end
  object pFIBQueryW: TpFIBQuery
    Transaction = pFIBTransactionW
    Database = FIB.pFIBDatabaseSal
    Left = 432
    Top = 64
  end
  object pFIBTransactionR: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 360
    Top = 64
  end
  object pFIBTransactionW: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    Left = 464
    Top = 64
  end
  object pFIBDataSetR: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRSTA,'
      ' DOPL_SUMMA'
      'FROM'
      ' TB_RCLC1301_PR '
      'WHERE SHIFRIDOWNER=:SHIFRIDOWNER')
    Transaction = pFIBTrdsR
    Database = FIB.pFIBDatabaseSal
    Left = 504
    Top = 64
    object pFIBDataSetRSHIFRSTA: TFIBIntegerField
      FieldName = 'SHIFRSTA'
    end
    object pFIBDataSetRDOPL_SUMMA: TFIBBCDField
      FieldName = 'DOPL_SUMMA'
      Size = 2
      RoundByScale = True
    end
  end
  object pFIBTrdsR: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 544
    Top = 64
  end
  object pFIBDataSetRP: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' SUMMAOLD,'
      ' NMBOFCLOCK,'
      ' STAWKAOLD,'
      ' STAWKANEW,'
      ' SUMMANEW,'
      ' DOPL'
      'FROM'
      ' TB_RCLCPOCHAS1301_PR '
      'WHERE SHIFRIDOWNER=:SHIFRIDOWNER')
    Transaction = pFIBTrRP
    Database = FIB.pFIBDatabaseSal
    Left = 576
    Top = 64
    object pFIBDataSetRPSUMMAOLD: TFIBBCDField
      FieldName = 'SUMMAOLD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRPNMBOFCLOCK: TFIBBCDField
      FieldName = 'NMBOFCLOCK'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRPSTAWKAOLD: TFIBBCDField
      FieldName = 'STAWKAOLD'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRPSTAWKANEW: TFIBBCDField
      FieldName = 'STAWKANEW'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRPSUMMANEW: TFIBBCDField
      FieldName = 'SUMMANEW'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetRPDOPL: TFIBBCDField
      FieldName = 'DOPL'
      Size = 2
      RoundByScale = True
    end
  end
  object pFIBTrRP: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TACommit
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 616
    Top = 64
  end
end
