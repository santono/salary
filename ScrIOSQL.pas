unit SCRIOSQL;
interface
   procedure getInfSqlArc(WantedMonth:Integer;WantedYear:integer);
   procedure getInfSqlArcForTabno(WantedMonth:Integer;WantedYear:integer;wantedTabno:integer);
   procedure getInfSqlCurr(WantedMonth:Integer;WantedYear:integer);
   procedure putInfSqlCurr;
   function getCountPersonInSqlCurr(WantedMonth:Integer;WantedYear:integer):integer;
   
implementation
   uses uFIBModule,ScrDef,SySUtils,
        pFIBQuery,FIBQuery,pFIBDataBase,pFIBProps,ScrUtil,
        UFormShowPB,Forms,pFIBCacheQueries,UCDSFactory;
   type tDataBaseMode=(SalMode,SalarcMode);
   procedure getInfSql(WantedMonth:Integer;WantedYear:integer;DatabaseMode:tDatabaseMode;CurrentTableNames:Boolean=false);forward;
   procedure getInfSqlForTabno(WantedMonth:Integer;WantedYear:integer;DatabaseMode:tDatabaseMode;wantedTabno:Integer;CurrentTableNames:Boolean=false);forward;
   function getCountPersonInSql(WantedMonth:Integer;WantedYear:integer;DatabaseMode:tDatabaseMode;CurrentTableNames:Boolean=false):integer;forward;
   procedure putInfSqlCurr;
     var S,S1:string;
     begin
          IF NMES<>FLOW_MONTH THEN
             begin
{                 error('Изменения можно вносить только за текущий месяц');}
                  exit;
             end;

          IF WORK_YEAR_VAL<>CURRYEAR THEN
             BEGIN
                  Exit;
             END;
          s:=FIB.pFIBQuery.Database.Name;
          TestCDSPodr;
          s1:=FIB.pFIBQuery.Database.Name;
     end;

   procedure getInfSqlArc(WantedMonth:Integer;WantedYear:integer);
     begin
          getInfSql(WantedMonth,WantedYear,SalarcMode);
     end;
   procedure getInfSqlArcForTabno(WantedMonth:Integer;WantedYear:integer;wantedTabno:integer);
     begin
          getInfSqlForTabno(WantedMonth,WantedYear,SalarcMode,wantedTabno);
     end;
   function getCountPersonInSqlCurr(WantedMonth:Integer;WantedYear:integer):integer;
     begin
          getCountPersonInSqlCurr:=getCountPersonInSql(WantedMonth,WantedYear,SalMode,true);
     end;
   procedure getInfSqlCurr(WantedMonth:Integer;WantedYear:integer);
     var S1,S:String;
     begin
          getInfSql(WantedMonth,WantedYear,SalMode,true);
     end;
   function getCountPersonInSql(WantedMonth:Integer;WantedYear:integer;DatabaseMode:tDatabaseMode;CurrentTableNames:Boolean=false):integer;
    var SQLStmntPerson  : string;
        TablePerson     : string;
        tCount          : Integer;
    begin
         if ((CurrentTableNames) and (DatabaseMode=SalMode)) then
            TablePerson := 'TB_C_PERSON'
         else
            TablePerson := 'PERSON';
         SQLStmntPerson:='select count(*) from '+TablePerson+' where w_place='+IntToStr(NSRV)+' and yearvy='+IntToStr(WantedYear)+' and monthvy='+IntToStr(WantedMonth);
         if DatabaseMode=SalarcMode then
            tCount:=FIB.pFIBDatabaseArc.QueryValue(SQLStmntPerson,0)
         else
            tCount:=FIB.pFIBDatabaseSal.QueryValue(SQLStmntPerson,0);
         getCountPersonInSql:=tCount;
    end;
   procedure getInfSql(WantedMonth:Integer;WantedYear:integer;DatabaseMode:tDatabaseMode;CurrentTableNames:Boolean=false);
    var SQLStmntPerson  : string;
        SQLStmntAdd     : string;
        SQLStmntUd      : string;
        SQLStmntCn      : string;
        SQLStmntSowm    : string;
        SQLStmntTabel   : string;
        TablePerson     : string;
        TableCN         : string;
        TableAdd        : string;
        TableUd         : string;
        TableTabel      : string;
        pFIBQuery       : TpFIBQuery;
        pFIBQ           : TpFIBQuery;
    //    pFIBQAdd        : TpFIBQuery;
        pFIBQAdd        : TFIBQuery;
        pFIBQUd         : TFIBQuery;
        pFIBQCn         : TFIBQuery;
        pFIBQSowm       : TFIBQuery;
        pFIBQTabel      : TFIBQuery;
        pFIBTransaction : TpFIBTransaction;
        cnt,I           : Integer;
        Curr_Person     : PERSON_PTR;
        ShifrIdPerson   : Integer;
        code,dayno      : Integer;
        Curr_Add        : ADD_PTR;
        Curr_Ud         : UD_PTR;
        Curr_Cn         : CN_PTR;
        Curr_Sowm       : SOWM_PTR;
        tCount          : Integer;
    function FindPersonById(ShifrId:LongWord):Person_Ptr;
      var C_P:PERSON_PTR;
          finded:Boolean;
      begin
           FindPersonById:=Nil;
           finded:=false;
           C_P:=HEAD_Person;
           while (C_P<>Nil) do
            begin
                 if C_P.id=shifrid then
                    begin
                         finded:=True;
                         FindPersonById:=C_P;
                         break;
                    end;
                 c_p:=C_P.NEXT;
            end;

      end;
    begin
         if ((CurrentTableNames) and (DatabaseMode=SalMode)) then
            begin
                 TablePerson := 'TB_C_PERSON';
                 TableCN     := 'TB_C_FCN';
                 TableAdd    := 'TB_C_FADD';
                 TableUd     := 'TB_C_FUD';
                 TableTabel  := 'TB_C_TABEL';

            end
         else
            begin
                 TablePerson := 'PERSON';
                 TableCN     := 'FCN';
                 TableAdd    := 'FADD';
                 TableUd     := 'FUD';
                 TableTabel  := 'TABEL';
            end;
         SQLStmntPerson:='select count(*) from '+TablePerson+' where yearvy='+IntToStr(WantedYear)+' and monthvy='+IntToStr(WantedMonth)+' and w_place='+IntToStr(NSRV);
         if DatabaseMode=SalarcMode then
            tCount:=FIB.pFIBDatabaseArc.QueryValue(SQLStmntPerson,0)
         else
            tCount:=FIB.pFIBDatabaseSal.QueryValue(SQLStmntPerson,0);
         cnt:=0;
(*
         FormShowPB  := TFormShowPB.Create(Nil);
         FormShowPB.Caption:=Name_Serv(NSRV);
         FormShowPB.ProgressBar1.Min:=0;
         FormShowPB.ProgressBar1.Max:=tCount;
         FormShowPB.ProgressBar1.Position:=0;
         if tCount>0 then
            FormShowPB.Label1.Caption:=IntToStr(cnt)+' / '+IntToStr(tCount)+' '+IntToStr(cnt * 100 div tCount)+'%';
         FormShowPB.Label2.Caption:='';
         Application.ProcessMessages;
         FormShowPB.Show;
*)
         SQLStmntPerson:=' select SHIFRID, TABNO, FIO, DOLG , MONTHVY  ,  YEARVY ,';
         SQLStmntPerson:=trim(SQLStmntPerson)+
                        ' W_R , SHIFRGRU , SHIFRKAT , M_O_R ,  N_TEMY  ,';
         SQLStmntPerson:=trim(SQLStmntPerson)+
                        ' WID_OPLATY , MODE , FROMPODR , PODOH , MALO  ,';
         SQLStmntPerson:=trim(SQLStmntPerson)+
                        ' PROF , MAIN , STATE , AUTOMATIC , START_DAY  ,';
         SQLStmntPerson:=trim(SQLStmntPerson)+
                        ' PENS , BANK , NAL_CODE , OKLAD  , W_PLACE    ,';
         SQLStmntPerson:=trim(SQLStmntPerson)+
                        ' RAZRJAD ';
         SQLStmntPerson:=trim(SQLStmntPerson)+' FROM '+TablePerson+ ' where YEARVY='+IntToStr(WantedYear)+
                        ' and MonthVy='+IntToStr(WantedMonth)+' AND W_PLACE='+IntToStr(NSRV)+
                        ' order by SHIFRID';
         SQLStmntTabel := 'select CODE,DAYNO from '+TableTabel+' where SHIFRID=:ShifrIdPerson order by DAYNO';
         SQLStmntAdd   := 'select SHIFRIDPERSON,SHIFRSTA,MONTH_ZA,YEAR_ZA,SUMMA,WDAY,WCLOCK,FOND,VYPL,SCH FROM '+TableADD+' where w_place=:wp and year_vy=:y and month_vy=:m order by SHIFRIDPERSON,SHIFRID';
         SQLStmntUd    := 'select SHIFRIDPERSON,SHIFRSTA,MONTH_ZA,YEAR_ZA,SUMMA,VYPL,SCH FROM '+TableUD+' where w_place=:wp and year_vy=:y and month_vy=:m order by ShifrIDPerson,SHIFRID';
         SQLStmntCn    := 'select SHIFRIDPERSON,SHIFRSTA,KOD,SUMMA,PRIM,PRIM_1,SCH,ID,AUTOMATIC,DEJA_COUNTED,FLOW_SUMMA,LIMIT_SUMMA FROM '+TableCN+' where w_place=:wp and year_vy=:y and month_vy=:m order by SHIFRIDPERSON,SHIFRID';
 //        SQLStmntSowm  := 'select distinct W_PLACE from '+TablePerson+' where w_r<>1 and tabno=:Tabno and monthvy=:WantedMonth and yearvy=:WantedYear';
 (*       SQLStmntSowm  :=  'with av as';
         SQLStmntSowm  :=  Trim(SQLStmntSowm)+' (select a.shifrid id,a.tabno atn from person a';
         SQLStmntSowm  :=  Trim(SQLStmntSowm)+' where a.w_r=1 and a.w_place=:wp and a.yearvy=:y and a.monthvy=:m),';
         SQLStmntSowm  :=  Trim(SQLStmntSowm)+'  bv as (';
         SQLStmntSowm  :=  Trim(SQLStmntSowm)+'  select distinct b.tabno btn,b.W_PLACE w_p from person b where b.w_r<>1 and b.yearvy=:y and b.monthvy=:m )';
         SQLStmntSowm  :=  Trim(SQLStmntSowm)+'  select id,w_p from av join bv on atn=btn)';
*)       SQLStmntSowm  := 'select distinct W_PLACE from '+TablePerson+' where w_r<>1 and tabno=:Tabno and yearvy=:WantedYear and monthvy=:WantedMonth';
         pFIBTransaction := TpFIBTransaction.Create(Nil);
         if DatabaseMode=SalarcMode then
            pFIBTransaction.DefaultDatabase:=FIB.pFIBDatabaseArc
         else
            pFIBTransaction.DefaultDatabase:=FIB.pFIBDatabaseSal;
 //        pFIBTransaction.TimeoutAction  :=TARollback;
         pFIBTransaction.TPBMode:=tpbDefault;
         pFIBTransaction.TRParams.Clear;
         pFIBTransaction.TRParams.Add('isc_tpb_read');
         pFIBTransaction.TRParams.Add('isc_tpb_nowait');
         pFIBTransaction.TRParams.Add('isc_tpb_rec_version');
         pFIBTransaction.TRParams.Add('isc_tpb_read_committed');
         pFIBTransaction.Name:='tr';
         pFIBQuery:=TpFIBQuery.Create(Nil);
         pFIBQuery.Name:='QP';
         if DatabaseMode=SalarcMode then
            pFIBQuery.Database    := FIB.pFIBDatabaseArc
         else
            pFIBQuery.Database    := FIB.pFIBDatabaseSal;
         pFIBQuery.Transaction := pFIBTransaction;
         pFIBQ:=TpFIBQuery.Create(Nil);
         pFIBQ.Name:='QPP';
         pFIBQ.Database    := FIB.pFIBDatabaseArc;
         pFIBQ.Transaction := pFIBTransaction;

    (*
         pFIBQAdd:=TpFIBQuery.Create(Nil);
         pFIBQAdd.Name:='QA';
         pFIBQAdd.Database    := FIB.pFIBDatabaseArc;
         pFIBQAdd.Transaction := pFIBTransaction;
         pFIBQAdd.SQL.Clear;
         pFIBQAdd.SQL.Add(SQLStmntAdd);
    *)
         pFIBQAdd:=GetQueryForUse(pFIBTransaction,SQLStmntAdd);
         pFIBQUd:=GetQueryForUse(pFIBTransaction,SQLStmntUd);
         pFIBQCn:=GetQueryForUse(pFIBTransaction,SQLStmntCn);
         pFIBQSowm:=GetQueryForUse(pFIBTransaction,SQLStmntSowm);
         pFIBQTabel:=GetQueryForUse(pFIBTransaction,SQLStmntTabel);
      (*
         FIB.FIBSQLLoggerArc.ActiveLogging:=True;
         FIB.FIBSQLLoggerArc.ActiveStatistics:=true;
      *)
         pFIBQuery.SQL.Clear;
         pFIBQuery.SQL.Add(SQLStmntPerson);
         pFIBQuery.Transaction.StartTransaction;
         pFIBQAdd.Params[0].AsInteger:=NSRV;
         pFIBQAdd.Params[1].AsInteger:=wantedYear;
         pFIBQAdd.Params[2].AsInteger:=wantedMonth;
         pFIBQUd.Params[0].AsInteger:=NSRV;
         pFIBQUd.Params[1].AsInteger:=wantedYear;
         pFIBQUd.Params[2].AsInteger:=wantedMonth;
         pFIBQCn.Params[0].AsInteger:=NSRV;
         pFIBQCn.Params[1].AsInteger:=wantedYear;
         pFIBQCn.Params[2].AsInteger:=wantedMonth;
      (*
         pFIBQSowm.Params[0].AsInteger:=NSRV;
         pFIBQSowm.Params[1].AsInteger:=wantedYear;
         pFIBQSowm.Params[2].AsInteger:=wantedMonth;
         pFIBQSowm.Params[3].AsInteger:=wantedYear;
         pFIBQSowm.Params[4].AsInteger:=wantedMonth;
*)
  //       pFIBQAdd.Prepare;
  //       pFIBQUd.Prepare;
  //       pFIBQCn.Prepare;
  //       pFIBQTabel.Prepare;
  //       pFIBQSowm.Prepare;
         pFIBQuery.ExecQuery;
         cnt:=0;
         while not pFIBQuery.Eof do
           begin
                cnt:=cnt+1;
(*
                FormShowPB.Label1.Caption:=IntToStr(cnt)+' / '+IntToStr(tCount)+' '+IntToStr(cnt * 100 div tCount)+'%';
                FormShowPB.Label2.Caption:=trim(pFIBQuery.FldByName['FIO'].AsString);
                FormShowPB.ProgressBar1.Position:=cnt;
                Application.ProcessMessages;
*)
                Make_Person(Curr_Person);
//                i:=pFIBQuery.FldByName['TABNO'].AsInteger;
                ShifrIdPerson := pFIBQuery.FldByName['SHIFRID'].AsInteger;
                Curr_Person^.TABNO:=pFIBQuery.FldByName['TABNO'].AsInteger;
                Curr_Person^.FIO:=trim(pFIBQuery.FldByName['FIO'].AsString);
                Curr_Person^.Dolg:=trim(pFIBQuery.FldByName['DOLG'].AsString);
                Curr_Person^.Wid_Raboty:=pFIBQuery.FldByName['W_R'].AsInteger;
                Curr_Person^.Gruppa:=pFIBQuery.FldByName['SHIFRGRU'].AsInteger;
                Curr_Person^.Kategorija:=pFIBQuery.FldByName['SHIFRKAT'].AsInteger;
                Curr_Person^.Mesto_Osn_Raboty:=pFIBQuery.FldByName['M_O_R'].AsInteger;
                Curr_Person^.From:=pFIBQuery.FldByName['FromPodr'].AsInteger;
                Curr_Person^.Mode:=pFIBQuery.FldByName['Mode'].AsInteger;
                Curr_Person^.WID_OPLATY:=pFIBQuery.FldByName['WID_OPLATY'].AsInteger;
                Curr_Person^.N_Temy:=trim(pFIBQuery.FldByName['N_TEMY'].AsString);
                Curr_Person^.NAL_CODE:=trim(pFIBQuery.FldByName['NAL_CODE'].AsString);
                Curr_Person^.STATE:=pFIBQuery.FldByName['STATE'].AsInteger;
                Curr_Person^.OKLAD:=pFIBQuery.FldByName['OKLAD'].AsFloat;
                Curr_Person^.PODOH:=pFIBQuery.FldByName['PODOH'].AsInteger;
                Curr_Person^.MALO:=pFIBQuery.FldByName['MALO'].AsInteger;
                Curr_Person^.PROFSOJUZ:=pFIBQuery.FldByName['PROF'].AsInteger;
                Curr_Person^.START_DAY:=pFIBQuery.FldByName['START_DAY'].AsInteger;
                Curr_Person^.AUTOMATIC:=pFIBQuery.FldByName['AUTOMATIC'].AsInteger;
                Curr_Person^.PENS:=pFIBQuery.FldByName['PENS'].AsInteger;
                Curr_Person^.BANK:=pFIBQuery.FldByName['BANK'].AsInteger;
                Curr_Person^.ID  :=pFIBQuery.FldByName['SHIFRID'].AsInteger;
                I:=pFIBQuery.FldByName['RAZRJAD'].AsInteger;
                SetRazrjadPerson(Curr_Person,I);
                pFIBQTabel.Params[0].AsInteger:=ShifrIdPerson;
                pFIBQTabel.ExecQuery;
                while not pFIBQTabel.Eof do
                 begin
                      code  := pFIBQTabel.FldByName['CODE'].AsInteger;
                      dayno := pFIBQTabel.FldByName['DAYNO'].AsInteger;
                      if dayno in [1..31] then
                         curr_Person^.Tabel[dayno]:=code;
                      pFIBQTabel.Next;
                 end;
                FreeQueryForUse(pFIBQTabel);
                if Curr_Person.Wid_Raboty=OSN_WID_RABOTY then
                   begin
                       pFIBQSowm.Params[0].AsInteger:=Curr_Person^.Tabno;
                       pFIBQSowm.Params[1].AsInteger:=WantedYear;
                       pFIBQSowm.Params[2].AsInteger:=WantedMonth;
                       pFIBQSowm.ExecQuery;
                       while not pFIBQSowm.Eof do
                          begin
                               MAKE_SOWM(Curr_Sowm,Curr_Person);
                               Curr_Sowm^.WHERE:=pFIBQSowm.FldByName['W_PLACE'].AsInteger;
                               pFIBQSowm.Next;
                          end;
            //           pFIBQSowm.Close;
                       FreeQueryForUse(pFIBQSowm);

                   end;

                pFIBQuery.Next;
           end;

         pFIBQAdd.ExecQuery;
         while not pFIBQAdd.Eof do
            begin
                 Curr_Person:=FindPersonById(pFIBQAdd.FldByName['SHIFRIDPERSON'].AsInteger);
                 if Curr_Person<>Nil then
                    begin
                      MAKE_ADD(Curr_Add,Curr_Person);
                      Curr_Add^.SHIFR:=pFIBQAdd.FldByName['SHIFRSTA'].AsInteger;
                      Curr_Add^.SUMMA:=pFIBQAdd.FldByName['SUMMA'].AsFloat;
                      Curr_Add^.PERIOD:=pFIBQAdd.FldByName['MONTH_ZA'].AsInteger;
                      Curr_Add^.YEAR:=pFIBQAdd.FldByName['YEAR_ZA'].AsInteger-1990;
                      Curr_Add^.COUNT:=trim(pFIBQAdd.FldByName['SCH'].AsString);
                      Curr_Add^.VYPLACHENO:=pFIBQAdd.FldByName['VYPL'].AsInteger;
                      case pFIBQAdd.FldByName['FOND'].AsInteger of
                       2: Curr_Add^.FMP:=Curr_Add^.SUMMA;
                       3: Curr_Add^.Other:=Curr_Add^.SUMMA;
                       else
                          Curr_Add^.FZP:=Curr_Add^.SUMMA;
                      end;
                    end;
                 pFIBQAdd.Next;
            end;
         FreeQueryForUse(pFIBQAdd);
         pFIBQUd.ExecQuery;
         while not pFIBQUd.Eof do
             begin
                 Curr_Person:=FindPersonById(pFIBQUd.FldByName['SHIFRIDPERSON'].AsInteger);
                 if Curr_Person<>Nil then
                    begin
                      MAKE_Ud(Curr_Ud,Curr_Person);
                      Curr_UD^.SHIFR :=pFIBQUd.FldByName['SHIFRSTA'].AsInteger;
                      Curr_Ud^.SUMMA :=pFIBQUd.FldByName['SUMMA'].AsFloat;
                      Curr_Ud^.PERIOD:=pFIBQUd.FldByName['MONTH_ZA'].AsInteger;
                      Curr_Ud^.YEAR  :=pFIBQUd.FldByName['YEAR_ZA'].AsInteger-1990;
                      Curr_Ud^.COUNT :=trim(pFIBQUd.FldByName['SCH'].AsString);
                      Curr_Ud^.VYPLACHENO:=pFIBQUd.FldByName['VYPL'].AsInteger;
                      pFIBQUd.Next;
                    end;
             end;
         FreeQueryForUse(pFIBQUd);
         pFIBQCn.ExecQuery;
         while not pFIBQCn.Eof do
           begin
                 code:=pFIBQCn.FldByName['KOD'].AsInteger;
                 if code=RazrjadShifr+Limit_Cn_Base then
                    begin
                         pFIBQCn.Next;
                         Continue;
                    end;
                 Curr_Person:=FindPersonById(pFIBQCn.FldByName['SHIFRIDPERSON'].AsInteger);
                 if Curr_Person<>Nil then
                    begin
                      MAKE_Cn(Curr_Cn,Curr_Person);
                      Curr_Cn^.SHIFR       := pFIBQCn.FldByName['SHIFRSTA'].AsInteger;
                      Curr_Cn^.SUMMA       := pFIBQCn.FldByName['SUMMA'].AsFloat;
                      Curr_Cn^.KOD         := pFIBQCn.FldByName['KOD'].AsInteger;
                      Curr_Cn^.PRIM        := pFIBQCn.FldByName['PRIM'].AsInteger;
                      Curr_Cn^.PRIM_1      := trim(pFIBQCn.FldByName['PRIM_1'].AsString);
                      Curr_Cn^.COUNT       := trim(pFIBQCn.FldByName['SCH'].AsString);
                      Curr_Cn^.ID          := pFIBQCn.FldByName['ID'].AsInteger;
                      Curr_Cn^.DEJA_COUNTED:= pFIBQCn.FldByName['DEJA_COUNTED'].AsInteger;
                      Curr_Cn^.FLOW_SUMMA  := pFIBQCn.FldByName['FLOW_SUMMA'].AsFloat;
                      Curr_Cn^.LIMIT_SUMMA := pFIBQCn.FldByName['LIMIT_SUMMA'].AsFloat;
                      pFIBQCn.Next;
                    end;
           end;
         FreeQueryForUse(pFIBQCn);
(*
         pFIBQSowm.ExecQuery;
         while not pFIBQSowm.Eof do
            begin
                 Curr_Person:=FindPersonById(pFIBQCn.FldByName['ID'].AsInteger);
                 if Curr_Person<>Nil then
                    begin
                         MAKE_SOWM(Curr_Sowm,Curr_Person);
                         Curr_Sowm^.WHERE:=pFIBQSowm.FldByName['W_PLACE'].AsInteger;
                    end;
                 pFIBQSowm.Next;
            end;
         FreeQueryForUse(pFIBQSowm);
*)

         i:=count_Person;
         pFIBQAdd.Close;
         pFIBQUd.Close;
         pFIBQCn.Close;
         pFIBQTabel.Close;
         pFIBQSowm.Close;
         pFIBQuery.Close;
         pFIBQuery.Transaction.Commit;
      (*
         FIB.FIBSQLLoggerArc.SaveLog;
         FIB.FIBSQLLoggerArc.ActiveLogging:=False;
         FIB.FIBSQLLoggerArc.ActiveStatistics:=false;
      *)
         pFIBQuery.Free;
         pFIBQ.Free;
      //   pFIBQAdd.Free;
      //   pFIBQUd.Free;
      //   pFIBQCn.Free;
      //   pFIBQTabel.Free;
         pFIBTransaction.Free;
(*
         FormShowPB.Hide;
         FormShowPB.Free;
*)
    end;                 

//-------------------------
   procedure getInfSqlForTabno(WantedMonth:Integer;WantedYear:integer;DatabaseMode:tDatabaseMode;WantedTabno:Integer;CurrentTableNames:Boolean=false);
    var SQLStmntPerson  : string;
        SQLStmntAdd     : string;
        SQLStmntUd      : string;
        SQLStmntCn      : string;
        SQLStmntSowm    : string;
        SQLStmntTabel   : string;
        TablePerson     : string;
        TableCN         : string;
        TableAdd        : string;
        TableUd         : string;
        TableTabel      : string;
        pFIBQuery       : TpFIBQuery;
        pFIBQ           : TpFIBQuery;
    //    pFIBQAdd        : TpFIBQuery;
        pFIBQAdd        : TFIBQuery;
        pFIBQUd         : TFIBQuery;
        pFIBQCn         : TFIBQuery;
        pFIBQSowm       : TFIBQuery;
        pFIBQTabel      : TFIBQuery;
        pFIBTransaction : TpFIBTransaction;
        cnt,I           : Integer;
        Curr_Person     : PERSON_PTR;
        ShifrIdPerson   : Integer;
        code,dayno      : Integer;
        Curr_Add        : ADD_PTR;
        Curr_Ud         : UD_PTR;
        Curr_Cn         : CN_PTR;
        Curr_Sowm       : SOWM_PTR;
        tCount          : Integer;
    function FindPersonById(ShifrId:LongWord):Person_Ptr;
      var C_P:PERSON_PTR;
          finded:Boolean;
      begin
           FindPersonById:=Nil;
           finded:=false;
           C_P:=HEAD_Person;
           while (C_P<>Nil) do
            begin
                 if C_P.id=shifrid then
                    begin
                         finded:=True;
                         FindPersonById:=C_P;
                         break;
                    end;
                 c_p:=C_P.NEXT;
            end;

      end;
    begin
         if ((CurrentTableNames) and (DatabaseMode=SalMode)) then
            begin
                 TablePerson := 'TB_C_PERSON';
                 TableCN     := 'TB_C_FCN';
                 TableAdd    := 'TB_C_FADD';
                 TableUd     := 'TB_C_FUD';
                 TableTabel  := 'TB_C_TABEL';

            end
         else
            begin
                 TablePerson := 'PERSON';
                 TableCN     := 'FCN';
                 TableAdd    := 'FADD';
                 TableUd     := 'FUD';
                 TableTabel  := 'TABEL';
            end;
         SQLStmntPerson:='select count(*) from '+TablePerson+' where yearvy='+IntToStr(WantedYear)+' and monthvy='+IntToStr(WantedMonth)+' and tabno='+IntToStr(wantedTabno);
         if DatabaseMode=SalarcMode then
            tCount:=FIB.pFIBDatabaseArc.QueryValue(SQLStmntPerson,0)
         else
            tCount:=FIB.pFIBDatabaseSal.QueryValue(SQLStmntPerson,0);
         cnt:=0;
         SQLStmntPerson:=' select SHIFRID, TABNO, FIO, DOLG , MONTHVY  ,  YEARVY ,';
         SQLStmntPerson:=trim(SQLStmntPerson)+
                        ' W_R , SHIFRGRU , SHIFRKAT , M_O_R ,  N_TEMY  ,';
         SQLStmntPerson:=trim(SQLStmntPerson)+
                        ' WID_OPLATY , MODE , FROMPODR , PODOH , MALO  ,';
         SQLStmntPerson:=trim(SQLStmntPerson)+
                        ' PROF , MAIN , STATE , AUTOMATIC , START_DAY  ,';
         SQLStmntPerson:=trim(SQLStmntPerson)+
                        ' PENS , BANK , NAL_CODE , OKLAD  , W_PLACE    ,';
         SQLStmntPerson:=trim(SQLStmntPerson)+
                        ' RAZRJAD ';
         SQLStmntPerson:=trim(SQLStmntPerson)+' FROM '+TablePerson+ ' where YEARVY='+IntToStr(WantedYear)+
                        ' and MonthVy='+IntToStr(WantedMonth)+' AND TABNO='+IntToStr(wantedTabno)+
                        ' order by SHIFRID';
         SQLStmntTabel := 'select CODE,DAYNO from '+TableTabel+' where SHIFRID=:ShifrIdPerson order by DAYNO';
         SQLStmntAdd   := 'select SHIFRIDPERSON,SHIFRSTA,MONTH_ZA,YEAR_ZA,SUMMA,WDAY,WCLOCK,FOND,VYPL,SCH FROM '+TableADD+' where SHIFRIDPERSON=:ShifrIdPerson order by SHIFRID';
         SQLStmntUd    := 'select SHIFRIDPERSON,SHIFRSTA,MONTH_ZA,YEAR_ZA,SUMMA,VYPL,SCH FROM '+TableUD+' where SHIFRIDPERSON=:ShifrIdPerson order by SHIFRID';
         SQLStmntCn    := 'select SHIFRIDPERSON,SHIFRSTA,KOD,SUMMA,PRIM,PRIM_1,SCH,ID,AUTOMATIC,DEJA_COUNTED,FLOW_SUMMA,LIMIT_SUMMA FROM '+TableCN+' where SHIFRIDPERSON=:ShifrIdPerson order by SHIFRID';
         SQLStmntSowm  := 'select distinct W_PLACE from '+TablePerson+' where SHIFRIDPERSON=:ShifrIdPerson';
         pFIBTransaction := TpFIBTransaction.Create(Nil);
         if DatabaseMode=SalarcMode then
            pFIBTransaction.DefaultDatabase:=FIB.pFIBDatabaseArc
         else
            pFIBTransaction.DefaultDatabase:=FIB.pFIBDatabaseSal;
         pFIBTransaction.TPBMode:=tpbDefault;
         pFIBTransaction.TRParams.Clear;
         pFIBTransaction.TRParams.Add('isc_tpb_read');
         pFIBTransaction.TRParams.Add('isc_tpb_nowait');
         pFIBTransaction.TRParams.Add('isc_tpb_rec_version');
         pFIBTransaction.TRParams.Add('isc_tpb_read_committed');
         pFIBTransaction.Name:='tr';
         pFIBQuery:=TpFIBQuery.Create(Nil);
         pFIBQuery.Name:='QP';
         if DatabaseMode=SalarcMode then
            pFIBQuery.Database    := FIB.pFIBDatabaseArc
         else
            pFIBQuery.Database    := FIB.pFIBDatabaseSal;
         pFIBQuery.Transaction := pFIBTransaction;
         pFIBQ:=TpFIBQuery.Create(Nil);
         pFIBQ.Name:='QPP';
         pFIBQ.Database    := FIB.pFIBDatabaseArc;
         pFIBQ.Transaction := pFIBTransaction;

         pFIBQAdd   := GetQueryForUse(pFIBTransaction,SQLStmntAdd);
         pFIBQUd    := GetQueryForUse(pFIBTransaction,SQLStmntUd);
         pFIBQCn    := GetQueryForUse(pFIBTransaction,SQLStmntCn);
         pFIBQSowm  := GetQueryForUse(pFIBTransaction,SQLStmntSowm);
         pFIBQTabel := GetQueryForUse(pFIBTransaction,SQLStmntTabel);
         pFIBQuery.SQL.Clear;
         pFIBQuery.SQL.Add(SQLStmntPerson);
         pFIBQuery.Transaction.StartTransaction;
         pFIBQuery.ExecQuery;
         cnt:=0;
         while not pFIBQuery.Eof do
           begin
                cnt:=cnt+1;
                Make_Person(Curr_Person);
                ShifrIdPerson := pFIBQuery.FldByName['SHIFRID'].AsInteger;
                Curr_Person^.TABNO:=pFIBQuery.FldByName['TABNO'].AsInteger;
                Curr_Person^.FIO:=trim(pFIBQuery.FldByName['FIO'].AsString);
                Curr_Person^.Dolg:=trim(pFIBQuery.FldByName['DOLG'].AsString);
                Curr_Person^.Wid_Raboty:=pFIBQuery.FldByName['W_R'].AsInteger;
                Curr_Person^.Gruppa:=pFIBQuery.FldByName['SHIFRGRU'].AsInteger;
                Curr_Person^.Kategorija:=pFIBQuery.FldByName['SHIFRKAT'].AsInteger;
                Curr_Person^.Mesto_Osn_Raboty:=pFIBQuery.FldByName['M_O_R'].AsInteger;
                Curr_Person^.From:=pFIBQuery.FldByName['FromPodr'].AsInteger;
                Curr_Person^.Mode:=pFIBQuery.FldByName['Mode'].AsInteger;
                Curr_Person^.WID_OPLATY:=pFIBQuery.FldByName['WID_OPLATY'].AsInteger;
                Curr_Person^.N_Temy:=trim(pFIBQuery.FldByName['N_TEMY'].AsString);
                Curr_Person^.NAL_CODE:=trim(pFIBQuery.FldByName['NAL_CODE'].AsString);
                Curr_Person^.STATE:=pFIBQuery.FldByName['STATE'].AsInteger;
                Curr_Person^.OKLAD:=pFIBQuery.FldByName['OKLAD'].AsFloat;
                Curr_Person^.PODOH:=pFIBQuery.FldByName['PODOH'].AsInteger;
                Curr_Person^.MALO:=pFIBQuery.FldByName['MALO'].AsInteger;
                Curr_Person^.PROFSOJUZ:=pFIBQuery.FldByName['PROF'].AsInteger;
                Curr_Person^.START_DAY:=pFIBQuery.FldByName['START_DAY'].AsInteger;
                Curr_Person^.AUTOMATIC:=pFIBQuery.FldByName['AUTOMATIC'].AsInteger;
                Curr_Person^.PENS:=pFIBQuery.FldByName['PENS'].AsInteger;
                Curr_Person^.BANK:=pFIBQuery.FldByName['BANK'].AsInteger;
                Curr_Person^.ID  :=pFIBQuery.FldByName['SHIFRID'].AsInteger;
                I:=pFIBQuery.FldByName['RAZRJAD'].AsInteger;
                SetRazrjadPerson(Curr_Person,I);
                pFIBQTabel.Params[0].AsInteger:=ShifrIdPerson;
                pFIBQTabel.ExecQuery;
                while not pFIBQTabel.Eof do
                 begin
                      code  := pFIBQTabel.FldByName['CODE'].AsInteger;
                      dayno := pFIBQTabel.FldByName['DAYNO'].AsInteger;
                      if dayno in [1..31] then
                         curr_Person^.Tabel[dayno]:=code;
                      pFIBQTabel.Next;
                 end;
                FreeQueryForUse(pFIBQTabel);
(*
                if Curr_Person.Wid_Raboty=OSN_WID_RABOTY then
                   begin
                       pFIBQSowm.Params[0].AsInteger:=shifridperson;
                       pFIBQSowm.ExecQuery;
                       while not pFIBQSowm.Eof do
                          begin
                               MAKE_SOWM(Curr_Sowm,Curr_Person);
                               Curr_Sowm^.WHERE:=pFIBQSowm.FldByName['W_PLACE'].AsInteger;
                               pFIBQSowm.Next;
                          end;
                       FreeQueryForUse(pFIBQSowm);

                   end;
*)                   
               // Начисдения
                pFIBQAdd.Params[0].AsInteger:=ShifrIdPerson;
                pFIBQAdd.ExecQuery;
                while not pFIBQAdd.Eof do
                   begin
                        MAKE_ADD(Curr_Add,Curr_Person);
                        Curr_Add^.SHIFR:=pFIBQAdd.FldByName['SHIFRSTA'].AsInteger;
                        Curr_Add^.SUMMA:=pFIBQAdd.FldByName['SUMMA'].AsFloat;
                        Curr_Add^.PERIOD:=pFIBQAdd.FldByName['MONTH_ZA'].AsInteger;
                        Curr_Add^.YEAR:=pFIBQAdd.FldByName['YEAR_ZA'].AsInteger-1990;
                        Curr_Add^.COUNT:=trim(pFIBQAdd.FldByName['SCH'].AsString);
                        Curr_Add^.VYPLACHENO:=pFIBQAdd.FldByName['VYPL'].AsInteger;
                        case pFIBQAdd.FldByName['FOND'].AsInteger of
                         2: Curr_Add^.FMP:=Curr_Add^.SUMMA;
                         3: Curr_Add^.Other:=Curr_Add^.SUMMA;
                         else
                            Curr_Add^.FZP:=Curr_Add^.SUMMA;
                        end;
                        pFIBQAdd.Next;
                   end;
                FreeQueryForUse(pFIBQAdd);

                // Удержания
                pFIBQUd.Params[0].AsInteger:=ShifrIdPerson;
                pFIBQUd.ExecQuery;
                while not pFIBQUd.Eof do
                 begin
                      MAKE_Ud(Curr_Ud,Curr_Person);
                      Curr_UD^.SHIFR :=pFIBQUd.FldByName['SHIFRSTA'].AsInteger;
                      Curr_Ud^.SUMMA :=pFIBQUd.FldByName['SUMMA'].AsFloat;
                      Curr_Ud^.PERIOD:=pFIBQUd.FldByName['MONTH_ZA'].AsInteger;
                      Curr_Ud^.YEAR  :=pFIBQUd.FldByName['YEAR_ZA'].AsInteger-1990;
                      Curr_Ud^.COUNT :=trim(pFIBQUd.FldByName['SCH'].AsString);
                      Curr_Ud^.VYPLACHENO:=pFIBQUd.FldByName['VYPL'].AsInteger;
                      pFIBQUd.Next;
                 end;
                FreeQueryForUse(pFIBQUd);

             // CN
                pFIBQCn.Params[0].AsInteger:=ShifrIdPerson;
                pFIBQCn.ExecQuery;
                while not pFIBQCn.Eof do
                  begin
                       code:=pFIBQCn.FldByName['KOD'].AsInteger;
                       if code=RazrjadShifr+Limit_Cn_Base then
                          begin
                               pFIBQCn.Next;
                               Continue;
                          end;
                       MAKE_Cn(Curr_Cn,Curr_Person);
                       Curr_Cn^.SHIFR       := pFIBQCn.FldByName['SHIFRSTA'].AsInteger;
                       Curr_Cn^.SUMMA       := pFIBQCn.FldByName['SUMMA'].AsFloat;
                       Curr_Cn^.KOD         := pFIBQCn.FldByName['KOD'].AsInteger;
                       Curr_Cn^.PRIM        := pFIBQCn.FldByName['PRIM'].AsInteger;
                       Curr_Cn^.PRIM_1      := trim(pFIBQCn.FldByName['PRIM_1'].AsString);
                       Curr_Cn^.COUNT       := trim(pFIBQCn.FldByName['SCH'].AsString);
                       Curr_Cn^.ID          := pFIBQCn.FldByName['ID'].AsInteger;
                       Curr_Cn^.DEJA_COUNTED:= pFIBQCn.FldByName['DEJA_COUNTED'].AsInteger;
                       Curr_Cn^.FLOW_SUMMA  := pFIBQCn.FldByName['FLOW_SUMMA'].AsFloat;
                       Curr_Cn^.LIMIT_SUMMA := pFIBQCn.FldByName['LIMIT_SUMMA'].AsFloat;
                       pFIBQCn.Next;
                  end;
                FreeQueryForUse(pFIBQCn);


                pFIBQuery.Next;
           end;


         i:=count_Person;
         pFIBQAdd.Close;
         pFIBQUd.Close;
         pFIBQCn.Close;
         pFIBQTabel.Close;
         pFIBQSowm.Close;
         pFIBQuery.Close;
         pFIBQuery.Transaction.Commit;
         pFIBQuery.Free;
         pFIBQ.Free;
         pFIBTransaction.Free;
    end;                 

end.
