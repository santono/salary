unit UFormRepPlanSowmVne;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, frxClass, frxDBSet, ExtCtrls,
  scrDef;

type
  TFormRepPlanSowmVne = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dtFr: TDateTimePicker;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    LabelFio: TLabel;
    Label1: TLabel;
    dtTo: TDateTimePicker;
    rgMode: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    modeRep:Integer; //0- все 1-только договора 2-без договоров
    { Private declarations }
    procedure CreateReport;
    procedure fillPerson(curr_person:person_ptr);
 //   procedure moveToExcel;
    procedure SwodToExcel;
    function  initPodrList : boolean;
    function  initShifrList : boolean;
  public
    constructor myCreate(AOwner: TComponent;wantedMode:integer);
    { Public declarations }
  end;

var
  FormRepPlanSowmVne: TFormRepPlanSowmVne;

implementation
  uses
      uFIBModule,UFormWait,ScrUtil,DateUtils,ComObj,ScrIO,
      scrLists;
  type pRec=^TRec;
       TRec=record
             fio      : string;
             tabno    : Integer;
             Dolg     : string;
             Pol      : Integer; // 1 - муж 2 - жен
             summy    : array[1..12] of Real;
            end;

//  const nup=
//  const notusedpodr:array[1..nup] of integer =
  var list          : TList;
      notUsedPodrList:TList;
      notUsedShifrList:TList;
      E:Variant;
      FName:String;
      modeSort:Integer;

{$R *.dfm}
constructor TFormRepPlanSowmVne.myCreate(AOwner: TComponent;wantedMode:integer);
  begin
       inherited Create(AOwner);
       dtFr.Date        := IncMonth(Date,-1);
       dtFr.Date        := RecodeDay(dtFr.Date,1);
       dtTo.Date        := dtFr.Date;
       BitBtn1.Enabled  := True;
       LabelFio.Caption := '';
       modeSort:=0;
       modeRep:=0;
       rgMode.ItemIndex:=0;
       caption:='Свод по внешним совместителям c '+GetMonthRus(MonthOf(dtFr.date))+ ' '+IntToStr(YearOf(dtFr.date))+' г. по '+GetMonthRus(MonthOf(dtTo.date))+ ' '+IntToStr(YearOf(dtTo.date));
       Application.ProcessMessages;
  end;
procedure TFormRepPlanSowmVne.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;
function TFormRepPlanSowmVne.initPodrList:boolean;
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
     fname:=CDIR+'PlanSowmVne.txt';
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
function TFormRepPlanSowmVne.initShifrList:boolean;
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
     fname:=CDIR+'PlanSowmVne.txt';
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

procedure TFormRepPlanSowmVne.BitBtn1Click(Sender: TObject);
begin

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

procedure TFormRepPlanSowmVne.CreateReport;
  var savNMES,savNSRV,savYear:integer;
      savNMES1,savYear1:integer;
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
       dateTo:=dateFr;
       dateTo:=EncodeDate(YearOf(dtTo.Date),MonthOf(dtTo.Date),1);
       if dateFr > dateTo then
          begin
               ShowMessage('Начальная дата больше конечной');
               Exit;
          end;
       if YearOf(DateFr)<>YearOf(DateTo) then
          begin
               showMessage('Неверно указан год '+IntToStr(YearOf(DateTo)));
               Exit;
          end;
       if (YearOf(DateFr)>WORK_YEAR_VAL)
           or
          (YearOf(DateFr)<WORK_YEAR_VAL-1) then
          begin
               showMessage('Неверно указан год '+IntToStr(YearOf(DateFr)));
               Exit;
          end;
       caption:='Свод по совместителям c '+GetMonthRus(MonthOf(dateFr))+ ' '+IntToStr(YearOf(dateFr))+' г. по '+GetMonthRus(MonthOf(dateTo))+ ' '+IntToStr(YearOf(dateTo));
       modeRep:=0;
       if rgMode.ItemIndex=1 then
          modeRep:=1
       else
       if rgMode.ItemIndex=2 then
          modeRep:=2;

       EMPTY_ALL_PERSON;
       NMES:=MonthOf(dateFr);
       CurrYear:=yearOf(dateFr);
       savNMES1:=MonthOf(dateTo);
       savYear1:=yearOf(dateTo);
       countMonth := 0;
       if (savNMES=savNMES1) and
          (currYear=savYear1) then
          countMonth:=1;
       if countMonth=0 then
       if ((MonthOf(dateFr)=MonthOf(dateTo)) and
            (yearOf(dateFr)=yearOf(dateTo))) then
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
              if countMonth>12 then
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
                       if not IS_OSN_WID_RABOTY(curr_person) then
                       if STORONNEE_PODRAZD(curr_person^.MESTO_OSN_RABOTY) then
                         fillPerson(Curr_person);
                       curr_person:=curr_person^.NEXT;
                  end;
                EMPTY_ALL_PERSON;
              end;
              inc(nmes);
           end;
       Application.ProcessMessages;
       list.Sort(@Compare);
       FName:=TemplateDIR+'PlanSowmVne.xlt';
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
//                   if pRec(list.Items[i]).list.count>0 then
//                      for j:=0 to pRec(list.Items[i]).list.count-1 do
//                          dispose(pDetRec(pRec(list.Items[i]).list.Items[j]));

                   dispose(pRec(list.Items[i]));
              end;
       list.Free;
       list:=nil;

       CURRyEAR:=savYear;
       NMES:=savNMES;
       NSRV:=savNSRV;
       MKFLNM;
       getinf(true);
       ShowMessage('Свод создан.');
       Self.Close;
  end;
procedure TFormRepPlanSowmVne.fillPerson(curr_person:person_ptr);
//  const lenArray=9;
//  const forbiddenDolg:array[1..lenArray] of integer=(4,5,6,7,8,9,1500,1510,1520);
  const lenArray=4;
  const forbiddenDolg:array[1..lenArray] of integer=(9,1500,1510,1520);
  var shifrDol:Integer;
    function getPol(curr_person:person_ptr):Integer;
     var retVal:integer;
         polS:string;
     begin
          retVal:=1;
          if Length(Trim(curr_person^.NAL_CODE))=10 then
             begin
                  Pols:=Copy(Trim(curr_person^.NAL_CODE),9,1);
                  if polS[1] in ['1','3','5','7','9'] then
                     retVal:=2;
             end;
       getPol:=retVal;
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
     
    procedure insertIntoCollection(curr_person:PERSON_PTR);
     var rec:pRec;
         finded:Boolean;
         i:Integer;
         shifrDol:Integer;
         polS:string;
         shifrPol:Integer;
         curr_add:ADD_PTR;
     begin
         if curr_person^.TABNO=331 then
            curr_person^.tabno:=331;
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
                 FillChar(rec^,SizeOf(rec^),0);
                 rec.tabno    := curr_person^.tabno;
                 rec.fio      := Trim(curr_person^.fio);
                 rec.Pol      := getPol(curr_person);
                 list.Add(rec);
            end;
         curr_add:=curr_person^.add;
         while (curr_add<>nil) do
           begin
                if not isInForbiddenShifr(curr_add^.shifr) then
                   begin
                        if modeRep=1 then
                        if (curr_add^.shifr=DogPodShifr)
                           or
                           (DOG_POD_PODRAZD(nsrv)) then
                           rec^.summy[nmes] := rec^.summy[nmes] + curr_add^.summa;
                        if modeRep=2 then
                        if not ((curr_add^.shifr=DogPodShifr)
                           or
                           (DOG_POD_PODRAZD(nsrv))) then
                           rec^.summy[nmes] := rec^.summy[nmes] + curr_add^.summa;
                        if modeRep=0 then
                           rec^.summy[nmes] := rec^.summy[nmes] + curr_add^.summa;
                   end;
                curr_add:=curr_add^.next;
           end;


     end;

  begin
       shifrDol:=GET_DOL_CODE(curr_person);
       insertIntoCollection(curr_person);
  end;
procedure TFormRepPlanSowmVne.SwodToExcel;
const maxKat=15;
var rec:pRec;
    S:String;
    k,i,lineno:integer;
    summy:array[1..12] of Real;
    testsumma:real;
    exRow:integer;
    h:string;
    wbs : variant;
    currRow,currcol:integer;
begin
//     FName:=TemplateDIR+'WorkersPlan.xlt';
//     s:='Показатель средней заработной платы бюджетных учреждений за март 2018 года';
     caption:='Свод по совместителям '+GetMonthRus(MonthOf(dtFr.date))+ ' '+IntToStr(YearOf(dtFr.date))+' г. по '+GetMonthRus(MonthOf(dtTo.date))+ ' '+IntToStr(YearOf(dtTo.date))+' г.';
     Application.ProcessMessages;

     h:='Показатель средней заработной платы бюджетных учреждений за период с '+GetMonthRus(MonthOf(dtFr.date))+' '+intToStr(yearOf(dtFr.date))+' года по '+GetMonthRus(MonthOf(dtTo.date))+ ' '+IntToStr(YearOf(dtTo.date))+' года';
     wbs:=E.WorkBooks[1].WorkSheets[1];
 //    wbs.Cells[2,1] := h;
     currrow:=1;
     case modeRep of
      1:h:='договора подряда';
      2:h:='без договоров подряда';
      else
        h:='все начисления';
     end;
     wbs.Cells[currRow,1]:=caption;
     wbs.Cells[currRow+1,1]:=h;
     FillChar(summy,SizeOf(summy),0);
     currrow:=3;
     for k:=0 to list.Count-1 do
        begin
             rec:=pRec(list.Items[k]);
             testsumma:=0;
             for i:=1 to 12 do
                 testsumma:=testsumma+rec^.summy[i];
             if abs(testsumma)<0.01 then
                continue;    
             Inc(lineno);
             Inc(currrow);
             for i:=1 to 12 do
                 begin
                      currCol:=3+i;
                      summy[i]:=SUMMy[i]+Rec^.summy[i];
                      wbs.Cells[currrow,currcol]:=rec^.summy[i];
                 end;
             wbs.Cells[currrow,1]:=lineno;
             wbs.Cells[currrow,2]:=rec^.tabno;
             wbs.Cells[currrow,3]:=rec^.fio;
        end;
     Inc(currRow);
     wbs.Cells[currrow,3]:='Итого';
     for i:=1 to 12 do
        begin
             currCol:=3+i;
             wbs.Cells[currrow,currcol]:=summy[i];
        end;

end;

end.
