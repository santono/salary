unit UFormMkOtp14_10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons,ScrDef, ExtCtrls, FIBQuery,
  pFIBQuery, FIBDatabase, pFIBDatabase;

type
  TFormMkOtp14_10 = class(TForm)
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    pFIBTransaction1: TpFIBTransaction;
    pFIBQuery1: TpFIBQuery;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    function  CalculateOtp(WantedMonth:integer):integer;
    procedure CalculateOtpPerson(Curr_Person:Person_Ptr;var NeedPut:boolean;wantedM:integer;summa,summahelp:Real);

    function  needOtpPerson(Curr_Person:Person_Ptr;wantedM:integer):boolean;
    function  FillList(WantedMonth:integer):boolean;
    function  GetOtpData(Tabno:integer;var Summa,SummaHelp:real):boolean;
    procedure DeleteOldRas;
    procedure DeleteEmptyPerson;



    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMkOtp14_10: TFormMkOtp14_10;

implementation
  uses uformselpkg,ScrUtil,ScrLists,ScrIO,UFibModule,ScrNalog;

{$R *.dfm}

  type pOtpRec=^tOtpRec;
       tOtpRec=record
                tabno:integer;
                summa:Real;
                summahelp:Real;
               end;
  var otpList:TList;


function TFormMkOtp14_10.FillList(WantedMonth:integer):boolean;
  var otpRec:pOtpRec;
      SQLStmnt:string;
  begin
       if Assigned(otpList) then otpList.Free;
       otpList:=nil;
       otpList:=TList.Create;
       SQLStmnt:='SELECT TABNO,SUMMA,OKLADPED FROM PR_RELALC_OTP_14_SEV('+intToStr(WANTEDMONTH)+')';
       pFIBQuery1.Sql.Clear;
       pFIBQuery1.Sql.Add(SqlStmnt);
       pFIBQuery1.Transaction.StartTransaction;
       pFibQuery1.ExecQuery;
       while not pFIBQuery1.Eof do
        begin
             if pFIBQuery1.Fields[1].AsFloat>10 then
                begin
                     New(otpRec);
                     otpRec.tabno:=pFIBQuery1.Fields[0].AsInteger;
                     otpRec.Summa:=pFIBQuery1.Fields[1].AsFloat;
                     otpRec.summahelp:=pFIBQuery1.Fields[2].AsFloat;
                     otpList.Add(otpRec);
                end;
             pFIBQuery1.Next;
        end;
       pFibQuery1.Close;
       pFIBQuery1.Transaction.Commit;
       if otpList.count>0 then FillList:=True
                          else fillList:=False;  
  end;

function TFormMkOtp14_10.GetOtpData(Tabno:integer;var Summa,SummaHelp:real):boolean;
  var retVal:Boolean;
      i:Integer;
  begin
       retVal:=False;
       summa:=0;
       summahelp:=0;
       if Assigned(otpList) then
       if otpList.Count>0 then
          for i:=0 to otpList.Count-1 do
              begin
                   if pOtpRec(otpList.Items[i]).Tabno=tabno then
                      begin
                           summa:=pOtpRec(otpList.Items[i]).summa;
                           summahelp:=pOtpRec(otpList.Items[i]).summahelp;
                           retVal:=True;
                           Dispose(pOtpRec(otpList.Items[i]));
                           otpList.Delete(i);
                           break
                      end;
              end;
       GetOtpData:=retVal;

  end;


procedure TFormMkOtp14_10.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormMkOtp14_10.BitBtn2Click(Sender: TObject);
begin
      Application.CreateForm(TFormSelPKG,FormSelPKG);
      FormSelPKG.ShowModal;
end;


procedure TFormMkOtp14_10.FormCreate(Sender: TObject);
begin
     Label1.Caption        := '';
     Label2.Caption        := '';
end;




procedure TFormMkOtp14_10.CalculateOtpPerson(Curr_Person:Person_Ptr;var NeedPut:boolean;wantedM:integer;Summa,SummaHelp:real);
  const Otp14_id=14;
  var Curr_Add:ADD_PTR;
      New_Person:PERSON_PTR;
      Finished:boolean;
      I_C,I:Integer;
      L:Integer;
      finded:Boolean;
      PersonOsn : Person_Ptr;
      SummaAdd  : Real;
      SummaUd   : Real;
      SummaNal  : Real;
      Is3Add    : Boolean;
      SavNextPerson,c_p:PERSON_PTR;
      Blocked:Boolean;
  begin
       finded:=False;
       curr_add:=curr_Person^.ADD;
       while (Curr_Add<>Nil) do
         begin
              if  Curr_Add.period=wantedm then
                  begin
                       finded:=True;
                       Break;
                  end;
              Curr_Add:=Curr_Add.NEXT;
         end;
       if finded then Exit;  
       Is3Add:=False;
       new_person:=nil;
       if Curr_Person.Gruppa<>1 then
          begin
              finded:=false;
              c_p:=head_Person;
              while (c_p<>Nil) do
                begin
                     if c_p^.tabno=curr_person^.tabno then
                     if GET_DOL_CODE(c_p)=1530 then
                     if c_p^.gruppa=1 then
                        begin
                             new_person:=c_p;
                             finded:=True;
                             Break;
                        end;
                     c_p:=c_p^.next;
                end;
              if New_Person=nil then
                 begin
                      i_c:=Count_Person;
                      MAKE_PERSON(New_Person,Curr_Person);
                      i_c:=Count_Person;
                      l:=SizeOf(New_Person^)-SizeOf(New_Person^.NEXT);
                      SavNextPerson:=New_Person^.NEXT;
                      Move(Curr_Person^,New_Person^,L);
                      New_Person^.NEXT := SavNextPerson;
                      New_Person^.Add  := nil;
                      New_Person^.Ud   := nil;
                      New_Person^.Cn   := nil;
                      New_Person^.Sowm := nil;
                      New_Person^.DOLG := 'Буд.отп.';
                      MAKE_DOL_PERSON(New_Person,1530);
                      MakeGUID(New_Person);
                      New_Person^.GRUPPA := 1;
                      New_Person^.OKLAD  := 0;
                      New_Person^.WID_RABOTY:=SOWM_WID_RABOTY;
                      if IS_OSN_WID_RABOTY(Curr_Person) then
                          PUT_SWM_MODE_TO_PERSON(New_Person,1);
                 end;
              MAKE_ADD(Curr_Add,New_Person);
          end
       else
           MAKE_ADD(Curr_Add,Curr_Person);
       Curr_Add.SHIFR  := PerersZaProshlPeriody;
       Curr_Add.PERIOD := wantedM;
       Curr_Add.YEAR   := 2014-1990;
       Curr_Add.Summa  := Summa;
       Curr_Add.FZP    := Summa;
       Curr_Add.WHO    := otp14_id;
       if (wantedM=8) and (Curr_Person.KATEGORIJA=1)
          and (summahelp>100.00) then
       if IS_OSN_WID_RABOTY(CURR_PERSON) then
       if not isColedgPodr(NSRV) then
          begin
               if New_Person<>nil then
                   MAKE_ADD(Curr_Add,New_Person)
               else
                   MAKE_ADD(Curr_Add,Curr_Person);
               Curr_Add.SHIFR  := 20 ;
               Curr_Add.PERIOD := wantedM;
               Curr_Add.YEAR   := 2014-1990;
               Curr_Add.Summa  := SummaHelp;
               Curr_Add.FZP    := SummaHelp;
               Curr_Add.WHO    := otp14_id;
          end;
       blocked:=False;
       if New_Person<>nil then
          begin
               if New_Person.AUTOMATIC=manual_mode then
                  begin
                       blocked:=True;
                       New_Person.AUTOMATIC:=AUTOMATIC_MODE;
                  end;
               Update_Podoh(New_Person,wantedM,2014-1990);
               PROF_PERSON(New_PERSON);
               if Blocked then
                  New_Person.AUTOMATIC:=MANUAL_MODE;

          end
       else
          begin
               if Curr_Person.AUTOMATIC=manual_mode then
                  begin
                       blocked:=True;
                       Curr_Person.AUTOMATIC:=AUTOMATIC_MODE;
                  end;
               Update_Podoh(Curr_Person,wantedM,2014-1990);
               PROF_PERSON(CURR_PERSON);
               if Blocked then
                  Curr_Person.AUTOMATIC:=MANUAL_MODE;
          end;
       NeedPut:=True;
  end;


function TFormMkOtp14_10.CalculateOtp(WantedMonth:integer):integer;
 var I_Podr,Cnt:Integer;
     NSRVTmp,NMESTmp:Integer;
     RetVal :Integer;
     NeedPut:Boolean;
     Curr_Person:PERSON_PTR;
     I_C_1,I_C_2:Integer;
     summa,summahelp:Real;
begin
     if not ((NMES=10) and (CURRYEAR=2014)) then
        begin
             ShowMessage('Можно запустить только в октябре 2014');
             Exit;
        end;
     if NameServList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;

     if KategList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны категории');
             Exit;
        end;
     if GruppyList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны счета');
             Exit;
        end;

     RetVal  := 0;
     NSRVTmp := NSRV;
     NMESTmp := NMES;
     PutInf;
     LDEL_PERSON;
     ProgressBar1.Max      := Count_Serv;
     ProgressBar1.Min      := 0;
     ProgressBar1.Position := 0;
     Label1.Caption:='';
     Label2.Caption:='';
     Cnt           := 0;
     for i_podr:=1 to Count_Serv do
         begin
              Inc(Cnt);
              ProgressBar1.Position:=Cnt;
              Label1.Caption:=Name_Serv(I_Podr);
              Application.ProcessMessages;
              if not NameServList.IsSelected(I_podr) then Continue;
              NSRV:=I_Podr;
              MKFLNM;
              if not FileExists(FNINF) then Continue;
              GetInf(true);
              i_c_1:=Count_Person;
              NeedPut:=False;
              Curr_Person:=HEAD_PERSON;
              while (Curr_Person<>Nil) do
                 begin
                      Label2.Caption:=Curr_Person^.FIO;
                      if GruppyList.IsSelected(Curr_Person^.Gruppa) then
                      if KategList.IsSelected(Curr_Person^.KATEGORIJA) then
                    //  if Curr_Person^.automatic=automatic_mode then
                      if get_dol_code(Curr_Person)<1500  then
                      if get_dol_code(Curr_Person)>9     then
                      if get_dol_code(Curr_Person)<>1455 then
                   //   if needOtpPerson(Curr_Person,7) then
                      if Curr_Person.wid_raboty=1 then
                      if GetOtpData(Curr_Person.TABNO,summa,summahelp) then
                         begin
                              CalculateOtpPerson(Curr_Person,NeedPut,WantedMonth,Summa,SummaHelp);
                         end;
                      Application.ProcessMessages;
                      Curr_Person:=Curr_Person^.Next;
                 end;
              i_c_2:=Count_Person;
              if NeedPut then
                 PutInf;
              LDEL_PERSON;


         end;
     NSRV := NSRVTmp;
     NMES := NMESTmp;
     MKFLNM;
     GetInf(True);
     CalculateOtp:=RetVal;
end;

procedure TFormMkOtp14_10.BitBtn4Click(Sender: TObject);
 var RetVal : Integer;
     WantedShifr:Integer;
begin
     if not ((NMES=10) and (WORK_YEAR_VAL=2014)) then
        begin
             ShowMessage('Можно запустить только в октябре 2014 г.');
             Exit;
        end;
     if (NameServList.CountSelected<1) then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;
     if not YesNo('Додать.отпускные за  июль-август 2014 ?') then Exit;
     WantedShifr := 0;
     if FillList(8) then
        RetVal:=CalculateOtp(8);
     if FillList(7) then
        RetVal:=CalculateOtp(7);
     if RetVal>0 then
        ShowMessage('Насчитано '+IntToStr(RetVal)+' отпускных.');
     Close;

end;


function  TFormMkOtp14_10.needOtpPerson(Curr_Person:Person_Ptr;wantedM:integer):boolean;
 var retVal:Boolean;
     SQLStmnt:string;
     v:Variant;
     i:integer;
     curr_Add:ADD_PTR;
     finded:boolean;
 begin
      retVal:=false;
      curr_Add:=Curr_Person^.ADD;
      finded:=false;
      while (curr_Add<>Nil) do
         begin
              if (curr_Add.Shifr=holiday_Flow_Shifr) then
                 begin
                      finded:=true;
                      Break;
                 end;
              curr_Add:=curr_Add.NEXT;
         end;
      if not finded then
         begin
             SQLStmnt:='select count(*) from fadd f where f.tabno='+IntToStr(Curr_Person^.Tabno)+' and f.shifrsta in (5,6) and f.year_za=2014 and f.month_za='+intToStr(wantedM);
   //          SQLStmnt:='select count(*) from fadd f where f.tabno='+IntToStr(Curr_Person^.Tabno)+' and f.shifrsta in (5,6) and f.year_za=2014';
             v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
             if VarIsNumeric(v) then
                begin
                     i:=v;
                     if i=0 then
                        retVal:=True;
                end;
         end;
      needOtpPerson:=retVal;
 end;



procedure TFormMkOtp14_10.BitBtn1Click(Sender: TObject);
begin
     if not ((NMES=10) and (WORK_YEAR_VAL=2014)) then
        begin
             ShowMessage('Можно запустить только в октябре 2014 г.');
             Exit;
        end;
     if (NameServList.CountSelected<1) then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;
     if not YesNo('Удалить старые расчеты, сделанные машиной?') then Exit;
     DeleteOldRas;
     DeleteEmptyPerson;

end;
procedure TFormMkOtp14_10.DeleteOldRas;
 var I_Podr,Cnt:Integer;
     NSRVTmp,NMESTmp:Integer;
     RetVal :Integer;
     NeedPut:Boolean;
     Curr_Person:PERSON_PTR;
     I_C_1,I_C_2:Integer;
     Curr_Add:ADD_PTR;
     Curr_Ud:UD_PTR;
     WantedP:Integer;
     Done:boolean;
begin
     if NameServList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;

     NSRVTmp := NSRV;
     NMESTmp := NMES;
     PutInf;
     LDEL_PERSON;
     ProgressBar1.Max      := Count_Serv;
     ProgressBar1.Min      := 0;
     ProgressBar1.Position := 0;
     Label1.Caption:='';
     Label2.Caption:='';
     Cnt           := 0;
     for i_podr:=1 to Count_Serv do
         begin
              Inc(Cnt);
              ProgressBar1.Position:=Cnt;
              Label1.Caption:=Name_Serv(I_Podr);
              Application.ProcessMessages;
              if not NameServList.IsSelected(I_podr) then Continue;
              NSRV:=I_Podr;
              MKFLNM;
              if not FileExists(FNINF) then Continue;
              GetInf(true);
              i_c_1:=Count_Person;
              NeedPut:=False;
              Curr_Person:=HEAD_PERSON;
              while (Curr_Person<>Nil) do
                 begin
                      Label2.Caption:=Curr_Person^.FIO;
                      Application.ProcessMessages;
                      repeat
                            WantedP:=0;
                            Curr_Add:=Curr_Person^.ADD;
                            while (Curr_Add<>Nil) do
                               begin
                                   if (
                                       ((Curr_Add.shifr=HOLIDAY_FLOW_SHIFR) or
                                        (Curr_Add.shifr=PerersZaProshlPeriody) or
                                        (Curr_Add.shifr=20)
                                       ) and
                                        (Curr_Add.who=14) and
                                       ((Curr_Add.PERIOD=7) or (Curr_Add.PERIOD=8))
                                      ) then
                                      begin
                                           WantedP:=Curr_Add.PERIOD;
                                           DEL_ADD(Curr_Add,Curr_Person);
                                           NeedPut:=True;
                                           Break;
                                      end;
                                    Curr_Add:=Curr_Add.NEXT;
                               end;
                            if WantedP>0 then
                            repeat
                                 done:=True;
                                 Curr_Ud:=Curr_Person^.UD;
                                 while (Curr_Ud<>Nil) do
                                    begin
                                         if Curr_Ud.PERIOD=WantedP then
                                           begin
                                                done:=False;
                                                DEL_UD(Curr_Ud,Curr_Person);
                                                NeedPut:=True;
                                                Break;
                                           end;
                                         Curr_Ud:=Curr_Ud.NEXT;
                                    end;
                            until Done;
                      until wantedP=0;
                      Curr_Person:=Curr_Person^.Next;
                 end;
              i_c_2:=Count_Person;
              if NeedPut then
                 PutInf;
              LDEL_PERSON;


         end;
     NSRV := NSRVTmp;
     NMES := NMESTmp;
     MKFLNM;
     GetInf(True);
    
end;

procedure TFormMkOtp14_10.DeleteEmptyPerson;
 var I_Podr,Cnt:Integer;
     NSRVTmp,NMESTmp:Integer;
     RetVal :Integer;
     NeedPut:Boolean;
     Curr_Person:PERSON_PTR;
     I_C_1,I_C_2:Integer;
     Done:boolean;
begin
     if NameServList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;

     NSRVTmp := NSRV;
     NMESTmp := NMES;
     PutInf;
     LDEL_PERSON;
     ProgressBar1.Max      := Count_Serv;
     ProgressBar1.Min      := 0;
     ProgressBar1.Position := 0;
     Label1.Caption:='';
     Label2.Caption:='';
     Cnt           := 0;
     for i_podr:=1 to Count_Serv do
         begin
              Inc(Cnt);
              ProgressBar1.Position:=Cnt;
              Label1.Caption:=Name_Serv(I_Podr);
              Application.ProcessMessages;
              if not NameServList.IsSelected(I_podr) then Continue;
              NSRV:=I_Podr;
              MKFLNM;
              if not FileExists(FNINF) then Continue;
              GetInf(true);
              i_c_1:=Count_Person;
              NeedPut:=False;
              repeat
                    done:=True;
                    Curr_Person:=HEAD_PERSON;
                    while (Curr_Person<>Nil) do
                       begin
                            Label2.Caption:=Curr_Person^.FIO;
                            Application.ProcessMessages;
                            if GET_DOL_CODE(Curr_Person)=1530 then
                            if Curr_Person.gruppa=1 then
                               begin
                                    done:=False;
                                    DEL_Person(Curr_Person);
                                    NeedPut:=True;
                                    Break;
                               end;
                            Curr_Person:=Curr_Person^.Next;
                       end;
              until done;
              i_c_2:=Count_Person;
              if NeedPut then
                 PutInf;
              LDEL_PERSON;


         end;
     NSRV := NSRVTmp;
     NMES := NMESTmp;
     MKFLNM;
     GetInf(True);
    
end;

end.
