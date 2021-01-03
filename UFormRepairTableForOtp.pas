unit UFormRepairTableForOtp;
                                
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DB, DBClient, frxClass, frxDBSet;

type
  TFormRepairTableForOtp = class(TForm)
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ClientDataSetOtp: TClientDataSet;
    ClientDataSetOtpTabno: TIntegerField;
    ClientDataSetOtpFio: TStringField;
    ClientDataSetOtpDolg: TStringField;
    ClientDataSetOtpRbB: TIntegerField;
    ClientDataSetOtpRbA: TIntegerField;
    ClientDataSetOtpShifrPod: TIntegerField;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    ClientDataSetOtpBlock: TStringField;
    ClientDataSetOtpSummaOklad: TFloatField;
    CheckBoxCorr: TCheckBox;
    BitBtn3: TBitBtn;
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure BitBtn1Click(Sender : TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    procedure RepairTabelForOtp;
    procedure RepairTabelForOtpFromOtp;
   // procedure RepairTabelSowmForOtp;
    procedure RepairTabelSowmForOtpVers2013;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRepairTableForOtp: TFormRepairTableForOtp;

implementation
 uses dateutils,ScrIO,ScrDef,ScrUtil,UFibModule,ScrNalog, UFormSelPKG, ScrLists;
                        
{$R *.dfm}

procedure TFormRepairTableForOtp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormRepairTableForOtp.BitBtn1Click(Sender: TObject);
begin
     if NameServList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;

//     RepairTabelForOtpFromOtp;
//     RepairTabelForOtp;
     RepairTabelSowmForOtpVers2013;
end;

procedure TFormRepairTableForOtp.RepairTabelForOtp;
 type TPersonOtpRec=record
                     tabno  : integer;
                     DateFr : TDateTime;
                     DateTo : TDateTime;
                   end;
      PPersonOtpRec=^TPersonOtpRec;
 var SavNMES,SavNSRV:integer;
     PersonOtpRec:PPersonOtpRec;
     List   : TList;
     I_Nsrv,I,J : integer;
     Curr_Person : Person_Ptr;
     Curr_Add    : Add_Ptr;
     Finded      : boolean;
     DateFr,DateTo : TDateTime;
     Need_Put : boolean;
     SQLStmnt : string;
     Y,M,D    : word;
 begin
      SavNmes := NMES;
      SavNSRV := NSRV;
      PutInf;
      EMPTY_ALL_PERSON;
      List:=TList.Create;
      NMES:=5;
      ProgressBar1.Max:=Count_Serv*2;
      ProgressBar1.Min:=0;
      ProgressBar1.Position:=0;
      for i_nsrv:=1 to Count_Serv do
          begin
                Progressbar1.Position:=progressBar1.Position+1;
                Application.ProcessMessages;
                NSRV:=I_NSRV;
                MkFlNm;
                if not FileExists(FNINF)  then continue;
                getinf(false);
                Curr_Person:=Head_Person;
                while (Curr_Person<>Nil) do
                   begin
                        Curr_Add:=Curr_Person^.ADD;
                        while (Curr_Add<>Nil)  do
                           begin
                                if Curr_Add^.Shifr=HOLIDAY_FLOW_SHIFR then
                                if Curr_Person^.Holiday[1,1,3]<2009-1900 then
                                   begin
                                        finded:=false;
                                        if List.Count>0 then
                                           for i:=0 to List.Count-1 do
                                               if PPersonOtpRec(List.Items[i])^.Tabno=Curr_Person^.TABNO then
                                                  begin
                                                       Finded:=true;
                                                       break;
                                                  end;
                                        If not finded then
                                           begin
                                                new(PersonOtpRec);
                                                FillChar(PersonOtpRec^,Sizeof(TPersonOtpRec),0);
                                                PersonOtpRec^.tabno:=Curr_Person^.TABNO;
                                                List.Add(PersonOtpRec);
                                           end;
                                        break;
                                   end;
                                Curr_Add:=Curr_Add^.NEXT;
                           end;
                        Curr_Person:=Curr_Person^.NEXT;
                   end;
                EMPTY_ALL_PERSON;
          end;
      ShowMessage('Найдено '+IntToStr(List.Count)+' записей');
      if List.Count>0 then
         begin
      SQLStmnt:= 'select tabno,f_data,l_data from otpuska where Year_Vy=2009 and Month_Vy=6 and extract(year from data_pere)=2009';
      if not FIB.pFIBQuery.Transaction.Active then
         FIB.pFIBQuery.Transaction.StartTransaction;
      FIB.pFIBQuery.SQL.Clear;
      FIB.pFIBQuery.SQL.Add(SQLStmnt);
      FIB.pFIBQuery.ExecQuery;
      while not FIB.pFIBQuery.Eof do
            begin
                 J:=FIB.pFIBQuery.FieldByName('TABNO').AsInteger;
                 for i:=0 to List.Count-1 do
                     if PPersonOtpRec(List.Items[i])^.tabno=j then
                     if YearOf(PPersonOtpRec(List.Items[i])^.DateFr)<>2009 then
                        begin
                             PPersonOtpRec(List.Items[i])^.DateFr:=FIB.pFIBQuery.FieldByName('F_Data').AsDateTime;
                             PPersonOtpRec(List.Items[i])^.DateTo:=FIB.pFIBQuery.FieldByName('L_Data').AsDateTime;
                             break;
                        end;
                 FIB.pFIBQuery.Next;
            end;
      FIB.pFIBQuery.Transaction.Commit;


      Inc(NMES);
      Y:=2009;
      M:=NMes;
      D:=1;
      DateFr:=EnCodedate(Y,M,D);
      D:=30;
      DateTo:=EnCodedate(Y,M,D);
      for i_nsrv:=1 to Count_Serv do
          begin
                Progressbar1.Position:=progressBar1.Position+1;
                Application.ProcessMessages;
                NSRV:=I_NSRV;
                MkFlNm;
                if not FileExists(FNINF) then continue;
                getinf(false);
                Curr_Person:=Head_Person;
                Need_Put:=false;
                while (Curr_Person<>Nil) do
                   begin
                        Finded:=false;
                        for i:=0 to List.Count-1 do
                            if (Curr_Person^.Tabno=PPersonOtpRec(List.Items[i])^.tabno) then
                               begin
                                    Finded:=true;
                                    break;
                               end;
                        if (Finded) then
                        if pos('ПОВ',Trim(Upper_String(Curr_Person^.Dolg)))=1 then
                        if (YearOf(PPersonOtpRec(List.Items[i])^.DateFr)=2009) then
                        if (YearOf(PPersonOtpRec(List.Items[i])^.DateTo)=2009) then
                        if (CompareDate(PPersonOtpRec(List.Items[i])^.DateTo,PPersonOtpRec(List.Items[i])^.DateFr)>=0) then
                        if not (CompareDate(PPersonOtpRec(List.Items[i])^.DateTo,DateFr)=-1) then
                        if not (CompareDate(PPersonOtpRec(List.Items[i])^.DateFr,DateTo)=1) then
                           begin
                                 Curr_Person^.HOLIDAY[1,1,1]:=DayOf(PPersonOtpRec(List.Items[i])^.DateFr);
                                 Curr_Person^.HOLIDAY[1,1,2]:=MonthOf(PPersonOtpRec(List.Items[i])^.DateFr);
                                 Curr_Person^.HOLIDAY[1,1,3]:=YearOf(PPersonOtpRec(List.Items[i])^.DateFr)-2000;
                                 Curr_Person^.HOLIDAY[1,2,1]:=DayOf(PPersonOtpRec(List.Items[i])^.DateTo);
                                 Curr_Person^.HOLIDAY[1,2,2]:=MonthOf(PPersonOtpRec(List.Items[i])^.DateTo);
                                 Curr_Person^.HOLIDAY[1,2,3]:=YearOf(PPersonOtpRec(List.Items[i])^.DateTo)-2000;
                                 Make_Otp_Tabel(Curr_Person,PPersonOtpRec(List.Items[i])^.DateFr,PPersonOtpRec(List.Items[i])^.DateTo);
                                 Need_Put:=true;
                           end;
                        Curr_Person:=Curr_Person^.NEXT;
                   end;
                if Need_Put then
                   PutInf;
                EMPTY_ALL_PERSON;
          end;
         end;      // if count>0
      List.Free;
      Nmes    := SavNMES;
      NSRV    := SavNSRV;
      MKFLNM;
      GETINF(true);

 end;


procedure TFormRepairTableForOtp.RepairTabelForOtpFromOtp;
 type TPersonOtpRec=record
                     tabno  : integer;
                     DateFr : TDateTime;
                     DateTo : TDateTime;
                   end;
      PPersonOtpRec=^TPersonOtpRec;
 var SavNMES,SavNSRV:integer;
     PersonOtpRec : PPersonOtpRec;
     List         : TList;
     I_Nsrv,I,J   : integer;
     Curr_Person  : Person_Ptr;
     Curr_Add     : Add_Ptr;
     Finded       : boolean;
     DateFr,DateTo : TDateTime;
     Need_Put     : boolean;
     SQLStmnt     : string;
     Y,M,D        : word;
     O_Day,W_Day,W1_Day  : integer;
     yf,yt,mf,mt,df,dt:integer;
 begin
      SavNmes := NMES;
      SavNSRV := NSRV;
      PutInf;
      EMPTY_ALL_PERSON;
      List:=TList.Create;
      NMES:=7;
      ProgressBar1.Max:=Count_Serv;
      ProgressBar1.Min:=0;
      ProgressBar1.Position:=0;
      SQLStmnt:= 'select tabno,f_data,l_data from otpuska where Year_Vy=2009 and Month_Vy=6 and extract(year from data_pere)=2009 and Marked=1';
      if not FIB.pFIBQuery.Transaction.Active then
         FIB.pFIBQuery.Transaction.StartTransaction;
      FIB.pFIBQuery.SQL.Clear;
      FIB.pFIBQuery.SQL.Add(SQLStmnt);
      FIB.pFIBQuery.ExecQuery;
      while not FIB.pFIBQuery.Eof do
            begin
                 J:=FIB.pFIBQuery.FieldByName('TABNO').AsInteger;
                 Finded:=false;
                 if List.Count>0 then
                    for i:=0 to List.Count-1 do
                        if PPersonOtpRec(List.Items[i])^.tabno=j then
                           begin
                                Finded:=true;
                                Exit;
                           end;
                 if not finded then
                    begin
                          New(PersonOtpRec);
                          PersonOtpRec^.Tabno := j;
                          PersonOtpRec^.DateFr:= FIB.pFIBQuery.FieldByName('f_data').AsDateTime;
                          PersonOtpRec^.DateTo:= FIB.pFIBQuery.FieldByName('l_data').AsDateTime;
                          List.Add(PersonOtpRec);
                    end;
                 FIB.pFIBQuery.Next;
            end;
      FIB.pFIBQuery.Transaction.Commit;


      Y:=2009;
      M:=NMes;
      D:=1;
      DateFr:=EnCodedate(Y,M,D);
      D:=30;
      DateTo:=EnCodedate(Y,M,D);
      for i_nsrv:=1 to Count_Serv do
          begin
                Progressbar1.Position:=progressBar1.Position+1;
                Application.ProcessMessages;
                NSRV:=I_NSRV;
                MkFlNm;
                if not FileExists(FNINF) then continue;
                getinf(false);
                Curr_Person:=Head_Person;
                Need_Put:=false;
                while (Curr_Person<>Nil) do
                   begin
                        Finded:=false;
                        for i:=0 to List.Count-1 do
                            if (Curr_Person^.Tabno=PPersonOtpRec(List.Items[i])^.tabno) then
                               begin
                                    Finded:=true;
                                    break;
                               end;
                        if Finded then
                           begin
                                yf:=yearof(PPersonOtpRec(List.Items[i])^.DateFr);
                                mf:=monthof(PPersonOtpRec(List.Items[i])^.DateFr);
                                df:=dayof(PPersonOtpRec(List.Items[i])^.DateFr);
                                yt:=yearof(PPersonOtpRec(List.Items[i])^.DateTo);
                                mt:=monthof(PPersonOtpRec(List.Items[i])^.DateTo);
                                dt:=dayof(PPersonOtpRec(List.Items[i])^.DateTo);
                           end;
                        if (Finded) then
                        if (YearOf(PPersonOtpRec(List.Items[i])^.DateFr)=2009) then
                        if (YearOf(PPersonOtpRec(List.Items[i])^.DateTo)=2009) then
                        if (CompareDate(PPersonOtpRec(List.Items[i])^.DateTo,PPersonOtpRec(List.Items[i])^.DateFr)>=0) then
                        if not (CompareDate(PPersonOtpRec(List.Items[i])^.DateTo,DateFr)=-1) then
                        if not (CompareDate(PPersonOtpRec(List.Items[i])^.DateFr,DateTo)=1) then
                           begin
                                 Curr_Person^.HOLIDAY[1,1,1]:=DayOf(PPersonOtpRec(List.Items[i])^.DateFr);
                                 Curr_Person^.HOLIDAY[1,1,2]:=MonthOf(PPersonOtpRec(List.Items[i])^.DateFr);
                                 Curr_Person^.HOLIDAY[1,1,3]:=YearOf(PPersonOtpRec(List.Items[i])^.DateFr)-2000;
                                 Curr_Person^.HOLIDAY[1,2,1]:=DayOf(PPersonOtpRec(List.Items[i])^.DateTo);
                                 Curr_Person^.HOLIDAY[1,2,2]:=MonthOf(PPersonOtpRec(List.Items[i])^.DateTo);
                                 Curr_Person^.HOLIDAY[1,2,3]:=YearOf(PPersonOtpRec(List.Items[i])^.DateTo)-2000;
                                 W_Day:=Work_Day(1,31,Curr_Person);
                                 Make_Otp_Tabel(Curr_Person,PPersonOtpRec(List.Items[i])^.DateFr,PPersonOtpRec(List.Items[i])^.DateTo);
                                 W1_Day:=Work_Day(1,31,Curr_Person);
                                 if W_day<>W1_Day then
                                    Calc_Naud_Person(Curr_Person,31);
                                 O_Day:=Otpusk_Day(1,Curr_Person);
                                 Need_Put:=true;
                             end;
                        Curr_Person:=Curr_Person^.NEXT;
                   end;
                if Need_Put then
                   PutInf;
                EMPTY_ALL_PERSON;
          end;
      List.Free;
      Nmes    := SavNMES;
      NSRV    := SavNSRV;
      MKFLNM;
      GETINF(true);

 end;

procedure TFormRepairTableForOtp.RepairTabelSowmForOtpVers2013;
 type TPersonOtpRec=record
                     tabno  : integer;
                     t      : array[1..31] of Byte;
                     dateFr : TDateTime;
                     DateTo : TDateTime;
                   end;
      PPersonOtpRec=^TPersonOtpRec;
 var SavNMES,SavNSRV:integer;
     List   : TList;
     I_Nsrv,I,J,o1,o2 : integer;
     Curr_Person : Person_Ptr;
     Curr_Add    : Add_Ptr;
     Finded      : boolean;
     DateFr,DateTo : TDateTime;
     Need_Put : boolean;
     Y,M,D    : word;
     W_D      : integer;
     I_need   : Integer;
     PersonOtpRec:PPersonOtpRec;
     SummaAdd:Real;

 procedure FillList;
   var
     SQLStmnt : string;
     Y,M,D    : word;
     i        : Integer;
     DateFr   : TDateTime;
     DateTo   : TDateTime;
     DataFrS  : string;
     DataToS  : string;
     YS       : string;
     IsStarted : Boolean;
     CurrTabno:Integer;
     Finded   : Boolean;
     PersonOtpRec:PPersonOtpRec;
     df,dt:Integer;
   begin
     y:=WORK_YEAR_VAL;
     m:=NMES;
     DateFr:=EncodeDate(y,m,1);
     DateTo:=EncodeDate(y,m,LenMonth(DateFr));
     DataFrS:=IntToStr(y)+'-'+IntToStr(m)+'-1';
     DataToS:=IntToStr(y)+'-'+IntToStr(m)+'-'+IntToStr(LenMonth(DateFr));
     YS:=IntToStr(Y);
     SQLStmnt:=         'select a.tabno, a.f_data,a.l_data from otpuska a';
     SQLStmnt:=SQLStmnt+' where not ((a.f_data>'''+DataToS+''') or (a.l_data<'''+DataFrS+'''))';
     SQLStmnt:=SQLStmnt+' and exists (select  * from otp_res b where b.shifridotp=a.shifrid';
     SQLStmnt:=SQLStmnt+' and (extract(year from b.data_pere_bud)='+YS+' or';
     SQLStmnt:=SQLStmnt+'      extract(year from b.data_pere_vne)='+YS+' or';
     SQLStmnt:=SQLStmnt+'      extract(year from b.data_pere_gn)=' +YS+' or';
     SQLStmnt:=SQLStmnt+'      extract(year from b.data_pere_nis)='+YS+'))';
     SQLStmnt:=SQLStmnt+' order by a.tabno';
     IsStarted:=false;
     if not FIB.pFIBQuery.Transaction.Active then
        begin
             FIB.pFIBQuery.Transaction.StartTransaction;
             IsStarted:=True;
        end;
      FIB.pFIBQuery.SQL.Clear;
      FIB.pFIBQuery.SQL.Add(SQLStmnt);
      FIB.pFIBQuery.ExecQuery;
      CurrTabno:=0;
      while not FIB.pFIBQuery.Eof do
        begin
            finded:=False;
            if List.Count>0 then
                for i:=0 to List.Count-1 do
                    if (pPersonOtpRec(List.Items[i]).tabno=FIB.pFIBQuery.Fields[0].AsInteger) then
                       begin
                            PersonOtpRec:=pPersonOtpRec(List.Items[i]);
                            finded:=True;
                            Break;
                       end;
            if not Finded then
               begin
                    New(PersonOtpRec);
                    PersonOtpRec.tabno:=FIB.pFIBQuery.Fields[0].AsInteger;
                    for i:=1 to 31 do PersonOtpRec.t[i]:=0;
                    if DateFr>=FIB.pFIBQuery.Fields[1].AsDate then df:=1
                       else df:=DayOf(FIB.pFIBQuery.Fields[1].AsDate);
                    if FIB.pFIBQuery.Fields[2].AsDate>DateTo then dt:=DayOf(DateTo)
                       else dt:=DayOf(FIB.pFIBQuery.Fields[2].AsDate);
                    if (dt>=df) then
                    for i:=df to dt do
                        PersonOtpRec.t[i]:=1;
                    PersonOtpRec.dateFr:=FIB.pFIBQuery.Fields[1].AsDate;
                    PersonOtpRec.dateTo:=FIB.pFIBQuery.Fields[2].AsDate;
                    List.Add(PersonOtpRec);
               end
            else
               begin
                    if DateFr>=FIB.pFIBQuery.Fields[1].AsDate then df:=1
                       else df:=DayOf(FIB.pFIBQuery.Fields[1].AsDate);
                    if FIB.pFIBQuery.Fields[2].AsDate>DateTo then dt:=DayOf(DateTo)
                       else dt:=DayOf(FIB.pFIBQuery.Fields[2].AsDate);
                    if (dt>=df) then
                    for i:=df to dt do
                        PersonOtpRec.t[i]:=1;

               end;
            FIB.pFIBQuery.Next;
        end;
      FIB.pFIBQuery.Close;
      if IsStarted then
         FIB.pFIBQuery.Transaction.Commit;
   end;
 begin
      SavNmes := NMES;
      SavNSRV := NSRV;
      PutInf;
      EMPTY_ALL_PERSON;
      List:=TList.Create;
      FillList;
      ProgressBar1.Max:=Count_Serv;
      ProgressBar1.Min:=0;
      ProgressBar1.Position:=0;
      ShowMessage('Отпускных= '+IntToStr(List.Count)+' записей');
      if List.Count>0 then
         begin
              i_need:=0;
              ClientDataSetOtp.Open;
              for i_nsrv:=1 to Count_Serv do
                  begin
                        Progressbar1.Position:=progressBar1.Position+1;
                        Application.ProcessMessages;
                        NSRV:=I_NSRV;
                        if not NameServList.IsSelected(NSRV) then continue;

                        MkFlNm;
                        if not FileExists(FNINF) then continue;
                        getinf(false);
                        Curr_Person:=Head_Person;
                        Need_Put:=false;
                        while (Curr_Person<>Nil) do
                              begin
                                   if Curr_Person^.tabno=1356 then
                                      Curr_Person^.tabno:=1356;
                                   Finded:=false;
                                   for i:=0 to List.Count-1 do
                                      if (Curr_Person^.Tabno=PPersonOtpRec(List.Items[i])^.tabno) then
                                         begin
                                               Finded:=true;
                                               PersonOtpRec:=PPersonOtpRec(List.Items[i]);
                                               break;
                                         end;
                                   if Finded then
                                   if NSRV in [76,79,81,82,102,105,106,121,140] then
                                      Finded:=False;   
                                   if (Finded) then
                                      begin
                                           o1:=work_day(1,31,Curr_Person);
                                           for i:=1 to 31 do
                                               if PersonOtpRec.t[i]=1 then
                                               if Curr_Person^.TABEL[i]=JAWKA then
                                                  Curr_Person^.TABEL[i]:=TARIFN_OTPUSK;
                                           o2:=work_day(1,31,Curr_Person);
                                           if o1<>o2 then
                                              begin
                                                   SummaAdd:=0;
                                                   Curr_Add:=Curr_Person^.ADD;
                                                   while (Curr_Add<>Nil) do
                                                     begin
                                                          if Curr_Add^.SHIFR=1 then
                                                             SummaAdd:=SummaAdd+Curr_Add^.SUMMA;
                                                          Curr_Add:=Curr_Add^.NEXT;
                                                     end;
                                                   if SummaAdd>0.01 then
                                                      begin
                                                           ClientDataSetOtp.Insert;
                                                           ClientDataSetOtpTabno.Value:=Curr_Person^.TABNO;
                                                           ClientDataSetOtpFio.Value:=Curr_Person^.FIO;
                                                           ClientDataSetOtpDolg.Value:=Curr_Person^.Dolg;
                                                           ClientDataSetOtpRbB.Value:=O1;
                                                           ClientDataSetOtpRbA.VAlue:=O2;
                                                           ClientDataSetOtpShifrPod.Value:=NSRV;
                                                           ClientDataSetOtpSummaOklad.Value:=SummaAdd;
                                                           if Curr_Person^.Automatic=MANUAL_MODE then
                                                              ClientDataSetOtpBlock.Value:='Бл'
                                                           else
                                                              ClientDataSetOtpBlock.Value:='';
                                                           ClientDataSetOtp.Post;
                                                      end;
                                                   if CheckBoxCorr.Checked then
                                                   if Curr_Person^.Automatic=AUTOMATIC_MODE then
                                          //         if SummaAdd<0.01 then
                                                      begin
                                                           Need_Put:=true;
                                                           I_Need:=I_Need+1;
                                                           CALC_NAUD_PERSON(Curr_Person,31);
                                                      end
                                              end;

                                          Curr_Person^.HOLIDAY[1,1,1]:=DayOf(PPersonOtpRec(List.Items[i])^.DateFr);
                                          Curr_Person^.HOLIDAY[1,1,2]:=MonthOf(PPersonOtpRec(List.Items[i])^.DateFr);
                                          Curr_Person^.HOLIDAY[1,1,3]:=YearOf(PPersonOtpRec(List.Items[i])^.DateFr)-2000;
                                          Curr_Person^.HOLIDAY[1,2,1]:=DayOf(PPersonOtpRec(List.Items[i])^.DateTo);
                                          Curr_Person^.HOLIDAY[1,2,2]:=MonthOf(PPersonOtpRec(List.Items[i])^.DateTo);
                                          Curr_Person^.HOLIDAY[1,2,3]:=YearOf(PPersonOtpRec(List.Items[i])^.DateTo)-2000;
//                                          Make_Otp_Tabel(Curr_Person,PPersonOtpRec(List.Items[i])^.DateFr,PPersonOtpRec(List.Items[i])^.DateTo);
//                                          Calc_Naud_Person(Curr_Person,31);

                                      end;
                                   Curr_Person:=Curr_Person^.NEXT;
                              end;
                        if CheckBoxCorr.Checked then
                        if Need_Put then
                           PutInf;
                        EMPTY_ALL_PERSON;
                  end;
         end;      // if count>0
      if List.Count>0 then
         frxReport1.ShowReport;
      ClientDataSetOtp.Close;
      ShowMessage('Исправлено '+IntToStr(I_Need)+' записей');
      if List.Count>0 then
         for i:=0 to List.Count-1 do
             Dispose(PPersonOtpRec(List.Items[i]));
      List.Free;
      Nmes    := SavNMES;
      NSRV    := SavNSRV;
      MKFLNM;
      GETINF(true);

 end;


procedure TFormRepairTableForOtp.FormCreate(Sender: TObject);
begin
      CheckBoxCorr.Checked:=False;
end;

procedure TFormRepairTableForOtp.BitBtn3Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;

end;

end.
