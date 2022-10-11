unit UFormRepPlanZP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, frxClass, frxDBSet, ExtCtrls,
  scrDef;

type
  TFormRepPlanZP = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dtFr: TDateTimePicker;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    cbListToExcel: TCheckBox;
    LabelFio: TLabel;
    Label1: TLabel;
    dtTo: TDateTimePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure CreateReport;
    procedure fillPerson(curr_person:person_ptr);
 //   procedure moveToExcel;
    procedure fillFinalList;
    procedure SwodToExcel;
    function  initDolgList : boolean;
    function  initPodrList : boolean;
    function  initShifrList : boolean;
  public
    { Public declarations }
  end;

var
  FormRepPlanZP: TFormRepPlanZP;

implementation
  uses
      uFIBModule,UFormWait,ScrUtil,DateUtils,ComObj,ScrIO,
      scrLists;
  type pRec=^TRec;
       TRec=record
             fio      : string;
             tabno    : Integer;
             list     : TList;
            end;
       pDetRec=^TDetRec;
       TDetRec=record
                 shifrLine : integer;
                 shifrWR   : Integer;
                 shifrGru  : Integer;
                 dolg      : string;
                 shifrpod  : Integer;
                 shifrDol  : Integer;
                 summaAdd  : Real;
               end;
       pDolgRec=^TDolgRec;
       TDolgRec=record
                shifrRow:integer;
                shifrDol:integer;
               end;
       pDistinctTabnoRec=^TDistinctTabnoRec;
       TDistinctTabnoRec=record
                           tabno     : integer;
                           shifrDol  : integer;
                           shifrLine : integer;
                         end;
       pFinalRec=^TFinalRec;
       TFinalRec=record
                   shifrRow:Integer;
                   summaFond:Real;
                   summaSowm:Real;
                   summaSowmVne:Real;
                   summaBud:Real;
                   summaVne:real;
                   summaBudVne:Real;
                   summaVneVne:Real;
                 end;

//  const nup=
//  const notusedpodr:array[1..nup] of integer =
  var list         : TList;
      DolgList     : TList;
      modeSort     : Integer;
      listDistinctTabno : TList;
      notUsedPodrList:TList;
      notUsedShifrList:TList;
      finalList:TList;
      E:Variant;
      FName:String;

{$R *.dfm}

procedure TFormRepPlanZP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;
function TFormRepPlanZP.initDolgList:boolean;
  var fi:system.text;
      fname:string;
      line:string;
      s,s1:string;
      i:integer;
      iVal,iErr:integer;
      shifrRow,shifrDol:integer;
      rec:pDolgRec;
      findedHeader:boolean;
      keyString:string;
begin
     keyString:='### Dolgnosti ###';
     fname:=CDIR+'PlanZP.txt';
     if not FileExists(fname) then
        begin
             ShowMessage('Не найден файл '+CDIR+'planZP.txt');
             initDolgList:=false;
             exit;
        end;
     assignFile(fi,fname);
     reset(fi);
     findedHeader:=false;
     while (not eof(fi)) do
      begin
           readln(fi,line);
           line:=Trim(line);
           if Pos(keyString,line)=1 then
              begin
                   findedHeader:=true;
                   Break;
              end;
      end;
     if not  findedHeader  then
        begin
             ShowMessage('Неверная структура файлф '+CDIR+'planZP.txt. Нет заголовка должности');
             initDolgList:=false;
             exit;
        end;
     DolgList:=TList.Create;
     while (not eof(fi)) do
      begin
           readln(fi,line);
           line:=Trim(line);
           i:=Pos('end',line);
           if i>0 then
              break;
           i:=Pos('#',line);
           if i>0 then Continue;
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
                   ShifrRow:=iVal;
                   s1:=copy(s,i+1,length(s)-i);
                   val(s1,iVal,iErr);
                   if (iErr=0) then
                      begin
                           ShifrDol:=iVal;
                           rec:=new(pDolgRec);
                           rec^.shifrDol:=shifrDol;
                           rec^.shifrRow:=shifrRow;
                           DolgList.add(rec);
                      end;
              end;

      end;
     CloseFile(fi);
     initDolgList:=true;
end;
function TFormRepPlanZP.initPodrList:boolean;
  var fi:system.text;
      fname:string;
      line:string;
      s,s1:string;
      i:integer;
      iVal,iErr:integer;
      shifrPod:integer;
      pInt:PInteger;
      findedHeader:boolean;
      keyString:string;
begin
     keyString:='### Podrazdeleniya ###';
     fname:=CDIR+'PlanZP.txt';
     assignFile(fi,fname);
     reset(fi);
     findedHeader:=false;
     while (not eof(fi)) do
      begin
           readln(fi,line);
           line:=Trim(line);
           if Pos(keyString,line)=1 then
              begin
                   findedHeader:=true;
                   Break;
              end;
      end;
     if not  findedHeader  then
        begin
             ShowMessage('Неверная структура файлф '+CDIR+'planZP.txt. Нет заголовка подразделений');
             initPodrList:=false;
             exit;
        end;
     notUsedPodrList:=TList.Create;
     while (not eof(fi)) do
      begin
           readln(fi,line);
           line:=Trim(line);
           i:=Pos('end',line);
           if i>0 then
              break;
           i:=Pos('#',line);
           if i>0 then Continue;
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
           if (length(s)<1) then continue;
           s1:=s;
           val(s1,iVal,iErr);
           if (iErr=0) then
              begin
                   ShifrPod:=iVal;
                   New(pInt);
                   pInt^:=shifrPod;
                   notUsedPodrList.Add(pInt);
              end;

      end;
     CloseFile(fi);
     initPodrList:=true;
end;
function TFormRepPlanZP.initShifrList:boolean;
  var fi:system.text;
      fname:string;
      line:string;
      s,s1:string;
      i:integer;
      iVal,iErr:integer;
      shifrSta:integer;
      pInt:PInteger;
      findedHeader:boolean;
      keyString:string;
begin
     keyString:='### Shifry ###';
     fname:=CDIR+'PlanZP.txt';
     assignFile(fi,fname);
     reset(fi);
     findedHeader:=false;
     while (not eof(fi)) do
      begin
           readln(fi,line);
           line:=Trim(line);
           if Pos(keyString,line)=1 then
              begin
                   findedHeader:=true;
                   Break;
              end;
      end;
     if not  findedHeader  then
        begin
             ShowMessage('Неверная структура файлф '+CDIR+'planZP.txt. Нет заголовка шифров статей');
             initShifrList:=false;
             exit;
        end;
     notUsedShifrList:=TList.Create;
     while (not eof(fi)) do
      begin
           readln(fi,line);
           line:=Trim(line);
           i:=Pos('end',line);
           if i>0 then
              break;
           i:=Pos('#',line);
           if i>0 then Continue;
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
           if (length(s)<1) then continue;
           s1:=s;
           val(s1,iVal,iErr);
           if (iErr=0) then
              begin
                   ShifrSta:=iVal;
                   New(pInt);
                   pInt^:=shifrSta;
                   notUsedShifrList.Add(pInt);
              end;

      end;
     CloseFile(fi);
     initShifrList:=true;
end;

procedure TFormRepPlanZP.FormCreate(Sender: TObject);
begin
     dtFr.Date        := IncMonth(Date,-1);
     dtFr.Date        := RecodeDay(dtFr.Date,1);
     dtTo.Date        := dtFr.Date;
     BitBtn1.Enabled  := True;
     LabelFio.Caption := '';
     cbListToExcel.Checked:=True;
     caption:='Свод ЗП образование c '+GetMonthRus(MonthOf(dtFr.date))+ ' '+IntToStr(YearOf(dtFr.date))+' г. по '+GetMonthRus(MonthOf(dtTo.date))+ ' '+IntToStr(YearOf(dtTo.date));
     Application.ProcessMessages;
end;

procedure TFormRepPlanZP.BitBtn1Click(Sender: TObject);
begin
     if not initDolgList then
        begin
             error('Ошибка чтения исходного файла PlanZP.txt');
             exit;
        end;
     if not initPodrList then
        begin
             error('Ошибка чтения исходного файла PlanZP.txt');
             exit;
        end;
     if not initShifrList then
        begin
             error('Ошибка чтения исходного файла PlanZP.txt');
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
         begin
              if pRec(Item1).tabno>pRec(Item2).tabno then retVal:=1
              else
              if pRec(Item1).tabno<pRec(Item2).tabno then retVal:=-1
              else
                retVal := 0; //AnsiCompareText(pRec(Item1).fio,pRec(Item2).fio);
         end;
      compare:=retVal;
 end;

procedure TFormRepPlanZP.CreateReport;
  var savNMES,savNSRV,savYear:integer;
      iNSRV,i,j:Integer;
      curr_person:PERSON_PTR;
      iCountMonth,countMonth:Integer;
      dateFr,dateTo:TDate;
    function isInForbiddenPodr(shifrPod:integer):Boolean;
       var retVal:Boolean;
           i:Integer;
       begin
            retVal:=False;
            if notUsedPodrList.Count>0 then
               for i:=0 to notUsedPodrList.count-1 do
                   if PInteger(notUsedPodrList.Items[i])^=shifrPod then
                      begin
                           retVal:=False;
                           break;
                      end;
            isInForbiddenPodr:=retVal;
       end;
      
  begin
       savNMES:=NMES;
       savNSRV:=NSRV;
       savYear:=CURRyEAR;
       dateFr:=EncodeDate(YearOf(dtFr.Date),MonthOf(dtFr.Date),1);
       dateTo:=EncodeDate(YearOf(dtTo.Date),MonthOf(dtTo.Date),1);
       if dateFr > dateTo then
          begin
               ShowMessage('Начальная дата больше конечной');
               Exit;
          end;
       EMPTY_ALL_PERSON;
       NMES:=MonthOf(dtFr.Date);
       CurrYear:=yearOf(dtFr.Date);
       countMonth := 0;
       if (nmes=monthOf(dtTo.date)) and
          (currYear=yearOf(dtTo.date)) then
          countMonth:=1;
       if countMonth=0 then
       while True do
         begin
              Inc(countMonth);
              inc(nmes);
              if NMES>12 then
                 begin
                      nmes:=1;
                      Inc(CurrYear);
                 end;
              if (NMES=MonthOf(dtTo.Date)) and
                 (currYear=yearOf(dtTo.Date)) then
                 break;
         end;
       if countMonth>12 then
          begin
               ShowMessage('Запрошен отчет за период больше года');
               Exit;
          end;
       NMES:=MonthOf(dtFr.Date);
       CurrYear:=yearOf(dtFr.Date);
       list:=TList.Create;
       listDistinctTabno := TList.Create;
       ProgressBar1.Min  := 0;
       ProgressBar1.Max  := Count_Serv * countMonth;
       ProgressBar1.Step := 1;
       for iCountMonth:=1 to countMonth do
           begin
            for iNSRV:=1 to Count_Serv do
              begin
                NSRV:=iNSRV;
                MKFLNM;
                ProgressBar1.StepIt;
                Application.ProcessMessages;
                if IsColedgPodr(NSRV) then continue;
                if isInForbiddenPodr(NSRV) then Continue;
                if not fileexists(FNINF) then Continue;
//                if not nameservlist.IS_MO_BUD(nsrv) then continue;
                LabelFio.Caption:=Name_Serv(NSRV);
                Application.ProcessMessages;

                getinf(false);
                curr_person:=HEAD_PERSON;
                while (curr_person<>nil) do
                  begin
//                       if curr_person^.gruppa=1 then
                          fillPerson(Curr_person);
                       curr_person:=curr_person^.NEXT;
                  end;
                EMPTY_ALL_PERSON;
              end;
              inc(nmes);
              if NMES>12 then
                 begin
                      nmes:=1;
                      Inc(CURRYEAR);
                 end;
           end;
       Application.ProcessMessages;
       fillFinalList;
       list.Sort(@Compare);
       FName:=TemplateDIR+'PlanZP.xlt';
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

//       if cbListToExcel.Checked then
//          moveToExcel;
       swodToExcel;
       if list.count>0 then
          for i:=0 to list.count-1 do
              begin
                   if pRec(list.Items[i]).list.count>0 then
                      for j:=0 to pRec(list.Items[i]).list.count-1 do
                          dispose(pDetRec(pRec(list.Items[i]).list.Items[j]));

                   dispose(pRec(list.Items[i]));
              end;
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
       ShowMessage('Свод создан.');
       Self.Close;
  end;
procedure TFormRepPlanZP.fillPerson(curr_person:person_ptr);
//  const lenArray=9;
//  const forbiddenDolg:array[1..lenArray] of integer=(4,5,6,7,8,9,1500,1510,1520);
  const lenArray=4;
  const forbiddenDolg:array[1..lenArray] of integer=(9,1500,1510,1520);
  var rec:pRec;
      shifrDol:integer;
      shifrRow:integer;
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
    function getRowByDolCode(shifrDol:integer):Integer;
     var i:Integer;
         retVal:Integer;
         finded:Boolean;
     begin
          retVal:=0;
          finded:=False;
          if dolgList.count>0 then
             for i:=0 to DolgList.Count-1 do
                 if pDolgRec(DolgList.Items[i])^.shifrDol=shifrDol then
                    begin
                         finded:=True;
                         retVal:=pDolgRec(DolgList.Items[i])^.shifrRow;
                         Break;
                    end;
          getRowByDolCode:=retVal;
     end;
    procedure insertIntoCollection(curr_person:PERSON_PTR;summaAdd:real);
     var rec:pRec;
         detRec:pDetRec;
         finded:Boolean;
         i:Integer;
         shifrRow:Integer;
         shifrDol:Integer;
         shifrWR:Integer;
     begin
         finded:=False;
         if list.Count>0 then
            for i:=0 to list.Count-1 do
                if pRec(list.Items[i]).tabno=curr_person^.TABNO then
                   begin
                        finded:=True;
                        rec:=pRec(list.Items[i]);
                        Break;
                   end;
         if not finded then
            begin
                 New(rec);
                 rec.tabno    := curr_person^.tabno;
                 rec.fio      := Trim(curr_person^.fio);
                 rec.list     := TList.Create;
                 list.Add(rec);
            end;

       shifrDol := 0;
       shifrDol := GET_DOL_CODE(curr_person);
       shifrRow := 0;
       // Проверить ИПДО                      13 - счет
       if ((nsrv=115) or (curr_person^.gruppa=22)) then
           shifrRow:=11
       else    
       if shifrDol>0 then
          if shifrDol<10 then //Договора подряда
             case curr_person^.KATEGORIJA of
               1 : shifrRow:=10;  // ППС
               3 : shifrRow:=12;  // Научный сотрудник
              else
                   shifrRow:=21;
             end       
          else
          shifrRow:=getRowByDolCode(shifrDol);
       if shifrRow=0 then
          shifrRow:=21; //Прочие
       if IS_OSN_WID_RABOTY(curr_person) then
          shifrWR:=1
       else
          shifrWR:=2;
       if curr_person^.MESTO_OSN_RABOTY in [82,121] then
          shifrWR:=3;
       finded:=false;
       if rec^.list.count>0 then
          for i:=0 to rec.list.count-1 do
              if PDetRec(rec.list.Items[i]).shifrLine = shifrRow then
              if PDetRec(rec.list.Items[i]).shifrWR   = shifrWR   then
              if PDetRec(rec.list.Items[i]).shifrGru  = curr_person^.gruppa   then
                 begin
                      detRec := PDetRec(rec.list.Items[i]);
                      finded := True;
                      Break;
                 end;
       if not finded then
          begin
               New(detRec);
               FillChar(detRec^,SizeOf(tdetrec),0);
               detRec.shifrLine:=shifrRow;
               detRec.shifrWR:=shifrWR;
               detRec.shifrDol:=shifrDol;
               detRec.dolg:=curr_person^.DOLG;
               detRec.shifrGru:=curr_person^.GRUPPA;
               detRec.shifrpod:=NSRV;
               detRec.summaAdd:=0.00;
               rec.list.Add(detRec);
          end;
       detRec.summaAdd  := detRec.summaAdd+summaAdd;

     end;
    function isInForbiddenShifr(shifr:integer):Boolean;
       var retVal:Boolean;
           i:Integer;
       begin
            retVal:=False;
            if notUsedShifrList.Count>0 then
               for i:=0 to notUsedShifrList.count-1 do
                   if PInteger(notUsedShifrList.Items[i])^=shifr then
                      begin
                           retVal:=False;
                           break;
                      end;
            isInForbiddenShifr:=retVal;
       end;
    function getSummaSummaOsnAddForPerson(curr_person:PERSON_PTR):Real;
      var retVal:Real;
          curr_add:ADD_PTR;
      begin
          retVal:=0;
          curr_add:=curr_person.ADD;
          while (curr_add<>nil) do
             begin
//                  if not (
//                      (curr_add^.shifr=bol_tek_shifr)
//                      or
//                      (curr_add^.shifr=bol_proshl_shifr)
//                      or
//                      (curr_add^.shifr=bol_future_shifr)
//                      or
//                      (curr_add^.shifr=KASSA_SHIFR)
//                      or
//                      (curr_add^.shifr=31)  // Мат помощь облагаемая
//                      or
//                      (curr_add^.shifr=dekret_shifr)
//                      or
//                      (curr_add^.shifr=141) // Мат помощь не облагаемая
//                      ) then
                  if not isInForbiddenShifr(curr_add^.shifr) then
                     retVal:=retVal+curr_add^.SUMMA;
                  curr_add:=curr_add.NEXT;
             end;
          getSummaSummaOsnAddForPerson:=retVal;
      end;

  begin
       shifrDol:=GET_DOL_CODE(curr_person);
       if inForbiddenDolgList(shifrDol) then Exit;
       shifrRow:=0;
       if dolgList.Count=0 then exit;
       for i:=0 to dolgList.Count-1 do
           begin
                if shifrDol=pDolgRec(dolgList.Items[i]).shifrDol then
                   begin
                        shifrRow:=pDolgRec(dolgList.Items[i]).shifrRow;
                        break;
                   end;
           end;
       if shifrRow=0 then
       if curr_person^.KATEGORIJA=3 then shifrRow:=12;
       summaAdd:=getSummaSummaOsnAddForPerson(curr_person);
       summaNal:=getSummaNalogiPerson(curr_person);
       if abs(summaAdd)<0.01 then exit;
       insertIntoDistinct(curr_person^.TABNO,shifrRow);
       insertIntoCollection(curr_person,summaAdd);
  end;
(*
procedure TFormRepPlanZP.moveToExcel;
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
*)
procedure TFormRepPlanZP.fillFinalList;
   var i,j,k:Integer;
       finalRec:pFinalRec;
       rec:pRec;
       detRec:pDetRec;
       finded:Boolean;
   begin
        finalList:=TList.Create;
        for i:=0 to list.Count-1 do
          begin
               rec:=pRec(list.Items[i]);
               if rec.list.count<1 then
                  Continue;
               if rec^.tabno=5636 then
                  finded:=True;
               for j:=0 to rec.list.Count-1 do
                   begin
                        detRec := pDetRec(rec.list.Items[j]);
                        finded:=false;
                        if finalList.count>0 then
                           for k:=0 to finalList.Count-1 do
                               if pFinalRec(finalList.Items[k]).shifrRow=detRec.shifrLine then
                                  begin
                                       finded:=True;
                                       finalRec:=pFinalRec(finalList.Items[k]);
                                       Break;
                                  end;
                        if not finded then
                           begin
                                New(finalRec);
                                FillChar(finalRec^,sizeof(finalRec^),0);
                                finalRec.shifrRow:=Detrec.shifrLine;
                                finalList.Add(finalRec);
                           end;
                        finalRec.summaFond:=finalRec.summaFond+detRec.summaAdd;
                        if detRec.shifrWR=2 then
                           finalRec.summaSowm:=finalRec.summaSowm+detRec.summaAdd
                        else
                        if detRec.shifrWR=3 then
                           finalRec.summaSowmVne:=finalRec.summaSowmVne+detRec.summaAdd;
                        if detRec.shifrGru=1 then
                           if detRec.shifrWR<=2 then
                              finalRec.summaBud:=finalRec.summaBud+detRec.summaAdd
                           else
                              finalRec.summaBudVne:=finalRec.summaBudVne+detRec.summaAdd
                        else
                           if detRec.shifrWR<=2 then
                              finalRec.summaVne:=finalRec.summaVne+detRec.summaAdd
                           else
                              finalRec.summaVneVne:=finalRec.summaVneVne+detRec.summaAdd
                   end;
          end;
       i:=finalList.Count;   

   end;
procedure TFormRepPlanZP.SwodToExcel;
const maxKat=15;
var
    S:String;
    k,i:integer;
    exRow:integer;
    h:string;
    wbs:variant;
    finalRec:pFinalRec;
    shifrRow:Integer;
begin
//     FName:=TemplateDIR+'WorkersPlan.xlt';
//     s:='Показатель средней заработной платы бюджетных учреждений за март 2018 года';
     caption:='Свод по рабочим должностям за '+GetMonthRus(MonthOf(dtFr.date))+ ' '+IntToStr(YearOf(dtFr.date))+' г. по '+GetMonthRus(MonthOf(dtTo.date))+ ' '+IntToStr(YearOf(dtTo.date))+' г.';
     Application.ProcessMessages;

     h:='Показатель средней заработной платы бюджетных учреждений за период с '+GetMonthRus(MonthOf(dtFr.date))+' '+intToStr(yearOf(dtFr.date))+' года по '+GetMonthRus(MonthOf(dtTo.date))+ ' '+IntToStr(YearOf(dtTo.date))+' года';
     wbs:=E.WorkBooks[1].WorkSheets[1];
 //    wbs.Cells[2,1] := h;

     for k:=0 to finalList.Count-1 do
        begin
             finalRec:=pFinalRec(finalList.Items[k]);
             shifrRow:=finalRec^.shifrRow;
             if not ((shifrRow>7) and (shifrRow<22)) then
                begin
//                     ShowMessage('Ошибка shifRow='+intToStr(ShifrRow));
//                     continue;
                      if shifrRow=0 then
                         shifrRow:=21; 
                end;
//             if finalRec.summaFond>1.0 then
//                wbs.Cells[shifrRow,6] := finalRec.summaFond;
             if finalRec.summaSowm>1.0 then
                wbs.Cells[shifrRow,7] := finalRec.summaSowm;
//             if finalRec.summaSowmVne>1.0 then
//                wbs.Cells[shifrRow,8] := finalRec.summaSowmVne;
             if finalRec.summaBud>1.0 then
                wbs.Cells[shifrRow,9] := finalRec.summaBud;
             if finalRec.summaVne>1.0 then
                wbs.Cells[shifrRow,11]:= finalRec.summaVne;
             if finalRec.summaBudVne>1.0 then
                wbs.Cells[shifrRow,12]:= finalRec.summaBudVne;
             if finalRec.summaVneVne>1.0 then
                wbs.Cells[shifrRow,14]:= finalRec.summaVneVne;
        end;

end;

end.
