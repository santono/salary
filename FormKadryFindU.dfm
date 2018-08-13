object FormFindKadry: TFormFindKadry
  Left = 397
  Top = 319
  Width = 327
  Height = 128
  Caption = #1055#1086#1080#1089#1082' '#1088#1072#1073#1086#1090#1085#1080#1082#1072
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
  object EditPar: TEdit
    Left = 56
    Top = 8
    Width = 225
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = #1058' .'#1085' '#1080#1083#1080' '#1060#1072#1084#1080#1083#1080#1103
  end
  object ButFind: TBitBtn
    Left = 56
    Top = 48
    Width = 75
    Height = 25
    Caption = #1055#1086#1080#1089#1082
    TabOrder = 1
    OnClick = ButFindClick
  end
  object BitBtn2: TBitBtn
    Left = 208
    Top = 48
    Width = 75
    Height = 25
    TabOrder = 2
    OnClick = BitBtn2Click
    Kind = bkClose
  end
end
