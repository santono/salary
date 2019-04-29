unit UFormRepFondy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, frxClass, frxDBSet, ExtCtrls,
  scrDef;

type
  TFormRepFondy = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dtIn: TDateTimePicker;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure CreateReport;
    procedure fillPerson(curr_person:person_ptr);
//    procedure moveToExcel;
    procedure SwodToExcel;
//    function initListPlanRecs:boolean;

  public
    { Public declarations }
  end;

var
  FormRepFondy: TFormRepFondy;

implementation
  uses
      uFIBModule,UFormWait,ScrUtil,DateUtils,ComObj,ScrIO,
      scrLists;
  type pRec=^TRec;
       TRec=record
             fio      : string;
             tabno    : Integer;
             dolg     : string;
             shifrpod : Integer;
             shifrLine: integer;
             shifrDol : Integer;
             koef     : real;
             summaAdd : Real;
             summaUd  : Real;
             summaAddOsn : real;
             summaAddDop : real;
            end;

       pDistinctTabnoRec=^TDistinctTabnoRec;
       TDistinctTabnoRec=record
                           tabno     : integer;
                         end;

  var list         : TList;
      listInitRecs : TList;
      modeSort     : Integer;
      listDistinctTabno : TList;
{$R *.dfm}

procedure TFormRepFondy.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormRepFondy.FormCreate(Sender: TObject);
begin
     dtIn.Date        := IncMonth(Date,-1);

end;

procedure TFormRepFondy.BitBtn1Click(Sender: TObject);
begin
     CreateReport;
end;
function compare(Item1:Pointer;Item2:pointer):Integer;
 var retVal:Integer;
 begin
      if (modeSort=0) then
         retVal:=AnsiCompareText(pRec(Item1).fio,pRec(Item2).fio)
      else
      if (modeSort=1) then
         begin
              if pRec(Item1).shifrpod>pRec(Item2).shifrpod then retVal:=1
              else
              if pRec(Item1).shifrpod<pRec(Item2).shifrpod then retVal:=-1
              else
                retVal:=AnsiCompareText(pRec(Item1).fio,pRec(Item2).fio);
         end
      else
      if (modeSort=2) then
         begin
              if pRec(Item1).shifrDol>pRec(Item2).shifrDol then retVal:=1
              else
              if pRec(Item1).shifrDol<pRec(Item2).shifrDol then retVal:=-1
              else
                retVal:=AnsiCompareText(pRec(Item1).fio,pRec(Item2).fio);
         end;
      compare:=retVal;
 end;

procedure TFormRepFondy.CreateReport;
  var savNMES,savNSRV:integer;
      iNSRV,i:Integer;
      curr_person:PERSON_PTR;
  begin
       savNMES:=NMES;
       savNSRV:=NSRV;
       EMPTY_ALL_PERSON;
       list:=TList.Create;
       listDistinctTabno:=TList.Create;
       ProgressBar1.Min:=0;
       ProgressBar1.Max:=Count_Serv;
       ProgressBar1.Step:=1;
       for iNSRV:=1 to Count_Serv do
           begin
                NSRV:=iNSRV;
                MKFLNM;
                ProgressBar1.StepIt;
                Application.ProcessMessages;
                if not fileexists(FNINF) then Continue;
                if not nameservlist.IS_MO_BUD(nsrv) then continue;
                getinf(false);
                curr_person:=HEAD_PERSON;
                while (curr_person<>nil) do
                  begin
                       if curr_person^.GRUPPA=1 then
                          fillPerson(Curr_person);
                       curr_person:=curr_person^.NEXT;
                  end;
                EMPTY_ALL_PERSON;
           end;
       Application.ProcessMessages;
       list.Sort(@Compare);
       swodToExcel;
       if list.count>0 then
          for i:=0 to list.count-1 do
              dispose(pRec(list.Items[i]));
       list.Free;
       list:=nil;
       if listDistinctTabno.count>0 then
          for i:=0 to listDistinctTabno.count-1 do
              dispose(pDistinctTabnoRec(listDistinctTabno.Items[i]));
       listDistinctTabno.Free;
       listDistinctTabno:=nil;
       NMES:=savNMES;
       NSRV:=savNSRV;
       MKFLNM;
       getinf(true);
  end;
procedure TFormRepFondy.fillPerson(curr_person:person_ptr);
  var rec:pRec;
      shifrDol:integer;
      shifrKat:integer;
      i:integer;
      summaAdd,summaNal:real;
      summaAddOsn,summaAddDop:real;
    procedure insertIntoDistinct(tabno:integer;shifrLine:integer);
      var i:integer;
          finded:boolean;
          rec:pDistinctTabnoRec;
      begin
           finded:=false;
           if listDistinctTabno.count>0 then
              for i:=0 to listDistinctTabno.count-1 do
                  if (
                      (pDistinctTabnoRec(listDistinctTabno.Items[i])^.tabno=tabno)
                     ) then
                       begin
                            finded:=true;
                            break;
                       end;
           if not finded then
              begin
                   new(rec);
                   fillchar(rec^,sizeof(rec^),0);
                   rec.tabno:=tabno;
                   listDistinctTabno.Add(rec);
              end;
      end;
    function getSummaOsnAddForPerson(curr_person:PERSON_PTR):Real;
      var retVal:Real;
          curr_add:ADD_PTR;
      begin
          retVal:=0;
          curr_add:=curr_person.ADD;
          while (curr_add<>nil) do
             begin
                  if curr_add^.shifr=oklad_shifr then
                     retVal:=retVal+curr_add^.SUMMA;
                  curr_add:=curr_add.NEXT;
             end;
          getSummaOsnAddForPerson:=retVal;
      end;
    function getSummaDopAddForPerson(curr_person:PERSON_PTR):Real;
      var retVal:Real;
          curr_add:ADD_PTR;
      begin
          retVal:=0;
          curr_add:=curr_person.ADD;
          while (curr_add<>nil) do
             begin
                  if curr_add^.shifr<>oklad_shifr then
                  if not (
                      (curr_add^.shifr=bol_tek_shifr)
                      or
                      (curr_add^.shifr=bol_proshl_shifr)
                      or
                      (curr_add^.shifr=bol_future_shifr)
                      or
                      (curr_add^.shifr=KASSA_SHIFR)
                      or
                      (curr_add^.shifr=31)  // Мат помощь облагаемая
                      or
                      (curr_add^.shifr=dekret_shifr)
                      or
                      (curr_add^.shifr=141) // Мат помощь не облагаемая
                      ) then
                     retVal:=retVal+curr_add^.SUMMA;
                  curr_add:=curr_add.NEXT;
             end;
          getSummaDopAddForPerson:=retVal;
      end;

  begin
       shifrDol:=GET_DOL_CODE(curr_person);
       shifrKat:=0;
       summaAddOsn:=getSummaOsnAddForPerson(curr_person);
       summaAddDop:=getSummaDopAddForPerson(curr_person);
       summaNal:=getSummaNalogiPerson(curr_person);
   //    if abs(summaAdd)<0.01 then exit;
       insertIntoDistinct(curr_person^.TABNO,shifrkat);
       New(rec);
       rec.tabno    := curr_person^.tabno;
       rec.fio      := Trim(curr_person^.fio);
       rec.shifrpod := nsrv;
       rec.shifrDol := shifrDol;
       rec.dolg     := Trim(Curr_person^.DOLG);
       rec.shifrLine:= shifrKat;
       rec.koef     := GET_KOEF_OKLAD_PERSON(Curr_Person);
       rec.summaAdd := getSummaAddForPerson(curr_person);
       rec.summaAddOsn := summaAddOsn;
       rec.summaAddDop := summaAddDop;
       rec.summaUd  := summaNal;
       list.Add(Rec);
  end;

procedure TFormRepFondy.SwodToExcel;
var E,WC:Variant;
    FName,S:String;
    SummaTot,SummaClear,nmbOfSt,avgChisl:real;
    SummaOsnAdd, SummaDopAdd : real;
    k,i:integer;
    exRow:integer;
    h:string;
begin
//     FName:=TemplateDIR+'WorkersPlan.xlt';
     FName:=TemplateDIR+'PlanFondy_2019.xlt';
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
//     s:='Показатель средней заработной платы бюджетных учреждений за март 2018 года';
     h:='Показатель средней заработной платы бюджетных учреждений за '+GetMonthRus(NMES)+' '+intToStr(CurrYear)+' года';
     E.WorkBooks[1].WorkSheets[1].Cells[2,1] := h;
     SummaTot   := 0;
     SummaClear := 0;
     nmbOfSt    := 0;
     avgChisl   := 0;
     summaOsnAdd := 0;
     summaDopAdd := 0;
     for i:=0 to list.Count-1 do
        begin
             SummaOsnAdd   := summaOsnAdd   + pRec(list.Items[i]).summaAddOsn;
             SummaDopAdd   := summaDopAdd   + pRec(list.Items[i]).summaAddDop;
             nmbOfSt       := nmbOfSt    + pRec(list.Items[i]).koef;
        end;
     i:=listDistinctTabno.Count;
     for i:=0 to listDistinctTabno.Count-1 do
        begin
             avgChisl   := avgChisl   + 1.0;
        end;
     exRow:=8;
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2] := nmbOfSt;
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3] := avgChisl;
     if avgChisl>1.00 then
        E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4] := (SummaOsnAdd+SummaDopAdd) / avgChisl;
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5] := SummaOsnAdd;
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6] := SummaDopAdd;

end;

end.
