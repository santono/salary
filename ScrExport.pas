unit ScrExport;

interface
    uses ScrDef;
   type TDstMode=(salDstMode,salarcDstMode,tmpDstMode,currDstMode);
  procedure ExportPodr;
  procedure ExportShifr;
  procedure ExportKadry;
  procedure PutToSQL(NeedClear:boolean;DstMode:TDstMode);
  procedure ExportBoln;
  procedure ExportOtp;
  FUNCTION  UpdatePodr:BOOLEAN;
  FUNCTION MovePodrToArc:BOOLEAN;

  procedure UpdateKadry;
  FUNCTION  UpdateDolg:BOOLEAN;
  procedure Delete_All_Podr(DateFr:TDateTime;DateTo:TDateTime;ModeArc:boolean);
  PROCEDURE EXPORT_DAY_KOD;
  procedure putPersonToSQL(personId:integer;Curr_person:Person_ptr;DstMode:TDstMode;YearZa,MonthZa:integer);
  procedure Recalc_Person_Sql(Curr_Person:Person_ptr;YearZa:integer;MonthZa:integer;Debug_Mode:integer);
  function Get_Summy_From_Sql(Curr_Person:Person_ptr;YearZa:integer;MonthZa:integer;
          var SummaFzAdd,SummaFzUd,SummaSSAdd,SummaSSUd,SummaPensAdd,SummaPensUd,
          SummaPodAdd,SummaPodUd,SummaAlimAdd,SummaAlimUd,
          SummaECBAdd,SummaECBUd,SummaECBNAdd,SummaECBNUd,
          SummaECBIllAdd,SummaECBIllUd,
          SummaECBDpAdd,SummaECBDpUd:real):boolean;
  function Get_Summy_From_Sql_2011(Curr_Person:Person_ptr;YearZa:integer;MonthZa:integer;
          var SummaPodAdd,SummaPodUd,SummaAlimAdd,SummaAlimUd,
          SummaECBAdd,SummaECBUd,SummaECBNAdd,SummaECBNUd,
          SummaECBIllAdd,SummaECBIllUd,
          SummaECBDpAdd,SummaECBDpUd:real):boolean;
  procedure ClearTmpFiles(Tabno:integer);
  procedure PutSummyToTmpTables(Curr_Person:PERSON_PTR;YearZa:integer;MonthZa:integer);

//  procedure Put_Person_To_Sql_For_Curr_Month(WantedTabno:integer;WantedPodr:integer);
  procedure putPersonToSqlForCurrMonth(WantedTabno:integer;WantedPodr:integer);



implementation
  uses Dialogs,SysUtils,DbUnit,ScrLists,DBLogDlg,ScrUtil,UFIBModule,
       KadClU,UToSQL,Clarion,Forms,DateUtils,Math,Classes,ScrIO,UFormWait,
       FormShowRecalcPersonU,UFormAnalyzeNalogi,KadKprClU,UFormWaitMess,
  Variants, FIBDatabase,USQLUnit;
{ **************************************** }
{ *   Перенос подразделений в FireBird   * }
{ **************************************** }
   procedure ExportPodr;
     var I:Integer;
         PodrRec:PPodrRec;
         S:String;
     begin
{
          try
             FIB.pFIBDatabaseSal.Connected := True;
          except
             MessageDlg('Ошибка открытия базы данных',
                       mtInformation, [mbOk], 0);
             Exit;
          end;
}
          FIB.pFIBTransactionSAL.StartTransaction;
{
          FIB.pFIBQuery.SQL.Clear;
          FIB.pFIBQuery.SQL.Add('DELETE FROM PODR');
          try
             FIB.pFIBQuery.ExecQuery;
          except
             FIB.pFIBTransactionSAL.Rollback;
             MessageDlg('Ошибка чистки таблицы PODR',
                       mtInformation, [mbOk], 0);
             Exit;
          end;
}
          for i:=1 to NameServList.Count do
              begin
                   PodrRec:=NameServList.Items[i-1];
                   if Length(PodrRec^.Name)>4 then
                      PodrRec^.Name:=copy(PodrRec^.Name,5,Length(PodrRec^.Name)-4);
                   S:=ReplSToDQuote(PodrRec^.Name);
                   FIB.pFIBQuery.SQL.Clear;
                   S:='INSERT INTO PODR (SHIFRPOD,NAME) VALUES ('+
                                             IntToStr(PodrRec^.Shifr)+','''+S+''')';
                   FIB.pFIBQuery.SQL.Add(S);
                   try
                      FIB.pFIBQuery.ExecQuery;
                   except
                         FIB.pFIBTransactionSAL.Rollback;
                         MessageDlg('Ошибка добавления записи в таблицу PODR',
                                     mtInformation, [mbOk], 0);
 {                        FIB.pFIBDatabaseSal.Connected := False;}
                         Exit;
                   end;
              end;
          FIB.pFIBTransactionSAL.Commit;
          MessageDlg('Таблица подразделений заполнена '+
                     IntToStr(NameServList.Count)+' записями',
                      mtInformation, [mbOk], 0);
{        FIB.pFIBDatabaseSal.Connected := False;}
     end;

    FUNCTION UpdatePodr:BOOLEAN;
      VAR
         j        : integer;
         NAME     : STRING;
         S1       : string[3];
         FNAME    : STRING;
         DEV      : TEXTfile;
         SHIFRPOD : WORD;
      BEGIN
         UpdatePodr  := FALSE;
         FNAME       := CDir+'PODR1.TXT';
         IF NOT FILEEXIST(FNAME) THEN
            BEGIN
                  ShowMessage('Отсутствует файл '+FNAME);
                  EXIT;
            END;
        ASSIGNfile(DEV,FNAME);
        RESET(DEV);
        FIB.pFIBTransactionSAL.StartTransaction;
        FIB.pFIBTransactionArc.StartTransaction;
        FIB.pFIBStoredProcCom.StoredProcName    := 'INSERT_PODR';
        FIB.pFIBStoredProcComArc.StoredProcName := 'INSERT_PODR';
        while not eof(Dev) do
          begin
               {$i-}
               readln(dev,s1,name);
               {$i+}
               Name:=DosToWIN(Trim(Name));
               if length(name)<1 then continue;
               Name:=Trim(Name);
               Name:=ConvertUkrStrToSql(Name);
               val(Trim(S1),ShifrPod,j);
               if j<>0 then continue;

               FIB.pFIBStoredProcCom.Params[0].AsInteger := ShifrPod;
               FIB.pFIBStoredProcCom.Params[1].AsString  := Name;
               FIB.pFIBStoredProcCom.Prepare;
               try
                   FIB.pFIBStoredProcCom.ExecProc;
               except
               end;

               FIB.pFIBStoredProcComArc.Params[0].AsInteger := ShifrPod;
               FIB.pFIBStoredProcComArc.Params[1].AsString := Name;
               FIB.pFIBStoredProcComArc.Prepare;
               try
                   FIB.pFIBStoredProcComArc.ExecProc;
               except
               end;

          end;

        FIB.pFIBTransactionSAL.Commit;
        FIB.pFIBTransactionArc.Commit;
        closefile(dev);
        UpdatePodr  := true;
     END;


    FUNCTION MovePodrToArc:BOOLEAN;
      VAR
         j        : integer;
         NAMEPOD  : STRING;
         S1       : string[3];
         FNAME    : STRING;
         SHIFRPOD : WORD;
         i_nsrv   : Integer;
         SQLStmnt : string;
      BEGIN
         MovePodrToArc  := FALSE;
         SQLStmnt:='select shifrpod,name from podr';
         if FIB.pFIBQuery.Open then
            FIB.pFIBQuery.Close;
         FIB.pFIBQuery.SQL.Clear;
         FIB.pFIBQuery.SQL.Add(SQLStmnt);
         if not FIB.pFIBQuery.Transaction.Active then
            FIB.pFIBQuery.Transaction.StartTransaction;
         FIB.pFIBQuery.ExecQuery;    
        FIB.pFIBTransactionArc.StartTransaction;
         while not FIB.pFIBQuery.Eof do
          begin
               ShifrPod := FIB.pFIBQuery.Fields[0].AsInteger;
               NamePod  := Trim(FIB.pFIBQuery.Fields[1].AsString);

               FIB.pFIBStoredProcComArc.Params[0].AsInteger := ShifrPod;
               FIB.pFIBStoredProcComArc.Params[1].AsString   := NamePod;
               FIB.pFIBStoredProcComArc.Prepare;
               try
                   FIB.pFIBStoredProcComArc.ExecProc;
               except
                   else
                      Error('Ошибка записи подразделения в архивную БД');
               end;
               FIB.pFIBQuery.Next;

          end;

        FIB.pFIBTransactionArc.Commit;
        MovePodrToArc  := true;
     END;

{ ********************************************* }
{ *   Перенос справочника статей в FireBird   * }
{ ********************************************* }
   
   procedure ExportShifr;
     var I,J,ii:Integer;
         ShifrRec:PShifrRec;
         S,S1:String;
         v:Variant;
     begin

//          FIB.pFIBTransactionSAL.StartTransaction;
//          j:=0;
//          for i:=1 to ShifrList.Count do
//              begin
//                   ShifrRec:=ShifrList.Items[i-1];
//                   { Прочитать запись из базы }
//                   S:='SELECT COUNT(*) FROM SHIFR WHERE SHIFR.SHIFR='+ALLTRIM(INTTOSTR(I));
//                   FIB.pFIBQuery.SQL.Clear;
//                   FIB.pFIBQuery.SQL.Add(S);
//                   try
//                      FIB.pFIBQuery.ExecQuery;
//                      J:=FIB.pFIBQuery.Fields[0].AsInteger;
//                      FIB.pFIBQuery.Close;
//                   except
//                      FIB.pFIBTransactionSAL.Rollback;
//                      MessageDlg('Ошибка чистки таблицы SHIFR',mtInformation, [mbOk], 0);
//                      Exit;
//                   end;
//                   IF J=1 THEN
//                      BEGIN
//                           S:='UPDATE SHIFR SET';
//                           S:=S+' NAME='+''''+AllTrim(ShifrRec^.Long_Name)+''',';
//                           S:=S+' SHORTNAME='+''''+AllTrim(ShifrRec^.Short_Name)+''',';
//                           if ShifrList.IsPodoh(I)  then J:=1 else J:=0;
//                           S:=S+' PODOH='+AllTrim(IntToStr(J))+',';
//                           if ShifrList.IsPens(I)   then J:=1 else J:=0;
//                           S:=S+' PENS='+AllTrim(IntToStr(J))+',';
//                           if ShifrList.IsS_S(I)    then J:=1 else J:=0;
//                           S:=S+' SS='+AllTrim(IntToStr(J))+',';
//                           if ShifrList.IsFondZ(I)  then J:=1 else J:=0;
//                           S:=S+' FONDZ='+AllTrim(IntToStr(J))+',';
//                           if ShifrList.IsBoln(I)   then J:=1 else J:=0;
//                           S:=S+' BOLN='+AllTrim(IntToStr(J))+',';
//                           if ShifrList.IsOtpusk(I) then J:=1 else J:=0;
//                           S:=S+' OTP='+AllTrim(IntToStr(J))+',';
//                           if ShifrList.IsProf(I)   then J:=1 else J:=0;
//                           S:=S+' PROF='+AllTrim(IntToStr(J))+',';
//                           if ShifrList.IsAlim(I)   then J:=1 else J:=0;
//                           S:=S+' ALIM='+AllTrim(IntToStr(J))+',';
//                           if ShifrList.IsAdd(I)    then J:=1 else J:=0;
//                           S:=S+' MODE='+AllTrim(IntToStr(J));
//                           S:=S+' WHERE SHIFR='+AllTrim(IntToStr(I));
//                           FIB.pFIBQuery.SQL.Clear;
//                           FIB.pFIBQuery.SQL.Add(S);
//                           try
//                              FIB.pFIBQuery.ExecQuery;
//                           except
//                              FIB.pFIBTransactionSAL.Rollback;
//                              MessageDlg('Ошибка обновлентя записи в таблицу SHIFR',
//                                       mtInformation, [mbOk], 0);
//                              Exit;
//                           end;
//
//                      END
//                   ELSE
//                   begin
//                         S:='INSERT INTO SHIFR (SHIFR,NAME,SHORTNAME,PODOH,PENS,SS,FONDZ,BOLN,OTP,PROF,ALIM,MODE) VALUES(';
//                         S:=S+IntToStr(I)+',''';
//                         S:=S+ShifrRec^.Long_Name+''',''';
//                         S:=S+ShifrRec^.Short_Name+''',';
//                         if ShifrList.IsPodoh(I)  then S:=S+'1,' else S:=S+'0,';
//                         if ShifrList.IsPens(I)   then S:=S+'1,' else S:=S+'0,';
//                         if ShifrList.IsS_S(I)    then S:=S+'1,' else S:=S+'0,';
//                         if ShifrList.IsFondZ(I)  then S:=S+'1,' else S:=S+'0,';
//                         if ShifrList.IsBoln(I)   then S:=S+'1,' else S:=S+'0,';
//                         if ShifrList.IsOtpusk(I) then S:=S+'1,' else S:=S+'0,';
//                         if ShifrList.IsProf(I)   then S:=S+'1,' else S:=S+'0,';
//                         if ShifrList.IsAlim(I)   then S:=S+'1,' else S:=S+'0,';
//                         if ShifrList.IsAdd(I)    then S:=S+'1)' else S:=S+'0)';
//                         FIB.pFIBQuery.SQL.Clear;
//                         FIB.pFIBQuery.SQL.Add(S);
//                         try
//                            FIB.pFIBQuery.ExecQuery;
//                         except
//                            FIB.pFIBTransactionSAL.Rollback;
//                            MessageDlg('Ошибка добавления записи в таблицу SHIFR',
//                                     mtInformation, [mbOk], 0);
//                            Exit;
//                         end;
//                   end;
//              end;
//          FIB.pFIBTransactionSAL.Commit;

//     FIB.FIBSQLLoggerArc.ActiveLogging:=True;
//     FIB.FIBSQLLoggerArc.ActiveStatistics:=True;

          FIB.pFIBTransactionArc.StartTransaction;
          for i:=1 to ShifrList.Count do
              begin
                   ShifrRec:=ShifrList.Items[i-1];
                   ii:=ShifrRec.Shifr;
                   { Прочитать запись из базы }
                   S:='SELECT COUNT(*) FROM SHIFR WHERE SHIFR.SHIFR='+ALLTRIM(INTTOSTR(I));
                   v:=FIB.pFIBDatabaseArc.QueryValue(S,0);
                   j:=0;
                   if VarIsNumeric(v) then
                      j:=v;
                   IF J=1 THEN
                      BEGIN
                           S:='UPDATE SHIFR SET';
                           S:=S+' NAME='+''''+Trim(Copy(ShifrRec^.Long_Name+space(50),1,50))+''',';
                           S:=S+' SHORTNAME='+''''+Trim(copy(ShifrRec^.Short_Name+space(20),1,20))+''',';
                           if ShifrList.IsPodoh(Ii)  then J:=1 else J:=0;
                           S:=S+' PODOH='+AllTrim(IntToStr(J))+',';
                           if ShifrList.IsPens(Ii)   then J:=1 else J:=0;
                           S:=S+' PENS='+AllTrim(IntToStr(J))+',';
                           if ShifrList.IsS_S(Ii)    then J:=1 else J:=0;
                           S:=S+' SS='+AllTrim(IntToStr(J))+',';
                           if ShifrList.IsFondZ(Ii)  then J:=1 else J:=0;
                           S:=S+' FONDZ='+AllTrim(IntToStr(J))+',';
                           if ShifrList.IsBoln(Ii)   then J:=1 else J:=0;
                           S:=S+' BOLN='+AllTrim(IntToStr(J))+',';
                           if ShifrList.IsOtpusk(Ii) then J:=1 else J:=0;
                           S:=S+' OTP='+AllTrim(IntToStr(J))+',';
                           if ShifrList.IsProf(Ii)   then J:=1 else J:=0;
                           S:=S+' PROF='+AllTrim(IntToStr(J))+',';
                           if ShifrList.IsAlim(Ii)   then J:=1 else J:=0;
                           S:=S+' ALIM='+AllTrim(IntToStr(J))+',';
                           if ShifrList.IsAdd(Ii)    then J:=1 else J:=0;
                           S:=S+' MODE='+AllTrim(IntToStr(J))+',';;
                           if ShifrList.IsECB(Ii)   then J:=1 else J:=0;
                           S:=S+' ECB='+AllTrim(IntToStr(J))+',';
                           if ShifrList.IsECBIll(Ii)   then J:=1 else J:=0;
                           S:=S+' ECB_ILL='+AllTrim(IntToStr(J))+',';
                           if isSVDN then
                              begin
                                   if ShifrList.IsWS(Ii)   then J:=1 else J:=0;
                                      S:=S+' WS='+AllTrim(IntToStr(J))+',';
                              end;
                           S1:=trim(getStaNameForSwodFromSQL(ii));
                           if Length(S1)=0 then
                              s1:=' ';
                           S:=S+' NAMEFORSWOD='+''''+S1+'''';
                           S:=S+' WHERE SHIFR='+AllTrim(IntToStr(Ii));
                           j:=Length(s);
//                           putSQLStmntToLog(S);
                           FIB.pFIBDatabaseArc.Execute(S);
//                           FIB.pFIBQueryArc.SQL.Clear;
//                           FIB.pFIBQueryArc.SQL.Add(S);
//                           try
//                              FIB.pFIBQueryArc.ExecQuery;
//                           except
//                              FIB.pFIBTransactionArc.Rollback;
//                              MessageDlg('Ошибка обновлентя записи в таблицу SHIFR',
//                                       mtInformation, [mbOk], 0);
//                              Exit;
//                           end;

                      END
                   ELSE
                   begin
                         if isSVDN then
                            S:='INSERT INTO SHIFR (SHIFR,NAME,SHORTNAME,PODOH,PENS,SS,FONDZ,BOLN,OTP,PROF,ALIM,MODE,ECB,ECB_ILL,WS,NAMEFORSWOD) VALUES('
                         else
                            S:='INSERT INTO SHIFR (SHIFR,NAME,SHORTNAME,PODOH,PENS,SS,FONDZ,BOLN,OTP,PROF,ALIM,MODE,ECB,ECB_ILL,NAMEFORSWOD) VALUES(';
                         S:=S+IntToStr(I)+',''';
                         S:=S+trim(Copy(ShifrRec^.Long_Name+space(50),1,50))+''',''';
                         S:=S+trim(Copy(ShifrRec^.Short_Name+space(20),1,20))+''',';
                         if ShifrList.IsPodoh(iI)  then S:=S+'1,' else S:=S+'0,';
                         if ShifrList.IsPens(iI)   then S:=S+'1,' else S:=S+'0,';
                         if ShifrList.IsS_S(iI)    then S:=S+'1,' else S:=S+'0,';
                         if ShifrList.IsFondZ(iI)  then S:=S+'1,' else S:=S+'0,';
                         if ShifrList.IsBoln(iI)   then S:=S+'1,' else S:=S+'0,';
                         if ShifrList.IsOtpusk(iI) then S:=S+'1,' else S:=S+'0,';
                         if ShifrList.IsProf(iI)   then S:=S+'1,' else S:=S+'0,';
                         if ShifrList.IsAlim(iI)   then S:=S+'1,' else S:=S+'0,';
                         if ShifrList.IsAdd(iI)    then S:=S+'1,' else S:=S+'0,';
                         if ShifrList.IsECB(iI)    then S:=S+'1,' else S:=S+'0,';
                         if ShifrList.IsECBIll(iI) then S:=S+'1,' else S:=S+'0,';
                         if isSVDN then
                            if ShifrList.IsWS(iI)     then S:=S+'1,' else S:=S+'0,';
                         S1:=trim(getStaNameForSwodFromSQL(ii));
                         if Length(S1)=0 then
                              s1:=' ';
                         s:=s+''''+S1+''''+')';
                         j:=Length(s);
//                           putSQLStmntToLog(S);
                         FIB.pFIBDatabaseArc.Execute(s);
//                         FIB.pFIBQueryArc.SQL.Clear;
//                         FIB.pFIBQueryArc.SQL.Add(S);
//                         try
//                            FIB.pFIBQueryArc.ExecQuery;
//                         except
//                            FIB.pFIBTransactionArc.Rollback;
//                            MessageDlg('Ошибка добавления записи в таблицу SHIFR',
//                                     mtInformation, [mbOk], 0);
//                            Exit;
//                         end;
                   end;
              end;
          if FIB.pFIBTransactionArc.InTransaction then
             FIB.pFIBTransactionArc.Commit;
//     FIB.FIBSQLLoggerArc.SaveLog;

          MessageDlg('Таблица статей заполнена '+
                     IntToStr(ShifrList.Count)+' записями',
                      mtInformation, [mbOk], 0);
     end;
{ ********************************************* }
{ *   Перенос справочника кадров в FireBird   * }
{ ********************************************* }

   procedure ExportKadry;
     var I,J,K,IdCode:Integer;
         S:String;
         KadryClarion:TKadryClarion;
     begin
        KadryClarion:=TKadryClarion.Create('CKADRY.DAT');
        if not Assigned(KadryClarion) then
            begin
                MessageDlg('Ошибка открытия таблицы KADRY.DAT',
                       mtInformation, [mbOk], 0);
                Exit;
            end;
        KadryClarion.FillKadryList;
        KadryClarion.Free;

          try
             FIB.pFIBDatabaseSal.Connected := True;
          except
             MessageDlg('Ошибка открытия базы данных',
                       mtInformation, [mbOk], 0);
             Exit;
          end;
          FIB.pFIBTransactionSAL.StartTransaction;
          FIB.pFIBQuery.SQL.Clear;
          FIB.pFIBQuery.SQL.Add('DELETE FROM KADRY');
          try
             FIB.pFIBQuery.ExecQuery;
          except
             FIB.pFIBTransactionSAL.Rollback;
             MessageDlg('Ошибка чистки таблицы KADRY',
                       mtInformation, [mbOk], 0);
             Exit;
          end;
          for i:=1 to KadryList.Count do
               begin
                    IdCode:=0;
                    if length(PKadryRec(KadryList.Items[i-1])^.NalCode)=10 then
                       begin
                            Val(PKadryRec(KadryList.Items[i-1])^.NalCode,K,J);
                            if J=0 then IdCode:=K;
                       end;
                    S:='INSERT INTO KADRY (TABNO,FIO,NAL_CODE,SHIFR_POD) VALUES ('+
                        IntToStr(PKadryRec(KadryList.Items[i-1])^.Tabno)+','''+
                        Trim(PKadryRec(KadryList.Items[i-1])^.Fio)+''','+
                        IntToStr(IdCode)+','+
                        IntToStr(PKadryRec(KadryList.Items[i-1])^.WorkPlace)+')';
                     FIB.pFIBQuery.SQL.Clear;
                     FIB.pFIBQuery.SQL.Add(S);
                     try
                        FIB.pFIBQuery.ExecQuery;
                     except
                          FIB.pFIBTransactionSAL.Rollback;
                          MessageDlg('Ошибка добавления записи в таблицу KADRY',
                                      mtInformation, [mbOk], 0);
                          FIB.pFIBDatabaseSal.Connected := False;
                          Exit;
                     end;
               end;
          FIB.pFIBTransactionSAL.Commit;
          MessageDlg('Таблица KADRY заполнена '+
                     IntToStr(KadryList.Count)+' записями',
                      mtInformation, [mbOk], 0);
          FIB.pFIBDatabaseSal.Connected := False;
     end;


   procedure UpdateKadry;
     var I:Integer;
         KadryClarion : TKadryClarion;
         KadryKprClarion : TKadryKprClarion;
         dp,mp,yp,du,mu,yu : Integer;
     procedure GetDatePU(tabno:integer);
      var i:Integer;

      begin
           dp:=0;
           mp:=0;
           yp:=0;
           du:=0;
           mu:=0;
           yu:=0;
           if KadryKprList.Count>0 then
              for i:=0 to KadryKprList.Count-1 do
                  if PKadryKprRec(KadryKprList.Items[i])^.Tabno=tabno then
                     begin
                          dp:=PKadryKprRec(KadryKprList.Items[i])^.dp;
                          mp:=PKadryKprRec(KadryKprList.Items[i])^.mp;
                          yp:=PKadryKprRec(KadryKprList.Items[i])^.yp;
                          du:=PKadryKprRec(KadryKprList.Items[i])^.du;
                          mu:=PKadryKprRec(KadryKprList.Items[i])^.mu;
                          yu:=PKadryKprRec(KadryKprList.Items[i])^.yu;
                          Break;
                     end;
      end;
     begin
        if not YesNo('Перенести кадры из старой зарплаты в новую?') then Exit;
        KadryClarion:=TKadryClarion.Create('CKADRY.DAT');
        if not Assigned(KadryClarion) then
            begin
                MessageDlg('Ошибка открытия таблицы KADRY.DAT',
                       mtInformation, [mbOk], 0);
                Exit;
            end;
        KadryClarion.FillKadryList;
        KadryClarion.Free;
        KadryKprClarion:=TKadryKprClarion.Create('KPR.DAT');
        if not Assigned(KadryKprClarion) then
            begin
                MessageDlg('Ошибка открытия таблицы KPR.DAT',
                       mtInformation, [mbOk], 0);
                Exit;
            end;
        KadryKprClarion.FillKadryKprList;
        KadryKprClarion.Free;
{
          try
             FIB.pFIBDatabaseSal.Connected := True;
          except
             MessageDlg('Ошибка открытия базы данных',
                       mtInformation, [mbOk], 0);
             Exit;
          end;
}
          FIB.pFIBTransactionSAL.StartTransaction;
          FIB.pFIBStoredProcCom.StoredProcName:='INSERT_KADRY';
          FIB.pFIBTransactionArc.StartTransaction;
          FIB.pFIBStoredProcComArc.StoredProcName:='INSERT_KADRY';
          FormToSQL.Gauge3.MaxValue:=KadryList.Count;
          FormToSQL.Gauge3.MinValue:=0;
          FormToSQL.Gauge3.Progress:=0;
          FormToSQL.Label3.Caption:='';
          FormToSQL.Label3.ReFresh;
          FormToSQL.Label3.RePaint;
          Application.ProcessMessages;
          for i:=1 to KadryList.Count do
               begin
{
                    if PKadryRec(KadryList.Items[i-1])^.Tabno=277 then
                       IdCode:=0;
                    IdCode:=0;

                    if length(PKadryRec(KadryList.Items[i-1])^.NalCode)=10 then
                       begin
                            S:=Trim(PKadryRec(KadryList.Items[i-1])^.NalCode);
                            Val(S,K,J);
                            if J=0 then IdCode:=K;
                       end;
}
                     PKadryRec(KadryList.Items[i-1])^.Fio:=ConvertUkrStrToSql(PKadryRec(KadryList.Items[i-1])^.Fio);
                     PKadryRec(KadryList.Items[i-1])^.NalCode:=trim(PKadryRec(KadryList.Items[i-1])^.NalCode);
                     if length(PKadryRec(KadryList.Items[i-1])^.NalCode)>10 then
                        PKadryRec(KadryList.Items[i-1])^.NalCode:=copy(PKadryRec(KadryList.Items[i-1])^.NalCode,1,10);
                     GetDatePU(PKadryRec(KadryList.Items[i-1])^.Tabno);

                     FormToSQL.Gauge3.Progress:=i;
                     FormToSQL.Label3.Caption:=Trim(PKadryRec(KadryList.Items[i-1])^.Fio);
                     FormToSQL.Label3.ReFresh;
                     FormToSQL.Label3.RePaint;
                     Application.ProcessMessages;
                     FIB.pFIBStoredProcCom.Params[0].AsInteger := PKadryRec(KadryList.Items[i-1])^.Tabno;
                     FIB.pFIBStoredProcCom.Params[1].AsString  := Trim(PKadryRec(KadryList.Items[i-1])^.Fio);
                     FIB.pFIBStoredProcCom.Params[2].AsString  := PKadryRec(KadryList.Items[i-1])^.NalCode;
                     FIB.pFIBStoredProcCom.Params[3].AsInteger := PKadryRec(KadryList.Items[i-1])^.WorkPlace;
                     FIB.pFIBStoredProcCom.Params[4].AsInteger := dp;
                     FIB.pFIBStoredProcCom.Params[5].AsInteger := mp;
                     FIB.pFIBStoredProcCom.Params[6].AsInteger := yp;
                     FIB.pFIBStoredProcCom.Params[7].AsInteger := du;
                     FIB.pFIBStoredProcCom.Params[8].AsInteger := mu;
                     FIB.pFIBStoredProcCom.Params[9].AsInteger := yu;
                     FIB.pFIBStoredProcCom.Prepare;
                     try
                        FIB.pFIBStoredProcCom.ExecProc;
                     except
                           ShowMessage('Ошибка обновления записи KADRY ');
                     end;
                     FIB.pFIBStoredProcComArc.Params[0].AsInteger := PKadryRec(KadryList.Items[i-1])^.Tabno;
                     FIB.pFIBStoredProcComArc.Params[1].AsString  := Trim(PKadryRec(KadryList.Items[i-1])^.Fio);
                     FIB.pFIBStoredProcComArc.Params[2].AsString  := PKadryRec(KadryList.Items[i-1])^.NalCode;
                     FIB.pFIBStoredProcComArc.Params[3].AsInteger := PKadryRec(KadryList.Items[i-1])^.WorkPlace;
                     FIB.pFIBStoredProcComArc.Prepare;
                     FIB.pFIBStoredProcComArc.Params[4].AsInteger := dp;
                     FIB.pFIBStoredProcComArc.Params[5].AsInteger := mp;
                     FIB.pFIBStoredProcComArc.Params[6].AsInteger := yp;
                     FIB.pFIBStoredProcComArc.Params[7].AsInteger := du;
                     FIB.pFIBStoredProcComArc.Params[8].AsInteger := mu;
                     FIB.pFIBStoredProcComArc.Params[9].AsInteger := yu;
                     try
                        FIB.pFIBStoredProcComArc.ExecProc;
                     except
                           ShowMessage('Ошибка обновления записи KADRY ');
                     end;
               end;
          FIB.pFIBTransactionSAL.Commit;
          FIB.pFIBTransactionArc.Commit;
          ShowMessage('Таблица KADRY обновлена ');
     end;

   procedure UpdateKprForKadry;
     var I:Integer;
         KadryClarion : TKadryClarion;

     begin
        KadryClarion:=TKadryClarion.Create('CKADRY.DAT');
        if not Assigned(KadryClarion) then
            begin
                MessageDlg('Ошибка открытия таблицы KADRY.DAT',
                       mtInformation, [mbOk], 0);
                Exit;
            end;
        KadryClarion.FillKadryList;
        KadryClarion.Free;
{
          try
             FIB.pFIBDatabaseSal.Connected := True;
          except
             MessageDlg('Ошибка открытия базы данных',
                       mtInformation, [mbOk], 0);
             Exit;
          end;
}
          FIB.pFIBTransactionSAL.StartTransaction;
          FIB.pFIBStoredProcCom.StoredProcName:='INSERT_KADRY';
          FIB.pFIBTransactionArc.StartTransaction;
          FIB.pFIBStoredProcComArc.StoredProcName:='INSERT_KADRY';
          FormToSQL.Gauge3.MaxValue:=KadryList.Count;
          FormToSQL.Gauge3.MinValue:=0;
          FormToSQL.Gauge3.Progress:=0;
          FormToSQL.Label3.Caption:='';
          FormToSQL.Label3.ReFresh;
          FormToSQL.Label3.RePaint;
          Application.ProcessMessages;
          for i:=1 to KadryList.Count do
               begin
{
                    if PKadryRec(KadryList.Items[i-1])^.Tabno=277 then
                       IdCode:=0;
                    IdCode:=0;

                    if length(PKadryRec(KadryList.Items[i-1])^.NalCode)=10 then
                       begin
                            S:=Trim(PKadryRec(KadryList.Items[i-1])^.NalCode);
                            Val(S,K,J);
                            if J=0 then IdCode:=K;
                       end;
}
                     PKadryRec(KadryList.Items[i-1])^.Fio:=ConvertUkrStrToSql(PKadryRec(KadryList.Items[i-1])^.Fio);
                     PKadryRec(KadryList.Items[i-1])^.NalCode:=trim(PKadryRec(KadryList.Items[i-1])^.NalCode);
                     if length(PKadryRec(KadryList.Items[i-1])^.NalCode)>10 then
                        PKadryRec(KadryList.Items[i-1])^.NalCode:=copy(PKadryRec(KadryList.Items[i-1])^.NalCode,1,10);
                     FormToSQL.Gauge3.Progress:=i;
                     FormToSQL.Label3.Caption:=Trim(PKadryRec(KadryList.Items[i-1])^.Fio);
                     FormToSQL.Label3.ReFresh;
                     FormToSQL.Label3.RePaint;
                     Application.ProcessMessages;
                     FIB.pFIBStoredProcCom.Params[0].AsInteger := PKadryRec(KadryList.Items[i-1])^.Tabno;
                     FIB.pFIBStoredProcCom.Params[1].AsString  := Trim(PKadryRec(KadryList.Items[i-1])^.Fio);
                     FIB.pFIBStoredProcCom.Params[2].AsString  := PKadryRec(KadryList.Items[i-1])^.NalCode;
                     FIB.pFIBStoredProcCom.Params[3].AsInteger := PKadryRec(KadryList.Items[i-1])^.WorkPlace;
                     FIB.pFIBStoredProcCom.Prepare;
                     try
                        FIB.pFIBStoredProcCom.ExecProc;
                     except
                           ShowMessage('Ошибка обновления записи KADRY ');
                     end;
                     FIB.pFIBStoredProcComArc.Params[0].AsInteger := PKadryRec(KadryList.Items[i-1])^.Tabno;
                     FIB.pFIBStoredProcComArc.Params[1].AsString  := Trim(PKadryRec(KadryList.Items[i-1])^.Fio);
                     FIB.pFIBStoredProcComArc.Params[2].AsString  := PKadryRec(KadryList.Items[i-1])^.NalCode;
                     FIB.pFIBStoredProcComArc.Params[3].AsInteger := PKadryRec(KadryList.Items[i-1])^.WorkPlace;
                     FIB.pFIBStoredProcComArc.Prepare;
                     try
                        FIB.pFIBStoredProcComArc.ExecProc;
                     except
                           ShowMessage('Ошибка обновления записи KADRY ');
                     end;
               end;
          FIB.pFIBTransactionSAL.Commit;
          FIB.pFIBTransactionArc.Commit;
          ShowMessage('Таблица KADRY обновлена ');
     end;

  procedure Delete_All_Podr(DateFr:TDateTime;DateTo:TDateTime;ModeArc:boolean);
    var YFR,MFR,YTO,MTO:integer;
    begin
          YTO:=YearOf(DateTo);
          YFR:=YearOf(DateFr);
          MTO:=MonthOf(DateTo);
          MFR:=MonthOf(DateFr);
          if not FIB.pFIBQuery.Transaction.Active then
             FIB.pFIBQuery.Transaction.StartTransaction;

          FIB.pFIBQuery.SQL.Clear;
          FIB.pFIBQuery.SQL.Add('EXECUTE PROCEDURE DEL_ALL_PODR '+
                                 IntToStr(YFR)+','+
                                 IntToStr(MFR)+','+
                                 IntToStr(YTO)+','+
                                 IntToStr(MTO));
          try
             FIB.pFIBQuery.ExecQuery;
             FIB.pFIBQuery.Close;
          except
             FIB.pFIBQuery.Transaction.Rollback;
             MessageDlg('Ошибка чистки данных по сотрудниками',
                         mtInformation, [mbOk], 0);
             Exit;
          end;
          if FIB.pFIBQuery.Transaction.Active then
             FIB.pFIBQuery.Transaction.Commit;

    end;

  procedure putPersonToSQL(personId:integer;Curr_person:Person_ptr;DstMode:TDstMode;YearZa,MonthZa:integer);
   var Curr_Add        : Add_ptr;
       Curr_Ud         : ud_ptr;
       Curr_cn         : cn_ptr;
       S,C,s1          : String;
       SS              : AnsiString;
       I               : INTEGER;
       Dev             : text;
       SQLStmt         : string;
       GUIDS           : string;
       v               : Variant;
       i1              : Integer;
   procedure TestPersonInKadry;
    var I:integer;
        C,C1:String;
        SQLStmnt:string;
        v:Variant;
    begin
          SQLStmnt:='SELECT count(*) from KADRY WHERE TABNO='+IntToStr(Curr_Person^.Tabno);
          if DstMode=salarcDstMode then
             v:=FIB.pFIBDatabaseArc.QueryValue(SQLStmnt,0)
          else
             v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
          i:=v;
//          if FIB.pFIBQuery.Open then
//             FIB.pFIBQuery.Close;
//          FIB.pFIBQuery.SQL.Clear;
//          SQLStmt:='SELECT count(*) from KADRY WHERE TABNO='+IntToStr(Curr_Person^.Tabno);
//          FIB.pFIBQuery.SQL.Add(SQLStmt);
//          FIB.pFIBQuery.ExecQuery;
//          I:=FIB.pFIBQuery.Fields[0].AsInteger;
//          FIB.pFIBQuery.Close;
          if i>0 then Exit;
//          FIB.pFIBQuery.SQL.Clear;
          C:=ReplQuot(Curr_Person^.Fio);
          if Length(C)=0 then C:=' ';
          C1:=CURR_PERSON^.NAL_CODE;
          if Length(Trim(C1))=0 then C1:=' ';
          C1:=trim(ReplQuot(C1));
          SQLStmt:='INSERT INTO KADRY (TABNO,NAL_CODE,FIO) VALUES ('+IntToStr(Curr_Person^.Tabno)+',';
          SQLStmt:=SQLStmt+''''+C1+''','''+C+''')';
//          FIB.pFIBQuery.SQL.Add(SQLStmt);
//          FIB.pFIBQuery.ExecQuery;
//          FIB.pFIBQuery.Close;
          if DstMode=salarcDstMode then
             v:=FIB.pFIBDatabaseArc.Execute(SQLStmnt)
          else
             v:=FIB.pFIBDatabaseSal.Execute(SQLStmnt);

    end;
   begin
                  TestPersonInKadry;
                  FIB.pFIBQuery.SQL.Clear;
                  SQLStmt:='INSERT INTO PERSON';
                  case DstMode of
                   tmpDstMode:
                     SQLStmt:='INSERT INTO TB_TMP_PERSON';
                   currDstMode:
                     SQLStmt:='INSERT INTO TB_C_PERSON';
                  end;
                  S:=trim(SQLStmt)+' (SHIFRID,TABNO,FIO,DOLG,'+
                                         'MONTHVY,YEARVY,W_R,'+
                                         'SHIFRGRU,SHIFRKAT,M_O_R,'+
                                         'N_TEMY,WID_OPLATY,MODE,FROMPODR,'+
                                         'PODOH,MALO,PROF,MAIN,STATE,'+
                                         'AUTOMATIC,START_DAY,PENS,BANK,'+
                                         'NAL_CODE,OKLAD,W_PLACE,RAZRJAD) VALUES(';
                   SS:=S;
                   FIB.pFIBQuery.SQL.Add(S);
                   S:=IntToStr(PersonId)+',';
                   FIB.pFIBQuery.SQL.Add(S);                {1}
                   SS:=TRIM(SS)+S;
                   S:=IntToStr(CURR_PERSON^.TABNO)+',''';
                   FIB.pFIBQuery.SQL.Add(S);                {2}
                   SS:=TRIM(SS)+S;
                   C:=Trim(CURR_PERSON^.FIO);
                   if Length(Trim(C))=0 then C:=' ';
                   C:=ReplQuot(C);
                   S:=C+''',''';
                   FIB.pFIBQuery.SQL.Add(S);                {3}
                   SS:=TRIM(SS)+S;
                   C:=Trim(CURR_PERSON^.DOLG);
                   if Length(Trim(C))=0 then C:=' ';
                   C:=ReplQuot(C);
                   S:=C+''',';
                   FIB.pFIBQuery.SQL.Add(S);                {4}
                   SS:=TRIM(SS)+S;
                   {  2-я строка  }
                   S:=IntToStr(NMES)+',';
                   FIB.pFIBQuery.SQL.Add(S);                {5}
                   SS:=TRIM(SS)+S;
                   S:=IntToStr(CurrYear)+',';
                   FIB.pFIBQuery.SQL.Add(S);                {6}
                   SS:=TRIM(SS)+S;
                   S:=IntToStr(CURR_PERSON^.WID_RABOTY)+',';
                   FIB.pFIBQuery.SQL.Add(S);                {7}
                   SS:=TRIM(SS)+S;
                   {  3-я строка  }
                   S:=IntToStr(CURR_PERSON^.GRUPPA)+',';
                   SS:=TRIM(SS)+S;
                   FIB.pFIBQuery.SQL.Add(S);                {8}
                   S:=IntToStr(CURR_PERSON^.KATEGORIJA)+',';
                   SS:=TRIM(SS)+S;
                   FIB.pFIBQuery.SQL.Add(S);                {9}
                   S:=IntToStr(CURR_PERSON^.MESTO_OSN_RABOTY)+',''';
                   SS:=TRIM(SS)+S;
                   FIB.pFIBQuery.SQL.Add(S);                {10}
                   {  4-я строка  }
                   C:=Trim(CURR_PERSON^.N_TEMY);
                   if Length(Trim(C))=0 then C:=' ';
                   C:=ReplQuot(C);
                   S:=C+''',';
                   FIB.pFIBQuery.SQL.Add(S);                {11}
                   SS:=TRIM(SS)+S;
                   S:=IntToStr(CURR_PERSON^.WID_OPLATY)+',';
                   FIB.pFIBQuery.SQL.Add(S);                {12}
                   SS:=TRIM(SS)+S;
                   S:=IntToStr(CURR_PERSON^.Mode)+',';
                   FIB.pFIBQuery.SQL.Add(S);                {13}
                   SS:=TRIM(SS)+S;
                   S:=IntToStr(CURR_PERSON^.FROM)+',';
                   FIB.pFIBQuery.SQL.Add(S);                {14}
                   SS:=TRIM(SS)+S;
                   {  5-я строка  }
                   S:=IntToStr(CURR_PERSON^.PODOH)+',';
                   FIB.pFIBQuery.SQL.Add(S);                {15}
                   SS:=TRIM(SS)+S;
                   i:=Curr_Person^.Malo;
                   if i<0 then I:=256-I;
                   S:=IntToStr(I)+',';
                   FIB.pFIBQuery.SQL.Add(S);                {16}
                   SS:=TRIM(SS)+S;
                   S:=IntToStr(CURR_PERSON^.PROFSOJUZ)+',';
                   FIB.pFIBQuery.SQL.Add(S);                {17}
                   SS:=TRIM(SS)+S;
                   S:=IntToStr(CURR_PERSON^.MAIN)+',';
                   FIB.pFIBQuery.SQL.Add(S);                {18}
                   SS:=TRIM(SS)+S;
                   S:=IntToStr(CURR_PERSON^.STATE)+',';
                   FIB.pFIBQuery.SQL.Add(S);                {19}
                   SS:=TRIM(SS)+S;
                   {  6-я строка  }
                   S:=IntToStr(CURR_PERSON^.AUTOMATIC)+',';
                   FIB.pFIBQuery.SQL.Add(S);                {20}
                   SS:=TRIM(SS)+S;
                   S:=IntToStr(CURR_PERSON^.START_DAY)+',';
                   FIB.pFIBQuery.SQL.Add(S);                {21}
                   SS:=TRIM(SS)+S;
                   S:=IntToStr(CURR_PERSON^.PENS)+',';
                   FIB.pFIBQuery.SQL.Add(S);                {22}
                   SS:=TRIM(SS)+S;
                   S:=IntToStr(CURR_PERSON^.BANK)+',''';
                   FIB.pFIBQuery.SQL.Add(S);                {23}
                   SS:=TRIM(SS)+S;
                   {  7-я строка  }
                   C:=CURR_PERSON^.NAL_CODE;
                   if Length(Trim(C))=0 then C:=' ';
                   C:=ReplQuot(C);
                   S:=Trim(C)+''',';
                   FIB.pFIBQuery.SQL.Add(S);                {24}
                   SS:=TRIM(SS)+S;
                   S:=FormatFloatPoint(CURR_PERSON^.Oklad)+',';
                   FIB.pFIBQuery.SQL.Add(S);                {25}
                   SS:=TRIM(SS)+S;
                   S:=IntToStr(SHIFR_SERV(NSRV))+',';
                   FIB.pFIBQuery.SQL.Add(S);                {26}
                   SS:=TRIM(SS)+S;
                   S:=IntToStr(GetRazrjadPerson(Curr_Person))+')';
                   FIB.pFIBQuery.SQL.Add(S);                {27}
                   SS:=TRIM(SS)+S;
                   FIB.pFIBQuery.SQL.Clear;
                   FIB.pFIBQuery.SQL.Add(SS);
                   if NeedLogIb then
                      begin
                            Assign(Dev,'p.txt');
                            ReWrite(Dev);
                            writeln(Dev,SS);
                            Close(Dev);
                      end;
                   if dstMode=tmpDstMode then
                      begin
                           SQLStmt:='SELECT count(*) from tb_tmp_person';
                           v:=SQLQueryValue(SQLStmt);
                           i1:=getVariantInteger(v);
                      end;

                   try
               //        ss:=FIB.pFIBQuery.Database.DBFileName;
                       if FIB.pFIBQuery.Database.Connected then
                       FIB.pFIBQuery.ExecQuery;
                   except
                       FIB.pFIBQuery.Transaction.Rollback;
                       MessageDlg('Ошибка вставки в таблицу PERSON '+trim(intToStr(curr_person^.tabno))+' '+trim(curr_person^.FIO)+' '+trim(curr_person^.dolg),
                        mtInformation, [mbOk], 0);
                       Exit;
                   end;

                   if dstMode=tmpDstMode then
                      begin
                           SQLStmt:='SELECT count(*) from tb_tmp_person';
                           v:=SQLQueryValue(SQLStmt);
                           i1:=getVariantInteger(v);
                      end;


                   { 1 - начисления }
                  SQLStmt:='INSERT INTO FADD';
                  case DstMode of
                   tmpDstMode:
                      SQLStmt:='INSERT INTO TB_TMP_FADD';
                   currDstMode:
                      SQLStmt:='INSERT INTO TB_C_FADD';
                  end;
                   CURR_ADD:=CURR_PERSON^.ADD;
                   WHILE CURR_ADD<>NIL DO
                      BEGIN
                           if Curr_Add^.Shifr=0 then
                              begin
                                   Curr_Add:=Curr_Add^.Next;
                                   continue;
                              end;
                           if curr_add^.year<5 then I:=CURRYEAR
                                               else I:=curr_add^.year+1990;
      //                     if (TmpMode=1) and ((i<>YearZa) or (Curr_Add^.Period<>MonthZa)) then
      //                        begin
      //                             Curr_Add:=Curr_Add^.Next;
      //                             continue;
      //                        end;

                           if Curr_Add^.Shifr > SHIFT_SHIFR then
                              Curr_Add^.Shifr := Curr_Add^.Shifr - SHIFT_SHIFR;
                           S:=trim(SQLStmt)+' (SHIFRIDPERSON,TABNO,'+
                              'W_PLACE,W_R,SHIFRGRU,SHIFRKAT,SHIFRSTA,'+
                              'MONTH_ZA,YEAR_ZA,MONTH_VY,YEAR_VY,SUMMA,'+
                              'WDAY,WCLOCK,FOND,VYPL,SCH) VALUES(';
                           S:=Trim(S)+IntToStr(PersonId)+',';
                           S:=Trim(S)+IntToStr(Curr_Person^.TABNO)+',';
                           S:=Trim(S)+IntToStr(SHIFR_SERV(NSRV))+',';
                           S:=Trim(S)+IntToStr(Curr_Person^.WID_RABOTY)+',';
                           S:=Trim(S)+IntToStr(Curr_Person^.GRUPPA)+',';
                           S:=Trim(S)+IntToStr(Curr_Person^.Kategorija)+',';
                           S:=Trim(S)+IntToStr(Curr_Add^.Shifr)+',';
                           S:=Trim(S)+IntToStr(Curr_Add^.Period)+',';
                           if curr_add^.year<5 then I:=CURRYEAR
                                               else I:=curr_add^.year+1990;
                           S:=Trim(S)+IntToStr(I)+',';
                           S:=Trim(S)+IntToStr(NMES)+',';
                           S:=Trim(S)+IntToStr(CurrYear)+',';
                           S:=Trim(S)+FormatFloatPoint(Curr_Add^.Summa)+',';
                           S:=Trim(S)+IntToStr(Curr_Add^.Work_Day)+',';
                           S:=Trim(S)+FormatFloatPoint(roundto(Curr_Add^.Work_Clock,-2))+',';
                           if abs(Curr_Add^.FMP)>0 then I:=1
                           else if abs(Curr_Add^.FZP)>0 then I:=2
                                                        else I:=3;
                           S:=Trim(S)+IntToStr(I)+',';
                           S:=Trim(S)+IntToStr(Curr_Add^.Vyplacheno)+',''';
                           C:=Curr_Add^.Count;
                           if Length(Trim(C))=0 then C:=' ';
                           C:=ReplQuot(C);
                           S:=Trim(S)+Trim(C)+''')';
                           if NeedLogIb then
                              begin
                                    Assign(Dev,'A.txt');
                                    ReWrite(Dev);
                                    writeln(Dev,S);
                                    Close(Dev);
                              end;
                           FIB.pFIBQuery.SQL.Clear;
                           FIB.pFIBQuery.SQL.Add(S);
                           try
                              FIB.pFIBQuery.ExecQuery;
                           except
                              FIB.pFIBTransactionSAL.Rollback;
                              MessageDlg('Ошибка встаки в таблицу FADD',
                                  mtInformation, [mbOk], 0);
                              Exit;
                           end;
                           CURR_ADD:=CURR_ADD^.NEXT;
                      END;
                   { 2 - удержания }
                  SQLStmt:='INSERT INTO FUD';
                  case DstMode of
                   tmpDstMode:
                       SQLStmt:='INSERT INTO TB_TMP_FUD';
                   currDstMode:
                       SQLStmt:='INSERT INTO TB_C_FUD';
                  end;
                   CURR_UD:=CURR_PERSON^.UD;
                   WHILE CURR_UD<>NIL DO
                      BEGIN
                           if Curr_Ud^.Shifr=0 then
                              begin
                                   Curr_Ud:=Curr_Ud^.Next;
                                   continue;
                              end;

                           if curr_ud^.year<5 then I:=CURRYEAR
                                              else I:=curr_ud^.year+1990;
      //                     if (TmpMode=1) and ((i<>YearZa) or (Curr_Ud^.Period<>MonthZa)) then
      //                        begin
      //                             Curr_Ud:=Curr_Ud^.Next;
      //                             continue;
      //                        end;

                           S:=Trim(SQLStmt)+' (SHIFRIDPERSON,TABNO,'+
                              'W_PLACE,W_R,SHIFRGRU,SHIFRKAT,SHIFRSTA,'+
                              'MONTH_ZA,YEAR_ZA,MONTH_VY,YEAR_VY,SUMMA,'+
                              'VYPL,SCH) VALUES(';
                           S:=Trim(S)+IntToStr(PersonId)+',';
                           S:=Trim(S)+IntToStr(Curr_Person^.TABNO)+',';
                           S:=Trim(S)+IntToStr(SHIFR_SERV(NSRV))+',';
                           S:=Trim(S)+IntToStr(Curr_Person^.WID_RABOTY)+',';
                           S:=Trim(S)+IntToStr(Curr_Person^.GRUPPA)+',';
                           S:=Trim(S)+IntToStr(Curr_Person^.Kategorija)+',';
                           S:=Trim(S)+IntToStr(Curr_Ud^.Shifr)+',';
                           S:=Trim(S)+IntToStr(Curr_Ud^.Period)+',';
                           if Curr_Ud^.year<5 then I:=CURRYEAR
                                               else I:=Curr_Ud^.year+1990;
                           S:=Trim(S)+IntToStr(I)+',';
                           S:=Trim(S)+IntToStr(NMES)+',';
                           S:=Trim(S)+IntToStr(CurrYear)+',';
                           S:=Trim(S)+FormatFloatPoint(Curr_Ud^.Summa)+',';
                           S:=Trim(S)+IntToStr(Curr_Ud^.Vyplacheno)+',''';
                           C:=Curr_Ud^.Count;
                           if Length(Trim(C))=0 then C:=' ';
                           C:=ReplQuot(C);
                           S:=Trim(S)+Trim(C)+''')';


                           if NeedLogIb then
                              begin
                                   Assign(Dev,'U.txt');
                                   ReWrite(Dev);
                                   writeln(Dev,S);
                                   Close(Dev);
                              end;
                           FIB.pFIBQuery.SQL.Clear;
                           FIB.pFIBQuery.SQL.Add(S);
                           try
                              FIB.pFIBQuery.ExecQuery;
                           except
                              FIB.pFIBTransactionSAL.Rollback;
                              MessageDlg('Ошибка встаки в таблицу FADD',
                                  mtInformation, [mbOk], 0);
                              if DstMode=salarcDstMode then
                                 begin
                                      FIB.pFIBTransactionSAL.ReplaceDatabase(FIB.pFIBDatabaseArc,FIB.pFIBDatabaseSal);
                                      FIB.pFIBQuery.DataBase := FIB.pFIBDatabaseSal;
                                 end;
                              Exit;
                           end;
                           CURR_UD:=CURR_UD^.NEXT;
                      END;
                   { 3 - постоянная информация }
                  SQLStmt:='INSERT INTO FCN';
                  case DstMode of
                   tmpDstMode:
                        SQLStmt:='INSERT INTO TB_TMP_FCN';
                   currDstMode:
                        SQLStmt:='INSERT INTO TB_C_FCN';
                  end;
                   CURR_CN:=CURR_PERSON^.CN;
                   WHILE CURR_CN<>NIL DO
                      BEGIN
                           S:=Trim(SQLStmt)+' (SHIFRIDPERSON,TABNO,'+
                              'W_PLACE,W_R,SHIFRGRU,SHIFRKAT,SHIFRSTA,'+
                              'MONTH_VY,YEAR_VY,KOD,SUMMA,'+
                              'PRIM,PRIM_1,SCH,FLOW_SUMMA,LIMIT_SUMMA,AUTOMATIC,ID,DEJA_COUNTED) VALUES(';
                           S:=Trim(S)+IntToStr(PersonId)+',';
                           S:=Trim(S)+IntToStr(Curr_Person^.TABNO)+',';
                           S:=Trim(S)+IntToStr(SHIFR_SERV(NSRV))+',';
                           S:=Trim(S)+IntToStr(Curr_Person^.WID_RABOTY)+',';
                           S:=Trim(S)+IntToStr(Curr_Person^.GRUPPA)+',';
                           S:=Trim(S)+IntToStr(Curr_Person^.Kategorija)+',';
                           S:=Trim(S)+IntToStr(Curr_Cn^.Shifr)+',';
                           S:=Trim(S)+IntToStr(NMES)+',';
                           S:=Trim(S)+IntToStr(CurrYear)+',';
                           S:=Trim(S)+IntToStr(Curr_Cn^.Kod)+',';
                           if isLNR then
                              if curr_cn^.shifr=koef_oklad_shifr+LIMIT_CN_BASE then
                                 begin
                                      s1:=FloatToStrF(Curr_Cn^.Summa,ffFixed,6,4);
                                      s1:=ReplChar(s1,',','.');
                                      S:=Trim(S)+s1+',';
                                 end
                              else
                                 S:=Trim(S)+FormatFloatPoint(Curr_Cn^.Summa)+','
                           else
                             S:=Trim(S)+FormatFloatPoint(Curr_Cn^.Summa)+',';
                           S:=Trim(S)+IntToStr(Curr_Cn^.Prim)+',''';
                           if (Curr_CN^.Shifr=GUIDShifr+Limit_Cn_Base) then
                              begin
                                   GuidS:=FormatGUID(Curr_Cn^.Prim_1,Curr_Cn^.SUmma,Curr_Cn^.Flow_Summa,Curr_Cn^.Limit_Summa);
                                   S:=Trim(S)+Trim(GuidS)+''',''';
                              end
                           else
                              begin
                                   C:=Curr_Cn^.Prim_1;
                                   if Length(Trim(C))=0 then C:=' ';
                                   C:=ReplQuot(C);
                                   S:=Trim(S)+Trim(Curr_Cn^.Prim_1)+''',''';
                              end;
                           C:=Curr_Cn^.Count;
                           if Length(Trim(C))=0 then C:=' ';
                           C:=ReplQuot(C);
                           S:=Trim(S)+Trim(Curr_Cn^.Count)+''',';
                           if (Curr_Cn^.Flow_Summa>1000000000) or (Curr_Cn^.Flow_Summa<-0.01) then
                              Curr_Cn^.Flow_Summa:=0;
                           if (Curr_Cn^.Limit_Summa>1000000000) or (Curr_Cn^.Limit_Summa<-0.01) then
                              Curr_Cn^.Limit_Summa:=0;
                           S:=Trim(S)+FormatFloatPoint(Curr_Cn^.Flow_Summa)+',';
                           S:=Trim(S)+FormatFloatPoint(Curr_Cn^.Limit_Summa)+',';
                           S:=Trim(S)+IntToStr(Curr_Cn^.Automatic)+',';
                           S:=Trim(S)+IntToStr(Curr_Cn^.Id)+',';
                           S:=Trim(S)+IntToStr(Curr_Cn^.DEJA_COUNTED)+')';

                           if NeedLogIb then
                              begin
                                   Assign(Dev,'C.txt');
                                   ReWrite(Dev);
                                   writeln(Dev,S);
                                   Close(Dev);
                              end;
                           FIB.pFIBQuery.SQL.Clear;
                           FIB.pFIBQuery.SQL.Add(S);
                           try
                              FIB.pFIBQuery.ExecQuery;
                           except
                             on e:Exception do
                                begin
                              FIB.pFIBTransactionSAL.Rollback;
                              MessageDlg('Ошибка вставки в таблицу FCN '+e.message,
                                  mtInformation, [mbOk], 0);
                              if DstMode=salarcDstMode then
                                 begin
                                      FIB.pFIBTransactionSAL.ReplaceDatabase(FIB.pFIBDatabaseArc,FIB.pFIBDatabaseSal);
                                      FIB.pFIBQuery.DataBase := FIB.pFIBDatabaseSal;
                                 end;
                              Exit;
                              end;
                           end;
                           CURR_CN:=CURR_CN^.NEXT;
                      END;

                   { 4 Табель }
                     SQLStmt:='INSERT INTO TABEL';
                     case DstMode of
                      tmpDstMode:
                          SQLStmt:='INSERT INTO TB_TMP_TABEL';
                      currDstMode:
                          SQLStmt:='INSERT INTO TB_C_TABEL';
                     end;
                   for i:=1 to 31 do
                       begin
                          S:=Trim(SQLStmt)+' (ShifrId,DayNo,Code) values(';
                          S:=trim(s)+IntToStr(PersonId)+','+IntToStr(I)+','+IntToStr(Curr_Person^.Tabel[I])+')';
                          if NeedLogIb then
                             begin
                                  Assign(Dev,'T.txt');
                                  ReWrite(Dev);
                                  writeln(Dev,S);
                                  Close(Dev);
                             end;
                          FIB.pFIBQuery.SQL.Clear;
                          FIB.pFIBQuery.SQL.Add(S);
                          try
                             FIB.pFIBQuery.ExecQuery;
                          except
                             FIB.pFIBTransactionSAL.Rollback;
                             MessageDlg('Ошибка вставки в таблицу TABEL',
                                 mtInformation, [mbOk], 0);
                             if DstMode=salarcDstMode then
                                begin
                                     FIB.pFIBTransactionSAL.ReplaceDatabase(FIB.pFIBDatabaseArc,FIB.pFIBDatabaseSal);
                                     FIB.pFIBQuery.DataBase := FIB.pFIBDatabaseSal;
                                end;
                             Exit;
                          end;
                       end;

   end; { конец процедуры put person_to_sql}

  procedure PutToSQL(NeedClear:boolean;DstMode:TDstMode);
   const F='######0.00';
   var PersonId,I      : integer;
       CURR_PERSON     : PERSON_PTR;
       I_COUNT         : INTEGER;
   begin
{
          try
             FIB.pFIBDatabaseSal.Connected := True;
          except
             MessageDlg('Ошибка открытия базы данных',
                       mtInformation, [mbOk], 0);
             Exit;
          end;
}
{
          if not FIB.pFIBTransactionSAL.InTransaction then
             FIB.pFIBTransactionSAL.StartTransaction;
}             
{  Проверить количество данных для возможной чистки }
{          if NeedClear then}
{
             begin
                  FIB.pFIBQuery.SQL.Clear;
                  FIB.pFIBQuery.SQL.Add('SELECT COUNT(*) FROM PERSON WHERE MONTHVY='+
                                 IntToStr(NMES)+' AND YEARVY='+
                                 IntToStr(CurrYear)+' AND W_PLACE='+IntToStr(NSRV));
                  try
                     FIB.pFIBQuery.ExecQuery;
                     I:=FIB.pFIBQuery.Fields[0].AsInteger;
                     FIB.pFIBQuery.Close;
                  except
                     FIB.pFIBTransactionSAL.Rollback;
                     MessageDlg('Ошибка COUNT(*)  PERSON для проверки наличия дубликатов',
                                 mtInformation, [mbOk], 0);
                     Exit;
                  end;

                  if i>0 then NeedClear:=true
                         else NeedClear:=false;
             end;
}
  { Очистка данных }
{
          if NeedClear then
             begin
                  FIB.pFIBQuery.SQL.Clear;
                  FIB.pFIBQuery.SQL.Add('DELETE FROM PERSON WHERE MONTHVY='+
                                 IntToStr(NMES)+' AND YEARVY='+
                                 IntToStr(CurrYear)+' AND W_PLACE='+IntToStr(NSRV));
                  try
                     FIB.pFIBQuery.ExecQuery;
                  except
                     FIB.pFIBTransactionSAL.Rollback;
                     MessageDlg('Ошибка чистки таблицы PERSON',
                                 mtInformation, [mbOk], 0);
                     if ModeArc then
                        begin
                             FIB.pFIBTransactionSAL.ReplaceDatabase(FIB.pFIBDatabaseArc,FIB.pFIBDatabaseSal);
                             FIB.pFIBQuery.DataBase := FIB.pFIBDatabaseSal;
                        end;
                     Exit;
                  end;
             end;
}
{
          FIB.pFIBQuery.SQL.Clear;
          FIB.pFIBQuery.SQL.Add('SELECT COUNT(*) FROM PERSON');
          try
             FIB.pFIBQuery.ExecQuery;
             I:=FIB.pFIBQuery.Fields[0].AsInteger;
             FIB.pFIBQuery.Close;
          except
             FIB.pFIBTransactionSAL.Rollback;
             MessageDlg('Ошибка COUNT(*)  PERSON',
                       mtInformation, [mbOk], 0);
             Exit;
          end;
}
     //     if NSRV<>93 then Exit;
          if Max_Person_Id>0 then PersonId:=Max_Person_Id
          else
             begin
                  PersonId:=0;
{                  if I>0 then    }
                     begin
                          FormWaitMess.SetMessage('Установка счетчика. Ждите.');
                          FormWaitMess.Show;
                          application.ProcessMessages;
                          FIB.pFIBQuery.SQL.Clear;
                          FIB.pFIBQuery.SQL.Add('SELECT MAX(SHIFRID) FROM PERSON');
                          try
                             FIB.pFIBQuery.ExecQuery;
                             I:=FIB.pFIBQuery.Fields[0].AsInteger;
                             PersonId:=I;
                             FIB.pFIBQuery.Close;
                          except
                             FIB.pFIBTransactionSAL.Rollback;
                             MessageDlg('Ошибка COUNT(*)  PERSON',
                                         mtInformation, [mbOk], 0);
                             Exit;
                          end;
                          FormWaitMess.hide;
                          Application.ProcessMessages;

                     end;
             end;
          FormToSQL.Gauge3.MaxValue:=Count_Person;
          I_COUNT:=0;
          CURR_PERSON:=HEAD_PERSON;
          WHILE CURR_PERSON<>NIL DO
             BEGIN
                  { 0 - сотрудник }
            //      if Curr_Person^.tabno=5814 then
                     begin
                        Inc(I_COUNT);
                        FormToSQL.Gauge3.Progress:=I_COUNT;
                        FormToSQL.Label3.Caption:=Trim(CURR_Person^.FIO)+' '+Trim(Curr_Person^.Dolg);
                        FormToSQL.Label3.ReFresh;
                        FormToSQL.Label3.RePaint;
                        Application.ProcessMessages;
                        PERSONID:=PERSONID+1;
                        MAX_PERSON_ID:=PERSONID;
                        putPersonToSQL(Personid,Curr_Person,DstMode,0,0);
                     end;
                CURR_PERSON:=CURR_PERSON^.NEXT;
             END;
{        FIB.pFIBTransactionSAL.CommitRetaining;}
{
        FIB.pFIBDatabaseSal.Connected := False;
}
   end;

{ **************************************** }
{ *   Перенос больничных в FireBird      * }
{ **************************************** }
 procedure ExportBoln;
  type
       TSummyRec = record
                    SEL       : BYTE;
                    MONTH     : BYTE;
                    SUMMA_BUD :	DOUBLE;
                    SUMMA_VNE :	DOUBLE;
                    SUMMA_GN  :	DOUBLE;
                    SUMMA_NIS :	DOUBLE;
                    OKLAD_M   : DOUBLE;
                    DAY       : BYTE;
                    GRAPHIC_DAY	: BYTE;
                    CLOCK     : DOUBLE;
                    GRAPHIC_CLOCK  : DOUBLE;
                    KOEF      : DOUBLE;
                   end;

       TBolnRec = record
                       SHIFR       : WORD;
                       B_DAY       : BYTE;
                       MONTH_ZA	   : BYTE;
                       YEAR_ZA	   : Word;
                       SUMMA_B_BUD : DOUBLE;
                       SUMMA_B_VNE : DOUBLE;
                       SUMMA_B_GN  : DOUBLE;
                       SUMMA_B_NIS : DOUBLE;
                      end;
       TBolRec = record
                    RecHeader   : TRecHeader;
                    TABNO       : word;
                    NAL_CODE    : ARRAY[1..10] OF CHAR;
                    id          : LongInt;
                    idOwner     : LongInt;
                    Nomer_B     : array[1..10] of char;
                    FIO	        : array[1..20] of char;
                    W_PLACE     : word;
                    SHIFR_KAT   : word;
                    SHIFR_GRU   : word;
                    F_DATA      : longint;
                    F_MONTH     : byte;
                    F_YEAR      : word;
                    L_DATA      : longint;
                    L_MONTH     : byte;
                    L_YEAR      : word;
                    WID_RAB     : byte;
                    DATA_VY     : longint;
                    MONTH_VY    : byte;
                    YEAR_VY     : word;
                    OKLAD       : double;
                    KOL_WO_DAY	: byte;
                    PROCENT     : double;
                    CURR_MODE	  : BYTE;
                    KAT_KOE     : BYTE;
                    SHIFR_STA   : word;
                    SUMMY	: array[1..12] of TSummyRec;
                    SALARY_13	  : DOUBLE;
                    CLOCK_P_DAY	: DOUBLE;
                    GRAPHIC	  : BYTE;
                    MONTH_13	: BYTE;
                    MEAN_MONTH	: DOUBLE;
                    MEAN_DAY	: DOUBLE;
                    MEAN_DAY_BUD: DOUBLE;
                    MEAN_DAY_VNE: DOUBLE;
                    MEAN_DAY_GN : DOUBLE;
                    MEAN_DAY_NIS: DOUBLE;
                    DOUBLE_DAY	: DOUBLE;
                    SUMMA_BOL	: DOUBLE;
                    SUMMA_BOL_B : DOUBLE;
                    SUMMA_BOL_G	: DOUBLE;
                    SUMMA_BOL_V	: DOUBLE;
                    SUMMA_BOL_N	: DOUBLE;
                    DATA_P_BUD  : LongInt;
                    DATA_P_VNE  : LongInt;
                    DATA_P_GN   : LongInt;
                    DATA_P_NIS  : LongInt;
                    MODE_V_Z    : lONGiNT;
                    MODE_ILL    : LongInt;
                    Boln        : array[1..6] of TBolnRec;
                 end;

       TBolaRec = record
                    RecHeader   : TRecHeader;
                    TABNO       : word;
                    W_PLACE     : word;
                    W_R         : byte;
                    gruppa      : byte;
                    kateg       : word;
                    shifr       : word;
                    month_za    : byte;
                    year_za     : word;
                    month_vy    : byte;
                    year_vy     : word;
                    Summa       : Double;
                    Day         : Double;
                    Clock       : Double;
                    Fond        : Byte;
                    Vypl        : Byte;
                    Count       : array[1..8] of char;
                    id          : LongInt;
                    Marked      : byte;
                 end;

     var I:Integer;
         dev    : file;
         fname  : string;
         header : TFileHeader;
         i_word : word;
         finded : boolean;
         BolRec : TBolRec;
         BolaRec : TBolaRec;
         FPos   : LongInt;
         Y,M,D,DOW : integer;
         SS : string;
         S  : AnsiString;
         Work_Y:word;
         ShifrId:Integer;
         I_C:Integer;
     begin
         fname:=CLAR_DIR+'Boln.dat';
         if not FileExist(Fname) then
            begin
                MessageDlg('Отсутствует файл '+Trim(Fname),
                       mtInformation, [mbOk], 0);
                 Exit;
            end;
         Assign(Dev,FName);
         Reset(Dev,1);
         BlockRead(Dev,Header,SizeOf(Header),I);
         if I<>SizeOf(Header) then
            begin
                  MessageDlg(Trim(Fname)+' не файл CLARION',
                       mtInformation, [mbOk], 0);
                  close(dev);
                  Exit;
            end;
         if FileSize(dev)<=Header.OffSet then
            begin
                  MessageDlg(Trim(Fname)+' не файл CLARION_1',
                       mtInformation, [mbOk], 0);
                  close(dev);
                  Exit;
            end;
         Seek(dev,Header.OffSet);
         finded:=false;
          try
             FIB.pFIBDatabaseSal.Connected := True;
          except
             MessageDlg('Ошибка открытия базы данных',
                       mtInformation, [mbOk], 0);
             Exit;
          end;
          FIB.pFIBTransactionSAL.StartTransaction;
          FIB.pFIBQuery.SQL.Clear;
          FIB.pFIBQuery.SQL.Add('DELETE FROM BOLN');
          try
             FIB.pFIBQuery.ExecQuery;
          except
             FIB.pFIBTransactionSAL.Rollback;
             MessageDlg('Ошибка чистки таблицы BOLN',
                       mtInformation, [mbOk], 0);
             Exit;
          end;
          FormToSQL.Gauge3.MaxValue:=Header.NumRecs;
          ShifrId:=0;
          I_C:=0;
          while (not finded) and (not eof(dev)) do
                begin
                      FPOS:=FILEPOS(DEV);
                      blockRead(dev,BolRec,SizeOf(TBolRec),I);
                      if ((I<>SizeOf(TBolRec)) and (I_C<Header.NumRecs-1)) then
                         begin
                             close(dev);
                             MessageDlg('Ошибочная длина записи '+IntToStr(I_C)+' '+IntToStr(Header.NumRecs),
                                         mtInformation, [mbOk], 0);
                             Exit;
                         end;
                      SS:='';
                      for I:=1 to 20 do ss:=ss+BolRec.FIO[i];
                      ss:=DosToWin(SS);
                      Inc(I_C);
                      if I_C=155 then
                         I_C:=I_C;
                      FormToSQL.Gauge3.Progress:=I_C;
                      FormToSQL.Label3.Caption:=IntToStr(I_C)+' '+Trim(SS)+'                     ';
                      FormToSQL.Label3.ReFresh;
                      FormToSQL.Label3.RePaint;
                      Application.ProcessMessages;
                      if (BolRec.RecHeader.Rhd and trDeleted)<>0        then continue;
                      if (BolRec.Month_Vy<1) or (BolRec.Month_Vy>12)    then continue;
                      if (BolRec.Year_Vy<1990) or (BolRec.Year_Vy>2100) then continue;
{                      if (BolRec.w_place>180) or (BolRec.W_Place<1) then continue;}
                      if (BolRec.L_Year<1990) or (BolRec.L_Year>2100)   then continue;
                      if (BolRec.F_Year<1990) or (BolRec.F_Year>2100)   then continue;
                      if (BolRec.L_Month<1) or (BolRec.L_Month>12)      then continue;
                      if (BolRec.F_Month<1) or (BolRec.F_Month>12)      then continue;
                      FormToSQL.Gauge3.Progress:=I_C;
                      FormToSQL.Label3.Caption:=IntToStr(I_C)+' '+Trim(SS)+'                     ';
                      FormToSQL.Label3.ReFresh;
                      FormToSQL.Label3.RePaint;
                      Inc(ShifrId);
                      S:='INSERT INTO BOLN (ShifrId,'+
                                           'TABNO,  NAL_CODE,ID_OWNER,NOMER_B,FIO,'+
                                           'W_PLACE,SHIFRKAT,SHIFRGRU,F_DATA, F_MONTH,'+
                                           'F_YEAR,L_DATA,L_MONTH,L_YEAR,WID_RAB,'+
                                           'DATA_VY, MONTH_VY,YEAR_VY,OKLAD,K_WO_DAY,'+
                                           'PROCENT,KAT_KOE,SHIFR_STA,MEAN_DAY,MEAN_DAY_BUD,';
                       S:=Trim(S)+
                                           'MEAN_DAY_VNE,MEAN_DAY_GN,MEAN_DAY_NIS,DOUBLE_DAY,SUMMA_BOL,'+
                                           'SUMMA_BOL_B, SUMMA_BOL_V,SUMMA_BOL_G,SUMMA_BOL_N,DATA_P_BUD,'+
                                           'DATA_P_VNE,DATA_P_GN,DATA_P_NIS,MODE_V_Z,MODE_ILL,'+
                                           'ID_CLAR) VALUES (';

                      S:=Trim(S)+IntToStr(ShifrId)+',';
                      { 1 строка }
                      S:=Trim(S)+IntToStr(BolRec.Tabno)+',''';
                      SS:='';
                      for I:=1 to 10 do
                          if BolRec.Nal_Code[i] in ['0'..'9'] then ss:=ss+BolRec.Nal_Code[i];
                      S:=Trim(S)+Trim(SS)+''',';
                      S:=Trim(S)+IntToStr(BolRec.IdOwner)+',''';
                      SS:='';
                      for I:=1 to 10 do if BolRec.Nomer_B[i] in ['0'..'9'] then ss:=ss+BolRec.Nomer_B[i];
                      S:=Trim(S)+Trim(SS)+''',''';
                      SS:='';
                      for I:=1 to 20 do ss:=ss+BolRec.FIO[i];
                      ss:=DosToWin(SS);
                      S:=Trim(S)+Trim(SS)+''',';
                      { 2 строка }
                      if BolRec.W_Place=0 then BolRec.W_Place:=82;
                      S:=Trim(S)+IntToStr(BolRec.W_Place)+',';
                      if (BolRec.Shifr_Kat<1) or (BolRec.Shifr_Kat>10) then BolRec.Shifr_Kat:=1;
                      S:=Trim(S)+IntToStr(BolRec.Shifr_Kat)+',';
                      if (BolRec.Shifr_Gru<1) or (BolRec.Shifr_Gru>30) then BolRec.Shifr_Gru:=1;
                      S:=Trim(S)+IntToStr(BolRec.Shifr_Gru)+',';
                      GetClarionDate(Y,M,D,BOLRec.F_Data);
                      S:=Trim(S)+''''+IntToStr(Y)+'-'+IntToStr(M)+'-'+IntToStr(D)+''',';
                      S:=Trim(S)+IntToStr(BolRec.F_MONTH)+',';
                      { 3 строка }
                      S:=Trim(S)+IntToStr(BolRec.F_YEAR)+',';
                      GetClarionDate(Y,M,D,BOLRec.L_Data);
                      S:=Trim(S)+''''+IntToStr(Y)+'-'+IntToStr(M)+'-'+IntToStr(D)+''',';
                      S:=Trim(S)+IntToStr(BolRec.L_MONTH)+',';
                      S:=Trim(S)+IntToStr(BolRec.L_YEAR)+',';
                      S:=Trim(S)+IntToStr(BolRec.WID_RAB)+',';
                      { 4 строка }
                      GetClarionDate(Y,M,D,BOLRec.Data_VY);
                      S:=Trim(S)+''''+IntToStr(Y)+'-'+IntToStr(M)+'-'+IntToStr(D)+''',';
                      S:=Trim(S)+IntToStr(BolRec.MONTH_VY)+',';
                      S:=Trim(S)+IntToStr(BolRec.YEAR_VY)+',';
                      S:=Trim(S)+FormatFloatPoint(BolRec.Oklad)+',';
                      S:=Trim(S)+IntToStr(BolRec.KOL_WO_DAY)+',';
                      { 5 строка }
                      S:=Trim(S)+FormatFloatPoint(BolRec.Procent)+',';
                      S:=Trim(S)+IntToStr(BolRec.Kat_Koe)+',';
                      S:=Trim(S)+IntToStr(BolRec.Shifr_Sta)+',';
                      if abs(BolRec.Mean_Day)>1000 then BolRec.Mean_Day:=0;
                      S:=Trim(S)+FormatFloatPoint(BolRec.Mean_Day)+',';
                      if abs(BolRec.Mean_Day_Bud)>1000 then BolRec.Mean_Day_Bud:=0;
                      S:=Trim(S)+FormatFloatPoint(BolRec.Mean_Day_Bud)+',';
                      { 6 строка }
                      if abs(BolRec.Mean_Day_Vne)>1000 then BolRec.Mean_Day_Vne:=0;
                      S:=Trim(S)+FormatFloatPoint(BolRec.Mean_Day_Vne)+',';
                      if abs(BolRec.Mean_Day_GN)>1000 then BolRec.Mean_Day_GN:=0;
                      S:=Trim(S)+FormatFloatPoint(BolRec.Mean_Day_GN)+',';
                      if abs(BolRec.Mean_Day_NIS)>1000 then BolRec.Mean_Day_NIS:=0;
                      S:=Trim(S)+FormatFloatPoint(BolRec.Mean_Day_NIS)+',';
                      if abs(BolRec.Double_Day)>1000 then BolRec.Double_Day:=0;
                      S:=Trim(S)+FormatFloatPoint(BolRec.Double_Day)+',';
                      S:=Trim(S)+FormatFloatPoint(BolRec.Summa_Bol)+',';
                      { 7 строка }
                      S:=Trim(S)+FormatFloatPoint(BolRec.Summa_Bol_B)+',';
                      S:=Trim(S)+FormatFloatPoint(BolRec.Summa_Bol_V)+',';
                      S:=Trim(S)+FormatFloatPoint(BolRec.Summa_Bol_G)+',';
                      S:=Trim(S)+FormatFloatPoint(BolRec.Summa_Bol_N)+',';
                      GetClarionDate(Y,M,D,BOLRec.Data_P_BUD);
                      if Y<1900 then
                         begin
                               Y:=1900;M:=1;D:=1;
                         end;
                      S:=Trim(S)+''''+IntToStr(Y)+'-'+IntToStr(M)+'-'+IntToStr(D)+''',';
                      { 8 строка }
                      GetClarionDate(Y,M,D,BOLRec.Data_P_VNE);
                      if Y<1900 then
                         begin
                               Y:=1900;M:=1;D:=1;
                         end;
                      S:=Trim(S)+''''+IntToStr(Y)+'-'+IntToStr(M)+'-'+IntToStr(D)+''',';
                      GetClarionDate(Y,M,D,BOLRec.Data_P_GN);
                      if Y<1900 then
                         begin
                               Y:=1900;M:=1;D:=1;
                         end;
                      S:=Trim(S)+''''+IntToStr(Y)+'-'+IntToStr(M)+'-'+IntToStr(D)+''',';
                      GetClarionDate(Y,M,D,BOLRec.Data_P_NIS);
                      if Y<1900 then
                         begin
                               Y:=1900;M:=1;D:=1;
                         end;
                      S:=Trim(S)+''''+IntToStr(Y)+'-'+IntToStr(M)+'-'+IntToStr(D)+''',';
                      S:=Trim(S)+IntToStr(BolRec.Mode_V_Z)+',';
                      S:=Trim(S)+IntToStr(BolRec.Mode_ILL)+',';
                      S:=Trim(S)+IntToStr(BolRec.ID)+')';
                      FIB.pFIBQuery.SQL.Clear;
                      FIB.pFIBQuery.SQL.Add(S);
                      try
                         FIB.pFIBQuery.ExecQuery;
                      except
                          FIB.pFIBTransactionSAL.Rollback;
                          MessageDlg('Ошибка добавления записи в таблицу BOLN',
                                     mtInformation, [mbOk], 0);
                         FIB.pFIBDatabaseSal.Connected := False;
                         Exit;
                      end;

                { Добавление результатов расчета }
                   for i:=1 to 6 do
                       begin
                             if BolRec.Boln[i].Shifr=0    then break;
                             if BolRec.Boln[i].Month_Za=0 then break;
                             if BolRec.Boln[i].Year_Za=0  then break;
                             S:='insert into BOLN_RES (SHIFRIDBOLN,SHIFRSTA,B_DAY,MONTH_ZA,YEAR_ZA,'+
                                 'SUMMA_B_BUD,SUMMA_B_VNE,SUMMA_B_GN,SUMMA_B_NIS) values (';
                             S:=Trim(S)+IntToStr(ShifrId)+',';
                             S:=Trim(S)+IntToStr(BolRec.Boln[i].Shifr)+',';
                             S:=Trim(S)+IntToStr(BolRec.Boln[i].B_Day)+',';
                             S:=Trim(S)+IntToStr(BolRec.Boln[i].Month_Za)+',';
                             S:=Trim(S)+IntToStr(BolRec.Boln[i].Year_Za)+',';
                             S:=Trim(S)+FormatFloatPoint(BolRec.Boln[i].Summa_B_Bud)+',';
                             S:=Trim(S)+FormatFloatPoint(BolRec.Boln[i].Summa_B_Vne)+',';
                             S:=Trim(S)+FormatFloatPoint(BolRec.Boln[i].Summa_B_GN)+',';
                             S:=Trim(S)+FormatFloatPoint(BolRec.Boln[i].Summa_B_NIS)+')';
                             FIB.pFIBQuery.SQL.Clear;
                             FIB.pFIBQuery.SQL.Add(S);
                             try
                                FIB.pFIBQuery.ExecQuery;
                             except
                                FIB.pFIBTransactionSAL.Rollback;
                                MessageDlg('Ошибка добавления записи в таблицу BOLN_RES',
                                            mtInformation, [mbOk], 0);
                                FIB.pFIBDatabaseSal.Connected := False;
                                Exit;
                             end;
                       end;
                { Добавление исходніх данных по месяцам }
                   for i:=1 to 12 do
                       begin
                             if BolRec.Summy[i].Month<1    then break;
                             if BolRec.Summy[i].Month>12   then continue;
                             S:='insert into BOLN_SUMMY (SHIFRIDBOLN,SEL,MONTH_ZA,YEAR_ZA,SUMMA_BUD,'+
                                 'SUMMA_VNE,SUMMA_GN,SUMMA_NIS,OKLAD_M,DAYS,'+
                                 'GRAPHIC_DAY,KOEF) values (';
                             S:=Trim(S)+IntToStr(ShifrId)+',';
                             S:=Trim(S)+IntToStr(BolRec.Summy[i].Sel)+',';
                             S:=Trim(S)+IntToStr(BolRec.Summy[i].Month)+',';
                             if BolRec.Summy[i].Month>BolRec.F_Month then Dec(BolRec.F_Year);
                             S:=Trim(S)+IntToStr(BolRec.F_Year)+',';
                             S:=Trim(S)+FormatFloatPoint(BolRec.Summy[i].Summa_Bud)+',';
                             S:=Trim(S)+FormatFloatPoint(BolRec.Summy[i].Summa_Vne)+',';
                             S:=Trim(S)+FormatFloatPoint(BolRec.Summy[i].Summa_GN)+',';
                             S:=Trim(S)+FormatFloatPoint(BolRec.Summy[i].Summa_NIS)+',';
                             S:=Trim(S)+FormatFloatPoint(BolRec.Summy[i].Oklad_M)+',';
                             S:=Trim(S)+IntToStr(BolRec.Summy[i].Day)+',';
                             S:=Trim(S)+IntToStr(BolRec.Summy[i].Graphic_Day)+',';
                             S:=Trim(S)+FormatFloatPoint(BolRec.Summy[i].Koef)+')';
                             FIB.pFIBQuery.SQL.Clear;
                             FIB.pFIBQuery.SQL.Add(S);
                             try
                                FIB.pFIBQuery.ExecQuery;
                             except
                                FIB.pFIBTransactionSAL.Rollback;
                                MessageDlg('Ошибка добавления записи в таблицу BOLN_SUMMY',
                                            mtInformation, [mbOk], 0);
                                FIB.pFIBDatabaseSal.Connected := False;
                                Exit;
                             end;
                       end;
              end;
             close(dev);
{--------------------BOLA -----------------------}
         fname:=CLAR_DIR+'Bolna.dat';
         if not FileExist(Fname) then
            begin
                MessageDlg('Отсутствует файл '+Trim(Fname),
                       mtInformation, [mbOk], 0);
                 Exit;
            end;
         Assign(Dev,FName);
         Reset(Dev,1);
         BlockRead(Dev,Header,SizeOf(Header),I);
         if I<>SizeOf(Header) then
            begin
                  MessageDlg(Trim(Fname)+' не файл CLARION',
                       mtInformation, [mbOk], 0);
                  close(dev);
                  Exit;
            end;
         if FileSize(dev)<=Header.OffSet then
            begin
                  MessageDlg(Trim(Fname)+' не файл CLARION_1',
                       mtInformation, [mbOk], 0);
                  close(dev);
                  Exit;
            end;
         Seek(dev,Header.OffSet);
         finded:=false;
         FormToSQL.Gauge3.MaxValue:=Header.NumRecs;
         ShifrId:=0;
         I_C:=0;
         while (not finded) and (not eof(dev)) do
                begin
                      FPOS:=FILEPOS(DEV);
                      blockRead(dev,BolaRec,SizeOf(TBolaRec),I);
                      if ((I<>SizeOf(TBolaRec)) and (I_C<Header.NumRecs-1)) then
                         begin
                             close(dev);
                             MessageDlg('Ошибочная длина записи BOLNA'+IntToStr(I_C)+' '+IntToStr(Header.NumRecs),
                                         mtInformation, [mbOk], 0);
                             Exit;
                         end;
                      Inc(I_C);
                      FormToSQL.Gauge3.Progress:=I_C;
                      FormToSQL.Label3.Caption:=IntToStr(I_C)+'                                        ';
                      FormToSQL.Label3.ReFresh;
                      FormToSQL.Label3.RePaint;
                      Application.ProcessMessages;
                      if (BolaRec.RecHeader.Rhd and trDeleted)<>0 then continue;
                      if (BolaRec.Month_Vy<1) or (BolaRec.Month_Vy>12) then continue;
                      if (BolaRec.Year_Vy<1990) or (BolaRec.Year_Vy>2100) then continue;
                      if (BolaRec.Year_Za<1990) or (BolaRec.Year_Za>2100) then continue;
                      if (BolaRec.Month_Za<1) or (BolaRec.Month_Za>12) then continue;
                      Inc(ShifrId);
                      S:='INSERT INTO BOLNA (ShifrIdBoln,'+
                                           'W_PLACE,W_R,SHIFRGRU,SHIFRKAT,SHIFRSTA,'+
                                           'MONTH_ZA,YEAR_ZA,MONTH_VY,YEAR_VY,SUMMA,'+
                                           'VYPL, MARKED,ID_CLAR) VALUES(';
                      S:=Trim(S)+IntToStr(BolaRec.Id)+',';
                      { 1 строка }
                      S:=Trim(S)+IntToStr(BolaRec.W_PLACE)+',';
                      S:=Trim(S)+IntToStr(BolaRec.W_R)+',';
                      S:=Trim(S)+IntToStr(BolaRec.GRUPPA)+',';
                      S:=Trim(S)+IntToStr(BolaRec.KATEG)+',';
                      S:=Trim(S)+IntToStr(BolaRec.SHIFR)+',';
                      S:=Trim(S)+IntToStr(BolaRec.MONTH_ZA)+',';
                      S:=Trim(S)+IntToStr(BolaRec.Year_ZA)+',';
                      S:=Trim(S)+IntToStr(BolaRec.MONTH_VY)+',';
                      S:=Trim(S)+IntToStr(BolaRec.Year_VY)+',';
                      S:=Trim(S)+FormatFloatPoint(BolaRec.Summa)+',';
                      S:=Trim(S)+IntToStr(BolaRec.Vypl)+',';
                      S:=Trim(S)+IntToStr(BolaRec.Marked)+',';
                      S:=Trim(S)+IntToStr(BolaRec.Id)+')';
                      FIB.pFIBQuery.SQL.Clear;
                      FIB.pFIBQuery.SQL.Add(S);
                      try
                         FIB.pFIBQuery.ExecQuery;
                      except
                          FIB.pFIBTransactionSAL.Rollback;
                          MessageDlg('Ошибка добавления записи в таблицу BOLNA',
                                     mtInformation, [mbOk], 0);
                         FIB.pFIBDatabaseSal.Connected := False;
                         Exit;
                      end;
              end;
             close(dev);
{+++++++++++--------------------BOLA -----------------------}
          FIB.pFIBTransactionSAL.Commit;
          MessageDlg('Таблица больничніх заполнена '+
                     IntToStr(I_C)+' записями',
                      mtInformation, [mbOk], 0);
          FIB.pFIBDatabaseSal.Connected := False;
     end;


{ **************************************** }
{ *   Перенос отпускных  в FireBird      * }
{ **************************************** }
 procedure ExportOtp;
  type
       TSummyRec = record
                    SEL       : BYTE;
                    MONTH     : BYTE;
                    SUMMA_BUD :	DOUBLE;
                    SUMMA_VNE :	DOUBLE;
                    SUMMA_GN  :	DOUBLE;
                    SUMMA_NIS :	DOUBLE;
                    OKLAD_M   : DOUBLE;
                    DAY       : BYTE;
                    KOEF    	: REAL;
                    KAL_DAY   : BYTE;
                   end;

       TOtpnRec = record
                       SHIFR       : WORD;
                       O_DAY       : BYTE;
                       MONTH_ZA	   : BYTE;
                       YEAR_ZA	   : Word;
                       SUMMA_O_BUD : DOUBLE;
                       SUMMA_O_VNE : DOUBLE;
                       SUMMA_O_GN  : DOUBLE;
                       SUMMA_O_NIS : DOUBLE;
                      end;
       TOtpRec = record
                    RecHeader   : TRecHeader;
                    TABNO       : word;
                    id          : LongInt;
                    idOwner     : LongInt;
                    FIO	        : array[1..20] of char;
                    W_PLACE     : word;
                    SHIFR_KAT   : word;
                    SHIFR_GRU   : word;
                    F_DATA      : longint;
                    F_DAY       : byte;
                    F_MONTH     : byte;
                    F_YEAR      : word;
                    L_DATA      : longint;
                    L_DAY       : byte;
                    L_MONTH     : byte;
                    L_YEAR      : word;
                    DATA_VY     : longint;
                    MONTH_VY    : byte;
                    YEAR_VY     : word;
                    OKLAD       : double;
                    OKLAD_OLD   : double;
                    ITOG_O_DAY	: byte;
                    SHIFR_STA   : word;
                    DOLG      	: array[1..20] of char;
                    SUMMY	      : array[1..12] of TSummyRec;
                    MEAN_MONTH  : DOUBLE;
                    MEAN_DAY_BUD: DOUBLE;
                    MEAN_DAY_VNE: DOUBLE;
                    MEAN_DAY_GN : DOUBLE;
                    MEAN_DAY_NIS: DOUBLE;
                    ITOGO_BUD  	: DOUBLE;
                    ITOGO_VNE 	: DOUBLE;
                    ITOGO_GN  	: DOUBLE;
                    ITOGO_NIS  	: DOUBLE;
                    ITOGO     	: DOUBLE;
                    ITOGO_DAY  	: LONGINT;
                    ITOGO_O_BUD	: DOUBLE;
                    ITOGO_O_VNE	: DOUBLE;
                    ITOGO_O_GN	: DOUBLE;
                    ITOGO_O_NIS	: DOUBLE;
                    ITOGO_O   	: DOUBLE;
                    OTPUSKN     : array[1..4] of TOtpNRec;
                    Mark        : byte;
                    Data_Pere	  : array[1..10] of char;
                 end;

       TOtpaRec = record
                    RecHeader   : TRecHeader;
                    TABNO       : word;
                    W_PLACE     : byte;
                    W_R         : byte;
                    gruppa      : byte;
                    kateg       : byte;
                    shifr       : byte;
                    month_za    : byte;
                    year_za     : word;
                    month_vy    : byte;
                    year_vy     : word;
                    Summa       : Double;
                    Day         : Double;
                    Clock       : Double;
                    Fond        : Byte;
                    Vypl        : Byte;
                    Count       : array[1..8] of char;
                    id          : LongInt;
                    Month_Ras   : byte;
                    Sel         : LongInt;
                 end;

     var I:Integer;
         dev    : file;
         fname  : string;
         header : TFileHeader;
         i_word : word;
         finded : boolean;
         OtpRec : TOtpRec;
         OtpaRec : TOtpaRec;
         FPos   : LongInt;
         Y,M,D,DOW : integer;
         SS : string;
         S  : AnsiString;
         Work_Y:word;
         ShifrId:Integer;
         I_C:Integer;
         DevT:Text;
         I_Trans:Integer;
     begin

         fname:=CLAR_DIR+'Otpusk.dat';
         if not FileExist(Fname) then
            begin
                MessageDlg('Отсутствует файл '+Trim(Fname),
                       mtInformation, [mbOk], 0);
                 Exit;
            end;
         Assign(Dev,FName);
         Reset(Dev,1);
         BlockRead(Dev,Header,SizeOf(Header),I);
         if I<>SizeOf(Header) then
            begin
                  MessageDlg(Trim(Fname)+' не файл CLARION',
                       mtInformation, [mbOk], 0);
                  close(dev);
                  Exit;
            end;
         if FileSize(dev)<=Header.OffSet then
            begin
                  MessageDlg(Trim(Fname)+' не файл CLARION_1',
                       mtInformation, [mbOk], 0);
                  close(dev);
                  Exit;
            end;
         Seek(dev,Header.OffSet);
         finded:=false;
          try
             FIB.pFIBDatabaseSal.Connected := True;
          except
             MessageDlg('Ошибка открытия базы данных',
                       mtInformation, [mbOk], 0);
             Exit;
          end;
          FIB.pFIBTransactionSAL.StartTransaction;
          FIB.pFIBQuery.SQL.Clear;
          FIB.pFIBQuery.SQL.Add('DELETE FROM OTPUSKA');
          try
             FIB.pFIBQuery.ExecQuery;
          except
             FIB.pFIBTransactionSAL.Rollback;
             MessageDlg('Ошибка чистки таблицы OTPUSKA',
                       mtInformation, [mbOk], 0);
             Exit;
          end;
          FormToSQL.Gauge3.MaxValue:=Header.NumRecs;
          ShifrId:=0;
          I_C:=0;
          while (not finded) and (not eof(dev)) do
                begin
                      FPOS:=FILEPOS(DEV);
                      blockRead(dev,OtpRec,SizeOf(TOtpRec),I);
                      if ((I<>SizeOf(TOtpRec)) and (I_C<Header.NumRecs-1)) then
                         begin
                             close(dev);
                             MessageDlg('Ошибочная длина записи '+IntToStr(I_C)+' '+IntToStr(Header.NumRecs),
                                         mtInformation, [mbOk], 0);
                             Exit;
                         end;
                      SS:='';
                      for I:=1 to 20 do ss:=ss+OtpRec.FIO[i];
                      ss:=DosToWin(SS);
                      Inc(I_C);
                      if I_C=155 then
                         I_C:=I_C;
                      FormToSQL.Gauge3.Progress:=I_C;
                      FormToSQL.Label3.Caption:=IntToStr(I_C)+' '+Trim(SS)+'                     ';
                      FormToSQL.Label3.ReFresh;
                      FormToSQL.Label3.RePaint;

                      if (OtpRec.RecHeader.Rhd and trDeleted)<>0 then continue;
                      if (OtpRec.Month_Vy<1) or (OtpRec.Month_Vy>12) then continue;
                      if (OtpRec.Year_Vy<1990) or (OtpRec.Year_Vy>2100) then continue;
{                      if (BolRec.w_place>180) or (BolRec.W_Place<1) then continue;}
                      if (OtpRec.L_Year<1990) or (OtpRec.L_Year>2100) then continue;
                      if (OtpRec.F_Year<1990) or (OtpRec.F_Year>2100) then continue;
                      if (OtpRec.L_Month<1) or (OtpRec.L_Month>12) then continue;
                      if (OtpRec.F_Month<1) or (OtpRec.F_Month>12) then continue;
                      FormToSQL.Gauge3.Progress:=I_C;
                      FormToSQL.Label3.Caption:=IntToStr(I_C)+' '+Trim(SS)+'                     ';
                      FormToSQL.Label3.ReFresh;
                      FormToSQL.Label3.RePaint;
                      Inc(ShifrId);
                      S:='INSERT INTO OTPUSKA (ShifrId,'+
                                           'TABNO,FIO,W_PLACE,SHIFRKAT,SHIFRGRU,'+
                                           'F_DATA,F_DAY, F_MONTH,F_YEAR,L_DATA,'+
                                           'L_DAY,L_MONTH,L_YEAR,DATA_VY,MONTH_VY,'+
                                           'YEAR_VY,OKLAD,ITOGO_O_DAY,SHIFRSTA,DOLG,'+
                                           'MEAN_DAY_BUD,MEAN_DAY_VNE,MEAN_DAY_GN,MEAN_DAY_NIS,ITOGO_BUD,';
                       S:=Trim(S)+
                                           'ITOGO_VNE,ITOGO_GN,ITOGO_NIS,ITOGO,ITOGO_DAY,'+
                                           'ITOGO_O_BUD,ITOGO_O_VNE,ITOGO_O_GN,ITOGO_O_NIS,ITOGO_O,'+
                                           'MARK,DATA_PERE,ID_CLAR) VALUES (';


                      S:=Trim(S)+IntToStr(ShifrId)+',';
                      { 1 строка }
                      S:=Trim(S)+IntToStr(OtpRec.Tabno)+',''';
                      SS:='';
                      for I:=1 to 20 do ss:=ss+OtpRec.FIO[i];
                      ss:=DosToWin(SS);
                      S:=Trim(S)+Trim(SS)+''',';
                      if OtpRec.W_Place=0 then OtpRec.W_Place:=82;
                      S:=Trim(S)+IntToStr(OtpRec.W_Place)+',';
                      if (OtpRec.Shifr_Kat<1) or (OtpRec.Shifr_Kat>10) then OtpRec.Shifr_Kat:=1;
                      S:=Trim(S)+IntToStr(OtpRec.Shifr_Kat)+',';
                      if (OtpRec.Shifr_Gru<1) or (OtpRec.Shifr_Gru>30) then OtpRec.Shifr_Gru:=1;
                      S:=Trim(S)+IntToStr(OtpRec.Shifr_Gru)+',';
                      { 2 строка }
                      GetClarionDate(Y,M,D,OtpRec.F_Data);
                      S:=Trim(S)+''''+IntToStr(Y)+'-'+IntToStr(M)+'-'+IntToStr(D)+''',';
                      S:=Trim(S)+IntToStr(OtpRec.F_DAY)+',';
                      S:=Trim(S)+IntToStr(OtpRec.F_MONTH)+',';
                      S:=Trim(S)+IntToStr(OtpRec.F_YEAR)+',';
                      GetClarionDate(Y,M,D,OtpRec.L_Data);
                      S:=Trim(S)+''''+IntToStr(Y)+'-'+IntToStr(M)+'-'+IntToStr(D)+''',';
                      { 3 строка }
                      S:=Trim(S)+IntToStr(OtpRec.L_DAY)+',';
                      S:=Trim(S)+IntToStr(OtpRec.L_MONTH)+',';
                      S:=Trim(S)+IntToStr(OtpRec.L_YEAR)+',';
                      GetClarionDate(Y,M,D,OtpRec.Data_Vy);
                      S:=Trim(S)+''''+IntToStr(Y)+'-'+IntToStr(M)+'-'+IntToStr(D)+''',';
                      S:=Trim(S)+IntToStr(OtpRec.Month_Vy)+',';
                      { 4 строка }
                      S:=Trim(S)+IntToStr(OtpRec.Year_Vy)+',';
                      S:=Trim(S)+FormatFloatPoint(OtpRec.Oklad)+',';
                      S:=Trim(S)+FormatFloatPoint(OtpRec.Itog_O_Day)+',';
                      S:=Trim(S)+IntToStr(OtpRec.Shifr_Sta)+',';
                      SS:='';
                      for I:=1 to 20 do ss:=ss+OtpRec.Dolg[i];
                      ss:=DosToWin(SS);
                      S:=Trim(S)+''''+Trim(SS)+''',';
                      { 5 строка }
                      S:=Trim(S)+FormatFloatPoint(OtpRec.Mean_Day_Bud)+',';
                      S:=Trim(S)+FormatFloatPoint(OtpRec.Mean_Day_Vne)+',';
                      S:=Trim(S)+FormatFloatPoint(OtpRec.Mean_Day_Gn)+',';
                      S:=Trim(S)+FormatFloatPoint(OtpRec.Mean_Day_NIS)+',';
                      S:=Trim(S)+FormatFloatPoint(OtpRec.Itogo_Bud)+',';
                      { 6 строка }
                      S:=Trim(S)+FormatFloatPoint(OtpRec.Itogo_Vne)+',';
                      S:=Trim(S)+FormatFloatPoint(OtpRec.Itogo_Gn)+',';
                      S:=Trim(S)+FormatFloatPoint(OtpRec.Itogo_Nis)+',';
                      S:=Trim(S)+FormatFloatPoint(OtpRec.Itogo)+',';
                      S:=Trim(S)+IntToStr(OtpRec.Itogo_Day)+',';
                      { 7 строка }
                      S:=Trim(S)+FormatFloatPoint(OtpRec.Itogo_O_Bud)+',';
                      S:=Trim(S)+FormatFloatPoint(OtpRec.Itogo_O_Vne)+',';
                      S:=Trim(S)+FormatFloatPoint(OtpRec.Itogo_O_GN)+',';
                      S:=Trim(S)+FormatFloatPoint(OtpRec.Itogo_O_NIS)+',';
                      S:=Trim(S)+FormatFloatPoint(OtpRec.Itogo_O)+',';
                      { 7 строка }
                      S:=Trim(S)+IntToStr(OtpRec.Mark)+',';
                      if pos('0',trim(OtpRec.Data_Pere))=1 then
                         S:=Trim(S)+'''1900-01-01'','
                                                           else
                         S:=Trim(S)+''''+trim(OtpRec.Data_Pere)+''',';
                      S:=Trim(S)+IntToStr(OtpRec.Id)+')';
{
                      Assign(DevT,'s.txt');
                      Rewrite(DevT);
                      writeln(DevT,S);
                      close(DevT);
}
                      FIB.pFIBQuery.SQL.Clear;
                      FIB.pFIBQuery.SQL.Add(S);
                      try
                         FIB.pFIBQuery.ExecQuery;
                      except
                          FIB.pFIBTransactionSAL.Rollback;
                          MessageDlg('Ошибка добавления записи в таблицу OTPUSKA',
                                     mtInformation, [mbOk], 0);
                         FIB.pFIBDatabaseSal.Connected := False;
                         Exit;
                      end;

                { Добавление результатов расчета }
                   for i:=1 to 4 do
                       begin
                             if OtpRec.OTPUSKN[i].Shifr=0    then break;
                             if OtpRec.OTPUSKN[i].Month_Za=0 then break;
                             if OtpRec.OTPUSKN[i].Year_Za=0  then break;

                             S:='insert into OTP_RES (SHIFRIDOTP,SHIFRSTA,O_DAY,MONTH_ZA,YEAR_ZA,'+
                                 'SUMMA_O_BUD,SUMMA_O_VNE,SUMMA_O_GN,SUMMA_O_NIS) values (';
                             S:=Trim(S)+IntToStr(ShifrId)+',';
                             S:=Trim(S)+IntToStr(OtpRec.OTPUSKN[i].Shifr)+',';
                             S:=Trim(S)+IntToStr(OtpRec.OTPUSKN[i].O_Day)+',';
                             S:=Trim(S)+IntToStr(OtpRec.OTPUSKN[i].Month_Za)+',';
                             S:=Trim(S)+IntToStr(OtpRec.OTPUSKN[i].Year_Za)+',';
                             S:=Trim(S)+FormatFloatPoint(OtpRec.OTPUSKN[i].Summa_O_Bud)+',';
                             S:=Trim(S)+FormatFloatPoint(OtpRec.OTPUSKN[i].Summa_O_Vne)+',';
                             S:=Trim(S)+FormatFloatPoint(OtpRec.OTPUSKN[i].Summa_O_GN)+',';
                             S:=Trim(S)+FormatFloatPoint(OtpRec.OTPUSKN[i].Summa_O_NIS)+')';

                             FIB.pFIBQuery.SQL.Clear;
                             FIB.pFIBQuery.SQL.Add(S);
                             try
                                FIB.pFIBQuery.ExecQuery;
                             except
                                FIB.pFIBTransactionSAL.Rollback;
                                MessageDlg('Ошибка добавления записи в таблицу OTP_RES',
                                            mtInformation, [mbOk], 0);
                                FIB.pFIBDatabaseSal.Connected := False;
                                Exit;
                             end;
                       end;
                { Добавление исходніх данных по месяцам }
                   for i:=1 to 12 do
                       begin
                             if OtpRec.Summy[i].Month<1    then break;
                             if OtpRec.Summy[i].Month>12   then continue;
                             S:='insert into OTP_SUMMY (SHIFRIDOTP,SEL,MONTH_ZA,YEAR_ZA,SUMMA_BUD,'+
                                 'SUMMA_VNE,SUMMA_GN,SUMMA_NIS,OKLAD_M,DAY_WORK,KOEF,DAY_KALEND'+
                                 ') values (';
                             S:=Trim(S)+IntToStr(ShifrId)+',';
                             S:=Trim(S)+IntToStr(OtpRec.Summy[i].Sel)+',';
                             S:=Trim(S)+IntToStr(OtpRec.Summy[i].Month)+',';
                             if OtpRec.Summy[i].Month<OtpRec.F_Month then Inc(OtpRec.F_Year);
                             S:=Trim(S)+IntToStr(OtpRec.F_Year)+',';
                             S:=Trim(S)+FormatFloatPoint(OtpRec.Summy[i].Summa_Bud)+',';
                             S:=Trim(S)+FormatFloatPoint(OtpRec.Summy[i].Summa_Vne)+',';
                             S:=Trim(S)+FormatFloatPoint(OtpRec.Summy[i].Summa_GN)+',';
                             S:=Trim(S)+FormatFloatPoint(OtpRec.Summy[i].Summa_NIS)+',';
                             S:=Trim(S)+FormatFloatPoint(OtpRec.Summy[i].Oklad_M)+',';
                             S:=Trim(S)+IntToStr(OtpRec.Summy[i].Day)+',';
                             S:=Trim(S)+FormatFloatPoint(OtpRec.Summy[i].Koef)+',';
                             S:=Trim(S)+IntToStr(OtpRec.Summy[i].Kal_Day)+')';
                             FIB.pFIBQuery.SQL.Clear;
                             FIB.pFIBQuery.SQL.Add(S);
                             try
                                FIB.pFIBQuery.ExecQuery;
                             except
                                FIB.pFIBTransactionSAL.Rollback;
                                MessageDlg('Ошибка добавления записи в таблицу OTP_SUMMY',
                                            mtInformation, [mbOk], 0);
                                FIB.pFIBDatabaseSal.Connected := False;
                                Exit;
                             end;
                       end;
              end;
             close(dev);
          FIB.pFIBTransactionSAL.Commit;

          FIB.pFIBTransactionSAL.StartTransaction;

{--------------------OTP_ADD -----------------------}
         fname:=CLAR_DIR+'OTP_ADD.dat';
         if not FileExist(Fname) then
            begin
                MessageDlg('Отсутствует файл '+Trim(Fname),
                       mtInformation, [mbOk], 0);
                 Exit;
            end;
         Assign(Dev,FName);
         Reset(Dev,1);
         BlockRead(Dev,Header,SizeOf(Header),I);
         if I<>SizeOf(Header) then
            begin
                  MessageDlg(Trim(Fname)+' не файл CLARION Otp_Add',
                       mtInformation, [mbOk], 0);
                  close(dev);
                  Exit;
            end;
         if FileSize(dev)<=Header.OffSet then
            begin
                  MessageDlg(Trim(Fname)+' не файл CLARION_1 Otp_Add',
                       mtInformation, [mbOk], 0);
                  close(dev);
                  Exit;
            end;
         Seek(dev,Header.OffSet);
         finded:=false;
         FormToSQL.Gauge3.MaxValue:=Header.NumRecs;
         ShifrId:=0;
         I_C:=0;
         I_Trans:=0;
         while (not finded) and (not eof(dev)) do
                begin
                      Inc(I_Trans);
                      if I_Trans mod 1000 =0 then
                         begin
                              FIB.pFIBTransactionSAL.Commit;
                              FIB.pFIBTransactionSAL.StartTransaction;
                         end;
                      FPOS:=FILEPOS(DEV);
                      blockRead(dev,OtpaRec,SizeOf(TOtpaRec),I);
                      if ((I<>SizeOf(TOtpaRec)) and (I_C<Header.NumRecs-1)) then
                         begin
                             close(dev);
                             MessageDlg('Ошибочная длина записи OTP_ADD'+IntToStr(I_C)+' '+IntToStr(Header.NumRecs),
                                         mtInformation, [mbOk], 0);
                             Exit;
                         end;
                      Inc(I_C);
                      FormToSQL.Gauge3.Progress:=I_C;
                      FormToSQL.Label3.Caption:=IntToStr(I_C)+'                                        ';
                      FormToSQL.Label3.ReFresh;
                      FormToSQL.Label3.RePaint;

                      if (OtpaRec.RecHeader.Rhd and trDeleted)<>0 then continue;
                      if (OtpaRec.Month_Vy<1) or (OtpaRec.Month_Vy>12) then continue;
                      if (OtpaRec.Year_Vy<1990) or (OtpaRec.Year_Vy>2100) then continue;
                      if (OtpaRec.Year_Za<1990) or (OtpaRec.Year_Za>2100) then continue;
                      if (OtpaRec.Month_Za<1) or (OtpaRec.Month_Za>12) then continue;
                      Inc(ShifrId);
                      S:='INSERT INTO OTP_ADD (ShifrIdOtp,'+
                                           'W_PLACE,SHIFRGRU,SHIFRKAT,SHIFRSTA,'+
                                           'MONTH_ZA,YEAR_ZA,MONTH_VY,YEAR_VY,SUMMA,'+
                                           'DAYS,FOND,VYPL,SEL,ID_CLAR) VALUES(';
                      S:=Trim(S)+IntToStr(OtpaRec.Id)+',';
                      { 1 строка }
                      if ((OtpaRec.W_PLACE<1) or (OtpaRec.W_PLACE>169)) then OtpaRec.W_PLACE:=82;
                      S:=Trim(S)+IntToStr(OtpaRec.W_PLACE)+',';
                      if ((OtpaRec.Gruppa<1) or (OtpaRec.Gruppa>50)) then OtpaRec.Gruppa:=1;
                      S:=Trim(S)+IntToStr(OtpaRec.GRUPPA)+',';
                      if ((OtpaRec.KATEG<1) or (OtpaRec.KATEG>10)) then OtpaRec.KATEG:=1;
                      S:=Trim(S)+IntToStr(OtpaRec.KATEG)+',';
                      if ((OtpaRec.SHIFR<1) or (OtpaRec.SHIFR>10)) then OtpaRec.SHIFR:=150;
                      S:=Trim(S)+IntToStr(OtpaRec.SHIFR)+',';
                      if ((OtpaRec.MONTH_ZA<1) or (OtpaRec.MONTH_ZA>12)) then OtpaRec.MONTH_ZA:=1;
                      S:=Trim(S)+IntToStr(OtpaRec.MONTH_ZA)+',';
                      if ((OtpaRec.YEAR_ZA<1991) or (OtpaRec.YEAR_ZA>2005)) then OtpaRec.YEAR_ZA:=2001;
                      S:=Trim(S)+IntToStr(OtpaRec.Year_ZA)+',';
                      if ((OtpaRec.MONTH_VY<1) or (OtpaRec.MONTH_VY>12)) then OtpaRec.MONTH_VY:=1;
                      S:=Trim(S)+IntToStr(OtpaRec.MONTH_VY)+',';
                      if ((OtpaRec.YEAR_VY<1991) or (OtpaRec.YEAR_VY>2005)) then OtpaRec.YEAR_VY:=2001;
                      S:=Trim(S)+IntToStr(OtpaRec.Year_VY)+',';
                      if ((OtpaRec.Summa<-100000) or (OtpaRec.Summa>100000)) then OtpaRec.Summa:=0;
                      S:=Trim(S)+FormatFloatPoint(OtpaRec.Summa)+',';
                      if ((OtpaRec.Day<0) or (OtpaRec.Day>100)) then OtpaRec.Day:=0;
                      S:=Trim(S)+FormatFloatPoint(OtpaRec.Day)+',';
                      if ((OtpaRec.Fond<0) or (OtpaRec.Fond>100)) then OtpaRec.Fond:=1;
                      S:=Trim(S)+IntToStr(OtpaRec.Fond)+',';
                      if ((OtpaRec.Vypl<0) or (OtpaRec.Vypl>1)) then OtpaRec.Vypl:=1;
                      S:=Trim(S)+IntToStr(OtpaRec.Vypl)+',';
                      if ((OtpaRec.Sel<0) or (OtpaRec.Sel>1)) then OtpaRec.Sel:=1;
                      S:=Trim(S)+IntToStr(OtpaRec.Sel)+',';
                      S:=Trim(S)+IntToStr(OtpaRec.Id)+')';

                      FIB.pFIBQuery.SQL.Clear;
                      FIB.pFIBQuery.SQL.Add(S);
                      try
                         FIB.pFIBQuery.ExecQuery;
                      except
                          FIB.pFIBTransactionSAL.Rollback;
                          MessageDlg('Ошибка добавления записи в таблицу OTP_ADD',
                                     mtInformation, [mbOk], 0);
                         FIB.pFIBDatabaseSal.Connected := False;
                         Exit;
                      end;
              end;
             close(dev);
{+++++++++++-------------------- OTP_ADD -----------------------}
          FIB.pFIBTransactionSAL.Commit;
          MessageDlg('Таблица отпускных заполнена '+
                     IntToStr(I_C)+' записями',
                      mtInformation, [mbOk], 0);
          FIB.pFIBDatabaseSal.Connected := False;
     end;

    FUNCTION UpdateDolg:BOOLEAN;
      VAR
         I        : integer;
         SHIFRDOL : integer;
         NAME     : STRING;
         Razr     : integer;
         Oklad    : double;
      BEGIN
        if not YesNo('Перенести список должностей из старой программы в новую (обновить)?') then Exit;
        UpdateDolg  := FALSE;
        FIB.pFIBStoredProcCom.Transaction.StartTransaction;
        FIB.pFIBStoredProcComArc.Transaction.StartTransaction;
        FIB.pFIBStoredProcCom.StoredProcName:='INSERT_DOLG';
        FIB.pFIBStoredProcComArc.StoredProcName:='INSERT_DOLG';
        for i:=0 to NAMEDolgLIST.Count-1 do
          begin
               ShifrDol := PDolgRec(NameDolgList.Items[i])^.Shifr;
               NAME     := PDolgRec(NameDolgList.Items[i])^.Name;
               Razr     := PDolgRec(NameDolgList.Items[i])^.Razr;
               Oklad    := PDolgRec(NameDolgList.Items[i])^.Oklad;
               FIB.pFIBStoredProcCom.Params[0].AsInteger := ShifrDol;
               FIB.pFIBStoredProcCom.Params[1].AsString  := Name;
               FIB.pFIBStoredProcCom.Params[2].AsInteger := Razr;
               FIB.pFIBStoredProcCom.Params[3].AsFloat   := Oklad;
               FIB.pFIBStoredProcCom.Prepare;
               try
                   FIB.pFIBStoredProcCom.ExecProc;
               except
               end;
               FIB.pFIBStoredProcComArc.Params[0].AsInteger := ShifrDol;
               FIB.pFIBStoredProcComArc.Params[1].AsString  := Name;
               FIB.pFIBStoredProcComArc.Params[2].AsInteger := Razr;
               FIB.pFIBStoredProcComArc.Params[3].AsFloat   := Oklad;
               FIB.pFIBStoredProcComArc.Prepare;
               try
                   FIB.pFIBStoredProcComArc.ExecProc;
               except
               end;

          end;

        FIB.pFIBStoredProcCom.Transaction.Commit;
        FIB.pFIBStoredProcComArc.Transaction.Commit;
        UpdateDolg  := true;
        FormWaitMess.SetMessage('Обновлено');
        FormWaitMess.Show;
        repeat
              Application.ProcessMessages;
        until FormWaitMess.Timer1.Enabled=false;
        FormWaitMess.Hide;

     END;

{ **************************************** }
{ *   Перенос календарей    в FireBird   * }
{ **************************************** }

PROCEDURE EXPORT_DAY_KOD;
 var y:integer;
procedure EXPORT_DAY_KOD_YEAR(Y:integer);
 VAR DEV:TEXTFILE;
     B,C,S:STRING;
     J,I,D:INTEGER;
     yy:integer;

 BEGIN
       yy:=y;
       if yy>1999 then yy:=yy-2000
                  else yy:=yy-1900;
       S:=trim(IntToStr(YY));
       if YY<10 then S:='0'+S;
       B:=CDIR+'MONTH'+S+'.TXT';
       IF NOT FILEEXIST(B) THEN
          BEGIN
               ShowMessage('Нет календаря для '+IntToStr(Y)+' года.');
               Exit;
          END;
       if not FIB.pFIBQuery.Transaction.Active then
          FIB.pFIBQuery.Transaction.StartTransaction;
       FIB.pFIBQuery.SQL.Clear;
       FIB.pFIBQuery.SQL.Add('DELETE FROM TB_MONTH WHERE YEARZA='+IntToStr(Y));
       try
          FIB.pFIBQuery.ExecQuery;
       except
          FIB.pFIBTransactionSAL.Rollback;
          MessageDlg('Ошибка чистки таблицы TB_MONTH за '+IntToStr(Y)+' год',
                  mtInformation, [mbOk], 0);
          Exit;
       end;

       ASSIGNFILE(DEV,B);
       RESET(DEV);
       FOR I:=1 TO 12 DO
           begin
                FOR J:=1 TO 31 DO
                    begin
                         READ(DEV,d);
                         if d<1 then continue;
                         FIB.pFIBQuery.SQL.Clear;
                         FIB.pFIBQuery.SQL.Add('INSERT INTO TB_MONTH (YEARZA,MONTHZA,DAYNO,CODE) VALUES(');
                         FIB.pFIBQuery.SQL.Add(IntToStr(Y)+','+IntToStr(I)+','+IntToStr(J)+','+IntToStr(d)+')');
                         try
                            FIB.pFIBQuery.ExecQuery;
                         except
                            FIB.pFIBTransactionSAL.Rollback;
                            MessageDlg('Ошибка записи таблицы TB_MONTH за '+IntToStr(Y)+' год',
                                     mtInformation, [mbOk], 0);
                            Exit;
                         end;
                    end;
           end;
       CLOSEFILE(DEV);
  END;
begin
     if not FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.StartTransaction;
     for y:=1991 to 2015 do
         begin
              export_day_kod_year(y);
         end;
     if FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.Commit;
end;

procedure Recalc_Person_Sql(Curr_Person:Person_ptr;YearZa:integer;MonthZa:integer;Debug_Mode:integer);
 type PPRec=^TPRec;
      TPRec=record
             Where:integer;
            end;
 var SavNsrv     : integer;
     c_person,cc_person : person_ptr;
     curr_sowm   : sowm_ptr;
     PRec        : PPRec;
     List        : TList;
     I,Y         : integer;
     Finded      : boolean;
     PersonId    : integer;
     SavPersonId : integer;
     ShifrSta    : integer;
     Summa,WDay  : real;
     C_Add       : Add_Ptr;
     C_Ud        : Ud_Ptr;
     Done        : boolean;
     SCH         : string;
     Who         : word;
     GUIDS       : shortstring;
     SQLStmnt    : string;
     v           : Variant;
     i1,i2       : Integer;
begin
     FormWait.Show;
     Application.ProcessMessages;
     SavPersonId := 0;
     SQLStmnt:='EXECUTE PROCEDURE PR_DELETE_TMP_PERSON_TABLES('+IntToStr(Curr_Person^.TABNO)+')';
     SQLExecute(SQLStmnt);
     SQLStmnt:='SELECT count(*) from tb_tmp_person';
     v:=SQLQueryValue(SQLStmnt);
     i1:=getVariantInteger(v);

{
     if not FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.StartTransaction;
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.ADD('EXECUTE PROCEDURE PR_DELETE_TMP_PERSON_TABLES('+IntToStr(Curr_Person^.TABNO)+')');
     try
         FIB.pFIBQuery.ExecQuery;
         FIB.pFIBQuery.Close;
     except
         ShowMessage('Ошибка чистки временных файлов перерасчета');
         FIB.pFIBQuery.Transaction.RollBack;
         Exit;
     end;
     FIB.pFIBQuery.Transaction.Commit;
}
     SQLStmnt:='EXECUTE PROCEDURE PR_CR_TMP_TBLS_PERSON(';
     SQLStmnt:=Trim(SQLStmnt)+IntToStr(Curr_Person^.Tabno)+','+IntToStr(YearZa)+','+IntToStr(MonthZa)+','+IntToStr(CurrYear)+','+IntToStr(NMES)+')';
     SQLExecute(SQLStmnt);
     SQLStmnt:='SELECT MAX(SHIFRID) FROM TB_TMP_PERSON WHERE CONN_ID=CURRENT_CONNECTION';
     v:=SQLQueryValue(SQLStmnt);
     PersonId:=getVariantInteger(v);
     FIB.pFIBQuery.Transaction.StartTransaction;
{
     FIB.pFIBQuery.Transaction.StartTransaction;
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.ADD('EXECUTE PROCEDURE PR_CR_TMP_TBLS_PERSON(');
     FIB.pFIBQuery.SQL.ADD(IntToStr(Curr_Person^.Tabno)+','+IntToStr(YearZa)+','+IntToStr(MonthZa)+','+IntToStr(CurrYear)+','+IntToStr(NMES)+')');
     try
         FIB.pFIBQuery.ExecQuery;
         FIB.pFIBQuery.Close;
     except
         ShowMessage('Ошибка создания временных файлов перерасчета');
         FIB.pFIBQuery.Transaction.RollBack;
         Exit;
     end;
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.ADD('SELECT MAX(SHIFRID) FROM TB_TMP_PERSON WHERE CONN_ID=CURRENT_CONNECTION');
     try
         FIB.pFIBQuery.ExecQuery;
         PersonId:=FIB.pFIBQuery.Fields[0].AsInteger;
         FIB.pFIBQuery.Close;
     except
         ShowMessage('Ошибка создания временных файлов перерасчета');
         FIB.pFIBQuery.Transaction.RollBack;
         Exit;
     end;
}
     List:=TList.Create;
     SavNsrv:=NSRV;
     if Curr_Person^.Mesto_Osn_Raboty<>nsrv then
        begin
             NSRV:=Curr_Person^.Mesto_Osn_Raboty;
             mkflnm;
        end;
     New(PRec);
     PRec.Where:=NSRV;
     List.Add(PRec);
     select(2);
     getinf(true);
     c_person:=head_person;
     while (c_person<>Nil) do
           begin
                if (c_person^.tabno=curr_person^.tabno) and
                   (c_person^.wid_raboty=1) then
                   begin
                        curr_sowm:=c_person^.sowm;
                        while Curr_Sowm<>nil do
                              begin
                                   Finded:=false;
                                   for i:=1 to List.Count do
                                       if PPRec(List.Items[i-1])^.Where=Curr_Sowm^.Where then
                                          begin
                                                finded:=true;
                                                break;
                                          end;
                                   if not Finded then
                                      begin
                                           New(PRec);
                                           PRec.Where:=Curr_Sowm^.Where;
                                           List.Add(PRec);
                                           nsrv:=Curr_Sowm^.Where;
                                           select(3);
                                           mkflnm;
                                           getinf(true);
                                           cc_person:=head_person;
                                           while (cc_person<>nil) do
                                            begin
                                                 if cc_person^.tabno=curr_person^.tabno then
                                                    begin
                                                         Inc(PersonId);
                                                         putPersonToSQL(PersonId,cc_person,tmpDstMode,YearZa,MonthZa);
                                                    end;
{                                                    put_person}
                                                 cc_person:=cc_person^.next;
                                            end;
                                           EMPTY_ALL_PERSON;
                                           //while (head_person<>nil) do Del_Person(Head_person);
                                           select(2);
                                      end;
                                   Curr_Sowm:=Curr_Sowm^.Next;
                              end;
                        break;
                   end;
                c_person:=c_person^.next;
           end;
     EMPTY_ALL_PERSON;
     select(1);
     List.Free;
     NSRV:=savNSRV;
     mkflnm;
     SQLStmnt:='SELECT count(*) from tb_tmp_person';
     v:=SQLQueryValue(SQLStmnt);
     i1:=getVariantInteger(v);
     cc_person:=head_person;
     while (cc_person<>nil) do
       begin
            if cc_person^.tabno=curr_person^.tabno then
               begin
                    Inc(PersonId);
                    putPersonToSQL(PersonId,cc_person,tmpDstMode,YearZa,MonthZa);
                    if cc_person=curr_person then
                       SavPersonId:=PersonId;
               end;
            cc_person:=cc_person^.next;
       end;
     FIB.pFIBQuery.Transaction.CommitRetaining;
     SQLStmnt:='SELECT count(*) from tb_tmp_person';
     v:=SQLQueryValue(SQLStmnt);
     i2:=getVariantInteger(v);
     GetGUIDPerson(Curr_Person,GUIDS);
     SQLStmnt:='EXECUTE PROCEDURE PR_RECALC_PERSON('+IntToStr(Curr_Person^.TABNO)+','+IntToStr(YearZa)+','+IntToStr(MonthZa)+','+IntToStr(SavPersonId)+','+IntToStr(Debug_Mode)+','''+GUIDS+''')';
     SQLExecute(SQLStmnt);

(*
     FIB.pFIBQuery.SQL.Clear;
 {    FIB.pFIBQuery.SQL.ADD('EXECUTE PROCEDURE PR_RECALC_PERSON('+IntToStr(Curr_Person^.TABNO)+','+IntToStr(YearZa)+','+IntToStr(MonthZa)+','+IntToStr(SavPersonId)+','+IntToStr(CurrYear)+','+IntToStr(NMES)+')');}
     SQLStmnt:='EXECUTE PROCEDURE PR_RECALC_PERSON('+IntToStr(Curr_Person^.TABNO)+','+IntToStr(YearZa)+','+IntToStr(MonthZa)+','+IntToStr(SavPersonId)+','+IntToStr(Debug_Mode)+','''+GUIDS+''')';
     FIB.pFIBQuery.SQL.ADD(SQLStmnt);
     try
         FIB.pFIBQuery.ExecQuery;
         FIB.pFIBQuery.Close;
     except
         ShowMessage('Ошибка процедуры перерасчета из созданных временных файлов перерасчета');
         FIB.pFIBQuery.Transaction.RollBack;
         Exit;
     end;
     if FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.COMMIT;
     if NOT FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.StartTransaction;
*)

     if FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.Commit;
     FIB.pFIBQuery.Transaction.StartTransaction;

     {   Перенос начислений   }
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.ADD('SELECT SHIFRSTA,SUMMA,WDAY,SCH FROM TB_TMP_FADD WHERE ');
     FIB.pFIBQuery.SQL.ADD('TABNO='+IntToStr(Curr_Person^.TABNO)+' AND ');
     FIB.pFIBQuery.SQL.ADD('SHIFRIDPERSON='+IntToStr(SavPersonId)+' AND ');
     FIB.pFIBQuery.SQL.ADD('NEED=1 AND ABS(SUMMA)>0.005 AND ');
     FIB.pFIBQuery.SQL.ADD('YEAR_ZA='+IntToStr(YearZa)+' AND ');
     FIB.pFIBQuery.SQL.ADD('MONTH_ZA='+IntToStr(MonthZa));
     try
         FIB.pFIBQuery.ExecQuery;
         while not FIB.pFIBQuery.Eof do
           begin
                ShifrSta := FIB.pFIBQuery.Fields[0].AsInteger;
                Summa    := FIB.pFIBQuery.Fields[1].AsFloat;
                WDay     := FIB.pFIBQuery.Fields[2].AsFloat;
                SCH      := FIB.pFIBQuery.Fields[3].AsString;
                if ShifrList.IsAdd(ShifrSta) and
                   (abs(Summa)>0.005)        then
                   begin
                        C_Add:=Curr_Person^.Add;
                        while true do
                          begin
                               Done:=true;
                               C_Add:=Curr_Person^.Add;
                               SCH:=Trim(sch);
                               C_Add^.COUNT  := SCH;
                               while (C_Add<>Nil) do
                                 begin
                                       Y:=C_Add^.YEAR;
                                       if Y>5 then Y:=Y+1990;
                                       if (C_Add^.Shifr=ShifrSta)      and
                                          (C_Add^.VYPLACHENO<>GET_OUT) and
                                          (C_Add^.PERIOD=MonthZa)      and
                                          (Y=YearZa)                   and
                                          ((Length(SCH)=0) or
                                           (SCH=Trim(C_Add^.Count)))   then
                                          begin
                                               Del_Add(C_Add,Curr_Person);
                                               Done:=false;
                                               break;
                                          end;
                                       C_Add:=C_Add^.NEXT;
                                 end;
                               if Done then Break;
                          end;
                        Make_Add(C_Add,Curr_Person);
                        C_Add^.Shifr  := ShifrSta;
                        C_Add^.SUMMA  := Summa;
                        C_Add^.FZP    := Summa;
                        C_Add^.YEAR   := YearZa - 1990;
                        C_Add^.PERIOD := MonthZa;
                        C_Add^.WORK_DAY:=Round(WDay);
                        SCH:=Trim(sch);
                        if Length(sch)>0 then
                           C_Add^.COUNT  := SCH;
                   end;
                FIB.pFIBQuery.Next;
           end;
         FIB.pFIBQuery.Close;
     except
         ShowMessage('Ошибка чтения результатов перерачета (начисления)');
         FIB.pFIBQuery.Transaction.RollBack;
         Exit;
     end;

     {   Перенос удержаний   }

     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.ADD('SELECT SHIFRSTA,SUMMA,SCH FROM TB_TMP_FUD WHERE ');
     FIB.pFIBQuery.SQL.ADD('TABNO='+IntToStr(Curr_Person^.TABNO)+' AND ');
     FIB.pFIBQuery.SQL.ADD('SHIFRIDPERSON='+IntToStr(SavPersonId)+' AND ');
     FIB.pFIBQuery.SQL.ADD('NEED=1 AND ABS(SUMMA)>0.005 AND ');
     FIB.pFIBQuery.SQL.ADD('YEAR_ZA='+IntToStr(YearZa)+' AND ');
     FIB.pFIBQuery.SQL.ADD('MONTH_ZA='+IntToStr(MonthZa));
     try
         FIB.pFIBQuery.ExecQuery;
         while not FIB.pFIBQuery.Eof do
           begin
                ShifrSta := FIB.pFIBQuery.Fields[0].AsInteger;
                Summa    := FIB.pFIBQuery.Fields[1].AsFloat;
                SCH      := FIB.pFIBQuery.Fields[2].AsString;
                Val(SCH,Who,I);
                if i<>0 then Who:=0;
                if not ShifrList.IsAdd(ShifrSta) and
                   (abs(Summa)>0.005)     and
                   (ShifrSta<>Pens_SHIFR) and
                   (ShifrSta<>S_S_SHIFR)  and
                   (ShifrSTa<>Fond_Z_Shifr)   then
                   begin
                        C_Ud:=Curr_Person^.Ud;
                        while true do
                          begin
                               Done:=true;
                               C_Ud:=Curr_Person^.Ud;
                               while (C_Ud<>Nil) do
                                 begin
                                       Y:=C_Ud^.YEAR;
                                       if Y>5 then Y:=Y+1990;
                                       if (C_Ud^.Shifr=ShifrSta)      and
                                          (C_Ud^.VYPLACHENO<>GET_OUT) and
                                          (C_Ud^.PERIOD=MonthZa)      and
                                          (Y=YearZa)                   then
                                          begin
                                               Del_Ud(C_Ud,Curr_Person);
                                               Done:=false;
                                               break;
                                          end;
                                       C_Ud:=C_Ud^.NEXT;
                                 end;
                               if Done then Break;
                          end;
                        Make_Ud(C_Ud,Curr_Person);
                        C_Ud^.Shifr  := ShifrSta;
                        C_Ud^.SUMMA  := Summa;
                        C_Ud^.YEAR   := YearZa - 1990;
                        C_Ud^.PERIOD := MonthZa;
                        C_Ud^.WHO    := WHO;
                   end;
                FIB.pFIBQuery.Next;
           end;
         FIB.pFIBQuery.Close;
     except
         ShowMessage('Ошибка чтения результатов перерачета (удержания)');
         FIB.pFIBQuery.Transaction.RollBack;
         Exit;
     end;

     SQLStmnt:='EXECUTE PROCEDURE PR_DELETE_TMP_PERSON_TABLES('+IntToStr(Curr_Person^.Tabno)+')';
     SQLExecute(SQLStmnt);
(*
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.ADD('EXECUTE PROCEDURE PR_DELETE_TMP_PERSON_TABLES('+IntToStr(Curr_Person^.Tabno)+')');
     try
         FIB.pFIBQuery.ExecQuery;
         FIB.pFIBQuery.Close;
     except
         ShowMessage('Ошибка чистки временных файлов перерасчета');
         FIB.pFIBQuery.Transaction.RollBack;
         Exit;
     end;
*)
     if FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.COMMIT;
     FormWait.Hide;
     Application.ProcessMessages;
     

end;

function Get_Summy_From_Sql(Curr_Person:Person_ptr;YearZa:integer;MonthZa:integer;
          var SummaFzAdd,SummaFzUd,SummaSSAdd,SummaSSUd,SummaPensAdd,SummaPensUd,
          SummaPodAdd,SummaPodUd,SummaAlimAdd,SummaAlimUd,
          SummaECBAdd,SummaECBUd,SummaECBNAdd,SummaECBNUd,
          SummaECBIllAdd,SummaECBIllUd,
          SummaECBDpAdd,SummaECBDpUd:real):boolean;
 type PPRec=^TPRec;
      TPRec=record
             Where:integer;
            end;
 var SavNsrv     : integer;
     c_person,cc_person : person_ptr;
     curr_sowm   : sowm_ptr;
     PRec        : PPRec;
     I,Y         : integer;
     Finded      : boolean;
     PersonId    : integer;
     Summa,WDay  : real;
     Done        : boolean;
     List        : TList;
     SavPersonId : integer;
     RetVal      : boolean;
     SQLStmnt    : string;

begin
     RetVal       := false;
     Get_Summy_From_Sql := false;
     SummaFzAdd     := 0;
     SummaFzUd      := 0;
     SummaSSAdd     := 0;
     SummaSSUd      := 0;
     SummaPensAdd   := 0;
     SummaPensUd    := 0;
     SummaPodAdd    := 0;
     SummaPodUd     := 0;
     SummaAlimAdd   := 0;
     SummaAlimUd    := 0;
     SummaECBAdd    := 0;
     SummaECBUd     := 0;
     SummaECBNAdd   := 0;
     SummaECBNUd    := 0;
     SummaECBIllAdd := 0;
     SummaECBIllUd  := 0;
     SummaECBDpAdd  := 0;
     SummaECBDpUd   := 0;
     FormWait.Show;
     Application.ProcessMessages;
     SavPersonId := 0;
     if not FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.StartTransaction;
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.ADD('EXECUTE PROCEDURE PR_DELETE_TMP_PERSON_TABLES('+IntToStr(Curr_Person^.TABNO)+')');
     try
         FIB.pFIBQuery.ExecQuery;
         FIB.pFIBQuery.Close;
     except
         ShowMessage('Ошибка чистки временных файлов перерасчета');
         FIB.pFIBQuery.Transaction.RollBack;
         Exit;
     end;
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.ADD('EXECUTE PROCEDURE PR_CR_TMP_TBLS_PERSON(');
     FIB.pFIBQuery.SQL.ADD(IntToStr(Curr_Person^.Tabno)+','+IntToStr(YearZa)+','+IntToStr(MonthZa)+','+IntToStr(CurrYear)+','+IntToStr(NMES)+')');
     try
         FIB.pFIBQuery.ExecQuery;
         FIB.pFIBQuery.Close;
     except
         ShowMessage('Ошибка создания временных файлов перерасчета');
         FIB.pFIBQuery.Transaction.RollBack;
         Exit;
     end;
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.ADD('SELECT MAX(SHIFRID) FROM TB_TMP_PERSON WHERE CONN_ID=CURRENT_CONNECTION');
     try
         FIB.pFIBQuery.ExecQuery;
         PersonId:=FIB.pFIBQuery.Fields[0].AsInteger;
         FIB.pFIBQuery.Close;
     except
         ShowMessage('Ошибка получения шифра записи работника');
         FIB.pFIBQuery.Transaction.RollBack;
         Exit;
     end;


     List:=TList.Create;
     SavNsrv:=NSRV;
     if Curr_Person^.Mesto_Osn_Raboty<>NSRV then
        begin
             NSRV:=Curr_Person^.Mesto_Osn_Raboty;
             mkflnm;
        end;
     New(PRec);
//     PRec.Where:=NSRV;
     PRec.Where:=SavNsrv;
     List.Add(PRec);
     select(2);
     getinf(true);
     c_person:=head_person;
     while (c_person<>Nil) do
           begin
                if (c_person^.tabno=curr_person^.tabno) and
                   (c_person^.wid_raboty=1) then
                   begin
                        curr_sowm:=c_person^.sowm;
                        while Curr_Sowm<>nil do
                              begin
                                   Finded:=false;
                                   for i:=1 to List.Count do
                                       if PPRec(List.Items[i-1])^.Where=Curr_Sowm^.Where then
                                          begin
                                                finded:=true;
                                                break;
                                          end;
                                   if (not Finded) and
                                      (Curr_Sowm^.Where<>SavNSRV) then // Текущее подр не записывать а взять из памяти чуть дальше 24 12 2010
                                      begin
                                           New(PRec);
                                           PRec.Where:=Curr_Sowm^.Where;
                                           List.Add(PRec);
                                           nsrv:=Curr_Sowm^.Where;
                                           select(3);
                                           mkflnm;
                                           getinf(true);
                                           cc_person:=head_person;
                                           while (cc_person<>nil) do
                                            begin
                                                 if cc_person^.tabno=curr_person^.tabno then
                                                    begin
                                                         Inc(PersonId);
                                                         putPersonToSQL(PersonId,cc_person,tmpDstMode,YearZa,MonthZa);
                                                    end;
{                                                    put_person}
                                                 cc_person:=cc_person^.next;
                                            end;
                                           while (head_person<>nil) do Del_Person(Head_person);
                                           select(2);
                                      end;
                                   Curr_Sowm:=Curr_Sowm^.Next;
                              end;
                        break;
                   end;
                c_person:=c_person^.next;
           end;
     while (Head_Person<>Nil) do Del_Person(Head_Person);
     select(1);
(*
 // Записать в БД текущее подр 24 12 2010
     cc_person:=head_person;
     while (cc_person<>nil) do
      begin
           if cc_person^.tabno=curr_person^.tabno then
              begin
                   Inc(PersonId);
                   put_person_to_sql(PersonId,cc_person,false,1,YearZa,MonthZa);
              end;
           cc_person:=cc_person^.next;
      end;

 // Конец изменений от 24 12 2010
*)
     List.Free;
     NSRV:=savNSRV;
     mkflnm;
     cc_person:=head_person;
     while (cc_person<>nil) do
       begin
            if cc_person^.tabno=curr_person^.tabno then
               begin
                    Inc(PersonId);
                    putPersonToSQL(PersonId,cc_person,tmpDstMode,YearZa,MonthZa);
                    if cc_person=curr_person then
                       SavPersonId:=PersonId;
               end;
            cc_person:=cc_person^.next;
       end;
     if FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.COMMIT;
     if NOT FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.StartTransaction;

     FIB.pFIBQuery.SQL.Clear;
     SQLStmnt := 'SELECT FIRST 1 summapodadd,summapodud,summaalimadd,summaalimud,';
     SQLStmnt := trim(SQLStmnt)+'summaecbnadd,summaecbnud,summaecbadd,summaecbdpud,summaecbdpadd,summaecbud,summaecbilladd,summaecbillud  FROM PR_GET_POD_ECB_PERSON('+IntToStr(Curr_Person^.TABNO)+','+IntToStr(YearZa)+','+IntToStr(MonthZa)+')';
//     SQLStmnt:= 'SELECT FIRST 1 summapodadd,summapodud,summaalimadd,summaalimud,summaecbadd,summaecbud,summaecbilladd,summaecbillud  FROM PR_GET_POD_PENS_SS_FZ_PERSON('+IntToStr(Curr_Person^.TABNO)+','+IntToStr(YearZa)+','+IntToStr(MonthZa)+')';
     FIB.pFIBQuery.SQL.ADD(SQLStmnt);
     try
         FIB.pFIBQuery.ExecQuery;
         summapodadd  := FIB.pFIBQuery.FieldByName('summapodadd').AsFloat;
         summapodud   := FIB.pFIBQuery.FieldByName('summapodud').AsFloat;
         summaalimadd := FIB.pFIBQuery.FieldByName('summaalimadd').AsFloat;
         summaalimud  := FIB.pFIBQuery.FieldByName('summaalimud').AsFloat;
         summaecbnadd    := FIB.pFIBQuery.FieldByName('summaecbnadd').AsFloat;
         summaecbnud     := FIB.pFIBQuery.FieldByName('summaecbnud').AsFloat;
         summaecbadd     := FIB.pFIBQuery.FieldByName('summaecbadd').AsFloat;
         summaecbud      := FIB.pFIBQuery.FieldByName('summaecbud').AsFloat;
         summaecbdpadd   := FIB.pFIBQuery.FieldByName('summaecbdpadd').AsFloat;
         summaecbdpud    := FIB.pFIBQuery.FieldByName('summaecbdpud').AsFloat;
         summaecbilladd  := FIB.pFIBQuery.FieldByName('summaecbilladd').AsFloat;
         summaecbillud   := FIB.pFIBQuery.FieldByName('summaecbillud').AsFloat;
         FIB.pFIBQuery.Close;
//                                    0          1         2           3         4             5           6           7           8           9         10            11         12           13            14           15        16              17
//     SQLStmnt:= 'SELECT FIRST 1 summafzadd,summafzud,summassadd,summassud,summapensadd,summapensud,summapodadd,summapodud,summaalimadd,summaalimud,summaecbnadd,summaecbnud,summaecbadd,summaecbdpud,summaecbdpadd,summaecbud,summaecbilladd,summaecbillud  FROM PR_GET_POD_PENS_SS_FZ_PERSON('+IntToStr(Curr_Person^.TABNO)+','+IntToStr(YearZa)+','+IntToStr(MonthZa)+')';
     except
         ShowMessage('Ошибка получения сумм налогов');
         FIB.pFIBQuery.Transaction.RollBack;
         Exit;
     end;
     if FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.COMMIT;
     if not FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.StartTransaction;

     if Must_Show_Podoh then
        begin
             Application.CreateForm(TFormShowRecalcPerson, FormShowRecalcPerson);
             FormShowRecalcPerson.Tabno := Curr_Person^.Tabno;
             FormShowRecalcPerson.FIO   := Curr_Person^.FIO;
             FormShowRecalcPerson.Y     := YearZa;
             FormShowRecalcPerson.M     := MonthZa;
             FormShowRecalcPerson.ShowModal;
             if not FIB.pFIBQuery.Transaction.Active then
                FIB.pFIBQuery.Transaction.StartTransaction;
        end;

     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.ADD('EXECUTE PROCEDURE PR_DELETE_TMP_PERSON_TABLES('+IntToStr(Curr_Person^.Tabno)+')');
     try
         FIB.pFIBQuery.ExecQuery;
         FIB.pFIBQuery.Close;
     except
         ShowMessage('Ошибка чистки временных файлов перерасчета');
         FIB.pFIBQuery.Transaction.RollBack;
         Exit;
     end;

     if FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.COMMIT;
     FormWait.Hide;
     Application.ProcessMessages;
     
     RetVal:=true;
     Get_Summy_From_Sql:=true;

end;

procedure PutSummyToTmpTables(Curr_Person:PERSON_PTR;YearZa:integer;MonthZa:integer);
 type PPRec=^TPRec;
      TPRec=record
             Where:integer;
            end;
 var SavNsrv,SavNsrv_2  : integer;
     c_person,cc_person : person_ptr;
     curr_sowm   : sowm_ptr;
     PRec        : PPRec;
     I,Y         : integer;
     Finded      : boolean;
     PersonId    : integer;
     Summa,WDay  : real;
     Done        : boolean;
     List        : TList;
     SavPersonId : integer;
     RetVal      : boolean;
     SQLStmnt    : string;
     v           : variant;

     procedure PutAllWantedPersonFromPodrToSQL(tabno:integer);
       var cc_person:person_ptr;
       begin
            cc_person:=head_person;
            while (cc_person<>nil) do
               begin
                    if cc_person^.tabno=tabno then
                       begin
                            Inc(PersonId);
                            putPersonToSQL(PersonId,cc_person,tmpDstMode,YearZa,MonthZa);
                       end;
                    cc_person:=cc_person^.next;
               end;
       end;


begin
     SavPersonId := 0;
(*
     if not FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.StartTransaction;
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.ADD('EXECUTE PROCEDURE PR_DELETE_TMP_PERSON_TABLES('+IntToStr(Curr_Person^.TABNO)+')');
     try
         FIB.pFIBQuery.ExecQuery;
         FIB.pFIBQuery.Close;
     except
         ShowMessage('Ошибка чистки временных файлов перерасчета');
         FIB.pFIBQuery.Transaction.RollBack;
         Exit;
     end;
*)
     SQLStmnt:='EXECUTE PROCEDURE PR_DELETE_TMP_PERSON_TABLES('+IntToStr(Curr_Person^.TABNO)+')';
     SQLExecute(SQLStmnt);
     SQLStmnt:='EXECUTE PROCEDURE PR_CR_TMP_TBLS_PERSON('+IntToStr(Curr_Person^.Tabno)+','+IntToStr(YearZa)+','+IntToStr(MonthZa)+','+IntToStr(CurrYear)+','+IntToStr(NMES)+')';
     SQLExecute(SQLStmnt);
(*
 //    FIB.FIBSQLLoggerSal.ActiveLogging:=True;
 //    FIB.FIBSQLLoggerSal.ActiveStatistics:=True;
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.ADD('EXECUTE PROCEDURE PR_CR_TMP_TBLS_PERSON(');
     FIB.pFIBQuery.SQL.ADD(IntToStr(Curr_Person^.Tabno)+','+IntToStr(YearZa)+','+IntToStr(MonthZa)+','+IntToStr(CurrYear)+','+IntToStr(NMES)+')');
     try
         FIB.pFIBQuery.ExecQuery;
         FIB.pFIBQuery.Close;
     except
         ShowMessage('Ошибка создания временных файлов перерасчета');
         FIB.pFIBQuery.Transaction.RollBack;
         Exit;
     end;
*)
   //  Error('STEP 0');

     v:='SELECT MAX(SHIFRID) FROM TB_TMP_PERSON WHERE CONN_ID=CURRENT_CONNECTION';
     if VarIsNumeric(v) then
        PersonId:=v
     else
        PersonId:=0;

     if not ((WORK_YEAR_VAL=curryear) and
         (nmes=flow_month)) then
        exit;
 // Из текущей БД добавлять только в рабочем месяце, а не из прошлых
     if not FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.StartTransaction;
        

 (*
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.ADD('SELECT MAX(SHIFRID) FROM TB_TMP_PERSON WHERE CONN_ID=CURRENT_CONNECTION');
     try
         FIB.pFIBQuery.ExecQuery;
         PersonId:=FIB.pFIBQuery.Fields[0].AsInteger;
         FIB.pFIBQuery.Close;
     except
         ShowMessage('Ошибка получения шифра записи работника');
         FIB.pFIBQuery.Transaction.RollBack;
         Exit;
     end;
 *)    
  //   Error('STEP 1');
     List:=TList.Create;
     SavNsrv:=NSRV;
     if Curr_Person^.Mesto_Osn_Raboty<>NSRV then
        begin
             NSRV:=Curr_Person^.Mesto_Osn_Raboty;
             mkflnm;
        end;
     New(PRec);
//     PRec.Where:=NSRV;
     PRec.Where:=SavNsrv;
     SavNsrv_2 := NSRV;
     List.Add(PRec);
     select(2);
     getinf(true);
     c_person:=head_person;
     while (c_person<>Nil) do
           begin
                if (c_person^.tabno=curr_person^.tabno) and
                   (c_person^.wid_raboty=1) then
                   begin
                        curr_sowm:=c_person^.sowm;
                        while Curr_Sowm<>nil do
                              begin
                                   Finded:=false;
                                   for i:=1 to List.Count do
                                       if PPRec(List.Items[i-1])^.Where=Curr_Sowm^.Where then
                                          begin
                                                finded:=true;
                                                break;
                                          end;
                                   if (not Finded) and
                                      (Curr_Sowm^.Where<>SavNSRV) then // Текущее подр не записывать а взять из памяти чуть дальше 24 12 2010
                                      begin
                                           New(PRec);
                                           PRec.Where:=Curr_Sowm^.Where;
                                           List.Add(PRec);
                                           nsrv:=Curr_Sowm^.Where;
                                           select(3);
                                           mkflnm;
                                           getinf(true);
                                           PutAllWantedPersonFromPodrToSQL(Curr_Person^.Tabno);
                                           EMPTY_ALL_PERSON;
                                           select(2);
                                      end;
                                   Curr_Sowm:=Curr_Sowm^.Next;
                              end;
                        break;
                   end;
                c_person:=c_person^.next;
           end;
     EMPTY_ALL_PERSON;
 //    Error('STEP 2');
(*
 // Записать в БД текущее подр 24 12 2010
     cc_person:=head_person;
     while (cc_person<>nil) do
      begin
           if cc_person^.tabno=curr_person^.tabno then
              begin
                   Inc(PersonId);
                   put_person_to_sql(PersonId,cc_person,false,1,YearZa,MonthZa);
              end;
           cc_person:=cc_person^.next;
      end;

 // Конец изменений от 24 12 2010
*)
     finded:=false;
     for i:=1 to List.Count do
         if PPRec(List.Items[i-1])^.Where=SavNSRV_2 then
            begin
                 finded:=true;
                 break;
            end;
     List.Free;
     if not Finded then
        begin
             nsrv:=savnsrv_2;
             mkflnm;
             select(3);
             GetInf(true);
             PutAllWantedPersonFromPodrToSQL(Curr_Person^.Tabno);
             EMPTY_ALL_PERSON;
        end;
     select(1);
     NSRV:=savNSRV;
     mkflnm;
//     Error('STEP 45');

     PutAllWantedPersonFromPodrToSQL(Curr_Person^.Tabno);
     if FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.COMMIT;
 //    Error('STEP 55');
 //    FIB.FIBSQLLoggerSal.SaveLog;

end;

procedure ClearTmpFiles(Tabno:integer);
begin
     if not FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.StartTransaction;

     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.ADD('EXECUTE PROCEDURE PR_DELETE_TMP_PERSON_TABLES('+IntToStr(Tabno)+')');
     try
         FIB.pFIBQuery.ExecQuery;
         FIB.pFIBQuery.Close;
     except
         ShowMessage('Ошибка чистки временных файлов перерасчета');
         FIB.pFIBQuery.Transaction.RollBack;
         Exit;
     end;

     if FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.COMMIT;
end;

function Get_Summy_From_Sql_2011(Curr_Person:Person_ptr;YearZa:integer;MonthZa:integer;
          var SummaPodAdd,SummaPodUd,SummaAlimAdd,SummaAlimUd,
          SummaECBAdd,SummaECBUd,SummaECBNAdd,SummaECBNUd,
          SummaECBIllAdd,SummaECBIllUd,
          SummaECBDpAdd,SummaECBDpUd:real):boolean;
 type PPRec=^TPRec;
      TPRec=record
             Where:integer;
            end;
 var SavNsrv     : integer;
     c_person,cc_person : person_ptr;
     curr_sowm   : sowm_ptr;
     PRec        : PPRec;
     I,Y         : integer;
     Finded      : boolean;
     PersonId    : integer;
     Summa,WDay  : real;
     Done        : boolean;
     List        : TList;
     SavPersonId : integer;
     RetVal      : boolean;
     SQLStmnt    : string;

begin
     RetVal       := false;
     Get_Summy_From_Sql_2011 := false;
     SummaPodAdd    := 0;
     SummaPodUd     := 0;
     SummaAlimAdd   := 0;
     SummaAlimUd    := 0;
     SummaECBAdd    := 0;
     SummaECBUd     := 0;
     SummaECBNAdd   := 0;
     SummaECBNUd    := 0;
     SummaECBIllAdd := 0;
     SummaECBIllUd  := 0;
     SummaECBDpAdd  := 0;
     SummaECBDpUd   := 0;
     FormWait.Show;
     Application.ProcessMessages;
     PutSummyToTmpTables(Curr_Person,YearZa,MonthZa);
     if NOT FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.StartTransaction;

     FIB.pFIBQuery.SQL.Clear;
     SQLStmnt := 'SELECT FIRST 1 summapodadd,summapodud,summaalimadd,summaalimud,';
     SQLStmnt := trim(SQLStmnt)+'summaecbnadd,summaecbnud,summaecbadd,summaecbdpud,summaecbdpadd,summaecbud,summaecbilladd,summaecbillud  FROM PR_GET_POD_ECB_PERSON('+IntToStr(Curr_Person^.TABNO)+','+IntToStr(YearZa)+','+IntToStr(MonthZa)+')';
//     SQLStmnt:= 'SELECT FIRST 1 summapodadd,summapodud,summaalimadd,summaalimud,summaecbadd,summaecbud,summaecbilladd,summaecbillud  FROM PR_GET_POD_PENS_SS_FZ_PERSON('+IntToStr(Curr_Person^.TABNO)+','+IntToStr(YearZa)+','+IntToStr(MonthZa)+')';
     FIB.pFIBQuery.SQL.ADD(SQLStmnt);
     try
         FIB.pFIBQuery.ExecQuery;
         summapodadd  := FIB.pFIBQuery.FieldByName('summapodadd').AsFloat;
         summapodud   := FIB.pFIBQuery.FieldByName('summapodud').AsFloat;
         summaalimadd := FIB.pFIBQuery.FieldByName('summaalimadd').AsFloat;
         summaalimud  := FIB.pFIBQuery.FieldByName('summaalimud').AsFloat;
         summaecbnadd    := FIB.pFIBQuery.FieldByName('summaecbnadd').AsFloat;
         summaecbnud     := FIB.pFIBQuery.FieldByName('summaecbnud').AsFloat;
         summaecbadd     := FIB.pFIBQuery.FieldByName('summaecbadd').AsFloat;
         summaecbud      := FIB.pFIBQuery.FieldByName('summaecbud').AsFloat;
         summaecbdpadd   := FIB.pFIBQuery.FieldByName('summaecbdpadd').AsFloat;
         summaecbdpud    := FIB.pFIBQuery.FieldByName('summaecbdpud').AsFloat;
         summaecbilladd  := FIB.pFIBQuery.FieldByName('summaecbilladd').AsFloat;
         summaecbillud   := FIB.pFIBQuery.FieldByName('summaecbillud').AsFloat;
         FIB.pFIBQuery.Close;
//                                    0          1         2           3         4             5           6           7           8           9         10            11         12           13            14           15        16              17
//     SQLStmnt:= 'SELECT FIRST 1 summafzadd,summafzud,summassadd,summassud,summapensadd,summapensud,summapodadd,summapodud,summaalimadd,summaalimud,summaecbnadd,summaecbnud,summaecbadd,summaecbdpud,summaecbdpadd,summaecbud,summaecbilladd,summaecbillud  FROM PR_GET_POD_PENS_SS_FZ_PERSON('+IntToStr(Curr_Person^.TABNO)+','+IntToStr(YearZa)+','+IntToStr(MonthZa)+')';
     except
         ShowMessage('Ошибка получения сумм налогов');
         FIB.pFIBQuery.Transaction.RollBack;
         Exit;
     end;
     if FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.COMMIT;
     ClearTmpFiles(Curr_Person^.tabno);
     FormWait.Hide;
     Application.ProcessMessages;
     RetVal:=true;
     Get_Summy_From_Sql_2011:=true;

end;


procedure putPersonToSqlForCurrMonth(WantedTabno:integer;WantedPodr:integer);
 type PPRec=^TPRec;
      TPRec=record
             Where:integer;
            end;
 var SavNsrv     : integer;
     c_person,cc_person : person_ptr;
     curr_sowm   : sowm_ptr;
     PRec        : PPRec;
     List        : TList;
     I,Y         : integer;
     Finded      : boolean;
     PersonId    : integer;
     SavPersonId : integer;
     ShifrSta    : integer;
     Summa,WDay  : real;
     C_Add       : Add_Ptr;
     C_Ud        : Ud_Ptr;
     Done        : boolean;
     SCH         : string;
     Who         : word;
     SQLStmnt    : string;
     v           : Variant;
begin
     FormWait.Show;
     Application.ProcessMessages;
     SavPersonId := 0;
     SQLStmnt:='DELETE FROM PERSON WHERE TABNO='+IntToStr(WantedTabno)+' AND MONTHVY='+IntToStr(NMES)+' AND YEARVY='+IntToStr(CurrYear);
     FIB.pFIBDatabaseSal.Execute(SQLStmnt);
     if not FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.StartTransaction;
//     FIB.pFIBQuery.SQL.Clear;
//     FIB.pFIBQuery.SQL.ADD('DELETE FROM PERSON WHERE TABNO='+IntToStr(WantedTabno)+' AND MONTHVY='+IntToStr(NMES)+' AND YEARVY='+IntToStr(CurrYear));
//     FIB.pFIBQuery.ExecQuery;
//     FIB.pFIBQuery.Close;
     SQLStmnt:='SELECT MAX(SHIFRID) FROM PERSON';
     v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
     PersonId:=v;


//     FIB.pFIBQuery.SQL.Clear;
//     FIB.pFIBQuery.SQL.ADD('SELECT MAX(SHIFRID) FROM PERSON');
//     FIB.pFIBQuery.ExecQuery;
//     PersonId:=FIB.pFIBQuery.Fields[0].AsInteger;
//     FIB.pFIBQuery.Close;
     List:=TList.Create;
     SavNsrv:=NSRV;
     if WantedPodr<>nsrv then
        begin
             NSRV:=WantedPodr;
             mkflnm;
        end;
     select(2);
     getinf(true);
     c_person:=head_person;
     while (c_person<>Nil) do
           begin
                if (c_person^.tabno=WantedTabno) and
                   (c_person^.wid_raboty=1) then
                   begin
                        New(PRec);
                        PRec.Where:=NSRV;
                        List.Add(PRec);
                        cc_person:=head_person;
                        while (cc_person<>nil) do
                           begin
                                if cc_person^.tabno=WantedTabno then
                                   begin
                                        Inc(PersonId);
//                                        put_person_to_sql(PersonId,cc_person,false,1,YearZa,MonthZa);
                                        putPersonToSQL(Personid,Cc_Person,salDstMode,0,0);
                                   end;
                                cc_person:=cc_person^.next;
                           end;
                        curr_sowm:=c_person^.sowm;
                        while Curr_Sowm<>nil do
                              begin
                                   Finded:=false;
                                   for i:=1 to List.Count do
                                       if PPRec(List.Items[i-1])^.Where=Curr_Sowm^.Where then
                                          begin
                                                finded:=true;
                                                break;
                                          end;
                                   if not Finded then
                                      begin
                                           New(PRec);
                                           PRec.Where:=Curr_Sowm^.Where;
                                           List.Add(PRec);
                                           nsrv:=Curr_Sowm^.Where;
                                           select(3);
                                           mkflnm;
                                           getinf(true);
                                           cc_person:=head_person;
                                           while (cc_person<>nil) do
                                            begin
                                                 if cc_person^.tabno=WantedTabno then
                                                    begin
                                                         Inc(PersonId);
                                                       //  put_person_to_sql(PersonId,cc_person,false,1,YearZa,MonthZa);
                                                         putPersonToSQL(Personid,Cc_Person,salDstMOde,0,0);
                                                    end;
                                                 cc_person:=cc_person^.next;
                                            end;
                                           while (head_person<>nil) do Del_Person(Head_person);
                                           select(2);
                                      end;
                                   Curr_Sowm:=Curr_Sowm^.Next;
                              end;
                        break;
                   end;
                c_person:=c_person^.next;
           end;
     EMPTY_ALL_PERSON;
     select(1);
     List.Free;
     NSRV:=savNSRV;
     mkflnm;
     if FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.COMMIT;
     FormWait.Hide;
     application.ProcessMessages;

end;



end.

                                      
