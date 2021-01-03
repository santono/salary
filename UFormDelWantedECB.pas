unit UFormDelWantedECB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TFormDelWantedECB = class(TForm)
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    rg1: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDelWantedECB: TFormDelWantedECB;

implementation
   uses ScrLists,ScrDef,ScrIO,ScrUtil;

{$R *.dfm}

procedure TFormDelWantedECB.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

  procedure FilterPererasECB(WantedPeriod:integer;var CntDeleted:integer);
   var Curr_Person:Person_Ptr;
     IsECBUd  : boolean;
     IsECBAdd : boolean;
     Done     : boolean;
     Curr_Ud  : Ud_Ptr;
     Curr_Add : Add_Ptr;
   begin
        curr_person:=head_person;
        while (curr_Person<>NIl) do
          begin
               if Curr_Person^.AUTOMATIC<>AUTOMATIC_MODE then
                  begin
                       Curr_Person:=Curr_Person^.NEXT;
                       continue;
                  end;
               if Curr_Person^.Tabno=10141 then
                  Curr_Person^.Tabno:=10141;
            //   LabelFIO.Caption:=Curr_Person^.Fio;
            //   Application.ProcessMessages;
               IsECBUd:=false;
               Curr_Ud:=Curr_Person^.Ud;
               while (Curr_Ud<>Nil) do
                begin
                     if Curr_ud^.VYPLACHENO=not_GET_OUT then
                     if Curr_Ud^.Period=WantedPeriod then
                     if (Curr_Ud^.Shifr=ECBShifr) or
                        (Curr_Ud^.Shifr=ECBNShifr) then
                        begin
                             IsECBUd:=true;
                             break;
                        end;
                     Curr_Ud:=Curr_Ud^.NEXT;
                end;
               IsECBAdd:=false;
               Curr_Add:=Curr_Person^.Add;
               while (Curr_Add<>Nil) do
                 begin
                      if not IsOtherPeriodECBShifr(Curr_Add^.Shifr) then
                      if (Curr_Add^.Period=WantedPeriod) then
                         begin
                              IsECBAdd:=true;
                              break;
                         end;
                      Curr_Add:=Curr_Add^.NEXT;
                  end;
               if IsECBUd and IsECBAdd then
                  begin
                        Repeat
                              Done:=true;
                              Curr_Ud:=Curr_Person^.UD;
                              while (Curr_Ud<>Nil) do
                               begin
                                    if Curr_Ud^.Period=WantedPeriod then
                                    if (Curr_Ud^.Shifr=ECBShifr)  or
                                       (Curr_Ud^.Shifr=ECBNShifr) or
                                       (Curr_Ud^.Shifr=Podoh_Shifr) then
                                       begin
                                            Del_Ud(Curr_Ud,Curr_Person);
                                            inc(CntDeleted);
                                            Done:=false;
                                            break;
                                       end;
                                    Curr_Ud:=Curr_Ud^.NEXT;
                               end;
                        until done;
                  end;
               Curr_Person:=Curr_Person^.NEXT;
          end;
     end;

  procedure DeleteWSPodr(WantedPeriod:integer;WantedShifr:integer);
   var Curr_Person:Person_Ptr;
       Done     : boolean;
       Curr_Ud  : Ud_Ptr;
   begin
        curr_person:=head_person;
        while (curr_Person<>NIl) do
          begin
               repeat
                     done:=True;
                     Curr_Ud:=Curr_Person^.Ud;
                     while (Curr_Ud<>Nil) do
                        begin
                            if Curr_Ud^.Period=WantedPeriod then
                            if (Curr_Ud^.Shifr=WantedShifr) then
                              begin
                                   DEL_UD(Curr_Ud,Curr_Person);
                                   done:=False;
                                   break;
                              end;
                            Curr_Ud:=Curr_Ud^.NEXT;
                        end;
               until Done;
               Curr_Person:=Curr_Person^.NEXT;
          end;
     end;




procedure TFormDelWantedECB.BitBtn1Click(Sender: TObject);
 var WantedPeriod : integer;
     S            :  string;
     i            : integer;
     savnsrv      : integer;
     Curr_Person  : Person_ptr;
     Curr_Ud      : ud_ptr;
     done         : boolean;
     i_nsrv       : integer;
     CntDeleted   : integer;
     WantedNalog  : integer;
begin
     WantedNalog:=0;
     if rg1.ItemIndex=1 then
        Wantednalog:=1
     else
     if rg1.ItemIndex=2 then
        Wantednalog:=2;
     if not YesNo('Удалить ЕСВ за мес. при наличии начисления'+#10+#13+'(Месяц будет предлжено выбрать на след шаге)?') then Exit;
     S := InputBox('Месяц ЕСВ','Введите номер месяца','0');
     val(s,WantedPeriod,I);
     if (i<>0) then
        begin
             ShowMessage('Неверный номер месяца');
             Exit;
        end;
     if (WantedPeriod<1) or (WantedPeriod>12){ or (WantedPeriod=NMES)} then
        begin
             ShowMessage('Неверный номер месяца.');
             Exit;
        end;

    ProgressBar1.Min      := 0;
    ProgressBar1.Max      := Count_Serv;
    ProgressBar1.Position := 0;
    savnsrv               := nsrv;
    putinf;
    CntDeleted            := 0;
    EMPTY_ALL_PERSON;
    for i_nsrv:=1 to count_serv do
        begin
             nsrv:=i_nsrv;
             mkflnm;
             ProgressBar1.Position := i_nsrv;
             Application.ProcessMessages;
             if not fileexists(fninf) then continue;
             getinf(true);
             case WantedNalog of
              1:DeleteWSPodr(WantedPeriod,War_Sbor_Shifr);
              2:DeleteWSPodr(WantedPeriod,PROF_shifr);
             else
                FilterPererasECB(WantedPeriod,CntDeleted);
             end;   
             putinf;
             EMPTY_ALL_PERSON;
       end;
    if CntDeleted>0 then
       ShowMessage('Удалено '+IntToStr(CntDeleted)+' строк')
    else
       ShowMessage('Строк с указанным шифром не найдено');
    nsrv:=savnsrv;
    mkflnm;
    getinf(true);


end;

procedure TFormDelWantedECB.FormCreate(Sender: TObject);
begin
     rg1.ItemIndex:=0;
end;

end.
