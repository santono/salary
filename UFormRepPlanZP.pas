unit UFormRepPlanZP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, frxClass, frxDBSet, ExtCtrls,
  scrDef;

type
  TPodrMode=(FullUnivWithoutColledgMode,UnivWithoutAllBayMode,SeverodonetskBayMode,IPDOBayMode,SanatoriyBayMode);
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
    rgBudMode: TRadioGroup;
    cbPodrMode: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    moderep:Integer; //1-PlanZp 2 - Минсоц
    gruKadryMode:Integer;
    podrMode:TPodrMode;
    procedure CreateReport;
    procedure fillPerson(curr_person:person_ptr);
 //   procedure moveToExcel;
    procedure fillFinalList;
    procedure fillFinalKadryList;
    procedure SwodToExcel;
    procedure SwodToExcelSoc;
    function  initDolgList : boolean;
    function  initDolgKadryList : boolean;
    function  initPodrList : boolean;
    function  initShifrList : boolean;
    procedure fillSQLDb;
  public
    constructor myCreate(AOwner: TComponent;wantedMode:integer);
    { Public declarations }
  end;

var
  FormRepPlanZP: TFormRepPlanZP;

implementation
  uses
      uFIBModule,UFormWait,ScrUtil,DateUtils,ComObj,ScrIO,
      scrLists,USQLUnit;
  type
       pRec=^TRec;
       TRec=record
             fio      : string;
             tabno    : Integer;
             list     : TList;
            end;
       pDetRec=^TDetRec;
       TDetRec=record
                 shifrLine : integer;
                 shifrLineKadry : Integer;
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
       pFinalKadryRec=^TFinalKadryRec;
       TFinalKadryRec=record
                   shifrRow:Integer;
                   summaTot:Real;
                   summaSowm:real;
                   summaVne:Real;
                 end;

//  const nup=
//  const notusedpodr:array[1..nup] of integer =
  var list          : TList;
      DolgList      : TList;
      DolgKadryList : TList;
      modeSort      : Integer;
      listDistinctTabno : TList;
      notUsedPodrList:TList;
      notUsedShifrList:TList;
      finalList:TList;
      finalKadryList:TList;
      finalSocList:TList;
      E:Variant;
      FName:String;

{$R *.dfm}

function isSeverPodr(shifrPod:integer):boolean;
 var retVal:Boolean;
 begin
      retVal:=False;
      if shifrPod in [213,214] then
         retVal:=True;
      isSeverPodr:=retVal;
 end;
function isIPDOPodr(shifrPod:integer):boolean;
 var retVal:Boolean;
 begin
      retVal:=False;
      if shifrPod in [185,190] then
         retVal:=True;
      isIPDOPodr:=retVal;
 end;
function isProfilakPodr(shifrPod:integer):boolean;
 var retVal:Boolean;
 begin
      retVal:=False;
      if shifrPod in [20] then
         retVal:=True;
      isProfilakPodr:=retVal;
 end;
function isUniverPodr(shifrPod:integer):boolean;
 var retVal:Boolean;
 begin
      retVal:=True;
      if isSeverPodr(shifrPod) then
         retVal:=False
      else
      if isIPDOPodr(shifrPod) then
         retVal:=False
      else
      if isProfilakPodr(shifrPod) then
         retVal:=False;

      isUniverPodr:=retVal;
 end;

function getPodrModeName(PodrMode:TPodrMode):String;
 var retVal:string;
 begin
     case PodrMode of
       FullUnivWithoutColledgMode:retVal:='Университет без колледжа';
       UnivWithoutAllBayMode:retVal:='Университет без самостоятельных подразделений';
       SeverodonetskBayMode:retVal:='Северодонецк';
       IPDOBayMode:retVal:='ИПДО';
       SanatoriyBayMode:retVal:='Санаторий-профилакторий';
     else
           retVal:='Университет без колледжа';
     end;
     getPodrModeName:=retVal;
 end;

constructor TFormRepPlanZP.myCreate(AOwner: TComponent;wantedMode:integer);
  begin
       inherited Create(AOwner);
       modeRep          := wantedMode;
       dtFr.Date        := IncMonth(Date,-1);
       dtFr.Date        := RecodeDay(dtFr.Date,1);
       dtTo.Date        := dtFr.Date;
       BitBtn1.Enabled  := True;
       LabelFio.Caption := '';
       cbListToExcel.Checked:=True;
       caption:='Свод ЗП образование c '+GetMonthRus(MonthOf(dtFr.date))+ ' '+IntToStr(YearOf(dtFr.date))+' г. по '+GetMonthRus(MonthOf(dtTo.date))+ ' '+IntToStr(YearOf(dtTo.date));
       rgBudMode.ItemIndex:=0;
       Application.ProcessMessages;
       if moderep=2 then
          begin
               rgBudMode.Hide;
               rgBudMode.Enabled:=False;
               dtTo.Hide;
               dtTo.Enabled:=False;
               Label1.Hide;
               Label2.Caption:='За ';
               Caption:='МинСоц за '+ GetMonthRus(MonthOf(dtFr.date))+ ' '+IntToStr(YearOf(dtFr.date))+' г.';
          end
       else
          begin
               rgBudMode.Show;
               rgBudMode.Enabled:=true;
               dtTo.Show;
               dtTo.Enabled:=True;
               Label1.Show;
               Label2.Caption:='C';
//               Caption:='ЗП-Образование';
               caption:='Свод ЗП образование c '+GetMonthRus(MonthOf(dtFr.date))+ ' '+IntToStr(YearOf(dtFr.date))+' г. по '+GetMonthRus(MonthOf(dtTo.date))+ ' '+IntToStr(YearOf(dtTo.date));
          end;
       PodrMode:=FullUnivWithoutColledgMode;
       cbPodrMode.ItemIndex:=0;
  end;
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
             ShowMessage('Неверная структура файла '+CDIR+'planZP.txt. Нет заголовка должности');
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
function TFormRepPlanZP.initDolgKadryList:boolean;
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
     fname:=CDIR+'Kadry_ZP.txt';
     if not FileExists(fname) then
        begin
             ShowMessage('Не найден файл '+CDIR+fname);
             initDolgKadryList:=false;
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
             ShowMessage('Неверная структура файла '+CDIR+'kadryZP.txt. Нет заголовка должности');
             initDolgKadryList:=false;
             exit;
        end;
     DolgKadryList:=TList.Create;
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
                           DolgKadryList.add(rec);
                      end;
              end;

      end;
     CloseFile(fi);
     initDolgKadryList:=true;
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
             ShowMessage('Неверная структура файла '+CDIR+'planZP.txt. Нет заголовка подразделений');
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
//     dtFr.Date        := IncMonth(Date,-1);
//     dtFr.Date        := RecodeDay(dtFr.Date,1);
//     dtTo.Date        := dtFr.Date;
//     BitBtn1.Enabled  := True;
//     LabelFio.Caption := '';
//     cbListToExcel.Checked:=True;
//     caption:='Свод ЗП образование c '+GetMonthRus(MonthOf(dtFr.date))+ ' '+IntToStr(YearOf(dtFr.date))+' г. по '+GetMonthRus(MonthOf(dtTo.date))+ ' '+IntToStr(YearOf(dtTo.date));
//     rgBudMode.ItemIndex:=0;
//     Application.ProcessMessages;
end;

procedure TFormRepPlanZP.BitBtn1Click(Sender: TObject);
begin
     if moderep<>2 then
        begin
             gruKadryMode:=rgBudMode.ItemIndex;
        end
     else
        begin
             gruKadryMode:=2;
        end;
     if (gruKadryMode>2) or (gruKadryMode<0) then
         gruKadryMode:=0; // 0 -бюджет 1 внебюджет 2 - все счета
     if not initDolgList then
        begin
             error('Ошибка чтения исходного файла PlanZP.txt');
             exit;
        end;
     if not initDolgKadryList then
        begin
             error('Ошибка чтения исходного файла Kadry_Zp.txt');
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
     case cbPodrMode.ItemIndex of
        0: Self.podrMode:=FullUnivWithoutColledgMode;
        1: Self.podrMode:=UnivWithoutAllBayMode;
        2: Self.podrMode:=SeverodonetskBayMode;
        3: Self.podrMode:=IPDOBayMode;
        4: Self.podrMode:=SanatoriyBayMode;
        else
           Self.podrMode:=FullUnivWithoutColledgMode;
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
                           retVal:=True;
                           break;
                      end;
//            if Self.podrMode=FullUnivWithoutColledgModev then
            if Self.podrMode=UnivWithoutAllBayMode then
               begin
                    if not isUniverPodr(shifrPod) then
                       retVal:=True;
               end
            else
            if Self.podrMode=SeverodonetskBayMode then
               begin
                    if not isSeverPodr(shifrPod) then
                       retVal:=True;
               end
            else
            if Self.podrMode=IPDOBayMode then
               begin
                    if not isIPDOPodr(shifrPod) then
                       retVal:=True;
               end
            else
            if Self.podrMode=SanatoriyBayMode then
               begin
                    if not isProfilakPodr(shifrPod) then
                       retVal:=True;
               end;        
            isInForbiddenPodr:=retVal;
       end;
      
  begin
       savNMES:=NMES;
       savNSRV:=NSRV;
       savYear:=CURRyEAR;
       dateFr:=EncodeDate(YearOf(dtFr.Date),MonthOf(dtFr.Date),1);
       if modeRep=2 then
          dateTo:=dateFr
       else
          dateTo:=EncodeDate(YearOf(dtTo.Date),MonthOf(dtTo.Date),1);
       if dateFr > dateTo then
          begin
               ShowMessage('Начальная дата больше конечной');
               Exit;
          end;
       if moderep=2 then
          caption:='Свод МинСоц за '+GetMonthRus(MonthOf(dateFr))+ ' '+IntToStr(YearOf(dateFr))+' г.'
       else
          caption:='Свод ЗП образование c '+GetMonthRus(MonthOf(dateFr))+ ' '+IntToStr(YearOf(dateFr))+' г. по '+GetMonthRus(MonthOf(dateTo))+ ' '+IntToStr(YearOf(dateTo));

       EMPTY_ALL_PERSON;
       NMES:=MonthOf(dateFr);
       CurrYear:=yearOf(dateFr);
       savNMES1:=MonthOf(dateTo);
       savYear1:=yearOf(dateTo);
       countMonth := 0;
       if (nmes=savNMES1) and
          (currYear=savYEAR1) then
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
       fillSQLDb;
       fillFinalKadryList;
       list.Sort(@Compare);
       if moderep<>2 then
          FName:=TemplateDIR+'PlanZP.xlt'
       else
          FName:=TemplateDIR+'PlanSoc.xlt';
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
       if moderep<>2 then
          swodToExcel
       else
          swodToExcelSoc;
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
       if finalList.Count>0 then
          for i:=0 to finalList.count-1 do
              dispose(pFinalRec(finalList.Items[i]));
       finalList.Free;
       finalList:=nil;
       if finalKadryList.Count>0 then
          for i:=0 to finalKadryList.count-1 do
              dispose(pFinalKadryRec(finalKadryList.Items[i]));
       finalKadryList.Free;
       finalKadryList:=nil;

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
      shifrKadryRow:Integer;
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
    function getKadryRowByDolCode(shifrDol:integer):Integer;
     var i:Integer;
         retVal:Integer;
         finded:Boolean;
         podrName:string;
         function isKafedra:Boolean;
          var retVal:Boolean;
              s:string;
          begin
               retVal:=false;
               s:=Name_Serv(nsrv);
               s:=Trim(s);
               s:=UPPER_STRING(s);
               if Pos('КАФЕДР',s)>0 then
                  retVal:=True;
               if nsrv=0 then
                  retVal:=True;
               isKafedra:=retVal;
          end;
     begin
          retVal:=0;
          finded:=False;
          if DolgKadryList.count>0 then
             for i:=0 to DolgKadryList.Count-1 do
                 if pDolgRec(DolgKadryList.Items[i])^.shifrDol=shifrDol then
                    begin
                         finded:=True;
                         retVal:=pDolgRec(DolgKadryList.Items[i])^.shifrRow;
                         Break;
                    end;

          if (retVal in [11,12]) and isKafedra then
             retVal:=14;
          getKadryRowByDolCode:=retVal;
     end;
    procedure insertIntoCollection(curr_person:PERSON_PTR;summaAdd:real);
     var rec:pRec;
         detRec:pDetRec;
         finded:Boolean;
         i:Integer;
         shifrRow:Integer;
         shifrKadryRow:Integer;
         shifrDol:Integer;
         shifrWR:Integer;
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
                 rec.tabno    := curr_person^.tabno;
                 rec.fio      := Trim(curr_person^.fio);
                 rec.list     := TList.Create;
                 list.Add(rec);
            end;

       shifrDol := 0;
       shifrDol := GET_DOL_CODE(curr_person);
       shifrRow := 0;
       shifrKadryRow := 0;
       // Проверить ИПДО                      13 - счет
//       if ((nsrv=115) or (curr_person^.gruppa=22)) then
       if nsrv in [185,190] then    // Замечание от 16 03 2023
          begin
               shifrKadryRow:=28;
               shifrRow:=11;
          end
       else    
       if shifrDol>0 then
          if shifrDol<10 then //Договора подряда
             case curr_person^.KATEGORIJA of
               1 : begin
                        shifrRow:=10;  // ППС
                        shifrKadryRow:=9;
                   end ;
               3 : begin
                        shifrRow:=12;  // Научный сотрудник
                        shifrKadryRow:=10;
                   end ;
              else
                   begin
                        shifrRow:=21;
                        shifrKadryRow:=15; //Иной персонал
                   end
             end       
          else
             begin
                  shifrRow:=getRowByDolCode(shifrDol);
                  shifrKadryRow:=getKadryRowByDolCode(shifrDol);
             end;
       if shifrRow=0 then
          shifrRow:=21; //Прочие
       if shifrKadryRow=0 then
          shifrKadryRow:=15; //Прочие
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
               detRec.shifrLineKadry:=shifrKadryRow;
               detRec.shifrWR:=shifrWR;
               detRec.shifrDol:=shifrDol;
               detRec.dolg:=curr_person^.DOLG;
               detRec.shifrGru:=curr_person^.GRUPPA;
               if not ((detRec.shifrGru=1) and (detRec.ShifrGru=3)) then
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
                           retVal:=true;
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
       shifrKadryRow:=0;
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
       if dolgKadryList.Count=0 then exit;
       for i:=0 to dolgKadryList.Count-1 do
           begin
                if shifrDol=pDolgRec(dolgKadryList.Items[i]).shifrDol then
                   begin
                        shifrKadryRow:=pDolgRec(dolgKadryList.Items[i]).shifrRow;
                        break;
                   end;
           end;
       if curr_person^.tabno=12549 then
          summaAdd:=0.00;
       if shifrKadryRow=0 then
       if curr_person^.KATEGORIJA in [4,6] then shifrKadryRow:=15;
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
       finalRec,finalRecF:pFinalRec;
       rec:pRec;
       detRec:pDetRec;
       finded:Boolean;
       shifrLine:Integer;
       shifrRowOld:Integer;
       summa:Real;
   function getSocShifrLine(finalRec:pFinalRec):Integer;
     var retVal:Integer;
     begin
          retVal:=25;
          if finalRec^.shifrRow in [8,9,10] then
             retVal:=23
          else
          if finalRec^.shifrRow=12 then
             retVal:=24;
          getSocShifrLine:=retVal;
     end;
   function isBudget(shifrGru:integer):Boolean;
     var retVal:Boolean;
     begin
          retVal:=False;
          if shifrGru in [1,3] then
             retVal:=True;
          isBudget:=retVal;   
     end;
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
                        if IsBudget(detRec.shifrGru) then
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
       if moderep<>2 then
          Exit;
       finalSocList := TList.Create;
       for i:=0 to finalList.Count-1 do
           begin
                finalRec:=pFinalRec(finalList.Items[i]);
                shifrRowOld:=finalRec.shifrRow;
                shifrLine:=getSocShifrLine(finalRec);
                finded:=false;
                if finalSocList.count>0 then
                   for k:=0 to finalSocList.Count-1 do
                       if pFinalRec(finalSocList.Items[k]).shifrRow=shifrLine then
                          begin
                              finded:=True;
                              finalRecF:=pFinalRec(finalSocList.Items[k]);
                              Break;
                          end;
                if not finded then
                   begin
                        New(finalRecF);
                        FillChar(finalRecF^,sizeof(finalRecF^),0);
                        finalRecF.shifrRow:=shifrLine;
                        finalSocList.Add(finalRecF);
                   end;
                summa:=finalRec.summaBud   +
                       finalRec.summaBudVne+
                       finalRec.summaVne   +
                       finalRec.summaVneVne;
//             if finalRec.summaVne>1.0 then
//                wbs.Cells[shifrRow,11]:= finalRec.summaVne;
//             if finalRec.summaBudVne>1.0 then
//                wbs.Cells[shifrRow,12]:= finalRec.summaBudVne;
//             if finalRec.summaVneVne>1.0 then
//                wbs.Cells[shifrRow,14]:= finalRec.summaVneVne;
                finalRecF.summaFond:=finalRecF.summaFond+summa;
           end;

   end;
procedure TFormRepPlanZP.fillSQLDb;
 var SQLStmnt:string;
     i,j,k:Integer;
     finalRec,finalRecF:pFinalRec;
     rec:pRec;
     detRec:pDetRec;
     finded:Boolean;
     shifrLine:Integer;
     shifrRowOld:Integer;
     summa:Real;

 begin
     FormWait.Show;
     Application.ProcessMessages;
     SQLStmnt:='delete from TB_ZP_ORRAZOVANIE';
     SQLExecute(SQLStmnt);
     for i:=0 to list.Count-1 do
         begin
              rec:=pRec(list.Items[i]);
              if rec.list.count<1 then
                 Continue;
              if rec^.tabno=5636 then
                 finded:=True;
              for j:=0 to rec.list.Count-1 do
                  begin
                        SQLStmnt:='insert into TB_ZP_ORRAZOVANIE (ID,TABNO,FIO,SHIFRLINE,SHIFRLINEKADRY,SHIFRWR,SHIFRGRU,DOLG,SHIFRPOD,SHIFRDOL,SUMMAADD)  values(';
                        SQLStmnt:=SQLStmnt+intToStr(i+1)+','+intToStr(rec.tabno)+','''+Trim(rec^.fio)+''',';
                        detRec := pDetRec(rec.list.Items[j]);
                        SQLStmnt:=SQLStmnt+intToStr(detRec^.shifrLine)+','+intToStr(detRec^.shifrLineKadry)+','+intToStr(detRec^.shifrWR)+','+intToStr(detRec^.shifrGru)+','''+Trim(detRec^.dolg)+''','+intToStr(detRec^.shifrPod)+','+intToStr(detRec^.shifrDol)+','+FormatFloatPoint(detRec^.summaAdd)+')';
                        SQLExecute(SQLStmnt);
                   end;
          end;
     FormWait.Hide;
     Application.ProcessMessages;
 end;
procedure TFormRepPlanZP.fillFinalKadryList;
   var i,j,k:Integer;
       finalKadryRec:pFinalKadryRec;
       rec:pRec;
       detRec:pDetRec;
       finded:Boolean;
   begin
        finalKadryList:=TList.Create;
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
                        if not (
                            (
                             (gruKadryMode=0) and
                             (detRec.shifrGru=1)
                            ) or
                            (
                             (gruKadryMode=1) and
                             (detRec.shifrGru<>1)
                            ) or
                            (gruKadryMode=2)
                        )then
                            continue;
                        finded:=false;
                        if finalKadryList.count>0 then
                           for k:=0 to finalKadryList.Count-1 do
                               if pFinalKadryRec(finalKadryList.Items[k]).shifrRow=detRec.shifrLineKadry then
                                  begin
                                       finded:=True;
                                       finalKadryRec:=pFinalKadryRec(finalKadryList.Items[k]);
                                       Break;
                                  end;
                        if not finded then
                           begin
                                New(finalKadryRec);
                                FillChar(finalKadryRec^,sizeof(finalKadryRec^),0);
                                finalKadryRec.shifrRow:=Detrec.shifrLineKadry;
                                finalKadryList.Add(finalKadryRec);
                           end;
                        if detRec.shifrWR<>3 then
                           finalKadryRec.summaTot:=finalKadryRec.summaTot+detRec.summaAdd;
                        if detRec.shifrWR=2 then
                           finalKadryRec.summaSowm:=finalKadryRec.summaSowm+detRec.summaAdd
                        else
                        if detRec.shifrWR=3 then
                           finalKadryRec.summaVne:=finalKadryRec.summaVne+detRec.summaAdd;
                        if detRec.shifrLineKadry=28 then // Добавить в 3-ю строку
                           begin
                             if finalKadryList.count>0 then
                                for k:=0 to finalKadryList.Count-1 do
                                    if pFinalKadryRec(finalKadryList.Items[k]).shifrRow=9 then
                                       begin
                                            finded:=True;
                                            finalKadryRec:=pFinalKadryRec(finalKadryList.Items[k]);
                                            Break;
                                       end;
                                    if not finded then
                                       begin
                                            New(finalKadryRec);
                                            FillChar(finalKadryRec^,sizeof(finalKadryRec^),0);
                                            finalKadryRec.shifrRow:=9;
                                            finalKadryList.Add(finalKadryRec);
                                       end;
                                    if detRec.shifrWR<>3 then
                                       finalKadryRec.summaTot:=finalKadryRec.summaTot+detRec.summaAdd;
                                    if detRec.shifrWR=2 then
                                       finalKadryRec.summaSowm:=finalKadryRec.summaSowm+detRec.summaAdd
                                    else
                                    if detRec.shifrWR=3 then
                                       finalKadryRec.summaVne:=finalKadryRec.summaVne+detRec.summaAdd;

                           end;
                   end;
          end;
       i:=finalKadryList.Count;

   end;
procedure TFormRepPlanZP.SwodToExcel;
const maxKat=15;
var
    S:String;
    k,i:integer;
    exRow:integer;
    h:string;
    wbs,wbsKadry:variant;
    finalRec:pFinalRec;
    finalKadryRec:pFinalKadryRec;
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
     wbsKadry:=E.WorkBooks[1].WorkSheets[2];
     for k:=0 to finalKadryList.Count-1 do
        begin
             finalKadryRec:=pFinalKadryRec(finalKadryList.Items[k]);
             shifrRow:=finalKadryRec^.shifrRow;
             if shifrRow=8 then
                shifrRow:=7;
             if not ((shifrRow>6) and (shifrRow<29)) then
                begin
//                     ShowMessage('Ошибка shifRow='+intToStr(ShifrRow));
//                     continue;
                      if shifrRow=0 then
                         shifrRow:=15;
                end;
//             if finalRec.summaFond>1.0 then
//                wbs.Cells[shifrRow,6] := finalRec.summaFond;
             if finalkadryRec.summaTot>1.0 then
                wbsKadry.Cells[shifrRow,5] := finalKadryRec.summaTot;
             if finalKadryRec.summaSowm>1.0 then
                wbsKadry.Cells[shifrRow,6] := finalKadryRec.summaSowm;
             if finalKadryRec.summaVne>1.0 then
                wbsKadry.Cells[shifrRow,7] := finalKadryRec.summaVne;
        end;

end;
procedure TFormRepPlanZP.SwodToExcelSoc;
const maxKat=15;
var
    S:String;
    k,i:integer;
    exRow:integer;
    h:string;
    wbs,wbsKadry:variant;
    finalRec:pFinalRec;
    shifrRow:Integer;
begin

     wbs:=E.WorkBooks[1].WorkSheets[2];
     for k:=0 to finalSocList.Count-1 do
        begin
             finalRec:=pFinalRec(finalSocList.Items[k]);
             shifrRow:=finalRec^.shifrRow;
             if not ((shifrRow>=23) and (shifrRow<=25)) then
                begin
                     ShowMessage('Ошибка Соц  shifRow='+intToStr(ShifrRow));
                     continue;
                end;
             if finalRec.summaFond>1.0 then
                wbs.Cells[shifrRow,7] := finalRec.summaFond/1000.00;
        end;

end;

end.
