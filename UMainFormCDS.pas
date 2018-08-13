unit UMainFormCDS;
                    
interface                  
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, ComCtrls, ActnList, ToolWin, ImgList, StdCtrls,
  ExtCtrls, FIBDatabase, USMessages, DB, IBDatabase, DBClient;

type
  TMainFormCDS = class(TForm)
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
    N71: TMenuItem;
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
    N84: TMenuItem;
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
    N20102: TMenuItem;
    N97: TMenuItem;
    ActionEditSwid: TAction;
    N98: TMenuItem;
    N99: TMenuItem;
    N100: TMenuItem;
    N101: TMenuItem;
    N102: TMenuItem;
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
    N108: TMenuItem;
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
    cdsMain: TClientDataSet;
    cdsMainState: TIntegerField;
    cdsMainTabno: TIntegerField;
    cdsMainFIO: TStringField;
    cdsMainF1: TFloatField;
    cdsMainF2: TFloatField;
    cdsMainF3: TFloatField;
    cdsMainF4: TFloatField;
    cdsMainF5: TFloatField;
    cdsMainF6: TFloatField;
    cdsMainF7: TFloatField;
    cdsMainF8: TFloatField;
    cdsMainF9: TFloatField;
    cdsMainF10: TFloatField;
    cdsMainF11: TFloatField;
    cdsMainF12: TFloatField;
    cdsMainHint: TStringField;
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
    procedure N71Click(Sender: TObject);
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
    procedure N102Click(Sender: TObject);
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
  MainFormCDS: TMainFormCDS;

implementation
  uses UFormEditPodr,ScrLini,ScrIni, FormShifrU,FormNmesU,ScrDef,ScrUtil,ScrIO, ScrLists,DBUnit,
  UToSQL,udbf, uCKadry,FormAddUdU, FormSelShifrU,FormSortU,FormKadryU,FormSowmU,FormCnU,
  FormTabelU, SQlConnectU,ScrNalog, USelSwodMode,UFormArc,UFibModule,
  uFormBoln, uFormEditIPodr, UFORMEDITIKAT, UFORMEDITPRZB, UFormBolKoe,
  uFormOtp, UFormRecalc, UFormSelLera,uFormBuh,UFormBlnAbo,
  UFormRecalcPPSSFZ,FormPodrU,UFormEditGru,UFormEditShifr, UFormNemBud,
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
  UFormTestNadbPresent,MidasLib;
{$R *.dfm}

procedure TMainFormCDS.SetUpRow(WantedTabno:integer;WantedWR:integer;WantedDolg:string;var WantedRow:integer);
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

procedure TMainFormCDS.MakeColorRow(WantedRow:integer);
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
procedure TMainFormCDS.MakeGrid(WantedRow:integer);
 const F='######0.00';
 var I,J,JJ      : Integer;
     Curr_Person : Person_Ptr;
     S           : String;
     A           : Double;
     Curr_Add    : Add_Ptr;
     Curr_Ud     : Ud_Ptr;
     SecretWorker : boolean;
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
     Caption:=AllTrim(CurrWrkFio)+' '+AllTrim(Month[NMES])+' '+IntToStr(Work_Year_Val)+' г. '+NAME_SERV(NSRV)+' '+IntToStr(Count_Person)+' Записей ';
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
                      end;
             end;
     StringGrid1.Cells[0,0]:='Т.н.';
     StringGrid1.ColWidths[0]:=60;
     StringGrid1.Cells[1,0]:='Ф.И.О. сотрудника';
     StringGrid1.ColWidths[1]:=150;
     for i:=1 to Nmb_Of_Col_Main_Screen do
         begin
              StringGrid1.ColWidths[i+1]:=94;
              MainScreen[i].Summa:=0;
              S:=ShifrList.GetName(MainScreen[i].Shifr);
              if MainScreen[i].Shifr>M_Shifr then S:='К выдаче';
              StringGrid1.Cells[i+1,0]:=copy(S,1,10);
              if length(S)>10 then
                 StringGrid1.Cells[i+1,1]:=copy(S,11,10);

         end;
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
procedure TMainFormCDS.FormCreate(Sender: TObject);
 var WantedRow:Integer;
     WantedTabno,WantedWR,WantedServ:Integer;
     WantedDolg:string;
     AUserName, APassword:Ansistring;
     i,j : integer;
 begin
   i:=FIB.pFIBDatabaseSal.ActiveTransactionCount;
   j:=FIB.pFIBDatabaseArc.ActiveTransactionCount;

   NmbOfTransactSal := 0;
   NmbOfTransactArc := 0;
   Init_Dir_Name;
   Fill_Podr;
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
   InitInitialParamentersFromIniFile;
{   Load_Pck(WantedTabno,WantedWR);  }
   Load_Pck_Fr_Register(WantedServ,WantedTabno,WantedWR,WantedDolg);
   if (WantedServ>0) and (WantedServ<200) then NSRV:=WantedServ
   else NSRV:=1;
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


{
   Fib.pFIBDatabaseSal.AfterStartTransaction:=StartTransactionSal;
   Fib.pFIBDatabaseArc.AfterStartTransaction:=StartTransactionArc;
   FIB.pFIBDatabaseSal.AfterEndTransaction:=EndTransactionDatabaseSal;
   FIB.pFIBDatabaseArc.AfterEndTransaction:=EndTransactionDatabaseArc;
}   
{   FIB.StatusMessage:=StatusMessage;   }
end;

procedure TMainFormCDS.N5Click(Sender: TObject);
begin
    Application.CreateForm(TFormEditPodohTBL, FormEditPodohTBL);
    FormEditPodohTBL.Show;
end;

procedure TMainFormCDS.N4Click(Sender: TObject);
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

procedure TMainFormCDS.StringGrid1MouseDown(Sender: TObject;
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

procedure TMainFormCDS.N6Click(Sender: TObject);
begin
    Application.CreateForm(TFormToSQL, FormToSQL);
    FormToSql.Show
end;

procedure TMainFormCDS.DBF1Click(Sender: TObject);
begin
    Application.CreateForm(TFormDBF, FormDBF);
    FormDBF.Show;
end;

procedure TMainFormCDS.N7Click(Sender: TObject);
begin
{    Application.CreateForm(TfrmKadry, frmKadry);
    frmKadry.ShowModal;
}
       ActionEditKadryClarionExecute(Sender);
end;

procedure TMainFormCDS.StringGrid1DrawCell(Sender: TObject; ACol,
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
                        Brush.Color := clHighlight;
                        If assigned(Objects[vCol,vRow]) then
                           begin
                                 OldFontColor := Font.Color;
                                 OldBrushColor := Brush.Color;
                                 Font.Color := (Objects[vCol,vRow] as TStrColor).SelectedColor;
{                                 Brush.Color := (Objects[vCol,vRow] as TStrColor).BackColor;}
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
{
                           If assigned(Objects[vCol,vRow]) then
                              begin
                                    OldFontColor := Font.Color;
                                    OldBrushColor := Brush.Color;
                                    Font.Color := (Objects[vCol,vRow] as TStrColor).Color;
                                    Brush.Color := (Objects[vCol,vRow] as TStrColor).BackColor;
                             end;
}
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


procedure TMainFormCDS.N8Click(Sender: TObject);
var Curr_Person:Person_Ptr;
    Tabno,WR,I,WantedRow:Integer;
    WantedDolg:string;
    OldNSRV,TmpNSRV:Integer;
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

procedure TMainFormCDS.N9Click(Sender: TObject);
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
              end;
        finally
{        free;}
      end;
      StringGrid1.SetFocus;

end;

procedure TMainFormCDS.StringGrid1DblClick(Sender: TObject);
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

procedure TMainFormCDS.FormShow(Sender: TObject);
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

procedure TMainFormCDS.StringGrid2DrawCell(Sender: TObject; ACol,
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

procedure TMainFormCDS.N10Click(Sender: TObject);
var Curr_Person:Person_Ptr;
     i:integer;
     SavTopRow,SavRow : integer;
     count_p:integer;
     Tabno,WorkPlace,RecNo : integer;
     NalCode : string;
     FIO     : string;
begin
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

procedure TMainFormCDS.N11Click(Sender: TObject);
begin
     if count_person=0 then Exit;
     Putinf;
     if nmes=FLOW_MONTH then
        CRC32Ori:=PodrCRC32;
     FormWaitMess.SetMessage('Данные сохранены');
     FormWaitMess.Show;
     repeat
            Application.ProcessMessages;
     until FormWaitMess.Timer1.Enabled=false;
     FormWaitMess.Hide;
     StringGrid1.SetFocus;
end;

procedure TMainFormCDS.N12Click(Sender: TObject);
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


procedure TMainFormCDS.StringGrid1KeyPress(Sender: TObject; var Key: Char);
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

procedure TMainFormCDS.FormClose(Sender: TObject; var Action: TCloseAction);
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
               Action:=caFree;
         end
      else
          Action:=caNone;
end;

procedure TMainFormCDS.FormActivate(Sender: TObject);
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

procedure TMainFormCDS.FormDeactivate(Sender: TObject);
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

procedure TMainFormCDS.StringGrid1MouseMove(Sender: TObject;
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

procedure TMainFormCDS.F41Click(Sender: TObject);
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

procedure TMainFormCDS.FireBird1Click(Sender: TObject);
begin
    Application.CreateForm(TFormToSQL, FormToSQL);
    FormToSQL.Show;

end;

procedure TMainFormCDS.N13Click(Sender: TObject);
var Curr_Person:Person_Ptr;
     i:integer;
     RetVal:integer;
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

procedure TMainFormCDS.FireBirdClick(Sender: TObject);
begin
    Application.CreateForm(TFormSQLConnect, FormSQLConnect);
    FormSQLConnect.ShowModal;
end;

procedure TMainFormCDS.StringGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TMainFormCDS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      StringGrid1.SetFocus;
      self.StringGrid1KeyDown(Sender, Key, Shift);
end;

procedure TMainFormCDS.N15Click(Sender: TObject);
begin
    Application.CreateForm(TFormSwodMode, FormSwodMode);
    FormSwodMode.ShowModal;
    StringGrid1.SetFocus;
end;

procedure TMainFormCDS.N17Click(Sender: TObject);
begin
    Application.CreateForm(TFormArc, FormArc);
    FormArc.ShowModal;
    StringGrid1.SetFocus;

end;

procedure TMainFormCDS.N18Click(Sender: TObject);
begin
    Application.CreateForm(TFormBoln, FormBoln);
    FormBoln.WantedMode:=0;
    FormBoln.ShowModal;
    StringGrid1.SetFocus;
end;

procedure TMainFormCDS.N20Click(Sender: TObject);
begin
    Application.CreateForm(TFormEditIPodr, FormEditIPodr);
    FormEditIPodr.ShowModal;
    StringGrid1.SetFocus;
end;

procedure TMainFormCDS.N22Click(Sender: TObject);
begin
    Application.CreateForm(TFormEditiKat, FormEditiKat);
    FormEditiKat.ShowModal;
    StringGrid1.SetFocus;

end;

procedure TMainFormCDS.N23Click(Sender: TObject);
begin
    Application.CreateForm(TFormEditPrzB, FormEditPrzB);
    FormEditPrzB.ShowModal;
    StringGrid1.SetFocus;

end;

procedure TMainFormCDS.N24Click(Sender: TObject);
begin
    Application.CreateForm(TFormBolKoe, FormBolKoe);
    FormBolKoe.ShowModal;
    StringGrid1.SetFocus;

end;

procedure TMainFormCDS.N25Click(Sender: TObject);
begin
    Application.CreateForm(TFormOtp, FormOtp);
    FormOtp.ShowModal;
    StringGrid1.SetFocus;

end;

procedure TMainFormCDS.ArcPerson;
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

procedure TMainFormCDS.RecalcPerson;
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



procedure TMainFormCDS.N26Click(Sender: TObject);
begin
     if count_person=0 then Exit;
     ArcPerson;
end;

procedure TMainFormCDS.N27Click(Sender: TObject);
 var i:Integer;
     Curr_Person:PERSON_PTR;
begin

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

procedure TMainFormCDS.ToolButton1Click(Sender: TObject);
begin
     N8Click(Sender)
end;

procedure TMainFormCDS.ToolButton2Click(Sender: TObject);
begin
     N8Click(Sender);
end;

procedure TMainFormCDS.ToolButton3Click(Sender: TObject);
begin
     N10Click(Sender);
end;

procedure TMainFormCDS.N28Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelLeraSwodMode,FormSelLeraSwodMode);
    FormSelLeraSwodMode.Show;
end;

procedure TMainFormCDS.N29Click(Sender: TObject);
begin
    Application.CreateForm(TFormOPE,FormOPE);
    FormOPE.Show;

end;

procedure TMainFormCDS.ActionBolnPersonExecute(Sender: TObject);
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

procedure TMainFormCDS.SwitchConnectionStatus(bStatus: byte);
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

procedure TMainFormCDS.SwitchTransactionStatus(bStatus: byte);
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

procedure TMainFormCDS.ShowNmbOfTransAct;
 var S:string;
 begin
      s:=IntToStr(NmbOfTransactSal)+'-'+IntToStr(NmbOfTransactArc);
      StatusBar1.Panels[2].Text:=s;
      Application.ProcessMessages;
 end;
procedure TMainFormCDS.ShowTransactionStatus;
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
procedure TMainFormCDS.StatusMessage(S:String);
 begin
      StatusBar1.Panels[0].Text:=S;
 end;

procedure TMainFormCDS.StatusBar1DrawPanel(StatusBar: TStatusBar;
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

procedure TMainFormCDS.FormPaint(Sender: TObject);
begin
      ShowTransactionStatus;
      Self.SetFocus;
end;

procedure TMainFormCDS.ActionRecalcPPSSFZExecute(Sender: TObject);
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

procedure TMainFormCDS.N20051Click(Sender: TObject);
begin
     ActionRecalcPPSSFZExecute(Sender);
end;

procedure TMainFormCDS.N31Click(Sender: TObject);
begin
    Application.CreateForm(TFormMonthsHea,FormMonthsHea);
    FormMonthsHea.ShowModal;
{
    Application.CreateForm(TFormEditGruppy, FormEditGruppy);
    FormEditGruppy.ShowModal;
}
end;

procedure TMainFormCDS.MemBudExecute(Sender: TObject);
begin
    Application.CreateForm(TFormMemBud, FormMemBud);
    FormMemBud.ShowModal;
    StringGrid1.SetFocus;

end;

procedure TMainFormCDS.N32Click(Sender: TObject);
begin
    Application.CreateForm(TFormSwodKafGru, FormSwodKafGru);
    FormSwodKafGru.ShowModal;
end;

procedure TMainFormCDS.N33Click(Sender: TObject);
VAR  J:INTEGER;
begin
     j:=Fib.pFIBDatabaseSal.TransactionCount;
     j:=j;
    Application.CreateForm(TFormAlim, FormAlim);
     j:=Fib.pFIBDatabaseSal.TransactionCount;
     j:=j;
    FormAlim.ShowModal;
end;

procedure TMainFormCDS.ActionRListExecute(Sender: TObject);
var Tabno:integer;
    FIO:String;
    Curr_Person:Person_Ptr;
    i:integer;
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

procedure TMainFormCDS.N35Click(Sender: TObject);
begin
{      ActionRListExecute(Sender);     }
      ActionBolnPersonExecute(Sender);
end;

procedure TMainFormCDS.ActionOtpPersonExecute(Sender: TObject);
var i,SavRow:integer;
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
           if (Curr_Person^.WID_RABOTY = 1) or
               ((Curr_Person^.WID_RABOTY <> 1) and
                (Curr_Person^.MESTO_OSN_RABOTY=82))  then
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

procedure TMainFormCDS.ActionCalcPersonExecute(Sender: TObject);
begin
        RecalcPersonWithWantedMode(2);
end;

procedure TMainFormCDS.ActionReverseSwitchExecute(Sender: TObject);
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

procedure TMainFormCDS.ActionEditKadryClarionExecute(Sender: TObject);
var PathName  : String;
    PPathName : PChar;
    KZ        : LongInt;
    Ini       : TIniFile;
    CmdString : string;
begin
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
      Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
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

procedure TMainFormCDS.TimerMainTimer(Sender: TObject);
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

procedure TMainFormCDS.StartTransactionSal;
  begin
        Inc(NmbOfTransactSal);
        NmbOfTransactSal:=FIB.pFIBDatabaseSal.ActiveTransactionCount;
        Self.ShowNmbOfTransAct;
  end;
procedure TMainFormCDS.StartTransactionArc;
  begin
        Inc(NmbOfTransactArc);
        Self.ShowNmbOfTransAct;
  end;
procedure TMainFormCDS.EndTransactionArc;
  begin
        Dec(NmbOfTransactArc);
        Self.ShowNmbOfTransAct;
  end;
procedure TMainFormCDS.EndTransactionSal;
  begin
        if NmbOfTransactSal>0 then
        Dec(NmbOfTransactSal);
        NmbOfTransactSal:=FIB.pFIBDatabaseSal.ActiveTransactionCount;
        Self.ShowNmbOfTransAct;
  end;
procedure TMainFormCDS.SXTRStarted(var Msg:TMessage);
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

procedure TMainFormCDS.ActionPlatExecute(Sender: TObject);
begin
    Application.CreateForm(TFormPlatGen, FormPlatGen);
    FormPlatGen.ShowModal;
end;

procedure TMainFormCDS.N43Click(Sender: TObject);
begin
    Application.CreateForm(TFormSwodAlim, FormSwodAlim);
    FormSwodAlim.ShowModal;
end;

procedure TMainFormCDS.ActionTestRecalcPersonExecute(Sender: TObject);
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

procedure TMainFormCDS.N45Click(Sender: TObject);
begin
    Application.CreateForm(TFormSwodGt2660, FormSwodGt2660);
    FormSwodGt2660.ShowModal;
end;

procedure TMainFormCDS.N46Click(Sender: TObject);
begin
    Application.CreateForm(TFormSwodSS,FormSwodSS);
    FormSwodSS.ShowModal;
end;

procedure TMainFormCDS.N47Click(Sender: TObject);
begin
    Application.CreateForm(TFormSwodTemy,FormSwodTemy);
    FormSwodTemy.ShowModal;
end;

procedure TMainFormCDS.N48Click(Sender: TObject);
var PathName  : String;
    PPathName : PChar;
    KZ        : LongInt;
    Ini       : TIniFile;
    CmdString : string;
begin
      Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
      try
         CmdString := Ini.ReadString( 'Parameters', 'EditTemyProc', '' )
      finally
         Ini.Free;
      end;

    Kz:=WinExecAndWait32(CmdString, 1);
    if (Kz>0) and (KZ<32) then
        ShowMessage('Ошибка запуска редактора тем '+IntToStr(Kz));

end;

procedure TMainFormCDS.N51Click(Sender: TObject);
begin
    Application.CreateForm(TFormListVypl, FormListVypl);
    FormListVypl.ShowModal;
end;

procedure TMainFormCDS.N52Click(Sender: TObject);
 var WantedRow:integer;
begin
    if (NMES<>FLOW_MONTH) then
       begin
            ShowMessage('Аванс можно сформировать только в текущем месяце ');
            Exit;
       end;
    WantedRow := StringGrid1.Row;
    Application.CreateForm(TFormMakeAwans, FormMakeAwans);
    FormMakeAwans.ShowModal;
    Self.MakeGrid(WantedRow);
    Self.ActiveControl:=Self.StringGrid1;
end;



procedure TMainFormCDS.N54Click(Sender: TObject);
begin
    Application.CreateForm(TFormMakePens, FormMakePens);
    FormMakePens.ShowModal;
end;

procedure TMainFormCDS.N010320081Click(Sender: TObject);
begin
    Application.CreateForm(TFormMovRecalc08, FormMovRecalc08);
    FormMovRecalc08.ShowModal;
end;

procedure TMainFormCDS.N20072Click(Sender: TObject);
begin
    Application.CreateForm(TFormPersonofic, FormPersonofic);
    FormPersonofic.ShowModal;
end;

procedure TMainFormCDS.N55Click(Sender: TObject);
begin
    Application.CreateForm(TFormMovUkrFIO,FormMovUkrFIO);
    FormMovUkrFIO.ShowModal;
end;

procedure TMainFormCDS.N49Click(Sender: TObject);
begin
//    Application.CreateForm(TFormMakeAllChain,FormMakeAllChain);
//    FormMakeAllChain.ShowModal;

end;

procedure TMainFormCDS.N56Click(Sender: TObject);
begin
     ActionRecalcPPSSFZExecute(Sender);
end;

procedure TMainFormCDS.N57Click(Sender: TObject);
begin
    Application.CreateForm(TFormIndex, FormIndex);
    FormIndex.ShowModal;
end;

procedure TMainFormCDS.N58Click(Sender: TObject);
begin
{    Application.CreateForm(TFormListVypl, FormListVypl);
    FormListVypl.ShowModal;
}
    Application.CreateForm(TFormParSal, FormParSal);
    FormParSal.ShowModal;

end;

procedure TMainFormCDS.N60Click(Sender: TObject);
begin
    Application.CreateForm(TFormYSpr, FormYSpr);
    FormYSpr.ShowModal;
end;

procedure TMainFormCDS.N61Click(Sender: TObject);
begin
    Application.CreateForm(TFormKreditSpr, FormKreditSpr);
    FormKreditSpr.ShowModal;
end;

procedure TMainFormCDS.Excel1Click(Sender: TObject);
begin
    Application.CreateForm(TFormAutoRep, FormAutoRep);
    FormAutoRep.ShowModal;

end;



procedure TMainFormCDS.FastReport1Click(Sender: TObject);
begin
    Application.CreateForm(TFormFRXAutoSwod, FormFRXAutoSwod);
    FormFRXAutoSwod.ShowModal;

end;

procedure TMainFormCDS.N63Click(Sender: TObject);
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

procedure TMainFormCDS.N65Click(Sender: TObject);
begin
    Application.CreateForm(TFormEditShifr, FormEditShifr);
    FormEditShifr.Show;
end;

procedure TMainFormCDS.N64Click(Sender: TObject);
begin
    Application.CreateForm(TFormEditGruppy, FormEditGruppy);
    FormEditGruppy.ShowModal;
end;

procedure TMainFormCDS.N66Click(Sender: TObject);
begin
    Application.CreateForm(TFormRazr, FormRazr);
    FormRazr.ShowModal;
end;

procedure TMainFormCDS.N67Click(Sender: TObject);

begin
   Application.CreateForm(TFormMinSalSpr, FormMinSalSpr);
   FormMinSalSpr.ShowModal;

end;

procedure TMainFormCDS.ActionRecalcPodrExecute(Sender: TObject);
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

procedure TMainFormCDS.N59Click(Sender: TObject);
begin
//      Self.Close;
end;
procedure TMainFormCDS.N68Click(Sender: TObject);
begin
   Application.CreateForm(TFormMpSwod, FormMpSwod);
   FormMpSwod.ShowModal;
end;

procedure TMainFormCDS.N69Click(Sender: TObject);
begin
   Application.CreateForm(TFormDolg, FormDolg);
   FormDolg.ShowModal;
end;

procedure TMainFormCDS.N21Click(Sender: TObject);
begin
   Application.CreateForm(TFormIGruppy, FormIGruppy);
   FormIGruppy.ShowModal;
end;

procedure TMainFormCDS.N70Click(Sender: TObject);
begin
   Application.CreateForm(TFormEditDayClock, FormEditDayClock);
   FormEditDayClock.ShowModal;
end;

procedure TMainFormCDS.ApplicationCreateFormTFormListVyplFormListVypl1Click(
  Sender: TObject);
begin
   Application.CreateForm(TFormRepairTableForOtp, FormRepairTableForOtp);
   FormRepairTableForOtp.ShowModal;

end;

procedure TMainFormCDS.N71Click(Sender: TObject);
begin
   Application.CreateForm(TFormEditSecretTabno, FormEditSecretTabno);
   FormEditSecretTabno.ShowModal;

end;

procedure TMainFormCDS.N72Click(Sender: TObject);
begin
   Application.CreateForm(TFormEditParSelPlat, FormEditParSelPlat);
   FormEditParSelPlat.ShowModal;

end;

procedure TMainFormCDS.N73Click(Sender: TObject);
begin
   Application.CreateForm(TFormEditTemy, FormEditTemy);
   FormEditTemy.ShowModal;
end;

procedure TMainFormCDS.N74Click(Sender: TObject);
begin
     Application.CreateForm(TFormTestBoln, FormTestBoln);
     FormTestBoln.ShowModal;
end;

procedure TMainFormCDS.ActionKomandirowkiPersonExecute(Sender: TObject);
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
                
                   Application.CreateForm(TFormBlnAbo,FormBlnAbo);
                   FormBlnAbo.WantedTabno := Curr_Person^.Tabno;
                   FormBlnAbo.WantedFIO   := Curr_Person^.FIO+' '+Curr_Person^.Dolg;
                   FormBlnAbo.ShifrKat    := Curr_Person^.Kategorija;
                   FormBlnAbo.ShifrGru    := Curr_Person^.Gruppa;
                   FormBlnAbo.WantedCurrPerson:=Curr_Person;
                   FormBlnAbo.WantedMode:=10;
                   FormBlnAbo.ShowModal;

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

procedure TMainFormCDS.N75Click(Sender: TObject);
begin
    Application.CreateForm(TFormBoln, FormBoln);
    FormBoln.WantedMode:=10;
    FormBoln.ShowModal;
    StringGrid1.SetFocus;
end;

procedure TMainFormCDS.N77Click(Sender: TObject);
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

procedure TMainFormCDS.N78Click(Sender: TObject);
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

procedure TMainFormCDS.N79Click(Sender: TObject);
begin
    FormWait.Show;
    Application.ProcessMessages;
    Application.CreateForm(TFormMoveNewOkladToRazr, FormMoveNewOkladToRazr);
    FormMoveNewOkladToRazr.ShowModal;
    StringGrid1.SetFocus;
end;

procedure TMainFormCDS.N110Click(Sender: TObject);
begin
    Application.CreateForm(TForm1DF, Form1DF);
    Form1DF.ShowModal;
    StringGrid1.SetFocus;
end;

procedure TMainFormCDS.N80Click(Sender: TObject);
begin
    Application.CreateForm(TFormGrid, FormGrid);
    FormGrid.ShowModal;
    StringGrid1.SetFocus;
end;

procedure TMainFormCDS.N82Click(Sender: TObject);
begin
    Application.CreateForm(TFormPlanSwod, FormPlanSwod);
    FormPlanSwod.ShowModal;
    StringGrid1.SetFocus;
end;

procedure TMainFormCDS.N83Click(Sender: TObject);
begin
    Application.CreateForm(TFormMakeALLGuid, FormMakeALLGuid);
    FormMakeALLGuid.ShowModal;
    StringGrid1.SetFocus;
end;

procedure TMainFormCDS.N84Click(Sender: TObject);
begin
    if not YesNo('Сгенерировать данные за текущий месяц?') then Exit;
    Application.CreateForm(TFormGen, FormGen);
    FormGen.ShowModal;
    StringGrid1.SetFocus;

end;

procedure TMainFormCDS.N85Click(Sender: TObject);
begin
      Self.Close;
end;

procedure TMainFormCDS.N86Click(Sender: TObject);
begin
    FormWait.Show;
    Application.ProcessMessages;
    Application.CreateForm(TFormPivotDolg, FormPivotDolg);
    FormWait.Hide;
    Application.ProcessMessages;
    FormPivotDolg.ShowModal;
    StringGrid1.SetFocus;
end;

procedure TMainFormCDS.N87Click(Sender: TObject);
begin
    Application.CreateForm(TFormSBSSpr, FormSBSSpr);
    FormSBSSpr.ShowModal;
    StringGrid1.SetFocus;

end;

procedure TMainFormCDS.N89Click(Sender: TObject);
begin
     Application.CreateForm(TFormListPerepl,FormListPerepl);
     FormListPerepl.ShowModal;
end;

procedure TMainFormCDS.N90Click(Sender: TObject);
begin
     Application.CreateForm(TFormListDblVpl,FormListDblVpl);
     FormListDblVpl.ShowModal;
end;

procedure TMainFormCDS.N91Click(Sender: TObject);
begin
     Application.CreateForm(TFormTstGruPrsnAddUd,FormTstGruPrsnAddUd);
     FormTstGruPrsnAddUd.ShowModal;
end;

procedure TMainFormCDS.N92Click(Sender: TObject);
begin
     Application.CreateForm(TFormPrepRl,FormPrepRl);
     FormPrepRl.ShowModal;
end;

procedure TMainFormCDS.N94Click(Sender: TObject);
begin
     Application.CreateForm(TFormRecalcNalCurr,FormRecalcNalCurr);
     FormReCalcNalCurr.ShowModal;
     MakeGrid(StringGrid1.Row);
     Self.ActiveControl:=Self.StringGrid1;
     StringGrid1.Refresh;
     StringGrid1.SetFocus;
end;

procedure TMainFormCDS.N93Click(Sender: TObject);
begin
     if CntFormRptSL=0 then
        begin
             Application.CreateForm(TFormRptSl,FormRptSl);
             FormRptSl.Show;
        end;


end;

procedure TMainFormCDS.N96Click(Sender: TObject);
begin
     Application.CreateForm(TFormDelWantedUd,FormDelWantedUd);
     FormDelWantedUd.ShowModal;

end;

procedure TMainFormCDS.GUIDSQL1Click(Sender: TObject);
begin
     Application.CreateForm(TFormMoveGUID,FormMoveGUID);
     FormMoveGUID.ShowModal;
end;

procedure TMainFormCDS.N95Click(Sender: TObject);
begin
     Application.CreateForm(TFormNotUkr,FormNotUkr);
     FormNotUkr.ShowModal;
end;

procedure TMainFormCDS.N20102Click(Sender: TObject);
begin
     Application.CreateForm(TFormPersMonthMenu, FormPersMonthMenu);
     FormPersMonthMenu.ShowModal;
end;

procedure TMainFormCDS.N20111Click(Sender: TObject);
begin
     Application.CreateForm(TFormECBMonthMenu, FormECBMonthMenu);
     FormECBMonthMenu.ShowModal;
end;

procedure TMainFormCDS.ActionEditSwidExecute(Sender: TObject);
begin
     Application.CreateForm(TFormSSNomera, FormSSNomera);
     FormSSNomera.ShowModal;
end;

procedure TMainFormCDS.N97Click(Sender: TObject);
begin
     ActionEditSwidExecute(Sender);
end;

procedure TMainFormCDS.N98Click(Sender: TObject);
begin
     Application.CreateForm(TFormReeBoln, FormReeBoln);
     FormReeBoln.ShowModal;
end;

procedure TMainFormCDS.N100Click(Sender: TObject);
begin
     if CntFormRptTstECB=0 then
        begin
             Application.CreateForm(TFormRptTstECB,FormRptTstECB);
             FormRptTstECB.Show;
        end;
end;

procedure TMainFormCDS.N101Click(Sender: TObject);
begin
     if CntFormRptTstECB1=0 then
        begin
             Application.CreateForm(TFormRptTstECB1,FormRptTstECB1);
             FormRptTstECB1.Show;
        end;

end;

procedure TMainFormCDS.N102Click(Sender: TObject);
begin
     if CntFormWantedAdd=0 then
        begin
             Application.CreateForm(TFormRptWantedAdd,FormRptWantedAdd);
             FormRptWantedAdd.Show;
        end;
end;

procedure TMainFormCDS.N103Click(Sender: TObject);
begin
     ActionEditSwidExecute(Sender);
end;

procedure TMainFormCDS.N20112Click(Sender: TObject);
begin

      Application.CreateForm(TFormMakeALLTabel032011,FormMakeALLTabel032011);
      FormMakeALLTabel032011.ShowModal;
end;

procedure TMainFormCDS.N105Click(Sender: TObject);
begin
     if CntFormTstOsnMR=0 then
        begin
             Application.CreateForm(TFormTstOsnMR,FormTstOsnMR);
             FormTstOsnMR.Show;
        end;

end;

procedure TMainFormCDS.N104Click(Sender: TObject);
begin
    Application.CreateForm(TFormMakeAllChain,FormMakeAllChain);
    FormMakeAllChain.ShowModal;
end;

procedure TMainFormCDS.ActionRecalcPersonForMonthExecute(Sender: TObject);
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

procedure TMainFormCDS.N107Click(Sender: TObject);
begin
    Application.CreateForm(TFormDelWantedECB,FormDelWantedECB);
    FormDelWantedECB.ShowModal;

end;

procedure TMainFormCDS.FormKeyPress(Sender: TObject; var Key: Char);
 var i:integer;
begin
     StringGrid1.SetFocus;
end;

procedure TMainFormCDS.actAnalyzeNalogi2011Execute(Sender: TObject);
 var Y,M,Tabno,i,j:Integer;
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
    FormAnalyzeNalogi:=TFormAnalyzeNalogi.CreateDB(nil,Curr_Person^.Tabno,y,m,Curr_Person);
    FormAnalyzeNalogi.ShowModal;
end;

procedure TMainFormCDS.N106Click(Sender: TObject);
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

procedure TMainFormCDS.ActionReclacPersonWithModeExecute(Sender: TObject);
begin
        RecalcPersonWithWantedMode(0);
end;

procedure TMainFormCDS.RecalcPersonWithWantedMode(WantedMode:integer);
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
procedure TMainFormCDS.ActionRecalcPersonWithMode1Execute(Sender: TObject);
begin
     RecalcPersonWithWantedMode(1);
end;

procedure TMainFormCDS.N108Click(Sender: TObject);
begin
     Application.CreateForm(TFormRptDolgSummy,FormRptDolgSummy);
     FormRptDolgSummy.ShowModal;
end;

procedure TMainFormCDS.N109Click(Sender: TObject);
begin
     Application.CreateForm(TFormRptSwodECB,FormRptSwodECB);
     FormRptSwodECB.ShowModal;
end;

procedure TMainFormCDS.N111Click(Sender: TObject);
begin
     if CntFormMakeLgotyPNSwm=0 then
        begin
             Application.CreateForm(TFormMakeLgotyPNSwm,FormMakeLgotyPNSwm);
             FormMakeLgotyPNSwm.Show;
        end;

end;

procedure TMainFormCDS.N112Click(Sender: TObject);
begin

     Application.CreateForm(TFormDelUdForWantedMonth,FormDelUdForWantedMonth);
     FormDelUdForWantedMonth.Show;
end;

procedure TMainFormCDS.ActionPersonOExecute(Sender: TObject);
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

procedure TMainFormCDS.ActionRecalcNalogiAllPersonForPassMonthNewExecute(
  Sender: TObject);
begin
     Application.CreateForm(TFormRecalcNalPass,FormRecalcNalPass);
     FormRecalcNalPass.ShowModal;

end;

procedure TMainFormCDS.TimerSavePodrTimer(Sender: TObject);
begin
     Exit;
     if NSRV<>CurrentPodrReadedByOperator then Exit;
     if NMES<>FLOW_MONTH then Exit;
     SavePodr;
end;

procedure TMainFormCDS.ActionTryRestorePodrExecute(Sender: TObject);
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

procedure TMainFormCDS.ActionRestorePodrFromFileExecute(Sender: TObject);
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

procedure TMainFormCDS.ActionPochasSwodExecute(Sender: TObject);
begin
     Application.CreateForm(TFormPochasSwod,FormPochasSwod);
     FormPochasSwod.ShowModal;

end;

procedure TMainFormCDS.ActionOtp201201Execute(Sender: TObject);
begin
     Application.CreateForm(TFormOtp1201,FormOtp1201);
     FormOtp1201.ShowModal;

end;

procedure TMainFormCDS.ActionRprCnAutomaticExecute(Sender: TObject);
begin
     Application.CreateForm(TFormRepairCNSQL,FormRepairCNSQL);
     FormRepairCNSQL.ShowModal;

end;

procedure TMainFormCDS.ActionFormMoveOtpHelp2011Execute(Sender: TObject);
begin
     if not YesNo('Вы точно понимаете свои действия?. (Ведь можно испортить данные)') then Exit;
     Application.CreateForm(TFormMoveOtpHelp2010,FormMoveOtpHelp2010);
     FormMoveOtpHelp2010.ShowModal;


end;

procedure TMainFormCDS.ActionEkonomExecute(Sender: TObject);
begin
//     if not YesNo('Вы точно понимаете свои действия?. (Ведь можно испортить данные)') then Exit;
     Application.CreateForm(TFormEkonom,FormEkonom);
     FormEkonom.ShowModal;

end;

procedure TMainFormCDS.ActionEditInfProcExecute(Sender: TObject);
begin
     Application.CreateForm(TFormInfProc,FormInfProc);
     FormInfProc.ShowModal;

end;

procedure TMainFormCDS.ActionSwodyCmpExecute(Sender: TObject);
begin
     Application.CreateForm(TFormSwodyCmp,FormSwodyCmp);
     FormSwodyCmp.ShowModal;
end;

procedure TMainFormCDS.ActTestDuplicatesExecute(Sender: TObject);
begin
     Application.CreateForm(TFormTestDuplicates,FormTestDuplicates);
     FormTestDuplicates.ShowModal;
end;

procedure TMainFormCDS.ActIndexPersonCalcExecute(Sender: TObject);
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

procedure TMainFormCDS.ActMovRecalcPod2012Execute(Sender: TObject);
begin
     Application.CreateForm(TFormMovePod12Recalc,FormMovePod12Recalc);
     FormMovePod12Recalc.ShowModal;
end;

procedure TMainFormCDS.ActionDelRecenExecute(Sender: TObject);
begin
     Application.CreateForm(TFormDelRecen,FormDelRecen);
     FormDelRecen.ShowModal;
end;

procedure TMainFormCDS.ActionTestKROExecute(Sender: TObject);
begin
     Application.CreateForm(TFormRepKOS,FormRepKOS);
     FormRepKOS.ShowModal;
end;

procedure TMainFormCDS.ActDelAllCnExecute(Sender: TObject);
begin
     Application.CreateForm(TFormDelAllCN,FormDelAllCN);
     FormDelAllCN.ShowModal;
end;

procedure TMainFormCDS.ActOtpUhodExecute(Sender: TObject);
begin
     Application.CreateForm(TFormOtpUhod,FormOtpUhod);
     FormOtpUhod.ShowModal;
end;

procedure TMainFormCDS.ActionMoveIskraExecute(Sender: TObject);
begin
     Application.CreateForm(TFormMoveIskra,FormMoveIskra);
     FormMoveIskra.ShowModal;
end;

procedure TMainFormCDS.ActionTestNadbAbsentExecute(Sender: TObject);
begin
     Application.CreateForm(TFormTestNadbPresent,FormTestNadbPresent);
     FormTestNadbPresent.ShowModal;
end;

end.

