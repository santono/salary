unit UFormRecalcPECB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Gauges, ExtCtrls, ComCtrls;

type
  TFormRecalcPECB = class(TForm)
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
    CheckBoxPodoh: TCheckBox;
    CheckBoxECB: TCheckBox;
    CheckBoxCalc: TCheckBox;
    CheckBoxMov: TCheckBox;
    cbIndex: TCheckBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    TimeStart  : TDateTime;
    TimePassed : TDateTime;
    WantedYear : Integer;
    NeedCalc   : boolean;
    NeedMov    : boolean;
  public
    { Public declarations }
  end;

var
  FormRecalcPECB: TFormRecalcPECB;

implementation
 uses UFibModule,ScrDef,ScrUtil, uFormWait, ScrIo, UformSelPod, ScrLists,DateUtils;

{$R *.dfm}

procedure TFormRecalcPECB.BitBtn2Click(Sender: TObject);
 const  RecalcId=111;

var NSRVT,NMES_T,I,J:Integer;
    Curr_Person:Person_Ptr;
    S:String;
    MonthZa:Integer;
    SummaPod,SummaECB,SummaECBN,SummaECBDP,SummaECBILL:Real;
    WantedYear:integer;
    DateFr,DateTo:TDateTime;
    Y,M,D:word;
    SummaU:real;
    WantedMonth:integer;
    MovedPod,MovedECBN,MovedECB,MOvedECBDP,MOvedECBIll:integer;
    ShifrId:integer;
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
                                           (CheckBoxECB.Checked and ((Curr_Ud.Shifr=ECBShifr) or
                                                                    (Curr_Ud.Shifr=ECBNShifr) or
                                                                    (Curr_Ud.Shifr=ECBIllShifr) or
                                                                    (Curr_Ud.Shifr=ECBDPShifr))) then
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
    procedure MarkMoved(Mode:integer);
     var SQLStmnt:string;
         S:string;
     begin
          case Mode of
            2: S:='MovedECBN';
            3: S:='MovedECB';
            4: S:='MovedECBDP';
            5: S:='MovedECBILL';
            else
               S:='MovedPOD';
          end;
          SQLStmnt:='update tb_recalc_podoh set '+S+'=1 where shifrid='+IntToStr(ShifrId);
          if FIB.pFIBQuery.Open then
             FIB.pFIBQuery.Close;
          FIB.pFIBQuery.SQL.Clear;
          FIB.pFIBQuery.SQL.Add(SQLStmnt);
          try
             FIB.pFIBQuery.ExecQuery;
          except
             ShowMessage('Ошибка отметки о переносе');
          end;

     end;
    procedure AddToPerson(Mode:Integer);
     var Curr_Ud:Ud_Ptr;
         ShifrSta:Integer;
         Summa:Real;
         Changed : boolean;
     begin
         if Mode=2 then
            begin
                 ShifrSta := ECBNShifr;
                 Summa    := SummaECBN;
            end
                   else
         if Mode=3 then
            begin
                ShifrSta := ECBShifr;
                Summa    := SummaECB;
            end
                   else
         if Mode=4 then
            begin
                ShifrSta := ECBDPSHIFR;
                Summa    := SummaECBDP;
            end
                   else
         if Mode=5 then
            begin
                ShifrSta := ECBIllSHIFR;
                Summa    := SummaECBIll;
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
                         Curr_Ud^.Period   := WantedMonth;
                         Curr_Ud^.Year     := WantedYear-1990;
                         Curr_Ud^.Summa    := Summa;
                         Curr_Ud^.Who      := RecalcId;
                         Curr_Ud^.Vyplacheno:=get_out;
                   end;
                 MarkMoved(Mode);
            END;
     end;


begin
     if NameServList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;
     if not (CheckBoxPodoh.Checked or
             CheckBoxECB.Checked) then
        begin
              ShowMessage('Не указан налог для перерасчета');
              Exit;
        end;
     DateFr:=DateTimePickerFr.Date;
     DateFr:=ReCodeDay(DateFR,1);
     if YearOf(DateFr)<CurrYear-2 then
        Begin
             ShowMessage('Неверно указана дата');
             Exit;
        end;
     if YearOf(DateFr)>CurrYear then
        Begin
             ShowMessage('Неверно указана дата');
             Exit;
        end;
     WantedYear  := YearOf(DateFr);
     WantedMonth := MonthOf(DateFr);
     NeedCalc   := false ;
     NeedMov    := false ;
     if CheckBoxCalc.Checked then NeedCalc := true;
     if CheckBoxMov.Checked  then NeedMov  := true;
     if Not YesNo('Данные за текущие месяц перенесены в СУБД ?') then Exit;
     if NeedCalc then
        begin
             WantedYear:=YearOf(DateFr);
             WantedMonth:=MOnthOf(DateFr);
             S:=' select retval from PR_RECALC_ALL_PEOPLE('+IntToStr(WantedYear)+','+IntToStr(WantedMonth)+','+IntToStr(CurrYear)+','+IntToStr(NMES)+')';
             FIB.pFIBQuery.SQL.Clear;
             FIB.pFIBQuery.SQL.Add(S);
             FIB.pFIBQuery.Transaction.StartTransaction;
             try
                FormWait.Show;
                Application.ProcessMessages;
                FIB.pFIBQuery.ExecQuery;
                FormWait.Hide;
             except
             end;
             FIB.pFIBQuery.Transaction.Commit;
        end;
     if NeedMov then
        begin
             TimeStart   := Time;
             LabelTimer.Show;
             GaugePodr.MinValue   := 0;
             GaugePodr.MaxValue   := Count_Serv;
             GaugePodr.Progress   :=  1;
             GaugePerson.MinValue :=  0;
             GaugePerson.MaxValue := 12;
             GaugePerson.Progress :=  1;
             FIB.pFIBTransactionSAL.StartTransaction;

             NSRVT := NSRV;
             WHILE HEAD_PERSON<>NIL DO DEL_PERSON(HEAD_PERSON);
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
                             if cbIndex.Checked then
                             if getSummaAddForPersonW(Curr_Person,INDEX_SHIFR,WantedMonth)<0.01 then
                                begin
                                      Curr_Person:=Curr_Person^.NEXT;
                                      Continue;
                                end;
                             GaugePerson.Progress:=J;
                             LabelPerson.Caption:=IntToStr(Curr_Person^.Tabno)+' '+
                                         AllTrim(Curr_Person^.FIO)   +' '+
                                         AllTrim(Curr_Person^.Dolg);
                             LabelPerson.ReFresh;
                             LabelPerson.RePaint;
                             if (Curr_Person^.AUTOMATIC=MANUAL_MODE) or IS_ALL_BLOCKED(CURR_PERSON) then
                                begin
                                     Curr_Person:=Curr_Person^.NEXT;
                                     continue;
                                end;
  //                           if Curr_Person^.Wid_Raboty=Osn_Wid_Raboty then
                                begin
                                      if Curr_Person^.Tabno=277 then
                                         Curr_Person^.Tabno:=277;
                                      FIB.pFIBTransactionSAL.StartTransaction;
                                      S:='select SUMMAPODRAS-SUMMAPODUD,SUMMAECBNRAS-SUMMAECBNUD,SUMMAECBRAS-SUMMAECBUD,SUMMAECBDPRAS-SUMMAECBDPUD,SUMMAECBIllRAS-SUMMAECBIllUD,';
                                      S:=S+'MovedPod,MovedECBN,MovedECB,MovedECBDP,MovedECBIll,ShifrID';
                                      S:=S+' from tb_Recalc_Podoh where tabno='+IntToStr(Curr_Person^.Tabno)+' and yearza='+IntToStr(WantedYear)+' and monthza='+IntToStr(WantedMonth);
                                      FIB.pFIBQuery.SQL.Clear;
                                      FIB.pFIBQuery.SQL.Add(S);
                                      try
                                         FormWait.Show;
                                         Application.ProcessMessages;
                                         FIB.pFIBQuery.ExecQuery;
                                         FormWait.Hide;
                                         SummaPod    := FIB.pFIBQuery.Fields[0].AsFloat;
                                         SummaECBN   := FIB.pFIBQuery.Fields[1].AsFloat;
                                         SummaECB    := FIB.pFIBQuery.Fields[2].AsFloat;
                                         SummaECBDP  := FIB.pFIBQuery.Fields[3].AsFloat;
                                         SummaECBIll := FIB.pFIBQuery.Fields[4].AsFloat;
                                         MovedPOD    := FIB.pFIBQuery.Fields[5].AsInteger;
                                         MovedECBN   := FIB.pFIBQuery.Fields[6].AsInteger;
                                         MovedECB    := FIB.pFIBQuery.Fields[7].AsInteger;
                                         MovedECBDP  := FIB.pFIBQuery.Fields[8].AsInteger;
                                         MovedECBIll := FIB.pFIBQuery.Fields[9].AsInteger;
                                         ShifrId     := FIB.pFIBQuery.Fields[10].AsInteger;
                                         if MovedPOD>0    then SummaPod    := 0;
                                         if MovedECBN>0   then SummaECBN   := 0;
                                         if MovedECB>0    then SummaECB    := 0;
                                         if MovedECBDP>0  then SummaECBDP  := 0;
                                         if MovedECBIll>0 then SummaECBIll := 0;
                                         if CheckBoxPodoh.Checked then
                                            begin
                                                 if Curr_Person^.Wid_Raboty=Osn_Wid_Raboty then
                                                 if abs(SummaPod) >0.009 then
                                                    AddToPerson(1);
                                            end;
                                         if CheckBoxECB.Checked   then
                                            begin
                                                 if Dog_Pod_Podrazd(NSRV) then
                                                    begin
                                                         if abs(SummaECBDP) >0.009 then
                                                           AddToPerson(4);
                                                    end
                                                 else
                                                 if IsSciPed(Curr_Person) then
                                                    begin
                                                         if abs(SummaECBN) >0.009 then
                                                            AddToPerson(2);
                                                    end
                                                 else
                                                    begin
                                                         if abs(SummaECB) >0.009 then
                                                            AddToPerson(3);
                                                    end
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
                      while Head_Person<>Nil do Del_Person(Head_Person);
                 END; { Конец цикла по подразд }

             LabelTimer.Hide;
             nsrv:=Nsrvt;
             mkflnm;
             GetInf(True);
        end; { NeedMov }


end;

procedure TFormRecalcPECB.BitBtn3Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPodr, FormSelPodr);
    FormSelPodr.ShowModal;

end;

procedure TFormRecalcPECB.FormCreate(Sender: TObject);
begin
     NameServList.ClearAllSelected;
     LabelTimer.Hide;
     DateTimePickerFr.Date:=Date;
     NeedCalc   := false ;
     NeedMov    := false ;
     CheckBoxCalc.Checked := false;
     CheckBoxMov.Checked  := false;
     cbIndex.Checked := false;

end;

procedure TFormRecalcPECB.Timer1Timer(Sender: TObject);
var T2:TDateTime;
begin
      T2:=time;
      TimePassed:=T2-TimeStart;
      LabelTimer.Caption:='Старт '+TimeToStr(TimeStart)+' прошло '+TimeToStr(TimePassed);

      Application.ProcessMessages;
end;



end.
