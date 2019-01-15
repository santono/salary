{$H-}
{$WARNINGS OFF}
{$HINTS OFF}
{$I+}
unit UORecalcAbon;

interface
   uses ScrDef;
   type TModeCalcPerson=(OnlyThisLine,TotalPersonRecalc,TryAutomatic);
   procedure CreateTestPerson(WantedY:Integer;WantedM:Integer;Curr_Person:Person_Ptr;ModeCalc:TModeCalcPerson=OnlyThisLine);
   procedure OpenLog;
   procedure CloseLog;
   procedure GetResultRecalcPodohPerson(WantedY:Integer;WantedM:Integer;Curr_Person:Person_Ptr;
              var SummaPodAdd:Real;var SummaPodUd:real; var SummaPodRas:real);

implementation
    uses Classes,Dialogs,ScrUtil,ScrIO,UFIBModule,SysUtils,ScrNalog,
         ScrLists,Math;
     procedure PutLogString(Mes:string);forward;
     procedure FirstStringForPerson(Curr_Person:Person_Ptr);forward;
     var Dev:Text;
         LogOpened:Boolean;

    type TPersonRecO=class
                      y         : Integer;
                      m         : Integer;
                      podr      : Integer;
                      AddList   : TList;
                      UdList    : TList;
                      CnList    : TList;
                      SowmList  : TList;
                      PersonRec : PERSON;
                      Person    : PERSON_PTR;
                      constructor Create(newY:Integer ; newM:Integer; newPodr:Integer; Curr_Person:Person_ptr);
                      destructor Destroy; override;

                      function GetSummaAddForECBN(WantedY:Integer;WantedM:integer):real;
                      function GetSummaAddForECB(WantedY:Integer;WantedM:integer):real;
                      function GetSummaAddForECBDP(WantedY:Integer;WantedM:integer):real;
                      function GetSummaAddForECBIll(WantedY:Integer;WantedM:integer):real;
                      function GetSummaAddForPod(WantedY:Integer;WantedM:integer;Podr:integer):real;
                      function GetSummaAddForWS(WantedY:Integer;WantedM:integer;Podr:integer):real;
                      function GetSummaUdECBN(WantedY:Integer;WantedM:integer):real;
                      function GetSummaUdECB(WantedY:Integer;WantedM:integer):real;
                      function GetSummaUdECBDP(WantedY:Integer;WantedM:integer):real;
                      function GetSummaUdECBIll(WantedY:Integer;WantedM:integer):real;
                      function GetSummaUdPod(WantedY:Integer;WantedM:integer;Podr:integer):real;
                      function GetSummaUdWS(WantedY:Integer;WantedM:integer;Podr:integer):real;
                      function GetSummaUdAlim(WantedY:Integer;WantedM:integer):real;
                     private
                      function GetUdEcbNalog(Code:Integer;Curr_Person:Person_Ptr;WantedY:Integer;WantedM:integer):real;
                      function Nach_Person_For_Nalog_Exl(ModeNalog:TModeNalog;CURR_PERSON:PERSON_PTR;DEST_MONTH,DEST_YEAR,MONTH_VY:INTEGER):REAL;
                      function CompareNalogMode(Shifr:integer;ModeNalog:TModeNalog):boolean;
                     end;
         TRecNal = record
                       SummaAddForNalTot  : Real;
                       SummaUdNalTot      : Real;
                       SummaAddForNalSelf : Real;
                       SummaUdNalSelf     : Real;
                       SummaUdNalRas      : Real;
                       SummaUdNalRazn     : Real;
                   end;
         TRecNalECB = record
                        RecECB:TRecNal;
                        ProcECB:Real;
                        LimitECBNorma : Real;
                        LimitECBFact  : Real;
                   end;
         TPersonO=class
                       y:Integer;
                       m:Integer;
                       PersonList:TList;
                       PersonRec:PERSON;
                       ModeCalcOnlyThisLinePerson:boolean;
                       GUIDS:string;
                       RecPod  : TRecNal;
                       RecAlim : TRecNal;
                       RecWS   : TRecNal;
                       RecECB : array[1..4] of TRecNalECB;
                       RecPodSelf  : TRecNal;
                       RecAlimSelf : TRecNal;
                       RecWSSelf   : TRecNal;
                       RecECBSelf : array[1..4] of TRecNalECB;
                       SummaAddForPodTot  : Real;
                       SummaUdPodTot      : Real;
                       SummaAddForPodSelf : Real;
                       SummaUdPodSelf     : Real;
                       SummaAddForECBTot  : Real;
                       SummaUdECBTot      : Real;
                       SummaAddForECBSelf : Real;
                       SummaUdECBSelf     : Real;
                       constructor Create(newY:integer;newM:integer;Curr_Person:Person_Ptr;ModeCalc:TModeCalcPerson=OnlyThisLine);
                       destructor Destroy;override;
                       procedure AddPerson(newY:integer;newM:integer;newPodr:Integer;Curr_Person:PERSON_PTR);
                       procedure FillAllData(Tabno:integer;NeedDeleteCurrentNalogi:Boolean=true);
                       procedure FillDataFromDB;
                       function GetLimitForECB(Y:Integer;M:integer):Real;
                       procedure GetSummyForECBTot;
                       procedure CalculateNalogi;
                       function GetOsnPerson:PERSON_PTR;
                      end;
procedure Del_Current_Nalogi(Curr_Person:PERSON_PTR;M:integer;Y:integer);
 begin
      repeat
      until not (DEL_WANTED_UD_YEAR(PODOH_SHIFR,Curr_Person,M,Y));
      REPEAT
      UNTIL NOT (DEL_WANTED_UD_YEAR(ALIMENTY_SHIFR,CURR_PERSON,m,Y));
      REPEAT
      UNTIL NOT (DEL_WANTED_UD_YEAR(ALIMENTY_SHIFR+SHIFT_SHIFR,CURR_PERSON,m,Y));
      REPEAT
      UNTIL NOT (DEL_WANTED_UD_YEAR(ALIMENTY_M_U_SHIFR,CURR_PERSON,m,Y));
      REPEAT
      UNTIL NOT (DEL_WANTED_UD_YEAR(ALIMENTY_M_U_SHIFR+SHIFT_SHIFR,CURR_PERSON,m,Y));
      repeat
      until not (DEL_WANTED_UD_YEAR(ECBSHIFR,Curr_Person,M,Y));
      REPEAT
      UNTIL NOT (DEL_WANTED_UD_YEAR(PerechPoIspListamShifr,CURR_PERSON,m,Y));
      REPEAT
      UNTIL NOT (DEL_WANTED_UD_YEAR(PerechPoIspListamShifr+Shift_Shifr,CURR_PERSON,m,Y));
      repeat
      until not (DEL_WANTED_UD_YEAR(ECBNSHIFR,Curr_Person,M,Y));
      repeat
      until not (DEL_WANTED_UD_YEAR(ECBDPSHIFR,Curr_Person,M,Y));
      repeat
      until not (DEL_WANTED_UD_YEAR(ECBIllSHIFR,Curr_Person,M,Y));
      repeat
      until not (DEL_WANTED_UD_YEAR(WAR_SBOR_SHIFR,Curr_Person,M,Y));
 end;

    constructor TPersonRecO.Create(newY:integer;newM:Integer; newPodr:Integer; Curr_Person:Person_ptr);
      var Curr_Add,Curr_A    : Add_Ptr;
          Curr_Ud,Curr_U     : Ud_Ptr;
          Curr_Cn,Curr_C     : Cn_Ptr;
          Curr_Sowm,Curr_S   : Sowm_Ptr;
      begin
            inherited Create;
            y    := newY;
            m    := newM;
            podr := newPodr;
            PersonRec:=Curr_Person^;
            NEW(Person);
            Move(Curr_Person^,Person^,SizeOf(Person^));
            Person^.NEXT :=nil;
            Person^.Add  :=nil;
            Person^.Ud   :=nil;
            Person^.Sowm :=nil;
            Person^.Cn   :=nil;
            AddList      := TList.Create;
            UdList       := TList.Create;
            CnList       := TList.Create;
            SowmList     := TList.Create;
            Curr_Add     := Curr_Person^.ADD;
            while (Curr_Add<>Nil)do
             begin
                  New(Curr_A);
                  Move(Curr_Add^,Curr_A^,SizeOf(Curr_A^));
                  AddList.Add(Curr_A);
                  New(Curr_A);
                  Move(Curr_Add^,Curr_A^,SizeOf(Curr_A^));
                  Curr_A^.NEXT:=Person^.Add;
                  Person^.ADD:=Curr_A;
                  Curr_Add:=Curr_Add^.NEXT;
             end;
            Curr_Ud:=Curr_Person^.UD;
            while (Curr_Ud<>Nil)do
             begin
                  New(Curr_U);
                  Move(Curr_Ud^,Curr_U^,SizeOf(Curr_U^));
                  UdList.Add(Curr_U);
                  New(Curr_U);
                  Move(Curr_Ud^,Curr_U^,SizeOf(Curr_U^));
                  Curr_U^.NEXT:=Person^.UD;
                  Person^.UD:=Curr_U;
                  Curr_Ud:=Curr_Ud^.NEXT;
             end;
            Curr_Cn:=Curr_Person^.Cn;
            while (Curr_Cn<>Nil)do
             begin
                  New(Curr_C);
                  Move(Curr_Cn^,Curr_C^,SizeOf(Curr_C^));
                  CnList.Add(Curr_C);
                  New(Curr_C);
                  Move(Curr_Cn^,Curr_C^,SizeOf(Curr_C^));
                  Curr_C^.NEXT:=Person^.Cn;
                  Person^.CN:=Curr_C;
                  Curr_Cn:=Curr_Cn^.NEXT;
             end;
            Curr_Sowm:=Curr_Person^.Sowm;
            while (Curr_Sowm<>Nil)do
             begin
                  New(Curr_S);
                  Move(Curr_Sowm^,Curr_S^,SizeOf(Curr_S^));
                  SowmList.Add(Curr_S);
                  New(Curr_S);
                  Move(Curr_Sowm^,Curr_S^,SizeOf(Curr_S^));
                  Curr_S^.NEXT:=Person^.Sowm;
                  Person^.Sowm:=Curr_S;
                  Curr_Sowm:=Curr_Sowm^.NEXT;
             end;

      end;
    destructor TPersonRecO.Destroy;
      var i:Integer;
      begin
           if AddList.Count>0 then
              for i:=0 to AddList.Count-1 do
                  Dispose(Add_ptr(AddList.Items[i]));
           if UdList.Count>0 then
              for i:=0 to UdList.Count-1 do
                  Dispose(Ud_ptr(UdList.Items[i]));
           if CnList.Count>0 then
              for i:=0 to CnList.Count-1 do
                  Dispose(Cn_ptr(CnList.Items[i]));
           if SowmList.Count>0 then
              for i:=0 to SowmList.Count-1 do
                  Dispose(Sowm_ptr(SowmList.Items[i]));
           AddList.Free;
           UdList.Free;
           CNList.Free;
           SowmList.Free;
           while Person^.Add<>Nil  do DEL_Add(Person^.Add,Person);
           while Person^.Ud<>Nil   do DEL_Ud(Person^.Ud,Person);
           while Person^.Cn<>Nil   do DEL_CN(Person^.Cn,Person);
           while Person^.Sowm<>Nil do DEL_Sowm(Person^.Sowm,Person);
           try
              Dispose(Person);
           except
              on EInvalidPointer do Person:=nil;
           end;
           Person:=nil;
           inherited Destroy;
      end;

    function TPersonRecO.GetSummaAddForECBN(WantedY:Integer;WantedM:integer):real;
      var RetVal  : Real;
          ProcECB : Real;
          WantedECBShifr : Integer;
      begin
           if Self.m=7 then
              retval:=0;
           RetVal := 0;
           if dog_pod_podrazd(podr) or
              isDogPodOnlyNach(Person) then
              begin
                   GetSummaAddForECBN := RetVal;
                   Exit;
              end;
           ProcECB := GetProcECBNalogDirect(PERSON,WantedM,WantedY,
                             WantedECBShifr,Self.Podr);
           if WantedECBShifr=ECBNShifr then
              RetVal := Nach_Person_For_Nalog_Exl(ECBNalog,Person,WantedM,WantedY,WantedM);

           GetSummaAddForECBN := RetVal;
      end;

    function TPersonRecO.GetSummaAddForECB(WantedY:Integer;WantedM:integer):real;
      var RetVal  : Real;
          ProcECB : Real;
          WantedECBShifr : Integer;
      begin
           RetVal := 0;
           if dog_pod_podrazd(podr) or
              isDogPodOnlyNach(Person) then
              begin
                   GetSummaAddForECB := RetVal;
                   Exit;
              end;
           ProcECB := GetProcECBNalogDirect(PERSON,WantedM,WantedY,
                             WantedECBShifr,Self.Podr);
           if WantedECBShifr=ECBShifr then
              RetVal := Nach_Person_For_Nalog_Exl(ECBNalog,Person,WantedM,WantedY,WantedM);

           GetSummaAddForECB := RetVal;
      end;

    function TPersonRecO.GetSummaAddForECBDP(WantedY:Integer;WantedM:integer):real;
      var RetVal  : Real;
      begin
           RetVal := 0;
           if dog_pod_podrazd(podr) or
              isDogPodOnlyNach(Person) then
              RetVal := Nach_Person_For_Nalog_Exl(ECBNalog,Person,WantedM,WantedY,WantedM);
           GetSummaAddForECBDP := RetVal;
      end;

    function TPersonRecO.GetSummaAddForECBIll(WantedY:Integer;WantedM:integer):real;
      var RetVal  : Real;
          ProcECB : Real;
          WantedECBShifr : Integer;
      begin
           RetVal := Nach_Person_For_Nalog_Exl(ECBIllNalog,Person,WantedM,WantedY,WantedM);

           GetSummaAddForECBIll := RetVal;
      end;

    function TPersonRecO.GetSummaAddForPod(WantedY:Integer;WantedM:integer;Podr:integer):real;
      var RetVal  : Real;
      begin
           RetVal := 0;
       //   if not (((Podr=105) or (Podr=106)) and isLNR) then
           if not ((Podr=105) or (Podr=106)) then
                 RetVal := Nach_Person_For_Nalog_Exl(PodohNalog,Person,WantedM,WantedY,WantedM);
           GetSummaAddForPod := RetVal;
      end;
    function TPersonRecO.GetSummaAddForWS(WantedY:Integer;WantedM:integer;Podr:integer):real;
      var RetVal  : Real;
      begin
           RetVal := 0;
           if not ((Podr=105) or (Podr=106)) then
                 RetVal := Nach_Person_For_Nalog_Exl(WSNalog,Person,WantedM,WantedY,WantedM);
           GetSummaAddForWS := RetVal;
      end;


    function TPersonRecO.GetSummaUdECBN(WantedY:Integer;WantedM:integer):real;
       begin
            Result:=GetUdEcbNalog(1,PERSON,WantedY,WantedM);
       end;
    function TPersonRecO.GetSummaUdECB(WantedY:Integer;WantedM:integer):real;
       begin
            Result:=GetUdEcbNalog(2,PERSON,WantedY,WantedM);
       end;
    function TPersonRecO.GetSummaUdECBDP(WantedY:Integer;WantedM:integer):real;
       begin
            Result:=GetUdEcbNalog(3,PERSON,WantedY,WantedM);
       end;
    function TPersonRecO.GetSummaUdECBIll(WantedY:Integer;WantedM:integer):real;
       begin
            Result:=GetUdEcbNalog(4,PERSON,WantedY,WantedM);
       end;
    function TPersonRecO.GetSummaUdPod(WantedY:Integer;WantedM:integer;Podr:integer):real;
     var RetVal  : real;
         Curr_Ud : UD_PTR;
         Curr_Person : PERSON_PTR;
         WantedShifr:Integer;
     begin
          RetVal:=0;
          if ((Podr=105) or (Podr=106)) then
             begin
                  GetSummaUdPod:=0;
                  Exit;
             end;
          Curr_Person:=Self.Person;

          Curr_Ud:=Curr_Person^.Ud;
          WantedShifr:=Podoh_Shifr;
          while (Curr_Ud<>Nil) do
           begin
                if (Curr_Ud^.SHIFR  = WantedShifr) then
                if Curr_Ud^.PERIOD = WantedM      then
                if (Curr_Ud^.Year=WantedY) or
                   (Curr_Ud^.Year+1990=WantedY)   then
                   RetVal:=RetVal+Curr_Ud^.Summa;
                Curr_UD:=Curr_Ud^.NEXT;
           end;
          Result:=RetVal;
     end;
    function TPersonRecO.GetSummaUdWS(WantedY:Integer;WantedM:integer;Podr:integer):real;
     var RetVal  : real;
         Curr_Ud : UD_PTR;
         Curr_Person : PERSON_PTR;
         WantedShifr:Integer;
     begin
          RetVal:=0;
          if ((Podr=105) or (Podr=106)) then
             begin
                  GetSummaUdWS:=0;
                  Exit;
             end;
          Curr_Person:=Self.Person;

          Curr_Ud:=Curr_Person^.Ud;
          WantedShifr:=WAR_SBOR_Shifr;
          while (Curr_Ud<>Nil) do
           begin
                if (Curr_Ud^.SHIFR  = WantedShifr) then
                if Curr_Ud^.PERIOD = WantedM      then
                if (Curr_Ud^.Year=WantedY) or
                   (Curr_Ud^.Year+1990=WantedY)   then
                   RetVal:=RetVal+Curr_Ud^.Summa;
                Curr_UD:=Curr_Ud^.NEXT;
           end;
          Result:=RetVal;
     end;

    function TPersonRecO.GetSummaUdAlim(WantedY:Integer;WantedM:integer):real;
     var RetVal  : real;
         Curr_Ud : UD_PTR;
         Curr_Person : PERSON_PTR;
         WantedShifr:Integer;
     begin
          Curr_Person:=Self.Person;
          RetVal:=0;
          Curr_Ud:=Curr_Person^.Ud;
          WantedShifr:=ALIMENTY_SHIFR;
          while (Curr_Ud<>Nil) do
           begin
                if (Curr_Ud^.SHIFR in [ALIMENTY_SHIFR,PerechPoIspListamShifr,ALIMENTY_M_U_SHIFR]) then
                if Curr_Ud^.PERIOD = WantedM      then
                if (Curr_Ud^.Year=WantedY) or
                   (Curr_Ud^.Year+1990=WantedY)   then
                   RetVal:=RetVal+Curr_Ud^.Summa;
                Curr_UD:=Curr_Ud^.NEXT;
           end;
          Result:=RetVal;
     end;

    function TPersonRecO.GetUdEcbNalog(Code:Integer;Curr_Person:Person_Ptr;WantedY:Integer;WantedM:integer):real;
     var RetVal  : real;
         Curr_Ud : UD_PTR;
         WantedShifr:Integer;
     begin
          RetVal:=0;
          Curr_Ud:=Curr_Person^.Ud;
          case Code of
           2:WantedShifr:=ECBShifr;
           3:WantedShifr:=ECBDpShifr;
           4:WantedShifr:=ECBIllShifr;
           else
             WantedShifr:=ECBNShifr;
          end;
          while (Curr_Ud<>Nil) do
           begin
                if (Curr_Ud^.SHIFR  = WantedShifr)
                   or
                    (
                      ((dog_pod_podrazd(podr)) or (isDogPodOnlyNach(Curr_Person)))
                       and
                      (WantedShifr=ECBDPShifr)
                       and
                      ((Curr_Ud^.Shifr=ECBShifr)
                        or
                       (Curr_Ud^.Shifr=ECBNShifr))
                    )  then
                if Curr_Ud^.PERIOD = WantedM      then
                if (Curr_Ud^.Year=WantedY) or
                   (Curr_Ud^.Year+1990=WantedY)        then
                   RetVal:=RetVal+Curr_Ud^.Summa;
                Curr_UD:=Curr_Ud^.NEXT;
           end;
          Result:=RetVal;
     end;

   function TPersonRecO.Nach_Person_For_Nalog_Exl(ModeNalog:TModeNalog;CURR_PERSON:PERSON_PTR;DEST_MONTH,DEST_YEAR,MONTH_VY:INTEGER):REAL;

    VAR
        I,J,II,N:INTEGER;
        Curr_Add:Add_Ptr;
        Summa:real;
        Found:Boolean;
   FUNCTION IsNotBolnOtpShifr(Shifr:integer;y:integer):boolean;
     var RetVal:boolean;
      begin
          RetVal:=IsOtherPeriodECBShifrForYear(Shifr,y);
           IsNotBolnOtpShifr:=not RetVal;
      end;
    BEGIN
     Summa:=0;
     if ModeNalog=wsNalog then
     if not ((Self.y=DEST_YEAR) and (Self.m=dest_month)) then
        begin
             Nach_Person_For_Nalog_Exl:=Summa;
             Exit;
        end;
     Curr_Add:=Curr_Person^.Add;
 //    if ModeNalog=ecbnalog then
     if ModeNalog=WSNalog then
     if Self.M=8 then
        Curr_Add:=Curr_Person^.Add;

     while (Curr_Add<>Nil) do
      begin
           if Curr_Add^.period=12 then
           if Curr_Add^.Shifr=5 then
              Curr_Add^.period:=12;
           Found:=false;
           IF (Self.M=Month_VY) and (Self.y=DEST_YEAR) then
             IF ((Curr_Add^.PERIOD=DEST_MONTH) and
                 ((Curr_Add^.YEAR=DEST_YEAR)or
                  (Curr_Add^.YEAR+1990=DEST_YEAR))) or
                  IsNotBolnOtpShifr(Curr_Add^.shifr,DEST_YEAR)
                  or (
                       (Self.Y>=2016)
                       and
                       ((Curr_Add^.YEAR+1990)<2016)
                     )
                  or (
                      ModeNalog=WSNalog
                     )
                   then
                  Found:=True;
           if not Found then
           if not ((Self.M=Month_VY) and (Self.y=DEST_YEAR)) then
              if ModeNalog=wsnalog then     // Военный сбор
                 if DEST_MONTH=MONTH_VY then found:=True
                 else
              else
                             // Прочие налоги
             IF ((Curr_Add^.PERIOD=DEST_MONTH) and
                 ((Curr_Add^.YEAR=DEST_YEAR)or
                  (Curr_Add^.YEAR+1990=DEST_YEAR))) and
             //  (IsBolOtpShifr(Curr_Add^.Shifr)) then
                 (IsOtherPeriodECBShifrForYear(Curr_Add^.Shifr,DEST_YEAR)) then
               found:=True;

           //Убрать перерасчет отпусных из повторного налогобложения
           // 10 042017
           if (isLNR) then
           if (ModeNalog=PodohNalog) then
           if (NMES=4) and (CurrentYear=2017) then
           if curr_add^.shifr=169 then
           if (curr_add^.period=12) then
           if (curr_add^.YEAR=(2015-1990)) then
                Found:=False;

           if Found then
           IF CompareNalogMode(Curr_Add^.Shifr,ModeNalog) then
              Summa:=Summa+ScrUtil.Sum(Curr_Add^.Summa);
           Curr_Add:=Curr_Add^.NEXT;
      end;


      NACH_PERSON_FOR_NALOG_EXL:=Summa;
 END;

  function TPersonRecO.CompareNalogMode(Shifr:integer;ModeNalog:TModeNalog):boolean;
    var RetVal:boolean;
    begin
         RetVal := false;
         case ModeNalog of
          PodohNalog  : if ShifrList.IsPodoh(Shifr)  then RetVal:=true;
          AlimNach    : if ShifrList.IsPodoh(Shifr)  then RetVal:=true;
          ECBNalog    : if ShifrList.IsECB(Shifr)    then RetVal:=true;
          ECBIllNalog : if ShifrList.IsECBIll(Shifr) then RetVal:=true;
     //     WSNalog     : if ShifrList.IsWS(Shifr)     then RetVal:=true;
          WSNalog     : RetVal:=true;
         end;
         CompareNalogMode:=RetVal;
    end;


    constructor TPersonO.Create(newY:integer;newM:integer;Curr_Person:PERSON_PTR;ModeCalc:TModeCalcPerson=OnlyThisLine);
      var I:Integer;
      begin
           inherited Create;
           y:=newY;
           m:=newM;
           if not GetGUIDPerson(Curr_Person,GUIDS) then
              GUIDS:='';
           Self.ModeCalcOnlyThisLinePerson:=true;
           if ModeCalc=TryAutomatic then
              begin
                   if m<>NMES then
                      Self.ModeCalcOnlyThisLinePerson:=False
                   else
                      if (Curr_Person^.WID_RABOTY=OSN_WID_RABOTY) and
                         ((Curr_Person^.MAIN=1) or (Curr_Person^.MAIN=3) ) and
                         (Curr_Person^.Mesto_Osn_raboty<>82) then
                         Self.ModeCalcOnlyThisLinePerson:=False;

              end
           else if ModeCalc=OnlyThisLine then
                Self.ModeCalcOnlyThisLinePerson:=True
           else
                Self.ModeCalcOnlyThisLinePerson:=False;
//-----------------------------------------------------------------------
      //     Self.ModeCalcOnlyThisLinePerson:=True;
//-----------------------------------------------------------------------
           Move(Curr_Person^,PersonRec,SizeOf(Curr_Person^));
           PersonList:=TList.Create;
           FillChar(RecPod,SizeOf(RecPod),0);
           FillChar(RecPodSelf,SizeOf(RecPodSelf),0);
           FillChar(RecWS,SizeOf(RecWS),0);
           FillChar(RecWSSelf,SizeOf(RecWSSelf),0);
           FillChar(RecAlim,SizeOf(RecAlim),0);
           FillChar(RecAlimSelf,SizeOf(RecAlimSelf),0);
           FillChar(RecECB,SizeOf(RecECB),0);
           FillChar(RecECBSelf,SizeOf(RecECBSelf),0);
           RecECB[1].ProcECB:=ECBNProc;
           RecECB[2].ProcECB:=ECBProc;
           RecECB[3].ProcECB:=ECBDPProc;
           RecECB[4].ProcECB:=ECBIllProc;
           RecECB[1].LimitECBNorma:=GetLimitForECB(y,M);
           for i:=2 to 4 do
               RecECB[i].LimitECBNorma:=RecECB[1].LimitECBNorma;
           for i:=1 to 4 do
               begin
                    RecECBSelf[i].ProcECB:=RecECB[i].ProcECB;
                    RecECBSelf[i].LimitECBNorma:=RecECB[i].ProcECB;
                    RecECB[i].LimitECBFact:=RecECB[i].LimitECBNorma;
                    RecECBSelf[i].LimitECBFact:=RecECBSelf[i].LimitECBNorma;
               end;

      end;
    destructor TPersonO.Destroy;
      var i:Integer;
      begin
           if PersonList.Count>0 then
              for i:=0 to PersonList.Count-1 do
                  TPersonRecO(PersonList.Items[i]).Free;
           PersonList.Free;
           inherited Destroy;
      end;
   procedure TPersonO.AddPerson(newY:integer;newM:integer;newPodr:integer;Curr_Person:PERSON_PTR);
      var PersonItem:TPersonRecO;
      begin
           PersonItem:=TPersonRecO.Create(newY,newM,newPodr,Curr_Person);
           PersonList.Add(PersonItem);
      end;
   procedure TPersonO.FillAllData(Tabno:integer;NeedDeleteCurrentNalogi:Boolean=true);
     var i : Integer;
         ListPodr : TList;
         Curr_Person : PERSON_PTR;
         NSRV_Osn : Integer;
         nsrvOld  : Integer;
         CurrPersonOsn : PERSON_PTR;
         CurrGUIDS : string;
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
     procedure AddFromPodr;
      var Curr_Person:Person_Ptr;
      begin
          Curr_Person:=HEAD_PERSON;
          while (Curr_Person<>Nil) do
           begin
                if Curr_Person^.TABNO=Tabno then
                   begin
//                        AddPerson(CurrYear,NMES,NSRV,Curr_Person);
                        AddPerson(Y,NMES,NSRV,Curr_Person);
                   end;
                Curr_Person:=Curr_Person^.Next;
           end;
      end;
     begin
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
                         Empty_All_Person;
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
                             Empty_All_Person;
                             SELECT(1);
                             nsrv:=nsrvOld;
                             MKFLNM;
                        end;
                 if ListPodr.Count>0 then
                    for i:=0 to ListPodr.Count-1 do
                        Dispose(PInteger(ListPodr.Items[i]));
                 ListPodr.Free;
            end;
         if NeedDeleteCurrentNalogi then
         if PersonList.Count>0 then
            for i:=0 to PersonList.Count-1 do
                if GetGUIDPerson(TPersonRecO(PersonList.Items[i]).Person,CurrGUIDS) then
                if Trim(Self.GUIDS)=trim(CurrGUIDS) then
                if TPersonRecO(PersonList.Items[i]).Person.AUTOMATIC=AUTOMATIC_MODE then
                   begin
                        Del_Current_Nalogi(TPersonRecO(PersonList.Items[i]).Person,Self.M,Self.y);
                        Break;
                   end;
     end;

procedure TPersonO.FillDataFromDB;
  var SQLStmnt  : string;
      C_Person  : Person_Ptr;
      ShifrIdPerson   : Integer;
      YearVy,MonthVy,WantedPodr  : integer;
  procedure AddTabel(ShifrId:Integer;Curr_Person:Person_Ptr);
   var SQLStmnt   : String;
       DAYNO,CODE : Integer;
   begin
        if FIB.pFIBQuerySecond.Open then
           FIB.pFIBQuerySecond.Close;
        if FIB.pFIBQuerySecond.Transaction.Active then
           FIB.pFIBQuerySecond.Transaction.Commit;
        SQLStmnt:='select * from tabel where shifrid='+IntToStr(ShifrId);
        FIB.pFIBQuerySecond.SQL.Clear;
        FIB.pFIBQuerySecond.SQL.Add(SQLStmnt);
        FIB.pFIBQuerySecond.Transaction.StartTransaction;
        FIB.pFIBQuerySecond.ExecQuery;
        while not FIB.pFIBQuerySecond.Eof do
          begin
               DayNo := FIB.pFIBQuerySecond.FieldByName('DAYNO').AsInteger;
               Code  := FIB.pFIBQuerySecond.FieldByName('CODE').AsInteger;
               if ((DAYNO>0) and (DAYNO<32)) then
                  Curr_Person^.TABEL[DayNo]:=CODE;
               FIB.pFIBQuerySecond.Next;
          end;
        FIB.pFIBQuerySecond.Close;
        FIB.pFIBQuerySecond.Transaction.Commit;


   end;
  procedure AddAdd(ShifrId:Integer;Curr_Person:Person_Ptr);
   var Curr_Add : ADD_PTR;
   begin
        if FIB.pFIBQuerySecond.Open then
           FIB.pFIBQuerySecond.Close;
        if FIB.pFIBQuerySecond.Transaction.Active then
           FIB.pFIBQuerySecond.Transaction.Commit;
        SQLStmnt:='select * from fadd where shifridperson='+IntToStr(ShifrId);
        FIB.pFIBQuerySecond.SQL.Clear;
        FIB.pFIBQuerySecond.SQL.Add(SQLStmnt);
        FIB.pFIBQuerySecond.Transaction.StartTransaction;
        FIB.pFIBQuerySecond.ExecQuery;
        while not FIB.pFIBQuerySecond.Eof do
          begin
               MAKE_ADD(Curr_Add,Curr_Person);
               Curr_Add^.SHIFR   := FIB.pFIBQuerySecond.FieldByName('SHIFRSTA').AsInteger;
               Curr_Add^.PERIOD  := FIB.pFIBQuerySecond.FieldByName('MONTH_ZA').AsInteger;
               Curr_Add^.YEAR    := FIB.pFIBQuerySecond.FieldByName('YEAR_ZA').AsInteger-1990;
               Curr_Add^.SUMMA   := FIB.pFIBQuerySecond.FieldByName('SUMMA').AsFloat;
               Curr_Add^.VYPLACHENO := FIB.pFIBQuerySecond.FieldByName('VYPL').AsInteger;
               FIB.pFIBQuerySecond.Next;
          end;
        FIB.pFIBQuerySecond.Close;
        FIB.pFIBQuerySecond.Transaction.Commit;

   end;
  procedure AddUd(ShifrId:Integer;Curr_Person:Person_Ptr);
   var Curr_Ud : UD_PTR;
   begin
        if FIB.pFIBQuerySecond.Open then
           FIB.pFIBQuerySecond.Close;
        if FIB.pFIBQuerySecond.Transaction.Active then
           FIB.pFIBQuerySecond.Transaction.Commit;
        SQLStmnt:='select * from fud where shifridperson='+IntToStr(ShifrId);
        FIB.pFIBQuerySecond.SQL.Clear;
        FIB.pFIBQuerySecond.SQL.Add(SQLStmnt);
        FIB.pFIBQuerySecond.Transaction.StartTransaction;
        FIB.pFIBQuerySecond.ExecQuery;
        while not FIB.pFIBQuerySecond.Eof do
          begin
               MAKE_UD(Curr_Ud,Curr_Person);
               Curr_Ud^.SHIFR   := FIB.pFIBQuerySecond.FieldByName('SHIFRSTA').AsInteger;
               Curr_Ud^.PERIOD  := FIB.pFIBQuerySecond.FieldByName('MONTH_ZA').AsInteger;
               Curr_Ud^.YEAR    := FIB.pFIBQuerySecond.FieldByName('YEAR_ZA').AsInteger-1990;
               Curr_Ud^.SUMMA   := FIB.pFIBQuerySecond.FieldByName('SUMMA').AsFloat;
               Curr_Ud^.VYPLACHENO := FIB.pFIBQuerySecond.FieldByName('VYPL').AsInteger;
               FIB.pFIBQuerySecond.Next;
          end;
        FIB.pFIBQuerySecond.Close;
        FIB.pFIBQuerySecond.Transaction.Commit;


   end;
  procedure AddCn(ShifrId:Integer;Curr_Person:Person_Ptr);
   var Curr_Cn : CN_PTR ;
       prim    : Integer;
       a,b     : Double ;
   begin
        if FIB.pFIBQuerySecond.Open then
           FIB.pFIBQuerySecond.Close;
        if FIB.pFIBQuerySecond.Transaction.Active then
           FIB.pFIBQuerySecond.Transaction.Commit;
        SQLStmnt:='select * from fcn where shifridperson='+IntToStr(ShifrId);
        FIB.pFIBQuerySecond.SQL.Clear;
        FIB.pFIBQuerySecond.SQL.Add(SQLStmnt);
        FIB.pFIBQuerySecond.Transaction.StartTransaction;
        FIB.pFIBQuerySecond.ExecQuery;
        while not FIB.pFIBQuerySecond.Eof do
          begin
               MAKE_CN(Curr_Cn,Curr_Person);
               Curr_Cn^.SHIFR   := FIB.pFIBQuerySecond.FieldByName('SHIFRSTA').AsInteger;
               Curr_Cn^.KOD     := FIB.pFIBQuerySecond.FieldByName('KOD').AsInteger;
               Curr_Cn^.SUMMA   := FIB.pFIBQuerySecond.FieldByName('SUMMA').AsFloat;
               PRIM    := FIB.pFIBQuerySecond.FieldByName('PRIM').AsInteger;
               if (isLNR and
                   (curr_cn^.shifr=koef_oklad_shifr+LIMIT_CN_BASE)
                   and
                   (PRIM>0)
                   and
                   (Abs(curr_cn^.summa)<0.01)
                   ) then
                     begin
                          curr_cn^.PRIM := 0;
                          a:= prim;
                          b:= a / 100000.00;
                          curr_cn^.summa:=b;
                     end
               else
                   if abs(prim)<32000 then
                      Curr_Cn^.PRIM    := prim;
               Curr_Cn^.PRIM_1  := FIB.pFIBQuerySecond.FieldByName('PRIM_1').AsString;
               Curr_Cn^.DEJA_COUNTED := FIB.pFIBQuerySecond.FieldByName('DEJA_COUNTED').AsInteger;
               FIB.pFIBQuerySecond.Next;
          end;
        FIB.pFIBQuerySecond.Close;
        FIB.pFIBQuerySecond.Transaction.Commit;


   end;
  procedure AddSowm(ShfirId:Integer;Curr_Person:Person_Ptr);
    begin

    end;
  procedure Mult2(Curr_Person:Person_Ptr);
   var Curr_Add:ADD_PTR;
       Curr_Ud:UD_PTR;
   begin
       curr_Add:=curr_Person.ADD;
       while (Curr_Add<>Nil) do
         begin
              Curr_Add.SUMMA:=R10(Curr_Add.SUMMA*2);
              Curr_Add:=Curr_Add.NEXT;
         end;
       curr_Ud:=curr_Person.UD;
       while (Curr_Ud<>Nil) do
         begin
              Curr_Ud.SUMMA:=R10(Curr_Ud.SUMMA*2);
              Curr_Ud:=Curr_Ud.NEXT;
         end;
   end;
  begin
        if FIB.pFIBQuery.Open then
           FIB.pFIBQuery.Close;
        if FIB.pFIBQuery.Transaction.Active then
           FIB.pFIBQuery.Transaction.Commit;
        FIB.pFIBQuerySecond.Transaction:=FIB.pFIBTransactionRead;
        SQLStmnt:='select * from PR_GET_LIST_PERSON_FOR_RECALC('+IntToStr(Self.PersonRec.Tabno)+','+IntToStr(Y)+','+IntToStr(M)+','+IntToStr(NMES)+')';
    //    if not (m=NMES) and (y=CURRYEAR) then
    //       SQLStmnt:=SQLStmnt+' and month_vy='+IntToStr(NMES);
        FIB.pFIBQuery.SQL.Clear;
        FIB.pFIBQuery.SQL.Add(SQLStmnt);
        FIB.pFIBQuery.Transaction.StartTransaction;
        FIB.pFIBQuery.ExecQuery;
        while not FIB.pFIBQuery.Eof do
          begin
               SELECT(2);
               MAKE_PERSON(C_Person);
               C_Person^.TABNO            := Self.PersonRec.TABNO;
               C_Person^.FIO              := FIB.pFIBQuery.FieldByName('FIO').AsString;
               C_Person^.DOLG             := FIB.pFIBQuery.FieldByName('DOLG').AsString;
               C_Person^.OKLAD            := FIB.pFIBQuery.FieldByName('OKLAD').AsFloat;
               C_Person^.Kategorija       := FIB.pFIBQuery.FieldByName('SHIFRKAT').AsInteger;
               C_Person^.Gruppa           := FIB.pFIBQuery.FieldByName('SHIFRGRU').AsInteger;
               C_Person^.Wid_Raboty       := FIB.pFIBQuery.FieldByName('W_R').AsInteger;
               C_Person^.From             := FIB.pFIBQuery.FieldByName('FROMPODR').AsInteger;
               C_Person^.Mesto_Osn_Raboty := FIB.pFIBQuery.FieldByName('M_O_R').AsInteger;
               C_Person^.Main             := FIB.pFIBQuery.FieldByName('MAIN').AsInteger;
               C_Person^.Automatic        := FIB.pFIBQuery.FieldByName('AUTOMATIC').AsInteger;
               ShifrIdPerson := FIB.pFIBQuery.FieldByName('SHIFRID').AsInteger;
               YearVy  := FIB.pFIBQuery.FieldByName('YEARVY').AsInteger;
               MonthVy := FIB.pFIBQuery.FieldByName('MONTHVY').AsInteger;
               WantedPodr := FIB.pFIBQuery.FieldByName('W_PLACE').AsInteger;
               AddTabel(ShifrIdPerson,C_Person);
               AddAdd(ShifrIdPerson,C_Person);
               AddUd(ShifrIdPerson,C_Person);
               AddCn(ShifrIdPerson,C_Person);
               AddSowm(ShifrIdPerson,C_Person);
               if  isLNR then
                IF ((YearVy<2015) or
                   ((YearVy=2015) and (MonthVy<9))
                   ) then
                   MULT2(C_PERSON);

               Self.AddPerson(YearVy,MonthVy,WantedPodr,C_Person);
               while (C_Person^.Add<>nil)  do DEL_ADD(C_Person^.Add,C_Person);
               while (C_Person^.Ud<>nil)   do DEL_UD(C_Person^.Ud,C_Person);
               while (C_Person^.Cn<>nil)   do DEL_CN(C_Person^.Cn,C_Person);
               while (C_Person^.Sowm<>nil) do DEL_Sowm(C_Person^.Sowm,C_Person);
               DEL_PERSON(C_Person);
               SELECT(1);
               FIB.pFIBQuery.Next;
          end;
        FIB.pFIBQuery.Close;
        FIB.pFIBQuery.Transaction.Commit;
        FIB.pFIBQuerySecond.Transaction:=FIB.pFIBQuery.Transaction;


  end;

function TPersonO.GetLimitForECB(Y:Integer;M:integer):Real;
  var SQLStmnt:string;
      LimitSS:Real;
  begin
       if FIB.pFIBQuery.Open then
          FIB.pFIBQuery.Close;
       if FIB.pFIBQuery.Transaction.Active then
          FIB.pFIBQuery.Transaction.Commit;
       FIB.pFIBQuery.SQL.Clear;
       SQLStmnt:='select FIRST 1 LIMITMAX from SSLIMITY WHERE DATEFR<='''+IntToStr(Y)+'-'+IntToStr(M)+'-01'' ORDER BY DATEFR DESC';
       FIB.pFIBQuery.SQL.Add(SQLStmnt);
       FIB.pFIBQuery.Transaction.StartTransaction;
       FIB.pFIBQuery.ExecQuery;
       LimitSS:=FIB.pFIBQuery.Fields[0].AsFloat;
       if FIB.pFIBQuery.Open then
          FIB.pFIBQuery.Close;
       if FIB.pFIBQuery.Transaction.Active then
          FIB.pFIBQuery.Transaction.Commit;

       GetLimitForECB:=LimitSS;
  end;

procedure TPersonO.GetSummyForECBTot;
 var i:Integer;
     A,O:Real;
     CurrGUIDS:string;

 begin
      if PersonList.Count>0 then
         begin
             for i:=0 to PersonList.Count-1 do
                begin
                  a:=0;
                  if TPersonRecO(PersonList.Items[i]).m=7 then
                     o:=TPersonRecO(PersonList.Items[i]).Person^.Oklad;
                  a:= TPersonRecO(PersonList.Items[i]).GetSummaUdECBN(Y,M);
                  if a>0.001 then
                     o:=TPersonRecO(PersonList.Items[i]).Person^.Oklad;
                  RecECB[1].RecECB.SummaAddForNalTot:=RecECB[1].RecECB.SummaAddForNalTot + TPersonRecO(PersonList.Items[i]).GetSummaAddForECBN(Y,M);
                  RecECB[1].RecECB.SummaUdNalTot    :=RecECB[1].RecECB.SummaUdNalTot     + TPersonRecO(PersonList.Items[i]).GetSummaUdECBN(Y,M);
                  RecECB[2].RecECB.SummaAddForNalTot:=RecECB[2].RecECB.SummaAddForNalTot + TPersonRecO(PersonList.Items[i]).GetSummaAddForECB(Y,M);
                  RecECB[2].RecECB.SummaUdNalTot    :=RecECB[2].RecECB.SummaUdNalTot     + TPersonRecO(PersonList.Items[i]).GetSummaUdECB(Y,M);
                  RecECB[3].RecECB.SummaAddForNalTot:=RecECB[3].RecECB.SummaAddForNalTot + TPersonRecO(PersonList.Items[i]).GetSummaAddForECBDP(Y,M);
                  RecECB[3].RecECB.SummaUdNalTot    :=RecECB[3].RecECB.SummaUdNalTot     + TPersonRecO(PersonList.Items[i]).GetSummaUdECBDP(Y,M);
                  RecECB[4].RecECB.SummaAddForNalTot:=RecECB[4].RecECB.SummaAddForNalTot + TPersonRecO(PersonList.Items[i]).GetSummaAddForECBIll(Y,M);
                  RecECB[4].RecECB.SummaUdNalTot    :=RecECB[4].RecECB.SummaUdNalTot     + TPersonRecO(PersonList.Items[i]).GetSummaUdECBIll(Y,M);
                  RecPod.SummaAddForNalTot          :=RecPod.SummaAddForNalTot           + TPersonRecO(PersonList.Items[i]).GetSummaAddForPod(Y,M,TPersonRecO(PersonList.Items[i]).podr);
                  RecPod.SummaUdNalTot              :=RecPod.SummaUdNalTot               + TPersonRecO(PersonList.Items[i]).GetSummaUdPod(Y,M,TPersonRecO(PersonList.Items[i]).podr);
                  RecWS.SummaAddForNalTot           :=RecWS.SummaAddForNalTot            + TPersonRecO(PersonList.Items[i]).GetSummaAddForWS(Y,M,TPersonRecO(PersonList.Items[i]).podr);
                  RecWS.SummaUdNalTot               :=RecWS.SummaUdNalTot                + TPersonRecO(PersonList.Items[i]).GetSummaUdWS(Y,M,TPersonRecO(PersonList.Items[i]).podr);
                  RecAlim.SummaAddForNalTot         :=RecAlim.SummaAddForNalTot          + TPersonRecO(PersonList.Items[i]).GetSummaAddForPod(Y,m,TPersonRecO(PersonList.Items[i]).podr);
                  RecAlim.SummaUdNalTot             :=RecAlim.SummaUdNalTot              + TPersonRecO(PersonList.Items[i]).GetSummaUdAlim(Y,M);
                  if Self.ModeCalcOnlyThisLinePerson then
                  if GetGUIDPerson(TPersonRecO(PersonList.Items[i]).Person,CurrGUIDS) then
                  if Trim(Self.GUIDS)=trim(CurrGUIDS) then
                     begin
                          RecECBSelf[1].RecECB.SummaAddForNalTot:=RecECBSelf[1].RecECB.SummaAddForNalTot + TPersonRecO(PersonList.Items[i]).GetSummaAddForECBN(Y,M);
                          RecECBSelf[1].RecECB.SummaUdNalTot    :=RecECBSelf[1].RecECB.SummaUdNalTot     + TPersonRecO(PersonList.Items[i]).GetSummaUdECBN(Y,M);
                          RecECBSelf[2].RecECB.SummaAddForNalTot:=RecECBSelf[2].RecECB.SummaAddForNalTot + TPersonRecO(PersonList.Items[i]).GetSummaAddForECB(Y,M);
                          RecECBSelf[2].RecECB.SummaUdNalTot    :=RecECBSelf[2].RecECB.SummaUdNalTot     + TPersonRecO(PersonList.Items[i]).GetSummaUdECB(Y,M);
                          RecECBSelf[3].RecECB.SummaAddForNalTot:=RecECBSelf[3].RecECB.SummaAddForNalTot + TPersonRecO(PersonList.Items[i]).GetSummaAddForECBDP(Y,M);
                          RecECBSelf[3].RecECB.SummaUdNalTot    :=RecECBSelf[3].RecECB.SummaUdNalTot     + TPersonRecO(PersonList.Items[i]).GetSummaUdECBDP(Y,M);
                          RecECBSelf[4].RecECB.SummaAddForNalTot:=RecECBSelf[4].RecECB.SummaAddForNalTot + TPersonRecO(PersonList.Items[i]).GetSummaAddForECBIll(Y,M);
                          RecECBSelf[4].RecECB.SummaUdNalTot    :=RecECBSelf[4].RecECB.SummaUdNalTot     + TPersonRecO(PersonList.Items[i]).GetSummaUdECBIll(Y,M);
                          RecPodSelf.SummaAddForNalTot          :=RecPodSelf.SummaAddForNalTot           + TPersonRecO(PersonList.Items[i]).GetSummaAddForPod(Y,M,TPersonRecO(PersonList.Items[i]).Podr);
                          RecPodSelf.SummaUdNalTot              :=RecPodSelf.SummaUdNalTot               + TPersonRecO(PersonList.Items[i]).GetSummaUdPod(Y,M,TPersonRecO(PersonList.Items[i]).Podr);
                          RecWSSelf.SummaAddForNalTot           :=RecWSSelf.SummaAddForNalTot            + TPersonRecO(PersonList.Items[i]).GetSummaAddForWS(Y,M,TPersonRecO(PersonList.Items[i]).Podr);
                          RecWSSelf.SummaUdNalTot               :=RecWSSelf.SummaUdNalTot                + TPersonRecO(PersonList.Items[i]).GetSummaUdWS(Y,M,TPersonRecO(PersonList.Items[i]).Podr);
                          RecAlimSelf.SummaAddForNalTot         :=RecAlimSelf.SummaAddForNalTot          + TPersonRecO(PersonList.Items[i]).GetSummaAddForPod(Y,M,TPersonRecO(PersonList.Items[i]).Podr);
                          RecAlimSelf.SummaUdNalTot             :=RecAlimSelf.SummaUdNalTot              + TPersonRecO(PersonList.Items[i]).GetSummaUdAlim(Y,M);
                     end;
                end;
         end;

 end;

procedure TPersonO.CalculateNalogi;
  var   CurrPerson:PERSON_PTR;
        I : Integer;
        SummaECB : Real;
  procedure SetUpMaxECBs;
   var LimitForECB:Real;
   begin
        LimitForECB:=Self.RecECB[1].LimitECBNorma;
        if Self.RecECB[1].RecECB.SummaAddForNalTot > Self.RecECB[1].LimitECBNorma then
           begin
                Self.RecECB[1].LimitECBFact  := Self.RecECB[1].LimitECBNorma;
                Self.RecECB[2].LimitECBFact  := 0 ;
                Self.RecECB[3].LimitECBFact  := 0 ;
                Self.RecECB[4].LimitECBFact  := 0 ;
           end
        else
        if Self.RecECB[1].RecECB.SummaAddForNalTot+Self.RecECB[2].RecECB.SummaAddForNalTot>Self.RecECB[1].LimitECBNorma then
           begin
                Self.RecECB[1].LimitECBFact := Self.RecECB[1].RecECB.SummaAddForNalTot;
                Self.RecECB[2].LimitECBFact := Self.RecECB[1].LimitECBNorma-Self.RecECB[1].RecECB.SummaAddForNalTot;
                Self.RecECB[3].LimitECBFact  := 0 ;
                Self.RecECB[4].LimitECBFact  := 0 ;
           end
        else
        if Self.RecECB[1].RecECB.SummaAddForNalTot +
           Self.RecECB[2].RecECB.SummaAddForNalTot +
           Self.RecECB[3].RecECB.SummaAddForNalTot > Self.RecECB[1].LimitECBNorma then
           begin
                Self.RecECB[1].LimitECBFact := Self.RecECB[1].RecECB.SummaAddForNalTot;
                Self.RecECB[2].LimitECBFact := Self.RecECB[2].RecECB.SummaAddForNalTot;
                Self.RecECB[3].LimitECBFact := Self.RecECB[1].LimitECBNorma-
                                               (Self.RecECB[1].RecECB.SummaAddForNalTot+
                                                Self.RecECB[2].RecECB.SummaAddForNalTot);
                Self.RecECB[4].LimitECBFact  := 0 ;
           end
        else
        if Self.RecECB[1].RecECB.SummaAddForNalTot +
           Self.RecECB[2].RecECB.SummaAddForNalTot +
           Self.RecECB[3].RecECB.SummaAddForNalTot +
           Self.RecECB[4].RecECB.SummaAddForNalTot > Self.RecECB[1].LimitECBNorma then
              begin
                Self.RecECB[1].LimitECBFact := Self.RecECB[1].RecECB.SummaAddForNalTot;
                Self.RecECB[2].LimitECBFact := Self.RecECB[2].RecECB.SummaAddForNalTot;
                Self.RecECB[3].LimitECBFact := Self.RecECB[3].RecECB.SummaAddForNalTot;
                Self.RecECB[4].LimitECBFact := Self.RecECB[1].LimitECBNorma-
                                               (Self.RecECB[1].RecECB.SummaAddForNalTot+
                                                Self.RecECB[2].RecECB.SummaAddForNalTot+
                                                Self.RecECB[3].RecECB.SummaAddForNalTot);
              end
        else
              begin
                Self.RecECB[1].LimitECBFact := Self.RecECB[1].RecECB.SummaAddForNalTot;
                Self.RecECB[2].LimitECBFact := Self.RecECB[2].RecECB.SummaAddForNalTot;
                Self.RecECB[3].LimitECBFact := Self.RecECB[3].RecECB.SummaAddForNalTot;
                Self.RecECB[4].LimitECBFact := Self.RecECB[4].RecECB.SummaAddForNalTot;
              end;
    end;
  procedure SetUpMaxECBsSelf;
   var LimitForECB:Real;
       I:Integer;
   begin
        Self.RecECBSelf[1].LimitECBFact  := Self.RecECBSelf[1].RecECB.SummaAddForNalTot ;
        Self.RecECBSelf[2].LimitECBFact  := Self.RecECBSelf[2].RecECB.SummaAddForNalTot ;
        Self.RecECBSelf[3].LimitECBFact  := Self.RecECBSelf[3].RecECB.SummaAddForNalTot ;
        Self.RecECBSelf[4].LimitECBFact  := Self.RecECBSelf[4].RecECB.SummaAddForNalTot ;
        LimitForECB:=Self.RecECB[1].LimitECBNorma;
    {1} if (Self.RecECB[1].RecECB.SummaAddForNalTot-
            Self.RecECBSelf[1].RecECB.SummaAddForNalTot)  > Self.RecECB[1].LimitECBNorma then
           begin
                Self.RecECBSelf[1].LimitECBFact  := 0 ;
                Self.RecECBSelf[2].LimitECBFact  := 0 ;
                Self.RecECBSelf[3].LimitECBFact  := 0 ;
                Self.RecECBSelf[4].LimitECBFact  := 0 ;
           end
        else
    {1a}if ((Self.RecECB[1].RecECB.SummaAddForNalTot-
             Self.RecECBSelf[1].RecECB.SummaAddForNalTot) < Self.RecECB[1].LimitECBNorma) and
           (Self.RecECB[1].RecECB.SummaAddForNalTot > Self.RecECB[1].LimitECBNorma) then
           begin
                Self.RecECBSelf[1].LimitECBFact  := Self.RecECB[1].LimitECBNorma-
                                                    (Self.RecECB[1].RecECB.SummaAddForNalTot-
                                                     Self.RecECBSelf[1].RecECB.SummaAddForNalTot);
                Self.RecECBSelf[2].LimitECBFact  := 0 ;
                Self.RecECBSelf[3].LimitECBFact  := 0 ;
                Self.RecECBSelf[4].LimitECBFact  := 0 ;
           end
        else
    {2} if (abs(Self.RecECB[1].RecECB.SummaAddForNalTot)<0.005) and
           (Self.RecECB[2].RecECB.SummaAddForNalTot-
            Self.RecECBSelf[2].RecECB.SummaAddForNalTot>Self.RecECB[1].LimitECBNorma) then
           begin
                Self.RecECBSelf[1].LimitECBFact  := 0 ;
                Self.RecECBSelf[2].LimitECBFact  := 0 ;
                Self.RecECBSelf[3].LimitECBFact  := 0 ;
                Self.RecECBSelf[4].LimitECBFact  := 0 ;
           end
        else
    {2a} if Self.RecECB[1].RecECB.SummaAddForNalTot+
           Self.RecECB[2].RecECB.SummaAddForNalTot-
           Self.RecECBSelf[2].RecECB.SummaAddForNalTot>Self.RecECB[1].LimitECBNorma then
           begin
                Self.RecECBSelf[1].LimitECBFact  := Self.RecECB[1].RecECB.SummaAddForNalTot ;
                Self.RecECBSelf[2].LimitECBFact  := Self.RecECB[2].RecECB.SummaAddForNalTot ;
                Self.RecECBSelf[3].LimitECBFact  := 0 ;
                Self.RecECBSelf[4].LimitECBFact  := 0 ;
           end
        else
    {2b}if ((Self.RecECB[1].RecECB.SummaAddForNalTot+
            Self.RecECB[2].RecECB.SummaAddForNalTot-
            Self.RecECBSelf[2].RecECB.SummaAddForNalTot)<Self.RecECB[1].LimitECBNorma) and
           ((Self.RecECB[1].RecECB.SummaAddForNalTot+
            Self.RecECB[2].RecECB.SummaAddForNalTot)>Self.RecECB[1].LimitECBNorma) then
           begin
                Self.RecECBSelf[1].LimitECBFact  := Self.RecECB[1].RecECB.SummaAddForNalTot;
                Self.RecECBSelf[2].LimitECBFact  := Self.RecECB[1].LimitECBNorma-
                                                    (
                                                     Self.RecECB[1].RecECB.SummaAddForNalTot+
                                                     Self.RecECB[2].RecECB.SummaAddForNalTot-
                                                     Self.RecECBSelf[2].RecECB.SummaAddForNalTot
                                                    )  ;
                Self.RecECBSelf[3].LimitECBFact  := 0 ;
                Self.RecECBSelf[4].LimitECBFact  := 0 ;
           end
        else
    {3} if (Self.RecECB[1].RecECB.SummaAddForNalTot +
            Self.RecECB[2].RecECB.SummaAddForNalTot +
            Self.RecECB[3].RecECB.SummaAddForNalTot -
            Self.RecECBSelf[3].RecECB.SummaAddForNalTot) > Self.RecECB[1].LimitECBNorma then
           begin
                if abs(Self.RecECB[1].RecECB.SummaAddForNalTot)>0.005 then
                   Self.RecECBSelf[1].LimitECBFact := Self.RecECB[1].RecECB.SummaAddForNalTot;
                if abs(Self.RecECB[2].RecECB.SummaAddForNalTot)>0.005 then
                   Self.RecECBSelf[2].LimitECBFact := Self.RecECB[1].LimitECBNorma-Self.RecECB[1].RecECB.SummaAddForNalTot;
                if abs(Self.RecECB[3].RecECB.SummaAddForNalTot)>0.005 then
                   Self.RecECBSelf[3].LimitECBFact := 0;
                if abs(Self.RecECB[4].RecECB.SummaAddForNalTot)>0.005 then
                   Self.RecECBSelf[4].LimitECBFact := 0 ;
           end
        else
    {3a}if ((Self.RecECB[1].RecECB.SummaAddForNalTot +
             Self.RecECB[2].RecECB.SummaAddForNalTot +
             Self.RecECB[3].RecECB.SummaAddForNalTot -
             Self.RecECBSelf[3].RecECB.SummaAddForNalTot) < Self.RecECB[1].LimitECBNorma) and
           ((Self.RecECB[1].RecECB.SummaAddForNalTot +
             Self.RecECB[2].RecECB.SummaAddForNalTot +
             Self.RecECB[3].RecECB.SummaAddForNalTot ) > Self.RecECB[1].LimitECBNorma) then
           begin
                Self.RecECBSelf[1].LimitECBFact := Self.RecECB[1].RecECB.SummaAddForNalTot;
                Self.RecECBSelf[2].LimitECBFact := Self.RecECB[2].RecECB.SummaAddForNalTot;
                Self.RecECBSelf[3].LimitECBFact := Self.RecECB[1].LimitECBNorma -
                                                   (Self.RecECB[1].RecECB.SummaAddForNalTot +
                                                    Self.RecECB[2].RecECB.SummaAddForNalTot +
                                                    Self.RecECB[3].RecECB.SummaAddForNalTot -
                                                    Self.RecECBSelf[3].RecECB.SummaAddForNalTot);
                Self.RecECBSelf[4].LimitECBFact := 0 ;
           end
        else
    {4} if (Self.RecECB[1].RecECB.SummaAddForNalTot +
            Self.RecECB[2].RecECB.SummaAddForNalTot +
            Self.RecECB[3].RecECB.SummaAddForNalTot +
            Self.RecECB[4].RecECB.SummaAddForNalTot -
            Self.RecECBSelf[4].RecECB.SummaAddForNalTot) > Self.RecECB[1].LimitECBNorma then
              begin
                Self.RecECBSelf[1].LimitECBFact := Self.RecECB[1].RecECB.SummaAddForNalTot;
                Self.RecECBSelf[2].LimitECBFact := Self.RecECB[2].RecECB.SummaAddForNalTot;
                Self.RecECBSelf[3].LimitECBFact := Self.RecECB[1].LimitECBNorma -
                                                   (Self.RecECB[1].RecECB.SummaAddForNalTot+
                                                    Self.RecECB[2].RecECB.SummaAddForNalTot);
                Self.RecECBSelf[4].LimitECBFact := 0;
              end
        else
    {4a}if ((Self.RecECB[1].RecECB.SummaAddForNalTot +
             Self.RecECB[2].RecECB.SummaAddForNalTot +
             Self.RecECB[3].RecECB.SummaAddForNalTot +
             Self.RecECB[4].RecECB.SummaAddForNalTot) > Self.RecECB[1].LimitECBNorma) and
           ((Self.RecECB[1].RecECB.SummaAddForNalTot +
             Self.RecECB[2].RecECB.SummaAddForNalTot +
             Self.RecECB[3].RecECB.SummaAddForNalTot +
             Self.RecECB[4].RecECB.SummaAddForNalTot -
             Self.RecECBSelf[4].RecECB.SummaAddForNalTot) < Self.RecECB[1].LimitECBNorma) then
              begin
                Self.RecECBSelf[1].LimitECBFact := Self.RecECB[1].RecECB.SummaAddForNalTot;
                Self.RecECBSelf[2].LimitECBFact := Self.RecECB[2].RecECB.SummaAddForNalTot;
                Self.RecECBSelf[3].LimitECBFact := Self.RecECB[3].RecECB.SummaAddForNalTot;
                Self.RecECBSelf[4].LimitECBFact := Self.RecECB[1].LimitECBNorma -
                                                   (Self.RecECB[1].RecECB.SummaAddForNalTot +
                                                    Self.RecECB[2].RecECB.SummaAddForNalTot +
                                                    Self.RecECB[3].RecECB.SummaAddForNalTot +
                                                    Self.RecECB[4].RecECB.SummaAddForNalTot -
                                                    Self.RecECBSelf[4].RecECB.SummaAddForNalTot);
              end
        else
              begin
                Self.RecECBSelf[1].LimitECBFact := Self.RecECBSelf[1].RecECB.SummaAddForNalTot;
                Self.RecECBSelf[2].LimitECBFact := Self.RecECBSelf[2].RecECB.SummaAddForNalTot;
                Self.RecECBSelf[3].LimitECBFact := Self.RecECBSelf[3].RecECB.SummaAddForNalTot;
                Self.RecECBSelf[4].LimitECBFact := Self.RecECBSelf[4].RecECB.SummaAddForNalTot;
              end;
        for i:=1 to 4 do
            begin
                 if Abs(Self.RecECBSelf[i].RecECB.SummaAddForNalTot)<0.005 then
                    Self.RecECBSelf[i].LimitECBFact:=0;
                 if Abs(Self.RecECBSelf[i].LimitECBFact)>abs(Self.RecECBSelf[i].RecECB.SummaAddForNalTot) then
                    Self.RecECBSelf[i].LimitECBFact:=Self.RecECBSelf[i].RecECB.SummaAddForNalTot;
            end;
    end;

 begin
      SetUpMaxECBs;
      SummaECB:=0;
      for i:=1 to 4 do
          begin
               Self.RecECB[i].RecECB.SummaUdNalRas:=
                   R10(Self.RecECB[i].LimitECBFact*Self.RecECB[i].ProcECB);
               Self.RecECB[i].RecECB.SummaUdNalRazn:=
                   R10(Self.RecECB[i].RecECB.SummaUdNalRas-Self.RecECB[i].RecECB.SummaUdNalTot);
               if i<>3 then
                  SummaECB:=SummaECB + Self.RecECB[i].RecECB.SummaUdNalRas;
          end;

      { Налог с дохода }
      CurrPerson:=Self.GetOsnPerson;
      Self.RecPod.SummaUdNalRas:=PODOH_2004_2011(Self.RecPod.SummaAddForNalTot,SummaECB,0,Self.M,Self.Y,CurrPerson);

      Self.RecPod.SummaUdNalRazn:=r10(Self.RecPod.SummaUdNalRas-Self.RecPod.SummaUdNalTot);
      Self.RecWS.SummaUdNalRas:=getWSSumma(Self.RecWS.SummaAddForNalTot);
      Self.RecWS.SummaUdNalRazn:=r10(Self.RecWS.SummaUdNalRas-Self.RecWS.SummaUdNalTot);

      if Self.ModeCalcOnlyThisLinePerson then
         begin
              SetUpMaxECBsSelf;
              SummaECB:=0;
              for i:=1 to 4 do
                  begin
                       Self.RecECBSelf[i].RecECB.SummaUdNalRas:=
                            R10(Self.RecECBSelf[i].LimitECBFact*Self.RecECBSelf[i].ProcECB);
                       Self.RecECBSelf[i].RecECB.SummaUdNalRazn:=
                            R10(Self.RecECBSelf[i].RecECB.SummaUdNalRas-Self.RecECBSelf[i].RecECB.SummaUdNalTot);
                       if i<>3 then
                          SummaECB:=SummaECB + Self.RecECBSelf[i].RecECB.SummaUdNalRas;
                  end;

             { Налог с дохода }
              CurrPerson:=Self.GetOsnPerson;
              Self.RecPodSelf.SummaUdNalRas:=PODOH_2004_2011(Self.RecPodSelf.SummaAddForNalTot,SummaECB,0,Self.M,Self.Y,CurrPerson);
//              if NSRV=102 then  { Для 102-го взять процент 28 11 2011 }
//                 Self.RecPodSelf.SummaUdNalRas:=R10((Self.RecPodSelf.SummaAddForNalTot-SummaECB)*0.15);

              Self.RecPodSelf.SummaUdNalRazn:=r10(Self.RecPodSelf.SummaUdNalRas-Self.RecPodSelf.SummaUdNalTot);
              Self.RecWSSelf.SummaUdNalRas:=getWSSumma(Self.RecWSSelf.SummaAddForNalTot);
              Self.RecWSSelf.SummaUdNalRazn:=r10(Self.RecWSSelf.SummaUdNalRas-Self.RecWSSelf.SummaUdNalTot);
         end;


 end;

function TPersonO.GetOsnPerson:PERSON_PTR;
  var i : Integer;
      Finded:Boolean;
  begin
       Finded:=false;
       if Self.PersonList.Count<=0 then
          begin
               Result:=Nil;
               Exit;
          end;
       for i:=0 to Self.PersonList.Count-1 do
           if (TPersonRecO(Self.PersonList.Items[i]).y=Self.Y) and
              (TPersonRecO(Self.PersonList.Items[i]).m=Self.m) and
//           if (TPersonRecO(Self.PersonList.Items[i]).y = CurrYear) and
//              (TPersonRecO(Self.PersonList.Items[i]).m = FLOW_MONTH) and
              (IS_OSN_WID_RABOTY(TPersonRecO(Self.PersonList.Items[i]).Person)) then
              begin
                   Finded:=True;
                   Result:=TPersonRecO(Self.PersonList.Items[i]).Person;
                   Exit;
              end;
       for i:=0 to Self.PersonList.Count-1 do
           if (TPersonRecO(Self.PersonList.Items[i]).y=Self.Y) and
              (TPersonRecO(Self.PersonList.Items[i]).m=Self.m) then
              begin
                   Finded:=True;
                   Result:=TPersonRecO(Self.PersonList.Items[i]).Person;
                   Exit;
              end;
       for i:=0 to Self.PersonList.Count-1 do
            begin
                 Finded:=True;
                 Result:=TPersonRecO(Self.PersonList.Items[i]).Person;
                 Exit;
            end;
  end;

function Need102(Curr_Person:Person_Ptr):Boolean;
  var SummaAdd : Real;
      SummaUd  : Real;
      Curr_Add : Add_Ptr;
      Curr_Ud  : Ud_Ptr;
  begin
       Need102:=True;
       if NSRV<>102 then Exit;
       SummaAdd := 0;
       SummaUd  := 0;
       Curr_Add := Curr_Person^.Add;
       while (Curr_Add<>Nil) do
        begin
             SummaAdd:=SummaAdd+Curr_Add^.SUMMA;
             Curr_Add:=Curr_Add^.NEXT;
        end;
       Curr_Ud := Curr_Person^.Ud;
       while (Curr_Ud<>Nil) do
        begin
             SummaUd:=SummaUd+Curr_Ud^.SUMMA;
             Curr_Ud:=Curr_Ud^.NEXT;
        end;
       SummaAdd := R10(SummaAdd);
       SummaUd  := R10(SummaUd);
       if Abs(SummaAdd)>0.01 then
          if abs(Abs(SummaAdd)-abs(SummaUd))<0.01 then
             Need102:=False;
  end;


procedure CreateTestPerson(WantedY:Integer;WantedM:Integer;Curr_Person:Person_Ptr;ModeCalc:TModeCalcPerson=OnlyThisLine);
 var
    RPerson  : TPersonO;
    i,yy,Prim: integer;
    Curr_Ud  : UD_PTR;
    Dol_Code : Integer;
    SummaUdECBN,SummaUdECB,SummaUdECBDP,SummaUdECBIll,SummaUdPod,SummaUdWS:Real;
    SummaPod,SummaWS,SummaECB : Real;
    SummaAddPod       : Real;
    SummaAddWS        : Real;
    Total_Proc,Proc   : Real;
    A_A,Add_Alim,SummaUdAlim : Real;
    A_Shifr : Integer;
    PersonMarked:Boolean;
    SummaAbsAlim : Real;
    TOTAL_ABS_ALIM_SUMMA : Real;
 begin
      if not Need102(Curr_Person) then Exit;
      if not ShifrList.IsPodoh(7) then
         Del_Current_Nalogi(Curr_Person,WantedM,WantedY);

      Del_Current_Nalogi(Curr_Person,WantedM,WantedY);

      RPerson:=TPersonO.Create(WantedY,WantedM,Curr_Person,ModeCalc);
      RPerson.FillAllData(Curr_Person^.Tabno);
      i:=RPerson.PersonList.Count;
//      if (isLNR or
//          (wantedY<2016)) then
          RPerson.FillDataFromDB;

      i:=RPerson.PersonList.Count;
      RPerson.GetSummyForECBTot;
      RPerson.CalculateNalogi;
      yy:=WantedY;
      if yy>1900 then yy:=yy-1990;
      Dol_Code:=GET_DOL_CODE(Curr_Person);
      if RPerson.ModeCalcOnlyThisLinePerson then
         begin
              SummaAddPod   := RPerson.RecPodSelf.SummaAddForNalTot;
              SummaPod      := RPerson.RecPodSelf.SummaUdNalRas;
              SummaUdPod    := RPerson.RecPodSelf.SummaUdNalRazn;
              SummaAddWS    := RPerson.RecWSSelf.SummaAddForNalTot;
              SummaWS       := RPerson.RecWSSelf.SummaUdNalRas;
              SummaUdWS     := RPerson.RecWSSelf.SummaUdNalRazn;
              SummaUdAlim   := RPerson.RecAlimSelf.SummaUdNalTot;
              SummaUdECBN   := RPerson.RecECBSelf[1].RecECB.SummaUdNalRazn;
              SummaUdECB    := RPerson.RecECBSelf[2].RecECB.SummaUdNalRazn;
              SummaUdECBDP  := RPerson.RecECBSelf[3].RecECB.SummaUdNalRazn;
              SummaUdECBIll := RPerson.RecECBSelf[4].RecECB.SummaUdNalRazn;
              SummaECB      := RPerson.RecECBSelf[1].RecECB.SummaUdNalRas +
                               RPerson.RecECBSelf[2].RecECB.SummaUdNalRas +
                               RPerson.RecECBSelf[3].RecECB.SummaUdNalRas +
                               RPerson.RecECBSelf[4].RecECB.SummaUdNalRas;
         end
      else
         begin
              SummaAddPod   := RPerson.RecPod.SummaAddForNalTot;
              SummaPod      := RPerson.RecPod.SummaUdNalRas;
              SummaUdPod    := RPerson.RecPod.SummaUdNalRazn;
              SummaAddWS    := RPerson.RecWS.SummaAddForNalTot;
              SummaWS       := RPerson.RecWS.SummaUdNalRas;
              SummaUdWS     := RPerson.RecWS.SummaUdNalRazn;
              SummaUdAlim   := RPerson.RecAlim.SummaUdNalTot;
              SummaUdECBN   := RPerson.RecECB[1].RecECB.SummaUdNalRazn;
              SummaUdECB    := RPerson.RecECB[2].RecECB.SummaUdNalRazn;
              SummaUdECBDP  := RPerson.RecECB[3].RecECB.SummaUdNalRazn;
              SummaUdECBIll := RPerson.RecECB[4].RecECB.SummaUdNalRazn;
              SummaECB      := RPerson.RecECB[1].RecECB.SummaUdNalRas +
                               RPerson.RecECB[2].RecECB.SummaUdNalRas +
                               RPerson.RecECB[3].RecECB.SummaUdNalRas +
                               RPerson.RecECB[4].RecECB.SummaUdNalRas;
         end;
      if (yy+1990)>2015 then summaECB:=0;

      PersonMarked:=False;
      if abs(SummaUdPod)>0.005 then

      if (
           (not needRoundNalogiCalculation)
           or
            ((needRoundNalogiCalculation)
             and
             (abs(RoundTo(SummaUdPod,wantedRoundNalogiValue))>0.005)
            )
          ) then
         begin
              MAKE_UD(CURR_UD,CURR_PERSON);
              CURR_UD^.SUMMA  := R10(SummaUdPod);
              CURR_UD^.PERIOD := WantedM;
              CURR_UD^.YEAR   := YY;
              CURR_UD^.SHIFR  := PODOH_SHIFR;
              CURR_UD^.WHO    := 1;
              if NeedBlockRecalcedNalogi then
                 CURR_UD^.Vyplacheno:=GET_OUT;
         end;

      if isSVDN then
         begin
              if abs(SummaUdWS)>0.005 then
              if (
                  (not needRoundNalogiCalculation)
                   or
                    ((needRoundNalogiCalculation)
                     and
                    (abs(RoundTo(SummaUdWS,wantedRoundNalogiValue))>0.005)
            )
          ) then
                 begin
                      MAKE_UD(CURR_UD,CURR_PERSON);
                      CURR_UD^.SUMMA  := R10(SummaUdWS);
                      CURR_UD^.PERIOD := WantedM;
                      CURR_UD^.YEAR   := YY;
                      CURR_UD^.SHIFR  := WAR_SBOR_SHIFR;
                      CURR_UD^.WHO    := 1;
                      if NeedBlockRecalcedNalogi then
                         CURR_UD^.Vyplacheno:=GET_OUT;
                 end;

         end;
{
      if (yy>2014-1990)  or
         (
           (yy=2014-1990) and (WantedM>7)
         ) then
      if abs(SummaUdWS)>0.005 then
         begin
              MAKE_UD(CURR_UD,CURR_PERSON);
              CURR_UD^.SUMMA  := R10(SummaUdWS);
              CURR_UD^.PERIOD := WantedM;
              CURR_UD^.YEAR   := YY;
              CURR_UD^.SHIFR  := WAR_SBOR_SHIFR;
              CURR_UD^.WHO    := 1;
              if NeedBlockRecalcedNalogi then
                 CURR_UD^.Vyplacheno:=GET_OUT;
         end;
}
// c 01 01 2016 в Луганске только подоходный налог
// в том числе при перерасчетах за прошлый год - только под налог
// а в Северодонецке при перерасчетах за прошлый год - и ЕСВ - перерасчитывается
//if isSVDN then
// 27 01 2016 gjpdjybkf  Т И и в Севере только подо налог
if false then
if ((YY+1990)<2016) then
   begin
      if abs(SummaUdECBN)>0.005 then
      if (Dol_Code<>1500) and
         (not DOG_POD_PODRAZD(NSRV)) and
         (not isDogPodOnlyNach(Curr_Person)) then
         begin
              MAKE_UD(CURR_UD,CURR_PERSON);
              CURR_UD^.SUMMA  := R10(SummaUdECBN);
              CURR_UD^.PERIOD := WantedM;
              CURR_UD^.YEAR   := YY;
              CURR_UD^.SHIFR  := ECBNSHIFR;
              CURR_UD^.WHO    := 1;
              if NeedBlockRecalcedNalogi then
                 CURR_UD^.Vyplacheno:=GET_OUT;
         end
      else
         begin
              if not PersonMarked then
                 begin
                      FirstStringForPerson(Curr_Person);
                      PersonMarked:=True;
                 end;
              if (Dol_Code=1500) then
                  PutLogString('Попытка записать ЕСВ(н) '+trim(format('%12.2f',[SummaUDECBN]))+' для больничного')
              else
                  PutLogString('Попытка записать ЕСВ(н) '+trim(format('%12.2f',[SummaUDECBN]))+' для договара подряда');
         end;
      if abs(SummaUdECB)>0.005 then
      if (Dol_Code<>1500)
          and
         (not DOG_POD_PODRAZD(NSRV))
         and
         (not isDogPodOnlyNach(Curr_Person))
          then
         begin
              MAKE_UD(CURR_UD,CURR_PERSON);
              CURR_UD^.SUMMA  := R10(SummaUdECB);
              CURR_UD^.PERIOD := WantedM;
              CURR_UD^.YEAR   := YY;
              CURR_UD^.SHIFR  := ECBSHIFR;
              CURR_UD^.WHO    := 1;
              if NeedBlockRecalcedNalogi then
                 CURR_UD^.Vyplacheno:=GET_OUT;
         end
      else
         begin
              if not PersonMarked then
                 begin
                      FirstStringForPerson(Curr_Person);
                      PersonMarked:=True;
                 end;
              if (Dol_Code=1500) then
                  PutLogString('Попытка записать ЕСВ '+trim(format('%12.2f',[SummaUDECB]))+' для больничного')
              else
                  PutLogString('Попытка записать ЕСВ '+trim(format('%12.2f',[SummaUDECB]))+' для договара подряда');
         end;
      if abs(SummaUdECBDP)>0.005 then
      if (Dol_Code<>1500) and
         ((DOG_POD_PODRAZD(NSRV))
           or (isDogPodOnlyNach(Curr_Person))) then
         begin
              MAKE_UD(CURR_UD,CURR_PERSON);
              CURR_UD^.SUMMA  := R10(SummaUdECBDP);
              CURR_UD^.PERIOD := WantedM;
              CURR_UD^.YEAR   := YY;
              CURR_UD^.SHIFR  := ECBDPSHIFR;
              CURR_UD^.WHO    := 1;
              if NeedBlockRecalcedNalogi then
                 CURR_UD^.Vyplacheno:=GET_OUT;
         end
      else
         begin
              if not PersonMarked then
                 begin
                      FirstStringForPerson(Curr_Person);
                      PersonMarked:=True;
                 end;
              if (Dol_Code=1500) then
                  PutLogString('Попытка записать ЕСВ(дп) '+trim(format('%12.2f',[SummaUDECBDP]))+' для больничного')
              else
                  PutLogString('Попытка записать ЕСВ(дп) '+trim(format('%12.2f',[SummaUDECBDP]))+' не в договара подряда');
         end;
      if abs(SummaUdECBIll)>0.005 then
      if (Dol_Code=1500) or
         (ExistWantedAddShifrInPerson(Bol_5_Shifr,Curr_Person,YY,WantedM))   or
         (ExistWantedAddShifrInPerson(BOL_TEK_SHIFR,Curr_Person,YY,WantedM)) or
         (ExistWantedAddShifrInPerson(BOL_PROSHL_SHIFR,Curr_Person,YY,WantedM)) or
         (ExistWantedAddShifrInPerson(DEKRET_SHIFR,Curr_Person,YY,WantedM)) then
         begin
              MAKE_UD(CURR_UD,CURR_PERSON);
              CURR_UD^.SUMMA  := R10(SummaUdECBIll);
              CURR_UD^.PERIOD := WantedM;
              CURR_UD^.YEAR   := YY;
              CURR_UD^.SHIFR  := ECBILLSHIFR;
              CURR_UD^.WHO    := 1;
              if NeedBlockRecalcedNalogi then
                 CURR_UD^.Vyplacheno:=GET_OUT;
         end
      else
         begin
              if not PersonMarked then
                 begin
                      FirstStringForPerson(Curr_Person);
                      PersonMarked:=True;
                 end;
              PutLogString('Попытка записать ЕСВ(блн) '+trim(format('%12.2f',[SummaUDECBILL]))+' не в больничный или отс 5 дн больничного');
         end;
   end;
      TOTAL_PROC:=0;
      I:=1;
      TOTAL_PROC:=0;
      TOTAL_ABS_ALIM_SUMMA:=0;
      WHILE MUST_ALIMENTY(I,PROC,CURR_PERSON,PRIM,A_SHIFR,summaabsalim) DO
       BEGIN
             TOTAL_PROC:=TOTAL_PROC+PROC;
             TOTAL_ABS_ALIM_SUMMA:=TOTAL_ABS_ALIM_SUMMA+summaabsalim;
             PROC:=0;
       END;
      I:=1;
      IF (TOTAL_PROC>0) or (TOTAL_ABS_ALIM_SUMMA>0.005) THEN
         WHILE MUST_ALIMENTY(I,PROC,CURR_PERSON,PRIM,A_SHIFR,summaabsalim) DO
               BEGIN
                    IF ((Abs(PROC)>0.01) AND (Abs(SummaAbsAlim)<0.005)) THEN
                        BEGIN
                             A_A:=(SummaAddPod-
                                   SummaPod-SummaECB-
                                   PROF(CURR_PERSON,SummaAddPod,WantedM)
                                   )*PROC;
                             ADD_ALIM:=A_A-(SummaUdAlim*PROC/TOTAL_PROC);
                        END
                    else
                    IF ((Abs(PROC)<0.005) AND (Abs(SummaAbsAlim)>2)) THEN
                        BEGIN
                             A_A:=SummaAbsAlim;
                             ADD_ALIM:=A_A-SummaUdAlim;
                        END;

                    IF (ABS(ADD_ALIM)>0.099) THEN
                      BEGIN
                           MAKE_UD(CURR_UD,CURR_PERSON);
                           CURR_UD^.SUMMA  := R10(ADD_ALIM);
                           CURR_UD^.PERIOD := WantedM;
                           CURR_UD^.YEAR   := YY;
                           CURR_UD^.SHIFR  := A_SHIFR;
                           CURR_UD^.WHO    := PRIM;
                        //   MAKE_POCHTOW_SBOR(CURR_PERSON,CURR_UD,A_A);
                           MAKE_POCHTOW_SBOR(CURR_PERSON,CURR_UD,ADD_ALIM);
                          if NeedBlockRecalcedNalogi then
                             CURR_UD^.Vyplacheno:=GET_OUT;
                     END;
               END;

      RPerson.Free;
 end;
procedure OpenLog;
 var Fname:string;
 begin
      if not NeedLogForRecalculateNalogiPerson then Exit;
      FName:=CDOC+'LogECB.txt';
      AssignFile(Dev,FName);
      Rewrite(Dev);
      LogOpened:=True;
 end;
procedure CloseLog;
 begin
      if not NeedLogForRecalculateNalogiPerson then Exit;
      if not LogOpened then Exit;
      CloseFile(Dev);
 end;
procedure PutLogString(Mes:string);
 begin
      if not NeedLogForRecalculateNalogiPerson then Exit;
      Writeln(Dev,Mes);
 end;
procedure FirstStringForPerson(Curr_Person:Person_Ptr);
 var S:string;
 begin
      if not NeedLogForRecalculateNalogiPerson then Exit;
      S:='*****'+IntToStr(Curr_Person^.Tabno);
      S:=S+' '+trim(Curr_Person^.FIO);
      S:=S+' '+trim(Curr_Person^.Dolg)+'*****';
      Writeln(Dev,S);
 end;
procedure GetResultRecalcPodohPerson(WantedY:Integer;WantedM:Integer;Curr_Person:Person_Ptr;
              var SummaPodAdd:Real;var SummaPodUd:real; var SummaPodRas:real);
 var
    RPerson  : TPersonO;
    i,yy,Prim: integer;
    Curr_Ud  : UD_PTR;
    Dol_Code : Integer;
    SummaUdECBN,SummaUdECB,SummaUdECBDP,SummaUdECBIll,SummaUdPod:Real;
    SummaPod,SummaECB : Real;
    SummaAddPod       : Real;
    A_Shifr : Integer;
    RMode:TModeCalcPerson;

 begin
      SummaPodAdd := 0;
      SummaPodUd  := 0;
      SummaPodRas := 0;

      RMode:=TotalPersonRecalc;
      RPerson:=TPersonO.Create(WantedY,WantedM,Curr_Person,RMode);
      RPerson.FillAllData(Curr_Person^.Tabno,false);
      i:=RPerson.PersonList.Count;
      RPerson.FillDataFromDB;
      i:=RPerson.PersonList.Count;
      RPerson.GetSummyForECBTot;
      RPerson.CalculateNalogi;
      yy:=WantedY;
      if yy>1900 then yy:=yy-1990;
      Dol_Code:=GET_DOL_CODE(Curr_Person);
      SummaAddPod   := RPerson.RecPod.SummaAddForNalTot;
      SummaPod      := RPerson.RecPod.SummaUdNalRas;
      SummaUdPod    := RPerson.RecPod.SummaUdNalRazn;
   //   SummaUdAlim   := RPerson.RecAlim.SummaUdNalTot;
      SummaUdECBN   := RPerson.RecECB[1].RecECB.SummaUdNalRazn;
      SummaUdECB    := RPerson.RecECB[2].RecECB.SummaUdNalRazn;
      SummaUdECBDP  := RPerson.RecECB[3].RecECB.SummaUdNalRazn;
      SummaUdECBIll := RPerson.RecECB[4].RecECB.SummaUdNalRazn;
      SummaECB      := RPerson.RecECB[1].RecECB.SummaUdNalRas +
                       RPerson.RecECB[2].RecECB.SummaUdNalRas +
                       RPerson.RecECB[3].RecECB.SummaUdNalRas +
                       RPerson.RecECB[4].RecECB.SummaUdNalRas;
      SummaPodAdd := SummaAddPod;
      SummaPodUd  := RPerson.RecPod.SummaUdNalTot;
      SummaPodRas := SummaPod;
      RPerson.Free;

 end;

end.
