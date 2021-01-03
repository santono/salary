unit UGetCurrSummmaTot;

interface
  uses ScrDef;
  function  GetPochasClockTot(Tabno:integer):real;

implementation
  uses Classes,Dialogs,ScrUtil,SCrIo;
   Function FillAllData(Tabno:integer):real;
     var i : Integer;
         ListPodr : TList;
         Curr_Person : PERSON_PTR;
         NSRV_Osn : Integer;
         nsrvOld  : Integer;
         CurrPersonOsn : PERSON_PTR;
         CurrGUIDS : string;
         RetVal    : Real;
     function GetOsnPerson : PERSON_PTR;
      var Curr_Person : PERSON_PTR;
      begin
           Curr_Person:=HEAD_PERSON;
           while (Curr_Person<>nil) do
            begin
                 if Curr_Person^.Tabno=TABNO then
                 if Curr_Person^.wid_raboty=OSN_WID_RABOTY then
                 if (Curr_Person^.Main=1) or (Curr_Person^.Main=2) or (Curr_Person^.Main=3) then
                    begin
                         Result:=Curr_Person;
                         Exit;
                         Break;
                    end;
                 Curr_Person:=Curr_Person^.NEXT;
            end;
           result:=nil;
      end;

     procedure MakeListPodr;
      var Curr_Sowm:SOWM_PTR;
          Finded:Boolean;
          i,j:Integer;
          Val:PInteger;
      begin
           CurrPersonOsn:=GetOsnPerson;
           if not Assigned(CurrPersonOsn) then
              begin
                   ShowMessage('Не найдено сотр. по осно. мету работы');
                   Exit;
              end;
           i:=count_sowm(CurrPersonOsn);
           j:=0;
           Curr_Sowm:=CurrPersonOsn^.SOWM;
           while (Curr_Sowm<>Nil) do
            begin
                 j:=j+1;
                 if Curr_Sowm^.WHERE<>NSRV   then
                 if Curr_Sowm^.WHERE<>nsrvOld then
                    begin
                         finded:=False;
                         if ListPodr.Count>0 then
                            for i:=0 to ListPodr.Count-1 do
                                if PInteger(ListPodr.Items[i])^=Curr_Sowm.WHERE then
                                   begin
                                        Finded:=True;
                                        Break;
                                   end;
                         if not Finded then
                            begin
                                 New(Val);
                                 Val^:=Curr_Sowm^.Where;
                                 ListPodr.Add(Val);
                            end;
                    end;
                 Curr_Sowm:=Curr_Sowm^.NEXT;
            end;
           i:=j;

      end;
     function GetOsnMestoRaboty:integer;
      var Curr_Person:PERSON_PTR;
      begin
           Curr_Person:=HEAD_PERSON;
           while (Curr_Person<>nil) do
            begin
                 if Curr_Person^.Tabno=TABNO then
                    begin
                         Result:=Curr_Person^.Mesto_Osn_Raboty;
                         Exit;
                         Break;
                    end;
                 Curr_Person:=Curr_Person^.NEXT;
            end;
           result:=0;
      end;
     function GetSummaAddFromPerson(Curr_Person:person_ptr):real;
      var RetVal:Real;
          Curr_Add:ADD_PTR;
      begin
            RetVal:=0;
            Curr_Add:=Curr_Person^.ADD;
            while (Curr_Add<>Nil) do
               begin
                    if Curr_Add^.Shifr=Pochas_Shifr then
                       RetVal:=RetVal+Curr_Add^.Work_Clock;
                    Curr_Add:=Curr_Add.NEXT;
               end;
            GetSummaAddFromPerson:=RetVal;


      end;
     procedure AddFromPodr;
      var Curr_Person:Person_Ptr;
      begin
          Curr_Person:=HEAD_PERSON;
          while (Curr_Person<>Nil) do
           begin
                if Curr_Person^.TABNO=Tabno then
                   begin
                        RetVal:=RetVal+GetSummaAddFromPerson(Curr_Person);
                   end;
                Curr_Person:=Curr_Person^.Next;
           end;
      end;
     begin
         RetVal:=0;
         AddFromPodr;
         if not RECENZENT_PODRAZD(NSRV) then
            begin
                 ListPodr:=TList.Create;
                 NSRV_Osn:=0;
                 CurrPersonOsn:=GetOsnPerson;
                 if Assigned(CurrPersonOsn) then
                    NSRV_Osn:=NSRV
                 else
                    NSRV_Osn:=GetOsnMestoRaboty;
                 nsrvOld:=NSRV;
                 if NSRV_Osn=nsrv then MakeListPodr
                                  else
                    begin
                         select(2);
                         nsrv:=NSRV_Osn;
                         MKFLNM;
                         getinf(true);
                         AddFromPodr;
                         MakeListPodr;
                         EMPTY_ALL_PERSON;
                         SELECT(1);
                         NSRV:=nsrvOld;
                         MKFLNM;
                    end;
                 if ListPodr.Count>0 then
                    for i:=0 to ListPodr.Count-1 do
                        begin
                             nsrv:=PInteger(ListPodr.Items[i])^;
                             MKFLNM;
                             SELECT(2);
                             GetInf(true);
                             AddFromPodr;
                             EMPTY_ALL_PERSON;
                             SELECT(1);
                             nsrv:=nsrvOld;
                             MKFLNM;
                        end;
                 if ListPodr.Count>0 then
                    for i:=0 to ListPodr.Count-1 do
                        Dispose(PInteger(ListPodr.Items[i]));
                 ListPodr.Free;
            end;
         FillAllData:=RetVal;
     end;

  function  GetPochasClockTot(Tabno:integer):real;
     begin
          GetPochasClockTot:=FillAllData(Tabno);
     end;

end.
