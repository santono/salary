object FormImportFromKU: TFormImportFromKU
  Left = 132
  Top = 122
  Width = 853
  Height = 450
  Caption = 'f'
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
  object LabelFName: TLabel
    Left = 24
    Top = 48
    Width = 74
    Height = 13
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1092#1072#1081#1083
  end
  object dpFr: TDateTimePicker
    Left = 24
    Top = 8
    Width = 186
    Height = 21
    Date = 42692.590406342590000000
    Time = 42692.590406342590000000
    DateFormat = dfLong
    TabOrder = 0
  end
  object BitBtnFile: TBitBtn
    Left = 528
    Top = 48
    Width = 49
    Height = 25
    Caption = '. . . '
    TabOrder = 1
    OnClick = BitBtnFileClick
  end
  object BitBtnExecute: TBitBtn
    Left = 24
    Top = 96
    Width = 193
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1080#1084#1087#1086#1088#1090
    TabOrder = 2
    OnClick = BitBtnExecuteClick
  end
  object Memo1: TMemo
    Left = 24
    Top = 136
    Width = 801
    Height = 265
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
  object OpenDialog1: TOpenDialog
    Left = 584
    Top = 48
  end
end
