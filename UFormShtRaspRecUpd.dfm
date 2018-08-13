object FormShtRaspRecUpd: TFormShtRaspRecUpd
  Left = 214
  Top = 166
  Width = 760
  Height = 568
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object BitBtnSave: TBitBtn
    Left = 32
    Top = 472
    Width = 105
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 0
    OnClick = BitBtnSaveClick
  end
  object BitBtn1: TBitBtn
    Left = 560
    Top = 472
    Width = 97
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 1
    Kind = bkClose
  end
  object BitBtn2: TBitBtn
    Left = 160
    Top = 472
    Width = 281
    Height = 25
    Caption = #1055#1077#1088#1077#1074#1077#1089#1090#1080' '#1074' '#1076#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 8
    Width = 737
    Height = 457
    ActivePage = tsTabText
    TabOrder = 3
    object tsTabSht: TTabSheet
      Caption = #1064#1090'.'#1088#1072#1089#1087'.'
      object Label9: TLabel
        Left = 264
        Top = 144
        Width = 96
        Height = 20
        Caption = #1044#1086#1083#1103' '#1089#1090#1072#1074#1082#1080
      end
      object Label8: TLabel
        Left = 16
        Top = 324
        Width = 73
        Height = 20
        Caption = #1055#1077#1076'.'#1089#1090#1072#1078
      end
      object Label7: TLabel
        Left = 16
        Top = 288
        Width = 56
        Height = 20
        Caption = #1047#1072#1089#1083#1091#1078
      end
      object Label6: TLabel
        Left = 16
        Top = 258
        Width = 56
        Height = 20
        Caption = #1047#1074#1072#1085#1080#1077
      end
      object Label5: TLabel
        Left = 16
        Top = 232
        Width = 65
        Height = 20
        Caption = #1057#1090#1077#1087#1077#1085#1100
      end
      object Label4: TLabel
        Left = 528
        Top = 112
        Width = 88
        Height = 20
        Caption = #1074#1085#1077#1073#1102#1076#1078#1077#1090
      end
      object Label3: TLabel
        Left = 408
        Top = 112
        Width = 63
        Height = 20
        Caption = #1041#1102#1076#1078#1077#1090
      end
      object Label2: TLabel
        Left = 8
        Top = 56
        Width = 86
        Height = 20
        Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      end
      object Label14: TLabel
        Left = 8
        Top = 96
        Width = 101
        Height = 20
        Caption = #1053#1072' '#1076#1088'.'#1089#1090#1072#1074#1082#1077
      end
      object Label12: TLabel
        Left = 296
        Top = 356
        Width = 90
        Height = 20
        Caption = #1055#1086#1074#1099#1096#1077#1085#1080#1077
      end
      object Label11: TLabel
        Left = 64
        Top = 186
        Width = 56
        Height = 20
        Caption = #1056#1072#1079#1088#1103#1076
      end
      object Label10: TLabel
        Left = 208
        Top = 184
        Width = 50
        Height = 20
        Caption = #1054#1082#1083#1072#1076
      end
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 68
        Height = 20
        Caption = #1058#1072#1073'. '#1085#1086#1084'.'
      end
      object dxDBSpinEditRazr: TdxDBSpinEdit
        Left = 128
        Top = 184
        Width = 73
        TabOrder = 0
        DataField = 'RAZR'
        DataSource = dmPO.dsShtatRaspPedRec
        MaxValue = 25.000000000000000000
        MinValue = 1.000000000000000000
        StoredValues = 48
      end
      object dxDBEditFIO: TdxDBEdit
        Left = 224
        Top = 16
        Width = 305
        Enabled = False
        TabOrder = 1
        DataField = 'FIO'
        DataSource = dmPO.dsShtatRaspPedRec
      end
      object dxDBEditDolgCalcName: TdxDBEdit
        Left = 328
        Top = 56
        Width = 105
        Enabled = False
        TabOrder = 2
        DataField = 'DolCalcName'
        DataSource = dmPO.dsShtatRaspPedRec
        ReadOnly = True
        StoredValues = 64
      end
      object dxDBCheckEditIsZawKaf: TdxDBCheckEdit
        Left = 0
        Top = 384
        Width = 297
        TabOrder = 3
        Caption = #1047#1072#1074'.'#1082#1072#1092#1077#1076#1088#1086#1081'. '#1053#1072#1076#1073#1072#1074#1082#1072' '#1079#1072#1074'.'#1082#1072#1092'.'
        DataField = 'ISZAWKAF'
        DataSource = dmPO.dsShtatRaspPedRec
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnChange = dxDBCheckEditIsZawKafChange
      end
      object dxDBCheckEdit1: TdxDBCheckEdit
        Left = 536
        Top = 8
        Width = 153
        TabOrder = 4
        Caption = #1047#1072#1092#1080#1082#1089#1080#1088#1086#1074#1072#1085#1086
        DataField = 'FIXED'
        DataSource = dmPO.dsShtatRaspPedRec
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object dxDBCalcPStag: TdxDBCalcEdit
        Left = 96
        Top = 320
        Width = 121
        TabOrder = 5
        DataField = 'STAGP'
        DataSource = dmPO.dsShtatRaspPedRec
      end
      object dxDBCalcEditSummaNUZB: TdxDBCalcEdit
        Left = 400
        Top = 256
        Width = 121
        TabOrder = 6
        DataField = 'SUMMANUZB'
        DataSource = dmPO.dsShtatRaspPedRec
      end
      object dxDBCalcProcNZasl: TdxDBCalcEdit
        Left = 304
        Top = 288
        Width = 89
        TabOrder = 7
        DataField = 'PROCNZASL'
        DataSource = dmPO.dsShtatRaspPedRec
      end
      object dxDBCalcEditSummaPovVne: TdxDBCalcEdit
        Left = 528
        Top = 352
        Width = 121
        TabOrder = 8
        DataField = 'SUMMAPOVVNE'
        DataSource = dmPO.dsShtatRaspPedRec
      end
      object dxDBCalcEditSummaPovBud: TdxDBCalcEdit
        Left = 400
        Top = 352
        Width = 121
        TabOrder = 9
        DataField = 'SUMMAPOVBUD'
        DataSource = dmPO.dsShtatRaspPedRec
      end
      object dxDBCalcEditSummaNZaslV: TdxDBCalcEdit
        Left = 528
        Top = 288
        Width = 121
        TabOrder = 10
        DataField = 'SUMMANZASLV'
        DataSource = dmPO.dsShtatRaspPedRec
      end
      object dxDBCalcEditSUmmaNZalB: TdxDBCalcEdit
        Left = 400
        Top = 288
        Width = 121
        TabOrder = 11
        DataField = 'SUMMANZASLB'
        DataSource = dmPO.dsShtatRaspPedRec
      end
      object dxDBCalcEditSUmmaNUZV: TdxDBCalcEdit
        Left = 528
        Top = 256
        Width = 121
        TabOrder = 12
        DataField = 'SUMMANUZV'
        DataSource = dmPO.dsShtatRaspPedRec
      end
      object dxDBCalcEditSummaNUSV: TdxDBCalcEdit
        Left = 528
        Top = 224
        Width = 121
        TabOrder = 13
        DataField = 'SUMMANUSV'
        DataSource = dmPO.dsShtatRaspPedRec
      end
      object dxDBCalcEditSummaNUSB: TdxDBCalcEdit
        Left = 400
        Top = 224
        Width = 121
        TabOrder = 14
        DataField = 'SUMMANUSB'
        DataSource = dmPO.dsShtatRaspPedRec
      end
      object dxDBCalcEditSummaNPStagB: TdxDBCalcEdit
        Left = 400
        Top = 320
        Width = 121
        TabOrder = 15
        DataField = 'SUMMANPSTAGB'
        DataSource = dmPO.dsShtatRaspPedRec
      end
      object dxDBCalcEditSummaNadbZawKafVne: TdxDBCalcEdit
        Left = 528
        Top = 384
        Width = 121
        TabOrder = 16
        DataField = 'SUMMANADBZAWKAFVNE'
        DataSource = dmPO.dsShtatRaspPedRec
      end
      object dxDBCalcEditSummaNadbZawKafBud: TdxDBCalcEdit
        Left = 400
        Top = 384
        Width = 121
        TabOrder = 17
        DataField = 'SUMMANADBZAWKAFBUD'
        DataSource = dmPO.dsShtatRaspPedRec
      end
      object dxDBCalcEditProcNUZ: TdxDBCalcEdit
        Left = 304
        Top = 256
        Width = 89
        TabOrder = 18
        DataField = 'PROCNUZ'
        DataSource = dmPO.dsShtatRaspPedRec
      end
      object dxDBCalcEditProcNUS: TdxDBCalcEdit
        Left = 304
        Top = 224
        Width = 89
        TabOrder = 19
        DataField = 'PROCNUS'
        DataSource = dmPO.dsShtatRaspPedRec
      end
      object dxDBCalcEditProcNPSTAG: TdxDBCalcEdit
        Left = 304
        Top = 320
        Width = 89
        TabOrder = 20
        DataField = 'PROCNPSTAG'
        DataSource = dmPO.dsShtatRaspPedRec
      end
      object dxDBCalcEditProcNadbZawKaf: TdxDBCalcEdit
        Left = 304
        Top = 384
        Width = 89
        TabOrder = 21
        DataField = 'PROCNADBZAWKAF'
        DataSource = dmPO.dsShtatRaspPedRec
      end
      object dxDBCalcEditOkladV: TdxDBCalcEdit
        Left = 528
        Top = 184
        Width = 121
        TabOrder = 22
        DataField = 'OKLADV'
        DataSource = dmPO.dsShtatRaspPedRec
      end
      object dxDBCalcEditOkladRazr: TdxDBCalcEdit
        Left = 272
        Top = 184
        Width = 121
        TabOrder = 23
        DataField = 'OKLADRAZR'
        DataSource = dmPO.dsShtatRaspPedRec
      end
      object dxDBCalcEditOkaldB: TdxDBCalcEdit
        Left = 400
        Top = 184
        Width = 121
        TabOrder = 24
        DataField = 'OKLADB'
        DataSource = dmPO.dsShtatRaspPedRec
      end
      object dxDBCalcEditNPStagV: TdxDBCalcEdit
        Left = 528
        Top = 320
        Width = 121
        TabOrder = 25
        DataField = 'SUMMANPSTAGV'
        DataSource = dmPO.dsShtatRaspPedRec
      end
      object dxDBCalcEditKoefv: TdxDBCalcEdit
        Left = 528
        Top = 144
        Width = 121
        TabOrder = 26
        DataField = 'KOEFVNE'
        DataSource = dmPO.dsShtatRaspPedRec
      end
      object dxDBCalcEditKoefB: TdxDBCalcEdit
        Left = 400
        Top = 144
        Width = 121
        TabOrder = 27
        DataField = 'KOEFBUD'
        DataSource = dmPO.dsShtatRaspPedRec
      end
      object dxDBButtonEditTabno: TdxDBButtonEdit
        Left = 96
        Top = 16
        Width = 121
        Enabled = False
        TabOrder = 28
        DataField = 'TABNO'
        DataSource = dmPO.dsShtatRaspPedRec
        Buttons = <
          item
            Default = True
          end>
        OnButtonClick = dxDBButtonEditTabnoButtonClick
        ExistButtons = True
      end
      object DBRadioGroupWR: TDBRadioGroup
        Left = 440
        Top = 56
        Width = 249
        Height = 49
        Caption = #1056#1077#1078#1080#1084' '#1088#1072#1073#1086#1090#1099
        Columns = 2
        DataField = 'SHIFRWR'
        DataSource = dmPO.dsShtatRaspPedRec
        Items.Strings = (
          #1054#1089#1085#1086#1074#1085#1072#1103
          #1057#1086#1074#1084#1077#1097#1077#1085#1080#1077)
        TabOrder = 29
        Values.Strings = (
          '1'
          '2')
      end
      object ComboBoxOnOtherStawka: TComboBox
        Left = 112
        Top = 96
        Width = 209
        Height = 28
        ItemHeight = 20
        TabOrder = 30
        Text = 'ComboBoxOnOtherStawka'
        Items.Strings = (
          #1053#1072' '#1089#1074#1086#1077#1081' '#1089#1090#1072#1074#1082#1077
          #1044#1086#1094#1077#1085#1090' '#1085#1072' '#1089#1090#1072#1074#1082#1072' '#1089#1090#1088'.'#1087#1088'. '#1080#1083#1080' '#1072#1089#1089'.'
          #1055#1088#1086#1092#1077#1089#1089#1086#1088' '#1085#1072' '#1089#1090#1072#1074#1082#1077' '#1076#1086#1094#1077#1085#1090#1072' '#1080#1083#1080' '#1076#1088'.')
      end
      object DBLookupComboBoxZasl: TDBLookupComboBox
        Left = 96
        Top = 288
        Width = 201
        Height = 28
        DataField = 'SHIFRZASL'
        DataSource = dmPO.dsShtatRaspPedRec
        KeyField = 'SHIFRID'
        ListField = 'SHORTNAME'
        ListSource = dmPO.dsWidyZasl
        TabOrder = 31
      end
      object DBLookupComboBoxUZ: TDBLookupComboBox
        Left = 96
        Top = 256
        Width = 201
        Height = 28
        DataField = 'SHIFRUZ'
        DataSource = dmPO.dsShtatRaspPedRec
        KeyField = 'SHIFRID'
        ListField = 'NAMESOKR'
        ListSource = dmPO.dsWUZ
        TabOrder = 32
      end
      object DBLookupComboBoxUS: TDBLookupComboBox
        Left = 96
        Top = 224
        Width = 201
        Height = 28
        DataField = 'SHIFRUS'
        DataSource = dmPO.dsShtatRaspPedRec
        KeyField = 'SHIFRID'
        ListField = 'SHORTNAME'
        ListSource = dmPO.dsWUSPr
        TabOrder = 33
      end
      object DBLookupComboBoxDol: TDBLookupComboBox
        Left = 112
        Top = 56
        Width = 209
        Height = 28
        DataField = 'SHIFRDOL'
        DataSource = dmPO.dsShtatRaspPedRec
        KeyField = 'SHIFRDOL'
        ListField = 'NAME'
        ListSource = dmPO.dsDolg
        TabOrder = 34
      end
      object dxDBCheckEdit3: TdxDBCheckEdit
        Left = 536
        Top = 32
        Width = 145
        TabOrder = 35
        Caption = #1053#1077' '#1087#1077#1095#1072#1090#1072#1090#1100
        DataField = 'NOTPRINT'
        DataSource = dmPO.dsShtatRaspPedRec
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object btCalc: TBitBtn
        Left = 80
        Top = 136
        Width = 75
        Height = 25
        Caption = #1056#1072#1089#1095#1077#1090
        TabOrder = 36
        OnClick = btCalcClick
      end
    end
    object tsTabText: TTabSheet
      Caption = #1058#1077#1082#1089#1090' '#1087#1088#1080#1082#1072#1079#1072
      ImageIndex = 1
      object dxDBMemo: TdxDBMemo
        Left = 8
        Top = 8
        Width = 713
        TabOrder = 0
        DataField = 'TEXT'
        DataSource = dmPO.dsOrderRec
        Height = 361
      end
      object dxDBCheckEdit2: TdxDBCheckEdit
        Left = 16
        Top = 384
        Width = 161
        TabOrder = 1
        Caption = #1047#1072#1092#1080#1082#1089#1080#1088#1086#1074#1072#1090#1100
        DataField = 'FIXED'
        DataSource = dmPO.dsOrderRec
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object BitBtn3: TBitBtn
        Left = 176
        Top = 384
        Width = 225
        Height = 25
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1090#1077#1082#1089#1090' '#1087#1088#1080#1082#1072#1079#1072
        TabOrder = 2
        OnClick = BitBtn3Click
      end
      object BitBtn4: TBitBtn
        Left = 408
        Top = 384
        Width = 273
        Height = 25
        Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1091#1102' '#1092#1088#1072#1079#1091
        TabOrder = 3
        OnClick = BitBtn4Click
      end
    end
    object TabSheet1: TTabSheet
      Caption = #1047#1072#1084'.'#1076#1077#1082#1072#1085#1099
      ImageIndex = 2
      object Label13: TLabel
        Left = 160
        Top = 80
        Width = 156
        Height = 20
        Caption = #1044#1086#1087#1083#1072#1090#1072' '#1079#1072#1084' '#1076#1077#1082#1072#1085#1091
      end
      object Label15: TLabel
        Left = 8
        Top = 120
        Width = 138
        Height = 20
        Caption = #1055#1088#1086#1094#1077#1085#1090' '#1076#1086#1087#1083#1072#1090#1099
      end
      object Label16: TLabel
        Left = 80
        Top = 156
        Width = 63
        Height = 20
        Caption = #1041#1102#1076#1078#1077#1090
      end
      object Label17: TLabel
        Left = 49
        Top = 203
        Width = 94
        Height = 20
        Caption = #1042#1085#1077' '#1073#1102#1076#1078#1077#1090
      end
      object Label18: TLabel
        Left = 96
        Top = 250
        Width = 45
        Height = 20
        Caption = #1048#1090#1086#1075#1086
      end
      object Label19: TLabel
        Left = 316
        Top = 156
        Width = 29
        Height = 20
        Caption = #1075#1088#1085'.'
      end
      object Label20: TLabel
        Left = 317
        Top = 207
        Width = 29
        Height = 20
        Caption = #1075#1088#1085'.'
      end
      object Label21: TLabel
        Left = 314
        Top = 251
        Width = 29
        Height = 20
        Caption = #1075#1088#1085'.'
      end
      object cxDBCheckBoxIsDekan: TcxDBCheckBox
        Left = 152
        Top = 16
        Caption = #1044#1077#1082#1072#1085
        DataBinding.DataField = 'ISDEKAN'
        DataBinding.DataSource = dmPO.dsShtatRaspPedRec
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        TabOrder = 0
        Width = 121
      end
      object cxDBCheckBoxIsZamDekana: TcxDBCheckBox
        Left = 154
        Top = 48
        Caption = #1047#1072#1084'. '#1076#1077#1082#1072#1085#1072
        DataBinding.DataField = 'ISZAMDEKANA'
        DataBinding.DataSource = dmPO.dsShtatRaspPedRec
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        TabOrder = 1
        Width = 121
      end
      object cxDBCalcEditProcZamDec: TcxDBCalcEdit
        Left = 160
        Top = 112
        DataBinding.DataField = 'PROCZAMDEC'
        DataBinding.DataSource = dmPO.dsShtatRaspPedRec
        TabOrder = 2
        Width = 145
      end
      object cxDBCalcEditBud: TcxDBCalcEdit
        Left = 160
        Top = 152
        DataBinding.DataField = 'SUMMAZAMDECBUD'
        DataBinding.DataSource = dmPO.dsShtatRaspPedRec
        TabOrder = 3
        Width = 145
      end
      object cxDBCalcEditVne: TcxDBCalcEdit
        Left = 160
        Top = 200
        DataBinding.DataField = 'SUMMAZAMDECVNE'
        DataBinding.DataSource = dmPO.dsShtatRaspPedRec
        TabOrder = 4
        Width = 145
      end
      object cxDBCalcEditTot: TcxDBCalcEdit
        Left = 160
        Top = 248
        DataBinding.DataField = 'SUMMAZAMDECTOT'
        DataBinding.DataSource = dmPO.dsShtatRaspPedRec
        TabOrder = 5
        Width = 145
      end
    end
  end
end
