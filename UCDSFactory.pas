unit UCDSFactory;

interface
  uses pFIBClientDataSet,ScrDef;
  function CDSFactory(tableName:String;var InsertStatement:widestring):TpFIBClientDataSet;

  function TestCDS(Curr_Person:Person_Ptr):Boolean;
  function TestCDSPodr:boolean;
  function TestCDSFull:boolean;


implementation
   uses UFibModule,SysUtils,ScrUtil,FIBDataSet,SCrIo,UFormProgress,Forms,MidasLib;
   type
     TBatchCopierToSql = class
      private
         InsertStatementP:WideString;
         InsertStatementA:WideString;
         InsertStatementU:WideString;
         InsertStatementC:WideString;
         InsertStatementT:WideString;
         CDSP:TpFIBClientDataSet;
         CDSA:TpFIBClientDataSet;
         CDSU:TpFIBClientDataSet;
         CDSC:TpFIBClientDataSet;
         CDST:TpFIBClientDataSet;
         Y   : Integer;
         M   : Integer;
         ShifrIdPerson:Integer;
     public
         constructor Create(Y:Integer;M:integer);
         destructor Free;
         procedure CopyCDSToSQL;
         function getCDSP:TpFIBClientDataSet;
         function getCDSA:TpFIBClientDataSet;
         function getCDSU:TpFIBClientDataSet;
         function getCDSC:TpFIBClientDataSet;
         function getCDST:TpFIBClientDataSet;
         function getY:Integer;
         function getM:Integer;
         function getShifrIdPersonPlusOne:Integer;

    end;
  TBatchPersonCopierToSQL=class
    private
           WantedPerson:Person_Ptr;
           ShifrIdPerson:Integer;
           Y,M:Integer;
           W_Place:Integer;
           CDSP:TpFIBClientDataSet;
           CDSA:TpFIBClientDataSet;
           CDSU:TpFIBClientDataSet;
           CDSC:TpFIBClientDataSet;
           CDST:TpFIBClientDataSet;

           procedure FillAdd;
           procedure FillUd;
           procedure FillCn;
           procedure FillTabel;
    public
          constructor Create(WantedPerson:Person_Ptr;W_Place:Integer;BCS:TBatchCopierToSQL);
          procedure CopyPersonToCDS;
  end;


  constructor TBatchCopierToSql.Create(Y:Integer;m:integer);
   begin
         CDSP:=CDSFactory('tb_c_person' , InsertStatementP);
         CDSA:=CDSFactory('tb_c_fadd'   , InsertStatementA);
         CDSU:=CDSFactory('tb_c_fud'    , InsertStatementU);
         CDSC:=CDSFactory('tb_c_fcn'    , InsertStatementC);
         CDST:=CDSFactory('tb_c_tabel'  , InsertStatementT);
         CDSP.Open;
         CDSA.Open;
         CDSU.Open;
         CDSC.Open;
         CDST.Open;
         Self.Y:=Y;
         Self.M:=M;
//         ShifrIdPerson:=FIB.pFIBDatabaseSal.Gen_Id('G_C_P',1);
         ShifrIdPerson:=FIB.pFIBDatabaseSal.QueryValue('select coalesce(max(shifrid),1) from tb_c_person', 0, []);
//         function QueryValue(const aSQL: string; FieldNo:integer; ParamValues:array of
//variant; aTransaction:TFIBTransaction=nil):Variant; overload;
   end;
  destructor TBatchCopierToSql.Free;
   begin
         if CDSP.Active then
            CDSP.Close;
         if CDSA.Active then
            CDSA.Close;
         if CDSU.Active then
            CDSU.Close;
         if CDSC.Active then
            CDSC.Close;
         if CDST.Active then
            CDST.Close;
   {
         if CDSP.Transaction.Active then
            CDSP.Transaction.Commit;
         if CDSP.UpdateTransaction.Active then
            CDSP.UpdateTransaction.Commit;
    }
         CDSP.Free;
         CDSA.Free;
         CDSU.Free;
         CDSC.Free;
         CDST.Free;

   end;
  procedure TBatchCopierToSql.CopyCDSToSQL;
   begin
         if FIB.pFIBQuery.Open then
            FIB.pFIBQuery.Close;
         FIB.pFIBQuery.SQL.Clear;
         FIB.pFIBQuery.SQL.Add(InsertStatementP);
         if not FIB.pFIBQuery.Transaction.Active then
            FIB.pFIBQuery.Transaction.StartTransaction;
         FIB.pFIBQuery.ExecWPS(CDSP);

         FIB.pFIBQuery.Close;
         FIB.pFIBQuery.SQL.Clear;
         FIB.pFIBQuery.SQL.Add(InsertStatementA);
         FIB.pFIBQuery.ExecWPS(CDSA);

         FIB.pFIBQuery.Close;
         FIB.pFIBQuery.SQL.Clear;
         FIB.pFIBQuery.SQL.Add(InsertStatementU);
         FIB.pFIBQuery.ExecWPS(CDSU);

         FIB.pFIBQuery.Close;
         FIB.pFIBQuery.SQL.Clear;
         FIB.pFIBQuery.SQL.Add(InsertStatementC);
         FIB.pFIBQuery.ExecWPS(CDSC);

         FIB.pFIBQuery.Close;
         FIB.pFIBQuery.SQL.Clear;
         FIB.pFIBQuery.SQL.Add(InsertStatementT);
         FIB.pFIBQuery.ExecWPS(CDST);

         FIB.pFIBQuery.Transaction.CommitRetaining;

         CDSP.EmptyDataSet;
         CDSA.EmptyDataSet;
         CDSU.EmptyDataSet;
         CDSC.EmptyDataSet;
         CDST.EmptyDataSet;

   {
         if  CDSP.UpdatesPending then
             begin
                 CDSP.UpdateTransaction.StartTransaction;
                 try
                    CDSP.ApplyUpdToBase;
                    if  CDSA.UpdatesPending then
                        begin
                             CDSA.ApplyUpdToBase;
                             CDSA.CommitUpdToCach;
                        end;
                    if  CDSU.UpdatesPending then
                        begin
                             CDSU.ApplyUpdToBase;
                             CDSU.CommitUpdToCach;
                        end;
                    if  CDSC.UpdatesPending then
                        begin
                             CDSC.ApplyUpdToBase;
                             CDSC.CommitUpdToCach;
                        end;
                    if  CDST.UpdatesPending then
                        begin
                             CDST.ApplyUpdToBase;
                             CDST.CommitUpdToCach;
                        end;
                    CDSP.UpdateTransaction.Commit;
                    CDSP.CommitUpdToCach;
                 except
                      CDSP.UpdateTransaction.RollBack;
                 end;
  
             end;
  }
   end;
  function TBatchCopierToSql.getCDSP:TpFIBClientDataSet;
     begin
          getCDSP := Self.CDSP;
     end;
  function TBatchCopierToSql.getCDSA:TpFIBClientDataSet;
     begin
          getCDSA := Self.CDSA;
     end;
  function TBatchCopierToSql.getCDSU:TpFIBClientDataSet;
     begin
          getCDSU := Self.CDSU;
     end;
  function TBatchCopierToSql.getCDSC:TpFIBClientDataSet;
     begin
          getCDSC := Self.CDSC;
     end;
  function TBatchCopierToSql.getCDST:TpFIBClientDataSet;
     begin
          getCDST := Self.CDST;
     end;

  function TBatchCopierToSql.getY:integer;
     begin
          getY := Self.Y;
     end;
  function TBatchCopierToSql.getM:integer;
     begin
          getM := Self.M;
     end;
  function TBatchCopierToSql.getShifrIdPersonPlusOne:integer;
     begin
          Inc(Self.ShifrIdPerson);
          getShifrIdPersonPlusOne := Self.ShifrIdPerson;
     end;

  constructor TBatchPersonCopierToSql.Create(WantedPerson:Person_Ptr;W_Place:Integer;BCS:TBatchCopierToSQL);
    begin
         Self.WantedPerson:=WantedPerson;
         Self.W_Place:=W_Place;
         Self.CDSP:=BCS.getCDSP;
         Self.CDSA:=BCS.getCDSA;
         Self.CDSU:=BCS.getCDSU;
         Self.CDSC:=BCS.getCDSC;
         Self.CDST:=BCS.getCDST;
         Self.Y   :=BCS.getY;
         Self.M   :=BCS.getM;
         ShifrIdPerson:=BCS.getShifrIdPersonPlusOne;
    end;
  procedure TBatchPersonCopierToSql.CopyPersonToCDS;
    begin
         CDSP.Insert;
         CDSP.Fields[0].AsInteger:=ShifrIdPerson;
         CDSP.Fields[1].AsInteger:=WantedPerson.TABNO;
    //     CDSP.Fields[2].AsString:=StringReplace(Trim(WantedPerson.FIO),'''','''''',[rfReplaceAll, rfIgnoreCase]);
    //     CDSP.Fields[3].AsString:=StringReplace(Trim(WantedPerson.Dolg),'''','''''',[rfReplaceAll, rfIgnoreCase]);
         CDSP.Fields[2].AsString:=Trim(WantedPerson.FIO);
         CDSP.Fields[3].AsString:=Trim(WantedPerson.Dolg);
         CDSP.Fields[4].AsInteger:=M;
         CDSP.Fields[5].AsInteger:=Y;
         CDSP.Fields[6].AsInteger:=WantedPerson.WID_RABOTY;
         CDSP.Fields[7].AsInteger:=WantedPerson.GRUPPA;
         CDSP.Fields[8].AsInteger:=WantedPerson.KATEGORIJA;
         CDSP.Fields[9].AsInteger:=WantedPerson.MESTO_OSN_RABOTY;
 //        CDSP.Fields[10].AsString:=StringReplace(Trim(WantedPerson.N_TEMY),'''','''''',[rfReplaceAll, rfIgnoreCase]);
         CDSP.Fields[10].AsString:=Trim(WantedPerson.N_TEMY);
         CDSP.Fields[11].AsInteger:=WantedPerson.WID_OPLATY;
         CDSP.Fields[12].AsInteger:=WantedPerson.MODE;
         CDSP.Fields[13].AsInteger:=WantedPerson.FROM;
         CDSP.Fields[14].AsInteger:=WantedPerson.PODOH;
         CDSP.Fields[15].AsInteger:=WantedPerson.Malo;
         CDSP.Fields[16].AsInteger:=WantedPerson.PRofsojuz;
         CDSP.Fields[17].AsInteger:=WantedPerson.Main;
         CDSP.Fields[18].AsInteger:=WantedPerson.State;
         CDSP.Fields[19].AsInteger:=WantedPerson.AUTOMATIC;
         CDSP.Fields[20].AsInteger:=WantedPerson.START_DAY;
         CDSP.Fields[21].AsInteger:=WantedPerson.Pens;
         CDSP.Fields[22].AsInteger:=WantedPerson.Bank;
 //        CDSP.Fields[23].AsString:=StringReplace(Trim(WantedPerson.Nal_Code),'''','''''',[rfReplaceAll, rfIgnoreCase]);
         CDSP.Fields[23].AsString:=Trim(WantedPerson.Nal_Code);
         CDSP.Fields[24].AsFloat:=WantedPerson.Oklad;
         CDSP.Fields[25].AsInteger:=W_Place;
         CDSP.Fields[26].AsInteger:=GetRazrjadPerson(WantedPerson);
         CDSP.Post;
         FillAdd;
         FillUd;
         FillCn;
         FillTabel;
    end;
  procedure TBatchPersonCopierToSql.FillAdd;
    var Curr_Add:Add_Ptr;
        YY,FOND:Integer;
    begin
         Curr_Add:=WantedPerson.Add;
         while (Curr_Add<>Nil) do
          begin
               CDSA.Insert;
               CDSA.Fields[0].AsInteger:=0;
               CDSA.Fields[1].AsInteger:=ShifrIdPerson;
               CDSA.Fields[2].AsInteger:=WantedPerson.Tabno;
               CDSA.Fields[3].AsInteger:=W_Place;
               CDSA.Fields[4].AsInteger:=WantedPerson.Wid_Raboty;
               CDSA.Fields[5].AsInteger:=WantedPerson.Gruppa;
               CDSA.Fields[6].AsInteger:=WantedPerson.KATEGORIJA;
               CDSA.Fields[7].AsInteger:=Curr_Add^.Shifr;
               CDSA.Fields[8].AsInteger:=Curr_Add^.Period;
               if Curr_Add^.YEAR<1900 then yy:=Curr_Add^.YEAR+1990
               else yy:=Curr_Add^.YEAR;
               CDSA.Fields[9].AsInteger:=YY;
               CDSA.Fields[10].AsInteger:=M;
               CDSA.Fields[11].AsInteger:=Y;
               CDSA.Fields[12].AsFloat:=Curr_Add^.SUMMA;
               CDSA.Fields[13].AsFloat:=Curr_Add^.WORK_DAY;
               CDSA.Fields[14].AsFloat:=Curr_Add^.WORK_CLOCK;
               FOND:=1;
               if ((Abs(Curr_Add^.FZP)   < 0.01) and
                   (Abs(Curr_Add^.FMP)   > 0.01) and
                   (Abs(Curr_Add^.other) < 0.01)) then
                  Fond:=2
               else
               if ((Abs(Curr_Add^.FZP)   < 0.01) and
                   (Abs(Curr_Add^.FMP)   < 0.01) and
                   (Abs(Curr_Add^.other) > 0.01)) then
                  Fond:=3;
               CDSA.Fields[15].AsInteger:=FOND;
               CDSA.Fields[16].AsInteger:=Curr_Add^.VYPLACHENO;
               CDSA.Fields[17].AsString:=StringReplace(Trim(Curr_Add^.COUNT),'''','''''',[rfReplaceAll, rfIgnoreCase]);

               CDSA.Post;
               Curr_Add:=Curr_Add.Next;
          end;

    end;
  procedure TBatchPersonCopierToSql.FillUd;
    var Curr_Ud : Ud_Ptr;
        YY      : Integer;
    begin
         Curr_Ud:=WantedPerson.Ud;
         while (Curr_Ud<>Nil) do
          begin
               CDSU.Insert;
               CDSU.Fields[0].AsInteger:=0;
               CDSU.Fields[1].AsInteger:=ShifrIdPerson;
               CDSU.Fields[2].AsInteger:=WantedPerson.Tabno;
               CDSU.Fields[3].AsInteger:=W_Place;
               CDSU.Fields[4].AsInteger:=WantedPerson.Wid_Raboty;
               CDSU.Fields[5].AsInteger:=WantedPerson.Gruppa;
               CDSU.Fields[6].AsInteger:=WantedPerson.KATEGORIJA;
               CDSU.Fields[7].AsInteger:=Curr_Ud^.Shifr;
               CDSU.Fields[8].AsInteger:=Curr_Ud^.Period;
               if Curr_Ud^.YEAR<1900 then yy:=Curr_Ud^.YEAR+1990
               else yy:=Curr_Ud^.YEAR;
               CDSU.Fields[9].AsInteger:=YY;
               CDSU.Fields[10].AsInteger:=M;
               CDSU.Fields[11].AsInteger:=Y;
               CDSU.Fields[12].AsFloat:=Curr_Ud^.SUMMA;
               CDSU.Fields[13].AsInteger:=Curr_Ud^.VYPLACHENO;
               CDSU.Fields[14].AsString:=StringReplace(Trim(Curr_Ud^.COUNT),'''','''''',[rfReplaceAll, rfIgnoreCase]);

               CDSU.Post;
               Curr_Ud:=Curr_Ud.Next;
          end;

    end;
  procedure TBatchPersonCopierToSql.FillCn;
    var Curr_Cn : Cn_Ptr;
        YY      : Integer;
    begin
         Curr_Cn:=WantedPerson.Cn;
         while (Curr_Cn<>Nil) do
          begin
               CDSC.Insert;
               CDSC.Fields[0].AsInteger:=0;
               CDSC.Fields[1].AsInteger:=ShifrIdPerson;
               CDSC.Fields[2].AsInteger:=WantedPerson.Tabno;
               CDSC.Fields[3].AsInteger:=W_Place;
               CDSC.Fields[4].AsInteger:=WantedPerson.Wid_Raboty;
               CDSC.Fields[5].AsInteger:=WantedPerson.Gruppa;
               CDSC.Fields[6].AsInteger:=WantedPerson.KATEGORIJA;
               CDSC.Fields[7].AsInteger:=M;
               CDSC.Fields[8].AsInteger:=Y;
               CDSC.Fields[9].AsInteger:=Curr_Cn^.Shifr;
               CDSC.Fields[10].AsInteger:=Curr_Cn^.Kod;
               CDSC.Fields[11].AsFloat:=Curr_Cn^.SUMMA;
               CDSC.Fields[12].AsInteger:=Curr_Cn^.Prim;
               CDSC.Fields[13].AsString:=StringReplace(Trim(Curr_Cn^.PRIM_1),'''','''''',[rfReplaceAll, rfIgnoreCase]);
               CDSC.Fields[14].AsInteger:=Curr_Cn^.DEJA_COUNTED;
               CDSC.Fields[15].AsFloat:=Curr_Cn^.FLOW_SUMMA;
               CDSC.Fields[16].AsFloat:=Curr_Cn^.LIMIT_SUMMA;
               CDSC.Fields[17].AsString:=StringReplace(Trim(Curr_Cn^.COUNT),'''','''''',[rfReplaceAll, rfIgnoreCase]);
               CDSC.Fields[18].AsFloat:=Curr_Cn^.AUTOMATIC;

               CDSC.Post;
               Curr_Cn:=Curr_Cn.Next;
          end;

    end;
  procedure TBatchPersonCopierToSql.FillTabel;
    var i:Integer;
    begin
         for i:=1 to 31 do
             begin
                  CDST.Insert;
                  CDST.Fields[0].AsInteger := 0;
                  CDST.Fields[1].AsInteger := i;
                  CDST.Fields[2].AsInteger := WantedPerson.Tabel[I];
                  CDST.Fields[3].AsInteger := ShifrIdPerson;
                  CDST.Post;
             end;
    end;
  function CDSFactory(tableName:String;var InsertStatement:widestring):TpFIBClientDataSet;
   var
       i,c,cc,j:Integer;
       CDS:TpFIBClientDataSet;
       s:string;
       InsertSQLStmnt,ValuePart,SelectSQLStmnt:widestring;

   begin
        CDSFactory:=Nil;
        CDS:=nil;

        FIB.pFIBDataSetDynamic.SQLs.SelectSQL.Clear;
        FIB.pFIBDataSetDynamic.SQLs.SelectSQL.Add('select * from '+tableName+' where 2=5');
        FIB.pFIBDataSetDynamic.Transaction.StartTransaction;
        FIB.pFIBDataSetDynamic.Open;

        InsertSQLStmnt:='';
        SelectSQLStmnt:='';
        ValuePart:='';
        c:=FIB.pFIBDataSetDynamic.FieldCount;
        if c>0 then
           begin
                CDS:=TpFIBClientDataSet.Create(Nil);
                CDS.Name:='cds'+tableName;
     //           CDS.dataBase:=FIB.pFIBDatabaseSal;
                CDS.Fields.Clear;
                InsertSQLStmnt:='insert into '+tableName+' (';
                SelectSQLStmnt:='select';
                j:=-1;
                for i:=0 to c-1 do
                    begin
                         if Pos('WRK',Upper_STRING(FIB.pFIBDataSetDynamic.Fields[i].FieldName))>1 then Continue;
                         Inc(j);
                         with CDS.FieldDefs.AddFieldDef do
                           begin
                                DataType := FIB.pFIBDataSetDynamic.Fields[I].DataType;
                                Name     := FIB.pFIBDataSetDynamic.Fields[I].FieldName;
                           end;
                         if j>0 then
                            begin
                                 InsertSQLStmnt  := trim(InsertSQLStmnt)  + ',';
                                 SelectSQLStmnt  := trim(SelectSQLStmnt)  + ',';
                                 ValuePart := trim(ValuePart) + ',';
                            end;
                         InsertSQLStmnt  := trim(InsertSQLStmnt) +    trim(FIB.pFIBDataSetDynamic.Fields[I].FieldName);
                        ValuePart       := trim(ValuePart)+':'+trim(FIB.pFIBDataSetDynamic.Fields[i].FieldName);
                         SelectSQLStmnt  := trim(SelectSQLStmnt) + ' '+   trim(FIB.pFIBDataSetDynamic.Fields[I].FieldName);
                    end;
                CDS.CreateDataSet;
                InsertSQLStmnt  := trim(InsertSQLStmnt) +  ') values (' + trim(ValuePart)+')';
                SelectSQLStmnt  := trim(SelectSQLStmnt) +  ' from ' + trim(tableName)+' where 1=2';
                InsertStatement := InsertSQLStmnt;
           end;
        FIB.pFIBDataSetDynamic.Close;
        FIB.pFIBDataSetDynamic.Transaction.Commit;
  {
        CDS.SelectSQL.Clear;
        CDS.InsertSQL.Clear;
        CDS.DeleteSQL.Clear;
        CDS.RefreshSQL.Clear;
        CDS.SelectSQL.Add(SelectSQLStmnt);
        CDS.InsertSQL.Add(InsertSQLStmnt);
        CDS.CachedUpdates:=True;
        CDS.UpdateRecordTypes:=[cusInserted];
        CDS.Transaction:=FIB.pFIBTransactionRead;
        CDS.UpdateTransaction:=FIB.pFIBTransactionSAL;
        CDS.AutoUpdateOptions.UseExecuteBlock:=True;
        CDS.AutoCommit:=False;
  }
        CDSFactory:=CDS;
   end;

  function TestCDS(Curr_Person:Person_Ptr):boolean;
    var BPC:TBatchPersonCopierToSQL;
        BCS:TBatchCopierToSql;
        isTransactionWorked:Boolean;
   begin
        isTransactionWorked:=False;
        if FIB.pFIBQuery.Transaction.Active then
           isTransactionWorked:=True;
        BCS:=TBatchCopierToSql.Create(CurrentYear,NMES);
        BPC:=TBatchPersonCopierToSQL.Create(Curr_Person,NSRV,BCS);
        BPC.CopyPersonToCDS;
        BPC.Free;
        BCS.CopyCDSToSQL;
        BCS.Free;
        if FIB.pFIBQuery.Transaction.Active then
           FIB.pFIBQuery.Transaction.Commit;
        if isTransactionWorked then
           FIB.pFIBQuery.Transaction.StartTransaction;

   end;

  function TestCDSPodr:boolean;
    var BPC:TBatchPersonCopierToSQL;
        Curr_person:PERSON_PTR;
        BCS:TBatchCopierToSql;
        isTransactionWorked:Boolean;
   begin
        isTransactionWorked:=False;
        if FIB.pFIBQuery.Transaction.Active then
           isTransactionWorked:=True;
        FIB.pFIBDatabaseSal.Execute('Delete from tb_c_person where w_place='+IntToStr(NSRV));
        BCS:=TBatchCopierToSql.Create(CurrentYear,NMES);
        Curr_Person:=HEAD_PERSON;
        while (Curr_person<>Nil) do
          begin
               BPC:=TBatchPersonCopierToSQL.Create(Curr_Person,NSRV,BCS);
               BPC.CopyPersonToCDS;
               BPC.Free;
               Curr_Person:=Curr_Person^.NEXT;
          end;
        BCS.CopyCDSToSQL;
        BCS.Free;
        if FIB.pFIBQuery.Transaction.Active then
           FIB.pFIBQuery.Transaction.Commit;

        if isTransactionWorked then
           FIB.pFIBQuery.Transaction.StartTransaction;

        if FIB.pFIBQuery.Database=Nil then
           FIB.pFIBQuery.DataBase:=FIB.pFIBDatabaseSal;
   end;

  function TestCDSFull:boolean;
    var BPC:TBatchPersonCopierToSQL;
        Curr_person:PERSON_PTR;
        BCS:TBatchCopierToSql;
        NSRVTmp:Integer;
        i:Integer;
        isTransactionWorked:Boolean;
   begin
        isTransactionWorked:=False;
        if FIB.pFIBQuery.Transaction.Active then
           isTransactionWorked:=True;
        FIB.pFIBDatabaseSal.Execute('Delete from tb_c_person');
        NSRVTMP:=NSRV;
        PUTINF;
        Application.CreateForm(TFormProgress, FormProgress);
        FormProgress.Gauge.MinValue:=0;
        FormProgress.Gauge.MaxValue:=Count_Serv;
        FormProgress.Gauge.Progress:=0;
        FormProgress.LabelHeader.Caption:='';
        FormProgress.LabelFooter.Caption:='';
        FormProgress.Caption:='Запись всех подразделений';
        FormProgress.Show;

        while (HEAD_PERSON<>NIL) do DEL_PERSON(Head_Person);
        BCS:=TBatchCopierToSql.Create(CurrentYear,NMES);
        for i:=1 to Count_Serv do
            begin
                 NSRV:=I;
                 MKFLNM;
                 FormProgress.Gauge.Progress:=I;
                 FormProgress.LabelHeader.Caption:=NAME_SERV(I);
                 FormProgress.LabelFooter.Caption:=NAME_SERV(I);
                 FormProgress.RePaint;
                 Application.ProcessMessages;


                 if not FileExists(FNINF) then Continue;
                 GETINF(false);
                 Curr_Person:=HEAD_PERSON;
                 while (Curr_person<>Nil) do
                    begin
                         BPC:=TBatchPersonCopierToSQL.Create(Curr_Person,NSRV,BCS);
                         BPC.CopyPersonToCDS;
                         BPC.Free;
                         Curr_Person:=Curr_Person^.NEXT;
                    end;
                 while (HEAD_PERSON<>NIL) do DEL_PERSON(Head_Person);
                 if i mod 30 = 0 then
                    BCS.CopyCDSToSQL;
            end;
        BCS.CopyCDSToSQL;
        BCS.Free;
        if FIB.pFIBQuery.Transaction.Active then
           FIB.pFIBQuery.Transaction.Commit;
        if isTransactionWorked then
           FIB.pFIBQuery.Transaction.StartTransaction;
        FormProgress.Hide;
        FormProgress.Free;
        Application.ProcessMessages;
        NSRV:=NSRVTmp;
        MKFLNM;
        GETINF(true);
   end;

end.
