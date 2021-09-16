unit UFormRepPlanFondy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, frxClass, frxDBSet, ExtCtrls,
  scrDef;

type
  TFormRepPlanFondy = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dtIn: TDateTimePicker;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    cbListToExcel: TCheckBox;
    LabelFio: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure CreateReport;
    procedure fillPerson(curr_person:person_ptr);
    procedure moveToExcel;
    procedure SwodToExcel;
    function initListPlanRecs:boolean;

  public
    { Public declarations }
  end;

var
  FormRepPlanFondy: TFormRepPlanFondy;

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
             summaMp  : Real;
             summaOsn : Real;
             summaDop : Real;
            end;
       pIniRec=^TIniRec;
       TIniRec=record
                shifrPlanKat:integer;
                shifrDol:integer;
               end;
       pDistinctTabnoRec=^TDistinctTabnoRec;
       TDistinctTabnoRec=record
                           tabno     : integer;
                           shifrDol  : integer;
                           shifrLine : integer;
                         end;

  var list         : TList;
      listInitRecs : TList;
      modeSort     : Integer;
      listDistinctTabno : TList;
      E:Variant;
      FName:String;

{$R *.dfm}

procedure TFormRepPlanFondy.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;
function TFormRepPlanFondy.initListPlanRecs:boolean;
  var fi:system.text;
      fname:string;
      line:string;
      s,s1:string;
      i:integer;
      iVal,iErr:integer;
      shifrKat,shifrDol:integer;
      rec:pIniRec;
begin
     fname:=CDIR+'PlanWorkers2021.txt';
     if not FileExists(fname) then
        begin
             initListPlanRecs:=false;
             exit;
        end;
     assignFile(fi,fname);
     reset(fi);

     listInitRecs:=TList.Create;
     while (not eof(fi)) do
      begin
           readln(fi,line);
           i:=pos('--',line);
           if i>=3 then
             begin
                  s:=copy(line,1,i-1);
             end
           else
             begin
                 s:=copy(line,1,length(line));
             end;
           s:=trim(s);
           if (length(s)<7) then continue;

           s1:=copy(s,1,2);
           val(s1,iVal,iErr);
           if (iErr=0) then
              begin
                   ShifrKat:=iVal;
                   s1:=copy(s,4,4);
                   val(s1,iVal,iErr);
                   if (iErr=0) then
                      begin
                           ShifrDol:=iVal;
                           rec:=new(pIniRec);
                           rec^.shifrDol:=shifrDol;
                           rec^.shifrPlanKat:=shifrKat;
                           listInitRecs.add(rec);
                      end;
              end;
      end;
     CloseFile(fi);
     initListPlanRecs:=true;


end;

procedure TFormRepPlanFondy.FormCreate(Sender: TObject);
begin
     dtIn.Date        := IncMonth(Date,-1);
     BitBtn1.Enabled  := True;
     LabelFio.Caption := '';
     cbListToExcel.Checked:=True;
     caption:='Свод по рабочим должностям за '+GetMonthRus(MonthOf(dtIn.date))+ ' '+IntToStr(YearOf(dtIn.date))+' г.';
     Application.ProcessMessages;
end;

procedure TFormRepPlanFondy.BitBtn1Click(Sender: TObject);
begin
     if not initListPlanRecs then
        begin
             error('Ошибка чтения исходного файла PlanWorkers.txt');
             exit;
        end;
     BitBtn1.Enabled  := false;
     Application.ProcessMessages;
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

procedure TFormRepPlanFondy.CreateReport;
  var savNMES,savNSRV,savYear:integer;
      iNSRV,i:Integer;
      curr_person:PERSON_PTR;
  begin
       savNMES:=NMES;
       savNSRV:=NSRV;
       savYear:=CurrYear;
       EMPTY_ALL_PERSON;
       NMES:=MonthOf(dtIn.Date);
       CurrYear:=yearOf(dtIn.Date);
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
                if IsColedgPodr(NSRV) then continue;
                if not fileexists(FNINF) then Continue;
              //  if not nameservlist.IS_MO_BUD(nsrv) then continue;
                LabelFio.Caption:=Name_Serv(NSRV);
                Application.ProcessMessages;

                getinf(false);
                curr_person:=HEAD_PERSON;
                while (curr_person<>nil) do
                  begin
                       if curr_person^.gruppa=1 then
                          fillPerson(Curr_person);
                       curr_person:=curr_person^.NEXT;
                  end;
                EMPTY_ALL_PERSON;
           end;
       Application.ProcessMessages;
       list.Sort(@Compare);
     FName:=TemplateDIR+'WorkersPlan_2021.xlt';
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
     E.WorkBooks.Open(FName);
//     E.WorkBooks.add;
     E.Visible:=true;
       
       if cbListToExcel.Checked then 
          moveToExcel;
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
       CURRyEAR:=savYear;
       NMES:=savNMES;
       NSRV:=savNSRV;
       MKFLNM;
       getinf(true);
       ShowMessage('Свод по рабочим создан.');
       Self.Close;
  end;
procedure TFormRepPlanFondy.fillPerson(curr_person:person_ptr);
  const lenArray=9;
  const forbiddenDolg:array[1..lenArray] of integer=(4,5,6,7,8,9,1500,1510,1520);
  var rec:pRec;
      shifrDol:integer;
      shifrKat:integer;
      i:integer;
      summaOsn,summaDop,SummaMP:real;
    function inForbiddenDolgList(shifrDol:integer):Boolean;
     var i:Integer;
         finded:Boolean;
     begin
           finded:=False;
           for i:=1 to lenArray do
               if shifrDol=forbiddenDolg[i] then
                  begin
                       finded:=True;
                       Break;
                  end;
           inForbiddenDolgList := finded;
     end;
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
                      and
                      (pDistinctTabnoRec(listDistinctTabno.Items[i])^.shifrline=shifrline)
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
                   rec.shifrLine:=shifrline;
                   listDistinctTabno.Add(rec);
              end;
      end;
    function isDopSal(shifr:integer):Boolean;
      const l=10;
      const dopShifry:array[1..l] of Integer=(
              DogPodShifr
            , ZA_ZASL_PROF_SHIFR
            , ZA_ZW_ZASL_SHIFR
            , ZA_STEP_SHIFR
            , ZA_ZWAN_SHIFR
            , 7 //Доплата за выслугу шифр
            , VYSLUGA_SHIFR
            , ZAW_KAFEDROJ_SHIFR
            , NADBAWKA_K_Z_SHIFR
            , DOPLATA_K_ZARPL_SHIFR
            );
      var retVal:Boolean;
          i:Integer;
      begin
           retVal:=false;
           for i:=1 to l do
             begin
                  if shifr=dopShifry[i] then
                     begin
                          retVal:=true;
                          Break;
                     end;
             end;

           isDopSal:=retVal;
      end;
    function isOsnSal(shifr:integer):Boolean;
      const l=7;
      const wrongShifry:array[1..l] of Integer=(bol_tek_shifr,BOL_PROSHL_SHIFR,KASSA_SHIFR
            , DEKRET_SHIFR
            , 20  // за оздоровление
            , 31  // мат пом
            , 141 // мат пом
            );
      var retVal:Boolean;
          i:Integer;
      begin
           retVal:=True;
           for i:=1 to l do
             begin
                  if shifr=wrongShifry[i] then
                     begin
                          retVal:=False;
                          Break;
                     end;
             end;
           if retVal then
           if isDopSal(shifr) then
              retVal:=False;
           isOsnSal:=retVal;

      end;
    function getSummaOsnAddForPerson(curr_person:PERSON_PTR):Real;
      var retVal:Real;
          curr_add:ADD_PTR;
      begin
          retVal:=0;
          curr_add:=curr_person.ADD;
          while (curr_add<>nil) do
             begin
                  if isOsnSal(curr_add^.shifr) then
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
                  if isDopSal(curr_add^.shifr) then
                     retVal:=retVal+curr_add^.SUMMA;
                  curr_add:=curr_add.NEXT;
             end;
          getSummaDopAddForPerson:=retVal;
      end;
    function getSummaMPAddForPerson(curr_person:PERSON_PTR):Real;
      var retVal:Real;
          curr_add:ADD_PTR;
      begin
          retVal:=0;
          curr_add:=curr_person.ADD;
          while (curr_add<>nil) do
             begin
                  if ((curr_add^.shifr=31)  // Мат помощь облагаемая
                      or
                     (curr_add^.shifr=20) // Оздоровление
                      or
                      (curr_add^.shifr=141) // Мат помощь не облагаемая
                      ) then
                     retVal:=retVal+curr_add^.SUMMA;
                  curr_add:=curr_add.NEXT;
             end;
          getSummaMPAddForPerson:=retVal;
      end;

  begin
       shifrDol:=GET_DOL_CODE(curr_person);
       if inForbiddenDolgList(shifrDol) then Exit;
       shifrKat:=0;
       if listInitRecs.Count=0 then exit;
       for i:=0 to listInitRecs.Count-1 do
           begin
                if shifrDol=pIniRec(listINitRecs.Items[i]).shifrDol then
                   begin
                        shifrKat:=pIniRec(listINitRecs.Items[i]).shifrPlanKat;
                        break;
                   end;
           end;
       if shifrKat=0 then exit;
       summaDop:=0;
       summaOsn:=0;
       summaMP:=0;
//       if not DOG_POD_PODRAZD(nsrv) then
//          begin
               summaOsn := getSummaOsnAddForPerson(curr_person);
               summaDop := getSummaDopAddForPerson(curr_person);
               summaMP  := getSummaMPAddForPerson(curr_person);
//          end
//       else
//          summaDop := getSummaNalogiPerson(curr_person);
       if ((abs(summaOsn)<0.01)
       and (abs(summaDop)<0.01)
       and (abs(summaMP)<0.01)) then Exit;
       insertIntoDistinct(curr_person^.TABNO,shifrkat);
       New(rec);
       rec.tabno    := curr_person^.tabno;
       rec.fio      := Trim(curr_person^.fio);
       rec.shifrpod := nsrv;
       rec.shifrDol := shifrDol;
       rec.dolg     := Trim(Curr_person^.DOLG);
       rec.shifrLine:= shifrKat;
       rec.koef     := GET_KOEF_OKLAD_PERSON(Curr_Person);
       rec.summaOsn := summaOsn;
       rec.summaDop := summaDop;
       rec.summaMP  := summaMP;
       list.Add(Rec);
  end;
procedure TFormRepPlanFondy.moveToExcel;
  var
    ExRow,ExCol:integer;
    i:Integer;
    currPod:Integer;
    lineno:Integer;
    currdol:Integer;
    currGru:Integer;
    wbs:variant;
  begin
   //  if not cbListToExcel.Checked then Exit;
     currPod:=0;
     currDol:=0;
     currGru:=0;
     FormWait.Show;
     Application.ProcessMessages;
     exRow:=5;
     wbs:=E.WorkBooks[1].WorkSheets[2];
     wbs.Cells[ExRow-2,1]:='Список работников для свода за '+getMonthRus(NMES)+' '+intToStr(CurrYear)+' г.';
     ProgressBar1.Max:=list.Count;
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     Application.ProcessMessages;
     for i:=0 to list.Count-1 do
       begin
            ProgressBar1.StepIt;
            LabelFio.Caption:=Trim(pRec(list.Items[i]).fio);
            Application.ProcessMessages;
            Inc(exRow);
            lineno:=0;
            if modeSort=0 then
               begin
                    wbs.Cells[ExRow,1]:=i+1;
                    wbs.Cells[ExRow,2]:=pRec(list.Items[i]).fio;
                    wbs.Cells[ExRow,3]:=pRec(list.Items[i]).dolg;
                    wbs.Cells[ExRow,4]:=pRec(list.Items[i]).shifrLine;
                    wbs.Cells[ExRow,5]:=pRec(list.Items[i]).koef;
                    wbs.Cells[ExRow,6]:=pRec(list.Items[i]).dolg;
                    wbs.Cells[ExRow,7]:=pRec(list.Items[i]).summaOsn;
                    wbs.Cells[ExRow,8]:=pRec(list.Items[i]).summaDop;
                    wbs.Cells[ExRow,9]:=pRec(list.Items[i]).summaMP;
                    wbs.Cells[ExRow,10]:=pRec(list.Items[i]).shifrpod;
                    wbs.Cells[ExRow,11]:=pRec(list.Items[i]).shifrdol;
               end
            else
            if (modeSort=1) then
               begin
                    if currPod<>pRec(list.Items[i]).shifrpod then
                       begin
                            currPod:=pRec(list.Items[i]).shifrpod;
                            wbs.Cells[ExRow,2]:=Name_Serv(currPod);
                            Inc(ExRow);
                            lineno:=0;
                       end;
                       Inc(lineno);
                       wbs.Cells[ExRow,1]:=lineno;
                       wbs.Cells[ExRow,2]:=pRec(list.Items[i]).fio;
                       wbs.Cells[ExRow,3]:=pRec(list.Items[i]).dolg;
                       wbs.Cells[ExRow,4]:=pRec(list.Items[i]).summaOSN;
                       wbs.Cells[ExRow,5]:=pRec(list.Items[i]).summaDop;
                       wbs.Cells[ExRow,6]:=pRec(list.Items[i]).summaMP;
               end
            else
            if (modeSort=2) then
               begin
                    if currDol<>pRec(list.Items[i]).shifrDol then
                       begin
                            currDol:=pRec(list.Items[i]).shifrDol;
                            wbs.Cells[ExRow,2]:=NameDolgList.GetName(currDol);// NAME_DOLG(currDol);
                            Inc(ExRow);
                            lineno:=0;
                       end;
                       Inc(lineno);
                       wbs.Cells[ExRow,1]:=lineno;
                       wbs.Cells[ExRow,2]:=pRec(list.Items[i]).fio;
                       wbs.Cells[ExRow,3]:=pRec(list.Items[i]).dolg;
                       wbs.Cells[ExRow,4]:=Name_Serv(pRec(list.Items[i]).shifrpod);
                       wbs.Cells[ExRow,5]:=pRec(list.Items[i]).summaOsn;
                       wbs.Cells[ExRow,6]:=pRec(list.Items[i]).summaDop;
                       wbs.Cells[ExRow,7]:=pRec(list.Items[i]).summaMP;
               end
            else
               begin
//                    if currGru<>pRec(list.Items[i]).shifrGru then
//                       begin
//                            currGru:=pRec(list.Items[i]).shifrGru;
//                            wbs.Cells[ExRow,2]:=ist_fin_name[currGru];
//                            Inc(ExRow);
//                            lineno:=0;
//                       end;
                       Inc(lineno);
                       wbs.Cells[ExRow,1]:=lineno;
                       wbs.Cells[ExRow,2]:=pRec(list.Items[i]).fio;
                       wbs.Cells[ExRow,3]:=pRec(list.Items[i]).dolg;
                       wbs.Cells[ExRow,4]:=Name_Serv(pRec(list.Items[i]).shifrpod);
                       wbs.Cells[ExRow,5]:=pRec(list.Items[i]).summaOsn;
                       wbs.Cells[ExRow,6]:=pRec(list.Items[i]).summaDop;
                       wbs.Cells[ExRow,7]:=pRec(list.Items[i]).summaMP;
               end

       end;
     FormWait.Hide;
     Application.ProcessMessages;
//     E.Visible:=true;


  end;

procedure TFormRepPlanFondy.SwodToExcel;
const maxKat=10;
var
    S:String;
    SummaTot,SummaOsn,SummaDop, summaMp, nmbOfSt,avgChisl:real;

    k,i,j:integer;
    exRow:integer;
    h:string;
    wbs:variant;
    listUniqRow:TList;
    shifrRow:Integer;
    item:Pinteger;
    finded:Boolean;
begin
//     FName:=TemplateDIR+'WorkersPlan.xlt';
//     s:='Показатель средней заработной платы бюджетных учреждений за март 2018 года';
     caption:='Свод по рабочим должностям за '+GetMonthRus(MonthOf(dtIn.date))+ ' '+IntToStr(YearOf(dtIn.date))+' г.';
     Application.ProcessMessages;
     listUniqRow:=TList.Create;
     for i:=0 to list.Count-1 do
         begin
               shifrRow:=pRec(list.Items[i]).shifrLine;
               finded:=false;
               if listUniqRow.Count>0 then
                  for j:=0 to listUniqRow.Count-1 do
                      if PInt(listUniqRow.Items[j])^=shifrRow then
                         begin
                              finded:=True;
                              Break;
                         end;
                  if Not Finded then
                  begin
                    New(Item);
                    Item^:=shifrRow;
                    listUniqRow.Add(item);
                  end;
         end;

     h:='Показатель средней заработной платы бюджетных учреждений за '+GetMonthRus(MonthOf(dtIn.date))+' '+intToStr(yearOf(dtIn.date))+' года';
     wbs:=E.WorkBooks[1].WorkSheets[1];
     wbs.Cells[2,1] := h;
     for k:=0 to listUniqRow.count-1 do
        begin
             SummaTot   := 0;
             SummaOsn   := 0;
             SummaDop   := 0;
             SummaMp    := 0;
             nmbOfSt    := 0;
             avgChisl   := 0;
             shifrRow   := PInteger(listUniqRow.items[k])^;
             for i:=0 to list.Count-1 do
                 begin
                      if pRec(list.Items[i]).shifrLine=shifrrow then
                         begin
                               SummaTot   := summaTot   + pRec(list.Items[i]).summaOsn + pRec(list.Items[i]).summaDop + + pRec(list.Items[i]).summaMp;
                               SummaOsn   := SummaOsn   + pRec(list.Items[i]).summaOsn;
                               SummaDop   := SummaDop   + pRec(list.Items[i]).summaDop;
                               summaMp    := SummaMP    + pRec(list.Items[i]).summaMp;
                               nmbOfSt    := nmbOfSt    + pRec(list.Items[i]).koef;
                         end;
                 end;
             i:=listDistinctTabno.Count;
             for i:=0 to listDistinctTabno.Count-1 do
                 begin
                      if pDistinctTabnoRec(listDistinctTabno.Items[i]).shifrLine=shifrrow then
                         avgChisl   := avgChisl   + 1.0;
                 end;
         //    exRow:=6+k;
             exRow:=shifrRow;
           //  wbs.Cells[ExRow,3] := nmbOfSt;
             wbs.Cells[ExRow,3] := avgChisl;
             if Abs(summaOsn)>0.01 then
                wbs.Cells[ExRow,5] := SummaOsn;
             if Abs(summaDop)>0.01 then
                wbs.Cells[ExRow,6] := SummaDop;
             if Abs(summaMP)>0.01 then
                wbs.Cells[ExRow,7] := SummaMP;
//             if avgChisl>0.01 then
//             wbs.Cells[ExRow,7] := SummaClear/avgChisl;
        end;
     if listUniqRow.Count>0 then
        for j:=0 to listUniqRow.Count-1 do
            dispose(listUniqRow.Items[j]);
     listUniqRow.Free;


end;

end.
