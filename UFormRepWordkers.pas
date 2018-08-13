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

  var list         : TList;
      listInitRecs : TList;
      modeSort     : Integer;
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
     fname:=CDIR+'PlanWorkers.txt';
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

end;

procedure TFormRepWordkers.BitBtn1Click(Sender: TObject);
begin
     if not initListPlanRecs then
        begin
             error('Ошибка чтения исходного файла PlanWorkers.txt');
             exit;
        end;
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
  var savNMES,savNSRV:integer;
      iNSRV:Integer;
      curr_person:PERSON_PTR;
  begin
       savNMES:=NMES;
       savNSRV:=NSRV;
       EMPTY_ALL_PERSON;
       list:=TList.Create;
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
       list.Sort(@Compare);
       moveToExcel;
       swodToExcel;
       list.Free;
       NMES:=savNMES;
       NSRV:=savNSRV;
       MKFLNM;
       getinf(true);
  end;
procedure TFormRepWordkers.fillPerson(curr_person:person_ptr);
  var rec:pRec;
      shifrDol:integer;
      shifrKat:integer;
      i:integer;
      summaAdd,summaNal:real;
  begin
       shifrDol:=GET_DOL_CODE(curr_person);
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
       summaAdd:=getSummaAddForPerson(curr_person);
       summaNal:=getSummaNalogiPerson(curr_person);
       if abs(summaAdd)<0.01 then exit;
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
  var E,WC:Variant;
    ExRow,ExCol:integer;
    i:Integer;
    currPod:Integer;
    lineno:Integer;
    currdol:Integer;
    currGru:Integer;
  begin
     currPod:=0;
     currDol:=0;
     currGru:=0;
     try
        E:=CreateOleObject('Excel.Application');
     except
       on e:Exception do
          begin
               ShowMessage('Ошибка запуска Excel '+E.Message);
               Exit;
          end;
     end;
     E.WorkBooks.add;
     E.Visible:=False;
     FormWait.Show;
     Application.ProcessMessages;
     exRow:=5;
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow-2,1]:='Список работников для свода за '+getMonthRus(NMES)+' '+intToStr(CurrYear)+' г.';
     for i:=0 to list.Count-1 do
       begin
            Inc(exRow);
            lineno:=0;
            if modeSort=0 then
               begin
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=i+1;
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=pRec(list.Items[i]).fio;
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=pRec(list.Items[i]).dolg;
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=pRec(list.Items[i]).shifrLine;
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=pRec(list.Items[i]).koef;
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]:=pRec(list.Items[i]).dolg;
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,7]:=pRec(list.Items[i]).summaAdd;
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,8]:=pRec(list.Items[i]).summaUd;
               end
            else
            if (modeSort=1) then
               begin
                    if currPod<>pRec(list.Items[i]).shifrpod then
                       begin
                            currPod:=pRec(list.Items[i]).shifrpod;
                            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=Name_Serv(currPod);
                            Inc(ExRow);
                            lineno:=0;
                       end;
                       Inc(lineno);
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=lineno;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=pRec(list.Items[i]).fio;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=pRec(list.Items[i]).dolg;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=pRec(list.Items[i]).summaAdd;
              //         E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=pRec(list.Items[i]).summaUd;
               end
            else
            if (modeSort=2) then
               begin
                    if currDol<>pRec(list.Items[i]).shifrDol then
                       begin
                            currDol:=pRec(list.Items[i]).shifrDol;
                            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=NameDolgList.GetName(currDol);// NAME_DOLG(currDol);
                            Inc(ExRow);
                            lineno:=0;
                       end;
                       Inc(lineno);
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=lineno;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=pRec(list.Items[i]).fio;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=pRec(list.Items[i]).dolg;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=Name_Serv(pRec(list.Items[i]).shifrpod);
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=pRec(list.Items[i]).summaAdd;
                //       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]:=pRec(list.Items[i]).summaUd;
               end
            else
               begin
//                    if currGru<>pRec(list.Items[i]).shifrGru then
//                       begin
//                            currGru:=pRec(list.Items[i]).shifrGru;
//                            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=ist_fin_name[currGru];
//                            Inc(ExRow);
//                            lineno:=0;
//                       end;
                       Inc(lineno);
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=lineno;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=pRec(list.Items[i]).fio;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=pRec(list.Items[i]).dolg;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=Name_Serv(pRec(list.Items[i]).shifrpod);
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=pRec(list.Items[i]).summaAdd;
                  //     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]:=pRec(list.Items[i]).summaUd;
               end

       end;
     FormWait.Hide;
     Application.ProcessMessages;
     E.Visible:=true;


  end;

procedure TFormRepWordkers.SwodToExcel;
var E,WC:Variant;
    FName,S:String;
    SummaTot,SummaClear,nmbOfSt:real;
    k,i:integer;
    exRow:integer;
    h:string;
begin
     FName:=TemplateDIR+'WorkersPlan.xlt';
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
     for k:=1 to 8 do
        begin
             SummaTot   := 0;
             SummaClear := 0;
             nmbOfSt    := 0;
             for i:=0 to list.Count-1 do
                 begin
                      if pRec(list.Items[i]).shifrLine=k then
                         begin
                               SummaTot   := summaTot   + pRec(list.Items[i]).summaAdd;
                               SummaClear := summaClear + pRec(list.Items[i]).summaAdd-pRec(list.Items[i]).summaUd;
                               nmbOfSt    := nmbOfSt    + pRec(list.Items[i]).koef;
                         end;
                 end;
             exRow:=6+k;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3] := nmbOfSt;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4] := SummaTot;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6] := SummaClear;
        end;

end;

end.
