unit UFormRepBolnPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, frxClass, frxDBSet, ExtCtrls,
  scrDef;

type
  TFormRepBolnPlan = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dtIn: TDateTimePicker;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure CreateReport(modeUniKol:integer);
    procedure fillPerson(curr_person:person_ptr);
    procedure fillPersonAUP_PPS(curr_person:person_ptr);
//    procedure moveToExcel;
    procedure SwodToExcel(modeUniKol:integer);
    function getShifrKat(curr_person:person_ptr):Integer;

//    function initListPlanRecs:boolean;

  public
    { Public declarations }
  end;

var
  FormRepBolnPlan: TFormRepBolnPlan;

implementation
  uses
      uFIBModule,UFormWait,ScrUtil,DateUtils,ComObj,ScrIO,
      scrLists;
  type TRecBol=record
             summa5bud : real;
             summa5vne : real;
             summafssbud : real;
             summafssvne : real;
            end;
  type pRec=^TRec; //AUP-PPS
       TRec=record
             tabno  : integer;
            end;


  var list         : TList;
      modeSort     : Integer;
      swod         : array[1..5] of TRecBol;
{$R *.dfm}

procedure TFormRepBolnPlan.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormRepBolnPlan.FormCreate(Sender: TObject);
begin
     dtIn.Date        := IncMonth(Date,-1);
end;

procedure TFormRepBolnPlan.BitBtn1Click(Sender: TObject);
begin
     CreateReport(1);
end;
function TFormRepBolnPlan.getShifrKat(curr_person:person_ptr):Integer;
 var retVal:Integer;
     i:Integer;
     finded:Boolean;
 begin
      if curr_person^.KATEGORIJA in [1,3] then retVal:=1 //pps
      else
      if curr_person^.KATEGORIJA in [2] then retVal:=5  //uwp
      else
      if curr_person^.KATEGORIJA in [4,6] then retVal:=4 // ahch
      else
      if curr_person^.KATEGORIJA in [5,7] then retVal:=2; // aup
      finded:=false;
      if list.count>0 then
         for i:=0 to list.Count-1 do
            if pRec(list.Items[i]).tabno=curr_person^.tabno then
               begin
                    finded:=True;
                    Break;
               end;
      if finded then retVal:=3;
      getShifrKat:=retVal;

 end;
procedure TFormRepBolnPlan.CreateReport(modeUniKol:integer);
  var savNMES,savNSRV:integer;
      iNSRV,i:Integer;
      curr_person:PERSON_PTR;
      curr_add:ADD_PTR;
  begin
       savNMES:=NMES;
       savNSRV:=NSRV;
       EMPTY_ALL_PERSON;
       list:=TList.Create;
       FillChar(swod,sizeOf(swod),0);
       ProgressBar1.Min:=0;
       ProgressBar1.Max:=Count_Serv*2;
       ProgressBar1.Step:=1;
       for iNSRV:=1 to Count_Serv do
           begin
                NSRV:=iNSRV;
                MKFLNM;
                ProgressBar1.StepIt;
                Application.ProcessMessages;
                if not fileexists(FNINF) then Continue;
                if nsrv in [81,82,121,140] then continue;
//                if modeUniKol=2 then
//                   if not IsColedgPodr(nsrv) then Continue
//                   else
//                else
//                   if IsColedgPodr(nsrv) then Continue;
                getinf(false);
                curr_person:=HEAD_PERSON;
                while (curr_person<>nil) do
                  begin
                       if isPersonAUP_PPS(curr_person) then
                          fillPersonAUP_PPS(Curr_person);
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
                if not fileexists(FNINF) then Continue;
                if nsrv in [82] then continue;
                if modeUniKol=2 then
                   if not IsColedgPodr(nsrv) then Continue
                   else
                else
                   if IsColedgPodr(nsrv) then Continue;
                getinf(false);
                curr_person:=HEAD_PERSON;
                while (curr_person<>nil) do
                  begin
                       fillPerson(Curr_person);
                       curr_person:=curr_person^.NEXT;
                  end;
                EMPTY_ALL_PERSON;
           end;
       Application.ProcessMessages;
       swodToExcel(modeUniKol);
       if list.count>0 then
          for i:=0 to list.count-1 do
              dispose(pRec(list.Items[i]));
       list.Free;
       list:=nil;
       NMES:=savNMES;
       NSRV:=savNSRV;
       MKFLNM;
       getinf(true);
  end;
procedure TFormRepBolnPlan.fillPerson(curr_person:person_ptr);
  var shifrKat:Integer;
      curr_add:Add_Ptr;
  begin
       curr_add:=curr_person.ADD;
       shifrKat:=getShifrKat(curr_person);
       while (curr_add<>nil) do
         begin
              if curr_add^.shifr=BOL_5_SHIFR then
                 if curr_person^.gruppa=1 then
                    swod[shifrKat].summa5bud:=swod[shifrKat].summa5bud+curr_add^.SUMMA
                 else
                    swod[shifrKat].summa5vne:=swod[shifrKat].summa5vne+curr_add^.SUMMA
              else
              if curr_add^.shifr in [BOL_TEK_SHIFR,BOL_PROSHL_SHIFR,DEKRET_SHIFR] then
                 if curr_person^.gruppa=1 then
                    swod[shifrKat].summafssbud:=swod[shifrKat].summafssbud+curr_add^.SUMMA
                 else
                    swod[shifrKat].summafssvne:=swod[shifrKat].summafssvne+curr_add^.SUMMA;
              curr_add:=curr_add.NEXT;
         end;
  end;
procedure TFormRepBolnPlan.fillPersonAUP_PPS(curr_person:person_ptr);
  var rec:pRec;
      finded:Boolean;
      i:integer;
  begin
       finded:=False;
       if list.count>0 then
          for i:=0 to list.count-1 do
              if PRec(list.Items[i]).tabno=curr_person.tabno then
                 begin
                   finded:=True;
                   Break;
                 end;
       if finded then Exit;
       New(rec);
       rec.tabno:=curr_person^.tabno;
       list.Add(rec);
  end;

procedure TFormRepBolnPlan.SwodToExcel(modeUniKol:integer);
var E,WC:Variant;
    FName,S:String;
    SummaTot,SummaClear,nmbOfSt,avgChisl:real;
    SummaOsnAdd, SummaDopAdd : real;
    k,i:integer;
    exRow:integer;
    lastRow1:integer;
    h:string;
begin
//     FName:=TemplateDIR+'WorkersPlan.xlt';
     FName:=TemplateDIR+'PlanBoln.xlt';
     if not FileExists(FName) then
        begin
             ShowMessage('Отсутствует шаблон '+FName);
             Exit;
        end;
     try
        E:=CreateOleObject('Excel.Application');
     except
        ShowMessage('Ошибка запуска Excel');
        Exit;
     end;
     E.Visible:=True;
     E.WorkBooks.Open(FName);
     if modeUniKol=2 then
        h:='Колледж'
     else
        h:='Университет';   
     h:=h+' '+GetMonthRus(nmes)+' '+IntToStr(CURRYEAR)+' г.';
     E.WorkBooks[1].WorkSheets[1].Cells[3,3] := h;
     exRow:=6;
     for i:=1 to 5 do
        begin
             Inc(exRow);
             if i=2 then
                begin
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=swod[i].summa5bud   + swod[i+1].summa5bud;
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=swod[i].summa5vne   + swod[i+1].summa5vne;
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=swod[i].summafssbud + swod[i+1].summafssbud;
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]:=swod[i].summafssvne + swod[i+1].summafssvne;
                end
             else
                begin
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=swod[i].summa5bud;
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=swod[i].summa5vne;
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=swod[i].summafssbud;
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]:=swod[i].summafssvne;
                end;
        end;


end;

procedure TFormRepBolnPlan.Button1Click(Sender: TObject);
begin
     CreateReport(2);
end;

end.
