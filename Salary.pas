{$WARNINGS OFF}
{$HINTS OFF}

unit Salary;
                    
interface                  
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, ComCtrls, ActnList, ToolWin, ImgList, StdCtrls,
  ExtCtrls, FIBDatabase, USMessages, DB, IBDatabase;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;              
    N2: TMenuItem;
    N3: TMenuItem;
    StringGrid1: TStringGrid;
    N6: TMenuItem;
    DBF1: TMenuItem;
    N7: TMenuItem;
    PopupMenu1: TPopupMenu;
    N8: TMenuItem;
    N9: TMenuItem;
    StringGrid2: TStringGrid;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    F41: TMenuItem;
    N13: TMenuItem;
    FireBird: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    N28: TMenuItem;
    N29: TMenuItem;
    ToolButton7: TToolButton;
    ActionList1: TActionList;
    ActionChangePodr: TAction;
    ActionChangeNMES: TAction;
    ActionF2: TAction;
    ActionSave: TAction;
    ActionSowm: TAction;
    ActionF3: TAction;
    ActionF4: TAction;
    ActionArcPerson: TAction;
    ActionRclcPerson: TAction;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ActionBolnPerson: TAction;
    ToolButton10: TToolButton;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    ActionRecalcPPSSFZ: TAction;
    N30: TMenuItem;
    MemBud: TAction;
    ToolButton11: TToolButton;
    N32: TMenuItem;
    N33: TMenuItem;
    ActionRList: TAction;
    ToolButton12: TToolButton;
    N35: TMenuItem;
    ActionOtpPerson: TAction;
    ToolButton13: TToolButton;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    ActionCalcPerson: TAction;
    ActionReverseSwitch: TAction;
    ActionEditKadryClarion: TAction;
    ToolButton14: TToolButton;
    TimerMain: TTimer;
    ActionPlat: TAction;
    ToolButton15: TToolButton;
    ActionListPersonSta: TAction;
    N43: TMenuItem;
    ActionTestRecalcPerson: TAction;
    ToolButton16: TToolButton;
    N44: TMenuItem;
    N45: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    N51: TMenuItem;
    N50: TMenuItem;
    N20071: TMenuItem;
    N53: TMenuItem;
    N54: TMenuItem;
    N010320081: TMenuItem;
    N20072: TMenuItem;
    N55: TMenuItem;
    N49: TMenuItem;
    N56: TMenuItem;
    N57: TMenuItem;
    N34: TMenuItem;
    ApplicationCreateFormTFormListVyplFormListVypl1: TMenuItem;
    N42: TMenuItem;
    N58: TMenuItem;
    N59: TMenuItem;
    N60: TMenuItem;
    N61: TMenuItem;
    Excel1: TMenuItem;
    FastReport1: TMenuItem;
    N62: TMenuItem;
    N63: TMenuItem;
    N64: TMenuItem;
    N65: TMenuItem;
    N66: TMenuItem;
    N67: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N31: TMenuItem;
    N52: TMenuItem;
    ActionRecalcPodr: TAction;
    N68: TMenuItem;
    N69: TMenuItem;
    N70: TMenuItem;
    NSecretWorker: TMenuItem;
    N72: TMenuItem;
    N73: TMenuItem;
    N20101: TMenuItem;
    N74: TMenuItem;
    ActionKomandirowkiPerson: TAction;
    ToolButton17: TToolButton;
    N75: TMenuItem;
    N76: TMenuItem;
    N77: TMenuItem;
    N78: TMenuItem;
    N79: TMenuItem;
    N110: TMenuItem;
    N80: TMenuItem;
    N81: TMenuItem;
    N82: TMenuItem;
    N83: TMenuItem;
    NGenNewMonth: TMenuItem;
    N85: TMenuItem;
    N86: TMenuItem;
    N87: TMenuItem;
    N88: TMenuItem;
    N89: TMenuItem;
    N90: TMenuItem;
    N91: TMenuItem;
    N92: TMenuItem;
    N94: TMenuItem;
    N93: TMenuItem;
    N96: TMenuItem;
    GUIDSQL1: TMenuItem;
    N95: TMenuItem;
    N20111: TMenuItem;
    N97: TMenuItem;
    ActionEditSwid: TAction;
    N98: TMenuItem;
    N99: TMenuItem;
    N100: TMenuItem;
    N101: TMenuItem;
    N103: TMenuItem;
    N20112: TMenuItem;
    N104: TMenuItem;
    N105: TMenuItem;
    ToolButton18: TToolButton;
    ActionRecalcPersonForMonth: TAction;
    ToolButton19: TToolButton;
    N107: TMenuItem;
    actAnalyzeNalogi2011: TAction;
    ToolButton20: TToolButton;
    N106: TMenuItem;
    ActionReclacPersonWithMode: TAction;
    ToolButton21: TToolButton;
    ActionRecalcPersonWithMode1: TAction;
    ToolButton22: TToolButton;
    N109: TMenuItem;
    N111: TMenuItem;
    N112: TMenuItem;
    ActionPersonO: TAction;
    N113: TMenuItem;
    ActionRecalcNalogiAllPersonForPassMonthNew: TAction;
    ActionRecalcPPSSFZ1: TMenuItem;
    ActionRecalcPersonForMonth1: TMenuItem;
    TimerSavePodr: TTimer;
    ActionTryRestorePodr: TAction;
    N114: TMenuItem;
    ActionRestorePodrFromFile: TAction;
    N115: TMenuItem;
    ActionPochasSwod: TAction;
    ActionPochasSwod1: TMenuItem;
    ActionOtp201201: TAction;
    N2012011: TMenuItem;
    ActionRprCnAutomatic: TAction;
    CNAutomatic1: TMenuItem;
    ActionFormMoveOtpHelp2011: TAction;
    N20113: TMenuItem;
    ActionEkonom: TAction;
    ActionEkonom1: TMenuItem;
    ActionEditInfProc: TAction;
    N116: TMenuItem;
    ActionSwodyCmp: TAction;
    N117: TMenuItem;
    ActTestDuplicates: TAction;
    ActIndexPersonCalc: TAction;
    ToolButton23: TToolButton;
    ActMovRecalcPod2012: TAction;
    N20114: TMenuItem;
    ActionDelRecen: TAction;
    N119: TMenuItem;
    ActionTestKRO: TAction;
    ActDelAllCn: TAction;
    N102F41: TMenuItem;
    ActOtpUhod: TAction;
    N121: TMenuItem;
    ActionMoveIskra: TAction;
    N122: TMenuItem;
    ActionTestNadbAbsent: TAction;
    N123: TMenuItem;
    N124: TMenuItem;
    N125: TMenuItem;
    N126: TMenuItem;
    ActionBrowseKadryFB: TAction;
    ActionMoveDatesUwol: TAction;
    N118: TMenuItem;
    ActionRepInvalidNalogi: TAction;
    N120: TMenuItem;
    ActionMoveSZ2014: TAction;
    N128: TMenuItem;
    actReturnSZV2014: TAction;
    N20141: TMenuItem;
    N20142: TMenuItem;
    N20143: TMenuItem;
    actZeroSZ2014: TAction;
    N020141: TMenuItem;
    actLimitSummy2014: TAction;
    N127: TMenuItem;
    actListLgotyDeti: TAction;
    N129: TMenuItem;
    actRepDolgHostel: TAction;
    N130: TMenuItem;
    N131: TMenuItem;
    N132: TMenuItem;
    actMakeOtp2014: TAction;
    N20144: TMenuItem;
    actDelNaUd: TAction;
    N20145: TMenuItem;
    actReMakeOtp14: TAction;
    N14101: TMenuItem;
    actListLNR: TAction;
    Nlnr1: TMenuItem;
    actVyplToExcelKo: TAction;
    NLNR2: TMenuItem;
    actRestPerson: TAction;
    NLNRREST: TMenuItem;
    WIndows1: TMenuItem;
    actGetPassSaldo: TAction;
    N71LNR: TMenuItem;
    N71: TMenuItem;
    actStartIOTest: TAction;
    N108: TMenuItem;
    ActionRptPersonDog: TAction;
    N133: TMenuItem;
    actTemySwodOld: TAction;
    actTemySwodNew27022015: TAction;
    N134: TMenuItem;
    N135: TMenuItem;
    actSwodGannaMShtat: TAction;
    N136: TMenuItem;
    ActionRepPensInv: TAction;
    N137: TMenuItem;
    ActionEditParam: TAction;
    N138: TMenuItem;
    ActionRepSowmInOut: TAction;
    N139: TMenuItem;
    ActionPrikazyPerson: TAction;
    ToolButton24: TToolButton;
    ActionPrikazyTyp: TAction;
    N140: TMenuItem;
    ActionVyplLnr: TAction;
    N141: TMenuItem;
    actTestGenera: TAction;
    mniTestGenera: TMenuItem;
    ActionRepSummyLessMinSal: TAction;
    N142: TMenuItem;
    ActionEditVipTabnos: TAction;
    N143: TMenuItem;
    ActionSwodOtp: TAction;
    N144: TMenuItem;
    ActionFindPerson: TAction;
    N145: TMenuItem;
    actExportForPlanovLNR: TAction;
    mniExportForPlanovLNR: TMenuItem;
    N146: TMenuItem;
    ActionRptTestPodoh: TAction;
    N147: TMenuItem;
    ActionSvdn22: TAction;
    N221: TMenuItem;
    ActionProjsojuzList: TAction;
    N148: TMenuItem;
    ActionTestMissing: TAction;
    N149: TMenuItem;
    N150: TMenuItem;
    N151: TMenuItem;
    N152: TMenuItem;
    ActionExportKadryToMedok: TAction;
    N210: TMenuItem;
    N153: TMenuItem;
    ActionFRXTable: TAction;
    N155: TMenuItem;
    ActionFRXTablePerson: TAction;
    ToolButton25: TToolButton;
    ActionDepBrowse: TAction;
    N154: TMenuItem;
    ActionCheckRazrPerson: TAction;
    N156: TMenuItem;
    N157: TMenuItem;
    ActionFindUwolPerson: TAction;
    N310820151: TMenuItem;
    ActionFormPlan160916: TAction;
    N158: TMenuItem;
    ActionSwodInvalidy: TAction;
    N222: TMenuItem;
    N159: TMenuItem;
    N211: TMenuItem;
    N310: TMenuItem;
    ActionReportRecalcNalogi: TAction;
    N161: TMenuItem;
    ActionFRXSwodAlla: TAction;
    N160: TMenuItem;
    ActionClear82: TAction;
    N821: TMenuItem;
    ActionReport148: TAction;
    N162: TMenuItem;
    ActionCvtXMLGrnToRub: TAction;
    NCvtGrnToRub: TMenuItem;
    ActionReportOsnWorker: TAction;
    N163: TMenuItem;
    ActionRepAUPPPS: TAction;
    NAUP_PPS: TMenuItem;
    NGTLIMITLNR: TMenuItem;
    ActionRepairTabelUwol062017: TAction;
    N300620171: TMenuItem;
    ActionRecalcNightFor062017: TAction;
    N0620171: TMenuItem;
    ActionChangeTabno: TAction;
    N164: TMenuItem;
    ActionChangeWorkingNMES: TAction;
    N165: TMenuItem;
    N166: TMenuItem;
    N167: TMenuItem;
    ActionMoveSwod0417: TAction;
    Excel0420171: TMenuItem;
    ActionRepWorkersForPlan: TAction;
    RepWorkersForPlan: TMenuItem;
    ActionGenerate: TAction;
    N168: TMenuItem;
    N010720181: TMenuItem;
    N010720101: TMenuItem;
    ActionFormMonthGener: TAction;
    NFormMonthGener: TMenuItem;
    ActionBrowseDogovora: TAction;
    N169: TMenuItem;
    NDogovora: TMenuItem;
    ActionRepPomKOtp: TAction;
    ActionTest: TAction;
    ActionTestCrossSaving: TAction;
    N170: TMenuItem;
    N171: TMenuItem;
    N172: TMenuItem;
    N173: TMenuItem;
    N174: TMenuItem;
    ActionTestAwans: TAction;
    N84: TMenuItem;
    ActionRecalcJan2019: TAction;
    N20191: TMenuItem;
    ActionRepClocks: TAction;
    N175: TMenuItem;
    ActionRepRazr: TAction;
    N176: TMenuItem;
    ActionRepNeSovpRazrOkl: TAction;
    N177: TMenuItem;
    ActionRepPlanFondy: TAction;
    N178: TMenuItem;
    ActionRepPensionery: TAction;
    N179: TMenuItem;
    ActionBrowseDekrList: TAction;
    N180: TMenuItem;
    ActionRepFondySVDN: TAction;
    NFondySVDN: TMenuItem;
    ActionDeleteViruses: TAction;
    nViruses: TMenuItem;
    ActionCorrectVyplaty: TAction;
    N181: TMenuItem;
    ActionBrowsePrikazy: TAction;
    N182: TMenuItem;
    ActionRepKRU: TAction;
    NKRU: TMenuItem;
    N183: TMenuItem;
    N184: TMenuItem;
    L1: TMenuItem;
    N20201: TMenuItem;
    NImportNadb: TMenuItem;
    ActionBrowseNadbPlanoviy: TAction;
    ActionRepKRURusDNR: TAction;
    N185: TMenuItem;
    ActionRepBolnPlan: TAction;
    N186: TMenuItem;
    ActionCheckKassaBank: TAction;
    NCheckKassBank: TMenuItem;
    ActionMove156LNR: TAction;
    NMove156LNR: TMenuItem;
    N187: TMenuItem;
    procedure N4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N6Click(Sender: TObject);
    procedure DBF1Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure StringGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure F41Click(Sender: TObject);
    procedure FireBird1Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure FireBirdClick(Sender: TObject);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N15Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure ActionBolnPersonExecute(Sender: TObject);
    procedure SwitchConnectionStatus(bStatus: byte);
    procedure SwitchTransactionStatus(bStatus: byte);
    procedure StatusMessage(S:String);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure FormPaint(Sender: TObject);
    procedure ActionRecalcPPSSFZExecute(Sender: TObject);
    procedure N20051Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure MemBudExecute(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure ActionRListExecute(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure ActionOtpPersonExecute(Sender: TObject);
    procedure ActionCalcPersonExecute(Sender: TObject);
    procedure ActionReverseSwitchExecute(Sender: TObject);
    procedure ActionEditKadryClarionExecute(Sender: TObject);
    procedure TimerMainTimer(Sender: TObject);
    procedure StartTransactionSal;
    procedure StartTransactionArc;
    procedure EndTransactionArc;
    procedure EndTransactionSal;
    procedure ActionPlatExecute(Sender: TObject);
    procedure N43Click(Sender: TObject);
    procedure ActionTestRecalcPersonExecute(Sender: TObject);
    procedure N45Click(Sender: TObject);
    procedure N46Click(Sender: TObject);
    procedure N47Click(Sender: TObject);
    procedure N48Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure N52Click(Sender: TObject);
    procedure N54Click(Sender: TObject);
    procedure N010320081Click(Sender: TObject);
    procedure N20072Click(Sender: TObject);
    procedure N55Click(Sender: TObject);
    procedure N49Click(Sender: TObject);
    procedure N56Click(Sender: TObject);
    procedure N57Click(Sender: TObject);
    procedure N58Click(Sender: TObject);
    procedure N60Click(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure FastReport1Click(Sender: TObject);
    procedure N63Click(Sender: TObject);
    procedure N65Click(Sender: TObject);
    procedure N64Click(Sender: TObject);
    procedure N66Click(Sender: TObject);
    procedure N67Click(Sender: TObject);
    procedure ActionRecalcPodrExecute(Sender: TObject);
    procedure N59Click(Sender: TObject);
    procedure N68Click(Sender: TObject);
    procedure N69Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N70Click(Sender: TObject);
    procedure ApplicationCreateFormTFormListVyplFormListVypl1Click(
      Sender: TObject);
    procedure NSecretWorkerClick(Sender: TObject);
    procedure N72Click(Sender: TObject);
    procedure N73Click(Sender: TObject);
    procedure N74Click(Sender: TObject);
    procedure ActionKomandirowkiPersonExecute(Sender: TObject);
    procedure N75Click(Sender: TObject);
    procedure N77Click(Sender: TObject);
    procedure N78Click(Sender: TObject);
    procedure N79Click(Sender: TObject);
    procedure N110Click(Sender: TObject);
    procedure N80Click(Sender: TObject);
    procedure N82Click(Sender: TObject);
    procedure N83Click(Sender: TObject);
    procedure N84Click(Sender: TObject);
    procedure N85Click(Sender: TObject);
    procedure N86Click(Sender: TObject);
    procedure N87Click(Sender: TObject);
    procedure N89Click(Sender: TObject);
    procedure N90Click(Sender: TObject);
    procedure N91Click(Sender: TObject);
    procedure N92Click(Sender: TObject);
    procedure N94Click(Sender: TObject);
    procedure N93Click(Sender: TObject);
    procedure N96Click(Sender: TObject);
    procedure GUIDSQL1Click(Sender: TObject);
    procedure N95Click(Sender: TObject);
    procedure N20102Click(Sender: TObject);
    procedure N20111Click(Sender: TObject);
    procedure ActionEditSwidExecute(Sender: TObject);
    procedure N97Click(Sender: TObject);
    procedure N98Click(Sender: TObject);
    procedure N100Click(Sender: TObject);
    procedure N101Click(Sender: TObject);
    procedure N103Click(Sender: TObject);
    procedure N20112Click(Sender: TObject);
    procedure N105Click(Sender: TObject);
    procedure N104Click(Sender: TObject);
    procedure ActionRecalcPersonForMonthExecute(Sender: TObject);
    procedure N107Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actAnalyzeNalogi2011Execute(Sender: TObject);
    procedure N106Click(Sender: TObject);
    procedure ActionReclacPersonWithModeExecute(Sender: TObject);
    procedure ActionRecalcPersonWithMode1Execute(Sender: TObject);
    procedure N108Click(Sender: TObject);
    procedure N109Click(Sender: TObject);
    procedure N111Click(Sender: TObject);
    procedure N112Click(Sender: TObject);
    procedure ActionPersonOExecute(Sender: TObject);
    procedure ActionRecalcNalogiAllPersonForPassMonthNewExecute(
      Sender: TObject);
    procedure TimerSavePodrTimer(Sender: TObject);
    procedure ActionTryRestorePodrExecute(Sender: TObject);
    procedure ActionRestorePodrFromFileExecute(Sender: TObject);
    procedure ActionPochasSwodExecute(Sender: TObject);
    procedure ActionOtp201201Execute(Sender: TObject);
    procedure ActionRprCnAutomaticExecute(Sender: TObject);
    procedure ActionFormMoveOtpHelp2011Execute(Sender: TObject);
    procedure ActionEkonomExecute(Sender: TObject);
    procedure ActionEditInfProcExecute(Sender: TObject);
    procedure ActionSwodyCmpExecute(Sender: TObject);
    procedure ActTestDuplicatesExecute(Sender: TObject);
    procedure ActIndexPersonCalcExecute(Sender: TObject);
    procedure ActMovRecalcPod2012Execute(Sender: TObject);
    procedure ActionDelRecenExecute(Sender: TObject);
    procedure ActionTestKROExecute(Sender: TObject);
    procedure ActDelAllCnExecute(Sender: TObject);
    procedure ActOtpUhodExecute(Sender: TObject);
    procedure ActionMoveIskraExecute(Sender: TObject);
    procedure ActionTestNadbAbsentExecute(Sender: TObject);
    procedure ActionBrowseKadryFBExecute(Sender: TObject);
    procedure ActionMoveDatesUwolExecute(Sender: TObject);
    procedure ActionRepInvalidNalogiExecute(Sender: TObject);
    procedure ActionMoveSZ2014Execute(Sender: TObject);
    procedure N128Click(Sender: TObject);
    procedure actReturnSZV2014Execute(Sender: TObject);
    procedure actZeroSZ2014Execute(Sender: TObject);
    procedure actLimitSummy2014Execute(Sender: TObject);
    procedure actListLgotyDetiExecute(Sender: TObject);
    procedure actRepDolgHostelExecute(Sender: TObject);
    procedure N131Click(Sender: TObject);
    procedure actMakeOtp2014Execute(Sender: TObject);
    procedure actDelNaUdExecute(Sender: TObject);
    procedure actReMakeOtp14Execute(Sender: TObject);
    procedure actListLNRExecute(Sender: TObject);
    procedure actVyplToExcelKoExecute(Sender: TObject);
    procedure actRestPersonExecute(Sender: TObject);
    procedure WIndows1Click(Sender: TObject);
    procedure actGetPassSaldoExecute(Sender: TObject);
    procedure N71Click(Sender: TObject);
    procedure actStartIOTestExecute(Sender: TObject);
    procedure ActionRptPersonDogExecute(Sender: TObject);
    procedure actTemySwodOldExecute(Sender: TObject);
    procedure actTemySwodNew27022015Execute(Sender: TObject);
    procedure actSwodGannaMShtatExecute(Sender: TObject);
    procedure ActionRepPensInvExecute(Sender: TObject);
    procedure ActionEditParamExecute(Sender: TObject);
    procedure ActionRepSowmInOutExecute(Sender: TObject);
    procedure ActionPrikazyPersonExecute(Sender: TObject);
    procedure ActionPrikazyTypExecute(Sender: TObject);
    procedure ActionVyplLnrExecute(Sender: TObject);
    procedure actTestGeneraExecute(Sender: TObject);
    procedure ActionRepSummyLessMinSalExecute(Sender: TObject);
    procedure ActionEditVipTabnosExecute(Sender: TObject);
    procedure ActionSwodOtpExecute(Sender: TObject);
    procedure ActionFindPersonExecute(Sender: TObject);
    procedure actExportForPlanovLNRExecute(Sender: TObject);
    procedure N146Click(Sender: TObject);
    procedure ActionRptTestPodohExecute(Sender: TObject);
    procedure ActionSvdn22Execute(Sender: TObject);
    procedure ActionProjsojuzListExecute(Sender: TObject);
    procedure ActionTestMissingExecute(Sender: TObject);
    procedure ActionExportKadryToMedokExecute(Sender: TObject);
    procedure ActionFRXTableExecute(Sender: TObject);
    procedure ActionFRXTablePersonExecute(Sender: TObject);
    procedure ActionDepBrowseExecute(Sender: TObject);
    procedure ActionCheckRazrPersonExecute(Sender: TObject);
    procedure N157Click(Sender: TObject);
    procedure ActionFindUwolPersonExecute(Sender: TObject);
    procedure ActionFormPlan160916Execute(Sender: TObject);
    procedure ActionSwodInvalidyExecute(Sender: TObject);
    procedure N211Click(Sender: TObject);
    procedure N310Click(Sender: TObject);
    procedure ActionReportRecalcNalogiExecute(Sender: TObject);
    procedure ActionFRXSwodAllaExecute(Sender: TObject);
    procedure ActionClear82Execute(Sender: TObject);
    procedure ActionReport148Execute(Sender: TObject);
    procedure ActionCvtXMLGrnToRubExecute(Sender: TObject);
    procedure ActionReportOsnWorkerExecute(Sender: TObject);
    procedure ActionRepAUPPPSExecute(Sender: TObject);
    procedure NGTLIMITLNRClick(Sender: TObject);
    procedure ActionRepairTabelUwol062017Execute(Sender: TObject);
    procedure ActionRecalcNightFor062017Execute(Sender: TObject);
    procedure ActionChangeTabnoExecute(Sender: TObject);
    procedure ActionChangeWorkingNMESExecute(Sender: TObject);
    procedure N165Click(Sender: TObject);
    procedure N166Click(Sender: TObject);
    procedure N167Click(Sender: TObject);
    procedure ActionMoveSwod0417Execute(Sender: TObject);
    procedure ActionRepWorkersForPlanExecute(Sender: TObject);
    procedure ActionGenerateExecute(Sender: TObject);
    procedure N010720181Click(Sender: TObject);
    procedure ActionFormMonthGenerExecute(Sender: TObject);
    procedure ActionBrowseDogovoraExecute(Sender: TObject);
    procedure ActionRepPomKOtpExecute(Sender: TObject);
    procedure ActionTestCrossSavingExecute(Sender: TObject);
    procedure ActionTestAwansExecute(Sender: TObject);
    procedure ActionRecalcJan2019Execute(Sender: TObject);
    procedure ActionRepClocksExecute(Sender: TObject);
    procedure ActionRepRazrExecute(Sender: TObject);
    procedure ActionRepNeSovpRazrOklExecute(Sender: TObject);
    procedure ActionRepPlanFondyExecute(Sender: TObject);
    procedure ActionRepPensioneryExecute(Sender: TObject);
    procedure ActionBrowseDekrListExecute(Sender: TObject);
    procedure ActionRepFondySVDNExecute(Sender: TObject);
    procedure ActionDeleteVirusesExecute(Sender: TObject);
    procedure ActionCorrectVyplatyExecute(Sender: TObject);
    procedure ActionBrowsePrikazyExecute(Sender: TObject);
    procedure ActionRepKRUExecute(Sender: TObject);
    procedure N184Click(Sender: TObject);
    procedure N183Click(Sender: TObject);
    procedure N20201Click(Sender: TObject);
    procedure ActionImportNadbFromPlanoviyExecute(Sender: TObject);
    procedure ActionBrowseNadbPlanoviyExecute(Sender: TObject);
    procedure ActionRepKRURusDNRExecute(Sender: TObject);
    procedure ActionRepBolnPlanExecute(Sender: TObject);
    procedure ActionCheckKassaBankExecute(Sender: TObject);
    procedure ActionMove156LNRExecute(Sender: TObject);
    procedure N187Click(Sender: TObject);


  private
    SaveHintHidePause : integer;
    SaveHintPause     : integer;
    CurrRow,CurrCol   : Integer;
    StatusTransaction : boolean;
    NmbOfTransactArc  : integer;
    NmbOfTransactSal  : integer;

    procedure MakeGrid(WantedRow:integer);
    procedure SetUpRow(WantedTabno:integer;WantedWR:integer;WantedDolg:string;var WantedRow:integer);
    procedure MakeColorRow(WantedRow:integer);
    procedure ArcPerson;
    procedure RecalcPerson;
    procedure ShowTransactionStatus;
    procedure ShowNmbOfTransAct;
    procedure SXTRStarted(var Msg:TMessage); message SX_TRSTARTED;
    procedure RecalcPersonWithWantedMode(WantedMode:integer);
    procedure ExecuteSort(Mode:integer);
    procedure InitUkrMessages;
    procedure InitRusMessages;


    { Private declarations }
  public
    { Public declarations }
  end;
  TStrColor = class(TObject)
   public
        Color      : TColor;  {вы могли бы также определить частные и
                               публичные методы доступа}
        BackColor  : TColor;
        SelectedColor : TColor;
    end;
var
  MainForm: TMainForm;

implementation
  uses UFormEditPodr,ScrLini,ScrIni, FormShifrU,FormNmesU,ScrDef,ScrUtil,ScrIO, ScrLists,DBUnit,
  UToSQL,udbf, uCKadry,FormAddUdU, FormSelShifrU,FormSortU,FormKadryU,FormSowmU,FormCnU,
  FormTabelU, SQlConnectU,ScrNalog, USelSwodMode,UFormArc,UFibModule,
  uFormBoln, uFormEditIPodr, UFORMEDITIKAT, UFORMEDITPRZB, UFormBolKoe,
  uFormOtp, UFormRecalc, UFormSelLera,uFormBuh,UFormBlnAbo,
  UFormRecalcPPSSFZ,FormPodrU,UFormEditGru,UFormEditShifr, 
  FormKafGruU, FormAlimU,FormRListU,FormIndexU, uFormOtpAbo,ShellApi,IniFiles,
  UFormPlatGen,UFormListVypl,FormSwodAlimU,FormRecalcPersonU,
  UFormSwodGt2660, uFormSwodSS, uFormSwodTemy, FormMovUkrFioU,FormAutoRepU,
  FormPersonoficU,FormRazrU,FormMakePensU,FormMovRecalc08U,FormMakeAllChainU,
  FormParSalU,FormYSprU,FormKreditSprU,FormFRXAutoSwodU,USprModule,
  UFormMinSal,UFormEditPensProcNalogPrep,UFormEditPodohTBL,UFormMonthsHea,
  UFormMakeAwans,UFormRecalcPodr,UFormWaitMess,UFormMpSwod,UFormDolg,uFormIGruppy,
  uFormEdirDayClock,UFormRepairTableForOtp,UFormEditSecretTabno,
  FormEditParSelPlatU , UFormEditTemy, uFormPersMonthMenu,uFormTestBoln,
  UFormMovOklToRazr,UForm1DF,UFormGrid, UFormPlanSwod, UFormMakeAllGuid, UFormGen,
  UFormPivotDolg,UFormWait,UFormSBSSpr, UFormListPerepl, UFormListDblVpl,
  UFormTstGruPrsnAddUd, uFormPrepRl, UFormRecalcNalCurr, UFormRptSL,
  UFormDelWantedUd, UFormMoveGUID, UFormNotUkr, UFormECBMonthMenu,
  UFormSSNomera, UFormReeBoln, UFormRptTstECB, UFormRecalcPECB,
  UFormRptTstECB1, UFormRptWantedAdd, UFormMakeALLTabel032011,
  UFormTstOsnMR,UFormGetDate, UFormDelWantedECB,UFormAnalyzeNalogi,
  UFormRptDolgSummy, UFormRptSwodECB,FormKadryClU,KadClU,
  UFormMakeLgotyPNSwm, UFormDelUdForWantedMonth,UORecalcAbon,
  UCRC32,UFormRecalcNalPassPeriod, UFormRestorePodr,UFormRestorePodrFromDrive,
  UFormPochasSwod, UFormOtp1201, UFormRepairCNSQL, UFormMoveOtpHelp2010,
  UFormEkonom, UFormInfProc, UFormSwodyCmp, UFormTestDuplicates,
  UFormKmndAbo, UFormIndexUpdate, UCDSFactory, UFormMovePod12Recalc,
  UFormDelRecen, UFormRepKOS, UFormDelAllCN, UFormOtpUhod, UFormMoveIskra,
  UFormTestNadbPresent, UFormBrowseKadryFB,uFrmFindKadryFB,
  UFormGetUwolnDate, UFormRepInvalidNalogi, UFormMakeSZNadb2014,
  UFormReMakeSZNadb2014,ScrIoSQL, UFormReturnSZNadb2014,UFormReMakeSZNMinus,
  UFormSumLimit, UFormListLogForDeti, UFormRptDolgHostel, UFormMkOtp14,
  UFormAllAddUdForAbsenBank, UFormMkOtp14_10, UFormMkEmpList,
  UFormToExcelKomend, UFormSaveRestTabno, UFormGetSaldo, UFormTestIO,
  UIOMonitor, UFormRptPersonDolg, UFormSwodTemyByPeriod, UFormShtRasp,
  UFormRepPensInv, UFormSingleForDouble, UFormParams, UFormRepSowmInOut,
  UFormPrikazyBrowse, UFormBrowsePrikazyTyp, UFormVyplLNR, UFormTestGener,
  UFormLessMinSal, UFormVipTabno, UFormSwodOtp, UFormFindPerson,
  UFormExportFroPlanLNR, UFormTestECB, UFormRptTestPod, UFormPers22SVDN,
  UFormProfsojuzList, UFormTestMissing, UFormExportKadryToMedok,
  UFormFRXAutoTable, UFormDepartmentBrowse, UFormTestRazr,
  UFormClearBolnGenerators, UFormFimdUwolPerson, UFormMakeAwansLNR,
  UFormPlan160916,ScrSwod, UFormListRecalcYear, UFormSwodAlla,
  UFormDelSowm82, UFormReport148, UFormConvertXMLGrnToRub,
  UFormRepPersDolgOsn, UFormRepAUP_PPS, UFormKomand, UFormRepairUwol,
  UFormRecalcNight, UFormChangeTabno,uSQLUnit, UFormChangeNMES,
  UFormFillExcel0417, UFormRepWordkers, UFormGener, UFormMonthForGener,
  UFormBrowseDogovora, UFormRepPomKOtp, UFormTestCrossSaving,
  scrnetwork, UFormSavedAwans, UFormRecalcJan2019, UFormRepClockItogi,
  UFormRepRazr, UFormRepNeSovpRazrOklad, UFormRepFondy, UFormRepPensionery,
  UFormDekrList, UFormRepFondySVDN, UFormMemBud,
  UFormMakeCorrectNagativeVypl, UFormPrikazyBrowseTot, UFormKRUReport,
  UFormRptPremGM, UFormSumLimitForCarantine,
  UFormBrowseNadbPlanoviy, FormKRURosDNRU, UFormRepBolnPlan,
  UFormTestKassaBank, UFormMakeVypl156082020, SplashForm;
{$R *.dfm}

procedure TMainForm.SetUpRow(WantedTabno:integer;WantedWR:integer;WantedDolg:string;var WantedRow:integer);
 var Curr_Person:Person_Ptr;
     I:integer;
     Finded:boolean;
 begin
      i:=1;
      WantedRow:=2;
      Finded:=false;
      Curr_Person:=Head_Person;
      while (Curr_Person<>Nil) do
       begin
            Inc(i);
            if (Curr_Person^.Tabno=WantedTabno) and
               (Curr_Person^.Wid_Raboty=WantedWR) then
               begin
                    if Length(trim(WantedDolg))>0 then
                       if trim(WantedDolg)=trim(Curr_Person^.DOLG) then
                          begin
                                Finded:=true;
                                WantedRow:=i;
                                break;
                          end
                    else
               end;
            Curr_Person:=Curr_Person^.NEXT;
       end;
      if not Finded then
         begin
              i:=1;
              Curr_Person:=Head_Person;
              while (Curr_Person<>Nil) do
                     begin
                          Inc(i);
                          if (Curr_Person^.Tabno=WantedTabno) and
                             (Curr_Person^.Wid_Raboty=WantedWR) then
                              begin
                                    Finded:=true;
                                    WantedRow:=i;
                                    break;
                              end;
                           Curr_Person:=Curr_Person^.NEXT;
                     end;
         end;
      if not Finded then
         begin
              i:=1;
              Curr_Person:=Head_Person;
              while (Curr_Person<>Nil) do
                begin
                    Inc(i);
                    if (Curr_Person^.Tabno=WantedTabno) then
                        begin
                            WantedRow:=i;
                            break;
                        end;
                    Curr_Person:=Curr_Person^.NEXT;
                end;
         end;
 end;

procedure TMainForm.MakeColorRow(WantedRow:integer);
 var I:Integer;
 begin
       for i:=0 to StringGrid1.ColCount-1 do
           begin
                if Assigned(StringGrid1.Objects[i,WantedRow]) then
                   begin
                         StringGrid1.Objects[i,WantedRow].Free;
                         StringGrid1.Objects[i,WantedRow]:=Nil;
                   end
                                                             else
                   begin
                        StringGrid1.Objects[i,WantedRow]:=TStrColor.Create;
                       (StringGrid1.Objects[i,WantedRow] as TStrColor).Color     := clInfoText;
                       (StringGrid1.Objects[i,WantedRow] as TStrColor).BackColor := clInfoBk;
                       (StringGrid1.Objects[i,WantedRow] as TStrColor).SelectedColor := clYellow;
                   end;
           end;
 end;
procedure TMainForm.MakeGrid(WantedRow:integer);
 const F='######0.00';
 var I,J,JJ       : Integer;
     Curr_Person  : Person_Ptr;
     S,S1         : String;
     A            : Double;
     Curr_Add     : Add_Ptr;
     Curr_Ud      : Ud_Ptr;
     SecretWorker : boolean;
     prefix       : string;
     fio          : string;
 begin
{    Caption:=AllTrim(Month[NMES])+' '+IntToStr(CurrYear)+' г. '+FNINF+' '+iNTtOsTR(cOUNT_pERSON);}
     CurrWrk   := FIB.GetShifrWrk   ;
     CurrRight := FIB.GetShifrRight ;
     {
     if CurrRight<>5 then
        begin
              N2.Visible  := FALSE;
              N30.Visible := FALSE;
        end;
}
     CurrWrkFio:=FIB.GetFioCurrWrk(CurrWrk);
{     Caption:=AllTrim(CurrWrkFio)+' '+AllTrim(Month[NMES])+' '+IntToStr(CurrYear)+' г. '+NAME_SERV(NSRV)+' '+IntToStr(Count_Person)+' Записей ';}
     s:=GetMonthRus(NMES);
     s1:='записей';
     if isGKH then
        prefix:='ЖКХ '
     else
     if isLNR then
        prefix:='ЛНУ '
     else
     if isSVDN then
        begin
             prefix:='СНУ ';
             s:=GetMonthUkr(NMES);
             s1:='записiв';
        end;

     Caption:=prefix+AllTrim(CurrWrkFio)+' '+s+' '+IntToStr(Work_Year_Val)+' г. '+NAME_SERV(NSRV)+' '+IntToStr(Count_Person)+' '+s1;
{
     StringGrid1.Height:=Self.Height-200;
     StringGrid2.Top:=Self.Height-150;
}
     StringGrid1.RowCount:=Count_Person+2;
     if StringGrid1.RowCount=2 then StringGrid1.RowCount:=3;
     StringGrid1.FixedRows:=2;
     if (WantedRow<StringGrid1.FixedRows)or (WantedRow>StringGrid1.RowCount) then
         WantedRow := 2;
     StringGrid1.ColCount := Nmb_Of_Col_Main_Screen+2;
     for i:=0 to StringGrid1.ColCount-1 do
         for j:=0 to StringGrid1.RowCount-1 do
             begin
                   StringGrid1.Cells[i,j]:='';
                   if Assigned(StringGrid1.Objects[i,j]) then
                      begin
                           StringGrid1.Objects[i,j].Free;
                           StringGrid1.Objects[i,j]:=Nil;
//                           FreeAndNil(StringGrid1.Objects[i,j]);
                      end;
             end;
     StringGrid1.Cells[0,0]:='Т.н.';
     StringGrid1.ColWidths[0]:=60;
     s:='Ф.И.О. сотрудника';
     if isSVDN then
        s:='П.I.Б. спiвробiтника';

     StringGrid1.Cells[1,0]:=s;
     StringGrid1.ColWidths[1]:=150;
     for i:=1 to Nmb_Of_Col_Main_Screen do
         begin
              StringGrid1.ColWidths[i+1]:=94;
              MainScreen[i].Summa:=0;
              S:=ShifrList.GetName(MainScreen[i].Shifr);
              if MainScreen[i].Shifr>M_Shifr then
                 if isSVDN then
                    S:='До видачi'
                 else
                    S:='К выдаче';
              StringGrid1.Cells[i+1,0]:=copy(S,1,10);
              if length(S)>10 then
                 StringGrid1.Cells[i+1,1]:=copy(S,11,10);

         end;
     {$IFNDEF SVDN}
       s:=space(80);
       if (WORK_YEAR_VAL<2014) or
          ((WORK_YEAR_VAL=2014) and (NMES<10)) then
       if isSecretPodr(NSRV) then
          begin
               StringGrid1.RowCount:=3;
               for i:=1 to Nmb_Of_Col_Main_Screen do
               StringGrid1.Cells[i+1,2] := copy(S,1,10);
               StringGrid1.Row:=2;
               StringGrid2.ColCount:=StringGrid1.ColCount;
               for i:=1 to Nmb_Of_Col_Main_Screen do
                  begin
                      if i=1 then StringGrid2.Cells[1,0]:='Итого';
                      StringGrid2.ColWidths[i-1]:=StringGrid1.ColWidths[i-1];
                      StringGrid2.Cells[I+1,0]:='0';
                  end;
               Exit;
          end;
     {$ENDIF}
     Curr_Person:=Head_Person;
     i:=0;
     while Curr_Person<>Nil do
       begin
            inc(i);
{            StringGrid1.Cells[0,i]:=IntToStr(PodrRec^.Shifr);}
            SecretWorker:=false;
            if NeedCodePersonLine(Curr_Person^.Tabno) then SecretWorker:=true;
            S:=IntToStr(Curr_Person^.Tabno);
            if SecretWorker then S:=ALL('X',Length(S));
            StringGrid1.Cells[0,i+1] :=  S;
            S:=Trim(Curr_Person^.Fio)+' '+AllTrim(Curr_Person^.Dolg)+' '+Get_Kat_Name(Curr_Person^.Kategorija)+' '+Get_Ist_Name(Curr_Person^.Gruppa)+' '+Trim(Curr_Person^.NAL_CODE);
            if ((Curr_Person^.Wid_Raboty=1) and
                (Curr_Person^.Main=0)) then S:=trim(S)+' переведен';
            if SecretWorker then S:=ALL('X',Length(S));
            StringGrid1.Cells[1,i+1] := S;
            if Curr_Person^.AUTOMATIC=Manual_Mode then
               begin
                    for jj:=0 to StringGrid1.ColCount-1 do
                        begin
                             StringGrid1.Objects[jj,i+1]:=TStrColor.Create;
                             (StringGrid1.Objects[jj,i+1] as TStrColor).Color         := clInfoText;
                             (StringGrid1.Objects[jj,i+1] as TStrColor).BackColor     := clInfoBk;
                             (StringGrid1.Objects[jj,i+1] as TStrColor).SelectedColor := clYellow;
                        end;
               end
            else
                    for jj:=0 to StringGrid1.ColCount-1 do
                        if Assigned(StringGrid1.Objects[jj,i+1]) then
                           begin
                                StringGrid1.Objects[jj,i+1].Free;
                                StringGrid1.Objects[jj,i+1]:=Nil;
                           end;


            for j:=1 to Nmb_Of_Col_Main_Screen do
                begin
                     if (MainScreen[j].Add) and (ShifrList.IsAdd(MainScreen[j].Shifr)) then
                        begin
                             Curr_add:=Curr_person^.add;
                             a:=0;
                             while Curr_add<>Nil do
                                   begin
                                        if Curr_Add^.Shifr= MainScreen[j].Shifr then
                                           a:=a+Curr_Add^.Summa;
                                        Curr_Add:=Curr_Add.Next;
                                   end;
                             MainScreen[j].Summa:=MainScreen[j].Summa+a;
                             StringGrid1.Cells[j+1,I+1]:='';
                             if abs(a)>0.001 then
                                begin
                                     S:=FormatFloat(F,a);
                                     if SecretWorker then S:=All('X',3);
                                     if length(S)<10 then S:=space(10-length(S))+S;
                                     StringGrid1.Cells[j+1,I+1]:=S;
                                end;
                        end;
                     if (MainScreen[j].Add) and (MainScreen[j].Shifr=l_shifr) then
                        begin
                             Curr_add:=Curr_person^.add;
                             a:=0;
                             while Curr_add<>Nil do
                                   begin
                                        a:=a+Curr_Add^.Summa;
                                        Curr_Add:=Curr_Add.Next;
                                   end;
                             MainScreen[j].Summa:=MainScreen[j].Summa+a;
                             StringGrid1.Cells[j+1,I+1]:='';
                             if abs(a)>0.001 then
                                begin
     {                                S:=FloatToStrF(a,ffFixed,8,2);    }
                                     S:=FormatFloat(F,a);
                                     if SecretWorker then S:=All('X',3);
                                     if length(S)<10 then S:=space(10-length(S))+S;
                                     StringGrid1.Cells[j+1,I+1]:=S;
                                end;
                        end;

                     if (not MainScreen[j].Add) and (MainScreen[j].Shifr<m_shifr) then
                        begin
                             Curr_ud:=Curr_person^.ud;
                             a:=0;
                             while Curr_ud<>Nil do
                                   begin
                                        if Curr_ud^.Shifr= MainScreen[j].Shifr then
                                           a:=a+Curr_Ud^.Summa;
                                        Curr_Ud:=Curr_Ud.Next;
                                   end;
                             MainScreen[j].Summa:=MainScreen[j].Summa+a;
                             StringGrid1.Cells[j+1,I+1]:='';
                             if abs(a)>0.001 then
                                begin
{                                     S:=FloatToStrF(a,ffFixed,8,2);    }
                                     S:=FormatFloat(F,a);
                                     if SecretWorker then S:=All('X',3);
                                     if length(S)<10 then S:=space(10-length(S))+S;
                                     StringGrid1.Cells[j+1,I+1]:=S
                                end;
//      контроль подоходного в ЛНР 16 01 2019
                             if isLNR then
                             if MainScreen[j].Shifr=podoh_shifr then
                                begin
                                     if not isCorrectLNRPodoh13Person(curr_person) then
                                        begin
                                            fio:=curr_person^.fio;
                                            if Assigned(StringGrid1.Objects[j+1,i+1]) then
                                               begin
                                                    StringGrid1.Objects[j+1,i+1].Free;
                                                    StringGrid1.Objects[j+1,i+1]:=Nil;
                                               end;
                                            StringGrid1.Objects[j+1,i+1]:=TStrColor.Create;
                                           (StringGrid1.Objects[j+1,i+1] as TStrColor).Color         := clWhite;
                                           (StringGrid1.Objects[j+1,i+1] as TStrColor).BackColor     := clRed;
                                           (StringGrid1.Objects[j+1,i+1] as TStrColor).SelectedColor := clYellow;
                                        end;
                                end;

                        end;
                     if (not MainScreen[j].Add) and (MainScreen[j].Shifr=m_shifr) then
                        begin
                             Curr_ud:=Curr_person^.ud;
                             a:=0;
                             while Curr_ud<>Nil do
                                   begin
                                        a:=a+Curr_Ud^.Summa;
                                        Curr_Ud:=Curr_Ud.Next;
                                   end;
                             MainScreen[j].Summa:=MainScreen[j].Summa+a;
                             StringGrid1.Cells[j+1,I+1]:='';
                             if abs(a)>0.001 then
                                begin
{                                     S:=FloatToStrF(a,ffFixed,8,2);      }
                                     S:=FormatFloat(F,a);
                                     if SecretWorker then S:=All('X',3);
                                     if length(S)<10 then S:=space(10-length(S))+S;
                                     StringGrid1.Cells[j+1,I+1]:=S
                                end;
                        end;
                     if (not MainScreen[j].Add) and (MainScreen[j].Shifr=m_shifr+1) then
                        begin
                             Curr_add:=Curr_person^.add;
                             a:=0;
                             while Curr_add<>Nil do
                                   begin
                                        a:=a+Curr_Add^.Summa;
                                        Curr_Add:=Curr_Add.Next;
                                   end;
                             Curr_ud:=Curr_person^.ud;
                             while Curr_ud<>Nil do
                                   begin
                                        a:=a-Curr_Ud^.Summa;
                                        Curr_Ud:=Curr_Ud.Next;
                                   end;
                             MainScreen[j].Summa:=MainScreen[j].Summa+a;
                             StringGrid1.Cells[j+1,I+1]:='';
                             if abs(a)>0.001 then
                                begin
{                                     S:=FloatToStrF(a,ffFixed,8,2); }
                                     S:=FormatFloat(F,a);
                                     if SecretWorker then S:=All('X',3);
                                     if length(S)<10 then S:=space(10-length(S))+S;
                                     StringGrid1.Cells[j+1,I+1]:=S
                                end;
                        end;
                end;

            Curr_Person:=Curr_Person^.Next;
       end;
      StringGrid2.ColCount:=StringGrid1.ColCount;
      for i:=1 to StringGrid2.ColCount do
          begin
               if i=1 then StringGrid2.Cells[1,0]:='Итого';
               StringGrid2.ColWidths[i-1]:=StringGrid1.ColWidths[i-1];
          end;
      if (StringGrid1.RowCount>WantedRow) and (WantedRow>1) then
         begin
               StringGrid1.Row:=WantedRow;
               if StringGrid1.Row>=StringGrid1.TopRow+StringGrid1.VisibleRowCount then
                  if StringGrid1.Row>StringGrid1.RowCount-StringGrid1.VisibleRowCount then
                     StringGrid1.TopRow:=StringGrid1.RowCount-StringGrid1.VisibleRowCount+1
                  else
                     StringGrid1.TopRow:=StringGrid1.Row-StringGrid1.VisibleRowCount div 2;

         end;
      for i:=1 to Nmb_Of_Col_Main_Screen do
          begin
               StringGrid2.Cells[I+1,0]:='0';
               if abs(MainScreen[i].Summa)>0.001 then
                  begin
                       S:=FloatToStrF(MainScreen[i].Summa,ffFixed,8,2);
                       if length(S)<10 then S:=space(10-length(S))+S;
                       StringGrid2.Cells[I+1,0]:=S;
                  end;
          end;
   Application.ShowHint := True;
   StringGrid1.ShowHint := true;
   if StringGrid1.Visible and
      Self.Visible        and
      StringGrid1.Enabled and
      Self.Enabled        then
      StringGrid1.SetFocus;
 end;
procedure TMainForm.InitUkrMessages;
 begin
     N2.Caption:='Довiдники';
     N3.Caption:='Звiти';
     N14.Caption:='Архiв';
     N16.Caption:='Параметри';
     N30.Caption:='Утiлiти';
     N42.Caption:='Довiдки';
     N59.Caption:='Плановий вiддiл';
     N85.Caption:='Вихiд';


 end;
procedure TMainForm.InitRusMessages;
 begin
     N2.Caption:='Справочники';
     N3.Caption:='Своды';
     N14.Caption:='Архив';
     N16.Caption:='Параметры';
     N30.Caption:='Утилиты';
     N42.Caption:='Справки';
     N59.Caption:='Плановый отдел';
     N85.Caption:='Выход';
 end;

procedure TMainForm.FormCreate(Sender: TObject);
 var WantedRow:Integer;
     WantedTabno,WantedWR,WantedServ:Integer;
     WantedDolg:string;
     AUserName, APassword:Ansistring;
     i,j : integer;
     escPressed:Boolean;
 begin
  // i:=FIB.pFIBDatabaseSal.ActiveTransactionCount;
  // j:=FIB.pFIBDatabaseArc.ActiveTransactionCount;

   KZ:=0;
   NmbOfTransactSal := 0;
   NmbOfTransactArc := 0;
//   if yesno('1 - На сервере имеется новая версия программы.'+^M+'Обновить программу с сервера?') then
//       halt(99);
   if needCopyOriginProgram then
      begin
           if isLNR then
              begin
                   if yesno('На сервере имеется новая версия программы.'+^M+'Обновить программу с сервера?') then
                      halt(99);
              end
           else
              showMessage('На сервері знаходиться нова версія програми.'+^M+'Завантажте нову версію програми з серверу.');
      end;


   Init_Dir_Name;
 //  testSVDNRec;

   InitInitialParamentersFromIniFile;
   if kz<0 then
      raise Exception.Create('DirList initialization error');

   if isLNR then
   if needServerAppData then
      begin
           makeServerBDir(escPressed);
           makeServerTmpDir(escPressed);
      end;
   Fill_Podr;
   if kz<0 then
      raise Exception.Create('Fill_Podr initialization error');
   fill_Banki_List;
   if kz<0 then
      raise Exception.Create('Fill_Banki initialization error');
   if isLNR then
      begin
           Application.Title:='Луганский национальный университет имени В.Даля';
           Application.ProcessMessages;
      end;
   Fill_Shifr;
   Fill_Dolg;
   Fill_temy;
   Get_Flow_Month;
   Fill_Pens(NMES);
   INIT_KAT_IST;
   INI_W_DAY;
   Init_Day_Kod;
 //  INIT_MIN_SALARY;
   Init_ECB_2011;
   Fill_BuhAccesBayList;
   Fill_BuhBayList;
   Fill_BuhDopList;
   Fill_SecretTabnoList;
   Fill_BuhList;
   Fill_SSLimity;
   Fill_Oklady_Razr_From_SQL;
   INIT_LABEL;
   if kz<0 then
      raise Exception.Create('LABEL.TXT initialization error');
   SetFormatSummaPltCharacter;
   SetTmpSaveFileMode;
{
   if not InitFib then
      begin
            Self.CLose;
            Exit;
      end;
}
   InitMain;
   if isSVDN then
      InitUkrMessages
   else
      InitRusMessages;   
   uSQLUnit.setSal; 
   unLockAllMy;
   if isSVDN then
      if needAllPodr then
         fillNamesReservPodr;   
   

   if Block_Program then
      begin
           ShowMessage('Воспользуйтесь программой с нового сервера. Пожалуйста!');
           Halt;
      end;
{   Load_Pck(WantedTabno,WantedWR);  }
   Load_Pck_Fr_Register(WantedServ,WantedTabno,WantedWR,WantedDolg);
   if (WantedServ>0) and (WantedServ<200) then NSRV:=WantedServ
   else NSRV:=1;
   if (isLNR and isGKH) then
   if not isGKHPodr(nsrv) then
      NSRV:=191;
   MKFLNM;
   GETINF(TRUE);
   CurrentPodrReadedByOperator:=NSRV;
   SetUpRow(WantedTabno,WantedWR,WantedDolg,WantedRow);
   MakeGrid(WantedRow);
   ActiveControl     := StringGrid1;
   StatusTransaction := false;
   if StringGrid1.Visible and
      Self.Visible        and
      StringGrid1.Enabled and
      Self.Enabled        then
      StringGrid1.SetFocus;


   i:=FIB.pFIBDatabaseSal.ActiveTransactionCount;
   j:=FIB.pFIBDatabaseArc.ActiveTransactionCount;
   CurrRight:=FIB.GetShifrRight;

{
   Fib.pFIBDatabaseSal.AfterStartTransaction:=StartTransactionSal;
   Fib.pFIBDatabaseArc.AfterStartTransaction:=StartTransactionArc;
   FIB.pFIBDatabaseSal.AfterEndTransaction:=EndTransactionDatabaseSal;
   FIB.pFIBDatabaseArc.AfterEndTransaction:=EndTransactionDatabaseArc;
}   
{   FIB.StatusMessage:=StatusMessage;   }

       {$IFDEF SVDN}
          Nlnr1.Visible:=False;
          NLNR2.Visible:=false;
          Nlnr1.Enabled:=false;
          NLNR2.Enabled:=False;
          NLNRREST.Visible:=False;
          NLNRREST.Enabled:=False;
          N71LNR.Visible:=false;
          N71LNR.Enabled:=False;
          N71.Visible:=false;
          N71.Enabled:=False;
          N141.Visible:=false;
          N141.Enabled:=False;
          N143.Visible:=false;
          N143.Enabled:=False;
          ActionVyplLnr.Enabled:=False;
          ActionEditVipTabnos.Enabled:=false;
          N144.Visible:=false;
          N144.Enabled:=False;
          N154.Enabled:=false;
          N154.Visible:=False;
          ActionDepBrowse.Enabled:=False;
          ActionSwodOtp.Enabled:=False;
          actExportForPlanovLNR.Enabled:=false;
          mniExportForPlanovLNR.Visible:=False;
          mniExportForPlanovLNR.Enabled:=false;
//          ActionSvdn22.Enabled:=True;
//          N221.Visible:=TRUE;
//          N221.Enabled:=True;
          N221.Caption:='22% на начисления';
          N158.Enabled:=false;
          N158.Visible:=False;
          ActionSwodInvalidy.Enabled:=True;
          N222.Visible:=true;
          NCvtGrnToRub.Enabled:=False;
          NCvtGrnToRub.Visible:=false;
          ActionCvtXMLGrnToRub.Enabled:=False;
          NAUP_PPS.Enabled:=False;
          NAUP_PPS.Visible:=False;
          ActionRepAUPPPS.Enabled:=False;
          RepWorkersForPlan.Enabled:=false;
          RepWorkersForPlan.Visible:=False;
          ActionRepWorkersForPlan.Enabled:=False;
          NGTLIMITLNR.Enabled:=False;
          NGTLIMITLNR.Visible:=False;
          N0620171.Enabled:=True;
          N0620171.Visible:=True;
          ActionRecalcNightFor062017.Enabled:=True;
          N20112.Visible:=true;  { Корректировка табеля }
          N20112.Enabled:=true;  { за август 2017 }
          Excel0420171.Visible:=false;
          Excel0420171.Enabled:=false;
          NDogovora.Visible:=true;
          ActionBrowseDogovora.Enabled:=true;
          ActionRecalcJan2019.Enabled:=true;
          N20191.Visible:=true;
          N20191.Enabled:=true;
          actionrepclocks.Enabled:=true;
          n175.Enabled:=true;
          n175.Visible:=true;
          NFondySVDN.Visible:=true;
          NFondySVDN.Enabled:=true;
          ActionRepFondySVDN.Enabled:=true;
          ActionDeleteViruses.Enabled:=false;
          nViruses.Visible:=false;
          nViruses.Enabled:=false;
          NKRU.Enabled:=false;
          NKRU.Visible:=false;
          ActionRepKRU.Enabled:=false;
          NImportNadb.Enabled:=false;
          NImportNadb.Visible:=false;
          NCheckKassBank.Enabled:=false;
          NCheckKassBank.Visible:=false;
          ActionCheckKassaBank.Enabled:=False;
          NMove156LNR.Visible:=false;
          NMove156LNR.Enabled:=false;
          ActionMove156LNR.enabled:=False;
      //    ActionImportNadbFromPlanoviy.Enabled:=false;
       {$ELSE}

          NLNR2.Visible:=true;
          Nlnr1.Visible:=true;
          Nlnr1.Enabled:=true;
          NLNR2.Enabled:=true;
          N71LNR.Visible:=True;
          N71LNR.Enabled:=True;
          N71.Visible:=True;
          N71.Enabled:=True;
          N141.Visible:=true;
          N141.Enabled:=true;
          N143.Visible:=true;
          N143.Enabled:=true;
          ActionVyplLNR.Enabled:=true;
          ActionEditVipTabnos.Enabled:=true;
          N144.Visible:=true;
          N144.Enabled:=true;
          ActionSwodOtp.Enabled:=true;
          actExportForPlanovLNR.Enabled:=true;
          mniExportForPlanovLNR.Visible:=true;
          mniExportForPlanovLNR.Enabled:=true;
//          ActionSvdn22.Enabled:=false;
//          N221.Visible:=FALSE;
//          N221.Enabled:=FALSE;
          N221.Caption:='31% на начисления';
          N154.Enabled:=true;
          N154.Visible:=true;
          N158.Enabled:=true;
          N158.Visible:=true;

          ActionSwodInvalidy.Enabled:=false;
          N222.Visible:=false;
          NCvtGrnToRub.Enabled:=true;
          NCvtGrnToRub.Visible:=true;
          ActionCvtXMLGrnToRub.Enabled:=true;

          ActionDepBrowse.Enabled:=true;


          NAUP_PPS.Enabled:=true;
          NAUP_PPS.Visible:=true;
          ActionRepAUPPPS.Enabled:=true;
          RepWorkersForPlan.Enabled:=true;
          RepWorkersForPlan.Visible:=true;
          ActionRepWorkersForPlan.Enabled:=true;

          NGTLIMITLNR.Enabled:=true;
          NGTLIMITLNR.Visible:=true;
          N0620171.Enabled:=false;
          N0620171.Visible:=false;
          ActionRecalcNightFor062017.Enabled:=false;
//          N20112.Visible:=false;  { Корректировка табеля }
//          N20112.Enabled:=false;  { за август 2017 (только для СВДН)}
          N20112.Visible:=true;  { Корректировка табеля }
          N20112.Enabled:=true;  { за август 2017 (только для СВДН)}
          Excel0420171.Visible:=true;
          Excel0420171.Enabled:=true;
          NDogovora.Visible:=false;
          ActionBrowseDogovora.Enabled:=false;
          ActionRecalcJan2019.Enabled:=false;
          N20191.Visible:=false;
          N20191.Enabled:=false;
          actionrepclocks.Enabled:=false;
          n175.Enabled:=false;
          n175.Visible:=false;
          NFondySVDN.Visible:=false;
          NFondySVDN.Enabled:=false;
          ActionRepFondySVDN.Enabled:=false;
          NKRU.Enabled:=true;
          NKRU.Visible:=true;
          ActionRepKRU.Enabled:=true;
          NImportNadb.Enabled:=true;
          NImportNadb.Visible:=true;
          ActionBrowseNadbPlanoviy.Enabled:=true;
          NCheckKassBank.Enabled:=true;
          NCheckKassBank.Visible:=true;
          ActionCheckKassaBank.Enabled:=true;
          NMove156LNR.Visible:=true;
          NMove156LNR.Enabled:=true;
          ActionMove156LNR.enabled:=true;



   //       if DirectoryExists('Y:') then
          if true then
             begin
                  ActionDeleteViruses.Enabled:=true;
                  nViruses.Visible:=true;
                  nViruses.Enabled:=true;
             end
          else
             begin
                  ActionDeleteViruses.Enabled:=false;
                  nViruses.Visible:=false;
                  nViruses.Enabled:=false;
             end;

          if (CurrRight>3) then
             begin
                  NLNRREST.Visible      := true;
                  NLNRREST.Enabled      := true;
                  NSecretWorker.Visible := True;     // Приватные работнки
                  NSecretWorker.Enabled := True;
                  NGenNewMonth.Visible  := true;
                  NGenNewMonth.Enabled  := true;
                  ActionFormMonthGener.Enabled:=true;
                  NFormMonthGener.Visible := true;
                  NFormMonthGener.Enabled := true;
             end
          else
             begin
                  NLNRREST.Visible      := false;
                  NLNRREST.Enabled      := false;
                  NSecretWorker.Visible := false;
                  NSecretWorker.Enabled := false;
                  NGenNewMonth.Visible  := false;
                  NGenNewMonth.Enabled  := false;
                  ActionFormMonthGener.Enabled:=false;
                  NFormMonthGener.Visible := false;
                  NFormMonthGener.Enabled := false;
             end

       {$ENDIF}

end;

procedure TMainForm.N5Click(Sender: TObject);
begin
    Application.CreateForm(TFormEditPodohTBL, FormEditPodohTBL);
    FormEditPodohTBL.Show;
end;

procedure TMainForm.N4Click(Sender: TObject);
begin
  //  if CurrRight=5 then
       begin
            Application.CreateForm(TFormEditPensProcNalogPrep, FormEditPensProcNalogPrep);
            FormEditPensProcNalogPrep.ShowModal;
       end;
    {               else
       begin
             ShowMessage('Нет прав');
       end;
       }
end;

procedure TMainForm.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Column, Row : Longint;
  SelectedCol : integer;
  WantedRow    : integer;
  A:TShowShifrMode;
begin
  StringGrid1.MouseToCell(X, Y, Column, Row);
  WantedRow := StringGrid1.Row;
  if (Row<2) and (Column>1) then
      begin
           SelectedCol:=Column-1;
           with TFormSelShifr.Create(nil) do
            try
{                SetShifr(MainScreen[SelectedCol].Shifr,MainScreen[SelectedCol].Add);}
                SetShifr(MainScreen[SelectedCol].Shifr,AllMode);
                if execute then
                   begin
{                      MainScreen[SelectedCol].Shifr:=GetShifr(MainScreen[SelectedCol].Add);}
                      MainScreen[SelectedCol].Shifr:=GetShifr(A);
                      if ShifrList.IsAdd(MainScreen[SelectedCol].Shifr) then
                         MainScreen[SelectedCol].Add:=true
                      else
                         MainScreen[SelectedCol].Add:=false;
                      Self.MakeGrid(WantedRow);
                      Self.ActiveControl:=Self.StringGrid1;
                   end;
            finally
{             free;}
            END
      end
                            else
  if (Row<2) and (Column=1) then
      begin
{           SortPerson(2);}
           with TFormSort.Create(nil) do
            try
                SetModeSort(2);
                if execute then
                   begin
                        Self.MakeGrid(WantedRow);
                        Self.ActiveControl:=Self.StringGrid1;
                   end
            finally
{             free;    }
            end;
      end
                             else

  if (Row<2) and (Column=0) then
      begin
{           SortPerson(1);}
           with TFormSort.Create(nil) do
            try
                SetModeSort(1);
                if execute then
                   begin
                   Self.MakeGrid(WantedRow);
                   Self.ActiveControl:=Self.StringGrid1;
                   end
            finally
{             free; }
            end;
{           Self.MakeGrid;  }
      end;

end;

procedure TMainForm.N6Click(Sender: TObject);
begin
    Application.CreateForm(TFormToSQL, FormToSQL);
    FormToSql.Show
end;

procedure TMainForm.DBF1Click(Sender: TObject);
begin
    Application.CreateForm(TFormDBF, FormDBF);
    FormDBF.Show;
end;

procedure TMainForm.N7Click(Sender: TObject);
begin
{    Application.CreateForm(TfrmKadry, frmKadry);
    frmKadry.ShowModal;
}
       ActionEditKadryClarionExecute(Sender);
end;

procedure TMainForm.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
    vRow,vCol     : integer;
    S             : String;
    Shift         : integer;
    OldFontColor  : TColor;
    OldBrushColor : TColor;
begin
      vRow := aRow ;
      vCol := aCol ;
      if ((vRow=16) and (vCol=7)) then
          shift:=1;
      S    := StringGrid1.Cells[vCol,vRow];
      if vCol=1 then
         begin
{
            with Sender as TStringGrid do
               begin
                     Hint:=S;
                     ShowHint:=true;
               end;
}
         end
       else
            with Sender as TStringGrid do
               begin
{                     Hint:=''; }
{                     ShowHint:=false;}
               end;
      with Sender as TStringGrid, Canvas do
           begin
                OldFontColor  := Font.Color;
                OldBrushColor := Brush.Color;
                if (gdSelected in State) then
                   begin
//      if ((vRow=16) and (vCol=7)) then
          shift:=1;
                        Brush.Color := clHighlight;
                        If assigned(Objects[vCol,vRow]) then
                           begin
                                 OldFontColor := Font.Color;
                                 OldBrushColor := Brush.Color;
                                 Font.Color := (Objects[vCol,vRow] as TStrColor).SelectedColor;

                                 if isLNR then
                                 if length(trim(StringGrid1.Cells[vCol,vRow]))>0 then
                                 if vCol=7 then
                                    Brush.Color := (Objects[vCol,vRow] as TStrColor).BackColor;
                           end;
                   end
                                         else
                   if (gdFixed in State) then
                      begin
                           Brush.Color := FixedColor;
                           If assigned(Objects[vCol,vRow]) then
                             begin
                                  OldFontColor := Font.Color;
                                  OldBrushColor := Brush.Color;
                                  Font.Color := (Objects[vCol,vRow] as TStrColor).Color;
                                  Brush.Color := (Objects[vCol,vRow] as TStrColor).BackColor;
                             end;
                      end
                   else
                      begin
                           OldFontColor := Font.Color;
                           OldBrushColor := Brush.Color;
                           Brush.Color := Color;
{
                           if (vRow mod 2 = 0) then Brush.Color:=clInActiveCaptionText
                                               else Brush.Color:=clSkyBlue;
}
                           if (vRow mod 2 = 0) then Brush.Color:=clInfoBk
                                               else Brush.Color:=cl3dLight;
                           if isLNR then
                           If assigned(Objects[vCol,vRow]) then
                              begin
                                   OldFontColor := Font.Color;
                                   OldBrushColor := Brush.Color;
                                   Font.Color := (Objects[vCol,vRow] as TStrColor).Color;
                                   Brush.Color := (Objects[vCol,vRow] as TStrColor).BackColor;
                              end;
                      end;
{
                if vCol=1 then
                   begin
                         If assigned(Objects[vCol,vRow]) then
                            begin
                                  OldFontColor := Font.Color;
                                  OldBrushColor := Brush.Color;
                                  Font.Color := (Objects[vCol,vRow] as TStrColor).Color;
                                  Brush.Color := (Objects[vCol,vRow] as TStrColor).BackColor;
                            end;
                   end;
}
                FillRect(Rect);
                SetBkMode(Handle, TRANSPARENT);
                if (vRow>1) and (vCol<>1) then
                    begin
                          SetTextAlign(Handle, TA_RIGHT);
                          if vCol>1 then Shift:=10
                                    else Shift:= 8;
                          TextOut(Rect.Right-Shift, Rect.Top+2, S);

                    end
                else
                    begin
                         SetTextAlign(Handle, TA_LEFT);
                         TextRect(Rect, Rect.Left+5, Rect.Top, S);
                    end;
                Font.Color := OldFontColor;
                Brush.Color := OldBrushColor;
           end;
{        ImageList1.Draw(StatusBar1.Canvas,StatusBar1.Panels[0].Width+10,2,1);}
        if (vCol=0) and (VRow>1) then
           if Assigned(TStringGrid(Sender).Objects[vCol,vRow]) then
           ImageList1.Draw(TStringGrid(Sender).Canvas,Rect.Left+1,Rect.Top+2,1)
                                           else
           ImageList1.Draw(TStringGrid(Sender).Canvas,Rect.Left+1,Rect.Top+2,0)
end;


procedure TMainForm.N8Click(Sender: TObject);
var Curr_Person:Person_Ptr;
    Tabno,WR,I,WantedRow:Integer;
    WantedDolg:string;
    OldNSRV,TmpNSRV:Integer;
    S:String;
begin
     Tabno:=-1;
     WR:=-1;
     Curr_Person:=Head_Person;
     i:=1;
     while (Curr_Person<>Nil) do
      begin
           inc(i);
           if I=StringGrid1.Row then
              begin
                   Tabno:=Curr_Person^.TABNO;
                   WR:=Curr_Person^.WID_RABOTY;
                   WantedDolg:=Curr_Person^.Dolg;
                   break;
              end;
              Curr_Person:=Curr_Person^.Next;
      end;
      OldNSRV:=NSRV;
      with TFormPodr.Create(nil) do
        try
            SetNSRV(NSRV);
            if execute then
              begin
                   NSRV:=GetNSRV;
                   if NMES=FLOW_MONTH then
                   if NSRV<>OldNSRV then
                      begin
                           TmpNSRV:=NSRV;
                           NSRV:=OldNSRV;
                           CRC32New:=PodrCRC32;
                           if CRC32Ori<>CRC32New then
                           if YesNo('Сохранить данные?') then
                              PUTINF;
                           NSRV:=TmpNSRV;
                      end;
                   LDEL_PERSON;
                   MKFLNM;
                   GETINF(TRUE);
          //         S:=GetMd5ForNSRV;
                   if NMES=FLOW_MONTH then
                      begin
                           CurrentPodrReadedByOperator:=NSRV;
                           EmptySavedArea;
                      end;
                   WantedRow:=2;
                   if (Tabno>0) and (WR>0) then
                      SetUpRow(Tabno,WR,WantedDolg,WantedRow);
                   Self.MakeGrid(WantedRow);
                   Self.ActiveControl:=Self.StringGrid1;
                   if WantedRow>0 then
                      Save_Pck_To_Register(WantedRow)
                   else
                      Save_Pck_To_Register(-1);

              end;
        finally
{           Release;}
           {free;}
        end;
     StringGrid1.SetFocus;
end;

procedure TMainForm.N9Click(Sender: TObject);
var Curr_Person:Person_Ptr;
    Tabno,WR,I,WantedRow:Integer;
    WantedDolg:String;
    OldNMES,TmpNMES:Integer;
begin
      Tabno       := -1;
      WR          := -1;
      Curr_Person := Head_Person;
      i           := 1;
      while (Curr_Person<>Nil) do
       begin
           inc(i);
           if I=StringGrid1.Row then
              begin
                   Tabno:=Curr_Person^.TABNO;
                   WR:=Curr_Person^.WID_RABOTY;
                   WantedDolg:=Curr_Person^.Dolg;
                   break;
              end;
              Curr_Person:=Curr_Person^.Next;
       end;
      OldNmes:=nmes;
      with TFormNmes.Create(nil) do
        try
            SetNMes(NMes);
            if execute then
              begin
                   Nmes:=GetNmes;
                   if (NMES<>OldNMES) and (OldNMES=FLOW_MONTH) then
                      begin
                           TmpNmes:=Nmes;
                           Nmes:=OldNMES;
                           CRC32New:=PodrCRC32;
                           if CRC32Ori<>CRC32New then
                              if YesNo('Сохранить изменения?') then
                                 PUTINF;
                           Nmes:=TmpNMES;

                      end;
                   if Nmes>Flow_Month then WORK_YEAR_VAL:=CurrYear-1
                                      else WORK_YEAR_VAL:=CurrYear;
                   LDEL_PERSON;
                   MKFLNM;
                   GETINF(TRUE);
                   WantedRow:=2;
                   if (Tabno>0) and (WR>0) then
                      SetUpRow(Tabno,WR,WantedDolg,WantedRow);
                   Self.MakeGrid(WantedRow);
                   Self.ActiveControl:=Self.StringGrid1;
                   SET_PODR_NAMES_FOR_NMES;
              end;
        finally
{        free;}
      end;
      StringGrid1.SetFocus;

end;

procedure TMainForm.StringGrid1DblClick(Sender: TObject);
var I:Integer;
    Curr_Person:Person_Ptr;
    RetVal:integer;
    Done:boolean;
begin
     if (StringGrid1.Row<2)then Exit;
     if Count_Person<1 then Exit;
     Done:=false;
     while not Done do
      begin
     Curr_Person:=Head_Person;
     i:=1;
     while (Curr_Person<>Nil) do
      begin
           inc(i);
           if I=StringGrid1.Row then break;
              Curr_Person:=Curr_Person^.Next;
      end;
     if Curr_Person^.Tabno<1 then Exit;
     if NeedCodePersonLine(Curr_Person^.Tabno) then Exit;

     RetVal:=StringGrid1.Row;
     with TFormAdd.Create(nil) do
        try
            SetPerson(Curr_Person);
            if execute(RetVal) then
              begin
                   case RetVal of
                    11 :
                         if StringGrid1.Row<Count_Person+1 then
                              StringGrid1.Row:=StringGrid1.Row+1;
                    12:
                         if StringGrid1.Row>2 then
                              StringGrid1.Row:=StringGrid1.Row-1;
                   else
                       Done:=true;
                   end;
              end
            else Done:=true;

        finally
{        free;}
      end;
     end;
   Self.MakeGrid(StringGrid1.Row);
   Self.ActiveControl:=Self.StringGrid1;
   StringGrid1.SetFocus;
end;

procedure TMainForm.FormShow(Sender: TObject);
var i:integer;
    S,C:String;
begin
     Self.WindowState:=wsMaximized;
     SetFocus;
     Self.ActiveControl:=Self.StringGrid1;
     Self.StringGrid1.SetFocus;
     if Fib.pFIBDatabaseSal.Connected then SwitchConnectionStatus(0)
                                      else SwitchConnectionStatus(1);
     ShowTransactionStatus;
     for i:=0 to ToolBar1.ButtonCount-1 do
         begin
               S:=ToolBar1.Buttons[i].Caption;
               C:=ToolBar1.Buttons[i].Name;
               s:=s;
         end;
end;

procedure TMainForm.StringGrid2DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var i:integer;
    vRow,vCol:integer;
    S:String;
    Shift:integer;
begin

      i:=1;
      vRow:=aRow;
      vCol:=aCol;
      S:=StringGrid2.Cells[vCol,vRow];
      with Sender as TStringGrid, Canvas do
           begin
{
                if (gdSelected in State) then
                   Brush.Color := clHighlight
                                         else
                if (gdFixed in State) then
                    Brush.Color := FixedColor
                                         else
}
                    Brush.Color := Color;
{                    Brush.Color := Color;   }
                    Brush.Color := clGreen;
                    Font.Color := clWhite;
                FillRect(Rect);
                SetBkMode(Handle, TRANSPARENT);
                if (vCol<>1) then
                    begin
                         SetTextAlign(Handle, TA_RIGHT);
                         if vCol>1 then Shift:=10
                                   else Shift:= 8;
                         TextOut(Rect.Right-Shift, Rect.Top+2, S);
                    end
                         else
                    begin
                         SetTextAlign(Handle, TA_LEFT);
                         TextRect(Rect, Rect.Left+5, Rect.Top, S);
                    end;
           end;
{
     if (ACol>0) then
        begin
            StringGrid2.Canvas.Brush.Color:=clGreen;
            StringGrid2.Canvas.Font.Color:=clWhite;
        end;
     StringGrid2.Canvas.FillRect(Rect);
     StringGrid2.Canvas.TextOut(Rect.Left+2, Rect.Top+1,
       StringGrid2.Cells[ACol, ARow]);
}       

end;

procedure TMainForm.N10Click(Sender: TObject);
var Curr_Person:Person_Ptr;
     i:integer;
     SavTopRow,SavRow : integer;
     count_p:integer;
     Tabno,WorkPlace,RecNo : integer;
     NalCode : string;
     FIO     : string;
begin
    {$IFNDEF SVDN}
      if (
           (CURRYEAR<2014) or
           ((CURRYEAR=2014) and (NMES<=10))
         ) then
      if isSecretPodr(NSRV) then
         Exit;
    {$ENDIF}
     count_p:=count_person;
     if count_p>0 then
        begin
             Curr_Person:=Head_Person;
             i:=count_person;
             i:=1;
             while (Curr_Person<>Nil) do
               begin
                    inc(i);
                    if I=StringGrid1.Row then break;
                    Curr_Person:=Curr_Person^.Next;
               end;
        end;
     SavTopRow := StringGrid1.TopRow ;
     SavRow    := StringGrid1.Row    ;
     if count_p>0 then
        with TFormKadry.Create(nil) do
            try
              SetCurrPerson(Curr_Person);
              if execute then
                 begin
                     LDEL_PERSON_ZERO;
                     if NeedRecalc then
                        ActionCalcPersonExecute(Sender);
                     Self.MakeGrid(1);
                     Self.ActiveControl:=Self.StringGrid1;
                 end
                       else
                 begin
                   LDEL_PERSON_ZERO;
                   Self.MakeGrid(1);
                   Self.ActiveControl:=Self.StringGrid1;
                 end;
              i:=GetRow+1;
              if i>0 then
                 begin
                     if i=SavRow then
                        Self.StringGrid1.TopRow := SavTopRow;
                     Self.StringGrid1.Row := i;
                 end;
            finally
            free;
        end
      else
        begin
             if modeKadrySQL then
                with TFormFindKadryFB.Create(nil) do
                     try
                        if execute then
                           begin
                                WorkPlace:=GetShifrPod;
       //            GetParPerson(Tabno,Fio,NalCode,WorkPlace,RecNo);
                                FIO:=GetFio;
                                NalCode:=GetNalCode;
                                Tabno := GetTabno;
                                Make_Person(Curr_Person);
                                Curr_Person^.FIO      := SHORT_FIO(Fio);
                                Curr_Person^.TABNO    := Tabno;
                                Curr_Person^.Nal_Code := NalCode;
                                MakeGUID(Curr_Person);
                                Curr_Person^.FROM     := NSRV;
                                if WorkPlace=0 then
                                   begin
                                        Curr_Person^.MESTO_OSN_RABOTY:=NSRV;
                                        Curr_Person^.Wid_Raboty:=Osn_Wid_Raboty;
                                        SetWorkPlaceKadrySQL(NSRV,TABNO);
                                   end
                                else
                                   begin
                                        Curr_Person^.Wid_Raboty:=Sowm_Wid_Raboty;
                                        Curr_Person^.MESTO_OSN_RABOTY:=WorkPlace;
                                        SetUpSowm(Tabno,WorkPlace);
                                   end;
//                   MakeGrid;

                           end;
                     finally
       //             free;
                     end

             else
             with TFormKadryCl.Create(nil) do
               try
                  if execute then
                     begin
                          GetParPerson(Tabno,Fio,NalCode,WorkPlace,RecNo);
                          if WorkPlace=0 then
                             begin
                                  Make_Person(Curr_Person);
                                  Curr_Person^.FIO      := SHORT_FIO(Fio);
                                  Curr_Person^.TABNO    := Tabno;
                                  Curr_Person^.Nal_Code := NalCode;
                                  Curr_Person^.MESTO_OSN_RABOTY:=NSRV;
                                  Curr_Person^.FROM     := NSRV;
                                  MakeGUID(Curr_Person);
                               //   MakeGrid;
                                  SetWorkPlace(NSRV,RecNo);
                             end
                                         else
                             begin
                                  Make_Person(Curr_Person);
                                  Curr_Person^.FIO:=SHORT_FIO(Fio);
                                  Curr_Person^.TABNO:=Tabno;
                                  Curr_Person^.Nal_Code:=NalCode;
                                  Curr_Person^.Wid_Raboty:=Sowm_Wid_Raboty;
                                  Curr_Person^.MESTO_OSN_RABOTY:=WorkPlace;
                                  Curr_Person^.FROM:=NSRV;
                                  MakeGUID(Curr_Person);
                              //    MakeGrid;
                                  SetUpSowm(Tabno,WorkPlace);
                             end;

                     end;
               finally
                     free;
                     if Assigned(KadryList) then
                     if KadryList.Count>0   then
                        KadryList.Free;
                     Self.MakeGrid(1);
                     Self.ActiveControl:=Self.StringGrid1;
               end;

        end;
     StringGrid1.SetFocus;
end;

procedure TMainForm.N11Click(Sender: TObject);
begin
     if count_person=0 then Exit;
     manualSave:=True;
     Putinf;
     if nmes=FLOW_MONTH then
        CRC32Ori:=PodrCRC32;
     FormWaitMess.SetMessage('Данные сохранены');
     FormWaitMess.Show;
     repeat
            Application.ProcessMessages;
     until FormWaitMess.Timer1.Enabled=false;
     FormWaitMess.Hide;
     manualSave:=false;
     StringGrid1.SetFocus;
end;

procedure TMainForm.N12Click(Sender: TObject);
var i:integer;
    Curr_Person:Person_Ptr;
begin
     if count_person=0 then Exit;
     Curr_Person:=Head_Person;
     i:=1;
     while (Curr_Person<>Nil) do
      begin
           inc(i);
           if I=StringGrid1.Row then break;
              Curr_Person:=Curr_Person^.Next;
      end;
     if Curr_Person^.Wid_Raboty<>Osn_Wid_Raboty then
        begin
              ShowMessage('Список совмещений можно просмотреть только для основного места работы сотрудника');
              Exit;
        end;
     if Count_Sowm(Curr_Person)<=0 then
        begin
              ShowMessage('У этого работника нет совмещений');
              Exit;
        end;
     with TFormSowm.Create(nil) do
        try
            SetCurrPerson(Curr_Person);
            if execute then
              begin
                   LDEL_PERSON_ZERO;
                   Self.MakeGrid(1);
                   Self.ActiveControl:=Self.StringGrid1;
              end;
        finally
{        free;}
      end;
     StringGrid1.SetFocus;

end;


procedure TMainForm.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
      { Блокировка }
      if (Key='O') or (Key='o') or (Key='щ') or (Key ='Щ') then
         begin
               ActionReverseSwitchExecute(Sender);
               StringGrid1.SetFocus;
         end
      { Перерассчет }
     else if (Key='P') or (Key='p') or (Key='з') or (Key ='З') then
         begin
               ActionCalcPersonExecute(Sender);
               StringGrid1.SetFocus;
         end
     else if (Key='A') or (Key='a') or (Key='ф') or (Key ='ф') then
         begin
               ActionRecalcPodrExecute(Sender);
               StringGrid1.SetFocus;
         end;

end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      if NMES=FLOW_MONTH then
         begin
              CRC32New:=PodrCRC32;
              if CRC32Ori<>CRC32New then
              if YesNo('Сохранить данные?') then
                 begin
                      PUTINF;
                 end;
         end;
      if YesNo('Выйти из программы?') then
         begin
               Save_Pck_To_Register(StringGrid1.Row-1);
               if FIB.pFIBDatabaseSal.Connected then
                  begin
                       FIB.pFIBDatabaseSal.CloseDataSets;
                       FIB.pFIBDatabaseSal.Connected:=false;
                  end;
               if FIB.pFIBDatabaseArc.Connected then
                  begin
                       FIB.pFIBDatabaseArc.CloseDataSets;
                       FIB.pFIBDatabaseArc.Connected:=false;
                  end;
//               Action:=caFree;
         end
      else
          Action:=caNone;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
     SaveHintHidePause := Application.HintHidePause;
     // Сохраняем значения HintHidePause и HintPause в специально добавленных полях формы,
     SaveHintPause := Application.HintPause;
     // так Ваша форма не нарушит настроек параметров hint'а программы если они отличаются от стандартных.
     Application.HintHidePause := 5000;
     Application.HintPause := 300;
     Self.ActiveControl:=Self.StringGrid1;
     StringGrid1.SetFocus;
end;

procedure TMainForm.FormDeactivate(Sender: TObject);
begin
     Application.HintHidePause := SaveHintHidePause;
     // Восстанавливаем начальные значения.
     Application.HintPause := SaveHintPause;
end;
{
procedure TMainForm.ShowHint(var HintStr: string;
  var CanShow: Boolean; var HintInfo: THintInfo);
var
  ListRect, FormRect: TRect;
begin
  with HintInfo do
  begin
    if HintControl.ClassType = TStringGrid then
     // Проверяем находимся ли мы над ListBox'ом.
      with HintControl as TStringGrid do
      begin
            if (Col=1) then
               begin CursorPos
                     HintStr := Cells(Col,Row);
// Устанавливаем текст hint'а в значение пункта, над которым находится курсор.
          ListRect := ClientRect;
          ListRect.Top := ListRect.Top + (ItemAtPos(CursorPos, true) - TopIndex) * ItemHeight;
          ListRect.Bottom := ListRect.Top + ItemHeight;
          CursorRect := ListRect;
          GetWindowRect(Handle, FormRect);
// Определяем координаты текущей формы,
          HintInfo.HintPos := Point(ListRect.Left + FormRect.Left + 1,
// чтобы задать координаты hint'а
            ListRect.Top + FormRect.Top - 1);
// т.к. HintInfo.HintPos задаётся относительно экрана.
        end;
      end;
  end;
end;
}

procedure TMainForm.StringGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  r : integer;
  c : integer;
begin
     try
        StringGrid1.MouseToCell(X, Y, C, R);
        if (c<0) or (c+1>StringGrid1.ColCount) then Exit;
        if (r<0) or (r+1>StringGrid1.RowCount) then Exit;
        with StringGrid1 do
             begin
                  if ((CurrRow <> r) or(CurrCol <> c)) then
                      begin
                            CurrRow := r;
                            CurrCol := c;
                            Application.CancelHint;
                            StringGrid1.Hint :=StringGrid1.Cells[1,r];
                      end;
               end;
     except
       on EInvalidGridOperation do
       c:=1;
       else
           c:=1;
    end;

end;

procedure TMainForm.F41Click(Sender: TObject);
var i:integer;
    Curr_Person:Person_Ptr;
begin
    {$IFNDEF SVDN}
      if (
           (CURRYEAR<2014) or
           ((CURRYEAR=2014) and (NMES<=10))
         ) then
      if isSecretPodr(NSRV) then
         Exit;
    {$ENDIF}

     if count_person=0 then Exit;
     Curr_Person:=Head_Person;
     i:=1;
     while (Curr_Person<>Nil) do
      begin
           inc(i);
           if I=StringGrid1.Row then break;
           Curr_Person:=Curr_Person^.Next;
      end;
     with TFormCN.Create(nil) do
        try
            SetPerson(Curr_Person);
            if execute then
              begin
               if (Nmes<>Flow_Month) then
                   begin
                       ShowMessage('Изменения можно вносить только в текущий месяц');
                       Exit;
                   end;
                   LDEL_PERSON_ZERO;
                   if (RetCode=1) and (Nmes=Flow_Month)then
                      ActionCalcPersonExecute(Sender);
                   Self.MakeGrid(1);
                   Self.ActiveControl:=Self.StringGrid1;
              end;
        finally
{             free;}
        end;
     StringGrid1.SetFocus;

end;

procedure TMainForm.FireBird1Click(Sender: TObject);
begin
    Application.CreateForm(TFormToSQL, FormToSQL);
    FormToSQL.Show;

end;

procedure TMainForm.N13Click(Sender: TObject);
var Curr_Person:Person_Ptr;
     i:integer;
     RetVal:integer;
begin
    {$IFNDEF SVDN}
      if (
           (CURRYEAR<2014) or
           ((CURRYEAR=2014) and (NMES<=10))
         ) then
      if isSecretPodr(NSRV) then
         Exit;
    {$ENDIF}

     if count_person=0 then Exit;
     Curr_Person:=Head_Person;
     i:=1;
     while (Curr_Person<>Nil) do
      begin
           inc(i);
           if I=StringGrid1.Row then break;
              Curr_Person:=Curr_Person^.Next;
      end;
     if NeedCodePersonLine(Curr_Person^.Tabno) then Exit;
     with TFormTabel.Create(nil) do
        try
            SetCurrPerson(Curr_Person);
            if execute(RetVal) then
              begin
                   LDEL_PERSON_ZERO;
                   Self.MakeGrid(1);
                   Self.ActiveControl:=Self.StringGrid1;
              end
                      else
              begin
                   LDEL_PERSON_ZERO;
                   Self.MakeGrid(1);
                   Self.ActiveControl:=Self.StringGrid1;
              end;
{
              i:=GetRow-1;
              if i>0 then
                 Self.StringGrid1.Row:=i;
}
              i:=GetRow+1;
              if i>0 then
                 Self.StringGrid1.Row:=i;
      finally
        free;
      end;
     StringGrid1.SetFocus;

end;

procedure TMainForm.FireBirdClick(Sender: TObject);
begin
    Application.CreateForm(TFormSQLConnect, FormSQLConnect);
    FormSQLConnect.ShowModal;
end;

procedure TMainForm.StringGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      if (Key=VK_F2) then
         Self.N10Click(Sender)
      else if (Key=VK_F3) then
         Self.N13Click(Sender)
      else if (Key=VK_F4) then
         Self.F41Click(Sender)
      else if (Key=VK_F5) then
         StringGrid1DblClick(Sender);

end;

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      StringGrid1.SetFocus;
      self.StringGrid1KeyDown(Sender, Key, Shift);
end;

procedure TMainForm.N15Click(Sender: TObject);
begin
    Application.CreateForm(TFormSwodMode, FormSwodMode);
    FormSwodMode.ShowModal;
    StringGrid1.SetFocus;
end;

procedure TMainForm.N17Click(Sender: TObject);
begin
    Application.CreateForm(TFormArc, FormArc);
    FormArc.ShowModal;
    StringGrid1.SetFocus;

end;

procedure TMainForm.N18Click(Sender: TObject);
begin
    Application.CreateForm(TFormBoln, FormBoln);
    FormBoln.WantedMode:=0;
    FormBoln.ShowModal;
    StringGrid1.SetFocus;
end;

procedure TMainForm.N20Click(Sender: TObject);
begin
    Application.CreateForm(TFormEditIPodr, FormEditIPodr);
    FormEditIPodr.ShowModal;
    StringGrid1.SetFocus;
end;

procedure TMainForm.N22Click(Sender: TObject);
begin
    Application.CreateForm(TFormEditiKat, FormEditiKat);
    FormEditiKat.ShowModal;
    StringGrid1.SetFocus;

end;

procedure TMainForm.N23Click(Sender: TObject);
begin
    Application.CreateForm(TFormEditPrzB, FormEditPrzB);
    FormEditPrzB.ShowModal;
    StringGrid1.SetFocus;

end;

procedure TMainForm.N24Click(Sender: TObject);
begin
    Application.CreateForm(TFormBolKoe, FormBolKoe);
    FormBolKoe.ShowModal;
    StringGrid1.SetFocus;

end;

procedure TMainForm.N25Click(Sender: TObject);
begin
    Application.CreateForm(TFormOtp, FormOtp);
    FormOtp.ShowModal;
    StringGrid1.SetFocus;

end;

procedure TMainForm.ArcPerson;
var i:integer;
    Curr_Person:Person_Ptr;
begin
     Curr_Person:=Head_Person;
     i:=1;
     while (Curr_Person<>Nil) do
      begin
           inc(i);
           if I=StringGrid1.Row then break;
              Curr_Person:=Curr_Person^.Next;
      end;
     if Assigned(Curr_Person) then
        if Curr_Person^.Tabno>0 then
           begin
                Application.CreateForm(TFormArc, FormArc);
                FormArc.WantedMode:=1;
                FormArc.Tabno:=Curr_Person^.Tabno;
                FormArc.ShowModal;
           end;
     StringGrid1.SetFocus;

end;

procedure TMainForm.RecalcPerson;
var i:integer;
    Curr_Person:Person_Ptr;
begin
     Curr_Person:=Head_Person;
     i:=1;
     while (Curr_Person<>Nil) do
      begin
           inc(i);
           if I=StringGrid1.Row then break;
              Curr_Person:=Curr_Person^.Next;
      end;
     if Assigned(Curr_Person) then
        if Curr_Person^.Tabno>0 then
           begin
                Application.CreateForm(TFormRecalc, FormRecalc);
                FormRecalc.Tabno:=Curr_Person^.Tabno;
                FormRecalc.Show;
           end;
end;



procedure TMainForm.N26Click(Sender: TObject);
begin
    {$IFNDEF SVDN}
      if (
           (CURRYEAR<2014) or
           ((CURRYEAR=2014) and (NMES<=10))
         ) then
      if isSecretPodr(NSRV) then
         Exit;
    {$ENDIF}

     if count_person=0 then Exit;
     ArcPerson;
end;

procedure TMainForm.N27Click(Sender: TObject);
 var i:Integer;
     Curr_Person:PERSON_PTR;
     i64:Int64;
begin
     i64:=GetMemoryTotalPhys;
     ShowMessage('Обьем памяти '+IntToStr(I64)+' байт.');
  //   GetInfSQL(NMES,CurrYear);
     Exit;
     if count_person=0 then Exit;
{
     Curr_Person:=Head_Person;
     i:=1;
     while (Curr_Person<>Nil) do
      begin
           inc(i);
           if I=StringGrid1.Row then break;
              Curr_Person:=Curr_Person^.Next;
      end;
     if Assigned(Curr_Person) then
        if Curr_Person^.Tabno>0 then
           begin
                TestCDS(Curr_Person);
           end;
 }
      TestCDSPodr;
  //      TestCDSFull;
//     TestCDS;
   //  RecalcPerson;
end;

procedure TMainForm.ToolButton1Click(Sender: TObject);
begin
     N8Click(Sender)
end;

procedure TMainForm.ToolButton2Click(Sender: TObject);
begin
     N8Click(Sender);
end;

procedure TMainForm.ToolButton3Click(Sender: TObject);
begin
     N10Click(Sender);
end;

procedure TMainForm.N28Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelLeraSwodMode,FormSelLeraSwodMode);
    FormSelLeraSwodMode.ShowModal;
end;

procedure TMainForm.N29Click(Sender: TObject);
begin
    Application.CreateForm(TFormOPE,FormOPE);
    FormOPE.Show;

end;

procedure TMainForm.ActionBolnPersonExecute(Sender: TObject);
var i,c_b,c_a:integer;
    Curr_Person:Person_Ptr;
    s:string;
begin
     if count_person=0 then Exit;
     Curr_Person:=Head_Person;
     i:=1;
     while (Curr_Person<>Nil) do
      begin
           inc(i);
           if I=StringGrid1.Row then break;
              Curr_Person:=Curr_Person^.Next;
      end;
     if Assigned(Curr_Person) then
        if Curr_Person^.Tabno>0 then
{           if not Assigned(FormBlnAbo) then}
              begin
                   Application.CreateForm(TFormBlnAbo,FormBlnAbo);
                   FormBlnAbo.WantedTabno:=Curr_Person^.Tabno;
                   FormBlnAbo.WantedFIO:=Curr_Person^.FIO+' '+Curr_Person^.Dolg;
                   FormBlnAbo.ShifrKat:=Curr_Person^.Kategorija;
                   FormBlnAbo.ShifrGru:=Curr_Person^.Gruppa;
                   FormBlnAbo.WantedCurrPerson:=Curr_Person;
                   FormBlnAbo.WantedMode:=0;
                   c_b:=count_person;
                   FormBlnAbo.ShowModal;
                   c_a:=count_person;
                   if c_b<>c_a then
                      begin
                           Self.MakeGrid(1);
                           Self.ActiveControl:=Self.StringGrid1;
                           Self.StringGRid1.Row:=I;
                      end;
              end;
 {          else FormBlnAbo.SetFocus;}
    s:=Screen.ActiveForm.Name;
     StringGrid1.SetFocus;
    if Screen.ActiveForm.ActiveControl<>Nil then
       s:=Screen.ActiveForm.ActiveControl.Name;
    c_a:=0;
 //    StringGrid1.SetFocus;
end;

procedure TMainForm.SwitchConnectionStatus(bStatus: byte);
begin
     { Green=0 Red=1}
     if bStatus = 1 then begin    { Красный - нет соединения }
        StatusBar1.Panels[0].Text:='Сервер отключен...';
     end;
     if bStatus = 0 then begin    { Зеленый - есть соединение }
        StatusBar1.Panels[0].Text:='Сервер подключен...';
     end;
{  StatusBar1.Repaint;  }
  Application.ProcessMessages;
end;

procedure TMainForm.SwitchTransactionStatus(bStatus: byte);
var I1,i2:integer;
begin
     { Green=0 Red=1}
     if bStatus = 1 then begin    { Красный - нет соединения }
        StatusTransaction:=false;
        ImageList1.Draw(StatusBar1.Canvas,StatusBar1.Panels[0].Width+10,2,1);
     end;
     if bStatus = 0 then begin    { Зеленый - есть соединение }
        StatusTransaction:=True;
        ImageList1.Draw(StatusBar1.Canvas,StatusBar1.Panels[0].Width+10,2,0);
     end;
     i1:=FIB.pFIBDatabaseSal.ActiveTransactionCount;
     i2:=FIB.pFIBDatabaseArc.ActiveTransactionCount;
{     StatusBar1.Panels[2].Text:=IntToStr(I1)+'-'+IntToStr(I2);}
{     StatusBar1.Repaint;}
     Application.ProcessMessages;
     ShowTransactionStatus;
end;

procedure TMainForm.ShowNmbOfTransAct;
 var S:string;
 begin
      s:=IntToStr(NmbOfTransactSal)+'-'+IntToStr(NmbOfTransactArc);
      StatusBar1.Panels[2].Text:=s;
      Application.ProcessMessages;
 end;
procedure TMainForm.ShowTransactionStatus;
 var I1,I2:integer;
 begin
      if StatusTransaction then
        ImageList1.Draw(StatusBar1.Canvas,StatusBar1.Panels[0].Width+10,2,0)
                           else
        ImageList1.Draw(StatusBar1.Canvas,StatusBar1.Panels[0].Width+10,2,1);
{
      i1:=FIB.pFIBDatabaseSal.ActiveTransactionCount;
      i2:=FIB.pFIBDatabaseArc.ActiveTransactionCount;
      StatusBar1.Panels[2].Text:=IntToStr(I1)+'-'+IntToStr(I2);
}      
{      StatusBar1.Repaint;}
      Application.ProcessMessages;
 end;
procedure TMainForm.StatusMessage(S:String);
 begin
      StatusBar1.Panels[0].Text:=S;
 end;

procedure TMainForm.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
var No:Integer;
    I1,I2:integer;
begin
     { Green=0 Red=1}
     if StatusTransaction then No:=0
                          Else No:=1;
     ImageList1.Draw(StatusBar.Canvas,StatusBar.Panels[No].Width+10,2,0);
{
     i1:=FIB.pFIBDatabaseSal.ActiveTransactionCount;
     i2:=FIB.pFIBDatabaseArc.ActiveTransactionCount;
     StatusBar1.Panels[2].Text:=IntToStr(I1)+'-'+IntToStr(I2);
}     
{     StatusBar1.Repaint;}
     Application.ProcessMessages;

end;

procedure TMainForm.FormPaint(Sender: TObject);
begin
      ShowTransactionStatus;
      Self.SetFocus;
end;

procedure TMainForm.ActionRecalcPPSSFZExecute(Sender: TObject);
begin
    if (NMES<>FLOW_MONTH) then
       begin
            ShowMessage('Перерасчет можно выполнить только в текущем месяце ');
            Exit;
       end;

    if count_person=0 then  Exit;
    Application.CreateForm(TFormRecalcPECB, FormRecalcPECB);
    FormRecalcPECB.ShowModal;
{
    Application.CreateForm(TFormRecalcPPSZ, FormRecalcPPSZ);
    FormRecalcPPSZ.ShowModal;
}
    StringGrid1.SetFocus;

end;

procedure TMainForm.N20051Click(Sender: TObject);
begin
     ActionRecalcPPSSFZExecute(Sender);
end;

procedure TMainForm.N31Click(Sender: TObject);
begin
    Application.CreateForm(TFormMonthsHea,FormMonthsHea);
    FormMonthsHea.ShowModal;
{
    Application.CreateForm(TFormEditGruppy, FormEditGruppy);
    FormEditGruppy.ShowModal;
}
end;

procedure TMainForm.MemBudExecute(Sender: TObject);
begin
    Application.CreateForm(TFormMemBud, FormMemBud);
    FormMemBud.ShowModal;
    StringGrid1.SetFocus;

end;

procedure TMainForm.N32Click(Sender: TObject);
begin
    Application.CreateForm(TFormSwodKafGru, FormSwodKafGru);
    FormSwodKafGru.ShowModal;
end;

procedure TMainForm.N33Click(Sender: TObject);
VAR  J:INTEGER;
begin
     j:=Fib.pFIBDatabaseSal.TransactionCount;
     j:=j;
     Application.CreateForm(TFormAlim, FormAlim);
     j:=Fib.pFIBDatabaseSal.TransactionCount;
     j:=j;
    FormAlim.ShowModal;
end;

procedure TMainForm.ActionRListExecute(Sender: TObject);
var Tabno:integer;
    FIO:String;
    Curr_Person:Person_Ptr;
    i:integer;
begin
    {$IFNDEF SVDN}
      if (
           (CURRYEAR<2014) or
           ((CURRYEAR=2014) and (NMES<=10))
         ) then
      if isSecretPodr(NSRV) then
         Exit;
    {$ENDIF}

     if count_person=0 then Exit;
     Curr_Person:=Head_Person;
     i:=1;
     while (Curr_Person<>Nil) do
      begin
           inc(i);
           if I=StringGrid1.Row then break;
              Curr_Person:=Curr_Person^.Next;
      end;
     if Assigned(Curr_Person) then
        if Curr_Person^.Tabno>0 then
           begin
                with TFormRList.Create(nil) do
                     try
                        Tabno:=Curr_Person^.TABNO;
                        Fio:=Curr_Person^.FIO;
                        SetParam(Tabno,FIO);
                        if execute then
                           begin
                           end;
                     finally
{                     free;}
                     END
           end
end;

procedure TMainForm.N35Click(Sender: TObject);
begin
{      ActionRListExecute(Sender);     }
      ActionBolnPersonExecute(Sender);
end;

procedure TMainForm.ActionOtpPersonExecute(Sender: TObject);
var i,SavRow:integer;
    Curr_Person:Person_Ptr;
    shifrDol:integer;
begin
     if count_person=0 then Exit;
     Curr_Person:=Head_Person;
     i:=1;
     while (Curr_Person<>Nil) do
      begin
           inc(i);
           if I=StringGrid1.Row then break;
              Curr_Person:=Curr_Person^.Next;
      end;
     if Assigned(Curr_Person) then
        if Curr_Person^.Tabno>0 then
           if (Curr_Person^.WID_RABOTY = 1) or
               ((Curr_Person^.WID_RABOTY <> 1) and
                 (
                   (Curr_Person^.MESTO_OSN_RABOTY=82)
                   or
                   (checkNeedDolgTest(GET_DOL_CODE(curr_person)))
                 )
               )
           then
               begin
                    Application.CreateForm(TFormOtpAbo,FormOtpAbo);
                    FormOtpAbo.WantedTabno:=Curr_Person^.Tabno;
                    FormOtpAbo.WantedFIO:=Curr_Person^.FIO+' '+Curr_Person^.Dolg;
                    FormOtpAbo.ShifrKat:=Curr_Person^.Kategorija;
                    FormOtpAbo.ShifrGru:=Curr_Person^.Gruppa;
                    FormOtpAbo.WantedCurrPerson:=Curr_Person;
                    FormOtpAbo.ShowModal;
                    SavRow:= StringGrid1.Row;
                    Self.MakeGrid(1);
                    Self.ActiveControl:=Self.StringGrid1;
                   StringGrid1.Row:=SavRow;
               end
           else
               ShowMessage('Отпускные можно просмотреть только для основного места работы');
end;

procedure TMainForm.ActionCalcPersonExecute(Sender: TObject);
begin
    {$IFNDEF SVDN}
      if (
           (CURRYEAR<2014) or
           ((CURRYEAR=2014) and (NMES<=10))
         ) then
      if isSecretPodr(NSRV) then
         Exit;
    {$ENDIF}

        RecalcPersonWithWantedMode(2);
end;

procedure TMainForm.ActionReverseSwitchExecute(Sender: TObject);
var J,I:integer;
    Curr_Person:Person_Ptr;
begin
               if Count_Person=0 then Exit;
               J:=Count_Person;
               if StringGrid1.Row<=j+1 then
                  begin
                        i:=0;
                        Curr_Person:=Head_Person;
                        while (Curr_Person<>Nil) do
                              begin
                                   inc(i);
                                   if (i=StringGrid1.Row-1) then
                                      begin
                                           Curr_Person^.AUTOMATIC:=2-Curr_Person^.AUTOMATIC+1;
                                           MakeColorRow(StringGrid1.Row);
                                           break;
                                      end;
                                   Curr_Person:=Curr_Person^.NEXT;
                              end;
                  end;
{               StringGrid1.Refresh;        }
{               MakeGrid(StringGrid1.Row-1);}
               StringGrid1.Refresh;
               Self.ActiveControl:=Self.StringGrid1;

end;

procedure TMainForm.ActionEditKadryClarionExecute(Sender: TObject);
var PathName  : String;
    PPathName : PChar;
    KZ        : LongInt;
    Ini       : TIniFile;
    CmdString : string;
    fName     : string;
begin
     if modeKadrySQL then
        begin
             ActionBrowseKadryFBExecute(Sender);
             Exit;
        end;
{
      PathName:='C:\C55\EXAMPLES\LMSI';
      if not DirectoryExists(PathName) then
         begin
              ShowMessage(PathName);
              Exit;
         end;
      PPathName:=@PathName;
      ShellExecute(0,
                   'kadry.exe',
                   PPathName,
                            nil,
                            nil,
                            SW_SHOWNORMAL);
}
{
      WinExec('C:\C55\EXAMPLES\LMSI\KADRY.EXE',
                    sw_ShowNormal);
}
      fName:=getIniFileName;
//      Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
      Ini := TIniFile.Create(fName );
      try
         CmdString := Ini.ReadString( 'Parameters', 'EditKadryProc', '' )
      finally
         Ini.Free;
      end;

{    Kz:=WinExecAndWait32('C:\C55\EXAMPLES\LMSI\KADRY.EXE', 1);}
{    Kz:=WinExecAndWait32('D:\ZARPLATA\CLARION\LMSI\KDRY.EXE', 1);}
    Kz:=WinExecAndWait32(CmdString, 1);
    if (Kz>0) and (KZ<32) then
        ShowMessage('Ошибка запуска редактора кадров '+IntToStr(Kz));

end;

procedure TMainForm.TimerMainTimer(Sender: TObject);
begin
     if Fib.pFIBDatabaseSal.Connected then SwitchConnectionStatus(0)
                                      else SwitchConnectionStatus(1);
{     if Fib.pFIBTransactionSAL.Active then SwitchTransactionStatus(1)
                                      else SwitchTransactionStatus(0);
}
     if Fib.pFIBTransactionSAL.InTransaction then SwitchTransactionStatus(1)
                                             else SwitchTransactionStatus(0);
     if Screen.ActiveForm=Self then
     if Screen.ActiveForm.ActiveControl<>StringGrid1 then
        StringGrid1.SetFocus;
end;

procedure TMainForm.StartTransactionSal;
  begin
        Inc(NmbOfTransactSal);
        NmbOfTransactSal:=FIB.pFIBDatabaseSal.ActiveTransactionCount;
        Self.ShowNmbOfTransAct;
  end;
procedure TMainForm.StartTransactionArc;
  begin
        Inc(NmbOfTransactArc);
        Self.ShowNmbOfTransAct;
  end;
procedure TMainForm.EndTransactionArc;
  begin
        Dec(NmbOfTransactArc);
        Self.ShowNmbOfTransAct;
  end;
procedure TMainForm.EndTransactionSal;
  begin
        if NmbOfTransactSal>0 then
        Dec(NmbOfTransactSal);
        NmbOfTransactSal:=FIB.pFIBDatabaseSal.ActiveTransactionCount;
        Self.ShowNmbOfTransAct;
  end;
procedure TMainForm.SXTRStarted(var Msg:TMessage);
 begin
{       ShowMessage('Event '+IntToStr(Msg.Msg)+' WParam='+IntToStr(Msg.WParam)+' LParam='+IntToStr(Msg.LParam));}
       case Msg.WParam of
         1 : case Msg.LParam of
                     1 : StartTransactionSal;
                     2 : EndTransactionSal;
             end;
         2 : case Msg.LParam  of
                     1 : StartTransactionArc;
                     2 : EndTransactionArc;
             end
       end
 end;

procedure TMainForm.ActionPlatExecute(Sender: TObject);
begin
    Application.CreateForm(TFormPlatGen, FormPlatGen);
    FormPlatGen.ShowModal;
end;

procedure TMainForm.N43Click(Sender: TObject);
begin
    Application.CreateForm(TFormSwodAlim, FormSwodAlim);
    FormSwodAlim.ShowModal;
end;

procedure TMainForm.ActionTestRecalcPersonExecute(Sender: TObject);
var J,I:integer;
    Curr_Person:Person_Ptr;
    Finded:boolean;
begin
      Finded:=false;
      if Count_Person=0 then Exit;
      J:=Count_Person;
      if StringGrid1.Row<=J then
         begin
              i:=0;
              Curr_Person:=Head_Person;
              while (Curr_Person<>Nil) do
               begin
                    inc(i);
                    if (i=StringGrid1.Row-1) then
                       begin
                            Finded:=true;
                            break;
                       end;
                     Curr_Person:=Curr_Person^.NEXT;
               end;
         end;
      if Finded then
         begin
              FormRecalcPersonU.Curr_Person:=Curr_Person;
              Application.CreateForm(TFormTestRecalcPerson, FormTestRecalcPerson);
              FormTestRecalcPerson.ShowModal;
         end;
end;

procedure TMainForm.N45Click(Sender: TObject);
begin
    Application.CreateForm(TFormSwodGt2660, FormSwodGt2660);
    FormSwodGt2660.ShowModal;
end;

procedure TMainForm.N46Click(Sender: TObject);
begin
    Application.CreateForm(TFormSwodSS,FormSwodSS);
    FormSwodSS.ShowModal;
end;

procedure TMainForm.N47Click(Sender: TObject);
begin
    Application.CreateForm(TFormSwodTemy,FormSwodTemy);
    FormSwodTemy.ShowModal;
end;

procedure TMainForm.N48Click(Sender: TObject);
var PathName  : String;
    PPathName : PChar;
    KZ        : LongInt;
    Ini       : TIniFile;
    CmdString : string;
    fName     : string;
begin
      fName:=getIniFileName;
//      Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
      Ini := TIniFile.Create(fName);
      try
         CmdString := Ini.ReadString( 'Parameters', 'EditTemyProc', '' )
      finally
         Ini.Free;
      end;

    Kz:=WinExecAndWait32(CmdString, 1);
    if (Kz>0) and (KZ<32) then
        ShowMessage('Ошибка запуска редактора тем '+IntToStr(Kz));

end;

procedure TMainForm.N51Click(Sender: TObject);
begin
    Application.CreateForm(TFormListVypl, FormListVypl);
    FormListVypl.ShowModal;
end;

procedure TMainForm.N52Click(Sender: TObject);
 var WantedRow:integer;
begin
    if (NMES<>FLOW_MONTH) then
       begin
            ShowMessage('Аванс можно сформировать только в текущем месяце ');
            Exit;
       end;
    WantedRow := StringGrid1.Row;
    if isSVDN then
       begin
            Application.CreateForm(TFormMakeAwans, FormMakeAwans);
            FormMakeAwans.ShowModal;
       end
    else
       begin
            Application.CreateForm(TFormMakeAwansLNR, FormMakeAwansLNR);
            FormMakeAwansLNR.ShowModal;
       end;

    Self.MakeGrid(WantedRow);
    Self.ActiveControl:=Self.StringGrid1;
end;



procedure TMainForm.N54Click(Sender: TObject);
begin
    Application.CreateForm(TFormMakePens, FormMakePens);
    FormMakePens.ShowModal;
end;

procedure TMainForm.N010320081Click(Sender: TObject);
begin
    Application.CreateForm(TFormMovRecalc08, FormMovRecalc08);
    FormMovRecalc08.ShowModal;
end;

procedure TMainForm.N20072Click(Sender: TObject);
begin
    Application.CreateForm(TFormPersonofic, FormPersonofic);
    FormPersonofic.ShowModal;
end;

procedure TMainForm.N55Click(Sender: TObject);
begin
    Application.CreateForm(TFormMovUkrFIO,FormMovUkrFIO);
    FormMovUkrFIO.ShowModal;
end;

procedure TMainForm.N49Click(Sender: TObject);
begin
//    Application.CreateForm(TFormMakeAllChain,FormMakeAllChain);
//    FormMakeAllChain.ShowModal;

end;

procedure TMainForm.N56Click(Sender: TObject);
begin
     ActionRecalcPPSSFZExecute(Sender);
end;

procedure TMainForm.N57Click(Sender: TObject);
begin
    Application.CreateForm(TFormIndex, FormIndex);
    FormIndex.ShowModal;
end;

procedure TMainForm.N58Click(Sender: TObject);
begin
{    Application.CreateForm(TFormListVypl, FormListVypl);
    FormListVypl.ShowModal;
}
    Application.CreateForm(TFormParSal, FormParSal);
    FormParSal.ShowModal;

end;

procedure TMainForm.N60Click(Sender: TObject);
begin
    Application.CreateForm(TFormYSpr, FormYSpr);
    FormYSpr.ShowModal;
end;

procedure TMainForm.N61Click(Sender: TObject);
begin
    Application.CreateForm(TFormKreditSpr, FormKreditSpr);
    FormKreditSpr.ShowModal;
end;

procedure TMainForm.Excel1Click(Sender: TObject);
begin
    Application.CreateForm(TFormAutoRep, FormAutoRep);
    FormAutoRep.ShowModal;
end;



procedure TMainForm.FastReport1Click(Sender: TObject);
begin
    Application.CreateForm(TFormFRXAutoSwod, FormFRXAutoSwod);
    FormFRXAutoSwod.ShowModal;
end;

procedure TMainForm.N63Click(Sender: TObject);
begin
  // if CurrRight=5 then
       begin
            Application.CreateForm(TFormEditPodr, FormEditPodr);
            FormEditPodr.ShowModal;
       end;
{                   else
       begin
             ShowMessage('Нет прав');
       end;
}
end;

procedure TMainForm.N65Click(Sender: TObject);
begin
    Application.CreateForm(TFormEditShifr, FormEditShifr);
    FormEditShifr.ShowModal;
end;

procedure TMainForm.N64Click(Sender: TObject);
begin
    Application.CreateForm(TFormEditGruppy, FormEditGruppy);
    FormEditGruppy.ShowModal;
end;

procedure TMainForm.N66Click(Sender: TObject);
begin
    Application.CreateForm(TFormRazr, FormRazr);
    FormRazr.ShowModal;
end;

procedure TMainForm.N67Click(Sender: TObject);

begin
   Application.CreateForm(TFormMinSalSpr, FormMinSalSpr);
   FormMinSalSpr.ShowModal;

end;

procedure TMainForm.ActionRecalcPodrExecute(Sender: TObject);
 var WantedRow:integer;
begin
     if (NMES<>Flow_Month) then
        begin
             ShowMessage('Перерасчет возможен только в текущем месяце.');
             Exit;
        end;
     if Count_Person<1 then Exit;
     WantedRow := StringGrid1.Row;
     Application.CreateForm(TFormRecalcPodr, FormRecalcPodr);
     FormRecalcPodr.Show;
     FormRecalcPodr.BitBtn1Click(Nil);
     Self.MakeGrid(WantedRow);
{     Self.ActiveControl:=Self.StringGrid1;    }
     Self.SetFocus;
     Self.SetFocusedControl(Self.StringGrid1);
     if Self.StringGrid1.Focused then
        WantedRow:=WantedRow
     else
        WantedRow:=WantedRow;
end;

procedure TMainForm.N59Click(Sender: TObject);
begin
//      Self.Close;
end;
procedure TMainForm.N68Click(Sender: TObject);
begin
   Application.CreateForm(TFormMpSwod, FormMpSwod);
   FormMpSwod.ShowModal;
end;

procedure TMainForm.N69Click(Sender: TObject);
begin
   Application.CreateForm(TFormDolg, FormDolg);
   FormDolg.ShowModal;
end;

procedure TMainForm.N21Click(Sender: TObject);
begin
   Application.CreateForm(TFormIGruppy, FormIGruppy);
   FormIGruppy.ShowModal;
end;

procedure TMainForm.N70Click(Sender: TObject);
begin
   Application.CreateForm(TFormEditDayClock, FormEditDayClock);
   FormEditDayClock.ShowModal;
end;

procedure TMainForm.ApplicationCreateFormTFormListVyplFormListVypl1Click(
  Sender: TObject);
begin
   Application.CreateForm(TFormRepairTableForOtp, FormRepairTableForOtp);
   FormRepairTableForOtp.ShowModal;

end;

procedure TMainForm.NSecretWorkerClick(Sender: TObject);
begin
   Application.CreateForm(TFormEditSecretTabno, FormEditSecretTabno);
   FormEditSecretTabno.ShowModal;

end;

procedure TMainForm.N72Click(Sender: TObject);
begin
   Application.CreateForm(TFormEditParSelPlat, FormEditParSelPlat);
   FormEditParSelPlat.ShowModal;

end;

procedure TMainForm.N73Click(Sender: TObject);
begin
   Application.CreateForm(TFormEditTemy, FormEditTemy);
   FormEditTemy.ShowModal;
end;

procedure TMainForm.N74Click(Sender: TObject);
begin
     Application.CreateForm(TFormTestBoln, FormTestBoln);
     FormTestBoln.ShowModal;
end;

procedure TMainForm.ActionKomandirowkiPersonExecute(Sender: TObject);
var i:integer;
    Curr_Person:Person_Ptr;
begin
     if count_person=0 then Exit;
     Curr_Person:=Head_Person;
     i:=1;
     while (Curr_Person<>Nil) do
      begin
           inc(i);
           if I=StringGrid1.Row then break;
              Curr_Person:=Curr_Person^.Next;
      end;
     if Assigned(Curr_Person) then
        if Curr_Person^.Tabno>0 then
{           if not Assigned(FormBlnAbo) then}
              begin
                   if isLNR then
                       begin
                            Application.CreateForm(TFormKmndAbo,FormKmndAbo);
                            FormKmndAbo.WantedTabno := Curr_Person^.Tabno;
                            FormKmndAbo.WantedFIO   := Curr_Person^.FIO+' '+Curr_Person^.Dolg;
                            FormKmndAbo.ShifrKat    := Curr_Person^.Kategorija;
                            FormKmndAbo.ShifrGru    := Curr_Person^.Gruppa;
                            FormKmndAbo.WantedCurrPerson:=Curr_Person;
                            FormKmndAbo.ShowModal;
                       end
                   else
                       begin
                            Application.CreateForm(TFormBlnAbo,FormBlnAbo);
                            FormBlnAbo.WantedTabno := Curr_Person^.Tabno;
                            FormBlnAbo.WantedFIO   := Curr_Person^.FIO+' '+Curr_Person^.Dolg;
                            FormBlnAbo.ShifrKat    := Curr_Person^.Kategorija;
                            FormBlnAbo.ShifrGru    := Curr_Person^.Gruppa;
                            FormBlnAbo.WantedCurrPerson:=Curr_Person;
                            FormBlnAbo.WantedMode:=10;
                            FormBlnAbo.ShowModal;
                       end;

{
                   FormKmndAbo:=TFormKmndAbo.CreateKmndForm(Self,Curr_Person);
                   FormKmndAbo.ShowModal;
}
              end;
//     if IsShifrInAddPerson(Curr_Person,138) then
//        begin
//             i:=i;
//        end;

 {          else FormBlnAbo.SetFocus;}
    { StringGrid1.SetFocus;}
end;

procedure TMainForm.N75Click(Sender: TObject);
begin
    if isLNR then
//    if false then
       begin
            Application.CreateForm(TFormKomand, FormKomand);
            FormKomand.ShowModal;
       end
    else
       begin
            Application.CreateForm(TFormBoln, FormBoln);
            FormBoln.WantedMode:=10;
            FormBoln.ShowModal;
       end;
    StringGrid1.SetFocus;
end;

procedure TMainForm.N77Click(Sender: TObject);
begin
     if YesNo('Вы хотите очистить временные таблицы, которые используются для расчета больничных.'+#13#10+
              ' Проверьте, чтобы никто не начислял в этот момент больничные'+#13#10+
              ' И нажмите кнопкку ДА, если хотите продолжить') then
        begin
             DeleteAllFromTmpBolnTables;
             FormWaitMess.SetMessage('Табл.очищены');
             FormWaitMess.Show;
             repeat
                   Application.ProcessMessages;
             until FormWaitMess.Timer1.Enabled=false;
             FormWaitMess.Hide;
        end;
end;

procedure TMainForm.N78Click(Sender: TObject);
begin
     if YesNo('Вы хотите очистить временные таблицы, которые используются для расчета отпускных.'+#13#10+
              ' Проверьте, чтобы никто не начислял в этот момент отпускные'+#13#10+
              ' И нажмите кнопкку ДА, если хотите продолжить') then
        begin
             DeleteAllFromTmpOtpTables;
             FormWaitMess.SetMessage('Табл.очищены');
             FormWaitMess.Show;
             repeat
                   Application.ProcessMessages;
             until FormWaitMess.Timer1.Enabled=false;
             FormWaitMess.Hide;
        end;
end;

procedure TMainForm.N79Click(Sender: TObject);
begin
 //   FormWait.Show;
    Application.ProcessMessages;
    Application.CreateForm(TFormMoveNewOkladToRazr, FormMoveNewOkladToRazr);
    FormMoveNewOkladToRazr.ShowModal;
    StringGrid1.SetFocus;
end;

procedure TMainForm.N110Click(Sender: TObject);
begin
    Application.CreateForm(TForm1DF, Form1DF);
    Form1DF.ShowModal;
    StringGrid1.SetFocus;
end;

procedure TMainForm.N80Click(Sender: TObject);
begin
    Application.CreateForm(TFormGrid, FormGrid);
    FormGrid.ShowModal;
    StringGrid1.SetFocus;
end;

procedure TMainForm.N82Click(Sender: TObject);
begin
    Application.CreateForm(TFormPlanSwod, FormPlanSwod);
    FormPlanSwod.ShowModal;
    StringGrid1.SetFocus;
end;

procedure TMainForm.N83Click(Sender: TObject);
begin
    Application.CreateForm(TFormMakeALLGuid, FormMakeALLGuid);
    FormMakeALLGuid.ShowModal;
    StringGrid1.SetFocus;
end;

procedure TMainForm.N84Click(Sender: TObject);
begin
    if not YesNo('Сгенерировать данные за текущий месяц?') then Exit;
    Application.CreateForm(TFormGen, FormGen);
    FormGen.ShowModal;
    StringGrid1.SetFocus;

end;

procedure TMainForm.N85Click(Sender: TObject);
begin
      Self.Close;
end;

procedure TMainForm.N86Click(Sender: TObject);
begin
    FormWait.Show;
    Application.ProcessMessages;
    Application.CreateForm(TFormPivotDolg, FormPivotDolg);
    FormWait.Hide;
    Application.ProcessMessages;
    FormPivotDolg.ShowModal;
    StringGrid1.SetFocus;
end;

procedure TMainForm.N87Click(Sender: TObject);
begin
    Application.CreateForm(TFormSBSSpr, FormSBSSpr);
    FormSBSSpr.ShowModal;
    StringGrid1.SetFocus;

end;

procedure TMainForm.N89Click(Sender: TObject);
begin
     Application.CreateForm(TFormListPerepl,FormListPerepl);
     FormListPerepl.ShowModal;
end;

procedure TMainForm.N90Click(Sender: TObject);
begin
     Application.CreateForm(TFormListDblVpl,FormListDblVpl);
     FormListDblVpl.ShowModal;
end;

procedure TMainForm.N91Click(Sender: TObject);
begin
     Application.CreateForm(TFormTstGruPrsnAddUd,FormTstGruPrsnAddUd);
     FormTstGruPrsnAddUd.ShowModal;
end;

procedure TMainForm.N92Click(Sender: TObject);
begin
     Application.CreateForm(TFormPrepRl,FormPrepRl);
     FormPrepRl.ShowModal;
end;

procedure TMainForm.N94Click(Sender: TObject);
begin
     Application.CreateForm(TFormRecalcNalCurr,FormRecalcNalCurr);
     FormReCalcNalCurr.ShowModal;
     MakeGrid(StringGrid1.Row);
     Self.ActiveControl:=Self.StringGrid1;
     StringGrid1.Refresh;
     StringGrid1.SetFocus;
end;

procedure TMainForm.N93Click(Sender: TObject);
begin
     if CntFormRptSL=0 then
        begin
             Application.CreateForm(TFormRptSl,FormRptSl);
             FormRptSl.Show;
        end;


end;

procedure TMainForm.N96Click(Sender: TObject);
begin
     Application.CreateForm(TFormDelWantedUd,FormDelWantedUd);
     FormDelWantedUd.ShowModal;

end;

procedure TMainForm.GUIDSQL1Click(Sender: TObject);
begin
     Application.CreateForm(TFormMoveGUID,FormMoveGUID);
     FormMoveGUID.ShowModal;
end;

procedure TMainForm.N95Click(Sender: TObject);
begin
     Application.CreateForm(TFormNotUkr,FormNotUkr);
     FormNotUkr.ShowModal;
end;

procedure TMainForm.N20102Click(Sender: TObject);
begin
     Application.CreateForm(TFormPersMonthMenu, FormPersMonthMenu);
     FormPersMonthMenu.ShowModal;
end;

procedure TMainForm.N20111Click(Sender: TObject);
begin
     Application.CreateForm(TFormECBMonthMenu, FormECBMonthMenu);
     FormECBMonthMenu.ShowModal;
end;

procedure TMainForm.ActionEditSwidExecute(Sender: TObject);
begin
     Application.CreateForm(TFormSSNomera, FormSSNomera);
     FormSSNomera.ShowModal;
end;

procedure TMainForm.N97Click(Sender: TObject);
begin
     ActionEditSwidExecute(Sender);
end;

procedure TMainForm.N98Click(Sender: TObject);
begin
     Application.CreateForm(TFormReeBoln, FormReeBoln);
     FormReeBoln.ShowModal;
end;

procedure TMainForm.N100Click(Sender: TObject);
begin
     if CntFormRptTstECB=0 then
        begin
             Application.CreateForm(TFormRptTstECB,FormRptTstECB);
             FormRptTstECB.Show;
        end;
end;

procedure TMainForm.N101Click(Sender: TObject);
begin
     if CntFormRptTstECB1=0 then
        begin
             Application.CreateForm(TFormRptTstECB1,FormRptTstECB1);
             FormRptTstECB1.Show;
        end;

end;


procedure TMainForm.N103Click(Sender: TObject);
begin
     ActionEditSwidExecute(Sender);
end;

procedure TMainForm.N20112Click(Sender: TObject);
begin

      Application.CreateForm(TFormMakeALLTabel032011,FormMakeALLTabel032011);
      FormMakeALLTabel032011.ShowModal;
end;

procedure TMainForm.N105Click(Sender: TObject);
begin
     if CntFormTstOsnMR=0 then
        begin
             Application.CreateForm(TFormTstOsnMR,FormTstOsnMR);
             FormTstOsnMR.Show;
        end;

end;

procedure TMainForm.N104Click(Sender: TObject);
begin
    Application.CreateForm(TFormMakeAllChain,FormMakeAllChain);
    FormMakeAllChain.ShowModal;
end;

procedure TMainForm.ActionRecalcPersonForMonthExecute(Sender: TObject);
var M,Y,J,I:integer;
    Curr_Person:Person_Ptr;
    RecalcMode,RecalcProgram:Integer;
begin
     if nmes<>flow_month then
        begin
             ShowMessage('Перерасчет только в текущем месяце');
             Exit;
        end;
     if count_person=0 then Exit;

     if not GetMonYear(M,Y,RecalcMode,RecalcProgram) then Exit;
     if ((m<1) or (m>12)) then
        begin
             ShowMessage('Неверно указан месяц');
             Exit;
        end;
     if ((y<2011) or (y>2021)) then
        begin
             ShowMessage('Неверно указан год');
             Exit;
        end;
     J:=Count_Person;
     if StringGrid1.Row<=j+1 then
        begin
             i:=0;
             Curr_Person:=Head_Person;
             while (Curr_Person<>Nil) do
              begin
                   inc(i);
                   if (i=StringGrid1.Row-1) then
                       Break;
                   Curr_Person:=Curr_Person^.NEXT;
              end;
             if RecalcProgram<>2 then
                begin
                     if M=NMES then
                        Calc_Naud_Person(Curr_Person,31,RecalcMode)
                     else
                        begin
                             FLAG_NAUD_FOR_OTHER_MONTH:=true;
                             Update_Podoh(Curr_Person,M,Y-1990,RecalcMode);
                             FLAG_NAUD_FOR_OTHER_MONTH:=false;
                        end;
                end
             else
                begin
                     CreateTestPerson(Y,M,Curr_Person);

                end;
             if isLNR then
                 FormWaitMess.SetMessage('Перерасчет выполнен')
             else
                 FormWaitMess.SetMessage('Перерахунок виконано');
             FormWaitMess.Show;
             repeat
                  Application.ProcessMessages;
             until FormWaitMess.Timer1.Enabled=false;
             FormWaitMess.Hide;
             MakeGrid(StringGrid1.Row);
             Self.ActiveControl:=Self.StringGrid1;
        end;
     StringGrid1.Refresh;
     StringGrid1.SetFocus;

end;

procedure TMainForm.N107Click(Sender: TObject);
begin
    Application.CreateForm(TFormDelWantedECB,FormDelWantedECB);
    FormDelWantedECB.ShowModal;

end;

procedure TMainForm.FormKeyPress(Sender: TObject; var Key: Char);
 var i:integer;
begin
     StringGrid1.SetFocus;
end;

procedure TMainForm.actAnalyzeNalogi2011Execute(Sender: TObject);
 var Y,M,Tabno,i,j:Integer;
     CurrPerson:PERSON_PTR;
begin
    if isLNR then
      if (
           (CURRYEAR<2014) or
           ((CURRYEAR=2014) and (NMES<=10))
         ) then
      if isSecretPodr(NSRV) then
         Exit;
   
    m:=NMES;
    y:=CurrYear;
    y:=work_year_val;
    J:=Count_Person;
    if StringGrid1.Row<=j+1 then
       begin
            i:=0;
            Curr_Person:=Head_Person;
            while (Curr_Person<>Nil) do
              begin
                   inc(i);
                   if (i=StringGrid1.Row-1) then
                       Break;
                   Curr_Person:=Curr_Person^.NEXT;
              end;
       end;
    FormAnalyzeNalogi:=TFormAnalyzeNalogi.CreateDB(nil,Curr_Person^.Tabno,y,m,Curr_Person);
    FormAnalyzeNalogi.ShowModal;
end;

procedure TMainForm.N106Click(Sender: TObject);
begin
     if YesNo('Вы хотите очистить временные таблицы, которые используются для перерасчета налогов.'+#13#10+
              ' Проверьте, чтобы никто не начислял в этот момент переасчитывал налоги'+#13#10+
              ' И нажмите кнопкку ДА, если хотите продолжить') then
        begin
             DeleteAllFromTmpPersonTables;
             FormWaitMess.SetMessage('Табл.очищены');
             FormWaitMess.Show;
             repeat
                   Application.ProcessMessages;
             until FormWaitMess.Timer1.Enabled=false;
             FormWaitMess.Hide;
        end;

end;

procedure TMainForm.ActionReclacPersonWithModeExecute(Sender: TObject);
begin
        RecalcPersonWithWantedMode(0);
end;

procedure TMainForm.RecalcPersonWithWantedMode(WantedMode:integer);
 var J : Integer;
 begin
        if nmes<>flow_month then
           begin
                ShowMessage('Перерасчет только в текущем месяце');
                Exit;
           end;
        if CalculationPersonInProgress then Exit;

        if count_person=0 then Exit;
        J:=Count_Person;
        if StringGrid1.Row-1<=j then
           begin
                CalculationPersonInProgress:=True;
                Calc_Naud(StringGrid1.Row-1,31,WantedMode);
                if isLNR then
                    FormWaitMess.SetMessage('Перерасчет выполнен')
                else
                    FormWaitMess.SetMessage('Перерахунок виконано');
                FormWaitMess.Show;
                repeat
                     Application.ProcessMessages;
                until FormWaitMess.Timer1.Enabled=false;
                CalculationPersonInProgress:=false;
                FormWaitMess.Hide;
                MakeGrid(StringGrid1.Row);
                Self.ActiveControl:=Self.StringGrid1;
           end;
        StringGrid1.Refresh;
        StringGrid1.SetFocus;
  end;
procedure TMainForm.ActionRecalcPersonWithMode1Execute(Sender: TObject);
begin
     RecalcPersonWithWantedMode(1);
end;

procedure TMainForm.N108Click(Sender: TObject);
begin
     Application.CreateForm(TFormRptDolgSummy,FormRptDolgSummy);
     FormRptDolgSummy.ShowModal;
end;

procedure TMainForm.N109Click(Sender: TObject);
begin
     Application.CreateForm(TFormRptSwodECB,FormRptSwodECB);
     FormRptSwodECB.ShowModal;
end;

procedure TMainForm.N111Click(Sender: TObject);
begin
     if CntFormMakeLgotyPNSwm=0 then
        begin
             Application.CreateForm(TFormMakeLgotyPNSwm,FormMakeLgotyPNSwm);
             FormMakeLgotyPNSwm.Show;
        end;

end;

procedure TMainForm.N112Click(Sender: TObject);
begin

     Application.CreateForm(TFormDelUdForWantedMonth,FormDelUdForWantedMonth);
     FormDelUdForWantedMonth.Show;
end;

procedure TMainForm.ActionPersonOExecute(Sender: TObject);
 var Curr_Person:PERSON_PTR;
     i:Integer;
begin
     Application.CreateForm(TFormRestorePodrFromDrive,FormRestorePodrFromDrive);
     FormRestorePodrFromDrive.ShowModal;
{
     Curr_Person:=Head_Person;
     i:=1;
     while (Curr_Person<>Nil) do
      begin
           inc(i);
           if I=StringGrid1.Row then break;
              Curr_Person:=Curr_Person^.Next;
      end;

     CreateTestPerson(CURRYEAR,NMes,Curr_Person);
 }
end;

procedure TMainForm.ActionRecalcNalogiAllPersonForPassMonthNewExecute(
  Sender: TObject);
begin
     Application.CreateForm(TFormRecalcNalPass,FormRecalcNalPass);
     FormRecalcNalPass.ShowModal;

end;

procedure TMainForm.TimerSavePodrTimer(Sender: TObject);
begin
     Exit;
     if NSRV<>CurrentPodrReadedByOperator then Exit;
     if NMES<>FLOW_MONTH then Exit;
     SavePodr;
end;

procedure TMainForm.ActionTryRestorePodrExecute(Sender: TObject);
begin
     Exit;
     if NMES<>FLOW_MONTH then
        begin
             ShowMessage('Данные можно восстановить только в текущем месяце');
             Exit;
        end;
     if NSRV<>CurrentPodrReadedByOperator then
        begin
             ShowMessage('Данные для этого подразделения не сохранялись');
             Exit;
        end;
     Application.CreateForm(TFormRestorePodr,FormRestorePodr);
     FormRestorePodr.ShowModal;
     MakeGrid(0);
     Self.ActiveControl:=Self.StringGrid1;
     StringGrid1.Refresh;
     StringGrid1.SetFocus;
end;

procedure TMainForm.ActionRestorePodrFromFileExecute(Sender: TObject);
 var R:integer;
begin
     if not YesNo('Попытаться восстановить данное подразделение из копии?') then Exit;

     Application.CreateForm(TFormRestorePodrFromDrive,FormRestorePodrFromDrive);
     r:=FormRestorePodrFromDrive.ShowModal;
     if r=mrOk then
        begin
             MakeGrid(StringGrid1.Row);
             Self.ActiveControl:=Self.StringGrid1;
             StringGrid1.Refresh;
             StringGrid1.SetFocus;
        end;     


end;

procedure TMainForm.ActionPochasSwodExecute(Sender: TObject);
begin
     Application.CreateForm(TFormPochasSwod,FormPochasSwod);
     FormPochasSwod.ShowModal;

end;

procedure TMainForm.ActionOtp201201Execute(Sender: TObject);
begin
     Application.CreateForm(TFormOtp1201,FormOtp1201);
     FormOtp1201.ShowModal;

end;

procedure TMainForm.ActionRprCnAutomaticExecute(Sender: TObject);
begin
     Application.CreateForm(TFormRepairCNSQL,FormRepairCNSQL);
     FormRepairCNSQL.ShowModal;

end;

procedure TMainForm.ActionFormMoveOtpHelp2011Execute(Sender: TObject);
begin
     if not YesNo('Вы точно понимаете свои действия?. (Ведь можно испортить данные)') then Exit;
     Application.CreateForm(TFormMoveOtpHelp2010,FormMoveOtpHelp2010);
     FormMoveOtpHelp2010.ShowModal;


end;

procedure TMainForm.ActionEkonomExecute(Sender: TObject);
begin
//     if not YesNo('Вы точно понимаете свои действия?. (Ведь можно испортить данные)') then Exit;
     Application.CreateForm(TFormEkonom,FormEkonom);
     FormEkonom.ShowModal;

end;

procedure TMainForm.ActionEditInfProcExecute(Sender: TObject);
begin
     Application.CreateForm(TFormInfProc,FormInfProc);
     FormInfProc.ShowModal;

end;

procedure TMainForm.ActionSwodyCmpExecute(Sender: TObject);
begin
     Application.CreateForm(TFormSwodyCmp,FormSwodyCmp);
     FormSwodyCmp.ShowModal;
end;

procedure TMainForm.ActTestDuplicatesExecute(Sender: TObject);
begin
     Application.CreateForm(TFormTestDuplicates,FormTestDuplicates);
     FormTestDuplicates.ShowModal;
end;

procedure TMainForm.ActIndexPersonCalcExecute(Sender: TObject);
 var Tabno:Integer;
     Y,M,i,j:Integer;
     CurrPerson:PERSON_PTR;
begin
    m:=NMES;
    y:=CurrYear;
    J:=Count_Person;
    if StringGrid1.Row<=j+1 then
       begin
            i:=0;
            Curr_Person:=Head_Person;
            while (Curr_Person<>Nil) do
              begin
                   inc(i);
                   if (i=StringGrid1.Row-1) then
                       Break;
                   Curr_Person:=Curr_Person^.NEXT;
              end;
       end;
     Tabno:=Curr_Person^.TABNO;
     FormIndexUpdate:=TFormIndexUpdate.CreateIndWnd(Self,Tabno,Y,M,Curr_Person);
     FormIndexUpdate.ShowModal;

end;

procedure TMainForm.ActMovRecalcPod2012Execute(Sender: TObject);
begin
     Application.CreateForm(TFormMovePod12Recalc,FormMovePod12Recalc);
     FormMovePod12Recalc.ShowModal;
end;

procedure TMainForm.ActionDelRecenExecute(Sender: TObject);
begin
     Application.CreateForm(TFormDelRecen,FormDelRecen);
     FormDelRecen.ShowModal;
end;

procedure TMainForm.ActionTestKROExecute(Sender: TObject);
begin
     Application.CreateForm(TFormRepKOS,FormRepKOS);
     FormRepKOS.ShowModal;
end;

procedure TMainForm.ActDelAllCnExecute(Sender: TObject);
begin
     Application.CreateForm(TFormDelAllCN,FormDelAllCN);
     FormDelAllCN.ShowModal;
end;

procedure TMainForm.ActOtpUhodExecute(Sender: TObject);
begin
     Application.CreateForm(TFormOtpUhod,FormOtpUhod);
     FormOtpUhod.ShowModal;
end;

procedure TMainForm.ActionMoveIskraExecute(Sender: TObject);
begin
     Application.CreateForm(TFormMoveIskra,FormMoveIskra);
     FormMoveIskra.ShowModal;
end;

procedure TMainForm.ActionTestNadbAbsentExecute(Sender: TObject);
begin
     Application.CreateForm(TFormTestNadbPresent,FormTestNadbPresent);
     FormTestNadbPresent.ShowModal;
end;

procedure TMainForm.ActionBrowseKadryFBExecute(Sender: TObject);
begin
     Application.CreateForm(TFormBrowseKadryFB,FormBrowseKadryFB);
     FormBrowseKadryFB.ShowModal;
end;

procedure TMainForm.ActionMoveDatesUwolExecute(Sender: TObject);
begin
     Application.CreateForm(TFormGetUwolnDate,FormGetUwolnDate);
     FormGetUwolnDate.ShowModal;
end;

procedure TMainForm.ActionRepInvalidNalogiExecute(Sender: TObject);
begin
     Application.CreateForm(TFormSingleForDouble,FormSingleForDouble);
     FormSingleForDouble.ShowModal;

end;

procedure TMainForm.ActionMoveSZ2014Execute(Sender: TObject);
begin
  //   Application.CreateForm(TFormMakeSZNadb2014,FormMakeSZNadb2014);
  //   FormMakeSZNadb2014.ShowModal;
     Application.CreateForm(TFormReMakeSZNadb2014,FormReMakeSZNadb2014);
     FormReMakeSZNadb2014.ShowModal;

end;

procedure TMainForm.N128Click(Sender: TObject);
 var SQLStmnt:string;
begin
       IF NMES<>FLOW_MONTH THEN
        begin
{           error('Изменения можно вносить только за текущий месяц');}
            exit;
        end;

     IF WORK_YEAR_VAL<>CURRYEAR THEN
        BEGIN
             Exit;
        END;
     FormWait.Show;
     SQLStmnt:='delete from TB_C_PERSON where yearvy<>'+intToStr(WORK_YEAR_VAL)+' or monthvy<>'+intToStr(NMES);
     FIB.pFIBDatabaseSal.Execute(SQLStmnt);
     SQLStmnt:='delete from TB_TMP_PERSON where yearvy<>'+intToStr(WORK_YEAR_VAL)+' or monthvy<>'+intToStr(NMES);
     FIB.pFIBDatabaseSal.Execute(SQLStmnt);
     FormWait.Hide;
end;

procedure TMainForm.actReturnSZV2014Execute(Sender: TObject);
begin
     Application.CreateForm(TFormReturnSZNadb2014,FormReturnSZNadb2014);
     FormReturnSZNadb2014.ShowModal;
end;

procedure TMainForm.actZeroSZ2014Execute(Sender: TObject);
begin
     Application.CreateForm(TFormReMakeSZNMinus,FormReMakeSZNMinus);
     FormReMakeSZNMinus.ShowModal;
end;

procedure TMainForm.actLimitSummy2014Execute(Sender: TObject);
begin
     Application.CreateForm(TFormSumLimit,FormSumLimit);
     FormSumLimit.ShowModal;
end;

procedure TMainForm.actListLgotyDetiExecute(Sender: TObject);
begin
     Application.CreateForm(TFormListLogForDeti,FormListLogForDeti);
     FormListLogForDeti.ShowModal;
end;

procedure TMainForm.actRepDolgHostelExecute(Sender: TObject);
begin
     Application.CreateForm(TFormRptDolgHostel,FormRptDolgHostel);
     FormRptDolgHostel.ShowModal;
end;

procedure TMainForm.N131Click(Sender: TObject);
begin
     Application.CreateForm(TFormRptDolgSummy,FormRptDolgSummy);
     FormRptDolgSummy.ShowModal;
end;

procedure TMainForm.actMakeOtp2014Execute(Sender: TObject);
begin
     Application.CreateForm(TFormMkOtp14,FormMkOtp14);
     FormMkOtp14.ShowModal;
end;

procedure TMainForm.actDelNaUdExecute(Sender: TObject);
begin
     Application.CreateForm(TFormAllAddUdForAbsenBank,FormAllAddUdForAbsenBank);
     FormAllAddUdForAbsenBank.ShowModal;

end;

procedure TMainForm.actReMakeOtp14Execute(Sender: TObject);
begin
     Application.CreateForm(TFormMkOtp14_10,FormMkOtp14_10);
     FormMkOtp14_10.ShowModal;
end;

procedure TMainForm.actListLNRExecute(Sender: TObject);
begin
  {$IFNDEF SVDN}
     Application.CreateForm(TFormMkEmpList,FormMkEmpList);
     FormMkEmpList.ShowModal;
  {$ELSE}
     ShowMessage('Список сотрудников формировать не следует');
  {$ENDIF}
end;

procedure TMainForm.actVyplToExcelKoExecute(Sender: TObject);
begin
   if isLNR then
      begin
           Application.CreateForm(TFormToExcelKomend,FormToExcelKomend);
           FormToExcelKomend.ShowModal;
      end;

end;

procedure TMainForm.actRestPersonExecute(Sender: TObject);
begin
     Application.CreateForm(TFormSaveRestTabno,FormSaveRestTabno);
     FormSaveRestTabno.ShowModal;


end;

procedure TMainForm.WIndows1Click(Sender: TObject);
begin
//  Delete_Pck_From_Register;
  Delete_LoginSal_From_Register;
end;

procedure TMainForm.actGetPassSaldoExecute(Sender: TObject);
begin
     Application.CreateForm(TFormGetSaldo,FormGetSaldo);
     FormGetSaldo.ShowModal;
end;

procedure TMainForm.N71Click(Sender: TObject);
 var Curr_Person:PERSON_PTR;
     I:Integer;
begin
     Curr_Person:=Head_Person;
     i:=1;
     while (Curr_Person<>Nil) do
      begin
           inc(i);
           if I=StringGrid1.Row then
              begin
                   break;
              end;
              Curr_Person:=Curr_Person^.Next;
      end;

     tryToFind09inAllFiles(Curr_Person);
     MakeGrid(StringGrid1.Row);
end;

procedure TMainForm.actStartIOTestExecute(Sender: TObject);
begin
     Application.CreateForm(TFormTestIO,FormTestIO);
     FormTestIO.ShowModal;
end;

procedure TMainForm.ActionRptPersonDogExecute(Sender: TObject);
begin
     Application.CreateForm(TFormRptPersonDolg,FormRptPersonDolg);
     FormRptPersonDolg.ShowModal;
end;

procedure TMainForm.actTemySwodOldExecute(Sender: TObject);
begin
    Application.CreateForm(TFormSwodTemy,FormSwodTemy);
    FormSwodTemy.ShowModal;
end;

procedure TMainForm.actTemySwodNew27022015Execute(Sender: TObject);
begin
    Application.CreateForm(TFormSwodTemyByPeriod,FormSwodTemyByPeriod);
    FormSwodTemyByPeriod.ShowModal;

end;

procedure TMainForm.actSwodGannaMShtatExecute(Sender: TObject);
begin
    Application.CreateForm(TFormShtRasp,FormShtRasp);
    FormShtRasp.ShowModal;

end;

procedure TMainForm.ActionRepPensInvExecute(Sender: TObject);
begin
    Application.CreateForm(TFormRepPensInv,FormRepPensInv);
    FormRepPensInv.ShowModal;

end;

procedure TMainForm.ActionEditParamExecute(Sender: TObject);
begin
    Application.CreateForm(TFormParams,FormParams);
    FormParams.ShowModal;

end;

procedure TMainForm.ActionRepSowmInOutExecute(Sender: TObject);
begin
    Application.CreateForm(TFormRepSowmInOut,FormRepSowmInOut);
    FormRepSowmInOut.ShowModal;

end;

procedure TMainForm.ActionPrikazyPersonExecute(Sender: TObject);
 var Curr_Person:PERSON_PTR;
     tabno,i,j:integer;
 begin
      j:=count_person;
      if j<1 then Exit;
      curr_person:=nil;
      if StringGrid1.Row<=j+1 then
         begin
              i:=0;
              Curr_Person:=Head_Person;
              while (Curr_Person<>Nil) do
                 begin
                      inc(i);
                      if (i=StringGrid1.Row-1) then
                          Break;
                      Curr_Person:=Curr_Person^.NEXT;
                 end;
         end;
     if curr_person=Nil then exit;    
     Tabno:=Curr_Person^.TABNO;
     if tabno<1 then Exit;
     FormPrikazyBrowse:=TFormPrikazyBrowse.CreatePrikaz(Self,Tabno);
     FormPrikazyBrowse.ShowModal;

end;

procedure TMainForm.ActionPrikazyTypExecute(Sender: TObject);
begin
     Application.CreateForm(TFormBrowsePrikazyTyp,FormBrowsePrikazyTyp);
     FormBrowsePrikazyTyp.ShowModal;
end;

procedure TMainForm.ActionVyplLnrExecute(Sender: TObject);
begin
     Application.CreateForm(TFormVyplLNR,FormVyplLNR);
     FormVyplLNR.ShowModal;
end;

procedure TMainForm.actTestGeneraExecute(Sender: TObject);
begin
     Application.CreateForm(TFormTestGener,FormTestGener);
     FormTestGener.ShowModal;
end;

procedure TMainForm.ActionRepSummyLessMinSalExecute(Sender: TObject);
begin
     Application.CreateForm(TFormLessMinSal,FormLessMinSal);
     FormLessMinSal.ShowModal;
end;

procedure TMainForm.ActionEditVipTabnosExecute(Sender: TObject);
begin
     Application.CreateForm(TFormVipTabno,FormVipTabno);
     FormVipTabno.ShowModal;
end;

procedure TMainForm.ActionSwodOtpExecute(Sender: TObject);
begin
     Application.CreateForm(TFormSwodOtp,FormSwodOtp);
     FormSwodOtp.ShowModal;
end;

procedure TMainForm.ActionFindPersonExecute(Sender: TObject);
begin
     Application.CreateForm(TFormFindPerson,FormFindPerson);
     FormFindPerson.ShowModal;
end;

procedure TMainForm.actExportForPlanovLNRExecute(Sender: TObject);
begin
     Application.CreateForm(TFormExportFroPlanLNR,FormExportFroPlanLNR);
     FormExportFroPlanLNR.ShowModal;
end;

procedure TMainForm.N146Click(Sender: TObject);
begin
     Application.CreateForm(TFormTestECB,FormTestECB);
     FormTestECB.ShowModal;

end;


procedure TMainForm.ActionRptTestPodohExecute(Sender: TObject);
begin
     Application.CreateForm(TFormRptTestPod,FormRptTestPod);
     FormRptTestPod.ShowModal;

end;

procedure TMainForm.ActionSvdn22Execute(Sender: TObject);
begin
     Application.CreateForm(TFormPers22SVDN,FormPers22SVDN);
     FormPers22SVDN.ShowModal;

end;

procedure TMainForm.ActionProjsojuzListExecute(Sender: TObject);
begin
     Application.CreateForm(TFormProfsojuzList,FormProfsojuzList);
     FormProfsojuzList.ShowModal;
end;

procedure TMainForm.ActionTestMissingExecute(Sender: TObject);
begin
     Application.CreateForm(TFormTestMissing,FormTestMissing);
     FormTestMissing.ShowModal;
end;

procedure TMainForm.ActionExportKadryToMedokExecute(Sender: TObject);
begin
     Application.CreateForm(TFormExportKadryToMedok,FormExportKadryToMedok);
     FormExportKadryToMedok.ShowModal;

end;

procedure TMainForm.ActionFRXTableExecute(Sender: TObject);
begin
     FormFRXAutoTable:=TFormFRXAutoTable.MyCreate(Self);
     FormFRXAutoTable.ShowModal;

end;

procedure TMainForm.ActionFRXTablePersonExecute(Sender: TObject);
 var Curr_Person:PERSON_PTR;
     tabno,i,j:integer;
     GUID,FIO,DOLG:string;
 begin
      j:=count_person;
      if StringGrid1.Row<=j+1 then
         begin
              i:=0;
              Curr_Person:=Head_Person;
              while (Curr_Person<>Nil) do
                 begin
                      inc(i);
                      if (i=StringGrid1.Row-1) then
                          Break;
                      Curr_Person:=Curr_Person^.NEXT;
                 end;
         end;
     Tabno:=Curr_Person^.TABNO;
     if tabno<1 then Exit;
     GUID:=Trim(GetGUIDPersonToString(Curr_Person));
     if isSVDN then
         FIO:=GetFullUkrFioPerson(Curr_Person.tabno)
     else
         FIO:=GetFullRusFioPerson(Curr_Person.tabno);
     dolg:=Trim(curr_person.DOLG);
     FormFRXAutoTable:=TFormFRXAutoTable.GUIDCreate(Self,GUID,FIO,DOLG,tabno);
     FormFRXAutoTable.ShowModal;

end;


procedure TMainForm.ActionDepBrowseExecute(Sender: TObject);
begin
     Application.CreateForm(TFormDepartmentBrowse,FormDepartmentBrowse);
     FormDepartmentBrowse.ShowModal;

end;

procedure TMainForm.ActionCheckRazrPersonExecute(Sender: TObject);
begin
     Application.CreateForm(TFormTestRazr,FormTestRazr);
     FormTestRazr.ShowModal;
end;

procedure TMainForm.N157Click(Sender: TObject);
begin
     Application.CreateForm(TFormClearBolnGenerators,FormClearBolnGenerators);
     FormClearBolnGenerators.ShowModal;
end;



procedure TMainForm.ActionFindUwolPersonExecute(Sender: TObject);
begin
     Application.CreateForm(TFormFimdUwolPerson,FormFimdUwolPerson);
     FormFimdUwolPerson.ShowModal;

end;

procedure TMainForm.ActionFormPlan160916Execute(Sender: TObject);
begin
     Application.CreateForm(TFormPlan160916,FormPlan160916);
     FormPlan160916.ShowModal;

end;



procedure TMainForm.ActionSwodInvalidyExecute(Sender: TObject);
begin
     SWOD_MODE:=INVALID_SWOD;
     MAKE_MAIN_SWOD(1,1,
         0,'',true,
         false,
         0,
     0,
     0,
     0);
end;

procedure TMainForm.N211Click(Sender: TObject);
begin
      N45Click(Sender);
end;

procedure TMainForm.N310Click(Sender: TObject);
begin
     ActionRepSummyLessMinSalExecute(Sender);
end;

procedure TMainForm.ActionReportRecalcNalogiExecute(Sender: TObject);
begin
     Application.CreateForm(TFormListRecalcYear,FormListRecalcYear);
     FormListRecalcYear.ShowModal;

end;

procedure TMainForm.ActionFRXSwodAllaExecute(Sender: TObject);
begin
     Application.CreateForm(TFormSwodAlla,FormSwodAlla);
     FormSwodAlla.ShowModal;
end;

procedure TMainForm.ActionClear82Execute(Sender: TObject);
begin
     Application.CreateForm(TFormDelSowm82,FormDelSowm82);
     FormDelSowm82.ShowModal;
end;

procedure TMainForm.ActionReport148Execute(Sender: TObject);
begin
     Application.CreateForm(TFormReport148,FormReport148);
     FormReport148.ShowModal;
end;

procedure TMainForm.ActionCvtXMLGrnToRubExecute(Sender: TObject);
begin
     if isLNR then
        begin
             Application.CreateForm(TFormConvertXMLGrnToRub,FormConvertXMLGrnToRub);
             FormConvertXMLGrnToRub.ShowModal;
        end;
end;

procedure TMainForm.ActionReportOsnWorkerExecute(Sender: TObject);
begin
     Application.CreateForm(TFormRepPersDolgOsn,FormRepPersDolgOsn);
     FormRepPersDolgOsn.ShowModal;
end;

procedure TMainForm.ActionRepAUPPPSExecute(Sender: TObject);
begin
     Application.CreateForm(TFormRepAUP_PPS,FormRepAUP_PPS);
     FormRepAUP_PPS.ShowModal;
end;

procedure TMainForm.NGTLIMITLNRClick(Sender: TObject);
begin
     Application.CreateForm(TFormSwodGt2660,FormSwodGt2660);
     FormSwodGt2660.ShowModal;
end;

procedure TMainForm.ActionRepairTabelUwol062017Execute(Sender: TObject);
begin
     Application.CreateForm(TFormRepairUwol,FormRepairUwol);
     FormRepairUwol.ShowModal;

end;

procedure TMainForm.ActionRecalcNightFor062017Execute(Sender: TObject);
begin
     if not isSVDN then Exit;
     Application.CreateForm(TFormRecalcNight,FormRecalcNight);
     FormRecalcNight.ShowModal;

end;

procedure TMainForm.ActionChangeTabnoExecute(Sender: TObject);
begin
     Application.CreateForm(TFormChangeTabno,FormChangeTabno);
     FormChangeTabno.ShowModal;

end;

procedure TMainForm.ActionChangeWorkingNMESExecute(Sender: TObject);
var s:string;
begin
     if length(trim(passwordForChangeMonth))<1 then exit;
     s:=inputBox('Авторизация доступа','Введите пароль','');
     if length(trim(s))<1 then exit;
     if trim(s)<>trim(passwordForChangeMonth) then Exit;
     Application.CreateForm(TFormChangeNMES,FormChangeNMES);
     FormChangeNMES.ShowModal;
end;

procedure TMainForm.N165Click(Sender: TObject);
begin
     ExecuteSort(1);
end;

procedure TMainForm.N166Click(Sender: TObject);
begin
     ExecuteSort(2);
end;

procedure TMainForm.N167Click(Sender: TObject);
begin
     ExecuteSort(3);
end;

procedure TMainForm.ExecuteSort(Mode:integer);
 var WantedRow : integer;
 begin
      WantedRow := StringGrid1.Row;
      if count_person<2 then Exit;
      if ((mode<1) or (mode>3)) then exit;
      with TFormSort.Create(nil) do
       try
         SetModeSort(Mode);
         if execute then
             begin
                  Self.MakeGrid(WantedRow);
                  Self.ActiveControl:=Self.StringGrid1;
             end
       finally
{             free;    }
       end;

 end;

procedure TMainForm.ActionMoveSwod0417Execute(Sender: TObject);
begin
     Application.CreateForm(TFormFillExcel0417,FormFillExcel0417);
     FormFillExcel0417.ShowModal;
end;

procedure TMainForm.ActionRepWorkersForPlanExecute(Sender: TObject);
begin
     Application.CreateForm(TFormRepWordkers,FormRepWordkers);
     FormRepWordkers.ShowModal;
end;

procedure TMainForm.ActionGenerateExecute(Sender: TObject);
begin
     Application.CreateForm(TFormGener,FormGener);
     FormGener.ShowModal;

end;

procedure TMainForm.N010720181Click(Sender: TObject);
begin
    if not YesNo('Сгенерировать данные за текущий месяц?') then Exit;
    Application.CreateForm(TFormGen, FormGen);
    FormGen.ShowModal;
    StringGrid1.SetFocus;
end;

procedure TMainForm.ActionFormMonthGenerExecute(Sender: TObject);
 var newDate:TDate;
     y,m:word;
begin
//    Application.CreateForm(TFormMonthForGener, FormMonthForGener);
    y:=CurrYear;
    m:=nmes;
    m:=m+1;
    if (m>12) then
       begin
            m:=1;
            inc(y);
       end;
    newDate:=enCodeDate(y,m,1);
    FormMonthForGener:=TFormMonthForGener.CreateUsingDate(Application,newDate);
    FormMonthForGener.ShowModal;
    StringGrid1.SetFocus;

end;

procedure TMainForm.ActionBrowseDogovoraExecute(Sender: TObject);
begin
    if not isSVDN then Exit;
    Application.CreateForm(TFormBrowseDogovora, FormBrowseDogovora);
    FormBrowseDogovora.ShowModal;

end;

procedure TMainForm.ActionRepPomKOtpExecute(Sender: TObject);
begin
    Application.CreateForm(TFormRepPomKOtp, FormRepPomKOtp);
    FormRepPomKOtp.ShowModal;
end;

procedure TMainForm.ActionTestCrossSavingExecute(Sender: TObject);
begin
    Application.CreateForm(TFormTestCrossSaving, FormTestCrossSaving);
    FormTestCrossSaving.ShowModal;

end;

procedure TMainForm.ActionTestAwansExecute(Sender: TObject);
begin
    Application.CreateForm(TFormSavedAwans, FormSavedAwans);
    FormSavedAwans.ShowModal;

end;

procedure TMainForm.ActionRecalcJan2019Execute(Sender: TObject);
begin
    if not isSVDN then exit;
    Application.CreateForm(TFormRecalcJan2019, FormRecalcJan2019);
    FormRecalcJan2019.ShowModal;

end;

procedure TMainForm.ActionRepClocksExecute(Sender: TObject);
begin
    if not isSVDN then exit;
    Application.CreateForm(TFormRepClockItogi, FormRepClockItogi);
    FormRepClockItogi.ShowModal;

end;

procedure TMainForm.ActionRepRazrExecute(Sender: TObject);
begin
    Application.CreateForm(TFormRepRazr, FormRepRazr);
    FormRepRazr.ShowModal;
end;

procedure TMainForm.ActionRepNeSovpRazrOklExecute(Sender: TObject);
begin
    Application.CreateForm(TFormRepNeSovpRazrOklad, FormRepNeSovpRazrOklad);
    FormRepNeSovpRazrOklad.ShowModal;

end;

procedure TMainForm.ActionRepPlanFondyExecute(Sender: TObject);
begin
    Application.CreateForm(TFormRepFondy, FormRepFondy);
    FormRepFondy.ShowModal;

end;

procedure TMainForm.ActionRepPensioneryExecute(Sender: TObject);
begin
    Application.CreateForm(TFormRepPensionery, FormRepPensionery);
    FormRepPensionery.ShowModal;

end;

procedure TMainForm.ActionBrowseDekrListExecute(Sender: TObject);
begin
    Application.CreateForm(TFormDekrList, FormDekrList);
    FormDekrList.ShowModal;
end;

procedure TMainForm.ActionRepFondySVDNExecute(Sender: TObject);
begin
    Application.CreateForm(TFormRepFondySVDN, FormRepFondySVDN);
    FormRepFondySVDN.ShowModal;
end;

procedure TMainForm.ActionDeleteVirusesExecute(Sender: TObject);
begin
     if not isLNR then exit;
     if yesNo('Удалить вирусы с диска y:?') then
        DeleteViruses;
end;

procedure TMainForm.ActionCorrectVyplatyExecute(Sender: TObject);
begin
    Application.CreateForm(TFormMakeCorrectNagativeVypl, FormMakeCorrectNagativeVypl);
    FormMakeCorrectNagativeVypl.ShowModal;

end;

procedure TMainForm.ActionBrowsePrikazyExecute(Sender: TObject);
begin
    Application.CreateForm(TFormPrikazyBrowseTot, FormPrikazyBrowseTot);
    FormPrikazyBrowseTot.ShowModal;

end;

procedure TMainForm.ActionRepKRUExecute(Sender: TObject);
begin
    Application.CreateForm(TFormKRUReport, FormKRUReport);
    FormKRUReport.ShowModal;

end;

procedure TMainForm.N184Click(Sender: TObject);
begin
    Application.CreateForm(TFormRptPremGM, FormRptPremGM);
    FormRptPremGM.ShowModal;
end;

procedure TMainForm.N183Click(Sender: TObject);
begin
     if CntFormWantedAdd=0 then
        begin
             Application.CreateForm(TFormRptWantedAdd,FormRptWantedAdd);
             FormRptWantedAdd.ShowModal;
        end;

end;

procedure TMainForm.N20201Click(Sender: TObject);
begin
    Application.CreateForm(TFormSumLimitForCarantine, FormSumLimitForCarantine);
    FormSumLimitForCarantine.ShowModal;

end;

procedure TMainForm.ActionImportNadbFromPlanoviyExecute(Sender: TObject);
begin
//    Application.CreateForm(TFormMoveNabdToDB, FormMoveNabdToDB);
//    FormMoveNabdToDB.ShowModal;
end;

procedure TMainForm.ActionBrowseNadbPlanoviyExecute(Sender: TObject);
var yearZa,monthZa:Integer;
begin
     YearZa:=currYear;
     MonthZa:=NMES;
     FormBrowseNadbPlanoviy:=TFormBrowseNadbPlanoviy.createZa(Self,monthZa,YearZa);
     FormBrowseNadbPlanoviy.showModal;
end;

procedure TMainForm.ActionRepKRURusDNRExecute(Sender: TObject);
begin
     Application.CreateForm(TFormKRURosDNR,FormKRURosDNR);
     FormKRURosDNR.showModal;

end;

procedure TMainForm.ActionRepBolnPlanExecute(Sender: TObject);
begin
     Application.CreateForm(TFormRepBolnPlan,FormRepBolnPlan);
     FormRepBolnPlan.showModal;

end;

procedure TMainForm.ActionCheckKassaBankExecute(Sender: TObject);
begin
     Application.CreateForm(TFormTestKassaBank,FormTestKassaBank);
     FormTestKassaBank.showModal;

end;

procedure TMainForm.ActionMove156LNRExecute(Sender: TObject);
begin
     Application.CreateForm(TFormMakeVypl156082020,FormMakeVypl156082020);
     FormMakeVypl156082020.showModal;

end;

procedure TMainForm.N187Click(Sender: TObject);
begin
     Application.CreateForm(TAboutBox,AboutBox);
     AboutBox.showModal;

end;

end.

