object DBReferenceEditTemplate: TDBReferenceEditTemplate
  Left = 362
  Top = 290
  AutoSize = True
  BorderStyle = bsToolWindow
  Caption = 'DBReferenceEditTemplate'
  ClientHeight = 41
  ClientWidth = 375
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 375
    Height = 41
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      375
      41)
    object Button1: TButton
      Left = 64
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 237
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
end
