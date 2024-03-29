unit UFormRepF4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, frxClass, frxDBSet, ExtCtrls,
  scrDef, FIBQuery, pFIBQuery;

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
    dsDekr6: TpFIBDataSet;
    dsDekrFIO: TFIBStringField;
    dsDekrINN: TFIBStringField;
    dsSowm: TpFIBDataSet;
    dsSowmTABNO: TFIBIntegerField;
    dsSowmFIO: TFIBStringField;
    dsSowmNAL_CODE: TFIBStringField;
    dsSowmDATA_PRI: TFIBDateField;
    dsSowmDATA_UW: TFIBDateField;
    dsSowmCODE_UWOL: TFIBSmallIntField;
    dsSowmNOMERPRIK: TFIBStringField;
    dsSowmDATAPRIK: TFIBDateField;
    dsSowmIDCLASSIFICATOR: TFIBIntegerField;
    dsSowmKODKP: TFIBStringField;
    dsSowmKODZKPPTR: TFIBStringField;
    dsSowmNAMEDOL: TFIBStringField;
    dsSowmNAMEPROF: TFIBStringField;
    dsSowmDATABEG: TFIBDateField;
    dsSowmDATAEND: TFIBDateField;
    cbNRC: TCheckBox;
    dsPriUwPrik: TpFIBDataSet;
    dsPriUwPrikTABNO: TFIBIntegerField;
    dsPriUwPrikDATABEG: TFIBDateField;
    dsPriUwPrikDATAEND: TFIBDateField;
    dsPriUwPrikSHIFRIDTYP: TFIBIntegerField;
    dsPriUwPrikDATAPRIK: TFIBDateField;
    dsPriUwPrikNOMERPRIK: TFIBStringField;
    dsPriUwPrikFIO: TFIBStringField;
    dsPriUwPrikKODZKPPTR: TFIBStringField;
    dsPriUwPrikKODKP: TFIBStringField;
    dsPriUwPrikNAMEDOL: TFIBStringField;
    dsPriUwPrikNAMEPROF: TFIBStringField;
    dsPriUwPrikID: TFIBIntegerField;
    dsDekr6TABNO: TFIBIntegerField;
    dsDekr6FIO: TFIBStringField;
    dsDekr6INN: TFIBStringField;
    dsDekr6DATE_FR: TFIBDateField;
    dsDekr6DATE_TO: TFIBDateField;
    dsDekr6KIND: TFIBIntegerField;
    pQDekr6: TpFIBQuery;
    dsPerevodyIDCLASSIFICATOR_OLD: TFIBIntegerField;
    dsPerevodyKODKP_OLD: TFIBStringField;
    dsPerevodyKODZKPPTR_OLD: TFIBStringField;
    dsPerevodyNAMEDOL_OLD: TFIBStringField;
    dsPerevodyNAMEPROF_OLD: TFIBStringField;
    dsPerevodyDATABEG: TFIBDateField;
    dsPerevodyDATAEND: TFIBDateField;
    qBolDay: TpFIBQuery;
    dsSowmUw: TpFIBDataSet;
    dsSowmUwTABNO: TFIBIntegerField;
    dsSowmUwFIO: TFIBStringField;
    dsSowmUwNAL_CODE: TFIBStringField;
    dsSowmUwDATA_PRI: TFIBDateField;
    dsSowmUwDATA_UW: TFIBDateField;
    dsSowmUwCODE_UWOL: TFIBSmallIntField;
    dsSowmUwNOMERPRIK: TFIBStringField;
    dsSowmUwDATAPRIK: TFIBDateField;
    dsSowmUwIDCLASSIFICATOR: TFIBIntegerField;
    dsSowmUwKODKP: TFIBStringField;
    dsSowmUwKODZKPPTR: TFIBStringField;
    dsSowmUwNAMEDOL: TFIBStringField;
    dsSowmUwNAMEPROF: TFIBStringField;
    dsSowmUwDATABEG: TFIBDateField;
    dsSowmUwDATAEND: TFIBDateField;
    dsFilledPrikazy: TpFIBDataSet;
    dsFilledPrikazyTABNO: TFIBIntegerField;
    dsFilledPrikazyDATABEG: TFIBDateField;
    dsFilledPrikazyDATAEND: TFIBDateField;
    dsFilledPrikazySHIFRIDTYP: TFIBIntegerField;
    dsFilledPrikazyDATAPRIK: TFIBDateField;
    dsFilledPrikazyNOMERPRIK: TFIBStringField;
    dsFilledPrikazyFIO: TFIBStringField;
    dsFilledPrikazyKODZKPPTR: TFIBStringField;
    dsFilledPrikazyKODKP: TFIBStringField;
    dsFilledPrikazyNAMEDOL: TFIBStringField;
    dsFilledPrikazyNAMEPROF: TFIBStringField;
    dsFilledPrikazyID: TFIBIntegerField;
    dsFilledPrikazyNEEDT5: TFIBIntegerField;
    dsFilledPrikazyZO: TFIBIntegerField;
    dsFilledPrikazyVS: TFIBIntegerField;
    dsFilledPrikazyPIR: TFIBIntegerField;
    dsFilledPrikazyCODE_UWOL: TFIBSmallIntField;
    dsPerevodyZO: TFIBIntegerField;
    dsPerevodyVS: TFIBIntegerField;
    dsPerevodyPIR: TFIBIntegerField;
    dsSowmZO: TFIBIntegerField;
    dsSowmVS: TFIBIntegerField;
    dsSowmPIR: TFIBIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    shifrBk:integer;   // ������� ���������� ��� ���� 
    { Private declarations }
    procedure CreateReport6;
    procedure fillPersonBad(curr_person:person_ptr);
    procedure fillOsnPerson(curr_person:person_ptr);
    procedure fillSowmPerson(curr_person:person_ptr);
    procedure fillIllPerson(curr_person:person_ptr);
    procedure fillOtpPerson(curr_person:person_ptr);
    procedure fillDPPerson(curr_person:person_ptr);
    procedure fillPremPerson(curr_person:person_ptr);
    procedure fillPochasPerson(curr_person:person_ptr);
    procedure fillMatHelpPerson(curr_person:person_ptr);
    procedure fillCheckPerson(curr_person:person_ptr);
    function GetMaxId6:integer;
    function getPreviousNalCode(tabno:integer):string;
    procedure fillFullList6Recs;
    procedure fillFullList6RecsFromCheckList;
    procedure fillCheckList;
    procedure fillDoplDoMin;
    procedure fillRecalcNarah22;
    procedure addZavadskieToList6;
    procedure fillSownVneList;
//    procedure fillMatHelpObl; //���������� �� � ��� �� ������. ��� �� 106 ���� 

    procedure fillTable7;
    procedure fillTable7Dekr;
    procedure fillTable5;
    procedure fillTable5PrinjatUwolen;
    procedure fillTable5PrinjatUwolenFromPrikazy;
    procedure fillTable5Perevody;
    procedure fillTable5SowmPri;
    procedure fillTable5SowmUw;
    procedure fillTable5FromFilledPrikazy;

    procedure fillTable5CPH;
    procedure fillTable5Dekr;

    function  getSummaFromF6(tabno:integer):real;
    function  getSummaFromF6WithoutDolpDoMin(tabno:integer):real;
    function  isSciPedOsnInList(tabno:integer):boolean;
    procedure emptyIllOtpLists;
    procedure getDataKdPtv(tabno:integer;var start_d:integer;var end_d:integer;var kd_ptv:integer);
    function  getBolDay(tabno:integer;payYear:integer;payMnth:integer;
                              var amntOfbDayOsn: Integer; var summaBolOsn:Real;
                              var amntOfbDaySowm: Integer; var summaBolSowm:Real):integer;
    function  getDekrBolDay(tabno:integer;payYear:integer;payMnth:integer):integer;
    function  getOtpDay(tabno:integer;payYear:integer;payMnth:integer):integer;
//    function  getShifrWrForBoln(TABNO:Integer;summa:Real;Y:integer;M:integer):Integer;

    procedure fillBolDay;
//    function  isSciPedForSwod(curr_person:person_ptr):boolean;
    procedure calculateSumNarahInBD;
    procedure moveToBD;

  public
    wantedMonth:Integer;
    wantedYear:Integer;
    { Public declarations }
  end;

var
  FormRepF4: TFormRepF4;

implementation
  uses
      uFIBModule,UFormWait,ScrUtil,DateUtils,ComObj,ScrIO,
      scrLists,uFormMkPensList,uSqlUnit,math,UCrc32;
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
              PNR        : string;  //13-� �������   �����c���� ����� ������
              ZKPP       : string;  //14-� ������� - ��� ��������������
              PROF       : string;
              POS        : string;  // ������ - 15-� �������
              PID        : string;
              VZV        : string;
              VS         : Integer;
              PIR        : Integer;
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
                 tabno    : Integer;
                 summa    : real;
                 amntOfBDay:Integer;
                 pay_mnth : integer;
                 pay_Year : integer;
                 kdNp     : integer;
                 shifrwr  : Integer;
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
                    summaUwolKomp :real;
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
           pRecSowmVne = ^TRecSowmVne; // ������� ������������
           TRecSowmVne = record
                          tabno : integer;
                         end;
      pCardinal = ^Cardinal;                   
      tAddCash=class
                constructor create;
                destructor free;
                procedure addToCash(curr_person:person_ptr;curr_add:ADD_PTR);
                function isInCash(curr_person:person_ptr;curr_add:ADD_PTR):boolean;
                private
                    list:TList;
                    function isCRC32InCash(pcrc32:pCardinal):boolean;

               end;
  var list5,list6,list7 : TList;
      listIll,listOtp   : TList;
      listIllSowm,listOtpSowm : TList;
      listCheck         : TList;
      listCPH           : TList;
      listSowmVne       : TList;
      list5UsedPris     : TList; // ������ ��� �������� ������� ��������
      E                 : Variant;
      AddCashObject     : tAddCash;
{$R *.dfm}
(*
 function checkPerson(TABNO:integer;zo,payTp,payMnth,payYear,w_r:integer):real;
 var finded:boolean;
     i:integer;
     rec6:pRec6;
     exp:integer;
 begin
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
                    checkPerson::=pRec6(list6.items[i])^.sumTotal:=r10(pRec6(list6.items[i])^.sumTotal)+r10(summaAdd);
                    rec6:=pRec6(list6.items[i]);
                    break;
               end;
     if  not finded then
        begin
             addSummaToF6 := nil;
             exit;
        end;
     Rec6.sumTotal := Rec6.sumTotal + summaAdd;
     addSummaToF6:=rec6;

 end;
*)
 constructor tAddCash.create;
   begin
        list:=TList.Create;
   end;
 destructor tAddCash.free;
   var i:Integer;
   begin
        if list.Count>0 then
           for i:=0 to list.Count-1 do
               Dispose(pCardinal(list.Items[i]));
        list.Clear;       
        list.Free;
   end;
 procedure tAddCash.addToCash(curr_person:person_ptr;curr_add:ADD_PTR);
   var crc32:Cardinal;
       pcrc32:PCardinal;
   begin
        new(pcrc32);
        pcrc32^:=PersonAddCRC32(Curr_Person,curr_add);
        if not isCRC32InCash(pcrc32) then
           list.Add(pcrc32);

   end;
 function tAddCash.isInCash(curr_person:person_ptr;curr_add:ADD_PTR):boolean;
   var retVal:Boolean;
       p:pCardinal;
       crc32:Cardinal;
   begin
        retVal:=False;
        crc32:=PersonAddCRC32(Curr_Person,curr_add);
        retVal:= isCRC32InCash(@crc32);
        isInCash:=retVal;
   end;

 function tAddCash.isCRC32InCash(pcrc32:pCardinal):boolean;
   var retVal:Boolean;
       i:Integer;
   begin
        retVal:=False;
        i:=list.IndexOf(pcrc32);
        if i>=0 then
           retVal:=true;
        isCRC32InCash:=retVal;
   end;


 function addSummaToF6(TABNO,zo,payTp,payMnth,payYear:integer;summaAdd:real;needZero:boolean=false;otk:integer=1;kd_ptv:integer=0;kd_nzp:integer=0;w_r:integer=0;nrc:Integer=0):pRec6;
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
//                    pRec6(list6.items[i])^.sumTotal:=r10(pRec6(list6.items[i])^.sumTotal)+r10(summaAdd);
                    rec6:=pRec6(list6.items[i]);
                    break;
               end;
     if  not finded then
        begin
             addSummaToF6 := nil;
             exit;
        end;
     Rec6.sumTotal := Rec6.sumTotal + summaAdd;
     addSummaToF6:=rec6;

 end;


 function addToF6(TABNO,zo,payTp,payMnth,payYear:integer;summaAdd:real;needZero:boolean=false;otk:integer=1;kd_ptv:integer=0;kd_nzp:integer=0;w_r:integer=0;nrc:Integer=0):pRec6;
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
     Rec6.yearVy   := FormRepF4.wantedYear;
     Rec6.monthVy  := FormRepF4.wantedMonth;
     Rec6.tabno    := tabno;
     Rec6.periodM  := FormRepF4.wantedMonth;
     Rec6.periodY  := Rec6.yearVy;
     Rec6.rowNum   := 0;
     Rec6.ukrGromad:= 1;
     Rec6.zo       := zo; // ��� ������� ������� 1- ��� ������� 2- �������������� 25 - ������� 32- �������� �������
     Rec6.payTp    := payTp;
     Rec6.payMnth  := payMnth;
     Rec6.payYear  := payYear;
     if payTp=13 then    //������� �� �����������
        rec6.sumDiff := summaAdd
     else
        Rec6.sumTotal := summaAdd;
     if otk>0 then
        rec6.otk      := otk;
     if kd_ptv>0 then
        rec6.kdPtv:=kd_ptv;
     if kd_nzp>0 then
        rec6.kdNzp:=kd_nzp;
     if nrc>0 then
        rec6.nrc:=nrc;
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
     cbNRC.Checked:=false;
//     if ((NMES>3) and (NMES<9) and (CURRYEAR=2020)) then
//        cbNRC.Checked:=True;
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
  var savNMES,savNSRV,savYear:integer;
      iNSRV,i:Integer;
      curr_person:PERSON_PTR;
      curr_add:ADD_PTR;
      maked:Boolean;
      summa6,summa13:real;
      summaS6_13,summaS6,summaS13:string;
  begin
       savNMES:=NMES;
       savNSRV:=NSRV;
       NMES:=wantedMonth;
       EMPTY_ALL_PERSON;
       list5:=TList.Create;
       list6:=TList.Create;
       list7:=TList.Create;
       listCheck:=TList.Create;
       listCPH:=TList.Create;
       listSowmVne:=TList.Create;
//       listIll:=TList.Create;
       ProgressBar1.Min:=0;
       ProgressBar1.Max:=Count_Serv * 9;
       ProgressBar1.Step:=1;
       MAKEPENSLIST(2);   // ������ ���������
       AddCashObject:=tAddCash.create;
       // 0 ��������
       // �������� ��� ����������, ��� ���� �� ������������ � ������
       // ���������� '0' � ��c������ ����� ���� count[8] � add
//       for iNSRV:=1 to Count_Serv do
//           begin
//                NSRV:=iNSRV;
//                MKFLNM;
//                ProgressBar1.StepIt;
//                Application.ProcessMessages;
////                if IsColedgPodr(NSRV) then continue;
////                if nsrv in [11,102] then continue;
//                if not fileexists(FNINF) then Continue;
////                if not nameservlist.IS_MO_BUD(nsrv) then continue;
//                getinf(false);
//                curr_person := HEAD_PERSON;
//                maked := False;
//                while (curr_person<>nil) do
//                  begin
//                       curr_add:=curr_person^.ADD;
//                       while (curr_add<>nil) do
//                         begin
//                              curr_add^.COUNT:=Trim(curr_add^.COUNT);
//                              i:=Length(curr_add^.count);
//                              i:=(SizeOf(curr_Add^.Count)-1)-(i+1);
//                              if i>0 then
//                                 curr_add^.COUNT:=SPACE(i)+'0'
//                              else
//                                 curr_add^.COUNT[8]:='0';
//                              maked:=True;
//                              curr_add:=curr_add^.next;
//                         end;
//                       curr_person:=curr_person^.NEXT;
//                  end;
//                if not maked then
//                   EMPTY_ALL_PERSON
//                else
//                   PUTINF;
//           end;

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
//       if false then
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

       for iNSRV:=1 to Count_Serv do
           begin
                NSRV:=iNSRV;
                MKFLNM;
                ProgressBar1.StepIt;
                Application.ProcessMessages;
//                if IsColedgPodr(NSRV) then continue;
                if nsrv <> 106 then continue;
                getinf(false);
                curr_person:=HEAD_PERSON;
                while (curr_person<>nil) do
                  begin
                       fillMatHelpPerson(Curr_person);
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
       addZavadskieToList6;  // ����������� ��������� ������� � � 18 05 2020
       fillFullList6RecsFromCheckList;
       fillSownVneList;
//       fillRecalcNarah22;       18 05 2020 ������ � �� ����� ��������
       fillTable5;
       fillTable7;
       fillTable7Dekr; // 07 05 2020 ����������� �������, ��� ���������� ������
                       // ���� � ���� 7 ���� ��� �������������
       DisposePensList;
       moveToBD;
       calculateSumNarahInBD;
       if list5.count>0 then
          for i:=0 to list5.count-1 do
              dispose(pRec5(list5.Items[i]));
       list5.Free;
       list5:=nil;
       Summa6:=0;
       Summa13:=0; // ����� ������ �� ����������� (����� ��� ��������� �� ������)
       if list6.count>0 then
          for i:=0 to list6.count-1 do
              begin
                   if pRec6(list6.Items[i]).payTp=13 then
                      summa13:=r10(r10(summa13)+r10(pRec6(list6.Items[i]).sumTotal))
                   else
                      summa6:=r10(r10(summa6)+r10(pRec6(list6.Items[i]).sumTotal));
                   dispose(pRec6(list6.Items[i]));
              end;
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
       if listSowmVne.count>0 then
          for i:=0 to listSowmVne.count-1 do
              dispose(pRecSowmVne(listSowmVne.Items[i]));
       listSowmVne.Free;
       listSowmVne:=nil;
       AddCashObject.free;
//       if listIll.count>0 then
//          for i:=0 to listIll.count-1 do
//              dispose(pRecIll(listIll.Items[i]));
//       listIll.Free;
//       listIll:=nil;
       NMES:=savNMES;
       NSRV:=savNSRV;
       MKFLNM;
       getinf(true);
       summaS6_13 :=FormatSummaForPlt(summa6+summa13);
       summaS6    :=FormatSummaForPlt(summa6);
       summaS13   :=FormatSummaForPlt(summa13);
       showMessage('����� �����������.'+#13#10+' ����� � ������� 6 '+#9#9+Trim(summaS6_13)+#13#10+'����� ��� ������ �� ���.�.�.'+#9+Trim(summaS6)+#13#10+'����� ������ �� ���.�.�.'+#9#9+Trim(summaS13));
  end;
procedure TFormRepF4.fillPersonBad(curr_person:person_ptr);
(*
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
//                      (curr_add^.shifr=dekret_shifr)
//                      or
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
           if listIllSowm<>Nil then
              begin
                    if listIllSowm.count>0 then
                       for i:=0 to listIllSowm.Count-1 do
                           dispose(pRecIll(listIllSowm.Items[i]));
                    listIllSowm.Free;
                    listIllSowm:=nil;
              end;
           if listOtp<>Nil then
              begin
                    if listOtp.count>0 then
                       for i:=0 to listOtp.Count-1 do
                           dispose(pRecIll(listOtp.Items[i]));
                    listOtp.Free;
                    listOtp:=nil;
              end;
           if listOtpSowm<>Nil then
              begin
                    if listOtpSowm.count>0 then
                       for i:=0 to listOtpSowm.Count-1 do
                           dispose(pRecIll(listOtpSowm.Items[i]));
                    listOtpSowm.Free;
                    listOtpSowm:=nil;
              end;
      end;
    procedure fillIllPersonBad;
      var curr_add:add_ptr;
          recIll:pRecIll;
          i:integer;
          finded:boolean;
          shifrWr:Integer;
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
                                   //            shifrWr:=getShifrWrForBoln(curr_person^.tabno,curr_add^.summa,Curr_add^.year,curr_add^.period);
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
//                                  recIll^.shifrwr  := curr_person.WID_RABOTY; //  ��������
                                  recIll^.shifrwr  := OSN_WID_RABOTY; //  ��������
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
                                  recIll^.shifrwr  := OSN_WID_RABOTY;
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
*)
  begin
    // ��� ������ ������� ��������� � ��� ��������������
(*
       emptyIllOtpLists;
       listIll     := TList.Create;
       listIllSowm := TList.Create;
       listOtp     := TList.Create;
       listOtpSowm := TList.Create;
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
*)       
 //      if nzp>0 then
          
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
      w_r:integer;
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
                      (curr_add^.shifr=139) // ������� �� ����������
                      or
                      (curr_add^.shifr=141) // ��� ������ �� ����������
                      or
                      (curr_add^.shifr=VYHODNOE_POSOBIE_SHIFR) // �������� �������
                      or
                      (curr_add^.shifr=dogPodShifr)
                      ) then
                      begin
                           retVal:=retVal+curr_add^.SUMMA;
                           AddCashObject.addToCash(curr_person,curr_add);
                      end;
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
               if retVal>LenMonth(encodeDate(wantedYear,wantedMonth,1)) then
                  retVal:=LenMonth(encodeDate(wantedYear,wantedMonth,1));

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
               if retVal>LenMonth(encodeDate(wantedYear,wantedMonth,1)) then
                  retVal:=LenMonth(encodeDate(wantedYear,wantedMonth,1));

           kd_Nzp:=OTPUSK_BEZ_DAY(1,curr_person);
      end;

  begin
       if  not (IS_OSN_WID_RABOTY(curr_person)) then
       if GET_DOL_CODE(curr_person)<>5 then Exit; //��������
//          or (NSRV=98)) then exit;
       if ((curr_person^.tabno=11626))
         then
            zo:=25;
       if nsrv in [82,98,105,106,121,165] then exit; // 98 - ���������
 //      if nsrv in [82,105,106,121] then exit; // 98 - ���������
       if DOG_POD_PODRAZD(nsrv) then exit;
       if ((curr_person^.tabno=11609) and (NSRV=98)) then
          zo:=25;
       if (curr_person^.tabno=3719)
         then
            zo:=25;
       summaAdd:=getSummaOsnAddForPerson(curr_person);
       if abs(summaAdd)<0.01 then exit;
       if curr_person^.tabno=55 then
          curr_person^.MALO:=0;
       fillSciPerson;
       fillNotSciPerson;
       fillKdPtvPerson;
       fillKdNzpPerson;
       if kd_nzp>0 then
          zo:=25;
       if abs(summaSciPedAdd)>0.01 then
          begin
               zo       := 25;
               summaAdd := summaSciPedAdd;
               payTp    := 0;
               payYear  := wantedYear;
               payMnth  := wantedMonth;
               w_r      := 1;
               rec6:=addToF6(curr_Person^.TABNO,zo,payTp,payMnth,payYear,summaAdd,false,1,kd_ptv,kd_nzp,w_r);
               rec6^.w_r:=1;
          end;
       if abs(summaNotSciPedAdd)>0.01 then
          begin
               zo       := 1;
               summaAdd := summaNotSciPedAdd;
               payTp    := 0;
               payYear  := wantedYear;
               payMnth  := wantedMonth;
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
                      (curr_add^.shifr=139) // ������� �� ����������
                      or
                      (curr_add^.shifr=141) // ��� ������ �� ����������
                      or
                      (curr_add^.shifr=VYHODNOE_POSOBIE_SHIFR) // �������� �������
                      or
                      (curr_add^.shifr=dogPodShifr)
                      ) then
                      begin
                           retVal:=retVal+curr_add^.SUMMA;
                           AddCashObject.addToCash(curr_person,curr_add);
                      end;
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
               if retVal>LenMonth(encodeDate(wantedYear,wantedMonth,1)) then
                  retVal:=LenMonth(encodeDate(wantedYear,wantedMonth,1));

           kd_Ptv:=retVal;
           kd_ptv:=0;
      end;
    procedure fillKdNzpPerson;
      var retVal:integer;
          i:integer;
      begin
           retVal:=0;
           for i:=1 to 31 do
               if not (curr_person^.TABEL[i] in [0,NEZAPOLN]) then
                  inc(retVal);
               if retVal>LenMonth(encodeDate(wantedYear,wantedMonth,1)) then
                  retVal:=LenMonth(encodeDate(wantedYear,wantedMonth,1));

           kd_Nzp:=OTPUSK_BEZ_DAY(1,curr_person);
       if kd_nzp>0 then
          zo:=1;

      end;

  begin
       if IS_OSN_WID_RABOTY(curr_person) then exit;
       if nsrv in [82,98,105,106,121,165] then exit;  // 98 - ���������
       if DOG_POD_PODRAZD(nsrv) then exit;
       if GET_DOL_CODE(curr_person)=5 then Exit;         //�������� ���� � ��������
       summaAdd:=getSummaOsnAddForPerson(curr_person);
       if abs(summaAdd)<0.01 then exit;
       if curr_person^.tabno=55 then
          curr_person^.MALO:=0;
               if curr_person^.tabno=11626 then
                  curr_person^.MALO:=0;

       fillSciPerson;
       fillNotSciPerson;
       fillKdPtvPerson;
       fillKdNzpPerson;
       otk:=1;
       if curr_person^.MESTO_OSN_RABOTY in [82,121] then otk:=0;
       otk:=0;  // ��� ������������ ������ OTK=0 (07 05 2020 �����������)
       zo:=1;   // ��� ������������ ������ OTK=0 (07 05 2020 �����������)
       if curr_person^.tabno=11806  then
          otk:=0;
       if abs(summaSciPedAdd)>0.01 then
          begin
//               zo       := 25;
               summaAdd := summaSciPedAdd;
               payTp    := 0;
               payYear  := wantedYear;
               payMnth  := wantedMonth;
//             function addToF6(TABNO,zo,payTp,payMnth,payYear:integer;summaAdd:real;needZero:boolean=false;otk:integer=1;kd_ptv:integer=0;kd_nzp:integer=0;w_r:integer=0):pRec6;
               rec6:=addToF6(curr_Person^.TABNO,zo,payTp,payMnth,payYear,summaAdd,false,otk,0,0,2);
               rec6^.w_r:=2;
               if curr_person^.tabno=11626 then // �����
                  rec6^.ZO:=25;
//               if False then                     D
               if otk=0 then
                  begin
//                       rec6^.kdPtv:=kd_ptv;    //  ������� ��� �� �����������
                       rec6^.kdNzp:=kd_nzp;    //  ��� ����������������
                       rec6^.kdPtv:=0;         // ������� ��� �� �����������
//                       rec6^.kdNzp:=0;         //  ��� ����������������
                                               //  14 05 2020 �����������
                  end;
          end;
          //050-994-03-94
          // 11946 ��������� ����� �������
          // ���� 25
          // ����� 25
// ������  ��� ���������� �� ����������
 // 11603 �������� � � �������� �� 4011��� ������ ���� ������ � 1 � ��� ��� ���� ��� ���������� �� ����� ������
// ���� - ���� ������ - 25

       if abs(summaNotSciPedAdd)>0.01 then
          begin
               zo       := 1;
               summaAdd := summaNotSciPedAdd;
               payTp    := 0;
               payYear  := wantedYear;
               payMnth  := wantedMonth;
//             function addToF6(TABNO,zo,payTp,payMnth,payYear:integer;summaAdd:real;needZero:boolean=false;otk:integer=1;kd_ptv:integer=0;kd_nzp:integer=0;w_r:integer=0):pRec6;
               rec6:=addToF6(curr_Person^.TABNO,zo,payTp,payMnth,payYear,summaAdd,false,otk,0,0,2);
               rec6^.w_r:=2;
               if otk=0 then
                  begin
                       rec6^.kdPtv:=0;
                       rec6^.kdNzp:=0;
                  end;
          end;
                       rec6^.kdPtv:=0;
                       rec6^.kdNzp:=0;
//                       rec6^.kdPtv:=kd_ptv;
                       rec6^.kdNzp:=kd_nzp;
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
               if retVal>LenMonth(encodeDate(wantedYear,wantedMonth,1)) then
                  retVal:=LenMonth(encodeDate(wantedYear,wantedMonth,1));

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
               if retVal>LenMonth(encodeDate(wantedYear,wantedMonth,1)) then
                  retVal:=LenMonth(encodeDate(wantedYear,wantedMonth,1));
           kd_Nzp:=OTPUSK_BEZ_DAY(1,curr_person);
      end;

  begin
  //     Exit;  // - ��������� ���
       if nsrv in [82,105,106,121,165] then exit;
       if DOG_POD_PODRAZD(nsrv) then exit;
       if ((curr_person^.tabno=3554) and (nsrv=98))
         then
            zo:=25;

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
               payYear  := wantedYear;
               payMnth  := wantedMonth;
               rec6     := addSummaToF6(curr_Person^.TABNO,zo,payTp,payMnth,payYear,summaAdd,false,1,kd_ptv,kd_nzp,1);
               if rec6=nil then
                  begin
                      rec6     := addToF6(curr_Person^.TABNO,zo,payTp,payMnth,payYear,summaAdd,false,1,kd_ptv,kd_nzp);
                      rec6^.w_r:=2;
                      rec6^.zo:=1;
                      rec6^.exp:=1;
                      rec6^.otk:=0;
                  end
          end;
       if abs(summaNotSciPedAdd)>0.01 then
          begin
               zo       := 1;
               summaAdd := summaNotSciPedAdd;
               payTp    := 0;
               payYear  := wantedYear;
               payMnth  := wantedMonth;
//               rec6     := addToF6(curr_Person^.TABNO,zo,payTp,payMnth,payYear,summaAdd,false,1,kd_ptv,kd_nzp);
               rec6     := addSummaToF6(curr_Person^.TABNO,zo,payTp,payMnth,payYear,summaAdd,false,1,kd_ptv,kd_nzp,1);
               if rec6=nil then
                  begin
                       rec6     := addToF6(curr_Person^.TABNO,zo,payTp,payMnth,payYear,summaAdd,false,1,kd_ptv,kd_nzp);
                       rec6^.w_r:=2;
                       rec6^.otk:=0;
                  end;
          end;
//       nzp:=OTPUSK_BEZ_DAY(1,CURR_PERSON);
  end;

procedure TFormRepF4.fillMatHelpPerson(curr_person:person_ptr);
// ���������� ������������ ������
// ������ �� 106-�� �������������
// ���� ������� �� ����������
  var rec6:pRec6;
      i:integer;
      summaAdd:real;
      summaNotSciPedAdd:real;
      summaSciPedAdd:real;
      payTp:integer;
      zo,payYear,payMnth:integer;
      kd_ptv:integer;
      kd_nzp:integer;
    function getSummaMatHelpAddForPerson(curr_person:PERSON_PTR):Real;
      var retVal:Real;
          curr_add:ADD_PTR;
      begin
          retVal:=0;
          curr_add:=curr_person.ADD;
          while (curr_add<>nil) do
             begin
                  if (curr_add^.shifr in [139]) then
                     retVal:=retVal+curr_add^.SUMMA;
                  curr_add:=curr_add.NEXT;
             end;
          getSummaMatHelpAddForPerson:=retVal;
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
               if retVal>LenMonth(encodeDate(wantedYear,wantedMonth,1)) then
                  retVal:=LenMonth(encodeDate(wantedYear,wantedMonth,1));

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
               if retVal>LenMonth(encodeDate(wantedYear,wantedMonth,1)) then
                  retVal:=LenMonth(encodeDate(wantedYear,wantedMonth,1));
           kd_Nzp:=OTPUSK_BEZ_DAY(1,curr_person);
      end;

  begin
  //     Exit;  // - ��������� ���
       if nsrv<>106 then exit;
//       if DOG_POD_PODRAZD(nsrv) then exit;
       if (curr_person^.tabno=506)
         then
            zo:=25;

       summaAdd:=getSummaMatHelpAddForPerson(curr_person);
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
               payYear  := wantedYear;
               payMnth  := wantedMonth;
               rec6     := addSummaToF6(curr_Person^.TABNO,zo,payTp,payMnth,payYear,summaAdd,false,1,kd_ptv,kd_nzp,1);
               if rec6=nil then
                  begin
                      rec6     := addToF6(curr_Person^.TABNO,zo,payTp,payMnth,payYear,summaAdd,false,1,kd_ptv,kd_nzp);
                      rec6^.w_r:=2;
                      rec6^.zo:=1;
                      rec6^.exp:=1;
                      rec6^.otk:=0;
                  end
          end;
       if abs(summaNotSciPedAdd)>0.01 then
          begin
               zo       := 1;
               summaAdd := summaNotSciPedAdd;
               payTp    := 0;
               payYear  := wantedYear;
               payMnth  := wantedMonth;
//               rec6     := addToF6(curr_Person^.TABNO,zo,payTp,payMnth,payYear,summaAdd,false,1,kd_ptv,kd_nzp);
               rec6     := addSummaToF6(curr_Person^.TABNO,zo,payTp,payMnth,payYear,summaAdd,false,1,kd_ptv,kd_nzp,1);
               if rec6=nil then
                  begin
                       rec6     := addToF6(curr_Person^.TABNO,zo,payTp,payMnth,payYear,summaAdd,false,1,kd_ptv,kd_nzp);
                       rec6^.w_r:=2;
                       rec6^.otk:=0;
                  end;
          end;
//       nzp:=OTPUSK_BEZ_DAY(1,CURR_PERSON);
  end;


  procedure TFormRepF4.fillIllPerson(curr_person:person_ptr);
  var i:integer;
      zo,payTp,payYear,payMnth:integer;
      otk,nrc:integer;
      kd_np:integer;
      rec6:pRec6;
    procedure fillIllPersonInner;
      var curr_add:add_ptr;
          recIll:pRecIll;
          i:integer;
          finded:boolean;
          shifrwr:Integer;
      begin
           kd_np:=ILL_DAY(1,curr_person);
           curr_add:=curr_person^.ADD;
           while (curr_add<>nil) do
             begin
                  if IsBolnShifrForECB(curr_add^.SHIFR) then
                     begin
                          if curr_person^.tabno=12280 then
                             shifrwr:=1;
                          shifrWr := 1;
                          shifrWr := getShifrWrForBoln(curr_person^.TABNO,curr_add^.summa,curr_add^.YEAR,curr_add^.period);
                          if curr_person^.MESTO_OSN_RABOTY=82 then
                             shifrwr := 2; 
                          if shifrWr=2 then
                             shifrWr:=2;
                          finded:=false;
                          if listIll.Count>0 then
                             for i:=0 to listIll.Count-1 do
                                 begin
                                      if (
                                          (pRecIll(listIll.Items[i]).tabno=curr_person^.tabno)
                                          and
                                          (pRecIll(listIll.Items[i]).pay_mnth=curr_add^.PERIOD)
                                          and
                                          (pRecIll(listIll.Items[i]).pay_year=curr_add^.year+1990)
                                          and
                                          (pRecIll(listIll.Items[i]).shifrwr=shifrwr)) then
                                          begin
                                               pRecIll(listIll.Items[i])^.summa:=pRecIll(listIll.Items[i])^.summa + curr_add^.SUMMA;
                                               if ((curr_add^.WORK_DAY>0) and (curr_add^.WORK_DAY<32)) then
                                                  pRecIll(listIll.Items[i])^.amntOfBDay:=pRecIll(listIll.Items[i])^.amntOfBDay + curr_add^.WORK_DAY;
                                               finded := true;
                                               break;
                                          end;
                                 end;
                          if not finded then
                             begin
                                  new(recIll);
                                  recIll^.tabno    := curr_person^.TABNO;
                                  recIll^.summa    := curr_add^.SUMMA;
                                  recIll^.pay_mnth := curr_Add^.PERIOD;
                                  recIll^.pay_Year := curr_add^.YEAR+1990;
                                  recIll^.kdNp     := kd_np;
                                  recIll^.shifrwr  := shifrwr;
                                  if ((curr_add^.WORK_DAY>0) and (curr_add^.WORK_DAY<32)) then
                                      begin
                                           recIll.amntOfBDay:= curr_add^.WORK_DAY;
                                           recIll^.kdNp     := recIll.amntOfBDay;
                                      end
                                  else
                                      recIll.amntOfBDay:= 0;
                                  AddCashObject.addToCash(curr_person,curr_add);
                                  listIll.Add(recIll);
                             end;
                     end;
                  curr_add:=curr_add^.NEXT;
             end;

      end;
 begin
       emptyIllOtpLists;
       listIll:=TList.Create;
       listIllSowm:=TList.Create;
       fillIllPersonInner;
       otk:=1;
       if curr_person^.MESTO_OSN_RABOTY in [82,121] then otk:=0;
       if listIll.count>0 then
          for i:=0 to listIll.count-1 do
             if abs(precIll(listIll.Items[i])^.summa)>0.007 then
              begin
                   zo:=29;
                   payTp:=0;
                   otk:=1;
                   nrc:=0;
                   if precIll(listIll.Items[i])^.shifrwr=2 then
                      begin
                           otk:=0;
                           nrc:=1;
                      end;
                   payYear:=precIll(listIll.Items[i])^.pay_Year;
                   payMnth:=precIll(listIll.Items[i])^.pay_mnth;
                 //addToF6(TABNO,zo,payTp,payMnth,payYear:integer;summaAdd:real;needZero:boolean=false;otk:integer=1;kd_ptv:integer=0;kd_nzp:integer=0;w_r:integer=0;nrc:Integer=0):pRec6;
                   if precIll(listIll.Items[i])^.shifrwr<>2 then
                      rec6:=addToF6(curr_person^.TABNO,zo,payTp,payMnth,payYear,precIll(listIll.Items[i])^.summa,false,otk)
                   else
                      rec6:=addToF6(curr_person^.TABNO,zo,payTp,payMnth,payYear,precIll(listIll.Items[i])^.summa,false,otk,0,0,precIll(listIll.Items[i])^.shifrwr,nrc);
                   rec6^.nrc:=nrc;
                   rec6^.otk:=otk;
                   if ((precIll(listIll.Items[i])^.amntOfBDay>0) and
                       (precIll(listIll.Items[i])^.amntOfBDay<31)) then
                       rec6^.kdNp := precIll(listIll.Items[i])^.amntOfBDay;
                   if precIll(listIll.Items[i])^.shifrwr=2 then
                       rec6^.w_r:=2;


              end;
       emptyIllOtpLists;

 end;
procedure TFormRepF4.fillBolDay;
  var i:integer;
      bolDays,dekrBolDays:integer;
      listIllSowm6:TList;
      bolDaySwom:Integer;
      bolSummaSowm:Real;
      amntOfbDayOsn: Integer;
      summaBolOsn:Real;
      amntOfbDaySowm: Integer;
      summaBolSowm:Real;
      rec6:pRec6;

  begin
       listIllSowm6:=TList.Create;
       if list6.Count>0 then
          for i:=0 to list6.Count-1 do
              // ��������� ���������� 42 - � 43 - ���
              // ZO 29 - ����������
              //    36 - ���������� ���������
              //    42 - ���������
              //    43 - ��������� ���������
              if pRec6(list6.items[i]).zo in [29,36,42] then
              if pRec6(list6.items[i]).kdnp<1 then
                 begin
                      if pRec6(list6.items[i])^.tabno=12280 then
                         bolDays:=0;
                      bolDays:=0;
                      dekrBolDays:=0;
                      bolDays:=getBolDay(pRec6(list6.items[i]).tabno,pRec6(list6.items[i]).payYear,pRec6(list6.items[i]).payMnth,
                            amntOfbDayOsn,summaBolOsn,amntOfbDaySowm,summaBolSowm);
                      dekrBolDays:=getDekrBolDay(pRec6(list6.items[i]).tabno,pRec6(list6.items[i]).payYear,pRec6(list6.items[i]).payMnth);
                      if (dekrBolDays>0) then
                         begin
                              if pRec6(list6.items[i]).zo=29 then
                                 pRec6(list6.items[i]).zo:=42
                              else
                                 pRec6(list6.items[i]).zo:=43;
                         end;
//                      splitBilList(pRec6(list6.items[i]).tabno,pRec6(list6.items[i]).payYear,pRec6(list6.items[i]).payMnth,bolDaySwom,bolSummaSowm);
                      if (bolDays>0) then
                         pRec6(list6.items[i]).kdNp:=bolDays;
                      if Abs(Abs(summaBolOsn+summaBolSowm)-Abs(pRec6(list6.items[i]).sumTotal))<0.01 then
                         begin
                      if Abs(summaBolOsn)>0.01 then
                         begin
                              pRec6(list6.items[i]).sumTotal:=summaBolOsn;
                              pRec6(list6.items[i]).sumMax:=summaBolOsn;
                         end;
                      if amntOfbDaySowm>0 then
                         begin
                              New(rec6);
                              Move(pRec6(list6.items[i])^,rec6^,SizeOf(rec6^));
//                              rec6.id:= pRec6(list6.items[i]).id;
//                              rec6.yearVy:=pRec6(list6.items[i]).yearVy
//                              rec6.MonthVy:=pRec6(list6.items[i]).monthVy;
//                              rec6.tabno:=pRec6(list6.items[i]).tabno;
//                              rec6.periodM:=pRec6(list6.items[i]).periodM;
//                              rec6.periodY:=pRec6(list6.items[i]).periodY;
//                              rec6.rowNum:=pRec6(list6.items[i]).rowNum;
//                              rec6.ukrGromad:=pRec6(list6.items[i]).ukrGromad;
//                              rec6.st:=pRec6(list6.items[i]).st;
//                              rec6.numIdent:=pRec6(list6.items[i]).st;
//                              fillChar
                              rec6.id:=FormRepF4.GetMaxId6+1;
                              rec6.otk:=0;
                              rec6.nrc:=1;
                              rec6.kdNp:=amntOfbDaySowm;
                              rec6.sumMax:=summaBolSowm;
                              rec6.sumTotal:=summaBolSowm;
                              listillSowm6.Add(rec6);
                         end;
                         end;
                      if (dekrBolDays>0) then
                          begin
                               pRec6(list6.items[i]).kdVp:=bolDays+dekrBolDays;
                               pRec6(list6.items[i]).kdPtv:=pRec6(list6.items[i]).kdVp;
                          end;
                 end;
       if listIllSowm6.count>0 then
          begin
               for i:=0 to listIllSowm6.Count-1 do
                   begin
                         New(rec6);
                         Move(pRec6(listIllSowm.items[i])^,rec6^,SizeOf(rec6^));
//                         list6.Add(rec6);
                   end;
          end;
       if listIllSowm6.count>0 then
          for i:=0 to listIllSowm6.count-1 do
              begin
                   dispose(pRec6(listIllSowm6.Items[i]));
              end;

       listIllSowm6.Free;
       listIllSowm6:=nil;

  end;

procedure TFormRepF4.fillOtpPerson(curr_person:person_ptr);
  var i:integer;
      zo,payTp,payYear,payMnth:integer;
      otk,nrc:integer;
      rec6:pRec6;
    function getZOForOtp:integer;
      var retVal:integer;
      begin
           retVal:=1;
           if isSciPedForSwod(curr_Person) then
              if IS_OSN_WID_RABOTY(curr_Person) then
                 retVal:=25;
//              else
//             if not isSciPedOsnInList(curr_person^.tabno) then
//                 retVal:=1;
           getZOForOtp:=retVal;
      end;
    procedure fillOtpPerson;
      var curr_add:add_ptr;
          recIll:pRecIll;
          i:integer;
          finded:boolean;
          shifrwr:Integer;
      begin
           shifrwr:=curr_person^.WID_RABOTY;
           if shifrwr<> 2 then
              shifrwr:=1;
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
                                          (pRecIll(listOtp.Items[i]).pay_year=curr_add^.year+1990)
                                          and
                                          (pRecIll(listOtp.Items[i]).shifrwr=shifrwr)) then
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
                                  recIll^.shifrwr  := shifrwr;
                                  listOtp.Add(recIll);
                                  AddCashObject.addToCash(curr_person,curr_add);
                             end;
                     end;
                  curr_add:=curr_add^.NEXT;
             end;
      end;
 begin
       emptyIllOtpLists;
       listOtp:=TList.Create;
       if curr_person^.tabno=3977 then
          otk:=0;
       fillOtpPerson;
       otk:=1;
       nrc:=0;
       if curr_person^.MESTO_OSN_RABOTY in [82,121] then
          otk:=0;
       if curr_person^.WID_RABOTY=2 then
          begin
               otk:=0;
               nrc:=1;
          end
       else
          begin
               otk:=1;
               nrc:=0;
          end;
       if listOtp.count>0 then
          for i:=0 to listOtp.count-1 do
             if abs(precIll(listOtp.Items[i])^.summa)>0.007 then
              begin
                   zo:=getZoForOtp;          //????????
                   payTp:=10;
                   payYear:=precIll(listOtp.Items[i])^.pay_Year;
                   payMnth:=precIll(listOtp.Items[i])^.pay_mnth;
                   if precIll(listOtp.Items[i])^.shifrwr<>2 then
                      rec6:=addToF6(curr_person^.TABNO,zo,payTp,payMnth,payYear,precIll(listOtp.Items[i])^.summa,false,otk)
                   else
      //                rec6:=addToF6(curr_person^.TABNO,zo,payTp,payMnth,payYear,precIll(listIll.Items[i])^.summa,false,otk,0,0,precIll(listIll.Items[i])^.shifrwr,nrc);
                      rec6:=addToF6(curr_person^.TABNO,zo,payTp,payMnth,payYear,precIll(listOtp.Items[i])^.summa,false,otk,0,0,2,nrc);

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
      finded:boolean;
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
                      (curr_add^.shifr=139) // ������� �� ����������
                      or
                      (curr_add^.shifr=141) // ��� ������ �� ����������
                      or
                      (curr_add^.shifr=VYHODNOE_POSOBIE_SHIFR) // �������� �������
                      ) then
                      begin
                           retVal:=retVal+curr_add^.SUMMA;
                           AddCashObject.addToCash(curr_person,curr_add);
                      end;
                  curr_add:=curr_add.NEXT;
             end;
          getSummaOsnAddForPerson:=retVal;
      end;
 begin
       if not DOG_POD_PODRAZD(nsrv) then exit;
  //     if  not curr_person^.MESTO_OSN_RABOTY  in [16,82,121] then exit;
       summaAdd:=getSummaOsnAddForPerson(curr_person);
       if abs(summaAdd)>0.01  then
          begin
               zo       := 26;     //
               summaAdd := summaAdd;
               payTp    := 0;
               payYear  := wantedYear;
               payMnth  := wantedMonth;
               rec6:=addToF6(curr_Person^.TABNO,zo,payTp,payMnth,payYear,summaAdd,false,0);
               if curr_Person^.TABNO=11982 then
                  zo:=26;

               shifrDogDetId:=GET_IDDOGPODFORSOWM_PERSON(CURR_PERSON);
               if shifrDogDetId<=0 then
                  shifrDogDetId:=GET_IDDOGPODFORSOWM_PERSON_FROM_SQL(CURR_PERSON);
              if curr_person^.MESTO_OSN_RABOTY<>82 then
                  shifrDogDetId:=0;

               if ((NMES=4) and (wantedYear=2020)) then
                  begin
                        if curr_person^.tabno=11986 then
                           shifrDogDetId:=-1
                        else
                        if (shifrDogDetId<0) then
                           case curr_person^.tabno of
                                6626:  shifrDogDetId:=139;
                               11981:  shifrDogDetId:=129;
                               11982:  shifrDogDetId:=128;
                               12249:  shifrDogDetId:=130;
                               12175:  shifrDogDetId:=108;
                               12238:  shifrDogDetId:=137;
                               12060:  shifrDogDetId:=131;
                               12271:  shifrDogDetId:=133;
                               12711:  shifrDogDetId:=132;
                           end;
//6626 ������  139
// 11982 ������� � �  128
//11981 ������� � �   129
//12 249 �������� � �  130
//12175 �������     108 --140
//12238 ����       137
//12060 ������ � �     131
//12271 ������ � �           133
//����� � �  ������ ------------- 11986
//11711 ����� � � ��������  132

 // ������  ��� ���������� �� ����������
 // �������� � � �������� �� ��� ������ ���� ������ � 1 � ��� ��� ���� ��� ���������� �� ����� ������
// ���� - ���� ������ - 25
                  end;
               finded:=false;
               if listCPH.count>0 then
                  for i:=0 to listCPH.count-1 do
                      if pRecCPH(listCPH.items[i])^.tabno=curr_person^.tabno then
                        begin
                             finded:=true;
                             break;
                        end;
               if not finded  then
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
                  if not (isotpshifr(curr_add^.shifr)) then
                     begin
                          retVal:=retVal+curr_add^.SUMMA;
                          AddCashObject.addToCash(curr_person,curr_add);
                     end;
                  curr_add:=curr_add.NEXT;
             end;
          getSummaOsnAddForPerson:=retVal;
      end;
 begin
       if not (nsrv in [11,102]) then exit;
               if curr_person^.tabno=11626 then
                  curr_person^.MALO:=0;
       summaAdd:=getSummaOsnAddForPerson(curr_person);
       if abs(summaAdd)>0.01  then
          begin
               if curr_person^.tabno=29 then
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
                       rec6:=addToF6(curr_Person^.TABNO,zo,0,wantedMonth,wantedYear,summaAdd);
                       rec6.w_r:=curr_person^.WID_RABOTY;
                       if curr_person^.MESTO_OSN_RABOTY=82 then
                          begin
                               rec6.otk:=0;
                               if ((curr_person^.KATEGORIJA=1)
                                  and
                                  (curr_person^.tabno<>4424)) // �������� �������
                               then
                               rec6.zo:=25
                               else
                               rec6.zo:=1;
                          end
                  end;
          end;

 end;
procedure TFormRepF4.fillCheckPerson(curr_person:person_ptr);
  var i:integer;
      kd_Nzp:integer;
   procedure addpersonToCheckList;
    var i,j       : integer;
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

         if (curr_person^.oklad>0.01) and
            (not DOG_POD_PODRAZD(nsrv)) and
            (not (NSRV in [11,91,102]))then   // 91 ����c���� ���������
            begin
                 if curr_person^.TABNO=9162 then
                    j:=1;
                 recPerson^.summaKoef:=recPerson^.summaKoef+GET_KOEF_OKLAD_PERSON(curr_person);
            end;
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
     otkimp,zoimp,expimp : Integer;
     finded:Boolean;
 procedure fillZOFromRec6;
  var i:integer;

  begin
       zo:=1;
       if list6.Count>0 then
          for i:=0 to list6.Count-1 do
              if pRec6(list6.Items[i]).tabno=tabno then
              if pRec6(list6.Items[i]).zo in [1,2,25,32,42] then//42 ���� ����
                 begin
                      zoimp:=pRec6(list6.Items[i]).zo;
                      otkimp:=pRec6(list6.Items[i]).otk;
                      expimp:=pRec6(list6.Items[i]).exp;
                      break;
                 end;
  end;
 procedure makeNrcForMinSal(tabno:integer);
  var i:integer;
   // ��� ��������� ����� ���������, �������� ������� �� ��� ��������
   // NRC=1 ����� �������� �������

  begin
       zo:=1;
       if list6.Count>0 then
          for i:=0 to list6.Count-1 do
              if pRec6(list6.Items[i]).tabno=tabno then
              if pRec6(list6.Items[i]).zo in [1,2,25,32,42] then
                //<>26 - ���� �������
                 begin
                      pRec6(list6.Items[i]).nrc:=1;
                 end;
  end;

 begin
      payTp:=13;
      zo:=1;
      otkimp:=0;
      zoimp:=1;
      expimp:=0;
      payYear:=wantedYear;
      payMnth:=wantedMonth;
      dsMinSal.Params[0].Value:=wantedYear;
      dsMinSal.Params[1].Value:=wantedMonth;
      dsMinSal.Transaction.StartTransaction;
      dsMinSal.Open;
      while not dsMinSal.Eof do
         begin
              tabno := dsMinSalTABNO.Value;
              if tabno=12023 then
                 zo:=1;
              summa := dsMinSalSUMMA_RAZN.Value;
              fillZOFromRec6;
              rec6:=addToF6(TABNO,zo,payTp,payMnth,payYear,summa);
              rec6.nrc:=1;  // ��� ������ NRC:=1 15 05 2020 �����������
              rec6.otk:=otkimp;
              rec6.exp:=expimp;
              makeNrcForMinSal(Tabno); // ���������� NRC ��� ���� ������� ���� ���� �������
                                       // ����� �������� �������
              dsMinSal.Next;
         end;
//      makeNrcForMinSal;
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
      list5UsedPris:=TList.Create;
      fillTable5FromFilledPrikazy; // ��������� ������ � �� ���������
                                   // ��������� ����������� ��������
                                   // � � � ������� ������� ZO � ������� � ������� 5

      fillTable5PrinjatUwolen;
//      fillTable5Perevody;
      fillTable5CPH;
  //    fillTable5Dekr;
//--      fillTable5SowmPri;
//--      fillTable5SowmUw;
      if list5UsedPris.Count>0 then
         for i:=0 to list5UsedPris.Count-1 do
             Dispose(PInteger(list5UsedPris.Items[i]));
      list5UsedPris.Free

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
      dsPrinjatUwolen.Params[0].Value:=wantedYear;
      dsPrinjatUwolen.Params[1].Value:=wantedMonth;
      dsPrinjatUwolen.Params[2].Value:=wantedYear;
      dsPrinjatUwolen.Params[3].Value:=wantedMonth;
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
             startDt:=0;
             endDt:=0;// lenMonth(encodeDate(wantedYear,wantedMonth,1));
             if ((yearOf(datePri)=wantedYear) and (monthOf(datePri)=wantedMonth)) then
                startDt:=dayOf(datePri);
             if ((yearOf(dateUw)=wantedYear) and (monthOf(dateUw)=wantedMonth)) then
                endDt:=dayOf(dateUw);
             reasonUwol:='';
             if codeUwol>0 then
                begin
                     SQLStmnt:='select first 1 coalesce(a.reason,'''') from tb_dismis a where id='+intToStr(codeUwol);
                     v:=SQLQueryValue(SQLStmnt);
                     if VarIsStr(v) then
                        reasonUwol:=trim(ReplToUkrI(ReplQto2Q(v)));
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
                     rec5.YEARVY:=wantedYear;
                     rec5.monthVy:=wantedMonth;
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
                     finded:=false;
                     if list5.Count>0 then
                        for i:=0 to list5.Count-1 do
                            if prec5(list5.items[i]).NUMIDENT = rec5.NUMIDENT then
                            if prec5(list5.items[i]).START_DT = rec5.START_DT then
                            if prec5(list5.items[i]).END_DT   = rec5.END_DT then
                            if prec5(list5.items[i]).PID_ZV   = rec5.PID_ZV then
                               begin
                                    finded:=True;
                                    BREAK;
                               end;

                     if not finded then
                        list5.Add(rec5);
                end;
             dsPrinjatUwolen.Next;
        end;
      dsPrinjatUwolen.Close;
      dsPrinjatUwolen.Transaction.commit;
 end;
procedure TFormRepF4.fillTable5PrinjatUwolenFromPrikazy;
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
     KODZKPPTR,KODKP:string;
     namedol,nameprof:string;
     shifrIdTyp:Integer;
     NomerPrik:string;
     DatePrik:TDateTime;
     d,m,y:Integer;
     ds,ms,ys:string;
 begin
      dsPriUwPrik.Params[0].Value:=wantedYear;
      dsPriUwPrik.Params[1].Value:=wantedMonth;
      dsPriUwPrik.Transaction.StartTransaction;
      dsPriUwPrik.Open;
      while (not dsPriUwPrik.Eof) do
        begin
             tabno      := dsPriUwPrikTABNO.value;
             datePri    := encodedate(1990,1,1);
             dateUw     := encodedate(1990,1,1);
             DatePrik   := encodedate(1990,1,1);
             NomerPrik  := '';
             KODZKPPTR  := '';
             KODKP      := '';
             codeUwol   := 0;
             namedol    := '';
             nameprof   := '';
             shifrIdTyp := dsPriUwPrikSHIFRIDTYP.Value;
             if not dsPriUwPrikDATABEG.IsNull then
                if shifridTyp=13 then             // ����������
                   datePri := dsPriUwPrikDATABEG.value
                else
                   dateUw  := dsPriUwPrikDATABEG.value;
             if shifrIdTyp=5 then
                if not dsPriUwPrikDATAEND.IsNull then
                   dateUw:=dsPriUwPrikDATAEND.value;
             if not dsPriUwPrikKODZKPPTR.IsNull then
                KODZKPPTR:=dsPriUwPrikKODZKPPTR.Value;
             if not dsPriUwPrikKODKP.IsNull then
                KODKP:=dsPriUwPrikKODKP.Value;
             if not dsPriUwPrikNAMEDOL.IsNull then
                nameDol:=Trim(dsPriUwPrikNAMEDOL.Value);
             if not dsPriUwPrikNAMEPROF.IsNull then
                namePROF:=Trim(dsPriUwPrikNAMEPROF.Value);
             if not dsPriUwPrikDATAPRIK.IsNull then
                   DatePrik:=dsPriUwPrikDATAPRIK.value;
             if not dsPriUwPrikNOMERPRIK.IsNull then
                   NomerPrik:=Trim(dsPriUwPrikNOMERPRIK.value);

             startDt:=1;
             endDt:=lenMonth(encodeDate(wantedYear,wantedMonth,1));
             if ((yearOf(datePri)=wantedYear) and (monthOf(datePri)=wantedMonth)) then
                startDt:=dayOf(datePri);
             if ((yearOf(dateUw)=wantedYear) and (monthOf(dateUw)=wantedMonth)) then
                endDt:=dayOf(dateUw);
             reasonUwol:='';
             if codeUwol>0 then
                begin
                     SQLStmnt:='select first 1 coalesce(a.reason,'''') from tb_dismis a where id='+intToStr(codeUwol);
                     v:=SQLQueryValue(SQLStmnt);
                     if VarIsStr(v) then
                        reasonUwol:=trim(ReplToUkrI(ReplQto2Q(v)));
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
                     rec5.YEARVY  := wantedYear;
                     rec5.monthVy := wantedMonth;
                     rec5.tabno   := tabno;
                     rec5.PERIODM := rec5.monthVy;
                     rec5.PERIODY := rec5.yearVy;
                     if finded6 then
                        rec5.UKRGROMAD:=rec6.ukrGromad
                     else
                        rec5.UKRGROMAD:=1;
                     rec5.NUMIDENT := trim(recPerson.numIdent);
                     rec5.FIO      := trim(recPerson.fio);
                     rec5.NM       := trim(recPerson.nm);
                     rec5.FTN      := trim(recPerson.ftn);
                     rec5.START_DT := startDt;
                     rec5.END_DT   := endDt;
                     rec5.ZO       := zo;
                     rec5.pid      := '����� �i� '+FormatDate(DatePrik)+' '+trim(nomerPrik);
                     if shifridTyp=5 then
                        begin
//                             rec5.ZKPP := Trim(KODZKPPTR);
                             rec5.ZKPP := Trim(KODKP);
                             rec5.pnr  := Trim(nameprof);  //������i������� ����� ������
//                           rec5.kp  := Trim(KODKP);      //��� ����i�i������ ������ii
                             rec5.POS  := Trim(namedol);
                        end
                     else
                     if shifrIdTyp=13 then
                        rec5.PID_ZV := reasonUwol;
                     list5.Add(rec5);
                end;
             dsPriUwPrik.Next;
        end;
      dsPriUwPrik.Close;
      dsPriUwPrik.Transaction.commit;
 end;
procedure TFormRepF4.fillTable5Perevody;
 var tabno:integer;
     i,j:integer;
     finded,finded6:boolean;
     rec5:pRec5;
     startDt,endDt,startDt1,endDt1,startDt2,endDt2:integer;
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
     idclassificator,idclassificator_old:integer;
     kodkp,kodkp_old : string;
     kodzkpptr,kodzkpptr_old : string;
     namedol,namedol_old : string;
     nameprof,nameprof_old : string;
     pid:string;
     vzv:string;
     VS,PIR:Integer;
     datebeg,dateend:TDatetime;

 begin
      VS:=0;
      PIR:=0;
      dsPerevody.Params[0].Value:=wantedYear;
      dsPerevody.Params[1].Value:=wantedMonth;
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
             if dsPerevodyDATABEG.IsNull then
                dateBeg:=encodedate(1990,1,1)
             else
                dateBeg:=dsPerevodyDATABEG.value;
             if dsPerevodyDATAEND.IsNull then
                dateend:=encodedate(1990,1,1)
             else
                dateEnd:=dsPerevodyDATAEND.value;
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
             if dsPerevodyIDCLASSIFICATOR_OLD.IsNull then
                idclassificator_old:=0
             else
                idclassificator_old:=dsPerevodyIDCLASSIFICATOR_OLD.value;
             if dsPerevodyKODKP.isNull then
                kodKp:=''
             else
                kodkp:=dsPerevodyKODKP.Value;
             if dsPerevodyKODKP_OLD.isNull then
                kodKp_old:=''
             else
                kodkp_old:=dsPerevodyKODKP_OLD.Value;
             if dsPerevodyKODZKPPTR.isNull then
                kodzkpptr:=''
             else
                kodzkpptr:=dsPerevodyKODZKPPTR.Value;
             if dsPerevodyKODZKPPTR_OLD.isNull then
                kodzkpptr_old:=''
             else
                kodzkpptr_old:=dsPerevodyKODZKPPTR_OLD.Value;
             if dsPerevodyNAMEDOL.isNull then
                nameDol:=''
             else
                nameDol:=dsPerevodyNAMEDOL.Value;
             if dsPerevodyNAMEDOL_OLD.isNull then
                nameDol_OLD:=''
             else
                nameDol_old:=dsPerevodyNAMEDOL_OLD.Value;
             if dsPerevodyNAMEPROF.isNull then
                nameProf:=''
             else
                nameprof:=dsPerevodyNAMEPROF.Value;
             if dsPerevodyNAMEPROF_OLD.isNull then
                nameProf_old:=''
             else
                nameprof_old:=dsPerevodyNAMEPROF_OLD.Value;
             startDt:=1;
             endDt:=1;
             if ((yearOf(datePri)=wantedYear) and (monthOf(datePri)=wantedMonth)) then
                startDt:=dayOf(datePri);
             if ((yearOf(dateUw)=wantedYear) and (monthOf(dateUw)=wantedMonth)) then
                endDt:=dayOf(dateUw);
             startDt1:=startDt;
             endDt1:=endDt;
             startDt2:=startDt;
             endDt2:=endDt;
             if ((monthOf(datebeg)=NMES) and (YearOf(datebeg)=wantedYear)) then
                begin
                     startDt1:=DayOf(datebeg);
                     endDt2:=StartDt1-1;
                     if endDt2<1 then
                        enddt2:=1;
                end;                          
             reasonUwol:='';
             if codeUwol>0 then
                begin
                     SQLStmnt:='select first 1 coalesce(a.reason,'''') from tb_dismis a where id='+intToStr(codeUwol);
                     v:=SQLQueryValue(SQLStmnt);
                     if VarIsStr(v) then
                        reasonUwol:=trim(ReplToUkrI(ReplQto2Q(v)));
                end;
             pid:='';
             if ((yearOf(dataprik)>2017)
                and
                (length(trim(nomerprik))>0)) then
                begin
                    pid:='����� '+trim(nomerprik)+' �� ';
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
             zo:=1;       //������� ������ �� �i���������
             if not dsPerevodyZO.IsNull then
             if dsPerevodyZO.Value>0 then
                zo:=dsPerevodyZO.Value;
             if not dsPerevodyVS.IsNull then
             if dsPerevodyVS.Value>=0 then
                vs:=dsPerevodyVS.Value;
             if not dsPerevodyPIR.IsNull then
             if dsPerevodyPIR.Value>=0 then
                pir:=dsPerevodyPIR.Value;
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
                     rec5.YEARVY:=wantedYear;
                     rec5.monthVy:=wantedMonth;
                     rec5.tabno:=tabno;
                     rec5.PERIODM:=rec5.monthVy;
                     rec5.PERIODY:=rec5.yearVy;
                     rec5.UKRGROMAD:=rec6.ukrGromad;
                     rec5.NUMIDENT:=trim(recPerson.numIdent);
                     rec5.FIO:=trim(recPerson.fio);
                     rec5.NM:=trim(recPerson.nm);
                     rec5.FTN:=trim(recPerson.ftn);
                     rec5.START_DT:=startDt1;
                     rec5.END_DT:=endDt1;
                     rec5.ZO:=zo;
                     rec5.PID_ZV:=reasonUwol;
                     rec5.PNR:=trim(ReplToUkrI(ReplQto2Q(nameprof)));
                     rec5.ZKPP:=trim(ReplToUkrI(ReplQto2Q(kodzkpptr)));
                     rec5.prof:=trim(ReplToUkrI(ReplQto2Q(kodkp)));
                     rec5.POS:=trim(ReplToUkrI(ReplQto2Q(namedol)));
                     rec5.PID:=trim(pid);
                     rec5.VZV:=trim(vzv);
                     rec5.VS := VS;
                     rec5.PIR:=PIR;
                     list5.Add(rec5);
//                   ������ ������ - � ������ ���������
                     pid      := trim(copy(pid+space(250),1,250));
                     nameDol_old  := trim(copy(nameDol_old+space(250),1,250));
                     nameProf_old := trim(copy(nameProf_old+space(250),1,250));
                     kodzkpptr_old:= trim(copy(kodzkpptr_old+space(5),1,5));
                     kodkp_old    := trim(copy(kodkp_old+space(6),1,6));
                     vzv      := '';
                     pid:=trim(copy(pid+space(250),1,250));
                     new(rec5);
                     fillChar(rec5^,sizeOf(rec5^),0);
                     rec5.YEARVY:=wantedYear;
                     rec5.monthVy:=wantedMonth;
                     rec5.tabno:=tabno;
                     rec5.PERIODM:=rec5.monthVy;
                     rec5.PERIODY:=rec5.yearVy;
                     rec5.UKRGROMAD:=rec6.ukrGromad;
                     rec5.NUMIDENT:=trim(recPerson.numIdent);
                     rec5.FIO:=trim(recPerson.fio);
                     rec5.NM:=trim(recPerson.nm);
                     rec5.FTN:=trim(recPerson.ftn);
                     rec5.START_DT:=startDt2;
                     rec5.END_DT:=endDt2;
                     rec5.ZO:=zo;
                     rec5.PID_ZV:=reasonUwol;
                     rec5.PNR:=trim(ReplToUkrI(ReplQto2Q(nameprof_old)));
                     rec5.ZKPP:=trim(ReplToUkrI(ReplQto2Q(kodzkpptr_old)));
                     rec5.prof:=trim(ReplToUkrI(ReplQto2Q(kodkp_old)));
                     rec5.POS:=trim(ReplToUkrI(ReplQto2Q(namedol_old)));
                     rec5.PID:=trim(pid);
                     rec5.VZV:=trim(vzv);
                     rec5.VS := VS;
                     rec5.PIR:=PIR;
                     list5.Add(rec5);

                end;
             dsPerevody.Next;
        end;
      dsPerevody.Close;
      dsPerevody.Transaction.commit;
 end;
procedure TFormRepF4.fillTable5SowmPri;
//�������� ������������ - �������������
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
     Vs,pir:Integer;

 begin
      vs:=0;
      pir:=0;
      dsSowm.Params[0].Value:=wantedYear;
      dsSowm.Params[1].Value:=wantedMonth;
      dsSowm.Transaction.StartTransaction;
      dsSowm.Open;
      while (not dsSowm.Eof) do
        begin
             tabno:=dsSowmTABNO.value;
             if dsSowmDATABEG.IsNull then
                datePri:=encodedate(1990,1,1)
             else
                datePri:=dsSowmDATABEG.value;
             if dsSowmDATAEND.IsNull then
                dateUw:=encodedate(1990,1,1)
             else
                dateUw:=dsSowmDATAEND.value;
             if dsSowmCODE_UWOL.IsNull then
                codeUwol:=0
             else
                codeUwol:=dsSowmCODE_UWOL.Value;
             if dsSowmNOMERPRIK.IsNull then
                nomerprik:=''
             else
                nomerprik:=dsSowmNOMERPRIK.Value;
             if dsSowmDATAPRIK.IsNull then
                dataprik:=encodedate(1990,1,1)
             else
                dataprik:=dsSowmDATAPRIK.Value;
             if dsSowmIDCLASSIFICATOR.IsNull then
                idclassificator:=0
             else
                idclassificator:=dsSowmIDCLASSIFICATOR.value;
             if dsSowmKODKP.isNull then
                kodKp:=''
             else
                kodkp:=dsSowmKODKP.Value;
             if dsSowmKODZKPPTR.isNull then
                kodzkpptr:=''
             else
                kodzkpptr:=dsSowmKODZKPPTR.Value;
             if dsSowmNAMEDOL.isNull then
                nameDol:=''
             else
                nameDol:=dsSowmNAMEDOL.Value;
             if dsSowmNAMEPROF.isNull then
                nameProf:=''
             else
                nameprof:=dsSowmNAMEPROF.Value;
             startDt:=0;
             endDt:=0;
             if ((yearOf(datePri)=wantedYear) and (monthOf(datePri)=wantedMonth)) then
                startDt:=dayOf(datePri);
             if ((yearOf(dateUw)=wantedYear) and (monthOf(dateUw)=wantedMonth)) then
                endDt:=dayOf(dateUw);
             reasonUwol:='';
//             if codeUwol>0 then
//                begin
//                     SQLStmnt:='select first 1 coalesce(a.reason,'''') from tb_dismis a where id='+intToStr(codeUwol);
//                     v:=SQLQueryValue(SQLStmnt);
//                     if VarIsStr(v) then
//                        reasonUwol:=trim(ReplToUkrI(ReplQto2Q(v)));
//                end;
             pid:='';
             if ((yearOf(dataprik)>2017)
                and
                (length(trim(nomerprik))>0)) then
                begin
                    pid:='����� '+trim(nomerprik)+' �� ';
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
             zo:=2;       //������� ������ �� ����������
             if not dsSowmZO.isNull then
             if dsSowmZO.Value>0 then
                zo:=dsSowmZO.Value;
             if not dsSowmVS.isNull then
             if dsSowmVS.Value>=0 then
                vs:=dsSowmVS.Value;
             if not dsSowmPIR.isNull then
             if dsSowmPIR.Value>=0 then
                PIR:=dsSowmPIR.Value;

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
             if not finded6 then
                zo:=2;
             if finded6 then
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
                     rec5.YEARVY:=wantedYear;
                     rec5.monthVy:=wantedMonth;
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
                     rec5.PNR:=trim(ReplToUkrI(ReplQto2Q(nameprof)));
                     rec5.ZKPP:=trim(ReplToUkrI(ReplQto2Q(kodzkpptr)));
                     rec5.prof:=trim(ReplToUkrI(ReplQto2Q(kodkp)));
                     rec5.POS:=trim(ReplToUkrI(ReplQto2Q(namedol)));
                     rec5.PID:=trim(pid);
                     rec5.VZV:=trim(vzv);
                     rec5.VS := VS;
                     rec5.PIR:=PIR;
                     list5.Add(rec5);
                end;
             dsSowm.Next;
        end;
      dsSowm.Close;
      dsSowm.Transaction.commit;
 end;

procedure TFormRepF4.fillTable5SowmUw;
//��������� ������������ - �������������
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
     Vs,pir:Integer;

 begin
      vs:=1;
      pir:=0;
      dsSowmUw.Params[0].Value:=wantedYear;
      dsSowmUw.Params[1].Value:=wantedMonth;
      dsSowmUw.Transaction.StartTransaction;
      dsSowmUw.Open;
      while (not dsSowmUw.Eof) do
        begin
             tabno:=dsSowmUwTABNO.value;
             if tabno=8634 then
                vs:=1;
             if dsSowmUwDATABEG.IsNull then
                datePri:=encodedate(1990,1,1)
             else
                datePri:=dsSowmUwDATABEG.value;
             if dsSowmUwDATAEND.IsNull then
                dateUw:=encodedate(1990,1,1)
             else
                dateUw:=dsSowmUwDATAEND.value;
             if dsSowmUwCODE_UWOL.IsNull then
                codeUwol:=0
             else
                codeUwol:=dsSowmUwCODE_UWOL.Value;
             if dsSowmUwNOMERPRIK.IsNull then
                nomerprik:=''
             else
                nomerprik:=dsSowmUwNOMERPRIK.Value;
             if dsSowmUwDATAPRIK.IsNull then
                dataprik:=encodedate(1990,1,1)
             else
                dataprik:=dsSowmUwDATAPRIK.Value;
             if dsSowmUwIDCLASSIFICATOR.IsNull then
                idclassificator:=0
             else
                idclassificator:=dsSowmUwIDCLASSIFICATOR.value;
             if dsSowmUwKODKP.isNull then
                kodKp:=''
             else
                kodkp:=dsSowmUwKODKP.Value;
             if dsSowmUwKODZKPPTR.isNull then
                kodzkpptr:=''
             else
                kodzkpptr:=dsSowmUwKODZKPPTR.Value;
             if dsSowmUwNAMEDOL.isNull then
                nameDol:=''
             else
                nameDol:=dsSowmUwNAMEDOL.Value;
             if dsSowmUwNAMEPROF.isNull then
                nameProf:=''
             else
                nameprof:=dsSowmUwNAMEPROF.Value;
             startDt:=0;
             endDt:=0;
             if ((yearOf(datePri)=wantedYear) and (monthOf(datePri)=wantedMonth)) then
                startDt:=dayOf(datePri);
             if ((yearOf(dateUw)=wantedYear) and (monthOf(dateUw)=wantedMonth)) then
                endDt:=dayOf(dateUw);
             if ((startDt=0) and (endDt=0)) then
                begin
                      dsSowmUw.Next;
                      Continue;
                end;

             if startDt=0 then
                startDt:=1;
             if endDt=0 then
                endDt:=LenMonth(EncodeDate(wantedYear,wantedMonth,1));
             reasonUwol:='';
//             if codeUwol>0 then
//                begin
//                     SQLStmnt:='select first 1 coalesce(a.reason,'''') from tb_dismis a where id='+intToStr(codeUwol);
//                     v:=SQLQueryValue(SQLStmnt);
//                     if VarIsStr(v) then
//                        reasonUwol:=trim(ReplToUkrI(ReplQto2Q(v));
//                end;
             pid:='';
             if ((yearOf(dataprik)>2017)
                and
                (length(trim(nomerprik))>0)) then
                begin
                    pid:='����� '+trim(nomerprik)+' �� ';
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
             zo:=2;       //������� ������ �� ����������
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
             if not finded6 then
                zo:=2;
             if finded6 then
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
                     rec5.YEARVY:=wantedYear;
                     rec5.monthVy:=wantedMonth;
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
                     rec5.PNR:=trim(ReplToUkrI(ReplQto2Q(nameprof)));
                     rec5.ZKPP:=trim(ReplToUkrI(ReplQto2Q(kodzkpptr)));
                     rec5.prof:=trim(ReplToUkrI(ReplQto2Q(kodkp)));
                     rec5.POS:=trim(ReplToUkrI(ReplQto2Q(namedol)));
                     rec5.PID:=trim(pid);
                     rec5.VZV:=trim(vzv);
                     rec5.VS := VS;
                     rec5.PIR:=PIR;
                     list5.Add(rec5);
                end;
             dsSowmUw.Next;
        end;
      dsSowmUw.Close;
      dsSowmUw.Transaction.commit;
 end;

procedure TFormRepF4.fillTable5CPH;
 var tabno:integer;
     i,j:integer;
     finded,finded6:boolean;
     rec5:pRec5;
     startDt,endDt:integer;
     recCPH:pRecCPH;
     shifrDogDetId:integer;
     SQLStmnt:widestring;
     v,e:variant;
     dateFr,dateTo:TDateTime;
     code_uwol:integer;
     nomerDogGN,reasonOk:string;
     rec6:pRec6;
     recPerson:pRecPerson;
     zo:integer;
     dogovors:string;
     y,m,d:Integer;
     ds,ms,dateFrs:string;
     vs,pir:Integer;
 begin

     if listCPH.count<1 then exit;
     vs:=0;
     pir:=0;
     zo:=3;
     for i:=0 to listCPH.Count-1 do
         begin
              shifrDogDetId:=pRecCPH(listCPH.items[i]).shifrDogDetId;
              tabno:=pRecCPH(listCPH.items[i]).tabno;
              if tabno=11982 then
                 zo:=3;
              SQLStmnt := 'select count(*)';
              SQLStmnt := trim(SQLStmnt) + ' from tb_dogovora_gn_det';
              SQLStmnt := trim(SQLStmnt) + ' join kadry on kadry.tabno=tb_dogovora_gn_det.tabno';
              SQLStmnt := trim(SQLStmnt) + ' join person on person.tabno=kadry.tabno';
              SQLStmnt := trim(SQLStmnt) + ' join tb_dogovora_gn on tb_dogovora_gn.id=tb_dogovora_gn_det.iddog';
              SQLStmnt := trim(SQLStmnt) + ' where (person.yearvy='+intToStr(wantedYear)+' and person.monthvy='+intToStr(wantedMonth);
              SQLStmnt := trim(SQLStmnt) + ' and person.tabno='+intToStr(tabno)+' and tb_dogovora_gn_det.id='+intToStr(shifrDogDetId);
              SQLStmnt := trim(SQLStmnt) + ' and (select abs(coalesce(sum(fadd.summa),0)) from fadd where fadd.shifridperson=person.shifrid)>0.01)';
              SQLStmnt := trim(SQLStmnt) + ' and (person.w_place in (81,140))';
              v:=SQLQueryValue(SQLStmnt);
              if VarIsNull(v)      then continue;
              if VarIsEmpty(v)     then continue;
              if not VarIsNumeric(v) then continue;
              e:=v;
              if e<1 then Continue;
              SQLStmnt := 'select first 1 tb_dogovora_gn_det.datefr';
              SQLStmnt := trim(SQLStmnt) + ', tb_dogovora_gn_det.dateto';
              SQLStmnt := trim(SQLStmnt) + ', coalesce(kadry.code_uwol,0)';
              SQLStmnt := trim(SQLStmnt) + ', coalesce(tb_dogovora_gn.nomer,'''')';
              SQLStmnt := trim(SQLStmnt) + ', coalesce(tb_dogovora_gn_det.reasonok,'''')';
              SQLStmnt := trim(SQLStmnt) + ' from tb_dogovora_gn_det';
              SQLStmnt := trim(SQLStmnt) + ' join kadry on kadry.tabno=tb_dogovora_gn_det.tabno';
              SQLStmnt := trim(SQLStmnt) + ' join person on person.tabno=kadry.tabno';
              SQLStmnt := trim(SQLStmnt) + ' join tb_dogovora_gn on tb_dogovora_gn.id=tb_dogovora_gn_det.iddog';
              SQLStmnt := trim(SQLStmnt) + ' where (person.yearvy='+intToStr(wantedYear)+' and person.monthvy='+intToStr(wantedMonth);
              SQLStmnt := trim(SQLStmnt) + ' and person.tabno='+intToStr(tabno)+' and tb_dogovora_gn_det.id='+intToStr(shifrDogDetId);
              SQLStmnt := trim(SQLStmnt) + ' and (select abs(coalesce(sum(fadd.summa),0)) from fadd where fadd.shifridperson=person.shifrid)>0.01)';
              SQLStmnt := trim(SQLStmnt) + ' and (person.w_place in (81,140))';
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
              e:=trim(e);
              if length(e)<1 then
                 reasonOk := '��. 61 ���';
              reasonOk:=trim(copy(reasonOk+space(250),1,250));
              y:=yearOf(DateFr);
              if ((y<2017) or  (y>2030)) then
                  dateFr:=encodeDate(1990,1,1,);
              y:=yearOf(DateTo);
              if ((yearOf(DateTo)<2017) or  (yearOf(DateTo)>2030)) then
                  dateTo:=encodeDate(1990,1,1,);
              startdt:=1;
              enddt:=lenMonth(enCodeDate(wantedYear,wantedMonth,1));
              if ((yearOf(DateFr)=wantedYear) and (monthOf(dateFr)=wantedMonth)) then
                 startDt:=dayOf(DateFr);
              if ((yearOf(DateTo)=wantedYear) and (monthOf(dateTo)=wantedMonth)) then
                 endDt:=dayOf(DateTo);
             d:=DayOf(dateFr);
             m:=monthOf(dateFr);
             y:=YearOf(dateFr);
             ds:=IntToStr(d);
             if d<10 then ds:='0'+ds;
             ms:=IntToStr(m);
             if m<10 then ms:='0'+ms;
             dateFrS:=ds+'.'+ms+'.'+intToStr(y);
             dogovors:='�����i� �i� '+dateFrS+' '+nomerDogGN;
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
             zo:=3; // �-� 3?  //3 ������� ����������� 07 05 2020
             //��������� ���� ���� � ���� 5 �� ��������� �� ����
             finded:=False;
             if list5.Count>0 then
                for j:=0 to list5.Count-1 do
                    if pRecPerson(list5.Items[j]).tabno=tabno then
                       begin
                            finded:=true;
                            break;
                       end;
             if finded then Continue;
             //����� �������� �� ������������
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
                     rec5.YEARVY    := wantedYear;
                     rec5.monthVy   := wantedMonth;
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
                     rec5.PID_ZV:=trim(ReplToUkrI(ReplQto2Q(reasonOk)));
                     rec5.PID := dogovors;
                     rec5.VS := VS;
                     rec5.PIR:=PIR;
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
     pm1,pm2,py1,py2:integer;
     dateFr,dateTo:tDate;
     summaAdd : real ;
     payTp    : integer;
     payYear  : integer;
     payMnth  : integer;
     kdPtv    : integer;
     vs,pir:Integer;
 begin
      vs:=0;
      pir:=0;
      lm:=lenMonth(encodedate(wantedYear,wantedMonth,1));
      pm1:=wantedMonth;
      py1:=wantedYear;
      pm2:=pm1;
      py2:=py1;
      dateFr:=encodedate(py1,pm1,1);
      dateTo:=encodedate(py1,pm1,LenMonth(dateFr));

//      dsDekr.Params[0].Value:=pm1;
//      dsDekr.Params[1].Value:=py1;
//      dsDekr.Params[2].Value:=pm2;
//      dsDekr.Params[3].Value:=py2;
      dsDekr.Transaction.StartTransaction;
      dsDekr.Open;
      while (not dsDekr.Eof) do
        begin
             tabno:=dsDekrTABNO.value;
             startDt := 0;
             endDt   := 0;
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
             if (((monthOf(F_Data)=pm1)
                 and
                 (yearOf(F_Data)=py1))
                 or
                 ((monthOf(L_Data)=pm1)
                 and
                 (yearOf(L_Data)=py1))) then
                 begin
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
                      if ((yearOf(F_Data)=wantedYear)
                           and (monthOf(F_Data)=wantedMonth)) then
                         startdt:=dayOf(F_Data);
                      if ((yearOf(L_Data)=wantedYear)
                           and (monthOf(L_Data)=wantedMonth)) then
                         enddt:=monthOf(L_Data);
                      ZO:=modeIll;
                      if ((ZO<4) or (ZO>6)) then
                         ZO:=4;
                      if ((StartDt>0) or (enddt>0))  then
                         begin
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
         //    zo:=1;       //������� ������ �� ����������
                              if list6.Count>0 then
                                 for i:=0 to list6.Count-1 do
                                    if pRec6(list6.Items[i]).tabno=tabno then
                                       if pRec6(list6.Items[i]).zo in [1,2,25,26,32] then
                                          begin
   //                                          zo:=pRec6(list6.Items[i]).zo;
                                               rec6:=pRec6(list6.Items[i]);
                                               finded6:=true;
                                               break;
                                          end;
                              if recPerson<>nil then
                                 begin
//                                    pid      := trim(copy(pid+space(250),1,250));
//                                    nameDol  := trim(copy(nameDol+space(250),1,250));
//                                    nameProf := trim(copy(nameProf+space(250),1,250));
//                                    kodzkpptr:= trim(copy(kodzkpptr+space(5),1,5));
//                                    kodkp    := trim(copy(kodkp+space(6),1,6));
//                                    vzv      := '';
//                                    pid:=trim(copy(pid+space(250),1,250));
                                      new(rec5);
                                      fillChar(rec5^,sizeOf(rec5^),0);
                                      rec5.YEARVY:=wantedYear;
                                      rec5.monthVy:=wantedMonth;
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
                                      rec5.PNR:=trim(ReplToUkrI(ReplQto2Q(nameprof)));
                                      rec5.ZKPP:=trim(ReplToUkrI(ReplQto2Q(kodzkpptr)));
                                      rec5.prof:=trim(ReplToUkrI(ReplQto2Q(kodkp)));
                                      rec5.POS:=trim(ReplToUkrI(ReplQto2Q(namedol)));
                                      rec5.PID:=trim(pid);
                                      rec5.VZV:=trim(vzv);
                                      rec5.VS := VS;
                                      rec5.PIR:=PIR;
                                      list5.Add(rec5);
                                 end;
                         end;
                 end;
             if False then // 07 05 2020 ���������� �� ����������� � ���� 6 (�����������)
             if not ((F_data>dateTo) or (L_data<datefr)) then
                begin
                     zo       := 1;
                     summaAdd := 0.00;
                     payTp    := 0;
                     payYear  := wantedYear;
                     payMnth  := wantedMonth;
                     kdPtv    := LenMonth(dateTo);
                     kdPtv    := kdPtv - startDt - (lenMonth(dateTo)-endDt);
                     if kdPtv<0 then
                        kdPtv:=0;

//                      TABNO,zo,payTp,payMnth,payYear,summaAdd;needZero:boolean=false;otk:integer=1;kd_ptv:integer=0;kd_nzp:integer=0;w_r:integer=0):pRec6;

                     rec6:=addToF6(dsDekrTABNO.Value,zo,payTp,payMnth,payYear,summaAdd,true,1,kdPtv);
                end;
             dsDekr.Next;
        end;
      dsDekr.Close;
      dsDekr.Transaction.commit;
 end;

procedure TFormRepF4.fillTable5FromFilledPrikazy;
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
     //ZO - 1 ��������
     //     2 ������������
     KODZKPPTR,KODKP:string;
     namedol,nameprof:string;
     shifrIdTyp:Integer;
     NomerPrik:string;
     DatePrik:TDateTime;
     d,m,y:Integer;
     ds,ms,ys:string;
     needt5,vs,pir:Integer;
  procedure fillRec5Pri;
   begin
   //     if shifridTyp=5 then
           begin
                rec5.ZKPP := Trim(KODZKPPTR);
                rec5.pnr  := Trim(nameprof);  //������i������� ����� ������
//                rec5.PNR  := Trim(KODKP);     //��� ����i�i������ ������ii
                rec5.PROF := Trim(KODKP);     //��� ��������� �� �����������
                rec5.POS  := Trim(namedol);
                rec5.ZO   := zo;
                rec5.VS   := vs;
                rec5.PIR  := pir;
                rec5.END_DT:=0;
           end

   end;
  procedure fillRec5Uw;
   begin
   //     if shifridTyp=5 then
           begin
                rec5.PID_ZV:=reasonUwol;
                rec5.VS   := vs;
                rec5.PIR  := pir;
                rec5.START_DT:=0;
                rec5.ZKPP := Trim(KODZKPPTR);
                rec5.pnr  := Trim(nameprof);  //������i������� ����� ������
//                rec5.PNR  := Trim(KODKP);     //��� ����i�i������ ������ii
                rec5.PROF := Trim(KODKP);     //��� ��������� �� �����������
                rec5.POS  := Trim(namedol);
            end

   end;
  procedure fillRec5Perew;
   begin
   //     if shifridTyp=5 then
           begin
   //             rec5.PID_ZV:=reasonUwol;
                rec5.VS   := vs;
                rec5.PIR  := pir;
           end

   end;



 begin
      dsFilledPrikazy.Params[0].Value:=wantedYear;
      dsFilledPrikazy.Params[1].Value:=wantedMonth;
      dsFilledPrikazy.Transaction.StartTransaction;
      dsFilledPrikazy.Open;
      while (not dsFilledPrikazy.Eof) do
        begin
             tabno      := dsFilledPrikazyTABNO.value;
             datePri    := encodedate(1990,1,1);
             dateUw     := encodedate(1990,1,1);
             DatePrik   := encodedate(1990,1,1);
             NomerPrik  := '';
             KODZKPPTR  := '';
             KODKP      := '';
             codeUwol   := 0;
             namedol    := '';
             nameprof   := '';
             shifrIdTyp := dsFilledPrikazySHIFRIDTYP.Value;
        //     if shifridTyp in [5,9] then // 5-������� 9 - ������� ������������
        //     else
        //     if shifridTyp in [13,17] then // 13-������� 17 - ������� ������������


             if not dsFilledPrikazyDATABEG.IsNull then
                if shifridTyp in [5,9] then             // ����������
                   datePri := dsFilledPrikazyDATABEG.value
                else
                if shifridTyp in [13,17] then             // ����������
                   dateUw  := dsFilledPrikazyDATABEG.value;
//             if shifrIdTyp=5 then
//                if not dsFilledPrikazyDATAEND.IsNull then
//                   dateUw:=dsFilledPrikazyDATAEND.value;
             if not dsFilledPrikazyKODZKPPTR.IsNull then
                KODZKPPTR:=dsFilledPrikazyKODZKPPTR.Value;
             if not dsFilledPrikazyKODKP.IsNull then
                KODKP:=dsFilledPrikazyKODKP.Value;
             if not dsFilledPrikazyNAMEDOL.IsNull then
                nameDol:=Trim(dsFilledPrikazyNAMEDOL.Value);
             if not dsFilledPrikazyNAMEPROF.IsNull then
                namePROF:=Trim(dsFilledPrikazyNAMEPROF.Value);
             if not dsFilledPrikazyDATAPRIK.IsNull then
                   DatePrik:=dsFilledPrikazyDATAPRIK.value;
             if not dsFilledPrikazyNOMERPRIK.IsNull then
                   NomerPrik:=Trim(dsFilledPrikazyNOMERPRIK.value);
             needt5:=dsFilledPrikazyNEEDT5.value;
             zo:=dsFilledPrikazyZO.value;
             vs:=dsFilledPrikazyVS.value;
             pir:=dsFilledPrikazyPir.value;
             startDt:=1;
             endDt:=lenMonth(encodeDate(wantedYear,wantedMonth,1));
             if ((yearOf(datePri)=wantedYear) and (monthOf(datePri)=wantedMonth)) then
                startDt:=dayOf(datePri);
             if ((yearOf(dateUw)=wantedYear) and (monthOf(dateUw)=wantedMonth)) then
                endDt:=dayOf(dateUw);
             if not dsFilledPrikazyCODE_UWOL.IsNull then
                codeUwol:=dsFilledPrikazyCODE_UWOL.Value;

             reasonUwol:='';
             if codeUwol>0 then
                begin
                     SQLStmnt:='select first 1 coalesce(a.reason,'''') from tb_dismis a where id='+intToStr(codeUwol);
                     v:=SQLQueryValue(SQLStmnt);
                     if VarIsStr(v) then
                        reasonUwol:=trim(ReplToUkrI(ReplQto2Q(v)));
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
                     rec5.YEARVY  := wantedYear;
                     rec5.monthVy := wantedMonth;
                     rec5.tabno   := tabno;
                     rec5.PERIODM := rec5.monthVy;
                     rec5.PERIODY := rec5.yearVy;
                     if finded6 then
                        rec5.UKRGROMAD:=rec6.ukrGromad
                     else
                        rec5.UKRGROMAD:=1;
                     rec5.NUMIDENT := trim(recPerson.numIdent);
                     rec5.FIO      := trim(recPerson.fio);
                     rec5.NM       := trim(recPerson.nm);
                     rec5.FTN      := trim(recPerson.ftn);
                     rec5.START_DT := startDt;
                     rec5.END_DT   := endDt;
                     rec5.ZO       := zo;
                     rec5.pid      := '����� �i� '+FormatDate(DatePrik)+' '+trim(nomerPrik);
                     case shifrIdTyp of
                      5,9:   // ����� 5 - ����� 9 - �����������������
                          fillRec5Pri;
                      13,17: // ���������� 13 - ��������� 17 - ����������������
                          fillRec5Uw;
                      7:  fillRec5Perew;

                     end;
                     list5.Add(rec5);
                end;
             dsFilledPrikazy.Next;
        end;
      dsFilledPrikazy.Close;
      dsFilledPrikazy.Transaction.commit;
 end;

procedure TFormRepF4.fillTable7;
 var tabno:integer;
     i,j:integer;
     finded:boolean;
     rec7:pRec7;
     startDt,endDt:integer;

   function existsExpNe1OsnWr(tabno:integer):boolean;
    var i:integer;
        finded:boolean;
    begin
         finded:=false;
         for i:=0 to list6.Count-1 do
              begin
                   if (pRec6(list6.Items[i]).tabno=tabno) then
                   if (pRec6(list6.Items[i]).exp<>1) then
                   if (pRec6(list6.Items[i]).w_r=1) then
                      begin
                           finded:=true;
                           break;
                      end;
              end;
         existsExpNe1OsnWr:=finded;
    end;

 begin
      if list6.Count<1 then exit;
      for i:=0 to list6.Count-1 do
          begin
               if pRec6(list6.Items[i]).exp<>1 then continue;
               if existsExpNe1OsnWR(pRec6(list6.Items[i]).tabno) then continue;
//               if notOsnWR(pRec6(list6.Items[i]).tabno) then continue;
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
               endDt:=LenMonth(encodeDate(wantedYear,wantedMonth,1));
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
               rec7.yearVy:=wantedYear;
               rec7.monthVy:=wantedMonth;
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
procedure TFormRepF4.fillTable7Dekr;
 var tabno:integer;
     i,j:integer;
     finded:boolean;
     rec7:pRec7;
     startDt,endDt:integer;
     inn,fio:shortstring;
     fam,nam,otc:shortstring;
     SQLStmnt,S1:string;
     ds,ys,ms:string;


 begin
      if list6.Count<1 then exit;
      ms:=IntToStr(NMES);
      ys:=IntToStr(wantedYear);
      ds:=IntToStr(lenMonth(EncodeDate(wantedYear,wantedMonth,1)));
      SQLStmnt:='select b.tabno,b.fio,b.inn,b.date_fr,b.date_to,coalesce(b.kind,4) kind from tb_dekr_ecb b';
      SQLStmnt:=SQLStmnt+' join kadry k on b.tabno=k.tabno';
      SQLStmnt:=SQLStmnt+' where';
      SQLStmnt:=SQLStmnt+' not ( b.date_fr > cast(('+ys+'||''-''||'+ms+'||''-''||'+ds+') as date)';
      SQLStmnt:=SQLStmnt+' or';
      SQLStmnt:=SQLStmnt+' b.date_to < cast(('+ys+'||''-''||'+ms+'||''-01'') as date)';
      SQLStmnt:=SQLStmnt+' )';
      SQLStmnt:=SQLStmnt+' and exists (';
      SQLStmnt:=SQLStmnt+' select first 1 * from person fa';
      SQLStmnt:=SQLStmnt+' where fa.tabno=b.tabno';
      SQLStmnt:=SQLStmnt+' and fa.shifrkat=1';
      SQLStmnt:=SQLStmnt+' )';
      //'select b.tabno,b.fio,b.inn,b.date_fr,b.date_to,coalesce(b.kind,4) kind from tb_dekr_ecb b join kadry k on b.tabno=k.tabno where not ( b.date_fr > cast((2020||'-'||4||'-28') as date) or b.date_to < cast((2020||'-'||4||'-01') as date) ) and exists ( select first 1 * from person fa where fa.tabno=b.tabno and fa.shifrkat=1 )'
      pQDekr6.SQL.Clear;
      pQDekr6.SQL.Add(sqlStmnt);
      pQDekr6.Transaction.StartTransaction;
      pQDekr6.ExecQuery;
      while not pqDekr6.Eof do
          begin
               tabno:=pQDekr6.Fields[0].AsInteger;
               inn:=trim(pQDekr6.Fields[2].AsString);
               fio:=Trim(pQDekr6.Fields[1].AsString);
               SplitFIO(fio,fam,nam,otc);
               fam:=UPPER_STRING(fam);
               nam:=UPPER_STRING(nam);
               otc:=UPPER_STRING(otc);
               finded:=false;
//               if list7.count>0 then
//                  for j:=0 to list7.Count-1 do
//                      if pRec7(list7.Items[j]).tabno=pRec6(list6.Items[i]).tabno then
//                         begin
//                              finded:=true;
//                              break;
//                         end;
//               if Finded then
//                  begin
//                       pqDekr6.Next;
//                       continue;
//                  end;
               startDt:=1;
               endDt:=LenMonth(encodeDate(wantedYear,wantedMonth,1));
//               if listCheck.count>0 then
//                  for j:=0 to listCheck.Count-1 do
//                      if pRecPerson(listCheck.Items[j]).tabno=pRec6(list6.Items[i]).tabno then
//                         begin
//                              startDt:=pRecPerson(listCheck.Items[j]).start_d;
//                              endDt:=pRecPerson(listCheck.Items[j]).end_d;
//                              break;
//                         end;
               new(rec7);
               fillChar(rec7^,sizeOf(rec7^),0);
               rec7.yearVy  := wantedYear;
               rec7.monthVy := wantedMonth;
               rec7.tabno   := tabno;
               rec7.PERIODM := rec7.monthVy;
               rec7.PERIODY := rec7.yearVy;
               rec7.UKRGROMAD:= 1;
               rec7.NUMIDENT := INN;
               rec7.FIO      := fam;
               rec7.NM       := nam;
               rec7.FTN      := otc;
               rec7.C_PID    :='���024�1';
               rec7.START_DT :=startDt;
               rec7.END_DT   :=endDt;
               rec7.DAYS     :=endDt-startDt+1;
               rec7.NORMA    :=rec7.DAYS;
               rec7.SEAZON:=1;
               list7.Add(rec7);
               pqDekr6.Next;
//               rec7.NUM_NAK:=1;
          end;
          pqDekr6.Close;
          pqDekr6.Transaction.Commit;

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
       if listIllSowm<>Nil then
           begin
                if listIllSowm.count>0 then
                   for i:=0 to listIllSowm.Count-1 do
                       dispose(pRecIll(listIllSowm.Items[i]));
                listIllSowm.Free;
                listIllSowm:=nil;
           end;
       if listOtp<>Nil then
          begin
               if listOtp.count>0 then
                  for i:=0 to listOtp.Count-1 do
                      dispose(pRecIll(listOtp.Items[i]));
               listOtp.Free;
               listOtp:=nil;
          end;
       if listOtpSowm<>Nil then
          begin
               if listOtpSowm.count>0 then
                  for i:=0 to listOtpSowm.Count-1 do
                      dispose(pRecIll(listOtpSowm.Items[i]));
               listOtpSowm.Free;
               listOtpSowm:=nil;
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
//                pRec6(list6.items[i])^.kdptv := LenMonth(encodedate(wantedYear,wantedMonth,1));
                pRec6(list6.items[i])^.kdvp := 0; ///;
//                pRec6(list6.items[i])^.nrc := 0; ///;
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
//                pRec6(list6.items[i])^.nrc := 0; ///;
                if pRec6(list6.Items[i])^.tabno=12222 then
                   pRec6(list6.items[i])^.nrc := 0; ///;

                if (pRec6(list6.items[i])^.zo in [1,2,25,32]) then // ��������
                   if not (pRec6(list6.items[i])^.payTp in [10,13]) then // �� ���������
                      if ((pRec6(list6.items[i])^.payYear=wantedYear) and (pRec6(list6.items[i])^.payMnth=wantedMonth)) then
                         begin
//                              pRec6(list6.items[i])^.kdptv := recPerson.kdPtv;
 //                             pRec6(list6.items[i])^.kdnzp := recPerson.kdNzp; ///
                              if pRec6(list6.items[i])^.tabno=9162 then
                                 j:=1;
                              if recPerson.summaKoef<1.0 then
                                 pRec6(list6.items[i])^.nrc:=1;  // �������� ��� ��� ���� ������ ������
                            // ��������� 2020 nrc=1
//                              if cbNRC.Checked then
//                                 pRec6(list6.items[i])^.nrc:=1;
//������
//������� � �
//������� � �
//�������� � �
//�������
//����
//������ � �
//������ � �
//����� � �  ������ -------------
//����� � � ��������
                         end;
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

                // �������� ��������� ��� ��������� �������� ������ � ����
                // nrc=1

           end;
  end;
procedure TFormRepF4.fillSownVneList;
 var i,iCount:integer;
     sowmVneRec:pRecSowmVne;
   procedure addTabnoToSowmList(tabno:integer);
    var finded:Boolean;
        j:Integer;
    begin
         finded:=false;
         if listSowmVne.count>0 then
            for j:=0 to listSowmVne.Count-1 do
                if pRecSowmVne(listSowmVne.Items[j]).tabno=tabno then
                   begin
                        finded:=true;
                        Break;
                   end;
         if finded then Exit;
         new(sowmVneRec);
         sowmVneRec.Tabno:=tabno;
         listSowmVne.add(sowmVneRec);

    end;
   procedure delTabnoFromSowmList(tabno:integer);
    var finded:Boolean;
        j:Integer;
    begin
         finded:=false;
         if listSowmVne.count>0 then
            for j:=0 to listSowmVne.Count-1 do
                if pRecSowmVne(listSowmVne.Items[j]).tabno=tabno then
                   begin
                        pRecSowmVne(listSowmVne.Items[j]).tabno:=-1;
                        Break;
                   end;
    end;
   procedure  markOtkForVneSowm(tabno:integer);
    var i:Integer;
        finded:Boolean;
    begin
         for i:=0 to list6.Count-1 do
           begin
                if pRec6(list6.Items[i]).tabno<>tabno then Continue;
                if not (pRec6(list6.Items[i]).zo in[1,25,26]) then Continue;
                if (
                    (pRec6(list6.Items[i]).payTp=0)
                    and
                    (pRec6(list6.Items[i]).payMnth=NMES)
                    and
                    (pRec6(list6.Items[i]).payYear=wantedYear)
                   ) then
                   pRec6(list6.Items[i]).kdPtv:=LenMonth(EncodeDate(wantedYear,wantedMonth,1));

           end;

    end;

 begin
      for i:=0 to list6.Count-1 do
          addTabnoToSowmList(pRec6(list6.Items[i]).tabno);
      for i:=0 to list6.Count-1 do
          if pRec6(list6.Items[i]).otk=1 then
             delTabnoFromSowmList(pRec6(list6.Items[i]).tabno);
      iCount:=0;
      for i:=0 to listSowmVne.Count-1 do
          if pRecSowmVne(listSowmVne.Items[i]).tabno>0 then
             begin
                  Inc(iCount);
                  markOtkForVneSowm(pRecSowmVne(listSowmVne.Items[i]).tabno);
             end;
      i:=list6.Count;
 end;

procedure TFormRepF4.fillRecalcNarah22;
 var summaAdd,summaUdRas,summaI:real;
     proc22:real;
     i:Integer;
     tn:integer;
     sign:Integer;
     aKop:Real;
     cFrac:real;
     iKop,iFLAG,iMod:Integer;
   function p10(a:real):Real;
     begin
 //         p10:=roundTo(a,-2);
          p10:=simpleroundTo(a,-2);
     end;
 begin
  // rmNearest	Rounds to the closest value.
//rmDown	Rounds toward negative infinity.
//rmUp	Rounds toward positive infinity.
//rmTruncate
  //    setRoundMode(rmNearest);
      proc22:=0.22;
      if list6.count<1 then exit;
       for i:=0 to list6.Count-1 do
           begin
        //         summaAdd:=p10(pREC6(List6.items[i]).sumMax);
                 sign:=0;
                 summaAdd:=pREC6(List6.items[i]).sumMax;
                 if summaAdd<-0.005 then
                    begin
                         sign:=-1;
                         summaAdd:=-summaAdd;
                    end;
                 tn:=pREC6(List6.items[i]).tabno;
                 if tn=12224 then
                   proc22:=0.22;
                 if abs(abs(summaAdd)-10000.00)<0.01 then
                    proc22:=0.22;
                 summaI:=summaAdd*proc22;
                 aKop:=frac(summaI);
                 cFrac:=aKop*1000.00;
                 if (Abs(cFrac)<0.0000000001) then
                    begin
                 iKop:=round(aKop*1000.00);
                 iFlag:=0;
                 iMod := iKop mod 10;
                 if iMod=5 then
                    summaI:=SummaI+0.001;
                    end;
                 summaudRas:=p10(summaI);
                 if sign=-1 then
                    summaUdRas:=-summaUdRas;
                 pRec6(list6.Items[i]).sumNarah:=summaUdRas;

           end;

 end;
procedure TFormRepF4.moveToBD;
 var SqlStmnt:wideString;
     i,j,ic,iErr:integer;
     c:char;

 begin
     formWait.Show;
     Application.ProcessMessages;
     sqlStmnt:='delete from tb_e04t05c where yearvy='+intToStr(wantedYear)+' and monthvy='+intToStr(wantedMonth);
     SQLExecute(SQLStmnt);
     sqlStmnt:='delete from tb_e04t06c where yearvy='+intToStr(wantedYear)+' and monthvy='+intToStr(wantedMonth);
     SQLExecute(SQLStmnt);
     sqlStmnt:='delete from tb_e04t07c where yearvy='+intToStr(wantedYear)+' and monthvy='+intToStr(wantedMonth);
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
              if length(trim(pRec5(list5.Items[i])^.PROF))>0 then
                 begin
                   pRec5(list5.Items[i])^.PROF:=StringReplace(pRec5(list5.Items[i])^.PROF,Chr(160),' ',[rfReplaceAll]);
//                   pRec5(list5.Items[i])^.ZKPP:=trim(pRec5(list5.Items[i])^.ZKPP);
//                   j:=length(pRec5(list5.Items[i])^.ZKPP);
//                   c:=pRec5(list5.Items[i])^.ZKPP[j];
//                   ic:=ord(c);
                      j:=1;
                 end;
              if length(trim(pRec5(list5.Items[i])^.ZKPP))>0 then
                 begin
                   pRec5(list5.Items[i])^.ZKPP:=StringReplace(pRec5(list5.Items[i])^.ZKPP,Chr(160),' ',[rfReplaceAll]);
//                   pRec5(list5.Items[i])^.ZKPP:=trim(pRec5(list5.Items[i])^.ZKPP);
//                   j:=length(pRec5(list5.Items[i])^.ZKPP);
//                   c:=pRec5(list5.Items[i])^.ZKPP[j];
//                   ic:=ord(c);
                      j:=1;
                 end;
              if length(trim(pRec5(list5.Items[i])^.PNR))>0 then
                 begin
                   pRec5(list5.Items[i])^.PNR:=StringReplace(pRec5(list5.Items[i])^.PNR,Chr(160),' ',[rfReplaceAll]);
//                   pRec5(list5.Items[i])^.PNR:=trim(pRec5(list5.Items[i])^.PNR);
//                   j:=length(pRec5(list5.Items[i])^.ZKPP);
//                   c:=pRec5(list5.Items[i])^.ZKPP[j];
//                   ic:=ord(c);
                      j:=1;
                 end;
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
              SQLStmnt:=trim(SQLStmnt)+'VZV,';
              SQLStmnt:=trim(SQLStmnt)+'VS,';
              SQLStmnt:=trim(SQLStmnt)+'PIR';              
              SQLStmnt:=trim(SQLStmnt)+') VALUES(';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec5(list5.Items[i])^.yearVy)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec5(list5.Items[i])^.monthVy)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec5(list5.Items[i])^.tabno)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec5(list5.Items[i])^.periodM)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec5(list5.Items[i])^.periodY)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec5(list5.Items[i])^.rowNum)+',';
              SQLStmnt:=trim(SQLStmnt)+intToStr(pRec5(list5.Items[i])^.ukrGromad)+',';
              SQLStmnt:=trim(SQLStmnt)+''''+trim(pRec5(list5.Items[i])^.numIdent)+''',';
              SQLStmnt:=trim(SQLStmnt)+''''+AnsiUpperCase(trim(ReplToUkrI(ReplQto2Q(pRec5(list5.Items[i])^.fio))))+''',';
              SQLStmnt:=trim(SQLStmnt)+''''+AnsiUpperCase(trim(ReplToUkrI(ReplQto2Q(pRec5(list5.Items[i])^.nm))))+''',';
              SQLStmnt:=trim(SQLStmnt)+''''+AnsiUpperCase(trim(ReplToUkrI(ReplQto2Q(pRec5(list5.Items[i])^.ftn))))+''',';
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
              SQLStmnt:=trim(SQLStmnt)+''''+trim(pRec5(list5.Items[i])^.VZV)+''',';
              SQLStmnt:=trim(SQLStmnt)+Trim(IntToStr(pRec5(list5.Items[i])^.VS))+',';
              SQLStmnt:=trim(SQLStmnt)+Trim(IntToStr(pRec5(list5.Items[i])^.PIR));
              SQLStmnt:=trim(SQLStmnt)+')';
              ierr:=0;
              if Length(Trim(pRec5(list5.Items[i])^.PROF)) >6 then
                 begin
                      ShowMessage('���.����� '+IntToStr(pRec5(list5.Items[i])^.tabno)+^M'������ �������� �5 � SQL.'^M' ����� (prof) ���� ���������>6 --'+trim(pRec5(list5.Items[i])^.PROF)+'--'+intToStr(Ord(pRec5(list5.Items[i])^.PROF[7])));
                      iErr:=1;
                 end;
              if Length(Trim(pRec5(list5.Items[i])^.ZKPP)) >5 then
                 begin
                      ShowMessage('������ �������� �5 � SQL.'^M' ����� (ZKPP) ���� ���������>5 '+pRec5(list5.Items[i])^.ZKPP);
                      iErr:=1;
                 end;
//              SQLStmnt:=StringReplace(SQLStmnt,Chr(175),'I',[rfReplaceAll]);
//              SQLStmnt:=StringReplace(SQLStmnt,Chr(191),'i',[rfReplaceAll]);
//              SQLStmnt:=StringReplace(SQLStmnt,'/','-',[rfReplaceAll]);
              if IErr=0 then
              try
                SQLExecute(SQLStmnt);
              except
                else
                   showMessage('������ '+SQLStmnt);
              end;
//'insert into tb_e04t05c (YEARVY,MONTHVY,TABNO,PERIOD_M,PERIOD_Y,ROWNUM,UKR_GROMAD,NUMIDENT,FIO,NM,FTN,START_DT,END_DT,ZO,PID_ZV,NRM_DT,DOG_CPH,PNR,ZKPP,PROF,POS,PID,VZV,VS,PIR) VALUES(2021,8,12131,8,2021,0,1,'2153111581','��˲���','²��','�����˲I���',1,31,1,'��.38 ����� (��������.����.) (��.� �.7 ��.26 ��γ��)','1990-01-01',0,'','','','','����� �i� 31.08.2021 187 �','',0,0)'
// 'insert into tb_e04t05c (YEARVY,MONTHVY,TABNO,PERIOD_M,PERIOD_Y,ROWNUM,UKR_GROMAD,NUMIDENT,FIO,NM,FTN,START_DT,END_DT,ZO,PID_ZV,NRM_DT,DOG_CPH,PNR,ZKPP,PROF,POS,PID,VZV,VS,PIR) VALUES(2021,9,12349,9,2021,0,1,'2744407124','��������','������','������̲в���',11,30,1,'','1990-01-01',0,'3433�','20281�','','�������� ���������','����� �i� 10.09.2021 147-�-�','',0,0)'

         end;
     j:=0;
     if list6.Count>0 then
     for i:=0 to list6.Count-1 do
         begin
              if pRec6(list6.Items[i])^.tabno=11603 then
                 j:=1;
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
              SQLStmnt:=trim(SQLStmnt)+''''+AnsiUpperCase(trim(ReplToUkrI(ReplQto2Q(pRec6(list6.Items[i])^.fio))))+''',';
              SQLStmnt:=trim(SQLStmnt)+''''+AnsiUpperCase(trim(ReplToUkrI(ReplQto2Q(pRec6(list6.Items[i])^.nm ))))+''',';
              SQLStmnt:=trim(SQLStmnt)+''''+AnsiUpperCase(trim(ReplToUkrI(ReplQto2Q(pRec6(list6.Items[i])^.ftn))))+''',';
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
              SQLStmnt:=trim(SQLStmnt)+''''+AnsiUpperCase(trim(ReplToUkrI(ReplQto2Q(pRec7(list7.Items[i])^.fio))))+''',';
              SQLStmnt:=trim(SQLStmnt)+''''+AnsiUpperCase(trim(ReplToUkrI(ReplQto2Q(pRec7(list7.Items[i])^.nm ))))+''',';
              SQLStmnt:=trim(SQLStmnt)+''''+AnsiUpperCase(trim(ReplToUkrI(ReplQto2Q(pRec7(list7.Items[i])^.ftn))))+''',';
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
 var i,j,k:integer;
     recPerson:pRecPerson;
     recAdd:pRecAdd;
     nalCode:string;
     fio,fam,nam,otc:shortString;
     st:integer;
     start_d,end_d:integer;
 begin
      if listCheck.Count<1 then exit;
      k:=0;
      for i:=0 to listCheck.Count-1 do
          begin
               recPerson:=pRecPerson(listCheck.Items[i]);
               recPerson.summaAddSal := 0;
               recPerson.summaAddF6  := 0;
               recPerson.summaMatHelp:= 0;
               recPerson.summaKassa  := 0;
               recPerson.summaUwolKomp :=0;
               if recPerson.addList.count>0 then
                  for j:=0 to recPerson.addList.count-1 do
                      begin
                           recAdd:=pRecAdd(recPerson.addList.items[j]);
                           if (recPerson^.tabno=11755)
                              and
                              (recAdd^.shifrPod=106) then
                              k:=1;
                      //     if (recAdd^.shifrSta in [31,139,141]) then
                           if ((recAdd^.shifrSta in [31,141])
                              or
                                ((recAdd^.shifrSta in [139])
                                  and (recAdd^.shifrPod<>106))
                              )
                               then
                               recPerson.summaMatHelp := recPerson.summaMatHelp+recAdd^.Summa
                           else
                           if (recAdd^.shifrSta = VYHODNOE_POSOBIE_SHIFR) then
                               recPerson.summaUwolKomp := recPerson.summaUwolKomp+recAdd^.Summa
                           else
                           if (recAdd^.shifrSta = kassa_shifr) then
                               recPerson.summaKassa := recPerson.summaKassa+recAdd^.Summa
                           else
                               recPerson.summaAddSal := recPerson.summaAddSal+recAdd^.Summa;
                      end;
//               recPerson.summaAddF6 := getSummaFromF6(recPerson.tabno);
               recPerson.summaAddF6 := getSummaFromF6WithoutDolpDoMin(recPerson.tabno);
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
               showMessage('������ '+intToStr(pRecPerson(listCheck.Items[i]).tabno)+
               ' '+pRecPerson(listCheck.Items[i]).fio+
               ' � �������� '+FormatFloatPoint(pRecPerson(listCheck.Items[i]).summaAddSal)+
               ' � � ����� 6 '+FormatFloatPoint(pRecPerson(listCheck.Items[i]).summaAddF6));
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
function TFormRepF4.getSummaFromF6WithoutDolpDoMin(tabno:integer):real;
 var rec6:pRec6;
     i:integer;
     retVal:real;
 begin
      retVal:=0;
      if list6.Count>0 then
         for i:=0 to list6.Count-1 do
             if pRec6(list6.Items[i]).tabno=tabno then
             if pRec6(list6.Items[i]).payTp<>13 then
                retVal:=r10(retVal) + r10(pRec6(list6.Items[i]).sumTotal);
      getSummaFromF6WithoutDolpDoMin:=retVal;
 end;

procedure TFormRepF4.getDataKdPtv(tabno:integer;var start_d:integer;var end_d:integer;var kd_ptv:integer);
 var SQLStmnt        : string;
     v, vFr, vTo     : variant;
     dateFr, dateTo  : TDateTime;
     yFr,mFr,yTo,mTo : integer;
     dFr,dTo         : integer;
 begin
     start_d:=1;
     end_d:=LenMonth(encodedate(wantedYear,wantedMonth,1));
     kd_Ptv:=(end_d-start_d+1);
     SQLStmnt:='select data_pri,data_uw,code_uwol from kadry';
     SQLStmnt:=trim(SQLStmnt)+' where ((extract(year from kadry.data_pri)='+intToStr(wantedYear)+' and extract(month from kadry.data_pri)='+intToStr(wantedMonth)+') or';
     SQLStmnt:=trim(SQLStmnt)+' (extract(year from kadry.data_uw )='+intToStr(wantedYear)+' and extract(month from kadry.data_uw)='+intToStr(wantedMonth)+')) and kadry.tabno='+intToStr(tabno);
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
     if ((yFr=wantedYear) and (mFr=wantedMonth)) then
         start_d:=dFr;
     if ((yTo=wantedYear) and (mTo=wantedMonth)) then
         end_d:=dTo;
     kd_ptv := end_d - start_d + 1;


 end;
function TFormRepF4.getBolDay(tabno:integer;payYear:integer;payMnth:integer;
                              var amntOfbDayOsn: Integer; var summaBolOsn:Real;
                              var amntOfbDaySowm: Integer; var summaBolSowm:Real):integer;
 type TRecBolDay=record
                      fDate:TDate;
                      lDate:TDate;
                      anmtOfBDay:Integer;
                      summa:real;
                      shifrWr:Integer;
                 end;
     PRecBolDay=^TRecBolDay;
 var SQLStmnt        : string;
     v               : variant;
     retVal          : integer;
     recBolDay       : PRecBolDay;
     list            : TList;
     finded          : Boolean;
     activated       : Boolean;
     i               : Integer;
 begin
      if tabno=11978 then
         retVal:=0;

     retVal         := 0;
     amntOfbDayOsn  := 0;
     summaBolOsn    := 0.0;
     amntOfbDaySowm := 0;
     summaBolSowm   := 0.0;

     list:=TList.Create;
//     SQLStmnt:='select coalesce(sum(coalesce(br.b_day,0)),0) b_day from boln_res br';
//     SQLStmnt:=trim(SQLStmnt)+' join boln b on b.shifrid=br.shifridboln';
//     SQLStmnt:=trim(SQLStmnt)+' where br.year_za='+intToStr(payYear)+' and br.month_za='+intToStr(payMnth);
//     SQLStmnt:=trim(SQLStmnt)+' and b.year_vy='+intToStr(currYear)+' and b.month_vy='+intToStr(NMES);
//     SQLStmnt:=trim(SQLStmnt)+' and b.shifr_sta in (12,14)';
//     SQLStmnt:=trim(SQLStmnt)+' and b.tabno='+intToStr(tabno);
//     v:=SQLQueryValue(SQLStmnt);
//     SQLStmnt:='select b.modewr,b.f_data,b.l_data, coalesce(br.b_day,0) b_day from boln_res br';
//     SQLStmnt:=trim(SQLStmnt)+' join boln b on b.shifrid=br.shifridboln';
//     SQLStmnt:=trim(SQLStmnt)+' where br.year_za='+intToStr(payYear)+' and br.month_za='+intToStr(payMnth);
//     SQLStmnt:=trim(SQLStmnt)+' and b.year_vy='+intToStr(currYear)+' and b.month_vy='+intToStr(NMES);
//     SQLStmnt:=trim(SQLStmnt)+' and b.shifr_sta in (12,14)';
//     SQLStmnt:=trim(SQLStmnt)+' and b.tabno='+intToStr(tabno);
     activated:=False;
     if not qBolDay.Transaction.Active then
        activated:=True;
     if activated then
        qBolDay.Transaction.StartTransaction;
     qBolDay.Params[0].Value:=payYear;
     qBolDay.Params[1].Value:=payMnth;
     qBolDay.Params[2].Value:=wantedYear;
     qBolDay.Params[3].Value:=wantedMonth;
     qBolDay.Params[4].Value:=tabno;
     qBolDay.Prepare;
     qBolDay.ExecQuery;
     while not qBolDay.Eof do
       begin
            if qBolDay.Fields[0].IsNull then Break;
            if qBolDay.Fields[1].IsNull then Break;
            if qBolDay.Fields[2].IsNull then Break;
            if qBolDay.Fields[3].IsNull then Break;
            if qBolDay.Fields[4].IsNull then Break;
            if qBolDay.fields[3].value>0 then
               begin
                    New(recBolDay);
                    recBolDay.shifrWr:=qBolDay.Fields[0].AsInteger;
                    if recBolDay.shifrWr<>2 then
                       recBolDay.shifrWr:=1;
                    recBolDay.fDate:=qBolDay.Fields[1].AsDate;
                    recBolDay.lDate:=qBolDay.Fields[2].AsDate;
                    recBolDay.anmtOfBDay:=qBolDay.fields[3].AsInteger;
                    recBolDay.summa:=qBolDay.fields[4].AsFloat;
                    finded:=False;
                    if list.count>0 then
                       for i:=0 to list.Count-1 do
                           if (CompareDate(PRecBolDay(list.items[i]).fDate,recBolDay.fDate)=1)
                              and
                              (CompareDate(PRecBolDay(list.items[i]).lDate,recBolDay.lDate)=1)
                              and
                              (PRecBolDay(list.items[i]).shifrwr=recBolDay.shifrWr) then
                              begin
                                   finded := True;
                                   Break;
                              end;
                    if not finded then
                       list.Add(recBolDay);
               end;
            qBolDay.Next;
       end;
     qBolDay.Close;
     if activated then
        qBolDay.Transaction.Commit;
//     v:=SQLQueryValue(SQLStmnt);
//     if VarIsNumeric(v) then
//     retVal := v;
     retVal := 0;
     if list.count>0 then
        for i:=0 to list.Count-1 do
            if PRecBolDay(list.items[i]).shifrWr=1 then
               begin
                    retVal:=retVal + PRecBolDay(list.items[i]).anmtOfBDay;
                    amntOfbDayOsn:=amntOfbDayOsn + PRecBolDay(list.items[i]).anmtOfBDay;
                    summaBolOsn:=summaBolOsn + PRecBolDay(list.items[i]).summa;
               end
            else
               begin
                    amntOfbDaySowm:=amntOfbDaySowm + PRecBolDay(list.items[i]).anmtOfBDay;
                    summaBolSowm:=summaBolSowm + PRecBolDay(list.items[i]).summa;
               end;

     list.Free;
     getBolDay:=retVal;
 end;
(*
function  TFormRepF4.getShifrWrForBoln(TABNO:Integer;summa:Real;Y:integer;m:integer):Integer;
 var SQLStmnt        : string;
     v               : variant;
     retVal          : integer;
//     recBolDay       : PRecBolDay;
//     list            : TList;
     finded          : Boolean;
     activated       : Boolean;
     i               : Integer;
     formatSumma     : string;
 begin
      if tabno=11978 then
         retVal:=0;
     if y<1900 then
        y:=y+1990;

     retVal := 1;
     formatSumma := Trim(FormatFloatPoint(summa));
//     list:=TList.Create;
     SQLStmnt:='select coalesce(b.modewr,0) from boln_res br';
     SQLStmnt:=trim(SQLStmnt)+' join boln b on b.shifrid=br.shifridboln';
     SQLStmnt:=trim(SQLStmnt)+' where br.year_za='+intToStr(Y)+' and br.month_za='+intToStr(M);
     SQLStmnt:=trim(SQLStmnt)+' and b.year_vy='+intToStr(currYear)+' and b.month_vy='+intToStr(NMES);
     SQLStmnt:=trim(SQLStmnt)+' and b.shifr_sta in (12,14)';
     SQLStmnt:=trim(SQLStmnt)+' and b.tabno='+intToStr(tabno);
 //    SQLStmnt:=trim(SQLStmnt)+' and coalesce(modewr,0)=2';
     SQLStmnt:=trim(SQLStmnt)+' and abs(abs(coalesce(br.summa_b_bud,0.00)+coalesce(br.summa_b_vne,0.00)+coalesce(br.summa_b_gn,0.00)+coalesce(br.summa_b_nis,0.00))-abs('+FormatSumma+'))<0.01';
     v:=SQLQueryValue(SQLStmnt);
     if VarIsNumeric(v) then
        retVal := v;
     if retVal<>2 then
        retVal:=1;
     getShifrWrForBoln:=retVal;
 end;
*)

function TFormRepF4.getDekrBolDay(tabno:integer;payYear:integer;payMnth:integer):integer;
 var SQLStmnt        : string;
     v               : variant;
     retVal          : integer;
 begin
     retVal := 0;
     SQLStmnt:='select coalesce(sum(coalesce(br.b_day,0)),0) b_day from boln_res br';
     SQLStmnt:=trim(SQLStmnt)+' join boln b on b.shifrid=br.shifridboln';
     SQLStmnt:=trim(SQLStmnt)+' where br.year_za='+intToStr(payYear)+' and br.month_za='+intToStr(payMnth);
     SQLStmnt:=trim(SQLStmnt)+' and b.year_vy='+intToStr(wantedYear)+' and b.month_vy='+intToStr(wantedMonth);
     SQLStmnt:=trim(SQLStmnt)+' and b.shifr_sta in (32)';
     SQLStmnt:=trim(SQLStmnt)+' and b.tabno='+intToStr(tabno);
     v:=SQLQueryValue(SQLStmnt);
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
     SQLStmnt:=trim(SQLStmnt)+' and o.year_vy='+intToStr(wantedYear)+' and o.month_vy='+intToStr(wantedMonth);
     SQLStmnt:=trim(SQLStmnt)+' and o.shifrsta in (5)';
     SQLStmnt:=trim(SQLStmnt)+' and o.tabno='+intToStr(tabno);
     v:=SQLQueryValue(SQLStmnt);
     if VarIsNumeric(v) then
        retVal := v;
     getOtpDay:=retVal;
 end;

procedure  TFormRepF4.addZavadskieToList6;
// const tns:array[1..2] of integer=(4011,11603);
 const ltns=1;
 const tns:array[1..1] of integer=(11603);
 var tabno,i,j:integer;
     zo:integer;
     rec6,rec6_1:pRec6;
     finded:Boolean;
     payTp,payMnth,payYear:Integer;
     kd_nzp:Integer;
 begin
      kd_nzp:=lenmonth(EncodeDate(wantedYear,wantedMonth,1));
      if ltns>0 then
      for i:=1 to ltns do
        begin
             tabno:=tns[i];
             rec6:=nil;
             finded:=false;
             if list6.count>0 then
                for j:=0 to list6.Count-1 do
                    if pRec6(list6.items[j])^.tabno=tabno then
                       begin
                            finded:=True;
                            rec6:=pRec6(list6.items[j]);
                            Break;
                       end;
             if not finded then Continue;
             zo       := 1;
             payTp    := 0;
             payYear  := wantedYear;
             payMnth  := wantedMonth;
             rec6_1:=addToF6(tabno,zo,payTp,payMnth,payYear,10.00,false);
             if rec6_1=nil then
                begin
                     ShowMessage('�� ��������� ��������� �.�='+IntToStr(tabno));
                     Continue;
                end;
             rec6_1^.sumMax:=0;
             rec6_1^.sumTotal:=0;
             rec6_1^.sumNarah:=0;
             rec6_1^.w_r:=2;
             rec6_1^.kdNzp:=kd_nzp;
         end;

 // 11603 �������� � � �������� �� 4011��� ������ ���� ������ � 1 � ��� ��� ���� ��� ���������� �� ����� ������

 end;

procedure  TFormRepF4.calculateSumNarahInBD;
 var SqlStmnt:string;
 begin
      SQLSTmnt:='update tb_e04t06c tu';
      SQLSTmnt:=trim(SQLStmnt)+' set tu.sum_narah=tu.sum_max*0.22';
      SQLSTmnt:=trim(SQLStmnt)+' where ';
      SQLSTmnt:=trim(SQLStmnt)+'       tu.yearvy= '+IntToStr(wantedYear);
      SQLSTmnt:=trim(SQLStmnt)+'   and tu.monthvy= '+IntToStr(wantedMonth);
      SQLSTmnt:=trim(SQLStmnt)+'   and tu.pay_tp<>13';
      SQLSTmnt:=trim(SQLStmnt)+'   and not tu.zo in (2,32,42)';
      SQLExecute(SQLStmnt);
      SQLSTmnt:='update tb_e04t06c tu';
      SQLSTmnt:=trim(SQLStmnt)+' set tu.sum_narah=tu.sum_diff*0.22';
      SQLSTmnt:=trim(SQLStmnt)+' where ';
      SQLSTmnt:=trim(SQLStmnt)+'       tu.yearvy= '+IntToStr(wantedYear);
      SQLSTmnt:=trim(SQLStmnt)+'   and tu.monthvy= '+IntToStr(wantedMonth);
      SQLSTmnt:=trim(SQLStmnt)+'   and tu.pay_tp=13';
      SQLSTmnt:=trim(SQLStmnt)+'   and not tu.zo in (2,32,42)';
      SQLExecute(SQLStmnt);
      SQLSTmnt:='update tb_e04t06c tu';
      SQLSTmnt:=trim(SQLStmnt)+' set tu.sum_narah=tu.sum_max*0.0841';
      SQLSTmnt:=trim(SQLStmnt)+' where ';
      SQLSTmnt:=trim(SQLStmnt)+'       tu.yearvy= '+IntToStr(wantedYear);
      SQLSTmnt:=trim(SQLStmnt)+'   and tu.monthvy= '+IntToStr(wantedMonth);
      SQLSTmnt:=trim(SQLStmnt)+'   and tu.pay_tp<>13';
      SQLSTmnt:=trim(SQLStmnt)+'   and tu.zo in (2,32,42)';
      SQLExecute(SQLStmnt);
      SQLSTmnt:='update tb_e04t06c tu';
      SQLSTmnt:=trim(SQLStmnt)+' set tu.sum_narah=tu.sum_diff*0.0841';
      SQLSTmnt:=trim(SQLStmnt)+' where ';
      SQLSTmnt:=trim(SQLStmnt)+'       tu.yearvy= '+IntToStr(wantedYear);
      SQLSTmnt:=trim(SQLStmnt)+'   and tu.monthvy= '+IntToStr(wantedMonth);
      SQLSTmnt:=trim(SQLStmnt)+'   and tu.pay_tp=13';
      SQLSTmnt:=trim(SQLStmnt)+'   and tu.zo in (2,32,42)';
      SQLExecute(SQLStmnt);

 end;
(*
function TFormRepF4.isSciPedForSwod(curr_person:person_ptr):boolean;
 var retVal:boolean;
 begin
      retVal:=isSciPed(curr_person);
      if (curr_person^.tabno=3719) then           // �������
      if (curr_person^.WID_RABOTY=1) then
         retVal:=true;
      if ((curr_person^.WID_RABOTY=2) and
          (curr_person^.MESTO_OSN_RABOTY=82)) then
         retVal:=false;
      if ((curr_person^.tabno =4424)
         or
         (curr_person^.tabno= 11761)) then // ��������  � �������� �� ������������
         retVal:=false;
      if curr_person^.tabno=11626  then // �����
         retVal:=True;
      isSciPedForSwod:=retVal;
 end;
*)
end.
