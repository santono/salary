object MainFormCDS: TMainFormCDS
  Left = 225
  Top = 172
  Width = 707
  Height = 493
  HorzScrollBar.Visible = False
  Caption = 'ion'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnPaint = FormPaint
  OnShow = FormShow
  DesignSize = (
    699
    403)
  PixelsPerInch = 96
  TextHeight = 20
  object StringGrid1: TStringGrid
    Left = 0
    Top = 32
    Width = 685
    Height = 325
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 8
    FixedCols = 0
    FixedRows = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSizing, goColSizing, goColMoving, goRowSelect]
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnDblClick = StringGrid1DblClick
    OnDrawCell = StringGrid1DrawCell
    OnKeyDown = StringGrid1KeyDown
    OnKeyPress = StringGrid1KeyPress
    OnMouseDown = StringGrid1MouseDown
    OnMouseMove = StringGrid1MouseMove
    ColWidths = (
      42
      185
      100
      95
      113
      98
      102
      98)
  end
  object StringGrid2: TStringGrid
    Left = 0
    Top = 354
    Width = 685
    Height = 35
    Anchors = [akLeft, akRight, akBottom]
    ColCount = 7
    Enabled = False
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnDrawCell = StringGrid2DrawCell
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 699
    Height = 26
    ButtonHeight = 21
    ButtonWidth = 30
    Caption = 'ToolBar1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 2
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      Action = ActionChangePodr
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton2: TToolButton
      Left = 30
      Top = 2
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1084#1077#1089#1103#1094
      Action = ActionChangeNMES
      Caption = #1052'-'#1094
    end
    object ToolButton3: TToolButton
      Left = 60
      Top = 2
      Hint = #1050#1072#1076#1088#1099
      Action = ActionF2
      Caption = 'F2'
    end
    object ToolButton4: TToolButton
      Left = 90
      Top = 2
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      Action = ActionSave
      Caption = #1057#1093#1088
    end
    object ToolButton5: TToolButton
      Left = 120
      Top = 2
      Hint = #1057#1086#1074#1084#1077#1097#1077#1085#1080#1103' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      Action = ActionSowm
      Caption = #1057#1074#1084
    end
    object ToolButton6: TToolButton
      Left = 150
      Top = 2
      Hint = #1058#1072#1073#1077#1083#1100' '#1086#1090#1088#1072#1073#1086#1090#1072#1085#1085#1086#1075#1086' '#1074#1088#1077#1084#1077#1085#1080
      Action = ActionF3
      Caption = 'F3'
    end
    object ToolButton7: TToolButton
      Left = 180
      Top = 2
      Hint = #1055#1086#1089#1090#1086#1103#1085#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
      Action = ActionF4
      Caption = 'F4'
    end
    object ToolButton9: TToolButton
      Left = 210
      Top = 2
      Hint = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090' '#1085#1072#1083#1086#1075#1086#1074' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '#1079#1072' '#1087#1088#1086#1096#1083#1099#1077' '#1087#1077#1088#1080#1086#1076#1099
      Action = ActionRclcPerson
      Caption = #1053#1083#1075
    end
    object ToolButton14: TToolButton
      Left = 240
      Top = 2
      Action = ActionEditKadryClarion
    end
    object ToolButton13: TToolButton
      Left = 270
      Top = 2
      Action = ActionOtpPerson
    end
    object ToolButton12: TToolButton
      Left = 300
      Top = 2
      Hint = #1056#1072#1089#1095#1077#1090#1085#1099#1077' '#1083#1080#1089#1090#1082#1080
      Action = ActionRList
      Caption = #1056#1083
    end
    object ToolButton11: TToolButton
      Left = 330
      Top = 2
      Hint = #1052#1077#1084#1086#1088#1080#1072#1083#1100#1085#1099#1077' '#1086#1088#1076#1077#1088#1072
      Action = MemBud
      Caption = #1052#1077#1084
    end
    object ToolButton10: TToolButton
      Left = 360
      Top = 2
      Hint = #1051#1080#1089#1090#1082#1080' '#1074#1087#1077#1084#1077#1085#1085#1086#1081' '#1085#1077#1090#1088#1091#1076#1086#1089#1087#1086#1089#1086#1073#1085#1086#1089#1090#1080
      Action = ActionBolnPerson
      ImageIndex = 2
    end
    object ToolButton15: TToolButton
      Left = 390
      Top = 2
      Action = ActionPlat
    end
    object ToolButton16: TToolButton
      Left = 420
      Top = 2
      Action = ActionTestRecalcPerson
    end
    object ToolButton17: TToolButton
      Left = 450
      Top = 2
      Action = ActionKomandirowkiPerson
    end
    object ToolButton18: TToolButton
      Left = 480
      Top = 2
      Hint = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090' '#1082#1072#1082' '#1074' '#1089#1090#1072#1088#1086#1081' '#1087#1088#1086#1075#1088#1072#1084#1084#1077' ('#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080#1081')'
      Action = ActionCalcPerson
      Caption = 'P/'#1047
    end
    object ToolButton19: TToolButton
      Left = 510
      Top = 2
      Hint = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090' '#1079#1072' '#1091#1082#1072#1079#1072#1085#1085#1099#1081' '#1084#1077#1089#1103#1094
      Action = ActionRecalcPersonForMonth
      Caption = 'P'#1047'M'
    end
    object ToolButton20: TToolButton
      Left = 540
      Top = 2
      Action = actAnalyzeNalogi2011
      Caption = #1058#1089#1090
    end
    object ToolButton21: TToolButton
      Left = 570
      Top = 2
      Action = ActionReclacPersonWithMode
    end
    object ToolButton22: TToolButton
      Left = 600
      Top = 2
      Action = ActionRecalcPersonWithMode1
    end
    object ToolButton8: TToolButton
      Left = 630
      Top = 2
      Hint = #1040#1088#1093#1080#1074' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      Action = ActionArcPerson
      Caption = #1040#1088#1093
    end
    object ToolButton23: TToolButton
      Left = 660
      Top = 2
      Action = ActIndexPersonCalc
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 384
    Width = 699
    Height = 19
    Panels = <
      item
        Width = 600
      end
      item
        Style = psOwnerDraw
        Width = 50
      end
      item
        Width = 50
      end>
    OnDrawPanel = StatusBar1DrawPanel
  end
  object MainMenu1: TMainMenu
    Left = 64
    Top = 24
    object N1: TMenuItem
      Caption = #1047#1072#1088#1087#1083#1072#1090#1072
    end
    object N2: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      object N6: TMenuItem
        Caption = #1055#1077#1088#1077#1085#1086#1089' '#1076#1072#1085#1085#1099#1093' '#1074' SQL'
        OnClick = N6Click
      end
      object DBF1: TMenuItem
        Caption = #1055#1077#1088#1077#1085#1086#1089' '#1076#1072#1085#1085#1099#1093' '#1074' DBF'
        OnClick = DBF1Click
      end
      object N7: TMenuItem
        Caption = #1050#1072#1076#1088#1099
        OnClick = N7Click
      end
      object FireBird: TMenuItem
        Caption = 'FireBird'
        OnClick = FireBirdClick
      end
      object N19: TMenuItem
        Caption = #1041#1086#1083#1100#1085#1080#1095#1085#1099#1077
        object N20: TMenuItem
          Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
          OnClick = N20Click
        end
        object N21: TMenuItem
          Caption = #1043#1088#1091#1087#1087#1099
          OnClick = N21Click
        end
        object N22: TMenuItem
          Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080
          OnClick = N22Click
        end
        object N23: TMenuItem
          Caption = #1055#1088#1072#1079#1076#1085#1080#1082#1080
          OnClick = N23Click
        end
        object N24: TMenuItem
          Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1099
          OnClick = N24Click
        end
      end
      object N29: TMenuItem
        Caption = #1054#1087#1077#1088#1072#1090#1086#1088#1099
        OnClick = N29Click
      end
      object N33: TMenuItem
        Caption = #1040#1083#1080#1084#1077#1085#1090#1099
        OnClick = N33Click
      end
      object N36: TMenuItem
        Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077
        object N37: TMenuItem
          Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
        end
        object N38: TMenuItem
          Caption = #1043#1088#1091#1087#1087#1099
        end
        object N39: TMenuItem
          Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080
        end
        object N40: TMenuItem
          Caption = #1055#1088#1072#1079#1076#1085#1080#1082#1080
        end
        object N41: TMenuItem
          Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1099
        end
      end
      object N48: TMenuItem
        Caption = #1058#1077#1084#1099
        OnClick = N48Click
      end
      object N62: TMenuItem
        Caption = #1042#1089#1087#1086#1084#1072#1075#1072#1090#1077#1083#1100#1085#1099#1077' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
        object N63: TMenuItem
          Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
          OnClick = N63Click
        end
        object N64: TMenuItem
          Caption = #1048#1089#1090#1086#1095#1085#1080#1082#1080' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
          OnClick = N64Click
        end
        object N65: TMenuItem
          Caption = #1057#1090#1072#1090#1100#1080' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1091#1076#1077#1088#1078#1072#1085#1080#1081
          OnClick = N65Click
        end
        object N66: TMenuItem
          Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1088#1072#1079#1088#1103#1076#1086#1074
          OnClick = N66Click
        end
        object N67: TMenuItem
          Caption = #1057#1087#1088#1072#1074#1086#1095#1080#1085#1080#1082' '#1084#1080#1085' '#1079#1072#1088#1087#1083#1072#1090
          OnClick = N67Click
        end
        object N4: TMenuItem
          Caption = #1058#1072#1073#1083#1080#1094#1099' '#1088#1072#1089#1095#1077#1090#1072' '#1087#1077#1085#1089' '#1085#1072#1083#1086#1075#1072' '#1087#1088#1077#1087
          OnClick = N4Click
        end
        object N5: TMenuItem
          Caption = #1058#1072#1073#1083#1080#1094#1099' '#1088#1072#1089#1095#1077#1090#1072' '#1087#1086#1076#1086#1093'.'#1085#1072#1083#1086#1075#1072
          OnClick = N5Click
        end
        object N31: TMenuItem
          Caption = #1050#1072#1083#1077#1085#1076#1072#1088#1080
          OnClick = N31Click
        end
        object N69: TMenuItem
          Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1080
          OnClick = N69Click
        end
        object N70: TMenuItem
          Caption = #1053#1086#1088#1084#1072#1090#1080#1074#1099' '#1076#1085#1077#1081' '#1080' '#1095#1072#1089#1086#1074
          OnClick = N70Click
        end
        object N71: TMenuItem
          Caption = #1055#1088#1080#1074#1072#1090#1085#1099#1077' '#1088#1072#1073#1086#1090#1085#1080#1082#1080
          OnClick = N71Click
        end
        object N72: TMenuItem
          Caption = #1064#1072#1073#1083#1086#1085#1099' '#1074#1099#1073#1086#1088#1072' '#1087#1083#1072#1090'.'#1074#1077#1076#1086#1084#1086#1089#1090#1077#1081
          OnClick = N72Click
        end
        object N73: TMenuItem
          Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1090#1077#1084
          OnClick = N73Click
        end
        object N80: TMenuItem
          Caption = #1044#1080#1072#1087#1072#1079#1086#1085#1099' '#1087#1083#1072#1085#1086#1074#1086#1075#1086' '#1086#1090#1076#1077#1083#1072
          OnClick = N80Click
        end
        object N95: TMenuItem
          Caption = #1053#1077' '#1075#1088#1072#1078#1076#1072#1085#1077' '#1059#1082#1088#1072#1080#1085#1099
          OnClick = N95Click
        end
        object N97: TMenuItem
          Caption = #1053#1086#1084#1077#1088#1072' '#1089#1086#1094'.'#1089#1090#1088#1072#1093#1072
          OnClick = N97Click
        end
        object N116: TMenuItem
          Action = ActionEditInfProc
        end
      end
    end
    object N3: TMenuItem
      Caption = #1057#1074#1086#1076#1099
      object N15: TMenuItem
        Caption = #1057#1074#1086#1076
        OnClick = N15Click
      end
      object N28: TMenuItem
        Caption = #1044#1083#1103' '#1051#1077#1088#1099
        OnClick = N28Click
      end
      object N32: TMenuItem
        Caption = #1055#1086' '#1082#1072#1092#1077#1076#1088#1072#1084' '#1080' '#1089#1095#1077#1090#1072#1084
        OnClick = N32Click
      end
      object N43: TMenuItem
        Caption = #1040#1083#1080#1084#1077#1085#1090#1099
        OnClick = N43Click
      end
      object N44: TMenuItem
        Caption = #1057#1086#1094'.'#1089#1090#1088#1072#1093
        object N45: TMenuItem
          Caption = #1057#1087#1080#1089#1086#1082' '#1089#1086#1090#1088' '#1073#1086#1083#1100#1096#1077' '#1083#1080#1084#1080#1090#1072
          OnClick = N45Click
        end
        object N46: TMenuItem
          Caption = #1057#1074#1086#1076' '#1087#1086' '#1089#1086#1094'.'#1089#1090#1088#1072#1093#1091
          OnClick = N46Click
        end
      end
      object N47: TMenuItem
        Caption = #1057#1074#1086#1076' '#1087#1086' '#1090#1077#1084#1072#1084
        OnClick = N47Click
      end
      object N51: TMenuItem
        Caption = #1042#1099#1087#1083#1072#1090#1099', '#1082#1088#1077#1076#1080#1090#1099', '#1084#1077#1076'.'#1089#1090#1088#1072#1093
        OnClick = N51Click
      end
      object N50: TMenuItem
        Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080#1081' '#1089#1074#1086#1076
        object Excel1: TMenuItem
          Caption = #1042' Excel'
          OnClick = Excel1Click
        end
        object FastReport1: TMenuItem
          Caption = 'FastReport'
          OnClick = FastReport1Click
        end
      end
      object N68: TMenuItem
        Caption = #1057#1074#1086#1076' '#1087#1086' '#1084#1072#1090'.'#1087#1086#1084#1086#1097#1080
        OnClick = N68Click
      end
      object N81: TMenuItem
        Caption = #1055#1083#1072#1085#1086#1074#1099#1081' '#1086#1090#1076#1077#1083
        object N82: TMenuItem
          Caption = #1045#1078#1077#1082#1074#1072#1088#1090#1072#1083#1100#1085#1099#1077' '#1076#1080#1072#1087#1072#1079#1086#1085#1099' '#1080' '#1092#1086#1085#1076
          OnClick = N82Click
        end
      end
      object N88: TMenuItem
        Caption = #1042#1089#1087#1086#1084#1072#1075#1072#1090#1077#1083#1100#1085#1099#1077
        object N89: TMenuItem
          Caption = #1057#1087#1080#1089#1086#1082' '#1087#1077#1088#1077#1087#1083#1072#1090
          OnClick = N89Click
        end
        object N90: TMenuItem
          Caption = #1044#1074#1086#1081#1085#1072#1103' '#1074#1099#1087#1083#1072#1090#1072
          OnClick = N90Click
        end
        object N91: TMenuItem
          Caption = #1053#1077#1089#1086#1086#1090#1074#1077#1089#1090#1074#1080#1077' '#1089#1095#1077#1090#1086#1074
          OnClick = N91Click
        end
        object N93: TMenuItem
          Caption = #1057#1087#1080#1089#1086#1082' '#1089#1086#1094#1080#1072#1083#1100#1085#1099#1093' '#1083#1100#1075#1086#1090
          OnClick = N93Click
        end
        object N99: TMenuItem
          Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1045#1057#1042' '#1080' '#1085#1072#1083#1086#1075#1072' '#1089' '#1076#1086#1093#1086#1076#1072
          object N100: TMenuItem
            Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1088#1072#1089#1095#1077#1090#1072
            OnClick = N100Click
          end
          object N101: TMenuItem
            Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1086#1076#1085#1086#1074#1088#1077#1084#1077#1077#1085#1086' '#1053' '#1080' '#1054
            OnClick = N101Click
          end
          object N109: TMenuItem
            Caption = #1057#1074#1086#1076' '#1087#1086' '#1045#1057#1042' '#1076#1083#1103' '#1040#1083#1083#1099
            OnClick = N109Click
          end
        end
        object N102: TMenuItem
          Caption = #1042#1099#1087#1083#1072#1090#1099' '#1087#1086' '#1089#1090#1072#1090#1100#1077
          OnClick = N102Click
        end
        object N108: TMenuItem
          Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1087#1086' '#1076#1086#1083#1078#1085#1086#1089#1090#1103#1084
          OnClick = N108Click
        end
        object ActionPochasSwod1: TMenuItem
          Action = ActionPochasSwod
          Caption = #1057#1074#1086#1076' '#1087#1086' '#1087#1086#1095#1072#1089#1086#1074#1082#1077
        end
      end
    end
    object N14: TMenuItem
      Caption = #1040#1088#1093#1080#1074
      object N17: TMenuItem
        Caption = #1040#1088#1093#1080#1074
        OnClick = N17Click
      end
      object N18: TMenuItem
        Caption = #1041#1086#1083#1100#1085#1080#1095#1085#1099#1077
        OnClick = N18Click
      end
      object N25: TMenuItem
        Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077
        OnClick = N25Click
      end
      object N75: TMenuItem
        Caption = #1050#1086#1084#1072#1085#1076#1080#1088#1086#1074#1082#1080
        OnClick = N75Click
      end
      object N103: TMenuItem
        Caption = #1053#1086#1084#1077#1088#1072' '#1089#1086#1094'.'#1089#1090#1088#1072#1093#1072
        OnClick = N103Click
      end
    end
    object N30: TMenuItem
      Caption = #1059#1090#1080#1083#1080#1090#1099
      object N20071: TMenuItem
        Caption = #1063#1072#1089#1090#1086#1080#1089#1087#1086#1083#1100#1079#1091#1077#1084#1099#1077' '#1091#1090#1080#1083#1080#1090#1099
        object N49: TMenuItem
          Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1094#1077#1087#1086#1095#1077#1082
          OnClick = N49Click
          object N104: TMenuItem
            Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1094#1077#1087#1086#1095#1077#1082
            OnClick = N104Click
          end
          object N105: TMenuItem
            Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1089#1089#1099#1083#1086#1082' '#1085#1072' '#1086#1089#1085'. '#1084#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099
            OnClick = N105Click
          end
        end
        object N56: TMenuItem
          Caption = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090' '#1085#1072#1083#1086#1075#1086#1074' '#1079#1072' '#1087#1088#1086#1096#1083#1099#1077' '#1087#1077#1088#1080#1086#1076#1099
          object ActionRecalcPPSSFZ1: TMenuItem
            Action = ActionRecalcPPSSFZ
          end
          object ActionRecalcPersonForMonth1: TMenuItem
            Action = ActionRecalcNalogiAllPersonForPassMonthNew
          end
        end
        object N57: TMenuItem
          Caption = #1048#1085#1076#1077#1082#1089#1072#1094#1080#1103' '#1079#1072#1088#1072#1073#1086#1090#1085#1086#1081' '#1087#1083#1072#1090#1099' '#1079#1072' '#1091#1082#1072#1079#1072#1085#1085#1099#1081' '#1084#1077#1089#1103#1094
          OnClick = N57Click
        end
        object N34: TMenuItem
          Caption = #1057#1087#1080#1089#1086#1082' '#1074#1099#1087#1083#1072#1090
        end
        object N52: TMenuItem
          Caption = #1040#1074#1072#1085#1089' '#1074#1089#1077#1084
          OnClick = N52Click
        end
        object N110: TMenuItem
          Caption = #1060#1086#1088#1084#1072' 1'#1044#1060
          OnClick = N110Click
        end
        object N84: TMenuItem
          Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103' '#1085#1086#1074#1086#1075#1086' '#1084#1077#1089#1103#1094#1072
          OnClick = N84Click
        end
        object N92: TMenuItem
          Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1082#1072' '#1074#1089#1077#1093' '#1088#1072#1089#1095#1077#1090#1085#1099#1093' '#1083#1080#1089#1090#1082#1086#1074
          OnClick = N92Click
        end
        object N94: TMenuItem
          Caption = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090' '#1085#1072#1083#1086#1075#1086#1074' '#1079#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
          OnClick = N94Click
        end
        object N114: TMenuItem
          Action = ActionTryRestorePodr
          Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077' '#1074' '#1089#1083#1091#1095#1072#1077' '#1077#1075#1086' '#1087#1086#1090#1077#1088#1080
          Enabled = False
          Visible = False
        end
        object N117: TMenuItem
          Action = ActionSwodyCmp
        end
        object N123: TMenuItem
          Caption = #1055#1088#1086#1074#1077#1088#1082#1080
          object N124: TMenuItem
            Action = ActTestDuplicates
          end
          object N125: TMenuItem
            Action = ActionTestNadbAbsent
          end
          object N126: TMenuItem
            Action = ActionTestKRO
          end
        end
      end
      object N53: TMenuItem
        Caption = #1056#1072#1079#1086#1074#1099#1077' '#1091#1090#1080#1083#1080#1090#1099
        object N54: TMenuItem
          Caption = #1054#1090#1084#1077#1090#1082#1072' '#1087#1077#1085#1089#1080#1086#1085#1077#1088#1086#1074' '#1087#1086' '#1080#1076'.'#1082#1086#1076#1091
          OnClick = N54Click
        end
        object N010320081: TMenuItem
          Caption = #1055#1077#1088#1077#1085#1086#1089' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1072' '#1079#1072' 01-03 2013'
          OnClick = N010320081Click
        end
        object N20072: TMenuItem
          Caption = #1055#1077#1088#1089#1086#1085#1086#1092#1080#1082#1072#1094#1080#1103' 2009'
          OnClick = N20072Click
        end
        object N55: TMenuItem
          Caption = #1055#1077#1088#1077#1074#1086#1076' '#1092#1072#1084#1080#1083#1080#1081' '#1085#1072' '#1091#1082#1088' '#1103#1079#1099#1082
          OnClick = N55Click
        end
        object ApplicationCreateFormTFormListVyplFormListVypl1: TMenuItem
          Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1090#1072#1073#1077#1083#1103' '#1086#1090#1087#1091#1089#1082#1085#1099#1093' '#1074' 07 2013'
          OnClick = ApplicationCreateFormTFormListVyplFormListVypl1Click
        end
        object N74: TMenuItem
          Caption = #1057#1091#1084#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1074#1089#1077#1093' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093
          OnClick = N74Click
        end
        object N79: TMenuItem
          Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1085#1086#1074#1099#1093' '#1086#1082#1083#1072#1076#1086#1074' '#1087#1086' '#1088#1072#1079#1088#1103#1076#1072#1084
          OnClick = N79Click
        end
        object N83: TMenuItem
          Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1091#1085#1080#1082#1072#1083#1100#1085#1099#1093' '#1082#1086#1076#1086#1074' '#1088#1072#1073#1086#1090#1085#1080#1082#1072#1084
          OnClick = N83Click
        end
        object N96: TMenuItem
          Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1089#1090#1072#1090#1100#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1081
          OnClick = N96Click
        end
        object GUIDSQL1: TMenuItem
          Caption = #1055#1077#1088#1077#1085#1086#1089' GUID '#1074' SQL'
          OnClick = GUIDSQL1Click
        end
        object N20112: TMenuItem
          Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1090#1072#1073#1077#1083#1103' '#1074' '#1084#1072#1077' 2013 '#1076#1083#1103' '#1082#1086#1083#1077#1076#1078#1072
          OnClick = N20112Click
        end
        object N107: TMenuItem
          Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1045#1057#1042' '#1079#1072' '#1091#1082#1072#1079#1085#1085#1099#1081' '#1084#1077#1089#1103#1094
          OnClick = N107Click
        end
        object N111: TMenuItem
          Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077' '#1087#1088#1080#1079#1085#1072#1082#1086#1074' '#1083#1100#1075#1086#1090
          OnClick = N111Click
        end
        object N112: TMenuItem
          Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1091#1076#1077#1088#1078#1072#1085#1080#1081' '#1079#1072' '#1091#1082#1072#1079#1072#1085#1085#1099#1081' '#1084#1077#1089
          OnClick = N112Click
        end
        object N115: TMenuItem
          Action = ActionRestorePodrFromFile
        end
        object CNAutomatic1: TMenuItem
          Action = ActionRprCnAutomatic
        end
        object N20113: TMenuItem
          Action = ActionFormMoveOtpHelp2011
        end
        object N20114: TMenuItem
          Action = ActMovRecalcPod2012
        end
        object N119: TMenuItem
          Action = ActionDelRecen
        end
        object N102F41: TMenuItem
          Action = ActDelAllCn
        end
        object N122: TMenuItem
          Action = ActionMoveIskra
        end
      end
      object N20101: TMenuItem
        Caption = #1045#1076#1080#1085#1099#1081' '#1089#1086#1094'.'#1085#1072#1083#1086#1075
        object N20111: TMenuItem
          Caption = #1045#1057#1053' 2011'
          OnClick = N20111Click
        end
        object N20102: TMenuItem
          Caption = #1055#1077#1088#1089#1086#1085#1086#1092#1080#1082#1072#1094#1080#1103' 2010'
          OnClick = N20102Click
        end
      end
      object N76: TMenuItem
        Caption = #1063#1080#1089#1090#1082#1072' '#1074#1088#1077#1084#1077#1085#1085#1099#1093' '#1090#1072#1073#1083#1080#1094
        object N77: TMenuItem
          Caption = #1041#1086#1083#1100#1085#1080#1095#1085#1099#1077
          OnClick = N77Click
        end
        object N78: TMenuItem
          Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077
          OnClick = N78Click
        end
        object N106: TMenuItem
          Caption = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090#1099' '#1085#1072#1083#1086#1075#1086#1074
          OnClick = N106Click
        end
      end
      object N98: TMenuItem
        Caption = #1056#1077#1077#1089#1090#1088#1099' '#1041#1086#1083#1100#1085#1080#1095#1085#1099#1093' '#1083#1080#1089#1090#1082#1086#1074
        OnClick = N98Click
      end
      object N2012011: TMenuItem
        Action = ActionOtp201201
      end
      object ActionEkonom1: TMenuItem
        Action = ActionEkonom
        Caption = #1069#1082#1086#1085#1086#1084#1080#1103
      end
      object N121: TMenuItem
        Action = ActOtpUhod
      end
    end
    object N16: TMenuItem
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
      object N58: TMenuItem
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
        OnClick = N58Click
      end
      object N113: TMenuItem
        Action = ActionRclcPerson
      end
    end
    object N42: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1080
      object N60: TMenuItem
        Caption = #1043#1086#1076#1086#1074#1072#1103' '#1079#1072#1088#1087#1083#1072#1090#1072
        OnClick = N60Click
      end
      object N61: TMenuItem
        Caption = #1044#1086#1093#1086#1076' '#1079#1072' 6 '#1084#1077#1089#1103#1094#1077#1074
        OnClick = N61Click
      end
      object N87: TMenuItem
        Caption = #1044#1083#1103' '#1089#1091#1073#1089#1080#1076#1080#1080
        OnClick = N87Click
      end
    end
    object N59: TMenuItem
      Caption = #1055#1083#1072#1085#1086#1074#1099#1081' '#1086#1090#1076#1077#1083
      OnClick = N59Click
      object N86: TMenuItem
        Caption = #1057#1074#1086#1076' '#1087#1086' '#1076#1086#1083#1078#1085#1086#1089#1090#1103#1084
        OnClick = N86Click
      end
    end
    object N85: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = N85Click
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 144
    Top = 72
    object N8: TMenuItem
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      OnClick = N8Click
    end
    object N9: TMenuItem
      Caption = #1052#1077#1089#1103#1094
      OnClick = N9Click
    end
    object N10: TMenuItem
      Caption = #1050#1072#1076#1088#1099
      OnClick = N10Click
    end
    object N11: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnClick = N11Click
    end
    object N12: TMenuItem
      Caption = #1057#1086#1074#1084#1077#1097#1077#1085#1080#1103
      OnClick = N12Click
    end
    object F41: TMenuItem
      Caption = 'F4'
      OnClick = F41Click
    end
    object N13: TMenuItem
      Caption = #1058#1072#1073#1077#1083#1100
      OnClick = N13Click
    end
    object N26: TMenuItem
      Caption = #1040#1088#1093#1080#1074
      OnClick = N26Click
    end
    object N27: TMenuItem
      Caption = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090' '#1085#1072#1083#1086#1075#1086#1074
      OnClick = N27Click
    end
    object N35: TMenuItem
      Caption = #1041#1086#1083#1100#1085#1080#1095#1085#1099#1077' '#1083#1080#1089#1090#1082#1080
      OnClick = N35Click
    end
  end
  object ActionList1: TActionList
    Left = 80
    Top = 200
    object ActionChangePodr: TAction
      Caption = #1055#1076#1088
      OnExecute = N8Click
    end
    object ActionChangeNMES: TAction
      Caption = 'ActionChangeNMES'
      OnExecute = N9Click
    end
    object ActionF2: TAction
      Caption = 'ActionF2'
      OnExecute = N10Click
    end
    object ActionSave: TAction
      Caption = 'ActionSave'
      OnExecute = N11Click
    end
    object ActionSowm: TAction
      Caption = 'ActionSowm'
      OnExecute = N12Click
    end
    object ActionF3: TAction
      Caption = 'ActionF3'
      OnExecute = N13Click
    end
    object ActionF4: TAction
      Caption = 'ActionF4'
      OnExecute = F41Click
    end
    object ActionArcPerson: TAction
      Caption = 'ActionArcPerson'
      OnExecute = N26Click
    end
    object ActionRclcPerson: TAction
      Caption = 'ActionRclcPerson'
      OnExecute = N27Click
    end
    object ActionBolnPerson: TAction
      Caption = #1041#1083#1085
      OnExecute = ActionBolnPersonExecute
    end
    object ActionRecalcPPSSFZ: TAction
      Caption = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090' '#1085#1072#1083#1086#1075#1086#1074' '#1079#1072' '#1087#1088#1086#1096#1083#1099#1077' '#1084#1077#1089#1103#1094#1099' (SQL)'
      OnExecute = ActionRecalcPPSSFZExecute
    end
    object MemBud: TAction
      Caption = 'MemBud'
      OnExecute = MemBudExecute
    end
    object ActionRList: TAction
      Caption = 'ActionRList'
      OnExecute = ActionRListExecute
    end
    object ActionOtpPerson: TAction
      Caption = #1054#1090#1087
      OnExecute = ActionOtpPersonExecute
    end
    object ActionCalcPerson: TAction
      Caption = 'ActionCalcPerson'
      Hint = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090' '#1088#1072#1073#1086#1090#1085#1080#1082#1072' - '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080#1081
      ShortCut = 16464
      OnExecute = ActionCalcPersonExecute
    end
    object ActionReverseSwitch: TAction
      Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1082#1072
      ShortCut = 16463
      OnExecute = ActionReverseSwitchExecute
    end
    object ActionEditKadryClarion: TAction
      Caption = #1050#1076#1088
      OnExecute = ActionEditKadryClarionExecute
    end
    object ActionPlat: TAction
      Caption = #1055#1083#1090
      OnExecute = ActionPlatExecute
    end
    object ActionListPersonSta: TAction
      Caption = #1051#1055#1057
    end
    object ActionTestRecalcPerson: TAction
      Caption = #1056#1050#1051
      OnExecute = ActionTestRecalcPersonExecute
    end
    object ActionRecalcPodr: TAction
      Caption = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
      OnExecute = ActionRecalcPodrExecute
    end
    object ActionKomandirowkiPerson: TAction
      Caption = #1050#1084#1076
      OnExecute = ActionKomandirowkiPersonExecute
    end
    object ActionEditSwid: TAction
      Caption = #1053#1057#1057
      Hint = #1053#1086#1084#1077#1088#1072' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074' '#1089#1086#1094'.'#1089#1090#1088#1072#1093#1072
      OnExecute = ActionEditSwidExecute
    end
    object ActionRecalcPersonForMonth: TAction
      Caption = 'ActionRecalcPersonForMonth'
      OnExecute = ActionRecalcPersonForMonthExecute
    end
    object actAnalyzeNalogi2011: TAction
      Caption = 'actAnalyzeNalogi2011'
      OnExecute = actAnalyzeNalogi2011Execute
    end
    object ActionReclacPersonWithMode: TAction
      Caption = 'P'#1079#1058
      Hint = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090' '#1074#1089#1077#1093' '#1089#1090#1088#1086#1082' '#1088#1072#1073#1086#1090#1085#1080#1082#1072
      OnExecute = ActionReclacPersonWithModeExecute
    end
    object ActionRecalcPersonWithMode1: TAction
      Caption = 'P'#1079'%'
      Hint = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090' '#1090#1086#1083#1100#1082#1086' '#1101#1090#1086#1081' '#1089#1090#1088#1086#1082#1080' (%)'
      OnExecute = ActionRecalcPersonWithMode1Execute
    end
    object ActionPersonO: TAction
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1054
      OnExecute = ActionPersonOExecute
    end
    object ActionRecalcNalogiAllPersonForPassMonthNew: TAction
      Caption = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090' '#1085#1072#1083#1086#1075#1086#1074' '#1079#1072' '#1087#1088#1086#1096#1083#1099#1077' '#1084#1077#1089#1103#1094#1099' (27 09 2011)'
      OnExecute = ActionRecalcNalogiAllPersonForPassMonthNewExecute
    end
    object ActionTryRestorePodr: TAction
      Caption = #1042#1089#1090
      OnExecute = ActionTryRestorePodrExecute
    end
    object ActionRestorePodrFromFile: TAction
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077' '#1080#1079' '#1092#1072#1081#1083#1072
      OnExecute = ActionRestorePodrFromFileExecute
    end
    object ActionPochasSwod: TAction
      Caption = 'ActionPochasSwod'
      OnExecute = ActionPochasSwodExecute
    end
    object ActionOtp201201: TAction
      Caption = #1057#1087#1080#1089#1086#1082' '#1086#1090#1087#1091#1089#1082#1086#1074' 2012 01'
      OnExecute = ActionOtp201201Execute
    end
    object ActionRprCnAutomatic: TAction
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' CN Automatic'
      OnExecute = ActionRprCnAutomaticExecute
    end
    object ActionFormMoveOtpHelp2011: TAction
      Caption = #1052#1086#1076#1080#1092#1080#1082#1072#1094#1080#1103' '#1086#1090#1087#1091#1089#1082#1085#1099#1093' '#1074' 2011'
      OnExecute = ActionFormMoveOtpHelp2011Execute
    end
    object ActionEkonom: TAction
      Caption = 'ActionEkonom'
      OnExecute = ActionEkonomExecute
    end
    object ActionEditInfProc: TAction
      Caption = #1055#1088#1086#1094#1077#1085#1090#1099' '#1080#1085#1092#1083#1103#1094#1080#1080
      OnExecute = ActionEditInfProcExecute
    end
    object ActionSwodyCmp: TAction
      Caption = #1057#1088#1072#1074#1085#1080#1090#1100' '#1089#1074#1086#1076#1099
      OnExecute = ActionSwodyCmpExecute
    end
    object ActTestDuplicates: TAction
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1079#1072#1076#1074#1086#1077#1085#1080#1103' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
      OnExecute = ActTestDuplicatesExecute
    end
    object ActIndexPersonCalc: TAction
      Caption = #1048#1085#1076
      OnExecute = ActIndexPersonCalcExecute
    end
    object ActMovRecalcPod2012: TAction
      Caption = #1055#1077#1088#1077#1085#1086#1089' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1072' '#1087#1086#1076'.'#1085#1072#1083#1086#1075#1072' '#1079#1072' 2012'
      OnExecute = ActMovRecalcPod2012Execute
    end
    object ActionDelRecen: TAction
      Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1088#1077#1094#1077#1085#1079#1077#1085#1090#1086#1074' '#1073#1077#1079' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
      OnExecute = ActionDelRecenExecute
    end
    object ActionTestKRO: TAction
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1089#1086#1086#1090#1074#1077#1089#1090#1074#1080#1103' '#1082#1086#1101#1092#1080#1094#1080#1077#1085#1090#1086#1074', '#1088#1072#1079#1088#1103#1076#1086#1074' '#1080' '#1086#1082#1083#1072#1076#1086#1074
      OnExecute = ActionTestKROExecute
    end
    object ActDelAllCn: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1085#1085#1099#1081' 102-'#1081' '#1096#1080#1092#1088' '#1074' F4 '#1091' '#1074#1089#1077#1093
      OnExecute = ActDelAllCnExecute
    end
    object ActOtpUhod: TAction
      Caption = #1057#1087#1080#1089#1086#1082' '#1086#1090#1087#1091#1089#1082#1086#1074' '#1087#1086' '#1091#1093#1086#1076#1091' '#1079#1072' '#1088#1077#1073#1077#1085#1082#1086#1084
      OnExecute = ActOtpUhodExecute
    end
    object ActionMoveIskra: TAction
      Caption = #1047#1072#1087#1086#1083#1085#1077#1085#1080#1077' '#1048#1089#1082#1088#1099
      OnExecute = ActionMoveIskraExecute
    end
    object ActionTestNadbAbsent: TAction
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1102#1097#1080#1093' '#1085#1072#1076#1073#1072#1074#1086#1082' '#1087#1088#1080' '#1087#1077#1088#1077#1085#1086#1089#1077' '#1086#1090#1087#1091#1089#1082#1085#1099#1093
      OnExecute = ActionTestNadbAbsentExecute
    end
  end
  object ImageList1: TImageList
    Left = 216
    Top = 216
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000800000008000000080000000800000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008000000080000000800000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080000000800000008000000080000000800000008000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000800000008000000080000000800000008000000080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008000000080000000FF000000FF000000FF000000800000008000000080
      0000000000000000000000000000000000000000000000000000000000000000
      000000008000000080000000FC000000FC000000FC0000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      00000080000000FF000000FF000000FF000000FF000000FF0000008000000080
      0000008000000000000000000000000000000000000000000000000000000000
      8000000080000000FC000000FC000000FC000000FC000000FC00000080000000
      8000000080000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000080
      0000008000000000000000000000000000000000000000000000000000000000
      80000000FC000000FC000000FC000000FC000000FC000000FC000000FC000000
      8000000080000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000080
      0000008000000000000000000000000000000000000000000000000000000000
      80000000FC000000FC000000FC000000FC000000FC000000FC000000FC000000
      8000000080000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000080
      0000008000000000000000000000000000000000000000000000000000000000
      80000000FC000000FC000000FC000000FC000000FC000000FC000000FC000000
      8000000080000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000080000000FF000000FF000000FF000000FF000000FF0000008000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000080000000FC000000FC000000FC000000FC000000FC00000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080000000FF000000FF000000FF000000800000008000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000080000000FC000000FC000000FC0000008000000080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000800000008000000080000000800000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008000000080000000800000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFFFFFFFF0000
      FFFFFFFFFFFF0000FC3FFC3FFC3F0000F81FF81FFC3F0000F00FF00FFC3F0000
      E007E007FC3F0000E007E007E0070000E007E007E0070000E007E007E0070000
      F00FF00FE0070000F81FF81FFC3F0000FC3FFC3FFC3F0000FFFFFFFFFC3F0000
      FFFFFFFFFFFF0000FFFFFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
  object TimerMain: TTimer
    Interval = 100
    OnTimer = TimerMainTimer
    Left = 336
    Top = 200
  end
  object TimerSavePodr: TTimer
    Interval = 300000000
    OnTimer = TimerSavePodrTimer
    Left = 392
    Top = 200
  end
  object cdsMain: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'State'
        DataType = ftInteger
      end
      item
        Name = 'Tabno'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'FIO'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'F1'
        Attributes = [faReadonly]
        DataType = ftFloat
      end
      item
        Name = 'F2'
        Attributes = [faReadonly]
        DataType = ftFloat
      end
      item
        Name = 'F3'
        Attributes = [faReadonly]
        DataType = ftFloat
      end
      item
        Name = 'F4'
        Attributes = [faReadonly]
        DataType = ftFloat
      end
      item
        Name = 'F5'
        Attributes = [faReadonly]
        DataType = ftFloat
      end
      item
        Name = 'F6'
        Attributes = [faReadonly]
        DataType = ftFloat
      end
      item
        Name = 'F7'
        Attributes = [faReadonly]
        DataType = ftFloat
      end
      item
        Name = 'F8'
        Attributes = [faReadonly]
        DataType = ftFloat
      end
      item
        Name = 'F9'
        Attributes = [faReadonly]
        DataType = ftFloat
      end
      item
        Name = 'F10'
        Attributes = [faReadonly]
        DataType = ftFloat
      end
      item
        Name = 'F11'
        Attributes = [faReadonly]
        DataType = ftFloat
      end
      item
        Name = 'F12'
        Attributes = [faReadonly]
        DataType = ftFloat
      end
      item
        Name = 'Hint'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 200
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 504
    Top = 208
    Data = {
      EE0000009619E0BD010000001800000010000000000003000000EE0005537461
      74650400010000000000055461626E6F04000100020000000346494F01004900
      0200010005574944544802000200140002463108000400020000000246320800
      0400020000000246330800040002000000024634080004000200000002463508
      0004000200000002463608000400020000000246370800040002000000024638
      0800040002000000024639080004000200000003463130080004000200000003
      46313108000400020000000346313208000400020000000448696E7401004900
      0200010005574944544802000200C8000000}
    object cdsMainState: TIntegerField
      FieldName = 'State'
    end
    object cdsMainTabno: TIntegerField
      FieldName = 'Tabno'
      ReadOnly = True
    end
    object cdsMainFIO: TStringField
      FieldName = 'FIO'
      ReadOnly = True
    end
    object cdsMainF1: TFloatField
      FieldName = 'F1'
      ReadOnly = True
    end
    object cdsMainF2: TFloatField
      FieldName = 'F2'
      ReadOnly = True
    end
    object cdsMainF3: TFloatField
      FieldName = 'F3'
      ReadOnly = True
    end
    object cdsMainF4: TFloatField
      FieldName = 'F4'
      ReadOnly = True
    end
    object cdsMainF5: TFloatField
      FieldName = 'F5'
      ReadOnly = True
    end
    object cdsMainF6: TFloatField
      FieldName = 'F6'
      ReadOnly = True
    end
    object cdsMainF7: TFloatField
      FieldName = 'F7'
      ReadOnly = True
      Visible = False
    end
    object cdsMainF8: TFloatField
      FieldName = 'F8'
      ReadOnly = True
      Visible = False
    end
    object cdsMainF9: TFloatField
      FieldName = 'F9'
      ReadOnly = True
      Visible = False
    end
    object cdsMainF10: TFloatField
      FieldName = 'F10'
      ReadOnly = True
      Visible = False
    end
    object cdsMainF11: TFloatField
      FieldName = 'F11'
      ReadOnly = True
      Visible = False
    end
    object cdsMainF12: TFloatField
      FieldName = 'F12'
      ReadOnly = True
      Visible = False
    end
    object cdsMainHint: TStringField
      FieldName = 'Hint'
      ReadOnly = True
      Visible = False
      Size = 200
    end
  end
end
