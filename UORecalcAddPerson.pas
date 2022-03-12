{$H-}
{$WARNINGS OFF}
{$HINTS OFF}
{$I+}
unit UORecalcAddPerson;

interface
   uses ScrDef;
   procedure RecalcAddPerson(WantedY:Integer;WantedM:Integer;Curr_Person:Person_Ptr);
   procedure OpenLog;
   procedure CloseLog;

implementation
    uses Classes,Dialogs,ScrUtil,ScrIO,UFIBModule,SysUtils,ScrNalog,
         ScrLists,Math,UMatHelpCalc, FIBQuery, DateUtils,
         USQLUnit, variants;
     procedure PutLogString(Mes:string);forward;
     procedure FirstStringForPerson(Curr_Person:Person_Ptr);forward;
     var Dev:Text;
         LogOpened:Boolean;

    type PPersonRecO=^TPersonRecO;
         TPersonRecO=class
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
                      function GetSummaAddFakt(wantedShifr:Integer;WantedY:Integer;WantedM:integer):real;
                     private
                      function Nach_Person_For_Nalog_Exl(ModeNalog:TModeNalog;CURR_PERSON:PERSON_PTR;DEST_MONTH,DEST_YEAR,MONTH_VY:INTEGER):REAL;
                     end;
         TPersonO=class
                       y:Integer;
                       m:Integer;
                       PersonList  : TList;
                       PersonRec   : PERSON;
                       GUIDS       : string;
                       Tabel       : TABEL_TYPE;
                       Oklad       : Real; //Оклад, из которого ведется расчет
                       constructor Create(newY:integer;newM:integer;Curr_Person:Person_Ptr);
                       destructor  Destroy;override;
                       procedure   AddPerson(newY:integer;newM:integer;newPodr:Integer;Curr_Person:PERSON_PTR);
                       procedure   FillDataFromDB;
                       procedure   makeActualTabel;
                       function    calculateOklad:Real;                      private
                       function    getSummaAddFakt(wantedShifr:integer):Real;
                       procedure   calculateNadbawki(curr_person:person_ptr);
                       function    getKalendDay:integer;

                      end;
procedure Del_Current_Adding(Curr_Person:PERSON_PTR;M:integer;Y:integer);
 var curr_cn:cn_ptr;
     wantedShifr:integer;
 begin
      repeat
      until not (DEL_WANTED_ADD_year(OKLAD_SHIFR,Curr_Person,M,Y));
      curr_cn:=curr_person^.cn;
      while curr_cn<>nil do
        begin
             wantedShifr:=curr_cn^.SHIFR;
             if wantedShifr>LIMIT_CN_BASE then
                wantedShifr:=wantedShifr-limit_cn_base
             else
             if wantedShifr>shift_shifr then
                wantedShifr:=wantedShifr-shift_shifr;
             if ShifrList.IsAdd(wantedShifr) then
                repeat
                until not (DEL_WANTED_ADD_YEAR(wantedSHIFR,Curr_Person,M,Y));
             curr_cn:=curr_cn^.Next;
        end;
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


function TPersonRecO.GetSummaAddFakt(wantedShifr:Integer;WantedY:Integer;WantedM:integer):real;
  var retVal:Real;
      curr_person:PERSON_PTR;
      curr_add:ADD_PTR;
      yy:Integer;
  begin
      yy:=WantedY;
      if (yy>1990) then
         yy:=yy-1990;
      retVal:=0;
//      RetVal := Nach_Person_For_Nalog_Exl(ECBNalog,Person,WantedM,WantedY,WantedM);
      Curr_person:=Self.Person;
      Curr_Add:=Curr_Person^.Add;
      while (Curr_Add<>Nil) do
        begin
            if Curr_Add^.Shifr  = wantedShifr then
            if Curr_Add^.period = WantedM then
            if Curr_Add^.YEAR   = yy then
               retVal:=roundTo(retVal+roundTo(curr_add^.SUMMA,-2),-2);
            Curr_Add:=Curr_Add^.NEXT;
        end;

      GetSummaAddFakt:=retVal;
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
  //         IF CompareNalogMode(Curr_Add^.Shifr,ModeNalog) then
              Summa:=Summa+ScrUtil.Sum(Curr_Add^.Summa);
           Curr_Add:=Curr_Add^.NEXT;
      end;


      NACH_PERSON_FOR_NALOG_EXL:=Summa;
 END;




    constructor TPersonO.Create(newY:integer;newM:integer;Curr_Person:PERSON_PTR);
      var I:Integer;
      begin
           inherited Create;
           self.y:=newY;
           Self.m:=newM;
           if not GetGUIDPerson(Curr_Person,GUIDS) then
              GUIDS:='';
           Move(Curr_Person^,PersonRec,SizeOf(Curr_Person^));
           PersonList:=TList.Create;
           Self.Oklad:=curr_person^.OKLAD;
           Self.AddPerson(y,m,NSRV,curr_person);
           FillChar(Self.Tabel,SizeOf(Self.Tabel),0);
           if ((y=CURRYEAR) and (m=NMES)) then
              begin
                   Move(curr_person^.tabel,Self.Tabel,SizeOf(Self.Tabel));
                   Self.Oklad:=curr_person^.OKLAD;
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
          addCount:Integer;
      begin
   //        addcount:=PPersonRecO(Self.PersonList.Items[0])^.AddList.Count;
           PersonItem:=TPersonRecO.Create(newY,newM,newPodr,Curr_Person);
           PersonList.Add(PersonItem);
//           addcount:=PPersonRecO(Self.PersonList.Items[0])^.AddList.Count;
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
        if ((YearVy=Self.Y) and (MonthVy=Self.m)) then
            Move(curr_person^.tabel,Self.Tabel,SizeOf(Self.Tabel));
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
  begin
        if FIB.pFIBQuery.Open then
           FIB.pFIBQuery.Close;
        if FIB.pFIBQuery.Transaction.Active then
           FIB.pFIBQuery.Transaction.Commit;
        FIB.pFIBQuerySecond.Transaction:=FIB.pFIBTransactionRead;
        SQLStmnt:='select * from PR_GET_LIST_PERSON_BY_GUID('+IntToStr(Self.PersonRec.Tabno)+','+IntToStr(Y)+','+IntToStr(M)+','+intToStr(CURRYEAR)+','+IntToStr(NMES)+','''+trim(self.GUIDS)+''')';
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
               if (Self.y=yearVy) and (self.m=monthVy) then
                   Self.Oklad:=c_person^.OKLAD;
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

procedure TPersonO.makeActualTabel;
  procedure makeTabelFor(mode:integer);
   var SQLStmnt:string;
       DateFr,DateTo,dt:TDateTime;
       FirstDataMonthStr,LastDataMonthStr:string;
       m1,y1,d1:integer;
       tabelMark:Byte;
   begin
        firstDataMonthStr:=IntToStr(self.y)+'-'+IntToStr(self.m)+'-01';
        y1:=y;
        m1:=m;
        Inc(m1);
        if m1>12 then
           begin
                m1:=1;
                inc(y1);
           end;
        dt:=EncodeDate(y1,m1,1);
        dt:=IncDay(dt,-1);
        y1:=yearOf(dt);
        m1:=monthOf(dt);
        d1:=dayOf(dt);
        lastDataMonthStr:=IntToStr(y1)+'-'+IntToStr(m1)+'-'+IntToStr(d1);
        if FIB.pFIBQuery.Open then
           FIB.pFIBQuery.Close;
        if FIB.pFIBQuery.Transaction.Active then
           FIB.pFIBQuery.Transaction.Commit;
        FIB.pFIBQuerySecond.Transaction:=FIB.pFIBTransactionRead;
        if mode=1 then //Больничные
           begin
                SQLStmnt:='select F_DATA,L_DATA from boln where tabno='+IntToStr(Self.PersonRec.Tabno)+' and not (F_DATA>'''+LastDataMonthStr+''' or L_DATA<'''+FirstDataMonthStr+''')';
                tabelMark:=ILLNESS;
           end
        else
        if mode=2 then //Командировка
           begin
                SQLStmnt:='select F_DATA,L_DATA from TB_KOMAND where tabno='+IntToStr(Self.PersonRec.Tabno)+' and not (F_DATA>'''+LastDataMonthStr+''' or L_DATA<'''+FirstDataMonthStr+''')';
                tabelMark:=KOMANDIROWKA;
           end
        else
        if mode=3 then //Отпуск
           begin
                SQLStmnt:='select F_DATA,L_DATA from OTPUSKA where tabno='+IntToStr(Self.PersonRec.Tabno)+' and not (F_DATA>'''+LastDataMonthStr+''' or L_DATA<'''+FirstDataMonthStr+''')';
                tabelMark:=TARIFN_OTPUSK;
           end
        else
        if mode=4 then //Отпуск без оплаты
           begin
                SQLStmnt:='select DATEFR,DATETO from TB_OTP_BS where tabno='+IntToStr(Self.PersonRec.Tabno)+' and not (DATEFR>'''+LastDataMonthStr+''' or DATETO<'''+FirstDataMonthStr+''')';
                tabelMark:=OTPUSK_BEZ_OPLATY;
           end;
        FIB.pFIBQuery.SQL.Clear;
        FIB.pFIBQuery.SQL.Add(SQLStmnt);
        FIB.pFIBQuery.Transaction.StartTransaction;
        FIB.pFIBQuery.ExecQuery;
        while not FIB.pFIBQuery.Eof do
          begin
               dateFr          := FIB.pFIBQuery.Fields[0].AsDateTime;
               dateTo          := FIB.pFIBQuery.Fields[1].AsDateTime;
               dt:=DateFr;
               while not (dt>dateTo) do
                 begin
                      if monthOf(dt)=Self.m then
                         Self.Tabel[DayOf(dt)]:=tabelMark;
                      dt:=incDay(dt,1);
                 end;
               FIB.pFIBQuery.Next;
          end;
        FIB.pFIBQuery.Close;
        FIB.pFIBQuery.Transaction.Commit;
        FIB.pFIBQuerySecond.Transaction:=FIB.pFIBQuery.Transaction;

   end;
 begin
      makeTabelFor(1); //Больничные
      makeTabelFor(2); //Командировка
      makeTabelFor(3); //Отпускные
      makeTabelFor(4); //Отпускные без оплаты
 end;

function TPersonO.getSummaAddFakt(wantedShifr:integer):Real;
 var SummaAddVypl : Real;
     i,j : Integer;
     curr_add : ADD_PTR;
     wantedY : Integer;
     personCount:Integer;
     addCount:Integer;
 begin
     wantedY:=Self.y;
     if wantedY>1900 then
        wantedY:=wantedY - 1990;
     SummaAddVypl:=0.00;
     personCount:=Self.PersonList.Count;
     if PersonCount>0 then
        begin
             for i:=0 to PersonCount-1 do
                 begin
                      SummaAddVypl := SummaAddVypl + TPersonRecO(PersonList.Items[i]).GetSummaAddFakt(wantedShifr,Self.y,Self.m);
                 end;
        end;

(*
     if personCount>0 then
        for i:=0 to personCount-1 do
            begin

//                 curr_add:=PPersonRecO(PersonList.Items[i])^.Person^.ADD;
//                 curr_add:=PPersonRecO(PersonList.Items[i])^.AddList.Items[0].ADD;
                 addcount:=PPersonRecO(Self.PersonList.Items[i])^.AddList.Count;
                 while (curr_add<>nil) do
                   begin
                        if curr_add^.SHIFR=wantedshifr then
                        if curr_add^.PERIOD=Self.m then
                        if curr_add^.YEAR=wantedY then
                           summaAddVypl:=summaAddVypl+curr_add^.Summa;

                        curr_add:=curr_add^.NEXT;
                   end;
            end;
*)
        getSummaAddFakt:=RoundTo(summaAddVypl,-2);
 end;
function TPersonO.getKalendDay:integer;
  var
     SQLStmnt:string;
     v:Variant;
     isSixDay:boolean;
     kalendDay:Integer;
  begin
     kalendDay:=0;
     isSixDay:=False;
     isSixDay:=isSixDayMode(@Self.PersonRec);
     if isSixDay then
         SQLStmnt:='select first 1 wdays_6 from tb_days where yearza='+IntToStr(self.y)+' and monthza='+IntToStr(Self.m)
     else
         SQLStmnt:='select first 1 wdays   from tb_days where yearza='+IntToStr(self.y)+' and monthza='+IntToStr(Self.m);
     v:=SQLQueryValue(SQLStmnt);
     if varIsNumeric(v) then
        kalendDay:=v;
     if kalendDay<1 then
        kalendDay:=round(GetWDay(Self.m,@Self.PersonRec));
     getKalendDay:=kalendDay;
  end;
function TPersonO.calculateOklad:Real;
 var w_day,kalendDay:Integer;
     OkladFakt,OkladRas,OkladRazn:Real;
 begin
     kalendDay:=Self.getKalendDay;
     OkladFakt:=getSummaAddFakt(Oklad_shifr);

     w_day:=WORK_DAY_USING_TABEL(1,31,Self.Tabel);
     if kalendDay<1 then
        okladRas:=0
     else
       OkladRas := RoundTo(roundTo(Self.Oklad/kalendDay,-2)*w_day,-2);
     OkladRazn := OkladRas - OkladFakt ;
     calculateOklad := RoundTo(OkladRazn,-2);
//     round(GetWDay(NMES,curr_person))

 end;

procedure TPersonO.calculateNadbawki(curr_person:person_ptr);
 var curr_cn:cn_ptr;
     curr_add:ADD_PTR;
     wantedShifr:Integer;
     summaFakt,summaRas,summaRazn:Real;
     nadbawkaDay:real;
     kalendDay:Integer;
     Proc,summa:Real;
     yy:Integer;
 begin
      yy:=self.y;
      if yy>1990 then
         yy := yy - 1990;
      kalendDay:=Self.getKalendDay;
      nadbawkaDay:=NADBAWKA_DAY_USING_TABEL(1,31,Self.Tabel,@Self.PersonRec);
      curr_cn:=self.PersonRec.CN;
      while (curr_cn<>nil) do
        begin
             wantedShifr:=curr_cn^.SHIFR;
             if wantedShifr<LIMIT_CN_BASE then
             if ShifrList.IsAdd(wantedShifr) then
             if curr_cn^.AUTOMATIC=automatic_mode then
             if curr_cn^.KOD in [1,2,3,4,5,6] then //1-абс сумма ФЗП 2-% окл фзп
                                                   //3-абс сумма ФМП 4-% окл фмп
                                                   //5-абс сумма OTH 6-% окл other
                begin
                      summaFakt:=getSummaAddFakt(curr_cn^.shifr);
                      case curr_cn^.KOD of
                       2,4,6:
                            begin
                                 proc:=curr_cn^.SUMMA;
                                 if (Proc>1.0) then
                                    Proc:=RoundTo(proc/100.00,-2);
                                 summaRas:= RoundTo(RoundTo(RoundTo(Self.Oklad/kalendDay,-2)* nadbawkaDay,-2)*Proc,-2);
                            end
                       else
                            begin
                                 Summa:=curr_cn^.SUMMA;
                                 SummaRas:=roundTo(summa * RoundTo(nadbawkaDay/kalendDay,-2),-1)
                            end;
                      end;
                      summaRazn:=RoundTo((summaRas - summaFakt),-2);
                      if Abs(summaRazn)>0.01 then
                         begin
                              MAKE_ADD(CURR_ADD,CURR_PERSON);
                              CURR_ADD^.SUMMA  := SummaRazn;
                              CURR_ADD^.PERIOD := self.m;
                              CURR_ADD^.YEAR   := YY;
                              CURR_ADD^.SHIFR  := wantedSHIFR;
                              CURR_ADD^.WHO    := 1;
                              case curr_cn^.KOD of
                               1,2:
                                 CURR_ADD^.FZP    := curr_add^.SUMMA;
                               3,4:
                                 CURR_ADD^.FMP    := curr_add^.SUMMA;
                               else
                                 CURR_ADD^.OTHER  := curr_add^.SUMMA;
                              end;
                         end;
                end;
             curr_cn:=curr_cn^.Next;
        end;

 end;


procedure recalcAddPerson(WantedY:Integer;WantedM:Integer;Curr_Person:Person_Ptr);
 var
    RPerson  : TPersonO;
    i,yy: integer;
    Curr_Add : Add_PTR;
    SummaAdd : Real;
 begin
      if curr_person^.oklad<100 then Exit;
      if Storonnee_Podrazd(NSRV) then Exit;
      if DOG_POD_PODRAZD(NSRV) then Exit;
      if NSRV=102 then Exit;
      if NSRV in [105,106] then Exit;
      Del_Current_Adding(Curr_Person,WantedM,WantedY);

      RPerson:=TPersonO.Create(WantedY,WantedM,Curr_Person);
      RPerson.FillDataFromDB;
      RPerson.makeActualTabel;
      i:=RPerson.PersonList.Count;
      SummaAdd:=RPerson.calculateOklad;
      yy:=WantedY;
      if yy>1900 then yy:=yy-1990;
      if Abs(summaAdd)>0.01 then
         begin
              MAKE_ADD(CURR_ADD,CURR_PERSON);
              CURR_ADD^.SUMMA  := SummaAdd;
              CURR_ADD^.PERIOD := WantedM;
              CURR_ADD^.YEAR   := YY;
              CURR_ADD^.SHIFR  := OKLAD_SHIFR;
              CURR_ADD^.WHO    := 1;
              CURR_ADD^.FZP    := curr_add^.SUMMA;
         end;
      RPerson.calculateNadbawki(curr_person);
 end;
procedure OpenLog;
 var Fname:string;
 begin
      if not NeedLogForRecalculateNalogiPerson then Exit;
      FName:=CDOC+'LogRecalc.txt';
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

end.
