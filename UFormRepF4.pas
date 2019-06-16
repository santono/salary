unit UFormRepF4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, frxClass, frxDBSet, ExtCtrls,
  scrDef;

type
  TFormRepF4 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dtIn: TDateTimePicker;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    dsMinSal: TpFIBDataSet;
    trRead: TpFIBTransaction;
    dsoMinSal: TDataSource;
    dsMinSalID: TFIBIntegerField;
    dsMinSalY: TFIBIntegerField;
    dsMinSalM: TFIBIntegerField;
    dsMinSalTABNO: TFIBIntegerField;
    dsMinSalYEAR_ZA: TFIBIntegerField;
    dsMinSalMONTH_ZA: TFIBIntegerField;
    dsMinSalSUMMA: TFIBBCDField;
    dsMinSalSUMMA_DB: TFIBBCDField;
    dsMinSalSUMMA_RAZN: TFIBBCDField;
    dsMinSalWORKDAY: TFIBIntegerField;
    dsMinSalKOEF: TFIBBCDField;
    dsMinSalFIO: TFIBStringField;
    dsMinSalNEED_NOT: TFIBSmallIntField;
    dsPrinjatUwolen: TpFIBDataSet;
    dsPrinjatUwolenTABNO: TFIBIntegerField;
    dsPrinjatUwolenDATA_PRI: TFIBDateField;
    dsPrinjatUwolenDATA_UW: TFIBDateField;
    dsPrinjatUwolenCODE_UWOL: TFIBSmallIntField;
    dsPerevody: TpFIBDataSet;
    dsPerevodyTABNO: TFIBIntegerField;
    dsPerevodyFIO: TFIBStringField;
    dsPerevodyNAL_CODE: TFIBStringField;
    dsPerevodyDATA_PRI: TFIBDateField;
    dsPerevodyDATA_UW: TFIBDateField;
    dsPerevodyCODE_UWOL: TFIBSmallIntField;
    dsPerevodyNOMERPRIK: TFIBStringField;
    dsPerevodyDATAPRIK: TFIBDateField;
    dsPerevodyIDCLASSIFICATOR: TFIBIntegerField;
    dsPerevodyKODKP: TFIBStringField;
    dsPerevodyKODZKPPTR: TFIBStringField;
    dsPerevodyNAMEDOL: TFIBStringField;
    dsPerevodyNAMEPROF: TFIBStringField;
    dsDekr: TpFIBDataSet;
    dsDekrTABNO: TFIBIntegerField;
    dsDekrF_DATA: TFIBDateField;
    dsDekrL_DATA: TFIBDateField;
    dsDekrMODEILL: TFIBIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    shifrBk:integer;   // ������� ���������� ��� ���� 
    { Private declarations }
    procedure CreateReport6;
    procedure fillPerson(curr_person:person_ptr);
    procedure fillOsnPerson(curr_person:person_ptr);
    procedure fillSowmPerson(curr_person:person_ptr);
    procedure fillIllPerson(curr_person:person_ptr);
    procedure fillOtpPerson(curr_person:person_ptr);
    procedure fillDPPerson(curr_person:person_ptr);
    procedure fillPremPerson(curr_person:person_ptr);
    procedure fillPochasPerson(curr_person:person_ptr);
    procedure fillCheckPerson(curr_person:person_ptr);
    function GetMaxId6:integer;
    function getPreviousNalCode(tabno:integer):string;
    procedure fillFullList6Recs;
    procedure fillFullList6RecsFromCheckList;
    procedure fillCheckList;
    procedure fillDoplDoMin;
    procedure fillTable7;
    procedure fillTable5;
    procedure fillTable5PrinjatUwolen;
    procedure fillTable5Perevody;
    procedure fillTable5CPH;
    procedure fillTable5Dekr;

    function  getSummaFromF6(tabno:integer):real;
    function  isSciPedOsnInList(tabno:integer):boolean;
    procedure emptyIllOtpLists;
    procedure getDataKdPtv(tabno:integer;var start_d:integer;var end_d:integer;var kd_ptv:integer);
    function  getBolDay(tabno:integer;payYear:integer;payMnth:integer):integer;
    function  getDekrBolDay(tabno:integer;payYear:integer;payMnth:integer):integer;
    function  getOtpDay(tabno:integer;payYear:integer;payMnth:integer):integer;
    procedure fillBolDay;
    function isSciPedForSwod(curr_person:person_ptr):boolean;

    procedure moveToBD;

  public
    { Public declarations }
  end;

var
  FormRepF4: TFormRepF4;

implementation
  uses
      uFIBModule,UFormWait,ScrUtil,DateUtils,ComObj,ScrIO,
      scrLists,uFormMkPensList,uSqlUnit;
  type
       pRec5=^TRec5;
       TRec5=record
              YEARVY     : integer;
              MONTHVY    : integer;
              TABNO      : integer;
              PERIODM    : integer;
              PERIODY    : integer;
              ROWNUM     : integer;
              UKRGROMAD  : integer;
              NUMIDENT   : string;
              FIO        : string;
              NM         : string;
              FTN        : string;
              START_DT   : integer;
              END_DT     : integer;
              ZO         : integer;
              PID_ZV     : string;
              NRM_DT     : TDateTime; //* TDATE = DATE */,
              DOG_CPH    : integer; //* TSMALLCODE = SMALLINT DEFAULT 0 */,
              PNR        : string;
              ZKPP       : string;
              PROF       : string;
              POS        : string;
              PID        : string;
              VZV        : string;
             end;

       pRec6=^TRec6;
       TRec6=record
          id       : integer;
          yearVy   : integer;
          monthVy  : integer;
          tabno    : integer;
          periodM  : integer;
          periodY  : integer;
          rowNum   : integer;
          ukrGromad : integer;
          st       : integer;
          numIdent : string;
          fio      : string;
          nm       : string;
          ftn      : string;
          zo       : integer;
          payTp    : integer;
          payMnth  : integer;
          payYear  : integer;
          sumTotal : real;
          sumMax   : real;
          sumIns   : real;
          otk      : integer;
          exp      : integer;
          lineno   : integer;
          kdNp     : integer;
          kdNzp    : integer;
          kdPtv    : integer;
          nrm      : integer;
          kdVp     : integer;
          sumDiff  : real;
          sumNarah : real;
          nrc      : integer;
          w_r      : integer;
            end;
        pRecIll=^TRecIll;
        tRecIll=record
                 summa    : real;
                 pay_mnth : integer;
                 pay_Year : integer;
                 kdNp     : integer;
                end;
        pRec7 = ^tRec7;
        tRec7 = record
                 yearVy   : integer;
                 monthVy  : integer;
                 tabno    : integer;
                 PERIODM  : integer;
                 PERIODY  : integer;
                 ROWNUM   : integer;
                 UKRGROMAD : integer;
                 NUMIDENT  : string;
                 FIO       : string;
                 NM        : string;
                 FTN       : string;
                 C_PID     : string;
                 START_DT  : integer;
                 END_DT    : integer;
                 DAYS      : integer;
                 NORMZ     : integer;
                 HH        : integer;
                 MM        : integer;
                 NORMA     : integer;
                 SEAZON    : integer;
                 NUM_NAK   : string;
                 DT_NAK    : TDateTime;
                end;

        pRecPerson = ^TRecPerson;
        TRecPerson=record
                    tabno        : integer;
                    st           : integer;
                    numIdent     : string;
                    fio          : string;
                    nm           : string;
                    ftn          : string;
                    zo           : integer;
                    otk          : integer;
                    exp          : integer;
                    lineno       : integer;
                    kdNp         : integer;
                    kdNzp        : integer;
                    kdPtv        : integer;
                    nrm          : integer;
                    kdVp         : integer;
                    nrc          : integer;
                    summaAddSal  : real;
                    summaAddF6   : real;
                    summaMatHelp : real;
                    summaKassa   : real;
                    summaKoef    : real;
                    start_d      : integer;
                    end_d        : integer;
                    addList      : TList;
                   end;
           pRecAdd = ^TRecAdd;
           TRecAdd = record
                      shifrSta:integer;
                      Summa:real;
                      m:integer;
                      y:integer;
                      shifrPod:integer;
                     end;
           pRecCPH = ^TRecCPH;        // �������� ������� �������������
           TRecCPH = record
                      tabno         : integer;
                      shifrDogDetId : integer;
                     end;
  var list5,list6,list7 : TList;
      listIll,listOtp : TList;
      listCheck       : TList;
      listCPH         : TList;
      E:Variant;
{$R *.dfm}
 function addToF6(TABNO,zo,payTp,payMnth,payYear:integer;summaAdd:real;needZero:boolean=false;otk:integer=1;kd_ptv:integer=0;kd_nzp:integer=0;w_r:integer=0):pRec6;
 var finded:boolean;
     i:integer;
     rec6:pRec6;
     exp:integer;
 begin
     if ((abs(summaAdd)<0.01) and (not needZero)) then
        exit;
     // �������������� ���������
     if zo in [1,25,29] then
        if PensionerList.IsPensioner(Tabno) then
           if zo=29 then // ����������
              zo:=36     //������� - ����������
           else
           if zo=25 then
              zo:=32     //������� - ���������
           else
              zo:=2;  // ������� �������
     exp:=0;
     if zo in [25,32] then
        exp:=1;
     finded:=false;
     if list6.count>0 then
        for i:=0 to list6.Count-1 do
            if pRec6(list6.items[i])^.tabno=tabno then
            if pRec6(list6.items[i])^.zo=zo then
            if pRec6(list6.items[i])^.paytp=paytp then
            if pRec6(list6.items[i])^.payYear=payYear then
            if pRec6(list6.items[i])^.payMnth=payMnth then
            if pRec6(list6.items[i])^.w_r=w_r then
               begin
                    finded:=true;
                    pRec6(list6.items[i])^.sumTotal:=r10(pRec6(list6.items[i])^.sumTotal)+r10(summaAdd);
                    rec6:=pRec6(list6.items[i]);
                    break;
               end;
     if finded then
        begin
             addToF6 := rec6;
             exit;
        end;
     New(Rec6);
     fillChar(Rec6^,sizeOf(Rec6^),0);
     Rec6.id       := FormRepF4.GetMaxId6+1;
     Rec6.yearVy   := currYear;
     Rec6.monthVy  := nmes;
     Rec6.tabno    := tabno;
     Rec6.periodM  := nmes;
     Rec6.periodY  := Rec6.yearVy;
     Rec6.rowNum   := 0;
     Rec6.ukrGromad:= 1;
     Rec6.zo       := zo; // ��� ������� ������� 1- ��� ������� 2- �������������� 32- �������� �������
     Rec6.payTp    := payTp;
     Rec6.payMnth  := payMnth;
     Rec6.payYear  := payYear;
     if payTp=13 then
        rec6.sumDiff := summaAdd
     else
        Rec6.sumTotal := summaAdd;
     if otk>0 then
        rec6.otk      := otk;
     if kd_ptv>0 then
        rec6.kdPtv:=kd_ptv;
     if kd_nzp>0 then
        rec6.kdNzp:=kd_nzp;
     rec6.exp:=exp;
     list6.add(rec6);
     addToF6 := rec6;

 end;

procedure TFormRepF4.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormRepF4.FormCreate(Sender: TObject);
begin
     dtIn.Date        := IncMonth(Date,-1);
     ShifrBk          := 0;
end;

procedure TFormRepF4.BitBtn1Click(Sender: TObject);
begin
     CreateReport6;
end;
function compare(Item1:Pointer;Item2:pointer):Integer;
 var retVal:Integer;
     modeSort:integer;
 begin
      modeSort:=0;
      if (modeSort=0) then
         retVal:=AnsiCompareText(pRec6(Item1).fio,pRec6(Item2).fio);
      compare:=retVal;
      
 end;

function TFormRepF4.GetMaxId6:integer;
 var i:integer;
     retVal:integer;
 begin
     retVal:=0;
     if list6.count>0 then
        for i:=0 to list6.Count-1 do
            begin
                 if pRec6(list6.Items[i])^.id>retVal then 
                    retVal:=pRec6(list6.Items[i])^.id;
            end;
     GetMaxId6:=retVal;
 end;

procedure TFormRepF4.CreateReport6;
  var savNMES,savNSRV:integer;
      iNSRV,i:Integer;
      curr_person:PERSON_PTR;
  begin
       savNMES:=NMES;
       savNSRV:=NSRV;
       EMPTY_ALL_PERSON;
       list5:=TList.Create;
       list6:=TList.Create;
       list7:=TList.Create;
       listCheck:=TList.Create;
       listCPH:=TList.Create;
       ProgressBar1.Min:=0;
       ProgressBar1.Max:=Count_Serv * 8;
       ProgressBar1.Step:=1;
       MAKEPENSLIST(2);   // ������ ���������
       // 1 ��������
       for iNSRV:=1 to Count_Serv do
           begin
                NSRV:=iNSRV;
                MKFLNM;
                ProgressBar1.StepIt;
                Application.ProcessMessages;
//                if IsColedgPodr(NSRV) then continue;
                if nsrv in [11,102] then continue;
                if not fileexists(FNINF) then Continue;
//                if not nameservlist.IS_MO_BUD(nsrv) then continue;
                getinf(false);
                curr_person:=HEAD_PERSON;
                while (curr_person<>nil) do
                  begin
                       fillOsnPerson(Curr_person);
                       curr_person:=curr_person^.NEXT;
                  end;
                EMPTY_ALL_PERSON;
           end;
       // 2 ����������
       for iNSRV:=1 to Count_Serv do
           begin
                NSRV:=iNSRV;
                MKFLNM;
                ProgressBar1.StepIt;
                Application.ProcessMessages;
//                if IsColedgPodr(NSRV) then continue;
                if nsrv in [11,102] then continue;
                if not fileexists(FNINF) then Continue;
//                if not nameservlist.IS_MO_BUD(nsrv) then continue;
                getinf(false);
                curr_person:=HEAD_PERSON;
                while (curr_person<>nil) do
                  begin
                       fillSowmPerson(Curr_person);
                       curr_person:=curr_person^.NEXT;
                  end;
                EMPTY_ALL_PERSON;
           end;
       // 3 ������
       for iNSRV:=1 to Count_Serv do
           begin
                NSRV:=iNSRV;
                ProgressBar1.StepIt;
                Application.ProcessMessages;
                if not NSRV in [11,102] then continue;
                MKFLNM;
                if not fileexists(FNINF) then Continue;
//                if not nameservlist.IS_MO_BUD(nsrv) then continue;
                getinf(false);
                curr_person:=HEAD_PERSON;
                while (curr_person<>nil) do
                  begin
                       fillPremPerson(Curr_person);
                       curr_person:=curr_person^.NEXT;
                  end;
                EMPTY_ALL_PERSON;
           end;
       // 4 ���������
       for iNSRV:=1 to Count_Serv do
           begin
                NSRV:=iNSRV;
                MKFLNM;
                ProgressBar1.StepIt;
                Application.ProcessMessages;
//                if IsColedgPodr(NSRV) then continue;
                if nsrv in [81,82,102,121] then continue;
                if not fileexists(FNINF) then Continue;
//                if not nameservlist.IS_MO_BUD(nsrv) then continue;
                getinf(false);
                curr_person:=HEAD_PERSON;
                while (curr_person<>nil) do
                  begin
                       fillPochasPerson(Curr_person);
                       curr_person:=curr_person^.NEXT;
                  end;
                EMPTY_ALL_PERSON;
           end;

       // 5 ����������
       for iNSRV:=1 to Count_Serv do
           begin
                NSRV:=iNSRV;
                MKFLNM;
                ProgressBar1.StepIt;
                Application.ProcessMessages;
//                if IsColedgPodr(NSRV) then continue;
                if not fileexists(FNINF) then Continue;
//                if not nameservlist.IS_MO_BUD(nsrv) then continue;
                getinf(false);
                curr_person:=HEAD_PERSON;
                while (curr_person<>nil) do
                  begin
                       fillIllPerson(Curr_person);
                       curr_person:=curr_person^.NEXT;
                  end;
                EMPTY_ALL_PERSON;
           end;
       fillBolDay;
       // 6 ���������
       for iNSRV:=1 to Count_Serv do
           begin
                NSRV:=iNSRV;
                MKFLNM;
                ProgressBar1.StepIt;
                Application.ProcessMessages;
//                if IsColedgPodr(NSRV) then continue;
                if not fileexists(FNINF) then Continue;
//                if not nameservlist.IS_MO_BUD(nsrv) then continue;
                getinf(false);
                curr_person:=HEAD_PERSON;
                while (curr_person<>nil) do
                  begin
                       fillOtpPerson(Curr_person);
                       curr_person:=curr_person^.NEXT;
                  end;
                EMPTY_ALL_PERSON;
           end;
       // 7 �������� �������
       for iNSRV:=1 to Count_Serv do
           begin
                NSRV:=iNSRV;
                ProgressBar1.StepIt;
                Application.ProcessMessages;
                if not DOG_POD_PODRAZD(NSRV) then continue;
                MKFLNM;
                if not fileexists(FNINF) then Continue;
//                if not nameservlist.IS_MO_BUD(nsrv) then continue;
                getinf(false);
                curr_person:=HEAD_PERSON;
                while (curr_person<>nil) do
                  begin
                       fillDPPerson(Curr_person);
                       curr_person:=curr_person^.NEXT;
                  end;
                EMPTY_ALL_PERSON;
           end;
       // 8 ��������
       for iNSRV:=1 to Count_Serv do
           begin
                NSRV:=iNSRV;
                ProgressBar1.StepIt;
                Application.ProcessMessages;
                MKFLNM;
                if not fileexists(FNINF) then Continue;
//                if not nameservlist.IS_MO_BUD(nsrv) then continue;
                getinf(false);
                curr_person:=HEAD_PERSON;
                while (curr_person<>nil) do
                  begin
                       fillCheckPerson(Curr_person);
                       curr_person:=curr_person^.NEXT;
                  end;
                EMPTY_ALL_PERSON;
           end;
       // 9 ������� �� �����������
       fillDoplDoMin;    //tp=13
       fillCheckList;
       Application.ProcessMessages;
//       list4.Sort(@Compare);
//       fillFullList6Recs;
       fillFullList6RecsFromCheckList;
       fillTable5;
       fillTable7;
       DisposePensList;
       moveToBD;
       if list5.count>0 then
          for i:=0 to list5.count-1 do
              dispose(pRec5(list5.Items[i]));
       list5.Free;
       list5:=nil;
       if list6.count>0 then
          for i:=0 to list6.count-1 do
              dispose(pRec6(list6.Items[i]));
       list6.Free;
       list6:=nil;
       if list7.count>0 then
          for i:=0 to list7.count-1 do
              dispose(pRec7(list7.Items[i]));
       list7.Free;
       list7:=nil;
       if listCPH.count>0 then
          for i:=0 to listCPH.count-1 do
              dispose(pRecCPH(listCPH.Items[i]));
       listCPH.Free;
       listCPH:=nil;
       if listCheck.count>0 then
          for i:=0 to listCheck.count-1 do
              dispose(pRecPerson(listCheck.Items[i]));
       listCheck.Free;
       listCheck:=nil;
       NMES:=savNMES;
       NSRV:=savNSRV;
       MKFLNM;
       getinf(true);
       showMessage('����� �����������');
  end;
procedure TFormRepF4.fillPerson(curr_person:person_ptr);
  var rec6:pRec6;
      shifrDol:integer;
      shifrKat:integer;
      i:integer;
      summaAdd,summaNal:real;
      summaNotSciPedAdd:real;
      summaSciPedAdd:real;
      st:integer;
      payTp:integer;
      sumDiff:real;
      otk:integer;
      nzp:integer;
      kdptv:integer;
      kdvp:integer;
      nrc:integer;
      sumNarah:real;
      kdPv:integer;
      zo,payYear,payMnth:integer;
    function getSummaOsnAddForPerson(curr_person:PERSON_PTR):Real;
      var retVal:Real;
          curr_add:ADD_PTR;
      begin
          retVal:=0;
          if (DOG_POD_PODRAZD(nsrv)
              or (nsrv=121)
              or (nsrv=82)
             ) then
             begin
                  getSummaOsnAddForPerson:=0;
                  exit;
             end;
          curr_add:=curr_person.ADD;
          while (curr_add<>nil) do
             begin
                  if not (IsBolnShifrLera(curr_add^.shifr)
                      or
                      IsOtpShifr(curr_add^.shifr)
                      or
                      (curr_add^.shifr=KASSA_SHIFR)
                      or
                      (curr_add^.shifr=31)  // ��� ������ ����������
                      or
                      (curr_add^.shifr=dekret_shifr)
                      or
                      (curr_add^.shifr=141) // ��� ������ �� ����������
                      or
                      (curr_add^.shifr=dogPodShifr)
                      ) then
                     retVal:=retVal+curr_add^.SUMMA;
                  curr_add:=curr_add.NEXT;
             end;
          getSummaOsnAddForPerson:=retVal;
      end;
    procedure emptyIllOtpLists;
      var i:integer;
      begin
           if listIll<>Nil then
              begin
                    if listIll.count>0 then
                       for i:=0 to listIll.Count-1 do
                           dispose(pRecIll(listIll.Items[i]));
                    listIll.Free;
                    listIll:=nil;
              end;
           if listOtp<>Nil then
              begin
                    if listOtp.count>0 then
                       for i:=0 to listOtp.Count-1 do
                           dispose(pRecIll(listOtp.Items[i]));
                    listOtp.Free;
                    listOtp:=nil;
              end;
      end;
    procedure fillIllPerson;
      var curr_add:add_ptr;
          recIll:pRecIll;
          i:integer;
          finded:boolean;
      begin
           curr_add:=curr_person^.ADD;
           while (curr_add<>nil) do
             begin
                  if IsBolnShifrForECB(curr_add^.SHIFR) then
                     begin
                          finded:=false;
                          if listIll.Count>0 then
                             for i:=0 to listIll.Count-1 do
                                 begin
                                      if (
                                          (pRecIll(listIll.Items[i]).pay_mnth=curr_add^.PERIOD)
                                          and
                                          (pRecIll(listIll.Items[i]).pay_year=curr_add^.year+1990)) then
                                          begin
                                               pRecIll(listIll.Items[i])^.summa:=pRecIll(listIll.Items[i])^.summa + curr_add^.SUMMA;
                                               finded := true;
                                               break;
                                          end;
                                 end;
                          if not finded then
                             begin
                                  new(recIll);
                                  recIll^.summa    := curr_add^.SUMMA;
                                  recIll^.pay_mnth := curr_Add^.PERIOD;
                                  recIll^.pay_Year := curr_add^.YEAR+1990;
                                  recIll^.kdNp     := 0;
                                  listIll.Add(recIll);
                             end;
                     end;
                  curr_add:=curr_add^.NEXT;
             end;

      end;
    procedure fillOtpPerson;
      var curr_add:add_ptr;
          recIll:pRecIll;
          i:integer;
          finded:boolean;
      begin
           curr_add:=curr_person^.ADD;
           while (curr_add<>nil) do
             begin
                  if IsOtpShifr(curr_add^.SHIFR) then
                     begin
                          finded:=false;
                          if listOtp.Count>0 then
                             for i:=0 to listOtp.Count-1 do
                                 begin
                                      if (
                                          (pRecIll(listOtp.Items[i]).pay_mnth=curr_add^.PERIOD)
                                          and
                                          (pRecIll(listOtp.Items[i]).pay_year=curr_add^.year+1990)) then
                                          begin
                                               pRecIll(listOtp.Items[i])^.summa:=pRecIll(listOtp.Items[i])^.summa + curr_add^.SUMMA;
                                               finded := true;
                                               break;
                                          end;
                                 end;
                          if not finded then
                             begin
                                  new(recIll);
                                  recIll^.summa    := curr_add^.SUMMA;
                                  recIll^.pay_mnth := curr_Add^.PERIOD;
                                  recIll^.pay_Year := curr_add^.YEAR+1990;
                                  recIll^.kdNp     := 0;
                                  listOtp.Add(recIll);
                             end;
                     end;
                  curr_add:=curr_add^.NEXT;
             end;
      end;
    procedure fillSciPerson;
      begin
           summaSciPedAdd:=0;
           if isSciPedForSwod(curr_Person) then
           if IS_OSN_WID_RABOTY(curr_Person) then
              summaSciPedAdd:=summaAdd;
      end;
    procedure fillNotSciPerson;
      begin
           summaNotSciPedAdd:=0;
           if isSciPedForSwod(curr_Person) then
           if not IS_OSN_WID_RABOTY(curr_Person) then
              summaNotSciPedAdd:=summaAdd
           else
           else
              summaNotSciPedAdd:=summaAdd;
      end;

  begin
       emptyIllOtpLists;
       listIll:=TList.Create;
       listOtp:=TList.Create;
       fillSciPerson;
       fillNotSciPerson;
       fillIllPerson;
       fillOtpPerson;
       fillSciPerson;
       fillNotSciPerson;
       if abs(summaSciPedAdd)>0.01 then
          begin
               zo       := 25;
               summaAdd := summaSciPedAdd;
               payTp    := 0;
               payYear  := currYear;
               payMnth  := nmes;
               rec6:=addToF6(curr_Person^.TABNO,zo,payTp,payMnth,payYear,summaAdd);
          end;
       if abs(summaNotSciPedAdd)>0.01 then
          begin
               zo       := 1;
               summaAdd := summaNotSciPedAdd;
               payTp    := 0;
               payYear  := currYear;
               payMnth  := nmes;
               rec6:=addToF6(curr_Person^.TABNO,zo,payTp,payMnth,payYear,summaAdd);
          end;
       if listIll.count>0 then
          for i:=0 to listIll.Count-1 do
              begin
                   zo:=25;
              end;
       nzp:=OTPUSK_BEZ_DAY(1,CURR_PERSON);
  end;

procedure TFormRepF4.fillOsnPerson(curr_person:person_ptr);
  var rec6:pRec6;
      i:integer;
      summaAdd:real;
      summaNotSciPedAdd:real;
      summaSciPedAdd:real;
      payTp:integer;
      zo,payYear,payMnth:integer;
      kd_ptv:integer;
      kd_nzp:integer;
    function getSummaOsnAddForPerson(curr_person:PERSON_PTR):Real;
      var retVal:Real;
          curr_add:ADD_PTR;
      begin
          retVal:=0;
          curr_add:=curr_person.ADD;
          while (curr_add<>nil) do
             begin
                    if not (IsBolnShifrLera(curr_add^.shifr)
                      or
                      IsOtpShifr(curr_add^.shifr)
                      or
                      (curr_add^.shifr=KASSA_SHIFR)
                      or
                      (curr_add^.shifr=31)  // ��� ������ ����������
                      or
                      (curr_add^.shifr=dekret_shifr)
                      or
                      (curr_add^.shifr=pochas_shifr)
                      or
                      (curr_add^.shifr=141) // ��� ������ �� ����������
                      or
                      (curr_add^.shifr=dogPodShifr)
                      ) then
                     retVal:=retVal+curr_add^.SUMMA;
                  curr_add:=curr_add.NEXT;
             end;
          getSummaOsnAddForPerson:=retVal;
      end;
    procedure fillSciPerson;
      begin
           summaSciPedAdd:=0;
           if isSciPedForSwod(curr_Person) then
              summaSciPedAdd:=summaAdd;
      end;
    procedure fillNotSciPerson;
      begin
           summaNotSciPedAdd:=0;
           if not isSciPedForSwod(curr_Person) then
              summaNotSciPedAdd:=summaAdd
      end;
    procedure fillKdPtvPerson;
      var retVal:integer;
          i:integer;
      begin
           retVal:=0;
           for i:=1 to 31 do
               if not (curr_person^.TABEL[i] in [0,NEZAPOLN]) then
                  inc(retVal);
               if retVal>LenMonth(encodeDate(currYear,nmes,1)) then
                  retVal:=LenMonth(encodeDate(currYear,nmes,1));

           kd_Ptv:=retVal;
      end;
    procedure fillKdNzpPerson;
      var retVal:integer;
          i:integer;
      begin
           retVal:=0;
           for i:=1 to 31 do
               if not (curr_person^.TABEL[i] in [0,NEZAPOLN]) then
                  inc(retVal);
               if retVal>LenMonth(encodeDate(currYear,nmes,1)) then
                  retVal:=LenMonth(encodeDate(currYear,nmes,1));

           kd_Nzp:=OTPUSK_BEZ_DAY(1,curr_person);
      end;

  begin
       if not IS_OSN_WID_RABOTY(curr_person) then exit;
       if nsrv in [82,98,105,106,121] then exit; // 98 - ���������
       if DOG_POD_PODRAZD(nsrv) then exit;
       summaAdd:=getSummaOsnAddForPerson(curr_person);
       if abs(summaAdd)<0.01 then exit;
       if curr_person^.tabno=55 then
          curr_person^.MALO:=0;
       fillSciPerson;
       fillNotSciPerson;
       fillKdPtvPerson;
       fillKdNzpPerson;
       if abs(summaSciPedAdd)>0.01 then
          begin
               zo       := 25;
               summaAdd := summaSciPedAdd;
               payTp    := 0;
               payYear  := currYear;
               payMnth  := nmes;
               rec6:=addToF6(curr_Person^.TABNO,zo,payTp,payMnth,payYear,summaAdd,false,1,kd_ptv,kd_nzp);
               rec6^.w_r:=1;
          end;
       if abs(summaNotSciPedAdd)>0.01 then
          begin
               zo       := 1;
               summaAdd := summaNotSciPedAdd;
               payTp    := 0;
               payYear  := currYear;
               payMnth  := nmes;
               rec6:=addToF6(curr_Person^.TABNO,zo,payTp,payMnth,payYear,summaAdd,false,1,kd_ptv,kd_nzp);
               rec6^.w_r:=1;
          end;
//       nzp:=OTPUSK_BEZ_DAY(1,CURR_PERSON);
  end;

procedure TFormRepF4.fillSowmPerson(curr_person:person_ptr);
  var rec6:pRec6;
      i:integer;
      summaAdd:real;
      summaNotSciPedAdd:real;
      summaSciPedAdd:real;
      payTp:integer;
      zo,payYear,payMnth:integer;
      otk:integer;
      kd_ptv,kd_nzp:integer;
    function getSummaOsnAddForPerson(curr_person:PERSON_PTR):Real;
      var retVal:Real;
          curr_add:ADD_PTR;
      begin
          retVal:=0;
          curr_add:=curr_person.ADD;
          while (curr_add<>nil) do
             begin
                    if not (IsBolnShifrLera(curr_add^.shifr)
                      or
                      IsOtpShifr(curr_add^.shifr)
                      or
                      (curr_add^.shifr=KASSA_SHIFR)
                      or
                      (curr_add^.shifr=31)  // ��� ������ ����������
                      or
                      (curr_add^.shifr=dekret_shifr)
                      or
                      (curr_add^.shifr=pochas_shifr)
                      or
                      (curr_add^.shifr=141) // ��� ������ �� ����������
                      or
                      (curr_add^.shifr=dogPodShifr)
                      ) then
                     retVal:=retVal+curr_add^.SUMMA;
                  curr_add:=curr_add.NEXT;
             end;
          getSummaOsnAddForPerson:=retVal;
      end;
    procedure fillSciPerson;
      begin
           summaSciPedAdd:=0;
           if isSciPedForSwod(curr_Person) then
           if not isSciPedOsnInList(curr_person^.tabno) then
              summaSciPedAdd:=summaAdd;
      end;
    procedure fillNotSciPerson;
      begin
           summaNotSciPedAdd:=0;
           if (not isSciPedForSwod(curr_Person)) or
              (
               (isSciPedForSwod(curr_Person)) and
               (isSciPedOsnInList(curr_person^.tabno))
              )
           then
              summaNotSciPedAdd:=summaAdd
      end;
    procedure fillKdPtvPerson;
      var retVal:integer;
          i:integer;
      begin
           retVal:=0;
           for i:=1 to 31 do
               if not (curr_person^.TABEL[i] in [0,NEZAPOLN]) then
                  inc(retVal);
               if retVal>LenMonth(encodeDate(currYear,nmes,1)) then
                  retVal:=LenMonth(encodeDate(currYear,nmes,1));

           kd_Ptv:=retVal;
      end;
    procedure fillKdNzpPerson;
      var retVal:integer;
          i:integer;
      begin
           retVal:=0;
           for i:=1 to 31 do
               if not (curr_person^.TABEL[i] in [0,NEZAPOLN]) then
                  inc(retVal);
               if retVal>LenMonth(encodeDate(currYear,nmes,1)) then
                  retVal:=LenMonth(encodeDate(currYear,nmes,1));

           kd_Nzp:=OTPUSK_BEZ_DAY(1,curr_person);
      end;

  begin
       if IS_OSN_WID_RABOTY(curr_person) then exit;
       if nsrv in [82,98,105,106,121] then exit;  // 98 - ���������
       if DOG_POD_PODRAZD(nsrv) then exit;
       summaAdd:=getSummaOsnAddForPerson(curr_person);
       if abs(summaAdd)<0.01 then exit;
       if curr_person^.tabno=55 then
          curr_person^.MALO:=0;
       fillSciPerson;
       fillNotSciPerson;
       fillKdPtvPerson;
       fillKdNzpPerson;
       otk:=1;
       if curr_person^.MESTO_OSN_RABOTY in [82,121] then otk:=0;
       if abs(summaSciPedAdd)>0.01 then
          begin
               zo       := 25;
               summaAdd := summaSciPedAdd;
               payTp    := 0;
               payYear  := currYear;
               payMnth  := nmes;
//             function addToF6(TABNO,zo,payTp,payMnth,payYear:integer;summaAdd:real;needZero:boolean=false;otk:integer=1;kd_ptv:integer=0;kd_nzp:integer=0;w_r:integer=0):pRec6;
               rec6:=addToF6(curr_Person^.TABNO,zo,payTp,payMnth,payYear,summaAdd,false,otk,0,0,2);
               rec6^.w_r:=2;
               if otk=0 then
                  begin
                       rec6^.kdPtv:=kd_ptv;
                       rec6^.kdNzp:=kd_nzp;
                  end;
          end;
       if abs(summaNotSciPedAdd)>0.01 then
          begin
               zo       := 1;
               summaAdd := summaNotSciPedAdd;
               payTp    := 0;
               payYear  := currYear;
               payMnth  := nmes;
//             function addToF6(TABNO,zo,payTp,payMnth,payYear:integer;summaAdd:real;needZero:boolean=false;otk:integer=1;kd_ptv:integer=0;kd_nzp:integer=0;w_r:integer=0):pRec6;
               rec6:=addToF6(curr_Person^.TABNO,zo,payTp,payMnth,payYear,summaAdd,false,otk,0,0,2);
               rec6^.w_r:=2;
               if otk=0 then
                  begin
                       rec6^.kdPtv:=kd_ptv;
                       rec6^.kdNzp:=kd_nzp;
                  end;
          end;
//       nzp:=OTPUSK_BEZ_DAY(1,CURR_PERSON);
  end;
procedure TFormRepF4.fillPochasPerson(curr_person:person_ptr);
  var rec6:pRec6;
      i:integer;
      summaAdd:real;
      summaNotSciPedAdd:real;
      summaSciPedAdd:real;
      payTp:integer;
      zo,payYear,payMnth:integer;
      kd_ptv:integer;
      kd_nzp:integer;
    function getSummaOsnAddForPerson(curr_person:PERSON_PTR):Real;
      var retVal:Real;
          curr_add:ADD_PTR;
      begin
          retVal:=0;
          curr_add:=curr_person.ADD;
          while (curr_add<>nil) do
             begin
                  if (curr_add^.shifr=pochas_shifr) then
                     retVal:=retVal+curr_add^.SUMMA;
                  curr_add:=curr_add.NEXT;
             end;
          getSummaOsnAddForPerson:=retVal;
      end;
    procedure fillSciPerson;
      begin
           summaSciPedAdd:=0;
           if isSciPedForSwod(curr_Person) then
              summaSciPedAdd:=summaAdd;
      end;
    procedure fillNotSciPerson;
      begin
           summaNotSciPedAdd:=0;
           if not isSciPedForSwod(curr_Person) then
              summaNotSciPedAdd:=summaAdd
      end;
    procedure fillKdPtvPerson;
      var retVal:integer;
          i:integer;
      begin
           retVal:=0;
           for i:=1 to 31 do
               if not (curr_person^.TABEL[i] in [0,NEZAPOLN]) then
                  inc(retVal);
               if retVal>LenMonth(encodeDate(currYear,nmes,1)) then
                  retVal:=LenMonth(encodeDate(currYear,nmes,1));

           kd_Ptv:=retVal;
      end;
    procedure fillKdNzpPerson;
      var retVal:integer;
          i:integer;
      begin
           retVal:=0;
           for i:=1 to 31 do
               if not (curr_person^.TABEL[i] in [0,NEZAPOLN]) then
                  inc(retVal);
               if retVal>LenMonth(encodeDate(currYear,nmes,1)) then
                  retVal:=LenMonth(encodeDate(currYear,nmes,1));
           kd_Nzp:=OTPUSK_BEZ_DAY(1,curr_person);
      end;

  begin
       if nsrv in [82,105,106,121] then exit;
       if DOG_POD_PODRAZD(nsrv) then exit;
       summaAdd:=getSummaOsnAddForPerson(curr_person);
       if abs(summaAdd)<0.01 then exit;
       if curr_person^.tabno=55 then
          curr_person^.MALO:=0;
       fillSciPerson;
       fillNotSciPerson;
       fillKdPtvPerson;
       fillKdNzpPerson;
       if abs(summaSciPedAdd)>0.01 then
          begin
               zo       := 25;
               summaAdd := summaSciPedAdd;
               payTp    := 0;
               payYear  := currYear;
               payMnth  := nmes;
               rec6     := addToF6(curr_Person^.TABNO,zo,payTp,payMnth,payYear,summaAdd,false,1,kd_ptv,kd_nzp);
               //rec6^.w_r:=1;
          end;
       if abs(summaNotSciPedAdd)>0.01 then
          begin
               zo       := 1;
               summaAdd := summaNotSciPedAdd;
               payTp    := 0;
               payYear  := currYear;
               payMnth  := nmes;
               rec6     := addToF6(curr_Person^.TABNO,zo,payTp,payMnth,payYear,summaAdd,false,1,kd_ptv,kd_nzp);
               //rec6^.w_r:=1;
          end;
//       nzp:=OTPUSK_BEZ_DAY(1,CURR_PERSON);
  end;

procedure TFormRepF4.fillIllPerson(curr_person:person_ptr);
  var i:integer;
      zo,payTp,payYear,payMnth:integer;
      otk:integer;
      kd_np:integer;
      rec6:pRec6;
    procedure fillIllPerson;
      var curr_add:add_ptr;
          recIll:pRecIll;
          i:integer;
          finded:boolean;
      begin
           kd_np:=ILL_DAY(1,curr_person);
           curr_add:=curr_person^.ADD;
           while (curr_add<>nil) do
             begin
                  if IsBolnShifrForECB(curr_add^.SHIFR) then
                     begin
                          finded:=false;
                          if listIll.Count>0 then
                             for i:=0 to listIll.Count-1 do
                                 begin
                                      if (
                                          (pRecIll(listIll.Items[i]).pay_mnth=curr_add^.PERIOD)
                                          and
                                          (pRecIll(listIll.Items[i]).pay_year=curr_add^.year+1990)) then
                                          begin
                                               pRecIll(listIll.Items[i])^.summa:=pRecIll(listIll.Items[i])^.summa + curr_add^.SUMMA;
                                               finded := true;
                                               break;
                                          end;
                                 end;
                          if not finded then
                             begin
                                  new(recIll);
                                  recIll^.summa    := curr_add^.SUMMA;
                                  recIll^.pay_mnth := curr_Add^.PERIOD;
                                  recIll^.pay_Year := curr_add^.YEAR+1990;
                                  recIll^.kdNp     := kd_np;
                                  listIll.Add(recIll);
                             end;
                     end;
                  curr_add:=curr_add^.NEXT;
             end;

      end;
 begin
       emptyIllOtpLists;
       listIll:=TList.Create;
       fillIllPerson;
       otk:=1;
       if curr_person^.MESTO_OSN_RABOTY in [82,121] then otk:=0;
       if listIll.count>0 then
          for i:=0 to listIll.count-1 do
             if abs(precIll(listIll.Items[i])^.summa)>0.007 then
              begin
                   zo:=29;
                   payTp:=0;
                   payYear:=precIll(listIll.Items[i])^.pay_Year;
                   payMnth:=precIll(listIll.Items[i])^.pay_mnth;
                   rec6:=addToF6(curr_person^.TABNO,zo,payTp,payMnth,payYear,precIll(listIll.Items[i])^.summa,false,otk);

              end;
       emptyIllOtpLists;

 end;
procedure TFormRepF4.fillBolDay;
  var i:integer;
      bolDays,dekrBolDays:integer;
  begin
       if list6.Count>0 then
          for i:=0 to list6.Count-1 do
              // ��������� ���������� 42 - � 43 - ���
              if pRec6(list6.items[i]).zo in [29,36] then
                 begin
                      bolDays:=0;
                      dekrBolDays:=0;
                      bolDays:=getBolDay(pRec6(list6.items[i]).tabno,pRec6(list6.items[i]).payYear,pRec6(list6.items[i]).payMnth);
                      dekrBolDays:=getDekrBolDay(pRec6(list6.items[i]).tabno,pRec6(list6.items[i]).payYear,pRec6(list6.items[i]).payMnth);
                      if (dekrBolDays>0) then
                         begin
                              if pRec6(list6.items[i]).zo=29 then
                                 pRec6(list6.items[i]).zo:=42
                              else
                                 pRec6(list6.items[i]).zo:=43;
                         end;
                      if (bolDays>0) then
                         pRec6(list6.items[i]).kdNp:=bolDays;
                      if (dekrBolDays>0) then
                         pRec6(list6.items[i]).kdVp:=bolDays;
                 end;
  end;
procedure TFormRepF4.fillOtpPerson(curr_person:person_ptr);
  var i:integer;
      zo,payTp,payYear,payMnth:integer;
      otk:integer;
      rec6:pRec6;
    function getZOForOtp:integer;
      var retVal:integer;
      begin
           retVal:=1;
           if isSciPedForSwod(curr_Person) then
              if IS_OSN_WID_RABOTY(curr_Person) then
                 retVal:=25
              else
             if not isSciPedOsnInList(curr_person^.tabno) then
                 retVal:=25;
           getZOForOtp:=retVal;
      end;
    procedure fillOtpPerson;
      var curr_add:add_ptr;
          recIll:pRecIll;
          i:integer;
          finded:boolean;
      begin
           curr_add:=curr_person^.ADD;
           while (curr_add<>nil) do
             begin
                  if IsOtpShifr(curr_add^.SHIFR) then
                     begin
                          finded:=false;
                          if listOtp.Count>0 then
                             for i:=0 to listOtp.Count-1 do
                                 begin
                                      if (
                                          (pRecIll(listOtp.Items[i]).pay_mnth=curr_add^.PERIOD)
                                          and
                                          (pRecIll(listOtp.Items[i]).pay_year=curr_add^.year+1990)) then
                                          begin
                                               pRecIll(listOtp.Items[i])^.summa:=pRecIll(listOtp.Items[i])^.summa + curr_add^.SUMMA;
                                               finded := true;
                                               break;
                                          end;
                                 end;
                          if not finded then
                             begin
                                  new(recIll);
                                  recIll^.summa    := curr_add^.SUMMA;
                                  recIll^.pay_mnth := curr_Add^.PERIOD;
                                  recIll^.pay_Year := curr_add^.YEAR+1990;
                                  recIll^.kdNp     := 0;
                                  listOtp.Add(recIll);
                             end;
                     end;
                  curr_add:=curr_add^.NEXT;
             end;
      end;
 begin
       emptyIllOtpLists;
       listOtp:=TList.Create;
       fillOtpPerson;
       otk:=1;
       if curr_person^.MESTO_OSN_RABOTY in [82,121] then
          otk:=0;
       if listOtp.count>0 then
          for i:=0 to listOtp.count-1 do
             if abs(precIll(listOtp.Items[i])^.summa)>0.007 then
              begin
                   zo:=getZoForOtp;          //????????
                   payTp:=10;
                   payYear:=precIll(listOtp.Items[i])^.pay_Year;
                   payMnth:=precIll(listOtp.Items[i])^.pay_mnth;
                   rec6:=addToF6(curr_person^.TABNO,zo,payTp,payMnth,payYear,precIll(listOtp.Items[i])^.summa,false,otk);
              end;
       emptyIllOtpLists;

 end;
procedure TFormRepF4.fillDPPerson(curr_person:person_ptr);
  var i:integer;
      zo,payTp,payYear,payMnth:integer;
      summaAdd:real;
      summaNotSciPedAdd:real;
      summaSciPedAdd:real;
      shifrDogDetId:integer;
      curr_cn:cn_ptr;
      recCPH:pRecCPH;
      rec6:pRec6;
    function getSummaOsnAddForPerson(curr_person:PERSON_PTR):Real;
      var retVal:Real;
          curr_add:ADD_PTR;
      begin
          retVal:=0;
          curr_add:=curr_person.ADD;
          while (curr_add<>nil) do
             begin
                    if not (IsBolnShifrLera(curr_add^.shifr)
                      or
                      IsOtpShifr(curr_add^.shifr)
                      or
                      (curr_add^.shifr=KASSA_SHIFR)
                      or
                      (curr_add^.shifr=31)  // ��� ������ ����������
                      or
                      (curr_add^.shifr=dekret_shifr)
                      or
                      (curr_add^.shifr=141) // ��� ������ �� ����������
                      ) then
                     retVal:=retVal+curr_add^.SUMMA;
                  curr_add:=curr_add.NEXT;
             end;
          getSummaOsnAddForPerson:=retVal;
      end;
 begin
       if not DOG_POD_PODRAZD(nsrv) then exit;
       if  not curr_person^.MESTO_OSN_RABOTY  in [16,82,121] then exit;
       summaAdd:=getSummaOsnAddForPerson(curr_person);
       if abs(summaAdd)>0.01  then
          begin
               zo       := 26;
               summaAdd := summaAdd;
               payTp    := 0;
               payYear  := currYear;
               payMnth  := nmes;
               rec6:=addToF6(curr_Person^.TABNO,zo,payTp,payMnth,payYear,summaAdd,false,0);
               shifrDogDetId:=GET_IDDOGPODFORSOWM_PERSON(CURR_PERSON);
               if shifrDogDetId > 0 then
                  begin
                       new(recCPH);
                       fillChar(recCPH^,sizeOf(recCPH^),0);
                       recCPH^.tabno:=curr_person^.TABNO;
                       recCPH^.shifrDogDetId:=shifrDogDetId;
                       listCPH.Add(recCPH);
                  end;
          end;

 end;
procedure TFormRepF4.fillPremPerson(curr_person:person_ptr);
  var i:integer;
      zo,payTp,payYear,payMnth:integer;
      summaAdd:real;
      finded:boolean;
      rec6:pRec6;
    function getSummaOsnAddForPerson(curr_person:PERSON_PTR):Real;
      var retVal:Real;
          curr_add:ADD_PTR;
      begin
          retVal:=0;
          curr_add:=curr_person.ADD;
          while (curr_add<>nil) do
             begin
                  retVal:=retVal+curr_add^.SUMMA;
                  curr_add:=curr_add.NEXT;
             end;
          getSummaOsnAddForPerson:=retVal;
      end;
 begin
       if not (nsrv in [11,102]) then exit;
       summaAdd:=getSummaOsnAddForPerson(curr_person);
       if abs(summaAdd)>0.01  then
          begin
               if curr_person^.tabno=55 then
                  curr_person^.MALO:=0;
               finded:=false;
               if list6.count>0 then
                  for i:=0 to list6.Count-1 do
                      if pRec6(list6.Items[i])^.tabno=curr_person^.tabno then
                      if pRec6(list6.Items[i])^.w_r=1 then
                         begin
                              finded:=true;
                              pRec6(list6.Items[i])^.sumTotal:=pRec6(list6.Items[i])^.sumTotal+summaAdd;
                              break;
                         end;
               if not finded then
               if list6.count>0 then
                  for i:=0 to list6.Count-1 do
                      if pRec6(list6.Items[i])^.tabno=curr_person^.tabno then
                         begin
                              finded:=true;
                              pRec6(list6.Items[i])^.sumTotal:=pRec6(list6.Items[i])^.sumTotal+summaAdd;
                              break;
                         end;
               if not finded then
                  begin
                       rec6:=addToF6(curr_Person^.TABNO,zo,0,nmes,currYear,summaAdd);
                       rec6.w_r:=curr_person^.WID_RABOTY;;
                       if curr_person^.MESTO_OSN_RABOTY=82 then
                          rec6.otk:=0;
                  end;
          end;

 end;
procedure TFormRepF4.fillCheckPerson(curr_person:person_ptr);
  var i:integer;
      kd_Nzp:integer;
   procedure addpersonToCheckList;
    var i         : integer;
        finded    : boolean;
        recPerson : PRecPerson;
        curr_Add  : add_ptr;
        recAdd    : pRecAdd;
    begin
         finded:=false;
         if listCheck.count>0 then
            for i:=0 to listCheck.Count-1 do
                if pRecPerson(listCheck.Items[i])^.tabno=curr_person^.TABNO then
                   begin
                        finded    := true;
                        recPerson := pRecPerson(listCheck.Items[i]);
                        break;
                   end;
         if not finded then
            begin
               new(RecPerson);
               fillChar(recPerson^,sizeOf(recPerson),0);
               recPerson^.tabno:=curr_Person^.TABNO;
               recPerson^.addList:=TList.Create;
               listCheck.Add(recPerson);
            end;
         if curr_person^.oklad>0.01 then
            recPerson^.summaKoef:=recPerson^.summaKoef+GET_KOEF_OKLAD_PERSON(curr_person);
         curr_Add:=curr_person^.add;
         while (curr_add<>nil) do
           begin
                 new(RecAdd);
                 recAdd^.shifrSta:=curr_add^.shifr;
                 recAdd^.Summa:=curr_add^.SUMMA;
                 recAdd^.m:=curr_add^.PERIOD;
                 recAdd^.y:=curr_add^.YEAR+1990;
                 recAdd^.shifrPod:=nsrv;
                 recPerson^.addList.Add(recAdd);
                 curr_add:=curr_add^.NEXT;
           end;
         kd_nzp:=OTPUSK_BEZ_DAY(1,curr_person);
         if ((kd_nzp>0) and (recPerson^.kdNzp<1)) then
            recPerson^.kdNzp:=kd_nzp;

    end;
 begin
       addpersonToCheckList;

 end;
procedure TFormRepF4.fillDoplDoMin;
 var tabno:integer;
     summa:real;
     zo,payTp,payYear,payMnth:integer;
     rec6:pRec6;
 procedure fillZOFromRec6;
  var i:integer;

  begin
       zo:=1;
       if list6.Count>0 then
          for i:=0 to list6.Count-1 do
              if pRec6(list6.Items[i]).tabno=tabno then
              if pRec6(list6.Items[i]).zo in [1,2,25,32] then
                 begin
                      zo:=pRec6(list6.Items[i]).zo;
                      break;
                 end;
  end;

 begin
      payTp:=13;
      zo:=1;
      payYear:=currYear;
      payMnth:=NMES;
      dsMinSal.Params[0].Value:=currYear;
      dsMinSal.Params[1].Value:=NMES;
      dsMinSal.Transaction.StartTransaction;
      dsMinSal.Open;
      while not dsMinSal.Eof do
         begin
              tabno := dsMinSalTABNO.Value;
              summa := dsMinSalSUMMA_RAZN.Value;
              fillZOFromRec6;
              rec6:=addToF6(TABNO,zo,payTp,payMnth,payYear,summa);
              dsMinSal.Next;
         end;
      dsMinSal.Close;
      dsMinSal.Transaction.commit;

 end;
procedure TFormRepF4.fillTable5;
 var tabno:integer;
     i,j:integer;
     finded:boolean;
     rec5:pRec5;
     startDt,endDt:integer;
 begin
      fillTable5PrinjatUwolen;
      fillTable5Perevody;
      fillTable5CPH;

 end;
procedure TFormRepF4.fillTable5PrinjatUwolen;
 var tabno:integer;
     i,j:integer;
     finded,finded6:boolean;
     rec5:pRec5;
     startDt,endDt:integer;
     codeUwol:integer;
     datePri:tDateTime;
     dateUw:TDateTime;
     SQLStmnt:string;
     v:variant;
     reasonUwol:string;
     recPerson:pRecPerson;
     rec6:pRec6;
     zo:integer;
 begin
      dsPrinjatUwolen.Params[0].Value:=currYear;
      dsPrinjatUwolen.Params[1].Value:=nmes;
      dsPrinjatUwolen.Params[2].Value:=currYear;
      dsPrinjatUwolen.Params[3].Value:=nmes;
      dsPrinjatUwolen.Transaction.StartTransaction;
      dsPrinjatUwolen.Open;
      while (not dsPrinjatUwolen.Eof) do
        begin
             datePri:=encodedate(1990,1,1);
             dateUw:=encodedate(1990,1,1);
             codeUwol:=0;
             tabno:=dsPrinjatUwolenTABNO.value;
             if not dsPrinjatUwolenDATA_PRI.IsNull then
                datePri:=dsPrinjatUwolenDATA_PRI.value;
             if not dsPrinjatUwolenDATA_UW.IsNull then
                dateUw:=dsPrinjatUwolenDATA_UW.value;
             if not dsPrinjatUwolenCODE_UWOL.IsNull then
                codeUwol:=dsPrinjatUwolenCODE_UWOL.Value;
             startDt:=1;
             endDt:=lenMonth(encodeDate(currYear,nmes,1));
             if ((yearOf(datePri)=currYear) and (monthOf(datePri)=nmes)) then
                startDt:=dayOf(datePri);
             if ((yearOf(dateUw)=currYear) and (monthOf(dateUw)=nmes)) then
                endDt:=dayOf(dateUw);
             reasonUwol:='';
             if codeUwol>0 then
                begin
                     SQLStmnt:='select first 1 coalesce(a.reason,'''') from tb_dismis a where id='+intToStr(codeUwol);
                     v:=SQLQueryValue(SQLStmnt);
                     if VarIsStr(v) then
                        reasonUwol:=trim(ReplQto2Q(v));
                end;
             finded:=false;
             recPerson:=nil;
             if listCheck.Count>0 then
                for i:=0 to listCheck.Count-1 do
                    if pRecPerson(listCheck.Items[i]).tabno=tabno then
                       begin
                            recPerson:=pRecPerson(listCheck.Items[i]);
                            finded:=true;
                            break;
                       end;
             finded6:=false;
             rec6:=nil;
                // ������� ZO
                // 1 � ������� ���������� � �������� �������;
                // 2 � ������� ���������� (��� ������� ������);
                // 3 � �����, �� ��������� ������ �� ���������� �������-��������� ���������;
                // 4 � �����, ���� ������ �������� �� ������� �� ������� �� ��������� ��� �� ���������� ��� ����������� ���;
                // 5 � �����, ���� ������ �������� �� �������� � �������;
                // 6 � �����, ���� ������ �������� �� ������� �� ������� �� ���������� ��� ��������� ���.
             zo:=1;   //������� ������ �� ��������
             if list6.Count>0 then
                for i:=0 to list6.Count-1 do
                    if pRec6(list6.Items[i]).tabno=tabno then
                    if pRec6(list6.Items[i]).zo in [1,2,25,26,32] then
                       begin
                            rec6:=pRec6(list6.Items[i]);
                            finded6:=true;
                            break;
                       end;
             if recPerson<>nil then
                begin
                     reasonUwol:=trim(copy(reasonUwol+space(250),1,250));
                     new(rec5);
                     fillChar(rec5^,sizeOf(rec5^),0);
                     rec5.YEARVY:=currYear;
                     rec5.monthVy:=nmes;
                     rec5.tabno:=tabno;
                     rec5.PERIODM:=rec5.monthVy;
                     rec5.PERIODY:=rec5.yearVy;
                     if finded6 then
                        rec5.UKRGROMAD:=rec6.ukrGromad
                     else
                        rec5.UKRGROMAD:=1;
                     rec5.NUMIDENT:=trim(recPerson.numIdent);
                     rec5.FIO:=trim(recPerson.fio);
                     rec5.NM:=trim(recPerson.nm);
                     rec5.FTN:=trim(recPerson.ftn);
                     rec5.START_DT:=startDt;
                     rec5.END_DT:=endDt;
                     rec5.ZO:=zo;
                     rec5.PID_ZV:=reasonUwol;
                     list5.Add(rec5);
                end;
             dsPrinjatUwolen.Next;
        end;
      dsPrinjatUwolen.Close;
      dsPrinjatUwolen.Transaction.commit;
 end;
procedure TFormRepF4.fillTable5Perevody;
 var tabno:integer;
     i,j:integer;
     finded,finded6:boolean;
     rec5:pRec5;
     startDt,endDt:integer;
     codeUwol:integer;
     datePri:tDateTime;
     dateUw:TDateTime;
     SQLStmnt:string;
     v:variant;
     reasonUwol:string;
     recPerson:pRecPerson;
     rec6:pRec6;
     zo:integer;
     nomerprik:string;
     dataprik:TDateTime;
     idclassificator:integer;
     kodkp : string;
     kodzkpptr : string;
     namedol : string;
     nameprof : string;
     pid:string;
     vzv:string;

 begin
      dsPerevody.Params[0].Value:=currYear;
      dsPerevody.Params[1].Value:=nmes;
      dsPerevody.Transaction.StartTransaction;
      dsPerevody.Open;
      while (not dsPerevody.Eof) do
        begin
             tabno:=dsPerevodyTABNO.value;
             if dsPerevodyDATA_PRI.IsNull then
                datePri:=encodedate(1990,1,1)
             else
                datePri:=dsPerevodyDATA_PRI.value;
             if dsPerevodyDATA_UW.IsNull then
                dateUw:=encodedate(1990,1,1)
             else
                dateUw:=dsPerevodyDATA_UW.value;
             if dsPerevodyCODE_UWOL.IsNull then
                codeUwol:=0
             else
                codeUwol:=dsPerevodyCODE_UWOL.Value;
             if dsPerevodyNOMERPRIK.IsNull then
                nomerprik:=''
             else
                nomerprik:=dsPerevodyNOMERPRIK.Value;
             if dsPerevodyDATAPRIK.IsNull then
                dataprik:=encodedate(1990,1,1)
             else
                dataprik:=dsPerevodyDATAPRIK.Value;
             if dsPerevodyIDCLASSIFICATOR.IsNull then
                idclassificator:=0
             else
                idclassificator:=dsPerevodyIDCLASSIFICATOR.value;
             if dsPerevodyKODKP.isNull then
                kodKp:=''
             else
                kodkp:=dsPerevodyKODKP.Value;
             if dsPerevodyKODZKPPTR.isNull then
                kodzkpptr:=''
             else
                kodzkpptr:=dsPerevodyKODZKPPTR.Value;
             if dsPerevodyNAMEDOL.isNull then
                nameDol:=''
             else
                nameDol:=dsPerevodyNAMEDOL.Value;
             if dsPerevodyNAMEPROF.isNull then
                nameProf:=''
             else
                nameprof:=dsPerevodyNAMEPROF.Value;
             startDt:=0;
             endDt:=0;
//             if ((yearOf(datePri)=currYear) and (monthOf(datePri)=nmes)) then
//                startDt:=dayOf(datePri);
//             if ((yearOf(dateUw)=currYear) and (monthOf(dateUw)=nmes)) then
//                endDt:=dayOf(dateUw);
//             reasonUwol:='';
             if codeUwol>0 then
                begin
                     SQLStmnt:='select first 1 coalesce(a.reason,'''') from tb_dismis a where id='+intToStr(codeUwol);
                     v:=SQLQueryValue(SQLStmnt);
                     if VarIsStr(v) then
                        reasonUwol:=trim(ReplQto2Q(v));
                end;
             pid:='';
             if ((yearOf(dataprik)>2017)
                and
                (length(trim(nomerprik))>0)) then
                begin
                    pid:='������ '+trim(nomerprik)+' �� ';
                    if (dayOf(dataPrik)<10) then
                       pid:=pid+'0';
                    pid:=pid+intToStr(dayOf(dataPrik))+'.';
                    if (monthOf(dataPrik)<10) then
                       pid:=pid+'0';
                    pid:=pid+intToStr(monthOf(dataPrik))+'.';
                    pid:=pid+intToStr(yearOf(dataprik));
                end;
             finded:=false;
             recPerson:=nil;
             if listCheck.Count>0 then
                for i:=0 to listCheck.Count-1 do
                    if pRecPerson(listCheck.Items[i]).tabno=tabno then
                       begin
                            recPerson:=pRecPerson(listCheck.Items[i]);
                            finded:=true;
                            break;
                       end;
             finded6:=false;
             rec6:=nil;
             zo:=1;       //������� ������ �� �����������
             if list6.Count>0 then
                for i:=0 to list6.Count-1 do
                    if pRec6(list6.Items[i]).tabno=tabno then
                    if pRec6(list6.Items[i]).zo in [1,2,25,26,32] then
                       begin
   //                         zo:=pRec6(list6.Items[i]).zo;
                            rec6:=pRec6(list6.Items[i]);
                            finded6:=true;
                            break;
                       end;
             if recPerson<>nil then
                begin
                     pid      := trim(copy(pid+space(250),1,250));
                     nameDol  := trim(copy(nameDol+space(250),1,250));
                     nameProf := trim(copy(nameProf+space(250),1,250));
                     kodzkpptr:= trim(copy(kodzkpptr+space(5),1,5));
                     kodkp    := trim(copy(kodkp+space(6),1,6));
                     vzv      := '';
                     pid:=trim(copy(pid+space(250),1,250));
                     new(rec5);
                     fillChar(rec5^,sizeOf(rec5^),0);
                     rec5.YEARVY:=currYear;
                     rec5.monthVy:=nmes;
                     rec5.tabno:=tabno;
                     rec5.PERIODM:=rec5.monthVy;
                     rec5.PERIODY:=rec5.yearVy;
                     rec5.UKRGROMAD:=rec6.ukrGromad;
                     rec5.NUMIDENT:=trim(recPerson.numIdent);
                     rec5.FIO:=trim(recPerson.fio);
                     rec5.NM:=trim(recPerson.nm);
                     rec5.FTN:=trim(recPerson.ftn);
                     rec5.START_DT:=startDt;
                     rec5.END_DT:=endDt;
                     rec5.ZO:=zo;
                     rec5.PID_ZV:=reasonUwol;
                     rec5.PNR:=trim(ReplQto2Q(nameprof));
                     rec5.ZKPP:=trim(ReplQto2Q(kodzkpptr));
                     rec5.prof:=trim(ReplQto2Q(kodkp));
                     rec5.POS:=trim(ReplQto2Q(namedol));
                     rec5.PID:=trim(pid);
                     rec5.VZV:=trim(vzv);
                     list5.Add(rec5);
                end;
             dsPerevody.Next;
        end;
      dsPerevody.Close;
      dsPerevody.Transaction.commit;
 end;
procedure TFormRepF4.fillTable5CPH;
 var tabno:integer;
     i,j:integer;
     finded,finded6:boolean;
     rec5:pRec5;
     startDt,endDt:integer;
     recCPH:pRecCPH;
     shifrDogDetId:integer;
     SQLStmnt:string;
     v,e:variant;
     dateFr,dateTo:TDateTime;
     code_uwol:integer;
     nomerDogGN,reasonOk:string;
     rec6:pRec6;
     recPerson:pRecPerson;
     zo:integer;
 begin
     if listCPH.count<1 then exit;
     for i:=0 to listCPH.Count-1 do
         begin
              shifrDogDetId:=pRecCPH(listCPH.items[i]).shifrDogDetId;
              tabno:=pRecCPH(listCPH.items[i]).tabno;
              SQLStmnt := 'select tb_dogovora_gn_det.datefr';
              SQLStmnt := trim(SQLStmnt) + ', tb_dogovora_gn_det.dateto';
              SQLStmnt := trim(SQLStmnt) + ', kadry.code_uwol';
              SQLStmnt := trim(SQLStmnt) + ', tb_dogovora_gn.nomer';
              SQLStmnt := trim(SQLStmnt) + ', tb_dogovora_gn_det.reasonok';
              SQLStmnt := trim(SQLStmnt) + ' from kadry';
              SQLStmnt := trim(SQLStmnt) + ' join person on person.tabno=kadry.tabno';
              SQLStmnt := trim(SQLStmnt) + ' join fcn on fcn.shifridperson=person.shifrid';
              SQLStmnt := trim(SQLStmnt) + ' join tb_dogovora_gn_det on tb_dogovora_gn_det.id='+intToStr(shifrDogDetId);
              SQLStmnt := trim(SQLStmnt) + ' join tb_dogovora_gn on tb_dogovora_gn.id=tb_dogovora_gn_det.iddog';
              SQLStmnt := trim(SQLStmnt) + ' where (person.yearvy='+intToStr(currYear)+' and person.monthvy='+intToStr(nmes)+')';
              v:=SQLQueryRecValues(SQLStmnt);
              if VarIsNull(v)      then continue;
              if VarIsEmpty(v)     then continue;
              if not VarIsArray(v) then continue;
              e:=v[0];
              if not (VarIsNull(e) or VarIsEmpty(e)) then
                 dateFr := e;
              e:=v[1];
              if not (VarIsNull(e) or VarIsEmpty(e)) then
                 dateTo := e;
              e:=v[2];
              if not (VarIsNull(e) or VarIsEmpty(e)) then
                 code_uwol := e;
              e:=v[3];
              if not (VarIsNull(e) or VarIsEmpty(e)) then
                 nomerDogGN := e;
              e:=v[4];
              if not (VarIsNull(e) or VarIsEmpty(e)) then
                 reasonOk := e;
              reasonOk:=trim(copy(reasonOk+space(250),1,250));
              if ((yearOf(DateFr)<2017) or  (yearOf(DateFr)<2030)) then
                  dateFr:=encodeDate(1990,1,1,);
              if ((yearOf(DateTo)<2017) or  (yearOf(DateTo)<2030)) then
                  dateTo:=encodeDate(1990,1,1,);
              startdt:=1;
              enddt:=lenMonth(enCodeDate(currYear,nmes,1));
              if ((yearOf(DateFr)=currYear) and (monthOf(dateFr)=nmes)) then
                 startDt:=dayOf(DateFr);
              if ((yearOf(DateTo)=currYear) and (monthOf(dateTo)=nmes)) then
                 endDt:=dayOf(DateTo);
             finded:=false;
             recPerson:=nil;
             if listCheck.Count>0 then
                for j:=0 to listCheck.Count-1 do
                    if pRecPerson(listCheck.Items[j]).tabno=tabno then
                       begin
                            recPerson:=pRecPerson(listCheck.Items[j]);
                            finded:=true;
                            break;
                       end;
             finded6:=false;
             rec6:=nil;
             zo:=2; // �-� 3?
             if list6.Count>0 then
                for j:=0 to list6.Count-1 do
                    if pRec6(list6.Items[j]).tabno=tabno then
                    if pRec6(list6.Items[j]).zo in [1,2,25,26,32] then
                       begin
                            rec6:=pRec6(list6.Items[j]);
                            finded6:=true;
                            break;
                       end;
             if recPerson<>nil then
                begin
//                     pid      := trim(copy(pid+space(250),1,250));
//                     nameDol  := trim(copy(nameDol+space(250),1,250));
//                     nameProf := trim(copy(nameProf+space(250),1,250));
//                     kodzkpptr:= trim(copy(kodzkpptr+space(5),1,5));
//                     kodkp    := trim(copy(kodkp+space(6),1,6));
//                     vzv      := '';
                     reasonOk:=trim(copy(reasonOk+space(250),1,250));
                     new(rec5);
                     fillChar(rec5^,sizeOf(rec5^),0);
                     rec5.YEARVY    := currYear;
                     rec5.monthVy   := nmes;
                     rec5.tabno     := tabno;
                     rec5.PERIODM   := rec5.monthVy;
                     rec5.PERIODY   := rec5.yearVy;
                     if finded6  then
                        rec5.UKRGROMAD := rec6.ukrGromad
                     else
                        rec5.UKRGROMAD := 1;
                     rec5.NUMIDENT := trim(recPerson.numIdent);
                     rec5.FIO      := trim(recPerson.fio);
                     rec5.NM       := trim(recPerson.nm);
                     rec5.FTN      := trim(recPerson.ftn);
                     rec5.START_DT := startDt;
                     rec5.END_DT   := endDt;
                     rec5.ZO:=zo;
                     rec5.DOG_CPH:=1;
                     rec5.PID_ZV:=trim(ReplQto2Q(reasonOk));
                     list5.Add(rec5);

                end;

         end;

 end;

procedure TFormRepF4.fillTable5Dekr;
 var tabno:integer;
     i,j:integer;
     finded,finded6:boolean;
     rec5:pRec5;
     startDt,endDt:integer;
     modeIll:integer;
     F_Data:tDateTime;
     L_Data:TDateTime;
     SQLStmnt:string;
     v:variant;
     reasonUwol:string;
     recPerson:pRecPerson;
     rec6:pRec6;
     zo:integer;
     nomerprik:string;
     dataprik:TDateTime;
     idclassificator:integer;
     kodkp     : string;
     kodzkpptr : string;
     namedol   : string;
     nameprof  : string;
     pid:string;
     vzv:string;
     date1, date2 : string;
     lm:integer;
 begin
      lm:=lenMonth(encodedate(curryear,nmes,1));
      date1:=intToStr(currYear)+'-'+intToStr(nmes)+'-01';
      date2:=intToStr(currYear)+'-'+intToStr(nmes)+'-'+intToStr(lm);
      dsDekr.Params[0].Value:=date2;
      dsDekr.Params[1].Value:=date1;
      dsDekr.Transaction.StartTransaction;
      dsDekr.Open;
      while (not dsDekr.Eof) do
        begin
             tabno:=dsDekrTABNO.value;
             if dsDekrF_DATA.IsNull then
                F_DATA:=encodedate(1990,1,1)
             else
                F_Data:=dsDekrF_DATA.value;
             if dsDekrL_DATA.IsNull then
                L_Data:=encodedate(1990,1,1)
             else
                L_Data:=dsDekrL_DATA.value;
             if dsDekrMODEILL.IsNull then
                modeIll:=0
             else
                modeIll:=dsDekrMODEILL.Value;
             idclassificator:=0;
             kodkp:='';
             kodzkpptr :='';
             namedol:='';
             pid:='';
             vzv:='';
             nameProf:='';
             startDt:=0;
             endDt:=0;
             pid:='';
             if ((yearOf(F_Data)=currYear)
                 and (monthOf(F_Data)=nmes)) then
                startdt:=dayOf(F_Data);
             if ((yearOf(L_Data)=currYear)
                 and (monthOf(L_Data)=nmes)) then
                enddt:=monthOf(L_Data);
             if (StartDt>0) then
                ZO:=5
             else
             if (EndDt>0) then
                ZO:=6;
             if not ((StartDt>0) or (enddt>0))  then
                begin
                     dsDekr.next;
                     continue;
                end;

             finded:=false;
             recPerson:=nil;
             if listCheck.Count>0 then
                for i:=0 to listCheck.Count-1 do
                    if pRecPerson(listCheck.Items[i]).tabno=tabno then
                       begin
                            recPerson:=pRecPerson(listCheck.Items[i]);
                            finded:=true;
                            break;
                       end;
             finded6:=false;
             rec6:=nil;
             zo:=1;       //������� ������ �� ����������
             if list6.Count>0 then
                for i:=0 to list6.Count-1 do
                    if pRec6(list6.Items[i]).tabno=tabno then
                    if pRec6(list6.Items[i]).zo in [1,2,25,26,32] then
                       begin
   //                         zo:=pRec6(list6.Items[i]).zo;
                            rec6:=pRec6(list6.Items[i]);
                            finded6:=true;
                            break;
                       end;
             if recPerson<>nil then
                begin
//                     pid      := trim(copy(pid+space(250),1,250));
//                     nameDol  := trim(copy(nameDol+space(250),1,250));
//                     nameProf := trim(copy(nameProf+space(250),1,250));
//                     kodzkpptr:= trim(copy(kodzkpptr+space(5),1,5));
//                     kodkp    := trim(copy(kodkp+space(6),1,6));
//                     vzv      := '';
//                     pid:=trim(copy(pid+space(250),1,250));
                     new(rec5);
                     fillChar(rec5^,sizeOf(rec5^),0);
                     rec5.YEARVY:=currYear;
                     rec5.monthVy:=nmes;
                     rec5.tabno:=tabno;
                     rec5.PERIODM:=rec5.monthVy;
                     rec5.PERIODY:=rec5.yearVy;
                     rec5.UKRGROMAD:=rec6.ukrGromad;
                     rec5.NUMIDENT:=trim(recPerson.numIdent);
                     rec5.FIO:=trim(recPerson.fio);
                     rec5.NM:=trim(recPerson.nm);
                     rec5.FTN:=trim(recPerson.ftn);
                     rec5.START_DT:=startDt;
                     rec5.END_DT:=endDt;
                     rec5.ZO:=zo;
                     rec5.PID_ZV:=reasonUwol;
                     rec5.PNR:=trim(ReplQto2Q(nameprof));
                     rec5.ZKPP:=trim(ReplQto2Q(kodzkpptr));
                     rec5.prof:=trim(ReplQto2Q(kodkp));
                     rec5.POS:=trim(ReplQto2Q(namedol));
                     rec5.PID:=trim(pid);
                     rec5.VZV:=trim(vzv);
                     list5.Add(rec5);
                end;
             dsDekr.Next;
        end;
      dsDekr.Close;
      dsDekr.Transaction.commit;
 end;


procedure TFormRepF4.fillTable7;
 var tabno:integer;
     i,j:integer;
     finded:boolean;
     rec7:pRec7;
     startDt,endDt:integer;

 begin
      if list6.Count<1 then exit;
      for i:=0 to list6.Count-1 do
          begin
               if pRec6(list6.Items[i]).exp<>1 then continue;
               finded:=false;
               if list7.count>0 then
                  for j:=0 to list7.Count-1 do
                      if pRec7(list7.Items[j]).tabno=pRec6(list6.Items[i]).tabno then
                         begin
                              finded:=true;
                              break;
                         end;
               if Finded then continue;
               startDt:=1;
               endDt:=LenMonth(encodeDate(currYear,nmes,1));
               if listCheck.count>0 then
                  for j:=0 to listCheck.Count-1 do
                      if pRecPerson(listCheck.Items[j]).tabno=pRec6(list6.Items[i]).tabno then
                         begin
                              startDt:=pRecPerson(listCheck.Items[j]).start_d;
                              endDt:=pRecPerson(listCheck.Items[j]).end_d;
                              break;
                         end;
               new(rec7);
               fillChar(rec7^,sizeOf(rec7^),0);
               rec7.yearVy:=currYear;
               rec7.monthVy:=nmes;
               rec7.tabno:=pRec6(list6.Items[i]).tabno;
               rec7.PERIODM:=rec7.monthVy;
               rec7.PERIODY:=rec7.yearVy;
               rec7.UKRGROMAD:=pRec6(list6.Items[i]).ukrGromad;
               rec7.NUMIDENT:=trim(pRec6(list6.Items[i]).numIdent);
               rec7.FIO:=trim(pRec6(list6.Items[i]).fio);
               rec7.NM:=trim(pRec6(list6.Items[i]).nm);
               rec7.FTN:=trim(pRec6(list6.Items[i]).ftn);
               rec7.C_PID:='���024�1';
               rec7.START_DT:=startDt;
               rec7.END_DT:=endDt;
               rec7.DAYS:=endDt-startDt+1;
               rec7.NORMA:=rec7.DAYS;
               rec7.SEAZON:=1;
               list7.Add(rec7);
//               rec7.NUM_NAK:=1;
          end;

 end;

 procedure TFormRepF4.emptyIllOtpLists;
 var i:integer;
  begin
       if listIll<>Nil then
           begin
                if listIll.count>0 then
                   for i:=0 to listIll.Count-1 do
                       dispose(pRecIll(listIll.Items[i]));
                listIll.Free;
                listIll:=nil;
           end;
       if listOtp<>Nil then
          begin
               if listOtp.count>0 then
                  for i:=0 to listOtp.Count-1 do
                      dispose(pRecIll(listOtp.Items[i]));
               listOtp.Free;
               listOtp:=nil;
          end;
  end;


 function TFormRepF4.isSciPedOsnInList(tabno:integer):boolean;
  var finded:boolean;
      i:integer;
  begin
       finded:=false;
       if list6.Count>0 then
          for i:=0 to list6.Count-1 do
              if pRec6(list6.Items[i])^.tabno=tabno then
              if pRec6(list6.Items[i])^.zo in [25,32] then
                 begin
                      finded:=true;
                      break;
                 end;
       isSciPedOsnInList:=finded;
  end;
 function TFormRepF4.getPreviousNalCode(tabno:integer):string;
   var retVal:string;
       finded:boolean;
       i:integer;
   begin
       retVal:='';
       finded:=false;
       if list6.Count>0 then
          for i:=0 to list6.Count-1 do
              if pRec6(list6.Items[i])^.tabno=tabno then
              if length(trim(pRec6(list6.Items[i])^.numIdent))=10 then
                 begin
                      finded:=true;
                      retVal:=trim(pRec6(list6.Items[i])^.numIdent);
                      break;
                 end;
       getPreviousNalCode:=retVal;
   end;
procedure TFormRepF4.fillFullList6Recs;
  var i:integer;
      nalCode:string;
      fio,fam,nam,otc:shortString;
      st:integer;
      otk:integer;
      nzp:integer;
      kdptv:integer;
      kdvp:integer;
      nrc:integer;
      sumNarah:real;
      kdPv:integer;

  begin
       if list6.count<1 then exit;
       for i:=0 to list6.Count-1 do
           begin
                nalCode:=GetNal_CodePerson(pRec6(list6.items[i])^.tabno);
                nalCode:=trim(nalCode);
                if length(nalCode)<>10 then
                   begin
                        nalCode:=getPreviousNalCode(pRec6(list6.items[i])^.tabno);
                        nalCode:=trim(nalCode);
                        if length(nalCode)<>10 then
                           begin
                                inc(shifrBk);
                                nalCode:='����00000'+intToStr(shifrBk);
                           end;
                   end;
                st:=getPolForF6(nalCode);
                fio:=GetFullUkrFioPerson(pRec6(list6.items[i])^.tabno);
                SplitFIO(fio,fam,nam,otc);
                pRec6(list6.items[i])^.numIdent:=nalCode;
                pRec6(list6.items[i])^.fio := fam;
                pRec6(list6.items[i])^.nm  := nam;
                pRec6(list6.items[i])^.ftn := otc;
                pRec6(list6.items[i])^.st  := st;
                pRec6(list6.items[i])^.ukrGromad:=1;
                pRec6(list6.items[i])^.sumMax:=pRec6(list6.items[i])^.sumTotal;
//                pRec6(list6.items[i])^.otk := 1;
//                pRec6(list6.items[i])^.exp := 0; ////
                pRec6(list6.items[i])^.kdnp := 0; ///
                pRec6(list6.items[i])^.kdnzp := 0; ///
                pRec6(list6.items[i])^.kdptv := LenMonth(encodedate(currYear,nmes,1));
                pRec6(list6.items[i])^.kdvp := 0; ///;
                pRec6(list6.items[i])^.nrc := 0; ///;
                pRec6(list6.items[i])^.sumNarah := 0; ///;
                pRec6(list6.items[i])^.sumDiff := 0; ///;
           end;
  end;
procedure TFormRepF4.fillFullList6RecsFromCheckList;
  var i,j:integer;
      nalCode:string;
      fio,fam,nam,otc:shortString;
      st:integer;
      otk:integer;
      nzp:integer;
      kdptv:integer;
      kdvp:integer;
      nrc:integer;
      sumNarah:real;
      kdPv:integer;
      recPerson:pRecPerson;
      finded:boolean;
      summa:real;
  begin
       if list6.count<1 then exit;
       for i:=0 to list6.Count-1 do
           begin
                finded:=false;
                recPerson:=nil;
                if listCheck.count>0 then
                   for j:=0 to listCheck.count-1 do
                       if pRecPerson(listCheck.Items[j]).tabno=pRec6(list6.Items[i]).tabno then
                          begin
                               recPerson:=pRecPerson(listCheck.Items[j]);
                               finded:=true;
                               break;
                          end;
                if not finded then continue;

                nalCode:=recPerson^.numIdent;
                st:=getPolForF6(nalCode);
                fio:=GetFullUkrFioPerson(pRec6(list6.items[i])^.tabno);
                SplitFIO(fio,fam,nam,otc);
                pRec6(list6.items[i])^.numIdent:=recPerson^.numIdent;
                pRec6(list6.items[i])^.fio := recPerson^.fio;
                pRec6(list6.items[i])^.nm  := recPerson^.nm;
                pRec6(list6.items[i])^.ftn := recPerson^.ftn;
                pRec6(list6.items[i])^.st  := recPerson^.st;
                pRec6(list6.items[i])^.ukrGromad:=1;
                pRec6(list6.items[i])^.sumMax:=pRec6(list6.items[i])^.sumTotal;
//                pRec6(list6.items[i])^.otk := recPerson^.otk;
//                pRec6(list6.items[i])^.exp := 0; ////
                if (pRec6(list6.items[i])^.zo in [1,2,25,32]) then // ��������
                   if not pRec6(list6.items[i])^.payTp in [10,13] then // �� ���������
                      if ((pRec6(list6.items[i])^.payYear=currYear) and (pRec6(list6.items[i])^.payMnth=nmes)) then
                         begin
                              pRec6(list6.items[i])^.kdptv := recPerson.kdPtv;
                              pRec6(list6.items[i])^.kdnzp := recPerson.kdNzp; ///
                         end;
                pRec6(list6.items[i])^.nrc := 0; ///;
//                pRec6(list6.items[i])^.sumNarah := 0; ///;
//                pRec6(list6.items[i])^.sumDiff := 0; ///;
                sumNarah:=0;
                summa:=pRec6(list6.items[i])^.sumTotal;
                if (pRec6(list6.items[i])^.payTp<>13) then
                   if pRec6(list6.items[i])^.zo in [2,32] then
                      sumNarah:=r10(summa*8.41 / 100.0)
                   else
                      sumNarah:=r10(summa*22.00 / 100.0)
                else
                   begin
                        summa:=pRec6(list6.items[i])^.sumDiff;
                        if pRec6(list6.items[i])^.zo in [2,32] then
                           sumNarah:=r10(summa*8.41 / 100.0)
                        else
                           sumNarah:=r10(summa*22.00 / 100.0);
                   end;
                pRec6(list6.items[i])^.sumNarah:=sumNarah;
                if pRec6(list6.items[i])^.w_r=2 then
                if pRec6(list6.items[i])^.zo in [1,2] then
                   pRec6(list6.items[i])^.nrc:=1;
           end;
  end;
procedure TFormRepF4.moveToBD;
 var SqlStmnt:wideString;
     i:integer;
 begin
     formWait.Show;
     Application.ProcessMessages;
     sqlStmnt:='delete from tb_e04t05c where yearvy='+intToStr(currYear)+' and monthvy='+intToStr(nmes);
     SQLExecute(SQLStmnt);
     sqlStmnt:='delete from tb_e04t06c where yearvy='+intToStr(currYear)+' and monthvy='+intToStr(nmes);
     SQLExecute(SQLStmnt);
     sqlStmnt:='delete from tb_e04t07c where yearvy='+intToStr(currYear)+' and monthvy='+intToStr(nmes);
     SQLExecute(SQLStmnt);
     if ((list5.Count<1) and (list6.Count<1) and (list7.Count<1)) then
        begin
             formWait.hide;
             Application.ProcessMessages;
             exit;
        end;
     if list5.Count>0 then
     for i:=0 to list5.Count-1 do
         begin
              SQLStmnt:='insert into tb_e04t05c (';
//              SQLStmnt:= SHIFRID     INTEGER NOT NULL,
              SQLStmnt:=trim(SQLStmnt)+'YEARVY,';
              SQLStmnt:=trim(SQLStmnt)+'MONTHVY,';
              SQLStmnt:=trim(SQLStmnt)+'TABNO,';
              SQLStmnt:=trim(SQLStmnt)+'PERIOD_M,';
              SQLStmnt:=trim(SQLStmnt)+'PERIOD_Y,';
              SQLStmnt:=trim(SQLStmnt)+'ROWNUM,';
              SQLStmnt:=trim(SQLStmnt)+'UKR_GROMAD,';
              SQLStmnt:=trim(SQLStmnt)+'NUMIDENT,';
              SQLStmnt:=trim(SQLStmnt)+'FIO,';
              SQLStmnt:=trim(SQLStmnt)+'NM,';
              SQLStmnt:=trim(SQLStmnt)+'FTN,';
              SQLStmnt:=trim(SQLStmnt)+'START_DT,';
              SQLStmnt:=trim(SQLStmnt)+'END_DT,';
              SQLStmnt:=trim(SQLStmnt)+'ZO,';
              SQLStmnt:=trim(SQLStmnt)+'PID_ZV,';
              SQLStmnt:=trim(SQLStmnt)+'NRM_DT,';
              SQLStmnt:=trim(SQLStmnt)+'DOG_CPH,';
              SQLStmnt:=trim(SQLStmnt)+'PNR,';
              SQLStmnt:=trim(SQLStmnt)+'ZKPP,';
              SQLStmnt:=trim(SQLStmnt)+'PROF,';
              SQLStmnt:=trim(SQLStmnt)+'POS,';
              SQLStmnt:=trim(SQLStmnt)+'PID,';
              SQLStmnt:=trim(SQLStmnt)+'VZV';
              SQLStmnt:=trim(SQLStmnt)+') VALUES(';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec5(list5.Items[i])^.yearVy)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec5(list5.Items[i])^.monthVy)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec5(list5.Items[i])^.tabno)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec5(list5.Items[i])^.periodM)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec5(list5.Items[i])^.periodY)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec5(list5.Items[i])^.rowNum)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec5(list5.Items[i])^.ukrGromad)+',';
              SQLStmnt:=trim(SQLStmnt)+''''+trim(pRec5(list5.Items[i])^.numIdent)+''',';
              SQLStmnt:=trim(SQLStmnt)+''''+AnsiUpperCase(trim(ReplQto2Q(pRec5(list5.Items[i])^.fio)))+''',';
              SQLStmnt:=trim(SQLStmnt)+''''+AnsiUpperCase(trim(ReplQto2Q(pRec5(list5.Items[i])^.nm)))+''',';
              SQLStmnt:=trim(SQLStmnt)+''''+AnsiUpperCase(trim(ReplQto2Q(pRec5(list5.Items[i])^.ftn)))+''',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec5(list5.Items[i])^.start_dt)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec5(list5.Items[i])^.end_dt)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec5(list5.Items[i])^.zo)+',';
              SQLStmnt:=trim(SQLStmnt)+''''+trim(pRec5(list5.Items[i])^.PID_ZV)+''',';
              SQLStmnt:=trim(SQLStmnt)+'''1990-01-01'',';   //NRM_DT
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec5(list5.Items[i])^.DOG_CPH)+',';
              SQLStmnt:=trim(SQLStmnt)+''''+trim(pRec5(list5.Items[i])^.PNR)+''',';
              SQLStmnt:=trim(SQLStmnt)+''''+trim(pRec5(list5.Items[i])^.ZKPP)+''',';
              SQLStmnt:=trim(SQLStmnt)+''''+trim(pRec5(list5.Items[i])^.PROF)+''',';
              SQLStmnt:=trim(SQLStmnt)+''''+trim(pRec5(list5.Items[i])^.POS)+''',';
              SQLStmnt:=trim(SQLStmnt)+''''+trim(pRec5(list5.Items[i])^.PID)+''',';
              SQLStmnt:=trim(SQLStmnt)+''''+trim(pRec5(list5.Items[i])^.VZV)+'''';
              SQLStmnt:=trim(SQLStmnt)+')';

              SQLExecute(SQLStmnt);

         end;
     if list6.Count>0 then
     for i:=0 to list6.Count-1 do
         begin
              SQLStmnt:='insert into tb_e04t06c (';
//              SQLStmnt:= SHIFRID     INTEGER NOT NULL,
              SQLStmnt:=trim(SQLStmnt)+'YEARVY,';
              SQLStmnt:=trim(SQLStmnt)+'MONTHVY,';
              SQLStmnt:=trim(SQLStmnt)+'TABNO,';
              SQLStmnt:=trim(SQLStmnt)+'PERIOD_M,';
              SQLStmnt:=trim(SQLStmnt)+'PERIOD_Y,';
              SQLStmnt:=trim(SQLStmnt)+'ROWNUM,';
              SQLStmnt:=trim(SQLStmnt)+'UKR_GROMAD,';
              SQLStmnt:=trim(SQLStmnt)+'ST,';
              SQLStmnt:=trim(SQLStmnt)+'NUMIDENT,';
              SQLStmnt:=trim(SQLStmnt)+'FIO,';
              SQLStmnt:=trim(SQLStmnt)+'NM,';
              SQLStmnt:=trim(SQLStmnt)+'FTN,';
              SQLStmnt:=trim(SQLStmnt)+'ZO,';
              SQLStmnt:=trim(SQLStmnt)+'PAY_TP,';
              SQLStmnt:=trim(SQLStmnt)+'PAY_MNTH,';
              SQLStmnt:=trim(SQLStmnt)+'PAY_YEAR,';
              SQLStmnt:=trim(SQLStmnt)+'SUM_TOTAL,';
              SQLStmnt:=trim(SQLStmnt)+'SUM_MAX,';
              SQLStmnt:=trim(SQLStmnt)+'SUM_INS,';
              SQLStmnt:=trim(SQLStmnt)+'OTK,';
              SQLStmnt:=trim(SQLStmnt)+'EXP,';
              SQLStmnt:=trim(SQLStmnt)+'LINENO,';
              SQLStmnt:=trim(SQLStmnt)+'KD_NP,';
              SQLStmnt:=trim(SQLStmnt)+'KD_NZP,';
              SQLStmnt:=trim(SQLStmnt)+'KD_PTV,';
              SQLStmnt:=trim(SQLStmnt)+'NRM,';
              SQLStmnt:=trim(SQLStmnt)+'KD_VP,';
              SQLStmnt:=trim(SQLStmnt)+'SUM_DIFF,';
              SQLStmnt:=trim(SQLStmnt)+'SUM_NARAH,';
              SQLStmnt:=trim(SQLStmnt)+'NRC) VALUES(';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec6(list6.Items[i])^.yearVy)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec6(list6.Items[i])^.monthVy)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec6(list6.Items[i])^.tabno)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec6(list6.Items[i])^.periodM)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec6(list6.Items[i])^.periodY)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec6(list6.Items[i])^.rowNum)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec6(list6.Items[i])^.ukrGromad)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec6(list6.Items[i])^.st)+',';
              SQLStmnt:=trim(SQLStmnt)+''''+trim(pRec6(list6.Items[i])^.numIdent)+''',';
              SQLStmnt:=trim(SQLStmnt)+''''+AnsiUpperCase(trim(ReplQto2Q(pRec6(list6.Items[i])^.fio)))+''',';
              SQLStmnt:=trim(SQLStmnt)+''''+AnsiUpperCase(trim(ReplQto2Q(pRec6(list6.Items[i])^.nm)))+''',';
              SQLStmnt:=trim(SQLStmnt)+''''+AnsiUpperCase(trim(ReplQto2Q(pRec6(list6.Items[i])^.ftn)))+''',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec6(list6.Items[i])^.zo)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec6(list6.Items[i])^.payTp)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec6(list6.Items[i])^.payMnth)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec6(list6.Items[i])^.payYear)+',';
              SQLStmnt:=trim(SQLStmnt)+FormatFloatPoint(pRec6(list6.Items[i])^.sumTotal)+',';
              SQLStmnt:=trim(SQLStmnt)+FormatFloatPoint(pRec6(list6.Items[i])^.sumMax)+',';
              SQLStmnt:=trim(SQLStmnt)+FormatFloatPoint(pRec6(list6.Items[i])^.sumIns)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec6(list6.Items[i])^.otk)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec6(list6.Items[i])^.exp)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec6(list6.Items[i])^.lineno)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec6(list6.Items[i])^.kdNp)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec6(list6.Items[i])^.kdNzp)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec6(list6.Items[i])^.kdPtv)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec6(list6.Items[i])^.nrm)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec6(list6.Items[i])^.kdVp)+',';
              SQLStmnt:=trim(SQLStmnt)+FormatFloatPoint(pRec6(list6.Items[i])^.sumDiff)+',';
              SQLStmnt:=trim(SQLStmnt)+FormatFloatPoint(pRec6(list6.Items[i])^.sumNarah)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec6(list6.Items[i])^.nrc);
              SQLStmnt:=trim(SQLStmnt)+')';


              SQLExecute(SQLStmnt);

         end;
     if list7.Count>0 then
     for i:=0 to list7.Count-1 do
         begin
              SQLStmnt:='insert into tb_e04t07c (';
//              SQLStmnt:= SHIFRID     INTEGER NOT NULL,
              SQLStmnt:=trim(SQLStmnt)+'YEARVY,';
              SQLStmnt:=trim(SQLStmnt)+'MONTHVY,';
              SQLStmnt:=trim(SQLStmnt)+'TABNO,';
              SQLStmnt:=trim(SQLStmnt)+'PERIOD_M,';
              SQLStmnt:=trim(SQLStmnt)+'PERIOD_Y,';
//              SQLStmnt:=trim(SQLStmnt)+'ROWNUM,';
              SQLStmnt:=trim(SQLStmnt)+'UKR_GROMAD,';
              SQLStmnt:=trim(SQLStmnt)+'NUMIDENT,';
              SQLStmnt:=trim(SQLStmnt)+'FIO,';
              SQLStmnt:=trim(SQLStmnt)+'NM,';
              SQLStmnt:=trim(SQLStmnt)+'FTN,';
              SQLStmnt:=trim(SQLStmnt)+'C_PID,';
              SQLStmnt:=trim(SQLStmnt)+'START_DT,';
              SQLStmnt:=trim(SQLStmnt)+'END_DT,';
              SQLStmnt:=trim(SQLStmnt)+'DAYS,';
//              SQLStmnt:=trim(SQLStmnt)+'NORMZ,';
//              SQLStmnt:=trim(SQLStmnt)+'HH,';
//              SQLStmnt:=trim(SQLStmnt)+'MM,';
              SQLStmnt:=trim(SQLStmnt)+'NORMA,';
              SQLStmnt:=trim(SQLStmnt)+'SEAZON';
//              SQLStmnt:=trim(SQLStmnt)+'NUM_NAK,';
//              SQLStmnt:=trim(SQLStmnt)+'DT_NAK';
              SQLStmnt:=trim(SQLStmnt)+') VALUES(';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec7(list7.Items[i])^.yearVy)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec7(list7.Items[i])^.monthVy)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec7(list7.Items[i])^.tabno)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec7(list7.Items[i])^.periodM)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec7(list7.Items[i])^.periodY)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec7(list7.Items[i])^.ukrGromad)+',';
              SQLStmnt:=trim(SQLStmnt)+''''+trim(pRec7(list7.Items[i])^.numIdent)+''',';
              SQLStmnt:=trim(SQLStmnt)+''''+AnsiUpperCase(trim(ReplQto2Q(pRec7(list7.Items[i])^.fio)))+''',';
              SQLStmnt:=trim(SQLStmnt)+''''+AnsiUpperCase(trim(ReplQto2Q(pRec7(list7.Items[i])^.nm)))+''',';
              SQLStmnt:=trim(SQLStmnt)+''''+AnsiUpperCase(trim(ReplQto2Q(pRec7(list7.Items[i])^.ftn)))+''',';
              SQLStmnt:=trim(SQLStmnt)+''''+trim(pRec7(list7.Items[i])^.C_PID)+''',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec7(list7.Items[i])^.START_DT)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec7(list7.Items[i])^.END_DT)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec7(list7.Items[i])^.DAYS)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec7(list7.Items[i])^.NORMA)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec7(list7.Items[i])^.SEAZON);
              SQLStmnt:=trim(SQLStmnt)+')';


              SQLExecute(SQLStmnt);

         end;
     formWait.Hide;
     Application.ProcessMessages;
 end;
procedure TFormRepF4.fillCheckList;
 var i,j:integer;
     recPerson:pRecPerson;
     recAdd:pRecAdd;
     nalCode:string;
     fio,fam,nam,otc:shortString;
     st:integer;
     start_d,end_d:integer;
 begin
      if listCheck.Count<1 then exit;

      for i:=0 to listCheck.Count-1 do
          begin
               recPerson:=pRecPerson(listCheck.Items[i]);
               recPerson.summaAddSal := 0;
               recPerson.summaAddF6  := 0;
               recPerson.summaMatHelp:= 0;
               recPerson.summaKassa  := 0;
               if recPerson.addList.count>0 then
                  for j:=0 to recPerson.addList.count-1 do
                      begin
                           recAdd:=pRecAdd(recPerson.addList.items[j]);
                           if (recAdd^.shifrSta in [31,141]) then
                               recPerson.summaMatHelp := recPerson.summaMatHelp+recAdd^.Summa
                           else
                           if (recAdd^.shifrSta = kassa_shifr) then
                               recPerson.summaKassa := recPerson.summaKassa+recAdd^.Summa
                           else
                               recPerson.summaAddSal := recPerson.summaAddSal+recAdd^.Summa;
                      end;
               recPerson.summaAddF6 := getSummaFromF6(recPerson.tabno);
               nalCode:=GetNal_CodePerson(recPerson.tabno);
               nalCode:=trim(nalCode);
               if length(nalCode)<>10 then
                  begin
                       nalCode:=getPreviousNalCode(recPerson.tabno);
                       nalCode:=trim(nalCode);
                       if length(nalCode)<>10 then
                          begin
                               inc(shifrBk);
                               nalCode:='����00000'+intToStr(shifrBk);
                          end;
                  end;
               st:=getPolForF6(nalCode);
               fio:=GetFullUkrFioPerson(recPerson.tabno);
               SplitFIO(fio,fam,nam,otc);
               recPerson.numIdent:=nalCode;
               recPerson.fio := fam;
               recPerson.nm  := nam;
               recPerson.ftn := otc;
               recPerson.st  := st;
//               recPerson.ukrGromad:=1;
               recPerson.otk   := 0;
               recPerson.exp   := 0;
               recPerson.kdNp  := 0;
               recPerson.kdNzp := 0;
               recPerson.kdPtv := 0;
               recPerson.nrm   := 0;
               recPerson.kdVp  := 0;
               recPerson.nrc   := 0;
               getDataKdPtv(recPerson.tabno,recPerson^.start_d,recPerson^.end_d,recperson^.kdptv);
          end;
      for i:=0 to listCheck.Count-1 do
          if abs(abs(pRecPerson(listCheck.Items[i]).summaAddSal)
                 - abs(pRecPerson(listCheck.Items[i]).summaAddF6))>1.0 then
          begin
               error(intToStr(pRecPerson(listCheck.Items[i]).tabno)+' '+pRecPerson(listCheck.Items[i]).fio+' '+FormatFloatPoint(pRecPerson(listCheck.Items[i]).summaAddSal)+' '+' '+FormatFloatPoint(pRecPerson(listCheck.Items[i]).summaAddF6));
          end;
 end;

function TFormRepF4.getSummaFromF6(tabno:integer):real;
 var rec6:pRec6;
     i:integer;
     retVal:real;
 begin
      retVal:=0;
      if list6.Count>0 then
         for i:=0 to list6.Count-1 do
             if pRec6(list6.Items[i]).tabno=tabno then
                retVal:=r10(retVal) + r10(pRec6(list6.Items[i]).sumTotal);
      getSummaFromF6:=retVal;
 end;

procedure TFormRepF4.getDataKdPtv(tabno:integer;var start_d:integer;var end_d:integer;var kd_ptv:integer);
 var SQLStmnt        : string;
     v, vFr, vTo     : variant;
     dateFr, dateTo  : TDateTime;
     yFr,mFr,yTo,mTo : integer;
     dFr,dTo         : integer;
 begin
     start_d:=1;
     end_d:=LenMonth(encodedate(currYear,nmes,1));
     kd_Ptv:=(end_d-start_d+1);
     SQLStmnt:='select data_pri,data_uw,code_uwol from kadry';
     SQLStmnt:=trim(SQLStmnt)+' where ((extract(year from kadry.data_pri)='+intToStr(currYear)+' and extract(month from kadry.data_pri)='+intToStr(nmes)+') or';
     SQLStmnt:=trim(SQLStmnt)+' (extract(year from kadry.data_uw )='+intToStr(currYear)+' and extract(month from kadry.data_uw)='+intToStr(nmes)+')) and kadry.tabno='+intToStr(tabno);
     v:=SQLQueryRecValues(SQLStmnt);
     if VarIsNull(v) then
        exit;
     if not VarIsArray(v) then
        exit;
     vFr := v[0];
     vTo := v[1];
     yFr := 0;
     mFr := 0;
     dFr := 0;
     yTo := 0;
     mTo := 0;
     dTo := 0;
     if not (VarIsEmpty(vFr)  or VarIsNull(vFr)) then
        begin
             yFr := yearOf (vFr);
             mFr := monthOf(vFr);
             dFr := dayOf(vFr);
        end;
     if not (VarIsEmpty(vTo)  or VarIsNull(vTo)) then
        begin
             yTo := yearOf (vTo);
             mTo := monthOf(vTo);
             dTo := dayOf(vTo);
        end;
     if ((yFr=currYear) and (mFr=NMES)) then
         start_d:=dFr;
     if ((yTo=currYear) and (mTo=NMES)) then
         end_d:=dTo;
     kd_ptv := end_d - start_d + 1;


 end;
function TFormRepF4.getBolDay(tabno:integer;payYear:integer;payMnth:integer):integer;
 var SQLStmnt        : string;
     v               : variant;
     retVal          : integer;
 begin
     retVal := 0;
     SQLStmnt:='select coalesce(sum(coalesce(br.b_day,0)),0) b_day from boln_res br';
     SQLStmnt:=trim(SQLStmnt)+' join boln b on b.shifrid=br.shifridboln';
     SQLStmnt:=trim(SQLStmnt)+' where br.year_za='+intToStr(payYear)+' and br.month_za='+intToStr(payMnth);
     SQLStmnt:=trim(SQLStmnt)+' and b.year_vy='+intToStr(currYear)+' and b.month_vy='+intToStr(NMES);
     SQLStmnt:=trim(SQLStmnt)+' and b.shifr_sta in (12,14)';
     SQLStmnt:=trim(SQLStmnt)+' and b.tabno='+intToStr(tabno);
     v:=SQLQueryRecValues(SQLStmnt);
     if VarIsNumeric(v) then
        retVal := v;
     getBolDay:=retVal;
 end;

function TFormRepF4.getDekrBolDay(tabno:integer;payYear:integer;payMnth:integer):integer;
 var SQLStmnt        : string;
     v               : variant;
     retVal          : integer;
 begin
     retVal := 0;
     SQLStmnt:='select coalesce(sum(coalesce(br.b_day,0)),0) b_day from boln_res br';
     SQLStmnt:=trim(SQLStmnt)+' join boln b on b.shifrid=br.shifridboln';
     SQLStmnt:=trim(SQLStmnt)+' where br.year_za='+intToStr(payYear)+' and br.month_za='+intToStr(payMnth);
     SQLStmnt:=trim(SQLStmnt)+' and b.year_vy='+intToStr(currYear)+' and b.month_vy='+intToStr(NMES);
     SQLStmnt:=trim(SQLStmnt)+' and b.shifr_sta in (32)';
     SQLStmnt:=trim(SQLStmnt)+' and b.tabno='+intToStr(tabno);
     v:=SQLQueryRecValues(SQLStmnt);
     if VarIsNumeric(v) then
        retVal := v;
     getDekrBolDay:=retVal;
 end;

 function TFormRepF4.getOtpDay(tabno:integer;payYear:integer;payMnth:integer):integer;
 var SQLStmnt        : string;
     v               : variant;
     retVal          : integer;
 begin
     retVal := 0;
     SQLStmnt:='select coalesce(sum(coalesce(or.o_day,0)),0) o_day from otp_res or';
     SQLStmnt:=trim(SQLStmnt)+' join otpuska o on o.shifrid=or.shifridotp';
     SQLStmnt:=trim(SQLStmnt)+' where or.year_za='+intToStr(payYear)+' and or.month_za='+intToStr(payMnth);
     SQLStmnt:=trim(SQLStmnt)+' and o.year_vy='+intToStr(currYear)+' and o.month_vy='+intToStr(NMES);
     SQLStmnt:=trim(SQLStmnt)+' and o.shifrsta in (5)';
     SQLStmnt:=trim(SQLStmnt)+' and o.tabno='+intToStr(tabno);
     v:=SQLQueryRecValues(SQLStmnt);
     if VarIsNumeric(v) then
        retVal := v;
     getOtpDay:=retVal;
 end;
function TFormRepF4.isSciPedForSwod(curr_person:person_ptr):boolean;
 var retVal:boolean;
 begin
      retVal:=isSciPed(curr_person);
      if ((curr_person^.WID_RABOTY=2) and
          (curr_person^.MESTO_OSN_RABOTY=82)) then
         retVal:=false;
      isSciPedForSwod:=retVal;
 end;

end.