unit UFormMovePremFromCSV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet;

type
  TFormMovePremFromCSV = class(TForm)
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    LabelPodr: TLabel;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
     procedure ExecuteMoveDopl;
     function initList:boolean;
     procedure emptyList;

  public
    { Public declarations }
  end;

var
  FormMovePremFromCSV: TFormMovePremFromCSV;

implementation
  Uses UFibModule,ScrDef,ScrIo,ScrUtil,UFormSelPKG,ScrLists,uSQLUnit,ScrNalog;

{$R *.dfm}
 type pRecPrem=^tRecPrem;
      tRecPrem=record
                tabno     : Integer;
                GUID      : string;
                summaPrem : Real;
                shifrWR   : Integer;
                shifrGru  : Integer;
                shifrKat  : Integer;
               end;
 var list:tList;
function TFormMovePremFromCSV.initList:boolean;
 const tabnocol=1;
       guidcol=6; //guid_bud
       summapremcol=8;
 var retVal:boolean;
     fName:string;
     dev:TextFile;
     line:string;
     recPrem:pRecPrem;
     arrStr:TArrOfString;
     iVal,iErr:Integer;
     aVal:Real;
     s:string;
     lineno:Integer;
     size:integer;
 begin
      retVal:=false;
      fName:=cdir+'prem2022.csv';
      if not FileExists(FName) then
         begin
              ShowMessage('Отсутстует файл '+fname);
              initList:=retVal;
              Exit;
         end;
      list:=TList.Create;   
      AssignFile(dev,fname);
      Reset(dev);
      lineno:=0;
      while not Eof(dev) do
        begin
             Readln(dev,line);
             Inc(lineno);
             if lineno< 2 then
                Continue;
             line:=Trim(line);
             if Length(line)<50 then
                Continue;
             arrStr:=Split(line,';');
             size:=high(arrStr);
             if size<9 then
                Continue;
             New(recPrem);
             FillChar(recPrem^,SizeOf(recPrem^),0);
             s:=arrStr[tabnocol];
             s:=Trim(s);
             Val(s,iVal,iErr);
             if iErr=0 then
                recPrem^.tabno:=iVal
             else
                Continue;
             s:=arrStr[Guidcol];
             recPrem^.GUID:=trim(s);
             s:=arrStr[summapremcol];
             s:=Trim(s);
             Val(s,aVal,iErr);
             if iErr=0 then
                recPrem^.summaPrem:=aVal
             else
                Continue;
             list.add(recPrem);
        end;
      CloseFile(dev);
      if list.count>0 then
         retVal:=True;
      initList:=retVal;
 end;
procedure TFormMovePremFromCSV.emptyList;
 var retVal:boolean;
     fName:string;
     dev:TextFile;
     line:string;
     recPrem:pRecPrem;
     s:string;
     i:Integer;
 begin
      if list.count>0 then
         for i:=0 to list.count-1 do
             Dispose(pRecPrem(list.Items[i]));
      list.Clear;
      list.Free;
      list:=nil;
 end;
procedure TFormMovePremFromCSV.BitBtn1Click(Sender: TObject);
begin
     if not ((nmes=12) and (CURRYEAR=2022)) then
        begin
             ShowMessage('Перенос возможен только в декабре 2022 г.');
             exit;
        end;
(*
     if NameServList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;
     if KategList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны категории');
             Exit;
        end;
     if GruppyList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны счета');
             Exit;
        end;
*)
     if MessageDlg('Выполнить перенос премии в декабре 2022 г.?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
        begin
             BitBtn1.Enabled:=False;
             Label1.Caption:='';
             if InitList then
                begin
                     ExecuteMoveDopl;
                     showMessage('Перенос закончен');
                end;
             BitBtn1.Enabled:=true;
        end;
end;




procedure TFormMovePremFromCSV.ExecuteMoveDopl;
const wantedShifr=46;
      id=37;
      wantedPeriod=12;
      wantedYear=2022;
var NMES_Sav,NSRV_Sav:Integer;  
    I_NSRV,SC:Integer;
    Curr_Person:Person_Ptr;
    Maked:Boolean;
    I:Integer;
    shifrDol:integer;
    amntOfMoved:integer;
    line:string;
        procedure Delete_Prem_Person(Curr_person:person_ptr);
         var Finished:Boolean;
             Curr_Add:Add_PTR;
         begin
              while True do
               begin
                     Finished:=True;
                     Curr_Add:=Curr_Person^.Add;
                     while (Curr_Add<>Nil) do
                       begin
                            if Curr_Add^.SHIFR  = WantedShifr then
                            if Curr_Add^.Period = wantedPeriod      then
                            if Curr_Add^.YEAR   = wantedYear-1990   then
                            if Curr_Add^.WHO    = Id          then
                               begin
                                    DEL_Add(Curr_Add,Curr_Person);
                                    Finished:=False;
                                    break;
                               end;
                            Curr_Add:=Curr_Add^.NEXT;
                       end;
                     if Finished then Break;
               end;
         end;
        procedure Delete_Prem_Pod;
         var Curr_Person:Person_Ptr;
         begin
              curr_person:=head_person;
              while (curr_person<>nil) do
                begin
                     Delete_Prem_person(curr_person);
                     curr_person:=curr_person^.NEXT;
                end;
         end;
   function findSummaPremInList(curr_Person:Person_ptr):real;
    var i:Integer;
        GUID:string;
        finded:Boolean;
        aVal:real;
    begin
         finded:=false;
         GUID:=GetGUIDPersonToString(Curr_Person);
         findSummaPremInList:=-10.00;
         if list.Count>0 then
            for i:=0 to list.Count-1 do
                if Trim(pRecPrem(list.Items[i])^.GUID)=Trim(GUID) then
                   begin
                        finded:=true;
                        aVal:=pRecPrem(list.Items[i])^.summaPrem;
                        list.Delete(i);
                        Break;
                   end;
         if finded then
            findSummaPremInList:=aVal;
    end;
   function fillPersons:boolean;
     var Curr_Person : Person_Ptr;
         tabno       : integer;
         retVal      : boolean;
         curr_add    : add_ptr;
         guid        : string;
         SQLStmnt    : string;
         GUIDString  : string;
         v,vv:Variant;
         npp:integer;
         SummaPrem:real;
     begin
         retVal := false;
         tabno  := 0;
         Curr_Person:=Head_Person;
         while (Curr_Person<>NIl) do
           begin
                GUIDString:=GetGUIDPersonToString(curr_person);
                if curr_person^.tabno=1356 then
                   curr_person^.TABNO:=1356;
                summaPrem:=0.00;
                summaPrem:=findSummaPremInList(Curr_Person);
                if summaPrem<-0.05 then
                   begin
                        curr_person:=curr_person^.NEXT;
                        continue;
                   end;
                Make_add(Curr_add,curr_person);
                curr_ADD^.SHIFR  := wantedShifr;
                curr_add^.period := wantedPeriod;
                curr_add^.year   := wantedYear-1990;
                curr_add^.summa  := summaPrem;
                curr_add^.fzp    := summaPrem;
                curr_add^.who    := id;
                retVal           := true;
                inc(amntofmoved);
                maked:=true;
//                calc_naud_person(Curr_Person,1,31);
                Curr_Person:=Curr_Person^.Next;
           end;
          fillPersons:=retVal;
     end;

begin
     NMES_Sav  := NMES;
     NSRV_Sav  := NSRV;
     EMPTY_ALL_PERSON;
     ProgressBar1.Max := Count_SERV;
     ProgressBar1.Min := 0;
     ProgressBar1.Position := 0;
     SC:=0;
     amntOfMoved:=0;
     for I_NSRV:=1 to COUNT_SERV do
         begin
              Sc:=Sc+1;
              ProgressBar1.Position:=Sc;
              NSRV:=I_NSRV;
//              if not NameServList.IsSelected(NSRV) then continue;
              mkflnm;
              LabelPodr.Caption:=Name_Serv(NSRV);
              Application.ProcessMessages;
              if not FileExists(fninf) then Continue;
              GetInf(False);
              Maked:=false;
              Delete_Prem_Pod;
              fillPersons;
              if Maked then PUTINF;
              EMPTY_ALL_PERSON;
         end;
     showMessage('Перенесено '+intToStr(amntOfMoved)+' строк ');
     SC := list.Count;
     if SC>0 then
       begin
            ShowMessage(' Не перенесено '+IntToStr(sc)+' Записей');
            memo1.lines.Clear;
            line:='Не перенесенные записи';
            Memo1.Lines.Add(line);
            for i:=0 to sc-1 do
               begin
                   line:=IntToStr(i+1)+' '+IntToStr(pRecPrem(list.items[i])^.tabno);
                   line:=line+' '+GetFullRusFioPerson(pRecPrem(list.items[i])^.tabno);
                   line:=line+' '+CurrToStrF(pRecPrem(list.items[i])^.SummaPrem,ffFixed,2);
                   Memo1.Lines.Add(Line);
               end
       end;
     NMES:=NMES_Sav;
     NSRV:=NSRV_Sav;
     MKFLNM;
     GETINF(TRUE);

end;

procedure TFormMovePremFromCSV.BitBtn3Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;

end;

procedure TFormMovePremFromCSV.FormCreate(Sender: TObject);
begin
     Memo1.Lines.Clear;
     Memo1.Lines.Add('Здесь будут выведены возможные ошибки переноса');

end;

end.
