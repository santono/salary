object FormSelShifr: TFormSelShifr
  Left = 350
  Top = 137
  Width = 474
  Height = 501
  Caption = #1059#1082#1072#1078#1080#1090#1077' '#1096#1080#1092#1088
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    458
    465)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 32
    Top = 8
    Width = 400
    Height = 438
    ActivePage = TabUd
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabAdd: TTabSheet
      Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103
      DesignSize = (
        392
        403)
      object StringGridAdd: TStringGrid
        Left = 5
        Top = 8
        Width = 380
        Height = 385
        Anchors = [akLeft, akTop, akRight, akBottom]
        ColCount = 2
        DefaultRowHeight = 20
        TabOrder = 0
        OnDblClick = StringGridAddDblClick
        OnDrawCell = StringGridAddDrawCell
        OnKeyPress = StringGridAddKeyPress
      end
    end
    object TabUd: TTabSheet
      Caption = #1059#1076#1077#1088#1078#1072#1085#1080#1103
      ImageIndex = 1
      DesignSize = (
        392
        403)
      object StringGridUd: TStringGrid
        Left = 5
        Top = 8
        Width = 380
        Height = 377
        Anchors = [akLeft, akTop, akRight, akBottom]
        ColCount = 2
        DefaultRowHeight = 20
        TabOrder = 0
        OnDblClick = StringGridUdDblClick
        OnDrawCell = StringGridUdDrawCell
        OnKeyPress = StringGridUdKeyPress
      end
    end
  end
end
