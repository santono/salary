object FormUpdPriType: TFormUpdPriType
  Left = 238
  Top = 93
  Width = 696
  Height = 584
  Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1079#1072#1087#1080#1089#1080' '#1090#1080#1087#1072' '#1087#1088#1080#1082#1072#1079#1072
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
  object Label1: TLabel
    Left = 76
    Top = 16
    Width = 30
    Height = 20
    Caption = #1050#1086#1076
  end
  object Label2: TLabel
    Left = 32
    Top = 48
    Width = 74
    Height = 20
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
  end
  object Label3: TLabel
    Left = 10
    Top = 80
    Width = 96
    Height = 20
    Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077
  end
  object dxDBEdit1: TdxDBEdit
    Left = 120
    Top = 16
    Width = 89
    Enabled = False
    TabOrder = 0
    DataField = 'ID'
    DataSource = FormBrowsePrikazyTyp.dsoPriType
  end
  object dxDBEdit2: TdxDBEdit
    Left = 120
    Top = 48
    Width = 545
    TabOrder = 1
    DataField = 'NAME'
    DataSource = FormBrowsePrikazyTyp.dsoPriType
  end
  object dxDBMemo1: TdxDBMemo
    Left = 120
    Top = 80
    Width = 545
    TabOrder = 2
    DataField = 'CONTENT'
    DataSource = FormBrowsePrikazyTyp.dsoPriType
    Height = 289
  end
  object BitBtn1: TBitBtn
    Left = 392
    Top = 424
    Width = 121
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 3
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 392
    Top = 456
    Width = 97
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 4
    Kind = bkClose
  end
  object cbNeedT5: TcxDBCheckBox
    Left = 120
    Top = 384
    Caption = #1042#1082#1083#1102#1095#1072#1090#1080' '#1076#1086' '#1090#1072#1073#1083#1080#1094'i 5'
    DataBinding.DataField = 'NEEDT5'
    DataBinding.DataSource = FormBrowsePrikazyTyp.dsoPriType
    Properties.ValueChecked = 1
    Properties.ValueUnchecked = 0
    Properties.OnEditValueChanged = cbNeedT5PropertiesEditValueChanged
    TabOrder = 5
    Width = 217
  end
  object gbT5: TGroupBox
    Left = 7
    Top = 416
    Width = 377
    Height = 89
    Caption = #1058#1072#1073#1083#1080#1094#1103' 5'
    TabOrder = 6
    object Label15: TLabel
      Left = 8
      Top = 24
      Width = 57
      Height = 20
      Caption = #1050#1086#1076' '#1047#1054
    end
    object cbVS: TcxDBCheckBox
      Left = 8
      Top = 56
      Caption = #1042#1085#1091#1090#1088'i'#1096#1085#1080#1081' '#1089#1091#1084'i'#1089#1085#1080#1082
      DataBinding.DataField = 'VS'
      DataBinding.DataSource = FormBrowsePrikazyTyp.dsoPriType
      Properties.ValueChecked = 1
      Properties.ValueUnchecked = 0
      TabOrder = 0
      Width = 185
    end
    object cbPIR: TcxDBCheckBox
      Left = 192
      Top = 56
      Hint = 
        #1055#1077#1088#1077#1074#1077#1076#1077#1085#1086', '#1087#1088#1080#1079#1085#1072#1095'. '#1085#1072' '#1110#1085'. '#1087#1086#1089#1072#1076#1091' '#1072#1073#1086#13#10#1088#1086#1073#1086#1090#1091', '#1087#1077#1088#1077#1084#1110#1097'. '#1076#1086' '#1110#1085#1096'.' +
        ' '#1087#1110#1076#1088#1086#1079#1076'.'
      Caption = #1055#1077#1088#1077#1074#1077#1076#1077#1085#1085#1103' i'#1085#1096#1077
      DataBinding.DataField = 'PIR'
      DataBinding.DataSource = FormBrowsePrikazyTyp.dsoPriType
      ParentShowHint = False
      Properties.ValueChecked = 1
      Properties.ValueUnchecked = 0
      ShowHint = True
      TabOrder = 1
      Width = 177
    end
    object cbZO: TcxDBLookupComboBox
      Left = 80
      Top = 24
      DataBinding.DataField = 'ZO'
      DataBinding.DataSource = FormBrowsePrikazyTyp.dsoPriType
      Properties.KeyFieldNames = 'ZO'
      Properties.ListColumns = <
        item
          FieldName = 'ZO'
        end
        item
          FieldName = 'name'
        end>
      Properties.ListSource = dsoZO
      TabOrder = 2
      Width = 281
    end
  end
  object cdsZO: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ZO'
        DataType = ftInteger
      end
      item
        Name = 'name'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 8
    Top = 8
    Data = {
      3E0000009619E0BD0100000018000000020000000000030000003E00025A4F04
      00010000000000046E616D650100490000000100055749445448020002003C00
      0000}
    object cdsZOZO: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1047#1054
      FieldName = 'ZO'
    end
    object cdsZOname: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1085#1103
      FieldName = 'name'
      Size = 60
    end
  end
  object dsoZO: TDataSource
    DataSet = cdsZO
    Left = 40
    Top = 8
  end
end
