unit UFormMoveDoplFromCSV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet;

type
  TFormMoveDoplFromCSV = class(TForm)
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    LabelPodr: TLabel;
    OpenDialog1: TOpenDialog;
    Label2: TLabel;
    BitBtn4: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
     filename:string;
     wantedMonth:Integer;
     wantedYear:Integer;
     wantedShifr:integer;
     mess156:string;  // 'До.мин.з.п.10.22'
     procedure ExecuteMoveDopl;
     function initList:boolean;
     procedure emptyList;

  public
    { Public declarations }
  end;

var
  FormMoveDoplFromCSV: TFormMoveDoplFromCSV;

implementation
  Uses UFibModule,ScrDef,ScrIo,ScrUtil,UFormSelPKG,ScrLists,uSQLUnit,ScrNalog;

{$R *.dfm}
 type pRecDopl=^tRecDopl;
      tRecDopl=record
                tabno     : Integer;
                GUID      : string;
                summaDopl : Real;
                shifrWR   : Integer;
                shifrGru  : Integer;
                shifrKat  : Integer;
               end;
 var list:tList;
function TFormMoveDoplFromCSV.initList:boolean;
 var retVal:boolean;
     fName:string;
     dev:TextFile;
     line:string;
     recDopl:pRecDopl;
     arrStr:TArrOfString;
     iVal,iErr:Integer;
     aVal:Real;
     s:string;
     lineno:integer;
   function readFileHeader(line:string):Boolean;
     var retval:boolean;
         arrStr:TArrOfString;
         iVal,iErr:Integer;
         aVal:Real;
         s:string;
     begin
          retVal:=True;
          arrStr:=Split(line,';');
          if High(arrStr)<>5 then
             retVal:=False
          else
             begin
                 s:=arrStr[1];
                 Val(s,ival,ierr);
                 if iErr<>0 then
                    retVal:=False;
                 if retVal then
                 if ((iVal<1) or (iVal>12)) then
                    retval:=false
                 else
                    wantedmonth:=iVal;
                 if retval then
                    begin
                         s:=arrStr[3];
                         Val(s,ival,ierr);
                         if iErr<>0 then
                            retVal:=False;
                         if retVal then
                         if ((iVal<(WORK_YEAR_VAL-1)) or (iVal>WORK_YEAR_VAL)) then
                           retval:=false
                         else
                           wantedyear:=iVal;
                    end;
                 if retval then
                    begin
                         s:=arrStr[5];
                         Val(s,ival,ierr);
                         if iErr<>0 then
                            retVal:=False;
                         if retVal then
                         if not (iVal in [DOPL_DO_MIN_SHIFR,PerersZaProshlPeriody]) then
                           retval:=false
                         else
                           wantedShifr:=iVal;
                         if retVal then
                         if wantedShifr=PerersZaProshlPeriody  then
                            mess156:='Допл.мин.з.п. '+IntToStr(wantedMonth)+' '+IntToStr(wantedYear);
                    end;
             end;
          readFileHeader:=retVal;
     end;
 begin
      retVal:=false;
      fName:=filename;
      if not FileExists(FName) then
         begin
              ShowMessage('Отсутстует файл '+fname);
              initList:=retVal;
              Exit;
         end;
      list:=TList.Create;
      AssignFile(dev,fname);
      Reset(dev);
      lineNo:=0;
      while not Eof(dev) do
        begin
             Readln(dev,line);
             Inc(lineno);
             if lineno=1 then
                if not readFileHeader(line) then
                   begin
                        initList:=false;
                        break;
                   end
                else
                   continue;
             if lineno=2 then
                Continue; 
             line:=Trim(line);
             if Length(line)<50 then
                Continue;
             arrStr:=Split(line,';');
             if high(arrStr)<16 then
                Continue;
             New(recDopl);
             FillChar(recDopl^,SizeOf(recDopl^),0);
             s:=arrStr[1];
             s:=Trim(s);
             Val(s,iVal,iErr);
             if iErr=0 then
                recDopl^.tabno:=iVal
             else
                Continue;
             s:=arrStr[16];
             recDopl^.GUID:=trim(s);
             s:=arrStr[12];
             s:=Trim(s);
             Val(s,aVal,iErr);
             if iErr=0 then
                recDopl^.summaDopl:=aVal
             else
                Continue;
             list.add(recDopl);
        end;
      CloseFile(dev);
      if list.count>0 then
         retVal:=True;
      initList:=retVal;
 end;
procedure TFormMoveDoplFromCSV.emptyList;
 var retVal:boolean;
     fName:string;
     dev:TextFile;
     line:string;
     recDopl:pRecDopl;
     s:string;
     i:Integer;
 begin
      if list.count>0 then
         for i:=0 to list.count-1 do
             Dispose(pRecDopl(list.Items[i]));
      list.Clear;
      list.Free;
      list:=nil;
 end;
procedure TFormMoveDoplFromCSV.BitBtn1Click(Sender: TObject);
begin
     if not ((nmes=FLOW_MONTH) and (CURRYEAR=WORK_YEAR_VAL)) then
        begin
             ShowMessage('Перенос возможен только в '+GetMonthRus(FLOW_MONTH)+' '+IntToStr(WORK_YEAR_VAL)+' г.');
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
     if (filename='')
        or
        (not FileExists(filename)) then
        begin
             showMessage('Укажите файл для переноса');
             Exit;
        end;
     if MessageDlg('Выполнить перенос доплат в '+getMonthRus(nmes)+' '+IntToStr(currYear)+' г.?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
        begin
             BitBtn1.Enabled:=False;
             if InitList then
                begin
                     try
                        ExecuteMoveDopl;
                        showMessage('Перенос закончен');
                     except
                     else
                     end;
                end;
             BitBtn1.Enabled:=true;
        end;
end;




procedure TFormMoveDoplFromCSV.ExecuteMoveDopl;
const   id=37;
var NMES_Sav,NSRV_Sav:Integer;
    I_NSRV,SC:Integer;
    Curr_Person:Person_Ptr;
    Maked:Boolean;
    I:Integer;
    shifrDol:integer;
    amntOfMoved:integer;
        procedure Delete_Dopl_Person(Curr_person:person_ptr);
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
                            if Curr_Add^.Period = wantedMonth then
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
        procedure Delete_Dopl_Pod;
         var Curr_Person:Person_Ptr;
         begin
              curr_person:=head_person;
              while (curr_person<>nil) do
                begin
                     Delete_Dopl_person(curr_person);
                     curr_person:=curr_person^.NEXT;
                end;
         end;
   function findSummaDoplInList(curr_Person:Person_ptr):real;
    var i:Integer;
        GUID:string;
        finded:Boolean;
        aVal:real;
    begin
         finded:=false;
         GUID:=GetGUIDPersonToString(Curr_Person);
         findSummaDoplInList:=-10.00;
         if list.Count>0 then
            for i:=0 to list.Count-1 do
                if Trim(pRecDopl(list.Items[i])^.GUID)=Trim(GUID) then
                   begin
                        finded:=true;
                        aVal:=pRecDopl(list.Items[i])^.summaDopl;
                        list.Delete(i);
                        Break;
                   end;
         if finded then
            findSummaDoplInList:=aVal;
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
         SummaDopl:real;
     begin
         retVal := false;
         tabno  := 0;
         Curr_Person:=Head_Person;
         while (Curr_Person<>NIl) do
           begin
                GUIDString:=GetGUIDPersonToString(curr_person);
                if curr_person^.tabno=1356 then
                   curr_person^.TABNO:=1356;
                summaDopl:=0.00;
                summaDopl:=findSummaDoplInList(Curr_Person);
                summaDopl:=R10(summaDopl);
                if summaDopl<-0.05 then
                   begin
                        curr_person:=curr_person^.NEXT;
                        continue;
                   end;
                Make_add(Curr_add,curr_person);
                curr_ADD^.SHIFR  := wantedShifr;
                curr_add^.period := wantedMonth;
                curr_add^.year   := wantedYear-1990;
                curr_add^.summa  := summaDopl;
                curr_add^.fzp    := summaDopl;
                curr_add^.who    := id;
                if wantedShifr=PerersZaProshlPeriody then
                   put156MessageToCn(curr_person,CURR_ADD^.PERIOD,summaDopl,Curr_Add^.who,Mess156);
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
              Delete_Dopl_Pod;
              fillPersons;
              if Maked then PUTINF;
              EMPTY_ALL_PERSON;
         end;
     showMessage('Перенесено '+intToStr(amntOfMoved)+' строк ');
     NMES:=NMES_Sav;
     NSRV:=NSRV_Sav;
     MKFLNM;
     GETINF(TRUE);

end;

procedure TFormMoveDoplFromCSV.BitBtn3Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;

end;

procedure TFormMoveDoplFromCSV.FormCreate(Sender: TObject);
begin
     filename   := '';
     wantedYear := 0;
     wantedMonth:= 0;
     wantedShifr:= 0;
     BitBtn1.Enabled:=False;

end;

procedure TFormMoveDoplFromCSV.BitBtn4Click(Sender: TObject);
begin
if OpenDialog1.Execute then
   begin
        filename := OpenDialog1.FileName;
        Label2.Caption:=FileName;
        BitBtn1.Enabled:=true;
        Application.ProcessMessages;
   end;
end;

end.
