object FormSubDepUpdate: TFormSubDepUpdate
  Left = 192
  Top = 124
  Width = 659
  Height = 225
  Caption = 'FormSubDepUpdate'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 49
    Height = 13
    Caption = #1042#1083#1072#1076#1077#1083#1077#1094
  end
  object Label3: TLabel
    Left = 16
    Top = 88
    Width = 50
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
  end
  object Label4: TLabel
    Left = 16
    Top = 112
    Width = 63
    Height = 13
    Caption = #1041#1091#1093#1075#1072#1083#1090#1077#1088#1080#1103
  end
  object cxDBCalcEdit1: TcxDBCalcEdit
    Left = 104
    Top = 16
    DataBinding.DataField = 'ID'
    DataBinding.DataSource = FormDepartmentBrowse.dsoDep
    TabOrder = 0
    Width = 121
  end
  object cxDBTextEdit1: TcxDBTextEdit
    Left = 104
    Top = 80
    DataBinding.DataField = 'NAME'
    DataBinding.DataSource = FormDepartmentBrowse.dsoDep
    TabOrder = 1
    Width = 449
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 152
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 112
    Top = 152
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 3
    Kind = bkClose
  end
  object BitBtn3: TBitBtn
    Left = 560
    Top = 48
    Width = 75
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 560
    Top = 112
    Width = 75
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 5
  end
  object cxDBLookupComboBox2: TcxDBLookupComboBox
    Left = 104
    Top = 48
    DataBinding.DataField = 'IDOWNER'
    DataBinding.DataSource = FormDepartmentBrowse.dsoDep
    Properties.KeyFieldNames = 'ID'
    Properties.ListColumns = <
      item
        Caption = #1044#1077#1087#1072#1088#1090#1072#1084#1077#1085#1090
        FieldName = 'NSEARCH'
      end>
    Properties.ListSource = FormDepartmentBrowse.dsoDepSearch
    Properties.OnChange = cxDBLookupComboBox2PropertiesChange
    TabOrder = 6
    Width = 449
  end
  object cxDBLookupComboBox1: TcxDBLookupComboBox
    Left = 104
    Top = 112
    DataBinding.DataField = 'IDPODR'
    DataBinding.DataSource = FormDepartmentBrowse.dsoDep
    Properties.KeyFieldNames = 'SHIFRPOD'
    Properties.ListColumns = <
      item
        FieldName = 'PODSEARCH'
      end>
    Properties.ListSource = FormDepartmentBrowse.dsoPodr
    TabOrder = 7
    Width = 449
  end
end
