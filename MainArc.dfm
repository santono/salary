object FormMainArc: TFormMainArc
  Left = 250
  Top = 190
  Width = 696
  Height = 480
  Caption = #1040#1088#1093#1080#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object StatusBar1: TStatusBar
    Left = 0
    Top = 405
    Width = 680
    Height = 19
    Panels = <
      item
        Width = 450
      end
      item
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 680
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 39
    Caption = 'ToolBar1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Hint = #1057#1087#1088#1072#1074#1082#1080' '#1076#1083#1103' '#1087#1077#1085#1089#1080#1086#1085#1077#1088#1086#1074' '#1089' '#1103#1085#1074#1072#1088#1103' 2007 '#1075#1086#1076#1072
      Action = ActionPens2006
      Caption = #1055#1085#1089
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton2: TToolButton
      Left = 39
      Top = 2
      Action = ActionArc
    end
    object ToolButton3: TToolButton
      Left = 78
      Top = 2
      Action = ActionArcTot
    end
    object ToolButton4: TToolButton
      Left = 117
      Top = 2
      Action = ActEditPensSpra
    end
  end
  object MainMenu1: TMainMenu
    Left = 120
    Top = 88
    object N1: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1080
      object N20071: TMenuItem
        Action = ActionPens2006
      end
      object N3: TMenuItem
        Action = ActionArc
        Caption = #1040#1088#1093#1080#1074
      end
      object N4: TMenuItem
        Caption = #1040#1088#1093#1080#1074' '#1074#1077#1089#1100
        OnClick = N4Click
      end
      object N6: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N6Click
      end
    end
    object N2: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      object N20072: TMenuItem
        Action = ActEditPensSpra
        Caption = 'C'#1090#1072#1090#1100#1080', '#1087#1077#1085#1089' '#1089#1087#1088#1072#1074#1082#1080' 2007'
      end
      object N5: TMenuItem
        Caption = #1057#1082#1088#1099#1090#1099#1077' '#1090#1072#1073' '#1085#1086#1084#1077#1088#1072
        OnClick = N5Click
      end
    end
    object N7: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = N7Click
    end
  end
  object ActionList1: TActionList
    Left = 80
    Top = 88
    object ActionPens2006: TAction
      Caption = #1055#1077#1085#1089'2006'
      OnExecute = ActionPens2006Execute
    end
    object ActionArc: TAction
      Caption = #1040#1088#1093
      OnExecute = ActionArcExecute
    end
    object ActEditPensSpra: TAction
      Caption = 'C'#1087#1088
      OnExecute = ActEditPensSpraExecute
    end
    object ActionArcTot: TAction
      Caption = #1040#1088#1093#1058
      OnExecute = ActionArcTotExecute
    end
    object ActionEditSecret: TAction
      Caption = 'ActionEditSecret'
      OnExecute = ActionEditSecretExecute
    end
  end
end
