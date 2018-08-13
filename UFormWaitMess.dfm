object FormWaitMess: TFormWaitMess
  Left = 375
  Top = 326
  AlphaBlend = True
  AlphaBlendValue = 127
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 65
  ClientWidth = 274
  Color = clSkyBlue
  TransparentColor = True
  TransparentColorValue = clFuchsia
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClick = FormClick
  OnCreate = FormCreate
  OnDblClick = FormDblClick
  OnHide = FormHide
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnMouseDown = FormMouseDown
  OnMouseMove = FormMouseMove
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 238
    Height = 29
    Caption = #1044#1072#1085#1085#1099#1077' '#1089#1086#1093#1088#1072#1085#1077#1085#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 176
    Top = 40
  end
end
