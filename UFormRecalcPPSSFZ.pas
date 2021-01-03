unit UFormRecalcPPSSFZ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Gauges, ExtCtrls, ComCtrls;

type
  TFormRecalcPPSZ = class(TForm)
    GaugePodr: TGauge;
    GaugePerson: TGauge;
    LabelPodr: TLabel;
    LabelPerson: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Timer1: TTimer;
    LabelTimer: TLabel;
    DateTimePickerFr: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePickerTo: TDateTimePicker;
    CheckBoxPodoh: TCheckBox;
    CheckBoxPens: TCheckBox;
    CheckBoxSS: TCheckBox;
    CheckBoxFZ: TCheckBox;
    CheckBoxECB: TCheckBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    TimeStart:TDateTime;
    TimePassed:TDateTime;
    WantedYear:Integer;
  public
    { Public declarations }
  end;

var
  FormRecalcPPSZ: TFormRecalcPPSZ;

implementation
 uses UFibModule,ScrDef,ScrUtil, uFormWait, ScrIo, UformSelPod, ScrLists,DateUtils;

{$R *.dfm}

procedure TFormRecalcPPSZ.BitBtn2Click(Sender: TObject);
 const  RecalcId=111;

var NSRVT,NMES_T,I,J:Integer;
    Curr_Person:Person_Ptr;
    S:String;
    MonthZa:Integer;
    SummaPod,SummaPens,SummaSS,SummaFZ:Real;
    WantedYear:integer;
    DateFr,DateTo:TDateTime;
    Y,M,D:word;
    SummaU:real;
    function GetSummaUd(Curr_Person:person_ptr):real;
     var RetVal:real;
         Curr_Ud:Ud_Ptr;
     begin
         retval:=0;
         curr_ud:=curr_person^.ud;
         while (curr_ud<>nil) do
          begin
               retval:=retval+curr_ud^.SUMMA;
               curr_ud:=curr_ud^.NEXT;
          end;
     end;

    procedure DeleteRecalcResult;
     var Curr_Person:Person_Ptr;
         Curr_Ud:Ud_Ptr;
         Finished:boolean;
     begin
          curr_person:=Head_Person;
          while (Curr_Person<>Nil) do
            begin
                  while true do
                    begin
                          Finished:=true;
                          Curr_Ud:=Curr_Person^.UD;
                          While (Curr_Ud<>Nil) do
                           begin
                                if curr_person^.tabno=10144 then
                                   Finished:=finished;
                                if Curr_Ud^.Who=RecalcId then
                                if Curr_Ud^.Year=WantedYear-1990 then
                                if (Curr_Ud^.Period>=MonthOf(DateFr)) and (Curr_Ud^.Period<=MonthOf(DateTo)) then
                                   begin
                                        if (CheckBoxPodoh.Checked and (Curr_Ud.Shifr=Podoh_Shifr)) or
                                           (CheckBoxPens.Checked and (Curr_Ud.Shifr=Pens_Shifr)) or
                                           (CheckBoxSS.Checked and (Curr_Ud.Shifr=S_S_Shifr)) or
                                           (CheckBoxFZ.Checked and ((Curr_Ud.Shifr=ECBShifr) or
                                                                    (Curr_Ud.Shifr=ECBNShifr) or
                                                                    (Curr_Ud.Shifr=ECBInvShifr) or
                                                                    (Curr_Ud.Shifr=ECBIllShifr) or
                                                                    (Curr_Ud.Shifr=ECBDPShifr))) or
                                           (CheckBoxFZ.Checked and (Curr_Ud.Shifr=Fond_Z_Shifr)) then
                                           begin
                                                Del_Ud(Curr_Ud,Curr_Person);
                                                Finished:=false;
                                                break;
                                           end;
                                   end;
                                Curr_Ud:=Curr_Ud^.NEXT;
                           end;
                           if Finished then break;
                    end;
                  Curr_Person:=Curr_Person^.NEXT;
            end;
     end;

    function GetSummaNotBlockedUdForWantedUd(Shifr:integer;Y:integer;M:integer):real;
     var RetVal:real;
         Curr_Ud:Ud_Ptr;
     begin
         RetVal:=0;
         Curr_Ud:=Curr_Person^.UD;
         while (Curr_Ud<>nil) do
          begin
               if Curr_ud^.shifr=SHIFR then
               if Curr_Ud^.VYPLACHENO=NOT_GET_OUT then
               if Curr_Ud^.Period=m then
               if ((Curr_Ud^.year=y) or
                   (Curr_Ud^.year+1990=y)) then
                  RetVal:=RetVal+Curr_Ud^.summa;
               Curr_Ud:=Curr_Ud^.NEXT;
          end;
         GetSummaNotBlockedUdForWantedUd:=RetVal;
     end;

    function FindUdForRecalc(Shifr:integer;Y:integer;M:integer):ud_ptr;
     var Curr_Ud:Ud_Ptr;
         Finded:boolean;
     begin
         Finded  := false;
         Curr_Ud := Curr_Person^.UD;
         while (Curr_Ud<>nil) do
          begin
               if Curr_ud^.shifr=SHIFR then
               if Curr_Ud^.VYPLACHENO=NOT_GET_OUT then
               if Curr_Ud^.Period=m then
               if ((Curr_Ud^.year=y) or
                   (Curr_Ud^.year+1990=y)) then
                  begin
                     Finded:=true;
                     break;
                  end;
               Curr_Ud:=Curr_Ud^.NEXT;
          end;
         if Finded then
            FindUdForRecalc:=Curr_Ud
         else
            FindUdForRecalc:=Nil;
     end;
    procedure AddToPerson(Mode:Integer);
     var Curr_Ud:Ud_Ptr;
         ShifrSta:Integer;
         Summa:Real;
         Changed : boolean;
     begin
         if Mode=2 then
            begin
                 ShifrSta := Pens_Shifr;
                 Summa    := SummaPens;
            end
                   else
         if Mode=3 then
            begin
                ShifrSta := S_S_Shifr;
                Summa    := SummaSS;
            end
                   else
         if Mode=4 then
            begin
                ShifrSta := FOND_Z_SHIFR;
                Summa    := SummaFZ;
            end
                   else
            begin
                ShifrSta := Podoh_Shifr;
                Summa    := SummaPod;
            end;
         Changed:=false;
         IF ABS(Summa)>0.02 THEN
            BEGIN
                 if abs(GetSummaNotBlockedUdForWantedUd(ShifrSta,WantedYear-1990,MonthZa))>0.01 then
                   begin
                         Curr_Ud:=FindUdForRecalc(ShifrSta,WantedYear-1990,MonthZa);
                         if Curr_Ud<>Nil then
                            begin
                                  Curr_Ud^.Summa    := Curr_Ud^.Summa + Summa;
                                  Curr_Ud^.Vyplacheno:=get_out;
                                  Curr_Ud^.Who      := RecalcId;
                                  Changed := true;
                            end;
                   end;
                 if not changed then
                   begin
                         Make_Ud(Curr_Ud,Curr_Person);
                         Curr_Ud^.Shifr    := ShifrSta;
                         Curr_Ud^.Period   := MonthZa;
                         Curr_Ud^.Year     := WantedYear-1990;
                         Curr_Ud^.Summa    := Summa;
                         Curr_Ud^.Who      := RecalcId;
                         Curr_Ud^.Vyplacheno:=get_out;
                   end
            END;
     end;


begin
     if NameServList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;
     if not (CheckBoxPodoh.Checked or
             CheckBoxPens.Checked  or
             CheckBoxSS.Checked    or
             CheckBoxFZ.Checked    or
             CheckBoxECB.Checked) then
        begin
              ShowMessage('Не указан налог для перерасчета');
              Exit;
        end;
     DateFr:=DateTimePickerFr.Date;
     DateTo:=DateTimePickerTo.Date;
     DateFr:=ReCodeDay(DateFR,1);
     DateTo:=ReCodeDay(DateTo,1);
     if DateFr>DateTo then
        Begin
             ShowMessage('Неверно указаны даты перерасчета');
             Exit;
        end;
     if YearOf(DateFr)<CurrYear-2 then
        Begin
             ShowMessage('Неверно указана первая датад');
             Exit;
        end;
     if YearOf(DateFr)>CurrYear then
        Begin
             ShowMessage('Неверно указана вторая дата');
             Exit;
        end;
     if YearOf(DateFr)<>YearOf(DateTo) then
        Begin
             ShowMessage('Неверно указаны даты. (Год должен быть одинаковый в обоих датах)');
             Exit;
        end;
     TimeStart   := Time;
     LabelTimer.Show;
     WantedYear:=YearOf(DateFr);
     GaugePodr.MinValue   := 0;
     GaugePodr.MaxValue   := Count_Serv;
     GaugePodr.Progress   :=  1;
     GaugePerson.MinValue :=  0;
     GaugePerson.MaxValue := 12;
     GaugePerson.Progress :=  1;

     NSRVT := NSRV;
     EMPTY_ALL_PERSON;
     nmes_t := nmes;

     FOR I:=1 TO COUNT_SERV DO
         BEGIN
              NSRV:=I;
              GaugePodr.Progress:=i;
              if not NameServList.IsSelected(NSRV) then continue;
              MKFLNM;
              if not FileExists(FNINF) then continue;
              if STORONNEE_PODRAZD(nsrv) then continue;
              if RECENZENT_PODRAZD(nsrv) then continue;
              NameServList.ClearSelected(NSRV);
              GETINF(TRUE);
              GaugePodr.Progress:=i;
              LabelPodr.Caption:=NAME_SERV(NSRV);
              LabelPodr.ReFresh;
              LabelPodr.RePaint;
              GaugePerson.MinValue :=  0;
              GaugePerson.MaxValue := COUNT_PERSON;
              GaugePerson.Progress :=  1;
              DeleteRecalcResult;
              Curr_Person:=Head_Person;
              J:=0;
              while (Curr_Person<>Nil) do
               begin
                    Inc(J);
                    if Curr_Person^.TABNO=8736 then
                       J:=j;
                    GaugePerson.Progress:=J;
                    LabelPerson.Caption:=IntToStr(Curr_Person^.Tabno)+' '+
                                         AllTrim(Curr_Person^.FIO)   +' '+
                                         AllTrim(Curr_Person^.Dolg);
                    LabelPerson.ReFresh;
                    LabelPerson.RePaint;
                    if Curr_Person^.Wid_Raboty=Osn_Wid_Raboty then
                       begin
                            FIB.pFIBTransactionSAL.StartTransaction;
                            S:='select MonthZa,SUMMAPODRAZN,SUMMAPENSRAZN,SUMMASSRAZN,SUMMAFZRAZN';
                            S:=S+' from RecalcPodohYear('+IntToStr(Curr_Person^.Tabno)+','+IntToStr(WantedYear)+')';
                            FIB.pFIBQuery.SQL.Clear;
                            FIB.pFIBQuery.SQL.Add(S);
                            try
                               FormWait.Show;
                               Application.ProcessMessages;
                               FIB.pFIBQuery.ExecQuery;
                               FormWait.Hide;
                               while not FIB.pFIBQuery.Eof do
                                     begin
                                           MonthZa   := FIB.pFIBQuery.Fields[0].AsInteger;
                                           SummaPod  := FIB.pFIBQuery.Fields[1].AsFloat;
                                           SummaPens := FIB.pFIBQuery.Fields[2].AsFloat;
                                           SummaSS   := FIB.pFIBQuery.Fields[3].AsFloat;
                                           SummaFZ   := FIB.pFIBQuery.Fields[4].AsFloat;
                                           if ((MonthZa>=MonthOf(DateFr)) and (MonthZa<=MonthOf(DateTo))) then
                                              begin
                                                   if CheckBoxPodoh.Checked then
                                                      begin
                                                   //        REPEAT
                                                   //        UNTIL NOT (DEL_WANTED_UD(PODOH_SHIFR, CURR_PERSON, MonthZa));
                                                           if abs(SummaPod) >0.009 then
                                                              AddToPerson(1);
                                                      end;
                                                   if CheckBoxPens.Checked then
                                                      begin
                                                    //       REPEAT
                                                    //       UNTIL NOT (DEL_WANTED_UD(PENS_SHIFR+SHIFT_SHIFR,CURR_PERSON,MONTHZA));
                                                    //       REPEAT
                                                    //       UNTIL NOT (DEL_WANTED_UD(PENS_SHIFR,CURR_PERSON,MONTHZA));
                                                           if abs(SummaPens)>0.009 then
                                                              AddToPerson(2);
                                                      end;
                                                   if CheckBoxSS.Checked then
                                                      begin
                                                     //      REPEAT
                                                     //      UNTIL NOT (DEL_WANTED_UD(S_S_SHIFR+SHIFT_SHIFR,CURR_PERSON,MONTHZA));
                                                     //      REPEAT
                                                     //      UNTIL NOT (DEL_WANTED_UD(S_S_SHIFR,CURR_PERSON,MONTHZA));
                                                           if abs(SummaSS)  >0.009 then
                                                              AddToPerson(3);
                                                      end;
                                                   if CheckBoxFZ.Checked then
                                                      begin
                                                     //      REPEAT
                                                     //      UNTIL NOT (DEL_WANTED_UD(FOND_Z_SHIFR+SHIFT_SHIFR,CURR_PERSON,MONTHZA));
                                                     //      REPEAT
                                                     //      UNTIL NOT (DEL_WANTED_UD(FOND_Z_SHIFR,CURR_PERSON,MONTHZA));
                                                           if abs(SummaFZ)  >0.009 then
                                                              AddToPerson(4);
                                                      end;        
                                                   if CheckBoxECB.Checked then
                                                      begin
                                                     //      REPEAT
                                                     //      UNTIL NOT (DEL_WANTED_UD(FOND_Z_SHIFR+SHIFT_SHIFR,CURR_PERSON,MONTHZA));
                                                     //      REPEAT
                                                     //      UNTIL NOT (DEL_WANTED_UD(FOND_Z_SHIFR,CURR_PERSON,MONTHZA));
                                                           if abs(SummaFZ)  >0.009 then
                                                              AddToPerson(5);
                                                      end;
                                              end;
                                           FIB.pFIBQuery.Next;
                                     end;
                            EXCEPT
                                   ShowMessage('Ошибка переасчета налогов для '+Curr_Person^.Fio);
                            end;
                            FIB.pFIBTransactionSAL.Commit;

                       end;
                    Curr_Person:=Curr_Person^.Next;
                    Application.ProcessMessages;
               end;
              PutInf;
              EMPTY_ALL_PERSON;
         END;
     LabelTimer.Hide;
     nsrv:=Nsrvt;
     mkflnm;
     GetInf(True);



end;

procedure TFormRecalcPPSZ.BitBtn3Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPodr, FormSelPodr);
    FormSelPodr.ShowModal;

end;

procedure TFormRecalcPPSZ.FormCreate(Sender: TObject);
begin
     NameServList.ClearAllSelected;
     LabelTimer.Hide;
     DateTimePickerFr.Date:=Date;
     DateTimePickerTo.Date:=Date;
end;

procedure TFormRecalcPPSZ.Timer1Timer(Sender: TObject);
var T2:TDateTime;
begin
      T2:=time;
      TimePassed:=T2-TimeStart;
      LabelTimer.Caption:='Старт '+TimeToStr(TimeStart)+' прошло '+TimeToStr(TimePassed);
      Application.ProcessMessages;
end;



end.
