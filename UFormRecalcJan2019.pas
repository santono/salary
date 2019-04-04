unit UFormRecalcJan2019;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons;

type
  TFormRecalcJan2019 = class(TForm)
    ProgressBar1: TProgressBar;
    LabelPodr: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure executeRecalcJan;
  end;

var
  FormRecalcJan2019: TFormRecalcJan2019;

implementation

{$R *.dfm}
  uses scrio,scrdef,scrnalog, scrlists, scrutil,uFormSelPKG;

procedure TFormRecalcJan2019.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TFormRecalcJan2019.FormCreate(Sender: TObject);
begin
      LabelPodr.Caption:='';
end;

procedure TFormRecalcJan2019.BitBtn1Click(Sender: TObject);
begin
     if not ((nmes=2) and (CURRYEAR=2019)) then
        begin
             showMessage('Перерасчет можно выполнить только в феврале 2019');
             exit;
        end;
     if NameServList.CountSelected<1 then
        begin
             showMessage('Не указаны подразделения');
             exit;
        end;
     executeRecalcJan;
     ShowMessage('Перерасчет января выполнен!');
end;

procedure TFormRecalcJan2019.executeRecalcJan;
 const whoId=77;
 var tmpNMES : integer;
     tmpNSRV : integer;
     i_nsrv  : integer;
     curr_person:person_ptr;
     razr    : integer;
     curr_cn : cn_ptr;
     maked   : boolean;
 procedure delete_all_previous_recalc;
  var curr_add:add_ptr;
      curr_person:person_ptr;
      done:boolean;
  begin
       curr_person:=head_person;
       while (curr_person<>nil) do
          begin
               repeat
                     done:=true;
                     curr_add:=curr_person^.add;
                     while (curr_add<>nil) do
                        begin
                             if curr_add^.PERIOD=1 then
                             if curr_add^.VYPLACHENO=get_out then
                             if curr_add^.WHO=whoId then
                                begin
                                     del_add(curr_add,curr_person);
                                     done:=false;
                                     break;
                                end;
                             curr_add:=curr_add^.NEXT;
                        end;
               until done;
               curr_person:=curr_person^.NEXT;
          end;
  end;
 procedure  recalcPerson(curr_person:person_ptr);
  var Curr_Person_Jan:person_ptr;
      curr_Add:Add_ptr;
      dayJanReal:real;
      workDayReal:real;
      summaOkl,summaDopl:real;
      OkladOri,OkladJan:real;
      procNadb:real;
    function findJanPerson(Curr_Person:person_ptr):person_ptr;
      var retVal:person_ptr;
          person:person_ptr;
          GUIDOri , GUIDCurr : string;
          finded:boolean;
      begin
           retVal:=nil;
           GUIDOri:=GetGUIDPersonToString(Curr_Person);
           select(2);

           person:=head_person;
           finded:=false;
           while (person<>nil) do
            begin
                 if person^.TABNO=curr_person^.TABNO then
                    begin
                         GUIDCurr:=GetGUIDPersonToString(person);
                         if (guidCurr=guidOri)  then
                            begin
                                 finded:=true;
                                 retVal:=person;
                                 break;
                            end;
                    end;
                 person:=person^.NEXT;
            end;
           select(1);
           findJanPerson:=retVal;
      end;
       FUNCTION SUMOKLADA(WANTED_SHIFR:INTEGER;CURR_PERSON:PERSON_PTR;START_MONTH:INTEGER):REAL;
  VAR
      SUMMA:REAL;
//      I,I_A:INTEGER;
      CURR_ADD:ADD_PTR;
  BEGIN
       SUMMA:=0;
       curr_add:=curr_person^.add;
       while (curr_add<>nil) do
        begin
             IF CURR_adD^.SHIFR=WANTED_SHIFR THEN
             IF CURR_adD^.PERIOD=START_MONTH THEN
                 SUMMA:=SUMMA+CURR_adD^.SUMMA;
             curr_add:=curr_add^.NEXT;
        end;
       SUMOKLADA:=SUMMA;
  END;

  begin
      Curr_person_jan:=findJanPerson(Curr_Person);
      if curr_person_jan=nil then exit;
      dayJanReal:=getWDay(1,Curr_person_jan);
      if (dayJanReal<0.9999999) then exit;
      workDayReal:=work_day(1,31,Curr_person_jan);
      // 1 Оклад
      summaOkl:=Curr_Person^.oklad-Curr_person_jan^.oklad;
      if abs(summaOkl)<0.00999 then exit;
      OkladOri:=r10(Curr_Person^.oklad/dayJanReal*workDayReal);
      OkladJan:=SUMOKLADA(OKLAD_SHIFR,CURR_PERSON_JAN,1);
      summaOkl := r10(okladOri-okladJan);
      if abs(summaOkl)>0.0099 then
         begin
              make_add(curr_add,curr_person);
              curr_add^.shifr:=oklad_shifr;
              curr_add^.PERIOD:=1;
              curr_add^.YEAR:=(2019-1990);
              curr_add^.SUMMA := summaOkl;
              curr_add^.FZP   := curr_add^.SUMMA;
              curr_add^.WHO   := whoid;
              curr_add^.VYPLACHENO:=get_out;
              curr_cn:=curr_person^.CN;
              maked:=true;
              while (curr_cn<>nil) do
               begin
                    if curr_cn^.shifr<limit_cn_base then
                    if curr_cn^.AUTOMATIC=automatic_mode then
                    if ShifrList.IsAdd(curr_cn^.shifr) then
                    if curr_cn^.KOD in [2,4,6] then
                       begin
                            procNadb := curr_cn^.SUMMA;
                            if procNadb>2 then
                               procNadb:=procNadb / 100.00;
                            summaDopl:=r10(summaOkl*procNadb);
                            if abs(summaDopl)>0.00999 then
                               begin
                                    make_add(curr_add,curr_person);
                                    curr_add^.shifr:=curr_cn^.shifr;
                                    curr_add^.PERIOD:=1;
                                    curr_add^.YEAR:=(2019-1990);
                                    curr_add^.SUMMA := summaDopl;
                                    curr_add^.FZP   := curr_add^.SUMMA;
                                    curr_add^.WHO   := whoid;
                                    curr_add^.VYPLACHENO:=get_out;
                                    maked:=true;
                               end;
                       end;
                    curr_cn:=curr_cn^.Next;
               end;
         end;
  end;

 begin
      tmpNMES := NMES;
      tmpNSRV := NSRV;
      putinf;
      EMPTY_ALL_PERSON;
      ProgressBar1.Max:=Count_Serv;
      ProgressBar1.Min:=0;
      ProgressBar1.Position:=0;
      ProgressBar1.Step:=1;
      for I_NSRV:=1 to Count_Serv do
        begin
              ProgressBar1.StepIt;
              LabelPodr.Caption:=Name_Serv(i_NSRV);
              Application.ProcessMessages;
              if not NameServList.IsSelected(i_nsrv) then continue;
              nsrv:=i_nsrv;
              mkflnm;
              if not fileexists(fninf) then continue;
              getinf(true);
              nmes:=1;
              mkflnm;
              select(2);
              getinf(false);
              select(1);
              nmes:=tmpNMES;
              mkflnm;
              maked:=false;
              delete_all_previous_recalc;
              curr_person:=head_person;
              while (curr_person<>nil) do
                 begin
                   if (curr_person.AUTOMATIC=MANUAL_MODE) then
                      begin
                           curr_person:=curr_person^.NEXT;
                           continue;
                      end;
                   razr:=GetRazrjadPerson(curr_person);
                   if ((razr<12) or (razr>24)) then
                      begin
                           curr_person:=curr_person^.NEXT;
                           continue;
                      end;
                   recalcPerson(curr_person);
                   curr_person:=curr_person^.NEXT;
                 end;
              select(2);
              EMPTY_ALL_PERSON;
              select(1);
              if maked then
                 putinf;
              EMPTY_ALL_PERSON;
        end;
      NMES := tmpNMES;
      NSRV := tmpNSRV;
      MKFLNM;
      getinf(true);

 end;

procedure TFormRecalcJan2019.BitBtn3Click(Sender: TObject);
begin
     Application.CreateForm(TFormSelPKG,FormSelPKG);
     FormSelPKG.ShowModal;
end;

end.
