object FormUpdatePSB: TFormUpdatePSB
  Left = 273
  Top = 190
  Width = 921
  Height = 501
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1088#1077#1082#1074#1080#1079#1080#1090#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 24
  object Label1: TLabel
    Left = 56
    Top = 56
    Width = 95
    Height = 24
    Caption = #1058#1072#1073'.'#1085#1086#1084#1077#1088
  end
  object Label2: TLabel
    Left = 8
    Top = 96
    Width = 119
    Height = 24
    Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048' '#1054
  end
  object Label3: TLabel
    Left = 40
    Top = 152
    Width = 115
    Height = 24
    Caption = #1053#1086#1084#1077#1088' '#1089#1095#1077#1090#1072
  end
  object Label4: TLabel
    Left = 16
    Top = 200
    Width = 148
    Height = 24
    Caption = #1053#1086#1084#1077#1088' '#1087#1072#1089#1087#1086#1088#1090#1072
  end
  object Label5: TLabel
    Left = 96
    Top = 240
    Width = 64
    Height = 24
    Caption = #1057#1053#1048#1051#1057
  end
  object Label6: TLabel
    Left = 120
    Top = 296
    Width = 39
    Height = 24
    Caption = #1048#1053#1053
  end
  object Label7: TLabel
    Left = 72
    Top = 336
    Width = 88
    Height = 24
    Caption = #1056#1077#1079#1080#1076#1077#1085#1090
  end
  object cxDBTextEditFAM: TcxDBTextEdit
    Left = 160
    Top = 96
    DataBinding.DataField = 'FAM'
    DataBinding.DataSource = FormBrowsePSB.dsoPSB
    Properties.ReadOnly = True
    TabOrder = 0
    Width = 257
  end
  object cxDBTextEditNam: TcxDBTextEdit
    Left = 432
    Top = 96
    DataBinding.DataField = 'NAM'
    DataBinding.DataSource = FormBrowsePSB.dsoPSB
    Properties.ReadOnly = True
    TabOrder = 1
    Width = 201
  end
  object cxDBTextEditOtc: TcxDBTextEdit
    Left = 648
    Top = 96
    DataBinding.DataField = 'OTC'
    DataBinding.DataSource = FormBrowsePSB.dsoPSB
    Properties.ReadOnly = True
    TabOrder = 2
    Width = 225
  end
  object cxDBTextEditPassport: TcxDBTextEdit
    Left = 168
    Top = 192
    Hint = #1053#1086#1084#1077#1088' '#1087#1072#1089#1087#1086#1088#1090#1072
    DataBinding.DataField = 'PASSPORT'
    DataBinding.DataSource = FormBrowsePSB.dsoPSB
    TabOrder = 3
    Width = 201
  end
  object cxDBTextEditINN: TcxDBTextEdit
    Left = 168
    Top = 288
    DataBinding.DataField = 'INN'
    DataBinding.DataSource = FormBrowsePSB.dsoPSB
    TabOrder = 4
    Width = 209
  end
  object cxDBRadioGroup1: TcxDBRadioGroup
    Left = 168
    Top = 336
    Caption = #1056#1077#1079#1080#1076#1077#1085#1090' '#1080#1083#1080' '#1085#1077#1090
    DataBinding.DataField = 'REZIDENT'
    DataBinding.DataSource = FormBrowsePSB.dsoPSB
    Properties.Columns = 2
    Properties.Items = <
      item
        Caption = #1056#1077#1079#1080#1076#1077#1085#1090
        Value = '21'
      end
      item
        Caption = #1053#1077' '#1088#1077#1079#1080#1076#1077#1085#1090
        Value = '10'
      end>
    TabOrder = 5
    Height = 65
    Width = 337
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 424
    Width = 129
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 6
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 176
    Top = 424
    Width = 113
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 7
    Kind = bkClose
  end
  object cxDBButtonEditTabno: TcxDBButtonEdit
    Left = 176
    Top = 56
    DataBinding.DataField = 'TABNO'
    DataBinding.DataSource = FormBrowsePSB.dsoPSB
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = cxDBButtonEdit1PropertiesButtonClick
    TabOrder = 8
    Width = 201
  end
  object cxDBTextEditNomerCount: TcxDBMaskEdit
    Left = 168
    Top = 152
    DataBinding.DataField = 'NOMER_SCHETA'
    DataBinding.DataSource = FormBrowsePSB.dsoPSB
    Properties.EditMask = '00000000000000000000'
    Properties.MaxLength = 0
    TabOrder = 9
    Width = 241
  end
  object cxDBTextEditSNILS: TcxDBMaskEdit
    Left = 168
    Top = 240
    DataBinding.DataField = 'SNILS'
    DataBinding.DataSource = FormBrowsePSB.dsoPSB
    Properties.EditMask = '000\-000\-000\ 00;1;_'
    Properties.MaxLength = 0
    TabOrder = 10
    Width = 233
  end
end
