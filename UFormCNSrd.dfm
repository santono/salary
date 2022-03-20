object FormCNSrd: TFormCNSrd
  Left = 299
  Top = 140
  Width = 639
  Height = 302
  Caption = #1057#1088#1077#1076#1085#1077#1076#1085#1077#1074#1085#1072#1103' '#1086#1087#1083#1072#1090#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 20
  object LabelFr: TLabel
    Left = 32
    Top = 24
    Width = 11
    Height = 20
    Caption = #1057
  end
  object LabelTo: TLabel
    Left = 32
    Top = 64
    Width = 21
    Height = 20
    Caption = #1055#1086
  end
  object LabelSRD: TLabel
    Left = 8
    Top = 104
    Width = 123
    Height = 20
    Caption = #1057#1088#1077#1076#1085#1077#1076#1085#1077#1074#1085#1072#1103
  end
  object LabelSta: TLabel
    Left = 8
    Top = 144
    Width = 56
    Height = 20
    Caption = #1057#1090#1072#1090#1100#1103
  end
  object LabelTab: TLabel
    Left = 8
    Top = 184
    Width = 89
    Height = 20
    Caption = #1050#1086#1076' '#1090#1072#1073#1077#1083#1103
  end
  object dtFR: TDateTimePicker
    Left = 72
    Top = 24
    Width = 241
    Height = 28
    Date = 44637.729639131950000000
    Time = 44637.729639131950000000
    DateFormat = dfLong
    TabOrder = 0
  end
  object dtTo: TDateTimePicker
    Left = 72
    Top = 64
    Width = 241
    Height = 28
    Date = 44637.731438668980000000
    Time = 44637.731438668980000000
    DateFormat = dfLong
    TabOrder = 1
  end
  object dxCalcEditSrd: TdxCalcEdit
    Left = 144
    Top = 104
    Width = 169
    TabOrder = 2
    Text = '0'
  end
  object cbShifrSta: TComboBox
    Left = 72
    Top = 144
    Width = 537
    Height = 28
    ItemHeight = 20
    TabOrder = 3
    Text = 'cbShifrSta'
  end
  object cbTabel: TComboBox
    Left = 104
    Top = 184
    Width = 505
    Height = 28
    ItemHeight = 20
    TabOrder = 4
    Text = 'cbTabel'
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 232
    Width = 121
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 5
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 168
    Top = 232
    Width = 121
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 6
    Kind = bkClose
  end
  object dsShifr: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' SHIFR,'
      ' NAME,'
      ' SHORTNAME'
      'FROM'
      ' SHIFR '
      'where coalesce(mode,0)=1'
      'order by shifr')
    Transaction = trRead
    Database = FIB.pFIBDatabaseSal
    Left = 328
    Top = 24
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = FIB.pFIBDatabaseSal
    TimeoutAction = TARollback
    TRParams.Strings = (
      'isc_tpb_read'
      'isc_tpb_nowait'
      'isc_tpb_rec_version'
      'isc_tpb_read_committed')
    TPBMode = tpbDefault
    Left = 368
    Top = 24
  end
end
