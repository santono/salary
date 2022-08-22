unit UFormRepWordkers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, frxClass, frxDBSet, ExtCtrls,
  scrDef;

type
  TFormRepWordkers = class(TForm)
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
  FormRepWordkers: TFormRepWordkers;

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

procedure TFormRepWordkers.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;
function TFormRepWordkers.initListPlanRecs:boolean;
  var fi:system.text;
      fname:string;
      line:string;
      s,s1:string;
      i:integer;
      iVal,iErr:integer;
      shifrKat,shifrDol:integer;
      rec:pIniRec;
begin
     fname:=CDIR+'PlanWorkers2022.txt';
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
           if (length(s)<3) then continue;
           i:=pos(' ',s);
           if (i<=0) then continue;
           s1:=copy(s,1,i-1);
           val(s1,iVal,iErr);
           if (iErr=0) then
              begin
                   ShifrKat:=iVal;
                   s1:=copy(s,i+1,length(s)-i);
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

procedure TFormRepWordkers.FormCreate(Sender: TObject);
begin
     dtIn.Date        := IncMonth(Date,-1);
     BitBtn1.Enabled  := True;
     LabelFio.Caption := '';
     cbListToExcel.Checked:=True;
     caption:='Свод по рабочим должностям за '+GetMonthRus(MonthOf(dtIn.date))+ ' '+IntToStr(YearOf(dtIn.date))+' г.';
     Application.ProcessMessages;
end;

procedure TFormRepWordkers.BitBtn1Click(Sender: TObject);
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

procedure TFormRepWordkers.CreateReport;
  var savNMES,savNSRV,savYear:integer;
      iNSRV,i:Integer;
      curr_person:PERSON_PTR;
  begin
       savNMES:=NMES;
       savNSRV:=NSRV;
       savYear:=CURRyEAR;
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
                if not nameservlist.IS_MO_BUD(nsrv) then continue;
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
     FName:=TemplateDIR+'WorkersPlan_2022.xlt';
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
procedure TFormRepWordkers.fillPerson(curr_person:person_ptr);
  const lenArray=9;
  const forbiddenDolg:array[1..lenArray] of integer=(4,5,6,7,8,9,1500,1510,1520);
  var rec:pRec;
      shifrDol:integer;
      shifrKat:integer;
      i:integer;
      summaAdd,summaNal:real;
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
    function getSummaSummaOsnAddForPerson(curr_person:PERSON_PTR):Real;
      var retVal:Real;
          curr_add:ADD_PTR;
      begin
          retVal:=0;
          curr_add:=curr_person.ADD;
          while (curr_add<>nil) do
             begin
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
          getSummaSummaOsnAddForPerson:=retVal;
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
       if shifrKat=0 then
       if curr_person^.KATEGORIJA=3 then shifrKat:=12;
       summaAdd:=getSummaSummaOsnAddForPerson(curr_person);
       summaNal:=getSummaNalogiPerson(curr_person);
       if abs(summaAdd)<0.01 then exit;
       insertIntoDistinct(curr_person^.TABNO,shifrkat);
       New(rec);
       rec.tabno    := curr_person^.tabno;
       rec.fio      := Trim(curr_person^.fio);
       rec.shifrpod := nsrv;
       rec.shifrDol := shifrDol;
       rec.dolg     := Trim(Curr_person^.DOLG);
       rec.shifrLine:= shifrKat;
       rec.koef     := GET_KOEF_OKLAD_PERSON(Curr_Person);
       rec.summaAdd := summaAdd;
       rec.summaUd  := summaNal;
       list.Add(Rec);
  end;
procedure TFormRepWordkers.moveToExcel;
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
                    wbs.Cells[ExRow,7]:=pRec(list.Items[i]).summaAdd;
                    wbs.Cells[ExRow,8]:=pRec(list.Items[i]).summaUd;
                    wbs.Cells[ExRow,9]:=pRec(list.Items[i]).shifrpod;
                    wbs.Cells[ExRow,10]:=pRec(list.Items[i]).shifrdol;
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
                       wbs.Cells[ExRow,4]:=pRec(list.Items[i]).summaAdd;
              //         wbs.Cells[ExRow,5]:=pRec(list.Items[i]).summaUd;
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
                       wbs.Cells[ExRow,5]:=pRec(list.Items[i]).summaAdd;
                //       wbs.Cells[ExRow,6]:=pRec(list.Items[i]).summaUd;
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
                       wbs.Cells[ExRow,5]:=pRec(list.Items[i]).summaAdd;
                  //     wbs.Cells[ExRow,6]:=pRec(list.Items[i]).summaUd;
               end

       end;
     FormWait.Hide;
     Application.ProcessMessages;
//     E.Visible:=true;


  end;

procedure TFormRepWordkers.SwodToExcel;
const maxKat=15;
var
    S:String;
    SummaTot,SummaClear,nmbOfSt,avgChisl:real;

    k,i:integer;
    exRow:integer;
    h:string;
    wbs:variant;
begin
//     FName:=TemplateDIR+'WorkersPlan.xlt';
//     s:='Показатель средней заработной платы бюджетных учреждений за март 2018 года';
     caption:='Свод по рабочим должностям за '+GetMonthRus(MonthOf(dtIn.date))+ ' '+IntToStr(YearOf(dtIn.date))+' г.';
     Application.ProcessMessages;

     h:='Показатель средней заработной платы бюджетных учреждений за '+GetMonthRus(MonthOf(dtIn.date))+' '+intToStr(yearOf(dtIn.date))+' года';
     wbs:=E.WorkBooks[1].WorkSheets[1];
 //    wbs.Cells[2,1] := h;
     for k:=6 to maxKat do
        begin
             SummaTot   := 0;
             SummaClear := 0;
             nmbOfSt    := 0;
             avgChisl   := 0;
             for i:=0 to list.Count-1 do
                 begin
                      if pRec(list.Items[i]).shifrLine=k then
                         begin
                               SummaTot   := summaTot   + pRec(list.Items[i]).summaAdd;
                               SummaClear := summaClear + pRec(list.Items[i]).summaAdd-pRec(list.Items[i]).summaUd;
                               nmbOfSt    := nmbOfSt    + pRec(list.Items[i]).koef;
                         end;
                 end;
             i:=listDistinctTabno.Count;
             for i:=0 to listDistinctTabno.Count-1 do
                 begin
                      if pDistinctTabnoRec(listDistinctTabno.Items[i]).shifrLine=k then
                         avgChisl   := avgChisl   + 1.0;
                 end;
 //            exRow:=6+k;
             exRow:=k;
             if exRow in [6,12,13,14,15] then
                begin
//             wbs.Cells[ExRow,3] := nmbOfSt;
             wbs.Cells[ExRow,3] := avgChisl;
             wbs.Cells[ExRow,5] := SummaTot;
             if avgChisl>0.01 then
             wbs.Cells[ExRow,4] := SummaClear/avgChisl;
                end;
        end;

end;

end.
