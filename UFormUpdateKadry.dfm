object FormUpdateKadryFB: TFormUpdateKadryFB
  Left = 226
  Top = 120
  Width = 696
  Height = 595
  Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1079#1072#1087#1080#1089#1080
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
    557)
  PixelsPerInch = 96
  TextHeight = 20
  object BitBtnSave: TBitBtn
    Left = 8
    Top = 520
    Width = 97
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 0
    OnClick = BitBtnSaveClick
  end
  object BitBtnDel: TBitBtn
    Left = 120
    Top = 520
    Width = 89
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 1
    OnClick = BitBtnDelClick
  end
  object BitBtn1: TBitBtn
    Left = 224
    Top = 520
    Width = 97
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 2
    Kind = bkClose
  end
  object BitBtnPodrEmpty: TBitBtn
    Left = 328
    Top = 520
    Width = 233
    Height = 25
    Caption = #1054#1073#1085#1091#1083#1080#1090#1100' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
    TabOrder = 3
    OnClick = BitBtnPodrEmptyClick
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 673
    Height = 513
    ActivePage = TabSheet2
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
    object TabSheet1: TTabSheet
      Caption = #1056#1077#1082#1080#1074#1080#1079#1080#1090#1099
      object Label9: TLabel
        Left = 328
        Top = 125
        Width = 119
        Height = 20
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
      end
      object Label8: TLabel
        Left = 152
        Top = 240
        Width = 48
        Height = 20
        Caption = #1040#1076#1088#1077#1089
      end
      object Label7: TLabel
        Left = 80
        Top = 200
        Width = 124
        Height = 20
        Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      end
      object Label6: TLabel
        Left = 336
        Top = 160
        Width = 56
        Height = 20
        Caption = #1059#1074#1086#1083#1077#1085
      end
      object Label5: TLabel
        Left = 144
        Top = 160
        Width = 57
        Height = 20
        Caption = #1055#1088#1080#1085#1103#1090
      end
      object Label4: TLabel
        Left = 8
        Top = 125
        Width = 196
        Height = 20
        Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#1082#1086#1076
      end
      object Label3: TLabel
        Left = 8
        Top = 88
        Width = 194
        Height = 20
        Caption = #1055#1088#1110#1079#1074#1080#1097#1077' '#1030#39#1084#1103' '#1055#1086#1073#1072#1090#1100#1082#1086#1074#1110
      end
      object Label2: TLabel
        Left = 16
        Top = 56
        Width = 185
        Height = 20
        Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103' '#1054#1090#1095#1077#1089#1090#1074#1086
      end
      object Label15: TLabel
        Left = 376
        Top = 275
        Width = 101
        Height = 20
        Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
      end
      object Label14: TLabel
        Left = 149
        Top = 316
        Width = 51
        Height = 20
        Caption = #1042#1099#1076#1072#1085
      end
      object Label13: TLabel
        Left = 256
        Top = 272
        Width = 15
        Height = 20
        Caption = #8470
      end
      object Label12: TLabel
        Left = 89
        Top = 275
        Width = 113
        Height = 20
        Caption = #1055#1072#1089#1087#1086#1088#1090' '#1089#1077#1088#1080#1103
      end
      object Label11: TLabel
        Left = 339
        Top = 355
        Width = 44
        Height = 20
        Caption = #1089#1077#1088#1080#1103
      end
      object Label10: TLabel
        Left = 24
        Top = 352
        Width = 183
        Height = 20
        Caption = #1057#1074'-'#1074#1086' '#1089#1086#1094'.'#1089#1090#1088#1072#1093#1072': '#1085#1086#1084#1077#1088
      end
      object Label1: TLabel
        Left = 64
        Top = 16
        Width = 135
        Height = 20
        Caption = #1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
      end
      object Label17: TLabel
        Left = 40
        Top = 392
        Width = 159
        Height = 20
        Caption = #1053#1086#1084#1077#1088' '#1089#1095#1077#1090#1072' '#1074' '#1073#1072#1085#1082#1077
      end
      object dxLookupEditPodr: TdxLookupEdit
        Left = 200
        Top = 200
        Width = 465
        TabOrder = 0
        OnChange = dxLookupEditPodrChange
        ListFieldName = 'NAMEPOD'
        KeyFieldName = 'SHIFRPOD'
        ListSource = DataSourcePodr
        LookupKeyValue = 169
      end
      object dxEditSS_Ser: TdxEdit
        Left = 392
        Top = 352
        Width = 121
        TabOrder = 1
        OnChange = dxEditSS_SerChange
      end
      object dxEditSS_Nomer: TdxEdit
        Left = 208
        Top = 352
        Width = 121
        TabOrder = 2
        OnChange = dxEditSS_NomerChange
      end
      object dxEditPIB: TdxEdit
        Left = 200
        Top = 88
        Width = 465
        TabOrder = 3
        OnChange = dxEditPIBChange
      end
      object dxEditPasp_Vydan: TdxEdit
        Left = 208
        Top = 312
        Width = 449
        TabOrder = 4
        OnChange = dxEditPasp_VydanChange
      end
      object dxEditPasp_Ser: TdxEdit
        Left = 208
        Top = 272
        Width = 41
        TabOrder = 5
        OnChange = dxEditPasp_SerChange
      end
      object dxEditPasp_Nom: TdxEdit
        Left = 280
        Top = 272
        Width = 89
        TabOrder = 6
        OnChange = dxEditPasp_NomChange
      end
      object dxEditFIO: TdxEdit
        Left = 200
        Top = 56
        Width = 465
        TabOrder = 7
        OnChange = dxEditFIOChange
      end
      object dxEditAdres: TdxEdit
        Left = 200
        Top = 240
        Width = 465
        TabOrder = 8
        OnChange = dxEditAdresChange
      end
      object dxDatePasp_Data: TdxDateEdit
        Left = 496
        Top = 272
        Width = 121
        TabOrder = 9
        OnChange = dxDatePasp_DataChange
        Date = -700000.000000000000000000
      end
      object dxDateEditDataBirth: TdxDateEdit
        Left = 448
        Top = 120
        Width = 121
        TabOrder = 10
        OnChange = dxDateEditDataBirthChange
        Date = -700000.000000000000000000
      end
      object dxDateEditData_Uw: TdxDateEdit
        Left = 400
        Top = 160
        Width = 121
        TabOrder = 11
        OnChange = dxDateEditData_UwChange
        Date = -700000.000000000000000000
      end
      object dxDateEditData_Pri: TdxDateEdit
        Left = 208
        Top = 160
        Width = 121
        TabOrder = 12
        OnChange = dxDateEditData_PriChange
        Date = -700000.000000000000000000
      end
      object dxCheckEditPensioner: TdxCheckEdit
        Left = 536
        Top = 160
        Width = 113
        TabOrder = 13
        Caption = #1055#1077#1085#1089#1080#1086#1085#1077#1088
        OnChange = dxCheckEditPensionerChange
      end
      object dxCalcEditTabno: TdxCalcEdit
        Left = 208
        Top = 16
        Width = 121
        TabOrder = 14
        Text = '0'
        OnChange = dxCalcEditTabnoChange
      end
      object dxCalcEditNal_Code: TdxCalcEdit
        Left = 208
        Top = 120
        Width = 121
        TabOrder = 15
        Text = '0'
        OnChange = dxCalcEditNal_CodeChange
      end
      object BitBtnUniqIdCode: TBitBtn
        Left = 8
        Top = 453
        Width = 289
        Height = 25
        Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1080#1076'.'#1082#1086#1076' '#1085#1072' '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1089#1090#1100
        TabOrder = 16
        OnClick = BitBtnUniqIdCodeClick
      end
      object BitBtnPol: TBitBtn
        Left = 552
        Top = 16
        Width = 105
        Height = 25
        Caption = #1054#1087#1088#1077#1076#1077#1083#1080#1090#1100
        TabOrder = 17
        OnClick = BitBtnPolClick
      end
      object BitBtn2: TBitBtn
        Left = 568
        Top = 120
        Width = 97
        Height = 25
        Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100
        TabOrder = 18
        OnClick = BitBtn2Click
      end
      object RadioGroupPol: TRadioGroup
        Left = 336
        Top = 2
        Width = 209
        Height = 49
        Caption = #1055#1086#1083
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          #1052#1091#1078#1095#1080#1085#1072
          #1046#1077#1085#1097#1080#1085#1072)
        TabOrder = 19
      end
      object dxEditBankCount: TdxEdit
        Left = 208
        Top = 392
        Width = 305
        TabOrder = 20
        OnChange = dxEditBankCountChange
      end
      object BitBtnClearINN: TBitBtn
        Left = 16
        Top = 144
        Width = 121
        Height = 25
        Caption = #1048#1095#1080#1089#1090#1080#1090#1100' '#1048#1053#1053
        TabOrder = 21
        OnClick = BitBtnClearINNClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1059#1074#1086#1083#1100#1085#1077#1085#1080#1077
      ImageIndex = 1
      object Label16: TLabel
        Left = 8
        Top = 48
        Width = 159
        Height = 20
        Caption = #1055#1088#1080#1095#1080#1085#1072' '#1091#1074#1086#1083#1100#1085#1077#1085#1080#1103
      end
      object BitBtn3: TBitBtn
        Left = 32
        Top = 88
        Width = 75
        Height = 25
        Caption = #1059#1074#1086#1083#1085'.'
        TabOrder = 0
        OnClick = BitBtn3Click
      end
      object uwolMemo: TMemo
        Left = 176
        Top = 48
        Width = 465
        Height = 217
        Lines.Strings = (
          '')
        ReadOnly = True
        TabOrder = 1
      end
      object BitBtn4: TBitBtn
        Left = 176
        Top = 304
        Width = 457
        Height = 33
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1088#1080#1095#1080#1085#1091' '#1091#1074#1086#1083#1100#1085#1077#1085#1080#1103
        TabOrder = 2
        OnClick = BitBtn4Click
      end
    end
  end
  object DataSourceKadry: TDataSource
    Left = 400
    Top = 8
  end
  object pFIBDataSetPodr: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFRPOD,'
      ' NAME,'
      ' shifrpod||'#39' '#39'||name as namepod'
      'FROM'
      ' PODR '
      'order by shifrpod')
    Transaction = pfbtrnsctnReadPodr
    Database = FIB.pFIBDatabaseSal
    Left = 608
    Top = 8
    object pFIBDataSetPodrSHIFRPOD: TFIBIntegerField
      FieldName = 'SHIFRPOD'
    end
    object pFIBDataSetPodrNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 100
      EmptyStrToNull = True
    end
    object pFIBDataSetPodrNAMEPOD: TFIBStringField
      FieldName = 'NAMEPOD'
      Size = 112
      EmptyStrToNull = True
    end
  end
  object pfbtrnsctnReadPodr: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 640
    Top = 8
  end
  object DataSourcePodr: TDataSource
    DataSet = pFIBDataSetPodr
    Left = 576
    Top = 8
  end
end
