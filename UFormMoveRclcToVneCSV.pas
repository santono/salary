unit UFormMoveRclcToVneCSV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet;

type
  TFormMoveRclcToVneCSV = class(TForm)
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
     procedure ExecuteMoveRclc;
     function initList:boolean;
     procedure emptyList;

  public
    { Public declarations }
  end;

var
  FormMoveRclcToVneCSV: TFormMoveRclcToVneCSV;

implementation
  Uses UFibModule,ScrDef,ScrIo,ScrUtil,
       UFormSelPKG,ScrLists,uSQLUnit,ScrNalog,Math,uFormWait;

{$R *.dfm}
 type pRecRclcPerson=^tRecRclcPerson;
      tRecRclcPerson=record
                tabno     : Integer;
                GUID      : string;
                listDopl  : TList;
               end;
      pRecRclcDet = ^tRecRclcDet;
      tRecRclcDet = record
                     shifrSta:Integer;
                     y:Integer;
                     m:Integer;
                     summa:Real;
                   end;
 var list:tList;
function TFormMoveRclcToVneCSV.initList:boolean;
 var retVal:boolean;
     fName:string;
     dev:TextFile;
     line:string;
     recRclc:pRecRclcPerson;
     recRclcDet : pRecRclcDet;
     arrStr:TArrOfString;
     iVal,iErr:Integer;
     aVal:Real;
     s:string;
     lineno:integer;
     currGuid:string;
     guid:string;
     tabno:Integer;
     shifrSta,y,m:Integer;
     summa:Real;
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
      currGuid:='1';
      while not Eof(dev) do
        begin
             Readln(dev,line);
             Inc(lineno);
             if lineno<3 then
                Continue;
             line:=Trim(line);
             if Length(line)<50 then
                Continue;
             arrStr:=Split(line,';');
             iVal:=high(arrStr);
             if high(arrStr)<21 then
                Continue;
             if Trim(currGuid)<>Trim(arrStr[7]) then
                begin
                     Val(arrStr[1],iVal,iErr);
                     tabno:=iVal;
                     currGuid:=Trim(arrStr[7]);
                     New(recRclc);
                     FillChar(recRclc^,SizeOf(recRclc^),0);
                     recRclc^.GUID:=currGUID;
                     recRclc^.tabno:=Tabno;
                     recRclc^.listDopl:=TList.Create;
                     list.Add(recRclc);
                end;
             Val(arrStr[20],iVal,iErr);
             shifrSta:=iVal;
             Val(arrStr[21],aVal,iErr);
             summa:=aVal;
             Val(arrStr[16],iVal,iErr);
             m:=iVal;
             y:=2023;
             New(recRclcDet);
             FillChar(recRclcDet^,SizeOf(recRclcDet^),0);
             recRclcDet^.shifrSta:=shifrSta;
             recRclcDet^.y:=y;
             recRclcDet^.m:=m;
             recRclcDet^.summa:=SimpleRoundTo(summa,-2);
             (recRclc^.listDopl).add(recRclcDet);
        end;
      CloseFile(dev);
      if list.count>0 then
         retVal:=True;
      initList:=retVal;
 end;
procedure TFormMoveRclcToVneCSV.emptyList;
 var retVal:boolean;
     recRclc:pRecRclcPerson;
     recRclcDet:pRecRclcDet;
     s:string;
     i,j:Integer;
 begin
      if list.count>0 then
//         for i:=0 to list.count-1 do
//             begin
//                  if recrclc(list.Items[i]).listDopl.count>0 then
//                  for j:=0 to recrclc(list.Items[i])^.listDopl.count-1 do
//                     Dispose(pRecRclcDet(precrclc(list.Items[i])^.listDopl.Items[j]));
//                  precrclcperson(list.Items[i])^.listDopl.Clear;
//                  Dispose(pRecRclc(list.Items[i]));
//             end;
      list.Clear;
      list.Free;
      list:=nil;
 end;
procedure TFormMoveRclcToVneCSV.BitBtn1Click(Sender: TObject);
begin
     wantedMonth:=3;
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
     if MessageDlg('Выполнить перенос перерасчета в '+getMonthRus(nmes)+' '+IntToStr(currYear)+' г.?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
        begin
             BitBtn1.Enabled:=False;
             FormWait.Show;
             Application.ProcessMessages;
             if InitList then
                begin
                     formWait.hide;
                     Application.ProcessMessages;
                     try
                        ExecuteMoveRclc;
                        showMessage('Перенос закончен');
                     except
                     else
                     end;
                end;
             BitBtn1.Enabled:=true;
        end;
end;




procedure TFormMoveRclcToVneCSV.ExecuteMoveRclc;
const   id=37;
var NMES_Sav,NSRV_Sav:Integer;
    I_NSRV,SC:Integer;
    Curr_Person:Person_Ptr;
    Maked:Boolean;
    I:Integer;
    shifrDol:integer;
    amntOfMoved:integer;
        procedure Delete_Rclc_Pod;
         var Curr_Person:Person_Ptr;
             done:Boolean;
         begin
              repeat
                 done:=True;
                 curr_person:=head_person;
                 while (curr_person<>nil) do
                   begin
                        shifrdol:=GET_DOL_CODE(curr_person);
                        if shifrDol=4 then
                        if CURR_PERSON^.GRUPPA=26+wantedMonth then
                           begin
                                Del_person(curr_person);
                                done:=false;
                                Break;
                           end;
                     curr_person:=curr_person^.NEXT;
                   end;
                 if done then Break;
              until True;
         end;
   function findRclcItemInList(curr_Person:Person_ptr):Integer;
    var i:Integer;
        GUID:string;
        finded:Boolean;
        aVal:real;
        retVal:integer;
    begin
         retVal:=-1;
         finded:=false;
         GUID:=GetGUIDPersonToString(Curr_Person);
         findRclcItemInList:=retVal;
         if list.Count>0 then
            for i:=0 to list.Count-1 do
                if Trim(pRecRclcPerson(list.Items[i])^.GUID)=Trim(GUID) then
                   begin
                        finded := true;
                        retVal := i;
                        Break;
                   end;
         if finded then
            findRclcItemInList:=retVal;
    end;
   procedure setGuid(curr_person:person_ptr;retval:person_ptr;wantedMonth:integer);
    var curr_cn:CN_PTR;
        finded:boolean;
        prim_1:string;
        Summa,Flow_Summa,Limit_Summa:Real;
    begin
       Curr_CN:=Curr_Person^.CN;
       Finded:=false;
       while (Curr_Cn<>Nil) do
        begin
             if Curr_Cn^.Shifr=GUIDShifr+Limit_Cn_Base then
                begin
                     Finded:=true;
                     break;
                end;
             Curr_Cn:=Curr_Cn^.Next;
        end;
       if finded then
          begin
               Prim_1:=curr_cn^.prim_1;
               summa:=curr_cn^.summa+wantedMonth;
               Flow_Summa:=curr_cn^.flow_summa;
               limit_Summa:=curr_cn^.limit_summa;
               putGUIDToPerson(retval,summa,flow_summa,limit_summa);
          end;

    end;

   function Make_Person_Vne(curr_person:person_ptr;wantedMonth:integer):PERSON_PTR;
     var retVal:person_ptr;
     begin
          MAKE_PERSON(retVal);
          retVal^.GRUPPA:=26+wantedmonth;
          retVal^.TABNO:=curr_person^.TABNO;
          retVal^.FIO:=Trim(curr_person^.FIO);
          retval^.DOLG:='Перерасчет за '+IntToStr(wantedMonth);
          retVal^.NAL_CODE:=curr_person^.NAL_CODE;
          retVal^.OKLAD:=0.00;
          retVal^.WID_RABOTY:=2;
          retVal^.FROM:=NSRV;
          retVal^.MESTO_OSN_RABOTY:=curr_person^.MESTO_OSN_RABOTY;
          retVal^.KATEGORIJA:=curr_person^.KATEGORIJA;
          make_dol_person(retVal,4);
          SetGuid(curr_person,retval,wantedMonth);
          Make_Person_Vne:=retVal;
     end;
   function fillPersons:boolean;
     var Curr_Person : Person_Ptr;
         tabno       : integer;
         retVal      : boolean;
         curr_add    : add_ptr;
         guid        : string;
         GUIDString  : string;
         ShifrDol:integer;
         recRclc:pRecRclcPerson;
         recRclcDet:pRecRclcDet;
         vnePerson:PERSON_PTR;
         i:Integer;
         findedrec:Integer;
     begin
         retVal := false;
         tabno  := 0;
         Curr_Person:=Head_Person;
         while (Curr_Person<>NIl) do
           begin
                GUIDString:=GetGUIDPersonToString(curr_person);
                if curr_person^.tabno=331 then
                   curr_person^.TABNO:=331;
                findedrec:=findRclcItemInList(Curr_Person);
                if findedrec<0 then
                   begin
                        curr_person:=curr_person^.NEXT;
                        continue;
                   end;
                shifrDol:=GET_DOL_CODE(curr_person);
                if shifrDol=4 then
                   begin
                        curr_person:=curr_person^.NEXT;
                        continue;
                   end;
                recrclc:=pRecRclcPerson(list.items[findedrec]);
                if recRclc.listDopl.count>0 then
                   begin
                        vnePerson:=Make_Person_Vne(curr_person,wantedMonth);
                        setPorNomerPerson(vnePerson,101);
                        for i:=0 to recRclc.listDopl.count-1 do
                           begin
                             recRclcDet:=pRecRclcDet(recRclc.listDopl.Items[i]);
                             Make_add(Curr_add,vnePerson);
                             curr_ADD^.SHIFR  := recRclcDet.shifrSta;
                             curr_add^.period := recRclcDet.m;
                             curr_add^.year   := 2023-1990;
                             curr_add^.summa  := recRclcDet.summa;
                             curr_add^.fzp    := curr_add^.summa;
                             curr_add^.who    := id;
                           end;
                        retVal           := true;
                        inc(amntofmoved);
                        maked:=true;
                   end;
                list.Delete(findedrec);
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
  //   for I_NSRV:=151 to 151 do
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
              Delete_Rclc_Pod;
              fillPersons;
              if Maked then PUTINF;
              EMPTY_ALL_PERSON;
 //             break;
         end;
     showMessage('Перенесено '+intToStr(amntOfMoved)+' строк ');
     NMES:=NMES_Sav;
     NSRV:=NSRV_Sav;
     MKFLNM;
     GETINF(TRUE);

end;

procedure TFormMoveRclcToVneCSV.BitBtn3Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;

end;

procedure TFormMoveRclcToVneCSV.FormCreate(Sender: TObject);
begin
     filename   := '';
     wantedYear := 0;
     wantedMonth:= 0;
     wantedShifr:= 0;
     BitBtn1.Enabled:=False;

end;

procedure TFormMoveRclcToVneCSV.BitBtn4Click(Sender: TObject);
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
